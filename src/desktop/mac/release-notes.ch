%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Change log / release notes for Docker Desktop Mac
keywords: Docker Desktop for Mac, release notes
redirect_from:
- /docker-for-mac/release-notes/
- /mackit/release-notes/
- /docker-for-mac/edge-release-notes/
title: Docker for Mac release notes
toc_min: 1
toc_max: 2
---
@y
---
description: Docker Desktop Mac の変更履歴、リリースノート。
keywords: Docker Desktop for Mac, release notes
redirect_from:
- /docker-for-mac/release-notes/
- /mackit/release-notes/
- /docker-for-mac/edge-release-notes/
title: Docker for Mac リリースノート
toc_min: 1
toc_max: 2
---
@z

@x
> **Update to the Docker Desktop terms**
>
> Professional use of Docker Desktop in large organizations (more than 250 employees or more than $10 million in revenue) requires users to have a paid Docker subscription. While the effective date of these terms is August 31, 2021, there is a grace period until January 31, 2022 for those that require a paid subscription. For more information, see [Docker Desktop License Agreement](/subscription/#docker-desktop-license-agreement).
{: .important}
@y
> **Docker Desktop 利用契約の更新**
>
> 大規模エンタープライズ向けの Docker Desktop のプロフェッショナル利用 (従業員 250名以上、または年間収益 1,000 万ドル以上) に対しては、有償の Docker サブスクリプションが必要です。
> この条件の適用開始日は 2021 年 8 月31 日です。
> Docker Deskop の利用に有償サブスクリプションが必要とされるものであっても、 2022 年 1 月 31 日までは猶予期間が設けられています。
> 詳しくは [Docker Desktop ライセンス契約]({{ site.baseurl }}/subscription/#docker-desktop-license-agreement) を参照してください。
{: .important}
@z

@x
This page contains information about the new features, improvements, known issues, and bug fixes in Docker Desktop releases.
@y
このページでは Docker Desktop リリースにおける新機能、更新状況、既知の不具合、バグフィックスといった情報を示します。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .button .primary-btn }
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .button .primary-btn }
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .button .primary-btn }
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .button .primary-btn }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- **Software Updates**: The Settings tab now includes a new section to help you manage Docker Desktop updates. The **Software Updates** section notifies you whenever there's a new update and allows you to download the update or view information on what's included in the newer version. For more information, see [Software Updates](../#software-updates).
- **Compose V2** You can now specify whether to use [Docker Compose V2](../../compose/cli-command.md) in the General settings.
- **Volume Management**: Volume management is now available for users on any subscription, including Docker Personal. For more information, see [Explore volumes](../dashboard.md#explore-volumes).
@y
- **ソフトウェア更新** ＝ Settings（設定）タブに新たなセクションが追加され、Docker Desktop のアップデートを管理できるようになりました。
  **Software Updates**（ソフトウェア更新）セクションでは、新たな更新があれば通知されます。
  そして更新のダウンロードを行ったり、最新版に含まれる機能がどのようなものかを参照したりすることができます。
  詳しくは [ソフトウェア更新](../#software-updates) を参照してください。
- **Compose V2** ＝ General（一般）において [Docker Compose V2](../../compose/cli-command.md) を利用するかどうかが設定できるようになりました。
- **ボリューム管理** ＝ Docker Desktop 4.1.0 リリースから、Docker Personal も含め、どのサブスクリプションユーザーであっても、ボリューム管理機能が利用できるようになりました。
  詳しくは [ボリュームの確認](../dashboard.md#explore-volumes) を参照してください。
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
- debian:bullseye に対するベースディストロ
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/68347/Docker.dmg) |
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/68347/Docker.dmg)
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/68347/Docker.dmg) |
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/68347/Docker.dmg)
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
- Fixed a bug where copy-paste was not available in the Docker Dashboard.
@y
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/67817/Docker.dmg) |
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/67817/Docker.dmg)
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/67817/Docker.dmg) |
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/67817/Docker.dmg)
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
The updated [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) includes a change to the terms for **Docker Desktop**.
@y
更新された [Docker サブスクリプションサービス契約](https://www.docker.com/legal/docker-subscription-service-agreement) には、**Docker Desktop** での契約変更内容が記載されています。
@z

@x
- Docker Desktop **remains free** for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
- It requires a paid subscription (**Pro, Team, or Business**), for as little as $5 a month, for professional use in larger enterprises.
- The effective date of these terms is August 31, 2021. There is a grace period until January 31, 2022 for those that will require a paid subscription to use Docker Desktop.
- The Docker Pro and Docker Team subscriptions now **include commercial use** of Docker Desktop.
- The existing Docker Free subscription has been renamed **Docker Personal**.
- **No changes** to Docker Engine or any other upstream **open source** Docker or Moby project.
@y
- Docker Desktop は、小規模ビジネス向け（従業員 250 未満、かつ年間収益 1,000 万ドル未満）、個人利用、教育目的、非商用のオープンソースプロジェクトに対しては、 **無償提供が継続** されます。
- 大規模なエンタープライズ向けのプロフェッショナル利用に対しては、最低でも月額 5 ドルの有償サブスクリプション（**Pro, Team, Business**）が必要です。
- この条件の適用開始日は 2021 年 8 月31 日です。
  Docker Deskop の利用に有償サブスクリプションが必要とされるものであっても、 2022 年 1 月 31 日までは猶予期間が設けられています。
- Docker Pro と Docker Team のサブスクリプションには、Docker Desktop の **商用利用** が含まれるようになりました。
- 既存の Docker 無償サブスクリプションは **Docker Personal** として名称変更されました。
- Docker Engine、これに関するアップストリームの **オープンソース**、Moby プロジェクトには **一切変更がありません**。
@z

@x
    To understand how these changes affect you, read the [FAQs](https://www.docker.com/pricing/faq){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"}. For more information, see [Docker subscription overview](../../subscription/index.md).
@y
    この変更内容がユーザーにとってどのように影響するかについては、[FAQ](https://www.docker.com/pricing/faq){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"} を参照してください。
    より詳しくは [Docker サブスクリプション概要](../../subscription/index.md) を参照してください。
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
- Fixed a bug where SSH was not available for builds from git URL. Fixes [for-mac#5902](https://github.com/docker/for-mac/issues/5902)
@y
- git URL からのビルドに対して、 SSH が利用不能であった点を修正しました。
  [for-mac#5902](https://github.com/docker/for-mac/issues/5902) を Fix に。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/67351/Docker.dmg){: .accept-eula } |
> [Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/67351/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/67351/Docker.dmg){: .accept-eula } |
> [Apple チップの Mac](https://desktop.docker.com/mac/stable/arm64/67351/Docker.dmg){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- **Dev Environments**: You can now create a Dev Environment from your local Git repository. For more information, see [Start a Dev Environment from a local folder](../dev-environments.md#start-a-dev-environment-from-a-local-folder).
- **Volume Management**: You can now sort volumes by the name, the date created, and the size of the volume. You can also search for specific volumes using the **Search** field. For more information, see [Explore volumes](../dashboard.md#explore-volumes).
@y
- **Dev 環境**: 
Dev 環境はローカル Git リポジトリから生成できるようになりました。
詳細は [ローカルフォルダーからの Dev 環境の起動](../dev-environments.md#start-a-dev-environment-from-a-local-folder) を参照してください。
- **ボリューム管理**: ボリューム一覧では、名前、生成時刻、ボリュームサイズによってソートできるようになりました。
また **Search** (検索) 欄を使って、ボリューム検索もできるようになりました。
詳しくは [リモートリポジトリとのやりとり](../dashboard.md#explore-volumes) を参照してください。
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
- Fixed an issue related to hardware acceleration [docker/for-mac#5121](https://github.com/docker/for-mac/issues/5121)
- Fixed an issue related to Skip This Update for mac [docker/for-mac#5842](https://github.com/docker/for-mac/issues/5842)
@y
- [Docker Desktop 3.0.0](#docker-desktop-300) における性能劣化を修正するため、カーネル設定を更新しました。
  この問題は、それまでのバージョンに比べて、コンテナーのポート公開に 10 回以上も多くかけていました。
  詳しくは [linuxkit/linuxkit#3701](https://github.com/linuxkit/linuxkit/pull/3701) と [docker/for-mac#5668](https://github.com/docker/for-mac/issues/5668) を参照のこと。
- 不意に大量のデータグラムを受信した際に、DNS サーバーが失敗するバグを修正しました。
- ハードウェアアクセラレーションに関する問題を修正しました。
  [docker/for-mac#5121](https://github.com/docker/for-mac/issues/5121)
- Mac における Skip This Update (本アップデートのスキップ) に関する問題を修正しました。
  [docker/for-mac#5842](https://github.com/docker/for-mac/issues/5842)
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/66501/Docker.dmg){: .accept-eula } |
> [Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/66501/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/66501/Docker.dmg){: .accept-eula } |
> [Apple チップの Mac](https://desktop.docker.com/mac/stable/arm64/66501/Docker.dmg){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Dev Environments Preview**: Dev Environments enable you to seamlessly collaborate with your team members without moving between Git branches to get your code onto your team members' machines. When using Dev Environments, you can share your in-progress work with your team members in just one click, and without having to deal with any merge conflicts. For more information and for instructions on how to use Dev Environments, see [Development Environments Preview](../dev-environments.md).
@y
**Dev 環境プレビュー**: Dev 環境はチームメンバーとの間で、シームレスに共同作業を実現できます。
その場合にチームメンバーは、自分のマシンに Git ブランチを取り込むことなく作業が進められます。
Dev 環境を使えば 1 クリックするだけで、作業中の環境をチームメンバーと共有できます。
そしてマージコンフリクトに対処する必要もありません。
Dev 環境に関する詳しい情報、あるいは利用手順については [Dev 環境プレビュー](../dev-environments.md) を参照してください。
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
- Fixed a connection leak when using `virtualization.framework` and not using `vpnkit`.
- Fixed spurious traces on iptables updates.
- Fixed a delay when adding a multiple port forwarding option.
@y
- Dev 環境: 特定のシナリオ生成、削除における空画面を修正しました。
  [dev-environments#4](https://github.com/docker/dev-environments/issues/4) を Fix に。
- Dev 環境: 環境削除時のエラーハンドリングを修正しました。
  [dev-environments#8](https://github.com/docker/dev-environments/issues/8) を Fix に。
- Dev 環境: 環境の生成中あるいは削除中には、**Start**, **Stop**, **Share** の各ボタンを無効にしました。
- `virtualization.framework`利用時、かつ`vpnkit`未使用時における接続漏れを修正しました。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/66090/Docker.dmg){: .accept-eula } |
> [Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/66090/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップ の Mac](https://desktop.docker.com/mac/stable/amd64/66090/Docker.dmg){: .accept-eula } |
> [Apple チップ の Mac](https://desktop.docker.com/mac/stable/arm64/66090/Docker.dmg){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Dev Environments Preview**: Dev Environments enable you to seamlessly collaborate with your team members without moving between Git branches to get your code onto your team members' machines. When using Dev Environments, you can share your in-progress work with your team members in just one click, and without having to deal with any merge conflicts. For more information and for instructions on how to use Dev Environments, see [Development Environments Preview](../dev-environments.md).
@y
**Dev 環境プレビュー**: Dev 環境はチームメンバーとの間で、シームレスに共同作業を実現できます。
その場合にチームメンバーは、自分のマシンに Git ブランチを取り込むことなく作業が進められます。
Dev 環境を使えば 1 クリックするだけで、作業中の環境をチームメンバーと共有できます。
そしてマージコンフリクトに対処する必要もありません。
Dev 環境に関する詳しい情報、あるいは利用手順については [Dev 環境プレビュー](../dev-environments.md) を参照してください。
@z

@x
**Compose V2 beta**: Docker Desktop now includes the beta version of Compose V2, which supports the `docker compose` command as part of the Docker CLI. For more information, see [Compose V2 beta](../../compose/cli-command.md). While `docker-compose` is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. The compose command in the Docker CLI supports most of the `docker-compose` commands and flags. It is expected to be a drop-in replacement for `docker-compose`. There are a few remaining flags that have yet to be implemented, see the [docker-compose compatibility list](../../compose/cli-command-compatibility.md) for more information about the flags that are supported in the new compose command. If you run into any problems with Compose V2, you can easily switch back to Compose v1 by either by making changes in Docker Desktop **Experimental** Settings, or by running the command `docker-compose disable-v2`. Let us know your feedback on the new ‘compose’ command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues) GitHub repository.
@y
**Compose V2 ベータ**: Docker Desktop に Compose V2 ベータバージョンを含めました。
これは Docker CLI の一部として`docker compose`コマンドをサポートするものです。
詳しくは [Compose V2 ベータ](../../compose/cli-command.md) を参照してください。
`docker-compose`は、今もサポートされ保守も行われています。
しかし Compose V2 の実装は、仕様の一部としてメンテナンスされている compose-go バインディングに直接基づいています。
Docker CLI の compose コマンドは、`docker-compose`コマンドとフラグをほぼサポートしています。
そこでこれらは`docker-compose`コマンドの代わりになるものとされます。
ただしまだ実装できていないフラグがいくつか残っています。
新たな compose コマンドにおいてサポートされているフラグの情報は [docker-compose 互換性リスト](../../compose/cli-command-compatibility.md) を参照してください。
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
- Fixed a link to the policy that provides details on how Docker handles the uploaded diagnostics data. Fixes [docker/for-mac#5741](https://github.com/docker/for-mac/issues/5741)
@y
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/66024/Docker.dmg){: .accept-eula } |
> [Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/66024/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/66024/Docker.dmg){: .accept-eula } |
> [Apple チップの Mac](https://desktop.docker.com/mac/stable/arm64/66024/Docker.dmg){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Dev Environments Preview**: Dev Environments enable you to seamlessly collaborate with your team members without moving between Git branches to get your code onto your team members' machines. When using Dev Environments, you can share your in-progress work with your team members in just one click, and without having to deal with any merge conflicts. For more information and for instructions on how to use Dev Environments, see [Development Environments Preview](../dev-environments.md).
@y
**Dev 環境プレビュー**: Dev 環境はチームメンバーとの間で、シームレスに共同作業を実現できます。
その場合にチームメンバーは、自分のマシンに Git ブランチを取り込むことなく作業が進められます。
Dev 環境を使えば 1 クリックするだけで、作業中の環境をチームメンバーと共有できます。
そしてマージコンフリクトに対処する必要もありません。
Dev 環境に関する詳しい情報、あるいは利用手順については [Dev 環境プレビュー](../dev-environments.md) を参照してください。
@z

@x
**Compose V2 beta**: Docker Desktop now includes the beta version of Compose V2, which supports the `docker compose` command as part of the Docker CLI. For more information, see [Compose V2 beta](../../compose/cli-command.md). While `docker-compose` is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. The compose command in the Docker CLI supports most of the `docker-compose` commands and flags. It is expected to be a drop-in replacement for `docker-compose`. There are a few remaining flags that have yet to be implemented, see the [docker-compose compatibility list](../../compose/cli-command-compatibility.md) for more information about the flags that are supported in the new compose command. If you run into any problems with Compose V2, you can easily switch back to Compose v1 by either by making changes in Docker Desktop **Experimental** Settings, or by running the command `docker-compose disable-v2`. Let us know your feedback on the new ‘compose’ command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues) GitHub repository.
@y
**Compose V2 ベータ**: Docker Desktop に Compose V2 ベータバージョンを含めました。
これは Docker CLI の一部として`docker compose`コマンドをサポートするものです。
詳しくは [Compose V2 ベータ](../../compose/cli-command.md) を参照してください。
`docker-compose`は、今もサポートされ保守も行われています。
しかし Compose V2 の実装は、仕様の一部としてメンテナンスされている compose-go バインディングに直接基づいています。
Docker CLI の compose コマンドは、`docker-compose`コマンドとフラグをほぼサポートしています。
そこでこれらは`docker-compose`コマンドの代わりになるものとされます。
ただしまだ実装できていないフラグがいくつか残っています。
新たな compose コマンドにおいてサポートされているフラグの情報は [docker-compose 互換性リスト](../../compose/cli-command-compatibility.md) を参照してください。
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
- Fixed a bug that caused Docker to fail to start because `/usr/bin` was not present on the `PATH`. Fixes [docker/for-mac#5770](https://github.com/docker/for-mac/issues/5770)
- Docker Desktop now allows files to be modified inside a host directory which is a nested mountpoint in a container. Fixes [docker/for-mac#5748](https://github.com/docker/for-mac/issues/5748).
- Fixed a settings migration bug which caused Docker Desktop not to find images and containers data after upgrading to 3.4.0. Fixes [docker/for-mac#5754](https://github.com/docker/for-mac/issues/5754).
- Docker Desktop now highlights the architecture of the non-native images in the Docker Dashboard on Apple Silicon.
- Fix using virtualization.framework on macOS 12 (Monterey).
- The default `docker` CLI `context` is now `desktop-linux`.
- Show the Docker Desktop Feedback popup only when clicking Docker menu.
@y
- **ボリューム管理**
  - Docker Dashboard を利用して、ボリューム内のファイルやディレクトリを削除できるようになりました。
  - Docker Dashboard の **Volumes** 画面に、ボリュームの最終更新時刻と、ボリューム内容のサイズを表示します。
  - Docker Dashboard を利用して、ボリューム内のファイルやディレクトリを保存できるようになりました。
- `PATH`において`/usr/bin`が含まれていないことが原因で、Docker が起動に失敗するバグを修正しました。
  [docker/for-mac#5770](https://github.com/docker/for-mac/issues/5770) を Fix に。
- ホスト上のディレクトリがコンテナー内にネストされたマウントポイントとなっている場合は、Docker Desktop からファイル修正ができるようになりました。
  [docker/for-mac#5748](https://github.com/docker/for-mac/issues/5748) を Fix に。
- Docker Desktop を 3.4.0 にアップグレードした場合に、イメージとコンテナーデータを検出できなくなるという設定移行のバグを修正しました。
  [docker/for-mac#5754](https://github.com/docker/for-mac/issues/5754) を Fix に。
- Docker Desktop では、Apple Silicon 上の Docker Dashboard において、ネイティブではないイメージのアーキテクチャーをハイライト表示するようにしました。
- macOS 12 (Monterey) における仮想環境フレームワークの利用を修正しました。
- デフォルトの`docker` CLI `context`を`desktop-linux`としました。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/65384/Docker.dmg){: .accept-eula } |
> [Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/65384/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/65384/Docker.dmg){: .accept-eula } |
> [Apple チップの Mac](https://desktop.docker.com/mac/stable/arm64/65384/Docker.dmg){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
**Volume Management**: Docker Desktop users can now create and delete volumes using the Docker Dashboard and also see which volumes are being used. For more information, see [Explore volumes](../dashboard.md#explore-volumes).
@y
**ボリューム管理**: Docker Desktop ユーザーは、Docker Dashboard を利用してボリュームの生成削除ができるようになりました。
また利用されているボリュームを参照することもできます。
詳しくは [ボリュームの確認](../dashboard.md#explore-volumes) を参照してください。
@z

@x
**Compose V2 beta**: Docker Desktop now includes the beta version of Compose V2, which supports the `docker compose` command as part of the Docker CLI. For more information, see [Compose V2 beta](../../compose/cli-command.md). While `docker-compose` is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. The compose command in the Docker CLI supports most of the `docker-compose` commands and flags. It is expected to be a drop-in replacement for `docker-compose`. There are a few remaining flags that have yet to be implemented, see the [docker-compose compatibility list](../../compose/cli-command-compatibility.md) for more information about the flags that are supported in the new compose command. If you run into any problems with Compose V2, you can easily switch back to Compose v1 by either by making changes in Docker Desktop **Experimental** Settings, or by running the command `docker-compose disable-v2`. Let us know your feedback on the new ‘compose’ command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues) GitHub repository.
@y
**Compose V2 ベータ**: Docker Desktop に Compose V2 ベータバージョンを含めました。
これは Docker CLI の一部として`docker compose`コマンドをサポートするものです。
詳しくは [Compose V2 ベータ](../../compose/cli-command.md) を参照してください。
`docker-compose`は、今もサポートされ保守も行われています。
しかし Compose V2 の実装は、仕様の一部としてメンテナンスされている compose-go バインディングに直接基づいています。
Docker CLI の compose コマンドは、`docker-compose`コマンドとフラグをほぼサポートしています。
そこでこれらは`docker-compose`コマンドの代わりになるものとされます。
ただしまだ実装できていないフラグがいくつか残っています。
新たな compose コマンドにおいてサポートされているフラグの情報は [docker-compose 互換性リスト](../../compose/cli-command-compatibility.md) を参照してください。
Compose V2 の利用にあたって何か問題が発生したら、簡単に Compose V1 に戻すことができます。
その方法は Docker Desktop の **Experimental** (試験的機能) の設定を変更するか、あるいはコマンド`docker-compose disable-v2`を実行します。
新しい`compose`コマンドへのフィードバックは、GitHub リポジトリ [Compose-CLI](https://github.com/docker/compose-cli/issues) に issue を新規生成してお知らせください。
@z

@x
**Skip Docker Desktop updates**: All users can now skip an update when they are prompted to install individual Docker Desktop releases. For more information, see [Docker Desktop updates](../windows/install.md#updates).
@y
**Docker Desktop 更新のスキップ**: Docker Desktop の新規リリースがプロンプト表示される際に、アップデートをスキップできるようにしました。
詳しくは [Docker Desktop のアップデート](../windows/install.md#updates) を参照してください。
@z

@x
### Deprecation
@y
{: #deprecation }
### 廃止決定
@z

@x
- Docker Desktop no longer installs Notary. You can now use [Docker Content Trust](../../engine/security/trust/index.md) for image signing.
@y
- Docker Desktop では Notary をインストールしないようになりました。
  イメージ署名には [Docker コンテントトラスト](../../engine/security/trust/index.md) を利用できます。
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
- Prevent `docker run` from hanging if inotify event injection fails. Fixes [docker/for-mac#5590](https://github.com/docker/for-mac/issues/5590).
- Fixed error showing stderr log in the UI. Fixes [docker/for-mac#5688](https://github.com/docker/for-mac/issues/5688).
- Fixed an issue which caused `riscv64` emulation to fail on Docker Desktop. Fixes [docker/for-mac#5699](https://github.com/docker/for-mac/issues/5699).
- Automatically reclaim space after deleting containers by deleting volumes and removing build cache.
- Docker Desktop now allows a blank HTTP proxy to be configured for the Docker engine, which will completely disable the internal HTTP proxy. See [docker/for-mac#2467](https://github.com/docker/for-mac/issues/2467).
- Docker Compose applications with file names other than `docker-compose.yml` can now be removed from Docker Desktop. Fixes [docker/for-win#11046](https://github.com/docker/for-win/issues/11046)
- Docker Desktop now exposes the host CPU on Apple silicon. Fixes [docker/for-mac#5681](https://github.com/docker/for-mac/issues/5681).
- Avoid leaking open ports bound to privileged ports and specific IPs over engine Restart. Fixes [docker/for-mac#5649](https://github.com/docker/for-mac/issues/5649).
- Use `vpnkit` with `virtualization.framework` to fix connectivity issues with VPN clients such as Cisco AnyConnect.
- Fixed version number missing in update dialog window.
- Fixed an issue where the diagnostics were sometimes not uploaded correctly from the **Support** dialog.
- Fixed DNS entries for `*.docker.internal` and Kubernetes cluster reset after the VM IP changes. Fixes [docker/for-mac#5707](https://github.com/docker/for-mac/issues/5707), [docker/for-mac#5680](https://github.com/docker/for-mac/issues/5680), [docker/for-mac#5663](https://github.com/docker/for-mac/issues/5663) and [docker/for-mac#5653](https://github.com/docker/for-mac/issues/5653).
- Avoid running `com.docker.osxfs` when gRPC FUSE is enabled. Fixes [docker/for-mac#5725](https://github.com/docker/for-mac/issues/5725).
@y
- inofity イベントインジェクションが失敗した場合に`docker run`がハングしないようにしました。
  [docker/for-mac#5590](https://github.com/docker/for-mac/issues/5590) を Fix に。
- UI 上に標準エラー出力ログが表示されるのを修正しました。
  [docker/for-mac#5688](https://github.com/docker/for-mac/issues/5688) を Fix に。
- Docker Desktop において`riscv64`エミュレーションが失敗する原因を修正しました。
  [docker/for-mac#5699](https://github.com/docker/for-mac/issues/5699) を Fix に。
- ボリューム削除とビルドキャッシュ削除を行うことにより、コンテナー削除後の容量再利用を自動的に行うようにしました。
- Docker Desktop では Docker engine 向けに空の HTTP プロキシーを設定できるようになりました。
  これにより、内部 HTTP プロキシーは完全に無効となります。
  [docker/for-mac#2467](https://github.com/docker/for-mac/issues/2467) を参照。
- Docker Compose アプリケーションが`docker-compose.yml`以外の名前で定義されているものは、Docker Desktop から削除されるようになりました。
  [docker/for-win#11046](https://github.com/docker/for-win/issues/11046) を Fix に。
- Docker Desktop では Apple Silicon 上のホスト CPU を公開することになりました。
  [docker/for-mac#5681](https://github.com/docker/for-mac/issues/5681) を Fix に。
- エンジン再起動時に特権ポートや特定 IP に割り当てられた公開済ポートを、開いたままにしないようにしました。
  [docker/for-mac#5649](https://github.com/docker/for-mac/issues/5649) を Fix に。
- `vpnkit`を`virtualization.framework`とともに用いることで、Cisco AnyConnect などの VPN クライアントとの接続に関わる問題を修正しました。
- アップデートのダイアログ画面に、バージョン番号が含まれていなかったため修正しました。
- **Support** ダイアログからの診断情報のアップロードが、正しくアップロードされないことがあるため、この問題を修正しました。
- VM の IP が変更された後に、`*.docker.internal`と Kubernetes クラスターの DNS エントリのリセットを修正しました。
  [docker/for-mac#5707](https://github.com/docker/for-mac/issues/5707),
  [docker/for-mac#5680](https://github.com/docker/for-mac/issues/5680),
  [docker/for-mac#5663](https://github.com/docker/for-mac/issues/5663),
  [docker/for-mac#5653](https://github.com/docker/for-mac/issues/5653) を Fix に。
- gRPC FUSE の有効時には`com.docker.osxfs`を実行しないようにしました。
  [docker/for-mac#5725](https://github.com/docker/for-mac/issues/5725) を Fix に。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- On Apple Silicon in native `arm64` containers, older versions of `libssl` in `debian:buster`, `ubuntu:20.04` and `centos:8` will segfault when connected to some TLS servers, for example `curl https://dl.yarnpkg.com`. The bug is fixed in newer versions of `libssl` in `debian:bullseye`, `ubuntu:21.04` and `fedora:35`.
@y
- Apple Silicon 上において、`arm64`コンテナー、`debian:buster`において古い版の`libssl`を利用するもの、`ubuntu:20.04`、`centos:8`がいずれも、特定の TLS サーバーに接続した際にセグメンテーションフォールトを起こします。
  たとえば`curl https://dl.yarnpkg.com`した場合です。
  `debian:bullseye`、`ubuntu:21.04`、`fedora:35`における新しいバージョンの`libssl`において、このバグは修正されています。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/64133/Docker.dmg){: .accept-eula } |
> [Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/64133/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/64133/Docker.dmg){: .accept-eula } |
> [Apple チップの Mac](https://desktop.docker.com/mac/stable/arm64/64133/Docker.dmg){: .accept-eula }
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
### Docker Desktop 3.3.2
2021-05-03
@y
### Docker Desktop 3.3.2
2021-05-03
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/63878/Docker.dmg){: .accept-eula } |
> [Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/63878/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/63878/Docker.dmg){: .accept-eula } |
> [Apple チップの Mac](https://desktop.docker.com/mac/stable/arm64/63878/Docker.dmg){: .accept-eula }
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
- Fixed a bug with an Apple chip where the last byte in a network transfer was occasionally lost.
- Fixed a bug where a `metrics-port` defined in the engine's `daemon.json` blocks application restart.
- Fixed a leak of ephemeral ports. Fixes [docker/for-mac#5611](https://github.com/docker/for-mac/issues/5611).
- Emulate a more modern Intel CPU with `qemu` on an Apple chip, for better image compatibility. See [docker/for-mac#5561](https://github.com/docker/for-mac/issues/5561).
- Enable buildkit garbage collection by default.
- Fixed a bug which blocked binding to port 123. Fixes [docker/for-mac#5589](https://github.com/docker/for-mac/issues/5589).
- Disable the HTTP and HTTPS transparent proxies when there is no upstream proxy set. Fixes [docker/for-mac#5572](https://github.com/docker/for-mac/issues/5572).
- Revert to the HTTP and HTTPS proxy implementation used in 3.2.2.
- Removed the "Deploy Docker Stacks to Kubernetes by default" Kubernetes setting. The component was removed in 2.4.0.0 but we forgot to remove the setting. Fixes [docker/for-mac#4966](https://github.com/docker/for-mac/issues/4966).
@y
- Apple チップにおいて、ネットワーク転送時の最終バイトがときどき欠損してしまうバグを修正しました。
- Engine の`daemon.json`において定義された`metrics-port`が、アプリケーションの再起動をブロックしてしまうバグを修正しました。
- エフェメラルポートの漏れを修正しました。
  [docker/for-mac#5611](https://github.com/docker/for-mac/issues/5611) を Fix に。
- Apple チップ上において`qemu`を利用したより最新の Intel CPU をエミュレートし、イメージの互換性を高めました。
  [docker/for-mac#5561](https://github.com/docker/for-mac/issues/5561) を参照のこと。
- デフォルトで buildkit のガーベージコレクションを有効にしました。
- ポート 123 へのバインディングを阻止するバグを修正しました。
  [docker/for-mac#5589](https://github.com/docker/for-mac/issues/5589) を Fixに。
- HTTP および HTTPS 透過プロキシーにおいて、上流のプロキシーセットがない場合には無効としました。
  [docker/for-mac#5572](https://github.com/docker/for-mac/issues/5572) を Fix に。
- HTTP および HTTPS プロキシーの実装を 3.2.2 のものに戻しました。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/63152/Docker.dmg){: .accept-eula } |
> [Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/63152/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/63152/Docker.dmg){: .accept-eula } |
> [Apple チップの Mac](https://desktop.docker.com/mac/stable/arm64/63152/Docker.dmg){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
Docker Desktop is now available for Apple silicon as well as Intel chips. This enables developers with their choice of local development environments, and extends development pipelines for ARM-based applications. For more information, see [Docker Desktop for Apple silicon](apple-silicon.md).
@y
Docker Desktop は Intel チップに加えて Apple silicon においても利用できるようになりました。
開発者によるローカル開発環境の選択肢が広がったことになります。
また ARM ベースアプリケーション開発に拡張することができます。
詳しくは [Docker Desktop for Apple silicon](apple-silicon.md) を参照してください。
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop now ensures the permissions of `/dev/null` and other devices are correctly set to `0666` (`rw-rw-rw-`) inside `--privileged` containers. Fixes [docker/for-mac#5527](https://github.com/docker/for-mac/issues/5527)
- Fixed an issue that caused Docker Desktop to fail during startup when it is unable to establish a connection with Docker Hub in the backend. Fixes [docker/for-win#10896](https://github.com/docker/for-win/issues/10896)
@y
- `--privileged`が指定されたコンテナー内において、`/dev/null`などのデバイスが、適切に`0666`（`rw-rw-rw-`）となりようにしました。
  [docker/for-mac#5527](https://github.com/docker/for-mac/issues/5527) を Fix に。
- Docker Hub に対するバックエンドによる接続ができなかった場合、Docker Desktop が起動に失敗する問題を修正しました。
  [docker/for-win#10896](https://github.com/docker/for-win/issues/10896) を Fix に。
@z

@x
- **Mac with Apple silicon**: Docker Desktop now reduces the idle CPU consumption.
@y
- **Apple silicon の Mac** ＝ Docker Desktop にてアイドル時の CPU 消費を減少させました。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
**Apple silicon**
@y
**Apple silicon**
@z

@x
- `ping` from inside a container to the Internet does not work as expected. To test the network, we recommend using `curl` or `wget`. See [docker/for-mac#5322](https://github.com/docker/for-mac/issues/5322#issuecomment-809392861).
- Users may occasionally experience data drop when a TCP stream is half-closed.
@y
- コンテナー内からインターネットに向けての`ping`が期待どおりに動作しません。
  ネットワークの確認にあたっては`curl`や`wget`を利用してください。
  [docker/for-mac#5322](https://github.com/docker/for-mac/issues/5322#issuecomment-809392861) を参照のこと。
- TCP ストリームがハーフクロース（half-closed）された際に、たまにデータが欠損する場合があります。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/62916/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/62916/Docker.dmg){: .accept-eula }
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
こういった状況があるため、有償の Docker サブスクリプションのユーザーは、アップデートのリマインダーが表示された際に特定アップデートの通知をスキップすることができます。
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
- [Linux kernel 5.10.25](https://hub.docker.com/layers/docker/for-desktop-kernel/5.10.25-6594e668feec68f102a58011bb42bd5dc07a7a9b/images/sha256-80e22cd9c9e6a188a785d0e23b4cefae76595abe1e4a535449627c2794b10871?context=repo)
- [Snyk v1.461.0](https://github.com/snyk/snyk/releases/tag/v1.461.0)
- [Docker Hub Tool v0.3.1](https://github.com/docker/hub-tool/releases/tag/v0.3.1)
- [containerd v1.4.4](https://github.com/containerd/containerd/releases/tag/v1.4.4)
- [runc v1.0.0-rc93](https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc93)
@y
- [Docker Compose 1.29.0](https://github.com/docker/compose/releases/tag/1.29.0)
- [Compose CLI v1.0.12](https://github.com/docker/compose-cli/tree/v1.0.12)
- [Linux kernel 5.10.25](https://hub.docker.com/layers/docker/for-desktop-kernel/5.10.25-6594e668feec68f102a58011bb42bd5dc07a7a9b/images/sha256-80e22cd9c9e6a188a785d0e23b4cefae76595abe1e4a535449627c2794b10871?context=repo)
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
- Fixed a bug that `--add-host host.docker.internal:host-gateway` caused `host.docker.internal` to resolve to the wrong IP address. See [docker/for-linux#264](https://github.com/docker/for-linux/issues/264#issuecomment-785137844).
- Fixed a bug that caused inter-container HTTP traffic to be misrouted to the external HTTP proxy. Fixes [docker/for-mac#5476](https://github.com/docker/for-mac/issues/5476).
- Fixed a bug that could cause other files in the same folder as the VM disk to be deleted when the disk was resized. Fixes [docker/for-mac#5486](https://github.com/docker/for-mac/issues/5486).
- Fixed an issue where delta downloads caused an `Illegal instruction exception`. Fixes [docker/for-mac#5459](https://github.com/docker/for-mac/issues/5459).
- Apply domain-based HTTPS proxy `no_proxy` rules for encrypted connections. Fixes [docker/for-mac#2732](https://github.com/docker/for-mac/issues/2732).
- Fixed missing text in reset to factory defaults dialog. Fixes [docker/for-mac#5457](https://github.com/docker/for-mac/issues/5457).
- Fixed an issue where running a container with a random port on the host caused Docker Desktop dashboard to incorrectly open a browser with port 0, instead of using the allocated port.
- Fixed an issue where pulling an image from Docker Hub using the Docker Desktop dashboard was failing silently.
- Removed unused DNS name `docker.for.mac.http.internal`.
- Perform a filesystem check when starting the Linux VM.
- Detect Linux kernel crashes and escalate them to the user.
@y
- 明示的にプロジェクト名を指定して起動された Compose アプリケーションに対して、これを参照する際の問題を修正しました。
  [docker/for-win#10564](https://github.com/docker/for-win/issues/10564) を Fix に。
- `--add-host host.docker.internal:host-gateway`を指定すると`host.docker.internal`が誤った IP アドレスに変換されてしまうバグを修正しました。
  [docker/for-linux#264](https://github.com/docker/for-linux/issues/264#issuecomment-785137844) 参照のこと。
- コンテナー間での HTTP トラフィックが外部 HTTP プロキシーに対して誤って送信されてしまうバグを修正しました。
  [docker/for-mac#5476](https://github.com/docker/for-mac/issues/5476) を Fix に。
- VM ディスクの容量変更を行うと、ディスクファイルと同じフォルダー内の別のファイルが削除されてしまうバグを修正しました。
  [docker/for-mac#5486](https://github.com/docker/for-mac/issues/5486) を Fix に。
- デルタダウンロードが`Illegal instruction exception`を発生させる問題を修正しました。
  [docker/for-mac#5459](https://github.com/docker/for-mac/issues/5459) を Fix に。
- ドメインベースの HTTPS プロキシーにおける暗号化接続に対して`no_proxy`ルールを適用しました。
  [docker/for-mac#2732](https://github.com/docker/for-mac/issues/2732) を Fix に。
- リセット操作時の factory defaults ダイアログ画面でのテキスト不備を修正しました。
  [docker/for-mac#5457](https://github.com/docker/for-mac/issues/5457) を Fix に。
- ホスト上のランダムポートを使ってコンテナーを実行すると、Docker Desktop ダッシュボードが、その割り当てられたポートでなく間違ってポート 0 としてブラウザー表示してしまう問題を修正しました。
- Docker Desktop ダッシュボードを使って Docker Hub からイメージをプルすると、何も表示されずに処理失敗する問題を修正しました。
- 未使用の DNS 名`docker.for.mac.http.internal`を削除しました。
- Linux VM 起動時にファイルシステムのチェックを実行するようにしました。
- Linux カーネルのクラッシュを検知して、これをユーザーにエスカレートします。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/61853/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/61853/Docker.dmg){: .accept-eula }
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue that stopped containers binding to port 53. Fixes [docker/for-mac#5416](https://github.com/docker/for-mac/issues/5416).
- Fixed an issue that 32-bit Intel binaries were emulated on Intel CPUs. Fixes [docker/for-win#10594](https://github.com/docker/for-win/issues/10594).
- Fixed an issue related to high CPU consumption and frozen UI when the network connection is lost. Fixes [for-win/#10563](https://github.com/docker/for-win/issues/10563).
- Fixed an issue opening a terminal in iTerm2 when it has no other windows open. Fixes [docker/roadmap#98](https://github.com/docker/roadmap/issues/98#issuecomment-791927788).
@y
- ポート 53 にバインドされている停止コンテナーに関しての問題を修正しました。
  [docker/for-mac#5416](https://github.com/docker/for-mac/issues/5416) を Fix に。
- 32 ビット Intel バイナリが Intel CPU にエミュレートされていた問題を修正しました。
  [docker/for-win#10594](https://github.com/docker/for-win/issues/10594) を Fix に。
- ネットワーク接続が切断された際に、CPU の異常消費および UI フリーズを引き起こす問題を修正しました。
  [for-win/#10563](https://github.com/docker/for-win/issues/10563) を Fix に。
- iTerm2 においてウィンドウが 1 つも開いていないときにターミナルを開いてしまう問題を修正しました。
  [docker/roadmap#98](https://github.com/docker/roadmap/issues/98#issuecomment-791927788) を Fix に。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/61626/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/61626/Docker.dmg){: .accept-eula }
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
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue that sometimes caused Docker Desktop to fail to start after updating to version 3.2.0. Fixes [docker/for-mac#5406](https://github.com/docker/for-mac/issues/5406). If you are still experiencing this issue when trying to update from 3.2.0 to 3.2.1, we recommend that you uninstall 3.2.0 and manually install Docker Desktop 3.2.1.
@y
- Docker Desktop バージョン 3.2.0 にアップグレードした後に、Docker Desktop の起動に失敗することがある問題を修正しました。
  [docker/for-mac#5406](https://github.com/docker/for-mac/issues/5406) を Fix に。
  3.2.0 から 3.2.1 にアップデートしてもまだ問題が解決しない場合は、3.2.0 をアンインストールし手動で 3.2.1 をインストールすることをお勧めします。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/61504/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/amd64/61504/Docker.dmg){: .accept-eula }
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
- Docker Desktop uses iTerm2 to launch the terminal on the container if it is installed. Otherwise, it launches the default Terminal.App. [docker/roadmap#98](https://github.com/docker/roadmap/issues/98)
- Add experimental support to use the new Apple Virtualization framework (requires macOS Big Sur 11.1 or later)
- BuildKit is now the default builder for all users, not just for new installations. To turn this setting off, go to **Preferences** > **Docker Engine** and add the following block to the Docker daemon configuration file:
```json
"features": {
    "buildkit": false
}
```
@y
- Docker Desktop 起動時に、自動的に Docker Dashboard を開くようにしました。
- Docker Dashboard では 1 週間に 1 回、ヒント（tip）を表示するようにしました。
- iTerm2 がインストールされている場合 Docker Desktop はコンテナー内で iTerm2 を開くようにしました。
  それ以外の場合はデフォルトの Terminal アプリを起動します。
  [docker/roadmap#98](https://github.com/docker/roadmap/issues/98)
- 新しい Apple 仮想フレームワークを利用した試験的サポートを追加しました。
  （macOS Big Sur 11.1 またはそれ以降を必要とします。）
- BuildKit は新規インストール時だけでなく、すべてのユーザーにおいてデフォルトのビルダーとなりました。
  この設定をオフにするには **Preferences** > **Docker Engine** を実行して、Docker デーモン設定ファイルに以下の記述を追加してください。
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
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue on the container detail screen where the buttons would disappear when scrolling the logs. Fixes [docker/for-mac#5290](https://github.com/docker/for-mac/issues/5290)
- Fixed an issue when port forwarding multiple ports with an IPv6 container network. Fixes [docker/for-mac#5247](https://github.com/docker/for-mac/issues/5247)
- Fixed a regression where `docker load` could not use an xz archive anymore. Fixes [docker/for-mac#5271](https://github.com/docker/for-mac/issues/5271)
- Fixed a navigation issue in the **Containers / Apps** view. Fixes [docker/for-win#10160](https://github.com/docker/for-win/issues/10160#issuecomment-764660660)
- Fixed container instance view with long container/image name. Fixes [docker/for-mac#5290](https://github.com/docker/for-mac/issues/5290)
- Fixed an issue when binding ports on specific IPs. Note: It may now take a bit of time before the `docker inspect` command shows the open ports. Fixes [docker/for-mac#4541](https://github.com/docker/for-mac/issues/4541)
- Fixed an issue where an image deleted from the Docker dashboard was still displayed on the **Images** view.
@y
- コンテナーの詳細表示画面において、ログをスクロールするとボタンが消失してしまう問題を修正しました。
  [docker/for-mac#5290](https://github.com/docker/for-mac/issues/5290) を Fix に。
- IPv6 によるコンテナーネットワークにおいて、複数ポートに向けてのポートフォワーディングが行われる際の問題を修正しました。
  [docker/for-mac#5247](https://github.com/docker/for-mac/issues/5247) を Fix に。
- `docker load`において xz アーカイブが利用できなくなってしまった機能低下を修正しました。
  [docker/for-mac#5271](https://github.com/docker/for-mac/issues/5271) を Fix に。
- **Containers / Apps** 画面におけるナビゲーション処理を修正しました。
  [docker/for-win#10160](https://github.com/docker/for-win/issues/10160#issuecomment-764660660) を Fix に。
- コンテナー名やイメージ名が長い場合のコンテナーインスタンス画面を修正しました。
  [docker/for-mac#5290](https://github.com/docker/for-mac/issues/5290) を Fix に。
- 特定の IP アドレスにポートバインディングする際の問題を修正しました。
  メモ： これにより`docker inspect`コマンドが公開ポートを表示するのに時間を要するかもしれません。
  [docker/for-mac#4541](https://github.com/docker/for-mac/issues/4541) を Fix に。
- Docker Dashboard からイメージを削除しても **Images** 画面に表示されたままとなる問題を修正しました。
@z

@x
### Known issue
@y
{: #known-issues }
### 既知の問題
@z

@x
Docker Desktop can sometimes fail to start after updating to version 3.2.0. If you are experiencing this issue, we recommend that you uninstall 3.2.0 and manually install [Docker Desktop 3.2.1](#docker-desktop-321). See [docker/for-mac#5406](https://github.com/docker/for-mac/issues/5406).
@y
Docker Desktop をバージョン 3.2.0 にアップデートすると、起動に失敗することがあります。
この問題に遭遇した場合は、アンインストールを行って手動で [Docker Desktop 3.2.1](#docker-desktop-321) をインストールすることをお勧めします。
[docker/for-mac#5406](https://github.com/docker/for-mac/issues/5406) を参照のこと。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/51484/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/51484/Docker.dmg){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- Docker daemon now runs within a Debian Buster based container (instead of Alpine).
@y
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
  - Fixed UI reliability issues when users create or delete a lot of objects in batches.
  - Fixed an issue with DNS address resolution in Alpine containers. Fixes [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020).
  - Redesigned the **Support** UI to improve usability.
@y
  - ユーザーがバッチ処理によって数多くのオブジェクトを生成したり削除したりしても、UI の信頼性に問題がないように修正しました。
  - Alpine コンテナーにおける DNS アドレス解決の問題を修正しました。
    [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020) を Fix に。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/51218/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/51218/Docker.dmg){: .accept-eula }
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
- Avoid timeouts during `docker-compose up` by making cache invalidation faster. Fixes [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957).
- Avoid generating a spurious filesystem DELETE event while invalidating caches. Fixes [docker/for-mac#5124](https://github.com/docker/for-mac/issues/5124).
@y
- キャッシュ無効化を高速にすることで`docker-compose up`のタイムアウトを防止しました。
  [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957) を Fix に。
- キャッシュ無効化の際に、疑似的なファイルシステムイベント DELETE を生成しないようにしました。
  [docker/for-mac#5124](https://github.com/docker/for-mac/issues/5124) を Fix に。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- Some DNS addresses fail to resolve within containers based on Alpine Linux 3.13. See [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020).
@y
- Alpine Linux 3.13 に基づくコンテナー内において DNS アドレス解決に失敗することがあります。
  [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020) を参照のこと。
@z

@x
## Docker Desktop 3.0.3
2020-12-21
@y
## Docker Desktop 3.0.3
2020-12-21
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/51017/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/51017/Docker.dmg){: .accept-eula }
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue that caused overlapping volume mounts to fail. Fixes [docker/for-mac#5157](https://github.com/docker/for-mac/issues/5157). However, the fixes for [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957) and [docker/for-mac#5124](https://github.com/docker/for-mac/issues/5124) have been reverted as a result of this change, so those issues are now present again.
@y
- ボリュームマウントのオーバーラップが失敗する点を修正しました。
  [docker/for-mac#5157](https://github.com/docker/for-mac/issues/5157) を Fix に。
  ただし [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957) や [docker/for-mac#5124](https://github.com/docker/for-mac/issues/5124) に対する修正によって本修正が元に戻ってしまったため、これらは再度問題として残ります。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- Some DNS addresses fail to resolve within containers based on Alpine Linux 3.13. See [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020).
- There can be timeouts during docker-compose up if there are several services being started. See [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957) and [docker/for-mac#5124](https://github.com/docker/for-mac/issues/5124).
@y
- Alpine Linux 3.13 に基づくコンテナー内において DNS アドレス解決に失敗することがあります。
  [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020) を参照のこと。
- docker-compose up の処理にあたって複数サービスが起動しているときにタイムアウトが発生する場合があります。
  [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957) と [docker/for-mac#5124](https://github.com/docker/for-mac/issues/5124) を参照のこと。
@z

@x
## Docker Desktop 3.0.2
2020-12-18
@y
## Docker Desktop 3.0.2
2020-12-18
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/50996/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/50996/Docker.dmg){: .accept-eula }
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Avoid timeouts during `docker-compose up` by making cache invalidation faster. Fixes [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957).
- Avoid generating a spurious filesystem DELETE event while invalidating caches. Fixes [docker/for-mac#5124](https://github.com/docker/for-mac/issues/5124).
- It is now possible to share directories in `~/Library` (except Docker Desktop data directories) with a container. Fixes [docker/for-mac#5115](https://github.com/docker/for-mac/issues/5115).
- You will now see a performance warning pop-up message if you create a container that shares the `Home` or  a user `Library` directory.
@y
- キャッシュ無効化を高速にすることで`docker-compose up`のタイムアウトを防止しました。
  [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957) を Fix に。
- キャッシュ無効化の際に、疑似的なファイルシステムイベント DELETE を生成しないようにしました。
  [docker/for-mac#5124](https://github.com/docker/for-mac/issues/5124) を Fix に。
- `~/Library`内のディレクトリ（Docker Desktop データディレクトリは除く）をコンテナーと共有できるようにしました。
  [docker/for-mac#5115](https://github.com/docker/for-mac/issues/5115) を Fix に。
- `Home`ディレクトリまたはユーザーの`Library`ディレクトリを共有するコンテナーを生成した際に、性能に関する警告ポップアップメッセージが表示されるようになります。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- Some DNS addresses fail to resolve within containers based on Alpine Linux 3.13. See [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020).
@y
- Alpine Linux 3.13 に基づくコンテナー内において DNS アドレス解決に失敗することがあります。
  [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020) を参照のこと。
@z

@x
## Docker Desktop 3.0.1
2020-12-11
@y
## Docker Desktop 3.0.1
2020-12-11
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/50773/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/50773/Docker.dmg){: .accept-eula }
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue that caused certain directories not to be mountable into containers. Fixes [docker/for-mac#5115](https://github.com/docker/for-mac/issues/5115). See Known issues below.
@y
- 特定のディレクトリをコンテナーに対してマウントできなくなる問題を修正しました。
  [docker/for-mac#5115](https://github.com/docker/for-mac/issues/5115) を Fix に。
  以下の既知の問題を参照のこと。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- It is currently not possible to bind mount files within `~/Libary` into a container. See [docker/for-mac#5115](https://github.com/docker/for-mac/issues/5115).
- Building an image with BuildKit from a git URL fails when using the form `github.com/org/repo`. To work around this issue, use the form `git://github.com/org/repo`.
- Some DNS addresses fail to resolve within containers based on Alpine Linux 3.13. See [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020).
@y
- 現時点では、`~/Libary`内のファイルをコンテナーに対してバインドマウントすることができません。
  [docker/for-mac#5115](https://github.com/docker/for-mac/issues/5115) を参照のこと。
- git URL から BuildKit を使ってイメージをビルドする際に、`github.com/org/repo`の形を用いているとビルドに失敗します。
  この問題を回避するには`git://github.com/org/repo`の形を用いるようにします。
- Alpine Linux 3.13 に基づくコンテナー内において DNS アドレス解決に失敗することがあります。
  [docker/for-mac#5020](https://github.com/docker/for-mac/issues/5020) を参照のこと。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/stable/50684/Docker.dmg){: .accept-eula }
@y
> Docker Desktop のダウンロード
>
> {%- include eula.md -%}
>
> [Intel チップの Mac](https://desktop.docker.com/mac/stable/50684/Docker.dmg){: .accept-eula }
@z

@x
### New
@y
{: #new }
### 新機能
@z

@x
- Use of three-digit version number for Docker Desktop releases.
- Starting with Docker Desktop 3.0.0, updates are now much smaller as they will be applied using delta patches. For more information, see [Automatic updates](install.md#updates).
- First version of `docker compose` (as an alternative to the existing `docker-compose`). Supports some basic commands but not the complete functionality of `docker-compose` yet.
@y
- Docker Desktop リリースに対して 3 桁のバージョン番号を用いるようにしました。
- Docker Desktop 3.0.0 から、デルタパッチを用いてアップデートを行うことにより、アップデートをより小さなものにしました。
  詳しくは [自動アップデート](install.md#updates) を参照してください。
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
- Avoid caching bad file sizes and modes when using `osxfs`. Fixes [docker/for-mac#5045](https://github.com/docker/for-mac/issues/5045).
- Fixed a possible file sharing error where a file may appear to have the wrong size in a container when it is modified on the host. This is a partial fix for [docker/for-mac#4999](https://github.com/docker/for-mac/issues/4999).
- Removed unnecessary log messages which slow down filesystem event injection.
- Re-enabled the experimental SOCKS proxy. Fixes [docker/for-mac#5048](https://github.com/docker/for-mac/issues/5048).
- Fixed an unexpected EOF error when trying to start a non-existing container with `-v /var/run/docker.sock:`. See [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025).
- Display an error message instead of crashing when the application needs write access on specific directories. See [docker/for-mac#5068](https://github.com/docker/for-mac/issues/5068)
@y
- Hyperkit の CPU 使用量を軽減するため、カーネル [4.19.121](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.121-2a1dbedf3f998dac347c499808d7c7e029fbc4d3-amd64/images/sha256-4e7d94522be4f25f1fbb626d5a0142cbb6e785f37e437f6fd4285e64a199883a?context=repo) にダウングレードしました。
- `osxfs`利用時にファイルサイズやモードを誤ってキャッシングしないようにしました。
  [docker/for-mac#5045](https://github.com/docker/for-mac/issues/5045) を Fix に。
- コンテナー内でのファイルがホスト上において修正された際に、そのファイルサイズに誤りがあると、ファイル共有に失敗する可能性がある点を修正しました。
  これにより [docker/for-mac#4999](https://github.com/docker/for-mac/issues/4999) を部分的に Fix に。- ファイルシステムイベントの処理を低下させる不要なログメッセージを削除しました。
- 試験的な SOCKS プロキシーを再度有効にしました。
  [docker/for-mac#5048](https://github.com/docker/for-mac/issues/5048) を Fix に。
- `-v /var/run/docker.sock:` を指定により、存在しないコンテナーを起動しようとして、予期しない EOF エラーとなる点を修正しました。
  [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025) を参照のこと。
- アプリケーションが特定のディレクトリへの書き込み権限を必要とする際に、クラッシュせずにエラーメッセージを表示するようにしました。
  [docker/for-mac#5068](https://github.com/docker/for-mac/issues/5068) を参照のこと。
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
