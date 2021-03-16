%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Sets the number of containers to run for a service.
keywords: fig, composition, compose, docker, orchestration, cli,  scale
title: docker-compose scale
notoc: true
---
@y
---
description: Sets the number of containers to run for a service.
keywords: fig, composition, compose, docker, orchestration, cli,  scale
title: docker-compose scale
notoc: true
---
@z

@x
> **This command is deprecated.** Use the [up](up.md) command with the
  `--scale` flag instead. Beware that using `up` with the `--scale` flag has
  some [subtle differences](https://github.com/docker/compose/issues/5251) with
  the `scale` command, as it incorporates the behaviour of the `up` command.
  {: .warning }
@y
> **このコマンドは非推奨となっています**。
> このかわりに [up](up.md) コマンドに`--scale`フラグをつけて利用してください。
> `up`コマンドに`--scale`フラグをつけて実行するのは、`scale`コマンドとは [微妙な違い](https://github.com/docker/compose/issues/5251) があります。
  これは`up`コマンドによる動作が組み込まれているためです。
  {: .warning }
@z

@x
```none
Usage: scale [options] [SERVICE=NUM...]

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
Usage: scale [options] [SERVICE=NUM...]

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
利用方法: scale [オプション] [SERVICE=NUM...]

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
Sets the number of containers to run for a service.
@y
1 つのサービス実行に対してのコンテナー数を設定します。
@z

@x
Numbers are specified as arguments in the form `service=num`. For example:
@y
コンテナー数は、`service=num`といった形の引数として指定します。
たとえば以下のとおりです。
@z

@x
    docker-compose scale web=2 worker=3
@y
    docker-compose scale web=2 worker=3
@z

@x
>**Tip**: Alternatively, in
[Compose file version 3.x](../compose-file/compose-file-v3.md), you can specify
[replicas](../compose-file/compose-file-v3.md#replicas)
under the [deploy](../compose-file/compose-file-v3.md#deploy) key as part of a
service configuration for [Swarm mode](/engine/swarm/). The `deploy` key and its sub-options (including `replicas`) only works with the `docker stack deploy` command, not `docker-compose up` or `docker-compose run`.
@y
>**メモ**
>
> これとは別に [Compose ファイルバージョン 3.x](../compose-file/compose-file-v3.md) においては、[Swarm モード](/engine/swarm/) に対するサービス設定の一部として、[deploy](../compose-file/compose-file-v3.md#deploy) キー配下に [replicas](../compose-file/compose-file-v3.md#replicas) を指定することができます。
ただし`deploy`キーとサブオプション（`replicas`を含む）は、`docker stack deploy`コマンドにおいてのみ動作するものであって、`docker-compose up`や`docker-compose run`では動作しません。
@z
