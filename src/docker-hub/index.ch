%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Hub Quickstart
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, accounts, organizations, repositories, groups, teams
title: Docker Hub Quickstart
redirect_from:
- /docker-hub/overview/
- /apidocs/docker-cloud/
- /docker-cloud/
- /docker-cloud/migration/
- /docker-cloud/migration/cloud-to-swarm/
- /docker-cloud/migration/cloud-to-kube-aks/
- /docker-cloud/migration/cloud-to-kube-gke/
- /docker-cloud/migration/cloud-to-aws-ecs/
- /docker-cloud/migration/deregister-swarms/
- /docker-cloud/migration/kube-primer/
- /docker-cloud/cloud-swarm/
- /docker-cloud/cloud-swarm/using-swarm-mode/
- /docker-cloud/cloud-swarm/register-swarms/
- /docker-cloud/cloud-swarm/register-swarms/
- /docker-cloud/cloud-swarm/create-cloud-swarm-aws/
- /docker-cloud/cloud-swarm/create-cloud-swarm-azure/
- /docker-cloud/cloud-swarm/connect-to-swarm/
- /docker-cloud/cloud-swarm/link-aws-swarm/
- /docker-cloud/cloud-swarm/link-azure-swarm/
- /docker-cloud/cloud-swarm/ssh-key-setup/
- /docker-cloud/infrastructure/
- /docker-cloud/infrastructure/deployment-strategies/
- /docker-cloud/infrastructure/link-aws/
- /docker-cloud/infrastructure/link-do/
- /docker-cloud/infrastructure/link-azure/
- /docker-cloud/infrastructure/link-packet/
- /docker-cloud/infrastructure/link-softlayer/
- /docker-cloud/infrastructure/ssh-into-a-node/
- /docker-cloud/infrastructure/docker-upgrade/
- /docker-cloud/infrastructure/byoh/
- /docker-cloud/infrastructure/cloud-on-packet.net-faq/
- /docker-cloud/infrastructure/cloud-on-aws-faq/
- /docker-cloud/standard/
- /docker-cloud/getting-started/
- /docker-cloud/getting-started/intro_cloud/
- /docker-cloud/getting-started/connect-infra/
- /docker-cloud/getting-started/your_first_node/
- /docker-cloud/getting-started/your_first_service/
- /docker-cloud/getting-started/deploy-app/1_introduction/
- /docker-cloud/getting-started/deploy-app/2_set_up/
- /docker-cloud/getting-started/deploy-app/3_prepare_the_app/
- /docker-cloud/getting-started/deploy-app/4_push_to_cloud_registry/
- /docker-cloud/getting-started/deploy-app/5_deploy_the_app_as_a_service/
- /docker-cloud/getting-started/deploy-app/6_define_environment_variables/
- /docker-cloud/getting-started/deploy-app/7_scale_the_service/
- /docker-cloud/getting-started/deploy-app/8_view_logs/
- /docker-cloud/getting-started/deploy-app/9_load-balance_the_service/
- /docker-cloud/getting-started/deploy-app/10_provision_a_data_backend_for_your_service/
- /docker-cloud/getting-started/deploy-app/11_service_stacks/
- /docker-cloud/getting-started/deploy-app/12_data_management_with_volumes/
- /docker-cloud/apps/
- /docker-cloud/apps/deploy-to-cloud-btn/
- /docker-cloud/apps/auto-destroy/
- /docker-cloud/apps/autorestart/
- /docker-cloud/apps/auto-redeploy/
- /docker-cloud/apps/load-balance-hello-world/
- /docker-cloud/apps/deploy-tags/
- /docker-cloud/apps/stacks/
- /docker-cloud/apps/ports/
- /docker-cloud/apps/service-redeploy/
- /docker-cloud/apps/service-scaling/
- /docker-cloud/apps/api-roles/
- /docker-cloud/apps/service-links/
- /docker-cloud/apps/triggers/
- /docker-cloud/apps/volumes/
- /docker-cloud/apps/stack-yaml-reference/
- /docker-cloud/installing-cli/
- /docker-cloud/docker-errors-faq/
- /docker-cloud/release-notes/
- /docker-store/
- /apidocs/
- /apidocs/overview/
---
@y
---
description: Docker Hub クイックスタート
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, accounts, organizations, repositories, groups, teams
title: Docker Hub クイックスタート
redirect_from:
- /docker-hub/overview/
- /apidocs/docker-cloud/
- /docker-cloud/
- /docker-cloud/migration/
- /docker-cloud/migration/cloud-to-swarm/
- /docker-cloud/migration/cloud-to-kube-aks/
- /docker-cloud/migration/cloud-to-kube-gke/
- /docker-cloud/migration/cloud-to-aws-ecs/
- /docker-cloud/migration/deregister-swarms/
- /docker-cloud/migration/kube-primer/
- /docker-cloud/cloud-swarm/
- /docker-cloud/cloud-swarm/using-swarm-mode/
- /docker-cloud/cloud-swarm/register-swarms/
- /docker-cloud/cloud-swarm/register-swarms/
- /docker-cloud/cloud-swarm/create-cloud-swarm-aws/
- /docker-cloud/cloud-swarm/create-cloud-swarm-azure/
- /docker-cloud/cloud-swarm/connect-to-swarm/
- /docker-cloud/cloud-swarm/link-aws-swarm/
- /docker-cloud/cloud-swarm/link-azure-swarm/
- /docker-cloud/cloud-swarm/ssh-key-setup/
- /docker-cloud/infrastructure/
- /docker-cloud/infrastructure/deployment-strategies/
- /docker-cloud/infrastructure/link-aws/
- /docker-cloud/infrastructure/link-do/
- /docker-cloud/infrastructure/link-azure/
- /docker-cloud/infrastructure/link-packet/
- /docker-cloud/infrastructure/link-softlayer/
- /docker-cloud/infrastructure/ssh-into-a-node/
- /docker-cloud/infrastructure/docker-upgrade/
- /docker-cloud/infrastructure/byoh/
- /docker-cloud/infrastructure/cloud-on-packet.net-faq/
- /docker-cloud/infrastructure/cloud-on-aws-faq/
- /docker-cloud/standard/
- /docker-cloud/getting-started/
- /docker-cloud/getting-started/intro_cloud/
- /docker-cloud/getting-started/connect-infra/
- /docker-cloud/getting-started/your_first_node/
- /docker-cloud/getting-started/your_first_service/
- /docker-cloud/getting-started/deploy-app/1_introduction/
- /docker-cloud/getting-started/deploy-app/2_set_up/
- /docker-cloud/getting-started/deploy-app/3_prepare_the_app/
- /docker-cloud/getting-started/deploy-app/4_push_to_cloud_registry/
- /docker-cloud/getting-started/deploy-app/5_deploy_the_app_as_a_service/
- /docker-cloud/getting-started/deploy-app/6_define_environment_variables/
- /docker-cloud/getting-started/deploy-app/7_scale_the_service/
- /docker-cloud/getting-started/deploy-app/8_view_logs/
- /docker-cloud/getting-started/deploy-app/9_load-balance_the_service/
- /docker-cloud/getting-started/deploy-app/10_provision_a_data_backend_for_your_service/
- /docker-cloud/getting-started/deploy-app/11_service_stacks/
- /docker-cloud/getting-started/deploy-app/12_data_management_with_volumes/
- /docker-cloud/apps/
- /docker-cloud/apps/deploy-to-cloud-btn/
- /docker-cloud/apps/auto-destroy/
- /docker-cloud/apps/autorestart/
- /docker-cloud/apps/auto-redeploy/
- /docker-cloud/apps/load-balance-hello-world/
- /docker-cloud/apps/deploy-tags/
- /docker-cloud/apps/stacks/
- /docker-cloud/apps/ports/
- /docker-cloud/apps/service-redeploy/
- /docker-cloud/apps/service-scaling/
- /docker-cloud/apps/api-roles/
- /docker-cloud/apps/service-links/
- /docker-cloud/apps/triggers/
- /docker-cloud/apps/volumes/
- /docker-cloud/apps/stack-yaml-reference/
- /docker-cloud/installing-cli/
- /docker-cloud/docker-errors-faq/
- /docker-cloud/release-notes/
- /docker-store/
- /apidocs/
- /apidocs/overview/
---
@z

@x
[Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} is a service provided by Docker for
finding and sharing container images with your team. It is the world’s largest repository of container images with an array of content sources including container community developers, open source projects and independent software vendors (ISV) building and distributing their code in containers.
@y
[Docker Hub](https://hub.docker.com) は、開発チームに向けて Docker のコンテナーイメージを検索したり共有したりするために Docker が提供するサービスの 1 つです。
これは世界最大のコンテナーイメージのリポジトリであり、コンテナーコミュニティの開発者、オープンソースプロジェクトや独立系ソフトウェアベンダー（independent software vendors; ISV）が、コンテナー内でのソースビルドと配布を行うコンテンツを提供しています。
@z

@x
Users get access to free public repositories for storing and sharing images or can choose a [subscription plan](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} for private repositories.
@y
無償の公開リポジトリをユーザーがアクセスして、イメージの保存と共有を行います。
プライベートリポジトリに対して [購入プラン](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} を選ぶこともできます。
@z

@x
Docker Hub provides the following major features:
@y
Docker Hub は主に以下の機能を提供します。
@z

@x
* [Repositories](repos.md): Push and pull container images.
* [Teams & Organizations](orgs.md): Manage access to private
repositories of container images.
* [Official Images](official_images.md): Pull and use high-quality
container images provided by Docker.
* [Publisher Images](publish/customer_faq.md): Pull and use high-
quality container images provided by external vendors.
* [Builds](builds/index.md): Automatically build container images from
GitHub and Bitbucket and push them to Docker Hub.
* [Webhooks](webhooks.md): Trigger actions after a successful push
  to a repository to integrate Docker Hub with other services.
@y
* [リポジトリ](repos.md): コンテナーイメージのプッシュ、プルを行います。
* [チームと組織](orgs.md): コンテナーイメージを配するプライベートリポジトリへのアクセスを管理します。
* [公式イメージ](official_images.md): Docker が提供している高品質のコンテナーイメージをプルして利用します。
* [開発提供イメージ](publish/customer_faq.md): 外部ベンダーによって提供されている高品質のコンテナーイメージをプルして利用します。
* [ビルド](builds/index.md): GitHub や Bitbucket のコンテナーイメージを自動ビルドして Docker Hub へプッシュします。
* [ウェブフック](webhooks.md)（webhook）: リポジトリへ正常にプッシュができた際に処理起動されるトリガーであり、Docker Hub と他サービスとの連携を図ります。
@z

@x
Docker provides a [Docker Hub CLI](https://github.com/docker/hub-tool#readme){: target="_blank" rel="noopener" class="_"} tool (currently experimental) and an API that allows you to interact with Docker Hub. Browse through the [Docker Hub API](/docker-hub/api/latest/){: target="_blank" rel="noopener" class="_"} documentation to explore the supported endpoints.
@y
Docker では [Docker Hub CLI](https://github.com/docker/hub-tool#readme){: target="_blank" rel="noopener" class="_"} ツール (現時点では試験的機能) を提供しています。
また Docker Hub に直接アクセスできる API も提供しています。
[Docker Hub API]({{ site.baseurl }}/docker-hub/api/latest/){: target="_blank" rel="noopener" class="_"} のドキュメントを参照して、サポートされているエンドポイントを確認してください。
@z

@x
The following section contains step-by-step instructions on how to easily get started with Docker Hub.
@y
以下の節において、Docker Hub を簡単にはじめる例を順に示していきます。
@z

@x
### Step 1: Sign up for a Docker account
@y
{: #step-1-sign-up-for-a-docker-account }
### 手順 1: Docker アカウントへのサインアップ
@z

@x
Let's start by creating a [Docker ID](https://hub.docker.com/signup){: target="_blank" rel="noopener" class="_"}.
@y
まずは [Docker ID](https://hub.docker.com/signup){: target="_blank" rel="noopener" class="_"} を生成するところからはじめます。
@z

@x
A Docker ID grants you access to Docker Hub repositories and allows you to explore images that are available from the community and verified publishers. You'll also need a Docker ID to share images on Docker Hub.
@y
Docker ID は Docker Hub リポジトリへのアクセス権を定めるものであり、コミュニティや検証済み公開者が提供するイメージを参照できるようになります。
また Docker ID は Docker Hub 上においてイメージを共有するために必要となります。
@z

@x
### Step 2: Create your first repository
@y
### 手順 2: リポジトリの新規生成
{: #step-2-create-your-first-repository }
@z

@x
To create a repository:
@y
リポジトリ生成の手順は以下です。
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
2. Click **Create a Repository** on the Docker Hub welcome page:
3. Name it **&lt;your-username&gt;/my-private-repo**.
4. Set the visibility to **Private**.
@y
1. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} にサインインします。
2. Docker Hub の Welcome ページにて **Create Repository** をクリックします。
3. **&lt;your-username&gt;/my-first-repo** に名称を入力します。
4. visibility（見せ方）を **Private** に設定します。
@z

@x
    ![Create Repository](images/index-create-repo.png)
@y
    ![リポジトリの生成](images/index-create-repo.png)
@z

@x
5. Click **Create**.
@y
5. **Create** をクリックします。
@z

@x
    You've created your first repository. You should see:
@y
    リポジトリが初めて生成され、以下のように表示されます。
@z

@x
    ![Repository Created](images/index-repo-created.png)
@y
    ![リポジトリが生成される](images/index-repo-created.png)
@z

@x
### Step 3: Download and install Docker Desktop
@y
### 手順 3: Docker Desktop のダウンロードとインストール
{: #step-3-download-and-install-docker-desktop }
@z

@x
We'll need to download Docker Desktop to build and push a container image to
Docker Hub.
@y
コンテナーイメージを構築して Docker Hub にプッシュするために、Docker Desktop をダウンロードする必要があります。
@z

@x
1. Download and install [Docker Desktop](../desktop/#download-and-install). If on Linux, download [Docker Engine](../engine/install/).
@y
1. [Docker Desktop](../desktop/#download-and-install) をダウンロードしてインストールします。
   Linux の場合は [Docker Engine](../engine/install/) をダウンロードします。
@z

@x
2. Sign into the Docker Desktop application using the Docker ID you created in Step 1.
@y
2. 手順 1. において生成した Docker ID を用いて、Docker Desktop にサインインします。
@z

@x
### Step 4: Build and push a container image to Docker Hub from your computer
@y
### 手順 4: ローカルマシンからコンテナーイメージを構築し Docker Hub へプッシュ
{: #step-4-build-and-push-a-container-image-to-docker-hub-from-your-computer }
@z

@x
1. Start by creating a [Dockerfile](../engine/reference/builder/) to specify your application as shown below:
@y
1. 以下に示すように [Dockerfile](../engine/reference/builder/) を生成しアプリケーションを指定します。
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM busybox
   CMD echo "Hello world! This is my first Docker image."
   ```
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM busybox
   CMD echo "Hello world! This is my first Docker image."
   ```
@z

@x
2. Run `docker build -t <your_username>/my-private-repo .` to build your Docker
   image.
@y
2. Docker イメージを構築するために、コマンド`docker build -t <your_username>/my-private-repo .`を実行します。
@z

@x
3. Run `docker run <your_username>/my-private-repo` to test your
Docker image locally.
@y
3. コマンド`docker run <your_username>/my-private-repo`を実行して、ローカル環境内の Docker イメージを確認します。
@z

@x
4. Run `docker push <your_username>/my-private-repo` to push your Docker image to Docker Hub. You should see output similar to:
@y
4. `docker push <your_username>/my-private-repo`を実行して Docker イメージを Docker Hub にプッシュします。
   出力結果は以下のようになります。
@z

@x
    ![Terminal](images/index-terminal.png)
@y
    ![端末画面](images/index-terminal.png)
@z

@x
    > **Having trouble pushing?** Remember, you must be signed into Docker Hub through Docker Desktop or the command line, and you must also name your images correctly, as per the above steps.
@y
    > **プッシュ時にトラブル発生したら** Docker Desktop を通じて、あるいはコマンドラインから Docker Hub にサインインしていることが必要です。
    > またイメージの指定は、上の各手順ごとに正しく行ってください。
@z

@x
5. Your repository in Docker Hub should now display a new `latest` tag under **Tags**:
@y
5. Docker Hub 内ではリポジトリの**Tags**画面に、新たに`latest`というタグが追加されます。
@z

@x
    ![Tag Created](images/index-tag.png)
@y
    ![生成されたタグ](images/index-tag.png)
@z

@x
Congratulations! You've successfully:
@y
おめでとうございます。
以下の作業が完了しました。
@z

@x
- Signed up for a Docker account
- Created your first repository
- Built a Docker container image on your computer
- Pushed it successfully to Docker Hub
@y
- Docker アカウントへのサインアップ
- 初めてのリポジトリ生成
- コンピューター上での Docker コンテナーイメージのビルド
- Docker Hub への正常なプッシュ
@z

@x
### Next steps
@y
### 次のステップ
{: #next-steps }
@z

@x
- Create an [organization](orgs.md) to use Docker Hub with your team.
- Automatically build container images from code through [builds](builds/index.md).
- [Explore](https://hub.docker.com/explore) official & publisher images.
- [Upgrade your plan](https://www.docker.com/pricing) to push additional private Docker images to
Docker Hub.
@y
- [組織](orgs.md)（organization）を生成して開発チームにより Docker Hub を利用します。
- [ビルド](builds/index.md) からのコードを用いてコンテナーイメージを自動ビルドします。
- 公式イメージや開発提供イメージを [検索](https://hub.docker.com/explore) します。
- [開発作業を更新](https://www.docker.com/pricing) してプライベートな Docker イメージを Docker Hub に追加します。
@z
