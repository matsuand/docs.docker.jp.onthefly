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
> **Note**: You may have been redirected to this page because there is no longer
> a dynamically-linked Docker package for your Linux distribution.
@y
{% comment %}
> **Note**: You may have been redirected to this page because there is no longer
> a dynamically-linked Docker package for your Linux distribution.
{% endcomment %}
> **メモ**: このページへはリダイレクトによりやってきたかもしれません。
> お使いの Linux ディストリビューションでは、ダイナミックリンクによる Docker パッケージが提供されていないためです。
@z

@x
If you want to try Docker or use it in a testing environment, but you're not on
a supported platform, you can try installing from static binaries. If possible,
you should use packages built for your operating system, and use your operating
system's package management system to manage Docker installation and upgrades.
Be aware that 32-bit static binary archives do not include the Docker daemon.
@y
{% comment %}
If you want to try Docker or use it in a testing environment, but you're not on
a supported platform, you can try installing from static binaries. If possible,
you should use packages built for your operating system, and use your operating
system's package management system to manage Docker installation and upgrades.
Be aware that 32-bit static binary archives do not include the Docker daemon.
{% endcomment %}
Docker を利用したい、あるいはテスト環境で使いたいと思っても、お使いのプラットフォームでは Docker がサポートされていません。
そんなときはスタティックリンクされたバイナリをインストールしてみてください。
可能であれば、お使いのオペレーティングシステム用にビルドされたパッケージを使い、オペレーティングシステムのパッケージ管理方法に基づいて Docker のインストールやアップグレードを行ってください。
なお 32 ビットのスタティックバイナリには、Docker デーモンが含まれていない点に注意してください。
@z

@x
Static binaries for the Docker daemon binary are only available for Linux (as
`dockerd`). 
Static binaries for the Docker client are available for Linux and macOS (as `docker`).
@y
{% comment %}
Static binaries for the Docker daemon binary are only available for Linux (as
`dockerd`). 
Static binaries for the Docker client are available for Linux and macOS (as `docker`).
{% endcomment %}
Docker デーモンに対するスタティックバイナリは、Linux でのみ利用可能です（`dockerd` として）。
Docker クライアントに対するスタティックバイナリは、Linux と macOS で利用可能です（`docker` として）。
@z

@x
This topic discusses binary installation for both Linux and macOS:
@y
{% comment %}
This topic discusses binary installation for both Linux and macOS:
{% endcomment %}
ここでは Linux と macOS におけるバイナリモジュールのインストール方法を説明します。
@z

@x
- [Install daemon and client binaries on Linux](#install-daemon-and-client-binaries-on-linux )
- [Install client binaries on macOS](#install-client-binaries-on-macos )
@y
{% comment %}
- [Install daemon and client binaries on Linux](#install-daemon-and-client-binaries-on-linux )
- [Install client binaries on macOS](#install-client-binaries-on-macos )
{% endcomment %}
- [Linux においてデーモンとクライアントのバイナリをインストール](#install-daemon-and-client-binaries-on-linux )
- [macOS においてクライアントのバイナリをインストール](#install-client-binaries-on-macos )
@z

@x
## Install daemon and client binaries on Linux
@y
{% comment %}
## Install daemon and client binaries on Linux
{% endcomment %}
## Linux においてデーモンとクライアントのバイナリをインストール
{: #install-daemon-and-client-binaries-on-linux }
@z

@x
### Prerequisites
@y
{% comment %}
### Prerequisites
{% endcomment %}
### 前提条件
{: #prerequisites }
@z

@x
Before attempting to install Docker from binaries, be sure your host machine
meets the prerequisites:
@y
{% comment %}
Before attempting to install Docker from binaries, be sure your host machine
meets the prerequisites:
{% endcomment %}
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
{% comment %}
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
{% endcomment %}
- 64 ビットシステム。
- Linux カーネルのバージョンは 3.10 またはそれ以上。
  利用するプラットフォームが提供する最新カーネルを用いることを推奨。
- `iptables` のバージョンは 1.4 またはそれ以上。
- `git` のバージョンは 1.7 またはそれ以上。
- `ps` 実行モジュールがあること。通常 `procps` あるいは類似パッケージが提供している。
- [XZ Utils](https://tukaani.org/xz/) のバージョンは 4.9 またはそれ以上。
- [`cgroupfs` 階層が適切にマウントされていること](
  https://github.com/tianon/cgroupfs-mount/blob/master/cgroupfs-mount)。
  単純にすべてを取りまとめた `cgroup` マウントポイントでは不十分です。
  Github の 以下の issue を参考にしてください。
  [#2683](https://github.com/moby/moby/issues/2683)、
  [#3485](https://github.com/moby/moby/issues/3485)、
  [#4568](https://github.com/moby/moby/issues/4568)
@z

@x
#### Secure your environment as much as possible
@y
{% comment %}
#### Secure your environment as much as possible
{% endcomment %}
#### できるだけセキュアな環境を
{: #secure-your-environment-as-much-as-possible }
@z

@x
##### OS considerations
@y
{% comment %}
##### OS considerations
{% endcomment %}
##### OS に関すること
{: #os-considerations }
@z

@x
Enable SELinux or AppArmor if possible.
@y
{% comment %}
Enable SELinux or AppArmor if possible.
{% endcomment %}
利用可能であれば SELinux や AppArmor を有効にしてください。
@z

@x
It is recommended to use AppArmor or SELinux if your Linux distribution supports
either of the two. This helps improve security and blocks certain
types of exploits. Review the documentation for your Linux distribution for
instructions for enabling and configuring AppArmor or SELinux.
@y
{% comment %}
It is recommended to use AppArmor or SELinux if your Linux distribution supports
either of the two. This helps improve security and blocks certain
types of exploits. Review the documentation for your Linux distribution for
instructions for enabling and configuring AppArmor or SELinux.
{% endcomment %}
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
{% comment %}
> Security Warning
>
> If either of the security mechanisms is enabled, do not disable it as a
> work-around to make Docker or its containers run. Instead, configure it
> correctly to fix any problems.
{:.warning}
{% endcomment %}
> セキュリティ警告
>
> このセキュリティ機能を有効にしていた場合には、Docker やコンテナーを動作させたいからというので、機能を無効にするのはお止めください。
> そのかわりに、正しく機能するように設定を適切に行ってください。
{:.warning}
@z

@x
##### Docker daemon considerations
@y
{% comment %}
##### Docker daemon considerations
{% endcomment %}
##### Docker デーモンに関すること
{: #docker-daemon-considerations }
@z

@x
- Enable `seccomp` security profiles if possible. See
  [Enabling `seccomp` for Docker](../security/seccomp.md).
@y
{% comment %}
- Enable `seccomp` security profiles if possible. See
  [Enabling `seccomp` for Docker](../security/seccomp.md).
{% endcomment %}
- 利用可能であれば、セキュリティプロファイル `seccomp` を有効にしてください。
  [Docker における `seccomp` の利用](../security/seccomp.md) を参照。
@z

@x
- Enable user namespaces if possible. See the
  [Daemon user namespace options](/engine/reference/commandline/dockerd/#daemon-user-namespace-options).
@y
{% comment %}
- Enable user namespaces if possible. See the
  [Daemon user namespace options](/engine/reference/commandline/dockerd/#daemon-user-namespace-options).
{% endcomment %}
- 利用可能であればユーザー名前空間を有効にしてください。
  [デーモンのユーザー名前空間に関するオプション]({{ site.baseur }}/engine/reference/commandline/#daemon-user-namespace-options) を参照。
@z

@x
### Install static binaries
@y
{% comment %}
### Install static binaries
{% endcomment %}
### スタティックバイナリのインストール
{: #install-static-binaries }
@z

@x
1.  Download the static binary archive. Go to
    [https://download.docker.com/linux/static/stable/](https://download.docker.com/linux/static/stable/)
    (or change `stable` to `nightly` or `test`),
    choose your hardware platform, and download the `.tgz` file relating to the
    version of Docker Engine you want to install.
@y
{% comment %}
1.  Download the static binary archive. Go to
    [https://download.docker.com/linux/static/stable/](https://download.docker.com/linux/static/stable/)
    (or change `stable` to `nightly` or `test`),
    choose your hardware platform, and download the `.tgz` file relating to the
    version of Docker Engine you want to install.
{% endcomment %}
1.  スタティックバイナリのアーカイブをダウンロードします。
    [https://download.docker.com/linux/static/stable/](https://download.docker.com/linux/static/stable/) へ行き、対応するハードウェアプラットフォーム向けのものを選びます。
    （`stable` の部分は必要に応じて `nightly` や `test` とします。）
    必要としている Docker Engine のバージョンに対応づいた `.tgz` ファイルをダウンロードします。
@z

@x
2.  Extract the archive using the `tar` utility. The `dockerd` and `docker`
    binaries are extracted.
@y
{% comment %}
2.  Extract the archive using the `tar` utility. The `dockerd` and `docker`
    binaries are extracted.
{% endcomment %}
2.  `tar` ユーティリティーを使ってアーカイブを展開します。
    バイナリ `dockerd` と `docker` が抽出されます。
@z

@x
    ```bash
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@y
    ```bash
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@z

@x
3.  **Optional**: Move the binaries to a directory on your executable path, such
    as `/usr/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
@y
{% comment %}
3.  **Optional**: Move the binaries to a directory on your executable path, such
    as `/usr/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
{% endcomment %}
3.  **任意の作業**: 上のバイナリを実行パスの通ったディレクトリ、たとえば `/usr/bin/` などに移動させます。
    この作業を行わない場合、`docker` や `dockerd` コマンドを起動する際には、常に実行ファイルへのパスも指定する必要があります。
@z

@x
    ```bash
    $ sudo cp docker/* /usr/bin/
    ```
@y
    ```bash
    $ sudo cp docker/* /usr/bin/
    ```
@z

@x
4.  Start the Docker daemon:
@y
{% comment %}
4.  Start the Docker daemon:
{% endcomment %}
4.  Docker デーモンを起動します。
@z

@x
    ```bash
    $ sudo dockerd &
    ```
@y
    ```bash
    $ sudo dockerd &
    ```
@z

@x
    If you need to start the daemon with additional options, modify the above
    command accordingly or create and edit the file `/etc/docker/daemon.json`
    to add the custom configuration options.
@y
    {% comment %}
    If you need to start the daemon with additional options, modify the above
    command accordingly or create and edit the file `/etc/docker/daemon.json`
    to add the custom configuration options.
    {% endcomment %}
    デーモンに追加のオプションをつけて実行する必要がある場合は、上記のコマンドそれぞれを修正するか、あるいは設定ファイル `/etc/docker/daemon.json` を生成編集します。そこに必要な設定オプションを追加します。
@z

@x
5.  Verify that Docker is installed correctly by running the `hello-world`
    image.
@y
{% comment %}
5.  Verify that Docker is installed correctly by running the `hello-world`
    image.
{% endcomment %}
5.  Docker が正しくインストールされたことを確認するために `hello-world` イメージを実行します。
@z

@x
    ```bash
    $ sudo docker run hello-world
    ```
@y
    ```bash
    $ sudo docker run hello-world
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints an informational message and exits.
@y
    {% comment %}
    This command downloads a test image and runs it in a container. When the
    container runs, it prints an informational message and exits.
    {% endcomment %}
    このコマンドはテストイメージをダウンロードして、コンテナー内で実行します。
    コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
## Install client binaries on macOS
@y
{% comment %}
## Install client binaries on macOS
{% endcomment %}
## macOS においてクライアントのバイナリをインストール
{: #install-client-binaries-on-macos }
@z

@x
The macOS binary includes the Docker client only. It does not include the
`dockerd` daemon.
@y
{% comment %}
The macOS binary includes the Docker client only. It does not include the
`dockerd` daemon.
{% endcomment %}
macOS のバイナリには Docker クライアントのみが提供されます。
つまり `dockerd` デーモンは含まれていません。
@z

@x
1.  Download the static binary archive. Go to
    [https://download.docker.com/mac/static/stable/x86_64/](https://download.docker.com/mac/static/stable/x86_64/),
    (or change `stable` to `nightly` or `test`),
    and download the `.tgz` file relating to the version of Docker Engine you want
    to install.
@y
{% comment %}
1.  Download the static binary archive. Go to
    [https://download.docker.com/mac/static/stable/x86_64/](https://download.docker.com/mac/static/stable/x86_64/),
    (or change `stable` to `nightly` or `test`),
    and download the `.tgz` file relating to the version of Docker Engine you want
    to install.
{% endcomment %}
1.  スタティックバイナリのアーカイブをダウンロードします。
    [https://download.docker.com/mac/static/stable/x86_64/](https://download.docker.com/mac/static/stable/x86_64/) へ行きます。
    （`stable` の部分は必要に応じて `nightly` や `test` とします。）
    必要としている Docker Engine のバージョンに対応づいた `.tgz` ファイルをダウンロードします。
@z

@x
2.  Extract the archive using the `tar` utility. The `docker` binary is
    extracted.
@y
{% comment %}
2.  Extract the archive using the `tar` utility. The `docker` binary is
    extracted.
{% endcomment %}
2.  `tar` ユーティリティーを使ってアーカイブを展開します。
    バイナリ `docker` が抽出されます。
@z

@x
    ```bash
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@y
    ```bash
    $ tar xzvf /path/to/<FILE>.tar.gz
    ```
@z

@x
3.  **Optional**: Move the binary to a directory on your executable path, such
    as `/usr/local/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
@y
{% comment %}
3.  **Optional**: Move the binary to a directory on your executable path, such
    as `/usr/local/bin/`. If you skip this step, you must provide the path to the
    executable when you invoke `docker` or `dockerd` commands.
{% endcomment %}
3.  **任意の作業**: 上のバイナリを実行パスの通ったディレクトリ、たとえば `/usr/local/bin/` などに移動させます。
    この作業を行わない場合、`docker` や `dockerd` コマンドを起動する際には、常に実行ファイルへのパスも指定する必要があります。
@z

@x
    ```bash
    $ sudo cp docker/docker /usr/local/bin/
    ```
@y
    ```bash
    $ sudo cp docker/docker /usr/local/bin/
    ```
@z

@x
4.  Verify that Docker is installed correctly by running the `hello-world`
    image. The value of `<hostname>` is a hostname or IP address running the
    Docker daemon and accessible to the client.
@y
{% comment %}
4.  Verify that Docker is installed correctly by running the `hello-world`
    image. The value of `<hostname>` is a hostname or IP address running the
    Docker daemon and accessible to the client.
{% endcomment %}
4.  Docker が正しくインストールされたことを確認するために `hello-world` イメージを実行します。
    `<hostname>` にはホスト名かその IP アドレスを指定します。
    このホストは Docker デーモンが起動しているマシンのことであり、クライアントからアクセス可能であるものです。
@z

@x
    ```bash
    $ sudo docker -H <hostname> run hello-world
    ```
@y
    ```bash
    $ sudo docker -H <hostname> run hello-world
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints an informational message and exits.
@y
    {% comment %}
    This command downloads a test image and runs it in a container. When the
    container runs, it prints an informational message and exits.
    {% endcomment %}
    このコマンドはテストイメージをダウンロードして、コンテナー内で実行します。
    コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
## Upgrade static binaries
@y
{% comment %}
## Upgrade static binaries
{% endcomment %}
## スタティックバイナリのアップグレード
{: #upgrade-static-binaries }
@z

@x
To upgrade your manual installation of Docker Engine, first stop any
`dockerd` or `dockerd.exe`  processes running locally, then follow the
regular installation steps to install the new version on top of the existing
version.
@y
{% comment %}
To upgrade your manual installation of Docker Engine, first stop any
`dockerd` or `dockerd.exe`  processes running locally, then follow the
regular installation steps to install the new version on top of the existing
version.
{% endcomment %}
Docker Engine を手動によりインストールしていて、これをアップデートする場合は、まずローカルで起動させている `dockerd` あるいは `dockerd.exe` のプロセスをすべて終了させます。
そして通常の手順により新しいバージョンをインストールします。
@z

@x
## Next steps
@y
{% comment %}
## Next steps
{% endcomment %}
## 次のステップ
{: #next-steps }
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Take a look at the [Get started](../../get-started/index.md) training modules to learn  how to build an image and run it as a containerized application.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@y
{% comment %}
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Take a look at the [Get started](../../get-started/index.md) training modules to learn  how to build an image and run it as a containerized application.
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
{% endcomment %}
- [Linux インストール後の作業](linux-postinstall.md) へ進む
- [Docker をはじめよう](../../get-started/index.md) に示すトレーニングを見てください。
  イメージのビルド方法や、イメージをコンテナー化アプリケーションとして起動する方法を学んでいきます。
- [Docker を用いた開発](../../develop/index.md) における各項目を参照してください。
  Docker を使ったアプリケーションの構築方法を学びます。
@z
