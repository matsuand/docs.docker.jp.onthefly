%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Deploy your app to the cloud"
keywords: deploy, ACI, ECS, Python, local, development
description: Learn how to deploy your application to the cloud.
---
@y
---
title: "クラウドへのアプリのデプロイ"
keywords: deploy, ACI, ECS, Python, local, development
description: Learn how to deploy your application to the cloud.
---
@z

@x
{% include_relative nav.html selected="5" %}
@y
{% include_relative nav.html selected="5" %}
@z

@x
Now, that we have configured a CI/CD pipleline, let's look at how we can deploy the application to cloud. Docker supports deploying containers on Azure ACI and AWS ECS.
@y
これまでに CI/CD パイプラインを設定してきたので、アプリケーションをクラウドにデプロイする方法を見ていきます。
Docker では Azure ACI と AWS ECS へのコンテナーのデプロイをサポートしています。
@z

@x
## Docker and ACI
@y
{: #docker-and-aci }
## Docker と ACI
@z

@x
The Docker Azure Integration enables developers to use native Docker commands to run applications in Azure Container Instances (ACI) when building cloud-native applications. The new experience provides a tight integration between Docker Desktop and Microsoft Azure allowing developers to quickly run applications using the Docker CLI or VS Code extension, to switch seamlessly from local development to cloud deployment.
@y
Docker Azure 統合環境は、クラウドネイティブなアプリケーションの構築のために、開発者がネイティブな Docker コマンドを使って Azure コンテナーインスタンス（Azure Container Instances; ACI）内でのアプリケーション実行を可能にするものです。
この新たな仕組みを通じて Docker Desktop と Microsoft Azure が緊密に連携し、Docker CLI や VS コード拡張を用いて、開発者がすばやくアプリケーションを実行することができます。
またローカル環境からクラウドデプロイに向けてのシームレスな切り替えも実現します。
@z

@x
For detailed instructions, see [Deploying Docker containers on Azure](../../cloud/aci-integration.md).
@y
詳しい手順については [Azure での Docker コンテナーのデプロイ](../../cloud/aci-integration.md) を参照してください。
@z

@x
## Docker and ECS
@y
{: #docker-and-ecs }
## Docker と ECS
@z

@x
The Docker ECS Integration enables developers to use native Docker commands in Docker Compose CLI to run applications in Amazon EC2 Container Service (ECS) when building cloud-native applications.
@y
Docker ECS 統合環境は、クラウドネイティブなアプリケーション構築のために、開発者がネイティブな Docker コマンドを使って Amazon EC2 コンテナーサービス（Amazon EC2 Container Service; ECS）内でのアプリケーション実行を可能にするものです。
@z

@x
The integration between Docker and Amazon ECS allows developers to use the Docker Compose CLI to set up an AWS context in one Docker command, allowing you to switch from a local context to a cloud context and run applications quickly and easily simplify multi-container application development on Amazon ECS using Compose files.
@y
Docker と Amazon ECS の統合により、開発者は Docker Compose CLI を使って、ただ 1 つの Docker コマンドから AWS コンテキストが生成できます。
またローカルコンテキストからクラウドコンテキストへの切り替えを通じて、アプリケーションをすばやく実行できます。
また Compose ファイル利用によって、Amazon ECS 上でのマルチコンテナー化したアプリケーション開発を容易にします。
@z

@x
For detailed instructions, see [Deploying Docker containers on ECS](../../cloud/ecs-integration.md).
@y
詳しい手順については [ECS での Docker コンテナーのデプロイ](../../cloud/ecs-integration.md) を参照してください。
@z

@x
## Feedback
@y
{: #feedback } 
## フィードバック
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Python%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
本トピック改善のためにフィードバックをお寄せください。
お気づきの点があれば [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Python%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} の GitHub リポジトリに issue をあげてください。
あるいは [PR の生成](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} により変更の提案を行ってください。
@z

@x
<br />
@y
<br />
@z
