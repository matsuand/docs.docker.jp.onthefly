%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Deploying Docker containers on ECS
description: Deploying Docker containers on ECS
keywords: Docker, AWS, ECS, Integration, context, Compose, cli, deploy, containers, cloud
toc_min: 1
toc_max: 2
---
@y
---
title: ECS での Docker コンテナーのデプロイ
description: ECS において Docker コンテナーをデプロイします。
keywords: Docker, AWS, ECS, Integration, context, Compose, cli, deploy, containers, cloud
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
The Docker Compose CLI enables developers to use native Docker commands to run applications in Amazon EC2 Container Service (ECS) when building cloud-native applications.
@y
{% comment %}
The Docker Compose CLI enables developers to use native Docker commands to run applications in Amazon EC2 Container Service (ECS) when building cloud-native applications.
{% endcomment %}
Docker Compose CLI は、Amazon EC2 コンテナーサービス（Amazon EC2 Container Service; ECS）の中で、ネイティブな Docker コマンドの利用を可能にします。
これを使って、クラウドに適したアプリケーションを構築し実行します。
@z

@x
The integration between Docker and Amazon ECS allows developers to use the Docker Compose CLI to:
@y
{% comment %}
The integration between Docker and Amazon ECS allows developers to use the Docker Compose CLI to:
{% endcomment %}
Docker と Amazon ECS の統合により、開発者が Docker Compose CLI を用いる際には、以下のことが可能になります。
@z

@x
* Set up an AWS context in one Docker command, allowing you to switch from a local context to a cloud context and run applications quickly and easily
* Simplify multi-container application development on Amazon ECS using Compose files
@y
{% comment %}
* Set up an AWS context in one Docker command, allowing you to switch from a local context to a cloud context and run applications quickly and easily
* Simplify multi-container application development on Amazon ECS using Compose files
{% endcomment %}
* 1 つの Docker コマンドに対して AWS コンテキストを設定することができます。
  これによってローカルコンテキストとクラウドコンテキストを切り替えられるようになり、アプリケーションの実行をすばやく簡単に行うことができます。
* Compose ファイルを使って、Amazon ECS 上の複数コンテナーアプリケーションの開発を単純化できます。
@z

@x
>**Note**
>
> The Docker Compose CLI is currently a beta release. The commands and flags are subject to change in subsequent releases.
{:.important}
@y
{% comment %}
>**Note**
>
> The Docker Compose CLI is currently a beta release. The commands and flags are subject to change in subsequent releases.
{:.important}
{% endcomment %}
>**メモ**
>
> Docker Compose CLIは、現在ベータ版として提供されます。
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
To deploy Docker containers on ECS, you must meet the following requirements:
@y
{% comment %}
To deploy Docker containers on ECS, you must meet the following requirements:
{% endcomment %}
Docker コンテナーを ECS にデプロイするには、以下の条件を満たしていることが必要です。
@z

@x
1. Download and install Docker Desktop Stable version 2.3.0.5 or later, or Edge version 2.3.2.0 or later.
@y
{% comment %}
1. Download and install Docker Desktop Stable version 2.3.0.5 or later, or Edge version 2.3.2.0 or later.
{% endcomment %}
1. Docker Desktop 安定版（Stable）2.3.0.5 またはそれ以降、あるいは最新版（Edge）2.3.2.0 またはそれ以降をダウンロードしインストールしていることが必要です。
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
    あるいは [Docker Compose CLI for Linux](#install-the-docker-compose-cli-on-linux) をインストールしていることが必要です。
@z

@x
2. Ensure you have an AWS account.
@y
{% comment %}
2. Ensure you have an AWS account.
{% endcomment %}
2. AWS アカウントを持っていることが必要です。
@z

@x
Docker not only runs multi-container applications locally, but also enables
developers to seamlessly deploy Docker containers on Amazon ECS using a
Compose file with the `docker compose up` command. The following sections
contain instructions on how to deploy your Compose application on Amazon ECS.
@y
{% comment %}
Docker not only runs multi-container applications locally, but also enables
developers to seamlessly deploy Docker containers on Amazon ECS using a
Compose file with the `docker compose up` command. The following sections
contain instructions on how to deploy your Compose application on Amazon ECS.
{% endcomment %}
Docker は、単にローカルのマルチコンテナーを実行するだけのものではなくなります。
`docker compose up` により Compose ファイルを使って Amazon ECS 上の Docker コンテナーをシームレスにデプロイできます。
以下の節では Amazon ECS 上において Docker コンテナーをデプロイする手順を説明します。
@z

@x
### Create AWS context
@y
{% comment %}
### Create AWS context
{% endcomment %}
{: #create-aws-context }
### AWS コンテキストの生成
@z

@x
Run the `docker context create ecs myecscontext` command to create an Amazon ECS Docker
context named `myecscontext`. If you have already installed and configured the AWS CLI,
the setup command lets you select an existing AWS profile to connect to Amazon.
Otherwise, you can create a new profile by passing an
[AWS access key ID and a secret access key](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
Run the `docker context create ecs myecscontext` command to create an Amazon ECS Docker
context named `myecscontext`. If you have already installed and configured the AWS CLI,
the setup command lets you select an existing AWS profile to connect to Amazon.
Otherwise, you can create a new profile by passing an
[AWS access key ID and a secret access key](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
`docker context create ecs myecscontext` コマンドを実行して AWS コンテキストを生成します。
すでに AWS CLI をインストールし設定を行っているのであれば、このセットアップコマンドにより、既存の AWS プロファイルを選んで Amazon への接続を行います。
これがまだできていない場合は、[AWS access key ID and a secret access key](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys){: target="_blank" rel="noopener" class="_"} を通じて、新たなプロファイルを生成します。
@z

@x
After you have created an AWS context, you can list your Docker contexts by running the `docker context ls` command:
@y
{% comment %}
After you have created an AWS context, you can list your Docker contexts by running the `docker context ls` command:
{% endcomment %}
AWS コンテキストを生成したら、`docker context ls` コマンドを実行して Docker コンテキストの一覧を表示します。
@z

@x
```console
NAME   DESCRIPTION  DOCKER ENDPOINT  KUBERNETES ENDPOINT ORCHESTRATOR
myecscontext *
default  Current DOCKER_HOST based configuration   unix:///var/run/docker.sock     swarm
```
@y
```console
NAME   DESCRIPTION  DOCKER ENDPOINT  KUBERNETES ENDPOINT ORCHESTRATOR
myecscontext *
default  Current DOCKER_HOST based configuration   unix:///var/run/docker.sock     swarm
```
@z

@x
## Run Compose applications
@y
{% comment %}
## Run Compose applications
{% endcomment %}
{: #run-compose-applications }
## Compose アプリケーションの実行
@z

@x
You can deploy and manage multi-container applications defined in Compose files
to Amazon ECS using the `docker compose` command. To do this:
@y
{% comment %}
You can deploy and manage multi-container applications defined in Compose files
to Amazon ECS using the `docker compose` command. To do this:
{% endcomment %}
Compose ファイルに定義したマルチコンテナーによるアプリケーションを、Amazon ECS に対してデプロイし管理するためには、`docker compose` コマンドを実行します。
これを行うためには以下のことが必要です。
@z

@x
- Ensure you are using your ECS context. You can do this either by specifying
the `--context myecscontext` flag with your command, or by setting the
current context using the command `docker context use myecscontext`.
@y
{% comment %}
- Ensure you are using your ECS context. You can do this either by specifying
the `--context myecscontext` flag with your command, or by setting the
current context using the command `docker context use myecscontext`.
{% endcomment %}
- AWS コンテキストを利用していることが必要です。
  これはコマンド実行時に`--context myecscontext`フラグを指定するか、あるいはカレントなコンテキストを設定するコマンド`docker context use myecscontext`を実行します。
@z

@x
- Run `docker compose up` and `docker compose down` to start and then
stop a full Compose application.
@y
{% comment %}
- Run `docker compose up` and `docker compose down` to start and then
stop a full Compose application.
{% endcomment %}
- `docker compose up`と`docker compose down`を実行して、Compose アプリケーションの開始、停止ができることが必要です。
@z

@x
  By default, `docker compose up` uses the `docker-compose.yaml` file in
  the current folder. You can specify the Compose file directly using the
  `--file` flag.
@y
  {% comment %}
  By default, `docker compose up` uses the `docker-compose.yaml` file in
  the current folder. You can specify the Compose file directly using the
  `--file` flag.
  {% endcomment %}
  デフォルトにおいて`docker compose up`は、カレントフォルダーの`docker-compose.yaml`ファイルを利用します。
  Compose ファイルを直接`--file`フラグを使って指定することもできます。
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
- You can view services created for the Compose application on Amazon ECS and
their state using the `docker compose ps` command.
@y
{% comment %}
- You can view services created for the Compose application on Amazon ECS and
their state using the `docker compose ps` command.
{% endcomment %}
- Amazon ECS 上の Compose アプリケーションに対して生成されたサービスの情報およびその状態を確認するには`docker compose ps`コマンドを実行します。
@z

@x
- You can view logs from containers that are part of the Compose application
using the `docker compose logs` command.
@y
{% comment %}
- You can view logs from containers that are part of the Compose application
using the `docker compose logs` command.
{% endcomment %}
- Compose アプリケーションを構成するコンテナーに対しては、コマンド`docker compose logs`を実行してそれぞれのログを確認できます。
@z

@x
## Private Docker images
@y
{% comment %}
## Private Docker images
{% endcomment %}
{: #private-docker-images }
## プライベートな Docker イメージ
@z

@x
The Docker Compose CLI automatically configures authorization so you can pull private images from the Amazon ECR registry on the same AWS account. To pull private images from another registry, including Docker Hub, you’ll have to create a Username + Password (or a Username + Token) secret on the [AWS Secrets Manager service](https://docs.aws.amazon.com/secretsmanager/){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
The Docker Compose CLI automatically configures authorization so you can pull private images from the Amazon ECR registry on the same AWS account. To pull private images from another registry, including Docker Hub, you’ll have to create a Username + Password (or a Username + Token) secret on the [AWS Secrets Manager service](https://docs.aws.amazon.com/secretsmanager/){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
Docker Compose CLI では自動的に認証が設定されます。
したがって Amazon ECR レジストリにあるプライベートイメージは、同じ AWS アカウントを使ってプルすることができます。
一方 Docker Hub も含め、別のレジストリからプライベートイメージをプルするには、[AWS Secrets Manager service](https://docs.aws.amazon.com/secretsmanager/){: target="_blank" rel="noopener" class="_"} 上にユーザー名とパスワード（あるいはユーザー名とトークン）を生成する必要があります。
@z

@x
For your convenience, the Docker Compose CLI offers the `docker secret` command, so you can manage secrets created on AWS SMS without having to install the AWS CLI.
@y
{% comment %}
For your convenience, the Docker Compose CLI offers the `docker secret` command, so you can manage secrets created on AWS SMS without having to install the AWS CLI.
{% endcomment %}
Docker Compose CLI では、便利なコマンドとして`docker secret`が提供されています。
したがって AWS CLI をインストールしていなくても、AWS SMS において生成した機密情報を管理することができます。
@z

@x
```console
docker secret create dockerhubAccessToken --username <dockerhubuser>  --password <dockerhubtoken>
arn:aws:secretsmanager:eu-west-3:12345:secret:DockerHubAccessToken
```
@y
```console
docker secret create dockerhubAccessToken --username <dockerhubuser>  --password <dockerhubtoken>
arn:aws:secretsmanager:eu-west-3:12345:secret:DockerHubAccessToken
```
@z

@x
Once created, you can use this ARN in you Compose file using using `x-aws-pull_credentials` custom extension with the Docker image URI for your service.
@y
{% comment %}
Once created, you can use this ARN in you Compose file using using `x-aws-pull_credentials` custom extension with the Docker image URI for your service.
{% endcomment %}
この ARN を生成したら Compose ファイル内において、カスタム拡張 `x-aws-pull_credentials` を利用して、そのサービスに対する Docker イメージ URI を指定することができます。
@z

@x
```console
version: 3.8
services:
  worker:
    image: mycompany/privateimage
    x-aws-pull_credentials: "arn:aws:secretsmanager:eu-west-3:12345:secret:DockerHubAccessToken"
```
@y
```console
version: 3.8
services:
  worker:
    image: mycompany/privateimage
    x-aws-pull_credentials: "arn:aws:secretsmanager:eu-west-3:12345:secret:DockerHubAccessToken"
```
@z

@x
>**Note**
>
> If you set the Compose file version to 3.8 or later, you can use the same Compose file for local deployment using `docker-compose`. Custom extensions will be ignored in this case.
@y
{% comment %}
>**Note**
>
> If you set the Compose file version to 3.8 or later, you can use the same Compose file for local deployment using `docker-compose`. Custom extensions will be ignored in this case.
{% endcomment %}
>**メモ**
>
> Compose ファイルのバージョンを 3.8 またはそれ以降に指定すると、この Compose ファイルをそのまま、`docker-compose` を使ってローカル開発環境向けに利用することができます。
その場合、カスタム拡張は無視されます。
@z

@x
## Service discovery
@y
{% comment %}
## Service discovery
{% endcomment %}
{: #service-discovery }
## サービスの検出
@z

@x
Service-to-service communication is implemented by the [Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html){: target="_blank" rel="noopener" class="_"} rules, allowing services sharing a common Compose file “network” to communicate together. This allows individual services to run with distinct constraints (memory, cpu) and replication rules. However, it comes with a constraint that Docker images have to handle service discovery and wait for dependent services to be available.
@y
{% include jatrans.md jatrans_pattern="1" %}

{% comment %}
Service-to-service communication is implemented by the [Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html){: target="_blank" rel="noopener" class="_"} rules, allowing services sharing a common Compose file “network” to communicate together. This allows individual services to run with distinct constraints (memory, cpu) and replication rules. However, it comes with a constraint that Docker images have to handle service discovery and wait for dependent services to be available.
{% endcomment %}
サービス間の通信は [Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html){: target="_blank" rel="noopener" class="_"} ルールによって実現されています。
サービス間では共通の Compose ファイル「network」が共有され、互いに通信を行います。
そこでは特定のサービスに対して、異なる（メモリ、CPU の）制約やレプリカに関するルールにもとづいて実行することが可能です。
ただしこれを行うための条件として、Docker イメージがサービスを検出できて、従属サービスの利用可能状態を待つことができなければなりません。
@z

@x
### Service names
@y
{% comment %}
### Service names
{% endcomment %}
{: #service-names }
### サービス名
@z

@x
Services are registered by the Docker Compose CLI on [AWS Cloud Map](https://docs.aws.amazon.com/cloud-map/latest/dg/what-is-cloud-map.html){: target="_blank" rel="noopener" class="_"} during application deployment. They are declared as fully qualified domain names of the form: `<service>.<compose_project_name>.local`. Services can retrieve their dependencies using this fully qualified name, or can just use a short service name (as they do with docker-compose). 
@y
{% comment %}
Services are registered by the Docker Compose CLI on [AWS Cloud Map](https://docs.aws.amazon.com/cloud-map/latest/dg/what-is-cloud-map.html){: target="_blank" rel="noopener" class="_"} during application deployment. They are declared as fully qualified domain names of the form: `<service>.<compose_project_name>.local`. Services can retrieve their dependencies using this fully qualified name, or can just use a short service name (as they do with docker-compose). 
{% endcomment %}
Docker Compose CLI においてアプリケーションデプロイを行うサービスは、[AWS Cloud Map](https://docs.aws.amazon.com/cloud-map/latest/dg/what-is-cloud-map.html){: target="_blank" rel="noopener" class="_"} 上に登録されます。
これは `<サービス>.<composeプロジェクト名>.local` という形の完全修飾ドメイン名として表わされています。
サービスが、依存するサービスを引き出す際には、この完全修飾ドメイン名を利用するか、あるいは短いサービス名（docker-compose において用いられるもの）が利用されます。
@z

@x
### Volumes
@y
{% comment %}
### Volumes
{% endcomment %}
{: #volumes }
### ボリューム
@z

@x
ECS integration supports volume management based on Amazon Elastic File System (Amazon EFS).
For a Compose file to declare a `volume`, ECS integration will define creation of an EFS
file system within the CloudFormation template, with `Retain` policy so data won't
be deleted on application shut-down. If the same application (same project name) is
deployed again, the file system will be re-attached to offer the same user experience
developers are used to with docker-compose.
@y
{% comment %}
ECS integration supports volume management based on Amazon Elastic File System (Amazon EFS).
For a Compose file to declare a `volume`, ECS integration will define creation of an EFS
file system within the CloudFormation template, with `Retain` policy so data won't
be deleted on application shut-down. If the same application (same project name) is
deployed again, the file system will be re-attached to offer the same user experience
developers are used to with docker-compose.
{% endcomment %}
ECS 統合では Amazon Elastic File System (Amazon EFS) をベースとしたボリューム管理をサポートしています。
ECS 統合において Compose ファイルに`volume`を宣言する際には、CloudFormation テンプレート内に EFS ファイルシステムの生成を定義します。
`Retain`（維持）ポリシーを利用すれば、アプリケーションのシャットダウン時にデータが削除されることはありません。
同一のアプリケーション（同一のプロジェクト名）が再度デプロイされると、ファイルシステムが再度アタッチされて、それまで開発者が行っていた docker-compose による作業を再開できます。
@z

@x
If required, the initial file system can be customized using `driver-opts`:
@y
{% comment %}
If required, the initial file system can be customized using `driver-opts`:
{% endcomment %}
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
      provisioned_throughput: 1024
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
      provisioned_throughput: 1024
```
@z

@x
File systems created by executing `docker compose` on AWS can be listed using 
`docker volume ls` and removed with `docker volume rm <filesystemID>`.
@y
{% comment %}
File systems created by executing `docker compose` on AWS can be listed using 
`docker volume ls` and removed with `docker volume rm <filesystemID>`.
{% endcomment %}
AWS 上において`docker compose`を実行して生成されるファイルシステムは、`docker volume ls`によって一覧確認ができます。
また`docker volume rm <ファイルシステムID>`によって削除することができます。
@z

@x
An existing file system can also be used for users who already have data stored on EFS
or want to use a file system created by another Compose stack.
@y
{% comment %}
An existing file system can also be used for users who already have data stored on EFS
or want to use a file system created by another Compose stack.
{% endcomment %}
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
{% comment %}
Accessing a volume from a container can introduce POSIX user ID 
permission issues, as Docker images can define arbitrary user ID / group ID for the
process to run inside a container. However, the same `uid:gid` will have to match
POSIX permissions on the file system. To work around the possible conflict, you can set the volume
`uid` and `gid` to be used when accessing a volume:
{% endcomment %}
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
### Secrets
@y
### Secrets
@z

@x
You can pass secrets to your ECS services using Docker model to bind sensitive
data as files under `/run/secrets`. If your Compose file declares a secret as
file, such a secret will be created as part of your application deployment on
ECS. If you use an existing secret as `external: true` reference in your
Compose file, use the ECS Secrets Manager full ARN as the secret name:
@y
{% comment %}
You can pass secrets to your ECS services using Docker model to bind sensitive
data as files under `/run/secrets`. If your Compose file declares a secret as
file, such a secret will be created as part of your application deployment on
ECS. If you use an existing secret as `external: true` reference in your
Compose file, use the ECS Secrets Manager full ARN as the secret name:
{% endcomment %}
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
{% comment %}
Secrets will be available at runtime for your service as a plain text file `/run/secrets/foo`.
{% endcomment %}
Secret はサービス実行時には、`/run/secrets/foo` というプレーンなテキストファイルとしてアクセスできます。
@z

@x
The AWS Secrets Manager allows you to store sensitive data either as a plain
text (like Docker secret does), or as a hierarchical JSON document. You can
use the latter with Docker Compose CLI by using custom field `x-aws-keys` to
define which entries in the JSON document to bind as a secret in your service
container.
@y
{% comment %}
The AWS Secrets Manager allows you to store sensitive data either as a plain
text (like Docker secret does), or as a hierarchical JSON document. You can
use the latter with Docker Compose CLI by using custom field `x-aws-keys` to
define which entries in the JSON document to bind as a secret in your service
container.
{% endcomment %}
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
{% comment %}
By doing this, the secret for `bar` key will be available at runtime for your
service as a plain text file `/run/secrets/foo/bar`. You can use the special
value `*` to get all keys bound in your container.
{% endcomment %}
このようにするとキー `bar` に対する機密データは、サービスの実行時に `/run/secrets/foo/bar` というプレーンなテキストファイルとしてアクセスできます。
特別な値として `*` を用いると、コンテナー内のキーすべてを得ることができます。
@z

@x
### Logging
@y
{% comment %}
### Logging
{% endcomment %}
{: #logging }
### ログ処理
@z

@x
The Docker Compose CLI configures AWS CloudWatch Logs service for your
containers.
A log group is created for the application as `docker-compose/<application_name>`,
and log streams are created for each service and container in your application
as `<application_name>/<service_name>/<container_ID>`.
@y
{% comment %}
The Docker Compose CLI configures AWS CloudWatch Logs service for your
containers.
A log group is created for the application as `docker-compose/<application_name>`,
and log streams are created for each service and container in your application
as `<application_name>/<service_name>/<container_ID>`.
{% endcomment %}
Docker Compose CLI では、コンテナーに対して AWS CloudWatch ログサービスを設定します。
アプリケーションにおいて、ロググループ`docker-compose/<アプリケーション名>`が生成され、またアプリケーション内の各サービスとコンテナーにおいては、ログストリーム`<アプリケーション名>/<サービス名>/<コンテナーID>`が生成されます。
@z

@x
You can fine tune AWS CloudWatch Logs using extension field `x-aws-logs_retention`
in your Compose file to set the number of retention days for log events. The
default behavior is to keep logs forever.
@y
{% comment %}
You can fine tune AWS CloudWatch Logs using extension field `x-aws-logs_retention`
in your Compose file to set the number of retention days for log events. The
default behavior is to keep logs forever.
{% endcomment %}
AWS CloudWatch ログに対しては Compose ファイル内の拡張項目`x-aws-logs_retention`を使って、イベントの保存日数を調整することができます。
デフォルトは無期限に保存します。
@z

@x
You can also pass `awslogs` driver parameters to your container as standard
Compose file `logging.driver_opts` elements.
@y
{% comment %}
You can also pass `awslogs` driver parameters to your container as standard
Compose file `logging.driver_opts` elements.
{% endcomment %}
標準的な Compose ファイルの項目`logging.driver_opts`を使えば、コンテナーに対して`awslogs`ドライバーのパラメーターを指定することができます。
@z

@x
### Dependent service startup time and DNS resolution
@y
{% comment %}
### Dependent service startup time and DNS resolution
{% endcomment %}
{: #dependent-service-startup-time-and-dns-resolution }
### 依存サービスの起動タイミングと DNS 名前解決
@z

@x
Services get concurrently scheduled on ECS when a Compose file is deployed. AWS Cloud Map introduces an initial delay for DNS service to be able to resolve your services domain names. As a result, your code needs to be adjusted to support this delay by waiting for dependent services to be ready, or by adding a wait-script as the entrypoint to your Docker image, as documented in [Control startup order](https://docs.docker.com/compose/startup-order/).
@y
{% comment %}
Services get concurrently scheduled on ECS when a Compose file is deployed. AWS Cloud Map introduces an initial delay for DNS service to be able to resolve your services domain names. As a result, your code needs to be adjusted to support this delay by waiting for dependent services to be ready, or by adding a wait-script as the entrypoint to your Docker image, as documented in [Control startup order](https://docs.docker.com/compose/startup-order/).
{% endcomment %}
ECS 上におけるサービスは、Compose ファイルがデプロイされたと同時にスケジュールされます。
AWS Cloud Map は DNS サービスに対して初期の待機時間を導入していて、デプロイされたサービスのドメイン名をDNS サービスが解決できるまで待機します。
このため、開発コードにはこの待機時間への対応が必要であり、依存サービスが準備状態になるまで待つ、あるいはエントリーポイントにウェイトを行うスクリプトを Docker イメージに追加するなどして、調整を行う必要があります。
このことは [Compose における起動、停止順の制御]({{ site.baseurl }}/compose/startup-order/) で述べています。
@z

@x
Alternatively, you can use the [depends_on](https://github.com/compose-spec/compose-spec/blob/master/spec.md#depends_on){: target="_blank" rel="noopener" class="_"} feature of the Compose file format. By doing this, dependent service will be created first, and application deployment will wait for it to be up and running before starting the creation of the dependent services.
@y
{% comment %}
Alternatively, you can use the [depends_on](https://github.com/compose-spec/compose-spec/blob/master/spec.md#depends_on){: target="_blank" rel="noopener" class="_"} feature of the Compose file format. By doing this, dependent service will be created first, and application deployment will wait for it to be up and running before starting the creation of the dependent services.
{% endcomment %}
あるいは Compose ファイルにおける [depends_on](https://github.com/compose-spec/compose-spec/blob/master/spec.md#depends_on){: target="_blank" rel="noopener" class="_"} の機能を利用することもできます。
これを利用すると、依存サービスがまず初めに生成され、これが起動されるのを待って、アプリケーションのデプロイが行われるようになります。
@z

@x
### Rolling update
@y
{% comment %}
### Rolling update
{% endcomment %}
{: #rolling-update }
### ローリングアップデート
@z

@x
Your ECS services are created with rolling update configuration. As you run
`docker compose up` with a modified Compose file, the stack will be
updated to reflect changes, and if required, some services will be replaced.
This replacement process will follow the rolling-update configuration set by
your services [`deploy.update_config`](https://docs.docker.com/compose/compose-file/#update_config)
configuration.
@y
{% comment %}
Your ECS services are created with rolling update configuration. As you run
`docker compose up` with a modified Compose file, the stack will be
updated to reflect changes, and if required, some services will be replaced.
This replacement process will follow the rolling-update configuration set by
your services [`deploy.update_config`](https://docs.docker.com/compose/compose-file/#update_config)
configuration.
{% endcomment %}
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
{% comment %}
AWS ECS uses a percent-based model to define the number of containers to be
run or shut down during a rolling update. The Docker Compose CLI computes
rolling update configuration according to the `parallelism` and `replicas`
fields. However, you might prefer to directly configure a rolling update
using the extension fields `x-aws-min_percent` and `x-aws-max_percent`.
The former sets the minimum percent of containers to run for service, and the
latter sets the maximum percent of additional containers to start before
previous versions are removed.
{% endcomment %}
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
{% comment %}
By default, the ECS rolling update is set to run twice the number of
containers for a service (200%), and has the ability to shut down 100%
containers during the update.
{% endcomment %}
デフォルトにおいて ECS のローリングアップデートは、コンテナー数の 2 倍（200%）の数だけ起動されるように設定されます。
またアップデート時にコンテナー停止を行う程度は 100 % として設定されます。
@z

@x
### Auto scaling
@y
### Auto scaling
@z

@x
The Compose file model does not define any attributes to declare auto-scaling conditions.
Therefore, we rely on `x-aws-autoscaling` custom extension to define the auto-scaling range, as
well as cpu _or_ memory to define target metric, expressed as resource usage percent.
@y
The Compose file model does not define any attributes to declare auto-scaling conditions.
Therefore, we rely on `x-aws-autoscaling` custom extension to define the auto-scaling range, as
well as cpu _or_ memory to define target metric, expressed as resource usage percent.
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
### IAM roles
@y
{% comment %}
### IAM roles
{% endcomment %}
{: #iam-roles }
### IAM ロール
@z

@x
Your ECS Tasks are executed with a dedicated IAM role, granting access
to AWS Managed policies[`AmazonECSTaskExecutionRolePolicy`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)
and [`AmazonEC2ContainerRegistryReadOnly`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecr_managed_policies.html).
In addition, if your service uses secrets, IAM Role gets additional
permissions to read and decrypt secrets from the AWS Secret Manager.
@y
{% comment %}
Your ECS Tasks are executed with a dedicated IAM role, granting access
to AWS Managed policies[`AmazonECSTaskExecutionRolePolicy`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)
and [`AmazonEC2ContainerRegistryReadOnly`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecr_managed_policies.html).
In addition, if your service uses secrets, IAM Role gets additional
permissions to read and decrypt secrets from the AWS Secret Manager.
{% endcomment %}
ECS タスクは、AWS 管理ポリシー[`AmazonECSTaskExecutionRolePolicy`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html) と [`AmazonEC2ContainerRegistryReadOnly`](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecr_managed_policies.html) へのアクセスが可能な、専用の IAM ロールによって実行されます。
さらにサービスが Secret を利用している場合、IAM ロールは追加の権限によって AWS Secret マネージャーから Secret の読み込みと復号化を行います。
@z

@x
You can grant additional managed policies to your service execution
by using `x-aws-policies` inside a service definition:
@y
{% comment %}
You can grant additional managed policies to your service execution
by using `x-aws-policies` inside a service definition:
{% endcomment %}
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
{% comment %}
You can also write your own [IAM Policy Document](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html)
to fine tune the IAM role to be applied to your ECS service, and use
`x-aws-role` inside a service definition to pass the
yaml-formatted policy document.
{% endcomment %}
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
          Resource":
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
          Resource":
            - "*"
```
@z

@x
## Tuning the CloudFormation template
@y
{% comment %}
## Tuning the CloudFormation template
{% endcomment %}
{: #tuning-the-cloudformation-template }
## CloudFormation テンプレートの調整
@z

@x
The Docker Compose CLI relies on [Amazon CloudFormation](https://docs.aws.amazon.com/cloudformation/){: target="_blank" rel="noopener" class="_"} to manage the application deployment. To get more control on the created resources, you can use `docker compose convert` to generate a CloudFormation stack file from your Compose file. This allows you to inspect resources it defines, or customize the template for your needs, and then apply the template to AWS using the AWS CLI, or the AWS web console.
@y
{% comment %}
The Docker Compose CLI relies on [Amazon CloudFormation](https://docs.aws.amazon.com/cloudformation/){: target="_blank" rel="noopener" class="_"} to manage the application deployment. To get more control on the created resources, you can use `docker compose convert` to generate a CloudFormation stack file from your Compose file. This allows you to inspect resources it defines, or customize the template for your needs, and then apply the template to AWS using the AWS CLI, or the AWS web console.
{% endcomment %}
Docker Compose CLI では [Amazon CloudFormation](https://docs.aws.amazon.com/cloudformation/){: target="_blank" rel="noopener" class="_"} を活用して、アプリケーションのデプロイ管理を行っています。
生成済みのリソースをより的確に制御するには、`docker compose convert` を使い、Compose ファイルから CloudFormation スタックファイルを生成します。
スタックファイルを生成すると、そこに定義されたリソースの確認や、必要に応じたテンプレートのカスタマイズ、AWS CLI や AWS ウェブコンソールからのテンプレートの適用を行うことができます。
@z

@x
## Using existing AWS network resources
@y
{% comment %}
## Using existing AWS network resources
{% endcomment %}
{: #using-existing-aws-network-resources }
## 既存の AWS ネットワークリソースの利用
@z

@x
By default, the Docker Compose CLI creates an ECS cluster for your Compose application, a Security Group per network in your Compose file on your AWS account’s default VPC, and a LoadBalancer to route traffic to your services. If your AWS account does not have [permissions](https://github.com/docker/ecs-plugin/blob/master/docs/requirements.md#permissions){: target="_blank" rel="noopener" class="_"} to create such resources, or if you want to manage these yourself, you can use the following custom Compose extensions:
@y
{% comment %}
By default, the Docker Compose CLI creates an ECS cluster for your Compose application, a Security Group per network in your Compose file on your AWS account’s default VPC, and a LoadBalancer to route traffic to your services. If your AWS account does not have [permissions](https://github.com/docker/ecs-plugin/blob/master/docs/requirements.md#permissions){: target="_blank" rel="noopener" class="_"} to create such resources, or if you want to manage these yourself, you can use the following custom Compose extensions:
{% endcomment %}
Docker Compose CLI では、Compose アプリケーションに対して、デフォルトで以下のものを生成します。
1 つは Compose アプリケーション用の ECS クラスターです。
もう 1 つはネットワークごとの SecurityGroup です。
これは AWS でのデフォルト VPC 上において、Compose ファイルによって定義されるネットワークごとのものです。
そしてサービスのトラフィックをルーティングする LoadBlancer です。
AWS アカウントに、そのようなリソースを生成する [パーミッション](https://github.com/docker/ecs-plugin/blob/master/docs/requirements.md#permissions){: target="_blank" rel="noopener" class="_"} が与えられていない場合、あるいは独自にこれらを管理したい場合は、以下のカスタム Compose 拡張機能を利用することができます。
@z

@x
- Use `x-aws-cluster` as a top-level element in your Compose file to set the ARN
of an ECS cluster when deploying a Compose application. Otherwise, a
cluster will be created for the Compose project.
@y
{% comment %}
- Use `x-aws-cluster` as a top-level element in your Compose file to set the ARN
of an ECS cluster when deploying a Compose application. Otherwise, a
cluster will be created for the Compose project.
{% endcomment %}
- Compose ファイルの最上位項目として`x-aws-cluster`を利用します。
  これは Compose アプリケーションのデプロイ時に利用する ECS クラスターの ARN を設定するものです。
  これがない場合、クラスターは Compose プロジェクトに対して生成されます。
@z

@x
- Use `x-aws-vpc` as a top-level element in your Compose file to set the ARN
of a VPC when deploying a Compose application.
@y
{% comment %}
- Use `x-aws-vpc` as a top-level element in your Compose file to set the ARN
of a VPC when deploying a Compose application.
{% endcomment %}
- Compose ファイルの最上位項目として`x-aws-vpc`を利用します。
  これは Compose アプリケーションのデプロイ時に利用する VPC の ARN を設定します。
@z

@x
- Use `x-aws-loadbalancer` as a top-level element in your Compose file to set
the ARN of an existing LoadBalancer.
@y
{% comment %}
- Use `x-aws-loadbalancer` as a top-level element in your Compose file to set
the ARN of an existing LoadBalancer.
{% endcomment %}
- Compose ファイルの最上位項目として `x-aws-loadbalancer` を利用します。
  これは既存の LoadBalancer の ARN を設定します。
@z

@x
- Use `external: true` inside a network definition in your Compose file for
Docker Compose CLI to _not_ create a Security Group, and set `name` with the
ID of an existing SecurityGroup you want to use for network connectivity between
services:
@y
{% comment %}
- Use `external: true` inside a network definition in your Compose file for
Docker Compose CLI to _not_ create a Security Group, and set `name` with the
ID of an existing SecurityGroup you want to use for network connectivity between
services:
{% endcomment %}
- Docker Compose CLI 向けの Compose ファイルにおいて、ネットワーク定義内に`external: true`を記述します。
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
{% comment %}
## Local simulation
{% endcomment %}
{: #local-simulation }
## ローカルシミュレーション
@z

@x
When you deploy your application on ECS, you may also rely on the additional AWS services.
In such cases, your code must embed the AWS SDK and retrieve API credentials at runtime.
AWS offers a credentials discovery mechanism which is fully implemented by the SDK, and relies
on accessing a metadata service on a fixed IP address.
@y
{% comment %}
When you deploy your application on ECS, you may also rely on the additional AWS services.
In such cases, your code must embed the AWS SDK and retrieve API credentials at runtime.
AWS offers a credentials discovery mechanism which is fully implemented by the SDK, and relies
on accessing a metadata service on a fixed IP address.
{% endcomment %}
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
{% comment %}
Once you adopt this approach, running your application locally for testing or debug purposes
can be difficult. Therefore, we have introduced an option on context creation to set the
`ecs-local` context to maintain application portability between local workstation and the
AWS cloud provider.
{% endcomment %}
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
{% comment %}
When you select a local simulation context, running the `docker compose up` command doesn't
deploy your application on ECS. Therefore, you must run it locally, automatically adjusting your Compose
application so it includes the [ECS local endpoints](https://github.com/awslabs/amazon-ecs-local-container-endpoints/).
This allows the AWS SDK used by application code to
access a local mock container as "AWS metadata API" and retrieve credentials from your own
local `.aws/credentials` config file.
{% endcomment %}
ローカルシミュレーションコンテキストを選んだ場合、`docker compose up`コマンドを実行しても、アプリケーションは ECS 上にデプロイされません。
したがってアプリケーションはローカルでの実行となり、Compose アプリケーションは [ECS local endpoints](https://github.com/awslabs/amazon-ecs-local-container-endpoints/) を用いるように、自動的に調整されます。
このことから、アプリケーションコード内にて利用する AWS SDK は、「AWS メタデータ API」としてローカルの一時的なコンテナーにアクセスし、ローカルの設定ファイル`.aws/credentials`から資格情報を取得することになります。
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
The Docker Compose CLI adds support for running and managing containers on ECS.
@y
{% comment %}
The Docker Compose CLI adds support for running and managing containers on ECS.
{% endcomment %}
Docker Compose CLI は、ECS 上のコンテナー実行と管理をサポートします。
@z

@x
>**Note**
>
> The Docker Compose CLI is a beta release. The installation process, commands, and flags will change in future releases.
{:.important}
@y
{% comment %}
>**Note**
>
> The Docker Compose CLI is a beta release. The installation process, commands, and flags will change in future releases.
{:.important}
{% endcomment %}
>**メモ**
>
> **Docker Compose CLI はベータ版です**。
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
[Docker 19.03 or later](https://docs.docker.com/get-docker/)
@y
{% comment %}
[Docker 19.03 or later](https://docs.docker.com/get-docker/)
{% endcomment %}
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
インストールスクリプトを使えば、新たな CLI をインストールできます。
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
## FAQ
@y
## FAQ
@z

@x
**What does the error `this tool requires the "new ARN resource ID format"` mean?**
@y
{% comment %}
**What does the error `this tool requires the "new ARN resource ID format"` mean?**
{% endcomment %}
**`this tool requires the "new ARN resource ID format"` というエラーはどんな意味？**
@z

@x
This error message means that your account requires the new ARN resource ID format for ECS. To learn more, see [Migrating your Amazon ECS deployment to the new ARN and resource ID format](https://aws.amazon.com/blogs/compute/migrating-your-amazon-ecs-deployment-to-the-new-arn-and-resource-id-format-2/){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
This error message means that your account requires the new ARN resource ID format for ECS. To learn more, see [Migrating your Amazon ECS deployment to the new ARN and resource ID format](https://aws.amazon.com/blogs/compute/migrating-your-amazon-ecs-deployment-to-the-new-arn-and-resource-id-format-2/){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
このエラーメッセージは、利用アカウントに対しては ECS 向けの新たな ARN リソース ID フォーマットが必要であることを示しています。
詳しくは [Migrating your Amazon ECS deployment to the new ARN and resource ID format](https://aws.amazon.com/blogs/compute/migrating-your-amazon-ecs-deployment-to-the-new-arn-and-resource-id-format-2/){: target="_blank" rel="noopener" class="_"} を参照してください。
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
Thank you for trying out the Docker Compose CLI beta release. Your feedback is very important to us. Let us know your feedback by creating an issue in the [Compose CLI](https://github.com/docker/compose-cli){: target="_blank" rel="noopener" class="_"} GitHub repository.
@y
{% comment %}
Thank you for trying out the Docker Compose CLI beta release. Your feedback is very important to us. Let us know your feedback by creating an issue in the [Compose CLI](https://github.com/docker/compose-cli){: target="_blank" rel="noopener" class="_"} GitHub repository.
{% endcomment %}
Docker Compose CLI を利用していただき、ありがとうございます。
みなさんからのフィードバックが大変重要です。
フィードバックをいただくには、Github レポジトリ [Compose CLI](https://github.com/docker/compose-cli){: target="_blank" rel="noopener" class="_"} に issue をあげてください。
@z
