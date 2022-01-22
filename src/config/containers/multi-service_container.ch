%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to run more than one process in a container
keywords: docker, supervisor, process management
redirect_from:
- /articles/using_supervisord/
- /engine/admin/multi-service_container/
- /engine/admin/using_supervisord/
- /engine/articles/using_supervisord/
title: Run multiple services in a container
---
@y
---
description: How to run more than one process in a container
keywords: docker, supervisor, process management
redirect_from:
- /articles/using_supervisord/
- /engine/admin/multi-service_container/
- /engine/admin/using_supervisord/
- /engine/articles/using_supervisord/
title: コンテナー内での複数サービス起動
---
@z

@x
A container's main running process is the `ENTRYPOINT` and/or `CMD` at the
end of the `Dockerfile`. It is generally recommended that you separate areas of
concern by using one service per container. That service may fork into multiple
processes (for example, Apache web server starts multiple worker processes).
It's ok to have multiple processes, but to get the most benefit out of Docker,
avoid one container being responsible for multiple aspects of your overall
application. You can connect multiple containers using user-defined networks and
shared volumes.
@y
コンテナーの主となる実行プロセスは、`Dockerfile`の最終部分に指定される`ENTRYPOINT`や`CMD`です。
1 つのコンテナーには 1 つのサービスを割り当てるということにすれば、気にかける箇所が絞られるので、一般的にはこれが推奨されます。
ただそのサービスからは、複数のプロセスがフォークされることもあります（たとえば Apache ウェブサーバーでは複数のワーカープロセスが起動されます）。
マルチプロセスとなることは、まったく問題ありません。
一方で、アプリケーションが持ついくつもの役割を 1 つのコンテナーに持たせることは、Docker の優れた機能を利用する観点からは避けるべきです。
コンテナーを複数にするのであれば、ユーザー定義のネットワークや共有ボリュームを利用して接続します。
@z

@x
The container's main process is responsible for managing all processes that it
starts. In some cases, the main process isn't well-designed, and doesn't handle
"reaping" (stopping) child processes gracefully when the container exits. If
your process falls into this category, you can use the `--init` option when you
run the container. The `--init` flag inserts a tiny init-process into the
container as the main process, and handles reaping of all processes when the
container exits. Handling such processes this way is superior to using a
full-fledged init process such as `sysvinit`, `upstart`, or `systemd` to handle
process lifecycle within your container.
@y
コンテナーのメインプロセスは、コンテナーそのものが起動させるプロセスすべてを管理するためにあります。
メインプロセスが十分に機能していないことが原因で、コンテナー終了時に子プロセスを適切に停止できないことがあります。
起動プロセスがこの手の事態に陥った場合は、コンテナー起動時に`--init`オプションを指定してみてください。
この`--init`フラグは、コンテナーのメインプロセスとして、非常に小さな初期化プロセスを埋め込みます。
この小さなプロセスが、コンテナー終了時の子プロセス停止を受け持つことになります。
子プロセスの扱いをこのようにするのは、本格的な初期化プロセス、たとえば`sysvinit`、`upstart`、`systemd`に比べて、コンテナー内部のプロセスのライフサイクルを適切に扱うことができるからです。
@z

@x
If you need to run more than one service within a container, you can accomplish
this in a few different ways.
@y
1 つのコンテナー内に複数のサービスを起動させる必要があるなら、方法はいくつかあります。
@z

@x
- Put all of your commands in a wrapper script, complete with testing and
  debugging information. Run the wrapper script as your `CMD`. This is a very
  naive example. First, the wrapper script:
@y
- 実行するコマンドをすべてラッパースクリプトに含めます。
  あらかじめテストやデバッグは行っておきます。
  そしてこのラッパースクリプトを`CMD`として実行します。
  以下は簡単な例です。
  まずはラッパースクリプトを生成します。
@z

@x
  ```bash
  #!/bin/bash
@y
  ```bash
  #!/bin/bash
@z

@x
  # Start the first process
  ./my_first_process &
  
  # Start the second process
  ./my_second_process &
  
  # Wait for any process to exit
  wait -n
  
  # Exit with status of process that exited first
  exit $?
@y
  # 1つめのプロセスを起動
  ./my_first_process &
  
  # 2つめのプロセスを起動
  ./my_second_process &
  
  # いずれかが終了するのを待つ
  wait -n
  
  # 最初に終了したプロセスのステータスを返す
  exit $?
@z

@x
  Next, the Dockerfile:
@y
  Dockerfile は以下のような記述とします。
@z

@x
  ```dockerfile
  # syntax=docker/dockerfile:1
  FROM ubuntu:latest
  COPY my_first_process my_first_process
  COPY my_second_process my_second_process
  COPY my_wrapper_script.sh my_wrapper_script.sh
  CMD ./my_wrapper_script.sh
  ```
@y
  ```dockerfile
  # syntax=docker/dockerfile:1
  FROM ubuntu:latest
  COPY my_first_process my_first_process
  COPY my_second_process my_second_process
  COPY my_wrapper_script.sh my_wrapper_script.sh
  CMD ./my_wrapper_script.sh
  ```
@z

@x
- If you have one main process that needs to start first and stay running but
  you temporarily need to run some other processes (perhaps to interact with
  the main process) then you can use bash's job control to facilitate that.
  First, the wrapper script:
@y
- 1 つのメインプロセスを起動させたら、そのまま起動し続ける場合です。
  一時的に別のプロセスをいくつか起動する（そしておそらくはメインプロセスと通信を行う）とします。
  この場合は bash のジョブ制御の機能を利用します。
  まずはラッパースクリプトを生成します。
@z

@x
  ```bash
  #!/bin/bash
@y
  ```bash
  #!/bin/bash
@z

@x
  # turn on bash's job control
  set -m
@y
  # ジョブ制御を有効にします。
  set -m
@z

@x
  # Start the primary process and put it in the background
  ./my_main_process &
@y
  # 1つめのプロセスをバックグラウンドで実行します。
  ./my_main_process &
@z

@x
  # Start the helper process
  ./my_helper_process
@y
  # ヘルパープロセスを実行します。
  ./my_helper_process
@z

@x
  # the my_helper_process might need to know how to wait on the
  # primary process to start before it does its work and returns
@y
  # この my_helper_process は自分の処理を開始して終了するためには、
  # 1つめのプロセスの動きを知っておく必要があるかもしれません。
@z

@x
  # now we bring the primary process back into the foreground
  # and leave it there
  fg %1
  ```
@y
  # ここで1つめのプロセスをフォアグラウンド実行に戻してそのままとします。
  fg %1
  ```
@z

@x
  ```dockerfile
  # syntax=docker/dockerfile:1
  FROM ubuntu:latest
  COPY my_main_process my_main_process
  COPY my_helper_process my_helper_process
  COPY my_wrapper_script.sh my_wrapper_script.sh
  CMD ./my_wrapper_script.sh
  ```
@y
  ```dockerfile
  # syntax=docker/dockerfile:1
  FROM ubuntu:latest
  COPY my_main_process my_main_process
  COPY my_helper_process my_helper_process
  COPY my_wrapper_script.sh my_wrapper_script.sh
  CMD ./my_wrapper_script.sh
  ```
@z

@x
- Use a process manager like `supervisord`. This is a moderately heavy-weight
  approach that requires you to package `supervisord` and its configuration in
  your image (or base your image on one that includes `supervisord`), along with
  the different applications it manages. Then you start `supervisord`, which
  manages your processes for you. Here is an example Dockerfile using this
  approach, that assumes the pre-written `supervisord.conf`, `my_first_process`,
  and `my_second_process` files all exist in the same directory as your
  Dockerfile.
@y
- `supervisord`のようなプロセスマネージャーを利用する場合です。
  これは少々面倒な方法です。
  これを行うためには、イメージ内に`supervisord`パッケージとその設定を含める必要があります。
  （あるいは`supervisord`が含まれているイメージをベースとします。）
  さらにそのパッケージが管理する別のアプリケーションが必要になってきます。
  その上で`supervisord`を起動させてプロセス管理を行います。
  以下はこの手法を利用する Dockerfile です。
  `supervisord.conf`、`my_first_process`、`my_second_process`の各ファイルは準備ができていて、Dockerfile と同一ディレクトリに存在しているとします。
@z

@x
  ```dockerfile
  # syntax=docker/dockerfile:1
  FROM ubuntu:latest
  RUN apt-get update && apt-get install -y supervisor
  RUN mkdir -p /var/log/supervisor
  COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
  COPY my_first_process my_first_process
  COPY my_second_process my_second_process
  CMD ["/usr/bin/supervisord"]
  ```
@y
  ```dockerfile
  # syntax=docker/dockerfile:1
  FROM ubuntu:latest
  RUN apt-get update && apt-get install -y supervisor
  RUN mkdir -p /var/log/supervisor
  COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
  COPY my_first_process my_first_process
  COPY my_second_process my_second_process
  CMD ["/usr/bin/supervisord"]
  ```
@z
