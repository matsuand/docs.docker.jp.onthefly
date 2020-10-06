%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Introducing key concepts for Docker Engine swarm mode
keywords: docker, container, cluster, swarm mode
title: Swarm mode key concepts
---
@y
---
description: Introducing key concepts for Docker Engine swarm mode
keywords: docker, container, cluster, swarm mode
title: Swarm モードの重要な考え方
---
@z

@x
This topic introduces some of the concepts unique to the cluster management and
orchestration features of Docker Engine 1.12.
@y
{% comment %}
This topic introduces some of the concepts unique to the cluster management and
orchestration features of Docker Engine 1.12.
{% endcomment %}
ここでは Docker Engine 1.12 におけるクラスター管理とオーケストレーション機能に特有の考え方について説明します。
@z

@x
## What is a swarm?
@y
{% comment %}
## What is a swarm?
{% endcomment %}
{: #what-is-a-swarm }
## Swarm とは何か
@z

@x
The cluster management and orchestration features embedded in the Docker Engine
are built using [swarmkit](https://github.com/docker/swarmkit/). Swarmkit is a
separate project which implements Docker's orchestration layer and is used
directly within Docker.
@y
{% comment %}
The cluster management and orchestration features embedded in the Docker Engine
are built using [swarmkit](https://github.com/docker/swarmkit/). Swarmkit is a
separate project which implements Docker's orchestration layer and is used
directly within Docker.
{% endcomment %}
Docker Engine に組み込まれているクラスター管理とオーケストレーション機能は、[Swarmkit](https://github.com/docker/swarmkit/) を使って構築されています。
Swarmkit は Docker のオーケストレーション層を実装する別のプロジェクトですが、Docker 内において直接用いられています。
@z

@x
A swarm consists of multiple Docker hosts which run in **swarm mode** and act as
managers (to manage membership and delegation) and workers (which run
[swarm services](#services-and-tasks)). A given Docker host can
be a manager, a worker, or perform both roles. When you create a service, you
define its optimal state (number of replicas, network and storage resources
available to it, ports the service exposes to the outside world, and more).
Docker works to maintain that desired state. For instance, if a worker node
becomes unavailable, Docker schedules that node's tasks on other nodes. A _task_
is a running container which is part of a swarm service and managed by a swarm
manager, as opposed to a standalone container.
@y
{% comment %}
A swarm consists of multiple Docker hosts which run in **swarm mode** and act as
managers (to manage membership and delegation) and workers (which run
[swarm services](#services-and-tasks)). A given Docker host can
be a manager, a worker, or perform both roles. When you create a service, you
define its optimal state (number of replicas, network and storage resources
available to it, ports the service exposes to the outside world, and more).
Docker works to maintain that desired state. For instance, if a worker node
becomes unavailable, Docker schedules that node's tasks on other nodes. A _task_
is a running container which is part of a swarm service and managed by a swarm
manager, as opposed to a standalone container.
{% endcomment %}
Swarm とは、複数の Docker ホストが **Swarm モード** で稼動し、マネージャー（参加者を管理し代表となるノード）またはワーカー（[Swarm サービス](#services-and-tasks) を起動するノード）として振る舞います。
Docker ホストは、マネージャー、ワーカーのいずれになるか、あるいは両方の役割を持つことができます。
サービスを生成する際には、サービスの最適な状態（レプリカ数、利用可能なネットワークやストレージ、外部にサービスを公開するポート番号など）を定義します。
Docker は定義された状態を維持しながら動作します。
たとえばワーカーノードが利用不能になった場合、Docker はそのノードのタスクを別のノードに割り当てます。
**タスク** とは実行コンテナーのことであり、Swarm サービスの一部として Swarm マネージャーによって管理されます。
スタンドアロンコンテナーとは対照的なものです。
@z

@x
One of the key advantages of swarm services over standalone containers is that
you can modify a service's configuration, including the networks and volumes it
is connected to, without the need to manually restart the service. Docker will
update the configuration, stop the service tasks with the out of date
configuration, and create new ones matching the desired configuration.
@y
{% comment %}
One of the key advantages of swarm services over standalone containers is that
you can modify a service's configuration, including the networks and volumes it
is connected to, without the need to manually restart the service. Docker will
update the configuration, stop the service tasks with the out of date
configuration, and create new ones matching the desired configuration.
{% endcomment %}
Swarm サービスをスタンドアロンコンテナーと比べた場合の重要な利点は、接続されているネットワークやボリュームなどの設定内容を、サービスを再起動することなく変更できる点です。
Docker は設定内容を更新した上で、古くなった設定に基づいたサービスタスクを終了させ、定義された設定に従った新たなものを生成します。
@z

@x
When Docker is running in swarm mode, you can still run standalone containers
on any of the Docker hosts participating in the swarm, as well as swarm
services. A key difference between standalone containers and swarm services is
that only swarm managers can manage a swarm, while standalone containers can be
started on any daemon. Docker daemons can participate in a swarm as managers,
workers, or both.
@y
{% comment %}
When Docker is running in swarm mode, you can still run standalone containers
on any of the Docker hosts participating in the swarm, as well as swarm
services. A key difference between standalone containers and swarm services is
that only swarm managers can manage a swarm, while standalone containers can be
started on any daemon. Docker daemons can participate in a swarm as managers,
workers, or both.
{% endcomment %}
Docker が Swarm モードで稼動しているときに、Swarm に参加している Docker ホスト上では、スタンドアロンコンテナーも起動することができます。
Swarm サービスと同時に起動させることができます。
スタンドアロンコンテナーと Swarm サービスの重要な違いは、Swarm を管理するのは Swarm マネージャーだけであり、一方スタンドアロンコンテナーは Docker デーモン上で動作します。
Docker デーモンは Swarm 内に対して、マネージャー、ワーカー、あるいはその両方として参加します。
@z

@x
In the same way that you can use [Docker Compose](../../compose/index.md) to define and run
containers, you can define and run [Swarm service](services.md) stacks.
@y
{% comment %}
In the same way that you can use [Docker Compose](../../compose/index.md) to define and run
containers, you can define and run [Swarm service](services.md) stacks.
{% endcomment %}
[Docker Compose](../../compose/index.md) を使ってコンテナーを定義し実行した場合と同じように、[Swarm サービス](services.md) スタックを定義して実行することができます。
@z

@x
Keep reading for details about concepts relating to Docker swarm services,
including nodes, services, tasks, and load balancing.
@y
{% comment %}
Keep reading for details about concepts relating to Docker swarm services,
including nodes, services, tasks, and load balancing.
{% endcomment %}
Docker Swarm サービスに関する考え方の詳細を、これより読み進めてください。
以降ではノード、サービス、タスク、負荷分散について示します。
@z

@x
## Nodes
@y
{% comment %}
## Nodes
{% endcomment %}
{: #nodes }
## ノード
@z

@x
A **node** is an instance of the Docker engine participating in the swarm. You can also think of this as a Docker node. You can run one or more nodes on a single physical computer or cloud server, but production swarm deployments typically include Docker nodes distributed across multiple physical and cloud machines.
@y
{% comment %}
A **node** is an instance of the Docker engine participating in the swarm. You can also think of this as a Docker node. You can run one or more nodes on a single physical computer or cloud server, but production swarm deployments typically include Docker nodes distributed across multiple physical and cloud machines.
{% endcomment %}
**ノード** とは Swarm に参加している Docker Engine のインスタンスの 1 つのことです。
Docker ノードとして表現してかまいません。
1 つまたは複数のノードを、単一の物理コンピューターやクラウドサーバー上で実行することができます。
ただし本番環境での Swarm デプロイメントにおいては、通常は複数の物理マシンやクラウドマシンに分散された Docker ノードを利用します。
@z

@x
To deploy your application to a swarm, you submit a service definition to a
**manager node**. The manager node dispatches units of work called
[tasks](#services-and-tasks) to worker nodes.
@y
{% comment %}
To deploy your application to a swarm, you submit a service definition to a
**manager node**. The manager node dispatches units of work called
[tasks](#services-and-tasks) to worker nodes.
{% endcomment %}
Swarm に対してアプリケーションをデプロイするには、**マネージャーノード** に対してサービス定義を行う必要があります。
マネージャーノードは、[タスク](#services-and-tasks) と呼ばれる処理単位をワーカーノードに割り振ります。
@z

@x
Manager nodes also perform the orchestration and cluster management functions
required to maintain the desired state of the swarm. Manager nodes elect a
single leader to conduct orchestration tasks.
@y
{% comment %}
Manager nodes also perform the orchestration and cluster management functions
required to maintain the desired state of the swarm. Manager nodes elect a
single leader to conduct orchestration tasks.
{% endcomment %}
マネージャーノードはまた、Swarm の定義状態を維持するために必要となるオーケストレーション機能やクラスター管理機能を実現します。
マネージャーノードが 1 人のリーダーを選出して、オーケストレーションのタスクを指揮します。
@z

@x
**Worker nodes** receive and execute tasks dispatched from manager nodes.
By default manager nodes also run services as worker nodes, but you can
configure them to run manager tasks exclusively and be manager-only
nodes. An agent runs on each worker node and reports on the tasks assigned to
it. The worker node notifies the manager node of the current state of its
assigned tasks so that the manager can maintain the desired state of each
worker.
@y
{% comment %}
**Worker nodes** receive and execute tasks dispatched from manager nodes.
By default manager nodes also run services as worker nodes, but you can
configure them to run manager tasks exclusively and be manager-only
nodes. An agent runs on each worker node and reports on the tasks assigned to
it. The worker node notifies the manager node of the current state of its
assigned tasks so that the manager can maintain the desired state of each
worker.
{% endcomment %}
**ワーカーノード** は、マネージャーノードから割り振られたタスクを受け取り実行します。
デフォルトにおいてマネージャーノードは、ワーカーノードとしてサービス実行も行います。
ただし設定によってマネージャータスクのみを行い、マネージャーオンリーのノードとすることもできます。
エージェントというものが各ワーカーノード上に起動しており、そのノードに割り当てられたタスクに関する報告を行います。
ワーカーノードは割り当てられたタスクの現状態を、マネージャーに通知します。
マネージャーノードはこれによって、各ワーカーに定義された状態を維持管理できるようになっています。
@z

@x
## Services and tasks
@y
{% comment %}
## Services and tasks
{% endcomment %}
{: #services-and-tasks }
## サービスとタスク
@z

@x
A **service** is the definition of the tasks to execute on the manager or worker nodes. It
is the central structure of the swarm system and the primary root of user
interaction with the swarm.
@y
{% comment %}
A **service** is the definition of the tasks to execute on the manager or worker nodes. It
is the central structure of the swarm system and the primary root of user
interaction with the swarm.
{% endcomment %}
**サービス** とはタスク定義のことであり、マネージャーノードやワーカーノード上で実行されます。
これが Swarm システムの中心的な構成であり、Swarm に対してユーザーが対話するための対象となります。
@z

@x
When you create a service, you specify which container image to use and which
commands to execute inside running containers.
@y
{% comment %}
When you create a service, you specify which container image to use and which
commands to execute inside running containers.
{% endcomment %}
サービスを生成するときには、実行中の複数コンテナー内において、どのコンテナーイメージを利用し、どういったコマンドを実行するかを指示します。
@z

@x
In the **replicated services** model, the swarm manager distributes a specific
number of replica tasks among the nodes based upon the scale you set in the
desired state.
@y
{% comment %}
In the **replicated services** model, the swarm manager distributes a specific
number of replica tasks among the nodes based upon the scale you set in the
desired state.
{% endcomment %}
**複製サービス**（replicated service）モデルにおいては、定義されたスケールに基づいて、ノード間のタスクレプリカ数を Swarm マネージャーが配分します。
@z

@x
For **global services**, the swarm runs one task for the service on every
available node in the cluster.
@y
{% comment %}
For **global services**, the swarm runs one task for the service on every
available node in the cluster.
{% endcomment %}
**グローバルサービス** の場合、Swarm はクラスター内の利用可能ノード上に、このサービスにおける 1 つのタスクを実行します。
@z

@x
A **task** carries a Docker container and the commands to run inside the
container. It is the atomic scheduling unit of swarm. Manager nodes assign tasks
to worker nodes according to the number of replicas set in the service scale.
Once a task is assigned to a node, it cannot move to another node. It can only
run on the assigned node or fail.
@y
{% comment %}
A **task** carries a Docker container and the commands to run inside the
container. It is the atomic scheduling unit of swarm. Manager nodes assign tasks
to worker nodes according to the number of replicas set in the service scale.
Once a task is assigned to a node, it cannot move to another node. It can only
run on the assigned node or fail.
{% endcomment %}
**タスク** とは Docker コンテナーとその内部で実行されるコマンドを意味します。
これは Swarm に割り当てられる最小単位のものです。
マネージャーノードは、サービスのスケールとして設定されたレプリカ数に応じて、タスクをワーカーノードに割り当てます。
一度ノードに割り当てられたら、そのタスクは他のノードに移すことはできません。
タスクは割り当てられたノード上で実行されるか、そうでなければ失敗するだけです。
@z

@x
## Load balancing
@y
{% comment %}
## Load balancing
{% endcomment %}
{: #load-balancing }
## 負荷分散
@z

@x
The swarm manager uses **ingress load balancing** to expose the services you
want to make available externally to the swarm. The swarm manager can
automatically assign the service a **PublishedPort** or you can configure a
PublishedPort for the service. You can specify any unused port. If you do not
specify a port, the swarm manager assigns the service a port in the 30000-32767
range.
@y
{% comment %}
The swarm manager uses **ingress load balancing** to expose the services you
want to make available externally to the swarm. The swarm manager can
automatically assign the service a **PublishedPort** or you can configure a
PublishedPort for the service. You can specify any unused port. If you do not
specify a port, the swarm manager assigns the service a port in the 30000-32767
range.
{% endcomment %}
Swarm マネージャーは **Ingress 負荷分散** を利用して、Swarm の外部向けに利用可能としたいサービスを公開します。
Swarm マネージャーはサービスに対して **公開ポート**（PublishedPort）を自動で割り当てます。
公開ポートは設定により定めることもできます。
その場合、利用されていないポートであれば、どれでも設定可能です。
ポートを指定しなかった場合、Swarm マネージャーは 30000 から 32767 の範囲でポートを割り当てます。
@z

@x
External components, such as cloud load balancers, can access the service on the
PublishedPort of any node in the cluster whether or not the node is currently
running the task for the service.  All nodes in the swarm route ingress
connections to a running task instance.
@y
{% comment %}
External components, such as cloud load balancers, can access the service on the
PublishedPort of any node in the cluster whether or not the node is currently
running the task for the service.  All nodes in the swarm route ingress
connections to a running task instance.
{% endcomment %}
クラウドロードバランサーなどのような外部コンポーネントからは、クラスター内のどのノードに対しても、公開ポートを通じてサービスにアクセスすることができます。
この場合のノードは、サービスに対するタスクをその時点で実行しているかどうかには関係がありません。
Swarm 内のノードはすべて、実行中のタスクインスタンスに向けて Ingress による接続を行います。
@z

@x
Swarm mode has an internal DNS component that automatically assigns each service
in the swarm a DNS entry. The swarm manager uses **internal load balancing** to
distribute requests among services within the cluster based upon the DNS name of
the service.
@y
{% comment %}
Swarm mode has an internal DNS component that automatically assigns each service
in the swarm a DNS entry. The swarm manager uses **internal load balancing** to
distribute requests among services within the cluster based upon the DNS name of
the service.
{% endcomment %}
Swarm モードには内部 DNS コンポーネントがあり、Swarm 内の各サービスに対して自動的に DNS エントリーを割り当てます。
Swarm マネージャーは **内部負荷分散** を利用して、サービスの DNS 名に基づき、クラスター内のサービス間でのリクエストを分散します。
@z

@x
## What's next?
@y
{% comment %}
## What's next?
{% endcomment %}
{: #whats-next }
## 次にすることは
@z

@x
* Read the [Swarm mode overview](index.md).
* Get started with the [Swarm mode tutorial](swarm-tutorial/index.md).
@y
{% comment %}
* Read the [Swarm mode overview](index.md).
* Get started with the [Swarm mode tutorial](swarm-tutorial/index.md).
{% endcomment %}
* [Swarm モード概要](index.md) を読む。
* [Swarm モードチュートリアル](swarm-tutorial/index.md) をはじめる。
@z
