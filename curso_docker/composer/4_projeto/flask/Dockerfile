FROM python:3

RUN apt-get update -y 
RUN apt-get install -y python3-pip 
RUN apt-get install -y python3-dev

WORKDIR /app

RUN pip install Flask
RUN pip install flask_mysqldb
RUN pip install requests

COPY . . 

EXPOSE 5000

CMD [ "python","./app.py" ] 


# docker build -t flaskapinetwork .
# docker run -d -p 5000:5000 --name flaskhost_container --rm --network flasknetwork flaskapinetwork