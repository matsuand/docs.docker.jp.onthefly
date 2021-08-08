%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Add worker and manager nodes to a swarm
keywords: guide, swarm mode, node
title: Join nodes to a swarm
---
@y
---
description: Add worker and manager nodes to a swarm
keywords: guide, swarm mode, node
title: Swarm へのノード参加
---
@z

@x
When you first create a swarm, you place a single Docker Engine into
swarm mode. To take full advantage of swarm mode you can add nodes to the swarm:
@y
Swarm を生成したら、それは単一の Docker Engine を Swarm モードにしたということです。
Swarm モードを最大限活用するには、Swarm にノードを追加していきます。
@z

@x
* Adding worker nodes increases capacity. When you deploy a service to a swarm,
the Engine schedules tasks on available nodes whether they are worker nodes or
manager nodes. When you add workers to your swarm, you increase the scale of
the swarm to handle tasks without affecting the manager raft consensus.
* Manager nodes increase fault-tolerance. Manager nodes perform the
orchestration and cluster management functions for the swarm. Among manager
nodes, a single leader node conducts orchestration tasks. If a leader node
goes down, the remaining manager nodes elect a new leader and resume
orchestration and maintenance of the swarm state. By default, manager nodes
also run tasks.
@y
* ワーカーノードは、これを追加することによって収容能力を増加させます。
  Swarm に対してサービスをデプロイすると Engine は、ワーカーノード、マネージャーノードを問わず、利用可能なノードに対してタスクをスケジューリングします。
  Swarm に対してワーカーノードを追加すると、Swarm のスケールが増加し、マネージャーの Raft 合意に影響することなくタスクを取り扱うことができます。
* マネージャーノードは耐障害性能を向上させます。
  マネージャーノードは Swarm においてオーケストレーション機能およびクラスター管理機能を実現します。
  マネージャーの中では、リーダーとなるノードがオーケストレーションタスクを管理します。
  リーダーノードが処理不能になると、残りのマネージャーノードの中から新たなリーダーが選出され、オーケストレーション機能と Swarm 状態を復元します。
  デフォルトではマネージャーノードも通常のタスクを実行します。
@z

@x
The Docker Engine joins the swarm depending on the **join-token** you provide to
the `docker swarm join` command. The node only uses the token at join time. If
you subsequently rotate the token, it doesn't affect existing swarm nodes. Refer
to [Run Docker Engine in swarm mode](swarm-mode.md#view-the-join-command-or-update-a-swarm-join-token).
@y
Docker Engine が Swarm に参加する際には、`docker swarm join`コマンドによって示される **参加トークン**（join-token）を利用します。
ノードがトークンを利用するのはこの参加のときだけです。
この後にトークンのローテート操作を行っても、既存の Swarm ノードには影響しません。
[Docker Engine の Swarm モード実行](swarm-mode.md#view-the-join-command-or-update-a-swarm-join-token) を参照してください。
@z

@x
## Join as a worker node
@y
{: #join-as-a-worker-node }
## ワーカーノードとしての参加
@z

@x
To retrieve the join command including the join token for worker nodes, run the
following command on a manager node:
@y
ワーカーノード用に、参加トークンの表示も込みで join コマンドを表示するには、マネージャーノード上にて以下のコマンドを実行します。
@z

@x
```console
$ docker swarm join-token worker

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin1">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese1">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin1" class="tab-pane fade in active">
{% capture original-content %}
```console
$ docker swarm join-token worker

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese1" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm join-token worker

Swarm にワーカーを追加するには、以下のコマンドを実行してください。

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Run the command from the output on the worker to join the swarm:
@y
ワーカーノード上において、出力結果どおりのコマンドを実行して Swarm に参加します。
@z

@x
```console
$ docker swarm join \
  --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
  192.168.99.100:2377

This node joined a swarm as a worker.
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin2">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese2">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin2" class="tab-pane fade in active">
{% capture original-content %}
```console
$ docker swarm join \
  --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
  192.168.99.100:2377

This node joined a swarm as a worker.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese2" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm join \
  --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
  192.168.99.100:2377

このノードはワーカーとして Swarm に参加しました。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
<hr>
</div>
@z

@x
The `docker swarm join` command does the following:
@y
`docker swarm join`コマンドは以下の処理を行います。
@z

@x
* switches the Docker Engine on the current node into swarm mode.
* requests a TLS certificate from the manager.
* names the node with the machine hostname
* joins the current node to the swarm at the manager listen address based upon the swarm token.
* sets the current node to `Active` availability, meaning it can receive tasks
from the scheduler.
* extends the `ingress` overlay network to the current node.
@y
* 現在のノードである Docker Engine を Swarm モードに切り替えます。
* マネージャーに TLS 証明書を要求します。
* マシンホスト名を使ってノード名を定めます。
* Swarm トークンに基づくマネージャーのリッスンアドレスで、現在のノードを Swarm に参加させます。
* 現在のノードの利用状態（availability）を`Active`に設定します。
  これはスケジューラーからのタスク受け入れが可能であることを意味します。
* 現在のノードに対して、`ingress`オーバーレイネットワークを拡張します。
@z

@x
## Join as a manager node
@y
{: #join-as-a-manager-node }
## マネージャーノードとしての参加
@z

@x
When you run `docker swarm join` and pass the manager token, the Docker Engine
switches into swarm mode the same as for workers. Manager nodes also participate
in the raft consensus. The new nodes should be `Reachable`, but the existing
manager remains the swarm `Leader`.
@y
`docker swarm join`を実行してマネージャートークンを受け渡すと、Docker Engine はワーカーノードの場合と同様に、Swarm モードへの切り替えを行います。
マネージャーノードは Raft 合意（raft consensus）にも参加します。
新たに参加させたこのノードは`Reachable`（到達可能）となりますが、Swarm の`Leader`は、それまでのものがそのまま担当します。
@z

@x
Docker recommends three or five manager nodes per cluster to implement high
availability. Because swarm mode manager nodes share data using Raft, there
must be an odd number of managers. The swarm can continue to function after as
long as a quorum of more than half of the manager nodes are available.
@y
Docker はクラスターの高可用性を実現するため、マネージャーノードを 3 つあるいは 5 つにより構成することが推奨されます。
Swarm モードにおけるマネージャーノードは Raft を利用してデータ共有を行うため、マネージャーノード数は奇数としなければなりません。
Swarm はマネージャーノードの半数以上の quorum（多数票）が得られれば、機能し続けることができます。
@z

@x
For more detail about swarm managers and administering a swarm, see
[Administer and maintain a swarm of Docker Engines](admin_guide.md).
@y
Swarm マネージャーと Swarm の管理に関する詳細は [Docker Engine の Swarm 管理と保守](admin_guide.md) を参照してください。
@z

@x
To retrieve the join command including the join token for manager nodes, run the
following command on a manager node:
@y
マネージャーノード用に、参加トークンの表示も込みで join コマンドを表示するには、マネージャーノード上において以下のコマンドを実行します。
@z

@x
```console
$ docker swarm join-token manager

To add a manager to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
    192.168.99.100:2377
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin3">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese3">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin3" class="tab-pane fade in active">
{% capture original-content %}
```console
$ docker swarm join-token manager

To add a manager to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
    192.168.99.100:2377
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese3" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm join-token manager

Swarm にマネージャーを追加するには、以下のコマンドを実行してください。

    docker swarm join \
    --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
    192.168.99.100:2377
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Run the command from the output on the new manager node to join it to the swarm:
@y
新たなマネージャーノード上において、出力結果どおりのコマンドを実行して Swarm に参加します。
@z

@x
```console
$ docker swarm join \
  --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
  192.168.99.100:2377

This node joined a swarm as a manager.
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin4">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese4">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin4" class="tab-pane fade in active">
{% capture original-content %}
```console
$ docker swarm join \
  --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
  192.168.99.100:2377

This node joined a swarm as a manager.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese4" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm join \
  --token SWMTKN-1-61ztec5kyafptydic6jfc1i33t37flcl4nuipzcusor96k7kby-5vy9t8u35tuqm7vh67lrz9xp6 \
  192.168.99.100:2377

このノードはマネージャーとして Swarm に参加しました。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
## Learn More
@y
{: #learn-more }
## さらに詳しく
@z

@x
* `swarm join` [command line reference](../reference/commandline/swarm_join.md)
* [Swarm mode tutorial](swarm-tutorial/index.md)
@y
* [コマンドラインリファレンス](../reference/commandline/swarm_join.md) の`swarm join`
* [Swarm モードチュートリアル](swarm-tutorial/index.md)
@z
