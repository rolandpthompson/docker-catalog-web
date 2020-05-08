# Base Image
FROM python:3.8.2

LABEL maintainer="me@rolandthompson.co.uk"

RUN apt-get update && \
    apt-get install nano && \
    apt-get install dos2unix && \
    apt-get install -y nginx

# create directory
RUN mkdir -m 777 /project_live_code && \
    mkdir -m 777 /project_base_code && \
    mkdir -m 777 /scripts

# create volume
VOLUME /project_live_code

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
ENV DOCKER_BASE_URL http://192.168.8.21:4000/v2
ENV DEBUG_ENABLED False

# Copy the current directory contents into the container at /docker_catalog_web
ADD . /project_base_code/

# removed the assets folder if it exists - we build a new version when the container is created
RUN rm -r /project_base_code/assets && \
    # Install any needed packages specified in requirements.txt
    pip install -r /project_base_code/requirements.txt

# move our nginx conf file
RUN mv /project_base_code/nginx.conf /etc/nginx/sites-enabled/docker-catalog-web

# expose our port (nginx - gunicorn will run internally on 8001)
EXPOSE 8000/tcp

# copy script file  - This copies the initial files and keeps the process alive...
# copy our start script
RUN mv /project_base_code/start.sh /scripts/start.sh && \
    dos2unix /scripts/start.sh && chmod -v +x /scripts/start.sh

# delete files
RUN rm /project_base_code/requirements.txt

# Set the working directory to /docker_catalog_web
WORKDIR /project_live_code

CMD ["/scripts/start.sh"]
