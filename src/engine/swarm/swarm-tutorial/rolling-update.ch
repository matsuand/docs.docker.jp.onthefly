%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Apply rolling updates to a service on the swarm
keywords: tutorial, cluster management, swarm, service, rolling-update
title: Apply rolling updates to a service
notoc: true
---
@y
---
description: Apply rolling updates to a service on the swarm
keywords: tutorial, cluster management, swarm, service, rolling-update
title: サービスへのローリングアップデートの適用
notoc: true
---
@z

@x
In a previous step of the tutorial, you [scaled](scale-service.md) the number of
instances of a service. In this part of the tutorial, you deploy a service based
on the Redis 3.0.6 container tag. Then you upgrade the service to use the
Redis 3.0.7 container image using rolling updates.
@y
{% comment %}
In a previous step of the tutorial, you [scaled](scale-service.md) the number of
instances of a service. In this part of the tutorial, you deploy a service based
on the Redis 3.0.6 container tag. Then you upgrade the service to use the
Redis 3.0.7 container image using rolling updates.
{% endcomment %}
チュートリアルの前の手順では、サービスのインスタンス数を [スケール変更](scale-service.md) しました。
ここでは Redis 3.0.6 というタグをつけたコンテナーを使って、サービスのデプロイを行います。
そしてこのサービスが Redis 3.0.7 というコンテナーイメージを用いるように、ローリングアップデートを使ってサービスをアップグレードします。
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
2.  Deploy your Redis tag to the swarm and configure the swarm with a 10 second
    update delay. Note that the following example shows an older Redis tag:
@y
{% comment %}
2.  Deploy your Redis tag to the swarm and configure the swarm with a 10 second
    update delay. Note that the following example shows an older Redis tag:
{% endcomment %}
2.  Regis タグを Swarm にデプロイします。
    そして Swarm に対して、アップデートの待機時間（update delay）を 10 秒に設定します。
    なお以下の例は、古い方の Redis タグを使っています。
@z

@x
    ```bash
    $ docker service create \
      --replicas 3 \
      --name redis \
      --update-delay 10s \
      redis:3.0.6
@y
    ```bash
    $ docker service create \
      --replicas 3 \
      --name redis \
      --update-delay 10s \
      redis:3.0.6
@z

@x
    0u6a4s31ybk7yw2wyvtikmu50
    ```
@y
    0u6a4s31ybk7yw2wyvtikmu50
    ```
@z

@x
    You configure the rolling update policy at service deployment time.
@y
    {% comment %}
    You configure the rolling update policy at service deployment time.
    {% endcomment %}
    上のコマンドにより、サービスデプロイ時のローリングアップデートポリシーを設定したことになります。
@z

@x
    The `--update-delay` flag configures the time delay between updates to a
    service task or sets of tasks. You can describe the time `T` as a
    combination of the number of seconds `Ts`, minutes `Tm`, or hours `Th`. So
    `10m30s` indicates a 10 minute 30 second delay.
@y
    {% comment %}
    The `--update-delay` flag configures the time delay between updates to a
    service task or sets of tasks. You can describe the time `T` as a
    combination of the number of seconds `Ts`, minutes `Tm`, or hours `Th`. So
    `10m30s` indicates a 10 minute 30 second delay.
    {% endcomment %}
    `--update-delay` フラグは、サービスの 1 つあるいは複数のタスクに対して、アップデートの待機時間を設定するものです。
    数値を `T` として、`Ts` は秒、`Tm` は分、`Th` は時間を表現します。
    そこでたとえば `10m30s` は 10 分 30 秒の遅延を表現します。
@z

@x
    By default the scheduler updates 1 task at a time. You can pass the
    `--update-parallelism` flag to configure the maximum number of service tasks
    that the scheduler updates simultaneously.
@y
    {% comment %}
    By default the scheduler updates 1 task at a time. You can pass the
    `--update-parallelism` flag to configure the maximum number of service tasks
    that the scheduler updates simultaneously.
    {% endcomment %}
    デフォルトにおいてスケジューラーは、一度に 1 つのタスクをアップデートします。
    `--update-parallelism` フラグを指定すれば、スケジューラーが同時にアップデート可能なサービスタスクの最大数を設定することができます。
@z

@x
    By default, when an update to an individual task returns a state of
    `RUNNING`, the scheduler schedules another task to update until all tasks
    are updated. If, at any time during an update a task returns `FAILED`, the
    scheduler pauses the update. You can control the behavior using the
    `--update-failure-action` flag for `docker service create` or
    `docker service update`.
@y
    {% comment %}
    By default, when an update to an individual task returns a state of
    `RUNNING`, the scheduler schedules another task to update until all tasks
    are updated. If, at any time during an update a task returns `FAILED`, the
    scheduler pauses the update. You can control the behavior using the
    `--update-failure-action` flag for `docker service create` or
    `docker service update`.
    {% endcomment %}
    ある 1 つのタスクに対するアップデート処理の結果として `RUNNING` という状態が返ってきたとします。
    デフォルトでスケジューラーは、その場合、別のタスクを処理するようにし、最終的にタスクすべてのアップデートが完了するようにスケジュールされます。
    アップデートのどういうタイミングであっても、タスクが `FAILED` を返してきたら、スケジューラーはアップデート処理を中断します。
    この動きに対しては、`docker service create` や `docker service update` における `--update-failure-action` フラグを使って制御することができます。
@z

@x
3.  Inspect the `redis` service:
@y
{% comment %}
3.  Inspect the `redis` service:
{% endcomment %}
3.  `redis` サービスを確認します。
@z

@x
    ```bash
    $ docker service inspect --pretty redis
@y
    ```bash
    $ docker service inspect --pretty redis
@z

@x
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    Service Mode:   Replicated
     Replicas:      3
    Placement:
     Strategy:	    Spread
    UpdateConfig:
     Parallelism:   1
     Delay:         10s
    ContainerSpec:
     Image:         redis:3.0.6
    Resources:
    Endpoint Mode:  vip
    ```
@y
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    Service Mode:   Replicated
     Replicas:      3
    Placement:
     Strategy:	    Spread
    UpdateConfig:
     Parallelism:   1
     Delay:         10s
    ContainerSpec:
     Image:         redis:3.0.6
    Resources:
    Endpoint Mode:  vip
    ```
@z

@x
4.  Now you can update the container image for `redis`. The swarm  manager
    applies the update to nodes according to the `UpdateConfig` policy:
@y
{% comment %}
4.  Now you can update the container image for `redis`. The swarm  manager
    applies the update to nodes according to the `UpdateConfig` policy:
{% endcomment %}
4.  `redis` に対するコンテナーイメージのアップデータを行います。
    Swarm マネージャーは `UpdateConfig` ポリシーに従って、ノードへのアップデートを適用します。
@z

@x
    ```bash
    $ docker service update --image redis:3.0.7 redis
    redis
    ```
@y
    ```bash
    $ docker service update --image redis:3.0.7 redis
    redis
    ```
@z

@x
    The scheduler applies rolling updates as follows by default:
@y
    {% comment %}
    The scheduler applies rolling updates as follows by default:
    {% endcomment %}
    スケジューラーは、デフォルトで以下のようにしてローリングアップデートを適用します。
@z

@x
    * Stop the first task.
    * Schedule update for the stopped task.
    * Start the container for the updated task.
    * If the update to a task returns `RUNNING`, wait for the
      specified delay period then start the next task.
    * If, at any time during the update, a task returns `FAILED`, pause the
      update.
@y
    {% comment %}
    * Stop the first task.
    * Schedule update for the stopped task.
    * Start the container for the updated task.
    * If the update to a task returns `RUNNING`, wait for the
      specified delay period then start the next task.
    * If, at any time during the update, a task returns `FAILED`, pause the
      update.
    {% endcomment %}
    * 最初のタスクを停止します。
    * 停止したタスクに対してアップデートをスケジュールします。
    * アップデート対象のタスクに対してコンテナーを起動します。
    * 1 つのタスクに対するアップデートにおいて `RUNNING` が返ってきたら、指定された待機時間だけ待って、次のタスクの処理を開始します。
    * アップデート中にタスクが `FAILED` を返したら、アップデートを中断します。
@z

@x
5.  Run `docker service inspect --pretty redis` to see the new image in the
    desired state:
@y
{% comment %}
5.  Run `docker service inspect --pretty redis` to see the new image in the
    desired state:
{% endcomment %}
5.  `docker service inspect --pretty redis` を実行して、新たなイメージが思ったとおりの状態になっていることを確認します。
@z

@x
    ```bash
    $ docker service inspect --pretty redis
@y
    ```bash
    $ docker service inspect --pretty redis
@z

@x
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    Service Mode:   Replicated
     Replicas:      3
    Placement:
     Strategy:	    Spread
    UpdateConfig:
     Parallelism:   1
     Delay:         10s
    ContainerSpec:
     Image:         redis:3.0.7
    Resources:
    Endpoint Mode:  vip
    ```
@y
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    Service Mode:   Replicated
     Replicas:      3
    Placement:
     Strategy:	    Spread
    UpdateConfig:
     Parallelism:   1
     Delay:         10s
    ContainerSpec:
     Image:         redis:3.0.7
    Resources:
    Endpoint Mode:  vip
    ```
@z

@x
    The output of `service inspect` shows if your update paused due to failure:
@y
    {% comment %}
    The output of `service inspect` shows if your update paused due to failure:
    {% endcomment %}
    処理失敗によりアップデートが中断していたら `service inspect` の結果は以下のようになります。
@z

@x
    ```bash
    $ docker service inspect --pretty redis
@y
    ```bash
    $ docker service inspect --pretty redis
@z

@x
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    ...snip...
    Update status:
     State:      paused
     Started:    11 seconds ago
     Message:    update paused due to failure or early termination of task 9p7ith557h8ndf0ui9s0q951b
    ...snip...
    ```
@y
    ID:             0u6a4s31ybk7yw2wyvtikmu50
    Name:           redis
    ...snip...
    Update status:
     State:      paused
     Started:    11 seconds ago
     Message:    update paused due to failure or early termination of task 9p7ith557h8ndf0ui9s0q951b
    ...snip...
    ```
@z

@x
    To restart a paused update run `docker service update <SERVICE-ID>`. For example:
@y
    {% comment %}
    To restart a paused update run `docker service update <SERVICE-ID>`. For example:
    {% endcomment %}
    中断しているアップデートを再び開始するには、`docker service update <サービスID>` を実行します。
    たとえば以下のとおりです。
@z

@x
    ```bash
    docker service update redis
    ```
@y
    ```bash
    docker service update redis
    ```
@z

@x
    To avoid repeating certain update failures, you may need to reconfigure the
    service by passing flags to `docker service update`.
@y
    {% comment %}
    To avoid repeating certain update failures, you may need to reconfigure the
    service by passing flags to `docker service update`.
    {% endcomment %}
    特定のアップデータ失敗が続くようであれば、これを解消するために、`docker service update` に何らかのフラグを指定して、サービスを再設定する必要があるかもしれません。
@z

@x
6.  Run `docker service ps <SERVICE-ID>` to watch the rolling update:
@y
{% comment %}
6.  Run `docker service ps <SERVICE-ID>` to watch the rolling update:
{% endcomment %}
6.  `docker service ps <サービスID>` を実行して、ローリングアップデートの状況を確認します。
@z

@x
    ```bash
    $ docker service ps redis
@y
    ```bash
    $ docker service ps redis
@z

@x
    NAME                                   IMAGE        NODE       DESIRED STATE  CURRENT STATE            ERROR
    redis.1.dos1zffgeofhagnve8w864fco      redis:3.0.7  worker1    Running        Running 37 seconds
     \_ redis.1.88rdo6pa52ki8oqx6dogf04fh  redis:3.0.6  worker2    Shutdown       Shutdown 56 seconds ago
    redis.2.9l3i4j85517skba5o7tn5m8g0      redis:3.0.7  worker2    Running        Running About a minute
     \_ redis.2.66k185wilg8ele7ntu8f6nj6i  redis:3.0.6  worker1    Shutdown       Shutdown 2 minutes ago
    redis.3.egiuiqpzrdbxks3wxgn8qib1g      redis:3.0.7  worker1    Running        Running 48 seconds
     \_ redis.3.ctzktfddb2tepkr45qcmqln04  redis:3.0.6  mmanager1  Shutdown       Shutdown 2 minutes ago
    ```
@y
    NAME                                   IMAGE        NODE       DESIRED STATE  CURRENT STATE            ERROR
    redis.1.dos1zffgeofhagnve8w864fco      redis:3.0.7  worker1    Running        Running 37 seconds
     \_ redis.1.88rdo6pa52ki8oqx6dogf04fh  redis:3.0.6  worker2    Shutdown       Shutdown 56 seconds ago
    redis.2.9l3i4j85517skba5o7tn5m8g0      redis:3.0.7  worker2    Running        Running About a minute
     \_ redis.2.66k185wilg8ele7ntu8f6nj6i  redis:3.0.6  worker1    Shutdown       Shutdown 2 minutes ago
    redis.3.egiuiqpzrdbxks3wxgn8qib1g      redis:3.0.7  worker1    Running        Running 48 seconds
     \_ redis.3.ctzktfddb2tepkr45qcmqln04  redis:3.0.6  mmanager1  Shutdown       Shutdown 2 minutes ago
    ```
@z

@x
    Before Swarm updates all of the tasks, you can see that some are running
    `redis:3.0.6` while others are running `redis:3.0.7`. The output above shows
    the state once the rolling updates are done.
@y
    {% comment %}
    Before Swarm updates all of the tasks, you can see that some are running
    `redis:3.0.6` while others are running `redis:3.0.7`. The output above shows
    the state once the rolling updates are done.
    {% endcomment %}
    Swarm が全タスクに対するアップデートを終えていない状態であれば、`redis:3.0.6` を実行しているものがあり、また `redis:3.0.7` を実行しているものもありました。
    上の結果からは、ローリングアップデート処理を終えた状態であることがわかります。
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
Next, learn about how to [drain a node](drain-node.md) in the swarm.
@y
{% comment %}
Next, learn about how to [drain a node](drain-node.md) in the swarm.
{% endcomment %}
次は Swarm 内からの [ノードの解放](drain-node.md) について学びます。
@z
