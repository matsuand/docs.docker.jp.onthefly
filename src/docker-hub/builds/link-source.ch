%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Link to GitHub and BitBucket
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, trusted, builds, trusted builds, automated builds, GitHub
title: Configure automated builds from GitHub and BitBucket
redirect_from:
- /docker-hub/github/
- /docker-hub/bitbucket/
- /docker-cloud/builds/link-source/
---
@y
---
description: GitHub や BitBucket へのリンク。
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, trusted, builds, trusted builds, automated builds, GitHub
title: GitHub や BitBucket からの自動ビルド設定
redirect_from:
- /docker-hub/github/
- /docker-hub/bitbucket/
- /docker-cloud/builds/link-source/
---
@z

@x
{% include upgrade-cta.html
  body="The Automated Builds feature is available for Docker Pro, Team, and Business users. Upgrade now to automatically build and push your images. If you are using automated builds for an open-source project, you can join our [Open Source Community](https://www.docker.com/community/open-source/application){: target='_blank' rel='noopener' class='_'} program to learn how Docker can support your project on Docker Hub."
  header-text="This feature requires a Docker subscription"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_auto_builds"
%}
@y
{% include upgrade-cta.html
  body="自動ビルド機能は Pro、Team、Business ユーザーが利用可能です。既存のプランをアップデートして、最新のイメージビルドおよびプッシュの自動化を始めてください。オープンプロジェクトにおいて自動ビルドを利用している場合は、[Open Source Community](https://www.docker.com/community/open-source/application){: target='_blank' rel='noopener' class='_'} プログラムに参加して、Docker Hub 上において Docker からのプロジェクトサポートを受けることができます。"
  header-text="この機能を利用するには、有償の Docker サブスクリプションが必要です。"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_auto_builds"
%}
@z

@x
To automate building and testing of your images, you link to your hosted source
code service to Docker Hub so that it can access your source code
repositories. You can configure this link for user accounts or
organizations.
@y
イメージのビルドとテストを自動化するために、ホスティングしているソースコードサービスを Docker Hub にリンクすることができます。
これによって Docker Hub からソースコードリポジトリにアクセスできるようになります。
このリンクづけはユーザーアカウントと組織の双方において設定することができます。
@z

@x
> **Note**: If you are linking a source code provider to create autobuilds for a team, follow the instructions to [create a service account](index.md#service-users-for-team-autobuilds) for the team before linking the account as described below.
@y
> **メモ** ソースコードプロバイダーへのリンクにより自動ビルドを行うにあたって、チームアカウントを対象とする場合は、アカウントへのリンクを行う以降の手順よりも前に、チームに対して [サービスアカウントの生成](index.md#service-users-for-team-autobuilds) を実施する手順を行っておいてください。
@z

@x
## Link to a GitHub user account
@y
{: #link-to-a-github-user-account }
## GitHub ユーザーアカウントへのリンク
@z

@x
1. Log in to Docker Hub using your Docker ID.
@y
1. Docker ID を使って Docker Hub にログインします。
@z

@x
2. Click **Account Settings** in the top-right dropdown navigation, then open **Linked Accounts**.
@y
2. 右上にあるドロップダウンメニューの **Account Settings**（アカウント設定）をクリックして、**Linked Accounts**（リンクアカウント）を開きます。
@z

@x
3. Click **Connect** for the source provider you want to link.
@y
3. リンクしたいソースプロバイダーの **Connect**（接続）をクリックします。
@z

@x
    ![Linking source providers](images/linked-accounts.png)
@y
    ![リンクするソースプロバイダー](images/linked-accounts.png)
@z

@x
    > **Note**:  If you want to unlink your current GitHub account and relink to a new GitHub account, make sure to completely logout of [GitHub] (https://github.com/){: target="_blank" rel="noopener"
    class="_"}  before linking via Docker Hub.
@y
    > **メモ**
    >
    > 現在の GitHub アカウントへのリンクを解除して、別の GitHub アカウントへのリンクを行いたい場合は、完全に [GitHub] (https://github.com/){: target="_blank" rel="noopener"
    class="_"} からログアウトした上で Docker Hub からのリンク操作を行ってください。
@z

@x
4. Review the settings for the **Docker Hub Builder** OAuth application.
@y
4. **Docker Hub Builder** OAuth アプリケーションに対する設定を確認します。
@z

@x
    ![Granting access to GitHub account](images/authorize-builder.png)
@y
    ![GitHub アカウントへのアクセス許可](images/authorize-builder.png)
@z

@x
    >**Note**: If you are the owner of any GitHub organizations, you might see
    options to grant Docker Hub access to them from this screen. You can also
    individually edit an organization's third-party access settings to grant or
    revoke Docker Hub's access. See
    [Grant access to a GitHub organization](link-source.md#grant-access-to-a-github-organization)
    to learn more.
@y
    >**メモ** GitHub の組織所有者である場合は、この設定画面において Docker Hub アクセスを許可する GitHub オプションが表示されます。
    >組織が利用するサードパーティー製品から Docker Hub へのアクセスを許可または取り消しは個別に編集することができます。
    >詳しくは [GitHub 組織へのアクセス許可](link-source.md#grant-access-to-a-github-organization) を参照してください。
@z

@x
5. Click **Authorize docker** to save the link.
@y
5. **Authorize docker**（Docker の承認）をクリックしてリンクを保存します。
@z

@x
## Link to a Bitbucket user account
@y
{: #link-to-a-bitbucket-user-account }
## Bitbucket ユーザーアカウントへのリンク
@z

@x
1. Log in to Docker Hub using your Docker ID.
@y
1. Docker ID を使って Docker Hub にログインします。
@z

@x
2. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@y
2. 右上にあるドロップダウンメニューの **Account Settings**（アカウント設定）をクリックして、**Linked Accounts**（リンクアカウント）を開きます。
@z

@x
3. Click **Connect** for the source provider you want to link.
@y
3. リンクしたいソースプロバイダーの **Connect**（接続）をクリックします。
@z

@x
    ![Linking Bitbucket](images/linked-accounts.png)
@y
    ![Bitbucket のリンク](images/linked-accounts.png)
@z

@x
4. If necessary, log in to Bitbucket.
@y
4. 必要なら Bitbucket へログインします。
@z

@x
5. On the page that appears, click **Grant access**.
@y
5. 表示されたページにおいて **Grant access**（アクセス許可）をクリックします。
@z

@x
### Unlink a GitHub user account
@y
{: #unlink-a-github-user-account }
### GitHub ユーザーアカウントのリンク解除
@z

@x
To revoke Docker Hub's access to your GitHub account, you must unlink it both
from Docker Hub, *and* from your GitHub account.
@y
Docker Hub から GitHub アカウントへのアクセスを取り消すには、Docker Hub **そして** GitHub アカウントの両方からリンク解除を行わなければなりません。
@z

@x
1. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@y
1. 右上にあるドロップダウンメニューの **Account Settings**（アカウント設定）をクリックして、**Linked Accounts**（リンクアカウント）を開きます。
@z

@x
2. Click the plug icon next to the source provider you want to remove.
@y
2. 解除したいソースプロバイダーの横にあるプラグアイコンをクリックします。
@z

@x
3. Go to your GitHub account's **Settings** page.
@y
3. GitHub アカウントの **Settings**（設定）ページにアクセスします。
@z

@x
4. Click **Applications** in the left navigation bar.
@y
4. 左側のナビゲーションバーにある **Applications** をクリックします。
@z

@x
5. Click the `...` menu to the right of the Docker Hub Builder application and select **Revoke**.
@y
5. Docker Hub Builder アプリケーションの右側にある`...`メニューをクリックして **Revoke**（取り消し）を実行します。
@z

@x
> **Note**: Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository.
This webhook is not automatically removed when you revoke access to a source
code provider.
@y
> **メモ** 自動ビルド化を行うソースとして設定したリポジトリには、Docker Hub に対してリポジトリ内の変更を通知するウェブフックがあります。
> ソースコードプロバイダーへのアクセスを削除しても、そのウェブフックは自動的には削除されません。
@z

@x
## Grant access to a GitHub organization
@y
{: #grant-access-to-a-github-organization }
## GitHub 組織へのアクセス許可
@z

@x
If you are the owner of a GitHub organization, you can grant or revoke Docker
Hub's access to the organization's repositories. Depending on the GitHub
organization's settings, you may need to be an organization owner.
@y
GitHub の組織所有者であれば、Docker Hub から組織へのリポジトリアクセスを許可または削除することができます。
GitHub の組織設定によっては、あなた自身が組織所有者となることが必要かもしれません。
@z

@x
If the organization has not had specific access granted or revoked before, you
can often grant access at the same time as you link your user account. In this
case, a **Grant access** button appears next to the organization name in the
link accounts screen, as shown below.  If this button does not appear, you must
manually grant the application's access.
@y
組織に対してこれまで特定権限の付与または取り消しを行っていない場合、ユーザーアカウントのリンクの際にアクセス許可を行わなければならない場合があります。
その場合はアカウントのリンク画面において、以下のように組織名の横に **Grant access**（アクセス許可）ボタンが表示されます。
このボタンが表示されない場合は、手動でアプリケーションアクセスの許可を行う必要があります。
@z

@x
![Granting access to GitHub organization](images/link-source-github-org-lite.png)
@y
![GitHub 組織へのアクセス許可](images/link-source-github-org-lite.png)
@z

@x
To manually grant Docker Hub access to a GitHub organization:
@y
Docker Hub から GitHub 組織へのアクセスを手動で許可するには以下のようにします。
@z

@x
1. Link your user account using the instructions above.
@y
1. 上で示した手順に従ってユーザーアカウントをリンクします。
@z

@x
2. From your GitHub Account settings, locate the **Organization settings**
section at the lower left.
@y
2. GitHub アカウントの設定から、左下にある **Organization settings**（組織の設定）セクションに進みます。
@z

@x
3. Click the organization you want to give Docker Hub access to.
@y
3. Docker Hub からのアクセスを許可したい組織をクリックします。
@z

@x
4. From the Organization Profile menu, click **Third-party access**.
@y
4. 組織のプロファイルメニューから **Third-party access**（サードパーティーアクセス）をクリックします。
@z

@x
    The page displays a list of third party applications and their access
    status.
@y
    表示されるページにはサードパーティー製のアプリケーションとそのアクセス状態が表示されます。
@z

@x
5. Click the pencil icon next to Docker Hub Builder.
@y
5. Docker Hub Builder の横にある鉛筆アイコンをクリックします。
@z

@x
6. Click **Grant access** next to the organization.
@y
6. 組織名の横にある **Grant access**（アクセス許可）をクリックします。
@z

@x
    ![Granting access to GitHub organization manually](images/link-source-github-org.png)
@y
    ![GitHub 組織への手動によるアクセス許可](images/link-source-github-org.png)
@z

@x
### Revoke access to a GitHub organization
@y
{: #revoke-access-to-a-github-organization }
### GitHub 組織のアクセス削除
@z

@x
To revoke Docker Hub's access to an organization's GitHub repositories:
@y
Docker Hub から組織の GitHub リポジトリへのアクセスを削除するには、以下のようにします。
@z

@x
1. From your GitHub Account settings, locate the **Organization settings** section at the lower left.
@y
1. GitHub アカウントの設定から、左下にある **Organization settings**（組織の設定）セクションに進みます。
@z

@x
2. Click the organization you want to revoke Docker Hub's access to.
@y
2. Docker Hub からのアクセスを取り消したい組織をクリックします。
@z

@x
3. From the Organization Profile menu, click **Third-party access**.
    The page displays a list of third party applications and their access status.
@y
3. 組織のプロファイルメニューから **Third-party access**（サードパーティーアクセス）をクリックします。
   表示されるページにはサードパーティー製のアプリケーションとそのアクセス状態が表示されます。
@z

@x
4. Click the pencil icon next to Docker Hub Builder.
@y
4. Docker Hub Builder の横にある鉛筆アイコンをクリックします。
@z

@x
5. On the next page, click **Deny access**.
@y
5. 次のページにおいて **Deny access**（アクセス拒否）をクリックします。
@z

@x
### Unlink a Bitbucket user account
@y
{: #unlink-a-bitbucket-user-account }
### Bitbucket ユーザーアカウントのリンク解除
@z

@x
To permanently revoke Docker Hub's access to your Bitbucket account, you must
unlink it both from Docker Hub, *and* from your Bitbucket account.
@y
Docker Hub から Bitbucket アカウントへのアクセスを完全に削除するには、Docker Hub **そして** GitHub アカウントの両方からリンク解除を行わなければなりません。
@z

@x
1. Log in to Docker Hub using your Docker ID.
@y
1. Docker ID を使って Docker Hub にログインします。
@z

@x
2. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@y
2. 右上にあるドロップダウンメニューの **Account Settings**（アカウント設定）をクリックして、**Linked Accounts**（リンクアカウント）を開きます。
@z

@x
3. Click the plug icon next to the source provider you want to remove.
@y
3. 解除したいソースプロバイダーの横にあるプラグアイコンをクリックします。
@z

@x
4. Go to your Bitbucket account and click the user menu icon in the top-right corner.
@y
4. Bitbucket アカウントにアクセスし、右上すみにあるユーザーメニューアイコンをクリックします。
@z

@x
5. Click **Bitbucket settings**.
@y
5. **Bitbucket settings**（Bitbucket 設定）をクリックします。
@z

@x
6. On the page that appears, click **OAuth**.
@y
6. 表示されたページにおいて **OAuth** をクリックします。
@z

@x
7. Click **Revoke** next to the Docker Hub line.
@y
7. Docker Hub の行の横にある **Revoke**（取り消し）をクリックします。
@z

@x
> **Note**: Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository. This
webhook is not automatically removed when you revoke access to a source code
provider.
@y
> **メモ** 自動ビルド化を行うソースとして設定したリポジトリには、Docker Hub に対してリポジトリ内の変更を通知するウェブフックがあります。
> ソースコードプロバイダーへのアクセスを削除しても、そのウェブフックは自動的には削除されません。
@z
