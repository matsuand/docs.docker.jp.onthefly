%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Run your image as a container"
keywords: get started, go, golang, run, container
description: Learn how to run the image as a container.
redirect_from:
- /get-started/golang/run-containers/
---
@y
---
title: "Run your image as a container"
keywords: get started, go, golang, run, container
description: Learn how to run the image as a container.
redirect_from:
- /get-started/golang/run-containers/
---
@z

@x
{% include_relative nav.html selected="2" %}
@y
{% include_relative nav.html selected="2" %}
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Work through the steps to dockerize a Go application in [Build your Go image](build-images.md).
@y
Work through the steps to dockerize a Go application in [Build your Go image](build-images.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In the previous module we created a `Dockerfile` for our example application and then we created our Docker image using the command `docker build`. Now that we have the image, we can run that image and see if our application is running correctly.
@y
In the previous module we created a `Dockerfile` for our example application and then we created our Docker image using the command `docker build`. Now that we have the image, we can run that image and see if our application is running correctly.
@z

@x
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separate from the host.
@y
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separate from the host.
@z

@x
To run an image inside of a container, we use the `docker run` command. It requires one parameter and that is the image name. Let’s start our image and make sure it is running correctly. Execute the following command in your terminal.
@y
To run an image inside of a container, we use the `docker run` command. It requires one parameter and that is the image name. Let’s start our image and make sure it is running correctly. Execute the following command in your terminal.
@z

@x
```shell
$ docker run docker-gs-ping
```
@y
```shell
$ docker run docker-gs-ping
```
@z

@x
```
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.2.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@y
```
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.2.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@z

@x
When you run this command, you’ll notice that you were not returned to the command prompt. This is because our application is a REST server and will run in a loop waiting for incoming requests without return control back to the OS until we stop the container.
@y
When you run this command, you’ll notice that you were not returned to the command prompt. This is because our application is a REST server and will run in a loop waiting for incoming requests without return control back to the OS until we stop the container.
@z

@x
Let’s make a GET request to the server using the curl command.
@y
Let’s make a GET request to the server using the curl command.
@z

@x
```shell
$ curl http://localhost:8080/
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@y
```shell
$ curl http://localhost:8080/
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@z

@x
Our curl command failed because the connection to our server was refused. Meaning that we were not able to connect to localhost on port 8080. This is expected because our container is run in isolation which includes networking. Let’s stop the container and restart with port 8080 published on our local network.
@y
Our curl command failed because the connection to our server was refused. Meaning that we were not able to connect to localhost on port 8080. This is expected because our container is run in isolation which includes networking. Let’s stop the container and restart with port 8080 published on our local network.
@z

@x
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@y
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@z

@x
To publish a port for our container, we’ll use the `--publish` flag (`-p` for short) on the docker run command. The format of the `--publish` command is `[host_port]:[container_port]`. So if we wanted to expose port `8080` inside the container to port `3000` outside the container, we would pass `3000:8080` to the `--publish` flag.
@y
To publish a port for our container, we’ll use the `--publish` flag (`-p` for short) on the docker run command. The format of the `--publish` command is `[host_port]:[container_port]`. So if we wanted to expose port `8080` inside the container to port `3000` outside the container, we would pass `3000:8080` to the `--publish` flag.
@z

@x
Start the container and expose port `8080` to port `8080` on the host.
@y
Start the container and expose port `8080` to port `8080` on the host.
@z

@x
```shell
$ docker run --publish 8080:8080 docker-gs-ping
```
@y
```shell
$ docker run --publish 8080:8080 docker-gs-ping
```
@z

@x
Now let’s rerun the curl command from above.
@y
Now let’s rerun the curl command from above.
@z

@x
```shell
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```shell
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
Success! We were able to connect to the application running inside of our container on port 8000. Switch back to the terminal where your container is running and you should see the `GET` request logged to the console.
@y
Success! We were able to connect to the application running inside of our container on port 8000. Switch back to the terminal where your container is running and you should see the `GET` request logged to the console.
@z

@x
Press **ctrl-c** to stop the container.
@y
Press **ctrl-c** to stop the container.
@z

@x
## Run in detached mode
@y
## Run in detached mode
@z

@x
This is great so far, but our sample application is a web server and we should not have to have our terminal connected to the container. Docker can run your container in detached mode, that is in the background. To do this, we can use the `--detach` or `-d` for short. Docker will start your container the same as before but this time will “detach” from the container and return you to the terminal prompt.
@y
This is great so far, but our sample application is a web server and we should not have to have our terminal connected to the container. Docker can run your container in detached mode, that is in the background. To do this, we can use the `--detach` or `-d` for short. Docker will start your container the same as before but this time will “detach” from the container and return you to the terminal prompt.
@z

@x
```shell
$ docker run -d -p 8080:8080 docker-gs-ping
d75e61fcad1e0c0eca69a3f767be6ba28a66625ce4dc42201a8a323e8313c14e
```
@y
```shell
$ docker run -d -p 8080:8080 docker-gs-ping
d75e61fcad1e0c0eca69a3f767be6ba28a66625ce4dc42201a8a323e8313c14e
```
@z

@x
Docker started our container in the background and printed the container ID on the terminal.
@y
Docker started our container in the background and printed the container ID on the terminal.
@z

@x
Again, let’s make sure that our container is running properly. Run the same `curl` command:
@y
Again, let’s make sure that our container is running properly. Run the same `curl` command:
@z

@x
```shell
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```shell
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
## List containers
@y
## List containers
@z

@x
Since we ran our container in the background, how do we know if our container is running or what other containers are running on our machine? Well, we can run the `docker ps` command. Just like on Linux, to see a list of processes on your machine we would run the `ps` command. In the same spirit, we can run the `docker ps` command which will show us a list of containers running on our machine.
@y
Since we ran our container in the background, how do we know if our container is running or what other containers are running on our machine? Well, we can run the `docker ps` command. Just like on Linux, to see a list of processes on your machine we would run the `ps` command. In the same spirit, we can run the `docker ps` command which will show us a list of containers running on our machine.
@z

@x
```shell
$ docker ps
```
@y
```shell
$ docker ps
```
@z

@x
```
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
```
@y
```
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
```
@z

@x
The `ps` command tells a bunch of stuff about our running containers. We can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that are exposed, and the name of the container.
@y
The `ps` command tells a bunch of stuff about our running containers. We can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that are exposed, and the name of the container.
@z

@x
You are probably wondering where the name of our container is coming from. Since we didn’t provide a name for the container when we started it, Docker generated a random name. We’ll fix this in a minute but first we need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. You will need to pass the name of the container or you can use the container ID.
@y
You are probably wondering where the name of our container is coming from. Since we didn’t provide a name for the container when we started it, Docker generated a random name. We’ll fix this in a minute but first we need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. You will need to pass the name of the container or you can use the container ID.
@z

@x
```shell
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@y
```shell
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@z

@x
Now rerun the `docker ps` command to see a list of running containers.
@y
Now rerun the `docker ps` command to see a list of running containers.
@z

@x
```shell
$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@y
```shell
$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@z

@x
## Stop, start, and name containers
@y
## Stop, start, and name containers
@z

@x
Docker containers can be started, stopped and restarted. When we stop a container, it is not removed but the status is changed to stopped and the process inside of the container is stopped. When we ran the `docker ps` command, the default output is to only show running containers. If we pass the `--all` or `-a` for short, we will see all containers on our system, that is stopped containers and running containers.
@y
Docker containers can be started, stopped and restarted. When we stop a container, it is not removed but the status is changed to stopped and the process inside of the container is stopped. When we ran the `docker ps` command, the default output is to only show running containers. If we pass the `--all` or `-a` for short, we will see all containers on our system, that is stopped containers and running containers.
@z

@x
```shell
$ docker ps -a
```
@y
```shell
$ docker ps -a
```
@z

@x
```
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                      PORTS     NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        About a minute ago   Exited (2) 23 seconds ago             inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 2 minutes ago              wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 3 minutes ago              magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        9 minutes ago        Exited (2) 3 minutes ago              gifted_mestorf
```
@y
```
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                      PORTS     NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        About a minute ago   Exited (2) 23 seconds ago             inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 2 minutes ago              wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 3 minutes ago              magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        9 minutes ago        Exited (2) 3 minutes ago              gifted_mestorf
```
@z

@x
If you’ve been following along, you should see several containers listed. These are containers that we started and stopped but have not removed yet.
@y
If you’ve been following along, you should see several containers listed. These are containers that we started and stopped but have not removed yet.
@z

@x
Let’s restart the container that we have just stopped. Locate the name of the container and replace the name of the container below in the restart command:
@y
Let’s restart the container that we have just stopped. Locate the name of the container and replace the name of the container below in the restart command:
@z

@x
```shell
$ docker restart inspiring_ishizaka
```
@y
```shell
$ docker restart inspiring_ishizaka
```
@z

@x
Now, list all the containers again using the `ps` command:
@y
Now, list all the containers again using the `ps` command:
@z

@x
```shell
$ docker ps --all
```
@y
```shell
$ docker ps --all
```
@z

@x
```
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                     PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        2 minutes ago    Up 5 seconds               0.0.0.0:8080->8080/tcp   inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 2 minutes ago                            wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 4 minutes ago                            magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        10 minutes ago   Exited (2) 4 minutes ago                            gifted_mestorf
```
@y
```
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                     PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        2 minutes ago    Up 5 seconds               0.0.0.0:8080->8080/tcp   inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 2 minutes ago                            wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 4 minutes ago                            magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        10 minutes ago   Exited (2) 4 minutes ago                            gifted_mestorf
```
@z

@x
Notice that the container we just restarted has been started in detached mode and has port `8080` exposed. Also, note that the status of the container is “Up X seconds”. When you restart a container, it will be started with the same flags or commands that it was originally started with.
@y
Notice that the container we just restarted has been started in detached mode and has port `8080` exposed. Also, note that the status of the container is “Up X seconds”. When you restart a container, it will be started with the same flags or commands that it was originally started with.
@z

@x
Let’s stop and remove all of our containers and take a look at fixing the random naming issue.
@y
Let’s stop and remove all of our containers and take a look at fixing the random naming issue.
@z

@x
Stop the container we just started. Find the name of your running container and replace the name in the command below with the name of the container on your system:
@y
Stop the container we just started. Find the name of your running container and replace the name in the command below with the name of the container on your system:
@z

@x
```shell
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@y
```shell
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@z

@x
Now that all of our containers are stopped, let’s remove them. When a container is removed, it is no longer running nor is it in the stopped state. Instead, the process inside the container is terminated and the metadata for the container is removed.
@y
Now that all of our containers are stopped, let’s remove them. When a container is removed, it is no longer running nor is it in the stopped state. Instead, the process inside the container is terminated and the metadata for the container is removed.
@z

@x
To remove a container, run the `docker rm` command passing the container name. You can pass multiple container names to the command in one command.
@y
To remove a container, run the `docker rm` command passing the container name. You can pass multiple container names to the command in one command.
@z

@x
Again, make sure you replace the containers names in the below command with the container names from your system:
@y
Again, make sure you replace the containers names in the below command with the container names from your system:
@z

@x
```shell
$ docker rm inspiring_ishizaka wizardly_joliot magical_carson gifted_mestorf
```
@y
```shell
$ docker rm inspiring_ishizaka wizardly_joliot magical_carson gifted_mestorf
```
@z

@x
```
inspiring_ishizaka
wizardly_joliot
magical_carson
gifted_mestorf
```
@y
```
inspiring_ishizaka
wizardly_joliot
magical_carson
gifted_mestorf
```
@z

@x
Run the `docker ps --all` command again to verify that all containers are gone.
@y
Run the `docker ps --all` command again to verify that all containers are gone.
@z

@x
Now let’s address the pesky random name issue. Standard practice is to name your containers for the simple reason that it is easier to identify what is running in the container and what application or service it is associated with. Just like good naming conventions for variables in your code makes it simpler to read. So goes naming your containers.
@y
Now let’s address the pesky random name issue. Standard practice is to name your containers for the simple reason that it is easier to identify what is running in the container and what application or service it is associated with. Just like good naming conventions for variables in your code makes it simpler to read. So goes naming your containers.
@z

@x
To name a container, we must pass the `--name` flag to the `run` command:
@y
To name a container, we must pass the `--name` flag to the `run` command:
@z

@x
```shell
$ docker run -d -p 8080:8080 --name rest-server docker-gs-ping
3bbc6a3102ea368c8b966e1878a5ea9b1fc61187afaac1276c41db22e4b7f48f
```
@y
```shell
$ docker run -d -p 8080:8080 --name rest-server docker-gs-ping
3bbc6a3102ea368c8b966e1878a5ea9b1fc61187afaac1276c41db22e4b7f48f
```
@z

@x
```shell
$ docker ps
```
@y
```shell
$ docker ps
```
@z

@x
```
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
3bbc6a3102ea   docker-gs-ping   "/docker-gs-ping"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->8080/tcp   rest-server
```
@y
```
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
3bbc6a3102ea   docker-gs-ping   "/docker-gs-ping"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->8080/tcp   rest-server
```
@z

@x
Now, we can easily identify our container based on the name.
@y
Now, we can easily identify our container based on the name.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, we learned how to run containers and publish ports. We also learned to manage the lifecycle of containers. We then discussed the importance of naming our containers so that they are more easily identifiable. In the next module, we’ll learn how to run a database in a container and connect it to our application. See:
@y
In this module, we learned how to run containers and publish ports. We also learned to manage the lifecycle of containers. We then discussed the importance of naming our containers so that they are more easily identifiable. In the next module, we’ll learn how to run a database in a container and connect it to our application. See:
@z

@x
[How to develop your application](develop.md){: .button .outline-btn}
@y
[How to develop your application](develop.md){: .button .outline-btn}
@z

@x
## Feedback
@y
## Feedback
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Golang %20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Golang %20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@z

@x
<br />
@y
<br />
@z
