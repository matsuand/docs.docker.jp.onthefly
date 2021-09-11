%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Convert your Docker Hub user account into an organization
title: Convert an account into an organization
keywords: docker hub, hub, organization
---
@y
---
description: Docker Hub のユーザーアカウントを組織へ移行します。
title: アカウントから組織への移行
keywords: docker hub, hub, organization
---
@z

@x
You can convert an existing user account to an organization. You might want to do this if you need multiple users to access your account and the repositories that it’s connected to. Converting it to an organization gives you better control over permissions for these users through teams.
@y
すでにあるユーザーアカウントを組織（organization）として移行することができます。
これを行いたいと思うケースとしては、利用しているユーザーアカウントやリポジトリに、複数のユーザーがアクセスする必要がある場合です。
組織に移行すると、チームを介して各ユーザーのパーミッションを適切に管理できるようになります。
@z

@x
> **Note:**
>
> Once you convert your account to an organization, you can’t revert it to a user account, so make sure you really want to convert the user account.
@y
> **メモ**
>
> ユーザーアカウントを組織に移行してしまうと、ユーザーアカウントに戻すことはできなくなります。
> したがって本当にユーザーアカウントを移行すべきかどうかは、十分に確認してください。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Before you convert a user account to an organization, ensure that you have completed the following steps:
@y
ユーザーアカウントを組織へ移行する際には、以下の手順を行っておく必要があります。
@z

@x
1. The user account that you wish to convert must not be a member of any teams or organizations. You must remove the account from all teams and organizations.
@y
1. 移行しようとしているユーザーアカウントは、チームや組織のメンバーであってはなりません。
   所属しているチームや組織からは、そのアカウントを削除しておくことが必要です。
@z

@x
    Go to **Organizations**, select an organization from the list, and then click the Leave organization arrow next to your username in the members list.
@y
    **Organizations** のページに行き、一覧から組織を選択します。
    そしてメンバー一覧内にある目的のユーザー名において、すぐ横にある「組織から離れる」矢印をクリックします。
@z

@x
    If the user account is the sole owner of any organization, add someone to the "owners" team and then remove yourself from the organization.
@y
    そのユーザーアカウントが、いずれかの組織における唯一の所有者となっている場合は、別のユーザーアカウントを「owners」チームに加えた上で、そのユーザーアカウントを組織から削除するようにします。
@z

@x
2. You must have a separate Docker ID ready to assign it as the owner of the organization during conversion.
@y
2. まったく別の Docker ID を用意しておく必要があります。
   これを移行操作の最中に、組織の所有者として割り当てます。
@z

@x
    If you wish to convert your user account into an organization account and you do not have any other user accounts, you need to create a new user account to assign it as the owner of the new organization. This user account then becomes the first member of the "owners" team and has full administrative access to configure and manage the organization. You can add more users into the "owners" team after the conversion.
@y
    ユーザーアカウントを組織に移行するにあたって、別のユーザーアカウントを持っていないなら、新たなユーザーアカウントを生成して、それを新たな組織の所有者として割り当てる必要があります。
    これを行うと、そのユーザーアカウントは「owners」チームの最初のユーザーとして登録され、組織の設定と管理を行う管理者権限を持ちます。
    移行操作後は、別のユーザーを「owners」チームに追加できるようになります。
@z

@x
## Convert a Community account into an organization
@y
{: #convert-a-community-account-into-an-organization }
## コミュニティアカウントの組織への移行
@z

@x
1. Ensure you have removed your user account from all teams and organizations and that you have a new Docker ID before you convert an account. See the [Prerequisites](#prerequisites) section for details.
@y
1. 移行しようとしているユーザーアカウントを、それまで所属していたチームや組織から削除します。
   またアカウント移行を行うにあたって新たな Docker ID を取得していることが必要です。
   詳しくは [前提条件](#prerequisites) を参照してください。
@z

@x
2. Click on your account name in the top navigation, then go to your **Account Settings**.
@y
2. ページトップのナビゲーションにあるアカウント名をクリックします。
   そして **Account Settings** へ進みます。
@z

@x
3. Under the **Convert Account** tab, click **Convert to Organization**.
@y
3. **Convert Account** タブにおいて **Convert to Organization** をクリックします。
@z

@x
4. Carefully review the warning displayed about converting a user account. This cannot be undone and will have considerable implications for your assets and the account.
@y
4. ユーザーアカウントの移行に関して表示される警告を十分に確認します。
   移行結果を元に戻すことはできません。
   移行により、それまでの成果物やアカウントには相当の影響があります。
@z

@x
5. As part of the conversion, you must enter a **Docker ID** to set an organization owner. This is the user account that will manage the organization, and the only way to access the organization settings after conversion. You cannot use the same Docker ID as the account you are trying to convert.
@y
5. 移行処理の合間に、組織の所有者となる **Docker ID** の入力が必要です。
   このユーザーアカウントは組織を管理するものであり、移行が終了した後は、このユーザーアカウントを使わなければ組織にはアクセスできなくなります。
   この Docker ID は、ここからさらに移行を行うアカウントとして用いることはできません。
@z

@x
6. Click **Convert** to confirm. The new owner will receive a notification email. Use that owner account to log into your new organization.
@y
6. **Convert** をクリックして確認処理へ進みます。
   新たな所有者へは通知メールが届きます。
   この所有者アカウントを使って、新しい組織にログインします。
@z

@x
    Your Community account has now been converted to an organization.
@y
    コミュニティアカウントは、このようにして組織に移行されました。
@z

@x
## Convert a Docker Pro tier into an organization
@y
{: #convert-a-docker-pro-tier-into-an-organization }
## Docker Pro アカウントの組織への移行
@z

@x
>**Note:**
>
> When you convert a Docker Pro subscription to an organization, the account
will be migrated to a Team plan and will be charged $35 per month for 5 seats. For more information,
see [Docker Pricing](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
@y
>**メモ**
>
> Docker Pro アカウントから組織への移行を行う場合、このアカウントは Team プランとして移行されます。
> したがって 5 シート分に対して月額 35 ドルが課金されます。
> 詳しくは [Docker Pricing](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
1. Ensure you have removed your user account from all teams and organizations and that you have a new Docker ID before you convert an account. See the [Prerequisites](#prerequisites) section for details.
@y
1. 移行しようとしているユーザーアカウントを、それまで所属していたチームや組織から削除します。
   またアカウント移行を行うにあたって新たな Docker ID を取得していることが必要です。
   詳しくは [前提条件](#prerequisites) を参照してください。
@z

@x
2. Click on your account name in the top navigation bar, then go to your **Account Settings**.
@y
2. ページトップのナビゲーションにあるアカウント名をクリックします。
   そして **Account Settings** へ進みます。
@z

@x
3. Under the **Convert Account** tab, click **Convert to Organization**.
@y
3. **Convert Account** タブにおいて **Convert to Organization** をクリックします。
@z

@x
4. Carefully review the warning displayed about converting a user account. This cannot be undone and will have considerable implications for your assets and the account.
@y
4. ユーザーアカウントの移行に関して表示される警告を十分に確認します。
   移行結果を元に戻すことはできません。
   移行により、それまでの成果物やアカウントには相当の影響があります。
@z

@x
5. As part of the conversion, you must enter a **Docker ID** to set an organization owner. This is the user account that will manage the organization, and the only way to access the organization settings after conversion. You cannot use the same Docker ID as the account you are trying to convert.
@y
5. 移行処理の合間に、組織の所有者となる **Docker ID** の入力が必要です。
   このユーザーアカウントは組織を管理するものであり、移行が終了した後は、このユーザーアカウントを使わなければ組織にはアクセスできなくなります。
   この Docker ID は、ここからさらに移行を行うアカウントとして用いることはできません。
@z

@x
6. Click **Convert** to confirm. The new owner will receive a notification email. Use that owner account to log into your new organization.
@y
6. **Convert** をクリックして確認処理へ進みます。
   新たな所有者へは通知メールが届きます。
   この所有者アカウントを使って、新しい組織にログインします。
@z

@x
    Your Pro user account has now been converted to an organization.
@y
    Pro ユーザーアカウントは、このようにして組織に移行されました。
@z
