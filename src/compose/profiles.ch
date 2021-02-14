%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Using profiles with Compose
desription: Using profiles with Compose
keywords: cli, compose, profile, profiles reference
---
@y
---
title: Compose でのプロファイル利用
desription: Compose でのプロファイル利用。
keywords: cli, compose, profile, profiles reference
---
@z

@x
Profiles allow adjusting the Compose application model for various usages and
environments by selectively enabling services.
This is achieved by assigning each service to zero or more profiles. If
unassigned, the service is _always_ started but if assigned, it is only started
if the profile is activated.
@y
プロファイル（profile）は Compose アプリケーションモデルをさまざまな利用方法に合わせて調整するものです。
また有効とするサービスを選択した環境実現も行います。
具体的には各サービスに対して、プロファイルを割り当てない状態も含め、複数のプロファイルを割り当てます。
割り当てを行わなかった場合、そのサービスは **常に** 起動します。
一方割り当てを行った場合は、そのプロファイルがアクティブになった場合にのみサービスが起動します。
@z

@x
This allows one to define additional services in a single `docker-compose.yml` file
that should only be started in specific scenarios, e.g. for debugging or
development tasks.
@y
こういった機能があると、たとえばデバッグ時や開発タスク作業時といった特定の状況下においてのみ起動する追加のサービスを、同一の`docker-compose.yml`ファイル内に定義して実現することができます。
@z

@x
## Assigning profiles to services
@y
{: #assigning-profiles-to-services }
## サービスへのプロファイルの割り当て
@z

@x
Services are associated with profiles through the
[`profiles` attribute](compose-file/compose-file-v3.md#profiles) which takes an
array of profile names:
@y
サービスに対しては [`profiles`属性](compose-file/compose-file-v3.md#profiles) を通じてプロファイルを関連づけることができます。
この属性にはプロファイル名の配列を指定します。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  frontend:
    image: frontend
    profiles: ["frontend"]

  phpmyadmin:
    image: phpmyadmin
    depends_on:
      - db
    profiles:
      - debug

  backend:
    image: backend

  db:
    image: mysql
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  frontend:
    image: frontend
    profiles: ["frontend"]

  phpmyadmin:
    image: phpmyadmin
    depends_on:
      - db
    profiles:
      - debug

  backend:
    image: backend

  db:
    image: mysql
```
@z

@x
Here the services `frontend` and `phpmyadmin` are assigned to the profiles
`frontend` and `debug` respectively and as such are only started when their
respective profiles are enabled.
@y
ここでサービス`frontend`と`phpmyadmin`に対しては、それぞれ`frontend`と`debug`というプロファイルを割り当てています。
したがって個々のプロファイルが有効になっている場合にのみ、そのサービスが起動するものとなります。
@z

@x
Services without a `profiles` attribute will _always_ be enabled, i.e. in this
case running `docker-compose up` would only start `backend` and `db`.
@y
`profiles`属性が指定されていないサービスは **常に** 有効になります。
つまり上の例においては`docker-compose up`を実行すると、`backend`と`db`だけは必ず起動します。
@z

@x
Valid profile names follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@y
プロファイルに対する適切な名称は、正規表現`[a-zA-Z0-9][a-zA-Z0-9_.-]+`に従います。
@z

@x
> **Note**
>
> The core services of your application should not be assigned `profiles` so
> they will always be enabled and automatically started.
@y
> **メモ**
>
> アプリケーションにおいて中心的となるサービスに対しては、`profiles`を指定するべきではありません。
> 指定しなければ、そのサービスは常に有効であり、自動的に起動されます。
@z

@x
## Enabling profiles
@y
{: #enabling-profiles }
## プロファイルの有効化
@z

@x
To enable a profile supply the `--profile` [command-line option](reference/overview.md) or
use the [`COMPOSE_PROFILES` environment variable](reference/envvars.md#compose_profiles):
@y
プロファイルを有効にするには、[コマンドラインオプション](reference/overview.md)`--profile`を指定するか、あるいは [環境変数`COMPOSE_PROFILES`](reference/envvars.md#compose_profiles)を利用します。
@z

@x
```sh
$ docker-compose --profile debug up
$ COMPOSE_PROFILES=debug docker-compose up
```
@y
```sh
$ docker-compose --profile debug up
$ COMPOSE_PROFILES=debug docker-compose up
```
@z

@x
The above command would both start your application with the `debug` profile enabled.
Using the `docker-compose.yml` file above, this would start the services `backend`,
`db` and `phpmyadmin`.
@y
上のコマンド 2 つは、いずれもプロファイル`debug`を有効にしてアプリケーションを起動します。
前述の`docker-compose.yml`ファイルを利用している場合、これは`backend`、`db`、`phpmyadmin`の各サービスが起動することになります。
@z

@x
Multiple profiles can be specified by passing multiple `--profile` flags or
a comma-separated list for the `COMPOSE_PROFILES` environment variable:
@y
プロファイルは複数指定することができます。
その場合は`--profile`フラグを複数指定するか、あるいは環境変数`COMPOSE_PROFILES`に対してカンマ区切りのリストを指定します。
@z

@x
```sh
$ docker-compose --profile frontend --profile debug up
$ COMPOSE_PROFILES=frontend,debug docker-compose up
```
@y
```sh
$ docker-compose --profile frontend --profile debug up
$ COMPOSE_PROFILES=frontend,debug docker-compose up
```
@z

@x
## Auto-enabling profiles and dependency resolution
@y
{: #auto-enabling-profiles-and-dependency-resolution }
## プロファイルの自動有効化と依存関係の解決
@z

@x
When a service with assigned `profiles` is explicitly targeted on the command
line its profiles will be enabled automatically so you don't need to enable them
manually. This can be used for one-off services and debugging tools.
As an example consider this configuration:
@y
`profiles`が割り当てられているサービスに対して、コマンドラインからの明示的なプロファイル指定が行われた場合、そのプロファイルは自動的に有効になるため、手動で有効にするような操作は必要ありません。
手動操作が必要になるのは、一時的なサービスやデバッグツールを利用するような場合です。
ここでは例として以下の設定を行います。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  backend:
    image: backend

  db:
    image: mysql

  db-migrations:
    image: backend
    command: myapp migrate
    depends_on:
      - db
    profiles:
      - tools
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  backend:
    image: backend

  db:
    image: mysql

  db-migrations:
    image: backend
    command: myapp migrate
    depends_on:
      - db
    profiles:
      - tools
```
@z

@x
```sh
# will only start backend and db
$ docker-compose up -d
@y
```sh
# これはbackendとdbのみを起動します。
$ docker-compose up -d
@z

@x
# this will run db-migrations (and - if necessary - start db)
# by implicitly enabling profile `tools`
$ docker-compose run db-migrations
```
@y
# これはプロファイル`tools`は暗に有効化した上で、
# db-migrationsを実行します（必要に応じてdbも起動します）。
$ docker-compose run db-migrations
```
@z

@x
But keep in mind that `docker-compose` will only automatically enable the
profiles of the services on the command line and not of any dependencies. This
means that all services the targeted service `depends_on` must have a common
profile with it, be always enabled (by omitting `profiles`) or have a matching
profile enabled explicitly:
@y
ただしここで注意しておくことがあります。
`docker-compose`が有効化するプロファイルは、コマンドライン上から指定されたサービスに対するもののみです。
そこに依存するものに対しては有効化を行いません。
したがって指定された`depends_on`サービスに関連するサービスは、すべて共通のプロファイルに関連づいているか、常に有効化されるか（`profiles`を省略するか）、該当するプロファイルを明示的に有効化するといったことが必要になります。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: web

  mock-backend:
    image: backend
    profiles: ["dev"]
    depends_on:
      - db

  db:
    image: mysql
    profiles: ["dev"]

  phpmyadmin:
    image: phpmyadmin
    profiles: ["debug"]
    depends_on:
      - db
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: web

  mock-backend:
    image: backend
    profiles: ["dev"]
    depends_on:
      - db

  db:
    image: mysql
    profiles: ["dev"]

  phpmyadmin:
    image: phpmyadmin
    profiles: ["debug"]
    depends_on:
      - db
```
@z

@x
```sh
# will only start "web"
$ docker-compose up -d
@y
```sh
# これは"web"のみを起動します。
$ docker-compose up -d
@z

@x
# this will start mock-backend (and - if necessary - db)
# by implicitly enabling profile `dev`
$ docker-compose up -d mock-backend
@y
# これはプロファイル`dev`は暗に有効化した上で、
# mock-backendを実行します（必要に応じてdbも起動します）。
$ docker-compose up -d mock-backend
@z

@x
# this will fail because profile "dev" is disabled
$ docker-compose up phpmyadmin
```
@y
# プロファイル"dev"が無効なためこのコマンドは失敗します。
$ docker-compose up phpmyadmin
```
@z

@x
Although targeting `phpmyadmin` will automatically enable its profiles - i.e.
`debug` - it will not automatically enable the profile(s) required by `db` -
i.e. `dev`. To fix this you either have to add the `debug` profile to the `db` service:
@y
`phpmyadmin`を指定して実行すれば、割り当てられているプロファイルつまり`debug`は自動的に有効になります。
しかし`db`に割り当てられているプロファイルつまり`dev`までは自動的に有効にはしません。
これを正しくするには、`db`サービスに対しても`debug`プロファイルを追加しなければなりません。
@z

@x
```yaml
db:
  image: mysql
  profiles: ["debug", "dev"]
```
@y
```yaml
db:
  image: mysql
  profiles: ["debug", "dev"]
```
@z

@x
or enable a profile of `db` explicitly:
@y
または`db`のプロファイルを明示的に有効化する方法とします。
@z

@x
```sh
# profile "debug" is enabled automatically by targeting phpmyadmin
$ docker-compose --profile dev up phpmyadmin
$ COMPOSE_PROFILES=dev docker-compose up phpmyadmin
```
@y
```sh
# phpmyadmin指定に際してプロファイル"debug"を有効にします。
$ docker-compose --profile dev up phpmyadmin
$ COMPOSE_PROFILES=dev docker-compose up phpmyadmin
```
@z

@x
## Compose documentation
@y
{: #compose-documentation }
## Compose ドキュメント
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
