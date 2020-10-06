%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Develop with Docker
description: Overview of developer resources
keywords: developer, developing, apps, api, sdk
---
@y
---
title: Docker を用いた開発
description: 開発リソースの概要。
keywords: developer, developing, apps, api, sdk
---
@z

@x
This page contains a list of resources for application developers who would like to build new applications using Docker.
@y
{% comment %}
This page contains a list of resources for application developers who would like to build new applications using Docker.
{% endcomment %}
このページでは、Docker を利用するアプリケーションを新規に開発しようとする開発者向けの情報を示します。
@z

@x
## Prerequisites
@y
{% comment %}
## Prerequisites
{% endcomment %}
{: #prerequisites }
## 前提条件
@z

@x
Work through the learning modules in [Get started](../get-started/index.md) to understand how to build an image and run it as a containerized application.
@y
{% comment %}
Work through the learning modules in [Get started](../get-started/index.md) to understand how to build an image and run it as a containerized application.
{% endcomment %}
[Docker をはじめよう](../get-started/index.md) の各パートを学習し、イメージのビルド方法やコンテナー化アプリケーションの実行方法について理解してください。
@z

@x
## Develop new apps on Docker
@y
{% comment %}
## Develop new apps on Docker
{% endcomment %}
{: #develop-new-apps-on-docker }
## Docker 上での新たなアプリ開発
@z

@x
If you're just getting started developing a brand new app on Docker, check out
these resources to understand some of the most common patterns for getting the
most benefits from Docker.
@y
{% comment %}
If you're just getting started developing a brand new app on Docker, check out
these resources to understand some of the most common patterns for getting the
most benefits from Docker.
{% endcomment %}
Docker を使って新しいアプリを開発しようとしている方は、以下のような情報を確認し、Docker を効率よく利用する開発パターンについて理解してください。
@z

@x
- Use [multi-stage builds](develop-images/multistage-build.md){: target="_blank" class="_"} to keep your images lean
- Manage application data using [volumes](../storage/volumes.md) and [bind mounts](../storage/bind-mounts.md){: target="_blank" class="_"}
- [Scale your app with Kubernetes](../get-started/kube-deploy.md){: target="_blank" class="_"} 
- [Scale your app as a Swarm service](../get-started/swarm-deploy.md){: target="_blank" class="_"} 
- [General application development best practices](dev-best-practices.md){: target="_blank" class="_"}
@y
{% comment %}
- Use [multi-stage builds](develop-images/multistage-build.md){: target="_blank" class="_"} to keep your images lean
- Manage application data using [volumes](../storage/volumes.md) and [bind mounts](../storage/bind-mounts.md){: target="_blank" class="_"}
- [Scale your app with Kubernetes](../get-started/kube-deploy.md){: target="_blank" class="_"} 
- [Scale your app as a Swarm service](../get-started/swarm-deploy.md){: target="_blank" class="_"} 
- [General application development best practices](dev-best-practices.md){: target="_blank" class="_"}
{% endcomment %}
- [マルチステージビルド](develop-images/multistage-build.md){: target="_blank" class="_"} を利用して、イメージをスリムなものにしてください。
- アプリケーションデータは [ボリューム](..//storage/volumes.md) や [バインドマウント](../storage/bind-mounts.md){: target="_blank" class="_"} を利用して管理してください。
- [kubernetes を用いたアプリのスケール変更](../get-started/kube-deploy.md){: target="_blank" class="_"}
- [swarm サービスにおけるアプリのスケール変更](../get-started/swarm-deploy.md){: target="_blank" class="_"}
- [一般的なアプリケーション開発におけるベストプラクティス](dev-best-practices.md){: target="_blank" class="_"}
@z

@x
## Learn about language-specific app development with Docker
@y
{% comment %}
## Learn about language-specific app development with Docker
{% endcomment %}
{: #learn-about-language-specific-app-development-with-docker }
## 特定言語での Docker アプリ開発について学ぶ
@z

@x
- [Docker for Java developers lab](https://github.com/docker/labs/tree/master/developer-tools/java/){: target="_blank" class="_"} 
- [Port a node.js app to Docker lab](https://github.com/docker/labs/tree/master/developer-tools/nodejs/porting){: target="_blank" class="_"}
- [Ruby on Rails app on Docker lab](https://github.com/docker/labs/tree/master/developer-tools/ruby){: target="_blank" class="_"}
- [Dockerize a .Net Core application](../engine/examples/dotnetcore.md){: target="_blank" class="_"}
- [Dockerize an ASP.NET Core application with SQL Server on Linux](../compose/aspnet-mssql-compose.md){: target="_blank" class="_"} using Docker Compose
@y
{% comment %}
- [Docker for Java developers lab](https://github.com/docker/labs/tree/master/developer-tools/java/){: target="_blank" class="_"} 
- [Port a node.js app to Docker lab](https://github.com/docker/labs/tree/master/developer-tools/nodejs/porting){: target="_blank" class="_"}
- [Ruby on Rails app on Docker lab](https://github.com/docker/labs/tree/master/developer-tools/ruby){: target="_blank" class="_"}
- [Dockerize a .Net Core application](../engine/examples/dotnetcore.md){: target="_blank" class="_"}
- [Dockerize an ASP.NET Core application with SQL Server on Linux](../compose/aspnet-mssql-compose.md){: target="_blank" class="_"} using Docker Compose
{% endcomment %}
- Java 開発者向けの [Docker for Java developers ラボ](https://github.com/docker/labs/tree/master/developer-tools/java/){: target="_blank" class="_"}
- [node.js アプリの Docker ラボへのポート](https://github.com/docker/labs/tree/master/developer-tools/nodejs/porting){: target="_blank" class="_"}
- [Docker ラボの Ruby on Rails アプリ](https://github.com/docker/labs/tree/master/developer-tools/ruby){: target="_blank" class="_"}
- [.Net Core アプリケーションの Docker 化](../engine/examples/dotnetcore.md){: target="_blank" class="_"}
- Docker Compose 利用により [SQL Server on Linux を用いた ASP.NET Core アプリケーションの Docker 化](../compose/aspnet-mssql-compose.md){: target="_blank" class="_"}
@z

@x
## Advanced development with the SDK or API
@y
{% comment %}
## Advanced development with the SDK or API
{% endcomment %}
{: #advanced-development-with-the-sdk-or-api }
## SDK や API を用いた応用的な開発
@z

@x
After you can write Dockerfiles or Compose files and use Docker CLI, take it to the next level by using Docker Engine SDK for Go/Python or use the HTTP API directly.
@y
{% comment %}
After you can write Dockerfiles or Compose files and use Docker CLI, take it to the next level by using Docker Engine SDK for Go/Python or use the HTTP API directly.
{% endcomment %}
Dockerfiles や Compose ファイルの記述や Docker CLI の利用に慣れてきたら、次のレベルとして Docker Engine SDK for Go/Python や HTTP API を直接操作してみましょう。
@z
