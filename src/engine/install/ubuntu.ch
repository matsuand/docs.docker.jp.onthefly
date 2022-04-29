%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Instructions for installing Docker Engine on Ubuntu
keywords: requirements, apt, installation, ubuntu, install, uninstall, upgrade, update
redirect_from:
- /ee/docker-ee/ubuntu/
- /engine/installation/linux/docker-ce/ubuntu/
- /engine/installation/linux/docker-ee/ubuntu/
- /engine/installation/linux/ubuntu/
- /engine/installation/linux/ubuntulinux/
- /engine/installation/ubuntulinux/
- /install/linux/docker-ce/ubuntu/
- /install/linux/docker-ee/ubuntu/
- /install/linux/ubuntu/
- /installation/ubuntulinux/
title: Install Docker Engine on Ubuntu
toc_max: 4
---
@y
---
description: Ubuntu 上に Docker Engine をインストールする手順を説明。
keywords: requirements, apt, installation, ubuntu, install, uninstall, upgrade, update
redirect_from:
- /ee/docker-ee/ubuntu/
- /engine/installation/linux/docker-ce/ubuntu/
- /engine/installation/linux/docker-ee/ubuntu/
- /engine/installation/linux/ubuntu/
- /engine/installation/linux/ubuntulinux/
- /engine/installation/ubuntulinux/
- /engine/installation/linux/ubuntu/
- /install/linux/docker-ee/ubuntu/
- /install/linux/ubuntu/
- /installation/ubuntulinux/
title: Docker Engine インストール（Ubuntu 向け）
toc_max: 4
---
@z

@x
> **Docker Desktop for Linux**
>
> Docker Desktop helps you build, share, and run containers easily on Mac and
> Windows as you do on Linux. We are excited to share that Docker Desktop for
> Linux (Beta) is now available for you to test. For more information, see
[Docker Desktop for Linux](../../desktop/linux/index.md).
{: .important}
@y
> **Docker Desktop for Linux**
>
> Docker Desktop は Mac や Windows 上と同じように Linux 上でも、コンテナーのビルド、共有、実行を可能にします。
> Docker Desktop for Linux（ベータ版）が入手できるようになり、テストが可能となりました。
> 詳しくは [Docker Desktop for Linux](../../desktop/linux/index.md) を参照してください。
{: .important}
@z

@x
To get started with Docker Engine on Ubuntu, make sure you
[meet the prerequisites](#prerequisites), then
[install Docker](#installation-methods).
@y
Ubuntu 向けに Docker Engine を始めるには、[前提条件を満たしているか](#prerequisites) を確認してから、[インストール手順](#installation-methods) に進んでください。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
### OS requirements
@y
{: #os-requirements }
### OS 要件
@z

@x
To install Docker Engine, you need the 64-bit version of one of these Ubuntu
versions:
@y
Docker Engine をインストールするには、以下に示す Ubuntu の 64 ビットバージョンのいずれかが必要です。
@z

@x
- Ubuntu Impish 21.10
- Ubuntu Hirsute 21.04
- Ubuntu Focal 20.04 (LTS)
- Ubuntu Bionic 18.04 (LTS)
@y
- Ubuntu Impish 21.10
- Ubuntu Hirsute 21.04
- Ubuntu Focal 20.04 (LTS)
- Ubuntu Bionic 18.04 (LTS)
@z

@x
Docker Engine is supported on `x86_64` (or `amd64`), `armhf`, `arm64`, and `s390x` architectures.
@y
Docker Engine は`x86_64`（または`amd64`）、`armhf`、`arm64`、`s390x`の各アーキテクチャーをサポートします。
@z

@x
> Ubuntu 16.04 LTS "Xenial Xerus" end-of-life
> 
> Ubuntu Linux 16.04 LTS reached the end of its five-year LTS window on April
> 30th 2021 and is no longer supported. Docker no longer releases packages for
> this distribution (including patch- and security releases). Users running
> Docker on Ubuntu 16.04 are recommended to update their system to a currently
> supported LTS version of Ubuntu.
{: .important }
@y
> Ubuntu 16.04 LTS "Xenial Xerus" の終了
> 
> Ubuntu Linux 16.04 LTS は、2021年4月30日に、5年におよぶ LTS Window の期限になりました。
> 今後はサポートされません。
> Docker も今後、このディストリビューションに対するパッケージをリリースしません。
> (パッチリリース、セキュリティリリースも行いません。)
> Ubuntu 16.04 上において Docker を利用しているユーザーは、Ubuntu の現時点でサポートされている LTS バージョンへのアップデートをお勧めします。
{: .important }
@z

@x
### Uninstall old versions
@y
{: #uninstall-old-versions }
### 古いバージョンのアンインストール
@z

@x
Older versions of Docker were called `docker`, `docker.io`, or `docker-engine`.
If these are installed, uninstall them:
@y
Docker のかつてのバージョンは、`docker`、`docker.io`、`docker-engine`と呼ばれていました。
これがインストールされている場合はアンインストールしてください。
@z

@x
```console
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```
@y
```console
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```
@z

@x
It's OK if `apt-get` reports that none of these packages are installed.
@y
`apt-get`を実行したときに、上のパッケージがインストールされていないと表示されれば OK です。
@z

@x
The contents of `/var/lib/docker/`, including images, containers, volumes, and
networks, are preserved. If you do not need to save your existing data, and want to
start with a clean installation, refer to the [uninstall Docker Engine](#uninstall-docker-engine)
section at the bottom of this page.
@y
`/var/lib/docker/`にはイメージ、コンテナー、ボリューム、ネットワークが含まれていて、それは保持されたまま残ります。
既存データを保存する必要がなく、クリーンインストールから始めたい場合は、本ページの後段にある [Docker Engine のアンインストール](#uninstall-docker-engine) を参照してください。
@z

@x
### Supported storage drivers
@y
{: #supported-storage-drivers }
### サポートするストレージドライバー
@z

@x
Docker Engine on Ubuntu supports `overlay2`, `aufs` and `btrfs` storage drivers.
@y
Ubuntu 向けの Docker Engine では`overlay2`、`aufs`、`btrfs`の各ストレージドライバーをサポートします。
@z

@x
Docker Engine uses the `overlay2` storage driver by default. If you need to use
`aufs` instead, you need to configure it manually.
See [use the AUFS storage driver](../../storage/storagedriver/aufs-driver.md)
@y
Docker Engine はデフォルトで`overlay2`ストレージドライバーを採用しています。
`aufs`を利用する必要がある場合は、手動で設定しなければなりません。
[aufs](../../storage/storagedriver/aufs-driver.md) を参照してください。
@z

@x
## Installation methods
@y
{: #installation-methods }
## インストール手順
@z

@x
You can install Docker Engine in different ways, depending on your needs:
@y
Docker Engine のインストール方法はいくつかあります。
必要に応じて選んでください。
@z

@x
- Most users
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach.
@y
- たいていのユーザーは [Docker のリポジトリをセットアップ](#install-using-the-repository)して、そこからインストールしています。
  インストールやアップグレードの作業が簡単だからです。
  この方法をお勧めします。
@z

@x
- Some users download the DEB package and
  [install it manually](#install-from-a-package) and manage
  upgrades completely manually. This is useful in situations such as installing
  Docker on air-gapped systems with no access to the internet.
@y
- ユーザーの中には RPM パッケージをダウンロードし、[手動でインストール](#install-from-a-package)している方もいます。
  アップグレードも完全に手動となります。
  この方法は、インターネットにアクセスできない環境で Docker をインストールするような場合には有用です。
@z

@x
- In testing and development environments, some users choose to use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
@y
- テスト環境や開発環境向けに、自動化された[便利なスクリプト](#install-using-the-convenience-script)を使って
  Docker のインストールを行うユーザーもいます。
@z

@x
### Install using the repository
@y
{: #install-using-the-repository }
### リポジトリを利用したインストール
@z

@x
Before you install Docker Engine for the first time on a new host machine, you need
to set up the Docker repository. Afterward, you can install and update Docker
from the repository.
@y
新しいホストマシンに Docker Engine を初めてインストールするときは、その前に Docker リポジトリをセットアップしておくことが必要です。
これを行った後に、リポジトリからの Docker のインストールやアップグレードができるようになります。
@z

@x
#### Set up the repository
@y
{: #set-up-the-repository }
#### リポジトリのセットアップ
@z

@x
{% assign download-url-base = "https://download.docker.com/linux/ubuntu" %}
@y
{% assign download-url-base = "https://download.docker.com/linux/ubuntu" %}
@z

@x
1.  Update the `apt` package index and install packages to allow `apt` to use a
    repository over HTTPS:
@y
1.  `apt`のパッケージインデックスを更新します。
    そして`apt`が HTTPS 経由でリポジトリにアクセスしパッケージをインストールできるようにします。
@z

@x
    ```console
    $ sudo apt-get update

    $ sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    ```
@y
    ```console
    $ sudo apt-get update

    $ sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    ```
@z

@x
2.  Add Docker's official GPG key:
@y
2. Docker の公式 GPG 鍵を追加します。
@z

@x
    ```console
    $ curl -fsSL {{ download-url-base }}/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    ```
@y
    ```console
    $ curl -fsSL {{ download-url-base }}/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    ```
@z

@x
3.  Use the following command to set up the **stable** repository. To add the
    **nightly** or **test** repository, add the word `nightly` or `test` (or both)
    after the word `stable` in the commands below. [Learn about **nightly** and **test** channels](index.md).
@y
3.  以下のコマンドを使って**安定版**（stable）リポジトリをセットアップします。
    **最新版**（nightly）、**テスト版**（test）の各リポジトリを追加する場合は、以下のコマンドにおける`stable`の文字に続けて`nightly`や`test`の文字を加えてください。
    [**最新版**と**テスト版**チャンネルを学ぶにはこちら](index.md)。
@z

@x
    ```console
    $ echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] {{ download-url-base }} \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```
@y
    ```console
    $ echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] {{ download-url-base }} \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```
@z

@x
#### Install Docker Engine
@y
{: #install-docker-engine }
#### Docker Engine のインストール
@z

@x
1. Update the `apt` package index, and install the _latest version_ of Docker
   Engine, containerd, and Docker Compose, or go to the next step to install a specific version:
@y
1.  `apt`のパッケージインデックスを更新します。
    そして Docker Engine、containerd、Docker Compose の最新版をインストールします。
    あるいは次の手順に行って、特定のバージョンをインストールします。
@z

@x
    ```console
    $ sudo apt-get update
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    ```
@y
    ```console
    $ sudo apt-get update
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    ```
@z

@x
    > Got multiple Docker repositories?
    >
    > If you have multiple Docker repositories enabled, installing
    > or updating without specifying a version in the `apt-get install` or
    > `apt-get update` command always installs the highest possible version,
    > which may not be appropriate for your stability needs.
@y
    > 複数リポジトリからの取得？
    >
    > Docker リポジトリを複数有効にしていて、バージョン指定をせずに`apt-get install`
    > によるインストール、または`apt-get update`によるアップデートを行うと、入手可能な最新版がインストールされます。
    > 安定した版が必要である場合には、適切でない場合があります。
@z

@x
2.  To install a _specific version_ of Docker Engine, list the available versions
    in the repo, then select and install:
@y
2.  特定バージョンの Docker Engine をインストールする場合は、リポジトリにある利用可能なバージョンの一覧を確認し、いずれかを選んでインストールします。
@z

@x
    a. List the versions available in your repo:
@y
    a. リポジトリ内にある利用可能なバージョンを一覧表示します。
@z

@x
    ```console
    $ apt-cache madison docker-ce
@y
    ```console
    $ apt-cache madison docker-ce
@z

@x
      docker-ce | 5:18.09.1~3-0~ubuntu-xenial | {{ download-url-base }}  xenial/stable amd64 Packages
      docker-ce | 5:18.09.0~3-0~ubuntu-xenial | {{ download-url-base }}  xenial/stable amd64 Packages
      docker-ce | 18.06.1~ce~3-0~ubuntu       | {{ download-url-base }}  xenial/stable amd64 Packages
      docker-ce | 18.06.0~ce~3-0~ubuntu       | {{ download-url-base }}  xenial/stable amd64 Packages
    ```
@y
      docker-ce | 5:18.09.1~3-0~ubuntu-xenial | {{ download-url-base }}  xenial/stable amd64 Packages
      docker-ce | 5:18.09.0~3-0~ubuntu-xenial | {{ download-url-base }}  xenial/stable amd64 Packages
      docker-ce | 18.06.1~ce~3-0~ubuntu       | {{ download-url-base }}  xenial/stable amd64 Packages
      docker-ce | 18.06.0~ce~3-0~ubuntu       | {{ download-url-base }}  xenial/stable amd64 Packages
    ```
@z

@x
    b. Install a specific version using the version string from the second column,
       for example, `5:18.09.1~3-0~ubuntu-xenial`.
@y
    b. 特定のバージョンをインストールする場合は、2 項目めにあるバージョン文字列を使ってインストールします。
       たとえば`5:18.09.1~3-0~ubuntu-xenial`となります。
@z

@x
    ```console
    $ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin
    ```
@y
    ```console
    $ sudo apt-get install docker-ce=<バージョン文字列> docker-ce-cli=<バージョン文字列> containerd.io docker-compose-plugin
    ```
@z

@x
3.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
4.  Docker Engine が正しくインストールされているのを確認するため、`hello-world`イメージを実行します。
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
    このコマンドはテスト用イメージをダウンロードし、コンテナー内で実行します。
    コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
Docker Engine is installed and running. The `docker` group is created but no users
are added to it. You need to use `sudo` to run Docker commands.
Continue to [Linux postinstall](linux-postinstall.md) to allow non-privileged
users to run Docker commands and for other optional configuration steps.
@y
Docker Engine がインストールされ、実行できました。
グループ`docker`が生成されていますが、このグループにはまだユーザーが存在していない状態です。
Docker コマンドの実行には`sudo`が必要になります。
続いて [Linux のインストール後](linux-postinstall.md)に進み、非特権ユーザーでも Docker コマンドが実行できるように、またその他の追加の設定について見ていきます。
@z

@x
#### Upgrade Docker Engine
@y
{: #upgrade-docker-engine }
#### Docker Engine のアップグレード
@z

@x
To upgrade Docker Engine, first run `sudo apt-get update`, then follow the
[installation instructions](#install-using-the-repository), choosing the new
version you want to install.
@y
Docker Engine をアップグレードするには、まず`sudo apt-get update`を実行します。
そして[インストール手順](#install-using-the-repository) に従って、インストールしたい新たなバージョンを選んでください。
@z

@x
### Install from a package
@y
### パッケージからのインストール
{: #install-from-a-package }
@z

@x
If you cannot use Docker's repository to install Docker Engine, you can download the
`.deb` file for your release and install it manually. You need to download
a new file each time you want to upgrade Docker.
@y
Docker リポジトリを利用した Docker Engine のインストールができない場合は、目的とするリリースの`.deb`ファイルをダウンロードして、手動でインストールする方法があります。
この場合 Docker をアップグレードするには、毎回新たな`.deb`ファイルをダウンロードして利用することになります
@z

@x
1.  Go to [`{{ download-url-base }}/dists/`]({{ download-url-base }}/dists/){: target="_blank" rel="noopener" class="_" },
    choose your Ubuntu version, then browse to `pool/stable/`, choose `amd64`,
    `armhf`, `arm64`, or `s390x`, and download the `.deb` file for the Docker Engine
    version you want to install.
@y
1.  [{{ download-url-base }}/dists/]({{ download-url-base }}/dists/){: target="_blank" rel="noopener" class="_" }
    にアクセスして、インストールしたい Ubuntu バージョンを選びます。
    そして`pool/stable/`にアクセスし、`amd64`、`armhf`、`arm64`、`s390x`のいずれかを選び、インストールしたいバージョンの Docker Engine に対応する`.deb`ファイルをダウンロードします。
@z

@x
    > **Note**
    >
    > To install a **nightly** or **test** (pre-release) package,
    > change the word `stable` in the above URL to `nightly` or `test`.
    > [Learn about **nightly** and **test** channels](index.md).
@y
    > **メモ**
    >
    > **最新版**（nightly）や **テスト版**（test）パッケージをインストールする場合は、
    > URL 内の`stable`を`nightly`や`test`に変更してください。
    > [**最新版** と **テスト版** チャンネルを学ぶにはこちら](index.md)。
@z

@x
2.  Install Docker Engine, changing the path below to the path where you downloaded
    the Docker package.
@y
2.  Docker Engine をインストールします。
    以下に示すパス部分は、Docker パッケージをダウンロードしたパスに書き換えます。
@z

@x
    ```console
    $ sudo dpkg -i /path/to/package.deb
    ```
@y
    ```console
    $ sudo dpkg -i /path/to/package.deb
    ```
@z

@x
    The Docker daemon starts automatically.
@y
    Docker デーモンは自動的に起動します。
@z

@x
3.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
3.  Docker Engine が正しくインストールされているのを確認するため`hello-world`イメージを実行します。
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
    このコマンドはテスト用イメージをダウンロードし、コンテナー内で実行します。
    コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
Docker Engine is installed and running. The `docker` group is created but no users
are added to it. You need to use `sudo` to run Docker commands.
Continue to [Post-installation steps for Linux](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@y
Docker Engine がインストールされ、実行できました。
グループ`docker`が生成されていますが、このグループにはまだユーザーが存在していない状態です。
Docker コマンドの実行には`sudo`が必要になります。
続いて [Linux のインストール後](linux-postinstall.md)に進み、非特権ユーザーでも Docker コマンドが実行できるように、またその他の追加の設定について見ていきます。
@z

@x
#### Upgrade Docker Engine
@y
{: #upgrade-docker-engine }
#### Docker Engine のアップグレード
@z

@x
To upgrade Docker Engine, download the newer package file and repeat the
[installation procedure](#install-from-a-package), pointing to the new file.
@y
Docker Engine をアップグレードするには、[インストール手順](#install-from-a-package) に従って、インストールしたい新たなバージョンを選んでください。
@z

@x
{% include install-script.md %}
@y
{% include install-script.md %}
@z

@x
## Uninstall Docker Engine
@y
{: #uninstall-docker-engine }
## Docker Engine のアンインストール
@z

@x
1.  Uninstall the Docker Engine, CLI, Containerd, and Docker Compose packages:
@y
1.  Docker Engine、CLI、Containerd、Docker Compose パッケージをアンインストールします。
@z

@x
    ```console
    $ sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
    ```
@y
    ```console
    $ sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
    ```
@z

@x
2.  Images, containers, volumes, or customized configuration files on your host
    are not automatically removed. To delete all images, containers, and
    volumes:
@y
2.  ホスト上のイメージ、コンテナー、ボリューム、カスタマイズした設定ファイルは自動的に削除されません。
    イメージ、コンテナー、ボリュームをすべて削除するには、以下を実行します。
@z

@x
    ```console
    $ sudo rm -rf /var/lib/docker
    $ sudo rm -rf /var/lib/containerd
    ```
@y
    ```console
    $ sudo rm -rf /var/lib/docker
    $ sudo rm -rf /var/lib/containerd
    ```
@z

@x
You must delete any edited configuration files manually.
@y
編集した設定ファイルはすべて手動で削除する必要があります。
@z

@x
## Next steps
@y
## 次のステップ
{: #next-steps }
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@y
- [Linux のインストール後](linux-postinstall.md) へ進む
- [Docker を用いた開発](../../develop/index.md) における各項目を参照してください。
  Docker を使ったアプリケーションの構築方法を学びます。
@z
