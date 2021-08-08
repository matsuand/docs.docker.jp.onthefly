%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Instructions for installing Docker Engine on CentOS
keywords: requirements, apt, installation, centos, rpm, install, uninstall, upgrade, update
redirect_from:
- /ee/docker-ee/centos/
- /engine/installation/centos/
- /engine/installation/linux/centos/
- /engine/installation/linux/docker-ce/centos/
- /engine/installation/linux/docker-ee/centos/
- /install/linux/centos/
- /install/linux/docker-ce/centos/
- /install/linux/docker-ee/centos/
title: Install Docker Engine on CentOS
toc_max: 4
---
@y
---
description: CentOS 上に Docker Engine をインストールする手順を説明。
keywords: requirements, apt, installation, centos, rpm, install, uninstall, upgrade, update
redirect_from:
- /ee/docker-ee/centos/
- /engine/installation/centos/
- /engine/installation/linux/centos/
- /engine/installation/linux/docker-ce/centos/
- /engine/installation/linux/docker-ee/centos/
- /install/linux/centos/
- /install/linux/docker-ce/centos/
- /install/linux/docker-ee/centos/
title: Docker Engine インストール（CentOS 向け）
toc_max: 4
---
@z

@x
To get started with Docker Engine on CentOS, make sure you
[meet the prerequisites](#prerequisites), then
[install Docker](#installation-methods).
@y
CentOS 向けに Docker Engine を始めるには、[前提条件を満たしているか](#prerequisites) を確認してから、[インストール手順](#installation-methods) に進んでください。
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
To install Docker Engine, you need a maintained version of CentOS 7 or 8.
Archived versions aren't supported or tested.
@y
Docker Engine をインストールするには保守対象の CentOS 7 または 8 が必要です。
古いバージョンはサポートもテストも行っていません。
@z

@x
The `centos-extras` repository must be enabled. This repository is enabled by
default, but if you have disabled it, you need to
[re-enable it](https://wiki.centos.org/AdditionalResources/Repositories){: target="_blank" rel="noopener" class="_" }.
@y
`centos-extras`リポジトリを有効にすることが必要です。
このリポジトリはデフォルトでは有効になっていますが、もし無効にしている場合は、[もう一度有効に](https://wiki.centos.org/AdditionalResources/Repositories){: target="_blank" rel="noopener" class="_" } する必要があります。
@z

@x
The `overlay2` storage driver is recommended.
@y
`overlay2`ストレージドライバーの利用が推奨されます。
@z

@x
### Uninstall old versions
@y
{: #uninstall-old-versions }
### 古いバージョンのアンインストール
@z

@x
Older versions of Docker were called `docker` or `docker-engine`. If these are
installed, uninstall them, along with associated dependencies.
@y
Docker のかつてのバージョンは、`docker`あるいは`docker-engine`と呼ばれていました。
これがインストールされている場合は、関連する依存パッケージも含めアンインストールしてください。
@z

@x
```console
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```
@y
```console
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```
@z

@x
It's OK if `yum` reports that none of these packages are installed.
@y
`yum`を実行したときに、上のパッケージがインストールされていないと表示されれば OK です。
@z

@x
The contents of `/var/lib/docker/`, including images, containers, volumes, and
networks, are preserved. The Docker Engine package is now called `docker-ce`.
@y
`/var/lib/docker/`にはイメージ、コンテナー、ボリューム、ネットワークが含まれていて、それは保持されたまま残ります。
なお Docker Engine パッケージは、今は`docker-ce`と呼ばれます。
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
- Some users download the RPM package and
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
{% assign download-url-base = "https://download.docker.com/linux/centos" %}
@y
{% assign download-url-base = "https://download.docker.com/linux/centos" %}
@z

@x
Install the `yum-utils` package (which provides the `yum-config-manager`
utility) and set up the **stable** repository.
@y
`yum-utils`パッケージをインストールします。
（このパッケージが`yum-config-manager`ユーティリティーが提供されます。）
そして **安定版**（stable）リポジトリを設定します。
@z

@x
```console
$ sudo yum install -y yum-utils

$ sudo yum-config-manager \
    --add-repo \
    {{ download-url-base }}/docker-ce.repo
```
@y
```console
$ sudo yum install -y yum-utils

$ sudo yum-config-manager \
    --add-repo \
    {{ download-url-base }}/docker-ce.repo
```
@z

@x
> **Optional**: Enable the **nightly** or **test** repositories.
>
> These repositories are included in the `docker.repo` file above but are disabled
> by default. You can enable them alongside the stable repository.  The following
> command enables the **nightly** repository.
>
> ```console
> $ sudo yum-config-manager --enable docker-ce-nightly
> ```
>
> To enable the **test** channel, run the following command:
>
> ```console
> $ sudo yum-config-manager --enable docker-ce-test
> ```
>
> You can disable the **nightly** or **test** repository by running the
> `yum-config-manager` command with the `--disable` flag. To re-enable it, use
> the `--enable` flag. The following command disables the **nightly** repository.
>
> ```console
> $ sudo yum-config-manager --disable docker-ce-nightly
> ```
>
> [Learn about **nightly** and **test** channels](index.md).
@y
> **任意の作業**
>
> **最新版**（nightly）または **テスト版**（test）リポジトリの有効化
>
> このリポジトリは上記の`docker.repo`ファイルに含まれていますが、デフォルトで無効になっています。
> このリポジトリを **安定版**（stable）リポジトリとともに有効にします。
> 以下のコマンドは **最新版** リポジトリを有効にします。
>
> ```console
> $ sudo yum-config-manager --enable docker-ce-nightly
> ```
>
> **テスト版** チャネルを有効にする場合は、以下のコマンドを実行します。
>
> ```console
> $ sudo yum-config-manager --enable docker-ce-test
> ```
>
> **最新版** リポジトリ、 **テスト版** リポジトリを無効にするには`yum-config-manager`コマンドに`--disable`フラグをつけて実行します。
> 以下のコマンドは **最新版** リポジトリを無効にします。
>
> ```console
> $ sudo yum-config-manager --disable docker-ce-nightly
> ```
>
> [**最新版** と **テスト版** チャネルについて学ぶのはこちら](index.md)。
@z

@x
#### Install Docker Engine
@y
{: #install-docker-engine }
#### Docker Engine のインストール
@z

@x
1.  Install the _latest version_ of Docker Engine and containerd, or go to the next step to install a specific version:
@y
1.  Docker Engine と containerd の最新版をインストールします。
    あるいは次の手順に行って、特定のバージョンをインストールします。
@z

@x
    ```console
    $ sudo yum install docker-ce docker-ce-cli containerd.io
    ```
@y
    ```console
    $ sudo yum install docker-ce docker-ce-cli containerd.io
    ```
@z

@x
    If prompted to accept the GPG key, verify that the fingerprint matches
    `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.
@y
    GPG 鍵を受け入れるかどうか問われたら、鍵の指紋が`060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`に間違いないことを確認し、鍵を受け入れてください。
@z

@x
    > Got multiple Docker repositories?
    >
    > If you have multiple Docker repositories enabled, installing
    > or updating without specifying a version in the `yum install` or
    > `yum update` command always installs the highest possible version,
    > which may not be appropriate for your stability needs.
@y
    > 複数リポジトリからの取得？
    >
    > Docker リポジトリを複数有効にしていて、バージョン指定をせずに`yum install`によるインストール、または`yum update`によるアップデートを行うと、入手可能な最新版がインストールされます。
    > 安定した版が必要である場合には、適切でない場合があります。
@z

@x
    This command installs Docker, but it doesn't start Docker. It also creates a
    `docker` group, however, it doesn't add any users to the group by default.
@y
    このコマンドにより Docker がインストールされましたが、まだ起動はしていません。
    グループ`docker`が生成されていますが、このグループには、デフォルトではまだユーザーが存在していない状態です。
@z

@x
2.  To install a _specific version_ of Docker Engine, list the available versions
    in the repo, then select and install:
@y
2.  特定バージョンの Docker Engine をインストールする場合は、リポジトリにある利用可能なバージョンの一覧を確認し、いずれかを選んでインストールします。
@z

@x
    a. List and sort the versions available in your repo. This example sorts
       results by version number, highest to lowest, and is truncated:
@y
    a. リポジトリ内にある利用可能なバージョンを並びかえて一覧表示します。
       以下の例では出力結果をバージョン番号によりソートします。
       一覧は最新のものが上に並びます。バージョンは簡略に表示されます。
@z

@x
    ```console
    $ yum list docker-ce --showduplicates | sort -r
@y
    ```console
    $ yum list docker-ce --showduplicates | sort -r
@z

@x
    docker-ce.x86_64  3:18.09.1-3.el7                     docker-ce-stable
    docker-ce.x86_64  3:18.09.0-3.el7                     docker-ce-stable
    docker-ce.x86_64  18.06.1.ce-3.el7                    docker-ce-stable
    docker-ce.x86_64  18.06.0.ce-3.el7                    docker-ce-stable
    ```
@y
    docker-ce.x86_64  3:18.09.1-3.el7                     docker-ce-stable
    docker-ce.x86_64  3:18.09.0-3.el7                     docker-ce-stable
    docker-ce.x86_64  18.06.1.ce-3.el7                    docker-ce-stable
    docker-ce.x86_64  18.06.0.ce-3.el7                    docker-ce-stable
    ```
@z

@x
    The list returned depends on which repositories are enabled, and is specific
    to your version of CentOS (indicated by the `.el7` suffix in this example).
@y
    この一覧内容は、どのリポジトリを有効にしているかによって変わります。
    また利用している CentOS のバージョンに応じたものになります（この例では`.e17`というサフィックスにより示されるバージョンです）。
@z

@x
    b. Install a specific version by its fully qualified package name, which is
       the package name (`docker-ce`) plus the version string (2nd column)
       starting at the first colon (`:`), up to the first hyphen, separated by
       a hyphen (`-`). For example, `docker-ce-18.09.1`.
@y
    b. 特定のバージョンをインストールする場合は、有効なパッケージ名を用います。
       これはパッケージ名（`docker-ce`）に加えて、バージョン文字列（２項目め）の初めのコロン（`:`）から初めのハイフン（`-`）までを、ハイフンでつなげます。
       たとえば`docker-ce-18.09.1`となります。
@z

@x
    ```console
    $ sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
    ```
@y
    ```console
    $ sudo yum install docker-ce-<バージョン文字列> docker-ce-cli-<バージョン文字列> containerd.io
    ```
@z

@x
    This command installs Docker, but it doesn't start Docker. It also creates a
    `docker` group, however, it doesn't add any users to the group by default.
@y
    このコマンドにより Docker がインストールされましたが、まだ起動はしていません。
    グループ`docker`が追加されていますが、このグループには、デフォルトではまだユーザーが存在していない状態です。
@z

@x
3.  Start Docker.
@y
3. Docker を起動します。
@z

@x
    ```console
    $ sudo systemctl start docker
    ```
@y
    ```console
    $ sudo systemctl start docker
    ```
@z

@x
4.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
4. Docker Engine が正しくインストールされているのを確認するため、`hello-world`イメージを実行します。
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
This installs and runs Docker Engine. Use `sudo` to run Docker
commands. Continue to [Linux postinstall](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@y
こうして Docker Engine をインストールし、実行しました。
Docker コマンドの実行には`sudo`が必要になります。
続いて [Linux のインストール後](linux-postinstall.md) に進み、非特権ユーザーでも Docker コマンドが実行できるように、またその他の追加の設定について見ていきます。
@z

@x
#### Upgrade Docker Engine
@y
{: #upgrade-docker-engine }
#### Docker Engine のアップグレード
@z

@x
To upgrade Docker Engine, follow the [installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@y
Docker Engine をアップグレードするには、[インストール手順](#install-using-the-repository) に従って、インストールしたい新たなバージョンを選んでください。
@z

@x
### Install from a package
@y
{: #install-from-a-package }
### パッケージからのインストール
@z

@x
If you cannot use Docker's repository to install Docker, you can download the
`.rpm` file for your release and install it manually. You need to download
a new file each time you want to upgrade Docker Engine.
@y
Docker リポジトリを利用した Docker インストールができない場合は、目的とするリリースの`.rpm`ファイルをダウンロードして、手動でインストールする方法があります。この場合 Docker Engine をアップグレードするには、毎回新たな`.rpm`ファイルをダウンロードして利用することになります
@z

@x
1.  Go to [{{ download-url-base }}/]({{ download-url-base }}/){: target="_blank" rel="noopener" class="_" }
    and choose your version of CentOS. Then browse to `x86_64/stable/Packages/`
    and download the `.rpm` file for the Docker version you want to install.
@y
1.  [{{ download-url-base }}/]({{ download-url-base }}/){: target="_blank" rel="noopener" class="_" } にアクセスして、インストールしている CentOS のバージョンを選択します。
    そして`x86_64/stable/Packages/`を表示し、インストールしたい`.rpm`ファイルをダウンロードします。
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
    > **最新版**または**テスト版**（プレリリース版）パッケージをインストールする場合は
    > URL 内の`stable`を`nightly`または`test`に変更してください。
    > [**最新版**と**テスト版**チャンネルを学ぶにはこちら](index.md)。

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
    $ sudo yum install /path/to/package.rpm
    ```
@y
    ```console
    $ sudo yum install /path/to/package.rpm
    ```
@z

@x
    Docker is installed but not started. The `docker` group is created, but no
    users are added to the group.
@y
    Docker はインストールされましたが、まだ起動はしていません。
    グループ`docker`が追加されていますが、このグループにはまだユーザーが存在していない状態です。
@z

@x
3.  Start Docker.
@y
3. Docker を起動します。
@z

@x
    ```console
    $ sudo systemctl start docker
    ```
@y
    ```console
    $ sudo systemctl start docker
    ```
@z

@x
4.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
4.  Docker Engine が正しくインストールされているのを確認するため`hello-world`イメージを実行します。
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
This installs and runs Docker Engine. Use `sudo` to run Docker commands.
Continue to [Post-installation steps for Linux](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@y
こうして Docker Engine をインストールし、実行しました。
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
[installation procedure](#install-from-a-package), using `yum -y upgrade`
instead of `yum -y install`, and point to the new file.
@y
Docker Engine をアップグレードする場合は、新たなパッケージファイルをダウンロードして、[インストール手順](#install-from-a-package) をもう一度行います。
その際には`yum -y install`でなく`yum -y upgrade`を実行します。
またパッケージには新しいものを指定します。
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
1.  Uninstall the Docker Engine, CLI, and Containerd packages:
@y
1.  Docker Engine、CLI、Containerd パッケージをアンインストールします。
@z

@x
    ```console
    $ sudo yum remove docker-ce docker-ce-cli containerd.io
    ```
@y
    ```console
    $ sudo yum remove docker-ce docker-ce-cli containerd.io
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
{: #next-steps }
## 次のステップ
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@y
- [Linux のインストール後](linux-postinstall.md) へ進む
- [Docker を用いた開発](../../develop/index.md) における各項目を参照してください。
  Docker を使ったアプリケーションの構築方法を学びます。
@z
