%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How swarm nodes work
keywords: docker, container, cluster, swarm mode, node
redirect_from:
- /engine/swarm/how-swarm-mode-works/
title: How nodes work
---
@y
---
description: How swarm nodes work
keywords: docker, container, cluster, swarm mode, node
redirect_from:
- /engine/swarm/how-swarm-mode-works/
title: ノードの動作
---
@z

@x
Docker Engine 1.12 introduces swarm mode that enables you to create a
cluster of one or more Docker Engines called a swarm. A swarm consists
of one or more nodes: physical or virtual machines running Docker
Engine 1.12 or later in swarm mode.
@y
{% comment %}
Docker Engine 1.12 introduces swarm mode that enables you to create a
cluster of one or more Docker Engines called a swarm. A swarm consists
of one or more nodes: physical or virtual machines running Docker
Engine 1.12 or later in swarm mode.
{% endcomment %}
Docker Engine 1.12 において導入された Swarm モードでは、1 つあるいは複数の Docker Engine からなるクラスター、つまり Swarm と呼ぶものが生成できるようになりました。
1 つの Swarm はいくつかのノードから構成されていて、物理マシン仮想マシンを問わず、Docker Engine 1.12 またはそれ以降が Swarm モードにおいて稼動します。
@z

@x
There are two types of nodes: [**managers**](#manager-nodes) and
[**workers**](#worker-nodes).
@y
{% comment %}
There are two types of nodes: [**managers**](#manager-nodes) and
[**workers**](#worker-nodes).
{% endcomment %}
ノードには [**マネージャー**](#manager-nodes) と [**ワーカー**](#worker-nodes) という 2 つの種類があります。
@z

@x
![Swarm mode cluster](/engine/swarm/images/swarm-diagram.png)
@y
{% comment %}
![Swarm mode cluster](/engine/swarm/images/swarm-diagram.png)
{% endcomment %}
![Swarm モードクラスター](../images/swarm-diagram.png)
@z

@x
If you haven't already, read through the
[swarm mode overview](../index.md) and
[key concepts](../key-concepts.md).
@y
{% comment %}
If you haven't already, read through the
[swarm mode overview](../index.md) and
[key concepts](../key-concepts.md).
{% endcomment %}
[Swarm モード概要](../index.md) や [重要な考え方](../key-concepts.md) をまだ読んでいない方は、ざっと目を通してください。
@z

@x
## Manager nodes
@y
{% comment %}
## Manager nodes
{% endcomment %}
{: #manager-nodes }
## マネージャーノード
@z

@x
Manager nodes handle cluster management tasks:
@y
{% comment %}
Manager nodes handle cluster management tasks:
{% endcomment %}
マネージャーノードはクラスター管理タスクを取り扱います。
@z

@x
* maintaining cluster state
* scheduling services
* serving swarm mode [HTTP API endpoints](../../api/index.md)
@y
{% comment %}
* maintaining cluster state
* scheduling services
* serving swarm mode [HTTP API endpoints](../../api/index.md)
{% endcomment %}
* クラスター状態の管理。
* サービスのスケジュール管理。
* Swarm モードの [HTTP API endpoints](../../api/index.md) の提供。
@z

@x
Using a [Raft](https://raft.github.io/raft.pdf) implementation, the managers
maintain a consistent internal state of the entire swarm and all the services
running on it. For testing purposes it is OK to run a swarm with a single
manager. If the manager in a single-manager swarm fails, your services
continue to run, but you need to create a new cluster to recover.
@y
{% comment %}
Using a [Raft](https://raft.github.io/raft.pdf) implementation, the managers
maintain a consistent internal state of the entire swarm and all the services
running on it. For testing purposes it is OK to run a swarm with a single
manager. If the manager in a single-manager swarm fails, your services
continue to run, but you need to create a new cluster to recover.
{% endcomment %}
マネージャーにおいては [Raft](https://raft.github.io/raft.pdf) を利用することによって、Swarm 全体を一貫した状態に保ちながら、そこに稼動するサービスをすべて管理します。
テスト目的であれば、1 つのマネージャーからなる 1 つの Swarm を実行することも可能です。
もっともただ 1 つのマネージャーしか持たない Swarm においてマネージャーが処理に失敗すると、サービスは稼動し続けますが、復旧のためにはもう 1 つ新たなクラスターを生成しなければなりません。
@z

@x
To take advantage of swarm mode's fault-tolerance features, Docker recommends
you implement an odd number of nodes according to your organization's
high-availability requirements. When you have multiple managers you can recover
from the failure of a manager node without downtime.
@y
{% comment %}
To take advantage of swarm mode's fault-tolerance features, Docker recommends
you implement an odd number of nodes according to your organization's
high-availability requirements. When you have multiple managers you can recover
from the failure of a manager node without downtime.
{% endcomment %}
Swarm モードが持つ耐障害性（fault-tolerance）機能を活用するために、Docker では高可用性に関する開発方針に従って、奇数のノードを用意することを推奨しています。
複数のマネージャーを用意しておけば、マネージャーノードの 1 つに障害が発生しても、システムダウンをさせずに復旧することが可能になります。
@z

@x
* A three-manager swarm tolerates a maximum loss of one manager.
* A five-manager swarm tolerates a maximum simultaneous loss of two
manager nodes.
* An `N` manager cluster tolerates the loss of at most
`(N-1)/2` managers.
* Docker recommends a maximum of seven manager nodes for a swarm.
@y
{% comment %}
* A three-manager swarm tolerates a maximum loss of one manager.
* A five-manager swarm tolerates a maximum simultaneous loss of two
manager nodes.
* An `N` manager cluster tolerates the loss of at most
`(N-1)/2` managers.
* Docker recommends a maximum of seven manager nodes for a swarm.
{% endcomment %}
* Swarm 内に 3 つのマネージャーがあれば、最大で 1 つのマネージャーの障害に耐えられます。
* Swarm 内に 5 つのマネージャーがあれば、最大かつ同時に 2 つのマネージャーの障害に耐えられます。
* Swarm 内に `N` 個のマネージャーがあれば、最大で `(N-1)/2` 個のマネージャーの障害に耐えられます。
* Docker では、1 つの Swarm に対して最大 7 つのマネージャーを持つことを推奨します。
@z

@x
    >**Important Note**: Adding more managers does NOT mean increased
    scalability or higher performance. In general, the opposite is true.
@y
    {% comment %}
    >**Important Note**: Adding more managers does NOT mean increased
    scalability or higher performance. In general, the opposite is true.
    {% endcomment %}
    >**重要事項** より多くのマネージャーを加えたからといって、スケーラビリティーや性能が向上するわけでは **ありません**。
    > 一般的には、増やさないのが正しいことです。
@z

@x
## Worker nodes
@y
{% comment %}
## Worker nodes
{% endcomment %}
{: #worker-nodes }
## ワーカーノード
@z

@x
Worker nodes are also instances of Docker Engine whose sole purpose is to
execute containers. Worker nodes don't participate in the Raft distributed
state, make scheduling decisions, or serve the swarm mode HTTP API.
@y
{% comment %}
Worker nodes are also instances of Docker Engine whose sole purpose is to
execute containers. Worker nodes don't participate in the Raft distributed
state, make scheduling decisions, or serve the swarm mode HTTP API.
{% endcomment %}
ワーカーノードも Docker Engine のインスタンスです。
その唯一の目的はコンテナーを稼動させることです。
ワーカーノードは、Raft の分散状態の中には含まれず、スケジュール決定や Swarm モード HTTP API の提供も行いません。
@z

@x
You can create a swarm of one manager node, but you cannot have a worker node
without at least one manager node. By default, all managers are also workers.
In a single manager node cluster, you can run commands like `docker service
create` and the scheduler places all tasks on the local Engine.
@y
{% comment %}
You can create a swarm of one manager node, but you cannot have a worker node
without at least one manager node. By default, all managers are also workers.
In a single manager node cluster, you can run commands like `docker service
create` and the scheduler places all tasks on the local Engine.
{% endcomment %}
1 つの Swarm においてマネージャーノードを 1 つだけとすることは可能ですが、1 つのマネージャーノードも存在しないところに 1 つだけワーカーノードを生成することはできません。
デフォルトで、マネージャーは同時にワーカーとしても動作します。
1 つのマネージャーノードしか持たないクラスターにおいては、`docker service create` といったコマンドを実行すると、スケジューラーはタスクのすべてをローカルの Engine に配置することになります。
@z

@x
To prevent the scheduler from placing tasks on a manager node in a multi-node
swarm, set the availability for the manager node to `Drain`. The scheduler
gracefully stops tasks on nodes in `Drain` mode and schedules the tasks on an
`Active` node. The scheduler does not assign new tasks to nodes with `Drain`
availability.
@y
{% comment %}
To prevent the scheduler from placing tasks on a manager node in a multi-node
swarm, set the availability for the manager node to `Drain`. The scheduler
gracefully stops tasks on nodes in `Drain` mode and schedules the tasks on an
`Active` node. The scheduler does not assign new tasks to nodes with `Drain`
availability.
{% endcomment %}
複数ノードから構成される Swarm において、マネージャーに対してスケジューラーがタスクの割り当てを行わないようにするには、マネージャーノードの利用状態（availability）を `Drain` に設定します。
スケジューラーは `Drain` モードに設定されたノード上ではタスクを停止し、`Active` モードのタスクにはタスクをスケジューリングします。
スケジューラーは、利用状態が `Drain` であるようなノードに対しては、一切タスクを割り振ることはありません。
@z

@x
Refer to the [`docker node update`](../../reference/commandline/node_update.md)
command line reference to see how to change node availability.
@y
{% comment %}
Refer to the [`docker node update`](../../reference/commandline/node_update.md)
command line reference to see how to change node availability.
{% endcomment %}
コマンドラインリファレンスの [`docker node update`](../../reference/commandline/node_update.md) を参照して、ノードの利用状態の変更方法について確認してください。
@z

@x
## Change roles
@y
{% comment %}
## Change roles
{% endcomment %}
{: #change-roles }
## ロールの変更
@z

@x
You can promote a worker node to be a manager by running `docker node promote`.
For example, you may want to promote a worker node when you
take a manager node offline for maintenance. See [node promote](../../reference/commandline/node_promote.md).
@y
{% comment %}
You can promote a worker node to be a manager by running `docker node promote`.
For example, you may want to promote a worker node when you
take a manager node offline for maintenance. See [node promote](../../reference/commandline/node_promote.md).
{% endcomment %}
`docker node promote` を実行すれば、ワーカーノードをマネージャーノードに昇格させることができます。
たとえば、1 つのマネージャーノードを保守目的でオフラインとした場合には、別のワーカーノードを昇格させることが必要になる場合があります。
[node promote](../../reference/commandline/node_promote.md) を参照してください。
@z

@x
You can also demote a manager node to a worker node. See
[node demote](../../reference/commandline/node_demote.md).
@y
{% comment %}
You can also demote a manager node to a worker node. See
[node demote](../../reference/commandline/node_demote.md).
{% endcomment %}
マネージャーノードをワーカーノードに降格させることもできます。
[node demote](../../reference/commandline/node_demote.md) を参照してください。
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
* Read about how swarm mode [services](services.md) work.
* Learn how [PKI](pki.md) works in swarm mode.
@y
{% comment %}
* Read about how swarm mode [services](services.md) work.
* Learn how [PKI](pki.md) works in swarm mode.
{% endcomment %}
* Swarm モードの [サービス](services.md) の動作について。
* Swarm モードにおける [PKI](pki.md) 動作について。
@z
