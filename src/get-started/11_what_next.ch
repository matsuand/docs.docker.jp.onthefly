%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "What next"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making sure you have more ideas of what you could do next with your application
---
@y
---
title: "この次は何"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making sure you have more ideas of what you could do next with your application
---
@z

@x
Although we're done with our workshop, there's still a LOT more to learn about containers!
We're not going to go deep-dive here, but here are a few other areas to look at next!
@y
チュートリアルのワークショップはこれにて終了ですが、コンテナーについて学ぶことはまだまだあります。
ここでは詳細には触れませんが、今後学んでいくべきテーマについていくつか示しておきます。
@z

@x
## Container Orchestration
@y
{: #container-orchestration }
## コンテナーのオーケストレーション
@z

@x
Running containers in production is tough. You don't want to log into a machine and simply run a
`docker run` or `docker-compose up`. Why not? Well, what happens if the containers die? How do you
scale across several machines? Container orchestration solves this problem. Tools like Kubernetes,
Swarm, Nomad, and ECS all help solve this problem, all in slightly different ways.
@y
本番環境においてコンテナーを動作させるのは骨の折れる作業です。
マシンにログインして`docker run`や`docker-compose up`を入力するなんて、したくないでしょう。
なぜなんでしょう。
ではコンテナーが動作不能になったらどうしますか。
複数マシンを使ってスケールアップをするのはどうしますか。
コンテナーオーケストレーションがこれを解決します。
Kubernetes、Swarm、Nomad、ECS というツールがこの問題をすべて解決します。
それぞれ若干異なるやり方で。
@z

@x
The general idea is that you have "managers" who receive **expected state**. This state might be
"I want to run two instances of my web app and expose port 80." The managers then look at all of the
machines in the cluster and delegate work to "worker" nodes. The managers watch for changes (such as
a container quitting) and then work to make **actual state** reflect the expected state.
@y
一般的な考え方として、あなたの横に **こうあるべき** という状態を知る「マネージャー」がいます。
この状態というのは「ウェブアプリのインスタンスを 2 つ立ち上げてポート 80 で公開したいんです」といったものです。
マネージャーはそこで、クラスター内にあるマシンすべてを見渡して、「ワーカー」ノードに作業を依頼します。
マネージャーは状況変化（たとえばコンテナーが停止していないか）を常に監視していて、**実際の状態** を **こうあるべき状態** に持っていく作業を行います。
@z

@x
## Cloud Native Computing Foundation Projects
@y
{: #cloud-native-computing-foundation-projects }
## Cloud Native Computing Foundation プロジェクト
@z

@x
The CNCF is a vendor-neutral home for various open-source projects, including Kubernetes, Prometheus, 
Envoy, Linkerd, NATS, and more! You can view the [graduated and incubated projects here](https://www.cncf.io/projects/)
and the entire [CNCF Landscape here](https://landscape.cncf.io/). There are a LOT of projects to help
solve problems around monitoring, logging, security, image registries, messaging, and more!
@y
CNCF（Cloud Native Computing Foundation）はベンダーには依存しない、さまざまなオープンソースプロジェクトの協同体です。
ここには Kubernetes、Prometheus、Envoy、Linkerd、NATS など実にさまざまなプロジェクトがあります。
プロジェクトについては [graduated and incubated projects here](https://www.cncf.io/projects/) に示されており、[CNCF Landscape はこちら](https://landscape.cncf.io/) から参照できます。
ここにはさまざまなプロジェクトがあり、各種の問題、たとえばシステムの監視、ログ処理、セキュリティ、イメージ登録、メッセージ処理などを解決することができます。
@z

@x
So, if you're new to the container landscape and cloud-native application development, welcome! Please
connect with the community, ask questions, and keep learning! We're excited to have you!
@y
そこでコンテナー事情やクラウドネイティブなアプリ開発は初めてという方も、どうぞお越しください。
ぜひコミュニティに参加して質問をあげ学び続けてください。
よろしくお願いします。
@z
