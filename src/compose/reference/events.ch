%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Receive real time events from containers.
keywords: fig, composition, compose, docker, orchestration, cli, events
title: docker-compose events
notoc: true
---
@y
---
description: Receive real time events from containers.
keywords: fig, composition, compose, docker, orchestration, cli, events
title: docker-compose events
notoc: true
---
@z

@x
```none
Usage: events [options] [SERVICE...]

Options:
    --json      Output events as a stream of json objects
```
@y
{% comment %}
```none
Usage: events [options] [SERVICE...]

Options:
    --json      Output events as a stream of json objects
```
{% endcomment %}
```none
利用方法: events [オプション] [SERVICE...]

オプション:
    --json      Output events as a stream of json objects
```
@z

@x
Stream container events for every container in the project.
@y
{% comment %}
Stream container events for every container in the project.
{% endcomment %}
プロジェクト内のコンテナーすべてに対して、コンテナーイベントをストリーム出力します。
@z

@x
With the `--json` flag, a json object is printed one per line with the
format:
@y
{% comment %}
With the `--json` flag, a json object is printed one per line with the
format:
{% endcomment %}
With the `--json` flag, a json object is printed one per line with the
format:
@z

@x
```json
{
    "time": "2015-11-20T18:01:03.615550",
    "type": "container",
    "action": "create",
    "id": "213cf7...5fc39a",
    "service": "web",
    "attributes": {
        "name": "application_web_1",
        "image": "alpine:edge"
    }
}
```
@y
```json
{
    "time": "2015-11-20T18:01:03.615550",
    "type": "container",
    "action": "create",
    "id": "213cf7...5fc39a",
    "service": "web",
    "attributes": {
        "name": "application_web_1",
        "image": "alpine:edge"
    }
}
```
@z

@x
The events that can be received using this can be seen [here](../../engine/reference/commandline/events.md#object-types).
@y
{% comment %}
The events that can be received using this can be seen [here](../../engine/reference/commandline/events.md#object-types).
{% endcomment %}
The events that can be received using this can be seen [here](../../engine/reference/commandline/events.md#object-types).
@z
