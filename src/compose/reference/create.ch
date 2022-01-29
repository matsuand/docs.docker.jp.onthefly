%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Create creates containers for a service.
keywords: fig, composition, compose, docker, orchestration, cli, create
title: docker-compose create
notoc: true
---
@y
---
description: create コマンドはサービスのコンテナーを生成します。
keywords: fig, composition, compose, docker, orchestration, cli, create
title: docker-compose create
notoc: true
---
@z

@x
> **This command is deprecated.** Use the [up](up.md) command with `--no-start`
instead.
{: .warning }
@y
> **このコマンドは廃止予定（deprecated）です**。
> このかわりに [up](up.md) コマンドに`--no-start`オプションをつけて実行してください。
{: .warning }
@z

@x
```none
Usage: docker-compose create [options] [SERVICE...]

Options:
    --force-recreate       Recreate containers even if their configuration and
                           image haven't changed. Incompatible with --no-recreate.
    --no-recreate          If containers already exist, don't recreate them.
                           Incompatible with --force-recreate.
    --no-build             Don't build an image, even if it's missing.
    --build                Build images before creating containers.
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
Usage: docker-compose create [options] [SERVICE...]

Options:
    --force-recreate       Recreate containers even if their configuration and
                           image haven't changed. Incompatible with --no-recreate.
    --no-recreate          If containers already exist, don't recreate them.
                           Incompatible with --force-recreate.
    --no-build             Don't build an image, even if it's missing.
    --build                Build images before creating containers.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-compose create [オプション] [サービス名...]

オプション:
    --force-recreate       設定やイメージに変更がなくてもコンテナーを再生成します。
                           --no-recreate との併用はできません。
    --no-recreate          コンテナーが存在する場合は再生成しません。
                           --force-recreate との併用はできません。
    --no-build             イメージが見つからなくてもイメージをビルドしません。
    --build                コンテナーの生成前にイメージをビルドします。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z
