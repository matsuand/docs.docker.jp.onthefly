%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker explained in depth
keywords: docker, introduction, documentation, about, technology, understanding
redirect_from:
- /introduction/understanding-docker/
- /engine/userguide/basics/
- /engine/introduction/understanding-docker/
- /engine/understanding-docker/
- /engine/docker-overview/
title: Docker overview
---
@y
---
description: Docker explained in depth
keywords: docker, introduction, documentation, about, technology, understanding
redirect_from:
- /introduction/understanding-docker/
- /engine/userguide/basics/
- /engine/introduction/understanding-docker/
- /engine/understanding-docker/
- /engine/docker-overview/
title: Docker 概要
---
@z

@x
Docker is an open platform for developing, shipping, and running applications.
Docker enables you to separate your applications from your infrastructure so
you can deliver software quickly. With Docker, you can manage your infrastructure
in the same ways you manage your applications. By taking advantage of Docker's
methodologies for shipping, testing, and deploying code quickly, you can
significantly reduce the delay between writing code and running it in production.
@y
{% comment %}
Docker is an open platform for developing, shipping, and running applications.
Docker enables you to separate your applications from your infrastructure so
you can deliver software quickly. With Docker, you can manage your infrastructure
in the same ways you manage your applications. By taking advantage of Docker's
methodologies for shipping, testing, and deploying code quickly, you can
significantly reduce the delay between writing code and running it in production.
{% endcomment %}
Docker はアプリケーションの開発、導入、実行を行うためのオープンなプラットフォームです。
Docker を使えば、アプリケーションをインフラストラクチャーから切り離すことができるため、ソフトウエアをすばやく提供することができます。
Docker であれば、アプリケーションを管理する手法をそのまま、インフラストラクチャーの管理にも適用できます。
Docker が採用する方法を最大限利用して、アプリケーションの導入、テスト、コードデプロイをすばやく行うことは、つまりコーディングと実稼動の合間を大きく削減できることを意味します。
@z

@x
## The Docker platform
@y
{% comment %}
## The Docker platform
{% endcomment %}
## Docker プラットフォーム
{: #the-docker-platform }
@z

@x
Docker provides the ability to package and run an application in a loosely isolated
environment called a container. The isolation and security allow you to run many
containers simultaneously on a given host. Containers are lightweight because
they don't need the extra load of a hypervisor, but run directly within the host
machine's kernel. This means you can run more containers on a given hardware
combination than if you were using virtual machines. You can even run Docker
containers within host machines that are actually virtual machines!
@y
{% comment %}
Docker provides the ability to package and run an application in a loosely isolated
environment called a container. The isolation and security allow you to run many
containers simultaneously on a given host. Containers are lightweight because
they don't need the extra load of a hypervisor, but run directly within the host
machine's kernel. This means you can run more containers on a given hardware
combination than if you were using virtual machines. You can even run Docker
containers within host machines that are actually virtual machines!
{% endcomment %}
Docker はアプリケーションをパッケージ化して実行するために、ほぼ分離された環境となるコンテナーというものを提供します。
隔離してセキュリティを保つことから、実行するホスト上に複数のコンテナーを同時に実行することができます。
コンテナーは非常に軽量なものとなります。
なぜならハイパーバイザーを別途ロードする必要などなく、ホストマシンのカーネルを使って動作するからです。
このことは手元にあるハードウェアの中から、必要なものを使ってより多くのコンテナーが実行できることを意味します。
それは仮想マシンを使う以上のことです。
さらに Docker コンテナーを動作させるホストマシンは、それ自体が仮想マシンであっても構わないのです。
@z

@x
Docker provides tooling and a platform to manage the lifecycle of your containers:
@y
{% comment %}
Docker provides tooling and a platform to manage the lifecycle of your containers:
{% endcomment %}
Docker が提供するのは、コンテナーのライフサイクルを管理するツールとプラットフォームです。
@z

@x
* Develop your application and its supporting components using containers.
* The container becomes the unit for distributing and testing your application.
* When you're ready, deploy your application into your production environment,
  as a container or an orchestrated service. This works the same whether your
  production environment is a local data center, a cloud provider, or a hybrid
  of the two.
@y
{% comment %}
* Develop your application and its supporting components using containers.
* The container becomes the unit for distributing and testing your application.
* When you're ready, deploy your application into your production environment,
  as a container or an orchestrated service. This works the same whether your
  production environment is a local data center, a cloud provider, or a hybrid
  of the two.
{% endcomment %}
* コンテナーを利用して、アプリケーションとそれをサポートするコンポーネントを開発します。
* コンテナーは、アプリケーションの配布とテストを行う１つの単位となります。
* 準備ができたら本番環境に向けてアプリケーションをデプロイします。デプロイの単位は、１つのコンテナーか、あるいはオーケストレーションされた（orchestrated）１つのサービスです。その本番環境があたかも手元のデータセンター上であったり、クラウドプロバイダー上であったりするのと同様に動作します。
@z

@x
## Docker Engine
@y
## Docker Engine
@z

@x
_Docker Engine_ is a client-server application with these major components:
@y
{% comment %}
_Docker Engine_ is a client-server application with these major components:
{% endcomment %}
Docker Engine は、主に以下の 3 つのコンポーネントからなるクライアントサーバー型アプリケーションです。
@z

@x
* A server which is a type of long-running program called a daemon process (the
  `dockerd` command).
@y
{% comment %}
* A server which is a type of long-running program called a daemon process (the
  `dockerd` command).
{% endcomment %}
* サーバー。長時間稼動する種類のプログラムでありデーモンプロセスと呼ばれる（ `dockerd` コマンド）。
@z

@x
* A REST API which specifies interfaces that programs can use to talk to the
  daemon and instruct it what to do.
@y
{% comment %}
* A REST API which specifies interfaces that programs can use to talk to the
  daemon and instruct it what to do.
{% endcomment %}
* REST API。プログラムとデーモンとの間での通信方法を定義し、何をなすべきかを指示する。
@z

@x
* A command line interface (CLI) client (the `docker` command).
@y
{% comment %}
* A command line interface (CLI) client (the `docker` command).
{% endcomment %}
* コマンドラインインターフェース（command line interface; CLI）クライアント（ `docker` コマンド）。
@z

@x
![Docker Engine Components Flow](/engine/images/engine-components-flow.png)
@y
{% comment %}
![Docker Engine Components Flow](/engine/images/engine-components-flow.png)
{% endcomment %}
![Docker Engine コンポーネントの関連]({{ site.baseurl }}/engine/images/engine-components-flow.png)
@z

@x
The CLI uses the Docker REST API to control or interact with the Docker daemon
through scripting or direct CLI commands. Many other Docker applications use the
underlying API and CLI.
@y
{% comment %}
The CLI uses the Docker REST API to control or interact with the Docker daemon
through scripting or direct CLI commands. Many other Docker applications use the
underlying API and CLI.
{% endcomment %}
CLI は Docker REST API を通じて、スクリプトや直接のコマンド実行により Docker デーモンを制御したり入出力を行ったりします。
Docker アプリケーションの多くが、基本的なところで API や CLI を利用しています。
@z

@x
The daemon creates and manages Docker _objects_, such as images, containers,
networks, and volumes.
@y
{% comment %}
The daemon creates and manages Docker _objects_, such as images, containers,
networks, and volumes.
{% endcomment %}
Docker オブジェクトとは、イメージ、コンテナー、ネットワーク、データボリュームなどです。
@z

@x
> **Note**: Docker is licensed under the open source Apache 2.0 license.
@y
{% comment %}
> **Note**: Docker is licensed under the open source Apache 2.0 license.
{% endcomment %}
> **メモ**: Docker は、オープンソース Apache 2.0 ライセンスのもとで提供されています。
@z

@x
For more details, see [Docker Architecture](#docker-architecture) below.
@y
{% comment %}
For more details, see [Docker Architecture](#docker-architecture) below.
{% endcomment %}
詳細については、以下の [Docker アーキテクチャー](#docker-architecture) を参照してください。
@z

@x
## What can I use Docker for?
@y
{% comment %}
## What can I use Docker for?
{% endcomment %}
## 何のために Docker を使うのか？
{: #what-can-i-use-docker-for }
@z

@x
**Fast, consistent delivery of your applications**
@y
{% comment %}
**Fast, consistent delivery of your applications**
{% endcomment %}
**アプリケーションの配信をすばやく一貫性を保って**
@z

@x
Docker streamlines the development lifecycle by allowing developers to work in
standardized environments using local containers which provide your applications
and services. Containers are great for continuous integration and continuous
delivery (CI/CD) workflows.
@y
{% comment %}
Docker streamlines the development lifecycle by allowing developers to work in
standardized environments using local containers which provide your applications
and services. Containers are great for continuous integration and continuous
delivery (CI/CD) workflows.
{% endcomment %}
Docker は開発のライフサイクルを効率化します。
開発するアプリケーションやサービスがローカルなコンテナー内に実現でき、開発者は標準化された環境により作業が進められるからです。
コンテナーを使った開発は、継続的インテグレーション (continuous integration; CI) や継続的開発 (continuous development; CD) のワークフローに適しています。
@z

@x
Consider the following example scenario:
@y
{% comment %}
Consider the following example scenario:
{% endcomment %}
以下のようなシナリオ例を考えてみてください。
@z

@x
- Your developers write code locally and share their work with their colleagues
  using Docker containers.
- They use Docker to push their applications into a test environment and execute
  automated and manual tests.
- When developers find bugs, they can fix them in the development environment
  and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as
  pushing the updated image to the production environment.
@y
{% comment %}
- Your developers write code locally and share their work with their colleagues
  using Docker containers.
- They use Docker to push their applications into a test environment and execute
  automated and manual tests.
- When developers find bugs, they can fix them in the development environment
  and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as
  pushing the updated image to the production environment.
{% endcomment %}
- 開発者がローカルでコードを書き、仲間とその作業を共有するために Docker コンテナーを使います。
- Docker によりアプリケーションをテスト環境に投入し、自動および手動のテストを実行します。
- 開発者がバグを発見したら、開発環境においてこれを修正して、アプリケーションをテスト環境に再デプロイし、テスト確認を行ないます。
- テストが完了します。この後にユーザーが修正版を利用できるようにすることは、更新済イメージを本番環境へ投入することと同じく容易なことです。
@z

@x
**Responsive deployment and scaling**
@y
{% comment %}
**Responsive deployment and scaling**
{% endcomment %}
**迅速なデプロイとスケーリング**
@z

@x
Docker's container-based platform allows for highly portable workloads. Docker
containers can run on a developer's local laptop, on physical or virtual
machines in a data center, on cloud providers, or in a mixture of environments.
@y
{% comment %}
Docker's container-based platform allows for highly portable workloads. Docker
containers can run on a developer's local laptop, on physical or virtual
machines in a data center, on cloud providers, or in a mixture of environments.
{% endcomment %}
Docker によるコンテナーベースのプラットフォームは、処理負荷の高度な分散を考慮しています。
Docker コンテナーは、開発者のノートパソコン上で実行できるだけでなく、データセンターの物理マシンや仮想マシン、クラウドプロバイダー、そしてさまざまな環境の組み合わせにおいて実行可能です。
@z

@x
Docker's portability and lightweight nature also make it easy to dynamically
manage workloads, scaling up or tearing down applications and services as
business needs dictate, in near real time.
@y
{% comment %}
Docker's portability and lightweight nature also make it easy to dynamically
manage workloads, scaling up or tearing down applications and services as
business needs dictate, in near real time.
{% endcomment %}
Docker の可搬性と軽量な特性は、以下のようなことを容易に実現します。
それは処理負荷を動的に管理できること、ビジネスシーンでの要求に応じてアプリケーションのスケールアップや提供終了を簡単に、しかもほぼリアルタイムで行うことができます。
@z

@x
**Running more workloads on the same hardware**
@y
{% comment %}
**Running more workloads on the same hardware**
{% endcomment %}
**同一ハードウェア上にて負荷の高い処理を実行**
@z

@x
Docker is lightweight and fast. It provides a viable, cost-effective alternative
to hypervisor-based virtual machines, so you can use more of your compute
capacity to achieve your business goals. Docker is perfect for high density
environments and for small and medium deployments where you need to do more with
fewer resources.
@y
{% comment %}
Docker is lightweight and fast. It provides a viable, cost-effective alternative
to hypervisor-based virtual machines, so you can use more of your compute
capacity to achieve your business goals. Docker is perfect for high density
environments and for small and medium deployments where you need to do more with
fewer resources.
{% endcomment %}
Docker は軽量かつ高速です。
ハイパーバイザーベースの仮想マシンに取って変わる、実用的で費用対効果の高いものです。
したがってコンピューター性能をフルに活用してビジネス目標を達成できます。
Docker は高度に処理集中する環境に適しており、さらには中小規模の、より少ないリソースの中でのシステム構築にも適しています。
@z

@x
## Docker architecture
@y
{% comment %}
## Docker architecture
{% endcomment %}
## Docker アーキテクチャー
{: #docker-architecture }
@z

@x
Docker uses a client-server architecture. The Docker *client* talks to the
Docker *daemon*, which does the heavy lifting of building, running, and
distributing your Docker containers. The Docker client and daemon *can*
run on the same system, or you can connect a Docker client to a remote Docker
daemon. The Docker client and daemon communicate using a REST API, over UNIX
sockets or a network interface.
@y
{% comment %}
Docker uses a client-server architecture. The Docker *client* talks to the
Docker *daemon*, which does the heavy lifting of building, running, and
distributing your Docker containers. The Docker client and daemon *can*
run on the same system, or you can connect a Docker client to a remote Docker
daemon. The Docker client and daemon communicate using a REST API, over UNIX
sockets or a network interface.
{% endcomment %}
Docker はクライアントサーバー型のアーキテクチャーを採用しています。
Docker *クライアント* は Docker デーモンに処理を依頼します。
このデーモンは、Docker コンテナーの構築、実行、配布という複雑な仕事をこなします。
Docker クライアントとデーモンは同一システム上で動かすことも *可能* ですが、別のシステム上であっても、Docker クライアントからリモートにある Docker デーモンへのアクセスが可能です。
Docker クライアントとデーモンの間の通信には REST API が利用され、UNIX ソケットまたはネットワークインターフェイスを介して行われます。
@z

@x
![Docker Architecture Diagram](/engine/images/architecture.svg)
@y
{% comment %}
![Docker Architecture Diagram](/engine/images/architecture.svg)
{% endcomment %}
![Docker アーキテクチャー構成図]({{ site.baseurl }}/engine/images/architecture.svg)
@z

@x
### The Docker daemon
@y
{% comment %}
### The Docker daemon
{% endcomment %}
### Docker デーモン
{: #the-docker-daemon }
@z

@x
The Docker daemon (`dockerd`) listens for Docker API requests and manages Docker
objects such as images, containers, networks, and volumes. A daemon can also
communicate with other daemons to manage Docker services.
@y
{% comment %}
The Docker daemon (`dockerd`) listens for Docker API requests and manages Docker
objects such as images, containers, networks, and volumes. A daemon can also
communicate with other daemons to manage Docker services.
{% endcomment %}
Docker デーモン（`dockerd`）は Docker API リクエストを受け付け、イメージ、コンテナー、ネットワーク、ボリュームといった Docker オブジェクトを管理します。
また Docker サービスを管理するため、他のデーモンとも通信を行います。
@z

@x
### The Docker client
@y
{% comment %}
### The Docker client
{% endcomment %}
### Docker クライアント
{: #the-docker-client }
@z

@x
The Docker client (`docker`) is the primary way that many Docker users interact
with Docker. When you use commands such as `docker run`, the client sends these
commands to `dockerd`, which carries them out. The `docker` command uses the
Docker API. The Docker client can communicate with more than one daemon.
@y
{% comment %}
The Docker client (`docker`) is the primary way that many Docker users interact
with Docker. When you use commands such as `docker run`, the client sends these
commands to `dockerd`, which carries them out. The `docker` command uses the
Docker API. The Docker client can communicate with more than one daemon.
{% endcomment %}
Docker クライアント（`docker`）は Docker とのやりとりを行うために、たいていのユーザーが利用するものです。
``docker run`` のようなコマンドが実行されると、Docker クライアントは ``dockerd`` にそのコマンドを伝えます。
そして `dockerd` はその内容を実現します。
`docker` コマンドは Docker API を利用しています。
Docker クライアントは複数のデーモンと通信することができます。
@z

@x
### Docker registries
@y
{% comment %}
### Docker registries
{% endcomment %}
### Docker レジストリ
{: #docker-registries }
@z

@x
A Docker _registry_ stores Docker images. Docker Hub is a public
registry that anyone can use, and Docker is configured to look for images on
Docker Hub by default. You can even run your own private registry.
@y
{% comment %}
A Docker _registry_ stores Docker images. Docker Hub is a public
registry that anyone can use, and Docker is configured to look for images on
Docker Hub by default. You can even run your own private registry.
{% endcomment %}
Docker レジストリは Docker イメージを保管します。
Docker Hub と Docker Cloud は公開レジストリであり、誰でも利用可能です。
また  Docker はデフォルトで Docker Hub のイメージを探すよう設定されています。
独自にプライベートレジストリを運用することもできます。
@z

@x
When you use the `docker pull` or `docker run` commands, the required images are
pulled from your configured registry. When you use the `docker push` command,
your image is pushed to your configured registry.
@y
{% comment %}
When you use the `docker pull` or `docker run` commands, the required images are
pulled from your configured registry. When you use the `docker push` command,
your image is pushed to your configured registry.
{% endcomment %}
`docker pull` や `docker run` コマンドを使うと、設定されたレジストリから必要なイメージを取得します。
`docker push` コマンドを使えば、イメージを指定したレジストリに送信します。
@z

@x
### Docker objects
@y
{% comment %}
### Docker objects
{% endcomment %}
### Docker オブジェクト
{: #docker-objects }
@z

@x
When you use Docker, you are creating and using images, containers, networks,
volumes, plugins, and other objects. This section is a brief overview of some
of those objects.
@y
{% comment %}
When you use Docker, you are creating and using images, containers, networks,
volumes, plugins, and other objects. This section is a brief overview of some
of those objects.
{% endcomment %}
Docker の利用時は、イメージ、コンテナー、ネットワーク、ボリューム、プラグイン、その他のオブジェクトを作成、利用します。
このセクションは各オブジェクトの概要を説明します。
@z

@x
#### Images
@y
{% comment %}
#### Images
{% endcomment %}
#### イメージ
{: #images }
@z

@x
An _image_ is a read-only template with instructions for creating a Docker
container. Often, an image is _based on_ another image, with some additional
customization. For example, you may build an image which is based on the `ubuntu`
image, but installs the Apache web server and your application, as well as the
configuration details needed to make your application run.
@y
{% comment %}
An _image_ is a read-only template with instructions for creating a Docker
container. Often, an image is _based on_ another image, with some additional
customization. For example, you may build an image which is based on the `ubuntu`
image, but installs the Apache web server and your application, as well as the
configuration details needed to make your application run.
{% endcomment %}
イメージとは、Docker コンテナーを作成する命令が入った読み込み専用のテンプレートです。
通常イメージは、他のイメージをベースにしてそれをカスタマイズして利用します。
たとえば `ubuntu` イメージをベースとするイメージを作ったとします。
そこには Apache ウェブサーバーや自開発したアプリケーションといったものをインストールするかもしれません。
さらにアプリケーション実行に必要となる詳細な設定も加えることにもなるでしょう。
@z

@x
You might create your own images or you might only use those created by others
and published in a registry. To build your own image, you create a _Dockerfile_
with a simple syntax for defining the steps needed to create the image and run
it. Each instruction in a Dockerfile creates a layer in the image. When you
change the Dockerfile and rebuild the image, only those layers which have
changed are rebuilt. This is part of what makes images so lightweight, small,
and fast, when compared to other virtualization technologies.
@y
{% comment %}
You might create your own images or you might only use those created by others
and published in a registry. To build your own image, you create a _Dockerfile_
with a simple syntax for defining the steps needed to create the image and run
it. Each instruction in a Dockerfile creates a layer in the image. When you
change the Dockerfile and rebuild the image, only those layers which have
changed are rebuilt. This is part of what makes images so lightweight, small,
and fast, when compared to other virtualization technologies.
{% endcomment %}
イメージは作ろうと思えば作ることができ、他の方が作ってレジストリに公開されているイメージを使うということもできます。
イメージを自分で作る場合は Dockerfile というファイルを生成します。
このファイルの文法は単純なものであり、そこにはイメージを生成して実行するまでの手順が定義されます。
Dockerfile 内の個々の命令ごとに、イメージ内にはレイヤーというものが生成されます。
Dockerfile の内容を書き換えたことでイメージが再構築されるときには、変更がかかったレイヤーのみが再生成されます。
他の仮想化技術に比べて Dockerイメージというものが軽量、小さい、早いを実現できているのも、そういった部分があるからです。
@z

@x
#### Containers
@y
{% comment %}
#### Containers
{% endcomment %}
#### コンテナー
{: #containers }
@z

@x
A container is a runnable instance of an image. You can create, start, stop,
move, or delete a container using the Docker API or CLI. You can connect a
container to one or more networks, attach storage to it, or even create a new
image based on its current state.
@y
{% comment %}
A container is a runnable instance of an image. You can create, start, stop,
move, or delete a container using the Docker API or CLI. You can connect a
container to one or more networks, attach storage to it, or even create a new
image based on its current state.
{% endcomment %}
コンテナーとは、イメージが実行状態となったインスタンスのことです。
コンテナーに対する生成、実行、停止、移動、削除は Docker API や CLI を使って行われます。
コンテナーは、複数のネットワークへの接続、ストレージの追加を行うことができ、さらには現時点の状態にもとづいた新たなイメージを生成することもできます。
@z

@x
By default, a container is relatively well isolated from other containers and
its host machine. You can control how isolated a container's network, storage,
or other underlying subsystems are from other containers or from the host
machine.
@y
{% comment %}
By default, a container is relatively well isolated from other containers and
its host machine. You can control how isolated a container's network, storage,
or other underlying subsystems are from other containers or from the host
machine.
{% endcomment %}
デフォルトでは、コンテナーは他のコンテナーやホストマシンとは、程よく分離されています。
コンテナーに属するネットワーク、ストレージ、基盤となるサブシステムなどを、いかにして他のコンテナーやホストマシンから切り離すか、その程度は制御することが可能です。
@z

@x
A container is defined by its image as well as any configuration options you
provide to it when you create or start it. When a container is removed, any changes to
its state that are not stored in persistent storage disappear.
@y
{% comment %}
A container is defined by its image as well as any configuration options you
provide to it when you create or start it. When a container is removed, any changes to
its state that are not stored in persistent storage disappear.
{% endcomment %}
コンテナーはイメージによって定義されるものです。
またこれを生成、実行するために設定したオプションによっても定義されます。
コンテナーを削除すると、その時点での状態に対して変更がかかっていたとしても、永続的なストレージに保存されていないものは消失します。
@z

@x
##### Example `docker run` command
@y
{% comment %}
##### Example `docker run` command
{% endcomment %}
##### `docker run` コマンドの例
{: #example-docker-run-command }
@z

@x
The following command runs an `ubuntu` container, attaches interactively to your
local command-line session, and runs `/bin/bash`.
@y
{% comment %}
The following command runs an `ubuntu` container, attaches interactively to your
local command-line session, and runs `/bin/bash`.
{% endcomment %}
次のコマンドは `ubuntu` コンテナーを実行し、ローカルのコマンドライン処理のセッションを結びつけます。そして `/bin/bash` を実行します。
@z

@x
```bash
$ docker run -i -t ubuntu /bin/bash
```
@y
```bash
$ docker run -i -t ubuntu /bin/bash
```
@z

@x
When you run this command, the following happens (assuming you are using
the default registry configuration):
@y
{% comment %}
When you run this command, the following happens (assuming you are using
the default registry configuration):
{% endcomment %}
このコマンドを実行すると、以下が発生します（レジストリから入手した際のデフォルトの設定を使用しているものとします）。
@z

@x
1.  If you do not have the `ubuntu` image locally, Docker pulls it from your
    configured registry, as though you had run `docker pull ubuntu` manually.

2.  Docker creates a new container, as though you had run a `docker container create`
    command manually.

3.  Docker allocates a read-write filesystem to the container, as its final
    layer. This allows a running container to create or modify files and
    directories in its local filesystem.

4.  Docker creates a network interface to connect the container to the default
    network, since you did not specify any networking options. This includes
    assigning an IP address to the container. By default, containers can
    connect to external networks using the host machine's network connection.

5.  Docker starts the container and executes `/bin/bash`. Because the container
    is running interactively and attached to your terminal (due to the `-i` and `-t`
    flags), you can provide input using your keyboard while the output is logged to
    your terminal.

6.  When you type `exit` to terminate the `/bin/bash` command, the container
    stops but is not removed. You can start it again or remove it.
@y
{% comment %}
1.  If you do not have the `ubuntu` image locally, Docker pulls it from your
    configured registry, as though you had run `docker pull ubuntu` manually.

2.  Docker creates a new container, as though you had run a `docker container create`
    command manually.

3.  Docker allocates a read-write filesystem to the container, as its final
    layer. This allows a running container to create or modify files and
    directories in its local filesystem.

4.  Docker creates a network interface to connect the container to the default
    network, since you did not specify any networking options. This includes
    assigning an IP address to the container. By default, containers can
    connect to external networks using the host machine's network connection.

5.  Docker starts the container and executes `/bin/bash`. Because the container
    is running interactively and attached to your terminal (due to the `-i` and `-t`
    flags), you can provide input using your keyboard while the output is logged to
    your terminal.

6.  When you type `exit` to terminate the `/bin/bash` command, the container
    stops but is not removed. You can start it again or remove it.
{% endcomment %}
1. `ubuntu` イメージがローカルになければ、Docker は設定されているレジストリからイメージを取得します。
   この動作は手動で `docker pull ubuntu` を実行するのと同じです。

2. Docker は新しいコンテナーを生成します。
   これは手動で `docker create` コマンドを実行することと同じです。

3. Docker はコンテナーに対して読み書きが可能なファイルシステムを割り当てます。
   これが最終的にレイヤーとなります。
   このことによりコンテナーの稼動中に、ローカルなファイルシステム内でのファイルやディレクトリの生成や変更などが実現されます。

4. Docker はネットワークインターフェースを生成し、コンテナーをデフォルトネットワークに接続します。
   ここではネットワークオプションを指定していないものとしているためです。
   このときには、コンテナーに対しての IP アドレスの割り当ても行われます。
   デフォルトでコンテナーは、ホストマシンのネットワーク接続を利用して、外部ネットワークに接続します。

5. Docker はコンテナーを起動し、 ``/bin/bash`` を実行します。
   （ ``-i`` と ``-t`` のフラグにより）対話的に、かつターミナル画面に接続するようにして実行しているため、手元のキーボードを使って入力することができ、ターミナル画面に出力が行われるようになります。

6. `exit` を入力すると `/bin/bash` コマンドは終了します。
   コンテナーは停止状態となりますが、削除はされません。
   コンテナーは再起動したり削除することもできます。
@z

@x
#### Services
@y
{% comment %}
#### Services
{% endcomment %}
#### サービス
{: #services }
@z

@x
Services allow you to scale containers across multiple Docker daemons, which
all work together as a _swarm_ with multiple _managers_ and _workers_. Each
member of a swarm is a Docker daemon, and all the daemons communicate using
the Docker API. A service allows you to define the desired state, such as the
number of replicas of the service that must be available at any given time.
By default, the service is load-balanced across all worker nodes. To
the consumer, the Docker service appears to be a single application. Docker
Engine supports swarm mode in Docker 1.12 and higher.
@y
{% comment %}
Services allow you to scale containers across multiple Docker daemons, which
all work together as a _swarm_ with multiple _managers_ and _workers_. Each
member of a swarm is a Docker daemon, and all the daemons communicate using
the Docker API. A service allows you to define the desired state, such as the
number of replicas of the service that must be available at any given time.
By default, the service is load-balanced across all worker nodes. To
the consumer, the Docker service appears to be a single application. Docker
Engine supports swarm mode in Docker 1.12 and higher.
{% endcomment %}
サービスは、複数の Docker デーモンにわたって、コンテナーのスケール変更ができるようにします。
複数のデーモンは*スウォーム*と呼ばれるものとして扱われ、複数の **マネージャー** 、**ワーカー** とともに動作します。
そしてすべてのデーモンが Docker API を利用して通信します。
サービスは必要となる状態を定義することが可能であり、たとえばサービスのレプリカ数を、指定した時間においてどれだけ作り出すかを定義できます。
デフォルトでは、すべてのワーカーノードにわたって負荷分散が行われます。
利用者からすると、Docker サービスは１つのアプリケーションとして見えます。
Docker Engine がスウォームモードをサポートするのは Docker バージョン 1.12 またはそれ以上です。
@z

@x
## The underlying technology
Docker is written in the [Go programming language](https://golang.org/) and takes
advantage of several features of the Linux kernel to deliver its functionality.
@y
{% comment %}
## The underlying technology
Docker is written in the [Go programming language](https://golang.org/) and takes
advantage of several features of the Linux kernel to deliver its functionality.
{% endcomment %}
{: #the-underlying-technology }
## 基盤とする技術
Docker は [Go プログラミング言語](https://golang.org/) で書かれており、Linux カーネルの機能をうまく活用して、さまざまな機能性を実現しています。
@z

@x
### Namespaces
Docker uses a technology called `namespaces` to provide the isolated workspace
called the *container*. When you run a container, Docker creates a set of
*namespaces* for that container.
@y
{% comment %}
### Namespaces
Docker uses a technology called `namespaces` to provide the isolated workspace
called the *container*. When you run a container, Docker creates a set of
*namespaces* for that container.
{% endcomment %}
{: #namespaces }
### 名前空間
Docker は名前空間という技術を利用して **コンテナー** と呼ぶ作業空間を分離して提供します。
コンテナーが実行されたとき、Docker はそのコンテナーに対して複数の *名前空間* を生成します。
@z

@x
These namespaces provide a layer of isolation. Each aspect of a container runs
in a separate namespace and its access is limited to that namespace.
@y
{% comment %}
These namespaces provide a layer of isolation. Each aspect of a container runs
in a separate namespace and its access is limited to that namespace.
{% endcomment %}
名前空間はいくつもの分離状態を作り出します。
コンテナー内のさまざまな処理は、分離された名前空間内にて実行され、それぞれへのアクセスはその名前空間内に限定されます。
@z

@x
Docker Engine uses namespaces such as the following on Linux:
@y
{% comment %}
Docker Engine uses namespaces such as the following on Linux:
{% endcomment %}
Docker Engine が取り扱う名前空間は、Linux 上で言えば以下のようなものです。
@z

@x
 - **The `pid` namespace:** Process isolation (PID: Process ID).
 - **The `net` namespace:** Managing network interfaces (NET:
 Networking).
 - **The `ipc` namespace:** Managing access to IPC
 resources (IPC: InterProcess Communication).
 - **The `mnt` namespace:** Managing filesystem mount points (MNT: Mount).
 - **The `uts` namespace:** Isolating kernel and version identifiers. (UTS: Unix
Timesharing System).
@y
{% comment %}
 - **The `pid` namespace:** Process isolation (PID: Process ID).
 - **The `net` namespace:** Managing network interfaces (NET:
 Networking).
 - **The `ipc` namespace:** Managing access to IPC
 resources (IPC: InterProcess Communication).
 - **The `mnt` namespace:** Managing filesystem mount points (MNT: Mount).
 - **The `uts` namespace:** Isolating kernel and version identifiers. (UTS: Unix
Timesharing System).
{% endcomment %}
 - **`pid` 名前空間** ：プロセスの分離。（PID：プロセス ID）
 - **`net` 名前空間** ：ネットワーク・インターフェースの管理。（NET：ネットワーキング）
 - **`ipc` 名前空間** ：IPC リソースに対するアクセス管理。（IPC：InterProcess Communication、内部プロセスの通信）
 - **`mnt` 名前空間** ：ファイルシステムのマウント・ポイントの管理。（MNT：マウント）
 - **`uts` 名前空間** ：カーネルとバージョンの分離。（UTS：Unix  Timesharing System、Unix タイムシェアリング・システム）
@z

@x
### Control groups
Docker Engine on Linux also relies on another technology called _control groups_
(`cgroups`). A cgroup limits an application to a specific set of resources.
Control groups allow Docker Engine to share available hardware resources to
containers and optionally enforce limits and constraints. For example,
you can limit the memory available to a specific container.
@y
{% comment %}
### Control groups
Docker Engine on Linux also relies on another technology called _control groups_
(`cgroups`). A cgroup limits an application to a specific set of resources.
Control groups allow Docker Engine to share available hardware resources to
containers and optionally enforce limits and constraints. For example,
you can limit the memory available to a specific container.
{% endcomment %}
{: #control-groups }
### コントロールグループ
Linux 上で動作する Docker Engine では、さらに **コントールグループ** （`cgroups`; control groups）と呼ばれる技術も併用されます。
cgroup は、アプリケーションが利用するリソースを特定のものに限定します。
つまりコントロールグループは、Docker Engine が利用可能なハードウェアリソースをコンテナー間で共有するようにし、必要に応じて利用上限や制約をつけることも行います。
たとえば特定のコンテナーが利用するメモリの上限を設定することもできます。
@z

@x
### Union file systems
Union file systems, or UnionFS, are file systems that operate by creating layers,
making them very lightweight and fast. Docker Engine uses UnionFS to provide
the building blocks for containers. Docker Engine can use multiple UnionFS variants,
including AUFS, btrfs, vfs, and DeviceMapper.
@y
{% comment %}
### Union file systems
Union file systems, or UnionFS, are file systems that operate by creating layers,
making them very lightweight and fast. Docker Engine uses UnionFS to provide
the building blocks for containers. Docker Engine can use multiple UnionFS variants,
including AUFS, btrfs, vfs, and DeviceMapper.
{% endcomment %}
### ユニオンファイルシステム
{: #union-file-systems }
ユニオンファイルシステムは UnionFS というものであり、レイヤーが作り出され、軽量かつ高速に処理が行われるファイルシステムのことです。
Docker Engine は UnionFS を利用して、コンテナーにおけるブロックを構築します。
Docker Engine では AUFS、btrfs、vfs、DeviceMapper などの UnionFS 系のファイルシステムも利用できます。
@z

@x
### Container format
Docker Engine combines the namespaces, control groups, and UnionFS into a wrapper
called a container format. The default container format is `libcontainer`. In
the future, Docker may support other container formats by integrating with
technologies such as BSD Jails or Solaris Zones.
@y
{% comment %}
### Container format
Docker Engine combines the namespaces, control groups, and UnionFS into a wrapper
called a container format. The default container format is `libcontainer`. In
the future, Docker may support other container formats by integrating with
technologies such as BSD Jails or Solaris Zones.
{% endcomment %}
### コンテナーフォーマット
{: #container-format }
名前空間、コントロールグループ、UnionFS は Docker Engine により、コンテナーフォーマットと呼ばれるラッパーとして構成されます。
このコンテナーフォーマットのデフォルトが ``libcontainer`` です。
いずれ BSD Jail や Solaris Zone などを技術統合した新たなコンテナーフォーマットがサポートされることになるかもしれません。
@z

@x
## Next steps
- Read about [installing Docker](../get-docker.md).
- Get hands-on experience with the [Getting started with Docker](index.md)
    tutorial.
@y
{% comment %}
## Next steps
- Read about [installing Docker](../get-docker.md).
- Get hands-on experience with the [Getting started with Docker](index.md)
    tutorial.
{% endcomment %}
## 次のステップ
{: #next-steps }
- [Docker のインストール](../get-docker.md) に進む。
- 利用例を確認したり詳細なトピックを突き詰めたりするために [Docker Engine ユーザーガイド](index.md) を読む。
@z
