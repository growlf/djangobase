# djangobase

Djangobase is starter project to speed development with Docker and Django.

This project is not complete as-is; instead, it's a starting place for your own web 
application project.  

## Intended Audience

Beginning developers with a basic understanding of networking, operating systems, and  
the python language...and who wish to create a deployable, reliable web application.

A more detailed version of this tutorial will be available soon.  Stay tuned.

## Getting Started
To begin, verify that:

- The [Docker Engine](https://docs.docker.com/engine/installation/) is installed and 
properly configured.

- You've performed the _optional task_ that allows your user account to execute the 
`docker` command without root access (that is, without using `sudo`).  (Details are 
provided on the Docker installation page.) 

Next, uses the `pip` command to install [Docker Compose](https://docs.docker.com/compose/install/) 
to enable development and deployment capabilities.

Finally, clone this project to your development system and name it something relevant to
your site-name:

> `git clone git@github.com:growlf/djangobase.git mysite`

To start the server for the first time, `cd` to your cloned project directory (`mysite` in this 
example) and use the following command to generate required files and folders:

> `docker-compose -f docker-compose-build.yml up --build`

This needs to be done just once (when first initializing the project); it installs 
required components into your container and generates supporting various files and folders
required by a Django web application.

When finished, browse [http://localhost:8000](http://localhost:8000) (assuming you're developing on 
a local system) to open the initial website login.  After verifying that the 
page is available, press `ctrl-c` in the terminal to terminate the command.

To run the app normally: 

> `docker-compose up`

The site should now be available at [http://localhost:8000](http://localhost:8000)
and you can now begin editing the files in your `mysite` folder.

The default username is `admin` and the defalt password is `admin`.  Change these before 
public publication, preferably sooner rather than later. 

## What next?
At this point, you'll want to:

- Add templates to define the user interface/theme.
- Add object models to manage app data
- Create admininistration features
- And, eventually, add some genuine content to the site.

For help on these and related tasks, see:  

*  [https://docs.djangoproject.com/en/1.11/intro/tutorial01/](https://docs.djangoproject.com/en/1.11/intro/tutorial01/)
*  [https://djangobook.com/](https://djangobook.com/)
*  [http://docs.django-cms.org/](http://docs.django-cms.org/)

### Baking It In
When your project is ready, you'll want to _deploy_ it.  To do so:

1) Create a database container to provide robust back-end storage and connect the project to it.

2) `Unlink` the local volume mappings for the project files and then copy them into the 
container for consistent and reliable deployment to your swarm or other dynamic hosting environments.

3) Publish the application to a Docker registry.

4) Determine a hosting environment to deploy your application for public access.

These, and many more steps, will be detailed in future project tutorials.

## Contact Us
For help or to provide feedback on this tutorial, please feel free to join our [Discord](https://discord.gg/ADkJc3z) server!

(We also consider well-meaning contributions file via pull request.)
