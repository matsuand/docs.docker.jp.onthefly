%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use Docker Desktop Enterprise on Windows
description: Exploring the Windows user interface
keywords: Desktop Enterprise, Docker for Windows, Docker Desktop, Enterprise, User guide, user
redirect_from:
- /ee/desktop/user/windows-user/
---
@y
---
title: Use Docker Desktop Enterprise on Windows
description: Exploring the Windows user interface
keywords: Desktop Enterprise, Docker for Windows, Docker Desktop, Enterprise, User guide, user
redirect_from:
- /ee/desktop/user/windows-user/
---
@z

@x
This page contains information about testing the installation and configuring Docker Desktop Enterprise (DDE) runtime options on Windows.
@y
This page contains information about testing the installation and configuring Docker Desktop Enterprise (DDE) runtime options on Windows.
@z

@x
## Test your installation
@y
## Test your installation
@z

@x
1. Open a terminal window (Command Prompt or PowerShell, _but not_ PowerShell ISE).
@y
1. Open a terminal window (Command Prompt or PowerShell, _but not_ PowerShell ISE).
@z

@x
2. Run `docker --version` to ensure that you have a supported version of Docker:
@y
2. Run `docker --version` to ensure that you have a supported version of Docker:
@z

@x
3. Pull the [hello-world image](https://hub.docker.com/r/library/hello-world) from Docker Hub and run a container:
@y
3. Pull the [hello-world image](https://hub.docker.com/r/library/hello-world) from Docker Hub and run a container:
@z

@x
    ```shell
    > docker run hello-world
@y
    ```shell
    > docker run hello-world
@z

@x
    docker : Unable to find image 'hello-world:latest' locally
    ...
@y
    docker : Unable to find image 'hello-world:latest' locally
    ...
@z

@x
    latest:
    Pulling from library/hello-world
    ca4f61b1923c:
    Pulling fs layer
    ca4f61b1923c:
    Download complete
    ca4f61b1923c:
    Pull complete
    Digest: sha256:97ce6fa4b6cdc0790cda65fe7290b74cfebd9fa0c9b8c38e979330d547d22ce1
    Status: Downloaded newer image for hello-world:latest
@y
    latest:
    Pulling from library/hello-world
    ca4f61b1923c:
    Pulling fs layer
    ca4f61b1923c:
    Download complete
    ca4f61b1923c:
    Pull complete
    Digest: sha256:97ce6fa4b6cdc0790cda65fe7290b74cfebd9fa0c9b8c38e979330d547d22ce1
    Status: Downloaded newer image for hello-world:latest
@z

@x
    Hello from Docker!
    This message shows that your installation appears to be working correctly.
    ...
    ```
@y
    Hello from Docker!
    This message shows that your installation appears to be working correctly.
    ...
    ```
@z

@x
4. List the `hello-world` _image_ that was downloaded from Docker Hub:
@y
4. List the `hello-world` _image_ that was downloaded from Docker Hub:
@z

@x
    ```shell
    > docker image ls
    ```
@y
    ```shell
    > docker image ls
    ```
@z

@x
5. List the `hello-world` _container_ (that exited after displaying "Hello from Docker!"):
@y
5. List the `hello-world` _container_ (that exited after displaying "Hello from Docker!"):
@z

@x
    ```shell
    > docker container ls --all
    ```
@y
    ```shell
    > docker container ls --all
    ```
@z

@x
6. Explore the Docker help pages by running some help commands:
@y
6. Explore the Docker help pages by running some help commands:
@z

@x
    ```shell
    > docker --help
    > docker container --help
    > docker container ls --help
    > docker run --help
    ```
@y
    ```shell
    > docker --help
    > docker container --help
    > docker container ls --help
    > docker run --help
    ```
@z

@x
## Explore the application
@y
## Explore the application
@z

@x
In this section, we demonstrate the ease and power of Dockerized applications by
running something more complex, such as an OS and a webserver.
@y
In this section, we demonstrate the ease and power of Dockerized applications by
running something more complex, such as an OS and a webserver.
@z

@x
1. Pull an image of the [Ubuntu OS](https://hub.docker.com/r/_/ubuntu/) and run an interactive terminal inside the spawned container:
@y
1. Pull an image of the [Ubuntu OS](https://hub.docker.com/r/_/ubuntu/) and run an interactive terminal inside the spawned container:
@z

@x
    ```shell
    > docker run --interactive --tty ubuntu bash
@y
    ```shell
    > docker run --interactive --tty ubuntu bash
@z

@x
    docker : Unable to find image 'ubuntu:latest' locally
    ...
@y
    docker : Unable to find image 'ubuntu:latest' locally
    ...
@z

@x
    latest:
    Pulling from library/ubuntu
    22dc81ace0ea:
    Pulling fs layer
    1a8b3c87dba3:
    Pulling fs layer
    91390a1c435a:
    Pulling fs layer
    ...
    Digest: sha256:e348fbbea0e0a0e73ab0370de151e7800684445c509d46195aef73e090a49bd6
    Status: Downloaded newer image for ubuntu:latest
    ```
@y
    latest:
    Pulling from library/ubuntu
    22dc81ace0ea:
    Pulling fs layer
    1a8b3c87dba3:
    Pulling fs layer
    91390a1c435a:
    Pulling fs layer
    ...
    Digest: sha256:e348fbbea0e0a0e73ab0370de151e7800684445c509d46195aef73e090a49bd6
    Status: Downloaded newer image for ubuntu:latest
    ```
@z

@x
    > Do not use PowerShell ISE
    >
    > Interactive terminals do not work in PowerShell ISE (but they do in PowerShell). See [docker/for-win/issues/223](https://github.com/docker/for-win/issues/223).
@y
    > Do not use PowerShell ISE
    >
    > Interactive terminals do not work in PowerShell ISE (but they do in PowerShell). See [docker/for-win/issues/223](https://github.com/docker/for-win/issues/223).
@z

@x
2. You are in the container. At the root `#` prompt, check the `hostname` of the container:
@y
2. You are in the container. At the root `#` prompt, check the `hostname` of the container:
@z

@x
    ```shell
    root@8aea0acb7423:/# hostname
    8aea0acb7423
    ```
@y
    ```shell
    root@8aea0acb7423:/# hostname
    8aea0acb7423
    ```
@z

@x
    Notice that the hostname is assigned as the container ID (and is also used in the prompt).
@y
    Notice that the hostname is assigned as the container ID (and is also used in the prompt).
@z

@x
3. Exit the shell with the `exit` command (which also stops the container):
@y
3. Exit the shell with the `exit` command (which also stops the container):
@z

@x
    ```shell
    root@8aea0acb7423:/# exit
    >
    ```
@y
    ```shell
    root@8aea0acb7423:/# exit
    >
    ```
@z

@x
4. List containers with the `--all` option (because no containers are running).
@y
4. List containers with the `--all` option (because no containers are running).
@z

@x
    The `hello-world` container (randomly named, `relaxed_sammet`) stopped after displaying its message. The `ubuntu` container (randomly named, `laughing_kowalevski`) stopped when you exited the container.
@y
    The `hello-world` container (randomly named, `relaxed_sammet`) stopped after displaying its message. The `ubuntu` container (randomly named, `laughing_kowalevski`) stopped when you exited the container.
@z

@x
    ```shell
    > docker container ls --all
@y
    ```shell
    > docker container ls --all
@z

@x
    CONTAINER ID    IMAGE          COMMAND     CREATED          STATUS                      PORTS    NAMES
    8aea0acb7423    ubuntu         "bash"      2 minutes ago    Exited (0) 2 minutes ago             laughing_kowalevski
    45f77eb48e78    hello-world    "/hello"    3 minutes ago    Exited (0) 3 minutes ago             relaxed_sammet
    ```
@y
    CONTAINER ID    IMAGE          COMMAND     CREATED          STATUS                      PORTS    NAMES
    8aea0acb7423    ubuntu         "bash"      2 minutes ago    Exited (0) 2 minutes ago             laughing_kowalevski
    45f77eb48e78    hello-world    "/hello"    3 minutes ago    Exited (0) 3 minutes ago             relaxed_sammet
    ```
@z

@x
5. Pull and run a Dockerized [nginx](https://hub.docker.com/_/nginx/) web server that we name, `webserver`:
@y
5. Pull and run a Dockerized [nginx](https://hub.docker.com/_/nginx/) web server that we name, `webserver`:
@z

@x
    ```shell
    > docker run --detach --publish 80:80 --name webserver nginx
@y
    ```shell
    > docker run --detach --publish 80:80 --name webserver nginx
@z

@x
    Unable to find image 'nginx:latest' locally
    latest: Pulling from library/nginx
@y
    Unable to find image 'nginx:latest' locally
    latest: Pulling from library/nginx
@z

@x
    fdd5d7827f33: Pull complete
    a3ed95caeb02: Pull complete
    716f7a5f3082: Pull complete
    7b10f03a0309: Pull complete
    Digest: sha256:f6a001272d5d324c4c9f3f183e1b69e9e0ff12debeb7a092730d638c33e0de3e
    Status: Downloaded newer image for nginx:latest
    dfe13c68b3b86f01951af617df02be4897184cbf7a8b4d5caf1c3c5bd3fc267f
    ```
@y
    fdd5d7827f33: Pull complete
    a3ed95caeb02: Pull complete
    716f7a5f3082: Pull complete
    7b10f03a0309: Pull complete
    Digest: sha256:f6a001272d5d324c4c9f3f183e1b69e9e0ff12debeb7a092730d638c33e0de3e
    Status: Downloaded newer image for nginx:latest
    dfe13c68b3b86f01951af617df02be4897184cbf7a8b4d5caf1c3c5bd3fc267f
    ```
@z

@x
6. Point your web browser at `http://localhost` to display the nginx start page. (You don't need to append `:80` because you specified the default HTTP port in the `docker` command.)
@y
6. Point your web browser at `http://localhost` to display the nginx start page. (You don't need to append `:80` because you specified the default HTTP port in the `docker` command.)
@z

@x
    ![Run nginx edge](../images/nginx-homepage.png)
@y
    ![Run nginx edge](../images/nginx-homepage.png)
@z

@x
7. List only your _running_ containers:
@y
7. List only your _running_ containers:
@z

@x
    ```shell
    > docker container ls
@y
    ```shell
    > docker container ls
@z

@x
    CONTAINER ID    IMAGE    COMMAND                   CREATED          STATUS          PORTS                 NAMES
    0e788d8e4dfd    nginx    "nginx -g 'daemon of…"    2 minutes ago    Up 2 minutes    0.0.0.0:80->80/tcp    webserver
    ```
@y
    CONTAINER ID    IMAGE    COMMAND                   CREATED          STATUS          PORTS                 NAMES
    0e788d8e4dfd    nginx    "nginx -g 'daemon of…"    2 minutes ago    Up 2 minutes    0.0.0.0:80->80/tcp    webserver
    ```
@z

@x
8. Stop the running nginx container by the name we assigned it, `webserver`:
@y
8. Stop the running nginx container by the name we assigned it, `webserver`:
@z

@x
    ```shell
    >  docker container stop webserver
    ```
@y
    ```shell
    >  docker container stop webserver
    ```
@z

@x
9. Remove all three containers by their names -- the latter two names will differ for you:
@y
9. Remove all three containers by their names -- the latter two names will differ for you:
@z

@x
    ```shell
    > docker container rm webserver laughing_kowalevski relaxed_sammet
    ```
@y
    ```shell
    > docker container rm webserver laughing_kowalevski relaxed_sammet
    ```
@z

@x
## Docker Desktop user interface
@y
## Docker Desktop user interface
@z

@x
The Docker Desktop Enterprise user interface provides options to configure Docker Desktop settings such as installation, version packs, Docker Hub login, and more. Right-click the Docker icon in the Notifications area (or System tray) to open the Docker Desktop user interface:
@y
The Docker Desktop Enterprise user interface provides options to configure Docker Desktop settings such as installation, version packs, Docker Hub login, and more. Right-click the Docker icon in the Notifications area (or System tray) to open the Docker Desktop user interface:
@z

@x
 ![Showing hidden apps in the taskbar](../images/whale-icon-systray-hidden.png)
@y
 ![Showing hidden apps in the taskbar](../images/whale-icon-systray-hidden.png)
@z

@x
> **Note:** Administrators have the ability to lock some configuration options. Locked options cannot be selected, and are displayed with a lock icon.
@y
> **Note:** Administrators have the ability to lock some configuration options. Locked options cannot be selected, and are displayed with a lock icon.
@z

@x
### Settings
@y
### Settings
@z

@x
The **Settings** dialog allows you to configure your Docker Desktop Enterprise settings. The following section explains various configuration options available from the **Settings** dialog.
@y
The **Settings** dialog allows you to configure your Docker Desktop Enterprise settings. The following section explains various configuration options available from the **Settings** dialog.
@z

@x
> **Note:** Administrators have the ability to lock some configuration options. Locked options cannot be selected, and are displayed with a lock icon.
@y
> **Note:** Administrators have the ability to lock some configuration options. Locked options cannot be selected, and are displayed with a lock icon.
@z

@x
 Select **Settings** to open the Settings dialog:
@y
 Select **Settings** to open the Settings dialog:
@z

@x
 ![Docker Desktop Enterprise popup menu](../images/docker-menu-settings.png)
@y
 ![Docker Desktop Enterprise popup menu](../images/docker-menu-settings.png)
@z

@x
#### General
@y
#### General
@z

@x
On the **General** tab of the Settings dialog, you can configure when to start Docker Desktop.
@y
On the **General** tab of the Settings dialog, you can configure when to start Docker Desktop.
@z

@x
![Settings](../images/settings-general.png)
@y
![Settings](../images/settings-general.png)
@z

@x
- **Start Docker Desktop when you log in** - Automatically start the Docker Desktop application upon Windows system login.
@y
- **Start Docker Desktop when you log in** - Automatically start the Docker Desktop application upon Windows system login.
@z

@x
- **Send usage statistics** - By default, Docker Desktop sends diagnostics,
crash reports, and usage data. This information helps Docker improve and troubleshoot the application. Clear the check box to opt out. Docker might prompt you for more information.
@y
- **Send usage statistics** - By default, Docker Desktop sends diagnostics,
crash reports, and usage data. This information helps Docker improve and troubleshoot the application. Clear the check box to opt out. Docker might prompt you for more information.
@z

@x
- **Expose daemon on tcp://localhost:2375 without TLS** - Click this option to enable legacy clients to connect to the Docker daemon. You must use this option with caution as exposing the daemon without TLS can result in remote code execution attacks.
@y
- **Expose daemon on tcp://localhost:2375 without TLS** - Click this option to enable legacy clients to connect to the Docker daemon. You must use this option with caution as exposing the daemon without TLS can result in remote code execution attacks.
@z

@x
#### Shared drives
@y
#### Shared drives
@z

@x
Share your local drives (volumes) with Docker Desktop, so that they are
available to your [Linux containers](#switch-between-windows-and-linux-containers).
@y
Share your local drives (volumes) with Docker Desktop, so that they are
available to your [Linux containers](#switch-between-windows-and-linux-containers).
@z

@x
![Shared drives](../images/settings-shared-drives.png)
@y
![Shared drives](../images/settings-shared-drives.png)
@z

@x
Permission for shared drives are tied to the credentials you provide here. If you run `docker` commands under a different username than the one configured here, your containers cannot access the mounted volumes.
@y
Permission for shared drives are tied to the credentials you provide here. If you run `docker` commands under a different username than the one configured here, your containers cannot access the mounted volumes.
@z

@x
To apply shared drives, you are prompted for your Windows system (domain) username and password. You can select an option to have Docker store the credentials so that you don't need to enter them every time.
@y
To apply shared drives, you are prompted for your Windows system (domain) username and password. You can select an option to have Docker store the credentials so that you don't need to enter them every time.
@z

@x
Tips on shared drives, permissions, and volume mounts:
@y
Tips on shared drives, permissions, and volume mounts:
@z

@x
- Shared drives are only required for mounting volumes in [Linux containers](#switch-between-windows-and-linux-containers), not for Windows containers. For Linux containers, you need to share the drive where the Dockerfile and volume are located. If you get errors such as `file not found` or `cannot start service` you may need to enable shared drives. See [Volume mounting requires shared drives for Linux containers](/docker-for-windows/troubleshoot#volume-mounting-requires-shared-drives-for-linux-containers).
@y
- Shared drives are only required for mounting volumes in [Linux containers](#switch-between-windows-and-linux-containers), not for Windows containers. For Linux containers, you need to share the drive where the Dockerfile and volume are located. If you get errors such as `file not found` or `cannot start service` you may need to enable shared drives. See [Volume mounting requires shared drives for Linux containers](/docker-for-windows/troubleshoot#volume-mounting-requires-shared-drives-for-linux-containers).
@z

@x
- If possible, avoid volume mounts from the Windows host, and instead mount on
the Linux VM, or use a [data volume](https://docs.docker.com/storage/volumes/) (named volume) or [data container](https://docs.docker.com/storage/volumes/). There are a number of issues with using host-mounted volumes and network paths
for database files. See [Volume mounts from host paths use a nobrl option to override database locking](https://docs.docker.com/docker-for-windows/troubleshoot/#volume-mounts-from-host-paths-use-a-nobrl-option-to-override-database-locking).
@y
- If possible, avoid volume mounts from the Windows host, and instead mount on
the Linux VM, or use a [data volume](https://docs.docker.com/storage/volumes/) (named volume) or [data container](https://docs.docker.com/storage/volumes/). There are a number of issues with using host-mounted volumes and network paths
for database files. See [Volume mounts from host paths use a nobrl option to override database locking](https://docs.docker.com/docker-for-windows/troubleshoot/#volume-mounts-from-host-paths-use-a-nobrl-option-to-override-database-locking).
@z

@x
- Docker Desktop sets permissions to read/write/execute for users, groups and others [0777 or a+rwx](http://permissions-calculator.org/decode/0777/).
This is not configurable. See [Permissions errors on data directories for shared volumes](https://docs.docker.com/docker-for-windows/troubleshoot/#permissions-errors-on-data-directories-for-shared-volumes).
@y
- Docker Desktop sets permissions to read/write/execute for users, groups and others [0777 or a+rwx](http://permissions-calculator.org/decode/0777/).
This is not configurable. See [Permissions errors on data directories for shared volumes](https://docs.docker.com/docker-for-windows/troubleshoot/#permissions-errors-on-data-directories-for-shared-volumes).
@z

@x
- Ensure the domain user has access to shared drives, as described in [Verify domain user has permissions for shared drives](https://docs.docker.com/docker-for-windows/troubleshoot/#verify-domain-user-has-permissions-for-shared-drives-volumes).
@y
- Ensure the domain user has access to shared drives, as described in [Verify domain user has permissions for shared drives](https://docs.docker.com/docker-for-windows/troubleshoot/#verify-domain-user-has-permissions-for-shared-drives-volumes).
@z

@x
##### Firewall rules for shared drives
@y
##### Firewall rules for shared drives
@z

@x
Shared drives require port 445 to be open between the host machine and the
virtual machine that runs Linux containers. Docker detects if port 445 is closed
and shows the following message when you try to add a shared drive:
@y
Shared drives require port 445 to be open between the host machine and the
virtual machine that runs Linux containers. Docker detects if port 445 is closed
and shows the following message when you try to add a shared drive:
@z

@x
![Port 445 blocked](../images/shared-drive-firewall-blocked.png)
@y
![Port 445 blocked](../images/shared-drive-firewall-blocked.png)
@z

@x
To share the drive, allow connections between the Windows host machine and the
virtual machine in Windows Firewall or your third party firewall software. You
do not need to open port 445 on any other network.
@y
To share the drive, allow connections between the Windows host machine and the
virtual machine in Windows Firewall or your third party firewall software. You
do not need to open port 445 on any other network.
@z

@x
By default, allow connections to `10.0.75.1` on port 445 (the Windows host) from
`10.0.75.2` (the virtual machine). If your firewall rules seem correct, you may
need to toggle or [reinstall the File and Print sharing service on the Hyper-V virtual network card](http://stackoverflow.com/questions/42203488/settings-to-windows-firewall-to-allow-docker-for-windows-to-share-drive/43904051#43904051).
@y
By default, allow connections to `10.0.75.1` on port 445 (the Windows host) from
`10.0.75.2` (the virtual machine). If your firewall rules seem correct, you may
need to toggle or [reinstall the File and Print sharing service on the Hyper-V virtual network card](http://stackoverflow.com/questions/42203488/settings-to-windows-firewall-to-allow-docker-for-windows-to-share-drive/43904051#43904051).
@z

@x
##### Shared drives on demand
@y
##### Shared drives on demand
@z

@x
You can share a drive "on demand" the first time a particular mount is requested.
@y
You can share a drive "on demand" the first time a particular mount is requested.
@z

@x
If you run a Docker command from a shell with a volume mount (as shown in the
example below) or kick off a Compose file that includes volume mounts, you get a
popup asking if you want to share the specified drive.
@y
If you run a Docker command from a shell with a volume mount (as shown in the
example below) or kick off a Compose file that includes volume mounts, you get a
popup asking if you want to share the specified drive.
@z

@x
You can select to **Share it**, in which case it is added your Docker Desktop Enterprise [Shared Drives List](#shared-drives) and available to
containers. Alternatively, you can opt not to share it by selecting **Cancel**.
@y
You can select to **Share it**, in which case it is added your Docker Desktop Enterprise [Shared Drives List](#shared-drives) and available to
containers. Alternatively, you can opt not to share it by selecting **Cancel**.
@z

@x
![Shared drive on demand](../images/shared-drive-on-demand.png)
@y
![Shared drive on demand](../images/shared-drive-on-demand.png)
@z

@x
#### Advanced
@y
#### Advanced
@z

@x
The Linux VM restarts after changing the settings on the **Advanced** tab. This takes a few seconds.
@y
The Linux VM restarts after changing the settings on the **Advanced** tab. This takes a few seconds.
@z

@x
![CPU and Memory settings](../images/settings-advanced.png)
@y
![CPU and Memory settings](../images/settings-advanced.png)
@z

@x
- **CPUs** - Change the number of processors assigned to the Linux VM.
@y
- **CPUs** - Change the number of processors assigned to the Linux VM.
@z

@x
- **Memory** - Change the amount of memory the Docker Desktop Enterprise Linux VM uses.
@y
- **Memory** - Change the amount of memory the Docker Desktop Enterprise Linux VM uses.
@z

@x
- **Swap** - Configure the swap file size.
@y
- **Swap** - Configure the swap file size.
@z

@x
#### Network
@y
#### Network
@z

@x
You can configure Docker Desktop Enterprise networking to work on a virtual private network (VPN).
@y
You can configure Docker Desktop Enterprise networking to work on a virtual private network (VPN).
@z

@x
![Network settings](../images/settings-network.png)
@y
![Network settings](../images/settings-network.png)
@z

@x
> **Note:** Administrators have the ability to lock some configuration options. Locked options cannot be selected, and are displayed with a lock icon.
@y
> **Note:** Administrators have the ability to lock some configuration options. Locked options cannot be selected, and are displayed with a lock icon.
@z

@x
- **Internal Virtual Switch** - You can specify a network address translation (NAT) prefix and subnet mask to enable Internet connectivity.
@y
- **Internal Virtual Switch** - You can specify a network address translation (NAT) prefix and subnet mask to enable Internet connectivity.
@z

@x
- **DNS Server** - You can configure the DNS server to use dynamic or static IP addressing.
@y
- **DNS Server** - You can configure the DNS server to use dynamic or static IP addressing.
@z

@x
> **Note**: Some users reported problems connecting to Docker Hub on Docker Desktop Enterprise. This would manifest as an error when trying to run
> `docker` commands that pull images from Docker Hub that are not already
> downloaded, such as a first time run of `docker run hello-world`. If you
> encounter this, reset the DNS server to use the Google DNS fixed address:
> `8.8.8.8`. For more information, see [Networking issues](https://docs.docker.com/docker-for-windows/troubleshoot/#networking-issues) in Troubleshooting.
@y
> **Note**: Some users reported problems connecting to Docker Hub on Docker Desktop Enterprise. This would manifest as an error when trying to run
> `docker` commands that pull images from Docker Hub that are not already
> downloaded, such as a first time run of `docker run hello-world`. If you
> encounter this, reset the DNS server to use the Google DNS fixed address:
> `8.8.8.8`. For more information, see [Networking issues](https://docs.docker.com/docker-for-windows/troubleshoot/#networking-issues) in Troubleshooting.
@z

@x
Updating these settings requires a reconfiguration and reboot of the Linux VM.
@y
Updating these settings requires a reconfiguration and reboot of the Linux VM.
@z

@x
#### Proxies
@y
#### Proxies
@z

@x
Docker Desktop Enterprise lets you configure HTTP/HTTPS Proxy Settings and
automatically propagates these to Docker and to your containers.  For example,
if you set your proxy settings to `http://proxy.example.com`, Docker uses this
proxy when pulling containers.
@y
Docker Desktop Enterprise lets you configure HTTP/HTTPS Proxy Settings and
automatically propagates these to Docker and to your containers.  For example,
if you set your proxy settings to `http://proxy.example.com`, Docker uses this
proxy when pulling containers.
@z

@x
![Proxies](../images/settings-proxies.png)
@y
![Proxies](../images/settings-proxies.png)
@z

@x
When you start a container, your proxy settings propagate into the containers. For example:
@y
When you start a container, your proxy settings propagate into the containers. For example:
@z

@x
```ps
> docker run alpine env
@y
```ps
> docker run alpine env
@z

@x
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=b7edf988b2b5
TERM=xterm
HOME=/root
HTTP_PROXY=http://proxy.example.com:3128
http_proxy=http://proxy.example.com:3128
no_proxy=*.local, 169.254/16
```
@y
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=b7edf988b2b5
TERM=xterm
HOME=/root
HTTP_PROXY=http://proxy.example.com:3128
http_proxy=http://proxy.example.com:3128
no_proxy=*.local, 169.254/16
```
@z

@x
In the output above, the `HTTP_PROXY`, `http_proxy`, and `no_proxy` environment
variables are set. When your proxy configuration changes, Docker restarts
automatically to pick up the new settings. If you have containers that you wish
to keep running across restarts, you should consider using
[restart policies](https://docs.docker.com/engine/reference/run/#restart-policies---restart).
@y
In the output above, the `HTTP_PROXY`, `http_proxy`, and `no_proxy` environment
variables are set. When your proxy configuration changes, Docker restarts
automatically to pick up the new settings. If you have containers that you wish
to keep running across restarts, you should consider using
[restart policies](https://docs.docker.com/engine/reference/run/#restart-policies---restart).
@z

@x
#### Daemon
@y
#### Daemon
@z

@x
Docker Desktop Enterprise enables you to configure the Docker daemon based on your preferences.
The **Basic** mode lets you configure the more common daemon options with interactive settings and the **Advanced** mode lets you edit the JSON file directly.
@y
Docker Desktop Enterprise enables you to configure the Docker daemon based on your preferences.
The **Basic** mode lets you configure the more common daemon options with interactive settings and the **Advanced** mode lets you edit the JSON file directly.
@z

@x
![Docker Daemon](../images/settings-daemon-basic.png)
@y
![Docker Daemon](../images/settings-daemon-basic.png)
@z

@x
> **Note:** Administrators have the ability to lock some configuration options. Locked options cannot be selected, and are displayed with a lock icon.
@y
> **Note:** Administrators have the ability to lock some configuration options. Locked options cannot be selected, and are displayed with a lock icon.
@z

@x
##### Experimental mode
@y
##### Experimental mode
@z

@x
Docker Desktop Enterprise has the experimental version
of Docker Engine enabled, described in the [Docker Experimental Features](https://github.com/docker/cli/blob/master/experimental/README.md) readme. If you don't select **Experimental Features**, Docker Desktop Enterprise uses the current generally available release of Docker Engine.
@y
Docker Desktop Enterprise has the experimental version
of Docker Engine enabled, described in the [Docker Experimental Features](https://github.com/docker/cli/blob/master/experimental/README.md) readme. If you don't select **Experimental Features**, Docker Desktop Enterprise uses the current generally available release of Docker Engine.
@z

@x
> {% include experimental.md %}
@y
> {% include experimental.md %}
@z

@x
Run `docker version` to see if you are in Experimental mode. Experimental mode
is listed under `Server` data. If `Experimental` is `true`, then Docker is
running in experimental mode, as shown here:
@y
Run `docker version` to see if you are in Experimental mode. Experimental mode
is listed under `Server` data. If `Experimental` is `true`, then Docker is
running in experimental mode, as shown here:
@z

@x
```shell
> docker version
@y
```shell
> docker version
@z

@x
Client:
 Version:       18.03.0-ce
 API version:   1.37
 Go version:    go1.9.4
 Git commit:    0520e24
 Built: Wed Mar 21 23:06:28 2018
 OS/Arch:       windows/amd64
 Experimental:  true
 Orchestrator:  swarm
@y
Client:
 Version:       18.03.0-ce
 API version:   1.37
 Go version:    go1.9.4
 Git commit:    0520e24
 Built: Wed Mar 21 23:06:28 2018
 OS/Arch:       windows/amd64
 Experimental:  true
 Orchestrator:  swarm
@z

@x
Server:
 Engine:
  Version:      18.03.0-ce
  API version:  1.37 (minimum version 1.24)
  Go version:   go1.9.4
  Git commit:   0520e24
  Built:        Wed Mar 21 23:21:06 2018
  OS/Arch:      windows/amd64
  Experimental: true
  ```
@y
Server:
 Engine:
  Version:      18.03.0-ce
  API version:  1.37 (minimum version 1.24)
  Go version:   go1.9.4
  Git commit:   0520e24
  Built:        Wed Mar 21 23:21:06 2018
  OS/Arch:      windows/amd64
  Experimental: true
  ```
@z

@x
##### Insecure registries
@y
##### Insecure registries
@z

@x
You can set up your own [registries](https://docs.docker.com/registry/introduction) on the **Basic** Daemon settings.
@y
You can set up your own [registries](https://docs.docker.com/registry/introduction) on the **Basic** Daemon settings.
@z

@x
Normally, you store public or private images in [Docker Hub](https://hub.docker.com/). Here, you
can use Docker to set up your own [insecure registry](https://docs.docker.com/registry/insecure/).
Simply add URLs for insecure registries and registry mirrors on which to host your images.
@y
Normally, you store public or private images in [Docker Hub](https://hub.docker.com/). Here, you
can use Docker to set up your own [insecure registry](https://docs.docker.com/registry/insecure/).
Simply add URLs for insecure registries and registry mirrors on which to host your images.
@z

@x
For more information, see:
@y
For more information, see:
@z

@x
- [How do I add custom CA certificates?](https://docs.docker.com/docker-for-windows/faqs/#how-do-i-add-custom-ca-certificates)
@y
- [How do I add custom CA certificates?](https://docs.docker.com/docker-for-windows/faqs/#how-do-i-add-custom-ca-certificates)
@z

@x
- [How do I add client certificates?](https://docs.docker.com/docker-for-windows/faqs/#how-do-i-add-client-certificates)
@y
- [How do I add client certificates?](https://docs.docker.com/docker-for-windows/faqs/#how-do-i-add-client-certificates)
@z

@x
#### Daemon configuration file
@y
#### Daemon configuration file
@z

@x
The **Advanced** daemon settings provide the original option to directly edit
the JSON configuration file for the [daemon](https://docs.docker.com/engine/reference/commandline/dockerd).
@y
The **Advanced** daemon settings provide the original option to directly edit
the JSON configuration file for the [daemon](https://docs.docker.com/engine/reference/commandline/dockerd).
@z

@x
> Updating these settings requires a reconfiguration and reboot of the Linux VM.
@y
> Updating these settings requires a reconfiguration and reboot of the Linux VM.
@z

@x
![Docker Daemon](../images/settings-daemon-advanced.png)
@y
![Docker Daemon](../images/settings-daemon-advanced.png)
@z

@x
For a full list of options on the Docker daemon, see [daemon](https://docs.docker.com/engine/reference/commandline/dockerd), and also sub-topics:
@y
For a full list of options on the Docker daemon, see [daemon](https://docs.docker.com/engine/reference/commandline/dockerd), and also sub-topics:
@z

@x
- [Daemon configuration file](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file)
@y
- [Daemon configuration file](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file)
@z

@x
- [Linux configuration file](https://docs.docker.com/engine/reference/commandline/dockerd/#linux-configuration-file)
@y
- [Linux configuration file](https://docs.docker.com/engine/reference/commandline/dockerd/#linux-configuration-file)
@z

@x
- [Windows configuration file](https://docs.docker.com/engine/reference/commandline/dockerd/#windows-configuration-file)
@y
- [Windows configuration file](https://docs.docker.com/engine/reference/commandline/dockerd/#windows-configuration-file)
@z

@x
#### Kubernetes
@y
#### Kubernetes
@z

@x
Kubernetes is available on Docker Desktop Enterprise. A standalone Kubernetes server is included that runs on your Windows host, so that you can test deploying your
Docker workloads on Kubernetes.
@y
Kubernetes is available on Docker Desktop Enterprise. A standalone Kubernetes server is included that runs on your Windows host, so that you can test deploying your
Docker workloads on Kubernetes.
@z

@x
![Enable Kubernetes](../images/settings-kubernetes.png)
@y
![Enable Kubernetes](../images/settings-kubernetes.png)
@z

@x
The Kubernetes client command, `kubectl`, is included and configured to connect
to the local Kubernetes server. If you have `kubectl` already installed and
pointing to some other environment, such as `minikube` or a GKE cluster, be sure
to change context so that `kubectl` is pointing to `docker-desktop`:
@y
The Kubernetes client command, `kubectl`, is included and configured to connect
to the local Kubernetes server. If you have `kubectl` already installed and
pointing to some other environment, such as `minikube` or a GKE cluster, be sure
to change context so that `kubectl` is pointing to `docker-desktop`:
@z

@x
```bash
> kubectl config get-contexts
> kubectl config use-context docker-desktop
```
@y
```bash
> kubectl config get-contexts
> kubectl config use-context docker-desktop
```
@z

@x
You can also change it through the Docker Desktop Enterprise menu:
@y
You can also change it through the Docker Desktop Enterprise menu:
@z

@x
![Change Kubernetes Context](../images/docker-menu-context-switch.png)
@y
![Change Kubernetes Context](../images/docker-menu-context-switch.png)
@z

@x
If you installed `kubectl` by another method, and
experience conflicts, remove it.
@y
If you installed `kubectl` by another method, and
experience conflicts, remove it.
@z

@x
- To enable Kubernetes support and install a standalone instance of Kubernetes
  running as a Docker container, select **Enable Kubernetes** and click the
  **Install** button.
@y
- To enable Kubernetes support and install a standalone instance of Kubernetes
  running as a Docker container, select **Enable Kubernetes** and click the
  **Install** button.
@z

@x
 Images required to run the Kubernetes server are instantiated as containers, and the `kubectl.exe` command is installed in the path.
@y
 Images required to run the Kubernetes server are instantiated as containers, and the `kubectl.exe` command is installed in the path.
@z

@x
- By default, Kubernetes containers are hidden from commands like `docker
  service ls`, because managing them manually is not supported. To make them
  visible, select **Show system containers (advanced)** and click **Apply and restart**.
  Most users do not have to use this option.
@y
- By default, Kubernetes containers are hidden from commands like `docker
  service ls`, because managing them manually is not supported. To make them
  visible, select **Show system containers (advanced)** and click **Apply and restart**.
  Most users do not have to use this option.
@z

@x
- To disable Kubernetes support at any time, deselect **Enable Kubernetes**.
  The Kubernetes containers are stopped and removed, and the
  `kubectl` command is removed.
@y
- To disable Kubernetes support at any time, deselect **Enable Kubernetes**.
  The Kubernetes containers are stopped and removed, and the
  `kubectl` command is removed.
@z

@x
  For more about using the Kubernetes integration with Docker Desktop Enterprise,
  see [Deploy on Kubernetes](https://docs.docker.com/docker-for-windows/kubernetes).
@y
  For more about using the Kubernetes integration with Docker Desktop Enterprise,
  see [Deploy on Kubernetes](https://docs.docker.com/docker-for-windows/kubernetes).
@z

@x
#### Reset
@y
#### Reset
@z

@x
On the Reset tab, you can restart Docker or reset its configuration.
@y
On the Reset tab, you can restart Docker or reset its configuration.
@z

@x
![Reset](../images/settings-reset.png)
@y
![Reset](../images/settings-reset.png)
@z

@x
- **Restart Docker Desktop** - Shuts down and restarts the Docker Desktop application.
@y
- **Restart Docker Desktop** - Shuts down and restarts the Docker Desktop application.
@z

@x
- **Reset to factory defaults** - Resets Docker to factory defaults. This is
  useful in cases where Docker stops working or becomes unresponsive.
@y
- **Reset to factory defaults** - Resets Docker to factory defaults. This is
  useful in cases where Docker stops working or becomes unresponsive.
@z

@x
### Version Selection
@y
### Version Selection
@z

@x
The **Version Selection** option lists the version packs installed on your Docker Desktop environment and allows you to switch between Docker Engine and Kubernetes versions using a single click. When you select a different version pack, Docker Desktop restarts and the selected versions of Docker Engine and Kubernetes will be used.
@y
The **Version Selection** option lists the version packs installed on your Docker Desktop environment and allows you to switch between Docker Engine and Kubernetes versions using a single click. When you select a different version pack, Docker Desktop restarts and the selected versions of Docker Engine and Kubernetes will be used.
@z

@x
To switch to a different version pack, simply click on the version pack you would like to use.
@y
To switch to a different version pack, simply click on the version pack you would like to use.
@z

@x
![Version Selection](../images/win-ver-select.PNG)
@y
![Version Selection](../images/win-ver-select.PNG)
@z

@x
### Troubleshoot
@y
### Troubleshoot
@z

@x
The **Diagnose and Feedback** option allows you troubleshoot any issues you may be experiencing with Docker Desktop Enterprise. For more information, see [Troubleshoot DDE issues on Windows](/desktop/enterprise/troubleshoot/windows-issues).
@y
The **Diagnose and Feedback** option allows you troubleshoot any issues you may be experiencing with Docker Desktop Enterprise. For more information, see [Troubleshoot DDE issues on Windows](/desktop/enterprise/troubleshoot/windows-issues).
@z

@x
### Switch between Windows and Linux containers
@y
### Switch between Windows and Linux containers
@z

@x
From the Docker Desktop Enterprise menu, you can toggle which daemon (Linux or Windows) the Docker CLI talks to. Select **Switch to Windows containers** to use Windows containers, or select **Switch to Linux containers** to use Linux containers.
@y
From the Docker Desktop Enterprise menu, you can toggle which daemon (Linux or Windows) the Docker CLI talks to. Select **Switch to Windows containers** to use Windows containers, or select **Switch to Linux containers** to use Linux containers.
@z

@x
![Windows-Linux container types switch](../images/docker-menu-switch.png)
@y
![Windows-Linux container types switch](../images/docker-menu-switch.png)
@z

@x
For more information on Windows containers, refer to the following documentation:
@y
For more information on Windows containers, refer to the following documentation:
@z

@x
- Microsoft documentation on [Windows containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index).
@y
- Microsoft documentation on [Windows containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index).
@z

@x
- [Build and Run Your First Windows Server Container](https://blog.docker.com/2016/09/build-your-first-docker-windows-server-container/) (blog post) gives a quick tour of how to build and run native Docker Windows containers on Windows 10 and Windows Server 2016 evaluation releases.
@y
- [Build and Run Your First Windows Server Container](https://blog.docker.com/2016/09/build-your-first-docker-windows-server-container/) (blog post) gives a quick tour of how to build and run native Docker Windows containers on Windows 10 and Windows Server 2016 evaluation releases.
@z

@x
- [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  shows you how to use the [MusicStore](https://github.com/aspnet/MusicStore/)
  application with Windows containers. The MusicStore is a standard .NET application and, [forked here to use containers](https://github.com/friism/MusicStore), is a good example of a multi-container application.
@y
- [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  shows you how to use the [MusicStore](https://github.com/aspnet/MusicStore/)
  application with Windows containers. The MusicStore is a standard .NET application and, [forked here to use containers](https://github.com/friism/MusicStore), is a good example of a multi-container application.
@z

@x
- To understand how to connect to Windows containers from the local host, see [Limitations of Windows containers for `localhost` and published ports](https://docs.docker.com/docker-for-windows/troubleshoot/#limitations-of-windows-containers-for-localhost-and-published-ports).
@y
- To understand how to connect to Windows containers from the local host, see [Limitations of Windows containers for `localhost` and published ports](https://docs.docker.com/docker-for-windows/troubleshoot/#limitations-of-windows-containers-for-localhost-and-published-ports).
@z

@x
The **Settings** dialog changes with Windows containers. When you switch to Windows containers, the **Settings** dialog only shows those tabs that are active and apply to your Windows containers:
@y
The **Settings** dialog changes with Windows containers. When you switch to Windows containers, the **Settings** dialog only shows those tabs that are active and apply to your Windows containers:
@z

@x
- [General](#general)
@y
- [General](#general)
@z

@x
- [Proxies](#proxies)
@y
- [Proxies](#proxies)
@z

@x
- [Daemon](#daemon)
@y
- [Daemon](#daemon)
@z

@x
- [Diagnose and Feedback](#diagnose-and-feedback)
@y
- [Diagnose and Feedback](#diagnose-and-feedback)
@z

@x
- [Reset](#reset)
@y
- [Reset](#reset)
@z

@x
If you set proxies or daemon configuration in Windows containers mode, these apply only on Windows containers. If you switch back to Linux containers, proxies and daemon configurations return to what you had set for Linux containers. Your Windows container settings are retained and become available again when you switch back.
@y
If you set proxies or daemon configuration in Windows containers mode, these apply only on Windows containers. If you switch back to Linux containers, proxies and daemon configurations return to what you had set for Linux containers. Your Windows container settings are retained and become available again when you switch back.
@z

@x
### Docker Hub
@y
### Docker Hub
@z

@x
Select **Sign in /Create Docker ID** from the Docker Desktop Enterprise menu to access your [Docker Hub](https://hub.docker.com/) account. Once logged in, select **Repositories**  on the Docker Desktop Enterprise menu to access your Docker Hub repositories directly.
@y
Select **Sign in /Create Docker ID** from the Docker Desktop Enterprise menu to access your [Docker Hub](https://hub.docker.com/) account. Once logged in, select **Repositories**  on the Docker Desktop Enterprise menu to access your Docker Hub repositories directly.
@z

@x
See the following [Docker Hub topics](https://docs.docker.com/docker-hub/) to learn more:
@y
See the following [Docker Hub topics](https://docs.docker.com/docker-hub/) to learn more:
@z

@x
- [Organizations and Teams in Docker Hub](https://docs.docker.com/docker-hub/orgs/)
@y
- [Organizations and Teams in Docker Hub](https://docs.docker.com/docker-hub/orgs/)
@z

@x
- [Builds and Images](https://docs.docker.com/docker-hub/official_images/)
@y
- [Builds and Images](https://docs.docker.com/docker-hub/official_images/)
@z

@x
### Design new application
@y
### Design new application
@z

@x
Select this option to open the Application Designer user interface. Application Designer provides a library of application and service templates to help Docker developers quickly create new Docker applications. For more information, see [Application Designer](/desktop/enterprise/app-designer).
@y
Select this option to open the Application Designer user interface. Application Designer provides a library of application and service templates to help Docker developers quickly create new Docker applications. For more information, see [Application Designer](/desktop/enterprise/app-designer).
@z

@x
## Adding TLS certificates
@y
## Adding TLS certificates
@z

@x
You can add trusted **Certificate Authorities (CAs)** to your Docker daemon to verify registry server certificates, and **client certificates**, to authenticate to registries.
@y
You can add trusted **Certificate Authorities (CAs)** to your Docker daemon to verify registry server certificates, and **client certificates**, to authenticate to registries.
@z

@x
For more information, see [How do I add custom CA certificates?](https://docs.docker.com/docker-for-windows/faqs/#how-do-i-add-custom-ca-certificates) and
and [How do I add client certificates?](https://docs.docker.com/docker-for-windows/faqs/#how-do-i-add-client-certificates) in the FAQs.
@y
For more information, see [How do I add custom CA certificates?](https://docs.docker.com/docker-for-windows/faqs/#how-do-i-add-custom-ca-certificates) and
and [How do I add client certificates?](https://docs.docker.com/docker-for-windows/faqs/#how-do-i-add-client-certificates) in the FAQs.
@z
