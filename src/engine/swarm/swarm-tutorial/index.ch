%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Getting Started tutorial for Docker Engine swarm mode
keywords: tutorial, cluster management, swarm mode
title: Getting started with swarm mode
toc_max: 4
---
@y
---
description: Getting Started tutorial for Docker Engine swarm mode
keywords: tutorial, cluster management, swarm mode
title: Swarm モードをはじめよう
toc_max: 4
---
@z

@x
This tutorial introduces you to the features of Docker Engine Swarm mode. You
may want to familiarize yourself with the [key concepts](../key-concepts.md)
before you begin.
@y
このチュートリアルは、Docker Engine の Swarm モード機能を説明するものです。
これをはじめる前に [重要な考え方](../key-concepts.md) を読んでおいてください。
@z

@x
The tutorial guides you through the following activities:
@y
このチュートリアルでは、以下のような作業を進めていきます。
@z

@x
* initializing a cluster of Docker Engines in swarm mode
* adding nodes to the swarm
* deploying application services to the swarm
* managing the swarm once you have everything running
@y
* Swarm モード内で Docker Engine のクラスターを初期化します。
* Swarm にノードを追加します。
* Swarm に対してアプリケーションサービスをデプロイします。
* 正常に動作させることができたら Swarm の管理を行います。
@z

@x
This tutorial uses Docker Engine CLI commands entered on the command line of a
terminal window.
@y
このチュートリアルでは、端末画面上のコマンドラインから Docker Engine CLI コマンドを利用します。
@z

@x
If you are brand new to Docker, see [About Docker Engine](../../index.md).
@y
Docker を初めて使う場合は、[Docker Engine について](../../index.md) を参照してください。
@z

@x
## Set up
@y
{: #set-up }
## セットアップ
@z

@x
To run this tutorial, you need the following:
@y
このチュートリアルを実行するには、以下の項目が必要です。
@z

@x
* [three Linux hosts which can communicate over a network, with Docker installed](#three-networked-host-machines)
* [the IP address of the manager machine](#the-ip-address-of-the-manager-machine)
* [open ports between the hosts](#open-protocols-and-ports-between-the-hosts)
@y
* [3 つの Linux ホストに Docker がインストールされ、ネットワーク上で互いに通信可能であること。](#three-networked-host-machines)
* [マネージャーマシンの IP アドレス。](#the-ip-address-of-the-manager-machine)
* [ホスト間でポートが開放されていること。](#open-protocols-and-ports-between-the-hosts)
@z

@x
### Three networked host machines
@y
{: #three-networked-host-machines }
### ネットワーク接続された 3 つのホストマシン
@z

@x
This tutorial requires three Linux hosts which have Docker installed and can
communicate over a network. These can be physical machines, virtual machines,
Amazon EC2 instances, or hosted in some other way. You can even use Docker Machine
from a Linux, Mac, or Windows host. Check out
[Getting started - Swarms](../../../get-started/swarm-deploy.md#prerequisites)
for one possible set-up for the hosts.
@y
このチュートリアルでは、Docker がインストールされ、互いにネットワーク通信が可能である 3 つの Linux ホストを用います。
このホストは物理マシン、仮想マシン、Amazon EC2 インスタンス、その他のホストのいずれでもかまいません。
Docker Machine を利用するのであれば、Linux、Mac、Windows のいずれをホストすることもできます。
[Swarm をはじめよう](../../../get-started/swarm-deploy.md#prerequisites) を確認し、ホストとして設定可能なものを選んでください。
@z

@x
One of these machines is a manager (called `manager1`) and two of them are
workers (`worker1` and `worker2`).
@y
このマシンのうちの 1 つをマネージャー（`manager1`）とし、残りの 2 つをワーカー（`worker1`と`worker2`）とします。
@z

@x
>**Note**: You can follow many of the tutorial steps to test single-node swarm
as well, in which case you need only one host. Multi-node commands do not
work, but you can initialize a swarm, create services, and scale them.
@y
>**メモ**
>
> このチュートリアルに示す手順の多くは、単一ノードの Swarm を確認する際にも用いることができます。
> その場合は、ホストはただ 1 つあれば十分です。
> 複数ノード用コマンドは動作しませんが、Swarm の初期化、サービス生成、スケール変更は行うことができます。
@z

@x
#### Install Docker Engine on Linux machines
@y
{: #install-docker-engine-on-linux-machines }
#### Linux マシンへの Docker Engine インストール
@z

@x
If you are using Linux based physical computers or cloud-provided computers as
hosts, simply follow the [Linux install instructions](../../install/index.md)
for your platform. Spin up the three machines, and you are ready. You can test both
single-node and multi-node swarm scenarios on Linux machines.
@y
ホストとして利用するものが Linux ベースの物理コンピューターやクラウドコンピューターである場合は、各プラットフォームに合わせて単純に [Linux インストール手順](../../install/index.md) に従います。
3 つのマシンを設定したら準備が整いました。
Linux マシン上では単一ノード、複数ノードのいずれのシナリオでも作業していくことができます。
@z

@x
#### Use Docker Desktop for Mac or Docker Desktop for Windows
@y
{: #use-docker-desktop-for-mac-or-docker-desktop-for-windows }
#### Docker Desktop for Mac または Docker Desktop for Windows の利用
@z

@x
Alternatively, install the latest [Docker Desktop for Mac](../../../desktop/mac/index.md) or
[Docker Desktop for Windows](../../../desktop/windows/index.md) application on one
computer. You can test both single-node and multi-node swarm from this computer,
but you need to use Docker Machine to test the multi-node scenarios.
@y
別の方法として、手元のコンピューターに最新の [Docker Desktop for Mac](../../../desktop/mac/index.md) または [Docker Desktop for Windows](../../../desktop/windows/index.md) をインストールして利用することもできます。
このコンピューターからは、単一ノード、複数ノードのいずれの Swarm でもテストすることができます。
ただし複数ノードの例をテストするためには Docker Machine が必要です。
@z

@x
* You can use Docker Desktop for Mac or Windows to test _single-node_ features
  of swarm mode, including initializing a swarm with a single node, creating
  services, and scaling services.
@y
* Docker Desktop for Mac や Docker Desktop for Windows は、Swarm モードにおける **単一ノード** の確認や、単一ノードからなる Swarm の初期化、サービス生成、サービスのスケーリングを行うことができます。
@z

@x
* Currently, you cannot use Docker Desktop for Mac or Docker Desktop for Windows
  alone to test a _multi-node_ swarm, but many examples are applicable to a
  single-node Swarm setup.
@y
* 現時点において Docker Desktop for Mac または Docker Desktop for Windows を単独で利用するだけでは、**複数ノード** Swarm を扱うことはできません。
  ただし単独ノードの Swarm 設定に対して、数多くの利用例を参考にすることはできます。
@z

@x
### The IP address of the manager machine
@y
{: #the-ip-address-of-the-manager-machine }
### マネージャーマシンの IP アドレス
@z

@x
The IP address must be assigned to a network interface available to the host
operating system. All nodes in the swarm need to connect to the manager at
the IP address.
@y
ホストオペレーティングシステムが利用するネットワークインターフェースに対しては、IP アドレスを割り振る必要があります。
Swarm 上のノードはすべて、マネージャーに対して IP アドレスにより接続します。
@z

@x
Because other nodes contact the manager node on its IP address, you should use a
fixed IP address.
@y
他のノードからもマネージャーノードの IP アドレスを通じて接続するため、IP アドレスは固定しておく必要があります。
@z

@x
You can run `ifconfig` on Linux or macOS to see a list of the
available network interfaces.
@y
Linux や macOS では`ifconfig`を実行すれば、利用可能なネットワークインターフェースの一覧を確認できます。
@z

@x
If you are using Docker Machine, you can get the manager IP with either
`docker-machine ls` or `docker-machine ip <MACHINE-NAME>` &#8212; for example,
`docker-machine ip manager1`.
@y
Docker Machine を利用している場合は、`docker-machine ls`または`docker-machine ip <マシン名>`（たとえば `docker-machine ip manager1`） によってマネージャーの IP アドレスを確認することができます。
@z

@x
The tutorial uses `manager1` : `192.168.99.100`.
@y
このチュートリアルでは`manager1`が`192.168.99.100`であるものとします。
@z

@x
### Open protocols and ports between the hosts
@y
{: #open-protocols-and-ports-between-the-hosts }
### ホスト間でのプロトコルとポートの開放
@z

@x
The following ports must be available. On some systems, these ports are open by default.
@y
以下のポートの利用が必要です。
システムの中には、デフォルトでこれらのポートはすでに開放されているものがあります。
@z

@x
* **TCP port 2377** for cluster management communications
* **TCP** and **UDP port 7946** for communication among nodes
* **UDP port 4789** for overlay network traffic
@y
* **TCP ポートの 2377**、クラスター管理における通信のため
* **TCP** および **UDP ポートの 7946**、ノード間の通信のため
* **UDP ポートの 4789**、オーバーレイネットワークのトラフィックのため
@z

@x
If you plan on creating an overlay network with encryption (`--opt encrypted`),
you also need to ensure **ip protocol 50** (**ESP**) traffic is allowed.
@y
オーバーレイネットワークを暗号化（`--opt encrypted`）込みで生成する場合は、**ip protocol 50** (**ESP**) を許可しておく必要があります。
@z

@x
## What's next?
@y
{: #whats-next }
## 次にすることは
@z

@x
After you have set up your environment, you are ready to [create a swarm](create-swarm.md).
@y
環境を整えたら、次に [Swarm の生成](create-swarm.md) を行います。
@z
