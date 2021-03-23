%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Billing overview
keywords: Docker, pricing, billing, Pro, Team, subscription, plans,
title: Docker Billing overview
---
@y
---
description: Docker Billing overview
keywords: Docker, pricing, billing, Pro, Team, subscription, plans,
title: Docker 有料プランの概要
---
@z

@x
On May 14, 2020, Docker announced a new, per-seat pricing model that aligns with Docker’s [product strategy](https://www.docker.com/blog/docker-strategy-helping-devs-build-and-ship-faster/){: target="_blank" rel="noopener" class="_"} to accelerate developer workflows for cloud-native development. The previous private repository/parallel autobuild-based plans have been replaced with new **Pro** and **Team** subscriptions that include unlimited private repositories and up to 50,000 container pulls in a 24-hour period.
@y
2020年5月14日に Docker は [製品戦略](https://www.docker.com/blog/docker-strategy-helping-devs-build-and-ship-faster/){: target="_blank" rel="noopener" class="_"} に連携して、新たにユーザーごとの料金体系を発表しました。
これはクラウドネイティブな開発に向けた開発ワークフローを推進するためです。
それまでのプライベートリポジトリと自動ビルドベースのプランは、**プロ**サブスクリプションと**チーム**サブスクリプションとして変更され、無制限のプライベートリポジトリを含むようになりました。
そして 24 時間以内にプルできるコンテナー数は 50,000 個までとなっています。
@z

@x
Existing Docker customers subscribed to a paid plan before May 14, 2020 must upgrade to the new Pro or Team plan by January 31, 2021. Starting with May 14, 2020, new customers who sign up for Docker can choose between the new Free, Pro, and Team plans.
@y
2020年5月14日以前に有料プランを購入していた Docker ユーザーは、2021年1月31日までに新たなプロプランまたはチームプランへアップグレードすることが必要です。
2020年5月14日以降、Docker にサインアップした新規ユーザーは、新たな無料プラン、プロプラン、チームプランを選択できるようになっています。
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
The **Pro** plan includes unlimited public repositories, unlimited private repositories, unlimited [collaborators](../repos.md#collaborators-and-their-role) for public repositories, one [service account](../repos.md#service-accounts) for private repositories, and 2 parallel builds, starting at $5 per month with the annual subscription.
@y
**プロ**プランには以下が含まれます。
無制限のパブリックリポジトリ、無制限のプライベートリポジトリ、パブリックリポジトリにおける無制限の [協力者](../repos.md#collaborators-and-their-role)、プライベートリポジトリにおける 1 つの [サービスアカウント](../repos.md#service-accounts)、2 つの同時並行ビルド。
年額のサブスクリプションは、月額 5 ドルから用意されています。
@z

@x
> **Note**
>
> Pro plans allow one service account for private repositories. For more information, see [service accounts](../repos.md#service-accounts). If you already have more than one collaborator in your private repository, you’ll not be able to add any further collaborators. Any new private repository that you create will be restricted to one service account.
@y
> **メモ**
>
> プロプランでは、プライベートリポジトリに対してサービスアカウントを 1 つだけ利用可能です。
> 詳しくは [サービスアカウント](../repos.md#service-accounts) を参照してください。
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
The **Team** plan includes unlimited public and unlimited private repositories starting at $25 per month for the first 5 users and $7 per month for each user thereafter with the annual subscription. In addition, the Team plan offers 3 parallel builds, advanced collaboration and management tools, including organization and team management with role-based access controls for the whole team.
@y
**チーム**プランでは、無制限のパブリックリポジトリ、無制限のプライベートリポジトリが利用できます。
5 ユーザーに対して月額 25 ドルから、また年額サブスクリプションではその後、各ユーザーに対して月額 7 ドルから用意されています。
またチームプランでは 3 つの同時並行ビルド、高度な共同および管理ツール、チーム全体に向けたロールベースのアクセス制御による組織およびチーム管理が利用できます。
@z

@x
The **Free Team** plan includes unlimited public repositories at no cost per month. This plan also offers advanced collaboration and management tools, including organization and team management with role-based access controls which are limited to 1 team and 3 team members.
@y
**無料チーム**プランでは、無制限のパブリックリポジトリが月額無料で利用できます。
このプランでは、高度な共同および管理ツールが提供され、ロールベースのアクセス制御による組織およびチーム管理を 1 チームおよび 3 チームメンバーに限って利用できます。
@z

@x
For detailed information about the features available in each plan, see [Docker Pricing](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
@y
各プランにおいて利用可能な機能の詳細は [Docker の料金体系](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
For frequently asked questions about pricing, see [Docker pricing FAQ](https://www.docker.com/pricing/faq){: target="_blank" rel="noopener" class="_"}.
@y
料金に関してよくたずねられる質問が [Docker の料金に関する FAQ](https://www.docker.com/pricing/faq){: target="_blank" rel="noopener" class="_"} にあります。
@z

@x
### Purchase a Pro plan
@y
{: #purchase-a-pro-plan }
### プロプランの購入
@z

@x
The following section contains information on how to purchase a Pro plan for new customers. If you are already subscribed to a legacy plan and would like to upgrade to Pro, see [Upgrade to Pro from a legacy plan](upgrade.md#upgrade-to-a-pro-plan).
@y
この節では、プロプランを新たに購入する方法について説明します。
すでに従来のプランを購入していて、そこからプロプランにアップグレードしたい場合は [従来プランからプロプランへのアップグレード](upgrade.md#upgrade-to-a-pro-plan) を参照してください。
@z

@x
To purchase a Pro plan:
@y
プロプランの購入は以下のようにします。
@z

@x
1. Log into your [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} account.
@y
1. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} アカウントでログインします。
@z

@x
2. The Docker Hub **Pricing** page displays information about the new pricing plans.
@y
2. Docker Hub の **Pricing**（料金）ページにて、新たな料金プランの情報を確認します。
@z

@x
3. Review the plan details in the **Pro** section and click **Buy Now**.
@y
3. **Pro** セクションにあるプランの詳細を確認して **Buy Now**（今すぐ購入）をクリックします。
@z

@x
4. The **Payment Method** page displays the cost for the annual plan by default. If you prefer to opt for the monthly plan, choose **pay monthly**.
@y
4. **Payment Method**（支払い方法）のページにおいて、デフォルトの年額プランの料金を確認します。
   月額でよければ **pay monthly**（月払い）を選択します。
@z

@x
5. Enter the card details and click **Purchase**.
@y
5. カード情報を入力して **Purchase**（購入）をクリックします。
@z

@x
6. Verify your email address.
@y
6. メールアドレスを確認します。
@z

@x
7. Open the drop-down menu next to your username in the top-right corner and select **Billing**.
@y
7. 画面右上のユーザー名の隣りにあるドロップダウンメニューを開いて、**Billing**（請求）を選びます。
@z

@x
    The **Billing** page displays information about your new Pro plan and the total cost.
@y
    Billing ページには、新たなプロプランとその支払い合計額が表示されています。
@z

@x
### Purchase a Team plan
@y
{: #purchase-a-team-plan }
### チームプランの購入
@z

@x
The following section contains information on how to purchase a Team plan for new organizations. If you are already subscribed to a legacy plan and would like to upgrade to the Team plan, see [Upgrade to Team from a legacy plan](upgrade.md#upgrade-to-a-team-plan).
@y
この節では、新たな組織に対してチームプランを購入する方法について説明します。
すでに従来のプランを購入していて、そこからチームプランにアップグレードしたい場合は [従来プランからチームプランへのアップグレード](upgrade.md#upgrade-to-a-team-plan) を参照してください。
@z

@x
To purchase a Team plan:
@y
チームプランの購入は以下のようにします。
@z

@x
1. Log into your [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} account.
@y
1. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} アカウントにログインします。
@z

@x
2. The Docker Hub **Pricing** page displays information about the new pricing plans.
@y
2. Docker Hub の **Pricing**（料金）ページにて、新たな料金プランの情報を確認します。
@z

@x
3. Review the plan details in the **Team** section and click **Buy Now**.
@y
3. **Team** セクションにあるプランの詳細を確認して **Buy Now**（今すぐ購入）をクリックします。
@z

@x
4. Enter a name for your new organization and add a company name.
@y
4. 新たな組織名と会社名を入力します。
@z

@x
5. The **Organization size** page displays the cost for the annual plan by default. If you prefer to change this, select **Pay Monthly**.
@y
5. **Organization size**（組織のサイズ）ページにて、 デフォルトの年額プランの料金を確認します。
   これでよければ **Pay Monthly**（月払い）を実行します。
@z

@x
6. Specify the number of users you’d like to add to your organization and click **Continue to Payment**.
@y
6. 組織に加えるユーザー数を指定して **Continue to Payment**（購入操作を続ける）をクリックします。
@z

@x
6. On the **Payment Method** page, enter the card details and click **Purchase**.
@y
6. **Payment Method**（支払い方法）のページにおいて、カード情報を入力して **Purchase**（購入）をクリックします。
@z

@x
7. Verify your email address.
@y
7. メールアドレスを確認します。
@z

@x
8. Navigate to Organizations from the menu at the top of the page, choose your organization, and select **Billing**. The Billing tab displays information about your new Team plan and the total cost.
@y
8. ページ上段にあるメニューから Organizations にアクセスし、自身の組織を選びます。
   そして **Billing**（請求）を選択します。
   Billing タブには、新たなチームプランとその支払い合計額が表示されています。
@z

@x
## Update billing information
@y
{: #update-billing-information }
## 請求情報の更新
@z

@x
> **Note**
>
> You must be on owner of the organization to make changes to the billing information.
@y
> **メモ**
>
> 請求情報の更新を行うには、組織の所有者でなければなりません。
@z

@x
To update the billing information for your organization:
@y
組織の請求情報を更新するには以下を行います。
@z

@x
1. Log into an owner account for the organization in [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
@y
1. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} において組織の所有者アカウントでログインします。
@z

@x
2. Select **Organizations** from the menu at the top of the page. This displays a list of organizations.
@y
2. ページ上段にあるメニューから **Organizations**（組織）を選びます。
   組織の一覧が表示されます。
@z

@x
3. Choose the organization from the list and select the **Billing** tab.
@y
3. 一覧の中から組織を選び、**Billing**（請求）タブを選びます。
@z

@x
4. Select **Payment Methods**.
@y
4. **Payment Methods**（支払い方法）を選びます。
@z

@x
5. The **Payment Information** page displays your existing billing information and allows you to edit the details.
@y
5. **Payment Information**（支払い情報）のページには現在の請求情報が示され、詳細を変更することができます。
@z

@x
    > **Note**
    >
    > The details displayed in the **Contact Information** section is used to generate your invoice. All billing-related information is sent to the email address listed in this section.
@y
    > **メモ**
    >
    > **Contact Information**（連絡先情報）のセクションに示されている詳細は、請求書の生成に利用されます。
    > 請求に関連するお知らせは、すべて本セクションに示されているメールアドレス宛てに送信されます。
@z

@x
6. Change the details as required and then click **Update** to save your changes.
@y
6. 必要に応じて詳細を変更し、**Update**（更新）をクリックして変更内容を保存します。
@z

@x
To update the billing information for your user account:
@y
ユーザーアカウントの請求情報を更新するには以下を行います。
@z

@x
1. Log into your [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} account.
@y
1. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} アカウントによりログインします。
@z

@x
2. Open the drop-down menu next to your username in the top-right corner and select **Billing**. The Billing page displays billing information about your existing user account.
@y
2. 右上のユーザー名の横にあるドロップダウンメニューを開いて **Billing**（請求）を選びます。
   請求のページには、現ユーザーアカウントに対する請求情報が示されています。
@z

@x
3. Select **Payment Methods**.
@y
3. **Payment Methods**（支払い方法）を選択します。
@z

@x
4. The **Payment Information** page displays your existing billing information and allows you to edit the details.
@y
4. **Payment Information**（支払い情報）のページには現在の請求情報が示され、詳細を変更することができます。
@z

@x
5. Click **Update** to save your changes.
@y
5. **Update**（更新）をクリックして変更を保存します。
@z
