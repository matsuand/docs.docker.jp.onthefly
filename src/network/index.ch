%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Networking overview
description: Overview of Docker networks and networking concepts
keywords: networking, bridge, routing, routing mesh, overlay, ports
redirect_from:
- /engine/userguide/networking/
- /engine/userguide/networking/dockernetworks/
- /articles/networking/
---
@y
---
title: ネットワーク概要
description: Docker ネットワークとその概念
keywords: networking, bridge, routing, routing mesh, overlay, ports
redirect_from:
- /engine/userguide/networking/
- /engine/userguide/networking/dockernetworks/
- /articles/networking/
---
@z

@x
One of the reasons Docker containers and services are so powerful is that
you can connect them together, or connect them to non-Docker workloads. Docker
containers and services do not even need to be aware that they are deployed on
Docker, or whether their peers are also Docker workloads or not. Whether your
Docker hosts run Linux, Windows, or a mix of the two, you can use Docker to
manage them in a platform-agnostic way.
@y
{% comment %}
One of the reasons Docker containers and services are so powerful is that
you can connect them together, or connect them to non-Docker workloads. Docker
containers and services do not even need to be aware that they are deployed on
Docker, or whether their peers are also Docker workloads or not. Whether your
Docker hosts run Linux, Windows, or a mix of the two, you can use Docker to
manage them in a platform-agnostic way.
{% endcomment %}
Docker コンテナーやサービスの機能が強力である理由は、これらを互いに接続することができ、あるいは Docker ではないシステムとも接続ができる点です。
Docker コンテナーやサービスはどちらも、Docker によってデプロイされたものであるかを知っておく必要がなく、さらに接続された先が Docker によるものかどうかすら、わかっていなくてよいのです。
Docker ホストが Linux や Windows 上で、あるいはその両方が混在した上で動作しているとしても、Docker を使えばプラットフォームに依存せずに Docker ホストを管理することができます。
@z

@x
This topic defines some basic Docker networking concepts and prepares you to
design and deploy your applications to take full advantage of these
capabilities.
@y
{% comment %}
This topic defines some basic Docker networking concepts and prepares you to
design and deploy your applications to take full advantage of these
capabilities.
{% endcomment %}
ここでは Docker ネットワークの基本的な考え方を紹介し、Docker の機能を最大限活用したアプリケーションの設計とデプロイができるようにしていきます。
@z

@x
## Scope of this topic
@y
{% comment %}
## Scope of this topic
{% endcomment %}
{: #scope-of-this-topic }
## 説明を行う範囲
@z

@x
This topic does **not** go into OS-specific details about how Docker networks
work, so you will not find information about how Docker manipulates `iptables`
rules on Linux or how it manipulates routing rules on Windows servers, and you
will not find detailed information about how Docker forms and encapsulates
packets or handles encryption. See [Docker and iptables](iptables.md).
@y
{% comment %}
This topic does **not** go into OS-specific details about how Docker networks
work, so you will not find information about how Docker manipulates `iptables`
rules on Linux or how it manipulates routing rules on Windows servers, and you
will not find detailed information about how Docker forms and encapsulates
packets or handles encryption. See [Docker and iptables](iptables.md).
{% endcomment %}
Docker ネットワークがどのように動作するのかに関して、OS 固有の話にまで踏み込んで説明するつもりは **ありません**。
したがって Linux 上において Docker がどのようにして `iptables` ルールを処理するのか、Windows Server 上にてルーティング規則をどのように処理するのか、といった情報を示すことはありません。
さらに Docker がパケットを構成しカプセル化する様子や暗号化を取り扱うところに関して、詳細情報も示しません。
技術的にかなり踏み込んだ詳細に関しては [Docker と iptable](iptables.md) を参照してください。
@z

@x
In addition, this topic does not provide any tutorials for how to create,
manage, and use Docker networks. Each section includes links to relevant
tutorials and command references.
@y
{% comment %}
In addition, this topic does not provide any tutorials for how to create,
manage, and use Docker networks. Each section includes links to relevant
tutorials and command references.
{% endcomment %}
上に加えてこの説明においては Docker ネットワークの生成、管理、利用に関するチュートリアルも含んでいません。
各節では、対応するチュートリアルやコマンドリファレンスはリンクとして示しています。
@z

@x
## Network drivers
@y
{% comment %}
## Network drivers
{% endcomment %}
{: #network-drivers }
## ネットワークドライバー
@z

@x
Docker's networking subsystem is pluggable, using drivers. Several drivers
exist by default, and provide core networking functionality:
@y
{% comment %}
Docker's networking subsystem is pluggable, using drivers. Several drivers
exist by default, and provide core networking functionality:
{% endcomment %}
Docker 内のサブシステムであるネットワーク機能は、ドライバーを利用したプラガブル（pluggable）なものです。
デフォルトで数種のドライバーがあり、基本的なネットワーク機能が提供されています。
@z

@x
- `bridge`: The default network driver. If you don't specify a driver, this is
  the type of network you are creating. **Bridge networks are usually used when
  your applications run in standalone containers that need to communicate.** See
  [bridge networks](bridge.md).
@y
{% comment %}
- `bridge`: The default network driver. If you don't specify a driver, this is
  the type of network you are creating. **Bridge networks are usually used when
  your applications run in standalone containers that need to communicate.** See
  [bridge networks](bridge.md).
{% endcomment %}
- `bridge`（ブリッジ）: デフォルトのネットワークドライバー。
  ドライバーを指定しなかった場合、生成したネットワークのタイプがこのドライバーになります。
  **ブリッジネットワークは通常、アプリケーションがいくつかのスタンドアロンコンテナー上に動作していて、コンテナーが互いに通信を必要とする場合に利用されます。**
  [ブリッジネットワーク](bridge.md) を参照してください。
@z

@x
- `host`: For standalone containers, remove network isolation between the
  container and the Docker host, and use the host's networking directly. See
  [use the host network](host.md).
@y
{% comment %}
- `host`: For standalone containers, remove network isolation between the
  container and the Docker host, and use the host's networking directly. See
  [use the host network](host.md).
{% endcomment %}
- `host`（ホスト）: スタンドアロンコンテナーにおいて、コンテナーと Docker ホスト間でのネットワーク隔離を取り除き、ホストのネットワーク機能を直接利用します。
  [ホストネットワークの利用](host.md) を参照してください。
@z

@x
- `overlay`: Overlay networks connect multiple Docker daemons together and
  enable swarm services to communicate with each other. You can also use overlay
  networks to facilitate communication between a swarm service and a standalone
  container, or between two standalone containers on different Docker daemons.
  This strategy removes the need to do OS-level routing between these
  containers. See [overlay networks](overlay.md).
@y
{% comment %}
- `overlay`: Overlay networks connect multiple Docker daemons together and
  enable swarm services to communicate with each other. You can also use overlay
  networks to facilitate communication between a swarm service and a standalone
  container, or between two standalone containers on different Docker daemons.
  This strategy removes the need to do OS-level routing between these
  containers. See [overlay networks](overlay.md).
{% endcomment %}
- `overlay`: オーバーレイネットワークは、複数の Docker デーモンを接続します。
  そして swarm サービスによる相互の通信を可能にします。
  またオーバーレイネットワークは、swarm サービスとスタンドアロンコンテナーとの間での通信、あるいは異なる Docker デーモン上の 2 つのスタンドアロンコンテナー間での通信を容易に実現します。
  この方法を使えば、コンテナー間での OS レベルのルーティングは不要となります。
  [オーバーレイネットワーク](overlay.md) を参照してください。
@z

@x
- `macvlan`: Macvlan networks allow you to assign a MAC address to a container,
  making it appear as a physical device on your network. The Docker daemon
  routes traffic to containers by their MAC addresses. Using the `macvlan`
  driver is sometimes the best choice when dealing with legacy applications that
  expect to be directly connected to the physical network, rather than routed
  through the Docker host's network stack. See
  [Macvlan networks](macvlan.md).
@y
{% comment %}
- `macvlan`: Macvlan networks allow you to assign a MAC address to a container,
  making it appear as a physical device on your network. The Docker daemon
  routes traffic to containers by their MAC addresses. Using the `macvlan`
  driver is sometimes the best choice when dealing with legacy applications that
  expect to be directly connected to the physical network, rather than routed
  through the Docker host's network stack. See
  [Macvlan networks](macvlan.md).
{% endcomment %}
- `macvlan`: Macvlan ネットワークは、コンテナーに対して MAC アドレスを割り当てられるようにし、ネットワーク上の物理デバイスであるかのように見せることができます。
  Docker デーモンはその MAC アドレスによって各コンテナー間のトラフィックを処理します。
  `macvlan` ドライバーは、古いアプリケーションを取り扱う際、Docker ホストのネットワーク層を通じての処理ではなく、物理ネットワークに直接接続することが求められている場合に、ベストな選択となる場合があります。
  [Macvlan ネットワーク](macvlan.md) を参照してください。
@z

@x
- `none`: For this container, disable all networking. Usually used in
  conjunction with a custom network driver. `none` is not available for swarm
  services. See
  [disable container networking](none.md).
@y
{% comment %}
- `none`: For this container, disable all networking. Usually used in
  conjunction with a custom network driver. `none` is not available for swarm
  services. See
  [disable container networking](none.md).
{% endcomment %}
- `none`: これが指定されたコンテナーでは、ネットワーク機能がすべて無効化されます。
  通常はカスタムネットワークドライバーと組み合わせて利用されます。
  `none` は swarm サービスに対して利用することはできません。
  [コンテナーのネットワーク無効化](none.md) を参照してください。
@z

@x
- [Network plugins](/engine/extend/plugins_services/): You can install and use
  third-party network plugins with Docker. These plugins are available from
  [Docker Hub](https://hub.docker.com/search?category=network&q=&type=plugin)
  or from third-party vendors. See the vendor's documentation for installing and
  using a given network plugin.
@y
{% comment %}
- [Network plugins](/engine/extend/plugins_services/): You can install and use
  third-party network plugins with Docker. These plugins are available from
  [Docker Hub](https://hub.docker.com/search?category=network&q=&type=plugin)
  or from third-party vendors. See the vendor's documentation for installing and
  using a given network plugin.
{% endcomment %}
- [ネットワークプラグイン](/engine/extend/plugins_services/):
  Docker では、サードパーティー製のネットワークドライバーをインストールして利用することができます。
  プラグインは [Docker Hub](https://hub.docker.com/search?category=network&q=&type=plugin) から、あるいはサードパーティーベンダーから入手することができます。
  プラグインのインストール手順や利用方法については、ベンダー各社のドキュメントを参照してください。
@z

@x
### Network driver summary
@y
{% comment %}
### Network driver summary
{% endcomment %}
{: #network-driver-summary }
### ネットワークドライバーのまとめ
@z

@x
- **User-defined bridge networks** are best when you need multiple containers to
  communicate on the same Docker host.
@y
{% comment %}
- **User-defined bridge networks** are best when you need multiple containers to
  communicate on the same Docker host.
{% endcomment %}
- **ユーザー定義ブリッジネットワーク** は、同一 Docker ホスト上で複数コンテナーが通信する場合に利用します。
@z

@x
- **Host networks** are best when the network stack should not be isolated from
  the Docker host, but you want other aspects of the container to be isolated.
@y
{% comment %}
- **Host networks** are best when the network stack should not be isolated from
  the Docker host, but you want other aspects of the container to be isolated.
{% endcomment %}
- **ホストネットワーク** は、ネットワーク層が Docker ホストとは隔離されないことが必要な場合、そしてコンテナーの隔離は別の観点で必要な場合に利用します。
@z

@x
- **Overlay networks** are best when you need containers running on different
  Docker hosts to communicate, or when multiple applications work together using
  swarm services.
@y
{% comment %}
- **Overlay networks** are best when you need containers running on different
  Docker hosts to communicate, or when multiple applications work together using
  swarm services.
{% endcomment %}
- **オーバーレイネットワーク** は、異なる Docker ホスト上においてコンテナーが互いに通信する必要がある場合に利用します。
  あるいは swarm サービスを利用して複数アプリケーションを動作させる場合に利用します。
@z

@x
- **Macvlan networks** are best when you are migrating from a VM setup or
  need your containers to look like physical hosts on your network, each with a
  unique MAC address.
@y
{% comment %}
- **Macvlan networks** are best when you are migrating from a VM setup or
  need your containers to look like physical hosts on your network, each with a
  unique MAC address.
{% endcomment %}
- **Macvlan ネットワーク** は、VM 環境から移行する場合や、ネットワーク上の物理ホストのようにコンテナーを扱う必要がある場合に利用します。  個々においては固有の MAC アドレスが用いられます。
@z

@x
- **Third-party network plugins** allow you to integrate Docker with specialized
  network stacks.
@y
{% comment %}
- **Third-party network plugins** allow you to integrate Docker with specialized
  network stacks.
{% endcomment %}
- **サードパーティー製ネットワークプラグイン** は、Docker に特別なネットワークスタックを統合します。
@z

@x
## Networking tutorials
@y
{% comment %}
## Networking tutorials
{% endcomment %}
{: #networking-tutorials }
## ネットワークに関するチュートリアル
@z

@x
Now that you understand the basics about Docker networks, deepen your
understanding using the following tutorials:
@y
{% comment %}
Now that you understand the basics about Docker networks, deepen your
understanding using the following tutorials:
{% endcomment %}
Docker ネットワークの基本について理解してきました。
以下のチュートリアルを通じて、さらに理解を深めてください。
@z

@x
- [Standalone networking tutorial](network-tutorial-standalone.md)
- [Host networking tutorial](network-tutorial-host.md)
- [Overlay networking tutorial](network-tutorial-overlay.md)
- [Macvlan networking tutorial](network-tutorial-macvlan.md)
@y
{% comment %}
- [Standalone networking tutorial](network-tutorial-standalone.md)
- [Host networking tutorial](network-tutorial-host.md)
- [Overlay networking tutorial](network-tutorial-overlay.md)
- [Macvlan networking tutorial](network-tutorial-macvlan.md)
{% endcomment %}
- [スタンドアロンネットワークのチュートリアル](network-tutorial-standalone.md)
- [ホストネットワークのチュートリアル](network-tutorial-host.md)
- [オーバーレイネットワークのチュートリアル](network-tutorial-overlay.md)
- [Macvlan ネットワークのチュートリアル](network-tutorial-macvlan.md)
@z
