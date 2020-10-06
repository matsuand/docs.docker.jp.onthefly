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
>**Note**
>
> Docker Azure Integration is currently a beta release. The commands and flags are subject to change in subsequent releases.
{:.important}
@y
{% comment %}
>**Note**
>
> Docker Azure Integration is currently a beta release. The commands and flags are subject to change in subsequent releases.
{:.important}
{% endcomment %}
>**メモ**
>
> Docker Azure 統合は、現在ベータ版として提供されます。
> 提供されるコマンドやフラグは、将来のリリースにおいて変更されることがあります。
{:.important}
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
    - [Download for Mac](https://desktop.docker.com/mac/edge/Docker.dmg){: target="_blank" class="_"}
    - [Download for Windows](https://desktop.docker.com/win/edge/Docker%20Desktop%20Installer.exe){: target="_blank" class="_"}
@y
    - [Download for Mac](https://desktop.docker.com/mac/edge/Docker.dmg){: target="_blank" class="_"}
    - [Download for Windows](https://desktop.docker.com/win/edge/Docker%20Desktop%20Installer.exe){: target="_blank" class="_"}
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
2. Ensure you have an Azure subscription. You can get started with an [Azure free account](https://aka.ms/AA8r2pj){: target="_blank" class="_"}.
@y
{% comment %}
2. Ensure you have an Azure subscription. You can get started with an [Azure free account](https://aka.ms/AA8r2pj){: target="_blank" class="_"}.
{% endcomment %}
2. Azure サブスクリプションを持っていることが必要です。
   [Azure free account](https://aka.ms/AA8r2pj){: target="_blank" class="_"} にアクセスして取得操作を進めることができます。
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
あるいは Compose ファイルに定義されたマルチコンテナーのアプリケーションを `docker compose up` コマンドを使ってデプロイできるようになります。
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
@y
{% comment %}
This opens your web browser and prompts you to enter your Azure login credentials.
{% endcomment %}
コマンドを実行するとウェブブラウザーが開き、Azure のログイン情報の入力が求められます。
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
その場合には Azure サービスプリンシパルを利用し `docker login azure --client-id xx --client-secret yy --tenant-id zz` のようにコマンド実行します。
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
After you have logged in, you need to create a Docker context associated with ACI to deploy containers in ACI. For example, let us create a new context called `myacicontext`:
@y
{% comment %}
After you have logged in, you need to create a Docker context associated with ACI to deploy containers in ACI. For example, let us create a new context called `myacicontext`:
{% endcomment %}
ログインした後は、ACI においてコンテナーをデプロイできるようにするために、ACI に関する Docker コンテキストを生成することが必要です。
たとえば新たなコンテキストとして `myacicontext` を生成することにします。
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
必要であれば CLI の以下のようなフラグ `--subscription-id`、`--resource-group`、`--location` を使って指定することもできます。
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
> **Note**
>
> If you need to change the subscription and create a new context, you must 
execute the `docker login azure` command again.
@y
{% comment %}
> **Note**
>
> If you need to change the subscription and create a new context, you must 
execute the `docker login azure` command again.
{% endcomment %}
> **メモ**
>
> サブスクリプションの切り替えが必要となって、新たなコンテキストを生成した場合には、`docker login azure` コマンドを再び実行する必要があります。
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
1 つは Docker コマンドにおいて `--context` フラグを利用する方法です。
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
もう 1 つは `docker context use` を使ってコンテキストを切り替える方法です。
Docker コマンドの実行にあたって、対象とするコンテキストを ACI コンテキストとする方法です。
たとえば `docker context use` コマンドを利用して、nginx コンテナーをデプロイしてみます。
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
After you've switched to the `myacicontext` context, you can use docker ps to list your containers running on ACI.
@y
{% comment %}
After you've switched to the `myacicontext` context, you can use docker ps to list your containers running on ACI.
{% endcomment %}
コンテキストを `myacicontext` に切り替えたら、docker ps を使って、ACI 上に動作するコンテナー一覧を確認することができます。
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
> **Note**
> 
> The stop command in ACI differs from the Moby stop command as a stopped 
container will not retain its state when it is started again on ACI.
@y
{% comment %}
> **Note**
> 
> The stop command in ACI differs from the Moby stop command as a stopped 
container will not retain its state when it is started again on ACI.
{% endcomment %}
> **メモ**
> 
> ACI における stop コマンドは Moby の stop コマンドとは異なります。
> 停止させたコンテナーは、ACI 上において再起動させても元の状態は保持されません。
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
You can also deploy and manage multi-container applications defined in Compose files to ACI using the `docker compose` command. To do this:
@y
{% comment %}
You can also deploy and manage multi-container applications defined in Compose files to ACI using the `docker compose` command. To do this:
{% endcomment %}
ACI に対しては、Compose ファイルにて定義されたマルチコンテナーアプリケーションのデプロイと管理も可能です。
その際には`docker compose` コマンドを利用します。
そしてこれを実現するにあたっては、以下が必要です。
@z

@x
1. Ensure you are using your ACI context. You can do this either by specifying the `--context myacicontext` flag or by setting the default context using the command  `docker context use myacicontext`.
@y
{% comment %}
1. Ensure you are using your ACI context. You can do this either by specifying the `--context myacicontext` flag or by setting the default context using the command  `docker context use myacicontext`.
{% endcomment %}
1. ACI コンテキストを利用していることが必要です。
   これは `--context myacicontext` フラグを指定するか、あるいはデフォルトのコンテキストを設定するコマンド  `docker context use myacicontext` を実行します。
@z

@x
2. Run `docker compose up` and `docker compose down` to start and then stop a full Compose application.
@y
{% comment %}
2. Run `docker compose up` and `docker compose down` to start and then stop a full Compose application.
{% endcomment %}
2. `docker compose up` と `docker compose down` を実行して、Compose アプリケーションの開始、停止ができることが必要です。
@z

@x
  By default, `docker compose up` uses the `docker-compose.yaml` file in the current folder. You can specify the working directory using the  --workdir  flag or specify the Compose file directly using the `--file` flag.
@y
  {% comment %}
  By default, `docker compose up` uses the `docker-compose.yaml` file in the current folder. You can specify the working directory using the  --workdir  flag or specify the Compose file directly using the `--file` flag.
  {% endcomment %}
  デフォルトにおいて `docker compose up` は、カレントフォルダーの `docker-compose.yaml` ファイルを利用します。
  ワーキングディレクトリは --workdir フラグにより指定することができます。
  また Compose ファイルを直接 `--file` フラグを使って指定することもできます。
@z

@x
  You can also specify a name for the Compose application using the `--project-name` flag during deployment. If no name is specified, a name will be derived from the working directory.
@y
  {% comment %}
  You can also specify a name for the Compose application using the `--project-name` flag during deployment. If no name is specified, a name will be derived from the working directory.
  {% endcomment %}
  Compose アプリケーションのデプロイの際に `--project-name` フラグを使って、アプリケーション名を指定することもできます。
  アプリケーション名の指定がなかった場合は、ワーキングディレクトリから名前が定められます。
@z

@x
  You can view logs from containers that are part of the Compose application using the command `docker logs <CONTAINER_ID>`. To know the container ID, run `docker ps`.
@y
  {% comment %}
  You can view logs from containers that are part of the Compose application using the command `docker logs <CONTAINER_ID>`. To know the container ID, run `docker ps`.
  {% endcomment %}
  Compose アプリケーションを構成するコンテナーに対しては、コマンド `docker logs <コンテナーID>` を実行してそれぞれのログを確認できます。
  コンテナー ID を調べるには `docker ps` を実行します。
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
既存の Azure ファイル共有を利用して、ストレージアカウント名 が `mystorageaccount`、ファイル共有名が `myfileshare` であるとしたときに、デプロイにおける `run` コマンド実行を以下のように指定できます。
@z

@x
```
docker run -v mystorageaccount/myfileshare:/target/path myimage
```
@y
```
docker run -v mystorageaccount/myfileshare:/target/path myimage
```
@z

@x
The runtime container will see the file share content in `/target/path`.
@y
{% comment %}
The runtime container will see the file share content in `/target/path`.
{% endcomment %}
これにより実行中のコンテナーからは、ファイル共有内容は `/target/path` に見えるようになります。
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
When you deploy a single container or a Compose application, your 
Azure login automatically fetches the key to the Azure storage account.
@y
{% comment %}
When you deploy a single container or a Compose application, your 
Azure login will automatically fetch the key to the Azure storage account.
{% endcomment %}
単一のコンテナーあるいは Compose アプリケーションをデプロイしたら、Azure のログイン内において、Auzre ストレージアカウントに対するアクセスキーが自動的に取得されます。
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
```
$ docker --context aci volume create test-volume --storage-account mystorageaccount
[+] Running 2/2
 ⠿ mystorageaccount  Created                         26.2s
 ⠿ test-volume       Created                          0.9s
mystorageaccount/test-volume
```
@y
```
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
resource group and location associated with you Docker ACI context.
@y
{% comment %}
By default, if the storage account does not already exist, this command 
creates a new storage account using the Standard LRS as a default SKU, and the 
resource group and location associated with you Docker ACI context.
{% endcomment %}
ストレージアカウントが存在しない場合、このコマンドがデフォルト SKU として 標準 LRS を利用してストレージアカウントを新規生成します。
そしてリソースグループや Docker ACI コンテキストに関連するディレクトリを生成します。
@z

@x
If you specify an existing storage account, the command creates a new 
file share in the exsting account:
@y
{% comment %}
If you specify an existing storage account, the command creates a new 
file share in the exsting account:
{% endcomment %}
既存のストレージアカウントを指定した場合、このコマンドはそのアカウント内にファイル共有を新規生成します。
@z

@x
```
$ docker --context aci volume create test-volume2 --storage-account mystorageaccount
[+] Running 2/2
 ⠿ mystorageaccount   Use existing                    0.7s
 ⠿ test-volume2       Created                         0.7s
mystorageaccount/test-volume2
```
@y
```
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
Azure ポータル、つまり `az` [コマンドライン](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-cli) を用いてファイル共有を生成することができます。
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
```
$ docker --context aci volume ls
ID                                 DESCRIPTION
mystorageaccount/test-volume       Fileshare test-volume in mystorageaccount storage account
mystorageaccount/test-volume2      Fileshare test-volume2 in mystorageaccount storage account
```
@y
```
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
ボリュームと対応する Azure ファイル共有を削除するには `volume rm` コマンドを実行します。
@z

@x
```
$ docker --context aci volume rm mystorageaccount/test-volume
mystorageaccount/test-volume
```
@y
```
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
そのストレージアカウントが `docker volume create` コマンドによって作り出されたものである場合、`docker volume rm` コマンドは、ストレージアカウントがファイル共有を持っていなければ、ストレージアカウントも削除します。
逆にストレージアカウントが（たとえば Azure ポータルや `az` コマンドを使った場合のように）`docker volume create` 以外において生成されたものである場合は、`docker volume rm` はストレージアカウントを削除しません。
そのアカウントが一つのファイル共有も残っていなかったとしてもです。
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
>**Note**
>
> **Docker Azure Integration is a beta release**. The installation process, commands, and flags will change in future releases.
{:.important}
@y
{% comment %}
>**Note**
>
> **Docker Azure Integration is a beta release**. The installation process, commands, and flags will change in future releases.
{:.important}
{% endcomment %}
>**メモ**
>
> **Docker Azure 統合はベータ版です**。
> インストール処理、コマンド、フラグは、将来のリリースにおいて変更されることがあります。
{:.important}
@z

@x
### Prerequisites
@y
{% comment %}
### Prerequisites
{% endcomment %}
{: #prerequisites }
### 前提条件
@z

@x
* [Docker 19.03 or later](https://docs.docker.com/get-docker/)
@y
{% comment %}
* [Docker 19.03 or later](https://docs.docker.com/get-docker/)
{% endcomment %}
* [Docker 19.03 またはそれ以降](https://docs.docker.com/get-docker/)
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
[latest release](https://github.com/docker/compose-cli/releases/latest){: target="_blank" class="_"} page.
@y
{% comment %}
You can download the Docker ACI Integration CLI from the 
[latest release](https://github.com/docker/compose-cli/releases/latest){: target="_blank" class="_"} page.
{% endcomment %}
Docker ACI 統合の CLI は、[最新版](https://github.com/docker/compose-cli/releases/latest){: target="_blank" class="_"} ページからダウンロードすることができます。
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
ローカルの Docker Engine の利用を有効にするため、そして既存の Docker コンテキストを利用可能にするため、既存の Docker CLI は `com.docker.cli` として、パス上のどこかに配置する必要があります。
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
> 環境変数 `PATH` は、複数ディレクトリをコロンで区切るものであり、左にあるものが優先されます。
> 内容を確認するには `echo $PATH` を実行します。
> 既存の Docker CLI へのパスは `which docker` を使って確認できます。
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
> **Note**
>
> Docker Azure Integration is a beta release. The commands and flags will change in future releases.
{:.important}
@y
{% comment %}
> **Note**
>
> Docker Azure Integration is a beta release. The commands and flags will change in future releases.
{:.important}
{% endcomment %}
> **メモ**
>
> Docker Azure 統合はベータ版です。
> コマンドやフラグは、将来リリースにおいて変更されることがあります。
{:.important}
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
Docker Azure 統合の CLI を削除する場合は、ダウンロードしたバイナリと `com.docker.cli` を `PATH` 上から削除します。
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
Thank you for trying out the Docker Azure Integration beta release. Your feedback is very important to us. Let us know your feedback by creating an issue in the [compose-cli](https://github.com/docker/compose-cli){: target="_blank" class="_"} GitHub repository.
@y
{% comment %}
Thank you for trying out the Docker Azure Integration beta release. Your feedback is very important to us. Let us know your feedback by creating an issue in the [compose-cli](https://github.com/docker/compose-cli){: target="_blank" class="_"} GitHub repository.
{% endcomment %}
Docker Azure 統合ベータ版を利用していただき、ありがとうございます。
みなさんからのフィードバックが大変重要です。
フィードバックをいただくには、Github レポジトリ [compose-cli](https://github.com/docker/compose-cli){: target="_blank" class="_"} に issue をあげてください。
@z
