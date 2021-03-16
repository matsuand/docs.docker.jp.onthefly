%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Pauses running containers for a service.
keywords: fig, composition, compose, docker, orchestration, cli, pause
title: docker-compose pause
notoc: true
---
@y
---
description: Pauses running containers for a service.
keywords: fig, composition, compose, docker, orchestration, cli, pause
title: docker-compose pause
notoc: true
---
@z

@x
```none
Usage: pause [SERVICE...]
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
Usage: pause [SERVICE...]
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: pause [SERVICE...]
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
<hr>
@z

@x
Pauses running containers of a service. They can be unpaused with `docker-compose unpause`.
@y
実行中のサービスコンテナーを一時停止します。
そのコンテナーは`docker-compose unpause`によって再開できます。
@z
