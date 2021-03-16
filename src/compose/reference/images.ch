%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Lists images used by the project.
keywords: fig, composition, compose, docker, orchestration, cli, images
title: docker-compose images
notoc: true
---
@y
---
description: プロジェクトにおいて用いられているイメージの一覧を表示します。
keywords: fig, composition, compose, docker, orchestration, cli, images
title: docker-compose images
notoc: true
---
@z

@x
```none
Usage: images [options] [SERVICE...]

Options:
    -q, --quiet  Only display IDs
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
Usage: images [options] [SERVICE...]

Options:
    -q, --quiet  Only display IDs
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: images [オプション] [SERVICE...]

オプション:
    -q, --quiet  ID のみを表示します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
List images used by the created containers.
@y
生成済コンテナーによって利用されているイメージの一覧を表示します。
@z
