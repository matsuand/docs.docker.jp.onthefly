%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Lists containers.
keywords: fig, composition, compose, docker, orchestration, cli,  ps
title: docker-compose ps
notoc: true
---
@y
---
description: Lists containers.
keywords: fig, composition, compose, docker, orchestration, cli,  ps
title: docker-compose ps
notoc: true
---
@z

@x
```none
Usage: ps [options] [SERVICE...]
@y
```none
Usage: ps [options] [SERVICE...]
@z

@x
Options:
    -q, --quiet          Only display IDs
    --services           Display services
    --filter KEY=VAL     Filter services by a property
    -a, --all            Show all stopped containers (including those created by the run command)
```
@y
Options:
    -q, --quiet          Only display IDs
    --services           Display services
    --filter KEY=VAL     Filter services by a property
    -a, --all            Show all stopped containers (including those created by the run command)
```
@z

@x
Lists containers.
@y
Lists containers.
@z

@x
```bash
$ docker-compose ps
         Name                        Command                 State             Ports
---------------------------------------------------------------------------------------------
mywordpress_db_1          docker-entrypoint.sh mysqld      Up (healthy)  3306/tcp
mywordpress_wordpress_1   /entrypoint.sh apache2-for ...   Restarting    0.0.0.0:8000->80/tcp
```
@y
```bash
$ docker-compose ps
         Name                        Command                 State             Ports
---------------------------------------------------------------------------------------------
mywordpress_db_1          docker-entrypoint.sh mysqld      Up (healthy)  3306/tcp
mywordpress_wordpress_1   /entrypoint.sh apache2-for ...   Restarting    0.0.0.0:8000->80/tcp
```
@z
