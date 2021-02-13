%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to setup and run Docker with SSH or HTTPS
keywords: docker, docs, article, example, ssh, https, daemon, tls, ca,  certificate
redirect_from:
- /articles/https/
- /engine/articles/https/
- /engine/security/https/
title: Protect the Docker daemon socket
---
@y
---
description: SSH や HTTPS により Docker を設定し実行します。
keywords: docker, docs, article, example, ssh, https, daemon, tls, ca,  certificate
redirect_from:
- /articles/https/
- /engine/articles/https/
- /engine/security/https/
title: Docker デーモンソケットの保護
---
@z

@x
By default, Docker runs through a non-networked UNIX socket. It can also
optionally communicate using SSH or a TLS (HTTPS) socket.
@y
デフォルトで Docker は、インターネットを介さない UNIX ソケットを通じて実行されます。
SSH や TLS（HTTPS）ソケットを用いた通信を行うこともできます。
@z

@x
## Use SSH to protect the Docker daemon socket
@y
{: #use-ssh-to-protect-the-docker-daemon-socket }
## SSH を用いた Docker デーモンソケットの保護
@z

@x
> **Note**
>
> The given `USERNAME` must have permissions to access the docker socket on the
> remote machine. Refer to [manage Docker as a non-root user](../../install/linux-postinstall/#manage-docker-as-a-non-root-user)
> to learn how to give a non-root user access to the docker socket.
@y
> **メモ**
>
> 説明に用いる`USERNAME`は、リモートマシン上において Docker ソケットにアクセスする権限を持っていなければなりません。
> root ではないユーザーにより Docker ソケットへアクセスする方法に関しては [root ユーザー以外で Docker を管理する](../../install/linux-postinstall/#manage-docker-as-a-non-root-user) を参照してください。
@z

@x
The following example creates a [`docker context`](../../context/working-with-contexts.md)
to connect with a remote `dockerd` daemon on `host1.example.com` using SSH, and
as the `docker-user` user on the remote machine:
@y
以下の例では [`docker context`](../../context/working-with-contexts.md) を生成し、リモートホスト`host1.example.com`上の`dockerd`デーモンに対して SSH を使って接続します。
その際にはリモートホスト上のユーザー`docker-user`によりアクセスします。
@z

@x
```console
$ docker context create \
    --docker host=ssh://docker-user@host1.example.com \
    --description="Remote engine" \
    my-remote-engine

my-remote-engine
Successfully created context "my-remote-engine"
```
@y
```console
$ docker context create \
    --docker host=ssh://docker-user@host1.example.com \
    --description="Remote engine" \
    my-remote-engine

my-remote-engine
Successfully created context "my-remote-engine"
```
@z

@x
After creating the context, use `docker context use` to switch the `docker` CLI
to use it, and to connect to the remote engine:
@y
コンテキストを生成したら、`docker context use`を実行して`docker` CLI がこれを用いるようにします。
そしてリモートエンジンにアクセスします。
@z

@x
```console
$ docker context use my-remote-engine
my-remote-engine
Current context is now "my-remote-engine"

$ docker info
<prints output of the remote engine>
```
@y
```console
$ docker context use my-remote-engine
my-remote-engine
Current context is now "my-remote-engine"

$ docker info
<リモートエンジンに関する情報の出力>
```
@z

@x
Use the `default` context to switch back to the default (local) daemon:
@y
`default`コンテキストを用いると、デフォルトの（ローカルの）デーモンに切り替わります。
@z

@x
```console
$ docker context use default
default
Current context is now "default"
```
@y
```console
$ docker context use default
default
Current context is now "default"
```
@z

@x
Alternatively, use the `DOCKER_HOST` environment variable to temporarily switch
the `docker` CLI to connect to the remote host using SSH. This does not require
creating a context, and can be useful to create an ad-hoc connection with a different
engine:
@y
あるいは環境変数`DOCKER_HOST`を用いることで、`docker` CLI によりリモートホストへの SSH 接続設定を一時的に切り替えることもできます。
この場合はコンテキストを生成する必要がなく、接続切り替えを簡単にできるので便利です。
@z

@x
```console
$ export DOCKER_HOST=ssh://docker-user@host1.example.com
$ docker info
<prints output of the remote engine>
```
@y
```console
$ export DOCKER_HOST=ssh://docker-user@host1.example.com
$ docker info
<リモートエンジンに関する情報の出力>
```
@z

@x
### SSH Tips
@y
{: #ssh-tips }
### SSH に関するヒント
@z

@x
For the best user experience with SSH, configure `~/.ssh/config` as follows to allow
reusing a SSH connection for multiple invocations of the `docker` CLI:
@y
SSH の利用を最大限活用するには、以下のようにして`~/.ssh/config`を設定します。
これは、何度も呼び出される`docker` CLI コマンドに対して、SSH 接続を再利用するものです。
@z

@x
```
ControlMaster     auto
ControlPath       ~/.ssh/control-%C
ControlPersist    yes
```
@y
```
ControlMaster     auto
ControlPath       ~/.ssh/control-%C
ControlPersist    yes
```
@z

@x
## Use TLS (HTTPS) to protect the Docker daemon socket
@y
{: #use-tls-https-to-protect-the-docker-daemon-socket }
## TLS (HTTPS) を使った Docker デーモンソケットの保護
@z

@x
If you need Docker to be reachable through HTTP rather than SSH in a safe manner,
you can enable TLS (HTTPS) by specifying the `tlsverify` flag and pointing Docker's
`tlscacert` flag to a trusted CA certificate.
@y
Docker がネットワークから接続される際に SSH でなく HTTP を用いて安全性を確保するには、`tlsverify`フラグを指定して TLS（HTTPS）を有効にし、`tlscacert`フラグを使って信頼された CA 証明書を指定します。
@z

@x
In the daemon mode, it only allows connections from clients
authenticated by a certificate signed by that CA. In the client mode,
it only connects to servers with a certificate signed by that CA.
@y
デーモンモードにおいては、CA によって署名された証明書を用いて認証されたクライアントからのみ、接続を許可します。
クライアントモードでは、その CA によって署名された証明書を利用するサーバーに対してのみ、接続を可能にします。
@z

@x
> Advanced topic
>
> Using TLS and managing a CA is an advanced topic. Please familiarize yourself
> with OpenSSL, x509, and TLS before using it in production.
{:.important}
@y
> 高度なトピック
>
> TLS 利用と CA 管理は高度なトピックです。
> これを本番環境に利用する場合は、OpenSSL、x509、TLS についてよく理解してから行ってください。
{:.important}
@z

@x
### Create a CA, server and client keys with OpenSSL
@y
{: #create-a-ca-server-and-client-keys-with-openssl }
### OpenSSL を用いた CA、サーバー鍵、クライアント鍵の生成
@z

@x
> **Note**: Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@y
> **メモ**:
> 以下に示す例において`$HOST`と示されている箇所はすべて、利用している Docker デーモンホストの DNS 名に置き換えてください。
@z

@x
First, on the **Docker daemon's host machine**, generate CA private and public keys:
@y
まず **Docker デーモンが起動するホストマシン** において、CA 秘密鍵と公開鍵を生成します。
@z

@x
    $ openssl genrsa -aes256 -out ca-key.pem 4096
    Generating RSA private key, 4096 bit long modulus
    ............................................................................................................................................................................................++
    ........++
    e is 65537 (0x10001)
    Enter pass phrase for ca-key.pem:
    Verifying - Enter pass phrase for ca-key.pem:
@y
    $ openssl genrsa -aes256 -out ca-key.pem 4096
    Generating RSA private key, 4096 bit long modulus
    ............................................................................................................................................................................................++
    ........++
    e is 65537 (0x10001)
    Enter pass phrase for ca-key.pem:
    Verifying - Enter pass phrase for ca-key.pem:
@z

@x
    $ openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
    Enter pass phrase for ca-key.pem:
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:
    State or Province Name (full name) [Some-State]:Queensland
    Locality Name (eg, city) []:Brisbane
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:Docker Inc
    Organizational Unit Name (eg, section) []:Sales
    Common Name (e.g. server FQDN or YOUR name) []:$HOST
    Email Address []:Sven@home.org.au
@y
    $ openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
    Enter pass phrase for ca-key.pem:
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:
    State or Province Name (full name) [Some-State]:Queensland
    Locality Name (eg, city) []:Brisbane
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:Docker Inc
    Organizational Unit Name (eg, section) []:Sales
    Common Name (e.g. server FQDN or YOUR name) []:$HOST
    Email Address []:Sven@home.org.au
@z

@x
Now that you have a CA, you can create a server key and certificate
signing request (CSR). Make sure that "Common Name" matches the hostname you use
to connect to Docker:
@y
CA を生成したので、次にサーバー鍵と証明書署名要求（certificate signing request; CSR）を生成します。
「Common Name」欄には、Docker に接続するホストの名前となっていることを確認してください。
@z

@x
> **Note**: Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@y
> **メモ**:
> 以下に示す例において`$HOST`と示されている箇所はすべて、利用している Docker デーモンホストの DNS 名に置き換えてください。
@z

@x
    $ openssl genrsa -out server-key.pem 4096
    Generating RSA private key, 4096 bit long modulus
    .....................................................................++
    .................................................................................................++
    e is 65537 (0x10001)
@y
    $ openssl genrsa -out server-key.pem 4096
    Generating RSA private key, 4096 bit long modulus
    .....................................................................++
    .................................................................................................++
    e is 65537 (0x10001)
@z

@x
    $ openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr
@y
    $ openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr
@z

@x
Next, we're going to sign the public key with our CA:
@y
次に公開鍵を CA を使って署名します。
@z

@x
Since TLS connections can be made through IP address as well as DNS name, the IP addresses
need to be specified when creating the certificate. For example, to allow connections
using `10.10.10.20` and `127.0.0.1`:
@y
TLS 接続は DNS 名だけでなく IP アドレスを使っても行われるため、証明書の生成時には IP アドレスが必要になります。
たとえば`10.10.10.20`と`127.0.0.1`を使って接続を許可するには、以下のようにします。
@z

@x
    $ echo subjectAltName = DNS:$HOST,IP:10.10.10.20,IP:127.0.0.1 >> extfile.cnf
@y
    $ echo subjectAltName = DNS:$HOST,IP:10.10.10.20,IP:127.0.0.1 >> extfile.cnf
@z

@x
Set the Docker daemon key's extended usage attributes to be used only for
server authentication:
@y
Docker デーモンの拡張属性は、サーバー認証に対してのみ利用するものとして設定します。
@z

@x
    $ echo extendedKeyUsage = serverAuth >> extfile.cnf
@y
    $ echo extendedKeyUsage = serverAuth >> extfile.cnf
@z

@x
Now, generate the signed certificate:
@y
そこで署名された証明書を生成します。
@z

@x
    $ openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem \
      -CAcreateserial -out server-cert.pem -extfile extfile.cnf
    Signature ok
    subject=/CN=your.host.com
    Getting CA Private Key
    Enter pass phrase for ca-key.pem:
@y
    $ openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem \
      -CAcreateserial -out server-cert.pem -extfile extfile.cnf
    Signature ok
    subject=/CN=your.host.com
    Getting CA Private Key
    Enter pass phrase for ca-key.pem:
@z

@x
[Authorization plugins](/engine/extend/plugins_authorization/) offer more
fine-grained control to supplement authentication from mutual TLS. In addition
to other information described in the above document, authorization plugins
running on a Docker daemon receive the certificate information for connecting
Docker clients.
@y
[認証プラグイン](/engine/extend/plugins_authorization/) は、相互 TLS からの認証を補完する、きめ細かな制御を可能にします。
上記のドキュメント内の説明内容に加えて、Docker デーモン上で動作する認証プラグインは、Docker クライアントに接続するための認証情報を受け取ります。
@z

@x
For client authentication, create a client key and certificate signing
request:
@y
クライアント認証に対しては、クライアント鍵と証明書署名要求を生成します。
@z

@x
> **Note**: For simplicity of the next couple of steps, you may perform this
> step on the Docker daemon's host machine as well.
@y
> **メモ**: ここから続く手順を簡単にするために、以下の手順は Docker デーモンが稼動するホストマシン上で行ってもかまいません。
@z

@x
    $ openssl genrsa -out key.pem 4096
    Generating RSA private key, 4096 bit long modulus
    .........................................................++
    ................++
    e is 65537 (0x10001)
@y
    $ openssl genrsa -out key.pem 4096
    Generating RSA private key, 4096 bit long modulus
    .........................................................++
    ................++
    e is 65537 (0x10001)
@z

@x
    $ openssl req -subj '/CN=client' -new -key key.pem -out client.csr
@y
    $ openssl req -subj '/CN=client' -new -key key.pem -out client.csr
@z

@x
To make the key suitable for client authentication, create a new extensions
config file:
@y
生成した鍵をクライアント認証用とするために、新たな拡張設定ファイルを生成します。
@z

@x
    $ echo extendedKeyUsage = clientAuth > extfile-client.cnf
@y
    $ echo extendedKeyUsage = clientAuth > extfile-client.cnf
@z

@x
Now, generate the signed certificate:
@y
そこで署名された証明書を生成します。
@z

@x
    $ openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
      -CAcreateserial -out cert.pem -extfile extfile-client.cnf
    Signature ok
    subject=/CN=client
    Getting CA Private Key
    Enter pass phrase for ca-key.pem:
@y
    $ openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
      -CAcreateserial -out cert.pem -extfile extfile-client.cnf
    Signature ok
    subject=/CN=client
    Getting CA Private Key
    Enter pass phrase for ca-key.pem:
@z

@x
After generating `cert.pem` and `server-cert.pem` you can safely remove the
two certificate signing requests and extensions config files:
@y
`cert.pem`と`server-cert.pem`を生成したら、証明書署名要求と拡張設定ファイルの 2 つは、安全に削除することができます。
@z

@x
    $ rm -v client.csr server.csr extfile.cnf extfile-client.cnf
@y
    $ rm -v client.csr server.csr extfile.cnf extfile-client.cnf
@z

@x
With a default `umask` of 022, your secret keys are *world-readable* and
writable for you and your group.
@y
`umask`をデフォルトの 022 のまま使ってしまうと、秘密鍵は **誰もが読み込み可能** となり、また所有者とグループが書き込み可能となってしまいます。
@z

@x
To protect your keys from accidental damage, remove their
write permissions. To make them only readable by you, change file modes as follows:
@y
秘密鍵を保護し、予期しない被害を受けないために、書き込み権限は削除してください。
読み込み権限は所有者のみとするように、以下のようにしてファイルモードの変更を行います。
@z

@x
    $ chmod -v 0400 ca-key.pem key.pem server-key.pem
@y
    $ chmod -v 0400 ca-key.pem key.pem server-key.pem
@z

@x
Certificates can be world-readable, but you might want to remove write access to
prevent accidental damage:
@y
証明書は誰でも読み込めるようにするのでもかまいません。
ただし書き込み権限は、被害を避ける意味で削除するようにしてください。
@z

@x
    $ chmod -v 0444 ca.pem server-cert.pem cert.pem
@y
    $ chmod -v 0444 ca.pem server-cert.pem cert.pem
@z

@x
Now you can make the Docker daemon only accept connections from clients
providing a certificate trusted by your CA:
@y
このようにして Docker デーモンが接続を受け入れるクライアントは、CA に信頼された証明書を利用するクライアントのみとすることができました。
@z

@x
    $ dockerd --tlsverify --tlscacert=ca.pem --tlscert=server-cert.pem --tlskey=server-key.pem \
      -H=0.0.0.0:2376
@y
    $ dockerd --tlsverify --tlscacert=ca.pem --tlscert=server-cert.pem --tlskey=server-key.pem \
      -H=0.0.0.0:2376
@z

@x
To connect to Docker and validate its certificate, provide your client keys,
certificates and trusted CA:
@y
Docker に接続して証明書を確認します。
クライアント鍵、証明書、信頼された CA を指定してください。
@z

@x
> Run it on the client machine
>
> This step should be run on your Docker client machine. As such, you
> need to copy your CA certificate, your server certificate, and your client
> certificate to that machine.
@y
> クライアントマシン上での実行
>
> ここでの手順は Docker クライアントマシン上で行います。
> したがって CA 証明書、サーバー証明書、クライアント証明書は、そのマシン上にコピーしておく必要があります。
@z

@x
> **Note**: Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@y
> **メモ**:
> 以下に示す例において`$HOST`と示されている箇所はすべて、利用している Docker デーモンホストの DNS 名に置き換えてください。
@z

@x
    $ docker --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem \
      -H=$HOST:2376 version
@y
    $ docker --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem \
      -H=$HOST:2376 version
@z

@x
> **Note**:
> Docker over TLS should run on TCP port 2376.
@y
> **メモ**:
> Docker over TLS は TCP ポート 2376 上を使って動作させる必要があります。
@z

@x
> **Warning**:
> As shown in the example above, you don't need to run the `docker` client
> with `sudo` or the `docker` group when you use certificate authentication.
> That means anyone with the keys can give any instructions to your Docker
> daemon, giving them root access to the machine hosting the daemon. Guard
> these keys as you would a root password!
{:.warning}
@y
> **警告**
> 上の例に示したように、証明書認証操作を行う際の`docker`クライアント実行において`sudo`を使ったり`docker`グループに属していたりする必要はありません。
> つまり鍵を使うのであれば、Docker デーモンに対して指示を出すのは、デーモンホストのマシンに root 権限を持っていれば誰でもよいということです。
> したがってこの鍵データは root パスワードと同じように、しっかりと管理してください。
{:.warning}
@z

@x
### Secure by default
@y
{: #secure-by-default }
### セキュアな接続のデフォルト設定
@z

@x
If you want to secure your Docker client connections by default, you can move
the files to the `.docker` directory in your home directory --- and set the
`DOCKER_HOST` and `DOCKER_TLS_VERIFY` variables as well (instead of passing
`-H=tcp://$HOST:2376` and `--tlsverify` on every call).
@y
Docker クライアント接続を、デフォルトで安全なものとしたい場合は、ホームディレクトリ内の`.docker`ディレクトリに、各ファイルを移動させます。
これに合わせて`DOCKER_HOST`と`DOCKER_TLS_VERIFY`の変数も設定します
（これはコマンド実行時に`-H=tcp://$HOST:2376`と`--tlsverify`を指定しない代わりとして行うものです）。
@z

@x
    $ mkdir -pv ~/.docker
    $ cp -v {ca,cert,key}.pem ~/.docker
@y
    $ mkdir -pv ~/.docker
    $ cp -v {ca,cert,key}.pem ~/.docker
@z

@x
    $ export DOCKER_HOST=tcp://$HOST:2376 DOCKER_TLS_VERIFY=1
@y
    $ export DOCKER_HOST=tcp://$HOST:2376 DOCKER_TLS_VERIFY=1
@z

@x
Docker now connects securely by default:
@y
Docker はデフォルトで安全な接続を行うようになります。
@z

@x
    $ docker ps
@y
    $ docker ps
@z

@x
### Other modes
@y
{: #other-modes }
### その他のモード
@z

@x
If you don't want to have complete two-way authentication, you can run
Docker in various other modes by mixing the flags.
@y
完全な双方向認証は行う必要がない場合は、他にもあるさまざまなモードや各種フラグを組み合わせて Docker を実行することができます。
@z

@x
#### Daemon modes
@y
{: #daemon-modes }
#### デーモンモード
@z

@x
 - `tlsverify`, `tlscacert`, `tlscert`, `tlskey` set: Authenticate clients
 - `tls`, `tlscert`, `tlskey`: Do not authenticate clients
@y
 - `tlsverify`、`tlscacert`、`tlscert`、`tlskey`の各設定は、クライアント認証を行います。
 - `tls`、`tlscert`、`tlskey`はクライアント認証を行いません。
@z

@x
#### Client modes
@y
{: #client-modes }
#### クライアントモード
@z

@x
 - `tls`: Authenticate server based on public/default CA pool
 - `tlsverify`, `tlscacert`: Authenticate server based on given CA
 - `tls`, `tlscert`, `tlskey`: Authenticate with client certificate, do not
   authenticate server based on given CA
 - `tlsverify`, `tlscacert`, `tlscert`, `tlskey`: Authenticate with client
   certificate and authenticate server based on given CA
@y
 - `tls`は、公開またはデフォルトの CA プールに基づくサーバーを認証します。
 - `tlsverify`、`tlscacert`は、指定された CA に基づくサーバーを認証します。
 - `tls`、`tlscert``、`tlskey`は、クライアント証明書を使って認証します。指定の CA に基づたサーバー認証は行いません。
 - `tlsverify`、`tlscacert`、`tlscert`、`tlskey`は、クライアント証明書を使って認証します。
   そして指定の CA に基づいたサーバー認証を行います。
@z

@x
If found, the client sends its client certificate, so you just need
to drop your keys into `~/.docker/{ca,cert,key}.pem`. Alternatively,
if you want to store your keys in another location, you can specify that
location using the environment variable `DOCKER_CERT_PATH`.
@y
クライアントに証明書があればクライアントはそれを送信するので、鍵データは`~/.docker/{ca,cert,key}.pem`に配置しておくことが必要です。
あるいは鍵データを別のディレクトリに保持しておきたい場合は、環境変数`DOCKER_CERT_PATH`にそのディレクトリを指定します。
@z

@x
    $ export DOCKER_CERT_PATH=~/.docker/zone1/
    $ docker --tlsverify ps
@y
    $ export DOCKER_CERT_PATH=~/.docker/zone1/
    $ docker --tlsverify ps
@z

@x
#### Connecting to the secure Docker port using `curl`
@y
{: #connecting-to-the-secure-docker-port-using-curl }
#### `curl`を用いたセキュアな Docker ポートへの接続
@z

@x
To use `curl` to make test API requests, you need to use three extra command line
flags:
@y
`curl`を使って API リクエストを行ってみるなら、指定を 3 つ追加したコマンドライン実行を行います。
@z

@x
    $ curl https://$HOST:2376/images/json \
      --cert ~/.docker/cert.pem \
      --key ~/.docker/key.pem \
      --cacert ~/.docker/ca.pem
@y
    $ curl https://$HOST:2376/images/json \
      --cert ~/.docker/cert.pem \
      --key ~/.docker/key.pem \
      --cacert ~/.docker/ca.pem
@z

@x
## Related information
@y
{: #related-information }
## 関連情報
@z

@x
* [Using certificates for repository client verification](certificates.md)
* [Use trusted images](trust/index.md)
@y
* [証明書を使ったリポジトリクライアントの確認](certificates.md)
* [信頼できるイメージの利用](trust/index.md)
@z
