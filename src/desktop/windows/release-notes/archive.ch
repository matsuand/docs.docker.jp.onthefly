%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Windows Release notes for older versions
keywords: Docker Desktop for Windows, release notes
title: Release notes for previous versions
toc_min: 1
toc_max: 2
---
@y
---
description: Docker Desktop for Windows Release notes for older versions
keywords: Docker Desktop for Windows, release notes
title: Release notes for previous versions
toc_min: 1
toc_max: 2
---
@z

@x
This page contains release notes for older versions of Docker Desktop for Windows.
@y
This page contains release notes for older versions of Docker Desktop for Windows.
@z

@x
## Stable Releases of 2018
@y
## Stable Releases of 2018
@z

@x
### Docker Community Edition 18.06.1-ce-win73 2018-08-29
@y
### Docker Community Edition 18.06.1-ce-win73 2018-08-29
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/19507/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/19507/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 18.06.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.1-ce)
@y
* Upgrades
  - [Docker 18.06.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.1-ce)
@z

@x
* Bug fixes and minor changes
  - Fix bug in VM activity detection, preventing Docker Desktop from starting. Fixes [docker/for-win#2404](https://github.com/docker/for-win/issues/2404)
  - Fix bug in detection when Windows service is not running, and propose to restart the service.
  - Fix local DNS failing to resolve inside containers. Fixes [docker/for-win#2301](https://github.com/docker/for-win/issues/2301), [docker/for-win#2304](https://github.com/docker/for-win/issues/2304)
  - Fix Kubernetes status display after reset to factory default
  - Fix bug where `host.docker.internal` is not resolved in some cases. Fixes [docker/for-win#2402](https://github.com/docker/for-win/issues/2402)
  - Use a 1MB vhdx blocksize instead of the default 32MB. See [docker/for-win#244](https://github.com/docker/for-win/issues/244). Also see [Microsoft Best Practices for running Linux on Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/best-practices-for-running-linux-on-hyper-v)
  - Fix diagnostics in specific cases when the Windows service is not started.
  - Changed the samba default file permission to avoid an issue with too open rights. Fixes [docker/for-win#2170](https://github.com/docker/for-win/issues/2170)
  - On RS5 insider, fixed wrong detection of missing feature "Containers" requiring you to install the feature and then reboot.
@y
* Bug fixes and minor changes
  - Fix bug in VM activity detection, preventing Docker Desktop from starting. Fixes [docker/for-win#2404](https://github.com/docker/for-win/issues/2404)
  - Fix bug in detection when Windows service is not running, and propose to restart the service.
  - Fix local DNS failing to resolve inside containers. Fixes [docker/for-win#2301](https://github.com/docker/for-win/issues/2301), [docker/for-win#2304](https://github.com/docker/for-win/issues/2304)
  - Fix Kubernetes status display after reset to factory default
  - Fix bug where `host.docker.internal` is not resolved in some cases. Fixes [docker/for-win#2402](https://github.com/docker/for-win/issues/2402)
  - Use a 1MB vhdx blocksize instead of the default 32MB. See [docker/for-win#244](https://github.com/docker/for-win/issues/244). Also see [Microsoft Best Practices for running Linux on Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/best-practices-for-running-linux-on-hyper-v)
  - Fix diagnostics in specific cases when the Windows service is not started.
  - Changed the samba default file permission to avoid an issue with too open rights. Fixes [docker/for-win#2170](https://github.com/docker/for-win/issues/2170)
  - On RS5 insider, fixed wrong detection of missing feature "Containers" requiring you to install the feature and then reboot.
@z

@x
### Docker Community Edition 18.06.0-ce-win72 2018-07-26
@y
### Docker Community Edition 18.06.0-ce-win72 2018-07-26
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/19098/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/19098/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* New
  - Renewed signing certificate. The installer may show a Windows Defender popup until the renewed certificate is allowlisted. Click "More info" to view the app is published by "Docker Inc" and run it.
@y
* New
  - Renewed signing certificate. The installer may show a Windows Defender popup until the renewed certificate is allowlisted. Click "More info" to view the app is published by "Docker Inc" and run it.
@z

@x
* Bug fixes and minor changes
  - Fix bug in automatic feature enabling if "Hyper-V" and "Containers" Windows features are not enabled already when starting Docker Desktop.
@y
* Bug fixes and minor changes
  - Fix bug in automatic feature enabling if "Hyper-V" and "Containers" Windows features are not enabled already when starting Docker Desktop.
@z

@x
### Docker Community Edition 18.06.0-ce-win70 2018-07-25
@y
### Docker Community Edition 18.06.0-ce-win70 2018-07-25
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/19075/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/19075/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
  - [LinuxKit v0.4](https://github.com/linuxkit/linuxkit/releases/tag/v0.4)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled
@y
* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
  - [LinuxKit v0.4](https://github.com/linuxkit/linuxkit/releases/tag/v0.4)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled
@z

@x
* New
  - Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker for Windows settings and use kubectl commands as well as Docker commands. See [the Kubernetes section](../../kubernetes.md)
@y
* New
  - Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker for Windows settings and use kubectl commands as well as Docker commands. See [the Kubernetes section](../../kubernetes.md)
@z

@x
* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset the disk image (in Settings > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - Fix bug which would in some cases cause virtual machine logs to be written to RAM rather than disk, and the virtual machine to hang.
  - Fix security issue with named pipe connection to docker service.
  - Fix VPNKit memory leak. Fixes [docker/for-win#2087](https://github.com/docker/for-win/issues/2087), [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Fix restart issue when using Windows fast startup on latest 1709 Windows updates. Fixes [docker/for-win#1741](https://github.com/docker/for-win/issues/1741), [docker/for-win#1741](https://github.com/docker/for-win/issues/1741)
  - DNS name `host.docker.internal` can be used for host resolution from Windows Containers.  Fixes [docker/for-win#1976](https://github.com/docker/for-win/issues/1976)
  - Fix broken link in diagnostics window.
  - Added log rotation for docker-ce logs inside the virtual machine.
  - Changed smb permission to avoid issue when trying to manipulate files with different users in containers. Fixes [docker/for-win#2170](https://github.com/docker/for-win/issues/2170)
@y
* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset the disk image (in Settings > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - Fix bug which would in some cases cause virtual machine logs to be written to RAM rather than disk, and the virtual machine to hang.
  - Fix security issue with named pipe connection to docker service.
  - Fix VPNKit memory leak. Fixes [docker/for-win#2087](https://github.com/docker/for-win/issues/2087), [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Fix restart issue when using Windows fast startup on latest 1709 Windows updates. Fixes [docker/for-win#1741](https://github.com/docker/for-win/issues/1741), [docker/for-win#1741](https://github.com/docker/for-win/issues/1741)
  - DNS name `host.docker.internal` can be used for host resolution from Windows Containers.  Fixes [docker/for-win#1976](https://github.com/docker/for-win/issues/1976)
  - Fix broken link in diagnostics window.
  - Added log rotation for docker-ce logs inside the virtual machine.
  - Changed smb permission to avoid issue when trying to manipulate files with different users in containers. Fixes [docker/for-win#2170](https://github.com/docker/for-win/issues/2170)
@z

@x
### Docker Community Edition 18.03.1-ce-win65 2018-04-30
@y
### Docker Community Edition 18.03.1-ce-win65 2018-04-30
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/17513/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/17513/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.1](https://github.com/docker/compose/releases/tag/1.21.1)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@y
* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.1](https://github.com/docker/compose/releases/tag/1.21.1)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@z

@x
* Bug fixes and minor changes
  - Fix startup failure when the HOME environment variable is already defined (typically started from the command line). Fixes [docker/for-win#1880](https://github.com/docker/for-win/issues/1880)
  - Fix startup failure due to incompatibility with other programs (like Razer Synapse 3). Fixes [docker/for-win#1723](https://github.com/docker/for-win/issues/1723)
@y
* Bug fixes and minor changes
  - Fix startup failure when the HOME environment variable is already defined (typically started from the command line). Fixes [docker/for-win#1880](https://github.com/docker/for-win/issues/1880)
  - Fix startup failure due to incompatibility with other programs (like Razer Synapse 3). Fixes [docker/for-win#1723](https://github.com/docker/for-win/issues/1723)
@z

@x
### Docker Community Edition 18.03.1-ce-win64 2018-04-26
@y
### Docker Community Edition 18.03.1-ce-win64 2018-04-26
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/17438/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/17438/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.0](https://github.com/docker/compose/releases/tag/1.21.0)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@y
* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.0](https://github.com/docker/compose/releases/tag/1.21.0)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@z

@x
* Bug fixes and minor changes
  - Fix startup failure when the HOME environment variable is already defined (typically started from the command line). Fixes [docker/for-win#1880](https://github.com/docker/for-win/issues/1880)
  - Fix startup failure due to incompatibility with other programs (like Razer Synapse 3). Fixes [docker/for-win#1723](https://github.com/docker/for-win/issues/1723)
@y
* Bug fixes and minor changes
  - Fix startup failure when the HOME environment variable is already defined (typically started from the command line). Fixes [docker/for-win#1880](https://github.com/docker/for-win/issues/1880)
  - Fix startup failure due to incompatibility with other programs (like Razer Synapse 3). Fixes [docker/for-win#1723](https://github.com/docker/for-win/issues/1723)
@z

@x
### Docker Community Edition 18.03.0-ce-win59 2018-03-26
@y
### Docker Community Edition 18.03.0-ce-win59 2018-03-26
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/16762/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/16762/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 18.03.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce)
  - [Docker Machine 0.14.0](https://github.com/docker/machine/releases/tag/v0.14.0)
  - [Docker compose 1.20.1](https://github.com/docker/compose/releases/tag/1.20.1)
  - [Notary 0.6.0](https://github.com/docker/notary/releases/tag/v0.6.0)
  - Linux Kernel 4.9.87
  - AUFS 20180312
@y
* Upgrades
  - [Docker 18.03.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce)
  - [Docker Machine 0.14.0](https://github.com/docker/machine/releases/tag/v0.14.0)
  - [Docker compose 1.20.1](https://github.com/docker/compose/releases/tag/1.20.1)
  - [Notary 0.6.0](https://github.com/docker/notary/releases/tag/v0.6.0)
  - Linux Kernel 4.9.87
  - AUFS 20180312
@z

@x
* New
  - Virtual machine disk size can be changed in settings. Fixes [docker/for-win#105](https://github.com/docker/for-win/issues/105)
  - Virtual machine swap size can be changed in settings.
  - New menu item to restart Docker.
  - Support NFS Volume sharing. See [docker/for-win#1700](https://github.com/docker/for-win/issues/1700)
  - Allow to activate Windows Containers during installation (avoid virtual machine disk creation and virtual machine boot when working only on Windows containers). See [docker/for-win#217](https://github.com/docker/for-win/issues/217).
  - Experimental feature: LCOW containers can now be run next to Windows containers (on Windows RS3 build 16299 and later). Use `--platform=linux` in Windows container mode to run Linux Containers On Windows. Note that LCOW is experimental; it requires the daemon `experimental` option.
@y
* New
  - Virtual machine disk size can be changed in settings. Fixes [docker/for-win#105](https://github.com/docker/for-win/issues/105)
  - Virtual machine swap size can be changed in settings.
  - New menu item to restart Docker.
  - Support NFS Volume sharing. See [docker/for-win#1700](https://github.com/docker/for-win/issues/1700)
  - Allow to activate Windows Containers during installation (avoid virtual machine disk creation and virtual machine boot when working only on Windows containers). See [docker/for-win#217](https://github.com/docker/for-win/issues/217).
  - Experimental feature: LCOW containers can now be run next to Windows containers (on Windows RS3 build 16299 and later). Use `--platform=linux` in Windows container mode to run Linux Containers On Windows. Note that LCOW is experimental; it requires the daemon `experimental` option.
@z

@x
* Bug fixes and minor changes
  - Fix Windows Containers port forwarding on Windows 10 build 16299 post KB4074588. Fixes [docker/for-win#1707](https://github.com/docker/for-win/issues/1707), [docker/for-win#1737](https://github.com/docker/for-win/issues/1737)
  - Fix daemon not starting properly when setting TLS-related options.
  - DNS name `host.docker.internal` shoud be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Fix for the HTTP/S transparent proxy when using "localhost" names (for example, `host.docker.internal`). Fixes [docker/for-win#1130](https://github.com/docker/for-win/issues/1130)
  - Fix Linuxkit start on Windows RS4 Insider. Fixes [docker/for-win#1458](https://github.com/docker/for-win/issues/1458), [docker/for-win#1514](https://github.com/docker/for-win/issues/1514), [docker/for-win#1640](https://github.com/docker/for-win/issues/1640)
  - Fix risk of privilege escalation. (https://www.tenable.com/sc-report-templates/microsoft-windows-unquoted-service-path-vulnerability)
  - All users present in the docker-users group are now able to use Docker. Fixes [docker/for-win#1732](https://github.com/docker/for-win/issues/1732)
  - Migration of Docker Toolbox images is not proposed in Docker For Windows installer (still possible to [migrate Toolbox images manually](../../../toolbox/index.md) ).
  - Better cleanup for Windows containers and images on reset/uninstall. Fixes [docker/for-win#1580](https://github.com/docker/for-win/issues/1580), [docker/for-win#1544](https://github.com/docker/for-win/issues/1544), [docker/for-win#191](https://github.com/docker/for-win/issues/191)
  - Desktop icon creation is optional in installer; do not recreate Desktop icon on upgrade (effective on next upgrade). Fixes [docker/for-win#246](https://github.com/docker/for-win/issues/246), [docker/for-win#925](https://github.com/docker/for-win/issues/925), [docker/for-win#1551](https://github.com/docker/for-win/issues/1551)
@y
* Bug fixes and minor changes
  - Fix Windows Containers port forwarding on Windows 10 build 16299 post KB4074588. Fixes [docker/for-win#1707](https://github.com/docker/for-win/issues/1707), [docker/for-win#1737](https://github.com/docker/for-win/issues/1737)
  - Fix daemon not starting properly when setting TLS-related options.
  - DNS name `host.docker.internal` shoud be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Fix for the HTTP/S transparent proxy when using "localhost" names (for example, `host.docker.internal`). Fixes [docker/for-win#1130](https://github.com/docker/for-win/issues/1130)
  - Fix Linuxkit start on Windows RS4 Insider. Fixes [docker/for-win#1458](https://github.com/docker/for-win/issues/1458), [docker/for-win#1514](https://github.com/docker/for-win/issues/1514), [docker/for-win#1640](https://github.com/docker/for-win/issues/1640)
  - Fix risk of privilege escalation. (https://www.tenable.com/sc-report-templates/microsoft-windows-unquoted-service-path-vulnerability)
  - All users present in the docker-users group are now able to use Docker. Fixes [docker/for-win#1732](https://github.com/docker/for-win/issues/1732)
  - Migration of Docker Toolbox images is not proposed in Docker For Windows installer (still possible to [migrate Toolbox images manually](../../../toolbox/index.md) ).
  - Better cleanup for Windows containers and images on reset/uninstall. Fixes [docker/for-win#1580](https://github.com/docker/for-win/issues/1580), [docker/for-win#1544](https://github.com/docker/for-win/issues/1544), [docker/for-win#191](https://github.com/docker/for-win/issues/191)
  - Desktop icon creation is optional in installer; do not recreate Desktop icon on upgrade (effective on next upgrade). Fixes [docker/for-win#246](https://github.com/docker/for-win/issues/246), [docker/for-win#925](https://github.com/docker/for-win/issues/925), [docker/for-win#1551](https://github.com/docker/for-win/issues/1551)
@z

@x
### Docker Community Edition 17.12.0-ce-win47 2018-01-12
@y
### Docker Community Edition 17.12.0-ce-win47 2018-01-12
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/15139/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/15139/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Bug fixes and minor changes
  - Fix linuxkit port-forwarder sometimes not being able to start. Fixes [docker/for-win#1506](https://github.com/docker/for-win/issues/1506)
  - Fix certificate management when connecting to a private registry. Fixes [docker/for-win#1512](https://github.com/docker/for-win/issues/1512)
  - Fix Mount compatibility when mounting drives with `-v //c/...`, now mounted in /host_mnt/c in the linuxkit virtual machine. Fixes [docker/for-win#1509](https://github.com/docker/for-win/issues/1509), [docker/for-win#1516](https://github.com/docker/for-win/issues/1516), [docker/for-win#1497](https://github.com/docker/for-win/issues/1497)
  - Fix icon displaying edge. Fixes [docker/for-win#1508](https://github.com/docker/for-win/issues/1508)
@y
* Bug fixes and minor changes
  - Fix linuxkit port-forwarder sometimes not being able to start. Fixes [docker/for-win#1506](https://github.com/docker/for-win/issues/1506)
  - Fix certificate management when connecting to a private registry. Fixes [docker/for-win#1512](https://github.com/docker/for-win/issues/1512)
  - Fix Mount compatibility when mounting drives with `-v //c/...`, now mounted in /host_mnt/c in the linuxkit virtual machine. Fixes [docker/for-win#1509](https://github.com/docker/for-win/issues/1509), [docker/for-win#1516](https://github.com/docker/for-win/issues/1516), [docker/for-win#1497](https://github.com/docker/for-win/issues/1497)
  - Fix icon displaying edge. Fixes [docker/for-win#1508](https://github.com/docker/for-win/issues/1508)
@z

@x
### Docker Community Edition 17.12.0-ce-win46 2018-01-09
@y
### Docker Community Edition 17.12.0-ce-win46 2018-01-09
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/15048/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/15048/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - Linux Kernel 4.9.60
@y
* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - Linux Kernel 4.9.60
@z

@x
* New
  - Virtual machine entirely built with linuxkit
  - Add localhost port forwarder for Windows (thanks @simonferquel). Use Microsoft localhost port forwarder when it is available (insider build RS4).
@y
* New
  - Virtual machine entirely built with linuxkit
  - Add localhost port forwarder for Windows (thanks @simonferquel). Use Microsoft localhost port forwarder when it is available (insider build RS4).
@z

@x
* Bug fixes and minor changes
  - Display various component versions in About box.
  - Fix vpnkit issue when username has spaces. See [docker/for-win#1429](https://github.com/docker/for-win/issues/1429)
  - Diagnostic improvements to get VM logs before VM shutdown.
  - Fix installer check for not supported Windows `CoreCountrySpecific` Edition.
  - Fix a class of startup failures where the database fails to start. See [docker/for-win#498](https://github.com/docker/for-win/issues/498)
  - Links in update changelog now open the default browser instead of IE. (fixes [docker/for-win#1311](https://github.com/docker/for-win/issues/1311))
@y
* Bug fixes and minor changes
  - Display various component versions in About box.
  - Fix vpnkit issue when username has spaces. See [docker/for-win#1429](https://github.com/docker/for-win/issues/1429)
  - Diagnostic improvements to get VM logs before VM shutdown.
  - Fix installer check for not supported Windows `CoreCountrySpecific` Edition.
  - Fix a class of startup failures where the database fails to start. See [docker/for-win#498](https://github.com/docker/for-win/issues/498)
  - Links in update changelog now open the default browser instead of IE. (fixes [docker/for-win#1311](https://github.com/docker/for-win/issues/1311))
@z

@x
## Stable Releases of 2017
@y
## Stable Releases of 2017
@z

@x
### Docker Community Edition 17.09.1-ce-win42 2017-12-11
@y
### Docker Community Edition 17.09.1-ce-win42 2017-12-11
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/14687/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/14687/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 17.09.1-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.1-ce)
  - [Docker compose 1.17.1](https://github.com/docker/compose/releases/tag/1.17.1)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
@y
* Upgrades
  - [Docker 17.09.1-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.1-ce)
  - [Docker compose 1.17.1](https://github.com/docker/compose/releases/tag/1.17.1)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
@z

@x
* Bug fixes and minor changes
  - Fix bug during Windows fast-startup process. Fixes [for-win/#953](https://github.com/docker/for-win/issues/953)
  - Fix uninstaller issue (in some specific cases dockerd process was not killed properly)
  - Fix Net Promoter Score Gui bug. Fixes [for-win/#1277](https://github.com/docker/for-win/issues/1277)
  - Fix `docker.for.win.localhost` not working in proxy settings. Fixes [for-win/#1130](https://github.com/docker/for-win/issues/1130)
  - Increased timeout for virtual machine boot startup to 2 minutes.
@y
* Bug fixes and minor changes
  - Fix bug during Windows fast-startup process. Fixes [for-win/#953](https://github.com/docker/for-win/issues/953)
  - Fix uninstaller issue (in some specific cases dockerd process was not killed properly)
  - Fix Net Promoter Score Gui bug. Fixes [for-win/#1277](https://github.com/docker/for-win/issues/1277)
  - Fix `docker.for.win.localhost` not working in proxy settings. Fixes [for-win/#1130](https://github.com/docker/for-win/issues/1130)
  - Increased timeout for virtual machine boot startup to 2 minutes.
@z

@x
### Docker Community Edition 17.09.0-ce-win33 2017-10-06
@y
### Docker Community Edition 17.09.0-ce-win33 2017-10-06
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/13620/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/13620/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Bug fixes
  - Fix Docker For Windows unable to start in some cases: removed use of libgmp sometimes causing the vpnkit process to die.
@y
* Bug fixes
  - Fix Docker For Windows unable to start in some cases: removed use of libgmp sometimes causing the vpnkit process to die.
@z

@x
### Docker Community Edition 17.09.0-ce-win32 2017-10-02
@y
### Docker Community Edition 17.09.0-ce-win32 2017-10-02
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/13529/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/13529/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker Compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
@y
* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker Compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
@z

@x
* New
  - Windows Docker daemon is now started as service for better lifecycle management
  - Store Linux daemon configuration in ~\.docker\daemon.json instead of settings file
  - Store Windows daemon configuration in C:\ProgramData\Docker\config\daemon.json instead of settings file
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Add `Skip This Version` button in update window
@y
* New
  - Windows Docker daemon is now started as service for better lifecycle management
  - Store Linux daemon configuration in ~\.docker\daemon.json instead of settings file
  - Store Windows daemon configuration in C:\ProgramData\Docker\config\daemon.json instead of settings file
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Add `Skip This Version` button in update window
@z

@x
* Security fixes
  - VPNKit: security fix to reduce the risk of DNS cache poisoning attack (reported by Hannes Mehnert https://hannes.nqsb.io/)
@y
* Security fixes
  - VPNKit: security fix to reduce the risk of DNS cache poisoning attack (reported by Hannes Mehnert https://hannes.nqsb.io/)
@z

@x
* Bug fixes and minor changes
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING
  - Rotate logs in the virtual machine more often (docker/for-win#244)
  - Reset to default stops all engines and removes settings including all daemon.json files
  - Better backend service checks (related to https://github.com/docker/for-win/issues/953)
  - Fix auto updates checkbox, no need to restart the application
  - Fix check for updates menu when auto updates was disable
  - VPNKit: do not block startup when ICMP permission is denied. (Fixes docker/for-win#1036, docker/for-win#1035, docker/for-win#1040)
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the UNIX domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Do not move credentials into the credential store at startup
@y
* Bug fixes and minor changes
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING
  - Rotate logs in the virtual machine more often (docker/for-win#244)
  - Reset to default stops all engines and removes settings including all daemon.json files
  - Better backend service checks (related to https://github.com/docker/for-win/issues/953)
  - Fix auto updates checkbox, no need to restart the application
  - Fix check for updates menu when auto updates was disable
  - VPNKit: do not block startup when ICMP permission is denied. (Fixes docker/for-win#1036, docker/for-win#1035, docker/for-win#1040)
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the UNIX domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Do not move credentials into the credential store at startup
@z

@x
### Docker Community Edition 17.06.2-ce-win27 2017-09-06
@y
### Docker Community Edition 17.06.2-ce-win27 2017-09-06
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/13194/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/13194/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 17.06.2-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.2-ce)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
@y
* Upgrades
  - [Docker 17.06.2-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.2-ce)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
@z

@x
### Docker Community Edition 17.06.1-ce-rc1-win24 2017-08-24
@y
### Docker Community Edition 17.06.1-ce-rc1-win24 2017-08-24
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/13025/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/13025/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.1-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce-rc1)
- Linux Kernel 4.9.36
- AUFS 20170703
@y
- [Docker 17.06.1-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce-rc1)
- Linux Kernel 4.9.36
- AUFS 20170703
@z

@x
**Bug fixes and minor**
@y
**Bug fixes and minor**
@z

@x
- Fix locked container id file (Fixes [docker/for-win#818](https://github.com/docker/for-win/issues/818))
- Avoid expanding variables in PATH env variable (Fixes [docker/for-win#859](https://github.com/docker/for-win/issues/859))
@y
- Fix locked container id file (Fixes [docker/for-win#818](https://github.com/docker/for-win/issues/818))
- Avoid expanding variables in PATH env variable (Fixes [docker/for-win#859](https://github.com/docker/for-win/issues/859))
@z

@x
### Docker Community Edition 17.06.0-ce-win18 2017-06-28
@y
### Docker Community Edition 17.06.0-ce-win18 2017-06-28
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/12627/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/12627/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)
- [Docker Credential Helpers 0.5.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.2)
- [Docker Machine 0.12.0](https://github.com/docker/machine/releases/tag/v0.12.0)
- [Docker compose 1.14.0](https://github.com/docker/compose/releases/tag/1.14.0)
- Linux Kernel 4.9.31
@y
- [Docker 17.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)
- [Docker Credential Helpers 0.5.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.2)
- [Docker Machine 0.12.0](https://github.com/docker/machine/releases/tag/v0.12.0)
- [Docker compose 1.14.0](https://github.com/docker/compose/releases/tag/1.14.0)
- Linux Kernel 4.9.31
@z

@x
**New**
@y
**New**
@z

@x
- Windows Server 2016 support
- Windows 10586 is marked as deprecated; it is not supported going forward in stable releases
- Integration with Docker Cloud, with the ability to control remote Swarms from the local command line interface (CLI) and view your repositories
- Unified login between the Docker CLI and Docker Hub, Docker Cloud.
- Sharing a drive can be done on demand, the first time a mount is requested
- Add an experimental DNS name for the host: docker.for.win.localhost
- Support for client (i.e. "login") certificates for authenticating registry access (fixes [docker/for-win#569](https://github.com/docker/for-win/issues/569))
- New installer experience
@y
- Windows Server 2016 support
- Windows 10586 is marked as deprecated; it is not supported going forward in stable releases
- Integration with Docker Cloud, with the ability to control remote Swarms from the local command line interface (CLI) and view your repositories
- Unified login between the Docker CLI and Docker Hub, Docker Cloud.
- Sharing a drive can be done on demand, the first time a mount is requested
- Add an experimental DNS name for the host: docker.for.win.localhost
- Support for client (i.e. "login") certificates for authenticating registry access (fixes [docker/for-win#569](https://github.com/docker/for-win/issues/569))
- New installer experience
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Fixed group access check for users logged in with Active Directory (fixes [docker/for-win#785](https://github.com/docker/for-win/issues/785))
- Checked environment variables and add some warnings in logs if they can cause docker to fail
- Many processes that were running in admin mode now run within the user identity
- Cloud federation command lines now open in the user home directory
- Named pipes are now created with more constrained security descriptors to improve security
- Security fix: Users must be part of the specific group "docker-users" to run Docker for Windows
- Reset to default / uninstall also reset Docker cli settings and logout user from Docker Cloud and registries
- Detected a bitlocker policy preventing windows containers to work
- Fixed an issue on filesharing when explicitly disabled on vmswitch interface
- Fixed virtual machine not starting when the machine had a very long name
- Fixed a bug where Windows daemon.json file was not written (fixes [docker/for-win#670](https://github.com/docker/for-win/issues/670))
- Added patches to the kernel to fix VMBus crash
- Named pipe client connection should not trigger dead locks on `docker run` with data in stdin any more
- Buffered data should be treated correctly when docker client requests are upgraded to raw streams
@y
- Fixed group access check for users logged in with Active Directory (fixes [docker/for-win#785](https://github.com/docker/for-win/issues/785))
- Checked environment variables and add some warnings in logs if they can cause docker to fail
- Many processes that were running in admin mode now run within the user identity
- Cloud federation command lines now open in the user home directory
- Named pipes are now created with more constrained security descriptors to improve security
- Security fix: Users must be part of the specific group "docker-users" to run Docker for Windows
- Reset to default / uninstall also reset Docker cli settings and logout user from Docker Cloud and registries
- Detected a bitlocker policy preventing windows containers to work
- Fixed an issue on filesharing when explicitly disabled on vmswitch interface
- Fixed virtual machine not starting when the machine had a very long name
- Fixed a bug where Windows daemon.json file was not written (fixes [docker/for-win#670](https://github.com/docker/for-win/issues/670))
- Added patches to the kernel to fix VMBus crash
- Named pipe client connection should not trigger dead locks on `docker run` with data in stdin any more
- Buffered data should be treated correctly when docker client requests are upgraded to raw streams
@z

@x
### Docker Community Edition 17.03.1-ce-win12  2017-05-12
@y
### Docker Community Edition 17.03.1-ce-win12  2017-05-12
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/12058/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/12058/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Security fix for CVE-2017-7308
@y
- Security fix for CVE-2017-7308
@z

@x
### Docker Community Edition 17.03.0, 2017-03-02
@y
### Docker Community Edition 17.03.0, 2017-03-02
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/10743/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/10743/Docker%20for%20Windows%20Installer.exe){: .accept-eula }
@z

@x
**New**
@y
**New**
@z

@x
- Renamed to Docker Community Edition
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users
  progressively
@y
- Renamed to Docker Community Edition
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users
  progressively
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.03.0-ce](https://github.com/docker/docker/releases/tag/v17.03.0-ce)
- [Docker Compose 1.11.2](https://github.com/docker/compose/releases/tag/1.11.2)
- [Docker Machine 0.10.0](https://github.com/docker/machine/releases/tag/v0.10.0)
- Linux kernel 4.9.12
@y
- [Docker 17.03.0-ce](https://github.com/docker/docker/releases/tag/v17.03.0-ce)
- [Docker Compose 1.11.2](https://github.com/docker/compose/releases/tag/1.11.2)
- [Docker Machine 0.10.0](https://github.com/docker/machine/releases/tag/v0.10.0)
- Linux kernel 4.9.12
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Matched Hyper-V Integration Services by ID, not name
- Don't consume 100% CPU when the service is stopped
- Log the diagnostic id when uploading
- Improved firewall handling: stop listing the rules since it can take a lot of time
- Don't rollback to the previous engine when the desired engine fails to start
- Don't use port 4222 inside the Linux virtual machine
- Fixed startup error of ObjectNotFound in Set-VMFirmware
- Added detailed logs when firewall is configured
- Added a link to the Experimental Features documentation
- Fixed the copyright in the About dialog
- VPNKit: fix unmarshalling of DNS packets containing pointers to pointers to labels
- VPNKit: set the Recursion Available bit on DNS responses from the cache
- VPNKit: Avoid diagnostics to capture too much data
- VPNKit: fix a source of occasional packet loss (truncation) on the virtual ethernet link
- Fixed negotiation of TimeSync protocol version (through kernel update)
@y
- Matched Hyper-V Integration Services by ID, not name
- Don't consume 100% CPU when the service is stopped
- Log the diagnostic id when uploading
- Improved firewall handling: stop listing the rules since it can take a lot of time
- Don't rollback to the previous engine when the desired engine fails to start
- Don't use port 4222 inside the Linux virtual machine
- Fixed startup error of ObjectNotFound in Set-VMFirmware
- Added detailed logs when firewall is configured
- Added a link to the Experimental Features documentation
- Fixed the copyright in the About dialog
- VPNKit: fix unmarshalling of DNS packets containing pointers to pointers to labels
- VPNKit: set the Recursion Available bit on DNS responses from the cache
- VPNKit: Avoid diagnostics to capture too much data
- VPNKit: fix a source of occasional packet loss (truncation) on the virtual ethernet link
- Fixed negotiation of TimeSync protocol version (through kernel update)
@z

@x
### Docker for Windows 1.13.1, 2017-02-09
@y
### Docker for Windows 1.13.1, 2017-02-09
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.13.1.10072/InstallDocker.msi){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.13.1.10072/InstallDocker.msi){: .accept-eula }
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 1.13.1](https://github.com/docker/docker/releases/tag/v1.13.1)
- [Docker Compose 1.11.1](https://github.com/docker/compose/releases/tag/1.11.1)
- Linux kernel 4.9.8
@y
- [Docker 1.13.1](https://github.com/docker/docker/releases/tag/v1.13.1)
- [Docker Compose 1.11.1](https://github.com/docker/compose/releases/tag/1.11.1)
- Linux kernel 4.9.8
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Add link to experimental features
- New 1.13 cancellable operations should now be properly handled by the Docker for desktop
- Various typos fixes
- Fix in Hyper-V VM setup (should fix `ObjectNotFound` errors)
@y
- Add link to experimental features
- New 1.13 cancellable operations should now be properly handled by the Docker for desktop
- Various typos fixes
- Fix in Hyper-V VM setup (should fix `ObjectNotFound` errors)
@z

@x
### Docker for Windows 1.13.0, 2017-01-19
@y
### Docker for Windows 1.13.0, 2017-01-19
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.13.0.9795/InstallDocker.msi){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.13.0.9795/InstallDocker.msi){: .accept-eula }
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)
- [Docker Compose 1.10](https://github.com/docker/compose/releases/tag/1.10.0)
- [Docker Machine 0.9.0](https://github.com/docker/machine/releases/tag/v0.9.0)
- [Notary 0.4.3](https://github.com/docker/notary/releases/tag/v0.4.3)
- Linux kernel 4.9.4
@y
- [Docker 1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)
- [Docker Compose 1.10](https://github.com/docker/compose/releases/tag/1.10.0)
- [Docker Machine 0.9.0](https://github.com/docker/machine/releases/tag/v0.9.0)
- [Notary 0.4.3](https://github.com/docker/notary/releases/tag/v0.4.3)
- Linux kernel 4.9.4
@z

@x
**New**
@y
**New**
@z

@x
- Windows containers
- Improved UI for Daemon.json editing
- VHDX file containing images and non-host mounted volumes can be moved
  (using "advanced" tab in the UI)
- Support for arm, aarch64, ppc64le architectures using qemu
- TRIM support for disk (shrinks virtual disk)
- Virtual machine's time synchronization is forced after the host wakes from sleep mode
- Docker Experimental mode can be toggled
@y
- Windows containers
- Improved UI for Daemon.json editing
- VHDX file containing images and non-host mounted volumes can be moved
  (using "advanced" tab in the UI)
- Support for arm, aarch64, ppc64le architectures using qemu
- TRIM support for disk (shrinks virtual disk)
- Virtual machine's time synchronization is forced after the host wakes from sleep mode
- Docker Experimental mode can be toggled
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Improved Proxy UI
- Improvements to Logging and Diagnostics
- About Box is now copy/paste enabled
- Improvements in drive sharing code
- Optimized boot process
- Trend Micro Office Scan made the API proxy think no drive was shared
- Show a link to the virtualization documentation
- Always remove the disk on factory reset
- VPNKit: Improved diagnostics
- VPNKit: Forwarded UDP datagrams have correct source port numbers
- VPNKit: If one request fails, allow other concurrent requests to succeed.
  For example this allows IPv4 servers to work even if IPv6 is broken.
- VPNKit: Fix bug which could cause the connection tracking to
  underestimate the number of active connections
- VPNKit: add a local cache of DNS responses
@y
- Improved Proxy UI
- Improvements to Logging and Diagnostics
- About Box is now copy/paste enabled
- Improvements in drive sharing code
- Optimized boot process
- Trend Micro Office Scan made the API proxy think no drive was shared
- Show a link to the virtualization documentation
- Always remove the disk on factory reset
- VPNKit: Improved diagnostics
- VPNKit: Forwarded UDP datagrams have correct source port numbers
- VPNKit: If one request fails, allow other concurrent requests to succeed.
  For example this allows IPv4 servers to work even if IPv6 is broken.
- VPNKit: Fix bug which could cause the connection tracking to
  underestimate the number of active connections
- VPNKit: add a local cache of DNS responses
@z

@x
## Stable Releases of 2016
@y
## Stable Releases of 2016
@z

@x
### Docker for Windows 1.12.5, 2016-12-20
@y
### Docker for Windows 1.12.5, 2016-12-20
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.12.5.9503/InstallDocker.msi){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.12.5.9503/InstallDocker.msi){: .accept-eula }
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.12.5
- Docker Compose 1.9.0
@y
- Docker 1.12.5
- Docker Compose 1.9.0
@z

@x
### Skipped Docker for Windows 1.12.4
@y
### Skipped Docker for Windows 1.12.4
@z

@x
We did not distribute a 1.12.4 stable release
@y
We did not distribute a 1.12.4 stable release
@z

@x
### Docker for Windows 1.12.3, 2016-11-09
@y
### Docker for Windows 1.12.3, 2016-11-09
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.12.3.8488/InstallDocker.msi){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.12.3.8488/InstallDocker.msi){: .accept-eula }
@z

@x
**New**
@y
**New**
@z

@x
- Restore the virtual machine's configuration after user changes
@y
- Restore the virtual machine's configuration after user changes
@z

@x
- Detect firewall configurations that might block file sharing
@y
- Detect firewall configurations that might block file sharing
@z

@x
- Send more GUI usage statistics to help us improve the product
@y
- Send more GUI usage statistics to help us improve the product
@z

@x
- The path to HyperV disks is not hardcoded anymore, making the Toolbox import work with non-standard paths
@y
- The path to HyperV disks is not hardcoded anymore, making the Toolbox import work with non-standard paths
@z

@x
- Verify that all HyperV features are enabled
@y
- Verify that all HyperV features are enabled
@z

@x
- Added Moby console to the logs
@y
- Added Moby console to the logs
@z

@x
- Save the current engine with the other settings
@y
- Save the current engine with the other settings
@z

@x
- Notary version 0.4.2 installed
@y
- Notary version 0.4.2 installed
@z

@x
- Reworked the File Sharing dialog and underlying mechanism
  - Pre-fill username
  - Faster and more reliable feedback when the user/password is not valid
  - Better support for domain users
  - Error message in Logs when File Sharing failed for other reasons
@y
- Reworked the File Sharing dialog and underlying mechanism
  - Pre-fill username
  - Faster and more reliable feedback when the user/password is not valid
  - Better support for domain users
  - Error message in Logs when File Sharing failed for other reasons
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.12.3
- Linux Kernel 4.4.27
- Docker Machine 0.8.2
- Docker Compose 1.8.1
- aufs 20160912
@y
- Docker 1.12.3
- Linux Kernel 4.4.27
- Docker Machine 0.8.2
- Docker Compose 1.8.1
- aufs 20160912
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
**General**
@y
**General**
@z

@x
- Added the settings to the diagnostics
@y
- Added the settings to the diagnostics
@z

@x
- Made sure we didn't use an older Nlog library from the GAC
@y
- Made sure we didn't use an older Nlog library from the GAC
@z

@x
- Fixed a password escaping regression
@y
- Fixed a password escaping regression
@z

@x
- Supports writing large values to the database, specially for trusted CAs
@y
- Supports writing large values to the database, specially for trusted CAs
@z

@x
- Preserves the Powershell stacktraces
@y
- Preserves the Powershell stacktraces
@z

@x
- Writes OS and Application versions at the top of each log file
@y
- Writes OS and Application versions at the top of each log file
@z

@x
- Don't recreate the virtual machine if only the DNS server is set
@y
- Don't recreate the virtual machine if only the DNS server is set
@z

@x
- The uninstaller now kills the service if it failed to stop it properly
@y
- The uninstaller now kills the service if it failed to stop it properly
@z

@x
- Improved debug information
@y
- Improved debug information
@z

@x
**Networking**
@y
**Networking**
@z

@x
- VpnKit is now restarted if it stops
@y
- VpnKit is now restarted if it stops
@z

@x
- VpnKit: impose a connection limit to avoid exhausting file descriptors
@y
- VpnKit: impose a connection limit to avoid exhausting file descriptors
@z

@x
- VpnKit: handle UDP datagrams larger than 2035 bytes
@y
- VpnKit: handle UDP datagrams larger than 2035 bytes
@z

@x
- VpnKit: reduce the number of file descriptors consumed by DNS
@y
- VpnKit: reduce the number of file descriptors consumed by DNS
@z

@x
**File sharing**
@y
**File sharing**
@z

@x
- Faster mount/unmount of shared drives
@y
- Faster mount/unmount of shared drives
@z

@x
- Added a timeout to mounting/unmounting a shared drive
@y
- Added a timeout to mounting/unmounting a shared drive
@z

@x
**Hyper-V**
@y
**Hyper-V**
@z

@x
- Make sure invalid "DockerNat" switches are not used
@y
- Make sure invalid "DockerNat" switches are not used
@z

@x
**Moby**
@y
**Moby**
@z

@x
- Increase default ulimit for memlock (fixes [https://github.com/docker/for-mac/issues/801](https://github.com/docker/for-mac/issues/801))
@y
- Increase default ulimit for memlock (fixes [https://github.com/docker/for-mac/issues/801](https://github.com/docker/for-mac/issues/801))
@z

@x
### Docker for Windows 1.12.1, 2016-09-16
@y
### Docker for Windows 1.12.1, 2016-09-16
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.12.1.7135/InstallDocker.msi){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.12.1.7135/InstallDocker.msi){: .accept-eula }
@z

@x
>**Important Note**:
>
> The auto-update function in Beta 21 cannot install this update. To install the latest beta manually if you are still on Beta 21, download the installer here:
@y
>**Important Note**:
>
> The auto-update function in Beta 21 cannot install this update. To install the latest beta manually if you are still on Beta 21, download the installer here:
@z

@x
> [https://download.docker.com/win/beta/InstallDocker.msi](https://download.docker.com/win/beta/InstallDocker.msi)
@y
> [https://download.docker.com/win/beta/InstallDocker.msi](https://download.docker.com/win/beta/InstallDocker.msi)
@z

@x
> This problem is fixed as of Beta 23 for subsequent auto-updates.
@y
> This problem is fixed as of Beta 23 for subsequent auto-updates.
@z

@x
**New**
@y
**New**
@z

@x
* To support trusted registry transparently, all trusted CAs (root or intermediate) on the Windows host are automatically copied to Moby
@y
* To support trusted registry transparently, all trusted CAs (root or intermediate) on the Windows host are automatically copied to Moby
@z

@x
* `Reset Credentials` also unshares the shared drives
@y
* `Reset Credentials` also unshares the shared drives
@z

@x
* Logs are now rotated every day
@y
* Logs are now rotated every day
@z

@x
* Support multiple DNS servers
@y
* Support multiple DNS servers
@z

@x
* Added `mfsymlinks` SMB option to support symlinks on bind mounted folder
@y
* Added `mfsymlinks` SMB option to support symlinks on bind mounted folder
@z

@x
* Added `nobrl` SMB option to support `sqlite` on bind mounted folders
@y
* Added `nobrl` SMB option to support `sqlite` on bind mounted folders
@z

@x
* Detect outdated versions of Kitematic
@y
* Detect outdated versions of Kitematic
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.1
* Docker machine 0.8.1
* Linux kernel 4.4.20
* aufs 20160905
@y
* Docker 1.12.1
* Docker machine 0.8.1
* Linux kernel 4.4.20
* aufs 20160905
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
**General**
@y
**General**
@z

@x
* Uploading a diagnostic now shows a proper status message in the Settings
@y
* Uploading a diagnostic now shows a proper status message in the Settings
@z

@x
* Docker stops asking to import from the Toolbox after an upgrade
@y
* Docker stops asking to import from the Toolbox after an upgrade
@z

@x
* Docker can now import from the Toolbox just after HyperV is activated
@y
* Docker can now import from the Toolbox just after HyperV is activated
@z

@x
* Added more debug information to the diagnostics
@y
* Added more debug information to the diagnostics
@z

@x
* Sending anonymous statistics doesn't hang anymore when Mixpanel is not available
@y
* Sending anonymous statistics doesn't hang anymore when Mixpanel is not available
@z

@x
* Support newlines in release notes
@y
* Support newlines in release notes
@z

@x
* Improve the error message when the Docker daemon is not responding
@y
* Improve the error message when the Docker daemon is not responding
@z

@x
* The configuration database is now stored in memory
@y
* The configuration database is now stored in memory
@z

@x
* Preserve the stacktrace of PowerShell errors
@y
* Preserve the stacktrace of PowerShell errors
@z

@x
* Display service stacktrace in error windows
@y
* Display service stacktrace in error windows
@z

@x
**Networking**
@y
**Networking**
@z

@x
* Improve name servers discovery
* VpnKit supports search domains
* VpnKit is now compiled with OCaml 4.03 rather than 4.02.3
@y
* Improve name servers discovery
* VpnKit supports search domains
* VpnKit is now compiled with OCaml 4.03 rather than 4.02.3
@z

@x
**File sharing**
@y
**File sharing**
@z

@x
* Set `cifs` version to 3.02
@y
* Set `cifs` version to 3.02
@z

@x
* VnpKit: reduce the number of sockets used by UDP NAT, reduce the probability
@y
* VnpKit: reduce the number of sockets used by UDP NAT, reduce the probability
@z

@x
* `slirp`: reduce the number of sockets used by UDP NAT, reduce the probability that NAT rules time out earlier than expected
@y
* `slirp`: reduce the number of sockets used by UDP NAT, reduce the probability that NAT rules time out earlier than expected
@z

@x
* Fixed password handling for host file system sharing
@y
* Fixed password handling for host file system sharing
@z

@x
**Hyper-V**
@y
**Hyper-V**
@z

@x
* Automatically disable lingering net adapters that prevent Docker from starting or using the network
@y
* Automatically disable lingering net adapters that prevent Docker from starting or using the network
@z

@x
* Automatically delete duplicated MobyLinuxVMs on a `reset to factory defaults`
@y
* Automatically delete duplicated MobyLinuxVMs on a `reset to factory defaults`
@z

@x
* Improved the HyperV detection and activation mechanism
@y
* Improved the HyperV detection and activation mechanism
@z

@x
**Moby**
@y
**Moby**
@z

@x
* Fixed Moby Diagnostics and Update Kernel
@y
* Fixed Moby Diagnostics and Update Kernel
@z

@x
* Use default `sysfs` settings, transparent huge pages disabled
@y
* Use default `sysfs` settings, transparent huge pages disabled
@z

@x
* `Cgroup` mount to support `systemd` in containers
@y
* `Cgroup` mount to support `systemd` in containers
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker automatically disables lingering net adapters. The only way to remove them is manually using `devmgmt.msc`.
@y
* Docker automatically disables lingering net adapters. The only way to remove them is manually using `devmgmt.msc`.
@z

@x
### Docker for Windows 1.12.0, 2016-07-28
@y
### Docker for Windows 1.12.0, 2016-07-28
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.12.0.5968/InstallDocker.msi){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [For Windows](https://download.docker.com/win/stable/1.12.0.5968/InstallDocker.msi){: .accept-eula }
@z

@x
* First stable release
@y
* First stable release
@z

@x
**Components**
@y
**Components**
@z

@x
* Docker 1.12.0
* Docker Machine 0.8.0
* Docker Compose 1.8.0
@y
* Docker 1.12.0
* Docker Machine 0.8.0
* Docker Compose 1.8.0
@z

@x
{% include eula-modal.html %}
@y
{% include eula-modal.html %}
@z
