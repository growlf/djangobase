# djangobase

## Purpose
A starter project to bootstrap development with Docker and Django.

This project is not intended to be used as-is, but rather as a starter base-line for 
your own web application project.

## Intended Audience

Beginning developers who have a basic understanding of networking, operating systems 
and the python language, and who wish to create a deployable, reliable web application.

A more complete and introductory version of this brief tutorial will be available soon.

## Getting Started
To begin, ensure that you already have Docker Engine installed and configured.  Please see 
[https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)
for more information on how to do that.  Also ensure that you perform the 'optional task' 
necessary to allow your user account to execute the docker command directly without using 
`sudo` (this is detailed in the same instructions, further down the page).

Now, also install Docker Compose - using the 'pip' method described at 
[https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
to enable the rest of our deployment and development capability.

Finally, clone this project to your development system and name it something relevant to
your site-name, like so:

`git clone git@github.com:growlf/djangobase.git mysite`

To start the server for the first time, `cd` into the directory (`mysite` in this 
example), and execute the following command to generate required files and folders:

`docker-compose -f docker-compose-build.yml up --build`

This command only needs to be done once (when you are first initializing the project) and 
it will take a few minutes as it installs components into your container and generates the
various files and folders necessary to run a Django web application.

Once this command completes, you should be able to browse to the URL - 
[http://localhost:8000](http://localhost:8000) URL (assuming that you are developing on 
your localhost system) - and see the initial website login.  After verifying that the 
page comes up.  Simply press `ctrl-c` in the terminal to terminate the command, and then
run it the standard way, as follows:

`docker-compose up`

The site should now be visible as it was a moment ago, at [http://localhost:8000](http://localhost:8000)
and you can now begin editing the files for the site in your `mysite` folder to taste.

You can log into your initial site with the default user name `admin` and password `admin` 
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

### Baking It In
After your project is set up the way you want it , you will want to make the application 'deployable'.  
There are a few steps to accomplish this. Some of them will be:

1) Create a database container for more a robust backend storage, and connect the project to it
2) Unlink the local volume mapping for the project files and instead copy them into the 
container for consistent and reliable deployment to swarm or other dynamic hosting environments
3) Publish the application to a Docker registry
4) Determine a hosting environment to deploy your application for public access

These remaining steps, and many more, will be detailed in other project tutorials.

## Contact Us
If you require further assistance, or wish to discuss suggestions pertaining to additions or changes to this tutorial, 
please feel free to join our [Discord](https://discord.gg/ADkJc3z) server! 