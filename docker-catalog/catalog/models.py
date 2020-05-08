from django.db import models

# Create your models here.
class repository():
    
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return self.name