%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use host networking
description: All about exposing containers on the Docker host's network
keywords: network, host, standalone
---
@y
---
title: ホストネットワークの利用
description: All about exposing containers on the Docker host's network
keywords: network, host, standalone
---
@z

@x
If you use the `host` network mode for a container, that container's network
stack is not isolated from the Docker host (the container shares the host's
networking namespace), and the container does not get its own IP-address allocated.
For instance, if you run a container which binds to port 80 and you use `host`
networking, the container's application is available on port 80 on the host's IP
address.
@y
コンテナーに対して`host`ネットワークモードを利用すると、コンテナーのネットワーク構成は Docker ホストからは分離されません。
（そのコンテナーはホストのネットワーク名前空間を共有します。）
そしてそのコンテナーは、独自に割り当てられる IP アドレスを用いません。
たとえばポート 80 を割り当てているコンテナーを実行するにあたり、`host`ネットワークとしている場合、コンテナー上に動作するアプリケーションは、ホストの IP アドレスにおけるポート 80 が利用可能となります。
@z

@x
> **Note**: Given that the container does not have its own IP-address when using
> `host` mode networking, [port-mapping](overlay.md#publish-ports) does not
> take effect, and the `-p`, `--publish`, `-P`, and `--publish-all` option are
> ignored, producing a warning instead:
>
> ```console
> WARNING: Published ports are discarded when using host network mode
> ```
@y
> **メモ**
>
> `host`モードのネットワークを利用する場合、コンテナーは独自の IP アドレスを持たないため、[ポートマッピング](overlay.md#publish-ports) は機能しません。
> したがって`-p`、`--publish`、`-P`、`--publish-all`の各オプションは無視され、警告メッセージが表示されます。
>
> ```console
> WARNING: Published ports are discarded when using host network mode
> ```
@z

@x
Host mode networking can be useful to optimize performance, and in situations where
a container needs to handle a large range of ports, as it does not require network
address translation (NAT), and no "userland-proxy" is created for each port.
@y
ネットワークをホストモードにすると、性能を最適化できます。
またコンテナーが広範囲にわたるポートを取り扱う必要がある場合に役立ちます。
これは、ネットワークアドレス変換（NAT）が不要であり、各ポートに「ユーザーランドプロキシー」が生成されないからです。
@z

@x
The host networking driver only works on Linux hosts, and is not supported on
Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.
@y
ホストネットワークにおけるドライバーは Linux ホスト上においてのみ動作します。
Docker Desktop for Mac、Docker Desktop for Windows、Docker EE for Windows Server ではサポートされていません。
@z

@x
You can also use a `host` network for a swarm service, by passing `--network host`
to the `docker service create` command. In this case, control traffic (traffic
related to managing the swarm and the service) is still sent across an overlay
network, but the individual swarm service containers send data using the Docker
daemon's host network and ports. This creates some extra limitations. For instance,
if a service container binds to port 80, only one service container can run on a
given swarm node.
@y
`host`ネットワークは Swarm サービスに対しても利用できます。
利用するには`docker service create`コマンドに`--network host`を指定します。
この場合、制御情報のトラフィック（Swarm やサービスの管理に関連するトラフィック）は、変わらずオーバーレイネットワークを介して送信されます。
一方、個々の Swarm サービスコンテナーは、Docker デーモンホスト上のネットワークとポートを利用して、データ送信を行います。
このときには、新たな制約が発生します。
たとえば 1 つのサービスコンテナーがポート 80 に割り当てられると、指定された Swarm ノード上では 1 つのサービスコンテナーしか稼動できません。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
- Go through the [host networking tutorial](network-tutorial-host.md)
- Learn about [networking from the container's point of view](../config/containers/container-networking.md)
- Learn about [bridge networks](bridge.md)
- Learn about [overlay networks](overlay.md)
- Learn about [Macvlan networks](macvlan.md)
@y
- [ホストネットワークのチュートリアル](network-tutorial-host.md) をひととおり読んでください。
- [コンテナーから見たネットワーク](../config/containers/container-networking.md) について。
- [ブリッジネットワーク](bridge.md) について。
- [オーバーレイネットワーク](overlay.md) について。
- [Macvlan ネットワーク](macvlan.md) について。
@z
