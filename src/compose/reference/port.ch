%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Prints the public port for a port bindings.
keywords: fig, composition, compose, docker, orchestration, cli,  port
title: docker-compose port
notoc: true
---
@y
---
description: Prints the public port for a port bindings.
keywords: fig, composition, compose, docker, orchestration, cli,  port
title: docker-compose port
notoc: true
---
@z

@x
```none
Usage: port [options] SERVICE PRIVATE_PORT

Options:
    --protocol=proto  tcp or udp [default: tcp]
    --index=index     index of the container if there are multiple
                      instances of a service [default: 1]
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
Usage: port [options] SERVICE PRIVATE_PORT

Options:
    --protocol=proto  tcp or udp [default: tcp]
    --index=index     index of the container if there are multiple
                      instances of a service [default: 1]
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: port [オプション] SERVICE PRIVATE_PORT

Options:
    --protocol=proto  tcp または udp [デフォルト: tcp]
    --index=index     サービスが複数インスタンスによって構成されている場合、
                      そのコンテナーのインデックス。[デフォルト: 1]
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Prints the public port for a port binding.
@y
ポートバインディングにおいて公開されているポートを表示します。
@z
