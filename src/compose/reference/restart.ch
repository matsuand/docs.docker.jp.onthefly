%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Restarts Docker Compose services.
keywords: fig, composition, compose, docker, orchestration, cli,  restart
title: docker-compose restart
notoc: true
---
@y
---
description: Restarts Docker Compose services.
keywords: fig, composition, compose, docker, orchestration, cli,  restart
title: docker-compose restart
notoc: true
---
@z

@x
```none
Usage: restart [options] [SERVICE...]
@y
```none
Usage: restart [options] [SERVICE...]
@z

@x
Options:
  -t, --timeout TIMEOUT      Specify a shutdown timeout in seconds.
                             (default: 10)
```
@y
Options:
  -t, --timeout TIMEOUT      Specify a shutdown timeout in seconds.
                             (default: 10)
```
@z

@x
Restarts all stopped and running services.
@y
Restarts all stopped and running services.
@z

@x
If you make changes to your `docker-compose.yml` configuration these changes are not reflected after running this command.
@y
If you make changes to your `docker-compose.yml` configuration these changes are not reflected after running this command.
@z

@x
For example, changes to environment variables (which are added after a container is built, but before the container's command is executed) are not updated after restarting.
@y
For example, changes to environment variables (which are added after a container is built, but before the container's command is executed) are not updated after restarting.
@z

@x
If you are looking to configure a service's restart policy, please refer to
[restart](../compose-file/index.md#restart) in Compose file v3 and
[restart](../compose-file/compose-file-v2.md#restart) in Compose v2. Note that if
you are [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md),
you should use [restart_policy](../compose-file/index.md#restart), instead.
@y
If you are looking to configure a service's restart policy, please refer to
[restart](../compose-file/index.md#restart) in Compose file v3 and
[restart](../compose-file/compose-file-v2.md#restart) in Compose v2. Note that if
you are [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md),
you should use [restart_policy](../compose-file/index.md#restart), instead.
@z
