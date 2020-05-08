# importing the requests library 
import requests 
from django.conf import settings
from .models import repository
  
# api-endpoint 
queryCatalogUrl = settings.DOCKER_API_BASE_URL + '/_catalog'

def get_catalog():
    # sending get request and saving the response as response object 
    r = requests.get(url = queryCatalogUrl) 
    # extracting data in json format 
    data = r.json() 

    # create our list
    repos = []

    for r in data['repositories']:
        repo = repository(r)

        repos.append(repo)

    return repos
