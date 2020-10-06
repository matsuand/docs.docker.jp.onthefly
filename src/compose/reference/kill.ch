%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Forces running containers to stop.
keywords: fig, composition, compose, docker, orchestration, cli,  kill
title: docker-compose kill
notoc: true
---
@y
---
description: Forces running containers to stop.
keywords: fig, composition, compose, docker, orchestration, cli,  kill
title: docker-compose kill
notoc: true
---
@z

@x
```none
Usage: kill [options] [SERVICE...]

Options:
    -s SIGNAL         SIGNAL to send to the container.
                      Default signal is SIGKILL.
```
@y
{% comment %}
```none
Usage: kill [options] [SERVICE...]

Options:
    -s SIGNAL         SIGNAL to send to the container.
                      Default signal is SIGKILL.
```
{% endcomment %}
```none
利用方法: kill [オプション] [SERVICE...]

オプション:
    -s SIGNAL         SIGNAL to send to the container.
                      Default signal is SIGKILL.
```
@z

@x
Forces running containers to stop by sending a `SIGKILL` signal. Optionally the
signal can be passed, for example:
@y
{% comment %}
Forces running containers to stop by sending a `SIGKILL` signal. Optionally the
signal can be passed, for example:
{% endcomment %}
Forces running containers to stop by sending a `SIGKILL` signal. Optionally the
signal can be passed, for example:
@z

@x
    docker-compose kill -s SIGINT
@y
    docker-compose kill -s SIGINT
@z
