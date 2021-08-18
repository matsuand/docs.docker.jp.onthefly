%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Introduction and Overview of Machine
keywords: docker, machine, amazonec2, azure, digitalocean, google, openstack, rackspace, softlayer, virtualbox, vmwarefusion, vmwarevcloudair, vmwarevsphere, exoscale
title: Docker Machine overview
redirect_from:
- /machine/overview/
---
@y
---
description: Introduction and Overview of Machine
keywords: docker, machine, amazonec2, azure, digitalocean, google, openstack, rackspace, softlayer, virtualbox, vmwarefusion, vmwarevcloudair, vmwarevsphere, exoscale
title: Docker Machine 概要
redirect_from:
- /machine/overview/
---
@z

@x
You can use Docker Machine to:
@y
Docker Machine を用いて以下を行います。
@z

@x
* Install and run Docker on Mac or Windows
* Provision and manage multiple remote Docker hosts
* Provision Swarm clusters
@y
* Mac や Windows 上に Docker をインストールして実行します。
* 複数のリモート Docker ホストを導入し管理します。
* Swarm クラスターを導入します。
@z

@x
## What is Docker Machine?
@y
{: #what-is-docker-machine }
## Docker Machine とは何か
@z

@x
Docker Machine is a tool that lets you install Docker Engine on virtual hosts,
and manage the hosts with `docker-machine` commands. You can use Machine to
create Docker hosts on your local Mac or Windows box, on your company network,
in your data center, or on cloud providers like Azure, AWS, or DigitalOcean.
@y
Docker Machine は仮想ホスト上への Docker Engine のインストールを可能にするツールです。
ホストの管理には`docker-machine`コマンドを利用します。
Machine を利用して、ローカルの Mac や Windows マシン上に Docker ホストを生成できます。
さらに企業ネットワーク上やデータセンター、Azure、AWS、DigitalOcean といったクラウドプロバイダー上においても生成可能です。
@z

@x
Using `docker-machine` commands, you can start, inspect, stop, and restart a
managed host, upgrade the Docker client and daemon, and configure a Docker
client to talk to your host.
@y
`docker-machine`コマンドを使って、管理するホストの起動、確認、停止、再起動を行います。
また Docker クライアントやデーモンのアップグレードや、手元のホストにおいて Docker クライアントを利用する設定を行います。
@z

@x
Point the Machine CLI at a running, managed host, and you can run `docker`
commands directly on that host. For example, run `docker-machine env default` to
point to a host called `default`, follow on-screen instructions to complete
`env` setup, and run `docker ps`, `docker run hello-world`, and so forth.
@y
Machine CLI の操作対象として実行中の管理ホストを設定したら、そのホスト上において直接`docker`コマンドを実行します。
たとえば`docker-machine env default`コマンドを実行すると、対象のホストが`default`となります。
画面上に表示される`env`命令を設定して、`docker ps`や`docker run hello-world`などを実行していきます。
@z

@x
Machine _was_ the _only_ way to run Docker on Mac or Windows previous to Docker
v1.12. Starting with the beta program and Docker v1.12,
[Docker Desktop for Mac](../desktop/mac/index.md) and
[Docker Desktop for Windows](../desktop/windows/index.md) are available as native apps and the
better choice for this use case on newer desktops and laptops. We encourage you
to try out these new apps.
@y
Docker Machine は、Docker v1.12 以前は Mac および Windows 上において Docker を実行する唯一の方法**でした**。
Docker v1.12 のベータ版として始まったプログラムが、[Docker Desktop for Mac](../desktop/mac/index.md) と [Docker Desktop for Windows](../desktop/windows/index.md) というネイティブアプリとして利用可能になり、これが最新のデスクトップやノート PC に対しての最適な選択肢となりました。
現在ではこれらの新しいアプリケーションの利用をお勧めしています。
@z

@x
If you aren't sure where to begin, see [Get Started with Docker](../get-started/index.md),
which guides you through a brief end-to-end tutorial on Docker.
@y
どこからはじめたらよいのか不明であれば、[Docker をはじめよう](../get-started/index.md) を確認してください。
このガイドでは Docker の全般的なチュートリアルを示しています。
@z

@x
## Why should I use it?
@y
{: #why-should-i-use-it }
## 利用する理由は
@z

@x
Docker Machine enables you to provision multiple remote Docker hosts on various
flavors of Linux.
@y
Docker Machine を利用すると、さまざまな種類の Linux に対して、リモート Docker ホストを複数プロビジョングできます。
@z

@x
Additionally, Machine allows you to run Docker on older Mac or Windows systems,
as described in the previous topic.
@y
さらに Docker Machine は上で述べているように、Mac や Windows の古いシステムにおいて Docker を起動させることができます。
@z

@x
Docker Machine has these two broad use cases.
@y
Docker Machine は、以下の 2 つの利用がよく行われています。
@z

@x
* **I have an older desktop system and want to run Docker on Mac or Windows**
@y
* **Mac や Windows のデスクトップシステムが古いけど Docker を実行したい**
@z

@x
  ![Docker Machine on Mac and Windows](img/machine-mac-win.png){: .white-bg}
@y
  ![Mac と Windows 上の Docker Machine](img/machine-mac-win.png){: .white-bg}
@z

@x
  If you work primarily on an older Mac or Windows laptop or desktop that doesn't meet the requirements for the new [Docker Desktop for Mac](../desktop/mac/index.md) and [Docker Desktop for Windows](../desktop/windows/index.md) apps, then you need Docker Machine to run Docker Engine locally.
@y
  主に作業をしているマシンが Mac や Windows の古いデスクトップやノート PC であって、[Docker Desktop for Mac](../desktop/mac/index.md) や [Docker Desktop for Windows](../desktop/windows/index.md) という新たなアプリを利用する前提条件を満たしていない場合、Docker Engine をローカルで実行するには Docker Machine が必要になります。
@z

@x
*  **I want to provision Docker hosts on remote systems**
@y
* **リモートシステムに対して Docker ホストをプロビジョニングしたい**
@z

@x
  ![Docker Machine for provisioning multiple systems](img/provision-use-case.png){: .white-bg}
@y
  ![複数システムをプロビジョニングする Docker Machine](img/provision-use-case.png){: .white-bg}
@z

@x
  Docker Engine runs natively on Linux systems. If you have a Linux box as your
  primary system, and want to run `docker` commands, all you need to do is
  download and install Docker Engine. However, if you want an efficient way to
  provision multiple Docker hosts on a network, in the cloud or even locally,
  you need Docker Machine.
@y
  Docker Engine は Linux システム上でネイティブに動作します。
  主に利用するシステムが Linux であって `docker`コマンドを利用したいのであれば、やるべきことは、単に Docker Engine をダウンロードしてインストールするだけです。
  ただしネットワーク上に複数の Docker ホストを効率よくプロビジョニングしたい場合は、クラウド上とローカル上は問わず Docker Machine が必要になります。
@z

@x
  Whether your primary system is Mac, Windows, or Linux, you can install Docker
  Machine on it and use `docker-machine` commands to provision and manage large
  numbers of Docker hosts. It automatically creates hosts, installs Docker
  Engine on them, then configures the `docker` clients. Each managed host
  ("**_machine_**") is the combination of a Docker host and a configured client.
@y
  ふだん利用するシステムが Mac、Windows、Linux のどれであっても、Docker Machine をインストールして`docker-machine`コマンドを使えば、いくらでも Docker ホストのプロビジョニングと管理が可能になります。
  Docker Machine からはホストが自動生成され、そのホスト内に Docker Engine がインストールされます。
  そして`docker`クライアントが設定されます。
  こうして管理される各ホスト（「**マシン**」）が、Docker ホストと設定済みクライアントを結びつけます。
@z

@x
## What's the difference between Docker Engine and Docker Machine?
@y
{: #whats-the-difference-between-docker-engine-and-docker-machine }
## Docker Engine と Docker Machine はどう違うのか
@z

@x
When people say "Docker" they typically mean **Docker Engine**, the
client-server application made up of the Docker daemon, a REST API that
specifies interfaces for interacting with the daemon, and a command line
interface (CLI) client that talks to the daemon (through the REST API wrapper).
Docker Engine accepts `docker` commands from the CLI, such as
`docker run <image>`, `docker ps` to list running containers, `docker image ls`
to list images, and so on.
@y
「Docker」と言えば、普通は **Docker Engine** のことを意味します。
これは Docker デーモンによって構成されるクライアントサーバーアプリケーションであり、デーモンとのやりとりを行うためのインターフェースを規定する REST API であり、デーモンとの対話を（REST API ラッパーを通じて）行うコマンドラインインターフェース（CLI）をすべて意味しています。
Docker Engine は CLI から`docker`コマンド、たとえば`docker run <イメージ名>`を受けつけます。
あるいは`docker ps`によって実行中コンテナーの一覧を表示し、`docker image ls`によってイメージ一覧を表示するといった具合です。
@z

@x
![Docker Engine](img/engine.png)
@y
![Docker Engine](img/engine.png)
@z

@x
**Docker Machine** is a tool for provisioning and managing your Dockerized hosts
(hosts with Docker Engine on them). Typically, you install Docker Machine on
your local system. Docker Machine has its own command line client
`docker-machine` and the Docker Engine client, `docker`. You can use Machine to
install Docker Engine on one or more virtual systems. These virtual systems can
be local (as when you use Machine to install and run Docker Engine in VirtualBox
on Mac or Windows) or remote (as when you use Machine to provision Dockerized
hosts on cloud providers). The Dockerized hosts themselves can be thought of,
and are sometimes referred to as, managed "**_machines_**".
@y
**Docker Machine** とは、Docker 化されたホスト（Docker Engine がインストールされたホスト）をプロビジョニングして管理するツールのことです。
通常はローカルシステムに Docker Machine をインストールして利用します。
Docker Machine には独自のコマンドラインクライアント`docker-machine`と Docker Engine クライアント`docker`があります。
Docker Machine を利用して、必要な分だけ仮想システムに Docker Engine をインストールできます。
この仮想システムはローカル上に実現（Mac や Windows 上の VirtualBox において Docker Engine をインストールし実行）することもでき、リモート上に（Machine を使ってクラウドプロバイダー上に Docker 化したホストをプロビジョニングしたり）することができます。
Docker 化されたこのホストが、管理された「**Machine**」と認識され、そう呼ばれます。
@z

@x
![Docker Machine](img/machine.png){: .white-bg}
@y
![Docker Machine](img/machine.png){: .white-bg}
@z

@x
## Where to go next
@y
{: #where-to-go-next }
## 次に読むものは
@z

@x
- [Install Docker Machine](install-machine.md)
- Create and run a Docker host on your [local system using VirtualBox](get-started.md)
- Provision multiple Docker hosts [on your cloud provider](get-started-cloud.md)
- [Getting started with swarm mode](../engine/swarm/swarm-tutorial/index.md)
- [Understand Machine concepts](concepts.md)
- [Docker Machine driver reference](drivers/index.md)
- [Docker Machine subcommand reference](reference/index.md)
- [Migrate from Boot2Docker to Docker Machine](migrate-to-machine.md)
@y
- [Docker Machine のインストール](install-machine.md)
- [VirtualBox 利用によるローカルシステム](get-started.md) に Docker ホストを生成して実行します。
- [クラウドプロバイダー](get-started-cloud.md) 上に複数の Docker ホストをプロビジョニングします。
- [Docker Machine を使った Docker Swarm クラスターのプロビジョニング](../swarm/provision-with-machine.md) （かつての Swarm）
- [Swarm モードをはじめよう](../engine/swarm/swarm-tutorial/index.md)
- [Machine の考え方](concepts.md)
- [Docker Machine ドライバーリファレンス](drivers/index.md)
- [Docker Machine サブコマンドリファレンス](reference/index.md)
- [Boot2Docker から Docker Machine への移行](migrate-to-machine.md)
@z
