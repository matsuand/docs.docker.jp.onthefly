%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Runs a one-off command on a service.
keywords: fig, composition, compose, docker, orchestration, cli, run
title: docker-compose run
notoc: true
---
@y
---
description: Runs a one-off command on a service.
keywords: fig, composition, compose, docker, orchestration, cli, run
title: docker-compose run
notoc: true
---
@z

@x
```none
Usage:
    run [options] [-v VOLUME...] [-p PORT...] [-e KEY=VAL...] [-l KEY=VALUE...]
        SERVICE [COMMAND] [ARGS...]

Options:
    -d, --detach          Detached mode: Run container in the background, print
                          new container name.
    --name NAME           Assign a name to the container
    --entrypoint CMD      Override the entrypoint of the image.
    -e KEY=VAL            Set an environment variable (can be used multiple times)
    -l, --label KEY=VAL   Add or override a label (can be used multiple times)
    -u, --user=""         Run as specified username or uid
    --no-deps             Don't start linked services.
    --rm                  Remove container after run. Ignored in detached mode.
    -p, --publish=[]      Publish a container's port(s) to the host
    --service-ports       Run command with the service's ports enabled and mapped
                          to the host.
    --use-aliases         Use the service's network aliases in the network(s) the
                          container connects to.
    -v, --volume=[]       Bind mount a volume (default [])
    -T                    Disable pseudo-tty allocation. By default `docker-compose run`
                          allocates a TTY.
    -w, --workdir=""      Working directory inside the container
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
Usage:
    run [options] [-v VOLUME...] [-p PORT...] [-e KEY=VAL...] [-l KEY=VALUE...]
        SERVICE [COMMAND] [ARGS...]

Options:
    -d, --detach          Detached mode: Run container in the background, print
                          new container name.
    --name NAME           Assign a name to the container
    --entrypoint CMD      Override the entrypoint of the image.
    -e KEY=VAL            Set an environment variable (can be used multiple times)
    -l, --label KEY=VAL   Add or override a label (can be used multiple times)
    -u, --user=""         Run as specified username or uid
    --no-deps             Don't start linked services.
    --rm                  Remove container after run. Ignored in detached mode.
    -p, --publish=[]      Publish a container's port(s) to the host
    --service-ports       Run command with the service's ports enabled and mapped
                          to the host.
    --use-aliases         Use the service's network aliases in the network(s) the
                          container connects to.
    -v, --volume=[]       Bind mount a volume (default [])
    -T                    Disable pseudo-tty allocation. By default `docker-compose run`
                          allocates a TTY.
    -w, --workdir=""      Working directory inside the container
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法:
    run [オプション] [-v VOLUME...] [-p PORT...] [-e KEY=VAL...] [-l KEY=VALUE...]
        SERVICE [COMMAND] [ARGS...]

オプション:
    -d, --detach          コンテナーをバックグラウンドで実行し、実行された新たな
                          コンテナー ID を表示します。
    --name NAME           コンテナーに対して名前を割り当てます。
    --entrypoint CMD      イメージのエントリーポイントをオーバーライドします。
    -e KEY=VAL            環境変数を設定します。（複数指定が可能）
    -l, --label KEY=VAL   ラベルを追加またはオーバーライドします。（複数指定が可能）
    -u, --user=""         指定されたユーザーまたは UID によりコマンドを実行します。
    --no-deps             リンクされているサービスは起動しません。
    --rm                  終了時にコンテナーを削除します。デタッチモードでは無視されます。
    -p, --publish=[]      ホストに対してコンテナーのポートを公開します。
    --service-ports       サービスポートを有効にしホストへのマップを行ってコマンドを実行します。
    --use-aliases         コンテナーが接続するネットワークにおいて、サービスネットワークの
                          エイリアスを利用します。
    -v, --volume=[]       ボリュームをバインドマウントします。（デフォルト： []）
    -T                    擬似 TTY への割り当てを無効にします。デフォルトにおいて
                          `docker-compose run` には TTY が割り当てられます。
    -w, --workdir=""      コンテナー内のワーキングディレクトリを指定します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Runs a one-time command against a service. For example, the following command starts the `web` service and runs `bash` as its command.
@y
1 つのサービスに対して、1 コマンドだけ実行します。
たとえば以下のコマンドは`web`サービスを起動して、コマンドとして`bash`を実行します。
@z

@x
    docker-compose run web bash
@y
    docker-compose run web bash
@z

@x
Commands you use with `run` start in new containers with configuration defined by that of the service, including volumes, links, and other details. However, there are two important differences.
@y
`run`によって指定したコマンドは、定義されたサービス設定に基づいて生成された新たなコンテナー内において実行されます。
定義内容にはボリューム、リンクなどその他の項目も含みます。
ただしコマンド実行には大きな違いが 2 つあります。
@z

@x
First, the command passed by `run` overrides the command defined in the service configuration. For example, if the  `web` service configuration is started with `bash`, then `docker-compose run web python app.py` overrides it with `python app.py`.
@y
1 つは、`run`によって指定されたコマンドは、サービス設定において定義されたコマンドをオーバーライドするということです。
たとえば`web`サービスが、`bash`コマンドを実行するように設定されているとします。
これに対して`docker-compose run web python app.py`を実行すると、コマンドはオーバーライドされて`python app.py`となります。
@z

@x
The second difference is that the `docker-compose run` command does not create any of the ports specified in the service configuration. This prevents port collisions with already-open ports. If you *do want* the service's ports to be created and mapped to the host, specify the `--service-ports` flag:
@y
2 つめの違いは`docker-compose run`コマンドを実行した場合、サービス設定においてポートが指定されていてもポート生成は行わない点です。
これによりすでに開いているポートとの間での衝突が回避されます。
サービスポートを生成してホストへマッピングされて欲しい場合には`--service-ports`フラグを指定します。
@z

@x
    docker-compose run --service-ports web python manage.py shell
@y
    docker-compose run --service-ports web python manage.py shell
@z

@x
Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using `docker run`:
@y
別の方法として`--publish`または`-p`オプションを使って手動によるポートマッピングが指定できるので、`docker run`の実行時に以下のようにすることもできます。
@z

@x
    docker-compose run --publish 8080:80 -p 2022:22 -p 127.0.0.1:2021:21 web python manage.py shell
@y
    docker-compose run --publish 8080:80 -p 2022:22 -p 127.0.0.1:2021:21 web python manage.py shell
@z

@x
If you start a service configured with links, the `run` command first checks to see if the linked service is running and starts the service if it is stopped.  Once all the linked services are running, the `run` executes the command you passed it. For example, you could run:
@y
リンクが設定されているサービスを起動すると、`run`コマンドの実行においては、まずそのリンクサービスが実行されているかどうかがチェックされ、停止中であった場合にはそれを起動します
リンクサービスがすべて起動したら、指定されたコマンドが実行されます。
たとえば以下のようなコマンドを実行したとします。
@z

@x
    docker-compose run db psql -h db -U docker
@y
    docker-compose run db psql -h db -U docker
@z

@x
This opens an interactive PostgreSQL shell for the linked `db` container.
@y
上のコマンドはリンクされている`db`コンテナーにおいて PostgreSQL の対話シェルを開きます。
@z

@x
If you do not want the `run` command to start linked containers, use the `--no-deps` flag:
@y
`run`コマンド実行にあたってリンクコンテナーを起動したくない場合は`--no-deps`フラグを指定します。
@z

@x
    docker-compose run --no-deps web python manage.py shell
@y
    docker-compose run --no-deps web python manage.py shell
@z

@x
If you want to remove the container after running while overriding the container's restart policy, use the `--rm` flag:
@y
コンテナーの再起動ポリシーをオーバーライドして実行していて、終了後はコンテナー削除を行いたい場合には`--rm`フラグを指定します。
@z

@x
    docker-compose run --rm web python manage.py db upgrade
@y
    docker-compose run --rm web python manage.py db upgrade
@z

@x
This runs a database upgrade script, and removes the container when finished running, even if a restart policy is specified in the service configuration.
@y
上のコマンドはデータベースのアップデートスクリプトを実行します。
そして終了時にはコンテナーを削除します。
サービス設定において再起動ポリシーが設定されていても、その設定は無視されます。
@z
