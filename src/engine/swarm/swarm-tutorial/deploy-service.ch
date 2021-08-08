%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Deploy a service to the swarm
keywords: tutorial, cluster management, swarm mode
title: Deploy a service to the swarm
notoc: true
---
@y
---
description: Deploy a service to the swarm
keywords: tutorial, cluster management, swarm mode
title: Swarm へのサービスデプロイ
notoc: true
---
@z

@x
After you [create a swarm](create-swarm.md), you can deploy a service to the
swarm. For this tutorial, you also [added worker nodes](add-nodes.md), but that
is not a requirement to deploy a service.
@y
[Swarm の生成](create-swarm.md) を行ったら, その Swarm に対してサービスをデプロイすることができます。
このチュートリアルでは [ワーカーノードの追加](add-nodes.md) も行っていますが、サービスのデプロイを行うにあたっては必要となるものではありません。
@z

@x
1.  Open a terminal and ssh into the machine where you run your manager node.
    For example, the tutorial uses a machine named `manager1`.
@y
1.  ターミナル画面を開き、マネージャーノードが起動しているマシンに SSH 接続します。
    このチュートリアルでは`worker1`というマシン名とします。
@z

@x
2.  Run the following command:
@y
2.  以下のコマンドを実行します。
@z

@x
    ```console
    $ docker service create --replicas 1 --name helloworld alpine ping docker.com
@y
    ```console
    $ docker service create --replicas 1 --name helloworld alpine ping docker.com
@z

@x
    9uk4639qpg7npwf3fn2aasksr
    ```
@y
    9uk4639qpg7npwf3fn2aasksr
    ```
@z

@x
    * The `docker service create` command creates the service.
    * The `--name` flag names the service `helloworld`.
    * The `--replicas` flag specifies the desired state of 1 running instance.
    * The arguments `alpine ping docker.com` define the service as an Alpine
    Linux container that executes the command `ping docker.com`.
@y
    * `docker service create`コマンドによりサービスを生成します。
    * `--name`フラグにより、サービス名を`helloworld`とします。
    * `--replicas`フラグは、起動インスタンス数を 1 に定義します。
    * `alpine ping docker.com`という引数は、Alpine Linux コンテナーがコマンド`ping docker.com`を実行するサービスを定義します。
@z

@x
3.  Run `docker service ls` to see the list of running services:
@y
3.  `docker service ls`を実行して、起動しているサービスの一覧を確認します。
@z

@x
    ```console
    $ docker service ls
@y
    ```console
    $ docker service ls
@z

@x
    ID            NAME        SCALE  IMAGE   COMMAND
    9uk4639qpg7n  helloworld  1/1    alpine  ping docker.com
    ```
@y
    ID            NAME        SCALE  IMAGE   COMMAND
    9uk4639qpg7n  helloworld  1/1    alpine  ping docker.com
    ```
@z

@x
## What's next?
@y
{: #whats-next }
## 次にすることは
@z

@x
Now you've deployed a service to the swarm, you're ready to [inspect the service](inspect-service.md).
@y
サービスを Swarm に対してデプロイできたので、[サービスの確認](inspect-service.md) を行います。
@z
