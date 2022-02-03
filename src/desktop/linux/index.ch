%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Linux Tech Preview
keywords: docker, linux, tech preview
title: Docker Desktop for Linux (Tech Preview)
toc_min: 1
toc_max: 2
---
@y
---
description: Docker Desktop for Linux Tech Preview
keywords: docker, linux, tech preview
title: Docker Desktop for Linux (技術プレビュー)
toc_min: 1
toc_max: 2
---
@z

@x
Welcome to the Docker Desktop for Linux Tech Preview. This Tech Preview is aimed at early adopters who would like to try an experimental build of Docker Desktop for Linux and provide feedback.
@y
Docker Desktop for Linux 技術プレビューへようこそ。
この技術プレビューは、Docker Desktop for Linux の試験的ビルドをいち早く試したい方、フィードバックを提供して頂ける方に向けたものです。
@z

@x
Docker Desktop is an easy-to-install application that enables you to build and
share containerized applications and microservices. Docker Desktop for Linux
(DD4L) is the second-most popular feature request in our [public
roadmap](https://github.com/docker/roadmap/projects/1){: target="_blank"
rel="noopener" class="_"}.
@y
Docker Desktop は簡単にインストールできるアプリケーションであり、これを使えばコンテナー化アプリケーションやマイクロサービスをビルドして共有できるようになります。
Docker Desktop for Linux (DD4L) は [公開ロードマップ](https://github.com/docker/roadmap/projects/1){: target="_blank"
rel="noopener" class="_"} において、2 番めに人気を集めた機能リクエストにあがっていました。
@z

@x
## Download and install
@y
{: #download-and-install }
## ダウンロードとインストール
@z

@x
Docker Desktop for Linux is currently available on Ubuntu 21.04, 21.10 and
Debian distributions.
@y
Docker Desktop for Linux は今のところ Ubuntu 21.04, 21.10 および Debian において利用できます。
@z

@x
To install Docker Desktop for Linux:
@y
Docker Desktop for Linux をインストールするには以下のようにします。
@z

@x
1. Set up the [Docker repository](../../engine/install/ubuntu.md#install-using-the-repository).
2. Download and install the Tech Preview Debian package:
    ```console
    $ curl https://desktop-stage.docker.com/linux/main/amd64/74134/docker-desktop.deb --output docker-desktop.deb
    $ sudo apt install ./docker-desktop.deb
    ```
3. Check whether the user belongs to `docker` and `kvm` groups. You may need to restart the host to load the group configuration (automated in post-install script).
@y
1. [Docker リポジトリ](../../engine/install/ubuntu.md#install-using-the-repository) を設定します。
2. Debian の技術プレビューパッケージをダウンロードしてインストールします。
    ```console
    $ curl https://desktop-stage.docker.com/linux/main/amd64/74134/docker-desktop.deb --output docker-desktop.deb
    $ sudo apt install ./docker-desktop.deb
    ```
3. ユーザーがグループ`docker`と`kvm`に所属していることを確認します。
   グループ設定をロードするために、ホストの再起動が必要かもしれません（インストール後のスクリプトでは自動化されています）。
@z

@x
  There are a few post-install configuration steps done through the maintainers' scripts (post-install script contained
  in the deb package.
@y
  メンテナースクリプトによって実施される、インストール後の設定手順がいくつかあります（deb パッケージにはインストール後のスクリプトが用意されています）。
@z

@x
  For each user, the post-install script:
@y
  インストール後のスクリプトは、各ユーザーに対して以下を行います。
@z

@x
   - installs systemd units
   - configures `desktop-linux` as the default Docker CLI context
   - installs Compose and the `docker scan` plugins to `~/.docker/cli-plugins`
   - enables Compose V2 as the default `docker-compose`
   - adds user to `docker` and `kvm` groups
@y
   - systemd ユニットをインストールします。
   - デフォルトの Docker CLI コンテキストとして`desktop-linux`を設定します。
   - Compose と`docker scan`プラグインを`~/.docker/cli-plugins`にインストールします。
   - デフォルトの`docker-compose`として Compose V2 を有効にします。
   - ユーザーをグループ`docker`と`kvm`に追加します。
@z

@x
  In addition, the post-install script:
@y
  インストール後のスクリプトは、さらに以下も行います。
@z

@x
  - sets the capability on the Docker Desktop binary to map privileged ports and set resource limits
  - adds a DNS name for Kubernetes to `/etc/hosts`
  - creates the Docker Desktop file for the application launcher
@y
  - Docker Desktop の実行ファイルに対して、特権ポートを割り当てリソース制限を設定するためのケーパビリティーを設定します。
  - Kubernetes に対する DNS 名を`/etc/hosts`に追加します。
  - アプリケーション起動のための Docker Desktop ファイルを生成します。
@z

@x
## Check the shared memory
@y
{: #check-the-shared-memory }
## 共有メモリの確認
@z

@x
Before you run Docker Desktop for Linux, verify whether the shared memory available on the host is **higher** than the memory allocated to the VM. By default, Docker Desktop allocates half of the memory and CPU from the host. The **available shared memory** should be higher than this.
@y
Docker Desktop for Linux の実行前には、ホスト上の共有メモリが VM に割り当てているメモリよりも **大きい** ことを確認してください。
デフォルトにおいて Docker Desktop は、ホスト上のメモリと CPU の半分を割り当てます。
**利用可能な共有メモリ** はそれよりも大きくなければなりません。
@z

@x
```console
$ df -h /dev/shm
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            16G  200M   16G   2% /dev/shm
```
@y
```console
$ df -h /dev/shm
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            16G  200M   16G   2% /dev/shm
```
@z

@x
To set the shared memory size, run:
@y
共有メモリサイズを設定するには、以下を実行します。
@z

@x
```console
$ sudo mount -o remount,size=<the-size-you-want-in-GB> /dev/shm
```
@y
```console
$ sudo mount -o remount,size=<the-size-you-want-in-GB> /dev/shm
```
@z

@x
To ensure this setting persists after a reboot, add the following entry to the `/etc/fstab`:
@y
再起動後もその設定が永続的なものとなるように、以下のような項目を`/etc/fstab`に追加します。
@z

@x
```console
none    /dev/shm    tmpfs   defaults,size=<the-size-you-want-in-GB>   0   0
```
@y
```console
none    /dev/shm    tmpfs   defaults,size=<GB 単位の必要サイズ>   0   0
```
@z

@x
For example:
@y
たとえば以下のとおりです。
@z

@x
```console
none    /dev/shm    tmpfs   defaults,size=8G    0   0
```
@y
```console
none    /dev/shm    tmpfs   defaults,size=8G    0   0
```
@z

@x
## Launch Docker Desktop
@y
{: #launch-docker-desktop }
## Docker Desktop の起動
@z

@x
> **Note:**
>
> You may need to restart the host to load the group configuration.
@y
> **メモ**
>
> グループ設定をロードするために、ホストの再起動が必要かもしれません。
@z

@x
To start Docker Desktop for Linux, search **Docker Desktop** on the
**Applications** menu and open it. This launches the whale menu icon and opens
the Docker Dashboard, reporting the status of Docker Desktop.
@y
Docker Desktop for Linux を開始するには、**Applications** メニューから **Docker Desktop** を探し出して開きます。
これを行うことで、クジラメニューアイコンが起動して Docker ダッシュボードが開きます。
そこでは Docker Desktop の状態が表示されます。
@z

@x
Alternatively, open a terminal and run:
@y
別の方法として、端末を開いて以下を実行することもできます。
@z

@x
```console
$ systemctl --user start docker-desktop
```
@y
```console
$ systemctl --user start docker-desktop
```
@z

@x
When Docker Desktop starts, it creates a dedicated context that the Docker CLI can use as a target. This is to avoid a clash with a local Docker Engine that may be running on the Linux host and using the default context.
@y
Docker Desktop が起動すると、Docker CLI がターゲットとして利用する専用のコンテキストが生成されます。
これは Linux ホスト上にローカルで Docker Engine が起動していて、デフォルトのコンテキストを用いている場合に、それとの衝突を避けるためです。
@z

@x
Run the following command to switch to the desktop-linux context.
@y
以下のコマンドを実行して desktop-linux コンテキストに切り替えます。
@z

@x
```console
 $ docker context use desktop-linux
```
@y
```console
 $ docker context use desktop-linux
```
@z

@x
The Docker Desktop installer updates Docker Compose and the Docker CLI binaries
on the host. It installs Docker Compose V2 as the default Docker Compose. It
also replaces the default Docker CLI with a new Docker CLI binary that includes
cloud-integration capabilities.
@y
Docker Desktop インストーラーは、ホスト上の Docker Compose と Docker CLI バイナリを更新します。
このときにはデフォルトの Docker Compose として Docker Compose V2 がインストールされます。
またデフォルトの Docker CLI が、クラウド統合機能を含む新たな Docker CLI バイナリに置き換えられます。
@z

@x
After you’ve successfully installed Docker Desktop, you can check the versions
of these binaries by running the following command:
@y
Docker Desktop のインストールを正常終了したら、以下のコマンドを実行して各バイナリのバージョンを確認します。
@z

@x
```console
$ docker-compose version
Docker Compose version v2.2.3
@y
```console
$ docker-compose version
Docker Compose version v2.2.3
@z

@x
$ docker --version
Docker version 20.10.12, build e91ed57
@y
$ docker --version
Docker version 20.10.12, build e91ed57
@z

@x
$ docker version
Client: Docker Engine - Community
Cloud integration: 1.0.17
Version:           20.10.12
API version:       1.41
...
```
@y
$ docker version
Client: Docker Engine - Community
Cloud integration: 1.0.17
Version:           20.10.12
API version:       1.41
...
```
@z

@x
To enable Docker Desktop to start on login, from the Docker menu, select
**Settings** > **General** > **Start Docker Desktop when you log in**.
@y
ログイン時に Docker Desktop を有効にするには、Docker メニューから **Settings** > **General** > **Start Docker Desktop when you log in** を選びます。
@z

@x
Alternatively, open a terminal and run:
@y
あるいは端末を開いて以下を実行することもできます。
@z

@x
```console
$ systemctl --user enable docker-desktop
```
@y
```console
$ systemctl --user enable docker-desktop
```
@z

@x
To stop Docker Desktop, click on the whale menu tray icon to open the Docker menu and select **Quit Docker Desktop**.
@y
Docker Desktop を停止するには、タスクトレイのクジラメニューアイコンをクリックして Docker メニューを開きます。
そして **Quit Docker Desktop** を選びます。
@z

@x
Alternatively, open a terminal and run:
@y
あるいは端末を開いて以下を実行することもできます。
@z

@x
```console
$ systemctl --user stop docker-desktop
```
@y
```console
$ systemctl --user stop docker-desktop
```
@z

@x
## Logs
@y
{: #logs }
## ログ
@z

@x
To create and upload a diagnostics bundle:
@y
診断バンドル（diagnostics bundle）を生成して更新するには、以下を行います。
@z

@x
1. From the Docker menu, select **Troubleshoot** > **Get support**.
2. When the diagnostics are available, click **Upload to get a Diagnostic ID**.
3. Make a note of the Diagnostic ID displayed on the Support page. You can send this ID with your bug report to investigate any issues.
**Troubleshoot** > **Get support**. Wait for a bundle to be generated, once uploaded, it displays a diagnostics ID that can be sent to us for investigation.
@y
1. Docker メニューから **Troubleshoot** > **Get support** を選びます。
2. 診断機能が利用可能であれば **Upload to get a Diagnostic ID** をクリックします。
3. サポートページ上に表示される Diagnostic ID を書き留めておきます。
   何かの問題を調査する際には、この ID を含めてバグ報告を送信します。
   **Troubleshoot** > **Get support** によるバンドルのアップロードと生成を待ちます。
   その後に診断 ID（diagnostics ID）が表示されるので、調査が必要な場合にはこれを送信します。
@z

@x
Or, if you prefer to investigate the issue, you can access Docker Desktop logs by running the following command:
@y
あるいは自分で問題を調査したい場合には、以下のコマンドを実行して Docker Desktop のログにアクセスできます。
@z

@x
```console
$ journalctl --user --unit=docker-desktop
```
@y
```console
$ journalctl --user --unit=docker-desktop
```
@z

@x
You can also find additional logs for the internal components included in Docker
Desktop at `$HOME/.docker/desktop/log/`.
@y
また Docker Desktop 内の内部コンポーネントに対する追加ログが、`$HOME/.docker/desktop/log/` にもあります。
@z

@x
## Uninstall
@y
{: #uninstall }
## アンインストール
@z

@x
To remove Docker Desktop for Linux, run:
@y
Docker Desktop for Linux を削除するには、以下を実行します。
@z

@x
```console
$ sudo apt remove docker-desktop
```
@y
```console
$ sudo apt remove docker-desktop
```
@z

@x
## Known issues
@y
{: #known-issues }
## 既知の問題
@z

@x
 - The Docker CLI login flow has some inconsistencies that we are currently investigating. If you experience any issues when trying to log in, remove the `credsStore` property from `~/.docker/config.json` and restart Docker Desktop (run either
 `systemctl --user restart docker-desktop` or quit Docker Desktop and relaunch).
@y
 - The Docker CLI login flow has some inconsistencies that we are currently investigating. If you experience any issues when trying to log in, remove the `credsStore` property from `~/.docker/config.json` and restart Docker Desktop (run either
 `systemctl --user restart docker-desktop` or quit Docker Desktop and relaunch).
@z

@x
 - Docker Desktop stores the passwords in base-64 encoded plaintext. Integration with `pass` is currently a work in progress.
@y
 - Docker Desktop stores the passwords in base-64 encoded plaintext. Integration with `pass` is currently a work in progress.
@z

@x
 - After launching Docker Desktop, you must remove `~/.docker/scan/config.json` for `docker scan` to work.
@y
 - After launching Docker Desktop, you must remove `~/.docker/scan/config.json` for `docker scan` to work.
@z

@x
 - Dev Environments are not yet available.
@y
 - Dev Environments are not yet available.
@z

@x
 - At the end of the installation process, `apt` displays an error due to installing a downloaded package. You can ignore this error message.
@y
 - At the end of the installation process, `apt` displays an error due to installing a downloaded package. You can ignore this error message.
@z

@x
  ```
  N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
  ```
@y
  ```
  N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
  ```
@z

@x
## Why Docker Desktop for Linux runs a VM
@y
## Why Docker Desktop for Linux runs a VM
@z

@x
Docker Desktop for Linux runs a Virtual Machine (VM) for the following reasons:
@y
Docker Desktop for Linux runs a Virtual Machine (VM) for the following reasons:
@z

@x
1. **To ensure  that Docker Desktop provides a consistent experience across platforms**.
@y
1. **To ensure  that Docker Desktop provides a consistent experience across platforms**.
@z

@x
    During research, the most frequently cited reason for users wanting Docker
    Desktop for Linux (DD4L) was to ensure a consistent Docker Desktop
    experience with feature parity across all major operating systems. Utilizing
    a VM ensures that the Docker Desktop experience for Linux users will closely
    match that of Windows and macOS.
@y
    During research, the most frequently cited reason for users wanting Docker
    Desktop for Linux (DD4L) was to ensure a consistent Docker Desktop
    experience with feature parity across all major operating systems. Utilizing
    a VM ensures that the Docker Desktop experience for Linux users will closely
    match that of Windows and macOS.
@z

@x
    This need to deliver a consistent experience across all major OSs will become increasingly important as we look towards adding exciting new features, such as Docker Extensions, to Docker Desktop that will benefit users across all tiers.  We’ll provide more details on these at [DockerCon22](https://www.docker.com/dockercon/){: target="_blank" rel="noopener" class="_"}. Watch this space.
@y
    This need to deliver a consistent experience across all major OSs will become increasingly important as we look towards adding exciting new features, such as Docker Extensions, to Docker Desktop that will benefit users across all tiers.  We’ll provide more details on these at [DockerCon22](https://www.docker.com/dockercon/){: target="_blank" rel="noopener" class="_"}. Watch this space.
@z

@x
2. **To make use of new kernel features**
@y
2. **To make use of new kernel features**
@z

@x
    Sometimes we want to make use of new operating system features. Because we control the kernel and the OS inside the VM, we can roll these out to all users immediately, even to users who are intentionally sticking on an LTS version of their machine OS.
@y
    Sometimes we want to make use of new operating system features. Because we control the kernel and the OS inside the VM, we can roll these out to all users immediately, even to users who are intentionally sticking on an LTS version of their machine OS.
@z

@x
3. **To enhance security**
@y
3. **To enhance security**
@z

@x
    Container image vulnerabilities pose a security risk for the host environment. There is a large number of unofficial images that are not guaranteed to be verified for known vulnerabilities. Malicious users can push images to public registries and use different methods to trick users into pulling and running them. The VM approach mitigates this threat as any malware that gains root privileges is restricted to the VM environment without access to the host.
@y
    Container image vulnerabilities pose a security risk for the host environment. There is a large number of unofficial images that are not guaranteed to be verified for known vulnerabilities. Malicious users can push images to public registries and use different methods to trick users into pulling and running them. The VM approach mitigates this threat as any malware that gains root privileges is restricted to the VM environment without access to the host.
@z

@x
    Why not run rootless Docker? Although this has the benefit of superficially limiting access to the root user so everything looks safer in "top", it allows unprivileged users to gain `CAP_SYS_ADMIN` in their own user namespace and access kernel APIs which are not expecting to be used by unprivileged users, resulting in vulnerabilities like [this](https://www.openwall.com/lists/oss-security/2022/01/18/7){: target="_blank" rel="noopener" class="_"}.
@y
    Why not run rootless Docker? Although this has the benefit of superficially limiting access to the root user so everything looks safer in "top", it allows unprivileged users to gain `CAP_SYS_ADMIN` in their own user namespace and access kernel APIs which are not expecting to be used by unprivileged users, resulting in vulnerabilities like [this](https://www.openwall.com/lists/oss-security/2022/01/18/7){: target="_blank" rel="noopener" class="_"}.
@z

@x
4. **To provide the benefits of feature parity and enhanced security, with minimal impact on performance**
@y
4. **To provide the benefits of feature parity and enhanced security, with minimal impact on performance**
@z

@x
    The VM utilized by DD4L uses `virtiofs`, a shared file system that allows virtual machines to access a directory tree located on the host. Our internal benchmarking shows that with the right resource allocation to the VM, near native file system performance can be achieved with virtiofs.
@y
    The VM utilized by DD4L uses `virtiofs`, a shared file system that allows virtual machines to access a directory tree located on the host. Our internal benchmarking shows that with the right resource allocation to the VM, near native file system performance can be achieved with virtiofs.
@z

@x
    As such, we have adjusted the default memory available to the VM in DD4L. You can tweak this setting to your specific needs by using the **Memory** slider within the **Settings** > **Resources** tab of Docker Desktop.
@y
    As such, we have adjusted the default memory available to the VM in DD4L. You can tweak this setting to your specific needs by using the **Memory** slider within the **Settings** > **Resources** tab of Docker Desktop.
@z
