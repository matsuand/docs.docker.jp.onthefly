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
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) now requires a paid
> subscription. The grace period for those that will require a paid subscription
> ends on January 31, 2022. [Learn more](https://www.docker.com/blog/the-grace-period-for-the-docker-subscription-service-agreement-ends-soon-heres-what-you-need-to-know/){:
 target="_blank" rel="noopener" class="_" id="dkr_docs_cta"}.
{: .important}
@y
> **Docker Desktop 利用契約の更新**
>
> 大規模エンタープライズ (従業員 250名以上、または年間収益 1 千万 US ドル以上) 向けの商用利用に対しては、有償サブスクリプションが必要です。
> この有償サブスクリプションには、2022 年 1 月 31 日までの猶予期間が設けられています。
> 詳しくは [こちら](https://www.docker.com/blog/the-grace-period-for-the-docker-subscription-service-agreement-ends-soon-heres-what-you-need-to-know/){:
 target="_blank" rel="noopener" class="_" id="dkr_docs_cta"} を参照してください。
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
## Docker Desktop 4.7.1
2022-04-19
@y
## Docker Desktop 4.7.1
2022-04-19
@z

@x
> Download Docker Desktop
>
> [For
> Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64){:
> .button .primary-btn }
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64){:
> .button .primary-btn }
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
 - Fixed a bug where update was failing with a symlink error. Fixes [docker/for-win#12650](https://github.com/docker/for-win/issues/12650).
 - Fixed a bug that prevented using Windows container mode. Fixes [docker/for-win#12652](https://github.com/docker/for-win/issues/12652).
 - Fixed a crash on the Quick Start Guide final screen.
@y
 - Fixed a bug where update was failing with a symlink error. Fixes [docker/for-win#12650](https://github.com/docker/for-win/issues/12650).
 - Fixed a bug that prevented using Windows container mode. Fixes [docker/for-win#12652](https://github.com/docker/for-win/issues/12652).
 - Fixed a crash on the Quick Start Guide final screen.
@z

@x
## Docker Desktop 4.7.0
2022-04-07
@y
## Docker Desktop 4.7.0
2022-04-07
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/77141/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/77141/Docker%20Desktop%20Installer.exe)
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
- Update Docker Engine to v20.10.14 to address [CVE-2022-24769](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-24769){: target="_blank" rel="noopener" class="_"}
- Update containerd to v1.5.11 to address [CVE-2022-24769](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-24769)
@y
- Update Docker Engine to v20.10.14 to address [CVE-2022-24769](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-24769){: target="_blank" rel="noopener" class="_"}
- Update containerd to v1.5.11 to address [CVE-2022-24769](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-24769)
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- IT Administrators can now install Docker Desktop remotely using the command line. For more information, see [Install Docker Desktop using the command line](../install.md#install-from-the-command-line).
- Add  the Docker Software Bill of Materials (SBOM) CLI plugin. The new CLI plugin enables users to generate SBOMs for Docker images. For more information, see [Docker SBOM](../../../engine/sbom/index.md).
- Use [cri-dockerd](https://github.com/Mirantis/cri-dockerd){: target="_blank" rel="noopener" class="_"}  for new Kubernetes clusters instead of `dockershim`. The change is transparent from the user's point of view and Kubernetes containers run on the Docker Engine as before. `cri-dockerd` allows Kubernetes to manage Docker containers using the standard [Container Runtime Interface](https://github.com/kubernetes/cri-api#readme){: target="_blank" rel="noopener" class="_"}, the same interface used to control other container runtimes. For more information, see [The Future of Dockershim is cri-dockerd](https://www.mirantis.com/blog/the-future-of-dockershim-is-cri-dockerd/){: target="_blank" rel="noopener" class="_"}.
@y
- IT Administrators can now install Docker Desktop remotely using the command line. For more information, see [Install Docker Desktop using the command line](../install.md#install-from-the-command-line).
- Add  the Docker Software Bill of Materials (SBOM) CLI plugin. The new CLI plugin enables users to generate SBOMs for Docker images. For more information, see [Docker SBOM](../../../engine/sbom/index.md).
- Use [cri-dockerd](https://github.com/Mirantis/cri-dockerd){: target="_blank" rel="noopener" class="_"}  for new Kubernetes clusters instead of `dockershim`. The change is transparent from the user's point of view and Kubernetes containers run on the Docker Engine as before. `cri-dockerd` allows Kubernetes to manage Docker containers using the standard [Container Runtime Interface](https://github.com/kubernetes/cri-api#readme){: target="_blank" rel="noopener" class="_"}, the same interface used to control other container runtimes. For more information, see [The Future of Dockershim is cri-dockerd](https://www.mirantis.com/blog/the-future-of-dockershim-is-cri-dockerd/){: target="_blank" rel="noopener" class="_"}.
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine v20.10.14](https://docs.docker.com/engine/release-notes/#201014)
- [Compose v2.4.1](https://github.com/docker/compose/releases/tag/v2.4.1)
- [Buildx 0.8.2](https://github.com/docker/buildx/releases/tag/v0.8.2)
- [containerd v1.5.11](https://github.com/containerd/containerd/releases/tag/v1.5.11)
- [Go 1.18](https://golang.org/doc/go1.18)
@y
- [Docker Engine v20.10.14](https://docs.docker.com/engine/release-notes/#201014)
- [Compose v2.4.1](https://github.com/docker/compose/releases/tag/v2.4.1)
- [Buildx 0.8.2](https://github.com/docker/buildx/releases/tag/v0.8.2)
- [containerd v1.5.11](https://github.com/containerd/containerd/releases/tag/v1.5.11)
- [Go 1.18](https://golang.org/doc/go1.18)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
 - Fixed a bug where the Registry Access Management policy was never refreshed after a failure.
 - Fixed volume title. Fixes [docker/for-win#12616](https://github.com/docker/for-win/issues/12616).
 - Fixed a bug in the WSL 2 integration that caused Docker commands to stop working after restarting Docker Desktop or after switching to Windows containers.
 - Logs and terminals in the UI now respect your OS theme in light and dark mode.
 - Easily clean up many volumes at once via multi-select checkboxes.
 - Improved login feedback.
@y
 - Fixed a bug where the Registry Access Management policy was never refreshed after a failure.
 - Fixed volume title. Fixes [docker/for-win#12616](https://github.com/docker/for-win/issues/12616).
 - Fixed a bug in the WSL 2 integration that caused Docker commands to stop working after restarting Docker Desktop or after switching to Windows containers.
 - Logs and terminals in the UI now respect your OS theme in light and dark mode.
 - Easily clean up many volumes at once via multi-select checkboxes.
 - Improved login feedback.
@z

@x
## Docker Desktop 4.6.1
2022-03-22
@y
## Docker Desktop 4.6.1
2022-03-22
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/76265/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/76265/Docker%20Desktop%20Installer.exe)
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Buildx 0.8.1](https://github.com/docker/buildx/releases/tag/v0.8.1)
@y
- [Buildx 0.8.1](https://github.com/docker/buildx/releases/tag/v0.8.1)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed diagnostics upload when there is no HTTP proxy set. Fixes [docker/for-mac#6234](https://github.com/docker/for-mac/issues/6234).
- Removed a false positive "vm is not running" error from self-diagnose. Fixes [docker/for-mac#6233](https://github.com/docker/for-mac/issues/6233).
- Prevented spinning in vpnkit-forwarder filling the logs with error messages.
@y
- Fixed diagnostics upload when there is no HTTP proxy set. Fixes [docker/for-mac#6234](https://github.com/docker/for-mac/issues/6234).
- Removed a false positive "vm is not running" error from self-diagnose. Fixes [docker/for-mac#6233](https://github.com/docker/for-mac/issues/6233).
- Prevented spinning in vpnkit-forwarder filling the logs with error messages.
@z

@x
## Docker Desktop 4.6.0
2022-03-14
@y
## Docker Desktop 4.6.0
2022-03-14
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/75818/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/75818/Docker%20Desktop%20Installer.exe)
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
- Fixed [CVE-2022-0847](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0847){: target="_blank" rel="noopener" class="_"}, aka “Dirty Pipe”, an issue that could enable attackers to modify files in container images on the host, from inside a container.
  If using the WSL 2 backend, you must update WSL 2 by running `wsl --update`.
- Fixed [CVE-2022-26659](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-26659){: target="_blank" rel="noopener" class="_"}, which could allow an attacker to overwrite any administrator writable file on the system during the installation or the update of Docker Desktop.
@y
- Fixed [CVE-2022-0847](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-0847){: target="_blank" rel="noopener" class="_"}, aka “Dirty Pipe”, an issue that could enable attackers to modify files in container images on the host, from inside a container.
  If using the WSL 2 backend, you must update WSL 2 by running `wsl --update`.
- Fixed [CVE-2022-26659](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-26659){: target="_blank" rel="noopener" class="_"}, which could allow an attacker to overwrite any administrator writable file on the system during the installation or the update of Docker Desktop.
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- The Docker Dashboard Volume Management feature now offers the ability to efficiently clean up volumes using multi-select checkboxes.
@y
- The Docker Dashboard Volume Management feature now offers the ability to efficiently clean up volumes using multi-select checkboxes.
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine v20.10.13](https://docs.docker.com/engine/release-notes/#201013)
- [Compose v2.3.3](https://github.com/docker/compose/releases/tag/v2.3.3)
- [Buildx 0.8.0](https://github.com/docker/buildx/releases/tag/v0.8.0)
- [containerd v1.4.13](https://github.com/containerd/containerd/releases/tag/v1.4.13)
- [runc v1.0.3](https://github.com/opencontainers/runc/releases/tag/v1.0.3)
- [Go 1.17.8](https://golang.org/doc/go1.17)
- [Linux kernel 5.10.104](https://hub.docker.com/layers/docker/for-desktop-kernel/5.10.104-379cadd2e08e8b25f932380e9fdaab97755357b3/images/sha256-7753b60f4544e5c5eed629d12151a49c8a4b48d98b4fb30e4e65cecc20da484d?context=explore)
@y
- [Docker Engine v20.10.13](https://docs.docker.com/engine/release-notes/#201013)
- [Compose v2.3.3](https://github.com/docker/compose/releases/tag/v2.3.3)
- [Buildx 0.8.0](https://github.com/docker/buildx/releases/tag/v0.8.0)
- [containerd v1.4.13](https://github.com/containerd/containerd/releases/tag/v1.4.13)
- [runc v1.0.3](https://github.com/opencontainers/runc/releases/tag/v1.0.3)
- [Go 1.17.8](https://golang.org/doc/go1.17)
- [Linux kernel 5.10.104](https://hub.docker.com/layers/docker/for-desktop-kernel/5.10.104-379cadd2e08e8b25f932380e9fdaab97755357b3/images/sha256-7753b60f4544e5c5eed629d12151a49c8a4b48d98b4fb30e4e65cecc20da484d?context=explore)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed uploading diagnostics when an HTTPS proxy is set.
- Fixed the UI stuck in `starting` state forever although Docker Desktop is working fine from the command line.
- Fixed missing Docker Desktop systray icon [docker/for-win#12573](https://github.com/docker/for-win/issues/12573)
- Made checking for updates from the systray menu open the Software updates settings section.
- Fixed Registry Access Management under WSL 2 with latest 5.10.60.1 kernel.
- Fixed a UI crash when selecting the containers of a Compose application started from a WSL 2 environment. Fixes [docker/for-win#12567](https://github.com/docker/for-win/issues/12567).
- Fixed copying text from terminal in Quick Start Guide. Fixes [docker/for-win#12444](https://github.com/docker/for-win/issues/12444).
@y
- Fixed uploading diagnostics when an HTTPS proxy is set.
- Fixed the UI stuck in `starting` state forever although Docker Desktop is working fine from the command line.
- Fixed missing Docker Desktop systray icon [docker/for-win#12573](https://github.com/docker/for-win/issues/12573)
- Made checking for updates from the systray menu open the Software updates settings section.
- Fixed Registry Access Management under WSL 2 with latest 5.10.60.1 kernel.
- Fixed a UI crash when selecting the containers of a Compose application started from a WSL 2 environment. Fixes [docker/for-win#12567](https://github.com/docker/for-win/issues/12567).
- Fixed copying text from terminal in Quick Start Guide. Fixes [docker/for-win#12444](https://github.com/docker/for-win/issues/12444).
@z

@x
## Docker Desktop 4.5.1
2022-02-15
@y
## Docker Desktop 4.5.1
2022-02-15
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/74721/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/74721/Docker%20Desktop%20Installer.exe)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue that caused new installations to default to the Hyper-V backend instead of WSL 2.
- Fixed a crash in the Docker Dashboard which would make the systray menu disappear.
@y
- インストールを新たに行うと、バックエンドのデフォルトが WSL 2 ではなく Hyper-V になってしまう不具合を修正しました。
- Docker ダッシュボードにおいて、システムメニューが非表示となってクラッシュしてしまう問題を修正しました。
@z

@x
If you are running Docker Desktop on Windows Home, installing 4.5.1 will switch it back to WSL 2 automatically. If you are running another version of Windows, and you want Docker Desktop to use the WSL 2 backend, you must manually switch by enabling the **Use the WSL 2 based engine** option in the **Settings > General** section.
Alternatively, you can edit the Docker Desktop settings file located at `%APPDATA%\Docker\settings.json` and manually switch the value of the `wslEngineEnabled` field to `true`.
@y
Windows Home 上において Docker Desktop を実行している場合、4.5.1 をインストールすると、自動的に WSL 2 に切り替わります。
この他の Windows バージョンを利用していて Docker Desktop において WSL 2 バックエンドを利用したい場合は、**Settings > General** セクションにおいて **Use the WSL 2 based engine** オプションを手動で有効にしなければなりません。
あるいは`%APPDATA%\Docker\settings.json`にある Docker Desktop 設定ファイルを編集して、`wslEngineEnabled`設定を`true`にすることで手動設定することもできます。
@z

@x
## Docker Desktop 4.5.0
2022-02-10
@y
## Docker Desktop 4.5.0
2022-02-10
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
- Fixed [CVE-2022-23774](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-23774){: target="_blank" rel="noopener" class="_"} where Docker Desktop allows attackers to move arbitrary files.
@y
- [CVE-2022-23774](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-23774){: target="_blank" rel="noopener" class="_"} を修正しました。
  これは Docker Desktop を通じて、攻撃者が任意のファイルを移動できるものでした。
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- Docker Desktop 4.5.0 introduces a new version of the Docker menu which creates a consistent user experience across all operating systems. For more information, see the blog post [New Docker Menu & Improved Release Highlights with Docker Desktop 4.5](https://www.docker.com/blog/new-docker-menu-improved-release-highlights-with-docker-desktop-4-5/){: target="_blank" rel="noopener" class="_"}
- The 'docker version' output now displays the version of Docker Desktop installed on the machine.
@y
- Docker Desktop 4.5.0 では Docker メニューの新バージョンを導入しています。
  これによってユーザーは、あらゆるオペレーティングシステムにわたって共通した操作が実現できます。
  詳しくは以下のブログ投稿 [New Docker Menu & Improved Release Highlights with Docker Desktop 4.5](https://www.docker.com/blog/new-docker-menu-improved-release-highlights-with-docker-desktop-4-5/){: target="_blank" rel="noopener" class="_"} を参照してください。
- 'docker version'による出力において、マシンにインストールされている Docker Desktop のバージョンを表示するようにしました。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Amazon ECR Credential Helper v0.6.0](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.6.0){: target="blank" rel="noopener" class=""}
@y
- [Amazon ECR Credential Helper v0.6.0](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.6.0){: target="blank" rel="noopener" class=""}
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Increased the filesystem watch (inotify) limits by setting `fs.inotify.max_user_watches=1048576` and `fs.inotify.max_user_instances=8192` in Linux. Fixes [docker/for-mac#6071](https://github.com/docker/for-mac/issues/6071).
- Fixed an issue related to compose app started with version 2, but the dashboard only deals with version 1
- Fixed an issue where Docker Desktop incorrectly prompted users to sign in after they quit Docker Desktop and start the application.
@y
- Linux におけるファイルシステムの監視 (inotify) の制限を、`fs.inotify.max_user_watches=1048576`と`fs.inotify.max_user_instances=8192`を用いて増やすことにしました。
  [docker/for-mac#6071](https://github.com/docker/for-mac/issues/6071) を Fix に。
- ダッシュボードでは Compose バージョン 1 しか取り扱っていないのに、バージョン 2 によって Compose アプリが起動された際の問題を修正しました。
- Docker Desktop を停止してアプリケーションを起動した後に、誤ってユーザーへのサインインを促していた問題を修正しました。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
Installing Docker Desktop 4.5.0 from scratch has a bug which defaults Docker Desktop to use the Hyper-V backend instead of WSL 2. This means, Windows Home users will not be able to start Docker Desktop as WSL 2 is the only supported backend. To work around this issue, you must uninstall 4.5.0 from your machine and then download and install Docker Desktop 4.5.1 or a higher version. Alternatively, you can edit the Docker Desktop settings.json file located at `%APPDATA%\Docker\settings.json` and manually switch the value of the `wslEngineEnabled` field to `true`.
@y
Installing Docker Desktop 4.5.0 from scratch has a bug which defaults Docker Desktop to use the Hyper-V backend instead of WSL 2. This means, Windows Home users will not be able to start Docker Desktop as WSL 2 is the only supported backend. To work around this issue, you must uninstall 4.5.0 from your machine and then download and install Docker Desktop 4.5.1 or a higher version. Alternatively, you can edit the Docker Desktop settings.json file located at `%APPDATA%\Docker\settings.json` and manually switch the value of the `wslEngineEnabled` field to `true`.
@z

@x
## Docker Desktop 4.4.4
2022-01-24
@y
## Docker Desktop 4.4.4
2022-01-24
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/73704/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/73704/Docker%20Desktop%20Installer.exe)
@z

%@x
%### Security
%@y
%{: #security }
%### セキュリティ
%@z

%@x
%- Fixed [CVE-2022-23774](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-23774) where arbitrary files could be moved on the system.
%@y
%- システム内の任意のファイルが移動できてしまう [CVE-2022-23774](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-23774) を修正しました。
%@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed logging in from WSL 2. Fixes [docker/for-win#12500](https://github.com/docker/for-win/issues/12500).
@y
- WSL 2 からのログインを修正しました。
  [docker/for-win#12500](https://github.com/docker/for-win/issues/12500) を Fix に。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- Clicking **Proceed to Desktop** after signing in through the browser, sometimes does not bring the Dashboard to the front.
- After logging in, when the Dashboard receives focus, it sometimes stays in the foreground even when clicking a background window. As a workaround you need to click the Dashboard before clicking another application window.
- The tips of the week show on top of the mandatory login dialog when an organization restriction is enabled via a `registry.json` file.
@y
- ブラウザー上からサインインした後に **Proceed to Desktop** (Desktop へ進む) をクリックすると、ダッシュボード画面が前面に表示されない場合があります。
- ログインしてダッシュボード画面にフォーカスが当たった後に、背後の画面をクリックしても、前面に表示されたままとなる場合があります。
  回避策として、他のアプリケーション画面をクリックする前に、一度ダッシュボード画面をクリックしてください。
- `registry.json`ファイルを通じて組織に対する制限が有効になっている場合に、必ず実施するログイン画面において、その上段に今週のメモ (tip) が表示されます。
@z

@x
## Docker Desktop 4.4.3
2022-01-14
@y
## Docker Desktop 4.4.3
2022-01-14
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/73365/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/73365/Docker%20Desktop%20Installer.exe)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Disabled Dashboard shortcuts to prevent capturing them even when minimized or un-focussed. Fixes [docker/for-win#12495](https://github.com/docker/for-win/issues/12495).
@y
- ダッシュボードに対するショートカットは、画面最小化時や非フォーカス時にも反応しないようにしました。
  [docker/for-win#12495](https://github.com/docker/for-win/issues/12495) を Fix に。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- Clicking **Proceed to Desktop** after signing in through the browser, sometimes does not bring the Dashboard to the front.
- After logging in, when the Dashboard receives focus, it sometimes stays in the foreground even when clicking a background window. As a workaround you need to click the Dashboard before clicking another application window.
- The tips of the week show on top of the mandatory login dialog when an organization restriction is enabled via a `registry.json` file.
@y
- ブラウザー上からサインインした後に **Proceed to Desktop** (Desktop へ進む) をクリックすると、ダッシュボード画面が前面に表示されない場合があります。
- ログインしてダッシュボード画面にフォーカスが当たった後に、背後の画面をクリックしても、前面に表示されたままとなる場合があります。
  回避策として、他のアプリケーション画面をクリックする前に、一度ダッシュボード画面をクリックしてください。
- `registry.json`ファイルを通じて組織に対する制限が有効になっている場合に、必ず実施するログイン画面において、その上段に今週のメモ (tip) が表示されます。
@z

@x
## Docker Desktop 4.4.2
2022-01-13
@y
## Docker Desktop 4.4.2
2022-01-13
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/73305/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/73305/Docker%20Desktop%20Installer.exe)
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
- Fixed [CVE-2021-45449](https://docs.docker.com/security/#cve-2021-45449) that affects users currently on Docker Desktop version 4.3.0 or 4.3.1.
@y
- 現時点において Docker Desktop バージョン 4.3.0 および 4.3.1 のユーザーに影響する [CVE-2021-45449](https://docs.docker.com/security/#cve-2021-45449) を修正しました。
@z

@x
Docker Desktop version 4.3.0 and 4.3.1 has a bug that may log sensitive information (access token or password) on the user's machine during login.
This only affects users if they are on Docker Desktop 4.3.0, 4.3.1 and the user has logged in while on 4.3.0, 4.3.1. Gaining access to this data would require having access to the user’s local files.
@y
Docker Desktop バージョン 4.3.0 と 4.3.1 にはバグがあります。
ログインの際に、ユーザーマシン内に機密情報 (アクセストークンやパスワード) をログ出力することがあります。
この影響を受けるのは、Docker Desktop 4.3.0 または 4.3.1 をインストールしていて、それを使ってログインをしているユーザーに限ります。
このデータにアクセスするには、ユーザーのローカルファイルにアクセスする必要があります。
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- Easy, Secure sign in with Auth0 and Single Sign-on
  - Single Sign-on: Users with a Docker Business subscription can now configure SSO to authenticate using their identity providers (IdPs) to access Docker. For more information, see [Single Sign-on](../../../single-sign-on/index.md).
  - Signing in to Docker Desktop now takes you through the browser so that you get all the benefits of auto-filling from password managers.
@y
- Auth0 とシングルサインオンを使った、簡単でセキュアなサインイン
  - シングルサインオン: Docker Business サブスクリプションを使うユーザーは、Docker にアクセスする際に、アイデンティティープロバイダー (IdPs) を使って認証するように SSO を設定できるようになりました。
    詳しくは [シングルサインオン](../../../single-sign-on/index.md) を参照してください。
  - Docker Desktop へのサインインは、ブラウザーを通じて可能になりました。
    したがってパスワードマネージャーによる自動入力機能を活用することができます。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine v20.10.12](https://docs.docker.com/engine/release-notes/#201012)
- [Compose v2.2.3](https://github.com/docker/compose/releases/tag/v2.2.3)
- [Kubernetes 1.22.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.22.5)
- [docker scan v0.16.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.16.0){: target="_blank" rel="noopener" class="_"}
@y
- [Docker Engine v20.10.12](https://docs.docker.com/engine/release-notes/#201012)
- [Compose v2.2.3](https://github.com/docker/compose/releases/tag/v2.2.3)
- [Kubernetes 1.22.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.22.5)
- [docker scan v0.16.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.16.0){: target="_blank" rel="noopener" class="_"}
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop displays an error if `registry.json` contains more than one organization in the `allowedOrgs` field. If you are using multiple organizations for different groups of developers, you must provision a separate `registry.json` file for each group.
- Fixed a regression in Compose that reverted the container name separator from `-` to `_`. Fixes [docker/compose-switch](https://github.com/docker/compose-switch/issues/24).
- Doing a `Reset to factory defaults` no longer shuts down Docker Desktop.
@y
- Docker Desktop の`registry.json`においては、`allowedOrgs`項目に複数組織が含まれる場合にはエラーになります。
  異なる開発グループにおいて複数の組織を利用する場合には、各グループごとに`registry.json`ファイルを分けなければなりません。
- Compose において、コンテナー名のセパレーター`-`が`_`になってしまった不備を修正しました。
  [docker/compose-switch](https://github.com/docker/compose-switch/issues/24) を Fix に。
- `Reset to factory defaults`を行っても Docker Desktop をシャットダウンしないようにしました。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- Clicking «Proceed to Desktop» after logging in in the browser, sometimes does not bring the Dashboard to the front.
- After logging in, when the Dashboard receives focus, it sometimes stays in the foreground even when clicking a background window. As a workaround you need to click the Dashboard before clicking another application window.
- The tips of the week show on top of the mandatory login dialog when an organization restriction is enabled via a `registry.json` file.
- When the Dashboard is open, even if it does not have focus or is minimized, it will still catch keyboard shortcuts (e.g. ctrl-r for Restart)
@y
- ブラウザーからログインした後に «Proceed to Desktop» をクリックすると、ダッシュボード画面が前面に表示されない場合があります。
- ログインしてダッシュボード画面にフォーカスが当たった後に、背後の画面をクリックしても、前面に表示されたままとなる場合があります。
  回避策として、他のアプリケーション画面をクリックする前に、一度ダッシュボード画面をクリックしてください。
- `registry.json`ファイルを通じて組織に対する制限が有効になっている場合に、必ず実施するログイン画面において、その上段に今週のメモ (tip) が表示されます。
- ダッシュボードを開いている際に、フォーカスがない場合や最小化されている場合でも、キーボードショートカットを検出してしまいます (たとえば再起動を行う ctrl-r など)。
@z

@x
## Docker Desktop 4.3.2
2021-12-21
@y
## Docker Desktop 4.3.2
2021-12-21
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/72729/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/72729/Docker%20Desktop%20Installer.exe)
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
- Fixed [CVE-2021-45449](https://docs.docker.com/security/#cve-2021-45449) that affects users currently on Docker Desktop version 4.3.0 or 4.3.1.
@y
- 現時点において Docker Desktop バージョン 4.3.0 および 4.3.1 のユーザーに影響する [CVE-2021-45449](https://docs.docker.com/security/#cve-2021-45449) を修正しました。
@z

@x
Docker Desktop version 4.3.0 and 4.3.1 has a bug that may log sensitive information (access token or password) on the user's machine during login.
This only affects users if they are on Docker Desktop 4.3.0, 4.3.1 and the user has logged in while on 4.3.0, 4.3.1. Gaining access to this data would require having access to the user’s local files.
@y
Docker Desktop バージョン 4.3.0 と 4.3.1 にはバグがあります。
ログインの際に、ユーザーマシン内に機密情報 (アクセストークンやパスワード) をログ出力することがあります。
この影響を受けるのは、Docker Desktop 4.3.0 または 4.3.1 をインストールしていて、それを使ってログインをしているユーザーに限ります。
このデータにアクセスするには、ユーザーのローカルファイルにアクセスする必要があります。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
[docker scan v0.14.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.14.0){: target="_blank" rel="noopener" class="_"}
@y
[docker scan v0.14.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.14.0){: target="_blank" rel="noopener" class="_"}
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
**Log4j 2 CVE-2021-44228**: We have updated the `docker scan` CLI plugin.
This new version of `docker scan` is able to detect [Log4j 2
CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228){:
target="_blank" rel="noopener" class="_"} and [Log4j 2
CVE-2021-45046](https://nvd.nist.gov/vuln/detail/CVE-2021-45046)
@y
**Log4j 2 CVE-2021-44228**: `docker scan` CLI プラグインを更新しました。
この`docker scan`の新バージョンは [Log4j 2
CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228){:
target="_blank" rel="noopener" class="_"} と [Log4j 2
CVE-2021-45046](https://nvd.nist.gov/vuln/detail/CVE-2021-45046) を検出できるようになりました。
@z

@x
For more information, read the blog post [Apache Log4j 2
CVE-2021-44228](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/){: target="_blank" rel="noopener" class="_"}.
@y
詳しくはブログ投稿 [Apache Log4j 2 CVE-2021-44228](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
## Docker Desktop 4.3.1
2021-12-11
@y
## Docker Desktop 4.3.1
2021-12-11
@z

@x
> Download Docker Desktop
>
> [For Windows](https://desktop.docker.com/win/main/amd64/72247/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/72247/Docker%20Desktop%20Installer.exe)
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
[docker scan v0.11.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.11.0){: target="_blank" rel="noopener" class="_"}
@y
[docker scan v0.11.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.11.0){: target="_blank" rel="noopener" class="_"}
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
**Log4j 2 CVE-2021-44228**: We have updated the `docker scan` CLI plugin for you.
Older versions of `docker scan` in Docker Desktop 4.3.0 and earlier versions are
not able to detect [Log4j 2
CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228){:
target="_blank" rel="noopener" class="_"}.
@y
**Log4j 2 CVE-2021-44228**: `docker scan` CLI プラグインを更新しました。
Docker Desktop 4.3.0 およびそれ以前の`docker scan`では、[Log4j 2
CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228){:
target="_blank" rel="noopener" class="_"} を検出することはできません。
@z

@x
For more information, read the
blog post [Apache Log4j 2
CVE-2021-44228](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/){: target="_blank" rel="noopener" class="_"}.
@y
詳しくはブログ投稿 [Apache Log4j 2 CVE-2021-44228](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/){: target="_blank" rel="noopener" class="_"} を参照してください。
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
> [For Windows](https://desktop.docker.com/win/main/amd64/71786/Docker%20Desktop%20Installer.exe)
@y
> Docker Desktop のダウンロード
>
> [Windows 向け](https://desktop.docker.com/win/main/amd64/71786/Docker%20Desktop%20Installer.exe)
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
  - Containers running `systemd` need the following options: [`--privileged
    --cgroupns=host -v
    /sys/fs/cgroup:/sys/fs/cgroup:rw`](https://serverfault.com/questions/1053187/systemd-fails-to-run-in-a-docker-container-when-using-cgroupv2-cgroupns-priva).
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
### Known issue
@y
{: #known-issue }
### 既知の問題
@z

@x
Docker Dashboard incorrectly displays the container memory usage as zero on
Hyper-V based machines.
You can use the [`docker stats`](../../../engine/reference/commandline/stats.md)
command on the command line as a workaround to view the
actual memory usage. See
[docker/for-mac#6076](https://github.com/docker/for-mac/issues/6076).
@y
Docker ダッシュボードでは、Hyper-V ベースのマシン上において、コンテナーのメモリー使用量を誤ってゼロと表示することがあります。
この回避策としては、コマンドライン上から [`docker stats`](../../../engine/reference/commandline/stats.md) を実行して、実際のメモリー使用量を確認してください。
[docker/for-mac#6076](https://github.com/docker/for-mac/issues/6076) 参照。
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
