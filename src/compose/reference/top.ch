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
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```none
Usage: top [SERVICE...]
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: top [SERVICE...]
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Displays the running processes.
@y
実行中のプロセスを表示します。
@z

@x
```bash
$ docker-compose top
compose_service_a_1
PID    USER   TIME   COMMAND
----------------------------
4060   root   0:00   top

compose_service_b_1
PID    USER   TIME   COMMAND
----------------------------
4115   root   0:00   top
```
@y
```bash
$ docker-compose top
compose_service_a_1
PID    USER   TIME   COMMAND
----------------------------
4060   root   0:00   top

compose_service_b_1
PID    USER   TIME   COMMAND
----------------------------
4115   root   0:00   top
```
@z
