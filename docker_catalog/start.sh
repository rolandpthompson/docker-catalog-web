#!/bin/bash
if [ "$(ls -A /project_live_code)" ]; then
    echo "Directory already initially cloned"
else
    echo "Running initial clone"
    cp -R /project_base_code/* /project_live_code
fi

# collect the static files
python3 manane.py collectstatic --noinput
python3 manage.py migrate 

# use the default django server - testing only
#python3 manage.py runserver 0.0.0.0:8001

# Run the Gunicorn process
gunicorn docker_catalog.wsgi --bind=0.0.0.0:8001 --workers=3