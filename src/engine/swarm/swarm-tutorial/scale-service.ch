%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Scale the service running in the swarm
keywords: tutorial, cluster management, swarm mode, scale
title: Scale the service in the swarm
notoc: true
---
@y
---
description: Scale the service running in the swarm
keywords: tutorial, cluster management, swarm mode, scale
title: Swarm 内サービスのスケール変更
notoc: true
---
@z

@x
Once you have [deployed a service](deploy-service.md) to a swarm, you are ready
to use the Docker CLI to scale the number of containers in
the service. Containers running in a service are called "tasks."
@y
Swarm に対して [サービスのデプロイ](deploy-service.md) を行ったら、次は Docker CLI を使って、サービス内のコンテナー数のスケール変更を行います。
サービス内に起動しているコンテナーは「タスク」と呼びます。
@z

@x
1.  If you haven't already, open a terminal and ssh into the machine where you
    run your manager node. For example, the tutorial uses a machine named
    `manager1`.
@y
1.  マシンへの接続ができていなければ、端末画面を開いて SSH により接続します。
    接続先はマネージャーノードを起動したマシンです。
    たとえばこのチュートリアルでは`manager1`というマシンを利用します。
@z

@x
2.  Run the following command to change the desired state of the
    service running in the swarm:
@y
2.  Swarm 内で起動しているサービスの状態を変更するため、以下のコマンドを実行します。
@z

@x
    ```console
    $ docker service scale <SERVICE-ID>=<NUMBER-OF-TASKS>
    ```
@y
    ```console
    $ docker service scale <サービスID>=<タスク数>
    ```
@z

@x
    For example:
@y
    たとえば以下のとおりです。
@z

@x
    ```console
    $ docker service scale helloworld=5
@y
    ```console
    $ docker service scale helloworld=5
@z

@x
    helloworld scaled to 5
    ```
@y
    helloworld scaled to 5
    ```
@z

@x
3.  Run `docker service ps <SERVICE-ID>` to see the updated task list:
@y
3.  `docker service ps <サービスID>`を実行して、タスク一覧が更新されていることを確認します。
@z

@x
    ```console
    $ docker service ps helloworld
@y
    ```console
    $ docker service ps helloworld
@z

@x
    NAME                                    IMAGE   NODE      DESIRED STATE  CURRENT STATE
    helloworld.1.8p1vev3fq5zm0mi8g0as41w35  alpine  worker2   Running        Running 7 minutes
    helloworld.2.c7a7tcdq5s0uk3qr88mf8xco6  alpine  worker1   Running        Running 24 seconds
    helloworld.3.6crl09vdcalvtfehfh69ogfb1  alpine  worker1   Running        Running 24 seconds
    helloworld.4.auky6trawmdlcne8ad8phb0f1  alpine  manager1  Running        Running 24 seconds
    helloworld.5.ba19kca06l18zujfwxyc5lkyn  alpine  worker2   Running        Running 24 seconds
    ```
@y
    NAME                                    IMAGE   NODE      DESIRED STATE  CURRENT STATE
    helloworld.1.8p1vev3fq5zm0mi8g0as41w35  alpine  worker2   Running        Running 7 minutes
    helloworld.2.c7a7tcdq5s0uk3qr88mf8xco6  alpine  worker1   Running        Running 24 seconds
    helloworld.3.6crl09vdcalvtfehfh69ogfb1  alpine  worker1   Running        Running 24 seconds
    helloworld.4.auky6trawmdlcne8ad8phb0f1  alpine  manager1  Running        Running 24 seconds
    helloworld.5.ba19kca06l18zujfwxyc5lkyn  alpine  worker2   Running        Running 24 seconds
    ```
@z

@x
    You can see that swarm has created 4 new tasks to scale to a total of 5
    running instances of Alpine Linux. The tasks are distributed between the
    three nodes of the swarm. One is running on `manager1`.
@y
    この結果から Alpine Linux の実行インスタンスが合計で 5 つのタスクとなるように Swarm が 4 つの新たなタスクを実行したことがわかります。
    このタスクは Swarm 上の 3 つのノード間に分散されています。
    そのうちの 1 つが`manager1`上で実行されています。
@z

@x
4.  Run `docker ps` to see the containers running on the node where you're
    connected. The following example shows the tasks running on `manager1`:
@y
4.  `docker ps`を実行して、接続しているノード上で実行されているコンテナーを確認します。
    以下の例では`manager1`上において実行されているタスクが示されます。
@z

@x
    ```console
    $ docker ps
@y
    ```console
    $ docker ps
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    528d68040f95        alpine:latest       "ping docker.com"   About a minute ago   Up About a minute                       helloworld.4.auky6trawmdlcne8ad8phb0f1
    ```
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    528d68040f95        alpine:latest       "ping docker.com"   About a minute ago   Up About a minute                       helloworld.4.auky6trawmdlcne8ad8phb0f1
    ```
@z

@x
    If you want to see the containers running on other nodes, ssh into
    those nodes and run the `docker ps` command.
@y
    他のノード上で起動しているコンテナーを確認するには、そのノードに SSH によりログインし、`docker ps`コマンドを実行します。
@z

@x
## What's next?
@y
{: #whats-next }
## 次にすることは
@z

@x
At this point in the tutorial, you're finished with the `helloworld` service.
The next step shows how to [delete the service](delete-service.md).
@y
チュートリアルのこの時点までで、`helloworld`サービスによる作業は終了です。
次の手順では [サービスの削除](delete-service.md) について示します。
@z
