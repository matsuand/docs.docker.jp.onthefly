%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Disable networking for a container
description: How to disable networking by using the none driver
keywords: network, none, standalone
---
@y
---
title: コンテナーのネットワーク無効化
description: none ドライバーを用いることでネットワークを無効にする方法を説明します。
keywords: network, none, standalone
---
@z

@x
If you want to completely disable the networking stack on a container, you can
use the `--network none` flag when starting the container. Within the container,
only the loopback device is created. The following example illustrates this.
@y
コンテナーにおけるネットワーク機能を完全に無効にしたい場合は、コンテナーの起動時に`--network none`を指定します。
コンテナー内部では、ループバックデバイスだけが生成されます。
以下にこの例を示します。
@z

@x
1.  Create the container.
@y
1.  コンテナーを生成します。
@z

@x
    ```console
    $ docker run --rm -dit \
      --network none \
      --name no-net-alpine \
      alpine:latest \
      ash
    ```
@y
    ```console
    $ docker run --rm -dit \
      --network none \
      --name no-net-alpine \
      alpine:latest \
      ash
    ```
@z

@x
2.  Check the container's network stack, by executing some common networking
    commands within the container. Notice that no `eth0` was created.
@y
2.  コンテナーのネットワーク機能を確認します。
    これには、コンテナー内において標準的なネットワークコマンドを実行します。
    なお`eth0`は生成されていません。
@z

@x
    ```console
    $ docker exec no-net-alpine ip link show
@y
    ```console
    $ docker exec no-net-alpine ip link show
@z

@x
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    2: tunl0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN qlen 1
        link/ipip 0.0.0.0 brd 0.0.0.0
    3: ip6tnl0@NONE: <NOARP> mtu 1452 qdisc noop state DOWN qlen 1
        link/tunnel6 00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00 brd 00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00
    ```
@y
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    2: tunl0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN qlen 1
        link/ipip 0.0.0.0 brd 0.0.0.0
    3: ip6tnl0@NONE: <NOARP> mtu 1452 qdisc noop state DOWN qlen 1
        link/tunnel6 00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00 brd 00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00
    ```
@z

@x
    ```console
    $ docker exec no-net-alpine ip route
    ```
@y
    ```console
    $ docker exec no-net-alpine ip route
    ```
@z

@x
    The second command returns empty because there is no routing table.
@y
    2 つめのコマンドは何も返しません。
    ルーティングテーブルがないためです。
@z

@x
3.  Stop the container. It is removed automatically because it was created with
    the `--rm` flag.
@y
3.  コンテナーを停止します。
    `--rm`フラグを使って生成しているため、コンテナーは自動的に削除されます。
@z

@x
    ```console
    $ docker stop no-net-alpine
    ```
@y
    ```console
    $ docker stop no-net-alpine
    ```
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
-  Go through the [host networking tutorial](network-tutorial-host.md)
- Learn about [networking from the container's point of view](../config/containers/container-networking.md)
- Learn about [bridge networks](bridge.md)
- Learn about [overlay networks](overlay.md)
- Learn about [Macvlan networks](macvlan.md)
@y
- [ホストネットワークチュートリアル](network-tutorial-host.md) を一通り読む
- [コンテナーから見たネットワーク](../config/containers/container-networking.md) について
- [ブリッジネットワーク](bridge.md) について
- [オーバーレイネットワーク](overlay.md) について
- [Macvlan ネットワーク](macvlan.md) について
@z
