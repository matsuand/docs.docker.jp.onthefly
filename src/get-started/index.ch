%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Orientation and setup"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Get oriented on some basics of Docker and install Docker Desktop.
redirect_from:
- /engine/getstarted-voting-app/
- /engine/getstarted-voting-app/cleanup/
- /engine/getstarted-voting-app/create-swarm/
- /engine/getstarted-voting-app/customize-app/
- /engine/getstarted-voting-app/deploy-app/
- /engine/getstarted-voting-app/node-setup/
- /engine/getstarted-voting-app/test-drive/
- /engine/getstarted/
- /engine/getstarted/last_page/
- /engine/getstarted/step_five/
- /engine/getstarted/step_four/
- /engine/getstarted/step_one/
- /engine/getstarted/step_six/
- /engine/getstarted/step_three/
- /engine/getstarted/step_two/
- /engine/tutorials/dockerimages/
- /engine/tutorials/dockerizing/
- /engine/tutorials/dockerrepos/
- /engine/tutorials/usingdocker/
- /engine/userguide/containers/dockerimages/
- /engine/userguide/dockerimages/
- /engine/userguide/intro/
- /get-started/part1/
- /get-started/part6/
- /getstarted/
- /getting-started/
- /learn/
- /linux/last_page/
- /linux/started/
- /linux/step_four/
- /linux/step_one/
- /linux/step_six/
- /linux/step_three/
- /linux/step_two/
- /mac/last_page/
- /mac/started/
- /mac/step_four/
- /mac/step_one/
- /mac/step_six/
- /mac/step_three/
- /mac/step_two/
- /userguide/dockerimages/
- /userguide/dockerrepos/
- /windows/last_page/
- /windows/started/
- /windows/step_four/
- /windows/step_one/
- /windows/step_six/
- /windows/step_three/
- /windows/step_two/
---
@y
---
title: "概要とセットアップ"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Get oriented on some basics of Docker and install Docker Desktop.
redirect_from:
- /engine/getstarted-voting-app/
- /engine/getstarted-voting-app/cleanup/
- /engine/getstarted-voting-app/create-swarm/
- /engine/getstarted-voting-app/customize-app/
- /engine/getstarted-voting-app/deploy-app/
- /engine/getstarted-voting-app/node-setup/
- /engine/getstarted-voting-app/test-drive/
- /engine/getstarted/
- /engine/getstarted/last_page/
- /engine/getstarted/step_five/
- /engine/getstarted/step_four/
- /engine/getstarted/step_one/
- /engine/getstarted/step_six/
- /engine/getstarted/step_three/
- /engine/getstarted/step_two/
- /engine/tutorials/dockerimages/
- /engine/tutorials/dockerizing/
- /engine/tutorials/dockerrepos/
- /engine/tutorials/usingdocker/
- /engine/userguide/containers/dockerimages/
- /engine/userguide/dockerimages/
- /engine/userguide/intro/
- /get-started/part1/
- /get-started/part6/
- /getstarted/
- /getting-started/
- /learn/
- /linux/last_page/
- /linux/started/
- /linux/step_four/
- /linux/step_one/
- /linux/step_six/
- /linux/step_three/
- /linux/step_two/
- /mac/last_page/
- /mac/started/
- /mac/step_four/
- /mac/step_one/
- /mac/step_six/
- /mac/step_three/
- /mac/step_two/
- /userguide/dockerimages/
- /userguide/dockerrepos/
- /windows/last_page/
- /windows/started/
- /windows/step_four/
- /windows/step_one/
- /windows/step_six/
- /windows/step_three/
- /windows/step_two/
---
@z

@x
{% include_relative nav.html selected="1" %}
@y
{% include_relative nav.html selected="1" %}
@z

@x
Welcome! We are excited that you want to learn Docker.
@y
{% comment %}
Welcome! We are excited that you want to learn Docker.
{% endcomment %}
ようこそ！
みなさんが Docker の使い方を学ぼうとしているのはすばらしいことです。
@z

@x
This page contains step-by-step instructions on how to get started with Docker. We also recommend the video walkthrough from Dockercon 2020.
@y
{% comment %}
This page contains step-by-step instructions on how to get started with Docker. We also recommend the video walkthrough from Dockercon 2020.
{% endcomment %}
このページでは順を追って手順を進めていくことで Docker を学んでいきます。
Dockercon 2020 のビデオウォークスルーもお勧めします。
@z

@x
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/iqqDU2crIEQ?start=30" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@y
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/iqqDU2crIEQ?start=30" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@z

@x
The Docker Quickstart training module teaches you how to:
@y
{% comment %}
The Docker Quickstart training module teaches you how to:
{% endcomment %}
Docker クイックスタートトレーニングでは、以下のことを学んでいきます。
@z

@x
1.  Set up your Docker environment (on this page)
@y
{% comment %}
1.  Set up your Docker environment (on this page)
{% endcomment %}
1.  Docker 環境のセットアップ（このページ）
@z

@x
2.  [Build and run your image](part2.md)
@y
{% comment %}
2.  [Build and run your image](part2.md)
{% endcomment %}
2.  [イメージの構築と実行](part2.md)
@z

@x
3.  [Share images on Docker Hub](part3.md)
@y
{% comment %}
3.  [Share images on Docker Hub](part3.md)
{% endcomment %}
3.  [Docker Hub におけるイメージ共有](part3.md)
@z

@x
## Docker concepts
@y
{% comment %}
## Docker concepts
{% endcomment %}
{: #docker-concepts }
## Docker の考え方
@z

@x
Docker is a platform for developers and sysadmins to **build, run, and share**
applications with containers. The use of containers to deploy applications
is called _containerization_. Containers are not new, but their use for easily
deploying applications is.
@y
{% comment %}
Docker is a platform for developers and sysadmins to **build, run, and share**
applications with containers. The use of containers to deploy applications
{% endcomment %}
Docker は開発者やシステム管理者が、コンテナーを使ってアプリケーションを**ビルド、実行、共有**するためのプラットフォームです。
コンテナーを利用してアプリケーションをデプロイすることを「コンテナー化」（_containerization_）と呼びます。
コンテナーは新たな技術というものではありませんが、これを使えばアプリケーションを簡単にデプロイできます。
@z

@x
Containerization is increasingly popular because containers are:
@y
{% comment %}
Containerization is increasingly popular because containers are:
{% endcomment %}
コンテナー化は、よりポピュラーなものになっています。
その理由は以下です。
@z

@x
- **Flexible**: Even the most complex applications can be containerized.
- **Lightweight**: Containers leverage and share the host kernel,
  making them much more efficient in terms of system resources than virtual machines.
- **Portable**: You can build locally, deploy to the cloud, and run anywhere.
- **Loosely coupled**: Containers are highly self sufficient and encapsulated,
  allowing you to replace or upgrade one without disrupting others.
- **Scalable**: You can increase and automatically distribute container replicas across a datacenter.
- **Secure**: Containers apply aggressive constraints and isolations to processes without any configuration required on the part of the user.
@y
{% comment %}
- **Flexible**: Even the most complex applications can be containerized.
- **Lightweight**: Containers leverage and share the host kernel,
  making them much more efficient in terms of system resources than virtual machines.
- **Portable**: You can build locally, deploy to the cloud, and run anywhere.
- **Loosely coupled**: Containers are highly self sufficient and encapsulated,
  allowing you to replace or upgrade one without disrupting others.
- **Scalable**: You can increase and automatically distribute container replicas across a datacenter.
- **Secure**: Containers apply aggressive constraints and isolations to processes without any configuration required on the part of the user.
{% endcomment %}
- **柔軟性**: より複雑なアプリケーションであるほど、コンテナー化ができます。
- **軽量**: コンテナーはホストシステムのカーネルを活用し共有します。
  システムリソースを活用する観点からは、仮想環境よりもさらに効率性が増します。
- **可搬性**: ローカルでビルド、クラウドにデプロイ、どこでも動きます。
- **疎結合**: コンテナーは自己完結度が高くカプセル化されています。
  したがってコンテナーの入れ替えや更新は、他のものに影響を与えることなく行うことができます。
- **スケーラブル**: データセンター内において、コンテナーのレプリカを増やしたり自動的に提供することができます。
- **セキュア**: コンテナーはプロセスに対して強力な制約と分離を実現するため、ユーザー自身による制御を必要としません。
@z

@x
### Images and containers
@y
{% comment %}
### Images and containers
{% endcomment %}
{: #images-and-containers }
### イメージとコンテナー
@z

@x
Fundamentally, a container is nothing but a running process,
with some added encapsulation features applied to it in order to keep it isolated from the host and from other containers.
One of the most important aspects of container isolation is that each container interacts with its own private filesystem; this filesystem is provided by a Docker **image**.
An image includes everything needed to run an application - the code or binary,
runtimes, dependencies, and any other filesystem objects required.
@y
{% comment %}
Fundamentally, a container is nothing but a running process,
with some added encapsulation features applied to it in order to keep it isolated from the host and from other containers.
One of the most important aspects of container isolation is that each container interacts with its own private filesystem; this filesystem is provided by a Docker **image**.
An image includes everything needed to run an application - the code or binary,
runtimes, dependencies, and any other filesystem objects required.
{% endcomment %}
基本的にコンテナーとは、単にプロセスが起動しているものにすぎません。
ただしホストや別のコンテナーと切り離すために、カプセル化された機能が加えられています。
コンテナーを独立させる際に重要となる点として、各コンテナーが独自のプライベートなファイルシステムにアクセスすることがあげられます。
このファイルシステムは Docker **イメージ** によって提供されるものです。
イメージには、アプリケーションの実行に必要となるすべて、つまりコード、バイナリモジュール、ランタイム、依存パッケージなど、必要となるファイルシステムオブジェクトが含まれます。
@z

@x
### Containers and virtual machines
@y
{% comment %}
### Containers and virtual machines
{% endcomment %}
{: #containers-and-virtual-machines }
### コンテナーと仮想マシン
@z

@x
A container runs _natively_ on Linux and shares the kernel of the host
machine with other containers. It runs a discrete process, taking no more memory
than any other executable, making it lightweight.
@y
{% comment %}
A container runs _natively_ on Linux and shares the kernel of the host
machine with other containers. It runs a discrete process, taking no more memory
than any other executable, making it lightweight.
{% endcomment %}
コンテナーは Linux 上においてネイティブに実行され、他のコンテナーも含めてホストマシン上のカーネルを共有します。
そのプロセスは分離されていて、通常の実行モジュールよりも少ないメモリで動作します。
つまり軽量化されています。
@z

@x
By contrast, a **virtual machine** (VM) runs a full-blown "guest" operating
system with _virtual_ access to host resources through a hypervisor. In general,
VMs incur a lot of overhead beyond what is being consumed by your application logic.
@y
{% comment %}
By contrast, a **virtual machine** (VM) runs a full-blown "guest" operating
system with _virtual_ access to host resources through a hypervisor. In general,
VMs incur a lot of overhead beyond what is being consumed by your application logic.
{% endcomment %}
これとは対照的に**仮想マシン（virtual machine; VM）**は、本格的な「ゲスト」オペレーティングシステムを稼動させ、仮想的なアクセスはハイパーバイザーを通じてホストリソースを操作します。
VM ではより多くのオーバーヘッドが発生します。
それはアプリケーションロジックにより生成される以上のものとなりまう。
一般に仮想マシンが提供する環境は、通常のアプリケーションに比べて多くのリソースを必要とします。
@z

@x
![Container stack example](/images/Container%402x.png){:width="300px"} | ![Virtual machine stack example](/images/VM%402x.png){:width="300px"}
@y
{% comment %}
![Container stack example](/images/Container%402x.png){:width="300px"} | ![Virtual machine stack example](/images/VM%402x.png){:width="300px"}
{% endcomment %}
![コンテナースタックの例]({{ site.baseurl }}/images/Container%402x.png){:width="300px"} | ![仮想マシンスタックの例]({{ site.baseurl }}/images/VM%402x.png){:width="300px"}
@z

@x
## Set up your Docker environment
@y
{% comment %}
## Set up your Docker environment
{% endcomment %}
{: #set-up-your-docker-environment }
## Docker 環境の構築
@z

@x
### Download and install Docker Desktop
@y
{% comment %}
### Download and install Docker Desktop
{% endcomment %}
{: #download-and-install-docker-desktop }
### Docker Desktop のダウンロードとインストール
@z

@x
Docker Desktop is an easy-to-install application for your Mac or Windows environment that enables you to start coding and containerizing in minutes. Docker Desktop includes everything you need to build, run, and share containerized applications right from your machine.
@y
{% comment %}
Docker Desktop is an easy-to-install application for your Mac or Windows environment that enables you to start coding and containerizing in minutes. Docker Desktop includes everything you need to build, run, and share containerized applications right from your machine.
{% endcomment %}
Docker Desktop は Mac や Windows 環境に簡単にインストールできるアプリケーションです。
これを使えば、すぐにコーディングとコンテナー化を行うことができます。
Docker Desktop には、コンテナー化するアプリケーションを自マシン上からビルド、実行するためのツールがすべて含まれています。
@z

@x
Follow the instructions appropriate for your operating system to download and install Docker Desktop.
@y
{% comment %}
Follow the instructions appropriate for your operating system to download and install Docker Desktop.
{% endcomment %}
利用しているオペレーティングシステムに対応する以下の手順に従って、Docker Desktop のダウンロードとインストールを行ってください。
@z

@x {{ site.baseurl }}
 [Docker Desktop for Mac](/docker-for-mac/install/){: target="_blank" rel="noopener" class="_"}{: .button .outline-btn} [Docker Desktop for Windows](/docker-for-windows/install/){: target="_blank" rel="noopener" class="_"}{: .button .outline-btn}
@y
 {% comment %}
 [Docker Desktop for Mac](/docker-for-mac/install/){: target="_blank" rel="noopener" class="_"}{: .button .outline-btn} [Docker Desktop for Windows](/docker-for-windows/install/){: target="_blank" rel="noopener" class="_"}{: .button .outline-btn}
 {% endcomment %}
 [Docker Desktop for Mac]({{ site.baseurl }}/docker-for-mac/install/){: target="_blank" rel="noopener" class="_"}{: .button .outline-btn} [Docker Desktop for Windows]({{ site.baseurl }}/docker-for-windows/install/){: target="_blank" rel="noopener" class="_"}{: .button .outline-btn}
@z

@x
### Test Docker version
@y
{% comment %}
### Test Docker version
{% endcomment %}
{: #test-docker-version }
### Docker バージョンの確認
@z

@x
After you've successfully installed Docker Desktop, open a terminal and run `docker --version` to check the version of Docker installed on your machine.
@y
{% comment %}
After you've successfully installed Docker Desktop, open a terminal and run `docker --version` to check the version of Docker installed on your machine.
{% endcomment %}
Docker Desktop のインストールを正常に終えたら、端末画面を開いて `docker --version` を実行してください。
自マシンにインストールされている Docker のバージョンを確認することができます。
@z

@x
```shell
$ docker --version
Docker version 19.03.13, build 4484c46d9d
```
@y
```shell
$ docker --version
Docker version 19.03.13, build 4484c46d9d
```
@z

@x
### Test Docker installation
@y
{% comment %}
### Test Docker installation
{% endcomment %}
{: #test-docker-installation }
### Docker のインストール状況の確認
@z

@x
1.  Test that your installation works by running the [hello-world](https://hub.docker.com/_/hello-world/){: target="_blank" rel="noopener" class="_"} Docker image:
@y
{% comment %}
1.  Test that your installation works by running the [hello-world](https://hub.docker.com/_/hello-world/){: target="_blank" rel="noopener" class="_"} Docker image:
{% endcomment %}
1.  インストールが正常に行われているかを確認するために Docker イメージである [hello-world](https://hub.docker.com/_/hello-world/){: target="_blank" rel="noopener" class="_"} を実行します。
@z

@x
    ```shell
        $ docker run hello-world
@y
    ```shell
        $ docker run hello-world
@z

@x
        Unable to find image 'hello-world:latest' locally
        latest: Pulling from library/hello-world
        ca4f61b1923c: Pull complete
        Digest: sha256:ca0eeb6fb05351dfc8759c20733c91def84cb8007aa89a5bf606bc8b315b9fc7
        Status: Downloaded newer image for hello-world:latest
@y
        Unable to find image 'hello-world:latest' locally
        latest: Pulling from library/hello-world
        ca4f61b1923c: Pull complete
        Digest: sha256:ca0eeb6fb05351dfc8759c20733c91def84cb8007aa89a5bf606bc8b315b9fc7
        Status: Downloaded newer image for hello-world:latest
@z

@x
        Hello from Docker!
        This message shows that your installation appears to be working correctly.
        ...
    ```
@y
        Hello from Docker!
        This message shows that your installation appears to be working correctly.
        ...
    ```
@z

@x
2.  Run `docker image ls` to list the `hello-world` image that you downloaded to your machine.
@y
{% comment %}
2.  Run `docker image ls` to list the `hello-world` image that you downloaded to your machine.
{% endcomment %}
2.  `docker image ls` を実行します。
    これにより自マシンにダウンロードされた `hello-world` イメージを確認します。
@z

@x
3.  List the `hello-world` container (spawned by the image) which exits after displaying its message. If it is still running, you do not need the `--all` option:
@y
{% comment %}
3.  List the `hello-world` container (spawned by the image) which exits after displaying its message. If it is still running, you do not need the `--all` option:
{% endcomment %}
3.  （イメージから実行される）`hello-world` コンテナーを一覧表示します。
    メッセージが表示された後は終了します。
    実行中であれば `--all` オプションをつける必要はありません。
@z

@x
    ```shell
        $ docker ps --all
@y
    ```shell
        $ docker ps --all
@z

@x
        CONTAINER ID     IMAGE           COMMAND      CREATED            STATUS
        54f4984ed6a8     hello-world     "/hello"     20 seconds ago     Exited (0) 19 seconds ago
    ```
@y
        CONTAINER ID     IMAGE           COMMAND      CREATED            STATUS
        54f4984ed6a8     hello-world     "/hello"     20 seconds ago     Exited (0) 19 seconds ago
    ```
@z

@x
## Conclusion
@y
{% comment %}
## Conclusion
{% endcomment %}
{: #conclusion }
## まとめ
@z

@x
At this point, you've installed Docker Desktop on your development machine, and ran a quick test to ensure you are set up to build and run your first containerized application.
@y
{% comment %}
At this point, you've installed Docker Desktop on your development machine, and ran a quick test to ensure you are set up to build and run your first containerized application.
{% endcomment %}
ここまでは開発マシン上に Docker Desktop をインストールし、簡単なテストを通じて、単純なコンテナー化アプリケーションを初めて構築し実行することを確認しました。
@z

@x
[On to Part 2 >>](part2.md){: class="button outline-btn" style="margin-bottom: 30px; margin-right: 100%"}
@y
{% comment %}
[On to Part 2 >>](part2.md){: class="button outline-btn" style="margin-bottom: 30px; margin-right: 100%"}
{% endcomment %}
[2 部へ >>](part2.md){: class="button outline-btn" style="margin-bottom: 30px; margin-right: 100%"}
@z

@x
For information on how to build and run your first containerized application using Node.js, go to [Build your Node.js image](/nodejs/build-images.md).
@y
{% comment %}
For information on how to build and run your first containerized application using Node.js, go to [Build your Node.js image](/nodejs/build-images.md).
{% endcomment %}
Node.js を使ったはじめてのコンテナー化アプリケーションをビルドして実行する方法は、[Node.js イメージのビルド](/nodejs/build-images.md) を参照してください。
@z

@x
## CLI references
@y
{% comment %}
## CLI references
{% endcomment %}
{: #cli-references }
## CLI リファレンス
@z

@x
Refer to the following topics for further documentation on all CLI commands used in this article:
@y
{% comment %}
Refer to the following topics for further documentation on all CLI commands used in this article:
{% endcomment %}
本節において用いた CLI コマンドの詳細は、以下から確認することができます。
@z

@x
- [docker version](https://docs.docker.com/engine/reference/commandline/version/)
- [docker run](https://docs.docker.com/engine/reference/commandline/run/)
- [docker image](https://docs.docker.com/engine/reference/commandline/image/)
- [docker container](https://docs.docker.com/engine/reference/commandline/container/)
@y
- [docker version]({{ site.baseurl }}/engine/reference/commandline/version/)
- [docker run]({{ site.baseurl }}/engine/reference/commandline/run/)
- [docker image]({{ site.baseurl }}/engine/reference/commandline/image/)
- [docker container]({{ site.baseurl }}/engine/reference/commandline/container/)
@z
