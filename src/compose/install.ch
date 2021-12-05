%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to install Docker Compose
keywords: compose, orchestration, install, installation, docker, documentation
title: Install Docker Compose
toc_max: 2
---
@y
---
description: Docker Compose のインストール方法。
keywords: compose, orchestration, install, installation, docker, documentation
title: Docker Compose のインストール
toc_max: 2
---
@z

@x
> **Accelerating new features in Docker Desktop**
>
> Docker Desktop helps you build, share, and run containers easily on Mac and Windows as you do on Linux. Docker handles the complex setup and allows you to focus on writing the code. Thanks to the positive support we received on the [subscription updates](https://www.docker.com/blog/updating-product-subscriptions/){: target="_blank" rel="noopener" class="_" id="dkr_docs_cta"}, we've started working on [Docker Desktop for Linux](https://www.docker.com/blog/accelerating-new-features-in-docker-desktop/){: target="_blank" rel="noopener" class="_" id="dkr_docs_cta"} which is the second-most popular feature request in our public roadmap. If you are interested in early access, sign up for our [Developer Preview program](https://www.docker.com/community/get-involved/developer-preview){: target="_blank" rel="noopener" class="_" id="dkr_docs_cta"}.
{: .important}
@y
> **Accelerating new features in Docker Desktop**
>
> Docker Desktop は、Linux 上と同じように Mac や Windows 上でも、コンテナーのビルド、共有、実行を可能にします。
> Docker は複雑な設定であっても、ユーザーがコードを書くことだけに専念させてくれます。
> [サブスクリプションの更新](https://www.docker.com/blog/updating-product-subscriptions/){: target="_blank" rel="noopener" class="_" id="dkr_docs_cta"} から得られた積極的なサポートのおかげで、[Docker Desktop for Linux](https://www.docker.com/blog/accelerating-new-features-in-docker-desktop/){: target="_blank" rel="noopener" class="_" id="dkr_docs_cta"} の開発に着手しました。
> これは公開ロードマップにおいて、2 番めに人気のある機能リクエストです。
> すぐにでも体験してみたいという方は、[Developer Preview program](https://www.docker.com/community/get-involved/developer-preview){: target="_blank" rel="noopener" class="_" id="dkr_docs_cta"}（開発者プレビュープログラム）にサインアップしてください。
{: .important}
@z

@x
This page contains information on how to install Docker Compose. You can run Compose on macOS, Windows, and 64-bit Linux.
@y
本ページでは、Docker Compose のインストール方法について説明します。
Docker Compose は macOS、Windows、64 ビット Linux で動作します。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Docker Compose relies on Docker Engine for any meaningful work, so make sure you
have Docker Engine installed either locally or remote, depending on your setup.
@y
Docker Compose は重要な処理を Docker Engine に委ねています。
したがって Docker Engine がインストールされていることを確認します。
それはローカル、リモートいずれでも、設定次第で可能です。
@z

@x
- On desktop systems like Docker Desktop for Mac and Windows, Docker Compose is
included as part of those desktop installs.
@y
- Docker Desktop for Mac、Docker Desktop for Windows のようなデスクトップシステムにおいては、インストールの一部として Docker Compose が含まれています。
@z

@x
- On Linux systems, first install the
[Docker Engine](../engine/install/index.md#server){: target="_blank" rel="noopener" class="_"}
for your OS as described on the Get Docker page, then come back here for
instructions on installing Compose on
Linux systems.
@y
- Linux システムではまず、 Docker 入手のページに説明されている各 OS 向けの [Docker Engine](../engine/install/index.md#server){: target="_blank" rel="noopener" class="_"} をインストールします。
そしてこのページに戻り、Linux システム上での Compose のインストール手順に従います。
@z

@x
- To run Compose as a non-root user, see [Manage Docker as a non-root user](../engine/install/linux-postinstall.md).
@y
Compose をルートユーザー以外で起動するには、[ルートユーザー以外による Docker の管理](../engine/install/linux-postinstall.md) を参照してください。
@z

@x
## Install Compose
@y
## Compose のインストール
{: #install-compose }
@z

@x
Follow the instructions below to install Compose on Mac, Windows, Windows Server
2016, or Linux systems, or find out about alternatives like using the `pip`
Python package manager or installing Compose as a container.
@y
以下に示す手順を通して Mac、Windows、Windows Server 2016、Linux に Compose をインストールします。
またその他の方法として Python パッケージマネージャー`pip`を使う方法や、コンテナーとして Compose をインストール方法もあります。
@z

@x
> Install a different version
>
> The instructions below outline installation of the current stable release
> (**v{{site.compose_version}}**) of Compose. To install a different version of
> Compose, replace the given release number with the one that you want. For instructions to install Compose 2.0.0 on Linux, see [Install Compose 2.0.0 on Linux](cli-command.md#install-on-linux).
>
> Compose releases are also listed and available for direct download on the
> [Compose repository release page on GitHub](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"}.
> To install a **pre-release** of Compose, refer to the [install pre-release builds](#install-pre-release-builds)
> section.
@y
> 別バージョンのインストール
>
> 以降に示す手順は Compose の現時点での最新安定版（**v{{site.compose_version}}**）に基づいたものです。
> これ以外のバージョンをインストールする場合は、記述されているリリース番号を、目的とするものに置き換えてください。
> Linux 上に Compose 2.0.0 をインストールする手順については、[Linux への Compose 2.0.0 のインストール](cli-command.md#install-on-linux) を参照してください。
>
> Compose のリリースは [GitHub 上の Compose リポジトリのリリースページ](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"} においても一覧が示され利用可能です。
> Compose の**プレリリース版**をインストールする場合は、[プレリリース版のインストール](#install-pre-release-builds)の説明を参照してください。
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#macOS">Mac</a></li>
<li><a data-toggle="tab" data-target="#windows">Windows</a></li>
<li><a data-toggle="tab" data-target="#windows-server">Windows Server</a></li>
<li><a data-toggle="tab" data-target="#linux">Linux</a></li>
<li><a data-toggle="tab" data-target="#alternatives">Alternative install options</a></li>
<li><a data-toggle="tab" data-target="#pre-release">Pre-release builds</a></li>
</ul>
<div class="tab-content">
<div id="macOS" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#macOS">Mac</a></li>
<li><a data-toggle="tab" data-target="#windows">Windows</a></li>
<li><a data-toggle="tab" data-target="#windows-server">Windows Server</a></li>
<li><a data-toggle="tab" data-target="#linux">Linux</a></li>
<li><a data-toggle="tab" data-target="#alternatives">その他のインストール</a></li>
<li><a data-toggle="tab" data-target="#pre-release">プレリリースビルド</a></li>
</ul>
<div class="tab-content">
<div id="macOS" class="tab-pane fade in active" markdown="1">
@z

@x
### Install Compose on macOS
@y
### macOS への Compose インストール
{: #install-compose-on-macos }
@z

@x
**Docker Desktop for Mac** includes Compose along
with other Docker apps, so Mac users do not need to install Compose separately.
For installation instructions, see [Install Docker Desktop on Mac](../desktop/mac/install.md).
@y
**Docker Desktop for Mac** には他の Docker アプリとともに Compose が含まれています。
したがって Mac ユーザーは Compose を個別にインストールする必要はありません。
インストール手順については [Docker Desktop on Mac のインストール](../desktop/mac/install.md) を参照してください。
@z

@x
</div>
<div id="windows" class="tab-pane fade" markdown="1">
@y
</div>
<div id="windows" class="tab-pane fade" markdown="1">
@z

@x
### Install Compose on Windows desktop systems
@y
### Windows デスクトップへの Compose インストール
{: #install-compose-on-windows-desktop-systems }
@z

@x
**Docker Desktop for Windows** includes Compose
along with other Docker apps, so most Windows users do not need to
install Compose separately. For install instructions, see [Install Docker Desktop on Windows](../desktop/windows/install.md).
@y
**Docker Desktop for Windows** には他の Docker アプリとともに Compose が含まれています。
したがって Windows ユーザーは Compose を個別にインストールする必要はありません。
インストール手順については [Install Docker Desktop on Windows](../desktop/windows/install.md) を参照してください。
@z

@x
If you are running the Docker daemon and client directly on Microsoft
Windows Server, follow the instructions in the Windows Server tab.
@y
Docker デーモンや Docker クライアントを Windows Server 上で直接起動している場合は、Windows Server のタブ内にある手順に従ってください。
@z

@x
</div>
<div id="windows-server" class="tab-pane fade" markdown="1">
@y
</div>
<div id="windows-server" class="tab-pane fade" markdown="1">
@z

@x
### Install Compose on Windows Server
@y
### Windows Server への Compose インストール
{: #install-compose-on-windows-server }
@z

@x
Follow these instructions if you are running the Docker daemon and client directly
on Microsoft Windows Server and want to install Docker Compose.
@y
Docker デーモンや Docker クライアントを Microsoft Windows Server 上で直接起動している場合、および Docker Compose をインストールしたい場合は、以下の手順に従ってください。
@z

@x
1.  Start an "elevated" PowerShell (run it as administrator).
    Search for PowerShell, right-click, and choose
    **Run as administrator**. When asked if you want to allow this app
    to make changes to your device, click **Yes**.
@y
1.  PowerShell を管理者権限で実行。
    PowerShell アイコンを見つけ、右クリックメニューから**管理者として実行**を選びます。
    このアプリによるデバイスへの変更の許可を問われたら**はい**をクリックします。
@z

@x
2.  In PowerShell, since GitHub now requires TLS1.2, run the following:
@y
2.  GitHub では TLS1.2 が必要となるので、PowerShell において以下を実行します。
@z

@x
    ```powershell  
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ```
@y
    ```powershell  
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ```
@z

@x
    Then run the following command to download the current stable release of
    Compose (v{{site.compose_version}}):
@y
    そして以下のコマンドを実行して Compose の現時点での最新版（v{{site.compose_version}}）をダウンロードします。
@z

@x
    ```powershell
    Invoke-WebRequest "https://github.com/docker/compose/releases/download/{{site.compose_version}}/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\Docker\docker-compose.exe
    ```
@y
    ```powershell
    Invoke-WebRequest "https://github.com/docker/compose/releases/download/{{site.compose_version}}/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\Docker\docker-compose.exe
    ```
@z

@x
**Note**: On Windows Server 2019, you can add the Compose executable to `$Env:ProgramFiles\Docker`. Because this directory is  registered in the system `PATH`, you can run the `docker-compose --version` command on the subsequent step with no additional configuration.
@y
    **メモ**: Windows Server 2019 の場合は、Compose の実行パスとして`$Env:ProgramFiles\Docker`を加えます。
     このディレクトリはシステムの`PATH`に登録されるので、この後の手順における`docker-compose --version`コマンドが、他になにも設定せずに実行できるようになります。
@z

@x
    > To install a different version of Compose, substitute `{{site.compose_version}}`
    > with the version of Compose you want to use.
@y
    > 別バージョンの Compose をインストールする場合は、`{{site.compose_version}}`の部分を、目的とするバージョンに置き換えてください。
@z

@x
3.  Test the installation.
@y
3.  インストール結果をテストします。
@z

@x
    ```powershell
    docker-compose --version
@y
    ```powershell
    docker-compose --version
@z

@x
    docker-compose version {{site.compose_version}}, build 01110ad01
    ```
@y
    docker-compose version {{site.compose_version}}, build 01110ad01
    ```
@z

@x
</div>
<div id="linux" class="tab-pane fade" markdown="1">
@y
</div>
<div id="linux" class="tab-pane fade" markdown="1">
@z

@x
### Install Compose on Linux systems
@y
### Linux システムへの Compose インストール
{: #install-compose-on-linux-systems }
@z

@x
On Linux, you can download the Docker Compose binary from the
[Compose repository release page on GitHub](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"}.
Follow the instructions from the link, which involve running the `curl` command
in your terminal to download the binaries. These step-by-step instructions are
also included below.
@y
Linux の場合は、[GitHub 上の Compose リポジトリのリリースページ](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"} から Docker Compose の実行バイナリをダウンロードします。
リンク先の手順では、端末画面上から`curl`コマンドを使ってダウンロードを行います。
その手順は以下にも示します。
@z

@x
> For `alpine`, the following dependency packages are needed:
> `py-pip`, `python3-dev`, `libffi-dev`, `openssl-dev`, `gcc`, `libc-dev`, `rust`, `cargo` and `make`.
{: .important}
@y
> `alpine`では以下に示す依存パッケージが必要です。
> `py-pip`、`python3-dev`、`libffi-dev`、`openssl-dev`、`gcc`、`libc-dev`、`rust`、`cargo`、`make`
{: .important}
@z

@x
1.  Run this command to download the current stable release of Docker Compose:
@y
1.  以下のコマンドを実行して Docker Compose の現時点での最新安定版をダウンロードします。
@z

@x
    ```console
    $ sudo curl -L "https://github.com/docker/compose/releases/download/{{site.compose_version}}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```
@y
    ```console
    $ sudo curl -L "https://github.com/docker/compose/releases/download/{{site.compose_version}}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```
@z

@x
    > To install a different version of Compose, substitute `{{site.compose_version}}`
    > with the version of Compose you want to use.
@y
    > 別バージョンの Compose をインストールする場合は、`{{site.compose_version}}`の部分を、目的とするバージョンに置き換えてください。
@z

@x
    If you have problems installing with `curl`, see
    [Alternative Install Options](install.md#alternative-install-options) tab above.
@y
    `curl`を使ったインストールに問題がある場合は、上のタブにある [その他のインストール](install.md#alternative-install-options) を確認してください。
@z

@x
2.  Apply executable permissions to the binary:
@y
2.  実行バイナリに対して実行権限を与えます。
@z

@x
    ```console
    $ sudo chmod +x /usr/local/bin/docker-compose
    ```
@y
    ```console
    $ sudo chmod +x /usr/local/bin/docker-compose
    ```
@z

@x
> **Note**: If the command `docker-compose` fails after installation, check your path.
> You can also create a symbolic link to `/usr/bin` or any other directory in your path.
@y
    > **メモ**: インストールした後に`docker-compose`の実行に失敗する場合は、パスを確認してください。
    > `/usr/bin`あるいはパス設定されているディレクトリへのシンボリックリンクを作る方法もあります。
@z

@x
For example:
@y
    たとえば以下のとおりです。
@z

@x
```console
$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
@y
```console
$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
@z

@x
3.  Optionally, install [command completion](completion.md) for the
    `bash` and `zsh` shell.
@y
3.  必要に応じて`bash`や`zsh`シェルに対する [コマンド補完](completion.md) をインストールします。
@z

@x
4.  Test the installation.
@y
4.  インストール結果をテストします。
@z

@x
    ```console
    $ docker-compose --version
    docker-compose version {{site.compose_version}}, build 1110ad01
    ```

</div>
<div id="alternatives" class="tab-pane fade" markdown="1">
@y
    ```console
    $ docker-compose --version
    docker-compose version {{site.compose_version}}, build 1110ad01
    ```

</div>
<div id="alternatives" class="tab-pane fade" markdown="1">
@z

@x
### Alternative install options
@y
### その他のインストール
{: #alternative-install-options }
@z

@x
- [Install using pip](#install-using-pip)
- [Install as a container](#install-as-a-container)
@y
- [pip を用いたインストール](#install-using-pip)
- [コンテナーとしてインストール](#install-as-a-container)
@z

@x
#### Install using pip
@y
#### pip を用いたインストール
{: #install-using-pip }
@z

@x
> For `alpine`, the following dependency packages are needed:
> `py-pip`, `python3-dev`, `libffi-dev`, `openssl-dev`, `gcc`, `libc-dev`, `rust`, `cargo`, and `make`.
{: .important}
@y
> `alpine`では、以下に示す依存パッケージが必要です。
> `py-pip`、`python3-dev`、`libffi-dev`、`openssl-dev`、`gcc`、`libc-dev`、`rust`、`cargo`、`make`
{: .important}
@z

@x
Compose can be installed from
[pypi](https://pypi.python.org/pypi/docker-compose) using `pip`. If you install
using `pip`, we recommend that you use a
[virtualenv](https://virtualenv.pypa.io/en/latest/) because many operating
systems have python system packages that conflict with docker-compose
dependencies. See the [virtualenv
tutorial](https://docs.python-guide.org/dev/virtualenvs/) to get
started.
@y
Compose は`pip`を使って [pypi](https://pypi.python.org/pypi/docker-compose) からインストールすることができます。
`pip`を使ったインストールでは [virtualenv](https://virtualenv.pypa.io/en/latest/) を用いることをお勧めします。
これは多くのオペレーティングシステムにおいて、python パッケージが docker-compose の依存パッケージと不整合を起こすことがあるからです。
[virtualenv チュートリアル](https://docs.python-guide.org/dev/virtualenvs/) から始めてみてください。
@z

@x
```console
$ pip3 install docker-compose
```
@y
```console
$ pip3 install docker-compose
```
@z

@x
If you are not using virtualenv,
@y
virtualenv を使わない場合は以下のようにします。
@z

@x
```console
$ sudo pip install docker-compose
```
@y
```console
$ sudo pip install docker-compose
```
@z

@x
> pip version 6.0 or greater is required.
@y
> pip のバージョンは 6.0 またはそれ以上が必要です。
@z

@x
#### Install as a container
@y
#### コンテナーとしてインストール
{: #install-as-a-container }
@z

@x
Compose can also be run inside a container, from a small bash script wrapper. To
install compose as a container run this command:
@y
Compose は 簡易な bash のラッパースクリプトを用いて、コンテナー内部にて実行することもできます。
コンテナーとして Compose をインストールするには、以下のコマンドを実行します。
@z

@x
```console
$ sudo curl -L --fail https://github.com/docker/compose/releases/download/{{site.compose_version}}/run.sh -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```
@y
```console
$ sudo curl -L --fail https://github.com/docker/compose/releases/download/{{site.compose_version}}/run.sh -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="pre-release" class="tab-pane fade" markdown="1">
@y
<div id="pre-release" class="tab-pane fade" markdown="1">
@z

@x
### Install pre-release builds
@y
{: #install-pre-release-builds }
### プレリリース版のインストール
@z

@x
If you're interested in trying out a pre-release build, you can download release
candidates from the [Compose repository release page on GitHub](https://github.com/docker/compose/releases){: target="_blank" rel="noopener" class="_"}.
Follow the instructions from the link, which involves running the `curl` command
in your terminal to download the binaries.
@y
プレリリース版を試してみたい方は [GitHub 上の Compose リポジトリのリリースページ](https://github.com/docker/compose/releases){: target="_blank" rel="noopener" class="_"} からリリース候補（release candidate）をダウンロードしてください。
リンク先の手順では、端末画面上から`curl`コマンドを使って実行バイナリをダウンロードします。
@z

@x
Pre-releases built from the "master" branch are also available for download at
[https://dl.bintray.com/docker-compose/master/](https://dl.bintray.com/docker-compose/master/){: target="_blank" rel="noopener" class="_"}.
@y
マスターブランチからビルドされたプレリリース版もあります。
[https://dl.bintray.com/docker-compose/master/](https://dl.bintray.com/docker-compose/master/){: target="_blank" rel="noopener" class="_"} からダウンロードしてください。
@z

@x
> Pre-release builds allow you to try out new features before they are released,
> but may be less stable.
{: .important}
@y
> プレリリース版では、正式リリース前に新機能を試すことができます。
> ただし安定しているかどうかはわかりません。
{: .important}
@z

@x
</div>
</div>

----
@y
</div>
</div>

----
@z

@x
## Upgrading
@y
## アップグレード
{: #upgrading }
@z

@x
If you're upgrading from Compose 1.2 or earlier, remove or
migrate your existing containers after upgrading Compose. This is because, as of
version 1.3, Compose uses Docker labels to keep track of containers, and your
containers need to be recreated to add the labels.
@y
Compose のバージョン 1.2 またはそれ以前からアップグレードを行う場合、アップグレードした後に既存のコンテナーは削除するか移行する必要があります。
Compose 1.3 からは Docker ラベルが導入されたためです。
このラベルとはコンテナーの追跡を行うものであり、古いコンテナーはこのラベルをつけて再生成する必要があります。
@z

@x
If Compose detects containers that were created without labels, it refuses
to run, so that you don't end up with two sets of them. If you want to keep using
your existing containers (for example, because they have data volumes you want
to preserve), you can use Compose 1.5.x to migrate them with the following
command:
@y
Docker ラベルを持っていないコンテナーであることが検出されると、Compose はそのようなコンテナーの実行を拒否するため利用することができません。
それまで使っていたコンテナーを引き続き利用したい場合（たとえばデータボリュームを用いてデータ保存をしている場合）、Compose 1.5.x を使って、以下のようなコマンドによりデータ移行を行うことができます。
@z

@x
```console
$ docker-compose migrate-to-labels
```
@y
```console
$ docker-compose migrate-to-labels
```
@z

@x
Alternatively, if you're not worried about keeping them, you can remove them.
Compose just creates new ones.
@y
コンテナーを維持しておく必要がないのであれば、削除するだけで構いません。
Compose は新しくコンテナーを生成してくれます。
@z

@x
```console
$ docker container rm -f -v myapp_web_1 myapp_db_1 ...
```
@y
```console
$ docker container rm -f -v myapp_web_1 myapp_db_1 ...
```
@z

@x
## Uninstallation
@y
## アンインストール
{: #uninstallation }
@z

@x
To uninstall Docker Compose if you installed using `curl`:
@y
`curl`を使って Docker Compose をインストールしていた場合は、次のようにしてアンインストールします。
@z

@x
```console
$ sudo rm /usr/local/bin/docker-compose
```
@y
```console
$ sudo rm /usr/local/bin/docker-compose
```
@z

@x
To uninstall Docker Compose if you installed using `pip`:
@y
`pip`を使って Docker Compose をインストールしていた場合は、次のようにしてアンインストールします。
@z

@x
```console
$ pip uninstall docker-compose
```
@y
```console
$ pip uninstall docker-compose
```
@z

@x
> Got a "Permission denied" error?
>
> If you get a "Permission denied" error using either of the above
> methods, you probably do not have the proper permissions to remove
> `docker-compose`. To force the removal, prepend `sudo` to either of the above
> commands and run again.
@y
> 「Permission denied」エラーが出たときは
>
> 上のコマンドのいずれかを実行したときに「Permission denied」エラーが発生したら、それは`docker-compose`を削除するための適切な権限がないことが考えられます。
> どうしても削除したいときは、上のコマンドの先頭に`sudo`をつけて、もう一度コマンドを実行してください。
@z

@x
## Where to go next
@y
## 次に読むものは
{: #where-to-go-next }
@z

@x
- [User guide](index.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
- [ユーザーガイド](index.md)
- [Compose をはじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
