%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Run your image as a container"
keywords: Java, run, image, container,
description: Learn how to run the image as a container.
---
@y
---
title: "Run your image as a container"
keywords: Java, run, image, container,
description: Learn how to run the image as a container.
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
Work through the steps to build a Java image in [Build your Java image](build-images.md).
@y
Work through the steps to build a Java image in [Build your Java image](build-images.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In the previous module, we created our sample application and then we created a Dockerfile that we used to build an image. We created our image using the command `docker build`. Now that we have an image, we can run that image and see if our application is running correctly.
@y
In the previous module, we created our sample application and then we created a Dockerfile that we used to build an image. We created our image using the command `docker build`. Now that we have an image, we can run that image and see if our application is running correctly.
@z

@x
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separated from the host.
@y
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separated from the host.
@z

@x
To run an image inside a container, we use the `docker run` command. The `docker run` command requires one parameter which is the name of the image. Let’s start our image and make sure it is running correctly. Run the following command in your terminal:
@y
To run an image inside a container, we use the `docker run` command. The `docker run` command requires one parameter which is the name of the image. Let’s start our image and make sure it is running correctly. Run the following command in your terminal:
@z

@x
```console
$ docker run java-docker
```
@y
```console
$ docker run java-docker
```
@z

@x
After running this command, you’ll notice that we did not to the command prompt. This is because our application is a REST server and runs in a loop waiting for incoming requests without returning control back to the OS until we stop the container.
@y
After running this command, you’ll notice that we did not to the command prompt. This is because our application is a REST server and runs in a loop waiting for incoming requests without returning control back to the OS until we stop the container.
@z

@x
Let’s open a new terminal then make a `GET` request to the server using the `curl` command.
@y
Let’s open a new terminal then make a `GET` request to the server using the `curl` command.
@z

@x
```console
$ curl --request GET \
--url http://localhost:8080/actuator/health \
--header 'content-type: application/json'
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@y
```console
$ curl --request GET \
--url http://localhost:8080/actuator/health \
--header 'content-type: application/json'
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@z

@x
As you can see, our `curl` command failed because the connection to our server was refused. This means, we were not able to connect to the localhost on port 8080. This is expected because our container is run in isolation which includes networking. Let’s stop the container and restart with port 8080 published on our local network.
@y
As you can see, our `curl` command failed because the connection to our server was refused. This means, we were not able to connect to the localhost on port 8080. This is expected because our container is run in isolation which includes networking. Let’s stop the container and restart with port 8080 published on our local network.
@z

@x
To stop the container, press `ctrl-c`. This will return you to the terminal prompt.
@y
To stop the container, press `ctrl-c`. This will return you to the terminal prompt.
@z

@x
To publish a port for our container, we’ll use the `--publish flag` (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host port]:[container port]`. So, if we wanted to expose port 8000 inside the container to port 8080 outside the container, we would pass `8080:8000` to the `--publish` flag.
@y
To publish a port for our container, we’ll use the `--publish flag` (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host port]:[container port]`. So, if we wanted to expose port 8000 inside the container to port 8080 outside the container, we would pass `8080:8000` to the `--publish` flag.
@z

@x
Start the container and expose port 8080 to port 8080 on the host.
@y
Start the container and expose port 8080 to port 8080 on the host.
@z

@x
```console
$ docker run --publish 8080:8080 java-docker
```
@y
```console
$ docker run --publish 8080:8080 java-docker
```
@z

@x
Now, let’s rerun the curl command from above.
@y
Now, let’s rerun the curl command from above.
@z

@x
```console
$ curl --request GET \
--url http://localhost:8080/actuator/health \
--header 'content-type: application/json'
{"status":"UP"}
```
@y
```console
$ curl --request GET \
--url http://localhost:8080/actuator/health \
--header 'content-type: application/json'
{"status":"UP"}
```
@z

@x
Success! We were able to connect to the application running inside of our container on port 8080.
@y
Success! We were able to connect to the application running inside of our container on port 8080.
@z

@x
Now, press ctrl-c to stop the container.
@y
Now, press ctrl-c to stop the container.
@z

@x
## Run in detached mode
@y
## Run in detached mode
@z

@x
This is great so far, but our sample application is a web server and we don't have to be connected to the container. Docker can run your container in detached mode or in the background. To do this, we can use the `--detach` or `-d` for short. Docker starts your container as earlier, but this time, it will “detach” from the container and return you to the terminal prompt.
@y
This is great so far, but our sample application is a web server and we don't have to be connected to the container. Docker can run your container in detached mode or in the background. To do this, we can use the `--detach` or `-d` for short. Docker starts your container as earlier, but this time, it will “detach” from the container and return you to the terminal prompt.
@z

@x
```console
$ docker run -d -p 8080:8080 java-docker
5ff83001608c7b787dbe3885277af018aaac738864d42c4fdf5547369f6ac752
```
@y
```console
$ docker run -d -p 8080:8080 java-docker
5ff83001608c7b787dbe3885277af018aaac738864d42c4fdf5547369f6ac752
```
@z

@x
Docker started our container in the background and printed the Container ID on the terminal.
@y
Docker started our container in the background and printed the Container ID on the terminal.
@z

@x
Again, let’s make sure that our container is running properly. Run the same curl command from above.
@y
Again, let’s make sure that our container is running properly. Run the same curl command from above.
@z

@x
```console
$ curl --request GET \
--url http://localhost:8080/actuator/health \
--header 'content-type: application/json'
{"status":"UP"}
```
@y
```console
$ curl --request GET \
--url http://localhost:8080/actuator/health \
--header 'content-type: application/json'
{"status":"UP"}
```
@z

@x
## List containers
@y
## List containers
@z

@x
As we ran our container in the background, how do we know if our container is running, or what other containers are running on our machine? Well, we can run the `docker ps` command. Just like how we run the `ps` command in Linux to see a list of processes on our machine, we can run the `docker ps` command to view a list of containers running on our machine.
@y
As we ran our container in the background, how do we know if our container is running, or what other containers are running on our machine? Well, we can run the `docker ps` command. Just like how we run the `ps` command in Linux to see a list of processes on our machine, we can run the `docker ps` command to view a list of containers running on our machine.
@z

@x
```console
$ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS              PORTS                    NAMES
5ff83001608c   java-docker      "./mvnw spring-boot:…"   About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp   trusting_beaver
```
@y
```console
$ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS              PORTS                    NAMES
5ff83001608c   java-docker      "./mvnw spring-boot:…"   About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp   trusting_beaver
```
@z

@x
The `docker ps` command provides a bunch of information about our running containers. We can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that exposed and the name of the container.
@y
The `docker ps` command provides a bunch of information about our running containers. We can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that exposed and the name of the container.
@z

@x
You are probably wondering where the name of our container is coming from. Since we didn’t provide a name for the container when we started it, Docker generated a random name. We’ll fix this in a minute, but first we need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. We need to pass the name of the container or we can use the container ID.
@y
You are probably wondering where the name of our container is coming from. Since we didn’t provide a name for the container when we started it, Docker generated a random name. We’ll fix this in a minute, but first we need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. We need to pass the name of the container or we can use the container ID.
@z

@x
```console
$ docker stop trusting_beaver
trusting_beaver
```
@y
```console
$ docker stop trusting_beaver
trusting_beaver
```
@z

@x
Now, rerun the `docker ps` command to see a list of running containers.
@y
Now, rerun the `docker ps` command to see a list of running containers.
@z

@x
```console
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
@y
```console
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
@z

@x
## Stop, start, and name containers
@y
## Stop, start, and name containers
@z

@x
You can start, stop, and restart Docker containers. When we stop a container, it is not removed, but the status is changed to stopped and the process inside the container is stopped. When we ran the `docker ps` command in the previous module, the default output only shows running containers. When we pass the `--all` or `-a` for short, we see all containers on our machine, irrespective of their start or stop status.
@y
You can start, stop, and restart Docker containers. When we stop a container, it is not removed, but the status is changed to stopped and the process inside the container is stopped. When we ran the `docker ps` command in the previous module, the default output only shows running containers. When we pass the `--all` or `-a` for short, we see all containers on our machine, irrespective of their start or stop status.
@z

@x
```console
$ docker ps -a
CONTAINER ID   IMAGE               COMMAND                  CREATED          STATUS                        PORTS                    NAMES
5ff83001608c   java-docker         "./mvnw spring-boot:…"   5 minutes ago    Exited (143) 18 seconds ago                            trusting_beaver
630f2872ddf5   java-docker         "./mvnw spring-boot:…"   11 minutes ago   Exited (1) 8 minutes ago                               modest_khayyam
a28f9d587d95   java-docker         "./mvnw spring-boot:…"   17 minutes ago   Exited (1) 11 minutes ago                              lucid_greider
```
@y
```console
$ docker ps -a
CONTAINER ID   IMAGE               COMMAND                  CREATED          STATUS                        PORTS                    NAMES
5ff83001608c   java-docker         "./mvnw spring-boot:…"   5 minutes ago    Exited (143) 18 seconds ago                            trusting_beaver
630f2872ddf5   java-docker         "./mvnw spring-boot:…"   11 minutes ago   Exited (1) 8 minutes ago                               modest_khayyam
a28f9d587d95   java-docker         "./mvnw spring-boot:…"   17 minutes ago   Exited (1) 11 minutes ago                              lucid_greider
```
@z

@x
You should now see several containers listed. These are containers that we started and stopped, but have not been removed.
@y
You should now see several containers listed. These are containers that we started and stopped, but have not been removed.
@z

@x
Let’s restart the container that we just stopped. Locate the name of the container we just stopped and replace the name of the container below using the `restart` command.
@y
Let’s restart the container that we just stopped. Locate the name of the container we just stopped and replace the name of the container below using the `restart` command.
@z

@x
```console
$ docker restart trusting_beaver
```
@y
```console
$ docker restart trusting_beaver
```
@z

@x
Now, list all the containers again using the `docker ps` command.
@y
Now, list all the containers again using the `docker ps` command.
@z

@x
```console
$ docker ps -a
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS                      PORTS                    NAMES
5ff83001608c   java-docker   "./mvnw spring-boot:…"   10 minutes ago   Up 2 seconds                0.0.0.0:8080->8080/tcp   trusting_beaver
630f2872ddf5   java-docker   "./mvnw spring-boot:…"   16 minutes ago   Exited (1) 13 minutes ago                            modest_khayyam
a28f9d587d95   java-docker   "./mvnw spring-boot:…"   22 minutes ago   Exited (1) 16 minutes ago                            lucid_greider
```
@y
```console
$ docker ps -a
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS                      PORTS                    NAMES
5ff83001608c   java-docker   "./mvnw spring-boot:…"   10 minutes ago   Up 2 seconds                0.0.0.0:8080->8080/tcp   trusting_beaver
630f2872ddf5   java-docker   "./mvnw spring-boot:…"   16 minutes ago   Exited (1) 13 minutes ago                            modest_khayyam
a28f9d587d95   java-docker   "./mvnw spring-boot:…"   22 minutes ago   Exited (1) 16 minutes ago                            lucid_greider
```
@z

@x
Notice that the container we just restarted has been started in detached mode and has port 8080 exposed. Also, observe the status of the container is “Up X seconds”. When you restart a container, it starts with the same flags or commands that it was originally started with.
@y
Notice that the container we just restarted has been started in detached mode and has port 8080 exposed. Also, observe the status of the container is “Up X seconds”. When you restart a container, it starts with the same flags or commands that it was originally started with.
@z

@x
Now, let’s stop and remove all of our containers and take a look at fixing the random naming issue. Find the name of your running container and replace the name in the command below with the name of the container on your system.
@y
Now, let’s stop and remove all of our containers and take a look at fixing the random naming issue. Find the name of your running container and replace the name in the command below with the name of the container on your system.
@z

@x
```console
$ docker stop trusting_beaver
trusting_beaver
```
@y
```console
$ docker stop trusting_beaver
trusting_beaver
```
@z

@x
Now that our container is stopped, let’s remove it. When you remove a container, the process inside the container will be stopped and the metadata for the container will been removed.
@y
Now that our container is stopped, let’s remove it. When you remove a container, the process inside the container will be stopped and the metadata for the container will been removed.
@z

@x
To remove a container, simple run the `docker rm` command passing the container name. You can pass multiple container names to the command using a single command. Again, replace the container names in the following command with the container names from your system.
@y
To remove a container, simple run the `docker rm` command passing the container name. You can pass multiple container names to the command using a single command. Again, replace the container names in the following command with the container names from your system.
@z

@x
```console
$ docker rm trusting_beaver modest_khayyam lucid_greider
trusting_beaver
modest_khayyam
lucid_greider
```
@y
```console
$ docker rm trusting_beaver modest_khayyam lucid_greider
trusting_beaver
modest_khayyam
lucid_greider
```
@z

@x
Run the `docker ps --all` command again to see that all containers are removed.
@y
Run the `docker ps --all` command again to see that all containers are removed.
@z

@x
Now, let’s address the random naming issue. The standard practice is to name your containers for the simple reason that it is easier to identify what is running in the container and what application or service it is associated with.
@y
Now, let’s address the random naming issue. The standard practice is to name your containers for the simple reason that it is easier to identify what is running in the container and what application or service it is associated with.
@z

@x
To name a container, we just need to pass the `--name` flag to the `docker run` command.
@y
To name a container, we just need to pass the `--name` flag to the `docker run` command.
@z

@x
```console
$ docker run --rm -d -p 8080:8080 --name springboot-server java-docker
2e907c68d1c98be37d2b2c2ac6b16f353c85b3757e549254de68746a94a8a8d3
$ docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS         PORTS                    NAMES
2e907c68d1c9   java-docker   "./mvnw spring-boot:…"   8 seconds ago   Up 8 seconds   0.0.0.0:8080->8080/tcp   springboot-server
```
@y
```console
$ docker run --rm -d -p 8080:8080 --name springboot-server java-docker
2e907c68d1c98be37d2b2c2ac6b16f353c85b3757e549254de68746a94a8a8d3
$ docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS         PORTS                    NAMES
2e907c68d1c9   java-docker   "./mvnw spring-boot:…"   8 seconds ago   Up 8 seconds   0.0.0.0:8080->8080/tcp   springboot-server
```
@z

@x
That’s better! We can now easily identify our container based on the name.
@y
That’s better! We can now easily identify our container based on the name.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, we took a look at running containers, publishing ports, and running containers in detached mode. We also took a look at managing containers by starting, stopping, and, restarting them. We also looked at naming our containers so they are more easily identifiable.
@y
In this module, we took a look at running containers, publishing ports, and running containers in detached mode. We also took a look at managing containers by starting, stopping, and, restarting them. We also looked at naming our containers so they are more easily identifiable.
@z

@x
In the next module, we’ll learn how to run a database in a container and connect it to our application. See:
@y
In the next module, we’ll learn how to run a database in a container and connect it to our application. See:
@z

@x
[Use containers for development](develop.md){: .button .primary-btn}
@y
[Use containers for development](develop.md){: .button .primary-btn}
@z

@x
## Feedback
@y
## Feedback
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Java%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Java%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@z

@x
<br />
@y
<br />
@z
