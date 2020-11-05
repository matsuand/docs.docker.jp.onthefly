%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build images with BuildKit
description: Learn the new features of Docker Build with BuildKit
keywords: build, security, engine, secret, BuildKit
---
@y
---
title: BuildKit によるイメージ構築
description: BuildKit により Docker ビルドについて学びます。
keywords: build, security, engine, secret, BuildKit
---
@z

@x
Docker Build is one of the most used features of the Docker Engine - users
ranging from developers, build teams, and release teams all use Docker Build. 
@y
{% comment %}
Docker Build is one of the most used features of the Docker Engine - users
ranging from developers, build teams, and release teams all use Docker Build. 
{% endcomment %}
Docker によるビルドは、Docker Engine においてもっとも利用されている機能と言えます。
開発者、ビルドチーム、リリースチームなど幅広いユーザーがこの Docker ビルドを行います。
@z

@x
Docker Build enhancements for 18.09 release introduces a much-needed overhaul of
the build architecture. By integrating BuildKit, users should see an improvement
on performance, storage management, feature functionality, and security.
@y
{% comment %}
Docker Build enhancements for 18.09 release introduces a much-needed overhaul of
the build architecture. By integrating BuildKit, users should see an improvement
on performance, storage management, feature functionality, and security.
{% endcomment %}
Docker 18.09 のリリースにおいて行われたビルド機能の拡張は、ビルドアーキテクチャーの総見直しにより必要となる機能を導入しています。
BuildKit を統合したことによって、処理性能、ストレージ管理、ツール機能、セキュリティのどれをとっても改善が見られるはずです。
@z

@x
* Docker images created with BuildKit can be pushed to Docker Hub just like
  Docker images created with legacy build
* the Dockerfile format that works on legacy build will also work with BuildKit
  builds
* The new `--secret` command line option allows the user to pass secret
  information for building new images with a specified Dockerfile 
@y
{% comment %}
* Docker images created with BuildKit can be pushed to Docker Hub just like
  Docker images created with legacy build
* the Dockerfile format that works on legacy build will also work with BuildKit
  builds
* The new `--secret` command line option allows the user to pass secret
 information for building new images with a specified Dockerfile 
{% endcomment %}
* BuildKit を用いて生成された Docker イメージは、従来の Docker イメージと同じように Docker Hub にプッシュすることができます。
* 従来のビルドに対して動作している Dockerfile の記述は、BuildKit を用いてビルドを行っても同様に動作します。
* 新しくコマンドラインオプション`--secret`が導入され、Dockerfile を用いたイメージビルドにあたり、機密情報を受け渡すことができるようになりました。
@z

@x
For more information on build options, see the reference guide on the
[command line build options](/engine/reference/commandline/build/).
@y
{% comment %}
For more information on build options, see the reference guide on the
[command line build options](/engine/reference/commandline/build/).
{% endcomment %}
ビルド時のオプションに関しては [コマンドライン build オプション](/engine/reference/commandline/build/) を参照してください。
@z

@x
## Requirements
@y
{% comment %}
## Requirements
{% endcomment %}
{: #requirements }
## システム要件
@z

@x
* A current version of Docker (18.09 or higher)
* Network connection required for downloading images of custom frontends 
@y
{% comment %}
* A current version of Docker (18.09 or higher)
* Network connection required for downloading images of custom frontends 
{% endcomment %}
* Docker 最新版 （18.09 または それ以降）
* 独自のフロントエンドイメージをダウンロードするにはネットワーク接続が必要です。
@z

@x
## Limitations
@y
{% comment %}
## Limitations
{% endcomment %}
{: #limitations }
## 制約条件
@z

@x
* Only supported for building Linux containers
@y
{% comment %}
* Only supported for building Linux containers
{% endcomment %}
* Linux コンテナーのビルドにのみ対応しています。
@z

@x
## To enable BuildKit builds
@y
{% comment %}
## To enable BuildKit builds
{% endcomment %}
{: #to-enable-buildkit-builds }
## BuildKit によるビルドの有効化
@z

@x
Easiest way from a fresh install of docker is to set the `DOCKER_BUILDKIT=1`
environment variable when invoking the `docker build` command, such as:
@y
{% comment %}
Easiest way from a fresh install of docker is to set the `DOCKER_BUILDKIT=1`
environment variable when invoking the `docker build` command, such as:
{% endcomment %}
一番簡単な方法としては docker を起動し始める際に環境変数`DOCKER_BUILDKIT=1`を設定した上で`docker build`コマンドを起動します。
@z

@x
```bash
$ DOCKER_BUILDKIT=1 docker build .
```
@y
```bash
$ DOCKER_BUILDKIT=1 docker build .
```
@z

@x
To enable docker BuildKit by default, set daemon configuration in
`/etc/docker/daemon.json` feature to true and restart the daemon:
@y
{% comment %}
To enable docker BuildKit by default, set daemon configuration in
`/etc/docker/daemon.json` feature to true and restart the daemon:
{% endcomment %}
docker BuildKit をデフォルトで有効にするには、`/etc/docker/daemon.json`にあるデーモン設定の features を true にしデーモンを再起動します。
@z

@x
```json
{ "features": { "buildkit": true } }
```
@y
```json
{ "features": { "buildkit": true } }
```
@z

@x
## New Docker Build command line build output
@y
{% comment %}
## New Docker Build command line build output
{% endcomment %}
{: #new-docker-build-command-line-build-output }
## 新たな Docker ビルドのコマンドライン出力
@z

@x
New docker build BuildKit TTY output (default):
@y
{% comment %}
New docker build BuildKit TTY output (default):
{% endcomment %}
新たな Docker BuildKit の TTY 出力は（デフォルトで）以下のとおりです。
@z

@x
```console
$ docker build . 

[+] Building 70.9s (34/59)                                                      
 => [runc 1/4] COPY hack/dockerfile/install/install.sh ./install.sh       14.0s
 => [frozen-images 3/4] RUN /download-frozen-image-v2.sh /build  buildpa  24.9s
 => [containerd 4/5] RUN PREFIX=/build/ ./install.sh containerd           37.1s
 => [tini 2/5] COPY hack/dockerfile/install/install.sh ./install.sh        4.9s
 => [vndr 2/4] COPY hack/dockerfile/install/vndr.installer ./              1.6s
 => [dockercli 2/4] COPY hack/dockerfile/install/dockercli.installer ./    5.9s
 => [proxy 2/4] COPY hack/dockerfile/install/proxy.installer ./           15.7s
 => [tomlv 2/4] COPY hack/dockerfile/install/tomlv.installer ./           12.4s
 => [gometalinter 2/4] COPY hack/dockerfile/install/gometalinter.install  25.5s
 => [vndr 3/4] RUN PREFIX=/build/ ./install.sh vndr                       33.2s
 => [tini 3/5] COPY hack/dockerfile/install/tini.installer ./              6.1s
 => [dockercli 3/4] RUN PREFIX=/build/ ./install.sh dockercli             18.0s
 => [runc 2/4] COPY hack/dockerfile/install/runc.installer ./              2.4s
 => [tini 4/5] RUN PREFIX=/build/ ./install.sh tini                       11.6s
 => [runc 3/4] RUN PREFIX=/build/ ./install.sh runc                       23.4s
 => [tomlv 3/4] RUN PREFIX=/build/ ./install.sh tomlv                      9.7s
 => [proxy 3/4] RUN PREFIX=/build/ ./install.sh proxy                     14.6s
 => [dev 2/23] RUN useradd --create-home --gid docker unprivilegeduser     5.1s
 => [gometalinter 3/4] RUN PREFIX=/build/ ./install.sh gometalinter        9.4s
 => [dev 3/23] RUN ln -sfv /go/src/github.com/docker/docker/.bashrc ~/.ba  4.3s
 => [dev 4/23] RUN echo source /usr/share/bash-completion/bash_completion  2.5s
 => [dev 5/23] RUN ln -s /usr/local/completion/bash/docker /etc/bash_comp  2.1s
```
@y
```console
$ docker build . 

[+] Building 70.9s (34/59)                                                      
 => [runc 1/4] COPY hack/dockerfile/install/install.sh ./install.sh       14.0s
 => [frozen-images 3/4] RUN /download-frozen-image-v2.sh /build  buildpa  24.9s
 => [containerd 4/5] RUN PREFIX=/build/ ./install.sh containerd           37.1s
 => [tini 2/5] COPY hack/dockerfile/install/install.sh ./install.sh        4.9s
 => [vndr 2/4] COPY hack/dockerfile/install/vndr.installer ./              1.6s
 => [dockercli 2/4] COPY hack/dockerfile/install/dockercli.installer ./    5.9s
 => [proxy 2/4] COPY hack/dockerfile/install/proxy.installer ./           15.7s
 => [tomlv 2/4] COPY hack/dockerfile/install/tomlv.installer ./           12.4s
 => [gometalinter 2/4] COPY hack/dockerfile/install/gometalinter.install  25.5s
 => [vndr 3/4] RUN PREFIX=/build/ ./install.sh vndr                       33.2s
 => [tini 3/5] COPY hack/dockerfile/install/tini.installer ./              6.1s
 => [dockercli 3/4] RUN PREFIX=/build/ ./install.sh dockercli             18.0s
 => [runc 2/4] COPY hack/dockerfile/install/runc.installer ./              2.4s
 => [tini 4/5] RUN PREFIX=/build/ ./install.sh tini                       11.6s
 => [runc 3/4] RUN PREFIX=/build/ ./install.sh runc                       23.4s
 => [tomlv 3/4] RUN PREFIX=/build/ ./install.sh tomlv                      9.7s
 => [proxy 3/4] RUN PREFIX=/build/ ./install.sh proxy                     14.6s
 => [dev 2/23] RUN useradd --create-home --gid docker unprivilegeduser     5.1s
 => [gometalinter 3/4] RUN PREFIX=/build/ ./install.sh gometalinter        9.4s
 => [dev 3/23] RUN ln -sfv /go/src/github.com/docker/docker/.bashrc ~/.ba  4.3s
 => [dev 4/23] RUN echo source /usr/share/bash-completion/bash_completion  2.5s
 => [dev 5/23] RUN ln -s /usr/local/completion/bash/docker /etc/bash_comp  2.1s
```
@z

@x
New docker build BuildKit plain output:
@y
{% comment %}
New docker build BuildKit plain output:
{% endcomment %}
新たな BuildKit の plain な出力は以下のとおりです。
@z

@x
```console
$ docker build --progress=plain . 
@y
```console
$ docker build --progress=plain . 
@z

@x
#1 [internal] load .dockerignore
#1       digest: sha256:d0b5f1b2d994bfdacee98198b07119b61cf2442e548a41cf4cd6d0471a627414
#1         name: "[internal] load .dockerignore"
#1      started: 2018-08-31 19:07:09.246319297 +0000 UTC
#1    completed: 2018-08-31 19:07:09.246386115 +0000 UTC
#1     duration: 66.818µs
#1      started: 2018-08-31 19:07:09.246547272 +0000 UTC
#1    completed: 2018-08-31 19:07:09.260979324 +0000 UTC
#1     duration: 14.432052ms
#1 transferring context: 142B done
@y
#1 [internal] load .dockerignore
#1       digest: sha256:d0b5f1b2d994bfdacee98198b07119b61cf2442e548a41cf4cd6d0471a627414
#1         name: "[internal] load .dockerignore"
#1      started: 2018-08-31 19:07:09.246319297 +0000 UTC
#1    completed: 2018-08-31 19:07:09.246386115 +0000 UTC
#1     duration: 66.818µs
#1      started: 2018-08-31 19:07:09.246547272 +0000 UTC
#1    completed: 2018-08-31 19:07:09.260979324 +0000 UTC
#1     duration: 14.432052ms
#1 transferring context: 142B done
@z

@x
#2 [internal] load Dockerfile
#2       digest: sha256:2f10ef7338b6eebaf1b072752d0d936c3d38c4383476a3985824ff70398569fa
#2         name: "[internal] load Dockerfile"
#2      started: 2018-08-31 19:07:09.246331352 +0000 UTC
#2    completed: 2018-08-31 19:07:09.246386021 +0000 UTC
#2     duration: 54.669µs
#2      started: 2018-08-31 19:07:09.246720773 +0000 UTC
#2    completed: 2018-08-31 19:07:09.270231987 +0000 UTC
#2     duration: 23.511214ms
#2 transferring dockerfile: 9.26kB done
```
@y
#2 [internal] load Dockerfile
#2       digest: sha256:2f10ef7338b6eebaf1b072752d0d936c3d38c4383476a3985824ff70398569fa
#2         name: "[internal] load Dockerfile"
#2      started: 2018-08-31 19:07:09.246331352 +0000 UTC
#2    completed: 2018-08-31 19:07:09.246386021 +0000 UTC
#2     duration: 54.669µs
#2      started: 2018-08-31 19:07:09.246720773 +0000 UTC
#2    completed: 2018-08-31 19:07:09.270231987 +0000 UTC
#2     duration: 23.511214ms
#2 transferring dockerfile: 9.26kB done
```
@z

@x
## Overriding default frontends
@y
{% comment %}
## Overriding default frontends
{% endcomment %}
{: #overriding-default-frontends }
## デフォルトフロントエンドの上書き設定
@z

@x
The new syntax features in `Dockerfile` are available if you override the default
frontend. To override the default frontend, set the first line of the
`Dockerfile` as a comment with a specific frontend image: 
@y
{% comment %}
The new syntax features in `Dockerfile` are available if you override the default
frontend. To override the default frontend, set the first line of the
`Dockerfile` as a comment with a specific frontend image: 
{% endcomment %}
`Dockerfile` における新たな文法機能として、デフォルトのフロントエンドを上書き設定することが可能になりました。
これを行うには`Dockerfile`の先頭行に、コメントとして特定のフロントエンドイメージを指定します。
@z

@x
```dockerfile
# syntax = <frontend image>, e.g. # syntax = docker/dockerfile:1.0-experimental
```
@y
```dockerfile
# syntax = <frontend image>, e.g. # syntax = docker/dockerfile:1.0-experimental
```
@z

@x
## New Docker Build secret information
@y
{% comment %}
## New Docker Build secret information
{% endcomment %}
{: #new-docker-build-secret-information }
## 新たな Docker ビルドにおける機密情報の扱い
@z

@x
The new `--secret` flag for docker build allows the user to pass secret
information to be used in the Dockerfile for building docker images in a safe
way that will not end up stored in the final image.
@y
{% comment %}
The new `--secret` flag for docker build allows the user to pass secret
information to be used in the Dockerfile for building docker images in a safe
way that will not end up stored in the final image.
{% endcomment %}
Docker ビルドにおいては新たに`--secret`フラグが導入され、Dockerfile を用いたイメージビルドにあたり、機密情報を受け渡すことができるようになりました。
機密情報は、最終的にイメージ内に保存されることはないので、安全に取り扱うことができます。
@z

@x
`id` is the identifier to pass into the `docker build --secret`. This identifier
is  associated with the `RUN --mount` identifier to use in the Dockerfile. Docker
does not use the filename of where the secret is kept outside of the Dockerfile,
since this may be sensitive information.
@y
{% comment %}
`id` is the identifier to pass into the `docker build --secret`. This identifier
is  associated with the `RUN --mount` identifier to use in the Dockerfile. Docker
does not use the filename of where the secret is kept outside of the Dockerfile,
since this may be sensitive information.
{% endcomment %}
`id`は`docker build --secret`において受け渡される識別子です。
これは Dockerfile 内において用いられる`RUN --mount`識別子に関連づいています。
Docker では Dockerfile の外に保持されている機密情報のファイル名は用いません。
これが重要な情報となることもあるからです。
@z

@x
`dst` renames the secret file to a specific file in the Dockerfile `RUN` command
to use.
@y
{% comment %}
`dst` renames the secret file to a specific file in the Dockerfile `RUN` command
to use.
{% endcomment %}
`dst`は Dockerfile 内にて用いられる`RUN`コマンドにおいての機密情報ファイルを、所定ファイル名に名称変更します。
@z

@x
For example, with a secret piece of information stored in a text file:
@y
{% comment %}
For example, with a secret piece of information stored in a text file:
{% endcomment %}
たとえば以下のようなテキストファイル内に、一部の機密情報が含まれているとします。
@z

@x
```console
$ echo 'WARMACHINEROX' > mysecret.txt
```
@y
```console
$ echo 'WARMACHINEROX' > mysecret.txt
```
@z

@x
And with a Dockerfile that specifies use of a BuildKit frontend
`docker/dockerfile:1.0-experimental`, the secret can be accessed. 
@y
{% comment %}
And with a Dockerfile that specifies use of a BuildKit frontend
`docker/dockerfile:1.0-experimental`, the secret can be accessed. 
{% endcomment %}
そして BuildKit フロントエンド`docker/dockerfile:1.0-experimental`を指定した Dockerfile を使えば、機密情報にアクセスすることができます。
@z

@x
For example:
@y
{% comment %}
For example:
{% endcomment %}
たとえば以下のとおりです。
@z

@x
```dockerfile
# syntax = docker/dockerfile:1.0-experimental
FROM alpine

# shows secret from default secret location:
RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret

# shows secret from custom secret location:
RUN --mount=type=secret,id=mysecret,dst=/foobar cat /foobar
```
@y
```dockerfile
# syntax = docker/dockerfile:1.0-experimental
FROM alpine

# shows secret from default secret location:
RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret

# shows secret from custom secret location:
RUN --mount=type=secret,id=mysecret,dst=/foobar cat /foobar
```
@z

@x
This Dockerfile is only to demonstrate that the secret can be accessed. As you
can see the secret printed in the build output. The final image built will not
have the secret file:
@y
{% comment %}
This Dockerfile is only to demonstrate that the secret can be accessed. As you
can see the secret printed in the build output. The final image built will not
have the secret file:
{% endcomment %}
この Dockerfile は、単に機密情報にアクセスできる例を示したにすぎません。
機密情報はビルド時の出力に表示されます。
最終的にビルドされるイメージに、この機密情報ファイルは含まれません。
@z

@x
```console
$ docker build --no-cache --progress=plain --secret id=mysecret,src=mysecret.txt .
...
#8 [2/3] RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret
#8       digest: sha256:5d8cbaeb66183993700828632bfbde246cae8feded11aad40e524f54ce7438d6
#8         name: "[2/3] RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret"
#8      started: 2018-08-31 21:03:30.703550864 +0000 UTC
#8 1.081 WARMACHINEROX
#8    completed: 2018-08-31 21:03:32.051053831 +0000 UTC
#8     duration: 1.347502967s
@y
```console
$ docker build --no-cache --progress=plain --secret id=mysecret,src=mysecret.txt .
...
#8 [2/3] RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret
#8       digest: sha256:5d8cbaeb66183993700828632bfbde246cae8feded11aad40e524f54ce7438d6
#8         name: "[2/3] RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret"
#8      started: 2018-08-31 21:03:30.703550864 +0000 UTC
#8 1.081 WARMACHINEROX
#8    completed: 2018-08-31 21:03:32.051053831 +0000 UTC
#8     duration: 1.347502967s
@z

@x
#9 [3/3] RUN --mount=type=secret,id=mysecret,dst=/foobar cat /foobar
#9       digest: sha256:6c7ebda4599ec6acb40358017e51ccb4c5471dc434573b9b7188143757459efa
#9         name: "[3/3] RUN --mount=type=secret,id=mysecret,dst=/foobar cat /foobar"
#9      started: 2018-08-31 21:03:32.052880985 +0000 UTC
#9 1.216 WARMACHINEROX
#9    completed: 2018-08-31 21:03:33.523282118 +0000 UTC
#9     duration: 1.470401133s
...
```
@y
#9 [3/3] RUN --mount=type=secret,id=mysecret,dst=/foobar cat /foobar
#9       digest: sha256:6c7ebda4599ec6acb40358017e51ccb4c5471dc434573b9b7188143757459efa
#9         name: "[3/3] RUN --mount=type=secret,id=mysecret,dst=/foobar cat /foobar"
#9      started: 2018-08-31 21:03:32.052880985 +0000 UTC
#9 1.216 WARMACHINEROX
#9    completed: 2018-08-31 21:03:33.523282118 +0000 UTC
#9     duration: 1.470401133s
...
```
@z

@x
## Using SSH to access private data in builds
@y
{% comment %}
## Using SSH to access private data in builds
{% endcomment %}
{: #using-ssh-to-access-private-data-in-builds }
## SSH を用いたビルド内個人情報へのアクセス
@z

@x
> **Acknowledgment**
>
> Please see [Build secrets and SSH forwarding in Docker 18.09](https://medium.com/@tonistiigi/build-secrets-and-ssh-forwarding-in-docker-18-09-ae8161d066)
> for more information and examples.
@y
{% comment %}
> **Acknowledgment**
>
> Please see [Build secrets and SSH forwarding in Docker 18.09](https://medium.com/@tonistiigi/build-secrets-and-ssh-forwarding-in-docker-18-09-ae8161d066)
> for more information and examples.
{% endcomment %}
> **感謝**
>
> 詳しい情報と利用例については [Build secrets and SSH forwarding in Docker 18.09](https://medium.com/@tonistiigi/build-secrets-and-ssh-forwarding-in-docker-18-09-ae8161d066) （Docker 18.09 における機密情報生成と SSH フォワーディング）を参照してください。
@z

@x
The `docker build` has a `--ssh` option to allow the Docker Engine to forward
SSH agent connections. For more information on SSH agent, see the
[OpenSSH man page](https://man.openbsd.org/ssh-agent).
@y
{% comment %}
The `docker build` has a `--ssh` option to allow the Docker Engine to forward
SSH agent connections. For more information on SSH agent, see the
[OpenSSH man page](https://man.openbsd.org/ssh-agent).
{% endcomment %}
`docker build`には`--ssh`オプションがあります。
これは Docker Engine に対して SSH エージェントのフォワードによる接続を許可するものです。
SSH エージェントについては [OpenSSH man ページ](https://man.openbsd.org/ssh-agent) を参照してください。
@z

@x
Only the commands in the `Dockerfile` that have explicitly requested the SSH
access by defining `type=ssh` mount have access to SSH agent connections. The
other commands have no knowledge of any SSH agent being available.
@y
{% comment %}
Only the commands in the `Dockerfile` that have explicitly requested the SSH
access by defining `type=ssh` mount have access to SSH agent connections. The
other commands have no knowledge of any SSH agent being available.
{% endcomment %}
`Dockerfile`内にて SSH アクセスを要求するために明示されるコマンド記述は、マウントタイプを`type=ssh`とするだけです。
これが SSH エージェントによる接続を行うものとなります。
これ以外のコマンド記述からは、SSH エージェントを利用しているかどうかを知ることはできません。
@z

@x
To request SSH access for a `RUN` command in the `Dockerfile`, define a mount
with type `ssh`. This will set up the `SSH_AUTH_SOCK` environment variable to
make programs relying on SSH automatically use that socket.
@y
{% comment %}
To request SSH access for a `RUN` command in the `Dockerfile`, define a mount
with type `ssh`. This will set up the `SSH_AUTH_SOCK` environment variable to
make programs relying on SSH automatically use that socket.
{% endcomment %}
`Dockerfile`内の`RUN`コマンドにおいて SSH アクセスを指定するには、マウントタイプを`ssh`として定義します。
これにより環境変数`SSH_AUTH_SOCK`が設定され、プログラムが SSH に基づいて自動的にソケット通信を行うようになります。
@z

@x
Here is an example Dockerfile using SSH in the container:
@y
{% comment %}
Here is an example Dockerfile using SSH in the container:
{% endcomment %}
Docker ファイル内にてコンテナーが SSH を利用する例が以下です。
@z

@x
```dockerfile
# syntax=docker/dockerfile:experimental
FROM alpine
@y
```dockerfile
# syntax=docker/dockerfile:experimental
FROM alpine
@z

@x
# Install ssh client and git
RUN apk add --no-cache openssh-client git
@y
# ssh クライアントと git のインストール
RUN apk add --no-cache openssh-client git
@z

@x
# Download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
@y
# github.com に対する公開鍵をダウンロード
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
@z

@x
# Clone private repository
RUN --mount=type=ssh git clone git@github.com:myorg/myproject.git myproject
```
@y
# プライベートリポジトリのクローン
RUN --mount=type=ssh git clone git@github.com:myorg/myproject.git myproject
```
@z

@x
Once the `Dockerfile` is created, use the `--ssh` option for connectivity with
the SSH agent.
@y
{% comment %}
Once the `Dockerfile` is created, use the `--ssh` option for connectivity with
the SSH agent.
{% endcomment %}
`Dockerfile`の用意ができたら SSH エージェント接続を行う`--ssh`オプションを使います。
@z

@x
```bash
$ docker build --ssh default .
```
@y
```bash
$ docker build --ssh default .
```
@z

@x
You may need to run `ssh-add` to add private key identities to the authentication agent first for this to work.
@y
{% comment %}
You may need to run `ssh-add` to add private key identities to the authentication agent first for this to work.
{% endcomment %}
エージェントに対して秘密鍵の認証がまず必要な場合には、`ssh-add`の利用が必要な場合があります。
@z

@x
## Troubleshooting : issues with private registries
@y
{% comment %}
## Troubleshooting : issues with private registries
{% endcomment %}
{: #troubleshooting--issues-with-private-registries }
## トラブルシューティング： プライベートレジストリに関する問題
@z

@x
#### x509: certificate signed by unknown authority
@y
{% comment %}
#### x509: certificate signed by unknown authority
{% endcomment %}
{: #x509-certificate-signed-by-unknown-authority }
#### x509: certificate signed by unknown authority
@z

@x
If you are fetching images from insecure registry (with self-signed certificates)
and/or using such a registry as a mirror, you are facing a known issue in
Docker 18.09 :
@y
{% comment %}
If you are fetching images from insecure registry (with self-signed certificates)
and/or using such a registry as a mirror, you are facing a known issue in
Docker 18.09 :
{% endcomment %}
Docker イメージを（自己署名証明書を使って）セキュアではないレジストリから取得しようとする場合、あるいはそのようなレジストリをミラーとして利用する場合、Docker 18.09 では既知の問題が発生します。
@z

@x
```console
[+] Building 0.4s (3/3) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 169B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => ERROR resolve image config for docker.io/docker/dockerfile:experimental
------
 > resolve image config for docker.io/docker/dockerfile:experimental:
------
failed to do request: Head https://repo.mycompany.com/v2/docker/dockerfile/manifests/experimental: x509: certificate signed by unknown authority
```
@y
```console
[+] Building 0.4s (3/3) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 169B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => ERROR resolve image config for docker.io/docker/dockerfile:experimental
------
 > resolve image config for docker.io/docker/dockerfile:experimental:
------
failed to do request: Head https://repo.mycompany.com/v2/docker/dockerfile/manifests/experimental: x509: certificate signed by unknown authority
```
@z

@x
Solution : secure your registry properly. You can get SSL certificates from
Let's Encrypt for free. See /registry/deploying/
@y
{% comment %}
Solution : secure your registry properly. You can get SSL certificates from
Let's Encrypt for free. See /registry/deploying/
{% endcomment %}
解決方法 : レジストリを適切にセキュアなものにしてください。
無償の Let's Encrypt から SSL 証明書を取得することができます。
/registry/deploying/ を参照してください。
@z

@x
#### image not found when the private registry is running on Sonatype Nexus version < 3.15
@y
{% comment %}
#### image not found when the private registry is running on Sonatype Nexus version < 3.15
{% endcomment %}
{: #image-not-found-when-the-private-registry-is-running-on-sonatype-nexus-version--315 }
#### Sonatype Nexus バージョン 3.15 未満、プライベートリポジトリ実行時のイメージ "not found"
@z

@x
If you are running a private registry using Sonatype Nexus version < 3.15, and
receive an error similar to the following :
@y
{% comment %}
If you are running a private registry using Sonatype Nexus version < 3.15, and
receive an error similar to the following :
{% endcomment %}
Sonatype Nexus バージョン 3.15 未満を利用してプライベートリポジトリを起動させている場合、以下のようなエラーとなる場合があります。
@z

@x
```console
------
 > [internal] load metadata for docker.io/library/maven:3.5.3-alpine:
------
------
 > [1/4] FROM docker.io/library/maven:3.5.3-alpine:
------
rpc error: code = Unknown desc = docker.io/library/maven:3.5.3-alpine not found
```
@y
```console
------
 > [internal] load metadata for docker.io/library/maven:3.5.3-alpine:
------
------
 > [1/4] FROM docker.io/library/maven:3.5.3-alpine:
------
rpc error: code = Unknown desc = docker.io/library/maven:3.5.3-alpine not found
```
@z

@x
you may be facing the bug below : [NEXUS-12684](https://issues.sonatype.org/browse/NEXUS-12684)
@y
{% comment %}
you may be facing the bug below : [NEXUS-12684](https://issues.sonatype.org/browse/NEXUS-12684)
{% endcomment %}
以下に示すバグ [NEXUS-12684](https://issues.sonatype.org/browse/NEXUS-12684) に該当している可能性があります。
@z

@x
Solution is to upgrade your Nexus to version 3.15 or above.
@y
{% comment %}
Solution is to upgrade your Nexus to version 3.15 or above.
{% endcomment %}
これを解決するには Nexus をバージョン 3.15 以上にアップグレードしてください。
@z
