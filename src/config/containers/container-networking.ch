%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Container networking
description: How networking works from the container's point of view
keywords: networking, container, standalone
redirect_from:
- /engine/userguide/networking/configure-dns/
- /engine/userguide/networking/default_network/configure-dns/
- /engine/userguide/networking/default_network/binding/
- /engine/userguide/networking/default_network/container-communication/
---
@y
---
title: コンテナーのネットワーク
description: コンテナーから見て、ネットワークがどのように動作するのかを説明します。
keywords: networking, container, standalone
redirect_from:
- /engine/userguide/networking/configure-dns/
- /engine/userguide/networking/default_network/configure-dns/
- /engine/userguide/networking/default_network/binding/
- /engine/userguide/networking/default_network/container-communication/
---
@z

@x
The type of network a container uses, whether it is a [bridge](../../network/bridge.md), an
[overlay](../../network/overlay.md), a [macvlan network](../../network/macvlan.md), or a custom network
plugin, is transparent from within the container. From the container's point of
view, it has a network interface with an IP address, a gateway, a routing table,
DNS services, and other networking details (assuming the container is not using
the `none` network driver). This topic is about networking concerns from the
point of view of the container.
@y
{% comment %}
The type of network a container uses, whether it is a [bridge](../../network/bridge.md), an
[overlay](../../network/overlay.md), a [macvlan network](../../network/macvlan.md), or a custom network
plugin, is transparent from within the container. From the container's point of
view, it has a network interface with an IP address, a gateway, a routing table,
DNS services, and other networking details (assuming the container is not using
the `none` network driver). This topic is about networking concerns from the
point of view of the container.
{% endcomment %}
コンテナーが利用するネットワークの種類は、[ブリッジ](../../network/bridge.md)、[オーバーレイ](../../network/overlay.md)、[Macvlan ネットワーク](../../network/macvlan.md)、カスタムネットワークプラグインとさまざまですが、コンテナーの内部から見ればどれも同じです。
コンテナーからすれば、ネットワークインターフェースに IP アドレスがあり、ゲートウェイ、ルーティングテーブル、DNS サービス、その他のネットワークリソースがあるだけのことです。
（もちろんコンテナーが `none` ネットワークドライバーを用いる場合は除きます。）
ここでは、コンテナーから見たネットワーク関連のもろもろについて示します。
@z

@x
## Published ports
@y
{% comment %}
## Published ports
{% endcomment %}
{: #published-ports }
## 公開ポート
@z

@x
By default, when you create or run a container using `docker create` or `docker run`,
it does not publish any of its ports to the outside world. To make a port available
to services outside of Docker, or to Docker containers which are not connected to
the container's network, use the `--publish` or `-p` flag. This creates a firewall
rule which maps a container port to a port on the Docker host to the outside world.
Here are some examples.
@y
{% comment %}
By default, when you create or run a container using `docker create` or `docker run`,
it does not publish any of its ports to the outside world. To make a port available
to services outside of Docker, or to Docker containers which are not connected to
the container's network, use the `--publish` or `-p` flag. This creates a firewall
rule which maps a container port to a port on the Docker host to the outside world.
Here are some examples.
{% endcomment %}
`docker create`や`docker run`を使ってコンテナーを生成、実行した際には、デフォルトではどのポートも外部に向け公開はされません。
Docker 外部にあるサービスに向けて、あるいはコンテナーネットワークに接続していない別のコンテナーに向けてポートを利用可能とするには、`--publish`または`-p`フラグを用います。
これを行うと、コンテナーから外部にある Docker ホストに向けたポート割り当てを実現するファイアウォールルールが生成されます。
以下がその例です。
@z

@x
| Flag value                      | Description                                                                                                                                     |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| `-p 8080:80`                    | Map TCP port 80 in the container to port 8080 on the Docker host.                                                                               |
| `-p 192.168.1.100:8080:80`      | Map TCP port 80 in the container to port 8080 on the Docker host for connections to host IP 192.168.1.100.                                      |
| `-p 8080:80/udp`                | Map UDP port 80 in the container to port 8080 on the Docker host.                                                                               |
| `-p 8080:80/tcp -p 8080:80/udp` | Map TCP port 80 in the container to TCP port 8080 on the Docker host, and map UDP port 80 in the container to UDP port 8080 on the Docker host. |
@y
{% comment %}
| Flag value                      | Description                                                                                                                                     |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| `-p 8080:80`                    | Map TCP port 80 in the container to port 8080 on the Docker host.                                                                               |
| `-p 192.168.1.100:8080:80`      | Map TCP port 80 in the container to port 8080 on the Docker host for connections to host IP 192.168.1.100.                                      |
| `-p 8080:80/udp`                | Map UDP port 80 in the container to port 8080 on the Docker host.                                                                               |
| `-p 8080:80/tcp -p 8080:80/udp` | Map TCP port 80 in the container to TCP port 8080 on the Docker host, and map UDP port 80 in the container to UDP port 8080 on the Docker host. |
{% endcomment %}
| フラグ値                        | 内容説明                                                                                                                                                  |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-p 8080:80`                    | コンテナーの TCP ポート 80 を Docker ホスト上のポート 8080 に割り当てます。                                                                               |
| `-p 192.168.1.100:8080:80`      | コンテナーの TCP ポート 80 を Docker ホストの IP 192.168.1.100 への接続時のポート 8080 に割り当てます。                                                   |
| `-p 8080:80/udp`                | コンテナーの UDP ポート 80 を Docker ホスト上のポート 8080 に割り当てます。                                                                               |
| `-p 8080:80/tcp -p 8080:80/udp` | コンテナーの TCP ポート 80 を Docker ホスト上のポート 8080 に割り当てます。またコンテナーの UDP ポート 80 を Docker ホスト上のポート 8080 に割り当てます。|
@z

@x
## IP address and hostname
@y
{% comment %}
## IP address and hostname
{% endcomment %}
{: #ip-address-and-hostname }
## IP アドレスとホスト名
@z

@x
By default, the container is assigned an IP address for every Docker network it
connects to. The IP address is assigned from the pool assigned to
the network, so the Docker daemon effectively acts as a DHCP server for each
container. Each network also has a default subnet mask and gateway.
@y
{% comment %}
By default, the container is assigned an IP address for every Docker network it
connects to. The IP address is assigned from the pool assigned to
the network, so the Docker daemon effectively acts as a DHCP server for each
container. Each network also has a default subnet mask and gateway.
{% endcomment %}
コンテナーが接続する Docker ネットワークのすべてに対して、デフォルトで個々に IP アドレスが割り振られます。
そしてその IP アドレスは、そのネットワークにある IP プールから割り振られます。
したがって Docker デーモンは各コンテナーに対して、実質的に DHCP サーバーとして振る舞うことになります。
各ネットワークには、デフォルトのサブネットマスクとゲートウェイがそれぞれに存在します。
@z

@x
When the container starts, it can only be connected to a single network, using
`--network`. However, you can connect a running container to multiple
networks using `docker network connect`. When you start a container using the
`--network` flag, you can specify the IP address assigned to the container on
that network using the `--ip` or `--ip6` flags.
@y
{% comment %}
When the container starts, it can only be connected to a single network, using
`--network`. However, you can connect a running container to multiple
networks using `docker network connect`. When you start a container using the
`--network` flag, you can specify the IP address assigned to the container on
that network using the `--ip` or `--ip6` flags.
{% endcomment %}
コンテナーを起動する際に、ただ 1 つのネットワークに接続させるには `--network` フラグを使います。
実行中のコンテナーを複数ネットワークに接続するなら `docker network connect` を使います。
`--network` フラグを用いてコンテナーを起動すると、そのネットワーク上においてコンテナーに対する IP アドレスを指定することができます。
その場合には `--ip` または `--ip6` フラグを使います。
@z

@x
When you connect an existing container to a different network using
`docker network connect`, you can use the `--ip` or `--ip6` flags on that
command to specify the container's IP address on the additional network.
@y
{% comment %}
When you connect an existing container to a different network using
`docker network connect`, you can use the `--ip` or `--ip6` flags on that
command to specify the container's IP address on the additional network.
{% endcomment %}
既存のコンテナーをそれまでとは違うネットワークに接続するには `docker network connect` を用いますが、
コマンド実行の際に `--ip` または `--ip6` フラグを用いれば、そのネットワーク上での IP アドレスを指定することができます。
@z

@x
In the same way, a container's hostname defaults to be the container's ID in
Docker. You can override the hostname using `--hostname`. When connecting to an
existing network using `docker network connect`, you can use the `--alias`
flag to specify an additional network alias for the container on that network.
@y
{% comment %}
In the same way, a container's hostname defaults to be the container's ID in
Docker. You can override the hostname using `--hostname`. When connecting to an
existing network using `docker network connect`, you can use the `--alias`
flag to specify an additional network alias for the container on that network.
{% endcomment %}
同じような話として、コンテナーのホスト名にはコンテナー ID がデフォルトで割り当てられますが、`--hostname` を使えばホスト名をオーバーライドすることができます。
既存のネットワークに `docker network connect` を使って接続する際に `--alias` フラグを使うと、そのネットワーク上においてコンテナーの別名を指定することができます。
@z

@x
## DNS services
@y
{% comment %}
## DNS services
{% endcomment %}
{: #dns-services }
## DNS サービス
@z

@x
By default, a container inherits the DNS settings of the host, as defined in the
`/etc/resolv.conf` configuration file. Containers that use the default `bridge`
network get a copy of this file, whereas containers that use a
[custom network](../../network/network-tutorial-standalone.md#use-user-defined-bridge-networks)
use Docker's embedded DNS server, which forwards external DNS lookups to the DNS
servers configured on the host.
@y
{% comment %}
By default, a container inherits the DNS settings of the host, as defined in the
`/etc/resolv.conf` configuration file. Containers that use the default `bridge`
network get a copy of this file, whereas containers that use a
[custom network](../../network/network-tutorial-standalone.md#use-user-defined-bridge-networks)
use Docker's embedded DNS server, which forwards external DNS lookups to the DNS
servers configured on the host.
{% endcomment %}
コンテナーなデフォルトで、ホスト上の設定ファイル `/etc/resolv.conf` によって定義された DNS 設定を受け継ぎます。
コンテナーがデフォルトの `bridge` ネットワークを利用する場合は、その設定ファイルがコピーされます。
この一方で [カスタムネットワーク](../../network/network-tutorial-standalone.md#use-user-defined-bridge-networks) を利用するコンテナーの場合は、Docker の埋め込み DNS サーバーを利用します。
これはホスト上において設定された DNS サーバーに対して、外部 DNS ルックアップをフォワードします。
@z

@x
Custom hosts defined in `/etc/hosts` are not inherited. To pass additional hosts
into your container, refer to [add entries to container hosts file](../../engine/reference/commandline/run.md#add-entries-to-container-hosts-file---add-host)
in the `docker run` reference documentation. You can override these settings on
a per-container basis.
@y
{% comment %}
Custom hosts defined in `/etc/hosts` are not inherited. To pass additional hosts
into your container, refer to [add entries to container hosts file](../../engine/reference/commandline/run.md#add-entries-to-container-hosts-file---add-host)
in the `docker run` reference documentation. You can override these settings on
a per-container basis.
{% endcomment %}
`/etc/hosts` においてカスタムホストが定義されていても、これは受け継がれません。
追加的なホスト定義をコンテナーに受け渡すには、`docker run` のリファレンスドキュメント内にある、[コンテナーのホストファイルへのエントリー追加](../../engine/reference/commandline/run.md#add-entries-to-container-hosts-file---add-host) を参照してください。
このような設定は、コンテナーごとにオーバーライドすることができます。
@z

@x
| Flag           | Description                                                                                                                                                                                                                                                         |
|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--dns`        | The IP address of a DNS server. To specify multiple DNS servers, use multiple `--dns` flags. If the container cannot reach any of the IP addresses you specify, Google's public DNS server `8.8.8.8` is added, so that your container can resolve internet domains. |
| `--dns-search` | A DNS search domain to search non-fully-qualified hostnames. To specify multiple DNS search prefixes, use multiple `--dns-search` flags.                                                                                                                            |
| `--dns-opt`    | A key-value pair representing a DNS option and its value. See your operating system's documentation for `resolv.conf` for valid options.                                                                                                                            |
| `--hostname`   | The hostname a container uses for itself. Defaults to the container's ID if not specified.                                                                                                                                                                          |
@y
{% comment %}
| Flag           | Description                                                                                                                                                                                                                                                         |
|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--dns`        | The IP address of a DNS server. To specify multiple DNS servers, use multiple `--dns` flags. If the container cannot reach any of the IP addresses you specify, Google's public DNS server `8.8.8.8` is added, so that your container can resolve internet domains. |
| `--dns-search` | A DNS search domain to search non-fully-qualified hostnames. To specify multiple DNS search prefixes, use multiple `--dns-search` flags.                                                                                                                            |
| `--dns-opt`    | A key-value pair representing a DNS option and its value. See your operating system's documentation for `resolv.conf` for valid options.                                                                                                                            |
| `--hostname`   | The hostname a container uses for itself. Defaults to the container's ID if not specified.                                                                                                                                                                          |
{% endcomment %}
| フラグ         | 内容説明                                                                                                                                                                                                                                                                 |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--dns`        | DNS サーバーの IP アドレス。複数の DNS サーバーを指定する場合は `--dns` フラグを複数回指定します。指定した IP アドレスにコンテナーから接続できない場合、Google の公開 DNS サーバー `8.8.8.8` を追加すれば、コンテナーがインターネットドメインを解決できるようになります。|
| `--dns-search` | 完全修飾ドメイン名でないホスト名を検索するための DNS 検索ドメイン。複数の DNS サーチプレフィックスを指定するする場合は、`--dns-search` フラグを複数回指定します。                                                                                                        |
| `--dns-opt`    | DNS オプションとその値を表わすキーバリューペア。適用するオプションについては、オペレーティングシステムにおける `resolv.conf` のドキュメントを参照してください。                                                                                                          |
| `--hostname`   | コンテナーそのものが利用するホスト名。特に指定がない場合は、デフォルトでコンテナーID がホスト名になります。                                                                                                                                                              |
@z

@x
## Proxy server
@y
{% comment %}
## Proxy server
{% endcomment %}
{: #proxy-server }
## プロキシーサーバー
@z

@x
If your container needs to use a proxy server, see
[Use a proxy server](../../network/proxy.md).
@y
{% comment %}
If your container needs to use a proxy server, see
[Use a proxy server](../../network/proxy.md).
{% endcomment %}
コンテナーにおいてプロキシーサーバーを利用する必要がある場合は、[プロキシーサーバーの利用](../../network/proxy.md) を参照してください。
@z
