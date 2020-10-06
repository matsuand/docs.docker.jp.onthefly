%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop on Mac and Docker Toolbox
keywords: mac, windows, alpha, beta, toolbox, docker-machine, tutorial
redirect_from:
- /mackit/docker-toolbox/
title: Docker Desktop on Mac vs. Docker Toolbox
---
@y
---
description: Docker Desktop on Mac and Docker Toolbox
keywords: mac, windows, alpha, beta, toolbox, docker-machine, tutorial
redirect_from:
- /mackit/docker-toolbox/
title: Docker Desktop on Mac と Docker Toolbox
---
@z

@x
If you already have an installation of Docker Toolbox, read these topics
first to learn how Docker Desktop on Mac and Docker Toolbox differ, and how they can
coexist.
@y
{% comment %}
If you already have an installation of Docker Toolbox, read these topics
first to learn how Docker Desktop on Mac and Docker Toolbox differ, and how they can
coexist.
{% endcomment %}
Docker Toolbox をすでにインストールしている場合は、ここに示すトピックをまず読んでください。
そして Mac 上の Docker Desktop と Docker Toolbox がどのように違うか、またどうやって共存できるかを確認してください。
@z

@x
## The Docker Toolbox environment
@y
{% comment %}
## The Docker Toolbox environment
{% endcomment %}
{: #the-docker-toolbox-environment }
## Docker Toolbox 環境
@z

@x
Docker Toolbox installs `docker`, `docker-compose`, and `docker-machine` in
`/usr/local/bin` on your Mac. It also installs VirtualBox. At installation time,
Toolbox uses `docker-machine` to provision a VirtualBox VM called `default`,
running the `boot2docker` Linux distribution, with [Docker Engine](/engine/)
with certificates located on your Mac at
`$HOME/.docker/machine/machines/default`.
@y
{% comment %}
Docker Toolbox installs `docker`, `docker-compose`, and `docker-machine` in
`/usr/local/bin` on your Mac. It also installs VirtualBox. At installation time,
Toolbox uses `docker-machine` to provision a VirtualBox VM called `default`,
running the `boot2docker` Linux distribution, with [Docker Engine](/engine/)
with certificates located on your Mac at
`$HOME/.docker/machine/machines/default`.
{% endcomment %}
Docker Toolbox をインストールすると、Mac 内の `/usr/local/bin` に `docker`、`docker-compose`、`docker-machine` がインストールされます。
また VirtualBox も同時にインストールされます。
インストール処理において Toolbox は `docker-machine` を使って VirtualBox の VM を準備します。
この VM は `default` という名称であり、Linux ディストリビューション `boot2docker` を稼動させます。
またそこでは、Mac 内の `$HOME/.docker/machine/machines/default` にある証明書を利用した [Docker Engine](/engine/) が利用できます。
@z

@x
Before you use `docker` or `docker-compose` on your Mac, you typically use the
command `eval $(docker-machine env default)` to set environment variables so
that `docker` or `docker-compose` know how to talk to Docker Engine running on
VirtualBox.
@y
{% comment %}
Before you use `docker` or `docker-compose` on your Mac, you typically use the
command `eval $(docker-machine env default)` to set environment variables so
that `docker` or `docker-compose` know how to talk to Docker Engine running on
VirtualBox.
{% endcomment %}
Mac 上において `docker` や `docker-compose` を実行する前には、通常 `eval $(docker-machine env default)` というコマンドを実行して、環境変数の設定を行います。
これを行うことで `docker` や `docker-compose` が、VirtualBox 内で動作している Docker Engine と通信を行うことが可能になります。
@z

@x
This setup is shown in the following diagram.
@y
{% comment %}
This setup is shown in the following diagram.
{% endcomment %}
この設定状況を以下の図に示します。
@z

@x
![Docker Toolbox Install](images/toolbox-install.png)
@y
{% comment %}
![Docker Toolbox Install](images/toolbox-install.png)
{% endcomment %}
![Docker Toolbox のインストール状況](images/toolbox-install.png)
@z

@x
## The Docker Desktop on Mac environment
@y
{% comment %}
## The Docker Desktop on Mac environment
{% endcomment %}
{: #the-docker-desktop-on-mac-environment }
## Mac 上の Docker Desktop 環境
@z

@x
Docker Desktop on Mac is a Mac-native application, that you install in `/Applications`.
At installation time, it creates symlinks in `/usr/local/bin` for `docker` and
`docker-compose` and others, to the commands in the application
bundle, in `/Applications/Docker.app/Contents/Resources/bin`.
@y
{% comment %}
Docker Desktop on Mac is a Mac-native application, that you install in `/Applications`.
At installation time, it creates symlinks in `/usr/local/bin` for `docker` and
`docker-compose` and others, to the commands in the application
bundle, in `/Applications/Docker.app/Contents/Resources/bin`.
{% endcomment %}
Mac 上の Docker Desktop は Mac のネイティブなアプリケーションであり、`/Applications` にインストールされます。
インストールの際には、`docker` や `docker-compose` などに対するシンボリックリンクが `/usr/local/bin` 内に生成されます。
これらはアプリケーションから提供されるコマンドであり、`/Applications/Docker.app/Contents/Resources/bin` 内にあるものです。
@z

@x
Here are some key points to know about Docker Desktop on Mac before you get started:
@y
{% comment %}
Here are some key points to know about Docker Desktop on Mac before you get started:
{% endcomment %}
Mac 上の Docker Desktop をはじめる前に、知っておくべき重要な点を示します。
@z

@x
* Docker Desktop uses [HyperKit](https://github.com/docker/HyperKit/) instead of Virtual Box. Hyperkit is a lightweight macOS virtualization solution built on top of Hypervisor.framework in macOS 10.10 Yosemite and higher.
@y
{% comment %}
* Docker Desktop uses [HyperKit](https://github.com/docker/HyperKit/) instead of Virtual Box. Hyperkit is a lightweight macOS virtualization solution built on top of Hypervisor.framework in macOS 10.10 Yosemite and higher.
{% endcomment %}
* Docker Desktop は Virtual Box のかわりに [HyperKit](https://github.com/docker/HyperKit/) を利用します。
  Hyperkit は軽量な macOS 仮想化ソリューションであり、macOS 10.10 Yosemite またはそれ以降のハイパーバイザーフレームワーク上に構築されています。
@z

@x
* When you install Docker Desktop on Mac, machines created with Docker Machine are not affected.
@y
{% comment %}
* When you install Docker Desktop on Mac, machines created with Docker Machine are not affected.
{% endcomment %}
* Mac 上に Docker Desktop をインストールしても、Docker Machine から生成したマシンには影響しません。
@z

@x
* Docker Desktop does not use `docker-machine` to provision its VM.
  The Docker Engine API is exposed on a
  socket available to the Mac host at `/var/run/docker.sock`. This is the
  default location Docker and Docker Compose clients use to connect to
  the Docker daemon, so you can use `docker` and `docker-compose` CLI commands
  on your Mac.
@y
{% comment %}
* Docker Desktop does not use `docker-machine` to provision its VM.
  The Docker Engine API is exposed on a
  socket available to the Mac host at `/var/run/docker.sock`. This is the
  default location Docker and Docker Compose clients use to connect to
  the Docker daemon, so you can use `docker` and `docker-compose` CLI commands
  on your Mac.
{% endcomment %}
* Docker Desktop では `docker-machine` を使って VM を準備することはしません。
  Mac ホスト上では、Docker Engine API が `/var/run/docker.sock` というソケットを通じて公開されています。
  そして Docker デーモンに対して Docker あるいは Docker Compose のクライアントが接続するデフォルトの場所がこの API となるため、Mac 上では `docker` または `docker-compose` の CLI コマンドを使っていくことになります。
@z

@x
This setup is shown in the following diagram.
@y
{% comment %}
This setup is shown in the following diagram.
{% endcomment %}
この設定状況を以下の図に示します。
@z

@x
![Docker Desktop for Mac Install](images/docker-for-mac-install.png)
@y
{% comment %}
![Docker Desktop for Mac Install](images/docker-for-mac-install.png)
{% endcomment %}
![Docker Desktop for Mac のインストール状況](images/docker-for-mac-install.png)
@z

@x
With Docker Desktop on Mac, you only get (and only usually need) one VM, managed by Docker Desktop. Docker Desktop automatically upgrades the Docker client and daemon when updates are available.
@y
{% comment %}
With Docker Desktop on Mac, you only get (and only usually need) one VM, managed by Docker Desktop. Docker Desktop automatically upgrades the Docker client and daemon when updates are available.
{% endcomment %}
Mac 上の Docker Desktop では、1 つの（しかも 1 しか必要のない）VM を使います。
これは Docker Desktop によって管理されます。
Docker Desktop のアップグレードが入手可能になると、Docker Client やデーモンは自動的にアップグレードされます。
@z

@x
Also note that Docker Desktop can’t route traffic to containers, so you can't
directly access an exposed port on a running container from the hosting machine.
@y
{% comment %}
Also note that Docker Desktop can’t route traffic to containers, so you can't
directly access an exposed port on a running container from the hosting machine.
{% endcomment %}
また Docker Desktop ではコンテナーに対してトラフィックをルーティングすることはできません。
したがって実行中コンテナーにおいて公開されているポートであっても、ホストマシンから直接アクセスすることはできません。
@z

@x
If you do need multiple VMs, such as when testing multi-node swarms, you can
continue to use Docker Machine, which operates outside the scope of Docker Desktop. See
[Docker Toolbox and Docker Desktop coexistence](docker-toolbox.md#docker-toolbox-and-docker-desktop-coexistence).
@y
{% comment %}
If you do need multiple VMs, such as when testing multi-node swarms, you can
continue to use Docker Machine, which operates outside the scope of Docker Desktop. See
[Docker Toolbox and Docker Desktop coexistence](docker-toolbox.md#docker-toolbox-and-docker-desktop-coexistence).
{% endcomment %}
マルチノードによる Swarm をテストする場合などには、複数の VM が必要になります。
この場合は Docker Machine をそのまま利用することができます。
ただしこの操作は Docker Desktop の範囲外で行われることです。
[Docker Toolbox と Docker Desktop の共存](docker-toolbox.md#docker-toolbox-and-docker-desktop-coexistence) を参照してください。
@z

@x
## Setting up to run Docker Desktop on Mac
@y
{% comment %}
## Setting up to run Docker Desktop on Mac
{% endcomment %}
{: #setting-up-to-run-docker-desktop-on-mac }
## Mac 上での Docker Desktop の設定
@z

@x
1. Check whether Toolbox DOCKER environment variables are set:
@y
{% comment %}
1. Check whether Toolbox DOCKER environment variables are set:
{% endcomment %}
1. Toolbox の DOCKER 関連の環境変数が設定されているかどうかを確認します。
@z

@x
        $ env | grep DOCKER
        DOCKER_HOST=tcp://192.168.99.100:2376
        DOCKER_MACHINE_NAME=default
        DOCKER_TLS_VERIFY=1
        DOCKER_CERT_PATH=/Users/<your_username>/.docker/machine/machines/default
@y
        $ env | grep DOCKER
        DOCKER_HOST=tcp://192.168.99.100:2376
        DOCKER_MACHINE_NAME=default
        DOCKER_TLS_VERIFY=1
        DOCKER_CERT_PATH=/Users/<your_username>/.docker/machine/machines/default
@z

@x
    If this command returns no output, you are ready to use Docker Desktop.
@y
    {% comment %}
    If this command returns no output, you are ready to use Docker Desktop.
    {% endcomment %}
    このコマンドの出力が何もなければ、Docker Desktop の利用が可能です。
@z

@x
    If it returns output (as shown in the example), unset
    the `DOCKER` environment variables to make the client talk to the
    Docker Desktop Engine (next step).
@y
    {% comment %}
    If it returns output (as shown in the example), unset
    the `DOCKER` environment variables to make the client talk to the
    Docker Desktop Engine (next step).
    {% endcomment %}
    逆に（上に示しているように）コマンドから出力が返ってきたら、`DOCKER` 関連の環境変数を削除します。
    そうすることでクライアントが Docker Desktop Engine とやりとりができるようになります（次のステップとして示します）。
@z

@x
2. Run the `unset` command on the following `DOCKER` environment variables to
   unset them in the current shell.
@y
{% comment %}
2. Run the `unset` command on the following `DOCKER` environment variables to
   unset them in the current shell.
{% endcomment %}
2. 以下のような `unset` コマンドを実行して、現在のシェルにおいて `DOCKER` 関連の環境変数を削除します。
@z

@x
        unset DOCKER_TLS_VERIFY
        unset DOCKER_CERT_PATH
        unset DOCKER_MACHINE_NAME
        unset DOCKER_HOST
@y
        unset DOCKER_TLS_VERIFY
        unset DOCKER_CERT_PATH
        unset DOCKER_MACHINE_NAME
        unset DOCKER_HOST
@z

@x
  Now, this command should return no output.
@y
  {% comment %}
  Now, this command should return no output.
  {% endcomment %}
  こうすれば、先ほどのコマンド出力は何もなくなります。
@z

@x
          $ env | grep DOCKER
@y
          $ env | grep DOCKER
@z

@x
  If you are using a Bash shell, you can use `unset ${!DOCKER_*}` to unset all
  DOCKER environment variables at once. (This does not work in other shells such
  as `zsh`; you need to unset each variable individually.)
@y
  {% comment %}
  If you are using a Bash shell, you can use `unset ${!DOCKER_*}` to unset all
  DOCKER environment variables at once. (This does not work in other shells such
  as `zsh`; you need to unset each variable individually.)
  {% endcomment %}
  Bash シェルを利用している場合は `unset ${!DOCKER_*}` を実行すると、DOCKER 関連の環境変数をいっきに削除することができます。
  （これは `zsh` のような他のシェルでは動作しません。その場合は各変数を一つずつ削除していく必要があります。）
@z

@x
> **Note**: If you have a shell script as part of your profile that sets these
> `DOCKER` environment variables automatically each time you open a command
> window, then you need to unset these each time you want to use Docker Desktop.
@y
{% comment %}
> **Note**: If you have a shell script as part of your profile that sets these
> `DOCKER` environment variables automatically each time you open a command
> window, then you need to unset these each time you want to use Docker Desktop.
{% endcomment %}
> **メモ**: プロファイルの一部としてシェルスクリプトを用いていて、端末画面を開くことで自動的に `DOCKER` 関連の変数を設定している場合は、Docker Desktop の利用のたびに、その変数を削除する必要があります。
@z

@x
> If you install Docker Desktop on a machine where Docker Toolbox is installed..
>
> Docker Desktop replaces the `docker` and `docker-compose` command lines in
> `/usr/local/bin` with symlinks to its own versions.
{:.warning}
@y
{% comment %}
> If you install Docker Desktop on a machine where Docker Toolbox is installed..
>
> Docker Desktop replaces the `docker` and `docker-compose` command lines in
> `/usr/local/bin` with symlinks to its own versions.
{:.warning}
{% endcomment %}
> Docker Toolbox を インストールしているマシン上に Docker Desktop をインストールする場合
>
> Docker Desktop は `/usr/local/bin` にある `docker` や `docker-compose` などのコマンドを、Docker Desktop 用のバージョンへのシンボリックリンクに置き換えます。
{:.warning}
@z

@x
See also [Unset environment variables in the current shell](../machine/get-started.md#unset-environment-variables-in-the-current-shell)
in the Docker Machine topics.
@y
{% comment %}
See also [Unset environment variables in the current shell](../machine/get-started.md#unset-environment-variables-in-the-current-shell)
in the Docker Machine topics.
{% endcomment %}
Docker Machine に関する説明においては [現在シェルでの環境変数の削除](../machine/get-started.md#unset-environment-variables-in-the-current-shell) も参照してください。
@z

@x
## Docker Toolbox and Docker Desktop coexistence
@y
{% comment %}
## Docker Toolbox and Docker Desktop coexistence
{% endcomment %}
{: #docker-toolbox-and-docker-desktop-coexistence }
## Docker Toolbox と Docker Desktop の共存
@z

@x
You can use Docker Desktop and Docker Toolbox together on the same machine. When
you want to use Docker Desktop make sure all DOCKER environment variables are
unset. You can do this in bash with `unset ${!DOCKER_*}`. When you want to use
one of the VirtualBox VMs you have set with `docker-machine`, just run a `eval
$(docker-machine env default)` (or the name of the machine you want to target).
This switches the current command shell to talk to the specified Toolbox
machine.
@y
{% comment %}
You can use Docker Desktop and Docker Toolbox together on the same machine. When
you want to use Docker Desktop make sure all DOCKER environment variables are
unset. You can do this in bash with `unset ${!DOCKER_*}`. When you want to use
one of the VirtualBox VMs you have set with `docker-machine`, just run a `eval
$(docker-machine env default)` (or the name of the machine you want to target).
This switches the current command shell to talk to the specified Toolbox
machine.
{% endcomment %}
Docker Desktop と Docker Toolbox は同一マシン上で利用することができます。
Docker Desktop を使う場合には、必ず DOCKER 関連の環境変数の削除を行ないます。
Bash であれば `unset ${!DOCKER_*}` を実行することができます。
`docker-machine` を使って生成した VirtualBox の VM を利用したい場合は、単に `eval $(docker-machine env default)` を実行するだけです。
（あるいは対象とするマシンに合わせて名前を変更します。）
このようにすると、現在のコマンドシェルから、指定した Toolbox マシンへのアクセスに切り替わります。
@z

@x
This setup is represented in the following diagram.
@y
{% comment %}
This setup is represented in the following diagram.
{% endcomment %}
この設定状況は、以下の図のように表わされます。
@z

@x
![Docker Toolbox and Docker Desktop for Mac coexistence](images/docker-for-mac-and-toolbox.png)
@y
{% comment %}
![Docker Toolbox and Docker Desktop for Mac coexistence](images/docker-for-mac-and-toolbox.png)
{% endcomment %}
![Docker Toolbox と Docker Desktop for Mac の共存](images/docker-for-mac-and-toolbox.png)
@z

@x
## Using different versions of Docker tools
@y
{% comment %}
## Using different versions of Docker tools
{% endcomment %}
{: #using-different-versions-of-docker-tools }
## 異なる Docker ツールバージョンの利用
@z

@x
The coexistence setup works as is as long as your VirtualBox VMs provisioned
with `docker-machine` run the same version of Docker Engine as Docker Desktop.
If you need to use VMs running older versions of Docker Engine, you can use a
tool like [Docker Version Manager](https://github.com/getcarina/dvm) to manage
several versions of docker client.
@y
{% comment %}
The coexistence setup works as is as long as your VirtualBox VMs provisioned
with `docker-machine` run the same version of Docker Engine as Docker Desktop.
If you need to use VMs running older versions of Docker Engine, you can use a
tool like [Docker Version Manager](https://github.com/getcarina/dvm) to manage
several versions of docker client.
{% endcomment %}
`docker-machine` によって生成された VirtualBox VM の動作にあたっては、Docker Desktop と同一バージョンの Docker Engine が実行されることが必要であり、その場合に限って、両者の共存環境は動作します。
Docker Engine の古いバージョンを用いて VM を実行する場合は、[Docker バージョンマネージャー](https://github.com/getcarina/dvm) のようなツールを使って、Docker クライアントでの複数バージョン管理が必要になります。
@z

@x
### Checking component versions
@y
{% comment %}
### Checking component versions
{% endcomment %}
{: #checking-component-versions }
### コンポーネントのバージョン確認
@z

@x
Ideally, the Docker CLI client and Docker Engine should be the same version.
Mismatches between client and server, and host machines you might have
created with Docker Machine can cause problems (client can't talk to the server
or host machines).
@y
{% comment %}
Ideally, the Docker CLI client and Docker Engine should be the same version.
Mismatches between client and server, and host machines you might have
created with Docker Machine can cause problems (client can't talk to the server
or host machines).
{% endcomment %}
理想として Docker CLI クライアントと Docker Engine のバージョンは同一とすべきです。
クライアントとサーバー間において、あるいは Docker Machine を使って生成してきたホストマシン間において、バージョンの違いがあると、問題が発生することになります。
（クライアントからサーバー、あるいはホストマシンとの間でやりとりができなくなります。）
@z

@x
If you have already installed [Docker Toolbox](/toolbox/overview/), and then
installed Docker Desktop, you might get a newer version of the Docker client. Run `docker version` in a command shell to see client and server versions. In this example, the client installed with Docker Desktop is `Version: 19.03.1` and the server (which was installed earlier with Toolbox) is `Version: 19.03.2`.
@y
{% comment %}
If you have already installed [Docker Toolbox](/toolbox/overview/), and then
installed Docker Desktop, you might get a newer version of the Docker client. Run `docker version` in a command shell to see client and server versions. In this example, the client installed with Docker Desktop is `Version: 19.03.1` and the server (which was installed earlier with Toolbox) is `Version: 19.03.2`.
{% endcomment %}
[Docker Toolbox](/toolbox/overview/) をすでにインストールしていて、その後に Docker Desktop をインストールしたとします。
この場合、Docker Client のより最新のバージョンがインストールされたことになります。
コマンドシェルから `docker version` を実行してみれば、クライアントとサーバーのバージョンがわかります。
ここでの例では、Docker Desktop からインストールされたクライアントが `Version: 19.03.1` であり、（Toolbox から以前よりインストールされていた）サーバーが `Version: 19.03.2` となっています。
@z

@x
    $ docker version
    Client:
    Version:      19.03.1
    ...
@y
    $ docker version
    Client:
    Version:      19.03.1
    ...
@z

@x
    Server:
    Version:      19.03.2
    ...
@y
    Server:
    Version:      19.03.2
    ...
@z

@x
Also, if you created machines with Docker Machine (installed with Toolbox) then
upgraded or installed Docker Desktop, you might have machines running different
versions of Engine. Run `docker-machine ls` to view version information for the
machines you created. In this example, the DOCKER column shows that each machine
is running a different version of server.
@y
{% comment %}
Also, if you created machines with Docker Machine (installed with Toolbox) then
upgraded or installed Docker Desktop, you might have machines running different
versions of Engine. Run `docker-machine ls` to view version information for the
machines you created. In this example, the DOCKER column shows that each machine
is running a different version of server.
{% endcomment %}
また（Toolbox によりインストールされた）Docker Machine を使ってマシンを生成した場合であって、その後に Docker Desktop をアップグレードまたはインストールしたとします。
この場合、各マシンは異なるバージョンの Engine において動作することになります。
`docker-machine ls` を実行すると、生成したマシンに対するバージョン情報を確認できます。
この例において DOCKER 列には、各マシンが異なるバージョンのサーバーを起動していることがわかります。
@z

@x
    $ docker-machine ls
    NAME             ACTIVE   DRIVER         STATE     URL                         SWARM   DOCKER    ERRORS
    aws-sandbox      -        amazonec2      Running   tcp://52.90.113.128:2376            v19.03.1
    default          *        virtualbox     Running   tcp://192.168.99.100:2376           v19.03.2
    docker-sandbox   -        digitalocean   Running   tcp://104.131.43.236:2376           v19.03.1
@y
    $ docker-machine ls
    NAME             ACTIVE   DRIVER         STATE     URL                         SWARM   DOCKER    ERRORS
    aws-sandbox      -        amazonec2      Running   tcp://52.90.113.128:2376            v19.03.1
    default          *        virtualbox     Running   tcp://192.168.99.100:2376           v19.03.2
    docker-sandbox   -        digitalocean   Running   tcp://104.131.43.236:2376           v19.03.1
@z

@x
There are a few ways to address this problem and keep using your older
machines. One solution is to use a version manager like
[DVM](https://github.com/getcarina/dvm).
@y
{% comment %}
There are a few ways to address this problem and keep using your older
machines. One solution is to use a version manager like
[DVM](https://github.com/getcarina/dvm).
{% endcomment %}
このような問題に対処する方法、あるいは古いマシンを使い続ける方法があります。
1 つにはバージョンマネージャー [DVM](https://github.com/getcarina/dvm) を利用するという方法です。
@z

@x
## Migrating from Docker Toolbox to Docker Desktop on Mac
@y
{% comment %}
## Migrating from Docker Toolbox to Docker Desktop on Mac
{% endcomment %}
{: #migrating-from-docker-toolbox-to-docker-desktop-on-mac }
## Mac 上での Docker Toolbox から Docker Desktop への移行
@z

@x
Docker Desktop does not propose Toolbox image migration as part of its
installer since version 18.01.0.  You can migrate existing Docker
Toolbox images with the steps described below.
@y
{% comment %}
Docker Desktop does not propose Toolbox image migration as part of its
installer since version 18.01.0.  You can migrate existing Docker
Toolbox images with the steps described below.
{% endcomment %}
Docker Desktop ではバージョン 18.01.0 以降、インストール処理において Toolbox イメージの移行操作を行わないようになりました。
既存の Docker Toolbox イメージは、以下に示すスクリプトを使って移行できます。
@z

@x
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
@y
{% comment %}
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
{% endcomment %}
Toolbox の実行中、ターミナル画面において `docker commit` を実行して、コンテナーからイメージスナップショットを生成します。
これは保存しておきたいコンテナーすべてに対して行います。
@z

@x
```
$ docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, export each of these images (and any other images you wish to keep):
@y
{% comment %}
Next, export each of these images (and any other images you wish to keep):
{% endcomment %}
上のイメージを（そして他にも保存しておきたいイメージがあればそれも含めて）エクスポートします。
@z

@x
```
$ docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, when running Docker Desktop on Mac, reload all these images:
@y
{% comment %}
Next, when running Docker Desktop on Mac, reload all these images:
{% endcomment %}
Docker Desktop on Mac が実行中に、上のイメージをすべてリロードします。
@z

@x
```
$ docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
@y
{% comment %}
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
{% endcomment %}
なお上の手順では `docker volume` によるデータは移行されません。
そういったデータは手動でコピーを行う必要があります。
@z

@x
Finally (optional), if you are done with Docker Toolbox, you may fully
[uninstall
it](https://docs.docker.com/toolbox/toolbox_install_mac/#how-to-uninstall-toolbox).
@y
{% comment %}
Finally (optional), if you are done with Docker Toolbox, you may fully
[uninstall
it](https://docs.docker.com/toolbox/toolbox_install_mac/#how-to-uninstall-toolbox).
{% endcomment %}
最後に（任意の作業として）Docker Toolbox はこれで終了とするなら、[アンインストール](https://docs.docker.com/toolbox/toolbox_install_mac/#how-to-uninstall-toolbox) を行って完全に削除します。
@z

@x
## How do I uninstall Docker Toolbox?
@y
{% comment %}
## How do I uninstall Docker Toolbox?
{% endcomment %}
{: #how-do-i-uninstall-docker-toolbox }
## Docker Toolbox のアンインストール方法
@z

@x
You might decide that you do not need Toolbox now that you have Docker Desktop,
and want to uninstall it. For details on how to perform a clean uninstall of
Toolbox on Mac, see [How to uninstall Toolbox](../toolbox/toolbox_install_mac.md#how-to-uninstall-toolbox)
in the Toolbox Mac topics.
@y
{% comment %}
You might decide that you do not need Toolbox now that you have Docker Desktop,
and want to uninstall it. For details on how to perform a clean uninstall of
Toolbox on Mac, see [How to uninstall Toolbox](../toolbox/toolbox_install_mac.md#how-to-uninstall-toolbox)
in the Toolbox Mac topics.
{% endcomment %}
Docker Desktop を手にしました。
Toolbox はもう不要だから、これをアンインストールしようと思うでしょう。
Mac 上の Toolbox をきれいにアンインストールする方法については、Toolbox の Mac に関する説明の中で、[Toolbox のアンインストール方法](../toolbox/toolbox_install_mac.md#how-to-uninstall-toolbox) に説明しています。
@z
