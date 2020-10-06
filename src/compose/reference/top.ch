%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Displays the running processes.
keywords: fig, composition, compose, docker, orchestration, cli, top
title: docker-compose top
notoc: true
---
@y
---
description: 実行中のプロセスを表示します。
keywords: fig, composition, compose, docker, orchestration, cli, top
title: docker-compose top
notoc: true
---
@z

@x
```none
Usage: top [SERVICE...]
```
@y
{% comment %}
```none
Usage: top [SERVICE...]
```
{% endcomment %}
```none
利用方法: top [SERVICE...]
```
@z

@x
Displays the running processes.
@y
{% comment %}
Displays the running processes.
{% endcomment %}
実行中のプロセスを表示します。
@z

@x
```bash
$ docker-compose top
compose_service_a_1
PID    USER   TIME   COMMAND
----------------------------
4060   root   0:00   top
@y
```bash
$ docker-compose top
compose_service_a_1
PID    USER   TIME   COMMAND
----------------------------
4060   root   0:00   top
@z

@x
compose_service_b_1
PID    USER   TIME   COMMAND
----------------------------
4115   root   0:00   top
```
@y
compose_service_b_1
PID    USER   TIME   COMMAND
----------------------------
4115   root   0:00   top
```
@z
