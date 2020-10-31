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
For more information, see [Resource Consumption FAQs](https://www.docker.com/pricing/resource-consumption-updates){: target="_blank" rel="noopener" class="_"} and [Docker Hub Pricing](https://hub.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
Docker has enabled download rate limits for pull requests on 
Docker Hub. Limits are determined based on the account type. 
For more information, see [Resource Consumption FAQs](https://www.docker.com/pricing/resource-consumption-updates){: target="_blank" rel="noopener" class="_"} and [Docker Hub Pricing](https://hub.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
Docker では Docker Hub 上でのプルリクエストに対して、ダウンロードレート制限を有効化してきました。
この制限はアカウントの種類により決定されます。
詳しくは [リソース消費 FAQ](https://www.docker.com/pricing/resource-consumption-updates){: target="_blank" rel="noopener" class="_"} や [Docker Hub Pricing](https://hub.docker.com/pricing){: target="_blank" rel="noopener" class="_"} を参照してください。
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
Docker will gradually introduce these rate limits starting November 2nd, 2020.
@y
{% comment %}
Docker will gradually introduce these rate limits starting November 2nd, 2020.
{% endcomment %}
Docker においてこのレート制限は 2020 年 11 月 2 日から徐々に導入していきます。
@z

@x
## How do I know my pull requests are being limited
@y
{% comment %}
## How do I know my pull requests are being limited
{% endcomment %}
## How do I know my pull requests are being limited
@z

@x
When you issue a pull request and you are over the limit for your account type, Docker Hub will return a `429` response code with the following body when the manifest is requested:
@y
{% comment %}
When you issue a pull request and you are over the limit for your account type, Docker Hub will return a `429` response code with the following body when the manifest is requested:
{% endcomment %}
When you issue a pull request and you are over the limit for your account type, Docker Hub will return a `429` response code with the following body when the manifest is requested:
@z

@x
```
You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits
```
@y
```
You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits
```
@z

@x
You will see this error message in the Docker CLI or in the Docker Engine logs.
@y
{% comment %}
You will see this error message in the Docker CLI or in the Docker Engine logs.
{% endcomment %}
You will see this error message in the Docker CLI or in the Docker Engine logs.
@z

@x
## How can I check my current rate
@y
{% comment %}
## How can I check my current rate
{% endcomment %}
## How can I check my current rate
@z

@x
When limiting starts, valid non-rate-limited manifest API requests to Hub will include the following rate limit headers in the response:
@y
{% comment %}
When limiting starts, valid non-rate-limited manifest API requests to Hub will include the following rate limit headers in the response:
{% endcomment %}
When limiting starts, valid non-rate-limited manifest API requests to Hub will include the following rate limit headers in the response:
@z

@x
```
RateLimit-Limit    
RateLimit-Remaining
```
@y
```
RateLimit-Limit    
RateLimit-Remaining
```
@z

@x
If you have a proxy or other layer in place that logs your requests, you can inspect the headers of these responses directly. Otherwise, you can use curl to view these. You will need `curl`, `grep`, and `jq` installed.
@y
{% comment %}
If you have a proxy or other layer in place that logs your requests, you can inspect the headers of these responses directly. Otherwise, you can use curl to view these. You will need `curl`, `grep`, and `jq` installed.
{% endcomment %}
If you have a proxy or other layer in place that logs your requests, you can inspect the headers of these responses directly. Otherwise, you can use curl to view these. You will need `curl`, `grep`, and `jq` installed.
@z

@x
To get a token anonymously (if you are pulling anonymously):
@y
{% comment %}
To get a token anonymously (if you are pulling anonymously):
{% endcomment %}
To get a token anonymously (if you are pulling anonymously):
@z

@x
```
$ TOKEN=$(curl "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@y
```
$ TOKEN=$(curl "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@z

@x
To get a token with a user account (if you are authenticating your pulls) - don't forget to insert your username and password in the following command:
@y
{% comment %}
To get a token with a user account (if you are authenticating your pulls) - don't forget to insert your username and password in the following command:
{% endcomment %}
To get a token with a user account (if you are authenticating your pulls) - don't forget to insert your username and password in the following command:
@z

@x
```
$ TOKEN=$(curl --user 'username:password' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@y
```
$ TOKEN=$(curl --user 'username:password' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@z

@x
Then to get the headers showing your limits, run the following (keep in mind that requesting a manifest emulates a pull and will count against the limits):
@y
{% comment %}
Then to get the headers showing your limits, run the following (keep in mind that requesting a manifest emulates a pull and will count against the limits):
{% endcomment %}
Then to get the headers showing your limits, run the following (keep in mind that requesting a manifest emulates a pull and will count against the limits):
@z

@x
```
$ curl -v -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest 2>&1 | grep RateLimit
```
@y
```
$ curl -v -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest 2>&1 | grep RateLimit
```
@z

@x
Which should return something like this:
@y
{% comment %}
Which should return something like this:
{% endcomment %}
Which should return something like this:
@z

@x
```
< RateLimit-Limit: 100;w=21600  
< RateLimit-Remaining: 76;w=21600
```
@y
```
< RateLimit-Limit: 100;w=21600  
< RateLimit-Remaining: 76;w=21600
```
@z

@x
This means my limit is 100 per 21600 seconds (6 hours), and I have 76 pulls remaining.
@y
{% comment %}
This means my limit is 100 per 21600 seconds (6 hours), and I have 76 pulls remaining.
{% endcomment %}
This means my limit is 100 per 21600 seconds (6 hours), and I have 76 pulls remaining.
@z

@x
> Remember that these headers are best-effort and there will be small variations.
@y
{% comment %}
> Remember that these headers are best-effort and there will be small variations.
{% endcomment %}
> Remember that these headers are best-effort and there will be small variations.
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
- [Artifactory](https://www.jfrog.com/confluence/display/JFROG/Advanced+Settings#AdvancedSettings-RemoteCredentials){: target="_blank" rel="noopener" class="_"}
- [AWS CodeBuild](https://aws.amazon.com/blogs/devops/how-to-use-docker-images-from-a-private-registry-in-aws-codebuild-for-your-build-environment/){: target="_blank" rel="noopener" class="_"}
- [AWS ECS/Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html){: target="_blank" rel="noopener" class="_"}
- [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#sep-docreg){: target="_blank" rel="noopener" class="_"}
- [CircleCI](https://circleci.com/docs/2.0/private-images/){: target="_blank" rel="noopener" class="_"}
- [Codefresh](https://codefresh.io/docs/docs/docker-registries/external-docker-registries/docker-hub/){: target="_blank" rel="noopener" class="_"}
- [Drone.io](https://docs.drone.io/pipeline/docker/syntax/images/#pulling-private-images){: target="_blank" rel="noopener" class="_"}
- [GitLab](https://docs.gitlab.com/ee/user/packages/container_registry/#authenticate-with-the-container-registry){: target="_blank" rel="noopener" class="_"}
- [LayerCI](https://layerci.com/docs/advanced-workflows#logging-in-to-docker){: target="_blank" rel="noopener" class="_"}
- [TeamCity](https://www.jetbrains.com/help/teamcity/integrating-teamcity-with-docker.html#Conforming+with+Docker+download+rate+limits){: target="_blank" rel="noopener" class="_"}
@y
- [Artifactory](https://www.jfrog.com/confluence/display/JFROG/Advanced+Settings#AdvancedSettings-RemoteCredentials){: target="_blank" rel="noopener" class="_"}
- [AWS CodeBuild](https://aws.amazon.com/blogs/devops/how-to-use-docker-images-from-a-private-registry-in-aws-codebuild-for-your-build-environment/){: target="_blank" rel="noopener" class="_"}
- [AWS ECS/Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html){: target="_blank" rel="noopener" class="_"}
- [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#sep-docreg){: target="_blank" rel="noopener" class="_"}
- [CircleCI](https://circleci.com/docs/2.0/private-images/){: target="_blank" rel="noopener" class="_"}
- [Codefresh](https://codefresh.io/docs/docs/docker-registries/external-docker-registries/docker-hub/){: target="_blank" rel="noopener" class="_"}
- [Drone.io](https://docs.drone.io/pipeline/docker/syntax/images/#pulling-private-images){: target="_blank" rel="noopener" class="_"}
- [GitLab](https://docs.gitlab.com/ee/user/packages/container_registry/#authenticate-with-the-container-registry){: target="_blank" rel="noopener" class="_"}
- [LayerCI](https://layerci.com/docs/advanced-workflows#logging-in-to-docker){: target="_blank" rel="noopener" class="_"}
- [TeamCity](https://www.jetbrains.com/help/teamcity/integrating-teamcity-with-docker.html#Conforming+with+Docker+download+rate+limits){: target="_blank" rel="noopener" class="_"}
@z

@x
## Other limits
@y
{% comment %}
## Other limits
{% endcomment %}
{: #other-limits }
## その他の制限
@z

@x
Docker Hub also has an overall rate limit to protect the application 
and infrastructure. This limit applies to all requests to Hub 
properties including web pages, APIs, image pulls, etc. The limit is 
applied per-IP, and while the limit changes over time depending on load
and other factors, it is in the order of thousands of requests per 
minute. The overall rate limit applies to all users equally
regardless of account level.
@y
{% comment %}
Docker Hub also has an overall rate limit to protect the application 
and infrastructure. This limit applies to all requests to Hub 
properties including web pages, APIs, image pulls, etc. The limit is 
applied per-IP, and while the limit changes over time depending on load
and other factors, it is in the order of thousands of requests per 
minute. The overall rate limit applies to all users equally
regardless of account level.
{% endcomment %}
Docker Hub ではアプリケーションやインフラストラクチャーを保護するために、ダウンロードレートの総量制限があります。
この制限は Hub に対するリクエストすべてに適用されるものであり、ウェブページ、API、イメージプルなどを含みます。
制限は IP アドレスごとに行われ、負荷状況などにより時間とともに変化しますが、1 分あたり数千個のリクエスト相当のものです。
レートの総量制限は、アカウントのレベルに関係なく、全ユーザーに等しく適用されます。
@z

@x
You can differentiate between these limits by looking at the error 
code. The "overall limit" will return a simple `429 Too Many Requests` 
response. The pull limit returns a longer error message that
includes a link to this page.
@y
{% comment %}
You can differentiate between these limits by looking at the error 
code. The "overall limit" will return a simple `429 Too Many Requests` 
response. The pull limit returns a longer error message that
includes a link to this page.
{% endcomment %}
この制限が適用されたかどうかは、エラーコードを見ればわかります。
総量制限が適用された場合、単純に`429 Too Many Requests`レスポンスが返されます。
プル処理時に発生する制限の場合は、もっと長いエラーメッセージが示され、その中には本ページへのリンクが示されます。
@z
