%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to install Docker Desktop on Mac
keywords: mac, install, download, run, docker, local
title: Install Docker Desktop on Mac
---
@y
---
description: Docker Desktop の Mac へのインストール方法を説明します。
keywords: mac, install, download, run, docker, local
title: Docker Desktop の Mac へのインストール
---
@z

@x
Welcome to Docker Desktop for Mac. This page contains information about Docker Desktop for Mac system requirements, download URLs, installation instructions, and automatic updates.
@y
Docker Desktop for Mac へようこそ。
このページでは Docker Desktop for Mac のシステム要件、ダウンロード URL、インストール手順、自動アップデートについて説明します。
@z

@x
Download Docker Desktop for Mac:
@y
Docker Desktop for Mac は以下からダウンロードします。
@z

@x
[Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .button .primary-btn}
[Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .button .primary-btn}
@y
[Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .button .primary-btn}
[Apple チップの Mac](https://desktop.docker.com/mac/stable/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .button .primary-btn}
@z

@x
{% include eula.md %}
@y
{% include eula.md %}
@z

@x
## System requirements
@y
{: #system-requirements }
## システム要件
@z

@x
Your Mac must meet the following requirements to successfully install Docker Desktop.
@y
Docker Desktop を Mac に正常にインストールするには、以下のシステム要件が満たされている必要があります。
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#mac-intel">Mac with Intel chip</a></li>
<li><a data-toggle="tab" data-target="#mac-apple-silicon">Mac with Apple silicon</a></li>
</ul>
<div class="tab-content">
<div id="mac-intel" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#mac-intel">Intel チップの Mac</a></li>
<li><a data-toggle="tab" data-target="#mac-apple-silicon">Apple silicon の Mac</a></li>
</ul>
<div class="tab-content">
<div id="mac-intel" class="tab-pane fade in active" markdown="1">
@z

@x
### Mac with Intel chip
@y
{: #mac-with-Intel-chip }
### Intel チップの Mac
@z

@x
- **macOS must be version 10.14 or newer**. That is, Mojave, Catalina, or Big Sur. We recommend upgrading to the latest version of macOS.
@y
- **macOS はバージョン 10.14 またはそれ以降であること**。
  つまり Catalina、Mojave、Big Sur であることが必要です。
  macOS は最新バージョンにアップグレードすることをお勧めします。
@z

@x
  If you experience any issues after upgrading your macOS to version 10.15, you must install the latest version of Docker Desktop to be compatible with this version of macOS.
@y
  macOS をバージョン 10.15 にアップグレードしたときに問題が発生した場合は、その macOS のバージョンと互換性のある、最新の Docker Desktop をインストールすることが必要になります。
@z

@x
  > **Note**
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases). Docker Desktop currently supports macOS Mojave, macOS Catalina, and macOS Big Sur.
@y
  > **メモ**
  >
  > Docker では、ほぼ最新の macOS であれば Docker Desktop をサポートしています。
  > 具体的には、現状最新の macOS とその前の 2 つのリリースまで含みます。
  > 最新の macOS バージョンが利用可能となっているため、Docker では古いバージョンへのサポートは取りやめとし、最新バージョン（それに加えて直前の 2 リリース）のみをサポートすることにします。
  > Docker Desktop が現時点でサポートするのは、macOS Mojave、macOS Catalina、macOS Big Sur です。
@z

@x
- At least 4 GB of RAM.
@y
- RAM 容量は最低でも 4GB
@z

@x
- VirtualBox prior to version 4.3.30 must not be installed as it is not compatible with Docker Desktop.
@y
- VirtualBox バージョン 4.3.30 以前はインストールしないでください。
  Docker Desktop との互換性がないからです。
@z

@x
</div>
<div id="mac-apple-silicon" class="tab-pane fade" markdown="1">
@y
</div>
<div id="mac-apple-silicon" class="tab-pane fade" markdown="1">
@z

@x
### Mac with Apple silicon
@y
{: #mac-with-apple-silicon }
### Apple silicon の Mac
@z

@x
- You must install **Rosetta 2** as some binaries are still Darwin/AMD64. To install Rosetta 2 manually from the command line, run the following command:
@y
- バイナリの中に Darwin/AMD64 向けのものが残っているため **Rosetta 2** のインストールが必要です。
  Rosetta 2 のインストールはコマンドラインから手動で、以下のようにして行います。
@z

@x
  ```bash
    softwareupdate --install-rosetta
  ```
@y
  ```bash
    softwareupdate --install-rosetta
  ```
@z

@x
 For more information, see [Docker Desktop for Apple silicon](apple-silicon.md).
@y
 詳しくは [Docker Desktop for Apple silicon](apple-silicon.md) を参照してください。
@z

@x
</div>
</div>
@y
</div>
</div>
@z

@x
## What's included in the installer
@y
{: #whats-included-in-the-installer }
## インストーラーに含まれるもの
@z

@x
The Docker Desktop installation includes
  [Docker Engine](../engine/index.md), Docker CLI client,
  [Docker Compose](../compose/index.md), [Docker Content Trust](../engine/security/trust/index.md), [Kubernetes](https://github.com/kubernetes/kubernetes/), and [Credential Helper](https://github.com/docker/docker-credential-helpers/).
@y
Docker Desktop のインストールにより以下のものが利用できます。
  [Docker Engine](../engine/index.md)、Docker CLI クライアント、
  [Docker Compose](../compose/index.md)、[Docker コンテントトラスト](../engine/security/trust/index.md)、[Kubernetes](https://github.com/kubernetes/kubernetes/)、[Credential Helper](https://github.com/docker/docker-credential-helpers/)。
@z

@x
## Install and run Docker Desktop on Mac
@y
{: #install-and-run-docker-desktop-on-Mac }
## Docker Desktop の Mac へのインストールと実行
@z

@x
1. Double-click `Docker.dmg` to open the installer, then drag the Docker icon to
    the Applications folder.
@y
1. `Docker.dmg`をダブルクリックしてインストーラーを開きます。
    Docker アイコンをアプリケーションフォルダーへドラッグします。
@z

@x
      ![Install Docker app](images/docker-app-drag.png)
@y
      ![Docker アプリのインストール](images/docker-app-drag.png)
@z

@x
2. Double-click `Docker.app` in the Applications folder to start Docker. (In the example below, the Applications folder is in "grid" view mode.)
@y
2. アプリケーションフォルダー内の`Docker.app`をダブルクリックして Docker を起動します。
    （以下の例において、アプリケーションフォルダーは「グリッド」表示モードにしています。）
@z

@x
    ![Docker app in Hockeyapp](images/docker-app-in-apps.png)
@y
    ![Hockeyapp 内の Docker](images/docker-app-in-apps.png)
@z

@x
    The Docker menu in the top status bar indicates that Docker Desktop is running, and accessible from a terminal.
@y
    最上段のスタータスバーにある Docker メニューには Docker Desktop が起動していることが示されているので、ターミナル画面からアクセスすることができます。
@z

@x
      ![Whale in menu bar](images/whale-in-menu-bar.png)
@y
      ![メニューバー内のクジラアイコン](images/whale-in-menu-bar.png)
@z

@x
    If you've just installed the app, Docker Desktop launches the onboarding tutorial. The tutorial includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
@y
    インストーラーによるインストールを終えたら、Docker Desktop はオンボードのチュートリアルを開始します。
    このチュートリアルでは、単純な課題を通じてサンプルの Docker イメージを構築し、コンテナーとして実行、そのイメージを Docker Hub にプッシュして保存することを行います。
@z

@x
    ![Docker Quick Start tutorial](images/docker-tutorial-mac.png)
@y
    ![Docker クィックスタートチュートリアル](images/docker-tutorial-mac.png)
@z

@x
3. Click the Docker menu (![whale menu](images/whale-x.png){: .inline}) to see
**Preferences** and other options.
@y
3.  Docker メニュー (![クジラメニュー](images/whale-x.png){: .inline}) をクリックして、**Preferences** やその他のオプションを確認します。
@z

@x
4. Select **About Docker** to verify that you have the latest version.
@y
4.  **About Docker** をクリックして、最新版を入手していることを確認します。
@z

@x
Congratulations! You are now successfully running Docker Desktop.
@y
おめでとうございます！
Docker Desktop を正常に実行することができました。
@z

@x
If you would like to rerun the tutorial, go to the Docker Desktop menu 
and select **Learn**.
@y
チュートリアルを再実行したい場合は Docker Desktop メニューから **Learn** を実行してください。
@z

@x
## Updates
@y
{: #updates }
## アップデート
@z

@x
{% include desktop-update.md %}
@y
{% include desktop-update.md %}
@z

@x
## Uninstall Docker Desktop
@y
## Docker Desktop のアンインストール
{: #uninstall-docker-desktop }
@z

@x
To uninstall Docker Desktop from your Mac:
@y
Mac から Docker Desktop をアンインストールするには以下を実行します。
@z

@x
1. From the Docker menu, select **Troubleshoot** and then select **Uninstall**.
2. Click **Uninstall** to confirm your selection.
@y
1. Docker メニューから **Troubleshoot**、**Uninstall** を選択します。
2. 選択が正しければ **Uninstall** をクリックします。
@z

@x
> **Important**
>
> Uninstalling Docker Desktop destroys Docker containers, images, volumes, and
> other Docker related data local to the machine, and removes the files generated
> by the application. Refer to the [back up and restore data](../desktop/backup-and-restore.md)
> section to learn how to preserve important data before uninstalling.
@y
> **重要**
>
> Docker Desktop をアンインストールすると、ローカルにある Docker コンテナー、イメージ、ボリューム、その他 Docker 関連データは破棄され、アプリケーションが生成したファイルは削除されます。
> アンインストールによって大切なデータを失わないように、[バックアップとリストア](../desktop/backup-and-restore.md) の手順を確認してください。
@z

@x
## Where to go next
@y
{: #where-to-go-next }
## 次に読むものは
@z

@x
- [Getting started](index.md) provides an overview of Docker Desktop on Mac, basic Docker command examples, how to get help or give feedback, and links to other topics about Docker Desktop on Mac.
- [Docker Desktop for Apple silicon](apple-silicon.md) for detailed information about Docker Desktop for Apple silicon.
- [Troubleshooting](troubleshoot.md) describes common problems, workarounds, how
  to run and submit diagnostics, and submit issues.
- [FAQs](../desktop/faqs.md) provide answers to frequently asked questions.
- [Release notes](release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Get started with Docker](../get-started/index.md) provides a general Docker tutorial.
* [Back up and restore data](../desktop/backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@y
- [はじめよう](index.md)では Mac 上での Docker Desktop の概要、基本的な Docker コマンド例、ヘルプを得たりフィードバックを行う方法、また Mac 上の Docker Desktop に関する他のトピックへのリンクを示しています。
- [Docker Desktop for Apple silicon](apple-silicon.md) では、Docker Desktop for Apple silicon について詳細に説明しています。
- [トラブルシューティング](troubleshoot.md) では一般的な質問、解決方法、診断実行や課題送信などを示しています。
- [FAQ](../desktop/faqs.md) はよくたずねられる質問とその回答を示します。
- [リリースノート](release-notes.md) では Docker Desktop リリースに関連したコンポーネントのアップデート、新機能、改善機能を示しています。
- [Docker をはじめよう](../get-started/index.md) は Docker の全般的なチュートリアルです。
* [バックアップとリストア](../desktop/backup-and-restore.md) は Docker に関するデータのバックアップとリストア手順について説明しています。
@z
