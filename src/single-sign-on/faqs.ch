%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Single Sign-on FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on
title: Single Sign-on FAQs
toc_max: 2
---
@y
---
description: Single Sign-on FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on
title: Single Sign-on FAQs
toc_max: 2
---
@z

@x
## General SSO overview
@y
## General SSO overview
@z

@x
### Q: Is Docker SSO available for all paid subscriptions?
@y
### Q: Is Docker SSO available for all paid subscriptions?
@z

@x
Docker Single Sign-on (SSO) is only available with the Docker Business subscription. Upgrade your existing subscription to start using Docker SSO.
@y
Docker Single Sign-on (SSO) is only available with the Docker Business subscription. Upgrade your existing subscription to start using Docker SSO.
@z

@x
### Q: How does Docker SSO work?
@y
### Q: How does Docker SSO work?
@z

@x
Docker Single Sign-on (SSO) allows users to authenticate using their identity providers (IdPs) to access Docker. Docker currently supports Azure AD and any SAML 2.0 identity providers. When you enable SSO, users are redirected to your provider’s authentication page to authenticate using their email and password.
@y
Docker Single Sign-on (SSO) allows users to authenticate using their identity providers (IdPs) to access Docker. Docker currently supports Azure AD and any SAML 2.0 identity providers. When you enable SSO, users are redirected to your provider’s authentication page to authenticate using their email and password.
@z

@x
### Q: What SSO flows are supported by Docker?
@y
### Q: What SSO flows are supported by Docker?
@z

@x
Docker currently supports Service Provider Initiated (SP-initiated) SSO flow. This means users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@y
Docker currently supports Service Provider Initiated (SP-initiated) SSO flow. This means users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@z

@x
### Q: Where can I find detailed instructions on how to configure Docker SSO?
@y
### Q: Where can I find detailed instructions on how to configure Docker SSO?
@z

@x
You first need to establish an SSO connection with your identity provider, and the company email domain needs to be verified prior to SSO enforcement for your users. For detailed step-by-step instructions on how to configure Docker SSO, see [Single Sign-on](index.md).
@y
You first need to establish an SSO connection with your identity provider, and the company email domain needs to be verified prior to SSO enforcement for your users. For detailed step-by-step instructions on how to configure Docker SSO, see [Single Sign-on](index.md).
@z

@x
### Q: Does Docker SSO support multi-factor authentication (MFA)?
@y
### Q: Does Docker SSO support multi-factor authentication (MFA)?
@z

@x
When an organization uses SSO, MFA is determined on the IdP level, not on the Docker platform.
@y
When an organization uses SSO, MFA is determined on the IdP level, not on the Docker platform.
@z

@x
### Q: Do I need a specific version of Docker Desktop for SSO?
@y
### Q: Do I need a specific version of Docker Desktop for SSO?
@z

@x
Yes, all users in your organization must upgrade to Docker Desktop version 4.4.0 or higher. Users on older versions of Docker Desktop will not be able to sign in after enforcing SSO if the company domain email is used to log in or as the primary email associated with an existing Docker account Your users with existing accounts cannot sign in with their username and password.
@y
Yes, all users in your organization must upgrade to Docker Desktop version 4.4.0 or higher. Users on older versions of Docker Desktop will not be able to sign in after enforcing SSO if the company domain email is used to log in or as the primary email associated with an existing Docker account Your users with existing accounts cannot sign in with their username and password.
@z

@x
### Q: Is there a way to test this functionality in a test tenant with Okta before going to production?
@y
### Q: Is there a way to test this functionality in a test tenant with Okta before going to production?
@z

@x
You can create a test organization. Companies can set up a new five-seat Business Plan on a new organization to test with (making sure you enable SSO only, if you enforce it, all domain email users will be forced to sign in to that test tenant).
@y
You can create a test organization. Companies can set up a new five-seat Business Plan on a new organization to test with (making sure you enable SSO only, if you enforce it, all domain email users will be forced to sign in to that test tenant).
@z

@x
## SAML SSO
@y
## SAML SSO
@z

@x
### Q: Does SAML authentication require additional attributes?
@y
### Q: Does SAML authentication require additional attributes?
@z

@x
You must provide an email address as an attribute to authenticate via SAML. The ‘Name’ attribute is currently optional.
@y
You must provide an email address as an attribute to authenticate via SAML. The ‘Name’ attribute is currently optional.
@z

@x
### Q: Does the application recognize the NameID/Unique Identifier in the SAMLResponse Subject?
@y
### Q: Does the application recognize the NameID/Unique Identifier in the SAMLResponse Subject?
@z

@x
The preferred format is your email address, which should also be your Name ID.
@y
The preferred format is your email address, which should also be your Name ID.
@z

@x
### Q: When SAML SSO is enforced, at what stage is the login required to be tracked through SAML? At runtime or install time?
@y
### Q: When SAML SSO is enforced, at what stage is the login required to be tracked through SAML? At runtime or install time?
@z

@x
At runtime for Docker Desktop if it’s configured to require authentication to the organization.
@y
At runtime for Docker Desktop if it’s configured to require authentication to the organization.
@z

@x
### Q: How long is the grace-period for using regular user id and password for the docker desktop itself regardless of the enforced SSO?
@y
### Q: How long is the grace-period for using regular user id and password for the docker desktop itself regardless of the enforced SSO?
@z

@x
Currently, we do not have a date on when the grace-period will end.
@y
Currently, we do not have a date on when the grace-period will end.
@z

@x
### Q: Do you have any information on how to use the Docker Desktop application in accordance with the SSO users we provide? How can we verify that we are handling the licensing correctly?
@y
### Q: Do you have any information on how to use the Docker Desktop application in accordance with the SSO users we provide? How can we verify that we are handling the licensing correctly?
@z

@x
Verify that your users have downloaded the latest version of Docker Desktop. We will be enhancing user management observability and capabilities in the near future.
@y
Verify that your users have downloaded the latest version of Docker Desktop. We will be enhancing user management observability and capabilities in the near future.
@z

@x
## Docker org and Docker ID
@y
## Docker org and Docker ID
@z

@x
### Q: What’s a Docker ID? Can I retain my Docker ID when using SSO?
@y
### Q: What’s a Docker ID? Can I retain my Docker ID when using SSO?
@z

@x
For a personal Docker ID, a user is the account owner, it’s associated with access to the user's repositories, images, assets. An end user can choose to have a company domain email on the Docker account, when SSO is enforced, the account will be tied to the organization account. Alternatively, when SSO is enforced for a company organization, any user logging in without an existing account using verified company domain email will automatically have an account provisioned, and a new Docker ID created.
@y
For a personal Docker ID, a user is the account owner, it’s associated with access to the user's repositories, images, assets. An end user can choose to have a company domain email on the Docker account, when SSO is enforced, the account will be tied to the organization account. Alternatively, when SSO is enforced for a company organization, any user logging in without an existing account using verified company domain email will automatically have an account provisioned, and a new Docker ID created.
@z

@x
### Q: What if the Docker ID I want for my org  is taken?
@y
### Q: What if the Docker ID I want for my org  is taken?
@z

@x
This depends on the state of the namespace, if trademark claims exist for the Organization Docker ID, a manual flow for legal review is required.
@y
This depends on the state of the namespace, if trademark claims exist for the Organization Docker ID, a manual flow for legal review is required.
@z

@x
### Q: What if I want to create more than 3 organizations?
@y
### Q: What if I want to create more than 3 organizations?
@z

@x
You can create multiple organizations or multiple teams under a single organization. If you intend to enforce SSO, SSO is currently only available for a single org with a single identity provider.
@y
You can create multiple organizations or multiple teams under a single organization. If you intend to enforce SSO, SSO is currently only available for a single org with a single identity provider.
@z

@x
### Q: If I have multiple orgs how will that affect my org if they are all connected to the same  domain?
@y
### Q: If I have multiple orgs how will that affect my org if they are all connected to the same  domain?
@z

@x
We are currently limited in supporting such a setup, and would recommend setting up different teams under the same org if you plan to enforce SSO and only have one email domain.
@y
We are currently limited in supporting such a setup, and would recommend setting up different teams under the same org if you plan to enforce SSO and only have one email domain.
@z

@x
## Identity providers
@y
## Identity providers
@z

@x
### Q: Is it possible to use more than one IdP with Docker SSO?
@y
### Q: Is it possible to use more than one IdP with Docker SSO?
@z

@x
No. You can only configure Docker SSO to work with a single IdP. A domain can only be associated with a single IdP. Docker currently supports Azure AD and identity providers that support SAML 2.0.
@y
No. You can only configure Docker SSO to work with a single IdP. A domain can only be associated with a single IdP. Docker currently supports Azure AD and identity providers that support SAML 2.0.
@z

@x
### Q Is it possible to change my identity provider after configuring SSO?
@y
### Q Is it possible to change my identity provider after configuring SSO?
@z

@x
Yes. You must delete your existing IdP configuration in Docker Hub and follow the instructions to Configure SSO using your IdP. If you had already turned on enforcement, you should turn off enforcement before updating the provider SSO connection.
@y
Yes. You must delete your existing IdP configuration in Docker Hub and follow the instructions to Configure SSO using your IdP. If you had already turned on enforcement, you should turn off enforcement before updating the provider SSO connection.
@z

@x
### Q: What information do I need from my Identity providers to configure SSO?
@y
### Q: What information do I need from my Identity providers to configure SSO?
@z

@x
To enable SSO in Docker, you need the following from your IdP:
@y
To enable SSO in Docker, you need the following from your IdP:
@z

@x
* **SAML**: Entity ID, ACS URL, Single Logout URL and the public X.509 certificate
@y
* **SAML**: Entity ID, ACS URL, Single Logout URL and the public X.509 certificate
@z

@x
* **Azure AD**: Client ID, Client Secret, AD Domain.
@y
* **Azure AD**: Client ID, Client Secret, AD Domain.
@z

@x
### Q: What happens if my existing certificate expires?
@y
### Q: What happens if my existing certificate expires?
@z

@x
If your existing certificate has expired, you may need to contact your identity provider to retrieve a new x509 certificate. The new certificate must be updated in the SSO configuration settings page on Docker Hub.
@y
If your existing certificate has expired, you may need to contact your identity provider to retrieve a new x509 certificate. The new certificate must be updated in the SSO configuration settings page on Docker Hub.
@z

@x
### Q: What happens if my IdP goes down when SSO is enabled?
@y
### Q: What happens if my IdP goes down when SSO is enabled?
@z

@x
It is not possible to access Docker Hub when your IdP is down. However, you can access Docker Hub images from the CLI using your Personal Access Token. Or, if you had an existing account before the SSO enforcement, you can use your username and password to access Docker Hub images during the grace period for your organization.
@y
It is not possible to access Docker Hub when your IdP is down. However, you can access Docker Hub images from the CLI using your Personal Access Token. Or, if you had an existing account before the SSO enforcement, you can use your username and password to access Docker Hub images during the grace period for your organization.
@z

@x
### Q: What happens when I turn off SSO for my organization?
@y
### Q: What happens when I turn off SSO for my organization?
@z

@x
When you turn off SSO, authentication through your Identity Provider will no longer be required to access Docker. Users may continue to log in through Single Sign-On as well as Docker ID and password.
@y
When you turn off SSO, authentication through your Identity Provider will no longer be required to access Docker. Users may continue to log in through Single Sign-On as well as Docker ID and password.
@z

@x
### Q: How do I handle accounts using Docker Hub as a secondary registry? Do I need a bot account?
@y
### Q: How do I handle accounts using Docker Hub as a secondary registry? Do I need a bot account?
@z

@x
You can add a bot account to your IDP and create an access token for it to replace the other credentials.
@y
You can add a bot account to your IDP and create an access token for it to replace the other credentials.
@z

@x
### Q: Does Docker plan to release SAML just in time provisioning?
@y
### Q: Does Docker plan to release SAML just in time provisioning?
@z

@x
Our SSO implementation is already "just in time". Admins don't have to create users’ accounts on Hub, they can just enable it on the IdP and have the users log in via their domain email on Hub.
@y
Our SSO implementation is already "just in time". Admins don't have to create users’ accounts on Hub, they can just enable it on the IdP and have the users log in via their domain email on Hub.
@z

@x
### Q: Will there be IdP initiated logins? Does Docker plan to support SSO logins outside of Hub and Desktop?
@y
### Q: Will there be IdP initiated logins? Does Docker plan to support SSO logins outside of Hub and Desktop?
@z

@x
We currently do have any plans to enable IdP initiated logins.
@y
We currently do have any plans to enable IdP initiated logins.
@z

@x
### Q: Build agents - For customers using SSO, do they need to create a bot account to fill a seat within the dockerorg?
@y
### Q: Build agents - For customers using SSO, do they need to create a bot account to fill a seat within the dockerorg?
@z

@x
Yes, generally bot accounts need to be a seat, similar to a regular end user, having a non-aliased domain email enabled in the IdP and using a seat in Hub.
@y
Yes, generally bot accounts need to be a seat, similar to a regular end user, having a non-aliased domain email enabled in the IdP and using a seat in Hub.
@z

@x
### Q: Is it possible to connect Docker Hub directly with a Microsoft Azure Active Directory Group?
@y
### Q: Is it possible to connect Docker Hub directly with a Microsoft Azure Active Directory Group?
@z

@x
Yes, Azure AD is supported with SSO for Docker Business, both via a direct integration and via SAML.
@y
Yes, Azure AD is supported with SSO for Docker Business, both via a direct integration and via SAML.
@z

@x
## Adding domain and domain verification
@y
## Adding domain and domain verification
@z

@x
### Q: What should I do if I reach the character limits when adding the txt record for my domain?
@y
### Q: What should I do if I reach the character limits when adding the txt record for my domain?
@z

@x
Yes, you can add sub-domains to your SSO , however all email addresses should also be on that domain. Verify that your DNS provider supports multiple txt fields for the same domain.
@y
Yes, you can add sub-domains to your SSO , however all email addresses should also be on that domain. Verify that your DNS provider supports multiple txt fields for the same domain.
@z

@x
### Q: Can the DNS provider configure it once for one-time verification and remove it later OR will it be needed permanently?
@y
### Q: Can the DNS provider configure it once for one-time verification and remove it later OR will it be needed permanently?
@z

@x
They can do it one time to add it to a connection. If they ever change idPs and have to set up SSO again, they will need to verify again.
@y
They can do it one time to add it to a connection. If they ever change idPs and have to set up SSO again, they will need to verify again.
@z

@x
### Q: Is adding Domain required to configure SSO? What domains should I be adding? And how do I add it?
@y
### Q: Is adding Domain required to configure SSO? What domains should I be adding? And how do I add it?
@z

@x
Adding and verifying Domain is required to enable and enforce SSO. Click Add Domain and specify the email domains that are allowed to authenticate via your server. This should include all email domains users will use to access Docker. Public domains are not permitted, such as gmail.com, outlook.com, etc. Also, the email domain should be set as the primary email.
@y
Adding and verifying Domain is required to enable and enforce SSO. Click Add Domain and specify the email domains that are allowed to authenticate via your server. This should include all email domains users will use to access Docker. Public domains are not permitted, such as gmail.com, outlook.com, etc. Also, the email domain should be set as the primary email.
@z

@x
### Q: If users are using their personal email, do they have to convert to using the Org’s domain before they can be invited to join an Org? Is this just a quick change in their Hub account?
@y
### Q: If users are using their personal email, do they have to convert to using the Org’s domain before they can be invited to join an Org? Is this just a quick change in their Hub account?
@z

@x
No, they do not. Though they can add multiple emails to a Docker ID if they choose to. However, that email can only be used once across Docker. The other thing to note is that (as of January 2022) SSO will not work for multi domains as an MVP and it will not work for personal emails either.
@y
No, they do not. Though they can add multiple emails to a Docker ID if they choose to. However, that email can only be used once across Docker. The other thing to note is that (as of January 2022) SSO will not work for multi domains as an MVP and it will not work for personal emails either.
@z

@x
### Q: Since Docker ID is tracked from SAML, at what point is the login required to be tracked from SAML? Runtime or install time?
@y
### Q: Since Docker ID is tracked from SAML, at what point is the login required to be tracked from SAML? Runtime or install time?
@z

@x
Runtime for Docker Desktop if they configure Docker Desktop to require authentication to their org.
@y
Runtime for Docker Desktop if they configure Docker Desktop to require authentication to their org.
@z

@x
### Q: Do you support IdP-initiated authentication (e.g., Okta tile support)?
@y
### Q: Do you support IdP-initiated authentication (e.g., Okta tile support)?
@z

@x
We do not support IdP-initiated authentication. Users must initiate login through Docker Desktop or Hub.
@y
We do not support IdP-initiated authentication. Users must initiate login through Docker Desktop or Hub.
@z

@x
## SSO enforcement
@y
## SSO enforcement
@z

@x
### Q: Can I enable SSO in all organizations?
@y
### Q: Can I enable SSO in all organizations?
@z

@x
You can enable SSO on organizations that are part of the Docker Business subscription.
@y
You can enable SSO on organizations that are part of the Docker Business subscription.
@z

@x
### Q: We currently have a Docker Team subscription. How do we enable SSO?
@y
### Q: We currently have a Docker Team subscription. How do we enable SSO?
@z

@x
Docker SSO is available with a Docker Business subscription. To enable SSO, you must first upgrade your subscription to a Docker Business subscription. To learn how to upgrade your existing account, see [Upgrade your subscription](https://www.docker.com/pricing).
@y
Docker SSO is available with a Docker Business subscription. To enable SSO, you must first upgrade your subscription to a Docker Business subscription. To learn how to upgrade your existing account, see [Upgrade your subscription](https://www.docker.com/pricing).
@z

@x
### Q: How do service accounts work with SSO?
@y
### Q: How do service accounts work with SSO?
@z

@x
Service accounts work like any other user when SSO is turned on. If the service account is using an email for a domain with SSO turned on, it needs a PAT for CLI and API usage.
@y
Service accounts work like any other user when SSO is turned on. If the service account is using an email for a domain with SSO turned on, it needs a PAT for CLI and API usage.
@z

@x
### Q: Is DNS verification required to enable SSO?
@y
### Q: Is DNS verification required to enable SSO?
@z

@x
Yes. You must verify a domain before using it with an SSO connection.
@y
Yes. You must verify a domain before using it with an SSO connection.
@z

@x
### Q: Does Docker SSO support authenticating through the command line?
@y
### Q: Does Docker SSO support authenticating through the command line?
@z

@x
Yes. When SSO is enabled, you can access the Docker CLI through Personal Access Tokens (PATs).  Each user must create a PAT to access the CLI. To learn how to create a PAT, see [Manage access tokens](../docker-hub/access-tokens.md). Before we transition to PATs, CLI users can continue logging in using their personal credentials until early next year to mitigate the risk of interrupting CI/CD pipelines.
@y
Yes. When SSO is enabled, you can access the Docker CLI through Personal Access Tokens (PATs).  Each user must create a PAT to access the CLI. To learn how to create a PAT, see [Manage access tokens](../docker-hub/access-tokens.md). Before we transition to PATs, CLI users can continue logging in using their personal credentials until early next year to mitigate the risk of interrupting CI/CD pipelines.
@z

@x
### Q: How does SSO affect our automation systems and CI/CD pipelines?
@y
### Q: How does SSO affect our automation systems and CI/CD pipelines?
@z

@x
Before enforcing SSO, you must create PATs for automation systems and CI/CD pipelines and use the tokens instead of a password.
@y
Before enforcing SSO, you must create PATs for automation systems and CI/CD pipelines and use the tokens instead of a password.
@z

@x
### Q: I have a user working on projects within Docker Desktop but authenticated with personal or no email. After they purchase Docker Business licenses, they will implement and enforce SSO via Okta to manage their users. When this user signs on SSO, is their work on DD compromised/impacted with the migration to the new account?
@y
### Q: I have a user working on projects within Docker Desktop but authenticated with personal or no email. After they purchase Docker Business licenses, they will implement and enforce SSO via Okta to manage their users. When this user signs on SSO, is their work on DD compromised/impacted with the migration to the new account?
@z

@x
If they already have their organization email on their account, then it will be migrated to SSO.
@y
If they already have their organization email on their account, then it will be migrated to SSO.
@z

@x
### Q: If an organization enables SSO, the owners can control Docker IDs associated with their work email domain. Some of these Docker IDs will not be users of Docker Desktop and therefore don't require a Business subscription. Can the owners choose which Docker IDs they add to their Docker org and get access to Business features? Is there a way to flag which of these Docker IDs are Docker Desktop users?
@y
### Q: If an organization enables SSO, the owners can control Docker IDs associated with their work email domain. Some of these Docker IDs will not be users of Docker Desktop and therefore don't require a Business subscription. Can the owners choose which Docker IDs they add to their Docker org and get access to Business features? Is there a way to flag which of these Docker IDs are Docker Desktop users?
@z

@x
SSO enforcement will apply to any domain email user, and automatically add that user to the Docker Hub org that enables enforcement. The admin could remove users from the org manually, but those users wouldn't be able to authenticate if SSO is enforced.
@y
SSO enforcement will apply to any domain email user, and automatically add that user to the Docker Hub org that enables enforcement. The admin could remove users from the org manually, but those users wouldn't be able to authenticate if SSO is enforced.
@z

@x
### Q: Can I enable SSO and hold off on the domain verification and enforcement options?
@y
### Q: Can I enable SSO and hold off on the domain verification and enforcement options?
@z

@x
Yes, they can choose to not enforce, and users have the option to use either Docker ID (standard email/password) or email address (SSO) at the sign-in screen.
@y
Yes, they can choose to not enforce, and users have the option to use either Docker ID (standard email/password) or email address (SSO) at the sign-in screen.
@z

@x
### Q: We have enforced SSO, but one of our users is connected to several organizations (and several email-addresses) and is able to bypass SSO and login via userid and password. Why is this happening?
@y
### Q: We have enforced SSO, but one of our users is connected to several organizations (and several email-addresses) and is able to bypass SSO and login via userid and password. Why is this happening?
@z

@x
They can bypass SSO if the email they are using to log in doesn't match the organization email being used when SSO is enforced.
@y
They can bypass SSO if the email they are using to log in doesn't match the organization email being used when SSO is enforced.
@z

@x
### Q: Is there a way to test this functionality in a test tenant with Okta before going to production?
@y
### Q: Is there a way to test this functionality in a test tenant with Okta before going to production?
@z

@x
Yes, you can create a test organization. Companies can set up a new 5 seat Business plan on a new organization to test with (making sure to only enable SSO, not enforce it or all domain email users will be forced to sign in to that test tenant).
@y
Yes, you can create a test organization. Companies can set up a new 5 seat Business plan on a new organization to test with (making sure to only enable SSO, not enforce it or all domain email users will be forced to sign in to that test tenant).
@z

@x
### Q: Once we enable SSO for Docker Desktop, what is the impact to the flow for Build systems that use service accounts?
@y
### Q: Once we enable SSO for Docker Desktop, what is the impact to the flow for Build systems that use service accounts?
@z

@x
If SSO is enabled, there is no impact for now. We'll continue to support either username/password or personal access token sign-in.
However, if you **enforce** SSO:
@y
If SSO is enabled, there is no impact for now. We'll continue to support either username/password or personal access token sign-in.
However, if you **enforce** SSO:
@z

@x
* Service Account domain email addresses must be unaliased and enabled in their IdP
* Username/password and personal access token will still work (but only if they exist, which they won't for new accounts)
* Those who know the IdP credentials can sign in as that Service Account via SSO on Hub and create or change the personal access token for that service account.
@y
* Service Account domain email addresses must be unaliased and enabled in their IdP
* Username/password and personal access token will still work (but only if they exist, which they won't for new accounts)
* Those who know the IdP credentials can sign in as that Service Account via SSO on Hub and create or change the personal access token for that service account.
@z

@x
## Managing users
@y
## Managing users
@z

@x
### Q: How do I manage users when using SSO?
@y
### Q: How do I manage users when using SSO?
@z

@x
Users are managed through organizations in Docker Hub. When you configure SSO in Docker, you need to make sure an account exists for each user in your IdP account. When a user signs into Docker for the first time using their domain email address, they will be automatically added to the organization after a successful authentication.
@y
Users are managed through organizations in Docker Hub. When you configure SSO in Docker, you need to make sure an account exists for each user in your IdP account. When a user signs into Docker for the first time using their domain email address, they will be automatically added to the organization after a successful authentication.
@z

@x
### Q: Do I need to manually add users to my organization?
@y
### Q: Do I need to manually add users to my organization?
@z

@x
No, you don’t need to manually add users to your organization in Docker Hub. You just need to make sure an account for your users exists in your IdP and then invite them to your organization using the Invite Member option in Docker Hub.
@y
No, you don’t need to manually add users to your organization in Docker Hub. You just need to make sure an account for your users exists in your IdP and then invite them to your organization using the Invite Member option in Docker Hub.
@z

@x
When a user signs into Docker for the first time using their domain email address, they will be automatically added to the organization after a successful authentication.
@y
When a user signs into Docker for the first time using their domain email address, they will be automatically added to the organization after a successful authentication.
@z

@x
### Q: Can users in my organization use different email addresses to authenticate via SSO?
@y
### Q: Can users in my organization use different email addresses to authenticate via SSO?
@z

@x
During the SSO setup, you’ll have to specify the company email domains that are allowed to authenticate. All users in your organization must authenticate using the email domain specified during SSO setup. Some of your users may want to maintain a different account for their personal projects.
@y
During the SSO setup, you’ll have to specify the company email domains that are allowed to authenticate. All users in your organization must authenticate using the email domain specified during SSO setup. Some of your users may want to maintain a different account for their personal projects.
@z

@x
Users with a public domain email address will be added as guests.
@y
Users with a public domain email address will be added as guests.
@z

@x
### Q: Can Docker Org Owners/Admins approve users to an organization and use a seat, rather than having them automatically added when SSO Is enabled?
@y
### Q: Can Docker Org Owners/Admins approve users to an organization and use a seat, rather than having them automatically added when SSO Is enabled?
@z

@x
Admins and organization owners can currently approve users by configuring their permissions through their IdP. That is, if the user account is configured in the IdP, the user will be automatically added to the organization in Docker Hub as long as there’s an available seat.
@y
Admins and organization owners can currently approve users by configuring their permissions through their IdP. That is, if the user account is configured in the IdP, the user will be automatically added to the organization in Docker Hub as long as there’s an available seat.
@z

@x
### Q: How will users be made aware that they are being made a part of a Docker Org?
@y
### Q: How will users be made aware that they are being made a part of a Docker Org?
@z

@x
When SSO is enabled, users will be prompted to authenticate through SSO the next time they try to sign in to Docker Hub or Docker Desktop. The system will see the end-user has a domain email associated with the docker ID they are trying to authenticate with, and prompts them to sign in with SSO email and credentials instead.
@y
When SSO is enabled, users will be prompted to authenticate through SSO the next time they try to sign in to Docker Hub or Docker Desktop. The system will see the end-user has a domain email associated with the docker ID they are trying to authenticate with, and prompts them to sign in with SSO email and credentials instead.
@z

@x
If users attempt to log in through the CLI, they must authenticate using a personal access token (PAT).
@y
If users attempt to log in through the CLI, they must authenticate using a personal access token (PAT).
@z

@x
### Q: Is it possible to force users of Docker Desktop to authenticate, and/or authenticate using their company’s domain?
@y
### Q: Is it possible to force users of Docker Desktop to authenticate, and/or authenticate using their company’s domain?
@z

@x
Yes. Admins can force users to authenticate with Docker Desktop by provisioning a [`registry.json`](../docker-hub/configure-sign-in.md) configuration file. The `registry.json` file will force users to authenticate as a user that is configured in the `allowedOrgs` list in the `registry.json` file.
@y
Yes. Admins can force users to authenticate with Docker Desktop by provisioning a [`registry.json`](../docker-hub/configure-sign-in.md) configuration file. The `registry.json` file will force users to authenticate as a user that is configured in the `allowedOrgs` list in the `registry.json` file.
@z

@x
Once SSO enforcement is set up on their Docker Business org on Hub, when the user is forced to authenticate with Docker Desktop, the SSO enforcement will also force users to authenticate through SSO with their IdP (instead of authenticating using their username and password).
@y
Once SSO enforcement is set up on their Docker Business org on Hub, when the user is forced to authenticate with Docker Desktop, the SSO enforcement will also force users to authenticate through SSO with their IdP (instead of authenticating using their username and password).
@z

@x
Users may still be able to authenticate as a "guest" account to the organization using a non-domain email address. However, they can only authenticate as guests if that non-domain email was invited to the organization by the organization owner.
@y
Users may still be able to authenticate as a "guest" account to the organization using a non-domain email address. However, they can only authenticate as guests if that non-domain email was invited to the organization by the organization owner.
@z

@x
### Q: Is it possible to convert existing users from non-SSO to SSO accounts?
@y
### Q: Is it possible to convert existing users from non-SSO to SSO accounts?
@z

@x
Yes, you can convert existing users to an SSO account. To convert users from a non-SSO account:
@y
Yes, you can convert existing users to an SSO account. To convert users from a non-SSO account:
@z

@x
* Ensure your users have a company domain email address and they have an account in your IdP
* Verify that all users have Docker Desktop version 4.4.0 or higher installed on their machines
* Each user has created a PAT to replace their passwords to allow them to log in through Docker CLI
* Confirm that all CI/CD pipelines automation systems have replaced their passwords with PATs.
@y
* Ensure your users have a company domain email address and they have an account in your IdP
* Verify that all users have Docker Desktop version 4.4.0 or higher installed on their machines
* Each user has created a PAT to replace their passwords to allow them to log in through Docker CLI
* Confirm that all CI/CD pipelines automation systems have replaced their passwords with PATs.
@z

@x
For detailed prerequisites and instructions on how to enable SSO, see [Configure Single Sign-on](index.md).
@y
For detailed prerequisites and instructions on how to enable SSO, see [Configure Single Sign-on](index.md).
@z

@x
### Q: What impact can users expect once we start onboarding them to SSO accounts?
@y
### Q: What impact can users expect once we start onboarding them to SSO accounts?
@z

@x
When SSO is enabled and enforced, your users just have to sign in using the email address and password.
@y
When SSO is enabled and enforced, your users just have to sign in using the email address and password.
@z

@x
### Q: Is Docker SSO fully synced with Active Directory (AD)?
@y
### Q: Is Docker SSO fully synced with Active Directory (AD)?
@z

@x
Docker doesn’t currently support a full sync with AD. That is, if a user leaves the organization, administrators must sign in to Docker Hub and manually [remove the user](../docker-hub/orgs.md#remove-team-members) from the organization.
@y
Docker doesn’t currently support a full sync with AD. That is, if a user leaves the organization, administrators must sign in to Docker Hub and manually [remove the user](../docker-hub/orgs.md#remove-team-members) from the organization.
@z

@x
Additionally, you can use our APIs to complete this process.
@y
Additionally, you can use our APIs to complete this process.
@z

@x
### Q: What is the best way to provision the Docker Subscription without SSO?
@y
### Q: What is the best way to provision the Docker Subscription without SSO?
@z

@x
Admins in the Owners group in the orgs can invite users through Docker Hub UI, by email address (for any user) or by Docker ID (assuming the user has created a user account on Hub already).
@y
Admins in the Owners group in the orgs can invite users through Docker Hub UI, by email address (for any user) or by Docker ID (assuming the user has created a user account on Hub already).
@z

@x
### Q: If we add a user manually for the first time, can I register in the dashboard and will the user get an invitation link via email? For example,   max.mustermann@zeiss.com.
@y
### Q: If we add a user manually for the first time, can I register in the dashboard and will the user get an invitation link via email? For example,   max.mustermann@zeiss.com.
@z

@x
Yes, if the user is added via email address to an org, they will receive an email invite. If invited via docker ID as an existing user instead, they'll be added to the organization automatically. We'll be adding a new invite flow in the near future that will require an email invite in this situation as well (so the user can choose to opt out). If the org later sets up SSO for [zeiss.com](https://www.zeiss.com/) domain, the user will automatically be added to the domain SSO org next sign in which requires SSO auth with the identity provider (Hub login will automatically redirect to the identity provider).
@y
Yes, if the user is added via email address to an org, they will receive an email invite. If invited via docker ID as an existing user instead, they'll be added to the organization automatically. We'll be adding a new invite flow in the near future that will require an email invite in this situation as well (so the user can choose to opt out). If the org later sets up SSO for [zeiss.com](https://www.zeiss.com/) domain, the user will automatically be added to the domain SSO org next sign in which requires SSO auth with the identity provider (Hub login will automatically redirect to the identity provider).
@z

@x
### Q: Can someone join the organization without an invitation? Is it possible to put specific users to an organization with existing email accounts?
@y
### Q: Can someone join the organization without an invitation? Is it possible to put specific users to an organization with existing email accounts?
@z

@x
Not without SSO. Joining requires an invite from a member of the Owners group. When SSO is enforced, then the domains verified through SSO will allow users to automatically join the organization the next time they sign in as a user that has a domain email assigned.
@y
Not without SSO. Joining requires an invite from a member of the Owners group. When SSO is enforced, then the domains verified through SSO will allow users to automatically join the organization the next time they sign in as a user that has a domain email assigned.
@z

@x
### Q: When we send an invitation to the user, will the existing account be consolidated and retained?
@y
### Q: When we send an invitation to the user, will the existing account be consolidated and retained?
@z

@x
Yes, the existing user account will join the organization with all assets retained.
@y
Yes, the existing user account will join the organization with all assets retained.
@z

@x
### Q: How can I view, update, and remove multiple email addresses for my users?
@y
### Q: How can I view, update, and remove multiple email addresses for my users?
@z

@x
We only support one email per user on the Docker platform.
@y
We only support one email per user on the Docker platform.
@z

@x
### Q: How can I remove invitees to the org who have not signed in?
@y
### Q: How can I remove invitees to the org who have not signed in?
@z

@x
They can go to the invitee list in the org view and remove them.
@y
They can go to the invitee list in the org view and remove them.
@z

@x
### Q: How is the flow for service account authentication different from a UI user account?
@y
### Q: How is the flow for service account authentication different from a UI user account?
@z

@x
It isn't; we don't differentiate the two in product.
@y
It isn't; we don't differentiate the two in product.
@z
