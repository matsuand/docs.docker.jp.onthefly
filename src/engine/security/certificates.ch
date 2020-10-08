%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to set up and use certificates with a registry to verify access
keywords: Usage, registry, repository, client, root, certificate, docker, apache, ssl, tls, documentation, examples, articles, tutorials
redirect_from:
- /engine/articles/certificates/
title: Verify repository client with certificates
---
@y
---
description: レジストリへのアクセス認証に証明書を使うための設定方法を示します。
keywords: Usage, registry, repository, client, root, certificate, docker, apache, ssl, tls, documentation, examples, articles, tutorials
redirect_from:
- /engine/articles/certificates/
title: 証明書を使ったリポジトリクライアントの確認
---
@z

@x
In [Running Docker with HTTPS](https.md), you learned that, by default,
Docker runs via a non-networked Unix socket and TLS must be enabled in order
to have the Docker client and the daemon communicate securely over HTTPS.  TLS ensures authenticity of the registry endpoint and that traffic to/from registry is encrypted.
@y
{% comment %}
In [Running Docker with HTTPS](https.md), you learned that, by default,
Docker runs via a non-networked Unix socket and TLS must be enabled in order
to have the Docker client and the daemon communicate securely over HTTPS.  TLS ensures authenticity of the registry endpoint and that traffic to/from registry is encrypted.
{% endcomment %}
[HTTPS による Docker 起動](https.md) において学んだことは、デフォルトにおいて Docker はインターネット通信ではない Unix ソケットを通じて動作しているということでした。
また Docker クライアントとデーモンとの間で HTTPS を介して安全なやり取りとするためには TLS を有効にしなければならないということでした。
TLS はレジストリエンドポイントが信頼できるものであることを確実にし、レジストリとの間のトラフィックは暗号化してくれます。
@z

@x
This article demonstrates how to ensure the traffic between the Docker registry
server and the Docker daemon (a client of the registry server) is encrypted and
properly authenticated using *certificate-based client-server authentication*.
@y
{% comment %}
This article demonstrates how to ensure the traffic between the Docker registry
server and the Docker daemon (a client of the registry server) is encrypted and
properly authenticated using *certificate-based client-server authentication*.
{% endcomment %}
本文においては、Docker レジストリサーバーと Docker デーモン（レジストリサーバーに対するクライアント）の間において、通信トラフィックが暗号化され、**証明書ベースのクライアントサーバー認証** を用いて適切に認証されることを示します。
@z

@x
We show you how to install a Certificate Authority (CA) root certificate
for the registry and how to set the client TLS certificate for verification.
@y
{% comment %}
We show you how to install a Certificate Authority (CA) root certificate
for the registry and how to set the client TLS certificate for verification.
{% endcomment %}
ここではレジストリにおいて、認証局（Certificate Authority; CA）のルート証明書のインストール方法と、クライアント TLS 証明書の設定方法を示します。
@z

@x
## Understand the configuration
@y
{% comment %}
## Understand the configuration
{% endcomment %}
{: #understand-the-configuration }
## 設定内容の理解
@z

@x
A custom certificate is configured by creating a directory under
`/etc/docker/certs.d` using the same name as the registry's hostname, such as
`localhost`. All `*.crt` files are added to this directory as CA roots.
@y
{% comment %}
A custom certificate is configured by creating a directory under
`/etc/docker/certs.d` using the same name as the registry's hostname, such as
`localhost`. All `*.crt` files are added to this directory as CA roots.
{% endcomment %}
カスタム証明書は `/etc/docker/certs.d` ディレクトリ配下に新たなディレクトリを生成して、そこに設定ファイルを置きます。
ディレクトリ名はレジストリのホスト名と同一に、たとえば `localhost` のようにします。
`*.crt` ファイルはすべて、CA ルートとしてこのディレクトリに追加していきます。
@z

@x
> **Note**:
> As of Docker 1.13, on Linux any root certificates authorities are merged
> with the system defaults, including as the host's root CA set. On prior
versions of Docker, and on Docker Enterprise Edition for Windows Server,
> the system default certificates are only used when no custom root certificates
> are configured.
@y
{% comment %}
> **Note**:
> As of Docker 1.13, on Linux any root certificates authorities are merged
> with the system defaults, including as the host's root CA set. On prior
versions of Docker, and on Docker Enterprise Edition for Windows Server,
> the system default certificates are only used when no custom root certificates
> are configured.
{% endcomment %}
> **メモ**:
> Docker 1.13 の時点において、Linux 上のルート認証局は、システムが持つデフォルトのものにマージされます。
> したがってそこにはホストのルート認証局のセットも含まれます。
> これ以前の Docker や Windows Server 向けの Docker Enterprise Edition においては、カスタムルート証明書が設定されていない場合に限って、システムのデフォルト証明書が利用されます。
@z

@x
The presence of one or more `<filename>.key/cert` pairs indicates to Docker
that there are custom certificates required for access to the desired
repository.
@y
{% comment %}
The presence of one or more `<filename>.key/cert` pairs indicates to Docker
that there are custom certificates required for access to the desired
repository.
{% endcomment %}
1 つでも `<filename>.key/cert` のペアがあるということは、そのリポジトリに対するアクセスにはカスタム証明書が必要であることを Docker に伝えるものです。
@z

@x
> **Note**:
> If multiple certificates exist, each is tried in alphabetical
> order. If there is a 4xx-level or 5xx-level authentication error, Docker
> continues to try with the next certificate.
@y
{% comment %}
> **Note**:
> If multiple certificates exist, each is tried in alphabetical
> order. If there is a 4xx-level or 5xx-level authentication error, Docker
> continues to try with the next certificate.
{% endcomment %}
> **メモ**:
> 複数の証明書が存在していた場合、その処理はアルファベット順に行われます。
> 4xx や 5xx のレベルの認証エラーがあると、Docker はその次の証明書を使った処理を試します。
@z

@x
The following illustrates a configuration with custom certificates:
@y
{% comment %}
The following illustrates a configuration with custom certificates:
{% endcomment %}
以下は、複数のカスタム証明書がある場合の設定例です。
@z

@x
```
    /etc/docker/certs.d/        <-- Certificate directory
    └── localhost:5000          <-- Hostname:port
       ├── client.cert          <-- Client certificate
       ├── client.key           <-- Client key
       └── ca.crt               <-- Certificate authority that signed
                                    the registry certificate
```
@y
{% comment %}
```
    /etc/docker/certs.d/        <-- Certificate directory
    └── localhost:5000          <-- Hostname:port
       ├── client.cert          <-- Client certificate
       ├── client.key           <-- Client key
       └── ca.crt               <-- Certificate authority that signed
                                    the registry certificate
```
{% endcomment %}
```
    /etc/docker/certs.d/        <-- 証明書のディレクトリ
    └── localhost:5000          <-- ホスト名：ポート
       ├── client.cert          <-- クライアント証明書
       ├── client.key           <-- クライアント鍵
       └── ca.crt               <-- レジストリ証明書に署名した認証局
```
@z

@x
The preceding example is operating-system specific and is for illustrative
purposes only. You should consult your operating system documentation for
creating an os-provided bundled certificate chain.
@y
{% comment %}
The preceding example is operating-system specific and is for illustrative
purposes only. You should consult your operating system documentation for
creating an os-provided bundled certificate chain.
{% endcomment %}
上記は、オペレーティングシステムに特有のものであって、単に一例を示しただけにすぎません。
OS が提供する証明書チェーンを生成するためには、各オペレーティングシステムのドキュメントを参照してください。
@z

@x
## Create the client certificates
@y
{% comment %}
## Create the client certificates
{% endcomment %}
{: #create-the-client-certificates }
## クライアント証明書の生成
@z

@x
Use OpenSSL's `genrsa` and `req` commands to first generate an RSA
key and then use the key to create the certificate.   
@y
{% comment %}
Use OpenSSL's `genrsa` and `req` commands to first generate an RSA
key and then use the key to create the certificate.   
{% endcomment %}
OpenSSL の `genrsa` コマンドと `req` コマンドを使って、まずは RSA 鍵を生成します。
そしてこの鍵を使って証明書を生成します。
@z

@x
    $ openssl genrsa -out client.key 4096
    $ openssl req -new -x509 -text -key client.key -out client.cert
@y
    $ openssl genrsa -out client.key 4096
    $ openssl req -new -x509 -text -key client.key -out client.cert
@z

@x
> **Note**:
> These TLS commands only generate a working set of certificates on Linux.
> The version of OpenSSL in macOS is incompatible with the type of
> certificate Docker requires.
@y
{% comment %}
> **Note**:
> These TLS commands only generate a working set of certificates on Linux.
> The version of OpenSSL in macOS is incompatible with the type of
> certificate Docker requires.
{% endcomment %}
> **メモ**:
> この TLS コマンドが生成するのは Linux 上において動作する証明書です。
> macOS における OpenSSL バージョンは、Docker が必要とする種類の証明書のタイプとは互換性がありません。
@z

@x
## Troubleshooting tips
@y
{% comment %}
## Troubleshooting tips
{% endcomment %}
{: #troubleshooting-tips }
## トラブルシューティングのためのヒント
@z

@x
The Docker daemon interprets `.crt` files as CA certificates and `.cert` files
as client certificates. If a CA certificate is accidentally given the extension
`.cert` instead of the correct `.crt` extension, the Docker daemon logs the
following error message:
@y
{% comment %}
The Docker daemon interprets `.crt` files as CA certificates and `.cert` files
as client certificates. If a CA certificate is accidentally given the extension
`.cert` instead of the correct `.crt` extension, the Docker daemon logs the
following error message:
{% endcomment %}
Docker デーモンは `.crt` ファイルを CA 証明書として、`.cert` ファイルをクライアント証明書として、それぞれ解釈します。
仮に CA 証明書の拡張子が、本来の正しい `.crt` でなく間違って `.cert` になってしまっていたら、Docker デーモンは以下のようなエラーメッセージをログ出力します。
@z

@x
```
Missing key KEY_NAME for client certificate CERT_NAME. CA certificates should use the extension .crt.
```
@y
```
Missing key KEY_NAME for client certificate CERT_NAME. CA certificates should use the extension .crt.
```
@z

@x
If the Docker registry is accessed without a port number, do not add the port to the directory name.  The following shows the configuration for a registry on default port 443 which is accessed with `docker login my-https.registry.example.com`:
@y
{% comment %}
If the Docker registry is accessed without a port number, do not add the port to the directory name.  The following shows the configuration for a registry on default port 443 which is accessed with `docker login my-https.registry.example.com`:
{% endcomment %}
Docker レジストリをポート番号なしにアクセスするなら、ディレクトリ名にポート番号をつけないでください。
以下に示す設定は、デフォルトのポート 443 を使ってレジストリにアクセスできるようにするものです。
実際のアクセスは `docker login my-https.registry.example.com` のように行います。
@z

@x
```
    /etc/docker/certs.d/
    └── my-https.registry.example.com          <-- Hostname without port
       ├── client.cert
       ├── client.key
       └── ca.crt
```
@y
{% comment %}
```
    /etc/docker/certs.d/
    └── my-https.registry.example.com          <-- Hostname without port
       ├── client.cert
       ├── client.key
       └── ca.crt
```
{% endcomment %}
```
    /etc/docker/certs.d/
    └── my-https.registry.example.com          <-- ポートなしのホスト名
       ├── client.cert
       ├── client.key
       └── ca.crt
```
@z

@x
## Related information
@y
{% comment %}
## Related information
{% endcomment %}
{: #related-information }
## 関連情報
@z

@x
* [Use trusted images](trust/index.md)
* [Protect the Docker daemon socket](https.md)
@y
{% comment %}
* [Use trusted images](trust/index.md)
* [Protect the Docker daemon socket](https.md)
{% endcomment %}
* [信頼できるイメージの利用](trust/index.md)
* [Docker デーモンソケットの保護](https.md)
@z
