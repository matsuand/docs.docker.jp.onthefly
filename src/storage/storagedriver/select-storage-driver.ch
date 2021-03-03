%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker storage drivers
description: Learn how to select the proper storage driver for your container.
keywords: container, storage, driver, aufs, btrfs, devicemapper, zfs, overlay, overlay2
redirect_from:
- /engine/userguide/storagedriver/
- /engine/userguide/storagedriver/selectadriver/
- /storage/storagedriver/selectadriver/
---
@y
---
title: Docker ストレージドライバー
description: Learn how to select the proper storage driver for your container.
keywords: container, storage, driver, aufs, btrfs, devicemapper, zfs, overlay, overlay2
redirect_from:
- /engine/userguide/storagedriver/
- /engine/userguide/storagedriver/selectadriver/
- /storage/storagedriver/selectadriver/
---
@z

@x
Ideally, very little data is written to a container's writable layer, and you
use Docker volumes to write data. However, some workloads require you to be able
to write to the container's writable layer. This is where storage drivers come
in.
@y
理想を言えば、コンテナーの書き込みレイヤーへのデータの書き込みは最小とし、データ出力先には Docker ボリュームを利用します。
しかし処理内容によっては、書き込みレイヤーにデータを書き込めるようにする必要が出てきます。
これがあるからこそストレージドライバーが必要になります。
@z

@x
Docker supports several different storage drivers, using a pluggable
architecture. The storage driver controls how images and containers are stored
and managed on your Docker host.
@y
Docker では複数のストレージドライバーがサポートされ、これは交換可能な、つまりプラガブルなアーキテクチャーに基づいています。
ストレージドライバーは Docker ホスト上において、イメージやコンテナーが行うデータ保存や管理を制御します。
@z

@x
After you have read the [storage driver overview](index.md), the
next step is to choose the best storage driver for your workloads. In making
this decision, there are three high-level factors to consider:
@y
[ストレージドライバーの概要](index.md) を読み終えたら、次は作業に必要となる最良のストレージドライバーを選択することです。
ドライバーを決定するにあたっては、考えておくべき高度な要因が 3 つあります。
@z

@x
If multiple storage drivers are supported in your kernel, Docker has a prioritized 
list of which storage driver to use if no storage driver is explicitly configured, 
assuming that the storage driver meets the prerequisites.
@y
利用するカーネルが複数のストレージドライバーに対応している場合に Docker は、ストレージドライバーが設定されていなかったとしても、どのストレージドライバーを用いるべきであるかを示す優先リストを持ちます。
あくまでストレージドライバーが利用できる前提条件を満たしている場合に限ります。
@z

@x
Use the storage driver with the best overall performance and stability in the most 
usual scenarios.
@y
ストレージドライバーは多くの利用状況において、最大限の性能と安定性を持つものを利用します。
@z

@x
Docker supports the following storage drivers:
@y
Docker は以下のストレージドライバーをサポートします。
@z

@x
* `overlay2` is the preferred storage driver, for all currently supported
   Linux distributions, and requires no extra configuration.
* `aufs` was the preferred storage driver for Docker 18.06 and older, when
   running on Ubuntu 14.04 on kernel 3.13 which had no support for `overlay2`.
*  `fuse-overlayfs` is preferred only for running Rootless Docker
   on a host that does not provide support for rootless `overlay2`.
   On Ubuntu and Debian 10, the `fuse-overlayfs` driver does not need to be
   used `overlay2` works even in rootless mode.
   See [Rootless mode documentation](../../engine/security/rootless.md).
* `devicemapper` is supported, but requires `direct-lvm` for production
   environments, because `loopback-lvm`, while zero-configuration, has very
   poor performance. `devicemapper` was the recommended storage driver for
   CentOS and RHEL, as their kernel version did not support `overlay2`. However,
   current versions of CentOS and RHEL now have support for `overlay2`,
   which is now the recommended driver.
 * The `btrfs` and `zfs` storage drivers are used if they are the backing
   filesystem (the filesystem of the host on which Docker is installed).
   These filesystems allow for advanced options, such as creating "snapshots",
   but require more maintenance and setup. Each of these relies on the backing
   filesystem being configured correctly.
 * The `vfs` storage driver is intended for testing purposes, and for situations
   where no copy-on-write filesystem can be used. Performance of this storage
   driver is poor, and is not generally recommended for production use.
@y
* `overlay2`は、現在サポートしている Linux ディストリビューションの中で、よく用いられているストレージドライバーです。
   特別な設定は必要ありません。
* `aufs`は Docker 18.06 あるいはそれ以前においては、よく用いられていました。
   これはカーネル 3.13 を利用する Ubuntu 14.04 において稼動していて、`overlay2`がサポートされていないときでした。
*  rootless の`overlay2`をサポートしていないホスト上において rootless Docker だけを実行するのであれば、`fuse-overlayfs`が推奨されます。
   Ubuntu や Debian 10 の場合、`fuse-overlayfs`ドライバーは rootless モードであっても、`overlay2`が動作している必要はありません。
   詳しくは [rootless モードのドキュメント](../../engine/security/rootless.md) を参照してください。
* `devicemapper`はサポートされていますが、本番環境においては`direct-lvm`を必要とします。
   というのも`loopback-lvm`は何も設定する必要がないのですが、処理性能が極めて低いためです。
   `devicemapper`は CentOS や RHEL において`overlay2`をサポートしていなかったときには、利用が推奨されていました。
   最新の CentOS と RHEL においては`overlay2`がサポートされ、今では`overlay2`が推奨ドライバーとなっています。
 * `btrfs`と`zfs`というストレージドライバーは、その名前が示すファイルシステム上において利用します。
   （ファイルシステムは Docker がインストールされているホスト上のファイルシステムを表わします。）
   このファイルシステムに対しては「snapshots」を生成するような高度なオプションがありますが、他に比べて設定と保守を必要とします。
   このドライバーを利用するためには、それぞれのファイルシステムが適切に設定できていることが必要です。
 * `vfs`ストレージドライバーはテスト目的で利用します。
   またはコピーオンライト方式のファイルシステムを利用しなくて構わない状況での利用を意図しています。
   このストレージドライバーの性能は低く、一般に本番環境での利用は推奨されません。
@z

@x
Docker's source code defines the selection order. You can see the order at
[the source code for Docker Engine {{ site.docker_ce_version }}](https://github.com/moby/moby/blob/{{ site.docker_ce_version }}/daemon/graphdriver/driver_linux.go#L52-L53)
@y
Docker のソースコードにおいては優先順位を定義しています。
その順番は [Docker Engine {{ site.docker_ce_version }} のソースコード](https://github.com/moby/moby/blob/{{ site.docker_ce_version }}/daemon/graphdriver/driver_linux.go#L52-L53) を見ればわかります。
@z

@x
If you run a different version of Docker, you can use the branch selector at the top of the file viewer to choose a different branch.
{: id="storage-driver-order" }
@y
上のサイトのファイル参照画面において Docker バージョンが利用するものと異なっている場合は、画面上部にあるブランチ切り替えボタンを使って、利用しているバージョンブランチに切り替えてください。
{: id="storage-driver-order" }
@z

@x
Some storage drivers require you to use a specific format for the backing filesystem. If you have external 
requirements to use a specific backing filesystem, this may limit your choices. See [Supported backing filesystems](#supported-backing-filesystems).
@y
ストレージドライバーにおいては、それが基づいているファイルシステムに対応した所定のフォーマットを必要とします。
特定のファイルシステムを利用するべき理由がある場合には、ドライバーの選択肢が少なくなるかもしれません。
[対応するファイルシステム](#supported-backing-filesystems) を参照してください。
@z

@x
After you have narrowed down which storage drivers you can choose from, your choice is determined by the 
characteristics of your workload and the level of stability you need. See [Other considerations](#other-considerations)
for help in making the final decision.
@y
どのストレージドライバーを利用するべきかが絞り込めてきたら、開発作業の特性や必要となる安定性に基づいて最終決定を行います。
[その他の考慮事項](#other-considerations) を参考にして、最終的な決定を行ってください。
@z

@x
> ***NOTE***: Your choice may be limited by your operating system and distribution. 
> For instance, `aufs` is only supported on Ubuntu and Debian, and may require extra packages 
> to be installed, while `btrfs` is only supported on SLES, which is only supported with Docker
> Enterprise. See [Support storage drivers per Linux distribution](#supported-storage-drivers-per-linux-distribution) 
> for more information.
@y
> **メモ**
>
> ドライバーの選択はオペレーティングシステム、ディストリビューションにより限定されることがあります。
> たとえば`aufs`は Ubuntu と Debian においてのみサポートされるものであって、しかも追加パッケージのインストールを必要とします。
> また`btrfs`は SLES に対してのみサポートされ、さらに Docker Enterprise にしか対応していません。
> 詳しくは [Linux ディストリビューションがサポートするストレージドライバー](#supported-storage-drivers-per-linux-distribution) を参照してください。
@z

@x
## Supported storage drivers per Linux distribution
@y
{: #supported-storage-drivers-per-linux-distribution }
## Linux ディストリビューションがサポートするストレージドライバー
@z

@x
At a high level, the storage drivers you can use is partially determined by
the Docker edition you use.
@y
高度なレベルでの利用を考えると、利用できるストレージドライバーは Docker エディションによってほぼ決まります。
@z

@x
In addition, Docker does not recommend any configuration that requires you to
disable security features of your operating system, such as the need to disable
`selinux` if you use the `overlay` or `overlay2` driver on CentOS.
@y
また Docker では、オペレーティングシステムのセキュリティ機能を無効にしなければならないような設定は推奨しません。
たとえば CentOS において`overlay`や`overlay2`を利用するために`selinux`を無効にするような場合です。
@z

@x
### Docker Engine - Community
@y
### Docker Engine - Community
@z

@x
For Docker Engine - Community, only some configurations are tested, and your operating
system's kernel may not support every storage driver. In general, the following
configurations work on recent versions of the Linux distribution:
@y
For Docker Engine - Community, only some configurations are tested, and your operating
system's kernel may not support every storage driver. In general, the following
configurations work on recent versions of the Linux distribution:
@z

@x
| Linux distribution  | Recommended storage drivers                                            | Alternative drivers                               |
|:--------------------|:-----------------------------------------------------------------------|:--------------------------------------------------|
| Docker Engine - Community on Ubuntu | `overlay2` or `aufs` (for Ubuntu 14.04 running on kernel 3.13)         | `overlay`¹, `devicemapper`², `zfs`, `vfs`         |
| Docker Engine - Community on Debian | `overlay2` (Debian Stretch), `aufs` or `devicemapper` (older versions) | `overlay`¹, `vfs`                                 |
| Docker Engine - Community on CentOS | `overlay2`                                                             | `overlay`¹, `devicemapper`², `zfs`, `vfs`         |
| Docker Engine - Community on Fedora | `overlay2`                                                             | `overlay`¹, `devicemapper`², `zfs`, `vfs`         |
@y
| Linux ディストリビューション  | 推奨ストレージドライバー                                     | その他のドライバー                               |
|:--------------------|:-----------------------------------------------------------------------|:--------------------------------------------------|
| Docker Engine - Community、Ubuntu | `overlay2`または`aufs`（Ubuntu 14.04、カーネル 3.13）    | `overlay`¹、`devicemapper`²、`zfs`、`vfs`         |
| Docker Engine - Community、Debian | `overlay2`（Debian Stretch）、`aufs`、`devicemapper`（旧版の場合） | `overlay`¹、`vfs`                       |
| Docker Engine - Community、CentOS | `overlay2`                                                         | `overlay`¹、`devicemapper`²、`zfs`、`vfs`  |
| Docker Engine - Community、Fedora | `overlay2`                                                         | `overlay`¹、`devicemapper`²、`zfs`、`vfs`  |
@z

@x
¹) The `overlay` storage driver is deprecated, and will be removed in a future
release. It is recommended that users of the `overlay` storage driver migrate to `overlay2`.
@y
¹) ストレージドライバー`overlay`は非推奨であり、将来のリリースにおいて削除されます。
   ストレージドライバー`overlay`のユーザーは`overlay2`に移行することが推奨されています。
@z

@x
²) The `devicemapper` storage driver is deprecated, and will be removed in a future
release. It is recommended that users of the `devicemapper` storage driver migrate
to `overlay2`.
@y
²) ストレージドライバー`devicemapper`は非推奨であり、将来のリリースにおいて削除されます。
   ストレージドライバー`devicemapper`のユーザーは`overlay2`に移行することが推奨されています。
@z

@x
> **Note**
>
> The comparison table above is not applicable for Rootless mode.
> For the drivers available in Rootless mode, see [the Rootless mode documentation](../../engine/security/rootless.md).
@y
> **メモ**
>
> 上記の一覧表は Rootless モードに対しては当てはまりません。
> Rootless モードにおいて利用可能なドライバーは、[Rootless モードのドキュメント](../../engine/security/rootless.md) を参照してください。
@z

@x
When possible, `overlay2` is the recommended storage driver. When installing
Docker for the first time, `overlay2` is used by default. Previously, `aufs` was
used by default when available, but this is no longer the case. If you want to
use `aufs` on new installations going forward, you need to explicitly configure
it, and you may need to install extra packages, such as `linux-image-extra`.
See [aufs](aufs-driver.md).
@y
When possible, `overlay2` is the recommended storage driver. When installing
Docker for the first time, `overlay2` is used by default. Previously, `aufs` was
used by default when available, but this is no longer the case. If you want to
use `aufs` on new installations going forward, you need to explicitly configure
it, and you may need to install extra packages, such as `linux-image-extra`.
See [aufs](aufs-driver.md).
@z

@x
On existing installations using `aufs`, it is still used.
@y
On existing installations using `aufs`, it is still used.
@z

@x
When in doubt, the best all-around configuration is to use a modern Linux
distribution with a kernel that supports the `overlay2` storage driver, and to
use Docker volumes for write-heavy workloads instead of relying on writing data
to the container's writable layer.
@y
When in doubt, the best all-around configuration is to use a modern Linux
distribution with a kernel that supports the `overlay2` storage driver, and to
use Docker volumes for write-heavy workloads instead of relying on writing data
to the container's writable layer.
@z

@x
The `vfs` storage driver is usually not the best choice. Before using the `vfs`
storage driver, be sure to read about
[its performance and storage characteristics and limitations](vfs-driver.md).
@y
The `vfs` storage driver is usually not the best choice. Before using the `vfs`
storage driver, be sure to read about
[its performance and storage characteristics and limitations](vfs-driver.md).
@z

@x
> **Expectations for non-recommended storage drivers**: Commercial support is
> not available for Docker Engine - Community, and you can technically use any storage driver
> that is available for your platform. For instance, you can use `btrfs` with
> Docker Engine - Community, even though it is not recommended on any platform for
> Docker Engine - Community, and you do so at your own risk.
>
> The recommendations in the table above are based on automated regression
> testing and the configurations that are known to work for a large number of
> users. If you use a recommended configuration and find a reproducible issue,
> it is likely to be fixed very quickly. If the driver that you want to use is
> not recommended according to this table, you can run it at your own risk. You
> can and should still report any issues you run into. However, such issues
> have a lower priority than issues encountered when using a recommended
> configuration.
@y
> **Expectations for non-recommended storage drivers**: Commercial support is
> not available for Docker Engine - Community, and you can technically use any storage driver
> that is available for your platform. For instance, you can use `btrfs` with
> Docker Engine - Community, even though it is not recommended on any platform for
> Docker Engine - Community, and you do so at your own risk.
>
> The recommendations in the table above are based on automated regression
> testing and the configurations that are known to work for a large number of
> users. If you use a recommended configuration and find a reproducible issue,
> it is likely to be fixed very quickly. If the driver that you want to use is
> not recommended according to this table, you can run it at your own risk. You
> can and should still report any issues you run into. However, such issues
> have a lower priority than issues encountered when using a recommended
> configuration.
@z

@x
### Docker Desktop for Mac and Docker Desktop for Windows
@y
### Docker Desktop for Mac and Docker Desktop for Windows
@z

@x
Docker Desktop for Mac and Docker Desktop for Windows are intended for development, rather
than production. Modifying the storage driver on these platforms is not
possible.
@y
Docker Desktop for Mac and Docker Desktop for Windows are intended for development, rather
than production. Modifying the storage driver on these platforms is not
possible.
@z

@x
## Supported backing filesystems
@y
{: #supported-backing-filesystems }
## サポートされているファイルシステム
@z

@x
With regard to Docker, the backing filesystem is the filesystem where
`/var/lib/docker/` is located. Some storage drivers only work with specific
backing filesystems.
@y
With regard to Docker, the backing filesystem is the filesystem where
`/var/lib/docker/` is located. Some storage drivers only work with specific
backing filesystems.
@z

@x
| Storage driver        | Supported backing filesystems  |
|:----------------------|:------------------------------|
| `overlay2`, `overlay` | `xfs` with ftype=1, `ext4`    |
| `fuse-overlayfs`      | any filesystem                |
| `aufs`                | `xfs`, `ext4`                 |
| `devicemapper`        | `direct-lvm`                  |
| `btrfs`               | `btrfs`                       |
| `zfs`                 | `zfs`                         |
| `vfs`                 | any filesystem                 |
@y
| ストレージドライバー  | サポートするファイルシステム  |
|:----------------------|:------------------------------|
| `overlay2`, `overlay` | `xfs` ftype=1 利用時、 `ext4` |
| `aufs`                | `xfs`, `ext4`                 |
| `devicemapper`        | `direct-lvm`                  |
| `btrfs`               | `btrfs`                       |
| `zfs`                 | `zfs`                         |
| `vfs`                 | どのファイルシステムでも可。  |
@z

@x
## Other considerations
@y
{: #other-considerations }
## その他の考慮事項
@z

@x
### Suitability for your workload
@y
### Suitability for your workload
@z

@x
Among other things, each storage driver has its own performance characteristics
that make it more or less suitable for different workloads. Consider the
following generalizations:
@y
Among other things, each storage driver has its own performance characteristics
that make it more or less suitable for different workloads. Consider the
following generalizations:
@z

@x
- `overlay2`, `aufs`, and `overlay` all operate at the file level rather than
  the block level. This uses memory more efficiently, but the container's
  writable layer may grow quite large in write-heavy workloads.
- Block-level storage drivers such as `devicemapper`, `btrfs`, and `zfs` perform
  better for write-heavy workloads (though not as well as Docker volumes).
- For lots of small writes or containers with many layers or deep filesystems,
  `overlay` may perform better than `overlay2`, but consumes more inodes, which
  can lead to inode exhaustion.
- `btrfs` and `zfs` require a lot of memory.
- `zfs` is a good choice for high-density workloads such as PaaS.
@y
- `overlay2`, `aufs`, and `overlay` all operate at the file level rather than
  the block level. This uses memory more efficiently, but the container's
  writable layer may grow quite large in write-heavy workloads.
- Block-level storage drivers such as `devicemapper`, `btrfs`, and `zfs` perform
  better for write-heavy workloads (though not as well as Docker volumes).
- For lots of small writes or containers with many layers or deep filesystems,
  `overlay` may perform better than `overlay2`, but consumes more inodes, which
  can lead to inode exhaustion.
- `btrfs` and `zfs` require a lot of memory.
- `zfs` is a good choice for high-density workloads such as PaaS.
@z

@x
More information about performance, suitability, and best practices is available
in the documentation for each storage driver.
@y
More information about performance, suitability, and best practices is available
in the documentation for each storage driver.
@z

@x
### Shared storage systems and the storage driver
@y
{: #shared-storage-systems-and-the-storage-driver }
### Shared storage systems and the storage driver
@z

@x
If your enterprise uses SAN, NAS, hardware RAID, or other shared storage
systems, they may provide high availability, increased performance, thin
provisioning, deduplication, and compression. In many cases, Docker can work on
top of these storage systems, but Docker does not closely integrate with them.
@y
If your enterprise uses SAN, NAS, hardware RAID, or other shared storage
systems, they may provide high availability, increased performance, thin
provisioning, deduplication, and compression. In many cases, Docker can work on
top of these storage systems, but Docker does not closely integrate with them.
@z

@x
Each Docker storage driver is based on a Linux filesystem or volume manager. Be
sure to follow existing best practices for operating your storage driver
(filesystem or volume manager) on top of your shared storage system. For
example, if using the ZFS storage driver on top of a shared storage system, be
sure to follow best practices for operating ZFS filesystems on top of that
specific shared storage system.
@y
Each Docker storage driver is based on a Linux filesystem or volume manager. Be
sure to follow existing best practices for operating your storage driver
(filesystem or volume manager) on top of your shared storage system. For
example, if using the ZFS storage driver on top of a shared storage system, be
sure to follow best practices for operating ZFS filesystems on top of that
specific shared storage system.
@z

@x
### Stability
@y
{: #stability }
### 安定性
@z

@x
For some users, stability is more important than performance. Though Docker
considers all of the storage drivers mentioned here to be stable, some are newer
and are still under active development. In general, `overlay2`, `aufs`, `overlay`,
and `devicemapper` are the choices with the highest stability.
@y
ユーザーにとっては、処理性能よりも安定性が重要視されることがあります。
ここに説明するストレージドライバーはすべて安定していると考えられますが、中には更新され活発に開発中であるものもあります。
一般に`overlay2`、`aufs`、`overlay`、`devicemapper`は最も安定したものとして選ぶことができます。
@z

@x
### Test with your own workloads
@y
{: #test-with-your-own-workloads }
### Test with your own workloads
@z

@x
You can test Docker's performance when running your own workloads on different
storage drivers. Make sure to use equivalent hardware and workloads to match
production conditions, so you can see which storage driver offers the best
overall performance.
@y
You can test Docker's performance when running your own workloads on different
storage drivers. Make sure to use equivalent hardware and workloads to match
production conditions, so you can see which storage driver offers the best
overall performance.
@z

@x
## Check your current storage driver
@y
{: #check-your-current-storage-driver }
## 利用中のストレージドライバーの確認
@z

@x
The detailed documentation for each individual storage driver details all of the
set-up steps to use a given storage driver.
@y
The detailed documentation for each individual storage driver details all of the
set-up steps to use a given storage driver.
@z

@x
To see what storage driver Docker is currently using, use `docker info` and look
for the `Storage Driver` line:
@y
To see what storage driver Docker is currently using, use `docker info` and look
for the `Storage Driver` line:
@z

@x
```bash
$ docker info
@y
```bash
$ docker info
@z

@x
Containers: 0
Images: 0
Storage Driver: overlay2
 Backing Filesystem: xfs
<...>
```
@y
Containers: 0
Images: 0
Storage Driver: overlay2
 Backing Filesystem: xfs
<...>
```
@z

@x
To change the storage driver, see the specific instructions for the new storage
driver. Some drivers require additional configuration, including configuration
to physical or logical disks on the Docker host.
@y
To change the storage driver, see the specific instructions for the new storage
driver. Some drivers require additional configuration, including configuration
to physical or logical disks on the Docker host.
@z

@x
> **Important**: When you change the storage driver, any existing images and
> containers become inaccessible. This is because their layers cannot be used
> by the new storage driver. If you revert your changes, you can
> access the old images and containers again, but any that you pulled or
> created using the new driver are then inaccessible.
{:.important}
@y
> **重要**
>
> ストレージドライバーを変更すると、既存のイメージやコンテナーは接続不能になります。
> 新しいストレージドライバーからは、元々あるレイヤーを利用できないためです。
> 変更を元に戻すことで、元々のイメージやコンテナーにアクセスできるようになりますが、今度は、新たなドライバーを使って行ったプルや生成処理内容にアクセスできなくなります。
{:.important}
@z

@x
## Related information
@y
{: #related-information }
## 関連情報
@z

@x
* [About images, containers, and storage drivers](index.md)
* [`aufs` storage driver in practice](aufs-driver.md)
* [`devicemapper` storage driver in practice](device-mapper-driver.md)
* [`overlay` and `overlay2` storage drivers in practice](overlayfs-driver.md)
* [`btrfs` storage driver in practice](btrfs-driver.md)
* [`zfs` storage driver in practice](zfs-driver.md)
@y
* [About images, containers, and storage drivers](index.md)
* [`aufs`ストレージドライバーの利用](aufs-driver.md)
* [`devicemapper`ストレージドライバーの利用](device-mapper-driver.md)
* [`overlay`と`overlay2`ストレージドライバーの利用](overlayfs-driver.md)
* [`btrfs`ストレージドライバーの利用](btrfs-driver.md)
* [`zfs`ストレージドライバーの利用](zfs-driver.md)
@z
