%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Getting Started
keywords: windows, edge, tutorial, run, docker, local, machine
redirect_from:
- /docker-for-windows/index/
- /docker-for-windows/started/
- /engine/installation/windows/
- /installation/windows/
- /windows/
- /windows/started/
- /winkit/
- /winkit/getting-started/

title: Docker Desktop for Windows user manual
toc_min: 1
toc_max: 2
---
@y
---
description: Getting Started
keywords: windows, edge, tutorial, run, docker, local, machine
redirect_from:
- /docker-for-windows/index/
- /docker-for-windows/started/
- /engine/installation/windows/
- /installation/windows/
- /windows/
- /windows/started/
- /winkit/
- /winkit/getting-started/

title: Docker Desktop for Windows ユーザーマニュアル
toc_min: 1
toc_max: 2
---
@z

@x
Welcome to Docker Desktop! The Docker Desktop for Windows user manual provides information on how to configure and manage your Docker Desktop settings.
@y
{% comment %}
Welcome to Docker Desktop! The Docker Desktop for Windows user manual provides information on how to configure and manage your Docker Desktop settings.
{% endcomment %}
Docker Desktop へようこそ！
Docker Desktop for Windows ユーザーマニュアルでは Docker Desktop 設定をどのように行い、管理していくのかを説明しています。
@z

@x
For information about Docker Desktop download, system requirements, and installation instructions, see [Install Docker Desktop](install.md).
@y
{% comment %}
For information about Docker Desktop download, system requirements, and installation instructions, see [Install Docker Desktop](install.md).
{% endcomment %}
Docker Desktop のダウンロード、システム要件、インストール手順については [Docker Desktop のインストール](install.md) を参照してください。
@z

@x
>**Note**
>
> This page contains information about the Docker Desktop Stable release. For information about features available in Edge releases, see the [Edge release notes](edge-release-notes.md).
@y
{% comment %}
>**Note**
>
> This page contains information about the Docker Desktop Stable release. For information about features available in Edge releases, see the [Edge release notes](edge-release-notes.md).
{% endcomment %}
>**メモ**
>
> 本ページでは Docker Desktop 安定版（Stable）についての情報を示します。
最新版（Edge）において利用可能な機能については [最新版リリースノート](edge-release-notes.md) を参照してください。
@z

@x
## Settings
@y
{% comment %}
## Settings
{% endcomment %}
{: #settings }
## Settings ダイアログ
@z

@x
The **Docker Desktop** menu allows you to configure your Docker settings such as installation, updates, version channels, Docker Hub login,
and more.
@y
{% comment %}
The **Docker Desktop** menu allows you to configure your Docker settings such as installation, updates, version channels, Docker Hub login,
and more.
{% endcomment %}
**Docker Desktop** メニューでは Docker に対する設定として、インストール設定、アップデート、バージョンチャネル設定、Docker Hub ログインなどを行うことができます。
@z

@x
This section explains the configuration options accessible from the **Settings** dialog.
@y
{% comment %}
This section explains the configuration options accessible from the **Settings** dialog.
{% endcomment %}
本節では、**Settings** ダイアログからアクセスできる設定について説明します。
@z

@x
1. Open the Docker Desktop menu by clicking the Docker icon in the Notifications area (or System tray):
@y
{% comment %}
1. Open the Docker Desktop menu by clicking the Docker icon in the Notifications area (or System tray):
{% endcomment %}
1. 通知領域（またはシステムトレイ）にある Docker アイコンをクリックし、Docker Desktop メニューを開きます。
@z

@x
    ![Showing hidden apps in the taskbar](images/whale-icon-systray-hidden.png){:width="250px"}
@y
    {% comment %}
    ![Showing hidden apps in the taskbar](images/whale-icon-systray-hidden.png){:width="250px"}
    {% endcomment %}
    ![Showing hidden apps in the taskbar](images/whale-icon-systray-hidden.png){:width="250px"}
@z

@x
2. Select **Settings** to open the Settings dialog:
@y
{% comment %}
2. Select **Settings** to open the Settings dialog:
{% endcomment %}
2. **Settings** を実行して Settings ダイアログを開きます。
@z

@x
    ![Docker Desktop popup menu](images/docker-menu-settings.png){:width="300px"}
@y
    {% comment %}
    ![Docker Desktop popup menu](images/docker-menu-settings.png){:width="300px"}
    {% endcomment %}
    ![Docker Desktop ポップアップメニュー](images/docker-menu-settings.png){:width="300px"}
@z

@x
### General
@y
{% comment %}
### General
{% endcomment %}
{: #general }
### General タブ
@z

@x
On the **General** tab of the Settings dialog, you can configure when to start and update Docker.
@y
{% comment %}
On the **General** tab of the Settings dialog, you can configure when to start and update Docker.
{% endcomment %}
Settings ダイアログの **General** タブにおいて、Docker の起動や更新をいつ行うのかを設定します。
@z

@x
![Settings](images/settings-general.png){:width="750px"}
@y
{% comment %}
![Settings](images/settings-general.png){:width="750px"}
{% endcomment %}
![Settings ダイアログ](images/settings-general.png){:width="750px"}
@z

@x
* **Start Docker when you log in** - Automatically start Docker Desktop upon Windows system login.
@y
{% comment %}
* **Start Docker when you log in** - Automatically start Docker Desktop upon Windows system login.
{% endcomment %}
* **Start Docker when you log in**（ログイン時に Docker を起動） - Windows にログインしたときに自動的に Docker Desktop を起動します。
@z

@x
* **Automatically check for updates** - By default, Docker Desktop automatically checks for updates and notifies you when an update is available.
Click **OK** to accept and install updates (or cancel to keep the current
version). You can manually update by choosing **Check for Updates** from the
main Docker menu.
@y
{% comment %}
* **Automatically check for updates** - By default, Docker Desktop automatically checks for updates and notifies you when an update is available.
Click **OK** to accept and install updates (or cancel to keep the current
version). You can manually update by choosing **Check for Updates** from the
main Docker menu.
{% endcomment %}
* **Automatically check for updates**（アップデートの自動更新） - デフォルトでは、Docker Desktop の更新チェックは自動的に行われ、利用可能な更新がある場合は通知されます。
  **OK** のクリックにより決定し、更新をインストールします。
  （または現行バージョンのままとする場合はキャンセルします。）
  Docker のメインメニューにある **Check for Updates** を実行すれば、いつでも手動による更新ができます。
@z

@x
* **Expose daemon on tcp://localhost:2375 without TLS** - Click this option to enable legacy clients to connect to the Docker daemon. You must use this option with caution as exposing the daemon without TLS can result in remote code execution attacks.
@y
{% comment %}
* **Expose daemon on tcp://localhost:2375 without TLS** - Click this option to enable legacy clients to connect to the Docker daemon. You must use this option with caution as exposing the daemon without TLS can result in remote code execution attacks.
{% endcomment %}
* **Expose daemon on tcp://localhost:2375 without TLS**（TLS なしにデーモンを tcp://localhost:2375 で公開） - このオプションをクリックすることで、古いクライアントが Docker デーモンに接続できるようにします。
   このオプションに利用には十分注意しなければなりません。
   TLS を用いずにデーモンを公開するということは、リモートコードの実行攻撃を受ける可能性があります。
@z

@x
* **Send usage statistics** - By default, Docker Desktop sends diagnostics,
crash reports, and usage data. This information helps Docker improve and
troubleshoot the application. Clear the check box to opt out. Docker may periodically prompt you for more information.
@y
{% comment %}
* **Send usage statistics** - By default, Docker Desktop sends diagnostics,
crash reports, and usage data. This information helps Docker improve and
troubleshoot the application. Clear the check box to opt out. Docker may periodically prompt you for more information.
{% endcomment %}
* **Send usage statistics**（利用統計の送信） - Docker Desktop では診断情報、クラッシュレポート、利用データを、デフォルトで送信するようになっています。
こういった情報は Docker の改善や、アプリケーションにおける問題解決に役立てることができます。
チェックボックスをオフにすれば、情報を送信しないようにすることができます。
Docker では定期的に情報確認を行うことがあります。
@z

@x
  Click **Switch to the Edge version** to learn more about Docker Desktop Edge releases.
@y
  {% comment %}
  Click **Switch to the Edge version** to learn more about Docker Desktop Edge releases.
  {% endcomment %}
  **Switch to the Edge version**（最新版への切り替え）をクリックすれば、Docker Desktop 最新版（Edge）について確認することができます。
@z

@x
### Resources
@y
{% comment %}
### Resources
{% endcomment %}
{: #resources }
### Resources タブ
@z

@x
The **Resources** tab allows you to configure CPU, memory, disk, proxies, 
network, and other resources. Different settings are available for 
configuration depending on whether you are using Linux containers in WSL 2 
mode, Linux containers in Hyper-V mode, or Windows containers.
@y
{% comment %}
The **Resources** tab allows you to configure CPU, memory, disk, proxies, 
network, and other resources. Different settings are available for 
configuration depending on whether you are using Linux containers in WSL 2 
mode, Linux containers in Hyper-V mode, or Windows containers.
{% endcomment %}
**Resources** タブは、CPU、メモリ、ディスク、プロキシー、ネットワークといったリソースを設定します。
動作させているコンテナーが WSL 2 モードでの Linux コンテナーか、Hyper-V モードでの Linux コンテナーか、Windows コンテナーかによって、設定可能な項目は異なります。
@z

@x
![Resources](images/settings-resources.png){:width="750px"}
@y
{% comment %}
![Resources](images/settings-resources.png){:width="750px"}
{% endcomment %}
![Resources タブ](images/settings-resources.png){:width="750px"}
@z

@x
#### Advanced
@y
{% comment %}
#### Advanced
{% endcomment %}
{: #advanced }
#### Advanced タブ
@z

@x
> **Note**
>
> The Advanced tab is only available in Hyper-V mode, because in WSL 2 mode and 
> Windows container mode these resources are managed by Windows. In WSL 2 
> mode, you can configure limits on the memory, CPU, and swap size allocated
> to the [WSL 2 utility VM](https://docs.microsoft.com/en-us/windows/wsl/release-notes#build-18945).
@y
{% comment %}
> **Note**
>
> The Advanced tab is only available in Hyper-V mode, because in WSL 2 mode and 
> Windows container mode these resources are managed by Windows. In WSL 2 
> mode, you can configure limits on the memory, CPU, and swap size allocated
> to the [WSL 2 utility VM](https://docs.microsoft.com/en-us/windows/wsl/release-notes#build-18945).
{% endcomment %}
> **メモ**
>
> Advanced タブは Hyper-V モードにおいてのみ利用可能です。
> WSL 2 モードや Windows コンテナーモードでは、ここで扱うリソースは Windows において管理されます。
> WSL 2 モードでは、[WSL 2 ユーティリティー VM](https://docs.microsoft.com/en-us/windows/wsl/release-notes#build-18945) に割り当てられているメモリ、CPU、スワップサイズの制限を設定することができます。
@z

@x
Use the **Advanced** tab to limit resources available to Docker.
@y
{% comment %}
Use the **Advanced** tab to limit resources available to Docker.
{% endcomment %}
Advanced タブでは、Docker におけるリソースの利用制限を設定します。
@z

@x
**CPUs**: By default, Docker Desktop is set to use half the number of processors
available on the host machine. To increase processing power, set this to a
higher number; to decrease, lower the number.
@y
{% comment %}
**CPUs**: By default, Docker Desktop is set to use half the number of processors
available on the host machine. To increase processing power, set this to a
higher number; to decrease, lower the number.
{% endcomment %}
**CPU** デフォルトにおいて Docker Desktop は、ホストマシン上で利用可能なプロセッサー数の半分を利用するものとして設定されています。
プロセッサー性能を向上させるには、この設定値を大きくします。
逆に抑止するには設定値を小さくします。
@z

@x
**Memory**: By default, Docker Desktop is set to use `2` GB runtime memory,
allocated from the total available memory on your machine. To increase the RAM, set this to a higher number. To decrease it, lower the number.
@y
{% comment %}
**Memory**: By default, Docker Desktop is set to use `2` GB runtime memory,
allocated from the total available memory on your machine. To increase the RAM, set this to a higher number. To decrease it, lower the number.
{% endcomment %}
**メモリ**  デフォルトにおいて Docker Desktop は、実行時メモリとして`2`GB を利用するものとして設定されています。
この値はマシン上において利用可能な全メモリ容量の中から割り当てられます。
RAM 容量を増やすには、この設定値を大きくします。
逆に減らすには、この設定値を小さくします。
@z

@x
**Swap**: Configure swap file size as needed. The default is 1 GB.
@y
{% comment %}
**Swap**: Configure swap file size as needed. The default is 1 GB.
{% endcomment %}
**スワップ**: 必要に応じてスワップファイルサイズを設定します。
デフォルトは 1 GB です。
@z

@x
**Disk image size**: Specify the size of the disk image.
@y
{% comment %}
**Disk image size**: Specify the size of the disk image.
{% endcomment %}
**ディスクイメージサイズ**: ディスクイメージのサイズを指定します。
@z

@x
**Disk image location**: Specify the location of the Linux volume where containers and images are stored.
@y
{% comment %}
**Disk image location**: Specify the location of the Linux volume where containers and images are stored.
{% endcomment %}
**ディスクイメージの保存場所**: コンテナーやイメージが保存される Linux ボリュームの場所を指定します。
@z

@x
You can also move the disk image to a different location. If you attempt to move a disk image to a location that already has one, you get a prompt asking if you want to use the existing image or replace it.
@y
{% comment %}
You can also move the disk image to a different location. If you attempt to move a disk image to a location that already has one, you get a prompt asking if you want to use the existing image or replace it.
{% endcomment %}
ディスクイメージの保存場所は、別のところにすることができます。
移動させようとした保存場所に、すでにディスクイメージが存在していた場合は、プロンプトが表示され、既存のイメージを利用するか、イメージを置き換えるかが問われます。
@z

@x
#### File sharing
@y
{% comment %}
#### File sharing
{% endcomment %}
{: #file-sharing }
#### File sharing タブ
@z

@x
> **Note**
>
> The File sharing tab is only available in Hyper-V mode, because in WSL 2 mode 
> and Windows container mode all files are automatically shared by Windows.
@y
{% comment %}
> **Note**
>
> The File sharing tab is only available in Hyper-V mode, because in WSL 2 mode 
> and Windows container mode all files are automatically shared by Windows.
{% endcomment %}
> **メモ**
>
> Advanced タブは Hyper-V モードにおいてのみ利用可能です。
> WSL 2 モードや Windows コンテナーモードでは、ファイルはすべて Windows において自動的に共有されます。
@z

@x
Use File sharing to allow local directories on Windows to be shared with Linux containers.
This is especially useful for
editing source code in an IDE on the host while running and testing the code in a container.
Note that configuring file sharing is not necessary for Windows containers, only [Linux containers](#switch-between-windows-and-linux-containers).
 If a directory is not shared with a Linux container you may get `file not found` or `cannot start service` errors at runtime. See [Volume mounting requires shared folders for Linux containers](troubleshoot.md#volume-mounting-requires-shared-folders-for-linux-containers).
@y
{% comment %}
Use File sharing to allow local directories on Windows to be shared with Linux containers.
This is especially useful for
editing source code in an IDE on the host while running and testing the code in a container.
Note that configuring file sharing is not necessary for Windows containers, only [Linux containers](#switch-between-windows-and-linux-containers).
 If a directory is not shared with a Linux container you may get `file not found` or `cannot start service` errors at runtime. See [Volume mounting requires shared folders for Linux containers](troubleshoot.md#volume-mounting-requires-shared-folders-for-linux-containers).
{% endcomment %}
File sharing（ファイル共有）を利用すると、Windows 内のローカルディレクトリを Linux コンテナー間で共有できるようになります。
たとえばホストにある IDE 環境上でソースコードを編集し、コードの実行やテストはコンテナー内で行うような場合に、大変便利なものです。
ちなみにファイル共有の設定は Windows コンテナーでは不要であり、[Linux コンテナー](#switch-between-windows-and-linux-containers) だけに必要となるものです。
あるディレクトリが Linux コンテナーに共有されるものでないならば、実行時に `file not found` か `cannot start service` というエラーが発生するかもしれません。
[ボリュームマウントには Linux コンテナーの共有フォルダーが必要](troubleshoot.md#volume-mounting-requires-shared-folders-for-linux-containers) を参照してください。
@z

@x
File share settings are:
@y
{% comment %}
File share settings are:
{% endcomment %}
ファイル共有の設定には以下のものがあります。
@z

@x
- **Add a Directory**: Click `+` and navigate to the directory you want to add.
@y
{% comment %}
- **Add a Directory**: Click `+` and navigate to the directory you want to add.
{% endcomment %}
- **Add a Directory**（ディレクトリの追加）: `+` をクリックして、追加したいディレクトリを指定します。
@z

@x
- **Apply & Restart** makes the directory available to containers using Docker's
  bind mount (`-v`) feature.
@y
{% comment %}
- **Apply & Restart** makes the directory available to containers using Docker's
  bind mount (`-v`) feature.
{% endcomment %}
- **Apply & Restart**（適用および再起動）:  Docker のバインドマウント（`-v`）機能を利用して、コンテナー間でのディレクトリ共有を可能にします。
@z

@x
> Tips on shared folders, permissions, and volume mounts
>
 * Shared folders are designed to allow application code to be edited on the host while being executed in containers. For non-code items
 such as cache directories or databases, the performance will be much better if they are stored in
 the Linux VM, using a [data volume](../storage/volumes.md)
 (named volume) or [data container](../storage/volumes.md).
>
 * Docker Desktop sets permissions to read/write/execute for users, groups and others [0777 or a+rwx](http://permissions-calculator.org/decode/0777/).
   This is not configurable. See [Permissions errors on data directories for shared volumes](troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes).
>
 * Windows presents a case-insensitive view of the filesystem to applications while Linux is case-sensitive. On Linux it is possible to create 2 separate files: `test` and `Test`, while on Windows these filenames would actually refer to the same underlying file. This can lead to problems where an app works correctly on a developer Windows machine (where the file contents are shared) but fails when run in Linux in production (where the file contents are distinct). To avoid this, Docker Desktop insists that all shared files are accessed as their original case. Therefore if a file is created called `test`, it must be opened as `test`. Attempts to open `Test` will fail with "No such file or directory". Similarly once a file called `test` is created, attempts to create a second file called `Test` will fail.
@y
{% comment %}
> Tips on shared folders, permissions, and volume mounts
>
 * Shared folders are designed to allow application code to be edited on the host while being executed in containers. For non-code items
 such as cache directories or databases, the performance will be much better if they are stored in
 the Linux VM, using a [data volume](../storage/volumes.md)
 (named volume) or [data container](../storage/volumes.md).
>
 * Docker Desktop sets permissions to read/write/execute for users, groups and others [0777 or a+rwx](http://permissions-calculator.org/decode/0777/).
   This is not configurable. See [Permissions errors on data directories for shared volumes](troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes).
>
 * Windows presents a case-insensitive view of the filesystem to applications while Linux is case-sensitive. On Linux it is possible to create 2 separate files: `test` and `Test`, while on Windows these filenames would actually refer to the same underlying file. This can lead to problems where an app works correctly on a developer Windows machine (where the file contents are shared) but fails when run in Linux in production (where the file contents are distinct). To avoid this, Docker Desktop insists that all shared files are accessed as their original case. Therefore if a file is created called `test`, it must be opened as `test`. Attempts to open `Test` will fail with "No such file or directory". Similarly once a file called `test` is created, attempts to create a second file called `Test` will fail.
{% endcomment %}
> 共有フォルダー、パーミッション、ボリュームマウントに関するヒント
>
 * 共有フォルダーは、ホスト上においてアプリケーションコードを編集できるようにしつつ、その実行はコンテナー上で行うという目的で用いられます。
   コード以外のものとしてキャッシュディレクトリ、データベースなどにおいては、[データボリューム](../storage/volumes.md)（名前つきボリューム）や [データコンテナー](../storage/volumes.md) を利用して Linux VM 上に保存しておけば、性能は格段によくなります。
>
 * Docker Desktop では所有ユーザー、グループ、その他ユーザーに対して、読み書き実行のパーミッションを [0777 つまり a+rwx](http://permissions-calculator.org/decode/0777/) に設定します。
   これを設定変更することはできません。
   [共有ボリュームにおけるデータディレクトリでパーミッションエラー](troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes) を参照してください。
>
 * Windows では、アプリケーションが参照するファイルシステムは英字の大文字小文字を区別しません。
   一方で Linux は大文字小文字を区別します。
   Linux 上においては `test` と `Test` というファイルは別々のものとして生成可能ですが、Windows ではこの 2 つは同一のファイルを参照します。
   このことが問題になる場合があります。
   Windows の開発マシン上では（2 つのファイル内容が共有されているとして）、アプリケーションが正しく動作するにも関わらず、Linux の本番環境（2 つのファイルを別々に取り扱う）が実行に失敗してしまうケースです。
   こういったことを避けるためには、Docker Desktop が共有ファイルにアクセスする際に、大文字小文字をそのまま扱うようにします。
   たとえば`test`というファイルが生成されたなら、`test`という名前で開かなければならないものとします。
   そして`Test`という名前で開こうとしたら「No such file or directory」とエラーにします。
   同様に`test`が生成されている状態で、2 つめのファイル`Test`を作ろうとしてもエラーにします。
@z

@x
#### Shared folders on demand
@y
{% comment %}
#### Shared folders on demand
{% endcomment %}
{: #shared-folders-on-demand }
#### オンデマンドによるフォルダー共有
@z

@x
You can share a folder "on demand" the first time a particular folder is used by a container.
@y
{% comment %}
You can share a folder "on demand" the first time a particular folder is used by a container.
{% endcomment %}
コンテナーが特定のフォルダーを利用するときになって初めて、そのフォルダーを「オンデマンド」で共有するようにできます。
@z

@x
If you run a Docker command from a shell with a volume mount (as shown in the
example below) or kick off a Compose file that includes volume mounts, you get a
popup asking if you want to share the specified folder.
@y
{% comment %}
If you run a Docker command from a shell with a volume mount (as shown in the
example below) or kick off a Compose file that includes volume mounts, you get a
popup asking if you want to share the specified folder.
{% endcomment %}
ボリュームマウントがある状態（以下に示す例）でシェルから Docker コマンドを実行するか、ボリュームマウントを持った Compose ファイルを実行したとします。
その場合、指定されたフォルダーを共有するかどうかを尋ねるポップアップ画面が開きます。
@z

@x
You can select to **Share it**, in which case it is added your Docker Desktop Shared Folders list and available to
containers. Alternatively, you can opt not to share it by selecting **Cancel**.
@y
{% comment %}
You can select to **Share it**, in which case it is added your Docker Desktop Shared Folders list and available to
containers. Alternatively, you can opt not to share it by selecting **Cancel**.
{% endcomment %}
**Share it**（共有する）を選択すると、Docker Desktop の共有フォルダーリストに追加されて、コンテナーから利用可能になります。
逆に **Cancel** を選択すれば、共有しないようにもできます。
@z

@x
![Shared folder on demand](images/shared-folder-on-demand.png){:width="600px"}
@y
{% comment %}
![Shared folder on demand](images/shared-folder-on-demand.png){:width="600px"}
{% endcomment %}
![オンデマンドによるフォルダー共有](images/shared-folder-on-demand.png){:width="600px"}
@z

@x
#### Proxies
@y
{% comment %}
#### Proxies
{% endcomment %}
{: #proxies }
#### Proxies タブ
@z

@x
Docker Desktop lets you configure HTTP/HTTPS Proxy Settings and
automatically propagates these to Docker. For example, if you set your proxy
settings to `http://proxy.example.com`, Docker uses this proxy when pulling containers.
@y
{% comment %}
Docker Desktop lets you configure HTTP/HTTPS Proxy Settings and
automatically propagates these to Docker. For example, if you set your proxy
settings to `http://proxy.example.com`, Docker uses this proxy when pulling containers.
{% endcomment %}
Docker Desktop では HTTP/HTTPS プロキシーの設定が可能であり、これを自動的に Docker に対して伝えます。
たとえばプロキシー設定として`http://proxy.example.com`を行った場合、Docker はコンテナーのプル処理においてこのプロキシーを利用します。
@z

@x
Your proxy settings, however, will not be propagated into the containers you start.
If you wish to set the proxy settings for your containers, you need to define
environment variables for them, just like you would do on Linux, for example:
@y
{% comment %}
Your proxy settings, however, will not be propagated into the containers you start.
If you wish to set the proxy settings for your containers, you need to define
environment variables for them, just like you would do on Linux, for example:
{% endcomment %}
しかしそのプロキシー設定は、これから起動するコンテナーには伝えられません。
コンテナーに対してプロキシー設定を行いたい場合は、Linux 上において行うのと同じように、環境変数を使って定義することが必要です。
たとえば以下のとおりです。
@z

@x
```ps
> docker run -e HTTP_PROXY=https://proxy.example.com:3128 alpine env
@y
```ps
> docker run -e HTTP_PROXY=https://proxy.example.com:3128 alpine env
@z

@x
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=b7edf988b2b5
TERM=xterm
HOME=/root
HTTP_PROXY=http://proxy.example.com:3128
```
@y
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
{% comment %}
For more information on setting environment variables for running containers,
see [Set environment variables](/engine/reference/commandline/run/#set-environment-variables--e---env---env-file).
{% endcomment %}
実行中のコンテナーに対して環境変数を設定する方法については [環境変数の設定](/engine/reference/commandline/run/#set-environment-variables--e---env---env-file) を参照してください。
@z

@x
#### Network
@y
{% comment %}
#### Network
{% endcomment %}
{: #network }
#### Network タブ
@z

@x
> **Note**
>
> The Network tab is not available in Windows container mode because networking is 
> managed by Windows.
@y
{% comment %}
> **Note**
>
> The Network tab is not available in Windows container mode because networking is 
> managed by Windows.
{% endcomment %}
> **メモ**
>
> Network タブは Windows コンテナーモードでは利用できません。
> ネットワークは Windows によって管理されます。
@z

@x
You can configure Docker Desktop networking to work on a virtual private network (VPN). Specify a network address translation (NAT) prefix and subnet mask to enable Internet connectivity.
@y
{% comment %}
You can configure Docker Desktop networking to work on a virtual private network (VPN). Specify a network address translation (NAT) prefix and subnet mask to enable Internet connectivity.
{% endcomment %}
Docker Desktop のネットワーク設定により、仮想プライベートネットワーク（VPN）上で動作するように設定することができます。
インターネットへの接続を有効にするには、ネットワークアドレス変換（NAT）のプリフィックスとサブネットマスクを設定していください。
@z

@x
**DNS Server**: You can configure the DNS server to use dynamic or static IP addressing.
@y
{% comment %}
**DNS Server**: You can configure the DNS server to use dynamic or static IP addressing.
{% endcomment %}
**DNS Server**: DNS サーバーに対して、動的および静的な IP アドレスの設定が可能です。
@z

@x
> **Note**
>
> Some users reported problems connecting to Docker Hub on Docker Desktop Stable version. This would manifest as an error when trying to run
`docker` commands that pull images from Docker Hub that are not already
downloaded, such as a first time run of `docker run hello-world`. If you
encounter this, reset the DNS server to use the Google DNS fixed address:
`8.8.8.8`. For more information, see
[Networking issues](troubleshoot.md#networking-issues) in Troubleshooting.
@y
{% comment %}
> **Note**
>
> Some users reported problems connecting to Docker Hub on Docker Desktop Stable version. This would manifest as an error when trying to run
`docker` commands that pull images from Docker Hub that are not already
downloaded, such as a first time run of `docker run hello-world`. If you
encounter this, reset the DNS server to use the Google DNS fixed address:
`8.8.8.8`. For more information, see
[Networking issues](troubleshoot.md#networking-issues) in Troubleshooting.
{% endcomment %}
> **メモ**
>
> Docker Desktop 安定版を使って Docker Hub に接続する際に、問題が発生するとの報告があります。
> これは `docker` コマンドの実行時に発生するものです。
> Docker Hub からイメージをプルする際に、それまでダウンロードしていないイメージであったとき、たとえば `docker run hello-world` を初めて実行したような場合に発生します。
> この症状が発生した場合は、DNS サーバーをリセットして Google DNS 固定アドレス `8.8.8.8` を設定してみてください。
> 詳しくはトラブルシューティングの [ネットワークの問題](troubleshoot.md#networking-issues) を参照してください。
@z

@x
Updating these settings requires a reconfiguration and reboot of the Linux VM.
@y
{% comment %}
Updating these settings requires a reconfiguration and reboot of the Linux VM.
{% endcomment %}
ここでの設定を変更したら、Linux VM の再設定と再起動が必要になります。
@z

@x
#### WSL Integration
@y
{% comment %}
#### WSL Integration
{% endcomment %}
{: #wsl-integration }
#### WSL 統合環境
@z

@x
In WSL 2 mode, you can configure which WSL 2 distributions will have the Docker 
WSL integration.
@y
{% comment %}
In WSL 2 mode, you can configure which WSL 2 distributions will have the Docker 
WSL integration.
{% endcomment %}
WSL 2 モードにおいては、WSL 2 ディストリビューションが Docker WSL 統合環境を持つように設定することができます。
@z

@x
By default, the integration will be enabled on your default WSL distribution. 
To change your default WSL distro, run `wsl --set-default <distro name>`. (For example, 
to set Ubuntu as your default WSL distro, run `wsl --set-default ubuntu`).
@y
{% comment %}
By default, the integration will be enabled on your default WSL distribution. 
To change your default WSL distro, run `wsl --set-default <distro name>`. (For example, 
to set Ubuntu as your default WSL distro, run `wsl --set-default ubuntu`).
{% endcomment %}
デフォルトの WSL ディストリビューション上では、WSL 統合環境がデフォルトで有効になります。
デフォルトの WSL ディストリビューションを変更するには`wsl --set-default <ディストリビューション名>`を実行します。
（たとえばデフォルトとして Ubuntu を設定する場合は`wsl --set-default ubuntu`を実行します。）
@z

@x
You can also select any additional distributions you would like to enable the WSL 2 
integration on.
@y
{% comment %}
You can also select any additional distributions you would like to enable the WSL 2 
integration on.
{% endcomment %}
他に WSL 2 統合環境を有効にしたいディストリビューションがあれば、追加で設定することもできます。
@z

@x
For more details on configuring Docker Desktop to use WSL 2, see 
[Docker Desktop WSL 2 backend](wsl.md).
@y
{% comment %}
For more details on configuring Docker Desktop to use WSL 2, see 
[Docker Desktop WSL 2 backend](wsl.md).
{% endcomment %}
Docker Desktop において WSL 2 を利用するための設定については [Docker Desktop WSL 2 バックエンド](wsl.md) を参照してください。
@z

@x
### Docker Engine
@y
{% comment %}
### Docker Engine
{% endcomment %}
### Docker Engine タブ
@z

@x
The Docker Engine page allows you to configure the Docker daemon to determine how your containers run.
@y
{% comment %}
The Docker Engine page allows you to configure the Docker daemon to determine how your containers run.
{% endcomment %}
Docker Engine のページでは、Docker デーモンに対して、コンテナーを実行させる方法を設定することができます。
@z

@x
Type a JSON configuration file in the box to configure the daemon settings. For a full list of options, see the Docker Engine
[dockerd commandline reference](/engine/reference/commandline/dockerd/){:target="_blank"
class="_"}.
@y
{% comment %}
Type a JSON configuration file in the box to configure the daemon settings. For a full list of options, see the Docker Engine
[dockerd commandline reference](/engine/reference/commandline/dockerd/){:target="_blank"
class="_"}.
{% endcomment %}
テキスト入力欄に JSON 設定ファイルを入力して、デーモンを設定します。
オプションの全一覧についてはDocker Engine の [dockerd コマンドラインリファレンス](/engine/reference/commandline/dockerd/){:target="_blank" class="_"} を参照してください。
@z

@x
Click **Apply & Restart** to save your settings and restart Docker Desktop.
@y
{% comment %}
Click **Apply & Restart** to save your settings and restart Docker Desktop.
{% endcomment %}
**Apply & Restart** をクリックして設定内容を保存し、Docker Desktop を再起動します。
@z

@x
### Command Line
@y
{% comment %}
### Command Line
{% endcomment %}
{: #command-line }
### Command Line タブ
@z

@x
On the Command Line page, you can specify whether or not to enable experimental features.
@y
{% comment %}
On the Command Line page, you can specify whether or not to enable experimental features.
{% endcomment %}
Command Line のページでは、試験的機能を有効にするかどうかを設定することができます。
@z

@x
On both Docker Desktop Edge and Stable releases, you can toggle the experimental features on and off. If you toggle the experimental features off, Docker Desktop uses the current generally available release of Docker Engine.
@y
{% comment %}
On both Docker Desktop Edge and Stable releases, you can toggle the experimental features on and off. If you toggle the experimental features off, Docker Desktop uses the current generally available release of Docker Engine.
{% endcomment %}
Docker Desktop の最新版（Edge）と安定版（Stable）の両方において、試験的機能は有効無効を切り替えることができます。
試験的機能を無効にした場合、Docker Desktop は、Docker Engine の安定版を利用することになります。
@z

@x
#### Experimental features
@y
{% comment %}
#### Experimental features
{% endcomment %}
{: #experimental-features }
#### Experimental features
@z

@x
Docker Desktop Edge releases have the experimental version
of Docker Engine enabled by default, described in the [Docker Experimental Features README](https://github.com/docker/cli/blob/master/experimental/README.md) on GitHub.
@y
{% comment %}
Docker Desktop Edge releases have the experimental version
of Docker Engine enabled by default, described in the [Docker Experimental Features README](https://github.com/docker/cli/blob/master/experimental/README.md) on GitHub.
{% endcomment %}
Docker Desktop 最新版（Edge）には、デフォルトで Docker Engine の試験的（experimental）バージョンが含まれています。
詳しくは GitHub 上の [Docker 試験的機能 README](https://github.com/docker/cli/blob/master/experimental/README.md) に示しています。
@z

@x
{% include experimental.md %}
@y
{% include experimental.md %}
@z

@x
Run `docker version` to verify whether you have enabled experimental features. Experimental mode
is listed under `Server` data. If `Experimental` is `true`, then Docker is
running in experimental mode, as shown here:
@y
{% comment %}
Run `docker version` to verify whether you have enabled experimental features. Experimental mode
is listed under `Server` data. If `Experimental` is `true`, then Docker is
running in experimental mode, as shown here:
{% endcomment %}
`docker version`を実行すると、試験的機能が有効であるかどうかを確認することができます。
試験的モードは`Server`項目の中に示されています。
`Experimental`が`true`であれば、Docker は試験的モードで起動しています。
たとえば以下のように表示されます。
@z

@x
```shell
> docker version
@y
```shell
> docker version
@z

@x
Client: Docker Engine - Community
 Version:           19.03.1
 API version:       1.40
 Go version:        go1.12.5
 Git commit:        74b1e89
 Built:             Thu Jul 25 21:17:08 2019
 OS/Arch:           windows/amd64
 Experimental:      true
@y
Client: Docker Engine - Community
 Version:           19.03.1
 API version:       1.40
 Go version:        go1.12.5
 Git commit:        74b1e89
 Built:             Thu Jul 25 21:17:08 2019
 OS/Arch:           windows/amd64
 Experimental:      true
@z

@x
Server: Docker Engine - Community
 Engine:
  Version:          19.03.1
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.5
  Git commit:       74b1e89
  Built:            Thu Jul 25 21:17:52 2019
  OS/Arch:          linux/amd64
  Experimental:     true
 containerd:
  Version:          v1.2.6
  GitCommit:        894b81a4b802e4eb2a91d1ce216b8817763c29fb
 runc:
  Version:          1.0.0-rc8
  GitCommit:        425e105d5a03fabd737a126ad93d62a9eeede87f
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```
@y
Server: Docker Engine - Community
 Engine:
  Version:          19.03.1
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.5
  Git commit:       74b1e89
  Built:            Thu Jul 25 21:17:52 2019
  OS/Arch:          linux/amd64
  Experimental:     true
 containerd:
  Version:          v1.2.6
  GitCommit:        894b81a4b802e4eb2a91d1ce216b8817763c29fb
 runc:
  Version:          1.0.0-rc8
  GitCommit:        425e105d5a03fabd737a126ad93d62a9eeede87f
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```
@z

@x
### Kubernetes
@y
{% comment %}
### Kubernetes
{% endcomment %}
### Kubernetes タブ
@z

@x
> **Note**
>
> The Kubernetes tab is not available in Windows container mode.
@y
{% comment %}
> **Note**
>
> The Kubernetes tab is not available in Windows container mode.
{% endcomment %}
> **メモ**
>
> Kubernetes タブは Windows コンテナーモードでは利用できません。
@z

@x
Docker Desktop includes a standalone Kubernetes server that runs on your Windows host, so that you can test deploying your Docker workloads on Kubernetes.
@y
{% comment %}
Docker Desktop includes a standalone Kubernetes server that runs on your Windows host, so that you can test deploying your Docker workloads on Kubernetes.
{% endcomment %}
Docker Desktop には、Windows ホスト上で稼動するスタンドアロンの Kubernetes サーバーが含まれます。
したがって Kubernetes 上に構築した Docker アプリをデプロイするテストができます。
@z

@x
![Enable Kubernetes](images/settings-kubernetes.png){:width="750px"}
@y
{% comment %}
![Enable Kubernetes](images/settings-kubernetes.png){:width="750px"}
{% endcomment %}
![Kubernetes の有効化](images/settings-kubernetes.png){:width="750px"}
@z

@x
The Kubernetes client command, `kubectl`, is included and configured to connect
to the local Kubernetes server. If you have `kubectl` already installed and
pointing to some other environment, such as `minikube` or a GKE cluster, be sure
to change context so that `kubectl` is pointing to `docker-desktop`:
@y
{% comment %}
The Kubernetes client command, `kubectl`, is included and configured to connect
to the local Kubernetes server. If you have `kubectl` already installed and
pointing to some other environment, such as `minikube` or a GKE cluster, be sure
to change context so that `kubectl` is pointing to `docker-desktop`:
{% endcomment %}
Kubernetes のクライアントコマンドである`kubectl`が提供されていて、ローカルの Kubernetes サーバーへの接続するように設定されています。
`kubectl`をすでにインストールしていて、`minikube`や GKE クラスターといった別の環境に向いている場合は、その内容を変更して、`kubectl`が`docker-desktop`を向くようにしてください。
@z

@x
```bash
> kubectl config get-contexts
> kubectl config use-context docker-desktop
```
@y
```bash
> kubectl config get-contexts
> kubectl config use-context docker-desktop
```
@z

@x
 To enable Kubernetes support and install a standalone instance of Kubernetes
  running as a Docker container, select **Enable Kubernetes**.
@y
 {% comment %}
 To enable Kubernetes support and install a standalone instance of Kubernetes
  running as a Docker container, select **Enable Kubernetes**.
 {% endcomment %}
 Kubernetes サポートを有効にし、Docker コンテナーとして起動するスタンドアロンの Kubernetes インスタンスをインストールするには、**Enable Kubernetes** を選択します。
@z

@x
To set Kubernetes as the
  [default orchestrator](/docker-for-windows/kubernetes/#override-the-default-orchestrator), select **Deploy Docker Stacks to Kubernetes by default**.
@y
{% comment %}
To set Kubernetes as the
  [default orchestrator](/docker-for-windows/kubernetes/#override-the-default-orchestrator), select **Deploy Docker Stacks to Kubernetes by default**.
{% endcomment %}
Kubernetes を [デフォルトオーケストレーター](kubernetes/#override-the-default-orchestrator) に設定するには、**Deploy Docker Stacks to Kubernetes by default**（Docker スタックをデフォルトで Kubernetes にデプロイ） を実行します。
@z

@x
By default, Kubernetes containers are hidden from commands like `docker
service ls`, because managing them manually is not supported. To make them
visible, select **Show system containers (advanced)**. Most users do not need this option.
@y
{% comment %}
By default, Kubernetes containers are hidden from commands like `docker
service ls`, because managing them manually is not supported. To make them
visible, select **Show system containers (advanced)**. Most users do not need this option.
{% endcomment %}
デフォルトで Kubernetes コンテナーは `docker service ls` などのコマンドには現れません。
手動で管理することがサポートされていないためです。
コマンド上に表示させるためには、**Show system containers (advanced)** を実行します。
ただしたいていのユーザーにとって、このオプションは不要です。
@z

@x
Click **Apply & Restart** to save the settings. This instantiates images required to run the Kubernetes server as containers, and installs the `kubectl.exe` command in the path.
@y
{% comment %}
Click **Apply & Restart** to save the settings. This instantiates images required to run the Kubernetes server as containers, and installs the `kubectl.exe` command in the path.
{% endcomment %}
**Apply & Restart** をクリックして設定を保存します。
これによって Kubernetes サーバーをコンテナーとして実行するために必要となるイメージが初期化され、コマンド`kubectl.exe`が実行パスにインストールされます。
@z

@x
- When Kubernetes is enabled and running, an additional status bar item displays
at the bottom right of the Docker Desktop Settings dialog. The status of Kubernetes shows in the Docker menu and the context points to
  `docker-desktop`.
@y
{% comment %}
- When Kubernetes is enabled and running, an additional status bar item displays
at the bottom right of the Docker Desktop Settings dialog. The status of Kubernetes shows in the Docker menu and the context points to
  `docker-desktop`.
{% endcomment %}
- Kubernetes が有効になって稼動していると、Docker Desktop の Settings 画面の下段右側に、新たにステータスバーが表示されます。
  Kubernetes の状態は Docker メニューに表示され、context が `docker-desktop` を指します。
@z

@x
- To disable Kubernetes support at any time, clear the **Enable Kubernetes** check box.
  The Kubernetes containers are stopped and removed, and the
  `/usr/local/bin/kubectl` command is removed.
@y
{% comment %}
- To disable Kubernetes support at any time, clear the **Enable Kubernetes** check box.
  The Kubernetes containers are stopped and removed, and the
  `/usr/local/bin/kubectl` command is removed.
{% endcomment %}
- どの時点でも Kubernetes サポートを無効にするには、**Enable Kubernetes** チェックボックスをオフにします。
  Kubernetes コンテナーが停止して削除されます。
  そして `/usr/local/bin/kubectl` コマンドも削除されます。
@z

@x
- To delete all stacks and Kubernetes resources, select **Reset Kubernetes Cluster**.
@y
{% comment %}
- To delete all stacks and Kubernetes resources, select **Reset Kubernetes Cluster**.
{% endcomment %}
- インストールされたスタックや Kubernetes リソースを削除するには、**Reset Kubernetes Cluster**（Kubernetes クラスターのリセット） を実行します。
@z

@x
- If you installed `kubectl` by another method, and
experience conflicts, remove it.
@y
{% comment %}
- If you installed `kubectl` by another method, and
experience conflicts, remove it.
{% endcomment %}
- `kubectl` を別の方法でインストールしていて何か支障が発生したら、これを削除してください。
@z

@x
  For more information on using the Kubernetes integration with Docker Desktop, see [Deploy on Kubernetes](kubernetes.md).
@y
  {% comment %}
  For more information on using the Kubernetes integration with Docker Desktop, see [Deploy on Kubernetes](kubernetes.md).
  {% endcomment %}
  Docker Desktop における Kubernetes 利用の詳細については [Kubernetes へのデプロイ](kubernetes.md) を参照してください。
@z

@x
### Reset
@y
{% comment %}
### Reset
{% endcomment %}
### Reset タブ
@z

@x
The **Restart Docker Desktop** and **Reset to factory defaults** options are now available on the **Troubleshoot** menu. For information, see [Logs and Troubleshooting](troubleshoot.md).
@y
{% comment %}
The **Restart Docker Desktop** and **Reset to factory defaults** options are now available on the **Troubleshoot** menu. For information, see [Logs and Troubleshooting](troubleshoot.md).
{% endcomment %}
**Restart Docker Desktop**、**Reset to factory defaults**、その他のリセットオプションは、**Troubleshoot** メニューにあります。
詳細は [ログとトラブルシューティング](troubleshoot.md) を参照してください。
@z

@x
### Troubleshoot
@y
{% comment %}
### Troubleshoot
{% endcomment %}
{: #troubleshoot }
### トラブルシューティング
@z

@x
Visit our [Logs and Troubleshooting](troubleshoot.md) guide for more details.
@y
{% comment %}
Visit our [Logs and Troubleshooting](troubleshoot.md) guide for more details.
{% endcomment %}
詳しくは [ログとトラブルシューティング](troubleshoot.md) を参照してください。
@z

@x
Log on to our [Docker Desktop for Windows forum](https://forums.docker.com/c/docker-for-windows) to get help from the community, review current user topics, or join a discussion.
@y
{% comment %}
Log on to our [Docker Desktop for Windows forum](https://forums.docker.com/c/docker-for-windows) to get help from the community, review current user topics, or join a discussion.
{% endcomment %}
[Docker Desktop for Windows フォーラム](https://forums.docker.com/c/docker-for-windows) にログインすれば、コミュニティからのヘルプ、現状ユーザーのトピック参照、議論への参加を行うことができます。
@z

@x
Log on to [Docker Desktop for Windows issues on GitHub](https://github.com/docker/for-win/issues) to report bugs or problems and review community reported issues.
@y
{% comment %}
Log on to [Docker Desktop for Windows issues on GitHub](https://github.com/docker/for-win/issues) to report bugs or problems and review community reported issues.
{% endcomment %}
[GitHub 上の Docker Desktop for Windows の issue](https://github.com/docker/for-win/issues) へログインして、バグや問題の報告を行ったり、コミュニティによる報告を確認したりしてください。
@z

@x
For information about providing feedback on the documentation or update it yourself, see [Contribute to documentation](/opensource/).
@y
{% comment %}
For information about providing feedback on the documentation or update it yourself, see [Contribute to documentation](/opensource/).
{% endcomment %}
ドキュメントへのフィードバックや更新方法については [ドキュメントへの貢献](/opensource/) を参照してください。
@z

@x
## Switch between Windows and Linux containers
@y
{% comment %}
## Switch between Windows and Linux containers
{% endcomment %}
{: #switch-between-windows-and-linux-containers }
## Windows と Linux の各コンテナー間の切り替え
@z

@x
From the Docker Desktop menu, you can toggle which daemon (Linux or Windows)
the Docker CLI talks to. Select **Switch to Windows containers** to use Windows
containers, or select **Switch to Linux containers** to use Linux containers
(the default).
@y
{% comment %}
From the Docker Desktop menu, you can toggle which daemon (Linux or Windows)
the Docker CLI talks to. Select **Switch to Windows containers** to use Windows
containers, or select **Switch to Linux containers** to use Linux containers
(the default).
{% endcomment %}
Docker Desktop メニューにおいて、Docker CLI が通信するデーモンをどれにするか（Linux か Windows か）を切り替えるメニューがあります。
**Switch to Windows containers**（Windows コンテナーへの切り替え）を実行すれば Windows コンテナーを利用します。
あるいは **Switch to Linux containers**（Linux コンテナーへの切り替え）を実行すれば Linux コンテナーを利用します（デフォルト）。
@z

@x
For more information on Windows containers, refer to the following documentation:
@y
{% comment %}
For more information on Windows containers, refer to the following documentation:
{% endcomment %}
Windows コンテナーについての詳細は、以下のドキュメントを参照してください。
@z

@x
- Microsoft documentation on [Windows containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index).
@y
{% comment %}
- Microsoft documentation on [Windows containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index).
{% endcomment %}
- Microsoft の [Windows コンテナー](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index) に関するドキュメント。
@z

@x
- [Build and Run Your First Windows Server Container (Blog Post)](https://blog.docker.com/2016/09/build-your-first-docker-windows-server-container/)
  gives a quick tour of how to build and run native Docker Windows containers on Windows 10 and Windows Server 2016 evaluation releases.
@y
{% comment %}
- [Build and Run Your First Windows Server Container (Blog Post)](https://blog.docker.com/2016/09/build-your-first-docker-windows-server-container/)
  gives a quick tour of how to build and run native Docker Windows containers on Windows 10 and Windows Server 2016 evaluation releases.
{% endcomment %}
- [はじめての Windows Server コンテナーのビルドと実行（ブログ投稿）](https://blog.docker.com/2016/09/build-your-first-docker-windows-server-container/) は、Windows 10 および Windows Server 2016 評価版を使って、ネイティブな Docker Windows コンテナーのビルドと実行方法についてのクイックツアーを提供しています。
@z

@x
- [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  shows you how to use the [MusicStore](https://github.com/aspnet/MusicStore/blob/dev/README.md)
  application with Windows containers. The MusicStore is a standard .NET application and,
  [forked here to use containers](https://github.com/friism/MusicStore), is a good example of a multi-container application.
@y
{% comment %}
- [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  shows you how to use the [MusicStore](https://github.com/aspnet/MusicStore/blob/dev/README.md)
  application with Windows containers. The MusicStore is a standard .NET application and,
  [forked here to use containers](https://github.com/friism/MusicStore), is a good example of a multi-container application.
{% endcomment %}
- [Windows コンテナーをはじめよう（ラボ）](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md) では、Windows コンテナー上での [MusicStore](https://github.com/aspnet/MusicStore/blob/dev/README.md) アプリケーションの利用方法を示しています。
  MusicStore は標準 .NET アプリケーションであり、[コンテナー利用のためにこちらでフォークされています](https://github.com/friism/MusicStore)。
  これはマルチコンテナーアプリケーションの例として最適です。
@z

@x
- To understand how to connect to Windows containers from the local host, see
  [Limitations of Windows containers for `localhost` and published ports](troubleshoot.md#limitations-of-windows-containers-for-localhost-and-published-ports)
@y
{% comment %}
- To understand how to connect to Windows containers from the local host, see
  [Limitations of Windows containers for `localhost` and published ports](troubleshoot.md#limitations-of-windows-containers-for-localhost-and-published-ports)
{% endcomment %}
- ローカルホストから Windows コンテナーへの接続方法を理解するには、[`localhost` や公開ポートに対する Windows コンテナーの制約](troubleshoot.md#limitations-of-windows-containers-for-localhost-and-published-ports) を参照してください。
@z

@x
> Settings dialog changes with Windows containers
>
> When you switch to Windows containers, the Settings dialog only shows those tabs that are active and apply to your Windows containers:
>
@y
{% comment %}
> Settings dialog changes with Windows containers
>
> When you switch to Windows containers, the Settings dialog only shows those tabs that are active and apply to your Windows containers:
>
{% endcomment %}
> Windows コンテナーへの切り替えによる Settings ダイアログの変更
>
> Windows コンテナーに切り替えると、Settings ダイアログでは以下のタブだけが操作可能であり、Windows コンテナーへの設定を行うことができます。
>
@z

@x
  * [General](#general)
  * [Proxies](#proxies)
  * [Daemon](#docker-daemon)
  * [Reset](#reset)
@y
  {% comment %}
  * [General](#general)
  * [Proxies](#proxies)
  * [Daemon](#docker-daemon)
  * [Reset](#reset)
  {% endcomment %}
  * [General タブ](#general)
  * [Proxies タブ](#proxies)
  * [Daemon タブ](#docker-daemon)
  * [Reset タブ](#reset)
@z

@x
If you set proxies or daemon configuration in Windows containers mode, these
apply only on Windows containers. If you switch back to Linux containers,
proxies and daemon configurations return to what you had set for Linux
containers. Your Windows container settings are retained and become available
again when you switch back.
@y
{% comment %}
If you set proxies or daemon configuration in Windows containers mode, these
apply only on Windows containers. If you switch back to Linux containers,
proxies and daemon configurations return to what you had set for Linux
containers. Your Windows container settings are retained and become available
again when you switch back.
{% endcomment %}
Windows コンテナーモードにおいてプロキシーやデーモン設定を行った場合、その設定は Windows コンテナーに対してのみ適用されます。
Linux コンテナーに戻した場合、プロキシーやデーモンの設定は、元々 Linux コンテナーに対して行っていた設定に戻ります。
この際の Windows コンテナー設定は保持されるので、元に戻すと再度利用できるようになります。
@z

@x
## Dashboard
@y
{% comment %}
## Dashboard
{% endcomment %}
{: #dashboard }
## ダッシュボード
@z

@x
The Docker Desktop Dashboard enables you to interact with containers and applications and manage the lifecycle of your applications directly from your machine. The Dashboard UI shows all running, stopped, and started containers with their state. It provides an intuitive interface to perform common actions to inspect and manage containers and Docker Compose applications. For more information, see [Docker Desktop Dashboard](../desktop/dashboard.md).
@y
{% comment %}
The Docker Desktop Dashboard enables you to interact with containers and applications and manage the lifecycle of your applications directly from your machine. The Dashboard UI shows all running, stopped, and started containers with their state. It provides an intuitive interface to perform common actions to inspect and manage containers and Docker Compose applications. For more information, see [Docker Desktop Dashboard](../desktop/dashboard.md).
{% endcomment %}
Docker Desktop ダッシュボードは、コンテナーやアプリケーションを対話的に操作できるようにするものであり、アプリケーションのライフサイクルを手元のマシンから直接管理できます。 
ダッシュボードの UI 画面からは、すべてのコンテナーが実行中、停止中、起動中といったステータスとともに表示されます。
直感的なインターフェースを通じて、コンテナーや Docker Compose ベースのアプリケーションといった Docker オブジェクトを、確認し管理することができます。
[Docker Desktop ダッシュボード](../desktop/dashboard.md) を参照してください。
@z

@x
## Docker Hub
@y
## Docker Hub
@z

@x
Select **Sign in /Create Docker ID** from the Docker Desktop menu to access your [Docker Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_" } account. Once logged in, you can access your Docker Hub repositories directly from the Docker Desktop menu.
@y
{% comment %}
Select **Sign in /Create Docker ID** from the Docker Desktop menu to access your [Docker Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_" } account. Once logged in, you can access your Docker Hub repositories directly from the Docker Desktop menu.
{% endcomment %}
Docker Desktop メニューから **Sign in /Create Docker ID** を実行すると、[Docker Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_" } アカウントにアクセスすることができます。
ログインを行っておけば、Docker Desktop メニューから Docker Hub リポジトリに直接アクセスできます。
@z

@x
For more information, refer to the following [Docker Hub topics](../docker-hub/index.md){: target="_blank" rel="noopener" class="_" }:
@y
{% comment %}
For more information, refer to the following [Docker Hub topics](../docker-hub/index.md){: target="_blank" rel="noopener" class="_" }:
{% endcomment %}
詳しくは、以下に示す [Docker Hub トピック](../docker-hub/index.md){: target="_blank" rel="noopener" class="_" } を参照してください。
@z

@x
* [Organizations and Teams in Docker Hub](../docker-hub/orgs.md){: target="_blank" rel="noopener" class="_" }
* [Builds and Images](../docker-hub/builds/index.md){: target="_blank" rel="noopener" class="_" }
@y
{% comment %}
* [Organizations and Teams in Docker Hub](../docker-hub/orgs.md){: target="_blank" rel="noopener" class="_" }
* [Builds and Images](../docker-hub/builds/index.md){: target="_blank" rel="noopener" class="_" }
{% endcomment %}
* [Docker Hub における組織とチーム](../docker-hub/orgs.md){: target="_blank" rel="noopener" class="_" }
* [ビルドとイメージ](../docker-hub/builds/index.md){: target="_blank" rel="noopener" class="_" }
@z

@x
### Two-factor authentication
@y
{% comment %}
### Two-factor authentication
{% endcomment %}
{: #two-factor-authentication }
### 2 要素認証
@z

@x
Docker Desktop enables you to sign into Docker Hub using two-factor authentication. Two-factor authentication provides an extra layer of security when accessing your Docker Hub account.
@y
{% comment %}
Docker Desktop enables you to sign into Docker Hub using two-factor authentication. Two-factor authentication provides an extra layer of security when accessing your Docker Hub account.
{% endcomment %}
Docker Desktop では Docker Hub へのサインイン時に 2 要素認証（two-factor authentication）を利用することができます。
2 要素認証は Docker Hub アカウントへのアクセス時に、二重のセキュリティを提供するものです。
@z

@x
You must enable two-factor authentication in Docker Hub before signing into your Docker Hub account through Docker Desktop. For instructions, see [Enable two-factor authentication for Docker Hub](/docker-hub/2fa/).
@y
{% comment %}
You must enable two-factor authentication in Docker Hub before signing into your Docker Hub account through Docker Desktop. For instructions, see [Enable two-factor authentication for Docker Hub](/docker-hub/2fa/).
{% endcomment %}
Docker Desktop 経由で Docker Hub アカウントへのサインインを行う前には、あらかじめ 2 要素認証を有効にしておく必要があります。
その手順については [Docker Hub における 2 要素認証の有効化](/docker-hub/2fa/) を参照してください。
@z

@x
After you have enabled two-factor authentication:
@y
{% comment %}
After you have enabled two-factor authentication:
{% endcomment %}
2 要素認証の有効化が済んだら、以下を行います。
@z

@x
1. Go to the Docker Desktop menu and then select **Sign in / Create Docker ID**.
@y
{% comment %}
1. Go to the Docker Desktop menu and then select **Sign in / Create Docker ID**.
{% endcomment %}
1. Docker Desktop メニューから **Sign in / Create Docker ID** を実行します。
@z

@x
2. Enter your Docker ID and password and click **Sign in**.
@y
{% comment %}
2. Enter your Docker ID and password and click **Sign in**.
{% endcomment %}
2. Docker ID とパスワードを入力して **Sign in** をクリックします。
@z

@x
3. After you have successfully signed in, Docker Desktop prompts you to enter the authentication code. Enter the six-digit code from your phone and then click **Verify**.
@y
{% comment %}
3. After you have successfully signed in, Docker Desktop prompts you to enter the authentication code. Enter the six-digit code from your phone and then click **Verify**.
{% endcomment %}
3. サインインに成功したら、Docker Desktop が認証コードの入力を求めてきます。
   電話に届いた 6 桁のコードを入力して **Verify** をクリックします。
@z

@x
![Docker Desktop 2FA](images/desktop-win-2fa.png){:width="500px"}
@y
{% comment %}
![Docker Desktop 2FA](images/desktop-win-2fa.png){:width="500px"}
{% endcomment %}
![Docker Desktop の 2 要素認証](images/desktop-win-2fa.png){:width="500px"}
@z

@x
After you have successfully authenticated, you can access your organizations and repositories directly from the Docker Desktop menu.
@y
{% comment %}
After you have successfully authenticated, you can access your organizations and repositories directly from the Docker Desktop menu.
{% endcomment %}
認証が正常に行われたら、Docker Desktop メニューから組織やリポジトリに直接アクセスできるようになります。
@z

@x
## Adding TLS certificates
@y
{% comment %}
## Adding TLS certificates
{% endcomment %}
{: #adding-tls-certificates }
## TLS 証明書の追加
@z

@x
You can add trusted **Certificate Authorities (CAs)** to your Docker daemon to verify registry server
certificates, and **client certificates**, to authenticate to registries. For more information, see [How do I add custom CA certificates?](faqs.md#how-do-i-add-custom-ca-certificates)
and [How do I add client certificates?](faqs.md#how-do-i-add-client-certificates)
in the FAQs.
@y
{% comment %}
You can add trusted **Certificate Authorities (CAs)** to your Docker daemon to verify registry server
certificates, and **client certificates**, to authenticate to registries. For more information, see [How do I add custom CA certificates?](faqs.md#how-do-i-add-custom-ca-certificates)
and [How do I add client certificates?](faqs.md#how-do-i-add-client-certificates)
in the FAQs.
{% endcomment %}
Docker デーモンに対して、信頼された **認証局（Certificate Authorities; CA）** を追加することができます。
これを用いてレジストリーサーバーの証明書と **クライアント証明書** を検証し、レジストリに対して認証します。
詳しくは FAQ にある [どうやって独自の CA 証明書を追加するか](faqs.md#how-do-i-add-custom-ca-certificates) や [どうやってクライアント証明書を追加するか](faqs.md#how-do-i-add-client-certificates) を参照してください。
@z

@x
### How do I add custom CA certificates?
@y
{% comment %}
### How do I add custom CA certificates?
{% endcomment %}
{: #how-do-i-add-custom-ca-certificates }
### どうやって独自の CA 証明書を追加するか
@z

@x
Docker Desktop supports all trusted Certificate Authorities (CAs) (root or
intermediate). Docker recognizes certs stored under Trust Root
Certification Authorities or Intermediate Certification Authorities.
@y
{% comment %}
Docker Desktop supports all trusted Certificate Authorities (CAs) (root or
intermediate). Docker recognizes certs stored under Trust Root
Certification Authorities or Intermediate Certification Authorities.
{% endcomment %}
Docker Desktop では、信頼された認証局（Certificate Authorities; CA）をすべてサポートしています（ルート認証局および中間認証局）。
Docker は、信頼されたルート証明機関や中間証明機関のもとに保存された証明書を識別します。
@z

@x
Docker Desktop creates a certificate bundle of all user-trusted CAs based on
the Windows certificate store, and appends it to Moby trusted certificates. Therefore, if an enterprise SSL certificate is trusted by the user on the host, it is trusted by Docker Desktop.
@y
{% comment %}
Docker Desktop creates a certificate bundle of all user-trusted CAs based on
the Windows certificate store, and appends it to Moby trusted certificates. Therefore, if an enterprise SSL certificate is trusted by the user on the host, it is trusted by Docker Desktop.
{% endcomment %}
Docker Desktop は Windows の証明書ストアに基づいて、ユーザーが信頼できる CA すべてを含めた CA バンドルを生成します。
そしてこれを Moby による信頼された証明書に加えます。
したがってホスト上において企業認証 SSL 証明書（enterprise SSL certificate）がユーザーによって信頼されていれば、Docker Desktop から信頼されているということです。
@z

@x
To learn more about how to install a CA root certificate for the registry, see
[Verify repository client with certificates](../engine/security/certificates.md)
in the Docker Engine topics.
@y
{% comment %}
To learn more about how to install a CA root certificate for the registry, see
[Verify repository client with certificates](../engine/security/certificates.md)
in the Docker Engine topics.
{% endcomment %}
レジストリに対して CA ルート証明書をインストールする方法については、Docker Engine のトピックにある [証明書を使ったリポジトリクライアントの確認](../engine/security/certificates.md) を参照してください。
@z

@x
### How do I add client certificates?
@y
{% comment %}
### How do I add client certificates?
{% endcomment %}
{: #how-do-i-add-client-certificates }
### どうやってクライアント証明書を追加するか
@z

@x
You can add your client certificates
in `~/.docker/certs.d/<MyRegistry>:<Port>/client.cert` and
`~/.docker/certs.d/<MyRegistry>:<Port>/client.key`. You do not need to push your certificates with `git` commands.
@y
{% comment %}
You can add your client certificates
in `~/.docker/certs.d/<MyRegistry>:<Port>/client.cert` and
`~/.docker/certs.d/<MyRegistry>:<Port>/client.key`. You do not need to push your certificates with `git` commands.
{% endcomment %}
クライアント証明書は`~/.docker/certs.d/<MyRegistry>:<Port>/client.cert`と`~/.docker/certs.d/<MyRegistry>:<Port>/client.key`に追加することができます。
証明書を`git`コマンドを使ってプッシュする必要はありません。
@z

@x
When the Docker Desktop application starts, it copies the
`~/.docker/certs.d` folder on your Windows system to the `/etc/docker/certs.d`
directory on Moby (the Docker Desktop virtual machine running on Hyper-V).
@y
{% comment %}
When the Docker Desktop application starts, it copies the
`~/.docker/certs.d` folder on your Windows system to the `/etc/docker/certs.d`
directory on Moby (the Docker Desktop virtual machine running on Hyper-V).
{% endcomment %}
Docker Desktop アプリケーションが起動する際には、Windows システム内の`~/.docker/certs.d`フォルダーを、Moby （Hyper-V において稼動する Docker Desktop 仮想マシン）上の`/etc/docker/certs.d`ディレクトリにコピーします。
@z

@x
You need to restart Docker Desktop after making any changes to the keychain
or to the `~/.docker/certs.d` directory in order for the changes to take effect.
@y
{% comment %}
You need to restart Docker Desktop after making any changes to the keychain
or to the `~/.docker/certs.d` directory in order for the changes to take effect.
{% endcomment %}
キーチェーンや`~/.docker/certs.d`ディレクトリ内に変更を加えた場合には、これを適用させるために Docker Desktop の再起動が必要になります。
@z

@x
The registry cannot be listed as an _insecure registry_ (see
[Docker Daemon](#docker-engine)). Docker Desktop ignores
certificates listed under insecure registries, and does not send client
certificates. Commands like `docker run` that attempt to pull from the registry
produce error messages on the command line, as well as on the registry.
@y
{% comment %}
The registry cannot be listed as an _insecure registry_ (see
[Docker Daemon](#docker-engine)). Docker Desktop ignores
certificates listed under insecure registries, and does not send client
certificates. Commands like `docker run` that attempt to pull from the registry
produce error messages on the command line, as well as on the registry.
{% endcomment %}
**セキュアでないレジストリ** はレジストリ一覧に表示させることはできません（[Docker デーモン](#docker-engine) 参照）。
Docker Desktop ではセキュアではないレジストリのもとにある証明書は無視し、クライアント証明書を送信しません。
そのような場合にレジストリからプルを行う`docker run`のようなコマンドを実行すると、コマンドライン上とレジストリ上にエラーメッセージが出力されます。
@z

@x
To learn more about how to set the client TLS certificate for verification, see
[Verify repository client with certificates](../engine/security/certificates.md)
in the Docker Engine topics.
@y
{% comment %}
To learn more about how to set the client TLS certificate for verification, see
[Verify repository client with certificates](../engine/security/certificates.md)
in the Docker Engine topics.
{% endcomment %}
クライアント TLS 証明書による検証を実現する方法については、Docker Engine のトピックにある [証明書を使ったリポジトリクライアントの確認](../engine/security/certificates.md) を参照してください。
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
* Try out the walkthrough at [Get Started](../get-started/index.md){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
* Try out the walkthrough at [Get Started](../get-started/index.md){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
* [はじめよう](../get-started/index.md){: target="_blank" rel="noopener" class="_"} に示されているウォークスルーを試してみてください。
@z

@x
* Dig in deeper with [Docker Labs](https://github.com/docker/labs/) example walkthroughs and source code.
@y
{% comment %}
* Dig in deeper with [Docker Labs](https://github.com/docker/labs/) example walkthroughs and source code.
{% endcomment %}
* [Docker Labs](https://github.com/docker/labs/) にあるウォークスルーやソースコードを参照して、理解を深めてください。
@z

@x
* Refer to the [Docker CLI Reference Guide](/engine/reference/commandline/cli/){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
* Refer to the [Docker CLI Reference Guide](/engine/reference/commandline/cli/){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
* [Docker CLI リファレンスガイド](/engine/reference/commandline/cli/){: target="_blank" class="_"} を参照してください。
@z
