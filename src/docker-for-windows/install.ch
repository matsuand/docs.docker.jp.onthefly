%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to install Docker Desktop for Windows
keywords: windows, install, download, run, docker, local
title: Install Docker Desktop on Windows
---
@y
---
description: How to install Docker Desktop for Windows
keywords: windows, install, download, run, docker, local
title: Windows への Docker Desktop のインストール
---
@z

@x
Docker Desktop for Windows is the [Community](https://www.docker.com/community-edition) version of Docker for Microsoft Windows.
You can download Docker Desktop for Windows from Docker Hub.
@y
{% comment %}
Docker Desktop for Windows is the [Community](https://www.docker.com/community-edition) version of Docker for Microsoft Windows.
You can download Docker Desktop for Windows from Docker Hub.
{% endcomment %}
Docker Desktop for Windows は Microsoft Windows 向け Docker の [コミュニティ](https://www.docker.com/community-edition) 版です。
Docker Desktop for Windows は Docker Hub からダウンロードすることができます。
@z

@x
This page contains information on installing Docker Desktop on Windows 10 Pro, Enterprise, and Education. If you are looking for information about installing Docker Desktop on Windows 10 Home, see [Install Docker Desktop on Windows Home](/install-windows-home.md).
@y
{% comment %}
This page contains information on installing Docker Desktop on Windows 10 Pro, Enterprise, and Education. If you are looking for information about installing Docker Desktop on Windows 10 Home, see [Install Docker Desktop on Windows Home](/install-windows-home.md).
{% endcomment %}
このページでは Windows 10 Pro、Enterprise、Education に Docker Desktop をインストールする方法を示します。
Windows 10 Home に Docker Desktop をインストールする方法については、[Windows Home への Docker Desktop のインストール](/install-windows-home.md) を参照してください。
@z

@x
[Download from Docker
Hub](https://hub.docker.com/editions/community/docker-ce-desktop-windows/){:
.button .outline-btn}
@y
{% comment %}
[Download from Docker
Hub](https://hub.docker.com/editions/community/docker-ce-desktop-windows/){:
.button .outline-btn}
{% endcomment %}
[Docker Hub からダウンロード](https://hub.docker.com/editions/community/docker-ce-desktop-windows/){:
.button .outline-btn}
@z

@x
By downloading Docker Desktop, you agree to the terms of the [Docker Software End User License Agreement](https://www.docker.com/legal/docker-software-end-user-license-agreement){: target="_blank" class="_"} and the [Docker Data Processing Agreement](https://www.docker.com/legal/data-processing-agreement){: target="_blank" class="_"}.
@y
{% comment %}
By downloading Docker Desktop, you agree to the terms of the [Docker Software End User License Agreement](https://www.docker.com/legal/docker-software-end-user-license-agreement){: target="_blank" class="_"} and the [Docker Data Processing Agreement](https://www.docker.com/legal/data-processing-agreement){: target="_blank" class="_"}.
{% endcomment %}
Docker Desktop をダウンロードすると、[Docker Software End User License Agreement](https://www.docker.com/legal/docker-software-end-user-license-agreement){: target="_blank" class="_"} と [Docker Data Processing Agreement](https://www.docker.com/legal/data-processing-agreement){: target="_blank" class="_"} の各規約に同意したものとなります。
@z

@x
## What to know before you install
@y
{% comment %}
## What to know before you install
{% endcomment %}
{: #what-to-know-before-you-install }
## インストール前に確認すべきこと
@z

@x
### System Requirements
@y
{% comment %}
### System Requirements
{% endcomment %}
{: #system-requirements }
### システム要件
@z

@x
  - Windows 10 64-bit: Pro, Enterprise, or Education (Build 16299 or later).
  
    For Windows 10 Home, see [Install Docker Desktop on Windows Home](install-windows-home.md).
  - Hyper-V and Containers Windows features must be enabled.
  - The following hardware prerequisites are required to successfully run Client
Hyper-V on Windows 10:
@y
  {% comment %}
  - Windows 10 64-bit: Pro, Enterprise, or Education (Build 16299 or later).
  
    For Windows 10 Home, see [Install Docker Desktop on Windows Home](install-windows-home.md).
  - Hyper-V and Containers Windows features must be enabled.
  - The following hardware prerequisites are required to successfully run Client
Hyper-V on Windows 10:
  {% endcomment %}
  - Windows 10 64 ビット: Pro、Enterprise、Education (Build 16299 またはそれ以降)
  
    Windows 10 Home については [Windows Home への Docker Desktop のインストール](install-windows-home.md) を参照してください。
  - Hyper-V とコンテナー機能を有効にしていることが必要です。
  - Windows 10 上においてクライアント Hyper-V を正常に実行するには、以下のハードウェア要件を満たす必要があります。
@z

@x
     - 64 bit processor with [Second Level Address Translation (SLAT)](http://en.wikipedia.org/wiki/Second_Level_Address_Translation)
     - 4GB system RAM
    - BIOS-level hardware virtualization support must be enabled in the
    BIOS settings.  For more information, see
    [Virtualization](troubleshoot.md#virtualization-must-be-enabled).
@y
     {% comment %}
     - 64 bit processor with [Second Level Address Translation (SLAT)](http://en.wikipedia.org/wiki/Second_Level_Address_Translation)
     - 4GB system RAM
    - BIOS-level hardware virtualization support must be enabled in the
    BIOS settings.  For more information, see
    [Virtualization](troubleshoot.md#virtualization-must-be-enabled).
     {% endcomment %}
     - [第 2 レベルのアドレス変換（Second Level Address Translation; SLAT）](http://en.wikipedia.org/wiki/Second_Level_Address_Translation) に対応した 64 ビットプロセッサー。
     - 4 GB のシステム RAM
     - BIOS 設定において BIOS レベルのハードウェア仮想化サポートが有効であること。
       [仮想化](troubleshoot.md#virtualization-must-be-enabled) を参照してください。
@z

@x
> **Note:** Docker supports Docker Desktop on Windows based on Microsoft’s support lifecycle for Windows 10 operating system. For more information, see the [Windows lifecycle fact sheet](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet).
@y
{% comment %}
> **Note:** Docker supports Docker Desktop on Windows based on Microsoft’s support lifecycle for Windows 10 operating system. For more information, see the [Windows lifecycle fact sheet](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet).
{% endcomment %}
> **メモ** Docker における Windows 上の Docker Desktop は、Windows 10 オペレーティングシステムに対するマイクロソフトのサポートライフサイクルに対応づいて、サポートが行われます。
> 詳しくは [Windows ライフサイクルのファクトシート](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet) を参照してください。
@z

@x
### What's included in the installer
@y
{% comment %}
### What's included in the installer
{% endcomment %}
{: #whats-included-in-the-installer }
### インストーラーに含まれるもの
@z

@x
The Docker Desktop installation includes [Docker Engine](../engine/index.md),
Docker CLI client, [Docker Compose](../compose/index.md),
[Notary](../notary/getting_started.md),
[Kubernetes](https://github.com/kubernetes/kubernetes/),
and [Credential Helper](https://github.com/docker/docker-credential-helpers/).
@y
{% comment %}
The Docker Desktop installation includes [Docker Engine](../engine/index.md),
Docker CLI client, [Docker Compose](../compose/index.md),
[Notary](../notary/getting_started.md),
[Kubernetes](https://github.com/kubernetes/kubernetes/),
and [Credential Helper](https://github.com/docker/docker-credential-helpers/).
{% endcomment %}
Docker Desktop のインストールにより以下のものが利用できます。[Docker Engine](../engine/index.md)、Docker CLI クライアント、[Docker Compose](../compose/index.md)、[Notary](../notary/getting_started.md)、[Kubernetes](https://github.com/kubernetes/kubernetes/)、[Credential Helper](https://github.com/docker/docker-credential-helpers/)。
@z

@x
Containers and images created with Docker Desktop are shared between all
user accounts on machines where it is installed. This is because all Windows
accounts use the same VM to build and run containers. Note that it is not possible to share containers and images between user accounts when using the Docker Desktop WSL 2 backend.
@y
{% comment %}
Containers and images created with Docker Desktop are shared between all
user accounts on machines where it is installed. This is because all Windows
accounts use the same VM to build and run containers. Note that it is not possible to share containers and images between user accounts when using the Docker Desktop WSL 2 backend.
{% endcomment %}
Docker Desktop を使って生成されたコンテナーやイメージは、Docker Desktop がインストールされているマシン上であれば、全ユーザーアカウントが共有できます。
これは Windows アカウントが同一の VM を使って、コンテナーのビルドや実行を行うからです。
ただし Docker Desktop WSL 2 バックエンドを利用している場合は、ユーザーアカウント間でコンテナーやイメージは共有できません。
@z

@x
Nested virtualization scenarios, such as running Docker Desktop on a
VMWare or Parallels instance might work, but there are no guarantees. For
more information, see [Running Docker Desktop in nested virtualization scenarios](troubleshoot.md#running-docker-desktop-for-windows-in-nested-virtualization-scenarios).
@y
{% comment %}
Nested virtualization scenarios, such as running Docker Desktop on a
VMWare or Parallels instance might work, but there are no guarantees. For
more information, see [Running Docker Desktop in nested virtualization scenarios](troubleshoot.md#running-docker-desktop-for-windows-in-nested-virtualization-scenarios).
{% endcomment %}
仮想環境をネスト化するような利用方法、たとえば VMWare や Parallels 上に Docker Desktop を起動させた場合、Docker Desktop は動くかもしれませんが、動作は保証されません。
詳しくは [ネスト化した仮想環境での Docker Desktop の実行](troubleshoot.md#running-docker-desktop-for-windows-in-nested-virtualization-scenarios) を参照してください。
@z

@x
### About Windows containers
@y
{% comment %}
### About Windows containers
{% endcomment %}
{: #about-windows-containers }
### Windows コンテナーについて
@z

@x
Looking for information on using Windows containers?
@y
{% comment %}
Looking for information on using Windows containers?
{% endcomment %}
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
{% comment %}
* [Switch between Windows and Linux containers](index.md#switch-between-windows-and-linux-containers)
  describes how you can toggle between Linux and Windows containers in Docker Desktop and points you to the tutorial mentioned above.
* [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  provides a tutorial on how to set up and run Windows containers on Windows 10, Windows Server 2016 and Windows Server 2019. It shows you how to use a MusicStore application
  with Windows containers.
* Docker Container Platform for Windows [articles and blog
  posts](https://www.docker.com/microsoft/) on the Docker website.
{% endcomment %}
* [Windows と Linux の各コンテナー間の切り替え](index.md#switch-between-windows-and-linux-containers) では、Docker Desktop 上において Linux と Windows のコンテナー間を切り替える方法を説明しています。
  そして上で説明したチュートリアルをお勧めしています。
* [Windows コンテナーをはじめよう（ラボ）](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md) では、Windows 10、Windows Server 2016、Windows Server 2019 の各 OS 上において Windows コンテナーを設定して実行するチュートリアルを提供しています。
  そこでは、Windows コンテナーを使った MusicStore アプリケーションの利用方法を示しています。
* Docker ウェブサイト上に Docker Container Platform for Windows に関する [記事とブログ投稿](https://www.docker.com/microsoft/) があります。
@z

@x
## Install Docker Desktop on Windows
@y
{% comment %}
## Install Docker Desktop on Windows
{% endcomment %}
{: #install-docker-desktop-on-windows }
## Windows への Docker Desktop のインストール
@z

@x
1. Double-click **Docker Desktop Installer.exe** to run the installer.
@y
{% comment %}
1. Double-click **Docker Desktop Installer.exe** to run the installer.
{% endcomment %}
1. **Docker Desktop Installer.exe** をダブルクリックしてインストーラーを起動します。
@z

@x
    If you haven't already downloaded the installer (`Docker Desktop Installer.exe`), you can get it from
    [**Docker Hub**](https://hub.docker.com/editions/community/docker-ce-desktop-windows/).
    It typically downloads to your `Downloads` folder, or you can run it from
    the recent downloads bar at the bottom of your web browser.
@y
    {% comment %}
    If you haven't already downloaded the installer (`Docker Desktop Installer.exe`), you can get it from
    [**Docker Hub**](https://hub.docker.com/editions/community/docker-ce-desktop-windows/).
    It typically downloads to your `Downloads` folder, or you can run it from
    the recent downloads bar at the bottom of your web browser.
    {% endcomment %}
    インストーラー（`Docker Desktop Installer.exe`）をまだダウンロードしていない場合は [**Docker Hub**](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) からダウンロードしてください。
    通常は `Downloads` フォルダーにダウンロードされます。
    あるいはウェブブラウザーの下段に表示される、最新のダウンロードバーから直接起動することもできます。
@z

@x
2. When prompted, ensure the **Enable Hyper-V Windows Features** option is selected on the Configuration page.
@y
{% comment %}
2. When prompted, ensure the **Enable Hyper-V Windows Features** option is selected on the Configuration page.
{% endcomment %}
2. Configuration ページにおいてプロンプト画面が表示されたら、**Enable Hyper-V Windows Features** オプションが設定されていることを確認してください。
@z

@x
3. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
@y
{% comment %}
3. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
{% endcomment %}
3. インストールウィザードの手順に従ってインストーラーを承認して、インストールを完了させます。
@z

@x
4. When the installation is successful, click **Close** to complete the installation process.
@y
{% comment %}
4. When the installation is successful, click **Close** to complete the installation process.
{% endcomment %}
4. インストールが正常に行われたら **Close** をクリックして作業を終了します。
@z

@x
5. If your admin account is different to your user account, you must add the user to 
the **docker-users** group. Run **Computer Management** as an administrator and navigate to 
**Local Users and Groups** > **Groups** > **docker-users**. Right-click to add the user to the group.
Log out and log back in for the changes to take effect.
@y
{% comment %}
5. If your admin account is different to your user account, you must add the user to 
the **docker-users** group. Run **Computer Management** as an administrator and navigate to 
**Local Users and Groups** > **Groups** > **docker-users**. Right-click to add the user to the group.
Log out and log back in for the changes to take effect.
{% endcomment %}
5. 管理アカウントが利用しているアカウントと異なる場合、そのアカウントを **docker-users** グループに追加する必要があります。
   管理者として **コンピューターの管理** を実行し、**ローカルユーザーとグループ** > **グループ** > **docker-users** を選びます。
   このグループに対して、右クリックメニューからユーザーを追加します。
   変更を有効にするため、いったんログアウトしてからログインし直します。
@z

@x
## Start Docker Desktop
@y
{% comment %}
## Start Docker Desktop
{% endcomment %}
{: #start-docker-desktop }
## Docker Desktop の起動
@z

@x
Docker Desktop does not start automatically after installation. To start Docker Desktop, search for Docker, and select **Docker Desktop** in the search results.
@y
{% comment %}
Docker Desktop does not start automatically after installation. To start Docker Desktop, search for Docker, and select **Docker Desktop** in the search results.
{% endcomment %}
インストール直後の Docker Desktop は、自動的には起動されません。
Docker Desktop を起動するには、Docker を検索して、その結果から **Docker Desktop** を実行します。
@z

@x
![search for Docker app](images/docker-app-search.png){:width="300px"}
@y
{% comment %}
![search for Docker app](images/docker-app-search.png){:width="300px"}
{% endcomment %}
![Docker アプリの検索](images/docker-app-search.png){:width="300px"}
@z

@x
When the whale icon in the status bar stays steady, Docker Desktop is up-and-running, and is accessible from any terminal window.
@y
{% comment %}
When the whale icon in the status bar stays steady, Docker Desktop is up-and-running, and is accessible from any terminal window.
{% endcomment %}
クジラアイコンがステータスバーに常時表示されていれば、Docker Desktop は実行しており、どのターミナル画面からでもアクセス可能です。
@z

@x
![whale on taskbar](images/whale-icon-systray.png)
@y
{% comment %}
![whale on taskbar](images/whale-icon-systray.png)
{% endcomment %}
![タスクバー上のクジラアイコン](images/whale-icon-systray.png)
@z

@x
If the whale icon is hidden in the Notifications area, click the up arrow on the
taskbar to show it. To learn more, see [Docker Settings](index.md#docker-settings-dialog).
@y
{% comment %}
If the whale icon is hidden in the Notifications area, click the up arrow on the
taskbar to show it. To learn more, see [Docker Settings](index.md#docker-settings-dialog).
{% endcomment %}
通知エリアにクジラアイコンが表示されていない場合は、タスクバー上の上矢印ボタンをクリックして、アイコンを表示します。
詳しくは [Docker の設定](index.md#docker-settings-dialog) を参照してください。
@z

@x
When the initialization is complete, Docker Desktop launches the onboarding tutorial. The tutorial includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
@y
{% comment %}
When the initialization is complete, Docker Desktop launches the onboarding tutorial. The tutorial includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
{% endcomment %}
初期設定が完了すると Docker Desktop はシステム内のチュートリアルを起動します。
このチュートリアルには、Docker イメージを試しにビルドし、コンテナーとしての実行、Docker Hub へのイメージのプッシュと保存、といった簡単な練習問題があります。
@z

@x
![Docker Quick Start tutorial](images/docker-tutorial-win.png){:width="450px"}
@y
{% comment %}
![Docker Quick Start tutorial](images/docker-tutorial-win.png){:width="450px"}
{% endcomment %}
![Docker クイックスタートチュートリアル](images/docker-tutorial-win.png){:width="450px"}
@z

@x
Congratulations! You are now successfully running Docker Desktop on Windows.
@y
{% comment %}
Congratulations! You are now successfully running Docker Desktop on Windows.
{% endcomment %}
おめでとうございます。
Windows 上に Docker Desktop が正常に起動できるようになりました。
@z

@x
If you would like to rerun the tutorial, go to the Docker Desktop menu 
and select **Learn**.
@y
{% comment %}
If you would like to rerun the tutorial, go to the Docker Desktop menu 
and select **Learn**.
{% endcomment %}
チュートリアルに戻る場合は、Docker Desktop メニューから **Learn** を実行します。
@z

@x
## Uninstall Docker Desktop
@y
{% comment %}
## Uninstall Docker Desktop
{% endcomment %}
{: #uninstall-docker-desktop }
## Docker Desktop のアンインストール
@z

@x
To uninstall Docker Desktop from your Windows machine:
@y
{% comment %}
To uninstall Docker Desktop from your Windows machine:
{% endcomment %}
Windows から Docker Desktop をアンインストールするには、以下を行います。
@z

@x
1. From the Windows **Start** menu, select **Settings** > **Apps** > **Apps & features**.
2. Select **Docker Desktop** from the **Apps & features** list and then select **Uninstall**.
3. Click **Uninstall** to confirm your selection.
@y
{% comment %}
1. From the Windows **Start** menu, select **Settings** > **Apps** > **Apps & features**.
2. Select **Docker Desktop** from the **Apps & features** list and then select **Uninstall**.
3. Click **Uninstall** to confirm your selection.
{% endcomment %}
1. Windows の **スタート** メニューから、**設定** > **アプリケーション** > **アプリケーションと機能** を選びます。
2. **アプリケーションと機能** の一覧から **Docker Desktop** を選んで **アンインストール** を実行します。
3. 間違いないことを確認し **アンインストール** をクリックします。
@z

@x
> **Note:** Uninstalling Docker Desktop will destroy Docker containers and images local to the machine and remove the files generated by the application.
@y
{% comment %}
> **Note:** Uninstalling Docker Desktop will destroy Docker containers and images local to the machine and remove the files generated by the application.
{% endcomment %}
> **メモ:** Docker Desktop をアンインストールすると、ローカルにある Docker コンテナーやイメージは破棄され、アプリケーションが生成したファイルは削除されます。
@z

@x
## Switch between Stable and Edge versions
@y
{% comment %}
## Switch between Stable and Edge versions
{% endcomment %}
{: #switch-between-stable-and-edge-versions }
## 安定版と最新版の切り替え
@z

@x
Docker Desktop allows you to switch between Stable and Edge releases. However, **you can only have one version of Docker Desktop installed at a time**. Switching between Stable and Edge versions can destabilize your development environment, particularly in cases where you switch from a newer (Edge) channel to an older (Stable) channel.
@y
{% comment %}
Docker Desktop allows you to switch between Stable and Edge releases. However, **you can only have one version of Docker Desktop installed at a time**. Switching between Stable and Edge versions can destabilize your development environment, particularly in cases where you switch from a newer (Edge) channel to an older (Stable) channel.
{% endcomment %}
Docker Desktop では安定版（stable）と最新版（edge）の切り替えができるようになっています。
ただし **一度にインストールできるのは、どちらか一つの Docker Desktop バージョンです**。
安定版と最新版の切り替えを行うと、手元の開発環境が不安定になることがあります。
特により最新に近いバージョンから、古い安定版に切り替えた場合に、起こることがあります。
@z

@x
For example, containers created with a newer Edge version of Docker Desktop may
not work after you switch back to Stable because they may have been created
using Edge features that aren't in Stable yet. Keep this in mind as
you create and work with Edge containers, perhaps in the spirit of a playground
space where you are prepared to troubleshoot or start over.
@y
{% comment %}
For example, containers created with a newer Edge version of Docker Desktop may
not work after you switch back to Stable because they may have been created
using Edge features that aren't in Stable yet. Keep this in mind as
you create and work with Edge containers, perhaps in the spirit of a playground
space where you are prepared to troubleshoot or start over.
{% endcomment %}
たとえば Docker Desktop 最新版を使って生成したコンテナーは、古い安定版に切り替えたら、動作しなくなるかもしれません。
そのコンテナーが最新版の機能を使って生成されていたとすると、それが古い安定版には存在しないことになるからです。
最新版を使ってコンテナーを生成して実行するときには、このことを十分に理解しておいてください。
いってみれば遊び感覚で操作するつもりで、なにかあっても自分で解決するか、初めからやり直す覚悟を持っておいてください。
@z

@x
Experimental features are turned on by default on Edge releases. However, when you switch from a Stable to an Edge release, you must turn on the experimental features flag to access experimental features. From the Docker Desktop menu, click **Settings** > **Command Line** and then turn on the **Enable experimental features** toggle. Click **Apply & Restart** for the changes to take effect.
@y
{% comment %}
Experimental features are turned on by default on Edge releases. However, when you switch from a Stable to an Edge release, you must turn on the experimental features flag to access experimental features. From the Docker Desktop menu, click **Settings** > **Command Line** and then turn on the **Enable experimental features** toggle. Click **Apply & Restart** for the changes to take effect.
{% endcomment %}
最新版では試験的（experimental）機能がデフォルトで有効になっています。
ただし安定版から最新版への切り替えを行った場合、試験的機能を利用するには設定フラグを有効にしなければなりません。
Docker Desktop メニューから **Settings** > **Command Line** をクリックして、トグルスイッチ **Enable experimental features** をオンにしてください。**Apply & Restart** をクリックすれば変更が反映されます。
@z

@x
To safely switch between Edge and Stable versions, ensure you save images and export the containers you need, then uninstall the current version before installing another. For more information, see the section _Save and Restore data_ below.
@y
{% comment %}
To safely switch between Edge and Stable versions, ensure you save images and export the containers you need, then uninstall the current version before installing another. For more information, see the section _Save and Restore data_ below.
{% endcomment %}
最新版と安定版の間で安全に切り替えを行うためには、必要なイメージの保存、コンテナーのエクスポートを行っておいてください。
そして切り替えるバージョンをインストールする前に、それまでのバージョンはアンインストールしてください。
詳しくは、以下の「データの保存と復元」を参照してください。
@z

@x
### Save and restore data
@y
{% comment %}
### Save and restore data
{% endcomment %}
{: #save-and-restore-data }
### データの保存と復元
@z

@x
You can use the following procedure to save and restore images and container data. For example, if you want to switch between Edge and Stable, or to reset your VM disk:
@y
{% comment %}
You can use the following procedure to save and restore images and container data. For example, if you want to switch between Edge and Stable, or to reset your VM disk:
{% endcomment %}
以下の手順に従うと、イメージやコンテナーのデータを保存し復元することができます。
たとえば安定版と最新版を切り替える場合や、VM ディスクを初期化するような場合には、以下を行います。
@z

@x
1. Use `docker save -o images.tar image1 [image2 ...]` to save any images you
    want to keep. See [save](/engine/reference/commandline/save) in the Docker
    Engine command line reference.
@y
{% comment %}
1. Use `docker save -o images.tar image1 [image2 ...]` to save any images you
    want to keep. See [save](/engine/reference/commandline/save) in the Docker
    Engine command line reference.
{% endcomment %}
1. `docker save -o images.tar image1 [image2 ...]` を実行して、保存しておきたいイメージを保存します。
    Docker Engine のコマンドラインリファレンスにある [save](../../engine/reference/commandline/save) を参照してください。
@z

@x
2. Use `docker export -o myContainner1.tar container1` to export containers you
    want to keep. See [export](/engine/reference/commandline/export) in the
    Docker Engine command line reference.
@y
{% comment %}
2. Use `docker export -o myContainner1.tar container1` to export containers you
    want to keep. See [export](/engine/reference/commandline/export) in the
    Docker Engine command line reference.
{% endcomment %}
2. `docker export -o myContainner1.tar container1` を実行して、保存しておきたいコンテナーをエクスポートします。
    Docker Engine のコマンドラインリファレンスにある [export](../../engine/reference/commandline/export) を参照してください。
@z

@x
3. Uninstall the current version of Docker Desktop and install a different version (Stable or Edge), or reset your VM disk.
@y
{% comment %}
3. Uninstall the current version of Docker Desktop and install a different version (Stable or Edge), or reset your VM disk.
{% endcomment %}
3. 現在の Docker Desktop をアンインストールし、別のバージョン（安定版または最新版）をインストールします。
   あるいは VM ディスクを初期化します。
@z

@x
4. Use `docker load -i images.tar` to reload previously saved images. See
    [load](/engine/reference/commandline/load) in the Docker Engine.
@y
{% comment %}
4. Use `docker load -i images.tar` to reload previously saved images. See
    [load](/engine/reference/commandline/load) in the Docker Engine.
{% endcomment %}
4. `docker load -i images.tar` を実行して、上で保存したイメージをリロードします。
   Docker Engine の [load](../../engine/reference/commandline/load) を参照してください。
@z

@x
5. Use `docker import -i myContainer1.tar` to create a file system image
    corresponding to the previously exported containers. See
    [import](/engine/reference/commandline/import) in the Docker Engine.
@y
{% comment %}
5. Use `docker import -i myContainer1.tar` to create a file system image
    corresponding to the previously exported containers. See
    [import](/engine/reference/commandline/import) in the Docker Engine.
{% endcomment %}
5. `docker import -i myContainer1.tar` を実行して、上でエクスポートしたコンテナーに対応するファイルシステムイメージを生成します。
    Docker Engine の [import](../../engine/reference/commandline/import) を参照してください。
@z

@x
For information on how to back up and restore data volumes, see [Backup, restore, or migrate data volumes](/storage/volumes/#backup-restore-or-migrate-data-volumes).
@y
{% comment %}
For information on how to back up and restore data volumes, see [Backup, restore, or migrate data volumes](/storage/volumes/#backup-restore-or-migrate-data-volumes).
{% endcomment %}
データボリュームの保存と復元に関しては [データボリュームのバックアップ、復元、移行](../../storage/volumes/#backup-restore-or-migrate-data-volumes) を参照してください。
@z

@x
## Where to go next
@y
{% comment %}
## Where to go next
{% endcomment %}
{: #where-to-go-next }
## 次に読むものは
@z

@x
* [Getting started](index.md) introduces Docker Desktop for Windows.
* [Get started with Docker](/get-started/) is a tutorial that teaches you how to
  deploy a multi-service stack.
* [Troubleshooting](troubleshoot.md) describes common problems, workarounds, and
  how to get support.
* [FAQs](faqs.md) provides answers to frequently asked questions.
* [Stable Release Notes](release-notes.md) or [Edge Release Notes](edge-release-notes.md).
@y
{% comment %}
* [Getting started](index.md) introduces Docker Desktop for Windows.
* [Get started with Docker](/get-started/) is a tutorial that teaches you how to
  deploy a multi-service stack.
* [Troubleshooting](troubleshoot.md) describes common problems, workarounds, and
  how to get support.
* [FAQs](faqs.md) provides answers to frequently asked questions.
* [Stable Release Notes](release-notes.md) or [Edge Release Notes](edge-release-notes.md).
{% endcomment %}
* [はじめよう](index.md) では Docker Desktop for Windows を紹介しています。
* [Docker をはじめよう](../../get-started/) はマルチサービススタックのデプロイ方法を説明するチュートリアルです。
* [トラブルシューティング](troubleshoot.md) では、一般的な問題、回避策、サポートの受け方などについて説明しています。
* [FAQ](faqs.md) ではよく尋ねられる質問を示しています。
* [安定版リリースノード](release-notes.md) または [最新版リリースノート](edge-release-notes.md)。
@z
