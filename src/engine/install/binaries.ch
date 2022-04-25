%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Instructions for installing Docker as a binary. Mostly meant for hackers who want to try out Docker on a variety of environments.
keywords: binaries, installation, docker, documentation, linux
title: Install Docker Engine from binaries
redirect_from:
- /engine/installation/binaries/
- /engine/installation/linux/docker-ce/binaries/
- /install/linux/docker-ce/binaries/
- /installation/binaries/
---
@y
---
description: Instructions for installing Docker as a binary. Mostly meant for hackers who want to try out Docker on a variety of environments.
keywords: binaries, installation, docker, documentation, linux
title: Install Docker Engine from binaries
title: バイナリからの Docker Engine インストール
redirect_from:
- /engine/installation/binaries/
- /engine/installation/linux/docker-ce/binaries/
- /install/linux/docker-ce/binaries/
- /installation/binaries/
---
@z

@x
> **Important**
>
> This page contains information on how to install Docker using binaries. These
> instructions are mostly suitable for testing purposes. We do not recommend
> installing Docker using binaries in production environments as they will not be
> updated automatically with security updates. The Linux binaries described on this
> page are statically linked, which means that vulnerabilities in build-time
> dependencies are not automatically patched by security updates of your Linux
> distribution.
>
> Updating binaries is also slightly more involved when compared to Docker packages
> installed using a package manager or through Docker Desktop, as it requires
> (manually) updating the installed version whenever there is a new release of
> Docker.
>
> Also, static binaries may not include all functionalities provided by the dynamic
> packages.
>
> On Windows and Mac, we recommend that you install [Docker Desktop](../../desktop/index.md)
> instead. For Linux, we recommend that you follow the instructions specific for
> your distribution.
{: .important}
@y
> **重要**
>
> このページでは、Docker のバイナリをインストールする方法について示しています。
> テスト目的であれば、この手順でも問題ありません。
> ただしこのバイナリを用いて、本番環境に Docker をインストールすることはお勧めしません。
> そうしてしまうと、セキュリティアップデートが自動的に適用されないためです。
> このページにおいて説明する Linux バイナリは、スタティックリンクが行われています。
> これはつまり、ビルド時に依存するパッケージ内にぜい弱性があると、利用する Linux ディストリビューションがセキュリティアップデートを行っても、自動的にパッチ適用されないということです。
>
> Docker インストールを、パッケージマネージャーから行っていたり、Docker Desktop を通じて行っている場合に比べると、バイナリのインストールでは、更新作業が少々面倒です。
> Docker の新規リリースが行われた際には、インストール更新を (手動で) 行う必要があるためです。
>
> またスタティックリンクによるバイナリでは、ダイナミックリンクに基づくパッケージが提供する機能が、すべて含まれていない場合があります。
>
> Windows や Mac を利用する場合は、バイナリの代わりに [Docker Desktop](../../desktop/index.md) のインストールをお勧めします。
> Linux の場合は、各ディストリビューションに固有のインストール手順に従うことをお勧めします。
{: .important}
@z

@x
If you want to try Docker or use it in a testing environment, but you're not on
a supported platform, you can try installing from static binaries. If possible,
you should use packages built for your operating system, and use your operating
system's package management system to manage Docker installation and upgrades.
@y
Docker を利用したい、あるいはテスト環境で使いたいと思っても、お使いのプラットフォームでは Docker がサポートされていません。
そんなときはスタティックリンクされたバイナリをインストールしてみてください。
可能であれば、お使いのオペレーティングシステム用にビルドされたパッケージを使い、オペレーティングシステムのパッケージ管理方法に基づいて Docker のインストールやアップグレードを行ってください。
@z

@x
Static binaries for the Docker daemon binary are only available for Linux (as
`dockerd`) and Windows (as `dockerd.exe`).
Static binaries for the Docker client are available for Linux, Windows, and macOS (as `docker`).
@y
Docker デーモンに対するスタティックバイナリは、Linux (`dockerd`) と Windows (`dockerd.exe`) でのみ利用可能です。
Docker クライアントに対するスタティックバイナリは、Linux、Windows、macOS で利用可能です（`docker`）。
@z

@x
This topic discusses binary installation for Linux, Windows, and macOS:
@y
ここでは Linux、Windows、macOS におけるバイナリモジュールのインストール方法を説明します。
@z

@x
- [Install daemon and client binaries on Linux](#install-daemon-and-client-binaries-on-linux)
- [Install client binaries on macOS](#install-client-binaries-on-macos)
- [Install server and client binaries on Windows](#install-server-and-client-binaries-on-windows)
@y
- [Linux においてデーモンとクライアントのバイナリをインストール](#install-daemon-and-client-binaries-on-linux)
- [macOS においてクライアントのバイナリをインストール](#install-client-binaries-on-macos)
- [Windows においてサーバーとクライアントのバイナリをインストール](#install-server-and-client-binaries-on-windows)
@z

@x
## Install daemon and client binaries on Linux
@y
{: #install-daemon-and-client-binaries-on-linux }
## Linux においてデーモンとクライアントのバイナリをインストール
@z

@x
### Prerequisites
@y
{: #prerequisites }
### 前提条件
@z

@x
Before attempting to install Docker from binaries, be sure your host machine
meets the prerequisites:
@y
Docker のバイナリをインストールする場合には、ホストマシンが以下の前提条件を満たしていることを確認してください。
@z

@x
- A 64-bit installation
- Version 3.10 or higher of the Linux kernel. The latest version of the kernel
  available for your platform is recommended.
- `iptables` version 1.4 or higher
- `git` version 1.7 or higher
- A `ps` executable, usually provided by `procps` or a similar package.
- [XZ Utils](https://tukaani.org/xz/) 4.9 or higher
- A [properly mounted](
  https://github.com/tianon/cgroupfs-mount/blob/master/cgroupfs-mount)
  `cgroupfs` hierarchy; a single, all-encompassing `cgroup` mount
  point is not sufficient. See Github issues
  [#2683](https://github.com/moby/moby/issues/2683),
  [#3485](https://github.com/moby/moby/issues/3485),
  [#4568](https://github.com/moby/moby/issues/4568)).
@y
- 64 ビットシステム。
- Linux カーネルのバージョンは 3.10 またはそれ以上。
  利用するプラットフォームが提供する最新カーネルを用いることを推奨。
- `iptables`のバージョンは 1.4 またはそれ以上。
- `git`のバージョンは 1.7 またはそれ以上。
- `ps`実行モジュールがあること。通常`procps`あるいは類似パッケージが提供している。
- [XZ Utils](https://tukaani.org/xz/) のバージョンは 4.9 またはそれ以上。
- [`cgroupfs`階層が適切にマウントされていること](
  https://github.com/tianon/cgroupfs-mount/blob/master/cgroupfs-mount)。
  単純にすべてを取りまとめた`cgroup`マウントポイントでは不十分です。
  Github の 以下の issue を参考にしてください。
  [#2683](https://github.com/moby/moby/issues/2683)、
  [#3485](https://github.com/moby/moby/issues/3485)、
  [#4568](https://github.com/moby/moby/issues/4568)
@z

@x
#### Secure your environment as much as possible
@y
{: #secure-your-environment-as-much-as-possible }
#### できるだけセキュアな環境を
@z

@x
##### OS considerations
@y
{: #os-considerations }
##### OS に関すること
@z

@x
Enable SELinux or AppArmor if possible.
@y
利用可能であれば SELinux や AppArmor を有効にしてください。
@z

@x
It is recommended to use AppArmor or SELinux if your Linux distribution supports
either of the two. This helps improve security and blocks certain
types of exploits. Review the documentation for your Linux distribution for
instructions for enabling and configuring AppArmor or SELinux.
@y
利用する Linux ディストリビューションが SELinux または AppArmor をサポートしている場合は、それらを利用することを推奨します。
これを有効にしていればセキュリティは向上し、ある種のセキュリティ攻撃を防ぐことにもつながります。
SELinux や AppArmor を設定し有効にする手順については、各 Linux ディストリビューションのドキュメントを参照してください。
@z

@x
> Security Warning
>
> If either of the security mechanisms is enabled, do not disable it as a
> work-around to make Docker or its containers run. Instead, configure it
> correctly to fix any problems.
{:.warning}
@y
> セキュリティ警告
>
> このセキュリティ機能を有効にしていた場合には、Docker やコンテナーを動作させたいからというので、機能を無効にするのはお止めください。
> そのかわりに、正しく機能するように設定を適切に行ってください。
{:.warning}
@z

@x
##### Docker daemon considerations
@y
##### Docker デーモンに関すること
{: #docker-daemon-considerations }
@z

@x
- Enable `seccomp` security profiles if possible. See
  [Enabling `seccomp` for Docker](../security/seccomp.md).
@y
- 利用可能であれば、セキュリティプロファイル`seccomp`を有効にしてください。
  [Docker における`seccomp`の利用](../security/seccomp.md) を参照。
@z

@x
- Enable user namespaces if possible. See the
  [Daemon user namespace options](/engine/reference/commandline/dockerd/#daemon-user-namespace-options).
@y
- 利用可能であればユーザー名前空間を有効にしてください。
  [デーモンのユーザー名前空間に関するオプション]({{ site.baseur }}/engine/reference/commandline/#daemon-user-namespace-options) を参照。
@z

@x
### Install static binaries
@y
### スタティックバイナリのインストール
{: #install-static-binaries }
@z

@x
1.  Download the static binary archive. Go to
    [https://download.docker.com/linux/static/stable/](https://download.docker.com/linux/static/stable/),
    choose your hardware platform, and download the `.tgz` file relating to the
    version of Docker Engine you want to install.
@y
1.  スタティックバイナリのアーカイブをダウンロードします。
    [https://download.docker.com/linux/static/stable/](https://download.docker.com/linux/static/stable/) へ行き、対応するハードウェアプラットフォーム向けのものを選びます。
    必要としている Docker Engine のバージョンに対応づいた`.tgz`ファイルをダウンロードします。
@z

@x
2.  Extract the archive using the `tar` utility. The `dockerd` and `docker`
    binaries are extracted.
@y
2.  `tar`ユーティリティーを使ってアーカイブを展開します。
    バイナリ`dockerd`と`docker`が抽出されます。
@z

@x
    ```console
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@y
    ```console
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@z

@x
3.  **Optional**: Move the binaries to a directory on your executable path, such
    as `/usr/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
@y
3.  **任意の作業** 上のバイナリを実行パスの通ったディレクトリ、たとえば`/usr/bin/`などに移動させます。
    この作業を行わない場合、`docker`や`dockerd`コマンドを起動する際には、常に実行ファイルへのパスも指定する必要があります。
@z

@x
    ```console
    $ sudo cp docker/* /usr/bin/
    ```
@y
    ```console
    $ sudo cp docker/* /usr/bin/
    ```
@z

@x
4.  Start the Docker daemon:
@y
4.  Docker デーモンを起動します。
@z

@x
    ```console
    $ sudo dockerd &
    ```
@y
    ```console
    $ sudo dockerd &
    ```
@z

@x
    If you need to start the daemon with additional options, modify the above
    command accordingly or create and edit the file `/etc/docker/daemon.json`
    to add the custom configuration options.
@y
    デーモンに追加のオプションをつけて実行する必要がある場合は、上記のコマンドそれぞれを修正するか、あるいは設定ファイル`/etc/docker/daemon.json`を生成編集します。そこに必要な設定オプションを追加します。
@z

@x
5.  Verify that Docker is installed correctly by running the `hello-world`
    image.
@y
5.  Docker が正しくインストールされたことを確認するために`hello-world`イメージを実行します。
@z

@x
    ```console
    $ sudo docker run hello-world
    ```
@y
    ```console
    $ sudo docker run hello-world
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@y
    このコマンドはテストイメージをダウンロードして、コンテナー内で実行します。
    コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
## Install client binaries on macOS
@y
## macOS においてクライアントのバイナリをインストール
{: #install-client-binaries-on-macos }
@z

@x
> **Note**
>
> The following instructions are mostly suitable for testing purposes. The macOS
> binary includes the Docker client only. It does not include the `dockerd` daemon
> which is required to run containers. Therefore, we recommend that you install
> [Docker Desktop](../../desktop/index.md) instead.
@y
> **メモ**
>
> 以下に示す手順は、テスト目的であれば問題ありません。
> macOS のバイナリには Docker クライアントのみが含まれています。
> 逆に、コンテナー起動に必要となる`dockerd`デーモンは含まれていません。
> したがって、この代わりに [Docker Desktop](../../desktop/index.md) をインストールすることをお勧めします。
@z

@x
The binaries for Mac also do not contain:
@y
Mac 用のバイナリには、以下のものは含まれません。
@z

@x
- A runtime environment. You must set up a functional engine either in a Virtual Machine, or on a remote Linux machine.
- Docker components such as `buildx`, `docker scan`, and `docker compose`.
@y
- ランタイム環境。エンジンを機能させるためには、仮想マシンやリモートの Linux マシンを用意して環境設定を行う必要があります。
- `buildx`、`docker scan`、`docker compose`といった Docker コンポーネント。
@z

@x
To install client binaries, perform the following steps:
@y
クライアント用バイナリをインストールするには、以下の手順を行います。
@z

@x
1.  Download the static binary archive. Go to
    [https://download.docker.com/mac/static/stable/](https://download.docker.com/mac/static/stable/) and select `x86_64` (for Mac on Intel chip) or `aarch64` (for Mac on Apple silicon),
    and then download the `.tgz` file relating to the version of Docker Engine you want
    to install.
@y
1.  スタティックバイナリのアーカイブをダウンロードします。
    [https://download.docker.com/mac/static/stable/](https://download.docker.com/mac/static/stable/) へ行って、`x86_64`(Intel チップの Mac の場合)、または`aarch64`(Apple シリコンの Mac の場合) を選びます。。
    そして、必要としている Docker Engine のバージョンに対応づいた`.tgz`ファイルをダウンロードします。
@z

@x
2.  Extract the archive using the `tar` utility. The `docker` binary is
    extracted.
@y
2.  `tar`ユーティリティーを使ってアーカイブを展開します。
    バイナリ`docker`が抽出されます。
@z

@x
    ```console
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@y
    ```console
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@z

@x
3.  Clear the extended attributes to allow it run.
@y
3.  拡張属性をクリアして実行できるようにします。
@z

@x
    ```console
    $ sudo xattr -rc docker
    ```
@y
    ```console
    $ sudo xattr -rc docker
    ```
@z

@x
    Now, when you run the following command, you can see the Docker CLI usage instructions:
@y
    この後に以下のコマンドを実行すれば、Docker CLI の利用方法を示す出力が行われます。
@z

@x
    ```console
    $ docker/docker
    ```
@y
    ```console
    $ docker/docker
    ```
@z

@x
4.  **Optional**: Move the binary to a directory on your executable path, such
    as `/usr/local/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
@y
4.  **任意の作業** 上のバイナリを実行パスの通ったディレクトリ、たとえば `/usr/local/bin/` などに移動させます。
    この作業を行わない場合、`docker`や`dockerd`コマンドを起動する際には、常に実行ファイルへのパスも指定する必要があります。
@z

@x
    ```console
    $ sudo cp docker/docker /usr/local/bin/
    ```
@y
    ```console
    $ sudo cp docker/docker /usr/local/bin/
    ```
@z

@x
5.  Verify that Docker is installed correctly by running the `hello-world`
    image. The value of `<hostname>` is a hostname or IP address running the
    Docker daemon and accessible to the client.
@y
5.  Docker が正しくインストールされたことを確認するために`hello-world`イメージを実行します。
    `<hostname>`にはホスト名かその IP アドレスを指定します。
    このホストは Docker デーモンが起動しているマシンのことであり、クライアントからアクセス可能であるものです。
@z

@x
    ```console
    $ sudo docker -H <hostname> run hello-world
    ```
@y
    ```console
    $ sudo docker -H <hostname> run hello-world
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@y
    このコマンドはテストイメージをダウンロードして、コンテナー内で実行します。
    コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
## Install server and client binaries on Windows
@y
{: #install-server-and-client-binaries-on-windows }
## Windows においてサーバーとクライアントのバイナリをインストール
@z

@x
> **Note**
>
> The following section describes how to install the Docker daemon on Windows
> Server which allows you to run Windows containers only. The binaries for
> Windows do not contain Docker components such as `buildx`, `docker scan`, and
> `docker compose`. If you are running Windows 10 or 11, we recommend that you
> install [Docker Desktop](../../desktop/index.md) instead.
@y
> **メモ**
>
> 以下に示す節では、Windows Server 上に Docker デーモンをインストールする方法を説明します。
> これは Windows コンテナーを動作させることしかできません。
> Windows 用のバイナリには、`buildx`、`docker scan`、`docker compose`といった Docker コンポーネントは含まれません。
> Windows 10 や 11 を利用している場合は、これの代わりに [Docker Desktop](../../desktop/index.md) をインストールすることをお勧めします。
@z

@x
Binary packages on Windows include both `dockerd.exe` and `docker.exe`. On Windows,
these binaries only provide the ability to run native Windows containers (not
Linux containers).
@y
Windows 用のバイナリパッケージには`dockerd.exe`と`docker.exe`の両方が含まれます。
Windows においてこのバイナリは、ネイティブな Windows コンテナー (つまり Linux コンテナーではない) だけを実行する機能を提供しています。
@z

@x
To install server and client binaries, perform the following steps:
@y
サーバーとクライアントのバイナリをインストールするには、以下の手順を行います。
@z

@x
1. Download the static binary archive. Go to
    [https://download.docker.com/win/static/stable/x86_64](https://download.docker.com/win/static/stable/x86_64) and select the latest version from the list.
@y
1. スタティックバイナリのアーカイブをダウンロードします。
   [https://download.docker.com/win/static/stable/x86_64](https://download.docker.com/win/static/stable/x86_64) へ行って、一覧の中から最新版を選択します。
@z

@x
2. Run the following PowerShell commands to install and extract the archive to your program files:
@y
2. 以下の PowerShell コマンドを実行して、自マシンの program files にアーカイブを抽出、インストールします。
@z

@x
    ```powershell
    PS C:\> Expand-Archive /path/to/<FILE>.zip -DestinationPath $Env:ProgramFiles
    ```
@y
    ```powershell
    PS C:\> Expand-Archive /path/to/<FILE>.zip -DestinationPath $Env:ProgramFiles
    ```
@z

@x
3. Register the service and start the Docker Engine:
@y
3. サービス登録を行って Docker Engine を起動します。
@z

@x
    ```powershell
    PS C:\> &$Env:ProgramFiles\Docker\dockerd --register-service
    PS C:\> Start-Service docker
    ```
@y
    ```powershell
    PS C:\> &$Env:ProgramFiles\Docker\dockerd --register-service
    PS C:\> Start-Service docker
    ```
@z

@x
4.  Verify that Docker is installed correctly by running the `hello-world`
    image.
@y
4.  Docker が正しくインストールできたことを確認するため、`hello-world`イメージを実行します。
@z

@x
    ```powershell
    PS C:\> &$Env:ProgramFiles\Docker\docker run hello-world:nanoserver
    ```
@y
    ```powershell
    PS C:\> &$Env:ProgramFiles\Docker\docker run hello-world:nanoserver
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@y
    上のコマンドはテストイメージをダウンロードして、コンテナー内において実行します。
    コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
## Upgrade static binaries
@y
## スタティックバイナリのアップグレード
{: #upgrade-static-binaries }
@z

@x
To upgrade your manual installation of Docker Engine, first stop any
`dockerd` or `dockerd.exe`  processes running locally, then follow the
regular installation steps to install the new version on top of the existing
version.
@y
Docker Engine を手動によりインストールしていて、これをアップデートする場合は、まずローカルで起動させている`dockerd`あるいは`dockerd.exe`のプロセスをすべて終了させます。
そして通常の手順により新しいバージョンをインストールします。
@z

@x
## Next steps
@y
## 次のステップ
{: #next-steps }
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Take a look at the [Get started](../../get-started/index.md) training modules to learn  how to build an image and run it as a containerized application.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@y
- [Linux インストール後の作業](linux-postinstall.md) へ進む
- [Docker をはじめよう](../../get-started/index.md) に示すトレーニングを見てください。
  イメージのビルド方法や、イメージをコンテナー化アプリケーションとして起動する方法を学んでいきます。
- [Docker を用いた開発](../../develop/index.md) における各項目を参照してください。
  Docker を使ったアプリケーションの構築方法を学びます。
@z
