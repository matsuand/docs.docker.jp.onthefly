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
Docker Desktop for Mac is the [Community](https://www.docker.com/community-edition) version of Docker for Mac.
You can download Docker Desktop for Mac from Docker Hub.
@y
{% comment %}
Docker Desktop for Mac is the [Community](https://www.docker.com/community-edition) version of Docker for Mac.
You can download Docker Desktop for Mac from Docker Hub.
{% endcomment %}
Docker Desktop for Mac は Mac 向け Docker の[Community](https://www.docker.com/community-edition) バージョンです。
Docker Desktop for Mac のダウンロードは Docker Hub からダウンロードすることができます。
@z

@x
[Download from Docker Hub](https://hub.docker.com/editions/community/docker-ce-desktop-mac/){: .button .outline-btn}
@y
{% comment %}
[Download from Docker Hub](https://hub.docker.com/editions/community/docker-ce-desktop-mac/){: .button .outline-btn}
{% endcomment %}
[Docker Hub からのダウンロード](https://hub.docker.com/editions/community/docker-ce-desktop-mac/){: .button .outline-btn}
@z

@x
By downloading Docker Desktop, you agree to the terms of the [Docker Software End User License Agreement](https://www.docker.com/legal/docker-software-end-user-license-agreement){: target="_blank" rel="noopener" class="_"} and the [Docker Data Processing Agreement](https://www.docker.com/legal/data-processing-agreement){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
By downloading Docker Desktop, you agree to the terms of the [Docker Software End User License Agreement](https://www.docker.com/legal/docker-software-end-user-license-agreement){: target="_blank" rel="noopener" class="_"} and the [Docker Data Processing Agreement](https://www.docker.com/legal/data-processing-agreement){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
Docker Desktop のダウンロードによって、[Docker Software End User License Agreement](https://www.docker.com/legal/docker-software-end-user-license-agreement){: target="_blank" rel="noopener" class="_"} と [Docker Data Processing Agreement](https://www.docker.com/legal/data-processing-agreement){: target="_blank" rel="noopener" class="_"} に同意したことになります。
@z

@x
## What to know before you install
@y
{% comment %}
## What to know before you install
{% endcomment %}
{: #what-to-know-before-you-install }
## インストールの前に
@z

@x
**Relationship to Docker Machine**: Installing Docker Desktop on Mac does not affect machines you created with Docker Machine. You have the option to copy containers and images from your local `default` machine (if one exists) to the Docker Desktop [HyperKit](https://github.com/docker/HyperKit/) VM. When
you are running Docker Desktop, you do not need Docker Machine nodes running locally (or anywhere else). With Docker Desktop, you have a new, native
virtualization system running (HyperKit) which takes the place of the
VirtualBox system.
@y
{% comment %}
**Relationship to Docker Machine**: Installing Docker Desktop on Mac does not affect machines you created with Docker Machine. You have the option to copy containers and images from your local `default` machine (if one exists) to the Docker Desktop [HyperKit](https://github.com/docker/HyperKit/) VM. When
you are running Docker Desktop, you do not need Docker Machine nodes running locally (or anywhere else). With Docker Desktop, you have a new, native
virtualization system running (HyperKit) which takes the place of the
VirtualBox system.
{% endcomment %}
**Docker Machine との関係**: Mac 上に Docker Desktop  をインストールしても、Docker Machine を使って生成していたマシンへの影響はありません。ローカルの `default` マシンがあるとして、ここから Docker Desktop [HyperKit](https://github.com/docker/HyperKit/) VM に向けて、コンテナーやイメージをコピーすることができます。
Docker Desktop の実行中に、Docker Machine のノードをローカルで（あるいはどこであっても）起動しておく必要はありません。
Docker Desktop を利用すると、VirtualBox システムにかわって、新たにネイティブな仮想システム（HyperKit）を起動することになります。
@z

@x
## System requirements
@y
{% comment %}
## System requirements
{% endcomment %}
{: #system-requirements }
## システム要件
@z

@x
Your Mac must meet the following requirements to successfully install Docker Desktop:
@y
{% comment %}
Your Mac must meet the following requirements to successfully install Docker Desktop:
{% endcomment %}
Docker Desktop を Mac に正常にインストールするには、以下のシステム要件が満たされている必要があります。
@z

@x
- **Mac hardware must be a 2010 or a newer model**, with Intel’s hardware support for memory management unit (MMU) virtualization, including Extended Page Tables (EPT) and Unrestricted Mode. You can check to see if your machine has this support by running the following command in a terminal: `sysctl kern.hv_support`
@y
{% comment %}
- **Mac hardware must be a 2010 or a newer model**, with Intel’s hardware support for memory management unit (MMU) virtualization, including Extended Page Tables (EPT) and Unrestricted Mode. You can check to see if your machine has this support by running the following command in a terminal: `sysctl kern.hv_support`
{% endcomment %}
- **Mac ハードウェアは 2010 あるいはそれより最新のモデルであること**。
  そして Extended Page Tables (EPT) や Unrestricted モードを含んだ、MMU 仮想化に対する Intel ハードウェアサポートが必要です。
  利用マシンがこれをサポートしているかどうかは、端末画面から `sysctl kern.hv_support` を実行してみればわかります。
@z

@x
  If your Mac supports the Hypervisor framework, the command prints `kern.hv_support: 1`.
@y
  {% comment %}
  If your Mac supports the Hypervisor framework, the command prints `kern.hv_support: 1`.
  {% endcomment %}
  利用している Mac が Hypervisor フレームワークをサポートしている場合は、上のコマンドの出力に `kern.hv_support: 1` が表示されます。
@z

@x
- **macOS must be version 10.14 or newer**. That is, Mojave or Catalina. We recommend upgrading to the latest version of macOS.
@y
{% comment %}
- **macOS must be version 10.14 or newer**. That is, Mojave or Catalina. We recommend upgrading to the latest version of macOS.
{% endcomment %}
- **macOS はバージョン 10.14 またはそれ以降であること**。
  つまり Catalina または Mojave であることが必要です。
  macOS は最新バージョンにアップグレードすることをお勧めします。
@z

@x
  If you experience any issues after upgrading your macOS to version 10.15, you must install the latest version of Docker Desktop to be compatible with this version of macOS.
@y
  {% comment %}
  If you experience any issues after upgrading your macOS to version 10.15, you must install the latest version of Docker Desktop to be compatible with this version of macOS.
  {% endcomment %}
  macOS をバージョン 10.15 にアップグレードしたときに問題が発生した場合は、その macOS のバージョンと互換性のある、最新の Docker Desktop をインストールすることが必要になります。
@z

@x
  **Note:** Docker supports Docker Desktop on the most recent versions of macOS. Docker Desktop currently supports macOS Mojave and macOS Catalina.
@y
  {% comment %}
  **Note:** Docker supports Docker Desktop on the most recent versions of macOS. Docker Desktop currently supports macOS Mojave and macOS Catalina.
  {% endcomment %}
  **メモ:** Docker では、ほぼ最新の macOS であれば Docker Desktop をサポートしています。
  Docker Desktop が現時点でサポートするのは、macOS Catalina、macOS Mojave です。
@z

@x
    As new major versions of macOS are made generally available, Docker stops supporting the oldest version and support the newest version of macOS.
@y
   {% comment %}
    As new major versions of macOS are made generally available, Docker stops supporting the oldest version and support the newest version of macOS.
   {% endcomment %}
    macOS の最新メジャーバージョンが公開された場合、Docker はそれまでの一番古い対応バージョンへのサポートを停止し、最新版をサポート対象とします。
@z

@x
- At least 4 GB of RAM.
@y
{% comment %}
- At least 4 GB of RAM.
{% endcomment %}
- RAM 容量は最低でも 4GB
@z

@x
- VirtualBox prior to version 4.3.30 must not be installed as it is not compatible with Docker Desktop.
@y
{% comment %}
- VirtualBox prior to version 4.3.30 must not be installed as it is not compatible with Docker Desktop.
{% endcomment %}
- VirtualBox バージョン 4.3.30 以前はインストールしないでください。
  Docker Desktop との互換性がないからです。
@z

@x
## What's included in the installer
@y
{% comment %}
## What's included in the installer
{% endcomment %}
{: #whats-included-in-the-installer }
## インストーラーに含まれるもの
@z

@x
The Docker Desktop installation includes
  [Docker Engine](../engine/index.md), Docker CLI client,
  [Docker Compose](../compose/index.md), [Notary](../notary/getting_started.md), [Kubernetes](https://github.com/kubernetes/kubernetes/), and [Credential Helper](https://github.com/docker/docker-credential-helpers/).
@y
{% comment %}
The Docker Desktop installation includes
  [Docker Engine](../engine/index.md), Docker CLI client,
  [Docker Compose](../compose/index.md), [Notary](../notary/getting_started.md), [Kubernetes](https://github.com/kubernetes/kubernetes/), and [Credential Helper](https://github.com/docker/docker-credential-helpers/).
{% endcomment %}
* Docker Desktop のインストールにより以下のものが利用できます。
  [Docker Engine](../engine/index.md)、Docker CLI クライアント、[Docker Compose](../compose/index.md)、[Notary](../notary/getting_started/)、[Kubernetes](https://github.com/kubernetes/kubernetes/)、[Credential Helper](https://github.com/docker/docker-credential-helpers/)。
@z

@x
## Install and run Docker Desktop on Mac
@y
{% comment %}
## Install and run Docker Desktop on Mac
{% endcomment %}
{: #install-and-run-docker-desktop-on-Mac }
## Docker Desktop の Mac へのインストールと実行
@z

@x
1. Double-click `Docker.dmg` to open the installer, then drag the Docker icon to
    the Applications folder.
@y
{% comment %}
1. Double-click `Docker.dmg` to open the installer, then drag the Docker icon to
    the Applications folder.
{% endcomment %}
1. `Docker.dmg` をダブルクリックしてインストーラーを開きます。
    Docker アイコンをアプリケーションフォルダーへドラッグします。
@z

@x
      ![Install Docker app](images/docker-app-drag.png)
@y
      {% comment %}
      ![Install Docker app](images/docker-app-drag.png)
      {% endcomment %}
      ![Docker アプリのインストール](images/docker-app-drag.png)
@z

@x
2. Double-click `Docker.app` in the Applications folder to start Docker. (In the example below, the Applications folder is in "grid" view mode.)
@y
{% comment %}
2. Double-click `Docker.app` in the Applications folder to start Docker. (In the example below, the Applications folder is in "grid" view mode.)
{% endcomment %}
2. アプリケーションフォルダー内の `Docker.app` をダブルクリックして Docker を起動します。
    （以下の例において、アプリケーションフォルダーは「グリッド」表示モードにしています。）
@z

@x
    ![Docker app in Hockeyapp](images/docker-app-in-apps.png)
@y
    {% comment %}
    ![Docker app in Hockeyapp](images/docker-app-in-apps.png)
    {% endcomment %}
    ![Hockeyapp 内の Docker](images/docker-app-in-apps.png)
@z

@x
    The Docker menu in the top status bar indicates that Docker Desktop is running, and accessible from a terminal.
@y
    {% comment %}
    The Docker menu in the top status bar indicates that Docker Desktop is running, and accessible from a terminal.
    {% endcomment %}
    最上段のスタータスバーにある Docker メニューには Docker Desktop が起動していることが示されているので、ターミナル画面からアクセスすることができます。
@z

@x
      ![Whale in menu bar](images/whale-in-menu-bar.png)
@y
      {% comment %}
      ![Whale in menu bar](images/whale-in-menu-bar.png)
      {% endcomment %}
      ![メニューバー内のクジラアイコン](images/whale-in-menu-bar.png)
@z

@x
    If you've just installed the app, Docker Desktop launches the onboarding tutorial. The tutorial includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
@y
    {% comment %}
    If you've just installed the app, Docker Desktop launches the onboarding tutorial. The tutorial includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
    {% endcomment %}
    インストーラーによるインストールを終えたら、Docker Desktop はオンボードのチュートリアルを開始します。
    このチュートリアルでは、単純な課題を通じてサンプルの Docker イメージを構築し、コンテナーとして実行、そのイメージを Docker Hub にプッシュして保存することを行います。
@z

@x
    ![Docker Quick Start tutorial](images/docker-tutorial-mac.png)
@y
    {% comment %}
    ![Docker Quick Start tutorial](images/docker-tutorial-mac.png)
    {% endcomment %}
    ![Docker クィックスタートチュートリアル](images/docker-tutorial-mac.png)
@z

@x
3. Click the Docker menu (![whale menu](images/whale-x.png){: .inline}) to see
**Preferences** and other options.
@y
{% comment %}
3. Click the Docker menu (![whale menu](images/whale-x.png){: .inline}) to see
**Preferences** and other options.
{% endcomment %}
3.  Docker メニュー (![クジラメニュー](images/whale-x.png){: .inline}) をクリックして、**Preferences** やその他のオプションを確認します。
@z

@x
4. Select **About Docker** to verify that you have the latest version.
@y
{% comment %}
4. Select **About Docker** to verify that you have the latest version.
{% endcomment %}
4.  **About Docker** をクリックして、最新版を入手していることを確認します。
@z

@x
Congratulations! You are now successfully running Docker Desktop.
@y
{% comment %}
Congratulations! You are now successfully running Docker Desktop.
{% endcomment %}
おめでとうございます！
Docker Desktop を正常に実行することができました。
@z

@x
If you would like to rerun the tutorial, go to the Docker Desktop menu 
and select **Learn**.
@y
{% comment %}
If you would like to rerun the tutorial, go to the Docker Desktop menu 
and select **Learn**.
{% endcomment %}
チュートリアルを再実行したい場合は Docker Desktop メニューから **Learn** を実行してください。
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
To unistall Docker Desktop from your Mac:
@y
{% comment %}
To unistall Docker Desktop from your Mac:
{% endcomment %}
Mac から Docker Desktop をアンインストールするには以下を実行します。
@z

@x
1. From the Docker menu, select **Troubleshoot** and then select **Uninstall**.
2. Click **Uninstall** to confirm your selection.
@y
{% comment %}
1. From the Docker menu, select **Troubleshoot** and then select **Uninstall**.
2. Click **Uninstall** to confirm your selection.
{% endcomment %}
1. Docker メニューから **Troubleshoot**、**Uninstall** を選択します。
2. 選択が正しければ **Uninstall** をクリックします。
@z

@x
> **Note:** Uninstalling Docker Desktop will destroy Docker containers and images local to the machine and remove the files generated by the application.
@y
{% comment %}
> **Note:** Uninstalling Docker Desktop will destroy Docker containers and images local to the machine and remove the files generated by the application.
{% endcomment %}
> **メモ:** Docker Desktop をアンインストールすると、マシン上のローカルな Docker コンテナーやイメージ、あるいはアプリケーションによって生成されたファイル類はすべて削除されます。
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
Docker Desktop では安定版と最新版の切り替えができるようになっています。
ただし **一度にインストールしておくことができるバージョンはただ一つです**。
安定版と最新版を切り替えると、開発環境を不安定にする原因となることがあります。
特に、より新しい最新版から、それに比べて古い安定版に切り替える場合には、注意してください。
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
たとえば、より新しい最新版によって生成したコンテナーは、安定版に切り替えたときに動作しない場合があります。
それは最新版の機能を利用してコンテナーを生成している場合であり、そのような機能が安定版にはないからです。
したがって最新版においてコンテナーを生成して利用する場合には十分に注意してください。
問題の解決ややり直しは自分で行わなければならない、そういうお試し版であることを覚えておいてください。
@z

@x
Experimental features are turned on by default on Edge releases. However, when you switch from a Stable to an Edge release, you must turn on the experimental features flag to access experimental features. From the Docker Desktop menu, click **Preferences** > **Command Line** and then turn on the **Enable experimental features** toggle. Click **Apply & Restart** for the changes to take effect.
@y
{% comment %}
Experimental features are turned on by default on Edge releases. However, when you switch from a Stable to an Edge release, you must turn on the experimental features flag to access experimental features. From the Docker Desktop menu, click **Preferences** > **Command Line** and then turn on the **Enable experimental features** toggle. Click **Apply & Restart** for the changes to take effect.
{% endcomment %}
試験的機能は、最新版においてはデフォルトで有効になっています。
しかし安定版から最新版に切り替えた場合は、試験的機能のフラグを有効にしないと、その機能にアクセスすることはできません。
Docker Desktop メニューから **Preferences** > **Command Line** をクリックして、**Enable experimental features**（試験的機能の有効化）トグルをオンにしてください。
そして **Apply & Restart** をクリックして変更を適用します。
@z

@x
To safely switch between Edge and Stable versions, ensure you save images and export the containers you need, then uninstall the current version before installing another. For more information, see the section **Save and Restore data** below.
@y
{% comment %}
To safely switch between Edge and Stable versions, ensure you save images and export the containers you need, then uninstall the current version before installing another. For more information, see the section **Save and Restore data** below.
{% endcomment %}
最新版と安定版を安全に切り替えるために、イメージの保存や、必要に応じてコンテナーのエクスポートを行っておいてください。
これを行ってから、旧バージョンをアンインストールし、新バージョンをインストールするようにしてください。
詳しくは、以下の **データの保存と復元** の節を参照してください。
@z

@x
### Save and restore data
@y
{% comment %}
### Save and restore data
{% endcomment %}
{: #savevand-restore-data }
### データの保存と復元
@z

@x
You can use the following procedure to save and restore images and container data. For example, if you want to switch between Edge and Stable, or to reset your VM disk:
@y
{% comment %}
You can use the following procedure to save and restore images and container data. For example, if you want to switch between Edge and Stable, or to reset your VM disk:
{% endcomment %}
イメージやコンテナーのデータを保存し復元するためには、以下に示す手順を実施します。
たとえば最新版から安定版に切り替える場合、あるいは VM ディスクを入れ替える場合とします。
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
1. `docker save -o images.tar image1 [image2 ...]` を実行して、対象とするイメージを保存します。
   Docker Engine のコマンドラインインターフェースにある [save](/engine/reference/commandline/save) コマンドを参照してください。
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
2. `docker export -o myContainner1.tar container1` を実行して、対象とするコンテナーをエクスポートします。
    Docker Engine のコマンドラインインターフェースにある [export](/engine/reference/commandline/export) コマンドを参照してください。
@z

@x
3. Uninstall the current version of Docker Desktop and install a different version (Stable or Edge), or reset your VM disk.
@y
{% comment %}
3. Uninstall the current version of Docker Desktop and install a different version (Stable or Edge), or reset your VM disk.
{% endcomment %}
3. Docker Desktop の現バージョンをアンインストールし、別のバージョン（安定版あるいは最新版) をインストールします。
   あるいは VM ディスクを入れ替えます。
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
    Docker Engine の [load](/engine/reference/commandline/load) コマンドを参照してください。
@z

@x
5. Use `docker import -i myContainer1.tar` to create a filesystem image
    corresponding to the previously exported containers. See
    [import](/engine/reference/commandline/import) in the Docker Engine.
@y
{% comment %}
5. Use `docker import -i myContainer1.tar` to create a filesystem image
    corresponding to the previously exported containers. See
    [import](/engine/reference/commandline/import) in the Docker Engine.
{% endcomment %}
5. `docker import -i myContainer1.tar` を実行して、上でエクスポートしたコンテナーに応じたファイルシステムイメージを生成します。
    Docker Engine の [import](/engine/reference/commandline/import) コマンドを参照してください。
@z

@x
For information on how to back up and restore data volumes, see [Backup, restore, or migrate data volumes](/storage/volumes/#backup-restore-or-migrate-data-volumes).
@y
{% comment %}
For information on how to back up and restore data volumes, see [Backup, restore, or migrate data volumes](/storage/volumes/#backup-restore-or-migrate-data-volumes).
{% endcomment %}
データボリュームのバックアップと復元方法については、[データボリュームのバックアップ、復元、移行](/storage/volumes/#backup-restore-or-migrate-data-volumes) を参照してください。
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
- [Getting started](index.md) provides an overview of Docker Desktop on Mac, basic Docker command examples, how to get help or give feedback, and links to other topics about Docker Desktop on Mac.
- [Troubleshooting](troubleshoot.md) describes common problems, workarounds, how
  to run and submit diagnostics, and submit issues.
- [FAQs](faqs.md) provide answers to frequently asked questions.
- [Release notes](release-notes.md) lists component updates, new features, and
  improvements associated with Stable releases. For information about Edge releases, see
  [Edge release notes](edge-release-notes.md).
- [Get started with Docker](/get-started/) provides a general Docker tutorial.
@y
{% comment %}
- [Getting started](index.md) provides an overview of Docker Desktop on Mac, basic Docker command examples, how to get help or give feedback, and links to other topics about Docker Desktop on Mac.
- [Troubleshooting](troubleshoot.md) describes common problems, workarounds, how
  to run and submit diagnostics, and submit issues.
- [FAQs](faqs.md) provide answers to frequently asked questions.
- [Release notes](release-notes.md) lists component updates, new features, and
  improvements associated with Stable releases. For information about Edge releases, see
  [Edge release notes](edge-release-notes.md).
- [Get started with Docker](/get-started/) provides a general Docker tutorial.
{% endcomment %}
* [はじめよう](index.md)では Mac 上での Docker Desktop の概要、基本的な Docker コマンド例、ヘルプを得たりフィードバックを行う方法、また Mac 上の Docker Desktop に関する他のトピックへのリンクを示しています。
* [トラブルシューティング](troubleshoot.md) では一般的な質問、解決方法、診断実行や課題送信などを示しています。
* [FAQ](faqs.md) はよくたずねられる質問とその回答を示します。
* [リリースノート](release-notes.md) ではコンポーネントのアップデート、新機能、また安定版に関連した改善機能を示しています。
  最新版については [最新版リリースノート](edge-release-notes.md) を参照してください。
* [Docker をはじめよう](/get-started/) は Docker の全般的なチュートリアルです。
@z
