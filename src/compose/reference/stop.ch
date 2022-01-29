%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: 'Stops running containers without removing them. '
keywords: fig, composition, compose, docker, orchestration, cli, stop
title: docker-compose stop
notoc: true
---
@y
---
description: 'Stops running containers without removing them. '
keywords: fig, composition, compose, docker, orchestration, cli, stop
title: docker-compose stop
notoc: true
---
@z

@x
```none
Usage: docker-compose stop [options] [SERVICE...]

Options:
  -t, --timeout TIMEOUT      Specify a shutdown timeout in seconds.
                             (default: 10)
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
Usage: docker-compose stop [options] [SERVICE...]

Options:
  -t, --timeout TIMEOUT      Specify a shutdown timeout in seconds.
                             (default: 10)
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法 docker-compose stop [オプション] [サービス名...]

オプション:
  -t, --timeout TIMEOUT      シャットダウンに要するタイムアウト時間を秒数で指定します。
                             （デフォルト: 10）
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Stops running containers without removing them. They can be started again with
`docker-compose start`.
@y
実行中コンテナーを停止しますが削除はしません。
停止したコンテナーは`docker-compose start`によって再起動することができます。
@z
