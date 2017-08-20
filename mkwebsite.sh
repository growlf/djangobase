#!/usr/bin/env bash

# create the folders and application data
djangocms -sfp . mysite

# Edit the settings.py file, add 'localhost' to the allowed hosts like so:
#   ALLOWED_HOSTS = ['localhost']
sed -i 's/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \["localhost"\]/' mysite/settings.py

# Test
python manage.py runserver 0.0.0.0:8000
