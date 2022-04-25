%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Hub Teams & Organizations
keywords: Docker, docker, registry, teams, organizations, plans, Dockerfile, Docker Hub, docs, documentation
title: Teams and Organizations
redirect_from:
- /docker-cloud/orgs/
---
@y
---
description: Docker Hub Teams & Organizations
keywords: Docker, docker, registry, teams, organizations, plans, Dockerfile, Docker Hub, docs, documentation
title: チームと組織
redirect_from:
- /docker-cloud/orgs/
---
@z

@x
Docker Hub organizations let you create teams so you can give your team access
to shared image repositories.
@y
Docker Hub の組織（organizations）は、チームの生成を行い、チームメンバーがイメージリポジトリを共有アクセスできるようにするものです。
@z

@x
An **Organization** is a collection of teams and repositories
that can be managed together. Docker users become members of an organization
when they are assigned to at least one team in the organization. When you first
create an organization, you’ll see that you have a team, the **owners** (Admins)
team, with a single member. An organization owner is someone that is part of the
owners team. They can create new teams and add
members to an existing team using their Docker ID or email address and by
selecting a team the user should be part of. An org owner can also add
additional org owners to help them manage users, teams, and repositories in the
organization.
@y
An **Organization** is a collection of teams and repositories
that can be managed together. Docker users become members of an organization
when they are assigned to at least one team in the organization. When you first
create an organization, you’ll see that you have a team, the **owners** (Admins)
team, with a single member. An organization owner is someone that is part of the
owners team. They can create new teams and add
members to an existing team using their Docker ID or email address and by
selecting a team the user should be part of. An org owner can also add
additional org owners to help them manage users, teams, and repositories in the
organization.
@z

@x
A **Team** is a group of Docker users that belong to an organization. An
organization can have multiple teams. When you first create an organization,
you’ll see that you have a team, the **owners** team, with a single member. An
organization owner can then create new teams and add members to an existing team
using their Docker ID or email address and by selecting a team the user should be part of.
@y
A **Team** is a group of Docker users that belong to an organization. An
organization can have multiple teams. When you first create an organization,
you’ll see that you have a team, the **owners** team, with a single member. An
organization owner can then create new teams and add members to an existing team
using their Docker ID or email address and by selecting a team the user should be part of.
@z

@x
## Create an organization
@y
{: #create-an-organization }
## 組織の生成
@z

@x
There are multiple ways to create an organization. You can create a brand new
organization using the **Create Organization** option in Docker Hub, or you can
convert an existing user account to an organization. The following section
contains instructions on how to create new organization. For prerequisites and
detailed instructions on converting an existing user account to an org, see
[Convert an account into an organization](convert-account.md).
@y
There are multiple ways to create an organization. You can create a brand new
organization using the **Create Organization** option in Docker Hub, or you can
convert an existing user account to an organization. The following section
contains instructions on how to create new organization. For prerequisites and
detailed instructions on converting an existing user account to an org, see
[Convert an account into an organization](convert-account.md).
@z

@x
To create an organization:
@y
組織を生成するには以下を行います。
@z

@x
1. Sign into [Docker Hub](https://hub.docker.com/){: target="_blank"
rel="noopener" class="_"} using your [Docker ID](../docker-id/index.md) or your email address.
2. Select **Organizations**. Click **Create Organization** to create a new organization.
3. Choose a plan for your organization. See [Docker Pricing](https://www.docker.com/pricing/){: target="_blank" rel="noopener"
class="_" id="dkr_docs_subscription_btl"} for details on the features offered
in the Team and Business plan.
4. Enter a name for your organization. This is the official, unique name for
your organization in Docker Hub. Note that it is not possible to change the name
of the organization after you've created it.
@y
1. Sign into [Docker Hub](https://hub.docker.com/){: target="_blank"
rel="noopener" class="_"} using your [Docker ID](../docker-id/index.md) or your email address.
2. Select **Organizations**. Click **Create Organization** to create a new organization.
3. Choose a plan for your organization. See [Docker Pricing](https://www.docker.com/pricing/){: target="_blank" rel="noopener"
class="_" id="dkr_docs_subscription_btl"} for details on the features offered
in the Team and Business plan.
4. Enter a name for your organization. This is the official, unique name for
your organization in Docker Hub. Note that it is not possible to change the name
of the organization after you've created it.
@z

@x
      > The organization name cannot be the same as your Docker ID.
@y
      > The organization name cannot be the same as your Docker ID.
@z

@x
5. Enter the name of your company. This is the full name of your company.
This info is displayed on your organization page, and in the details of any
public images you publish. You can update the company name anytime by navigating
to your organization's **Settings** page. Click **Continue to Org size**.
6. On the Organization Size page, specify the number of users (seats) you'd
require and click **Continue to payment**.
@y
5. Enter the name of your company. This is the full name of your company.
This info is displayed on your organization page, and in the details of any
public images you publish. You can update the company name anytime by navigating
to your organization's **Settings** page. Click **Continue to Org size**.
6. On the Organization Size page, specify the number of users (seats) you'd
require and click **Continue to payment**.
@z

@x
You've now created an organization. Select the newly created organization from
the Organizations page. You'll now see that you have a team, the **owners** team
with a single member (you).
@y
You've now created an organization. Select the newly created organization from
the Organizations page. You'll now see that you have a team, the **owners** team
with a single member (you).
@z

@x
### View an organization
@y
{: #view-an-organization }
### 組織の参照
@z

@x
To view an organization:
@y
組織を参照するには以下を行います。
@z

@x
1. Log into Docker Hub with a user account that is a member of any team in the
   organization. You must be part of the **owners** team to access the
   organization's **Settings** page.
@y
1. Log into Docker Hub with a user account that is a member of any team in the
   organization. You must be part of the **owners** team to access the
   organization's **Settings** page.
@z

@x
      > **Note:**
      >
      > You can't _directly_ log into an organization. This is especially
      > important to note if you create an organization by
      [converting a user account](convert-account.md), as conversion means you lose the ability to log into that
      > "account", since it no longer exists. If you don't see the organization,
      > then you are neither a member or an owner of it. An organization
      > administrator will need to add you as a member of the organization team.
@y
      > **Note:**
      >
      > You can't _directly_ log into an organization. This is especially
      > important to note if you create an organization by
      [converting a user account](convert-account.md), as conversion means you lose the ability to log into that
      > "account", since it no longer exists. If you don't see the organization,
      > then you are neither a member or an owner of it. An organization
      > administrator will need to add you as a member of the organization team.
@z

@x
2. Click **Organizations** in the top navigation bar, then choose your
   organization from the list.
@y
2. Click **Organizations** in the top navigation bar, then choose your
   organization from the list.
@z

@x
      ![View organization details](images/view-org.png){:width="700px"}
@y
      ![View organization details](images/view-org.png){:width="700px"}
@z

@x
The Organization landing page displays various options that allow you to
configure your organization.
@y
The Organization landing page displays various options that allow you to
configure your organization.
@z

@x
- **Members**: Displays a list of team members. You
  can invite new members using the **Add Member** option. See [Add team members](#add-team-members) for details.
@y
- **Members**: Displays a list of team members. You
  can invite new members using the **Add Member** option. See [Add team members](#add-team-members) for details.
@z

@x
- **Teams**: Displays a list of existing teams and the number of
  members in each team. See [Create a team](#create-a-team) for details.
@y
- **Teams**: Displays a list of existing teams and the number of
  members in each team. See [Create a team](#create-a-team) for details.
@z

@x
- **Repositories**: Displays a list of repositories associated with the
  organization. See [Repositories](repos.md) for detailed information about
  working with repositories.
@y
- **Repositories**: Displays a list of repositories associated with the
  organization. See [Repositories](repos.md) for detailed information about
  working with repositories.
@z

@x
- **Activity** Displays the audit log, a chronological list of activities that
  occur at organization and repository levels. It provides the org owners a
  report of all their team member activities. See [Audit log](audit-log.md) for
  details.
@y
- **Activity** Displays the audit log, a chronological list of activities that
  occur at organization and repository levels. It provides the org owners a
  report of all their team member activities. See [Audit log](audit-log.md) for
  details.
@z

@x
- **Settings**: Displays information about your
  organization, and allows you to view and change your repository privacy
  settings, configure org permissions such as
  [Image Access Management](image-access-management.md) and notification settings. You can
  also [deactivate](deactivate-account.md#deactivating-an-organization) your
  organization on this tab.
@y
- **Settings**: Displays information about your
  organization, and allows you to view and change your repository privacy
  settings, configure org permissions such as
  [Image Access Management](image-access-management.md) and notification settings. You can
  also [deactivate](deactivate-account.md#deactivating-an-organization) your
  organization on this tab.
@z

@x
- **Billing**: Displays information about your existing
[Docker subscription (plan)](../subscription/index.md) and your billing history.
You can also access your invoices from this tab.
@y
- **Billing**: Displays information about your existing
[Docker subscription (plan)](../subscription/index.md) and your billing history.
You can also access your invoices from this tab.
@z

@x
- **Invitees**: Displays a list of users invited to the organization through
  their email address. This list only includes email addresses that **do not** have a Docker ID or an account associated with it. Only Org owners can view and manage the Invitees list.
@y
- **Invitees**: Displays a list of users invited to the organization through
  their email address. This list only includes email addresses that **do not** have a Docker ID or an account associated with it. Only Org owners can view and manage the Invitees list.
@z

@x
> **Important**
>
> If you are on a Team or a Business subscription, every user listed on the
> **Invitees** tab counts towards a seat, even if they do not have a Docker
> ID or an account yet.
{: .important }
@y
> **Important**
>
> If you are on a Team or a Business subscription, every user listed on the
> **Invitees** tab counts towards a seat, even if they do not have a Docker
> ID or an account yet.
{: .important }
@z

@x
## Create a team
@y
## Create a team
@z

@x
A **Team** is a group of Docker users that belong to an organization. An
organization can have multiple teams. When you first create an organization,
you’ll see that you have a team, the **owners** team, with a single member. An
organization owner can then create new teams and add members to an existing team
using their Docker ID or email address and by selecting a team the user should be part of.
@y
A **Team** is a group of Docker users that belong to an organization. An
organization can have multiple teams. When you first create an organization,
you’ll see that you have a team, the **owners** team, with a single member. An
organization owner can then create new teams and add members to an existing team
using their Docker ID or email address and by selecting a team the user should be part of.
@z

@x
The org owner can add additional org owners to the owners team to help them
manage users, teams, and repositories in the organization. See [Owners
team](#the-owners-team) for details.
@y
The org owner can add additional org owners to the owners team to help them
manage users, teams, and repositories in the organization. See [Owners
team](#the-owners-team) for details.
@z

@x
To create a team:
@y
To create a team:
@z

@x
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Open the **Teams** tab and click **Create Team**.
3. Fill out your team's information and click **Create**.
@y
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Open the **Teams** tab and click **Create Team**.
3. Fill out your team's information and click **Create**.
@z

@x
### The owners team
@y
{: #the-owners-team }
#### owners チーム
@z

@x
The **owners** team is a special team created by default during the org creation
process. The owners team has full access to all repositories in the organization.
@y
The **owners** team is a special team created by default during the org creation
process. The owners team has full access to all repositories in the organization.
@z

@x
An organization owner is an administrator who is responsible to manage
repositories and add team members to the organization. They have full access to
private repositories, all teams, billing information, and org settings. An org
owner can also specify [permissions](#permissions-reference) for each team in
the organization. Only an org owner can enable [SSO](../single-sign-on/index.md)
for
the organization. When SSO is enabled for your organization, the org owner can
also manage users. Docker can auto-provision Docker IDs for new end-users or
users who'd like to have a separate Docker ID for company use through SSO
enforcement.
@y
An organization owner is an administrator who is responsible to manage
repositories and add team members to the organization. They have full access to
private repositories, all teams, billing information, and org settings. An org
owner can also specify [permissions](#permissions-reference) for each team in
the organization. Only an org owner can enable [SSO](../single-sign-on/index.md)
for
the organization. When SSO is enabled for your organization, the org owner can
also manage users. Docker can auto-provision Docker IDs for new end-users or
users who'd like to have a separate Docker ID for company use through SSO
enforcement.
@z

@x
The org owner can also add additional org owners to help them manage users, teams, and repositories in the organization.
@y
The org owner can also add additional org owners to help them manage users, teams, and repositories in the organization.
@z

@x
## Add team members
@y
{: #add-team-members }
## チームメンバーの追加
@z

@x
Org owners can invite new members to the team using their Docker ID or email
address. When you invite team members using their email address, we recommend
that users create a Docker account before accepting the invite to join the
team. If you are using a Docker Team or a Business subscription, inviting team
members using their email address counts towards a seat.
@y
Org owners can invite new members to the team using their Docker ID or email
address. When you invite team members using their email address, we recommend
that users create a Docker account before accepting the invite to join the
team. If you are using a Docker Team or a Business subscription, inviting team
members using their email address counts towards a seat.
@z

@x
If the user isn't in your organization:
@y
If the user isn't in your organization:
@z

@x
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Click **Add Member**.
3. Enter the user's Docker ID or email, and select a team from the drop-down list.
4. Click **Add** to confirm.
@y
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Click **Add Member**.
3. Enter the user's Docker ID or email, and select a team from the drop-down list.
4. Click **Add** to confirm.
@z

@x
If the user already belongs to another team in the organization:
@y
If the user already belongs to another team in the organization:
@z

@x
1. Open the team's page in Docker Hub: **Organizations** > **_Your Organization_** > **Teams** > **_Your Team Name_**
2. Click **Add Member**.
3. Enter the user's Docker ID or email address to add them to the team.
@y
1. Open the team's page in Docker Hub: **Organizations** > **_Your Organization_** > **Teams** > **_Your Team Name_**
2. Click **Add Member**.
3. Enter the user's Docker ID or email address to add them to the team.
@z

@x
When org owners add team members, the members receive an email
informing them that they have been added to the organization as a member of the team.
@y
When org owners add team members, the members receive an email
informing them that they have been added to the organization as a member of the team.
@z

@x
> **Note**: You are not automatically added to teams created by your
> organization.
@y
> **Note**: You are not automatically added to teams created by your
> organization.
@z

@x
## Configure repository permissions
@y
## Configure repository permissions
@z

@x
Organization owners can configure repository permissions on a per-team basis.
For example, you can specify that all teams within an organization have Read and
Write access to repositories A and B, whereas only specific teams have Admin
access. Note that org owners have full administrative access to all repositories within the organization.
@y
Organization owners can configure repository permissions on a per-team basis.
For example, you can specify that all teams within an organization have Read and
Write access to repositories A and B, whereas only specific teams have Admin
access. Note that org owners have full administrative access to all repositories within the organization.
@z

@x
To give a team access to a repository
@y
To give a team access to a repository
@z

@x
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Click on the **Teams** tab and select the team that you'd like to configure  repository access to.
3. Click on the **Permissions** tab and select a repository from the
   **Repository** drop-down.
4. Choose a permission from the **Permissions** drop-down list and click **Add**.
@y
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Click on the **Teams** tab and select the team that you'd like to configure  repository access to.
3. Click on the **Permissions** tab and select a repository from the
   **Repository** drop-down.
4. Choose a permission from the **Permissions** drop-down list and click **Add**.
@z

@x
      ![Team Repo Permissions](images/team-repo-permission.png){:width="700px"}
@y
      ![Team Repo Permissions](images/team-repo-permission.png){:width="700px"}
@z

@x
### View a team's permissions for all repositories
@y
### View a team's permissions for all repositories
@z

@x
To view a team's permissions across all repositories:
@y
To view a team's permissions across all repositories:
@z

@x
1. Open **Organizations** > **_Your Organization_** > **Teams** > **_Team Name_**.
2. Click on the **Permissions** tab, where you can view the repositories this team can access.
@y
1. Open **Organizations** > **_Your Organization_** > **Teams** > **_Team Name_**.
2. Click on the **Permissions** tab, where you can view the repositories this team can access.
@z

@x
### Permissions reference
@y
### Permissions reference
@z

@x
Permissions are cumulative. For example, if you have Read & Write permissions,
you automatically have Read-only permissions:
@y
Permissions are cumulative. For example, if you have Read & Write permissions,
you automatically have Read-only permissions:
@z

@x
- `Read-only` access allows users to view, search, and pull a private repository in the same way as they can a public repository.
- `Read & Write` access allows users to pull, push, and view a repository Docker
  Hub. In addition, it allows users to view, cancel, retry or trigger builds
- `Admin` access allows users to Pull, push, view, edit, and delete a
  repository; edit build settings; update the repository description modify the
  repositories "Description", "Collaborators" rights, "Public/Private"
  visibility, and "Delete".
@y
- `Read-only` access allows users to view, search, and pull a private repository in the same way as they can a public repository.
- `Read & Write` access allows users to pull, push, and view a repository Docker
  Hub. In addition, it allows users to view, cancel, retry or trigger builds
- `Admin` access allows users to Pull, push, view, edit, and delete a
  repository; edit build settings; update the repository description modify the
  repositories "Description", "Collaborators" rights, "Public/Private"
  visibility, and "Delete".
@z

@x
> **Note**:
>
> A User who has not yet verified their email address only has
> `Read-only` access to the repository, regardless of the rights their team
> membership has given them.
@y
> **Note**:
>
> A User who has not yet verified their email address only has
> `Read-only` access to the repository, regardless of the rights their team
> membership has given them.
@z

@x
## Remove team members
@y
{: #remove-team-members }
## チームメンバーの削除
@z

@x
To remove a member from all teams in an organization:
@y
To remove a member from all teams in an organization:
@z

@x
1. Go to **Organizations** in Docker Hub, and select your organization. The Organizations page lists all team members.
2. Click the **X** next to a member’s name to remove them from all the teams in the organization.
3. When prompted, click **Remove** to confirm the removal.
@y
1. Go to **Organizations** in Docker Hub, and select your organization. The Organizations page lists all team members.
2. Click the **X** next to a member’s name to remove them from all the teams in the organization.
3. When prompted, click **Remove** to confirm the removal.
@z

@x
To remove a member from a specific team:
@y
To remove a member from a specific team:
@z

@x
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Click on the **Teams** tab and select the team from the list.
3. Click the **X** next to the user's name to remove them from the team.
4. When prompted, click **Remove** to confirm the removal.
@y
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Click on the **Teams** tab and select the team from the list.
3. Click the **X** next to the user's name to remove them from the team.
4. When prompted, click **Remove** to confirm the removal.
@z

@x
## Videos
@y
{: #videos }
## ビデオ
@z

@x
You can also check out the following videos for information about creating Teams
and Organizations in Docker Hub.
@y
You can also check out the following videos for information about creating Teams
and Organizations in Docker Hub.
@z

@x
- [Overview of organizations](https://www.youtube-nocookie.com/embed/G7lvSnAqed8){: target="_blank" rel="noopener" class="_"}
- [Create an organization](https://www.youtube-nocookie.com/embed/b0TKcIqa9Po){: target="_blank" rel="noopener" class="_"}
- [Working with Teams](https://www.youtube-nocookie.com/embed/MROKmtmWCVI){: target="_blank" rel="noopener" class="_"}
- [Create Teams](https://www.youtube-nocookie.com/embed/78wbbBoasIc){: target="_blank" rel="noopener" class="_"}
@y
- [Overview of organizations](https://www.youtube-nocookie.com/embed/G7lvSnAqed8){: target="_blank" rel="noopener" class="_"}
- [Create an organization](https://www.youtube-nocookie.com/embed/b0TKcIqa9Po){: target="_blank" rel="noopener" class="_"}
- [Working with Teams](https://www.youtube-nocookie.com/embed/MROKmtmWCVI){: target="_blank" rel="noopener" class="_"}
- [Create Teams](https://www.youtube-nocookie.com/embed/78wbbBoasIc){: target="_blank" rel="noopener" class="_"}
@z
