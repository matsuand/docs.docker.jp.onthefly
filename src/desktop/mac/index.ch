%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Getting Started
keywords: mac, tutorial, run, docker, local, machine
redirect_from:
- /docker-for-mac/
- /docker-for-mac/index/
- /docker-for-mac/mutagen/
- /docker-for-mac/mutagen-caching/
- /docker-for-mac/osx/
- /docker-for-mac/started/
- /engine/installation/mac/
- /installation/mac/
- /mac/
- /mac/started/
- /mackit/
- /mackit/getting-started/
- /docker-for-mac/osxfs/
- /docker-for-mac/osxfs-caching/
title: Docker Desktop for Mac user manual
---
@y
---
description: はじめよう。
keywords: mac, tutorial, run, docker, local, machine
redirect_from:
- /docker-for-mac/
- /docker-for-mac/index/
- /docker-for-mac/mutagen/
- /docker-for-mac/mutagen-caching/
- /docker-for-mac/osx/
- /docker-for-mac/started/
- /engine/installation/mac/
- /installation/mac/
- /mac/
- /mac/started/
- /mackit/
- /mackit/getting-started/
- /docker-for-mac/osxfs/
- /docker-for-mac/osxfs-caching/
title: Docker Desktop for Mac ユーザーマニュアル
---
@z

@x
Welcome to Docker Desktop! The Docker Desktop for Mac user manual provides information on how to configure and manage your Docker Desktop settings.
@y
Docker Desktop へようこそ！
Docker Desktop for Mac ユーザーマニュアルでは Docker Desktop 設定をどのように行い、管理していくのかを説明しています。
@z

@x
For information about Docker Desktop download, system requirements, and installation instructions, see [Install Docker Desktop](install.md).
@y
Docker Desktop のダウンロード、システム要件、インストール手順については [Docker Desktop のインストール](install.md) を参照してください。
@z

@x
## Preferences
@y
{: #preferences }
## Preferences メニュー
@z

@x
The Docker **Preferences** menu allows you to configure your Docker settings such as installation, updates, version channels, Docker Hub login,
and more.
@y
Docker の **Preferences** メニューでは Docker に対する設定として、インストール設定、アップデート、バージョンチャネル設定、Docker Hub ログインなどを行うことができます。
@z

@x
Choose the Docker menu ![whale menu](images/whale-x.png){: .inline} > **Preferences** from the
menu bar and configure the runtime options described below.
@y
メニューバー上の Docker メニュー ![クジラメニュー](images/whale-x.png){: .inline} から **Preferences** を選び、以降に示す実行時オプションを設定します。
@z

@x
### General
@y
{: #general }
### General タブ
@z

@x
![Preferences](images/menu/prefs-general.png){:width="750px"}
@y
![Preferences](images/menu/prefs-general.png){:width="750px"}
@z

@x
On the **General** tab, you can configure when to start Docker and specify other settings:
@y
**General** タブにおいて Docker の起動をいつ行うかなどを設定します。
@z

@x
- **Start Docker Desktop when you log in**: Automatically starts Docker Desktop when you open your session.
@y
- **Start Docker Desktop when you log in**（ログイン時に Docker Desktop を起動）＝ セッションを開始したときに自動的に Docker Desktop を起動します。
@z

@x
- **Include VM in Time Machine backups**: Select this option to back up the Docker Desktop virtual machine. This option is disabled by default.
@y
- **Include VM in Time Machine backups**（Time Machine バックアップに VM を含める）＝ Docker Desktop 仮想マシンのバックアップに関するオプションを設定します。
  このオプションはデフォルトでは無効になっています。
@z

@x
- **Use gRPC FUSE for file sharing**: Clear this check box to use the legacy osxfs file sharing instead.
@y
- **Use gRPC FUSE for file sharing**（ファイル共有での gRPC FUSE の利用）＝ このチェックボックスをオフにすると、ファイル共有として従来の osxfs を利用します。
@z

@x
- **Send usage statistics**: Docker Desktop sends diagnostics, crash reports, and usage data. This information helps Docker improve and troubleshoot the application. Clear the check box to opt out.
@y
- **Send usage statistics**（利用統計の送信）＝ Docker Desktop は、診断情報、クラッシュレポート、利用状況の各情報を送信します。
  この情報を通じて Docker は改良を行い、アプリケーションのトラブルシューティングに役立てています。
  チェックボックスをオフにすれば、データ送信を行いません。
@z

@x
- **Show weekly tips**: Displays useful advice and suggestions about using Docker.
@y
- **Show weekly tips**（1 週間ごとのアドバイス表示）＝ Docker 利用に関して便利なアドバイスや提案を表示します。
@z

@x
- **Open Docker Desktop dashboard at startup**: Automatically opens the dashboard when starting Docker Desktop.
@y
- **Open Docker Desktop dashboard at startup**（起動時の Docker Desktop ダッシュボードの自動起動）＝ Docker Desktop の起動時にダッシュボードを自動的に開きます。
@z

@x
- **Use Docker Compose V2**: Select this option to enable the `docker-compose` command to use Docker Compose V2. For more information, see [Docker Compose V2](../../compose/cli-command.md).
@y
- **Use Docker Compose V2**（Docker Compose V2 の利用）＝ このオプションを選択することで、`docker-compose`コマンドにより Docker Compose V2 の利用を有効にします。
  詳しくは [Docker Compose V2](../../compose/cli-command.md) を参照してください。
@z

@x
### Resources
@y
{: #resources }
### Resources タブ
@z

@x
The **Resources** tab allows you to configure CPU, memory, disk, proxies, network, and other resources.
@y
**Resources** タブは、CPU、メモリ、ディスク、プロキシー、ネットワークといったリソースを設定します。
@z

@x
#### Advanced
@y
{: #advanced }
#### Advanced タブ
@z

@x
On the Advanced tab, you can limit resources available to Docker.
@y
Advanced タブでは、Docker におけるリソースの利用制限を設定します。
@z

@x
![Advanced Preference
settings-advanced](images/menu/prefs-advanced.png){:width="750px"}
@y
![Advanced Preference
settings-advanced](images/menu/prefs-advanced.png){:width="750px"}
@z

@x
Advanced settings are:
@y
この Advanced 設定には以下のものがあります。
@z

@x
- **CPUs**: By default, Docker Desktop is set to use half the number of processors
available on the host machine. To increase processing power, set this to a
higher number; to decrease, lower the number.
@y
- **CPU** ＝ デフォルトにおいて Docker Desktop は、ホストマシン上で利用可能なプロセッサー数の半分を利用するものとして設定されています。
プロセッサー性能を向上させるには、この設定値を大きくします。
逆に抑止するには設定値を小さくします。
@z

@x
- **Memory**: By default, Docker Desktop is set to use `2` GB runtime memory,
allocated from the total available memory on your Mac. To increase the RAM, set this to a higher number. To decrease it, lower the number.
@y
- **メモリ** ＝ デフォルトにおいて Docker Desktop は、実行時メモリとして`2`GB を利用するものとして設定されています。
この値は Mac 上において利用可能な全メモリ容量の中から割り当てられます。
RAM 容量を増やすには、この設定値を大きくします。
逆に減らすには、この設定値を小さくします。
@z

@x
- **Swap**: Configure swap file size as needed. The default is 1 GB.
@y
- **スワップ** ＝ 必要に応じてスワップファイルサイズを設定します。
デフォルトは 1 GB です。
@z

@x
- **Disk image size**: Specify the size of the disk image.
@y
- **ディスクイメージサイズ** ＝ ディスクイメージのサイズを指定します。
@z

@x
- **Disk image location**: Specify the location of the Linux volume where containers and images are stored.
@y
- **ディスクイメージの保存場所** ＝ コンテナーやイメージが保存される Linux ボリュームの場所を指定します。
@z

@x
You can also move the disk image to a different location. If you attempt to move a disk image to a location that already has one, you get a prompt asking if you want to use the existing image or replace it.
@y
ディスクイメージの保存場所は、別のところにすることができます。
移動させようとした保存場所に、すでにディスクイメージが存在していた場合は、プロンプトが表示され、既存のイメージを利用するか、イメージを置き換えるかが問われます。
@z

@x
#### File sharing
@y
{: #file-sharing }
#### File sharing タブ
@z

@x
Use File sharing to allow local directories on the Mac to be shared with Linux containers.
This is especially useful for
editing source code in an IDE on the host while running and testing the code in a container.
By default the `/Users`, `/Volume`, `/private`, `/tmp` and `/var/folders` directory are shared. If your project is outside this directory then it must be added
to the list. Otherwise you may get `Mounts denied` or `cannot start service` errors at runtime.
@y
File sharing（ファイル共有）を利用すると、Mac 内のローカルディレクトリを Linux コンテナー間で共有できるようになります。
たとえばホストにある IDE 環境上でソースコードを編集し、コードの実行やテストはコンテナー内で行うような場合に、大変便利なものです。
デフォルトにおいて`/Users`、`/Volume`、`/private`、`/tmp`、`/var/folders`というディレクトリが共有されています。
開発プロジェクトが上記以外のディレクトリにある場合、その一覧にディレクトリを追加する必要があります。
これを行っていないと、実行時エラーとして `Mounts denied`（マウントが拒否されました）や `cannot start service`（サービスを起動できません）が発生します。
@z

@x
File share settings are:
@y
File share の設定には以下のものがあります。
@z

@x
- **Add a Directory**: Click `+` and navigate to the directory you want to add.
@y
- **Add a Directory**（ディレクトリの追加）＝ `+`をクリックして、追加したいディレクトリを指定します。
@z

@x
- **Apply & Restart** makes the directory available to containers using Docker's
  bind mount (`-v`) feature.
@y
- **Apply & Restart**（適用および再起動）＝  Docker のバインドマウント（`-v`）機能を利用して、コンテナー間でのディレクトリ共有を可能にします。
@z

@x
> Tips on shared folders, permissions, and volume mounts
>
 * Share only the directories that you need with the container. File sharing
 introduces overhead as any changes to the files on the host need to be notified
 to the Linux VM. Sharing too many files can lead to high CPU load and slow
 filesystem performance.
>
 * Shared folders are designed to allow application code to be edited 
 on the host while being executed in containers. For non-code items
 such as cache directories or databases, the performance will be much 
 better if they are stored in the Linux VM, using a [data volume](../../storage/volumes.md)
 (named volume) or [data container](../../storage/volumes.md).
>
 * If you share the whole of your home directory into a container, MacOS may
 prompt you to give Docker access to personal areas of your home directory such as
 your Reminders or Downloads.
>
 * By default, Mac file systems are case-insensitive while Linux is case-sensitive.
 On Linux, it is possible to create 2 separate files: `test` and `Test`, 
 while on Mac these filenames would actually refer to the same underlying file. 
 This can lead to problems where an app works correctly on a Mac 
 (where the file contents are shared) but fails when run in Linux in 
 production (where the file contents are distinct). To avoid this, Docker Desktop 
 insists that all shared files are accessed as their original case. Therefore, if a file 
 is created called `test`, it must be opened as `test`. Attempts to open `Test` will 
 fail with the error `No such file or directory`. Similarly, once a file called `test` 
 is created, attempts to create a second file called `Test` will fail. For more information, 
 see [Volume mounting requires file sharing for any project directories outside of `/Users`](troubleshoot.md#volume-mounting-requires-file-sharing-for-any-project-directories-outside-of-users).)
@y
> 共有フォルダー、パーミッション、ボリュームマウントに関するヒント
>
 * コンテナーにおいて必要となるディレクトリのみを共有するようにしてください。
   ファイル共有にはオーバーヘッドがあります。
   ホスト上のファイルへの変更は Linux VM に対する通知を必要とするためです。
   共有ファイルが多いと CPU の高負荷を発生させ、ファイルシステムの性能低下を引き起こします。
>
 * 共有フォルダーは、アプリケーションコードの編集をホスト上で行い、その実行はコンテナー内にて行うということを実現するために用いられます。
   ソースコード以外のキャッシュディレクトリやデータベースなどの場合は、[データボリューム](../../storage/volumes.md)（名前つきボリューム）や [データコンテナー](../../storage/volumes.md) を利用し、Linux VM 内に配置すれば、性能向上を図ることができます。
>
 * コンテナーに対してホームディレクトリ全体を共有する場合、MacOS からのプロンプトが表示され、ホームディレクトリ内の Reminders や Downloads などのような個人データへのアクセス権を Docker に与えるように示されます。
>
 * Linux のファイルシステムでは英字の大文字小文字が区別されますが、Mac はデフォルトではその区別は行われません。
   Linux 上では`test`と`Test`というファイルは 2 つの別ファイルとして生成可能です。
   一方 Mac の場合、この 2 つのファイル名は、同一のファイルを参照することになります。
   この状況から考えられるのは、Mac 上においてアプリが正しく動作する（それらのファイル内容を同一として扱う）ものであっても、Linux 上の本番環境に移行させて実行すると、失敗する（ファイル内容を別物として扱う）ということになります。
   この状況を回避するために Docker Desktop では、共有ファイルはその元々のファイル名によりアクセスすることを求めています。
   つまり`test`というファイルが生成されていて、これを開くには`test`として開かなければならないということです。
   `Test`として開こうとしたら`No such file or directory`というエラーとします。
   同様に`test`というファイルを生成しているなら、次に`Test`を生成しようとしたらエラーにするということです。
   詳しくは [Volume mounting requires file sharing for any project directories outside of `/Users`](troubleshoot.md#volume-mounting-requires-file-sharing-for-any-project-directories-outside-of-users) を参照してください。
@z

@x
#### Proxies
@y
{: #proxies }
#### Proxies タブ
@z

@x
Docker Desktop detects HTTP/HTTPS Proxy Settings from macOS and automatically
propagates these to Docker. For example, if you set your
proxy settings to `http://proxy.example.com`, Docker uses this proxy when
pulling containers.
@y
Docker Desktop では macOS の HTTP/HTTPS プロキシー設定を検出して、その内容を Docker に対して自動的に伝えます。
たとえばプロキシー設定を`http://proxy.example.com`としている場合、Docker はこのプロキシー情報を利用して、コンテナーのプル処理を行います。
@z

@x
Your proxy settings, however, will not be propagated into the containers you start.
If you wish to set the proxy settings for your containers, you need to define
environment variables for them, just like you would do on Linux, for example:
@y
しかしそのプロキシー設定は、起動したコンテナーには伝えられません。
コンテナーに対してプロキシー設定を行いたい場合は、Linux 上において行うのと同じように、環境変数を使って定義することが必要です。
たとえば以下のとおりです。
@z

@x
```console
$ docker run -e HTTP_PROXY=http://proxy.example.com:3128 alpine env

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=b7edf988b2b5
TERM=xterm
HOME=/root
HTTP_PROXY=http://proxy.example.com:3128
```
@y
```console
$ docker run -e HTTP_PROXY=http://proxy.example.com:3128 alpine env

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=b7edf988b2b5
TERM=xterm
HOME=/root
HTTP_PROXY=http://proxy.example.com:3128
```
@z

@x
For more information on setting environment variables for running containers,
see [Set environment variables](/engine/reference/commandline/run/#set-environment-variables--e---env---env-file).
@y
実行中のコンテナーに対して環境変数を設定する方法については [環境変数の設定](/engine/reference/commandline/run/#set-environment-variables--e---env---env-file) を参照してください。
@z

@x
#### Network
@y
{: #network }
#### Network タブ
@z

@x
You can configure Docker Desktop networking to work on a virtual private network (VPN). Specify a network address translation (NAT) prefix and subnet mask to enable Internet connectivity.
@y
Docker Desktop のネットワーク設定により、仮想プライベートネットワーク（VPN）上で動作するように設定することができます。
インターネットへの接続を有効にするには、ネットワークアドレス変換（NAT）のプリフィックスとサブネットマスクを設定していください。
@z

@x
### Docker Engine
@y
{: #docker-engine }
### Docker Engine タブ
@z

@x
The Docker Engine page allows you to configure the Docker daemon to determine how your containers run.
@y
Docker Engine のページでは、Docker デーモンに対して、コンテナーを実行させる方法を設定することができます。
@z

@x
Type a JSON configuration file in the box to configure the daemon settings. For a full list of options, see the Docker Engine
[dockerd commandline reference](/engine/reference/commandline/dockerd/){:target="_blank" rel="noopener" class="_"}.
@y
テキスト入力欄に JSON 設定ファイルを入力して、デーモンを設定します。
オプションの全一覧についてはDocker Engine の [dockerd コマンドラインリファレンス](/engine/reference/commandline/dockerd/){:target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
Click **Apply & Restart** to save your settings and restart Docker Desktop.
@y
**Apply & Restart** をクリックして設定内容を保存し、Docker Desktop を再起動します。
@z

@x
### Experimental Features
@y
{: #experimental-features }
### 試験的機能タブ
@z

@x
On the **Experimental Features** page, you can specify whether or not to enable experimental features.
@y
On the **Experimental Features** page, you can specify whether or not to enable experimental features.
@z

@x
Experimental features provide early access to future product functionality. These features are intended for testing and feedback only as they may change between releases without warning or can be removed entirely from a future release. Experimental features must not be used in production environments. Docker does not offer support for experimental features.
@y
Experimental features provide early access to future product functionality. These features are intended for testing and feedback only as they may change between releases without warning or can be removed entirely from a future release. Experimental features must not be used in production environments. Docker does not offer support for experimental features.
@z

@x
#### Enable the new Apple Virtualization framework
@y
#### Enable the new Apple Virtualization framework
@z

@x
Select **Use the new Virtualization framework** to allow Docker Desktop to use the new `virtualization.framework` instead of the ‘hypervisor.framework’. Ensure to reset your Kubernetes cluster when you enable the new Virtualization framework for the first time.
@y
Select **Use the new Virtualization framework** to allow Docker Desktop to use the new `virtualization.framework` instead of the ‘hypervisor.framework’. Ensure to reset your Kubernetes cluster when you enable the new Virtualization framework for the first time.
@z

@x
#### Enable VirtioFS
@y
#### Enable VirtioFS
@z

@x
 Docker Desktop for Mac lets developers use a new experimental file-sharing implementation called [virtiofS](https://virtio-fs.gitlab.io/){: target='_blank' rel='noopener' class='_'}; the current default is gRPC-FUSE. virtiofs has been found to significantly improve file sharing performance on macOS. For more details, see our blog post [Speed boost achievement unlocked on Docker Desktop 4.6 for Mac](https://www.docker.com/blog/speed-boost-achievement-unlocked-on-docker-desktop-4-6-for-mac/){:target="_blank" rel="noopener" class="_"}.
@y
 Docker Desktop for Mac lets developers use a new experimental file-sharing implementation called [virtiofS](https://virtio-fs.gitlab.io/){: target='_blank' rel='noopener' class='_'}; the current default is gRPC-FUSE. virtiofs has been found to significantly improve file sharing performance on macOS. For more details, see our blog post [Speed boost achievement unlocked on Docker Desktop 4.6 for Mac](https://www.docker.com/blog/speed-boost-achievement-unlocked-on-docker-desktop-4-6-for-mac/){:target="_blank" rel="noopener" class="_"}.
@z

@x
To enable virtioFS:
@y
To enable virtioFS:
@z

@x
1. Verify that you are on the following macOS version:
   - macOS 12.2 or later (for Apple Silicon)
   - macOS 12.3 or later (for Intel)
@y
1. Verify that you are on the following macOS version:
   - macOS 12.2 or later (for Apple Silicon)
   - macOS 12.3 or later (for Intel)
@z

@x
2. Select **Enable VirtioFS accelerated directory sharing** to enable virtioFS.
@y
2. Select **Enable VirtioFS accelerated directory sharing** to enable virtioFS.
@z

@x
3. Click **Apply & Restart**.
@y
3. Click **Apply & Restart**.
@z

@x
### Kubernetes
@y
{: #kubernetes }
### Kubernetes タブ
@z

@x
Docker Desktop includes a standalone Kubernetes server that runs on your Mac, so
that you can test deploying your Docker workloads on Kubernetes. To enable Kubernetes support and install a standalone instance of Kubernetes running as a Docker container, select **Enable Kubernetes**.
@y
Docker Desktop には、Mac 上で稼動するスタンドアロンの Kubernetes サーバーが含まれます。
したがって Kubernetes 上に構築した Docker アプリをデプロイするテストができます。
Kubernetes サポートの有効化と、Docker コンテナーとして起動するスタンドアロン Kubernetes インスタンスのインストールを行うためには、**Enable Kubernetes**（Kubernetes の有効化）を実行します。
@z

@x
- Select **Show system containers (advanced)** to view internal containers when using Docker commands.
@y
- Select **Show system containers (advanced)** to view internal containers when using Docker commands.
@z

@x
- Select **Reset Kubernetes cluster** to delete all stacks and Kubernetes resources. For more information, see [Kubernetes](../kubernetes.md){:target="_blank" rel="noopener" class="_"}.
@y
- Select **Reset Kubernetes cluster** to delete all stacks and Kubernetes resources. For more information, see [Kubernetes](../kubernetes.md){:target="_blank" rel="noopener" class="_"}.
@z

@x
- Click **Apply & Restart** for your changes to take effect.
@y
- Click **Apply & Restart** for your changes to take effect.
@z

@x
### Reset
@y
{: #reset }
### Reset タブ
@z

@x
> Reset and Restart options
>
> On Docker Desktop Mac, the **Restart Docker Desktop**, **Reset to factory defaults**, and other reset options are available from the **Troubleshoot** menu.
@y
> Reset と Restart オプション
>
> Docker Desktop Mac において **Restart Docker Desktop**、**Reset to factory defaults**、その他のリセットオプションは、**Troubleshoot** メニューにあります。
@z

@x
For information about the reset options, see [Logs and Troubleshooting](troubleshoot.md).
@y
リセットオプションに関する詳細は [ログ機能とトラブルシューティング](troubleshoot.md) を参照してください。
@z

@x
### Software Updates
@y
{: #software-updates }
### ソフトウェア更新
@z

@x
The **Software Updates** section notifies you of any updates available to Docker Desktop. When there's a new update, you can choose to download the update right away, or click the **Release Notes** option to learn what's included in the updated version.
@y
**Software Updates**（ソフトウェア更新）セクションは、Docker Desktop の最新版が利用可能であるかどうかを通知します。
最新アップデートがあれば、即座にダウンロードすることができます。
または **Release Notes**（リリースノート）オプションをクリックして、最新バージョンに含まれる内容を確認することもできます。
@z

@x
> **Disable automatic check for updates**
>
> Starting with Docker Desktop 4.2.0, the option to turn off the automatic check for updates is available for users on all Docker subscriptions, including Docker Personal and Docker Pro. Update to [Docker Desktop 4.2.0](../mac/release-notes/index.md) to start using this feature.
{: .important}
@y
> **アップデート自動チェックの無効化**
>
> Docker Desktop 4.2.0 からは、Docker Personal や Docker Pro など、すべての Docker サブスクリプションにおいて、このオプションによる自動更新を無効にすることができます。
> [Docker Desktop 4.2.0](../mac/release-notes/index.md) に更新して、この機能を利用してみてください。
{: .important}
@z

@x
Turn off the check for updates by clearing the **Automatically check for updates** check box. This disables notifications in the Docker menu and also the notification badge that appears on the Docker Dashboard. To check for updates manually, select the **Check for updates** option in the Docker menu.
@y
チェックボックス **Automatically check for updates**（アップデートの自動チェック）をオフにすることで、この機能を無効にします。
これを行うと Docker メニューにおける通知が無効になります。
また Docker ダッシュボード上の通知バッチも表示されなくなります。
アップデートを手動でチェックするには、Docker メニューの **Check for updates**（アップデートのチェック）オプションを実行します。
@z

@x
To allow Docker Desktop to automatically download new updates in the background, select **Always download updates**. This downloads newer versions of Docker Desktop when an update becomes available. After downloading the update, click **Apply and Restart** to install the update. You can do this either through the Docker menu or in the **Updates** section in the Docker Dashboard.
@y
Docker Desktop による最新アップデートの自動ダウンロードを、バックグラウンド実行により行うには、**Always download updates**（アップデートの常時ダウンロード）を選びます。
これを選ぶと、アップデートが入手可能になると、最新版がダウンロードされます。
アップデートのダウンロードが終了したら、**Apply and Restart**（適用と再起動）をクリックして、アップデートをインストールします。
同じことは Docker メニューか、あるいは Docker ダッシュボード内の **Updates**（更新）セクションからも行うことができます。
@z

@x
## Dashboard
@y
{: #dashboard }
## ダッシュボード
@z

@x
The Docker Dashboard enables you to interact with containers and applications and manage the lifecycle of your applications directly from your machine. The Dashboard UI shows all running, stopped, and started containers with their state. It provides an intuitive interface to perform common actions to inspect and manage containers and existing Docker Compose applications. For more information, see [Docker Dashboard](../dashboard.md).
@y
Docker ダッシュボードを利用すると、コンテナーやアプリケーションとのやりとりが行えるようになり、アプリケーションのライフサイクルを手元のマシンから管理することができます。
ダッシュボードの UI にはすべてのコンテナーが表示され、実行中、停止中、開始中といった状態が示されます。
提供されている UI は直感的になっていて、コンテナーや Docker Compose アプリケーションを確認したり管理したりといった通常操作を行うことができます。
詳しくは [Docker ダッシュボード](../dashboard.md) を参照してください。
@z

@x
## Add TLS certificates
@y
{: #add-tls-certificates }
## TLS 証明書の追加
@z

@x
You can add trusted Certificate Authorities (CAs) (used to verify registry
server certificates) and client certificates (used to authenticate to
registries) to your Docker daemon.
@y
Docker デーモンに対しては、信頼できる認証局（Certificate Authorities; CAs）（レジストリサーバー証明書の確認のため）やクライアント証明書（レジストリの認証のため）を追加することができます。
@z

@x
### Add custom CA certificates (server side)
@y
{: #add-custom-ca-certificates-server-side }
### カスタム CA 証明書の追加（サーバー側）
@z

@x
All trusted CAs (root or intermediate) are supported. Docker Desktop creates a
certificate bundle of all user-trusted CAs based on the Mac Keychain, and
appends it to Moby trusted certificates. So if an enterprise SSL certificate is
trusted by the user on the host, it is trusted by Docker Desktop.
@y
信頼できる CA （ルート証明書や中間 CA 証明書）はすべてサポートされます。
Docker Desktop では Mac キーチェーンに基づいて、信頼できる CA による証明書バンドルが生成されます。
そしてこれを Moby の信頼できる証明書に追加します。
したがってエンタープライズ向けの SSL 証明書が、ホスト上のユーザーによって認証されていると、それは Docker Desktop によって認証されているものとなります。
@z

@x
To manually add a custom, self-signed certificate, start by adding the
certificate to the macOS keychain, which is picked up by Docker Desktop. Here is
an example:
@y
カスタマイズした自己署名の証明書を手動で追加するには、まずその証明書を macOS キーチェーンに追加してください。
こうしておけば Docker Desktop が証明書を認識してくれます。
たとえば以下のとおりです。
@z

@x
```console
$ sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ca.crt
```
@y
```console
$ sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ca.crt
```
@z

@x
Or, if you prefer to add the certificate to your own local keychain only (rather
than for all users), run this command instead:
@y
あるいは、その証明書をローカルな独自キーチェーンにのみ追加したい（全ユーザー向けとはしたくない）場合は、以下のコマンドを実行します。
@z

@x
```console
$ security add-trusted-cert -d -r trustRoot -k ~/Library/Keychains/login.keychain ca.crt
```
@y
```console
$ security add-trusted-cert -d -r trustRoot -k ~/Library/Keychains/login.keychain ca.crt
```
@z

@x
See also, [Directory structures for
certificates](#directory-structures-for-certificates).
@y
[証明書のディレクトリ構造](#directory-structures-for-certificates) も参照してください。
@z

@x
> **Note**: You need to restart Docker Desktop after making any changes to the
> keychain or to the `~/.docker/certs.d` directory in order for the changes to
> take effect.
@y
> **メモ**: キーチェーンや`~/.docker/certs.d`ディレクトリに変更を加えたら、これを有効にするために Docker Desktop を再起動することが必要です。
@z

@x
For a complete explanation of how to do this, see the blog post [Adding
Self-signed Registry Certs to Docker & Docker Desktop for
Mac](https://blog.container-solutions.com/adding-self-signed-registry-certs-docker-mac){:target="_blank" rel="noopener" class="_"}.
@y
これを実現するための方法として、ブログ投稿 [Adding
Self-signed Registry Certs to Docker & Docker Desktop for
Mac](https://blog.container-solutions.com/adding-self-signed-registry-certs-docker-mac){:target="_blank" rel="noopener" class="_"} に説明が網羅されているので参照してください。
@z

@x
### Add client certificates
@y
{: #add-client-certificates }
### クライアント証明書の追加
@z

@x
You can put your client certificates in
`~/.docker/certs.d/<MyRegistry>:<Port>/client.cert` and
`~/.docker/certs.d/<MyRegistry>:<Port>/client.key`.
@y
クライアント証明書は`~/.docker/certs.d/<MyRegistry>:<Port>/client.cert`と`~/.docker/certs.d/<MyRegistry>:<Port>/client.key`に置きます。
@z

@x
When the Docker Desktop application starts, it copies the `~/.docker/certs.d`
folder on your Mac to the `/etc/docker/certs.d` directory on Moby (the Docker
Desktop `xhyve` virtual machine).
@y
Docker Desktop のアプリケーションが起動すると、Mac 上の`~/.docker/certs.d`フォルダーの内容が、Moby（Docker Desktop の仮想マシン`xhyve`）の`/etc/docker/certs.d`ディレクトリにコピーされます。
@z

@x
> * You need to restart Docker Desktop after making any changes to the keychain
>   or to the `~/.docker/certs.d` directory in order for the changes to take
>   effect.
>
> * The registry cannot be listed as an _insecure registry_ (see [Docker
>   Engine](#docker-engine). Docker Desktop ignores certificates listed
>   under insecure registries, and does not send client certificates. Commands
>   like `docker run` that attempt to pull from the registry produce error
>   messages on the command line, as well as on the registry.
@y
> * キーチェーンや`~/.docker/certs.d`ディレクトリに変更を加えたら、これを有効にするために Docker Desktop を再起動することが必要です。
>
> * レジストリ一覧において、レジストリは **安全な** レジストリの扱いになります。
>   （[Docker Engine](#docker-engine) を参照してください。）
>   Docker Desktop では、安全でない（insecure）レジストリのもとにある証明書は無視します。
>   そしてクライアント証明書を送信することはなくなります。
>   `docker run`などのコマンドを通じてそのレジストリからプルを行おうとすると、コマンドライン上にエラーメッセージが出力されます。
>   レジストリ上でもエラー発生します。
@z

@x
### Directory structures for certificates
@y
{: #directory-structures-for-certificates }
### 証明書のディレクトリ構造
@z

@x
If you have this directory structure, you do not need to manually add the CA
certificate to your Mac OS system login:
@y
以下のようなディレクトリ構造がすでにある場合は、Mac OS へのログインにあたって、CA を手動で追加する必要はありません。
@z

@x
```
/Users/<user>/.docker/certs.d/
└── <MyRegistry>:<Port>
   ├── ca.crt
   ├── client.cert
   └── client.key
```
@y
```
/Users/<user>/.docker/certs.d/
└── <MyRegistry>:<Port>
   ├── ca.crt
   ├── client.cert
   └── client.key
```
@z

@x
The following further illustrates and explains a configuration with custom
certificates:
@y
さらに以下では、カスタム証明書を利用する場合の設定状況を示しています。
@z

@x
```
/etc/docker/certs.d/        <-- Certificate directory
└── localhost:5000          <-- Hostname:port
   ├── client.cert          <-- Client certificate
   ├── client.key           <-- Client key
   └── ca.crt               <-- Certificate authority that signed
                                the registry certificate
```
@y
```
/etc/docker/certs.d/        <-- 証明書ディレクトリ
└── localhost:5000          <-- ホスト名:ポート
   ├── client.cert          <-- クライアント証明書
   ├── client.key           <-- クライアント鍵
   └── ca.crt               <-- レジストリ証明書により署名された CA
```
@z

@x
You can also have this directory structure, as long as the CA certificate is
also in your keychain.
@y
以下のようなディレクトリ構造にすることもできます。
CA 証明書がキーチェーンにも存在しているものとします。
@z

@x
```
/Users/<user>/.docker/certs.d/
└── <MyRegistry>:<Port>
    ├── client.cert
    └── client.key
```
@y
```
/Users/<user>/.docker/certs.d/
└── <MyRegistry>:<Port>
    ├── client.cert
    └── client.key
```
@z

@x
To learn more about how to install a CA root certificate for the registry and
how to set the client TLS certificate for verification, see
[Verify repository client with certificates](../../engine/security/certificates.md)
in the Docker Engine topics.
@y
レジストリにおける CA ルート証明書のインストール方法、あるいはクライアント TLS 証明書の設定方法については、Docker Engine の説明内にある [証明書を使ったリポジトリクライアントの確認](../../engine/security/certificates.md) を参照してください。
@z

@x
## Install shell completion
@y
{: #install-shell-completion }
## シェル補完のインストール
@z

@x
Docker Desktop comes with scripts to enable completion for the `docker` and `docker-compose` commands. The completion scripts may be
found inside `Docker.app`, in the `Contents/Resources/etc/` directory and can be
installed both in Bash and Zsh.
@y
Docker Desktop には、`docker`や`docker-compose`コマンドにおいて、入力補完を可能とするスクリプトがあります。
補完スクリプトは`Contents/Resources/etc/`ディレクトリの`Docker.app`内にあります。
これは Bash および Zsh においてインストールすることができます。
@z

@x
### Bash
@y
### Bash
@z

@x
Bash has [built-in support for
completion](https://www.debian-administration.org/article/316/An_introduction_to_bash_completion_part_1){:target="_blank"
class="_"} To activate completion for Docker commands, these files need to be
copied or symlinked to your `bash_completion.d/` directory. For example, if you
installed bash via [Homebrew](https://brew.sh):
@y
Bash には [入力補完のためのビルトインサポート](https://www.debian-administration.org/article/316/An_introduction_to_bash_completion_part_1){:target="_blank" class="_"} があります。
Docker コマンドに対して入力補完を有効にするには、`bash_completion.d/`ディレクトリに上記ファイルをコピーするかシンボリックリンクを張ります。
たとえば [Homebrew](https://brew.sh) から Bash をインストールしている場合は、以下のようにします。
@z

@x
```bash
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
ln -s $etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose
```
@y
```bash
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
ln -s $etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose
```
@z

@x
Add the following to your `~/.bash_profile`:
@y
そして以下の記述を`~/.bash_profile`に追加します。
@z

@x
```bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
```
@y
```bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
```
@z

@x
OR
@y
または以下を追加します。
@z

@x
```bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
```
@y
```bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
```
@z

@x
### Zsh
@y
### Zsh
@z

@x
In Zsh, the [completion
system](http://zsh.sourceforge.net/Doc/Release/Completion-System.html){:target="_blank" rel="nooopener" class="_"}
takes care of things. To activate completion for Docker commands,
these files need to be copied or symlinked to your Zsh `site-functions/`
directory. For example, if you installed Zsh via [Homebrew](https://brew.sh){:target="_blank" rel="nooopener" class="_"}:
@y
Zsh においては、[入力補完システム](http://zsh.sourceforge.net/Doc/Release/Completion-System.html){:target="_blank" rel="nooopener" class="_"} というものが処理を行ってくれます。
Docker コマンドに対する入力補完を有効にするには、上記ファイルを Zsh のディレクトリ`site-functions/`にコピーするかシンボリックリンクを張ります。
たとえば [Homebrew](https://brew.sh){:target="_blank" rel="nooopener" class="_"} から Zsh をインストールしている場合は、以下のようにします。
@z

@x
```bash
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose
```
@y
```bash
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose
```
@z

@x
### Fish-Shell
@y
### Fish-Shell
@z

@x
Fish-shell also supports tab completion [completion
system](https://fishshell.com/docs/current/#tab-completion){:target="_blank"
class="_"}. To activate completion for Docker commands,
these files need to be copied or symlinked to your Fish-shell `completions/`
directory.
@y
Fish-shell でも、タブ入力による [入力補完システム](https://fishshell.com/docs/current/#tab-completion){:target="_blank" class="_"} をサポートしています。
Docker コマンドに対する入力補完を有効にするには、上記ファイルを Fish-shel のディレクトリ`completions/`にコピーするかシンボリックリンクを張ります。
@z

@x
Create the `completions` directory:
@y
まず`completions`ディレクトリを生成します。
@z

@x
```console
$ mkdir -p ~/.config/fish/completions
```
@y
```console
$ mkdir -p ~/.config/fish/completions
```
@z

@x
Now add fish completions from docker.
@y
Docker の Fish 入力補完を追加します。
@z

@x
```console
$ ln -shi /Applications/Docker.app/Contents/Resources/etc/docker.fish-completion ~/.config/fish/completions/docker.fish
$ ln -shi /Applications/Docker.app/Contents/Resources/etc/docker-compose.fish-completion ~/.config/fish/completions/docker-compose.fish
```
@y
```console
$ ln -shi /Applications/Docker.app/Contents/Resources/etc/docker.fish-completion ~/.config/fish/completions/docker.fish
$ ln -shi /Applications/Docker.app/Contents/Resources/etc/docker-compose.fish-completion ~/.config/fish/completions/docker-compose.fish
```
@z

@x
## Docker Hub
@y
## Docker Hub
@z

@x
Select **Sign in /Create Docker ID** from the Docker Desktop menu to access your [Docker Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_" } account. Once logged in, you can access your Docker Hub repositories and organizations directly from the Docker Desktop menu.
@y
Docker Desktop メニューから **Sign in /Create Docker ID** を選択すれば [Docker Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_" } アカウントを使ってアクセスすることができます。
ログインした後は、Docker Desktop メニューから、Docker Hub リポジトリや組織に直接アクセスすることができます。
@z

@x
For more information, refer to the following [Docker Hub topics](../../docker-hub/index.md){:target="_blank"
class="_"}:
@y
詳しい情報については、以下の [Docker Hub トピック](../../docker-hub/index.md){:target="_blank" class="_"} を参照してください。
@z

@x
* [Organizations and Teams in Docker Hub](../../docker-hub/orgs.md){:target="_blank" rel="noopener" class="_"}
* [Builds](../../docker-hub/builds/index.md){:target="_blank" rel="noopener" class="_"}
@y
* [Docker Hub における組織とチーム](../../docker-hub/orgs.md){:target="_blank" rel="noopener" class="_"}
* [ビルド](../../docker-hub/builds/index.md){:target="_blank" rel="noopener" class="_"}
@z

@x
### Two-factor authentication
@y
{: #two-factor-authentication }
### 2 要素認証
@z

@x
Docker Desktop enables you to sign into Docker Hub using two-factor authentication. Two-factor authentication provides an extra layer of security when accessing your Docker Hub account.
@y
Docker Desktop では Docker Hub へのサインイン時に 2 要素認証（two-factor authentication）を利用することができます。
2 要素認証は Docker Hub アカウントへのアクセス時に、二重のセキュリティを提供するものです。
@z

@x
You must enable two-factor authentication in Docker Hub before signing into your Docker Hub account through Docker Desktop. For instructions, see [Enable two-factor authentication for Docker Hub](/docker-hub/2fa/).
@y
Docker Desktop 経由で Docker Hub アカウントへのサインインを行う前には、あらかじめ 2 要素認証を有効にしておく必要があります。
その手順については [Docker Hub における 2 要素認証の有効化](/docker-hub/2fa/) を参照してください。
@z

@x
After you have enabled two-factor authentication:
@y
2 要素認証の有効化が済んだら、以下を行います。
@z

@x
1. Go to the Docker Desktop menu and then select **Sign in / Create Docker ID**.
@y
1. Docker Desktop メニューから **Sign in / Create Docker ID** を実行します。
@z

@x
2. Enter your Docker ID and password and click **Sign in**.
@y
2. Docker ID とパスワードを入力して **Sign in** をクリックします。
@z

@x
3. After you have successfully signed in, Docker Desktop prompts you to enter the authentication code. Enter the six-digit code from your phone and then click **Verify**.
@y
3. サインインに成功したら、Docker Desktop が認証コードの入力を求めてきます。
   電話に届いた 6 桁のコードを入力して **Verify** をクリックします。
@z

@x
![Docker Desktop 2FA](images/desktop-mac-2fa.png){:width="500px"}
@y
![Docker Desktop の 2 要素認証](images/desktop-mac-2fa.png){:width="500px"}
@z

@x
After you have successfully authenticated, you can access your organizations and repositories directly from the Docker Desktop menu.
@y
認証が正常に行われたら、Docker Desktop メニューから組織やリポジトリに直接アクセスできるようになります。
@z

@x
## Pause/Resume
@y
{: pauseresume}
## 一時停止／再開
@z

@x
Starting with the Docker Desktop 4.2 release, you can pause your Docker Desktop session when you are not actively using it and save CPU resources on your machine. When you pause Docker Desktop, the Linux VM running Docker Engine is paused, the current state of all your containers are saved in memory, and all processes are frozen. This reduces the CPU usage and helps you retain a longer battery life on your laptop. You can resume Docker Desktop when you want by clicking the Resume option.
@y
Docker Desktop 4.2 のリリース以降では、Docker Desktop セッションを活用していない場合に、これを一時停止できるようになりました。
これにより、マシンの CPU リソース消費を節約できます。
Docker Desktop を一時停止すると、Docker Engine を稼働させている Linux VM が一時停止します。
そして各コンテナーのその時点での状態が、すべてメモリ上に保存された上で、すべてのプロセスは停止します。
このときには CPU 使用量が軽減され、ノート PC であればバッテリー駆動を長く保つことができます。
Resume（再開）オプションをクリックすれば、いつでも Docker Desktop を再開することができます。
@z

@x
From the Docker menu, select ![whale menu](images/whale-x.png){: .inline} > **Pause** to pause Docker Desktop.
@y
Docker メニューから ![クジラメニュー](images/whale-x.png){: .inline} > **Pause**（一時停止）を選べば、Docker Desktop が一時停止されます。
@z

@x
![Docker context menu](images/menu/prefs.png){:width="250px"}
@y
![Docker コンテキストメニュー](images/menu/prefs.png){:width="250px"}
@z

@x
Docker Desktop now displays the paused status on the Docker menu and on the  **Containers / Apps**, **Images**, **Volumes**, and **Dev Environment** screens on the Docker Dashboard. You can still access the **Preferences** and the **Troubleshoot** menu from the Dashboard when you've paused Docker Desktop.
@y
Docker Desktop は一時停止のステータスであることが Docker メニュー上に表示されます。
同様に Docker ダッシュボード上の **Containers / Apps**、**Images**、**Volumes**、**Dev Environment** の各画面にも表示されます。
Docker Desktop が一時停止されていても、ダッシュボードの **Preferences** と **Troubleshoot** メニューにはアクセスすることができます。
@z

@x
Select ![whale menu](images/whale-x.png){: .inline} > **Resume** to resume Docker Desktop.
@y
![クジラメニュー](images/whale-x.png){: .inline} > **Resume**（再開）を選べば、Docker Desktop を再開できます。
@z

@x
> **Note**
>
> When Docker Desktop is paused, running any commands in the Docker CLI will automatically resume Docker Desktop.
@y
> **メモ**
>
> Docker Desktop を一時停止すると、Docker CLI において実行中であったコマンドは、後に Docker Desktop を自動的に再開させます。
@z

@x
## Give feedback and get help
@y
{: #give-feedback-and-get-help }
## フィードバックやヘルプ
@z

@x
To get help from the community, review current user topics, join or start a
discussion, log on to our [Docker Desktop for Mac
forum](https://forums.docker.com/c/docker-for-mac){:target="_blank" rel="noopener" class="_"}.
@y
コミュニティのヘルプを必要とする場合は、最新のユーザートピックを確認し、ディスカッションへの参加、開始をしてみてください。
[Docker Desktop for Mac フォーラム](https://forums.docker.com/c/docker-for-mac){:target="_blank" rel="noopener" class="_"} にログインして行います。
@z

@x
To report bugs or problems, log on to Docker Desktop [for Mac issues on
GitHub](https://github.com/docker/for-mac/issues){:target="_blank" rel="noopener" class="_"},
where you can review community reported issues, and file new ones.  See
[Logs and Troubleshooting](troubleshoot.md) for more details.
@y
バグや問題を報告するには、[Docker Desktop for Mac 向けの GitHub issue](https://github.com/docker/for-mac/issues){:target="_blank" rel="noopener" class="_"} にログインして、コミュニティによって報告済みの issue を確認してください。
そして新たな issue をあげてください。
詳しくは [ログ機能とトラブルシューティング](troubleshoot.md) を参照してください。
@z

@x
For information about providing feedback on the documentation or update it yourself, see [Contribute to documentation](/opensource/).
@y
ドキュメントに関するフィードバックや更新提案については [ドキュメントへの貢献](/opensource/) を参照してください。
@z

@x
## Where to go next
@y
{: #where-to-go-next }
## 次に読むものは
@z

@x
* Try out the walkthrough at [Get Started](/get-started/){: target="_blank"
  class="_"}.
@y
* [はじめよう](/get-started/){: target="_blank" class="_"} に示されているウォークスルーを試してみてください。
@z

@x
* Dig in deeper with [Docker Labs](https://github.com/docker/labs/) example
  walkthroughs and source code.
@y
* [Docker Labs](https://github.com/docker/labs/) にあるウォークスルーやソースコードを参照して、理解を深めてください。
@z

@x
* For a summary of Docker command line interface (CLI) commands, see
  [Docker CLI Reference Guide](../../engine/api/index.md){: target="_blank" rel="noopener" class="_"}.
@y
* コマンドラインインターフェース（CLI）コマンドのまとめについては [Docker CLI リファレンスガイド](../../engine/api/index.md){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
* Check out the blog post, [What’s New in Docker 17.06 Community Edition
  (CE)](https://blog.docker.com/2017/07/whats-new-docker-17-06-community-edition-ce/){: target="_blank" rel="noopener" class="_"}.
@y
* ブログ投稿 [What’s New in Docker 17.06 Community Edition
  (CE)](https://blog.docker.com/2017/07/whats-new-docker-17-06-community-edition-ce/){:target="_blank" rel="noopener" class="_"} を確認してみてください。
@z
