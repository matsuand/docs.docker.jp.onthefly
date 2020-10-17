%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Download rate limit
keywords: Docker, pull requests, download, limit,
title: Download rate limit
---
@y
---
description: Download rate limit
keywords: Docker, pull requests, download, limit,
title: ダウンロードレート制限
---
@z

@x
Docker has enabled download rate limits for pull requests on 
Docker Hub. Limits are determined based on the account type. 
For more information, see [Docker Hub Pricing](https://hub.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
Docker has enabled download rate limits for pull requests on 
Docker Hub. Limits are determined based on the account type. 
For more information, see [Docker Hub Pricing](https://hub.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
Docker では Docker Hub 上でのプルリクエストに対して、ダウンロードレート制限を有効化してきました。
この制限はアカウントの種類により決定されます。
詳しくは [Docker Hub Pricing](https://hub.docker.com/pricing){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
A user's limit will be equal to the highest entitlement of their
personal account or any organization they belong to. To take 
advantage of this, you must log into 
[Docker Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_"} 
as an authenticated user. For more information, see
[How do I authenticate pull requests](#how-do-i-authenticate-pull-requests). 
Unauthenticated (anonymous) users will have the limits enforced via IP.
@y
{% comment %}
A user's limit will be equal to the highest entitlement of their
personal account or any organization they belong to. To take 
advantage of this, you must log into 
[Docker Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_"} 
as an authenticated user. For more information, see
[How do I authenticate pull requests](#how-do-i-authenticate-pull-requests). 
Unauthenticated (anonymous) users will have the limits enforced via IP.
{% endcomment %}
ユーザーへの制限というのは、個人アカウントやこれが所属する組織に対しての、最大限の資格を意味します。
これを利用するためには [Docker Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_"} に対して、認証されたユーザーとしてログインしなければなりません。
[プルリクエストの認証方法](#how-do-i-authenticate-pull-requests) を参照してください。
認証されていない（匿名）ユーザーは、IP を通じて制限が課せられます。
@z

@x
- A pull request is defined as up to two `GET` requests on registry 
manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a 
single manifest request.
- A pull request for a multi-arch image makes two 
manifest requests. 
- `HEAD` requests are not counted. 
- Limits are applied based on the user doing the pull, and 
not based on the image being pulled or its owner.
@y
{% comment %}
- A pull request is defined as up to two `GET` requests on registry 
manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a 
single manifest request.
- A pull request for a multi-arch image makes two 
manifest requests. 
- `HEAD` requests are not counted. 
- Limits are applied based on the user doing the pull, and 
not based on the image being pulled or its owner.
{% endcomment %}
- プルリクエストとは、Registry マニフェスト URL（`/v2/*/manifests/*`）において、最大 2 つの `GET` リクエストとして定義されています。
- 通常のイメージプルは、単一のマニフェストリクエストを行います。
- マルチアーキテクチャーイメージに対するプルリクエストは、2 つのマニフェストリクエストを行います。
- `HEAD` リクエストは数に含めません。
- 制限は、プルを行うユーザーに対して適用されます。
  プルされたイメージやその所有者に対して適用されるものではありません。
@z

@x
Docker will gradually introduce these rate limits, with full
effects starting from November 1st, 2020.
@y
{% comment %}
Docker will gradually introduce these rate limits, with full
effects starting from November 1st, 2020.
{% endcomment %}
Docker においてこのレート制限は徐々に導入され、完全な動作となったのは 2020 年 11 月 1 日からです。
@z

@x
## How do I authenticate pull requests
@y
{% comment %}
## How do I authenticate pull requests
{% endcomment %}
{: #how-do-I-authenticate-pull-requests }
## プルリクエストの認証方法
@z

@x
The following section contains information on how to log into on Docker Hub to authenticate pull requests.
@y
{% comment %}
The following section contains information on how to log into on Docker Hub to authenticate pull requests.
{% endcomment %}
以下の節では、Docker Hub にログインして、プルリクエストを認証する方法を説明します。
@z

@x
### Docker Desktop
@y
### Docker Desktop
@z

@x
If you are using Docker Desktop, you can log into Docker Hub from the Docker Desktop menu.
@y
{% comment %}
If you are using Docker Desktop, you can log into Docker Hub from the Docker Desktop menu.
{% endcomment %}
Docker Desktop を利用している場合、Docker Desktop メニューから Docker Hub にログインすることができます。
@z

@x
Click **Sign in / Create Docker ID** from the Docker Desktop menu and follow the on-screen instructions to complete the sign-in process.
@y
{% comment %}
Click **Sign in / Create Docker ID** from the Docker Desktop menu and follow the on-screen instructions to complete the sign-in process.
{% endcomment %}
Docker Desktop メニューから **Sign in / Create Docker ID** をクリックして、画面内の指示に従って、サインイン操作を完了させます。
@z

@x
### Docker Engine
@y
### Docker Engine
@z

@x
If you are using a standalone version of Docker Engine, run the `docker login` command from a terminal to authenticate with Docker Hub. For information on how to use the command, see [docker login](../engine/reference/commandline/login.md).
@y
{% comment %}
If you are using a standalone version of Docker Engine, run the `docker login` command from a terminal to authenticate with Docker Hub. For information on how to use the command, see [docker login](../engine/reference/commandline/login.md).
{% endcomment %}
Docker Engine のスタンドアロン版を利用している場合は、ターミナル画面から `docker login` コマンドを実行して Docker Hub の認証を取得します。
このコマンドの使い方については [docker login](../engine/reference/commandline/login.md) を参照してください。
@z

@x
### Docker Swarm
@y
### Docker Swarm
@z

@x
If you are running Docker Swarm, you must use the `-- with-registry-auth` flag to authenticate with Docker Hub. For more information, see [docker service create](../engine/reference/commandline/service_create.md/#create-a-service). If you are using a Docker Compose file to deploy an application stack, see [docker stack deploy](../engine/reference/commandline/stack_deploy.md).
@y
{% comment %}
If you are running Docker Swarm, you must use the `-- with-registry-auth` flag to authenticate with Docker Hub. For more information, see [docker service create](../engine/reference/commandline/service_create.md/#create-a-service). If you are using a Docker Compose file to deploy an application stack, see [docker stack deploy](../engine/reference/commandline/stack_deploy.md).
{% endcomment %}
Docker Swarm を実行している場合、Docker Hub における認証を得るためには `-- with-registry-auth` フラグを用いる必要があります。
詳しくは [docker service create](../engine/reference/commandline/service_create.md/#create-a-service) を参照してください。
Docker Compose ファイルを使ってアプリケーションをデプロイしている場合は [docker stack deploy](../engine/reference/commandline/stack_deploy.md) を参照してください。
@z

@x
### GitHub Actions
@y
{% comment %}
### GitHub Actions
{% endcomment %}
{: #gitHub-actions }
### GitHub Action
@z

@x
If you are using GitHub Actions to build and push Docker images to Docker Hub, see [login action](https://github.com/docker/login-action#dockerhub){: target="_blank" rel="noopener" class="_"}. If you are using another Action, you must add your username and access token in a similar way for authentication.
@y
{% comment %}
If you are using GitHub Actions to build and push Docker images to Docker Hub, see [login action](https://github.com/docker/login-action#dockerhub){: target="_blank" rel="noopener" class="_"}. If you are using another Action, you must add your username and access token in a similar way for authentication.
{% endcomment %}
GitHub の Action を利用して、Docker Hub における Docker イメージのビルドとプッシュを行っている場合は、[login action](https://github.com/docker/login-action#dockerhub){: target="_blank" rel="noopener" class="_"} を参照してください。
これとは別の Action を利用している場合、認証と同じようにユーザー名とアクセストークンを追加する必要があります。
@z

@x
### Kubernetes
@y
### Kubernetes
@z

@x
If you are running Kubernetes, follow the instructions in [Pull an Image from a Private Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/){: target="_blank" rel="noopener" class="_"} for information on authentication.
@y
{% comment %}
If you are running Kubernetes, follow the instructions in [Pull an Image from a Private Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/){: target="_blank" rel="noopener" class="_"} for information on authentication.
{% endcomment %}
Kubernetes を実行している場合、認証に関する情報は [Pull an Image from a Private Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/){: target="_blank" rel="noopener" class="_"} に示されている手順に従ってください。
@z

@x
### Third-party platforms
@y
{% comment %}
### Third-party platforms
{% endcomment %}
{: #third-party-platforms }
### サードパーティー製のプラットフォーム
@z

@x
If you are using any third-party platforms, follow your provider’s instructions on using registry authentication.
@y
{% comment %}
If you are using any third-party platforms, follow your provider’s instructions on using registry authentication.
{% endcomment %}
サードパーティー製のプラットフォームを利用している場合は、各プロバイダーから提供される、レジストリ認証を利用する手順に従ってください。
@z

@x
- [CircleCI](https://circleci.com/docs/2.0/private-images/){: target="_blank" rel="noopener" class="_"}
- [Drone.io](https://docs.drone.io/pipeline/docker/syntax/images/#pulling-private-images){: target="_blank" rel="noopener" class="_"}
- [Codefresh](https://codefresh.io/docs/docs/docker-registries/external-docker-registries/docker-hub/){: target="_blank" rel="noopener" class="_"}
- [LayerCI](https://layerci.com/docs/advanced-workflows#logging-in-to-docker){: target="_blank" rel="noopener" class="_"}
- [AWS ECS/Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html){: target="_blank" rel="noopener" class="_"}
- [AWS CodeBuild](https://aws.amazon.com/blogs/devops/how-to-use-docker-images-from-a-private-registry-in-aws-codebuild-for-your-build-environment/){: target="_blank" rel="noopener" class="_"}
@y
- [CircleCI](https://circleci.com/docs/2.0/private-images/){: target="_blank" rel="noopener" class="_"}
- [Drone.io](https://docs.drone.io/pipeline/docker/syntax/images/#pulling-private-images){: target="_blank" rel="noopener" class="_"}
- [Codefresh](https://codefresh.io/docs/docs/docker-registries/external-docker-registries/docker-hub/){: target="_blank" rel="noopener" class="_"}
- [LayerCI](https://layerci.com/docs/advanced-workflows#logging-in-to-docker){: target="_blank" rel="noopener" class="_"}
- [AWS ECS/Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html){: target="_blank" rel="noopener" class="_"}
- [AWS CodeBuild](https://aws.amazon.com/blogs/devops/how-to-use-docker-images-from-a-private-registry-in-aws-codebuild-for-your-build-environment/){: target="_blank" rel="noopener" class="_"}
@z
