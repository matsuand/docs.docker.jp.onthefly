%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Guide to using Docker Compose in production
keywords: compose, orchestration, containers, production
title: Use Compose in production
---
@y
---
description: 本番環境で Compose を利用するためのガイド。
keywords: compose, orchestration, containers, production
title: 本番環境での Compose の利用
---
@z

@x
When you define your app with Compose in development, you can use this
definition to run your application in different environments such as CI,
staging, and production.
@y
{% comment %}
When you define your app with Compose in development, you can use this
definition to run your application in different environments such as CI,
staging, and production.
{% endcomment %}
Compose を用いたアプリの定義を開発環境で行っていたら、その定義を別の環境に、たとえば継続インテグレーション（CI）、ステージング環境、本番環境に適用することができます。
@z

@x
The easiest way to deploy an application is to run it on a single server,
similar to how you would run your development environment. If you want to scale
up your application, you can run Compose apps on a Swarm cluster.
@y
{% comment %}
The easiest way to deploy an application is to run it on a single server,
similar to how you would run your development environment. If you want to scale
up your application, you can run Compose apps on a Swarm cluster.
{% endcomment %}
アプリケーションをデプロイする一番簡単な方法は、一つのサーバー上で動作させることです。
ちょうど開発環境で動作させている方法に近いものです。
アプリケーションをスケールアップしたいなら、Compose アプリをスウォームクラスター上で実行する方法もあります。
@z

@x
### Modify your Compose file for production
@y
{% comment %}
### Modify your Compose file for production
{% endcomment %}
### 本番環境向け Compose ファイルの修正
{: #modify-your-compose-file-for-production }
@z

@x
You probably need to make changes to your app configuration to make it ready for
production. These changes may include:
@y
{% comment %}
You probably need to make changes to your app configuration to make it ready for
production. These changes may include:
{% endcomment %}
アプリケーションの設定を本番環境向けにするには、変更を要するかもしれません。
その変更とは以下のようなものです。
@z

@x
- Removing any volume bindings for application code, so that code stays inside
  the container and can't be changed from outside
- Binding to different ports on the host
- Setting environment variables differently, such as reducing the verbosity of
  logging, or to specify settings for external services such as an email server
- Specifying a restart policy like `restart: always` to avoid downtime
- Adding extra services such as a log aggregator
@y
{% comment %}
- Removing any volume bindings for application code, so that code stays inside
  the container and can't be changed from outside
- Binding to different ports on the host
- Setting environment variables differently, such as reducing the verbosity of
  logging, or to specify settings for external services such as an email server
- Specifying a restart policy like `restart: always` to avoid downtime
- Adding extra services such as a log aggregator
{% endcomment %}
- アプリケーションコードからボリュームバインディングは削除します。
  コードは内部のみで実現するようにし、外部から変更されないようにします。
- ホスト上のポートは別のものを割り当てます。
- 環境変数は区別して割り当てます。
  たとえば冗長なログ出力が不要な場合にログレベルを下げるとか、メールサーバーのような外部サーバーの設定を行うなど。
- 再起動ポリシーを設定します。
  例えば `restart: always` とすることで、システムダウンの時間を減らします。
- ログ収集といったような追加サービスを設定します。
@z

@x
For this reason, consider defining an additional Compose file, say
`production.yml`, which specifies production-appropriate
configuration. This configuration file only needs to include the changes you'd
like to make from the original Compose file. The additional Compose file
can be applied over the original `docker-compose.yml` to create a new configuration.
@y
{% comment %}
For this reason, consider defining an additional Compose file, say
`production.yml`, which specifies production-appropriate
configuration. This configuration file only needs to include the changes you'd
like to make from the original Compose file. The additional Compose file
can be applied over the original `docker-compose.yml` to create a new configuration.
{% endcomment %}
このようなことがあるので、追加の Compose ファイルとしてたとえば `production.yml` といったものを用意して、そこに本番環境固有の設定を行うことを考えておきましょう。
この設定ファイルには、元の Compose ファイルに対して変更したい内容のみを含めておけばよいことになります。
つまりこの追加ファイルは、元々の `docker-compose.yml` にさらに設定を追加して、新たな設定を作り出すものとなるわけです。
@z

@x
Once you've got a second configuration file, tell Compose to use it with the
`-f` option:
@y
{% comment %}
Once you've got a second configuration file, tell Compose to use it with the
`-f` option:
{% endcomment %}
このような 2 つめの設定ファイルを用意したら Compose に対してこれを利用するために `-f` オプションを用います。
@z

@x
    docker-compose -f docker-compose.yml -f production.yml up -d
@y
    docker-compose -f docker-compose.yml -f production.yml up -d
@z

@x
See [Using multiple compose files](extends.md#different-environments) for a more
complete example.
@y
{% comment %}
See [Using multiple compose files](extends.md#different-environments) for a more
complete example.
{% endcomment %}
より詳細な例は、[複数 compose ファイルの利用](extends.md#different-environments)を参照してください。
@z

@x
### Deploying changes
@y
{% comment %}
### Deploying changes
{% endcomment %}
### アプリ変更後のデプロイ
{: #deploying-changes }
@z

@x
When you make changes to your app code, remember to rebuild your image and
recreate your app's containers. To redeploy a service called
`web`, use:
@y
{% comment %}
When you make changes to your app code, remember to rebuild your image and
recreate your app's containers. To redeploy a service called
`web`, use:
{% endcomment %}
アプリコードに変更を加えたら、イメージを再ビルドし、アプリのコンテナーを再生成することを忘れないでください。
`web` というサービスを再デプロイするには以下のようにします。
@z

@x
    $ docker-compose build web
    $ docker-compose up --no-deps -d web
@y
    $ docker-compose build web
    $ docker-compose up --no-deps -d web
@z

@x
This first rebuilds the image for `web` and then stop, destroy, and recreate
*just* the `web` service. The `--no-deps` flag prevents Compose from also
recreating any services which `web` depends on.
@y
{% comment %}
This first rebuilds the image for `web` and then stop, destroy, and recreate
*just* the `web` service. The `--no-deps` flag prevents Compose from also
recreating any services which `web` depends on.
{% endcomment %}
はじめに `web` のイメージを再ビルドし、次に `web` サービス**のみ**を停止、破棄、再生成します。
`--no-deps` フラグは `web` サービスが依存している他のサービスを再生成しないことを指示しています。
@z

@x
### Running Compose on a single server
@y
{% comment %}
### Running Compose on a single server
{% endcomment %}
### 単一サーバー上での Compose の実行
{: #running-compose-on-a-single-server }
@z

@x
You can use Compose to deploy an app to a remote Docker host by setting the
`DOCKER_HOST`, `DOCKER_TLS_VERIFY`, and `DOCKER_CERT_PATH` environment variables
appropriately. For tasks like this,
[Docker Machine](../machine/overview.md) makes managing local and
remote Docker hosts very easy, and is recommended even if you're not deploying
remotely.
@y
{% comment %}
You can use Compose to deploy an app to a remote Docker host by setting the
`DOCKER_HOST`, `DOCKER_TLS_VERIFY`, and `DOCKER_CERT_PATH` environment variables
appropriately. For tasks like this,
[Docker Machine](../machine/overview.md) makes managing local and
remote Docker hosts very easy, and is recommended even if you're not deploying
remotely.
{% endcomment %}
Compose を使って、リモートの Docker ホストへアプリをデプロイすることができます。
これを行うには `DOCKER_HOST`、`DOCKER_TLS_VERIFY`、`DOCKER_CERT_PATH` という各環境変数を適切に設定します。
この作業を行うにあたっては  [Docker Machine](../machine/overview.md) を用いれば、Docker ホストがローカルでもリモートでも簡単に管理することができます。
リモートへのデプロイを行うことがない場合でも、このツールを用いることをお勧めします。
@z

@x
Once you've set up your environment variables, all the normal `docker-compose`
commands work with no further configuration.
@y
{% comment %}
Once you've set up your environment variables, all the normal `docker-compose`
commands work with no further configuration.
{% endcomment %}
環境変数を設定していれば、他になにかを設定する必要はなく、通常の `docker-compose` コマンドを使っていくことができます。
@z

@x
### Running Compose on a Swarm cluster
@y
{% comment %}
### Running Compose on a Swarm cluster
{% endcomment %}
### スウォームクラスター上での Compose の実行
{: #running-compose-on-a-swarm-cluster }
@z

@x
[Docker Swarm](../swarm/overview.md), a Docker-native clustering
system, exposes the same API as a single Docker host, which means you can use
Compose against a Swarm instance and run your apps across multiple hosts.
@y
{% comment %}
[Docker Swarm](../swarm/overview.md), a Docker-native clustering
system, exposes the same API as a single Docker host, which means you can use
Compose against a Swarm instance and run your apps across multiple hosts.
{% endcomment %}
[Docker Swarm](../swarm/overview.md) は Docker のネイティブなクラスターシステムです。
単一 Docker ホストと同様の API を提供します。
つまりスウォームインタンスに対しても Compose を利用することができ、また複数ホストにわたってアプリを実行することができるということです。
@z

@x
Read more about the Compose/Swarm integration in the
[integration guide](swarm.md).
@y
{% comment %}
Read more about the Compose/Swarm integration in the
[integration guide](swarm.md).
{% endcomment %}
Compose と Swarm の統合に関しては、[統合に関する説明](swarm.md)を確認してください。
@z

@x
## Compose documentation
@y
{% comment %}
## Compose documentation
{% endcomment %}
## Compose ドキュメント
{: #compose-documentation }
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
{% comment %}
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
{% endcomment %}
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [はじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
