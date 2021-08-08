%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use overlay networks
description: All about using overlay networks
keywords: network, overlay, user-defined, swarm, service
redirect_from:
- /engine/swarm/networking/
- /engine/userguide/networking/overlay-security-model/
- /config/containers/overlay/
---
@y
---
title: オーバーレイネットワークの利用
description: All about using overlay networks
keywords: network, overlay, user-defined, swarm, service
redirect_from:
- /engine/swarm/networking/
- /engine/userguide/networking/overlay-security-model/
- /config/containers/overlay/
---
@z

@x
The `overlay` network driver creates a distributed network among multiple
Docker daemon hosts. This network sits on top of (overlays) the host-specific
networks, allowing containers connected to it (including swarm service
containers) to communicate securely when encryption is enabled. Docker
transparently handles routing of each packet to and from the correct Docker
daemon host and the correct destination container.
@y
`overlay`ネットワークドライバーは、複数の Docker デーモンホスト間での分散ネットワークを生成します。
このネットワークは、ホストに固有のものとして構築されたネットワークの最上位に位置（overlay）するものです。
このネットワークに対しては、コンテナー（Swarm サービスコンテナーを含む）が接続可能です。
暗号化が有効になっていれば、安全な通信を行うことができます。
Docker は、各パケットの送受信経路を透過的に取り扱い、その送受信先となる Docker ホストデーモンやコンテナーを適切に認識します。
@z

@x
When you initialize a swarm or join a Docker host to an existing swarm, two
new networks are created on that Docker host:
@y
Swarm の初期化を行うとき、あるいは Docker ホストを既存の Swarm に参加させるときには、そのホスト上に 2 つのネットワークが生成されます。
@z

@x
- an overlay network called `ingress`, which handles the control and data traffic
  related to swarm services. When you create a swarm service and do not
  connect it to a user-defined overlay network, it connects to the `ingress`
  network by default.
- a bridge network called `docker_gwbridge`, which connects the individual
  Docker daemon to the other daemons participating in the swarm.
@y
- 1 つは`ingress`と呼ばれるオーバーレイネットワークです。
  これは Swarm サービスに関する制御とデータトラフィックを取り扱います。
  Swarm サービスを生成する際に、ユーザー定義のオーバーレイネットワークへの接続を指定しない限り、デフォルトでは`ingress`ネットワークに接続されます。
- もう 1 つは`docker_gwbridge`と呼ばれるブリッジネットワークです。
  これは、個々の Docker デーモンを、Swarm 内に参加している別のデーモンに接続するものです。
@z

@x
You can create user-defined `overlay` networks using `docker network create`,
in the same way that you can create user-defined `bridge` networks. Services
or containers can be connected to more than one network at a time. Services or
containers can only communicate across networks they are each connected to.
@y
ユーザー定義の`overlay`ネットワークは`docker network create`を使って生成することができます。
ユーザー定義の`bridge`ネットワークを生成する方法と同じです。
サービスやコンテナーは、一度に複数のネットワークに接続できます。
サービスやコンテナーがネットワーク通信を行うことができるのは、互いに接続されている場合だけです。
@z

@x
Although you can connect both swarm services and standalone containers to an
overlay network, the default behaviors and configuration concerns are different.
For that reason, the rest of this topic is divided into operations that apply to
all overlay networks, those that apply to swarm service networks, and those that
apply to overlay networks used by standalone containers.
@y
Swarm サービスとスタンドアロンコンテナーは、どちらもオーバーレイネットワークに接続することができます。
ただしデフォルトの動作や設定が目指しているものは、まったく異なります。
そこで、これ以降のトピックでは操作説明を以下のように分けます。
オーバーレイネットワークに対する全般的な操作、Swarm サービスネットワークに対する操作、スタンドアロンコンテナーにおいて利用されるオーバーレイネットワークに対する操作です。
@z

@x
## Operations for all overlay networks
@y
{: #operations-for-all-overlay-networks }
## オーバーレイネットワークに対する全般的な操作
@z

@x
### Create an overlay network
@y
{: #create-an-overlay-network }
### オーバーレイネットワークの生成
@z

@x
> **Prerequisites**:
>
> - Firewall rules for Docker daemons using overlay networks
>
>   You need the following ports open to traffic to and from each Docker host
>   participating on an overlay network:
>
>   - TCP port 2377 for cluster management communications
>   - TCP and UDP port 7946 for communication among nodes
>   - UDP port 4789 for overlay network traffic
>
> - Before you can create an overlay network, you need to either initialize your
>   Docker daemon as a swarm manager using `docker swarm init` or join it to an
>   existing swarm using `docker swarm join`. Either of these creates the default
>   `ingress` overlay network which is used by swarm services by default. You need
>   to do this even if you never plan to use swarm services. Afterward, you can
>   create additional user-defined overlay networks.
@y
> **前提条件**
>
> - オーバーレイネットワークを使った Docker デーモン用のファイアーウォールルール
>
>   オーバーレイネットワーク上に参加する Docker ホスト間でのトラフィックのやりとりのため、以下のポートを公開する必要があります。
>
>   - TCP ポート 2377、クラスター管理に関する通信用。
>   - TCP と UDP のポート 7946、ノード間の通信用。
>   - UDP ポート 4789、オーバーレイネットワークトラフィック用。
>
> - オーバーレイネットワークを生成する前には、`docker swarm init`を使って Docker デーモンを Swarm マネージャーとして初期化するか、あるいは`docker swarm join`を使って既存の Swarm にホストを追加しておく必要があります。
>   どちらの場合でも、デフォルトの`ingress`オーバーレイネットワークが生成されます。
>   このネットワークは、デフォルトで Swarm サービスが利用するものです。
>   Swarm サービスを利用するつもりがなくても、これを行っておくことが必要です。
>   この後には、ユーザー定義のオーバーレイネットワークを追加生成することができます。
@z

@x
To create an overlay network for use with swarm services, use a command like
the following:
@y
Swarm サービスに対して利用するオーバーレイネットワークを生成するには、以下のようなコマンドを実行します。
@z

@x
```console
$ docker network create -d overlay my-overlay
```
@y
```console
$ docker network create -d overlay my-overlay
```
@z

@x
To create an overlay network which can be used by swarm services **or**
standalone containers to communicate with other standalone containers running on
other Docker daemons, add the `--attachable` flag:
@y
オーバーレイネットワークを生成する目的が、Swarm サービスにおいて利用するだけでなく、スタンドアロンコンテナー **においても** 利用することが必要な場合で、他の Docker デーモン上で動作する他のスタンドアロンコンテナーとも通信を行う必要がある場合は、`--attachable`フラグを加えます。
@z

@x
```console
$ docker network create -d overlay --attachable my-attachable-overlay
```
@y
```console
$ docker network create -d overlay --attachable my-attachable-overlay
```
@z

@x
You can specify the IP address range, subnet, gateway, and other options. See
`docker network create --help` for details.
@y
IP アドレス範囲、サブネット、ゲートウェイ、その他のオプションを指定することができます。
詳しくは`docker network create --help`を確認してください。
@z

@x
### Encrypt traffic on an overlay network
@y
{: #encrypt-traffic-on-an-overlay-network }
### オーバーレイネットワーク上のトラフィック暗号化
@z

@x
All swarm service management traffic is encrypted by default, using the
[AES algorithm](https://en.wikipedia.org/wiki/Galois/Counter_Mode) in
GCM mode. Manager nodes in the swarm rotate the key used to encrypt gossip data
every 12 hours.
@y
Swarm サービスの管理トラフィックは、デフォルトにおいて、GCM モードの [AES アルゴリズム](https://en.wikipedia.org/wiki/Galois/Counter_Mode) を使ってすべて暗号化されます。
Swarm 内のマネージャーノードは、ゴシップデータ（gossip data）の暗号化に利用する鍵を 12 時間ごとにローテートして利用します。
@z

@x
To encrypt application data as well, add `--opt encrypted` when creating the
overlay network. This enables IPSEC encryption at the level of the vxlan. This
encryption imposes a non-negligible performance penalty, so you should test this
option before using it in production.
@y
アプリケーションデータを暗号化するには、オーバーレイネットワークの生成時に`--opt encrypted`を指定します。
これにより vxlan レベルの IPSEC 暗号化が実現します。
この暗号化を利用すると、性能劣化が無視できない程度に発生します。
したがって本番環境での利用を行うには、あらかじめ十分にテストを行っておく必要があります。
@z

@x
When you enable overlay encryption, Docker creates IPSEC tunnels between all the
nodes where tasks are scheduled for services attached to the overlay network.
These tunnels also use the AES algorithm in GCM mode and manager nodes
automatically rotate the keys every 12 hours.
@y
オーバーレイにおいて暗号化を有効にすると、Docker はノード間のすべてに IPSEC トンネルを生成して、
オーバーレイネットワークにアタッチされたサービスに応じて、タスクをスケジューリングします。
このトンネルは GCM モードでの AES アルゴリズムを利用するので、マネージャーノードは 12 時間ごとに鍵のローテートを自動的に行います。
@z

@x
> **Do not attach Windows nodes to encrypted overlay networks.**
>
> Overlay network encryption is not supported on Windows. If a Windows node
> attempts to connect to an encrypted overlay network, no error is detected but
> the node cannot communicate.
{: .warning }
@y
> **Windows ノードは暗号化されたオーバーレイネットワークにアタッチしないでください。**
>
> オーバーレイネットワークの暗号化は Windows 上においてはサポートされていません。
> 暗号化されたオーバーレイネットワークに Windows ノードを接続しようとすると、エラーは発生しませんが、ただしそのノードは通信することができません。
{: .warning }
@z

@x
#### Swarm mode overlay networks and standalone containers
@y
{: #swarm-mode-overlay-networks-and-standalone-containers }
#### Swarm モードのオーバーレイネットワークとスタンドアロンコンテナー
@z

@x
You can use the overlay network feature with both `--opt encrypted --attachable`
 and attach unmanaged containers to that network:
@y
オーバーレイネットワーク機能を利用する際に`--opt encrypted --attachable`を同時に指定すれば、このネットワークに対して、管理外にあったコンテナーをアタッチさせることができます。
@z

@x
```console
$ docker network create --opt encrypted --driver overlay --attachable my-attachable-multi-host-network
```
@y
```console
$ docker network create --opt encrypted --driver overlay --attachable my-attachable-multi-host-network
```
@z

@x
### Customize the default ingress network
@y
{: #customize-the-default-ingress-network }
### デフォルトの ingress ネットワークのカスタマイズ
@z

@x
Most users never need to configure the `ingress` network, but Docker allows you
to do so. This can be useful if the automatically-chosen subnet conflicts with
one that already exists on your network, or you need to customize other low-level
network settings such as the MTU.
@y
ほとんどのユーザーにとって`ingress`ネットワークをカスタマイズする必要はありません。
ただし設定を変更することは可能です。
たとえば自動的に設定されるサブネットが、ネットワーク上にすでにあるものとコンフリクトした場合には、設定が必要になります。
また MTU のような低レベルのネットワーク設定を行う場合にも必要です。
@z

@x
Customizing the `ingress` network involves removing and recreating it. This is
usually done before you create any services in the swarm. If you have existing
services which publish ports, those services need to be removed before you can
remove the `ingress` network.
@y
`ingress`ネットワークをカスタマイズするには、いったん削除して再生成することが必要です。
通常は Swarm 上にサービスを生成する前に、これを行います。
ポートを公開しているサービスがある場合は、`ingress`ネットワークを削除する前に、そのサービスを削除しておく必要があります。
@z

@x
During the time that no `ingress` network exists, existing services which do not
publish ports continue to function but are not load-balanced. This affects
services which publish ports, such as a WordPress service which publishes port
80.
@y
`ingress`ネットワークが存在していない間、ポートを公開していないサービスであれば機能しますが、ただし負荷分散は行われません。
この状況は、WordPress サービスのようにポート 80 を公開しているサービスに影響を及ぼします。
@z

@x
1.  Inspect the `ingress` network using `docker network inspect ingress`, and
    remove any services whose containers are connected to it. These are services
    that publish ports, such as a WordPress service which publishes port 80. If
    all such services are not stopped, the next step fails.
@y
1.  `docker network inspect ingress`を実行して`ingress`ネットワークを調べます。
    そして、これに接続しているコンテナーのサービスをすべて削除します。
    このサービスとは WordPress サービスにように、ポートを公開しているものです。
    こういったサービスを停止し忘れていると、次の作業が失敗します。
@z

@x
2.  Remove the existing `ingress` network:
@y
2.  既存の`ingress`ネットワークを削除します。
@z

@x
    ```console
    $ docker network rm ingress

    WARNING! Before removing the routing-mesh network, make sure all the nodes
    in your swarm run the same docker engine version. Otherwise, removal may not
    be effective and functionality of newly created ingress networks will be
    impaired.
    Are you sure you want to continue? [y/N]
    ```
@y
    ```console
    $ docker network rm ingress

    WARNING! Before removing the routing-mesh network, make sure all the nodes
    in your swarm run the same docker engine version. Otherwise, removal may not
    be effective and functionality of newly created ingress networks will be
    impaired.
    Are you sure you want to continue? [y/N]
    ```
@z

@x
3.  Create a new overlay network using the `--ingress` flag, along  with the
    custom options you want to set. This example sets the MTU to 1200, sets
    the subnet to `10.11.0.0/16`, and sets the gateway to `10.11.0.2`.
@y
3.  `--ingress`フラグを使って、新たなオーバーレイネットワークを生成します。
    カスタマイズしたいオプションがあれば設定しておきます。
    以下の例では MTU を 1200、サブネットを`10.11.0.0/16`、ゲートウェイを `10.11.0.2`にそれぞれ指定しています。
@z

@x
    ```console
    $ docker network create \
      --driver overlay \
      --ingress \
      --subnet=10.11.0.0/16 \
      --gateway=10.11.0.2 \
      --opt com.docker.network.driver.mtu=1200 \
      my-ingress
    ```
@y
    ```console
    $ docker network create \
      --driver overlay \
      --ingress \
      --subnet=10.11.0.0/16 \
      --gateway=10.11.0.2 \
      --opt com.docker.network.driver.mtu=1200 \
      my-ingress
    ```
@z

@x
    > **Note**: You can name your `ingress` network something other than
    > `ingress`, but you can only have one. An attempt to create a second one
    > fails.
@y
    > **メモ**
    >
    > 生成する`ingress`ネットワークの名前は`ingress`以外にすることも可能です。
    > ただし生成できるのは 1 つだけであり、2 つめを生成しようとしても失敗します。
@z

@x
4.  Restart the services that you stopped in the first step.
@y
4.  1 つめの手順で停止させていたサービスを再起動します。
@z

@x
### Customize the docker_gwbridge interface
@y
{: #customize-the-docker_gwbridge-interface }
### docker_gwbridge インターフェースのカスタマイズ
@z

@x
The `docker_gwbridge` is a virtual bridge that connects the overlay networks
(including the `ingress` network) to an individual Docker daemon's physical
network. Docker creates it automatically when you initialize a swarm or join a
Docker host to a swarm, but it is not a Docker device. It exists in the kernel
of the Docker host. If you need to customize its settings, you must do so before
joining the Docker host to the swarm, or after temporarily removing the host
from the swarm.
@y
`docker_gwbridge`は仮想ブリッジであり、（`ingress`ネットワークを含む）オーバーレイネットワークを、個々の Docker デーモンにおいて稼動する物理ネットワークに接続します。
Docker では、Swarm を初期化するとき、あるいは Docker ホストを Swarm に参加させるときに、この仮想ブリッジを自動生成します。
ただしこれは Docker のデバイスではありません。
Docker ホストのカーネル内に存在するものです。
これに対する設定が必要な場合は、Docker ホストを Swarm に参加させる前、あるいはホストを一時的に Swarm から削除してから設定を行う必要があります。
@z

@x
1.  Stop Docker.
@y
1.  Docker を停止します。
@z

@x
2.  Delete the existing `docker_gwbridge` interface.
@y
2.  既存の`docker_gwbridge`インターフェースを削除します。
@z

@x
    ```console
    $ sudo ip link set docker_gwbridge down
@y
    ```console
    $ sudo ip link set docker_gwbridge down
@z

@x
    $ sudo ip link del dev docker_gwbridge
    ```
@y
    $ sudo ip link del dev docker_gwbridge
    ```
@z

@x
3.  Start Docker. Do not join or initialize the swarm.
@y
3.  Docker を起動します。
    Swarm への参加、あるいは初期化は行いません。
@z

@x
4.  Create or re-create the `docker_gwbridge` bridge manually with your custom
    settings, using the `docker network create` command.
    This example uses the subnet `10.11.0.0/16`. For a full list of customizable
    options, see [Bridge driver options](../engine/reference/commandline/network_create.md#bridge-driver-options).
@y
4.  `docker_gwbridge`ブリッジへのカスタマイズを行った上で、これを手動で再生成します。
    これは`docker network create`コマンドを使って行います。
    以下の例では、サブネットを`10.11.0.0/16`に指定しています。
    カスタマイズ可能なオプションについては、[ブリッジドライバーのオプション](../engine/reference/commandline/network_create.md#bridge-driver-options) を参照してください。
@z

@x
    ```console
    $ docker network create \
    --subnet 10.11.0.0/16 \
    --opt com.docker.network.bridge.name=docker_gwbridge \
    --opt com.docker.network.bridge.enable_icc=false \
    --opt com.docker.network.bridge.enable_ip_masquerade=true \
    docker_gwbridge
    ```
@y
    ```console
    $ docker network create \
    --subnet 10.11.0.0/16 \
    --opt com.docker.network.bridge.name=docker_gwbridge \
    --opt com.docker.network.bridge.enable_icc=false \
    --opt com.docker.network.bridge.enable_ip_masquerade=true \
    docker_gwbridge
    ```
@z

@x
5.  Initialize or join the swarm. Since the bridge already exists, Docker does
    not create it with automatic settings.
@y
5.  Swarm の初期化、あるいは Swarm への参加を行います。
    ブリッジが存在するので、Docker は自動設定にもとづくブリッジの生成は行いません。
@z

@x
## Operations for swarm services
@y
{: #operations-for-swarm-services }
## Swarm サービスに対する操作
@z

@x
### Publish ports on an overlay network
@y
{: #publish-ports-on-an-overlay-network }
### オーバーレイネットワーク上でのポート公開
@z

@x
Swarm services connected to the same overlay network effectively expose all
ports to each other. For a port to be accessible outside of the service, that
port must be _published_ using the `-p` or `--publish` flag on `docker service
create` or `docker service update`. Both the legacy colon-separated syntax and
the newer comma-separated value syntax are supported. The longer syntax is
preferred because it is somewhat self-documenting.
@y
同一のオーバーレイネットワークに接続された Swarm サービスは、全ポートを互いに公開します。
外部のサービスからアクセス可能な 1 つのポートがあるなら、そのポートは`docker service create`や`docker service update`を実行するときの`-p`または`--publish`フラグを使って、**公開に** しておかなければなりません。
指定の際には、かつてのコロン区切りの文法と、最新のカンマ区切りによる文法がともにサポートされます。
わかりやすくするために、長い文法を用いることが好まれています。
@z

@x
<table>
<thead>
<tr>
<th>Flag value</th>
<th>Description</th>
</tr>
</thead>
<tr>
<td><tt>-p 8080:80</tt> or<br /><tt>-p published=8080,target=80</tt></td>
<td>Map TCP port 80 on the service to port 8080 on the routing mesh.</td>
</tr>
<tr>
<td><tt>-p 8080:80/udp</tt> or<br /><tt>-p published=8080,target=80,protocol=udp</tt></td>
<td>Map UDP port 80 on the service to port 8080 on the routing mesh.</td>
</tr>
<tr>
<td><tt>-p 8080:80/tcp -p 8080:80/udp</tt> or <br /><tt>-p published=8080,target=80,protocol=tcp -p published=8080,target=80,protocol=udp</tt></td>
<td>Map TCP port 80 on the service to TCP port 8080 on the routing mesh, and map UDP port 80 on the service to UDP port 8080 on the routing mesh.</td>
</tr>
</table>
@y
<table>
<thead>
<tr>
<th>フラグ値</th>
<th>内容説明</th>
</tr>
</thead>
<tr>
<td><tt>-p 8080:80</tt> または<br /><tt>-p published=8080,target=80</tt></td>
<td>サービス上の TCP ポート 80 をルーティングメッシュ上のポート 8080 にマッピングします。</td>
</tr>
<tr>
<td><tt>-p 8080:80/udp</tt> または<br /><tt>-p published=8080,target=80,protocol=udp</tt></td>
<td>サービス上の UDP ポート 80 をルーティングメッシュ上のポート 8080 にマッピングします。</td>
</tr>
<tr>
<td><tt>-p 8080:80/tcp -p 8080:80/udp</tt> または<br /><tt>-p published=8080,target=80,protocol=tcp -p published=8080,target=80,protocol=udp</tt></td>
<td>サービス上の TCP ポート 80 をルーティングメッシュ上のポート 8080 にマッピングします。
またサービス上の UDP ポート 80 をルーティングメッシュ上のポート 8080 にマッピングします。</td>
</tr>
</table>
@z

@x
### Bypass the routing mesh for a swarm service
@y
{: #bypass-the-routing-mesh-for-a-swarm-service }
### Swarm サービスにおけるルーティングメッシュの停止
@z

@x
By default, swarm services which publish ports do so using the routing mesh.
When you connect to a published port on any swarm node (whether it is running a
given service or not), you are redirected to a worker which is running that
service, transparently. Effectively, Docker acts as a load balancer for your
swarm services. Services using the routing mesh are running in _virtual IP (VIP)
mode_. Even a service running on each node (by means of the `--mode global`
flag) uses the routing mesh. When using the routing mesh, there is no guarantee
about which Docker node services client requests.
@y
ポートを公開している Swarm サービスは、デフォルトでルーティングメッシュ（routing mesh）を利用します。
Swarm ノードのいずれかの公開ポートに接続すると（指定のサービスが動作しているかどうかには関係なく）、そのサービスが動作しているワーカーノードにリダイレクトされます。
Swarm サービスに対して、Docker が効率よくロードバランサーのように動作します。
ルーティングメッシュを利用するサービスは、**仮想 IP モード**（virtual IP mode）として稼動します。
各ノード上に稼動する別サービスであっても（`--mode global`フラグにより）ルーティングメッシュを利用します。
ルーティングメッシュを利用した場合、クライアントが要求するノードサービスがどれになるかは保証されません。
@z

@x
To bypass the routing mesh, you can start a service using _DNS Round Robin
(DNSRR) mode_, by setting the `--endpoint-mode` flag to `dnsrr`. You must run
your own load balancer in front of the service. A DNS query for the service name
on the Docker host returns a list of IP addresses for the nodes running the
service. Configure your load balancer to consume this list and balance the
traffic across the nodes.
@y
ルーティングメッシュを停止するには、サービスを **DNS ラウンドロビン**（DNS Round Robin; DNSRR）モードで起動します。
これは `--endpoint-mode`に`dnsrr`を設定することで実現します。
サービスに対しては独自にロードバランサーを稼動させる必要があります。
Docker ホスト上のサービス名に対する DNS 問い合わせは、サービスを実行しているノードの IP アドレス一覧を返します。
ロードバランサーがこの一覧を解釈し、ノード間のトラフィックを調整するように設定を行ってください。
@z

@x
### Separate control and data traffic
@y
{: #separate-control-and-data-traffic }
### 制御情報とデータのトラフィック分離
@z

@x
By default, control traffic relating to swarm management and traffic to and from
your applications runs over the same network, though the swarm control traffic
is encrypted. You can configure Docker to use separate network interfaces for
handling the two different types of traffic. When you initialize or join the
swarm, specify `--advertise-addr` and `--datapath-addr` separately. You must do
this for each node joining the swarm.
@y
Swarm の管理に関連する制御情報のトラフィックと、アプリケーションの動作において発生するトラフィックは、同じネットワーク上でやりとりされます。
なお Swarm の制御情報トラフィックは暗号化されています。
Docker では、この異なる種類のトラフィックを、別々のネットワークインターフェースに分けて取り扱う設定が可能です。
Swarm の初期化時あるいは Swarm への参加時に`--advertise-addr`、`--datapath-addr`をそれぞれ指定します。
Swarm に参加させるノードに対しては、必ずこれを行わなければなりません。
@z

@x
## Operations for standalone containers on overlay networks
@y
{: #operations-for-standalone-containers-on-overlay-networks }
## オーバーレイネットワーク上のスタンドアロンコンテナーに対する操作
@z

@x
### Attach a standalone container to an overlay network
@y
{: #attach-a-standalone-container-to-an-overlay-network }
### オーバーレイネットワークへのスタンドアロンコンテナーのアタッチ
@z

@x
The `ingress` network is created without the `--attachable` flag, which means
that only swarm services can use it, and not standalone containers. You can
connect standalone containers to user-defined overlay networks which are created
with the `--attachable` flag. This gives standalone containers running on
different Docker daemons the ability to communicate without the need to set up
routing on the individual Docker daemon hosts.
@y
`ingress`ネットワークを`--attachable`フラグの指定をせずに生成すると、Swarm サービスだけがこれを利用できるようになり、スタンドアロンコンテナーは利用できません。
スタンドアロンコンテナーの場合は、ユーザー定義のオーバーレイネットワークを`--attachable`フラグにより生成すれば、接続ができます。
このようにすれば、スタンドアロンコンテナーを、さまざまな Docker デーモン上に起動させることが可能であり、
個別のデーモンホスト上にルーティングを設定することなく、通信が行えるようになります。
@z

@x
### Publish ports
@y
{: #publish-ports }
### 公開ポート
@z

@x
| Flag value                      | Description                                                                                                                                     |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| `-p 8080:80`                    | Map TCP port 80 in the container to port 8080 on the overlay network.                                                                               |
| `-p 8080:80/udp`                | Map UDP port 80 in the container to port 8080 on the overlay network.                                                                               |
| `-p 8080:80/sctp`               | Map SCTP port 80 in the container to port 8080 on the overlay network.                                                                              |
| `-p 8080:80/tcp -p 8080:80/udp` | Map TCP port 80 in the container to TCP port 8080 on the overlay network, and map UDP port 80 in the container to UDP port 8080 on the overlay network. |
@y
| フラグ値                        | 内容説明                                                                                                                                        |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| `-p 8080:80`                    | コンテナー上の TCP ポート 80 をオーバーレイネットワーク上のポート 8080 にマッピングします。                                                     |
| `-p 8080:80/udp`                | コンテナー上の UDP ポート 80 をオーバーレイネットワーク上のポート 8080 にマッピングします。                                                     |
| `-p 8080:80/sctp`               | コンテナー上の SCTP ポート 80 をオーバーレイネットワーク上のポート 8080 にマッピングします。                                                   |
| `-p 8080:80/tcp -p 8080:80/udp` | コンテナー上の TCP ポート 80 をオーバーレイネットワーク上のポート 8080 にマッピングします。またコンテナー上の UDP ポート 80 をオーバーレイネットワーク上のポート 8080 にマッピングします。|
@z

@x
### Container discovery
@y
{: #container-discovery }
### コンテナーの検出
@z

@x
For most situations, you should connect to the service name, which is load-balanced and handled by all containers ("tasks") backing the service. To get a list of all tasks backing the service, do a DNS lookup for `tasks.<service-name>.`
@y
接続先を指定するには、たいていの場合サービス名を用います。
サービスが負荷分散されていたり、サービスのもとにあるコンテナー（「タスク」）のすべてによって取り扱われていたりするからです。
サービスのもとにあるタスク全一覧を取得するには、`tasks.<サービス名>`に対して DNS 問い合わせを行ってください。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
- Go through the [overlay networking tutorial](network-tutorial-overlay.md)
- Learn about [networking from the container's point of view](../config/containers/container-networking.md)
- Learn about [standalone bridge networks](bridge.md)
- Learn about [Macvlan networks](macvlan.md)
@y
- [オーバーレイネットワークのチュートリアル](network-tutorial-overlay.md) をひととおり読んでください。
- [コンテナーから見たネットワーク](../config/containers/container-networking.md) について。
- [スタンドアロンブリッジネットワーク](bridge.md) について。
- [Macvlan ネットワーク](macvlan.md) について。
@z
