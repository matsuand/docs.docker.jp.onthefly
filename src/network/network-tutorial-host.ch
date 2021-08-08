%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Networking using the host network
description: Tutorials for networking using the host network, disabling network isolation
keywords: networking, host, standalone
---
@y
---
title: ホストネットワークのチュートリアル
description: Tutorials for networking using the host network, disabling network isolation
keywords: networking, host, standalone
---
@z

@x
This series of tutorials deals with networking standalone containers which bind
directly to the Docker host's network, with no network isolation. For other
networking topics, see the [overview](index.md).
@y
このチュートリアルでは、スタンドアロンコンテナーのネットワークを取り扱います。
Docker ホストのネットワークに直接割り当てられ、ネットワークの分離は行われません。
これ以外のネットワークに関することは [ネットワーク概要](index.md) を参照してください。
@z

@x
## Goal
@y
{: #goal }
## 目指すこと
@z

@x
The goal of this tutorial is to start a `nginx` container which binds directly
to port 80 on the Docker host. From a networking point of view, this is the
same level of isolation as if the `nginx` process were running directly on the
Docker host and not in a container. However, in all other ways, such as storage,
process namespace, and user namespace, the `nginx` process is isolated from the
host.
@y
本チュートリアルの目標は、`nginx`コンテナーを起動させ、Docker ホスト上のポート 80 に直接割り当てることです。
ネットワークの観点からは`nginx`のプロセスが、コンテナー内でなく Docker ホスト上で直接稼動している場合と同じレベルの分離が実現されていると言えます。
ただしこれ以外の点、つまりストレージ、プロセス名前空間、ユーザー名前空間などから見ると、`nginx`のプロセスはホストから分離されています。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
- This procedure requires port 80 to be available on the Docker host. To make
  Nginx listen on a different port, see the
  [documentation for the `nginx` image](https://hub.docker.com/_/nginx/)
@y
- 以下の手順においては、Docker ホスト上のポート 80 が利用できることが必要です。
  Nginx が別のポートを利用できるようにするには [`nginx`イメージのドキュメント](https://hub.docker.com/_/nginx/) を参照してください。
@z

@x
- The `host` networking driver only works on Linux hosts, and is not supported
  on Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.
@y
- `host`ネットワークドライバーは Linux ホスト上においてのみ動作します。
  一方、Docker Desktop for Mac、Docker Desktop for Windows、Docker EE for Windows Server ではサポートされていません。
@z

@x
## Procedure
@y
{: #procedure }
## 手順
@z

@x
1.  Create and start the container as a detached process. The `--rm` option means to remove the container once it exits/stops. The `-d` flag means to start the container detached (in the background). 
@y
1.  コンテナーを生成し、デタッチモードで起動します。
    `--rm`オプションは、コンテナーが終了または停止したときにコンテナーを削除するものです。
    `-d`フラグは、コンテナーをデタッチモード（バックグラウンド）で起動します。
@z

@x
    ```console
    $ docker run --rm -d --network host --name my_nginx nginx
    ```
@y
    ```console
    $ docker run --rm -d --network host --name my_nginx nginx
    ```
@z

@x
2.  Access Nginx by browsing to
    [http://localhost:80/](http://localhost:80/).
@y
2.  ブラウザーから [http://localhost:80/](http://localhost:80/) を入力して Nginx にアクセスします。
@z

@x
3.  Examine your network stack using the following commands:
@y
3.  以下のコマンドを実行して、ネットワークの状況を確認します。
@z

@x
    - Examine all network interfaces and verify that a new one was not created.
@y
    - ネットワークインターフェースをすべて確認します。
      そして新しいインターフェースは生成されていないことを確認します。
@z

@x
      ```console
      $ ip addr show
      ```
@y
      ```console
      $ ip addr show
      ```
@z

@x
    - Verify which process is bound to port 80, using the `netstat` command. You
      need to use `sudo` because the process is owned by the Docker daemon user
      and you otherwise won't be able to see its name or PID.
@y
    - `netstat`コマンドを使って、どのプロセスがポート 80 に割り当てられているかを確認します。
      実行にあたっては`sudo`が必要です。
      プロセスが Docker デーモンユーザーの所有になっているからであり、これを用いないとプロセス名やプロセス ID を確認することができません。
@z

@x
      ```console
      $ sudo netstat -tulpn | grep :80
      ```
@y
      ```console
      $ sudo netstat -tulpn | grep :80
      ```
@z

@x
4.  Stop the container. It will be removed automatically as it was started using the `--rm` option.
@y
4.  コンテナーを停止します。
    `--rm`オプションを指定して起動しているので、コンテナーは自動的に削除されます。
@z

@x
    ```basn
    docker container stop my_nginx
    ```
@y
    ```basn
    docker container stop my_nginx
    ```
@z

@x
## Other networking tutorials
@y
{: #other-networking-tutorials }
## その他のネットワークチュートリアル
@z

@x 原文誤りを日本語訳では修正
Now that you have completed the networking tutorials for standalone containers,
you might want to run through these other networking tutorials:
@y
ホストネットワークのチュートリアルを終えたので、以下に示すような別のネットワークチュートリアルも見てください。
@z

@x
- [Standalone networking tutorial](network-tutorial-standalone.md)
- [Overlay networking tutorial](network-tutorial-overlay.md)
- [Macvlan networking tutorial](network-tutorial-macvlan.md)
@y
- [スタンドアロンネットワークのチュートリアル](network-tutorial-standalone.md)
- [オーバーレイネットワークのチュートリアル](network-tutorial-overlay.md)
- [Macvlan ネットワークのチュートリアル](network-tutorial-macvlan.md)
@z
