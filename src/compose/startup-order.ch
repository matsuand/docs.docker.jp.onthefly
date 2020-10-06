%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to control service startup and shutdown order in Docker Compose
keywords: documentation, docs, docker, compose, startup, shutdown, order
title: Control startup and shutdown order in Compose
notoc: true
---
@y
---
description: Docker Compose においてサービスの起動順、停止順を制御する方法を説明します。
keywords: documentation, docs, docker, compose, startup, shutdown, order
title: Compose における起動、停止順の制御
notoc: true
---
@z

@x
You can control the order of service startup and shutdown with the
[depends_on](compose-file/index.md#depends_on) option. Compose always starts and stops
containers in dependency order, where dependencies are determined by
`depends_on`, `links`, `volumes_from`, and `network_mode: "service:..."`.
@y
{% comment %}
You can control the order of service startup and shutdown with the
[depends_on](compose-file/index.md#depends_on) option. Compose always starts and stops
containers in dependency order, where dependencies are determined by
`depends_on`, `links`, `volumes_from`, and `network_mode: "service:..."`.
{% endcomment %}
サービスの起動順や停止順は、[depends_on](compose-file/index.md#depends_on) オプションを使って制御することができます。
Compose では必ず依存順に応じて、コンテナーの起動または停止を行いますが、この依存順とは `depends_on`、`links`、`volumes_from`、`network_mode: "service:..."` によって決定します。
@z

@x
However, for startup Compose does not wait until a container is "ready" (whatever that means
for your particular application) - only until it's running. There's a good
reason for this.
@y
{% comment %}
However, for startup Compose does not wait until a container is "ready" (whatever that means
for your particular application) - only until it's running. There's a good
reason for this.
{% endcomment %}
しかし起動時の場合、Compose はコンテナーが "準備状態" になって初めて制御を待ちます。
（これがアプリケーションにとってどのような意味になるかには無関係です。）
つまり稼動していることが必要です。
これには十分な理由があります。
@z

@x
The problem of waiting for a database (for example) to be ready is really just
a subset of a much larger problem of distributed systems. In production, your
database could become unavailable or move hosts at any time. Your application
needs to be resilient to these types of failures.
@y
{% comment %}
The problem of waiting for a database (for example) to be ready is really just
a subset of a much larger problem of distributed systems. In production, your
database could become unavailable or move hosts at any time. Your application
needs to be resilient to these types of failures.
{% endcomment %}
たとえばデータベースが準備状態になるまで待ち続けたとすると、分散システムにおいては非常に大きな問題となります。
本番環境であれば利用不能となって、すぐにホストを切り替えなければならなくなります。
アプリケーションは、このような状況に柔軟に対応できるものでなくてはなりません。
@z

@x
To handle this, design your application to attempt to re-establish a connection to
the database after a failure. If the application retries the connection,
it can eventually connect to the database.
@y
{% comment %}
To handle this, design your application to attempt to re-establish a connection to
the database after a failure. If the application retries the connection,
it can eventually connect to the database.
{% endcomment %}
こういったことを取り扱う際には、データベースへの接続に失敗した後に、接続を再度確立するようにアプリケーションを設計しておくことが必要です。
アプリケーションが再接続を行えば、そのうちデータベースへの接続が成功します。
@z

@x
The best solution is to perform this check in your application code, both at
startup and whenever a connection is lost for any reason. However, if you don't
need this level of resilience, you can work around the problem with a wrapper
script:
@y
{% comment %}
The best solution is to perform this check in your application code, both at
startup and whenever a connection is lost for any reason. However, if you don't
need this level of resilience, you can work around the problem with a wrapper
script:
{% endcomment %}
最適な方法は、再接続をアプリケーションコード内で行うことです。
これは起動時にも行い、さらに何らかの理由で接続が断たれた際にも行います。
もっともそれほどの柔軟性を必要としないのであれば、以下のようなラッパースクリプトを使ってこの問題を回避する方法もあります。
@z

@x
- Use a tool such as [wait-for-it](https://github.com/vishnubob/wait-for-it),
  [dockerize](https://github.com/jwilder/dockerize), sh-compatible
  [wait-for](https://github.com/Eficode/wait-for), or [RelayAndContainers](https://github.com/jasonsychau/RelayAndContainers) template. These are small
  wrapper scripts which you can include in your application's image to
  poll a given host and port until it's accepting TCP connections.
@y
{% comment %}
- Use a tool such as [wait-for-it](https://github.com/vishnubob/wait-for-it),
  [dockerize](https://github.com/jwilder/dockerize), sh-compatible
  [wait-for](https://github.com/Eficode/wait-for), or [RelayAndContainers](https://github.com/jasonsychau/RelayAndContainers) template. These are small
  wrapper scripts which you can include in your application's image to
  poll a given host and port until it's accepting TCP connections.
{% endcomment %}
- [wait-for-it](https://github.com/vishnubob/wait-for-it)、
  [dockerize](https://github.com/jwilder/dockerize)、シェル互換の [wait-for](https://github.com/Eficode/wait-for)、[RelayAndContainers](https://github.com/jasonsychau/RelayAndContainers) テンプレートを利用します。
  これは非常に小さなラッパースクリプトです。
  これをアプリケーションイメージに含めて、指定されたホストが TCP 接続を受け入れるまでの間、指定ポートに問い合わせを行うようにすることができます。
@z

@x
  For example, to use `wait-for-it.sh` or `wait-for` to wrap your service's command:
@y
  {% comment %}
  For example, to use `wait-for-it.sh` or `wait-for` to wrap your service's command:
  {% endcomment %}
  たとえば `wait-for-it.sh` または `wait-for` を使って、サービスコマンドをラップするには以下のようにします。
@z

@x
  ```yaml
  version: "2"
  services:
    web:
      build: .
      ports:
        - "80:8000"
      depends_on:
        - "db"
      command: ["./wait-for-it.sh", "db:5432", "--", "python", "app.py"]
    db:
      image: postgres
  ```
@y
  ```yaml
  version: "2"
  services:
    web:
      build: .
      ports:
        - "80:8000"
      depends_on:
        - "db"
      command: ["./wait-for-it.sh", "db:5432", "--", "python", "app.py"]
    db:
      image: postgres
  ```
@z

@x
  > **Tip**
  >
  > There are limitations to this first solution. For example, it doesn't verify
  > when a specific service is really ready. If you add more arguments to the
  > command, use the `bash shift` command with a loop, as shown in the next
  > example.
@y
  {% comment %}
  > **Tip**
  >
  > There are limitations to this first solution. For example, it doesn't verify
  > when a specific service is really ready. If you add more arguments to the
  > command, use the `bash shift` command with a loop, as shown in the next
  > example.
  {% endcomment %}
  > **ヒント**
  >
  > この解決方法には限界があります。
  > たとえば指定するサービスが、本当に準備状態であるかどうかは確認できません。
  > コマンドにさらに引数を追加して `bash shift` を利用し、ループによって対処するのが次の例です。
@z

@x
- Alternatively, write your own wrapper script to perform a more application-specific
  health check. For example, you might want to wait until Postgres is ready to
  accept commands:
@y
{% comment %}
- Alternatively, write your own wrapper script to perform a more application-specific
  health check. For example, you might want to wait until Postgres is ready to
  accept commands:
{% endcomment %}
- 別の方法として、独自にラッパースクリプトを用意して、アプリケーション特有のヘルスチェックを実現することも考えられます。
  たとえば Postgres が完全に準備状態になって、コマンドを受け付けるようになるまで待ちたいとするなら、以下のスクリプトを用意します。
@z

@x
  ```bash
  #!/bin/sh
  # wait-for-postgres.sh

  set -e
  
  host="$1"
  shift
  cmd="$@"
  
  until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$host" -U "postgres" -c '\q'; do
    >&2 echo "Postgres is unavailable - sleeping"
    sleep 1
  done
  
  >&2 echo "Postgres is up - executing command"
  exec $cmd
  ```
@y
  ```bash
  #!/bin/sh
  # wait-for-postgres.sh

  set -e
  
  host="$1"
  shift
  cmd="$@"
  
  until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$host" -U "postgres" -c '\q'; do
    >&2 echo "Postgres is unavailable - sleeping"
    sleep 1
  done
  
  >&2 echo "Postgres is up - executing command"
  exec $cmd
  ```
@z

@x
  You can use this as a wrapper script as in the previous example, by setting:
@y
  {% comment %}
  You can use this as a wrapper script as in the previous example, by setting:
  {% endcomment %}
  このラッパースクリプトを先の例において利用するには、以下のように設定します。
@z

@x
  ```yaml
  command: ["./wait-for-postgres.sh", "db", "python", "app.py"]
  ```
@y
  ```yaml
  command: ["./wait-for-postgres.sh", "db", "python", "app.py"]
  ```
@z

@x
## Compose documentation
@y
{% comment %}
## Compose documentation
{% endcomment %}
## Compose ドキュメント
{: #compose-documentation }
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
{% comment %}
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
{% endcomment %}
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [はじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
