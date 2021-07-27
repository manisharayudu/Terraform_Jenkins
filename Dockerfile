FROM python:latest

LABEL maitainer="manisharayudu127@gmail.com"

ADD my_script.py /

CMD [ "python", "./my_script.py" ]
