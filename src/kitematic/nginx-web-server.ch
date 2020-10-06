%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
advisory: kitematic
description: Tutorial demonstrating the setup of an Nginx web server using Docker and Kitematic
keywords: docker, documentation, about, technology, kitematic, gui, nginx, tutorial
title: 'Kitematic tutorial: Serve a static website with NGINX'
---
@y
---
advisory: kitematic
description: Tutorial demonstrating the setup of an Nginx web server using Docker and Kitematic
keywords: docker, documentation, about, technology, kitematic, gui, nginx, tutorial
title: 'Kitematic tutorial: Serve a static website with NGINX'
---
@z

@x
This tutorial guides you through these steps:
@y
This tutorial guides you through these steps:
@z

@x
- Download and run a web server container
- Explore the container's website data natively on your Mac
- Use volumes to modify the website data
@y
- Download and run a web server container
- Explore the container's website data natively on your Mac
- Use volumes to modify the website data
@z

@x
This example website serves the popular 2048 game. Let's get to it!
@y
This example website serves the popular 2048 game. Let's get to it!
@z

@x
![2048 game](images/nginx-2048.png)
@y
![2048 game](images/nginx-2048.png)
@z

@x
#### Run the Nginx web server container
@y
#### Run the Nginx web server container
@z

@x
First, if you haven't yet done so, [download and start Kitematic](index.md).
Once installed and running, the app should look like this:
@y
First, if you haven't yet done so, [download and start Kitematic](index.md).
Once installed and running, the app should look like this:
@z

@x
![Nginx create](images/nginx-create.png)
@y
![Nginx create](images/nginx-create.png)
@z

@x
Click on the _Create_ button of the `hello-world-nginx` listing as shown above.
Kitematic pulls and runs a tiny Nginx web server in a Docker container, allowing
it to serve website data to your Mac.
@y
Click on the _Create_ button of the `hello-world-nginx` listing as shown above.
Kitematic pulls and runs a tiny Nginx web server in a Docker container, allowing
it to serve website data to your Mac.
@z

@x
![download Nginx hello world](images/nginx-hello-world.png)
@y
![download Nginx hello world](images/nginx-hello-world.png)
@z

@x
Once it's done downloading you should see a quick preview of the example website
that comes with the container, as shown below. Click on the preview to see the
result in your own browser.
@y
Once it's done downloading you should see a quick preview of the example website
that comes with the container, as shown below. Click on the preview to see the
result in your own browser.
@z

@x
![Nginx preview](images/nginx-preview.png)
@y
![Nginx preview](images/nginx-preview.png)
@z

@x
**What just happened?** Kitematic downloaded the `kitematic/hello-world-nginx`
image from the Docker Hub and then created and ran a Docker Nginx container from
this image.
@y
**What just happened?** Kitematic downloaded the `kitematic/hello-world-nginx`
image from the Docker Hub and then created and ran a Docker Nginx container from
this image.
@z

@x
#### View the website data in Finder
@y
#### View the website data in Finder
@z

@x
This container exposes website data via a _Docker volume_. Kitematic makes
managing Docker volumes easy - you can edit the data in Finder or with your
favorite text editor. By default, Kitematic places volumes under `~/Kitematic`
but you can change this in the container settings. To access the files via
finder, click on the in-app folder icon for a container and "Enable all volumes
to edit via Finder":
@y
This container exposes website data via a _Docker volume_. Kitematic makes
managing Docker volumes easy - you can edit the data in Finder or with your
favorite text editor. By default, Kitematic places volumes under `~/Kitematic`
but you can change this in the container settings. To access the files via
finder, click on the in-app folder icon for a container and "Enable all volumes
to edit via Finder":
@z

@x
![Nginx data volume](images/nginx-data-volume.png)
@y
![Nginx data volume](images/nginx-data-volume.png)
@z

@x
A Finder window of the folder should open containing the index.html file we see
being served by the container.
@y
A Finder window of the folder should open containing the index.html file we see
being served by the container.
@z

@x
![Nginx data folder](images/nginx-data-folder.png)
@y
![Nginx data folder](images/nginx-data-folder.png)
@z

@x
#### Serve your own website data
@y
#### Serve your own website data
@z

@x
Now let's try serving a more interesting website. [Download the zipped
files](https://github.com/gabrielecirulli/2048/archive/master.zip) for 2048, a
popular (and addictive) web-based tile game. Extract this zip file into the
folder you just opened:
@y
Now let's try serving a more interesting website. [Download the zipped
files](https://github.com/gabrielecirulli/2048/archive/master.zip) for 2048, a
popular (and addictive) web-based tile game. Extract this zip file into the
folder you just opened:
@z

@x
![Website files for 2048](images/nginx-2048-files.png)
@y
![Website files for 2048](images/nginx-2048-files.png)
@z

@x
Switch back to Kitematic and restart the container by clicking the "Restart"
button as shown below. Your Nginx container should now be serving 2048.
@y
Switch back to Kitematic and restart the container by clicking the "Restart"
button as shown below. Your Nginx container should now be serving 2048.
@z

@x
![Nginx running 2048](images/nginx-serving-2048.png)
@y
![Nginx running 2048](images/nginx-serving-2048.png)
@z

@x
**What just happened?**
@y
**What just happened?**
@z

@x
Kitematic can map Docker container volumes to directories on your
Mac. In this case you changed the container's volume data via the Finder to
serve a website we downloaded.
@y
Kitematic can map Docker container volumes to directories on your
Mac. In this case you changed the container's volume data via the Finder to
serve a website we downloaded.
@z

@x
## Next steps
@y
## Next steps
@z

@x
For an example using Kitematic to run a Local RethinkDB database, take a look at
the [RethinkDB development Database](./rethinkdb-dev-database.md) example.
@y
For an example using Kitematic to run a Local RethinkDB database, take a look at
the [RethinkDB development Database](./rethinkdb-dev-database.md) example.
@z
