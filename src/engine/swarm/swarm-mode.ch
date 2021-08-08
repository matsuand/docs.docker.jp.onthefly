%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Run Docker Engine in swarm mode
keywords: guide, swarm mode, node
title: Run Docker Engine in swarm mode
---
@y
---
description: Run Docker Engine in swarm mode
keywords: guide, swarm mode, node
title: Docker Engine の Swarm モード実行
---
@z

@x
When you first install and start working with Docker Engine, swarm mode is
disabled by default. When you enable swarm mode, you work with the concept of
services managed through the `docker service` command.
@y
Docker Engine を初めてインストールして起動した状態では、Swarm モードはデフォルトで無効になっています。
Swarm モードを有効にすると、`docker service`コマンドを通じて管理される、サービスという考え方に従って操作していきます。
@z

@x
There are two ways to run the Engine in swarm mode:
@y
Engine を Swarm モードで実行するには 2 つの方法があります。
@z

@x
* Create a new swarm, covered in this article.
* [Join an existing swarm](join-nodes.md).
@y
* 新たな Swarm を生成します。本文で取り扱います。
* [既存 Swarm への参加](join-nodes.md) を行います。
@z

@x
When you run the Engine in swarm mode on your local machine, you can create and
test services based upon images you've created or other available images. In
your production environment, swarm mode provides a fault-tolerant platform with
cluster management features to keep your services running and available.
@y
ローカルマシン上において Engine を Swarm モードで実行すれば、自分で生成したイメージや他から入手したイメージに基づいて、サービスの生成と確認を行うことができます。
本番環境においては Swarm モードにより、クラスター管理機能を有するフォールトトレラントなプラットフォームを提供し、そこにサービスを実行して利用することができます。
@z

@x
These instructions assume you have installed the Docker Engine 1.12 or later on
a machine to serve as a manager node in your swarm.
@y
ここに示す手順においては Docker Engine 1.12 またはそれ以降がマシンにインストール済であって、Swarm のマネージャーノードとすることができるものとします。
@z

@x
If you haven't already, read through the [swarm mode key concepts](key-concepts.md)
and try the [swarm mode tutorial](swarm-tutorial/index.md).
@y
準備ができていない場合は [Swarm モードの重要な考え方](key-concepts.md) を一読して、[Swarm モードをはじめる](swarm-tutorial/index.md) を試してみてください。
@z

@x
## Create a swarm
@y
{: #create-a-swarm }
## Swarm の生成
@z

@x
When you run the command to create a swarm, the Docker Engine starts running in swarm mode.
@y
Swarm を生成するコマンドを実行すると、Docker Engine が Swarm モードとして起動します。
@z

@x
Run [`docker swarm init`](../reference/commandline/swarm_init.md)
to create a single-node swarm on the current node. The Engine sets up the swarm
as follows:
@y
[`docker swarm init`](../reference/commandline/swarm_init.md) コマンドを実行すると、現在のノード上に、単一ノードからなる Swarm が生成されます。
Engine は以下のようにして Swarm を作り出します。
@z

@x
* switches the current node into swarm mode.
* creates a swarm named `default`.
* designates the current node as a leader manager node for the swarm.
* names the node with the machine hostname.
* configures the manager to listen on an active network interface on port 2377.
* sets the current node to `Active` availability, meaning it can receive tasks
from the scheduler.
* starts an internal distributed data store for Engines participating in the
swarm to maintain a consistent view of the swarm and all services running on it.
* by default, generates a self-signed root CA for the swarm.
* by default, generates tokens for worker and manager nodes to join the
swarm.
* creates an overlay network named `ingress` for publishing service ports
external to the swarm.
* creates an overlay default IP addresses and subnet mask for your networks
@y
* 現在のノードを Swarm モードに切り替えます。
* `default`という名前の Swarm を生成します。
* 現在のノードを、Swarm におけるマネージャーノードのリーダーとします。
* ノードの名前をマシンホスト名にします。
* マネージャーがアクティブなネットワークインターフェースのポート 2377 を待ち受けるように設定します。
* 現在のノードの利用状態（availability）を`Active`に設定します。これはスケジューラーからのタスク受け入れを可能にすることを意味します。
* 内部分散データストアの利用を開始します。これは Swarm 内に Engine を参加させ、Swarm の一貫した参照を実現するとともに、すべてのサービスをここで実行します。
* デフォルトで、自己署名のルート CA を Swarm 用に生成します。
* Swarm への参加のために、デフォルトでワーカーノードとマネージャーノードのトークンを生成します。
* `ingress`という名前の overlay ネットワークを生成し、Swarm 外部に向けてサービスポートを公開します。
* overlay のデフォルト IP アドレスとサブネットマスクを生成します。
@z

@x
The output for `docker swarm init` provides the connection command to use when
you join new worker nodes to the swarm:
@y
`docker swarm init`コマンドの出力結果には、Swarm にワーカーノードを参加させるための接続コマンドが表示されます。
@z

@x
```console
$ docker swarm init
Swarm initialized: current node (dxn1zf6l61qsb1josjja83ngz) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin1">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese1">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin1" class="tab-pane fade in active">
{% capture original-content %}
```console
$ docker swarm init
Swarm initialized: current node (dxn1zf6l61qsb1josjja83ngz) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese1" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm init
Swarm が初期化されました: カレントノード (dxn1zf6l61qsb1josjja83ngz) がマネージャーになりました。

この Swarm にワーカーを追加するには、以下のコマンドを実行してください。

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377

この Swarm にマネージャーを追加するには 'docker swarm join-token manager' を実行し、
以下の手順に従ってください。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
### Configuring default address pools
@y
{: #configuring-default-address-pools }
### デフォルトのアドレスプールの設定
@z

@x
By default Docker Swarm uses a default address pool `10.0.0.0/8` for global scope (overlay) networks. Every 
network that does not have a subnet specified will have a subnet sequentially allocated from this pool. In 
some circumstances it may be desirable to use a different default IP address pool for networks. 
@y
Docker Swarm はグローバルスコープの（overlay）ネットワークにおいて、デフォルトのアドレスプール`10.0.0.0/8`を利用します。
ネットワークにサブネットが指定されていない場合、サブネットがこのプールから順次割り当てられます。
場合によっては、ネットワークに対してのデフォルトアドレスプールを別の値にしたくなることもあります。
@z

@x
For example, if the default `10.0.0.0/8` range conflicts with already allocated address space in your network, 
then it is desirable to ensure that networks use a different range without requiring Swarm users to specify 
each subnet with the `--subnet` command. 
@y
たとえば、このデフォルトの`10.0.0.0/8`によるアドレス範囲が、すでにネットワーク内に割り当てたアドレス空間と衝突するとします。
そんなときに Swarm のユーザーがわざわざ`--subnet`コマンドを指定しなくても、ネットワークが異なるアドレス範囲を選んでくれるのがありがたいところです。
@z

@x
To configure custom default address pools, you must define pools at Swarm initialization using the 
`--default-addr-pool` command line option. This command line option uses CIDR notation for defining the subnet mask.
To create the custom address pool for Swarm, you must define at least one default address pool, and an optional default address pool subnet mask. For example, for the `10.0.0.0/27`, use the value `27`.
@y
そこで独自にデフォルトのアドレスプールを設定するためには、Swarm の初期化にあたってコマンドラインオプション`--default-addr-pool`を使って、アドレスプールを定義することが必要です。
このオプションは CIDR 記法によりサブネットマスクを定義します。
Swarm に対する独自のアドレスプールを生成するには、最低でも 1 つのデフォルトアドレスプールの定義が必要であり、任意の定義としてデフォルトアドレスプールのサブネットマスクを指定します。
これはたとえば`10.0.0.0/27`においては`27`という値を設定するということです。
@z

@x
Docker allocates subnet addresses from the address ranges specified by the `--default-addr-pool` option. For example, a command line option `--default-addr-pool 10.10.0.0/16` indicates that Docker will allocate subnets from that `/16` address range. If `--default-addr-pool-mask-len` were unspecified or set explicitly to 24, this would result in 256 `/24` networks of the form `10.10.X.0/24`.
@y
Docker は`--default-addr-pool`オプションによってアドレス範囲が指定されると、そこからサブネットアドレスを割り当てます。
たとえばコマンドラインから`--default-addr-pool 10.10.0.0/16`を指定すると、`/16`で示されるアドレス範囲からサブネットを割り当てていきます。
`--default-addr-pool-mask-len`が指定されていないか、あるいは明示的に 24 に設定されている場合、`10.10.X.0/24`の形式で表わされる 256 個の`/24`ネットワークが作られることになります。
@z

@x
The subnet range comes from the `--default-addr-pool`, (such as `10.10.0.0/16`). The size of 16 there represents the number of networks one can create within that `default-addr-pool` range. The `--default-addr-pool` option may occur multiple times with each option providing additional addresses for docker to use for overlay subnets.
@y
サブネットの範囲は`--default-addr-pool`により定まります（たとえば`10.10.0.0/16`）。
ここで 16 というサイズは、`default-addr-pool`の範囲内に生成できるネットワーク数を表わします。
この`--default-addr-pool`オプションは、オーバーレイサブネットの利用の際には、それぞれのアドレスを設定するオプションごとに複数回指定することもあります。
@z

@x
The format of the command is:
@y
コマンドの書式は以下のようになります。
@z

@x
```console
$ docker swarm init --default-addr-pool <IP range in CIDR> [--default-addr-pool <IP range in CIDR> --default-addr-pool-mask-length <CIDR value>]
```
@y
```console
$ docker swarm init --default-addr-pool <IP range in CIDR> [--default-addr-pool <IP range in CIDR> --default-addr-pool-mask-length <CIDR value>]
```
@z

@x
To create a default IP address pool with a /16 (class B) for the 10.20.0.0 network looks like this:
@y
デフォルトアドレスプールとして、10.20.0.0 のネットワークに対し /16（クラス B）を生成するには、以下のように指定します。
@z

@x
```console
$ docker swarm init --default-addr-pool 10.20.0.0/16
```
@y
```console
$ docker swarm init --default-addr-pool 10.20.0.0/16
```
@z

@x
To create a default IP address pool with a `/16` (class B) for the `10.20.0.0` and `10.30.0.0` networks, and to 
create a subnet mask of `/26` for each network looks like this:
@y
デフォルトアドレスプールとして`10.20.0.0`と`10.30.0.0`のネットワークに対し /16（クラス B）、また各ネットワークのサブネットマスクとして`/26`を生成するには、以下のように指定します。
@z

@x
```console
$ docker swarm init --default-addr-pool 10.20.0.0/16 --default-addr-pool 10.30.0.0/16 --default-addr-pool-mask-length 26
```
@y
```console
$ docker swarm init --default-addr-pool 10.20.0.0/16 --default-addr-pool 10.30.0.0/16 --default-addr-pool-mask-length 26
```
@z

@x
In this example, `docker network create -d overlay net1` will result in `10.20.0.0/26` as the allocated subnet for `net1`, 
and `docker network create -d overlay net2` will result in `10.20.0.64/26` as the allocated subnet for `net2`. This continues until 
all the subnets are exhausted. 
@y
この例から`docker network create -d overlay net1`を実行すると、`net1`に対して割り当てられるサブネットが`10.20.0.0/26`になり、`docker network create -d overlay net2`を実行すると、`net2`に対して`10.20.0.64/26`が割り当てられます。
サブネットを使い切るまでこれが続きます。
@z

@x
Refer to the following pages for more information:
- [Swarm networking](./networking.md) for more information about the default address pool usage
- `docker swarm init` [CLI reference](../reference/commandline/swarm_init.md) for more detail on the `--default-addr-pool` flag.
@y
詳しくは以下のページを参照してください。
- デフォルトアドレスプールの利用に関する情報は [Swarm のネットワーク](./networking.md) を参照してください。
- `--default-addr-pool`フラグの詳細は [CLI リファレンス](../reference/commandline/swarm_init.md) の`docker swarm init`を参照してください。
@z

@x
### Configure the advertise address
@y
{: #configure-the-advertise-address }
### advertise アドレスの設定
@z

@x
Manager nodes use an advertise address to allow other nodes in the swarm access
to the Swarmkit API and overlay networking. The other nodes on the swarm must be
able to access the manager node on its advertise address.
@y
マネージャーノードは advertise アドレスを利用します。
Swarm 内の他のノードは、これを使って Swarmkit API や overlay ネットワーク機能へのアクセスができるようになります。
Swarm 上の他のノードは、マネージャーノードへはこの advertise アドレスを使ってアクセスできなければなりません。
@z

@x
If you don't specify an advertise address, Docker checks if the system has a
single IP address. If so, Docker uses the IP address with the listening port
`2377` by default. If the system has multiple IP addresses, you must specify the
correct `--advertise-addr` to enable inter-manager communication and overlay
networking:
@y
advertise アドレスを指定しなかった場合、Docker はシステムが単一の IP アドレスを利用しているかどうかを確認します。
単一であれば、Docker はその IP アドレスを利用し、待ち受けるポートをデフォルトで`2377`とします。
システムに複数の IP アドレスがある場合は、適切に`--advertise-addr`を設定して、マネージャー間通信やオーバーレイネットワーク機能を有効にすることが必要です。
@z

@x
```console
$ docker swarm init --advertise-addr <MANAGER-IP>
```
@y
```console
$ docker swarm init --advertise-addr <MANAGER-IP>
```
@z

@x
You must also specify the `--advertise-addr` if the address where other nodes
reach the first manager node is not the same address the manager sees as its
own. For instance, in a cloud setup that spans different regions, hosts have
both internal addresses for access within the region and external addresses that
you use for access from outside that region. In this case, specify the external
address with `--advertise-addr` so that the node can propagate that information
to other nodes that subsequently connect to it.
@y
ノードが最初に到達したマネージャーノードのアドレスと、そのマネージャーが自分のアドレスとして把握しているアドレスが同一とならない場合は、`--advertise-addr`の指定が必要になります。
たとえばクラウドとして、さまざまな地域にわたる設定があったとします。
つまりホストの設定として、特定リージョン内でのアクセスに用いる内部アドレスと、そのリージョン外からアクセスするために用いる外部アドレスを持つものとします。
このような場合は外部アドレスを`--advertise-addr`を使って指定することで、ノードから次のノードに向けてその情報を伝えられるようになります。
@z

@x
Refer to the `docker swarm init` [CLI reference](../reference/commandline/swarm_init.md)
for more detail on the advertise address.
@y
advertise アドレスに関する詳細は [CLI リファレンス](../reference/commandline/swarm_init.md) の`docker swarm init`を参照してください。
@z

@x
### View the join command or update a swarm join token
@y
{: #view-the-join-command-or-update-a-swarm-join-token }
### join コマンドの表示と参加トークンの更新
@z

@x
Nodes require a secret token to join the swarm. The token for worker nodes is
different from the token for manager nodes. Nodes only use the join-token at the
moment they join the swarm. Rotating the join token after a node has already
joined a swarm does not affect the node's swarm membership. Token rotation
ensures an old token cannot be used by any new nodes attempting to join the
swarm.
@y
ノードを Swarm に参加させる際にはシークレットトークンが必要になります。
このトークンは、ワーカーノード用とマネージャーノード用では異なります。
ノードは Swarm に参加する際に、参加トークン（join-token）を使うだけです。
参加トークンはローテートされますが、これが発生しても、参加済みのノードにとって参加状態には何ら影響しません。
トークンのローテートがあるので、古いトークンを使って別のノードが参加しようとしてもそれはできなくなります。
@z

@x
To retrieve the join command including the join token for worker nodes, run:
@y
ワーカーノード用に、参加トークンの表示も込みで join コマンドを表示するには、以下を実行します。
@z

@x
```console
$ docker swarm join-token worker

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377

This node joined a swarm as a worker.
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin2">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese2">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin2" class="tab-pane fade in active">
{% capture original-content %}
```console
$ docker swarm join-token worker

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377

This node joined a swarm as a worker.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese2" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm join-token worker

Swarm にワーカーを追加するには、以下のコマンドを実行してください。

    docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377

このノードは Swarm に対してワーカーとして参加します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
To view the join command and token for manager nodes, run:
@y
マネージャーノード用の join コマンドとトークンを表示するには、以下を実行します。
@z

@x
```console
$ docker swarm join-token manager

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-59egwe8qangbzbqb3ryawxzk3jn97ifahlsrw01yar60pmkr90-bdjfnkcflhooyafetgjod97sz \
    192.168.99.100:2377
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin3">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese3">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin3" class="tab-pane fade in active">
{% capture original-content %}
```console
$ docker swarm join-token manager

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-59egwe8qangbzbqb3ryawxzk3jn97ifahlsrw01yar60pmkr90-bdjfnkcflhooyafetgjod97sz \
    192.168.99.100:2377
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese3" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm join-token manager

Swarm にマネージャーを追加するには、以下のコマンドを実行してください。

    docker swarm join \
    --token SWMTKN-1-59egwe8qangbzbqb3ryawxzk3jn97ifahlsrw01yar60pmkr90-bdjfnkcflhooyafetgjod97sz \
    192.168.99.100:2377
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Pass the `--quiet` flag to print only the token:
@y
`--quiet`フラグを指定するとトークンのみが表示されます。
@z

@x
```console
$ docker swarm join-token --quiet worker

SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c
```
@y
```console
$ docker swarm join-token --quiet worker

SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c
```
@z

@x
Be careful with the join tokens because they are the secrets necessary to join
the swarm. In particular, checking a secret into version control is a bad
practice because it would allow anyone with access to the application source
code to add new nodes to the swarm. Manager tokens are especially sensitive
because they allow a new manager node to join and gain control over the whole
swarm.
@y
参加トークンの取り扱いには注意してください。
これは Swarm への参加時に必要となる機密情報です。
したがって特に、この機密情報をバージョン管理システムに含めることは、誤ったやり方になります。
それを行ってしまうと、アプリケーションコードにアクセスできる者なら誰でも、Swarm へのノード追加を自由にできてしまいます。
マネージャー用のトークンはさらに重要です。
これがあれば新たなマネージャーノードを追加して、Swarm 全体の制御を奪われてしまうということです。
@z

@x
We recommend that you rotate the join tokens in the following circumstances:
@y
参加トークンは、以下のような状況になったらローテートすることをお勧めします。
@z

@x
* If a token was checked-in by accident into a version control system, group
chat or accidentally printed to your logs.
* If you suspect a node has been compromised.
* If you wish to guarantee that no new nodes can join the swarm.
@y
* トークンを誤ってバージョン管理システム、グループチャット、ログに出力してしまった場合。
* ノードが被害を受けたと疑われる場合。
* 新たなノードが参加できない状況を確実に作り出したい場合。
@z

@x
Additionally, it is a best practice to implement a regular rotation schedule for
any secret including swarm join tokens. We recommend that you rotate your tokens
at least every 6 months.
@y
さらに Swarm の参加トークンを含めた機密情報は、定期的にローテートするようにスケジュールすることが大切です。
トークンのローテートは、少なくとも 6 ヶ月に 1 回行うことをお勧めします。
@z

@x
Run `swarm join-token --rotate` to invalidate the old token and generate a new
token. Specify whether you want to rotate the token for `worker` or `manager`
nodes:
@y
`swarm join-token --rotate`を実行すれば、それまでのトークンを無効化して、新たなトークンを生成します。
実行にあたっては`worker`、`manager`のいずれのノード用のトークンをローテートするかを指定します。
@z

@x
```console
$ docker swarm join-token  --rotate worker

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-2kscvs0zuymrsc9t0ocyy1rdns9dhaodvpl639j2bqx55uptag-ebmn5u927reawo27s3azntd44 \
    192.168.99.100:2377
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin4">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese4">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin4" class="tab-pane fade in active">
{% capture original-content %}
```console
$ docker swarm join-token  --rotate worker

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-2kscvs0zuymrsc9t0ocyy1rdns9dhaodvpl639j2bqx55uptag-ebmn5u927reawo27s3azntd44 \
    192.168.99.100:2377
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese4" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ docker swarm join-token  --rotate worker

Swarm にワーカーを追加するには、以下のコマンドを実行してください。

    docker swarm join \
    --token SWMTKN-1-2kscvs0zuymrsc9t0ocyy1rdns9dhaodvpl639j2bqx55uptag-ebmn5u927reawo27s3azntd44 \
    192.168.99.100:2377
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
## Learn more
@y
{: #learn-more }
## さらに詳しく
@z

@x
* [Join nodes to a swarm](join-nodes.md)
* `swarm init` [command line reference](../reference/commandline/swarm_init.md)
* [Swarm mode tutorial](swarm-tutorial/index.md)
@y
* [Swarm へのノード参加](join-nodes.md)
* [コマンドラインリファレンス](../reference/commandline/swarm_init.md) の`swarm init`
* [Swarm モードチュートリアル](swarm-tutorial/index.md)
@z
