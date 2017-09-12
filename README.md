# djangobase

## Intended Audience
Beginning developers who have a basic understanding of networking, operating systems 
and the python language, and who wish to create a deployable, reliable web application.

A more complete and introductory version of this brief tutorial will be available soon.

## Purpose
A starter project to bootstrap development with Docker and Django-CMS.

This project is not intended to be used as-is, but rather as a starter base-line for 
your own web application project.

## Getting Started
To begin, ensure that you already have Docker Engine installed and configured.  Please see 
[https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)
for more information on how to do that.  Also ensure that you perform the 'optional task' 
necessary to allow your user account to execute the docker command directly without using 
`sudo` (this is detailed in the same instructions, further down the page).

Install 'Docker Compose' - using the instructions described at /itzg/dockerfiles/tree/master/minecraft-server
[https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
to enable the rest of our deployment and development capability.

Finally, clone this project to your development system and name it something relevant to
your site-name, like so:

    git clone https://github.com/growlf/djangobase.git mysite
   
Change `mysite` to what ever you wish - just make sure all other commands that reference this value 
also match.

To start the server for the first time, `cd` into the directory (```mysite``` in this 
example), and edit the ```djangoproject:build:args:appname```, ```sitefqdn``` in this file to taste, and 
also the ```config.ini``` and `requirement.txt` files as needed.  Next, execute the following command 
to generate the initial required files and folders:

    docker-compose up --build

This command only needs to be done once (when you are first initializing the project) and 
it will take a few minutes as it installs components into your container and generates the
various files and folders necessary to run a Django web application.

Wait until you see the "Attaching to ..." message before stopping the command with CTL-C
You can log into the site using the ```admin``` user and password ```admin``` by opening a browser to either the sitefqdn,
or `localhost` on port 8000 if you are running this on the local machine.

## DEVELOPMENT CYCLE

Copy the generated code from the container into the local filesystem to make editing easier

    docker cp djangosite:/django/project ./

Re-run the container using the local filesystem copy of the code. Edit files, add artifacts, etc - and then test
with the following:

    docker-compose run --rm --name devsite -v ${PWD}/project:/django/project -v media:/django/project/media -v static:/django/project/static -p 8000:8000 djangoproject

This will use the local filesystem copy of the Django site.  Stop the server with CTL-C at anytime, the container
will automatically delete, but the project directory will remain on the local filesystem. You should be able to browse 
to the URL - [http://localhost:8000](http://localhost:8000) URL (assuming that you are developing on your localhost 
system) - and see the initial website login.  After verifying that the page comes up.  Simply press ```ctrl-c``` in the 
terminal to terminate the command, and then
run it the standard way, as follows:

    docker-compose up

The site should now be visible as it was a moment ago, at [http://localhost:8000](http://localhost:8000)
and you can now begin editing the files for the site in your ```mysite``` folder to taste.

You can log into your initial site with the default user name ```admin``` and password ```admin``` 
(you should, of course, change this before publishing your site to the internet but it is 
fine to use this username/password as-is during development).

## What next?
At this point you will want to add some templates to create your own UI-theme, add some 
object-models, admin UI bits, etc - and eventually, create some content as well.  However, 
this tutorial will not go into detail on that, and instead will refer you to the awesome 
documentation at the following locations (for now):

*  [https://docs.djangoproject.com/en/1.11/intro/tutorial01/](https://docs.djangoproject.com/en/1.11/intro/tutorial01/)
*  [https://djangobook.com/](https://djangobook.com/)
*  [http://docs.django-cms.org/](http://docs.django-cms.org/)

### DEPLOYMENT PROCESS - Baking It In

After your project is set up the way you want it , you will want to make the application 'deployable'.  We will need to 
copy the site back into the virtual volume so that it can be deployed as a replicable component.  To do this, bring up 
the default container and then copy the code back into it likes so:

    docker-compose up -d
    docker cp project djangosite:/var/django/


Additional steps should be:
1) Use MySQL  (or other comercial grade back-end)with Django before go-live
2) Create and publish the application image to a Docker registry
3) Determine a hosting environment to deploy your application
4) Use NGiNX (or other proxy service) in front of the site making the site production ready ( also remove DEBUG entry etc)

These remaining steps, and many more, will be detailed in other project tutorials at a later date.

## Contact Us
If you require further assistance, or wish to discuss suggestions pertaining to additions or changes to this tutorial, 
please feel free to join our [Discord](https://discord.gg/ADkJc3z) server! 
