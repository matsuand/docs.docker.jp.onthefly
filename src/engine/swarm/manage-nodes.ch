%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Manage existing nodes in a swarm
keywords: guide, swarm mode, node
title: Manage nodes in a swarm
---
@y
---
description: Manage existing nodes in a swarm
keywords: guide, swarm mode, node
title: Swarm でのノード管理
---
@z

@x
As part of the swarm management lifecycle, you may need to view or update a node as follows:
@y
Swarm 管理のライフサイクルの中では、以下のようなノード参照やノード更新が必要になります。
@z

@x
* [list nodes in the swarm](#list-nodes)
* [inspect an individual node](#inspect-an-individual-node)
* [update a node](#update-a-node)
* [leave the swarm](#leave-the-swarm)
@y
* [ノードの一覧表示](#list-nodes)
* [ノードの詳細表示](#inspect-an-individual-node)
* [ノードの更新](#update-a-node)
* [ノードの除外](#leave-the-swarm)
@z

@x
## List nodes
@y
{: #list-nodes }
## ノードの一覧表示
@z

@x
To view a list of nodes in the swarm run `docker node ls` from a manager node:
@y
Swarm 内のノード一覧を表示するには、マネージャーノードから`docker node ls`を実行します。
@z

@x
```console
$ docker node ls

ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
46aqrk4e473hjbt745z53cr3t    node-5    Ready   Active        Reachable
61pi3d91s0w3b90ijw3deeb2q    node-4    Ready   Active        Reachable
a5b2m3oghd48m8eu391pefq5u    node-3    Ready   Active
e7p8btxeu3ioshyuj6lxiv6g0    node-2    Ready   Active
ehkv3bcimagdese79dn78otj5 *  node-1    Ready   Active        Leader
```
@y
```console
$ docker node ls

ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
46aqrk4e473hjbt745z53cr3t    node-5    Ready   Active        Reachable
61pi3d91s0w3b90ijw3deeb2q    node-4    Ready   Active        Reachable
a5b2m3oghd48m8eu391pefq5u    node-3    Ready   Active
e7p8btxeu3ioshyuj6lxiv6g0    node-2    Ready   Active
ehkv3bcimagdese79dn78otj5 *  node-1    Ready   Active        Leader
```
@z

@x
The `AVAILABILITY` column shows whether or not the scheduler can assign tasks to
the node:
@y
`AVAILABILITY`欄は、そのノードに対してスケジューラーがタスクを割り当てることができるかどうかを表わします。
@z

@x
* `Active` means that the scheduler can assign tasks to the node.
* `Pause` means the scheduler doesn't assign new tasks to the node, but existing
  tasks remain running.
* `Drain` means the scheduler doesn't assign new tasks to the node. The
   scheduler shuts down any existing tasks and schedules them on an available
   node.
@y
* `Active`は、スケジューラーがノードにタスクを割り当てられることを表わします。
* `Pause`は、スケジューラーがノードに新たなタスクを割り当てられないことを表わします。
  ただし既存のタスクは実行し続けることができます。
* `Drain`は、スケジューラーがノードに新たなタスクを割り当てられないことを表わします。
   スケジューラーは既存のタスクを停止させて、利用可能な別のノードにタスクをスケジューリングします。
@z

@x
The `MANAGER STATUS` column shows node participation in the Raft consensus:
@y
`MANAGER STATUS`欄は、Raft 合意（Raft consensus）に従ったノードの参加状況を表わします。
@z

@x
* No value indicates a worker node that does not participate in swarm
  management.
* `Leader` means the node is the primary manager node that makes all swarm
  management and orchestration decisions for the swarm.
* `Reachable` means the node is a manager node participating in the Raft
  consensus quorum. If the leader node becomes unavailable, the node is eligible for
  election as the new leader.
* `Unavailable` means the node is a manager that can't communicate with
  other managers. If a manager node becomes unavailable, you should either join a
  new manager node to the swarm or promote a worker node to be a
  manager.
@y
* 表示がないものはワーカーノードであり、Swarm 管理に参加していないことを表わします。
* `Leader`（リーダー） は、主となるマネージャーノードであることを表わします。
  Swarm において、すべての Swarm 管理操作やオーケストレーション決定を行います。
* `Reachable`（到達可能）は、Raft 合意（Raft consensus）の多数票（quorum）に参加しているマネージャーノードを表わします。
  リーダーノードが利用不能になったときに、新たなリーダーとして選任される資格を持つノードです。
* `Unavailable`（利用不能）は、他のマネージャーとの通信ができなくなっているマネージャーを表わします。
  マネージャーノードが利用不能になった場合、新たなマネージャーノードを Swarm に参加させるか、ワーカーノードをマネージャーに昇格させる必要があります。
@z

@x
For more information on swarm administration refer to the [Swarm administration guide](admin_guide.md).
@y
Swarm の管理操作に関する詳細は [Swarm 管理ガイド](admin_guide.md) を参照してください。
@z

@x
## Inspect an individual node
@y
{: #inspect-an-individual-node }
## ノードの詳細表示
@z

@x
You can run `docker node inspect <NODE-ID>` on a manager node to view the
details for an individual node. The output defaults to JSON format, but you can
pass the `--pretty` flag to print the results in human-readable format. For example:
@y
マネージャーノード上において`docker node inspect <NODE-ID>`を実行して、個々のノードについての詳細を確認することができます。
出力はデフォルトで JSON 形式です。
`--pretty`フラグを指定すれば、読みやすい書式で出力することができます。
たとえば以下のとおりです。
@z

@x
```console
$ docker node inspect self --pretty

ID:                     ehkv3bcimagdese79dn78otj5
Hostname:               node-1
Joined at:              2016-06-16 22:52:44.9910662 +0000 utc
Status:
 State:                 Ready
 Availability:          Active
Manager Status:
 Address:               172.17.0.2:2377
 Raft Status:           Reachable
 Leader:                Yes
Platform:
 Operating System:      linux
 Architecture:          x86_64
Resources:
 CPUs:                  2
 Memory:                1.954 GiB
Plugins:
  Network:              overlay, host, bridge, overlay, null
  Volume:               local
Engine Version:         1.12.0-dev
```
@y
```console
$ docker node inspect self --pretty

ID:                     ehkv3bcimagdese79dn78otj5
Hostname:               node-1
Joined at:              2016-06-16 22:52:44.9910662 +0000 utc
Status:
 State:                 Ready
 Availability:          Active
Manager Status:
 Address:               172.17.0.2:2377
 Raft Status:           Reachable
 Leader:                Yes
Platform:
 Operating System:      linux
 Architecture:          x86_64
Resources:
 CPUs:                  2
 Memory:                1.954 GiB
Plugins:
  Network:              overlay, host, bridge, overlay, null
  Volume:               local
Engine Version:         1.12.0-dev
```
@z

@x
## Update a node
@y
{: #update-a-node }
## ノードの更新
@z

@x
You can modify node attributes as follows:
@y
ノードの属性は以下のようにして修正することができます。
@z

@x
* [change node availability](#change-node-availability)
* [add or remove label metadata](#add-or-remove-label-metadata)
* [change a node role](#promote-or-demote-a-node)
@y
* [ノードの利用状況の変更](#change-node-availability)
* [ラベルメタデータの追加、削除](#add-or-remove-label-metadata)
* [ノードのロール変更](#promote-or-demote-a-node)
@z

@x
### Change node availability
@y
{: #change-node-availability }
### ノードの利用状況の変更
@z

@x
Changing node availability lets you:
@y
ノードの利用状況（availability）は、以下のような変更を行うことができます。
@z

@x
* drain a manager node so that only performs swarm management tasks and is
  unavailable for task assignment.
* drain a node so you can take it down for maintenance.
* pause a node so it can't receive new tasks.
* restore unavailable or paused nodes available status.
@y
* マネージャーノードを排出（drain）することができます。
  このマネージャーノードは、Swarm の管理タスクのみを実行しますが、タスク割り当ては行いません。
* ノードを排出することで、このノードの保守を行うことができます。
* ノードを一時停止すると、新たなタスクを受け入れることはできません。
* 利用不能や一時停止したノードを、利用可能な状態に戻すことができます。
@z

@x
For example, to change a manager node to `Drain` availability:
@y
たとえばマネージャーノードの利用状況を`Drain`にするには以下を行います。
@z

@x
```console
$ docker node update --availability drain node-1

node-1
```
@y
```console
$ docker node update --availability drain node-1

node-1
```
@z

@x
See [list nodes](#list-nodes) for descriptions of the different availability
options.
@y
別の利用状況オプションの説明については、[ノードの一覧出力](#list-nodes) を参照してください。
@z

@x
### Add or remove label metadata
@y
{: #add-or-remove-label-metadata }
### ラベルメタデータの追加や削除
@z

@x
Node labels provide a flexible method of node organization. You can also use
node labels in service constraints. Apply constraints when you create a service
to limit the nodes where the scheduler assigns tasks for the service.
@y
ノードにラベルをつけておくと、ノードを構成する上で柔軟な運用が可能になります。
ノードラベルはサービスの制約を示すものとして利用することもできます。
サービスを作成するときに、スケジューラーのノードに対するタスク割り当てに制限がある場合には、制約を適用してください。
@z

@x
Run `docker node update --label-add` on a manager node to add label metadata to
a node. The `--label-add` flag supports either a `<key>` or a `<key>=<value>`
pair.
@y
マネージャーノード上から`docker node update --label-add`を実行して、ノードにラベルメタデータを追加します。
`--label-add`フラグは、単独の`<key>`、または`<key>=<value>`のペア表記のいずれも可です。
@z

@x
Pass the `--label-add` flag once for each node label you want to add:
@y
ラベルを追加するノードに対して、一度だけ`--label-add`フラグをつけて以下を実行します。
@z

@x
```console
$ docker node update --label-add foo --label-add bar=baz node-1

node-1
```
@y
```console
$ docker node update --label-add foo --label-add bar=baz node-1

node-1
```
@z

@x
The labels you set for nodes using docker node update apply only to the node
entity within the swarm. Do not confuse them with the docker daemon labels for
[dockerd](../../config/labels-custom-metadata.md#daemon-labels).
@y
docker node update を使ってノード用に設定するラベルは、Swarm 内のノードにしか適用されません。
Docker デーモン [dockerd](../../config/labels-custom-metadata.md#daemon-labels) におけるラベルと混同しないように注意してください。
@z

@x
Therefore, node labels can be used to limit critical tasks to nodes that meet
certain requirements. For example, schedule only on machines where special
workloads should be run, such as machines that meet [PCI-SS
compliance](https://www.pcisecuritystandards.org/).
@y
そこで特定要件を満たすノードには、重要タスクのみを限定して割り当てるように、ノードラベルを活用することができます。
特別な処理を実行させるマシン、たとえば [PCI-SS コンプライアンス](https://www.pcisecuritystandards.org/) を満たすマシンだけをスケジュールするような場合です。

@z

@x
A compromised worker could not compromise these special workloads because it
cannot change node labels.
@y
ワーカーが侵害されても、そもそもノードラベルの変更はできないので、その特別な処理が侵害されることはありえません。
@z

@x
Engine labels, however, are still useful because some features that do not
affect secure orchestration of containers might be better off set in a
decentralized manner. For instance, an engine could have a label to indicate
that it has a certain type of disk device, which may not be relevant to security
directly. These labels are more easily "trusted" by the swarm orchestrator.
@y
Engine ラベルは今でも活用できます。
コンテナーの機能の中には、オーケストレーションの安全性に影響を及ぼさない機能もあるので、そういった機能は分散化されることの方がよい場合があるので、Engine ラベルを利用できます。
たとえばノードに特定のディスクデバイスがあることを示すために、ラベルを設定します。
これを行ったからといって、おそらくセキュリティに直接関係しないはずです。
こういったラベルなら Swarm オーケストレーターは、より「安心して」利用することができます。
@z

@x
Refer to the `docker service create` [CLI reference](../reference/commandline/service_create.md)
for more information about service constraints.
@y
サービスの制約に関する詳細は [CLI リファレンスの`docker service create`](../reference/commandline/service_create.md) を参照してください。
@z

@x
### Promote or demote a node
@y
{: #promote-or-demote-a-node }
### ノードの昇格と降格
@z

@x
You can promote a worker node to the manager role. This is useful when a
manager node becomes unavailable or if you want to take a manager offline for
maintenance. Similarly, you can demote a manager node to the worker role.
@y
ワーカーノードはマネージャーに昇格させることができます。
マネージャーノードの 1 つが利用不能になるとか、マネージャーをオフラインにしてメンテナンスを行いたいといったときに、昇格操作を活用します。
同様にマネージャーノードをワーカーへと降格させることもできます。
@z

@x
> **Note**: Regardless of your reason to promote or demote
> a node, you must always maintain a quorum of manager nodes in the
> swarm. For more information refer to the [Swarm administration guide](admin_guide.md).
@y
> **メモ**: ノードの昇格や降格の理由がどのようなものであっても、Swarm 内のマネージャーノードの quorum は常に維持しておかなければなりません。
> 詳しくは [Swarm 管理ガイド](admin_guide.md) を参照してください。
@z

@x
To promote a node or set of nodes, run `docker node promote` from a manager
node:
@y
1 つあるいは複数のノードを昇格させるには、マネージャーノードから`docker node promote`を実行します。
@z

@x
```console
$ docker node promote node-3 node-2

Node node-3 promoted to a manager in the swarm.
Node node-2 promoted to a manager in the swarm.
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
$ docker node promote node-3 node-2

Node node-3 promoted to a manager in the swarm.
Node node-2 promoted to a manager in the swarm.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese1" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker node promote node-3 node-2

ノード node-3 がこの Swarm においてマネージャーに昇格しました。
ノード node-2 がこの Swarm においてマネージャーに昇格しました。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
To demote a node or set of nodes, run `docker node demote` from a manager node:
@y
1 つあるいは複数のノードを降格させるには、マネージャーノードから`docker node demote`を実行します。
@z

@x
```console
$ docker node demote node-3 node-2

Manager node-3 demoted in the swarm.
Manager node-2 demoted in the swarm.
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
$ docker node demote node-3 node-2

Manager node-3 demoted in the swarm.
Manager node-2 demoted in the swarm.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese2" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker node demote node-3 node-2

ノード node-3 がこの Swarm において降格しました。
ノード node-2 がこの Swarm において降格しました。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
`docker node promote` and `docker node demote` are convenience commands for
`docker node update --role manager` and `docker node update --role worker`
respectively.
@y
`docker node promote`と`docker node demote`は、それぞれ`docker node update --role manager`と`docker node update --role worker`の省略形です。
@z

@x
## Install plugins on swarm nodes
@y
{: #install-plugins-on-swarm-nodes }
## Swarm ノードへのプラグインのインストール
@z

@x
If your swarm service relies on one or more
[plugins](/engine/extend/plugin_api/), these plugins need to be available on
every node where the service could potentially be deployed. You can manually
install the plugin on each node or script the installation. You can also deploy
the plugin in a similar way as a global service using the Docker API, by specifying
a `PluginSpec` instead of a `ContainerSpec`.
@y
Swarm サービスが [プラグイン]({{ site.baseurl }}/engine/extend/plugin_api/) をいくつか必要としている場合は、サービスがデプロイされる可能性のあるすべてのノード上において、そのプラグインが利用できることが必要です。
プラグインのインストールは、各ノード上において手動で行うか、スクリプトを用意して行うことになります。
Docker API を利用するグローバルサービスと同様の方法により、プラグインをデプロイすることができます。
その際には`ContainerSpec`ではなく`PluginSpec`を利用します。
@z

@x
> **Note**
>
> There is currently no way to deploy a plugin to a swarm using the
> Docker CLI or Docker Compose. In addition, it is not possible to install
> plugins from a private repository.
@y
> **メモ**
>
> 今のところ、Docker CLI や Docker Compose を使って、プラグインを Swarm にデプロイする手段はありません。
> さらにプライベートリポジトリからプラグインをインストールすることもできません。
@z

@x
The [`PluginSpec`](/engine/extend/plugin_api/#json-specification)
is defined by the plugin developer. To add the plugin to all Docker nodes, use
the [`service/create`](/engine/api/v1.31/#operation/ServiceCreate) API, passing
the `PluginSpec` JSON defined in the `TaskTemplate`.
@y
プラグイン開発者が [`PluginSpec`]({{ site.baseurl }}/engine/extend/plugin_api/#json-specification) というものを定義しています。
Docker ノードすべてにプラグインをインストールするには、`TaskTemplate`内に`PluginSpec`JSON を定義して [`service/create`](/engine/api/v1.31/#operation/ServiceCreate) API を利用します。
@z

@x
## Leave the swarm
@y
{: #leave-the-swarm }
## Swarm からのノード除外
@z

@x
Run the `docker swarm leave` command on a node to remove it from the swarm.
@y
ノード上において`docker swarm leave`コマンドを実行すると、Swarm からそのノードが除外されます。
@z

@x
For example to leave the swarm on a worker node:
@y
たとえばワーカーノードを Swarm から除外します。
@z

@x
```console
$ docker swarm leave

Node left the swarm.
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
$ docker swarm leave

Node left the swarm.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese3" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm leave

ノードが Swarm から除外されました。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
When a node leaves the swarm, the Docker Engine stops running in swarm
mode. The orchestrator no longer schedules tasks to the node.
@y
ノードが Swarm から除外されると、Docker Engine は Swarm モードを停止させます。
オーケストレーターは、そのノードに対してタスクをスケジュールすることはなくなります。
@z

@x
If the node is a manager node, you receive a warning about maintaining the
quorum. To override the warning, pass the `--force` flag. If the last manager
node leaves the swarm, the swarm becomes unavailable requiring you to take
disaster recovery measures.
@y
除外するノードがマネージャーノードの場合、quorum を維持することを警告するメッセージが表示されます。
警告表示をなくすには`--force`フラグをつけます。
最後に残ったマネージャーノードが除外されてしまうと、Swarm は利用不能になります。
これに対しては障害復旧の手段を講じるしかありません。
@z

@x
For information about maintaining a quorum and disaster recovery, refer to the
[Swarm administration guide](admin_guide.md).
@y
quorum の維持や障害復旧に関する詳細は [Swarm 管理ガイド](admin_guide.md) を参照してください。
@z

@x
After a node leaves the swarm, you can run the `docker node rm` command on a
manager node to remove the node from the node list.
@y
ノードを Swarm から除外した後に、マネージャーノード上において`docker node rm`コマンドを実行すれば、ノード一覧からそのノードを削除することができます。
@z

@x
For instance:
@y
たとえば以下のとおりです。
@z

@x
```console
$ docker node rm node-2
```
@y
```console
$ docker node rm node-2
```
@z

@x
## Learn more
@y
{: #learn-more }
## さらに詳しく
@z

@x
* [Swarm administration guide](admin_guide.md)
* [Docker Engine command line reference](../reference/commandline/docker.md)
* [Swarm mode tutorial](swarm-tutorial/index.md)
@y
* [Swarm 管理ガイド](admin_guide.md)
* [Docker Engine コマンドラインリファレンス](../reference/commandline/docker.md)
* [Swarm モードチュートリアル](swarm-tutorial/index.md)
@z
