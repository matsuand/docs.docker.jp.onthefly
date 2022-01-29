%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Displays log output from services.
keywords: fig, composition, compose, docker, orchestration, cli,  logs
title: docker-compose logs
notoc: true
---
@y
---
description: Displays log output from services.
keywords: fig, composition, compose, docker, orchestration, cli,  logs
title: docker-compose logs
notoc: true
---
@z

@x
```none
Usage: docker-compose logs [options] [SERVICE...]

Options:
    --no-color          Produce monochrome output.
    -f, --follow        Follow log output.
    -t, --timestamps    Show timestamps.
    --tail="all"        Number of lines to show from the end of the logs
                        for each container.
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
Usage: docker-compose logs [options] [SERVICE...]

Options:
    --no-color          Produce monochrome output.
    -f, --follow        Follow log output.
    -t, --timestamps    Show timestamps.
    --tail="all"        Number of lines to show from the end of the logs
                        for each container.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-compose logs [オプション] [サービス名...]

オプション:
    --no-color          モノクロ出力を行います。
    -f, --follow        ログ出力を監視します。
    -t, --timestamps    タイムスタンプを表示します。
    --tail="all"        各コンテナーにおいてログ最終行から何行を表示するか
                        を指定します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Displays log output from services.
@y
サービスにログ出力を表示します。
@z
