%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Using Docker Machine to provision hosts on cloud providers
keywords: docker, machine, amazonec2, azure, digitalocean, google, openstack, rackspace, softlayer, virtualbox, vmwarefusion, vmwarevcloudair, vmwarevsphere, exoscale
title: Use Docker Machine to provision hosts on cloud providers
hide_from_sitemap: true
---
@y
---
description: Using Docker Machine to provision hosts on cloud providers
keywords: docker, machine, amazonec2, azure, digitalocean, google, openstack, rackspace, softlayer, virtualbox, vmwarefusion, vmwarevcloudair, vmwarevsphere, exoscale
title: Docker Machine を使ったクラウドプロバイダーへのプロビジョニング
hide_from_sitemap: true
---
@z

@x
Docker Machine driver plugins are available for many cloud platforms, so you can
use Machine to provision cloud hosts. When you use Docker Machine for
provisioning, you create cloud hosts with Docker Engine installed on them.
@y
{% comment %}
Docker Machine driver plugins are available for many cloud platforms, so you can
use Machine to provision cloud hosts. When you use Docker Machine for
provisioning, you create cloud hosts with Docker Engine installed on them.
{% endcomment %}
クラウドプラットフォームに対応する Docker Machine ドライバープラグインが数多くあります。
このため Docker Machine を使ってクラウドホストへのプロビジョニングを行うことが可能です。
プロビジョニングに Docker Machine を利用すると、クラウドホスト上に Docker Engine をインストールしてホスト構築を行うことができます。
@z

@x
Install and run Docker Machine, and create an account with the
cloud provider.
@y
{% comment %}
Install and run Docker Machine, and create an account with the
cloud provider.
{% endcomment %}
Docker Machine のインストールと起動を行って、クラウドプロバイダー上にアカウントを生成してください。
@z

@x
Then you provide account verification, security credentials, and configuration
options for the providers as flags to `docker-machine create`. The flags are
unique for each cloud-specific driver. For instance, to pass a DigitalOcean
access token you use the `--digitalocean-access-token` flag. Take a look at the
examples below for DigitalOcean and AWS.
@y
{% comment %}
Then you provide account verification, security credentials, and configuration
options for the providers as flags to `docker-machine create`. The flags are
unique for each cloud-specific driver. For instance, to pass a DigitalOcean
access token you use the `--digitalocean-access-token` flag. Take a look at the
examples below for DigitalOcean and AWS.
{% endcomment %}
これによりアカウント検証、セキュリティ資格情報、などプロバイダーに対する設定オプションを`docker-machine create`のフラグとして指定します。
たとえば DigitalOcean 用のアクセストークンを指定するには`--digitalocean-access-token`フラグを用います。
以下の DigitalOcean と AWS に関する例を確認してください。
@z

@x
## Examples
@y
{% comment %}
## Examples
{% endcomment %}
{: #examples }
## 利用例
@z

@x
### DigitalOcean
@y
### DigitalOcean
@z

@x
For DigitalOcean, this command creates a Droplet (cloud host) called
"docker-sandbox".
@y
{% comment %}
For DigitalOcean, this command creates a Droplet (cloud host) called
"docker-sandbox".
{% endcomment %}
DigitalOcean に対して、以下のコマンドにより「docker-sandbox」と呼ばれるドロップレット（クラウドホスト）が生成されます。
@z

@x
```shell
$ docker-machine create --driver digitalocean --digitalocean-access-token xxxxx docker-sandbox
```
@y
```shell
$ docker-machine create --driver digitalocean --digitalocean-access-token xxxxx docker-sandbox
```
@z

@x
For a step-by-step guide on using Machine to create Docker hosts on Digital
Ocean, see the [DigitalOcean Example](examples/ocean.md).
@y
{% comment %}
For a step-by-step guide on using Machine to create Docker hosts on Digital
Ocean, see the [DigitalOcean Example](examples/ocean.md).
{% endcomment %}
Machine を利用し Digital Ocean に対して Docker ホストを生成するガイドが [DigitalOcean 利用例](examples/ocean.md) にあるので参照してください。
@z

@x
### Amazon Web Services (AWS)
@y
{% comment %}
### Amazon Web Services (AWS)
{% endcomment %}
{: #amazon-web-services-aws }
### Amazon ウェブサービス (Amazon Web Services; AWS)
@z

@x
For AWS EC2, this command creates an instance called "aws-sandbox":
@y
{% comment %}
For AWS EC2, this command creates an instance called "aws-sandbox":
{% endcomment %}
AWS EC2 に対しては、以下のコマンドにより「aws-sandbox」と呼ばれるインスタンスが生成されます。
@z

@x
```shell
$ docker-machine create --driver amazonec2 --amazonec2-access-key AKI******* --amazonec2-secret-key 8T93C*******  aws-sandbox
```
@y
```shell
$ docker-machine create --driver amazonec2 --amazonec2-access-key AKI******* --amazonec2-secret-key 8T93C*******  aws-sandbox
```
@z

@x
For a step-by-step guide on using Machine to create Dockerized AWS instances,
see the [Amazon Web Services (AWS) example](examples/aws.md).
@y
{% comment %}
For a step-by-step guide on using Machine to create Dockerized AWS instances,
see the [Amazon Web Services (AWS) example](examples/aws.md).
{% endcomment %}
Machine を利用し Docker 化した AWS インスタンス に対して Docker ホストを生成するガイドが [Amazon ウェブサービス (AWS) 利用例](examples/aws.md) にあるので参照してください。
@z

@x
## The docker-machine create command
@y
{% comment %}
## The docker-machine create command
{% endcomment %}
{: #the-docker-machine-create-command }
## docker-machine create コマンド
@z

@x
The `docker-machine create` command typically requires that you specify, at a
minimum:
@y
{% comment %}
The `docker-machine create` command typically requires that you specify, at a
minimum:
{% endcomment %}
`docker-machine create`コマンドは通常、以下に示すような指定が最低でも必要です。
@z

@x
* `--driver` - to indicate the provider on which to create the
machine (VirtualBox, DigitalOcean, AWS, and so on)
@y
{% comment %}
* `--driver` - to indicate the provider on which to create the
machine (VirtualBox, DigitalOcean, AWS, and so on)
{% endcomment %}
* `--driver` - マシンを生成するためのプロバイダーを指定します。
  （VirtualBox、DigitalOcean、AWS など）
@z

@x
* Account verification and security credentials (for cloud providers),
specific to the cloud service you are using
@y
{% comment %}
* Account verification and security credentials (for cloud providers),
specific to the cloud service you are using
{% endcomment %}
* （クラウドプロバイダーに対して必要となる）アカウント検証やセキュリティ資格情報を指定します。
  これは利用しているクラウドサービスに固有のものです。
@z

@x
* `<machine>` - name of the host you want to create
@y
{% comment %}
* `<machine>` - name of the host you want to create
{% endcomment %}
* `<マシン名>` - 生成しようとするホスト名を指定します。
@z

@x
For convenience, `docker-machine` uses sensible defaults for choosing
settings such as the image that the server is based on, but you override the
defaults using the respective flags, such as `--digitalocean-image`. This is
useful if, for example, you want to create a cloud server with a lot of memory
and CPUs, rather than the default behavior of creating smaller servers.
@y
{% comment %}
For convenience, `docker-machine` uses sensible defaults for choosing
settings such as the image that the server is based on, but you override the
defaults using the respective flags, such as `--digitalocean-image`. This is
useful if, for example, you want to create a cloud server with a lot of memory
and CPUs, rather than the default behavior of creating smaller servers.
{% endcomment %}
利用しやすさを考慮して、`docker-machine`コマンドには、適切なデフォルト値が用意されています。
たとえばサーバーが基づくイメージをどれにするかといった設定です。
こういったデフォルト値は、たとえば`--digitalocean-image`などを使ってオーバーライドすることができます。
これは、手軽なサーバー生成を行ってデフォルト動作を行う場合と違って、クラウドサーバー上でメモリや CPU をふんだんに利用するような場合に便利です。
@z

@x
For a full list of the flags/settings available and their defaults, see the
output of `docker-machine create -h` at the command line, the
[create](reference/create.md){: target="_blank" class="_" } command in
the Machine [command line reference](reference/index.md){:
target="_blank" class="_" }, and [driver options and operating system defaults](drivers/os-base.md){: target="_blank" class="_" }
in the Machine driver reference.
@y
{% comment %}
For a full list of the flags/settings available and their defaults, see the
output of `docker-machine create -h` at the command line, the
[create](reference/create.md){: target="_blank" class="_" } command in
the Machine [command line reference](reference/index.md){:
target="_blank" class="_" }, and [driver options and operating system defaults](drivers/os-base.md){: target="_blank" class="_" }
in the Machine driver reference.
{% endcomment %}
利用可能なフラグや設定およびそのデフォルトについては、コマンドラインから`docker-machine create -h`を実行して得られる出力結果に一覧表示されます。
また Machine の [コマンドラインリファレンス](reference/index.md){:target="_blank" class="_" } における [create](reference/create.md){: target="_blank" class="_" } コマンドや、Machine ドライバーリファレンス内の [ドライバーオプションと OS デフォルト](drivers/os-base.md){: target="_blank" class="_" } からも確認することができます。
@z

@x
## Drivers for cloud providers
@y
{% comment %}
## Drivers for cloud providers
{% endcomment %}
{: #drivers-for-cloud-providers }
## クラウドプロバイダー用ドライバー
@z

@x
When you install Docker Machine, you get a set of drivers for various cloud
providers (like Amazon Web Services, DigitalOcean, or Microsoft Azure) and
local providers (like Oracle VirtualBox, VMWare Fusion, or Microsoft Hyper-V).
@y
{% comment %}
When you install Docker Machine, you get a set of drivers for various cloud
providers (like Amazon Web Services, DigitalOcean, or Microsoft Azure) and
local providers (like Oracle VirtualBox, VMWare Fusion, or Microsoft Hyper-V).
{% endcomment %}
Docker Machine をインストールすると、数々のクラウドプロバイダー（Amazon Web Services、DigitalOcean、Microsoft Azure）用や、ローカルプロバイダー（Oracle VirtualBox、VMWare Fusion、Microsoft Hyper-V）用のドライバーが同時にインストールされます。
@z

@x
See [Docker Machine driver reference](drivers/index.md){:target="_blank" class="_"}
for details on the drivers, including required flags and configuration options
(which vary by provider).
@y
{% comment %}
See [Docker Machine driver reference](drivers/index.md){:target="_blank" class="_"}
for details on the drivers, including required flags and configuration options
(which vary by provider).
{% endcomment %}
各ドライバーの詳細は [Docker Machine ドライバーリファレンス](drivers/index.md){:target="_blank" class="_"} を参照してください。
そこには必要となるフラグや設定オプションについて説明されています。
（これはプロバイダーによって異なります。）
@z

@x
## 3rd-party driver plugins
@y
{% comment %}
## 3rd-party driver plugins
{% endcomment %}
{: #3rd-party-driver-plugins }
## サードパーティ製のドライバープラグイン
@z

@x
Several Docker Machine driver plugins for use with other cloud platforms are
available from 3rd party contributors. These are use-at-your-own-risk plugins,
not maintained by or formally associated with Docker.
@y
{% comment %}
Several Docker Machine driver plugins for use with other cloud platforms are
available from 3rd party contributors. These are use-at-your-own-risk plugins,
not maintained by or formally associated with Docker.
{% endcomment %}
その他のクラウドプラットフォーム用として、Docker Machine ドライバープラグインがサードパーティーから提供されています。
これは利用者の自己責任により利用するプラグインであり、Docker が開発するものでなく、また Docker に公式に連携するものではありません。
@z

@x
See [Available driver plugins](https://github.com/docker/docker.github.io/blob/master/machine/AVAILABLE_DRIVER_PLUGINS.md){:target="_blank" class="_"}.
@y
{% comment %}
See [Available driver plugins](https://github.com/docker/docker.github.io/blob/master/machine/AVAILABLE_DRIVER_PLUGINS.md){:target="_blank" class="_"}.
{% endcomment %}
[利用可能なドライバープラグイン](https://github.com/docker/docker.github.io/blob/master/machine/AVAILABLE_DRIVER_PLUGINS.md){:target="_blank" class="_"} を参照してください。
@z

@x
## Add a host without a driver
@y
{% comment %}
## Add a host without a driver
{% endcomment %}
{: #add-a-host-without-a-driver }
## ドライバー指定のないホスト追加
@z

@x
You can register an already existing docker host by passing the daemon url. With that, you can have the same workflow as on a host provisioned by docker-machine.
@y
{% comment %}
You can register an already existing docker host by passing the daemon url. With that, you can have the same workflow as on a host provisioned by docker-machine.
{% endcomment %}
既存の Docker ホストは、デーモン URL を指定することで登録することができます。
これを利用すれば、同じ操作を docker-machine によってプロビジョニングされたホストに対しても適用することができます。
@z

@x
    $ docker-machine create --driver none --url=tcp://50.134.234.20:2376 custombox
    $ docker-machine ls
    NAME        ACTIVE   DRIVER    STATE     URL
    custombox   *        none      Running   tcp://50.134.234.20:2376
@y
    $ docker-machine create --driver none --url=tcp://50.134.234.20:2376 custombox
    $ docker-machine ls
    NAME        ACTIVE   DRIVER    STATE     URL
    custombox   *        none      Running   tcp://50.134.234.20:2376
@z

@x
## Use Machine to provision Docker Swarm clusters
@y
{% comment %}
## Use Machine to provision Docker Swarm clusters
{% endcomment %}
{: #use-machine-to-provision-docker-swarm-clusters }
## Machine を使った Docker Swarm クラスターのプロビジョニング
@z

@x
> Swarm mode supersedes Docker Machine provisioning of swarm clusters
>
> In previous releases, Docker Machine was used to provision swarm
> clusters, but this is legacy. [Swarm mode](../engine/swarm/index.md), built
> into Docker Engine, supersedes Machine provisioning of swarm clusters. The
> topics below show you how to get started with the new swarm mode.
{: .important}
@y
{% comment %}
> Swarm mode supersedes Docker Machine provisioning of swarm clusters
>
> In previous releases, Docker Machine was used to provision swarm
> clusters, but this is legacy. [Swarm mode](../engine/swarm/index.md), built
> into Docker Engine, supersedes Machine provisioning of swarm clusters. The
> topics below show you how to get started with the new swarm mode.
{: .important}
{% endcomment %}
> Swarm mode supersedes Docker Machine provisioning of swarm clusters
>
> これまでのリリースにおいて Docker Machine は Swarm クラスターをプロビジョニングしていました。
> これは今では古いものになっています。
> Docker Engine においてビルドされている [Swarm モード](../engine/swarm/index.md) が、それまでの Machine の Swarm クラスタープロビジョニングに取って代わりました。
> これ以降の説明においては、この新たな Swarm モードのはじめ方について説明しています。
{: .important}
@z

@x
You can use Docker Machine to create local virtual hosts on which to deploy
and test [swarm mode](../engine/swarm/index.md) clusters.
@y
{% comment %}
You can use Docker Machine to create local virtual hosts on which to deploy
and test [swarm mode](../engine/swarm/index.md) clusters.
{% endcomment %}
Docker Machine を使うと、ローカルに仮想ホストを生成することができます。
そのホスト上において、[Swarm モード](../engine/swarm/index.md) をデプロイしてテストすることができます。
@z

@x
Good places to start working with Docker Machine and swarm mode are these
tutorials:
@y
{% comment %}
Good places to start working with Docker Machine and swarm mode are these
tutorials:
{% endcomment %}
Docker Machine において Swarm モードを使い始めるには、以下のようなわかりやすいドキュメントがあります。
@z

@x
* [Get started with Docker](../get-started/index.md)
@y
{% comment %}
* [Get started with Docker](../get-started/index.md)
{% endcomment %}
* [Docker をはじめよう](../get-started/index.md)
@z

@x
* [Getting started with swarm mode](../engine/swarm/swarm-tutorial/index.md)
@y
{% comment %}
* [Getting started with swarm mode](../engine/swarm/swarm-tutorial/index.md)
{% endcomment %}
* [Swarm モードをはじめよう](../engine/swarm/swarm-tutorial/index.md)
@z

@x
## Where to go next
@y
{% comment %}
## Where to go next
{% endcomment %}
{: #where-to-go-next }
## 次に読むものは
@z

@x
-   Example: Provision Dockerized [DigitalOcean Droplets](examples/ocean.md)
-   Example: Provision Dockerized [AWS EC2 Instances](examples/aws.md)
-   [Understand Machine concepts](concepts.md)
-   [Docker Machine driver reference](drivers/index.md)
-   [Docker Machine subcommand reference](reference/index.md)
@y
{% comment %}
-   Example: Provision Dockerized [DigitalOcean Droplets](examples/ocean.md)
-   Example: Provision Dockerized [AWS EC2 Instances](examples/aws.md)
-   [Understand Machine concepts](concepts.md)
-   [Docker Machine driver reference](drivers/index.md)
-   [Docker Machine subcommand reference](reference/index.md)
{% endcomment %}
-   利用例: Docker 化した [DigitalOcean ドロップレット](examples/ocean.md) のプロビジョニング。
-   利用例: Docker 化した [AWS EC2 Instances](examples/aws.md) のプロビジョニング。
-   [Machine の考え方](concepts.md)
-   [Docker Machine ドライバーリファレンス](drivers/index.md)
-   [Docker Machine サブコマンドリファレンス](reference/index.md)
@z
