%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Sets the number of containers to run for a service.
keywords: fig, composition, compose, docker, orchestration, cli,  scale
title: docker-compose scale
notoc: true
---
@y
---
description: Sets the number of containers to run for a service.
keywords: fig, composition, compose, docker, orchestration, cli,  scale
title: docker-compose scale
notoc: true
---
@z

@x
> **This command is deprecated.** Use the [up](up.md) command with the
  `--scale` flag instead. Beware that using `up` with the `--scale` flag has
  some [subtle differences](https://github.com/docker/compose/issues/5251) with
  the `scale` command, as it incorporates the behaviour of the `up` command.
  {: .warning }
@y
> **This command is deprecated.** Use the [up](up.md) command with the
  `--scale` flag instead. Beware that using `up` with the `--scale` flag has
  some [subtle differences](https://github.com/docker/compose/issues/5251) with
  the `scale` command, as it incorporates the behaviour of the `up` command.
  {: .warning }
@z

@x
```none
Usage: scale [options] [SERVICE=NUM...]
@y
```none
Usage: scale [options] [SERVICE=NUM...]
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
Sets the number of containers to run for a service.
@y
Sets the number of containers to run for a service.
@z

@x
Numbers are specified as arguments in the form `service=num`. For example:
@y
Numbers are specified as arguments in the form `service=num`. For example:
@z

@x
    docker-compose scale web=2 worker=3
@y
    docker-compose scale web=2 worker=3
@z

@x
>**Tip**: Alternatively, in
[Compose file version 3.x](../compose-file/index.md), you can specify
[replicas](../compose-file/index.md#replicas)
under the [deploy](../compose-file/index.md#deploy) key as part of a
service configuration for [Swarm mode](/engine/swarm/). The `deploy` key and its sub-options (including `replicas`) only works with the `docker stack deploy` command, not `docker-compose up` or `docker-compose run`.
@y
>**Tip**: Alternatively, in
[Compose file version 3.x](../compose-file/index.md), you can specify
[replicas](../compose-file/index.md#replicas)
under the [deploy](../compose-file/index.md#deploy) key as part of a
service configuration for [Swarm mode](/engine/swarm/). The `deploy` key and its sub-options (including `replicas`) only works with the `docker stack deploy` command, not `docker-compose up` or `docker-compose run`.
@z
