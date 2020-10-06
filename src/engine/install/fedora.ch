%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Instructions for installing Docker Engine on Fedora
keywords: requirements, apt, installation, fedora, rpm, install, uninstall, upgrade, update
redirect_from:
- /engine/installation/fedora/
- /engine/installation/linux/fedora/
- /engine/installation/linux/docker-ce/fedora/
- /install/linux/docker-ce/fedora/
title: Install Docker Engine on Fedora
toc_max: 4
---
@y
---
description: Fedora 上に Docker Engine をインストールする手順を説明。
keywords: requirements, apt, installation, fedora, rpm, install, uninstall, upgrade, update
redirect_from:
- /engine/installation/fedora/
- /engine/installation/linux/fedora/
- /engine/installation/linux/docker-ce/fedora/
- /install/linux/docker-ce/fedora/
title: Docker Engine インストール（Fedora 向け）
toc_max: 4
---
@z

@x
To get started with Docker Engine on Fedora, make sure you
[meet the prerequisites](#prerequisites), then
[install Docker](#installation-methods).
@y
{% comment %}
To get started with Docker Engine on Fedora, make sure you
[meet the prerequisites](#prerequisites), then
[install Docker](#installation-methods).
{% endcomment %}
Fedora 向けに Docker Engine を始めるには、[前提条件を満たしているか](#prerequisites) を確認してから、[インストール手順](#installation-methods) に進んでください。
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
### OS 要件
{: #os-requirements }
@z

@x
To install Docker Engine, you need the 64-bit version of one of these Fedora versions:
@y
{% comment %}
To install Docker Engine, you need the 64-bit version of one of these Fedora versions:
{% endcomment %}
Docker Engine をインストールするには、以下に示す Fedora の 64 ビットバージョンのいずれかが必要です。
@z

@x
- Fedora 30
- Fedora 31
@y
- Fedora 30
- Fedora 31
@z

@x
### Uninstall old versions
@y
{% comment %}
### Uninstall old versions
{% endcomment %}
### 古いバージョンのアンインストール
{: #uninstall-old-versions }
@z

@x
Older versions of Docker were called `docker` or `docker-engine`. If these are
installed, uninstall them, along with associated dependencies.
@y
{% comment %}
Older versions of Docker were called `docker` or `docker-engine`. If these are
installed, uninstall them, along with associated dependencies.
{% endcomment %}
Docker のかつてのバージョンは、`docker` あるいは `docker-engine` と呼ばれていました。
これがインストールされている場合は、関連する依存パッケージも含めアンインストールしてください。
@z

@x
```bash
$ sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
```
@y
```bash
$ sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
```
@z

@x
It's OK if `dnf` reports that none of these packages are installed.
@y
{% comment %}
It's OK if `dnf` reports that none of these packages are installed.
{% endcomment %}
`dnf` を実行したときに、上のパッケージがインストールされていないと表示されれば OK です。
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
  recommended approach.
@y
{% comment %}
- Most users
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach.
{% endcomment %}
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
{% comment %}
- Some users download the RPM package and
  [install it manually](#install-from-a-package) and manage
  upgrades completely manually. This is useful in situations such as installing
  Docker on air-gapped systems with no access to the internet.
{% endcomment %}
- ユーザーの中には RPM パッケージをダウンロードし、[手動でインストール](#install-from-a-package)している方もいます。
  アップグレードも完全に手動となります。
  この方法は、インターネットにアクセスできない環境で Docker をインストールするような場合には有用です。
@z

@x
- In testing and development environments, some users choose to use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
@y
{% comment %}
- In testing and development environments, some users choose to use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
{% endcomment %}
- テスト環境や開発環境向けに、自動化された[便利なスクリプト](#install-using-the-convenience-script)を使って
  Docker のインストールを行うユーザーもいます。
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
#### Set up the repository
@y
{% comment %}
#### Set up the repository
{% endcomment %}
{: #set-up-the-repository }
#### リポジトリのセットアップ
@z

@x
{% assign download-url-base = "https://download.docker.com/linux/fedora" %}
@y
{% assign download-url-base = "https://download.docker.com/linux/fedora" %}
@z

@x
Install the `dnf-plugins-core` package (which provides the commands to manage
your DNF repositories) and set up the **stable** repository.
@y
{% comment %}
Install the `dnf-plugins-core` package (which provides the commands to manage
your DNF repositories) and set up the **stable** repository.
{% endcomment %}
`dnf-plugins-core` パッケージをインストールします。
（このパッケージが DNF リポジトリ管理を行うコマンドを提供します。）
そして **安定版**（stable）リポジトリを設定します。
@z

@x
```bash
$ sudo dnf -y install dnf-plugins-core

$ sudo dnf config-manager \
    --add-repo \
    {{ download-url-base }}/docker-ce.repo
```
@y
```bash
$ sudo dnf -y install dnf-plugins-core

$ sudo dnf config-manager \
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
> ```bash
> $ sudo dnf config-manager --set-enabled docker-ce-nightly
> ```
>
> To enable the **test** channel, run the following command:
>
> ```bash
> $ sudo dnf config-manager --set-enabled docker-ce-test
> ```
>
> You can disable the **nightly** or **test** repository by running the
> `dnf config-manager` command with the `--set-disabled` flag. To re-enable it,
> use the `--set-enabled` flag. The following command disables the **nightly**
> repository.
>
> ```bash
> $ sudo dnf config-manager --set-disabled docker-ce-nightly
> ```
>
> [Learn about **nightly** and **test** channels](index.md).
@y
{% comment %}
> **Optional**: Enable the **nightly** or **test** repositories.
>
> These repositories are included in the `docker.repo` file above but are disabled
> by default. You can enable them alongside the stable repository.  The following
> command enables the **nightly** repository.
>
> ```bash
> $ sudo dnf config-manager --set-enabled docker-ce-nightly
> ```
>
> To enable the **test** channel, run the following command:
>
> ```bash
> $ sudo dnf config-manager --set-enabled docker-ce-test
> ```
>
> You can disable the **nightly** or **test** repository by running the
> `dnf config-manager` command with the `--set-disabled` flag. To re-enable it,
> use the `--set-enabled` flag. The following command disables the **nightly**
> repository.
>
> ```bash
> $ sudo dnf config-manager --set-disabled docker-ce-nightly
> ```
>
> [Learn about **nightly** and **test** channels](index.md).
{% endcomment %}
> **任意の作業**： **最新版**（nightly）または **テスト版**（test）リポジトリの有効化
>
> このリポジトリは上記の ``docker.repo`` ファイルに含まれていますが、デフォルトで無効になっています。
> このリポジトリを **安定版**（stable）リポジトリとともに有効にします。
> 以下のコマンドは **最新版** リポジトリを有効にします。
>
> ```bash
> $ sudo dnf config-manager --set-enabled docker-ce-nightly
> ```
>
> **テスト版** チャネルを有効にする場合は、以下のコマンドを実行します。
>
> ```bash
> $ sudo dnf config-manager --set-enabled docker-ce-test
> ```
>
> **最新版** リポジトリ、 **テスト版** リポジトリを無効にするには `dnf config-manager` コマンドに `--set-disabled` フラグをつけて実行します。
> 再度有効にするには `--set-enabled` フラグを利用します。
> 以下のコマンドは **最新版** リポジトリを無効にします。
>
> ```bash
> $ sudo dnf config-manager --set-disabled docker-ce-nightly
> ```
>
> [**最新版** と **テスト版** チャネルについて学ぶのはこちら](index.md)。
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
1.  Install the _latest version_ of Docker Engine and containerd, or go to the next step to install a specific version:
@y
{% comment %}
1.  Install the _latest version_ of Docker Engine and containerd, or go to the next step to install a specific version:
{% endcomment %}
1.  Docker Engine と containerd の最新版をインストールします。
    あるいは次の手順により特定のバージョンをインストールします。
@z

@x
    ```bash
    $ sudo dnf install docker-ce docker-ce-cli containerd.io
    ```
@y
    ```bash
    $ sudo dnf install docker-ce docker-ce-cli containerd.io
    ```
@z

@x
    If prompted to accept the GPG key, verify that the fingerprint matches
    `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.
@y
    {% comment %}
    If prompted to accept the GPG key, verify that the fingerprint matches
    `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.
    {% endcomment %}
    GPG 鍵を受け入れるかどうか問われたら、鍵の指紋が `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35` に間違いないことを確認し、鍵を受け入れてください。
@z

@x
    > Got multiple Docker repositories?
    >
    > If you have multiple Docker repositories enabled, installing
    > or updating without specifying a version in the `dnf install` or
    > `dnf update` command always installs the highest possible version,
    > which may not be appropriate for your stability needs.
@y
    {% comment %}
    > Got multiple Docker repositories?
    >
    > If you have multiple Docker repositories enabled, installing
    > or updating without specifying a version in the `dnf install` or
    > `dnf update` command always installs the highest possible version,
    > which may not be appropriate for your stability needs.
    {% endcomment %}
    > 複数リポジトリからの取得？
    >
    > Docker リポジトリを複数有効にしていて、バージョン指定をせずに `dnf install`
    > によるインストール、または `dnf update` によるアップデートを行うと、入手可能な最新版がインストールされます。
    > 安定した版が必要である場合には、適切でない場合があります。
@z

@x
    Docker is installed but not started. The `docker` group is created, but no users are added to the group.
@y
    {% comment %}
    Docker is installed but not started. The `docker` group is created, but no users are added to the group.
    {% endcomment %}
    Docker はインストールされましたが、まだ起動はしていません。
    グループ `docker` が生成されていますが、このグループにはまだユーザーが存在していない状態です。
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
    a. List and sort the versions available in your repo. This example sorts
       results by version number, highest to lowest, and is truncated:
@y
    {% comment %}
    a. List and sort the versions available in your repo. This example sorts
       results by version number, highest to lowest, and is truncated:
    {% endcomment %}
    a. リポジトリ内にある利用可能なバージョンを並びかえて一覧表示します。
       以下の例では出力結果をバージョン番号によりソートします。
       一覧は最新のものが上に並びます。バージョンは簡略に表示されます。
@z

@x
    ```bash
    $ dnf list docker-ce  --showduplicates | sort -r
@y
    ```bash
    $ dnf list docker-ce  --showduplicates | sort -r
@z

@x
    docker-ce.x86_64  3:18.09.1-3.fc28                 docker-ce-stable
    docker-ce.x86_64  3:18.09.0-3.fc28                 docker-ce-stable
    docker-ce.x86_64  18.06.1.ce-3.fc28                docker-ce-stable
    docker-ce.x86_64  18.06.0.ce-3.fc28                docker-ce-stable
    ```
@y
    docker-ce.x86_64  3:18.09.1-3.fc28                 docker-ce-stable
    docker-ce.x86_64  3:18.09.0-3.fc28                 docker-ce-stable
    docker-ce.x86_64  18.06.1.ce-3.fc28                docker-ce-stable
    docker-ce.x86_64  18.06.0.ce-3.fc28                docker-ce-stable
    ```
@z

@x
    The list returned depends on which repositories are enabled, and is specific
    to your version of Fedora (indicated by the `.fc28` suffix in this example).
@y
    {% comment %}
    The list returned depends on which repositories are enabled, and is specific
    to your version of Fedora (indicated by the `.fc28` suffix in this example).
    {% endcomment %}
    この一覧内容は、どのリポジトリを有効にしているかによって変わります。
    また利用している Fedora のバージョンに応じたものになります（この例では ``.fc28`` というサフィックスにより示されるバージョンです）。
@z

@x
    b. Install a specific version by its fully qualified package name, which is
       the package name (`docker-ce`) plus the version string (2nd column) up to
       the first hyphen, separated by a hyphen (`-`), for example,
       `docker-ce-3:18.09.1`.
@y
    {% comment %}
    b. Install a specific version by its fully qualified package name, which is
       the package name (`docker-ce`) plus the version string (2nd column) up to
       the first hyphen, separated by a hyphen (`-`), for example,
       `docker-ce-3:18.09.1`.
    {% endcomment %}
    b. 特定のバージョンをインストールする場合は、有効なパッケージ名を用います。
       これはパッケージ名（`docker-ce`）に加えて、バージョン文字列（２項目め）の初めのコロン（`:`）から初めのハイフン（`-`）までを、ハイフンでつなげます。
       たとえば `docker-ce-3:18.09.1` となります。
@z

@x
    ```bash
    $ sudo dnf -y install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
    ```
@y
    ```bash
    $ sudo dnf -y install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
    ```
@z

@x
    Docker is installed but not started. The `docker` group is created, but no users are added to the group.
@y
    {% comment %}
    Docker is installed but not started. The `docker` group is created, but no users are added to the group.
    {% endcomment %}
    Docker はインストールされましたが、まだ起動はしていません。
    グループ ``docker`` が追加されていますが、このグループにはまだユーザーが存在していない状態です。
@z

@x
3.  Cgroups Exception:
    For Fedora 31 and higher, you need to enable the [backward compatibility for Cgroups](https://fedoraproject.org/wiki/Common_F31_bugs#Other_software_issues).
@y
3.  Cgroups Exception:
    For Fedora 31 and higher, you need to enable the [backward compatibility for Cgroups](https://fedoraproject.org/wiki/Common_F31_bugs#Other_software_issues).
@z

@x
    ```bash
    $ sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
    ```
@y
    ```bash
    $ sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
    ```
@z

@x
    After running the command, you must reboot for the changes to take effect.
@y
    After running the command, you must reboot for the changes to take effect.
@z

@x
4.  Start Docker.
@y
{% comment %}
4.  Start Docker.
{% endcomment %}
4.  Docker を起動します。
@z

@x
    ```bash
    $ sudo systemctl start docker
    ```
@y
    ```bash
    $ sudo systemctl start docker
    ```
@z

@x
5.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
{% comment %}
5.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
{% endcomment %}
5.  Docker Engine が正しくインストールされているのを確認するため、`hello-world` イメージを実行します。
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
Docker Engine is installed and running. You need to use `sudo` to run Docker
commands. Continue to [Linux postinstall](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@y
{% comment %}
Docker Engine is installed and running. You need to use `sudo` to run Docker
commands. Continue to [Linux postinstall](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
{% endcomment %}
Docker Engine がインストールされ、実行できました。
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
To upgrade Docker Engine, follow the [installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@y
{% comment %}
To upgrade Docker Engine, follow the [installation instructions](#install-using-the-repository),
choosing the new version you want to install.
{% endcomment %}
Docker Engine をアップグレードするには、[インストール手順](#install-using-the-repository) に従って、インストールしたい新たなバージョンを選んでください。
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
If you cannot use Docker's repository to install Docker, you can download the
`.rpm` file for your release and install it manually. You need to download
a new file each time you want to upgrade Docker Engine.
@y
{% comment %}
If you cannot use Docker's repository to install Docker, you can download the
`.rpm` file for your release and install it manually. You need to download
a new file each time you want to upgrade Docker Engine.
{% endcomment %}
Docker リポジトリを利用した Docker インストールができない場合は、目的とするリリースの `.rpm` ファイルをダウンロードして、手動でインストールする方法があります。この場合 Docker Engine をアップグレードするには、毎回新たな `.rpm` ファイルをダウンロードして利用することになります
@z

@x
1.  Go to [{{ download-url-base }}/]({{ download-url-base }}/){: target="_blank" class="_" }
    and choose your version of Fedora. Then browse to `x86_64/stable/Packages/`
    and download the `.rpm` file for the Docker version you want to install.
@y
{% comment %}
1.  Go to [{{ download-url-base }}/]({{ download-url-base }}/){: target="_blank" class="_" }
    and choose your version of Fedora. Then browse to `x86_64/stable/Packages/`
    and download the `.rpm` file for the Docker version you want to install.
{% endcomment %}
1.  [{{ download-url-base }}/]({{ download-url-base }}/) にアクセスして、インストールしている Fedora のバージョンを選択します。
    そして `x86_64/stable/Packages/` を表示し、インストールしたい `.rpm` ファイルをダウンロードします。
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
    > **メモ**:  **最新版** または **テスト版**（プレリリース版）パッケージをインストールする場合は
    > URL 内の `stable` を `nightly` または `test` に変更してください。
    > [**最新版**と**テスト版**チャンネルを学ぶにはこちら](index.md)。
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
    $ sudo dnf -y install /path/to/package.rpm
    ```
@y
    ```bash
    $ sudo dnf -y install /path/to/package.rpm
    ```
@z

@x
    Docker is installed but not started. The `docker` group is created, but no
    users are added to the group.
@y
    {% comment %}
    Docker is installed but not started. The `docker` group is created, but no
    users are added to the group.
    {% endcomment %}
    Docker はインストールされましたが、まだ起動はしていません。
    またグループ `docker` は生成されましたが、このグループにユーザーは何も追加されていません。
@z

@x
3.  Start Docker.
@y
{% comment %}
3.  Start Docker.
{% endcomment %}
3.  Docker を起動します。
@z

@x
    ```bash
    $ sudo systemctl start docker
    ```
@y
    ```bash
    $ sudo systemctl start docker
    ```
@z

@x
4.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
{% comment %}
4.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
{% endcomment %}
4.  Docker Engine が正しくインストールされているのを確認するため `hello-world` イメージを実行します。
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
Docker Engine is installed and running. You need to use `sudo` to run Docker commands.
Continue to [Post-installation steps for Linux](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@y
{% comment %}
Docker Engine is installed and running. You need to use `sudo` to run Docker commands.
Continue to [Post-installation steps for Linux](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
{% endcomment %}
Docker Engine がインストールされ、実行できました。
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
[installation procedure](#install-from-a-package), using `dnf -y upgrade`
instead of `dnf -y install`, and pointing to the new file.
@y
{% comment %}
To upgrade Docker Engine, download the newer package file and repeat the
[installation procedure](#install-from-a-package), using `dnf -y upgrade`
instead of `dnf -y install`, and pointing to the new file.
{% endcomment %}
Docker Engine をアップグレードする場合は、新たなパッケージファイルをダウンロードして、[インストール手順](#install-from-a-package) をもう一度行います。
その際には `dnf -y install` でなく `dnf -y upgrade` を実行します。
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
    $ sudo dnf remove docker-ce docker-ce-cli containerd.io
    ```
@y
    ```bash
    $ sudo dnf remove docker-ce docker-ce-cli containerd.io
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
    ```
@y
    ```bash
    $ sudo rm -rf /var/lib/docker
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
- [Linux のインストール後](linux-postinstall.md) へ進む
- [Docker を用いた開発](../../develop/index.md) における各項目を参照してください。
  Docker を使ったアプリケーションの構築方法を学びます。
@z
