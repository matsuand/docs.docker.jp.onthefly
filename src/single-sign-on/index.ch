%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Single Sign-on
keywords: Single Sign-on, SSO, sign-on
title: Configure Single Sign-on
---
@y
---
description: Single Sign-on
keywords: Single Sign-on, SSO, sign-on
title: シングルサインオンの設定
---
@z

@x
This section is for administrators who want to enable Docker Single Sign-on (SSO) for their businesses. Docker SSO allows users to authenticate using their identity providers (IdPs)  to access Docker. Docker currently supports SAML 2.0 and Azure AD IdPs through Auth0. You can enable SSO on organization's that are part of the Docker Business subscription. To upgrade your existing account to a Docker Business subscription, see [Upgrade your subscription](../subscription/upgrade/){:target="blank" rel="noopener" class=""}.
@y
この節は、Business プランにおいて Docker SSO（Single Sign-on; シングルサインオン）を必要とする管理者向けのものです。
Docker SSO は、Docker へのアクセスにおいて IdPs (identity providers; アイデンティティープロバイダー) を使った認証を求めます。
Docker では今のところ、Auth0 を通じて SAML 2.0 と Azure AD の IdPs をサポートしています。
SSO は Docker Business サブスクリプション内の組織に対して有効にできます。
現アカウントを Business サブスクリプションにアップグレードするには、[サブスクリプションのアップグレード](../subscription/upgrade/){:target="blank" rel="noopener" class=""} を参照してください。
@z

@x
When SSO is enabled, users are redirected to your provider’s authentication page to authenticate using SSO. They cannot authenticate using their personal login credentials (Docker ID and password). Docker currently supports Service Provider Initiated SSO flow. Your users must sign into Docker Hub or Docker Desktop to initiate the SSO authentication process.
@y
SSO が有効であると、ユーザーのアクセスはプロバイダーの認証画面にリダイレクトされて、SSO を使った認証が行われます。
そこでは個人ログイン情報（Docker ID とパスワード）を使った認証はできません。
Docker では現在、Service Provider Initiated SSO フローをサポートしています。
所属ユーザーは SSO 認証プロセスを初期化を通じて Docker Hub や Docker Desktop へサインインすることが必要になります。
@z

@x
Before enabling SSO in Docker Hub, administrators must work with their identity provider to configure their IdP to work with Docker Hub. Docker provides the Assertion Consumer Service (ACS) URL and the Entity ID. Administrators use this information to establish a connection between their IdP server and Docker Hub.
@y
Docker Hub における SSO を有効にするためには、アイデンティティープロバイダーとの間で Docker Hub において用いる IdP が動作するように、管理者があらかじめ設定しておかなければなりません。
Docker では ACS（Assertion Consumer Service）URL とエンティティー ID を提供しています。
管理者はこの情報を用いて、IdP サーバーと Docker Hub 間の接続を構築します。
@z

@x
After establishing the connection between the IdP server and Docker Hub, administrators log into the organization in Docker Hub and complete the SSO enablement process. See the section **Enable SSO in Docker Hub** for detailed instructions.
@y
IdP サーバーと Docker Hub 間の接続を構築したら、Docker Hub 内の組織にログインして、SSO 確立プロセスを完了させます。
詳しい手順は、**Docker Hub における SSO の有効化** の節を参照してください。
@z

@x
To enable SSO in Docker Hub, you need the following information from your identity provider:
@y
Docker Hub において SSO を有効にするには、以下に示すようにプロバイダーから提供される自分のアイデンティティ情報が必要です。
@z

@x
* **SAML 2.0**: Single Sign-On URL and the X.509 signing certificate
* **Azure AD**: Client ID (a unique identifier for your registered AD application), Client Secret (a string used to gain access to your registered Azure AD application), and AD Domain details
@y
* **SAML 2.0** の場合、シングルサインオン URL、X.509 署名証明書
* **Azure AD** の場合、クライアント ID（登録 AD アプリケーションに対する一意な識別子）, クライアントのシークレット（登録 Azure AD アプリケーションへのアクセスを実現するための文字列）, AD ドメインの詳細情報
@z

@x
We currently support enabling SSO on a single organization. However, we do not support single logout. If you have any users in your organization with a different domain (including social domains), they will be added to the organization as guests.
@y
現在のところ SSO の有効化は 1 つの組織についてのみ対応しています。
ただしシングルログアウトには対応していません。
組織内のユーザーが別のドメイン（ソーシャルドメインを含む）にも属している場合、そのユーザーは組織に対してはゲストとして参加することになります。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
* You must first notify your company about the new SSO login procedures
* Verify that your org members have Docker Desktop version 4.4.2 installed on their machines
* New org members must create a PAT to log into the CLI, however existing users can currently use their username and password during the grace period as specified below
* Confirm that all CI/CD pipelines have replaced their passwords with PATs
* For your service accounts, add your additional domains or enable it in your IdP
* Test SSO using your domain email address and IdP password to successfully log in and log out of Docker Hub
@y
* You must first notify your company about the new SSO login procedures
* Verify that your org members have Docker Desktop version 4.4.2 installed on their machines
* New org members must create a PAT to log into the CLI, however existing users can currently use their username and password during the grace period as specified below
* Confirm that all CI/CD pipelines have replaced their passwords with PATs
* For your service accounts, add your additional domains or enable it in your IdP
* Test SSO using your domain email address and IdP password to successfully log in and log out of Docker Hub
@z

@x
## Create a Personal Access Token (PAT)
@y
{: #create-a-personal-access-token-pat }
## パーソナルアクセストークン（PAT）の生成
@z

@x
Before you configure SSO for your organization, new members of your organization must [create an access token](../docker-hub/access-tokens.md) to log into the CLI. There is currently a grace period for existing users, which will expire in the near future. Before the grace period ends, your users will be able to log in from Docker Desktop CLI using their previous credentials until PATs are mandatory.
In addition, all email addresses should be added to your IdP.
@y
Before you configure SSO for your organization, new members of your organization must [create an access token](../docker-hub/access-tokens.md) to log into the CLI. There is currently a grace period for existing users, which will expire in the near future. Before the grace period ends, your users will be able to log in from Docker Desktop CLI using their previous credentials until PATs are mandatory.
In addition, all email addresses should be added to your IdP.
@z

@x
## Configure
@y
{: #configure}
## 設定
@z

@x
To configure SSO, log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} to obtain the **ACS URL** and **Entity IDs** to complete the IdP server configuration process. You can only configure SSO with a single IdP.  When this is complete, log back into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} and complete the SSO enablement process.
@y
To configure SSO, log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} to obtain the **ACS URL** and **Entity IDs** to complete the IdP server configuration process. You can only configure SSO with a single IdP.  When this is complete, log back into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} and complete the SSO enablement process.
@z

@x
> **Important**
>
> If your IdP setup requires an Entity ID and the ACS URL, you must select the
> **SAML** tab in the **Authentication Method** section. For example, if your
> Azure AD setup uses SAML configuration within Azure AD, you must select
> **SAML**. If you are [configuring Open ID Connect with Azure AD](https://docs.microsoft.com/en-us/powerapps/maker/portals/configure/configure-openid-settings){: target="_blank" rel="noopener" class="_"} select **Azure AD** as the
> authentication method. Also, IdP initiated connections are not supported at
> this time.
{: .important}
@y
> **重要**
>
> If your IdP setup requires an Entity ID and the ACS URL, you must select the
> **SAML** tab in the **Authentication Method** section. For example, if your
> Azure AD setup uses SAML configuration within Azure AD, you must select
> **SAML**. If you are [configuring Open ID Connect with Azure AD](https://docs.microsoft.com/en-us/powerapps/maker/portals/configure/configure-openid-settings){: target="_blank" rel="noopener" class="_"} select **Azure AD** as the
> authentication method. Also, IdP initiated connections are not supported at
> this time.
{: .important}
@z

@x
The following video walks you through the process of configuring SSO.
@y
The following video walks you through the process of configuring SSO.
@z

@x
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/QY0j02ggf64" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@y
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/QY0j02ggf64" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@z

@x
### SAML 2.0 IdP configuration
@y
{: #saml-20-idp-configuration }
### SAML 2.0 IdP の設定
@z

@x
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} as an administrator and navigate to **Organizations** and select the organization that you want to enable SSO on.
2. Click **Settings** and select the **Security** tab.
3. Select an authentication method for **SAML 2.0**.
@y
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} as an administrator and navigate to **Organizations** and select the organization that you want to enable SSO on.
2. Click **Settings** and select the **Security** tab.
3. Select an authentication method for **SAML 2.0**.
@z

@x
    ![SSO SAML1](images/sso-saml1.png){:width="500px"}
@y
    ![SSO SAML1](images/sso-saml1.png){:width="500px"}
@z

@x
4. In the Identity Provider Set Up, copy the **Entity ID**, **ACS URL** and **Certificate Download URL**.
@y
4. In the Identity Provider Set Up, copy the **Entity ID**, **ACS URL** and **Certificate Download URL**.
@z

@x
    ![SSO SAML2](images/sso-saml2.png){:width="500px"}
@y
    ![SSO SAML2](images/sso-saml2.png){:width="500px"}
@z

@x
5. Log into your IdP to complete the IdP server configuration process. Refer to your IdP documentation for detailed instructions.
@y
5. Log into your IdP to complete the IdP server configuration process. Refer to your IdP documentation for detailed instructions.
@z

@x
    > **Note:**
    >
    > the NameID is your email address and is set as the default.
    > For example, <Subject><NameID>yourname@mycompany.com</NameID>. We also support the optional `name` attribute. This attribute name must be lower-cased. _The following is an example of this attribute in Okta._
@y
    > **Note:**
    >
    > the NameID is your email address and is set as the default.
    > For example, <Subject><NameID>yourname@mycompany.com</NameID>. We also support the optional `name` attribute. This attribute name must be lower-cased. _The following is an example of this attribute in Okta._
@z

@x
    ![SSO Attribute](images/sso-attribute.png){:width="500px"}
@y
    ![SSO Attribute](images/sso-attribute.png){:width="500px"}
@z

@x
6. Complete the fields in the **Configuration Settings** section and click **Save**. If you want to change your IdP, you must delete your existing provider and configure SSO with your new IdP.
@y
6. Complete the fields in the **Configuration Settings** section and click **Save**. If you want to change your IdP, you must delete your existing provider and configure SSO with your new IdP.
@z

@x
    ![SSO SAML3](images/sso-saml3.png){:width="500px"}
@y
    ![SSO SAML3](images/sso-saml3.png){:width="500px"}
@z

@x
7. Proceed to **add your domain** before you test and enforce SSO.
@y
7. Proceed to **add your domain** before you test and enforce SSO.
@z

@x
### Azure AD IdP configuration with Open ID Connect
@y
{: #azure-ad-idp-configuration-with-open-id-connect }
### Open ID Connect を使った Azure AD IdP の設定
@z

@x
>**Note:**
>
> This section is for users who only want to configure Open ID Connect with
> Azure AD. This connection is a basic OIDC connection, and there are no
> special customizations available when using it.
@y
>**メモ**
>
> This section is for users who only want to configure Open ID Connect with
> Azure AD. This connection is a basic OIDC connection, and there are no
> special customizations available when using it.
@z

@x
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} as an administrator and navigate to **Organizations** and select the organization that you want to enable SSO on.
2. Click **Settings** and select the **Security** tab.
3. Select an authentication method for **Azure AD**.
@y
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} as an administrator and navigate to **Organizations** and select the organization that you want to enable SSO on.
2. Click **Settings** and select the **Security** tab.
3. Select an authentication method for **Azure AD**.
@z

@x
    ![SSO Azure1](images/sso-azure1.png){:width="500px"}
@y
    ![SSO Azure1](images/sso-azure1.png){:width="500px"}
@z

@x
4. In the Identity Provider Set Up, copy the **Redirect URL / Reply URL**.
@y
4. In the Identity Provider Set Up, copy the **Redirect URL / Reply URL**.
@z

@x
    ![SSO Azure2](images/sso-azure2.png){:width="500px"}
@y
    ![SSO Azure2](images/sso-azure2.png){:width="500px"}
@z

@x
5. Log into your IdP to complete the IdP server configuration process. Refer to your IdP documentation for detailed instructions.
@y
5. Log into your IdP to complete the IdP server configuration process. Refer to your IdP documentation for detailed instructions.
@z

@x
    > **Note:**
    > the NameID is your email address and is set as the default.
    > For example: <Subject><NameID>yourname@mycompany.com</NameID>.
@y
    > **Note:**
    > the NameID is your email address and is set as the default.
    > For example: <Subject><NameID>yourname@mycompany.com</NameID>.
@z

@x
6. Complete the fields in the **Configuration Settings** section and click **Save**. If you want to change your IdP, you must delete your existing provider and configure SSO with your new IdP.
@y
6. Complete the fields in the **Configuration Settings** section and click **Save**. If you want to change your IdP, you must delete your existing provider and configure SSO with your new IdP.
@z

@x
    ![SSO Azure3](images/sso-azure3.png){:width="500px"}
@y
    ![SSO Azure3](images/sso-azure3.png){:width="500px"}
@z

@x
7. Proceed to **add your domain** before you test and enforce SSO.
@y
7. Proceed to **add your domain** before you test and enforce SSO.
@z

@x
### Domain control
@y
{: #domain-control }
### ドメインの制御
@z

@x
Click **Add Domain** and specify the corporate domain you’d like to manage with SSO. Domains should be formatted without protocol or www information, for example, yourcompany.com. Docker currently supports one email domain for each organization.
@y
Click **Add Domain** and specify the corporate domain you’d like to manage with SSO. Domains should be formatted without protocol or www information, for example, yourcompany.com. Docker currently supports one email domain for each organization.
@z

@x
> **Note**
>
> This should include all email domains and sub-domains users will use to access Docker.
> Public domains such as gmail.com, outlook.com, etc are not permitted.
> Also, the email domain should be set as the primary email.
@y
> **Note**
>
> This should include all email domains and sub-domains users will use to access Docker.
> Public domains such as gmail.com, outlook.com, etc are not permitted.
> Also, the email domain should be set as the primary email.
@z

@x
![SSO Domain](images/sso-domain.png){:width="500px"}
@y
![SSO Domain](images/sso-domain.png){:width="500px"}
@z

@x
### Domain verification
@y
{: #domain-verification }
### ドメインの確認
@z

@x
To verify ownership of a domain, add a TXT record to your Domain Name System (DNS) settings.
@y
To verify ownership of a domain, add a TXT record to your Domain Name System (DNS) settings.
@z

@x
1. Copy the provided TXT record value and navigate to your DNS host and locate the **Settings** page to add a new record.
2. Select the option to add a new record and paste the TXT record value into the applicable field. For example, the **Value**, **Answer** or **Description** field.
@y
1. Copy the provided TXT record value and navigate to your DNS host and locate the **Settings** page to add a new record.
2. Select the option to add a new record and paste the TXT record value into the applicable field. For example, the **Value**, **Answer** or **Description** field.
@z

@x
    Your DNS record may have the following fields:
    * Record type: enter your 'TXT' record value
    * Name/Host/Alias: leave the default (@ or blank)
    * Time to live (TTL): enter **86400**
@y
    Your DNS record may have the following fields:
    * Record type: enter your 'TXT' record value
    * Name/Host/Alias: leave the default (@ or blank)
    * Time to live (TTL): enter **86400**
@z

@x
3. After you have updated the fields, click **Save**.
@y
3. After you have updated the fields, click **Save**.
@z

@x
    > **Note:**
    >
    > It can take up to 72 hours for DNS changes to take effect, depending on
    > your DNS host. The Domains table will have an Unverified status during
    > this time.
@y
    > **Note:**
    >
    > It can take up to 72 hours for DNS changes to take effect, depending on
    > your DNS host. The Domains table will have an Unverified status during
    > this time.
@z

@x
4. In the Security section of your Docker organization, click **Verify** next to the domain you want to verify after 72 hours.
@y
4. In the Security section of your Docker organization, click **Verify** next to the domain you want to verify after 72 hours.
@z

@x
## Test your SSO configuration
@y
{: #test-your-sso-configuration }
## SSO 設定のテスト
@z

@x
After you’ve completed the SSO configuration process in Docker Hub, you can test the configuration when you log into Docker Hub using an incognito browser. Login using your domain email address and IdP password.  You will then get redirected to your identity provider’s login page to authenticate.
@y
After you’ve completed the SSO configuration process in Docker Hub, you can test the configuration when you log into Docker Hub using an incognito browser. Login using your domain email address and IdP password.  You will then get redirected to your identity provider’s login page to authenticate.
@z

@x
1. Authenticate via email instead of using your Docker ID, and test the login process.
2. To authenticate via CLI, your users must have a PAT before you enforce SSO for CLI users.
@y
1. Authenticate via email instead of using your Docker ID, and test the login process.
2. To authenticate via CLI, your users must have a PAT before you enforce SSO for CLI users.
@z

@x
## Enforce SSO in Docker Hub
@y
{: #enforce-sso-in-docker-hub }
## Docker Hub における強制的な SSO
@z

@x
Before you enforce SSO in Docker Hub, you must complete the following:
Test SSO by logging in and out successfully, confirm that all members in your org have upgraded to Docker Desktop version 4.4.2, PATs are created for each member, CI/CD passwords are converted to PAT. Also, when using Docker partner products (for example, VS Code), you must use a PAT when you enforce SSO. For your service accounts add your additional domains in **Add Domains** or enable the accounts in your IdP.
@y
Before you enforce SSO in Docker Hub, you must complete the following:
Test SSO by logging in and out successfully, confirm that all members in your org have upgraded to Docker Desktop version 4.4.2, PATs are created for each member, CI/CD passwords are converted to PAT. Also, when using Docker partner products (for example, VS Code), you must use a PAT when you enforce SSO. For your service accounts add your additional domains in **Add Domains** or enable the accounts in your IdP.
@z

@x
Admins can force users to authenticate with Docker Desktop by provisioning a registry.json configuration file. The registry.json file will force users to authenticate as a user that is configured in the allowedOrgs list in the registry.json file. For info on how to configure a registry.json file see [Configure registry.json](../docker-hub/image-access-management.md#enforce-authentication)
@y
Admins can force users to authenticate with Docker Desktop by provisioning a registry.json configuration file. The registry.json file will force users to authenticate as a user that is configured in the allowedOrgs list in the registry.json file. For info on how to configure a registry.json file see [Configure registry.json](../docker-hub/image-access-management.md#enforce-authentication)
@z

@x
1. On the Single Sign-On page in Docker Hub, click **Turn ON Enforcement** to enable your SSO.
2. When SSO is enforced, your members are unable to modify their email address and password, convert a user account to an organization, or set up 2FA through Docker Hub. You must enable 2FA through your IdP.
@y
1. On the Single Sign-On page in Docker Hub, click **Turn ON Enforcement** to enable your SSO.
2. When SSO is enforced, your members are unable to modify their email address and password, convert a user account to an organization, or set up 2FA through Docker Hub. You must enable 2FA through your IdP.
@z

@x
> **Note:**
>
> If you want to turn off SSO and revert back to Docker’s built-in
> authentication, click **Turn OFF Enforcement**. Your members aren’t
> forced to authenticate through your IdP and can log into Docker using
> their personal credentials.
@y
> **Note:**
>
> If you want to turn off SSO and revert back to Docker’s built-in
> authentication, click **Turn OFF Enforcement**. Your members aren’t
> forced to authenticate through your IdP and can log into Docker using
> their personal credentials.
@z

@x
![SSO Enforced](images/sso-enforce.png){:width="500px"}
@y
![SSO Enforced](images/sso-enforce.png){:width="500px"}
@z

@x
## Manage users when SSO is enabled
@y
{: #manage-users-when-sso-is-enabled }
## SSO 有効時のユーザー管理
@z

@x
To add a member to your organization:
1. Create an account for your members in your IdP.
2. Add and invite your members to your organization.
@y
To add a member to your organization:
1. Create an account for your members in your IdP.
2. Add and invite your members to your organization.
@z

@x
 > **Note:**
 >
 > when the first-time user logs into Docker using their domain email
 > address, they are then added to your organization.
@y
 > **Note:**
 >
 > when the first-time user logs into Docker using their domain email
 > address, they are then added to your organization.
@z

@x
To add a guest to your organization in Docker Hub if they aren’t verified through your IdP:
@y
To add a guest to your organization in Docker Hub if they aren’t verified through your IdP:
@z

@x
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Click **Add Member**, enter the email address, and select a team from the drop-down list.
3. Click **Add** to confirm.
@y
1. Go to **Organizations** in Docker Hub, and select your organization.
2. Click **Add Member**, enter the email address, and select a team from the drop-down list.
3. Click **Add** to confirm.
@z

@x
## Remove members from the SSO organization
@y
{: #remove-members-from-the-sso-organization }
## SSO 組織からのメンバー削除
@z

@x
To remove a member from an organization:
@y
To remove a member from an organization:
@z

@x
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} as an administrator of your organization.
2. Select the organization from the list. The organization page displays a list of members.
2. Click the **x** next to a member’s name to remove them from all the teams in the organization.
3. Click **Remove** to confirm. The member will receive an email notification confirming the removal.
@y
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} as an administrator of your organization.
2. Select the organization from the list. The organization page displays a list of members.
2. Click the **x** next to a member’s name to remove them from all the teams in the organization.
3. Click **Remove** to confirm. The member will receive an email notification confirming the removal.
@z

@x
> **Note:**
>
> when you remove a member from an SSO organization, they are unable to log
> in using their email address.
@y
> **Note:**
>
> when you remove a member from an SSO organization, they are unable to log
> in using their email address.
@z

@x
## FAQs
To learn more see our [FAQs](faqs.md).
@y
{: #faqs }
## FAQ
To learn more see our [FAQs](faqs.md).
@z

@x
## Deleting SSO
@y
{: #deleting-sso }
## SSO の削除
@z

@x
When you disable SSO, you can delete the connection to remove the configuration settings and the added domains. Once you delete this connection, it cannot be undone. Users must authenticate with their Docker ID and password or create a password reset if they do not have one.
@y
When you disable SSO, you can delete the connection to remove the configuration settings and the added domains. Once you delete this connection, it cannot be undone. Users must authenticate with their Docker ID and password or create a password reset if they do not have one.
@z

@x
![Delete SSO](images/delete-sso.png){:width="500px"}
@y
![Delete SSO](images/delete-sso.png){:width="500px"}
@z
