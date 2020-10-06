%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Builds, (re)creates, starts, and attaches to containers for a service.
keywords: fig, composition, compose, docker, orchestration, cli,  up
title: docker-compose up
notoc: true
---
@y
---
description: Builds, (re)creates, starts, and attaches to containers for a service.
keywords: fig, composition, compose, docker, orchestration, cli,  up
title: docker-compose up
notoc: true
---
@z

@x
```none
Usage: up [options] [--scale SERVICE=NUM...] [SERVICE...]

Options:
    -d, --detach               Detached mode: Run containers in the background,
                               print new container names. Incompatible with
                               --abort-on-container-exit.
    --no-color                 Produce monochrome output.
    --quiet-pull               Pull without printing progress information
    --no-deps                  Don't start linked services.
    --force-recreate           Recreate containers even if their configuration
                               and image haven't changed.
    --always-recreate-deps     Recreate dependent containers.
                               Incompatible with --no-recreate.
    --no-recreate              If containers already exist, don't recreate
                               them. Incompatible with --force-recreate and -V.
    --no-build                 Don't build an image, even if it's missing.
    --no-start                 Don't start the services after creating them.
    --build                    Build images before starting containers.
    --abort-on-container-exit  Stops all containers if any container was
                               stopped. Incompatible with -d.
    --attach-dependencies      Attach to dependent containers.
    -t, --timeout TIMEOUT      Use this timeout in seconds for container
                               shutdown when attached or when containers are
                               already running. (default: 10)
    -V, --renew-anon-volumes   Recreate anonymous volumes instead of retrieving
                               data from the previous containers.
    --remove-orphans           Remove containers for services not defined
                               in the Compose file.
    --exit-code-from SERVICE   Return the exit code of the selected service
                               container. Implies --abort-on-container-exit.
    --scale SERVICE=NUM        Scale SERVICE to NUM instances. Overrides the
                               `scale` setting in the Compose file if present.
```
@y
{% comment %}
```none
Usage: up [options] [--scale SERVICE=NUM...] [SERVICE...]

Options:
    -d, --detach               Detached mode: Run containers in the background,
                               print new container names. Incompatible with
                               --abort-on-container-exit.
    --no-color                 Produce monochrome output.
    --quiet-pull               Pull without printing progress information
    --no-deps                  Don't start linked services.
    --force-recreate           Recreate containers even if their configuration
                               and image haven't changed.
    --always-recreate-deps     Recreate dependent containers.
                               Incompatible with --no-recreate.
    --no-recreate              If containers already exist, don't recreate
                               them. Incompatible with --force-recreate and -V.
    --no-build                 Don't build an image, even if it's missing.
    --no-start                 Don't start the services after creating them.
    --build                    Build images before starting containers.
    --abort-on-container-exit  Stops all containers if any container was
                               stopped. Incompatible with -d.
    --attach-dependencies      Attach to dependent containers.
    -t, --timeout TIMEOUT      Use this timeout in seconds for container
                               shutdown when attached or when containers are
                               already running. (default: 10)
    -V, --renew-anon-volumes   Recreate anonymous volumes instead of retrieving
                               data from the previous containers.
    --remove-orphans           Remove containers for services not defined
                               in the Compose file.
    --exit-code-from SERVICE   Return the exit code of the selected service
                               container. Implies --abort-on-container-exit.
    --scale SERVICE=NUM        Scale SERVICE to NUM instances. Overrides the
                               `scale` setting in the Compose file if present.
```
{% endcomment %}
```none
利用方法: up [オプション] [--scale SERVICE=NUM...] [SERVICE...]

オプション:
    -d, --detach               デタッチモード。コンテナーをバックグラウンド起動し、
                               新たなコンテナー名を表示します。
                               --abort-on-container-exit と同時に使えません。
    --no-color                 白黒の画面出力を行ないます。
    --quiet-pull               プルする際に処理実行中の情報を表示しません。
    --no-deps                  リンクされているサービスを起動しません。
    --force-recreate           コンテナーの設定やイメージに変更がなくても
                               コンテナーを再生成します。
    --always-recreate-deps     依存コンテナーを再生成します。
                               --no-recreate と同時に使えません。
    --no-recreate              コンテナーが存在していれば再生成しません。
                               --force-recreate および -V と同時に使えません。
    --no-build                 イメージがなかったとしてもビルドの生成を行いません。
    --no-start                 サービスの生成後にその起動は行いません。
    --build                    コンテナー起動前にイメージをビルドします。
    --abort-on-container-exit  コンテナーのいずれかが停止したときにコンテナーすべて
                               を停止します。-d と同時に使えません。
    --attach-dependencies      依存するコンテナーにアタッチします。
    -t, --timeout TIMEOUT      アタッチあるいは起動されているコンテナーのシャット
                               ダウンに要するタイムアウト時間を秒数で指定します。
                               （デフォルト: 10）
    -V, --renew-anon-volumes   前回のコンテナーからデータ抽出を行わずに、匿名の
                               ボリュームを生成します。
    --remove-orphans           Compose ファイルに定義されていないサービスコンテナー
                               を削除します。
    --exit-code-from SERVICE   指定されたサービスコンテナーの終了コードを返します。
                               --abort-on-container-exit の指定を暗に含みます。
    --scale SERVICE=NUM        SERVICE のインスタンス数を NUM とします。Compose
                               ファイルに `scale` の設定があっても上書きされます。
```
@z

@x
Builds, (re)creates, starts, and attaches to containers for a service.
@y
{% comment %}
Builds, (re)creates, starts, and attaches to containers for a service.
{% endcomment %}
サービスコンテナーのビルド、（再）生成、起動、アタッチを行います。
@z

@x
Unless they are already running, this command also starts any linked services.
@y
{% comment %}
Unless they are already running, this command also starts any linked services.
{% endcomment %}
リンクされているサービスがまだ起動していない場合は、それらも起動します。
@z

@x
The `docker-compose up` command aggregates the output of each container (essentially running `docker-compose logs -f`). When
the command exits, all containers are stopped. Running `docker-compose up -d`
starts the containers in the background and leaves them running.
@y
{% comment %}
The `docker-compose up` command aggregates the output of each container (essentially running `docker-compose logs -f`). When
the command exits, all containers are stopped. Running `docker-compose up -d`
starts the containers in the background and leaves them running.
{% endcomment %}
`docker-compose up` コマンドは、各コンテナーからの出力をすべてまとめます（`docker-compose logs -f` の実行と同じです）。 
コマンドが終了すると、コンテナーはすべて停止します。
`docker-compose up -d` を実行すると、コンテナーはバックグラウンドで起動し、そのまま実行し続けます。
@z

@x
If there are existing containers for a service, and the service's configuration
or image was changed after the container's creation, `docker-compose up` picks
up the changes by stopping and recreating the containers (preserving mounted
volumes). To prevent Compose from picking up changes, use the `--no-recreate`
flag.
@y
{% comment %}
If there are existing containers for a service, and the service's configuration
or image was changed after the container's creation, `docker-compose up` picks
up the changes by stopping and recreating the containers (preserving mounted
volumes). To prevent Compose from picking up changes, use the `--no-recreate`
flag.
{% endcomment %}
サービスコンテナーが存在していて、そのコンテナーの生成以降に、サービスの設定やイメージが変更された場合、`docker-compose up` コマンドはその変更を検知しコンテナーの停止および再生成を行います（マウントボリュームはそのまま維持されます）。
変更の検知を行わないようにするには `--no-recreate` フラグを指定します。
@z

@x
If you want to force Compose to stop and recreate all containers, use the
`--force-recreate` flag.
@y
{% comment %}
If you want to force Compose to stop and recreate all containers, use the
`--force-recreate` flag.
{% endcomment %}
コンテナーすべてを強制的に停止および再生成するには `--force-recreate` フラグを指定します。
@z

@x
If the process encounters an error, the exit code for this command is `1`.  
If the process is interrupted using `SIGINT` (`ctrl` + `C`) or `SIGTERM`, the containers are stopped, and the exit code is `0`.  
If `SIGINT` or `SIGTERM` is sent again during this shutdown phase, the running containers are killed, and the exit code is `2`.
@y
{% comment %}
If the process encounters an error, the exit code for this command is `1`.  
If the process is interrupted using `SIGINT` (`ctrl` + `C`) or `SIGTERM`, the containers are stopped, and the exit code is `0`.  
If `SIGINT` or `SIGTERM` is sent again during this shutdown phase, the running containers are killed, and the exit code is `2`.
{% endcomment %}
処理過程においてエラーが発生した場合、このコマンドは終了コード `1` を返します。
`SIGINT` (`ctrl` + `C`) や `SIGTERM` によって処理が中断した場合、コンテナーはすべて停止し、終了コード `0` を返します。
シャットダウン過程において `SIGINT` や `SIGTERM` が再度送信された場合、起動しているコンテナーのプロセスは強制終了され、終了コード `2` を返します。
@z
