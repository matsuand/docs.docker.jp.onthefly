%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Unpauses paused containers for a service.
keywords: fig, composition, compose, docker, orchestration, cli, unpause
title: docker-compose unpause
notoc: true
---
@y
---
description: 停止中のサービスコンテナーを再開します。
keywords: fig, composition, compose, docker, orchestration, cli, unpause
title: docker-compose unpause
notoc: true
---
@z

@x
```none
Usage: docker-compose unpause [SERVICE...]
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
Usage: docker-compose unpause [SERVICE...]
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-compose unpause [サービス名...]
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Unpauses paused containers of a service.
@y
停止中のサービスコンテナーを再開します。
@z
