%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Audit log
keywords: Team, organization, activity, log, audit, activities
title: Audit log
---
@y
---
description: Audit log
keywords: Team, organization, activity, log, audit, activities
title: 監査ログ
---
@z

@x
{% include upgrade-cta.html
  body="Audit log is available for users subscribed to a Docker Team or a Business subscription. Upgrade now to start tracking events across your organization."
  header-text="This feature requires a paid Docker subscription"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_audit_log"
%}
@y
{% include upgrade-cta.html
  body="監査ログは、Team または Business プランを購入しているユーザーが利用可能です。既存のプランをアップグレードして、組織全体にわたるイベント追跡を始めてください。"
  header-text="この機能を利用するには、有償の Docker サブスクリプションが必要です。"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_audit_log"
%}
@z

@x
Audit log displays a chronological list of activities that occur at organization and repository levels. It provides owners of Docker Team accounts a report of all their team member activities. This allows the team owners to view and track what changes were made, the date when a change was made, and who initiated the change. For example, the audit log displays activities such as the date when a repository was created or deleted, the team member who created the repository, the name of the repository, and when there was a change to the privacy settings.
@y
監査ログ (audit log) は、組織やリポジトリレベルで発生するアクティビティーを時系列で一覧表示するものです。
この機能では、Docker Team アカウントの所有者すべてに対して、チームメンバーのアクティビティーを報告します。
これによってチーム所有者は、実施された変更、その日付、その変更の開始者を確認して追跡することができます。
たとえば監査ログには、リポジトリが生成、削除された日、リポジトリを生成したチームメンバー、リポジトリ名、固有設定がいつ変更されたか、といったアクティビティーが表示されます。
@z

@x
Team owners can also see the audit log for their repository if the repository is part of the organization subscribed to a Docker Team plan.
@y
Docker の Team プランを購入している組織のリポジトリに対しては、チーム所有者もそのリポジトリの監査ログを参照することができます。
@z

@x
## View the audit log
@y
{: #view-the-audit-log }
## 監査ログの参照
@z

@x
To view the audit log:
@y
監査ログを参照するには以下を行います。
@z

@x
1. Sign into an owner account for the organization in Docker Hub.
2. Select your organization from the list and then click on the **Activity** tab.
@y
1. Docker Hub において、対象組織の所有者アカウントによりサインインします。
2. 一覧から対象組織を選択して、**Activity** タブをクリックします。
@z

@x
    ![Organization activity tab](images/org-activity-tab.png){:width="700px"}
@y
    ![組織の Activity タブ](images/org-activity-tab.png){:width="700px"}
@z

@x
The audit log begins tracking activities from the date the feature is live, that is from **25 January 2021**. Activities that took place before this date are not captured.
@y
監査ログは、この機能が実現された日からのアクティビティーを追跡しています。
その日とは **2021 年 1 月 25 日** です。
この日付よりも前に発生したアクティビティーは記録されません。
@z

@x
> **Note**
>
> Docker will retain the audit log activity data for a period of three months.
@y
> **メモ**
>
> Docker では監査ログアクティビティーデータを 3 ヵ月間保持します。
@z

@x
## Customize the audit log
@y
{: #customize-the-audit-log }
## 監査ログのカスタマイズ
@z

@x
By default, all activities that occur at organization and repository levels are displayed on the **Activity** tab. Use the calendar option to select a date range and customize your results. After you have selected a date range, the **Activity** tab displays the audit log of all the activities that occurred during that period.
@y
組織やリポジトリレベルで発生するアクティビティーは、デフォルトですべて **Activity** タブに表示されます。
カレンダーオプションを使って日付範囲を選べば、表示結果をカスタマイズすることができます。
日付範囲を選択した後は、その範囲内に発生したアクティビティーに対する監査ログが **Activity** タブに表示されます。
@z

@x
![Activities list](images/activity-list.png){:width="600px"}
@y
![アクティビティー一覧](images/activity-list.png){:width="600px"}
@z

@x
<br />
@y
<br />
@z

@x
> **Note**
>
> Activities created by the Docker Support team as part of resolving customer issues appear in the audit log as **dockersupport**.
@y
> **メモ**
>
> 利用者において発生した問題を Docker サポートが解決した場合、生成されるアクティビティーには、監査ログ内に **dockersupport** として示されます。
@z

@x
<br />
@y
<br />
@z

@x
Click the **All Activities** drop-down list to view activities that are specific to an organization or a repository. After choosing **Organization** or **Repository**, you can further refine the results using the **All Actions** drop-down list. If you select the **Activities** tab from the **Repository** view, you can only filter repository-level activities.
@y
ドロップダウンリストの中から **All Activities**（全アクティビティー）を選べば、組織やリポジトリに対するアクティビティーを一覧表示することができます。
この後に **Organization**（組織）または **Repository**（リポジトリ）を選び、**All Actions** ドロップダウンリストを使って、表示結果を詳細に見ることができます。
**Repository** 画面から **Activities** タブを選んだ場合は、リポジトリレベルのアクティビティーのみを見ることができます。
@z

@x
![Refine org activities](images/org-all-actions.png){:width="600px"}
@y
![Refine org activities](images/org-all-actions.png){:width="600px"}
@z

@x
## Audit log event definitions
@y
{: #audit-log-event-definitions }
## 監査ログのイベント定義
@z

@x
Refer to the following section for a list of events and their descriptions:
@y
以下の節におけるイベントとその説明の一覧を参照してください。
@z

@x
### Organization events
@y
{: #organization-events }
### 組織 (organization) イベント
@z

@x
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Team Created | Activities related to the creation of a team     |
| Team Deleted | Activities related to the deletion of a team |
| Team Member Added | Details of the member added to your team |
| Team Member Removed | Details of the member removed from your team |
| Team Member Invited | Details of the member invited to your team |
| Organization Member Removed | Details about member removed from your organization |
|  Organization Created| Activities related to the creation of a new organization |
@y
| イベント                                                          | 内容説明                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Team Created<br/>チーム生成 | チーム生成に関するアクティビティー。     |
| Team Deleted<br/>チーム削除 | チーム削除に関するアクティビティー。 |
| Team Member Added<br/>チームメンバー追加 | チームへのメンバー追加に関する詳細。 |
| Team Member Removed<br/>チームメンバー削除 | チームからのメンバー削除に関する詳細。|
| Team Member Invited<br/>チームメンバー招待 | チームに招待されたメンバーに関する詳細。|
| Organization Member Removed<br/>組織メンバー削除 | 組織から削除されたメンバーに関する詳細。|
|  Organization Created<br/>組織生成 | 組織生成に関するアクティビティー。|
@z

@x
### Repository events
@y
{: #repository-events }
### リポジトリイベント
@z

@x
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Repository Created | Activities related to the creation of a new repository |
| Repository Deleted | Activities related to the deletion of a repository |
| Privacy Changed | Details related to the privacy policies that were updated |
| Tag Pushed | Activities related to the tags pushed |
| Tag Deleted | Activities related to the tags deleted |
@y
| イベント                                                          | 内容説明                                        |
|:------------------------------------------------------------------|:------------------------------------------------|
| Repository Created<br/>リポジトリ生成 | 新たなリポジトリ生成に関するアクティビティー。     |
| Repository Deleted<br/>リポジトリ削除 | リポジトリ削除に関するアクティビティー。           |
| Privacy Changed<br/>プライバシー変更 | 更新されたプライバシーポリシーに関する詳細。        |
| Tag Pushed<br/>タグプッシュ | タグプッシュに関するアクティビティー。                       |
| Tag Deleted<br/>タグ削除 | タグ削除に関するアクティビティー。                              |
@z
