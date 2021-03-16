%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Forces running containers to stop.
keywords: fig, composition, compose, docker, orchestration, cli,  kill
title: docker-compose kill
notoc: true
---
@y
---
description: Forces running containers to stop.
keywords: fig, composition, compose, docker, orchestration, cli,  kill
title: docker-compose kill
notoc: true
---
@z

@x
```none
Usage: kill [options] [SERVICE...]

Options:
    -s SIGNAL         SIGNAL to send to the container.
                      Default signal is SIGKILL.
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
Usage: kill [options] [SERVICE...]

Options:
    -s SIGNAL         SIGNAL to send to the container.
                      Default signal is SIGKILL.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: kill [オプション] [SERVICE...]

オプション:
    -s SIGNAL         コンテナーに送信する SIGNAL を指定します。
                      デフォルトのシグナルは SIGKILL です。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Forces running containers to stop by sending a `SIGKILL` signal. Optionally the
signal can be passed, for example:
@y
実行中コンテナーを強制的に停止させるには`SIGKILL`シグナルを送信します。
オプションを用いて送信シグナルを指定するには、以下のようにします。
@z

@x
    docker-compose kill -s SIGINT
@y
    docker-compose kill -s SIGINT
@z
