%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Linux (Beta)
keywords: docker, Desktop for linux, beta, tech preview
title: Docker Desktop for Linux (Beta)
---
@y
---
description: Docker Desktop for Linux (ベータ版)
keywords: docker, Desktop for linux, beta, tech preview
title: Docker Desktop for Linux (ベータ版)
---
@z

@x
Welcome to the Docker Desktop for Linux (Beta). The Beta program is aimed at early adopters who would like to try Docker Desktop for Linux and provide feedback.
@y
Docker Desktop for Linux（ベータ版）へようこそ。
このベータ版は、Docker Desktop for Linux をいち早く試したい方、フィードバックを提供して頂ける方に向けたものです。
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
Docker Desktop for Linux (Beta) is currently available on Ubuntu 21.04, 21.10
and Debian distributions.
@y
Docker Desktop for Linux（ベータ版）は今のところ Ubuntu 21.04, 21.10 および Debian において利用できます。
@z

@x
> **Note:**
>
> Docker Desktop is not supported in nested virtualization scenarios. We recommend that you run Docker Desktop for Linux natively on Ubuntu or Debian distributions.
@y
> **メモ**
>
> Docker Desktop は仮想環境がネストする状態をサポートしていません。
> Docker Desktop for Linux の実行は、ネイティブな Ubuntu または Debian の配布を利用することをお勧めします。
@z

@x
To install Docker Desktop for Linux:
@y
Docker Desktop for Linux をインストールするには以下のようにします。
@z

@x
1. Set up the [Docker repository](../../engine/install/ubuntu.md#install-using-the-repository).
2. Download and install the Debian package. If you have previously installed one of the preview releases, we recommend that you run `sudo apt remove docker-desktop`:
    ```console
    $ curl https://desktop-stage.docker.com/linux/main/amd64/77103/docker-desktop.deb --output docker-desktop.deb
    $ sudo apt install ./docker-desktop.deb
    ```
@y
1. [Docker リポジトリ](../../engine/install/ubuntu.md#install-using-the-repository) を設定します。
2. Debian パッケージをダウンロードしてインストールします。
   これまでにプレビュー版をインストールしている場合は、`sudo apt remove docker-desktop`を実行することをお勧めします。
    ```console
    $ curl https://desktop-stage.docker.com/linux/main/amd64/77103/docker-desktop.deb --output docker-desktop.deb
    $ sudo apt install ./docker-desktop.deb
    ```
@z

@x
  There are a few post-install configuration steps done through the maintainers' scripts (post-install script contained
  in the deb package.
@y
  メンテナースクリプトによって実施される、インストール後の設定手順がいくつかあります（deb パッケージにはインストール後のスクリプトが用意されています）。
@z

@x
  The post-install script:
@y
  インストール後のスクリプトは以下を行います。
@z

@x
  - sets the capability on the Docker Desktop binary to map privileged ports and set resource limits
  - adds a DNS name for Kubernetes to `/etc/hosts`
  - creates a link from `/usr/bin/docker` to `/usr/local/bin/com.docker.cli`
  - installs systemd units for each user
@y
  - Docker Desktop の実行ファイルに対して、特権ポートを割り当てリソース制限を設定するためのケーパビリティーを設定します。
  - Kubernetes に対する DNS 名を`/etc/hosts`に追加します。
  - `/usr/bin/docker`から`/usr/local/bin/com.docker.cli`へのリンクを生成します。
  - 各ユーザー向けに systemd ユニットをインストールします。
@z

@x
## Launch Docker Desktop
@y
{: #launch-docker-desktop }
## Docker Desktop の起動
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
When Docker Desktop starts, it creates a dedicated context that the Docker CLI
can use as a target and sets it as the current context in use. This is to avoid
a clash with a local Docker Engine that may be running on the Linux host and
using the default context. On shutdown, Docker Desktop resets the current
context to the previous one.
@y
Docker Desktop が起動すると、Docker CLI がターゲットとして利用する専用のコンテキストが生成され、カレントなコンテキストとして利用できる状態になります。
これは Linux ホスト上にローカルで Docker Engine が起動していて、デフォルトのコンテキストを用いている場合に、それとの衝突を避けるためです。
シャットダウンの際に Docker Desktop は現在のコンテキストをリセットして、元のものに戻します。
@z

@x
The Docker Desktop installer updates Docker Compose and the Docker CLI binaries
on the host. It installs Docker Compose V2 and gives users the choice to
link it as docker-compose from the Settings panel. Docker Desktop installs
the new Docker CLI binary that includes cloud-integration capabilities in `/usr/local/bin`
and creates a symlink to the classic Docker CLi at `/usr/local/bin/com.docker.cli`.
@y
Docker Desktop インストーラーは、ホスト上の Docker Compose と Docker CLI バイナリを更新します。
このときには Docker Compose V2 がインストールされます。
そしてこれを docker-compose にリンクするかどうかを Settings パネルから選択できるようになっています。
Docker Desktop のインストールによって、クラウド統合機能を含む新たな Docker CLI バイナリが`/usr/local/bin`にインストールされて、従来の Docker CLI は`/usr/local/bin/com.docker.cli`としてシンボリックリンクが生成されます。。
@z

@x
After you’ve successfully installed Docker Desktop, you can check the versions
of these binaries by running the following command:
@y
Docker Desktop のインストールを正常終了したら、以下のコマンドを実行して各バイナリのバージョンを確認します。
@z

@x
```console
$ docker compose version
Docker Compose version v2.2.3
@y
```console
$ docker compose version
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
## Credentials management
@y
## Credentials management
@z

@x
Docker Desktop relies on [`pass`](https://www.passwordstore.org/){: target="_blank" rel="noopener" class="_"} to store credentials in gpg2-encrypted files.
Before signing in to Docker Hub from the Docker Dashboard or the Docker menu, you must initialize `pass`.
Docker Desktop displays a warning if you've not initialized `pass`.
@y
Docker Desktop relies on [`pass`](https://www.passwordstore.org/){: target="_blank" rel="noopener" class="_"} to store credentials in gpg2-encrypted files.
Before signing in to Docker Hub from the Docker Dashboard or the Docker menu, you must initialize `pass`.
Docker Desktop displays a warning if you've not initialized `pass`.
@z

@x
You can intialize pass by using a gpg key. To generate a gpg key, run:
@y
You can intialize pass by using a gpg key. To generate a gpg key, run:
@z

@x
``` console
$ gpg --generate-key
...
GnuPG needs to construct a user ID to identify your key.

Real name: Molly
Email address: molly@example.com
You selected this USER-ID:
    "Molly <molly@example.com>"

Change (N)ame, (E)mail, or (O)kay/(Q)uit? O
...
pub   rsa3072 2022-03-31 [SC] [expires: 2024-03-30]
      7865BA9185AFA2C26C5B505669FC4F36530097C2
uid                      Molly <molly@example.com>
sub   rsa3072 2022-03-31 [E] [expires: 2024-03-30]
```
@y
``` console
$ gpg --generate-key
...
GnuPG needs to construct a user ID to identify your key.

Real name: Molly
Email address: molly@example.com
You selected this USER-ID:
    "Molly <molly@example.com>"

Change (N)ame, (E)mail, or (O)kay/(Q)uit? O
...
pub   rsa3072 2022-03-31 [SC] [expires: 2024-03-30]
      7865BA9185AFA2C26C5B505669FC4F36530097C2
uid                      Molly <molly@example.com>
sub   rsa3072 2022-03-31 [E] [expires: 2024-03-30]
```
@z

@x
To initialize `pass`, run:
@y
To initialize `pass`, run:
@z

@x
```console
molly@ubuntu:~$ pass init 7865BA9185AFA2C26C5B505669FC4F36530097C2
mkdir: created directory '/home/molly/.password-store/'
Password store initialized for 7865BA9185AFA2C26C5B505669FC4F36530097C2
```
@y
```console
molly@ubuntu:~$ pass init 7865BA9185AFA2C26C5B505669FC4F36530097C2
mkdir: created directory '/home/molly/.password-store/'
Password store initialized for 7865BA9185AFA2C26C5B505669FC4F36530097C2
```
@z

@x
Once `pass` is initialized, we can sign in on the Docker Dashboard and pull our private images.
@y
Once `pass` is initialized, we can sign in on the Docker Dashboard and pull our private images.
@z

@x
When credentials are used by the Docker CLI or Docker Desktop, a user prompt may pop up for the password you set during the gpg key generation.
@y
When credentials are used by the Docker CLI or Docker Desktop, a user prompt may pop up for the password you set during the gpg key generation.
@z

@x
```console
$ docker pull molly/privateimage
Using default tag: latest
latest: Pulling from molly/privateimage
3b9cc81c3203: Pull complete 
Digest: sha256:3c6b73ce467f04d4897d7a7439782721fd28ec9bf62ea2ad9e81a5fb7fb3ff96
Status: Downloaded newer image for molly/privateimage:latest
docker.io/molly/privateimage:latest
```
@y
```console
$ docker pull molly/privateimage
Using default tag: latest
latest: Pulling from molly/privateimage
3b9cc81c3203: Pull complete 
Digest: sha256:3c6b73ce467f04d4897d7a7439782721fd28ec9bf62ea2ad9e81a5fb7fb3ff96
Status: Downloaded newer image for molly/privateimage:latest
docker.io/molly/privateimage:latest
```
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
Thanks for trying out the Docker Desktop Linux (beta) release. We'd love to hear from you. You can provide feedback and report any bugs through the **Issues** tracker within the [docker/desktop-linux](https://github.com/docker/desktop-linux/issues){: target="_blank" rel="noopener" class="_"} repository.
@y
Thanks for trying out the Docker Desktop Linux (beta) release. We'd love to hear from you. You can provide feedback and report any bugs through the **Issues** tracker within the [docker/desktop-linux](https://github.com/docker/desktop-linux/issues){: target="_blank" rel="noopener" class="_"} repository.
@z

@x
To create and upload a diagnostics bundle with your bug report:
@y
バグ報告を行う診断バンドル（diagnostics bundle）を生成して更新するには、以下を行います。
@z

@x
1. From the Docker menu, select **Troubleshoot** > **Get support**.
2. When the diagnostics are available, click **Upload to get a Diagnostic ID**.
3. Make a note of the Diagnostic ID displayed on the Support page. You can send
   this ID with your bug report to investigate any issues. Wait for a bundle to
   be generated, once uploaded, it displays a diagnostics ID that can be sent to
   us for investigation.
@y
1. Docker メニューから **Troubleshoot** > **Get support** を選びます。
2. 診断機能が利用可能であれば **Upload to get a Diagnostic ID** をクリックします。
3. サポートページ上に表示される Diagnostic ID を書き留めておきます。
   何かの問題を調査する際には、この ID を含めてバグ報告を送信します。
   その後にバンドルのアップロードと生成を待つと、診断 ID（diagnostics ID）が表示されるので、調査が必要な場合にはこれを送信します。
@z

@x
## Logs
@y
{: #logs }
## ログ
@z

@x
If you prefer to investigate issues yourself, you can access Docker Desktop logs by running the following command:
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
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@y
For a complete cleanup, remove configuration and data files at `$HOME/.docker/desktop`, the symlink at `/usr/local/bin/com.docker.cli`, and purge
the remaining systemd service files.
@z

@x
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
$ sudo apt purge docker-desktop
```
@y
```console
$ rm -r $HOME/.docker/desktop
$ sudo rm /usr/local/bin/com.docker.cli
$ sudo apt purge docker-desktop
```
@z

@x
## Known issue
@y
{: #known-issue }
## 既知の問題
@z

@x
At the end of the installation process, `apt` displays an error due to installing a downloaded package. You can ignore this error message.
@y
インストールの終盤において、`apt`がダウンロードパッケージのインストールに関するエラーを表示します。
このエラーメッセージは無視してください。
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
If you have installed one of the previous releases and reinstall the new package over it (as opposed to removing the old package explicitly), you need to make sure that `~/.config/systemd/user/docker-desktop.service` and `~/.local/share/systemd/user/docker-desktop.service` are removed.
@y
それまでのリリース版をインストールしていて、（明示的にその古い版を削除することなく）そこに新しいパッケージを再インストールする場合は`~/.config/systemd/user/docker-desktop.service`と`~/.local/share/systemd/user/docker-desktop.service`を削除する必要があります。
@z

@x
## Why Docker Desktop for Linux runs a VM
@y
{: #why-docker-desktop-for-linux-runs-a-vm }
## Docker Desktop for Linux はなぜ VM を起動するのか
@z

@x
Docker Desktop for Linux runs a Virtual Machine (VM) for the following reasons:
@y
Docker Desktop for Linux が仮想マシン（Virtual Machine; VM）を実行するのは、以下の理由によります。
@z

@x
1. **To ensure that Docker Desktop provides a consistent experience across platforms**.
@y
1. **Docker Desktop が多くのプラットフォームにわたって安定した機能を提供するためです**。
@z

@x
    During research, the most frequently cited reason for users wanting Docker
    Desktop for Linux (DD4L) was to ensure a consistent Docker Desktop
    experience with feature parity across all major operating systems. Utilizing
    a VM ensures that the Docker Desktop experience for Linux users will closely
    match that of Windows and macOS.
@y
    調査の結果、Docker Desktop for Linux (DD4L) を利用したい理由として、もっとも多く寄せられたものは、多くのメジャーオペレーティングシステムにおいて、安定した同一の機能を実現してほしいというものでした。
    VM を利用すれば Linux ユーザーが実現する Docker Desktop は、Windows や macOS と限りなく同じものとなります。
@z

@x
    This need to deliver a consistent experience across all major OSs will become increasingly important as we look towards adding exciting new features, such as Docker Extensions, to Docker Desktop that will benefit users across all tiers.  We’ll provide more details on these at [DockerCon22](https://www.docker.com/dockercon/){: target="_blank" rel="noopener" class="_"}. Watch this space.
@y
    このようにあらゆるメジャー OS にわたって一貫した機能を提供することは、ますます重要になっています。
    Docker Desktop では、Docker Extensions などのような魅力ある新機能の追加を目指しており、どのようなユーザーに対してもメリットとなるはずです。
    この部分については [DockerCon22](https://www.docker.com/dockercon/){: target="_blank" rel="noopener" class="_"} において詳細を提供しています。
    そちらへの参加をお願いします。
@z

@x
2. **To make use of new kernel features**
@y
2. **カーネルの新しい機能を活用するためです**。
@z

@x
    Sometimes we want to make use of new operating system features. Because we control the kernel and the OS inside the VM, we can roll these out to all users immediately, even to users who are intentionally sticking on an LTS version of their machine OS.
@y
    オペレーティングシステムの新機能は利用したくなるものです。
    カーネルや OS は VM の中で制御することができるので、あらゆるユーザーに即座に公開することができます。
    マシン OS に LTS バージョンの利用が必須であるユーザーであっても、同じです。
@z

@x
3. **To enhance security**
@y
3. **セキュリティを拡充するためです**。
@z

@x
    Container image vulnerabilities pose a security risk for the host environment. There is a large number of unofficial images that are not guaranteed to be verified for known vulnerabilities. Malicious users can push images to public registries and use different methods to trick users into pulling and running them. The VM approach mitigates this threat as any malware that gains root privileges is restricted to the VM environment without access to the host.
@y
    コンテナーイメージにぜい弱性があると、ホスト環境にセキュリティリスクをもたらします。
    既知のぜい弱性を検証していることが保証されていない非公式なイメージというものは、数多く存在します。
    悪意のあるユーザーが公開リポジトリにイメージをプッシュして、あらゆる方法を駆使して、そのイメージをプルさせて実行させようとします。
    VM を用いるこの方法では、そういった脅威を軽減できます。
    VM 環境ではホストにアクセスすることはできないため、マルウェアが root 権限を奪取するには制限があるためです。
@z

@x
    Why not run rootless Docker? Although this has the benefit of superficially limiting access to the root user so everything looks safer in "top", it allows unprivileged users to gain `CAP_SYS_ADMIN` in their own user namespace and access kernel APIs which are not expecting to be used by unprivileged users, resulting in vulnerabilities like [this](https://www.openwall.com/lists/oss-security/2022/01/18/7){: target="_blank" rel="noopener" class="_"}.
@y
    rootless Docker を実行しますか？
    この方法ではたしかに、root ユーザーへのアクセスを表面的に制限して、「最上位」のものがすべて安全に見えるというメリットがあります。
    ただしその際には、非特権ユーザーが自身の名前空間内で`CAP_SYS_ADMIN`を取得するものであり、本来は非特権ユーザーからの利用を想定していないカーネル API へのアクセスを可能としています。
    これは [ここ](https://www.openwall.com/lists/oss-security/2022/01/18/7){: target="_blank" rel="noopener" class="_"} に示されるようなぜい弱性を生み出すことになります。
@z

@x
4. **To provide the benefits of feature parity and enhanced security, with minimal impact on performance**
@y
4. **パフォーマンスへの影響を最小限に抑えながら、機能の同等性とセキュリティの拡充を図るためです**。
@z

@x
    The VM utilized by DD4L uses `virtiofs`, a shared file system that allows virtual machines to access a directory tree located on the host. Our internal benchmarking shows that with the right resource allocation to the VM, near native file system performance can be achieved with virtiofs.
@y
    DD4L が利用する VM では`virtiofs`が用いられます。
    これは共有ファイルシステムであって、ホスト上にあるディレクトリツリーに対して、仮想マシンがアクセスすることを可能にします。
    ベンチマークの内部調査では、VM に対してリソース割り当てが適切であれば、virtiofs はネイティブなファイルシステムと変わらないパフォーマンスを実現しています。
@z

@x
    As such, we have adjusted the default memory available to the VM in DD4L. You can tweak this setting to your specific needs by using the **Memory** slider within the **Settings** > **Resources** tab of Docker Desktop.
@y
    このことから DD4L では VM に対して割り当てるデフォルトメモリを調整しています。
    この設定は Docker Desktop の **Settings** > **Resources** タブにある **Memory** スライダーを使えば、調整することができます。
@z
