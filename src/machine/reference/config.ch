%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Show client configuration
keywords: machine, config, subcommand
title: docker-machine config
---
@y
---
description: Show client configuration
keywords: machine, config, subcommand
title: docker-machine config
---
@z

@x
```none
Usage: docker-machine config [OPTIONS] [arg...]

Print the connection config for machine

Description:
   Argument is a machine name.

Options:

   --swarm      Display the Swarm config instead of the Docker daemon
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
Usage: docker-machine config [OPTIONS] [arg...]

Print the connection config for machine

Description:
   Argument is a machine name.

Options:

   --swarm      Display the Swarm config instead of the Docker daemon
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-machine config [オプション] [arg...]

マシンの接続設定を表示します。

内容説明:
   引数にはマシン名を指定します。

オプション:

   --swarm      Docker デーモンでなく Swarm の設定を表示します。
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
$ docker-machine config dev \
    --tlsverify \
    --tlscacert="/Users/ehazlett/.docker/machines/dev/ca.pem" \
    --tlscert="/Users/ehazlett/.docker/machines/dev/cert.pem" \
    --tlskey="/Users/ehazlett/.docker/machines/dev/key.pem" \
    -H tcp://192.168.99.103:2376
```
@y
```console
$ docker-machine config dev \
    --tlsverify \
    --tlscacert="/Users/ehazlett/.docker/machines/dev/ca.pem" \
    --tlscert="/Users/ehazlett/.docker/machines/dev/cert.pem" \
    --tlskey="/Users/ehazlett/.docker/machines/dev/key.pem" \
    -H tcp://192.168.99.103:2376
```
@z
