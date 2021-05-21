%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Deploying Docker containers on ECS
description: Deploying Docker containers on ECS
keywords: Docker, AWS, ECS, Integration, context, Compose, cli, deploy, containers, cloud
redirect_from:
  - /engine/context/ecs-integration/
toc_min: 1
toc_max: 2
---
@y
---
title: ECS での Docker コンテナーのデプロイ
description: ECS において Docker コンテナーをデプロイします。
keywords: Docker, AWS, ECS, Integration, context, Compose, cli, deploy, containers, cloud
redirect_from:
  - /engine/context/ecs-integration/
toc_min: 1
toc_max: 2
---
@z

@x
## Overview
@y
{: #overview }
## 概要
@z

@x
The Docker Compose CLI enables developers to use native Docker commands to run applications in Amazon EC2 Container Service (ECS) when building cloud-native applications.
@y
Docker Compose CLI は、Amazon EC2 コンテナーサービス（Amazon EC2 Container Service; ECS）の中で、ネイティブな Docker コマンドの利用を可能にします。
これを使って、クラウドに適したアプリケーションを構築し実行します。
@z

@x
The integration between Docker and Amazon ECS allows developers to use the Docker Compose CLI to:
@y
Docker と Amazon ECS の統合により、開発者が Docker Compose CLI を用いる際には、以下のことが可能になります。
@z

@x
* Set up an AWS context in one Docker command, allowing you to switch from a local context to a cloud context and run applications quickly and easily
* Simplify multi-container application development on Amazon ECS using Compose files
@y
* 1 つの Docker コマンドに対して AWS コンテキストを設定することができます。
  これによってローカルコンテキストとクラウドコンテキストを切り替えられるようになり、アプリケーションの実行をすばやく簡単に行うことができます。
* Compose ファイルを使って、Amazon ECS 上の複数コンテナーアプリケーションの開発を単純化できます。
@z

@x
Also see the [ECS integration architecture](ecs-architecture.md), [full list of compose features](ecs-compose-features.md) and [Compose examples for ECS integration](ecs-compose-examples.md).
@y
[ECS 統合アーキテクチャー](ecs-architecture.md)、[Compose 機能一覧](ecs-compose-features.md)、[ECS 統合の Compose 利用例](ecs-compose-examples.md) も参照してください。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
To deploy Docker containers on ECS, you must meet the following requirements:
@y
Docker コンテナーを ECS にデプロイするには、以下の条件を満たしていることが必要です。
@z

@x
1. Download and install the latest version of Docker Desktop.
@y
1. Docker Desktop 最新版をダウンロードしインストールしていることが必要です。
@z

@x
    - [Download for Mac](../docker-for-mac/install.md)
    - [Download for Windows](../docker-for-windows/install.md)
@y
    - [Download for Mac](../docker-for-mac/install.md)
    - [Download for Windows](../docker-for-windows/install.md)
@z

@x
    Alternatively, install the [Docker Compose CLI for Linux](#install-the-docker-compose-cli-on-linux).
@y
    あるいは [Docker Compose CLI for Linux](#install-the-docker-compose-cli-on-linux) をインストールしていることが必要です。
@z

@x
2. Ensure you have an AWS account.
@y
2. AWS アカウントを持っていることが必要です。
@z

@x
Docker not only runs multi-container applications locally, but also enables
developers to seamlessly deploy Docker containers on Amazon ECS using a
Compose file with the `docker compose up` command. The following sections
contain instructions on how to deploy your Compose application on Amazon ECS.
@y
Docker は、単にローカルのマルチコンテナーを実行するだけのものではなくなります。
`docker compose up` により Compose ファイルを使って Amazon ECS 上の Docker コンテナーをシームレスにデプロイできます。
以下の節では Amazon ECS 上において Docker コンテナーをデプロイする手順を説明します。
@z

@x
## Run an application on ECS
@y
{: #run-an-application-on-ecs }
## ECS 上でのアプリケーション実行
@z

@x
### Requirements
@y
{: #requirements }
### 前提条件
@z

@x
AWS uses a fine-grained permission model, with specific role for each resource type and operation.
@y
AWS uses a fine-grained permission model, with specific role for each resource type and operation.
@z

@x
To ensure that Docker ECS integration is allowed to manage resources for your Compose application, you have to ensure your AWS credentials [grant access to following AWS IAM permissions](https://aws.amazon.com/iam/features/manage-permissions/):
@y
To ensure that Docker ECS integration is allowed to manage resources for your Compose application, you have to ensure your AWS credentials [grant access to following AWS IAM permissions](https://aws.amazon.com/iam/features/manage-permissions/):
@z

@x
* application-autoscaling:*
* cloudformation:*
* ec2:AuthorizeSecurityGroupIngress
* ec2:CreateSecurityGroup
* ec2:CreateTags
* ec2:DeleteSecurityGroup
* ec2:DescribeRouteTables
* ec2:DescribeSecurityGroups
* ec2:DescribeSubnets
* ec2:DescribeVpcs
* ec2:RevokeSecurityGroupIngress
* ecs:CreateCluster
* ecs:CreateService
* ecs:DeleteCluster
* ecs:DeleteService
* ecs:DeregisterTaskDefinition
* ecs:DescribeClusters
* ecs:DescribeServices
* ecs:DescribeTasks
* ecs:ListAccountSettings
* ecs:ListTasks
* ecs:RegisterTaskDefinition
* ecs:UpdateService
* elasticloadbalancing:*
* iam:AttachRolePolicy
* iam:CreateRole
* iam:DeleteRole
* iam:DetachRolePolicy
* iam:PassRole
* logs:CreateLogGroup
* logs:DeleteLogGroup
* logs:DescribeLogGroups
* logs:FilterLogEvents
* route53:CreateHostedZone
* route53:DeleteHostedZone
* route53:GetHealthCheck
* route53:GetHostedZone
* route53:ListHostedZonesByName
* servicediscovery:*
@y
* application-autoscaling:*
* cloudformation:*
* ec2:AuthorizeSecurityGroupIngress
* ec2:CreateSecurityGroup
* ec2:CreateTags
* ec2:DeleteSecurityGroup
* ec2:DescribeRouteTables
* ec2:DescribeSecurityGroups
* ec2:DescribeSubnets
* ec2:DescribeVpcs
* ec2:RevokeSecurityGroupIngress
* ecs:CreateCluster
* ecs:CreateService
* ecs:DeleteCluster
* ecs:DeleteService
* ecs:DeregisterTaskDefinition
* ecs:DescribeClusters
* ecs:DescribeServices
* ecs:DescribeTasks
* ecs:ListAccountSettings
* ecs:ListTasks
* ecs:RegisterTaskDefinition
* ecs:UpdateService
* elasticloadbalancing:*
* iam:AttachRolePolicy
* iam:CreateRole
* iam:DeleteRole
* iam:DetachRolePolicy
* iam:PassRole
* logs:CreateLogGroup
* logs:DeleteLogGroup
* logs:DescribeLogGroups
* logs:FilterLogEvents
* route53:CreateHostedZone
* route53:DeleteHostedZone
* route53:GetHealthCheck
* route53:GetHostedZone
* route53:ListHostedZonesByName
* servicediscovery:*
@z

@x
GPU support, which relies on EC2 instances to run containers with attached GPU devices,
require a few additional permissions:
@y
GPU support, which relies on EC2 instances to run containers with attached GPU devices,
require a few additional permissions:
@z

@x
* ec2:DescribeVpcs
* autoscaling:*
* iam:CreateInstanceProfile
* iam:AddRoleToInstanceProfile
* iam:RemoveRoleFromInstanceProfile
* iam:DeleteInstanceProfile
@y
* ec2:DescribeVpcs
* autoscaling:*
* iam:CreateInstanceProfile
* iam:AddRoleToInstanceProfile
* iam:RemoveRoleFromInstanceProfile
* iam:DeleteInstanceProfile
@z

@x
### Create AWS context
@y
{: #create-aws-context }
### AWS コンテキストの生成
@z

@x
Run the `docker context create ecs myecscontext` command to create an Amazon ECS Docker
context named `myecscontext`. If you have already installed and configured the AWS CLI,
the setup command lets you select an existing AWS profile to connect to Amazon.
Otherwise, you can create a new profile by passing an
[AWS access key ID and a secret access key](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys){: target="_blank" rel="noopener" class="_"}.
Finally, you can configure your ECS context to retrieve AWS credentials by `AWS_*` environment variables, which is a common way to integrate with
third-party tools and single-sign-on providers.
@y
`docker context create ecs myecscontext` コマンドを実行して AWS コンテキストを生成します。
すでに AWS CLI をインストールし設定を行っているのであれば、このセットアップコマンドにより、既存の AWS プロファイルを選んで Amazon への接続を行います。
これがまだできていない場合は、[AWS access key ID and a secret access key](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys){: target="_blank" rel="noopener" class="_"} を通じて、新たなプロファイルを生成します。
Finally, you can configure your ECS context to retrieve AWS credentials by `AWS_*` environment variables, which is a common way to integrate with
third-party tools and single-sign-on providers.
@z

@x
```console
? Create a Docker context using:  [Use arrows to move, type to filter]
  An existing AWS profile
  AWS secret and token credentials
> AWS environment variables
```
@y
```console
? Create a Docker context using:  [Use arrows to move, type to filter]
  An existing AWS profile
  AWS secret and token credentials
> AWS environment variables
```
@z

@x
After you have created an AWS context, you can list your Docker contexts by running the `docker context ls` command:
@y
AWS コンテキストを生成したら、`docker context ls` コマンドを実行して Docker コンテキストの一覧を表示します。
@z

@x
```console
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT   ORCHESTRATOR
myecscontext        ecs                 credentials read from environment
default *           moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                         swarm
```
@y
```console
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT   ORCHESTRATOR
myecscontext        ecs                 credentials read from environment
default *           moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                         swarm
```
@z

@x
### Run a Compose application
@y
{: #run-a-compose-application }
## Compose アプリケーションの実行
@z

@x
You can deploy and manage multi-container applications defined in Compose files
to Amazon ECS using the `docker compose` command. To do this:
@y
Compose ファイルに定義したマルチコンテナーによるアプリケーションを、Amazon ECS に対してデプロイし管理するためには、`docker compose` コマンドを実行します。
これを行うためには以下のことが必要です。
@z

@x
- Ensure you are using your ECS context. You can do this either by specifying
the `--context myecscontext` flag with your command, or by setting the
current context using the command `docker context use myecscontext`.
@y
- AWS コンテキストを利用していることが必要です。
  これはコマンド実行時に`--context myecscontext`フラグを指定するか、あるいはカレントなコンテキストを設定するコマンド`docker context use myecscontext`を実行します。
@z

@x
- Run `docker compose up` and `docker compose down` to start and then
stop a full Compose application.
@y
- `docker compose up`と`docker compose down`を実行して、Compose アプリケーションの開始、停止ができることが必要です。
@z

@x
  By default, `docker compose up` uses the `compose.yaml` or `docker-compose.yaml` file in
  the current folder. You can specify the working directory using the --workdir flag or
  specify the Compose file directly using `docker compose --file mycomposefile.yaml up`.
@y
  デフォルトにおいて`docker compose up`は、カレントフォルダーの`compose.yaml`ファイルまたは`docker-compose.yaml`ファイルを利用します。
  --workdir フラグを使ってワーキングディレクトリを指定するか、あるいは Compose ファイルを直接する`docker compose --file mycomposefile.yaml up`のような実行方法も可能です。
@z

@x
  You can also specify a name for the Compose application using the `--project-name` flag during deployment. If no name is specified, a name will be derived from the working directory.
@y
  Compose アプリケーションのデプロイの際に`--project-name`フラグを使って、アプリケーション名を指定することもできます。
  アプリケーション名の指定がなかった場合は、ワーキングディレクトリから名前が定められます。
@z

@x
Docker ECS integration converts the Compose application model into a set of AWS resources, described as a [CloudFormation](https://aws.amazon.com/cloudformation/){: target="_blank" rel="noopener" class="_"} template. The actual mapping is described in [technical documentation](https://github.com/docker/compose-cli/blob/main/docs/ecs-architecture.md){: target="_blank" rel="noopener" class="_"}.
You can review the generated template using `docker compose convert` command, and follow CloudFormation applying this model within
[AWS web console](https://console.aws.amazon.com/cloudformation/home){: target="_blank" rel="noopener" class="_"} when you run `docker compose up`, in addition to CloudFormation events being displayed
in your terminal.
@y
Docker ECS integration converts the Compose application model into a set of AWS resources, described as a [CloudFormation](https://aws.amazon.com/cloudformation/){: target="_blank" rel="noopener" class="_"} template. The actual mapping is described in [technical documentation](https://github.com/docker/compose-cli/blob/main/docs/ecs-architecture.md){: target="_blank" rel="noopener" class="_"}.
You can review the generated template using `docker compose convert` command, and follow CloudFormation applying this model within
[AWS web console](https://console.aws.amazon.com/cloudformation/home){: target="_blank" rel="noopener" class="_"} when you run `docker compose up`, in addition to CloudFormation events being displayed
in your terminal.
@z

@x
- You can view services created for the Compose application on Amazon ECS and
their state using the `docker compose ps` command.
@y
- Amazon ECS 上の Compose アプリケーションに対して生成されたサービスの情報およびその状態を確認するには`docker compose ps`コマンドを実行します。
@z

@x
- You can view logs from containers that are part of the Compose application
using the `docker compose logs` command.
@y
- Compose アプリケーションを構成するコンテナーに対しては、コマンド`docker compose logs`を実行してそれぞれのログを確認できます。
@z

@x
Also see the [full list of compose features](ecs-compose-features.md).
@y
[Compose 機能一覧](ecs-compose-features.md) も参照してください。
@z

@x
## Rolling update
@y
{: #rolling-update }
## ローリングアップデート
@z

@x
To update your application without interrupting production flow you can simply
use `docker compose up` on the updated Compose project.
Your ECS services are created with rolling update configuration. As you run
`docker compose up` with a modified Compose file, the stack will be
updated to reflect changes, and if required, some services will be replaced.
This replacement process will follow the rolling-update configuration set by
your services [`deploy.update_config`](https://docs.docker.com/compose/compose-file/#update_config)
configuration.
@y
本番環境の実行を妨げることなくアプリケーションのアップデートを行うには、更新された Compose プロジェクト上において`docker compose up`を実行するだけです。
ECS サービスはローリングアップデート設定を含めて生成されます。
Compose ファイルを修正した上で`docker compose up`を実行すると、その修正に応じてアップデートが行われ、必要なサービスは置き換えられます。
この置き換え処理は、サービスの [`deploy.update_config`](https://docs.docker.com/compose/compose-file/#update_config)  設定によって定められるローリングアップデート設定に従います。
@z

@x
AWS ECS uses a percent-based model to define the number of containers to be
run or shut down during a rolling update. The Docker Compose CLI computes
rolling update configuration according to the `parallelism` and `replicas`
fields. However, you might prefer to directly configure a rolling update
using the extension fields `x-aws-min_percent` and `x-aws-max_percent`.
The former sets the minimum percent of containers to run for service, and the
latter sets the maximum percent of additional containers to start before
previous versions are removed.
@y
AWS ECS ではパーセントベースモデル（percent-based model）を採用して、ローリングアップデート時に起動または停止するコンテナー数を定義しています。
Docker Compose CLI では項目`prallelism`または`replicas`に従って、ローリングアップデート設定を算出しています。
ローリングアップデートの設定を、項目`x-aws-min_percent`や`x-aws-max_percent`を使って設定したい場合があります。
`x-aws-min_percent`はサービスに対して、起動させるコンテナーの最小パーセントを設定します。
`x-aws-max_percent`は、それまでのバージョンのコンテナーを削除する前に、追加で起動するコンテナーの最大パーセントを設定します。
@z

@x
By default, the ECS rolling update is set to run twice the number of
containers for a service (200%), and has the ability to shut down 100%
containers during the update.
@y
デフォルトにおいて ECS のローリングアップデートは、コンテナー数の 2 倍（200%）の数だけ起動されるように設定されます。
またアップデート時にコンテナー停止を行う程度は 100 % として設定されます。
@z

@x
## View application logs
@y
{: #view-application-logs }
## アプリケーションログの確認
@z

@x
The Docker Compose CLI configures AWS CloudWatch Logs service for your
containers.
By default you can see logs of your compose application the same way you check logs of local deployments:
@y
Docker Compose CLI では、コンテナーに対して AWS CloudWatch ログサービスを設定します。
Compose アプリケーションログの確認は、デフォルトではローカルデプロイを確認することと同様に行うことができます。
@z

@x
```console
# fetch logs for application in current working directory
$ docker compose logs

# specify compose project name
$ docker compose --project-name PROJECT logs

# specify compose file
$ docker compose --file /path/to/docker-compose.yaml logs
```
@y
```console
# アプリケーションログをカレントなワーキングディレクトリに取り出します。
$ docker compose logs

# Compose プロジェクト名を指定します。
$ docker compose --project-name PROJECT logs

# Compose ファイルを指定します。
$ docker compose --file /path/to/docker-compose.yaml logs
```
@z

@x
A log group is created for the application as `docker-compose/<application_name>`,
and log streams are created for each service and container in your application
as `<application_name>/<service_name>/<container_ID>`.
@y
アプリケーションにおいて、ロググループ`docker-compose/<アプリケーション名>`が生成され、またアプリケーション内の各サービスとコンテナーにおいては、ログストリーム`<アプリケーション名>/<サービス名>/<コンテナーID>`が生成されます。
@z

@x
You can fine tune AWS CloudWatch Logs using extension field `x-aws-logs_retention`
in your Compose file to set the number of retention days for log events. The
default behavior is to keep logs forever.
@y
AWS CloudWatch ログに対しては Compose ファイル内の拡張項目`x-aws-logs_retention`を使って、イベントの保存日数を調整することができます。
デフォルトは無期限に保存します。
@z

@x
You can also pass `awslogs`
parameters to your container as standard
Compose file `logging.driver_opts` elements. See [AWS documentation](https://docs.amazonaws.cn/en_us/AmazonECS/latest/developerguide/using_awslogs.html){:target="_blank" rel="noopener" class="_"} for details on available log driver options.
@y
標準的な Compose ファイルの項目`logging.driver_opts`を使い、コンテナーに対して`awslogs`パラメーターを指定することもできます。
利用可能なログドライバーオプションの詳細は [AWS ドキュメント](https://docs.amazonaws.cn/en_us/AmazonECS/latest/developerguide/using_awslogs.html){:target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
## Private Docker images
@y
{: #private-docker-images }
## プライベートな Docker イメージ
@z

@x
The Docker Compose CLI automatically configures authorization so you can pull private images from the Amazon ECR registry on the same AWS account. To pull private images from another registry, including Docker Hub, you’ll have to create a Username + Password (or a Username + Token) secret on the [AWS Secrets Manager service](https://docs.aws.amazon.com/secretsmanager/){: target="_blank" rel="noopener" class="_"}.
@y
Docker Compose CLI では自動的に認証が設定されます。
したがって Amazon ECR レジストリにあるプライベートイメージは、同じ AWS アカウントを使ってプルすることができます。
一方 Docker Hub も含め、別のレジストリからプライベートイメージをプルするには、[AWS Secrets Manager service](https://docs.aws.amazon.com/secretsmanager/){: target="_blank" rel="noopener" class="_"} 上にユーザー名とパスワード（あるいはユーザー名とトークン）を生成する必要があります。
@z

@x
For your convenience, the Docker Compose CLI offers the `docker secret` command, so you can manage secrets created on AWS SMS without having to install the AWS CLI.
@y
Docker Compose CLI では、便利なコマンドとして`docker secret`が提供されています。
したがって AWS CLI をインストールしていなくても、AWS SMS において生成した機密情報を管理することができます。
@z

@x
First, create a `token.json` file to define your DockerHub username and access token.
@y
First, create a `token.json` file to define your DockerHub username and access token.
@z

@x
For instructions on how to generate access tokens, see [Managing access tokens](https://docs.docker.com/docker-hub/access-tokens/).
@y
For instructions on how to generate access tokens, see [Managing access tokens](https://docs.docker.com/docker-hub/access-tokens/).
@z

@x
```json
{
  "username":"DockerHubUserName",
  "password":"DockerHubAccessToken"
}
```
@y
```json
{
  "username":"DockerHubUserName",
  "password":"DockerHubAccessToken"
}
```
@z

@x
You can then create a secret from this file using `docker secret`:
@y
You can then create a secret from this file using `docker secret`:
@z

@x
```console
$ docker secret create dockerhubAccessToken token.json
arn:aws:secretsmanager:eu-west-3:12345:secret:DockerHubAccessToken
```
@y
```console
$ docker secret create dockerhubAccessToken token.json
arn:aws:secretsmanager:eu-west-3:12345:secret:DockerHubAccessToken
```
@z

@x
Once created, you can use this ARN in you Compose file using using `x-aws-pull_credentials` custom extension with the Docker image URI for your service.
@y
この ARN を生成したら Compose ファイル内において、カスタム拡張 `x-aws-pull_credentials` を利用して、そのサービスに対する Docker イメージ URI を指定することができます。
@z

@x
```yaml
services:
  worker:
    image: mycompany/privateimage
    x-aws-pull_credentials: "arn:aws:secretsmanager:eu-west-3:12345:secret:DockerHubAccessToken"
```
@y
```yaml
services:
  worker:
    image: mycompany/privateimage
    x-aws-pull_credentials: "arn:aws:secretsmanager:eu-west-3:12345:secret:DockerHubAccessToken"
```
@z

@x
> **Note**
>
> If you set the Compose file version to 3.8 or later, you can use the same Compose file for local deployment using `docker-compose`. Custom ECS extensions will be ignored in this case.
@y
> **メモ**
>
> Compose ファイルのバージョンを 3.8 またはそれ以降に指定すると、この Compose ファイルをそのまま、`docker-compose` を使ってローカル開発環境向けに利用することができます。
その場合、カスタム ECS 拡張は無視されます。
@z

@x
## Service discovery
@y
{: #service-discovery }
## サービスの検出
@z

@x
Service-to-service communication is implemented transparently by default, so you can deploy your Compose applications with multiple interconnected services without changing the compose file between local and ECS deployment. Individual services can run with distinct constraints (memory, cpu) and replication rules.
@y
{% include jatrans.md jatrans_pattern="1" %}

サービス間の通信は、デフォルトで透過的に実装されています。
したがって Compose アプリケーションのデプロイは、複数接続されたサービスに対しても、Compose ファイルをローカル向け、ECS デプロイ向けに切り替えずに行うことができます。
個々のサービスは、それぞれの（メモリや CPU に対する）制約やレプリカに関するルールに従って動作します。
@z

@x
### Service names
@y
{: #service-names }
### サービス名
@z

@x
Services are registered automatically by the Docker Compose CLI on [AWS Cloud Map](https://docs.aws.amazon.com/cloud-map/latest/dg/what-is-cloud-map.html){: target="_blank" rel="noopener" class="_"} during application deployment. They are declared as fully qualified domain names of the form: `<service>.<compose_project_name>.local`.
@y
アプリケーションデプロイを行うサービスは、Docker Compose CLI により [AWS Cloud Map](https://docs.aws.amazon.com/cloud-map/latest/dg/what-is-cloud-map.html){: target="_blank" rel="noopener" class="_"} 上に自動登録されます。
これは `<サービス>.<composeプロジェクト名>.local` という形の完全修飾ドメイン名として表わされています。
@z

@x
Services can retrieve their dependencies using Compose service names (as they do when deploying locally with docker-compose), or optionally use the fully qualified names.
@y
サービスが、依存するサービスを引き出す際には、Compose サービス名（docker-compose を使ってローカルにデプロイする際にも用いられる）、またはこの完全修飾ドメイン名が利用されます。
@z

@x
### Dependent service startup time and DNS resolution
@y
### 依存サービスの起動時間と DNS 名前解決
@z

@x
Services get concurrently scheduled on ECS when a Compose file is deployed. AWS Cloud Map introduces an initial delay for DNS service to be able to resolve your services domain names. Your code needs to support this delay by waiting for dependent services to be ready, or by adding a wait-script as the entrypoint to your Docker image, as documented in [Control startup order](https://docs.docker.com/compose/startup-order/).
Note this need to wait for dependent services in your Compose application also exists when deploying locally with docker-compose, but the delay is typically shorter. Issues might become more visible when deploying to ECS if services do not wait for their dependencies to be available.
@y
Compose ファイルがデプロイされると ECS 上においてサービスが同タイミングでスケジューリングされます。
AWS Cloud Map では、サービスドメイン名を解決できるようにするため、DNS サービスの初期遅延処理を行っています。
したがってアプリケーションコードには、その遅延への対応が必要になります。
つまり依存サービスが準備状態となるのを待つか、Docker イメージへエントリーポイントとして、ウェイトを行うスクリプトを追加するなどの対応を行います。
このことは [起動順の制御]({{ site.baseurl }}/compose/startup-order/) において説明しています。
なお Compose アプリケーション内の依存サービスに対しても、docker-compose によりローカルにデプロイする際にもこれが必要です。
ただし遅延は普通は短いものです。
明らかな問題が発生するとすれば ECS へのデプロイ時であり、サービスがその依存サービスの起動を待たずに実行されてしまった場合です。
@z

@x
Alternatively, you can use the [depends_on](https://github.com/compose-spec/compose-spec/blob/master/spec.md#depends_on){: target="_blank" rel="noopener" class="_"} feature of the Compose file format. By doing this, dependent service will be created first, and application deployment will wait for it to be up and running before starting the creation of the dependent services.
@y
それとは別に Compose ファイルにおける [depends_on](https://github.com/compose-spec/compose-spec/blob/master/spec.md#depends_on){: target="_blank" rel="noopener" class="_"} 機能を利用することができます。
これを利用すると依存するサービスがまず生成されることになり、アプリケーションのデプロイは生成開始前から稼動するまで待機します。
@z

@x
### Service isolation
@y
{: #sService-isolation }
### サービスの分離
@z

@x
Service isolation is implemented by the [Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html){: target="_blank" rel="noopener" class="_"} rules, allowing services sharing a common Compose file “network” to communicate together using their Compose service names.
@y
サービス間の通信は [Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html){: target="_blank" rel="noopener" class="_"} ルールによって実現されています。
サービス間では共通の Compose ファイル「network」が共有され、Compose サービス名を使って互いに通信を行います。
@z

@x
## Volumes
@y
{: #volumes }
## ボリューム
@z

@x
ECS integration supports volume management based on Amazon Elastic File System (Amazon EFS).
For a Compose file to declare a `volume`, ECS integration will define creation of an EFS
file system within the CloudFormation template, with `Retain` policy so data won't
be deleted on application shut-down. If the same application (same project name) is
deployed again, the file system will be re-attached to offer the same user experience
developers are used to with docker-compose.
@y
ECS 統合では Amazon Elastic File System (Amazon EFS) をベースとしたボリューム管理をサポートしています。
ECS 統合において Compose ファイルに`volume`を宣言する際には、CloudFormation テンプレート内に EFS ファイルシステムの生成を定義します。
`Retain`（維持）ポリシーを利用すれば、アプリケーションのシャットダウン時にデータが削除されることはありません。
同一のアプリケーション（同一のプロジェクト名）が再度デプロイされると、ファイルシステムが再度アタッチされて、それまで開発者が行っていた docker-compose による作業を再開できます。
@z

@x
A basic compose service using a volume can be declared like this:
@y
ボリュームを利用した基本的な Compose サービスは、以下のように宣言します。
@z

@x
```yaml
services:
  nginx:
    image: nginx
    volumes:
      - mydata:/some/container/path
volumes:
  mydata:
```
@y
```yaml
services:
  nginx:
    image: nginx
    volumes:
      - mydata:/some/container/path
volumes:
  mydata:
```
@z

@x
With no specific volume options, the volume still must be declared in the `volumes`section for
the compose file to be valid (in the above example the empty `mydata:` entry)
If required, the initial file system can be customized using `driver-opts`:
@y
With no specific volume options, the volume still must be declared in the `volumes`section for
the compose file to be valid (in the above example the empty `mydata:` entry)
必要であれば、ファイルシステムの初期状態は`driver-opts`を用いて変更することができます。
@z

@x
```yaml
volumes:
  my-data:
    driver_opts:
      # Filesystem configuration
      backup_policy: ENABLED
      lifecycle_policy: AFTER_14_DAYS
      performance_mode: maxIO
      throughput_mode: provisioned
      provisioned_throughput: 1
```
@y
```yaml
volumes:
  my-data:
    driver_opts:
      # Filesystem configuration
      backup_policy: ENABLED
      lifecycle_policy: AFTER_14_DAYS
      performance_mode: maxIO
      throughput_mode: provisioned
      provisioned_throughput: 1
```
@z

@x
File systems created by executing `docker compose up` on AWS can be listed using
`docker volume ls` and removed with `docker volume rm <filesystemID>`.
@y
AWS 上において`docker compose up`を実行して生成されるファイルシステムは、`docker volume ls`によって一覧確認ができます。
また`docker volume rm <ファイルシステムID>`によって削除することができます。
@z

@x
An existing file system can also be used for users who already have data stored on EFS
or want to use a file system created by another Compose stack.
@y
EFS 上にすでにデータを保存している場合や、別の Compose スタックによって生成されたファイルシステムを利用したい場合には、既存のファイルシステムを利用することもできます。
@z

@x
```yaml
volumes:
  my-data:
    external: true
    name: fs-123abcd
```
@y
```yaml
volumes:
  my-data:
    external: true
    name: fs-123abcd
```
@z

@x
Accessing a volume from a container can introduce POSIX user ID
permission issues, as Docker images can define arbitrary user ID / group ID for the
process to run inside a container. However, the same `uid:gid` will have to match
POSIX permissions on the file system. To work around the possible conflict, you can set the volume
`uid` and `gid` to be used when accessing a volume:
@y
コンテナーからボリュームにアクセスする際には、POSIX ユーザー ID のパーミッションに関する問題が発生する可能性があります。
Docker イメージにおいては、コンテナー内で稼動するプロセスに対して、任意のユーザー ID およびグループ ID を定義しているからです。
ただし`uid:gid`が同一であれば、ファイルシステム上での POSIX パーミッションに合致していなければなりません。
このような衝突を回避するためには、ボリュームにアクセスする際に利用する`uid`と`gid`を設定します。
@z

@x
```yaml
volumes:
  my-data:
    driver_opts:
      # Access point configuration
      uid: 0
      gid: 0
```
@y
```yaml
volumes:
  my-data:
    driver_opts:
      # Access point configuration
      uid: 0
      gid: 0
```
@z

@x
## Secrets
@y
## Secrets
@z

@x
You can pass secrets to your ECS services using Docker model to bind sensitive
data as files under `/run/secrets`. If your Compose file declares a secret as
file, such a secret will be created as part of your application deployment on
ECS. If you use an existing secret as `external: true` reference in your
Compose file, use the ECS Secrets Manager full ARN as the secret name:
@y
Docker モデルを使って ECS サービスに Secret 情報を受け渡すことにより、`/run/secrets`配下にあるファイルを機密データとして結びつけることができます。
Compose ファイルに Secret 情報を宣言している場合、ECS 上へのアプリケーションのデプロイにあたって、デプロイの一部としてその情報が生成されます。
Compose ファイル内にて既存の Secret 情報を`external: true`として参照している場合、Secret 名として ECS Secrets Manager の 完全リソース名を使うことができます。
@z

@x
```yaml
services:
  webapp:
    image: ...
    secrets:
      - foo

secrets:
  foo:
    name: "arn:aws:secretsmanager:eu-west-3:1234:secret:foo-ABC123"
    external: true
```
@y
```yaml
services:
  webapp:
    image: ...
    secrets:
      - foo

secrets:
  foo:
    name: "arn:aws:secretsmanager:eu-west-3:1234:secret:foo-ABC123"
    external: true
```
@z

@x
Secrets will be available at runtime for your service as a plain text file `/run/secrets/foo`.
@y
Secret はサービス実行時には、`/run/secrets/foo` というプレーンなテキストファイルとしてアクセスできます。
@z

@x
The AWS Secrets Manager allows you to store sensitive data either as a plain
text (like Docker secret does), or as a hierarchical JSON document. You can
use the latter with Docker Compose CLI by using custom field `x-aws-keys` to
define which entries in the JSON document to bind as a secret in your service
container.
@y
AWS Secrets マネージャーにおいて機密情報を保存する際には、（Docker の Secret と同じように）プレーンテキストとして保存する方法と、階層化した JSON ドキュメントとして保存する方法があります。
Docker Compose CLI にて後者の方法を利用する場合には、カスタム項目`x-aws-keys`を利用して、サービスコンテナー内の Secret として、JSON ドキュメント内のどの項目を結びつけるかを定義します。
@z

@x
```yaml
services:
  webapp:
    image: ...
    secrets:
      - foo

secrets:
  foo:
    name: "arn:aws:secretsmanager:eu-west-3:1234:secret:foo-ABC123"
    keys:
      - "bar"
```
@y
```yaml
services:
  webapp:
    image: ...
    secrets:
      - foo

secrets:
  foo:
    name: "arn:aws:secretsmanager:eu-west-3:1234:secret:foo-ABC123"
    keys:
      - "bar"
```
@z

@x
By doing this, the secret for `bar` key will be available at runtime for your
service as a plain text file `/run/secrets/foo/bar`. You can use the special
value `*` to get all keys bound in your container.
@y
このようにするとキー `bar` に対する機密データは、サービスの実行時に `/run/secrets/foo/bar` というプレーンなテキストファイルとしてアクセスできます。
特別な値として `*` を用いると、コンテナー内のキーすべてを得ることができます。
@z

@x
## Auto scaling
@y
{: #auto-scaling }
## 自動スケーリング
@z

@x
Scaling service static information (non auto-scaling) can be specified using the normal Compose syntax:
@y
サービスをスケーリングするための固定的な（自動スケーリングではない）情報は、普通に Compose ファイルの文法として指定することができます。
@z

@x
```yaml
services:
  foo:
    deploy:
      replicas: 3
```
@y
```yaml
services:
  foo:
    deploy:
      replicas: 3
```
@z

@x
The Compose file model does not define any attributes to declare auto-scaling conditions.
Therefore, we rely on `x-aws-autoscaling` custom extension to define the auto-scaling range, as
well as cpu _or_ memory to define target metric, expressed as resource usage percent.
@y
Compose ファイルモデルでは、自動スケーリングの条件を定める属性定義はありません。
したがってカスタム拡張機能`x-aws-autoscaling`を利用して自動スケーリングの範囲を定義することになります。
ターゲットメトリックの定義において、リソース使用率として表現される CPU やメモリを定めることと同様です。
@z

@x
```yaml
services:
  foo:
    deploy:
      x-aws-autoscaling:
        min: 1
        max: 10 #required
        cpu: 75
        # mem: - mutualy exlusive with cpu
```
@y
```yaml
services:
  foo:
    deploy:
      x-aws-autoscaling:
        min: 1
        max: 10 #required
        cpu: 75
        # mem: - mutualy exlusive with cpu
```
@z

@x
## IAM roles
@y
{: #iam-roles }
## IAM ロール
@z

@x
Your ECS Tasks are executed with a dedicated IAM role, granting access
to AWS Managed policies[`AmazonECSTaskExecutionRolePolicy`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)
and [`AmazonEC2ContainerRegistryReadOnly`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecr_managed_policies.html).
In addition, if your service uses secrets, IAM Role gets additional
permissions to read and decrypt secrets from the AWS Secret Manager.
@y
ECS タスクは、AWS 管理ポリシー[`AmazonECSTaskExecutionRolePolicy`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html) と [`AmazonEC2ContainerRegistryReadOnly`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecr_managed_policies.html) へのアクセスが可能な、専用の IAM ロールによって実行されます。
さらにサービスが Secret を利用している場合、IAM ロールは追加の権限によって AWS Secret マネージャーから Secret の読み込みと復号化を行います。
@z

@x
You can grant additional managed policies to your service execution
by using `x-aws-policies` inside a service definition:
@y
サービスの実行にあたって管理ポリシーを追加で利用するには、サービス定義の内部において`x-aws-policies`を用います。
@z

@x
```yaml
services:
  foo:
    x-aws-policies:
      - "arn:aws:iam::aws:policy/AmazonS3FullAccess"
```
@y
```yaml
services:
  foo:
    x-aws-policies:
      - "arn:aws:iam::aws:policy/AmazonS3FullAccess"
```
@z

@x
You can also write your own [IAM Policy Document](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html)
to fine tune the IAM role to be applied to your ECS service, and use
`x-aws-role` inside a service definition to pass the
yaml-formatted policy document.
@y
また独自に [IAM ポリシードキュメント](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html) を記述して、ECS サービスに適用する IAM ロールを調整することができます。
そしてサービス定義内に`x-aws-role`を用いることで、YAML 書式のポリシードキュメントを受け渡すことができます。
@z

@x
```yaml
services:
  foo:
    x-aws-role:
      Version: "2012-10-17"
      Statement:
        - Effect: "Allow"
          Action:
            - "some_aws_service"
          Resource:
            - "*"
```
@y
```yaml
services:
  foo:
    x-aws-role:
      Version: "2012-10-17"
      Statement:
        - Effect: "Allow"
          Action:
            - "some_aws_service"
          Resource:
            - "*"
```
@z

@x
## Tuning the CloudFormation template
@y
{: #tuning-the-cloudformation-template }
## CloudFormation テンプレートの調整
@z

@x
The Docker Compose CLI relies on [Amazon CloudFormation](https://docs.aws.amazon.com/cloudformation/){: target="_blank" rel="noopener" class="_"} to manage the application deployment. To get more control on the created resources, you can use `docker compose convert` to generate a CloudFormation stack file from your Compose file. This allows you to inspect resources it defines, or customize the template for your needs, and then apply the template to AWS using the AWS CLI, or the AWS web console.
@y
Docker Compose CLI では [Amazon CloudFormation](https://docs.aws.amazon.com/cloudformation/){: target="_blank" rel="noopener" class="_"} を活用して、アプリケーションのデプロイ管理を行っています。
生成済みのリソースをより的確に制御するには、`docker compose convert` を使い、Compose ファイルから CloudFormation スタックファイルを生成します。
スタックファイルを生成すると、そこに定義されたリソースの確認や、必要に応じたテンプレートのカスタマイズ、AWS CLI や AWS ウェブコンソールからのテンプレートの適用を行うことができます。
@z

@x
Once you have identified the changes required to your CloudFormation template, you can include _overlays_ in your
Compose file that will be automatically applied on `compose up`. An _overlay_ is a yaml object that uses the same CloudFormation template data structure as the one generated by ECS integration, but only contains attributes to
be updated or added. It will be merged with the generated template before being applied on the AWS infrastructure.
@y
Once you have identified the changes required to your CloudFormation template, you can include _overlays_ in your
Compose file that will be automatically applied on `compose up`. An _overlay_ is a yaml object that uses the same CloudFormation template data structure as the one generated by ECS integration, but only contains attributes to
be updated or added. It will be merged with the generated template before being applied on the AWS infrastructure.
@z

@x
### Adjusting Load Balancer http HealthCheck configuration
@y
### Adjusting Load Balancer http HealthCheck configuration
@z

@x
While ECS cluster uses the `HealthCheck` command on container to get service health, Application Load Balancers define
their own URL-based HealthCheck mechanism so traffic gets routed. As the Compose model does not offer such an
abstraction (yet), the default one is applied, which queries your service under `/` expecting HTTP status code
`200`.
@y
While ECS cluster uses the `HealthCheck` command on container to get service health, Application Load Balancers define
their own URL-based HealthCheck mechanism so traffic gets routed. As the Compose model does not offer such an
abstraction (yet), the default one is applied, which queries your service under `/` expecting HTTP status code
`200`.
@z

@x
You can tweak this behavior using a cloudformation overlay by following the [AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html){:target="_blank" rel="noopener" class="_"} for
configuration reference:
@y
You can tweak this behavior using a cloudformation overlay by following the [AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html){:target="_blank" rel="noopener" class="_"} for
configuration reference:
@z

@x
```yaml
services:
  webapp:
    image: acme/webapp
    ports:
      - "80:80"

x-aws-cloudformation:
  Resources:
    WebappTCP80TargetGroup:
      Properties:
        HealthCheckPath: /health
        Matcher:
          HttpCode: 200-499
```
@y
```yaml
services:
  webapp:
    image: acme/webapp
    ports:
      - "80:80"

x-aws-cloudformation:
  Resources:
    WebappTCP80TargetGroup:
      Properties:
        HealthCheckPath: /health
        Matcher:
          HttpCode: 200-499
```
@z

@x
### Setting SSL termination by Load Balancer
@y
### Setting SSL termination by Load Balancer
@z

@x
You can use Application Load Balancer to handle the SSL termination for HTTPS services, so that your code, which ran inside
a container, doesn't have to. This is currently not supported by the ECS integration due to the lack of an equivalent abstraction in the Compose specification. However, you can rely on overlays to enable this feature on generated Listeners configuration:
@y
You can use Application Load Balancer to handle the SSL termination for HTTPS services, so that your code, which ran inside
a container, doesn't have to. This is currently not supported by the ECS integration due to the lack of an equivalent abstraction in the Compose specification. However, you can rely on overlays to enable this feature on generated Listeners configuration:
@z

@x
```yaml
services:
  webapp:
    image: acme/webapp
    ports:
      - "80:80"

x-aws-cloudformation:
  Resources:
    WebappTCP80Listener:
      Properties:
        Certificates:
          - CertificateArn: "arn:aws:acm:certificate/123abc"
        Protocol: HTTPS
```
@y
```yaml
services:
  webapp:
    image: acme/webapp
    ports:
      - "80:80"

x-aws-cloudformation:
  Resources:
    WebappTCP80Listener:
      Properties:
        Certificates:
          - CertificateArn: "arn:aws:acm:certificate/123abc"
        Protocol: HTTPS
```
@z

@x
## Using existing AWS network resources
@y
{: #using-existing-aws-network-resources }
## 既存の AWS ネットワークリソースの利用
@z

@x
By default, the Docker Compose CLI creates an ECS cluster for your Compose application, a Security Group per network in your Compose file on your AWS account’s default VPC, and a LoadBalancer to route traffic to your services.
@y
Docker Compose CLI では、Compose アプリケーションに対して、デフォルトで以下のものを生成します。
1 つは Compose アプリケーション用の ECS クラスターです。
もう 1 つはネットワークごとの SecurityGroup です。
これは AWS でのデフォルト VPC 上において、Compose ファイルによって定義されるネットワークごとのものです。
そしてサービスのトラフィックをルーティングする LoadBlancer です。
@z

@x
With the following basic compose file, the Docker Compose CLI will automatically create these ECS constructs including the load balancer to route traffic to the exposed port 80.
@y
以下のような基本的な Compose ファイルを使えば Docker Compose CLI が、ロードバランサーがトラフィックを公開ポート 80 に振り分けるような ECS 構成を自動的に生成してくれます。
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
If your AWS account does not have [permissions](https://github.com/docker/ecs-plugin/blob/master/docs/requirements.md#permissions){: target="_blank" rel="noopener" class="_"} to create such resources, or if you want to manage these yourself, you can use the following custom Compose extensions:
@y
AWS アカウントに、そのようなリソースを生成する [パーミッション](https://github.com/docker/ecs-plugin/blob/master/docs/requirements.md#permissions){: target="_blank" rel="noopener" class="_"} が与えられていない場合、あるいは独自にこれらを管理したい場合は、以下のカスタム Compose 拡張機能を利用することができます。
@z

@x
- Use `x-aws-cluster` as a top-level element in your Compose file to set the ID
of an ECS cluster when deploying a Compose application. Otherwise, a
cluster will be created for the Compose project.
@y
- Compose ファイルの最上位項目として`x-aws-cluster`を利用します。
  これは Compose アプリケーションのデプロイ時に利用する ECS クラスターの ID を設定するものです。
  これがない場合、クラスターは Compose プロジェクトに対して生成されます。
@z

@x
- Use `x-aws-vpc` as a top-level element in your Compose file to set the ARN
of a VPC when deploying a Compose application.
@y
- Compose ファイルの最上位項目として`x-aws-vpc`を利用します。
  これは Compose アプリケーションのデプロイ時に利用する VPC の ARN を設定します。
@z

@x
- Use `x-aws-loadbalancer` as a top-level element in your Compose file to set
the ARN of an existing LoadBalancer.
@y
- Compose ファイルの最上位項目として `x-aws-loadbalancer` を利用します。
  これは既存の LoadBalancer の ARN を設定します。
@z

@x
The latter can be used for those who want to customize application exposure, typically to
use an existing domain name for your application:
@y
The latter can be used for those who want to customize application exposure, typically to
use an existing domain name for your application:
@z

@x
1. Use the AWS web console or CLI to get your VPC and Subnets IDs. You can retrieve the default VPC ID and attached subnets using this AWS CLI commands:
@y
1. Use the AWS web console or CLI to get your VPC and Subnets IDs. You can retrieve the default VPC ID and attached subnets using this AWS CLI commands:
@z

@x
```console
$ aws ec2 describe-vpcs --filters Name=isDefault,Values=true --query 'Vpcs[0].VpcId'

"vpc-123456"
$ aws ec2 describe-subnets --filters Name=vpc-id,Values=vpc-123456 --query 'Subnets[*].SubnetId'

[
    "subnet-1234abcd",
    "subnet-6789ef00",
]
```
@y
```console
$ aws ec2 describe-vpcs --filters Name=isDefault,Values=true --query 'Vpcs[0].VpcId'

"vpc-123456"
$ aws ec2 describe-subnets --filters Name=vpc-id,Values=vpc-123456 --query 'Subnets[*].SubnetId'

[
    "subnet-1234abcd",
    "subnet-6789ef00",
]
```
@z

@x
1. Use the AWS CLI to create your load balancer. The AWS Web Console can also be used but will require adding at least one listener, which we don't need here.
@y
1. Use the AWS CLI to create your load balancer. The AWS Web Console can also be used but will require adding at least one listener, which we don't need here.
@z

@x
```console
$ aws elbv2 create-load-balancer --name myloadbalancer --type application --subnets "subnet-1234abcd" "subnet-6789ef00"

{
    "LoadBalancers": [
        {
            "IpAddressType": "ipv4",
            "VpcId": "vpc-123456",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:us-east-1:1234567890:loadbalancer/app/myloadbalancer/123abcd456",
            "DNSName": "myloadbalancer-123456.us-east-1.elb.amazonaws.com",
...
```
@y
```console
$ aws elbv2 create-load-balancer --name myloadbalancer --type application --subnets "subnet-1234abcd" "subnet-6789ef00"

{
    "LoadBalancers": [
        {
            "IpAddressType": "ipv4",
            "VpcId": "vpc-123456",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:us-east-1:1234567890:loadbalancer/app/myloadbalancer/123abcd456",
            "DNSName": "myloadbalancer-123456.us-east-1.elb.amazonaws.com",
...
```
@z

@x
1. To assign your application an existing domain name, you can configure your DNS with a
CNAME entry pointing to just-created loadbalancer's `DNSName` reported as you created the loadbalancer.
@y
1. To assign your application an existing domain name, you can configure your DNS with a
CNAME entry pointing to just-created loadbalancer's `DNSName` reported as you created the loadbalancer.
@z

@x
1. Use Loadbalancer ARN to set `x-aws-loadbalancer` in your compose file, and deploy your application using `docker compose up` command.
@y
1. Use Loadbalancer ARN to set `x-aws-loadbalancer` in your compose file, and deploy your application using `docker compose up` command.
@z

@x
Please note Docker ECS integration won't be aware of this domain name, so `docker compose ps` command will report URLs with loadbalancer DNSName, not your own domain.
@y
Please note Docker ECS integration won't be aware of this domain name, so `docker compose ps` command will report URLs with loadbalancer DNSName, not your own domain.
@z

@x
You also can use `external: true` inside a network definition in your Compose file for
Docker Compose CLI to _not_ create a Security Group, and set `name` with the
ID of an existing SecurityGroup you want to use for network connectivity between
services:
@y
Docker Compose CLI 向けの Compose ファイルにおいて、ネットワーク定義内に`external: true`を記述することもできます。
これによってセキュリティグループを生成 **しない** ようにします。
そしてサービス間のネットワーク接続を実現するために、利用したい既存の SecurityGroup における名前と ID を設定します。
@z

@x
```yaml
networks:
  back_tier:
    external: true
    name: "sg-1234acbd"
```
@y
```yaml
networks:
  back_tier:
    external: true
    name: "sg-1234acbd"
```
@z

@x
## Local simulation
@y
{: #local-simulation }
## ローカルシミュレーション
@z

@x
When you deploy your application on ECS, you may also rely on the additional AWS services.
In such cases, your code must embed the AWS SDK and retrieve API credentials at runtime.
AWS offers a credentials discovery mechanism which is fully implemented by the SDK, and relies
on accessing a metadata service on a fixed IP address.
@y
ECS 上にアプリケーションをデプロイする際に、追加の AWS サービスを用いたい場合があります。
そのような場合には、コード内に AWS SDK を埋め込んで、実行時に API 資格情報を取り出すことが必要になります。
AWS では資格情報を取得するメカニズムが用意されていて、SDK を使って完全実装されています。
そして固定 IP アドレス上のメタデータサービスにアクセスすることで、これを実現しています。
@z

@x
Once you adopt this approach, running your application locally for testing or debug purposes
can be difficult. Therefore, we have introduced an option on context creation to set the
`ecs-local` context to maintain application portability between local workstation and the
AWS cloud provider.
@y
ただこの手法を採用してしまうと、ローカル環境においてテストやデバッグ目的でアプリケーションを実行することが困難になります。
そこでコンテキストを生成する際のオプションを導入しています。
そのオプションでは`ecs-local`コンテキストを設定して、ローカルマシンと AWS クラウドプロバイダー間でのアプリケーションの可搬性を確保しています。
@z

@x
```console
$ docker context create ecs --local-simulation ecsLocal
Successfully created ecs-local context "ecsLocal"
```
@y
```console
$ docker context create ecs --local-simulation ecsLocal
Successfully created ecs-local context "ecsLocal"
```
@z

@x
When you select a local simulation context, running the `docker compose up` command doesn't
deploy your application on ECS. Therefore, you must run it locally, automatically adjusting your Compose
application so it includes the [ECS local endpoints](https://github.com/awslabs/amazon-ecs-local-container-endpoints/).
This allows the AWS SDK used by application code to
access a local mock container as "AWS metadata API" and retrieve credentials from your own
local `.aws/credentials` config file.
@y
ローカルシミュレーションコンテキストを選んだ場合、`docker compose up`コマンドを実行しても、アプリケーションは ECS 上にデプロイされません。
したがってアプリケーションはローカルでの実行となり、Compose アプリケーションは [ECS local endpoints](https://github.com/awslabs/amazon-ecs-local-container-endpoints/) を用いるように、自動的に調整されます。
このことから、アプリケーションコード内にて利用する AWS SDK は、「AWS メタデータ API」としてローカルの一時的なコンテナーにアクセスし、ローカルの設定ファイル`.aws/credentials`から資格情報を取得することになります。
@z

@x
## Install the Docker Compose CLI on Linux
@y
{: #install-the-docker-compose-cli-on-linux }
## Linux における Docker Compose CLI のインストール
@z

@x
The Docker Compose CLI adds support for running and managing containers on ECS.
@y
Docker Compose CLI は、ECS 上のコンテナー実行と管理をサポートします。
@z

@x
### Install Prerequisites
@y
{: #install-prerequisites }
### インストールの前提条件
@z

@x
[Docker 19.03 or later](https://docs.docker.com/get-docker/)
@y
* [Docker 19.03 またはそれ以降](https://docs.docker.com/get-docker/)
@z

%@x
%### Download the plugin
%@y
%{% comment %}
%### Download the plugin
%{% endcomment %}
%{: #download-the-plugin }
%### プラグインのダウンロード
%@z

%@x
%You can download the Docker ECS plugin from the [docker/ecs-plugin](https://github.com/docker/ecs-plugin){: target="_blank" class="_"} GitHub repository using the following command:
%@y
%{% comment %}
%You can download the Docker ECS plugin from the [docker/ecs-plugin](https://github.com/docker/ecs-plugin){: target="_blank" class="_"} GitHub repository using the following command:
%{% endcomment %}
%GitHub リポジトリ [docker/ecs-plugin](https://github.com/docker/ecs-plugin){: target="_blank" class="_"} から Docker ECS プラグインをダウンロードすることができます。
%ダウンロードには以下のコマンドを実行します。
%@z

%@x
%```console
%$ curl -LO https://github.com/docker/ecs-plugin/releases/latest/download/docker-ecs-linux-amd64
%```
%@y
%```console
%$ curl -LO https://github.com/docker/ecs-plugin/releases/latest/download/docker-ecs-linux-amd64
%```
%@z

%@x
%You will then need to make it an executable:
%@y
%{% comment %}
%You will then need to make it an executable:
%{% endcomment %}
%入手したらこれを実行可能にします。
%@z

%@x
%```console
%$ chmod +x docker-ecs-linux-amd64
%```
%@y
%```console
%$ chmod +x docker-ecs-linux-amd64
%```
%@z

%@x
%### Install the plugin
%@y
%{% comment %}
%### Install the plugin
%{% endcomment %}
%{: #install-the-plugin }
%### プラグインのインストール
%@z

%@x
%Move the plugin you’ve downloaded to the right place so the Docker CLI can use it:
%@y
%{% comment %}
%Move the plugin you’ve downloaded to the right place so the Docker CLI can use it:
%{% endcomment %}
%ダウンロードしたプラグインを Docker CLI が利用できるように、適切な場所に移動させます。
%@z

%@x
%```console
%$ mkdir -p /usr/local/lib/docker/cli-plugins
%
%$ mv docker-ecs-linux-amd64 /usr/local/lib/docker/cli-plugins/docker-ecs
%```
%@y
%```console
%$ mkdir -p /usr/local/lib/docker/cli-plugins
%
%$ mv docker-ecs-linux-amd64 /usr/local/lib/docker/cli-plugins/docker-ecs
%```
%@z

%@x
%You can move the CLI plugin into any of the following directories:
%@y
%{% comment %}
%You can move the CLI plugin into any of the following directories:
%{% endcomment %}
%CLI プラグインを移動するディレクトリは、以下の場所でもかまいません。
%@z

%@x
%- `/usr/local/lib/docker/cli-plugins`
%- `/usr/local/libexec/docker/cli-plugins`
%- `/usr/lib/docker/cli-plugins`
%- `/usr/libexec/docker/cli-plugins`
%@y
%- `/usr/local/lib/docker/cli-plugins`
%- `/usr/local/libexec/docker/cli-plugins`
%- `/usr/lib/docker/cli-plugins`
%- `/usr/libexec/docker/cli-plugins`
%@z

%@x
%Finally, you must enable the experimental features on the CLI. You can do this by setting the environment variable `DOCKER_CLI_EXPERIMENTAL=enabled`, or by setting experimental to `enabled` in your Docker config file located at `~/.docker/config.json`:
%@y
%{% comment %}
%Finally, you must enable the experimental features on the CLI. You can do this by setting the environment variable `DOCKER_CLI_EXPERIMENTAL=enabled`, or by setting experimental to `enabled` in your Docker config file located at `~/.docker/config.json`:
%{% endcomment %}
%最後に CLI において試験的機能を有効にする必要があります。
%これを行うには、環境変数として `DOCKER_CLI_EXPERIMENTAL=enabled` を設定するか、Docker 設定ファイル `~/.docker/config.json` 内に試験的機能を `enabled` とする設定を行います。
%@z

%@x
%```console
%$ export DOCKER_CLI_EXPERIMENTAL=enabled
%
%$ DOCKER_CLI_EXPERIMENTAL=enabled docker help
%
%$ cat ~/.docker/config.json
%{
%  "experimental" : "enabled",
%  "auths" : {
%    "https://index.docker.io/v1/" : {
%
%    }
%  }
%}
%```
%@y
%```console
%$ export DOCKER_CLI_EXPERIMENTAL=enabled
%
%$ DOCKER_CLI_EXPERIMENTAL=enabled docker help
%
%$ cat ~/.docker/config.json
%{
%  "experimental" : "enabled",
%  "auths" : {
%    "https://index.docker.io/v1/" : {
%
%    }
%  }
%}
%```
%@z

%@x
%You can verify whether the CLI plugin installation is successful by checking whether it appears in the CLI help output, or by checking the plugin version. For example:
%@y
%{% comment %}
%You can verify whether the CLI plugin installation is successful by checking whether it appears in the CLI help output, or by checking the plugin version. For example:
%{% endcomment %}
%CLI プラグインのインストールが適切に行われたかどうかは、CLI のヘルプを表示するか、あるいはプラグインのバージョンを表示して確認します。
%@z

%@x
%```console
%$ docker help | grep ecs
%  ecs*        Docker ECS (Docker Inc., 0.0.1)
%
%$ docker ecs version
%Docker ECS plugin 0.0.1
%```
%@y
%```console
%$ docker help | grep ecs
%  ecs*        Docker ECS (Docker Inc., 0.0.1)
%
%$ docker ecs version
%Docker ECS plugin 0.0.1
%```
%@z

@x
### Install script
@y
{: #install-script }
### インストールスクリプト
@z

@x
You can install the new CLI using the install script:
@y
インストールスクリプトを使えば、新たな CLI をインストールできます。
@z

@x
```console
$ curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
```
@y
```console
$ curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
```
@z

@x
## FAQ
@y
## FAQ
@z

@x
**What does the error `this tool requires the "new ARN resource ID format"` mean?**
@y
**`this tool requires the "new ARN resource ID format"` というエラーはどんな意味？**
@z

@x
This error message means that your account requires the new ARN resource ID format for ECS. To learn more, see [Migrating your Amazon ECS deployment to the new ARN and resource ID format](https://aws.amazon.com/blogs/compute/migrating-your-amazon-ecs-deployment-to-the-new-arn-and-resource-id-format-2/){: target="_blank" rel="noopener" class="_"}.
@y
このエラーメッセージは、利用アカウントに対しては ECS 向けの新たな ARN リソース ID フォーマットが必要であることを示しています。
詳しくは [Migrating your Amazon ECS deployment to the new ARN and resource ID format](https://aws.amazon.com/blogs/compute/migrating-your-amazon-ecs-deployment-to-the-new-arn-and-resource-id-format-2/){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
Thank you for trying out the Docker Compose CLI. Your feedback is very important to us. Let us know your feedback by creating an issue in the [Compose CLI](https://github.com/docker/compose-cli){: target="_blank" rel="noopener" class="_"} GitHub repository.
@y
Docker Compose CLI を利用していただき、ありがとうございます。
みなさんからのフィードバックが大変重要です。
フィードバックをいただくには、Github レポジトリ [Compose CLI](https://github.com/docker/compose-cli){: target="_blank" rel="noopener" class="_"} に issue をあげてください。
@z
