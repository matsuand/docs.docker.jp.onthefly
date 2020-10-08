%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Introduction and Overview of Compose
keywords: documentation, docs, docker, compose, orchestration, containers
title: Overview of Docker Compose
redirect_from:
 - /compose/overview/
 - /compose/swarm/
---
@y
---
description: Introduction and Overview of Compose
keywords: documentation, docs, docker, compose, orchestration, containers
title: Docker Compose の概要
redirect_from:
 - /compose/overview/
 - /compose/swarm/
---
@z

@x
>**Looking for Compose file reference?** [Find the latest version here](compose-file/index.md).
@y
{% comment %}
>**Looking for Compose file reference?** [Find the latest version here](compose-file/index.md).
{% endcomment %}
>**Compose ファイルリファレンスをお探しですか？**
>
その場合は[最新版がこちら](compose-file/index.md)。
@z

@x
Compose is a tool for defining and running multi-container Docker applications.
With Compose, you use a YAML file to configure your application's services.
Then, with a single command, you create and start all the services
from your configuration. To learn more about all the features of Compose,
see [the list of features](#features).
@y
{% comment %}
Compose is a tool for defining and running multi-container Docker applications.
With Compose, you use a YAML file to configure your application's services.
Then, with a single command, you create and start all the services
from your configuration. To learn more about all the features of Compose,
see [the list of features](#features).
{% endcomment %}
Compose とは、複数のコンテナーを定義し実行する Docker アプリケーションのためのツールです。
Compose においては YAML ファイルを使ってアプリケーションサービスの設定を行います。
コマンドを 1 つ実行するだけで、設定内容に基づいたアプリケーションサービスの生成、起動を行います。
Compose の機能に関する詳細は、[機能一覧](#features) を参照してください。
@z

@x
Compose works in all environments: production, staging, development, testing, as
well as CI workflows. You can learn more about each case in [Common Use
Cases](#common-use-cases).
@y
{% comment %}
Compose works in all environments: production, staging, development, testing, as
well as CI workflows. You can learn more about each case in [Common Use
Cases](#common-use-cases).
{% endcomment %}
Compose は本番環境、ステージング環境、開発環境において動作し、CI ワークフローとしても利用することができます。
それぞれの使い方については、[一般的な利用例](#common-use-cases)を確認してください。
@z

@x
Using Compose is basically a three-step process:
@y
{% comment %}
Using Compose is basically a three-step process:
{% endcomment %}
Compose を使うには、基本的に 3 つのステップを踏みます。
@z

@x
1. Define your app's environment with a `Dockerfile` so it can be reproduced
anywhere.
@y
{% comment %}
1. Define your app's environment with a `Dockerfile` so it can be reproduced
anywhere.
{% endcomment %}
1. アプリケーション環境を `Dockerfile` に定義します。
   これによりその環境は再構築が可能となります。
@z

@x
2. Define the services that make up your app in `docker-compose.yml`
so they can be run together in an isolated environment.
@y
{% comment %}
2. Define the services that make up your app in `docker-compose.yml`
so they can be run together in an isolated environment.
{% endcomment %}
2. アプリケーションを構成するサービスを `docker-compose.yml` ファイル内に定義します。
   各サービスは独立した環境において起動することになります。
@z

@x
3. Run `docker-compose up` and Compose starts and runs your entire app.
@y
{% comment %}
3. Run `docker-compose up` and Compose starts and runs your entire app.
{% endcomment %}
3. 最後に `docker-compose up` を実行したら、Compose はアプリケーション全体を起動、実行します。
@z

@x
A `docker-compose.yml` looks like this:
@y
{% comment %}
A `docker-compose.yml` looks like this:
{% endcomment %}
`docker-compose.yml` は次のように記述します。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - .:/code
      - logvolume01:/var/log
    links:
      - redis
  redis:
    image: redis
volumes:
  logvolume01: {}
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - .:/code
      - logvolume01:/var/log
    links:
      - redis
  redis:
    image: redis
volumes:
  logvolume01: {}
```
@z

@x
For more information about the Compose file, see the
[Compose file reference](compose-file/index.md).
@y
{% comment %}
For more information about the Compose file, see the
[Compose file reference](compose-file/index.md).
{% endcomment %}
Compose ファイルに関するさらに詳しい情報は、[Compose ファイルリファレンス](compose-file/index.md) をご覧ください。
@z

@x
Compose has commands for managing the whole lifecycle of your application:
@y
{% comment %}
Compose has commands for managing the whole lifecycle of your application:
{% endcomment %}
Compose には、アプリケーションのライフサイクルを管理するコマンドがあります。
@z

@x
 * Start, stop, and rebuild services
 * View the status of running services
 * Stream the log output of running services
 * Run a one-off command on a service
@y
 {% comment %}
 * Start, stop, and rebuild services
 * View the status of running services
 * Stream the log output of running services
 * Run a one-off command on a service
 {% endcomment %}
 * サービスの開始、停止、再構築
 * 実行中のサービスの状態を表示
 * 実行中のサービスのストリームログ出力
 * サービス上で１回限りのコマンドを実行
@z

@x
## Compose documentation
@y
{% comment %}
## Compose documentation
{% endcomment %}
## Compose のドキュメント
{: #compose-documentation }
@z

@x
- [Installing Compose](install.md)
- [Getting started with Compose](gettingstarted.md)
- [Get started with Django](django.md)
- [Get started with Rails](rails.md)
- [Get started with WordPress](wordpress.md)
- [Frequently asked questions](faq.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
@y
{% comment %}
- [Installing Compose](install.md)
- [Getting started with Compose](gettingstarted.md)
- [Get started with Django](django.md)
- [Get started with Rails](rails.md)
- [Get started with WordPress](wordpress.md)
- [Frequently asked questions](faq.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
{% endcomment %}
- [Compose のインストール](install.md)
- [Compose を使ってはじめよう](gettingstarted.md)
- [Django を使ってはじめよう](django.md)
- [Rails を使ってはじめよう](rails.md)
- [WordPress を使ってはじめよう](wordpress.md)
- [よくたずねられる質問](faq.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
@z

@x
## Features
@y
{% comment %}
## Features
{% endcomment %}
## 機能
{: #features }
@z

@x
The features of Compose that make it effective are:
@y
{% comment %}
The features of Compose that make it effective are:
{% endcomment %}
Compose には特徴的な以下の機能があります。
@z

@x
* [Multiple isolated environments on a single host](#multiple-isolated-environments-on-a-single-host)
* [Preserve volume data when containers are created](#preserve-volume-data-when-containers-are-created)
* [Only recreate containers that have changed](#only-recreate-containers-that-have-changed)
* [Variables and moving a composition between environments](#variables-and-moving-a-composition-between-environments)
@y
{% comment %}
* [Multiple isolated environments on a single host](#multiple-isolated-environments-on-a-single-host)
* [Preserve volume data when containers are created](#preserve-volume-data-when-containers-are-created)
* [Only recreate containers that have changed](#only-recreate-containers-that-have-changed)
* [Variables and moving a composition between environments](#variables-and-moving-a-composition-between-environments)
{% endcomment %}
* [1 つのホスト上で分離された環境を複数実現](#multiple-isolated-environments-on-a-single-host)
* [コンテナー生成時はボリュームデータを維持](#preserve-volume-data-when-containers-are-created)
* [変更のあったコンテナーのみ再作成](#only-recreate-containers-that-have-changed)
* [変数と環境間の移行](#variables-and-moving-a-composition-between-environments)
@z

@x
### Multiple isolated environments on a single host
@y
{% comment %}
### Multiple isolated environments on a single host
{% endcomment %}
### 1 つのホスト上で分離された環境を複数実現
{: #multiple-isolated-environments-on-a-single-host }
@z

@x
Compose uses a project name to isolate environments from each other. You can make use of this project name in several different contexts:
@y
{% comment %}
Compose uses a project name to isolate environments from each other. You can make use of this project name in several different contexts:
{% endcomment %}
Compose はプロジェクト名というものを用いて各環境を分離します。
このプロジェクト名はさまざまに異なる用途に利用することができます。
@z

@x
* on a dev host, to create multiple copies of a single environment, such as when you want to run a stable copy for each feature branch of a project
* on a CI server, to keep builds from interfering with each other, you can set
  the project name to a unique build number
* on a shared host or dev host, to prevent different projects, which may use the
  same service names, from interfering with each other
@y
{% comment %}
* on a dev host, to create multiple copies of a single environment, such as when you want to run a stable copy for each feature branch of a project
* on a CI server, to keep builds from interfering with each other, you can set
  the project name to a unique build number
* on a shared host or dev host, to prevent different projects, which may use the
  same service names, from interfering with each other
{% endcomment %}
* 開発ホスト上では 1 つの環境に対して複数のコピー作成に使います（例：プロジェクトの機能ブランチごとに、安定版のコピーを実行したい場合）。
* CI サーバー上では、お互いのビルドが干渉しないようにするため、プロジェクト名にユニークなビルド番号をセットできます。
* 共有ホストまたは開発ホスト上では、異なるプロジェクトが同じサービス名を使わないようにし、お互いを干渉しないようにします。
@z

@x
The default project name is the basename of the project directory. You can set
a custom project name by using the
[`-p` command line option](reference/overview.md) or the
[`COMPOSE_PROJECT_NAME` environment variable](reference/envvars.md#compose_project_name).
@y
{% comment %}
The default project name is the basename of the project directory. You can set
a custom project name by using the
[`-p` command line option](reference/overview.md) or the
[`COMPOSE_PROJECT_NAME` environment variable](reference/envvars.md#compose_project_name).
{% endcomment %}
プロジェクト名はデフォルトでは、プロジェクトが存在するディレクトリ名となります。
プロジェクト名を指定するには、[コマンドラインオプション](reference/overview.md) の `-p` を指定するか、[環境変数 `COMPOSE_PROJECT_NAME`](reference/envvars.md#compose_project_name) を使って指定します。
@z

@x
### Preserve volume data when containers are created
@y
{% comment %}
### Preserve volume data when containers are created
{% endcomment %}
### コンテナー生成時はボリュームデータを維持
{: #preserve-volume-data-when-containers-are-created }
@z

@x
Compose preserves all volumes used by your services. When `docker-compose up`
runs, if it finds any containers from previous runs, it copies the volumes from
the old container to the new container. This process ensures that any data
you've created in volumes isn't lost.
@y
{% comment %}
Compose preserves all volumes used by your services. When `docker-compose up`
runs, if it finds any containers from previous runs, it copies the volumes from
the old container to the new container. This process ensures that any data
you've created in volumes isn't lost.
{% endcomment %}
Compose は、サービスによって利用されているボリュームをすべて維持します。
`docker-compose up` が実行されたときに、コンテナーがそれ以前に実行されていれば、以前のコンテナーから現在のコンテナーに向けてボリュームをコピーします。
この処理において、ボリューム内に作り出されていたデータは失われることはありません。
@z

@x
If you use `docker-compose` on a Windows machine, see
[Environment variables](reference/envvars.md) and adjust the necessary environment
variables for your specific needs.
@y
{% comment %}
If you use `docker-compose` on a Windows machine, see
[Environment variables](reference/envvars.md) and adjust the necessary environment
variables for your specific needs.
{% endcomment %}
Windows 上において `docker-compose` を利用している場合には、[環境変数のページ](reference/envvars.md)を参考にし、状況に応じて必要となる環境変数を定めてください。
@z

@x
### Only recreate containers that have changed
@y
{% comment %}
### Only recreate containers that have changed
{% endcomment %}
### 変更のあったコンテナーのみ再作成
{: #only-recreate-containers-that-have-changed }
@z

@x
Compose caches the configuration used to create a container. When you
restart a service that has not changed, Compose re-uses the existing
containers. Re-using containers means that you can make changes to your
environment very quickly.
@y
{% comment %}
Compose caches the configuration used to create a container. When you
restart a service that has not changed, Compose re-uses the existing
containers. Re-using containers means that you can make changes to your
environment very quickly.
{% endcomment %}
Compose はコンテナーが生成されたときの設定情報をキャッシュに保存します。
設定内容に変更のないサービスが再起動された場合、Compose はすでにあるコンテナーを再利用します。
再利用されるということは、全体として環境への変更がすばやくできることを意味します。
@z

@x
### Variables and moving a composition between environments
@y
{% comment %}
### Variables and moving a composition between environments
{% endcomment %}
### 変数と環境間の移行
{: #variables-and-moving-a-composition-between-environments }
@z

@x
Compose supports variables in the Compose file. You can use these variables
to customize your composition for different environments, or different users.
See [Variable substitution](compose-file/index.md#variable-substitution) for more
details.
@y
{% comment %}
Compose supports variables in the Compose file. You can use these variables
to customize your composition for different environments, or different users.
See [Variable substitution](compose-file/index.md#variable-substitution) for more
details.
{% endcomment %}
Compose は Compose ファイル内での変数の利用をサポートしています。
環境変数を使い、さまざまな環境、さまざまなユーザー向けに構成をカスタマイズできます。
詳細は [環境変数のページ](compose-file/index.md#variable-substitution) をご覧ください。
@z

@x
You can extend a Compose file using the `extends` field or by creating multiple
Compose files. See [extends](extends.md) for more details.
@y
{% comment %}
You can extend a Compose file using the `extends` field or by creating multiple
Compose files. See [extends](extends.md) for more details.
{% endcomment %}
Compose ファイルは `extends` フィールドを使うことで、複数の Compose ファイルを作成できるように拡張できます。
[extends](extends.md) をご覧ください。
@z

@x
## Common use cases
@y
{% comment %}
## Common use cases
{% endcomment %}
## 一般的な利用例
{: #common-use-cases }
@z

@x
Compose can be used in many different ways. Some common use cases are outlined
below.
@y
{% comment %}
Compose can be used in many different ways. Some common use cases are outlined
below.
{% endcomment %}
Compose はさまざまな使い方があります。
一般的な利用例は、以下のとおりです。
@z

@x
### Development environments
@y
{% comment %}
### Development environments
{% endcomment %}
### 開発環境
{: #development-environments }
@z

@x
When you're developing software, the ability to run an application in an
isolated environment and interact with it is crucial. The Compose command
line tool can be used to create the environment and interact with it.
@y
{% comment %}
When you're developing software, the ability to run an application in an
isolated environment and interact with it is crucial. The Compose command
line tool can be used to create the environment and interact with it.
{% endcomment %}
ソフトウェアを開発する上で、アプリケーションを分離された環境内にて実行させ、しかも正しくアクセスできるようにすることが極めて重要です。
Compose のコマンドラインツールを用いることで、環境生成と環境へのアクセスを行うことができます。
@z

@x
The [Compose file](compose-file/index.md) provides a way to document and configure
all of the application's service dependencies (databases, queues, caches,
web service APIs, etc). Using the Compose command line tool you can create
and start one or more containers for each dependency with a single command
(`docker-compose up`).
@y
{% comment %}
The [Compose file](compose-file/index.md) provides a way to document and configure
all of the application's service dependencies (databases, queues, caches,
web service APIs, etc). Using the Compose command line tool you can create
and start one or more containers for each dependency with a single command
(`docker-compose up`).
{% endcomment %}
[Compose ファイル](compose-file/index.md) は、アプリケーションにおけるサービスの依存関係（データベース、キュー、キャッシュ、ウェブ・サービス API など）を設定するものです。
Compose コマンドラインツールを使うと、いくつでもコンテナーを生成、起動でき、しかもコマンド（`docker-compose up`）を１つ実行するだけで、依存関係も正しく考慮してくれます。
@z

@x
Together, these features provide a convenient way for developers to get
started on a project. Compose can reduce a multi-page "developer getting
started guide" to a single machine readable Compose file and a few commands.
@y
{% comment %}
Together, these features provide a convenient way for developers to get
started on a project. Compose can reduce a multi-page "developer getting
started guide" to a single machine readable Compose file and a few commands.
{% endcomment %}
さらにこういった機能は、プロジェクトに取りかかろうとしている開発者にとっても便利なものです。
Compose は、分厚く仕上がっている「開発者向け導入手順書」のページ数を減らすものになり、ただ 1 つの Compose ファイルと数えるほどのコマンドだけになります。
@z

@x
### Automated testing environments
@y
{% comment %}
### Automated testing environments
{% endcomment %}
### 自動テスト環境
{: #automated-testing-environments }
@z

@x
An important part of any Continuous Deployment or Continuous Integration process
is the automated test suite. Automated end-to-end testing requires an
environment in which to run tests. Compose provides a convenient way to create
and destroy isolated testing environments for your test suite. By defining the full environment in a [Compose file](compose-file/index.md), you can create and destroy these environments in just a few commands:
@y
{% comment %}
An important part of any Continuous Deployment or Continuous Integration process
is the automated test suite. Automated end-to-end testing requires an
environment in which to run tests. Compose provides a convenient way to create
and destroy isolated testing environments for your test suite. By defining the full environment in a [Compose file](compose-file/index.md), you can create and destroy these environments in just a few commands:
{% endcomment %}
継続的デプロイや継続的インテグレーションのプロセスにおいて、自動テストスイートは極めて重要です。
もれることなくテストを自動化させるためには、そのためのテスト環境が必要になるものです。
Compose ではテストスイートに対応して、分離されたテスト環境の生成とデプロイを便利に行う機能を提供しています。
[Compose ファイル](compose-file/index.md) 内に必要な環境定義を行っておけば、テスト環境の生成と削除は、ごく簡単なコマンドだけで実現できます。
@z

@x
```bash
$ docker-compose up -d
$ ./run_tests
$ docker-compose down
```
@y
```bash
$ docker-compose up -d
$ ./run_tests
$ docker-compose down
```
@z

@x
### Single host deployments
@y
{% comment %}
### Single host deployments
{% endcomment %}
### ただ 1 つのホストからのデプロイ
{: #single-host-deployments }
@z

@x
Compose has traditionally been focused on development and testing workflows,
but with each release we're making progress on more production-oriented features. You can use Compose to deploy to a remote Docker Engine. The Docker Engine may be a single instance provisioned with
[Docker Machine](../machine/overview.md) or an entire
[Docker Swarm](../engine/swarm/index.md) cluster.
@y
{% comment %}
Compose has traditionally been focused on development and testing workflows,
but with each release we're making progress on more production-oriented features. You can use Compose to deploy to a remote Docker Engine. The Docker Engine may be a single instance provisioned with
[Docker Machine](../machine/overview.md) or an entire
[Docker Swarm](../engine/swarm/index.md) cluster.
{% endcomment %}
Compose はこれまで、開発環境やテスト環境でのワークフローに注目してきました。
しかしリリースを重ねるにつれて、本番環境を意識した機能を充実させるように進化しています。
Compose はリモートにある Docker Engine に対してもデプロイすることができます。
Docker Engine とは、[Docker Machine](../machine/overview.md) で提供される単一インスタンスであったり、[Docker Swarm](../engine/swarm/index.md) クラスター一式である場合もあります。
@z

@x
For details on using production-oriented features, see
[compose in production](production.md) in this documentation.
@y
{% comment %}
For details on using production-oriented features, see
[compose in production](production.md) in this documentation.
{% endcomment %}
本番環境向け機能の使い方については、[本番環境における Compose](production.md) をご覧ください。
@z

@x
## Release notes
@y
{% comment %}
## Release notes
{% endcomment %}
## リリースノート
{: #release-notes }
@z

@x
To see a detailed list of changes for past and current releases of Docker
Compose, refer to the
[CHANGELOG](https://github.com/docker/compose/blob/master/CHANGELOG.md).
@y
{% comment %}
To see a detailed list of changes for past and current releases of Docker
Compose, refer to the
[CHANGELOG](https://github.com/docker/compose/blob/master/CHANGELOG.md).
{% endcomment %}
Docker Compose のこれまでのリリースにおける変更点の一覧は [CHANGELOG](https://github.com/docker/compose/blob/master/CHANGELOG.md) から確認することができます。
@z

@x
## Getting help
@y
{% comment %}
## Getting help
{% endcomment %}
## ヘルプを得るには
{: #getting-help }
@z

@x
Docker Compose is under active development. If you need help, would like to
contribute, or simply want to talk about the project with like-minded
individuals, we have a number of open channels for communication.
@y
{% comment %}
Docker Compose is under active development. If you need help, would like to
contribute, or simply want to talk about the project with like-minded
individuals, we have a number of open channels for communication.
{% endcomment %}
Docker Compose は活発に開発中です。
ヘルプが必要な場合、貢献したい場合、あるいはプロジェクトの仲間と話をしたい場合、コミュニケーションができるオープンチャネルがたくさんあｒます。
@z

@x
* To report bugs or file feature requests: use the [issue tracker on Github](https://github.com/docker/compose/issues).
@y
{% comment %}
* To report bugs or file feature requests: use the [issue tracker on Github](https://github.com/docker/compose/issues).
{% endcomment %}
* バグ報告や機能リクエストは [GitHub の issue トラッカー](https://github.com/docker/compose/issues)をご利用ください。
@z

@x
* To talk about the project with people in real time: join the
  `#docker-compose` channel on the Docker Community Slack.
@y
{% comment %}
* To talk about the project with people in real time: join the
  `#docker-compose` channel on the Docker Community Slack.
{% endcomment %}
* プロジェクトのメンバーとリアルタイムに会話したければ、Docker Community Slack の `#docker-compose` チャネルに参加してください。
@z

@x
* To contribute code or documentation changes: submit a [pull request on Github](https://github.com/docker/compose/pulls).
@y
{% comment %}
* To contribute code or documentation changes: submit a [pull request on Github](https://github.com/docker/compose/pulls).
{% endcomment %}
* コードやドキュメントの変更に貢献したい場合は、[GitHub にプルリクエスト](https://github.com/docker/compose/pulls)を送ってください。
@z
