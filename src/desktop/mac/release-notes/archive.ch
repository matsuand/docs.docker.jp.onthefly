%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Mac Release notes for older versions
keywords: Docker Desktop for Mac, release notes
title: Release notes for previous versions
toc_min: 1
toc_max: 2
---
@y
---
description: Docker Desktop for Mac Release notes for older versions
keywords: Docker Desktop for Mac, release notes
title: Release notes for previous versions
toc_min: 1
toc_max: 2
---
@z

@x
This page contains release notes for older versions of Docker Desktop for Mac.
@y
This page contains release notes for older versions of Docker Desktop for Mac.
@z

@x
## Stable Releases of 2018
@y
## Stable Releases of 2018
@z

@x
### Docker Community Edition 18.06.1-ce-mac73 2018-08-29
@y
### Docker Community Edition 18.06.1-ce-mac73 2018-08-29
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/26764/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/26764/Docker.dmg){: .accept-eula }
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
  - Fix local DNS failing to resolve inside containers.
@y
* Bug fixes and minor changes
  - Fix local DNS failing to resolve inside containers.
@z

@x
### Docker Community Edition 18.06.0-ce-mac70 2018-07-25
@y
### Docker Community Edition 18.06.0-ce-mac70 2018-07-25
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/26399/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/26399/Docker.dmg){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
  - [LinuxKit v0.5](https://github.com/linuxkit/linuxkit/releases/tag/v0.5)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled
@y
* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
  - [LinuxKit v0.5](https://github.com/linuxkit/linuxkit/releases/tag/v0.5)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled
@z

@x
* New
  - Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker For Mac Preferences and use kubectl commands as well as docker commands. See [the Kubernetes section](../../kubernetes.md)
  - Add an experimental SOCKS server to allow access to container networks, see [docker/for-mac#2670](https://github.com/docker/for-mac/issues/2670#issuecomment-372365274). Also see [docker/for-mac#2721](https://github.com/docker/for-mac/issues/2721)
  - Re-enable raw as the default disk format for users running macOS 10.13.4 and higher. Note this change only takes effect after a "reset to factory defaults" or "remove all data" (from the Whale menu -> Preferences -> Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
@y
* New
  - Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker For Mac Preferences and use kubectl commands as well as docker commands. See [the Kubernetes section](../../kubernetes.md)
  - Add an experimental SOCKS server to allow access to container networks, see [docker/for-mac#2670](https://github.com/docker/for-mac/issues/2670#issuecomment-372365274). Also see [docker/for-mac#2721](https://github.com/docker/for-mac/issues/2721)
  - Re-enable raw as the default disk format for users running macOS 10.13.4 and higher. Note this change only takes effect after a "reset to factory defaults" or "remove all data" (from the Whale menu -> Preferences -> Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
@z

@x
* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset disk image (in Preferences > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - OS X El Captain 10.11 is deprecated in Docker Desktop. You will not be able to install updates after Docker Desktop 18.06.x. We recommend upgrading to the latest version of macOS.
  - Fix bug which would cause VM logs to be written to RAM rather than disk in some cases, and the VM to hang. See [docker/for-mac#2984](https://github.com/docker/for-mac/issues/2984)
  - Fix network connection leak triggered by haproxy TCP health-checks [docker/for-mac#1132](https://github.com/docker/for-mac/issues/1132)
  - Better message to reset vmnetd when it's disabled. See [docker/for-mac#3035](https://github.com/docker/for-mac/issues/3035)
  - Fix VPNKit memory leak. Fixes [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Virtual Machine default disk path is stored relative to $HOME. Fixes [docker/for-mac#2928](https://github.com/docker/for-mac/issues/2928), [docker/for-mac#1209](https://github.com/docker/for-mac/issues/1209)
  - Use Simple NTP to minimise clock drift between the VM and the host. Fixes [docker/for-mac#2076](https://github.com/docker/for-mac/issues/2076)
  - Fix a race between calling stat on a file and calling close of a file descriptor referencing the file that could result in the stat failing with EBADF (often presented as "File not found"). Fixes [docker/for-mac#2870](https://github.com/docker/for-mac/issues/2870)
  - Do not allow install of Docker for Mac on macOS Yosemite 10.10, this version is not supported since Docker for Mac 17.09.0.
  - Fix button order in reset dialog windows. Fixes [docker/for-mac#2827](https://github.com/docker/for-mac/issues/2827)
  - Fix upgrade straight from pre-17.12 versions where Docker for Mac cannot restart once the upgrade has been performed. Fixes [docker/for-mac#2739](https://github.com/docker/for-mac/issues/2739)
  - Added log rotation for docker-ce logs inside the virtual machine.
@y
* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset disk image (in Preferences > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - OS X El Captain 10.11 is deprecated in Docker Desktop. You will not be able to install updates after Docker Desktop 18.06.x. We recommend upgrading to the latest version of macOS.
  - Fix bug which would cause VM logs to be written to RAM rather than disk in some cases, and the VM to hang. See [docker/for-mac#2984](https://github.com/docker/for-mac/issues/2984)
  - Fix network connection leak triggered by haproxy TCP health-checks [docker/for-mac#1132](https://github.com/docker/for-mac/issues/1132)
  - Better message to reset vmnetd when it's disabled. See [docker/for-mac#3035](https://github.com/docker/for-mac/issues/3035)
  - Fix VPNKit memory leak. Fixes [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Virtual Machine default disk path is stored relative to $HOME. Fixes [docker/for-mac#2928](https://github.com/docker/for-mac/issues/2928), [docker/for-mac#1209](https://github.com/docker/for-mac/issues/1209)
  - Use Simple NTP to minimise clock drift between the VM and the host. Fixes [docker/for-mac#2076](https://github.com/docker/for-mac/issues/2076)
  - Fix a race between calling stat on a file and calling close of a file descriptor referencing the file that could result in the stat failing with EBADF (often presented as "File not found"). Fixes [docker/for-mac#2870](https://github.com/docker/for-mac/issues/2870)
  - Do not allow install of Docker for Mac on macOS Yosemite 10.10, this version is not supported since Docker for Mac 17.09.0.
  - Fix button order in reset dialog windows. Fixes [docker/for-mac#2827](https://github.com/docker/for-mac/issues/2827)
  - Fix upgrade straight from pre-17.12 versions where Docker for Mac cannot restart once the upgrade has been performed. Fixes [docker/for-mac#2739](https://github.com/docker/for-mac/issues/2739)
  - Added log rotation for docker-ce logs inside the virtual machine.
@z

@x
### Docker Community Edition 18.03.1-ce-mac65 2018-04-30
@y
### Docker Community Edition 18.03.1-ce-mac65 2018-04-30
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/24312/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/24312/Docker.dmg){: .accept-eula }
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
  - Fix Docker for Mac not starting due to socket file paths being too long (typically HOME folder path being too long). Fixes [docker/for-mac#2727](https://github.com/docker/for-mac/issues/2727), [docker/for-mac#2731](https://github.com/docker/for-mac/issues/2731).
@y
* Bug fixes and minor changes
  - Fix Docker for Mac not starting due to socket file paths being too long (typically HOME folder path being too long). Fixes [docker/for-mac#2727](https://github.com/docker/for-mac/issues/2727), [docker/for-mac#2731](https://github.com/docker/for-mac/issues/2731).
@z

@x
### Docker Community Edition 18.03.1-ce-mac64 2018-04-26
@y
### Docker Community Edition 18.03.1-ce-mac64 2018-04-26
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/24245/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/24245/Docker.dmg){: .accept-eula }
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
  - Fix Docker for Mac not starting due to socket file paths being too long (typically HOME folder path being too long). Fixes [docker/for-mac#2727](https://github.com/docker/for-mac/issues/2727), [docker/for-mac#2731](https://github.com/docker/for-mac/issues/2731).
@y
* Bug fixes and minor changes
  - Fix Docker for Mac not starting due to socket file paths being too long (typically HOME folder path being too long). Fixes [docker/for-mac#2727](https://github.com/docker/for-mac/issues/2727), [docker/for-mac#2731](https://github.com/docker/for-mac/issues/2731).
@z

@x
### Docker Community Edition 18.03.0-ce-mac60 2018-03-30
@y
### Docker Community Edition 18.03.0-ce-mac60 2018-03-30
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/23751/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/23751/Docker.dmg){: .accept-eula }
@z

@x
* Bug fixes and minor changes
  - Fix Upgrade straight from 17.09 versions where Docker for Mac cannot restart once the upgrade has been performed. Fixes [docker/for-mac#2739](https://github.com/docker/for-mac/issues/2739)
@y
* Bug fixes and minor changes
  - Fix Upgrade straight from 17.09 versions where Docker for Mac cannot restart once the upgrade has been performed. Fixes [docker/for-mac#2739](https://github.com/docker/for-mac/issues/2739)
@z

@x
### Docker Community Edition 18.03.0-ce-mac59 2018-03-26
@y
### Docker Community Edition 18.03.0-ce-mac59 2018-03-26
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/23608/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/23608/Docker.dmg){: .accept-eula }
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
  - VM Swap size can be changed in settings. See [docker/for-mac#2566](https://github.com/docker/for-mac/issues/2566), [docker/for-mac#2389](https://github.com/docker/for-mac/issues/2389)
  - New menu item to restart Docker.
  - Support NFS Volume sharing.
  - The directory holding the disk images has been renamed (from `~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux` to ~/Library/Containers/com.docker.docker/Data/vms/0`).
@y
* New
  - VM Swap size can be changed in settings. See [docker/for-mac#2566](https://github.com/docker/for-mac/issues/2566), [docker/for-mac#2389](https://github.com/docker/for-mac/issues/2389)
  - New menu item to restart Docker.
  - Support NFS Volume sharing.
  - The directory holding the disk images has been renamed (from `~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux` to ~/Library/Containers/com.docker.docker/Data/vms/0`).
@z

@x
* Bug fixes and minor changes
  - Fix daemon not starting properly when setting TLS-related options. Fixes [docker/for-mac#2663](https://github.com/docker/for-mac/issues/2663)
  - DNS name `host.docker.internal` should be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Fix for the HTTP/S transparent proxy when using "localhost" names (e.g. `host.docker.internal`).
  - Fix empty registry added by mistake in some cases in the Preference Daemon Pane. Fixes [docker/for-mac#2537](https://github.com/docker/for-mac/issues/2537)
  - Clearer error message when incompatible hardware is detected.
  - Fix some cases where selecting "Reset" after an error did not reset properly.
  - Fix incorrect NTP config. Fixes [docker/for-mac#2529](https://github.com/docker/for-mac/issues/2529)
  - Migration of Docker Toolbox images is not proposed anymore in Docker For Mac installer (still possible to [migrate Toolbox images manually](../../../toolbox/index.md)).
@y
* Bug fixes and minor changes
  - Fix daemon not starting properly when setting TLS-related options. Fixes [docker/for-mac#2663](https://github.com/docker/for-mac/issues/2663)
  - DNS name `host.docker.internal` should be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Fix for the HTTP/S transparent proxy when using "localhost" names (e.g. `host.docker.internal`).
  - Fix empty registry added by mistake in some cases in the Preference Daemon Pane. Fixes [docker/for-mac#2537](https://github.com/docker/for-mac/issues/2537)
  - Clearer error message when incompatible hardware is detected.
  - Fix some cases where selecting "Reset" after an error did not reset properly.
  - Fix incorrect NTP config. Fixes [docker/for-mac#2529](https://github.com/docker/for-mac/issues/2529)
  - Migration of Docker Toolbox images is not proposed anymore in Docker For Mac installer (still possible to [migrate Toolbox images manually](../../../toolbox/index.md)).
@z

@x
### Docker Community Edition 17.12.0-ce-mac55 2018-02-27
@y
### Docker Community Edition 17.12.0-ce-mac55 2018-02-27
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/23011/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/23011/Docker.dmg){: .accept-eula }
@z

@x
* Bug fixes and minor changes
  - Revert the default disk format to qcow2 for users running macOS 10.13 (High Sierra). There are confirmed reports of file corruption using the raw format which uses sparse files on APFS. Note this change only takes effect after a reset to factory defaults (from the Whale menu -> Preferences -> Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
  - Fix VPNKit proxy for docker.for.mac.http.internal.
@y
* Bug fixes and minor changes
  - Revert the default disk format to qcow2 for users running macOS 10.13 (High Sierra). There are confirmed reports of file corruption using the raw format which uses sparse files on APFS. Note this change only takes effect after a reset to factory defaults (from the Whale menu -> Preferences -> Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
  - Fix VPNKit proxy for docker.for.mac.http.internal.
@z

@x
### Docker Community Edition 17.12.0-ce-mac49 2018-01-19
@y
### Docker Community Edition 17.12.0-ce-mac49 2018-01-19
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/21805/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/21805/Docker.dmg){: .accept-eula }
@z

@x
* Bug fixes and minor changes
  - Fix error during resize/create Docker.raw disk image in some cases. Fixes [docker/for-mac#2383](https://github.com/docker/for-mac/issues/2383), [docker/for-mac#2447](https://github.com/docker/for-mac/issues/2447), [docker/for-mac#2453], (https://github.com/docker/for-mac/issues/2453), [docker/for-mac#2420](https://github.com/docker/for-mac/issues/2420)
  - Fix additional allocated disk space not available in containers. Fixes [docker/for-mac#2449](https://github.com/docker/for-mac/issues/2449)
  - Vpnkit port max idle time default restored to 300s. Fixes [docker/for-mac#2442](https://github.com/docker/for-mac/issues/2442)
  - Fix using an HTTP proxy with authentication. Fixes [docker/for-mac#2386](https://github.com/docker/for-mac/issues/2386)
  - Allow HTTP proxy excludes to be written as .docker.com as well as *.docker.com
  - Allow individual IP addresses to be added to HTTP proxy excludes.
  - Avoid hitting DNS timeouts when querying docker.for.mac.* when the upstream DNS servers are slow or missing.
@y
* Bug fixes and minor changes
  - Fix error during resize/create Docker.raw disk image in some cases. Fixes [docker/for-mac#2383](https://github.com/docker/for-mac/issues/2383), [docker/for-mac#2447](https://github.com/docker/for-mac/issues/2447), [docker/for-mac#2453], (https://github.com/docker/for-mac/issues/2453), [docker/for-mac#2420](https://github.com/docker/for-mac/issues/2420)
  - Fix additional allocated disk space not available in containers. Fixes [docker/for-mac#2449](https://github.com/docker/for-mac/issues/2449)
  - Vpnkit port max idle time default restored to 300s. Fixes [docker/for-mac#2442](https://github.com/docker/for-mac/issues/2442)
  - Fix using an HTTP proxy with authentication. Fixes [docker/for-mac#2386](https://github.com/docker/for-mac/issues/2386)
  - Allow HTTP proxy excludes to be written as .docker.com as well as *.docker.com
  - Allow individual IP addresses to be added to HTTP proxy excludes.
  - Avoid hitting DNS timeouts when querying docker.for.mac.* when the upstream DNS servers are slow or missing.
@z

@x
### Docker Community Edition 17.12.0-ce-mac47 2018-01-12
@y
### Docker Community Edition 17.12.0-ce-mac47 2018-01-12
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/21698/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/21698/Docker.dmg){: .accept-eula }
@z

@x
* Bug fixes and minor changes
  - Fix for `docker push` to an insecure registry. Fixes [docker/for-mac#2392](https://github.com/docker/for-mac/issues/2392)
  - Separate internal ports used to proxy HTTP and HTTPS content.
@y
* Bug fixes and minor changes
  - Fix for `docker push` to an insecure registry. Fixes [docker/for-mac#2392](https://github.com/docker/for-mac/issues/2392)
  - Separate internal ports used to proxy HTTP and HTTPS content.
@z

@x
### Docker Community Edition 17.12.0-ce-mac46 2018-01-09
@y
### Docker Community Edition 17.12.0-ce-mac46 2018-01-09
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/21698/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/21698/Docker.dmg){: .accept-eula }
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
  - VM entirely built with Linuxkit
  - VM disk size can be changed in disk preferences. (See [docker/for-mac#1037](https://github.com/docker/for-mac/issues/1037))
  - For systems running APFS on SSD on High Sierra, use `raw` format VM disks by default. This improves disk throughput (from 320MiB/sec to 600MiB/sec in `dd` on a 2015 MacBook Pro) and disk space handling.
    Existing disks are kept in qcow format, if you want to switch to raw format you need to "Remove all data" or "Reset to factory defaults". See [Disk utilization](../space.md)
  - DNS name `docker.for.mac.host.internal` should be used instead of `docker.for.mac.localhost` (still valid) for host resolution from containers, since since there is an RFC banning the use of subdomains of localhost. See  https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06.
@y
* New
  - VM entirely built with Linuxkit
  - VM disk size can be changed in disk preferences. (See [docker/for-mac#1037](https://github.com/docker/for-mac/issues/1037))
  - For systems running APFS on SSD on High Sierra, use `raw` format VM disks by default. This improves disk throughput (from 320MiB/sec to 600MiB/sec in `dd` on a 2015 MacBook Pro) and disk space handling.
    Existing disks are kept in qcow format, if you want to switch to raw format you need to "Remove all data" or "Reset to factory defaults". See [Disk utilization](../space.md)
  - DNS name `docker.for.mac.host.internal` should be used instead of `docker.for.mac.localhost` (still valid) for host resolution from containers, since since there is an RFC banning the use of subdomains of localhost. See  https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06.
@z

@x
* Bug fixes and minor changes
  - Display various component versions in About box.
  - Avoid VM reboot when changing host proxy settings.
  - Don't break HTTP traffic between containers by forwarding them via the external proxy. (See [docker/for-mac#981](https://github.com/docker/for-mac/issues/981))
  - Filesharing settings are now stored in settings.json.
  - Daemon restart button has been moved to settings / Reset Tab.
  - Better VM state handling & error messages in case of VM crashes.
  - Fix login into private repository with certificate issue. (See [docker/for-mac#2201](https://github.com/docker/for-mac/issues/2201))
@y
* Bug fixes and minor changes
  - Display various component versions in About box.
  - Avoid VM reboot when changing host proxy settings.
  - Don't break HTTP traffic between containers by forwarding them via the external proxy. (See [docker/for-mac#981](https://github.com/docker/for-mac/issues/981))
  - Filesharing settings are now stored in settings.json.
  - Daemon restart button has been moved to settings / Reset Tab.
  - Better VM state handling & error messages in case of VM crashes.
  - Fix login into private repository with certificate issue. (See [docker/for-mac#2201](https://github.com/docker/for-mac/issues/2201))
@z

@x
## Stable Releases of 2017
@y
## Stable Releases of 2017
@z

@x
### Docker Community Edition 17.09.1-ce-mac42 2017-12-11
@y
### Docker Community Edition 17.09.1-ce-mac42 2017-12-11
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/21090/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/21090/Docker.dmg){: .accept-eula }
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
  - Fix bug not allowing to move qcow disk in some cases.
@y
* Bug fixes and minor changes
  - Fix bug not allowing to move qcow disk in some cases.
@z

@x
### Docker Community Edition 17.09.0-ce-mac35 2017-10-06
@y
### Docker Community Edition 17.09.0-ce-mac35 2017-10-06
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/19611/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Mac with Intel chip](https://download.docker.com/mac/stable/19611/Docker.dmg){: .accept-eula }
@z

@x
* Bug fix
  - Fix Docker For Mac unable to start in some cases : removed use of libgmp sometimes causing the vpnkit process to die.
@y
* Bug fix
  - Fix Docker For Mac unable to start in some cases : removed use of libgmp sometimes causing the vpnkit process to die.
@z

@x
### Docker Community Edition 17.09.0-ce-mac33 2017-10-03
@y
### Docker Community Edition 17.09.0-ce-mac33 2017-10-03
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/19543/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/19543/Docker.dmg){: .accept-eula }
@z

@x
* Bug fix
  - Do not show Toolbox migration assistant when there are existing Docker For Mac data.
@y
* Bug fix
  - Do not show Toolbox migration assistant when there are existing Docker For Mac data.
@z

@x
### Docker Community Edition 17.09.0-ce-mac32 2017-10-02
@y
### Docker Community Edition 17.09.0-ce-mac32 2017-10-02
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/19506/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/19506/Docker.dmg){: .accept-eula }
@z

@x
* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker Compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
  - DataKit update (fix instability on High Sierra)
@y
* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker Compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
  - DataKit update (fix instability on High Sierra)
@z

@x
* New
  - Add daemon options validation
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Transparent proxy using macOS system proxies (if defined) directly
  - GUI settings are now stored in ~/Library/Group\ Containers/group.com.docker/settings.json. daemon.json in now a file in ~/.docker/
  - You can now change the default IP address used by Hyperkit if it collides with your network
@y
* New
  - Add daemon options validation
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Transparent proxy using macOS system proxies (if defined) directly
  - GUI settings are now stored in ~/Library/Group\ Containers/group.com.docker/settings.json. daemon.json in now a file in ~/.docker/
  - You can now change the default IP address used by Hyperkit if it collides with your network
@z

@x
* Bug fixes and minor changes
  - Fix instability on High Sierra (docker/for-mac#2069, docker/for-mac#2062, docker/for-mac#2052, docker/for-mac#2029, docker/for-mac#2024)
  - Fix password encoding/decoding (docker/for-mac#2008, docker/for-mac#2016, docker/for-mac#1919, docker/for-mac#712, docker/for-mac#1220).
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING (docker/for-mac#1608)
  - Rotate logs in the VM more often
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the Unix domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Diagnose can be cancelled & Improved help information. Fixes docker/for-mac#1134, docker/for-mac#1474
  - Support paging of docker-cloud repositories & orgs. Fixes docker/for-mac#1538
@y
* Bug fixes and minor changes
  - Fix instability on High Sierra (docker/for-mac#2069, docker/for-mac#2062, docker/for-mac#2052, docker/for-mac#2029, docker/for-mac#2024)
  - Fix password encoding/decoding (docker/for-mac#2008, docker/for-mac#2016, docker/for-mac#1919, docker/for-mac#712, docker/for-mac#1220).
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING (docker/for-mac#1608)
  - Rotate logs in the VM more often
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the Unix domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Diagnose can be cancelled & Improved help information. Fixes docker/for-mac#1134, docker/for-mac#1474
  - Support paging of docker-cloud repositories & orgs. Fixes docker/for-mac#1538
@z

@x
### Docker Community Edition 17.06.2-ce-mac27 2017-09-06
@y
### Docker Community Edition 17.06.2-ce-mac27 2017-09-06
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/19124/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/19124/Docker.dmg){: .accept-eula }
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
### Docker Community Edition 17.06.1-ce-mac24, 2017-08-21
@y
### Docker Community Edition 17.06.1-ce-mac24, 2017-08-21
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/18950/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/18950/Docker.dmg){: .accept-eula }
@z

@x
**Upgrades**
- [Docker 17.06.1-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce-rc1)
- Linux Kernel 4.9.36
- AUFS 20170703
@y
**Upgrades**
- [Docker 17.06.1-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce-rc1)
- Linux Kernel 4.9.36
- AUFS 20170703
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- DNS Fixes. Fixes [docker/for-mac#1763](https://github.com/docker/for-mac/issues/176), [docker/for-mac#1811](https://github.com/docker/for-mac/issues/1811), [docker/for-mac#1803](https://github.com/docker/for-mac/issues/1803)
@y
- DNS Fixes. Fixes [docker/for-mac#1763](https://github.com/docker/for-mac/issues/176), [docker/for-mac#1811](https://github.com/docker/for-mac/issues/1811), [docker/for-mac#1803](https://github.com/docker/for-mac/issues/1803)
@z

@x
- Avoid unnecessary VM reboot (when changing proxy exclude, but no proxy set). Fixes [docker/for-mac#1809](https://github.com/docker/for-mac/issues/1809), [docker/for-mac#1801](https://github.com/docker/for-mac/issues/1801)
@y
- Avoid unnecessary VM reboot (when changing proxy exclude, but no proxy set). Fixes [docker/for-mac#1809](https://github.com/docker/for-mac/issues/1809), [docker/for-mac#1801](https://github.com/docker/for-mac/issues/1801)
@z

@x
### Docker Community Edition 17.06.0-ce-mac18, 2017-06-28
@y
### Docker Community Edition 17.06.0-ce-mac18, 2017-06-28
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/18433/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/18433/Docker.dmg){: .accept-eula }
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
- qcow-tool v0.10.0 (improve the performance of `compact`: mirage/ocaml-qcow#94)
- OSX Yosemite 10.10 is marked as deprecated
- Linux Kernel 4.9.31
@y
- [Docker 17.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)
- [Docker Credential Helpers 0.5.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.2)
- [Docker Machine 0.12.0](https://github.com/docker/machine/releases/tag/v0.12.0)
- [Docker compose 1.14.0](https://github.com/docker/compose/releases/tag/1.14.0)
- qcow-tool v0.10.0 (improve the performance of `compact`: mirage/ocaml-qcow#94)
- OSX Yosemite 10.10 is marked as deprecated
- Linux Kernel 4.9.31
@z

@x
**New**
@y
**New**
@z

@x
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories.
- GUI Option to opt out of credential store
- GUI option to reset Docker data without losing all settings (fixes [docker/for-mac#1309](https://github.com/docker/for-mac/issues/1309))
- Add an experimental DNS name for the host: `docker.for.mac.localhost`
- Support for client (i.e. "login") certificates for authenticating registry access (fixes [docker/for-mac#1320](https://github.com/docker/for-mac/issues/1320))
- OSXFS: support for `cached` mount flag to improve performance of macOS mounts when strict consistency is not necessary
@y
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories.
- GUI Option to opt out of credential store
- GUI option to reset Docker data without losing all settings (fixes [docker/for-mac#1309](https://github.com/docker/for-mac/issues/1309))
- Add an experimental DNS name for the host: `docker.for.mac.localhost`
- Support for client (i.e. "login") certificates for authenticating registry access (fixes [docker/for-mac#1320](https://github.com/docker/for-mac/issues/1320))
- OSXFS: support for `cached` mount flag to improve performance of macOS mounts when strict consistency is not necessary
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Resync HTTP(S) proxy settings on application start
- Interpret system proxy setting of `localhost` correctly (see [docker/for-mac#1511](https://github.com/docker/for-mac/issues/1511))
- All Docker binaries bundled with Docker for Mac are now signed
- Display all Docker Cloud organizations and repositories in the whale menu (fixes [docker/for-mac#1538 ](https://github.com/docker/for-mac/issues/1538))
- OSXFS: improved latency for many common operations, such as read and write, by approximately 25%
- Fixed GUI crash when text table view was selected and windows re-opened (fixes [docker/for-mac#1477](https://github.com/docker/for-mac/issues/1477))
- Reset to default / uninstall also remove `config.json` and `osxkeychain` credentials
- More detailed VirtualBox uninstall requirements ( [docker/for-mac#1343](https://github.com/docker/for-mac/issues/1343))
- Request time sync after waking up to improve [docker/for-mac#17](https://github.com/docker/for-mac/issues/17)
- VPNKit: Improved DNS timeout handling (fixes [docker/for-mac#202](https://github.com/docker/vpnkit/issues/202))
- VPNKit: Use DNSServiceRef API by default (only enabled for new installs or after factory reset)
- Add a reset to factory defaults button when application crashes
- Toolbox import dialog now defaults to "Skip"
- Buffered data should be treated correctly when Docker client requests are upgraded to raw streams
- Removed an error message from the output related to experimental features handling
- `vmnetd` should not crash when user home directory is on an external drive
- Improved settings database schema handling
- Disk trimming should work as expected
- Diagnostics now contains more settings data
@y
- Resync HTTP(S) proxy settings on application start
- Interpret system proxy setting of `localhost` correctly (see [docker/for-mac#1511](https://github.com/docker/for-mac/issues/1511))
- All Docker binaries bundled with Docker for Mac are now signed
- Display all Docker Cloud organizations and repositories in the whale menu (fixes [docker/for-mac#1538 ](https://github.com/docker/for-mac/issues/1538))
- OSXFS: improved latency for many common operations, such as read and write, by approximately 25%
- Fixed GUI crash when text table view was selected and windows re-opened (fixes [docker/for-mac#1477](https://github.com/docker/for-mac/issues/1477))
- Reset to default / uninstall also remove `config.json` and `osxkeychain` credentials
- More detailed VirtualBox uninstall requirements ( [docker/for-mac#1343](https://github.com/docker/for-mac/issues/1343))
- Request time sync after waking up to improve [docker/for-mac#17](https://github.com/docker/for-mac/issues/17)
- VPNKit: Improved DNS timeout handling (fixes [docker/for-mac#202](https://github.com/docker/vpnkit/issues/202))
- VPNKit: Use DNSServiceRef API by default (only enabled for new installs or after factory reset)
- Add a reset to factory defaults button when application crashes
- Toolbox import dialog now defaults to "Skip"
- Buffered data should be treated correctly when Docker client requests are upgraded to raw streams
- Removed an error message from the output related to experimental features handling
- `vmnetd` should not crash when user home directory is on an external drive
- Improved settings database schema handling
- Disk trimming should work as expected
- Diagnostics now contains more settings data
@z

@x
### Docker Community Edition 17.03.1-ce-mac12, 2017-05-12
@y
### Docker Community Edition 17.03.1-ce-mac12, 2017-05-12
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/17661/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/17661/Docker.dmg){: .accept-eula }
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
### Docker Community Edition 17.03.1-ce-mac5, 2017-03-29
@y
### Docker Community Edition 17.03.1-ce-mac5, 2017-03-29
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/16048/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/16048/Docker.dmg){: .accept-eula }
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker Credential Helpers 0.4.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.4.2)
@y
- [Docker Credential Helpers 0.4.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.4.2)
@z

@x
### Docker Community Edition 17.03.0-ce-mac1, 2017-03-02
@y
### Docker Community Edition 17.03.0-ce-mac1, 2017-03-02
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/15583/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/15583/Docker.dmg){: .accept-eula }
@z

@x
**New**
@y
**New**
@z

@x
- Renamed to Docker Community Edition
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users progressively
- Docker will now securely store your IDs in the macOS keychain
@y
- Renamed to Docker Community Edition
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users progressively
- Docker will now securely store your IDs in the macOS keychain
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
- Allow to reset faulty daemon.json through a link in advanced subpanel
- More options when moving disk image
- Add link to experimental features
- Filesharing and daemon table empty fields are editable
- Hide restart button in settings window
- Fix bug where update window hides when app not focused
- Don't use port 4222 inside the Linux VM
- Add page_poison=1 to boot args
- Add a new disk flushing option
- DNS forwarder ignores responses from malfunctioning servers (docker/for-mac#1025)
- DNS forwarder send all queries in parallel, process results in order
- DNS forwarder includes servers with zones in general searches (docker/for-mac#997)
- Parses aliases from /etc/hosts (docker/for-mac#983)
- Can resolve DNS requests via servers listed in the /etc/resolver directory on the host
- Limit vCPUs to 64
- Fixed for swap not being mounted
- Fixed aufs xattr delete issue (docker/docker#30245)
- osxfs: Catch EPERM when reading extended attributes of non-files
- VPNKit: Fixed unmarshalling of DNS packets containing pointers to pointers to labels
- VPNKit: Set the Recursion Available bit on DNS responses from the cache
- VPNKit: Avoid diagnostics to capture too much data
- VPNKit: Fixed a source of occasional packet loss (truncation) on the virtual ethernet link
- HyperKit: Dump guest physical and linear address from VMCS when dumping state
- HyperKit: Kernel boots with panic=1 arg
@y
- Allow to reset faulty daemon.json through a link in advanced subpanel
- More options when moving disk image
- Add link to experimental features
- Filesharing and daemon table empty fields are editable
- Hide restart button in settings window
- Fix bug where update window hides when app not focused
- Don't use port 4222 inside the Linux VM
- Add page_poison=1 to boot args
- Add a new disk flushing option
- DNS forwarder ignores responses from malfunctioning servers (docker/for-mac#1025)
- DNS forwarder send all queries in parallel, process results in order
- DNS forwarder includes servers with zones in general searches (docker/for-mac#997)
- Parses aliases from /etc/hosts (docker/for-mac#983)
- Can resolve DNS requests via servers listed in the /etc/resolver directory on the host
- Limit vCPUs to 64
- Fixed for swap not being mounted
- Fixed aufs xattr delete issue (docker/docker#30245)
- osxfs: Catch EPERM when reading extended attributes of non-files
- VPNKit: Fixed unmarshalling of DNS packets containing pointers to pointers to labels
- VPNKit: Set the Recursion Available bit on DNS responses from the cache
- VPNKit: Avoid diagnostics to capture too much data
- VPNKit: Fixed a source of occasional packet loss (truncation) on the virtual ethernet link
- HyperKit: Dump guest physical and linear address from VMCS when dumping state
- HyperKit: Kernel boots with panic=1 arg
@z

@x
### Docker for Mac 1.13.1, 2017-02-09
@y
### Docker for Mac 1.13.1, 2017-02-09
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/15353/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/15353/Docker.dmg){: .accept-eula }
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
- `daemon.json` should render nicely in the UI
- Allow to reset faulty `daemon.json` through a link in advanced subpanel
@y
- Add link to experimental features
- New 1.13 cancellable operations should now be properly handled by the Docker for desktop
- `daemon.json` should render nicely in the UI
- Allow to reset faulty `daemon.json` through a link in advanced subpanel
@z

@x
### Docker for Mac 1.13.0, 2017-01-19
@y
### Docker for Mac 1.13.0, 2017-01-19
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/15072/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/15072/Docker.dmg){: .accept-eula }
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
- qcow-tool 0.7.2
@y
- [Docker 1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)
- [Docker Compose 1.10](https://github.com/docker/compose/releases/tag/1.10.0)
- [Docker Machine 0.9.0](https://github.com/docker/machine/releases/tag/v0.9.0)
- [Notary 0.4.3](https://github.com/docker/notary/releases/tag/v0.4.3)
- Linux kernel 4.9.4
- qcow-tool 0.7.2
@z

@x
**New**
@y
**New**
@z

@x
- The storage location of the Linux volume can now be moved
- Reclaim disk size on reboot
- You can now edit filesharing paths
- Memory can be allocated with 256 MiB steps
- Proxy can now be completely disabled
- Support for arm, aarch64, ppc64le architectures using qemu
- Dedicated preference pane for advanced configuration of the
  docker daemon (edit `daemon.json`)
- Docker Experimental mode can be toggled
- Better support for Split DNS VPN configurations
- Use more DNS servers, respect order
@y
- The storage location of the Linux volume can now be moved
- Reclaim disk size on reboot
- You can now edit filesharing paths
- Memory can be allocated with 256 MiB steps
- Proxy can now be completely disabled
- Support for arm, aarch64, ppc64le architectures using qemu
- Dedicated preference pane for advanced configuration of the
  docker daemon (edit `daemon.json`)
- Docker Experimental mode can be toggled
- Better support for Split DNS VPN configurations
- Use more DNS servers, respect order
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- You cannot edit settings while docker is restarting
- Support Copy/Paste in About box
- Auto update polling every 24h
- Kernel boots with vsyscall=emulate arg and CONFIG_LEGACY_VSYSCALL is set to NONE in Moby
- Fixed vsock deadlock under heavy write load
- If you opt-out of analytics, you're prompted for approval before a bug report is sent
- Fixed bug where search domain could be read as `DomainName`
- Dedicated preference pane for HTTP proxy settings
- Dedicated preference pane for CPU & Memory computing resources
- Privacy settings moved to the general preference pane
- Fixed an issue where the preference pane disappeared when the welcome whale menu was closed
- HyperKit: code cleanup and minor fixes
- Improvements to Logging and Diagnostics
- osxfs: switch to libev/kqueue to improve latency
- VPNKit: improvements to DNS handling
- VPNKit: Improved diagnostics
- VPNKit: Forwarded UDP datagrams should have correct source port numbers
- VPNKit: add a local cache of DNS responses
- VPNKit: If one request fails, allow other concurrent requests to succeed.
  For example this allows IPv4 servers to work even if IPv6 is broken.
- VPNKit: Fix bug that could cause the connection tracking to
  underestimate the number of active connections
@y
- You cannot edit settings while docker is restarting
- Support Copy/Paste in About box
- Auto update polling every 24h
- Kernel boots with vsyscall=emulate arg and CONFIG_LEGACY_VSYSCALL is set to NONE in Moby
- Fixed vsock deadlock under heavy write load
- If you opt-out of analytics, you're prompted for approval before a bug report is sent
- Fixed bug where search domain could be read as `DomainName`
- Dedicated preference pane for HTTP proxy settings
- Dedicated preference pane for CPU & Memory computing resources
- Privacy settings moved to the general preference pane
- Fixed an issue where the preference pane disappeared when the welcome whale menu was closed
- HyperKit: code cleanup and minor fixes
- Improvements to Logging and Diagnostics
- osxfs: switch to libev/kqueue to improve latency
- VPNKit: improvements to DNS handling
- VPNKit: Improved diagnostics
- VPNKit: Forwarded UDP datagrams should have correct source port numbers
- VPNKit: add a local cache of DNS responses
- VPNKit: If one request fails, allow other concurrent requests to succeed.
  For example this allows IPv4 servers to work even if IPv6 is broken.
- VPNKit: Fix bug that could cause the connection tracking to
  underestimate the number of active connections
@z

@x
## Stable Releases of 2016
@y
## Stable Releases of 2016
@z

@x
### Docker for Mac 1.12.5, 2016-12-20
@y
### Docker for Mac 1.12.5, 2016-12-20
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/14777/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/14777/Docker.dmg){: .accept-eula }
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
### Skipped Docker for Mac 1.12.4
@y
### Skipped Docker for Mac 1.12.4
@z

@x
We did not distribute a 1.12.4 stable release
@y
We did not distribute a 1.12.4 stable release
@z

@x
### Docker for Mac 1.12.3, 2016-11-09
@y
### Docker for Mac 1.12.3, 2016-11-09
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/13776/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/13776/Docker.dmg){: .accept-eula }
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.12.3
- Linux Kernel 4.4.27
- Notary 0.4.2
- Docker Machine 0.8.2
- Docker Compose 1.8.1
- Kernel vsock driver v7
- aufs 20160912
@y
- Docker 1.12.3
- Linux Kernel 4.4.27
- Notary 0.4.2
- Docker Machine 0.8.2
- Docker Compose 1.8.1
- Kernel vsock driver v7
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
- Fixed an issue where the whale animation during setting change was inconsistent
@y
- Fixed an issue where the whale animation during setting change was inconsistent
@z

@x
- Fixed an issue where some windows stayed hidden behind another app
@y
- Fixed an issue where some windows stayed hidden behind another app
@z

@x
- Fixed an issue where the Docker status would continue to be yellow/animated after the VM had started correctly
@y
- Fixed an issue where the Docker status would continue to be yellow/animated after the VM had started correctly
@z

@x
- Fixed an issue where Docker for Mac was incorrectly reported as updated
@y
- Fixed an issue where Docker for Mac was incorrectly reported as updated
@z

@x
- Channel is now displayed in About box
@y
- Channel is now displayed in About box
@z

@x
- Crash reports are sent over Bugsnag rather than HockeyApp
@y
- Crash reports are sent over Bugsnag rather than HockeyApp
@z

@x
- Fixed an issue where some windows did not claim focus correctly
@y
- Fixed an issue where some windows did not claim focus correctly
@z

@x
- Added UI when switching channel to prevent user losing containers and settings
@y
- Added UI when switching channel to prevent user losing containers and settings
@z

@x
- Check disk capacity before Toolbox import
@y
- Check disk capacity before Toolbox import
@z

@x
- Import certificates in `etc/ssl/certs/ca-certificates.crt`
@y
- Import certificates in `etc/ssl/certs/ca-certificates.crt`
@z

@x
- disk: make the "flush" behaviour configurable for database-like workloads. This works around a performance regression in 1.12.1.
@y
- disk: make the "flush" behaviour configurable for database-like workloads. This works around a performance regression in 1.12.1.
@z

@x
**Networking**
@y
**Networking**
@z

@x
- Proxy: Fixed application of system or custom proxy settings over container restart
@y
- Proxy: Fixed application of system or custom proxy settings over container restart
@z

@x
- DNS: reduce the number of UDP sockets consumed on the host
@y
- DNS: reduce the number of UDP sockets consumed on the host
@z

@x
- VPNkit: improve the connection-limiting code to avoid running out of sockets on the host
@y
- VPNkit: improve the connection-limiting code to avoid running out of sockets on the host
@z

@x
- UDP: handle diagrams bigger than 2035, up to the configured macOS kernel limit
@y
- UDP: handle diagrams bigger than 2035, up to the configured macOS kernel limit
@z

@x
- UDP: make the forwarding more robust; drop packets and continue rather than stopping
@y
- UDP: make the forwarding more robust; drop packets and continue rather than stopping
@z

@x
**File sharing**
@y
**File sharing**
@z

@x
- osxfs: Fixed the prohibition of chown on read-only or mode 0 files, (fixes
  [docker/for-mac#117](https://github.com/docker/for-mac/issues/117),
  [docker/for-mac#263](https://github.com/docker/for-mac/issues/263),
  [docker/for-mac#633](https://github.com/docker/for-mac/issues/633))
@y
- osxfs: Fixed the prohibition of chown on read-only or mode 0 files, (fixes
  [docker/for-mac#117](https://github.com/docker/for-mac/issues/117),
  [docker/for-mac#263](https://github.com/docker/for-mac/issues/263),
  [docker/for-mac#633](https://github.com/docker/for-mac/issues/633))
@z

@x
- osxfs: Fixed race causing some reads to run forever
@y
- osxfs: Fixed race causing some reads to run forever
@z

@x
- osxfs: Fixed a simultaneous volume mount race which can result in a crash
@y
- osxfs: Fixed a simultaneous volume mount race which can result in a crash
@z

@x
**Moby**
@y
**Moby**
@z

@x
- Increase default ulimit for memlock (fixes [docker/for-mac#801](https://github.com/docker/for-mac/issues/801))
@y
- Increase default ulimit for memlock (fixes [docker/for-mac#801](https://github.com/docker/for-mac/issues/801))
@z

@x
### Docker for Mac 1.12.1, 2016-09-16
@y
### Docker for Mac 1.12.1, 2016-09-16
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/1.12.1.12133/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/1.12.1.12133/Docker.dmg){: .accept-eula }
@z

@x
**New**
@y
**New**
@z

@x
* Support for macOS 10.12 Sierra
@y
* Support for macOS 10.12 Sierra
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
* Fixed communications glitch when UI talks to com.docker.vmnetd
  Fixes [docker/for-mac#90](https://github.com/docker/for-mac/issues/90)
@y
* Fixed communications glitch when UI talks to com.docker.vmnetd
  Fixes [docker/for-mac#90](https://github.com/docker/for-mac/issues/90)
@z

@x
* `docker-diagnose`: display and record the time the diagnosis was captured
@y
* `docker-diagnose`: display and record the time the diagnosis was captured
@z

@x
* Don't compute the container folder in `com.docker.vmnetd`
  Fixes [docker/for-mac#47](https://github.com/docker/for-mac/issues/47)
@y
* Don't compute the container folder in `com.docker.vmnetd`
  Fixes [docker/for-mac#47](https://github.com/docker/for-mac/issues/47)
@z

@x
* Warn the user if BlueStacks is installed (potential kernel panic)
@y
* Warn the user if BlueStacks is installed (potential kernel panic)
@z

@x
* Automatic update interval changed from 1 hour to 24 hours
@y
* Automatic update interval changed from 1 hour to 24 hours
@z

@x
* Include Zsh completions
@y
* Include Zsh completions
@z

@x
* UI Fixes
@y
* UI Fixes
@z

@x
**Networking**
@y
**Networking**
@z

@x
* VPNKit supports search domains
@y
* VPNKit supports search domains
@z

@x
* slirp: support up to 8 external DNS servers
@y
* slirp: support up to 8 external DNS servers
@z

@x
* slirp: reduce the number of sockets used by UDP NAT, reduce the probability that NAT rules will time out earlier than expected
@y
* slirp: reduce the number of sockets used by UDP NAT, reduce the probability that NAT rules will time out earlier than expected
@z

@x
* Entries from `/etc/hosts` should now resolve from within containers
@y
* Entries from `/etc/hosts` should now resolve from within containers
@z

@x
* Allow ports to be bound on host addresses other than `0.0.0.0` and `127.0.0.1`
  Fixes issue reported in
  [docker/for-mac#68](https://github.com/docker/for-mac/issues/68)
@y
* Allow ports to be bound on host addresses other than `0.0.0.0` and `127.0.0.1`
  Fixes issue reported in
  [docker/for-mac#68](https://github.com/docker/for-mac/issues/68)
@z

@x
* Use Mac System Configuration database to detect DNS
@y
* Use Mac System Configuration database to detect DNS
@z

@x
**File sharing (osxfs)**
@y
**File sharing (osxfs)**
@z

@x
* Fixed thread leak
@y
* Fixed thread leak
@z

@x
* Fixed a malfunction of new directories that have the same name as an old directory that is still open
@y
* Fixed a malfunction of new directories that have the same name as an old directory that is still open
@z

@x
* Rename events now trigger DELETE and/or MODIFY `inotify` events
  (saving with TextEdit works now)
@y
* Rename events now trigger DELETE and/or MODIFY `inotify` events
  (saving with TextEdit works now)
@z

@x
* Fixed an issue that caused `inotify` failure and crashes
@y
* Fixed an issue that caused `inotify` failure and crashes
@z

@x
* Fixed a directory file descriptor leak
@y
* Fixed a directory file descriptor leak
@z

@x
* Fixed socket `chowns`
@y
* Fixed socket `chowns`
@z

@x
**Moby**
@y
**Moby**
@z

@x
* Use default `sysfs` settings, transparent huge pages disabled
@y
* Use default `sysfs` settings, transparent huge pages disabled
@z

@x
* `cgroup` mount to support `systemd` in containers
@y
* `cgroup` mount to support `systemd` in containers
@z

@x
* Increase Moby `fs.file-max` to 524288
@y
* Increase Moby `fs.file-max` to 524288
@z

@x
* Fixed Moby Diagnostics and Update Kernel
@y
* Fixed Moby Diagnostics and Update Kernel
@z

@x
**HyperKit**
@y
**HyperKit**
@z

@x
* HyperKit updated with `dtrace` support and lock fixes
@y
* HyperKit updated with `dtrace` support and lock fixes
@z

@x
### Docker for Mac 2016-08-11 1.12.0-a
@y
### Docker for Mac 2016-08-11 1.12.0-a
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/11213/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/11213/Docker.dmg){: .accept-eula }
@z

@x
This bug fix release contains osxfs improvements. The fixed issues may have
been seen as failures with apt-get and npm in containers, missed inotify
events or unexpected unmounts.
@y
This bug fix release contains osxfs improvements. The fixed issues may have
been seen as failures with apt-get and npm in containers, missed inotify
events or unexpected unmounts.
@z

@x
**Bug fixes**
@y
**Bug fixes**
@z

@x
* osxfs: fixed an issue causing access to children of renamed directories to fail (symptoms: npm failures, apt-get failures)
@y
* osxfs: fixed an issue causing access to children of renamed directories to fail (symptoms: npm failures, apt-get failures)
@z

@x
* osxfs: fixed an issue causing some ATTRIB and CREATE inotify events to fail delivery and other inotify events to stop
@y
* osxfs: fixed an issue causing some ATTRIB and CREATE inotify events to fail delivery and other inotify events to stop
@z

@x
* osxfs: fixed an issue causing all inotify events to stop when an ancestor directory of a mounted directory was mounted
@y
* osxfs: fixed an issue causing all inotify events to stop when an ancestor directory of a mounted directory was mounted
@z

@x
* osxfs: fixed an issue causing volumes mounted under other mounts to spontaneously unmount
@y
* osxfs: fixed an issue causing volumes mounted under other mounts to spontaneously unmount
@z

@x
### Docker for Mac 1.12.0, 2016-07-28
@y
### Docker for Mac 1.12.0, 2016-07-28
@z

@x
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/10871/Docker.dmg){: .accept-eula }
@y
> Download Docker Desktop
>
> {%- include eula.md -%}
>
> [Download](https://download.docker.com/mac/stable/10871/Docker.dmg){: .accept-eula }
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
