FROM ubuntu:latest

LABEL maitainer="manisharayudu127@gmail.com"

RUN  apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y

EXPOSE 90

CMD [ "nginx", "-g", "daemon off;"]
