%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Summary of samples related to Compose
keywords: documentation, docs, docker, compose, samples
title: Sample apps with Compose
---
@y
---
description: Compose に関するサンプルの概要。
keywords: documentation, docs, docker, compose, samples
title: Compose を使ったサンプルアプリ
---
@z

@x
The following samples show the various aspects of how to work with Docker
Compose. As a prerequisite, be sure to [install Docker Compose](install.md)
if you have not already done so.
@y
{% comment %}
The following samples show the various aspects of how to work with Docker
Compose. As a prerequisite, be sure to [install Docker Compose](install.md)
if you have not already done so.
{% endcomment %}
以下に示すサンプルは、Docker Compose の利用によりどのような動作が行われるかを、さまざまな観点から示すものです。
前提として、まだ [Docker Compose のインストール](install.md) を行っていなければ、これを行ってください。
@z

@x
## Key concepts these samples cover
@y
{% comment %}
## Key concepts these samples cover
{% endcomment %}
{: #key-concepts-these-samples-cover }
## サンプルが示す重要な考え方
@z

@x
The samples should help you to:
@y
{% comment %}
The samples should help you to:
{% endcomment %}
このサンプルでは以下のことを行います。
@z

@x
- define services based on Docker images using
  [Compose files](compose-file/index.md) `docker-compose.yml` and
  `docker-stack.yml` files
- understand the relationship between `docker-compose.yml` and
  [Dockerfiles](/engine/reference/builder/)
- learn how to make calls to your application services from Compose files
- learn how to deploy applications and services to a [swarm](../engine/swarm/index.md)
@y
{% comment %}
- define services based on Docker images using
  [Compose files](compose-file/index.md) `docker-compose.yml` and
  `docker-stack.yml` files
- understand the relationship between `docker-compose.yml` and
  [Dockerfiles](/engine/reference/builder/)
- learn how to make calls to your application services from Compose files
- learn how to deploy applications and services to a [swarm](../engine/swarm/index.md)
{% endcomment %}
- [Compose ファイル](compose-file/index.md) である `docker-compose.yml` と `docker-stack.yml` ファイルを利用して Docker イメージにもとづくサービスを定義します。
- `docker-compose.yml` と [Dockerfiles](/engine/reference/builder/) の関係について理解します。
- Compose ファイルからアプリケーションサービスに向けて、呼び出し処理を行う方法を説明します。
- アプリケーションやサービスを [Swarm](../engine/swarm/index.md) にデプロイする方法を説明します。
@z

@x
## Samples tailored to demo Compose
@y
{% comment %}
## Samples tailored to demo Compose
{% endcomment %}
{: #samples-tailored-to-demo-compose }
## Compose のデモを含めたサンプル
@z

@x
These samples focus specifically on Docker Compose:
@y
{% comment %}
These samples focus specifically on Docker Compose:
{% endcomment %}
以下のサンプルは特に Docker Compose に着目しています。
@z

@x
- [Quickstart: Compose and Django](django.md) - Shows how to use Docker Compose to set up and run a simple Django/PostgreSQL app.
@y
{% comment %}
- [Quickstart: Compose and Django](django.md) - Shows how to use Docker Compose to set up and run a simple Django/PostgreSQL app.
{% endcomment %}
- [クイックスタート: Compose と Django](django.md) - Docker Compose を使って、簡単な Django/PostgreSQL アプリのセットアップと実行方法を示します。
@z

@x
- [Quickstart: Compose and Rails](rails.md) - Shows how to use
Docker Compose to set up and run a Rails/PostgreSQL app.
@y
{% comment %}
- [Quickstart: Compose and Rails](rails.md) - Shows how to use
Docker Compose to set up and run a Rails/PostgreSQL app.
{% endcomment %}
- [クイックスタート: Compose と Rails](rails.md) - Docker Compose を使って、Rails/PostgreSQL アプリのセットアップと実行方法を示します。
@z

@x
- [Quickstart: Compose and WordPress](wordpress.md) - Shows how to
use Docker Compose to set up and run WordPress in an isolated environment
with Docker containers.
@y
{% comment %}
- [Quickstart: Compose and WordPress](wordpress.md) - Shows how to
use Docker Compose to set up and run WordPress in an isolated environment
with Docker containers.
{% endcomment %}
- [クイックスタート: Compose と WordPress](wordpress.md) - Docker コンテナーを使って、独立した環境内にて WordPress をセットアップし実行する方法を示します。
@z
