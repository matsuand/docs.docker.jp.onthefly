%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Integrate Docker Hub with Slack
keywords: Slack, integrate, notifications
redirect_from:
- /docker-cloud/tutorials/slack-integration/
- /docker-cloud/slack-integration/
title: Set up Docker Hub notifications in Slack
---
@y
---
description: Integrate Docker Hub with Slack
keywords: Slack, integrate, notifications
redirect_from:
- /docker-cloud/tutorials/slack-integration/
- /docker-cloud/slack-integration/
title: Slack における Docker Hub 通知の設定
---
@z

@x
Docker Hub can integrate with your **Slack** team to provide notifications about builds.
@y
{% comment %}
Docker Hub can integrate with your **Slack** team to provide notifications about builds.
{% endcomment %}
Docker Hub は **Slack** チームと連携して、イメージビルドの通知を行うことができます。
@z

@x
## Set up a Slack integration
@y
{% comment %}
## Set up a Slack integration
{% endcomment %}
{: #set-up-a-slack-integration }
## Slack 連携のための設定
@z

@x
Before you begin, make sure that you are signed into the Slack team that you want to show notifications in.
@y
{% comment %}
Before you begin, make sure that you are signed into the Slack team that you want to show notifications in.
{% endcomment %}
始めるにあたっては、まず通知連携したい Slack チームにサインインしてください。
@z

@x
1. Log in to the Docker account that owns the builds that you want to receive notifications about.
@y
{% comment %}
1. Log in to the Docker account that owns the builds that you want to receive notifications about.
{% endcomment %}
1. Docker アカウントにログインします。
   これは、ビルド通知の対象としたいビルドイメージを所有するアカウントです。
@z

@x
    > **Note**: If you are setting up notifications for an organization, log in as a member of the organization's `Owners` team, then switch to the organization account to change the settings.
@y
    {% comment %}
    > **Note**: If you are setting up notifications for an organization, log in as a member of the organization's `Owners` team, then switch to the organization account to change the settings.
    {% endcomment %}
    > **メモ**: 通知設定を組織に対して行うのであれば、その組織の `Owners` チームに所属するメンバーとしてログインし、その後に組織アカウントに切り替えて設定を行ってください。
@z

@x
2. Click **Account Settings** in the left hand navigation, and scroll down to the **Notifications** section.
@y
{% comment %}
2. Click **Account Settings** in the left hand navigation, and scroll down to the **Notifications** section.
{% endcomment %}
2. ナビゲーションバーの左側にある **Account Settings** をクリックして、下へスクロールして **Notifications** セクションを表示します。
@z

@x
3. Click the plug icon next to **Slack**.
@y
{% comment %}
3. Click the plug icon next to **Slack**.
{% endcomment %}
3. **Slack** の横にあるプラグアイコンをクリックします。
@z

@x
    The Docker Hub page refreshes to show a Slack authorization screen.
@y
    {% comment %}
    The Docker Hub page refreshes to show a Slack authorization screen.
    {% endcomment %}
    Docker Hub の画面がリフレッシュされて、Slack の認証画面が表示されます。
@z

@x
4. On the page that appears, double check that you're signed in to the correct Slack team. (If necessary sign in to the correct one.)
5. Select the channel that should receive notifications.
6. Click **Authorize**.
@y
{% comment %}
4. On the page that appears, double check that you're signed in to the correct Slack team. (If necessary sign in to the correct one.)
5. Select the channel that should receive notifications.
6. Click **Authorize**.
{% endcomment %}
4. 表示された認証画面上において、適切な Slack チームにサインインしていることを再度確認します。
   （必要に応じて正しいアカウントにサインインします。）
5. 通知を受信したいチャネルを選択します。
6. **Authorize** をクリックします。
@z

@x
    Once you click **Authorize**, you should see a message in the Slack channel notifying you of the new integration.
@y
    {% comment %}
    Once you click **Authorize**, you should see a message in the Slack channel notifying you of the new integration.
    {% endcomment %}
    **Authorize** をクリックしたら、Slack チャネルのメッセージとして、新たな通知設定が行われたことが示されます。
@z

@x
Once configured, choose a notification level:
@y
{% comment %}
Once configured, choose a notification level:
{% endcomment %}
設定ができたら、通知レベルを選びます。
@z

@x
* **Off** Do not receive any notifications.
* **Only failures** Only receive notifications about failed builds.
* **Everything** Receive notifications for both failed and successful builds.
  ![](images/slack-notification-updates.png)
@y
{% comment %}
* **Off** Do not receive any notifications.
* **Only failures** Only receive notifications about failed builds.
* **Everything** Receive notifications for both failed and successful builds.
  ![](images/slack-notification-updates.png)
{% endcomment %}
* **Off** 通知を受信しません。
* **Only failures** イメージビルドに失敗したという通知のみ受信します。
* **Everything** イメージビルドの成功、失敗のいずれの通知も受信します。
  ![](images/slack-notification-updates.png)
@z

@x
Enjoy your new Slack channel integration!
@y
{% comment %}
Enjoy your new Slack channel integration!
{% endcomment %}
Slack チャネルとの統合を活用してください。
@z

@x
## Edit a Slack integration
@y
{% comment %}
## Edit a Slack integration
{% endcomment %}
{: #edit-a-slack-integration }
## Slack 連携の編集
@z

@x
* Click **Account Settings** in the lower left, scroll down to **Notifications**, and locate the **Slack** section. From here you can choose a new notification level, or remove the integration.
@y
{% comment %}
* Click **Account Settings** in the lower left, scroll down to **Notifications**, and locate the **Slack** section. From here you can choose a new notification level, or remove the integration.
{% endcomment %}
* 下段左側の **Account Settings** をクリックして、下へスクロールして **Notifications** まで行き、**Slack** セクションを表示します。
  ここで通知レベルを新たに設定したり、通知を削除したりすることができます。
@z

@x
* From the Slack **Notifications** section you can also change the channel that the integration posts to. Click the reload icon (two arrows) next to the Slack integration to reopen the OAuth channel selector.
@y
{% comment %}
* From the Slack **Notifications** section you can also change the channel that the integration posts to. Click the reload icon (two arrows) next to the Slack integration to reopen the OAuth channel selector.
{% endcomment %}
* Slack の **Notifications** セクションでは、通知を送信するチャネルの変更も行うことができます。
 Slack 連携のとなりにある （2 つ矢印の）リロードアイコンをクリックすると、OAuth チャネルを選ぶことができます。
@z

@x
* Alternately, go to the <a href="https://slack.com/apps/manage" target="_blank">Slack App Management page</a> and search for "Docker Hub". Click the result to see all of the Docker Hub notification channels set for the Slack team.
@y
{% comment %}
* Alternately, go to the <a href="https://slack.com/apps/manage" target="_blank">Slack App Management page</a> and search for "Docker Hub". Click the result to see all of the Docker Hub notification channels set for the Slack team.
{% endcomment %}
* 上とは別に、<a href="https://slack.com/apps/manage" target="_blank">Slack App Management ページ</a> にアクセスし、「Docker Hub」を検索してみてください。検索結果をクリックして、Slack チームに設定されている Docker Hub の通知チャネルを確認してください。
@z
