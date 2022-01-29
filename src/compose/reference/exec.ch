%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: docker-compose exec
keywords: fig, composition, compose, docker, orchestration, cli, exec
title: docker-compose exec
notoc: true
---
@y
---
description: docker-compose exec
keywords: fig, composition, compose, docker, orchestration, cli, exec
title: docker-compose exec
notoc: true
---
@z

@x
```none
Usage: docker-compose exec [options] [-e KEY=VAL...] SERVICE COMMAND [ARGS...]

Options:
    -d, --detach      Detached mode: Run command in the background.
    --privileged      Give extended privileges to the process.
    -u, --user USER   Run the command as this user.
    -T                Disable pseudo-tty allocation. By default `docker-compose exec`
                      allocates a TTY.
    --index=index     index of the container if there are multiple
                      instances of a service [default: 1]
    -e, --env KEY=VAL Set environment variables (can be used multiple times,
                      not supported in API < 1.25)
    -w, --workdir DIR Path to workdir directory for this command.
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
Usage: docker-compose exec [options] [-e KEY=VAL...] SERVICE COMMAND [ARGS...]

Options:
    -d, --detach      Detached mode: Run command in the background.
    --privileged      Give extended privileges to the process.
    -u, --user USER   Run the command as this user.
    -T                Disable pseudo-tty allocation. By default `docker-compose exec`
                      allocates a TTY.
    --index=index     index of the container if there are multiple
                      instances of a service [default: 1]
    -e, --env KEY=VAL Set environment variables (can be used multiple times,
                      not supported in API < 1.25)
    -w, --workdir DIR Path to workdir directory for this command.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-compose exec [オプション] [-e KEY=VAL...] SERVICE COMMAND [ARGS...]

オプション:
    -d, --detach      デタッチモード。コマンドをバックグラウンドで実行します。
    --privileged      プロセスに対して拡張された権限を与えます。
    -u, --user USER   指定されたユーザーによりコマンドを実行します。
    -T                擬似 TTY への割り当てを無効にします。 デフォルトにおいて
                      `docker-compose exec` には TTY が割り当てられます。
    --index=index     サービスのインスタンスが複数ある場合に、そのコンテナーの
                      インデックスを指定します。[デフォルト: 1]
    -e, --env KEY=VAL 環境変数を設定します。
                      (複数の設定が可能。API 1.25 未満ではサポートされていません。)
    -w, --workdir DIR このコマンドのワークディレクトリのパスを指定します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
This is the equivalent of `docker exec`. With this subcommand you can run arbitrary
commands in your services. Commands are by default allocating a TTY, so you can
use a command such as `docker-compose exec web sh` to get an interactive prompt.
@y
このコマンドは`docker exec`と同じです。
このサブコマンドを使って、サービスに対する任意のコマンドを実行することができます。
コマンドはデフォルトでは TTY が割り当てられます。
したがって`docker-compose exec web sh`のようなコマンドを実行すると、対話可能なプロンプトを用いることができます。
@z
