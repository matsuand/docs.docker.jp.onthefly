%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Kill (abruptly force stop) a machine.
keywords: machine, kill, subcommand
title: docker-machine kill
hide_from_sitemap: true
---
@y
---
description: マシンを kill（強制終了）します。
keywords: machine, kill, subcommand
title: docker-machine kill
hide_from_sitemap: true
---
@z

@x
```none
Usage: docker-machine kill [arg...]

Kill (abruptly force stop) a machine

Description:
   Argument(s) are one or more machine names.
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
Usage: docker-machine kill [arg...]

Kill (abruptly force stop) a machine

Description:
   Argument(s) are one or more machine names.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-machine kill [arg...]

マシンを kill（強制終了）します。

内容説明:
   引数には 1 つまたは複数のマシン名を指定します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
For example:
@y
{% comment %}
For example:
{% endcomment %}
たとえば以下のとおりです。
@z

@x
```bash
$ docker-machine ls

NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Running   tcp://192.168.99.104:2376

$ docker-machine kill dev
$ docker-machine ls

NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Stopped
```
@y
```bash
$ docker-machine ls

NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Running   tcp://192.168.99.104:2376

$ docker-machine kill dev
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Stopped
```
@z
