%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Manager administration guide
keywords: docker, container, swarm, manager, raft
redirect_from:
- /engine/swarm/manager-administration-guide/
title: Administer and maintain a swarm of Docker Engines
---
@y
---
description: Manager administration guide
keywords: docker, container, swarm, manager, raft
redirect_from:
- /engine/swarm/manager-administration-guide/
title: Docker Engine の Swarm 管理と保守
---
@z

@x
When you run a swarm of Docker Engines, **manager nodes** are the key components
for managing the swarm and storing the swarm state. It is important to
understand some key features of manager nodes to properly deploy and
maintain the swarm.
@y
{% comment %}
When you run a swarm of Docker Engines, **manager nodes** are the key components
for managing the swarm and storing the swarm state. It is important to
understand some key features of manager nodes to properly deploy and
maintain the swarm.
{% endcomment %}
Docker Engine において Swarm を起動している場合、**マネージャーノード** が主要な要素であり、Swarm を管理し、Swarm の状態を保持します。
ですからマネージャーノードの主な機能を理解しておくことが重要です。
これを知ることによって、適切なデプロイと Swarm の保守が可能になります。
@z

@x
Refer to [How nodes work](how-swarm-mode-works/nodes.md)
for a brief overview of Docker Swarm mode and the difference between manager and
worker nodes.
@y
{% comment %}
Refer to [How nodes work](how-swarm-mode-works/nodes.md)
for a brief overview of Docker Swarm mode and the difference between manager and
worker nodes.
{% endcomment %}
[ノードの動作](how-swarm-mode-works/nodes.md) を参照して、Docker Swarm モードの概要や、マネージャーノード、ワーカーノードの違いについて理解しておいてください。
@z

@x
## Operate manager nodes in a swarm
@y
{% comment %}
## Operate manager nodes in a swarm
{% endcomment %}
{: #operate-manager-nodes-in-a-swarm }
## Swarm におけるマネージャーノードの操作
@z

@x
Swarm manager nodes use the [Raft Consensus Algorithm](raft.md) to manage the
swarm state. You only need to understand some general concepts of Raft in
order to manage a swarm.
@y
{% comment %}
Swarm manager nodes use the [Raft Consensus Algorithm](raft.md) to manage the
swarm state. You only need to understand some general concepts of Raft in
order to manage a swarm.
{% endcomment %}
Swarm マネージャーノードは [Raft 合意アルゴリズム](raft.md)（Raft Consensus Algorithm）を利用して、Swarm の状態を管理しています。
Swarm を管理する上では、Raft の一般的な考え方をいくつか理解しておくだけで十分です。
@z

@x
There is no limit on the number of manager nodes. The decision about how many
manager nodes to implement is a trade-off between performance and
fault-tolerance. Adding manager nodes to a swarm makes the swarm more
fault-tolerant. However, additional manager nodes reduce write performance
because more nodes must acknowledge proposals to update the swarm state.
This means more network round-trip traffic.
@y
{% comment %}
There is no limit on the number of manager nodes. The decision about how many
manager nodes to implement is a trade-off between performance and
fault-tolerance. Adding manager nodes to a swarm makes the swarm more
fault-tolerant. However, additional manager nodes reduce write performance
because more nodes must acknowledge proposals to update the swarm state.
This means more network round-trip traffic.
{% endcomment %}
マネージャーノードの数には制限がありません。
マネージャーノードをいくつに設定するかは、性能とフォールトトレランスとのトレードオフです。
マネージャーノードを Swarm に追加すれば、障害には強くなります。
しかしマネージャーノードが増えれば書き込み性能は低下します。
Swarm 状態の更新処理を、より多くのノードにおいて受けつけなければならないからです。
これはつまりネットワークのラウンドトリップトラフィックを意味します。
@z

@x
Raft requires a majority of managers, also called the quorum, to agree on
proposed updates to the swarm, such as node additions or removals. Membership
operations are subject to the same constraints as state replication.
@y
{% comment %}
Raft requires a majority of managers, also called the quorum, to agree on
proposed updates to the swarm, such as node additions or removals. Membership
operations are subject to the same constraints as state replication.
{% endcomment %}
Raft では Swarm において提案される更新処理、たとえばノード追加や削除といった処理に対して、多数のマネージャーが承認する必要があります。
多数というのは quorum とも呼ばれます。
メンバーに関わる処理に関しては、状態レプリケーションと同様の制約が適用されます。
@z

@x
### Maintain the quorum of managers
@y
{% comment %}
### Maintain the quorum of managers
{% endcomment %}
{: #maintain-the-quorum-of-managers }
### マネージャーの quorum 管理
@z

@x
If the swarm loses the quorum of managers, the swarm cannot perform management
tasks. If your swarm has multiple managers, always have more than two.
To maintain quorum, a majority of managers must be available. An odd number of
managers is recommended, because the next even number does not make the quorum
easier to keep. For instance, whether you have 3 or 4 managers, you can still
only lose 1 manager and maintain the quorum. If you have 5 or 6 managers, you
can still only lose two.
@y
{% comment %}
If the swarm loses the quorum of managers, the swarm cannot perform management
tasks. If your swarm has multiple managers, always have more than two.
To maintain quorum, a majority of managers must be available. An odd number of
managers is recommended, because the next even number does not make the quorum
easier to keep. For instance, whether you have 3 or 4 managers, you can still
only lose 1 manager and maintain the quorum. If you have 5 or 6 managers, you
can still only lose two.
{% endcomment %}
Swarm がマネージャーの quorum（多数票）を得られなかった場合、この Swarm は管理タスクを実行できません。
Swarm のマネージャーを複数にする場合は、必ず 3 つ以上にしてください。
quorum を維持するためには、マネージャーが多数いるという状態がなければなりません。
マネージャー数は奇数にすることが推奨されています。
仮にもう 1 つ加えて偶数にしてしまうと quorum を簡単には取り扱えなくなります。
たとえばマネージャー数が 3 つあるいは 4 つである場合、1 つのマネージャーを失っても quorum を維持することができます。これが 5 つあるいは 6 つであれば 2 つまでなら失っても維持が可能です。
@z

@x
Even if a swarm loses the quorum of managers, swarm tasks on existing worker
nodes continue to run. However, swarm nodes cannot be added, updated, or
removed, and new or existing tasks cannot be started, stopped, moved, or
updated.
@y
{% comment %}
Even if a swarm loses the quorum of managers, swarm tasks on existing worker
nodes continue to run. However, swarm nodes cannot be added, updated, or
removed, and new or existing tasks cannot be started, stopped, moved, or
updated.
{% endcomment %}
仮に Swarm がマネージャーの quorum を維持できなくなったとしても、既存のワーカーノード上での Swarm タスクは処理続行されます。
ただし Swarm ノードの追加、更新、削除はできなくなります。
さらに新規や既存のタスクに対する起動、停止、移動、更新ができなくなります。
@z

@x
See [Recovering from losing the quorum](#recover-from-losing-the-quorum) for
troubleshooting steps if you do lose the quorum of managers.
@y
{% comment %}
See [Recovering from losing the quorum](#recover-from-losing-the-quorum) for
troubleshooting steps if you do lose the quorum of managers.
{% endcomment %}
マネージャーが quorum を失った場合の対処方法については [quorum を失ってからの回復](#recover-from-losing-the-quorum) を参照してください。
@z

@x
## Configure the manager to advertise on a static IP address
@y
{% comment %}
## Configure the manager to advertise on a static IP address
{% endcomment %}
{: #configure-the-manager-to-advertise-on-a-static-ip-address }
## マネージャーの通知アドレスへのスタティック IP アドレス設定
@z

@x
When initiating a swarm, you must specify the `--advertise-addr` flag to
advertise your address to other manager nodes in the swarm. For more
information, see [Run Docker Engine in swarm mode](swarm-mode.md#configure-the-advertise-address). Because manager nodes are
meant to be a stable component of the infrastructure, you should use a *fixed
IP address* for the advertise address to prevent the swarm from becoming
unstable on machine reboot.
@y
{% comment %}
When initiating a swarm, you must specify the `--advertise-addr` flag to
advertise your address to other manager nodes in the swarm. For more
information, see [Run Docker Engine in swarm mode](swarm-mode.md#configure-the-advertise-address). Because manager nodes are
meant to be a stable component of the infrastructure, you should use a *fixed
IP address* for the advertise address to prevent the swarm from becoming
unstable on machine reboot.
{% endcomment %}
Swarm を初期化する際には`--advertise-addr`フラグの指定により、Swarm ないの別のマネージャーノードに対して自身のアドレスを通知（advertise）する必要があります。
詳しくは[Swarm モードによる Docker Engine の実行](swarm-mode.md#configure-the-advertise-address) を参照してください。
マネージャーノードはそのインフラストラクチャーの中でも安定した構成要素であることが求められます。
したがって通知アドレスには **固定 IP アドレス** を指定すべきであり、これによってマシンの再起動を行っても Swarm が不安定にならないようにする必要があります。
@z

@x
If the whole swarm restarts and every manager node subsequently gets a new IP
address, there is no way for any node to contact an existing manager. Therefore
the swarm is hung while nodes try to contact one another at their old IP addresses.
@y
{% comment %}
If the whole swarm restarts and every manager node subsequently gets a new IP
address, there is no way for any node to contact an existing manager. Therefore
the swarm is hung while nodes try to contact one another at their old IP addresses.
{% endcomment %}
Swarm 全体が再起動してマネージャーノードが次々に新たな IP アドレスを取得したら、どのノードもマネージャーに接続できなくなります。
そして各ノードは、お互いに古い IP アドレスを使ってアクセスしようと試みるために Swarm がハングしてしまいます。
@z

@x
Dynamic IP addresses are OK for worker nodes.
@y
{% comment %}
Dynamic IP addresses are OK for worker nodes.
{% endcomment %}
動的 IP アドレスはワーカーノードに対してなら用いてもかまいません。
@z

@x
## Add manager nodes for fault tolerance
@y
{% comment %}
## Add manager nodes for fault tolerance
{% endcomment %}
{: #add-manager-nodes-for-fault-tolerance }
## 耐障害性のためのマネージャーノード追加
@z

@x
You should maintain an odd number of managers in the swarm to support manager
node failures. Having an odd number of managers ensures that during a network
partition, there is a higher chance that the quorum remains available to process
requests if the network is partitioned into two sets. Keeping the quorum is not
guaranteed if you encounter more than two network partitions.
@y
{% comment %}
You should maintain an odd number of managers in the swarm to support manager
node failures. Having an odd number of managers ensures that during a network
partition, there is a higher chance that the quorum remains available to process
requests if the network is partitioned into two sets. Keeping the quorum is not
guaranteed if you encounter more than two network partitions.
{% endcomment %}
Swarm においてノード障害に対処するには、マネージャーノード数を奇数に保つことが必要です。
マネージャーを奇数にしておくと、ネットワークパーティション分割の処理が発生した際に、そのパーティンションがちょうど 2 つに分かれたのであれば、quorum がリクエストを処理し続けられる可能性が確実に高まります。
なおネットワークパーティションが 3 つ以上に分かれた場合には quorum の機能維持は保証されません。
@z

@x
| Swarm Size |  Majority  |  Fault Tolerance  |
|:------------:|:----------:|:-----------------:|
|      1       |     1      |         0         |
|      2       |     2      |         0         |
|    **3**     |     2      |       **1**       |
|      4       |     3      |         1         |
|    **5**     |     3      |       **2**       |
|      6       |     4      |         2         |
|    **7**     |     4      |       **3**       |
|      8       |     5      |         3         |
|    **9**     |     5      |       **4**       |
@y
{% comment %}
| Swarm Size |  Majority  |  Fault Tolerance  |
|:------------:|:----------:|:-----------------:|
|      1       |     1      |         0         |
|      2       |     2      |         0         |
|    **3**     |     2      |       **1**       |
|      4       |     3      |         1         |
|    **5**     |     3      |       **2**       |
|      6       |     4      |         2         |
|    **7**     |     4      |       **3**       |
|      8       |     5      |         3         |
|    **9**     |     5      |       **4**       |
{% endcomment %}
| Swarm サイズ |  多数票    |  耐障害性         |
|:------------:|:----------:|:-----------------:|
|      1       |     1      |         0         |
|      2       |     2      |         0         |
|    **3**     |     2      |       **1**       |
|      4       |     3      |         1         |
|    **5**     |     3      |       **2**       |
|      6       |     4      |         2         |
|    **7**     |     4      |       **3**       |
|      8       |     5      |         3         |
|    **9**     |     5      |       **4**       |
@z

@x
For example, in a swarm with *5 nodes*, if you lose *3 nodes*, you don't have a
quorum. Therefore you can't add or remove nodes until you recover one of the
unavailable manager nodes or recover the swarm with disaster recovery
commands. See [Recover from disaster](#recover-from-disaster).
@y
{% comment %}
For example, in a swarm with *5 nodes*, if you lose *3 nodes*, you don't have a
quorum. Therefore you can't add or remove nodes until you recover one of the
unavailable manager nodes or recover the swarm with disaster recovery
commands. See [Recover from disaster](#recover-from-disaster).
{% endcomment %}
たとえば **5 つのノード** からなる Swarm において **3 つのノード** を失ったら、quorum は 1 つもありません。
こうなるとノードの追加や削除はできなくなります。
利用不能になったマネージャーノードを復旧するか、障害回復のためのコマンドを使って Swarm を回復させなければなりません。
[障害からの復旧](#recover-from-disaster) を参照してください。
@z

@x
While it is possible to scale a swarm down to a single manager node, it is
impossible to demote the last manager node. This ensures you maintain access to
the swarm and that the swarm can still process requests. Scaling down to a
single manager is an unsafe operation and is not recommended. If
the last node leaves the swarm unexpectedly during the demote operation, the
swarm becomes unavailable until you reboot the node or restart with
`--force-new-cluster`.
@y
{% comment %}
While it is possible to scale a swarm down to a single manager node, it is
impossible to demote the last manager node. This ensures you maintain access to
the swarm and that the swarm can still process requests. Scaling down to a
single manager is an unsafe operation and is not recommended. If
the last node leaves the swarm unexpectedly during the demote operation, the
swarm becomes unavailable until you reboot the node or restart with
`--force-new-cluster`.
{% endcomment %}
Swarm をスケールダウンして単一のマネージャーノードにすることは可能ですが、最後に残るマネージャーノードを降格させることはできません。
最低 1 つのマネージャーを残しておかないと、Swarm にアクセスできなくなり、リクエストを処理することができなくなります。
ただし単一のマネージャーノードにスケールダウンすることは、安全な操作とは言えないため推奨されません。
その最後のノードが降格処理の際に、図らずも Swarm から離れてしまった場合、Swarm を操作することはできなくなります。
これを復旧するには、ノードを再起動するか、あるいは`--force-new-cluster`を使って再起動することが必要になります。
@z

@x
You manage swarm membership with the `docker swarm` and `docker node`
subsystems. Refer to [Add nodes to a swarm](join-nodes.md) for more information
on how to add worker nodes and promote a worker node to be a manager.
@y
{% comment %}
You manage swarm membership with the `docker swarm` and `docker node`
subsystems. Refer to [Add nodes to a swarm](join-nodes.md) for more information
on how to add worker nodes and promote a worker node to be a manager.
{% endcomment %}
Swarm へのメンバー管理には、サブシステム`docker swarm`および`docker node`を利用します。
ワーカーノードの追加方法や、マネージャーノードへの昇格方法についての詳細は、[Swarm へのノード追加](join-nodes.md) を参照してください。
@z

@x
### Distribute manager nodes
@y
{% comment %}
### Distribute manager nodes
{% endcomment %}
{: #distribute-manager-nodes }
### 分散マネージャーノード
@z

@x
In addition to maintaining an odd number of manager nodes, pay attention to
datacenter topology when placing managers. For optimal fault-tolerance, distribute
manager nodes across a minimum of 3 availability-zones to support failures of an
entire set of machines or common maintenance scenarios. If you suffer a failure
in any of those zones, the swarm should maintain the quorum of manager nodes
available to process requests and rebalance workloads.
@y
{% comment %}
In addition to maintaining an odd number of manager nodes, pay attention to
datacenter topology when placing managers. For optimal fault-tolerance, distribute
manager nodes across a minimum of 3 availability-zones to support failures of an
entire set of machines or common maintenance scenarios. If you suffer a failure
in any of those zones, the swarm should maintain the quorum of manager nodes
available to process requests and rebalance workloads.
{% endcomment %}
マネージャーノードを奇数に維持することに加えて、マネージャーの配置に関してはデータセンターのトポロジーに配慮することも必要です。
最適なフォールトトレランスを実現するには、最低でも 3 つのアベイラビリティーゾーン（availability-zones）にマネージャーノードを分散して、マシン全体の障害へ対処したり、一般的なメンテナンス計画を立てたりすることが求められます。
いずれかのゾーンにおいて障害が発生したとしても、Swarm はマネージャーノードの quorum を維持することが可能であり、リクエストを処理し負荷を分散することが可能になります。
@z

@x
| Swarm manager nodes |  Repartition (on 3 Availability zones) |
|:-------------------:|:--------------------------------------:|
| 3                   |                  1-1-1                 |
| 5                   |                  2-2-1                 |
| 7                   |                  3-2-2                 |
| 9                   |                  3-3-3                 |
@y
{% comment %}
| Swarm manager nodes |  Repartition (on 3 Availability zones) |
|:-------------------:|:--------------------------------------:|
| 3                   |                  1-1-1                 |
| 5                   |                  2-2-1                 |
| 7                   |                  3-2-2                 |
| 9                   |                  3-3-3                 |
{% endcomment %}
| Swarm マネージャーノード |  再パーティション化 (3 つのアベイラビリティーゾーン) |
|:-------------------:|:--------------------------------------:|
| 3                   |                  1-1-1                 |
| 5                   |                  2-2-1                 |
| 7                   |                  3-2-2                 |
| 9                   |                  3-3-3                 |
@z

@x
### Run manager-only nodes
@y
{% comment %}
### Run manager-only nodes
{% endcomment %}
{: #run-manager-only-nodes }
### マネージャーノードのみの実行
@z

@x
By default manager nodes also act as a worker nodes. This means the scheduler
can assign tasks to a manager node. For small and non-critical swarms
assigning tasks to managers is relatively low-risk as long as you schedule
services using **resource constraints** for *cpu* and *memory*.
@y
{% comment %}
By default manager nodes also act as a worker nodes. This means the scheduler
can assign tasks to a manager node. For small and non-critical swarms
assigning tasks to managers is relatively low-risk as long as you schedule
services using **resource constraints** for *cpu* and *memory*.
{% endcomment %}
マネージャーノードは、デフォルトでワーカーノードとしても動作します。
つまりスケジューラーはマネージャーノードに対してもタスクを割り振るということです。
小さくて重大性の高くない Swarm の場合、マネージャーノードへのタスクの割り当ては比較的低リスクです。
サービスのスケジュールにあたって **CPU** や **メモリ** に対する **リソース制約** を適切に行っておけば十分です。
@z

@x
However, because manager nodes use the Raft consensus algorithm to replicate data
in a consistent way, they are sensitive to resource starvation. You should
isolate managers in your swarm from processes that might block swarm
operations like swarm heartbeat or leader elections.
@y
{% comment %}
However, because manager nodes use the Raft consensus algorithm to replicate data
in a consistent way, they are sensitive to resource starvation. You should
isolate managers in your swarm from processes that might block swarm
operations like swarm heartbeat or leader elections.
{% endcomment %}
しかしマネージャーノードでは Raft 合意アルゴリズム（Raft consensus algorithm）を利用して、一貫した方法によりデータ複製を行っています。
そのためリソースが枯渇することは大いに問題となります。
したがって Swarm のハートビートやリーダー選択のような Swarm 操作に支障をきたすような処理は、マネージャーに行わせないことが必要です。
@z

@x
To avoid interference with manager node operation, you can drain manager nodes
to make them unavailable as worker nodes:
@y
{% comment %}
To avoid interference with manager node operation, you can drain manager nodes
to make them unavailable as worker nodes:
{% endcomment %}
マネージャーノード処理への影響を避けるためには、マネージャーノードを排出（drain）させて、ワーカーノードとしては利用できなくします。
@z

@x
```bash
docker node update --availability drain <NODE>
```
@y
```bash
docker node update --availability drain <NODE>
```
@z

@x
When you drain a node, the scheduler reassigns any tasks running on the node to
other available worker nodes in the swarm. It also prevents the scheduler from
assigning tasks to the node.
@y
{% comment %}
When you drain a node, the scheduler reassigns any tasks running on the node to
other available worker nodes in the swarm. It also prevents the scheduler from
assigning tasks to the node.
{% endcomment %}
ノードを排出したらそのノード上の実行タスクは、スケジューラーが Swarm 内の別のワーカーノードに再割り当てします。
そしてスケジューラーは、そのノードへのタスク割り当てを行わなくなります。
@z

@x
## Add worker nodes for load balancing
@y
{% comment %}
## Add worker nodes for load balancing
{% endcomment %}
{: #add-worker-nodes-for-load-balancing }
## 負荷分散のためのワーカーノード追加
@z

@x
[Add nodes to the swarm](join-nodes.md) to balance your swarm's
load. Replicated service tasks are distributed across the swarm as evenly as
possible over time, as long as the worker nodes are matched to the requirements
of the services. When limiting a service to run on only specific types of nodes,
such as nodes with a specific number of CPUs or amount of memory, remember that
worker nodes that do not meet these requirements cannot run these tasks.
@y
{% comment %}
[Add nodes to the swarm](join-nodes.md) to balance your swarm's
load. Replicated service tasks are distributed across the swarm as evenly as
possible over time, as long as the worker nodes are matched to the requirements
of the services. When limiting a service to run on only specific types of nodes,
such as nodes with a specific number of CPUs or amount of memory, remember that
worker nodes that do not meet these requirements cannot run these tasks.
{% endcomment %}
[Swarm へのノード参加](join-nodes.md) を行うことで、Swarm 内の負荷を分散することができます。
複製されたサービスタスクは Swarm 全体にわたって分散されますが、それはどれくらいの時間であっても、ワーカーノードがサービス条件を満たしている限り行われます。
特定タイプのノード上でしかサービスを実行できない制限があるとします。
たとえば所定の CPU 数やメモリ容量が要求されるような場合です。
そういった条件を満たさないワーカーノード上では、タスクが実行できない点を覚えておいてください。
@z

@x
## Monitor swarm health
@y
{% comment %}
## Monitor swarm health
{% endcomment %}
## Swarm の健康状態の監視
@z

@x
You can monitor the health of manager nodes by querying the docker `nodes` API
in JSON format through the `/nodes` HTTP endpoint. Refer to the
[nodes API documentation](/engine/api/v1.25/#tag/Node)
for more information.
@y
{% comment %}
You can monitor the health of manager nodes by querying the docker `nodes` API
in JSON format through the `/nodes` HTTP endpoint. Refer to the
[nodes API documentation](/engine/api/v1.25/#tag/Node)
for more information.
{% endcomment %}
マネージャーノードの健康状態（health）を監視するには、Docker の`nodes` API を使い、HTTP のエンドポイント`/nodes`から JSON 書式により確認することができます。
詳しくは [nodes API のドキュメント](/engine/api/v1.25/#tag/Node) を参照してください。
@z

@x
From the command line, run `docker node inspect <id-node>` to query the nodes.
For instance, to query the reachability of the node as a manager:
@y
{% comment %}
From the command line, run `docker node inspect <id-node>` to query the nodes.
For instance, to query the reachability of the node as a manager:
{% endcomment %}
コマンドラインからは`docker node inspect <id-node>`を実行して、ノードを調べることができます。
たとえばノードに、マネージャーとしての到達性能（reachability）があるかどうかを調べるには、以下を実行します。
@z

@x
{% raw %}
```bash
docker node inspect manager1 --format "{{ .ManagerStatus.Reachability }}"
reachable
```
{% endraw %}
@y
{% raw %}
```bash
docker node inspect manager1 --format "{{ .ManagerStatus.Reachability }}"
reachable
```
{% endraw %}
@z

@x
To query the status of the node as a worker that accept tasks:
@y
{% comment %}
To query the status of the node as a worker that accept tasks:
{% endcomment %}
ワーカーノードとしてタスクの受け入れが可能であるかを確認するには、以下を実行します。
@z

@x
{% raw %}
```bash
docker node inspect manager1 --format "{{ .Status.State }}"
ready
```
{% endraw %}
@y
{% raw %}
```bash
docker node inspect manager1 --format "{{ .Status.State }}"
ready
```
{% endraw %}
@z

@x
From those commands, we can see that `manager1` is both at the status
`reachable` as a manager and `ready` as a worker.
@y
{% comment %}
From those commands, we can see that `manager1` is both at the status
`reachable` as a manager and `ready` as a worker.
{% endcomment %}
上のコマンドから`manager1`は、マネージャーとしては`reachable`（到達可能）であり、ワーカーとしては`ready`（受け入れ可能）であることがわかります。
@z

@x
An `unreachable` health status means that this particular manager node is unreachable
from other manager nodes. In this case you need to take action to restore the unreachable
manager:
@y
{% comment %}
An `unreachable` health status means that this particular manager node is unreachable
from other manager nodes. In this case you need to take action to restore the unreachable
manager:
{% endcomment %}
健康状態が`unreachable`（到達不能）であるのは、このマネージャーノードが他のマネージャーノードから到達できないことを意味します。
この場合、到達不能なマネージャーノードは復旧させる措置が必要になります。
@z

@x
- Restart the daemon and see if the manager comes back as reachable.
- Reboot the machine.
- If neither restarting or rebooting work, you should add another manager node or promote a worker to be a manager node. You also need to cleanly remove the failed node entry from the manager set with `docker node demote <NODE>` and `docker node rm <id-node>`.
@y
{% comment %}
- Restart the daemon and see if the manager comes back as reachable.
- Reboot the machine.
- If neither restarting or rebooting work, you should add another manager node or promote a worker to be a manager node. You also need to cleanly remove the failed node entry from the manager set with `docker node demote <NODE>` and `docker node rm <id-node>`.
{% endcomment %}
- デーモンを再起動し、マネージャーが到達可能に戻るかどうかを確認します。
- マシンを再起動します。
- 上の 2 つの再起動を行っても動作しない場合は、新たなマネージャーノードを追加するか、ワーカーノードをマネージャーに昇格させます。
  そしてマネージャーから障害ノードのエントリを削除する必要があるので、`docker node demote <NODE>`と`docker node rm <id-node>`を実行します。
@z

@x
Alternatively you can also get an overview of the swarm health from a manager
node with `docker node ls`:
@y
{% comment %}
Alternatively you can also get an overview of the swarm health from a manager
node with `docker node ls`:
{% endcomment %}
上とは別に、Swarm の健康状態の概要を確認するには、マネージャーノードから以下のように`docker node ls`を実行します。
@z

@x
```bash

docker node ls
ID                           HOSTNAME  MEMBERSHIP  STATUS  AVAILABILITY  MANAGER STATUS
1mhtdwhvsgr3c26xxbnzdc3yp    node05    Accepted    Ready   Active
516pacagkqp2xc3fk9t1dhjor    node02    Accepted    Ready   Active        Reachable
9ifojw8of78kkusuc4a6c23fx *  node01    Accepted    Ready   Active        Leader
ax11wdpwrrb6db3mfjydscgk7    node04    Accepted    Ready   Active
bb1nrq2cswhtbg4mrsqnlx1ck    node03    Accepted    Ready   Active        Reachable
di9wxgz8dtuh9d2hn089ecqkf    node06    Accepted    Ready   Active
```
@y
```bash

docker node ls
ID                           HOSTNAME  MEMBERSHIP  STATUS  AVAILABILITY  MANAGER STATUS
1mhtdwhvsgr3c26xxbnzdc3yp    node05    Accepted    Ready   Active
516pacagkqp2xc3fk9t1dhjor    node02    Accepted    Ready   Active        Reachable
9ifojw8of78kkusuc4a6c23fx *  node01    Accepted    Ready   Active        Leader
ax11wdpwrrb6db3mfjydscgk7    node04    Accepted    Ready   Active
bb1nrq2cswhtbg4mrsqnlx1ck    node03    Accepted    Ready   Active        Reachable
di9wxgz8dtuh9d2hn089ecqkf    node06    Accepted    Ready   Active
```
@z

@x
## Troubleshoot a manager node
@y
{% comment %}
## Troubleshoot a manager node
{% endcomment %}
{: #troubleshoot-a-manager-node }
## マネージャーノードのトラブルシューティング
@z

@x
You should never restart a manager node by copying the `raft` directory from another node. The data directory is unique to a node ID. A node can only use a node ID once to join the swarm. The node ID space should be globally unique.
@y
{% comment %}
You should never restart a manager node by copying the `raft` directory from another node. The data directory is unique to a node ID. A node can only use a node ID once to join the swarm. The node ID space should be globally unique.
{% endcomment %}
マネージャーノードの`raft`ディレクトリを、別ノードのものからコピーして再起動するようなことはやめてください。
そのデータディレクトリはノード ID に固有のものです。
そしてノード ID が利用されるのは Swarm に参加するときだけです。
ノード ID 空間は全体にわたってユニークでなければなりません。
@z

@x
To cleanly re-join a manager node to a cluster:
@y
{% comment %}
To cleanly re-join a manager node to a cluster:
{% endcomment %}
クラスターに対してマネージャーノードを再参加させるには、以下を行います。
@z

@x
1. To demote the node to a worker, run `docker node demote <NODE>`.
2. To remove the node from the swarm, run `docker node rm <NODE>`.
3. Re-join the node to the swarm with a fresh state using `docker swarm join`.
@y
{% comment %}
1. To demote the node to a worker, run `docker node demote <NODE>`.
2. To remove the node from the swarm, run `docker node rm <NODE>`.
3. Re-join the node to the swarm with a fresh state using `docker swarm join`.
{% endcomment %}
1. `docker node demote <NODE>`を実行して、そのノードをワーカーに降格させます。
2. `docker node rm <NODE>`を実行して、そのノードを Swarm から削除します。
3. `docker swarm join`を実行して、そのノードを Swarm に再度、新たな状態により参加させます。
@z

@x
For more information on joining a manager node to a swarm, refer to
[Join nodes to a swarm](join-nodes.md).
@y
{% comment %}
For more information on joining a manager node to a swarm, refer to
[Join nodes to a swarm](join-nodes.md).
{% endcomment %}
Swarm へのマネージャーノードの参加に関する詳細は [Swarm へのノード参加](join-nodes.md) を参照してください。
@z

@x
## Forcibly remove a node
@y
{% comment %}
## Forcibly remove a node
{% endcomment %}
{: #forcibly-remove-a-node }
## ノードの強制削除
@z

@x
In most cases, you should shut down a node before removing it from a swarm with
the `docker node rm` command. If a node becomes unreachable, unresponsive, or
compromised you can forcefully remove the node without shutting it down by
passing the `--force` flag. For instance, if `node9` becomes compromised:
@y
{% comment %}
In most cases, you should shut down a node before removing it from a swarm with
the `docker node rm` command. If a node becomes unreachable, unresponsive, or
compromised you can forcefully remove the node without shutting it down by
passing the `--force` flag. For instance, if `node9` becomes compromised:
{% endcomment %}
たいていの場合、`docker node rm`コマンドを使って Swarm からノードを削除するには、あらかじめそのノードを停止させておくべきです。
ノードが到達不能、無反応、障害発生といった状態になったら、ノードを停止させなくても、`--force`フラグを使って強制的にノードを削除することができます。
たとえば`node9`に障害が発生したら以下を実行します。
@z

@x
```none
$ docker node rm node9

Error response from daemon: rpc error: code = 9 desc = node node9 is not down and can't be removed

$ docker node rm --force node9

Node node9 removed from swarm
```
@y
```none
$ docker node rm node9

Error response from daemon: rpc error: code = 9 desc = node node9 is not down and can't be removed

$ docker node rm --force node9

Node node9 removed from swarm
```
@z

@x
Before you forcefully remove a manager node, you must first demote it to the
worker role. Make sure that you always have an odd number of manager nodes if
you demote or remove a manager.
@y
{% comment %}
Before you forcefully remove a manager node, you must first demote it to the
worker role. Make sure that you always have an odd number of manager nodes if
you demote or remove a manager.
{% endcomment %}
マネージャーノードを強制的に削除する場合は、その前にワーカーノードへ降格させておかなければなりません。
マネージャーノードを降格あるいは削除した場合、マネージャーノードは常に奇数にしておくべきことを忘れないでください。
@z

@x
## Back up the swarm
@y
{% comment %}
## Back up the swarm
{% endcomment %}
{: #back-up-the-swarm }
## Swarm のバックアップ
@z

@x
Docker manager nodes store the swarm state and manager logs in the
`/var/lib/docker/swarm/` directory. This data includes the keys used to encrypt
the Raft logs. Without these keys, you cannot restore the swarm.
@y
{% comment %}
Docker manager nodes store the swarm state and manager logs in the
`/var/lib/docker/swarm/` directory. This data includes the keys used to encrypt
the Raft logs. Without these keys, you cannot restore the swarm.
{% endcomment %}
マネージャーノードは、Swarm の状態とマネージャーログを`/var/lib/docker/swarm/`ディレクトリに保存しています。
そのディレクトリに Raft ログの暗号化に用いる鍵も含まれています。
この鍵がない状態では、Swarm を復元することはできません。
@z

@x
You can back up the swarm using any manager. Use the following procedure.
@y
{% comment %}
You can back up the swarm using any manager. Use the following procedure.
{% endcomment %}
Swarm のバックアップはどのマネージャーからでも行うことができます。
バックアップは以下の手順で行います。
@z

@x
1.  If the swarm has auto-lock enabled, you need the unlock key
    to restore the swarm from backup. Retrieve the unlock key if necessary and
    store it in a safe location. If you are unsure, read
    [Lock your swarm to protect its encryption key](swarm_manager_locking.md).
@y
{% comment %}
1.  If the swarm has auto-lock enabled, you need the unlock key
    to restore the swarm from backup. Retrieve the unlock key if necessary and
    store it in a safe location. If you are unsure, read
    [Lock your swarm to protect its encryption key](swarm_manager_locking.md).
{% endcomment %}
1.  Swarm のオートロック機能が有効である場合、バックアップから Swarm を復元するためには解除鍵（unlock key）が必要です。
    解除鍵を得たら、安全な場所に保存しておいてください。
    内容がよくわからない場合は、[Swarm のロックと暗号鍵の保護](swarm_manager_locking.md) を参照してください。
@z

@x
2.  Stop Docker on the manager before backing up the data, so that no data is
    being changed during the backup. It is possible to take a backup while the
    manager is running (a "hot" backup), but this is not recommended and your
    results are less predictable when restoring. While the manager is down,
    other nodes continue generating swarm data that is not part of this backup.
@y
{% comment %}
2.  Stop Docker on the manager before backing up the data, so that no data is
    being changed during the backup. It is possible to take a backup while the
    manager is running (a "hot" backup), but this is not recommended and your
    results are less predictable when restoring. While the manager is down,
    other nodes continue generating swarm data that is not part of this backup.
{% endcomment %}
2.  データのバックアップを取る前に、マネージャーノード上から Docker を停止します。
    これによってバックアップ中にデータが変更されることがなくなります。
    マネージャーが稼動中にバックアップを取る（「ホット」バックアップを取る）ことも可能ですが、これはお勧めしません。
    バックアップを復元する際に、予期しない事態となる場合があります。
    マネージャーが停止していても、他のノードが Swarm データを生成していると、そのデータはバックアップには含まれません。
@z

@x
    > Note
    > 
    > Be sure to maintain the quorum of swarm managers. During the
    > time that a manager is shut down, your swarm is more vulnerable to
    > losing the quorum if further nodes are lost. The number of managers you
    > run is a trade-off. If you regularly take down managers to do backups,
    > consider running a five manager swarm, so that you can lose an additional
    > manager while the backup is running, without disrupting your services.
@y
    {% comment %}
    > Note
    > 
    > Be sure to maintain the quorum of swarm managers. During the
    > time that a manager is shut down, your swarm is more vulnerable to
    > losing the quorum if further nodes are lost. The number of managers you
    > run is a trade-off. If you regularly take down managers to do backups,
    > consider running a five manager swarm, so that you can lose an additional
    > manager while the backup is running, without disrupting your services.
    {% endcomment %}
    > メモ
    > 
    > Swarm マネージャーの quorum は維持することを忘れないでください。
    > マネージャーを停止している最中には、さらに別のノードが失われると Swarm の quorum を失う危険性が増します。
    > 実行するマネージャー数にはトレードオフがあります。
    > バックアップを取る際には常にマネージャーを停止させるのであれば、Swarm のマネージャー数を 5 つとすることを考えてみてください。
    > そうしておくと、バックアップ中に別のマネージャーが失われても、サービスを支障なく実行することができます。
@z

@x
3.  Back up the entire `/var/lib/docker/swarm` directory.
@y
{% comment %}
3.  Back up the entire `/var/lib/docker/swarm` directory.
{% endcomment %}
3.  `/var/lib/docker/swarm`ディレクトリ全体のバックアップを取ります。
@z

@x
4.  Restart the manager.
@y
{% comment %}
4.  Restart the manager.
{% endcomment %}
4.  マネージャーを再起動します。
@z

@x
To restore, see [Restore from a backup](#restore-from-a-backup). 
@y
{% comment %}
To restore, see [Restore from a backup](#restore-from-a-backup). 
{% endcomment %}
復元方法については [バックアップからの復元](#restore-from-a-backup) を参照してください。
@z

@x
## Recover from disaster
@y
{% comment %}
## Recover from disaster
{% endcomment %}
{: #recover-from-disaster }
## 障害からの復旧
@z

@x
### Restore from a backup
@y
{% comment %}
### Restore from a backup
{% endcomment %}
{: #restore-from-a-backup }
### バックアップからの復元
@z

@x
After backing up the swarm as described in
[Back up the swarm](#back-up-the-swarm), use the following procedure to
restore the data to a new swarm.
@y
{% comment %}
After backing up the swarm as described in
[Back up the swarm](#back-up-the-swarm), use the following procedure to
restore the data to a new swarm.
{% endcomment %}
[Swarm のバックアップ](#back-up-the-swarm) において説明したように Swarm のバックアップを取った後は、以下の手順に従って、新たな Swarm に対してデータ復元を行います。
@z

@x
1.  Shut down Docker on the target host machine for the restored swarm.
@y
{% comment %}
1.  Shut down Docker on the target host machine for the restored swarm.
{% endcomment %}
1.  復元対象とする Swarm の対象ホストマシンを使って、Docker を停止させます。
@z

@x
3.  Remove the contents of the `/var/lib/docker/swarm` directory on the new
    swarm.
@y
{% comment %}
3.  Remove the contents of the `/var/lib/docker/swarm` directory on the new
    swarm.
{% endcomment %}
3.  新たな Swarm の`/var/lib/docker/swarm`ディレクトリ内容を削除します。
@z

@x
4.  Restore the `/var/lib/docker/swarm` directory with the contents of the
    backup.
@y
{% comment %}
4.  Restore the `/var/lib/docker/swarm` directory with the contents of the
    backup.
{% endcomment %}
4.  `/var/lib/docker/swarm`ディレクトリ内を、バックアップ内容に置き換えます。
@z

@x
    > Note
    > 
    > The new node uses the same encryption key for on-disk
    > storage as the old one. It is not possible to change the on-disk storage
    > encryption keys at this time.
    >
    > In the case of a swarm with auto-lock enabled, the unlock key is also the
    > same as on the old swarm, and the unlock key is needed to restore the
    > swarm.
@y
    {% comment %}
    > Note
    > 
    > The new node uses the same encryption key for on-disk
    > storage as the old one. It is not possible to change the on-disk storage
    > encryption keys at this time.
    >
    > In the case of a swarm with auto-lock enabled, the unlock key is also the
    > same as on the old swarm, and the unlock key is needed to restore the
    > swarm.
    {% endcomment %}
    > メモ
    > 
    > 新しいノードはディスク上のストレージに対して、古いときと同じ暗号鍵を用います。
    > この時点でディスク上のストレージに対する暗号鍵を変更することはできません。
    >
    > Swarm のオートロック機能が有効である場合、解除鍵についても古い Swarm のときと同じ鍵です。
    > この解除鍵は Swarm を復元するために必要となります。
@z

@x
5.  Start Docker on the new node. Unlock the swarm if necessary. Re-initialize
    the swarm using the following command, so that this node does not attempt
    to connect to nodes that were part of the old swarm, and presumably no
    longer exist.
@y
{% comment %}
5.  Start Docker on the new node. Unlock the swarm if necessary. Re-initialize
    the swarm using the following command, so that this node does not attempt
    to connect to nodes that were part of the old swarm, and presumably no
    longer exist.
{% endcomment %}
5.  新たなノード上から Docker を起動させます。
    必要に応じて Swarm のロック解除を行います。
    以下のコマンドを使って Swarm を再初期化します。
    これを行うのは、このノードが古い Swarm に属していたノードに接続しに行かないようにするためです。
    もっとも古いノードは、すでに存在していないはずです。
@z

@x
    ```bash
    $ docker swarm init --force-new-cluster
    ```
@y
    ```bash
    $ docker swarm init --force-new-cluster
    ```
@z

@x
6.  Verify that the state of the swarm is as expected. This may include
    application-specific tests or simply checking the output of
    `docker service ls` to be sure that all expected services are present.
@y
{% comment %}
6.  Verify that the state of the swarm is as expected. This may include
    application-specific tests or simply checking the output of
    `docker service ls` to be sure that all expected services are present.
{% endcomment %}
6.  Swarm の状態が思っているとおりかどうかを確認します。
    確認としてはアプリケーションに固有のテストを行うこともでき、あるいは単に`docker service ls`の出力を確認するのでもかまいません。
    これによってサービスが思い通りに存在しているかどうかを確認します。
@z

@x
7.  If you use auto-lock,
    [rotate the unlock key](swarm_manager_locking.md#rotate-the-unlock-key).
@y
{% comment %}
7.  If you use auto-lock,
    [rotate the unlock key](swarm_manager_locking.md#rotate-the-unlock-key).
{% endcomment %}
7.  オートロック機能を利用している場合は [解除鍵のローテート](swarm_manager_locking.md#rotate-the-unlock-key) を行います。
@z

@x
8.  Add manager and worker nodes to bring your new swarm up to operating
    capacity.
@y
{% comment %}
8.  Add manager and worker nodes to bring your new swarm up to operating
    capacity.
{% endcomment %}
8.  新たな Swarm の収容性能を実現するために、マネージャーノードやワーカーノードを追加します。
@z

@x
9.  Reinstate your previous backup regimen on the new swarm.
@y
{% comment %}
9.  Reinstate your previous backup regimen on the new swarm.
{% endcomment %}
9.  新たな Swarm に対して、以前からのバックアップ計画を復活させます。
@z

@x
### Recover from losing the quorum
@y
{% comment %}
### Recover from losing the quorum
{% endcomment %}
{: #recover-from-losing-the-quorum }
### quorum を失ってからの回復
@z

@x
Swarm is resilient to failures and the swarm can recover from any number
of temporary node failures (machine reboots or crash with restart) or other
transient errors. However, a swarm cannot automatically recover if it loses a
quorum. Tasks on existing worker nodes continue to run, but administrative
tasks are not possible, including scaling or updating services and joining or
removing nodes from the swarm. The best way to recover is to bring the missing
manager nodes back online. If that is not possible, continue reading for some
options for recovering your swarm.
@y
{% comment %}
Swarm is resilient to failures and the swarm can recover from any number
of temporary node failures (machine reboots or crash with restart) or other
transient errors. However, a swarm cannot automatically recover if it loses a
quorum. Tasks on existing worker nodes continue to run, but administrative
tasks are not possible, including scaling or updating services and joining or
removing nodes from the swarm. The best way to recover is to bring the missing
manager nodes back online. If that is not possible, continue reading for some
options for recovering your swarm.
{% endcomment %}
Swarm というものには障害に対しての耐久性があります。
いくつものノードが一時的な障害（マシン再起動やその際のクラッシュなど）や一時的エラーを起こしても、Swarm は回復できます。
ただし quorum を失っている場合、Swarm は自動的に復旧できません。
既存のワーカーノード上のタスクは動作をし続けますが、管理タスクは実行不能になります。
たとえばサービスのスケーリング、更新、ノードの追加や削除などです。
復旧する最良の策は、失われたマネージャーノードをオンライン復旧させることです。
これが無理である場合、Swarm 復旧のための手段がいくつかあるので、読み進めてください。
@z

@x
In a swarm of `N` managers, a quorum (a majority) of manager nodes must always
be available. For example, in a swarm with five managers, a minimum of three must be
operational and in communication with each other. In other words, the swarm can
tolerate up to `(N-1)/2` permanent failures beyond which requests involving
swarm management cannot be processed. These types of failures include data
corruption or hardware failures.
@y
{% comment %}
In a swarm of `N` managers, a quorum (a majority) of manager nodes must always
be available. For example, in a swarm with five managers, a minimum of three must be
operational and in communication with each other. In other words, the swarm can
tolerate up to `(N-1)/2` permanent failures beyond which requests involving
swarm management cannot be processed. These types of failures include data
corruption or hardware failures.
{% endcomment %}
Swarm に`N`個のマネージャーがある場合に、マネージャーノードの quorum は常に利用可能でなければなりません。
たとえば 5 つのマネージャーからなる Swarm の場合、最低でも 3 つのノードは動作状態であって、互いに通信できなければなりません。
言い換えると、Swarm は`(N-1)/2`個のノードまでなら、それが完全に処理不能になっても耐えることができますが、これを越えると Swarm 管理を行うような要求は処理できなくなります。
ここで言う処理不能というのは、データ損傷やハードウェア障害などを表わします。
@z

@x
If you lose the quorum of managers, you cannot administer the swarm. If you have
lost the quorum and you attempt to perform any management operation on the swarm,
an error occurs:
@y
{% comment %}
If you lose the quorum of managers, you cannot administer the swarm. If you have
lost the quorum and you attempt to perform any management operation on the swarm,
an error occurs:
{% endcomment %}
マネージャーが quorum を失った場合、Swarm を管理することはできません。
quorum を失った状態で、Swarm 上で管理操作を行おうとすると、以下のようなエラーが発生します。
@z

@x
```none
Error response from daemon: rpc error: code = 4 desc = context deadline exceeded
```
@y
```none
Error response from daemon: rpc error: code = 4 desc = context deadline exceeded
```
@z

@x
The best way to recover from losing the quorum is to bring the failed nodes back
online. If you can't do that, the only way to recover from this state is to use
the `--force-new-cluster` action from a manager node. This removes all managers
except the manager the command was run from. The quorum is achieved because
there is now only one manager. Promote nodes to be managers until you have the
desired number of managers.
@y
{% comment %}
The best way to recover from losing the quorum is to bring the failed nodes back
online. If you can't do that, the only way to recover from this state is to use
the `--force-new-cluster` action from a manager node. This removes all managers
except the manager the command was run from. The quorum is achieved because
there is now only one manager. Promote nodes to be managers until you have the
desired number of managers.
{% endcomment %}
quorum を失った状態から復旧するための最良の策は、障害が発生したノードをオンライン復旧させることです。
それが実現できない場合、この状態を回復する最後の手段は、マネージャーノード上において`--force-new-cluster`を実行することです。
これを行うと、コマンド実行したマネージャーノードを除いた、他のマネージャーノードがすべて削除されます。
マネージャーがたった 1 つになるのですから quorum は維持されます。
この後には、マネージャーノードが必要な数に達するまで、ノードをマネージャーに昇格させていきます。
@z

@x
```bash
# From the node to recover
docker swarm init --force-new-cluster --advertise-addr node01:2377
```
@y
```bash
# From the node to recover
docker swarm init --force-new-cluster --advertise-addr node01:2377
```
@z

@x
When you run the `docker swarm init` command with the `--force-new-cluster`
flag, the Docker Engine where you run the command becomes the manager node of a
single-node swarm which is capable of managing and running services. The manager
has all the previous information about services and tasks, worker nodes are
still part of the swarm, and services are still running. You need to add or
re-add  manager nodes to achieve your previous task distribution and ensure that
you have enough managers to maintain high availability and prevent losing the
quorum.
@y
{% comment %}
When you run the `docker swarm init` command with the `--force-new-cluster`
flag, the Docker Engine where you run the command becomes the manager node of a
single-node swarm which is capable of managing and running services. The manager
has all the previous information about services and tasks, worker nodes are
still part of the swarm, and services are still running. You need to add or
re-add  manager nodes to achieve your previous task distribution and ensure that
you have enough managers to maintain high availability and prevent losing the
quorum.
{% endcomment %}
`docker swarm init`コマンドにおいて`--force-new-cluster`フラグをつけて実行すると、コマンド実行した Docker Engine は、単一ノードからなる Swarm のマネージャーノードとなり、サービスの管理と実行が可能となります。
このマネージャーには、それまでのサービスやタスクに関する情報がそのまま保持され、ワーカーノードは Swarm に参加したままです。
そしてサービスは実行を継続します。
タスク分散を実現するためには、マネージャーノードの追加あるいは再度の追加が必要になります。
そして高可用性と quorum を維持していくのに十分なマネージャーとなっていることを確認します。
@z

@x
## Force the swarm to rebalance
@y
{% comment %}
## Force the swarm to rebalance
{% endcomment %}
{: #force-the-swarm-to-rebalance }
## Swarm の強制的な再配分
@z

@x
Generally, you do not need to force the swarm to rebalance its tasks. When you
add a new node to a swarm, or a node reconnects to the swarm after a
period of unavailability, the swarm does not automatically give a workload to
the idle node. This is a design decision. If the swarm periodically shifted tasks
to different nodes for the sake of balance, the clients using those tasks would
be disrupted. The goal is to avoid disrupting running services for the sake of
balance across the swarm. When new tasks start, or when a node with running
tasks becomes unavailable, those tasks are given to less busy nodes. The goal
is eventual balance, with minimal disruption to the end user.
@y
{% comment %}
Generally, you do not need to force the swarm to rebalance its tasks. When you
add a new node to a swarm, or a node reconnects to the swarm after a
period of unavailability, the swarm does not automatically give a workload to
the idle node. This is a design decision. If the swarm periodically shifted tasks
to different nodes for the sake of balance, the clients using those tasks would
be disrupted. The goal is to avoid disrupting running services for the sake of
balance across the swarm. When new tasks start, or when a node with running
tasks becomes unavailable, those tasks are given to less busy nodes. The goal
is eventual balance, with minimal disruption to the end user.
{% endcomment %}
一般には、Swarm におけるタスクを強制的に再配分させるような必要はありません。
Swarm に新たなノードを参加させたり、あるいは利用不能だったノードを Swarm に再接続させたりした場合に、Swarm ではアイドル状態にあるノードに対して、自動的な処理負荷の再配分は行いません。
これは設計方針によるものです。
仮に Swarm が配分を考えて、別のノードに定期的にタスクを振り替えるとすると、そのタスクを使用するクライアントは処理中断します。
目指すことは Swarm 内における配分を適切に行って、実行するサービスを中断させないことです。
新たなタスクが実行されたとき、あるいは実行中のタスクを持ったノードが利用不能になったとき、タスクは負荷の少ないノードに割り振られます。
最終的にはバランスよく配分されることです。
エンドユーザーに対して中断をできる限り少なくすることです。
@z

@x
You can use the `--force` or `-f` flag with the `docker service update` command
to force the service to redistribute its tasks across the available worker nodes.
This causes the service tasks to restart. Client applications may be disrupted.
If you have configured it, your service uses a [rolling update](swarm-tutorial/rolling-update.md).
@y
{% comment %}
You can use the `--force` or `-f` flag with the `docker service update` command
to force the service to redistribute its tasks across the available worker nodes.
This causes the service tasks to restart. Client applications may be disrupted.
If you have configured it, your service uses a [rolling update](swarm-tutorial/rolling-update.md).
{% endcomment %}
`docker service update`コマンドに`--force`あるいは`-f`フラグをつけて実行すると、利用可能なワーカーノードに対して強制的にタスクを再分散します。
これを行うとサービスタスクは再起動します。
このときにはクライアントアプリケーションが中断するかもしれません。
設定によってサービスが [ローリングアップデート](swarm-tutorial/rolling-update.md) を利用するようにできます。
@z

@x
If you use an earlier version and you want to achieve an even balance of load
across workers and don't mind disrupting running tasks, you can force your swarm
to re-balance by temporarily scaling the service upward. Use
`docker service inspect --pretty <servicename>` to see the configured scale
of a service. When you use `docker service scale`, the nodes with the lowest
number of tasks are targeted to receive the new workloads. There may be multiple
under-loaded nodes in your swarm. You may need to scale the service up by modest
increments a few times to achieve the balance you want across all the nodes.
@y
{% comment %}
If you use an earlier version and you want to achieve an even balance of load
across workers and don't mind disrupting running tasks, you can force your swarm
to re-balance by temporarily scaling the service upward. Use
`docker service inspect --pretty <servicename>` to see the configured scale
of a service. When you use `docker service scale`, the nodes with the lowest
number of tasks are targeted to receive the new workloads. There may be multiple
under-loaded nodes in your swarm. You may need to scale the service up by modest
increments a few times to achieve the balance you want across all the nodes.
{% endcomment %}
Docker の古いバージョンを利用していて、ワーカーノードに均等に負荷を配分したい場合、そしてタスクの中断が気にならない場合は、サービスのスケールを一時的に増やして、強制的に再配分を行うことができます。
設定されているサービスのスケール数は`docker service inspect --pretty <servicename>`を実行して確認します。
`docker service scale`を確認すれば、タスクの実行数が最も低いノードに、新たに配分が行われることがわかります。
Swarm 内にはもっと配分を負うことができるノードが複数見つかるかもしれません。
すべてのノードにわたってバランスよく配分を実現するためには、適度にサービススケールを増やすことを何度か行うことが必要かもしれません。
@z

@x
When the load is balanced to your satisfaction, you can scale the service back
down to the original scale. You can use `docker service ps` to assess the current
balance of your service across nodes.
@y
{% comment %}
When the load is balanced to your satisfaction, you can scale the service back
down to the original scale. You can use `docker service ps` to assess the current
balance of your service across nodes.
{% endcomment %}
望んだとおりに負荷が配分されたら、サービスのスケールを元の値に戻します。
`docker service ps`を実行して、全ノード内でのサービスの配分状況を確認してください。
@z

@x
See also
[`docker service scale`](../reference/commandline/service_scale.md) and
[`docker service ps`](../reference/commandline/service_ps.md).
@y
{% comment %}
See also
[`docker service scale`](../reference/commandline/service_scale.md) and
[`docker service ps`](../reference/commandline/service_ps.md).
{% endcomment %}
[`docker service scale`](../reference/commandline/service_scale.md) と [`docker service ps`](../reference/commandline/service_ps.md) を参照してください。
@z
