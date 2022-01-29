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
Usage: docker-compose events [options] [SERVICE...]

Options:
    --json      Output events as a stream of json objects
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```none
Usage: docker-compose events [options] [SERVICE...]

Options:
    --json      Output events as a stream of json objects
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-compose events [オプション] [サービス名...]

オプション:
    --json      JSON オブジェクトのストリームとしてイベントを出力します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Stream container events for every container in the project.
@y
プロジェクト内のコンテナーすべてに対して、コンテナーイベントをストリーム出力します。
@z

@x
With the `--json` flag, a json object is printed one per line with the
format:
@y
`--json`フラグが指定されている場合は、以下のような書式により各設定が 1 行ずつ出力されます。
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
このコマンドを使って取得できるイベントの一覧は [こちら](../../engine/reference/commandline/events.md#object-types) に示しています。
@z
