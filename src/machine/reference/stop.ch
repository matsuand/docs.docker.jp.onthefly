%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Gracefully stop a machine
keywords: machine, stop, subcommand
title: docker-machine stop
---
@y
---
description: 適切にマシンを停止します。
keywords: machine, stop, subcommand
title: docker-machine stop
---
@z

@x
```none
Usage: docker-machine stop [arg...]

Gracefully Stop a machine

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
Usage: docker-machine stop [arg...]

Gracefully Stop a machine

Description:
   Argument(s) are one or more machine names.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-machine stop [arg...]

適切にマシンを停止します。

内容説明:
   引数にはマシン名を必要な数だけ指定します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
For example:
@y
たとえば以下のとおりです。
@z

@x
```console
$ docker-machine ls
@y
```console
$ docker-machine ls
@z

@x
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Running   tcp://192.168.99.104:2376
@y
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Running   tcp://192.168.99.104:2376
@z

@x
$ docker-machine stop dev
$ docker-machine ls
@y
$ docker-machine stop dev
$ docker-machine ls
@z

@x
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Stopped
```
@y
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Stopped
```
@z
