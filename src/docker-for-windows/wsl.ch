%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop WSL 2 backend
keywords: WSL, WSL 2 Tech Preview, Windows Subsystem for Linux, WSL 2 backend Docker
redirect_from:
- /docker-for-windows/wsl-tech-preview/
title: Docker Desktop WSL 2 backend
toc_min: 2
toc_max: 3
---
@y
---
description: Docker Desktop WSL 2 backend
keywords: WSL, WSL 2 Tech Preview, Windows Subsystem for Linux, WSL 2 backend Docker
redirect_from:
- /docker-for-windows/wsl-tech-preview/
title: Docker Desktop WSL 2 バックエンド
toc_min: 2
toc_max: 3
---
@z

@x
Windows Subsystem for Linux (WSL) 2 introduces a significant architectural change as it is a full Linux kernel built by Microsoft, allowing Linux containers to run natively without emulation. With Docker Desktop running on WSL 2, users can leverage Linux workspaces and avoid having to maintain both Linux and Windows build scripts. In addition, WSL 2 provides improvements to file system sharing, boot time, and allows access to some cool new features for Docker Desktop users.
@y
{% comment %}
Windows Subsystem for Linux (WSL) 2 introduces a significant architectural change as it is a full Linux kernel built by Microsoft, allowing Linux containers to run natively without emulation. With Docker Desktop running on WSL 2, users can leverage Linux workspaces and avoid having to maintain both Linux and Windows build scripts. In addition, WSL 2 provides improvements to file system sharing, boot time, and allows access to some cool new features for Docker Desktop users.
{% endcomment %}
Windows Subsystem for Linux (WSL) 2 は、Microsoft がビルドした完全な Linux カーネルを導入する、画期的な構造変化をもたらします。
これにより Linux コンテナーはエミュレーションとしてではなく、ネイティブな実行が可能になります。
WSL 2 上において Docker Desktop を実行すれば、Linux ワークスペースの活用が可能となり、Linux と Windows の双方に対するビルドスクリプトを準備する必要はなくなります。
また WSL 2 では、ファイルシステム共有や起動時間に関する改善がなされていて、Docker Desktop ユーザーにとって、優れた機能を利用できるものになりました。
@z

@x
Docker Desktop uses the dynamic memory allocation feature in WSL 2 to greatly improve the resource consumption. This means, Docker Desktop only uses the required amount of CPU and memory resources it needs, while enabling CPU and memory-intensive tasks such as building a container to run much faster.
@y
{% comment %}
Docker Desktop uses the dynamic memory allocation feature in WSL 2 to greatly improve the resource consumption. This means, Docker Desktop only uses the required amount of CPU and memory resources it needs, while enabling CPU and memory-intensive tasks such as building a container to run much faster.
{% endcomment %}
Docker Desktop では WSL 2 内の動的メモリ割り当て機能を活用して、リソース消費を劇的に改善しています。
つまり Docker Desktop は、求められている CPU やメモリリソースだけを利用するようになったということです。
そしてコンテナーをビルドする処理のように、CPU やメモリへの負荷が高いタスクは、より速く処理実行できます。
@z

@x
Additionally, with WSL 2, the time required to start a Docker daemon after a cold start is significantly faster. It takes less than 10 seconds to start the Docker daemon when compared to almost a minute in the previous version of Docker Desktop.
@y
{% comment %}
Additionally, with WSL 2, the time required to start a Docker daemon after a cold start is significantly faster. It takes less than 10 seconds to start the Docker daemon when compared to almost a minute in the previous version of Docker Desktop.
{% endcomment %}
さらに、コールドスタート後の Docker デーモン起動にかかる時間は、かなり速くなります。
Docker デーもの起動時間は、従来の Docker Desktop ではおよそ 1 分は要していたものが、今は 10 秒以下に抑えられています。
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
Before you install the Docker Desktop WSL 2 backend, you must complete the following steps:
@y
{% comment %}
Before you install the Docker Desktop WSL 2 backend, you must complete the following steps:
{% endcomment %}
Docker Desktop WSL 2 バックエンドをインストールするにあたっては、事前に以下の手順を行っておく必要があります。
@z

@x
1. Install Windows 10, version 1903 or higher.
2. Enable WSL 2 feature on Windows. For detailed instructions, refer to the [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
3. Download and install the [Linux kernel update package](https://docs.microsoft.com/windows/wsl/wsl2-kernel).
@y
{% comment %}
1. Install Windows 10, version 1903 or higher.
2. Enable WSL 2 feature on Windows. For detailed instructions, refer to the [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
3. Download and install the [Linux kernel update package](https://docs.microsoft.com/windows/wsl/wsl2-kernel).
{% endcomment %}
1. Windows 10、バージョン 2004 またはそれ以上をインストールします。
2. Windows 上において WSL 2 機能を有効にします。
   詳しい手順については [Microsoft のドキュメント](https://docs.microsoft.com/en-us/windows/wsl/install-win10) を参照してください。
3. [Linux カーネル更新プログラムパッケージ](https://docs.microsoft.com/windows/wsl/wsl2-kernel) をダウンロードしてインストールします。
@z

@x
## Best practices
@y
{% comment %}
## Best practices
{% endcomment %}
{: #best-practices }
## ベストプラクティス
@z

@x
- To get the best out of the file system performance when bind-mounting files, we recommend storing source code and other data that is bind-mounted into Linux containers (i.e., with `docker run -v <host-path>:<container-path>`) in the Linux filesystem, rather than the Windows filesystem.
@y
{% comment %}
- To get the best out of the file system performance when bind-mounting files, we recommend storing source code and other data that is bind-mounted into Linux containers (i.e., with `docker run -v <host-path>:<container-path>`) in the Linux filesystem, rather than the Windows filesystem.
{% endcomment %}
- バインドマウント利用時のファイルシステム性能を最大化するには、以下を行います。
  なおバインドマウントされたソースコードや関連データは、Windows ファイルシステムではない Linux ファイルシステムを有する Linux コンテナーに（たとえば`docker run -v <host-path>:<container-path>`を使って）保存することをお勧めします。
@z

@x
  - Linux containers only receive file change events ("inotify events") if the
      original files are stored in the Linux filesystem. For example, some web development workflows rely on inotify events for automatic reloading when files have changed.
  - Performance is much higher when files are bind-mounted from the Linux
      filesystem, rather than remoted from the Windows host. Therefore avoid
      `docker run -v /mnt/c/users:/users` (where `/mnt/c` is mounted from Windows).
  - Instead, from a Linux shell use a command like `docker run -v ~/my-project:/sources <my-image>`
      where `~` is expanded by the Linux shell to `$HOME`.
- If you have concerns about the size of the docker-desktop-data VHDX, or need to change it, take a look at the [WSL tooling built into Windows](https://docs.microsoft.com/en-us/windows/wsl/wsl2-ux-changes#understanding-wsl-2-uses-a-vhd-and-what-to-do-if-you-reach-its-max-size).
- If you have concerns about CPU or memory usage, you can configure limits on the memory, CPU, Swap size allocated to the [WSL 2 utility VM](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig).
- To avoid any potential conflicts with using WSL 2 on Docker Desktop, you must [uninstall any previous versions of Docker Engine](https://docs.docker.com/install/linux/docker-ce/ubuntu/#uninstall-docker-engine---community) and CLI installed directly through Linux distributions before installing Docker Desktop.
@y
{% comment %}
  - Linux containers only receive file change events ("inotify events") if the
      original files are stored in the Linux filesystem. For example, some web development workflows rely on inotify events for automatic reloading when files have changed.
  - Performance is much higher when files are bind-mounted from the Linux
      filesystem, rather than remoted from the Windows host. Therefore avoid
      `docker run -v /mnt/c/users:/users` (where `/mnt/c` is mounted from Windows).
  - Instead, from a Linux shell use a command like `docker run -v ~/my-project:/sources <my-image>`
      where `~` is expanded by the Linux shell to `$HOME`.
- If you have concerns about the size of the docker-desktop-data VHDX, or need to change it, take a look at the [WSL tooling built into Windows](https://docs.microsoft.com/en-us/windows/wsl/wsl2-ux-changes#understanding-wsl-2-uses-a-vhd-and-what-to-do-if-you-reach-its-max-size).
- If you have concerns about CPU or memory usage, you can configure limits on the memory, CPU, Swap size allocated to the [WSL 2 utility VM](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig).
- To avoid any potential conflicts with using WSL 2 on Docker Desktop, you must [uninstall any previous versions of Docker Engine](https://docs.docker.com/install/linux/docker-ce/ubuntu/#uninstall-docker-engine---community) and CLI installed directly through Linux distributions before installing Docker Desktop.
{% endcomment %}
  - 元のファイルを Linux ファイルシステムに保存しているのであれば、Linux コンテナーはファイル変更のイベント（「inotify」イベント）のみを受けつけるようにしてください。
    たとえばウェブ開発のワークフローにおいては、ファイル変更が発生した際に自動リロードを行う inotify イベントを用いる場合があります。
  - Windows ホストからリモート接続する場合に比べて、Linux ファイルシステムからバインドマウントされたファイルにアクセスする方が、性能ははるかに向上します。
    したがって`docker run -v /mnt/c/users:/users`（ここで`/mnt/c`は Windows からのマウント）とすることは避けてください。
  - 上のかわりに Linux シェルから`docker run -v ~/my-project:/sources <my-image>`のようなコマンドを実行してください。
    ここで`~`は Linux シェルが`$HOME`に展開することを表わします。
- Docker Desktop のデータ VHDX の容量が気になったり、変更を必要とする場合は、[WSL tooling built into Windows](https://docs.microsoft.com/en-us/windows/wsl/wsl2-ux-changes#understanding-wsl-2-uses-a-vhd-and-what-to-do-if-you-reach-its-max-size) を確認してください。
- CPU や メモリの使用量について気にかける必要がある場合は [WSL 2 ユーティリティー VM](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig) に割り当てられているメモリ、CPU、スワップサイズの制限を設定することができます。
- Docker Desktop 上での WSL 2 利用において、衝突のリスクを避けるには、[Docker Engine の古いバージョンのアンインストール](../../engine/install/ubuntu/#uninstall-docker-engine) を行い、Docker Desktop のインストール前に Linux ディストリビューションに対して CLI を直接インストールするようにしてください。
@z

@x
## Download
@y
{% comment %}
## Download
{% endcomment %}
{: #download }
## ダウンロード
@z

@x
Download [Docker Desktop Stable 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) or a later release.
@y
{% comment %}
Download [Docker Desktop Stable 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) or a later release.
{% endcomment %}
[Docker Desktop 安定版 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) またはこれよりも最新版をダウンロードします。
@z

@x
## Install
@y
{% comment %}
## Install
{% endcomment %}
{: #install }
## インストール
@z

@x
Ensure you have completed the steps described in the Prerequisites section **before** installing the Docker Desktop Stable 2.3.0.2 release.
@y
{% comment %}
Ensure you have completed the steps described in the Prerequisites section **before** installing the Docker Desktop Stable 2.3.0.2 release.
{% endcomment %}
Docker Desktop 安定版 2.3.0.2 をインストールする **前に**、上の前提条件の節に示した各手順をすべて終えていることを確認してください。
@z

@x
1. Follow the usual installation instructions to install Docker Desktop. If you are running a supported system, Docker Desktop prompts you to enable WSL 2 during installation. Read the information displayed on the screen and enable WSL 2 to continue.
2. Start Docker Desktop from the Windows Start menu.
3. From the Docker menu, select **Settings** > **General**.
@y
{% comment %}
1. Follow the usual installation instructions to install Docker Desktop. If you are running a supported system, Docker Desktop prompts you to enable WSL 2 during installation. Read the information displayed on the screen and enable WSL 2 to continue.
2. Start Docker Desktop from the Windows Start menu.
3. From the Docker menu, select **Settings** > **General**.
{% endcomment %}
1. Docker Desktop のインストールは、通常のインストール手順に従います。
   サポートされているシステム上では、Docker Desktop のインストールの際に WSL 2 を有効にするかどうかが尋ねられます。
   画面上に示される説明をよく読み、WSL 2 を有効化した上で操作を続けます。
2. Windows スタートメニューから Docker Desktop を起動します。
3. Docker メニューから **Settings** > **General** を実行します。
@z

@x
    ![Enable WSL 2](images/wsl2-enable.png){:width="750px"}
@y
    {% comment %}
    ![Enable WSL 2](images/wsl2-enable.png){:width="750px"}
    {% endcomment %}
    ![WSL 2 の有効化](images/wsl2-enable.png){:width="750px"}
@z

@x
4. Select the **Use WSL 2 based engine** check box.
@y
{% comment %}
4. Select the **Use WSL 2 based engine** check box.
{% endcomment %}
4. チェックボックス **Use WSL 2 based engine** を選択します。
@z

@x
    If you have installed Docker Desktop on a system that supports WSL 2, this option will be enabled by default.
@y
    {% comment %}
    If you have installed Docker Desktop on a system that supports WSL 2, this option will be enabled by default.
    {% endcomment %}
    WSL 2 をサポートするシステム上に Docker Desktop をインストールした場合、このオプションはデフォルトで有効になっています。
@z

@x
5. Click **Apply & Restart**.
6. Ensure the distribution runs in WSL 2 mode. WSL can run distributions in both v1 or v2 mode.
@y
{% comment %}
5. Click **Apply & Restart**.
6. Ensure the distribution runs in WSL 2 mode. WSL can run distributions in both v1 or v2 mode.
{% endcomment %}
5. **Apply & Restart** をクリックします。
6. ディストリビューションが WSL 2 モードで動作していることを確認します。
   WSL が実行されるモードには v1 モードと v2 モードがあります。
@z

@x
    To check the WSL mode, run:
@y
    {% comment %}
    To check the WSL mode, run:
    {% endcomment %}
    WSL モードを確認するには以下を実行します。
@z

@x
     `wsl.exe -l -v`
@y
     `wsl.exe -l -v`
@z

@x
    To upgrade your existing Linux distro to v2, run:
@y
    {% comment %}
    To upgrade your existing Linux distro to v2, run:
    {% endcomment %}
    現在の Linux ディストリビューションを v2 にアップグレードするには、以下を実行します。
@z

@x
    `wsl.exe --set-version (distro name) 2`
@y
    {% comment %}
    `wsl.exe --set-version (distro name) 2`
    {% endcomment %}
    `wsl.exe --set-version (ディストリビューション名) 2`
@z

@x
    To set v2 as the default version for future installations, run:
@y
    {% comment %}
    To set v2 as the default version for future installations, run:
    {% endcomment %}
    今後のインストールを考慮して、デフォルトバージョンを v2 に設定しておくには、以下を実行します。
@z

@x
    `wsl.exe --set-default-version 2`
@y
    `wsl.exe --set-default-version 2`
@z

@x
7. When Docker Desktop restarts, go to **Settings** > **Resources** > **WSL Integration**.
@y
{% comment %}
7. When Docker Desktop restarts, go to **Settings** > **Resources** > **WSL Integration**.
{% endcomment %}
7. Docker Desktop が再起動したら、**Settings** > **Resources** > **WSL Integration** を実行します。
@z

@x
    WSL Integration will be enabled on your default WSL distribution. To change your default WSL distro, run `wsl --set-default <distro name>`.
@y
    {% comment %}
    WSL Integration will be enabled on your default WSL distribution. To change your default WSL distro, run `wsl --set-default <distro name>`.
    {% endcomment %}
    WSL 統合環境が、デフォルトの WSL ディストリビューション上において有効になります。
    デフォルトの WSL ディストリビューションを変更するには `wsl --set-default <ディストリビューション名>` を実行します。
@z

@x
    For example, to set Ubuntu as your default WSL distro, run `wsl --set-default ubuntu`.
@y
    {% comment %}
    For example, to set Ubuntu as your default WSL distro, run `wsl --set-default ubuntu`.
    {% endcomment %}
    たとえばデフォルトの WSL ディストリビューションとして Ubuntu を設定する場合は `wsl --set-default ubuntu` を実行します。
@z

@x
    Optionally, select any additional distributions you would like to enable WSL 2 on.
@y
    {% comment %}
    Optionally, select any additional distributions you would like to enable WSL 2 on.
    {% endcomment %}
    他に WSL 2 を有効にしたいディストリビューションがあれば、その設定を行います。
@z

@x
    ![WSL 2 Choose Linux distro](images/wsl2-choose-distro.png)
@y
    {% comment %}
    ![WSL 2 Choose Linux distro](images/wsl2-choose-distro.png)
    {% endcomment %}
    ![WSL 2 による Linux ディストリビューションの決定](images/wsl2-choose-distro.png)
@z

@x
8. Click **Apply & Restart**.
@y
{% comment %}
8. Click **Apply & Restart**.
{% endcomment %}
8. **Apply & Restart** をクリックします。
@z

@x
## Develop with Docker and WSL 2
@y
{% comment %}
## Develop with Docker and WSL 2
{% endcomment %}
## Docker と WSL 2 を用いた開発
@z

@x
The following section describes how to start developing your applications using Docker and WSL 2. We recommend that you have your code in your default Linux distribution for the best development experience using Docker and WSL 2. After you have enabled WSL 2 on Docker Desktop, you can start working with your code inside the Linux distro and ideally with your IDE still in Windows. This workflow can be pretty straightforward if you are using [VSCode](https://code.visualstudio.com/download).
@y
{% comment %}
The following section describes how to start developing your applications using Docker and WSL 2. We recommend that you have your code in your default Linux distribution for the best development experience using Docker and WSL 2. After you have enabled WSL 2 on Docker Desktop, you can start working with your code inside the Linux distro and ideally with your IDE still in Windows. This workflow can be pretty straightforward if you are using [VSCode](https://code.visualstudio.com/download).
{% endcomment %}
以下の節では、Docker と WSL 2 を利用したアプリケーション開発方法について説明します。
Docker と WSL 2 を利用して開発作業を進めていく際には、開発コードをデフォルトの Linux ディストリビューション内に配置して進めていくことが最適です。
Docker Desktop において WSL 2 を有効にしていれば、その Linux ディストリビューション内のソースコードでありながら、理想的に Windows 上の IDE の中で作業し続けることができます。
このような作業を進めるには [VSCode](https://code.visualstudio.com/download) を用いるのが最も自然な方法です。
@z

@x
1. Open VSCode and install the [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) extension. This extension allows you to work with a remote server in the Linux distro and your IDE client still on Windows.
2. Now, you can start working in VSCode remotely. To do this, open your terminal and type:
@y
{% comment %}
1. Open VSCode and install the [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) extension. This extension allows you to work with a remote server in the Linux distro and your IDE client still on Windows.
2. Now, you can start working in VSCode remotely. To do this, open your terminal and type:
{% endcomment %}
1. VSCode を開いて [リモート WSL 拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) をインストールします。
   この拡張機能は、Linux ディストリビューション内のリモートサーバーで作業をしつつ IDE クライアントは Windows のままとするものです。
2. そこで VSCode 内においてリモートに対する作業を開始します。
   これを行うにはターミナル画面を開いて以下を入力します。
@z

@x
    `wsl`
@y
    `wsl`
@z

@x
    `code .`
@y
    `code .`
@z

@x
    This opens a new VSCode connected remotely to your default Linux distro which you can check in the bottom corner of the screen.
@y
    {% comment %}
    This opens a new VSCode connected remotely to your default Linux distro which you can check in the bottom corner of the screen.
    {% endcomment %}
    この操作によって、デフォルト Linux ディストリビューションに対してリモート接続された新たな VSCode が開きます。
    画面下段からこのことが確認できます。
@z

@x
    Alternatively, you can type the name of your default Linux distro in your Start menu, open it, and then run `code` .
@y
    {% comment %}
    Alternatively, you can type the name of your default Linux distro in your Start menu, open it, and then run `code` .
    {% endcomment %}
    別の方法として、スタートメニューからデフォルト Linux ディストリビューション名を入力してこれを開き、その後に`code`を実行する方法もあります。
@z

@x
3. When you are in VSCode, you can use the terminal in VSCode to pull your code and start working natively from your Windows machine.
@y
{% comment %}
3. When you are in VSCode, you can use the terminal in VSCode to pull your code and start working natively from your Windows machine.
{% endcomment %}
3. VSCode 内では VSCode のターミナル画面を使うことができます。
   これによってソースコードをプルし、Windows マシン内からネイティブ環境のように作業を進めていくことができます。
@z

@x
## Feedback
@y
{% comment %}
## Feedback
{% endcomment %}
{: #feedback }
## フィードバック
@z

@x
Your feedback is very important to us. Please let us know your feedback by creating an issue in the [Docker Desktop for Windows GitHub](https://github.com/docker/for-win/issues) repository and adding the **WSL 2** label.
@y
{% comment %}
Your feedback is very important to us. Please let us know your feedback by creating an issue in the [Docker Desktop for Windows GitHub](https://github.com/docker/for-win/issues) repository and adding the **WSL 2** label.
{% endcomment %}
みなさんからのフィードバックは大変重要です。
フィードバックをいただくには、Github レポジトリ [Docker Desktop for Windows](https://github.com/docker/for-win/issues) に issue をあげて、**WSL 2** というラベルをつけてください。
@z
