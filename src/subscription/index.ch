%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker subscription overview
keywords: Docker, pricing, billing, Pro, Team, subscription, plans,
title: Docker subscription overview
redirect_from:
- /docker-hub/billing/
---
@y
---
description: Docker サブスクリプションの概要
keywords: Docker, pricing, billing, Pro, Team, subscription, plans,
title: Docker サブスクリプションの概要
redirect_from:
- /docker-hub/billing/
---
@z

@x
On May 14, 2020, Docker announced a new, per-seat pricing model that aligns with Docker’s [product strategy](https://www.docker.com/blog/docker-strategy-helping-devs-build-and-ship-faster/){: target="_blank" rel="noopener" class="_"} to accelerate developer workflows for cloud-native development. The previous private repository/parallel autobuild-based plans have been replaced with new **Pro** and **Team** subscriptions that include unlimited private repositories and up to 50,000 container pulls in a 24-hour period.
Starting with May 14, 2020, new customers who sign up for Docker can choose between the new Free, Pro, and Team plans.
@y
2020年5月14日に Docker は [製品戦略](https://www.docker.com/blog/docker-strategy-helping-devs-build-and-ship-faster/){: target="_blank" rel="noopener" class="_"} に連携して、新たにユーザーごとの料金体系を発表しました。
これはクラウドネイティブな開発に向けた開発ワークフローを推進するためです。
それまでのプライベートリポジトリと自動ビルドベースのプランは、**プロ**サブスクリプションと**チーム**サブスクリプションとして変更され、無制限のプライベートリポジトリを含むようになりました。
そして 24 時間以内にプルできるコンテナー数は 50,000 個までとなっています。
2020年5月14日からは、Docker にサインアップした新規ユーザーの方は、この Free、Pro、Team の各プランを選択できるようになりました。
@z

@x
Existing Docker customers who had subscribed to a paid plan before May 14, 2020 have been converted to the new Pro or Team plan after January 31, 2021.
@y
2020年5月14日以前に有料プランを購入していた Docker ユーザーは、2021年1月31日までに新たなプロプランまたはチームプランへアップグレードすることが必要です。
@z

@x
## Pricing plans
@y
{: #pricing-plans }
## 料金プラン
@z

@x
Docker offers pricing plans that are tailored for individual developers and development teams. You can also choose between an **Annual** or a **Monthly** subscription. The Pro and Team plans offered through annual subscription include a discount compared to the price of the same plan offered through monthly subscription.
@y
Docker では個人開発者向けや開発チーム向けの料金プランを用意しています。
さらに支払い方法として **Annual**（年額）か **Monthly**（月額）のサブスクリプションが選択できます。
プロプランとチームプランにおいて年額のサブスクリプションを選ぶと、同じプランで月額とした場合に比べて料金値引きがあります。
@z

@x
**For individuals:**
@y
**個人利用者向け**
@z

@x
The **Pro** plan includes unlimited public repositories, unlimited private repositories, unlimited [collaborators](../docker-hub/repos.md#collaborators-and-their-role) for public repositories, one [service account](../docker-hub/service-accounts.md) for private repositories, autobuilds with 5 parallel builds, starting at $5 per month with the annual subscription.
@y
**プロ**プランには以下が含まれます。
無制限のパブリックリポジトリ、無制限のプライベートリポジトリ、パブリックリポジトリにおける無制限の [協力者](../docker-hub/repos.md#collaborators-and-their-role)、プライベートリポジトリにおける 1 つの [サービスアカウント](../docker-hub/service-accounts.md)、5 つの同時並行ビルドによる自動ビルド。
年額のサブスクリプションは、月額 5 ドルから用意されています。
@z

@x
> **Note**
>
> Pro plans allow one service account for private repositories. For more information, see [service accounts](../docker-hub/service-accounts.md). If you already have more than one collaborator in your private repository, you’ll not be able to add any further collaborators. Any new private repository that you create will be restricted to one service account.
@y
> **メモ**
>
> プロプランでは、プライベートリポジトリに対してサービスアカウントを 1 つだけ利用可能です。
> 詳しくは [サービスアカウント](../docker-hub/service-accounts.md) を参照してください。
> プライベートリポジトリにおいてすでに複数の協力者を設定している場合は、それ以上の協力者を追加することはできません。
> 新たに生成するプライベートリポジトリでは 1 つのサービスアカウントに制限されます。
@z

@x
The **Free** plan includes unlimited public repositories and unlimited collaborators for public repositories and zero service accounts for private repositories at no cost per month.
@y
**無料**プランでは、無制限のパブリックリポジトリ、パブリックリポジトリに対する無制限の協力者が利用できますが、プライベートリポジトリにおいての協力者は利用できません。
月額は無料です。
@z

@x
**For development teams:**
@y
**開発チーム向け**
@z

@x
The **Team** plan includes unlimited public and unlimited private repositories starting at $25 per month for the first 5 users and $7 per month for each user thereafter with the annual subscription. In addition, the Team plan offers autobuilds with 15 parallel builds, advanced collaboration and management tools, including organization and team management with role-based access controls for the whole team.
@y
**チーム**プランでは、無制限のパブリックリポジトリ、無制限のプライベートリポジトリが利用できます。
5 ユーザーに対して月額 25 ドルから、また年額サブスクリプションではその後、各ユーザーに対して月額 7 ドルから用意されています。
またチームプランでは 15 個の同時並行ビルドによる自動ビルド、高度な共同および管理ツール、チーム全体に向けたロールベースのアクセス制御による組織およびチーム管理が利用できます。
@z

@x
The **Free Team** plan includes unlimited public repositories at no cost per month. This plan also offers advanced collaboration and management tools, including organization and team management with role-based access controls which are limited to 1 team and 3 team members.
@y
**無料チーム**プランでは、無制限のパブリックリポジトリが月額無料で利用できます。
このプランでは、高度な共同および管理ツールが提供され、ロールベースのアクセス制御による組織およびチーム管理を 1 チームおよび 3 チームメンバーに限って利用できます。
@z

@x
For information on how to purchase a plan, see [Upgrade your plan](../subscription/upgrade.md), or to learn more about the features available in each plan, see [Docker Pricing](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
@y
各プランにおいて利用可能な機能の詳細は、[プランのアップグレード](../subscription/upgrade.md) を参照してください。
また各プランにおいて利用可能な機能を確認するには、[Docker の料金体系](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
For frequently asked questions about pricing, see [Docker pricing FAQ](https://www.docker.com/pricing/faq){: target="_blank" rel="noopener" class="_"}.
@y
料金に関してよくたずねられる質問が [Docker の料金に関する FAQ](https://www.docker.com/pricing/faq){: target="_blank" rel="noopener" class="_"} にあります。
@z
