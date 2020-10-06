%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use bridge networks
description: All about using user-defined bridge networks and the default bridge
keywords: network, bridge, user-defined, standalone
redirect_from:
- /engine/userguide/networking/default_network/custom-docker0/
- /engine/userguide/networking/default_network/dockerlinks/
- /engine/userguide/networking/default_network/build-bridges/
- /engine/userguide/networking/work-with-networks/
- /config/containers/bridges/
---
@y
---
title: ブリッジネットワークの利用
description: All about using user-defined bridge networks and the default bridge
keywords: network, bridge, user-defined, standalone
redirect_from:
- /engine/userguide/networking/default_network/custom-docker0/
- /engine/userguide/networking/default_network/dockerlinks/
- /engine/userguide/networking/default_network/build-bridges/
- /engine/userguide/networking/work-with-networks/
- /config/containers/bridges/
---
@z

@x
In terms of networking, a bridge network is a Link Layer device
which forwards traffic between network segments. A bridge can be a hardware
device or a software device running within a host machine's kernel.
@y
{% comment %}
In terms of networking, a bridge network is a Link Layer device
which forwards traffic between network segments. A bridge can be a hardware
device or a software device running within a host machine's kernel.
{% endcomment %}
ネットワーク技術において、ブリッジネットワークとはリンク層のデバイスのことであり、ネットワークセグメントに向けてトラフィックを送信します。
ブリッジはハードウェアデバイス、ソフトウェアデバイスのいずれも可能であり、ホストマシンのカーネル内で動作します。
@z

@x
In terms of Docker, a bridge network uses a software bridge which allows
containers connected to the same bridge network to communicate, while providing
isolation from containers which are not connected to that bridge network. The
Docker bridge driver automatically installs rules in the host machine so that
containers on different bridge networks cannot communicate directly with each
other.
@y
{% comment %}
In terms of Docker, a bridge network uses a software bridge which allows
containers connected to the same bridge network to communicate, while providing
isolation from containers which are not connected to that bridge network. The
Docker bridge driver automatically installs rules in the host machine so that
containers on different bridge networks cannot communicate directly with each
other.
{% endcomment %}
Docker の用語におけるブリッジネットワークは、同一のブリッジネットワークに接続されたコンテナーが、互いに通信を行うためのソフトウェアブリッジを利用します。
そしてそのブリッジネットワークに接続していないコンテナーからは隔離されます。
ホストマシン内には Docker ブリッジドライバーのルールが自動的にインストールされます。
このルールにより、別のブリッジネットワーク上のコンテナーは、直接通信することはできなくなります。
@z

@x
Bridge networks apply to containers running on the **same** Docker daemon host.
For communication among containers running on different Docker daemon hosts, you
can either manage routing at the OS level, or you can use an
[overlay network](overlay.md).
@y
{% comment %}
Bridge networks apply to containers running on the **same** Docker daemon host.
For communication among containers running on different Docker daemon hosts, you
can either manage routing at the OS level, or you can use an
[overlay network](overlay.md).
{% endcomment %}
ブリッジネットワークは、**同一** の Docker デーモンホスト上に稼動しているコンテナーに適用されます。
別の Docker デーモンホスト上に稼動するコンテナーとの間で通信を行うためには、OS レベルでのネットワーク管理を行うか、あるいは [オーバーレイネットワーク](overlay.md) を利用します。
@z

@x
When you start Docker, a [default bridge network](#use-the-default-bridge-network) (also
called `bridge`) is created automatically, and newly-started containers connect
to it unless otherwise specified. You can also create user-defined custom bridge
networks. **User-defined bridge networks are superior to the default `bridge`
network.**
@y
{% comment %}
When you start Docker, a [default bridge network](#use-the-default-bridge-network) (also
called `bridge`) is created automatically, and newly-started containers connect
to it unless otherwise specified. You can also create user-defined custom bridge
networks. **User-defined bridge networks are superior to the default `bridge`
network.**
{% endcomment %}
Docker を起動すると [デフォルトブリッジネットワーク](#use-the-default-bridge-network)（または単にブリッジ）が自動的に生成されます。
そして特に指定がない限り、この後に生成されるコンテナーは、このネットワークに接続されます。
もちろんユーザー定義によるカスタムブリッジネットワークを生成することもできます。
**ユーザー定義によるブリッジネットワークは、デフォルトのブリッジネットワークよりも優先されます。**
@z

@x
## Differences between user-defined bridges and the default bridge
@y
{% comment %}
## Differences between user-defined bridges and the default bridge
{% endcomment %}
{: ### Differences between user-defined bridges and the default bridge }
## ユーザー定義ブリッジとデフォルトブリッジの違い
@z

@x
- **User-defined bridges provide automatic DNS resolution between containers**.
@y
{% comment %}
- **User-defined bridges provide automatic DNS resolution between containers**.
{% endcomment %}
- **ユーザー定義ブリッジは、コンテナー間において自動的に DNS 解決を提供します。**
@z

@x
  Containers on the default bridge network can only access each other by IP
  addresses, unless you use the [`--link` option](links.md), which is
  considered legacy. On a user-defined bridge network, containers can resolve
  each other by name or alias.
@y
  {% comment %}
  Containers on the default bridge network can only access each other by IP
  addresses, unless you use the [`--link` option](links.md), which is
  considered legacy. On a user-defined bridge network, containers can resolve
  each other by name or alias.
  {% endcomment %}
  デフォルトブリッジネットワーク上にあるコンテナーは、IP アドレスによって互いにアクセスすることができます。
  ただしこれは [`--link` オプション](links.md) を使った場合であり、古い機能とされています。
  ユーザー定義のブリッジネットワークにおいて、コンテナーは名前またはエイリアスにより互いを識別します。
@z

@x
  Imagine an application with a web front-end and a database back-end. If you call
  your containers `web` and `db`, the web container can connect to the db container
  at `db`, no matter which Docker host the application stack is running on.
@y
  {% comment %}
  Imagine an application with a web front-end and a database back-end. If you call
  your containers `web` and `db`, the web container can connect to the db container
  at `db`, no matter which Docker host the application stack is running on.
  {% endcomment %}
  今、フロントエンドにウェブ、バックエンドにデータベースを持つアプリケーションがあるとします。
  コンテナーをそれぞれ `web`、`db` とすると、web コンテナーから db コンテナーは `db` として接続します。
  そのアプリケーションスタックがどの Docker ホスト上で動作していても同様です。
@z

@x
  If you run the same application stack on the default bridge network, you need
  to manually create links between the containers (using the legacy `--link`
  flag). These links need to be created in both directions, so you can see this
  gets complex with more than two containers which need to communicate.
  Alternatively, you can manipulate the `/etc/hosts` files within the containers,
  but this creates problems that are difficult to debug.
@y
  {% comment %}
  If you run the same application stack on the default bridge network, you need
  to manually create links between the containers (using the legacy `--link`
  flag). These links need to be created in both directions, so you can see this
  gets complex with more than two containers which need to communicate.
  Alternatively, you can manipulate the `/etc/hosts` files within the containers,
  but this creates problems that are difficult to debug.
  {% endcomment %}
  上と同じアプリケーションスタックを、デフォルトブリッジネットワーク上において実行したとします。
  その場合は（古い `--link` フラグを使い）コンテナー間に手動でリンクを生成する必要があります。
  このリンクは双方向に生成しなければなりません。
  したがって通信すべきコンテナーが 2 つ以上になってくると、このやり方は面倒なものに思うかもしれません。
  それならコンテナーすべてに `/etc/hosts` を設定する方法もありますが、今度はデバッグがしづらくなるという問題が発生します。
@z

@x
- **User-defined bridges provide better isolation**.
@y
{% comment %}
- **User-defined bridges provide better isolation**.
{% endcomment %}
- **ユーザー定義ブリッジ上のコンテナーは、さらに隔離されます。**
@z

@x
  All containers without a `--network` specified, are attached to the default bridge network. This can be a risk, as unrelated stacks/services/containers are then able to communicate.
@y
  {% comment %}
  All containers without a `--network` specified, are attached to the default bridge network. This can be a risk, as unrelated stacks/services/containers are then able to communicate.
  {% endcomment %}
  `--network` の指定を一切行わなければ、すべてのコンテナーがデフォルトブリッジネットワークに接続されます。
  これにはリスクがあります。
  無関係なスタック、サービス、コンテナーが通信できてしまうからです。
@z

@x
  Using a user-defined network provides a scoped network in which only containers attached to that network are able to communicate.
@y
  {% comment %}
  Using a user-defined network provides a scoped network in which only containers attached to that network are able to communicate.
  {% endcomment %}
  ユーザー定義ネットワークを使うとネットワーク範囲が限定され、そのネットワークに接続しているコンテナーだけが、互いに通信を行うことができます。
@z

@x
- **Containers can be attached and detached from user-defined networks on the fly**.
@y
{% comment %}
- **Containers can be attached and detached from user-defined networks on the fly**.
{% endcomment %}
- **ユーザー定義ネットワークであれば、コンテナーの動作中にアタッチ、デタッチを行うことができます。**
@z

@x
  During a container's lifetime, you can connect or disconnect it from
  user-defined networks on the fly. To remove a container from the default
  bridge network, you need to stop the container and recreate it with different
  network options.
@y
  {% comment %}
  During a container's lifetime, you can connect or disconnect it from
  user-defined networks on the fly. To remove a container from the default
  bridge network, you need to stop the container and recreate it with different
  network options.
  {% endcomment %}
  コンテナーの稼働中であれば、ユーザー定義ネットワークとの接続や切断は、その場ですぐに行うことができます。
  一方デフォルトブリッジネットワークの場合、コンテナーをネットワークから切り離すには、コンテナーを停止させ、別のネットワークオプションを使ってコンテナーを再生成しなければなりません。
@z

@x
- **Each user-defined network creates a configurable bridge**.
@y
{% comment %}
- **Each user-defined network creates a configurable bridge**.
{% endcomment %}
- **ユーザー定義ネットワークは、設定変更可能なブリッジを生成します。**
@z

@x
  If your containers use the default bridge network, you can configure it, but
  all the containers use the same settings, such as MTU and `iptables` rules.
  In addition, configuring the default bridge network happens outside of Docker
  itself, and requires a restart of Docker.
@y
  {% comment %}
  If your containers use the default bridge network, you can configure it, but
  all the containers use the same settings, such as MTU and `iptables` rules.
  In addition, configuring the default bridge network happens outside of Docker
  itself, and requires a restart of Docker.
  {% endcomment %}
  デフォルトブリッジネットワークを利用している場合に、ネットワーク設定を変更することはできますが、MTU や `iptables` ルールといった設定は全コンテナーに適用されることになります。
  さらにデフォルトブリッジネットワークの設定変更は Docker 外部で処理されるため、Docker デーモンの再起動が必要になります。
@z

@x
  User-defined bridge networks are created and configured using
  `docker network create`. If different groups of applications have different
  network requirements, you can configure each user-defined bridge separately,
  as you create it.
@y
  {% comment %}
  User-defined bridge networks are created and configured using
  `docker network create`. If different groups of applications have different
  network requirements, you can configure each user-defined bridge separately,
  as you create it.
  {% endcomment %}
  ユーザー定義ブリッジネットワークは `docker network create` を使って生成され設定されます。
  アプリケーションがグループ分けされていて、ネットワーク要件が異なっているとします。
  ユーザー定義ブリッジは、個々に設定を変えて生成することができます。
@z

@x
- **Linked containers on the default bridge network share environment variables**.
@y
{% comment %}
- **Linked containers on the default bridge network share environment variables**.
{% endcomment %}
- **デフォルトブリッジネットワーク上のリンクコンテナーは、環境変数を共有します。**
@z

@x
  Originally, the only way to share environment variables between two containers
  was to link them using the [`--link` flag](links.md). This type of
  variable sharing is not possible with user-defined networks. However, there
  are superior ways to share environment variables. A few ideas:
@y
  {% comment %}
  Originally, the only way to share environment variables between two containers
  was to link them using the [`--link` flag](links.md). This type of
  variable sharing is not possible with user-defined networks. However, there
  are superior ways to share environment variables. A few ideas:
  {% endcomment %}
  もともと 2 つのコンテナー間で環境変数を共有するには、[`--link` フラグ](links.md) を使って互いをリンクするのが唯一の方法でした。
  この変数共有は、ユーザー定義ネットワークでは利用できません。
  ただし変数共有を行う優れた方法はあります。
  以下がその考え方です。
@z

@x
  - Multiple containers can mount a file or directory containing the shared
    information, using a Docker volume.
@y
  {% comment %}
  - Multiple containers can mount a file or directory containing the shared
    information, using a Docker volume.
  {% endcomment %}
  - 複数コンテナーからはファイルやディレクトリをマウントすることができます。
    これには Docker ボリュームを利用します。
    そしてそこに共有したい情報を含めます。
@z

@x
  - Multiple containers can be started together using `docker-compose` and the
    compose file can define the shared variables.
@y
  {% comment %}
  - Multiple containers can be started together using `docker-compose` and the
    compose file can define the shared variables.
  {% endcomment %}
  - 複数コンテナーは `docker-compose` を利用して同時に起動することができます。
    その compose ファイルには共有変数を定義することができます。
@z

@x
  - You can use swarm services instead of standalone containers, and take
    advantage of shared [secrets](../engine/swarm/secrets.md) and
    [configs](../engine/swarm/configs.md).
@y
  {% comment %}
  - You can use swarm services instead of standalone containers, and take
    advantage of shared [secrets](../engine/swarm/secrets.md) and
    [configs](../engine/swarm/configs.md).
  {% endcomment %}
  - スタンドアロンなコンテナーではなく swarm サービスを利用することができます。
    これにより共有化した [secrets](../engine/swarm/secrets.md) や [configs](../engine/swarm/configs.md) を利用することができます。
@z

@x
Containers connected to the same user-defined bridge network effectively expose all ports
to each other. For a port to be accessible to containers or non-Docker hosts on
different networks, that port must be _published_ using the `-p` or `--publish`
flag.
@y
{% comment %}
Containers connected to the same user-defined bridge network effectively expose all ports
to each other. For a port to be accessible to containers or non-Docker hosts on
different networks, that port must be _published_ using the `-p` or `--publish`
flag.
{% endcomment %}
同一のユーザー定義ブリッジネットワークに接続するコンテナーは、効率性により全ポートが互いに公開されます。
コンテナーへの接続ポート、あるいは別のネットワーク上の Docker でないホストへの接続ポートは、**公開されている** 必要があり、`-p` または `--publish` を指定します。
@z

@x
## Manage a user-defined bridge
@y
{% comment %}
## Manage a user-defined bridge
{% endcomment %}
{: #manage-a-user-defined-bridge }
## ユーザー定義ブリッジの管理
@z

@x
Use the `docker network create` command to create a user-defined bridge
network.
@y
{% comment %}
Use the `docker network create` command to create a user-defined bridge
network.
{% endcomment %}
ユーザー定義ブリッジネットワークを生成するには、コマンド `docker network create` を実行します。
@z

@x
```bash
$ docker network create my-net
```
@y
```bash
$ docker network create my-net
```
@z

@x
You can specify the subnet, the IP address range, the gateway, and other
options. See the
[docker network create](../engine/reference/commandline/network_create.md#specify-advanced-options)
reference or the output of `docker network create --help` for details.
@y
{% comment %}
You can specify the subnet, the IP address range, the gateway, and other
options. See the
[docker network create](../engine/reference/commandline/network_create.md#specify-advanced-options)
reference or the output of `docker network create --help` for details.
{% endcomment %}
サブネット、IP アドレス範囲、ゲートウェイ、その他のオプションを指定することもできます。
詳しくは [docker network create](../engine/reference/commandline/network_create.md#specify-advanced-options) リファレンスを参照してください。
あるいは `docker network create --help` の出力を確認してください。
@z

@x
Use the `docker network rm` command to remove a user-defined bridge
network. If containers are currently connected to the network,
[disconnect them](#disconnect-a-container-from-a-user-defined-bridge)
first.
@y
{% comment %}
Use the `docker network rm` command to remove a user-defined bridge
network. If containers are currently connected to the network,
[disconnect them](#disconnect-a-container-from-a-user-defined-bridge)
first.
{% endcomment %}
`docker network rm` コマンドを使うと、ユーザー定義のブリッジネットワークを削除することができます。
コンテナーがその時点でネットワークに接続しているのであれば、その前に [接続を切って](#disconnect-a-container-from-a-user-defined-bridge) ください。
@z

@x
```bash
$ docker network rm my-net
```
@y
```bash
$ docker network rm my-net
```
@z

@x
> **What's really happening?**
>
> When you create or remove a user-defined bridge or connect or disconnect a
> container from a user-defined bridge, Docker uses tools specific to the
> operating system to manage the underlying network infrastructure (such as adding
> or removing bridge devices or configuring `iptables` rules on Linux). These
> details should be considered implementation details. Let Docker manage your
> user-defined networks for you.
@y
{% comment %}
> **What's really happening?**
>
> When you create or remove a user-defined bridge or connect or disconnect a
> container from a user-defined bridge, Docker uses tools specific to the
> operating system to manage the underlying network infrastructure (such as adding
> or removing bridge devices or configuring `iptables` rules on Linux). These
> details should be considered implementation details. Let Docker manage your
> user-defined networks for you.
{% endcomment %}
> **実際には何が起きるか**
>
> ユーザー定義ブリッジの生成、削除を行う場合、あるいはユーザー定義ブリッジとコンテナーを接続する、または接続を切る場合、Docker はオペレーティングシステムに固有のツールを使って、用いられているネットワークインフラストラクチャー（ブリッジデバイスの加除や Linux 上の `iptables` の設定など）を制御します。
> この動作は実装の詳細を考慮して処理されるべきであるため、ユーザー定義ネットワークの管理は Docker
の動作に従ってください。
@z

@x
## Connect a container to a user-defined bridge
@y
{% comment %}
## Connect a container to a user-defined bridge
{% endcomment %}
{: #connect-a-container-to-a-user-defined-bridge }
## ユーザー定義ブリッジへのコンテナーの接続
@z

@x
When you create a new container, you can specify one or more `--network` flags.
This example connects a Nginx container to the `my-net` network. It also
publishes port 80 in the container to port 8080 on the Docker host, so external
clients can access that port. Any other container connected to the `my-net`
network has access to all ports on the `my-nginx` container, and vice versa.
@y
{% comment %}
When you create a new container, you can specify one or more `--network` flags.
This example connects a Nginx container to the `my-net` network. It also
publishes port 80 in the container to port 8080 on the Docker host, so external
clients can access that port. Any other container connected to the `my-net`
network has access to all ports on the `my-nginx` container, and vice versa.
{% endcomment %}
新たにコンテナーを生成するときは、`--network` フラグを複数指定することができます。
以下の例では Nginx コンテナーを `my-net` ネットワークに接続しています。
またコンテナーのポート 80 を Docker ホストのポート 8080 に公開しています。
外部のクライアントプログラムは、このポートからアクセスすることができます。
`my-net` ネットワークに別のコンテナーが接続していたら、`my-nginx` コンテナー上のポートすべてにアクセスすることができます。元のコンテナーからも同じことが言えます。
@z

@x
```bash
$ docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest
```
@y
```bash
$ docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest
```
@z

@x
To connect a **running** container to an existing user-defined bridge, use the
`docker network connect` command. The following command connects an already-running
`my-nginx` container to an already-existing `my-net` network:
@y
{% comment %}
To connect a **running** container to an existing user-defined bridge, use the
`docker network connect` command. The following command connects an already-running
`my-nginx` container to an already-existing `my-net` network:
{% endcomment %}
**実行中** のコンテナーを既存のユーザー定義ブリッジに接続するには `docker network connect` コマンドを使います。
以下に示すコマンドは、すでに実行されている `my-nginx` コンテナーを、既存の `my-net` ネットワークに接続します。
@z

@x
```bash
$ docker network connect my-net my-nginx
```
@y
```bash
$ docker network connect my-net my-nginx
```
@z

@x
## Disconnect a container from a user-defined bridge
@y
{% comment %}
## Disconnect a container from a user-defined bridge
{% endcomment %}
{: #disconnect-a-container-from-a-user-defined-bridge }
## ユーザー定義ブリッジからのコンテナーの接続解除
@z

@x
To disconnect a running container from a user-defined bridge, use the `docker
network disconnect` command. The following command disconnects the `my-nginx`
container from the `my-net` network.
@y
{% comment %}
To disconnect a running container from a user-defined bridge, use the `docker
network disconnect` command. The following command disconnects the `my-nginx`
container from the `my-net` network.
{% endcomment %}
ユーザー定義ブリッジから実行コンテナーの接続を解除するには `docker network disconnect` コマンドを使います。
以下に示すコマンドは、`my-nginx` コンテナーを `my-net` ネットワークから切り離します。
@z

@x
```bash
$ docker network disconnect my-net my-nginx
```
@y
```bash
$ docker network disconnect my-net my-nginx
```
@z

@x
## Use IPv6
@y
{% comment %}
## Use IPv6
{% endcomment %}
{: #use-ipv6 }
## IPv6 の利用
@z

@x
If you need IPv6 support for Docker containers, you need to
[enable the option](../config/daemon/ipv6.md) on the Docker daemon and reload its
configuration, before creating any IPv6 networks or assigning containers IPv6
addresses.
@y
{% comment %}
If you need IPv6 support for Docker containers, you need to
[enable the option](../config/daemon/ipv6.md) on the Docker daemon and reload its
configuration, before creating any IPv6 networks or assigning containers IPv6
addresses.
{% endcomment %}
Docker コンテナーが IPv6 をサポートする必要がある場合は、Docker デーモンにおいて [オプションを有効](../config/daemon/ipv6.md) にして、設定を再読み込みする必要があります。
ただしそれを行うには、あらかじめ IPv6 ネットワークを構築しておき、コンテナーに対して IPv6 アドレスを割り当てておくことが必要です。
@z

@x
When you create your network, you can specify the `--ipv6` flag to enable
IPv6. You can't selectively disable IPv6 support on the default `bridge` network.
@y
{% comment %}
When you create your network, you can specify the `--ipv6` flag to enable
IPv6. You can't selectively disable IPv6 support on the default `bridge` network.
{% endcomment %}
ネットワークを構築する際に `--ipv6` フラグを指定すれば IPv6 を有効にすることができます。
なおデフォルトの `bridge` ネットワークにおいては、IPv6 サポートを無効にすることはできません。
@z

@x
## Enable forwarding from Docker containers to the outside world
@y
{% comment %}
## Enable forwarding from Docker containers to the outside world
{% endcomment %}
{: #enable-forwarding-from-docker-containers-to-the-outside-world }
## Docker コンテナーからの外部フォワード有効化
@z

@x
By default, traffic from containers connected to the default bridge network is
**not** forwarded to the outside world. To enable forwarding, you need to change
two settings. These are not Docker commands and they affect the Docker host's
kernel.
@y
{% comment %}
By default, traffic from containers connected to the default bridge network is
**not** forwarded to the outside world. To enable forwarding, you need to change
two settings. These are not Docker commands and they affect the Docker host's
kernel.
{% endcomment %}
デフォルトブリッジネットワークに接続されているコンテナーからのトラフィックは、デフォルトでは外部にフォワード **されません**。
フォワードを有効にするには、設定変更が 2 つ必要です。
それは Docker コマンドで行うものではなく、Docker ホストのカーネルを変更するものです。
@z

@x
1.  Configure the Linux kernel to allow IP forwarding.
@y
{% comment %}
1.  Configure the Linux kernel to allow IP forwarding.
{% endcomment %}
1.  Linux カーネルにおいて IP フォワーディングを有効に設定します。
@z

@x
    ```bash
    $ sysctl net.ipv4.conf.all.forwarding=1
    ```
@y
    ```bash
    $ sysctl net.ipv4.conf.all.forwarding=1
    ```
@z

@x
2.  Change the policy for the `iptables` `FORWARD` policy from `DROP` to
    `ACCEPT`.
@y
{% comment %}
2.  Change the policy for the `iptables` `FORWARD` policy from `DROP` to
    `ACCEPT`.
{% endcomment %}
2.  `iptables` の `FORWARD` ポリシーを `DROP` から `ACCEPT` に変更します。
@z

@x
    ```bash
    $ sudo iptables -P FORWARD ACCEPT
    ```
@y
    ```bash
    $ sudo iptables -P FORWARD ACCEPT
    ```
@z

@x
These settings do not persist across a reboot, so you may need to add them to a
start-up script.
@y
{% comment %}
These settings do not persist across a reboot, so you may need to add them to a
start-up script.
{% endcomment %}
上で行ったことは、再起動後には設定が失われます。
そこで起動スクリプトにその設定を加えることにします。
@z

@x
## Use the default bridge network
@y
{% comment %}
## Use the default bridge network
{% endcomment %}
{: #use-the-default-bridge-network }
## デフォルトのブリッジネットワークの利用
@z

@x
The default `bridge` network is considered a legacy detail of Docker and is not
recommended for production use. Configuring it is a manual operation, and it has
[technical shortcomings](#differences-between-user-defined-bridges-and-the-default-bridge).
@y
{% comment %}
The default `bridge` network is considered a legacy detail of Docker and is not
recommended for production use. Configuring it is a manual operation, and it has
[technical shortcomings](#differences-between-user-defined-bridges-and-the-default-bridge).
{% endcomment %}
デフォルトの `bridge` ネットワークは Docker の古い機能の一部に過ぎないので、本番環境での利用はお勧めできません。
これは手動で設定するものになっていて、[技術的な欠点](#differences-between-user-defined-bridges-and-the-default-bridge) があります。
@z

@x
### Connect a container to the default bridge network
@y
{% comment %}
### Connect a container to the default bridge network
{% endcomment %}
{: #connect-a-container-to-the-default-bridge-network }
### デフォルトブリッジネットワークへのコンテナーの接続
@z

@x
If you do not specify a network using the `--network` flag, and you do specify a
network driver, your container is connected to the default `bridge` network by
default. Containers connected to the default `bridge` network can communicate,
but only by IP address, unless they are linked using the
[legacy `--link` flag](links.md).
@y
{% comment %}
If you do not specify a network using the `--network` flag, and you do specify a
network driver, your container is connected to the default `bridge` network by
default. Containers connected to the default `bridge` network can communicate,
but only by IP address, unless they are linked using the
[legacy `--link` flag](links.md).
{% endcomment %}
`--network` フラグを指定しなかった場合で、ネットワークドライバーの指定を行った場合、デフォルトでコンテナーは、デフォルト の `bridge` ネットワークに接続されます。
デフォルト `bridge` ネットワークに接続されたコンテナーは通信が可能ですが、[かつての `--link` フラグ](links.md) を利用しない限りは、互いに IP アドレスを使ってしか通信はできません。
@z

@x
### Configure the default bridge network
@y
{% comment %}
### Configure the default bridge network
{% endcomment %}
{: #configure-the-default-bridge-network }
### デフォルトブリッジネットワークの設定
@z

@x
To configure the default `bridge` network, you specify options in `daemon.json`.
Here is an example `daemon.json` with several options specified. Only specify
the settings you need to customize.
@y
{% comment %}
To configure the default `bridge` network, you specify options in `daemon.json`.
Here is an example `daemon.json` with several options specified. Only specify
the settings you need to customize.
{% endcomment %}
デフォルト `bridge` ネットワークを設定するには、`daemon.json` 内においてオプションを指定します。
以下は `daemon.json` においてオプションをいくつか指定した例です。
オプション指定は、設定変更を行いたいもののみ記述してください。
@z

@x
```json
{
  "bip": "192.168.1.5/24",
  "fixed-cidr": "192.168.1.5/25",
  "fixed-cidr-v6": "2001:db8::/64",
  "mtu": 1500,
  "default-gateway": "10.20.1.1",
  "default-gateway-v6": "2001:db8:abcd::89",
  "dns": ["10.20.1.2","10.20.1.3"]
}
```
@y
```json
{
  "bip": "192.168.1.5/24",
  "fixed-cidr": "192.168.1.5/25",
  "fixed-cidr-v6": "2001:db8::/64",
  "mtu": 1500,
  "default-gateway": "10.20.1.1",
  "default-gateway-v6": "2001:db8:abcd::89",
  "dns": ["10.20.1.2","10.20.1.3"]
}
```
@z

@x
Restart Docker for the changes to take effect.
@y
{% comment %}
Restart Docker for the changes to take effect.
{% endcomment %}
設定変更を有効にするため Docker を再起動します。
@z

@x
### Use IPv6 with the default bridge network
@y
{% comment %}
### Use IPv6 with the default bridge network
{% endcomment %}
{: #use-ipv6-with-the-default-bridge-network }
### デフォルトブリッジネットワークにおける IPv6 の利用
@z

@x
If you configure Docker for IPv6 support (see [Use IPv6](#use-ipv6)), the
default bridge network is also configured for IPv6 automatically. Unlike
user-defined bridges, you can't selectively disable IPv6 on the default bridge.
@y
{% comment %}
If you configure Docker for IPv6 support (see [Use IPv6](#use-ipv6)), the
default bridge network is also configured for IPv6 automatically. Unlike
user-defined bridges, you can't selectively disable IPv6 on the default bridge.
{% endcomment %}
Docker において IPv6（[IPv6 の利用](#use-ipv6) 参照）のサポートを設定すると、デフォルトブリッジネットワークも IPv6 に対応するように自動的に設定されます。
ユーザー定義ブリッジとは違って、デフォルトブリッジにおいては IPv6 を無効にすることはできません。
@z

@x
## Next steps
@y
{% comment %}
## Next steps
{% endcomment %}
{: #next-steps }
## 次のステップ
@z

@x
- Go through the [standalone networking tutorial](network-tutorial-standalone.md)
- Learn about [networking from the container's point of view](../config/containers/container-networking.md)
- Learn about [overlay networks](overlay.md)
- Learn about [Macvlan networks](macvlan.md)
@y
{% comment %}
- Go through the [standalone networking tutorial](network-tutorial-standalone.md)
- Learn about [networking from the container's point of view](../config/containers/container-networking.md)
- Learn about [overlay networks](overlay.md)
- Learn about [Macvlan networks](macvlan.md)
{% endcomment %}
- [スタンドアロンネットワークのチュートリアル](network-tutorial-standalone.md) を確認する。
- [コンテナーから見たネットワーク](../config/containers/container-networking.md) について。
- [overlay ネットワーク](overlay.md) について。
- [Macvlan ネットワーク](macvlan.md) について。
@z
