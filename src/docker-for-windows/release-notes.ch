%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Change log / release notes per stable release
keywords: Docker Desktop for Windows, stable, release notes
redirect_from:
- /winkit/release-notes/
title: Docker Desktop for Windows Stable Release notes
toc_min: 1
toc_max: 2
---
@y
---
description: 安定版リリースの変更履歴、リリースノート。
keywords: Docker Desktop for Windows, stable, release notes
redirect_from:
- /winkit/release-notes/
title: Docker Desktop for Windows 安定版リリースノート
toc_min: 1
toc_max: 2
---
@z

@x
This page contains information about the new features, improvements, known issues, and bug fixes in Docker Desktop Stable releases.
@y
{% comment %}
This page contains information about the new features, improvements, known issues, and bug fixes in Docker Desktop Stable releases.
{% endcomment %}
このページでは Docker Desktop リリースにおける新機能、更新状況、既知の不具合、バグフィックスといった情報を示します。
@z

@x
For information about Edge releases, see the [Edge release notes](edge-release-notes.md). For Docker Desktop system requirements, see
[What to know before you install](install.md#what-to-know-before-you-install).
@y
{% comment %}
For information about Edge releases, see the [Edge release notes](edge-release-notes.md). For Docker Desktop system requirements, see
[What to know before you install](install.md#what-to-know-before-you-install).
{% endcomment %}
最新版（Edge）リリースについての情報は [最新版リリースノート](edge-release-notes.md) を参照してください。
Docker Desktop のシステム要件については [インストール前に確認すべきこと](install.md#what-to-know-before-you-install) を参照してください。
@z

@x
## Docker Desktop Community 2.5.0.0
2020-11-02
@y
## Docker Desktop Community 2.5.0.0
2020-11-02
@z

@x
> [Download](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
@y
{% comment %}
> [Download](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
{% endcomment %}
> [ダウンロード](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
@z

@x
Docker Desktop 2.5.0.0 contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after installing this version.
@y
{% comment %}
Docker Desktop 2.5.0.0 contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after installing this version.
{% endcomment %}
Docker Desktop 2.5.0.0 には Kubernetes のアップグレードが含まれます。
本バージョンのインストール後は、ローカルの Kubernetes クラスターはリセットされます。
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new }
### 新機能
@z

@x
- Users subscribed to a Pro or a Team plan can now see the vulnerability scan report on the Remote repositories tab in Docker Desktop.
- Docker Desktop introduces a support option for users who have subscribed to a Pro or a Team Plan.
@y
{% comment %}
- Users subscribed to a Pro or a Team plan can now see the vulnerability scan report on the Remote repositories tab in Docker Desktop.
- Docker Desktop introduces a support option for users who have subscribed to a Pro or a Team Plan.
{% endcomment %}
- プロプランまたはチームプランを購入しているユーザーは、Docker Desktop 上の Remote repositories タブ上から、ぜい弱性スキャン報告を参照できるようになりました。
- Docker Desktop では、プロプランまたはチームプランを購入しているユーザー向けのサポートオプションを導入しました。
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades }
### アップグレード
@z

@x
- [Linux kernel 5.4.39](https://hub.docker.com/layers/linuxkit/kernel/5.4.39-f39f83d0d475b274938c86eaa796022bfc7063d2/images/sha256-8614670219aca0bb276d4749e479591b60cd348abc770ac9ecd09ee4c1575405?context=explore)
- [Docker Compose CLI 1.0.1](https://github.com/docker/compose-cli/releases/tag/v1.0.1)
- [Snyk v1.421.1](https://github.com/snyk/snyk/releases/tag/v1.421.1)
- [Go 1.15.2](https://github.com/golang/go/releases/tag/go1.15.2)
- [Kubernetes 1.19.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.3)
@y
- [Linux kernel 5.4.39](https://hub.docker.com/layers/linuxkit/kernel/5.4.39-f39f83d0d475b274938c86eaa796022bfc7063d2/images/sha256-8614670219aca0bb276d4749e479591b60cd348abc770ac9ecd09ee4c1575405?context=explore)
- [Docker Compose CLI 1.0.1](https://github.com/docker/compose-cli/releases/tag/v1.0.1)
- [Snyk v1.421.1](https://github.com/snyk/snyk/releases/tag/v1.421.1)
- [Go 1.15.2](https://github.com/golang/go/releases/tag/go1.15.2)
- [Kubernetes 1.19.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.3)
@z

@x
### Deprecation
@y
{% comment %}
### Deprecation
{% endcomment %}
{: #deprecation }
### 非推奨
@z

@x
- Docker Desktop cannot be installed on Windows 1703 (build 15063) anymore.
@y
{% comment %}
- Docker Desktop cannot be installed on Windows 1703 (build 15063) anymore.
{% endcomment %}
- Docker Desktop は Windows 1703 (build 15063) にはインストールできなくなりました。
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Renamed 'Run Diagnostics' to 'Get support'.
- Fixed an issue that intermittently made the WSL 2 backend fail to start.
- Fixed an issue related to NFS mounting. See [docker/for-mac#4958](https://github.com/docker/for-mac/issues/4958).
- Fixed an issue where bash in WSL would not find the docker CLI when it is started before Docker Desktop.
- Fixed an issue with HTTP proxy exclude lists containing entries such as `localhost` or `127.0.0.1`. Fixes [docker/for-win#8750](https://github.com/docker/for-win/issues/8750).
- When the WSL integration process unexpectedly stops, the user is now notified and can decide to restart it or not, instead of always trying to restart it in a loop. fixes [docker/for-win#8968](https://github.com/docker/for-win/issues/8968).
- Fixed an issue related to container logs lagging under heavy load. Fixes [docker/for-win#8216](https://github.com/docker/for-win/issues/8216).
- Diagnostics: avoid hanging when Kubernetes is in a broken state.
- Fixed the path to the installer log file default location when the username contains a space. Fixes [docker/for-win#7941](https://github.com/docker/for-win/issues/7941).
- Fixed an issue where some network plugins may fail to load, provoking a crash of the Docker daemon [docker/for-win#9282](https://github.com/docker/for-win/issues/9282).
- When sharing a file into a container (e.g. `docker run -v ~/.gitconfig`) Docker Desktop does not watch the parent directory. Fixes [docker/for-mac#4981](https://github.com/docker/for-mac/issues/4981).
@y
{% comment %}
- Renamed 'Run Diagnostics' to 'Get support'.
- Fixed an issue that intermittently made the WSL 2 backend fail to start.
- Fixed an issue related to NFS mounting. See [docker/for-mac#4958](https://github.com/docker/for-mac/issues/4958).
- Fixed an issue where bash in WSL would not find the docker CLI when it is started before Docker Desktop.
- Fixed an issue with HTTP proxy exclude lists containing entries such as `localhost` or `127.0.0.1`. Fixes [docker/for-win#8750](https://github.com/docker/for-win/issues/8750).
- When the WSL integration process unexpectedly stops, the user is now notified and can decide to restart it or not, instead of always trying to restart it in a loop. fixes [docker/for-win#8968](https://github.com/docker/for-win/issues/8968).
- Fixed an issue related to container logs lagging under heavy load. Fixes [docker/for-win#8216](https://github.com/docker/for-win/issues/8216).
- Diagnostics: avoid hanging when Kubernetes is in a broken state.
- Fixed the path to the installer log file default location when the username contains a space. Fixes [docker/for-win#7941](https://github.com/docker/for-win/issues/7941).
- Fixed an issue where some network plugins may fail to load, provoking a crash of the Docker daemon [docker/for-win#9282](https://github.com/docker/for-win/issues/9282).
- When sharing a file into a container (e.g. `docker run -v ~/.gitconfig`) Docker Desktop does not watch the parent directory. Fixes [docker/for-mac#4981](https://github.com/docker/for-mac/issues/4981).
{% endcomment %}
- 「Run Diagnostics」を「Get support」に名称変更しました。
- 断続的に WSL 2 バックエンドが起動に失敗する問題を修正しました。
- NFS マウントに関する問題を修正しました。[docker/for-mac#4958](https://github.com/docker/for-mac/issues/4958) を Fix に。
- Docker Desktop の起動前に実行した WSL 内の bash が、Docker CLI を見つけ出せない問題を修正しました。
- HTTP プロキシーの除外リストに`localhost`や`127.0.0.1`が含まれる場合の問題を修正しました。[docker/for-win#8750](https://github.com/docker/for-win/issues/8750) を Fix に。
- WSL 統合環境での処理が突然停止した際には、ユーザーへの通知が行われて、再起動するかどうかを指定できるようにしました。それまでは再起動ループを繰り返していました。[docker/for-win#8968](https://github.com/docker/for-win/issues/8968) を Fix に。
- 高負荷時にコンテナーログが遅延する問題を修正しました。[docker/for-win#8216](https://github.com/docker/for-win/issues/8216) を Fix に。
- 診断処理: Kubernetes が破損状態にあるときの処理停止を回避しました。
- ユーザー名にスペース文字を含む場合に、インストーラーログファイルのデフォルトディレクトリへのパスを修正しました。
  [docker/for-win#7941](https://github.com/docker/for-win/issues/7941) を Fix にしました。
- ネットワークプラグインにおいて、ロードに失敗し Docker デーモンをクラッシュさせる場合があったのを修正しました。[docker/for-win#9282](https://github.com/docker/for-win/issues/9282)
- コンテナー内にファイル共有（たとえば`docker run -v ~/.gitconfig`）を行っている場合に、Docker Desktop が親ディレクトリを監視しないようにしました。[docker/for-mac#4981](https://github.com/docker/for-mac/issues/4981) を Fix に。
@z

@x
## Docker Desktop Community 2.4.0.0
2020-09-30
@y
## Docker Desktop Community 2.4.0.0
2020-09-30
@z

@x
> [Download](https://desktop.docker.com/win/stable/48506/Docker%20Desktop%20Installer.exe)
@y
{% comment %}
> [Download](https://desktop.docker.com/win/stable/48506/Docker%20Desktop%20Installer.exe)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/win/stable/48506/Docker%20Desktop%20Installer.exe)
@z

@x
Docker Desktop 2.4.0.0 contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after installing this version.
@y
{% comment %}
Docker Desktop 2.4.0.0 contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after installing this version.
{% endcomment %}
Docker Desktop 2.4.0.0 には Kubernetes アップグレードが含まれます。
ローカルに Kubernetes クラスターがある場合は、このバージョンをインストールした後にリセットされます。
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-1 }
### 新機能
@z

@x
- [Docker Compose CLI - 0.1.18](https://github.com/docker/compose-cli), enabling use of volumes with Compose and the Cloud through ECS and ACI.
- Docker introduces the new Images view in the Docker Dashboard. The images view allows users to view the Hub images, pull them and manage their local images on disk including cleaning up unwanted and unused images. To access the new Images view, from the Docker menu, select **Dashboard** > **Images**.
- Docker Desktop now enables BuildKit by default after a reset to factory defaults. To revert to the old `docker build` experience, go to **Preferences** > **Docker Engine** and then disable the BuildKit feature.
- [Amazon ECR Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.4.0)
@y
{% comment %}
- [Docker Compose CLI - 0.1.18](https://github.com/docker/compose-cli), enabling use of volumes with Compose and the Cloud through ECS and ACI.
- Docker introduces the new Images view in the Docker Dashboard. The images view allows users to view the Hub images, pull them and manage their local images on disk including cleaning up unwanted and unused images. To access the new Images view, from the Docker menu, select **Dashboard** > **Images**.
- Docker Desktop now enables BuildKit by default after a reset to factory defaults. To revert to the old `docker build` experience, go to **Preferences** > **Docker Engine** and then disable the BuildKit feature.
- [Amazon ECR Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.4.0)
{% endcomment %}
- [Docker Compose CLI - 0.1.18](https://github.com/docker/compose-cli), ECS と ACI を通じて Compose とクラウドのボリューム利用が可能になりました。
- Docker ダッシュボードに、新たに Images 画面が導入されました。
  Images 画面では Docker Hub イメージの参照、そのプル、ディスク上のローカルイメージ管理が可能になります。
  また不要で未使用のイメージの削除もできます。
  この新たな Images 画面にアクセスするには Docker メニューから **Dashboard** > **Images** を実行します。
- Docker Desktop ではデフォルトにリセットした後に、BuildKit をデフォルト有効にしました。
  それまでの古い`docker build`に切り替えるには、**Preferences** > **Docker Engine** にアクセスして BuildKit 機能を無効化します。
- [Amazon ECR Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.4.0)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-1 }
### アップグレード
@z

@x
- [Docker 19.03.13](https://github.com/docker/docker-ce/releases/tag/v19.03.13)
- [Docker Compose 1.27.4](https://github.com/docker/compose/releases/tag/1.27.4)
- [Go 1.14.7](https://github.com/golang/go/releases/tag/go1.14.7)
- [Alpine 3.12](https://alpinelinux.org/posts/Alpine-3.12.0-released.html)
- [Kubernetes 1.18.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.8)
- [Qemu 4.2.0](https://git.qemu.org/?p=qemu.git;a=tag;h=1e4aa2dad329852aa6c3f59cefd65c2c2ef2062c)
@y
- [Docker 19.03.13](https://github.com/docker/docker-ce/releases/tag/v19.03.13)
- [Docker Compose 1.27.4](https://github.com/docker/compose/releases/tag/1.27.4)
- [Go 1.14.7](https://github.com/golang/go/releases/tag/go1.14.7)
- [Alpine 3.12](https://alpinelinux.org/posts/Alpine-3.12.0-released.html)
- [Kubernetes 1.18.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.8)
- [Qemu 4.2.0](https://git.qemu.org/?p=qemu.git;a=tag;h=1e4aa2dad329852aa6c3f59cefd65c2c2ef2062c)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-1 }
### バグフィックスとマイナーチェンジ
@z

@x
- Removed the legacy Kubernetes context `docker-for-desktop`. The context `docker-desktop` should be used instead. Fixes [docker/for-win#5089](https://github.com/docker/for-win/issues/5089) and [docker/for-mac#4089](https://github.com/docker/for-mac/issues/4089).
- Removed the option to start with Windows containers from the installer
- Pinning the application to the taskbar and clicking on it will launch the container view if Docker is already running.
- Left-clicking on the whale in the system tray now launches the dashboard container view.
- Docker Desktop now uses a different systray icon for dark and light mode. Fixes [docker/for-win#4113](https://github.com/docker/for-win/issues/4113).
- Added support for emulating Risc-V via Qemu 4.2.0.
- Added a low-level debug shell accessible via `putty -serial \\.\pipe\dockerDebugShell`.
- Copy container logs without ansi colors to clipboard. Fixes [docker/for-mac#4786](https://github.com/docker/for-mac/issues/4786).
- Fix application startup if `hosts` is specified inside the Docker `daemon.json`. See [docker/for-win#6895](https://github.com/docker/for-win/issues/6895#issuecomment-637429117)
- Fixed DNS resolution of short names. See [docker/for-win#4425](https://github.com/docker/for-win/issues/4425).
- Switched from `chronyd` to `sntpcd` to work around host time synchronisation problems. Fixes [docker/for-win#4526](https://github.com/docker/for-win/issues/4526).
- Avoid blocking startup if "Expose daemon on tcp://localhost:2375 without TLS" is set and `localhost:2375` is in use by another program. See [docker/for-win#6929](https://github.com/docker/for-win/issues/6929) [docker/for-win#6961](https://github.com/docker/for-win/issues/6961).
- Fixed an issue where adding a folder on a non-existing drive in the settings would create an empty entry. See [docker/for-win#6797](https://github.com/docker/for-win/issues/6797).
- Avoid failing with "Function not implemented" during file I/O on shared volumes. Fixes [docker/for-win#5955](https://github.com/docker/for-win/issues/5955)
- Ensure that `docker run -v /var/run/docker.sock` rewrites Windows paths properly, see [docker/for-win#6628](https://github.com/docker/for-win/issues/6628).
- Fixed a crash which occurred when Docker Desktop loads a corrupted Docker CLI configuration file. Fixes [docker/for-win#6657](https://github.com/docker/for-win/issues/6657).
- Ensure `localhost` and `127.0.0.1` can both be used in the proxy settings to redirect to a proxy on the host. Fixes [docker/for-win#5715](https://github.com/docker/for-win/issues/5715) and [docker/for-win#6260](https://github.com/docker/for-win/issues/6260).
- Fixed a crash when failing to login with no Internet connection.
- Fixed bug in handling shared volume paths with ".." characters. Fixes [docker/for-win#5375](https://github.com/docker/for-win/issues/5375).
- Report check for updates errors in toast notification. Fixes [docker/for-win#6364](https://github.com/docker/for-win/issues/6364).
- Fixed an upgrade bug where users on versions still using the PowerShell based VM management can experience a silent un-installation crash leading to Docker Desktop being uninstalled instead of upgraded.
- Fixed the path to the installer log file default location when the username contains a space. Fixes [docker/for-win#7941](https://github.com/docker/for-win/issues/7941).
- Docker Desktop always flushes filesystem caches synchronously on container start. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).
@y
{% comment %}
- Removed the legacy Kubernetes context `docker-for-desktop`. The context `docker-desktop` should be used instead. Fixes [docker/for-win#5089](https://github.com/docker/for-win/issues/5089) and [docker/for-mac#4089](https://github.com/docker/for-mac/issues/4089).
- Removed the option to start with Windows containers from the installer
- Pinning the application to the taskbar and clicking on it will launch the container view if Docker is already running.
- Left-clicking on the whale in the system tray now launches the dashboard container view.
- Docker Desktop now uses a different systray icon for dark and light mode. Fixes [docker/for-win#4113](https://github.com/docker/for-win/issues/4113).
- Added support for emulating Risc-V via Qemu 4.2.0.
- Added a low-level debug shell accessible via `putty -serial \\.\pipe\dockerDebugShell`.
- Copy container logs without ansi colors to clipboard. Fixes [docker/for-mac#4786](https://github.com/docker/for-mac/issues/4786).
- Fix application startup if `hosts` is specified inside the Docker `daemon.json`. See [docker/for-win#6895](https://github.com/docker/for-win/issues/6895#issuecomment-637429117)
- Fixed DNS resolution of short names. See [docker/for-win#4425](https://github.com/docker/for-win/issues/4425).
- Switched from `chronyd` to `sntpcd` to work around host time synchronisation problems. Fixes [docker/for-win#4526](https://github.com/docker/for-win/issues/4526).
- Avoid blocking startup if "Expose daemon on tcp://localhost:2375 without TLS" is set and `localhost:2375` is in use by another program. See [docker/for-win#6929](https://github.com/docker/for-win/issues/6929) [docker/for-win#6961](https://github.com/docker/for-win/issues/6961).
- Fixed an issue where adding a folder on a non-existing drive in the settings would create an empty entry. See [docker/for-win#6797](https://github.com/docker/for-win/issues/6797).
- Avoid failing with "Function not implemented" during file I/O on shared volumes. Fixes [docker/for-win#5955](https://github.com/docker/for-win/issues/5955)
- Ensure that `docker run -v /var/run/docker.sock` rewrites Windows paths properly, see [docker/for-win#6628](https://github.com/docker/for-win/issues/6628).
- Fixed a crash which occurred when Docker Desktop loads a corrupted Docker CLI configuration file. Fixes [docker/for-win#6657](https://github.com/docker/for-win/issues/6657).
- Ensure `localhost` and `127.0.0.1` can both be used in the proxy settings to redirect to a proxy on the host. Fixes [docker/for-win#5715](https://github.com/docker/for-win/issues/5715) and [docker/for-win#6260](https://github.com/docker/for-win/issues/6260).
- Fixed a crash when failing to login with no Internet connection.
- Fixed bug in handling shared volume paths with ".." characters. Fixes [docker/for-win#5375](https://github.com/docker/for-win/issues/5375).
- Report check for updates errors in toast notification. Fixes [docker/for-win#6364](https://github.com/docker/for-win/issues/6364).
- Fixed an upgrade bug where users on versions still using the PowerShell based VM management can experience a silent un-installation crash leading to Docker Desktop being uninstalled instead of upgraded.
- Fixed the path to the installer log file default location when the username contains a space. Fixes [docker/for-win#7941](https://github.com/docker/for-win/issues/7941).
- Docker Desktop always flushes filesystem caches synchronously on container start. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).
{% endcomment %}
- かつての Kubernetes コンテキスト`docker-for-desktop`は削除しました。
  代わりにコンテキスト`docker-desktop`を利用してください。
  [docker/for-win#5089](https://github.com/docker/for-win/issues/5089) と [docker/for-mac#4089](https://github.com/docker/for-mac/issues/5089) を Fix にしました。
- Windows コンテナーを使って起動するオプションは、インストーラーから削除しました。
- Docker を実行している状態でアプリケーションをタスクバーに固定してクリックすると、コンテナー画面が起動されます。
- システムトレイ上のクジラアイコン上で左クリックすると、Dashboard コンテナー画面を起動するようにしました。
- Docker Desktop ではダークモード、ライトモード用に異なるシステムトレイアイコンを利用することにしました。
  [docker/for-win#4113](https://github.com/docker/for-win/issues/4113) を Fix にしました。
- Qemu 4.2.0 を通じて Risc-V エミュレーションのサポートを追加しました。
- `putty -serial \\.\pipe\dockerDebugShell`の実行を通じて低レベルデバッグシェルへのアクセスを追加しました。
- コンテナーログをクリップボードにコピーする際に ansi color を除きました。
  [docker/for-mac#4786](https://github.com/docker/for-mac/issues/4786) を Fix にしました。
- `hosts`が Docker の`daemon.json`内部にて指定されている場合のアプリケーション起動を修正しました。
  [docker/for-win#6895](https://github.com/docker/for-win/issues/6895#issuecomment-637429117) を参照してください。
- 短い名前に対する DNS 解決を修正しました。
  [docker/for-win#4425](https://github.com/docker/for-win/issues/4425) を Fix にしました。
- ホスト時刻の同期問題を解決するため、`chronyd`を`sntpcd`に変更しました。
  [docker/for-win#4526](https://github.com/docker/for-win/issues/4526) を Fix にしました。
- "Expose daemon on tcp://localhost:2375 without TLS" が設定されていて`localhost:2375`が他プログラムにて利用中の場合に、起動がブロックされるのを回避しました。
  [docker/for-win#6929](https://github.com/docker/for-win/issues/6929)、[docker/for-win#6961](https://github.com/docker/for-win/issues/6961) を参照してください。
- Settings 上において存在しないドライブにフォルダーを追加した際の問題を修正しました。
  これを行うと空の項目が生成されていました。
  [docker/for-win#6797](https://github.com/docker/for-win/issues/6797) を参照してください。
- 共有ボリューム上のファイル I/O の最中に「Function not implemented」により失敗することを回避しました。
  [docker/for-win#5955](https://github.com/docker/for-win/issues/5955) を Fix にしました。
- `docker run -v /var/run/docker.sock`が Windows パスを適切に再書き込みするようにしました。
  [docker/for-win#6628](https://github.com/docker/for-win/issues/6628) を参照してください。
- Docker Desktop が誤った Docker CLI 設定ファイルを読み込んだときに発生するクラッシュを修正しました。
  [docker/for-win#6657](https://github.com/docker/for-win/issues/6657) を Fix にしました。
- プロキシー設定において`localhost`と`127.0.0.1`を用いた場合に、ホスト上のプロキシーに正しくリダイレクトされるようにしました。
  [docker/for-win#5715](https://github.com/docker/for-win/issues/5715) と [docker/for-win#6260](https://github.com/docker/for-win/issues/6260) を Fix にしました。
- インターネット接続がない状態でログインに失敗する際のクラッシュを修正しました。
- 共有ボリュームのパスでの文字列「..」の取り扱いに関するバグを修正しました。
  [docker/for-win#5375](https://github.com/docker/for-win/issues/5375) を Fix にしました。
- トースト通知（toast notification）における更新エラーのチェックを報告するようにしました。
  [docker/for-win#6364](https://github.com/docker/for-win/issues/6364) を Fix にしました。
- Docker Desktop のアップグレード時に、PowerShell ベースの VM 管理を行っていたユーザーが、何も表示されずにインストールに失敗して、アップグレードされることなくアンインストールされてしまうバグを修正しました。
- ユーザー名にスペース文字を含む場合に、インストーラーログファイルのデフォルトディレクトリへのパスを修正しました。
  [docker/for-win#7941](https://github.com/docker/for-win/issues/7941) を Fix にしました。
- Docker Desktop では、コンテナー起動時に常にファイルシステムキャッシュを同期して書き出すようにしました。
  [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943) を参照してください。
@z

@x
### WSL 2 changes
@y
{% comment %}
### WSL 2 changes
{% endcomment %}
{: #wsl-2-changes }
### WSL 2 の変更
@z

@x
- Docker contexts are now synced between Windows and WSL distros.
- Fixed an issue that intermittently causes the backend to fail to start.
- Fixed a proxy crash that happened when glibc was not compatible. See [docker/for-win#8183](https://github.com/docker/for-win/issues/8183).
- Fixed an issue when removing a container mounting `/mnt/wsl` would break WSL integration. See [docker/for-win#7836](https://github.com/docker/for-win/issues/7836).
- Added support for mounting files from a distro using the Windows CLI (e.g. `docker run -v \\wsl$\Ubuntu\home\simon\web:/web ...`)
- Fixed the error message when attempting to use a shared volume with a relative path. Fixes [docker/for-win#6894](https://github.com/docker/for-win/issues/6894).
- Fixed an issue when updating Windows to a WSL 2 capable version, where a configuration file is locked by the old Hyper-V VM.
- Fixed a discrepancy in the version of Docker Compose inside and outside of WSL 2. Fixes [docker/for-win#6461](https://github.com/docker/for-win/issues/6461).
- Detect when the `docker-desktop` wsl distro is stopped and display a clearer error message.
- Fix a race condition when exposing ports.
- Enable dialog no longer blocks other windows.
@y
{% comment %}
- Docker contexts are now synced between Windows and WSL distros.
- Fixed an issue that intermittently causes the backend to fail to start.
- Fixed a proxy crash that happened when glibc was not compatible. See [docker/for-win#8183](https://github.com/docker/for-win/issues/8183).
- Fixed an issue when removing a container mounting `/mnt/wsl` would break WSL integration. See [docker/for-win#7836](https://github.com/docker/for-win/issues/7836).
- Added support for mounting files from a distro using the Windows CLI (e.g. `docker run -v \\wsl$\Ubuntu\home\simon\web:/web ...`)
- Fixed the error message when attempting to use a shared volume with a relative path. Fixes [docker/for-win#6894](https://github.com/docker/for-win/issues/6894).
- Fixed an issue when updating Windows to a WSL 2 capable version, where a configuration file is locked by the old Hyper-V VM.
- Fixed a discrepancy in the version of Docker Compose inside and outside of WSL 2. Fixes [docker/for-win#6461](https://github.com/docker/for-win/issues/6461).
- Detect when the `docker-desktop` wsl distro is stopped and display a clearer error message.
- Fix a race condition when exposing ports.
- Enable dialog no longer blocks other windows.
{% endcomment %}
- Docker コンテキストを Windows と WSL ディストリビューション間で同期するようにしました。
- バックエンドが断続的に起動に失敗する問題を修正しました。
- glibc が互換性のないものである場合に発生するプロキシーのクラッシュを修正しました。
  [docker/for-win#8183](https://github.com/docker/for-win/issues/8183) を参照してください。
- `/mnt/wsl`をマウントしているコンテナーを削除すると WSL 統合環境が壊れてしまう問題を修正しました。
  [docker/for-win#7836](https://github.com/docker/for-win/issues/7836) を参照してください。
- Windows CLI を使って、ディストリビューションからのファイルマウントのサポートを追加しました。
  （たとえば`docker run -v \\wsl$\Ubuntu\home\simon\web:/web ...`）
- 相対パスを使った共有ボリュームを利用とした場合のエラーメッセージを修正しました。
  [docker/for-win#6894](https://github.com/docker/for-win/issues/6894) を Fix にしました。
- Windows を WSL 2 利用バージョンにアップデートした際の問題を修正しました。
  その際には設定ファイルが古い Hyper-V VM によってロックされていました。
- WSL 2 の内外における Docker Compose バージョンの不一致を修正しました。
  [docker/for-win#6461](https://github.com/docker/for-win/issues/6461) を Fix にしました。
- `docker-desktop` の WSL ディストリビューションが停止したことを検出するようにし、よりわかりやすいエラーメッセージを表示するようにしました。
- 公開ポートの競合状態を修正しました。
- ダイアログが他の画面をブロックしないようにしました。
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues }
### 既知の問題
@z

@x
-  There is a known issue when using `docker-compose` with named volumes and gRPC FUSE: second and subsequent calls to `docker-compose up` will fail due to the volume path having the prefix `/host_mnt`.
- There is a known issue when enabling Kubernetes where the settings UI sometimes fails to update the Kubernetes state. To work around this issue, close and re-open the Window.
- There is a rare known issue when switching users, where the images UI sometimes continues to show the repositories of the previous user. To work around this issue, close and re-open the Window.
@y
{% comment %}
-  There is a known issue when using `docker-compose` with named volumes and gRPC FUSE: second and subsequent calls to `docker-compose up` will fail due to the volume path having the prefix `/host_mnt`.
- There is a known issue when enabling Kubernetes where the settings UI sometimes fails to update the Kubernetes state. To work around this issue, close and re-open the Window.
- There is a rare known issue when switching users, where the images UI sometimes continues to show the repositories of the previous user. To work around this issue, close and re-open the Window.
{% endcomment %}
-  名前つきボリュームと gRPC FUSE を利用して`docker-compose`を実行した際に問題が発生します。
   2 度め以降の`docker-compose up`の呼び出しが失敗します。
   ボリュームパスのプリフィックスに`/host_mnt`があるためです。
-  Kubernetes を有効にしていると、Setting UI において Kubernetes のステータス更新に失敗する場合があるという問題があります。
   この問題を回避するには、画面をいったん閉じてから再度開いてください。
-  ごくまれに発生する問題として、ユーザー切り替えを行うと、イメージ画面において以前のユーザーのリポジトリが表示される場合があります。
   この問題を回避するには、画面をいったん閉じてから再度開いてください。
@z

@x
## Docker Desktop Community 2.3.0.5
2020-09-15
@y
## Docker Desktop Community 2.3.0.5
2020-09-15
@z

@x
> [Download](https://desktop.docker.com/win/stable/48029/Docker%20Desktop%20Installer.exe)
@y
{% comment %}
> [Download](https://desktop.docker.com/win/stable/48029/Docker%20Desktop%20Installer.exe)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/win/stable/48029/Docker%20Desktop%20Installer.exe)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-2 }
### 新機能
@z

@x
- The new Cloud integration in Docker CLI makes it easy to run containers in the cloud using either Amazon ECS or Microsoft ACI. For more information, see [Deploying Docker containers on ECS](https://docs.docker.com/engine/context/ecs-integration/) and [Deploying Docker containers on Azure](https://docs.docker.com/engine/context/aci-integration/).
@y
{% comment %}
- The new Cloud integration in Docker CLI makes it easy to run containers in the cloud using either Amazon ECS or Microsoft ACI. For more information, see [Deploying Docker containers on ECS](https://docs.docker.com/engine/context/ecs-integration/) and [Deploying Docker containers on Azure](https://docs.docker.com/engine/context/aci-integration/).
{% endcomment %}
- Docker CLI の新しいクラウド統合環境によって、Amazon ECS や Microsoft ACI を用いたコンテナー実行が簡単になりました。
  詳しくは [ECS での Docker コンテナーのデプロイ](../../engine/context/ecs-integration/) や [Azure での Docker コンテナーのデプロイ](../../engine/context/aci-integration/) を参照してください。
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-2 }
### アップグレード
@z

@x
- [Docker Compose 1.27.2](https://github.com/docker/compose/releases/tag/1.27.2)
- [Cloud integration v0.1.15](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.15)
@y
- [Docker Compose 1.27.2](https://github.com/docker/compose/releases/tag/1.27.2)
- [Cloud integration v0.1.15](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.15)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-2 }
### バグフィックスとマイナーチェンジ
@z

@x
- WSL2: Fixed a crash when using an incompatible glibc. See [docker/for-win#8183](https://github.com/docker/for-win/issues/8183).
@y
{% comment %}
- WSL2: Fixed a crash when using an incompatible glibc. See [docker/for-win#8183](https://github.com/docker/for-win/issues/8183).
{% endcomment %}
- WSL2: 非互換の glibc を利用している際のクラッシュを修正しました。
  [docker/for-win#8183](https://github.com/docker/for-win/issues/8183) を参照してください。
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues-1 }
### 既知の問題
@z

@x
- The `clock_gettime64` system call returns `EPERM` rather than `ENOSYS`
in i386 images. To work around this issue, disable `seccomp` by using
the `--privileged` flag. See [docker/for-win#8326](https://github.com/docker/for-win/issues/8326).
@y
{% comment %}
- The `clock_gettime64` system call returns `EPERM` rather than `ENOSYS`
in i386 images. To work around this issue, disable `seccomp` by using
the `--privileged` flag. See [docker/for-win#8326](https://github.com/docker/for-win/issues/8326).
{% endcomment %}
- システムコール`clock_gettime64`は、i386 イメージにおいて`ENOSYS`ではなく`EPERM`を返します。
  この問題を回避するには、`--privileged`フラグを指定して`seccomp`を無効にしてください。
  [docker/for-win#8326](https://github.com/docker/for-win/issues/8326) を参照してください。
@z

@x
## Docker Desktop Community 2.3.0.4
2020-07-27
@y
## Docker Desktop Community 2.3.0.4
2020-07-27
@z

@x
> [Download](https://desktop.docker.com/win/stable/46911/Docker%20Desktop%20Installer.exe)
@y
{% comment %}
> [Download](https://desktop.docker.com/win/stable/46911/Docker%20Desktop%20Installer.exe)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/win/stable/46911/Docker%20Desktop%20Installer.exe)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-3 }
### アップグレード
@z

@x
- [Docker 19.03.12](https://github.com/docker/docker-ce/releases/tag/v19.03.12)
- [Docker Compose 1.26.2](https://github.com/docker/compose/releases/tag/1.26.2)
- [Go 1.13.14](https://github.com/golang/go/issues?q=milestone%3AGo1.13.14+label%3ACherryPickApproved)
@y
- [Docker 19.03.12](https://github.com/docker/docker-ce/releases/tag/v19.03.12)
- [Docker Compose 1.26.2](https://github.com/docker/compose/releases/tag/1.26.2)
- [Go 1.13.14](https://github.com/golang/go/issues?q=milestone%3AGo1.13.14+label%3ACherryPickApproved)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-3 }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop now prompts users to share directories for paths like `////c/Users/foo`, rather than only paths like `C:\Users\foo` and `C:/Users/foo`.
- The installer now returns a non-zero exit code on error, or when the user cancels the installation.
- Fixed the path to the installer log file default location when the username contains a space. Fixes [docker/for-win#6552](https://github.com/docker/for-win/issues/6552)
- Dashboard: Fixed opening a CLI for Windows containers. See [docker/for-win#7079](https://github.com/docker/for-win/issues/7079)
- Dashboard: Fixed containers logs which were sometimes truncated. Fixes [docker/for-win#5954](https://github.com/docker/for-win/issues/5954)
- WSL 2: Fixed an issue where changing the user's default shell blocked WSL integration. Fixes [docker/for-win#7653](https://github.com/docker/for-win/issues/7653)
- WSL 2: Fixed an issue to recover WSL distributions stuck in the "Installing" state.
@y
{% comment %}
- Docker Desktop now prompts users to share directories for paths like `////c/Users/foo`, rather than only paths like `C:\Users\foo` and `C:/Users/foo`.
- The installer now returns a non-zero exit code on error, or when the user cancels the installation.
- Fixed the path to the installer log file default location when the username contains a space. Fixes [docker/for-win#6552](https://github.com/docker/for-win/issues/6552)
- Dashboard: Fixed opening a CLI for Windows containers. See [docker/for-win#7079](https://github.com/docker/for-win/issues/7079)
- Dashboard: Fixed containers logs which were sometimes truncated. Fixes [docker/for-win#5954](https://github.com/docker/for-win/issues/5954)
- WSL 2: Fixed an issue where changing the user's default shell blocked WSL integration. Fixes [docker/for-win#7653](https://github.com/docker/for-win/issues/7653)
- WSL 2: Fixed an issue to recover WSL distributions stuck in the "Installing" state.
{% endcomment %}
- Docker Desktop において共有ディレクトリを生成する際、`C:\Users\foo` や `C:/Users/foo` といったパスだけでなく、`////c/Users/foo` のようなパスに対しても、ユーザープロンプトを表示するようにする。
- インストール時のエラー、あるいはユーザーがインストールをキャンセルした場合、インストーラーがゼロではないエラーコードを返すようにする。
- インストール時のログファイルを出力するデフォルトディレクトリにおいて、ユーザー名が空白文字を含む場合の不備を修正。
  [docker/for-win#6552](https://github.com/docker/for-win/issues/6552) を Fix に。
- Dashboard: Fixed opening a CLI for Windows containers. See [docker/for-win#7079](https://github.com/docker/for-win/issues/7079)
- Dashboard: Fixed containers logs which were sometimes truncated. Fixes [docker/for-win#5954](https://github.com/docker/for-win/issues/5954)
- WSL 2: Fixed an issue where changing the user's default shell blocked WSL integration. Fixes [docker/for-win#7653](https://github.com/docker/for-win/issues/7653)
- WSL 2: Fixed an issue to recover WSL distributions stuck in the "Installing" state.
@z

@x
## Docker Desktop Community 2.3.0.3
2020-05-27
@y
## Docker Desktop Community 2.3.0.3
2020-05-27
@z

@x
> [Download](https://desktop.docker.com/win/stable/45519/Docker%20Desktop%20Installer.exe)
@y
{% comment %}
> [Download](https://desktop.docker.com/win/stable/45519/Docker%20Desktop%20Installer.exe)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/win/stable/45519/Docker%20Desktop%20Installer.exe)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-4 }
### アップグレード
@z

@x
- [Linux kernel 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-83885d3b4cff391813f4262099b36a529bca2df8-amd64/images/sha256-0214b82436af70054e013ea51cb1fea72bd943d0d6245b6521f1ff09a505c40f?context=repo)
@y
{% comment %}
- [Linux kernel 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-83885d3b4cff391813f4262099b36a529bca2df8-amd64/images/sha256-0214b82436af70054e013ea51cb1fea72bd943d0d6245b6521f1ff09a505c40f?context=repo)
{% endcomment %}
- [Linux カーネル 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-83885d3b4cff391813f4262099b36a529bca2df8-amd64/images/sha256-0214b82436af70054e013ea51cb1fea72bd943d0d6245b6521f1ff09a505c40f?context=repo)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-4 }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a crash when resetting to factory defaults with Hyper-V disabled. Fixes [docker/for-win#6738](https://github.com/docker/for-win/issues/6738).
@y
{% comment %}
- Fixed a crash when resetting to factory defaults with Hyper-V disabled. Fixes [docker/for-win#6738](https://github.com/docker/for-win/issues/6738).
{% endcomment %}
- Hyper-V 無効の状態で、ファクトリ設定をデフォルトにリセットする際に発生するクラッシュを修正。
  [docker/for-win#6738](https://github.com/docker/for-win/issues/6738) を Fix に。
@z

@x
- Fixed opening an application in VS Code from a WSL 2 running app. Fixes [docker/for-win#6472](https://github.com/docker/for-win/issues/6472).
@y
{% comment %}
- Fixed opening an application in VS Code from a WSL 2 running app. Fixes [docker/for-win#6472](https://github.com/docker/for-win/issues/6472).
{% endcomment %}
- WSL 2 上にて起動しているアプリに対して、VS Code からアプリを開く際の問題を修正。
  [docker/for-win#6472](https://github.com/docker/for-win/issues/6472) を Fix に。
@z

@x
- Fixed Swarm mounts in WSL 2. Fixes [docker/for-win#6507](https://github.com/docker/for-win/issues/6507).
@y
{% comment %}
- Fixed Swarm mounts in WSL 2. Fixes [docker/for-win#6507](https://github.com/docker/for-win/issues/6507).
{% endcomment %}
- WSL 2 における Swarm マウントを修正。
  [docker/for-win#6507](https://github.com/docker/for-win/issues/6507) を Fix に。
@z

@x
- Fixed a bug when using the Microsoft `mssql` image. Fixes [docker/for-win#6646](https://github.com/docker/for-win/issues/6646)
@y
{% comment %}
- Fixed a bug when using the Microsoft `mssql` image. Fixes [docker/for-win#6646](https://github.com/docker/for-win/issues/6646)
{% endcomment %}
- Microsoft の `mssql` イメージを用いた際のバグを修正。
  [docker/for-win#6646](https://github.com/docker/for-win/issues/6646) を Fix に。
@z

@x
- Implemented `fallocate` for shared file systems. See [docker/for-win#6658](https://github.com/docker/for-win/issues/6658#issuecomment-627736820)
@y
{% comment %}
- Implemented `fallocate` for shared file systems. See [docker/for-win#6658](https://github.com/docker/for-win/issues/6658#issuecomment-627736820)
{% endcomment %}
- `fallocate` を共有ファイルシステムに対して実装。
  [docker/for-win#6658](https://github.com/docker/for-win/issues/6658#issuecomment-627736820) 参照。
@z

@x
- Fixed an installer crash when an old and/or partially uninstalled version of Docker Desktop was present on the system. Fixes [docker/for-win#6536](https://github.com/docker/for-win/issues/6536).
@y
{% comment %}
- Fixed an installer crash when an old and/or partially uninstalled version of Docker Desktop was present on the system. Fixes [docker/for-win#6536](https://github.com/docker/for-win/issues/6536).
{% endcomment %}
- インストールされている Docker Desktop が古い場合、あるいは部分的にインストールが残っている場合に、インストーラーがクラッシュするのを修正。
  [docker/for-win#6536](https://github.com/docker/for-win/issues/6536) を Fix に。
@z

@x
- Fixed a delay caused when opening the systray menu. Fixes [docker/for-win#1011](https://github.com/docker/for-win/issues/1011).
@y
{% comment %}
- Fixed a delay caused when opening the systray menu. Fixes [docker/for-win#1011](https://github.com/docker/for-win/issues/1011).
{% endcomment %}
- システムトレイメニューを開いている際に動作が遅くなるのを修正。
  [docker/for-win#1011](https://github.com/docker/for-win/issues/1011) を Fix に。
@z

@x
- Fixed a regression where containers couldn’t anymore refer to mounted folders using the host drive letters. Fixes [docker/for-win#6628](https://github.com/docker/for-win/issues/6628).
@y
{% comment %}
- Fixed a regression where containers couldn’t anymore refer to mounted folders using the host drive letters. Fixes [docker/for-win#6628](https://github.com/docker/for-win/issues/6628).
{% endcomment %}
- コンテナーがマウントしているフォルダーに、ホストのドライブ文字を含めていた場合に、参照できなくなる不具合を修正。
  [docker/for-win#6628](https://github.com/docker/for-win/issues/6628) を Fix に。
@z

@x
- Fixed a regression where sharing a folder using a double leading slash notation would fail. Fixes [docker/for-win#6668](https://github.com/docker/for-win/issues/6668).
@y
{% comment %}
- Fixed a regression where sharing a folder using a double leading slash notation would fail. Fixes [docker/for-win#6668](https://github.com/docker/for-win/issues/6668).
{% endcomment %}
- フォルダー共有において、先頭にスラッシュを 2 つ記述した場合の不具合を修正。
  [docker/for-win#6668](https://github.com/docker/for-win/issues/6668) を Fix に。
@z

@x
- Re-added device-mapper to the embedded Linux kernel. Fixes [docker/for-mac#4549](https://github.com/docker/for-mac/issues/4549).
@y
{% comment %}
- Re-added device-mapper to the embedded Linux kernel. Fixes [docker/for-mac#4549](https://github.com/docker/for-mac/issues/4549).
{% endcomment %}
- 埋め込み Linux カーネルに対するデバイスマッパーを再追加。
  [docker/for-mac#4549](https://github.com/docker/for-mac/issues/4549) を Fix に。
@z

@x
- Fixed an issue which caused the `:z` attribute in bind mounts to fail. Fixes [docker/for-win#6634](https://github.com/docker/for-win/issues/6634).
@y
{% comment %}
- Fixed an issue which caused the `:z` attribute in bind mounts to fail. Fixes [docker/for-win#6634](https://github.com/docker/for-win/issues/6634).
{% endcomment %}
- バインドマウントにおける `:z` 属性が機能しない不具合を修正。
  [docker/for-win#6634](https://github.com/docker/for-win/issues/6634) を Fix に。
@z

@x
## Docker Desktop Community 2.3.0.2
2020-05-11
@y
## Docker Desktop Community 2.3.0.2
2020-05-11
@z

@x
> [Download](https://download.docker.com/win/stable/45183/Docker%20Desktop%20Installer.exe)
@y
{% comment %}
> [Download](https://download.docker.com/win/stable/45183/Docker%20Desktop%20Installer.exe)
{% endcomment %}
> [ダウンロード](https://download.docker.com/win/stable/45183/Docker%20Desktop%20Installer.exe)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-3 }
### 新機能
@z

@x
- Windows 10 Home users can now use Docker Desktop through WSL 2. This requires Windows 10, version 2004 or higher. For more information, see [Install Docker Desktop on Windows Home](install-windows-home.md).
- Docker Desktop introduces a new onboarding tutorial upon first startup. The Quick Start tutorial guides users to get started with Docker in a few easy steps. It includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
- Docker Desktop now allows sharing individual folders, rather than whole drives, giving more control to users over what is being shared.
@y
- Windows 10 Home users can now use Docker Desktop through WSL 2. This requires Windows 10, version 2004 or higher. For more information, see [Install Docker Desktop on Windows Home](install-windows-home.md).
- Docker Desktop introduces a new onboarding tutorial upon first startup. The Quick Start tutorial guides users to get started with Docker in a few easy steps. It includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
- Docker Desktop now allows sharing individual folders, rather than whole drives, giving more control to users over what is being shared.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-5 }
### アップグレード
@z

@x
- [Docker Compose 1.25.5](https://github.com/docker/compose/releases/tag/1.25.5)
- [Go 1.13.10](https://github.com/golang/go/issues?q=milestone%3AGo1.13.10+label%3ACherryPickApproved)
- [Linux kernel 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-ce15f646db9b062dc947cfc0c1deab019fa63f96-amd64/images/sha256-6c252199aee548e4bdc8457e0a068e7d8e81c2649d4c1e26e4150daa253a85d8?context=repo)
- LinuxKit [init](https://hub.docker.com/layers/linuxkit/init/1a80a9907b35b9a808e7868ffb7b0da29ee64a95/images/sha256-64cc8fa50d63940dbaa9979a13c362c89ecb4439bcb3ab22c40d300b9c0b597e?context=explore), [runc](https://hub.docker.com/layers/linuxkit/runc/69b4a35eaa22eba4990ee52cccc8f48f6c08ed03/images/sha256-57e3c7cbd96790990cf87d7b0f30f459ea0b6f9768b03b32a89b832b73546280?context=explore) and [containerd](https://hub.docker.com/layers/linuxkit/containerd/09553963ed9da626c25cf8acdf6d62ec37645412/images/sha256-866be7edb0598430709f88d0e1c6ed7bfd4a397b5ed220e1f793ee9067255ff1?context=explore)
@y
- [Docker Compose 1.25.5](https://github.com/docker/compose/releases/tag/1.25.5)
- [Go 1.13.10](https://github.com/golang/go/issues?q=milestone%3AGo1.13.10+label%3ACherryPickApproved)
- [Linux kernel 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-ce15f646db9b062dc947cfc0c1deab019fa63f96-amd64/images/sha256-6c252199aee548e4bdc8457e0a068e7d8e81c2649d4c1e26e4150daa253a85d8?context=repo)
- LinuxKit [init](https://hub.docker.com/layers/linuxkit/init/1a80a9907b35b9a808e7868ffb7b0da29ee64a95/images/sha256-64cc8fa50d63940dbaa9979a13c362c89ecb4439bcb3ab22c40d300b9c0b597e?context=explore), [runc](https://hub.docker.com/layers/linuxkit/runc/69b4a35eaa22eba4990ee52cccc8f48f6c08ed03/images/sha256-57e3c7cbd96790990cf87d7b0f30f459ea0b6f9768b03b32a89b832b73546280?context=explore) and [containerd](https://hub.docker.com/layers/linuxkit/containerd/09553963ed9da626c25cf8acdf6d62ec37645412/images/sha256-866be7edb0598430709f88d0e1c6ed7bfd4a397b5ed220e1f793ee9067255ff1?context=explore)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-5 }
### バグフィックスとマイナーチェンジ
@z

@x
**WSL 2**
@y
**WSL 2**
@z

@x
- Docker Desktop only exposes host ports in Linux if the Windows port is available.
- Docker Desktop now allows users to refresh the list of distros.
- Docker Desktop defaults to WSL 2 on install on compatible OS versions.
- Docker Desktop detects missing Linux kernel and adds a pointer to the Microsoft documentation to download the kernel.
- Detect when the WSL 2 backend stops and allow the user to restart it.
- Added support for `chmod/chown` on WSL 2 bind mounts. Fixes [docker/for-win#6284](https://github.com/docker/for-win/issues/6284).
- Added a check that virtualization is enabled in the BIOS.
@y
- Docker Desktop only exposes host ports in Linux if the Windows port is available.
- Docker Desktop now allows users to refresh the list of distros.
- Docker Desktop defaults to WSL 2 on install on compatible OS versions.
- Docker Desktop detects missing Linux kernel and adds a pointer to the Microsoft documentation to download the kernel.
- Detect when the WSL 2 backend stops and allow the user to restart it.
- Added support for `chmod/chown` on WSL 2 bind mounts. Fixes [docker/for-win#6284](https://github.com/docker/for-win/issues/6284).
- Added a check that virtualization is enabled in the BIOS.
@z

@x
**Filesharing**
@y
**Filesharing**
@z

@x
- Fixed a bug where renaming parent directories of shared folders led to spurious `File not found` errors. Fixes [docker/for-win#6200](https://github.com/docker/for-win/issues/6200).
- Fixed bug where a letter and two digit root folder name causes docker-compose to fail creating directories inside the volume. Fixes [docker/for-win#6248](https://github.com/docker/for-win/issues/6248).
- Fixed a bug which prevented containers from seeing file updates on shared volumes, when under load and a container restarts. Fixes [docker/for-win#5530](https://github.com/docker/for-win/issues/5530#issuecomment-608804192).
- Fixed a bug where host paths are incorrectly translated into VM paths. Fixes [docker/for-win#6209](https://github.com/docker/for-win/issues/6209).
- Fixed bug receiving file events on long paths (> 260 characters). Fixes [docker/for-win#6337](https://github.com/docker/for-win/issues/6337).
- Docker Desktop represents valid directory junctions as directories (rather than symlinks) and handles cache invalidation and event injection properly. Fixes [docker/for-win#5582](https://github.com/docker/for-win/issues/5582).
@y
- Fixed a bug where renaming parent directories of shared folders led to spurious `File not found` errors. Fixes [docker/for-win#6200](https://github.com/docker/for-win/issues/6200).
- Fixed bug where a letter and two digit root folder name causes docker-compose to fail creating directories inside the volume. Fixes [docker/for-win#6248](https://github.com/docker/for-win/issues/6248).
- Fixed a bug which prevented containers from seeing file updates on shared volumes, when under load and a container restarts. Fixes [docker/for-win#5530](https://github.com/docker/for-win/issues/5530#issuecomment-608804192).
- Fixed a bug where host paths are incorrectly translated into VM paths. Fixes [docker/for-win#6209](https://github.com/docker/for-win/issues/6209).
- Fixed bug receiving file events on long paths (> 260 characters). Fixes [docker/for-win#6337](https://github.com/docker/for-win/issues/6337).
- Docker Desktop represents valid directory junctions as directories (rather than symlinks) and handles cache invalidation and event injection properly. Fixes [docker/for-win#5582](https://github.com/docker/for-win/issues/5582).
@z

@x
**Other fixes**
@y
**Other fixes**
@z

@x
- Reduced the size of the Docker Desktop installer from 960 MB to 409 MB.
- Added an option to delete data from the Troubleshoot screen.
- Fixed a bug where containers disappeared from the UI when Kubernetes context is invalid. Fixed [docker/for-win#6037](https://github.com/docker/for-win/issues/6037).
- Fixed Windows event logs filtering when copying them to the Docker Desktop log files. Fixed [docker/for-win#6258](https://github.com/docker/for-win/issues/6258).
- Fixed a handle leak in `vpnkit-bridge`. Fixed [docker/for-win#5841](https://github.com/docker/for-win/issues/5841)
- Fixed bug when removing Docker Desktop virtual switch.
- Added a link to the Edge channel from the UI.
- Made the embedded terminal resizable.
- Fixed a bug which only respected the `expose on TCP` Docker engine API setting on application restart. Setting will now take effect when the Apply button is clicked.
- Fixed a bug where diagnostic upload would fail if the username contained spaces.
- Docker Desktop now reads the Hyper-V VM disk max size on startup and uses it as the value to display in the Settings.
- Fixed a bug where the Docker Desktop UI could be started without the engine. Fixes [docker/for-win#5376](https://github.com/docker/for-win/issues/5376).
- Docker Desktop now uses the least possible privilege for querying the Server service. Fixes [docker/for-win#5150](https://github.com/docker/for-win/issues/5150).
- Fixed an issue where a container port could not be exposed on a specific host IP. See [docker/for-win#5546](https://github.com/docker/for-mac/issues/5546).
- Removed port probing from dashboard, just unconditionally showing links to ports that should be available. Fixes [docker/for-win#5903](https://github.com/docker/for-win/issues/5903).
- Ceph support has been removed from Docker Desktop to save disk space.
- Fixed an issue that caused the Windows log file archive to grow indefinitely. Fixes [docker/for-win#5113](https://github.com/docker/for-win/issues/5113).
- Added a prerequisite check in the installer for the LanmanServer service. Fixes [docker/for-win#5150](https://github.com/docker/for-win/issues/5150)
@y
- Reduced the size of the Docker Desktop installer from 960 MB to 409 MB.
- Added an option to delete data from the Troubleshoot screen.
- Fixed a bug where containers disappeared from the UI when Kubernetes context is invalid. Fixed [docker/for-win#6037](https://github.com/docker/for-win/issues/6037).
- Fixed Windows event logs filtering when copying them to the Docker Desktop log files. Fixed [docker/for-win#6258](https://github.com/docker/for-win/issues/6258).
- Fixed a handle leak in `vpnkit-bridge`. Fixed [docker/for-win#5841](https://github.com/docker/for-win/issues/5841)
- Fixed bug when removing Docker Desktop virtual switch.
- Added a link to the Edge channel from the UI.
- Made the embedded terminal resizable.
- Fixed a bug which only respected the `expose on TCP` Docker engine API setting on application restart. Setting will now take effect when the Apply button is clicked.
- Fixed a bug where diagnostic upload would fail if the username contained spaces.
- Docker Desktop now reads the Hyper-V VM disk max size on startup and uses it as the value to display in the Settings.
- Fixed a bug where the Docker Desktop UI could be started without the engine. Fixes [docker/for-win#5376](https://github.com/docker/for-win/issues/5376).
- Docker Desktop now uses the least possible privilege for querying the Server service. Fixes [docker/for-win#5150](https://github.com/docker/for-win/issues/5150).
- Fixed an issue where a container port could not be exposed on a specific host IP. See [docker/for-win#5546](https://github.com/docker/for-mac/issues/5546).
- Removed port probing from dashboard, just unconditionally showing links to ports that should be available. Fixes [docker/for-win#5903](https://github.com/docker/for-win/issues/5903).
- Ceph support has been removed from Docker Desktop to save disk space.
- Fixed an issue that caused the Windows log file archive to grow indefinitely. Fixes [docker/for-win#5113](https://github.com/docker/for-win/issues/5113).
- Added a prerequisite check in the installer for the LanmanServer service. Fixes [docker/for-win#5150](https://github.com/docker/for-win/issues/5150)
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues-2 }
### 既知の問題
@z

@x
- Some CLI commands fail if you are running Docker Desktop in the experimental Linux Containers on Windows (LCOW) mode. As alternatives, we recommend running either traditional Linux containers, or the [WSL 2 backend](wsl.md).
@y
- Some CLI commands fail if you are running Docker Desktop in the experimental Linux Containers on Windows (LCOW) mode. As alternatives, we recommend running either traditional Linux containers, or the [WSL 2 backend](wsl.md).
@z

@x
**WSL 2**
@y
**WSL 2**
@z

@x
- Swarm service bind mounts are not always restored correctly.
- Bind mounts of files living outside of the root mount point (files within `/mnt/c`, `/tmp`, `/run...`) don't work correctly when multiple containers mount them.
@y
- Swarm service bind mounts are not always restored correctly.
- Bind mounts of files living outside of the root mount point (files within `/mnt/c`, `/tmp`, `/run...`) don't work correctly when multiple containers mount them.
@z

@x
## Docker Desktop Community 2.2.0.5
2020-04-02
@y
## Docker Desktop Community 2.2.0.5
2020-04-02
@z

@x
> [Download](https://download.docker.com/win/stable/43884/Docker%20Desktop%20Installer.exe)
@y
> [Download](https://download.docker.com/win/stable/43884/Docker%20Desktop%20Installer.exe)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-6 }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop generates `fsnotify.WRITE` events in Linux containers when files are changed on the host. Fixes [docker/for-win#5530](https://github.com/docker/for-win/issues/5530#issuecomment-585572414).
- Fixed a race condition in `readlink` on shared volumes using "mfsymlinks". Fixes [docker/for-win#5793](https://github.com/docker/for-win/issues/5793).
- Made the VM time sync more reliable. See [docker/for-win#4526](https://github.com/docker/for-win/issues/4526).
- Fixed bug where files did not change in shared volumes when using `volumes_from` in `docker-compose.yml`. See [docker/for-win#5530](https://github.com/docker/for-win/issues/5530).
- Fixed a bug where opening a read-only file would fail with an `Operation not permitted` error. Fixes [docker/for-win#6016](https://github.com/docker/for-win/issues/6016) and [docker/for-win#6017](https://github.com/docker/for-win/issues/6017).
@y
- Docker Desktop generates `fsnotify.WRITE` events in Linux containers when files are changed on the host. Fixes [docker/for-win#5530](https://github.com/docker/for-win/issues/5530#issuecomment-585572414).
- Fixed a race condition in `readlink` on shared volumes using "mfsymlinks". Fixes [docker/for-win#5793](https://github.com/docker/for-win/issues/5793).
- Made the VM time sync more reliable. See [docker/for-win#4526](https://github.com/docker/for-win/issues/4526).
- Fixed bug where files did not change in shared volumes when using `volumes_from` in `docker-compose.yml`. See [docker/for-win#5530](https://github.com/docker/for-win/issues/5530).
- Fixed a bug where opening a read-only file would fail with an `Operation not permitted` error. Fixes [docker/for-win#6016](https://github.com/docker/for-win/issues/6016) and [docker/for-win#6017](https://github.com/docker/for-win/issues/6017).
@z

@x
## Docker Desktop Community 2.2.0.4
2020-03-13
@y
## Docker Desktop Community 2.2.0.4
2020-03-13
@z

@x
> [Download](https://download.docker.com/win/stable/43472/Docker%20Desktop%20Installer.exe)
@y
> [Download](https://download.docker.com/win/stable/43472/Docker%20Desktop%20Installer.exe)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-6 }
### アップグレード
@z

@x
- [Docker 19.03.8](https://github.com/docker/docker-ce/releases/tag/v19.03.8)
@y
- [Docker 19.03.8](https://github.com/docker/docker-ce/releases/tag/v19.03.8)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-7 }
### バグフィックスとマイナーチェンジ
@z

@x
- Security: Diagnostics were collected with Administrator privileges, which led to a possible privilege escalation on systems where the Docker Desktop user was not an administrator.
- Docker Desktop now displays hidden files in shared volumes. Fixes [docker/for-win#5808](https://github.com/docker/for-win/issues/5808).
- Docker Desktop now generates the inotify `MODIFY` events on shared file systems for Windows file sharing. Fixes [docker/for-win#5530](https://github.com/docker/for-win/issues/5530).
- Attempts to create files in a shared volume with an identical filename but a different case (uppercase/lowercase) on Windows filesystem will now fail with the error `EEXIST`. Fixes [docker/for-win#5894](https://github.com/docker/for-win/issues/5894).
- Fixed cache invalidation and event injection in shared volumes with host paths longer than 260 characters.
- Docker Desktop now allows users to rename open files in shared volumes. Fixes [docker/for-win#5565](https://github.com/docker/for-win/issues/5565).
- Fixed an issue which caused Docker Desktop Dashboard to attempt connecting to all exposed ports inside a container. Fixes [docker/for-win#5903](https://github.com/docker/for-win/issues/5903).
- Kubernetes: Persistent volumes created by claims are now stored in the virtual machine. Fixes [docker/for-win#5665](https://github.com/docker/for-win/issues/5665).
- Fixed an issue which caused Docker Desktop to hang when users tried to reset to factory defaults.
- Fixed a file sharing issue that caused Docker Desktop to lock random files. Fixes [docker/for-win#5624](https://github.com/docker/for-win/issues/5624) and [docker/for-win#5575](https://github.com/docker/for-win/issues/5575).
@y
- Security: Diagnostics were collected with Administrator privileges, which led to a possible privilege escalation on systems where the Docker Desktop user was not an administrator.
- Docker Desktop now displays hidden files in shared volumes. Fixes [docker/for-win#5808](https://github.com/docker/for-win/issues/5808).
- Docker Desktop now generates the inotify `MODIFY` events on shared file systems for Windows file sharing. Fixes [docker/for-win#5530](https://github.com/docker/for-win/issues/5530).
- Attempts to create files in a shared volume with an identical filename but a different case (uppercase/lowercase) on Windows filesystem will now fail with the error `EEXIST`. Fixes [docker/for-win#5894](https://github.com/docker/for-win/issues/5894).
- Fixed cache invalidation and event injection in shared volumes with host paths longer than 260 characters.
- Docker Desktop now allows users to rename open files in shared volumes. Fixes [docker/for-win#5565](https://github.com/docker/for-win/issues/5565).
- Fixed an issue which caused Docker Desktop Dashboard to attempt connecting to all exposed ports inside a container. Fixes [docker/for-win#5903](https://github.com/docker/for-win/issues/5903).
- Kubernetes: Persistent volumes created by claims are now stored in the virtual machine. Fixes [docker/for-win#5665](https://github.com/docker/for-win/issues/5665).
- Fixed an issue which caused Docker Desktop to hang when users tried to reset to factory defaults.
- Fixed a file sharing issue that caused Docker Desktop to lock random files. Fixes [docker/for-win#5624](https://github.com/docker/for-win/issues/5624) and [docker/for-win#5575](https://github.com/docker/for-win/issues/5575).
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues-3 }
### 既知の問題
@z

@x
- Some CLI commands fail if you are running Docker Desktop in the experimental Linux Containers on Windows (LCOW) mode. As alternatives, we recommend running either traditional Linux containers, or the experimental [WSL backend](wsl.md).
- It is not possible to resize the disk image using the Docker Desktop **Settings** UI. If you would like to update the size of the disk image (for example, to 128 GB), run the following command in PowerShell:
@y
- Some CLI commands fail if you are running Docker Desktop in the experimental Linux Containers on Windows (LCOW) mode. As alternatives, we recommend running either traditional Linux containers, or the experimental [WSL backend](wsl.md).
- It is not possible to resize the disk image using the Docker Desktop **Settings** UI. If you would like to update the size of the disk image (for example, to 128 GB), run the following command in PowerShell:
@z

@x
  ```powershell
  Resize-VHD -Path 'C:\ProgramData\DockerDesktop\vm-data\DockerDesktop.vhdx' -SizeBytes 128gb
  ```
@y
  ```powershell
  Resize-VHD -Path 'C:\ProgramData\DockerDesktop\vm-data\DockerDesktop.vhdx' -SizeBytes 128gb
  ```
@z

@x
## Docker Desktop Community 2.2.0.3
2020-02-11
@y
## Docker Desktop Community 2.2.0.3
2020-02-11
@z

@x
> [Download](https://download.docker.com/win/stable/42716/Docker%20Desktop%20Installer.exe)
@y
> [Download](https://download.docker.com/win/stable/42716/Docker%20Desktop%20Installer.exe)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-7 }
### アップグレード
@z

@x
- [Docker Compose 1.25.4](https://github.com/docker/compose/releases/tag/1.25.4)
- [Go 1.12.16](https://golang.org/doc/devel/release.html#go1.12)
@y
- [Docker Compose 1.25.4](https://github.com/docker/compose/releases/tag/1.25.4)
- [Go 1.12.16](https://golang.org/doc/devel/release.html#go1.12)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-8 }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue that prevented users from creating files with special characters in the filenames within a shared volume. Fixes [docker/for-win#5520](https://github.com/docker/for-win/issues/5520).
- Fixed handling of shared volumes with relative paths in `docker-compose.yml`. Fixes [docker/for-win#5516](https://github.com/docker/for-win/issues/5516).
- Fixed handling of shared volumes where the path case (uppercase / lowercase) did not exactly match the host. Fixes [docker/for-win#5516](https://github.com/docker/for-win/issues/5516).
- Fixed an issue where changing a file in the Windows file system did not update the file within the container. Fixes [docker/for-win#5530](https://github.com/docker/for-win/issues/5530) and [docker/for-win#5550](https://github.com/docker/for-win/issues/5550).
- Fixed an issue that prevented users from sharing drives and sometimes incorrectly prompted users to enter file system credentials. Fixes [docker/for-win#5567](https://github.com/docker/for-win/issues/5567).
- Fixed an issue which prevented users from mounting nested volumes. Fixes [docker/for-win#5540](https://github.com/docker/for-win/issues/5540).
- Fixed a file synchronization issue on bind mounts. Fixes [docker/for-win#5533](https://github.com/docker/for-win/issues/5533).
- Fixed an issue where timestamps were reset to zero on files within shared volumes. Fixes [docker/for-win#5528](https://github.com/docker/for-win/issues/5528) and [docker/for-win#5543](https://github.com/docker/for-win/issues/5543).
- Fixed a bug which caused Docker Desktop to fail when sharing file paths longer than 260 characters. Fixes [docker/for-win#5572](https://github.com/docker/for-win/issues/5572).
- Fixed an issue where some users were unable to start a container if there is a symlink in a shared volume. Fixes [docker/for-win#5582](https://github.com/docker/for-win/issues/5582).
- Fixed a bug where users were unable to modify the **Manual proxy configuration** settings through the Docker Desktop UI. Fixes [docker/for-win#5606](https://github.com/docker/for-win/issues/5606) and [docker/for-win#5548](https://github.com/docker/for-win/issues/5548).
- Fixed an issue where the Docker Desktop UI failed to start if the `no_proxy` environment variable has an entry that starts with a dot (.). Fixes [docker/for-win/5551](https://github.com/docker/for-win/issues/5551).
- Fixed a bug that did not allow users to access the Docker Desktop UI on machines with a policy preventing access to the Windows registry. Fixes [docker/for-win#5536](https://github.com/docker/for-win/issues/5536).
- Fixed an issue where disabling the WSL2 integration and re-enabling it later resulted in broken symlinks. Fixes [docker/for-win#5613](https://github.com/docker/for-win/issues/5613).
- Fixed a race condition when starting the WSL engine which caused Docker Desktop to incorrectly report that the containers have exited. Fixes [docker/for-win#5607](https://github.com/docker/for-win/issues/5607).
- Fixed an issue where editing code inside a container resulted in an error. Fixes [docker/for-win#5528](https://github.com/docker/for-win/issues/5528).
- Fixed a bug where running the command `DockerCli.exe -SharedDrives` failed to display a list of drives that are shared. Fixes [docker/for-win#5625](https://github.com/docker/for-win/issues/5625).
- Starting with Docker Desktop 2.2.0.3, you must access all shared files using their original case. For example, if you have created a file called `test`, you must open it as `test`. Attempts to open the file as `Test` will fail with the error `No such file or directory`. For more information, see _Tips on shared drives, permissions, and volume mounts_ in [File sharing](index.md#file-sharing).
@y
- Fixed an issue that prevented users from creating files with special characters in the filenames within a shared volume. Fixes [docker/for-win#5520](https://github.com/docker/for-win/issues/5520).
- Fixed handling of shared volumes with relative paths in `docker-compose.yml`. Fixes [docker/for-win#5516](https://github.com/docker/for-win/issues/5516).
- Fixed handling of shared volumes where the path case (uppercase / lowercase) did not exactly match the host. Fixes [docker/for-win#5516](https://github.com/docker/for-win/issues/5516).
- Fixed an issue where changing a file in the Windows file system did not update the file within the container. Fixes [docker/for-win#5530](https://github.com/docker/for-win/issues/5530) and [docker/for-win#5550](https://github.com/docker/for-win/issues/5550).
- Fixed an issue that prevented users from sharing drives and sometimes incorrectly prompted users to enter file system credentials. Fixes [docker/for-win#5567](https://github.com/docker/for-win/issues/5567).
- Fixed an issue which prevented users from mounting nested volumes. Fixes [docker/for-win#5540](https://github.com/docker/for-win/issues/5540).
- Fixed a file synchronization issue on bind mounts. Fixes [docker/for-win#5533](https://github.com/docker/for-win/issues/5533).
- Fixed an issue where timestamps were reset to zero on files within shared volumes. Fixes [docker/for-win#5528](https://github.com/docker/for-win/issues/5528) and [docker/for-win#5543](https://github.com/docker/for-win/issues/5543).
- Fixed a bug which caused Docker Desktop to fail when sharing file paths longer than 260 characters. Fixes [docker/for-win#5572](https://github.com/docker/for-win/issues/5572).
- Fixed an issue where some users were unable to start a container if there is a symlink in a shared volume. Fixes [docker/for-win#5582](https://github.com/docker/for-win/issues/5582).
- Fixed a bug where users were unable to modify the **Manual proxy configuration** settings through the Docker Desktop UI. Fixes [docker/for-win#5606](https://github.com/docker/for-win/issues/5606) and [docker/for-win#5548](https://github.com/docker/for-win/issues/5548).
- Fixed an issue where the Docker Desktop UI failed to start if the `no_proxy` environment variable has an entry that starts with a dot (.). Fixes [docker/for-win/5551](https://github.com/docker/for-win/issues/5551).
- Fixed a bug that did not allow users to access the Docker Desktop UI on machines with a policy preventing access to the Windows registry. Fixes [docker/for-win#5536](https://github.com/docker/for-win/issues/5536).
- Fixed an issue where disabling the WSL2 integration and re-enabling it later resulted in broken symlinks. Fixes [docker/for-win#5613](https://github.com/docker/for-win/issues/5613).
- Fixed a race condition when starting the WSL engine which caused Docker Desktop to incorrectly report that the containers have exited. Fixes [docker/for-win#5607](https://github.com/docker/for-win/issues/5607).
- Fixed an issue where editing code inside a container resulted in an error. Fixes [docker/for-win#5528](https://github.com/docker/for-win/issues/5528).
- Fixed a bug where running the command `DockerCli.exe -SharedDrives` failed to display a list of drives that are shared. Fixes [docker/for-win#5625](https://github.com/docker/for-win/issues/5625).
- Starting with Docker Desktop 2.2.0.3, you must access all shared files using their original case. For example, if you have created a file called `test`, you must open it as `test`. Attempts to open the file as `Test` will fail with the error `No such file or directory`. For more information, see _Tips on shared drives, permissions, and volume mounts_ in [File sharing](index.md#file-sharing).
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues-4 }
### 既知の問題
@z

@x
- DockerNAT has been removed from Docker Desktop 2.2.0.0 as using an IP address to communicate from the host to a container is not a supported feature. To communicate from a container to the host, you must use the special DNS name `host.docker.internal`. We also recommend using ports to communicate from the host to a container. For more information, see [Networking](/docker-for-win/networking/#use-cases-and-workarounds).
@y
- DockerNAT has been removed from Docker Desktop 2.2.0.0 as using an IP address to communicate from the host to a container is not a supported feature. To communicate from a container to the host, you must use the special DNS name `host.docker.internal`. We also recommend using ports to communicate from the host to a container. For more information, see [Networking](/docker-for-win/networking/#use-cases-and-workarounds).
@z

@x
  However, if your current setup relies on IP addresses for communication, you can use a temporary workaround to reinstate DockerNAT. To do this, open
`C:\Program Files\Docker\Docker\resources\MobyLinux.ps1` and add `$SwitchName = "DockerNAT"` between line 175 and 176. Note that the temporary workaround to reinstate DockerNAT may be removed from future releases.
- Directory junctions in shared volumes pointing outside the shared volume do not work.
- It is currently not possible to rename open files within shared volumes.
- In some cases, Docker containers do not synchronize time with the host when the host machine is put to sleep.
- It is not possible to use `localhost` in the proxy settings. You can instead use `host.docker.internal` to work around this issue.
@y
  However, if your current setup relies on IP addresses for communication, you can use a temporary workaround to reinstate DockerNAT. To do this, open
`C:\Program Files\Docker\Docker\resources\MobyLinux.ps1` and add `$SwitchName = "DockerNAT"` between line 175 and 176. Note that the temporary workaround to reinstate DockerNAT may be removed from future releases.
- Directory junctions in shared volumes pointing outside the shared volume do not work.
- It is currently not possible to rename open files within shared volumes.
- In some cases, Docker containers do not synchronize time with the host when the host machine is put to sleep.
- It is not possible to use `localhost` in the proxy settings. You can instead use `host.docker.internal` to work around this issue.
@z

@x
## Docker Desktop Community 2.2.0.0
2020-01-21
@y
## Docker Desktop Community 2.2.0.0
2020-01-21
@z

@x
Docker Desktop 2.2.0.0 contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after installing this version.
@y
Docker Desktop 2.2.0.0 contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after installing this version.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-8 }
### アップグレード
@z

@x
- [Docker Compose 1.25.2](https://github.com/docker/compose/releases/tag/1.25.2)
- [Kubernetes 1.15.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.15.5)
- Linux kernel 4.19.76
- [QEMU 4.0.1](https://github.com/docker/binfmt)
@y
- [Docker Compose 1.25.2](https://github.com/docker/compose/releases/tag/1.25.2)
- [Kubernetes 1.15.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.15.5)
- Linux kernel 4.19.76
- [QEMU 4.0.1](https://github.com/docker/binfmt)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-4 }
### 新機能
@z

@x
- **Docker Desktop Dashboard:** The new Docker Desktop **Dashboard** provides a user-friendly interface which enables you to interact with containers and applications, and manage the lifecycle of your applications directly from the UI. In addition, it allows you to access the logs, view container details, and monitor resource utilization to explore the container behavior.
For detailed information about the new Dashboard UI, see [Docker Desktop Dashboard](../desktop/dashboard.md).
@y
- **Docker Desktop Dashboard:** The new Docker Desktop **Dashboard** provides a user-friendly interface which enables you to interact with containers and applications, and manage the lifecycle of your applications directly from the UI. In addition, it allows you to access the logs, view container details, and monitor resource utilization to explore the container behavior.
For detailed information about the new Dashboard UI, see [Docker Desktop Dashboard](../desktop/dashboard.md).
@z

@x
- **WSL 2 backend:** The experimental Docker Desktop WSL 2 backend architecture introduces support for Kubernetes, provides an updated Docker daemon, offers VPN-friendly networking, and additional features. For more information, see [Docker Desktop WSL 2 backend](https://docs.docker.com/docker-for-windows/wsl/).
@y
- **WSL 2 backend:** The experimental Docker Desktop WSL 2 backend architecture introduces support for Kubernetes, provides an updated Docker daemon, offers VPN-friendly networking, and additional features. For more information, see [Docker Desktop WSL 2 backend](https://docs.docker.com/docker-for-windows/wsl/).
@z

@x
- **New file sharing implementation:** Docker Desktop introduces a new file sharing implementation that replaces Samba, CIFS, and Hyper-V networking. The new implementation  offers improved I/O performance. Additionally, when using the new file system:
@y
- **New file sharing implementation:** Docker Desktop introduces a new file sharing implementation that replaces Samba, CIFS, and Hyper-V networking. The new implementation  offers improved I/O performance. Additionally, when using the new file system:
@z

@x
  - Users don't have to expose the Samba port, and therefore do not experience issues related to IT firewall or drive-sharing policy.
  - There is no need to provide user credentials to Docker Desktop. File access rights are automatically enforced when accessing mounted folders through containers.
@y
  - Users don't have to expose the Samba port, and therefore do not experience issues related to IT firewall or drive-sharing policy.
  - There is no need to provide user credentials to Docker Desktop. File access rights are automatically enforced when accessing mounted folders through containers.
@z

@x
    For more information, see the blog post [ New file sharing implementation in Docker Desktop Windows](https://www.docker.com/blog/new-filesharing-implementation-in-docker-desktop-windows/).
@y
    For more information, see the blog post [ New file sharing implementation in Docker Desktop Windows](https://www.docker.com/blog/new-filesharing-implementation-in-docker-desktop-windows/).
@z

@x
- Added the **WSL Integration** option in **Settings** > **Resources** to select WSL 2 distributions. This option will be visible only after enabling WSL 2 on your machine.
- Introduced a new user interface for the Docker Desktop **Settings** menu.
- The Restart, Reset, and Uninstall options are now available on the **Troubleshoot** menu.
- Added the ability to start and stop existing Compose-based applications and view combined logs in the Docker Desktop **Dashboard** UI.
@y
- Added the **WSL Integration** option in **Settings** > **Resources** to select WSL 2 distributions. This option will be visible only after enabling WSL 2 on your machine.
- Introduced a new user interface for the Docker Desktop **Settings** menu.
- The Restart, Reset, and Uninstall options are now available on the **Troubleshoot** menu.
- Added the ability to start and stop existing Compose-based applications and view combined logs in the Docker Desktop **Dashboard** UI.
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-9 }
### バグフィックスとマイナーチェンジ
@z

@x
- Enabled Windows features such as Hyper-V and Containers during installation, thereby reducing the need for another restart after installation.
- Added support for `Expect: 100-continue` headers in the Docker API proxy. Some HTTP clients such as `curl` send this header when the payload is large, for example, when creating containers. Fixes [moby/moby#39693](https://github.com/moby/moby/issues/39693).
- Added a loading overlay to the **Settings** and **Troubleshoot** windows to prevent editing conflicts.
- Deactivated the **Reset Kubernetes** button when Kubernetes is not activated.
- Improved the navigation in **Settings** and **Troubleshoot** UI.
- Docker Machine is no longer included in the Docker Desktop installer. You can download it separately from the [Docker Machine releases](https://github.com/docker/machine/releases) page.
- Docker Desktop now automatically restarts after an update.
- Fixed an issue where Docker Desktop auto-start was not being disabled properly on some machines.
- Fixed a container start error when a container has more than one port with an arbitrary or not-yet-configured external port number. For example, `docker run -p 80 -p 443 nginx`). Fixes [docker/for-win#4935](https://github.com/docker/for-win/issues/4935) and [docker/compose#6998](https://github.com/docker/compose/issues/6998).
- Fixed an issue which caused Docker Desktop to crash when resetting to factory defaults while running Windows containers.
- Fixed multiple issues related to Fast Startup.
- Docker Desktop now supports `inotify` events on shared filesystems.
- Docker Desktop startup is now more reliable and does not clash with host firewall software.
- Fixed a rare issue that caused to Docker Desktop to crash with the error `Unable to stop Hyper-V VM: Cannot validate argument on parameter 'SwitchName'. The argument is null or empty.`
- Fixed a bug that caused a rare crash when uninstalling Docker Desktop.
- Fixed an issue that caused Docker Desktop to fail on startup when there is an incomplete Kubernetes config file.
- Fixed various stability issues.
@y
- Enabled Windows features such as Hyper-V and Containers during installation, thereby reducing the need for another restart after installation.
- Added support for `Expect: 100-continue` headers in the Docker API proxy. Some HTTP clients such as `curl` send this header when the payload is large, for example, when creating containers. Fixes [moby/moby#39693](https://github.com/moby/moby/issues/39693).
- Added a loading overlay to the **Settings** and **Troubleshoot** windows to prevent editing conflicts.
- Deactivated the **Reset Kubernetes** button when Kubernetes is not activated.
- Improved the navigation in **Settings** and **Troubleshoot** UI.
- Docker Machine is no longer included in the Docker Desktop installer. You can download it separately from the [Docker Machine releases](https://github.com/docker/machine/releases) page.
- Docker Desktop now automatically restarts after an update.
- Fixed an issue where Docker Desktop auto-start was not being disabled properly on some machines.
- Fixed a container start error when a container has more than one port with an arbitrary or not-yet-configured external port number. For example, `docker run -p 80 -p 443 nginx`). Fixes [docker/for-win#4935](https://github.com/docker/for-win/issues/4935) and [docker/compose#6998](https://github.com/docker/compose/issues/6998).
- Fixed an issue which caused Docker Desktop to crash when resetting to factory defaults while running Windows containers.
- Fixed multiple issues related to Fast Startup.
- Docker Desktop now supports `inotify` events on shared filesystems.
- Docker Desktop startup is now more reliable and does not clash with host firewall software.
- Fixed a rare issue that caused to Docker Desktop to crash with the error `Unable to stop Hyper-V VM: Cannot validate argument on parameter 'SwitchName'. The argument is null or empty.`
- Fixed a bug that caused a rare crash when uninstalling Docker Desktop.
- Fixed an issue that caused Docker Desktop to fail on startup when there is an incomplete Kubernetes config file.
- Fixed various stability issues.
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues-5 }
### 既知の問題
@z

@x
- When you start a Docker Compose application and then start a Docker App which has the same name as the Compose application, Docker Desktop displays only one application on the Dashboard. However, when you expand the application, containers that belong to both applications are displayed on the Dashboard.
- When you deploy a Docker App with multiple containers on Kubernetes, Docker Desktop displays each Pod as an application on the Dashboard.
- WSL 2 requires Windows 10 Insider Preview build 19018 or greater.
- The Dashboard stops updating when you switch the container mode between Linux and Windows. To work around this issue, close and reopen the Dashboard.
- The new gRPC FUSE file sharing implementation does not support connecting to new drives (for example, USB drives) added after Docker Desktop starts. If you would like to share the new drive in Docker Desktop, you must quit Docker Desktop and then start the application to refresh the list of drives in Settings.
- Sharing files from virtual drives created by `ImDisk Toolkit` does not work.
@y
- When you start a Docker Compose application and then start a Docker App which has the same name as the Compose application, Docker Desktop displays only one application on the Dashboard. However, when you expand the application, containers that belong to both applications are displayed on the Dashboard.
- When you deploy a Docker App with multiple containers on Kubernetes, Docker Desktop displays each Pod as an application on the Dashboard.
- WSL 2 requires Windows 10 Insider Preview build 19018 or greater.
- The Dashboard stops updating when you switch the container mode between Linux and Windows. To work around this issue, close and reopen the Dashboard.
- The new gRPC FUSE file sharing implementation does not support connecting to new drives (for example, USB drives) added after Docker Desktop starts. If you would like to share the new drive in Docker Desktop, you must quit Docker Desktop and then start the application to refresh the list of drives in Settings.
- Sharing files from virtual drives created by `ImDisk Toolkit` does not work.
@z

@x
## Docker Desktop Community 2.1.0.5
2019-11-18
@y
## Docker Desktop Community 2.1.0.5
2019-11-18
@z

@x
[Download](https://download.docker.com/win/stable/40693/Docker%20Desktop%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/40693/Docker%20Desktop%20Installer.exe)
@z

@x
Docker Desktop 2.1.0.5 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this version.
@y
Docker Desktop 2.1.0.5 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this version.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-9 }
### アップグレード
@z

@x
- [Docker 19.03.5](https://github.com/docker/docker-ce/releases/tag/v19.03.5)
- [Kubernetes 1.14.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.8)
- [Go 1.12.13](https://golang.org/doc/devel/release.html#go1.12)
@y
- [Docker 19.03.5](https://github.com/docker/docker-ce/releases/tag/v19.03.5)
- [Kubernetes 1.14.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.8)
- [Go 1.12.13](https://golang.org/doc/devel/release.html#go1.12)
@z

@x
## Docker Desktop Community 2.1.0.4
2019-10-21
@y
## Docker Desktop Community 2.1.0.4
2019-10-21
@z

@x
[Download](https://download.docker.com/win/stable/39773/Docker%20Desktop%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/39773/Docker%20Desktop%20Installer.exe)
@z

@x
Docker Desktop 2.1.0.4 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this version.
@y
Docker Desktop 2.1.0.4 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this version.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-10 }
### アップグレード
@z

@x
- [Docker 19.03.4](https://github.com/docker/docker-ce/releases/tag/v19.03.4)
- [Kubernetes 1.14.7](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.7)
- [Go 1.12.10](https://github.com/golang/go/issues?q=milestone%3AGo1.12.10+label%3ACherryPickApproved)
- [Kitematic 0.17.9](https://github.com/docker/kitematic/releases/tag/v0.17.9)
@y
- [Docker 19.03.4](https://github.com/docker/docker-ce/releases/tag/v19.03.4)
- [Kubernetes 1.14.7](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.7)
- [Go 1.12.10](https://github.com/golang/go/issues?q=milestone%3AGo1.12.10+label%3ACherryPickApproved)
- [Kitematic 0.17.9](https://github.com/docker/kitematic/releases/tag/v0.17.9)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-5 }
### 新機能
@z

@x
Docker Desktop now enables you to sign into Docker Hub using two-factor authentication. For more information, see [Two-factor authentication](index/#docker-hub).
@y
Docker Desktop now enables you to sign into Docker Hub using two-factor authentication. For more information, see [Two-factor authentication](index/#docker-hub).
@z

@x
## Docker Desktop Community 2.1.0.3
2019-09-16
@y
## Docker Desktop Community 2.1.0.3
2019-09-16
@z

@x
[Download](https://download.docker.com/win/stable/38240/Docker%20Desktop%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/38240/Docker%20Desktop%20Installer.exe)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-11 }
### アップグレード
@z

@x
- [Kitematic 0.17.8](https://github.com/docker/kitematic/releases/tag/v0.17.8)
@y
- [Kitematic 0.17.8](https://github.com/docker/kitematic/releases/tag/v0.17.8)
@z

@x
## Docker Desktop Community 2.1.0.2
2019-09-04
@y
## Docker Desktop Community 2.1.0.2
2019-09-04
@z

@x
[Download](https://download.docker.com/win/stable/37877/Docker%20Desktop%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/37877/Docker%20Desktop%20Installer.exe)
@z

@x
Docker Desktop 2.1.0.2 contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after installing this version.
@y
Docker Desktop 2.1.0.2 contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after installing this version.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-12 }
### アップグレード
@z

@x
- [Docker 19.03.2](https://github.com/docker/docker-ce/releases/tag/v19.03.2)
- [Kubernetes 1.14.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.6)
- [Go 1.12.9](https://github.com/golang/go/issues?q=milestone%3AGo1.12.9+label%3ACherryPickApproved)
- [Docker Machine 0.16.2](https://github.com/docker/machine/releases/tag/v0.16.2)
@y
- [Docker 19.03.2](https://github.com/docker/docker-ce/releases/tag/v19.03.2)
- [Kubernetes 1.14.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.6)
- [Go 1.12.9](https://github.com/golang/go/issues?q=milestone%3AGo1.12.9+label%3ACherryPickApproved)
- [Docker Machine 0.16.2](https://github.com/docker/machine/releases/tag/v0.16.2)
@z

@x
## Docker Desktop Community 2.1.0.1
2019-08-08
@y
## Docker Desktop Community 2.1.0.1
2019-08-08
@z

@x
[Download](https://download.docker.com/win/stable/37199/Docker%20Desktop%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/37199/Docker%20Desktop%20Installer.exe)
@z

@x
  Note that you must sign in and create a Docker ID in order to download Docker Desktop.
@y
  Note that you must sign in and create a Docker ID in order to download Docker Desktop.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-13 }
### アップグレード
@z

@x
* [Docker 19.03.1](https://github.com/docker/docker-ce/releases/tag/v19.03.1)
* [Docker Compose 1.24.1](https://github.com/docker/compose/releases/tag/1.24.1)
* [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.3)
* [Compose on Kubernetes 0.4.23](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.23)
* [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
* [linuxkit v0.7](https://github.com/linuxkit/linuxkit/releases/tag/v0.7)
* Linux Kernel 4.9.184
* [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
* [Qemu 4.0.0](https://github.com/docker/binfmt) for cross compiling for ARM
* [Alpine 3.10](https://alpinelinux.org/posts/Alpine-3.10.0-released.html)
* [Docker Credential Helpers 0.6.3](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.3)
@y
* [Docker 19.03.1](https://github.com/docker/docker-ce/releases/tag/v19.03.1)
* [Docker Compose 1.24.1](https://github.com/docker/compose/releases/tag/1.24.1)
* [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.3)
* [Compose on Kubernetes 0.4.23](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.23)
* [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
* [linuxkit v0.7](https://github.com/linuxkit/linuxkit/releases/tag/v0.7)
* Linux Kernel 4.9.184
* [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
* [Qemu 4.0.0](https://github.com/docker/binfmt) for cross compiling for ARM
* [Alpine 3.10](https://alpinelinux.org/posts/Alpine-3.10.0-released.html)
* [Docker Credential Helpers 0.6.3](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.3)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-6 }
### 新機能
@z

@x
* Selecting the ‘Experimental features’ checkbox in the Daemon, **Settings** menu turns on experimental features for Docker daemon and Docker CLI.
* Docker Desktop now checks for stored credentials at startup before attempting to mount any shared drives. This prompts users to reenter the credentials if they are invalid.
@y
* Selecting the ‘Experimental features’ checkbox in the Daemon, **Settings** menu turns on experimental features for Docker daemon and Docker CLI.
* Docker Desktop now checks for stored credentials at startup before attempting to mount any shared drives. This prompts users to reenter the credentials if they are invalid.
@z

@x
### Experimental
@y
### Experimental
@z

@x
> Experimental features provide early access to future product functionality. These features are intended for testing and feedback only as they may change between releases without warning or can be removed entirely from a future release. Experimental features must not be used in production environments. Docker does not offer support for experimental features.
@y
> Experimental features provide early access to future product functionality. These features are intended for testing and feedback only as they may change between releases without warning or can be removed entirely from a future release. Experimental features must not be used in production environments. Docker does not offer support for experimental features.
@z

@x
Docker Desktop Community 2.1.0.0 contains the following experimental features:
@y
Docker Desktop Community 2.1.0.0 contains the following experimental features:
@z

@x
* Docker App: Docker App is a CLI plugin that helps configure, share, and install applications. For more information, see [Working with Docker App](/app/working-with-app/).
* Docker Buildx: Docker Buildx is a CLI plugin for extended build capabilities with BuildKit. For more information, see [Working with Docker Buildx](/buildx/working-with-buildx/).
@y
* Docker App: Docker App is a CLI plugin that helps configure, share, and install applications. For more information, see [Working with Docker App](/app/working-with-app/).
* Docker Buildx: Docker Buildx is a CLI plugin for extended build capabilities with BuildKit. For more information, see [Working with Docker Buildx](/buildx/working-with-buildx/).
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-10 }
### バグフィックスとマイナーチェンジ
@z

@x
* Fixed PowerShell script signing issue that caused `AuthorizationManager check failed` errors on machines with strict group policies on PowerShell script signing. [docker/for-win#4376](https://github.com/docker/for-win/issues/4376)
* Fixed an issue where users were unable to start Docker Desktop after upgrading to version 2.1.0.0. [docker/for-win#4390](https://github.com/docker/for-win/issues/4390)
* Fixed an issue where attempts to upgrade Docker Desktop to version 2.1.0.0 sometimes failed with the error `value cannot be null`. [docker/for-win#4343](https://github.com/docker/for-win/issues/4343)
* Fixed an issue that caused the installer to hang when upgrading Docker Desktop to version 2.1.0.0. [docker/for-win#4387](https://github.com/docker/for-win/issues/4387)
* Improved the error messages displayed during VM lifecycle operations. [docker/for-win#4348](https://github.com/docker/for-win/issues/4348)
* Docker Desktop now supports a configurable user timeout for VMs on slower machines. [docker/for-win#4393](https://github.com/docker/for-win/issues/4393)
* Restricted the `cluster-admin` role on local Kubernetes cluster to `kube-system` namespace.
* Reduced the VM startup time. swap is not created every time a virtual machine boots.
* Fixed a bug which caused Windows to crash when a user cancels switching the version using Windows User Account Control (UAC) settings.
* Fixed an issue where Docker Desktop restarts when a user logs out of Windows and logs back in, which results in retaining the exported ports on containers.
* Fixed Kubernetes installation with VPNkit subnet.
* Fixed a bug where the process output was not redirected to stdout when gathering diagnostics on Windows, which sometimes resulted in a crash.
* Fixed race condition where Kubernetes sometimes fails to start after the app is restarted.
* The system tray icon now opens the Docker Desktop menu with left and right mouse button.
* When displaying the crash report window, Docker Desktop does not send a bugsnag crash report unless the user needs the report to upload diagnostics.
* Docker Desktop has removed the ability to log in using email address as a username as the Docker command line does not support this.
* For Linux containers on Windows (LCOW), the host must run Windows 10 Professional or Windows 10 Enterprise version 1809 or later.
* The **Send usage statistics** checkbox is selected by default in Docker Desktop for Windows Community. This option cannot be modified.
* Docker Desktop has added a new dialog box during startup which allows users to retry mounting a shared drive or remove it from the shared drives list after a failed attempt.
* Fixed the Kubernetes Delete operation of persistent volume claims on Windows.
* Docker Desktop now truncates UDP DNS responses which are over 512 bytes in size.
* Fixed a bug where Docker was not added to PATH after installation in some cases.
* Fixed port 8080 that was used on localhost when starting Kubernetes.
* Renamed the product from **Docker for Windows** to **Docker Desktop**.
* Fixed the **Create issue** link in the Diagnostics window.
* Fixed a bug related to service log collection in diagnostics.
* Docker Desktop now gathers `/etc/hosts` to help with diagnostics.
* Added the missing daemon options in Docker Engine 18.09.
* When two services have a common exposed port, Docker Desktop exposes the available ports for the second service.
* Fixed the UI lock when changing the Kubernetes state.
@y
* Fixed PowerShell script signing issue that caused `AuthorizationManager check failed` errors on machines with strict group policies on PowerShell script signing. [docker/for-win#4376](https://github.com/docker/for-win/issues/4376)
* Fixed an issue where users were unable to start Docker Desktop after upgrading to version 2.1.0.0. [docker/for-win#4390](https://github.com/docker/for-win/issues/4390)
* Fixed an issue where attempts to upgrade Docker Desktop to version 2.1.0.0 sometimes failed with the error `value cannot be null`. [docker/for-win#4343](https://github.com/docker/for-win/issues/4343)
* Fixed an issue that caused the installer to hang when upgrading Docker Desktop to version 2.1.0.0. [docker/for-win#4387](https://github.com/docker/for-win/issues/4387)
* Improved the error messages displayed during VM lifecycle operations. [docker/for-win#4348](https://github.com/docker/for-win/issues/4348)
* Docker Desktop now supports a configurable user timeout for VMs on slower machines. [docker/for-win#4393](https://github.com/docker/for-win/issues/4393)
* Restricted the `cluster-admin` role on local Kubernetes cluster to `kube-system` namespace.
* Reduced the VM startup time. swap is not created every time a virtual machine boots.
* Fixed a bug which caused Windows to crash when a user cancels switching the version using Windows User Account Control (UAC) settings.
* Fixed an issue where Docker Desktop restarts when a user logs out of Windows and logs back in, which results in retaining the exported ports on containers.
* Fixed Kubernetes installation with VPNkit subnet.
* Fixed a bug where the process output was not redirected to stdout when gathering diagnostics on Windows, which sometimes resulted in a crash.
* Fixed race condition where Kubernetes sometimes fails to start after the app is restarted.
* The system tray icon now opens the Docker Desktop menu with left and right mouse button.
* When displaying the crash report window, Docker Desktop does not send a bugsnag crash report unless the user needs the report to upload diagnostics.
* Docker Desktop has removed the ability to log in using email address as a username as the Docker command line does not support this.
* For Linux containers on Windows (LCOW), the host must run Windows 10 Professional or Windows 10 Enterprise version 1809 or later.
* The **Send usage statistics** checkbox is selected by default in Docker Desktop for Windows Community. This option cannot be modified.
* Docker Desktop has added a new dialog box during startup which allows users to retry mounting a shared drive or remove it from the shared drives list after a failed attempt.
* Fixed the Kubernetes Delete operation of persistent volume claims on Windows.
* Docker Desktop now truncates UDP DNS responses which are over 512 bytes in size.
* Fixed a bug where Docker was not added to PATH after installation in some cases.
* Fixed port 8080 that was used on localhost when starting Kubernetes.
* Renamed the product from **Docker for Windows** to **Docker Desktop**.
* Fixed the **Create issue** link in the Diagnostics window.
* Fixed a bug related to service log collection in diagnostics.
* Docker Desktop now gathers `/etc/hosts` to help with diagnostics.
* Added the missing daemon options in Docker Engine 18.09.
* When two services have a common exposed port, Docker Desktop exposes the available ports for the second service.
* Fixed the UI lock when changing the Kubernetes state.
@z

@x
### Docker Community Edition 2.0.0.3 2019-02-15
@y
### Docker Community Edition 2.0.0.3 2019-02-15
@z

@x
[Download](https://download.docker.com/win/stable/31259/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/31259/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 18.09.2](https://github.com/docker/docker-ce/releases/tag/v18.09.2), fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
@y
* Upgrades
  - [Docker 18.09.2](https://github.com/docker/docker-ce/releases/tag/v18.09.2), fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
@z

@x
* Bug fix
  - Fix crash in system tray menu when the Hub login fails or Air gap mode
@y
* Bug fix
  - Fix crash in system tray menu when the Hub login fails or Air gap mode
@z

@x
### Docker Community Edition 2.0.0.2 2019-01-16
@y
### Docker Community Edition 2.0.0.2 2019-01-16
@z

@x
[Download](https://download.docker.com/win/stable/30215/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/30215/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 18.09.1](https://github.com/docker/docker-ce/releases/tag/v18.09.1)
  - [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
  - [Kubernetes 1.10.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.10.md#v11011), fixes [CVE-2018-1002105](https://github.com/kubernetes/kubernetes/issues/71411)
  - [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
  - Golang 1.10.6, fixes CVEs: [CVE-2018-16875](https://www.cvedetails.com/cve/CVE-2018-16875), [CVE-2018-16873](https://www.cvedetails.com/cve/CVE-2018-16873) and [CVE-2018-16874](https://www.cvedetails.com/cve/CVE-2018-16874)
  - Windows 14393 is marked as deprecated ; it will not be supported anymore in the next major stable release (2.1.0.0 and further)
@y
* Upgrades
  - [Docker 18.09.1](https://github.com/docker/docker-ce/releases/tag/v18.09.1)
  - [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
  - [Kubernetes 1.10.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.10.md#v11011), fixes [CVE-2018-1002105](https://github.com/kubernetes/kubernetes/issues/71411)
  - [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
  - Golang 1.10.6, fixes CVEs: [CVE-2018-16875](https://www.cvedetails.com/cve/CVE-2018-16875), [CVE-2018-16873](https://www.cvedetails.com/cve/CVE-2018-16873) and [CVE-2018-16874](https://www.cvedetails.com/cve/CVE-2018-16874)
  - Windows 14393 is marked as deprecated ; it will not be supported anymore in the next major stable release (2.1.0.0 and further)
@z

@x
* Bug fixes and minor changes
  - Rename Docker for Windows to Docker Desktop
  - Add 18.09 missing daemon options
@y
* Bug fixes and minor changes
  - Rename Docker for Windows to Docker Desktop
  - Add 18.09 missing daemon options
@z

@x
## Stable Releases of 2018
@y
## Stable Releases of 2018
@z

@x
### Docker Community Edition 2.0.0.0-win81 2018-12-07
@y
### Docker Community Edition 2.0.0.0-win81 2018-12-07
@z

@x
[Download](https://download.docker.com/win/stable/29211/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/29211/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker compose 1.23.2](https://github.com/docker/compose/releases/tag/1.23.2)
@y
* Upgrades
  - [Docker compose 1.23.2](https://github.com/docker/compose/releases/tag/1.23.2)
@z

@x
* Bug fixes and minor changes
  - Compose: Fixed a bug where build context URLs would fail to build on Windows. Fixes [docker/for-win#2918](https://github.com/docker/for-win/issues/2918)
@y
* Bug fixes and minor changes
  - Compose: Fixed a bug where build context URLs would fail to build on Windows. Fixes [docker/for-win#2918](https://github.com/docker/for-win/issues/2918)
@z

@x
### Docker Community Edition 2.0.0.0-win78 2018-11-19
@y
### Docker Community Edition 2.0.0.0-win78 2018-11-19
@z

@x
[Download](https://download.docker.com/win/stable/28905/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/28905/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 18.09.0](https://github.com/docker/docker-ce-packaging/releases/tag/v18.09.0)
  - [Docker compose 1.23.1](https://github.com/docker/compose/releases/tag/1.23.1)
  - [Docker Machine 0.16.0](https://github.com/docker/machine/releases/tag/v0.16.0)
  - [Kitematic 0.17.5](https://github.com/docker/kitematic/releases/tag/v0.17.5)
  - Linux Kernel 4.9.125
@y
* Upgrades
  - [Docker 18.09.0](https://github.com/docker/docker-ce-packaging/releases/tag/v18.09.0)
  - [Docker compose 1.23.1](https://github.com/docker/compose/releases/tag/1.23.1)
  - [Docker Machine 0.16.0](https://github.com/docker/machine/releases/tag/v0.16.0)
  - [Kitematic 0.17.5](https://github.com/docker/kitematic/releases/tag/v0.17.5)
  - Linux Kernel 4.9.125
@z

@x
* New
  - New version scheme
@y
* New
  - New version scheme
@z

@x
* Deprecation
  - Removed support of AUFS
@y
* Deprecation
  - Removed support of AUFS
@z

@x
* Bug fixes and minor changes
  - Windows Containers: Fix group daemon option settings. Fixes [docker/for-win#2647](https://github.com/docker/for-win/issues/2647)
  - Windows Containers: Better host.docker.internal resolution, don't rewrite it if not modified. From [docker/for-win#1976](https://github.com/docker/for-win/issues/1976)
  - Do not try to update samba share mounts when using Windows Containers
  - Improved dns update too verbose in logs
  - VPNKit: Improved scalability of port forwarding.
  - VPNKit: Limit the size of the UDP NAT table. This ensures port forwarding and regular TCP traffic continue even when running very chatty UDP protocols.
  - LCOW does not need --platform flag on multi-arch images any more
  - Disk size can now be ajusted from 32GiB to drive space.
  - Fix dns update too verbose in logs
  - Fix panic in diagnose
@y
* Bug fixes and minor changes
  - Windows Containers: Fix group daemon option settings. Fixes [docker/for-win#2647](https://github.com/docker/for-win/issues/2647)
  - Windows Containers: Better host.docker.internal resolution, don't rewrite it if not modified. From [docker/for-win#1976](https://github.com/docker/for-win/issues/1976)
  - Do not try to update samba share mounts when using Windows Containers
  - Improved dns update too verbose in logs
  - VPNKit: Improved scalability of port forwarding.
  - VPNKit: Limit the size of the UDP NAT table. This ensures port forwarding and regular TCP traffic continue even when running very chatty UDP protocols.
  - LCOW does not need --platform flag on multi-arch images any more
  - Disk size can now be ajusted from 32GiB to drive space.
  - Fix dns update too verbose in logs
  - Fix panic in diagnose
@z

@x
### Docker Community Edition 18.06.1-ce-win73 2018-08-29
@y
### Docker Community Edition 18.06.1-ce-win73 2018-08-29
@z

@x
[Download](https://download.docker.com/win/stable/19507/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/19507/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 18.06.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.1-ce)
@y
* Upgrades
  - [Docker 18.06.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.1-ce)
@z

@x
* Bug fixes and minor changes
  - Fix bug in VM activity detection, preventing Docker Desktop from starting. Fixes [docker/for-win#2404](https://github.com/docker/for-win/issues/2404)
  - Fix bug in detection when Windows service is not running, and propose to restart the service.
  - Fix local DNS failing to resolve inside containers. Fixes [docker/for-win#2301](https://github.com/docker/for-win/issues/2301), [docker/for-win#2304](https://github.com/docker/for-win/issues/2304)
  - Fix Kubernetes status display after reset to factory default
  - Fix bug where `host.docker.internal` is not resolved in some cases. Fixes [docker/for-win#2402](https://github.com/docker/for-win/issues/2402)
  - Use a 1MB vhdx blocksize instead of the default 32MB. See [docker/for-win#244](https://github.com/docker/for-win/issues/244). Also see [Microsoft Best Practices for running Linux on Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/best-practices-for-running-linux-on-hyper-v)
  - Fix diagnostics in specific cases when the Windows service is not started.
  - Changed the samba default file permission to avoid an issue with too open rights. Fixes [docker/for-win#2170](https://github.com/docker/for-win/issues/2170)
  - On RS5 insider, fixed wrong detection of missing feature "Containers" requiring you to install the feature and then reboot.
@y
* Bug fixes and minor changes
  - Fix bug in VM activity detection, preventing Docker Desktop from starting. Fixes [docker/for-win#2404](https://github.com/docker/for-win/issues/2404)
  - Fix bug in detection when Windows service is not running, and propose to restart the service.
  - Fix local DNS failing to resolve inside containers. Fixes [docker/for-win#2301](https://github.com/docker/for-win/issues/2301), [docker/for-win#2304](https://github.com/docker/for-win/issues/2304)
  - Fix Kubernetes status display after reset to factory default
  - Fix bug where `host.docker.internal` is not resolved in some cases. Fixes [docker/for-win#2402](https://github.com/docker/for-win/issues/2402)
  - Use a 1MB vhdx blocksize instead of the default 32MB. See [docker/for-win#244](https://github.com/docker/for-win/issues/244). Also see [Microsoft Best Practices for running Linux on Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/best-practices-for-running-linux-on-hyper-v)
  - Fix diagnostics in specific cases when the Windows service is not started.
  - Changed the samba default file permission to avoid an issue with too open rights. Fixes [docker/for-win#2170](https://github.com/docker/for-win/issues/2170)
  - On RS5 insider, fixed wrong detection of missing feature "Containers" requiring you to install the feature and then reboot.
@z

@x
### Docker Community Edition 18.06.0-ce-win72 2018-07-26
@y
### Docker Community Edition 18.06.0-ce-win72 2018-07-26
@z

@x
[Download](https://download.docker.com/win/stable/19098/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/19098/Docker%20for%20Windows%20Installer.exe)
@z

@x
* New
  - Renewed signing certificate. The installer may show a Windows Defender popup until the renewed certificate is whitelisted. Click "More info" to view the app is published by "Docker Inc" and run it.
@y
* New
  - Renewed signing certificate. The installer may show a Windows Defender popup until the renewed certificate is whitelisted. Click "More info" to view the app is published by "Docker Inc" and run it.
@z

@x
* Bug fixes and minor changes
  - Fix bug in automatic feature enabling if "Hyper-V" and "Containers" Windows features are not enabled already when starting Docker Desktop.
@y
* Bug fixes and minor changes
  - Fix bug in automatic feature enabling if "Hyper-V" and "Containers" Windows features are not enabled already when starting Docker Desktop.
@z

@x
### Docker Community Edition 18.06.0-ce-win70 2018-07-25
@y
### Docker Community Edition 18.06.0-ce-win70 2018-07-25
@z

@x
[Download](https://download.docker.com/win/stable/19075/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/19075/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
  - [LinuxKit v0.4](https://github.com/linuxkit/linuxkit/releases/tag/v0.4)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled
@y
* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
  - [LinuxKit v0.4](https://github.com/linuxkit/linuxkit/releases/tag/v0.4)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled
@z

@x
* New
  - Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker for Windows settings and use kubectl commands as well as Docker commands. See https://docs.docker.com/docker-for-windows/kubernetes/
@y
* New
  - Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker for Windows settings and use kubectl commands as well as Docker commands. See https://docs.docker.com/docker-for-windows/kubernetes/
@z

@x
* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset the disk image (in Settings > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - Fix bug which would in some cases cause virtual machine logs to be written to RAM rather than disk, and the virtual machine to hang.
  - Fix security issue with named pipe connection to docker service.
  - Fix VPNKit memory leak. Fixes [docker/for-win#2087](https://github.com/docker/for-win/issues/2087), [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Fix restart issue when using Windows fast startup on latest 1709 Windows updates. Fixes [docker/for-win#1741](https://github.com/docker/for-win/issues/1741), [docker/for-win#1741](https://github.com/docker/for-win/issues/1741)
  - DNS name `host.docker.internal` can be used for host resolution from Windows Containers.  Fixes [docker/for-win#1976](https://github.com/docker/for-win/issues/1976)
  - Fix broken link in diagnostics window.
  - Added log rotation for docker-ce logs inside the virtual machine.
  - Changed smb permission to avoid issue when trying to manipulate files with different users in containers. Fixes [docker/for-win#2170](https://github.com/docker/for-win/issues/2170)
@y
* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset the disk image (in Settings > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - Fix bug which would in some cases cause virtual machine logs to be written to RAM rather than disk, and the virtual machine to hang.
  - Fix security issue with named pipe connection to docker service.
  - Fix VPNKit memory leak. Fixes [docker/for-win#2087](https://github.com/docker/for-win/issues/2087), [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Fix restart issue when using Windows fast startup on latest 1709 Windows updates. Fixes [docker/for-win#1741](https://github.com/docker/for-win/issues/1741), [docker/for-win#1741](https://github.com/docker/for-win/issues/1741)
  - DNS name `host.docker.internal` can be used for host resolution from Windows Containers.  Fixes [docker/for-win#1976](https://github.com/docker/for-win/issues/1976)
  - Fix broken link in diagnostics window.
  - Added log rotation for docker-ce logs inside the virtual machine.
  - Changed smb permission to avoid issue when trying to manipulate files with different users in containers. Fixes [docker/for-win#2170](https://github.com/docker/for-win/issues/2170)
@z

@x
### Docker Community Edition 18.03.1-ce-win65 2018-04-30
@y
### Docker Community Edition 18.03.1-ce-win65 2018-04-30
@z

@x
[Download](https://download.docker.com/win/stable/17513/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/17513/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.1](https://github.com/docker/compose/releases/tag/1.21.1)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@y
* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.1](https://github.com/docker/compose/releases/tag/1.21.1)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@z

@x
* Bug fixes and minor changes
  - Fix startup failure when the HOME environment variable is already defined (typically started from the command line). Fixes [docker/for-win#1880](https://github.com/docker/for-win/issues/1880)
  - Fix startup failure due to incompatibility with other programs (like Razer Synapse 3). Fixes [docker/for-win#1723](https://github.com/docker/for-win/issues/1723)
@y
* Bug fixes and minor changes
  - Fix startup failure when the HOME environment variable is already defined (typically started from the command line). Fixes [docker/for-win#1880](https://github.com/docker/for-win/issues/1880)
  - Fix startup failure due to incompatibility with other programs (like Razer Synapse 3). Fixes [docker/for-win#1723](https://github.com/docker/for-win/issues/1723)
@z

@x
### Docker Community Edition 18.03.1-ce-win64 2018-04-26
@y
### Docker Community Edition 18.03.1-ce-win64 2018-04-26
@z

@x
[Download](https://download.docker.com/win/stable/17438/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/17438/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.0](https://github.com/docker/compose/releases/tag/1.21.0)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@y
* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.0](https://github.com/docker/compose/releases/tag/1.21.0)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@z

@x
* Bug fixes and minor changes
  - Fix startup failure when the HOME environment variable is already defined (typically started from the command line). Fixes [docker/for-win#1880](https://github.com/docker/for-win/issues/1880)
  - Fix startup failure due to incompatibility with other programs (like Razer Synapse 3). Fixes [docker/for-win#1723](https://github.com/docker/for-win/issues/1723)
@y
* Bug fixes and minor changes
  - Fix startup failure when the HOME environment variable is already defined (typically started from the command line). Fixes [docker/for-win#1880](https://github.com/docker/for-win/issues/1880)
  - Fix startup failure due to incompatibility with other programs (like Razer Synapse 3). Fixes [docker/for-win#1723](https://github.com/docker/for-win/issues/1723)
@z

@x
### Docker Community Edition 18.03.0-ce-win59 2018-03-26
@y
### Docker Community Edition 18.03.0-ce-win59 2018-03-26
@z

@x
[Download](https://download.docker.com/win/stable/16762/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/16762/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 18.03.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce)
  - [Docker Machine 0.14.0](https://github.com/docker/machine/releases/tag/v0.14.0)
  - [Docker compose 1.20.1](https://github.com/docker/compose/releases/tag/1.20.1)
  - [Notary 0.6.0](https://github.com/docker/notary/releases/tag/v0.6.0)
  - Linux Kernel 4.9.87
  - AUFS 20180312
@y
* Upgrades
  - [Docker 18.03.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce)
  - [Docker Machine 0.14.0](https://github.com/docker/machine/releases/tag/v0.14.0)
  - [Docker compose 1.20.1](https://github.com/docker/compose/releases/tag/1.20.1)
  - [Notary 0.6.0](https://github.com/docker/notary/releases/tag/v0.6.0)
  - Linux Kernel 4.9.87
  - AUFS 20180312
@z

@x
* New
  - Virtual machine disk size can be changed in settings. Fixes [docker/for-win#105](https://github.com/docker/for-win/issues/105)
  - Virtual machine swap size can be changed in settings.
  - New menu item to restart Docker.
  - Support NFS Volume sharing. See [docker/for-win#1700](https://github.com/docker/for-win/issues/1700)
  - Allow to activate Windows Containers during installation (avoid virtual machine disk creation and virtual machine boot when working only on Windows containers). See [docker/for-win#217](https://github.com/docker/for-win/issues/217).
  - Experimental feature: LCOW containers can now be run next to Windows containers (on Windows RS3 build 16299 and later). Use `--platform=linux` in Windows container mode to run Linux Containers On Windows. Note that LCOW is experimental; it requires the daemon `experimental` option.
@y
* New
  - Virtual machine disk size can be changed in settings. Fixes [docker/for-win#105](https://github.com/docker/for-win/issues/105)
  - Virtual machine swap size can be changed in settings.
  - New menu item to restart Docker.
  - Support NFS Volume sharing. See [docker/for-win#1700](https://github.com/docker/for-win/issues/1700)
  - Allow to activate Windows Containers during installation (avoid virtual machine disk creation and virtual machine boot when working only on Windows containers). See [docker/for-win#217](https://github.com/docker/for-win/issues/217).
  - Experimental feature: LCOW containers can now be run next to Windows containers (on Windows RS3 build 16299 and later). Use `--platform=linux` in Windows container mode to run Linux Containers On Windows. Note that LCOW is experimental; it requires the daemon `experimental` option.
@z

@x
* Bug fixes and minor changes
  - Fix Windows Containers port forwarding on Windows 10 build 16299 post KB4074588. Fixes [docker/for-win#1707](https://github.com/docker/for-win/issues/1707), [docker/for-win#1737](https://github.com/docker/for-win/issues/1737)
  - Fix daemon not starting properly when setting TLS-related options.
  - DNS name `host.docker.internal` shoud be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Fix for the HTTP/S transparent proxy when using "localhost" names (for example, `host.docker.internal`). Fixes [docker/for-win#1130](https://github.com/docker/for-win/issues/1130)
  - Fix Linuxkit start on Windows RS4 Insider. Fixes [docker/for-win#1458](https://github.com/docker/for-win/issues/1458), [docker/for-win#1514](https://github.com/docker/for-win/issues/1514), [docker/for-win#1640](https://github.com/docker/for-win/issues/1640)
  - Fix risk of privilege escalation. (https://www.tenable.com/sc-report-templates/microsoft-windows-unquoted-service-path-vulnerability)
  - All users present in the docker-users group are now able to use Docker. Fixes [docker/for-win#1732](https://github.com/docker/for-win/issues/1732)
  - Migration of Docker Toolbox images is not proposed in Docker For Windows installer (still possible to [migrate Toolbox images manually](https://docs.docker.com/docker-for-windows/docker-toolbox/) ).
  - Better cleanup for Windows containers and images on reset/uninstall. Fixes [docker/for-win#1580](https://github.com/docker/for-win/issues/1580), [docker/for-win#1544](https://github.com/docker/for-win/issues/1544), [docker/for-win#191](https://github.com/docker/for-win/issues/191)
  - Desktop icon creation is optional in installer; do not recreate Desktop icon on upgrade (effective on next upgrade). Fixes [docker/for-win#246](https://github.com/docker/for-win/issues/246), [docker/for-win#925](https://github.com/docker/for-win/issues/925), [docker/for-win#1551](https://github.com/docker/for-win/issues/1551)
@y
* Bug fixes and minor changes
  - Fix Windows Containers port forwarding on Windows 10 build 16299 post KB4074588. Fixes [docker/for-win#1707](https://github.com/docker/for-win/issues/1707), [docker/for-win#1737](https://github.com/docker/for-win/issues/1737)
  - Fix daemon not starting properly when setting TLS-related options.
  - DNS name `host.docker.internal` shoud be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Fix for the HTTP/S transparent proxy when using "localhost" names (for example, `host.docker.internal`). Fixes [docker/for-win#1130](https://github.com/docker/for-win/issues/1130)
  - Fix Linuxkit start on Windows RS4 Insider. Fixes [docker/for-win#1458](https://github.com/docker/for-win/issues/1458), [docker/for-win#1514](https://github.com/docker/for-win/issues/1514), [docker/for-win#1640](https://github.com/docker/for-win/issues/1640)
  - Fix risk of privilege escalation. (https://www.tenable.com/sc-report-templates/microsoft-windows-unquoted-service-path-vulnerability)
  - All users present in the docker-users group are now able to use Docker. Fixes [docker/for-win#1732](https://github.com/docker/for-win/issues/1732)
  - Migration of Docker Toolbox images is not proposed in Docker For Windows installer (still possible to [migrate Toolbox images manually](https://docs.docker.com/docker-for-windows/docker-toolbox/) ).
  - Better cleanup for Windows containers and images on reset/uninstall. Fixes [docker/for-win#1580](https://github.com/docker/for-win/issues/1580), [docker/for-win#1544](https://github.com/docker/for-win/issues/1544), [docker/for-win#191](https://github.com/docker/for-win/issues/191)
  - Desktop icon creation is optional in installer; do not recreate Desktop icon on upgrade (effective on next upgrade). Fixes [docker/for-win#246](https://github.com/docker/for-win/issues/246), [docker/for-win#925](https://github.com/docker/for-win/issues/925), [docker/for-win#1551](https://github.com/docker/for-win/issues/1551)
@z

@x
### Docker Community Edition 17.12.0-ce-win47 2018-01-12
@y
### Docker Community Edition 17.12.0-ce-win47 2018-01-12
@z

@x
[Download](https://download.docker.com/win/stable/15139/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/15139/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Bug fixes and minor changes
  - Fix linuxkit port-forwarder sometimes not being able to start. Fixes [docker/for-win#1506](https://github.com/docker/for-win/issues/1506)
  - Fix certificate management when connecting to a private registry. Fixes [docker/for-win#1512](https://github.com/docker/for-win/issues/1512)
  - Fix Mount compatibility when mounting drives with `-v //c/...`, now mounted in /host_mnt/c in the linuxkit virtual machine. Fixes [docker/for-win#1509](https://github.com/docker/for-win/issues/1509), [docker/for-win#1516](https://github.com/docker/for-win/issues/1516), [docker/for-win#1497](https://github.com/docker/for-win/issues/1497)
  - Fix icon displaying edge. Fixes [docker/for-win#1508](https://github.com/docker/for-win/issues/1508)
@y
* Bug fixes and minor changes
  - Fix linuxkit port-forwarder sometimes not being able to start. Fixes [docker/for-win#1506](https://github.com/docker/for-win/issues/1506)
  - Fix certificate management when connecting to a private registry. Fixes [docker/for-win#1512](https://github.com/docker/for-win/issues/1512)
  - Fix Mount compatibility when mounting drives with `-v //c/...`, now mounted in /host_mnt/c in the linuxkit virtual machine. Fixes [docker/for-win#1509](https://github.com/docker/for-win/issues/1509), [docker/for-win#1516](https://github.com/docker/for-win/issues/1516), [docker/for-win#1497](https://github.com/docker/for-win/issues/1497)
  - Fix icon displaying edge. Fixes [docker/for-win#1508](https://github.com/docker/for-win/issues/1508)
@z

@x
### Docker Community Edition 17.12.0-ce-win46 2018-01-09
@y
### Docker Community Edition 17.12.0-ce-win46 2018-01-09
@z

@x
[Download](https://download.docker.com/win/stable/15048/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/15048/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - Linux Kernel 4.9.60
@y
* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - Linux Kernel 4.9.60
@z

@x
* New
  - Virtual machine entirely built with linuxkit
  - Add localhost port forwarder for Windows (thanks @simonferquel). Use Microsoft localhost port forwarder when it is available (insider build RS4).
@y
* New
  - Virtual machine entirely built with linuxkit
  - Add localhost port forwarder for Windows (thanks @simonferquel). Use Microsoft localhost port forwarder when it is available (insider build RS4).
@z

@x
* Bug fixes and minor changes
  - Display various component versions in About box.
  - Fix vpnkit issue when username has spaces. See [docker/for-win#1429](https://github.com/docker/for-win/issues/1429)
  - Diagnostic improvements to get VM logs before VM shutdown.
  - Fix installer check for not supported Windows `CoreCountrySpecific` Edition.
  - Fix a class of startup failures where the database fails to start. See [docker/for-win#498](https://github.com/docker/for-win/issues/498)
  - Links in update changelog now open the default browser instead of IE. (fixes [docker/for-win#1311](https://github.com/docker/for-win/issues/1311))
@y
* Bug fixes and minor changes
  - Display various component versions in About box.
  - Fix vpnkit issue when username has spaces. See [docker/for-win#1429](https://github.com/docker/for-win/issues/1429)
  - Diagnostic improvements to get VM logs before VM shutdown.
  - Fix installer check for not supported Windows `CoreCountrySpecific` Edition.
  - Fix a class of startup failures where the database fails to start. See [docker/for-win#498](https://github.com/docker/for-win/issues/498)
  - Links in update changelog now open the default browser instead of IE. (fixes [docker/for-win#1311](https://github.com/docker/for-win/issues/1311))
@z

@x
## Stable Releases of 2017
@y
## Stable Releases of 2017
@z

@x
### Docker Community Edition 17.09.1-ce-win42 2017-12-11
@y
### Docker Community Edition 17.09.1-ce-win42 2017-12-11
@z

@x
[Download](https://download.docker.com/win/stable/14687/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/14687/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 17.09.1-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.1-ce)
  - [Docker compose 1.17.1](https://github.com/docker/compose/releases/tag/1.17.1)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
@y
* Upgrades
  - [Docker 17.09.1-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.1-ce)
  - [Docker compose 1.17.1](https://github.com/docker/compose/releases/tag/1.17.1)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
@z

@x
* Bug fixes and minor changes
  - Fix bug during Windows fast-startup process. Fixes [for-win/#953](https://github.com/docker/for-win/issues/953)
  - Fix uninstaller issue (in some specific cases dockerd process was not killed properly)
  - Fix Net Promoter Score Gui bug. Fixes [for-win/#1277](https://github.com/docker/for-win/issues/1277)
  - Fix `docker.for.win.localhost` not working in proxy settings. Fixes [for-win/#1130](https://github.com/docker/for-win/issues/1130)
  - Increased timeout for virtual machine boot startup to 2 minutes.
@y
* Bug fixes and minor changes
  - Fix bug during Windows fast-startup process. Fixes [for-win/#953](https://github.com/docker/for-win/issues/953)
  - Fix uninstaller issue (in some specific cases dockerd process was not killed properly)
  - Fix Net Promoter Score Gui bug. Fixes [for-win/#1277](https://github.com/docker/for-win/issues/1277)
  - Fix `docker.for.win.localhost` not working in proxy settings. Fixes [for-win/#1130](https://github.com/docker/for-win/issues/1130)
  - Increased timeout for virtual machine boot startup to 2 minutes.
@z

@x
### Docker Community Edition 17.09.0-ce-win33 2017-10-06
@y
### Docker Community Edition 17.09.0-ce-win33 2017-10-06
@z

@x
[Download](https://download.docker.com/win/stable/13620/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/13620/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Bug fixes
  - Fix Docker For Windows unable to start in some cases: removed use of libgmp sometimes causing the vpnkit process to die.
@y
* Bug fixes
  - Fix Docker For Windows unable to start in some cases: removed use of libgmp sometimes causing the vpnkit process to die.
@z

@x
### Docker Community Edition 17.09.0-ce-win32 2017-10-02
@y
### Docker Community Edition 17.09.0-ce-win32 2017-10-02
@z

@x
[Download](https://download.docker.com/win/stable/13529/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/13529/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker Compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
@y
* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker Compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
@z

@x
* New
  - Windows Docker daemon is now started as service for better lifecycle management
  - Store Linux daemon configuration in ~\.docker\daemon.json instead of settings file
  - Store Windows daemon configuration in C:\ProgramData\Docker\config\daemon.json instead of settings file
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Add `Skip This Version` button in update window
@y
* New
  - Windows Docker daemon is now started as service for better lifecycle management
  - Store Linux daemon configuration in ~\.docker\daemon.json instead of settings file
  - Store Windows daemon configuration in C:\ProgramData\Docker\config\daemon.json instead of settings file
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Add `Skip This Version` button in update window
@z

@x
* Security fixes
  - VPNKit: security fix to reduce the risk of DNS cache poisoning attack (reported by Hannes Mehnert https://hannes.nqsb.io/)
@y
* Security fixes
  - VPNKit: security fix to reduce the risk of DNS cache poisoning attack (reported by Hannes Mehnert https://hannes.nqsb.io/)
@z

@x
* Bug fixes and minor changes
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING
  - Rotate logs in the virtual machine more often (docker/for-win#244)
  - Reset to default stops all engines and removes settings including all daemon.json files
  - Better backend service checks (related to https://github.com/docker/for-win/issues/953)
  - Fix auto updates checkbox, no need to restart the application
  - Fix check for updates menu when auto updates was disable
  - VPNKit: do not block startup when ICMP permission is denied. (Fixes docker/for-win#1036, docker/for-win#1035, docker/for-win#1040)
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the UNIX domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Do not move credentials into the credential store at startup
@y
* Bug fixes and minor changes
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING
  - Rotate logs in the virtual machine more often (docker/for-win#244)
  - Reset to default stops all engines and removes settings including all daemon.json files
  - Better backend service checks (related to https://github.com/docker/for-win/issues/953)
  - Fix auto updates checkbox, no need to restart the application
  - Fix check for updates menu when auto updates was disable
  - VPNKit: do not block startup when ICMP permission is denied. (Fixes docker/for-win#1036, docker/for-win#1035, docker/for-win#1040)
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the UNIX domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Do not move credentials into the credential store at startup
@z

@x
### Docker Community Edition 17.06.2-ce-win27 2017-09-06
@y
### Docker Community Edition 17.06.2-ce-win27 2017-09-06
@z

@x
[Download](https://download.docker.com/win/stable/13194/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/13194/Docker%20for%20Windows%20Installer.exe)
@z

@x
* Upgrades
  - [Docker 17.06.2-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.2-ce)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
@y
* Upgrades
  - [Docker 17.06.2-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.2-ce)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
@z

@x
### Docker Community Edition 17.06.1-ce-rc1-win24 2017-08-24
@y
### Docker Community Edition 17.06.1-ce-rc1-win24 2017-08-24
@z

@x
[Download](https://download.docker.com/win/stable/13025/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/13025/Docker%20for%20Windows%20Installer.exe)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.1-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce-rc1)
- Linux Kernel 4.9.36
- AUFS 20170703
@y
- [Docker 17.06.1-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce-rc1)
- Linux Kernel 4.9.36
- AUFS 20170703
@z

@x
**Bug fixes and minor**
@y
**Bug fixes and minor**
@z

@x
- Fix locked container id file (Fixes [docker/for-win#818](https://github.com/docker/for-win/issues/818))
- Avoid expanding variables in PATH env variable (Fixes [docker/for-win#859](https://github.com/docker/for-win/issues/859))
@y
- Fix locked container id file (Fixes [docker/for-win#818](https://github.com/docker/for-win/issues/818))
- Avoid expanding variables in PATH env variable (Fixes [docker/for-win#859](https://github.com/docker/for-win/issues/859))
@z

@x
### Docker Community Edition 17.06.0-ce-win18 2017-06-28
@y
### Docker Community Edition 17.06.0-ce-win18 2017-06-28
@z

@x
[Download](https://download.docker.com/win/stable/12627/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/12627/Docker%20for%20Windows%20Installer.exe)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)
- [Docker Credential Helpers 0.5.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.2)
- [Docker Machine 0.12.0](https://github.com/docker/machine/releases/tag/v0.12.0)
- [Docker compose 1.14.0](https://github.com/docker/compose/releases/tag/1.14.0)
- Linux Kernel 4.9.31
@y
- [Docker 17.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)
- [Docker Credential Helpers 0.5.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.2)
- [Docker Machine 0.12.0](https://github.com/docker/machine/releases/tag/v0.12.0)
- [Docker compose 1.14.0](https://github.com/docker/compose/releases/tag/1.14.0)
- Linux Kernel 4.9.31
@z

@x
**New**
@y
**New**
@z

@x
- Windows Server 2016 support
- Windows 10586 is marked as deprecated; it is not supported going forward in stable releases
- Integration with Docker Cloud, with the ability to control remote Swarms from the local command line interface (CLI) and view your repositories
- Unified login between the Docker CLI and Docker Hub, Docker Cloud.
- Sharing a drive can be done on demand, the first time a mount is requested
- Add an experimental DNS name for the host: docker.for.win.localhost
- Support for client (i.e. "login") certificates for authenticating registry access (fixes [docker/for-win#569](https://github.com/docker/for-win/issues/569))
- New installer experience
@y
- Windows Server 2016 support
- Windows 10586 is marked as deprecated; it is not supported going forward in stable releases
- Integration with Docker Cloud, with the ability to control remote Swarms from the local command line interface (CLI) and view your repositories
- Unified login between the Docker CLI and Docker Hub, Docker Cloud.
- Sharing a drive can be done on demand, the first time a mount is requested
- Add an experimental DNS name for the host: docker.for.win.localhost
- Support for client (i.e. "login") certificates for authenticating registry access (fixes [docker/for-win#569](https://github.com/docker/for-win/issues/569))
- New installer experience
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Fixed group access check for users logged in with Active Directory (fixes [docker/for-win#785](https://github.com/docker/for-win/issues/785))
- Checked environment variables and add some warnings in logs if they can cause docker to fail
- Many processes that were running in admin mode now run within the user identity
- Cloud federation command lines now open in the user home directory
- Named pipes are now created with more constrained security descriptors to improve security
- Security fix: Users must be part of the specific group "docker-users" to run Docker for Windows
- Reset to default / uninstall also reset Docker cli settings and logout user from Docker Cloud and registries
- Detected a bitlocker policy preventing windows containers to work
- Fixed an issue on filesharing when explicitly disabled on vmswitch interface
- Fixed virtual machine not starting when the machine had a very long name
- Fixed a bug where Windows daemon.json file was not written (fixes [docker/for-win#670](https://github.com/docker/for-win/issues/670))
- Added patches to the kernel to fix VMBus crash
- Named pipe client connection should not trigger dead locks on `docker run` with data in stdin any more
- Buffered data should be treated correctly when docker client requests are upgraded to raw streams
@y
- Fixed group access check for users logged in with Active Directory (fixes [docker/for-win#785](https://github.com/docker/for-win/issues/785))
- Checked environment variables and add some warnings in logs if they can cause docker to fail
- Many processes that were running in admin mode now run within the user identity
- Cloud federation command lines now open in the user home directory
- Named pipes are now created with more constrained security descriptors to improve security
- Security fix: Users must be part of the specific group "docker-users" to run Docker for Windows
- Reset to default / uninstall also reset Docker cli settings and logout user from Docker Cloud and registries
- Detected a bitlocker policy preventing windows containers to work
- Fixed an issue on filesharing when explicitly disabled on vmswitch interface
- Fixed virtual machine not starting when the machine had a very long name
- Fixed a bug where Windows daemon.json file was not written (fixes [docker/for-win#670](https://github.com/docker/for-win/issues/670))
- Added patches to the kernel to fix VMBus crash
- Named pipe client connection should not trigger dead locks on `docker run` with data in stdin any more
- Buffered data should be treated correctly when docker client requests are upgraded to raw streams
@z

@x
### Docker Community Edition 17.03.1-ce-win12  2017-05-12
@y
### Docker Community Edition 17.03.1-ce-win12  2017-05-12
@z

@x
[Download](https://download.docker.com/win/stable/12058/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/12058/Docker%20for%20Windows%20Installer.exe)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Security fix for CVE-2017-7308
@y
- Security fix for CVE-2017-7308
@z

@x
### Docker Community Edition 17.03.0, 2017-03-02
@y
### Docker Community Edition 17.03.0, 2017-03-02
@z

@x
[Download](https://download.docker.com/win/stable/10743/Docker%20for%20Windows%20Installer.exe)
@y
[Download](https://download.docker.com/win/stable/10743/Docker%20for%20Windows%20Installer.exe)
@z

@x
**New**
@y
**New**
@z

@x
- Renamed to Docker Community Edition
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users
progressively
@y
- Renamed to Docker Community Edition
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users
progressively
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.03.0-ce](https://github.com/docker/docker/releases/tag/v17.03.0-ce)
- [Docker Compose 1.11.2](https://github.com/docker/compose/releases/tag/1.11.2)
- [Docker Machine 0.10.0](https://github.com/docker/machine/releases/tag/v0.10.0)
- Linux kernel 4.9.12
@y
- [Docker 17.03.0-ce](https://github.com/docker/docker/releases/tag/v17.03.0-ce)
- [Docker Compose 1.11.2](https://github.com/docker/compose/releases/tag/1.11.2)
- [Docker Machine 0.10.0](https://github.com/docker/machine/releases/tag/v0.10.0)
- Linux kernel 4.9.12
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Matched Hyper-V Integration Services by ID, not name
- Don't consume 100% CPU when the service is stopped
- Log the diagnostic id when uploading
- Improved firewall handling: stop listing the rules since it can take a lot of time
- Don't rollback to the previous engine when the desired engine fails to start
- Don't use port 4222 inside the Linux virtual machine
- Fixed startup error of ObjectNotFound in Set-VMFirmware
- Added detailed logs when firewall is configured
- Added a link to the Experimental Features documentation
- Fixed the copyright in the About dialog
- VPNKit: fix unmarshalling of DNS packets containing pointers to pointers to labels
- VPNKit: set the Recursion Available bit on DNS responses from the cache
- VPNKit: Avoid diagnostics to capture too much data
- VPNKit: fix a source of occasional packet loss (truncation) on the virtual ethernet link
- Fixed negotiation of TimeSync protocol version (through kernel update)
@y
- Matched Hyper-V Integration Services by ID, not name
- Don't consume 100% CPU when the service is stopped
- Log the diagnostic id when uploading
- Improved firewall handling: stop listing the rules since it can take a lot of time
- Don't rollback to the previous engine when the desired engine fails to start
- Don't use port 4222 inside the Linux virtual machine
- Fixed startup error of ObjectNotFound in Set-VMFirmware
- Added detailed logs when firewall is configured
- Added a link to the Experimental Features documentation
- Fixed the copyright in the About dialog
- VPNKit: fix unmarshalling of DNS packets containing pointers to pointers to labels
- VPNKit: set the Recursion Available bit on DNS responses from the cache
- VPNKit: Avoid diagnostics to capture too much data
- VPNKit: fix a source of occasional packet loss (truncation) on the virtual ethernet link
- Fixed negotiation of TimeSync protocol version (through kernel update)
@z

@x
### Docker for Windows 1.13.1, 2017-02-09
@y
### Docker for Windows 1.13.1, 2017-02-09
@z

@x
[Download](https://download.docker.com/win/stable/1.13.1.10072/InstallDocker.msi)
@y
[Download](https://download.docker.com/win/stable/1.13.1.10072/InstallDocker.msi)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 1.13.1](https://github.com/docker/docker/releases/tag/v1.13.1)
- [Docker Compose 1.11.1](https://github.com/docker/compose/releases/tag/1.11.1)
- Linux kernel 4.9.8
@y
- [Docker 1.13.1](https://github.com/docker/docker/releases/tag/v1.13.1)
- [Docker Compose 1.11.1](https://github.com/docker/compose/releases/tag/1.11.1)
- Linux kernel 4.9.8
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Add link to experimental features
- New 1.13 cancellable operations should now be properly handled by the Docker for desktop
- Various typos fixes
- Fix in Hyper-V VM setup (should fix `ObjectNotFound` errors)
@y
- Add link to experimental features
- New 1.13 cancellable operations should now be properly handled by the Docker for desktop
- Various typos fixes
- Fix in Hyper-V VM setup (should fix `ObjectNotFound` errors)
@z

@x
### Docker for Windows 1.13.0, 2017-01-19
@y
### Docker for Windows 1.13.0, 2017-01-19
@z

@x
[Download](https://download.docker.com/win/stable/1.13.0.9795/InstallDocker.msi)
@y
[Download](https://download.docker.com/win/stable/1.13.0.9795/InstallDocker.msi)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)
- [Docker Compose 1.10](https://github.com/docker/compose/releases/tag/1.10.0)
- [Docker Machine 0.9.0](https://github.com/docker/machine/releases/tag/v0.9.0)
- [Notary 0.4.3](https://github.com/docker/notary/releases/tag/v0.4.3)
- Linux kernel 4.9.4
@y
- [Docker 1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)
- [Docker Compose 1.10](https://github.com/docker/compose/releases/tag/1.10.0)
- [Docker Machine 0.9.0](https://github.com/docker/machine/releases/tag/v0.9.0)
- [Notary 0.4.3](https://github.com/docker/notary/releases/tag/v0.4.3)
- Linux kernel 4.9.4
@z

@x
**New**
@y
**New**
@z

@x
- Windows containers
- Improved UI for Daemon.json editing
- VHDX file containing images and non-host mounted volumes can be moved
  (using "advanced" tab in the UI)
- Support for arm, aarch64, ppc64le architectures using qemu
- TRIM support for disk (shrinks virtual disk)
- Virtual machine's time synchronization is forced after the host wakes from sleep mode
- Docker Experimental mode can be toggled
@y
- Windows containers
- Improved UI for Daemon.json editing
- VHDX file containing images and non-host mounted volumes can be moved
  (using "advanced" tab in the UI)
- Support for arm, aarch64, ppc64le architectures using qemu
- TRIM support for disk (shrinks virtual disk)
- Virtual machine's time synchronization is forced after the host wakes from sleep mode
- Docker Experimental mode can be toggled
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Improved Proxy UI
- Improvements to Logging and Diagnostics
- About Box is now copy/paste enabled
- Improvements in drive sharing code
- Optimized boot process
- Trend Micro Office Scan made the API proxy think no drive was shared
- Show a link to the virtualization documentation
- Always remove the disk on factory reset
- VPNKit: Improved diagnostics
- VPNKit: Forwarded UDP datagrams have correct source port numbers
- VPNKit: If one request fails, allow other concurrent requests to succeed.
  For example this allows IPv4 servers to work even if IPv6 is broken.
- VPNKit: Fix bug which could cause the connection tracking to
  underestimate the number of active connections
- VPNKit: add a local cache of DNS responses
@y
- Improved Proxy UI
- Improvements to Logging and Diagnostics
- About Box is now copy/paste enabled
- Improvements in drive sharing code
- Optimized boot process
- Trend Micro Office Scan made the API proxy think no drive was shared
- Show a link to the virtualization documentation
- Always remove the disk on factory reset
- VPNKit: Improved diagnostics
- VPNKit: Forwarded UDP datagrams have correct source port numbers
- VPNKit: If one request fails, allow other concurrent requests to succeed.
  For example this allows IPv4 servers to work even if IPv6 is broken.
- VPNKit: Fix bug which could cause the connection tracking to
  underestimate the number of active connections
- VPNKit: add a local cache of DNS responses
@z

@x
## Stable Releases of 2016
@y
## Stable Releases of 2016
@z

@x
### Docker for Windows 1.12.5, 2016-12-20
@y
### Docker for Windows 1.12.5, 2016-12-20
@z

@x
[Download](https://download.docker.com/win/stable/1.12.5.9503/InstallDocker.msi)
@y
[Download](https://download.docker.com/win/stable/1.12.5.9503/InstallDocker.msi)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.12.5
- Docker Compose 1.9.0
@y
- Docker 1.12.5
- Docker Compose 1.9.0
@z

@x
### Skipped Docker for Windows 1.12.4
@y
### Skipped Docker for Windows 1.12.4
@z

@x
We did not distribute a 1.12.4 stable release
@y
We did not distribute a 1.12.4 stable release
@z

@x
### Docker for Windows 1.12.3, 2016-11-09
@y
### Docker for Windows 1.12.3, 2016-11-09
@z

@x
[Download](https://download.docker.com/win/stable/1.12.3.8488/InstallDocker.msi)
@y
[Download](https://download.docker.com/win/stable/1.12.3.8488/InstallDocker.msi)
@z

@x
**New**
@y
**New**
@z

@x
- Restore the virtual machine's configuration after user changes
@y
- Restore the virtual machine's configuration after user changes
@z

@x
- Detect firewall configurations that might block file sharing
@y
- Detect firewall configurations that might block file sharing
@z

@x
- Send more GUI usage statistics to help us improve the product
@y
- Send more GUI usage statistics to help us improve the product
@z

@x
- The path to HyperV disks is not hardcoded anymore, making the Toolbox import work with non-standard paths
@y
- The path to HyperV disks is not hardcoded anymore, making the Toolbox import work with non-standard paths
@z

@x
- Verify that all HyperV features are enabled
@y
- Verify that all HyperV features are enabled
@z

@x
- Added Moby console to the logs
@y
- Added Moby console to the logs
@z

@x
- Save the current engine with the other settings
@y
- Save the current engine with the other settings
@z

@x
- Notary version 0.4.2 installed
@y
- Notary version 0.4.2 installed
@z

@x
- Reworked the File Sharing dialog and underlying mechanism
  - Pre-fill username
  - Faster and more reliable feedback when the user/password is not valid
  - Better support for domain users
  - Error message in Logs when File Sharing failed for other reasons
@y
- Reworked the File Sharing dialog and underlying mechanism
  - Pre-fill username
  - Faster and more reliable feedback when the user/password is not valid
  - Better support for domain users
  - Error message in Logs when File Sharing failed for other reasons
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.12.3
- Linux Kernel 4.4.27
- Docker Machine 0.8.2
- Docker Compose 1.8.1
- aufs 20160912
@y
- Docker 1.12.3
- Linux Kernel 4.4.27
- Docker Machine 0.8.2
- Docker Compose 1.8.1
- aufs 20160912
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
**General**
@y
**General**
@z

@x
- Added the settings to the diagnostics
@y
- Added the settings to the diagnostics
@z

@x
- Made sure we didn't use an older Nlog library from the GAC
@y
- Made sure we didn't use an older Nlog library from the GAC
@z

@x
- Fixed a password escaping regression
@y
- Fixed a password escaping regression
@z

@x
- Supports writing large values to the database, specially for trusted CAs
@y
- Supports writing large values to the database, specially for trusted CAs
@z

@x
- Preserves the Powershell stacktraces
@y
- Preserves the Powershell stacktraces
@z

@x
- Writes OS and Application versions at the top of each log file
@y
- Writes OS and Application versions at the top of each log file
@z

@x
- Don't recreate the virtual machine if only the DNS server is set
@y
- Don't recreate the virtual machine if only the DNS server is set
@z

@x
- The uninstaller now kills the service if it failed to stop it properly
@y
- The uninstaller now kills the service if it failed to stop it properly
@z

@x
- Improved debug information
@y
- Improved debug information
@z

@x
**Networking**
@y
**Networking**
@z

@x
- VpnKit is now restarted if it stops
@y
- VpnKit is now restarted if it stops
@z

@x
- VpnKit: impose a connection limit to avoid exhausting file descriptors
@y
- VpnKit: impose a connection limit to avoid exhausting file descriptors
@z

@x
- VpnKit: handle UDP datagrams larger than 2035 bytes
@y
- VpnKit: handle UDP datagrams larger than 2035 bytes
@z

@x
- VpnKit: reduce the number of file descriptors consumed by DNS
@y
- VpnKit: reduce the number of file descriptors consumed by DNS
@z

@x
**File sharing**
@y
**File sharing**
@z

@x
- Faster mount/unmount of shared drives
@y
- Faster mount/unmount of shared drives
@z

@x
- Added a timeout to mounting/unmounting a shared drive
@y
- Added a timeout to mounting/unmounting a shared drive
@z

@x
**Hyper-V**
@y
**Hyper-V**
@z

@x
- Make sure invalid "DockerNat" switches are not used
@y
- Make sure invalid "DockerNat" switches are not used
@z

@x
**Moby**
@y
**Moby**
@z

@x
- Increase default ulimit for memlock (fixes [https://github.com/docker/for-mac/issues/801](https://github.com/docker/for-mac/issues/801))
@y
- Increase default ulimit for memlock (fixes [https://github.com/docker/for-mac/issues/801](https://github.com/docker/for-mac/issues/801))
@z

@x
### Docker for Windows 1.12.1, 2016-09-16
@y
### Docker for Windows 1.12.1, 2016-09-16
@z

@x
[Download](https://download.docker.com/win/stable/1.12.1.7135/InstallDocker.msi)
@y
[Download](https://download.docker.com/win/stable/1.12.1.7135/InstallDocker.msi)
@z

@x
>**Important Note**:
>
> The auto-update function in Beta 21 cannot install this update. To install the latest beta manually if you are still on Beta 21, download the installer here:
@y
>**Important Note**:
>
> The auto-update function in Beta 21 cannot install this update. To install the latest beta manually if you are still on Beta 21, download the installer here:
@z

@x
> [https://download.docker.com/win/beta/InstallDocker.msi](https://download.docker.com/win/beta/InstallDocker.msi)
@y
> [https://download.docker.com/win/beta/InstallDocker.msi](https://download.docker.com/win/beta/InstallDocker.msi)
@z

@x
> This problem is fixed as of Beta 23 for subsequent auto-updates.
@y
> This problem is fixed as of Beta 23 for subsequent auto-updates.
@z

@x
**New**
@y
**New**
@z

@x
* To support trusted registry transparently, all trusted CAs (root or intermediate) on the Windows host are automatically copied to Moby
@y
* To support trusted registry transparently, all trusted CAs (root or intermediate) on the Windows host are automatically copied to Moby
@z

@x
* `Reset Credentials` also unshares the shared drives
@y
* `Reset Credentials` also unshares the shared drives
@z

@x
* Logs are now rotated every day
@y
* Logs are now rotated every day
@z

@x
* Support multiple DNS servers
@y
* Support multiple DNS servers
@z

@x
* Added `mfsymlinks` SMB option to support symlinks on bind mounted folder
@y
* Added `mfsymlinks` SMB option to support symlinks on bind mounted folder
@z

@x
* Added `nobrl` SMB option to support `sqlite` on bind mounted folders
@y
* Added `nobrl` SMB option to support `sqlite` on bind mounted folders
@z

@x
* Detect outdated versions of Kitematic
@y
* Detect outdated versions of Kitematic
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.1
* Docker machine 0.8.1
* Linux kernel 4.4.20
* aufs 20160905
@y
* Docker 1.12.1
* Docker machine 0.8.1
* Linux kernel 4.4.20
* aufs 20160905
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
**General**
@y
**General**
@z

@x
* Uploading a diagnostic now shows a proper status message in the Settings
@y
* Uploading a diagnostic now shows a proper status message in the Settings
@z

@x
* Docker stops asking to import from the Toolbox after an upgrade
@y
* Docker stops asking to import from the Toolbox after an upgrade
@z

@x
* Docker can now import from the Toolbox just after HyperV is activated
@y
* Docker can now import from the Toolbox just after HyperV is activated
@z

@x
* Added more debug information to the diagnostics
@y
* Added more debug information to the diagnostics
@z

@x
* Sending anonymous statistics doesn't hang anymore when Mixpanel is not available
@y
* Sending anonymous statistics doesn't hang anymore when Mixpanel is not available
@z

@x
* Support newlines in release notes
@y
* Support newlines in release notes
@z

@x
* Improve the error message when the Docker daemon is not responding
@y
* Improve the error message when the Docker daemon is not responding
@z

@x
* The configuration database is now stored in memory
@y
* The configuration database is now stored in memory
@z

@x
* Preserve the stacktrace of PowerShell errors
@y
* Preserve the stacktrace of PowerShell errors
@z

@x
* Display service stacktrace in error windows
@y
* Display service stacktrace in error windows
@z

@x
**Networking**
@y
**Networking**
@z

@x
* Improve name servers discovery
* VpnKit supports search domains
* VpnKit is now compiled with OCaml 4.03 rather than 4.02.3
@y
* Improve name servers discovery
* VpnKit supports search domains
* VpnKit is now compiled with OCaml 4.03 rather than 4.02.3
@z

@x
**File sharing**
@y
**File sharing**
@z

@x
* Set `cifs` version to 3.02
@y
* Set `cifs` version to 3.02
@z

@x
* VnpKit: reduce the number of sockets used by UDP NAT, reduce the probability
@y
* VnpKit: reduce the number of sockets used by UDP NAT, reduce the probability
@z

@x
* `slirp`: reduce the number of sockets used by UDP NAT, reduce the probability that NAT rules time out earlier than expected
@y
* `slirp`: reduce the number of sockets used by UDP NAT, reduce the probability that NAT rules time out earlier than expected
@z

@x
* Fixed password handling for host file system sharing
@y
* Fixed password handling for host file system sharing
@z

@x
**Hyper-V**
@y
**Hyper-V**
@z

@x
* Automatically disable lingering net adapters that prevent Docker from starting or using the network
@y
* Automatically disable lingering net adapters that prevent Docker from starting or using the network
@z

@x
* Automatically delete duplicated MobyLinuxVMs on a `reset to factory defaults`
@y
* Automatically delete duplicated MobyLinuxVMs on a `reset to factory defaults`
@z

@x
* Improved the HyperV detection and activation mechanism
@y
* Improved the HyperV detection and activation mechanism
@z

@x
**Moby**
@y
**Moby**
@z

@x
* Fixed Moby Diagnostics and Update Kernel
@y
* Fixed Moby Diagnostics and Update Kernel
@z

@x
* Use default `sysfs` settings, transparent huge pages disabled
@y
* Use default `sysfs` settings, transparent huge pages disabled
@z

@x
* `Cgroup` mount to support `systemd` in containers
@y
* `Cgroup` mount to support `systemd` in containers
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker automatically disables lingering net adapters. The only way to remove them is manually using `devmgmt.msc` as documented in [Remove stale network adapters](troubleshoot.md#4-remove-stale-network-adapters) under [Networking issues](troubleshoot.md#networking-issues) in Troubleshooting.
@y
* Docker automatically disables lingering net adapters. The only way to remove them is manually using `devmgmt.msc` as documented in [Remove stale network adapters](troubleshoot.md#4-remove-stale-network-adapters) under [Networking issues](troubleshoot.md#networking-issues) in Troubleshooting.
@z

@x
### Docker for Windows 1.12.0, 2016-07-28
@y
### Docker for Windows 1.12.0, 2016-07-28
@z

@x
[Download](https://download.docker.com/win/stable/1.12.0.5968/InstallDocker.msi)
@y
[Download](https://download.docker.com/win/stable/1.12.0.5968/InstallDocker.msi)
@z

@x
* First stable release
@y
* First stable release
@z

@x
**Components**
@y
**Components**
@z

@x
* Docker 1.12.0
* Docker Machine 0.8.0
* Docker Compose 1.8.0
@y
* Docker 1.12.0
* Docker Machine 0.8.0
* Docker Compose 1.8.0
@z
