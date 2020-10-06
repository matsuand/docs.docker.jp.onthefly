%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "Network driver plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide"
---
@y
---
description: "ネットワークドライバープラグイン"
keywords: "Examples, Usage, plugins, docker, documentation, user guide"
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
# Docker network driver plugins
@y
{% comment %}
# Docker network driver plugins
{% endcomment %}
# Docker ネットワークドライバープラグイン
{: #docker-network-driver-plugins }
@z

@x
This document describes Docker Engine network driver plugins generally
available in Docker Engine. To view information on plugins
managed by Docker Engine, refer to [Docker Engine plugin system](index.md).
@y
{% comment %}
This document describes Docker Engine network driver plugins generally
available in Docker Engine. To view information on plugins
managed by Docker Engine, refer to [Docker Engine plugin system](index.md).
{% endcomment %}
ここでは Docker Engine において、一般的に利用可能な Docker Engine ネットワークドライバープラグインについて説明します。
Docker Engine が管理するプラグインに関する情報は [Docker Engine プラグインシステム](index.md) を参照してください。
@z

@x
Docker Engine network plugins enable Engine deployments to be extended to
support a wide range of networking technologies, such as VXLAN, IPVLAN, MACVLAN
or something completely different. Network driver plugins are supported via the
LibNetwork project. Each plugin is implemented as a  "remote driver" for
LibNetwork, which shares plugin infrastructure with Engine. Effectively, network
driver plugins are activated in the same way as other plugins, and use the same
kind of protocol.
@y
{% comment %}
Docker Engine network plugins enable Engine deployments to be extended to
support a wide range of networking technologies, such as VXLAN, IPVLAN, MACVLAN
or something completely different. Network driver plugins are supported via the
LibNetwork project. Each plugin is implemented as a  "remote driver" for
LibNetwork, which shares plugin infrastructure with Engine. Effectively, network
driver plugins are activated in the same way as other plugins, and use the same
kind of protocol.
{% endcomment %}
Docker Engine ネットワークプラグインは、Engineによるデプロイメントを拡張して、非常に多くのネットワーク技術へのサポートを可能とします。
対応するネットワーク技術としてたとえば VXLAN, IPVLAN, MACVLAN などがあり、これ以外にも全く異なる技術にも対応可能です。
ネットワークドライバープラグインは LibNetwork プロジェクトを通じてサポートされています。
各プラグインは LibNetwork における「リモートドライバー」として実装されており、Engine におけるプラグイン基盤を共有しています。
実際にネットワークドライバープラグインは、他のプラグインと同様の方法で取り入れることができるものであり、同じようなプロトコルを利用しています。
@z

@x
## Network plugins and swarm mode
@y
{% comment %}
## Network plugins and swarm mode
{% endcomment %}
## ネットワークプラグインとスウォームモード
{: #network-plugins-and-swarm-mode }
@z

@x
[Legacy plugins](legacy_plugins.md) do not work in swarm mode. However,
plugins written using the [v2 plugin system](index.md) do work in swarm mode, as
long as they are installed on each swarm worker node.
@y
{% comment %}
[Legacy plugins](legacy_plugins.md) do not work in swarm mode. However,
plugins written using the [v2 plugin system](index.md) do work in swarm mode, as
long as they are installed on each swarm worker node.
{% endcomment %}
[旧来のプラグイン](legacy_plugins.md) はスウォームモードでは動作しません。
一方 [v2 プラグインシステム](index.md) は、スウォーム上の各ワーカーノードにインストールしていれば、スウォームモードでも動作します。
@z

@x
## Use network driver plugins
@y
{% comment %}
## Use network driver plugins
{% endcomment %}
## ネットワークドライバープラグインの利用
{: #use-network-driver-plugins }
@z

@x
The means of installing and running a network driver plugin depend on the
particular plugin. So, be sure to install your plugin according to the
instructions obtained from the plugin developer.
@y
{% comment %}
The means of installing and running a network driver plugin depend on the
particular plugin. So, be sure to install your plugin according to the
instructions obtained from the plugin developer.
{% endcomment %}
ネットワークドライバープラグインのインストール方法や実行方法は、個々のプラグインにより異なります。
そこでプラグインをインストールする際には、プラグイン開発者が示す説明に従ってください。
@z

@x
Once running however, network driver plugins are used just like the built-in
network drivers: by being mentioned as a driver in network-oriented Docker
commands. For example,
@y
{% comment %}
Once running however, network driver plugins are used just like the built-in
network drivers: by being mentioned as a driver in network-oriented Docker
commands. For example,
{% endcomment %}
ネットワークドライバープラグインを実行することができれば、後はビルトインのネットワークドライバーと変わらずに利用していきます。
つまりネットワーク関連の Docker コマンドにおいて、ドライバーを取り扱うコマンドを用いていきます。
たとえば以下のとおりです。
@z

@x
    $ docker network create --driver weave mynet
@y
    $ docker network create --driver weave mynet
@z

@x
Some network driver plugins are listed in [plugins](legacy_plugins.md)
@y
{% comment %}
Some network driver plugins are listed in [plugins](legacy_plugins.md)
{% endcomment %}
ネットワークドライバープラグインの一覧が [プラグイン](legacy_plugins.md) にあります。
@z

@x
The `mynet` network is now owned by `weave`, so subsequent commands
referring to that network will be sent to the plugin,
@y
{% comment %}
The `mynet` network is now owned by `weave`, so subsequent commands
referring to that network will be sent to the plugin,
{% endcomment %}
`mynet` ネットワークは `weave` により所有されたので、これ以降にネットワークを参照するコマンドは、プラグインに送信され実行されることになります。
@z

@x
    $ docker run --network=mynet busybox top
@y
    $ docker run --network=mynet busybox top
@z

@x
## Find network plugins
@y
{% comment %}
## Find network plugins
{% endcomment %}
## ネットワークプラグインの検索
{: #find-network-plugins }
@z

@x
Network plugins are written by third parties, and are published by those
third parties, either on
[Docker Store](https://store.docker.com/search?category=network&q=&type=plugin)
or on the third party's site.
@y
{% comment %}
Network plugins are written by third parties, and are published by those
third parties, either on
[Docker Store](https://store.docker.com/search?category=network&q=&type=plugin)
or on the third party's site.
{% endcomment %}
ネットワークプラグインはサードパーティにより開発され公開されています。
[Docker Store](https://store.docker.com/search?category=network&q=&type=plugin) またはそのサードパーティのサイトから入手できます。
@z

@x
## Write a network plugin
@y
{% comment %}
## Write a network plugin
{% endcomment %}
## ネットワークプラグインの開発
{: #write-a-network-plugin }
@z

@x
Network plugins implement the [Docker plugin
API](plugin_api.md) and the network plugin protocol
@y
{% comment %}
Network plugins implement the [Docker plugin
API](plugin_api.md) and the network plugin protocol
{% endcomment %}
ネットワークプラグインは、[Docker プラグイン API](plugin_api.md) とネットワークプラグインプロトコルにより実装されます。
@z

@x
## Network plugin protocol
@y
{% comment %}
## Network plugin protocol
{% endcomment %}
## ネットワークプラグインプロトコル
{: #network-plugin-protocol }
@z

@x
The network driver protocol, in addition to the plugin activation call, is
documented as part of libnetwork:
[https://github.com/docker/libnetwork/blob/master/docs/remote.md](https://github.com/docker/libnetwork/blob/master/docs/remote.md).
@y
{% comment %}
The network driver protocol, in addition to the plugin activation call, is
documented as part of libnetwork:
[https://github.com/docker/libnetwork/blob/master/docs/remote.md](https://github.com/docker/libnetwork/blob/master/docs/remote.md).
{% endcomment %}
ネットワークドライバープロトコル、およびプラグインアクティベーションコール（plugin activation call）については、libnetwork の一部 [https://github.com/docker/libnetwork/blob/master/docs/remote.md](https://github.com/docker/libnetwork/blob/master/docs/remote.md) としてドキュメント化されています。
@z

@x
## Related Information
@y
{% comment %}
## Related Information
{% endcomment %}
## 関連情報
{: #related-information }
@z

@x
To interact with the Docker maintainers and other interested users, see the IRC channel `#docker-network`.
@y
{% comment %}
To interact with the Docker maintainers and other interested users, see the IRC channel `#docker-network`.
{% endcomment %}
Docker メンテナーや関心を寄せているユーザーと会話をしてみたい方は、IRC チャネル `#docker-network` にアクセスしてください。
@z

@x
-  [Docker networks feature overview](https://docs.docker.com/engine/userguide/networking/)
-  The [LibNetwork](https://github.com/docker/libnetwork) project
@y
{% comment %}
-  [Docker networks feature overview](https://docs.docker.com/engine/userguide/networking/)
-  The [LibNetwork](https://github.com/docker/libnetwork) project
{% endcomment %}
-  [Docker ネットワーク機能の概要](https://docs.docker.com/engine/userguide/networking/)
-  [LibNetwork](https://github.com/docker/libnetwork) プロジェクト
@z
