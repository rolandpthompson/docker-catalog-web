#from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
from .docker_api_calls import get_catalog

# Create your views here.
def index(request):

    # get the catalog information
    repos = get_catalog()
    context = {
        'repositories' : repos
    }

    return render(request, 'index.html', context=context)