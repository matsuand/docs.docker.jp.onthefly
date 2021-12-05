%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How Compose sets up networking between containers
keywords: documentation, docs, docker, compose, orchestration, containers, networking
title: Networking in Compose
---
@y
---
description: Compose はコンテナー間のネットワークをどのように構築するか。
keywords: documentation, docs, docker, compose, orchestration, containers, networking
title: Compose におけるネットワーク機能
---
@z

@x
> This page applies to Compose file formats [version 2](compose-file/compose-file-v2.md) and [higher](compose-file/index.md). Networking features are not supported for Compose file version 1 (deprecated).
@y
> このページに示す内容は Compose ファイルフォーマットの [バージョン 2](compose-file/compose-file-v2.md) と [それ以降](compose-file/index.md) に適用されます。
ネットワーク機能は（非推奨の）バージョン 1 ではサポートされません。
@z

@x
By default Compose sets up a single
[network](../engine/reference/commandline/network_create.md) for your app. Each
container for a service joins the default network and is both *reachable* by
other containers on that network, and *discoverable* by them at a hostname
identical to the container name.
@y
デフォルトで Compose は、アプリ向けに単一の [ネットワーク](../engine/reference/commandline/network_create.md) を設定します。
1 つのサービスを構成する各コンテナーは、そのデフォルトのネットワークに参加するので、ネットワーク上の他のコンテナーからのアクセスが可能です。
さらにコンテナー名と同等のホスト名を用いてコンテナーの識別が可能となります。
@z

@x
> **Note**
>
> Your app's network is given a name based on the "project name",
> which is based on the name of the directory it lives in. You can override the
> project name with either the [`--project-name` flag](reference/index.md)
> or the [`COMPOSE_PROJECT_NAME` environment variable](reference/envvars.md#compose_project_name).
@y
> **メモ**
>
> アプリのネットワークには「プロジェクト名」に基づいた名前がつけられます。
> そしてプロジェクト名はこれが稼動しているディレクトリ名に基づいて定まります。
> プロジェクト名は [`--project-name`フラグ](reference/index.md) あるいは [`COMPOSE_PROJECT_NAME`環境変数](reference/envvars.md#compose_project_name) を使って上書きすることができます。
@z

@x
For example, suppose your app is in a directory called `myapp`, and your `docker-compose.yml` looks like this:
@y
たとえばアプリが`myapp`というディレクトリにあって、`docker-compose.yml`が以下のような内容であるとします。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    build: .
    ports:
      - "8000:8000"
  db:
    image: postgres
    ports:
      - "8001:5432"
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    build: .
    ports:
      - "8000:8000"
  db:
    image: postgres
    ports:
      - "8001:5432"
```
@z

@x
When you run `docker-compose up`, the following happens:
@y
`docker-compose up`を実行すると以下の結果になります。
@z

@x
1.  A network called `myapp_default` is created.
2.  A container is created using `web`'s configuration. It joins the network
    `myapp_default` under the name `web`.
3.  A container is created using `db`'s configuration. It joins the network
    `myapp_default` under the name `db`.
@y
1.  `myapp_default`というネットワークが生成されます。
2.  `web`に関する設定に従って 1 つのコンテナーが生成されます。
    そしてそのコンテナーは`web`という名前でネットワーク`myapp_default`に参加します。
3.  `db`に関する設定に従って 1 つのコンテナーが生成されます。
    そしてそのコンテナーは`db`という名前でネットワーク`myapp_default`に参加します。
@z

@x
> **In v2.1+, overlay networks are always `attachable`**
>
> Starting in Compose file format 2.1, overlay networks are always created as
> `attachable`, and this is not configurable. This means that standalone
> containers can connect to overlay networks.
>
> In Compose file format 3.x, you can optionally set the `attachable` property
> to `false`.
@y
> **v2.1 以降、overlay ネットワークは常に`attachable`に**
>
> Compose ファイルフォーマット 2.1 から、overlay ネットワークは常に`attachable`として生成されるようになりましたが、これを変更することはできません。
> `attachable`として生成されるため、スタンドアロンのコンテナーでも overlay ネットワークに接続することができます。
> Compose ファイルフォーマット 3.x においては、必要に応じて`attachable`プロパティに`false`を設定できます。
@z

@x
Each container can now look up the hostname `web` or `db` and
get back the appropriate container's IP address. For example, `web`'s
application code could connect to the URL `postgres://db:5432` and start
using the Postgres database.
@y
各コンテナーはこれ以降、ホスト名`web`と`db`を認識できるようになり、コンテナーの IP アドレスも適切に取得できるようになります。
たとえば`web`のアプリケーションコードでは、URL`postgres://db:5432`を使ってのアクセスが可能となり、Postgres データベースの利用ができるようになります。
@z

@x
It is important to note the distinction between `HOST_PORT` and `CONTAINER_PORT`.
In the above example, for `db`, the `HOST_PORT` is `8001` and the container port is
`5432` (postgres default). Networked service-to-service
communication uses the `CONTAINER_PORT`. When `HOST_PORT` is defined,
the service is accessible outside the swarm as well.
@y
`HOST_PORT`と`CONTAINER_PORT`の違いについては理解しておくことが重要です。
上の例の`db`では、`HOST_PORT`が`8001`、コンテナーポートが `5432`（postgres のデフォルト） になっています。
ネットワークにより接続されているサービス間の通信は`CONTAINER_PORT`を利用します。
`HOST_PORT`を定義すると、このサービスはスウォームの外からもアクセスが可能になります。
@z

@x
Within the `web` container, your connection string to `db` would look like
`postgres://db:5432`, and from the host machine, the connection string would
look like `postgres://{DOCKER_IP}:8001`.
@y
`web`コンテナー内では、`db`への接続文字列は`postgres://db:5432`といったものになります。
そしてホストマシン上からは、その接続文字列は`postgres://{DOCKER_IP}:8001`となります。
@z

@x
## Update containers
@y
## コンテナーの更新
{: #update-containers }
@z

@x
If you make a configuration change to a service and run `docker-compose up` to update it, the old container is removed and the new one joins the network under a different IP address but the same name. Running containers can look up that name and connect to the new address, but the old address stops working.
@y
サービスに対する設定を変更して`docker-compose up`により更新を行うと、それまでのコンテナーは削除されて新しいコンテナーがネットワークに接続されます。
このとき IP アドレスは異なることになりますが、ホスト名は変わりません。
コンテナーの実行によってホスト名による名前解決を行い、新たな IP アドレスへ接続します。
それまでの古い IP アドレスは利用できなくなります。
@z

@x
If any containers have connections open to the old container, they are closed. It is a container's responsibility to detect this condition, look up the name again and reconnect.
@y
古いコンテナーに対して接続を行っていたコンテナーがあれば、その接続は切断されます。
この状況を検出するのは各コンテナーの責任であって、ホスト名を探して再接続が行われます。
@z

@x
## Links
@y
## Links
@z

@x
Links allow you to define extra aliases by which a service is reachable from another service. They are not required to enable services to communicate - by default, any service can reach any other service at that service's name. In the following example, `db` is reachable from `web` at the hostnames `db` and `database`:
@y
links は自サービスが他のサービスからアクセスできるように、追加でエイリアスを定義するものです。
これはサービス間の通信を行うために必要となるわけではありません。
デフォルトにおいてサービスは、サービス名を使って他サービスにアクセスできます。
以下の例においては、`db`は`web`からアクセス可能であり、ホスト名`db`あるいは`database`を使ってアクセスできます。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:

  web:
    build: .
    links:
      - "db:database"
  db:
    image: postgres
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:

  web:
    build: .
    links:
      - "db:database"
  db:
    image: postgres
```
@z

@x
See the [links reference](compose-file/compose-file-v2.md#links) for more information.
@y
詳細は [links リファレンス](compose-file/compose-file-v2.md#links) を参照してください。
@z

@x
## Multi-host networking
@y
## 複数ホストによるネットワーク
{: #Multi-host networking }
@z

@x
When deploying a Compose application on a Docker Engine with [Swarm mode enabled](../engine/swarm/index.md),
you can make use of the built-in `overlay` driver to enable multi-host communication.
@y
Docker Engine 上において [Swarm モードの有効化](../engine/swarm/index.md) を行い、Compose アプリケーションをデプロイする際には、ビルトインされている`overlay`ドライバーを利用して、複数ホスト間での通信が利用可能です。
@z

@x
Consult the [Swarm mode section](../engine/swarm/index.md), to see how to set up
a Swarm cluster, and the [Getting started with multi-host networking](../network/network-tutorial-overlay.md)
to learn about multi-host overlay networks.
@y
[Swarm モードの節](../engine/swarm/index.md) を参考にして、Swarm クラスターの設定方法を確認してください。
また [マルチホストネットワーク](../network/network-tutorial-overlay.md) を参考にして、マルチホストによる overlay ネットワークについて確認してください。
@z

@x
## Specify custom networks
@y
## 独自のネットワーク設定
{: #specify-custom-networks }
@z

@x
Instead of just using the default app network, you can specify your own networks with the top-level `networks` key. This lets you create more complex topologies and specify [custom network drivers](/engine/extend/plugins_network/) and options. You can also use it to connect services to externally-created networks which aren't managed by Compose.
@y
デフォルトのアプリ用ネットワークを利用するのではなく、独自のネットワークを指定することができます。
これは最上位の`networks`キーを使って行います。
これを使えば、より複雑なネットワークトポロジーを生成したり、[独自のネットワークドライバー](/engine/extend/plugins_network/) とそのオプションを設定したりすることができます。
さらには、Compose が管理していない、外部に生成されたネットワークに対してサービスを接続することもできます。
@z

@x
Each service can specify what networks to connect to with the *service-level* `networks` key, which is a list of names referencing entries under the *top-level* `networks` key.
@y
サービスレベルの定義となる`networks`キーを利用すれば、サービスごとにどのネットワークに接続するかを指定できます。
指定する値はサービス名のリストであり、最上位の`networks`キーに指定されている値を参照するものです。
@z

@x
Here's an example Compose file defining two custom networks. The `proxy` service is isolated from the `db` service, because they do not share a network in common - only `app` can talk to both.
@y
以下において Compose ファイルは、独自のネットワークを 2 つ定義しています。
`proxy`サービスは`db`サービスから切り離されています。
というのも両者はネットワークを共有しないためです。
そして`app`だけがその両者と通信を行います。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"

services:
  proxy:
    build: ./proxy
    networks:
      - frontend
  app:
    build: ./app
    networks:
      - frontend
      - backend
  db:
    image: postgres
    networks:
      - backend

networks:
  frontend:
    # Use a custom driver
    driver: custom-driver-1
  backend:
    # Use a custom driver which takes special options
    driver: custom-driver-2
    driver_opts:
    foo: "1"
    bar: "2"
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"

services:
  proxy:
    build: ./proxy
    networks:
      - frontend
  app:
    build: ./app
    networks:
      - frontend
      - backend
  db:
    image: postgres
    networks:
      - backend

networks:
  frontend:
    # 独自ドライバーの利用
    driver: custom-driver-1
  backend:
    # 所定のオプションを用いる独自ドライバーの利用
    driver: custom-driver-2
    driver_opts:
    foo: "1"
    bar: "2"
```
@z

@x
Networks can be configured with static IP addresses by setting the [ipv4_address and/or ipv6_address](compose-file/compose-file-v2.md#ipv4_address-ipv6_address) for each attached network.
@y
接続するネットワークのそれぞれは、[ipv4_address または ipv6_address](compose-file/compose-file-v2.md#ipv4_address-ipv6_address) を使ってスタティック IP アドレスを設定することができます。
@z

@x
Networks can also be given a [custom name](compose-file/compose-file-v3.md#network-configuration-reference) (since version 3.5):
@y
ネットワークには [独自の名前](compose-file/index.md#network-configuration-reference) も設定することができます。
（バージョン 3.5 から）
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  # ...
networks:
  frontend:
    name: custom_frontend
    driver: custom-driver-1
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  # ...
networks:
  frontend:
    name: custom_frontend
    driver: custom-driver-1
```
@z

@x
For full details of the network configuration options available, see the following references:
@y
ネットワーク設定に関して利用可能なオプションについては、以下のリファレンスを参照してください。
@z

@x
- [Top-level `networks` key](compose-file/compose-file-v2.md#network-configuration-reference)
- [Service-level `networks` key](compose-file/compose-file-v2.md#networks)
@y
- [最上位の`networks`キー](compose-file/compose-file-v2.md#network-configuration-reference)
- [service レベルの`networks`キー](compose-file/compose-file-v2.md#networks)
@z

@x
## Configure the default network
@y
## デフォルトネットワークの設定
{: #configure-the-default-network }
@z

@x
Instead of (or as well as) specifying your own networks, you can also change the settings of the app-wide default network by defining an entry under `networks` named `default`:
@y
独自のネットワーク設定は行わずに、あるいはそれを行った上でさらに、アプリに対するデフォルトネットワークの設定を変更することができます。
これは`networks`のもとに`default`という項目を定義して行います。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    build: .
    ports:
      - "8000:8000"
  db:
    image: postgres

networks:
  default:
    # Use a custom driver
    driver: custom-driver-1
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    build: .
    ports:
      - "8000:8000"
  db:
    image: postgres

networks:
  default:
    # 独自のドライバーを利用
    driver: custom-driver-1
```
@z

@x
## Use a pre-existing network
@y
## 既存ネットワークの利用
{: #use-a-pre-existing-network }
@z

@x
If you want your containers to join a pre-existing network, use the [`external` option](compose-file/compose-file-v2.md#network-configuration-reference):
@y
コンテナーを既存のネットワークに接続したい場合は [`external`オプション](compose-file/compose-file-v2.md#network-configuration-reference) を利用します。
@z

@x
```yaml
services:
  # ...
networks:
  default:
    external: true
    name: my-pre-existing-network
```
@y
```yaml
services:
  # ...
networks:
  default:
    external: true
    name: my-pre-existing-network
```
@z

@x
Instead of attempting to create a network called `[projectname]_default`, Compose looks for a network called `my-pre-existing-network` and connect your app's containers to it.
@y
Compose は`[projectname]_default`という名前のネットワークを生成しようとはせず、`my-pre-existing-network`というネットワークを探し出して、アプリのコンテナーをそこに接続します。
@z
