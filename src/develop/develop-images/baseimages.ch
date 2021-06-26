%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to create base images
keywords: images, base image, examples
redirect_from:
- /engine/articles/baseimages/
- /engine/userguide/eng-image/baseimages/
title: Create a base image
---
@y
---
description: ベースイメージを生成する方法。
keywords: images, base image, examples
redirect_from:
- /engine/articles/baseimages/
- /engine/userguide/eng-image/baseimages/
title: ベースイメージの生成
---
@z

@x
Most Dockerfiles start from a parent image. If you need to completely control
the contents of your image, you might need to create a base image instead.
Here's the difference:
@y
Dockerfile は普通は親イメージから作り始めます。
イメージ内容を完全にコントロールする場合は、ベースイメージを作り出すこともあります。
その違いは以下のとおりです。
@z

@x
- A [parent image](../../glossary.md#parent-image) is the image that your
  image is based on. It refers to the contents of the `FROM` directive in the
  Dockerfile. Each subsequent declaration in the Dockerfile modifies this parent
  image. Most Dockerfiles start from a parent image, rather than a base image.
  However, the terms are sometimes used interchangeably.
@y
- [親イメージ](../../glossary.md#parent-image) は基準とするイメージのことです。
  Dockerfile 内の`FROM`ディレクティブによって指定されます。
  Dockerfile 内のこれに続く定義は、その親イメージを修正指示するものとなります。
  Dockerfile は普通は親イメージから作り始め、ベースイメージから作るのはまれです。
  ただしこの用語は混同されて用いられることもあります。
@z

@x
- A [base image](../../glossary.md#base-image) has `FROM scratch` in its Dockerfile.
@y
- [ベースイメージ](../../glossary.md#base-image) は Dockerfile において`FROM scratch`に記述されるものです。
@z

@x
This topic shows you several ways to create a base image. The specific process
will depend heavily on the Linux distribution you want to package. We have some
examples below, and you are encouraged to submit pull requests to contribute new
ones.
@y
ここではベースイメージの生成方法をいくつか示します。
パッケージ化しようとしている Linux ディストリビューションに大きく依存する処理操作もあります。
以下に例をあげていきます。
新たなイメージを提供して頂ける場合は、プルリクエストをあげることをお願いします。
@z

@x
## Create a full image using tar
@y
## tar を使ったフルイメージの生成
{: #create-a-full-image-using-tar }
@z

@x
In general, start with a working machine that is running
the distribution you'd like to package as a parent image, though that is
not required for some tools like Debian's
[Debootstrap](https://wiki.debian.org/Debootstrap), which you can also
use to build Ubuntu images.
@y
通常であれば、作業マシン上に稼動するディストリビューションを使い、これを親イメージとしてパッケージにしていくことになります。
しかし Debian の [Debootstrap](https://wiki.debian.org/Debootstrap) のようなツールを使えば作業マシンは不要であり、ここから Ubuntu イメージを作ることもできます。
@z

@x
It can be as simple as this to create an Ubuntu parent image:
@y
Ubuntu の親イメージを作るのは、以下のように簡単にできます。
@z

@x
    $ sudo debootstrap focal focal > /dev/null
    $ sudo tar -C focal -c . | docker import - focal
@y
    $ sudo debootstrap focal focal > /dev/null
    $ sudo tar -C focal -c . | docker import - focal
@z

@x
    sha256:81ec9a55a92a5618161f68ae691d092bf14d700129093158297b3d01593f4ee3
@y
    sha256:81ec9a55a92a5618161f68ae691d092bf14d700129093158297b3d01593f4ee3
@z

@x
    $ docker run focal cat /etc/lsb-release
@y
    $ docker run focal cat /etc/lsb-release
@z

@x
    DISTRIB_ID=Ubuntu
    DISTRIB_RELEASE=20.04
    DISTRIB_CODENAME=focal
    DISTRIB_DESCRIPTION="Ubuntu 20.04 LTS"
@y
    DISTRIB_ID=Ubuntu
    DISTRIB_RELEASE=20.04
    DISTRIB_CODENAME=focal
    DISTRIB_DESCRIPTION="Ubuntu 20.04 LTS"
@z

@x
There are more example scripts for creating parent images in [the Docker
GitHub repository](https://github.com/docker/docker/blob/master/contrib).
@y
[Docker GitHub レポジトリ](https://github.com/docker/docker/blob/master/contrib) には、親イメージを生成するスクリプトの例がいろいろとあります。
@z

@x
## Create a simple parent image using scratch
@y
{: #create-a-simple-parent-image-using-scratch }
## 単純な親イメージを一から生成
@z

@x
You can use Docker's reserved, minimal image, `scratch`, as a starting point for
building containers. Using the `scratch` "image" signals to the build process
that you want the next command in the `Dockerfile` to be the first filesystem
layer in your image.
@y
Docker が規定する最小イメージ`scratch`は、コンテナーを構築するベースイメージとして利用できます。
`scratch`を利用すると「イメージ」は、`Dockerfile`内の次に実行したいコマンドの構築プロセスに対して、最初のファイルシステムレイヤーとなるように指示を出します。
@z

@x
While `scratch` appears in Docker's repository on the hub, you can't pull it,
run it, or tag any image with the name `scratch`. Instead, you can refer to it
in your `Dockerfile`. For example, to create a minimal container using
`scratch`:
@y
Docker Hub 上の Docker リポジトリとして`scratch`が登場したことにより、`scratch`という名前を使ったイメージのアップロード、実行、タグづけはできなくなりました。
そのかわり`Dockerfile`内での参照のみが可能です。
たとえば`scratch`を利用した最小コンテナーの生成は以下のようになります。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM scratch
ADD hello /
CMD ["/hello"]
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM scratch
ADD hello /
CMD ["/hello"]
```
@z

@x
Assuming you built the "hello" executable example by following the instructions
at
[https://github.com/docker-library/hello-world/](https://github.com/docker-library/hello-world/),
and you compiled it with the `-static` flag, you can build this Docker
image using this `docker build` command:
@y
[https://github.com/docker-library/hello-world/](https://github.com/docker-library/hello-world/)に示されている手順に従って、"hello" 実行モジュールの例を構築するとします。
実行モジュールは`-static`フラグをつけてコンパイルします。
Docker イメージは`docker build`コマンドによってビルドすることができます。
@z

@x
```bash
docker build --tag hello .
```
@y
```bash
docker build --tag hello .
```
@z

@x
Don't forget the `.` character at the end, which sets the build context to the
current directory.
@y
`.`の文字を最後につけるのを忘れないでください。
これはビルドコンテキストをカレントディレクトリに設定するものです。
@z

@x
> **Note**: Because Docker Desktop for Mac and Docker Desktop for Windows use a Linux VM,
> you need a Linux binary, rather than a Mac or Windows binary.
> You can use a Docker container to build it:
>
> ```bash
> $ docker run --rm -it -v $PWD:/build ubuntu:20.04
>
> container# apt-get update && apt-get install build-essential
> container# cd /build
> container# gcc -o hello -static hello.c
> ```
@y
> **メモ**
>
> Docker Desktop for Mac と Docker Desktop for Windows では Linux VM を利用するため、Mac や Windows の実行バイナリではなく Linux の実行バイナリが必要になります。
> Docker コンテナーを使って以下のようにビルドします。
>
> ```bash
> $ docker run --rm -it -v $PWD:/build ubuntu:20.04
>
> container# apt-get update && apt-get install build-essential
> container# cd /build
> container# gcc -o hello -static hello.c
> ```
@z

@x
To run your new image, use the `docker run` command:
@y
新イメージは`docker run`コマンドを使って実行します。
@z

@x
```bash
docker run --rm hello
```
@y
```bash
docker run --rm hello
```
@z

@x
This example creates the hello-world image used in the tutorials.
If you want to test it out, you can clone
[the image repo](https://github.com/docker-library/hello-world).
@y
この例は、チュートリアルにおいて用いられている hello-world イメージを生成します。
これを試してみたい場合は、[イメージリポジトリ](https://github.com/docker-library/hello-world)をクローンすることができます。
@z

@x
## More resources
@y
## その他の情報
{: #more-resources }
@z

@x
There are lots of resources available to help you write your `Dockerfile`.
@y
`Dockerfile`の書き方については、他にも多く触れています。
@z

@x
* There's a [complete guide to all the instructions](../../engine/reference/builder.md) available for use in a `Dockerfile` in the reference section.
* To help you write a clear, readable, maintainable `Dockerfile`, we've also
written a [`Dockerfile` best practices guide](dockerfile_best-practices.md).
* If your goal is to create a new Official Image, be sure to read up on Docker's [Official Images](../../docker-hub/official_images.md).
@y
* リファレンスには`Dockerfile`にて利用可能な [全コマンドのガイド](../../engine/reference/builder.md) があります。
* `Dockerfile`をわかりやすく読みやすく、保守がしやすくするように、[`Dockerfile`ベストプラクティス](dockerfile_best-practices.md) も記述しています。
* 公式イメージを作ることが目的であれば Docker の[公式イメージ](../../docker-hub/official_images/) を確認してください。
@z
