FROM python:3.4

# Set project application name and host address
ARG appname=app
ARG sitefqdn=localhost

# Install some OS basics
RUN apt-get update && apt-get install -y nano wget curl sudo && rm -rf /var/lib/apt/lists/*

# Set the working directory for a consistant experience
WORKDIR /django/project
VOLUME /django/project/media
VOLUME /django/project/static

# Install the Django requirements and defaults
COPY mods/config.ini .
COPY mods/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create the base for the site and application using the presets from the ini file
RUN djangocms --config-file config.ini -sp . ${appname}

# Add any other foundational/custom bits
COPY mods/. .
RUN python manage.py migrate

# Create/set the user to run Django Service as and fix ownership of the working dirctory
RUN useradd -u 1000 django && mkdir -p /django/project && chown -R django /django/project
USER django

# Add the sitefqdn to the allowed hosts list so that we can actually view the site.
RUN sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \[\"localhost\",\"${sitefqdn}\"\]/" ${appname}/settings.py

# Enable to port and run the Django service
EXPOSE 8000
CMD ["python","./manage.py","runserver","0.0.0.0:8000"]
