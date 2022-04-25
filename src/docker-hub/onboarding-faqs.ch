%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions
keywords: onboarding, docker, teams, orgs
toc_max: 2
---
@y
---
description: よくたずねられる質問
keywords: onboarding, docker, teams, orgs
toc_max: 2
---
@z

@x
### What is a Docker ID?
@y
{: #what-is-a-docker-id }
### Docker ID とは何ですか？
@z

@x
A Docker ID is a username to access Docker Hub repositories and hosted Docker
services. All you need is an email address to create a Docker ID. Your Docker ID must be between 4 and 30 characters long, and can only contain
numbers and lowercase letters. You cannot use any special characters or spaces.
For more information, see [Docker ID](../docker-id/index.md). If your admin enforces [Single sign-on (SSO)](../single-sign-on/index.md), a Docker ID is provisioned for new users.
@y
Docker ID とは、Docker Hub リポジトリやホストされた Docker サービスにアクセスできるユーザー名のことです。
Docker ID の生成に必要となるのはメールアドレスだけです。
Docker ID は 4 ～ 30 の長さの文字列でなければなりません。
また含めることのできる文字は、数値と英小文字のみです。
特殊な文字や空白を含めることはできません。
詳しくは [Docker ID](../docker-id/index.md) を参照してください。
管理者から [シングルサインオン (SSO)](../single-sign-on/index.md) が指定されている場合、新規ユーザーに対して Docker ID が割り振られます。
@z

@x
### What if my Docker ID is taken?
@y
{: #what-if-my-docker-id-is-taken }
### Docker ID を取得したらどうなりますか？
@z

@x
All Docker IDs are first-come, first-served except for companies that have a US Trademark on a username. If you have a trademark for your namespace, [Docker Support](https://hub.docker.com/support/contact/){: target="_blank" rel="noopener"
class="_"} can retrieve the Docker ID for you.
@y
Docker ID は早いものから順に登録されます。
ただしユーザー名に US 商標登録が含まれる企業は別です。
名前空間を商標登録している場合、[Docker Support](https://hub.docker.com/support/contact/){: target="_blank" rel="noopener"
class="_"} が Docker ID を適切に提供します。
@z

@x
### What’s an organization?
@y
{: #whats-an-organization }
### 組織とは何ですか？
@z

@x
Docker users become members of an organization when they are assigned to at
least one team in the organization. When you first create an organization,
you’ll see that you have a team, the **Owners** (Admins) team, with a single
member. An organization owner is someone that is part of the owners team. They
can create new teams and add members to an existing team using their Docker ID
or email address and by selecting a team the user should be part of. An
organization owner can also add additional organization owners to help them
manage users, teams, and repositories in the organization. [Learn more](orgs.md).
@y
Docker ユーザーは、組織内の少なくとも 1 つのチームに割り当てられていれば、その組織のメンバーになります。
組織を作成すると、1 つのチームを持つことになります。
そのチームは **Owners** (所有者、管理者) チームです。
そこに 1 人だけメンバーが含まれます。
組織の所有者とは所有者チームの誰かのことです。
組織の所有者であれば、自身の Docker ID かあるいはメールアドレスを使って、新たなチームの生成や既存チームへのメンバー追加が可能になります。
その際にはユーザーを所属させるチームを選択します。
組織の所有者は、別の組織所有者を追加できます。
その追加の所有者に、ユーザー、チーム、組織内リポジトリの管理を委ねることができます。
[詳しくはこちら](orgs.md)。
@z

@x
### How many organizations can I create?
@y
{: #how-many-organizations-can-i-create }
### 組織はいくつ作ることができますか？
@z

@x
To begin, you should set up your first organization and contact the Customer Success team at customer-success@docker.com to add the additional organizations. Also, if you are enabling SSO, it is configured based on your domain, not your organization.
@y
まず初めに 1 つめの組織を作ります。
そして Customer Success チーム customer-success@docker.com に連絡をして、もう 1 つの組織を追加します。
なお SSO を有効にしている場合は、組織に対する設定ではなく、ドメインに基づいた設定が行われます。
@z

@x
### What’s a team?
@y
{: #whats-a-team }
### チームとは何ですか？
@z

@x
A **Team** is a group of Docker users that belong to an organization. An organization can have multiple teams. When you first create an organization, you’ll see that you have a team, the owners team, with a single member. An organization owner can then create new teams and add members to an existing team using Docker IDs or email address and by selecting a team the user should be part of. [Learn more](orgs.md#create-a-team).
@y
**チーム** (team) とは、1 つの組織に所属する Docker ユーザーのグループのことです。
1 つの組織には複数のチームを含めることができます。
初めて組織を生成した際には、1 つのチームが生成されています。
それは所有者チームであり、そこにはメンバーが一人だけ含まれています。
An organization owner can then create new teams and add members to an existing team using Docker IDs or email address and by selecting a team the user should be part of. [Learn more](orgs.md#create-a-team).
@z

@x
### Who is an organization owner?
@y
{: #who-is-an-organization-owner }
### 組織のオーナーは誰ですか？
@z

@x
An organization owner is an administrator who is responsible to manage
repositories and add team members to the organization. They have full access to
private repositories, all teams, billing information, and organization settings.
An organization owner can also specify [permissions](orgs.md#configure-repository-permissions) for each team in the
organization. Only an organization owner can enable SSO for the organization.
When SSO is enabled for your organization, the organization owner can also
manage users.
@y
An organization owner is an administrator who is responsible to manage
repositories and add team members to the organization. They have full access to
private repositories, all teams, billing information, and organization settings.
An organization owner can also specify [permissions](orgs.md#configure-repository-permissions) for each team in the
organization. Only an organization owner can enable SSO for the organization.
When SSO is enabled for your organization, the organization owner can also
manage users.
@z

@x
Docker can auto-provision Docker IDs for new end-users or users who'd like to
have a separate Docker ID for company use through SSO enforcement.
@y
Docker can auto-provision Docker IDs for new end-users or users who'd like to
have a separate Docker ID for company use through SSO enforcement.
@z

@x
The organization owner can also add additional owners to help them manage users, teams, and repositories in the organization.
@y
The organization owner can also add additional owners to help them manage users, teams, and repositories in the organization.
@z

@x
### How do I add an organization owner?
@y
{: #how-do-i-add-an-organization-owner }
### How do I add an organization owner?
@z

@x
An existing owner can add additional team members as organization owners. All
they need to do is select the organization from the
[Organizations](https://hub.docker.com/orgs){: target="_blank" rel="noopener"
class="_"} page in Docker Hub, add the Docker ID/Email of the user, and then
select the **Owners** team from the drop-down menu. [Learn more](orgs.md#the-owners-team).
@y
An existing owner can add additional team members as organization owners. All
they need to do is select the organization from the
[Organizations](https://hub.docker.com/orgs){: target="_blank" rel="noopener"
class="_"} page in Docker Hub, add the Docker ID/Email of the user, and then
select the **Owners** team from the drop-down menu. [Learn more](orgs.md#the-owners-team).
@z

@x
### Do users first need to authenticate with Docker before an owner can add them to an organization?
@y
{: #do-users-first-need-to-authenticate-with-docker-before-an-owner-can-add-them-to-an-organization }
### Do users first need to authenticate with Docker before an owner can add them to an organization?
@z

@x
No. Organization owners can invite users through email and also choose a team for them to join within the invite.
@y
No. Organization owners can invite users through email and also choose a team for them to join within the invite.
@z

@x
### If a user has their personal email associated with a user account in Docker Hub, do they have to convert to using the org’s domain before they can be invited to join an organization?
@y
{: #if-a-user-has-their-personal-email-associated-with-a-user-account-in-docker-hub-do-they-have-to-convert-to-using-the-orgs-domain-before-they-can-be-invited-to-join-an-organization }
### If a user has their personal email associated with a user account in Docker Hub, do they have to convert to using the org’s domain before they can be invited to join an organization?
@z

@x
Yes. When SSO is enabled for your organization, each user must sign in with the company’s domain. However, the user can retain their personal credentials and create a new Docker ID associated with their organization's domain.
@y
Yes. When SSO is enabled for your organization, each user must sign in with the company’s domain. However, the user can retain their personal credentials and create a new Docker ID associated with their organization's domain.
@z

@x
### Can I convert my personal user account (Docker ID) to an organization account?
@y
{: #can-i-convert-my-personal-user-account-docker-id-to-an-organization-account }
### Can I convert my personal user account (Docker ID) to an organization account?
@z

@x
Yes. You can convert your user account to an organization account. Once you
convert a user account into an organization, it is not possible to
revert it to a personal user account. For prerequisites and instructions, see
[Convert an account into an organization](convert-account.md).
@y
Yes. You can convert your user account to an organization account. Once you
convert a user account into an organization, it is not possible to
revert it to a personal user account. For prerequisites and instructions, see
[Convert an account into an organization](convert-account.md).
@z

@x
### Our users create Docker Hub accounts through self-service. How do we know when the total number of users for the requested licenses has been met? Is it possible to add more members to the organization than the total number of licenses?
@y
{: #our-users-create-docker-hub-accounts-through-self-service-how-do-we-know-when-the-total-number-of-users-for-the-requested-licenses-has-been-met-is-it-possible-to-add-more-members-to-the-organization-than-the-total-number-of-licenses }
### Our users create Docker Hub accounts through self-service. How do we know when the total number of users for the requested licenses has been met? Is it possible to add more members to the organization than the total number of licenses?
@z

@x
Currently, we don’t have a way to notify you. However, if the number of team
members exceed the number of licenses, you will receive an error informing you
to contact the administrator due to lack of seats.
@y
Currently, we don’t have a way to notify you. However, if the number of team
members exceed the number of licenses, you will receive an error informing you
to contact the administrator due to lack of seats.
@z

@x
### How can I merge organizations in Docker Hub?
@y
{: #how-can-i-merge-organizations-in-docker-hub }
### How can I merge organizations in Docker Hub?
@z

@x
Reach out to your Support contact if you need to consolidate organizations.
@y
Reach out to your Support contact if you need to consolidate organizations.
@z

@x
### Do organization invitees take up seats?
@y
{: #do-organization-invitees-take-up-seats }
### Do organization invitees take up seats?
@z

@x
Yes. A user invited to an organization will take up one of the provisioned
seats, even if that user hasn’t accepted their invitation yet. Organization
owners can manage the list of invitees through the **Invitees** tab on the organization settings page in Docker Hub.
@y
Yes. A user invited to an organization will take up one of the provisioned
seats, even if that user hasn’t accepted their invitation yet. Organization
owners can manage the list of invitees through the **Invitees** tab on the organization settings page in Docker Hub.
@z

@x
### Do organization owners take a seat?
@y
{: #do-organization-owners-take-a-seat }
### Do organization owners take a seat?
@z

@x
Yes. Organization owners will take up a seat.
@y
Yes. Organization owners will take up a seat.
@z

@x
### If there are two organizations and a user belongs to both orgs, do they take up two seats?
@y
{: #if-there-are-two-organizations-and-a-user-belongs-to-both-orgs-do-they-take-up-two-seats }
### If there are two organizations and a user belongs to both orgs, do they take up two seats?
@z

@x
Yes. In a scenario where a user belongs to two orgs, they take up one seat in each organization.
@y
Yes. In a scenario where a user belongs to two orgs, they take up one seat in each organization.
@z

@x
### Is it possible to set permissions for repositories within an organization?
@y
{: #is-it-possible-to-set-permissions-for-repositories-within-an-organization }
### Is it possible to set permissions for repositories within an organization?
@z

@x
Yes. You can configure repository access on a per-team basis. For example, you
can specify that all teams within an organization have **Read and Write** access
to repositories A and B, whereas only specific teams have **Admin** access. Org
owners have full administrative access to all repositories within the
organization. [Learn more](orgs.md#configure-repository-permissions).
@y
Yes. You can configure repository access on a per-team basis. For example, you
can specify that all teams within an organization have **Read and Write** access
to repositories A and B, whereas only specific teams have **Admin** access. Org
owners have full administrative access to all repositories within the
organization. [Learn more](orgs.md#configure-repository-permissions).
@z

@x
### Can I configure multiple SSO identity providers (IdPs) to authenticate users to a single org?
@y
{: #can-i-configure-multiple-sso-identity-providers-idps-to-authenticate-users-to-a-single-org }
### Can I configure multiple SSO identity providers (IdPs) to authenticate users to a single org?
@z

@x
Docker SSO allows only one IdP configuration per organization. For more
information, see [Configure SSO](../single-sign-on/index.md) and [SSO FAQs](../single-sign-on/faqs.md).
@y
Docker SSO allows only one IdP configuration per organization. For more
information, see [Configure SSO](../single-sign-on/index.md) and [SSO FAQs](../single-sign-on/faqs.md).
@z
