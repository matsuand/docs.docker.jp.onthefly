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
description: Link to GitHub and BitBucket
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, trusted, builds, trusted builds, automated builds, GitHub
title: Configure automated builds from GitHub and BitBucket
redirect_from:
- /docker-hub/github/
- /docker-hub/bitbucket/
- /docker-cloud/builds/link-source/
---
@z

@x
To automate building and testing of your images, you link to your hosted source
code service to Docker Hub so that it can access your source code
repositories. You can configure this link for user accounts or
organizations.
@y
To automate building and testing of your images, you link to your hosted source
code service to Docker Hub so that it can access your source code
repositories. You can configure this link for user accounts or
organizations.
@z

@x
> **Note**: If you are linking a source code provider to create autobuilds for a team, follow the instructions to [create a service account](index.md#service-users-for-team-autobuilds) for the team before linking the account as described below.
@y
> **Note**: If you are linking a source code provider to create autobuilds for a team, follow the instructions to [create a service account](index.md#service-users-for-team-autobuilds) for the team before linking the account as described below.
@z

@x
## Link to a GitHub user account
@y
## Link to a GitHub user account
@z

@x
1. Log in to Docker Hub using your Docker ID.
@y
1. Log in to Docker Hub using your Docker ID.
@z

@x
2. Click **Account Settings** in the top-right dropdown navigation, then open **Linked Accounts**.
@y
2. Click **Account Settings** in the top-right dropdown navigation, then open **Linked Accounts**.
@z

@x
3. Click **Connect** for the source provider you want to link.
@y
3. Click **Connect** for the source provider you want to link.
@z

@x
    ![Linking source providers](images/linked-accounts.png)
@y
    ![Linking source providers](images/linked-accounts.png)
@z

@x
4. Review the settings for the **Docker Hub Builder** OAuth application.
@y
4. Review the settings for the **Docker Hub Builder** OAuth application.
@z

@x
    ![Granting access to GitHub account](images/authorize-builder.png)
@y
    ![Granting access to GitHub account](images/authorize-builder.png)
@z

@x
    >**Note**: If you are the owner of any GitHub organizations, you might see
    options to grant Docker Hub access to them from this screen. You can also
    individually edit an organization's third-party access settings to grant or
    revoke Docker Hub's access. See
    [Grant access to a GitHub organization](link-source.md#grant-access-to-a-github-organization)
    to learn more.
@y
    >**Note**: If you are the owner of any GitHub organizations, you might see
    options to grant Docker Hub access to them from this screen. You can also
    individually edit an organization's third-party access settings to grant or
    revoke Docker Hub's access. See
    [Grant access to a GitHub organization](link-source.md#grant-access-to-a-github-organization)
    to learn more.
@z

@x
5. Click **Authorize docker** to save the link.
@y
5. Click **Authorize docker** to save the link.
@z

@x
## Link to a Bitbucket user account
@y
## Link to a Bitbucket user account
@z

@x
1. Log in to Docker Hub using your Docker ID.
@y
1. Log in to Docker Hub using your Docker ID.
@z

@x
2. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@y
2. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@z

@x
3. Click **Connect** for the source provider you want to link.
@y
3. Click **Connect** for the source provider you want to link.
@z

@x
    ![Linking Bitbucket](images/linked-accounts.png)
@y
    ![Linking Bitbucket](images/linked-accounts.png)
@z

@x
4. If necessary, log in to Bitbucket.
@y
4. If necessary, log in to Bitbucket.
@z

@x
5. On the page that appears, click **Grant access**.
@y
5. On the page that appears, click **Grant access**.
@z

@x
### Unlink a GitHub user account
@y
### Unlink a GitHub user account
@z

@x
To revoke Docker Hub's access to your GitHub account, you must unlink it both
from Docker Hub, *and* from your GitHub account.
@y
To revoke Docker Hub's access to your GitHub account, you must unlink it both
from Docker Hub, *and* from your GitHub account.
@z

@x
1. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@y
1. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@z

@x
2. Click the plug icon next to the source provider you want to remove.
@y
2. Click the plug icon next to the source provider you want to remove.
@z

@x
3. Go to your GitHub account's **Settings** page.
@y
3. Go to your GitHub account's **Settings** page.
@z

@x
4. Click **Applications** in the left navigation bar.
@y
4. Click **Applications** in the left navigation bar.
@z

@x
5. Click the `...` menu to the right of the Docker Hub Builder application and select **Revoke**.
@y
5. Click the `...` menu to the right of the Docker Hub Builder application and select **Revoke**.
@z

@x
> **Note**: Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository.
This webhook is not automatically removed when you revoke access to a source
code provider.
@y
> **Note**: Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository.
This webhook is not automatically removed when you revoke access to a source
code provider.
@z

@x
## Grant access to a GitHub organization
@y
## Grant access to a GitHub organization
@z

@x
If you are the owner of a GitHub organization, you can grant or revoke Docker
Hub's access to the organization's repositories. Depending on the GitHub
organization's settings, you may need to be an organization owner.
@y
If you are the owner of a GitHub organization, you can grant or revoke Docker
Hub's access to the organization's repositories. Depending on the GitHub
organization's settings, you may need to be an organization owner.
@z

@x
If the organization has not had specific access granted or revoked before, you
can often grant access at the same time as you link your user account. In this
case, a **Grant access** button appears next to the organization name in the
link accounts screen, as shown below.  If this button does not appear, you must
manually grant the application's access.
@y
If the organization has not had specific access granted or revoked before, you
can often grant access at the same time as you link your user account. In this
case, a **Grant access** button appears next to the organization name in the
link accounts screen, as shown below.  If this button does not appear, you must
manually grant the application's access.
@z

@x
![Granting access to GitHub organization](images/link-source-github-org-lite.png)
@y
![Granting access to GitHub organization](images/link-source-github-org-lite.png)
@z

@x
To manually grant Docker Hub access to a GitHub organization:
@y
To manually grant Docker Hub access to a GitHub organization:
@z

@x
1. Link your user account using the instructions above.
@y
1. Link your user account using the instructions above.
@z

@x
2. From your GitHub Account settings, locate the **Organization settings**
section at the lower left.
@y
2. From your GitHub Account settings, locate the **Organization settings**
section at the lower left.
@z

@x
3. Click the organization you want to give Docker Hub access to.
@y
3. Click the organization you want to give Docker Hub access to.
@z

@x
4. From the Organization Profile menu, click **Third-party access**.
@y
4. From the Organization Profile menu, click **Third-party access**.
@z

@x
    The page displays a list of third party applications and their access
    status.
@y
    The page displays a list of third party applications and their access
    status.
@z

@x
5. Click the pencil icon next to Docker Hub Builder.
@y
5. Click the pencil icon next to Docker Hub Builder.
@z

@x
6. Click **Grant access** next to the organization.
@y
6. Click **Grant access** next to the organization.
@z

@x
    ![Granting access to GitHub organization manually](images/link-source-github-org.png)
@y
    ![Granting access to GitHub organization manually](images/link-source-github-org.png)
@z

@x
### Revoke access to a GitHub organization
@y
### Revoke access to a GitHub organization
@z

@x
To revoke Docker Hub's access to an organization's GitHub repositories:
@y
To revoke Docker Hub's access to an organization's GitHub repositories:
@z

@x
1. From your GitHub Account settings, locate the **Organization settings** section at the lower left.
@y
1. From your GitHub Account settings, locate the **Organization settings** section at the lower left.
@z

@x
2. Click the organization you want to revoke Docker Hub's access to.
@y
2. Click the organization you want to revoke Docker Hub's access to.
@z

@x
3. From the Organization Profile menu, click **Third-party access**.
    The page displays a list of third party applications and their access status.
@y
3. From the Organization Profile menu, click **Third-party access**.
    The page displays a list of third party applications and their access status.
@z

@x
4. Click the pencil icon next to Docker Hub Builder.
@y
4. Click the pencil icon next to Docker Hub Builder.
@z

@x
5. On the next page, click **Deny access**.
@y
5. On the next page, click **Deny access**.
@z

@x
### Unlink a Bitbucket user account
@y
### Unlink a Bitbucket user account
@z

@x
To permanently revoke Docker Hub's access to your Bitbucket account, you must
unlink it both from Docker Hub, *and* from your Bitbucket account.
@y
To permanently revoke Docker Hub's access to your Bitbucket account, you must
unlink it both from Docker Hub, *and* from your Bitbucket account.
@z

@x
1. Log in to Docker Hub using your Docker ID.
@y
1. Log in to Docker Hub using your Docker ID.
@z

@x
2. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@y
2. Click **Account Settings** in the top-right dropdown navigation, then open
the **Linked Accounts** section.
@z

@x
3. Click the plug icon next to the source provider you want to remove.
@y
3. Click the plug icon next to the source provider you want to remove.
@z

@x
4. Go to your Bitbucket account and click the user menu icon in the top-right corner.
@y
4. Go to your Bitbucket account and click the user menu icon in the top-right corner.
@z

@x
5. Click **Bitbucket settings**.
@y
5. Click **Bitbucket settings**.
@z

@x
6. On the page that appears, click **OAuth**.
@y
6. On the page that appears, click **OAuth**.
@z

@x
7. Click **Revoke** next to the Docker Hub line.
@y
7. Click **Revoke** next to the Docker Hub line.
@z

@x
> **Note**: Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository. This
webhook is not automatically removed when you revoke access to a source code
provider.
@y
> **Note**: Each repository that is configured as an automated build source
contains a webhook that notifies Docker Hub of changes in the repository. This
webhook is not automatically removed when you revoke access to a source code
provider.
@z
