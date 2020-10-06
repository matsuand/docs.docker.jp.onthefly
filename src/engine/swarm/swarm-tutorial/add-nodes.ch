%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Add nodes to the swarm
keywords: tutorial, cluster management, swarm
title: Add nodes to the swarm
notoc: true
---
@y
---
description: Add nodes to the swarm
keywords: tutorial, cluster management, swarm
title: Swarm へのノード追加
notoc: true
---
@z

@x
Once you've [created a swarm](create-swarm.md) with a manager node, you're ready
to add worker nodes.
@y
{% comment %}
Once you've [created a swarm](create-swarm.md) with a manager node, you're ready
to add worker nodes.
{% endcomment %}
マネージャーノードにおいて [Swarm の生成](create-swarm.md) を行ったら、次はワーカーノードの追加です。
@z

@x
1.  Open a terminal and ssh into the machine where you want to run a worker node.
    This tutorial uses the name `worker1`.
@y
{% comment %}
1.  Open a terminal and ssh into the machine where you want to run a worker node.
    This tutorial uses the name `worker1`.
{% endcomment %}
1.  ターミナル画面を開き、ワーカーノードを起動させたいマシンに SSH 接続します。
    このチュートリアルでは `worker1` というマシン名にします。
@z

@x
2.  Run the command produced by the `docker swarm init` output from the
    [Create a swarm](create-swarm.md) tutorial step to create a worker node
    joined to the existing swarm:
@y
{% comment %}
2.  Run the command produced by the `docker swarm init` output from the
    [Create a swarm](create-swarm.md) tutorial step to create a worker node
    joined to the existing swarm:
{% endcomment %}
2.  [Swarm の生成](create-swarm.md) において `docker swarm init` を実行した際に出力されたコマンドを実行します。
    これにより、すでに生成済の Swarm に参加するワーカーノードを生成します。
@z

@x
    ```bash
    $ docker swarm join \
      --token  SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
      192.168.99.100:2377
@y
    ```bash
    $ docker swarm join \
      --token  SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
      192.168.99.100:2377
@z

@x
    This node joined a swarm as a worker.
    ```
@y
    This node joined a swarm as a worker.
    ```
@z

@x
    If you don't have the command available, you can run the following command
    on a manager node to retrieve the join command for a worker:
@y
    {% comment %}
    If you don't have the command available, you can run the following command
    on a manager node to retrieve the join command for a worker:
    {% endcomment %}
    上のコマンドが実行できない場合は、マネージャーノード上で以下のコマンドを実行して、ワーカーノードを参加させるためのコマンドを確認してください。
@z

@x
    ```bash
    $ docker swarm join-token worker
@y
    ```bash
    $ docker swarm join-token worker
@z

@x
    To add a worker to this swarm, run the following command:
@y
    To add a worker to this swarm, run the following command:
@z

@x
        docker swarm join \
        --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
        192.168.99.100:2377
    ```
@y
        docker swarm join \
        --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
        192.168.99.100:2377
    ```
@z

@x
3.  Open a terminal and ssh into the machine where you want to run a second
    worker node. This tutorial uses the name `worker2`.
@y
{% comment %}
3.  Open a terminal and ssh into the machine where you want to run a second
    worker node. This tutorial uses the name `worker2`.
{% endcomment %}
3.  ターミナル画面を開き、2 つめのワーカーノードを起動させたいマシンに SSH 接続します。
    このチュートリアルでは `worker2` というマシン名にします。
@z

@x
4.  Run the command produced by the `docker swarm init` output from the
    [Create a swarm](create-swarm.md) tutorial step to create a second worker
    node joined to the existing swarm:
@y
{% comment %}
4.  Run the command produced by the `docker swarm init` output from the
    [Create a swarm](create-swarm.md) tutorial step to create a second worker
    node joined to the existing swarm:
{% endcomment %}
4.  [Swarm の生成](create-swarm.md) において `docker swarm init` を実行した際に出力されたコマンドを実行します。
    これにより、すでに生成済の Swarm に参加する 2 つめのワーカーノードを生成します。
@z

@x
    ```bash
    $ docker swarm join \
      --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
      192.168.99.100:2377
@y
    ```bash
    $ docker swarm join \
      --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
      192.168.99.100:2377
@z

@x
    This node joined a swarm as a worker.
    ```
@y
    This node joined a swarm as a worker.
    ```
@z

@x
5.  Open a terminal and ssh into the machine where the manager node runs and
    run the `docker node ls` command to see the worker nodes:
@y
{% comment %}
5.  Open a terminal and ssh into the machine where the manager node runs and
    run the `docker node ls` command to see the worker nodes:
{% endcomment %}
5.  ターミナル画面を開き、マネージャーノードが起動しているマシンに SSH 接続します。
    そして `docker node ls` コマンドを実行して、ワーカーノードを確認します。
@z

@x
    ```bash
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    03g1y59jwfg7cf99w4lt0f662    worker2   Ready   Active
    9j68exjopxe7wfl6yuxml7a7j    worker1   Ready   Active
    dxn1zf6l61qsb1josjja83ngz *  manager1  Ready   Active        Leader
    ```
@y
    ```bash
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    03g1y59jwfg7cf99w4lt0f662    worker2   Ready   Active
    9j68exjopxe7wfl6yuxml7a7j    worker1   Ready   Active
    dxn1zf6l61qsb1josjja83ngz *  manager1  Ready   Active        Leader
    ```
@z

@x
    The `MANAGER` column identifies the manager nodes in the swarm. The empty
    status in this column for `worker1` and `worker2` identifies them as worker nodes.
@y
    {% comment %}
    The `MANAGER` column identifies the manager nodes in the swarm. The empty
    status in this column for `worker1` and `worker2` identifies them as worker nodes.
    {% endcomment %}
    `MANAGER` カラムは、Swarm 内のマネージャーノードがどれであるかを示しています。
    このカラムが `worker1` と `worker2` では空になっています。
    つまりこれらはワーカーノードであることがわかります。
@z

@x
    Swarm management commands like `docker node ls` only work on manager nodes.
@y
    {% comment %}
    Swarm management commands like `docker node ls` only work on manager nodes.
    {% endcomment %}
    `docker node ls` のような Swarm 管理コマンドは、マネージャーノード上でのみ実行可能です。
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
Now your swarm consists of a manager and two worker nodes. In the next step of
the tutorial, you [deploy a service](deploy-service.md) to the swarm.
@y
{% comment %}
Now your swarm consists of a manager and two worker nodes. In the next step of
the tutorial, you [deploy a service](deploy-service.md) to the swarm.
{% endcomment %}
ここまでに Swarm は、1 つのマネージャーと 2 つのワーカーノードにより構成されることになりました。
本チュートリアルの次のステップでは、Swarm に対して [サービスのデプロイ](deploy-service.md) を行います。
@z
