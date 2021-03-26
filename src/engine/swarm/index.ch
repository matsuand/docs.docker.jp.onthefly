%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Engine swarm mode overview
keywords: docker, container, cluster, swarm
title: Swarm mode overview
redirect_from:
- /api/swarm-api/
- /engine/userguide/networking/overlay-standalone-swarm/
- /network/overlay-standalone.swarm/
- /release-notes/docker-swarm/
- /swarm/
- /swarm/api/
- /swarm/configure-tls/
- /swarm/discovery/
- /swarm/get-swarm/
- /swarm/install-manual/
- /swarm/install-w-machine/
- /swarm/multi-host-networking/
- /swarm/multi-manager-setup/
- /swarm/networking/
- /swarm/overview/
- /swarm/plan-for-production/
- /swarm/provision-with-machine/
- /swarm/reference/
- /swarm/reference/create/
- /swarm/reference/help/
- /swarm/reference/join/
- /swarm/reference/list/
- /swarm/reference/manage/
- /swarm/reference/swarm/
- /swarm/release-notes/
- /swarm/scheduler/
- /swarm/scheduler/filter/
- /swarm/scheduler/rescheduling/
- /swarm/scheduler/strategy/
- /swarm/secure-swarm-tls/
- /swarm/status-code-comparison-to-docker/
- /swarm/swarm-api/
- /swarm/swarm_at_scale/
- /swarm/swarm_at_scale/02-deploy-infra/
- /swarm/swarm_at_scale/03-create-cluster/
- /swarm/swarm_at_scale/04-deploy-app/
- /swarm/swarm_at_scale/about/
- /swarm/swarm_at_scale/deploy-app/
- /swarm/swarm_at_scale/deploy-infra/
- /swarm/swarm_at_scale/troubleshoot/
---
@y
---
description: Docker Engine Swarm モードの概要
keywords: docker, container, cluster, swarm
title: Swarm モード概要
redirect_from:
- /api/swarm-api/
- /engine/userguide/networking/overlay-standalone-swarm/
- /network/overlay-standalone.swarm/
- /release-notes/docker-swarm/
- /swarm/
- /swarm/api/
- /swarm/configure-tls/
- /swarm/discovery/
- /swarm/get-swarm/
- /swarm/install-manual/
- /swarm/install-w-machine/
- /swarm/multi-host-networking/
- /swarm/multi-manager-setup/
- /swarm/networking/
- /swarm/overview/
- /swarm/plan-for-production/
- /swarm/provision-with-machine/
- /swarm/reference/
- /swarm/reference/create/
- /swarm/reference/help/
- /swarm/reference/join/
- /swarm/reference/list/
- /swarm/reference/manage/
- /swarm/reference/swarm/
- /swarm/release-notes/
- /swarm/scheduler/
- /swarm/scheduler/filter/
- /swarm/scheduler/rescheduling/
- /swarm/scheduler/strategy/
- /swarm/secure-swarm-tls/
- /swarm/status-code-comparison-to-docker/
- /swarm/swarm-api/
- /swarm/swarm_at_scale/
- /swarm/swarm_at_scale/02-deploy-infra/
- /swarm/swarm_at_scale/03-create-cluster/
- /swarm/swarm_at_scale/04-deploy-app/
- /swarm/swarm_at_scale/about/
- /swarm/swarm_at_scale/deploy-app/
- /swarm/swarm_at_scale/deploy-infra/
- /swarm/swarm_at_scale/troubleshoot/
---
@z

@x
To use Docker in swarm mode, install Docker. See
[installation instructions](../../get-docker.md) for all operating systems and platforms.
@y
Docker の Swarm モードを利用するには、各種のオペレーティングシステムやプラットフォーム向けの [インストール手順](../../get-docker.md) に従って Docker をインストールしてください。
@z

@x
Current versions of Docker include *swarm mode* for natively managing a cluster
of Docker Engines called a *swarm*. Use the Docker CLI to create a swarm, deploy
application services to a swarm, and manage swarm behavior.
@y
最新版の Docker には **Swarm モード** が含まれています。
これは **Swarm** と呼ばれる Docker Engine のクラスターをネイティブに管理するものです。
Docker CLI を使って、Swarm の生成、アプリケーションサービスの Swarm へのデプロイ、Swarm の制御管理を行います。
@z

@x
Docker Swarm mode is built into the Docker Engine. Do not confuse Docker Swarm mode
with [Docker Classic Swarm](https://github.com/docker/classicswarm){:target="_blank" rel="noopener" class="_"}
which is no longer actively developed.
@y
Docker Swarm モードは Docker Engine 内に組み込まれているものです。
Docker Swarm モードと [Docker の旧来の Swarm](https://github.com/docker/classicswarm){:target="_blank" rel="noopener" class="_"} とを混同しないでください。
後者はもはや積極的な開発は行われていません。
@z

@x
## Feature highlights
@y
{: #feature-highlights }
## 特徴的な機能
@z

@x
* **Cluster management integrated with Docker Engine:** Use the Docker Engine
CLI to create a swarm of Docker Engines where you can deploy application
services. You don't need additional orchestration software to create or manage
a swarm.
@y
* **Docker Engine に統合されたクラスター管理** ＝
  Docker Engine CLI を利用して Docker Engine の Swarm を生成します。
  これに対してアプリケーションサービスをデプロイすることができます。
  Swarm の生成や管理にあたって、オーケストレーションソフトウェアを別途必要としません。
@z

@x
* **Decentralized design:** Instead of handling differentiation between node
roles at deployment time, the Docker Engine handles any specialization at
runtime. You can deploy both kinds of nodes, managers and workers, using the
Docker Engine. This means you can build an entire swarm from a single disk
image.
@y
* **分散型設計** ＝
  Docker Engine は、デプロイの際にはノードの役割別に異なった処理を行わず、実行時に特殊な処理を行います。
  Docker Engine において、デプロイできるノードの種類はマネージャーとワーカーです。
  Swarm 全体は、単一のディスクイメージから構築できることを意味します。
@z

@x
* **Declarative service model:** Docker Engine uses a declarative approach to
let you define the desired state of the various services in your application
stack. For example, you might describe an application comprised of a web front
end service with message queueing services and a database backend.
@y
* **宣言型サービスモデル** ＝
  Docker Engine は宣言的なアプローチを採用しており、アプリケーション層の各サービスに対して、必要となる状態を定義するということを行います。
  たとえばアプリケーションの記述として、ウェブフロントエンドサービスがあり、メッセージキューサービスとデータベースバックエンドから構成されるという記述を行うことがあります。
@z

@x
* **Scaling:** For each service, you can declare the number of tasks you want to
run. When you scale up or down, the swarm manager automatically adapts by
adding or removing tasks to maintain the desired state.
@y
* **スケーリング** ＝
  各サービスに対しては、起動させたいタスク数を指定することができます。
  スケールアップやスケールダウンの際に Swarm マネージャー、はタスクの追加または削除を行ない、定義された状態を維持するために自動的な対応を行います。
@z

@x
* **Desired state reconciliation:** The swarm manager node constantly monitors
the cluster state and reconciles any differences between the actual state and your
expressed desired state. For example, if you set up a service to run 10
replicas of a container, and a worker machine hosting two of those replicas
crashes, the manager creates two new replicas to replace the replicas that
crashed. The swarm manager assigns the new replicas to workers that are
running and available.
@y
* **定義状態への調整** ＝
  Swarm マネージャーノードはクラスターの状態を常時監視しています。
  そして実際の状態と定義された状態との間に差異があれば調整を行います。
  たとえばコンテナーのレプリカを 10 にしてサービス設定を行っていて、そのレプリカ 2 つを受け持つワーカーマシンがクラッシュしたとします。
  マネージャーは新たなレプリカ 2 つを生成し直して、クラッシュしたレプリカを置き換えます。
  Swarm マネージャーは、利用可能な起動中のワーカーに対して、新たなレプリカを割り当てるものです。
@z

@x
* **Multi-host networking:** You can specify an overlay network for your
services. The swarm manager automatically assigns addresses to the containers
on the overlay network when it initializes or updates the application.
@y
* **マルチホストネットワーク** ＝
  サービスに対してオーバーレイネットワークを設定することができます。
  Swarm マネージャーは、アプリケーションの初期化や更新を行う際に、オーバーレイネットワーク上のコンテナーに対して、アドレスを自動的に割り当てます。
@z

@x
* **Service discovery:** Swarm manager nodes assign each service in the swarm a
unique DNS name and load balances running containers. You can query every
container running in the swarm through a DNS server embedded in the swarm.
@y
* **サービス検出** ＝
  Swarm マネージャーノードは、Swarm 内の各サービスに対して固有の DNS 名を割り当てます。
  そして実行コンテナーの負荷分散を行います。
  Swarm 内で稼動するコンテナーはすべて、Swarm 内に埋め込まれている DNS サーバーを通じて問い合わせることが可能です。
@z

@x
* **Load balancing:** You can expose the ports for services to an
external load balancer. Internally, the swarm lets you specify how to distribute
service containers between nodes.
@y
* **負荷分散** ＝
  各サービスのポートを外部のロードバランサーへ公開することができます。
  内部的に言えば Swarm は、ノード間においてサービスコンテナーをどのように分散するかを指定できるものです。
@z

@x
* **Secure by default:** Each node in the swarm enforces TLS mutual
authentication and encryption to secure communications between itself and all
other nodes. You have the option to use self-signed root certificates or
certificates from a custom root CA.
@y
* **デフォルトで安全** ＝
  Swarm 内の各ノードでは TLS 相互認証や暗号化が行われるものになっていて、そのノードそのものを含めた全ノード間でのセキュアな通信が行われます。
  自己署名ルート証明書や、カスタムルート CA に基づいた証明書を利用することもできます。
@z

@x
* **Rolling updates:** At rollout time you can apply service updates to nodes
incrementally. The swarm manager lets you control the delay between service
deployment to different sets of nodes. If anything goes wrong, you can
roll back to a previous version of the service.
@y
* **ローリングアップデート** ＝
  運用開始時には、ノードに対するサービスアップデートを追加的に適用していくことができます。
  さまざまなノードグループにおいてサービスデプロイのタイミングに差異があっても、Swarm マネージャーが管理してくれます。
  仮に何か問題が発生したときには、サービスバージョンを元に戻すことができます。
@z

@x
## What's next?
@y
{: #whats-next }
## 次にすることは
@z

@x
### Swarm mode key concepts and tutorial
@y
{: #swarm-mode-key-concepts-and-tutorial }
### Swarm モードの重要な考え方とチュートリアル
@z

@x
* Learn swarm mode [key concepts](key-concepts.md).
@y
* Swarm モードの [重要な考え方](key-concepts.md) について学ぶ。
@z

@x
* Get started with the [Swarm mode tutorial](swarm-tutorial/index.md).
@y
* [Swarm モードチュートリアル](swarm-tutorial/index.md) をはじめる。
@z

@x
### Swarm mode CLI commands
@y
{: #swarm-mode-cli-commands }
### Swarm モード CLI コマンド
@z

@x
Explore swarm mode CLI commands
@y
Swarm モード CLI コマンドを見てみます。
@z

@x
* [swarm init](../reference/commandline/swarm_init.md)
* [swarm join](../reference/commandline/swarm_join.md)
* [service create](../reference/commandline/service_create.md)
* [service inspect](../reference/commandline/service_inspect.md)
* [service ls](../reference/commandline/service_ls.md)
* [service rm](../reference/commandline/service_rm.md)
* [service scale](../reference/commandline/service_scale.md)
* [service ps](../reference/commandline/service_ps.md)
* [service update](../reference/commandline/service_update.md)
@y
* [swarm init](../reference/commandline/swarm_init.md)
* [swarm join](../reference/commandline/swarm_join.md)
* [service create](../reference/commandline/service_create.md)
* [service inspect](../reference/commandline/service_inspect.md)
* [service ls](../reference/commandline/service_ls.md)
* [service rm](../reference/commandline/service_rm.md)
* [service scale](../reference/commandline/service_scale.md)
* [service ps](../reference/commandline/service_ps.md)
* [service update](../reference/commandline/service_update.md)
@z
