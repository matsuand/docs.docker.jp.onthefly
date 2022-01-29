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
title: Docker Desktop for Mac リリースノート
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
## Docker Desktop 4.4.2
2022-01-13
@y
## Docker Desktop 4.4.2
2022-01-13
@z

@x
> Download Docker Desktop
>
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .button .primary-btn }
> [Mac with Apple
> chip](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){:
> .button .primary-btn }
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .button .primary-btn }
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){:
> .button .primary-btn }
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
@y
- [Docker Engine v20.10.12](https://docs.docker.com/engine/release-notes/#201012)
- [Compose v2.2.3](https://github.com/docker/compose/releases/tag/v2.2.3)
- [Kubernetes 1.22.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.22.5)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop displays an error if `registry.json` contains more than one organization in the `allowedOrgs` field. If you are using multiple organizations for different groups of developers, you must provision a separate `registry.json` file for each group.
- Fixed the memory statistics for containers in the Dashboard. Fixes [docker/for-mac/#4774](https://github.com/docker/for-mac/issues/6076).
- Added a deprecated option to `settings.json`: `"deprecatedCgroupv1": true`, which switches the Linux environment back to cgroups v1. If your software requires cgroups v1, you should update it to be compatible with cgroups v2. Although cgroups v1 should continue to work, it is likely that some future features will depend on cgroups v2. It is also possible that some Linux kernel bugs will only be fixed with cgroups v2.
- Fixed a regression in Compose that reverted the container name separator from `-` to `_`. Fixes [docker/compose-switch](https://github.com/docker/compose-switch/issues/24).
- Fixed an issue where putting the machine to Sleep mode after pausing Docker Desktop results in Docker Desktop not being able to resume from pause after the machine comes out of Sleep mode. Fixes [for-mac#6058](https://github.com/docker/for-mac/issues/6058).
@y
- Docker Desktop の`registry.json`においては、`allowedOrgs`項目に複数組織が含まれる場合にはエラーになります。
  異なる開発グループにおいて複数の組織を利用する場合には、各グループごとに`registry.json`ファイルを分けなければなりません。
- ダッシュボードにおいて、コンテナーに対するメモリー統計を修正しました。
  [docker/for-mac/#4774](https://github.com/docker/for-mac/issues/6076) を Fix に。
- `settings.json`に、非推奨を表すオプション`"deprecatedCgroupv1": true`を追加しました。
  開発するソフトウェアが cgroups v1 を必要としている場合は、cgroups v2 互換となるようにアップデートすることが必要です。
  cgroups v1 は今でも動作します。
  しかし将来実現される機能は cgroups v2 を利用します。
  また Linux カーネルにバグがあれば、それは cgroups v2 についてのみ修正されます。
- Compose において、コンテナー名のセパレーター`-`が`_`になってしまった不備を修正しました。
  [docker/compose-switch](https://github.com/docker/compose-switch/issues/24) を Fix に。
- Docker Desktop を一時停止させた状態でマシンがスリープモードになった場合に、マシンがスリープモードから復活した後に、Docker Desktop が一時停止から復旧できなくなる不備を修正しました。
  [for-mac#6058](https://github.com/docker/for-mac/issues/6058) を Fix に。
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- The tips of the week show on top of the mandatory login dialog when an organization restriction is enabled via a `registry.json` file.
@y
- `registry.json`ファイルを通じて組織に対する制限が有効になっている場合に、必ず実施するログイン画面において、その上段に今週のメモ (tip) が表示されます。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/72729/Docker.dmg) |
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/72729/Docker.dmg)
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/72729/Docker.dmg) |
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/72729/Docker.dmg)
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
CVE-2021-45046](https://nvd.nist.gov/vuln/detail/CVE-2021-45046).
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/72247/Docker.dmg) |
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/72247/Docker.dmg)
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/72247/Docker.dmg) |
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/72247/Docker.dmg)
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
blog post [Apache Log4j 2 CVE-2021-44228](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/){: target="_blank" rel="noopener" class="_"}.
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/71786/Docker.dmg) |
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/71786/Docker.dmg)
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/71786/Docker.dmg) |
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/71786/Docker.dmg)
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
- Docker Desktop on Apple silicon no longer requires Rosetta 2, with the exception of [three optional command line tools](../apple-silicon/#known-issues).
- Fixed an issue which prevented users from saving files from a volume using the Save As option in the Volumes UI. Fixes [docker/for-win#12407](https://github.com/docker/for-win/issues/12407).
- Fixed an issue that sometimes launched the existing version of Docker Desktop even after updating to a newer version.
- Added a self-diagnose warning if the host lacks Internet connectivity.
- Docker Desktop now uses cgroupv2. If you need to run `systemd` in a container then:
  - Ensure your version of `systemd` supports cgroupv2. [It must be at least `systemd` 247](https://github.com/systemd/systemd/issues/19760#issuecomment-851565075). Consider upgrading any `centos:7` images to `centos:8`.
  - Containers running `systemd` need the following options: [`--privileged --cgroupns=host -v /sys/fs/cgroup:/sys/fs/cgroup:rw`](https://serverfault.com/questions/1053187/systemd-fails-to-run-in-a-docker-container-when-using-cgroupv2-cgroupns-priva).
@y
- Apple silicon 上の Docker Desktop は、[ここに示す任意のコマンドラインツール](../apple-silicon/#known-issues) を除くと、Rosetta 2 を必要としなくなりました。
- ボリューム UI における Save As オプションを使った際に、ボリュームからファイル保存ができなかった問題を修正しました。
  [docker/for-win#12407](https://github.com/docker/for-win/issues/12407) を Fix に。
- Docker Desktop を新バージョンにアップデートした後に、それまでの古いバージョンが起動されてしまう場合がある問題を修正しました。
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
Docker Dashboard incorrectly displays the container memory usage as zero.
You can use the [`docker stats`](../../../engine/reference/commandline/stats.md)
command on the command line as a workaround to view the
actual memory usage. See
[docker/for-mac#6076](https://github.com/docker/for-mac/issues/6076).
@y
Docker ダッシュボードでは、コンテナーのメモリー使用量を誤ってゼロと表示することがあります。
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
- Custom RBAC rules have been removed from Docker Desktop as it gives `cluster-admin` privileges to all Service Accounts. Fixes [docker/for-mac/#4774](https://github.com/docker/for-mac/issues/4774).
@y
- 以下に示す内部 DNS 名は廃止決定となり、将来のリリースにおいて削除される予定です。
  `docker-for-desktop`, `docker-desktop`, `docker.for.mac.host.internal`, `docker.for.mac.localhost`, `docker.for.mac.gateway.internal`. You must now use `host.docker.internal`, `vm.docker.internal`, `gateway.docker.internal`
- カスタムの RBAC ルールは Docker Desktop から削除されました。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/70708/Docker.dmg) |
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/70708/Docker.dmg)
@y
> Download Docker Desktop
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/70708/Docker.dmg) |
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/70708/Docker.dmg)
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
- Fixed an issue that caused Docker Desktop to stop responding upon clicking **Exit** on the fatal error dialog.
- Fixed a rare startup failure affecting users having a `docker volume` bind-mounted on top of a directory from the host. If existing, this fix will also remove manually user added `DENY DELETE` ACL entries on the corresponding host directory.
- Fixed a bug where a `Docker.qcow2` file would be ignored on upgrade and a fresh `Docker.raw` used instead, resulting in containers and images disappearing. Note that if a system has both files (due to the previous bug) then the most recently modified file will be used, to avoid recent containers and images disappearing again. To force the use of the old `Docker.qcow2`, delete the newer `Docker.raw` file. Fixes [docker/for-mac#5998](https://github.com/docker/for-mac/issues/5998).
- Fixed a bug where subprocesses could fail unexpectedly during shutdown, triggering an unexpected fatal error popup. Fixes [docker/for-mac#5834](https://github.com/docker/for-mac/issues/5834).
@y
- 改善 ＝ 自己診断機能において、ホスト IP と`docker networks`のオーバーラップもチェックするようになりました。
- Docker ダッシュボードにおいて、アップデートの利用可能性を表すインジケーターの位置を調整しました。
- Docker Desktop において、致命的エラーダイアログ上の**Exit**（終了）ボタンをクリックした際に、
  反応しなくなってしまう不具合を修正しました。
- ホスト上のディレクトリに`docker volume`によってバインドマウントしている際に、まれに発生する起動時エラーを修正しました。
  バインドマウントが存在していた場合、ホスト上の対象ディレクトリに対して、ユーザーが`DENY DELET` ACL エントリを追加していたら、この修正により手動で削除できます。
- アップグレードにあたって`Docker.qcow2`ファイルが無視されて、代わりに新規の`Docker.raw`ファイルが用いられるというバグを修正しました。
  このバグではコンテナーやイメージが表示されなくなっていました。
  システムに（このバグによって）両方のファイルが存在している場合、更新日時の新しいファイルを用いることで、コンテナーやイメージが非表示となることを防ぎます。
  古い`Docker.qcow2`を強制的に利用したい場合は、新しい`Docker.raw`ファイルを削除してください。
  [docker/for-mac#5998](https://github.com/docker/for-mac/issues/5998) を Fix に。
- シャットダウン時にサブプロセスが予期しないエラー終了することがあるバグを修正しました。
  これが原因で、予期しないエラーポップアップ画面が表示されていました。
  [docker/for-mac#5834](https://github.com/docker/for-mac/issues/5834) を Fix に。
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
> [Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/69879/Docker.dmg) |
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/69879/Docker.dmg)
@y
> Docker Desktop のダウンロード
>
> [Intel チップの Mac](https://desktop.docker.com/mac/main/amd64/69879/Docker.dmg) |
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/69879/Docker.dmg)
@z

@x
### Bug fixes and minor changes
@y
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
> When upgrading from 4.1.0, the Docker menu does not change to **Update and restart** so you can just wait for the download to complete (icon changes) and then select **Restart**. This bug is fixed in 4.1.1, for future upgrades.
@y
> 4.1.0 にアップグレードする際に、Docker メニューの **Update and restart**（アップデートと再起動）は変化しません。
> したがってダウンロードが終了する（アイコンが変わる）まで待って、**Restart**（再起動）を選んでください。
> このバグは 4.1.1 において修正され、今後のアップグレード時には発生しません。
@z

@x
- Fixed a bug where a `Docker.qcow2` file would be ignored on upgrade and a fresh `Docker.raw` used instead, resulting in containers and images disappearing. If a system has both files (due to the previous bug), then the most recently modified file will be used to avoid recent containers and images disappearing again. To force the use of the old `Docker.qcow2`, delete the newer `Docker.raw` file. Fixes [docker/for-mac#5998](https://github.com/docker/for-mac/issues/5998).
- Fixed the update notification overlay sometimes getting out of sync between the **Settings** button and the **Software update** button in the Docker Dashboard.
- Fixed the menu entry to install a newly downloaded Docker Desktop update. When an update is ready to install, the **Restart** option changes to **Update and restart**.
@y
- アップグレードにあたって`Docker.qcow2`ファイルが無視されて、代わりに新規の`Docker.raw`ファイルが用いられるというバグを修正しました。
  このバグではコンテナーやイメージが表示されなくなっていました。
  システムに（このバグによって）両方のファイルが存在している場合、更新日時の新しいファイルを用いることで、コンテナーやイメージが非表示となることを防ぎます。
  古い`Docker.qcow2`を強制的に利用したい場合は、新しい`Docker.raw`ファイルを削除してください。
  [docker/for-mac#5998](https://github.com/docker/for-mac/issues/5998) を Fix に。
- Docker Dashboard の **Settings**（設定）ボタンと **Software update**（ソフトウェアアップデート）ボタンとの間で、アップデート通知の同期が行われなくなることがある不具合を修正しました。
- メニュー項目を修正して、最新のダウンロード済 Docker Desktop の更新をインストールできるようにしました。
  更新がインストール可能な状態になると、**Restart**（再起動）オプションは **Update and restart**（アップデートと再起動）に変わります。
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
- Docker Desktop は、小規模ビジネス向け（従業員 250 未満、かつ年間収益 1 千万ドル未満）、個人利用、教育目的、非商用のオープンソースプロジェクトに対しては、 **無償提供が継続** されます。
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
