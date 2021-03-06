%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Configure Docker to use a proxy server
description: How to configure the Docker client to use a proxy server
keywords: network, networking, proxy, client
---
@y
---
title: プロキシーサーバー利用の設定
description: How to configure the Docker client to use a proxy server
keywords: network, networking, proxy, client
---
@z

@x
If your container needs to use an HTTP, HTTPS, or FTP proxy server, you can
configure it in different ways:
@y
コンテナーが HTTP、HTTPS、FTP によるプロキシーサーバーを必要とする場合、さまざまな方法により設定を行うことができます。
@z

@x
- In Docker 17.07 and higher, you can
  [configure the Docker client](#configure-the-docker-client) to pass
  proxy information to containers automatically.
@y
- Docker 17.07 またはそれ以降においては、[Docker クライアントの設定](#configure-the-docker-client) を行って、プロキシー情報をコンテナーに自動的に設定することができます。
@z

@x
- In Docker 17.06 and earlier versions, you must set the appropriate
  [environment variables](#use-environment-variables)
  within the container. You can do this when you build the image (which makes
  the image less portable) or when you create or run the container.
@y
- Docker 17.06 またはそれ以前においては、コンテナー内部にて [環境変数](#use-environment-variables) の適切な設定を行う必要があります。
  これを行うタイミングは、イメージビルド時（この場合は可搬性が劣ることになります）、生成時、実行時のいずれかになります。
@z

@x
## Configure the Docker client
@y
{: #configure-the-docker-client }
## Docker クライアントの設定
@z

@x
1.  On the Docker client, create or edit the file `~/.docker/config.json` in the
    home directory of the user that starts containers. Add JSON similar to the
    following example. Substitute the type of proxy with `httpsProxy` or `ftpProxy` if necessary, and substitute the address and port of the proxy server. You can also configure multiple proxy servers simultaneously.
@y
1.  Docker クライアント上において、コンテナーを起動するユーザーのホームディレクトリ内に`~/.docker/config.json`を新規生成するか、これを編集します。
    そして以下のような JSON 記述を追加します。
    この記述において、プロキシータイプとして必要であれば`httpsProxy`または`ftpProxy`を指定します。
    またプロキシーサーバーのアドレスとポートを指定します。
    プロキシーサーバーは、同時に複数設定することもできます。
@z

@x
    You can optionally exclude hosts or ranges from going through the proxy
    server by setting a `noProxy` key to one or more comma-separated IP
    addresses or hosts. Using the `*` character as a wildcard for hosts and using CIDR notation for IP addresses is supported as
    shown in this example:
@y
    プロキシーサーバーを介したくないホストや IP 範囲の指定が必要な場合は、`noProxy`キーにおいて IP アドレスまたはホスト名をカンマ区切りにより設定します。
    ホストに対してはアスタリスク`*`を用いたワイルドカード指定、IP アドレスに対しては CIDR 記法がサポートされています。
    たとえば以下に例を示します。
@z

@x
    ```json
    {
     "proxies":
     {
       "default":
       {
         "httpProxy": "http://192.168.1.12:3128",
         "httpsProxy": "http://192.168.1.12:3128",
         "noProxy": "*.test.example.com,.example2.com,127.0.0.0/8"
       }
     }
    }
    ```
@y
    ```json
    {
     "proxies":
     {
       "default":
       {
         "httpProxy": "http://192.168.1.12:3128",
         "httpsProxy": "http://192.168.1.12:3128",
         "noProxy": "*.test.example.com,.example2.com,127.0.0.0/8"
       }
     }
    }
    ```
@z

@x
    Save the file.
@y
    ファイルを保存します。
@z

@x
 2. When you create or start new containers, the environment variables are
    set automatically within the container.
@y
 2. コンテナーの新規生成時や起動時には、コンテナー内に環境変数が自動的に生成されます。
@z

@x
## Use environment variables
@y
{: #use-environment-variables }
## 環境変数の利用
@z

@x
### Set the environment variables manually
@y
{: #set-the-environment-variables-manually }
### 環境変数の手動設定
@z

@x
When you build the image, or using the `--env` flag when you create or run the
container, you can set one or more of the following variables to the appropriate
value. This method makes the image less portable, so if you have Docker 17.07
or higher, you should [configure the Docker client](#configure-the-docker-client)
instead.
@y
イメージをビルドした場合、あるいはコンテナーの生成、実行時に`--env`フラグを利用した場合、以下に示すような環境変数を使って、値を設定して利用することができます。
この方法ではイメージの可搬性が損なわれます。
したがって Docker 17.07 またはそれ以降を利用している場合は、代わりに [Docker クライアントの設定](#configure-the-docker-client) を行ってください。
@z

@x
| Variable      | Dockerfile example                                | `docker run` example                                |
|:--------------|:--------------------------------------------------|:----------------------------------------------------|
| `HTTP_PROXY`  | `ENV HTTP_PROXY="http://192.168.1.12:3128"`          | `--env HTTP_PROXY="http://192.168.1.12:3128"`          |
| `HTTPS_PROXY` | `ENV HTTPS_PROXY="https://192.168.1.12:3128"`        | `--env HTTPS_PROXY="https://192.168.1.12:3128"`        |
| `FTP_PROXY`   | `ENV FTP_PROXY="ftp://192.168.1.12:3128"`            | `--env FTP_PROXY="ftp://192.168.1.12:3128"`            |
| `NO_PROXY`    | `ENV NO_PROXY="*.test.example.com,.example2.com"` | `--env NO_PROXY="*.test.example.com,.example2.com"` |
@y
| 変数          | Dockerfile 例                                     | `docker run`実行例                                  |
|:--------------|:--------------------------------------------------|:----------------------------------------------------|
| `HTTP_PROXY`  | `ENV HTTP_PROXY="http://192.168.1.12:3128"`       | `--env HTTP_PROXY="http://192.168.1.12:3128"`       |
| `HTTPS_PROXY` | `ENV HTTPS_PROXY="https://192.168.1.12:3128"`     | `--env HTTPS_PROXY="https://192.168.1.12:3128"`     |
| `FTP_PROXY`   | `ENV FTP_PROXY="ftp://192.168.1.12:3128"`         | `--env FTP_PROXY="ftp://192.168.1.12:3128"`         |
| `NO_PROXY`    | `ENV NO_PROXY="*.test.example.com,.example2.com"` | `--env NO_PROXY="*.test.example.com,.example2.com"` |
@z
