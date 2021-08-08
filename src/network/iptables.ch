%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker and iptables
description: The basics of how Docker works with iptables
keywords: network, iptables
---
@y
---
title: Docker と iptables
description: Docker と iptables がどのように動作するか、その基本を説明します。
keywords: network, iptables
---
@z

@x
On Linux, Docker manipulates `iptables` rules to provide network isolation.
While this is an implementation detail and you should not modify the rules
Docker inserts into your `iptables` policies, it does have some implications
on what you need to do if you want to have your own policies in addition to
those managed by Docker.
@y
Linux 上において Docker は`iptables`ルールを利用して、ネットワークを分離します。
このことは実装に関わることであって、Docker が`iptables`ポリシーに挿入するルールを修正するべきではありません。
Docker が管理するポリシーとは別に、独自のポリシーを追加しようとする場合は、そこには重要な観点がいくつかあります。
@z

@x
If you're running Docker on a host that is exposed to the Internet, you will
probably want to have iptables policies in place that prevent unauthorized
access to containers or other services running on your host. This page
describes how to achieve that, and what caveats you need to be aware of.
@y
Docker を起動するホストがインターネットに接続しているとします。
その場合は、ホスト上で稼動するコンテナーや他のサービスに対しての不正アクセスを防止するような iptables ポリシーを設定したいはずです。
ここではそれをどのように実現するか、そしてどこに気をつけるべきかを説明します。
@z

@x
## Add iptables policies before Docker's rules
@y
{: #add-iptables-policies-before-dockers-rules }
## Docker ルール前への iptables ポリシー追加
@z

@x
Docker installs two custom iptables chains named `DOCKER-USER` and `DOCKER`,
and it ensures that incoming packets are always checked by these two chains
first.
@y
Docker は`DOCKER-USER`、`DOCKER`という独自の iptables チェーンをインストールします。
これによって受信パケットは、常にこの 2 つのチェーンによって最初にチェックが行われます。
@z

@x
All of Docker's `iptables` rules are added to the `DOCKER` chain. Do not
manipulate this chain manually. If you need to add rules which load before
Docker's rules, add them to the `DOCKER-USER` chain. These rules are applied
before any rules Docker creates automatically.
@y
Docker の`iptables`ルールはすべて、この`DOCKER`チェーンに追加されます。
このチェーンを手動で操作してはなりません。
Docker のルールよりも前にロードしたいルールがある場合は、`DOCKER-USER`チェーンにそのルールを追加します。
こういったルールは、Docker が自動生成するどのルールよりも先に適用されます。
@z

@x
Rules added to the `FORWARD` chain -- either manually, or by another
iptables-based firewall -- are evaluated _after_ these chains. This means that
if you expose a port through Docker, this port gets exposed no matter what
rules your firewall has configured. If you want those rules to apply even
when a port gets exposed through Docker, you _must_ add these rules to the
`DOCKER-USER` chain.
@y
`FORWARD`チェーンに追加されたルールは、手動によるもの、あるいは iptables ベースのファイアウォールによるものであっても、Docker のチェーンの後で評価されます。
これが何を意味するかといえば、Docker によってポートを公開したら、ファイアウォールでどのような設定を行っていても、そのポートは必ず公開されるということです。
Docker によってポートを公開している状態で、ファイアウォールによるルールを適用したい場合は、そのルールを`DOCKER-USER`チェーンに追加しなければ **なりません**。
@z

@x
### Restrict connections to the Docker host
@y
{: #restrict-connections-to-the-docker-host }
### Docker ホストへの接続制限
@z

@x
By default, all external source IPs are allowed to connect to the Docker host.
To allow only a specific IP or network to access the containers, insert a
negated rule at the top of the `DOCKER-USER` filter chain. For example, the
following rule restricts external access from all IP addresses except `192.168.1.1`:
@y
外部のソース IP は、Docker ホストに対する接続がデフォルトですべて許可されます。
コンテナーへの接続を特定の IP やネットワークのみとする場合は、`DOCKER-USER`フィルターチェーンの上位に、除外ルールを設定します。
たとえば以下のルールは、`192.168.1.1`は除く残りの IP アドレスからの外部アクセスを制限します。
@z

@x
```console
$ iptables -I DOCKER-USER -i ext_if ! -s 192.168.1.1 -j DROP
```
@y
```console
$ iptables -I DOCKER-USER -i ext_if ! -s 192.168.1.1 -j DROP
```
@z

@x
Please note that you will need to change `ext_if` to correspond with your
host's actual external interface. You could instead allow connections from a
source subnet. The following rule only allows access from the subnet `192.168.1.0/24`:
@y
`ext_if`の部分は、利用するホストの実際の外部インターフェースに合わせて変更することを忘れないでください。
このかわりに、ソースサブネットからの接続を許可する方法もあります。
以下のルールは、サブネット`192.168.1.0/24`からのアクセスのみ許可します。
@z

@x
```console
$ iptables -I DOCKER-USER -i ext_if ! -s 192.168.1.0/24 -j DROP
```
@y
```console
$ iptables -I DOCKER-USER -i ext_if ! -s 192.168.1.0/24 -j DROP
```
@z

@x
Finally, you can specify a range of IP addresses to accept using `--src-range`
(Remember to also add `-m iprange` when using `--src-range` or `--dst-range`):
@y
また`--src-range`を使えば、アクセスを許可する IP アドレスを範囲指定することができます。
（`--src-range`や`--dst-range`を用いる際には、`-m iprange`を合わせて指定する必要があります。）
@z

@x
```console
$ iptables -I DOCKER-USER -m iprange -i ext_if ! --src-range 192.168.1.1-192.168.1.3 -j DROP
```
@y
```console
$ iptables -I DOCKER-USER -m iprange -i ext_if ! --src-range 192.168.1.1-192.168.1.3 -j DROP
```
@z

@x
You can combine `-s` or `--src-range` with `-d` or `--dst-range` to control both
the source and destination. For instance, if the Docker daemon listens on both
`192.168.1.99` and `10.1.2.3`, you can make rules specific to `10.1.2.3` and leave
`192.168.1.99` open.
@y
`-s`あるいは`--src-range`と`-d`あるいは`--dst-range`を組み合わせて、ソース、デスティネーションの双方を制御することができます。
たとえば Docker デーモンが`192.168.1.99`と`10.1.2.3`を待ち受けている場合、`10.1.2.3`を指定するルールを生成し、`192.168.1.99`をそのまま残すようにします。
@z

@x
`iptables` is complicated and more complicated rules are out of scope for this
topic. See the [Netfilter.org HOWTO](https://www.netfilter.org/documentation/HOWTO/NAT-HOWTO.html)
for a lot more information.
@y
`iptables`は複雑なものであり、`iptables`ルールはさらに複雑であることから、ここでの説明範囲を超えます。
より詳しくは [Netfilter.org HOWTO](https://www.netfilter.org/documentation/HOWTO/NAT-HOWTO.html) を参照してください。
@z

@x
## Docker on a router
@y
{: #docker-on-a-router }
## ルーター上の Docker
@z

@x
Docker also sets the policy for the `FORWARD` chain to `DROP`. If your Docker
host also acts as a router, this will result in that router not forwarding
any traffic anymore. If you want your system to continue functioning as a
router, you can add explicit `ACCEPT` rules to the `DOCKER-USER` chain to
allow it:
@y
Docker では`FORWARD`チェーンに対して`DROP`も設定します。
Docker ホストがルーターとしても動作している場合、ルーターはもはや、どのトラフィックもフォワードしないということになります。
システム内においてルーターとしての機能を維持したい場合は、`DOCKER-USER`チェーンに明示的に`ACCEPT`ルールを追加して、これを許可するようにします。
@z

@x
```console
$ iptables -I DOCKER-USER -i src_if -o dst_if -j ACCEPT
```
@y
```console
$ iptables -I DOCKER-USER -i src_if -o dst_if -j ACCEPT
```
@z

@x
## Prevent Docker from manipulating iptables
@y
{: #prevent-docker-from-manipulating-iptables }
## Docker による iptables 操作の防止
@z

@x
It is possible to set the `iptables` key to `false` in the Docker engine's configuration file at `/etc/docker/daemon.json`, but this option is not appropriate for most users.  It is not possible to completely prevent Docker from creating `iptables` rules, and creating them after-the-fact is extremely involved and beyond the scope of these instructions. Setting `iptables` to `false` will more than likely break container networking for the Docker engine.
@y
Docker Engine の設定ファイル`/etc/docker/daemon.json`において、`iptables`キーを`false`に設定することができますが、たいていのユーザーにとって、これを行うのは適切ではありません。
Docker が`iptables`ルールを作らないようにすることは、完全にはできません。
生成されるルールは非常に複雑なものであり、ここでの説明の範囲を超えています。
`iptables`に`false`を設定すると、Docker Engine におけるコンテナーネットワーク機能が壊れる可能性が高くなります。
@z

@x
For system integrators who wish to build the Docker runtime into other applications, explore the [`moby` project](https://mobyproject.org/).
@y
システムインテグレーターの方が、別のアプリケーション内に Docker ランタイムを含めてビルドしたい場合は、[`moby`プロジェクト](https://mobyproject.org/) を調べてみてください。
@z

@x
## Setting the default bind address for containers
@y
{: #setting-the-default-bind-address-for-containers }
## コンテナーへのデフォルトバインドアドレス設定
@z

@x
By default, the Docker daemon will expose ports on the `0.0.0.0` address, i.e.
any address on the host. If you want to change that behavior to only
expose ports on an internal IP address, you can use the `--ip` option to
specify a different IP address. However, setting `--ip` only changes the
_default_, it does not _restrict_ services to that IP.
@y
デフォルトで Docker デーモンは、ホスト上でのあらゆるアドレスを意味する`0.0.0.0`において、ポートを公開します。
この状態を変更して、公開するポートは内部 IP アドレスに対してのみとする場合は、`--ip`オプションを使って、別の IP アドレスを指定します。
ただし`--ip`による設定は **デフォルトを** 変更するだけであり、その IP に対してサービスを **限定** するものではありません。
@z

@x
## Integration with Firewalld
@y
{: #integration-with-firewalld }
## Firewalld との統合
@z

@x
If you are running Docker version 20.10.0 or higher with [firewalld](https://firewalld.org){: target="blank" rel="noopener" class=“”} on your system with `--iptables` enabled, Docker automatically creates a `firewalld` zone called `docker` and inserts all the network interfaces it creates (for example, `docker0`) into the `docker` zone to allow seamless networking.
@y
Docker version 20.10.0 またはそれ以上の利用にあたって、`--iptables`を有効にして [firewalld](https://firewalld.org){: target="blank" rel="noopener" class=“”} を利用する場合、Docker は自動的に`firewalld`のゾーンとして`docker`を生成し、生成するネットワークインターフェース（たとえば`docker0`など）すべてを`docker`ゾーンに加えることでシームレスなネットワークを実現します。
@z

@x
Consider running the following `firewalld` command to remove the docker interface from the zone.
@y
Docker のネットワークインターフェースをゾーンから除くには、以下の`firewalld`コマンドを実行することを覚えておいてください。
@z

@x
```console
# Please substitute the appropriate zone and docker interface
$ firewall-cmd --zone=trusted --remove-interface=docker0 --permanent
$ firewall-cmd --reload
```
@y
```console
# ゾーンと Docker インターフェースは適切なものに書き換えてください。
$ firewall-cmd --zone=trusted --remove-interface=docker0 --permanent
$ firewall-cmd --reload
```
@z

@x
Restarting `dockerd` daemon inserts the interface into the `docker` zone.
@y
`dockerd`デーモンを再起動すれば、インターフェースが`docker`ゾーンに挿入されます。
@z
