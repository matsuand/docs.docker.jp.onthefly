%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Build a Docker image with Riak pre-installed
keywords: docker, example, package installation, networking,  riak
title: Dockerize a Riak service
redirect_from:
  - /engine/examples/running_riak_service/
---
@y
---
description: Build a Docker image with Riak pre-installed
keywords: docker, example, package installation, networking,  riak
title: Dockerize a Riak service
redirect_from:
  - /engine/examples/running_riak_service/
---
@z

@x
The goal of this example is to show you how to build a Docker image with
Riak pre-installed.
@y
The goal of this example is to show you how to build a Docker image with
Riak pre-installed.
@z

@x
## Create a Dockerfile
@y
## Create a Dockerfile
@z

@x
Create an empty file called `Dockerfile`:
@y
Create an empty file called `Dockerfile`:
@z

@x
```console
$ touch Dockerfile
```
@y
```console
$ touch Dockerfile
```
@z

@x
Next, define the parent image you want to use to build your image on top
of. We use [Ubuntu](https://hub.docker.com/_/ubuntu/) (tag:
`trusty`), which is available on [Docker Hub](https://hub.docker.com):
@y
Next, define the parent image you want to use to build your image on top
of. We use [Ubuntu](https://hub.docker.com/_/ubuntu/) (tag:
`trusty`), which is available on [Docker Hub](https://hub.docker.com):
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
# Riak
#
# VERSION       0.1.1
@y
```dockerfile
# syntax=docker/dockerfile:1
# Riak
#
# VERSION       0.1.1
@z

@x
# Use the Ubuntu parent image provided by dotCloud
FROM ubuntu:trusty
```
@y
# Use the Ubuntu parent image provided by dotCloud
FROM ubuntu:trusty
```
@z

@x
After that, we install the curl which is used to download the repository setup
script and we download the setup script and run it.
@y
After that, we install the curl which is used to download the repository setup
script and we download the setup script and run it.
@z

@x
```dockerfile
# Install Riak repository before we do apt-get update, so that update happens
# in a single step
RUN apt-get install -q -y curl && \
    curl -fsSL https://packagecloud.io/install/repositories/basho/riak/script.deb | sudo bash
```
@y
```dockerfile
# Install Riak repository before we do apt-get update, so that update happens
# in a single step
RUN apt-get install -q -y curl && \
    curl -fsSL https://packagecloud.io/install/repositories/basho/riak/script.deb | sudo bash
```
@z

@x
Then we install and setup a few dependencies:
@y
Then we install and setup a few dependencies:
@z

@x
 - `supervisor` is used manage the Riak processes
 - `riak=2.0.5-1` is the Riak package coded to version 2.0.5
@y
 - `supervisor` is used manage the Riak processes
 - `riak=2.0.5-1` is the Riak package coded to version 2.0.5
@z

@x
```dockerfile
# Install and setup project dependencies
RUN apt-get update && \
    apt-get install -y supervisor riak=2.0.5-1
@y
```dockerfile
# Install and setup project dependencies
RUN apt-get update && \
    apt-get install -y supervisor riak=2.0.5-1
@z

@x
RUN mkdir -p /var/log/supervisor
@y
RUN mkdir -p /var/log/supervisor
@z

@x
RUN locale-gen en_US en_US.UTF-8
@y
RUN locale-gen en_US en_US.UTF-8
@z

@x
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
```
@y
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
```
@z

@x
After that, we modify Riak's configuration:
@y
After that, we modify Riak's configuration:
@z

@x
```dockerfile
# Configure Riak to accept connections from any host
RUN sed -i "s|listener.http.internal = 127.0.0.1:8098|listener.http.internal = 0.0.0.0:8098|" /etc/riak/riak.conf
RUN sed -i "s|listener.protobuf.internal = 127.0.0.1:8087|listener.protobuf.internal = 0.0.0.0:8087|" /etc/riak/riak.conf
```
@y
```dockerfile
# Configure Riak to accept connections from any host
RUN sed -i "s|listener.http.internal = 127.0.0.1:8098|listener.http.internal = 0.0.0.0:8098|" /etc/riak/riak.conf
RUN sed -i "s|listener.protobuf.internal = 127.0.0.1:8087|listener.protobuf.internal = 0.0.0.0:8087|" /etc/riak/riak.conf
```
@z

@x
Then, we expose the Riak Protocol Buffers and HTTP interfaces:
@y
Then, we expose the Riak Protocol Buffers and HTTP interfaces:
@z

@x
```dockerfile
# Expose Riak Protocol Buffers and HTTP interfaces
EXPOSE 8087 8098
```
@y
```dockerfile
# Expose Riak Protocol Buffers and HTTP interfaces
EXPOSE 8087 8098
```
@z

@x
Finally, run `supervisord` so that Riak is started:
@y
Finally, run `supervisord` so that Riak is started:
@z

@x
```dockerfile
CMD ["/usr/bin/supervisord"]
```
@y
```dockerfile
CMD ["/usr/bin/supervisord"]
```
@z

@x
## Create a supervisord configuration file
@y
## Create a supervisord configuration file
@z

@x
Create an empty file called `supervisord.conf`. Make
sure it's at the same directory level as your `Dockerfile`:
@y
Create an empty file called `supervisord.conf`. Make
sure it's at the same directory level as your `Dockerfile`:
@z

@x
```console
$ touch supervisord.conf
```
@y
```console
$ touch supervisord.conf
```
@z

@x
Populate it with the following program definitions:
@y
Populate it with the following program definitions:
@z

@x
```ini
[supervisord]
nodaemon=true
@y
```ini
[supervisord]
nodaemon=true
@z

@x
[program:riak]
command=bash -c "/usr/sbin/riak console"
numprocs=1
autostart=true
autorestart=true
user=riak
environment=HOME="/var/lib/riak"
stdout_logfile=/var/log/supervisor/%(program_name)s.log
stderr_logfile=/var/log/supervisor/%(program_name)s.log
```
@y
[program:riak]
command=bash -c "/usr/sbin/riak console"
numprocs=1
autostart=true
autorestart=true
user=riak
environment=HOME="/var/lib/riak"
stdout_logfile=/var/log/supervisor/%(program_name)s.log
stderr_logfile=/var/log/supervisor/%(program_name)s.log
```
@z

@x
## Build the Docker image for Riak
@y
## Build the Docker image for Riak
@z

@x
Now you can build a Docker image for Riak:
@y
Now you can build a Docker image for Riak:
@z

@x
```console
$ docker build -t "<yourname>/riak" .
```
@y
```console
$ docker build -t "<yourname>/riak" .
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
Riak is a distributed database. Many production deployments consist of
[at least five nodes](
https://riak.com/why-your-riak-cluster-should-have-at-least-five-nodes/).
See the [docker-riak](https://github.com/hectcastro/docker-riak) project
details on how to deploy a Riak cluster using Docker and Pipework.
@y
Riak is a distributed database. Many production deployments consist of
[at least five nodes](
https://riak.com/why-your-riak-cluster-should-have-at-least-five-nodes/).
See the [docker-riak](https://github.com/hectcastro/docker-riak) project
details on how to deploy a Riak cluster using Docker and Pipework.
@z
