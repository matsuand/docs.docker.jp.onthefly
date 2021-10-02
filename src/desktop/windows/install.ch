%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to install Docker Desktop for Windows
keywords: windows, install, download, run, docker, local
title: Install Docker Desktop on Windows
redirect_from:
- /docker-for-windows/install/
- /docker-ee-for-windows/install/
- /docker-for-windows/install-windows-home/
- /ee/docker-ee/windows/docker-ee/
- /engine/installation/windows/docker-ee/
- /install/windows/docker-ee/
- /install/windows/ee-preview/
---
@y
---
description: How to install Docker Desktop for Windows
keywords: windows, install, download, run, docker, local
title: Windows への Docker Desktop のインストール
redirect_from:
- /docker-for-windows/install/
- /docker-ee-for-windows/install/
- /docker-for-windows/install-windows-home/
- /ee/docker-ee/windows/docker-ee/
- /engine/installation/windows/docker-ee/
- /install/windows/docker-ee/
- /install/windows/ee-preview/
---
@z

@x
Welcome to Docker Desktop for Windows. This page contains information about Docker Desktop for Windows system requirements, download URL, instructions to install and update Docker Desktop for Windows.
@y
Docker Desktop for Windows へようこそ。
このページでは Docker Desktop for Windows のシステム要件、ダウンロード URL、インストール手順、アップデートについて説明します。
@z

@x
> Download Docker Desktop for Windows
>
> [Docker Desktop for Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe){: .button .primary-btn }
@y
> Docker Desktop for Windows のダウンロード
>
> [Docker Desktop for Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe){: .button .primary-btn }
@z

@x
## System requirements
@y
{: #system-requirements }
## システム要件
@z

@x
Your Windows machine must meet the following requirements to successfully install Docker Desktop.
@y
Docker Desktop を正常にインストールするためには Windows マシンが以下を満たしていることが必要です。
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#win-wsl2">WSL 2 backend</a></li>
<li><a data-toggle="tab" data-target="#win-hyper-v">Hyper-V backend and Windows containers</a></li>
</ul>
<div class="tab-content">
<div id="win-wsl2" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#win-wsl2">WSL 2 バックエンド</a></li>
<li><a data-toggle="tab" data-target="#win-hyper-v">Hyper-V バックエンドと Windows コンテナー</a></li>
</ul>
<div class="tab-content">
<div id="win-wsl2" class="tab-pane fade in active" markdown="1">
@z

@x
### WSL 2 backend
@y
{: #wsl-2-backend }
### WSL 2 バックエンド
@z

@x
- Windows 10 64-bit: Home or Pro 2004 (build 19041) or higher, or Enterprise or Education 1909 (build 18363) or higher.
- Enable the WSL 2 feature on Windows. For detailed instructions, refer to the
    [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10){: target="_blank" rel="noopener" class="_"}.
- The following hardware prerequisites are required to successfully run
WSL 2 on Windows 10:
@y
- Windows 10 64 ビット: Home または Pro 2004 (build 19041) またはそれ以降、
  Enterprise または Education 1909 (build 18363) またはそれ以降。
- Windows における WSL 2 機能の有効化。
  詳しくは [Microsoft のドキュメント](https://docs.microsoft.com/en-us/windows/wsl/install-win10){: target="_blank" rel="noopener" class="_"} を参照してください。
- Windows 10 上の WSL 2 を正常に実行するには、以下のハードウェア要件を満たす必要があります。
@z

@x
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation){: target="_blank" rel="noopener" class="_"}
  - 4GB system RAM
  - BIOS-level hardware virtualization support must be enabled in the
    BIOS settings.  For more information, see
    [Virtualization](troubleshoot.md#virtualization-must-be-enabled).
- Download and install the [Linux kernel update package](https://docs.microsoft.com/windows/wsl/wsl2-kernel){: target="_blank" rel="noopener" class="_"}.
@y
  - [第 2 レベルのアドレス変換](https://en.wikipedia.org/wiki/Second_Level_Address_Translation){: target="_blank" rel="noopener" class="_"}（Second Level Address Translation; SLAT）に対応した 64 ビットプロセッサー。
  - 4 GB のシステム RAM
  - BIOS 設定において BIOS レベルのハードウェア仮想化サポートが有効であること。
    詳しくは [仮想化機能](troubleshoot.md#virtualization-must-be-enabled) を参照してください。
- [Linux カーネルアップデートパッケージ](https://docs.microsoft.com/windows/wsl/wsl2-kernel){: target="_blank" rel="noopener" class="_"} のダウンロードとインストール。
@z

@x
</div>
<div id="win-hyper-v" class="tab-pane fade" markdown="1">
@y
</div>
<div id="win-hyper-v" class="tab-pane fade" markdown="1">
@z

@x
### Hyper-V backend and Windows containers
@y
{: #hyper-v-backend-and-windows-containers }
### Hyper-V バックエンドと Windows コンテナー
@z

@x
- Windows 10 64-bit: Pro 2004 (build 19041) or higher, or Enterprise or Education 1909 (build 18363) or higher.

  For Windows 10 Home, see [System requirements for WSL 2 backend](#wsl-2-backend).
@y
- Windows 10 64 ビット: Pro 2004 (build 19041) またはそれ以降、
  Enterprise または Education 1909 (build 18363) またはそれ以降。

  Windows 10 Home については [WSL 2 バックエンドにおけるシステム要件](#wsl-2-backend) を参照してください。
@z

@x
- Hyper-V and Containers Windows features must be enabled.
- The following hardware prerequisites are required to successfully run Client
Hyper-V on Windows 10:
@y
- Hyper-V とコンテナー機能を有効にしていることが必要です。
- Windows 10 上においてクライアント Hyper-V を正常に実行するには、以下のハードウェア要件を満たす必要があります。
@z

@x
  - 64 bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation){: target="_blank" rel="noopener" class="_"}
  - 4GB system RAM
  - BIOS-level hardware virtualization support must be enabled in the
    BIOS settings.  For more information, see
    [Virtualization](troubleshoot.md#virtualization-must-be-enabled).
@y
  - [第 2 レベルのアドレス変換](https://en.wikipedia.org/wiki/Second_Level_Address_Translation){: target="_blank" rel="noopener" class="_"}（Second Level Address Translation; SLAT）に対応した 64 ビットプロセッサー。
  - 4 GB のシステム RAM
  - BIOS 設定において BIOS レベルのハードウェア仮想化サポートが有効であること。
    詳しくは [仮想化機能](troubleshoot.md#virtualization-must-be-enabled) を参照してください。
@z

@x
</div>
</div>
@y
</div>
</div>
@z

@x
> **Note**
>
> Docker only supports Docker Desktop on Windows for those versions of Windows 10 that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet){:target="_blank" rel="noopener" class="_"}.
@y
> **メモ**
>
> Docker における Windows 上の Docker Desktop は、Windows 10 オペレーティングシステムに対するマイクロソフトのサポートライフサイクルに対応づいてのみ、サポートが行われます。
> 詳しくは [Windows ライフサイクルのファクトシート](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet){:target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
Containers and images created with Docker Desktop are shared between all
user accounts on machines where it is installed. This is because all Windows
accounts use the same VM to build and run containers. Note that it is not possible to share containers and images between user accounts when using the Docker Desktop WSL 2 backend.
@y
Docker Desktop を使って生成されたコンテナーやイメージは、Docker Desktop がインストールされているマシン上であれば、全ユーザーアカウントが共有できます。
これは Windows アカウントが同一の VM を使って、コンテナーのビルドや実行を行うからです。
ただし Docker Desktop WSL 2 バックエンドを利用している場合は、ユーザーアカウント間でコンテナーやイメージは共有できません。
@z

@x
Nested virtualization scenarios, such as running Docker Desktop on a
VMWare or Parallels instance might work, but there are no guarantees. For
more information, see [Running Docker Desktop in nested virtualization scenarios](troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios).
@y
仮想環境をネスト化するような利用方法、たとえば VMWare や Parallels 上に Docker Desktop を起動させた場合、Docker Desktop は動くかもしれませんが、動作は保証されません。
詳しくは [ネスト化した仮想環境での Docker Desktop の実行](troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios) を参照してください。
@z

@x
### About Windows containers
@y
### Windows コンテナーについて
{: #about-windows-containers }
@z

@x
Looking for information on using Windows containers?
@y
Windows コンテナーの利用方法についてお探しの方は以下です。
@z

@x
* [Switch between Windows and Linux containers](index.md#switch-between-windows-and-linux-containers)
  describes how you can toggle between Linux and Windows containers in Docker Desktop and points you to the tutorial mentioned above.
* [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  provides a tutorial on how to set up and run Windows containers on Windows 10, Windows Server 2016 and Windows Server 2019. It shows you how to use a MusicStore application
  with Windows containers.
* Docker Container Platform for Windows [articles and blog
  posts](https://www.docker.com/microsoft/) on the Docker website.
@y
* [Windows と Linux の各コンテナー間の切り替え](index.md#switch-between-windows-and-linux-containers) では、Docker Desktop 上において Linux と Windows のコンテナー間を切り替える方法を説明しています。
  そして上で説明したチュートリアルをお勧めしています。
* [Windows コンテナーをはじめよう（ラボ）](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md) では、Windows 10、Windows Server 2016、Windows Server 2019 の各 OS 上において Windows コンテナーを設定して実行するチュートリアルを提供しています。
  そこでは、Windows コンテナーを使った MusicStore アプリケーションの利用方法を示しています。
* Docker ウェブサイト上に Docker Container Platform for Windows に関する [記事とブログ投稿](https://www.docker.com/microsoft/) があります。
@z

@x
## Install Docker Desktop on Windows
@y
## Windows への Docker Desktop のインストール
{: #install-docker-desktop-on-windows }
@z

@x
1. Double-click **Docker Desktop Installer.exe** to run the installer.
@y
1. **Docker Desktop Installer.exe** をダブルクリックしてインストーラーを起動します。
@z

@x
    If you haven't already downloaded the installer (`Docker Desktop Installer.exe`), you can get it from
    [**Docker Hub**](https://hub.docker.com/editions/community/docker-ce-desktop-windows/).
    It typically downloads to your `Downloads` folder, or you can run it from
    the recent downloads bar at the bottom of your web browser.
@y
    インストーラー（`Docker Desktop Installer.exe`）をまだダウンロードしていない場合は [**Docker Hub**](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) からダウンロードしてください。
    通常は`Downloads`フォルダーにダウンロードされます。
    あるいはウェブブラウザーの下段に表示される、最新のダウンロードバーから直接起動することもできます。
@z

@x
2. When prompted, ensure the **Enable Hyper-V Windows Features** or the **Install required Windows components for WSL 2** option is selected on the Configuration page.
@y
2. Configuration ページにおいてプロンプト画面が表示されたら、**Enable Hyper-V Windows Features** オプションまたは **Install required Windows components for WSL 2** オプションが設定されていることを確認してください。
@z

@x
3. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
@y
3. インストールウィザードの手順に従ってインストーラーを承認して、インストールを完了させます。
@z

@x
4. When the installation is successful, click **Close** to complete the installation process.
@y
4. インストールが正常に行われたら **Close** をクリックして作業を終了します。
@z

@x
5. If your admin account is different to your user account, you must add the user to the **docker-users** group. Run **Computer Management** as an administrator and navigate to **Local Users and Groups** > **Groups** > **docker-users**. Right-click to add the user to the group.
Log out and log back in for the changes to take effect.
@y
5. 管理アカウントが利用しているアカウントと異なる場合、そのアカウントを **docker-users** グループに追加する必要があります。
   管理者として **コンピューターの管理** を実行し、**ローカルユーザーとグループ** > **グループ** > **docker-users** を選びます。
   このグループに対して、右クリックメニューからユーザーを追加します。
   変更を有効にするため、いったんログアウトしてからログインし直します。
@z

@x
## Start Docker Desktop
@y
## Docker Desktop の起動
{: #start-docker-desktop }
@z

@x
Docker Desktop does not start automatically after installation. To start Docker Desktop:
@y
インストール直後の Docker Desktop は、自動的には起動されません。
Docker Desktop を起動するには、以下を実行します。
@z

@x
1. Search for Docker, and select **Docker Desktop** in the search results.
@y
1. Search for Docker, and select **Docker Desktop** in the search results.
@z

@x
      ![search for Docker app](images/docker-app-search.png){:width="300px"}
@y
      ![search for Docker app](images/docker-app-search.png){:width="300px"}
@z

@x
2. The Docker menu (![whale menu](images/whale-x.png){: .inline}) displays the Docker Subscription Service Agreement window. It includes a change to the terms of use for Docker Desktop.
@y
2. Docker メニュー (![クジラメニュー](images/whale-x.png){: .inline}) には、Docker Subscription Service Agreement（サブスクリプションサービス契約）画面が表示されます。
   そこには Docker Desktop の利用条件に関する変更が示されています。
@z

@x
    {% include desktop-license-update.md %}
@y
    {% include desktop-license-update.md %}
@z

@x
3. Click the checkbox to indicate that you accept the updated terms and then click **Accept** to continue. Docker Desktop starts after you accept the terms.
@y
3. チェックボックスをクリックして、更新されたサービス条件に合意してください。
   そして **Accept**（合意）をクリックして先に進みます。
   この合意後に Docker Desktop が起動します。
@z

@x
    > **Important**
    >
    > If you do not agree to the updated terms, the Docker Desktop application will close and  you can no longer run Docker Desktop on your machine. You can choose to accept the terms at a later date by opening Docker Desktop.
    {: .important}
@y
    > **重要**
    >
    > この更新された条件に合意しなかった場合、Docker Desktop アプリケーションは終了し、そのマシン上での DOcker Desktop 実行はできなくなります。
    > 後日 Docker Desktop を開いて、条件の合意を選ぶことができます。
    {: .important}
@z

@x
    For more information, see [Docker Desktop License Agreement](../../subscription/index.md#docker-desktop-license-agreement). We recommend that you also read the [Blog](https://www.docker.com/blog/updating-product-subscriptions/){: target="_blank" rel="noopener" class="_" id="dkr_docs_desktop_install_btl"} and [FAQs](https://www.docker.com/pricing/faq){: target="_blank" rel="noopener" class="_" id="dkr_docs_desktop_install_btl"} to learn how companies using Docker Desktop may be affected.
@y
    詳しくは [Docker Desktop ライセンス契約](../../subscription/index.md#docker-desktop-license-agreement) を参照してください。
    また、以下の [ブログ](https://www.docker.com/blog/updating-product-subscriptions/){: target="_blank" rel="noopener" class="_" id="dkr_docs_desktop_install_btl"} and [FAQs](https://www.docker.com/pricing/faq){: target="_blank" rel="noopener" class="_" id="dkr_docs_desktop_install_btl"}  を読んで、Docker Desktop を利用する各企業において、どのような影響が発生するのかを確認してください。
@z

@x
### Quick Start Guide
@y
{: #quick-start-guide }
### クイックスタートガイド
@z

@x
When the initialization is complete, Docker Desktop launches the **Quick Start Guide**. This tutorial includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
@y
初期設定が完了すると Docker Desktop はクイックスタートチュートリアルを起動します。
このチュートリアルには、Docker イメージを試しにビルドし、コンテナーとしての実行、Docker Hub へのイメージのプッシュと保存、といった簡単な練習問題があります。
@z

@x
To run the Quick Start Guide on demand, right-click the Docker icon in the Notifications area (or System tray) to open the Docker Desktop menu and then select **Quick Start Guide**.
@y
クイックスタートガイドを起動するには、通知エリア（またはシステムトレイ）にある Docker アイコンを右クリックして Docker Desktop メニューを開き、**Quick Start Guide** (クイックスタートガイド) を実行します。
@z

@x
![Docker Quick Start tutorial](images/docker-tutorial-win.png){:width="450px"}
@y
![Docker クイックスタートチュートリアル](images/docker-tutorial-win.png){:width="450px"}
@z

@x
Congratulations! You are now successfully running Docker Desktop on Windows.
@y
おめでとうございます。
Windows 上に Docker Desktop が正常に起動できるようになりました。
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
To uninstall Docker Desktop from your Windows machine:
@y
Windows から Docker Desktop をアンインストールするには、以下を行います。
@z

@x
1. From the Windows **Start** menu, select **Settings** > **Apps** > **Apps & features**.
2. Select **Docker Desktop** from the **Apps & features** list and then select **Uninstall**.
3. Click **Uninstall** to confirm your selection.
@y
1. Windows の **スタート** メニューから、**設定** > **アプリケーション** > **アプリケーションと機能** を選びます。
2. **アプリケーションと機能** の一覧から **Docker Desktop** を選んで **アンインストール** を実行します。
3. 間違いないことを確認し **アンインストール** をクリックします。
@z

@x
> **Important**
>
> Uninstalling Docker Desktop destroys Docker containers, images, volumes, and
> other Docker related data local to the machine, and removes the files generated
> by the application. Refer to the [back up and restore data](../backup-and-restore.md)
> section to learn how to preserve important data before uninstalling.
@y
> **重要**
>
> Docker Desktop をアンインストールすると、ローカルにある Docker コンテナー、イメージ、ボリューム、その他 Docker 関連データは破棄され、アプリケーションが生成したファイルは削除されます。
> アンインストールによって大切なデータを失わないように、[バックアップとリストア](../backup-and-restore.md) の手順を確認してください。
@z

@x
## Where to go next
@y
## 次に読むものは
{: #where-to-go-next }
@z

@x
* [Getting started](index.md) introduces Docker Desktop for Windows.
* [Get started with Docker](/get-started/) is a tutorial that teaches you how to
  deploy a multi-service stack.
* [Troubleshooting](troubleshoot.md) describes common problems, workarounds, and
  how to get support.
* [FAQs](../faqs.md) provide answers to frequently asked questions.
* [Release notes](release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
* [Back up and restore data](../backup-and-restore.md) provides instructions on backing up and restoring data related to Docker.
@y
* [はじめよう](index.md) では Docker Desktop for Windows を紹介しています。
* [Docker をはじめよう](../../get-started/) はマルチサービススタックのデプロイ方法を説明するチュートリアルです。
* [トラブルシューティング](troubleshoot.md) では、一般的な問題、回避策、サポートの受け方などについて説明しています。
* [FAQ](../faqs.md) ではよくたずねられる質問を示しています。
* [リリースノート](release-notes.md) では、Docker Desktop リリースにおけるコンポーネントアップデート、新機能、改善項目を一覧にしています。
* [データのバックアップとリストア](../backup-and-restore.md) では Docker に関するデータのバックアップやリストアの手順を説明しています。
@z
