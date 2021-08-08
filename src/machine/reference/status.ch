%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Get the status of a machine
keywords: machine, status, subcommand
title: docker-machine status
---
@y
---
description: マシン状態を取得します。
keywords: machine, status, subcommand
title: docker-machine status
---
@z

@x
```none
Usage: docker-machine status [arg...]

Get the status of a machine

Description:
   Argument is a machine name.
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
Usage: docker-machine status [arg...]

Get the status of a machine

Description:
   Argument is a machine name.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-machine status [arg...]

マシン状態を取得します。

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
$ docker-machine status dev

Running
```
@y
```console
$ docker-machine status dev

Running
```
@z
