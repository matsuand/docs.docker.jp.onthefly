%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Engine
keywords: Engine
redirect_from:
- /edge/
- /engine/ce-ee-node-activate/
- /engine/misc/
- /linux/
- /manuals/ # TODO remove this redirect after we've created a landing page for the product manuals section
title: Docker Engine overview
---
@y
---
description: Engine
keywords: Engine
redirect_from:
- /edge/
- /engine/ce-ee-node-activate/
- /engine/misc/
- /linux/
- /manuals/ # TODO remove this redirect after we've created a landing page for the product manuals section
title: Docker Engine 概要
---
@z

@x
Docker Engine is an open source containerization technology for building and
containerizing your applications. Docker Engine acts as a client-server
application with:
@y
{% comment %}
Docker Engine is an open source containerization technology for building and
containerizing your applications. Docker Engine acts as a client-server
application with:
{% endcomment %}
Docker Engine はオープンソースによるコンテナー技術であり、アプリケーションの構築とコンテナー化を行います。
Docker Engine はクライアントサーバーアプリケーションとして動作し、以下を提供します。
@z

@x
* A server with a long-running daemon process [`dockerd`](/engine/reference/commandline/dockerd).
* APIs which specify interfaces that programs can use to talk to and
  instruct the Docker daemon.
* A command line interface (CLI) client [`docker`](/engine/reference/commandline/cli/).
@y
{% comment %}
* A server with a long-running daemon process [`dockerd`](/engine/reference/commandline/dockerd).
* APIs which specify interfaces that programs can use to talk to and
  instruct the Docker daemon.
* A command line interface (CLI) client [`docker`](/engine/reference/commandline/cli/).
{% endcomment %}
* デーモンプロセス [`dockerd`](/engine/reference/commandline/dockerd) を長期にわたって動作させるサーバー。
* アプリケーションプログラムが Docker デーモンとやりとりしたり指示したりするためのインターフェースとなる API。
* コマンドラインインターフェース (CLI) クライアントである [`docker`](/engine/reference/commandline/cli/)。
@z

@x
The CLI uses [Docker APIs](api/index.md) to control or interact with the Docker
daemon through scripting or direct CLI commands. Many other Docker applications
use the underlying API and CLI. The daemon creates and manage Docker objects,
such as images, containers, networks, and volumes.
@y
{% comment %}
The CLI uses [Docker APIs](api/index.md) to control or interact with the Docker
daemon through scripting or direct CLI commands. Many other Docker applications
use the underlying API and CLI. The daemon creates and manage Docker objects,
such as images, containers, networks, and volumes.
{% endcomment %}
CLI は [Docker APIs](api/index.md) を利用して、Docker デーモンの制御ややりとりを行います。
これはスクリプト処理や CLI コマンドの直接操作によって行います。
これ以外の Docker アプリケーションの多くが API や CLI を利用しています。
デーモンからは、イメージ、コンテナー、ネットワーク、ボリュームといった Docker オブジェクトが生成され管理されます。
@z

@x
For more details, see [Docker Architecture](../get-started/overview.md#docker-architecture).
@y
{% comment %}
For more details, see [Docker Architecture](../get-started/overview.md#docker-architecture).
{% endcomment %}
詳細は [Docker アーキテクチャー](../get-started/overview.md#docker-architecture) を参照してください。
@z

@x
## Docker user guide
@y
{% comment %}
## Docker user guide
{% endcomment %}
{: #docker-user-guide }
## Docker ユーザーガイド
@z

@x
To learn about Docker in more detail and to answer questions about usage and
implementation, check out the [overview page in "get started"](../get-started/overview.md).
@y
{% comment %}
To learn about Docker in more detail and to answer questions about usage and
implementation, check out the [overview page in "get started"](../get-started/overview.md).
{% endcomment %}
Docker をより詳細に勉強したり、利用方法や開発に関する疑問を解決したりするために ["はじめよう" の概要ページ](../get-started/overview.md) を参照してください。
@z

@x
## Installation guides
@y
{% comment %}
## Installation guides
{% endcomment %}
{: #installation-guides }
## インストールガイド
@z

@x
The [installation section](install/index.md) shows you how to install Docker
on a variety of platforms.
@y
{% comment %}
The [installation section](install/index.md) shows you how to install Docker
on a variety of platforms.
{% endcomment %}
[インストール](install/index.md) の説明において、各種プラットフォーム向けに Docker のインストール方法を示しています。
@z

@x
## Release notes
@y
{% comment %}
## Release notes
{% endcomment %}
{: #release-notes }
## リリースノート
@z

@x
A summary of the changes in each release in the current series can now be found
on the separate [Release Notes page](release-notes/index.md)
@y
{% comment %}
A summary of the changes in each release in the current series can now be found
on the separate [Release Notes page](release-notes/index.md)
{% endcomment %}
現行シリーズでの各リリースの変更点概要は、別に示している [リリースノートページ](release-notes/index.md) を参照してください。
@z

@x
## Feature Deprecation Policy
@y
{% comment %}
## Feature Deprecation Policy
{% endcomment %}
{: #feature-deprecation-policy }
## 廃止決定に関するポリシー
@z

@x
As changes are made to Docker there may be times when existing features
need to be removed or replaced with newer features. Before an existing
feature is removed it is labeled as "deprecated" within the documentation
and remains in Docker for at least 3 stable releases unless specified
explicitly otherwise. After that time it may be removed.
@y
{% comment %}
As changes are made to Docker there may be times when existing features
need to be removed or replaced with newer features. Before an existing
feature is removed it is labeled as "deprecated" within the documentation
and remains in Docker for at least 3 stable releases unless specified
explicitly otherwise. After that time it may be removed.
{% endcomment %}
Docker の変更に際しては、既存機能を削除したり新機能に置き換えたりすることがあります。
既存機能を削除する際には、ドキュメント上に「廃止決定（deprecated）」としてラベルづけします。
そして特に明示のない限り、安定版リリースの最低 3 回分は、その機能を残します。
この時期を過ぎれば、その機能は削除することになります。
@z

@x
Users are expected to take note of the list of deprecated features each
release and plan their migration away from those features, and (if applicable)
towards the replacement features as soon as possible.
@y
{% comment %}
Users are expected to take note of the list of deprecated features each
release and plan their migration away from those features, and (if applicable)
towards the replacement features as soon as possible.
{% endcomment %}
各リリースにおける廃止決定機能の一覧は、よく確認しておいてください。
そしてそのような機能の廃止決定時期も確認してください。
そして（可能なら）できるだけ早くに代替機能を利用するようにしてください。
@z

@x
The complete list of deprecated features can be found on the
[Deprecated Features page](deprecated.md).
@y
{% comment %}
The complete list of deprecated features can be found on the
[Deprecated Features page](deprecated.md).
{% endcomment %}
廃止決定機能の全一覧は、[廃止となった機能](deprecated.md) のページに示しています。
@z

@x
## Licensing
@y
{% comment %}
## Licensing
{% endcomment %}
{: #licensing }
## ライセンス
@z

@x
Docker is licensed under the Apache License, Version 2.0. See
[LICENSE](https://github.com/moby/moby/blob/master/LICENSE) for the full
license text.
@y
{% comment %}
Docker is licensed under the Apache License, Version 2.0. See
[LICENSE](https://github.com/moby/moby/blob/master/LICENSE) for the full
license text.
{% endcomment %}
Docker はライセンスとして Apache License, Version 2.0 を採用しています。
ライセンス全文は [LICENSE](https://github.com/moby/moby/blob/master/LICENSE) を参照してください。
@z
