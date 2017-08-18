# djangobase
A starter project to bootstrap development with Docker and Django.

This project is not intended to be used as-is, but rather as a starter seed to grow 
your own project from.

## Getting Started
To begin, ensure that you already have Docker Engine installed and configured.  Please see 
[https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)
for more information on how to do that.  Ensure that you also perform the optional task 
necessary to allow your user account to execute the docker command directly without using 
`sudo`.

Also install Docker Compose using the 'pip' method described at 
[https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
to enable the rest of our deployment and development capability.

Next, clone this project to your development system and name it somethnig relevant to
your site-name, like so:

`git clone git@github.com:growlf/djangobase.git mysite`

Now `cd` into the directory (`mysite` in this example), and execute the following command 
to generate our files and folders:

`docker-compose -f docker-compose-build.yml up --build`

This command only needs to be done once, when you are first initializing the project, and 
it will take a few minutes as it installs components into your container and generates the
various files and folders necessary to run a Django web application.

Once it completes, you should be able to browse to the [http://localhost:8000](http://localhost:8000) 
URL (assuming that you are developing on your localhost system) and see the initial website login.  After 
verifying that the page comes up, simply `ctl-c` the commandline to terminate it, and then
run it the standard way, as follows:

`docker-compose up`

The site should now be visible as it was a moment ago, at [http://localhost:8000](http://localhost:8000)
and you can now begin editing the files for the site in your `mysite` folder to taste.