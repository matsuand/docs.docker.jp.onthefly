%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Change log / release notes for Docker Desktop for Mac
keywords: Docker Desktop for Mac, release notes
title: Docker Desktop for Mac release notes
toc_min: 1
toc_max: 2
redirect_from:
- /docker-for-mac/release-notes/
- /docker-for-mac/edge-release-notes/
- /mackit/release-notes/
---
@y
---
description: Change log / release notes for Docker Desktop for Mac
keywords: Docker Desktop for Mac, release notes
title: Docker Desktop for Mac release notes
toc_min: 1
toc_max: 2
redirect_from:
- /docker-for-mac/release-notes/
- /docker-for-mac/edge-release-notes/
- /mackit/release-notes/
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
## Docker Desktop 4.1.1
2021-10-12
@y
## Docker Desktop 4.1.1
2021-10-12
@z

@x
> Download Docker Desktop
>
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .button .primary-btn }
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .button .primary-btn }
@y
> Download Docker Desktop
>
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .button .primary-btn }
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .button .primary-btn }
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a bug where a `Docker.qcow2` file would be ignored on upgrade and a fresh `Docker.raw` used instead, resulting in containers and images disappearing. If a system has both files (due to the previous bug) then the most recently modified file will be used, to avoid recent containers and images disappearing again. To force the use of the old `Docker.qcow2`, delete the newer `Docker.raw` file. Fixes [docker/for-mac#5998](https://github.com/docker/for-mac/issues/5998).
- Fixed update notification overlay sometimes getting out of sync between the Settings button and the Software update button in the Dashboard.
- Fixed menu entry to install a downloaded new Desktop update. When an update is ready to install `Restart` should change to `Update and restart`.
@y
- Fixed a bug where a `Docker.qcow2` file would be ignored on upgrade and a fresh `Docker.raw` used instead, resulting in containers and images disappearing. If a system has both files (due to the previous bug) then the most recently modified file will be used, to avoid recent containers and images disappearing again. To force the use of the old `Docker.qcow2`, delete the newer `Docker.raw` file. Fixes [docker/for-mac#5998](https://github.com/docker/for-mac/issues/5998).
- Fixed update notification overlay sometimes getting out of sync between the Settings button and the Software update button in the Dashboard.
- Fixed menu entry to install a downloaded new Desktop update. When an update is ready to install `Restart` should change to `Update and restart`.
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/69386/Docker.dmg) |
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/69386/Docker.dmg)
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/69386/Docker.dmg) |
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/69386/Docker.dmg)
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
- **Volume Management**: Volume management is now available for users on any subscription, including Docker Personal. For more information, see [Explore volumes](../../dashboard.md#explore-volumes).
@y
- **ソフトウェア更新** ＝ Settings（設定）タブに新たなセクションが追加され、Docker Desktop のアップデートを管理できるようになりました。
  **Software Updates**（ソフトウェア更新）セクションでは、新たな更新があれば通知されます。
  そして更新のダウンロードを行ったり、最新版に含まれる機能がどのようなものかを参照したりすることができます。
  詳しくは [ソフトウェア更新](../index.md#software-updates) を参照してください。
- **Compose V2** ＝ General（一般）において [Docker Compose V2](../../../compose/cli-command.md) を利用するかどうかが設定できるようになりました。
- **ボリューム管理** ＝ Docker Desktop 4.1.0 リリースから、Docker Personal も含め、どのサブスクリプションユーザーであっても、ボリューム管理機能が利用できるようになりました。
  詳しくは [ボリュームの確認](../../dashboard.md#explore-volumes) を参照してください。
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
- Docker Desktop は、小規模ビジネス向け（従業員 250 未満、かつ年間収益 1,000 万ドル未満）、個人利用、教育目的、非商用のオープンソースプロジェクトに対しては、 **無償提供が継続** されます。
- 大規模なエンタープライズ向けのプロフェッショナル利用に対しては、最低でも月額 5 ドルの有償サブスクリプション（**Pro, Team, Business**）が必要です。
- この条件の適用開始日は 2021 年 8 月31 日です。
  Docker Deskop の利用に有償サブスクリプションが必要とされるものであっても、 2022 年 1 月 31 日までは猶予期間が設けられています。
- Docker Pro と Docker Team のサブスクリプションには、Docker Desktop の **商用利用** が含まれるようになりました。
- 既存の Docker 無償サブスクリプションは **Docker Personal** として名称変更されました。
- Docker Engine、これに関するアップストリームの **オープンソース**、Moby プロジェクトには **一切変更がありません**。
@z

@x
To understand how these changes affect you, read the [FAQs](https://www.docker.com/pricing/faq){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"}. For more information, see [Docker subscription overview](../../../subscription/index.md).
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
- Fixed a bug where SSH was not available for builds from git URL. Fixes [for-mac#5902](https://github.com/docker/for-mac/issues/5902)
@y
- git URL からのビルドに対して、 SSH が利用不能であった点を修正しました。
  [for-mac#5902](https://github.com/docker/for-mac/issues/5902) を Fix に。
@z
