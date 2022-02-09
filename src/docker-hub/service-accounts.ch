%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Service accounts
keywords: Docker, service, accounts, Docker Hub
title: Service accounts
---
@y
---
description: Docker Service accounts
keywords: Docker, service, accounts, Docker Hub
title: サービスアカウント
---
@z

@x
A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and do not share Docker IDs with the members in the Team plan. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@y
サービスアカウントというのは、コンテナーイメージやコンテナー化アプリケーションの自動化管理に用いる Docker ID のことです。
サービスアカウントは普通、自動化フローにおいて用いるものであって、Team プラン内のメンバー間において共有する Docker ID ではありません。
サービスアカウントの一般的な利用例としては、Docker Hub 内容のミラーリングや、CI/CD プロセスにおけるイメージのプル操作などがあります。
@z

@x
> **Note**
>
> Service accounts included with the Team plan are limited to 5,000 pulls per day. If you require a higher number of pulls, you can purchase an Enhanced Service Account add-on.
@y
> **メモ**
>
> Team プランに含まれるサービスアカウントでは、1 日のプル数が 5,000 回に制限されています。
> これよりも多くの回数を必要とする場合は、拡張サービスアカウントアドオン (Enhanced Service Account add-on) を購入することができます。
@z

@x
## Enhanced Service Account add-on pricing
@y
{: #enhanced-service-account-add-on-pricing }
## 拡張サービスアカウントアドオンの価格
@z

@x
Refer to the following table for details on the Enhanced Service Account add-on pricing:
@y
拡張サービスアカウントアドオン (Enhanced Service Account add-on) の価格については、以下の表を参照してください。
@z

@x
| Tier | Pull Rates Per Day* | Annual Fee |
| ------ | ------ | ------ |
| 1 | 5,000-10,000 | $9,950/yr |
| 2 | 10,000-25,000 | $17,950/yr |
| 3 | 25,000-50,000 | $32,950/yr |
| 4 | 50,000-100,000 | $58,950/yr |
| 5 | 100,000+ | [Contact Sales](https://www.docker.com/pricing/questions){:target="_blank" rel="noopener" class="_"} |
@y
| 層(Tier) | 1 日のプル数* | 年額 |
| ------ | ------ | ------ |
| 1 | 5,000-10,000 | $9,950/年 |
| 2 | 10,000-25,000 | $17,950/年 |
| 3 | 25,000-50,000 | $32,950/年 |
| 4 | 50,000-100,000 | $58,950/年 |
| 5 | 100,000 以上 | [営業担当への問い合わせ](https://www.docker.com/pricing/questions){:target="_blank" rel="noopener" class="_"} |
@z

@x
<sub>*Once the initial Tier is established, that is the minimum fee for the year.  Annual commitment required.  The service account may exceed Pulls by up to 25% for up to 20 days during the year without incurring additional fees.  Reports on consumption will be provided upon request.  At the end of the initial 1-year term, the appropriate Tier will be established for the following year.<sub>
@y
<sub>*初期の層 (Tier) が構成されると、年間最低価格が発生します。
利用は年単位です。
年間において 25 % までのプル数増加、また 20 日間の延長までは、追加料金が発生せずに利用できます。
利用回数に関する報告は、求めに応じて提供されます。
当初の 1 年間の終わりには、次年度に向けて適当な層 (Tier) が構成されます。
<sub>
@z

@x
## How a pull is defined
@y
{: #how-a-pull-is-defined }
## プル 1 回はどのように定義されるか
@z

@x
- A pull request is defined as up to two `GET` requests on registry manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a single manifest request.
- A pull request for a multi-arch image makes two manifest requests.
- `HEAD` requests are not counted.
- Limits are applied based on the user doing the pull, and not based on the image being pulled or its owner.
@y
- 1 つのプルリクエストは、レジストリマニフェスト URL (`/v2/*/manifests/*`) に対する最大 2 つまでの`GET`リクエストとして定義されます。
- イメージプル 1 つは、普通は 1 つのマニフェストリクエストになります。
- マルチアーキテクチャーイメージに対するプルリクエスト 1 つは、2 つのマニフェストリクエストになります。
- `HEAD`リクエストはカウントされません。
- この制限が適用されるのはユーザーに対してです。
  つまりプルされるイメージ単位ではなく、また所有者によるプルに対してでもありません。
@z

@x
## Creating a new service account
@y
{: #creating-a-new-service-account }
## 新たなサービスアカウントの生成
@z

@x
To create a new service account for your Team account:
@y
Team アカウント向けに新たなサービスアカウントを生成するには、以下のようにします。
@z

@x
1. Create a new Docker ID.
2. Create a [team](orgs.md#create-a-team) in your organization and grant it read-only access to your private repositories.
3. Add the new Docker ID to your [organization](orgs.md).
4. Add the new Docker ID  to the [team](orgs.md#create-a-team) you created earlier.
5. Create a new [personal access token (PAT)](/access-tokens.md) from the user account and use it for CI.
@y
1. 新たな Docker ID を生成します。
2. 組織内において 1 つの [チーム](orgs.md#create-a-team) を生成します。
   そのチームにおいて、プライベートリポジトリへのアクセス権限を読み込み専用とします。
3. [組織](orgs.md) において、上で生成した Docker ID を追加します。
4. 上で生成した [チーム](orgs.md#create-a-team) に対して、その Docker ID を追加します。
5. そのユーザーアカウントから [パーソナルアカウントトークン (personal access token; PAT)](/access-tokens.md) を生成して、CI 向けにこれを利用します。
@z

@x
> **Note**
>
> If you want a read-only PAT just for your open-source repos, or to access
official images and other public images, you do not have to grant any access permissions to the new Docker ID.
@y
> **メモ**
>
> オープンソースを提供するリポジトリに対して、読み込み専用の PAT を必要とする場合、あるいは公式イメージや公開イメージへのアクセスを行う場合、上で生成した Docker ID に対して、何かのアクセス権限を付与する必要はありません。
@z

@x
## Additional information
@y
{: #additional-information }
## 追加情報
@z

@x
Refer to the following topics for additional information:
@y
追加情報として、以下のトピックを参照してください。
@z

@x
- [Mirroring Docker Hub](../registry/recipes/mirror.md)
- [Resource Consumption Updates FAQ](https://www.docker.com/pricing/resource-consumption-updates){:target="_blank" rel="noopener" class="_"}
@y
- [Docker Hub のミラーリング](../registry/recipes/mirror.md)
- [Resource Consumption Updates FAQ](https://www.docker.com/pricing/resource-consumption-updates){:target="_blank" rel="noopener" class="_"}
@z

