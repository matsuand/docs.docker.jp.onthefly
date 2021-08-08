%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Disk utilization
keywords: mac, disk
title: Disk utilization in Docker for Mac
---
@y
---
description: ディスク利用。
keywords: mac, disk
title: Docker for Mac におけるディスク利用
---
@z

@x
Docker Desktop stores Linux containers and images in a single, large "disk image" file in the Mac filesystem. This is different from Docker on Linux, which usually stores containers and images in the `/var/lib/docker` directory.
@y
Docker Desktop では Linux コンテナーやイメージを一つの大きな「ディスクイメージ」として Mac ファイルシステム内に保存します。
これは Linux 上の Docker とは異なっていて、Linux 上ではコンテナーやイメージは通常`/var/lib/docker`ディレクトリに保存されます。
@z

@x
## Where is the disk image file?
@y
{: #where-is-the-disk-image-file }
## ディスクイメージファイルはどこにあるか
@z

@x
To locate the disk image file, select the Docker icon and then
**Preferences** > **Resources** > **Advanced**.
@y
ディスクイメージファイルの場所を確認するには、Docker アイコンを選択して **Preferences** > **Resources** > **Advanced** を実行します。
@z

@x
![Disk preferences](images/menu/prefs-advanced.png){:width="750px"}
@y
![Disk preferences](images/menu/prefs-advanced.png){:width="750px"}
@z

@x
The **Advanced** tab displays the location of the disk image. It also displays the maximum size of the disk image and the actual space the disk image is consuming. Note that other tools might display space usage of the file in terms of the maximum file size, and not the actual file size.
@y
**Advanced** タブに、ディスクイメージの場所が表示されています。
またディスクイメージの最大サイズや、現在消費しているディスクイメージ容量も表示されています。
なおファイルの利用容量のことを最大ファイルサイズと表現しているツールがありますが、実際のファイルサイズとして表現していないから誤りです。
@z

@x
## If the file is too big
@y
{: #if-the-file-is-too-big }
## ファイルが大きすぎる場合
@z

@x
If the disk image file is too big, you can:
@y
ディスクイメージが大きくなりすぎた場合は、以下を行います。
@z

@x
- move it to a bigger drive,
- delete unnecessary containers and images, or
- reduce the maximum allowable size of the file.
@y
- より容量の大きなドライブに移動させます。
- 不要なコンテナーあるいはイメージは削除します。
- ファイルの最大許容サイズを減らします。
@z

@x
### Move the file to a bigger drive
@y
{: #move-the-file-to-a-bigger-drive }
### より大きなドライブへの移動
@z

@x
To move the disk image file to a different location:
@y
ディスクイメージを別の場所に移動するには、以下を行います。
@z

@x
1. Select **Preferences** > **Resources** > **Advanced**.
@y
1. **Preferences** > **Resources** > **Advanced** を実行します。
@z

@x
2. In the **Disk image location** section, click **Browse** and choose a new location for the disk image.
@y
2. **Disk image location**（ディスクイメージの場所）セクションにおいて、**Browse** をクリックして、ディスクイメージを置く新たな場所を選びます。
@z

@x
3. Click **Apply & Restart** for the changes to take effect.
@y
3. **Apply & Restart** をクリックして、変更内容を適用します。
@z

@x
Do not move the file directly in Finder as this can cause Docker Desktop to lose track of the file.
@y
Finder においてファイルを直接移動しないでください。
これを行うと、Docker Desktop はファイルを追跡できなくなります。
@z

@x
### Delete unnecessary containers and images
@y
{: #delete-unnecessary-containers-and-images }
### 不要コンテナー、イメージの削除
@z

@x
Check whether you have any unnecessary containers and images. If your client and daemon API are running version 1.25 or later (use the `docker version` command on the client to check your client and daemon API versions), you can see the detailed space usage information by running:
@y
不要なコンテナーやイメージが残っていないか確認します。
クライアントやデーモン API のバージョンが 1.25 またはそれ以降である場合（クライアント上にて`docker version`を実行することで、クライアントとデーモン API のバージョンを確認できます）、以下を実行すると、ディスク使用状況の詳細を確認できます。
@z

@x
```
docker system df -v
```
@y
```
docker system df -v
```
@z

@x
Alternatively, to list images, run:
@y
あるいはイメージ一覧を見るには、以下を実行します。
@z

@x
```console
$ docker image ls
```
@y
```console
$ docker image ls
```
@z

@x
and then, to list containers, run:
@y
またコンテナー一覧は以下を実行します。
@z

@x
```console
$ docker container ls -a
```
@y
```console
$ docker container ls -a
```
@z

@x
If there are lots of redundant objects, run the command:
@y
不要なオブジェクトがたくさんあるなら、以下のコマンドを実行します。
@z

@x
```console
$ docker system prune
```
@y
```console
$ docker system prune
```
@z

@x
This command removes all stopped containers, unused networks, dangling images, and build cache.
@y
このコマンドを実行すると、停止中のコンテナー、未使用のネットワーク、参照されていないイメージ、ビルドキャッシュをすべて削除します。
@z

@x
It might take a few minutes to reclaim space on the host depending on the format of the disk image file:
@y
ディスクイメージファイルのフォーマットの違いにより、空き容量を作り出すには数分の時間を要します。
@z

@x
- If the file is named `Docker.raw`: space on the host should be reclaimed within a few seconds.
- If the file is named `Docker.qcow2`: space will be freed by a background process after a few minutes.
@y
- ファイル名が`Docker.raw`の場合： ホストが空き容量を作るのに要する時間は、数秒以内です。
- ファイル名が`Docker.qcow2`の場合： 空き容量生成にはバックグラウンド処理が実行され、数分を要します。
@z

@x
Space is only freed when images are deleted. Space is not freed automatically when files are deleted inside running containers. To trigger a space reclamation at any point, run the command:
@y
容量が確保できるのは、イメージを削除できたときだけです。
ファイルが削除できたとしても、それが実行中コンテナー内であった場合は、容量の確保は自動的に行われません。
容量の確保を実行するには、以下のコマンドを実行します。
@z

@x
```
$ docker run --privileged --pid=host docker/desktop-reclaim-space
```
@y
```
$ docker run --privileged --pid=host docker/desktop-reclaim-space
```
@z

@x
Note that many tools report the maximum file size, not the actual file size.
To query the actual size of the file on the host from a terminal, run:
@y
多くのツールにおいて表示されるのは、最大ファイルサイズであって、実際のファイルサイズではありません。
ホスト上のファイルの本当のサイズを確認するには、ターミナルから以下を実行します。
@z

@x
```console
$ cd ~/Library/Containers/com.docker.docker/Data
$ cd vms/0/data
$ ls -klsh Docker.raw
2333548 -rw-r--r--@ 1 username  staff    64G Dec 13 17:42 Docker.raw
```
@y
```console
$ cd ~/Library/Containers/com.docker.docker/Data
$ cd vms/0/data
$ ls -klsh Docker.raw
2333548 -rw-r--r--@ 1 username  staff    64G Dec 13 17:42 Docker.raw
```
@z

@x
In this example, the actual size of the disk is `2333548` KB, whereas the maximum size of the disk is `64` GB.
@y
この例において、実際のディスクサイズは`2333548`KB であり、最大ディスクサイズは`64`GB です。
@z

@x
### Reduce the maximum size of the file
@y
{: #reduce-the-maximum-size-of-the-file }
### ファイルの最大許容サイズの制限
@z

@x
To reduce the maximum size of the disk image file:
@y
ディスクイメージファイルの最大サイズを減らすには、以下を行います。
@z

@x
1. Select the Docker icon and then select **Preferences** > **Resources** > **Advanced**.
@y
1. Docker アイコンを選択して **Preferences** > **Resources** > **Advanced** を実行します。
@z

@x
2. The **Disk image size** section contains a slider that allows you to change the maximum size of the disk image. Adjust the slider to set a lower limit.
@y
2. **Disk image size**（ディスクイメージサイズ）セクションにスライダーバーがあり、ディスクイメージの最大サイズを変更できるようになっています。
   このスライダーを使って、最小限のサイズを設定します。
@z

@x
3. Click **Apply & Restart**.
@y
3. **Apply & Restart** をクリックします。
@z

@x
When you reduce the maximum size, the current disk image file is deleted, and therefore, all containers and images will be lost.
@y
最大サイズを減らした場合、現在のディスクイメージファイルは削除されます。
つまりすべてのコンテナーとイメージを失うことになります。
@z
