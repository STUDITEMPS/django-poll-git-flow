FROM ubuntu:trusty
MAINTAINER STUDITEMPS

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq && \
    apt-get upgrade -yqq

ENV LANG="de_DE.UTF-8"

RUN apt-get install -yq python-pip \
                        python-dev

RUN apt-get install -yq phantomjs

ADD requirements.txt requirements.txt
ADD . /app

# RUN pip install --trusted-host docker2.intranet.studitemps.de -r /kiss/requirements.txt 
RUN pip install -r requirements.txt 

EXPOSE 8888

WORKDIR /app

CMD python manage.py runserver 0.0.0.0:8888
