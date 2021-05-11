%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Multi-CPU Architecture Support
keywords: mac, windows, Multi-CPU architecture support
redirect_from:
- /docker-for-mac/multi-arch/
- /mackit/multi-arch/
title: Leverage multi-CPU architecture support
---
@y
---
description: Multi-CPU Architecture Support
keywords: mac, windows, Multi-CPU architecture support
redirect_from:
- /docker-for-mac/multi-arch/
- /mackit/multi-arch/
title: マルチ CPU アーキテクチャー対応の活用
---
@z

@x
Docker images can support multiple architectures, which means that a single
image may contain variants for different architectures, and sometimes for different
operating systems, such as Windows.
@y
Docker イメージはマルチアーキテクチャー（multiple architectures）対応が可能です。
これは 1 つのイメージ内に、複数のアーキテクチャーのバリアント（variant; 異なる形式）を含めることができ、ときには Windows などのように異なるオペレーティングシステムを含めることができます。
@z

@x
When running an image with multi-architecture support, `docker` automatically
selects the image variant that matches your OS and architecture.
@y
マルチアーキテクチャーに対応したイメージを実行させたときには、OS やアーキテクチャーが合致するように、`docker`が自動的にイメージ内のアーキテクチャーバリアントを選びます。
@z

@x
Most of the official images on Docker Hub provide a [variety of architectures](https://github.com/docker-library/official-images#architectures-other-than-amd64){: target="_blank" rel="noopener" class="_" }.
For example, the `busybox` image supports `amd64`, `arm32v5`, `arm32v6`,
`arm32v7`, `arm64v8`, `i386`, `ppc64le`, and `s390x`. When running this image
on an `x86_64` / `amd64` machine, the `x86_64` variant is pulled and run.
@y
Docker Hub から提供されている公式イメージは、ほとんどが [複数アーキテクチャー](https://github.com/docker-library/official-images#architectures-other-than-amd64){: target="_blank" rel="noopener" class="_" } に対応しています。
たとえば`busybox`イメージがサポートするアーキテクチャーは`amd64`、`arm32v5`、`arm32v6`、`arm32v7`、`arm64v8`、`i386`、`ppc64le`、`s390x`です。 
このイメージを`x86_64`あるいは`amd64`マシン上で実行した場合、`x86_64`バリアントがプルされて実行されます。
@z

@x
## Multi-arch support on Docker Desktop
@y
{: #multi-arch-support-on-docker-desktop }
## Docker Desktop 上でのマルチアーキテクチャー対応
@z

@x
**Docker Desktop** provides `binfmt_misc` multi-architecture support,
which means you can run containers for different Linux architectures
such as `arm`, `mips`, `ppc64le`, and even `s390x`.
@y
**Docker Desktop** は`binfmt_misc`マルチアーキテクチャーをサポートします。
これは、さまざまな Linux アーキテクチャー、`arm`、`mips`、`ppc64le`、さらには `s390x`でもコンテナーを実行することができます。
@z

@x
This does not require any special configuration in the container itself as it uses
[qemu-static](https://wiki.qemu.org/Main_Page){: target="_blank" rel="noopener" class="_" }
from the **Docker for Mac VM**. Because of this, you can run an ARM container,
like the `arm32v7` or `ppc64le` variants of the busybox image.
@y
これを実現するのに、コンテナーそのものへの特別な設定は不要です。
**Docker for Mac VM** が提供する [qemu-static](https://wiki.qemu.org/Main_Page){: target="_blank" rel="noopener" class="_" } を利用しているためです。
これがあるから、ARM コンテナー`arm32v7`や`ppc64le`などのバリアントが busybox イメージにおいて実行できます。
@z

@x
## Build multi-arch images with Buildx
@y
{: #build-multi-arch-images-with-buildx }
## Buildx を使ったマルチアーキテクチャー対応イメージのビルド
@z

@x
Docker is now making it easier than ever to develop containers on, and for Arm
servers and devices. Using the standard Docker tooling and processes, you can
start to build, push, pull, and run images seamlessly on different compute
architectures. In most cases, you don't have to make any changes to Dockerfiles
or source code to start building for Arm.
@y
Docker によるコンテナー開発は、以前よりもさらに簡単になりました。
ARM のサーバーやデバイスについても同様です。
Docker の標準的なツールや処理手順を使って、数多くのコンピューターアーキテクチャー上において、イメージのビルド、プッシュ、プル、実行をシームレスに行うことができます。
ARM 向けのビルドを開始するにあたっては、Dockerfile やソースコードに変更を加える必要はほとんどありません。
@z

@x
Docker introduces a new CLI command called `buildx`. You can use the `buildx`
command on Docker Desktop for Mac and Windows to build multi-arch images, link
them together with a manifest file, and push them all to a registry using a
single command.  With the included emulation, you can transparently build more
than just native images.  Buildx accomplishes this by adding new builder
instances based on BuildKit, and leveraging Docker Desktop's technology stack
to run non-native binaries.
@y
Docker では、新しい CLI コマンド`buildx`が導入されました。
Docker Desktop for Mac あるいは Windows 上においてこの`buildx`コマンドを使えば、マルチアーキテクチャー対応のイメージをビルドし、マニフェストファイルをこれにひもづけることができます。
そしてこれらをまとめて 1 つのコマンドを実行するだけで、レジストリにプッシュすることができます。
内部で行われるエミュレーション機能により、ネイティブイメージ以外のものを、意識することなくビルドすることができます。
Buildx ではこれを実現するために、BuildKit にもとづくビルダーインスタンスを新たに加えています。
またネイティブ以外のバイナリーを実行するために Docker Desktop の技術基盤を活用しています。
@z

@x
For more information about the Buildx CLI command, see [Buildx](../buildx/working-with-buildx.md)
and the [`docker buildx` command line reference](../engine/reference/commandline/buildx.md).
@y
Buildx の CLI コマンドの詳細は [Buildx](../buildx/working-with-buildx.md) や [`docker buildx`コマンドラインリファレンス](../engine/reference/commandline/buildx.md) を参照してください。
@z

@x
### Build and run multi-architecture images
@y
{: #build-and-run-multi-architecture-images }
### マルチアーキテクチャーイメージのビルドと実行
@z

@x
Run the `docker buildx ls` command to list the existing builders. This displays
the default builder, which is our old builder.
@y
`docker buildx ls`コマンドを実行して、生成済みのビルダー一覧を確認します。
ここではデフォルトビルダーが表示されています。
これまでの古いビルダーを表わしています。
@z

@x
```console
$ docker buildx ls
@y
```console
$ docker buildx ls
@z

@x
NAME/NODE DRIVER/ENDPOINT STATUS  PLATFORMS
default * docker
  default default         running linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6
```
@y
NAME/NODE DRIVER/ENDPOINT STATUS  PLATFORMS
default * docker
  default default         running linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6
```
@z

@x
Create a new builder which gives access to the new multi-architecture features.
@y
マルチアーキテクチャー機能にアクセス可能な新たなビルダーを生成します。
@z

@x
```console
$ docker buildx create --name mybuilder

mybuilder
```
@y
```console
$ docker buildx create --name mybuilder

mybuilder
```
@z

@x
Alternatively, run `docker buildx create --name mybuilder --use` to create a new
builder and switch to it using a single command.
@y
あるいは`docker buildx create --name mybuilder --use`を実行すると、ビルダーを新規に生成するとともに、これを利用するように切り替える操作を、ただ 1 つのコマンドで実行できます。
@z

@x
Switch to the new builder and inspect it.
@y
新たなビルダーに切り替えて確認してみます。
@z

@x
```console
$ docker buildx use mybuilder
@y
```console
$ docker buildx use mybuilder
@z

@x
$ docker buildx inspect --bootstrap
@y
$ docker buildx inspect --bootstrap
@z

@x
[+] Building 2.5s (1/1) FINISHED
 => [internal] booting buildkit                                                   2.5s
 => => pulling image moby/buildkit:master                                         1.3s
 => => creating container buildx_buildkit_mybuilder0                              1.2s
Name:   mybuilder
Driver: docker-container
@y
[+] Building 2.5s (1/1) FINISHED
 => [internal] booting buildkit                                                   2.5s
 => => pulling image moby/buildkit:master                                         1.3s
 => => creating container buildx_buildkit_mybuilder0                              1.2s
Name:   mybuilder
Driver: docker-container
@z

@x
Nodes:
Name:      mybuilder0
Endpoint:  unix:///var/run/docker.sock
Status:    running
@y
Nodes:
Name:      mybuilder0
Endpoint:  unix:///var/run/docker.sock
Status:    running
@z

@x
Platforms: linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6
```
@y
Platforms: linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6
```
@z

@x
Test the workflow to ensure you can build, push, and run multi-architecture
images. Create a simple example Dockerfile, build a couple of image variants,
and push them to Docker Hub.
@y
マルチアーキテクチャーイメージをビルド、プッシュ、実行するこの作業手順をテストしてみます。
そのために単純な Dockerfile を生成します。
いくつかのイメージバリアントをビルドして、Docker Hub にプッシュします。
@z

@x
The following example uses a single `Dockerfile` to build an Ubuntu image with cURL
installed for multiple architectures.
@y
以下に示す例では 1 つの`Dockerfile`を利用して、マルチアーキテクチャー対応の Ubuntu イメージをビルドして cURL をインストールするものです。
@z

@x
Create a `Dockerfile` with the following:
@y
以下のようにして`Dockerfile`を生成します。
@z

@x
```dockerfile
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y curl
```
@y
```dockerfile
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y curl
```
@z

@x
Build the Dockerfile with buildx, passing the list of architectures to build for:
@y
buildx を使って Dockerfile をビルドします。
実行にあたって、ビルドを行うアーキテクチャーの一覧を指定します。
@z

@x
```console
$ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t username/demo:latest --push .

[+] Building 6.9s (19/19) FINISHED
...
 => => pushing layers                                                             2.7s
 => => pushing manifest for docker.io/username/demo:latest                       2.2
```
@y
```console
$ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t username/demo:latest --push .

[+] Building 6.9s (19/19) FINISHED
...
 => => pushing layers                                                             2.7s
 => => pushing manifest for docker.io/username/demo:latest                       2.2
```
@z

@x
Where, `username` is a valid Docker username.
@y
ここで`username`は有効な Docker のユーザー名です。
@z

@x
> **Notes:**
>
> - The `--platform` flag informs buildx to generate Linux images for AMD 64-bit,
>   Arm 64-bit, and Armv7 architectures.
> - The `--push` flag generates a multi-arch manifest and pushes all the images
>   to Docker Hub.
@y
> **メモ**
>
>  - `--platform`フラグは Buildx に対して、AMD 64-bit、Arm 64-bit、Armv7 の各アーキテクチャーの Linux イメージの生成を指示しています。
>  - `--push`フラグは、マルチアーキテクチャーのマニフェストファイルを生成して、イメージとともに Docker Hub へのプッシュを行います。
@z

@x
Inspect the image using `docker buildx imagetools`.
@y
`docker buildx imagetools`を使ってイメージを確認します。
@z

@x
```console
$ docker buildx imagetools inspect username/demo:latest

Name:      docker.io/username/demo:latest
MediaType: application/vnd.docker.distribution.manifest.list.v2+json
Digest:    sha256:2a2769e4a50db6ac4fa39cf7fb300fa26680aba6ae30f241bb3b6225858eab76

Manifests:
  Name:      docker.io/username/demo:latest@sha256:8f77afbf7c1268aab1ee7f6ce169bb0d96b86f585587d259583a10d5cd56edca
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/amd64

  Name:      docker.io/username/demo:latest@sha256:2b77acdfea5dc5baa489ffab2a0b4a387666d1d526490e31845eb64e3e73ed20
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm64

  Name:      docker.io/username/demo:latest@sha256:723c22f366ae44e419d12706453a544ae92711ae52f510e226f6467d8228d191
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm/v7
```
@y
```console
$ docker buildx imagetools inspect username/demo:latest

Name:      docker.io/username/demo:latest
MediaType: application/vnd.docker.distribution.manifest.list.v2+json
Digest:    sha256:2a2769e4a50db6ac4fa39cf7fb300fa26680aba6ae30f241bb3b6225858eab76

Manifests:
  Name:      docker.io/username/demo:latest@sha256:8f77afbf7c1268aab1ee7f6ce169bb0d96b86f585587d259583a10d5cd56edca
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/amd64

  Name:      docker.io/username/demo:latest@sha256:2b77acdfea5dc5baa489ffab2a0b4a387666d1d526490e31845eb64e3e73ed20
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm64

  Name:      docker.io/username/demo:latest@sha256:723c22f366ae44e419d12706453a544ae92711ae52f510e226f6467d8228d191
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm/v7
```
@z

@x
The image is now available on Docker Hub with the tag `username/demo:latest`. You
can use this image to run a container on Intel laptops, Amazon EC2 A1 instances,
Raspberry Pis, and on other architectures. Docker pulls the correct image for the
current architecture, so Raspberry Pis run the 32-bit Arm version and EC2 A1
instances run 64-bit Arm. The SHA tags identify a fully qualified image variant.
You can also run images targeted for a different architecture on Docker Desktop.
@y
Docker Hub 上から`username/demo:latest`というタグにより、イメージが利用可能となりました。
このイメージを使って、Intel ノート PC、Amazon EC2 A1 インスタンス、Raspberry Pi などのアーキテクチャー上でのコンテナー実行が可能となりました。
Docker は、現状のアーキテクチャーに対応した正しいイメージをプルします。
したがって Raspberry Pi では 32 ビット ARM バージョン、EC2 A1 インスタンスでは 64 ビット ARM バージョンが動作します。
SHA タグは、各イメージバリアントを識別するものです。
Docker Desktop 上において、別アーキテクチャー向けのイメージを実行することもできます。
@z

@x
You can run the images using the SHA tag, and verify the architecture. For
example, when you run the following on a macOS:
@y
SHA タグを用いてイメージを実行することができ、アーキテクチャーの確認を行うことができます。
たとえば macOS 上において以下を実行します。
@z

@x
 ```console
$ docker run --rm docker.io/username/demo:latest@sha256:2b77acdfea5dc5baa489ffab2a0b4a387666d1d526490e31845eb64e3e73ed20 uname -m
aarch64
```
@y
```console
$ docker run --rm docker.io/username/demo:latest@sha256:2b77acdfea5dc5baa489ffab2a0b4a387666d1d526490e31845eb64e3e73ed20 uname -m
aarch64
```
@z

@x
```console
$ docker run --rm docker.io/username/demo:latest@sha256:723c22f366ae44e419d12706453a544ae92711ae52f510e226f6467d8228d191 uname -m
armv7l
```
@y
```console
$ docker run --rm docker.io/username/demo:latest@sha256:723c22f366ae44e419d12706453a544ae92711ae52f510e226f6467d8228d191 uname -m
armv7l
```
@z

@x
In the above example, `uname -m` returns `aarch64` and `armv7l` as expected,
even when running the commands on a native macOS or Windows developer machine.
@y
この例では、`uname -m`から期待する戻り値は、それぞれ`aarch64`と`armv7l`です。
macOS または Windows のネイティブな開発マシン上において、このコマンドを実行していても、戻り値はこのようになります。
@z
