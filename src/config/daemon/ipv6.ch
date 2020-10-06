%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Enable IPv6 support
description: How to enable IPv6 support in the Docker daemon
keywords: daemon, network, networking, ipv6
redirect_from:
- /engine/userguide/networking/default_network/ipv6/
---
@y
---
title: IPv6 サポートの有効化
description: Docker デーモンにおいて IPv6 サポートを有効にする方法を示します。
keywords: daemon, network, networking, ipv6
redirect_from:
- /engine/userguide/networking/default_network/ipv6/
---
@z

@x
Before you can use IPv6 in Docker containers or swarm services, you need to
enable IPv6 support in the Docker daemon. Afterward, you can choose to use
either IPv4 or IPv6 (or both) with any container, service, or network.
@y
{% comment %}
Before you can use IPv6 in Docker containers or swarm services, you need to
enable IPv6 support in the Docker daemon. Afterward, you can choose to use
either IPv4 or IPv6 (or both) with any container, service, or network.
{% endcomment %}
Docker コンテナーや Swarm サービスにおいて IPv6 を利用するには、まず Docker デーモンにおいて IPv6 サポートを有効にしておく必要があります。
これを行った後は、コンテナー、サービス、ネットワークのいずれに対しても、IPv4、IPv6（またその両方）を選択して利用することができます。
@z

@x
> **Note**: IPv6 networking is only supported on Docker daemons running on Linux
> hosts.
@y
{% comment %}
> **Note**: IPv6 networking is only supported on Docker daemons running on Linux
> hosts.
{% endcomment %}
> **メモ**: IPv6 ネットワークは、Linux ホスト上で稼動する Docker デーモンに対してのみサポートされています。
@z

@x
1.  Edit `/etc/docker/daemon.json`, set the `ipv6` key to `true` and the `fixed-cidr-v6` key
    to your IPv6 subnet. In this example we are setting it to `2001:db8:1::/64`.
@y
{% comment %}
1.  Edit `/etc/docker/daemon.json`, set the `ipv6` key to `true` and the `fixed-cidr-v6` key
    to your IPv6 subnet. In this example we are setting it to `2001:db8:1::/64`.
{% endcomment %}
1.  `/etc/docker/daemon.json` を編集して、`ipv6` キーを `true` に、また `fixed-cidr-v6` キーに IPv6 サブネットを設定します。
    本例では、後者を `2001:db8:1::/64` に設定します。
@z

@x
    ```json
    {
      "ipv6": true,
      "fixed-cidr-v6": "2001:db8:1::/64"
    }
    ```
@y
    ```json
    {
      "ipv6": true,
      "fixed-cidr-v6": "2001:db8:1::/64"
    }
    ```
@z

@x
    Save the file.
@y
    {% comment %}
    Save the file.
    {% endcomment %}
    ファイルを保存します。
@z

@x
2.  Reload the Docker configuration file.
@y
{% comment %}
2.  Reload the Docker configuration file.
{% endcomment %}
2.  Docker 設定ファイルを再読み込み（reload）します。
@z

@x
    ```bash
    $ systemctl reload docker
    ```
@y
    ```bash
    $ systemctl reload docker
    ```
@z

@x
You can now create networks with the `--ipv6` flag and assign containers IPv6
addresses using the `--ip6` flag.
@y
{% comment %}
You can now create networks with the `--ipv6` flag and assign containers IPv6
addresses using the `--ip6` flag.
{% endcomment %}
これから先は `--ipv6` フラグを使ってネットワークを生成することができます。
またコンテナーに対して `--ip6` フラグを使って IPv6 アドレスを割り当てることができます。
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
- [Networking overview](../../network/index.md)
- [Container networking](../containers/container-networking.md)
@y
{% comment %}
- [Networking overview](../../network/index.md)
- [Container networking](../containers/container-networking.md)
{% endcomment %}
- [ネットワーク概要](../../network/index.md)
- [コンテナーネットワーク](../containers/container-networking.md)
@z
