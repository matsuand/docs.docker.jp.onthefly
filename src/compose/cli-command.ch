%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose V2 in the Docker CLI
keywords: compose, V2, beta, Tech preview
title: Compose V2 beta
---
@y
---
description: Docker CLI における Compose V2
keywords: compose, V2, beta, Tech preview
title: Compose V2 ベータ
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
> The new Compose V2, which supports the compose command as part of the Docker CLI, is now available as a beta version.  Compose V2 seamlessly integrates compose functions into the Docker platform, continuing to support most of the previous `docker-compose` features and flags. You can test the Compose V2 today, by simply replacing the dash (`-`) with a space, and running `docker compose`, instead of `docker-compose`.
>
> As Docker Compose V2 is in beta, we recommend that you extensively test before using it in production environments.
{: .important}
@y
> 重要
>
> The new Compose V2, which supports the compose command as part of the Docker CLI, is now available as a beta version.  Compose V2 seamlessly integrates compose functions into the Docker platform, continuing to support most of the previous `docker-compose` features and flags. You can test the Compose V2 today, by simply replacing the dash (`-`) with a space, and running `docker compose`, instead of `docker-compose`.
>
> As Docker Compose V2 is in beta, we recommend that you extensively test before using it in production environments.
{: .important}
@z

@x
Starting with Docker Desktop 3.4.0, you can run Compose V2 commands without modifying your invocations, by enabling the drop-in replacement of the previous `docker-compose` with the new command.  See the section [Installing Compose v2](#installing-compose-v2) for detailed instructions how to enable the drop-in replacement.
@y
Starting with Docker Desktop 3.4.0, you can run Compose V2 commands without modifying your invocations, by enabling the drop-in replacement of the previous `docker-compose` with the new command.  See the section [Installing Compose v2](#installing-compose-v2) for detailed instructions how to enable the drop-in replacement.
@z

@x
We will gradually turn this option on automatically for Docker Desktop users, so that users can seamlessly move to Docker Compose V2 without the need to upgrade any of their scripts. If you run into any problems with Compose V2, you can easily switch back to Compose v1 by either by making changes in Docker Desktop **Experimental** Settings, or by running the command `docker-compose disable-v2`.
@y
We will gradually turn this option on automatically for Docker Desktop users, so that users can seamlessly move to Docker Compose V2 without the need to upgrade any of their scripts. If you run into any problems with Compose V2, you can easily switch back to Compose v1 by either by making changes in Docker Desktop **Experimental** Settings, or by running the command `docker-compose disable-v2`.
@z

@x
Your feedback is important to us. Let us know your feedback on the new 'compose' command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues){:target="_blank" rel="noopener" class="_"} GitHub repository.
{: .important}
@y
Your feedback is important to us. Let us know your feedback on the new 'compose' command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues){:target="_blank" rel="noopener" class="_"} GitHub repository.
{: .important}
@z

@x
## Context of Docker Compose evolution
@y
## Context of Docker Compose evolution
@z

@x
Introduction of the [Compose specification](https://github.com/compose-spec/compose-spec){:target="_blank" rel="noopener" class="_"} makes a clean distinction between the Compose YAML file model and the `docker-compose` implementation. Making this change has enabled a number of enhancements, including adding the `compose` command directly into the Docker CLI,  being able to “up” a Compose application on cloud platforms by simply switching the Docker context, and launching of [Amazon ECS](/cloud/ecs-integration) and [Microsoft ACI](/cloud/aci-integration). As the Compose specification evolves, new features land faster in the Docker CLI.
@y
Introduction of the [Compose specification](https://github.com/compose-spec/compose-spec){:target="_blank" rel="noopener" class="_"} makes a clean distinction between the Compose YAML file model and the `docker-compose` implementation. Making this change has enabled a number of enhancements, including adding the `compose` command directly into the Docker CLI,  being able to “up” a Compose application on cloud platforms by simply switching the Docker context, and launching of [Amazon ECS](/cloud/ecs-integration) and [Microsoft ACI](/cloud/aci-integration). As the Compose specification evolves, new features land faster in the Docker CLI.
@z

@x
While docker-compose is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. This allows us to include community proposals, experimental implementations by the Docker CLI and/or Engine, and deliver features faster to users. Compose V2 also  supports some of the newer additions to the Compose specification, such as [profiles](profiles.md) and [GPU](gpu-support.md) devices.
@y
While docker-compose is still supported and maintained, Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. This allows us to include community proposals, experimental implementations by the Docker CLI and/or Engine, and deliver features faster to users. Compose V2 also  supports some of the newer additions to the Compose specification, such as [profiles](profiles.md) and [GPU](gpu-support.md) devices.
@z

@x
Additionally, Compose V2 also supports [Apple silicon](../docker-for-mac/apple-silicon.md).
@y
Additionally, Compose V2 also supports [Apple silicon](../docker-for-mac/apple-silicon.md).
@z

@x
For more information about the flags that are supported in the new compose command, see the [docker-compose compatibility list](cli-command-compatibility.md).
@y
For more information about the flags that are supported in the new compose command, see the [docker-compose compatibility list](cli-command-compatibility.md).
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
**Docker Desktop for Mac and for Windows version 3.2.1** and above includes the new Compose command along with the Docker CLI. Therefore, Windows and Mac users do not need to install the Compose V2 separately.
@y
**Docker Desktop for Mac and for Windows version 3.2.1** and above includes the new Compose command along with the Docker CLI. Therefore, Windows and Mac users do not need to install the Compose V2 separately.
@z

@x
We will progressively turn Docker Compose V2 on automatically for Docker Desktop users, so that users can seamlessly move to Docker Compose V2 without the need to change any of their scripts.  If you run into any problems with Compose V2, you can simply switch back to Compose v1, either in Docker Desktop, or in the CLI.
@y
We will progressively turn Docker Compose V2 on automatically for Docker Desktop users, so that users can seamlessly move to Docker Compose V2 without the need to change any of their scripts.  If you run into any problems with Compose V2, you can simply switch back to Compose v1, either in Docker Desktop, or in the CLI.
@z

@x
For Docker Desktop installation instructions, see:
@y
Docker Desktop のインストール手順は以下を参照してください。
@z

@x
- [Install Docker Desktop on Mac](../docker-for-mac/install.md)
- [Install Docker Desktop on Windows](../docker-for-windows/install.md)
@y
- [Docker Desktop の Mac へのンストール](../docker-for-mac/install.md)
- [Docker Desktop の Windows へのンストール](../docker-for-windows/install.md)
@z

@x
To disable Docker Compose V2 using Docker Desktop:
@y
To disable Docker Compose V2 using Docker Desktop:
@z

@x
1. From the Docker menu, click **Preferences** (**Settings** on Windows) > **Experimental features**.
2. Clear the **Use Docker Compose V2** check box.
@y
1. From the Docker menu, click **Preferences** (**Settings** on Windows) > **Experimental features**.
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
You can install the new Compose CLI, including Compose V2, using the following install script:
@y
You can install the new Compose CLI, including Compose V2, using the following install script:
@z

@x
```console
$ curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
```
@y
```console
$ curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
```
@z
