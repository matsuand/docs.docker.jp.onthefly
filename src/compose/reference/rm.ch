%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Removes stopped service containers.
keywords: fig, composition, compose, docker, orchestration, cli,  rm
title: docker-compose rm
notoc: true
---
@y
---
description: Removes stopped service containers.
keywords: fig, composition, compose, docker, orchestration, cli,  rm
title: docker-compose rm
notoc: true
---
@z

@x
```none
Usage: rm [options] [SERVICE...]

Options:
    -f, --force   Don't ask to confirm removal
    -s, --stop    Stop the containers, if required, before removing
    -v            Remove any anonymous volumes attached to containers
    -a, --all     Deprecated - no effect.
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
Usage: rm [options] [SERVICE...]

Options:
    -f, --force   Don't ask to confirm removal
    -s, --stop    Stop the containers, if required, before removing
    -v            Remove any anonymous volumes attached to containers
    -a, --all     Deprecated - no effect.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: rm [オプション] [SERVICE...]

オプション:
    -f, --force   削除確認を行いません。
    -s, --stop    削除の前に必要に応じてコンテナーを停止します。
    -v            コンテナーに割り当てられている匿名ボリュームをすべて削除します。
    -a, --all     廃止機能。何もしません。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Removes stopped service containers.
@y
停止中のサービスコンテナーを削除します。
@z

@x
By default, anonymous volumes attached to containers are not removed. You
can override this with `-v`. To list all volumes,  use `docker volume ls`.
@y
コンテナーに割り当てられている匿名ボリュームは、デフォルトでは削除されません。
この動作は`-v`を使ってオーバーライドすることができます。
ボリュームすべてを一覧表示するには`docker volume ls`を実行します。
@z

@x
Any data which is not in a volume is lost.
@y
ボリューム内にはないデータは、すべて失われます。
@z

@x
Running the command with no options also removes one-off containers created
by `docker-compose up` or `docker-compose run`:
@y
オプションを指定せずにこのコマンドを実行した場合は、`docker-compose up`や`docker-compose run`によって生成されたコンテナー一式も削除されます。
@z

@x
```none
$ docker-compose rm
Going to remove djangoquickstart_web_run_1
Are you sure? [yN] y
Removing djangoquickstart_web_run_1 ... done
```
@y
```none
$ docker-compose rm
Going to remove djangoquickstart_web_run_1
Are you sure? [yN] y
Removing djangoquickstart_web_run_1 ... done
```
@z
