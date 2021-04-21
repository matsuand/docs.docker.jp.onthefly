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

@x
Storage drivers allow you to create data in the writable layer of your container.
The files won't be persisted after the container is deleted, and both read and
write speeds are lower than native file system performance. 
@y
ストレージドライバーは、コンテナー内の書き込み可能なレイヤーにデータを保存するものです。
これがファイルデータであると、コンテナーが削除された後にデータは維持されず、通常のファイルシステム上でのパフォーマンスに比べて、読み書きの速度は低下します。
@z

@x
 > **Note**: Operations that are known to be problematic include write-intensive database storage,
particularly when pre-existing data exists in the read-only layer. More details are provided in this document.
@y
 > **メモ**: 問題が発生すると言われる処理として、書き込みを重点的に行うデータベースストレージの利用があります。
 > 特に読み込み専用レイヤーに既にデータが存在している場合が挙げられます。
 > 詳しくは本文にて説明します。
@z

@x
[Learn how to use volumes](../volumes.md) to persist data and improve performance.
@y
[ボリューム利用方法について学ぶ](../volumes.md) を参照してデータ保存方法やパフォーマンス改善について確認してください。
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
COPY . /app
RUN make /app
CMD python /app/app.py
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:18.04
COPY . /app
RUN make /app
CMD python /app/app.py
```
@z

@x
This Dockerfile contains four commands, each of which creates a layer. The
`FROM` statement starts out by creating a layer from the `ubuntu:18.04` image.
The `COPY` command adds some files from your Docker client's current directory.
The `RUN` command builds your application using the `make` command. Finally,
the last layer specifies what command to run within the container.
@y
この Dockerfile には 4 つのコマンドがあります。
コマンドのそれぞれが 1 つのレイヤーを生成します。
まずは`FROM`命令によって`ubuntu:18.04`イメージから 1 つのレイヤーが生成されるところから始まります。
`COPY`命令は Docker クライアントのカレントディレクトリから複数のファイルを追加します。
`RUN`命令は`make`コマンドを実行してアプリケーションをビルドします。
そして最後のレイヤーが、コンテナー内にて実行するべきコマンドを指定しています。
@z

@x
Each layer is only a set of differences from the layer before it. The layers are
stacked on top of each other. When you create a new container, you add a new
writable layer on top of the underlying layers. This layer is often called the
"container layer". All changes made to the running container, such as writing
new files, modifying existing files, and deleting files, are written to this thin
writable container layer. The diagram below shows a container based on the Ubuntu
15.04 image.
@y
各レイヤーは、その直前のレイヤーからの差異だけを保持します。
そしてレイヤーは順に積み上げられていきます。
新しいコンテナーを生成したときには、それまで存在していたレイヤー群の最上部に、新たな書き込み可能なレイヤーが加えられます。
このレイヤーは「コンテナーレイヤー」と呼ばれることがあります。
実行中のコンテナーに対して実行される変更処理すべて、たとえば新規ファイル生成、既存ファイル修正、ファイル削除といったことは、その薄い皮のような書き込み可能なコンテナーレイヤーに対して書き込まれます。
以下の図は Ubuntu 15.04 イメージに基づいて生成されたコンテナーを表わしています。
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
> **Note**: If you need multiple images to have shared access to the exact
> same data, store this data in a Docker volume and mount it into your
> containers.
@y
> **メモ**
>
> 複数イメージを必要としていて、さらに同一のデータを共有してアクセスしたい場合は、そのデータを Docker ボリュームに保存して、コンテナー内でそれをマウントします。
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
- Disk space used for log files if you use the `json-file` logging driver. This
  can be non-trivial if your container generates a large amount of logging data
  and log rotation is not configured.
- Volumes and bind mounts used by the container.
- Disk space used for the container's configuration files, which are typically
  small.
- Memory written to disk (if swapping is enabled).
- Checkpoints, if you're using the experimental checkpoint/restore feature.
@y
- ログドライバー`json-file`を利用している場合に、そのログファイルが利用するディスク量。
  コンテナーにおいてログ出力を大量に行っていて、ログローテーションを用いていない場合には、このディスク量は無視できないものになります。
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
```bash
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
```bash
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
```bash
$ ls /var/lib/docker/overlay2
16802227a96c24dcbeab5b37821e2b67a9f921749cd9a2e386d5a6d5bc6fc6d3
377d73dbb466e0bc7c9ee23166771b35ebdbe02ef17753d79fd3571d4ce659d7
3f02d96212b03e3383160d31d7c6aeca750d2d8a1879965b89fe8146594c453d
ec1ec45792908e90484f7e629330666e7eee599f08729c93890a7205a6ba35f5
l
```
@y
```bash
$ ls /var/lib/docker/overlay2
16802227a96c24dcbeab5b37821e2b67a9f921749cd9a2e386d5a6d5bc6fc6d3
377d73dbb466e0bc7c9ee23166771b35ebdbe02ef17753d79fd3571d4ce659d7
3f02d96212b03e3383160d31d7c6aeca750d2d8a1879965b89fe8146594c453d
ec1ec45792908e90484f7e629330666e7eee599f08729c93890a7205a6ba35f5
l
```
@z

@x
The directory names do not correspond to the layer IDs (this has been true since
Docker 1.10).
@y
ディレクトリ名はレイヤー ID に対応するものではありません。
（Docker 1.10 以前は対応づいていました。）
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
FROM ubuntu:18.04
COPY . /app
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:18.04
COPY . /app
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
CMD /app/hello.sh
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM acme/my-base-image:1.0
CMD /app/hello.sh
```
@z

@x
The second image contains all the layers from the first image, plus a new layer
with the `CMD` instruction, and a read-write container layer. Docker already
has all the layers from the first image, so it does not need to pull them again.
The two images share any layers they have in common.
@y
2 つめのイメージには 1 つめのイメージが持つレイヤーがすべて含まれ、さらに`CMD`命令による新たなレイヤーと、読み書き可能なコンテナーレイヤーが加わっています。
Docker にとって 1 つめのイメージにおけるレイヤーはすべて取得済であるため、再度プルによって取得する必要がありません。
2 つのイメージにおいて共通して存在しているレイヤーは、すべて共有します。
@z

@x
If you build images from the two Dockerfiles, you can use `docker image ls` and
`docker history` commands to verify that the cryptographic IDs of the shared
layers are the same.
@y
この 2 つの Dockerfile からイメージをビルドした場合、`docker image ls`や`docker history`コマンドを使ってみると、共有されているレイヤーに対する暗号化 ID は同一になっていることがわかります。
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
    #!/bin/sh
    echo "Hello world"
    ```
@y
    ```bash
    #!/bin/sh
    echo "Hello world"
    ```
@z

@x
    Save the file, and make it executable:
@y
    ファイルを保存して実行可能にします。
@z

@x
    ```bash
    chmod +x hello.sh
    ```
@y
    ```bash
    chmod +x hello.sh
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
    Sending build context to Docker daemon  812.4MB
    Step 1/2 : FROM ubuntu:18.04
     ---> d131e0fa2585
    Step 2/2 : COPY . /app
     ---> Using cache
     ---> bd09118bcef6
    Successfully built bd09118bcef6
    Successfully tagged acme/my-base-image:1.0
    ```
@y
    ```console
    $ docker build -t acme/my-base-image:1.0 -f Dockerfile.base .
    Sending build context to Docker daemon  812.4MB
    Step 1/2 : FROM ubuntu:18.04
     ---> d131e0fa2585
    Step 2/2 : COPY . /app
     ---> Using cache
     ---> bd09118bcef6
    Successfully built bd09118bcef6
    Successfully tagged acme/my-base-image:1.0
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
    Sending build context to Docker daemon  4.096kB
    Step 1/2 : FROM acme/my-base-image:1.0
     ---> bd09118bcef6
    Step 2/2 : CMD /app/hello.sh
     ---> Running in a07b694759ba
     ---> dbf995fc07ff
    Removing intermediate container a07b694759ba
    Successfully built dbf995fc07ff
    Successfully tagged acme/my-final-image:1.0
    ```
@y
    Sending build context to Docker daemon  4.096kB
    Step 1/2 : FROM acme/my-base-image:1.0
     ---> bd09118bcef6
    Step 2/2 : CMD /app/hello.sh
     ---> Running in a07b694759ba
     ---> dbf995fc07ff
    Removing intermediate container a07b694759ba
    Successfully built dbf995fc07ff
    Successfully tagged acme/my-final-image:1.0
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
    REPOSITORY                         TAG                     IMAGE ID            CREATED             SIZE
    acme/my-final-image                1.0                     dbf995fc07ff        58 seconds ago      103MB
    acme/my-base-image                 1.0                     bd09118bcef6        3 minutes ago       103MB
    ```
@y
    REPOSITORY                         TAG                     IMAGE ID            CREATED             SIZE
    acme/my-final-image                1.0                     dbf995fc07ff        58 seconds ago      103MB
    acme/my-base-image                 1.0                     bd09118bcef6        3 minutes ago       103MB
    ```
@z

@x
8.  Check out the layers that comprise each image:
@y
8.  それぞれのイメージに含まれるレイヤーを確認します。
@z

@x
    ```console
    $ docker history bd09118bcef6
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    bd09118bcef6        4 minutes ago       /bin/sh -c #(nop) COPY dir:35a7eb158c1504e...   100B                
    d131e0fa2585        3 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
    <missing>           3 months ago        /bin/sh -c mkdir -p /run/systemd && echo '...   7B                  
    <missing>           3 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\...   2.78kB              
    <missing>           3 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B                  
    <missing>           3 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' >...   745B                
    <missing>           3 months ago        /bin/sh -c #(nop) ADD file:eef57983bd66e3a...   103MB      
    ```
@y
    ```console
    $ docker history bd09118bcef6
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    bd09118bcef6        4 minutes ago       /bin/sh -c #(nop) COPY dir:35a7eb158c1504e...   100B                
    d131e0fa2585        3 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
    <missing>           3 months ago        /bin/sh -c mkdir -p /run/systemd && echo '...   7B                  
    <missing>           3 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\...   2.78kB              
    <missing>           3 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B                  
    <missing>           3 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' >...   745B                
    <missing>           3 months ago        /bin/sh -c #(nop) ADD file:eef57983bd66e3a...   103MB      
    ```
@z

@x
    ```console
    $ docker history dbf995fc07ff
@y
    ```console
    $ docker history dbf995fc07ff
@z

@x
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    dbf995fc07ff        3 minutes ago       /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "/a...   0B                  
    bd09118bcef6        5 minutes ago       /bin/sh -c #(nop) COPY dir:35a7eb158c1504e...   100B                
    d131e0fa2585        3 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
    <missing>           3 months ago        /bin/sh -c mkdir -p /run/systemd && echo '...   7B                  
    <missing>           3 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\...   2.78kB              
    <missing>           3 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B                  
    <missing>           3 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' >...   745B                
    <missing>           3 months ago        /bin/sh -c #(nop) ADD file:eef57983bd66e3a...   103MB  
    ```
@y
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    dbf995fc07ff        3 minutes ago       /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "/a...   0B                  
    bd09118bcef6        5 minutes ago       /bin/sh -c #(nop) COPY dir:35a7eb158c1504e...   100B                
    d131e0fa2585        3 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
    <missing>           3 months ago        /bin/sh -c mkdir -p /run/systemd && echo '...   7B                  
    <missing>           3 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\...   2.78kB              
    <missing>           3 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B                  
    <missing>           3 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' >...   745B                
    <missing>           3 months ago        /bin/sh -c #(nop) ADD file:eef57983bd66e3a...   103MB  
    ```
@z

@x
    Notice that all the layers are identical except the top layer of the second
    image. All the other layers are shared between the two images, and are only
    stored once in `/var/lib/docker/`. The new layer actually doesn't take any
    room at all, because it is not changing any files, but only running a command.
@y
    ほぼすべてのレイヤーが同一であって、ただ 2 つめのイメージの最上位レイヤーだけが違うのがわかります。
    これを除けば、すべてのレイヤーが 2 つのイメージ間で共有されているので、各レイヤーは`/var/lib/docker/`には一度しか保存されません。
    新たにできたレイヤーは、まったくと言ってよいほどに容量をとっていません。
    というのも、そのレイヤーは何かのファイルを変更するわけでなく、単にコマンドを実行するだけのものであるからです。
@z

@x
    > **Note**: The `<missing>` lines in the `docker history` output indicate
    > that those layers were built on another system and are not available
    > locally. This can be ignored.
@y
    > **メモ**
    >
    > `docker history`の出力において`<missing>`として示される行は、そのレイヤーが他のシステムにおいてビルドされていることを示しています。
    > したがってローカルシステム上では利用することができません。
    > この表示は無視して構いません。
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
storage driver. For the `aufs`, `overlay`, and `overlay2` drivers, the 
copy-on-write operation follows this rough sequence:
@y
コンテナー内にあるファイルが修正されると、ストレージドライバーはコピーオンライト方式により動作します。
そこで実行される各処理は、ストレージドライバーによってさまざまです。
`aufs`、`overlay`、`overlay2`といったドライバーの場合、だいたい以下のような順にコピーオンライト方式による処理が行われます。
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
container's thin writable top layer.
@y
データを大量に書き込むようなコンテナーは、そういった書き込みを行わないコンテナーに比べて、データ領域をより多く消費します。
コンテナーの最上位にある書き込み可能な薄いレイヤー上に対して、書き込み処理を行うことは、たいていが新たなデータ領域を必要とするためです。
@z

@x
> **Note**: for write-heavy applications, you should not store the data in
> the container. Instead, use Docker volumes, which are independent of the
> running container and are designed to be efficient for I/O. In addition,
> volumes can be shared among containers and do not increase the size of your
> container's writable layer.
@y
> **メモ**: 書き込みが頻繁に行われるアプリケーションにおいては、コンテナー内にデータを保存するべきではありません。
> かわりに Docker ボリュームを利用してください。
> Docker ボリュームは起動されるコンテナーからは独立していて、効率的な入出力を行うように設計されています。
> さらにボリュームは複数のコンテナー間での共有が可能であり、書き込みレイヤーのサイズを増加させることもありません。
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
> **Note**: This procedure doesn't work on Docker Desktop for Mac or Docker Desktop for Windows.
@y
> **メモ**
>
> 以下の手順は Docker Desktop for Mac または Docker Desktop for Windows では動作しません。
@z

@x
1.  From a terminal on your Docker host, run the following `docker run` commands.
    The strings at the end are the IDs of each container.
@y
1.  Docker ホスト上の端末画面から、以下のような`docker run`コマンドを実行します。
    各行の終わりには、各コンテナーの ID を入力します。
@z

@x
    ```bash
    $ docker run -dit --name my_container_1 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_2 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_3 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_4 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_5 acme/my-final-image:1.0 bash
@y
    ```bash
    $ docker run -dit --name my_container_1 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_2 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_3 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_4 acme/my-final-image:1.0 bash \
      && docker run -dit --name my_container_5 acme/my-final-image:1.0 bash
@z

@x
      c36785c423ec7e0422b2af7364a7ba4da6146cbba7981a0951fcc3fa0430c409
      dcad7101795e4206e637d9358a818e5c32e13b349e62b00bf05cd5a4343ea513
      1e7264576d78a3134fbaf7829bc24b1d96017cf2bc046b7cd8b08b5775c33d0c
      38fa94212a419a082e6a6b87a8e2ec4a44dd327d7069b85892a707e3fc818544
      1a174fc216cccf18ec7d4fe14e008e30130b11ede0f0f94a87982e310cf2e765
    ```
@y
      c36785c423ec7e0422b2af7364a7ba4da6146cbba7981a0951fcc3fa0430c409
      dcad7101795e4206e637d9358a818e5c32e13b349e62b00bf05cd5a4343ea513
      1e7264576d78a3134fbaf7829bc24b1d96017cf2bc046b7cd8b08b5775c33d0c
      38fa94212a419a082e6a6b87a8e2ec4a44dd327d7069b85892a707e3fc818544
      1a174fc216cccf18ec7d4fe14e008e30130b11ede0f0f94a87982e310cf2e765
    ```
@z

@x
2.  Run the `docker ps` command to verify the 5 containers are running.
@y
2.  `docker ps`コマンドを実行して、5 つのコンテナーが実行中であることを確認します。
@z

@x
    ```bash
    CONTAINER ID      IMAGE                     COMMAND     CREATED              STATUS              PORTS      NAMES
    1a174fc216cc      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_5
    38fa94212a41      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_4
    1e7264576d78      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_3
    dcad7101795e      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_2
    c36785c423ec      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_1
    ```
@y
    ```bash
    CONTAINER ID      IMAGE                     COMMAND     CREATED              STATUS              PORTS      NAMES
    1a174fc216cc      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_5
    38fa94212a41      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_4
    1e7264576d78      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_3
    dcad7101795e      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_2
    c36785c423ec      acme/my-final-image:1.0   "bash"      About a minute ago   Up About a minute              my_container_1
    ```
@z

@x
3.  List the contents of the local storage area.
@y
3.  ローカルの保存ディレクトリの内容を一覧表示します。
@z

@x
    ```bash
    $ sudo ls /var/lib/docker/containers
@y
    ```bash
    $ sudo ls /var/lib/docker/containers
@z

@x
    1a174fc216cccf18ec7d4fe14e008e30130b11ede0f0f94a87982e310cf2e765
    1e7264576d78a3134fbaf7829bc24b1d96017cf2bc046b7cd8b08b5775c33d0c
    38fa94212a419a082e6a6b87a8e2ec4a44dd327d7069b85892a707e3fc818544
    c36785c423ec7e0422b2af7364a7ba4da6146cbba7981a0951fcc3fa0430c409
    dcad7101795e4206e637d9358a818e5c32e13b349e62b00bf05cd5a4343ea513
    ```
@y
    1a174fc216cccf18ec7d4fe14e008e30130b11ede0f0f94a87982e310cf2e765
    1e7264576d78a3134fbaf7829bc24b1d96017cf2bc046b7cd8b08b5775c33d0c
    38fa94212a419a082e6a6b87a8e2ec4a44dd327d7069b85892a707e3fc818544
    c36785c423ec7e0422b2af7364a7ba4da6146cbba7981a0951fcc3fa0430c409
    dcad7101795e4206e637d9358a818e5c32e13b349e62b00bf05cd5a4343ea513
    ```
@z

@x
4.  Now check out their sizes:
@y
4.  各サイズを確認します。
@z

@x
    ```bash
    $ sudo du -sh /var/lib/docker/containers/*
@y
    ```bash
    $ sudo du -sh /var/lib/docker/containers/*
@z

@x
    32K  /var/lib/docker/containers/1a174fc216cccf18ec7d4fe14e008e30130b11ede0f0f94a87982e310cf2e765
    32K  /var/lib/docker/containers/1e7264576d78a3134fbaf7829bc24b1d96017cf2bc046b7cd8b08b5775c33d0c
    32K  /var/lib/docker/containers/38fa94212a419a082e6a6b87a8e2ec4a44dd327d7069b85892a707e3fc818544
    32K  /var/lib/docker/containers/c36785c423ec7e0422b2af7364a7ba4da6146cbba7981a0951fcc3fa0430c409
    32K  /var/lib/docker/containers/dcad7101795e4206e637d9358a818e5c32e13b349e62b00bf05cd5a4343ea513
    ```
@y
    32K  /var/lib/docker/containers/1a174fc216cccf18ec7d4fe14e008e30130b11ede0f0f94a87982e310cf2e765
    32K  /var/lib/docker/containers/1e7264576d78a3134fbaf7829bc24b1d96017cf2bc046b7cd8b08b5775c33d0c
    32K  /var/lib/docker/containers/38fa94212a419a082e6a6b87a8e2ec4a44dd327d7069b85892a707e3fc818544
    32K  /var/lib/docker/containers/c36785c423ec7e0422b2af7364a7ba4da6146cbba7981a0951fcc3fa0430c409
    32K  /var/lib/docker/containers/dcad7101795e4206e637d9358a818e5c32e13b349e62b00bf05cd5a4343ea513
    ```
@z

@x
    Each of these containers only takes up 32k of space on the filesystem.
@y
    各コンテナーは、ファイルシステム上において 32k しか容量をとっていません。
@z

@x
Not only does copy-on-write save space, but it also reduces start-up time.
When you start a container (or multiple containers from the same image), Docker
only needs to create the thin writable container layer.
@y
コピーオンライト方式は容量を抑えるだけでなく、起動時間も節約します。
コンテナーを起動するとき（あるいは同一イメージからなる複数コンテナーを起動するとき）、Docker が必要とするのは、書き込み可能な薄いコンテナーレイヤーを生成することだけだからです。
@z

@x
If Docker had to make an entire copy of the underlying image stack each time it
started a new container, container start times and disk space used would be
significantly increased. This would be similar to the way that virtual machines
work, with one or more virtual disks per virtual machine.
@y
仮に Docker が新たなコンテナーを起動するたびに、その元にあるイメージ層をすべてコピーしなければならないとしたら、起動時間やディスク容量は著しく増大しているはずです。
このことは仮想マシン技術において、複数の仮想ディスクが仮想マシン 1 つに対して動作している様子にも似ています。
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
