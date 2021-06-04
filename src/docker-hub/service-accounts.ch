%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Service accounts
keywords: Docker, service, accounts, Docker Hub
title: Service accounts
---
@y
---
description: Docker Service accounts
keywords: Docker, service, accounts, Docker Hub
title: サービスアカウント
---
@z

@x
A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and do not share Docker IDs with the members in the Team plan. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@y
A service account is a Docker ID used for automated management of container images or containerized applications. Service accounts are typically used in automated workflows, and do not share Docker IDs with the members in the Team plan. Common use cases for service accounts include mirroring content on Docker Hub, or tying in image pulls from your CI/CD process.
@z

@x
> **Note**
>
> Service accounts included with the Team plan are limited to 15,000 pulls per day. If you require a higher number of pulls, you can purchase an Enhanced Service Account add-on.
@y
> **Note**
>
> Service accounts included with the Team plan are limited to 15,000 pulls per day. If you require a higher number of pulls, you can purchase an Enhanced Service Account add-on.
@z

@x
## Enhanced Service Account add-on pricing
@y
## Enhanced Service Account add-on pricing
@z

@x
Refer to the following table for details on the Enhanced Service Account add-on pricing:
@y
Refer to the following table for details on the Enhanced Service Account add-on pricing:
@z

@x
| Tier | Pull Rates Per Day* | Annual Fee |
| ------ | ------ | ------ |
| 1 | 15-50k | $9,950/yr |
| 2 | 50-150k | $17,950/yr |
| 3 | 150k-500k | $60,000/yr |
| 4 | 500k+ | Tier 4+ $60k/yr/500k Pull increment |
@y
| Tier | Pull Rates Per Day* | Annual Fee |
| ------ | ------ | ------ |
| 1 | 15-50k | $9,950/yr |
| 2 | 50-150k | $17,950/yr |
| 3 | 150k-500k | $60,000/yr |
| 4 | 500k+ | Tier 4+ $60k/yr/500k Pull increment |
@z

@x
<sub>*Once the initial Tier is established, that is the minimum fee for the year.  Annual commitment required.  The service account may exceed Pulls by up to 25% for up to 20 days during the year without incurring additional fees.  Reports on consumption will be provided upon request.  At the end of the initial 1-year term, the appropriate Tier will be established for the following year.<sub>
@y
<sub>*Once the initial Tier is established, that is the minimum fee for the year.  Annual commitment required.  The service account may exceed Pulls by up to 25% for up to 20 days during the year without incurring additional fees.  Reports on consumption will be provided upon request.  At the end of the initial 1-year term, the appropriate Tier will be established for the following year.<sub>
@z

@x
## How a pull is defined
@y
## How a pull is defined
@z

@x
- A pull request is defined as up to two `GET` requests on registry manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a single manifest request.
- A pull request for a multi-arch image makes two manifest requests.
- `HEAD` requests are not counted.
- Limits are applied based on the user doing the pull, and not based on the image being pulled or its owner.
@y
- A pull request is defined as up to two `GET` requests on registry manifest URLs (`/v2/*/manifests/*`).
- A normal image pull makes a single manifest request.
- A pull request for a multi-arch image makes two manifest requests.
- `HEAD` requests are not counted.
- Limits are applied based on the user doing the pull, and not based on the image being pulled or its owner.
@z

@x
## Creating a new service account
@y
## Creating a new service account
@z

@x
To create a new service account for your Team account:
@y
To create a new service account for your Team account:
@z

@x
1. Create a new Docker ID.
2. Create a [team](orgs.md#create-a-team) in your organization and grant it read-only access to your private repositories.
3. Add the new Docker ID to your [organization](orgs.md#working-with-organizations).
4. Add the new Docker ID  to the [team](orgs.md#add-a-member-to-a-team) you created earlier.
5. Create a new [personal access token (PAT)](/access-tokens.md) from the user account and use it for CI.
@y
1. Create a new Docker ID.
2. Create a [team](orgs.md#create-a-team) in your organization and grant it read-only access to your private repositories.
3. Add the new Docker ID to your [organization](orgs.md#working-with-organizations).
4. Add the new Docker ID  to the [team](orgs.md#add-a-member-to-a-team) you created earlier.
5. Create a new [personal access token (PAT)](/access-tokens.md) from the user account and use it for CI.
@z

@x
> **Note**
>
> If you want a read-only PAT just for your open-source repos, or to access
official images and other public images, you do not have to grant any access permissions to the new Docker ID.
@y
> **Note**
>
> If you want a read-only PAT just for your open-source repos, or to access
official images and other public images, you do not have to grant any access permissions to the new Docker ID.
@z

@x
## Additional information
@y
## Additional information
@z

@x
Refer to the following topics for additional information:
@y
Refer to the following topics for additional information:
@z

@x
- [Mirroring Docker Hub](../registry/recipes/mirror.md)
- [Resource Consumption Updates FAQ](https://www.docker.com/pricing/resource-consumption-updates){:target="_blank" rel="noopener" class="_"}
@y
- [Mirroring Docker Hub](../registry/recipes/mirror.md)
- [Resource Consumption Updates FAQ](https://www.docker.com/pricing/resource-consumption-updates){:target="_blank" rel="noopener" class="_"}
@z
