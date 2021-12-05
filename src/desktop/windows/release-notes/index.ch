%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Change log / release notes for Docker Desktop for Windows
keywords: Docker Desktop for Windows, release notes
title: Docker for Windows release notes
toc_min: 1
toc_max: 2
redirect_from:
- /docker-for-windows/edge-release-notes/
- /docker-for-windows/release-notes/
- /winkit/release-notes/
---
@y
---
description: Change log / release notes for Docker Desktop for Windows
keywords: Docker Desktop for Windows, release notes
title: Docker for Windows リリースノート
toc_min: 1
toc_max: 2
redirect_from:
- /docker-for-windows/edge-release-notes/
- /docker-for-windows/release-notes/
- /winkit/release-notes/
---
@z

@x
> **Update to the Docker Desktop terms**
>
> Professional use of Docker Desktop in large organizations (more than 250 employees or more than $10 million in annual revenue) requires users to have a paid Docker subscription. While the effective date of these terms is August 31, 2021, there is a grace period until January 31, 2022 for those that require a paid subscription. For more information, see [Docker Desktop License Agreement](../../../subscription/index.md#docker-desktop-license-agreement).
{: .important}
@y
> **Docker Desktop 利用契約の更新**
>
> 大規模エンタープライズ向けの Docker Desktop のプロフェッショナル利用 (従業員 250名以上、または年間収益 1 千万ドル以上) に対しては、有償の Docker サブスクリプションが必要です。
> この条件の適用開始日は 2021 年 8 月31 日です。
> Docker Deskop の利用に有償サブスクリプションが必要とされるものであっても、 2022 年 1 月 31 日までは猶予期間が設けられています。
> 詳しくは [Docker Desktop ライセンス契約](../../../subscription/index.md#docker-desktop-license-agreement) を参照してください。
{: .important}
@z

@x
This page contains information about the new features, improvements, known issues, and bug fixes in Docker Desktop releases.
@y
このページでは Docker Desktop リリースにおける新機能、更新状況、既知の不具合、バグフィックスといった情報を示します。
@z

@x
Take a look at the [Docker Public Roadmap](https://github.com/docker/roadmap/projects/1){: target="_blank" rel="noopener" class="_"} to see what's coming next.
@y
次に予定されているものが何であるのかを見るには、[Docker 公開ロードマップ](https://github.com/docker/roadmap/projects/1){: target="_blank" rel="noopener" class="_"} を確認してください。
@z

@x
## Docker Desktop 4.3.0
2021-12-02
@y
## Docker Desktop 4.3.0
2021-12-02
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64){: .button .primary-btn }
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64){: .button .primary-btn }
@z

@x
### Deprecation
@y
{: #deprecation }
### 廃止決定
@z

@x
- The following internal DNS names are deprecated and will be removed from a future release: `docker-for-desktop`, `docker-desktop`, `docker.for.mac.host.internal`, `docker.for.mac.localhost`, `docker.for.mac.gateway.internal`. You must now use `host.docker.internal`, `vm.docker.internal`, and `gateway.docker.internal`.
- Removed: Custom RBAC rules have been removed from Docker Desktop as it gives `cluster-admin` privileges to all Service Accounts. Fixes [docker/for-mac/#4774](https://github.com/docker/for-mac/issues/4774).
@y
- 以下に示す内部 DNS 名は廃止決定となり、将来のリリースにおいて削除される予定です。
  `docker-for-desktop`, `docker-desktop`, `docker.for.mac.host.internal`, `docker.for.mac.localhost`, `docker.for.mac.gateway.internal`. You must now use `host.docker.internal`, `vm.docker.internal`, `gateway.docker.internal`
- 削除 ＝ カスタムの RBAC ルールは Docker Desktop から削除されました。
  これにより`cluster-admin`権限は、すべてのサービスアカウントに与えられます。
  [docker/for-mac/#4774](https://github.com/docker/for-mac/issues/4774) を Fix に。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine v20.10.11](https://docs.docker.com/engine/release-notes/#201011)
- [containerd v1.4.12](https://github.com/containerd/containerd/releases/tag/v1.4.12)
- [Buildx 0.7.1](https://github.com/docker/buildx/releases/tag/v0.7.1)
- [Compose v2.2.1](https://github.com/docker/compose/releases/tag/v2.2.1)
- [Kubernetes 1.22.4](https://github.com/kubernetes/kubernetes/releases/tag/v1.22.4)
- [Docker Hub Tool v0.4.4](https://github.com/docker/hub-tool/releases/tag/v0.4.4)
- [Go 1.17.3](https://golang.org/doc/go1.17)
@y
- [Docker Engine v20.10.11](https://docs.docker.com/engine/release-notes/#201011)
- [containerd v1.4.12](https://github.com/containerd/containerd/releases/tag/v1.4.12)
- [Buildx 0.7.1](https://github.com/docker/buildx/releases/tag/v0.7.1)
- [Compose v2.2.1](https://github.com/docker/compose/releases/tag/v2.2.1)
- [Kubernetes 1.22.4](https://github.com/kubernetes/kubernetes/releases/tag/v1.22.4)
- [Docker Hub Tool v0.4.4](https://github.com/docker/hub-tool/releases/tag/v0.4.4)
- [Go 1.17.3](https://golang.org/doc/go1.17)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue which prevented users from saving files from a volume using the Save As option in the Volumes UI. Fixes [docker/for-win#12407](https://github.com/docker/for-win/issues/12407).
- Fixed an issue that caused Docker Desktop to fail during startup if the home directory path contains a character used in regular expressions. Fixes [docker/for-win#12374](https://github.com/docker/for-win/issues/12374).
- Added a self-diagnose warning if the host lacks Internet connectivity.
- Docker Desktop now uses cgroupv2. If you need to run `systemd` in a container then:
  - Ensure your version of `systemd` supports cgroupv2. [It must be at least `systemd` 247](https://github.com/systemd/systemd/issues/19760#issuecomment-851565075). Consider upgrading any `centos:7` images to `centos:8`.
  - Containers running `systemd` need the following options: [`--privileged --cgroupns=host -v /sys/fs/cgroup:/sys/fs/cgroup:rw`](https://serverfault.com/questions/1053187/systemd-fails-to-run-in-a-docker-container-when-using-cgroupv2-cgroupns-priva).
@y
- ボリューム UI における Save As オプションを使った際に、ボリュームからファイル保存ができなかった問題を修正しました。
  [docker/for-win#12407](https://github.com/docker/for-win/issues/12407) を Fix に。
- ホームディレクトリパスに正規表現が含まれる場合に、Docker Desktop の起動に失敗する問題を修正しました。
  [docker/for-win#12374](https://github.com/docker/for-win/issues/12374) を Fix に。
- ホストのインターネット接続が不能である場合に、自己診断警告メッセージを追加しました。
- Docker Desktop では cgroupv2 を用いることにしました。
  コンテナー内において`systemd`の起動が必要な場合は、以下を行ってください。
  - インストールしている`systemd`が cgroupv2 をサポートしていることを確認してください。
    [最低でも`systemd` 247 が必要です](https://github.com/systemd/systemd/issues/19760#issuecomment-851565075)。
    `centos:7`イメージの場合は、`centos:8`にアップグレードすることを検討してください。
  - `systemd`を起動するコンテナーでは、以下のオプションが必要です。
    [`--privileged --cgroupns=host -v /sys/fs/cgroup:/sys/fs/cgroup:rw`](https://serverfault.com/questions/1053187/systemd-fails-to-run-in-a-docker-container-when-using-cgroupv2-cgroupns-priva)
@z

@x
## Docker Desktop 4.2.0
2021-11-09
@y
## Docker Desktop 4.2.0
2021-11-09
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/70708/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/70708/Docker%20Desktop%20Installer.exe)
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Pause/Resume**: You can now pause your Docker Desktop session when you are not actively using it and save CPU resources on your machine. For more information, see [Pause/Resume](../index.md#pauseresume).
@y
**Pause/Resume**（一時停止/再開）＝ Docker Desktop セッションを活用していない場合に、これを一時停止できるようになりました。
  これにより、マシンの CPU リソース消費を節約できます。
  詳しくは [一時停止/再開](../index.md#pauseresume) を参照してください。
@z

@x
- Ships [Docker Public Roadmap#226](https://github.com/docker/roadmap/issues/226){: target="_blank" rel="noopener" class="_"}
@y
- [Docker 公開ロードマップ#226](https://github.com/docker/roadmap/issues/226){: target="_blank" rel="noopener" class="_"} を公開しました。
@z

@x
**Software Updates**: The option to turn off automatic check for updates is now available for users on all Docker subscriptions, including Docker Personal and Docker Pro. All update-related settings have been moved to the **Software Updates** section. For more information, see [Software updates](../index.md#software-updates).
@y
**Software Updates**（ソフトウェアアップデート）＝ Docker Desktop 4.2.0 からは、Docker Personal や Docker Pro など、すべての Docker サブスクリプションにおいて、ソフトウェアアップデートの自動更新を無効にすることができます。
  アップデートに関する設定は、すべて **Software Updates**（ソフトウェアアップデート）のセクションに移動しました。
  詳しくは [ソフトウェアアップデート](../index.md#software-updates) を参照してください。
@z

@x
- Ships [Docker Public Roadmap#228](https://github.com/docker/roadmap/issues/228){: target="_blank" rel="noopener" class="_"}
@y
- [Docker 公開ロードマップ#228](https://github.com/docker/roadmap/issues/228){: target="_blank" rel="noopener" class="_"} を公開しました。
@z

@x
**Window management**: The Docker Dashboard window size and position persists when you close and reopen Docker Desktop.
@y
**Window management**（画面管理）＝ Docker ダッシュボードのウィンドウサイズや位置を、Docker Desktop のクローズと再オープンを通じて維持されるようにしました。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine v20.10.10](https://docs.docker.com/engine/release-notes/#201010)
- [containerd v1.4.11](https://github.com/containerd/containerd/releases/tag/v1.4.11)
- [runc v1.0.2](https://github.com/opencontainers/runc/releases/tag/v1.0.2)
- [Go 1.17.2](https://golang.org/doc/go1.17)
- [Compose v2.1.1](https://github.com/docker/compose/releases/tag/v2.1.1)
- [docker-scan 0.9.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.9.0)
@y
- [Docker Engine v20.10.10](https://docs.docker.com/engine/release-notes/#201010)
- [containerd v1.4.11](https://github.com/containerd/containerd/releases/tag/v1.4.11)
- [runc v1.0.2](https://github.com/opencontainers/runc/releases/tag/v1.0.2)
- [Go 1.17.2](https://golang.org/doc/go1.17)
- [Compose v2.1.1](https://github.com/docker/compose/releases/tag/v2.1.1)
- [docker-scan 0.9.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.9.0)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Improved: Self-diagnose now also checks for overlap between host IPs and `docker networks`.
- Fixed the position of the indicator that displays the availability of an update on the Docker Dashboard.
- Fixed Docker Desktop sometimes hanging when clicking Exit in the fatal error dialog.
- Fixed an issue that frequently displayed the **Download update** popup when an update has been downloaded but hasn't been applied yet [docker/for-win#12188](https://github.com/docker/for-win/issues/12188).
- Fixed installing a new update killing the application before it has time to shut down.
- Fixed: Installation of Docker Desktop now works even with group policies preventing users to start prerequisite services (e.g. LanmanServer) [docker/for-win#12291](https://github.com/docker/for-win/issues/12291).
@y
- 改善 ＝ 自己診断機能において、ホスト IP と`docker networks`のオーバーラップもチェックするようになりました。
- Docker ダッシュボードにおいて、アップデートの利用可能性を表すインジケーターの位置を調整しました。
- Docker Desktop において、致命的エラーダイアログ上の Exit（終了）ボタンをクリックした際に、
  ハングすることがある不具合を修正しました。
- アップデートをダウンロードした後に、まだ適用されていないにも関わらず、**Download update** ポップアップ画面がしばしば表示されてしまう不具合を修正しました。 
  [docker/for-win#12188](https://github.com/docker/for-win/issues/12188)
- アップデートをインストールする際に、他のアプリケーションを終了すべきであることを示さずに終了してしまう問題を修正しました。
- 修正 ＝ Docker Desktop のインストールにあたって、グループポリシーの設定によって、ユーザーによる必須サービス（たとえば LanmanServer）の起動ができない場合であっても、インストールが動作するようにしました。
  [docker/for-win#12291](https://github.com/docker/for-win/issues/12291)
@z

@x
## Docker Desktop 4.1.1
2021-10-12
@y
## Docker Desktop 4.1.1
2021-10-12
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/69879/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/69879/Docker%20Desktop%20Installer.exe)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a regression in WSL 2 integrations for some distros (e.g. Arch or Alpine). Fixes [docker/for-win#12229](https://github.com/docker/for-win/issues/12229)
- Fixed update notification overlay sometimes getting out of sync between the Settings button and the Software update button in the Dashboard.
@y
- 一部のディストロ（たとえば Arch や Alpine）に対する WSL 2 統合の機能不備を修正しました。
  [docker/for-win#12229](https://github.com/docker/for-win/issues/12229) を Fix に。
- Docker Dashboard の Settings（設定）ボタンと Software update（ソフトウェアアップデート）ボタンとの間で、アップデート通知の同期が行われなくなることがある不具合を修正しました。
@z

@x
## Docker Desktop 4.1.0
2021-09-30
@y
## Docker Desktop 4.1.0
2021-09-30
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/69386/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/69386/Docker%20Desktop%20Installer.exe)
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- **Software Updates**: The Settings tab now includes a new section to help you manage Docker Desktop updates. The **Software Updates** section notifies you whenever there's a new update and allows you to download the update or view information on what's included in the newer version. For more information, see [Software Updates](../index.md#software-updates).
- **Compose V2** You can now specify whether to use [Docker Compose V2](../../../compose/cli-command.md) in the General settings.
- **Volume Management**: Volume management is now available for users on any subscription, including Docker Personal. For more information, see [Explore volumes](../../dashboard.md#explore-volumes). Ships [Docker Public Roadmap#215](https://github.com/docker/roadmap/issues/215){: target="_blank" rel="noopener" class="_"}
@y
- **ソフトウェア更新** ＝ Settings（設定）タブに新たなセクションが追加され、Docker Desktop のアップデートを管理できるようになりました。
  **Software Updates**（ソフトウェア更新）セクションでは、新たな更新があれば通知されます。
  そして更新のダウンロードを行ったり、最新版に含まれる機能がどのようなものかを参照したりすることができます。
  詳しくは [ソフトウェア更新](../index.md#software-updates) を参照してください。
- **Compose V2** ＝ General（一般）において [Docker Compose V2](../../../compose/cli-command.md) を利用するかどうかが設定できるようになりました。
- **ボリューム管理** ＝ Docker Desktop 4.1.0 リリースから、Docker Personal も含め、どのサブスクリプションユーザーであっても、ボリューム管理機能が利用できるようになりました。
  詳しくは [ボリュームの確認](../../dashboard.md#explore-volumes) を参照してください。
  [Docker 公開ロードマップ#215](https://github.com/docker/roadmap/issues/215){: target="_blank" rel="noopener" class="_"} を公開しました。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Compose V2](https://github.com/docker/compose/releases/tag/v2.0.0)
- [Buildx 0.6.3](https://github.com/docker/buildx/releases/tag/v0.6.3)
- [Kubernetes 1.21.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.5)
- [Go 1.17.1](https://github.com/golang/go/releases/tag/go1.17.1)
- [Alpine 3.14](https://alpinelinux.org/posts/Alpine-3.14.0-released.html)
- [Qemu 6.1.0](https://wiki.qemu.org/ChangeLog/6.1)
- Base distro to debian:bullseye
@y
- [Compose V2](https://github.com/docker/compose/releases/tag/v2.0.0)
- [Buildx 0.6.3](https://github.com/docker/buildx/releases/tag/v0.6.3)
- [Kubernetes 1.21.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.5)
- [Go 1.17.1](https://github.com/golang/go/releases/tag/go1.17.1)
- [Alpine 3.14](https://alpinelinux.org/posts/Alpine-3.14.0-released.html)
- [Qemu 6.1.0](https://wiki.qemu.org/ChangeLog/6.1)
- ベースディストロを debian:bullseye に。
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a bug related to anti-malware software triggering, self-diagnose avoids calling the `net.exe` utility.
- Fixed filesystem corruption in the WSL 2 Linux VM in self-diagnose. This can be caused by [microsoft/WSL#5895](https://github.com/microsoft/WSL/issues/5895).
- Fixed `SeSecurityPrivilege` requirement issue. See [docker/for-win#12037](https://github.com/docker/for-win/issues/12037).
- Fixed CLI context switch sync with UI. See [docker/for-win#11721](https://github.com/docker/for-win/issues/11721).
- Added the key `vpnKitMaxPortIdleTime` to `settings.json` to allow the idle network connection timeout to be disabled or extended.
- Fixed a crash on exit. See [docker/for-win#12128](https://github.com/docker/for-win/issues/12128).
- Fixed a bug where the CLI tools would not be available in WSL 2 distros.
- Fixed switching from Linux to Windows containers that was stuck because access rights on panic.log. See [for-win#11899](https://github.com/docker/for-win/issues/11899).
@y
- アンチマルウェアの起動、自己診断からの`net.exe`ユーティリティーの呼び出し不備に関するバグを修正しました。
- WSL 2 Linux VM の自己診断において、ファイルシステムが破損する不備を修正しました。
  これは、以下の [microsoft/WSL#5895](https://github.com/microsoft/WSL/issues/5895) により発生します。
- `SeSecurityPrivilege`の要件に関する問題を修正しました。
  [docker/for-win#12037](https://github.com/docker/for-win/issues/12037) を参照のこと。
- UI と連動した CLI のコンテキスト切り替えを修正しました。
  [docker/for-win#11721](https://github.com/docker/for-win/issues/11721) を参照のこと。
- `settings.json`に対して`vpnKitMaxPortIdleTime`キーを追加し、ネットワーク接続のアイドルタイムアウトを無効化、あるいは拡張可能にしました。
- 終了時のクラッシュを修正しました。
  [docker/for-win#12128](https://github.com/docker/for-win/issues/12128) 参照。
- WSL 2 ディストロにおいて、CLI ツールが利用できないバグを修正しました。
- panic.log へのアクセス権限の不備により、Linux コンテナーから Windows コンテナーへの切り替えができなくなっていた点を修正しました。
  [for-win#11899](https://github.com/docker/for-win/issues/11899) を参照のこと。
@z

@x
### Known Issue
@y
{: #known-issues }
### 既知の問題
@z

@x
Docker Desktop may fail to start when upgrading to 4.1.0 on some WSL-based distributions such as ArchWSL. See [docker/for-win#12229](https://github.com/docker/for-win/issues/12229)
@y
ArchWSL のような WSL ベースのディストリビューション上で Docker Desktop を 4.1.0 にアップグレードした場合に、起動に失敗する場合があります。
[docker/for-win#12229](https://github.com/docker/for-win/issues/12229) 参照。
@z

@x
## Docker Desktop 4.0.1
2021-09-13
@y
## Docker Desktop 4.0.1
2021-09-13
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/68347/Docker Desktop Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/68347/Docker Desktop Installer.exe)
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Compose V2 RC3](https://github.com/docker/compose/releases/tag/v2.0.0-rc.3)
  - Compose v2 is now hosted on github.com/docker/compose.
  - Fixed go panic on downscale using `compose up --scale`.
  - Fixed  a race condition in `compose run --rm` while capturing exit code.
@y
- [Compose V2 RC3](https://github.com/docker/compose/releases/tag/v2.0.0-rc.3)
  - Compose v2 は現在、github.com/docker/compose において提供されています。
  - `compose up --scale`を使ってダウングレードする際のパニックを修正しました。
  - `compose run --rm`の利用にあたって、終了コードが競合する問題を修正しました。
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a bug where Docker Desktop would not start correctly with the Hyper-V engine. See [docker/for-win#11963](https://github.com/docker/for-win/issues/11963)
- Fixed a bug where copy-paste was not available in the Docker Dashboard.
@y
- Hyper-V エンジンを使った場合に、Docker Desktop が起動しないバグを修正しました。
  [docker/for-win#11963](https://github.com/docker/for-win/issues/11963) を参照のこと。
- Docker ダッシュボードにおいて、コピーペーストができなかった箇所を修正しました。
@z

@x
## Docker Desktop 4.0.0
2021-08-31
@y
## Docker Desktop 4.0.0
2021-08-31
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/67817/Docker Desktop Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/67817/Docker Desktop Installer.exe)
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
Docker has [announced](https://www.docker.com/blog/updating-product-subscriptions/){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"} updates and extensions to the product subscriptions to increase productivity, collaboration, and added security for our developers and businesses.
@y
開発者やビジネス利用に向けた生産性、共同作業、セキュリティ向上のために、製品サブスクリプションの更新と拡張を [発表](https://www.docker.com/blog/updating-product-subscriptions/){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"} しました。
@z

@x
The updated [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) includes a change to the terms for **Docker Desktop**.
@y
更新された [Docker サブスクリプションサービス契約](https://www.docker.com/legal/docker-subscription-service-agreement) には、**Docker Desktop** での契約変更内容が記載されています。
@z

@x
- Docker Desktop **remains free** for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
- It requires a paid subscription (**Pro, Team, or Business**), for as little as $5 a month, for professional use in larger enterprises.
- The effective date of these terms is August 31, 2021. There is a grace period until January 31, 2022 for those that will require a paid subscription to use Docker Desktop.
- The Docker Pro and Docker Team subscriptions now **include commercial use** of Docker Desktop.
- The existing Docker Free subscription has been renamed **Docker Personal**.
- **No changes** to Docker Engine or any other upstream **open source** Docker or Moby project.
@y
- Docker Desktop は、小規模ビジネス向け（従業員 250 未満、かつ年間収益 1 千万ドル未満）、個人利用、教育目的、非商用のオープンソースプロジェクトに対しては、 **無償提供が継続** されます。
- 大規模なエンタープライズ向けのプロフェッショナル利用に対しては、最低でも月額 5 ドルの有償サブスクリプション（**Pro, Team, Business**）が必要です。
- この条件の適用開始日は 2021 年 8 月31 日です。
  Docker Deskop の利用に有償サブスクリプションが必要とされるものであっても、 2022 年 1 月 31 日までは猶予期間が設けられています。
- Docker Pro と Docker Team のサブスクリプションには、Docker Desktop の **商用利用** が含まれるようになりました。
- 既存の Docker 無償サブスクリプションは **Docker Personal** として名称変更されました。
- Docker Engine、これに関するアップストリームの **オープンソース**、Moby プロジェクトには **一切変更がありません**。
@z

@x
To understand how these changes affect you, read the [FAQs](https://www.docker.com/pricing/faq){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"}.
For more information, see [Docker subscription overview](../../../subscription/index.md).
@y
この変更内容がユーザーにとってどのように影響するかについては、[FAQ](https://www.docker.com/pricing/faq){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"} を参照してください。
より詳しくは [Docker サブスクリプション概要](../../../subscription/index.md) を参照してください。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Compose V2 RC2](https://github.com/docker/compose-cli/releases/tag/v2.0.0-rc.2)
  - Fixed project name to be case-insensitive for `compose down`. See [docker/compose-cli#2023](https://github.com/docker/compose-cli/issues/2023)
  - Fixed non-normalized project name.
  - Fixed port merging on partial reference.
- [Kubernetes 1.21.4](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.4)
@y
- [Compose V2 RC2](https://github.com/docker/compose-cli/releases/tag/v2.0.0-rc.2)
  - `compose down`において、プロジェクト名の大文字小文字を区別するように修正しました。
    [docker/compose-cli#2023](https://github.com/docker/compose-cli/issues/2023) を参照のこと。
  - 標準的でないプロジェクト名に対して修正しました。
  - 部分参照によるポートマージを修正しました。
- [Kubernetes 1.21.4](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.4)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a bug where the CLI tools would not be available in WSL 2 distros.
- Fixed a bug when switching from Linux to Windows containers due to access rights on `panic.log`. [for-win#11899](https://github.com/docker/for-win/issues/11899)
@y
- WSL 2 ディストリビューションにおいて CLI ツールが利用できなかったバグを修正しました。
- Linux コンテナーから Windows コンテナーに切り替える際の、`panic.log`への不適切なアクセス権限を修正しました。
  [for-win#11899](https://github.com/docker/for-win/issues/11899)
@z
