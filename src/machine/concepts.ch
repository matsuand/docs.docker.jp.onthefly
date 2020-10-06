%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Understand concepts for Docker Machine, including drivers, base OS, IP addresses, environment variables
keywords: docker, machine, amazonec2, azure, digitalocean, google, openstack, rackspace, softlayer, virtualbox, vmwarefusion, vmwarevcloudair, vmwarevsphere, exoscale
title: Machine concepts and getting help
---
@y
---
description: Understand concepts for Docker Machine, including drivers, base OS, IP addresses, environment variables
keywords: docker, machine, amazonec2, azure, digitalocean, google, openstack, rackspace, softlayer, virtualbox, vmwarefusion, vmwarevcloudair, vmwarevsphere, exoscale
title: Machine の考え方とヘルプ
---
@z

@x
Docker Machine allows you to provision Docker machines in a variety of environments, including virtual machines that reside on your local system, on cloud providers, or on bare metal servers (physical computers). Docker Machine creates a Docker host, and you use the Docker Engine client as needed to build images and create containers on the host.
@y
{% comment %}
Docker Machine allows you to provision Docker machines in a variety of environments, including virtual machines that reside on your local system, on cloud providers, or on bare metal servers (physical computers). Docker Machine creates a Docker host, and you use the Docker Engine client as needed to build images and create containers on the host.
{% endcomment %}
Docker Machine を利用すると、数多くの環境に Docker マシンをプロビジョニングすることができます。
それはローカルシステム内にある仮想マシン、クラウドプロバイダー、ベアメタルサーバー（物理サーバー）など、さまざまです。
Docker Machine からは Docker ホストが生成されます。
そして所定の Docker Engine クライアントを使って、ホスト上でのイメージビルドやコンテナー生成を行うことができます。
@z

@x
## Drivers for creating machines
@y
{% comment %}
## Drivers for creating machines
{% endcomment %}
{: #drivers-for-creating-machines }
## マシン生成のためのドライバー
@z

@x
To create a virtual machine, you supply Docker Machine with the name of the driver you want to use. The driver determines where the virtual machine is created. For example, on a local Mac or Windows system, the driver is typically Oracle VirtualBox. For provisioning physical machines, a generic driver is provided. For cloud providers, Docker Machine supports drivers such as AWS, Microsoft Azure, DigitalOcean, and many more. The Docker Machine reference includes a complete [list of supported drivers](drivers/index.md).
@y
{% comment %}
To create a virtual machine, you supply Docker Machine with the name of the driver you want to use. The driver determines where the virtual machine is created. For example, on a local Mac or Windows system, the driver is typically Oracle VirtualBox. For provisioning physical machines, a generic driver is provided. For cloud providers, Docker Machine supports drivers such as AWS, Microsoft Azure, DigitalOcean, and many more. The Docker Machine reference includes a complete [list of supported drivers](drivers/index.md).
{% endcomment %}
仮想マシンを生成する際には、利用するドライバー名を Docker Machine に対して指示します。
このドライバー指定により仮想マシンの生成場所が決定されます。
たとえばローカルの Mac や Windows においては、通常そのドライバーは Oracle VirtualBox です。
物理マシンをプロビジョニングする場合は、汎用的なドライバーが用意されています。
クラウドプロバイダーに対しては、AWS、Microsoft Azure、DigitalOcean など多くのドライバーがサポートされています。
Docker Machine リファレンスには、[サポートドライバーの一覧](drivers/index.md) を示しています。
@z

@x
## Default base operating systems for local and cloud hosts
@y
{% comment %}
{% endcomment %}
{: #default-base-operating-systems-for-local-and-cloud-hosts }
## ローカルおよびクラウドホストにおけるデフォルトのベース OS
@z

@x
Since Docker runs on Linux, each VM that Docker Machine provisions relies on a
base operating system. For convenience, there are default base operating
systems. For the Oracle Virtual Box driver, this base operating system
is [boot2docker](https://github.com/boot2docker/boot2docker). For drivers used
to connect to cloud providers, the base operating system is Ubuntu 12.04+. You
can change this default when you create a machine. The Docker Machine reference
includes a complete [list of supported operating systems](drivers/os-base.md).
@y
{% comment %}
Since Docker runs on Linux, each VM that Docker Machine provisions relies on a
base operating system. For convenience, there are default base operating
systems. For the Oracle Virtual Box driver, this base operating system
is [boot2docker](https://github.com/boot2docker/boot2docker). For drivers used
to connect to cloud providers, the base operating system is Ubuntu 12.04+. You
can change this default when you create a machine. The Docker Machine reference
includes a complete [list of supported operating systems](drivers/os-base.md).
{% endcomment %}
Docker は Linux 上において動作するものなので、Docker Machine がプロビジョニングする VM は、ベースとなるオペレーティングシステムに依存します。
そこで利便性を考慮し、デフォルトのベースオペレーティングシステムが用意されています。
Oracle Virtual Box ドライバーに対してのベースオペレーティングシステムは [boot2docker](https://github.com/boot2docker/boot2docker) というものです。
クラウドプロバイダーへの接続に用いられるドライバーに対しては、ベースオペレーティングシステムは Ubuntu 12.04 以上としています。
このデフォルトは、マシンの生成時に変更することが可能です。
Docker Machine リファレンスには [サポートされているオペレーティングシステムの一覧](drivers/os-base.md) を示しています。
@z

@x
## IP addresses for Docker hosts
@y
{% comment %}
## IP addresses for Docker hosts
{% endcomment %}
{: #ip-addresses-for-docker-hosts }
## Docker ホストの IP アドレス
@z

@x
For each machine you create, the Docker host address is the IP address of the
Linux VM. This address is assigned by the `docker-machine create` subcommand.
You use the `docker-machine ls` command to list the machines you have created.
The `docker-machine ip <machine-name>` command returns a specific host's IP
address.
@y
{% comment %}
For each machine you create, the Docker host address is the IP address of the
Linux VM. This address is assigned by the `docker-machine create` subcommand.
You use the `docker-machine ls` command to list the machines you have created.
The `docker-machine ip <machine-name>` command returns a specific host's IP
address.
{% endcomment %}
生成したマシンにおいて Docker ホストアドレスは、Linux VM の IP アドレスになります。
このアドレスは`docker-machine create`サブコマンドによって割り当てられます。
`docker-machine ls`コマンドを使うと、生成したマシンの一覧が表示されます。
`docker-machine ip <マシン名>`コマンドを実行すると、指定したホストの IP アドレスが返されます。
@z

@x
## Configuring CLI environment variables for a Docker host
@y
{% comment %}
## Configuring CLI environment variables for a Docker host
{% endcomment %}
{: #configuring-cli-environment-variables-for-a-docker-host }
## Docker ホストに対する CLI 環境変数の設定
@z

@x
Before you can run a `docker` command on a machine, you need to configure your
command-line to point to that machine. The `docker-machine env <machine-name>`
subcommand outputs the configuration command you should use.
@y
{% comment %}
Before you can run a `docker` command on a machine, you need to configure your
command-line to point to that machine. The `docker-machine env <machine-name>`
subcommand outputs the configuration command you should use.
{% endcomment %}
マシン上において`docker`コマンドを実行するにあたっては、コマンドラインがマシンに向くような設定を行っておく必要があります。
`docker-machine env <machine-name>`サブコマンドが、利用すべき設定コマンドを出力してくれます。
@z

@x
For a complete list of `docker-machine` subcommands, see the
[Docker Machine subcommand reference](reference/help.md).
@y
{% comment %}
For a complete list of `docker-machine` subcommands, see the
[Docker Machine subcommand reference](reference/help.md).
{% endcomment %}
`docker-machine`サブコマンドの全一覧は [Docker Machine サブコマンドリファレンス](reference/help.md) を参照してください。
@z

@x
## Custom root Certificate Authority for Registry
@y
{% comment %}
## Custom root Certificate Authority for Registry
{% endcomment %}
{: #custom-root-certificate-authority-for-registry }
## レジストリ用の独自のルート認証局
@z

@x
if your registry is signed by a custom root Certificate Authority and it is
not registered with Docker Engine, you may see the following error message:
@y
{% comment %}
if your registry is signed by a custom root Certificate Authority and it is
not registered with Docker Engine, you may see the following error message:
{% endcomment %}
利用しているレジストリを独自のルート認証局によって署名している場合であって、Docker Engine にまだ登録していない場合、以下のようなエラーメッセージが出力されることになります。
@z

@x
```none
x509: certificate signed by unknown authority
```
@y
```none
x509: certificate signed by unknown authority
```
@z

@x
As discussed in the
[Docker Engine documentation](../engine/security/certificates.md#understand-the-configuration)
place the certificates in `/etc/docker/certs.d/hostname/ca.crt`
where `hostname` is your Registry server's hostname.
@y
{% comment %}
As discussed in the
[Docker Engine documentation](../engine/security/certificates.md#understand-the-configuration)
place the certificates in `/etc/docker/certs.d/hostname/ca.crt`
where `hostname` is your Registry server's hostname.
{% endcomment %}
[Docker Engine のドキュメント](../engine/security/certificates.md#understand-the-configuration) に説明しているように、証明書を`/etc/docker/certs.d/hostname/ca.crt`に配置してください。
ここで`hostname`はレジストリサーバーのホスト名です。
@z

@x
```console
docker-machine scp certfile default:ca.crt
docker-machine ssh default
sudo mv ~/ca.crt /etc/docker/certs.d/hostname/ca.crt
exit
docker-machine restart
```
@y
```console
docker-machine scp certfile default:ca.crt
docker-machine ssh default
sudo mv ~/ca.crt /etc/docker/certs.d/hostname/ca.crt
exit
docker-machine restart
```
@z

@x
## Crash reporting
@y
{% comment %}
## Crash reporting
{% endcomment %}
{: #crash-reporting }
## クラッシュレポート
@z

@x
Provisioning a host is a complex matter that can fail for a lot of reasons. Your
workstation may have a wide variety of shell, network configuration, VPN, proxy
or firewall issues. There are also reasons from the other end of the chain:
your cloud provider or the network in between.
@y
{% comment %}
Provisioning a host is a complex matter that can fail for a lot of reasons. Your
workstation may have a wide variety of shell, network configuration, VPN, proxy
or firewall issues. There are also reasons from the other end of the chain:
your cloud provider or the network in between.
{% endcomment %}
ホストのプロビジョニングは複雑な処理であるため、さまざまな理由により失敗することがあります。
作業環境にはいろいろな状況があって、シェル、ネットワーク設定、VPN、プロキシー、ファイアーウォールの問題もあります。
ネットワークでつながった反対側にも理由となるものがあります。
クラウドプロバイダーや接続先のネットワークです。
@z

@x
To help `docker-machine` be as stable as possible, we added a monitoring of
crashes whenever you try to `create` or `upgrade` a host. This sends, over
HTTPS, to Bugsnag some information about your `docker-machine` version, build,
OS, ARCH, the path to your current shell and, the history of the last command as
you could see it with a `--debug` option. This data is sent to help us pinpoint
recurring issues with `docker-machine` and is only transmitted in the case
of a crash of `docker-machine`.
@y
{% comment %}
To help `docker-machine` be as stable as possible, we added a monitoring of
crashes whenever you try to `create` or `upgrade` a host. This sends, over
HTTPS, to Bugsnag some information about your `docker-machine` version, build,
OS, ARCH, the path to your current shell and, the history of the last command as
you could see it with a `--debug` option. This data is sent to help us pinpoint
recurring issues with `docker-machine` and is only transmitted in the case
of a crash of `docker-machine`.
{% endcomment %}
`docker-machine`コマンドができるだけ安定して実行されるように、ホストの`create`や`upgrade`を行う際には、クラッシュ監視の機能が加えられています。
この機能では HTTPS を介して Bugsnag への送信を行っています。
この送信情報には`docker-machine`のバージョン、ビルド、OS、アーキテクチャー、カレントシェルへのパス、`--debug`付与時に確認できる最終コマンド履歴が含まれます。
この情報が送信されれば、`docker-machine`を使って問題再現が確実にできます。
これは`docker-machine`においてクラッシュが発生した場合にのみ送信されます。
@z

@x
To opt out of error reporting, create a `no-error-report`
file in your `$HOME/.docker/machine` directory:
@y
{% comment %}
To opt out of error reporting, create a `no-error-report`
file in your `$HOME/.docker/machine` directory:
{% endcomment %}
エラーリポートを行わないようにするには、`$HOME/.docker/machine`ディレクトリに`no-error-report`というファイルを生成します。
@z

@x
    $ mkdir -p ~/.docker/machine && touch ~/.docker/machine/no-error-report
@y
    $ mkdir -p ~/.docker/machine && touch ~/.docker/machine/no-error-report
@z

@x
The file doesn't need to have any contents.
@y
{% comment %}
The file doesn't need to have any contents.
{% endcomment %}
このファイルの内容には何も含めません。
@z

@x
## Getting help
@y
{% comment %}
{% endcomment %}
{: #getting-help }
## ヘルプサポート
@z

@x
Docker Machine is still in its infancy and under active development. If you need
help, would like to contribute, or simply want to talk about the project with
like-minded individuals, we have a number of open channels for communication.
@y
{% comment %}
Docker Machine is still in its infancy and under active development. If you need
help, would like to contribute, or simply want to talk about the project with
like-minded individuals, we have a number of open channels for communication.
{% endcomment %}
Docker Machine はまだ開発初期にあって、活発に開発を続けています。
ヘルプが必要な場合、貢献したい場合、単に目的をともにしている開発者とプロジェクトについて語りたい場合、コミュニケーションを行うオープンな場所を数多く設けています。
@z

@x
- To report bugs or file feature requests, use the
  [issue tracker on Github](https://github.com/docker/machine/issues).
- To talk about the project with people in real time,  join the
  `#docker-machine` channel on IRC.
- To contribute code or documentation changes,
  [submit a pull request on Github](https://github.com/docker/machine/pulls).
@y
{% comment %}
- To report bugs or file feature requests, use the
  [issue tracker on Github](https://github.com/docker/machine/issues).
- To talk about the project with people in real time,  join the
  `#docker-machine` channel on IRC.
- To contribute code or documentation changes,
  [submit a pull request on Github](https://github.com/docker/machine/pulls).
{% endcomment %}
- バグ報告や機能リクエストを行いたい場合は [GitHub 上の issue トラッカー](https://github.com/docker/machine/issues) を利用してください。
- リアルタイムに人々とプロジェクトについて語りたい場合は、IRC の`#docker-machine`チャネルに参加してください。
- コードやドキュメント変更に関する貢献を行う場合は、[GitHub 上からプルリクエストを送信](https://github.com/docker/machine/pulls) してください。
@z

@x
For more information and resources, visit
[our help page](../opensource/ways.md).
@y
{% comment %}
For more information and resources, visit
[our help page](../opensource/ways.md).
{% endcomment %}
詳細な情報やリソースに関しては [ヘルプページ](../opensource/ways.md) を参照してください。
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
- Create and run a Docker host on your [local system using VirtualBox](get-started.md)
- Provision multiple Docker hosts [on your cloud provider](get-started-cloud.md)
- [Docker Machine driver reference](drivers/index.md){: target="_blank" class="_"}
- [Docker Machine subcommand reference](reference/help.md){: target="_blank" class="_"}
@y
{% comment %}
- Create and run a Docker host on your [local system using VirtualBox](get-started.md)
- Provision multiple Docker hosts [on your cloud provider](get-started-cloud.md)
- [Docker Machine driver reference](drivers/index.md){: target="_blank" class="_"}
- [Docker Machine subcommand reference](reference/help.md){: target="_blank" class="_"}
{% endcomment %}
- [VirtualBox 利用によるローカルシステム](get-started.md) に Docker ホストを生成して実行します。
- [クラウドプロバイダー](get-started-cloud.md) 上に複数の Docker ホストをプロビジョニングします。
- [Docker Machine ドライバーリファレンス](drivers/index.md){: target="_blank" class="_"}
- [Docker Machine サブコマンドリファレンス](reference/help.md){: target="_blank" class="_"}
@z
