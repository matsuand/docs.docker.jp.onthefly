%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Windows and Docker Toolbox
keywords: windows, alpha, beta, toolbox, docker-machine, tutorial
hide_from_sitemap: true
title: Docker Toolbox
redirect_from:
- /toolbox/
- /toolbox/overview/
- /toolbox/toolbox_install_mac/
- /toolbox/toolbox_install_windows/
- /toolbox/faqs/
- /toolbox/faqs/troubleshoot/
- /docker-for-mac/docker-toolbox/
toc_min: 1
toc_max: 2
---
@y
---
description: Docker Desktop for Windows and Docker Toolbox
keywords: windows, alpha, beta, toolbox, docker-machine, tutorial
hide_from_sitemap: true
title: Docker Toolbox
redirect_from:
- /toolbox/
- /toolbox/overview/
- /toolbox/toolbox_install_mac/
- /toolbox/toolbox_install_windows/
- /toolbox/faqs/
- /toolbox/faqs/troubleshoot/
- /docker-for-mac/docker-toolbox/
toc_min: 1
toc_max: 2
---
@z

@x
>**Deprecated**
>
> Docker Toolbox has been deprecated and is no longer in active development. Please use Docker Desktop instead. See [Docker Desktop for Mac](../docker-for-mac/index.md) and [Docker Desktop for Windows](../docker-for-windows/index.md).
{: .warning }
@y
>**Deprecated**
>
> Docker Toolbox has been deprecated and is no longer in active development. Please use Docker Desktop instead. See [Docker Desktop for Mac](../docker-for-mac/index.md) and [Docker Desktop for Windows](../docker-for-windows/index.md).
{: .warning }
@z

@x
This page explains how to migrate your Docker Toolbox disk images to Docker Desktop. It also contains instructions on how to uninstall Docker Toolbox from Mac and Windows machines.
@y
This page explains how to migrate your Docker Toolbox disk images to Docker Desktop. It also contains instructions on how to uninstall Docker Toolbox from Mac and Windows machines.
@z

@x
## Migrate from Docker Toolbox to Docker Desktop on Mac
@y
## Migrate from Docker Toolbox to Docker Desktop on Mac
@z

@x
You can migrate existing Docker Toolbox images with the steps described below.
@y
You can migrate existing Docker Toolbox images with the steps described below.
@z

@x
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
@y
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
@z

@x
```
$ docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, export each of these images (and any other images you wish to keep):
@y
Next, export each of these images (and any other images you wish to keep):
@z

@x
```
$ docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, when running Docker Desktop on Mac, reload all these images:
@y
Next, when running Docker Desktop on Mac, reload all these images:
@z

@x
```
$ docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
@y
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
@z

@x
Finally (optional), if you are done with Docker Toolbox, you can fully
[uninstall](#uninstall-docker-toolbox-on-windows) Docker Toolbox using the instructions described in the following section.
@y
Finally (optional), if you are done with Docker Toolbox, you can fully
[uninstall](#uninstall-docker-toolbox-on-windows) Docker Toolbox using the instructions described in the following section.
@z

@x
## Migrate from Docker Toolbox to Docker Desktop on Windows
@y
## Migrate from Docker Toolbox to Docker Desktop on Windows
@z

@x
You can migrate existing Docker Toolbox images with the steps described below.
@y
You can migrate existing Docker Toolbox images with the steps described below.
@z

@x
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
@y
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
@z

@x
```
> docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
> docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, export each of these images (and any other images you wish to keep):
@y
Next, export each of these images (and any other images you wish to keep):
@z

@x
```
> docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
> docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, when running Docker Desktop on Windows, reload all these images:
@y
Next, when running Docker Desktop on Windows, reload all these images:
@z

@x
```
> docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
> docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
@y
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
@z

@x
## Uninstall Docker Toolbox
@y
## Uninstall Docker Toolbox
@z

@x
Removing Toolbox involves removing all the Docker components it includes.
@y
Removing Toolbox involves removing all the Docker components it includes.
@z

@x
A full uninstall also includes removing the local and remote machines
you created with Docker Machine. In some cases, you might want to keep
machines created with Docker Machine. For example, if you plan to re-install Docker Machine as a part of Docker Desktop, you can continue to manage those machines through Docker. Or, if you have remote machines on a cloud provider and you plan to manage them using the provider, you wouldn't want to remove
them. So, the step to remove machines is described here as optional.
@y
A full uninstall also includes removing the local and remote machines
you created with Docker Machine. In some cases, you might want to keep
machines created with Docker Machine. For example, if you plan to re-install Docker Machine as a part of Docker Desktop, you can continue to manage those machines through Docker. Or, if you have remote machines on a cloud provider and you plan to manage them using the provider, you wouldn't want to remove
them. So, the step to remove machines is described here as optional.
@z

@x
### Uninstall Docker Toolbox on Mac
@y
### Uninstall Docker Toolbox on Mac
@z

@x
To uninstall Docker Toolbox on Mac:
@y
To uninstall Docker Toolbox on Mac:
@z

@x
1.  List your machines.
@y
1.  List your machines.
@z

@x
    ```
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@y
    ```
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@z

@x
2.  Optionally, remove each machine. For example:
@y
2.  Optionally, remove each machine. For example:
@z

@x
    ```
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@y
    ```
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@z

@x
    This step is optional because if you plan
    to re-install Docker Machine as a part
    of [Docker Desktop for Mac](../docker-for-mac/index.md), you can import and
    continue to manage those machines through Docker.
@y
    This step is optional because if you plan
    to re-install Docker Machine as a part
    of [Docker Desktop for Mac](../docker-for-mac/index.md), you can import and
    continue to manage those machines through Docker.
@z

@x
3.  In your "Applications" folder, remove the "Docker" directory,
    which contains "Docker Quickstart Terminal" and "Kitematic".
@y
3.  In your "Applications" folder, remove the "Docker" directory,
    which contains "Docker Quickstart Terminal" and "Kitematic".
@z

@x
4.  Run the following in a command shell to fully remove Kitematic:
@y
4.  Run the following in a command shell to fully remove Kitematic:
@z

@x
    ```
    $ rm -fr ~/Library/Application\ Support/Kitematic
    ```
@y
    ```
    $ rm -fr ~/Library/Application\ Support/Kitematic
    ```
@z

@x
5.  Remove the `docker`, `docker-compose`, and `docker-machine` commands from
    the `/usr/local/bin` folder.  Docker Desktop for Mac and Brew may also have
    installed them; in case of doubt leave them, or reinstall them via Brew, or
    rerun Docker Desktop for Mac (no need to reinstall it).
@y
5.  Remove the `docker`, `docker-compose`, and `docker-machine` commands from
    the `/usr/local/bin` folder.  Docker Desktop for Mac and Brew may also have
    installed them; in case of doubt leave them, or reinstall them via Brew, or
    rerun Docker Desktop for Mac (no need to reinstall it).
@z

@x
    ```
    $ rm -f /usr/local/bin/docker
    $ rm -f /usr/local/bin/docker-compose
    $ rm -f /usr/local/bin/docker-machine
    ```
@y
    ```
    $ rm -f /usr/local/bin/docker
    $ rm -f /usr/local/bin/docker-compose
    $ rm -f /usr/local/bin/docker-machine
    ```
@z

@x
6.  Optionally, remove the `~/.docker/machine` directory.
@y
6.  Optionally, remove the `~/.docker/machine` directory.
@z

@x
    This directory stores some configuration and/or state, such as information
    about created machines and certificates.
@y
    This directory stores some configuration and/or state, such as information
    about created machines and certificates.
@z

@x
7.  Uninstall Oracle VirtualBox, which is installed as a part of the
    Toolbox install.
@y
7.  Uninstall Oracle VirtualBox, which is installed as a part of the
    Toolbox install.
@z

@x
### Uninstall Docker Toolbox on Windows
@y
### Uninstall Docker Toolbox on Windows
@z

@x
To uninstall Toolbox on Windows:
@y
To uninstall Toolbox on Windows:
@z

@x
1.  List your machines.
@y
1.  List your machines.
@z

@x
    ```
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@y
    ```
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@z

@x
2.  Optionally, remove each machine. For example:
@y
2.  Optionally, remove each machine. For example:
@z

@x
    ```
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@y
    ```
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@z

@x
    This step is optional because if you plan to re-install Docker Machine as a
    part of [Docker Desktop for Windows](../docker-for-windows/index.md), you can
    import and continue to manage those machines through Docker.
@y
    This step is optional because if you plan to re-install Docker Machine as a
    part of [Docker Desktop for Windows](../docker-for-windows/index.md), you can
    import and continue to manage those machines through Docker.
@z

@x
3. Uninstall Docker Toolbox using Window's standard process for uninstalling programs through the control panel (programs and features).
@y
3. Uninstall Docker Toolbox using Window's standard process for uninstalling programs through the control panel (programs and features).
@z

@x
    >**Note**: This process does not remove the `docker-install.exe` file. You must delete that file yourself.
@y
    >**Note**: This process does not remove the `docker-install.exe` file. You must delete that file yourself.
@z

@x
4. Optionally, remove the `C:\Users\<your-user>\.docker` directory.
@y
4. Optionally, remove the `C:\Users\<your-user>\.docker` directory.
@z

@x
    If you want to remove Docker entirely, you
    can verify that the uninstall removed
    the `.docker` directory under your user path.
    If it is still there, remove it manually.
    This directory stores some Docker
    program configuration and state, such as
    information about created machines and
    certificates. You usually don't need to remove this directory.
@y
    If you want to remove Docker entirely, you
    can verify that the uninstall removed
    the `.docker` directory under your user path.
    If it is still there, remove it manually.
    This directory stores some Docker
    program configuration and state, such as
    information about created machines and
    certificates. You usually don't need to remove this directory.
@z

@x
5. Uninstall Oracle VirtualBox, which is
  installed as a part of the Toolbox install.
@y
5. Uninstall Oracle VirtualBox, which is
  installed as a part of the Toolbox install.
@z
