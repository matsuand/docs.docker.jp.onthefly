%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Config validates and view the compose file.
keywords: fig, composition, compose, docker, orchestration, cli, config
title: docker-compose config
notoc: true
redirect_from:
- /compose/reference/bundle/
---
@y
---
description: Compose ファイルを検証して表示します。
keywords: fig, composition, compose, docker, orchestration, cli, config
title: docker-compose config
notoc: true
redirect_from:
- /compose/reference/bundle/
---
@z

@x
```none
Usage: docker-compose config [options]

Options:
    --resolve-image-digests  Pin image tags to digests.
    --no-interpolate         Don't interpolate environment variables.
    -q, --quiet              Only validate the configuration, don't print
                             anything.
    --services               Print the service names, one per line.
    --volumes                Print the volume names, one per line.
    --hash="*"               Print the service config hash, one per line.
                             Set "service1,service2" for a list of specified services
                             or use the wildcard symbol to display all services.
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
Usage: docker-compose config [options]

Options:
    --resolve-image-digests  Pin image tags to digests.
    --no-interpolate         Don't interpolate environment variables.
    -q, --quiet              Only validate the configuration, don't print
                             anything.
    --services               Print the service names, one per line.
    --volumes                Print the volume names, one per line.
    --hash="*"               Print the service config hash, one per line.
                             Set "service1,service2" for a list of specified services
                             or use the wildcard symbol to display all services.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-compose config [オプション]

オプション:
    --resolve-image-digests  イメージタグをダイジェストに固定します。
    --no-interpolate         環境変数を参照しません。
    -q, --quiet              設定を検証するだけで、何も出力しません。
    --services               サービス名を1行ずつ表示します。
    --volumes                ボリューム名を1行ずつ表示します。
    --hash="*"               サービス設定を1行ずつ表示します。
                             "service1,service2"のような指定により特定サービスを、
                             またワイルドカード指定により全サービスを表示します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Validate and view the Compose file.
@y
Compose ファイルを検証して表示します。
@z
