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
Starting with Docker Desktop 3.4.0, you can run Compose V2 commands without modifying your invocations, by enabling the drop-in replacement of the previous `docker-compose` with the new command.  See the section [Installing Compose](install.md) for detailed instructions.
@y
Starting with Docker Desktop 3.4.0, you can run Compose V2 commands without modifying your invocations, by enabling the drop-in replacement of the previous `docker-compose` with the new command.  See the section [Installing Compose](install.md) for detailed instructions.
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
Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. This allows us to include community proposals, experimental implementations by the Docker CLI and/or Engine, and deliver features faster to users. Compose V2 also  supports some of the newer additions to the Compose specification, such as [profiles](profiles.md) and [GPU](gpu-support.md) devices.
@y
Compose V2 implementation relies directly on the compose-go bindings which are maintained as part of the specification. This allows us to include community proposals, experimental implementations by the Docker CLI and/or Engine, and deliver features faster to users. Compose V2 also  supports some of the newer additions to the Compose specification, such as [profiles](profiles.md) and [GPU](gpu-support.md) devices.
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
## Where to go next
@y
## Where to go next
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
@y
- [User guide](index.md)
- [Installing Compose](install.md)
@z
