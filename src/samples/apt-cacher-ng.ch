%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Installing and running an apt-cacher-ng service
keywords: docker, example, package installation, networking, debian,  ubuntu
title: Dockerize an apt-cacher-ng service
redirect_from:
  - /engine/examples/apt-cacher-ng/
---
@y
---
description: Installing and running an apt-cacher-ng service
keywords: docker, example, package installation, networking, debian,  ubuntu
title: Dockerize an apt-cacher-ng service
redirect_from:
  - /engine/examples/apt-cacher-ng/
---
@z

@x
> **Note**:
> - **If you don't like sudo** then see
>   [*Giving non-root access*](../engine/install/linux-postinstall.md#manage-docker-as-a-non-root-user).
> - **If you're using macOS or docker via TCP** then you shouldn't use sudo.
@y
> **Note**:
> - **If you don't like sudo** then see
>   [*Giving non-root access*](../engine/install/linux-postinstall.md#manage-docker-as-a-non-root-user).
> - **If you're using macOS or docker via TCP** then you shouldn't use sudo.
@z

@x
When you have multiple Docker servers, or build unrelated Docker
containers which can't make use of the Docker build cache, it can be
useful to have a caching proxy for your packages. This container makes
the second download of any package almost instant.
@y
When you have multiple Docker servers, or build unrelated Docker
containers which can't make use of the Docker build cache, it can be
useful to have a caching proxy for your packages. This container makes
the second download of any package almost instant.
@z

@x
Use the following Dockerfile:
@y
Use the following Dockerfile:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
# Build: docker build -t apt-cacher .
# Run: docker run -d -p 3142:3142 --name apt-cacher-run apt-cacher
#
# and then you can run containers with:
#   docker run -t -i --rm -e http_proxy http://dockerhost:3142/ debian bash
#
# Here, `dockerhost` is the IP address or FQDN of a host running the Docker daemon
# which acts as an APT proxy server.
FROM   ubuntu
@y
# Build: docker build -t apt-cacher .
# Run: docker run -d -p 3142:3142 --name apt-cacher-run apt-cacher
#
# and then you can run containers with:
#   docker run -t -i --rm -e http_proxy http://dockerhost:3142/ debian bash
#
# Here, `dockerhost` is the IP address or FQDN of a host running the Docker daemon
# which acts as an APT proxy server.
FROM   ubuntu
@z

@x
VOLUME ["/var/cache/apt-cacher-ng"]
RUN    apt-get update && apt-get install -y apt-cacher-ng
@y
VOLUME ["/var/cache/apt-cacher-ng"]
RUN    apt-get update && apt-get install -y apt-cacher-ng
@z

@x
EXPOSE 3142
CMD    chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
```
@y
EXPOSE 3142
CMD    chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
```
@z

@x
To build the image using:
@y
To build the image using:
@z

@x
```console
$ docker build -t eg_apt_cacher_ng .
```
@y
```console
$ docker build -t eg_apt_cacher_ng .
```
@z

@x
Then run it, mapping the exposed port to one on the host
@y
Then run it, mapping the exposed port to one on the host
@z

@x
```console
$ docker run -d -p 3142:3142 --name test_apt_cacher_ng eg_apt_cacher_ng
```
@y
```console
$ docker run -d -p 3142:3142 --name test_apt_cacher_ng eg_apt_cacher_ng
```
@z

@x
To see the logfiles that are `tailed` in the default command, you can
use:
@y
To see the logfiles that are `tailed` in the default command, you can
use:
@z

@x
```console
$ docker logs -f test_apt_cacher_ng
```
@y
```console
$ docker logs -f test_apt_cacher_ng
```
@z

@x
To get your Debian-based containers to use the proxy, you have
following options. Replace `dockerhost` with the
IP address or FQDN of the host running the `test_apt_cacher_ng`
container.
@y
To get your Debian-based containers to use the proxy, you have
following options. Replace `dockerhost` with the
IP address or FQDN of the host running the `test_apt_cacher_ng`
container.
@z

@x
1. Add an apt Proxy setting
   `echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy`
2. Set an environment variable:
   `http_proxy=http://dockerhost:3142/`
3. Change your `sources.list` entries to start with
   `http://dockerhost:3142/`
4. Link Debian-based containers to the APT proxy container using `--link`
5. Create a custom network of an APT proxy container with Debian-based containers.
@y
1. Add an apt Proxy setting
   `echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy`
2. Set an environment variable:
   `http_proxy=http://dockerhost:3142/`
3. Change your `sources.list` entries to start with
   `http://dockerhost:3142/`
4. Link Debian-based containers to the APT proxy container using `--link`
5. Create a custom network of an APT proxy container with Debian-based containers.
@z

@x
**Option 1** injects the settings safely into your apt configuration in
a local version of a common base:
@y
**Option 1** injects the settings safely into your apt configuration in
a local version of a common base:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu
RUN echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy
RUN apt-get update && apt-get install -y vim git
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu
RUN echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy
RUN apt-get update && apt-get install -y vim git
@z

@x
# docker build -t my_ubuntu .
```
@y
# docker build -t my_ubuntu .
```
@z

@x
**Option 2** is good for testing, but breaks other HTTP clients
which obey `http_proxy`, such as `curl`, `wget` and others:
@y
**Option 2** is good for testing, but breaks other HTTP clients
which obey `http_proxy`, such as `curl`, `wget` and others:
@z

@x
```console
$ docker run --rm -t -i -e http_proxy=http://dockerhost:3142/ debian bash
```
@y
```console
$ docker run --rm -t -i -e http_proxy=http://dockerhost:3142/ debian bash
```
@z

@x
**Option 3** is the least portable, but you might need to do it and you can do it
from your `Dockerfile` too.
@y
**Option 3** is the least portable, but you might need to do it and you can do it
from your `Dockerfile` too.
@z

@x
**Option 4** links Debian-containers to the proxy server using following command:
@y
**Option 4** links Debian-containers to the proxy server using following command:
@z

@x
```console
$ docker run -i -t --link test_apt_cacher_ng:apt_proxy -e http_proxy=http://apt_proxy:3142/ debian bash
```
@y
```console
$ docker run -i -t --link test_apt_cacher_ng:apt_proxy -e http_proxy=http://apt_proxy:3142/ debian bash
```
@z

@x
**Option 5** creates a custom network of APT proxy server and Debian-based containers:
@y
**Option 5** creates a custom network of APT proxy server and Debian-based containers:
@z

@x
```console
$ docker network create mynetwork
$ docker run -d -p 3142:3142 --network=mynetwork --name test_apt_cacher_ng eg_apt_cacher_ng
$ docker run --rm -it --network=mynetwork -e http_proxy=http://test_apt_cacher_ng:3142/ debian bash
```
@y
```console
$ docker network create mynetwork
$ docker run -d -p 3142:3142 --network=mynetwork --name test_apt_cacher_ng eg_apt_cacher_ng
$ docker run --rm -it --network=mynetwork -e http_proxy=http://test_apt_cacher_ng:3142/ debian bash
```
@z

@x
Apt-cacher-ng has some tools that allow you to manage the repository,
and they can be used by leveraging the `VOLUME`
instruction, and the image we built to run the service:
@y
Apt-cacher-ng has some tools that allow you to manage the repository,
and they can be used by leveraging the `VOLUME`
instruction, and the image we built to run the service:
@z

@x
```console
$ docker run --rm -t -i --volumes-from test_apt_cacher_ng eg_apt_cacher_ng bash
@y
```console
$ docker run --rm -t -i --volumes-from test_apt_cacher_ng eg_apt_cacher_ng bash
@z

@x
root@f38c87f2a42d:/# /usr/lib/apt-cacher-ng/distkill.pl
Scanning /var/cache/apt-cacher-ng, please wait...
Found distributions:
bla, taggedcount: 0
     1. precise-security (36 index files)
     2. wheezy (25 index files)
     3. precise-updates (36 index files)
     4. precise (36 index files)
     5. wheezy-updates (18 index files)
@y
root@f38c87f2a42d:/# /usr/lib/apt-cacher-ng/distkill.pl
Scanning /var/cache/apt-cacher-ng, please wait...
Found distributions:
bla, taggedcount: 0
     1. precise-security (36 index files)
     2. wheezy (25 index files)
     3. precise-updates (36 index files)
     4. precise (36 index files)
     5. wheezy-updates (18 index files)
@z

@x
Found architectures:
     6. amd64 (36 index files)
     7. i386 (24 index files)
@y
Found architectures:
     6. amd64 (36 index files)
     7. i386 (24 index files)
@z

@x
WARNING: The removal action may wipe out whole directories containing
         index files. Select d to see detailed list.
@y
WARNING: The removal action may wipe out whole directories containing
         index files. Select d to see detailed list.
@z

@x
(Number nn: tag distribution or architecture nn; 0: exit; d: show details; r: remove tagged; q: quit): q
```
@y
(Number nn: tag distribution or architecture nn; 0: exit; d: show details; r: remove tagged; q: quit): q
```
@z

@x
Finally, clean up after your test by stopping and removing the
container, and then removing the image.
@y
Finally, clean up after your test by stopping and removing the
container, and then removing the image.
@z

@x
```console
$ docker container stop test_apt_cacher_ng
$ docker container rm test_apt_cacher_ng
$ docker image rm eg_apt_cacher_ng
```
@y
```console
$ docker container stop test_apt_cacher_ng
$ docker container rm test_apt_cacher_ng
$ docker image rm eg_apt_cacher_ng
```
@z
