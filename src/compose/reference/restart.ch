%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Restarts Docker Compose services.
keywords: fig, composition, compose, docker, orchestration, cli,  restart
title: docker-compose restart
notoc: true
---
@y
---
description: Restarts Docker Compose services.
keywords: fig, composition, compose, docker, orchestration, cli,  restart
title: docker-compose restart
notoc: true
---
@z

@x
```none
Usage: docker-compose restart [options] [SERVICE...]

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
Usage: docker-compose restart [options] [SERVICE...]

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
利用方法: docker-compose restart [オプション] [サービス名...]

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
Restarts all stopped and running services.
@y
停止中および実行中のサービスを再起動します。
@z

@x
If you make changes to your `docker-compose.yml` configuration these changes are not reflected after running this command.
@y
`docker-compose.yml`の設定を変更していたとしても、このコマンド実行後にその変更内容は反映されません。
@z

@x
For example, changes to environment variables (which are added after a container is built, but before the container's command is executed) are not updated after restarting.
@y
たとえば環境変数への設定変更（コンテナーのビルド後に追加した場合や、コンテナーコマンドが実行される前である場合）は、再起動を行っても設定更新されません。
@z

@x
If you are looking to configure a service's restart policy, please refer to
[restart](../compose-file/compose-file-v3.md#restart) in Compose file v3 and
[restart](../compose-file/compose-file-v2.md#restart) in Compose v2. Note that if
you are [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md),
you should use [restart_policy](../compose-file/compose-file-v3.md#restart_policy), instead.
@y
サービスの再起動ポリシーに関する情報については、Compose ファイル v3 の [restart](../compose-file/compose-file-v3.md#restart) や Compose v2 の [restart](../compose-file/compose-file-v2.md#restart) を参照してください。
なお [Swarm モードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には、それとは違って [restart_policy](../compose-file/compose-file-v3.md#restart_policy) を用いることが必要です。
@z
