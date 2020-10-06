%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Hub Quickstart
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, docs, documentation, accounts, organizations, repositories, groups, teams
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
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, docs, documentation, accounts, organizations, repositories, groups, teams
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
[Docker Hub](https://hub.docker.com) is a service provided by Docker for
finding and sharing container images with your team. It provides the following
major features:
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
{% comment %}
[Docker Hub](https://hub.docker.com) is a service provided by Docker for
finding and sharing container images with your team. It provides the following
major features:
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
{% endcomment %}
[Docker Hub](https://hub.docker.com) は、開発チームに向けて Docker のコンテナーイメージを検索したり共有したりするために Docker が提供しているサービスの 1 つです。
主な機能として以下があります。
* [リポジトリ](repos.md): コンテナーイメージのプッシュ、プルを行います。
* [チームと組織](orgs.md): コンテナーイメージを配するプライベートリポジトリへのアクセスを管理します。
* [公式イメージ](official_images.md): Docker が提供している高品質のコンテナーイメージをプルして利用します。
* [開発提供イメージ](publish/customer_faq.md): 外部ベンダーによって提供されている高品質のコンテナーイメージをプルして利用します。
* [ビルド](builds/index.md): GitHub や Bitbucket のコンテナーイメージを自動ビルドして Docker Hub へプッシュします。
* [ウェブフック](webhooks.md)（webhook）: リポジトリへ正常にプッシュができた際に処理起動されるトリガーであり、Docker Hub と他サービスとの連携を図ります。
@z

@x
### Step 1: Sign up for Docker Hub
@y
{% comment %}
### Step 1: Sign up for Docker Hub
{% endcomment %}
### 手順 1: Docker Hub へのサインアップ
{: #step-1-sign-up-for-docker-hub }
@z

@x
Start by [creating an account](https://hub.docker.com/signup).
@y
{% comment %}
Start by [creating an account](https://hub.docker.com/signup).
{% endcomment %}
[アカウントの生成](https://hub.docker.com/signup)から始めます。
@z

@x
### Step 2: Create your first repository
@y
{% comment %}
### Step 2: Create your first repository
{% endcomment %}
### 手順 2: リポジトリを新規生成
{: #step-2-create-your-first-repository }
@z

@x
To create a repo:

1. Sign in to [Docker Hub](https://hub.docker.com).

2. Click on **Create a Repository** on the Docker Hub welcome page:

    ![Welcome](images/index-welcome.png)

3. Name it **&lt;your-username&gt;/my-first-repo** as shown below. Select
   **Private**:
@y
{% comment %}
To create a repo:

1. Sign in to [Docker Hub](https://hub.docker.com).

2. Click on **Create a Repository** on the Docker Hub welcome page:

    ![Welcome](images/index-welcome.png)

3. Name it **&lt;your-username&gt;/my-first-repo** as shown below. Select
   **Private**:
{% endcomment %}
リポジトリ生成の手順は以下です。

1. [Docker Hub](https://hub.docker.com) にサインインします。

2. Docker Hub の Welcome ページにて Create Repository をクリックします。

    ![ようこそ](images/index-welcome.png)

3. 以下に示すように **&lt;your-username&gt;/my-first-repo** に名称を入力します。
   そして **Private** を選択します。
@z

@x
    ![Create Repository](images/index-create-repo.png)
@y
    {% comment %}
    ![Create Repository](images/index-create-repo.png)
    {% endcomment %}
    ![リポジトリの生成](images/index-create-repo.png)
@z

@x
    You've created your first repo. You should see:
@y
    {% comment %}
    You've created your first repo. You should see:
    {% endcomment %}
    新規にリポジトリが生成され、以下のように表示されます。
@z

@x
    ![Repository Created](images/index-repo-created.png)
@y
    {% comment %}
    ![Repository Created](images/index-repo-created.png)
    {% endcomment %}
    ![リポジトリが生成される](images/index-repo-created.png)
@z

@x
### Step 3: Download and install Docker Desktop
@y
{% comment %}
### Step 3: Download and install Docker Desktop
{% endcomment %}
### 手順 3: Docker Desktop のダウンロードとインストール
{: #step-3-download-and-install-docker-desktop }
@z

@x
We'll need to download Docker Desktop to build and push a container image to
Docker Hub.
@y
{% comment %}
We'll need to download Docker Desktop to build and push a container image to
Docker Hub.
{% endcomment %}
コンテナーイメージを構築して Docker Hub にプッシュするために、Docker Desktop をダウンロードする必要があります。
@z

@x
1. Download and install [Docker Desktop](https://docker.com/get-started). If on
Linux, download [Docker Engine - Community](https://hub.docker.com/search?type=edition&offering=community).

2. Open the terminal and sign in to Docker Hub on your computer by running
   `docker login`.
@y
{% comment %}
1. Download and install [Docker Desktop](https://docker.com/get-started). If on
Linux, download [Docker Engine - Community](https://hub.docker.com/search?type=edition&offering=community).

2. Open the terminal and sign in to Docker Hub on your computer by running
   `docker login`.
{% endcomment %}
1. [Docker Desktop](https://docker.com/get-started) をダウンロードしてインストールします。
   Linux の場合は [Docker Engine - Community](https://hub.docker.com/search?type=edition&offering=community) をダウンロードします。

2. 端末画面を開いて、Docker Hub にサインインします。
   実行コマンドは `docker login` です。
@z

@x
### Step 4: Build and push a container image to Docker Hub from your computer
@y
{% comment %}
### Step 4: Build and push a container image to Docker Hub from your computer
{% endcomment %}
### 手順 4: ローカルマシンからコンテナーイメージを構築し Docker Hub へプッシュ
{: #step-4-build-and-push-a-container-image-to-docker-hub-from-your-computer }
@z

@x
1. Start by creating a [Dockerfile](https://docs.docker.com/engine/reference/builder/)
to specify your application as shown below:
```shell
cat > Dockerfile <<EOF
FROM busybox
CMD echo "Hello world! This is my first Docker image."
EOF
```
@y
{% comment %}
1. Start by creating a [Dockerfile](https://docs.docker.com/engine/reference/builder/)
to specify your application as shown below:
```shell
cat > Dockerfile <<EOF
FROM busybox
CMD echo "Hello world! This is my first Docker image."
EOF
```
{% endcomment %}
1. 以下に示すように Dockerfile を生成しアプリケーションを指定します。
（Dockerfile の詳細は [こちら](https://docs.docker.com/engine/reference/builder/) を参照してください。）
```shell
cat > Dockerfile <<EOF
FROM busybox
CMD echo "Hello world! This is my first Docker image."
EOF
```
@z

@x
2. Run `docker build -t <your_username>/my-first-repo .` to build your Docker
   image.
@y
{% comment %}
2. Run `docker build -t <your_username>/my-first-repo .` to build your Docker
   image.
{% endcomment %}
2. Docker イメージを構築するために、コマンド `docker build -t <your_username>/my-first-repo` を実行します。
@z

@x
3. Run `docker run <your_username>/my-first-repo` to test your 
Docker image locally.
@y
{% comment %}
3. Run `docker run <your_username>/my-first-repo` to test your 
Docker image locally.
{% endcomment %}
3. コマンド `docker run <your_username>/my-first-repo` を実行して、ローカル環境内の Docker イメージを確認します。
@z

@x
4. Run `docker push <your_username>/my-first-repo` to push your Docker image to
Docker Hub.
@y
{% comment %}
4. Run `docker push <your_username>/my-first-repo` to push your Docker image to
Docker Hub.
{% endcomment %}
4. `docker push <your_username>/my-first-repo` を実行して Docker イメージを Docker Hub にプッシュします。
@z

@x
    You should see output similar to:
@y
    {% comment %}
    You should see output similar to:
    {% endcomment %}
    出力結果は以下のようになります。
@z

@x
    ![Terminal](images/index-terminal-2019.png)
@y
    {% comment %}
    ![Terminal](images/index-terminal-2019.png)
    {% endcomment %}
    ![端末画面](images/index-terminal-2019.png)
@z

@x
    And in Docker Hub, your repository should have a new `latest` tag available
    under **Tags**:
@y
    {% comment %}
    And in Docker Hub, your repository should have a new `latest` tag available
    under **Tags**:
    {% endcomment %}
    Docker Hub 内ではリポジトリの**Tags**画面に、新たに`latest`というタグが追加されます。
@z

@x
    ![Tag Created](images/index-tag.png)
@y
    {% comment %}
    ![Tag Created](images/index-tag.png)
    {% endcomment %}
    ![生成されたタグ](images/index-tag.png)
@z

@x
Congratulations! You've successfully:
- Signed up for Docker Hub
- Created your first repository
- Built a Docker container image on your computer
- Pushed it to Docker Hub
@y
{% comment %}
Congratulations! You've successfully:
- Signed up for Docker Hub
- Created your first repository
- Built a Docker container image on your computer
- Pushed it to Docker Hub
{% endcomment %}
おめでとうございます。
以下の作業が完了しました。
- Docker Hub へのサインアップ
- 初めてのリポジトリ生成
- コンピューター上での Docker コンテナーイメージのビルド
- Docker Hub へのプッシュ
@z

@x
### Next steps
@y
{% comment %}
### Next steps
{% endcomment %}
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
{% comment %}
- Create an [organization](orgs.md) to use Docker Hub with your team.
- Automatically build container images from code through [builds](builds/index.md).
- [Explore](https://hub.docker.com/explore) official & publisher Images
- [Upgrade your plan](https://www.docker.com/pricing) to push additional private Docker images to
Docker Hub.
{% endcomment %}
- [組織](orgs.md)（organization）を生成して開発チームにより Docker Hub を利用します。
- [ビルド](builds/index.md) からのコードを用いてコンテナーイメージを自動ビルドします。
- 公式イメージや開発提供イメージを [検索](https://hub.docker.com/explore) します。
- [開発作業を更新](https://www.docker.com/pricing) してプライベートな Docker イメージを Docker Hub に追加します。
@z
