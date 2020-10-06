%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Instructions for installing Docker Engine on Debian
keywords: requirements, apt, installation, debian, install, uninstall, upgrade, update
redirect_from:
- /engine/installation/debian/
- /engine/installation/linux/raspbian/
- /engine/installation/linux/debian/
- /engine/installation/linux/docker-ce/debian/
- /install/linux/docker-ce/debian/
title: Install Docker Engine on Debian
toc_max: 4
---
@y
---
description: Debian 上に Docker Engine をインストールする手順を説明。
keywords: requirements, apt, installation, debian, install, uninstall, upgrade, update
redirect_from:
- /engine/installation/debian/
- /engine/installation/linux/raspbian/
- /engine/installation/linux/debian/
- /engine/installation/linux/docker-ce/debian/
- /install/linux/docker-ce/debian/
title: Docker Engine インストール（Debian 向け）
toc_max: 4
---
@z

@x
To get started with Docker Engine on Debian, make sure you
[meet the prerequisites](#prerequisites), then
[install Docker](#installation-methods).
@y
{% comment %}
To get started with Docker Engine on Debian, make sure you
[meet the prerequisites](#prerequisites), then
[install Docker](#installation-methods).
{% endcomment %}
Debian 向けに Docker Engine を始めるには、[前提条件を満たしているか](#prerequisites)を確認してから、[インストール手順](#installation-methods) に進んでください。
@z

@x
## Prerequisites
@y
{% comment %}
## Prerequisites
{% endcomment %}
{: #prerequisites }
## 前提条件
@z

@x
### OS requirements
@y
{% comment %}
### OS requirements
{% endcomment %}
{: #os-requirements }
### OS 要件
@z

@x
To install Docker Engine, you need the 64-bit version of one of these Debian or
Raspbian versions:
@y
{% comment %}
To install Docker Engine, you need the 64-bit version of one of these Debian or
Raspbian versions:
{% endcomment %}
Docker Engine をインストールするには、Debian か Raspbian の 64 ビットバージョンが必要です。
@z

@x
- Debian Buster 10 (stable)
- Debian Stretch 9 / Raspbian Stretch
@y
- Debian Buster 10 (安定版)
- Debian Stretch 9 / Raspbian Stretch
@z

@x
Docker Engine is supported on `x86_64` (or `amd64`), `armhf`, and `arm64` architectures.
@y
{% comment %}
Docker Engine is supported on `x86_64` (or `amd64`), `armhf`, and `arm64` architectures.
{% endcomment %}
Docker Engine は `x86_64`（または `amd64`）、`armhf`、`arm64` の各アーキテクチャーをサポートします。
@z

@x
### Uninstall old versions
@y
{% comment %}
### Uninstall old versions
{% endcomment %}
{: #uninstall-old-versions }
### 古いバージョンのアンインストール
@z

@x
Older versions of Docker were called `docker`, `docker.io`, or `docker-engine`.
If these are installed, uninstall them:
@y
{% comment %}
Older versions of Docker were called `docker`, `docker.io`, or `docker-engine`.
If these are installed, uninstall them:
{% endcomment %}
Docker のかつてのバージョンは、`docker`、`docker.io`、`docker-engine` と呼ばれていました。
これがインストールされている場合はアンインストールしてください。
@z

@x
```bash
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```
@y
```bash
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```
@z

@x
It's OK if `apt-get` reports that none of these packages are installed.
@y
{% comment %}
It's OK if `apt-get` reports that none of these packages are installed.
{% endcomment %}
`apt-get` を実行したときに、上のパッケージがインストールされていないと表示されれば OK です。
@z

@x
The contents of `/var/lib/docker/`, including images, containers, volumes, and
networks, are preserved. The Docker Engine package is now called `docker-ce`.
@y
{% comment %}
The contents of `/var/lib/docker/`, including images, containers, volumes, and
networks, are preserved. The Docker Engine package is now called `docker-ce`.
{% endcomment %}
`/var/lib/docker/` にはイメージ、コンテナー、ボリューム、ネットワークが含まれていて、それは保持されたまま残ります。
なお Docker Engine パッケージは、今は `docker-ce` と呼ばれます。
@z

@x
## Installation methods
@y
{% comment %}
## Installation methods
{% endcomment %}
{: #installation-methods }
## インストール手順
@z

@x
You can install Docker Engine in different ways, depending on your needs:
@y
{% comment %}
You can install Docker Engine in different ways, depending on your needs:
{% endcomment %}
Docker Engine のインストール方法はいくつかあります。
必要に応じて選んでください。
@z

@x
- Most users
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach, except for Raspbian.
@y
{% comment %}
- Most users
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach, except for Raspbian.
{% endcomment %}
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
{% comment %}
- Some users download the DEB package and
  [install it manually](#install-from-a-package) and manage
  upgrades completely manually. This is useful in situations such as installing
  Docker on air-gapped systems with no access to the internet.
{% endcomment %}
- ユーザーの中には DEB パッケージをダウンロードし、[手動でインストール](#install-from-a-package)している方もいます。
  アップグレードも完全に手動となります。
  この方法は、インターネットにアクセスできない環境で Docker をインストールするような場合には有用です。
@z

@x
- In testing and development environments, some users choose to use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
  This is currently the only approach for Raspbian.
@y
{% comment %}
- In testing and development environments, some users choose to use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
  This is currently the only approach for Raspbian.
{% endcomment %}
- テスト環境や開発環境向けに、自動化された[便利なスクリプト](#install-using-the-convenience-script)を使って
  Docker のインストールを行うユーザーもいます。
  これを対象としているのは、現在 Raspbian のみです。
@z

@x
### Install using the repository
@y
{% comment %}
### Install using the repository
{% endcomment %}
{: #install-using-the-repository }
### リポジトリを利用したインストール
@z

@x
Before you install Docker Engine for the first time on a new host machine, you need
to set up the Docker repository. Afterward, you can install and update Docker
from the repository.
@y
{% comment %}
Before you install Docker Engine for the first time on a new host machine, you need
to set up the Docker repository. Afterward, you can install and update Docker
from the repository.
{% endcomment %}
新しいホストマシンに Docker Engine を初めてインストールするときは、その前に Docker リポジトリをセットアップしておくことが必要です。
これを行った後に、リポジトリからの Docker のインストールやアップグレードができるようになります。
@z

@x
> **Raspbian users cannot use this method!**
>
> For Raspbian, installing using the repository is not yet supported. You must
> instead use the [convenience script](#install-using-the-convenience-script).
@y
{% comment %}
> **Raspbian users cannot use this method!**
>
> For Raspbian, installing using the repository is not yet supported. You must
> instead use the [convenience script](#install-using-the-convenience-script).
{% endcomment %}
> **Raspbian ユーザーはこの方法を使えません！**
>
> Raspbian において、リポジトリからインストールする方法はサポートされていません。
> かわりに [convenience script](./#install-using-the-convenience-script) を使うことになります。
@z

@x
#### Set up the repository
@y
{% comment %}
#### Set up the repository
{% endcomment %}
{: #set-up-the-repository }
#### リポジトリのセットアップ
@z

@x
{% assign download-url-base = "https://download.docker.com/linux/debian" %}
@y
{% assign download-url-base = "https://download.docker.com/linux/debian" %}
@z

@x
1.  Update the `apt` package index and install packages to allow `apt` to use a
    repository over HTTPS:
@y
{% comment %}
1.  Update the `apt` package index:
{% endcomment %}
1.  `apt` のパッケージインデックスを更新します。
    そして `apt` が HTTPS 経由でリポジトリにアクセスしパッケージをインストールできるようにします。
@z

@x
    ```bash
    $ sudo apt-get update

    $ sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    ```
@y
    ```bash
    $ sudo apt-get update

    $ sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    ```
@z

@x
2.  Add Docker's official GPG key:
@y
{% comment %}
2.  Add Docker's official GPG key:
{% endcomment %}
2. Docker の公式 GPG 鍵を追加します。
@z

@x
    ```bash
    $ curl -fsSL {{ download-url-base }}/gpg | sudo apt-key add -
    ```
@y
    ```bash
    $ curl -fsSL {{ download-url-base }}/gpg | sudo apt-key add -
    ```
@z

@x
    Verify that you now have the key with the fingerprint
    `9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88`, by searching for the
    last 8 characters of the fingerprint.
@y
    {% comment %}
    Verify that you now have the key with the fingerprint
    `9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88`, by searching for the
    last 8 characters of the fingerprint.
    {% endcomment %}
    鍵を取得し、その指紋が `9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88` であることを確認してください。
    最後の 8 文字の一致を確認します。
@z

@x
    ```bash
    $ sudo apt-key fingerprint 0EBFCD88
@y
    ```bash
    $ sudo apt-key fingerprint 0EBFCD88
@z

@x
    pub   4096R/0EBFCD88 2017-02-22
          Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
    uid                  Docker Release (CE deb) <docker@docker.com>
    sub   4096R/F273FCD8 2017-02-22
    ```
@y
    pub   4096R/0EBFCD88 2017-02-22
          Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
    uid                  Docker Release (CE deb) <docker@docker.com>
    sub   4096R/F273FCD8 2017-02-22
    ```
@z

@x
3.  Use the following command to set up the **stable** repository. To add the
    **nightly** or **test** repository, add the word `nightly` or `test` (or both)
    after the word `stable` in the commands below. [Learn about **nightly** and **test** channels](index.md).
@y
{% comment %}
3.  Use the following command to set up the **stable** repository. To add the
    **nightly** or **test** repository, add the word `nightly` or `test` (or both)
    after the word `stable` in the commands below. [Learn about **nightly** and **test** channels](index.md).
{% endcomment %}
3.  以下のコマンドを使って**安定版**（stable）リポジトリをセットアップします。
    **最新版**（nightly）、**テスト版**（test）の各リポジトリを追加する場合は、以下のコマンドにおける `stable` の文字に続けて `nightly` や `test` の文字を加えてください。
    [**最新版**と**テスト版**チャンネルを学ぶにはこちら](index.md)。
@z

@x
    > **Note**: The `lsb_release -cs` sub-command below returns the name of your
    > Debian distribution, such as `helium`. Sometimes, in a distribution
    > like BunsenLabs Linux, you might need to change `$(lsb_release -cs)`
    > to your parent Debian distribution. For example, if you are using
    >  `BunsenLabs Linux Helium`, you could use `stretch`. Docker does not offer any guarantees on untested
    > and unsupported Debian distributions.
@y
    {% comment %}
    > **Note**: The `lsb_release -cs` sub-command below returns the name of your
    > Debian distribution, such as `helium`. Sometimes, in a distribution
    > like BunsenLabs Linux, you might need to change `$(lsb_release -cs)`
    > to your parent Debian distribution. For example, if you are using
    >  `BunsenLabs Linux Helium`, you could use `stretch`. Docker does not offer any guarantees on untested
    > and unsupported Debian distributions.
    {% endcomment %}
    > **メモ**
    >
    > サブコマンド `lsb_release -cs` は Debian ディストリビューションの名前、たとえば `helium` といったものを返します。
    > BunsenLabs Linux のようなディストリビューションなどでは、`$(lsb_release -cs)` とする必要があります。
    > たとえば `BunsenLabs Linux Helium` を使っている場合、`stretch` を利用することになります。
    > テスト対象外、サポート対象外の Debian ディストリビューションに対して Docker は何ら動作保証しません。
@z

@x
    <ul class="nav nav-tabs">
      <li class="active"><a data-toggle="tab" data-target="#x86_64_repo">x86_64 / amd64</a></li>
      <li><a data-toggle="tab" data-target="#armhf_repo">armhf</a></li>
      <li><a data-toggle="tab" data-target="#arm64_repo">arm64</a></li>
    </ul>
    <div class="tab-content">
    <div id="x86_64_repo" class="tab-pane fade in active" markdown="1">
@y
    <ul class="nav nav-tabs">
      <li class="active"><a data-toggle="tab" data-target="#x86_64_repo">x86_64 / amd64</a></li>
      <li><a data-toggle="tab" data-target="#armhf_repo">armhf</a></li>
      <li><a data-toggle="tab" data-target="#arm64_repo">arm64</a></li>
    </ul>
    <div class="tab-content">
    <div id="x86_64_repo" class="tab-pane fade in active" markdown="1">
@z

@x
    ```bash
    $ sudo add-apt-repository \
       "deb [arch=amd64] {{ download-url-base }} \
       $(lsb_release -cs) \
       stable"
    ```
@y
    ```bash
    $ sudo add-apt-repository \
       "deb [arch=amd64] {{ download-url-base }} \
       $(lsb_release -cs) \
       stable"
    ```
@z

@x
    </div>
    <div id="armhf_repo" class="tab-pane fade" markdown="1">
@y
    </div>
    <div id="armhf_repo" class="tab-pane fade" markdown="1">
@z

@x
    ```bash
    $ sudo add-apt-repository \
       "deb [arch=armhf] {{ download-url-base }} \
       $(lsb_release -cs) \
       stable"
    ```
@y
    ```bash
    $ sudo add-apt-repository \
       "deb [arch=armhf] {{ download-url-base }} \
       $(lsb_release -cs) \
       stable"
    ```
@z

@x
    </div>
    <div id="arm64_repo" class="tab-pane fade" markdown="1">
@y
    </div>
    <div id="arm64_repo" class="tab-pane fade" markdown="1">
@z

@x
    ```bash
    $ sudo add-apt-repository \
       "deb [arch=arm64] {{ download-url-base }} \
       $(lsb_release -cs) \
       stable"
    ```
@y
    ```bash
    $ sudo add-apt-repository \
       "deb [arch=arm64] {{ download-url-base }} \
       $(lsb_release -cs) \
       stable"
    ```
@z

@x
    </div>
    </div> <!-- tab-content -->
@y
    </div>
    </div> <!-- tab-content -->
@z

@x
#### Install Docker Engine
@y
{% comment %}
#### Install Docker Engine
{% endcomment %}
{: #install-docker-engine }
#### Docker Engine のインストール
@z

@x
> **Note**: This procedure works for Debian on `x86_64` / `amd64`, Debian ARM,
> or Raspbian.
@y
{% comment %}
> **Note**: This procedure works for Debian on `x86_64` / `amd64`, Debian ARM,
> or Raspbian.
{% endcomment %}
> **メモ**
>
> この手順は Debian `x86_64` / `amd64`、Debian ARM、Raspbian 向けです。
@z

@x
1. Update the `apt` package index, and install the _latest version_ of Docker
@y
{% comment %}
1. Update the `apt` package index, and install the _latest version_ of Docker
{% endcomment %}
1.  `apt` のパッケージインデックスを更新し、**最新版の** Docker をインストールします。
@z

@x
    ```bash
    $ sudo apt-get update
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io
    ```
@y
    ```bash
    $ sudo apt-get update
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io
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
    {% comment %}
    > Got multiple Docker repositories?
    >
    > If you have multiple Docker repositories enabled, installing
    > or updating without specifying a version in the `apt-get install` or
    > `apt-get update` command always installs the highest possible version,
    > which may not be appropriate for your stability needs.
    {% endcomment %}
    > 複数リポジトリからの取得？
    >
    > Docker リポジトリを複数有効にしていて、バージョン指定をせずに `apt-get install`
    > によるインストール、または `apt-get update` によるアップデートを行うと、入手可能な最新版がインストールされます。
    > 安定した版が必要である場合には、適切でない場合があります。
@z

@x
2.  To install a _specific version_ of Docker Engine, list the available versions
    in the repo, then select and install:
@y
{% comment %}
2.  To install a _specific version_ of Docker Engine, list the available versions
    in the repo, then select and install:
{% endcomment %}
2.  特定バージョンの Docker Engine をインストールする場合は、リポジトリにある利用可能なバージョンの一覧を確認し、いずれかを選んでインストールします。
@z

@x
    a. List the versions available in your repo:
@y
    {% comment %}
    a. List the versions available in your repo:
    {% endcomment %}
    a. リポジトリ内にある利用可能なバージョンを一覧表示します。
@z

@x
    ```bash
    $ apt-cache madison docker-ce
@y
    ```bash
    $ apt-cache madison docker-ce
@z

@x
      docker-ce | 5:18.09.1~3-0~debian-stretch | {{ download-url-base }} stretch/stable amd64 Packages
      docker-ce | 5:18.09.0~3-0~debian-stretch | {{ download-url-base }} stretch/stable amd64 Packages
      docker-ce | 18.06.1~ce~3-0~debian        | {{ download-url-base }} stretch/stable amd64 Packages
      docker-ce | 18.06.0~ce~3-0~debian        | {{ download-url-base }} stretch/stable amd64 Packages
      ...
    ```
@y
      docker-ce | 5:18.09.1~3-0~debian-stretch | {{ download-url-base }} stretch/stable amd64 Packages
      docker-ce | 5:18.09.0~3-0~debian-stretch | {{ download-url-base }} stretch/stable amd64 Packages
      docker-ce | 18.06.1~ce~3-0~debian        | {{ download-url-base }} stretch/stable amd64 Packages
      docker-ce | 18.06.0~ce~3-0~debian        | {{ download-url-base }} stretch/stable amd64 Packages
      ...
    ```
@z

@x
    b. Install a specific version using the version string from the second column,
       for example, `5:18.09.1~3-0~debian-stretch `.
@y
    {% comment %}
    b. Install a specific version using the version string from the second column,
       for example, `5:18.09.1~3-0~debian-stretch `.
    {% endcomment %}
    b. 特定のバージョンをインストールする場合は、2 項目めにあるバージョン文字列を使ってインストールします。
       たとえば `5:18.09.1~3-0~debian-stretch` となります。
@z

@x
    ```bash
    $ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
    ```
@y
    ```bash
    $ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
    ```
@z

@x
3.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
{% comment %}
3.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
{% endcomment %}
3.  Docker Engine が正しくインストールされているのを確認するため、`hello-world` イメージを実行します。
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
    このコマンドはテスト用イメージをダウンロードし、コンテナー内で実行します。
    コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
Docker Engine is installed and running. The `docker` group is created but no users
are added to it. You need to use `sudo` to run Docker commands.
Continue to [Linux postinstall](linux-postinstall.md) to allow non-privileged
users to run Docker commands and for other optional configuration steps.
@y
{% comment %}
Docker Engine is installed and running. The `docker` group is created but no users
are added to it. You need to use `sudo` to run Docker commands.
Continue to [Linux postinstall](linux-postinstall.md) to allow non-privileged
users to run Docker commands and for other optional configuration steps.
{% endcomment %}
Docker Engine がインストールされ、実行できました。
グループ `docker` が生成されていますが、このグループにはまだユーザーが存在していない状態です。
Docker コマンドの実行には ``sudo`` が必要になります。
続いて [Linux のインストール後](linux-postinstall.md) に進み、非特権ユーザーでも Docker コマンドが実行できるように、またその他の追加の設定について見ていきます。
@z

@x
#### Upgrade Docker Engine
@y
{% comment %}
#### Upgrade Docker Engine
{% endcomment %}
{: #upgrade-docker-engine }
#### Docker Engine のアップグレード
@z

@x
To upgrade Docker Engine, first run `sudo apt-get update`, then follow the
[installation instructions](#install-using-the-repository), choosing the new
version you want to install.
@y
{% comment %}
To upgrade Docker Engine, first run `sudo apt-get update`, then follow the
[installation instructions](#install-using-the-repository), choosing the new
version you want to install.
{% endcomment %}
Docker Engine をアップグレードするには、まず `sudo apt-get update` を実行します。
そして[インストール手順](#install-using-the-repository) に従って、インストールしたい新たなバージョンを選んでください。
@z

@x
### Install from a package
@y
{% comment %}
### Install from a package
{% endcomment %}
{: #install-from-a-package }
### パッケージからのインストール
@z

@x
If you cannot use Docker's repository to install Docker Engine, you can download the
`.deb` file for your release and install it manually. You need to download
a new file each time you want to upgrade Docker.
@y
{% comment %}
If you cannot use Docker's repository to install Docker Engine, you can download the
`.deb` file for your release and install it manually. You need to download
a new file each time you want to upgrade Docker.
{% endcomment %}
Docker リポジトリを利用した Docker Engine のインストールができない場合は、目的とするリリースの `.deb` ファイルをダウンロードして、手動でインストールする方法があります。
この場合 Docker をアップグレードするには、毎回新たな `.deb` ファイルをダウンロードして利用することになります
@z

@x
1.  Go to [`{{ download-url-base }}/dists/`]({{ download-url-base }}/dists/){: target="_blank" class="_" },
    choose your Debian version, then browse to `pool/stable/`, choose `amd64`,
    `armhf`, or `arm64` and download the `.deb` file for the Docker version
    you want to install.
@y
{% comment %}
1.  Go to [`{{ download-url-base }}/dists/`]({{ download-url-base }}/dists/){: target="_blank" class="_" },
    choose your Debian version, then browse to `pool/stable/`, choose `amd64`,
    `armhf`, or `arm64` and download the `.deb` file for the Docker version
    you want to install.
{% endcomment %}
1.  [{{ download-url-base }}/dists/]({{ download-url-base }}/dists/){: target="_blank" class="_" }
    にアクセスして、インストールしたい Debian バージョンを選びます。
    そして `pool/stable/` にアクセスし、`amd64`、`armhf`、`arm64` のいずれかを選び、インストールしたいバージョンの Docker Engine に対応する `.deb` ファイルをダウンロードします。
@z

@x
    > **Note**: To install a **nightly** or **test** (pre-release) package,
    > change the word `stable` in the above URL to `nightly` or `test`.
    > [Learn about **nightly** and **test** channels](index.md).
@y
    {% comment %}
    > **Note**: To install a **nightly** or **test** (pre-release) package,
    > change the word `stable` in the above URL to `nightly` or `test`.
    > [Learn about **nightly** and **test** channels](index.md).
    {% endcomment %}
    > **メモ**: **最新版**（nightly）や **テスト版**（test）パッケージをインストールする場合は、
    > URL 内の `stable` を `nightly` や `test` に変更してください。
    > [**最新版** と **テスト版** チャンネルを学ぶにはこちら](index.md)。
@z

@x
2.  Install Docker Engine, changing the path below to the path where you downloaded
    the Docker package.
@y
{% comment %}
2.  Install Docker Engine, changing the path below to the path where you downloaded
    the Docker package.
{% endcomment %}
2.  Docker Engine をインストールします。
    以下に示すパス部分は、Docker パッケージをダウンロードしたパスに書き換えます。
@z

@x
    ```bash
    $ sudo dpkg -i /path/to/package.deb
    ```
@y
    ```bash
    $ sudo dpkg -i /path/to/package.deb
    ```
@z

@x
    The Docker daemon starts automatically.
@y
    {% comment %}
    The Docker daemon starts automatically.
    {% endcomment %}
    Docker デーモンは自動的に起動します。
@z

@x
3.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
{% comment %}
3.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
{% endcomment %}
3.  Docker Engine が正しくインストールされているのを確認するため `hello-world` イメージを実行します。
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
{% comment %}
Docker Engine is installed and running. The `docker` group is created but no users
are added to it. You need to use `sudo` to run Docker commands.
Continue to [Post-installation steps for Linux](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
{% endcomment %}
Docker Engine がインストールされ、実行できました。
グループ `docker` が生成されていますが、このグループにはまだユーザーが存在していない状態です。
Docker コマンドの実行には ``sudo`` が必要になります。
続いて [Linux のインストール後](linux-postinstall.md) に進み、非特権ユーザーでも Docker コマンドが実行できるように、またその他の追加の設定について見ていきます。
@z

@x
#### Upgrade Docker Engine
@y
{% comment %}
#### Upgrade Docker Engine
{% endcomment %}
{: #upgrade-docker-engine }
#### Docker Engine のアップグレード
@z

@x
To upgrade Docker Engine, download the newer package file and repeat the
[installation procedure](#install-from-a-package), pointing to the new file.
@y
{% comment %}
To upgrade Docker Engine, download the newer package file and repeat the
[installation procedure](#install-from-a-package), pointing to the new file.
{% endcomment %}
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
{% comment %}
## Uninstall Docker Engine
{% endcomment %}
{: #uninstall-docker-engine }
## Docker Engine のアンインストール
@z

@x
1.  Uninstall the Docker Engine, CLI, and Containerd packages:
@y
{% comment %}
1.  Uninstall the Docker Engine, CLI, and Containerd packages:
{% endcomment %}
1.  Docker Engine、CLI、Containerd パッケージをアンインストールします。
@z

@x
    ```bash
    $ sudo apt-get purge docker-ce docker-ce-cli containerd.io
    ```
@y
    ```bash
    $ sudo apt-get purge docker-ce docker-ce-cli containerd.io
    ```
@z

@x
2.  Images, containers, volumes, or customized configuration files on your host
    are not automatically removed. To delete all images, containers, and
    volumes:
@y
{% comment %}
2.  Images, containers, volumes, or customized configuration files on your host
    are not automatically removed. To delete all images, containers, and
    volumes:
{% endcomment %}
2.  ホスト上のイメージ、コンテナー、ボリューム、カスタマイズした設定ファイルは自動的に削除されません。
    イメージ、コンテナー、ボリュームをすべて削除するには、以下を実行します。
@z

@x
    ```bash
    $ sudo rm -rf /var/lib/docker
    $ sudo rm -rf /var/lib/containerd
    ```
@y
    ```bash
    $ sudo rm -rf /var/lib/docker
    $ sudo rm -rf /var/lib/containerd
    ```
@z

@x
You must delete any edited configuration files manually.
@y
{% comment %}
You must delete any edited configuration files manually.
{% endcomment %}
編集した設定ファイルはすべて手動で削除する必要があります。
@z

@x
## Next steps
@y
{% comment %}
## Next steps
{% endcomment %}
{: #next-steps }
## 次のステップ
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@y
{% comment %}
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
{% endcomment %}
- [Linux のインストール後](linux-postinstall.md) へ進む。
- [Docker を用いた開発](../../develop/index.md) における各項目を参照してください。
  Docker を使ったアプリケーションの構築方法を学びます。
@z
