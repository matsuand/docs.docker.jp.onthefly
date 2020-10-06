%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Networking
keywords: mac, networking
redirect_from:
- /mackit/networking/
title: Networking features in Docker Desktop for Mac
---
{% assign Arch = 'Mac' %}
@y
---
description: ネットワーク機能。
keywords: mac, networking
redirect_from:
- /mackit/networking/
title: Docker Desktop for Mac のネットワーク機能
---
{% assign Arch = 'Mac' %}
@z

@x
Docker Desktop for {{Arch}} provides several networking features to make it
easier to use.
@y
{% comment %}
Docker Desktop for {{Arch}} provides several networking features to make it
easier to use.
{% endcomment %}
Docker Desktop for {{Arch}} では、より簡単に利用できるネットワーク機能をいくつも提供しています。
@z

@x
## Features
@y
{% comment %}
## Features
{% endcomment %}
{: #features }
## 機能
@z

@x
### VPN Passthrough
@y
{% comment %}
### VPN Passthrough
{% endcomment %}
{: #vpn-passthrough }
### VPN パススルー
@z

@x
Docker Desktop for {{Arch}}'s networking can work when attached to a VPN. To do this,
Docker Desktop for {{Arch}} intercepts traffic from the containers and injects it into
{{Arch}} as if it originated from the Docker application.
@y
{% comment %}
Docker Desktop for {{Arch}}'s networking can work when attached to a VPN. To do this,
Docker Desktop for {{Arch}} intercepts traffic from the containers and injects it into
{{Arch}} as if it originated from the Docker application.
{% endcomment %}
Docker Desktop for {{Arch}} のネットワークは VPN に接続して利用することができます。
このとき Docker Desktop for {{Arch}} は、コンテナーからのトラフィックを捕捉し {{Arch}} へ受け渡します。
まるで Docker アプリケーションから発信されたかのように扱います。
@z

@x
### Port Mapping
@y
{% comment %}
### Port Mapping
{% endcomment %}
{: #port-mapping }
### ポートマッピング
@z

@x
When you run a container with the `-p` argument, for example:
@y
{% comment %}
When you run a container with the `-p` argument, for example:
{% endcomment %}
コンテナーの起動時に、たとえば以下のように `-p` 引数をつけたとします。
@z

@x
```
$ docker run -p 80:80 -d nginx
```
@y
```
$ docker run -p 80:80 -d nginx
```
@z

@x
Docker Desktop for {{Arch}} makes whatever is running on port 80 in the container (in
this case, `nginx`) available on port 80 of `localhost`. In this example, the
host and container ports are the same. What if you need to specify a different
host port? If, for example, you already have something running on port 80 of
your host machine, you can connect the container to a different port:
@y
{% comment %}
Docker Desktop for {{Arch}} makes whatever is running on port 80 in the container (in
this case, `nginx`) available on port 80 of `localhost`. In this example, the
host and container ports are the same. What if you need to specify a different
host port? If, for example, you already have something running on port 80 of
your host machine, you can connect the container to a different port:
{% endcomment %}
Docker Desktop for {{Arch}} は、コンテナー上のポート 80 を使って稼動するものすべて（この場合は `nginx`）、`localhost` のポート 80 から利用できるようにします。
この例では、ホストとコンテナーのそれぞれのポート番号は同一にしています。
ホストのポートを別のものに指定する必要があるとしたら、どうなるでしょう。
つまり、ホストマシン上においてすでにポート 80 を利用して起動しているアプリケーションがあるなら、コンテナーのポートを別のものに接続したらよいことになります。
@z

@x
```
$ docker run -p 8000:80 -d nginx
```
@y
```
$ docker run -p 8000:80 -d nginx
```
@z

@x
Now, connections to `localhost:8000` are sent to port 80 in the container. The
syntax for `-p` is `HOST_PORT:CLIENT_PORT`.
@y
{% comment %}
Now, connections to `localhost:8000` are sent to port 80 in the container. The
syntax for `-p` is `HOST_PORT:CLIENT_PORT`.
{% endcomment %}
こうすると `localhost:8000` への接続が、コンテナー内のポート 80 へ接続されます。
`-p` の文法は `ホストポート:クライアントポート` です。
@z

@x
### HTTP/HTTPS Proxy Support
@y
{% comment %}
### HTTP/HTTPS Proxy Support
{% endcomment %}
{: #httphttps-proxy-support }
### HTTP/HTTPS プロキシーサポート
@z

@x
See [Proxies](index.md#proxies).
@y
{% comment %}
See [Proxies](index.md#proxies).
{% endcomment %}
[Proxies タブ](index.md#proxies) を参照してください。
@z

@x
## Known limitations, use cases, and workarounds
@y
{% comment %}
## Known limitations, use cases, and workarounds
{% endcomment %}
{: #known-limitations-use-cases-and-workarounds }
## 既知の制約、利用状況、回避策
@z

@x
Following is a summary of current limitations on the Docker Desktop for {{Arch}}
networking stack, along with some ideas for workarounds.
@y
{% comment %}
Following is a summary of current limitations on the Docker Desktop for {{Arch}}
networking stack, along with some ideas for workarounds.
{% endcomment %}
以下では、Docker Desktop for {{Arch}} の現状のネットワーク機能における制約と回避方法についてまとめます。
@z

@x
### There is no docker0 bridge on macOS
@y
{% comment %}
### There is no docker0 bridge on macOS
{% endcomment %}
{: #there-is-no-docker0-bridge-on-macos }
### macOS 上に docker0 ブリッジがない
@z

@x
Because of the way networking is implemented in Docker Desktop for Mac, you cannot see a
`docker0` interface on the host. This interface is actually within the virtual
machine.
@y
{% comment %}
Because of the way networking is implemented in Docker Desktop for Mac, you cannot see a
`docker0` interface on the host. This interface is actually within the virtual
machine.
{% endcomment %}
Docker Desktop for Mac におけるネットワーク機能の実装方法により、ホスト上から `docker0` インターフェースを見ることはできません。
このインターフェースは仮想マシン内にあります。
@z

@x
### I cannot ping my containers
@y
{% comment %}
### I cannot ping my containers
{% endcomment %}
{: #i-cannot-ping-my-containers }
### コンテナーに ping ができない
@z

@x
Docker Desktop for Mac can't route traffic to containers.
@y
{% comment %}
Docker Desktop for Mac can't route traffic to containers.
{% endcomment %}
Docker Desktop for Mac がコンテナーに対して、トラフィックをルーティングできません。
@z

@x
### Per-container IP addressing is not possible
@y
{% comment %}
### Per-container IP addressing is not possible
{% endcomment %}
{: #per-container-ip-addressing-is-not-possible }
### コンテナー単位の IP アドレス割り当てができない
@z

@x
The docker (Linux) bridge network is not reachable from the macOS host.
@y
{% comment %}
The docker (Linux) bridge network is not reachable from the macOS host.
{% endcomment %}
Docker の（Linux における）ブリッジネットワークが、macOS ホストからアクセスできません。
@z

@x
### Use cases and workarounds
@y
{% comment %}
### Use cases and workarounds
{% endcomment %}
{: #use-cases-and-workarounds }
### 利用状況と回避策
@z

@x
There are two scenarios that the above limitations affect:
@y
{% comment %}
There are two scenarios that the above limitations affect:
{% endcomment %}
上記の制約から影響を受ける利用状況が 2 つあります。
@z

@x
#### I want to connect from a container to a service on the host
@y
{% comment %}
#### I want to connect from a container to a service on the host
{% endcomment %}
{: #i-want-to-connect-from-a-container-to-a-service-on-the-host }
#### コンテナーからホスト上のサービスに接続したい
@z

@x
The host has a changing IP address (or none if you have no network access). We recommend that you connect to the special DNS name
`host.docker.internal` which resolves to the internal IP address used by the
host. This is for development purpose and will not work in a production environment outside of Docker Desktop for Mac.
@y
{% comment %}
The host has a changing IP address (or none if you have no network access). From
18.03 onwards our recommendation is to connect to the special DNS name
`host.docker.internal`, which resolves to the internal IP address used by the
host.
This is for development purpose and will not work in a production environment outside of Docker Desktop for Mac.
{% endcomment %}
ホストには可変の IP アドレスがあります（もっともネットワークを利用しなければ何もありません）。
推奨されるのは、特別な DNS 名 `host.docker.internal` に接続することです。
この DNS は、ホストが利用する内部 IP アドレスを名前解決します。
これは開発環境において用いられるものであり、Docker Desktop for Mac の範囲外にある本番環境では動作しません。
@z

@x
You can also reach the gateway using `gateway.docker.internal`.
@y
{% comment %}
You can also reach the gateway using `gateway.docker.internal`.
{% endcomment %}
ゲートウェイも `gateway.docker.internal` を利用してアクセス可能です。
@z

@x
If you have installed Python on your machine, use the following instructions as an example to connect from a container to a service on the host:
@y
{% comment %}
If you have installed Python on your machine, use the following instructions as an example to connect from a container to a service on the host:
{% endcomment %}
マシン上に Python をインストールしている場合は、例として以下の手順に従い、コンテナーからホスト上のサービスに接続します。
@z

@x
1. Run the following command to start a simple HTTP server on port 8000.
@y
{% comment %}
1. Run the following command to start a simple HTTP server on port 8000.
{% endcomment %}
1. 以下のコマンドを実行して、単純の HTTP サーバーをポート 8000 で起動します。
@z

@x
    `python -m http.server 8000`
@y
    `python -m http.server 8000`
@z

@x
    If you have installed Python 2.x, run `python -m SimpleHTTPServer 8000`.
@y
    {% comment %}
    If you have installed Python 2.x, run `python -m SimpleHTTPServer 8000`.
    {% endcomment %}
    Python 2.x をインストールしている場合は、`python -m SimpleHTTPServer 8000` を実行します。
@z

@x
2. Now, run a container, install `curl`, and try to connect to the host using the following commands:
@y
{% comment %}
2. Now, run a container, install `curl`, and try to connect to the host using the following commands:
{% endcomment %}
2. そしてコンテナーの実行と `curl` のインストールを行って、以下のコマンドのようにホストへの接続を試してみます。
@z

@x
    ```console
    $ docker run --rm -it alpine sh
    # apk add curl
    # curl http://host.docker.internal:8000
    # exit
    ```
@y
    ```console
    $ docker run --rm -it alpine sh
    # apk add curl
    # curl http://host.docker.internal:8000
    # exit
    ```
@z

@x
#### I want to connect to a container from the Mac
@y
{% comment %}
#### I want to connect to a container from the Mac
{% endcomment %}
{: #i-want-to-connect-to-a-container-from-the-mac }
#### Mac からコンテナーに接続したい
@z

@x
Port forwarding works for `localhost`; `--publish`, `-p`, or `-P` all work.
Ports exposed from Linux are forwarded to the host.
@y
{% comment %}
Port forwarding works for `localhost`; `--publish`, `-p`, or `-P` all work.
Ports exposed from Linux are forwarded to the host.
{% endcomment %}
`localhost` に対するポート転送（port forwarding）が動作します。
つまり `--publish`、`-p`、`-P` はすべて動きます。
Linux コンテナーから公開されたポートは、ホストに転送されます。
@z

@x
Our current recommendation is to publish a port, or to connect from another
container. This is what you need to do even on Linux if the container is on an
overlay network, not a bridge network, as these are not routed.
@y
{% comment %}
Our current recommendation is to publish a port, or to connect from another
container. This is what you need to do even on Linux if the container is on an
overlay network, not a bridge network, as these are not routed.
{% endcomment %}
今のところ推奨される方法は、ポートを公開するか、あるいはもう 1 つ別のコンテナーから接続することです。
Linux 上であっても、コンテナーがブリッジネットワーク上ではなく、オーバーレイネットワーク上にある場合には、こういった方法が必要になります。
その場合にはルートが解決されないからです。
@z

@x
The command to run the `nginx` webserver shown in [Getting Started](index.md#explore-the-application)
is an example of this.
@y
{% comment %}
The command to run the `nginx` webserver shown in [Getting Started](index.md#explore-the-application)
is an example of this.
{% endcomment %}
以下は、[はじめよう](index.md#explore-the-application) の節に示している `nginx` ウェブサーバーの起動コマンドです。
@z

@x
```bash
$ docker run -d -p 80:80 --name webserver nginx
```
@y
```bash
$ docker run -d -p 80:80 --name webserver nginx
```
@z

@x
To clarify the syntax, the following two commands both expose port `80` on the
container to port `8000` on the host:
@y
{% comment %}
To clarify the syntax, the following two commands both expose port `80` on the
container to port `8000` on the host:
{% endcomment %}
文法を明確にする目的で、以下の 2 つのコマンドを実行します。
両方ともコンテナー上のポート `80` を、ホスト上のポート `8000` に向けて公開するものです。
@z

@x
```bash
$ docker run --publish 8000:80 --name webserver nginx
@y
```bash
$ docker run --publish 8000:80 --name webserver nginx
@z

@x
$ docker run -p 8000:80 --name webserver nginx
```
@y
$ docker run -p 8000:80 --name webserver nginx
```
@z

@x
To expose all ports, use the `-P` flag. For example, the following command
starts a container (in detached mode) and the `-P` exposes all ports on the
container to random ports on the host.
@y
{% comment %}
To expose all ports, use the `-P` flag. For example, the following command
starts a container (in detached mode) and the `-P` exposes all ports on the
container to random ports on the host.
{% endcomment %}
ポートをすべて公開するには `-P` フラグを使います。
たとえば以下のコマンドは（デタッチモードで）コンテナーを起動し、`-P` フラグによってコンテナー上の全ポートを、ホスト上のランダムなポートとして公開します。
@z

@x
```bash
$ docker run -d -P --name webserver nginx
```
@y
```bash
$ docker run -d -P --name webserver nginx
```
@z

@x
See the [run command](../engine/reference/commandline/run.md) for more details on
publish options used with `docker run`.
@y
{% comment %}
See the [run command](../engine/reference/commandline/run.md) for more details on
publish options used with `docker run`.
{% endcomment %}
`docker run` コマンドにて利用できる、ポート公開に関するオプションの詳細については [run コマンド](../engine/reference/commandline/run.md) を参照してください。
@z
