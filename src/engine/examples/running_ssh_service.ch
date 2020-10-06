%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Installing and running an SSHd service on Docker
keywords: docker, example, package installation,  networking
title: Dockerize an SSH service
---
@y
---
description: Docker 上での SSHd サービスのインストールと起動。
keywords: docker, example, package installation,  networking
title: SSH サービスの Docker 化
---
@z

@x
## Build an `eg_sshd` image
@y
{% comment %}
## Build an `eg_sshd` image
{% endcomment %}
## `eg_sshd` イメージのビルド
{: #build-an-eg_sshd-image }
@z

@x
### Generate a secure root password for your image
@y
{% comment %}
### Generate a secure root password for your image
{% endcomment %}
### イメージに対するセキュアな root パスワードの生成
{: #generate-a-secure-root-password-for-your-image }
@z

@x
Using a static password for root access is dangerous. Create a random password before proceeding.
@y
{% comment %}
Using a static password for root access is dangerous. Create a random password before proceeding.
{% endcomment %}
root アクセスにあたって固定的なパスワードを用いるのは危険です。
この先に進むにあたってはランダムなパスワードを生成してください。
@z

@x
### Build the image
@y
{% comment %}
### Build the image
{% endcomment %}
### イメージのビルド
{: #build-the-image }
@z

@x
The following `Dockerfile` sets up an SSHd service in a container that you
can use to connect to and inspect other container's volumes, or to get
quick access to a test container. Make the following substitutions:
@y
{% comment %}
The following `Dockerfile` sets up an SSHd service in a container that you
can use to connect to and inspect other container's volumes, or to get
quick access to a test container. Make the following substitutions:
{% endcomment %}
以下に示す `Dockerfile` はコンテナー内に SSHd サービスを設定します。
これを用いて他のコンテナーのボリュームに接続し内容を確認したり、テストコンテナーにもすぐにアクセスできるようになります。
以下に示す部分は書き換えてください。
@z

@x
- With `RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd`, replace "THEPASSWORDYOUCREATED" with the password you've previously generated.
- With `RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config`, use `without-password` instead of `prohibit-password` for Ubuntu 14.04.
@y
{% comment %}
- With `RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd`, replace "THEPASSWORDYOUCREATED" with the password you've previously generated.
- With `RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config`, use `without-password` instead of `prohibit-password` for Ubuntu 14.04.
{% endcomment %}
- `RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd` においては、"THEPASSWORDYOUCREATED" の部分は、事前に生成しておいたパスワードに書き換えてください。
- `RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config` は、Ubuntu 14.04 においては `prohibit-password` ではなく `without-password` を指定してください。
@z

@x
```dockerfile
FROM ubuntu:20.04
@y
```dockerfile
FROM ubuntu:20.04
@z

@x
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
@y
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
@z

@x
# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
@y
# SSH ログインの設定修正。これを行わないとログインした後に処理実行できない。
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
@z

@x
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
@y
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
@z

@x
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
```
@y
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
```
@z

@x
Build the image using:
@y
{% comment %}
Build the image using:
{% endcomment %}
以下のコマンドによりイメージをビルドします。
@z

@x
```bash
$ docker build -t eg_sshd .
```
## Run a `test_sshd` container
@y
```bash
$ docker build -t eg_sshd .
```
{% comment %}
## Run a `test_sshd` container
{% endcomment %}
## `test_sshd` コンテナーの実行
{: #run-a-test_sshd-container }
@z

@x
Then run it. You can then use `docker port` to find out what host port
the container's port 22 is mapped to:
@y
{% comment %}
Then run it. You can then use `docker port` to find out what host port
the container's port 22 is mapped to:
{% endcomment %}
コンテナーを実行します。
`docker port` を使うと、コンテナーのポート 22 番がホストの何番ポートに割り当てられているかがわかります。
@z

@x
```bash
$ docker run -d -P --name test_sshd eg_sshd
$ docker port test_sshd 22
@y
```bash
$ docker run -d -P --name test_sshd eg_sshd
$ docker port test_sshd 22
@z

@x
0.0.0.0:49154
```
@y
0.0.0.0:49154
```
@z

@x
And now you can ssh as `root` on the container's IP address (you can find it
with `docker inspect`) or on port `49154` of the Docker daemon's host IP address
(`ip address` or `ifconfig` can tell you that) or `localhost` if on the
Docker daemon host:
@y
{% comment %}
And now you can ssh as `root` on the container's IP address (you can find it
with `docker inspect`) or on port `49154` of the Docker daemon's host IP address
(`ip address` or `ifconfig` can tell you that) or `localhost` if on the
Docker daemon host:
{% endcomment %}
ここでコンテナーの IP アドレスに向けて `root` により SSH ログインします。
（IP アドレスは `docker inspect` を実行するとわかります。)
あるいは Docker デーモンのホスト IP アドレスに、ポート `49514` で接続します。
（`ip address` あるいは `ifconfig` により IP アドレスがわかります。）
Docker デーモンホスト上の場合は `localhost` に接続します。
@z

@x
```bash
$ ssh root@192.168.1.2 -p 49154
# or
$ ssh root@localhost -p 49154
# The password is ``screencast``.
root@f38c87f2a42d:/#
```
@y
```bash
$ ssh root@192.168.1.2 -p 49154
# または
$ ssh root@localhost -p 49154
# The password is ``screencast``.
root@f38c87f2a42d:/#
```
@z

@x
## Environment variables
@y
{% comment %}
## Environment variables
{% endcomment %}
## 環境変数
{: #environment-variables }
@z

@x
Using the `sshd` daemon to spawn shells makes it complicated to pass environment
variables to the user's shell via the normal Docker mechanisms, as `sshd` scrubs
the environment before it starts the shell.
@y
{% comment %}
Using the `sshd` daemon to spawn shells makes it complicated to pass environment
variables to the user's shell via the normal Docker mechanisms, as `sshd` scrubs
the environment before it starts the shell.
{% endcomment %}
`sshd` デーモンによりシェル起動するので、ユーザーシェルへの環境変数の受け渡しは複雑になります。Docker の通常のメカニズムにより `sshd` サービスがシェルを起動する前に環境変数をクリアしてしまうためです。
@z

@x
If you're setting values in the `Dockerfile` using `ENV`, you need to push them
to a shell initialization file like the `/etc/profile` example in the `Dockerfile`
above.
@y
{% comment %}
If you're setting values in the `Dockerfile` using `ENV`, you need to push them
to a shell initialization file like the `/etc/profile` example in the `Dockerfile`
above.
{% endcomment %}
`Dockerfile` 内に `ENV` を使って値設定をしている場合は、それを `/etc/profile` のようなシェル初期化ファイルに受け渡す必要があります。
その例は上の `Dockerfile` に示しています。
@z

@x
If you need to pass`docker run -e ENV=value` values, you need to write a
short script to do the same before you start `sshd -D` and then replace the
`CMD` with that script.
@y
{% comment %}
If you need to pass`docker run -e ENV=value` values, you need to write a
short script to do the same before you start `sshd -D` and then replace the
`CMD` with that script.
{% endcomment %}
`docker run -e ENV=value` の実行のようにして値を受け渡す場合は、`sshd -D` を実行する前に、同じことを行う単純なスクリプトを生成して、`CMD` の行をそのスクリプトに置き換えることが必要です。
@z

@x
## Clean up
@y
{% comment %}
## Clean up
{% endcomment %}
## 環境クリア
{: #clean-up }
@z

@x
Finally, clean up after your test by stopping and removing the
container, and then removing the image.
@y
{% comment %}
Finally, clean up after your test by stopping and removing the
container, and then removing the image.
{% endcomment %}
環境構築のテストが済んだら、コンテナーの停止と削除を行い、イメージを削除します。
@z

@x
```bash
$ docker container stop test_sshd
$ docker container rm test_sshd
$ docker image rm eg_sshd
```
@y
```bash
$ docker container stop test_sshd
$ docker container rm test_sshd
$ docker image rm eg_sshd
```
@z
