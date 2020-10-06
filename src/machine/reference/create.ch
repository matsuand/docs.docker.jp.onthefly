%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Create a machine.
keywords: machine, create, subcommand
title: docker-machine create
---
@y
---
description: Create a machine.
keywords: machine, create, subcommand
title: docker-machine create
---
@z

@x
Create a machine.  Requires the `--driver` flag to indicate which provider
(VirtualBox, DigitalOcean, AWS, etc.) the machine should be created on, and an
argument to indicate the name of the created machine.
@y
{% comment %}
Create a machine.  Requires the `--driver` flag to indicate which provider
(VirtualBox, DigitalOcean, AWS, etc.) the machine should be created on, and an
argument to indicate the name of the created machine.
{% endcomment %}
マシン（machine）を生成します。
このマシンをどのプロバイダー（VirtualBox、DigitalOcean、AWS など）のもとに生成するのかを、`--driver` フラグを使って指定する必要があります。
1 つだけ指定される引数は、生成されるマシン名を表わします。
@z

@x
> Looking for the full list of available drivers?
>
>For a full list of drivers that work with `docker-machine create` and
information on how to use them, see [Machine drivers](../drivers/index.md).
{: .important}
@y
{% comment %}
> Looking for the full list of available drivers?
>
>For a full list of drivers that work with `docker-machine create` and
information on how to use them, see [Machine drivers](../drivers/index.md).
{: .important}
{% endcomment %}
> 利用可能なドライバーの一覧を探していますか？
>
> `docker-machine create` において指定可能なドライバーの全一覧およびその利用法については、[マシンドライバー](../drivers/index.md) を参照してください。
{: .important}
@z

@x
## Example
@y
{% comment %}
## Example
{% endcomment %}
{: #example }
## 利用例
@z

@x
Here is an example of using the `--virtualbox` driver to create a machine called `dev`.
@y
{% comment %}
Here is an example of using the `--virtualbox` driver to create a machine called `dev`.
{% endcomment %}
以下の例は `--driver virtualbox` を用いて `dev` という名前のマシンを生成するものです。
@z

@x
```bash
$ docker-machine create --driver virtualbox dev
@y
```bash
$ docker-machine create --driver virtualbox dev
@z

@x
Creating CA: /home/username/.docker/machine/certs/ca.pem
Creating client certificate: /home/username/.docker/machine/certs/cert.pem
Image cache does not exist, creating it at /home/username/.docker/machine/cache...
No default boot2docker iso found locally, downloading the latest release...
Downloading https://github.com/boot2docker/boot2docker/releases/download/v1.6.2/boot2docker.iso to /home/username/.docker/machine/cache/boot2docker.iso...
Creating VirtualBox VM...
Creating SSH key...
Starting VirtualBox VM...
Starting VM...
To see how to connect Docker to this machine, run: docker-machine env dev
```
@y
Creating CA: /home/username/.docker/machine/certs/ca.pem
Creating client certificate: /home/username/.docker/machine/certs/cert.pem
Image cache does not exist, creating it at /home/username/.docker/machine/cache...
No default boot2docker iso found locally, downloading the latest release...
Downloading https://github.com/boot2docker/boot2docker/releases/download/v1.6.2/boot2docker.iso to /home/username/.docker/machine/cache/boot2docker.iso...
Creating VirtualBox VM...
Creating SSH key...
Starting VirtualBox VM...
Starting VM...
To see how to connect Docker to this machine, run: docker-machine env dev
```
@z

@x
## Accessing driver-specific flags in the help text
@y
{% comment %}
## Accessing driver-specific flags in the help text
{% endcomment %}
{: #accessing-driver-specific-flags-in-the-help-text }
## ドライバー固有フラグのヘルプ表示
@z

@x
The `docker-machine create` command has some flags which apply to all
drivers.  These largely control aspects of Machine's provisioning process
(including the creation of Docker Swarm containers) that the user may wish to
customize.
@y
{% comment %}
The `docker-machine create` command has some flags which apply to all
drivers.  These largely control aspects of Machine's provisioning process
(including the creation of Docker Swarm containers) that the user may wish to
customize.
{% endcomment %}
`docker-machine create` コマンドのフラグの中には、全ドライバーに共通して適用されるものがあります。
そのフラグは Docker Machine のプロビジョニング処理関連を、幅広く制御するものです。
（そこには Swarm コンテナーの生成も含みます。）
そういった機能は、カスタマイズ指定を行いたくなる部分です。
@z

@x
```bash
$ docker-machine create

Docker Machine Version: 0.5.0 (45e3688)
Usage: docker-machine create [OPTIONS] [arg...]

Create a machine.

Run 'docker-machine create --driver name' to include the create flags for that driver in the help text.

Options:

   --driver, -d "none"                                                                                  Driver to create machine with.
   --engine-install-url "https://get.docker.com"                                                        Custom URL to use for engine installation [$MACHINE_DOCKER_INSTALL_URL]
   --engine-opt [--engine-opt option --engine-opt option]                                               Specify arbitrary flags to include with the created engine in the form flag=value
   --engine-insecure-registry [--engine-insecure-registry option --engine-insecure-registry option]     Specify insecure registries to allow with the created engine
   --engine-registry-mirror [--engine-registry-mirror option --engine-registry-mirror option]           Specify registry mirrors to use [$ENGINE_REGISTRY_MIRROR]
   --engine-label [--engine-label option --engine-label option]                                         Specify labels for the created engine
   --engine-storage-driver                                                                              Specify a storage driver to use with the engine
   --engine-env [--engine-env option --engine-env option]                                               Specify environment variables to set in the engine
   --swarm                                                                                              Configure Machine with Swarm
   --swarm-image "swarm:latest"                                                                         Specify Docker image to use for Swarm [$MACHINE_SWARM_IMAGE]
   --swarm-master                                                                                       Configure Machine to be a Swarm master
   --swarm-discovery                                                                                    Discovery service to use with Swarm
   --swarm-strategy "spread"                                                                            Define a default scheduling strategy for Swarm
   --swarm-opt [--swarm-opt option --swarm-opt option]                                                  Define arbitrary flags for swarm
   --swarm-host "tcp://0.0.0.0:3376"                                                                    ip/socket to listen on for Swarm master
   --swarm-addr                                                                                         addr to advertise for Swarm (default: detect and use the machine IP)
   --swarm-experimental                                                                                 Enable Swarm experimental features
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```bash
$ docker-machine create

Docker Machine Version: 0.5.0 (45e3688)
Usage: docker-machine create [OPTIONS] [arg...]

Create a machine.

Run 'docker-machine create --driver name' to include the create flags for that driver in the help text.

Options:

   --driver, -d "none"                                                                                  Driver to create machine with.
   --engine-install-url "https://get.docker.com"                                                        Custom URL to use for engine installation [$MACHINE_DOCKER_INSTALL_URL]
   --engine-opt [--engine-opt option --engine-opt option]                                               Specify arbitrary flags to include with the created engine in the form flag=value
   --engine-insecure-registry [--engine-insecure-registry option --engine-insecure-registry option]     Specify insecure registries to allow with the created engine
   --engine-registry-mirror [--engine-registry-mirror option --engine-registry-mirror option]           Specify registry mirrors to use [$ENGINE_REGISTRY_MIRROR]
   --engine-label [--engine-label option --engine-label option]                                         Specify labels for the created engine
   --engine-storage-driver                                                                              Specify a storage driver to use with the engine
   --engine-env [--engine-env option --engine-env option]                                               Specify environment variables to set in the engine
   --swarm                                                                                              Configure Machine with Swarm
   --swarm-image "swarm:latest"                                                                         Specify Docker image to use for Swarm [$MACHINE_SWARM_IMAGE]
   --swarm-master                                                                                       Configure Machine to be a Swarm master
   --swarm-discovery                                                                                    Discovery service to use with Swarm
   --swarm-strategy "spread"                                                                            Define a default scheduling strategy for Swarm
   --swarm-opt [--swarm-opt option --swarm-opt option]                                                  Define arbitrary flags for swarm
   --swarm-host "tcp://0.0.0.0:3376"                                                                    ip/socket to listen on for Swarm master
   --swarm-addr                                                                                         addr to advertise for Swarm (default: detect and use the machine IP)
   --swarm-experimental                                                                                 Enable Swarm experimental features
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
$ docker-machine create

Docker Machine Version: 0.5.0 (45e3688)
利用方法: docker-machine create [オプション] [arg...]

マシンを生成します。

'docker-machine create --driver ドライバー名' の実行により、そのドライバーの create フラグをヘルプ表示に含めます。

オプション:

   --driver, -d "none"                                                                                  マシン生成に用いるドライバー。
   --engine-install-url "https://get.docker.com"                                                        エンジンインストールにカスタム URL を指定します。[$MACHINE_DOCKER_INSTALL_URL]
   --engine-opt [--engine-opt option --engine-opt option]                                               生成済み Engine に対して フラグ=値 の形式で任意のフラグを含めて指定します。
   --engine-insecure-registry [--engine-insecure-registry option --engine-insecure-registry option]     生成済み Engine において安全でない Registry の利用を可能にします。
   --engine-registry-mirror [--engine-registry-mirror option --engine-registry-mirror option]           利用する Registry ミラーを設定します。[$ENGINE_REGISTRY_MIRROR]
   --engine-label [--engine-label option --engine-label option]                                         生成済み Engine に対してラベルを設定します。
   --engine-storage-driver                                                                              Engine において利用するストレージドライバーを指定します。
   --engine-env [--engine-env option --engine-env option]                                               Engine に対して設定する環境変数を指定します。
   --swarm                                                                                              Docker Machine において Swarm を設定します。
   --swarm-image "swarm:latest"                                                                         Swarm において用いる Docker イメージを指定します。[$MACHINE_SWARM_IMAGE]
   --swarm-master                                                                                       Docker Machine を Swarm マスターとして設定します。
   --swarm-discovery                                                                                    Swarm において利用するディスカバリーサービス。
   --swarm-strategy "spread"                                                                            Swarm におけるデフォルトのスケジューリングストラテジーを定義します。
   --swarm-opt [--swarm-opt option --swarm-opt option]                                                  Swarm に対して任意のフラグを定義します。
   --swarm-host "tcp://0.0.0.0:3376"                                                                    Swarm マスターにおいて待ち受ける IP/ソケット。
   --swarm-addr                                                                                         Swarm におけるアドバタイズアドレス。(デフォルト： マシンIPを検出して利用)
   --swarm-experimental                                                                                 Swarm の試験的機能を有効にします。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Additionally, drivers can specify flags that Machine can accept as part of their
plugin code.  These allow users to customize the provider-specific parameters of
the created machine, such as size (`--amazonec2-instance-type m1.medium`),
geographical region (`--amazonec2-region us-west-1`), and so on.
@y
{% comment %}
Additionally, drivers can specify flags that Machine can accept as part of their
plugin code.  These allow users to customize the provider-specific parameters of
the created machine, such as size (`--amazonec2-instance-type m1.medium`),
geographical region (`--amazonec2-region us-west-1`), and so on.
{% endcomment %}
上に加えて、Docker Machine がプラグインコードの一部として受け付けるフラグを指定できます。
生成したマシンに対して、プロバイダー固有のパラメーターをカスタマイズできるものです。
たとえばサイズ変更（`--amazonec2-instance-type m1.medium`）やリージョン指定（`--amazonec2-region us-west-1`）などです。
@z

@x
To see the provider-specific flags, simply pass a value for `--driver` when
invoking the `create` help text.
@y
{% comment %}
To see the provider-specific flags, simply pass a value for `--driver` when
invoking the `create` help text.
{% endcomment %}
プロバイダー固有のフラグを確認するには、`create` のヘルプを表示する際に、単に `--driver` にドライバーを指定するだけです。
@z

@x
```bash
$ docker-machine create --driver virtualbox --help
Usage: docker-machine create [OPTIONS] [arg...]

Create a machine.

Run 'docker-machine create --driver name' to include the create flags for that driver in the help text.

Options:

   --driver, -d "none"                                                                                  Driver to create machine with.
   --engine-env [--engine-env option --engine-env option]                                               Specify environment variables to set in the engine
   --engine-insecure-registry [--engine-insecure-registry option --engine-insecure-registry option]     Specify insecure registries to allow with the created engine
   --engine-install-url "https://get.docker.com"                                                        Custom URL to use for engine installation [$MACHINE_DOCKER_INSTALL_URL]
   --engine-label [--engine-label option --engine-label option]                                         Specify labels for the created engine
   --engine-opt [--engine-opt option --engine-opt option]                                               Specify arbitrary flags to include with the created engine in the form flag=value
   --engine-registry-mirror [--engine-registry-mirror option --engine-registry-mirror option]           Specify registry mirrors to use [$ENGINE_REGISTRY_MIRROR]
   --engine-storage-driver                                                                              Specify a storage driver to use with the engine
   --swarm                                                                                              Configure Machine with Swarm
   --swarm-addr                                                                                         addr to advertise for Swarm (default: detect and use the machine IP)
   --swarm-discovery                                                                                    Discovery service to use with Swarm
   --swarm-experimental                                                                                 Enable Swarm experimental features
   --swarm-host "tcp://0.0.0.0:3376"                                                                    ip/socket to listen on for Swarm master
   --swarm-image "swarm:latest"                                                                         Specify Docker image to use for Swarm [$MACHINE_SWARM_IMAGE]
   --swarm-master                                                                                       Configure Machine to be a Swarm master
   --swarm-opt [--swarm-opt option --swarm-opt option]                                                  Define arbitrary flags for swarm
   --swarm-strategy "spread"                                                                            Define a default scheduling strategy for Swarm
   --virtualbox-boot2docker-url                                                                         The URL of the boot2docker image. Defaults to the latest available version [$VIRTUALBOX_BOOT2DOCKER_URL]
   --virtualbox-cpu-count "1"                                                                           number of CPUs for the machine (-1 to use the number of CPUs available) [$VIRTUALBOX_CPU_COUNT]
   --virtualbox-disk-size "20000"                                                                       Size of disk for host in MB [$VIRTUALBOX_DISK_SIZE]
   --virtualbox-host-dns-resolver                                                                       Use the host DNS resolver [$VIRTUALBOX_HOST_DNS_RESOLVER]
   --virtualbox-dns-proxy                                                                               Proxy all DNS requests to the host [$VIRTUALBOX_DNS_PROXY]
   --virtualbox-hostonly-cidr "192.168.99.1/24"                                                         Specify the Host Only CIDR [$VIRTUALBOX_HOSTONLY_CIDR]
   --virtualbox-hostonly-nicpromisc "deny"                                                              Specify the Host Only Network Adapter Promiscuous Mode [$VIRTUALBOX_HOSTONLY_NIC_PROMISC]
   --virtualbox-hostonly-nictype "82540EM"                                                              Specify the Host Only Network Adapter Type [$VIRTUALBOX_HOSTONLY_NIC_TYPE]
   --virtualbox-import-boot2docker-vm                                                                   The name of a Boot2Docker VM to import
   --virtualbox-memory "1024"                                                                           Size of memory for host in MB [$VIRTUALBOX_MEMORY_SIZE]
   --virtualbox-no-share                                                                                Disable the mount of your home directory
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin2">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese2">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin2" class="tab-pane fade in active">
{% capture original-content %}
```bash
$ docker-machine create --driver virtualbox --help
Usage: docker-machine create [OPTIONS] [arg...]

Create a machine.

Run 'docker-machine create --driver name' to include the create flags for that driver in the help text.

Options:

   --driver, -d "none"                                                                                  Driver to create machine with.
   --engine-env [--engine-env option --engine-env option]                                               Specify environment variables to set in the engine
   --engine-insecure-registry [--engine-insecure-registry option --engine-insecure-registry option]     Specify insecure registries to allow with the created engine
   --engine-install-url "https://get.docker.com"                                                        Custom URL to use for engine installation [$MACHINE_DOCKER_INSTALL_URL]
   --engine-label [--engine-label option --engine-label option]                                         Specify labels for the created engine
   --engine-opt [--engine-opt option --engine-opt option]                                               Specify arbitrary flags to include with the created engine in the form flag=value
   --engine-registry-mirror [--engine-registry-mirror option --engine-registry-mirror option]           Specify registry mirrors to use [$ENGINE_REGISTRY_MIRROR]
   --engine-storage-driver                                                                              Specify a storage driver to use with the engine
   --swarm                                                                                              Configure Machine with Swarm
   --swarm-addr                                                                                         addr to advertise for Swarm (default: detect and use the machine IP)
   --swarm-discovery                                                                                    Discovery service to use with Swarm
   --swarm-experimental                                                                                 Enable Swarm experimental features
   --swarm-host "tcp://0.0.0.0:3376"                                                                    ip/socket to listen on for Swarm master
   --swarm-image "swarm:latest"                                                                         Specify Docker image to use for Swarm [$MACHINE_SWARM_IMAGE]
   --swarm-master                                                                                       Configure Machine to be a Swarm master
   --swarm-opt [--swarm-opt option --swarm-opt option]                                                  Define arbitrary flags for swarm
   --swarm-strategy "spread"                                                                            Define a default scheduling strategy for Swarm
   --virtualbox-boot2docker-url                                                                         The URL of the boot2docker image. Defaults to the latest available version [$VIRTUALBOX_BOOT2DOCKER_URL]
   --virtualbox-cpu-count "1"                                                                           number of CPUs for the machine (-1 to use the number of CPUs available) [$VIRTUALBOX_CPU_COUNT]
   --virtualbox-disk-size "20000"                                                                       Size of disk for host in MB [$VIRTUALBOX_DISK_SIZE]
   --virtualbox-host-dns-resolver                                                                       Use the host DNS resolver [$VIRTUALBOX_HOST_DNS_RESOLVER]
   --virtualbox-dns-proxy                                                                               Proxy all DNS requests to the host [$VIRTUALBOX_DNS_PROXY]
   --virtualbox-hostonly-cidr "192.168.99.1/24"                                                         Specify the Host Only CIDR [$VIRTUALBOX_HOSTONLY_CIDR]
   --virtualbox-hostonly-nicpromisc "deny"                                                              Specify the Host Only Network Adapter Promiscuous Mode [$VIRTUALBOX_HOSTONLY_NIC_PROMISC]
   --virtualbox-hostonly-nictype "82540EM"                                                              Specify the Host Only Network Adapter Type [$VIRTUALBOX_HOSTONLY_NIC_TYPE]
   --virtualbox-import-boot2docker-vm                                                                   The name of a Boot2Docker VM to import
   --virtualbox-memory "1024"                                                                           Size of memory for host in MB [$VIRTUALBOX_MEMORY_SIZE]
   --virtualbox-no-share                                                                                Disable the mount of your home directory
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese2" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
$ docker-machine create --driver virtualbox --help
利用方法: docker-machine create [オプション] [arg...]

マシンを生成します。

'docker-machine create --driver ドライバー名' の実行により、そのドライバーの create フラグをヘルプ表示に含めます。

オプション:

   --driver, -d "none"                                                                                  マシン生成に用いるドライバー。
   --engine-env [--engine-env option --engine-env option]                                               Engine に対して設定する環境変数を指定します。
   --engine-insecure-registry [--engine-insecure-registry option --engine-insecure-registry option]     生成済み Engine において安全でない Registry の利用を可能にします。
   --engine-install-url "https://get.docker.com"                                                        エンジンインストールにカスタム URL を指定します。[$MACHINE_DOCKER_INSTALL_URL]
   --engine-label [--engine-label option --engine-label option]                                         生成済み Engine に対してラベルを設定します。
   --engine-opt [--engine-opt option --engine-opt option]                                               生成済み Engine に対して フラグ=値 の形式で任意のフラグを含めて指定します。
   --engine-registry-mirror [--engine-registry-mirror option --engine-registry-mirror option]           利用する Registry ミラーを設定します。[$ENGINE_REGISTRY_MIRROR]
   --engine-storage-driver                                                                              Engine において利用するストレージドライバーを指定します。
   --swarm                                                                                              Docker Machine において Swarm を設定します。
   --swarm-addr                                                                                         Swarm におけるアドバタイズアドレス。(デフォルト： マシンIPを検出して利用)
   --swarm-discovery                                                                                    Swarm において利用するディスカバリーサービス。
   --swarm-experimental                                                                                 Swarm の試験的機能を有効にします。
   --swarm-host "tcp://0.0.0.0:3376"                                                                    ip/socket to listen on for Swarm master
   --swarm-image "swarm:latest"                                                                         Swarm において用いる Docker イメージを指定します。[$MACHINE_SWARM_IMAGE]
   --swarm-master                                                                                       Docker Machine を Swarm マスターとして設定します。
   --swarm-opt [--swarm-opt option --swarm-opt option]                                                  Swarm に対して任意のフラグを定義します。
   --swarm-strategy "spread"                                                                            Swarm におけるデフォルトのスケジューリングストラテジーを定義します。
   --virtualbox-boot2docker-url                                                                         boot2dockerイメージへのURL。デフォルトは最新入手可能バージョン。 [$VIRTUALBOX_BOOT2DOCKER_URL]
   --virtualbox-cpu-count "1"                                                                           マシンに割り当てるCPU数。(-1 により利用可能なCPU数) [$VIRTUALBOX_CPU_COUNT]
   --virtualbox-disk-size "20000"                                                                       ホストに割り当てるディスク容量、MB単位。[$VIRTUALBOX_DISK_SIZE]
   --virtualbox-host-dns-resolver                                                                       ホストの DNS リゾルバーを利用する。[$VIRTUALBOX_HOST_DNS_RESOLVER]
   --virtualbox-dns-proxy                                                                               DNS要求をすべてホストにプロキシーします。[$VIRTUALBOX_DNS_PROXY]
   --virtualbox-hostonly-cidr "192.168.99.1/24"                                                         ホストオンリーの CIDR を設定します。[$VIRTUALBOX_HOSTONLY_CIDR]
   --virtualbox-hostonly-nicpromisc "deny"                                                              ホストオンリーネットワークにてプロミスキャスモードを設定します。[$VIRTUALBOX_HOSTONLY_NIC_PROMISC]
   --virtualbox-hostonly-nictype "82540EM"                                                              ホストオンリーネットワークのアダプタータイプを設定します。[$VIRTUALBOX_HOSTONLY_NIC_TYPE]
   --virtualbox-import-boot2docker-vm                                                                   インポートする Boot2Docker VM イメージ名。
   --virtualbox-memory "1024"                                                                           ホストのメモリーサイズ、MB 単位。[$VIRTUALBOX_MEMORY_SIZE]
   --virtualbox-no-share                                                                                ホームディレクトリのマウントを無効化します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
You may notice that some flags specify environment variables that they are
associated with as well (located to the far left hand side of the row).  If
these environment variables are set when `docker-machine create` is invoked,
Docker Machine uses them for the default value of the flag.
@y
{% comment %}
You may notice that some flags specify environment variables that they are
associated with as well (located to the far left hand side of the row).  If
these environment variables are set when `docker-machine create` is invoked,
Docker Machine uses them for the default value of the flag.
{% endcomment %}
上をよく見れば、環境変数に関連づいているフラグがあるのがわかります。
（一番右に表記されています。）
`docker-machine create` の実行時に、その環境変数が設定されている場合、Docker Machine は対応するフラグのデフォルト値として、その設定値を利用します。
@z

@x
## Specifying configuration options for the created Docker engine
@y
{% comment %}
## Specifying configuration options for the created Docker engine
{% endcomment %}
{: #specifying-configuration-options-for-the-created-docker-engine }
## 生成マシンに対する設定オプションの指定
@z

@x
As part of the process of creation, Docker Machine installs Docker and
configures it with some sensible defaults. For instance, it allows connection
from the outside world over TCP with TLS-based encryption and defaults to AUFS
as the [storage driver](/engine/reference/commandline/dockerd/#daemon-storage-driver-option)
when available.
@y
{% comment %}
As part of the process of creation, Docker Machine installs Docker and
configures it with some sensible defaults. For instance, it allows connection
from the outside world over TCP with TLS-based encryption and defaults to AUFS
as the [storage driver](/engine/reference/commandline/dockerd/#daemon-storage-driver-option)
when available.
{% endcomment %}
Docker Machine の生成処理において、Docker Machine はマシンをインストールし、実用的なデフォルト値をいくつか利用して設定を行います。
たとえば、ネットワークにおいては TCP を介して外部との接続を可能とし、TLS ベースの暗号化を利用します。
また [ストレージドライバー](/engine/reference/commandline/dockerd/#daemon-storage-driver-option) として AUFS が利用可能であれば、これをデフォルト設定します。
@z

@x
There are several cases where the user might want to set options for the created
Docker engine (also known as the Docker _daemon_) themselves. For example, they
may want to allow connection to a [registry](../../registry/index.md)
that they are running themselves using the `--insecure-registry` flag for the
daemon. Docker Machine supports the configuration of such options for the
created engines via the `create` command flags which begin with `--engine`.
@y
{% comment %}
There are several cases where the user might want to set options for the created
Docker engine (also known as the Docker _daemon_) themselves. For example, they
may want to allow connection to a [registry](../../registry/index.md)
that they are running themselves using the `--insecure-registry` flag for the
daemon. Docker Machine supports the configuration of such options for the
created engines via the `create` command flags which begin with `--engine`.
{% endcomment %}
設定済みの Docker Engine（Docker **デーモン** とも呼ぶ）に対して、設定を行いたいケースがいくつかあります。
たとえばデーモンに対する `--insecure-registry` フラグ指定を使って、[Registry](../../registry/index.md) への接続可能とするような場合です。
Docker Machine では、構築済みの Engine に対しての設定オプションを `create` コマンドのフラグから指定することを可能としており、そのフラグは、先頭に `--engine` がつきます。
@z

@x
Docker Machine only sets the configured parameters on the daemon
and does not set up any of the "dependencies" for you. For instance, if you
specify that the created daemon should use `btrfs` as a storage driver, you
still must ensure that the proper dependencies are installed, the BTRFS
filesystem has been created, and so on.
@y
{% comment %}
Docker Machine only sets the configured parameters on the daemon
and does not set up any of the "dependencies" for you. For instance, if you
specify that the created daemon should use `btrfs` as a storage driver, you
still must ensure that the proper dependencies are installed, the BTRFS
filesystem has been created, and so on.
{% endcomment %}
Docker Machine がデーモン向けに設定するのは、指定されたパラメーター内容だけです。
つまりそこに「依存する内容」までは設定しません。
たとえばデーモンに対して、ストレージドライバーとして `btrfs` の利用を設定したとしても、そこに依存する内容、つまり BTRFS の適切な生成などは、あらかじめ行っておかなければなりません。
@z

@x
The following is an example usage:
@y
{% comment %}
The following is an example usage:
{% endcomment %}
以下がその利用例です。
@z

@x
```bash
$ docker-machine create -d virtualbox \
    --engine-label foo=bar \
    --engine-label spam=eggs \
    --engine-storage-driver overlay \
    --engine-insecure-registry registry.myco.com \
    foobarmachine
```
@y
```bash
$ docker-machine create -d virtualbox \
    --engine-label foo=bar \
    --engine-label spam=eggs \
    --engine-storage-driver overlay \
    --engine-insecure-registry registry.myco.com \
    foobarmachine
```
@z

@x
This creates a virtual machine running locally in VirtualBox which uses the
`overlay` storage backend, has the key-value pairs `foo=bar` and `spam=eggs` as
labels on the engine, and allows pushing / pulling from the insecure registry
located at `registry.myco.com`. You can verify much of this by inspecting the
output of `docker info`:
@y
{% comment %}
This creates a virtual machine running locally in VirtualBox which uses the
`overlay` storage backend, has the key-value pairs `foo=bar` and `spam=eggs` as
labels on the engine, and allows pushing / pulling from the insecure registry
located at `registry.myco.com`. You can verify much of this by inspecting the
output of `docker info`:
{% endcomment %}
上の例は VirtualBox 上にローカルで動作する仮想マシンを生成し、バックエンドとして `overlay` ストレージドライバーを利用します。
また Engine 上において、キーバリューペア `foo=bar`、`spam=eggs` によるラベルを保持します。
そして `registry.myco.com` という安全でない（insecure）レジストリとの間でプッシュ、プルを可能とします。
このような設定は `docker info` の出力から確認することができます。
@z

@x
```bash
$ eval $(docker-machine env foobarmachine)
$ docker info
@y
```bash
$ eval $(docker-machine env foobarmachine)
$ docker info
@z

@x
Containers: 0
Images: 0
Storage Driver: overlay
...
Name: foobarmachine
...
Labels:
 foo=bar
 spam=eggs
 provider=virtualbox
```
@y
Containers: 0
Images: 0
Storage Driver: overlay
...
Name: foobarmachine
...
Labels:
 foo=bar
 spam=eggs
 provider=virtualbox
```
@z

@x
The supported flags are as follows:
@y
{% comment %}
The supported flags are as follows:
{% endcomment %}
サポートされているフラグは以下のとおりです。
@z

@x
-   `--engine-insecure-registry`: Specify [insecure registries](/engine/reference/commandline/cli/#insecure-registries) to allow with the created engine
-   `--engine-registry-mirror`: Specify [registry mirrors](../../registry/recipes/mirror.md) to use
-   `--engine-label`: Specify [labels](../../config/labels-custom-metadata.md) for the created engine
-   `--engine-storage-driver`: Specify a [storage driver](/engine/reference/commandline/cli/#daemon-storage-driver-option) to use with the engine
@y
{% comment %}
-   `--engine-insecure-registry`: Specify [insecure registries](/engine/reference/commandline/cli/#insecure-registries) to allow with the created engine
-   `--engine-registry-mirror`: Specify [registry mirrors](../../registry/recipes/mirror.md) to use
-   `--engine-label`: Specify [labels](../../config/labels-custom-metadata.md) for the created engine
-   `--engine-storage-driver`: Specify a [storage driver](/engine/reference/commandline/cli/#daemon-storage-driver-option) to use with the engine
{% endcomment %}
-   `--engine-insecure-registry`:
    Engine に対して [安全ではない Registry](/engine/reference/commandline/cli/#insecure-registries) の利用を許可します。
-   `--engine-registry-mirror`:
    利用する [Registry ミラー](../../registry/recipes/mirror.md) を指定します。
-   `--engine-label`:
    Engine に対して [ラベル](../../config/labels-custom-metadata.md) を設定します。
-   `--engine-storage-driver`:
    Engine において利用する [ストレージドライバー](/engine/reference/commandline/cli/#daemon-storage-driver-option) を指定します。
@z

@x
If the engine supports specifying the flag multiple times (such as with
`--label`), then so does Docker Machine.
@y
{% comment %}
If the engine supports specifying the flag multiple times (such as with
`--label`), then so does Docker Machine.
{% endcomment %}
Engine に対してフラグの複数指定がサポートされている場合（たとえば `--label` など）、Docker Machine においてもサポートされます。
@z

@x
In addition to this subset of daemon flags which are directly supported, Docker
Machine also supports an additional flag, `--engine-opt`, which can be used to
specify arbitrary daemon options with the syntax `--engine-opt flagname=value`.
For example, to specify that the daemon should use `8.8.8.8` as the DNS server
for all containers, and always use the `syslog` [log driver](../../config/containers/logging/configure.md)
you could run the following create command:
@y
{% comment %}
In addition to this subset of daemon flags which are directly supported, Docker
Machine also supports an additional flag, `--engine-opt`, which can be used to
specify arbitrary daemon options with the syntax `--engine-opt flagname=value`.
For example, to specify that the daemon should use `8.8.8.8` as the DNS server
for all containers, and always use the `syslog` [log driver](../../config/containers/logging/configure.md)
you could run the following create command:
{% endcomment %}
デーモンに対するフラグが直接サポートされていることに加えて、Docker Machine では、さらに追加のフラグがサポートされています。
それは `--engine-opt` というものであり、任意のデーモンオプションを `--engine-opt フラグ名=値` という文法により指定できるものです。
たとえば、デーモンが全コンテナーにおいて DNS サーバーとして `8.8.8.8` を利用する場合で、さらに[ログドライバー](../../config/containers/logging/configure.md)として `syslog` を利用する場合には、create コマンドは以下のように実行することができます。
@z

@x
```bash
$ docker-machine create -d virtualbox \
    --engine-opt dns=8.8.8.8 \
    --engine-opt log-driver=syslog \
    gdns
```
@y
```bash
$ docker-machine create -d virtualbox \
    --engine-opt dns=8.8.8.8 \
    --engine-opt log-driver=syslog \
    gdns
```
@z

@x
Additionally, Docker Machine supports a flag, `--engine-env`, which can be used to
specify arbitrary environment variables to be set within the engine with the syntax `--engine-env name=value`. For example, to specify that the engine should use `example.com` as the proxy server, you could run the following create command:
@y
{% comment %}
Additionally, Docker Machine supports a flag, `--engine-env`, which can be used to
specify arbitrary environment variables to be set within the engine with the syntax `--engine-env name=value`. For example, to specify that the engine should use `example.com` as the proxy server, you could run the following create command:
{% endcomment %}
さらに Docker Machine では `--engine-env` フラグがサポートされます。
これは任意の環境変数を Engine において設定するもので、`--engine-env 変数名=値` という文法により指定します。
たとえば Engine がプロキシーサーバーとして `example.com` を利用する場合、create コマンドの実行は以下のようになります。
@z

@x
```bash
$ docker-machine create -d virtualbox \
    --engine-env HTTP_PROXY=http://example.com:8080 \
    --engine-env HTTPS_PROXY=https://example.com:8080 \
    --engine-env NO_PROXY=example2.com \
    proxbox
```
@y
```bash
$ docker-machine create -d virtualbox \
    --engine-env HTTP_PROXY=http://example.com:8080 \
    --engine-env HTTPS_PROXY=https://example.com:8080 \
    --engine-env NO_PROXY=example2.com \
    proxbox
```
@z

@x
## Specifying Docker Swarm options for the created machine
@y
{% comment %}
## Specifying Docker Swarm options for the created machine
{% endcomment %}
{: #specifying-docker-swarm-options-for-the-created-machine }
## 生成マシンに対する Docker Swarm オプションの指定
@z

@x
In addition to configuring Docker Engine options as listed above,
you can use Machine to specify how the created swarm manager is
configured. There is a `--swarm-strategy` flag, which you can use to specify
the [scheduling strategy](../../swarm/scheduler/strategy.md)
which Docker Swarm should use (Machine defaults to the `spread` strategy).
There is also a general purpose `--swarm-opt` option which works similar to the aforementioned `--engine-opt` option, except that it specifies options
for the `swarm manage` command (used to boot a master node) instead of the base
command. You can use this to configure features that power users might be
interested in, such as configuring the heartbeat interval or Swarm's willingness
to over-commit resources. There is also the `--swarm-experimental` flag, that
allows you to access [experimental features](https://github.com/docker/swarm/tree/master/experimental)
in Docker Swarm.
@y
{% comment %}
In addition to configuring Docker Engine options as listed above,
you can use Machine to specify how the created swarm manager is
configured. There is a `--swarm-strategy` flag, which you can use to specify
the [scheduling strategy](../../swarm/scheduler/strategy.md)
which Docker Swarm should use (Machine defaults to the `spread` strategy).
There is also a general purpose `--swarm-opt` option which works similar to the aforementioned `--engine-opt` option, except that it specifies options
for the `swarm manage` command (used to boot a master node) instead of the base
command. You can use this to configure features that power users might be
interested in, such as configuring the heartbeat interval or Swarm's willingness
to over-commit resources. There is also the `--swarm-experimental` flag, that
allows you to access [experimental features](https://github.com/docker/swarm/tree/master/experimental)
in Docker Swarm.
{% endcomment %}
上で示した Docker Engine のオプション設定に加えて、Swarm マネージャーを生成する際のオプションを指定することもできます。
`--swarm-strategy` フラグがあり、これによって [スケジュールストラテジー](../../swarm/scheduler/strategy.md)（scheduling strategy）を指定することができます。
Docker Swarm においては、この指定が必要になります（Docker Machine は `spread` ストラテジーをデフォルトとしています）。
もう一つ、汎用目的で `--swarm-opt` オプションがあり、前述した `--engine-opt` オプションと同様に動作しますが、ただしこれは、ベースコマンドに対してではなく、`swarm manage` コマンドに対するオプションを指定するものです（マスターノードの起動の際によく用います）。
パワーユーザーであれば、これを利用して必要な設定を行うことができます。
たとえばハートビート間隔の設定や、リソースに対するオーバーコミットを積極的に行うような設定などが可能になります。
`--swarm-experimental` というフラグもあります。
これは Docker Swarm において [試験的機能](https://github.com/docker/swarm/tree/master/experimental) にアクセスできるようにするものです。
@z

@x
If you're not sure how to configure these options, it is best to not specify
configuration at all. Docker Machine chooses sensible defaults for you and
you don't need to worry about it.
@y
{% comment %}
If you're not sure how to configure these options, it is best to not specify
configuration at all. Docker Machine chooses sensible defaults for you and
you don't need to worry about it.
{% endcomment %}
こういったオプションをどのように設定してよいかわからない場合、一番なのは何も指定しないことです。
Docker Machine が適切なデフォルト値を選定するので、心配には及びません。
@z

@x
Example create:
@y
{% comment %}
Example create:
{% endcomment %}
以下は create の利用例です。
@z

@x
```bash
$ docker-machine create -d virtualbox \
    --swarm \
    --swarm-master \
    --swarm-discovery token://<token> \
    --swarm-strategy binpack \
    --swarm-opt heartbeat=5s \
    upbeat
```
@y
```bash
$ docker-machine create -d virtualbox \
    --swarm \
    --swarm-master \
    --swarm-discovery token://<token> \
    --swarm-strategy binpack \
    --swarm-opt heartbeat=5s \
    upbeat
```
@z

@x
This sets the swarm scheduling strategy to "binpack" (pack in containers as
tightly as possible per host instead of spreading them out), and the "heartbeat"
interval to 5 seconds.
@y
{% comment %}
This sets the swarm scheduling strategy to "binpack" (pack in containers as
tightly as possible per host instead of spreading them out), and the "heartbeat"
interval to 5 seconds.
{% endcomment %}
上の例では Swarm のスケジューリングストラテジーを「binpack」に設定しています。
（コンテナーの割り振りを全体に広く行うのでなく、各ホストごとにできるだけ詰めるようにします。）
そして「ハートビート」間隔を 5 秒に設定しています。
@z

@x
## Pre-create check
@y
{% comment %}
## Pre-create check
{% endcomment %}
{: #pre-create-check }
## 生成時の事前チェック
@z

@x
Many drivers require a certain set of conditions to be in place before
machines can be created. For instance, VirtualBox needs to be installed before
the `virtualbox` driver can be used. For this reason, Docker Machine has a
"pre-create check" which is specified at the driver level.
@y
{% comment %}
Many drivers require a certain set of conditions to be in place before
machines can be created. For instance, VirtualBox needs to be installed before
the `virtualbox` driver can be used. For this reason, Docker Machine has a
"pre-create check" which is specified at the driver level.
{% endcomment %}
マシンを生成するにあたっては、多くのドライバーが一定の条件を満たしておく必要があります。
たとえば `virtualbox` ドライバーの利用にあたっては、あらかじめ VirtualBox をインストールしておくことが必要です。
この理由から Docker Machine には「生成時の事前チェック」があり、ドライバーレベルで指定されています。
@z

@x
If this pre-create check succeeds, Docker Machine proceeds with the creation
as normal.  If the pre-create check fails, the Docker Machine process exits
with status code 3 to indicate that the source of the non-zero exit was the
pre-create check failing.
@y
{% comment %}
If this pre-create check succeeds, Docker Machine proceeds with the creation
as normal.  If the pre-create check fails, the Docker Machine process exits
with status code 3 to indicate that the source of the non-zero exit was the
pre-create check failing.
{% endcomment %}
事前チェックが成功すると、Docker Machine は通常どおり生成処理に進みます。
事前チェックに失敗した場合、Docker Machine はステータスコード 3 を返して終了します。
ゼロ以外による終了は、事前チェックに失敗したことを示しています。
@z
