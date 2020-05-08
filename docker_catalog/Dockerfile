# Base Image
FROM python:3.8.2

LABEL maintainer="me@rolandthompson.co.uk"

RUN apt-get update && \
    apt-get install nano && \
    apt-get install dos2unix

# create directory
RUN mkdir -m 777 /project_live_code && \
    mkdir -m 777 /project_base_code && \
    mkdir -m 777 /scripts

# create volume
VOLUME /project_live_code

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1 && \
    DOCKER_BASE_URL http://192.168.8.21:4000/v2 && \
    DEBUG_ENABLED False

# Copy the current directory contents into the container at /docker_catalog_web
ADD . /project_base_code/

# removed the assets folder if it exists - we build a new version when the container is created
RUN rm -r /project_base_code/assets && \
    # Install any needed packages specified in requirements.txt
    pip install -r /project_base_code/requirements.txt

# expose our port
EXPOSE 8001/tcp

# copy script file  - This copies the initial files and keeps the process alive...
# copy our start script
RUN mv /project_base_code/start.sh /scripts/start.sh && \
    dos2unix /scripts/start.sh && chmod -v +x /scripts/start.sh

# Set the working directory to /docker_catalog_web
WORKDIR /project_live_code

CMD ["/scripts/start.sh"]
