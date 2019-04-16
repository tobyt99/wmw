# pull official base image
FROM python:alpine3.9

# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
RUN mkdir /wmw
WORKDIR /wmw

# copy requirements
COPY requirements.txt /wmw/

# install dependencies
RUN apk add build-base
RUN apk add mariadb-dev
RUN pip install -r requirements.txt --upgrade setuptools


# copy project
COPY . /wmw/

EXPOSE 8000

# docker stop $(docker ps -a -q)