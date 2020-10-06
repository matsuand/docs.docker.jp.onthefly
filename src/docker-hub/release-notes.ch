%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Hub release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Hub
keywords: docker hub, whats new, release notes
toc_min: 1
toc_max: 2
---
@y
---
title: Docker Hub release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Hub
keywords: docker hub, whats new, release notes
toc_min: 1
toc_max: 2
---
@z

@x
Here you can learn about the latest changes, new features, bug fixes, and
known issues for each Docker Hub release.
@y
Here you can learn about the latest changes, new features, bug fixes, and
known issues for each Docker Hub release.
@z

@x
# 2020-05-14
@y
# 2020-05-14
@z

@x
### New features
@y
### New features
@z

@x
* Docker has announced a new, per-seat pricing model to accelerate developer workflows for cloud-native development. The previous private repository/parallel autobuild-based plans have been replaced with new **Pro** and **Team** plans that include unlimited private repositories. For more information, see [Docker Billing](../docker-hub/billing/index.md).
@y
* Docker has announced a new, per-seat pricing model to accelerate developer workflows for cloud-native development. The previous private repository/parallel autobuild-based plans have been replaced with new **Pro** and **Team** plans that include unlimited private repositories. For more information, see [Docker Billing](../docker-hub/billing/index.md).
@z

@x
* Docker has enabled download rate limits for downloads and pull requests on Docker Hub. This caps the number of objects that users can download within a specified timeframe. For more information, see [Download rate limit](download-rate-limit.md).
@y
* Docker has enabled download rate limits for downloads and pull requests on Docker Hub. This caps the number of objects that users can download within a specified timeframe. For more information, see [Download rate limit](download-rate-limit.md).
@z

@x
# 2019-11-04
@y
# 2019-11-04
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
* The [repositories page](https://docs.docker.com/docker-hub/repos/) and all
related settings and tabs have been updated and moved from `cloud.docker.com`
to `hub.docker.com`. You can access the page at its new URL: [https://hub.docker.com/repositories](https://hub.docker.com/repositories). 
@y
* The [repositories page](https://docs.docker.com/docker-hub/repos/) and all
related settings and tabs have been updated and moved from `cloud.docker.com`
to `hub.docker.com`. You can access the page at its new URL: [https://hub.docker.com/repositories](https://hub.docker.com/repositories). 
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
# 2019-10-21
@y
# 2019-10-21
@z

@x
### New features
* **Beta:** Docker Hub now supports [two-factor authentication (2FA)](/docker-hub/2fa). Enable it in your account settings, under the **[Security](https://hub.docker.com/settings/security)** section.
@y
### New features
* **Beta:** Docker Hub now supports [two-factor authentication (2FA)](/docker-hub/2fa). Enable it in your account settings, under the **[Security](https://hub.docker.com/settings/security)** section.
@z

@x
    > If you lose both your 2FA authentication device and recovery code, you may
    > not be able to recover your account.
    {: .important }
@y
    > If you lose both your 2FA authentication device and recovery code, you may
    > not be able to recover your account.
    {: .important }
@z

@x
### Enhancements
* As a security measure, when two-factor authentication is enabled, the Docker CLI requires a personal access token instead of a password to log in.
@y
### Enhancements
* As a security measure, when two-factor authentication is enabled, the Docker CLI requires a personal access token instead of a password to log in.
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
# 2019-10-02
@y
# 2019-10-02
@z

@x
### Enhancements
* You can now manage teams and members straight from your [organization page](https://hub.docker.com/orgs).
Each organization page now breaks down into these tabs:
  * **New:** Members - manage your members directly from this page (delete,
  add, or open their teams)
  * **New:** Teams - search by team or username, and open up any team page to
  manage the team
  * **New:** Invitees (conditional tab, only if an invite exists) - resend or
  remove invitiations from this tab
  * Repositories
  * Settings
  * Billing
@y
### Enhancements
* You can now manage teams and members straight from your [organization page](https://hub.docker.com/orgs).
Each organization page now breaks down into these tabs:
  * **New:** Members - manage your members directly from this page (delete,
  add, or open their teams)
  * **New:** Teams - search by team or username, and open up any team page to
  manage the team
  * **New:** Invitees (conditional tab, only if an invite exists) - resend or
  remove invitiations from this tab
  * Repositories
  * Settings
  * Billing
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
* Fixed an issue where Kinematic could not connect and log in to Docker Hub.
@y
* Fixed an issue where Kinematic could not connect and log in to Docker Hub.
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
# 2019-09-19
@y
# 2019-09-19
@z

@x
### New features
@y
### New features
@z

@x
* You can now [create personal access tokens](access-tokens.md) in Docker Hub and use them to authenticate from the Docker CLI. Find them in your account settings, under the new **[Security](https://hub.docker.com/settings/security)** section.
@y
* You can now [create personal access tokens](access-tokens.md) in Docker Hub and use them to authenticate from the Docker CLI. Find them in your account settings, under the new **[Security](https://hub.docker.com/settings/security)** section.
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
# 2019-09-16
@y
# 2019-09-16
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
* The [billing page](https://docs.docker.com/docker-hub/upgrade/) for personal accounts has been updated. You can access the page at its new URL: [https://hub.docker.com/billing/plan](https://hub.docker.com/billing/plan).
@y
* The [billing page](https://docs.docker.com/docker-hub/upgrade/) for personal accounts has been updated. You can access the page at its new URL: [https://hub.docker.com/billing/plan](https://hub.docker.com/billing/plan).
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
# 2019-09-05
@y
# 2019-09-05
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
* The `Tags` tab on an image page now provides additional information for each tag:
  * A list of digests associated with the tag
  * The architecture it was built on
  * The OS
  * The user who most recently updated an image for a specific tag
* The security scan summary for [official images](https://docs.docker.com/docker-hub/official_images/)
has been updated.
@y
* The `Tags` tab on an image page now provides additional information for each tag:
  * A list of digests associated with the tag
  * The architecture it was built on
  * The OS
  * The user who most recently updated an image for a specific tag
* The security scan summary for [official images](https://docs.docker.com/docker-hub/official_images/)
has been updated.
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z
