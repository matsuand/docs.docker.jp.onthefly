%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Instructions for installing Docker Engine on RHEL
keywords: requirements, apt, installation, rhel, rpm, install, uninstall, upgrade, update, s390x, ibm-z
redirect_from:
- /ee/docker-ee/rhel/
- /engine/installation/linux/docker-ce/rhel/
- /engine/installation/linux/docker-ee/rhel/
- /engine/installation/linux/rhel/
- /engine/installation/rhel/
- /engine/installation/rhel/
- /install/linux/docker-ee/rhel/
- /installation/rhel/
title: Install Docker Engine on RHEL
toc_max: 4
---
@y
---
description: Instructions for installing Docker Engine on RHEL
keywords: requirements, apt, installation, rhel, rpm, install, uninstall, upgrade, update, s390x, ibm-z
redirect_from:
- /ee/docker-ee/rhel/
- /engine/installation/linux/docker-ce/rhel/
- /engine/installation/linux/docker-ee/rhel/
- /engine/installation/linux/rhel/
- /engine/installation/rhel/
- /engine/installation/rhel/
- /install/linux/docker-ee/rhel/
- /installation/rhel/
title: Install Docker Engine on RHEL
toc_max: 4
---
@z

@x
To get started with Docker Engine on RHEL, make sure you
[meet the prerequisites](#prerequisites), then
[install Docker](#installation-methods).
@y
To get started with Docker Engine on RHEL, make sure you
[meet the prerequisites](#prerequisites), then
[install Docker](#installation-methods).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
> **Note**
>
> We currently only provide packages for RHEL on s390x (IBM Z). Other architectures
> are not yet supported for RHEL, but you may be able to install the CentOS packages
> on RHEL. Refer to the [Install Docker Engine on CentOS](centos.md) page for details.
@y
> **Note**
>
> We currently only provide packages for RHEL on s390x (IBM Z). Other architectures
> are not yet supported for RHEL, but you may be able to install the CentOS packages
> on RHEL. Refer to the [Install Docker Engine on CentOS](centos.md) page for details.
@z

@x
### OS requirements
@y
### OS requirements
@z

@x
To install Docker Engine, you need a maintained version of RHEL 7 or 8 on s390x (IBM Z).
Archived versions aren't supported or tested.
@y
To install Docker Engine, you need a maintained version of RHEL 7 or 8 on s390x (IBM Z).
Archived versions aren't supported or tested.
@z

@x
The `overlay2` storage driver is recommended.
@y
The `overlay2` storage driver is recommended.
@z

@x
### Uninstall old versions
@y
### Uninstall old versions
@z

@x
Older versions of Docker were called `docker` or `docker-engine`. If these are
installed, uninstall them, along with associated dependencies. Also uninstall 
`Podman` and the associated dependencies if installed already. 
@y
Older versions of Docker were called `docker` or `docker-engine`. If these are
installed, uninstall them, along with associated dependencies. Also uninstall 
`Podman` and the associated dependencies if installed already. 
@z

@x
```console
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine \
                  podman \
                  runc
```
@y
```console
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine \
                  podman \
                  runc
```
@z

@x
It's OK if `yum` reports that none of these packages are installed.
@y
It's OK if `yum` reports that none of these packages are installed.
@z

@x
The contents of `/var/lib/docker/`, including images, containers, volumes, and
networks, are preserved. The Docker Engine package is now called `docker-ce`.
@y
The contents of `/var/lib/docker/`, including images, containers, volumes, and
networks, are preserved. The Docker Engine package is now called `docker-ce`.
@z

@x
## Installation methods
@y
## Installation methods
@z

@x
You can install Docker Engine in different ways, depending on your needs:
@y
You can install Docker Engine in different ways, depending on your needs:
@z

@x
- Most users
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach.
@y
- Most users
  [set up Docker's repositories](#install-using-the-repository) and install
  from them, for ease of installation and upgrade tasks. This is the
  recommended approach.
@z

@x
- Some users download the RPM package and
  [install it manually](#install-from-a-package) and manage
  upgrades completely manually. This is useful in situations such as installing
  Docker on air-gapped systems with no access to the internet.
@y
- Some users download the RPM package and
  [install it manually](#install-from-a-package) and manage
  upgrades completely manually. This is useful in situations such as installing
  Docker on air-gapped systems with no access to the internet.
@z

@x
- In testing and development environments, some users choose to use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
@y
- In testing and development environments, some users choose to use automated
  [convenience scripts](#install-using-the-convenience-script) to install Docker.
@z

@x
### Install using the repository
@y
### Install using the repository
@z

@x
Before you install Docker Engine for the first time on a new host machine, you need
to set up the Docker repository. Afterward, you can install and update Docker
from the repository.
@y
Before you install Docker Engine for the first time on a new host machine, you need
to set up the Docker repository. Afterward, you can install and update Docker
from the repository.
@z

@x
#### Set up the repository
@y
#### Set up the repository
@z

@x
{% assign download-url-base = "https://download.docker.com/linux/rhel" %}
@y
{% assign download-url-base = "https://download.docker.com/linux/rhel" %}
@z

@x
Install the `yum-utils` package (which provides the `yum-config-manager`
utility) and set up the **stable** repository.
@y
Install the `yum-utils` package (which provides the `yum-config-manager`
utility) and set up the **stable** repository.
@z

@x
```console
$ sudo yum install -y yum-utils
@y
```console
$ sudo yum install -y yum-utils
@z

@x
$ sudo yum-config-manager \
    --add-repo \
    {{ download-url-base }}/docker-ce.repo
```
@y
$ sudo yum-config-manager \
    --add-repo \
    {{ download-url-base }}/docker-ce.repo
```
@z

@x
> **Optional**: Enable the **nightly** or **test** repositories.
>
> These repositories are included in the `docker.repo` file above but are disabled
> by default. You can enable them alongside the stable repository.  The following
> command enables the **nightly** repository.
>
> ```console
> $ sudo yum-config-manager --enable docker-ce-nightly
> ```
>
> To enable the **test** channel, run the following command:
>
> ```console
> $ sudo yum-config-manager --enable docker-ce-test
> ```
>
> You can disable the **nightly** or **test** repository by running the
> `yum-config-manager` command with the `--disable` flag. To re-enable it, use
> the `--enable` flag. The following command disables the **nightly** repository.
>
> ```console
> $ sudo yum-config-manager --disable docker-ce-nightly
> ```
>
> [Learn about **nightly** and **test** channels](index.md).
@y
> **Optional**: Enable the **nightly** or **test** repositories.
>
> These repositories are included in the `docker.repo` file above but are disabled
> by default. You can enable them alongside the stable repository.  The following
> command enables the **nightly** repository.
>
> ```console
> $ sudo yum-config-manager --enable docker-ce-nightly
> ```
>
> To enable the **test** channel, run the following command:
>
> ```console
> $ sudo yum-config-manager --enable docker-ce-test
> ```
>
> You can disable the **nightly** or **test** repository by running the
> `yum-config-manager` command with the `--disable` flag. To re-enable it, use
> the `--enable` flag. The following command disables the **nightly** repository.
>
> ```console
> $ sudo yum-config-manager --disable docker-ce-nightly
> ```
>
> [Learn about **nightly** and **test** channels](index.md).
@z

@x
#### Install Docker Engine
@y
#### Install Docker Engine
@z

@x
1.  Install the _latest version_ of Docker Engine and containerd, or go to the next step to install a specific version:
@y
1.  Install the _latest version_ of Docker Engine and containerd, or go to the next step to install a specific version:
@z

@x
    ```console
    $ sudo yum install docker-ce docker-ce-cli containerd.io
    ```
@y
    ```console
    $ sudo yum install docker-ce docker-ce-cli containerd.io
    ```
@z

@x
    If prompted to accept the GPG key, verify that the fingerprint matches
    `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.
@y
    If prompted to accept the GPG key, verify that the fingerprint matches
    `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.
@z

@x
    > Got multiple Docker repositories?
    >
    > If you have multiple Docker repositories enabled, installing
    > or updating without specifying a version in the `yum install` or
    > `yum update` command always installs the highest possible version,
    > which may not be appropriate for your stability needs.
@y
    > Got multiple Docker repositories?
    >
    > If you have multiple Docker repositories enabled, installing
    > or updating without specifying a version in the `yum install` or
    > `yum update` command always installs the highest possible version,
    > which may not be appropriate for your stability needs.
@z

@x
    This command installs Docker, but it doesn't start Docker. It also creates a
    `docker` group, however, it doesn't add any users to the group by default.
@y
    This command installs Docker, but it doesn't start Docker. It also creates a
    `docker` group, however, it doesn't add any users to the group by default.
@z

@x
2.  To install a _specific version_ of Docker Engine, list the available versions
    in the repo, then select and install:
@y
2.  To install a _specific version_ of Docker Engine, list the available versions
    in the repo, then select and install:
@z

@x
    a. List and sort the versions available in your repo. This example sorts
       results by version number, highest to lowest, and is truncated:
@y
    a. List and sort the versions available in your repo. This example sorts
       results by version number, highest to lowest, and is truncated:
@z

@x
    ```console
    $ yum list docker-ce --showduplicates | sort -r
@y
    ```console
    $ yum list docker-ce --showduplicates | sort -r
@z

@x
    docker-ce.s390x                3:20.10.7-3.el8                 docker-ce-stable
    ```
@y
    docker-ce.s390x                3:20.10.7-3.el8                 docker-ce-stable
    ```
@z

@x
    The list returned depends on which repositories are enabled, and is specific
    to your version of RHEL (indicated by the `.el8` suffix in this example).
@y
    The list returned depends on which repositories are enabled, and is specific
    to your version of RHEL (indicated by the `.el8` suffix in this example).
@z

@x
    b. Install a specific version by its fully qualified package name, which is
       the package name (`docker-ce`) plus the version string (2nd column)
       starting at the first colon (`:`), up to the first hyphen, separated by
       a hyphen (`-`). For example, `docker-ce-20.10.7`.
@y
    b. Install a specific version by its fully qualified package name, which is
       the package name (`docker-ce`) plus the version string (2nd column)
       starting at the first colon (`:`), up to the first hyphen, separated by
       a hyphen (`-`). For example, `docker-ce-20.10.7`.
@z

@x
    ```console
    $ sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
    ```
@y
    ```console
    $ sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
    ```
@z

@x
    This command installs Docker, but it doesn't start Docker. It also creates a
    `docker` group, however, it doesn't add any users to the group by default.
@y
    This command installs Docker, but it doesn't start Docker. It also creates a
    `docker` group, however, it doesn't add any users to the group by default.
@z

@x
3.  Start Docker.
@y
3.  Start Docker.
@z

@x
    ```console
    $ sudo systemctl start docker
    ```
@y
    ```console
    $ sudo systemctl start docker
    ```
@z

@x
4.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
4.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@z

@x
    ```console
    $ sudo docker run hello-world
    ```
@y
    ```console
    $ sudo docker run hello-world
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@y
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@z

@x
This installs and runs Docker Engine. Use `sudo` to run Docker
commands. Continue to [Linux postinstall](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@y
This installs and runs Docker Engine. Use `sudo` to run Docker
commands. Continue to [Linux postinstall](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@z

@x
#### Upgrade Docker Engine
@y
#### Upgrade Docker Engine
@z

@x
To upgrade Docker Engine, follow the [installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@y
To upgrade Docker Engine, follow the [installation instructions](#install-using-the-repository),
choosing the new version you want to install.
@z

@x
### Install from a package
@y
### Install from a package
@z

@x
If you cannot use Docker's repository to install Docker, you can download the
`.rpm` file for your release and install it manually. You need to download
a new file each time you want to upgrade Docker Engine.
@y
If you cannot use Docker's repository to install Docker, you can download the
`.rpm` file for your release and install it manually. You need to download
a new file each time you want to upgrade Docker Engine.
@z

@x
1.  Go to [{{ download-url-base }}/]({{ download-url-base }}/){: target="_blank" rel="noopener" class="_" }
    and choose your version of RHEL. Then browse to `s390x/stable/Packages/`
    and download the `.rpm` file for the Docker version you want to install.
@y
1.  Go to [{{ download-url-base }}/]({{ download-url-base }}/){: target="_blank" rel="noopener" class="_" }
    and choose your version of RHEL. Then browse to `s390x/stable/Packages/`
    and download the `.rpm` file for the Docker version you want to install.
@z

@x
    > **Note**
    >
    > To install a **nightly** or **test** (pre-release) package,
    > change the word `stable` in the above URL to `nightly` or `test`.
    > [Learn about **nightly** and **test** channels](index.md).
@y
    > **Note**
    >
    > To install a **nightly** or **test** (pre-release) package,
    > change the word `stable` in the above URL to `nightly` or `test`.
    > [Learn about **nightly** and **test** channels](index.md).
@z

@x
2.  Install Docker Engine, changing the path below to the path where you downloaded
    the Docker package.
@y
2.  Install Docker Engine, changing the path below to the path where you downloaded
    the Docker package.
@z

@x
    ```console
    $ sudo yum install /path/to/package.rpm
    ```
@y
    ```console
    $ sudo yum install /path/to/package.rpm
    ```
@z

@x
    Docker is installed but not started. The `docker` group is created, but no
    users are added to the group.
@y
    Docker is installed but not started. The `docker` group is created, but no
    users are added to the group.
@z

@x
3.  Start Docker.
@y
3.  Start Docker.
@z

@x
    ```console
    $ sudo systemctl start docker
    ```
@y
    ```console
    $ sudo systemctl start docker
    ```
@z

@x
4.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@y
4.  Verify that Docker Engine is installed correctly by running the `hello-world`
    image.
@z

@x
    ```console
    $ sudo docker run hello-world
    ```
@y
    ```console
    $ sudo docker run hello-world
    ```
@z

@x
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@y
    This command downloads a test image and runs it in a container. When the
    container runs, it prints a message and exits.
@z

@x
This installs and runs Docker Engine. Use `sudo` to run Docker commands.
Continue to [Post-installation steps for Linux](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@y
This installs and runs Docker Engine. Use `sudo` to run Docker commands.
Continue to [Post-installation steps for Linux](linux-postinstall.md) to allow
non-privileged users to run Docker commands and for other optional configuration
steps.
@z

@x
#### Upgrade Docker Engine
@y
#### Upgrade Docker Engine
@z

@x
To upgrade Docker Engine, download the newer package file and repeat the
[installation procedure](#install-from-a-package), using `yum -y upgrade`
instead of `yum -y install`, and point to the new file.
@y
To upgrade Docker Engine, download the newer package file and repeat the
[installation procedure](#install-from-a-package), using `yum -y upgrade`
instead of `yum -y install`, and point to the new file.
@z

@x
{% include install-script.md %}
@y
{% include install-script.md %}
@z

@x
## Uninstall Docker Engine
@y
## Uninstall Docker Engine
@z

@x
1.  Uninstall the Docker Engine, CLI, and Containerd packages:
@y
1.  Uninstall the Docker Engine, CLI, and Containerd packages:
@z

@x
    ```console
    $ sudo yum remove docker-ce docker-ce-cli containerd.io
    ```
@y
    ```console
    $ sudo yum remove docker-ce docker-ce-cli containerd.io
    ```
@z

@x
2.  Images, containers, volumes, or customized configuration files on your host
    are not automatically removed. To delete all images, containers, and
    volumes:
@y
2.  Images, containers, volumes, or customized configuration files on your host
    are not automatically removed. To delete all images, containers, and
    volumes:
@z

@x
    ```console
    $ sudo rm -rf /var/lib/docker
    $ sudo rm -rf /var/lib/containerd
    ```
@y
    ```console
    $ sudo rm -rf /var/lib/docker
    $ sudo rm -rf /var/lib/containerd
    ```
@z

@x
You must delete any edited configuration files manually.
@y
You must delete any edited configuration files manually.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@y
- Continue to [Post-installation steps for Linux](linux-postinstall.md).
- Review the topics in [Develop with Docker](../../develop/index.md) to learn how to build new applications using Docker.
@z
