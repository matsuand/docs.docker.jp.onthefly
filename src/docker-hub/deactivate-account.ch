%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Deactivating an account or an organization
description: Learn how to deactivate a Docker Hub account or an organization
keywords: Docker Hub, delete, deactivate, account, organization
---
@y
---
title: アカウントや組織の無効化
description: Learn how to deactivate a Docker Hub account or an organization
keywords: Docker Hub, delete, deactivate, account, organization
---
@z

@x
Your Docker Hub account or organization may also be linked to other Docker products and services, so deactivating it will also disable access to those products and services.
@y
{% comment %}
Your Docker Hub account or organization may also be linked to other Docker products and services, so deactivating it will also disable access to those products and services.
{% endcomment %}
Docker Hub のアカウントや組織は、他の Docker 製品やサービスに関連づけられていることがあります。
アカウントや組織を無効化した場合には、そのような製品やサービスへのアクセスができなくなります。
@z

@x
## Deactivating an account
@y
{% comment %}
## Deactivating an account
{% endcomment %}
{: #deactivating-an-account }
## アカウントの無効化
@z

@x
Before deactivating your Docker Hub account, please complete the following:
@y
{% comment %}
Before deactivating your Docker Hub account, please complete the following:
{% endcomment %}
Docker Hub アカウントを無効化するためには、その前に以下を行っておく必要があります。
@z

@x
1. Download any images and tags you want to keep:
   `docker pull -a <image>:<tag>`.
@y
{% comment %}
1. Download any images and tags you want to keep:
   `docker pull -a <image>:<tag>`.
{% endcomment %}
1. 保持しておきたいイメージやタグは、`docker pull -a <image>:<tag>` によりダウンロードしておきます。
@z

@x
3. If you have an active subscription, downgrade it to the **free** plan.
@y
{% comment %}
3. If you have an active subscription, downgrade it to the **free** plan.
{% endcomment %}
3. アクティブなサブスクリプションがある場合は、**無償** プランにダウングレードします。
@z

@x
      In Docker Hub, navigate to **_Your Account_** > **Account Settings** > **Billing**.
@y
      {% comment %}
      In Docker Hub, navigate to **_Your Account_** > **Account Settings** > **Billing**.
      {% endcomment %}
      Docker Hub において **＜アカウント名＞** > **Account Settings** > **Billing** にアクセスして操作します。
@z

@x
4. If you have an enterprise license, download the key.
@y
{% comment %}
4. If you have an enterprise license, download the key.
{% endcomment %}
4. エンタープライズライセンスを持っている場合は、キーをダウンロードしておきます。
@z

@x
      In Docker Hub, navigate to **_Your Account_** > **Accounts Settings** > **Licenses**. The download link will no longer be available after your account is disabled.
@y
      {% comment %}
      In Docker Hub, navigate to **_Your Account_** > **Accounts Settings** > **Licenses**. The download link will no longer be available after your account is disabled.
      {% endcomment %}
      Docker Hub において **＜アカウント名＞** > **Accounts Settings** > **Licenses** にアクセスします。
      アカウントを無効にした後には、ダウンロードリンクが表示されなくなります。
@z

@x
5. If you belong to any organizations, remove your account from all of them.
@y
{% comment %}
5. If you belong to any organizations, remove your account from all of them.
{% endcomment %}
5. どこかの組織に属している場合は、いずれの組織からもアカウントを削除します。
@z

@x
6. If you are the sole owner of any organization, either add someone to the **owners** team and then remove yourself from the organization, or deactivate the organization as well.
@y
{% comment %}
6. If you are the sole owner of any organization, either add someone to the **owners** team and then remove yourself from the organization, or deactivate the organization as well.
{% endcomment %}
6. アカウントが、いずれかの組織における唯一の所有者となっている場合は、別のユーザーアカウントを「owners」チームに加えた上で、そのアカウントを組織から削除するようにします。
   あるいは組織そのものを無効化します。
@z

@x
7. Unlink your [Github and Bitbucket accounts](https://docs.docker.com/docker-hub/builds/link-source/#unlink-a-github-user-account).
@y
{% comment %}
7. Unlink your [Github and Bitbucket accounts](https://docs.docker.com/docker-hub/builds/link-source/#unlink-a-github-user-account).
{% endcomment %}
7. [Github and Bitbucket accounts](https://docs.docker.com/docker-hub/builds/link-source/#unlink-a-github-user-account) をアンリンクします。
@z

@x
Once you have completed all the steps above, you may deactivate your account. On Docker Hub, go to **_Your Account_** > **Accounts Settings** > **Deactivate Account**.
@y
{% comment %}
Once you have completed all the steps above, you may deactivate your account. On Docker Hub, go to **_Your Account_** > **Accounts Settings** > **Deactivate Account**.
{% endcomment %}
以上の手順をすべて済ませたら、アカウントの無効化が可能です。
Docker Hub において **＜アカウント名＞** > **Accounts Settings** > **Deactivate Account** にアクセスします。
@z

@x
> This cannot be undone! Be sure you've gathered all the data you need from your account before deactivating it.
{: .warning }
@y
{% comment %}
> This cannot be undone! Be sure you've gathered all the data you need from your account before deactivating it.
{: .warning }
{% endcomment %}
> これは元に戻すことのできない操作です！
> アカウントの無効化を行う前に、必要となるデータはすべて入手できていることを確認してください。
{: .warning }
@z

@x
## Deactivating an organization
@y
{% comment %}
## Deactivating an organization
{% endcomment %}
{: #deactivating-an-organization }
## 組織の無効化
@z

@x
Before deactivating an organization, please complete the following:
@y
{% comment %}
Before deactivating an organization, please complete the following:
{% endcomment %}
組織（organization）を無効化するためには、その前に以下を行っておく必要があります。
@z

@x
1. Download any images and tags you want to keep:
  `docker pull -a <image>:<tag>`.
@y
{% comment %}
1. Download any images and tags you want to keep:
  `docker pull -a <image>:<tag>`.
{% endcomment %}
1. 保持しておきたいイメージやタグは、`docker pull -a <image>:<tag>` によりダウンロードしておきます。
@z

@x
2. If you have an active subscription, downgrade it to the **free** plan:
@y
{% comment %}
2. If you have an active subscription, downgrade it to the **free** plan:
{% endcomment %}
2. アクティブなサブスクリプションがある場合は、**無償** プランにダウングレードします。
@z

@x
      In Docker Hub, navigate to **Organizations** > **_Your Organization_** > **Billing**.
@y
      {% comment %}
      In Docker Hub, navigate to **Organizations** > **_Your Organization_** > **Billing**.
      {% endcomment %}
      Docker Hub において **Organizations** > **＜組織名＞** > **Billing** にアクセスして操作します。
@z

@x
3. Remove all other members, including those in the **Owners** team, within the organization.
@y
{% comment %}
3. Remove all other members, including those in the **Owners** team, within the organization.
{% endcomment %}
3. 他のメンバーはすべて削除します。
   組織内の **Owners** チームのメンバーも同様です。
@z

@x
4. Unlink your [Github and Bitbucket accounts](https://docs.docker.com/docker-hub/builds/link-source/#unlink-a-github-user-account).
@y
{% comment %}
4. Unlink your [Github and Bitbucket accounts](https://docs.docker.com/docker-hub/builds/link-source/#unlink-a-github-user-account).
{% endcomment %}
4. [Github and Bitbucket accounts](https://docs.docker.com/docker-hub/builds/link-source/#unlink-a-github-user-account) をアンリンクします。
@z

@x
Once you have completed all the steps above, you may deactivate your organization. On Docker Hub, go to **Organizations** > **_Your Organization_** > **Settings** > **Deactivate Org**.
@y
{% comment %}
Once you have completed all the steps above, you may deactivate your organization. On Docker Hub, go to **Organizations** > **_Your Organization_** > **Settings** > **Deactivate Org**.
{% endcomment %}
以上の手順をすべて済ませたら、組織の無効化が可能です。
Docker Hub において **Organizations** > **＜組織名＞** > **Deactivate Org** にアクセスします。
@z

@x
> This cannot be undone! Be sure you've gathered all the data you need from your organization before deactivating it.
{: .warning }
@y
{% comment %}
> This cannot be undone! Be sure you've gathered all the data you need from your organization before deactivating it.
{: .warning }
{% endcomment %}
> これは元に戻すことのできない操作です！
> 組織の無効化を行う前に、必要となるデータはすべて入手できていることを確認してください。
{: .warning }
@z
