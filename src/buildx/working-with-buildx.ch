%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Buildx
description: Working with Docker Buildx
keywords: Docker, buildx, multi-arch
---
@y
---
title: Docker Buildx
description: Docker Buildx の利用
keywords: Docker, buildx, multi-arch
---
@z

@x
>This is an experimental feature.
>
>{% include experimental.md %}
@y
{% comment %}
>This is an experimental feature.
>
>{% include experimental.md %}
{% endcomment %}
>これは試験的な（experimental）機能です。
>
>{% include experimental.md %}
@z

@x
## Overview
@y
{% comment %}
## Overview
{% endcomment %}
{: #overview }
## 概要
@z

@x
Docker Buildx is a CLI plugin that extends the docker command with the full support of the features provided by [Moby BuildKit](https://github.com/moby/buildkit) builder toolkit. It provides the same user experience as docker build with many new features like creating scoped builder instances and building against multiple nodes concurrently.
@y
{% comment %}
Docker Buildx is a CLI plugin that extends the docker command with the full support of the features provided by [Moby BuildKit](https://github.com/moby/buildkit) builder toolkit. It provides the same user experience as docker build with many new features like creating scoped builder instances and building against multiple nodes concurrently.
{% endcomment %}
Docker Buildx は Docker コマンドを拡張する CLI プラグインであり、[Moby BuildKit](https://github.com/moby/buildkit) ビルダーツールキットにより提供される機能に完全対応するものです。
Docker ビルドと同様のユーザー操作を提供し、さらにスコープ化されたビルダーインスタンス、複数ノードへの同時ビルドなど、数多くの新機能を提供します。
@z

@x
## Install
@y
{% comment %}
## Install
{% endcomment %}
{: #install }
## インストール
@z

@x
Docker Buildx is included in Docker 19.03 and is also bundled with the following Docker Desktop releases. Note that you must enable the 'Experimental features' option to use Docker Buildx.
@y
{% comment %}
Docker Buildx is included in Docker 19.03 and is also bundled with the following Docker Desktop releases. Note that you must enable the 'Experimental features' option to use Docker Buildx.
{% endcomment %}
Docker Buildx は Docker 19.03 に含まれます。
また以下に示す Docker デスクトップリリースにもバンドルされています。
なお Docker Buildx を利用するには「Experimental features」オプションを有効にする必要があります。
@z

@x
- Docker Desktop Enterprise version 2.1.0
- Docker Desktop Edge version 2.0.4.0 or higher
@y
{% comment %}
- Docker Desktop Enterprise version 2.1.0
- Docker Desktop Edge version 2.0.4.0 or higher
{% endcomment %}
- Docker Desktop Enterprise バージョン 2.1.0
- Docker Desktop Edge バージョン 2.0.4.0 またはそれ以降
@z

@x
You can also download the latest `buildx` binary from the [Docker buildx](https://github.com/docker/buildx/) repository.
@y
{% comment %}
You can also download the latest `buildx` binary from the [Docker buildx](https://github.com/docker/buildx/) repository.
{% endcomment %}
[Docker buildx](https://github.com/docker/buildx/) リポジトリから、最新の `buildx` バイナリをダウンロードすることもできます。
@z

@x
## Build with `buildx`
@y
{% comment %}
## Build with `buildx`
{% endcomment %}
{: #build-with-buildx }
## `buildx` を使ったビルド
@z

@x
To start a new build, run the command `docker buildx build .`
@y
{% comment %}
To start a new build, run the command `docker buildx build .`
{% endcomment %}
新たなビルドを行うには  `docker buildx build` を実行します。
@z

@x
```
$ docker buildx build .
[+] Building 8.4s (23/32)
 => ...
 ```
@y
```
$ docker buildx build .
[+] Building 8.4s (23/32)
 => ...
 ```
@z

@x
Buildx builds using the BuildKit engine and does not require `DOCKER_BUILDKIT=1` environment variable to start the builds.
@y
{% comment %}
Buildx builds using the BuildKit engine and does not require `DOCKER_BUILDKIT=1` environment variable to start the builds.
{% endcomment %}
Buildx は Buildx エンジンを使ってビルドを行います。
ビルドを行うにあたって、環境変数 `DOCKER_BUILDKIT=1` を設定する必要はありません。
@z

@x
The `docker buildx build` command supports features available for `docker build`, including the new features in Docker 19.03 such as outputs configuration, inline build caching, and specifying target platform. In addition, Buildx also supports new features that are not yet available for regular `docker build` like building manifest lists, distributed caching, and exporting build results to OCI image tarballs.
@y
{% comment %}
The `docker buildx build` command supports features available for `docker build`, including the new features in Docker 19.03 such as outputs configuration, inline build caching, and specifying target platform. In addition, Buildx also supports new features that are not yet available for regular `docker build` like building manifest lists, distributed caching, and exporting build results to OCI image tarballs.
{% endcomment %}
`docker buildx build` コマンドは `docker build` によって利用できる機能はすべて対応しています。
つまり Docker 19.03 における新機能である、出力設定、インラインビルドキャッシング、ターゲットプラットフォーム指定にも対応します。
さらに Buildx では、いつもの `docker build` では実現できない新機能として、マニフェスト一覧の生成、分散キャッシング、ビルド結果の OCI イメージ tarball への出力も実現します。
@z

@x
You can run Buildx in different configurations that are exposed through a driver concept. Currently, Docker supports a "docker" driver that uses the BuildKit library bundled into the docker daemon binary, and a "docker-container" driver that automatically launches BuildKit inside a Docker container.
@y
{% comment %}
You can run Buildx in different configurations that are exposed through a driver concept. Currently, Docker supports a "docker" driver that uses the BuildKit library bundled into the docker daemon binary, and a "docker-container" driver that automatically launches BuildKit inside a Docker container.
{% endcomment %}
Buildx の実行においては、ドライバーの仕様に基づいて提供されるさまざまな設定を行うことができます。
現時点にて Docker がサポートするドライバーは以下のとおりです。
「docker」ドライバーは BuildKit ライブラリを利用しており、Docker デーモンバイナリにバンドルされます。
「docker-container」ドライバーは Docker コンテナー内部にて BuildKit を自動的に実行します。
@z

@x
The user experience of using Buildx is very similar across drivers. However, there are some features that are not currently supported by the "docker" driver, because the BuildKit library which is bundled into docker daemon uses a different storage component. In contrast, all images built with the "docker" driver are automatically added to the "docker images" view by default, whereas when using other drivers, the method for outputting an image needs to be selected with `--output`.
@y
{% comment %}
The user experience of using Buildx is very similar across drivers. However, there are some features that are not currently supported by the "docker" driver, because the BuildKit library which is bundled into docker daemon uses a different storage component. In contrast, all images built with the "docker" driver are automatically added to the "docker images" view by default, whereas when using other drivers, the method for outputting an image needs to be selected with `--output`.
{% endcomment %}
Buildx の利用するドライバーが違っていても、ユーザー操作は非常によく似ています。
ただし現在のところ「docker」ドライバーが対応していない機能もあります。
これは Docker デーモンにバンドルされる BuildKit ライブラリが、さまざまなストレージコンポーネントを利用するためです。
「docker」ドライバーによりビルドされたイメージは、デフォルトではすべて自動的に「docker images」の一覧に加えられます。
一方で別のドライバーを用いる場合には、イメージの出力方法を `--output` により選択することが必要です。
@z

@x
## Work with builder instances
@y
{% comment %}
## Work with builder instances
{% endcomment %}
{: #work-with-builder-instances }
## ビルダーインスタンスを使った操作
@z

@x
By default, Buildx uses the "docker" driver if it is supported, providing a user experience very similar to the native docker build. Note that you must use a local shared daemon to build your applications.
@y
{% comment %}
By default, Buildx uses the "docker" driver if it is supported, providing a user experience very similar to the native docker build. Note that you must use a local shared daemon to build your applications.
{% endcomment %}
Buildx は「docker」ドライバーが対応していれば、デフォルトでこのドライバーを利用します。
ユーザー操作は、ネイティブな Docker ビルドと非常によく似ています。
アプリケーションをビルドするには、ローカルで稼動する共有デーモンを利用する必要があります。
@z

@x
Buildx allows you to create new instances of isolated builders. You can use this to get a scoped environment for your CI builds that does not change the state of the shared daemon, or for isolating builds for different projects. You can create a new instance for a set of remote nodes, forming a build farm, and quickly switch between them.
@y
{% comment %}
Buildx allows you to create new instances of isolated builders. You can use this to get a scoped environment for your CI builds that does not change the state of the shared daemon, or for isolating builds for different projects. You can create a new instance for a set of remote nodes, forming a build farm, and quickly switch between them.
{% endcomment %}
Buildx allows you to create new instances of isolated builders. You can use this to get a scoped environment for your CI builds that does not change the state of the shared daemon, or for isolating builds for different projects. You can create a new instance for a set of remote nodes, forming a build farm, and quickly switch between them.
@z

@x
You can create new instances using the `docker buildx create` command. This creates a new builder instance with a single node based on your current configuration.
@y
{% comment %}
You can create new instances using the `docker buildx create` command. This creates a new builder instance with a single node based on your current configuration.
{% endcomment %}
新たなインスタンスを生成するには `docker buildx create` コマンドを利用します。
このコマンドを実行すると、現時点の設定に基づいて、単一ノードを持つ新たなビルダーインスタンスが生成されます。
@z

@x
To use a remote node you can specify the `DOCKER_HOST` or the remote context name while creating the new builder. After creating a new instance, you can manage its lifecycle using the inspect, stop and rm commands. To list all available builders, use ls. After creating a new builder you can also append new nodes to it.
@y
{% comment %}
To use a remote node you can specify the `DOCKER_HOST` or the remote context name while creating the new builder. After creating a new instance, you can manage its lifecycle using the inspect, stop and rm commands. To list all available builders, use ls. After creating a new builder you can also append new nodes to it.
{% endcomment %}
新たなビルダーの生成時にリモートノードを利用するには、`DOCKER_HOST` を設定するか、あるいはリモートコンテキスト名を指定します。
新たなインスタンスが生成された後は、inspect、stop、rm コマンドを利用していき、そのライフサイクルを管理していきます。
利用可能なビルダーを一覧表示するには ls を利用します。
新しいビルダーを生成したら、そこに新たなノードを追加していくことができます。
@z

@x
To switch between different builders use `docker buildx use <name>`. After running this command, the build commands will automatically use this builder.
@y
{% comment %}
To switch between different builders use `docker buildx use <name>`. After running this command, the build commands will automatically use this builder.
{% endcomment %}
To switch between different builders use `docker buildx use <name>`. After running this command, the build commands will automatically use this builder.
@z

@x
Docker 19.03 also features a new docker context command that you can use to provide names for remote Docker API endpoints. Buildx integrates with docker context to ensure all the contexts automatically get a default builder instance. You can also set the context name as the target when you  create a new builder instance or when you add a node to it.
@y
{% comment %}
Docker 19.03 also features a new docker context command that you can use to provide names for remote Docker API endpoints. Buildx integrates with docker context to ensure all the contexts automatically get a default builder instance. You can also set the context name as the target when you  create a new builder instance or when you add a node to it.
{% endcomment %}
Docker 19.03 also features a new docker context command that you can use to provide names for remote Docker API endpoints. Buildx integrates with docker context to ensure all the contexts automatically get a default builder instance. You can also set the context name as the target when you  create a new builder instance or when you add a node to it.
@z

@x
## Build multi-platform images
@y
{% comment %}
## Build multi-platform images
{% endcomment %}
{: #build-multi-platform-images }
## マルチプラットフォームのイメージビルド
@z

@x
BuildKit is designed to work well for building for multiple platforms and not only for the architecture and operating system that the user invoking the build happens to run.
@y
{% comment %}
BuildKit is designed to work well for building for multiple platforms and not only for the architecture and operating system that the user invoking the build happens to run.
{% endcomment %}
BuildKit はマルチプラットフォームのビルドを得意とするものとして設計されています。
対象となるプラットフォームは、ユーザーがビルド時に実行することになるアーキテクチャーやオペレーティングシステムに限りません。
@z

@x
When you invoke a build, you can set the `--platform` flag to specify the target platform for the build output, (for example, linux/amd64, linux/arm64, darwin/amd64).
@y
{% comment %}
When you invoke a build, you can set the `--platform` flag to specify the target platform for the build output, (for example, linux/amd64, linux/arm64, darwin/amd64).
{% endcomment %}
ビルド実行する際には `--platform` フラグを用います。
このフラグにターゲットプラットフォームを指定しビルド出力します。
（たとえば linux/amd64, linux/arm64, darwin/amd64）
@z

@x
When the current builder instance is backed by the "docker-container" driver, you can specify multiple platforms together. In this case, it builds a manifest list which contains images for all of the specified architectures. When you use this image in `docker run` or `docker service`, Docker picks the correct image based on the node’s platform.
@y
{% comment %}
When the current builder instance is backed by the "docker-container" driver, you can specify multiple platforms together. In this case, it builds a manifest list which contains images for all of the specified architectures. When you use this image in `docker run` or `docker service`, Docker picks the correct image based on the node’s platform.
{% endcomment %}
When the current builder instance is backed by the "docker-container" driver, you can specify multiple platforms together. In this case, it builds a manifest list which contains images for all of the specified architectures. When you use this image in `docker run` or `docker service`, Docker picks the correct image based on the node’s platform.
@z

@x
You can build multi-platform images using three different strategies that are supported by Buildx and Dockerfiles:
@y
{% comment %}
You can build multi-platform images using three different strategies that are supported by Buildx and Dockerfiles:
{% endcomment %}
You can build multi-platform images using three different strategies that are supported by Buildx and Dockerfiles:
@z

@x
1. Using the QEMU emulation support in the kernel
2. Building on multiple native nodes using the same builder instance
3. Using a stage in Dockerfile to cross-compile to different architectures
@y
{% comment %}
1. Using the QEMU emulation support in the kernel
2. Building on multiple native nodes using the same builder instance
3. Using a stage in Dockerfile to cross-compile to different architectures
{% endcomment %}
1. カーネルにおいて QEMU エミュレーションサポートを利用します。
2. 同一のビルダーインスタンスを利用して、複数のネイティブなノードをビルドします。
3. Dockerfile 内の 1 つのステージから、さまざまなアーキテクチャーに対するクロスコンパイルを行います。
@z

@x
QEMU is the easiest way to get started if your node already supports it (for example. if you are using Docker Desktop). It requires no changes to your Dockerfile and BuildKit automatically detects the secondary architectures that are available. When BuildKit needs to run a binary for a different architecture, it automatically loads it through a binary registered in the `binfmt_misc` handler.
@y
{% comment %}
QEMU is the easiest way to get started if your node already supports it (for example. if you are using Docker Desktop). It requires no changes to your Dockerfile and BuildKit automatically detects the secondary architectures that are available. When BuildKit needs to run a binary for a different architecture, it automatically loads it through a binary registered in the `binfmt_misc` handler.
{% endcomment %}
QEMU is the easiest way to get started if your node already supports it (for example. if you are using Docker Desktop). It requires no changes to your Dockerfile and BuildKit automatically detects the secondary architectures that are available. When BuildKit needs to run a binary for a different architecture, it automatically loads it through a binary registered in the `binfmt_misc` handler.
@z

@x
Using multiple native nodes provide better support for more complicated cases that are not handled by QEMU and generally have better performance. You can add additional nodes to the builder instance using the `--append` flag.
@y
{% comment %}
Using multiple native nodes provide better support for more complicated cases that are not handled by QEMU and generally have better performance. You can add additional nodes to the builder instance using the `--append` flag.
{% endcomment %}
Using multiple native nodes provide better support for more complicated cases that are not handled by QEMU and generally have better performance. You can add additional nodes to the builder instance using the `--append` flag.
@z

@x
```bash
# assuming contexts node-amd64 and node-arm64 exist in "docker context ls"
$ docker buildx create --use --name mybuild node-amd64
mybuild
$ docker buildx create --append --name mybuild node-arm64
$ docker buildx build --platform linux/amd64,linux/arm64 .
```
@y
```bash
# assuming contexts node-amd64 and node-arm64 exist in "docker context ls"
$ docker buildx create --use --name mybuild node-amd64
mybuild
$ docker buildx create --append --name mybuild node-arm64
$ docker buildx build --platform linux/amd64,linux/arm64 .
```
@z

@x
Finally, depending on your project, the language that you use may have good support for cross-compilation. In that case, multi-stage builds in Dockerfiles can be effectively used to build binaries for the platform specified with `--platform` using the native architecture of the build node. A list of build arguments like `BUILDPLATFORM` and `TARGETPLATFORM` is available automatically inside your Dockerfile and can be leveraged by the processes running as part of your build.
@y
{% comment %}
{% endcomment %}
Finally, depending on your project, the language that you use may have good support for cross-compilation. In that case, multi-stage builds in Dockerfiles can be effectively used to build binaries for the platform specified with `--platform` using the native architecture of the build node. A list of build arguments like `BUILDPLATFORM` and `TARGETPLATFORM` is available automatically inside your Dockerfile and can be leveraged by the processes running as part of your build.
@z

@x
```
FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log
FROM alpine
COPY --from=build /log /log
```
@y
```
FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log
FROM alpine
COPY --from=build /log /log
```
@z

@x
## High-level build options
@y
{% comment %}
{% endcomment %}
## High-level build options
@z

@x
Buildx also aims to provide support for high-level build concepts that go beyond invoking a single build command.
@y
{% comment %}
{% endcomment %}
Buildx also aims to provide support for high-level build concepts that go beyond invoking a single build command.
@z

@x
BuildKit efficiently handles multiple concurrent build requests and deduplicating work. The build commands can be combined with general-purpose command runners (for example, `make`). However, these tools generally invoke builds in sequence and therefore cannot leverage the full potential of BuildKit parallelization, or combine BuildKit’s output for the user. For this use case, we have added a command called `docker buildx bake`.
@y
{% comment %}
{% endcomment %}
BuildKit efficiently handles multiple concurrent build requests and deduplicating work. The build commands can be combined with general-purpose command runners (for example, `make`). However, these tools generally invoke builds in sequence and therefore cannot leverage the full potential of BuildKit parallelization, or combine BuildKit’s output for the user. For this use case, we have added a command called `docker buildx bake`.
@z

@x
The `bake` command supports building images from compose files, similar to a compose build, but allowing all the services to be built concurrently as part of a single request.
@y
{% comment %}
The `bake` command supports building images from compose files, similar to a compose build, but allowing all the services to be built concurrently as part of a single request.
{% endcomment %}
The `bake` command supports building images from compose files, similar to a compose build, but allowing all the services to be built concurrently as part of a single request.
@z

@x
## Set `buildx` as the default builder
@y
{% comment %}
## Set `buildx` as the default builder
{% endcomment %}
{: #set-buildx-as-the-default-builder }
## `buildx` のデフォルトビルダー設定
@z

@x
Running the command `docker buildx install` sets up docker builder command as an alias to `docker buildx`. This results in the ability to have `docker build` use the current buildx builder.
@y
{% comment %}
Running the command `docker buildx install` sets up docker builder command as an alias to `docker buildx`. This results in the ability to have `docker build` use the current buildx builder.
{% endcomment %}
`docker buildx install` コマンドを実行すると、Docker ビルドコマンドのエイリアスとして `docker buildx` を設定します。
これにより `docker build` が、現在の buildx ビルダーを利用するようになります。
@z

@x
To remove this alias, run `docker buildx uninstall`.
@y
{% comment %}
To remove this alias, run `docker buildx uninstall`.
{% endcomment %}
このエイリアスを削除するには `docker buildx uninstall` を実行します。
@z
