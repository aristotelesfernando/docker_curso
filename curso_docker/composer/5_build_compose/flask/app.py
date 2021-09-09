import flask
from flask import request, json, jsonify
import requests
import flask_mysqldb
from flask_mysqldb import MySQL

app = flask.Flask(__name__)
app.config["Debug"] = True

# host.docker.internal se fosse conectar com um mysql no host do docker
app.config["MYSQL_HOST"] = "db"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_DB"] = "flaskhost_db"

mysql = MySQL(app)


@app.route("/", methods=["GET"])
def index():
    data = requests.get('https://randomuser.me/api')
    return data.json()


@app.route("/inserthost", methods=['POST'])
def inserthost():
    data = requests.get('https://randomuser.me/api').json()
    username = data['results'][0]['name']['first']
    cur = mysql.connection.cursor()
    cur.execute("""insert into users(name) values(%s)""", (username,))
    mysql.connection.commit()
    cur.close()

    return f"Usuario inserido: {username}"


@app.route("/getnames", methods=["GET"])
def getnames():
    cur = mysql.connection.cursor()
    cur.execute("select * from users")

    usuarios = cur.fetchall()
    usuarios = json.dumps(usuarios)
    mysql.connection.commit()
    cur.close()

    return usuarios


if __name__ == "__main__":
    app.run(host='0.0.0.0', port="5000", debug=True)
