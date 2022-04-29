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
- On Linux systems, you can install Docker Compose with the Docker Engine using the 
[convenience script](../engine/install/index.md#server){: target="_blank" rel="noopener" class="_"}. Select the install Docker Engine page for your distribution and then look for instructions on installing using the convenience script.  
Otherwise, you should first install the [Docker Engine](../engine/install/index.md#server){: target="_blank" rel="noopener" class="_"}
for your OS and then refer to this page for
instructions on installing Compose on
Linux systems.
@y
- Linux では Docker Engine を利用する Docker Compose を、[便利スクリプト](../engine/install/index.md#server){: target="_blank" rel="noopener" class="_"} を使ってインストールできます。
  Docker Engine のページからディストリビューションに合ったものを選んで、便利スクリプトを使ったインストール手順を探し出してください。
  上を行わない場合は、各 OS 向けの [Docker Engine](../engine/install/index.md#server){: target="_blank" rel="noopener" class="_"} を初めにインストールした上で、このページに戻って Linux システム上に Compose をインストールする手順を進める必要があります。
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
Follow the instructions below to install Compose on Mac, Windows, Windows Server, or Linux systems.
@y
以下に示す手順を通して Mac、Windows、Windows Server、Linux に Compose をインストールします。
@z

@x
> Install a different version
>
> The instructions below outline installation of the current stable release
> (**{{site.compose_version}}**) of Compose. To install a different version of
> Compose, replace the given release number with the one that you want.
>
> Compose releases are also listed and available for direct download on the
> [Compose repository release page on GitHub](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"}.
@y
> 別バージョンのインストール
>
> 以降に示す手順は Compose の現時点での最新安定版（**{{site.compose_version}}**）に基づいたものです。
> これ以外のバージョンをインストールする場合は、記述されているリリース番号を、目的とするものに置き換えてください。
>
> Compose のリリースは [GitHub 上の Compose リポジトリのリリースページ](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"} においても一覧が示され利用可能です。
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#macOS">Mac</a></li>
<li><a data-toggle="tab" data-target="#windows">Windows</a></li>
<li><a data-toggle="tab" data-target="#windows-server">Windows Server</a></li>
<li><a data-toggle="tab" data-target="#linux">Linux</a></li>
<li><a data-toggle="tab" data-target="#linux-standalone">Linux Standalone binary</a></li>
</ul>
<div class="tab-content">
<div id="macOS" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#macOS">Mac</a></li>
<li><a data-toggle="tab" data-target="#windows">Windows</a></li>
<li><a data-toggle="tab" data-target="#windows-server">Windows Server</a></li>
<li><a data-toggle="tab" data-target="#linux">Linux</a></li>
<li><a data-toggle="tab" data-target="#linux-standalone">Linux スタンドアロンライブラリ</a></li>
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
    Compose ({{site.compose_version}}):
@y
    そして以下のコマンドを実行して Compose の現時点での最新版（{{site.compose_version}}）をダウンロードします。
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
    > **Note**
    >
    > On Windows Server 2019, you can add the Compose executable to `$Env:ProgramFiles\Docker`. Because this directory is  registered in the system `PATH`, you can run the `docker-compose --version` command on the subsequent step with no additional configuration.
@y
    > **メモ**
    >
    > Windows Server 2019 の場合は、Compose の実行パスとして`$Env:ProgramFiles\Docker`を加えます。
    > このディレクトリはシステムの`PATH`に登録されるので、この後の手順における`docker-compose --version`コマンドが、他になにも設定せずに実行できるようになります。
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
    ```console
    $ docker compose version
    Docker Compose version {{site.compose_version}}
    ```
@y
    ```console
    $ docker compose version
    Docker Compose version {{site.compose_version}}
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
[Compose repository release page on GitHub](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"} and copying it into `$HOME/.docker/cli-plugins` as `docker-compose`.
Follow the instructions from the link, which involve running the `curl` command
in your terminal to download the binaries. These step-by-step instructions are
also included below.
@y
Linux の場合は、[GitHub 上の Compose リポジトリのリリースページ](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"} から Docker Compose の実行バイナリをダウンロードして、`$HOME/.docker/cli-plugins`ディレクトリに`docker-compose`としてコピーします。
リンク先の手順では、端末画面上から`curl`コマンドを使ってダウンロードを行います。
その手順は以下にも示します。
@z

@x
1.  Run this command to download the current stable release of Docker Compose:
@y
1.  以下のコマンドを実行して Docker Compose の現時点での最新安定版をダウンロードします。
@z

@x
    ```console
    $ DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    $ mkdir -p $DOCKER_CONFIG/cli-plugins
    $ curl -SL https://github.com/docker/compose/releases/download/{{site.compose_version}}/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
@y
    ```console
    $ DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    $ mkdir -p $DOCKER_CONFIG/cli-plugins
    $ curl -SL https://github.com/docker/compose/releases/download/{{site.compose_version}}/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
@z

@x
    This command installs Compose for the active user under `$HOME` directory. To install Docker Compose for all users on your system, replace `~/.docker/cli-plugins` with `/usr/local/lib/docker/cli-plugins`.
@y
    このコマンドによって、アクティブユーザーの`$HOME`ディレクトリ配下に Compose がインストールされます。
    システム上の全ユーザー向けに Docker Compose をインストールする場合は、`~/.docker/cli-plugins`の部分を`/usr/local/lib/docker/cli-plugins`に置き換えます。
@z

@x
    > To install a different version of Compose, substitute `{{site.compose_version}}`
    > with the version of Compose you want to use.
@y
    > Compose の別バージョンをインストールする場合は、`{{site.compose_version}}`の部分を、インストールしたい Compose バージョンに置き換えてください。
@z

@x
2. Apply executable permissions to the binary:
@y
2. 実行バイナリに対して実行権限を与えます。
@z

@x
     ```console
    $ chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
@y
     ```console
    $ chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
@z

@x
    or if you choose to install Compose for all users
@y
    全ユーザー向けの Compose インストールを行う場合には以下とします。
@z

@x
    ```console
    $ sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
    ```
@y
    ```console
    $ sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
    ```
@z

@x
3. Test the installation.
@y
3. インストール結果をテストします。
@z

@x
    ```console
    $ docker compose version
    Docker Compose version {{site.compose_version}}
    ```
@y
    ```console
    $ docker compose version
    Docker Compose version {{site.compose_version}}
    ```
@z

@x
</div>
<div id="linux-standalone" class="tab-pane fade" markdown="1">
@y
</div>
<div id="linux-standalone" class="tab-pane fade" markdown="1">
@z

@x
### Install Compose as standalone binary on Linux systems
@y
{: #install-compose-as-standalone-binary-on-linux-systems }
### Linux システム上でのスタンドアロンの Compose バイナリのインストール
@z

@x
You can use Compose as a standalone binary without installing the Docker CLI.
@y
Docker CLI をインストールせずに、スタンドアロンの Compose バイナリを使うこともできます。
@z

@x
1. Run this command to download the current stable release of Docker Compose:
@y
1. 以下のコマンドを実行して Docker Compose の現時点での最新安定版をダウンロードします。
@z

@x
  ```console
  $ curl -SL https://github.com/docker/compose/releases/download/{{site.compose_version}}/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  ```
@y
  ```console
  $ curl -SL https://github.com/docker/compose/releases/download/{{site.compose_version}}/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  ```
@z

@x
  > To install a different version of Compose, substitute `{{site.compose_version}}`
  > with the version of Compose you want to use.
@y
    > Compose の別バージョンをインストールする場合は、`{{site.compose_version}}`の部分を、インストールしたい Compose バージョンに置き換えてください。
@z

@x
2. Apply executable permissions to the binary:
@y
2. 実行バイナリに対して実行権限を与えます。
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
  > **Note**:
  >
  > If the command `docker-compose` fails after installation, check your path.
  > You can also create a symbolic link to `/usr/bin` or any other directory in your path.
  >
  > For example:
  > ```console
  > $ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  > ```
@y
  > **メモ**
  >
  > インストールした後にコマンド`docker-compose`の実行が失敗する場合は、パスを確認してください。
  > `/usr/bin`あるいはパス上の別ディレクトリへのシンボリックリンクを生成して対処することもできます。
  >
  > たとえば以下です。
  > ```console
  > $ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  > ```
@z

@x
3. Test the installation.
@y
3. インストール結果をテストします。
@z

@x
    ```console
    $ docker-compose --version
    Docker Compose version {{site.compose_version}}
    ```
@y
    ```console
    $ docker-compose --version
    Docker Compose version {{site.compose_version}}
    ```
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
$ rm $DOCKER_CONFIG/cli-plugins/docker-compose
```
@y
```console
$ rm $DOCKER_CONFIG/cli-plugins/docker-compose
```
@z

@x
or if you choose to install Compose for all users  
@y
全ユーザー向けの Compose インストールを行う場合には以下とします。
@z

@x
```console
$ sudo rm /usr/local/lib/docker/cli-plugins/docker-compose
```
@y
```console
$ sudo rm /usr/local/lib/docker/cli-plugins/docker-compose
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
