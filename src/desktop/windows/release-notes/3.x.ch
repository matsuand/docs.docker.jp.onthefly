%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Windows 3.x Release notes
keywords: Docker Desktop for Windows 3.x, release notes
title: Docker for Windows 3.x release notes
toc_min: 1
toc_max: 2
redirect_from:
  - /desktop/windows/previous-versions/
  - /docker-for-windows/previous-versions/
---
@y
---
description: Docker Desktop for Windows 3.x リリースノート。
keywords: Docker Desktop for Windows 3.x, release notes
title: Docker for Windows 3.x リリースノート
toc_min: 1
toc_max: 2
redirect_from:
  - /desktop/windows/previous-versions/
  - /docker-for-windows/previous-versions/
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
## Docker Desktop 3.6.0
2021-08-11
@y
## Docker Desktop 3.6.0
2021-08-11
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/67351/Docker Desktop Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/67351/Docker Desktop Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- **Dev Environments**: You can now create a Dev Environment from your local Git repository. For more information, see [Start a Dev Environment from a local folder](../../dev-environments.md#start-a-dev-environment-from-a-local-folder).
- **Volume Management**: You can now sort volumes by the name, the date created, and the size of the volume. You can also search for specific volumes using the **Search** field. For more information, see [Explore volumes](../../dashboard.md#explore-volumes).
@y
- **Dev 環境**: 
Dev 環境はローカル Git リポジトリから生成できるようになりました。
詳細は [ローカルフォルダーからの Dev 環境の起動](../../dev-environments.md#start-a-dev-environment-from-a-local-folder) を参照してください。
- **ボリューム管理**: ボリューム一覧では、名前、生成時刻、ボリュームサイズによってソートできるようになりました。
また **Search** (検索) 欄を使って、ボリューム検索もできるようになりました。
詳しくは [リモートリポジトリとのやりとり](../../dashboard.md#explore-volumes) を参照してください。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Compose V2 RC1](https://github.com/docker/compose-cli/releases/tag/v2.0.0-rc.1)
  - Docker compose command line completion.
  - Allow setting 0 scale/replicas.
  - Detect new container on logs —follow.
- [Go 1.16.7](https://github.com/golang/go/releases/tag/go1.16.7)
- [Docker Engine 20.10.8](https://docs.docker.com/engine/release-notes/#20108)
- [containerd v1.4.9](https://github.com/containerd/containerd/releases/tag/v1.4.9)
- [runc v1.0.1](https://github.com/opencontainers/runc/releases/tag/v1.0.1)
- [Kubernetes 1.21.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.3)
- [Linux kernel 5.10.47](https://hub.docker.com/layers/docker/for-desktop-kernel/5.10.47-0b705d955f5e283f62583c4e227d64a7924c138f/images/sha256-a4c79bc185ec9eba48dcc802a8881b9d97e532b3f803d23e5b8d4951588f4d51?context=repo)
@y
- [Compose V2 RC1](https://github.com/docker/compose-cli/releases/tag/v2.0.0-rc.1)
  - Docker compose コマンドライン補完。
  - スケール/レプリカに対する 0 設定。
  - logs コマンドの —follow における新規コンテナーの検出。
- [Go 1.16.7](https://github.com/golang/go/releases/tag/go1.16.7)
- [Docker Engine 20.10.8](https://docs.docker.com/engine/release-notes/#20108)
- [containerd v1.4.9](https://github.com/containerd/containerd/releases/tag/v1.4.9)
- [runc v1.0.1](https://github.com/opencontainers/runc/releases/tag/v1.0.1)
- [Kubernetes 1.21.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.3)
- [Linux kernel 5.10.47](https://hub.docker.com/layers/docker/for-desktop-kernel/5.10.47-0b705d955f5e283f62583c4e227d64a7924c138f/images/sha256-a4c79bc185ec9eba48dcc802a8881b9d97e532b3f803d23e5b8d4951588f4d51?context=repo)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Update kernel configuration to fix a performance regression in [Docker Desktop 3.0.0](#docker-desktop-300)
  that caused publishing container ports to take 10 times longer than on older
  versions. For more information, see [linuxkit/linuxkit#3701](https://github.com/linuxkit/linuxkit/pull/3701)
  and [docker/for-mac#5668](https://github.com/docker/for-mac/issues/5668).
- Fixed a bug where the DNS server would fail after receiving an unexpectedly large datagram.
- Fixed spurious traces on iptables updates.
- Fixed slowness when adding multiple ports forwarding option.
- Fixed bug where the WSL 2 synchonization code creates dangling symlinks if the WSL 2 home directory if it is the same as the Windows home directory. Fixes [docker/for-win#11668](https://github.com/docker/for-win/issues/11668).
- Fixed `docker context ls` after upgrade from 3.5.x when the Linux WSL 2 home directory is the same as the Windows home directory.
- Fixed the permissions on `%PROGRAMDATA%\Docker` to avoid a potential Windows containers compromise. See [CVE-2021-37841](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-37841){:target="_blank" rel="noopener" class="_"}. Thanks to [Alessio Dalla Piazza](http://it.linkedin.com/in/alessiodallapiazza) for discovering the issue and to @kevpar for helpful discussion.
- Fixed bug where the Linux home directory under WSL 2 was set to the Windows home directory e.g. `/mnt/c/Users/...`.
- Fixed bug where Desktop would fail to start if it could not parse CLI contexts. Fixes [docker/for-win#11601](https://github.com/docker/for-win/issues/11601).
- Fixed an issue related to log display inside a container [docker/for-win#11251](https://github.com/docker/for-win/issues/11251).
- Fixed failures of the Windows Background Intelligent Transfer Service preventing Docker Desktop to start. [docker/for-win#11273](https://github.com/docker/for-win/issues/11273)
@y
- [Docker Desktop 3.0.0](#docker-desktop-300) における性能劣化を修正するため、カーネル設定を更新しました。
  この問題は、それまでのバージョンに比べて、コンテナーのポート公開に 10 回以上も多くかけていました。
  詳しくは [linuxkit/linuxkit#3701](https://github.com/linuxkit/linuxkit/pull/3701) と [docker/for-mac#5668](https://github.com/docker/for-mac/issues/5668) を参照のこと。
- 不意に大量のデータグラムを受信した際に、DNS サーバーが失敗するバグを修正しました。
- iptables アップデートにおける誤ったトレースを修正しました。
- 複数のポート転送オプションを追加した際の、速度低下を修正しました。
- WSL 2 のホームディレクトリが Windows のホームディレクトリと同じである場合に、WSL 2 の同期コードが、不明なシンボリックリンクを生成してしまうバグを修正しました。
  [docker/for-win#11668](https://github.com/docker/for-win/issues/11668) を Fix に。
- Linux WSL 2 のホームディレクトリが Windows のホームディレクトリと同じである場合に、3.5.x からアップグレードした後の`docker context ls`を修正しました。 
- Windows コンテナーが潜在的に侵害される可能性があっため、その回避のため`%PROGRAMDATA%\Docker`の権限を修正しました。 
  [CVE-2021-37841](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-37841){:target="_blank" rel="noopener" class="_"} を参照のこと。
  この問題を発見し @kevpar に有益な議論をあげてくれた　[Alessio Dalla Piazza](http://it.linkedin.com/in/alessiodallapiazza) に感謝。
- Linux の WSL 2 のホームディレクトリが Windows のホームディレクトリ、つまり`/mnt/c/Users/...`に設定されていたバグを修正しました。
- CLI コンテキストを解析できない場合に、デスクトップが起動に失敗するバグを修正しました。
  [docker/for-win#11601](https://github.com/docker/for-win/issues/11601) を Fix に。
- コンテナー内のログ表示に関する問題を修正しました。
  [docker/for-win#11251](https://github.com/docker/for-win/issues/11251)
- Windows バックグラウンドインテリジェント転送サービスが、DockerDesktop の起動を妨げるという障害があったため、修正しました。 
  [docker/for-win#11273](https://github.com/docker/for-win/issues/11273)
@z

@x
## Docker Desktop 3.5.2
2021-07-08
@y
## Docker Desktop 3.5.2
2021-07-08
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/66501/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/66501/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Dev Environments Preview**: Dev Environments enable you to seamlessly collaborate with your team members without moving between Git branches to get your code onto your team members' machines. When using Dev Environments, you can share your in-progress work with your team members in just one click, and without having to deal with any merge conflicts. For more information and for instructions on how to use Dev Environments, see [Development Environments Preview](../../dev-environments.md).
@y
**Dev 環境プレビュー**: Dev 環境はチームメンバーとの間で、シームレスに共同作業を実現できます。
その場合にチームメンバーは、自分のマシンに Git ブランチを取り込むことなく作業が進められます。
Dev 環境を使えば 1 クリックするだけで、作業中の環境をチームメンバーと共有できます。
そしてマージコンフリクトに対処する必要もありません。
Dev 環境に関する詳しい情報、あるいは利用手順については [Dev 環境プレビュー](../../dev-environments.md) を参照してください。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Compose V2 beta 6](https://github.com/docker/compose-cli/releases/tag/v2.0.0-beta.6)
  - `compose run` and `compose exec` commands use separate streams for stdout and stderr. See [docker/compose-cli#1873](https://github.com/docker/compose-cli/issues/1873).
  - `compose run` and `compose exec` commands support detach keys. Fixes [docker/compose-cli#1709](https://github.com/docker/compose-cli/issues/1709).
  - Fixed `--force` and `--volumes` flags on `compose rm` command. See [docker/compose-cli#1844](https://github.com/docker/compose-cli/issues/1844).
  - Fixed network's IPAM configuration. Service can define a fixed IP. Fixes for [docker/compose-cli#1678](https://github.com/docker/compose-cli/issues/1678) and [docker/compose-cli#1816](https://github.com/docker/compose-cli/issues/1816)
@y
- [Compose V2 ベータ 6](https://github.com/docker/compose-cli/releases/tag/v2.0.0-beta.6)
  - `compose run`と`compose exec`のコマンドでは、stdout と stderr のストリームを分けるようにしました。
    [docker/compose-cli#1873](https://github.com/docker/compose-cli/issues/1873) 参照。
  - `compose run`と`compose exec`において、デタッチキー (detach key) をサポートしました。
    [docker/compose-cli#1709](https://github.com/docker/compose-cli/issues/1709) を Fix に。
  - `compose rm`コマンドにおける`--force`と`--volumes`フラグを修正しました。
    [docker/compose-cli#1844](https://github.com/docker/compose-cli/issues/1844) 参照。
  - ネットワーク IPAM 設定を修正しました。
    サービスでは固定 IP を定義できるようになりました。
    [docker/compose-cli#1678](https://github.com/docker/compose-cli/issues/1678) と [docker/compose-cli#1816](https://github.com/docker/compose-cli/issues/1816) を Fix に。
@z

@x
- Dev Environments
  - Support VS Code Insiders. See [dev-environments#3](https://github.com/docker/dev-environments/issues/3)
  - Allow users to specify a branch when cloning a project. See [dev-environments#11](https://github.com/docker/dev-environments/issues/11)
@y
- Dev 環境
  - VS Code Insiders をサポートしました。
    [dev-environments#3](https://github.com/docker/dev-environments/issues/3) 参照。
  - プロジェクトのクローン時にブランチ指定を可能にしました。
    [dev-environments#11](https://github.com/docker/dev-environments/issues/11) 参照。
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Dev Environments: Fixed a blank screen in some create and remove scenarios. Fixes [dev-environments#4](https://github.com/docker/dev-environments/issues/4)
- Dev Environments: Fixed error handling when removing an environment. Fixes [dev-environments#8](https://github.com/docker/dev-environments/issues/8)
- Dev Environments: The **Start**, **Stop**, and **Share** buttons are disabled while an environment is being created or removed.
- Do not automatically switch CLI contexts on application start or when switching between Windows and Linux containers. Fixes [docker/for-mac#5787](https://github.com/docker/for-mac/issues/5787) and [docker/for-win#11530](https://github.com/docker/for-win/issues/11530).
- Fixed spurious traces on iptables updates.
- Fixed a delay when adding a multiple port forwarding option.
@y
- Dev 環境: 特定のシナリオ生成、削除における空画面を修正しました。
  [dev-environments#4](https://github.com/docker/dev-environments/issues/4) を Fix に。
- Dev 環境: 環境削除時のエラーハンドリングを修正しました。
  [dev-environments#8](https://github.com/docker/dev-environments/issues/8) を Fix に。
- Dev 環境: 環境の生成中あるいは削除中には、**Start**, **Stop**, **Share** の各ボタンを無効にしました。
- アプリケーション起動時、あるいは Windows－Linux コンテナー間の切り替え時に、CLI コンテキストが自動変更されないようにしました。
  [docker/for-mac#5787](https://github.com/docker/for-mac/issues/5787) と [docker/for-win#11530](https://github.com/docker/for-win/issues/11530) を Fix に。
- iptables アップデート時のトレース誤動作を修正しました。
- 複数のポートフォワードオプション追加時の遅延を修正しました。
@z

@x
## Docker Desktop 3.5.1
2021-06-25
@y
## Docker Desktop 3.5.1
2021-06-25
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/66090/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/66090/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Dev Environments Preview**: Dev Environments enable you to seamlessly collaborate with your team members without moving between Git branches to get your code onto your team members' machines. When using Dev Environments, you can share your in-progress work with your team members in just one click, and without having to deal with any merge conflicts. For more information and for instructions on how to use Dev Environments, see [Development Environments Preview](../../dev-environments.md).
@y
**Dev 環境プレビュー**: Dev 環境はチームメンバーとの間で、シームレスに共同作業を実現できます。
その場合にチームメンバーは、自分のマシンに Git ブランチを取り込むことなく作業が進められます。
Dev 環境を使えば 1 クリックするだけで、作業中の環境をチームメンバーと共有できます。
そしてマージコンフリクトに対処する必要もありません。
Dev 環境に関する詳しい情報、あるいは利用手順については [Dev 環境プレビュー](../../dev-environments.md) を参照してください。
@z

@x
**Compose V2 beta**: Docker Desktop now includes the beta version of Compose V2, which supports the `docker compose` command as part of the Docker CLI. For more information, see [Compose V2 beta](../../../compose/cli-command.md). While `docker-compose` is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. The compose command in the Docker CLI supports most of the `docker-compose` commands and flags. It is expected to be a drop-in replacement for `docker-compose`. There are a few remaining flags that have yet to be implemented, see the [docker-compose compatibility list](../../../compose/cli-command-compatibility.md) for more information about the flags that are supported in the new compose command. If you run into any problems with Compose V2, you can easily switch back to Compose v1 by either by making changes in Docker Desktop **Experimental** Settings, or by running the command `docker-compose disable-v2`. Let us know your feedback on the new ‘compose’ command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues) GitHub repository.
@y
**Compose V2 ベータ**: Docker Desktop に Compose V2 ベータバージョンを含めました。
これは Docker CLI の一部として`docker compose`コマンドをサポートするものです。
詳しくは [Compose V2 ベータ](../../../compose/cli-command.md) を参照してください。
`docker-compose`は、今もサポートされ保守も行われています。
しかし Compose V2 の実装は、仕様の一部としてメンテナンスされている compose-go バインディングに直接基づいています。
Docker CLI の compose コマンドは、`docker-compose`コマンドとフラグをほぼサポートしています。
そこでこれらは`docker-compose`コマンドの代わりになるものとされます。
ただしまだ実装できていないフラグがいくつか残っています。
新たな compose コマンドにおいてサポートされているフラグの情報は [docker-compose 互換性リスト](../../../compose/cli-command-compatibility.md) を参照してください。
Compose V2 の利用にあたって何か問題が発生したら、簡単に Compose V1 に戻すことができます。
その方法は Docker Desktop の **Experimental** (試験的機能) の設定を変更するか、あるいはコマンド`docker-compose disable-v2`を実行します。
新しい`compose`コマンドへのフィードバックは、GitHub リポジトリ [Compose-CLI](https://github.com/docker/compose-cli/issues) に issue を新規生成してお知らせください。
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a bug where users could not install Docker Desktop when the path to the temp folder contained dots. Fixes [docker/for-win#11514](https://github.com/docker/for-win/issues/11514)
- Fixed a link to the policy that provides details on how Docker handles the uploaded diagnostics data. Fixes [docker/for-mac#5741](https://github.com/docker/for-mac/issues/5741)
@y
- 一時フォルダーへのパスにドットが含まれていると、Docker Desktop がインストールできない場合があるバグを修正しました。
  [docker/for-win#11514](https://github.com/docker/for-win/issues/11514) を Fix に。
- アップロードされた診断データを Docker がどのように取り扱うかを詳細に示したポリシーへのリンクを修正しました。
  [docker/for-mac#5741](https://github.com/docker/for-mac/issues/5741) を Fix に。
@z

@x
## Docker Desktop 3.5.0
2021-06-23
@y
## Docker Desktop 3.5.0
2021-06-23
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/66024/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/66024/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Dev Environments Preview**: Dev Environments enable you to seamlessly collaborate with your team members without moving between Git branches to get your code onto your team members' machines. When using Dev Environments, you can share your in-progress work with your team members in just one click, and without having to deal with any merge conflicts. For more information and for instructions on how to use Dev Environments, see [Development Environments Preview](../../dev-environments.md).
@y
**Dev 環境プレビュー**: Dev 環境はチームメンバーとの間で、シームレスに共同作業を実現できます。
その場合にチームメンバーは、自分のマシンに Git ブランチを取り込むことなく作業が進められます。
Dev 環境を使えば 1 クリックするだけで、作業中の環境をチームメンバーと共有できます。
そしてマージコンフリクトに対処する必要もありません。
Dev 環境に関する詳しい情報、あるいは利用手順については [Dev 環境プレビュー](../../dev-environments.md) を参照してください。
@z

@x
**Compose V2 beta**: Docker Desktop now includes the beta version of Compose V2, which supports the `docker compose` command as part of the Docker CLI. For more information, see [Compose V2 beta](../../../compose/cli-command.md). While `docker-compose` is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. The compose command in the Docker CLI supports most of the `docker-compose` commands and flags. It is expected to be a drop-in replacement for `docker-compose`. There are a few remaining flags that have yet to be implemented, see the [docker-compose compatibility list](../../../compose/cli-command-compatibility.md) for more information about the flags that are supported in the new compose command. If you run into any problems with Compose V2, you can easily switch back to Compose v1 by either by making changes in Docker Desktop **Experimental** Settings, or by running the command `docker-compose disable-v2`. Let us know your feedback on the new ‘compose’ command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues) GitHub repository.
@y
**Compose V2 ベータ**: Docker Desktop に Compose V2 ベータバージョンを含めました。
これは Docker CLI の一部として`docker compose`コマンドをサポートするものです。
詳しくは [Compose V2 ベータ](../../../compose/cli-command.md) を参照してください。
`docker-compose`は、今もサポートされ保守も行われています。
しかし Compose V2 の実装は、仕様の一部としてメンテナンスされている compose-go バインディングに直接基づいています。
Docker CLI の compose コマンドは、`docker-compose`コマンドとフラグをほぼサポートしています。
そこでこれらは`docker-compose`コマンドの代わりになるものとされます。
ただしまだ実装できていないフラグがいくつか残っています。
新たな compose コマンドにおいてサポートされているフラグの情報は [docker-compose 互換性リスト](../../../compose/cli-command-compatibility.md) を参照してください。
Compose V2 の利用にあたって何か問題が発生したら、簡単に Compose V1 に戻すことができます。
その方法は Docker Desktop の **Experimental** (試験的機能) の設定を変更するか、あるいはコマンド`docker-compose disable-v2`を実行します。
新しい`compose`コマンドへのフィードバックは、GitHub リポジトリ [Compose-CLI](https://github.com/docker/compose-cli/issues) に issue を新規生成してお知らせください。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Compose V2 beta](https://github.com/docker/compose-cli/releases/tag/v2.0.0-beta.4)
  - Fixed a bug where a container cannot be started when a file is bind-mounted into a nested mountpoint. Fixes [docker/compose-cli#1795](https://github.com/docker/compose-cli/issues/1795).
  - Added support for container links and external links.
  - Introduced the `docker compose logs --since --until` option.
  - `docker compose config --profiles` now lists all defined profiles.
- From [Kubernetes 1.21.1](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.1) to [Kubernetes 1.21.2](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.2)
@y
- [Compose V2 ベータ](https://github.com/docker/compose-cli/releases/tag/v2.0.0-beta.4)
  - バインドマウントされたファイルがネストマウントされている場合に、コンテナーが起動できなくなるバグを修正しました。
    [docker/compose-cli#1795](https://github.com/docker/compose-cli/issues/1795) を Fix に。
  - コンテナーリンクと外部リンクへのサポートを追加しました。
  - `docker compose logs --since --until`オプションを追加しました。
  - `docker compose config --profiles`では、定義されたプロファイルすべてを表示するようにしました。
- [Kubernetes 1.21.1](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.1) から [Kubernetes 1.21.2](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.2) へアップデートしました。
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- **Volume Management**
  - Users can now remove a file or directory inside a volume using the the Docker Dashboard.
  - The **Volumes** view in Docker Dashboard displays the last modified time and the size of the contents inside a volume.
  - Users can save the files and directories inside a volume from Docker Dashboard.
- Fixed an issue that caused credStore timeout errors when running the `docker login` command. Fixes [docker/for-win#11472](https://github.com/docker/for-win/issues/11472)
- Docker Desktop now allows the WSL 2 integration agent to start even when `/etc/wsl.conf` is malformed.
- Fixed an issue with the Docker Compose app not being stopped or removed when started by multiple configuration files. [docker/for-win#11445](https://github.com/docker/for-win/issues/11445)
- Fixed a bug where Docker Desktop fails to restart after a power failure because the Hyper-V VM restarted prematurely.
- The default `docker` CLI `context` is now `desktop-linux` in Linux containers mode and `desktop-windows` when in Windows containers mode.
- Show the Docker Desktop Feedback popup only when clicking Docker menu.
@y
- **ボリューム管理**
  - Docker Dashboard を利用して、ボリューム内のファイルやディレクトリを削除できるようになりました。
  - Docker Dashboard の **Volumes** 画面に、ボリュームの最終更新時刻と、ボリューム内容のサイズを表示します。
  - Docker Dashboard を利用して、ボリューム内のファイルやディレクトリを保存できるようになりました。
- `docker login`コマンド実行中に credStore がタイムアウトエラーとなる問題を修正しました。
  [docker/for-win#11472](https://github.com/docker/for-win/issues/11472) を Fix に。
- `/etc/wsl.conf`の記述が正しくない場合であっても、Docker Desktop による WSL 2 統合エージェントの起動が行われるようにしました。
- 複数の設定ファイルによって Docker Compose アプリを起動した場合に、アプリの停止や削除ができない問題を修正しました。
  [docker/for-win#11445](https://github.com/docker/for-win/issues/11445) を Fix に。
- Hyper-V VM が途中で再起動したことが原因となって、電源障害発生時に Docker Desktop が再起動に失敗するバグを修正しました。
- デフォルトの`docker` CLI `context`は、Linux コンテナーモードでは`desktop-linux`、Windows コンテナーモードでは`desktop-windows`としました。
- Docker メニューのクリック時にのみ Docker Desktop フィードバックのポップアップを表示するようにしました。
@z

@x
## Docker Desktop 3.4.0
2021-06-09
@y
## Docker Desktop 3.4.0
2021-06-09
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/65384/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/65384/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Volume Management**: Docker Desktop users can now create and delete volumes using the Docker Dashboard and also see which volumes are being used. For more information, see [Explore volumes](../../dashboard.md#explore-volumes).
@y
**ボリューム管理**: Docker Desktop ユーザーは、Docker Dashboard を利用してボリュームの生成削除ができるようになりました。
また利用されているボリュームを参照することもできます。
詳しくは [ボリュームの確認](../../dashboard.md#explore-volumes) を参照してください。
@z

@x
**Compose V2 beta**: Docker Desktop now includes the beta version of Compose V2, which supports the `docker compose` command as part of the Docker CLI. For more information, see [Compose V2 beta](../../../compose/cli-command.md). While `docker-compose` is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. The compose command in the Docker CLI supports most of the `docker-compose` commands and flags. It is expected to be a drop-in replacement for `docker-compose`. There are a few remaining flags that have yet to be implemented, see the [docker-compose compatibility list](../../../compose/cli-command-compatibility.md) for more information about the flags that are supported in the new compose command. If you run into any problems with Compose V2, you can easily switch back to Compose v1 by either by making changes in Docker Desktop **Experimental** Settings, or by running the command `docker-compose disable-v2`. Let us know your feedback on the new ‘compose’ command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues) GitHub repository.
@y
**Compose V2 ベータ**: Docker Desktop に Compose V2 ベータバージョンを含めました。
これは Docker CLI の一部として`docker compose`コマンドをサポートするものです。
詳しくは [Compose V2 ベータ](../../../compose/cli-command.md) を参照してください。
`docker-compose`は、今もサポートされ保守も行われています。
しかし Compose V2 の実装は、仕様の一部としてメンテナンスされている compose-go バインディングに直接基づいています。
Docker CLI の compose コマンドは、`docker-compose`コマンドとフラグをほぼサポートしています。
そこでこれらは`docker-compose`コマンドの代わりになるものとされます。
ただしまだ実装できていないフラグがいくつか残っています。
新たな compose コマンドにおいてサポートされているフラグの情報は [docker-compose 互換性リスト](../../../compose/cli-command-compatibility.md) を参照してください。
Compose V2 の利用にあたって何か問題が発生したら、簡単に Compose V1 に戻すことができます。
その方法は Docker Desktop の **Experimental** (試験的機能) の設定を変更するか、あるいはコマンド`docker-compose disable-v2`を実行します。
新しい`compose`コマンドへのフィードバックは、GitHub リポジトリ [Compose-CLI](https://github.com/docker/compose-cli/issues) に issue を新規生成してお知らせください。
@z

@x
**Skip Docker Desktop updates**: All users can now skip an update when they are prompted to install individual Docker Desktop releases. For more information, see [Docker Desktop updates](../install.md#updates).
@y
**Docker Desktop 更新のスキップ**: Docker Desktop の新規リリースがプロンプト表示される際に、アップデートをスキップできるようにしました。
詳しくは [Docker Desktop のアップデート](../install.md#updates) を参照してください。
@z

@x
### Deprecation
@y
{: #deprecation }
### 非推奨
@z

@x
- Docker Desktop no longer installs Notary, `docker trust` should be used for image signing.
@y
- Docker Desktop では Notary をインストールしないようになりました。
  イメージ署名には`docker trust`を利用してください。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine 20.10.7](https://docs.docker.com/engine/release-notes/#20107)
- [Docker Compose 1.29.2](https://github.com/docker/compose/releases/tag/1.29.2)
- [Docker Hub Tool v0.4.1](https://github.com/docker/hub-tool/releases/tag/v0.4.1)
- [Compose CLI v1.0.16](https://github.com/docker/compose-cli/releases/tag/v1.0.16)
- [Kubernetes 1.21.1](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.1)
- [containerd v1.4.6](https://github.com/containerd/containerd/releases/tag/v1.4.6)
- [runc v1.0.0-rc95](https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc95)
- [Go 1.16.5](https://github.com/golang/go/releases/tag/go1.16.5)
@y
- [Docker Engine 20.10.7](https://docs.docker.com/engine/release-notes/#20107)
- [Docker Compose 1.29.2](https://github.com/docker/compose/releases/tag/1.29.2)
- [Docker Hub Tool v0.4.1](https://github.com/docker/hub-tool/releases/tag/v0.4.1)
- [Compose CLI v1.0.16](https://github.com/docker/compose-cli/releases/tag/v1.0.16)
- [Kubernetes 1.21.1](https://github.com/kubernetes/kubernetes/releases/tag/v1.21.1)
- [containerd v1.4.6](https://github.com/containerd/containerd/releases/tag/v1.4.6)
- [runc v1.0.0-rc95](https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc95)
- [Go 1.16.5](https://github.com/golang/go/releases/tag/go1.16.5)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed error showing stderr log in the UI. Fixes [docker/for-win#11251](https://github.com/docker/for-win/issues/11251).
- Automatically reclaim space after deleting containers by deleting volumes and removing build cache.
- Docker Compose applications with file names other than `docker-compose.yml` can now be removed from Docker Desktop. Fixes [docker/for-win#11046](https://github.com/docker/for-win/issues/11046)
- Fixed version number missing in update dialog window.
- Fixed an issue where the diagnostics were sometimes not uploaded correctly from the **Support** dialog.
- Fixed DNS entries for `*.docker.internal` and Kubernetes cluster reset after the VM IP changes.
- Fixed a corrupted internal cache which was preventing Docker Desktop from starting. Fixes [docker/for-win#8748](https://github.com/docker/for-win/issues/8748).
- Fixed an issue where `docker info` sometimes took longer to respond. Fixes [docker/for-win#10675](https://github.com/docker/for-win/issues/10675)
@y
- UI 上に標準エラー出力ログが表示されるのを修正しました。
  [docker/for-win#11251](https://github.com/docker/for-win/issues/11251) を Fix に。
- ボリューム削除とビルドキャッシュ削除を行うことにより、コンテナー削除後の容量再利用を自動的に行うようにしました。
- Docker Compose アプリケーションが`docker-compose.yml`以外の名前で定義されているものは、Docker Desktop から削除されるようになりました。
  [docker/for-win#11046](https://github.com/docker/for-win/issues/11046) を Fix に。
- アップデートのダイアログ画面に、バージョン番号が含まれていなかったため修正しました。
- **Support** ダイアログからの診断情報のアップロードが、正しくアップロードされないことがあるため、この問題を修正しました。
- VM の IP が変更された後に、`*.docker.internal`と Kubernetes クラスターの DNS エントリのリセットを修正しました。
- 内部キャッシュが破損していると、Docker Desktop が起動できなくなる問題を修正しました。
  [docker/for-win#8748](https://github.com/docker/for-win/issues/8748) を Fix に。
- `docker info`の応答に長い時間を要する問題があったため修正しました。
  [docker/for-win#10675](https://github.com/docker/for-win/issues/10675) を Fix に。
@z

@x
## Docker Desktop 3.3.3
2021-05-06
@y
## Docker Desktop 3.3.3
2021-05-06
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/64133/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/64133/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Snyk v1.563.0](https://github.com/snyk/snyk/releases/tag/v1.563.0)
- [Docker Scan v0.8.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.8.0)
@y
- [Snyk v1.563.0](https://github.com/snyk/snyk/releases/tag/v1.563.0)
- [Docker Scan v0.8.0](https://github.com/docker/scan-cli-plugin/releases/tag/v0.8.0)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed the diagnostics failing to upload from the Troubleshoot screen.
@y
- Troubleshoot 画面にて診断情報のアップロードに失敗するのを修正しました。
@z

@x
## Docker Desktop 3.3.2
2021-05-03
@y
## Docker Desktop 3.3.2
2021-05-03
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/63878/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/63878/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Compose CLI v1.0.14](https://github.com/docker/compose-cli/tree/v1.0.14)
- [Go 1.16.3](https://golang.org/doc/go1.16)
- [Docker Compose 1.29.1](https://github.com/docker/compose/releases/tag/1.29.1)
- [Docker Engine 20.10.6](https://docs.docker.com/engine/release-notes/#20106)
@y
- [Compose CLI v1.0.14](https://github.com/docker/compose-cli/tree/v1.0.14)
- [Go 1.16.3](https://golang.org/doc/go1.16)
- [Docker Compose 1.29.1](https://github.com/docker/compose/releases/tag/1.29.1)
- [Docker Engine 20.10.6](https://docs.docker.com/engine/release-notes/#20106)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a bug where a `metrics-port` defined in the engine's `daemon.json` blocks application restart.
- Fixed a leak of ephemeral ports. Fixes [docker/for-mac#5611](https://github.com/docker/for-mac/issues/5611).
- Enable buildkit garbage collection by default.
- Fixed a bug which blocked binding to port 123. Fixes [docker/for-mac#5589](https://github.com/docker/for-mac/issues/5589).
- Removed the "Deploy Docker Stacks to Kubernetes by default" Kubernetes setting. The component was removed in 2.4.0.0 but we forgot to remove the setting. Fixes [docker/for-mac#4966](https://github.com/docker/for-mac/issues/4966).
@y
- Engine の`daemon.json`において定義された`metrics-port`が、アプリケーションの再起動をブロックしてしまうバグを修正しました。
- エフェメラルポートの漏れを修正しました。
  [docker/for-mac#5611](https://github.com/docker/for-mac/issues/5611) を Fix に。
- デフォルトで buildkit のガーベージコレクションを有効にしました。
- ポート 123 へのバインディングを阻止するバグを修正しました。
  [docker/for-mac#5589](https://github.com/docker/for-mac/issues/5589) を Fixに。
- Kubernetes の設定「Deploy Docker Stacks to Kubernetes by default」を削除しました。
  コンポーネントはすでに 2.4.0.0 において削除していましたが、設定の削除を忘れていたものです。
  [docker/for-mac#4966](https://github.com/docker/for-mac/issues/4966) を Fix に。
@z

@x
## Docker Desktop 3.3.1
2021-04-15
@y
## Docker Desktop 3.3.1
2021-04-15
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/63152/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/63152/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop now ensures the permissions of `/dev/null` and other devices are correctly set to `0666` (`rw-rw-rw-`) inside `--privileged` containers. Fixes [docker/for-mac#5527](https://github.com/docker/for-mac/issues/5527).
- Fixed an issue that caused `docker run` to fail when using `\\wsl.localhost` path to a directory. Fixes [docker/for-win#10786](https://github.com/docker/for-win/issues/10786)
- Fixed an issue that caused Docker Desktop to fail during startup when it is unable to establish a connection with Docker Hub in the backend. Fixes [docker/for-win#10896](https://github.com/docker/for-win/issues/10896)
- Fixed file permission when creating a file from a delta update. Fixes [docker/for-win#10881](https://github.com/docker/for-win/issues/10881)
@y
- `--privileged`が指定されたコンテナー内において、`/dev/null`などのデバイスが、適切に`0666`（`rw-rw-rw-`）となりようにしました。
  [docker/for-mac#5527](https://github.com/docker/for-mac/issues/5527) を Fix に。
- `\\wsl.localhost`のパスをディレクトリに指定している場合に`docker run`が失敗する問題を修正しました。
  [docker/for-win#10786](https://github.com/docker/for-win/issues/10786) を Fix に。
- Docker Hub に対するバックエンドによる接続ができなかった場合、Docker Desktop が起動に失敗する問題を修正しました。
  [docker/for-win#10896](https://github.com/docker/for-win/issues/10896) を Fix に。
- デルタアップデートによりファイル生成される際のファイルパーミッションを修正しました。
  [docker/for-win#10881](https://github.com/docker/for-win/issues/10881) を Fix に。
@z

@x
## Docker Desktop 3.3.0
2021-04-08
@y
## Docker Desktop 3.3.0
2021-04-08
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/62916/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/62916/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
You can now specify when to download and install a Docker Desktop update. When an update becomes available, Docker Desktop displays an icon to indicate the availability of a newer version. You can download the update in the background whenever convenient. When the download is complete, all you need to do is to click Update and restart to install the latest update.
@y
Docker Desktop のアップデートに対して、ダウンロードとインストールをいつ行うかを指定できるようになりました。
アップデートが利用可能になると Docker Desktop は、最新バージョンの入手が可能であることを示すアイコンを表示します。
アップデートはお好きなときに開始すれば、バックグラウンドでダウンロードが始まります。
アップデートのダウンロードを終えたら Update and restart（アップデートと再起動）をクリックするだけで、最新アップデートをインストールできます。
@z

@x
Developers who use Docker Desktop for professional development purposes may at times need to skip a specific update. For this reason, users with a paid Docker subscription can skip notifications for a particular update when a reminder appears.
@y
本格的な開発目的で Docker Desktop を利用する開発者は、特定のアップデートをスキップしなければならない場合もあります。
こういった状況があるため、有償の Docker サブスクリプションの購入ユーザーは、アップデートのリマインダーが表示された際に特定アップデートの通知をスキップすることができます。
@z

@x
For developers in IT managed environments, who don’t have administrative access to install updates to Docker Desktop, there is now an option in the Settings menu to opt out of notifications altogether for Docker Desktop updates if your Docker ID is part of a Team subscription.
@y
IT 管理環境下での開発者の Docker ID がチームプランに属していれば、Docker Desktop アップデートのインストール権限がない場合に、Docker Desktop アップデートの通知を完全に行わないように Settings メニューから指定できるようになりました。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Compose 1.29.0](https://github.com/docker/compose/releases/tag/1.29.0)
- [Compose CLI v1.0.12](https://github.com/docker/compose-cli/tree/v1.0.12)
- [Linux kernel 5.10.25](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-83885d3b4cff391813f4262099b36a529bca2df8-amd64/images/sha256-0214b82436af70054e013ea51cb1fea72bd943d0d6245b6521f1ff09a505c40f?context=repo)
- [Snyk v1.461.0](https://github.com/snyk/snyk/releases/tag/v1.461.0)
- [Docker Hub Tool v0.3.1](https://github.com/docker/hub-tool/releases/tag/v0.3.1)
- [containerd v1.4.4](https://github.com/containerd/containerd/releases/tag/v1.4.4)
- [runc v1.0.0-rc93](https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc93)
@y
- [Docker Compose 1.29.0](https://github.com/docker/compose/releases/tag/1.29.0)
- [Compose CLI v1.0.12](https://github.com/docker/compose-cli/tree/v1.0.12)
- [Linux kernel 5.10.25](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-83885d3b4cff391813f4262099b36a529bca2df8-amd64/images/sha256-0214b82436af70054e013ea51cb1fea72bd943d0d6245b6521f1ff09a505c40f?context=repo)
- [Snyk v1.461.0](https://github.com/snyk/snyk/releases/tag/v1.461.0)
- [Docker Hub Tool v0.3.1](https://github.com/docker/hub-tool/releases/tag/v0.3.1)
- [containerd v1.4.4](https://github.com/containerd/containerd/releases/tag/v1.4.4)
- [runc v1.0.0-rc93](https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc93)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue when viewing compose applications that have been started with an explicit project name. Fixes [docker/for-win#10564](https://github.com/docker/for-win/issues/10564).
- Ensure `--add-host host.docker.internal:host-gateway` causes `host.docker.internal` resolves to the host IP, rather than the IP of the IP router. See [docker/for-linux#264](https://github.com/docker/for-linux/issues/264).
- Fixed port allocation for Windows containers. Fixes [docker/for-win#10552](https://github.com/docker/for-win/issues/10552).
- Fixed an issue where running a container with a random port on the host caused Docker Desktop dashboard to incorrectly open a browser with port 0, instead of using the allocated port.
- Fixed an issue where pulling an image from Docker Hub using the Docker Desktop dashboard was failing silently.
- Perform a filesystem check when starting the Linux VM.
@y
- 明示的にプロジェクト名を指定して起動された Compose アプリケーションに対して、これを参照する際の問題を修正しました。
  [docker/for-win#10564](https://github.com/docker/for-win/issues/10564) を Fix に。
- `--add-host host.docker.internal:host-gateway`の指定によって、IP ルーターの IP ではなく、ホスト IP に対して割り当てられるようにしました。
  [docker/for-linux#264](https://github.com/docker/for-linux/issues/264) 参照のこと。
- Windows コンテナーへのポート割り当てを修正しました。
  [docker/for-win#10552](https://github.com/docker/for-win/issues/10552) を Fix に。
- ホスト上のランダムポートを使ってコンテナーを実行すると、Docker Desktop ダッシュボードが、その割り当てられたポートでなく間違ってポート 0 としてブラウザー表示してしまう問題を修正しました。
- Docker Desktop ダッシュボードを使って Docker Hub からイメージをプルすると、何も表示されずに処理失敗する問題を修正しました。
- Linux VM 起動時にファイルシステムのチェックを実行するようにしました。
@z

@x
## Docker Desktop 3.2.2
2021-03-15
@y
## Docker Desktop 3.2.2
2021-03-15
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/61853/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/61853/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue that stopped containers binding to port 53. Fixes [docker/for-win#10601](https://github.com/docker/for-win/issues/10601).
- Fixed an issue that 32-bit Intel binaries were emulated on Intel CPUs. Fixes [docker/for-win#10594](https://github.com/docker/for-win/issues/10594).
- Fixed an issue related to high CPU consumption and frozen UI when the network connection is lost. Fixes [for-win/#10563](https://github.com/docker/for-win/issues/10563).
@y
- ポート 53 にバインドされている停止コンテナーに関しての問題を修正しました。
  [docker/for-win#10601](https://github.com/docker/for-win/issues/10601) を Fix に。
- 32 ビット Intel バイナリが Intel CPU にエミュレートされていた問題を修正しました。
  [docker/for-win#10594](https://github.com/docker/for-win/issues/10594) を Fix に。
- ネットワーク接続が切断された際に、CPU の異常消費および UI フリーズを引き起こす問題を修正しました。
  [for-win/#10563](https://github.com/docker/for-win/issues/10563) を Fix に。
@z

@x
## Docker Desktop 3.2.1
2021-03-05
@y
## Docker Desktop 3.2.1
2021-03-05
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/61626/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/61626/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine 20.10.5](https://docs.docker.com/engine/release-notes/#20105)
@y
- [Docker Engine 20.10.5](https://docs.docker.com/engine/release-notes/#20105)
@z

@x
## Docker Desktop 3.2.0
2021-03-01
@y
## Docker Desktop 3.2.0
2021-03-01
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/amd64/61504/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/amd64/61504/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- The Docker Dashboard opens automatically when you start Docker Desktop.
- The Docker Dashboard displays a tip once a week.
- BuildKit is now the default builder for all users, not just for new installations. To turn this setting off, go to **Settings** > **Docker Engine** and add the following block to the Docker daemon configuration file:
```json
"features": {
    "buildkit": false
}
```
@y
- Docker Desktop 起動時に、自動的に Docker Dashboard を開くようにしました。
- Docker Dashboard では 1 週間に 1 回、ヒント（tip）を表示するようにしました。
- BuildKit は新規インストール時だけでなく、すべてのユーザーにおいてデフォルトのビルダーとなりました。
  この設定をオフにするには **Settings** > **Docker Engine** を実行して、Docker デーモン設定ファイルに以下の記述を追加してください。
```json
"features": {
    "buildkit": false
}
```
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine 20.10.3](https://docs.docker.com/engine/release-notes/#20103)
- [Docker Compose 1.28.5](https://github.com/docker/compose/releases/tag/1.28.5)
- [Compose CLI v1.0.9](https://github.com/docker/compose-cli/tree/v1.0.9)
- [Docker Hub Tool v0.3.0](https://github.com/docker/hub-tool/releases/tag/v0.3.0)
- [QEMU 5.0.1](https://wiki.qemu.org/ChangeLog/5.0)
- [Amazon ECR Credential Helper v0.5.0](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.5.0)
- [Alpine 3.13](https://alpinelinux.org/posts/Alpine-3.13.0-released.html)
- [Kubernetes 1.19.7](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.7)
- [Go 1.16](https://golang.org/doc/go1.16)
@y
- [Docker Engine 20.10.3](https://docs.docker.com/engine/release-notes/#20103)
- [Docker Compose 1.28.5](https://github.com/docker/compose/releases/tag/1.28.5)
- [Compose CLI v1.0.9](https://github.com/docker/compose-cli/tree/v1.0.9)
- [Docker Hub Tool v0.3.0](https://github.com/docker/hub-tool/releases/tag/v0.3.0)
- [QEMU 5.0.1](https://wiki.qemu.org/ChangeLog/5.0)
- [Amazon ECR Credential Helper v0.5.0](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.5.0)
- [Alpine 3.13](https://alpinelinux.org/posts/Alpine-3.13.0-released.html)
- [Kubernetes 1.19.7](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.7)
- [Go 1.16](https://golang.org/doc/go1.16)
@z

@x
### Deprecation
@y
{: #deprecation }
### 非推奨
@z

@x
- Docker Desktop cannot be installed on Windows 1709 (build 16299) anymore.
@y
- Docker Desktop は Windows 1709 (build 16299) へはインストールできなくなりました。
@z

@x
- Removed the deprecated DNS name `docker.for.win.localhost`. Use DNS name `host.docker.internal` in a container to access services that are running on the host. [docker/for-win#10619](https://github.com/docker/for-win/issues/10619)
@y
- 非推奨の DNS 名`docker.for.win.localhost`を削除しました。
  ホスト上に稼働するサービスにアクセスするには、コンテナー内から DNS 名`host.docker.internal`を使ってください。
  [docker/for-win#10619](https://github.com/docker/for-win/issues/10619)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue on the container detail screen where the buttons would disappear when scrolling the logs. Fixes [docker/for-win#10160](https://github.com/docker/for-win/issues/10160)
- Fixed an issue when port forwarding multiple ports with an IPv6 container network. Fixes [docker/for-mac#5247](https://github.com/docker/for-mac/issues/5247)
- Fixed a regression where `docker load` could not use an xz archive anymore. Fixes [docker/for-win#10364](https://github.com/docker/for-win/issues/10364)
- Fixed an issue that caused the WSL 2 backend shutdown process to interfere with Windows shutdown. Fixes [docker/for-win#5825](https://github.com/docker/for-win/issues/5825) [docker/for-win#6933](https://github.com/docker/for-win/issues/6933) [docker/for-win#6446](https://github.com/docker/for-win/issues/6446)
- Fixed creds store using `desktop.exe` from WSL 2. Fixes [docker/compose-cli#1181](https://github.com/docker/compose-cli/issues/1181)
- Fixed a navigation issue in the **Containers / Apps** view. Fixes [docker/for-win#10160](https://github.com/docker/for-win/issues/10160#issuecomment-764660660)
- Fixed container instance view with long container/image name. Fixes [docker/for-win#10160](https://github.com/docker/for-win/issues/10160)
- Fixed an issue when binding ports on specific IPs. Note: It may now take a bit of time before the `docker inspect` command shows the open ports. Fixes [docker/for-win#10008](https://github.com/docker/for-win/issues/10008)
- Fixed an issue where an image deleted from the Docker dashboard was still displayed on the **Images** view.
@y
- コンテナーの詳細表示画面において、ログをスクロールするとボタンが消失してしまう問題を修正しました。
  [docker/for-win#10160](https://github.com/docker/for-win/issues/10160) を Fix に。
- IPv6 によるコンテナーネットワークにおいて、複数ポートに向けてのポートフォワーディングが行われる際の問題を修正しました。
  [docker/for-mac#5247](https://github.com/docker/for-mac/issues/5247) を Fix に。
- `docker load`において xz アーカイブが利用できなくなってしまった機能低下を修正しました。
  [docker/for-win#10364](https://github.com/docker/for-win/issues/10364) を Fix に。
- WSL 2 バックエンドのシャットダウン処理が、Windows のシャットダウン処理に影響してしまう問題を修正しました。
  [docker/for-win#5825](https://github.com/docker/for-win/issues/5825)、[docker/for-win#6933](https://github.com/docker/for-win/issues/6933)、[docker/for-win#6446](https://github.com/docker/for-win/issues/6446) を Fix に。
- WSL 2 から`desktop.exe`を実行する際の資格情報ストアを修正しました。
  [docker/compose-cli#1181](https://github.com/docker/compose-cli/issues/1181) を Fix に。
- **Containers / Apps** 画面におけるナビゲーション処理を修正しました。
  [docker/for-win#10160](https://github.com/docker/for-win/issues/10160#issuecomment-764660660) を Fix に。
- コンテナー名やイメージ名が長い場合のコンテナーインスタンス画面を修正しました。
  [docker/for-win#10160](https://github.com/docker/for-win/issues/10160) を Fix に。
- 特定の IP アドレスにポートバインディングする際の問題を修正しました。
  メモ： これにより`docker inspect`コマンドが公開ポートを表示するのに時間を要するかもしれません。
  [docker/for-win#10008](https://github.com/docker/for-win/issues/10008) を Fix に。
- Docker Dashboard からイメージを削除しても **Images** 画面に表示されたままとなる問題を修正しました。
@z

@x
## Docker Desktop 3.1.0
2021-01-14
@y
## Docker Desktop 3.1.0
2021-01-14
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/51484/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/51484/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- Add experimental support for GPU workloads with WSL 2 backend (requires Windows Insider developer channel).
- Docker daemon now runs within a Debian Buster based container (instead of Alpine).
@y
- WSL 2 をバックエンドとする GPU システムに対して試験的サポートを追加しました（Windows Insider 開発チャネルが必要）。
- Docker デーモンは（Alpine に代わって）Debian Buster ベースのコンテナー内で動作します。
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Compose CLI v1.0.7](https://github.com/docker/compose-cli/tree/v1.0.7)
@y
- [Compose CLI v1.0.7](https://github.com/docker/compose-cli/tree/v1.0.7)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue where disabling proxy settings would not work. Fixes [docker/for-win#9357](https://github.com/docker/for-win/issues/9357).
- Fixed UI reliability issues when users create or delete a lot of objects in batches.
- Redesigned the **Support** UI to improve usability.
@y
- プロキシー設定の無効化ができない問題を修正しました。
  [docker/for-win#9357](https://github.com/docker/for-win/issues/9357) を Fix に。
- ユーザーがバッチ処理によって数多くのオブジェクトを生成したり削除したりしても、UI の信頼性に問題がないように修正しました。
- **Support** 画面を再設計して操作性を向上しました。
@z

@x
## Docker Desktop 3.0.4
2021-01-06
@y
## Docker Desktop 3.0.4
2021-01-06
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/51218/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/51218/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine 20.10.2](https://docs.docker.com/engine/release-notes/#20102)
@y
- [Docker Engine 20.10.2](https://docs.docker.com/engine/release-notes/#20102)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue that could cause Docker Desktop to fail to start after upgrading to 3.0.0. Fixes [docker/for-win#9755](https://github.com/docker/for-win/issues/9755).
@y
- Docker Desktop を 3.0.0 にアップグレードした後に、起動に失敗する場合がある点を修正しました。
  [docker/for-win#9755](https://github.com/docker/for-win/issues/9755) を Fix に。
@z

@x
## Docker Desktop 3.0.0
2020-12-10
@y
## Docker Desktop 3.0.0
2020-12-10
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://desktop.docker.com/win/stable/50684/Docker%20Desktop%20Installer.exe){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Windows 向け](https://desktop.docker.com/win/stable/50684/Docker%20Desktop%20Installer.exe){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- Use of three-digit version number for Docker Desktop releases.
- Docker Desktop updates are now much smaller as they will be applied using delta patches. For more information, see [Automatic updates](../install.md#updates).
- First version of `docker compose` (as an alternative to the existing `docker-compose`). Supports some basic commands but not the complete functionality of `docker-compose` yet.
@y
- Docker Desktop リリースに対して 3 桁のバージョン番号を用いるようにしました。
- Docker Desktop のアップデートでは、デルタパッチを用いることにより、アップデートをより小さなものにしました。
  詳しくは [自動アップデート](../install.md#updates) を参照してください。
- `docker compose`の初めてのバージョン（これまでの`docker-compose`に対応づくもの）。 
  基本的なコマンドはサポートしていますが、`docker-compose`の全機能をまだ実現していません。
@z

@x
  - Supports the following subcommands: `up`, `down`, `logs`, `build`, `pull`, `push`, `ls`, `ps`
  - Supports basic volumes, bind mounts, networks, and environment variables
@y
  - 以下のサブコマンドをサポートします。
    `up`、`down`、`logs`、`build`、`pull`、`push`、`ls`、`ps`
  - 基本的なボリューム、バインドマウント、ネットワーク、環境変数をそれぞれサポートします。
@z

@x
    Let us know your feedback by creating an issue in the [compose-cli](https://github.com/docker/compose-cli/issues){: target="blank" rel="noopener" class=“”} GitHub repository.
- [Docker Hub Tool v0.2.0](https://github.com/docker/roadmap/issues/117){: target="blank" rel="noopener" class=“”}
@y
    フィードバックは [compose-cli](https://github.com/docker/compose-cli/issues){: target="blank" rel="noopener" class=“”} GitHub リポジトリに issue を生成してください。
- [Docker Hub ツール v0.2.0](https://github.com/docker/roadmap/issues/117){: target="blank" rel="noopener" class=“”}
@z

@x
### Upgrades
@y
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine 20.10.0](https://docs.docker.com/engine/release-notes/#20100)
- [Go 1.15.6](https://github.com/golang/go/issues?q=milestone%3AGo1.15.6+label%3ACherryPickApproved+)
- [Compose CLI v1.0.4](https://github.com/docker/compose-cli/releases/tag/v1.0.4)
- [Snyk v1.432.0](https://github.com/snyk/snyk/releases/tag/v1.432.0)
@y
- [Docker Engine 20.10.0](https://docs.docker.com/engine/release-notes/#20100)
- [Go 1.15.6](https://github.com/golang/go/issues?q=milestone%3AGo1.15.6+label%3ACherryPickApproved+)
- [Compose CLI v1.0.4](https://github.com/docker/compose-cli/releases/tag/v1.0.4)
- [Snyk v1.432.0](https://github.com/snyk/snyk/releases/tag/v1.432.0)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Downgraded the kernel to [4.19.121](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.121-2a1dbedf3f998dac347c499808d7c7e029fbc4d3-amd64/images/sha256-4e7d94522be4f25f1fbb626d5a0142cbb6e785f37e437f6fd4285e64a199883a?context=repo) to reduce the CPU usage of hyperkit. Fixes [docker/for-mac#5044](https://github.com/docker/for-mac/issues/5044)
- Fixed an unexpected EOF error when trying to start a non-existing container with `-v /var/run/docker.sock:`. See [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025).
@y
- Hyperkit の CPU 使用量を軽減するため、カーネル [4.19.121](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.121-2a1dbedf3f998dac347c499808d7c7e029fbc4d3-amd64/images/sha256-4e7d94522be4f25f1fbb626d5a0142cbb6e785f37e437f6fd4285e64a199883a?context=repo) にダウングレードしました。
- `-v /var/run/docker.sock:` を指定により、存在しないコンテナーを起動しようとして、予期しない EOF エラーとなる点を修正しました。
  [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025) を参照のこと。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- Building an image with BuildKit from a git URL fails when using the form `github.com/org/repo`. To work around this issue, use the form `git://github.com/org/repo`.
- Some DNS addresses fail to resolve within containers based on Alpine Linux 3.13.
@y
- git URL から BuildKit を使ってイメージをビルドする際に、`github.com/org/repo`の形を用いているとビルドに失敗します。
  この問題を回避するには`git://github.com/org/repo`の形を用いるようにします。
- Alpine Linux 3.13 に基づくコンテナー内において DNS アドレス解決に失敗することがあります。
@z

@x
{% include eula-modal.html %}
@y
{% include eula-modal.html %}
@z
