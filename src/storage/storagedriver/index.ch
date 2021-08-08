%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn the technologies that support storage drivers.
keywords: container, storage, driver, AUFS, btrfs, devicemapper, overlayfs, vfs, zfs
title: About storage drivers
redirect_from:
- /en/latest/terms/layer/
- /engine/installation/userguide/storagedriver/
- /engine/userguide/storagedriver/imagesandcontainers/
- /storage/storagedriver/imagesandcontainers/
---
@y
---
description: Learn the technologies that support storage drivers.
keywords: container, storage, driver, AUFS, btrfs, devicemapper, overlayfs, vfs, zfs
title: ストレージドライバーについて
redirect_from:
- /en/latest/terms/layer/
- /engine/installation/userguide/storagedriver/
- /engine/userguide/storagedriver/imagesandcontainers/
- /storage/storagedriver/imagesandcontainers/
---
@z

@x
To use storage drivers effectively, it's important to know how Docker builds and
stores images, and how these images are used by containers. You can use this
information to make informed choices about the best way to persist data from
your applications and avoid performance problems along the way.
@y
ストレージドライバーを効率よく利用するためには、Docker がどのようにしてイメージをビルドし保存するのか、またそのイメージをコンテナーがどのように利用するのかを理解しておくことが重要です。
これがわかっていれば、その知識に基づいた判断として、アプリケーションデータの適切な保存方法や、アプリケーション稼動中のパフォーマンス問題に対して、最良の方策をとることができます。
@z

%@x
%Storage drivers allow you to create data in the writable layer of your container.
%The files won't be persisted after the container is deleted, and both read and
%write speeds are lower than native file system performance. 
%@y
%ストレージドライバーは、コンテナー内の書き込み可能なレイヤーにデータを保存するものです。
%これがファイルデータであると、コンテナーが削除された後にデータは維持されず、通常のファイルシステム上でのパフォーマンスに比べて、読み書きの速度は低下します。
%@z

%@x
% > **Note**: Operations that are known to be problematic include write-intensive database storage,
%particularly when pre-existing data exists in the read-only layer. More details are provided in this document.
%@y
% > **メモ**: 問題が発生すると言われる処理として、書き込みを重点的に行うデータベースストレージの利用があります。
% > 特に読み込み専用レイヤーに既にデータが存在している場合が挙げられます。
% > 詳しくは本文にて説明します。
%@z

%@x
%[Learn how to use volumes](../volumes.md) to persist data and improve performance.
%@y
%[ボリューム利用方法について学ぶ](../volumes.md) を参照してデータ保存方法やパフォーマンス改善について確認してください。
%@z

@x
## Storage drivers versus Docker volumes
@y
{: #storage-drivers-versus-docker-volumes }
## ストレージドライバー vs. Docker ボリューム
@z

@x
Docker uses storage drivers to store image layers, and to store data in the
writable layer of a container. The container's writable layer does not persist
after the container is deleted, but is suitable for storing ephemeral data that
is generated at runtime. Storage drivers are optimized for space efficiency, but
(depending on the storage driver) write speeds are lower than native file system
performance, especially for storage drivers that a use copy-on-write filesystem.
Write-intensive applications, such as database storage, are impacted by a
performance overhead, particularly if pre-existing data exists in the read-only
layer.
@y
Docker uses storage drivers to store image layers, and to store data in the
writable layer of a container. The container's writable layer does not persist
after the container is deleted, but is suitable for storing ephemeral data that
is generated at runtime. Storage drivers are optimized for space efficiency, but
(depending on the storage driver) write speeds are lower than native file system
performance, especially for storage drivers that a use copy-on-write filesystem.
Write-intensive applications, such as database storage, are impacted by a
performance overhead, particularly if pre-existing data exists in the read-only
layer.
@z

@x
Use Docker volumes for write-intensive data, data that must persist beyond the
container's lifespan, and data that must be shared between containers. Refer to
the [volumes section](../volumes.md) to learn how to use volumes to persist data
and improve performance.
@y
Use Docker volumes for write-intensive data, data that must persist beyond the
container's lifespan, and data that must be shared between containers. Refer to
the [volumes section](../volumes.md) to learn how to use volumes to persist data
and improve performance.
@z

@x
## Images and layers
@y
{: #images-and-layers }
## イメージとレイヤー
@z

@x
A Docker image is built up from a series of layers. Each layer represents an
instruction in the image's Dockerfile. Each layer except the very last one is
read-only. Consider the following Dockerfile:
@y
Docker イメージは一連のレイヤーから構成されます。
個々のレイヤーは、そのイメージの Dockerfile 内にある 1 つの命令に対応づいています。
一番最後にあるレイヤーを除き、これ以外はすべて読み込み専用のレイヤーです。
たとえば以下のような Dockerfile を考えてみます。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:18.04
LABEL org.opencontainers.image.authors="org@example.com"
COPY . /app
RUN make /app
RUN rm -r $HOME/.cache
CMD python /app/app.py
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:18.04
LABEL org.opencontainers.image.authors="org@example.com"
COPY . /app
RUN make /app
RUN rm -r $HOME/.cache
CMD python /app/app.py
```
@z

%@x
%This Dockerfile contains four commands, each of which creates a layer. The
%`FROM` statement starts out by creating a layer from the `ubuntu:18.04` image.
%The `COPY` command adds some files from your Docker client's current directory.
%The `RUN` command builds your application using the `make` command. Finally,
%the last layer specifies what command to run within the container.
%@y
%この Dockerfile には 4 つのコマンドがあります。
%コマンドのそれぞれが 1 つのレイヤーを生成します。
%まずは`FROM`命令によって`ubuntu:18.04`イメージから 1 つのレイヤーが生成されるところから始まります。
%`COPY`命令は Docker クライアントのカレントディレクトリから複数のファイルを追加します。
%`RUN`命令は`make`コマンドを実行してアプリケーションをビルドします。
%そして最後のレイヤーが、コンテナー内にて実行するべきコマンドを指定しています。
%@z
@x
This Dockerfile contains four commands. Commands that modify the filesystem create
a layer. The`FROM` statement starts out by creating a layer from the `ubuntu:18.04`
image. The `LABEL` command only modifies the image's metadata, and does not produce
a new layer. The `COPY` command adds some files from your Docker client's current
directory. The first `RUN` command builds your application using the `make` command,
and writes the result to a new layer. The second `RUN` command removes a cache
directory, and writes the result to a new layer. Finally, the `CMD` instruction
specifies what command to run within the container, which only modifies the
image's metadata, which does not produce an image layer.
@y
This Dockerfile contains four commands. Commands that modify the filesystem create
a layer. The`FROM` statement starts out by creating a layer from the `ubuntu:18.04`
image. The `LABEL` command only modifies the image's metadata, and does not produce
a new layer. The `COPY` command adds some files from your Docker client's current
directory. The first `RUN` command builds your application using the `make` command,
and writes the result to a new layer. The second `RUN` command removes a cache
directory, and writes the result to a new layer. Finally, the `CMD` instruction
specifies what command to run within the container, which only modifies the
image's metadata, which does not produce an image layer.
@z

%@x
%Each layer is only a set of differences from the layer before it. The layers are
%stacked on top of each other. When you create a new container, you add a new
%writable layer on top of the underlying layers. This layer is often called the
%"container layer". All changes made to the running container, such as writing
%new files, modifying existing files, and deleting files, are written to this thin
%writable container layer. The diagram below shows a container based on the Ubuntu
%15.04 image.
%@y
%各レイヤーは、その直前のレイヤーからの差異だけを保持します。
%そしてレイヤーは順に積み上げられていきます。
%新しいコンテナーを生成したときには、それまで存在していたレイヤー群の最上部に、新たな書き込み可能なレイヤーが加えられます。
%このレイヤーは「コンテナーレイヤー」と呼ばれることがあります。
%実行中のコンテナーに対して実行される変更処理すべて、たとえば新規ファイル生成、既存ファイル修正、ファイル削除といったことは、その薄い皮のような書き込み可能なコンテナーレイヤーに対して書き込まれます。
%以下の図は Ubuntu 15.04 イメージに基づいて生成されたコンテナーを表わしています。
%@z
@x
Each layer is only a set of differences from the layer before it. Note that both
_adding_, and _removing_ files will result in a new layer. In the example above,
the `$HOME/.cache` directory is removed, but will still be available in the
previous layer and add up to the image's total size. Refer to the
[Best practices for writing Dockerfiles](../../develop/develop-images/dockerfile_best-practices.md)
and [use multi-stage builds](../../develop/develop-images/multistage-build.md)
sections to learn how to optimize your Dockerfiles for efficient images.
@y
Each layer is only a set of differences from the layer before it. Note that both
_adding_, and _removing_ files will result in a new layer. In the example above,
the `$HOME/.cache` directory is removed, but will still be available in the
previous layer and add up to the image's total size. Refer to the
[Best practices for writing Dockerfiles](../../develop/develop-images/dockerfile_best-practices.md)
and [use multi-stage builds](../../develop/develop-images/multistage-build.md)
sections to learn how to optimize your Dockerfiles for efficient images.
@z

@x
The layers are stacked on top of each other. When you create a new container,
you add a new writable layer on top of the underlying layers. This layer is often
called the "container layer". All changes made to the running container, such as
writing new files, modifying existing files, and deleting files, are written to
this thin writable container layer. The diagram below shows a container based
on an `ubuntu:15.04` image.
@y
The layers are stacked on top of each other. When you create a new container,
you add a new writable layer on top of the underlying layers. This layer is often
called the "container layer". All changes made to the running container, such as
writing new files, modifying existing files, and deleting files, are written to
this thin writable container layer. The diagram below shows a container based
on an `ubuntu:15.04` image.
@z

@x
![Layers of a container based on the Ubuntu image](images/container-layers.jpg)
@y
![Ubuntu イメージに基づくコンテナーのレイヤー](images/container-layers.jpg)
@z

@x
A _storage driver_ handles the details about the way these layers interact with
each other. Different storage drivers are available, which have advantages
and disadvantages in different situations.
@y
**ストレージドライバー** というものは、そういった各レイヤーが互いにやり取りできるようにします。
さまざまなストレージドライバーが利用可能であり、利用状況に応じて一長一短があります。
@z

@x
## Container and layers
@y
{: #container-and-layers }
## コンテナーとレイヤー
@z

@x
The major difference between a container and an image is the top writable layer.
All writes to the container that add new or modify existing data are stored in
this writable layer. When the container is deleted, the writable layer is also
deleted. The underlying image remains unchanged.
@y
コンテナーとイメージの大きな違いは、最上部に書き込みレイヤーがあるかどうかです。
コンテナーに対して新たに加えられたり修正されたりしたデータは、すべてこの書き込みレイヤーに保存されます。
コンテナーが削除されると、その書き込みレイヤーも同じく削除されます。
ただしその元にあったイメージは、変更されずに残ります。
@z

@x
Because each container has its own writable container layer, and all changes are
stored in this container layer, multiple containers can share access to the same
underlying image and yet have their own data state. The diagram below shows
multiple containers sharing the same Ubuntu 15.04 image.
@y
複数のコンテナーを見た場合、そのコンテナーごとに個々の書き込み可能なコンテナーレイヤーがあって、データ更新結果はそのコンテナーレイヤーに保存されます。
したがって複数コンテナーでは、同一のイメージを共有しながらアクセスすることができ、しかも個々に見れば独自の状態を持つことができることになります。
以下の図は、Ubuntu 15.04 という同一のイメージを共有する複数コンテナーを示しています。
@z

@x
![Containers sharing same image](images/sharing-layers.jpg)
@y
![同一のイメージを共有する複数コンテナー](images/sharing-layers.jpg)
@z

@x
Docker uses storage drivers to manage the contents of the image layers and the
writable container layer. Each storage driver handles the implementation
differently, but all drivers use stackable image layers and the copy-on-write
(CoW) strategy.
@y
Docker はストレージドライバーを利用して、イメージレイヤーと書き込み可能なコンテナーレイヤーの各内容を管理します。
さまざまなストレージドライバーでは、異なる実装によりデータを扱います。
しかしどのようなドライバーであっても、積み上げ可能な（stackable）イメージレイヤーを取り扱い、コピーオンライト（copy-on-write; CoW）方式を採用します。
@z

@x
> **Note**
>
> Use Docker volumes if you need multiple containers to have shared access to
> the exact same data. Refer to the [volumes section](../volumes.md) to learn
> about volumes.
@y
> **メモ**
>
> 複数イメージを必要としていて、さらに同一のデータを共有してアクセスしたい場合は、Docker ボリュームを用いてください。
> ボリュームについての詳細は [ボリュームの節](../volumes.md) を参照してください。
@z

@x
## Container size on disk
@y
{: #container-size-on-disk }
## ディスク上のコンテナーサイズ
@z

@x
To view the approximate size of a running container, you can use the `docker ps -s`
command. Two different columns relate to size.
@y
稼働中コンテナーの概算サイズを確認するには`docker ps -s`コマンドを実行します。
サイズに関連した 2 つのデータがカラム表示されます。
@z

@x
- `size`: the amount of data (on disk) that is used for the writable layer of
  each container.
@y
- `size`＝（ディスク上の）データ総量。
  各コンテナーの書き込みレイヤーが利用するデータ部分です。
@z

@x
- `virtual size`: the amount of data used for the read-only image data
  used by the container plus the container's writable layer `size`.
  Multiple containers may share some or all read-only
  image data. Two containers started from the same image share 100% of the
  read-only data, while two containers with different images which have layers
  in common share those common layers. Therefore, you can't just total the
  virtual sizes. This over-estimates the total disk usage by a potentially
  non-trivial amount.
@y
- `virtual size`＝ コンテナーにおいて利用されている読み込み専用のイメージデータと、コンテナーの書き込みレイヤーの`size`を足し合わせたデータ総量。
  複数コンテナーにおいては、読み込み専用イメージデータの全部または一部を共有しているかもしれません。
  1 つのイメージをベースとして作った 2 つのコンテナーでは、読み込み専用データを 100% 共有します。
  一方で 2 つの異なるイメージが一部に共通するレイヤーを持っていて、そこからそれぞれに 2 つのコンテナーを作ったとすると、共有するのはその共通レイヤー部分のみです。
  したがって`virtual size`は単純に足し合わせで計算できるものではありません。
  これはディスク総量を多く見積もってしまい、その量は無視できないほどになることがあります。
@z

@x
The total disk space used by all of the running containers on disk is some
combination of each container's `size` and the `virtual size` values. If
multiple containers started from the same exact image, the total size on disk for
these containers would be SUM (`size` of containers) plus one image size
(`virtual size`- `size`).
@y
起動しているコンテナーすべてが利用するディスク総量は、各コンテナーの`size`と`virtual size`を適宜組み合わせた値になります。
1 つのイメージだけに基づいた複数コンテナーの場合、そのディスク総量は、すべての`size`の合計に 1 つのイメージサイズ（`virtual size`- `size`）を加えて得られます。
@z

@x
This also does not count the following additional ways a container can take up
disk space:
@y
またコンテナーがディスク領域を消費するものであっても、以下に示す状況はディスク総量の算定には含まれません。
@z

@x
- Disk space used for log files stored by the [logging-driver](../../config/containers/logging/index.md).
  This can be non-trivial if your container generates a large amount of logging
  data and log rotation is not configured.
@y
- [ログドライバー](../../config/containers/logging/index.md) を利用している場合に、そのログファイルが利用するディスク量。
  コンテナーにおいてログ出力を大量に行っていて、ログローテーションを用いていない場合には、このディスク量は無視できないものになります。
@z

@x
- Volumes and bind mounts used by the container.
- Disk space used for the container's configuration files, which are typically
  small.
- Memory written to disk (if swapping is enabled).
- Checkpoints, if you're using the experimental checkpoint/restore feature.
@y
- コンテナーが利用するボリュームやバインドマウント。
- コンテナーの設定ファイルが利用するディスク領域。
  そのデータ容量は少ないのが普通です。
- （スワップが有効である場合に）ディスクに書き込まれるメモリデータ。
- 試験的な checkpoint/restore 機能を利用している場合のチェックポイント。
@z

@x
## The copy-on-write (CoW) strategy
@y
{: #the-copy-on-write-cow-strategy }
## コピーオンライト方式
@z

@x
Copy-on-write is a strategy of sharing and copying files for maximum efficiency.
If a file or directory exists in a lower layer within the image, and another
layer (including the writable layer) needs read access to it, it just uses the
existing file. The first time another layer needs to modify the file (when
building the image or running the container), the file is copied into that layer
and modified. This minimizes I/O and the size of each of the subsequent layers.
These advantages are explained in more depth below.
@y
コピーオンライト（copy-on-write; CoW）は、ファイルの共有とコピーを最も効率よく行う方式です。
イメージ内の下の方にあるレイヤーに、ファイルやディレクトリが存在していた場合に、別のレイヤー（書き込みレイヤーを含む）からの読み込みアクセスが必要であるとします。
このときには、当然のことながら存在しているそのファイルを利用します。
そのファイルを修正する必要のある別のレイヤーがあったとすると、これを初めて修正するとき（イメージがビルドされたときやコンテナーが起動したときなど）、そのファイルはレイヤーにコピーされた上で修正されます。
こうすることで入出力を最小限に抑え、次に続くレイヤーの各サイズも増やさずに済みます。
この利点に関しては、さらに詳しく後述します。
@z

@x
### Sharing promotes smaller images
@y
{: #sharing-promotes-smaller-images }
### 共有によりイメージサイズはより小さく
@z

@x
When you use `docker pull` to pull down an image from a repository, or when you
create a container from an image that does not yet exist locally, each layer is
pulled down separately, and stored in Docker's local storage area, which is
usually `/var/lib/docker/` on Linux hosts. You can see these layers being pulled
in this example:
@y
`docker pull`を実行してリポジトリからイメージをプルするとき、あるいはイメージから新たにコンテナーを生成するにあたってそのイメージがまだローカルに生成されていないとき、各レイヤーはプルによって個別に取得されて、Docker のローカル保存領域、たとえば Linux では通常`/var/lib/docker/`に保存されます。
取得された各レイヤーは、以下の例のようにして確認することができます。
@z

@x
```console
$ docker pull ubuntu:18.04
18.04: Pulling from library/ubuntu
f476d66f5408: Pull complete
8882c27f669e: Pull complete
d9af21273955: Pull complete
f5029279ec12: Pull complete
Digest: sha256:ab6cb8de3ad7bb33e2534677f865008535427390b117d7939193f8d1a6613e34
Status: Downloaded newer image for ubuntu:18.04
```
@y
```console
$ docker pull ubuntu:18.04
18.04: Pulling from library/ubuntu
f476d66f5408: Pull complete
8882c27f669e: Pull complete
d9af21273955: Pull complete
f5029279ec12: Pull complete
Digest: sha256:ab6cb8de3ad7bb33e2534677f865008535427390b117d7939193f8d1a6613e34
Status: Downloaded newer image for ubuntu:18.04
```
@z

@x
Each of these layers is stored in its own directory inside the Docker host's
local storage area. To examine the layers on the filesystem, list the contents
of `/var/lib/docker/<storage-driver>`. This example uses the `overlay2` 
storage driver:
@y
各レイヤーは、Docker ホストのローカル保存領域内にて、それぞれのディレクトリ配下に保存されます。
ファイルシステム上のレイヤーデータを確認するなら、`/var/lib/docker/<storage-driver>`の内容を一覧表示します。
以下は`overlay2`ストレージドライバーに対する例です。
@z

@x
```console
$ ls /var/lib/docker/overlay2
16802227a96c24dcbeab5b37821e2b67a9f921749cd9a2e386d5a6d5bc6fc6d3
377d73dbb466e0bc7c9ee23166771b35ebdbe02ef17753d79fd3571d4ce659d7
3f02d96212b03e3383160d31d7c6aeca750d2d8a1879965b89fe8146594c453d
ec1ec45792908e90484f7e629330666e7eee599f08729c93890a7205a6ba35f5
l
```
@y
```console
$ ls /var/lib/docker/overlay2
16802227a96c24dcbeab5b37821e2b67a9f921749cd9a2e386d5a6d5bc6fc6d3
377d73dbb466e0bc7c9ee23166771b35ebdbe02ef17753d79fd3571d4ce659d7
3f02d96212b03e3383160d31d7c6aeca750d2d8a1879965b89fe8146594c453d
ec1ec45792908e90484f7e629330666e7eee599f08729c93890a7205a6ba35f5
l
```
@z

@x
The directory names do not correspond to the layer IDs.
@y
ディレクトリ名はレイヤー ID に対応するものではありません。
@z

@x
Now imagine that you have two different Dockerfiles. You use the first one to
create an image called `acme/my-base-image:1.0`.
@y
ここで 2 つの異なる Dockerfile を利用している状況を考えます。
1 つめの Dockerfile からは`acme/my-base-image:1.0`というイメージが作られるものとします。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN apk add --no-cache bash
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN apk add --no-cache bash
```
@z

@x
The second one is based on `acme/my-base-image:1.0`, but has some additional
layers:
@y
2 つめの Dockerfile は`acme/my-base-image:1.0`をベースとして、さらにレイヤーを追加するものとします。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM acme/my-base-image:1.0
COPY . /app
RUN chmod +x /app/hello.sh
CMD /app/hello.sh
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM acme/my-base-image:1.0
COPY . /app
RUN chmod +x /app/hello.sh
CMD /app/hello.sh
```
@z

%@x
%The second image contains all the layers from the first image, plus a new layer
%with the `CMD` instruction, and a read-write container layer. Docker already
%has all the layers from the first image, so it does not need to pull them again.
%The two images share any layers they have in common.
%@y
%2 つめのイメージには 1 つめのイメージが持つレイヤーがすべて含まれ、さらに`CMD`命令による新たなレイヤーと、読み書き可能なコンテナーレイヤーが加わっています。
%Docker にとって 1 つめのイメージにおけるレイヤーはすべて取得済であるため、再度プルによって取得する必要がありません。
%2 つのイメージにおいて共通して存在しているレイヤーは、すべて共有します。
%@z
@x
The second image contains all the layers from the first image, plus new layers
created by the `COPY` and `RUN` instructions, and a read-write container layer.
Docker already has all the layers from the first image, so it does not need to
pull them again. The two images share any layers they have in common.
@y
2 つめのイメージには 1 つめのイメージが持つレイヤーがすべて含まれ、さらに`COPY`と`RUN`命令による新たなレイヤーと、読み書き可能なコンテナーレイヤーが加わっています。
Docker にとって 1 つめのイメージにおけるレイヤーはすべて取得済であるため、再度プルによって取得する必要がありません。
2 つのイメージにおいて共通して存在しているレイヤーは、すべて共有します。
@z

@x
If you build images from the two Dockerfiles, you can use `docker image ls` and
`docker image history` commands to verify that the cryptographic IDs of the shared
layers are the same.
@y
この 2 つの Dockerfile からイメージをビルドした場合、`docker image ls`や`docker image history`コマンドを使ってみると、共有されているレイヤーに対する暗号化 ID は同一になっていることがわかります。
@z

@x
1.  Make a new directory `cow-test/` and change into it.
@y
1.  新規に`cow-test/`というディレクトリを生成して移動します。
@z

@x
2.  Within `cow-test/`, create a new file called `hello.sh` with the following contents:
@y
2.  `cow-test/`ディレクトリにて、以下の内容で新規ファイル`hello.sh`を生成します。
@z

@x
    ```bash
    #!/usr/bin/env bash
    echo "Hello world"
    ```
@y
    ```bash
    #!/usr/bin/env bash
    echo "Hello world"
    ```
@z

@x
3.  Copy the contents of the first Dockerfile above into a new file called
    `Dockerfile.base`.
@y
3.  前述した 1 つめの Dockerfile の内容を、新規ファイル`Dockerfile.base`にコピーします。
@z

@x
4.  Copy the contents of the second Dockerfile above into a new file called
    `Dockerfile`.
@y
4.  前述した 2 つめの Dockerfile の内容を、新規ファイル`Dockerfile`にコピーします。
@z

@x
5.  Within the `cow-test/` directory, build the first image. Don't forget to
    include the final `.` in the command. That sets the `PATH`, which tells
    Docker where to look for any files that need to be added to the image.
@y
5.  `cow-test/`ディレクトリ内にて 1 つめのイメージをビルドします。
    コマンドでは最後の`.`を記述するのを忘れないでください。
    これは`PATH`を指定するものであり、イメージに対してファイルの追加が必要となる場合に、そのファイルを探し出す場所を Docker に指示するものです。
@z

@x
    ```console
    $ docker build -t acme/my-base-image:1.0 -f Dockerfile.base .
    [+] Building 6.0s (11/11) FINISHED
    => [internal] load build definition from Dockerfile.base                                      0.4s
    => => transferring dockerfile: 116B                                                           0.0s
    => [internal] load .dockerignore                                                              0.3s
    => => transferring context: 2B                                                                0.0s
    => resolve image config for docker.io/docker/dockerfile:1                                     1.5s
    => [auth] docker/dockerfile:pull token for registry-1.docker.io                               0.0s
    => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:9e2c9eca7367393aecc68795c671... 0.0s
    => [internal] load .dockerignore                                                              0.0s
    => [internal] load build definition from Dockerfile.base                                      0.0s
    => [internal] load metadata for docker.io/library/alpine:latest                               0.0s
    => CACHED [1/2] FROM docker.io/library/alpine                                                 0.0s
    => [2/2] RUN apk add --no-cache bash                                                          3.1s
    => exporting to image                                                                         0.2s
    => => exporting layers                                                                        0.2s
    => => writing image sha256:da3cf8df55ee9777ddcd5afc40fffc3ead816bda99430bad2257de4459625eaa   0.0s
    => => naming to docker.io/acme/my-base-image:1.0                                              0.0s
    ```
@y
    ```console
    $ docker build -t acme/my-base-image:1.0 -f Dockerfile.base .
    [+] Building 6.0s (11/11) FINISHED
    => [internal] load build definition from Dockerfile.base                                      0.4s
    => => transferring dockerfile: 116B                                                           0.0s
    => [internal] load .dockerignore                                                              0.3s
    => => transferring context: 2B                                                                0.0s
    => resolve image config for docker.io/docker/dockerfile:1                                     1.5s
    => [auth] docker/dockerfile:pull token for registry-1.docker.io                               0.0s
    => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:9e2c9eca7367393aecc68795c671... 0.0s
    => [internal] load .dockerignore                                                              0.0s
    => [internal] load build definition from Dockerfile.base                                      0.0s
    => [internal] load metadata for docker.io/library/alpine:latest                               0.0s
    => CACHED [1/2] FROM docker.io/library/alpine                                                 0.0s
    => [2/2] RUN apk add --no-cache bash                                                          3.1s
    => exporting to image                                                                         0.2s
    => => exporting layers                                                                        0.2s
    => => writing image sha256:da3cf8df55ee9777ddcd5afc40fffc3ead816bda99430bad2257de4459625eaa   0.0s
    => => naming to docker.io/acme/my-base-image:1.0                                              0.0s
    ```
@z

@x
6.  Build the second image.
@y
6.  2 つめのイメージをビルドします。
@z

@x
    ```console
    $ docker build -t acme/my-final-image:1.0 -f Dockerfile .
@y
    ```console
    $ docker build -t acme/my-final-image:1.0 -f Dockerfile .
@z

@x
    [+] Building 3.6s (12/12) FINISHED
    => [internal] load build definition from Dockerfile                                            0.1s
    => => transferring dockerfile: 156B                                                            0.0s
    => [internal] load .dockerignore                                                               0.1s
    => => transferring context: 2B                                                                 0.0s
    => resolve image config for docker.io/docker/dockerfile:1                                      0.5s
    => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:9e2c9eca7367393aecc68795c671...  0.0s
    => [internal] load .dockerignore                                                               0.0s
    => [internal] load build definition from Dockerfile                                            0.0s
    => [internal] load metadata for docker.io/acme/my-base-image:1.0                               0.0s
    => [internal] load build context                                                               0.2s
    => => transferring context: 340B                                                               0.0s
    => [1/3] FROM docker.io/acme/my-base-image:1.0                                                 0.2s
    => [2/3] COPY . /app                                                                           0.1s
    => [3/3] RUN chmod +x /app/hello.sh                                                            0.4s
    => exporting to image                                                                          0.1s
    => => exporting layers                                                                         0.1s
    => => writing image sha256:8bd85c42fa7ff6b33902ada7dcefaaae112bf5673873a089d73583b0074313dd    0.0s
    => => naming to docker.io/acme/my-final-image:1.0                                              0.0s
    ```
@y
    [+] Building 3.6s (12/12) FINISHED
    => [internal] load build definition from Dockerfile                                            0.1s
    => => transferring dockerfile: 156B                                                            0.0s
    => [internal] load .dockerignore                                                               0.1s
    => => transferring context: 2B                                                                 0.0s
    => resolve image config for docker.io/docker/dockerfile:1                                      0.5s
    => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:9e2c9eca7367393aecc68795c671...  0.0s
    => [internal] load .dockerignore                                                               0.0s
    => [internal] load build definition from Dockerfile                                            0.0s
    => [internal] load metadata for docker.io/acme/my-base-image:1.0                               0.0s
    => [internal] load build context                                                               0.2s
    => => transferring context: 340B                                                               0.0s
    => [1/3] FROM docker.io/acme/my-base-image:1.0                                                 0.2s
    => [2/3] COPY . /app                                                                           0.1s
    => [3/3] RUN chmod +x /app/hello.sh                                                            0.4s
    => exporting to image                                                                          0.1s
    => => exporting layers                                                                         0.1s
    => => writing image sha256:8bd85c42fa7ff6b33902ada7dcefaaae112bf5673873a089d73583b0074313dd    0.0s
    => => naming to docker.io/acme/my-final-image:1.0                                              0.0s
    ```
@z

@x
7.  Check out the sizes of the images:
@y
7.  2 つのイメージのサイズを確認します。
@z

@x
    ```console
    $ docker image ls
@y
    ```console
    $ docker image ls
@z

@x
    REPOSITORY             TAG     IMAGE ID         CREATED               SIZE
    acme/my-final-image    1.0     8bd85c42fa7f     About a minute ago    7.75MB
    acme/my-base-image     1.0     da3cf8df55ee     2 minutes ago         7.75MB
    ```
@y
    REPOSITORY             TAG     IMAGE ID         CREATED               SIZE
    acme/my-final-image    1.0     8bd85c42fa7f     About a minute ago    7.75MB
    acme/my-base-image     1.0     da3cf8df55ee     2 minutes ago         7.75MB
    ```
@z

@x
8.  Check out the history of each image:
@y
8.  それぞれのイメージの履歴を確認します。
@z

@x
    ```console
    $ docker image history acme/my-base-image:1.0

    IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
    da3cf8df55ee   5 minutes ago   RUN /bin/sh -c apk add --no-cache bash # bui…   2.15MB    buildkit.dockerfile.v0
    <missing>      7 weeks ago     /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
    <missing>      7 weeks ago     /bin/sh -c #(nop) ADD file:f278386b0cef68136…   5.6MB
    ```
@y
    ```console
    $ docker image history acme/my-base-image:1.0

    IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
    da3cf8df55ee   5 minutes ago   RUN /bin/sh -c apk add --no-cache bash # bui…   2.15MB    buildkit.dockerfile.v0
    <missing>      7 weeks ago     /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
    <missing>      7 weeks ago     /bin/sh -c #(nop) ADD file:f278386b0cef68136…   5.6MB
    ```
@z

@x
    Some steps do not have a size (`0B`), and are metadata-only changes, which do
    not produce an image layer and do not take up any size, other than the metadata
    itself. The output above shows that this image consists of 2 image layers.
@y
    処理ステップの中にはサイズを持たないもの (`0B`) があります。
    メタデータだけが変更されたものであって、イメージレイヤーが生成されたものではないため、メタデータそのものを除くと、容量をまったく取っていません。
    上の出力結果から、このイメージは 2 つのイメージレイヤーから構成されることがわかります。
@z

@x
    ```console
    $ docker image history  acme/my-final-image:1.0

    IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
    8bd85c42fa7f   3 minutes ago   CMD ["/bin/sh" "-c" "/app/hello.sh"]            0B        buildkit.dockerfile.v0
    <missing>      3 minutes ago   RUN /bin/sh -c chmod +x /app/hello.sh # buil…   39B       buildkit.dockerfile.v0
    <missing>      3 minutes ago   COPY . /app # buildkit                          222B      buildkit.dockerfile.v0
    <missing>      4 minutes ago   RUN /bin/sh -c apk add --no-cache bash # bui…   2.15MB    buildkit.dockerfile.v0
    <missing>      7 weeks ago     /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
    <missing>      7 weeks ago     /bin/sh -c #(nop) ADD file:f278386b0cef68136…   5.6MB
@y
    ```console
    $ docker image history  acme/my-final-image:1.0

    IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
    8bd85c42fa7f   3 minutes ago   CMD ["/bin/sh" "-c" "/app/hello.sh"]            0B        buildkit.dockerfile.v0
    <missing>      3 minutes ago   RUN /bin/sh -c chmod +x /app/hello.sh # buil…   39B       buildkit.dockerfile.v0
    <missing>      3 minutes ago   COPY . /app # buildkit                          222B      buildkit.dockerfile.v0
    <missing>      4 minutes ago   RUN /bin/sh -c apk add --no-cache bash # bui…   2.15MB    buildkit.dockerfile.v0
    <missing>      7 weeks ago     /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
    <missing>      7 weeks ago     /bin/sh -c #(nop) ADD file:f278386b0cef68136…   5.6MB
@z

%@x
%    Notice that all the layers are identical except the top layer of the second
%    image. All the other layers are shared between the two images, and are only
%    stored once in `/var/lib/docker/`. The new layer actually doesn't take any
%    room at all, because it is not changing any files, but only running a command.
%@y
%    ほぼすべてのレイヤーが同一であって、ただ 2 つめのイメージの最上位レイヤーだけが違うのがわかります。
%    これを除けば、すべてのレイヤーが 2 つのイメージ間で共有されているので、各レイヤーは`/var/lib/docker/`には一度しか保存されません。
%    新たにできたレイヤーは、まったくと言ってよいほどに容量をとっていません。
%    というのも、そのレイヤーは何かのファイルを変更するわけでなく、単にコマンドを実行するだけのものであるからです。
%@z
@x
    Notice that all steps of the first image are also included in the final
    image. The final image includes the two layers from the first image, and
    two layers that were added in the second image.
@y
    Notice that all steps of the first image are also included in the final
    image. The final image includes the two layers from the first image, and
    two layers that were added in the second image.
@z

@x
    > What are the `<missing>` steps?
    > 
    > The `<missing>` lines in the `docker history` output indicate that those
    > steps were either built on another system and part of the `alpine` image
    > that was pulled from Docker Hub, or were built with BuildKit as builder.
    > Before BuildKit, the "classic" builder would produce a new "intermediate"
    > image for each step for caching purposes, and the `IMAGE` column would show
    > the ID of that image.
    > BuildKit uses its own caching mechanism, and no longer requires intermediate
    > images for caching. Refer to [build images with BuildKit](../../develop/develop-images/build_enhancements.md)
    > to learn more about other enhancements made in BuildKit.
@y
    > What are the `<missing>` steps?
    > 
    > The `<missing>` lines in the `docker history` output indicate that those
    > steps were either built on another system and part of the `alpine` image
    > that was pulled from Docker Hub, or were built with BuildKit as builder.
    > Before BuildKit, the "classic" builder would produce a new "intermediate"
    > image for each step for caching purposes, and the `IMAGE` column would show
    > the ID of that image.
    > BuildKit uses its own caching mechanism, and no longer requires intermediate
    > images for caching. Refer to [build images with BuildKit](../../develop/develop-images/build_enhancements.md)
    > to learn more about other enhancements made in BuildKit.
@z

@x
9.  Check out the layers for each image
@y
9.  Check out the layers for each image
@z

@x
    Use the `docker image inspect` command to view the cryptographic IDs of the
    layers in each image:
@y
    Use the `docker image inspect` command to view the cryptographic IDs of the
    layers in each image:
@z

@x
    {% raw %}
    ```console
    $ docker image inspect --format "{{json .RootFS.Layers}}" acme/my-final-image:1.0
    [
      "sha256:72e830a4dff5f0d5225cdc0a320e85ab1ce06ea5673acfe8d83a7645cbd0e9cf",
      "sha256:07b4a9068b6af337e8b8f1f1dae3dd14185b2c0003a9a1f0a6fd2587495b204a"
    ]
    ```
    {% endraw %}
@y
    {% raw %}
    ```console
    $ docker image inspect --format "{{json .RootFS.Layers}}" acme/my-final-image:1.0
    [
      "sha256:72e830a4dff5f0d5225cdc0a320e85ab1ce06ea5673acfe8d83a7645cbd0e9cf",
      "sha256:07b4a9068b6af337e8b8f1f1dae3dd14185b2c0003a9a1f0a6fd2587495b204a"
    ]
    ```
    {% endraw %}
@z

%@x
%    > **Note**: The `<missing>` lines in the `docker history` output indicate
%    > that those layers were built on another system and are not available
%    > locally. This can be ignored.
%@y
%    > **メモ**
%    >
%    > `docker history`の出力において`<missing>`として示される行は、そのレイヤーが他のシステムにおいてビルドされていることを示しています。
%    > したがってローカルシステム上では利用することができません。
%    > この表示は無視して構いません。
%@z

@x
    {% raw %}
    ```console
    $ docker image inspect --format "{{json .RootFS.Layers}}" acme/my-base-image:1.0
    [
      "sha256:72e830a4dff5f0d5225cdc0a320e85ab1ce06ea5673acfe8d83a7645cbd0e9cf",
      "sha256:07b4a9068b6af337e8b8f1f1dae3dd14185b2c0003a9a1f0a6fd2587495b204a",
      "sha256:cc644054967e516db4689b5282ee98e4bc4b11ea2255c9630309f559ab96562e",
      "sha256:e84fb818852626e89a09f5143dbc31fe7f0e0a6a24cd8d2eb68062b904337af4"
    ]
    ```
    {% endraw %}
@y
    {% raw %}
    ```console
    $ docker image inspect --format "{{json .RootFS.Layers}}" acme/my-base-image:1.0
    [
      "sha256:72e830a4dff5f0d5225cdc0a320e85ab1ce06ea5673acfe8d83a7645cbd0e9cf",
      "sha256:07b4a9068b6af337e8b8f1f1dae3dd14185b2c0003a9a1f0a6fd2587495b204a",
      "sha256:cc644054967e516db4689b5282ee98e4bc4b11ea2255c9630309f559ab96562e",
      "sha256:e84fb818852626e89a09f5143dbc31fe7f0e0a6a24cd8d2eb68062b904337af4"
    ]
    ```
    {% endraw %}
@z

@x
    Notice that the first two layers are identical in both images. The second
    image adds two additional layers. Shared image layers are only stored once
    in `/var/lib/docker/` and are also shared when pushing and pulling and image
    to an image registry. Shared image layers can therefore reduce network
    bandwidth and storage.
@y
    Notice that the first two layers are identical in both images. The second
    image adds two additional layers. Shared image layers are only stored once
    in `/var/lib/docker/` and are also shared when pushing and pulling and image
    to an image registry. Shared image layers can therefore reduce network
    bandwidth and storage.
@z

@x
    > Tip: format output of Docker commands with the `--format` option
    > 
    > The examples above use the `docker image inspect` command with the `--format`
    > option to view the layer IDs, formatted as a JSON array. The `--format`
    > option on Docker commands can be a powerful feature that allows you to
    > extract and format specific information from the output, without requiring
    > additional tools such as `awk` or `sed`. To learn more about formatting
    > the output of docker commands using the `--format` flag, refer to the
    > [format command and log output section](../../config/formatting.md).
    > We also pretty-printed the JSON output using the [`jq` utility](https://stedolan.github.io/jq/){: target="_blank" rel="noopener" class="_" }
    > for readability.
@y
    > Tip: format output of Docker commands with the `--format` option
    > 
    > The examples above use the `docker image inspect` command with the `--format`
    > option to view the layer IDs, formatted as a JSON array. The `--format`
    > option on Docker commands can be a powerful feature that allows you to
    > extract and format specific information from the output, without requiring
    > additional tools such as `awk` or `sed`. To learn more about formatting
    > the output of docker commands using the `--format` flag, refer to the
    > [format command and log output section](../../config/formatting.md).
    > We also pretty-printed the JSON output using the [`jq` utility](https://stedolan.github.io/jq/){: target="_blank" rel="noopener" class="_" }
    > for readability.
@z

@x
### Copying makes containers efficient
@y
{: #copying-makes-containers-efficient }
### コピーによりコンテナーを効率的に
@z

@x
When you start a container, a thin writable container layer is added on top of
the other layers. Any changes the container makes to the filesystem are stored
here. Any files the container does not change do not get copied to this writable
layer. This means that the writable layer is as small as possible.
@y
コンテナーを起動すると、それまであったレイヤーの最上部に、書き込み可能な薄いコンテナーレイヤーが加えられます。
コンテナーがファイルシステムに対して行った変更は、すべてそこに保存されます。
コンテナーが変更を行っていないファイルは、その書き込みレイヤーにはコピーされません。
つまり書き込みレイヤーは、できるだけ容量が小さく抑えられることになります。
@z

@x
When an existing file in a container is modified, the storage driver performs a
copy-on-write operation. The specifics steps involved depend on the specific
storage driver. For the `overlay2`, `overlay`, and `aufs` drivers, the 
copy-on-write operation follows this rough sequence:
@y
コンテナー内にあるファイルが修正されると、ストレージドライバーはコピーオンライト方式により動作します。
そこで実行される各処理は、ストレージドライバーによってさまざまです。
`overlay2`、`overlay`、`aufs`といったドライバーの場合、だいたい以下のような順にコピーオンライト方式による処理が行われます。
@z

@x
*  Search through the image layers for the file to update. The process starts
   at the newest layer and works down to the base layer one layer at a time.
   When results are found, they are added to a cache to speed future operations.
@y
*  更新するべきファイルをイメージレイヤー内から探します。
   この処理は最新のレイヤーから始まって、ベースレイヤーに向けて順に降りていき、一度に 1 つのレイヤーを処理していきます。
   ファイルが見つかるとこれをキャッシュに加えて、次回以降の処理スピードを上げることに備えます。
@z

@x
*  Perform a `copy_up` operation on the first copy of the file that is found, to
   copy the file to the container's writable layer.
@y
*  見つかったファイルを初めてコピーするときには`copy_up`という処理が行われます。
   これによってそのファイルをコンテナーの書き込みレイヤーにコピーします。
@z

@x
*  Any modifications are made to this copy of the file, and the container cannot
   see the read-only copy of the file that exists in the lower layer.
@y
*  修正が発生すると、コピーを行ったそのファイルが処理されます。
   つまりコンテナーは、下位のレイヤー内に存在している読み込み専用のそのファイルを見にいくことはありません。
@z

@x
Btrfs, ZFS, and other drivers handle the copy-on-write differently. You can
read more about the methods of these drivers later in their detailed
descriptions.
@y
Btrfs, ZFS といったドライバーにおけるコピーオンライト方式は、これとは異なります。
そのようなドライバーが行う手法の詳細は、後述するそれぞれの詳細説明を参照してください。
@z

@x
Containers that write a lot of data consume more space than containers
that do not. This is because most write operations consume new space in the
container's thin writable top layer. Note that changing the metadata of files,
for example, changing file permissions or ownership of a file, can also result
in a `copy_up` operation, therefore duplicating the file to the writable layer.
@y
データを大量に書き込むようなコンテナーは、そういった書き込みを行わないコンテナーに比べて、データ領域をより多く消費します。
コンテナーの最上位にある書き込み可能な薄いレイヤー上に対して、書き込み処理を行うことは、たいていが新たなデータ領域を必要とするためです。
Note that changing the metadata of files,
for example, changing file permissions or ownership of a file, can also result
in a `copy_up` operation, therefore duplicating the file to the writable layer.
@z

%@x
%> **Note**: for write-heavy applications, you should not store the data in
%> the container. Instead, use Docker volumes, which are independent of the
%> running container and are designed to be efficient for I/O. In addition,
%> volumes can be shared among containers and do not increase the size of your
%> container's writable layer.
%@y
%> **メモ**: 書き込みが頻繁に行われるアプリケーションにおいては、コンテナー内にデータを保存するべきではありません。
%> かわりに Docker ボリュームを利用してください。
%> Docker ボリュームは起動されるコンテナーからは独立していて、効率的な入出力を行うように設計されています。
%> さらにボリュームは複数のコンテナー間での共有が可能であり、書き込みレイヤーのサイズを増加させることもありません。
%@z

@x
> Tip: Use volumes for write-heavy applications
>
> For write-heavy applications, you should not store the data in the container.
> Applications, such as write-intensive database storage, are known to be
> problematic particularly when pre-existing data exists in the read-only layer.
> 
> Instead, use Docker volumes, which are independent of the running container,
> and designed to be efficient for I/O. In addition, volumes can be shared among
> containers and do not increase the size of your container's writable layer.
> Refer to the [use volumes](../volumes.md) section to learn about volumes.
@y
> Tip: Use volumes for write-heavy applications
>
> For write-heavy applications, you should not store the data in the container.
> Applications, such as write-intensive database storage, are known to be
> problematic particularly when pre-existing data exists in the read-only layer.
> 
> Instead, use Docker volumes, which are independent of the running container,
> and designed to be efficient for I/O. In addition, volumes can be shared among
> containers and do not increase the size of your container's writable layer.
> Refer to the [use volumes](../volumes.md) section to learn about volumes.
@z

@x
A `copy_up` operation can incur a noticeable performance overhead. This overhead
is different depending on which storage driver is in use. Large files,
lots of layers, and deep directory trees can make the impact more noticeable.
This is mitigated by the fact that each `copy_up` operation only occurs the first
time a given file is modified.
@y
`copy_up`処理は際立った性能のオーバーヘッドを招きます。
このオーバーヘッドは、利用しているストレージドライバーによってさまざまです。
大容量ファイル、多数のレイヤー、深いディレクトリ階層といったものが、さらに影響します。
`copy_up`処理は対象となるファイルが初めて修正されたときにだけ実行されるので、オーバーヘッドはそれでも最小限に抑えられています。
@z

@x
To verify the way that copy-on-write works, the following procedures spins up 5
containers based on the `acme/my-final-image:1.0` image we built earlier and
examines how much room they take up.
@y
コピーオンライトが動作している様子を確認するため、以下の例においては、前述した`acme/my-final-image:1.0`イメージをベースとする 5 つのコンテナーを見ていきます。
そして各コンテナーがどれだけの容量を消費しているかを確認します。
@z

@x
1.  From a terminal on your Docker host, run the following `docker run` commands.
    The strings at the end are the IDs of each container.
@y
1.  Docker ホスト上の端末画面から、以下のような`docker run`コマンドを実行します。
    各行の終わりには、各コンテナーの ID を入力します。
@z

@x
    ```console
    $ docker run -dit --name my_container_1 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_2 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_3 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_4 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_5 acme/my-final-image:1.0 bash
@y
    ```console
    $ docker run -dit --name my_container_1 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_2 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_3 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_4 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_5 acme/my-final-image:1.0 bash
@z

@x
    40ebdd7634162eb42bdb1ba76a395095527e9c0aa40348e6c325bd0aa289423c
    a5ff32e2b551168b9498870faf16c9cd0af820edf8a5c157f7b80da59d01a107
    3ed3c1a10430e09f253704116965b01ca920202d52f3bf381fbb833b8ae356bc
    939b3bf9e7ece24bcffec57d974c939da2bdcc6a5077b5459c897c1e2fa37a39
    cddae31c314fbab3f7eabeb9b26733838187abc9a2ed53f97bd5b04cd7984a5a
    ```
@y
    40ebdd7634162eb42bdb1ba76a395095527e9c0aa40348e6c325bd0aa289423c
    a5ff32e2b551168b9498870faf16c9cd0af820edf8a5c157f7b80da59d01a107
    3ed3c1a10430e09f253704116965b01ca920202d52f3bf381fbb833b8ae356bc
    939b3bf9e7ece24bcffec57d974c939da2bdcc6a5077b5459c897c1e2fa37a39
    cddae31c314fbab3f7eabeb9b26733838187abc9a2ed53f97bd5b04cd7984a5a
    ```
@z

@x
2.  Run the `docker ps` command with the `--size` option to verify the 5 containers
    are running, and to see each container's size.
@y
2.  `--size`オプションを使って`docker ps`コマンドを実行し、5 つのコンテナーが実行中であることを確認します。
    そして各コンテナーのサイズを見てみます。
@z

@x
    {% raw %}
    ```console
    $ docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"

    CONTAINER ID   IMAGE                     NAMES            SIZE
    cddae31c314f   acme/my-final-image:1.0   my_container_5   0B (virtual 7.75MB)
    939b3bf9e7ec   acme/my-final-image:1.0   my_container_4   0B (virtual 7.75MB)
    3ed3c1a10430   acme/my-final-image:1.0   my_container_3   0B (virtual 7.75MB)
    a5ff32e2b551   acme/my-final-image:1.0   my_container_2   0B (virtual 7.75MB)
    40ebdd763416   acme/my-final-image:1.0   my_container_1   0B (virtual 7.75MB)
    ```
    {% endraw %}
@y
    {% raw %}
    ```console
    $ docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"

    CONTAINER ID   IMAGE                     NAMES            SIZE
    cddae31c314f   acme/my-final-image:1.0   my_container_5   0B (virtual 7.75MB)
    939b3bf9e7ec   acme/my-final-image:1.0   my_container_4   0B (virtual 7.75MB)
    3ed3c1a10430   acme/my-final-image:1.0   my_container_3   0B (virtual 7.75MB)
    a5ff32e2b551   acme/my-final-image:1.0   my_container_2   0B (virtual 7.75MB)
    40ebdd763416   acme/my-final-image:1.0   my_container_1   0B (virtual 7.75MB)
    ```
    {% endraw %}
@z

@x
    The output above shows that all containers share the image's read-only layers
    (7.75MB), but no data was written to the container's filesystem, so no additional
    storage is used for the containers.
@y
    The output above shows that all containers share the image's read-only layers
    (7.75MB), but no data was written to the container's filesystem, so no additional
    storage is used for the containers.
@z

@x
    > Advanced: metadata and logs storage used for containers
    >
    > **Note**: This step requires a Linux machine, and does not work on Docker
    > Desktop for Mac or Docker Desktop for Windows, as it requires access to
    > the Docker Daemon's file storage.
    >
    > While the output of `docker ps` provides you information about disk space
    > consumed by a container's writable layer, it does not include information
    > about metadata and log-files stored for each container.
    >
    > More details can be obtained my exploring the Docker Daemon's storage location
    > (`/var/lib/docker` by default).
    >
    > ```console
    > $ sudo du -sh /var/lib/docker/containers/*
    >
    > 36K  /var/lib/docker/containers/3ed3c1a10430e09f253704116965b01ca920202d52f3bf381fbb833b8ae356bc
    > 36K  /var/lib/docker/containers/40ebdd7634162eb42bdb1ba76a395095527e9c0aa40348e6c325bd0aa289423c
    > 36K  /var/lib/docker/containers/939b3bf9e7ece24bcffec57d974c939da2bdcc6a5077b5459c897c1e2fa37a39
    > 36K  /var/lib/docker/containers/a5ff32e2b551168b9498870faf16c9cd0af820edf8a5c157f7b80da59d01a107
    > 36K  /var/lib/docker/containers/cddae31c314fbab3f7eabeb9b26733838187abc9a2ed53f97bd5b04cd7984a5a
    > ```
    >
    > Each of these containers only takes up 36k of space on the filesystem.
@y
    > Advanced: metadata and logs storage used for containers
    >
    > **Note**: This step requires a Linux machine, and does not work on Docker
    > Desktop for Mac or Docker Desktop for Windows, as it requires access to
    > the Docker Daemon's file storage.
    >
    > While the output of `docker ps` provides you information about disk space
    > consumed by a container's writable layer, it does not include information
    > about metadata and log-files stored for each container.
    >
    > More details can be obtained my exploring the Docker Daemon's storage location
    > (`/var/lib/docker` by default).
    >
    > ```console
    > $ sudo du -sh /var/lib/docker/containers/*
    >
    > 36K  /var/lib/docker/containers/3ed3c1a10430e09f253704116965b01ca920202d52f3bf381fbb833b8ae356bc
    > 36K  /var/lib/docker/containers/40ebdd7634162eb42bdb1ba76a395095527e9c0aa40348e6c325bd0aa289423c
    > 36K  /var/lib/docker/containers/939b3bf9e7ece24bcffec57d974c939da2bdcc6a5077b5459c897c1e2fa37a39
    > 36K  /var/lib/docker/containers/a5ff32e2b551168b9498870faf16c9cd0af820edf8a5c157f7b80da59d01a107
    > 36K  /var/lib/docker/containers/cddae31c314fbab3f7eabeb9b26733838187abc9a2ed53f97bd5b04cd7984a5a
    > ```
    >
    > Each of these containers only takes up 36k of space on the filesystem.
@z

@x
3. Per-container storage

    To demonstrate this, run the following command to write the word 'hello' to
    a file on the container's writable layer in containers `my_container_1`,
    `my_container_2`, and `my_container_3`:
@y
3. Per-container storage

    To demonstrate this, run the following command to write the word 'hello' to
    a file on the container's writable layer in containers `my_container_1`,
    `my_container_2`, and `my_container_3`:
@z

@x
    ```console
    $ for i in {1..3}; do docker exec my_container_$i sh -c 'printf hello > /out.txt'; done
    ```
@y
    ```console
    $ for i in {1..3}; do docker exec my_container_$i sh -c 'printf hello > /out.txt'; done
    ```
@z

@x
    Running the `docker ps` command again afterward shows that those containers
    now consume 5 bytes each. This data is unique to each container, and not
    shared. The read-only layers of the containers are not affected, and are still
    shared by all containers.
@y
    Running the `docker ps` command again afterward shows that those containers
    now consume 5 bytes each. This data is unique to each container, and not
    shared. The read-only layers of the containers are not affected, and are still
    shared by all containers.
@z

@x
   {% raw %}
    ```console
    $ docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"

    CONTAINER ID   IMAGE                     NAMES            SIZE
    cddae31c314f   acme/my-final-image:1.0   my_container_5   0B (virtual 7.75MB)
    939b3bf9e7ec   acme/my-final-image:1.0   my_container_4   0B (virtual 7.75MB)
    3ed3c1a10430   acme/my-final-image:1.0   my_container_3   5B (virtual 7.75MB)
    a5ff32e2b551   acme/my-final-image:1.0   my_container_2   5B (virtual 7.75MB)
    40ebdd763416   acme/my-final-image:1.0   my_container_1   5B (virtual 7.75MB)
    ```
   {% endraw %}
@y
   {% raw %}
    ```console
    $ docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"

    CONTAINER ID   IMAGE                     NAMES            SIZE
    cddae31c314f   acme/my-final-image:1.0   my_container_5   0B (virtual 7.75MB)
    939b3bf9e7ec   acme/my-final-image:1.0   my_container_4   0B (virtual 7.75MB)
    3ed3c1a10430   acme/my-final-image:1.0   my_container_3   5B (virtual 7.75MB)
    a5ff32e2b551   acme/my-final-image:1.0   my_container_2   5B (virtual 7.75MB)
    40ebdd763416   acme/my-final-image:1.0   my_container_1   5B (virtual 7.75MB)
    ```
   {% endraw %}
@z

%@x
%Not only does copy-on-write save space, but it also reduces start-up time.
%When you start a container (or multiple containers from the same image), Docker
%only needs to create the thin writable container layer.
%@y
%コピーオンライト方式は容量を抑えるだけでなく、起動時間も節約します。
%コンテナーを起動するとき（あるいは同一イメージからなる複数コンテナーを起動するとき）、Docker が必要とするのは、書き込み可能な薄いコンテナーレイヤーを生成することだけだからです。
%@z
@x
The examples above illustrate how copy-on-write filesystems help making containers
efficient. Not only does copy-on-write save space, but it also reduces container
start-up time. When you create a container (or multiple containers from the same
image), Docker only needs to create the thin writable container layer.
@y
The examples above illustrate how copy-on-write filesystems help making containers
efficient. Not only does copy-on-write save space, but it also reduces container
start-up time. When you create a container (or multiple containers from the same
image), Docker only needs to create the thin writable container layer.
@z

%@x
%If Docker had to make an entire copy of the underlying image stack each time it
%started a new container, container start times and disk space used would be
%significantly increased. This would be similar to the way that virtual machines
%work, with one or more virtual disks per virtual machine.
%@y
%仮に Docker が新たなコンテナーを起動するたびに、その元にあるイメージ層をすべてコピーしなければならないとしたら、起動時間やディスク容量は著しく増大しているはずです。
%このことは仮想マシン技術において、複数の仮想ディスクが仮想マシン 1 つに対して動作している様子にも似ています。
%@z
@x
If Docker had to make an entire copy of the underlying image stack each time it
created a new container, container create times and disk space used would be
significantly increased. This would be similar to the way that virtual machines
work, with one or more virtual disks per virtual machine. The [`vfs` storage](vfs-driver.md)
does not provide a CoW filesystem or other optimizations. When using this storage
driver, a full copy of the image's data is created for each container.
@y
If Docker had to make an entire copy of the underlying image stack each time it
created a new container, container create times and disk space used would be
significantly increased. This would be similar to the way that virtual machines
work, with one or more virtual disks per virtual machine. The [`vfs` storage](vfs-driver.md)
does not provide a CoW filesystem or other optimizations. When using this storage
driver, a full copy of the image's data is created for each container.
@z

@x
## Related information
@y
{: #related-information }
## 関連情報
@z

@x
* [Volumes](../volumes.md)
* [Select a storage driver](select-storage-driver.md)
@y
* [ボリューム](../volumes.md)
* [ストレージドライバーの選定](select-storage-driver.md)
@z
