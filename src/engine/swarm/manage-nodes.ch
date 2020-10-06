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
{% comment %}
As part of the swarm management lifecycle, you may need to view or update a node as follows:
{% endcomment %}
Swarm 管理のライフサイクルの中では、以下のようなノード参照やノード更新が必要になります。
@z

@x
* [list nodes in the swarm](#list-nodes)
* [inspect an individual node](#inspect-an-individual-node)
* [update a node](#update-a-node)
* [leave the swarm](#leave-the-swarm)
@y
{% comment %}
* [list nodes in the swarm](#list-nodes)
* [inspect an individual node](#inspect-an-individual-node)
* [update a node](#update-a-node)
* [leave the swarm](#leave-the-swarm)
{% endcomment %}
* [ノードの一覧表示](#list-nodes)
* [ノードの詳細表示](#inspect-an-individual-node)
* [ノードの更新](#update-a-node)
* [leave the swarm](#leave-the-swarm)
@z

@x
## List nodes
@y
{% comment %}
## List nodes
{% endcomment %}
{: #list-nodes }
## ノードの一覧表示
@z

@x
To view a list of nodes in the swarm run `docker node ls` from a manager node:
@y
{% comment %}
To view a list of nodes in the swarm run `docker node ls` from a manager node:
{% endcomment %}
Swarm 内のノード一覧を表示するには、マネージャーノードから`docker node ls`を実行します。
@z

@x
```bash
$ docker node ls

ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
46aqrk4e473hjbt745z53cr3t    node-5    Ready   Active        Reachable
61pi3d91s0w3b90ijw3deeb2q    node-4    Ready   Active        Reachable
a5b2m3oghd48m8eu391pefq5u    node-3    Ready   Active
e7p8btxeu3ioshyuj6lxiv6g0    node-2    Ready   Active
ehkv3bcimagdese79dn78otj5 *  node-1    Ready   Active        Leader
```
@y
```bash
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
{% comment %}
{% endcomment %}
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
{% comment %}
* `Active` means that the scheduler can assign tasks to the node.
* `Pause` means the scheduler doesn't assign new tasks to the node, but existing
  tasks remain running.
* `Drain` means the scheduler doesn't assign new tasks to the node. The
   scheduler shuts down any existing tasks and schedules them on an available
   node.
{% endcomment %}
* `Active` は、スケジューラーがノードにタスクを割り当てられることを表わします。
* `Pause` は、スケジューラーがノードに新たなタスクを割り当てられないことを表わします。
  ただし既存のタスクは実行し続けることができます。
* `Drain` は、スケジューラーがノードに新たなタスクを割り当てられないことを表わします。
   スケジューラーは既存のタスクを停止させて、利用可能な別のノードにタスクをスケジューリングします。
@z

@x
The `MANAGER STATUS` column shows node participation in the Raft consensus:
@y
{% comment %}
The `MANAGER STATUS` column shows node participation in the Raft consensus:
{% endcomment %}
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
{% comment %}
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
{% endcomment %}
* 表示がないものはワーカーノードであり、Swarm 管理に参加していないことを表わします。
* `Leader`（リーダー） は、主となるマネージャーノードであることを表わします。
  Swarm において、すべての Swarm 管理操作やオーケストレーション決定を行います。
* `Reachable`（到達可能）は、Raft 合意（Raft consensus）の多数票（quorum）に参加しているマネージャーノードを表わします。
  リーダーノードが利用不能になった場合、新たなリーダーとして選任される資格を持つノードです。
* `Unavailable`（利用不能）は、他のマネージャーとの通信ができなくなっているマネージャーを表わします。
  マネージャーノードが利用不能になった場合、新たなマネージャーノードを Swarm に参加させるか、ワーカーノードをマネージャーに昇格させる必要があります。
@z

@x
For more information on swarm administration refer to the [Swarm administration guide](admin_guide.md).
@y
{% comment %}
For more information on swarm administration refer to the [Swarm administration guide](admin_guide.md).
{% endcomment %}
Swarm の管理操作に関する詳細は [Swarm 管理ガイド](admin_guide.md) を参照してください。
@z

@x
## Inspect an individual node
@y
{% comment %}
## Inspect an individual node
{% endcomment %}
{: #inspect-an-individual-node }
## ノードの詳細表示
@z

@x
You can run `docker node inspect <NODE-ID>` on a manager node to view the
details for an individual node. The output defaults to JSON format, but you can
pass the `--pretty` flag to print the results in human-readable format. For example:
@y
{% comment %}
You can run `docker node inspect <NODE-ID>` on a manager node to view the
details for an individual node. The output defaults to JSON format, but you can
pass the `--pretty` flag to print the results in human-readable format. For example:
{% endcomment %}
マネージャーノード上において`docker node inspect <NODE-ID>`を実行して、個々のノードについての詳細を確認することができます。
出力はデフォルトで JSON 形式です。
`--pretty`フラグを指定すれば、読みやすい書式により出力することができます。
たとえば以下のとおりです。
@z

@x
```bash
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
```bash
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
{% comment %}
## Update a node
{% endcomment %}
{: #update-a-node }
## ノードの更新
@z

@x
You can modify node attributes as follows:
@y
{% comment %}
You can modify node attributes as follows:
{% endcomment %}
ノードの属性は以下のようにして修正することができます。
@z

@x
* [change node availability](#change-node-availability)
* [add or remove label metadata](#add-or-remove-label-metadata)
* [change a node role](#promote-or-demote-a-node)
@y
{% comment %}
* [change node availability](#change-node-availability)
* [add or remove label metadata](#add-or-remove-label-metadata)
* [change a node role](#promote-or-demote-a-node)
{% endcomment %}
* [ノードの利用状況の変更](#change-node-availability)
* [ラベルメタデータの追加、削除](#add-or-remove-label-metadata)
* [ノードのロール変更](#promote-or-demote-a-node)
@z

@x
### Change node availability
@y
{% comment %}
### Change node availability
{% endcomment %}
{: #change-node-availability }
### ノードの利用状況の変更
@z

@x
Changing node availability lets you:
@y
{% comment %}
Changing node availability lets you:
{% endcomment %}
ノードの利用状況（availability）を変更すると、以下の状況になります。
@z

@x
* drain a manager node so that only performs swarm management tasks and is
  unavailable for task assignment.
* drain a node so you can take it down for maintenance.
* pause a node so it can't receive new tasks.
* restore unavailable or paused nodes available status.
@y
{% comment %}
* drain a manager node so that only performs swarm management tasks and is
  unavailable for task assignment.
* drain a node so you can take it down for maintenance.
* pause a node so it can't receive new tasks.
* restore unavailable or paused nodes available status.
{% endcomment %}
* マネージャーノードを排出（drain）します。
  このマネージャーノードは、Swarm の管理タスクのみを実行し、タスクを受け入れることはできません。
* ノードを排出することで、このノードの保守を行うことができます。
* ノードを一時停止すると、新たなタスクを受け入れることはできません。
* 利用不能や一時停止したノードを、利用可能な状態に戻すことができます。
@z

@x
For example, to change a manager node to `Drain` availability:
@y
{% comment %}
For example, to change a manager node to `Drain` availability:
{% endcomment %}
たとえばマネージャーノードの利用状況を`Drain`にするには以下を行います。
@z

@x
```bash
$ docker node update --availability drain node-1

node-1
```
@y
```bash
$ docker node update --availability drain node-1

node-1
```
@z

@x
See [list nodes](#list-nodes) for descriptions of the different availability
options.
@y
{% comment %}
See [list nodes](#list-nodes) for descriptions of the different availability
options.
{% endcomment %}
別の利用状況オプションの説明については、[ノードの一覧出力](#list-nodes) を参照してください。
@z

@x
### Add or remove label metadata
@y
{% comment %}
### Add or remove label metadata
{% endcomment %}
{: #add-or-remove-label-metadata }
### ラベルメタデータの追加や削除
@z

@x
Node labels provide a flexible method of node organization. You can also use
node labels in service constraints. Apply constraints when you create a service
to limit the nodes where the scheduler assigns tasks for the service.
@y
{% comment %}
Node labels provide a flexible method of node organization. You can also use
node labels in service constraints. Apply constraints when you create a service
to limit the nodes where the scheduler assigns tasks for the service.
{% endcomment %}
ノードにラベルをつけておくと、ノードを構成する上で柔軟な運用が可能になります。
ノードラベルはサービスの制約を示すものとして利用することもできます。
サービスを作成するときに、サービスをタスクに割り当てる際の制限がノードにおいてある場合には、制約を適用してください。
@z

@x
Run `docker node update --label-add` on a manager node to add label metadata to
a node. The `--label-add` flag supports either a `<key>` or a `<key>=<value>`
pair.
@y
{% comment %}
Run `docker node update --label-add` on a manager node to add label metadata to
a node. The `--label-add` flag supports either a `<key>` or a `<key>=<value>`
pair.
{% endcomment %}
マネージャーノード上から`docker node update --label-add`を実行して、ノードにラベルメタデータを追加します。
`--label-add`フラグは、単独の`<key>`、または`<key>=<value>`のペア表記のいずれも可です。
@z

@x
Pass the `--label-add` flag once for each node label you want to add:
@y
{% comment %}
Pass the `--label-add` flag once for each node label you want to add:
{% endcomment %}
ラベルを追加したいノードに対して、一度だけ`--label-add`フラグをつけて以下を実行します。
@z

@x
```bash
$ docker node update --label-add foo --label-add bar=baz node-1

node-1
```
@y
```bash
$ docker node update --label-add foo --label-add bar=baz node-1

node-1
```
@z

@x
The labels you set for nodes using docker node update apply only to the node
entity within the swarm. Do not confuse them with the docker daemon labels for
[dockerd](../../config/labels-custom-metadata.md#daemon-labels).
@y
{% comment %}
The labels you set for nodes using docker node update apply only to the node
entity within the swarm. Do not confuse them with the docker daemon labels for
[dockerd](../../config/labels-custom-metadata.md#daemon-labels).
{% endcomment %}
docker node update を使ってノード用に設定するラベルは、Swarm 内のノードにしか適用されません。
Docker デーモン [dockerd](../../config/labels-custom-metadata.md#daemon-labels) におけるラベルと混同しないように注意してください。
@z

@x
Therefore, node labels can be used to limit critical tasks to nodes that meet
certain requirements. For example, schedule only on machines where special
workloads should be run, such as machines that meet [PCI-SS
compliance](https://www.pcisecuritystandards.org/).
@y
{% comment %}
Therefore, node labels can be used to limit critical tasks to nodes that meet
certain requirements. For example, schedule only on machines where special
workloads should be run, such as machines that meet [PCI-SS
compliance](https://www.pcisecuritystandards.org/).
{% endcomment %}
そこでノードラベルを、特定の条件を満たすノードに割り当てる重要タスクに対して活用することができます。
たとえば、特別な処理を実行させるマシン、たとえば [PCI-SS コンプライアンス](https://www.pcisecuritystandards.org/) を満たすマシンだけをスケジュールするような場合です。

@z

@x
A compromised worker could not compromise these special workloads because it
cannot change node labels.
@y
{% comment %}
A compromised worker could not compromise these special workloads because it
cannot change node labels.
{% endcomment %}
ワーカーが侵害されても、そもそもノードラベルの変更はできないので、その特別な処理が侵害されることはありえません。
@z

@x
Engine labels, however, are still useful because some features that do not
affect secure orchestration of containers might be better off set in a
decentralized manner. For instance, an engine could have a label to indicate
that it has a certain type of disk device, which may not be relevant to security
directly. These labels are more easily "trusted" by the swarm orchestrator.
@y
{% comment %}
Engine labels, however, are still useful because some features that do not
affect secure orchestration of containers might be better off set in a
decentralized manner. For instance, an engine could have a label to indicate
that it has a certain type of disk device, which may not be relevant to security
directly. These labels are more easily "trusted" by the swarm orchestrator.
{% endcomment %}
ただ Engine ラベルは
Engine labels, however, are still useful because some features that do not
affect secure orchestration of containers might be better off set in a
decentralized manner. For instance, an engine could have a label to indicate
that it has a certain type of disk device, which may not be relevant to security
directly. These labels are more easily "trusted" by the swarm orchestrator.
@z

@x
Refer to the `docker service create` [CLI reference](../reference/commandline/service_create.md)
for more information about service constraints.
@y
{% comment %}
Refer to the `docker service create` [CLI reference](../reference/commandline/service_create.md)
for more information about service constraints.
{% endcomment %}
Refer to the `docker service create` [CLI reference](../reference/commandline/service_create.md)
for more information about service constraints.
@z

@x
### Promote or demote a node
@y
{% comment %}
### Promote or demote a node
{% endcomment %}
{: #promote-or-demote-a-node }
### ノードの昇格と降格
@z

@x
You can promote a worker node to the manager role. This is useful when a
manager node becomes unavailable or if you want to take a manager offline for
maintenance. Similarly, you can demote a manager node to the worker role.
@y
{% comment %}
You can promote a worker node to the manager role. This is useful when a
manager node becomes unavailable or if you want to take a manager offline for
maintenance. Similarly, you can demote a manager node to the worker role.
{% endcomment %}
You can promote a worker node to the manager role. This is useful when a
manager node becomes unavailable or if you want to take a manager offline for
maintenance. Similarly, you can demote a manager node to the worker role.
@z

@x
> **Note**: Regardless of your reason to promote or demote
> a node, you must always maintain a quorum of manager nodes in the
> swarm. For more information refer to the [Swarm administration guide](admin_guide.md).
@y
{% comment %}
> **Note**: Regardless of your reason to promote or demote
> a node, you must always maintain a quorum of manager nodes in the
> swarm. For more information refer to the [Swarm administration guide](admin_guide.md).
{% endcomment %}
> **Note**: Regardless of your reason to promote or demote
> a node, you must always maintain a quorum of manager nodes in the
> swarm. For more information refer to the [Swarm administration guide](admin_guide.md).
@z

@x
To promote a node or set of nodes, run `docker node promote` from a manager
node:
@y
{% comment %}
To promote a node or set of nodes, run `docker node promote` from a manager
node:
{% endcomment %}
To promote a node or set of nodes, run `docker node promote` from a manager
node:
@z

@x
```bash
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
```bash
$ docker node promote node-3 node-2

Node node-3 promoted to a manager in the swarm.
Node node-2 promoted to a manager in the swarm.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese1" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
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
{% comment %}
To demote a node or set of nodes, run `docker node demote` from a manager node:
{% endcomment %}
To demote a node or set of nodes, run `docker node demote` from a manager node:
@z

@x
```bash
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
```bash
$ docker node demote node-3 node-2

Manager node-3 demoted in the swarm.
Manager node-2 demoted in the swarm.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese2" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
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
{% comment %}
`docker node promote` and `docker node demote` are convenience commands for
`docker node update --role manager` and `docker node update --role worker`
respectively.
{% endcomment %}
`docker node promote` and `docker node demote` are convenience commands for
`docker node update --role manager` and `docker node update --role worker`
respectively.
@z

@x
## Install plugins on swarm nodes
@y
{% comment %}
## Install plugins on swarm nodes
{% endcomment %}
{: #install-plugins-on-swarm-nodes }
## Install plugins on swarm nodes
@z

@x
If your swarm service relies on one or more
[plugins](/engine/extend/plugin_api/), these plugins need to be available on
every node where the service could potentially be deployed. You can manually
install the plugin on each node or script the installation. In Docker 17.07 and
higher, you can also deploy the plugin in a similar way as a global service
using the Docker API, by specifying a `PluginSpec` instead of a `ContainerSpec`.
@y
{% comment %}
If your swarm service relies on one or more
[plugins](/engine/extend/plugin_api/), these plugins need to be available on
every node where the service could potentially be deployed. You can manually
install the plugin on each node or script the installation. In Docker 17.07 and
higher, you can also deploy the plugin in a similar way as a global service
using the Docker API, by specifying a `PluginSpec` instead of a `ContainerSpec`.
{% endcomment %}
If your swarm service relies on one or more
[plugins](/engine/extend/plugin_api/), these plugins need to be available on
every node where the service could potentially be deployed. You can manually
install the plugin on each node or script the installation. In Docker 17.07 and
higher, you can also deploy the plugin in a similar way as a global service
using the Docker API, by specifying a `PluginSpec` instead of a `ContainerSpec`.
@z

@x
> **Note**: There is currently no way to deploy a plugin to a swarm using the
> Docker CLI or Docker Compose. In addition, it is not possible to install
> plugins from a private repository.
@y
{% comment %}
> **Note**: There is currently no way to deploy a plugin to a swarm using the
> Docker CLI or Docker Compose. In addition, it is not possible to install
> plugins from a private repository.
{% endcomment %}
> **Note**: There is currently no way to deploy a plugin to a swarm using the
> Docker CLI or Docker Compose. In addition, it is not possible to install
> plugins from a private repository.
@z

@x
The [`PluginSpec`](/engine/extend/plugin_api/#json-specification)
is defined by the plugin developer. To add the plugin to all Docker nodes, use
the [`service/create`](/engine/api/v1.31/#operation/ServiceCreate) API, passing
the `PluginSpec` JSON defined in the `TaskTemplate`.
@y
{% comment %}
The [`PluginSpec`](/engine/extend/plugin_api/#json-specification)
is defined by the plugin developer. To add the plugin to all Docker nodes, use
the [`service/create`](/engine/api/v1.31/#operation/ServiceCreate) API, passing
the `PluginSpec` JSON defined in the `TaskTemplate`.
{% endcomment %}
The [`PluginSpec`](/engine/extend/plugin_api/#json-specification)
is defined by the plugin developer. To add the plugin to all Docker nodes, use
the [`service/create`](/engine/api/v1.31/#operation/ServiceCreate) API, passing
the `PluginSpec` JSON defined in the `TaskTemplate`.
@z

@x
## Leave the swarm
@y
{% comment %}
## Leave the swarm
{% endcomment %}
{: #leave-the-swarm }
## Leave the swarm
@z

@x
Run the `docker swarm leave` command on a node to remove it from the swarm.
@y
{% comment %}
Run the `docker swarm leave` command on a node to remove it from the swarm.
{% endcomment %}
Run the `docker swarm leave` command on a node to remove it from the swarm.
@z

@x
For example to leave the swarm on a worker node:
@y
{% comment %}
For example to leave the swarm on a worker node:
{% endcomment %}
For example to leave the swarm on a worker node:
@z

@x
```bash
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
```bash
$ docker swarm leave

Node left the swarm.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese3" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
$ docker swarm leave

Node left the swarm.
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
{% comment %}
When a node leaves the swarm, the Docker Engine stops running in swarm
mode. The orchestrator no longer schedules tasks to the node.
{% endcomment %}
When a node leaves the swarm, the Docker Engine stops running in swarm
mode. The orchestrator no longer schedules tasks to the node.
@z

@x
If the node is a manager node, you receive a warning about maintaining the
quorum. To override the warning, pass the `--force` flag. If the last manager
node leaves the swarm, the swarm becomes unavailable requiring you to take
disaster recovery measures.
@y
{% comment %}
If the node is a manager node, you receive a warning about maintaining the
quorum. To override the warning, pass the `--force` flag. If the last manager
node leaves the swarm, the swarm becomes unavailable requiring you to take
disaster recovery measures.
{% endcomment %}
If the node is a manager node, you receive a warning about maintaining the
quorum. To override the warning, pass the `--force` flag. If the last manager
node leaves the swarm, the swarm becomes unavailable requiring you to take
disaster recovery measures.
@z

@x
For information about maintaining a quorum and disaster recovery, refer to the
[Swarm administration guide](admin_guide.md).
@y
{% comment %}
For information about maintaining a quorum and disaster recovery, refer to the
[Swarm administration guide](admin_guide.md).
{% endcomment %}
For information about maintaining a quorum and disaster recovery, refer to the
[Swarm administration guide](admin_guide.md).
@z

@x
After a node leaves the swarm, you can run the `docker node rm` command on a
manager node to remove the node from the node list.
@y
{% comment %}
After a node leaves the swarm, you can run the `docker node rm` command on a
manager node to remove the node from the node list.
{% endcomment %}
After a node leaves the swarm, you can run the `docker node rm` command on a
manager node to remove the node from the node list.
@z

@x
For instance:
@y
{% comment %}
For instance:
{% endcomment %}
For instance:
@z

@x
```bash
$ docker node rm node-2
```
@y
```bash
$ docker node rm node-2
```
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
* [Swarm administration guide](admin_guide.md)
* [Docker Engine command line reference](../reference/commandline/docker.md)
* [Swarm mode tutorial](swarm-tutorial/index.md)
@y
{% comment %}
* [Swarm administration guide](admin_guide.md)
* [Docker Engine command line reference](../reference/commandline/docker.md)
* [Swarm mode tutorial](swarm-tutorial/index.md)
{% endcomment %}
* [Swarm 管理ガイド](admin_guide.md)
* [Docker Engine コマンドラインリファレンス](../reference/commandline/docker.md)
* [Swarm モードチュートリアル](swarm-tutorial/index.md)
@z
