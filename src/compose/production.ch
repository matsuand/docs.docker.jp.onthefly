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
Compose を用いたアプリの定義を開発環境で行っていたら、その定義を別の環境に、たとえば継続インテグレーション（CI）、ステージング環境、本番環境に適用することができます。
@z

@x
The easiest way to deploy an application is to run it on a single server,
similar to how you would run your development environment. If you want to scale
up your application, you can run Compose apps on a Swarm cluster.
@y
アプリケーションをデプロイする一番簡単な方法は、一つのサーバー上で動作させることです。
ちょうど開発環境で動作させている方法に近いものです。
アプリケーションをスケールアップしたいなら、Compose アプリをスウォームクラスター上で実行する方法もあります。
@z

@x
### Modify your Compose file for production
@y
### 本番環境向け Compose ファイルの修正
{: #modify-your-compose-file-for-production }
@z

@x
You probably need to make changes to your app configuration to make it ready for
production. These changes may include:
@y
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
- アプリケーションコードからボリュームバインディングは削除します。
  コードは内部のみで実現するようにし、外部から変更されないようにします。
- ホスト上のポートは別のものを割り当てます。
- 環境変数は区別して割り当てます。
  たとえば冗長なログ出力が不要な場合にログレベルを下げるとか、メールサーバーのような外部サーバーの設定を行うなど。
- 再起動ポリシーを設定します。
  たとえば`restart: always`とすることで、システムダウンの時間を減らします。
- ログ収集といったような追加サービスを設定します。
@z

@x
For this reason, consider defining an additional Compose file, say
`production.yml`, which specifies production-appropriate
configuration. This configuration file only needs to include the changes you'd
like to make from the original Compose file. The additional Compose file
can be applied over the original `docker-compose.yml` to create a new configuration.
@y
このようなことがあるので、追加の Compose ファイルとしてたとえば`production.yml`といったものを用意して、そこに本番環境固有の設定を行うことを考えておきましょう。
この設定ファイルには、元の Compose ファイルに対して変更したい内容のみを含めておけばよいことになります。
つまりこの追加ファイルは、元々の`docker-compose.yml`にさらに設定を追加して、新たな設定を作り出すものとなるわけです。
@z

@x
Once you've got a second configuration file, tell Compose to use it with the
`-f` option:
@y
このような 2 つめの設定ファイルを用意したら Compose に対してこれを利用するために`-f`オプションを用います。
@z

@x
```console
$ docker-compose -f docker-compose.yml -f production.yml up -d
```
@y
```console
$ docker-compose -f docker-compose.yml -f production.yml up -d
```
@z

@x
See [Using multiple compose files](extends.md#different-environments) for a more
complete example.
@y
より詳細な例は、[複数 compose ファイルの利用](extends.md#different-environments)を参照してください。
@z

@x
### Deploying changes
@y
### アプリ変更後のデプロイ
{: #deploying-changes }
@z

@x
When you make changes to your app code, remember to rebuild your image and
recreate your app's containers. To redeploy a service called
`web`, use:
@y
アプリコードに変更を加えたら、イメージを再ビルドし、アプリのコンテナーを再生成することを忘れないでください。
`web`というサービスを再デプロイするには以下のようにします。
@z

@x
```console
$ docker-compose build web
$ docker-compose up --no-deps -d web
```
@y
```console
$ docker-compose build web
$ docker-compose up --no-deps -d web
```
@z

@x
This first rebuilds the image for `web` and then stop, destroy, and recreate
*just* the `web` service. The `--no-deps` flag prevents Compose from also
recreating any services which `web` depends on.
@y
はじめに`web`のイメージを再ビルドし、次に`web`サービス**のみ**を停止、破棄、再生成します。
`--no-deps`フラグは`web`サービスが依存している他のサービスを再生成しないことを指示しています。
@z

@x
### Running Compose on a single server
@y
### 単一サーバー上での Compose の実行
{: #running-compose-on-a-single-server }
@z

@x
You can use Compose to deploy an app to a remote Docker host by setting the
`DOCKER_HOST`, `DOCKER_TLS_VERIFY`, and `DOCKER_CERT_PATH` environment variables
appropriately.
@y
Compose を使って、リモートの Docker ホストへアプリをデプロイすることができます。
これを行うには`DOCKER_HOST`、`DOCKER_TLS_VERIFY`、`DOCKER_CERT_PATH`という各環境変数を適切に設定します。
@z

@x
Once you've set up your environment variables, all the normal `docker-compose`
commands work with no further configuration.
@y
環境変数を設定していれば、他になにかを設定する必要はなく、通常の`docker-compose`コマンドを使っていくことができます。
@z

@x
## Compose documentation
@y
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
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [はじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
