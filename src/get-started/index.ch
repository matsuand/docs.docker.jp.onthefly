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
description: Docker の基本について学び Docker Desktop をインストールします。
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
Welcome! We are excited that you want to learn Docker.
@y
ようこそ！
Docker の使い方を学ぼうとしているみなさん。
すばらしいことです。
@z

@x
This page contains step-by-step instructions on how to get started with Docker. We also recommend the video walkthrough from DockerCon 2020.
@y
このページでは順を追って手順を進めていくことで Docker を学んでいきます。
DockerCon 2020 のビデオウォークスルーもお勧めします。
@z

@x
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/iqqDU2crIEQ?start=30" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@y
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/iqqDU2crIEQ?start=30" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@z

@x
In this tutorial, you'll learn about creating and deploying Docker apps, including using multiple containers with a database, and using Docker Compose. You'll also deploy your containerized app to Azure.
@y
本チュートリアルでは Docker アプリの生成とデプロイについて学びます。
その中ではデータベースを用いたマルチコンテナーや Docker Compose の利用も行います。
またコンテナー化したアプリの Azure へのデプロイも行います。
@z

@x
## Start the tutorial
@y
{: #start-the-tutorial }
## チュートリアルスタート
@z

@x
If you've already run the command to get started with the tutorial, congratulations! If not, open a command prompt or bash window, and run the command:
@y
このチュートリアルをはじめるためのコマンドをすでに実行済みであれば、おめでとうございます。
もしまだの方はコマンドプロンプトや Bash 画面を開いて、以下のコマンドを実行してください。
@z

@x
```cli
docker run -d -p 80:80 docker/getting-started
```
@y
```cli
docker run -d -p 80:80 docker/getting-started
```
@z

@x
You'll notice a few flags being used. Here's some more info on them:
@y
ここではフラグをいくつか利用しています。
その説明をみてください。
@z

@x
- `-d` - run the container in detached mode (in the background)
- `-p 80:80` - map port 80 of the host to port 80 in the container
- `docker/getting-started` - the image to use
@y
- `-d`： コンテナーをデタッチ（detached）モード、つまりバックグラウンドで実行します。
- `-p 80:80`： ホストの 80 ポートをコンテナーの 80 ポートにマッピングします。
- `docker/getting-started`： 利用するイメージ名です。
@z

@x
>**Pro tip**
>
>You can combine single character flags to shorten the full command.
>As an example, the command above could be written as:
>```
>docker run -dp 80:80 docker/getting-started
>```
> 
@y
>**上級者向けのヒント**
>
>1 文字からなるフラグはつなぎ合わせることで、コマンド記述を短くすることができます。
>たとえば上のコマンドは以下のようにすることもできます。
>```
>docker run -dp 80:80 docker/getting-started
>```
> 
@z

@x
## The Docker Dashboard
@y
{: #the-docker-dashboard }
## Docker ダッシュボード
@z

@x
Before going too far, we want to highlight the Docker Dashboard, which gives
you a quick view of the containers running on your machine. It gives you quick
access to container logs, lets you get a shell inside the container, and lets you
easily manage container lifecycle (stop, remove, etc.). 
@y
この先に進む前に Docker ダッシュボードについて説明しておきたいと思います。
これはマシン上に動作するコンテナーを簡単に参照できるものです。
これを使えばコンテナーログに簡単にアクセスしたり、コンテナー内のシェルを実行したりすることが可能です。
さらにコンテナーのライフサイクル（停止や削除など）を簡単に管理することができます。
@z

@x
To access the dashboard, follow the instructions for either 
[Mac](https://docs.docker.com/docker-for-mac/dashboard/) or 
[Windows](https://docs.docker.com/docker-for-windows/dashboard/). If you open the dashboard
now, you will see this tutorial running! The container name (`jolly_bouman` below) is a
randomly created name. So, you'll most likely have a different name.
@y
ダッシュボードにアクセスするには [Mac](https://docs.docker.com/docker-for-mac/dashboard/) 用または [Windows](https://docs.docker.com/docker-for-windows/dashboard/) 用の手順に従ってください。
ダッシュボードを今開いている場合は、チュートリアルコンテナーが動作中であるのが見てとれるはずです。
コンテナー名（以下では`jolly_bouman`）はランダムに生成されます。
したがって手元のコンテナー名は、きっと別の名前になっているはずです。
@z

@x
![Tutorial container running in Docker Dashboard](images/tutorial-in-dashboard.png)
@y
![Docker ダッシュボード内で稼動するチュートリアルコンテナー](images/tutorial-in-dashboard.png)
@z

@x
## What is a container?
@y
{: #what-is-a-container }
## コンテナーとは何ですか
@z

@x
Now that you've run a container, what _is_ a container? Simply put, a container is
simply another process on your machine that has been isolated from all other processes
on the host machine. That isolation leverages [kernel namespaces and cgroups](https://medium.com/@saschagrunert/demystifying-containers-part-i-kernel-space-2c53d6979504), features that have been 
in Linux for a long time. Docker has worked to make these capabilities approachable and easy to use.
@y
上でコンテナーというものを実行したわけですが、コンテナーとは何でしょう。
簡単に言うと、コンテナーとはマシン上の単なる 1 つのプロセスであって、ホスト上の他のプロセスとは分離されているものです。
この分離状態は [カーネルの名前空間と cgroups](https://medium.com/@saschagrunert/demystifying-containers-part-i-kernel-space-2c53d6979504) によって実現されています。
それは Linux において長らく実現されてきている機能です。
Docker はそういった機能を活用し利用しやすくして動作しています。
@z

@x
!!! info "Creating Containers from Scratch"
    If you'd like to see how containers are built from scratch, Liz Rice from Aqua Security
    has a fantastic talk in which she creates a container from scratch in Go. While she makes
    a simple container, this talk doesn't go into networking, using images for the filesystem, 
    and more. But, it gives a _fantastic_ deep dive into how things are working.
@y
> 一からコンテナーを生成する
>
> コンテナーがどのようにして一から作り出されているのかを知りたい方は、Aqua Security 社の Liz Rice 氏が、Go 言語をつかって一からコンテナーを作りだすという、すばらしい話を聞かせてくれています。
> 彼女が作り出しているコンテナーはとても単純なものなので、ネットワークやファイルシステムイメージを利用するような話にまでは及んでいません。
> しかし何がどのようにして動作しているのかを、実に深く切り込んだ **すばらしい** 話が聞けます。
{: .information }
@z

@x
    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/8fi7uSYlOdc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@y
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/8fi7uSYlOdc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@z

@x
## What is a container image?
@y
{: #what-is-a-container-image }
## コンテナーイメージとは何ですか
@z

@x
When running a container, it uses an isolated filesystem. This custom filesystem is provided 
by a **container image**. Since the image contains the container's filesystem, it must contain everything 
needed to run an application - all dependencies, configuration, scripts, binaries, etc. The 
image also contains other configuration for the container, such as environment variables,
a default command to run, and other metadata.
@y
コンテナーを実行すると、コンテナーは分離されたファイルシステムを利用します。
このカスタムファイルシステムは **コンテナーイメージ** によって提供されます。
イメージにはコンテナーのファイルシステムが含まれるため、アプリケーションの実行に必要となるものをすべて含んでいなければなりません。
それは依存パッケージであり設定であり、スクリプトやバイナリです。
イメージにはそれ以外のコンテナー設定として、環境変数、デフォルト実行のコマンド、メタデータなども含みます。
@z

@x
We'll dive deeper into images later on, covering topics such as layering, best practices, and more.
@y
イメージについては後に詳細に見ていくことにします。
そこでレイヤー構成やベストプラクティスなどのトピックをカバーします。
@z

@x
!!! info
    If you're familiar with `chroot`, think of a container as an extended version of `chroot`. The
    filesystem is simply coming from the image. But, a container adds additional isolation not
    available when simply using chroot.
@y
> `chroot`コマンドについてよくわかっている方は、コンテナーが`chroot`の拡張版として動作するものであると考えてください。
> ファイルシステムは単純にイメージから利用されます。
> しかしコンテナーでは chroot を利用するだけでは実現できない、追加の分離処理を行います。
{: .information }
@z

@x
## CLI references
@y
{: #cli-references }
## CLI リファレンス
@z

@x
Refer to the following topics for further documentation on all CLI commands used in this article:
@y
本節で利用した CLI コマンドについては、以下に示すドキュメントを参照してください。
@z

@x
- [docker version](https://docs.docker.com/engine/reference/commandline/version/)
- [docker run](https://docs.docker.com/engine/reference/commandline/run/)
- [docker image](https://docs.docker.com/engine/reference/commandline/image/)
- [docker container](https://docs.docker.com/engine/reference/commandline/container/)
@y
- [docker version](https://docs.docker.com/engine/reference/commandline/version/)
- [docker run](https://docs.docker.com/engine/reference/commandline/run/)
- [docker image](https://docs.docker.com/engine/reference/commandline/image/)
- [docker container](https://docs.docker.com/engine/reference/commandline/container/)
@z
