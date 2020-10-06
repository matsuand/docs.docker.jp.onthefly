%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Identify active machines
keywords: machine, active, subcommand
title: docker-machine active
hide_from_sitemap: true
---
@y
---
description: アクティブなマシンを識別します。
keywords: machine, active, subcommand
title: docker-machine active
hide_from_sitemap: true
---
@z

@x
See which machine is "active" (a machine is considered active if the
`DOCKER_HOST` environment variable points to it).
@y
{% comment %}
See which machine is "active" (a machine is considered active if the
`DOCKER_HOST` environment variable points to it).
{% endcomment %}
どのマシンが「アクティブ」であるかを確認します。
（環境変数 `DOCKER_HOST` が設定されている場合は、そのマシンがアクティブとみなされます。）
@z

@x
```bash
$ docker-machine ls
@y
```bash
$ docker-machine ls
@z

@x
NAME      ACTIVE   DRIVER         STATE     URL
dev       -        virtualbox     Running   tcp://192.168.99.103:2376
staging   *        digitalocean   Running   tcp://203.0.113.81:2376
@y
NAME      ACTIVE   DRIVER         STATE     URL
dev       -        virtualbox     Running   tcp://192.168.99.103:2376
staging   *        digitalocean   Running   tcp://203.0.113.81:2376
@z

@x
$ echo $DOCKER_HOST
tcp://203.0.113.81:2376
@y
$ echo $DOCKER_HOST
tcp://203.0.113.81:2376
@z

@x
$ docker-machine active
staging
```
@y
$ docker-machine active
staging
```
@z
