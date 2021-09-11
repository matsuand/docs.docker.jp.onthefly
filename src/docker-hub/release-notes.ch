%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Hub release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Hub
keywords: docker hub, whats new, release notes
toc_min: 1
toc_max: 2
---
@y
---
title: Docker Hub リリースノート
description: Learn about the new features, bug fixes, and breaking changes for Docker Hub
keywords: docker hub, whats new, release notes
toc_min: 1
toc_max: 2
---
@z

@x
Here you can learn about the latest changes, new features, bug fixes, and
known issues for each Docker Hub release.
@y
ここでは Docker Hub リリースごとに、最新の変更、新機能、バグフィックス、既知の問題を示しています。
@z

@x
## 2021-08-31
@y
## 2021-08-31
@z

@x
### New
@y
### New
@z

@x
Docker has [announced](https://www.docker.com/blog/updating-product-subscriptions/){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"} updates and extensions to the product subscriptions to increase productivity, collaboration, and added security for our developers and businesses. Docker subscription tiers now include Personal, Pro, Team, and Business.
@y
Docker has [announced](https://www.docker.com/blog/updating-product-subscriptions/){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"} updates and extensions to the product subscriptions to increase productivity, collaboration, and added security for our developers and businesses. Docker subscription tiers now include Personal, Pro, Team, and Business.
@z

@x
The updated [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) includes a change to the terms for **Docker Desktop**.
@y
The updated [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) includes a change to the terms for **Docker Desktop**.
@z

@x
- Docker Desktop **remains free** for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
- It requires a paid subscription (**Pro, Team, or Business**), for as little as $5 a month, for professional use in larger enterprises.
- The effective date of these terms is August 31, 2021. There is a grace period until January 31, 2022 for those that will require a paid subscription to use Docker Desktop.
- The Docker Pro and Docker Team subscriptions now **include commercial use** of Docker Desktop.
- The existing Docker Free subscription has been renamed **Docker Personal**.
- **No changes** to Docker Engine or any other upstream **open source** Docker or Moby project.
@y
- Docker Desktop **remains free** for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
- It requires a paid subscription (**Pro, Team, or Business**), for as little as $5 a month, for professional use in larger enterprises.
- The effective date of these terms is August 31, 2021. There is a grace period until January 31, 2022 for those that will require a paid subscription to use Docker Desktop.
- The Docker Pro and Docker Team subscriptions now **include commercial use** of Docker Desktop.
- The existing Docker Free subscription has been renamed **Docker Personal**.
- **No changes** to Docker Engine or any other upstream **open source** Docker or Moby project.
@z

@x
    To understand how these changes affect you, read the [FAQs](https://www.docker.com/pricing/faq){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"}. For more information, see [Docker subscription overview](../subscription/index.md).
@y
    To understand how these changes affect you, read the [FAQs](https://www.docker.com/pricing/faq){: target="*blank" rel="noopener" class="*" id="dkr_docs_relnotes_btl"}. For more information, see [Docker subscription overview](../subscription/index.md).
@z

@x
## 2021-05-05
@y
## 2021-05-05
@z

@x
### Enhancement
@y
{: #enhancement }
### 拡張
@z

@x
When managing the content of your repositories, you can now filter the results based on the currentness of the tags and more easily identify your untagged images.
For more information, see  [Advanced Management Dashboard](/image-management.md).
@y
リポジトリ内容を管理するにあたって、最新タグに基づいた検索や、タグなしイメージを容易に識別できるようにしました。詳しくは [拡張イメージ管理ダッシュボード](/image-management.md) を参照してください。
@z

@x
For Docker Hub API documentation, see [Docker Hub API Reference](../api/latest/#operation/GetNamespacesRepositoriesImages).
@y
Docker Hub API については、[Docker Hub API リファレンス]({{ site.baseurl }}/docker-hub/api/latest/#operation/GetNamespacesRepositoriesImages) を参照してください。
@z

@x
## 2021-04-13
@y
## 2021-04-13
@z

@x
### Enhancement
@y
{: #enhancement }
### 拡張
@z

@x
The **Billing Details** page now shows any organizations you own, in addition to your personal account. This allows you to clearly identify the billing details of your chosen namespace, and enables you to switch between your personal and your organization accounts to view or update the details.
@y
**Billing Details**（請求詳細）ページでは、個人アカウントに加えて所有する組織すべてを表示するようにしました。
これにより、選択したアカウントにおける請求詳細を詳しく確認することができます。
また個人アカウントと組織アカウントを切り替えて、詳細内容を更新し確認することができます。
@z

@x
## 2021-04-09
@y
## 2021-04-09
@z

@x
### Enhancement
@y
{: #enhancement }
### 拡張
@z

@x
You can now specify any email address to receive billing-related emails for your organization. The email address doesn't have to be associated with an organization owner account. You must be an owner of the organization to update any billing details.
@y
組織に関して請求関連の通知メールを、どのようなメールアドレスであっても受信できるようになりました。
その電子メールは、組織の所有アカウントに関連づいている必要はありません。
なお請求詳細を更新するには、その組織の所有者でなければなりません。
@z

@x
To change the email address receiving billing-related emails, log into Docker Hub and navigate to the **Billing** tab of your organization. Select **Payment Methods** > **Contact Information**. Enter the new email address that you'd like to use in the **Email** field. Click **Update** for the changes to take effect.
@y
請求関連の通知メールを受信するメールアドレスを変更するには、Docker Hub にログインして組織の **Billing**（請求）タブにアクセスします。
そして **Payment Methods** > **Contact Information** を選びます。
設定したい新たなメールアドレスを **Email** 欄に入力します。
**Update** をクリックして変更を確定します。
@z

@x
For details on how to update your billing information, see [Update billing information](../subscription/index.md#update-billing-information).
@y
請求情報の更新方法については [請求情報の更新](../subscription/index.md#update-billing-information) を参照してください。
@z

@x
## 2021-03-22
@y
## 2021-03-22
@z

@x
### New feature
@y
{: #new-feature }
### 新機能
@z

@x
**Advanced Image Management dashboard**
@y
**拡張イメージ管理ダッシュボード**
@z

@x
Docker introduces the Advanced Image Management dashboard that enables you to view and manage Docker images in your repositories. For more information, see [Advanced Image Management dashboard](/image-management.md).
@y
拡張イメージ管理ダッシュボード（Advanced Image Management dashboard）が導入されました。
これにより複数リポジトリ内の Docker イメージを参照、管理できるようになりました。
詳しくは [拡張イメージ管理ダッシュボード](/image-management.md) を参照してください。
@z

@x
## 2021-01-25
@y
## 2021-01-25
@z

@x
### New feature
@y
{: #new-feature }
### 新機能
@z

@x
Docker introduces Audit log, a new feature that allows team owners to view a list of activities that occur at organization and repository levels. This feature begins tracking the activities from the release date, that is, **from 25 January 2021**.
@y
監査（audit）ログが導入されました。
これは組織やリポジトリレベルで発生するアクティビティーの一覧を、チーム所有者が確認できる新機能です。
この機能はリリース日付、つまり **2021年1月25日** からのアクティビティーを監視します。
@z

@x
For more information about this feature and for instructions on how to use it, see [Audit log](audit-log.md).
@y
この機能や利用方法に関する詳細は [監査ログ](audit-log.md) を参照してください。
@z

@x
## 2020-11-10
@y
## 2020-11-10
@z

@x
### New feature
@y
{: #new-feature }
### 新機能
@z

@x
The **Repositories** view now shows which images have gone stale because they haven't been 
pulled or pushed recently. For more information, see [repository tags](repos.md/#viewing-repository-tags).
@y
**Repositories**（リポジトリ）画面では、プルやプッシュが行われずに古い扱いとなったイメージがどれであるかを確認できるようになりました。
詳しくは [リポジトリタグ](repos.md/#viewing-repository-tags) を参照してください。
@z

@x
# 2020-10-07
@y
# 2020-10-07
@z

@x
### New feature
@y
{: #new-feature }
### 新機能
@z

@x
Docker introduces Hub Vulnerability Scanning which enables you to automatically scan Docker images for vulnerabilities using Snyk. For more information, see [Hub Vulnerability Scanning](vulnerability-scanning.md).
@y
Docker Hub においてぜい弱性スキャン機能が導入されました。
Synk を利用して Docker イメージのぜい弱性スキャンが自動的に行われます。
詳しくは [ぜい弱性スキャン](vulnerability-scanning.md) を参照してください。
@z

@x
## 2020-05-14
@y
## 2020-05-14
@z

@x
### New features
@y
{: #new-features }
### 新機能
@z

@x
* Docker has announced a new, per-seat pricing model to accelerate developer workflows for cloud-native development. The previous private repository/concurrent autobuild-based plans have been replaced with new **Pro** and **Team** plans that include unlimited private repositories. For more information, see [Docker subscription](../subscription/index.md).
@y
* Docker は新たにユーザーごとの料金体系を発表し、クラウドネイティブな開発に向けた開発ワークフローを推進するものとしました。
  それまでのプライベートリポジトリと同時自動ビルドベースのプランは、**プロ**サブスクリプションと**チーム**サブスクリプションとして変更され、無制限のプライベートリポジトリを含むようになりました。
  詳しくは [Docker サブスクリプション](../subscription/index.md) を参照してください。
@z

@x
* Docker has enabled download rate limits for downloads and pull requests on Docker Hub. This caps the number of objects that users can download within a specified timeframe. For more information, see [Download rate limit](download-rate-limit.md).
@y
* Docker では Docker Hub でのダウンロードやプルリクエストに対して、ダウンロードレート制限を設定しています。
  これによりユーザーが指定する時間枠内において、ダウンロードできるオブジェクトの数が制限されます。 
  詳しくは [ダウンロードレート制限](download-rate-limit.md) を参照してください。
@z

@x
## 2019-11-04
@y
## 2019-11-04
@z

@x
### Enhancements
@y
{: #enhancements }
### 拡張
@z

@x
* The [repositories page](https://docs.docker.com/docker-hub/repos/) and all
related settings and tabs have been updated and moved from `cloud.docker.com`
to `hub.docker.com`. You can access the page at its new URL: [https://hub.docker.com/repositories](https://hub.docker.com/repositories). 
@y
* [リポジトリのページ]({{ site.baseurl }}/docker-hub/repos/) と関連する設定やタブは、内容を更新し`cloud.docker.com`から`hub.docker.com`に移転しました。
新たなページは URL [https://hub.docker.com/repositories](https://hub.docker.com/repositories) からアクセスできます。
@z

@x
### Known Issues
@y
{: #kKnown-issues }
### 既知の問題
@z

@x
* Scan results don't appear for some official images.
@y
* 公式イメージにおいて、スキャン結果が表示されないものがあります。
@z

@x
## 2019-10-21
@y
## 2019-10-21
@z

@x
### New features
@y
{: #new-features }
### 新機能
@z

@x
* **Beta:** Docker Hub now supports [two-factor authentication (2FA)](/docker-hub/2fa). Enable it in your account settings, under the **[Security](https://hub.docker.com/settings/security)** section.
@y
* **ベータ機能** ＝ Docker Hub では [２要素認証（two-factor authentication; 2FA)]({{ site.baseurl }}/docker-hub/2fa) に対応しました。これを有効にするには、アカウント設定画面の **[Security](https://hub.docker.com/settings/security)** セクションのもとで行います。
@z

@x
    > If you lose both your 2FA authentication device and recovery code, you may
    > not be able to recover your account.
    {: .important }
@y
    > 2FA の認証デバイスとリカバリーコードを忘れてしまった場合、アカウントを復旧することができなくなります。
    {: .important }
@z

@x
### Enhancements
@y
{: #enhancements }
### 拡張
@z

@x
* As a security measure, when two-factor authentication is enabled, the Docker CLI requires a personal access token instead of a password to log in.
@y
* ２要素認証を有効にした場合は、セキュリティ対策として Docker CLI でのログイン時に、パスワードではなく個人用アクセストークンを要求します。
@z

@x
### Known Issues
@y
{: #kKnown-issues }
### 既知の問題
@z

@x
* Scan results don't appear for some official images.
@y
* 公式イメージにおいて、スキャン結果が表示されないものがあります。
@z

@x
## 2019-10-02
@y
## 2019-10-02
@z

@x
### Enhancements
@y
{: #enhancements }
### 拡張
@z

@x
* You can now manage teams and members straight from your [organization page](https://hub.docker.com/orgs).
Each organization page now breaks down into these tabs:
  * **New:** Members - manage your members directly from this page (delete,
  add, or open their teams)
  * **New:** Teams - search by team or username, and open up any team page to
  manage the team
  * **New:** Invitees (conditional tab, only if an invite exists) - resend or
  remove invitiations from this tab
  * Repositories
  * Settings
  * Billing
@y
* チームとメンバーは [組織のページ](https://hub.docker.com/orgs) から直接管理できるようになりました。
  各組織ページでは以下のタブが表示されます。
  * **新規** Members ＝ このページからメンバーを直接管理します（チームからの削除、追加、チーム参照）。
  * **新規** Teams ＝ チームやユーザー名の検索やチーム管理を行うページへの遷移。
  * **新規** Invitees（invite 存在時のみ表示）＝ 本タブから招待の再送信、削除を行います。
  * Repositories
  * Settings
  * Billing
@z

@x
### Bug fixes
@y
{: #bug-fixes }
### バグフィックス
@z

@x
* Fixed an issue where Kinematic could not connect and log in to Docker Hub.
@y
* kinematic が Docker Hub へ接続およびログインできなかった問題を修正しました。
@z

@x
### Known Issues
@y
{: #kKnown-issues }
### 既知の問題
@z

@x
* Scan results don't appear for some official images.
@y
* 公式イメージにおいて、スキャン結果が表示されないものがあります。
@z

@x
## 2019-09-19
@y
## 2019-09-19
@z

@x
### New features
@y
{: #new-features }
### 新機能
@z

@x
* You can now [create personal access tokens](access-tokens.md) in Docker Hub and use them to authenticate from the Docker CLI. Find them in your account settings, under the new **[Security](https://hub.docker.com/settings/security)** section.
@y
* Docker Hub において [個人用アクセストークンの生成](access-tokens.md) が可能になり、これを用いて Docker CLI において認証ができるようになりました。
  これを有効にするには、アカウント設定画面に新たに設けられた **[Security](https://hub.docker.com/settings/security)** セクションにおいて行います。
@z

@x
### Known Issues
@y
{: #kKnown-issues }
### 既知の問題
@z

@x
* Scan results don't appear for some official images.
@y
* 公式イメージにおいて、スキャン結果が表示されないものがあります。
@z

@x
## 2019-09-16
@y
## 2019-09-16
@z

@x
### Enhancements
@y
{: #enhancements }
### 拡張
@z

@x
* The [billing page](../subscription/upgrade.md) for personal accounts has been updated. You can access the page at its new URL: [https://hub.docker.com/billing/plan](https://hub.docker.com/billing/plan).
@y
* The [料金体系のページ](../subscription/upgrade.md) における個人アカウントの説明を更新しました。
  そのページは新たな URL [https://hub.docker.com/billing/plan](https://hub.docker.com/billing/plan) からアクセスできます。
@z

@x
### Known Issues
@y
{: #kKnown-issues }
### 既知の問題
@z

@x
* Scan results don't appear for some official images.
@y
* 公式イメージにおいて、スキャン結果が表示されないものがあります。
@z

@x
## 2019-09-05
@y
## 2019-09-05
@z

@x
### Enhancements
@y
{: #enhancements }
### 拡張
@z

@x
* The `Tags` tab on an image page now provides additional information for each tag:
  * A list of digests associated with the tag
  * The architecture it was built on
  * The OS
  * The user who most recently updated an image for a specific tag
* The security scan summary for [official images](https://docs.docker.com/docker-hub/official_images/)
has been updated.
@y
* イメージページの`Tags`タブにおいて、各タグにさらなる情報を提供するようにしました。
  * タグに関連するダイジェスト値一覧。
  * イメージがビルド対象としているアーキテクチャー。
  * OS。
  * 特定のタグに対して、イメージ更新を行った最終ユーザー。
* [公式イメージ]({{ site.baseurl }}/docker-hub/official_images/) に対するセキュリティスキャン概要を更新しました。
@z

@x
### Known Issues
@y
{: #kKnown-issues }
### 既知の問題
@z

@x
* Scan results don't appear for some official images.
@y
* 公式イメージにおいて、スキャン結果が表示されないものがあります。
@z
