#!/bin/bash
if [ "$(ls -p /project_live_code | grep -v /)" ]; then
    echo "Directory already initially cloned"
else
    echo "Running initial clone"
    cp -R /project_base_code/* /project_live_code
    mkdir -m 777 /project_live_code/logs
fi

# collect the static files
python3 manage.py collectstatic --noinput
python3 manage.py migrate 

# use the default django server - testing only
#python3 manage.py runserver 0.0.0.0:8001

# start Nginx
nginx

# Run the Gunicorn process
gunicorn docker-catalog.wsgi --bind=0.0.0.0:8001 --workers=1