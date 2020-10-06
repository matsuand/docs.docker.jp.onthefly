%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Drain nodes on the swarm
keywords: tutorial, cluster management, swarm, service, drain
title: Drain a node on the swarm
notoc: true
---
@y
---
description: Drain nodes on the swarm
keywords: tutorial, cluster management, swarm, service, drain
title: Swarm ノードの解放
notoc: true
---
@z

@x
In earlier steps of the tutorial, all the nodes have been running with `ACTIVE`
availability. The swarm manager can assign tasks to any `ACTIVE` node, so up to
now all nodes have been available to receive tasks.
@y
{% comment %}
In earlier steps of the tutorial, all the nodes have been running with `ACTIVE`
availability. The swarm manager can assign tasks to any `ACTIVE` node, so up to
now all nodes have been available to receive tasks.
{% endcomment %}
このチュートリアルの初めの方では、実行されているノードの利用状態（availability）は `ACTIVE` になっていました。
Swarm マネージャーは `ACTIVE` なノードであるからこそ、タスクを割り振ることができます。
ここまでのところは、ノードがすべて利用可能であったから、タスクを受け取ることができたわけです。
@z

@x
Sometimes, such as planned maintenance times, you need to set a node to `DRAIN`
availability. `DRAIN` availability  prevents a node from receiving new tasks
from the swarm manager. It also means the manager stops tasks running on the
node and launches replica tasks on a node with `ACTIVE` availability.
@y
{% comment %}
Sometimes, such as planned maintenance times, you need to set a node to `DRAIN`
availability. `DRAIN` availability  prevents a node from receiving new tasks
from the swarm manager. It also means the manager stops tasks running on the
node and launches replica tasks on a node with `ACTIVE` availability.
{% endcomment %}
たとえば定期メンテナンスの時などでは、ノードの利用状態を `DRAIN`、つまり解放状態にしておくことが必要な場合があります。
`DRAIN` という状態にあるノードは Swarm マネージャーから、新たなタスクを受け取ることができません。
またそのノード上に実行されていたタスクは、マネージャーによって停止され、`ACTIVE` 状態にある別のノードに複製タスクが割り振られます。
@z

@x
> **Important**: Setting a node to `DRAIN` does not remove standalone containers from that node,
> such as those created with `docker run`, `docker-compose up`, or the Docker Engine
> API. A node's status, including `DRAIN`, only affects the node's ability to schedule
> swarm service workloads.
{:.important}
@y
{% comment %}
> **Important**: Setting a node to `DRAIN` does not remove standalone containers from that node,
> such as those created with `docker run`, `docker-compose up`, or the Docker Engine
> API. A node's status, including `DRAIN`, only affects the node's ability to schedule
> swarm service workloads.
{:.important}
{% endcomment %}
> **重要**: スタンドアロンコンテナーは `docker run`、`docker-compose up`、あるいは Docker Engine API を使って生成されますが、ノードの状態を `DRAIN` にするということは、そのノードからスタンドアロンコンテナーを削除するという意味ではありません。
> `DRAIN` も含めてノードの状態というものは、Swarm サービスによる処理スケジューリングにあたり、ノードの利用能力の有無を決めるものでしかありません。
{:.important}
@z

@x
1.  If you haven't already, open a terminal and ssh into the machine where you
    run your manager node. For example, the tutorial uses a machine named
    `manager1`.
@y
{% comment %}
1.  If you haven't already, open a terminal and ssh into the machine where you
    run your manager node. For example, the tutorial uses a machine named
    `manager1`.
{% endcomment %}
1.  マシンへの接続ができていなければ、端末画面を開いて SSH により接続します。
    接続先はマネージャーノードを起動したマシンです。
    たとえばこのチュートリアルでは `manager1` というマシンを利用します。
@z

@x
2.  Verify that all your nodes are actively available.
@y
{% comment %}
2.  Verify that all your nodes are actively available.
{% endcomment %}
2.  ノードがすべてアクティブであって利用可能であることを確認します。
@z

@x
    ```bash
    $ docker node ls
@y
    ```bash
    $ docker node ls
@z

@x
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0    worker2   Ready   Active
    38ciaotwjuritcdtn9npbnkuz    worker1   Ready   Active
    e216jshn25ckzbvmwlnh5jr3g *  manager1  Ready   Active        Leader
    ```
@y
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    1bcef6utixb0l0ca7gxuivsj0    worker2   Ready   Active
    38ciaotwjuritcdtn9npbnkuz    worker1   Ready   Active
    e216jshn25ckzbvmwlnh5jr3g *  manager1  Ready   Active        Leader
    ```
@z

@x
3.  If you aren't still running the `redis` service from the
    [rolling update](rolling-update.md) tutorial, start it now:
@y
{% comment %}
3.  If you aren't still running the `redis` service from the
    [rolling update](rolling-update.md) tutorial, start it now:
{% endcomment %}
3.  チュートリアルの [ローリングアップデート](rolling-update.md) における `redis` を停止してしまっている場合は、ここで起動します。
@z

@x
    ```bash
    $ docker service create --replicas 3 --name redis --update-delay 10s redis:3.0.6
@y
    ```bash
    $ docker service create --replicas 3 --name redis --update-delay 10s redis:3.0.6
@z

@x
    c5uo6kdmzpon37mgj9mwglcfw
    ```
@y
    c5uo6kdmzpon37mgj9mwglcfw
    ```
@z

@x
4.  Run `docker service ps redis` to see how the swarm manager assigned the
tasks to different nodes:
@y
{% comment %}
4.  Run `docker service ps redis` to see how the swarm manager assigned the
tasks to different nodes:
{% endcomment %}
4.  `docker service ps redis` を実行して、Swarm マネージャーがさまざまなノードに対して、タスクを割り当てている様子を確認します。
@z

@x
    ```bash
    $ docker service ps redis
@y
    ```bash
    $ docker service ps redis
@z

@x
    NAME                               IMAGE        NODE     DESIRED STATE  CURRENT STATE
    redis.1.7q92v0nr1hcgts2amcjyqg3pq  redis:3.0.6  manager1 Running        Running 26 seconds
    redis.2.7h2l8h3q3wqy5f66hlv9ddmi6  redis:3.0.6  worker1  Running        Running 26 seconds
    redis.3.9bg7cezvedmkgg6c8yzvbhwsd  redis:3.0.6  worker2  Running        Running 26 seconds
    ```
@y
    NAME                               IMAGE        NODE     DESIRED STATE  CURRENT STATE
    redis.1.7q92v0nr1hcgts2amcjyqg3pq  redis:3.0.6  manager1 Running        Running 26 seconds
    redis.2.7h2l8h3q3wqy5f66hlv9ddmi6  redis:3.0.6  worker1  Running        Running 26 seconds
    redis.3.9bg7cezvedmkgg6c8yzvbhwsd  redis:3.0.6  worker2  Running        Running 26 seconds
    ```
@z

@x
    In this case the swarm manager distributed one task to each node. You may
    see the tasks distributed differently among the nodes in your environment.
@y
    {% comment %}
    In this case the swarm manager distributed one task to each node. You may
    see the tasks distributed differently among the nodes in your environment.
    {% endcomment %}
    この例では、Swarm マネージャーが 1 つのタスクを各ノードに分散しています。
    実行環境によっては、複数ノード間でのタスク分散の仕方が異なっているかもしれません。
@z

@x
5.  Run `docker node update --availability drain <NODE-ID>` to drain a node that
had a task assigned to it:
@y
{% comment %}
5.  Run `docker node update --availability drain <NODE-ID>` to drain a node that
had a task assigned to it:
{% endcomment %}
5.  `docker node update --availability drain <ノードID>` を実行して、1 つのタスクが割り当てられているノードを解放（drain）します。
@z

@x
    ```bash
    docker node update --availability drain worker1

    worker1
    ```
@y
    ```bash
    docker node update --availability drain worker1

    worker1
    ```
@z

@x
6.  Inspect the node to check its availability:
@y
{% comment %}
6.  Inspect the node to check its availability:
{% endcomment %}
6.  ノードが利用可能であるか（availability）を確認します。
@z

@x
    ```bash
    $ docker node inspect --pretty worker1

    ID:			38ciaotwjuritcdtn9npbnkuz
    Hostname:		worker1
    Status:
     State:			Ready
     Availability:		Drain
    ...snip...
    ```
@y
    ```bash
    $ docker node inspect --pretty worker1

    ID:			38ciaotwjuritcdtn9npbnkuz
    Hostname:		worker1
    Status:
     State:			Ready
     Availability:		Drain
    ...snip...
    ```
@z

@x
    The drained node shows `Drain` for `AVAILABILITY`.
@y
    {% comment %}
    The drained node shows `Drain` for `AVAILABILITY`.
    {% endcomment %}
    解放したノードの `AVAILABILITY` は `Drain` と示されています。
@z

@x
7.  Run `docker service ps redis` to see how the swarm manager updated the
task assignments for the `redis` service:
@y
{% comment %}
7.  Run `docker service ps redis` to see how the swarm manager updated the
task assignments for the `redis` service:
{% endcomment %}
7.  `docker service ps redis` を実行して、Swarm マネージャーが `redis` サービスに対して、どのようにタスク割り当てを更新しているかを確認します。
@z

@x
    ```bash
    $ docker service ps redis
@y
    ```bash
    $ docker service ps redis
@z

@x
    NAME                                    IMAGE        NODE      DESIRED STATE  CURRENT STATE           ERROR
    redis.1.7q92v0nr1hcgts2amcjyqg3pq       redis:3.0.6  manager1  Running        Running 4 minutes
    redis.2.b4hovzed7id8irg1to42egue8       redis:3.0.6  worker2   Running        Running About a minute
     \_ redis.2.7h2l8h3q3wqy5f66hlv9ddmi6   redis:3.0.6  worker1   Shutdown       Shutdown 2 minutes ago
    redis.3.9bg7cezvedmkgg6c8yzvbhwsd       redis:3.0.6  worker2   Running        Running 4 minutes
    ```
@y
    NAME                                    IMAGE        NODE      DESIRED STATE  CURRENT STATE           ERROR
    redis.1.7q92v0nr1hcgts2amcjyqg3pq       redis:3.0.6  manager1  Running        Running 4 minutes
    redis.2.b4hovzed7id8irg1to42egue8       redis:3.0.6  worker2   Running        Running About a minute
     \_ redis.2.7h2l8h3q3wqy5f66hlv9ddmi6   redis:3.0.6  worker1   Shutdown       Shutdown 2 minutes ago
    redis.3.9bg7cezvedmkgg6c8yzvbhwsd       redis:3.0.6  worker2   Running        Running 4 minutes
    ```
@z

@x
    The swarm manager maintains the desired state by ending the task on a node
    with `Drain` availability and creating a new task on a node with `Active`
    availability.
@y
    {% comment %}
    The swarm manager maintains the desired state by ending the task on a node
    with `Drain` availability and creating a new task on a node with `Active`
    availability.
    {% endcomment %}
    Swarm マネージャーは求められる状態を維持するために、`Drain` 状態にあるノード上のタスクを終了させ、`Active` 状態にあるノード上に新たなタスクを生成します。
@z

@x
8.  Run  `docker node update --availability active <NODE-ID>` to return the
drained node to an active state:
@y
{% comment %}
8.  Run  `docker node update --availability active <NODE-ID>` to return the
drained node to an active state:
{% endcomment %}
8.  `docker node update --availability active <ノードID>` を実行すれば、解放状態にあったノードをアクティブ状態に戻すことができます。
@z

@x
    ```bash
    $ docker node update --availability active worker1

    worker1
    ```
@y
    ```bash
    $ docker node update --availability active worker1

    worker1
    ```
@z

@x
9.  Inspect the node to see the updated state:
@y
{% comment %}
9.  Inspect the node to see the updated state:
{% endcomment %}
9.  ノードの状態が更新されていることを確認します。
@z

@x
    ```bash
    $ docker node inspect --pretty worker1
@y
    ```bash
    $ docker node inspect --pretty worker1
@z

@x
    ID:			38ciaotwjuritcdtn9npbnkuz
    Hostname:		worker1
    Status:
     State:			Ready
     Availability:		Active
    ...snip...
    ```
@y
    ID:			38ciaotwjuritcdtn9npbnkuz
    Hostname:		worker1
    Status:
     State:			Ready
     Availability:		Active
    ...snip...
    ```
@z

@x
    When you set the node back to `Active` availability, it can receive new tasks:
@y
    {% comment %}
    When you set the node back to `Active` availability, it can receive new tasks:
    {% endcomment %}
    ノードの状態を `Active` に戻した場合、新たなタスクを受け取るようになるのは、以下のときです。
@z

@x
    * during a service update to scale up
    * during a rolling update
    * when you set another node to `Drain` availability
    * when a task fails on another active node
@y
    {% comment %}
    * during a service update to scale up
    * during a rolling update
    * when you set another node to `Drain` availability
    * when a task fails on another active node
    {% endcomment %}
    * サービスがスケールアップするために更新されたとき。
    * ローリングアップデートのとき。
    * 別のノードの状態を `Drain` にしたとき。
    * 別のアクティブなノードにおいてタスクが失敗したとき。
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
Learn how to [use a swarm mode routing mesh](../ingress.md).
@y
{% comment %}
Learn how to [use a swarm mode routing mesh](../ingress.md).
{% endcomment %}
[Swarm モードでのルーティングメッシュの利用](../ingress.md) について学びます。
@z
