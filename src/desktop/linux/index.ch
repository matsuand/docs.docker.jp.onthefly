%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Linux Tech Preview
keywords: docker, linux, tech preview
title: Docker Desktop for Linux (Tech Preview)
toc_min: 1
toc_max: 2
---
@y
---
description: Docker Desktop for Linux Tech Preview
keywords: docker, linux, tech preview
title: Docker Desktop for Linux (Tech Preview)
toc_min: 1
toc_max: 2
---
@z

@x
Welcome to the Docker Desktop for Linux Tech Preview. This Tech Preview is aimed at early adopters who would like to try an experimental build of Docker Desktop for Linux and provide feedback.
@y
Welcome to the Docker Desktop for Linux Tech Preview. This Tech Preview is aimed at early adopters who would like to try an experimental build of Docker Desktop for Linux and provide feedback.
@z

@x
Docker Desktop is an easy-to-install application that enables you to build and
share containerized applications and microservices. Docker Desktop for Linux
(DD4L) is the second-most popular feature request in our [public
roadmap](https://github.com/docker/roadmap/projects/1){: target="_blank"
rel="noopener" class="_"}.
@y
Docker Desktop is an easy-to-install application that enables you to build and
share containerized applications and microservices. Docker Desktop for Linux
(DD4L) is the second-most popular feature request in our [public
roadmap](https://github.com/docker/roadmap/projects/1){: target="_blank"
rel="noopener" class="_"}.
@z

@x
## Download and install
@y
## Download and install
@z

@x
Docker Desktop for Linux is currently available on Ubuntu 21.04, 21.10 and
Debian distributions.
@y
Docker Desktop for Linux is currently available on Ubuntu 21.04, 21.10 and
Debian distributions.
@z

@x
To install Docker Desktop for Linux:
@y
To install Docker Desktop for Linux:
@z

@x
1. Set up the [Docker repository](../../engine/install/ubuntu.md#install-using-the-repository).
2. Download and install the Tech Preview Debian package:
    ```console
    $ curl https://desktop-stage.docker.com/linux/main/amd64/73772/docker-desktop.deb --output docker-desktop.deb
    $ sudo apt install ./docker-desktop.deb
    ```
3. Check whether the user belongs to `docker` and `kvm` groups. You may need to restart the host to load the group configuration.
@y
1. Set up the [Docker repository](../../engine/install/ubuntu.md#install-using-the-repository).
2. Download and install the Tech Preview Debian package:
    ```console
    $ curl https://desktop-stage.docker.com/linux/main/amd64/73772/docker-desktop.deb --output docker-desktop.deb
    $ sudo apt install ./docker-desktop.deb
    ```
3. Check whether the user belongs to `docker` and `kvm` groups. You may need to restart the host to load the group configuration.
@z

@x
## Check the shared memory
@y
## Check the shared memory
@z

@x
Before you run Docker Desktop for Linux, verify whether the shared memory available on the host is **higher** than the memory allocated to the VM. By default, Docker Desktop allocates half of the memory and CPU from the host. The **available shared memory** should be higher than this.
@y
Before you run Docker Desktop for Linux, verify whether the shared memory available on the host is **higher** than the memory allocated to the VM. By default, Docker Desktop allocates half of the memory and CPU from the host. The **available shared memory** should be higher than this.
@z

@x
```console
$ df -h /dev/shm
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            16G  200M   16G   2% /dev/shm
```
@y
```console
$ df -h /dev/shm
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            16G  200M   16G   2% /dev/shm
```
@z

@x
To set the shared memory size, run:
@y
To set the shared memory size, run:
@z

@x
```console
$ sudo mount -o remount,size=<the-size-you-want-in-GB> /dev/shm
```
@y
```console
$ sudo mount -o remount,size=<the-size-you-want-in-GB> /dev/shm
```
@z

@x
To ensure this setting persists after a reboot, add the following entry to the `/etc/fstab`:
@y
To ensure this setting persists after a reboot, add the following entry to the `/etc/fstab`:
@z

@x
```console
none    /dev/shm    tmpfs   defaults,size=<the-size-you-want-in-GB>   0   0
```
@y
```console
none    /dev/shm    tmpfs   defaults,size=<the-size-you-want-in-GB>   0   0
```
@z

@x
For example:
@y
For example:
@z

@x
```console
none    /dev/shm    tmpfs   defaults,size=8G    0   0
```
@y
```console
none    /dev/shm    tmpfs   defaults,size=8G    0   0
```
@z

@x
## Launch Docker Desktop
@y
## Launch Docker Desktop
@z

@x
> **Note:** 
> 
> You may need to restart the host to load the group configuration.
@y
> **Note:** 
> 
> You may need to restart the host to load the group configuration.
@z

@x
To start Docker Desktop for Linux, search **Docker Desktop** on the
**Applications** menu and open it. This launches the whale menu icon and opens
the Docker Dashboard, reporting the status of Docker Desktop.
@y
To start Docker Desktop for Linux, search **Docker Desktop** on the
**Applications** menu and open it. This launches the whale menu icon and opens
the Docker Dashboard, reporting the status of Docker Desktop.
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

@x
```console
$ systemctl --user start docker-desktop
```
@y
```console
$ systemctl --user start docker-desktop
```
@z

@x
When Docker Desktop starts, it creates a dedicated context that the Docker CLI can use as a target. This is to avoid a clash with a local Docker Engine that may be running on the Linux host and using the default context.
@y
When Docker Desktop starts, it creates a dedicated context that the Docker CLI can use as a target. This is to avoid a clash with a local Docker Engine that may be running on the Linux host and using the default context.
@z

@x
Run the following command to switch to the desktop-linux context.
@y
Run the following command to switch to the desktop-linux context.
@z

@x
```console
 $ docker context use desktop-linux
```
@y
```console
 $ docker context use desktop-linux
```
@z

@x
The Docker Desktop installer updates Docker Compose and the Docker CLI binaries
on the host. It installs Docker Compose V2 as the default Docker Compose. It
also replaces the default Docker CLI with a new Docker CLI binary that includes
cloud-integration capabilities.
@y
The Docker Desktop installer updates Docker Compose and the Docker CLI binaries
on the host. It installs Docker Compose V2 as the default Docker Compose. It
also replaces the default Docker CLI with a new Docker CLI binary that includes
cloud-integration capabilities.
@z

@x
After you’ve successfully installed Docker Desktop, you can check the versions
of these binaries by running the following command:
@y
After you’ve successfully installed Docker Desktop, you can check the versions
of these binaries by running the following command:
@z

@x
```console
$ docker-compose version
Docker Compose version v2.2.3
@y
```console
$ docker-compose version
Docker Compose version v2.2.3
@z

@x
$ docker --version
Docker version 20.10.12, build e91ed57
@y
$ docker --version
Docker version 20.10.12, build e91ed57
@z

@x
$ docker version
Client: Docker Engine - Community
Cloud integration: 1.0.17
Version:           20.10.12
API version:       1.41
...
```
@y
$ docker version
Client: Docker Engine - Community
Cloud integration: 1.0.17
Version:           20.10.12
API version:       1.41
...
```
@z

@x
To enable Docker Desktop to start on login, from the Docker menu, select
**Settings** > **General** > **Start Docker Desktop when you log in**.
@y
To enable Docker Desktop to start on login, from the Docker menu, select
**Settings** > **General** > **Start Docker Desktop when you log in**.
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

@x
```console
$ systemctl --user enable docker-desktop
```
@y
```console
$ systemctl --user enable docker-desktop
```
@z

@x
To stop Docker Desktop, click on the whale menu tray icon to open the Docker menu and select **Quit Docker Desktop**.
@y
To stop Docker Desktop, click on the whale menu tray icon to open the Docker menu and select **Quit Docker Desktop**.
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

@x
```console
$ systemctl --user stop docker-desktop
```
@y
```console
$ systemctl --user stop docker-desktop
```
@z

@x
## Logs
@y
## Logs
@z

@x
If you experience any issues, you can access Docker Desktop logs by running the following command:
@y
If you experience any issues, you can access Docker Desktop logs by running the following command:
@z

@x
```console
$ journalctl --user --unit=docker-desktop
```
@y
```console
$ journalctl --user --unit=docker-desktop
```
@z

@x
You can also find additional logs for the internal components included in Docker
Desktop at `$HOME/.docker/desktop/log/`.
@y
You can also find additional logs for the internal components included in Docker
Desktop at `$HOME/.docker/desktop/log/`.
@z

@x
## Uninstall
@y
## Uninstall
@z

@x
To remove Docker Desktop for Linux, run:
@y
To remove Docker Desktop for Linux, run:
@z

@x
```console
$ sudo apt remove docker-desktop
```
@y
```console
$ sudo apt remove docker-desktop
```
@z

@x
## Known issues
@y
## Known issues
@z

@x
 - The **Reset to factory defaults** option on the **Troubleshoot** page currently does not work.
 - At the end of the installation process, `apt` displays an error due to installing a downloaded package. You can ignore this error message.
  ```
  N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
  ```
@y
 - The **Reset to factory defaults** option on the **Troubleshoot** page currently does not work.
 - At the end of the installation process, `apt` displays an error due to installing a downloaded package. You can ignore this error message.
  ```
  N: Download is performed unsandboxed as root, as file '/home/user/Downloads/docker-desktop.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
  ```
@z
