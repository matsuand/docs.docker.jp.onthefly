%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Restart a machine
keywords: machine, restart, subcommand
title: docker-machine restart
hide_from_sitemap: true
---
@y
---
description: Restart a machine
keywords: machine, restart, subcommand
title: docker-machine restart
hide_from_sitemap: true
---
@z

@x
```none
Usage: docker-machine restart [arg...]

Restart a machine

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
Usage: docker-machine restart [arg...]

Restart a machine

Description:
   Argument(s) are one or more machine names.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-machine restart [arg...]

マシンを再起動します。

内容説明:
   引数にはマシン名を必要な数だけ指定します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Restart a machine. Oftentimes this is equivalent to
`docker-machine stop; docker-machine start`. But some cloud driver try to implement a clever restart which keeps the same
IP address.
@y
{% comment %}
Restart a machine. Oftentimes this is equivalent to
`docker-machine stop; docker-machine start`. But some cloud driver try to implement a clever restart which keeps the same
IP address.
{% endcomment %}
マシンを再起動します。
普通は `docker-machine stop; docker-machine start` を実行することと同じです。
ただしクラウドドライバーによっては、IP アドレスを変更せずに再起動を行うように実装されているものもあります。
@z

@x
```bash
$ docker-machine restart dev

Waiting for VM to start...
```
@y
```bash
$ docker-machine restart dev

Waiting for VM to start...
```
@z
