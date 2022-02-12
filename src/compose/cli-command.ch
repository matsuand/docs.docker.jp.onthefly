%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Compose
keywords: compose, V2
title: Compose V2
---
@y
---
description: Docker Compose
keywords: compose, V2
title: Compose V2
---
@z

@x
## Compose V2 and the new `docker compose` command
@y
{: #compose-v2-and-the-new-docker-compose-command }
## Compose V2 と新たな`docker compose`コマンド
@z

@x
> Important
>
> The new Compose V2, which supports the `compose` command as part of the Docker CLI, is now available.
>
> Compose V2 integrates compose functions into the Docker platform, continuing to support most of the previous `docker-compose` features and flags. You can test the Compose V2 by simply replacing the dash (`-`) with a space, and by running `docker compose`, instead of `docker-compose`.
{: .important}
@y
> 重要
>
> Docker CLI の一部として`compose`コマンドをサポートした、新たな Compose V2 が利用できるようになりました。
>
> Compose V2 は Docker プラットフォーム内に compose 機能を統合するものです。
> これまでの`docker-compose`機能やフラグのほとんどを受け継いでいます。
> Compose V2 の確認は、単にダッシュ (`-`) を空白に変えるだけであって、`docker-compose`ではなく`docker compose`を実行することで行うことができます。
{: .important}
@z

@x
Starting with Docker Desktop 3.4.0, you can run Compose V2 commands without modifying your invocations, by enabling the drop-in replacement of the previous `docker-compose` with the new command.  See the section [Installing Compose V2](#installing-compose-v2) for detailed instructions how to enable the drop-in replacement.
@y
Starting with Docker Desktop 3.4.0, you can run Compose V2 commands without modifying your invocations, by enabling the drop-in replacement of the previous `docker-compose` with the new command.  See the section [Installing Compose V2](#installing-compose-v2) for detailed instructions how to enable the drop-in replacement.
@z

@x
## Context of Docker Compose evolution
@y
{: #context-of-docker-compose-evolution }
## Context of Docker Compose evolution
@z

@x
Introduction of the [Compose specification](https://github.com/compose-spec/compose-spec){:target="_blank" rel="noopener" class="_"} makes a clean distinction between the Compose YAML file model and the `docker-compose` implementation. Making this change has enabled a number of enhancements, including adding the `compose` command directly into the Docker CLI,  being able to “up” a Compose application on cloud platforms by simply switching the Docker context, and launching of [Amazon ECS](/cloud/ecs-integration) and [Microsoft ACI](/cloud/aci-integration). As the Compose specification evolves, new features land faster in the Docker CLI.
@y
Introduction of the [Compose specification](https://github.com/compose-spec/compose-spec){:target="_blank" rel="noopener" class="_"} makes a clean distinction between the Compose YAML file model and the `docker-compose` implementation. Making this change has enabled a number of enhancements, including adding the `compose` command directly into the Docker CLI,  being able to “up” a Compose application on cloud platforms by simply switching the Docker context, and launching of [Amazon ECS](/cloud/ecs-integration) and [Microsoft ACI](/cloud/aci-integration). As the Compose specification evolves, new features land faster in the Docker CLI.
@z

@x
While `docker-compose` is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. This allows us to include community proposals, experimental implementations by the Docker CLI and/or Engine, and deliver features faster to users. Compose V2 also  supports some of the newer additions to the Compose specification, such as [profiles](profiles.md) and [GPU](gpu-support.md) devices.
@y
While `docker-compose` is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. This allows us to include community proposals, experimental implementations by the Docker CLI and/or Engine, and deliver features faster to users. Compose V2 also  supports some of the newer additions to the Compose specification, such as [profiles](profiles.md) and [GPU](gpu-support.md) devices.
@z

@x
Additionally, Compose V2 also supports [Apple silicon](../desktop/mac/apple-silicon.md).
@y
Additionally, Compose V2 also supports [Apple silicon](../desktop/mac/apple-silicon.md).
@z

@x
For more information about the flags that are supported in the new compose command, see the [docker-compose compatibility list](cli-command-compatibility.md).
@y
For more information about the flags that are supported in the new compose command, see the [docker-compose compatibility list](cli-command-compatibility.md).
@z

@x
## Transitioning to GA for Compose V2
@y
## Transitioning to GA for Compose V2
@z

@x
We are currently working towards providing a standard way to install Compose V2 on Linux. When this is available, Compose V2 will be marked as Generally Available (GA).
@y
We are currently working towards providing a standard way to install Compose V2 on Linux. When this is available, Compose V2 will be marked as Generally Available (GA).
@z

@x
**Compose V2 GA** means:
@y
**Compose V2 GA** means:
@z

@x
- New features and bug fixes will only be considered in the Compose V2 code base.
- Docker Compose V2 will be the default setting in Docker Desktop for Mac and Windows. You can still opt out through the Docker Desktop UI and the CLI. This means, when you run `docker-compose`, you will actually be running`docker compose`.
- Compose V2 will be included with the latest version of the Docker CLI. You can use [Compose Switch](#compose-switch) to redirect `docker-compose` to `docker compose`.
- [Compose V2 branch](https://github.com/docker/compose/tree/v2) will become the default branch.
- Docker Compose V1 will be maintained to address any security issues.
@y
- New features and bug fixes will only be considered in the Compose V2 code base.
- Docker Compose V2 will be the default setting in Docker Desktop for Mac and Windows. You can still opt out through the Docker Desktop UI and the CLI. This means, when you run `docker-compose`, you will actually be running`docker compose`.
- Compose V2 will be included with the latest version of the Docker CLI. You can use [Compose Switch](#compose-switch) to redirect `docker-compose` to `docker compose`.
- [Compose V2 branch](https://github.com/docker/compose/tree/v2) will become the default branch.
- Docker Compose V1 will be maintained to address any security issues.
@z

@x
> **Important**
>
> We would like to make the Compose V2 transition to be as smooth as possible for all users. We currently don't have a concrete timeline to deprecate Compose V1. We will review the feedback from the community on the GA and the adoption on Linux, and come up with a plan to deprecate Compose V1. We are not planning to remove the aliasing of `docker-compose` to `docker compose`. We would like to make it easier for users to switch to V2 without breaking any existing scripts. We will follow up with a blog post with more information on the exact timeline on V1 deprecation and the end of support policies for security issues.
>
> Your feedback is important to us. Reach out to us and let us know your feedback on our [Public Roadmap](https://github.com/docker/roadmap/issues/257){:target="_blank" rel="noopener" class="_"}.
{: .important}
@y
> **Important**
>
> We would like to make the Compose V2 transition to be as smooth as possible for all users. We currently don't have a concrete timeline to deprecate Compose V1. We will review the feedback from the community on the GA and the adoption on Linux, and come up with a plan to deprecate Compose V1. We are not planning to remove the aliasing of `docker-compose` to `docker compose`. We would like to make it easier for users to switch to V2 without breaking any existing scripts. We will follow up with a blog post with more information on the exact timeline on V1 deprecation and the end of support policies for security issues.
>
> Your feedback is important to us. Reach out to us and let us know your feedback on our [Public Roadmap](https://github.com/docker/roadmap/issues/257){:target="_blank" rel="noopener" class="_"}.
{: .important}
@z

@x
## Installing Compose V2
@y
## Installing Compose V2
@z

@x
This section contains instructions on how to install Compose V2.
@y
This section contains instructions on how to install Compose V2.
@z

@x
### Install on Mac and Windows
@y
### Install on Mac and Windows
@z

%@x
%**Docker Desktop for Mac and for Windows** version 3.2.1 and above includes the new Compose command along with the Docker CLI. Therefore, Windows and Mac users do not need to install the Compose CLI Tech Preview separately.
%@y
%**Docker Desktop for Mac および for Windows** のバージョン 3.2.1 またはそれ以降には、Docker CLI に新たな compose コマンドが含まれます。
%したがって Windows と Mac のユーザーは、個別にインストールする必要はありません。
%@z

@x
Docker Desktop for Mac and for Windows version 3.2.1 and above includes the new Compose command along with the Docker CLI. Therefore, Windows and Mac users do not need to install Compose V2 separately.
@y
Docker Desktop for Mac and for Windows version 3.2.1 and above includes the new Compose command along with the Docker CLI. Therefore, Windows and Mac users do not need to install Compose V2 separately.
@z

@x
We will progressively turn Docker Compose V2 on automatically for Docker Desktop users, so that users can seamlessly move to Docker Compose V2 without the need to change any of their scripts. If you run into any problems with Compose V2, you can simply switch back to Compose v1, either in Docker Desktop, or in the CLI.
@y
We will progressively turn Docker Compose V2 on automatically for Docker Desktop users, so that users can seamlessly move to Docker Compose V2 without the need to change any of their scripts. If you run into any problems with Compose V2, you can simply switch back to Compose v1, either in Docker Desktop, or in the CLI.
@z

@x
For Docker Desktop installation instructions, see:
@y
Docker Desktop のインストール手順は以下を参照してください。
@z

@x
- [Install Docker Desktop on Mac](../desktop/mac/install.md)
- [Install Docker Desktop on Windows](../desktop/windows/install.md)
@y
- [Docker Desktop の Mac へのンストール](../desktop/mac/install.md)
- [Docker Desktop の Windows へのンストール](../desktop/windows/install.md)
@z

@x
To disable Docker Compose V2 using Docker Desktop:
@y
To disable Docker Compose V2 using Docker Desktop:
@z

@x
1. From the Docker menu, click **Preferences** (**Settings** on Windows) > **General**.
2. Clear the **Use Docker Compose V2** check box.
@y
1. From the Docker menu, click **Preferences** (**Settings** on Windows) > **General**.
2. Clear the **Use Docker Compose V2** check box.
@z

@x
To disable Docker Compose V2 using the CLI, run:
@y
To disable Docker Compose V2 using the CLI, run:
@z

@x
```console
$ docker-compose disable-v2
```
@y
```console
$ docker-compose disable-v2
```
@z

@x
### Install on Linux
@y
### Install on Linux
@z

@x
You can install Compose V2 by downloading the appropriate binary for your system
from the [project release page](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"} and copying it into `$HOME/.docker/cli-plugins` as `docker-compose`.
@y
You can install Compose V2 by downloading the appropriate binary for your system
from the [project release page](https://github.com/docker/compose/releases){:target="_blank" rel="noopener" class="_"} and copying it into `$HOME/.docker/cli-plugins` as `docker-compose`.
@z

@x
1. Run the following command to download the current stable release of Docker Compose:
@y
1. Run the following command to download the current stable release of Docker Compose:
@z

@x
    ```console
    $ mkdir -p ~/.docker/cli-plugins/
    $ curl -SL https://github.com/docker/compose/releases/download/v{{site.compose_v2_version}}/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
    ```
@y
    ```console
    $ mkdir -p ~/.docker/cli-plugins/
    $ curl -SL https://github.com/docker/compose/releases/download/v{{site.compose_v2_version}}/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
    ```
@z

@x
    This command installs Compose V2 for the active user under `$HOME` directory. To install Docker Compose for all users on your system, replace `~/.docker/cli-plugins` with `/usr/local/lib/docker/cli-plugins`.
@y
    This command installs Compose V2 for the active user under `$HOME` directory. To install Docker Compose for all users on your system, replace `~/.docker/cli-plugins` with `/usr/local/lib/docker/cli-plugins`.
@z

@x
2. Apply executable permissions to the binary:
@y
2. Apply executable permissions to the binary:
@z

@x
    ```console
    $ chmod +x ~/.docker/cli-plugins/docker-compose
    ```
@y
    ```console
    $ chmod +x ~/.docker/cli-plugins/docker-compose
    ```
@z

@x
3. Test your installation
@y
3. Test your installation
@z

@x
    ```console
    $ docker compose version
    Docker Compose version {{site.compose_v2_version}}
    ```
@y
    ```console
    $ docker compose version
    Docker Compose version {{site.compose_v2_version}}
    ```
@z

@x
### Compose Switch
@y
### Compose Switch
@z

@x
[Compose Switch](https://github.com/docker/compose-switch/){:target="_blank" rel="noopener" class="_"} is a replacement to the Compose V1 `docker-compose` (python) executable. Compose switch translates the command line into Compose V2 `docker compose` and then runs the latter.
@y
[Compose Switch](https://github.com/docker/compose-switch/){:target="_blank" rel="noopener" class="_"} is a replacement to the Compose V1 `docker-compose` (python) executable. Compose switch translates the command line into Compose V2 `docker compose` and then runs the latter.
@z

@x
To install Compose Switch automatically, run:
@y
To install Compose Switch automatically, run:
@z

@x
```console
$ curl -fL https://raw.githubusercontent.com/docker/compose-switch/master/install_on_linux.sh | sh
```
@y
```console
$ curl -fL https://raw.githubusercontent.com/docker/compose-switch/master/install_on_linux.sh | sh
```
@z

@x
To install Compose Switch manually:
@y
To install Compose Switch manually:
@z

@x
1. Download the `compose-switch` binary for your architecture
@y
1. Download the `compose-switch` binary for your architecture
@z

@x
    ```console
    $ curl -fL https://github.com/docker/compose-switch/releases/download/v{{site.compose_switch_version}}/docker-compose-linux-amd64 -o /usr/local/bin/compose-switch
    ```
@y
    ```console
    $ curl -fL https://github.com/docker/compose-switch/releases/download/v{{site.compose_switch_version}}/docker-compose-linux-amd64 -o /usr/local/bin/compose-switch
    ```
@z

@x
2. Run the following command to make it an executable:
@y
2. Run the following command to make it an executable:
@z

@x
    ```console
    $ chmod +x /usr/local/bin/compose-switch
    ```
@y
    ```console
    $ chmod +x /usr/local/bin/compose-switch
    ```
@z

@x
3. Rename the `docker-compose` binary if you've already installed it as `/usr/local/bin/docker-compose`
@y
3. Rename the `docker-compose` binary if you've already installed it as `/usr/local/bin/docker-compose`
@z

@x
    ```console
    $ mv /usr/local/bin/docker-compose /usr/local/bin/docker-compose-v1
    ```
@y
    ```console
    $ mv /usr/local/bin/docker-compose /usr/local/bin/docker-compose-v1
    ```
@z

@x
4. Define an **alternatives** group for the `docker-compose` command:
@y
4. Define an **alternatives** group for the `docker-compose` command:
@z

@x
    ```console
    $ update-alternatives --install /usr/local/bin/docker-compose docker-compose <PATH_TO_DOCKER_COMPOSE_V1> 1
    $ update-alternatives --install /usr/local/bin/docker-compose docker-compose /usr/local/bin/compose-switch 99
    ```
@y
    ```console
    $ update-alternatives --install /usr/local/bin/docker-compose docker-compose <PATH_TO_DOCKER_COMPOSE_V1> 1
    $ update-alternatives --install /usr/local/bin/docker-compose docker-compose /usr/local/bin/compose-switch 99
    ```
@z

@x
5. Verify your installation:
@y
5. Verify your installation:
@z

@x
    ```console
    $ update-alternatives --display docker-compose
    docker-compose - auto mode
        link best version is /usr/local/bin/compose-switch
        link currently points to /usr/local/bin/compose-switch
        link docker-compose is /usr/local/bin/docker-compose
    /usr/bin/docker-compose - priority 1
    /usr/local/bin/compose-switch - priority 99
    ```
@y
    ```console
    $ update-alternatives --display docker-compose
    docker-compose - auto mode
        link best version is /usr/local/bin/compose-switch
        link currently points to /usr/local/bin/compose-switch
        link docker-compose is /usr/local/bin/docker-compose
    /usr/bin/docker-compose - priority 1
    /usr/local/bin/compose-switch - priority 99
    ```
@z

@x
#### Uninstall Docker Compose
@y
#### Uninstall Docker Compose
@z

@x
If you installed Docker Compose using curl, run the following command to uninstall:
@y
If you installed Docker Compose using curl, run the following command to uninstall:
@z

@x
```console
$ sudo rm ~/.docker/cli-plugins/docker-compose
```
@y
```console
$ sudo rm ~/.docker/cli-plugins/docker-compose
```
@z
