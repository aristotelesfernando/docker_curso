import flask
from flask import request, json, jsonify
import requests

app = flask.Flask(__name__)
app.config["Debug"] = True


@app.route("/", methods=["GET"])
def index():
    data = requests.get('https://randomuser.me/api')
    return data.json()


if __name__ == "__main__":
    app.run(host='0.0.0.0', port="5000", debug=True)
