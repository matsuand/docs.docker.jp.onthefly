%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Deploying Docker containers on Azure
description: Deploying Docker containers on Azure
keywords: Docker, Azure, Integration, ACI, context, Compose, cli, deploy, containers, cloud
toc_min: 1
toc_max: 2
---
@y
---
title: Azure での Docker コンテナーのデプロイ
description: Azure において Docker コンテナーをデプロイします。
keywords: Docker, Azure, Integration, ACI, context, Compose, cli, deploy, containers, cloud
toc_min: 1
toc_max: 2
---
@z

@x
## Overview
@y
{% comment %}
## Overview
{% endcomment %}
{: #overview }
## 概要
@z

@x
The Docker Azure Integration enables developers to use native Docker commands to run applications in Azure Container Instances (ACI) when building cloud-native applications. The new experience provides a tight integration between Docker Desktop and Microsoft Azure allowing developers to quickly run applications using the Docker CLI or VS Code extension, to switch seamlessly from local development to cloud deployment.
@y
{% comment %}
The Docker Azure Integration enables developers to use native Docker commands to run applications in Azure Container Instances (ACI) when building cloud-native applications. The new experience provides a tight integration between Docker Desktop and Microsoft Azure allowing developers to quickly run applications using the Docker CLI or VS Code extension, to switch seamlessly from local development to cloud deployment.
{% endcomment %}
Docker Azure 統合は、Azure コンテナーインスタンス（Azure Container Instances; ACI） の中で、ネイティブな Docker コマンドの利用を可能にします。
これを使って、クラウドに適したアプリケーションを構築し実行します。
この新たな仕組みによって、Docker Desktop と Microsoft Azure の緊密な統合が実現され、開発者にとっては、Docker CLI や VS Code 拡張機能を使ったアプリケーション実行が即座にできるようになり、またローカル開発環境とクラウドデプロイ環境をシームレスに切り替えることができます。
@z

@x
In addition, the integration between Docker and Microsoft developer technologies allow developers to use the Docker CLI to:
@y
{% comment %}
In addition, the integration between Docker and Microsoft developer technologies allow developers to use the Docker CLI to:
{% endcomment %}
さらに Docker と Microsoft の開発技術の統合により、開発者が Docker CLI を用いる際には、以下のことが可能になります。
@z

@x
- Easily log into Azure
- Set up an ACI context in one Docker command allowing you to switch from a local context to a cloud context and run applications quickly and easily
- Simplify single container and multi-container application development using the Compose specification, allowing a developer to invoke fully Docker-compatible commands seamlessly for the first time natively within a cloud container service
@y
{% comment %}
- Easily log into Azure
- Set up an ACI context in one Docker command allowing you to switch from a local context to a cloud context and run applications quickly and easily
- Simplify single container and multi-container application development using the Compose specification, allowing a developer to invoke fully Docker-compatible commands seamlessly for the first time natively within a cloud container service
{% endcomment %}
- Azure に簡単にログインすることができます。
- 1 つの Docker コマンドに対して ACI コンテキストを設定することができます。
  これによってローカルコンテキストとクラウドコンテキストを切り替えられるようになり、アプリケーションの実行をすばやく簡単に行うことができます。
- Compose を利用すれば、単一コンテナーアプリケーション、複数コンテナーアプリケーションの開発を単純化できます。
  開発者にとってはクラウドコンテナーサービスに対して、シームレスな Docker 完全互換コマンドの実行が初めて可能になります。
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
To deploy Docker containers on Azure, you must meet the following requirements:
@y
{% comment %}
To deploy Docker containers on Azure, you must meet the following requirements:
{% endcomment %}
Docker コンテナーを Azure にデプロイするには、以下の条件を満たしていることが必要です。
@z

@x
1. Download and install Docker Desktop Stable version 2.3.0.5 or later, or Edge version 2.3.2.0 or later.
@y
{% comment %}
1. Download and install Docker Desktop Stable version 2.3.0.5 or later, or Edge version 2.3.2.0 or later.
{% endcomment %}
1. Docker Desktop 安定版（Stable）2.3.0.5 またはそれ以降、最新版（Edge）2.3.2.0 またはそれ以降をダウンロードしインストールしていることが必要です。
@z

@x
    - [Download for Mac](https://desktop.docker.com/mac/edge/Docker.dmg){: target="_blank" rel="noopener" class="_"}
    - [Download for Windows](https://desktop.docker.com/win/edge/Docker%20Desktop%20Installer.exe){: target="_blank" rel="noopener" class="_"}
@y
    - [Download for Mac](https://desktop.docker.com/mac/edge/Docker.dmg){: target="_blank" rel="noopener" class="_"}
    - [Download for Windows](https://desktop.docker.com/win/edge/Docker%20Desktop%20Installer.exe){: target="_blank" rel="noopener" class="_"}
@z

@x
    Alternatively, install the [Docker Compose CLI for Linux](#install-the-docker-compose-cli-on-linux).
@y
    {% comment %}
    Alternatively, install the [Docker Compose CLI for Linux](#install-the-docker-compose-cli-on-linux).
    {% endcomment %}
    あるいは [Docker ACI Integration for Linux](#install-the-docker-aci-integration-cli-on-linux) をインストールしていることが必要です。
@z

@x
2. Ensure you have an Azure subscription. You can get started with an [Azure free account](https://aka.ms/AA8r2pj){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
2. Ensure you have an Azure subscription. You can get started with an [Azure free account](https://aka.ms/AA8r2pj){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
2. Azure サブスクリプションを持っていることが必要です。
   [Azure free account](https://aka.ms/AA8r2pj){: target="_blank" rel="noopener" class="_"} にアクセスして取得操作を進めることができます。
@z

@x
## Run Docker containers on ACI
@y
{% comment %}
## Run Docker containers on ACI
{% endcomment %}
{: #run-docker-containers-on-aci }
## ACI での Docker コンテナー実行
@z

@x
Docker not only runs containers locally, but also enables developers to seamlessly deploy Docker containers on ACI using `docker run` or deploy multi-container applications defined in a Compose file using the `docker compose up` command.
@y
{% comment %}
Docker not only runs containers locally, but also enables developers to seamlessly deploy Docker containers on ACI using `docker run` or deploy multi-container applications defined in a Compose file using the `docker compose up` command.
{% endcomment %}
Docker は、単にローカルのコンテナーを実行するだけのものではなくなります。
`docker run` を使って ACI 上の Docker コンテナーをシームレスにデプロイできます。
あるいは Compose ファイルに定義されたマルチコンテナーのアプリケーションを`docker compose up`コマンドを使ってデプロイできるようになります。
@z

@x
The following sections contain instructions on how to deploy your Docker containers on ACI.
@y
{% comment %}
The following sections contain instructions on how to deploy your Docker containers on ACI.
{% endcomment %}
以下の節では ACI 上において Docker コンテナーをデプロイする手順を説明します。
@z

@x
### Log into Azure
@y
{% comment %}
### Log into Azure
{% endcomment %}
{: #log-into-azure }
### Azure へのログイン
@z

@x
Run the following commands to log into Azure:
@y
{% comment %}
Run the following commands to log into Azure:
{% endcomment %}
以下のコマンドを実行して Azure にログインします。
@z

@x
```console
docker login azure
```
@y
```console
docker login azure
```
@z

@x
This opens your web browser and prompts you to enter your Azure login credentials.
If the Docker CLI cannot open a browser, it will fall back to the [Azure device code flow](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-device-code){:target="_blank" rel="noopener" class="_"} and lets you connect manually.
Note that the [Azure command line](https://docs.microsoft.com/en-us/cli/azure/){:target="_blank" rel="noopener" class="_"} login is separated from the Docker CLI Azure login.
@y
{% comment %}
This opens your web browser and prompts you to enter your Azure login credentials.
If the Docker CLI cannot open a browser, it will fall back to the [Azure device code flow](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-device-code){:target="_blank" rel="noopener" class="_"} and lets you connect manually.
Note that the [Azure command line](https://docs.microsoft.com/en-us/cli/azure/){:target="_blank" rel="noopener" class="_"} login is separated from the Docker CLI Azure login.
{% endcomment %}
ここからブラウザーが開いて Azure のログイン情報の入力が求められます。
Docker CLI からブラウザーが開かない場合は、そこから [Azure デバイスコードフロー](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-device-code){:target="_blank" rel="noopener" class="_"} へ進み、手動で接続します。
なお [Azure コマンドライン](https://docs.microsoft.com/en-us/cli/azure/){:target="_blank" rel="noopener" class="_"} のログインは Docker CLI Azure ログインからは切り離されています。
@z

@x
Alternatively, you can log in without interaction (typically in
scripts or continuous integration scenarios), using an Azure Service
Principal, with `docker login azure --client-id xx --client-secret yy --tenant-id zz`
@y
{% comment %}
Alternatively, you can log in without interaction (typically in
scripts or continuous integration scenarios), using an Azure Service
Principal, with `docker login azure --client-id xx --client-secret yy --tenant-id zz`
{% endcomment %}
これとは別に、対話形式でない方法（スクリプトや継続的インテグレーションの利用時）でのログインも可能です。
その場合には Azure サービスプリンシパルを利用し`docker login azure --client-id xx --client-secret yy --tenant-id zz`のようにコマンド実行します。
@z

@x
>**Note**
>
> Logging in through the Azure Service Provider obtains an access token valid
for a short period (typically 1h), but it does not allow you to automatically
and transparently refresh this token. You must manually re-login
when the access token has expired when logging in with a Service Provider.
@y
{% comment %}
>**Note**
>
> Logging in through the Azure Service Provider obtains an access token valid
for a short period (typically 1h), but it does not allow you to automatically
and transparently refresh this token. You must manually re-login
when the access token has expired when logging in with a Service Provider.
{% endcomment %}
>**メモ**
>
> Azure サービスプロバイダーを通じたログインでは、アクセストークンの有効期間は短いもの（通常は 1 時間）になっています。
だからといって、このトークンを自動的、透過的に更新することはできません。
サービスプロバイダーを利用したログイン中にそのアクセストークンの有効期間が過ぎた場合は、手動で再ログインしなければなりません。
@z

@x
You can also use the `--tenant-id` option alone to specify a tenant, if
you have several ones available in Azure.
@y
{% comment %}
You can also use the `--tenant-id` option alone to specify a tenant, if
you have several ones available in Azure.
{% endcomment %}
Azure 上に複数のテナントを有している場合、`--tenant-id` オプションを単独で用いることもできます。
@z

@x
### Create an ACI context
@y
{% comment %}
### Create an ACI context
{% endcomment %}
{: #create-an-aci-context }
### ACI コンテキストの生成
@z

@x
After you have logged in, you need to create a Docker context associated with ACI to deploy containers in ACI.
Creating an ACI context requires an Azure subscription, a resource group, and a region.
For example, let us create a new context called `myacicontext`:
@y
{% comment %}
After you have logged in, you need to create a Docker context associated with ACI to deploy containers in ACI.
Creating an ACI context requires an Azure subscription, a resource group, and a region.
For example, let us create a new context called `myacicontext`:
{% endcomment %}
ログインした後は、ACI においてコンテナーをデプロイできるようにするために、ACI に関する Docker コンテキストを生成することが必要です。
ACI コンテキストの生成には Azure サブスクリプション、リソースグループ、地域設定が必要です。
たとえば新たなコンテキストとして`myacicontext`を生成することにします。
@z

@x
```console
docker context create aci myacicontext
```
@y
```console
docker context create aci myacicontext
```
@z

@x
This command automatically uses your Azure login credentials to identify your subscription IDs and resource groups. You can then interactively select the subscription and group that you would like to use. If you prefer, you can specify these options in the CLI using the following flags: `--subscription-id`,
`--resource-group`, and `--location`.
@y
{% comment %}
This command automatically uses your Azure login credentials to identify your subscription IDs and resource groups. You can then interactively select the subscription and group that you would like to use. If you prefer, you can specify these options in the CLI using the following flags: `--subscription-id`,
`--resource-group`, and `--location`.
{% endcomment %}
このコマンドは自動的に Azure ログイン情報を利用して、サブスクリプション ID やリソースグループを識別するものです。
コマンド実行においては、利用するサブスクリプションやグループを対話的に選択します。
必要であれば CLI の以下のようなフラグ`--subscription-id`、`--resource-group`、`--location`を使って指定することもできます。
@z

@x
If you don't have any existing resource groups in your Azure account, the `docker context create aci myacicontext` command creates one for you. You don’t have to specify any additional options to do this.
@y
{% comment %}
If you don't have any existing resource groups in your Azure account, the `docker context create aci myacicontext` command creates one for you. You don’t have to specify any additional options to do this.
{% endcomment %}
Azure アカウントにおいてリソースグループを 1 つも生成していない場合、`docker context create aci myacicontext` コマンドの実行によって、リソースグループが生成されます。
その際には特別なオプションを設定する必要はありません。
@z

@x
After you have created an ACI context, you can list your Docker contexts by running the `docker context ls` command:
@y
{% comment %}
After you have created an ACI context, you can list your Docker contexts by running the `docker context ls` command:
{% endcomment %}
ACI コンテキストを生成したら、`docker context ls` コマンドを実行して Docker コンテキストの一覧を確認します。
@z

@x
```console
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT                KUBERNETES ENDPOINT   ORCHESTRATOR
myacicontext        aci                 myResourceGroupGTA@eastus
default *           moby              Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                          swarm
```
@y
```console
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT                KUBERNETES ENDPOINT   ORCHESTRATOR
myacicontext        aci                 myResourceGroupGTA@eastus
default *           moby              Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                          swarm
```
@z

@x
### Run a container
@y
{% comment %}
### Run a container
{% endcomment %}
{: #run-a-container }
### コンテナーの実行
@z

@x
Now that you've logged in and created an ACI context, you can start using Docker commands to deploy containers on ACI.
@y
{% comment %}
Now that you've logged in and created an ACI context, you can start using Docker commands to deploy containers on ACI.
{% endcomment %}
ログインを済ませて ACI コンテキストも生成したので、ACI 上にコンテナーをデプロイするための Docker コマンド操作を進めていきます。
@z

@x
There are two ways to use your new ACI context. You can use the `--context` flag with the Docker command to specify that you would like to run the command using your newly created ACI context.
@y
{% comment %}
There are two ways to use your new ACI context. You can use the `--context` flag with the Docker command to specify that you would like to run the command using your newly created ACI context.
{% endcomment %}
新しく生成した ACI コンテキストを利用する方法は 2 つあります。
1 つは Docker コマンドにおいて`--context`フラグを利用する方法です。
新たに生成した ACI コンテキストをここに指定して、コマンド実行を行います。
@z

@x
```console
docker --context myacicontext run -p 80:80 nginx
```
@y
```console
docker --context myacicontext run -p 80:80 nginx
```
@z

@x
Or, you can change context using `docker context use` to select the ACI context to be your focus for running Docker commands. For example, we can use the `docker context use` command to deploy an ngnix container:
@y
{% comment %}
Or, you can change context using `docker context use` to select the ACI context to be your focus for running Docker commands. For example, we can use the `docker context use` command to deploy an ngnix container:
{% endcomment %}
もう 1 つは`docker context use`を使ってコンテキストを切り替える方法です。
Docker コマンドの実行にあたって、対象とするコンテキストを ACI コンテキストとします。
たとえば`docker context use`コマンドを利用して、nginx コンテナーをデプロイしてみます。
@z

@x
```console
docker context use myacicontext
docker run -p 80:80 nginx
```
@y
```console
docker context use myacicontext
docker run -p 80:80 nginx
```
@z

@x
After you've switched to the `myacicontext` context, you can use `docker ps` to list your containers running on ACI.
@y
{% comment %}
After you've switched to the `myacicontext` context, you can use `docker ps` to list your containers running on ACI.
{% endcomment %}
コンテキストを`myacicontext`に切り替えたら、`docker ps`を使って ACI 上に動作するコンテナー一覧を確認することができます。
@z

@x
In the case of the demonstration nginx container started above, the result of the ps command will display in column "PORTS" the IP address and port on which the container is running. For example, it may show `52.154.202.35:80->80/tcp`, and you can view the nginx welcome page by browsing `http://52.154.202.35`.
@y
{% comment %}
In the case of the demonstration nginx container started above, the result of the ps command will display in column "PORTS" the IP address and port on which the container is running. For example, it may show `52.154.202.35:80->80/tcp`, and you can view the nginx welcome page by browsing `http://52.154.202.35`.
{% endcomment %}
上に示した nginx コンテナーの利用例において ps コマンドの出力結果にある "PORTS" カラムには、コンテナーが動作している IP アドレスとポートが表示されます。
たとえば`52.154.202.35:80->80/tcp`のような表示です。
そしてブラウザーから`http://52.154.202.35`にアクセスすれば、nginx の Welcome ページが開きます。
@z

@x
To view logs from your container, run:
@y
{% comment %}
To view logs from your container, run:
{% endcomment %}
コンテナーからログを確認するには以下を実行します。
@z

@x
```console
docker logs <CONTAINER_ID>
```
@y
{% comment %}
```console
docker logs <CONTAINER_ID>
```
{% endcomment %}
```console
docker logs <コンテナーID>
```
@z

@x
To execute a command in a running container, run:
@y
{% comment %}
To execute a command in a running container, run:
{% endcomment %}
実行中のコンテナーにおいてコマンドを実行するには、以下のようにします。
@z

@x
```console
docker exec -t <CONTAINER_ID> COMMAND
```
@y
{% comment %}
```console
docker exec -t <CONTAINER_ID> COMMAND
```
{% endcomment %}
```console
docker exec -t <コンテナーID> COMMAND
```
@z

@x
To stop and remove a container from ACI, run:
@y
{% comment %}
To stop and remove a container from ACI, run:
{% endcomment %}
ACI 上のコンテナーを停止して削除するには、以下のようにします。
@z

@x
```console
docker stop <CONTAINER_ID>
docker rm <CONTAINER_ID>
```
@y
{% comment %}
```console
docker stop <CONTAINER_ID>
docker rm <CONTAINER_ID>
```
{% endcomment %}
```console
docker stop <コンテナーID>
docker rm <コンテナーID>
```
@z

@x
You can remove containers using `docker rm`. To remove a running container, you must use the `--force` flag, or stop the container using `docker stop` before removing it.
@y
{% comment %}
You can remove containers using `docker rm`. To remove a running container, you must use the `--force` flag, or stop the container using `docker stop` before removing it.
{% endcomment %}
コンテナーの削除には`docker rm`を用います。
コンテナーが実行中である場合には`--force`フラグをつける必要があります。
あるいは削除の前に`docker stop`を実行してコンテナーを停止させておくことが必要です。
@z

@x
> **Note**
>
> The semantics of restarting a container on ACI are different to those when using a local Docker context for local development. On ACI, the container will be reset to its initial state and started on a new node. This includes the container's filesystem so all state that is not stored in a volume will be lost on restart.
@y
{% comment %}
> **Note**
> 
> The semantics of restarting a container on ACI are different to those when using a local Docker context for local development. On ACI, the container will be reset to its initial state and started on a new node. This includes the container's filesystem so all state that is not stored in a volume will be lost on restart.
{% endcomment %}
> **メモ**
>
> ACI 上においてコンテナーを再起動する意味は、ローカル環境においてローカルな Docker コンテキストを利用している場合とは異なります。
> ACI の場合、コンテナーはいったん初期状態にリセットされ、新たなノードとして起動されます。
> これはつまり、コンテナー内のファイルシステムにおいて、ボリューム内に保存されていない状態があったとしたら、再起動時にそれらは失われるということです。
@z

@x
## Running Compose applications
@y
{% comment %}
## Running Compose applications
{% endcomment %}
{: #running-compose-applications }
## Compose アプリケーションの実行
@z

@x
You can also deploy and manage multi-container applications defined in Compose files to ACI using the `docker compose` command.
All containers in the same Compose application are started in the same container group. Service discovery between the containers works using the service name specified in the Compose file.
Name resolution between containers is achieved by writing service names in the `/etc/hosts` file that is shared automatically by all containers in the container group.
@y
{% comment %}
You can also deploy and manage multi-container applications defined in Compose files to ACI using the `docker compose` command. To do this:
{% endcomment %}
ACI に対しては、Compose ファイルにて定義されたマルチコンテナーアプリケーションのデプロイと管理も可能です。
その際には`docker compose` コマンドを利用します。
同一の Compose アプリケーション内にあるコンテナーは、すべて同一のコンテナーグループ内において起動されます。
コンテナー間におけるサービス検出は、Compose ファイル内に指定されたサービス名を用いて行われます。
コンテナー間における名前解決は、`/etc/hosts`ファイル内にサービス名を記述することによって実現されます。
`/etc/hosts`ファイルは、コンテナーグループ内であればすべてのコンテナーが自動的に共有します。
@z

@x
1. Ensure you are using your ACI context. You can do this either by specifying the `--context myacicontext` flag or by setting the default context using the command  `docker context use myacicontext`.
@y
{% comment %}
1. Ensure you are using your ACI context. You can do this either by specifying the `--context myacicontext` flag or by setting the default context using the command  `docker context use myacicontext`.
{% endcomment %}
1. ACI コンテキストを利用していることが必要です。
   これは`--context myacicontext`フラグを指定するか、あるいはデフォルトのコンテキストを設定するコマンド`docker context use myacicontext`を実行します。
@z

@x
2. Run `docker compose up` and `docker compose down` to start and then stop a full Compose application.
@y
{% comment %}
2. Run `docker compose up` and `docker compose down` to start and then stop a full Compose application.
{% endcomment %}
2. `docker compose up`と`docker compose down`を実行して、Compose アプリケーションの開始、停止ができることが必要です。
@z

@x
  By default, `docker compose up` uses the `docker-compose.yaml` file in the current folder. You can specify the working directory using the  --workdir  flag or specify the Compose file directly using the `--file` flag.
@y
  {% comment %}
  By default, `docker compose up` uses the `docker-compose.yaml` file in the current folder. You can specify the working directory using the  --workdir  flag or specify the Compose file directly using the `--file` flag.
  {% endcomment %}
  デフォルトにおいて`docker compose up`は、カレントフォルダーの`docker-compose.yaml`ファイルを利用します。
  ワーキングディレクトリは --workdir フラグにより指定することができます。
  また Compose ファイルを直接`--file`フラグを使って指定することもできます。
@z

@x
  You can also specify a name for the Compose application using the `--project-name` flag during deployment. If no name is specified, a name will be derived from the working directory.
@y
  {% comment %}
  You can also specify a name for the Compose application using the `--project-name` flag during deployment. If no name is specified, a name will be derived from the working directory.
  {% endcomment %}
  Compose アプリケーションのデプロイの際に`--project-name`フラグを使って、アプリケーション名を指定することもできます。
  アプリケーション名の指定がなかった場合は、ワーキングディレクトリから名前が定められます。
@z

@x
  Containers started as part of Compose applications will be displayed along with single containers when using `docker ps`. Their container ID will be of the format: `<COMPOSE-PROJECT>_<SERVICE>`.
  These containers cannot be stopped, started, or removed independently since they are all part of the same ACI container group.
  You can view each container's logs with `docker logs`. You can list deployed Compose applications with `docker compose ls`. This will list only compose applications, not single containers started with `docker run`. You can remove a Compose application with `docker compose down`.
@y
  {% comment %}
  Containers started as part of Compose applications will be displayed along with single containers when using `docker ps`. Their container ID will be of the format: `<COMPOSE-PROJECT>_<SERVICE>`.
  These containers cannot be stopped, started, or removed independently since they are all part of the same ACI container group.
  You can view each container's logs with `docker logs`. You can list deployed Compose applications with `docker compose ls`. This will list only compose applications, not single containers started with `docker run`. You can remove a Compose application with `docker compose down`.
  {% endcomment %}
  Compose アプリケーションの一部として起動したコンテナーは、`docker ps`を実行した際に、単一のコンテナーとともに表示されます。
  そのコンテナーの ID は`<Composeプロジェクト>_<サービス>`という書式です。
  こういったコンテナーは、個別に停止、起動、削除を行うことはできません。
  これらは同一の ACI コンテナーグループを構成する一部であるからです。
  各コンテナーのログは`docker logs`を使って参照します。
  デプロイを行った Compose アプリケーションの一覧は`docker compose ls`を実行します。
  この場合の一覧には Compose アプリケーションのみが表示され、`docker run`によって起動した単一のコンテナーは表示されません。
  Compose アプリケーションを削除するには`docker compose down`を実行します。
@z

@x
> **Note**
>
> The current Docker Azure integration does not allow fetching a combined log stream from all the containers that make up the Compose application.
@y
{% comment %}
> **Note**
>
> The current Docker Azure integration does not allow fetching a combined log stream from all the containers that make up the Compose application.
{% endcomment %}
> **メモ**
>
> 現時点の Docker Azure 統合では、Compose アプリケーションを構成するコンテナーからのログを、すべて集めて取得するようなことはできません。
@z

@x
## Updating applications
@y
{% comment %}
## Updating applications
{% endcomment %}
{: #updating-applications }
## アプリケーションの更新
@z

@x
From a deployed Compose application, you can update the application by re-deploying it with the same project name: `docker compose up --project-name PROJECT`.
@y
{% comment %}
From a deployed Compose application, you can update the application by re-deploying it with the same project name: `docker compose up --project-name PROJECT`.
{% endcomment %}
デプロイされた Compose アプリケーションに対しては、同一のプロジェクト名を用いて、`docker compose up --project-name PROJECT`のようにアプリケーションの再デプロイを行い、アプリケーションの更新を行うことができます。
@z

@x
Updating an application means the ACI node will be reused, and the application will keep the same IP address that was previously allocated to expose ports, if any. ACI has some limitations on what can be updated in an existing application (you will not be able to change CPU/memory reservation for example), in these cases, you need to deploy a new application from scratch.
@y
{% comment %}
Updating an application means the ACI node will be reused, and the application will keep the same IP address that was previously allocated to expose ports, if any. ACI has some limitations on what can be updated in an existing application (you will not be able to change CPU/memory reservation for example), in these cases, you need to deploy a new application from scratch.
{% endcomment %}
アプリケーションを更新すると ACI ノードは再利用されます。
そして公開ポートに割り当てられていた IP アドレスは、どのようなものであっても同一値が維持されます。
ACI においては、既存アプリケーションへのアップデート内容によって制限が発生するものがあります（たとえば CPU/メモリの予約確保量を制限することはできません）。
その場合は、アプリケーションを新たに一からデプロイすることが必要です。
@z

@x
Updating is the default behavior if you invoke `docker compose up` on an already deployed Compose file, as the Compose project name is derived from the directory where the Compose file is located by default. You need to explicitly execute `docker compose down` before running `docker compose up` again in order to totally reset a Compose application.
@y
{% comment %}
Updating is the default behavior if you invoke `docker compose up` on an already deployed Compose file, as the Compose project name is derived from the directory where the Compose file is located by default. You need to explicitly execute `docker compose down` before running `docker compose up` again in order to totally reset a Compose application.
{% endcomment %}
すでにデプロイされた Compose ファイルに対して`docker compose up`を実行すれば、アプリケーションを更新するのがデフォルトの動作です。
そのときにはデフォルトで、Compose ファイルがあるディレクトリ名から Compose プロジェクト名を取り出します。
Compose アプリケーションを完全にリセットしたいのであれば、再度`docker compose up`を実行する前に、明示的に`docker compose down`を実行することが必要です。
@z

@x
## Releasing resources
@y
{% comment %}
## Releasing resources
{% endcomment %}
{: #releasing-resources }
## リソースの解放
@z

@x
Single containers and Compose applications can be removed from ACI with
the `docker prune` command. The `docker prune` command removes deployments
that are not currently running. To remove running depoyments, you can specify
`--force`. The `--dry-run` option lists deployments that are planned for
removal, but it doesn't actually remove them.
@y
{% comment %}
Single containers and Compose applications can be removed from ACI with
the `docker prune` command. The `docker prune` command removes deployments
that are not currently running. To remove running depoyments, you can specify
`--force`. The `--dry-run` option lists deployments that are planned for
removal, but it doesn't actually remove them.
{% endcomment %}
単独のコンテナーや Compose アプリケーションは`docker prune`コマンドを使って ACI から削除することができます。
`docker prune`コマンドは、現在実行されていないデプロイ内容を削除します。
実行中のデプロイ内容を削除するには`--force`を指定します。
`--dry-run`オプションを使えば、削除予定のデプロイ一覧が表示されます。
ただしこれは実際に削除を行うものではありません。
@z

@x
```console
$ ./bin/docker --context acicontext prune --dry-run --force
Resources that would be deleted:
my-application
Total CPUs reclaimed: 2.01, total memory reclaimed: 2.30 GB
```
@y
```console
$ ./bin/docker --context acicontext prune --dry-run --force
Resources that would be deleted:
my-application
Total CPUs reclaimed: 2.01, total memory reclaimed: 2.30 GB
```
@z

@x
## Exposing ports
@y
{% comment %}
## Exposing ports
{% endcomment %}
{: #exposing-ports }
## ポートの公開
@z

@x
Single containers and Compose applications can optionally expose ports.
For single containers, this is done using the `--publish` (`-p`) flag of the `docker run` command : `docker run -p 80:80 nginx`.
@y
{% comment %}
Single containers and Compose applications can optionally expose ports.
For single containers, this is done using the `--publish` (`-p`) flag of the `docker run` command : `docker run -p 80:80 nginx`.
{% endcomment %}
単独のコンテナーや Compose アプリケーションは、オプションとしてポートを公開することができます。
単独のコンテナーの場合は、`docker run`コマンドに`--publish`（`-p`）フラグをつけて`docker run -p 80:80 nginx`のように実行します。
@z

@x
For Compose applications, you must specify exposed ports in the Compose file service definition:
@y
{% comment %}
For Compose applications, you must specify exposed ports in the Compose file service definition:
{% endcomment %}
また Compose アプリケーションの場合は、Compose ファイルのサービス定義において、公開するポートを設定する必要があります。
@z

@x
```yaml
services:
  nginx:
    image: nginx
    ports:
      - "80:80"
```
@y
```yaml
services:
  nginx:
    image: nginx
    ports:
      - "80:80"
```
@z

@x
> **Note**
>
> ACI does not allow port mapping (that is, changing port number while exposing port). Therefore, the source and target ports must be the same when deploying to ACI.
>
> All containers in the same Compose application are deployed in the same ACI container group. Different containers in the same Compose application cannot expose the same port when deployed to ACI.
@y
{% comment %}
> **Note**
>
> ACI does not allow port mapping (that is, changing port number while exposing port). Therefore, the source and target ports must be the same when deploying to ACI.
>
> All containers in the same Compose application are deployed in the same ACI container group. Different containers in the same Compose application cannot expose the same port when deployed to ACI.
{% endcomment %}
> **メモ**
>
> ACI ではポートマッピングを行うことはできません（つまりポート公開においてポート番号を変更することはできません）。
> したがって ACI へのデプロイにあたって公開元も公開先も同一のポートでなければなりません。
>
> Compose アプリケーション内に含まれるコンテナーはすべて、同一の ACI コンテナーグループとしてデプロイされます。
> 同一の Compose アプリケーション内の異なるコンテナーは、ACI へのデプロイに際して同一のポートを公開することはできません。
@z

@x
By default, when exposing ports for your application, a random public IP address is associated with the container group supporting the deployed application (single container or Compose application).
This IP address can be obtained when listing containers with `docker ps` or using `docker inspect`.
@y
{% comment %}
By default, when exposing ports for your application, a random public IP address is associated with the container group supporting the deployed application (single container or Compose application).
This IP address can be obtained when listing containers with `docker ps` or using `docker inspect`.
{% endcomment %}
アプリケーションにおいてポート公開を行う際には、デプロイするアプリケーション（単独のコンテナーまたは Compose アプリケーション）に対応するコンテナーグループに対して、ランダムな公開 IP アドレスが関連づけられるのがデフォルトです。
この IP アドレスは`docker ps`を使ってコンテナーを一覧表示したり、`docker inspect`を実行したりしたときに確認することができます。
@z

@x
### DNS label name
@y
{% comment %}
### DNS label name
{% endcomment %}
{: #dns-label-name }
### DNS ラベル名
@z

@x
In addition to exposing ports on a random IP address, you can specify a DNS label name to expose your application on an FQDN of the form: `<NAME>.region.azurecontainer.io`.
@y
{% comment %}
In addition to exposing ports on a random IP address, you can specify a DNS label name to expose your application on an FQDN of the form: `<NAME>.region.azurecontainer.io`.
{% endcomment %}
ランダムな IP アドレスに対するポート公開に加えて、アプリケーションを FQDN の形式で公開するための DNS ラベル名を指定することができます。
たとえば`<NAME>.region.azurecontainer.io`という形式です。
@z

@x
You can set this name with the `--domainname` flag when performing a `docker run`, or by using the `domainname` field in the Compose file when performing a `docker compose up`:
@y
{% comment %}
You can set this name with the `--domainname` flag when performing a `docker run`, or by using the `domainname` field in the Compose file when performing a `docker compose up`:
{% endcomment %}
この名前は`docker run`の実行時に`--domainname`フラグを用いて設定します。
あるいは Compose ファイル内の`domainname`項目を利用して`docker compose up`により実現します。
@z

@x
```yaml
services:
  nginx:
    image: nginx
    domainname: "myapp"
    ports:
      - "80:80"
```
@y
```yaml
services:
  nginx:
    image: nginx
    domainname: "myapp"
    ports:
      - "80:80"
```
@z

@x
> **Note**
>
> The domain of a Compose application can only be set once, if you specify the
> `domainname` for several services, the value must be identical.
>
> The FQDN `<DOMAINNAME>.region.azurecontainer.io` must be available.
@y
{% comment %}
> **Note**
>
> The domain of a Compose application can only be set once, if you specify the
> `domainname` for several services, the value must be identical.
>
> The FQDN `<DOMAINNAME>.region.azurecontainer.io` must be available.
{% endcomment %}
> **メモ**
>
> 複数のサービスに対して`domainname`を設定していたとしても、Compose アプリケーションのドメイン設定が行われるのは一度だけです。
> したがってそれらは同一でなければなりません。
>
> FQDN である`<DOMAINNAME>.region.azurecontainer.io`が利用可能です。
@z

@x
## Using Azure file share as volumes in ACI containers
@y
{% comment %}
## Using Azure file share as volumes in ACI containers
{% endcomment %}
{: #using-azure-file-share-as-volumes-in-aci-containers }
## ACI コンテナー内での Azure ファイル共有のボリュームとしての利用
@z

@x
You can deploy containers or Compose applications that use persistent data
stored in volumes. Azure File Share can be used to support volumes for ACI
containers.
@y
{% comment %}
You can deploy containers or Compose applications that use persistent data
stored in volumes. Azure File Share can be used to support volumes for ACI
containers.
{% endcomment %}
コンテナーや Compose アプリケーションにおいてボリュームを使ったデータ保存を行っている場合でも、デプロイすることが可能です。
Azure ファイル共有を使えば、ACI コンテナーに対してのボリュームをサポートしています。
@z

@x
Using an existing Azure File Share with storage account name `mystorageaccount`
and file share name `myfileshare`, you can specify a volume in your deployment `run`
command as follows:
@y
{% comment %}
Using an existing Azure File Share with storage account name `mystorageaccount`
and file share name `myfileshare`, you can specify a volume in your deployment `run`
command as follows:
{% endcomment %}
既存の Azure ファイル共有を利用して、ストレージアカウント名 が`mystorageaccount`、ファイル共有名が`myfileshare`であるとしたときに、デプロイにおける`run`コマンド実行を以下のように指定できます。
@z

@x
```console
docker run -v mystorageaccount/myfileshare:/target/path myimage
```
@y
```console
docker run -v mystorageaccount/myfileshare:/target/path myimage
```
@z

@x
The runtime container will see the file share content in `/target/path`.
@y
{% comment %}
The runtime container will see the file share content in `/target/path`.
{% endcomment %}
これにより実行中のコンテナーからは、ファイル共有内容は`/target/path`に見えるようになります。
@z

@x
In a Compose application, the volume specification must use the following syntax
in the Compose file:
@y
{% comment %}
In a Compose application, the volume specification must use the following syntax
in the Compose file:
{% endcomment %}
Compose アプリケーションにおいて、ボリュームの指定は Compose ファイル内において以下のような文法に従う必要があります。
@z

@x
```yaml
myservice:
  image: nginx
  volumes:
    - mydata:/mount/testvolumes

volumes:
  mydata:
    driver: azure_file
    driver_opts:
      share_name: myfileshare
      storage_account_name: mystorageaccount
```
@y
```yaml
myservice:
  image: nginx
  volumes:
    - mydata:/mount/testvolumes

volumes:
  mydata:
    driver: azure_file
    driver_opts:
      share_name: myfileshare
      storage_account_name: mystorageaccount
```
@z

@x
> **Note**
>
> The volume short syntax in Compose files cannot be used as it is aimed at volume definition for local bind mounts. Using the volume driver and driver option syntax in Compose files makes the volume definition a lot more clear.
@y
{% comment %}
> **Note**
>
> The volume short syntax in Compose files cannot be used as it is aimed at volume definition for local bind mounts. Using the volume driver and driver option syntax in Compose files makes the volume definition a lot more clear.
{% endcomment %}
> **メモ**
>
> Compose ファイル内においては、ボリュームを短い文法で記述することはできません。
> ボリューム定義というものは、ローカルのバインドマウント向けを目的としているためです。
> Compose ファイルにおいては、ボリュームドライバーやそのオプションを利用すれば、ボリューム定義がより明確になります。
@z

@x
In single or multi-container deployments, the Docker CLI will use your Azure login to fetch the key to the storage account, and provide this key with the container deployment information, so that the container can access the volume.
Volumes can be used from any file share in any storage account you have access to with your Azure login. You can specify `rw` (read/write) or `ro` (read only) when mounting the volume (`rw` is the default).
@y
{% comment %}
In single or multi-container deployments, the Docker CLI will use your Azure login to fetch the key to the storage account, and provide this key with the container deployment information, so that the container can access the volume.
Volumes can be used from any file share in any storage account you have access to with your Azure login. You can specify `rw` (read/write) or `ro` (read only) when mounting the volume (`rw` is the default).
{% endcomment %}
単一または複数コンテナーのデプロイにおいて Docker CLI は、Azure ストレージアカウントに対する鍵情報を取得するために Azure ログインを行います。
そしてこの鍵をコンテナーデプロイ情報に利用します。
こうしてコンテナーがボリュームにアクセスできるようになります。
Azure ログインによってアクセスするストレージアカウント内であれば、ボリュームはどのファイル共有からでも利用できます。
ボリュームマウントの際には`rw`（読み書き）または`ro`（読み取り専用）を指定します（デフォルトは`rw`です）。
@z

@x
### Managing Azure volumes
@y
{% comment %}
### Managing Azure volumes
{% endcomment %}
{: #managing-azure-volumes }
### Azure ボリュームの管理
@z

@x
To create a volume that you can use in containers or Compose applications when
using your ACI Docker context, you can use the `docker volume create` command,
and specify an Azure storage account name and the file share name:
@y
{% comment %}
To create a volume that you can use in containers or Compose applications when
using your ACI Docker context, you can use the `docker volume create` command,
and specify an Azure storage account name and the file share name:
{% endcomment %}
ACI Docker コンテキストを利用して、コンテナーや Compose アプリケーション内で用いるボリュームを生成するには、`docker volume create` コマンドを実行します。
そこで Azure ストレージアカウント名とファイル共有名を指定します。
@z

@x
```console
$ docker --context aci volume create test-volume --storage-account mystorageaccount
[+] Running 2/2
 ⠿ mystorageaccount  Created                         26.2s
 ⠿ test-volume       Created                          0.9s
mystorageaccount/test-volume
```
@y
```console
$ docker --context aci volume create test-volume --storage-account mystorageaccount
[+] Running 2/2
 ⠿ mystorageaccount  Created                         26.2s
 ⠿ test-volume       Created                          0.9s
mystorageaccount/test-volume
```
@z

@x
By default, if the storage account does not already exist, this command
creates a new storage account using the Standard LRS as a default SKU, and the
resource group and location associated with your Docker ACI context.
@y
{% comment %}
By default, if the storage account does not already exist, this command
creates a new storage account using the Standard LRS as a default SKU, and the
resource group and location associated with your Docker ACI context.
{% endcomment %}
ストレージアカウントが存在しない場合、このコマンドがデフォルト SKU として 標準 LRS を利用してストレージアカウントを新規生成します。
そしてリソースグループや Docker ACI コンテキストに関連するディレクトリを生成します。
@z

@x
If you specify an existing storage account, the command creates a new
file share in the existing account:
@y
{% comment %}
If you specify an existing storage account, the command creates a new
file share in the existing account:
{% endcomment %}
既存のストレージアカウントを指定した場合、このコマンドはそのアカウント内にファイル共有を新規生成します。
@z

@x
```console
$ docker --context aci volume create test-volume2 --storage-account mystorageaccount
[+] Running 2/2
 ⠿ mystorageaccount   Use existing                    0.7s
 ⠿ test-volume2       Created                         0.7s
mystorageaccount/test-volume2
```
@y
```console
$ docker --context aci volume create test-volume2 --storage-account mystorageaccount
[+] Running 2/2
 ⠿ mystorageaccount   Use existing                    0.7s
 ⠿ test-volume2       Created                         0.7s
mystorageaccount/test-volume2
```
@z

@x
Alternatively, you can create an Azure storage account or a file share using the Azure
portal, or the `az` [command line](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-cli).
@y
{% comment %}
Alternatively, you can create an Azure storage account or a file share using the Azure
portal, or the `az` [command line](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-cli).
{% endcomment %}
別の方法として Azure ストレージアカウントを生成するか、
Azure ポータル、つまり`az`[コマンドライン](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-cli) を用いてファイル共有を生成することができます。
@z

@x
You can also list volumes that are available for use in containers or Compose applications:
@y
{% comment %}
You can also list volumes that are available for use in containers or Compose applications:
{% endcomment %}
コンテナーや Compose アプリケーションにおいて利用可能なボリュームの一覧を確認することができます。
@z

@x
```console
$ docker --context aci volume ls
ID                                 DESCRIPTION
mystorageaccount/test-volume       Fileshare test-volume in mystorageaccount storage account
mystorageaccount/test-volume2      Fileshare test-volume2 in mystorageaccount storage account
```
@y
```console
$ docker --context aci volume ls
ID                                 DESCRIPTION
mystorageaccount/test-volume       Fileshare test-volume in mystorageaccount storage account
mystorageaccount/test-volume2      Fileshare test-volume2 in mystorageaccount storage account
```
@z

@x
To delete a volume and the corresponding Azure file share, use the `volume rm` command:
@y
{% comment %}
To delete a volume and the corresponding Azure file share, use the `volume rm` command:
{% endcomment %}
ボリュームと対応する Azure ファイル共有を削除するには`volume rm`コマンドを実行します。
@z

@x
```console
$ docker --context aci volume rm mystorageaccount/test-volume
mystorageaccount/test-volume
```
@y
```console
$ docker --context aci volume rm mystorageaccount/test-volume
mystorageaccount/test-volume
```
@z

@x
This permanently deletes the Azure file share and all its data.
@y
{% comment %}
This permanently deletes the Azure file share and all its data.
{% endcomment %}
これによって Azure ファイル共有とこれに関連するデータは、完全に削除されます。
@z

@x
When deleting a volume in Azure, the command checks whether the specified file share
is the only file share available in the storage account. If the storage account is
created with the `docker volume create` command, `docker volume rm` also
deletes the storage account when it does not have any file shares.
If you are using a storage account created without the `docker volume create` command
(through Azure portal or with the `az` command line for example), `docker volume rm`
does not delete the storage account, even when it has zero remaining file shares.
@y
{% comment %}
When deleting a volume in Azure, the command checks whether the specified file share
is the only file share available in the storage account. If the storage account is
created with the `docker volume create` command, `docker volume rm` also
deletes the storage account when it does not have any file shares.
If you are using a storage account created without the `docker volume create` command
(through Azure portal or with the `az` command line for example), `docker volume rm`
does not delete the storage account, even when it has zero remaining file shares.
{% endcomment %}
Azure においてボリュームを削除するとこのコマンドは、指定されたファイル共有が、そのストレージアカウントにおいてのみ利用されているファイル共有であるかどうかをチェックします。
そのストレージアカウントが`docker volume create`コマンドによって作り出されたものである場合、`docker volume rm` コマンドは、ストレージアカウントがファイル共有を持っていなければ、ストレージアカウントも削除します。
逆にストレージアカウントが（たとえば Azure ポータルや`az`コマンドを使った場合のように）`docker volume create` 以外において生成されたものである場合は、`docker volume rm` はストレージアカウントを削除しません。
そのアカウントが一つのファイル共有も残っていなかったとしてもです。
@z

@x
## Environment variables
@y
{% comment %}
## Environment variables
{% endcomment %}
{: #environment-variables }
## 環境変数
@z

@x
When using `docker run`, you can pass the environment variables to ACI containers using the `--env` flag.
For Compose applications, you can specify the environment variables in the Compose file with the `environment` or `env-file` service field, or with the `--environment` command line flag.
@y
{% comment %}
When using `docker run`, you can pass the environment variables to ACI containers using the `--env` flag.
For Compose applications, you can specify the environment variables in the Compose file with the `environment` or `env-file` service field, or with the `--environment` command line flag.
{% endcomment %}
`docker run`の実行時には、`--env`フラグを利用して ACI コンテナーに環境変数を受け渡すことができます。
Compose アプリケーションの場合は、Compose ファイル内においてサービス項目`environment`または`env-file`において環境変数を指定するか、あるいはコマンドラインフラグ`--environment`を利用して指定します。
@z

@x
## Health checks
@y
{% comment %}
## Health checks
{% endcomment %}
{: #health-checks }
## ヘルスチェック
@z

@x
You can specify a container health checks using either the `--healthcheck-` prefixed flags with `docker run`, or in a Compose file with the `healthcheck` section of the service.
@y
{% comment %}
You can specify a container health checks using either the `--healthcheck-` prefixed flags with `docker run`, or in a Compose file with the `healthcheck` section of the service.
{% endcomment %}
コンテナーのヘルスチェックを行うことができます。
`docker run`の実行においては`--healthcheck-`をプレフィックスに持つフラグを利用します。
また Compose ファイルにおいては、そのサービスの`healthcheck`セクションを利用します。
@z

@x
Health checks are converted to ACI `LivenessProbe`s. ACI runs the health check command periodically, and if it fails, the container will be terminated.
@y
{% comment %}
Health checks are converted to ACI `LivenessProbe`s. ACI runs the health check command periodically, and if it fails, the container will be terminated.
{% endcomment %}
ヘルスチェックは ACI の`LivenessProbe`に変換されます。
ACI ではヘルスチェックコマンドを定期的に実行します。
チェックに失敗したとき、そのコンテナーは停止されます。
@z

@x
Health checks must be used in addition to restart policies to ensure the container is then restarted on termination. The default restart policy for `docker run` is `no` which will not restart the container. The default restart policy for Compose is `any` which will always try restarting the service containers.
@y
{% comment %}
Health checks must be used in addition to restart policies to ensure the container is then restarted on termination. The default restart policy for `docker run` is `no` which will not restart the container. The default restart policy for Compose is `any` which will always try restarting the service containers.
{% endcomment %}
したがってヘルスチェックには再起動ポリシーを含めて利用することが必要であり、コンテナーの停止後に再起動させることが必要です。
`docker run`におけるデフォルトの再起動ポリシーは`no`であり、これはコンテナーを再起動しません。
Compose に対するデフォルトの再起動ポリシーは`any`であり、これは常にサービスコンテナーを再起動します。
@z

@x
Example using `docker run`:
@y
{% comment %}
Example using `docker run`:
{% endcomment %}
`docker run`の実行例は以下のとおりです。
@z

@x
```console
docker --context acicontext run -p 80:80 --restart always --health-cmd "curl http://localhost:80" --health-interval 3s  nginx
```
@y
```console
docker --context acicontext run -p 80:80 --restart always --health-cmd "curl http://localhost:80" --health-interval 3s  nginx
```
@z

@x
Example using Compose files:
@y
{% comment %}
Example using Compose files:
{% endcomment %}
Compose ファイルの利用例は以下のとおりです。
@z

@x
```yaml
services:
  web:
    image: nginx
    deploy:
      restart_policy:
        condition: on-failure
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:80"]
      interval: 10s
```
@y
```yaml
services:
  web:
    image: nginx
    deploy:
      restart_policy:
        condition: on-failure
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:80"]
      interval: 10s
```
@z

@x
## Private Docker Hub images and using the Azure Container Registry
@y
{% comment %}
## Private Docker Hub images and using the Azure Container Registry
{% endcomment %}
{: #private-docker-hub-images-and-using-the-azure-container-registry }
## プライベートな Docker Hub イメージと Azure コンテナーレジストリの利用
@z

@x
You can deploy private images to ACI that are hosted by any container registry. You need to log into the relevant registry using `docker login` before running `docker run` or `docker compose up`. The Docker CLI will fetch your registry login for the deployed images and send the credentials along with the image deployment information to ACI.
In the case of the Azure Container Registry, the command line will try to automatically log you into ACR from your Azure login. You don't need to manually login to the ACR registry first, if your Azure login has access to the ACR.
@y
{% comment %}
You can deploy private images to ACI that are hosted by any container registry. You need to log into the relevant registry using `docker login` before running `docker run` or `docker compose up`. The Docker CLI will fetch your registry login for the deployed images and send the credentials along with the image deployment information to ACI.
In the case of the Azure Container Registry, the command line will try to automatically log you into ACR from your Azure login. You don't need to manually login to the ACR registry first, if your Azure login has access to the ACR.
{% endcomment %}
どのようなコンテナーレジストリにホストされている ACI であっても、プライベートイメージをデプロイすることができます。
`docker run`や`docker compose up`を実行するためには、その前に`docker login`を使ってそのレジストリにログインしておくことが必要です。
Docker CLI では、デプロイイメージに対するレジストリログイン情報を取得した上で、資格情報やイメージデプロイ情報を ACI に送信します。
Azure コンテナーレジストリ（Azure Container Registry; ACR）の場合は、Azure ログインから ACR へのログインを自動的に行います。
Azure ログインから ACR へのアクセスができていれば、わざわざ ACR レジストリへのログインを手動で行う必要はなくなります。
@z

@x
## Using ACI resource groups as namespaces
@y
{% comment %}
## Using ACI resource groups as namespaces
{% endcomment %}
{: #using-aci-resource-groups-as-namespaces }
## 名前空間としての ACI リソースグループの利用
@z

@x
You can create several Docker contexts associated with ACI. Each context must be associated with a unique Azure resource group. This allows you to use Docker contexts as namespaces. You can switch between namespaces using `docker context use <CONTEXT>`.
@y
{% comment %}
You can create several Docker contexts associated with ACI. Each context must be associated with a unique Azure resource group. This allows you to use Docker contexts as namespaces. You can switch between namespaces using `docker context use <CONTEXT>`.
{% endcomment %}
ACI に関連づける Docker コンテキストは、複数用意することができます。
個々のコンテキストは、一意の Azure リソースグループに関連づいていることが必要です。
こうしておくと Docker コンテキストを名前空間として利用することができます。
`docker context use <CONTEXT>` を実行することで、複数の名前空間を切り替えることができます。
@z

@x
When you run the `docker ps` command, it only lists containers in your current Docker context. There won’t be any contention in container names or Compose application names between two Docker contexts.
@y
{% comment %}
When you run the `docker ps` command, it only lists containers in your current Docker context. There won’t be any contention in container names or Compose application names between two Docker contexts.
{% endcomment %}
`docker ps` コマンドを実行すると、現在の Docker コンテキスト内にあるコンテナーのみが一覧表示されます。
Docker コンテキストが異なれば、コンテナー名や Compose アプリケーション名が同一であっても、競合することにはなりません。
@z

@x
## Install the Docker Compose CLI on Linux
@y
{% comment %}
## Install the Docker Compose CLI on Linux
{% endcomment %}
{: #install-the-docker-compose-cli-on-linux }
## Linux における Docker Compose CLI のインストール
@z

@x
The Docker Compose CLI adds support for running and managing containers on Azure Container Instances (ACI).
@y
{% comment %}
The Docker Compose CLI adds support for running and managing containers on Azure Container Instances (ACI).
{% endcomment %}
Docker Compose CLI は、Azure コンテナーインスタンス（ACI）上でのコンテナー実行と管理をサポートします。
@z

@x
### Install Prerequisites
@y
{% comment %}
### Install Prerequisites
{% endcomment %}
{: #install-prerequisites }
### インストールの前提条件
@z

@x
- [Docker 19.03 or later](https://docs.docker.com/get-docker/)
@y
{% comment %}
- [Docker 19.03 or later](https://docs.docker.com/get-docker/)
{% endcomment %}
- [Docker 19.03 またはそれ以降](https://docs.docker.com/get-docker/)
@z

@x
### Install script
@y
{% comment %}
### Install script
{% endcomment %}
{: #install-script }
### インストールスクリプト
@z

@x
You can install the new CLI using the install script:
@y
{% comment %}
You can install the new CLI using the install script:
{% endcomment %}
新たな CLI は、インストールスクリプトを利用してインストールします。
@z

@x
```console
curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
```
@y
```console
curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
```
@z

@x
### Manual install
@y
{% comment %}
### Manual install
{% endcomment %}
{: #manual-install }
### 手動インストール
@z

@x
You can download the Docker ACI Integration CLI from the
[latest release](https://github.com/docker/compose-cli/releases/latest){: target="_blank" rel="noopener" class="_"} page.
@y
{% comment %}
You can download the Docker ACI Integration CLI from the
[latest release](https://github.com/docker/compose-cli/releases/latest){: target="_blank" rel="noopener" class="_"} page.
{% endcomment %}
Docker ACI 統合の CLI は、[最新版](https://github.com/docker/compose-cli/releases/latest){: target="_blank" rel="noopener" class="_"} ページからダウンロードすることができます。
@z

@x
You will then need to make it executable:
@y
{% comment %}
You will then need to make it executable:
{% endcomment %}
入手したらこれを実行可能にします。
@z

@x
```console
chmod +x docker-aci
```
@y
```console
chmod +x docker-aci
```
@z

@x
To enable using the local Docker Engine and to use existing Docker contexts, you
must have the existing Docker CLI as `com.docker.cli` somewhere in your
`PATH`. You can do this by creating a symbolic link from the existing Docker
CLI:
@y
{% comment %}
To enable using the local Docker Engine and to use existing Docker contexts, you
must have the existing Docker CLI as `com.docker.cli` somewhere in your
`PATH`. You can do this by creating a symbolic link from the existing Docker
CLI:
{% endcomment %}
ローカルの Docker Engine の利用を有効にするため、そして既存の Docker コンテキストを利用可能にするため、既存の Docker CLI は`com.docker.cli`として、パス上のどこかに配置する必要があります。
@z

@x
```console
ln -s /path/to/existing/docker /directory/in/PATH/com.docker.cli
```
@y
```console
ln -s /path/to/existing/docker /directory/in/PATH/com.docker.cli
```
@z

@x
> **Note**
>
> The `PATH` environment variable is a colon-separated list of
> directories with priority from left to right. You can view it using
> `echo $PATH`. You can find the path to the existing Docker CLI using
> `which docker`. You may need root permissions to make this link.
@y
{% comment %}
> **Note**
>
> The `PATH` environment variable is a colon-separated list of
> directories with priority from left to right. You can view it using
> `echo $PATH`. You can find the path to the existing Docker CLI using
> `which docker`. You may need root permissions to make this link.
{% endcomment %}
> **メモ**
>
> 環境変数`PATH`は、複数ディレクトリをコロンで区切るものであり、左にあるものが優先されます。
> 内容を確認するには`echo $PATH`を実行します。
> 既存の Docker CLI へのパスは`which docker`を使って確認できます。
> なお上のリンクを生成する際には root 権限を要するかもしれません。
@z

@x
On a fresh install of Ubuntu 20.04 with Docker Engine
[already installed](https://docs.docker.com/engine/install/ubuntu/):
@y
{% comment %}
On a fresh install of Ubuntu 20.04 with Docker Engine
[already installed](https://docs.docker.com/engine/install/ubuntu/):
{% endcomment %}
Docker Engine が [インストール](https://docs.docker.com/engine/install/ubuntu/) されている Ubuntu 20.04 の場合、初期状態では以下のようになっています。
@z

@x
```console
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
$ which docker
/usr/bin/docker
$ sudo ln -s /usr/bin/docker /usr/local/bin/com.docker.cli
```
@y
```console
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
$ which docker
/usr/bin/docker
$ sudo ln -s /usr/bin/docker /usr/local/bin/com.docker.cli
```
@z

@x
You can verify that this is working by checking that the new CLI works with the
default context:
@y
{% comment %}
You can verify that this is working by checking that the new CLI works with the
default context:
{% endcomment %}
新しい CLI が動作しているかどうかを確認するには、デフォルトのコンテキストを使って CLI を実行します。
@z

@x
```console
$ ./docker-aci --context default ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
$ echo $?
0
```
@y
```console
$ ./docker-aci --context default ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
$ echo $?
0
```
@z

@x
To make this CLI with ACI integration your default Docker CLI, you must move it
to a directory in your `PATH` with higher priority than the existing Docker CLI.
@y
{% comment %}
To make this CLI with ACI integration your default Docker CLI, you must move it
to a directory in your `PATH` with higher priority than the existing Docker CLI.
{% endcomment %}
ACI と統合された CLI を、デフォルトの Docker CLI とするためには、`PATH` 上のディレクトリにおいて、既存の Docker CLI よりも優先されるようなディレクトリに移動させる必要があります。
@z

@x
Again, on a fresh Ubuntu 20.04:
@y
{% comment %}
Again, on a fresh Ubuntu 20.04:
{% endcomment %}
再び Ubuntu 20.04 の例を見ます。
@z

@x
```console
$ which docker
/usr/bin/docker
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
$ sudo mv docker-aci /usr/local/bin/docker
$ which docker
/usr/local/bin/docker
$ docker version
...
 Azure integration  0.1.4
...
```
@y
```console
$ which docker
/usr/bin/docker
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
$ sudo mv docker-aci /usr/local/bin/docker
$ which docker
/usr/local/bin/docker
$ docker version
...
 Azure integration  0.1.4
...
```
@z

@x
### Supported commands
@y
{% comment %}
### Supported commands
{% endcomment %}
{: #supported-commands }
### サポートされているコマンド
@z

@x
After you have installed the Docker ACI Integration CLI, run `--help` to see the current list of commands.
@y
{% comment %}
After you have installed the Docker ACI Integration CLI, run `--help` to see the current list of commands.
{% endcomment %}
Docker ACI 統合の CLI をインストールしたら、`--help` をつけてコマンド実行し、この時点でのコマンド一覧を確認します。
@z

@x
### Uninstall
@y
{% comment %}
### Uninstall
{% endcomment %}
{: #uninstall }
### アンインストール
@z

@x
To remove the Docker Azure Integration CLI, you need to remove the binary you downloaded and `com.docker.cli` from your `PATH`. If you installed using the script, this can be done as follows:
@y
{% comment %}
To remove the Docker Azure Integration CLI, you need to remove the binary you downloaded and `com.docker.cli` from your `PATH`. If you installed using the script, this can be done as follows:
{% endcomment %}
Docker Azure 統合の CLI を削除する場合は、ダウンロードしたバイナリと`com.docker.cli`を`PATH`上から削除します。
スクリプトを通じてインストールを行った場合は、以下により削除することができます。
@z

@x
```console
sudo rm /usr/local/bin/docker /usr/local/bin/com.docker.cli
```
@y
```console
sudo rm /usr/local/bin/docker /usr/local/bin/com.docker.cli
```
@z

@x
## Feedback
@y
{% comment %}
## Feedback
{% endcomment %}
{: #feedback }
## フィードバック
@z

@x
Thank you for trying out Docker Azure Integration. Your feedback is very important to us. Let us know your feedback by creating an issue in the [compose-cli](https://github.com/docker/compose-cli){: target="_blank" rel="noopener" class="_"} GitHub repository.
@y
{% comment %}
Thank you for trying out Docker Azure Integration. Your feedback is very important to us. Let us know your feedback by creating an issue in the [compose-cli](https://github.com/docker/compose-cli){: target="_blank" rel="noopener" class="_"} GitHub repository.
{% endcomment %}
Docker Azure 統合ベータ版を利用していただき、ありがとうございます。
みなさんからのフィードバックが大変重要です。
フィードバックをいただくには、Github レポジトリ [compose-cli](https://github.com/docker/compose-cli){: target="_blank" rel="noopener" class="_"} に issue をあげてください。
@z
