%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
advisory: toolbox
description: How to install Toolbox on Mac
keywords: docker, documentation, install, toolbox, mac
title: Install Docker Toolbox on macOS
---
@y
---
advisory: toolbox
description: How to install Toolbox on Mac
keywords: docker, documentation, install, toolbox, mac
title: Install Docker Toolbox on macOS
---
@z

@x
Docker Toolbox provides a way to use Docker on older Macs
that do not meet
minimal system requirements for [Docker Desktop for Mac](../docker-for-mac/index.md).
@y
Docker Toolbox provides a way to use Docker on older Macs
that do not meet
minimal system requirements for [Docker Desktop for Mac](../docker-for-mac/index.md).
@z

@x
## What you get and how it works
@y
## What you get and how it works
@z

@x
Docker Toolbox includes the following Docker tools:
@y
Docker Toolbox includes the following Docker tools:
@z

@x
* Docker CLI client for running Docker Engine to create images and containers
* Docker Machine so you can run Docker Engine commands from macOS terminals
* Docker Compose for running the `docker-compose` command
* Kitematic, the Docker GUI
* the Docker QuickStart shell preconfigured for a Docker command-line environment
* Oracle VM VirtualBox
@y
* Docker CLI client for running Docker Engine to create images and containers
* Docker Machine so you can run Docker Engine commands from macOS terminals
* Docker Compose for running the `docker-compose` command
* Kitematic, the Docker GUI
* the Docker QuickStart shell preconfigured for a Docker command-line environment
* Oracle VM VirtualBox
@z

@x
Because the Docker Engine daemon uses Linux-specific
kernel features, you can't run Docker Engine natively on
macOS with Docker Toolbox. Instead, you must use the
Docker Machine command, `docker-machine`, to create and
attach to a small Linux VM on your machine. This VM hosts
Docker Engine for you on your Mac.
@y
Because the Docker Engine daemon uses Linux-specific
kernel features, you can't run Docker Engine natively on
macOS with Docker Toolbox. Instead, you must use the
Docker Machine command, `docker-machine`, to create and
attach to a small Linux VM on your machine. This VM hosts
Docker Engine for you on your Mac.
@z

@x
>**Tip**: One of the advantages of the newer
[Docker Desktop for Mac](../docker-for-mac/index.md) solution is that
it uses native virtualization and does not require
VirtualBox to run Docker.
@y
>**Tip**: One of the advantages of the newer
[Docker Desktop for Mac](../docker-for-mac/index.md) solution is that
it uses native virtualization and does not require
VirtualBox to run Docker.
@z

@x
## Step 1: Check your version
@y
## Step 1: Check your version
@z

@x
Your Mac must be running macOS 10.8 "Mountain Lion" or newer to run Docker
software. To find out what version of the OS you have:
@y
Your Mac must be running macOS 10.8 "Mountain Lion" or newer to run Docker
software. To find out what version of the OS you have:
@z

@x
1. Choose **About this Mac** from the Apple menu.
@y
1. Choose **About this Mac** from the Apple menu.
@z

@x
    The version number appears directly below the words `macOS`.
@y
    The version number appears directly below the words `macOS`.
@z

@x
2. If you have the correct version, go to the next step.
@y
2. If you have the correct version, go to the next step.
@z

@x
    If you aren't using a supported version, you could consider upgrading your
    operating system.
@y
    If you aren't using a supported version, you could consider upgrading your
    operating system.
@z

@x
    If you have macOS 10.14 Mojave or newer, consider using [Docker Desktop for
    Mac](/docker-for-mac/) instead. It runs natively on the Mac, so there is no
    need for a pre-configured Docker QuickStart shell. It uses the native macOS
    Hypervisor framework for virtualization, instead of Oracle VirutalBox. Full
    install prerequisites are provided in the Docker Desktop for Mac topic in [Docker
    Desktop for Mac](/docker-for-mac/#what-to-know-before-you-install).
@y
    If you have macOS 10.14 Mojave or newer, consider using [Docker Desktop for
    Mac](/docker-for-mac/) instead. It runs natively on the Mac, so there is no
    need for a pre-configured Docker QuickStart shell. It uses the native macOS
    Hypervisor framework for virtualization, instead of Oracle VirutalBox. Full
    install prerequisites are provided in the Docker Desktop for Mac topic in [Docker
    Desktop for Mac](/docker-for-mac/#what-to-know-before-you-install).
@z

@x
## Step 2: Install Docker Toolbox
@y
## Step 2: Install Docker Toolbox
@z

@x
> **Note**: Docker are no longer maintaining the download.docker.com url for
> Docker Toolbox, therefore an unsigned warning (verified publisher dialog) is
> displayed during the installation process. 
@y
> **Note**: Docker are no longer maintaining the download.docker.com url for
> Docker Toolbox, therefore an unsigned warning (verified publisher dialog) is
> displayed during the installation process. 
@z

@x
1. To download the latest version of Docker Toolbox, go to [Toolbox
   Releases](https://github.com/docker/toolbox/releases) and download the
   latest `.pkg` file.
@y
1. To download the latest version of Docker Toolbox, go to [Toolbox
   Releases](https://github.com/docker/toolbox/releases) and download the
   latest `.pkg` file.
@z

@x
2. Install Docker Toolbox by double-clicking the package or by right-clicking
and choosing "Open" from the pop-up menu.
@y
2. Install Docker Toolbox by double-clicking the package or by right-clicking
and choosing "Open" from the pop-up menu.
@z

@x
    The installer launches an introductory dialog, followed by an overview of what's installed.
@y
    The installer launches an introductory dialog, followed by an overview of what's installed.
@z

@x
    ![Install Docker Toolbox](images/mac-welcome-page.png)
@y
    ![Install Docker Toolbox](images/mac-welcome-page.png)
@z

@x
3. Press **Continue** to install the toolbox.
@y
3. Press **Continue** to install the toolbox.
@z

@x
    The installer presents you with options to customize the standard
    installation.
@y
    The installer presents you with options to customize the standard
    installation.
@z

@x
    ![Standard install](images/mac-page-two.png)
@y
    ![Standard install](images/mac-page-two.png)
@z

@x
    By default, the standard Docker Toolbox installation:
@y
    By default, the standard Docker Toolbox installation:
@z

@x
    * installs binaries for the Docker tools in `/usr/local/bin`
    * makes these binaries available to all users
    * updates any existing Virtual Box installation
@y
    * installs binaries for the Docker tools in `/usr/local/bin`
    * makes these binaries available to all users
    * updates any existing Virtual Box installation
@z

@x
    For now, don't change any of the defaults.
@y
    For now, don't change any of the defaults.
@z

@x
4. Press **Install** to perform the standard installation.
@y
4. Press **Install** to perform the standard installation.
@z

@x
     The system prompts you for your password.
@y
     The system prompts you for your password.
@z

@x
     ![Password prompt](images/mac-password-prompt.png)
@y
     ![Password prompt](images/mac-password-prompt.png)
@z

@x
5. Provide your password to continue with the installation.
@y
5. Provide your password to continue with the installation.
@z

@x
     When it completes, the installer provides you with some
     shortcuts. You can ignore this for now and click **Continue**.
@y
     When it completes, the installer provides you with some
     shortcuts. You can ignore this for now and click **Continue**.
@z

@x
     ![Quickstart](images/mac-page-quickstart.png)
@y
     ![Quickstart](images/mac-page-quickstart.png)
@z

@x
     Then click **Close** to finish the installer.
@y
     Then click **Close** to finish the installer.
@z

@x
     ![All finished](images/mac-page-finished.png)
@y
     ![All finished](images/mac-page-finished.png)
@z

@x
## Step 3: Verify your installation
@y
## Step 3: Verify your installation
@z

@x
To run a Docker container, you:
@y
To run a Docker container, you:
@z

@x
* create a new (or start an existing) Docker Engine host running
* switch your environment to your new VM
* use the `docker` client to create, load, and manage containers
@y
* create a new (or start an existing) Docker Engine host running
* switch your environment to your new VM
* use the `docker` client to create, load, and manage containers
@z

@x
Once you create a machine, you can reuse it as often as you like. Like any
Virtual Box VM, it maintains its configuration between uses.
@y
Once you create a machine, you can reuse it as often as you like. Like any
Virtual Box VM, it maintains its configuration between uses.
@z

@x
1. Open the **Launchpad** and locate the Docker Quickstart Terminal icon.
@y
1. Open the **Launchpad** and locate the Docker Quickstart Terminal icon.
@z

@x
    ![Launchpad](images/applications_folder.png)
@y
    ![Launchpad](images/applications_folder.png)
@z

@x
2. Click the icon to launch a Docker Quickstart Terminal window.
@y
2. Click the icon to launch a Docker Quickstart Terminal window.
@z

@x
    The terminal does a number of things to set up Docker Quickstart Terminal for you.
@y
    The terminal does a number of things to set up Docker Quickstart Terminal for you.
@z

@x
    ```
    Last login: Sat Jul 11 20:09:45 on ttys002
    bash '/Applications/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
    Get http:///var/run/docker.sock/v1.19/images/json?all=1&filters=%7B%22dangling%22%3A%5B%22true%22%5D%7D: dial unix /var/run/docker.sock: no such file or directory. Are you trying to connect to a TLS-enabled daemon without TLS?
    Get http:///var/run/docker.sock/v1.19/images/json?all=1: dial unix /var/run/docker.sock: no such file or directory. Are you trying to connect to a TLS-enabled daemon without TLS?
    -bash: lolcat: command not found
@y
    ```
    Last login: Sat Jul 11 20:09:45 on ttys002
    bash '/Applications/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
    Get http:///var/run/docker.sock/v1.19/images/json?all=1&filters=%7B%22dangling%22%3A%5B%22true%22%5D%7D: dial unix /var/run/docker.sock: no such file or directory. Are you trying to connect to a TLS-enabled daemon without TLS?
    Get http:///var/run/docker.sock/v1.19/images/json?all=1: dial unix /var/run/docker.sock: no such file or directory. Are you trying to connect to a TLS-enabled daemon without TLS?
    -bash: lolcat: command not found
@z

@x
    mary at meepers in ~
    $ bash '/Applications/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
    Creating Machine dev...
    Creating VirtualBox VM...
    Creating SSH key...
    Starting VirtualBox VM...
    Starting VM...
    To see how to connect Docker to this machine, run: docker-machine env dev
    Starting machine dev...
    Setting environment variables for machine dev...
@y
    mary at meepers in ~
    $ bash '/Applications/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
    Creating Machine dev...
    Creating VirtualBox VM...
    Creating SSH key...
    Starting VirtualBox VM...
    Starting VM...
    To see how to connect Docker to this machine, run: docker-machine env dev
    Starting machine dev...
    Setting environment variables for machine dev...
@z

@x
                            ##         .
                      ## ## ##        ==
                   ## ## ## ## ##    ===
               /"""""""""""""""""\___/ ===
          ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
               \______ o           __/
                 \    \         __/
                  \____\_______/
@y
                            ##         .
                      ## ## ##        ==
                   ## ## ## ## ##    ===
               /"""""""""""""""""\___/ ===
          ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
               \______ o           __/
                 \    \         __/
                  \____\_______/
@z

@x
    The Docker Quick Start Terminal is configured to use Docker with the "default" VM.
    ```
@y
    The Docker Quick Start Terminal is configured to use Docker with the "default" VM.
    ```
@z

@x
3.  Click your mouse in the terminal window to make it active.
@y
3.  Click your mouse in the terminal window to make it active.
@z

@x
    If you aren't familiar with a terminal window, here are some quick tips.
@y
    If you aren't familiar with a terminal window, here are some quick tips.
@z

@x
    ![Terminal](images/terminal.png)
@y
    ![Terminal](images/terminal.png)
@z

@x
    The prompt is traditionally a `$` dollar sign. You type commands into the
    *command line* which is the area after the prompt. Your cursor is indicated
    by a highlighted area or a `|` that appears in the command line. After
    typing a command, always press RETURN.
@y
    The prompt is traditionally a `$` dollar sign. You type commands into the
    *command line* which is the area after the prompt. Your cursor is indicated
    by a highlighted area or a `|` that appears in the command line. After
    typing a command, always press RETURN.
@z

@x
4. Type the `docker run hello-world` command and press RETURN.
@y
4. Type the `docker run hello-world` command and press RETURN.
@z

@x
    The command does some work for you, if everything runs well, the command's
    output looks like this:
@y
    The command does some work for you, if everything runs well, the command's
    output looks like this:
@z

@x
        $ docker run hello-world
        Unable to find image 'hello-world:latest' locally
        latest: Pulling from library/hello-world
        535020c3e8ad: Pull complete
        af340544ed62: Pull complete
        Digest: sha256:a68868bfe696c00866942e8f5ca39e3e31b79c1e50feaee4ce5e28df2f051d5c
        Status: Downloaded newer image for hello-world:latest
@y
        $ docker run hello-world
        Unable to find image 'hello-world:latest' locally
        latest: Pulling from library/hello-world
        535020c3e8ad: Pull complete
        af340544ed62: Pull complete
        Digest: sha256:a68868bfe696c00866942e8f5ca39e3e31b79c1e50feaee4ce5e28df2f051d5c
        Status: Downloaded newer image for hello-world:latest
@z

@x
        Hello from Docker.
        This message shows that your installation appears to be working correctly.
@y
        Hello from Docker.
        This message shows that your installation appears to be working correctly.
@z

@x
        To generate this message, Docker took the following steps:
        1. The Docker Engine CLI client contacted the Docker Engine daemon.
        2. The Docker Engine daemon pulled the "hello-world" image from the Docker Hub.
        3. The Docker Engine daemon created a new container from that image which runs the
           executable that produces the output you are currently reading.
        4. The Docker Engine daemon streamed that output to the Docker Engine CLI client, which sent it
           to your terminal.
@y
        To generate this message, Docker took the following steps:
        1. The Docker Engine CLI client contacted the Docker Engine daemon.
        2. The Docker Engine daemon pulled the "hello-world" image from the Docker Hub.
        3. The Docker Engine daemon created a new container from that image which runs the
           executable that produces the output you are currently reading.
        4. The Docker Engine daemon streamed that output to the Docker Engine CLI client, which sent it
           to your terminal.
@z

@x
        To try something more ambitious, you can run an Ubuntu container with:
        $ docker run -it ubuntu bash
@y
        To try something more ambitious, you can run an Ubuntu container with:
        $ docker run -it ubuntu bash
@z

@x
        Share images, automate workflows, and more with a free Docker Hub account:
        https://hub.docker.com
@y
        Share images, automate workflows, and more with a free Docker Hub account:
        https://hub.docker.com
@z

@x
        For more examples and ideas, visit:
        https://docs.docker.com/userguide/
@y
        For more examples and ideas, visit:
        https://docs.docker.com/userguide/
@z

@x
## Optional: Add shared directories
@y
## Optional: Add shared directories
@z

@x
By default, Toolbox only has access to the `/Users` directory and mounts it into
the VMs at `/Users`. If your project lives elsewhere or needs access to other
directories on the host filesystem, you can add them.
@y
By default, Toolbox only has access to the `/Users` directory and mounts it into
the VMs at `/Users`. If your project lives elsewhere or needs access to other
directories on the host filesystem, you can add them.
@z

@x
### Use the VirtualBox GUI
@y
### Use the VirtualBox GUI
@z

@x
You can configure shared folders in the VirtualBox UI.
@y
You can configure shared folders in the VirtualBox UI.
@z

@x
1.  Open the VirtualBox UI.
@y
1.  Open the VirtualBox UI.
@z

@x
2.  Click the **Settings** gear, then go to **Shared Folders**.
@y
2.  Click the **Settings** gear, then go to **Shared Folders**.
@z

@x
3.  Select any existing listing under **Machine Folders**, then
    click the **+** icon.
@y
3.  Select any existing listing under **Machine Folders**, then
    click the **+** icon.
@z

@x
    * Choose the **Folder Path** on the host, enter the **Folder Name**
      for within the VM (or take the default, which is the same name
      as on the host), and configure any additional options you need.
@y
    * Choose the **Folder Path** on the host, enter the **Folder Name**
      for within the VM (or take the default, which is the same name
      as on the host), and configure any additional options you need.
@z

@x
    * Choose **Auto-mount** if you want the folder to automatically
      be mounted into the VM, and choose **Make Permanent** for it
      to be considered a permanently shared folder.
@y
    * Choose **Auto-mount** if you want the folder to automatically
      be mounted into the VM, and choose **Make Permanent** for it
      to be considered a permanently shared folder.
@z

@x
4.  Click **OK** to add the new folder to the Shared Folders list.
@y
4.  Click **OK** to add the new folder to the Shared Folders list.
@z

@x
5.  Click **OK** again to save your changes and exit the Settings dialog.
@y
5.  Click **OK** again to save your changes and exit the Settings dialog.
@z

@x
### Use the command line
@y
### Use the command line
@z

@x
You can configure shared folders using a command like the following:
@y
You can configure shared folders using a command like the following:
@z

@x
```bash
$ mount -t vboxsf -o uid=1000,gid=50 your-other-share-name /some/mount/location
```
@y
```bash
$ mount -t vboxsf -o uid=1000,gid=50 your-other-share-name /some/mount/location
```
@z

@x
This command mounts `/some/mount/location` into the VM at `/your-other-share-hame`,
owned by UID 1000 and GID 50.
@y
This command mounts `/some/mount/location` into the VM at `/your-other-share-hame`,
owned by UID 1000 and GID 50.
@z

@x
> **Note**: The autommount and permanent mount options are not supported using
> the command line.
@y
> **Note**: The autommount and permanent mount options are not supported using
> the command line.
@z

@x
## How to uninstall Toolbox
@y
## How to uninstall Toolbox
@z

@x
Removing Toolbox involves removing all the Docker components it includes.
@y
Removing Toolbox involves removing all the Docker components it includes.
@z

@x
A full uninstall also includes removing the local and remote machines
you created with Docker Machine. In some cases, you might want to keep
machines created with Docker Machine.
@y
A full uninstall also includes removing the local and remote machines
you created with Docker Machine. In some cases, you might want to keep
machines created with Docker Machine.
@z

@x
For example, if you plan to re-install Docker Machine as a part of
Docker Desktop for Mac you can continue to manage those machines through
Docker. Or, if you have remote machines on a cloud provider and you
plan to manage them using the provider, you wouldn't want to remove
them. So the step to remove machines is described here as optional.
@y
For example, if you plan to re-install Docker Machine as a part of
Docker Desktop for Mac you can continue to manage those machines through
Docker. Or, if you have remote machines on a cloud provider and you
plan to manage them using the provider, you wouldn't want to remove
them. So the step to remove machines is described here as optional.
@z

@x
To uninstall Toolbox on a Mac, do the following:
@y
To uninstall Toolbox on a Mac, do the following:
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
## Next steps
@y
## Next steps
@z

@x
* Try the [Get started](../get-started/index.md) tutorial.
@y
* Try the [Get started](../get-started/index.md) tutorial.
@z

@x
* Dig in deeper with [more tutorials and examples](../engine/tutorials/index.md) on building images, running containers, networking, managing data, and storing images on Docker Hub.
@y
* Dig in deeper with [more tutorials and examples](../engine/tutorials/index.md) on building images, running containers, networking, managing data, and storing images on Docker Hub.
@z

@x
* [Learn about Kitematic](../kitematic/userguide.md)
@y
* [Learn about Kitematic](../kitematic/userguide.md)
@z

@x
* [Learn about Docker Machine](../machine/overview.md)
@y
* [Learn about Docker Machine](../machine/overview.md)
@z

@x
* [Learn about Docker Compose](../compose/index.md)
@y
* [Learn about Docker Compose](../compose/index.md)
@z
