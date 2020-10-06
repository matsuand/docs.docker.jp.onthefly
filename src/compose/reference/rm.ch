%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Removes stopped service containers.
keywords: fig, composition, compose, docker, orchestration, cli,  rm
title: docker-compose rm
notoc: true
---
@y
---
description: Removes stopped service containers.
keywords: fig, composition, compose, docker, orchestration, cli,  rm
title: docker-compose rm
notoc: true
---
@z

@x
```none
Usage: rm [options] [SERVICE...]
@y
```none
Usage: rm [options] [SERVICE...]
@z

@x
Options:
    -f, --force   Don't ask to confirm removal
    -s, --stop    Stop the containers, if required, before removing
    -v            Remove any anonymous volumes attached to containers
    -a, --all     Deprecated - no effect.
```
@y
Options:
    -f, --force   Don't ask to confirm removal
    -s, --stop    Stop the containers, if required, before removing
    -v            Remove any anonymous volumes attached to containers
    -a, --all     Deprecated - no effect.
```
@z

@x
Removes stopped service containers.
@y
Removes stopped service containers.
@z

@x
By default, anonymous volumes attached to containers are not removed. You
can override this with `-v`. To list all volumes,  use `docker volume ls`.
@y
By default, anonymous volumes attached to containers are not removed. You
can override this with `-v`. To list all volumes,  use `docker volume ls`.
@z

@x
Any data which is not in a volume is lost.
@y
Any data which is not in a volume is lost.
@z

@x
Running the command with no options also removes one-off containers created
by `docker-compose up` or `docker-compose run`:
@y
Running the command with no options also removes one-off containers created
by `docker-compose up` or `docker-compose run`:
@z

@x
```none
$ docker-compose rm
Going to remove djangoquickstart_web_run_1
Are you sure? [yN] y
Removing djangoquickstart_web_run_1 ... done
```
@y
```none
$ docker-compose rm
Going to remove djangoquickstart_web_run_1
Are you sure? [yN] y
Removing djangoquickstart_web_run_1 ... done
```
@z
