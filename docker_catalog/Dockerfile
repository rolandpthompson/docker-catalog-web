# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.8.1

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

ENV DOCKER_BASE_URL http://192.168.8.21:4000/v2

# create root directory for our project in the container
RUN mkdir /docker_catalog_web

# Set the working directory to /docker_catalog_web
WORKDIR /docker_catalog_web

# Copy the current directory contents into the container at /docker_catalog_web
ADD . /docker_catalog_web/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt