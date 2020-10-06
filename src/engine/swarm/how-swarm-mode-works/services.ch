%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How swarm mode services work
keywords: docker, container, cluster, swarm mode, node
title: How services work
---
@y
---
description: How swarm mode services work
keywords: docker, container, cluster, swarm mode, node
title: サービスの動作
---
@z

@x
To deploy an application image when Docker Engine is in swarm mode, you create a
service. Frequently a service is the image for a microservice within the
context of some larger application. Examples of services might include an HTTP
server, a database, or any other type of executable program that you wish to run
in a distributed environment.
@y
{% comment %}
To deploy an application image when Docker Engine is in swarm mode, you create a
service. Frequently a service is the image for a microservice within the
context of some larger application. Examples of services might include an HTTP
server, a database, or any other type of executable program that you wish to run
in a distributed environment.
{% endcomment %}
Docker Engine が Swarm モードで稼動している場合、アプリケーションイメージのデプロイは、サービスを生成して行います。
サービスとしてよくあるのは、マイクロサービスを実現するイメージとして、一定規模のアプリケーションの内部に含まれます。
サービスの例としては、HTTP サーバーやデータベースがあります。
あるいは分散環境内において実行したいさまざまな実行プログラムがあります。
@z

@x
When you create a service, you specify which container image to use and which
commands to execute inside running containers. You also define options for the
service including:
@y
{% comment %}
When you create a service, you specify which container image to use and which
commands to execute inside running containers. You also define options for the
service including:
{% endcomment %}
サービスを生成する際には、どのコンテナーイメージがこれを利用するのか、また実行コンテナー内ではどのようなコマンドを実行するのかを指定します。
そしてサービスに対しては、以下に示すようなオプションを定義します。
@z

@x
* the port where the swarm makes the service available outside the swarm
* an overlay network for the service to connect to other services in the swarm
* CPU and memory limits and reservations
* a rolling update policy
* the number of replicas of the image to run in the swarm
@y
{% comment %}
* the port where the swarm makes the service available outside the swarm
* an overlay network for the service to connect to other services in the swarm
* CPU and memory limits and reservations
* a rolling update policy
* the number of replicas of the image to run in the swarm
{% endcomment %}
* Swarm の外部からサービスを利用するためのポート。
* Swarm 内において他サービスとのやりとりを行うための overlay ネットワーク。
* CPU やメモリに関する上限や確保。
* ローリングアップデートポリシー。
* Swarm 内において実行させるイメージのレプリカ数。
@z

@x
## Services, tasks, and containers
@y
{% comment %}
## Services, tasks, and containers
{% endcomment %}
{: #services-tasks-and-containers }
## サービス、タスク、コンテナー
@z

@x
When you deploy the service to the swarm, the swarm manager accepts your service
definition as the desired state for the service. Then it schedules the service
on nodes in the swarm as one or more replica tasks. The tasks run independently
of each other on nodes in the swarm.
@y
{% comment %}
When you deploy the service to the swarm, the swarm manager accepts your service
definition as the desired state for the service. Then it schedules the service
on nodes in the swarm as one or more replica tasks. The tasks run independently
of each other on nodes in the swarm.
{% endcomment %}
Swarm に対してサービスをデプロイすると、Swarm マネージャーはサービス定義を受け取ります。
そしてこれがサービスにとって望ましい状態が記されていることを解釈します。
マネージャーはこのサービスを Swarm 内ノードに向けて、複数のレプリカタスクとしてスケジューリングします。
タスクは Swarm内ノードの個々において独立して稼動します。
@z

@x
For example, imagine you want to load balance between three instances of an HTTP
listener. The diagram below shows an HTTP listener service with three replicas.
Each of the three instances of the listener is a task in the swarm.
@y
{% comment %}
For example, imagine you want to load balance between three instances of an HTTP
listener. The diagram below shows an HTTP listener service with three replicas.
Each of the three instances of the listener is a task in the swarm.
{% endcomment %}
たとえば HTTP リスナーのインスタンスが 3 つあって、これらの間で負荷分散を行うとします。
以下の図では 1 つの HTTP サービスにおいて 3 つのレプリカがあることを示しています。
リスナーインスタンスの 3 つは、それぞれが Swarm におけるタスクの 1 つです。
@z

@x
![services diagram](../images/services-diagram.png)
@y
{% comment %}
![services diagram](../images/services-diagram.png)
{% endcomment %}
![サービス図](../images/services-diagram.png)
@z

@x
A container is an isolated process. In the swarm mode model, each task invokes
exactly one container. A task is analogous to a “slot” where the scheduler
places a container. Once the container is live, the scheduler recognizes that
the task is in a running state. If the container fails health checks or
terminates, the task terminates.
@y
{% comment %}
A container is an isolated process. In the swarm mode model, each task invokes
exactly one container. A task is analogous to a “slot” where the scheduler
places a container. Once the container is live, the scheduler recognizes that
the task is in a running state. If the container fails health checks or
terminates, the task terminates.
{% endcomment %}
コンテナーは分離されたプロセスです。
Swarm モードモデルにおいては、各タスクから 1 つのコンテナーが呼び出されます。
タスクとは言ってみれば、スケジューラーがコンテナーを配置する「場所」のことです。
コンテナーが稼動していれば、スケジューラーはそこにあるタスクを起動状態にあるものとして認識します。
コンテナーがヘルスチェックに失敗したり終了したりすると、タスクは終了します。
@z

@x
## Tasks and scheduling
@y
{% comment %}
## Tasks and scheduling
{% endcomment %}
{: #tasks-and-scheduling }
## タスクとスケジューリング
@z

@x
A task is the atomic unit of scheduling within a swarm. When you declare a
desired service state by creating or updating a service, the orchestrator
realizes the desired state by scheduling tasks. For instance, you define a
service that instructs the orchestrator to keep three instances of an HTTP
listener running at all times. The orchestrator responds by creating three
tasks. Each task is a slot that the scheduler fills by spawning a container. The
container is the instantiation of the task. If an HTTP listener task subsequently
fails its health check or crashes, the orchestrator creates a new replica task
that spawns a new container.
@y
{% comment %}
A task is the atomic unit of scheduling within a swarm. When you declare a
desired service state by creating or updating a service, the orchestrator
realizes the desired state by scheduling tasks. For instance, you define a
service that instructs the orchestrator to keep three instances of an HTTP
listener running at all times. The orchestrator responds by creating three
tasks. Each task is a slot that the scheduler fills by spawning a container. The
container is the instantiation of the task. If an HTTP listener task subsequently
fails its health check or crashes, the orchestrator creates a new replica task
that spawns a new container.
{% endcomment %}
タスクとは Swarm 内においてスケジューリング対象となる最小単位のものです。
サービスの生成または更新を行って、そのサービスに期待する状態を宣言すると、オーケストレーターがスケジューリングされたタスクを通じて、期待される状態を実現します。
たとえばサービス定義として、オーケストレーターに対して HTTP リスナーを常時 3 インスタンス稼動し続けるようにしたとします。
オーケストレーターは、これに応じて 3 つのタスクを生成します。
各タスクは、コンテナーを起動させるものとしてスケジューラーが確保した「場所」です。
そしてコンテナーはタスクの実体です。
HTTP リスナーのタスクが連続してヘルスチェックに失敗するか、あるいはクラッシュしたとします。
そうなるとオーケストレーターは、新たなコンテナーを起動する新たなレプリカタスクを生成します。
@z

@x
A task is a one-directional mechanism. It progresses monotonically through a
series of states: assigned, prepared, running, etc. If the task fails the
orchestrator removes the task and its container and then creates a new task to
replace it according to the desired state specified by the service.
@y
{% comment %}
A task is a one-directional mechanism. It progresses monotonically through a
series of states: assigned, prepared, running, etc. If the task fails the
orchestrator removes the task and its container and then creates a new task to
replace it according to the desired state specified by the service.
{% endcomment %}
タスクは一方向の動作を行う仕組みになっています。
その状態は、割り当て済（assigned）、準備済（prepared）、実行中（running）といったように、単調に進んでいきます。
タスクが処理に失敗すると、オーケストレーターはそのタスクとコンテナーを削除します。
そしてサービスに対して期待された状態とされる定義に従って、新たなタスクを生成し置き換えます。
@z

@x
The underlying logic of Docker swarm mode is a general purpose scheduler and
orchestrator. The service and task abstractions themselves are unaware of the
containers they implement. Hypothetically, you could implement other types of
tasks such as virtual machine tasks or non-containerized process tasks. The
scheduler and orchestrator are agnostic about the type of task. However, the
current version of Docker only supports container tasks.
@y
{% comment %}
The underlying logic of Docker swarm mode is a general purpose scheduler and
orchestrator. The service and task abstractions themselves are unaware of the
containers they implement. Hypothetically, you could implement other types of
tasks such as virtual machine tasks or non-containerized process tasks. The
scheduler and orchestrator are agnostic about the type of task. However, the
current version of Docker only supports container tasks.
{% endcomment %}
Docker Swarm モードのベースにある考えとして、汎用目的のスケジューラーとオーケストレーターがあります。
抽象的なサービスやタスクというものがコンテナーを実現するわけですが、これらがコンテナーを認識しているわけではありません。
たとえばタスクは別の形で実装することも可能であって、それは仮想マシンのタスクやコンテナー化されていないプロセスタスクでも構わないのです。
スケジューラーやオーケストレーターとしては、タスクの種類は何であってもよいのですが、現行の Docker が対応するのは、コンテナータスクだけです。
@z

@x
The diagram below shows how swarm mode accepts service create requests and
schedules tasks to worker nodes.
@y
{% comment %}
The diagram below shows how swarm mode accepts service create requests and
schedules tasks to worker nodes.
{% endcomment %}
以下の図は、Swarm モードがどのようにしてサービス生成要求を受け入れて、ワーカーノードに向けてタスクをスケジューリングするかを示しています。
@z

@x
![services flow](../images/service-lifecycle.png)
@y
{% comment %}
![services flow](../images/service-lifecycle.png)
{% endcomment %}
![サービスの流れ](../images/service-lifecycle.png)
@z

@x
### Pending services
@y
{% comment %}
### Pending services
{% endcomment %}
{: #pending-services }
### サービスの保留
@z

@x
A service may be configured in such a way that no node currently in the
swarm can run its tasks. In this case, the service remains in state `pending`.
Here are a few examples of when a service might remain in state `pending`.
@y
{% comment %}
A service may be configured in such a way that no node currently in the
swarm can run its tasks. In this case, the service remains in state `pending`.
Here are a few examples of when a service might remain in state `pending`.
{% endcomment %}
サービス設定の仕方によっては、Swarm 内に現在あるノードすべてがタスクを起動しないようにすることができます。
そうした場合のサービスは保留（`pending`）という状態になります。
以下は、サービスが保留という状態を維持する例です。
@z

@x
> **Note**: If your only intention is to prevent a service from
being deployed, scale the service to 0 instead of trying to configure it in
such a way that it remains in `pending`.
@y
{% comment %}
> **Note**: If your only intention is to prevent a service from
being deployed, scale the service to 0 instead of trying to configure it in
such a way that it remains in `pending`.
{% endcomment %}
> **メモ**: 実現したいことが、サービスをデプロイしないようにするだけということであるなら、上のようにサービスを `pending` のままとする設定を行うのではなく、スケール値を 0 に設定してください。
@z

@x
- If all nodes are paused or drained, and you create a service, it is
  pending until a node becomes available. In reality, the first node to become
  available gets all of the tasks, so this is not a good thing to do in a
  production environment.
@y
{% comment %}
- If all nodes are paused or drained, and you create a service, it is
  pending until a node becomes available. In reality, the first node to become
  available gets all of the tasks, so this is not a good thing to do in a
  production environment.
{% endcomment %}
- ノードがすべて paused か drained である状態でサービスを生成すると、ノードが利用可能な状態になるまでは保留のままです。
  実際には、利用可能になった最初のノードがすべてのタスクを受け入れることになるため、本番環境においてこうなることは望ましいことではありません。
@z

@x
- You can reserve a specific amount of memory for a service. If no node in the
  swarm has the required amount of memory, the service remains in a pending
  state until a node is available which can run its tasks. If you specify a very
  large value, such as 500 GB, the task stays pending forever, unless you
  really have a node which can satisfy it.
@y
{% comment %}
- You can reserve a specific amount of memory for a service. If no node in the
  swarm has the required amount of memory, the service remains in a pending
  state until a node is available which can run its tasks. If you specify a very
  large value, such as 500 GB, the task stays pending forever, unless you
  really have a node which can satisfy it.
{% endcomment %}
- サービスに対しては特定容量のメモリを予約することができます。
  Swarm 内ノードにおいて、必要なメモリ容量を有するものが 1 つもない場合、サービスは保留状態のままであり、ノードがタスク実行可能な状態になるまで続きます。
  この値に 500 GB のような非常に大きな値を設定していると、タスクはずっと保留のままとなり、その容量を持ったノードが実際に現れるまで続きます。
@z

@x
- You can impose placement constraints on the service, and the constraints may
  not be able to be honored at a given time.
@y
{% comment %}
- You can impose placement constraints on the service, and the constraints may
  not be able to be honored at a given time.
{% endcomment %}
- サービスに対しては配置に関する制約を課すことができます。
  この制約は一定時間内に実現できない場合があります。
@z

@x
This behavior illustrates that the requirements and configuration of your tasks
are not tightly tied to the current state of the swarm. As the administrator of
a swarm, you declare the desired state of your swarm, and the manager works with
the nodes in the swarm to create that state. You do not need to micro-manage the
tasks on the swarm.
@y
{% comment %}
This behavior illustrates that the requirements and configuration of your tasks
are not tightly tied to the current state of the swarm. As the administrator of
a swarm, you declare the desired state of your swarm, and the manager works with
the nodes in the swarm to create that state. You do not need to micro-manage the
tasks on the swarm.
{% endcomment %}
上のような動作からわかることは、タスクに対する条件や設定は、Swarm のその時点での状態と完全に一致するものではないということです。
Swarm の管理者として行うのは、Swarm において期待される状態を宣言するだけであり、これによって Swarm 内においてマネージャーが各ノードとともに状態を作り上げていくことになります。
そこでは Swarm 上のタスクに対して細かく制御をしていく必要はありません。
@z

@x
## Replicated and global services
@y
{% comment %}
## Replicated and global services
{% endcomment %}
{: #replicated-and-global-services }
## 複製サービスとグローバルサービス
@z

@x
There are two types of service deployments, replicated and global.
@y
{% comment %}
There are two types of service deployments, replicated and global.
{% endcomment %}
サービスのデプロイ形式には、複製（replicated）とグローバル（global）という 2 種類があります。
@z

@x
For a replicated service, you specify the number of identical tasks you want to
run. For example, you decide to deploy an HTTP service with three replicas, each
serving the same content.
@y
{% comment %}
For a replicated service, you specify the number of identical tasks you want to
run. For example, you decide to deploy an HTTP service with three replicas, each
serving the same content.
{% endcomment %}
複製サービスの場合は、実行させたい複製タスク数を指定します。
たとえば HTTP サービスを 3 つのレプリカによりデプロイする場合、各レプリカは同一内容を提供します。
@z

@x
A global service is a service that runs one task on every node. There is no
pre-specified number of tasks. Each time you add a node to the swarm, the
orchestrator creates a task and the scheduler assigns the task to the new node.
Good candidates for global services are monitoring agents, an anti-virus
scanners or other types of containers that you want to run on every node in the
swarm.
@y
{% comment %}
A global service is a service that runs one task on every node. There is no
pre-specified number of tasks. Each time you add a node to the swarm, the
orchestrator creates a task and the scheduler assigns the task to the new node.
Good candidates for global services are monitoring agents, an anti-virus
scanners or other types of containers that you want to run on every node in the
swarm.
{% endcomment %}
グローバルサービスは、各ノードごとに 1 つのタスクを実行するサービスです。
ここでは、あらかじめ指定されるタスク数というものはありません。
Swarm に対して新たなノードを追加すると、そのたびにオーケストレーターはタスクを生成して、スケジューラーはそのノードに対してタスクを割り当てます。
グローバルサービスが適しているのは、監視エージェント、アンチウィルススキャナーなど、Swarm 内の各ノードごとに実行させたいコンテナーの場合です。
@z

@x
The diagram below shows a three-service replica in yellow and a global service
in gray.
@y
{% comment %}
The diagram below shows a three-service replica in yellow and a global service
in gray.
{% endcomment %}
以下の図では 3 つの複製サービスを黄色、1 つのグローバルサービスを灰色により表現しています。
@z

@x
![global vs replicated services](../images/replicated-vs-global.png)
@y
{% comment %}
![global vs replicated services](../images/replicated-vs-global.png)
{% endcomment %}
![グローバルサービス vs 複製サービス](../images/replicated-vs-global.png)
@z

@x
## Learn more
@y
{% comment %}
## Learn more
{% endcomment %}
{: #learn-more }
## さらに詳しく
@z

@x
* Read about how swarm mode [nodes](nodes.md) work.
* Learn how [PKI](pki.md) works in swarm mode.
@y
{% comment %}
* Read about how swarm mode [nodes](nodes.md) work.
* Learn how [PKI](pki.md) works in swarm mode.
{% endcomment %}
* Swarm モードの [ノード](nodes.md) の動作について。
* Swarm モードにおける [PKI](pki.md) 動作について。
@z
