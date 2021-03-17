%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to use Docker Compose's extends keyword to share configuration between files and projects
keywords: fig, composition, compose, docker, orchestration, documentation, docs
title: Share Compose configurations between files and projects
---
@y
---
description: How to use Docker Compose's extends keyword to share configuration between files and projects
keywords: fig, composition, compose, docker, orchestration, documentation, docs
title: ファイル間、プロジェクト間での Compose 設定の共有
---
@z

@x
Compose supports two methods of sharing common configuration:
@y
Compose がサポートする設定共有には 2 つの方法があります。
@z

@x
1. Extending an entire Compose file by
   [using multiple Compose files](extends.md#multiple-compose-files)
2. Extending individual services with [the `extends` field](extends.md#extending-services) (for Compose file versions up to 2.1)
@y
1. Compose ファイル全体を [複数の Compose ファイルの利用](extends.md#multiple-compose-files) により拡張します。
2. 個々のサービスを [`extends`フィールド](extends.md#extending-services) を使って拡張します（Compose ファイルバージョン 2.1 まで）。
@z

@x
## Multiple Compose files
@y
## 複数の Compose ファイルの利用
{: #multiple-compose-files }
@z

@x
Using multiple Compose files enables you to customize a Compose application
for different environments or different workflows.
@y
Compose ファイルを複数利用することにすれば、Compose によるアプリケーションを異なる環境、異なる作業フローに合わせてカスタマイズできます。
@z

@x
### Understanding multiple Compose files
@y
### Compose ファイルが複数ある意味
{: #understanding-multiple-compose-files }
@z

@x
By default, Compose reads two files, a `docker-compose.yml` and an optional
`docker-compose.override.yml` file. By convention, the `docker-compose.yml`
contains your base configuration. The override file, as its name implies, can
contain configuration overrides for existing services or entirely new
services.
@y
デフォルトにおいて Compose は 2 つのファイルを読み込みます。
`docker-compose.yml`と、必要に応じて編集する`docker-compose.override.yml`です。
慣習として`docker-compose.yml`には基本的な設定を含めます。
`docker-compose.override.yml`ファイルは、オーバーライドという表現が含まれていることから分かるように、既存のサービスあるいは新たに起動する全サービスに対しての上書き設定を行うものです。
@z

@x
If a service is defined in both files, Compose merges the configurations using
the rules described in
[Adding and overriding configuration](extends.md#adding-and-overriding-configuration).
@y
サービスの定義が両方のファイルに存在した場合、Compose は [設定の追加と上書き](extends.md#adding-and-overriding-configuration) に示すルールに従って定義設定をマージします。
@z

@x
To use multiple override files, or an override file with a different name, you
can use the `-f` option to specify the list of files. Compose merges files in
the order they're specified on the command line. See the
[`docker-compose` command reference](reference/overview.md) for more information
about using `-f`.
@y
複数の上書きファイルがある場合、あるいは上書きファイルが 1 つであってもその名前を別にしている場合、`-f`オプションを使って、ファイル名を列記して指定することができます。
Compose はコマンドライン上に指定された順に、設定ファイルをマージします。
詳細は [`docker-compose`コマンドリファレンス](reference/overview.md) の`-f`オプションに関する情報を参照してください。
@z

@x
When you use multiple configuration files, you must make sure all paths in the
files are relative to the base Compose file (the first Compose file specified
with `-f`). This is required because override files need not be valid
Compose files. Override files can contain small fragments of configuration.
Tracking which fragment of a service is relative to which path is difficult and
confusing, so to keep paths easier to understand, all paths must be defined
relative to the base file.
@y
複数の設定ファイルを利用する場合、各ファイルに記述されるパスは、基準となる Compose ファイル（1 つめの`-f`により指定された Compose ファイル）からの相対パスである必要があります。
これは上書きするファイルが Compose ファイルとして有効である必要がないからです。
上書きファイル内は、設定項目が部分的に含まれているだけで構いません。
サービスに対する定義部分がどのパスからの相対パスとして定義されているのかといったことを追っていくのは、なかなか難しく理解しづらくなります。
そこでパスを理解しやすくするために、パス指定はすべて、ベースとなるファイルからの相対パスとして定義するものとしています。
@z

@x
### Example use case
@y
### 利用例
{: #example-use-case }
@z

@x
In this section, there are two common use cases for multiple Compose files: changing a
Compose app for different environments, and running administrative tasks
against a Compose app.
@y
この節では複数の Compose ファイルを利用する標準的な例を 2 つ示します。
1 つは Compose アプリを異なる環境向けに切り替えるもの。
もう 1 つは Compose アプリに対して管理タスクを実行するものです。
@z

@x
#### Different environments
@y
#### 異なる環境向けの例
{: #different-environments }
@z

@x
A common use case for multiple files is changing a development Compose app
for a production-like environment (which may be production, staging or CI).
To support these differences, you can split your Compose configuration into
a few different files:
@y
複数の設定ファイルを利用する例としてよくあるのは、開発環境向けの Compose アプリを、本番環境向けなど（本番環境、ステージング環境、CI 環境など）に切り替える場合です。
こういった環境の違いに対応するには、Compose 設定ファイルをいくつかの設定ファイルに切り分けて行います。
@z

@x
Start with a base file that defines the canonical configuration for the
services.
@y
まずはサービスの標準設定を行うベースファイルから始めます。
@z

@x
**docker-compose.yml**
@y
**docker-compose.yml**
@z

@x
```yaml
web:
  image: example/my_web_app:latest
  depends_on:
    - db
    - cache
@y
```yaml
web:
  image: example/my_web_app:latest
  depends_on:
    - db
    - cache
@z

@x
db:
  image: postgres:latest
@y
db:
  image: postgres:latest
@z

@x
cache:
  image: redis:latest
```
@y
cache:
  image: redis:latest
```
@z

@x
In this example the development configuration exposes some ports to the
host, mounts our code as a volume, and builds the web image.
@y
この開発環境向け設定の例では、ホストに対してポートをいくつか公開し、ソースコードをボリュームとしてマウントした上で、ウェブイメージをビルドしています。
@z

@x
**docker-compose.override.yml**
@y
**docker-compose.override.yml**
@z

@x
```yaml
web:
  build: .
  volumes:
    - '.:/code'
  ports:
    - 8883:80
  environment:
    DEBUG: 'true'

db:
  command: '-d'
  ports:
    - 5432:5432

cache:
  ports:
    - 6379:6379
```
@y
```yaml
web:
  build: .
  volumes:
    - '.:/code'
  ports:
    - 8883:80
  environment:
    DEBUG: 'true'

db:
  command: '-d'
  ports:
    - 5432:5432

cache:
  ports:
    - 6379:6379
```
@z

@x
When you run `docker-compose up` it reads the overrides automatically.
@y
`docker-compose up`を実行すると、上書き用の設定ファイルが自動的に読み込まれます。
@z

@x
Now, it would be nice to use this Compose app in a production environment. So,
create another override file (which might be stored in a different git
repo or managed by a different team).
@y
この Compose アプリは、このままでも十分に本番環境向けとすることができます。
ただここでは、別の上書きファイルを生成します（このファイルは別の git リポジトリに含まれているとか、別の開発チームが管理するものであるかもしれません）。
@z

@x
**docker-compose.prod.yml**
@y
**docker-compose.prod.yml**
@z

@x
```yaml
web:
  ports:
    - 80:80
  environment:
    PRODUCTION: 'true'

cache:
  environment:
    TTL: '500'
```
@y
```yaml
web:
  ports:
    - 80:80
  environment:
    PRODUCTION: 'true'

cache:
  environment:
    TTL: '500'
```
@z

@x
To deploy with this production Compose file you can run
@y
この本番環境向け Compose ファイルをデプロイするために、以下を実行します。
@z

@x
```console
$ docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```
@y
```console
$ docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```
@z

@x
This deploys all three services using the configuration in
`docker-compose.yml` and `docker-compose.prod.yml` (but not the
dev configuration in `docker-compose.override.yml`).
@y
これによって 3 つのサービスすべてがデプロイされますが、利用される設定は`docker-compose.yml`と`docker-compose.prod.yml`から読み込まれたものです（`docker-compose.override.yml`内の開発環境向け設定は利用されません。）。
@z

@x
See [production](production.md) for more information about Compose in
production.
@y
本番環境での Compose 利用に関する情報は、[本番環境での Compose の利用](production.md) を参照してください。
@z

@x
#### Administrative tasks
@y
#### 管理タスクの例
{: #administrative-tasks }
@z

@x
Another common use case is running adhoc or administrative tasks against one
or more services in a Compose app. This example demonstrates running a
database backup.
@y
よく行われるもう 1 つの例は、Compose アプリにおけるサービスに対して、特別なタスクあるいは管理タスクを実行する場合です。
ここでは、データベースバックアップを実行する例を示します。
@z

@x
Start with a **docker-compose.yml**.
@y
**docker-compose.yml** から始めます。
@z

@x
```yaml
web:
  image: example/my_web_app:latest
  depends_on:
    - db

db:
  image: postgres:latest
```
@y
```yaml
web:
  image: example/my_web_app:latest
  depends_on:
    - db

db:
  image: postgres:latest
```
@z

@x
In a **docker-compose.admin.yml** add a new service to run the database
export or backup.
@y
**docker-compose.admin.yml** において、新しいサービスを追加して、データベースのエクスポートまたはバックアップを行うようにします。
@z

@x
```yaml
    dbadmin:
      build: database_admin/
      depends_on:
        - db
```
@y
```yaml
    dbadmin:
      build: database_admin/
      depends_on:
        - db
```
@z

@x
To start a normal environment run `docker-compose up -d`. To run a database
backup, include the `docker-compose.admin.yml` as well.
@y
通常の環境を起動するときは`docker-compose up -d`を実行します。
またデータベースバックアップを実行するときは、`docker-compose.admin.yml`も含めるようにして実行します。
@z

@x
```console
$ docker-compose -f docker-compose.yml -f docker-compose.admin.yml \
  run dbadmin db-backup
```
@y
```console
$ docker-compose -f docker-compose.yml -f docker-compose.admin.yml \
  run dbadmin db-backup
```
@z

@x
## Extending services
@y
## サービスの拡張
{: #extending-services }
@z

@x
> **Note**
>
> The `extends` keyword is supported in earlier Compose file formats up to Compose
> file version 2.1 (see [extends in v2](compose-file/compose-file-v2.md#extends)), but is
> not supported in Compose version 3.x. See the [Version 3 summary](compose-file/compose-versioning.md#version-3)
> of keys added and removed, along with information on [how to upgrade](compose-file/compose-versioning.md#upgrading).
> See [moby/moby#31101](https://github.com/moby/moby/issues/31101) to follow the
> discussion thread on the possibility of adding support for `extends` in some form in
> future versions.
@y
> **メモ**
>
> キーワード`extends`は、かつての Compose ファイルフォーマットバージョン 2.1 までにおいてサポートされます。
> （[バージョン 2 における extends](compose-file/compose-file-v2.md#extends) を参照のこと。）
> これは Compose バージョン 3.x ではサポートされていません。
> キーワードの追加、削除に関しては [バージョン 3 のまとめ](compose-file/compose-versioning.md#version-3) や [アップグレード方法](compose-file/compose-versioning.md#upgrading) を参照してください。
> また [moby/moby#31101](https://github.com/moby/moby/issues/31101) では、将来のバージョンにおいて何らかの形式で`extends`をサポートする可能性について議論するスレッドがありますので、確認してみてください。
@z

@x
Docker Compose's `extends` keyword enables the sharing of common configurations
among different files, or even different projects entirely. Extending services
is useful if you have several services that reuse a common set of configuration
options. Using `extends` you can define a common set of service options in one
place and refer to it from anywhere.
@y
Docker Compose の`extends`キーワードを使うと、さまざまな設定ファイルに共通する内容を共有することができます。
それはまったく別のプロジェクト間でも可能です。
ごく標準的な設定オプションを再利用しているサービスがいくつもある場合に、このサービス拡張機能を活用することができます。
`extends`を使って標準的なサービスオプションを 1 箇所に定義しておけば、それをどこからでも参照することができます。
@z

@x
Keep in mind that `volumes_from` and `depends_on` are never shared between
services using `extends`. These exceptions exist to avoid implicit
dependencies; you always define `volumes_from` locally. This ensures
dependencies between services are clearly visible when reading the current file.
Defining these locally also ensures that changes to the referenced file don't
break anything.
@y
`volumes_from`、`depends_on`は、`extends`を利用したサービス間での共有はされません。
これらが例外となっているのは、気づかないうちに依存関係が発生してしまうことを避けるためです。
`volumes_from`はいつもローカルな定義に利用するものです。
こうしているからこそ、そのときの設定ファイルを読めば、サービス間の依存関係がはっきりわかることになります。
ローカルに定義しておくのは、参照されている側のファイルに変更が加わっても、影響がなく済むことにもつながります。
@z

@x
### Understand the extends configuration
@y
### extends によるサービス拡張設定の理解
{: #understand-the-extends-configuration }
@z

@x
When defining any service in `docker-compose.yml`, you can declare that you are
extending another service like this:
@y
`docker-compose.yml`内にサービスを定義するときには、どのようなサービスであっても、別のサービスを拡張するように宣言できます。
たとえば以下のとおりです。
@z

@x
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
```
@y
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
```
@z

@x
This instructs Compose to re-use the configuration for the `webapp` service
defined in the `common-services.yml` file. Suppose that `common-services.yml`
looks like this:
@y
上の設定は Compose に対して、`common-services.yml`ファイル内に定義されている`webapp`サービスの設定を再利用することを指示しています。
`common-services.yml`は以下のようになっているとします。
@z

@x
```yaml
services:
  webapp:
    build: .
    ports:
      - "8000:8000"
    volumes:
      - "/data"
```
@y
```yaml
services:
  webapp:
    build: .
    ports:
      - "8000:8000"
    volumes:
      - "/data"
```
@z

@x
In this case, you get exactly the same result as if you wrote
`docker-compose.yml` with the same `build`, `ports` and `volumes` configuration
values defined directly under `web`.
@y
この例では、`docker-compose.yml`ファイル内の`web`の直下に、`build`、`ports`、`volumes`の設定を行った場合と同じ結果を得ることができます。
@z

@x
You can go further and define (or re-define) configuration locally in
`docker-compose.yml`:
@y
さらに`docker-compose.yml`内には、ローカルでの設定内容を定義あるいは再定義することができます。
@z

@x
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
    environment:
      - DEBUG=1
    cpu_shares: 5

  important_web:
    extends: web
    cpu_shares: 10
```
@y
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
    environment:
      - DEBUG=1
    cpu_shares: 5

  important_web:
    extends: web
    cpu_shares: 10
```
@z

@x
You can also write other services and link your `web` service to them:
@y
また他のサービスを記述して、`web`サービスからそのサービスへリンクすることも可能です。
@z

@x
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
    environment:
      - DEBUG=1
    cpu_shares: 5
    depends_on:
      - db
  db:
    image: postgres
```
@y
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
    environment:
      - DEBUG=1
    cpu_shares: 5
    depends_on:
      - db
  db:
    image: postgres
```
@z

@x
### Example use case
@y
### 利用例
{: #example-use-case }
@z

@x
Extending an individual service is useful when you have multiple services that
have a common configuration.  The example below is a Compose app with
two services: a web application and a queue worker. Both services use the same
codebase and share many configuration options.
@y
複数のサービスを利用していてそこに共通設定が存在する場合に、単独のサービスを拡張することができるかもしれません。
以下の例では Compose アプリにおいて 2 つのサービスがあります。
ウェブアプリケーションとキューワーカー（queue worker）です。
この 2 つのサービスは同一のコードを用いるものであり、多くの設定オプションを共有します。
@z

@x
In a **common.yml** we define the common configuration:
@y
**common.yml** では共通する設定を定義します。
@z

@x
```yaml
services:
  app:
    build: .
    environment:
      CONFIG_FILE_PATH: /code/config
      API_KEY: xxxyyy
    cpu_shares: 5
```
@y
```yaml
services:
  app:
    build: .
    environment:
      CONFIG_FILE_PATH: /code/config
      API_KEY: xxxyyy
    cpu_shares: 5
```
@z

@x
In a **docker-compose.yml** we define the concrete services which use the
common configuration:
@y
**docker-compose.yml** では、上の共通設定を利用する具体的なサービスを定義します。
@z

@x
```yaml
services:
  webapp:
    extends:
      file: common.yml
      service: app
    command: /code/run_web_app
    ports:
      - 8080:8080
    depends_on:
      - queue
      - db

  queue_worker:
    extends:
      file: common.yml
      service: app
    command: /code/run_worker
    depends_on:
      - queue
```
@y
```yaml
services:
  webapp:
    extends:
      file: common.yml
      service: app
    command: /code/run_web_app
    ports:
      - 8080:8080
    depends_on:
      - queue
      - db

  queue_worker:
    extends:
      file: common.yml
      service: app
    command: /code/run_worker
    depends_on:
      - queue
```
@z

@x
## Adding and overriding configuration
@y
## 設定の追加と上書き
{: #adding-and-overriding-configuration }
@z

@x
Compose copies configurations from the original service over to the local one.
If a configuration option is defined in both the original service and the local
service, the local value *replaces* or *extends* the original value.
@y
Compose では、元からあったサービスの定義を、ローカルのサービス定義に向けてコピーします。
設定オプションが元々のサービスとローカルのサービスの両方にて定義されていた場合は、元のサービスの値はローカルの値によって **置き換えられる**か、あるいは**拡張されます**。
@z

@x
For single-value options like `image`, `command` or `mem_limit`, the new value
replaces the old value.
@y
1 つの値しか持たないオプション、たとえば`image`、`command`、`mem_limit`のようなものは、古い値が新しい値に置き換えられます。
@z

@x
original service:
@y
元からのサービス
@z

@x
```yaml
services:
  myservice:
    # ...
    command: python app.py
```
@y
```yaml
services:
  myservice:
    # ...
    command: python app.py
```
@z

@x
local service:
@y
ローカル定義のサービス
@z

@x
```yaml
services:
  myservice:
    # ...
    command: python otherapp.py
```
@y
```yaml
services:
  myservice:
    # ...
    command: python otherapp.py
```
@z

@x
result:
@y
結果
@z

@x
```yaml
services:
  myservice:
    # ...
    command: python otherapp.py
```
@y
```yaml
services:
  myservice:
    # ...
    command: python otherapp.py
```
@z

@x
For the **multi-value options** `ports`, `expose`, `external_links`, `dns`,
`dns_search`, and `tmpfs`, Compose concatenates both sets of values:
@y
**複数の値を持つオプション**、`ports`、`expose`、`external_links`、`dns`、`dns_search`、`tmpfs`では、両者の設定をつなぎ合わせます。
@z

@x
original service:
@y
元からのサービス
@z

@x
```yaml
services:
  myservice:
    # ...
    expose:
      - "3000"
```
@y
```yaml
services:
  myservice:
    # ...
    expose:
      - "3000"
```
@z

@x
local service:
@y
ローカル定義のサービス
@z

@x
```yaml
services:
  myservice:
    # ...
    expose:
      - "4000"
      - "5000"
```
@y
```yaml
services:
  myservice:
    # ...
    expose:
      - "4000"
      - "5000"
```
@z

@x
result:
@y
結果
@z

@x
```yaml
services:
  myservice:
    # ...
    expose:
      - "3000"
      - "4000"
      - "5000"
```
@y
```yaml
services:
  myservice:
    # ...
    expose:
      - "3000"
      - "4000"
      - "5000"
```
@z

@x
In the case of `environment`, `labels`, `volumes`, and `devices`, Compose
"merges" entries together with locally-defined values taking precedence. For
`environment` and `labels`, the environment variable or label name determines
which value is used:
@y
`environment`、`labels`、`volumes`、`devices`の場合、Compose は設定内容を「マージ」して、ローカル定義の値が優先するようにします。
@z

@x
original service:
@y
元からのサービス
@z

@x
```yaml
services:
  myservice:
    # ...
    environment:
      - FOO=original
      - BAR=original
```
@y
```yaml
services:
  myservice:
    # ...
    environment:
      - FOO=original
      - BAR=original
```
@z

@x
local service:
@y
ローカル定義のサービス
@z

@x
```yaml
services:
  myservice:
    # ...
    environment:
      - BAR=local
      - BAZ=local
```
@y
```yaml
services:
  myservice:
    # ...
    environment:
      - BAR=local
      - BAZ=local
```
@z

@x
result
@y
結果
@z

@x
```yaml
services:
  myservice:
    # ...
    environment:
      - FOO=original
      - BAR=local
      - BAZ=local
```
@y
```yaml
services:
  myservice:
    # ...
    environment:
      - FOO=original
      - BAR=local
      - BAZ=local
```
@z

@x
Entries for `volumes` and `devices` are merged using the mount path in the
container:
@y
`volumes`や`devices`の設定内容は、コンテナーのマウントパスを使ってマージされます。
@z

@x
original service:
@y
元からのサービス
@z

@x
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./original:/foo
      - ./original:/bar
```
@y
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./original:/foo
      - ./original:/bar
```
@z

@x
local service:
@y
ローカル定義のサービス
@z

@x
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./local:/bar
      - ./local:/baz
```
@y
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./local:/bar
      - ./local:/baz
```
@z

@x
result:
@y
結果
@z

@x
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./original:/foo
      - ./local:/bar
      - ./local:/baz
```
@y
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./original:/foo
      - ./local:/bar
      - ./local:/baz
```
@z

@x
## Compose documentation
@y
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
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [はじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
