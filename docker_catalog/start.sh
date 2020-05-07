#!/bin/bash
if [ "$(ls -A /project_live_code)" ]; then
    echo "Directory already initially cloned"
else
    echo "Running initial clone"
    cp -R /project_base_code/* /project_live_code
fi

python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000