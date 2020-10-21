%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Desktop Enterprise release notes
description: Release notes for Docker Desktop Enterprise
keywords: Docker Desktop Enterprise, Windows, Mac, Docker Desktop, Enterprise,
toc_min: 1
toc_max: 2
redirect_from:
- /ee/desktop/release-notes/
---
@y
---
title: Docker Desktop Enterprise release notes
description: Release notes for Docker Desktop Enterprise
keywords: Docker Desktop Enterprise, Windows, Mac, Docker Desktop, Enterprise,
toc_min: 1
toc_max: 2
redirect_from:
- /ee/desktop/release-notes/
---
@z

@x
This page contains information about the new features, improvements, known issues, and bug fixes in the Docker Desktop Enterprise release. Documentation is updated for each release. We suggest that you regularly visit this page to learn about updates.
@y
This page contains information about the new features, improvements, known issues, and bug fixes in the Docker Desktop Enterprise release. Documentation is updated for each release. We suggest that you regularly visit this page to learn about updates.
@z

@x
For information on system requirements, installation, and download, see:
@y
For information on system requirements, installation, and download, see:
@z

@x
- [Install Docker Desktop Enterprise on Mac](admin/install/mac.md)
- [Install Docker Desktop Enterprise on Windows](admin/install/windows.md)
@y
- [Install Docker Desktop Enterprise on Mac](admin/install/mac.md)
- [Install Docker Desktop Enterprise on Windows](admin/install/windows.md)
@z

@x
For Docker Engine release notes, see [Docker Engine release notes](../../engine/release-notes/index.md).
@y
For Docker Engine release notes, see [Docker Engine release notes](../../engine/release-notes/index.md).
@z

@x
## Version 2.3.0.0
2020-04-22
@y
## Version 2.3.0.0
2020-04-22
@z

@x
Docker Desktop Enterprise 2.3.0.0 contains a Kubernetes upgrade. Note that your local Kubernetes cluster in Version Pack 3.0 will be reset after installing this version.
@y
Docker Desktop Enterprise 2.3.0.0 contains a Kubernetes upgrade. Note that your local Kubernetes cluster in Version Pack 3.0 will be reset after installing this version.
@z

@x
This version includes all the bug fixes and minor changes between Docker Desktop Community versions 2.1.0.1 and 2.3.0.0. For details see:
- [Docker Desktop Community release notes on Mac](../../docker-for-mac/release-notes.md) 
- [Docker Desktop Community release notes on Windows](../../docker-for-windows/release-notes.md) 
@y
This version includes all the bug fixes and minor changes between Docker Desktop Community versions 2.1.0.1 and 2.3.0.0. For details see:
- [Docker Desktop Community release notes on Mac](../../docker-for-mac/release-notes.md) 
- [Docker Desktop Community release notes on Windows](../../docker-for-windows/release-notes.md) 
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
- Windows: in the `admin-settings.json` configuration file, the `sharedDrives` and `sharedFolders` fields have been replaced by a unique `filesharingDirectories` field.
- Mac: in the `admin-settings.json` configuration file, the `filesharingDirectories` has been moved out of the `linuxVM` section.
- The `admin-settings.json` configuration file `configurationFileVersion` field value has been increased from 1 to 2.
@y
- Windows: in the `admin-settings.json` configuration file, the `sharedDrives` and `sharedFolders` fields have been replaced by a unique `filesharingDirectories` field.
- Mac: in the `admin-settings.json` configuration file, the `filesharingDirectories` has been moved out of the `linuxVM` section.
- The `admin-settings.json` configuration file `configurationFileVersion` field value has been increased from 1 to 2.
@z

@x
### Known issue
@y
### Known issue
@z

@x
Docker Desktop Enterprise 2.3.0.0 contains a change in the configuration file format.
@y
Docker Desktop Enterprise 2.3.0.0 contains a change in the configuration file format.
@z

@x
For more information, see:
- [Update Docker Desktop Enterprise configuration file from version 1 to 2 on Mac](admin/configure/mac-admin.md#from-version-1-to-2)
- [Update Docker Desktop Enterprise configuration file from version 1 to 2 on Windows](admin/configure/windows-admin.md#from-version-1-to-2)
@y
For more information, see:
- [Update Docker Desktop Enterprise configuration file from version 1 to 2 on Mac](admin/configure/mac-admin.md#from-version-1-to-2)
- [Update Docker Desktop Enterprise configuration file from version 1 to 2 on Windows](admin/configure/windows-admin.md#from-version-1-to-2)
@z

@x
## Version 2.1.0.9
2020-03-13
@y
## Version 2.1.0.9
2020-03-13
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
- Windows: Security fix - Diagnostics were collected with Administrator privileges, which led to a possible privilege escalation on systems where the Docker Desktop user was not an administrator.
@y
- Windows: Security fix - Diagnostics were collected with Administrator privileges, which led to a possible privilege escalation on systems where the Docker Desktop user was not an administrator.
@z

@x
## Version 2.1.0.8
2019-11-14
@y
## Version 2.1.0.8
2019-11-14
@z

@x
Docker Desktop Enterprise 2.1.0.8 contains a Kubernetes upgrade. Note that your local Kubernetes cluster in Version Pack 3.0 will be reset after installing this version.
@y
Docker Desktop Enterprise 2.1.0.8 contains a Kubernetes upgrade. Note that your local Kubernetes cluster in Version Pack 3.0 will be reset after installing this version.
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker 19.03.5](/engine/release-notes/#19035) in Version Pack Enterprise 3.0
- [Kubernetes 1.14.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.8) in Version Pack Enterprise 3.0
- [Docker 18.09.11](/engine/release-notes/#180911) in Version Pack Enterprise 2.1
- [Docker 17.06.2-ee-25](/engine/release-notes/#17062-ee-25) in Version Pack Enterprise 2.0
- [Go 1.12.13](https://golang.org/doc/devel/release.html#go1.12)
@y
- [Docker 19.03.5](/engine/release-notes/#19035) in Version Pack Enterprise 3.0
- [Kubernetes 1.14.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.8) in Version Pack Enterprise 3.0
- [Docker 18.09.11](/engine/release-notes/#180911) in Version Pack Enterprise 2.1
- [Docker 17.06.2-ee-25](/engine/release-notes/#17062-ee-25) in Version Pack Enterprise 2.0
- [Go 1.12.13](https://golang.org/doc/devel/release.html#go1.12)
@z

@x
## Version 2.1.0.7
2019-10-18
@y
## Version 2.1.0.7
2019-10-18
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
[Docker 19.03.4](/engine/release-notes/) in Version Pack Enterprise 3.0
@y
[Docker 19.03.4](/engine/release-notes/) in Version Pack Enterprise 3.0
@z

@x
## Version 2.1.0.6
2019-10-08
@y
## Version 2.1.0.6
2019-10-08
@z

@x
Docker Desktop Enterprise 2.1.0.6 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this version.
@y
Docker Desktop Enterprise 2.1.0.6 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this version.
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker 19.03.3](/engine/release-notes/) in Version Pack Enterprise 3.0
- [Kubernetes 1.14.7](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.7) in Version Pack Enterprise 3.0
- [Go 1.12.10](https://github.com/golang/go/issues?q=milestone%3AGo1.12.10+label%3ACherryPickApproved)
- Application Designer 0.1.8
@y
- [Docker 19.03.3](/engine/release-notes/) in Version Pack Enterprise 3.0
- [Kubernetes 1.14.7](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.7) in Version Pack Enterprise 3.0
- [Go 1.12.10](https://github.com/golang/go/issues?q=milestone%3AGo1.12.10+label%3ACherryPickApproved)
- Application Designer 0.1.8
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
- Windows: Docker Desktop no longer tries to modify the `/etc/hosts` file inside Windows containers to add `*.docker.internal` DNS entries.
@y
- Windows: Docker Desktop no longer tries to modify the `/etc/hosts` file inside Windows containers to add `*.docker.internal` DNS entries.
@z

@x
## Version 2.1.0.5
2019-09-16
@y
## Version 2.1.0.5
2019-09-16
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
 - Mac: All binaries included in Docker Desktop are now notarized so that they can run on macOS Catalina. For more information, see [Notarization Requirement for Mac Software](https://developer.apple.com/news/?id=06032019i).
@y
 - Mac: All binaries included in Docker Desktop are now notarized so that they can run on macOS Catalina. For more information, see [Notarization Requirement for Mac Software](https://developer.apple.com/news/?id=06032019i).
@z

@x
## Version 2.1.0.4
2019-09-03
@y
## Version 2.1.0.4
2019-09-03
@z

@x
Docker Desktop Enterprise 2.1.0.3 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this version.
@y
Docker Desktop Enterprise 2.1.0.3 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this version.
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker 19.03.2](/engine/release-notes/) in Version Pack Enterprise 3.0
- [Kubernetes 1.14.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.6) in Version Pack Enterprise 3.0
- [Go 1.12.9](https://github.com/golang/go/issues?q=milestone%3AGo1.12.9+label%3ACherryPickApproved) in Version Pack Enterprise 3.0
- [Qemu 4.1.0](https://github.com/docker/binfmt) to cross-compile ARM devices
- Application Designer 0.1.6
- Mac: [Hyperkit 0.20190802](https://github.com/moby/hyperkit/releases/tag/v0.20190802)
@y
- [Docker 19.03.2](/engine/release-notes/) in Version Pack Enterprise 3.0
- [Kubernetes 1.14.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.6) in Version Pack Enterprise 3.0
- [Go 1.12.9](https://github.com/golang/go/issues?q=milestone%3AGo1.12.9+label%3ACherryPickApproved) in Version Pack Enterprise 3.0
- [Qemu 4.1.0](https://github.com/docker/binfmt) to cross-compile ARM devices
- Application Designer 0.1.6
- Mac: [Hyperkit 0.20190802](https://github.com/moby/hyperkit/releases/tag/v0.20190802)
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
- Restricted the `cluster-admin` role on local Kubernetes cluster to `kube-system` namespace.
- Mac: Docker Desktop checks the `admin-settings.json` file and enforces the CLI config whenever Docker Engine is restarted.
- Windows: Updated the Access Control List (ACL) on `cli-plugins` and `version-bin` folders to ensure only administrators have read/write access to these folders.
@y
- Restricted the `cluster-admin` role on local Kubernetes cluster to `kube-system` namespace.
- Mac: Docker Desktop checks the `admin-settings.json` file and enforces the CLI config whenever Docker Engine is restarted.
- Windows: Updated the Access Control List (ACL) on `cli-plugins` and `version-bin` folders to ensure only administrators have read/write access to these folders.
@z

@x
## Version 2.1.0.2
2019-07-26
@y
## Version 2.1.0.2
2019-07-26
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker 19.03.1](/engine/release-notes/) in Version Pack Enterprise 3.0.
@y
- [Docker 19.03.1](/engine/release-notes/) in Version Pack Enterprise 3.0.
@z

@x
## Version 2.1.0.1
2019-07-22
@y
## Version 2.1.0.1
2019-07-22
@z

@x
Docker Desktop Enterprise 2.1.0.1 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this release.
@y
Docker Desktop Enterprise 2.1.0.1 contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing this release.
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker 19.03.0](/engine/release-notes/) in Version Pack Enterprise 3.0
- [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.3) in Version Pack Enterprise 3.0
- [Compose on Kubernetes 0.4.23](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.23) in Version Pack Enterprise 3.0
- [Docker Compose 1.24.1](https://github.com/docker/compose/releases/tag/1.24.1)
- [Docker 18.09.8](/engine/release-notes/) in Version Pack Enterprise 2.1
- [Docker 17.06.2-ee-23](/engine/release-notes/) in Version Pack Enterprise 2.0
- [Docker Credential Helpers 0.6.3](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.3)
- [Application Designer 0.1.4](app-designer.md)
@y
- [Docker 19.03.0](/engine/release-notes/) in Version Pack Enterprise 3.0
- [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.3) in Version Pack Enterprise 3.0
- [Compose on Kubernetes 0.4.23](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.23) in Version Pack Enterprise 3.0
- [Docker Compose 1.24.1](https://github.com/docker/compose/releases/tag/1.24.1)
- [Docker 18.09.8](/engine/release-notes/) in Version Pack Enterprise 2.1
- [Docker 17.06.2-ee-23](/engine/release-notes/) in Version Pack Enterprise 2.0
- [Docker Credential Helpers 0.6.3](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.3)
- [Application Designer 0.1.4](app-designer.md)
@z

@x
### Known issue
@y
### Known issue
@z

@x
When you sign out of Windows while Docker Desktop is still running, and then sign in and start Docker Desktop, attempts to run Docker commands that rely on network connections can fail. For example, the command `docker pull alpine` returns `Error response from daemon: Get https://registry-1.docker.io/v2/: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)`.
@y
When you sign out of Windows while Docker Desktop is still running, and then sign in and start Docker Desktop, attempts to run Docker commands that rely on network connections can fail. For example, the command `docker pull alpine` returns `Error response from daemon: Get https://registry-1.docker.io/v2/: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)`.
@z

@x
Note that this issue occurs only when you sign out of Windows and not when you shut down or restart Windows.
@y
Note that this issue occurs only when you sign out of Windows and not when you shut down or restart Windows.
@z

@x
Workaround: After signing back into Windows, when Docker Desktop has started, right-click the Docker menu from the systray and then select Quit Docker Desktop. When this is complete, start Docker Desktop normally.
@y
Workaround: After signing back into Windows, when Docker Desktop has started, right-click the Docker menu from the systray and then select Quit Docker Desktop. When this is complete, start Docker Desktop normally.
@z

@x
## Version 2.0.0.6
2019-06-06
@y
## Version 2.0.0.6
2019-06-06
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker 19.03.0-rc2](/engine/release-notes/) in Version Pack Enterprise 3.0
- Application Designer 0.1.3
@y
- [Docker 19.03.0-rc2](/engine/release-notes/) in Version Pack Enterprise 3.0
- Application Designer 0.1.3
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
- Application Designer/ Docker Template CLI: The `DefaultServer` preference has been renamed to `DefaultRegistry`.
- Windows: Docker Desktop now allows administrators to specify authorized named pipes that can be mounted on Windows containers.
- Windows: Docker Desktop checks for stored credentials at startup before attempting to mount any shared drives. This prompts users to reenter the credentials if they are invalid.
- Mac: Docker Deskop does not send DNS queries for `docker-desktop.<domain>` every 10s. It relies on the host's DNS domain search order rather than trying to replicate it inside the VM.
- Mac: Docker Desktop now uses a separate thread to move its storage to a different disk. This allows the UI to remain responsive during the disk move. Fixes [docker/for-mac#3592](https://github.com/docker/for-mac/issues/3592)
@y
- Application Designer/ Docker Template CLI: The `DefaultServer` preference has been renamed to `DefaultRegistry`.
- Windows: Docker Desktop now allows administrators to specify authorized named pipes that can be mounted on Windows containers.
- Windows: Docker Desktop checks for stored credentials at startup before attempting to mount any shared drives. This prompts users to reenter the credentials if they are invalid.
- Mac: Docker Deskop does not send DNS queries for `docker-desktop.<domain>` every 10s. It relies on the host's DNS domain search order rather than trying to replicate it inside the VM.
- Mac: Docker Desktop now uses a separate thread to move its storage to a different disk. This allows the UI to remain responsive during the disk move. Fixes [docker/for-mac#3592](https://github.com/docker/for-mac/issues/3592)
@z

@x
## Version 2.0.0.5
2019-05-30
@y
## Version 2.0.0.5
2019-05-30
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker 19.03.0-rc1](/engine/release-notes/) in Enterprise 3.0 version pack
- Application Designer 0.1.2
- [Qemu 4.0.0](https://github.com/docker/binfmt) to cross-compile ARM devices
@y
- [Docker 19.03.0-rc1](/engine/release-notes/) in Enterprise 3.0 version pack
- Application Designer 0.1.2
- [Qemu 4.0.0](https://github.com/docker/binfmt) to cross-compile ARM devices
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
- Application Designer now allows users to copy and paste application logs.
- Users can browse the scaffold logs when scaffolding a new application using the Application Designer.
- Application Designer allows users to set preferences, including the default organization and registry.
- Docker Desktop admins can enforce Application Designer preferences using the `admin-settings.json` file.
- Security improvements: Docker Desktop now checks TLS certificates for the target endpoints when using `kubectl`.
- Fixed an issue where Visual Studio Code IDE path was not detected properly.
@y
- Application Designer now allows users to copy and paste application logs.
- Users can browse the scaffold logs when scaffolding a new application using the Application Designer.
- Application Designer allows users to set preferences, including the default organization and registry.
- Docker Desktop admins can enforce Application Designer preferences using the `admin-settings.json` file.
- Security improvements: Docker Desktop now checks TLS certificates for the target endpoints when using `kubectl`.
- Fixed an issue where Visual Studio Code IDE path was not detected properly.
@z

@x
## Version 2.0.0.4
2019-05-16
@y
## Version 2.0.0.4
2019-05-16
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker 19.03.0-beta4](/engine/release-notes/) in Enterprise 3.0 version pack
- [Docker 18.09.6](/engine/release-notes/), [Kubernetes 1.11.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.11.md#v11110) in Enterprise 2.1 version pack
- [LinuxKit v0.7](https://github.com/linuxkit/linuxkit/releases/tag/v0.7)
@y
- [Docker 19.03.0-beta4](/engine/release-notes/) in Enterprise 3.0 version pack
- [Docker 18.09.6](/engine/release-notes/), [Kubernetes 1.11.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.11.md#v11110) in Enterprise 2.1 version pack
- [LinuxKit v0.7](https://github.com/linuxkit/linuxkit/releases/tag/v0.7)
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
- Fixed a stability issue with the DNS resolver.
- Fixed a race condition where Kubernetes sometimes failed to start after restarting the application.
- Fixed a bug that causes Docker Compose to fail when a user logs out after logging in. See [docker/compose#6517](https://github.com/docker/compose/issues/6517)
- Improved the reliability of `com.docker.osxfs trace` performance profiling command.
- Docker Desktop now supports large lists of resource DNS records on Mac. See [docker/for-mac#2160](https://github.com/docker/for-mac/issues/2160#issuecomment-431571031).
- Users can now run a Docker registry in a container. See [docker/for-mac#3611](https://github.com/docker/for-mac/issues/3611).
- For Linux containers on Windows (LCOW), one physical computer system running Windows 10 Professional or Windows 10 Enterprise version 1809 or later is required.
- Added a dialog box during startup when a shared drive fails to mount. This allows users to retry mounting the drive or remove it from the shared drive list.
- Removed the ability to log in using an email address as a username as this is not supported by the Docker command line.
@y
- Fixed a stability issue with the DNS resolver.
- Fixed a race condition where Kubernetes sometimes failed to start after restarting the application.
- Fixed a bug that causes Docker Compose to fail when a user logs out after logging in. See [docker/compose#6517](https://github.com/docker/compose/issues/6517)
- Improved the reliability of `com.docker.osxfs trace` performance profiling command.
- Docker Desktop now supports large lists of resource DNS records on Mac. See [docker/for-mac#2160](https://github.com/docker/for-mac/issues/2160#issuecomment-431571031).
- Users can now run a Docker registry in a container. See [docker/for-mac#3611](https://github.com/docker/for-mac/issues/3611).
- For Linux containers on Windows (LCOW), one physical computer system running Windows 10 Professional or Windows 10 Enterprise version 1809 or later is required.
- Added a dialog box during startup when a shared drive fails to mount. This allows users to retry mounting the drive or remove it from the shared drive list.
- Removed the ability to log in using an email address as a username as this is not supported by the Docker command line.
@z

@x
## Version 2.0.0.3
2019-04-26
@y
## Version 2.0.0.3
2019-04-26
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker Engine 19.03.0-beta2](/engine/release-notes/) for Version Pack Enterprise 3.0.
@y
- [Docker Engine 19.03.0-beta2](/engine/release-notes/) for Version Pack Enterprise 3.0.
@z

@x
## Version 2.0.0.2
2019-04-19
@y
## Version 2.0.0.2
2019-04-19
@z

@x
**WARNING:** You must upgrade the previously installed Version Packs to the latest revision.
@y
**WARNING:** You must upgrade the previously installed Version Packs to the latest revision.
@z

@x
### New
@y
### New
@z

@x
- Version Pack Enterprise 3.0 with [Docker Engine 19.03.0-beta1](/engine/release-notes/) and [Kubernetes 1.14.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.14.md#changelog-since-v1141)
@y
- Version Pack Enterprise 3.0 with [Docker Engine 19.03.0-beta1](/engine/release-notes/) and [Kubernetes 1.14.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.14.md#changelog-since-v1141)
@z

@x
- Application Designer now includes new templates for AngularJS and VueJS.
@y
- Application Designer now includes new templates for AngularJS and VueJS.
@z

@x
### Upgrades
@y
### Upgrades
@z

@x
- [Docker Compose 1.24.0](https://github.com/docker/compose/releases/tag/1.24.0)
- [Docker Engine 18.09.5](/engine/release-notes/), [Kubernetes 1.11.7](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.11.md#v1117) and [Compose on Kubernetes 0.4.22](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.22) for Version Pack Enterprise 2.1
- [Docker Engine 17.06.2-ee-21](/engine/release-notes/) for Version Pack Enterprise 2.0
@y
- [Docker Compose 1.24.0](https://github.com/docker/compose/releases/tag/1.24.0)
- [Docker Engine 18.09.5](/engine/release-notes/), [Kubernetes 1.11.7](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.11.md#v1117) and [Compose on Kubernetes 0.4.22](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.22) for Version Pack Enterprise 2.1
- [Docker Engine 17.06.2-ee-21](/engine/release-notes/) for Version Pack Enterprise 2.0
@z

@x
### Bug fixes and minor changes
@y
### Bug fixes and minor changes
@z

@x
- For security, only administrators can install or upgrade Version Packs using the `dockerdesktop-admin` tool.
- Truncate UDP DNS responses which are over 512 bytes in size
- Fixed airgap install of kubernetes in version pack enterprise-2.0
- Reset to factory default now resets to admin defaults
@y
- For security, only administrators can install or upgrade Version Packs using the `dockerdesktop-admin` tool.
- Truncate UDP DNS responses which are over 512 bytes in size
- Fixed airgap install of kubernetes in version pack enterprise-2.0
- Reset to factory default now resets to admin defaults
@z

@x
### Known issues
@y
### Known issues
@z

@x
- The Docker Template CLI plugin included in this version is an outdated version of the plugin and will fail when scaffolding templates. Note that the Application Designer is not affected by this outdated version of the CLI plugin.
@y
- The Docker Template CLI plugin included in this version is an outdated version of the plugin and will fail when scaffolding templates. Note that the Application Designer is not affected by this outdated version of the CLI plugin.
@z

@x
## Version 2.0.0.1
2019-03-01
@y
## Version 2.0.0.1
2019-03-01
@z

@x
**WARNING:** You must upgrade the previously installed Version Packs to the latest revision.
@y
**WARNING:** You must upgrade the previously installed Version Packs to the latest revision.
@z

@x
### Windows
@y
### Windows
@z

@x
#### Upgrades
@y
#### Upgrades
@z

@x
- Docker 18.09.3 for Version Pack Enterprise 2.1, fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
- Docker 17.06.2-ee-20 for Version Pack Enterprise 2.0, fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
@y
- Docker 18.09.3 for Version Pack Enterprise 2.1, fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
- Docker 17.06.2-ee-20 for Version Pack Enterprise 2.0, fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
@z

@x
#### Bug fixes and minor changes
@y
#### Bug fixes and minor changes
@z

@x
- Fixed port 8080 that was used on localhost when starting Kubernetes.
- Fixed Hub login through the desktop UI not sync with login through `docker login` command line.
- Fixed crash in system tray menu when the Hub login fails or Air gap mode.
@y
- Fixed port 8080 that was used on localhost when starting Kubernetes.
- Fixed Hub login through the desktop UI not sync with login through `docker login` command line.
- Fixed crash in system tray menu when the Hub login fails or Air gap mode.
@z

@x
### Mac
@y
### Mac
@z

@x
#### New features
@y
#### New features
@z

@x
- Added ability to list all installed version packs with the admin CLI command `dockerdesktop-admin version-pack list`.
- `dockerdesktop-admin app uninstall` will also remove Docker Desktop user files.
@y
- Added ability to list all installed version packs with the admin CLI command `dockerdesktop-admin version-pack list`.
- `dockerdesktop-admin app uninstall` will also remove Docker Desktop user files.
@z

@x
#### Upgrades
@y
#### Upgrades
@z

@x
- Docker 18.09.3 for Version Pack Enterprise 2.1, fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
- Docker 17.06.2-ee-20 for Version Pack Enterprise 2.0, fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
@y
- Docker 18.09.3 for Version Pack Enterprise 2.1, fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
- Docker 17.06.2-ee-20 for Version Pack Enterprise 2.0, fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
@z

@x
#### Bug fixes and minor changes
@y
#### Bug fixes and minor changes
@z

@x
- Fixed port 8080 that was used on localhost when starting Kubernetes.
- Improved error messaging to suggest running diagnostics / resetting to factory default only when it is appropriate.
@y
- Fixed port 8080 that was used on localhost when starting Kubernetes.
- Improved error messaging to suggest running diagnostics / resetting to factory default only when it is appropriate.
@z

@x
## Version 2.0.0.0
2019-01-31
@y
## Version 2.0.0.0
2019-01-31
@z

@x
### New features
@y
### New features
@z

@x
- **Version selection**: Configurable version packs ensure the local
    instance of Docker Desktop Enterprise is a precise copy of the
    production environment where applications are deployed, and
    developers can switch between versions of Docker and
    Kubernetes with a single click.
@y
- **Version selection**: Configurable version packs ensure the local
    instance of Docker Desktop Enterprise is a precise copy of the
    production environment where applications are deployed, and
    developers can switch between versions of Docker and
    Kubernetes with a single click.
@z

@x
- **Application Designer**: Application templates allow you to choose a
    technology and focus on business logic. Updates can be made with
    minimal syntax knowledge.
@y
- **Application Designer**: Application templates allow you to choose a
    technology and focus on business logic. Updates can be made with
    minimal syntax knowledge.
@z

@x
- **Device management**: The Docker Desktop Enterprise installer is available as standard MSI (Win) and PKG (Mac) downloads, which allows administrators to script an installation across many developer machines.
@y
- **Device management**: The Docker Desktop Enterprise installer is available as standard MSI (Win) and PKG (Mac) downloads, which allows administrators to script an installation across many developer machines.
@z

@x
- **Administrative control**: IT organizations can specify and lock configuration parameters for creation of a standardized development environment, including disabling drive sharing and limiting version pack installations. Developers run commands in the command line without worrying about configuration settings.
@y
- **Administrative control**: IT organizations can specify and lock configuration parameters for creation of a standardized development environment, including disabling drive sharing and limiting version pack installations. Developers run commands in the command line without worrying about configuration settings.
@z
