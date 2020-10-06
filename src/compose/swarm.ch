%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
advisory: swarm-standalone
hide_from_sitemap: true
description: How to use Compose and Swarm together to deploy apps to multi-host clusters
keywords: documentation, docs,  docker, compose, orchestration, containers, swarm
title: Use Compose with Swarm
---
@y
---
advisory: swarm-standalone
hide_from_sitemap: true
description: Compose と Swarm を同時に使って、複数ホストクラスターへのアプリのデプロイ方法を説明します。
keywords: documentation, docs,  docker, compose, orchestration, containers, swarm
title: Compose において Swarm を使う
---
@z

@x
Docker Compose and [Docker Swarm](../swarm/overview.md) aim to have full integration, meaning
you can point a Compose app at a Swarm cluster and have it all just work as if
you were using a single Docker host.
@y
{% comment %}
Docker Compose and [Docker Swarm](../swarm/overview.md) aim to have full integration, meaning
you can point a Compose app at a Swarm cluster and have it all just work as if
you were using a single Docker host.
{% endcomment %}
Docker Compose と [Docker Swarm](../swarm/overview.md) は完全な統合を目指しています。
このことは Compose アプリといえば Swarm クラスターのことを指すものであって、これらすべてが一つになり、まるで単一の Docker ホストを使っているかのように動作することを意味します。
@z

@x
The actual extent of integration depends on which version of the
[Compose file format](compose-file/compose-versioning.md) you are using:
@y
{% comment %}
The actual extent of integration depends on which version of the
[Compose file format](compose-file/compose-versioning.md) you are using:
{% endcomment %}
実際の統合の程度に関しては [Compose ファイルフォーマット](compose-file/compose-versioning.md) のどのバージョンを用いるかによって変わります。
@z

@x
1.  If you're using version 1 along with `links`, your app works, but Swarm
    schedules all containers on one host, because links between containers
    do not work across hosts with the old networking system.
@y
{% comment %}
1.  If you're using version 1 along with `links`, your app works, but Swarm
    schedules all containers on one host, because links between containers
    do not work across hosts with the old networking system.
{% endcomment %}
1.  バージョン 1 でかつ `links` を用いている場合、アプリは動作しますが、スウォームはコンテナー内のスケジュールを 1 つのホスト内で行います。
    コンテナー間のリンクは、古いネットワークシステムを用いているため、ホスト間にわたっての動作ができないからです。
@z

@x
2. If you're using version 2, your app should work with no changes:
@y
{% comment %}
2. If you're using version 2, your app should work with no changes:
{% endcomment %}
2. バージョン 2 を利用している場合、アプリは変更せずに動作するはずです。:
@z

@x
    - subject to the [limitations](swarm.md#limitations) described below,
@y
    {% comment %}
    - subject to the [limitations](swarm.md#limitations) described below,
    {% endcomment %}
    - [制約](swarm.md#limitations)に関しては後述しています。
@z

@x
    - as long as the Swarm cluster is configured to use the [overlay driver](../network/overlay.md),
      or a custom driver which supports multi-host networking.
@y
    {% comment %}
    - as long as the Swarm cluster is configured to use the [overlay driver](../network/overlay.md),
      or a custom driver which supports multi-host networking.
    {% endcomment %}
    - スウォームクラスターの設定において[オーバーレイドライバー](../network/overlay.md) を利用するか、あるいはマルチホストネットワーキングをサポートするカスタムドライバーを利用することが前提です。
@z

@x
Read [Get started with multi-host networking](../network/network-tutorial-overlay.md) to see how to
set up a Swarm cluster with [Docker Machine](../machine/overview.md) and the overlay driver. Once you've got it running, deploying your app to it should be as simple as:
@y
{% comment %}
Read [Get started with multi-host networking](../network/network-tutorial-overlay.md) to see how to
set up a Swarm cluster with [Docker Machine](../machine/overview.md) and the overlay driver. Once you've got it running, deploying your app to it should be as simple as:
{% endcomment %}
[マルチホストネットワーキングをはじめよう](../network/network-tutorial-overlay.md) を読むと、[Docker Machine](../machine/overview.md) を使ったスウォームクラスターやオーバーレイドライバーの設定方法がわかります。
稼動させてしまえば、アプリをデプロイすることは以下のように簡単にできます。
@z

@x
    $ eval "$(docker-machine env --swarm <name of swarm master machine>)"
    $ docker-compose up
@y
    $ eval "$(docker-machine env --swarm <name of swarm master machine>)"
    $ docker-compose up
@z

@x
## Limitations
@y
{% comment %}
## Limitations
{% endcomment %}
## 制約
{: #limitations }
@z

@x
### Building images
@y
{% comment %}
### Building images
{% endcomment %}
### イメージのビルド
{: #building-images }
@z

@x
Swarm can build an image from a Dockerfile just like a single-host Docker
instance can, but the resulting image only lives on a single node and won't
be distributed to other nodes.
@y
{% comment %}
Swarm can build an image from a Dockerfile just like a single-host Docker
instance can, but the resulting image only lives on a single node and won't
be distributed to other nodes.
{% endcomment %}
スウォームでのイメージのビルドは Dockerfile から行うことができます。
この場合、単一ホストにより Docker インスタンスを構築することと変わりがありません。
ただし作り出されるイメージは、単一ノード上に存在することしかできず、他のノードに分散することはできません。
@z

@x
If you want to use Compose to scale the service in question to multiple nodes,
build the image, push it to a registry such as Docker Hub, and reference it
from `docker-compose.yml`:
@y
{% comment %}
If you want to use Compose to scale the service in question to multiple nodes,
build the image, push it to a registry such as Docker Hub, and reference it
from `docker-compose.yml`:
{% endcomment %}
Compose を使ってサービスを複数ノードにスケーリングしたい場合は、ビルドしたイメージを Docker Hub のようなレジストリへ登録した上で、`docker-compose.yml` からそれを参照する形とします。
@z

@x
    $ docker build -t myusername/web .
    $ docker push myusername/web
@y
    $ docker build -t myusername/web .
    $ docker push myusername/web
@z

@x
    $ cat docker-compose.yml
    web:
      image: myusername/web
@y
    $ cat docker-compose.yml
    web:
      image: myusername/web
@z

@x
    $ docker-compose up -d
    $ docker-compose scale web=3
@y
    $ docker-compose up -d
    $ docker-compose scale web=3
@z

@x
### Multiple dependencies
@y
{% comment %}
### Multiple dependencies
{% endcomment %}
### 複数の依存関係
{: #multiple-dependencies }
@z

@x
If a service has multiple dependencies of the type which force co-scheduling
(see [Automatic scheduling](#automatic-scheduling) below), it's possible that
Swarm schedules the dependencies on different nodes, making the dependent
service impossible to schedule. For example, here `foo` needs to be co-scheduled
with `bar` and `baz`:
@y
{% comment %}
If a service has multiple dependencies of the type which force co-scheduling
(see [Automatic scheduling](#automatic-scheduling) below), it's possible that
Swarm schedules the dependencies on different nodes, making the dependent
service impossible to schedule. For example, here `foo` needs to be co-scheduled
with `bar` and `baz`:
{% endcomment %}
同期スケジュール（後述の[自動スケジューリング](#automatic-scheduling) 参照）を必要とする依存パッケージがサービス内に複数ある場合、スウォームではサービスを異なるノード上で稼動させることにして、依存する他サービスのスケジューリングを行わないようにすることで、全体のスケジューリングを実現することが可能です。
たとえば `foo` というサービスが `bar` と `baz` と同期スケジューリングする必要がある場合には、以下のようにします。
@z

@x
    version: "2"
    services:
      foo:
        image: foo
        volumes_from: ["bar"]
        network_mode: "service:baz"
      bar:
        image: bar
      baz:
        image: baz
@y
    version: "2"
    services:
      foo:
        image: foo
        volumes_from: ["bar"]
        network_mode: "service:baz"
      bar:
        image: bar
      baz:
        image: baz
@z

@x
The problem is that Swarm might first schedule `bar` and `baz` on different
nodes (since they're not dependent on one another), making it impossible to
pick an appropriate node for `foo`.
@y
{% comment %}
The problem is that Swarm might first schedule `bar` and `baz` on different
nodes (since they're not dependent on one another), making it impossible to
pick an appropriate node for `foo`.
{% endcomment %}
ただしこれには問題があって、異なるノード上に割り当てた `bar` と `baz` をスウォームが最初にスケジューリングしてしまう場合があります（この 2 つには互いに依存関係がないからです）。
このときには `foo` に割り当てるべき適切なノードが存在しない状態となってしまいます。
@z

@x
To work around this, use [manual scheduling](#manual-scheduling) to ensure that
all three services end up on the same node:
@y
{% comment %}
To work around this, use [manual scheduling](#manual-scheduling) to ensure that
all three services end up on the same node:
{% endcomment %}
これを解決するには[手動スケジューリング](#manual-scheduling) を用いて、3 つのサービスがすべて同一ノード上で稼動するようにします。
@z

@x
    version: "2"
    services:
      foo:
        image: foo
        volumes_from: ["bar"]
        network_mode: "service:baz"
        environment:
          - "constraint:node==node-1"
      bar:
        image: bar
        environment:
          - "constraint:node==node-1"
      baz:
        image: baz
        environment:
          - "constraint:node==node-1"
@y
    version: "2"
    services:
      foo:
        image: foo
        volumes_from: ["bar"]
        network_mode: "service:baz"
        environment:
          - "constraint:node==node-1"
      bar:
        image: bar
        environment:
          - "constraint:node==node-1"
      baz:
        image: baz
        environment:
          - "constraint:node==node-1"
@z

@x
### Host ports and recreating containers
@y
{% comment %}
### Host ports and recreating containers
{% endcomment %}
### ホストのポート、コンテナーの再作成
{: #host-ports-and-recreating-containers }
@z

@x
If a service maps a port from the host, such as `80:8000`, then you may get an
error like this when running `docker-compose up` on it after the first time:
@y
{% comment %}
If a service maps a port from the host, such as `80:8000`, then you may get an
error like this when running `docker-compose up` on it after the first time:
{% endcomment %}
サービスがホストのポートをマップする際、たとえば `80:8000` という指定の場合に、初回の `docker-compose up` の実行にあたって以下のようなエラーメッセージが表示されることがあります。
@z

@x
    docker: Error response from daemon: unable to find a node that satisfies
    container==6ab2dfe36615ae786ef3fc35d641a260e3ea9663d6e69c5b70ce0ca6cb373c02.
@y
    docker: Error response from daemon: unable to find a node that satisfies
    container==6ab2dfe36615ae786ef3fc35d641a260e3ea9663d6e69c5b70ce0ca6cb373c02.
@z

@x
The usual cause of this error is that the container has a volume (defined either
in its image or in the Compose file) without an explicit mapping, and so in
order to preserve its data, Compose has directed Swarm to schedule the new
container on the same node as the old container. This results in a port clash.
@y
{% comment %}
The usual cause of this error is that the container has a volume (defined either
in its image or in the Compose file) without an explicit mapping, and so in
order to preserve its data, Compose has directed Swarm to schedule the new
container on the same node as the old container. This results in a port clash.
{% endcomment %}
このエラーは、コンテナーが持つボリューム（イメージ内で定義される、Compose ファイル内で定義される、いずれを問わず）が、明示的にマッピングされていない場合によく発生します。
そこでデータが失われないように、Compose は Swarm に対して、同一ノード上の新しいコンテナーを古いコンテナーとして扱ってスケジューリングを行います。
この処理結果がポートの衝突を引き起こします。
@z

@x
There are two viable workarounds for this problem:
@y
{% comment %}
There are two viable workarounds for this problem:
{% endcomment %}
この問題を解決する有効な方法として、以下の 2 つがあります。
@z

@x
-   Specify a named volume, and use a volume driver which is capable of mounting
    the volume into the container regardless of what node it's scheduled on.
@y
{% comment %}
-   Specify a named volume, and use a volume driver which is capable of mounting
    the volume into the container regardless of what node it's scheduled on.
{% endcomment %}
-   名前づけされたボリュームを指定します。
    そのボリュームがどのノード上においてスケジューリングされているかには関係なく、コンテナーにマウントできるボリュームドライバーを利用します。
@z

@x
    Compose does not give Swarm any specific scheduling instructions if a
    service uses only named volumes.
@y
    {% comment %}
    Compose does not give Swarm any specific scheduling instructions if a
    service uses only named volumes.
    {% endcomment %}
    サービスが名前づけされたボリュームのみを用いている場合、Compose は Swarm に対して、特にスケジューリング指示は行いません。
@z

@x
        version: "2"
@y
        version: "2"
@z

@x
        services:
          web:
            build: .
            ports:
              - "80:8000"
            volumes:
              - web-logs:/var/log/web
@y
        services:
          web:
            build: .
            ports:
              - "80:8000"
            volumes:
              - web-logs:/var/log/web
@z

@x
        volumes:
          web-logs:
            driver: custom-volume-driver
@y
        volumes:
          web-logs:
            driver: custom-volume-driver
@z

@x
-   Remove the old container before creating the new one. You lose any data
    in the volume.
@y
{% comment %}
-   Remove the old container before creating the new one. You lose any data
    in the volume.
{% endcomment %}
-   古いコンテナーを削除してから新しいコンテナーを生成します。
    ボリューム内のデータは失われます。
@z

@x
        $ docker-compose stop web
        $ docker-compose rm -f web
        $ docker-compose up web
@y
        $ docker-compose stop web
        $ docker-compose rm -f web
        $ docker-compose up web
@z

@x
## Scheduling containers
@y
{% comment %}
## Scheduling containers
{% endcomment %}
## コンテナーのスケジューリング
{: #scheduling-containers }
@z

@x
### Automatic scheduling
@y
{% comment %}
### Automatic scheduling
{% endcomment %}
### 自動スケジューリング
{: #automatic-scheduling }
@z

@x
Some configuration options result in containers being automatically
scheduled on the same Swarm node to ensure that they work correctly. These are:
@y
{% comment %}
Some configuration options result in containers being automatically
scheduled on the same Swarm node to ensure that they work correctly. These are:
{% endcomment %}
複数のコンテナーのスケジューリングを同一のスウォームノード上で自動的に実行するためのオプション指定があります。
これを使うとスケジューリングが適切に動作します。
オプションは以下のものです。
@z

@x
-   `network_mode: "service:..."` and `network_mode: "container:..."` (and
    `net: "container:..."` in the version 1 file format).
@y
{% comment %}
-   `network_mode: "service:..."` and `network_mode: "container:..."` (and
    `net: "container:..."` in the version 1 file format).
{% endcomment %}
-   `network_mode: "service:..."` および `network_mode: "container:..."`
    （ファイルフォーマットバージョン 1 の場合は `net: "container:..."`）
@z

@x
-   `volumes_from`
@y
-   `volumes_from`
@z

@x
-   `links`
@y
-   `links`
@z

@x
### Manual scheduling
@y
{% comment %}
### Manual scheduling
{% endcomment %}
### 手動スケジューリング
{: #manual-scheduling }
@z

@x
Swarm offers a rich set of scheduling and affinity hints, enabling you to
control where containers are located. They are specified via container
environment variables, so you can use Compose's `environment` option to set
them.
@y
{% comment %}
Swarm offers a rich set of scheduling and affinity hints, enabling you to
control where containers are located. They are specified via container
environment variables, so you can use Compose's `environment` option to set
them.
{% endcomment %}
Swarm では豊富なスケジュール機能や affinity フィルターを提供しています。
これを用いると、コンテナーの配置を制御できるようになります。
これはコンテナーの環境変数を通じて指定します。
そこで Compose の `environment` を設定していきます。
@z

@x
    # Schedule containers on a specific node
    environment:
      - "constraint:node==node-1"
@y
    # Schedule containers on a specific node
    environment:
      - "constraint:node==node-1"
@z

@x
    # Schedule containers on a node that has the 'storage' label set to 'ssd'
    environment:
      - "constraint:storage==ssd"
@y
    # Schedule containers on a node that has the 'storage' label set to 'ssd'
    environment:
      - "constraint:storage==ssd"
@z

@x
    # Schedule containers where the 'redis' image is already pulled
    environment:
      - "affinity:image==redis"
@y
    # Schedule containers where the 'redis' image is already pulled
    environment:
      - "affinity:image==redis"
@z

@x
For the full set of available filters and expressions, see the
[Swarm documentation](../swarm/scheduler/filter.md).
@y
{% comment %}
For the full set of available filters and expressions, see the
[Swarm documentation](../swarm/scheduler/filter.md).
{% endcomment %}
利用可能なフィルターや記述書式については [Swarm ドキュメント](../swarm/scheduler/filter.md) を参照してください。
@z
