%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to optimize your use of Btrfs driver.
keywords: 'container, storage, driver, Btrfs '
title: Use the BTRFS storage driver
redirect_from:
- /engine/userguide/storagedriver/btrfs-driver/
---
@y
---
description: Learn how to optimize your use of Btrfs driver.
keywords: 'container, storage, driver, Btrfs '
title: Use the BTRFS storage driver
redirect_from:
- /engine/userguide/storagedriver/btrfs-driver/
---
@z

@x
Btrfs is a next generation copy-on-write filesystem that supports many advanced
storage technologies that make it a good fit for Docker. Btrfs is included in
the mainline Linux kernel.
@y
Btrfs is a next generation copy-on-write filesystem that supports many advanced
storage technologies that make it a good fit for Docker. Btrfs is included in
the mainline Linux kernel.
@z

@x
Docker's `btrfs` storage driver leverages many Btrfs features for image and
container management. Among these features are block-level operations, thin
provisioning, copy-on-write snapshots, and ease of administration. You can
easily combine multiple physical block devices into a single Btrfs filesystem.
@y
Docker's `btrfs` storage driver leverages many Btrfs features for image and
container management. Among these features are block-level operations, thin
provisioning, copy-on-write snapshots, and ease of administration. You can
easily combine multiple physical block devices into a single Btrfs filesystem.
@z

@x
This article refers to Docker's Btrfs storage driver as `btrfs` and the overall
Btrfs Filesystem as Btrfs.
@y
This article refers to Docker's Btrfs storage driver as `btrfs` and the overall
Btrfs Filesystem as Btrfs.
@z

@x
> **Note**: The `btrfs` storage driver is only supported on Docker Engine - Community on Ubuntu or Debian.
@y
> **Note**: The `btrfs` storage driver is only supported on Docker Engine - Community on Ubuntu or Debian.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
`btrfs` is supported if you meet the following prerequisites:
@y
`btrfs` is supported if you meet the following prerequisites:
@z

@x
- **Docker Engine - Community**: For Docker Engine - Community, `btrfs` is only recommended on Ubuntu or Debian.
@y
- **Docker Engine - Community**: For Docker Engine - Community, `btrfs` is only recommended on Ubuntu or Debian.
@z

@x
- Changing the storage driver makes any containers you have already
  created inaccessible on the local system. Use `docker save` to save containers,
  and push existing images to Docker Hub or a private repository, so that you
  not need to re-create them later.
@y
- Changing the storage driver makes any containers you have already
  created inaccessible on the local system. Use `docker save` to save containers,
  and push existing images to Docker Hub or a private repository, so that you
  not need to re-create them later.
@z

@x
- `btrfs` requires a dedicated block storage device such as a physical disk. This
  block device must be formatted for Btrfs and mounted into `/var/lib/docker/`.
  The configuration instructions below walk you through this procedure. By
  default, the SLES `/` filesystem is formatted with BTRFS, so for SLES, you do
  not need to use a separate block device, but you can choose to do so for
  performance reasons.
@y
- `btrfs` requires a dedicated block storage device such as a physical disk. This
  block device must be formatted for Btrfs and mounted into `/var/lib/docker/`.
  The configuration instructions below walk you through this procedure. By
  default, the SLES `/` filesystem is formatted with BTRFS, so for SLES, you do
  not need to use a separate block device, but you can choose to do so for
  performance reasons.
@z

@x
- `btrfs` support must exist in your kernel. To check this, run the following
  command:
@y
- `btrfs` support must exist in your kernel. To check this, run the following
  command:
@z

@x
  ```console
  $ grep btrfs /proc/filesystems
@y
  ```console
  $ grep btrfs /proc/filesystems
@z

@x
  btrfs
  ```
@y
  btrfs
  ```
@z

@x
- To manage BTRFS filesystems at the level of the operating system, you need the
  `btrfs` command. If you do not have this command, install the `btrfsprogs`
  package (SLES) or `btrfs-tools` package (Ubuntu).
@y
- To manage BTRFS filesystems at the level of the operating system, you need the
  `btrfs` command. If you do not have this command, install the `btrfsprogs`
  package (SLES) or `btrfs-tools` package (Ubuntu).
@z

@x
## Configure Docker to use the btrfs storage driver
@y
## Configure Docker to use the btrfs storage driver
@z

@x
This procedure is essentially identical on SLES and Ubuntu.
@y
This procedure is essentially identical on SLES and Ubuntu.
@z

@x
1.  Stop Docker.
@y
1.  Stop Docker.
@z

@x
2.  Copy the contents of `/var/lib/docker/` to a backup location, then empty
    the contents of `/var/lib/docker/`:
@y
2.  Copy the contents of `/var/lib/docker/` to a backup location, then empty
    the contents of `/var/lib/docker/`:
@z

@x
    ```console
    $ sudo cp -au /var/lib/docker /var/lib/docker.bk
    $ sudo rm -rf /var/lib/docker/*
    ```
@y
    ```console
    $ sudo cp -au /var/lib/docker /var/lib/docker.bk
    $ sudo rm -rf /var/lib/docker/*
    ```
@z

@x
3.  Format your dedicated block device or devices as a Btrfs filesystem. This
    example assumes that you are using two block devices called `/dev/xvdf` and
    `/dev/xvdg`. Double-check the block device names because this is a
    destructive operation.
@y
3.  Format your dedicated block device or devices as a Btrfs filesystem. This
    example assumes that you are using two block devices called `/dev/xvdf` and
    `/dev/xvdg`. Double-check the block device names because this is a
    destructive operation.
@z

@x
    ```console
    $ sudo mkfs.btrfs -f /dev/xvdf /dev/xvdg
    ```
@y
    ```console
    $ sudo mkfs.btrfs -f /dev/xvdf /dev/xvdg
    ```
@z

@x
    There are many more options for Btrfs, including striping and RAID. See the
    [Btrfs documentation](https://btrfs.wiki.kernel.org/index.php/Using_Btrfs_with_Multiple_Devices).
@y
    There are many more options for Btrfs, including striping and RAID. See the
    [Btrfs documentation](https://btrfs.wiki.kernel.org/index.php/Using_Btrfs_with_Multiple_Devices).
@z

@x
4.  Mount the new Btrfs filesystem on the `/var/lib/docker/` mount point. You
    can specify any of the block devices used to create the Btrfs filesystem.
@y
4.  Mount the new Btrfs filesystem on the `/var/lib/docker/` mount point. You
    can specify any of the block devices used to create the Btrfs filesystem.
@z

@x
    ```console
    $ sudo mount -t btrfs /dev/xvdf /var/lib/docker
    ```
@y
    ```console
    $ sudo mount -t btrfs /dev/xvdf /var/lib/docker
    ```
@z

@x
    Don't forget to make the change permanent across reboots by adding an
    entry to `/etc/fstab`.
@y
    Don't forget to make the change permanent across reboots by adding an
    entry to `/etc/fstab`.
@z

@x
5.  Copy the contents of `/var/lib/docker.bk` to `/var/lib/docker/`.
@y
5.  Copy the contents of `/var/lib/docker.bk` to `/var/lib/docker/`.
@z

@x
    ```console
    $ sudo cp -au /var/lib/docker.bk/* /var/lib/docker/
    ```
@y
    ```console
    $ sudo cp -au /var/lib/docker.bk/* /var/lib/docker/
    ```
@z

@x
6.  Configure Docker to use the `btrfs` storage driver. This is required even
    though `/var/lib/docker/` is now using a Btrfs filesystem.
    Edit or create the file `/etc/docker/daemon.json`. If it is a new file, add
    the following contents. If it is an existing file, add the key and value
    only, being careful to end the line with a comma if it is not the final
    line before an ending curly bracket (`}`).
@y
6.  Configure Docker to use the `btrfs` storage driver. This is required even
    though `/var/lib/docker/` is now using a Btrfs filesystem.
    Edit or create the file `/etc/docker/daemon.json`. If it is a new file, add
    the following contents. If it is an existing file, add the key and value
    only, being careful to end the line with a comma if it is not the final
    line before an ending curly bracket (`}`).
@z

@x
    ```json
    {
      "storage-driver": "btrfs"
    }
    ```
@y
    ```json
    {
      "storage-driver": "btrfs"
    }
    ```
@z

@x
    See all storage options for each storage driver in the
    [daemon reference documentation](/engine/reference/commandline/dockerd/#storage-driver-options)
@y
    See all storage options for each storage driver in the
    [daemon reference documentation](/engine/reference/commandline/dockerd/#storage-driver-options)
@z

@x
7.  Start Docker. After it is running, verify that `btrfs` is being used as the
    storage driver.
@y
7.  Start Docker. After it is running, verify that `btrfs` is being used as the
    storage driver.
@z

@x
    ```console
    $ docker info
@y
    ```console
    $ docker info
@z

@x
    Containers: 0
     Running: 0
     Paused: 0
     Stopped: 0
    Images: 0
    Server Version: 17.03.1-ce
    Storage Driver: btrfs
     Build Version: Btrfs v4.4
     Library Version: 101
    <...>
    ```
@y
    Containers: 0
     Running: 0
     Paused: 0
     Stopped: 0
    Images: 0
    Server Version: 17.03.1-ce
    Storage Driver: btrfs
     Build Version: Btrfs v4.4
     Library Version: 101
    <...>
    ```
@z

@x
8.  When you are ready, remove the `/var/lib/docker.bk` directory.
@y
8.  When you are ready, remove the `/var/lib/docker.bk` directory.
@z

@x
## Manage a Btrfs volume
@y
## Manage a Btrfs volume
@z

@x
One of the benefits of Btrfs is the ease of managing Btrfs filesystems without
the need to unmount the filesystem or restart Docker.
@y
One of the benefits of Btrfs is the ease of managing Btrfs filesystems without
the need to unmount the filesystem or restart Docker.
@z

@x
When space gets low, Btrfs automatically expands the volume in *chunks* of
roughly 1 GB.
@y
When space gets low, Btrfs automatically expands the volume in *chunks* of
roughly 1 GB.
@z

@x
To add a block device to a Btrfs volume, use the `btrfs device add` and
`btrfs filesystem balance` commands.
@y
To add a block device to a Btrfs volume, use the `btrfs device add` and
`btrfs filesystem balance` commands.
@z

@x
```console
$ sudo btrfs device add /dev/svdh /var/lib/docker
@y
```console
$ sudo btrfs device add /dev/svdh /var/lib/docker
@z

@x
$ sudo btrfs filesystem balance /var/lib/docker
```
@y
$ sudo btrfs filesystem balance /var/lib/docker
```
@z

@x
> **Note**: While you can do these operations with Docker running, performance
> suffers. It might be best to plan an outage window to balance the Btrfs
> filesystem.
@y
> **Note**: While you can do these operations with Docker running, performance
> suffers. It might be best to plan an outage window to balance the Btrfs
> filesystem.
@z

@x
## How the `btrfs` storage driver works
@y
## How the `btrfs` storage driver works
@z

@x
The `btrfs` storage driver works differently from `devicemapper` or other
storage drivers in that your entire `/var/lib/docker/` directory is stored on a
Btrfs volume.
@y
The `btrfs` storage driver works differently from `devicemapper` or other
storage drivers in that your entire `/var/lib/docker/` directory is stored on a
Btrfs volume.
@z

@x
### Image and container layers on-disk
@y
### Image and container layers on-disk
@z

@x
Information about image layers and writable container layers is stored in
`/var/lib/docker/btrfs/subvolumes/`. This subdirectory contains one directory
per image or container layer, with the unified filesystem built from a layer
plus all its parent layers. Subvolumes are natively copy-on-write and have space
allocated to them on-demand from an underlying storage pool. They can also be
nested and snapshotted. The diagram below shows 4 subvolumes. 'Subvolume 2' and
'Subvolume 3' are nested, whereas 'Subvolume 4' shows its own internal directory
tree.
@y
Information about image layers and writable container layers is stored in
`/var/lib/docker/btrfs/subvolumes/`. This subdirectory contains one directory
per image or container layer, with the unified filesystem built from a layer
plus all its parent layers. Subvolumes are natively copy-on-write and have space
allocated to them on-demand from an underlying storage pool. They can also be
nested and snapshotted. The diagram below shows 4 subvolumes. 'Subvolume 2' and
'Subvolume 3' are nested, whereas 'Subvolume 4' shows its own internal directory
tree.
@z

@x
![subvolume example](images/btfs_subvolume.jpg)
@y
![subvolume example](images/btfs_subvolume.jpg)
@z

@x
Only the base layer of an image is stored as a true subvolume. All the other
layers are stored as snapshots, which only contain the differences introduced
in that layer. You can create snapshots of snapshots as shown in the diagram
below.
@y
Only the base layer of an image is stored as a true subvolume. All the other
layers are stored as snapshots, which only contain the differences introduced
in that layer. You can create snapshots of snapshots as shown in the diagram
below.
@z

@x
![snapshots diagram](images/btfs_snapshots.jpg)
@y
![snapshots diagram](images/btfs_snapshots.jpg)
@z

@x
On disk, snapshots look and feel just like subvolumes, but in reality they are
much smaller and more space-efficient. Copy-on-write is used to maximize storage
efficiency and minimize layer size, and writes in the container's writable layer
are managed at the block level. The following image shows a subvolume and its
snapshot sharing data.
@y
On disk, snapshots look and feel just like subvolumes, but in reality they are
much smaller and more space-efficient. Copy-on-write is used to maximize storage
efficiency and minimize layer size, and writes in the container's writable layer
are managed at the block level. The following image shows a subvolume and its
snapshot sharing data.
@z

@x
![snapshot and subvolume sharing data](images/btfs_pool.jpg)
@y
![snapshot and subvolume sharing data](images/btfs_pool.jpg)
@z

@x
For maximum efficiency, when a container needs more space, it is allocated in
*chunks* of roughly 1 GB in size.
@y
For maximum efficiency, when a container needs more space, it is allocated in
*chunks* of roughly 1 GB in size.
@z

@x
Docker's `btrfs` storage driver stores every image layer and container in its
own Btrfs subvolume or snapshot. The base layer of an image is stored as a
subvolume whereas child image layers and containers are stored as snapshots.
This is shown in the diagram below.
@y
Docker's `btrfs` storage driver stores every image layer and container in its
own Btrfs subvolume or snapshot. The base layer of an image is stored as a
subvolume whereas child image layers and containers are stored as snapshots.
This is shown in the diagram below.
@z

@x
![Btrfs container layers](images/btfs_container_layer.jpg)
@y
![Btrfs container layers](images/btfs_container_layer.jpg)
@z

@x
The high level process for creating images and containers on Docker hosts
running the `btrfs` driver is as follows:
@y
The high level process for creating images and containers on Docker hosts
running the `btrfs` driver is as follows:
@z

@x
1.  The image's base layer is stored in a Btrfs *subvolume* under
    `/var/lib/docker/btrfs/subvolumes`.
@y
1.  The image's base layer is stored in a Btrfs *subvolume* under
    `/var/lib/docker/btrfs/subvolumes`.
@z

@x
2.  Subsequent image layers are stored as a Btrfs *snapshot* of the parent
    layer's subvolume or snapshot, but with the changes introduced by this
    layer. These differences are stored at the block level.
@y
2.  Subsequent image layers are stored as a Btrfs *snapshot* of the parent
    layer's subvolume or snapshot, but with the changes introduced by this
    layer. These differences are stored at the block level.
@z

@x
3.  The container's writable layer is a Btrfs snapshot of the final image layer,
    with the differences introduced by the running container. These differences
    are stored at the block level.
@y
3.  The container's writable layer is a Btrfs snapshot of the final image layer,
    with the differences introduced by the running container. These differences
    are stored at the block level.
@z

@x
## How container reads and writes work with `btrfs`
@y
## How container reads and writes work with `btrfs`
@z

@x
### Reading files
@y
### Reading files
@z

@x
A container is a space-efficient snapshot of an image. Metadata in the snapshot
points to the actual data blocks in the storage pool. This is the same as with
a subvolume. Therefore, reads performed against a snapshot are essentially the
same as reads performed against a subvolume.
@y
A container is a space-efficient snapshot of an image. Metadata in the snapshot
points to the actual data blocks in the storage pool. This is the same as with
a subvolume. Therefore, reads performed against a snapshot are essentially the
same as reads performed against a subvolume.
@z

@x
### Writing files
@y
### Writing files
@z

@x
- **Writing new files**: Writing a new file to a container invokes an allocate-on-demand
  operation to allocate new data block to the container's snapshot. The file is
  then written to this new space. The allocate-on-demand operation is native to
  all writes with Btrfs and is the same as writing new data to a subvolume. As a
  result, writing new files to a container's snapshot operates at native Btrfs
  speeds.
@y
- **Writing new files**: Writing a new file to a container invokes an allocate-on-demand
  operation to allocate new data block to the container's snapshot. The file is
  then written to this new space. The allocate-on-demand operation is native to
  all writes with Btrfs and is the same as writing new data to a subvolume. As a
  result, writing new files to a container's snapshot operates at native Btrfs
  speeds.
@z

@x
- **Modifying existing files**: Updating an existing file in a container is a copy-on-write
  operation (*redirect-on-write* is the Btrfs terminology). The original data is
  read from the layer where the file currently exists, and only the modified
  blocks are written into the container's writable layer. Next, the Btrfs driver
  updates the filesystem metadata in the snapshot to point to this new data.
  This behavior incurs very little overhead.
@y
- **Modifying existing files**: Updating an existing file in a container is a copy-on-write
  operation (*redirect-on-write* is the Btrfs terminology). The original data is
  read from the layer where the file currently exists, and only the modified
  blocks are written into the container's writable layer. Next, the Btrfs driver
  updates the filesystem metadata in the snapshot to point to this new data.
  This behavior incurs very little overhead.
@z

@x
- **Deleting files or directories**: If a container deletes a file or directory
  that exists in a lower layer, Btrfs masks the existence of the file or
  directory in the lower layer. If a container creates a file and then deletes
  it, this operation is performed in the Btrfs filesystem itself and the space
  is reclaimed.
@y
- **Deleting files or directories**: If a container deletes a file or directory
  that exists in a lower layer, Btrfs masks the existence of the file or
  directory in the lower layer. If a container creates a file and then deletes
  it, this operation is performed in the Btrfs filesystem itself and the space
  is reclaimed.
@z

@x
With Btrfs, writing and updating lots of small files can result in slow
performance.
@y
With Btrfs, writing and updating lots of small files can result in slow
performance.
@z

@x
## Btrfs and Docker performance
@y
## Btrfs and Docker performance
@z

@x
There are several factors that influence Docker's performance under the `btrfs`
storage driver.
@y
There are several factors that influence Docker's performance under the `btrfs`
storage driver.
@z

@x
> **Note**: Many of these factors are mitigated by using Docker volumes for
> write-heavy workloads, rather than relying on storing data in the container's
> writable layer. However, in the case of Btrfs, Docker volumes still suffer
> from these draw-backs unless `/var/lib/docker/volumes/` is **not** backed by
> Btrfs.
@y
> **Note**: Many of these factors are mitigated by using Docker volumes for
> write-heavy workloads, rather than relying on storing data in the container's
> writable layer. However, in the case of Btrfs, Docker volumes still suffer
> from these draw-backs unless `/var/lib/docker/volumes/` is **not** backed by
> Btrfs.
@z

@x
- **Page caching**. Btrfs does not support page cache sharing. This means that
  each process accessing the same file copies the file into the Docker hosts's
  memory. As a result, the `btrfs` driver may not be the best choice
  high-density use cases such as PaaS.
@y
- **Page caching**. Btrfs does not support page cache sharing. This means that
  each process accessing the same file copies the file into the Docker hosts's
  memory. As a result, the `btrfs` driver may not be the best choice
  high-density use cases such as PaaS.
@z

@x
- **Small writes**. Containers performing lots of small writes (this usage
  pattern matches what happens when you start and stop many containers in a short
  period of time, as well) can lead to poor use of Btrfs chunks. This can
  prematurely fill the Btrfs filesystem and lead to out-of-space conditions on
  your Docker host. Use `btrfs filesys show` to closely monitor the amount of
  free space on your Btrfs device.
@y
- **Small writes**. Containers performing lots of small writes (this usage
  pattern matches what happens when you start and stop many containers in a short
  period of time, as well) can lead to poor use of Btrfs chunks. This can
  prematurely fill the Btrfs filesystem and lead to out-of-space conditions on
  your Docker host. Use `btrfs filesys show` to closely monitor the amount of
  free space on your Btrfs device.
@z

@x
- **Sequential writes**. Btrfs uses a journaling technique when writing to disk.
  This can impact the performance of sequential writes, reducing performance by
  up to 50%.
@y
- **Sequential writes**. Btrfs uses a journaling technique when writing to disk.
  This can impact the performance of sequential writes, reducing performance by
  up to 50%.
@z

@x
- **Fragmentation**. Fragmentation is a natural byproduct of copy-on-write
  filesystems like Btrfs. Many small random writes can compound this issue.
  Fragmentation can manifest as CPU spikes when using SSDs or head thrashing
  when using spinning disks. Either of these issues can harm performance.
@y
- **Fragmentation**. Fragmentation is a natural byproduct of copy-on-write
  filesystems like Btrfs. Many small random writes can compound this issue.
  Fragmentation can manifest as CPU spikes when using SSDs or head thrashing
  when using spinning disks. Either of these issues can harm performance.
@z

@x
  If your Linux kernel version is 3.9 or higher, you can enable the `autodefrag`
  feature when mounting a Btrfs volume. Test this feature on your own workloads
  before deploying it into production, as some tests have shown a negative
  impact on performance.
@y
  If your Linux kernel version is 3.9 or higher, you can enable the `autodefrag`
  feature when mounting a Btrfs volume. Test this feature on your own workloads
  before deploying it into production, as some tests have shown a negative
  impact on performance.
@z

@x
- **SSD performance**: Btrfs includes native optimizations for SSD media.
  To enable these features, mount the Btrfs filesystem with the `-o ssd` mount
  option. These optimizations include enhanced SSD write performance by avoiding
  optimization such as *seek optimizations* which do not apply to solid-state
  media.
@y
- **SSD performance**: Btrfs includes native optimizations for SSD media.
  To enable these features, mount the Btrfs filesystem with the `-o ssd` mount
  option. These optimizations include enhanced SSD write performance by avoiding
  optimization such as *seek optimizations* which do not apply to solid-state
  media.
@z

@x
- **Balance Btrfs filesystems often**: Use operating system utilities such as a
  `cron` job to balance the Btrfs filesystem regularly, during non-peak hours.
  This reclaims unallocated blocks and helps to prevent the filesystem from
  filling up unnecessarily. You cannot rebalance a totally full Btrfs
  filesystem unless you add additional physical block devices to the filesystem.
  See the
  [BTRFS Wiki](https://btrfs.wiki.kernel.org/index.php/Balance_Filters#Balancing_to_fix_filesystem_full_errors).
@y
- **Balance Btrfs filesystems often**: Use operating system utilities such as a
  `cron` job to balance the Btrfs filesystem regularly, during non-peak hours.
  This reclaims unallocated blocks and helps to prevent the filesystem from
  filling up unnecessarily. You cannot rebalance a totally full Btrfs
  filesystem unless you add additional physical block devices to the filesystem.
  See the
  [BTRFS Wiki](https://btrfs.wiki.kernel.org/index.php/Balance_Filters#Balancing_to_fix_filesystem_full_errors).
@z

@x
- **Use fast storage**: Solid-state drives (SSDs) provide faster reads and
  writes than spinning disks.
@y
- **Use fast storage**: Solid-state drives (SSDs) provide faster reads and
  writes than spinning disks.
@z

@x
- **Use volumes for write-heavy workloads**: Volumes provide the best and most
  predictable performance for write-heavy workloads. This is because they bypass
  the storage driver and do not incur any of the potential overheads introduced
  by thin provisioning and copy-on-write. Volumes have other benefits, such as
  allowing you to share data among containers and persisting even when no
  running container is using them.
@y
- **Use volumes for write-heavy workloads**: Volumes provide the best and most
  predictable performance for write-heavy workloads. This is because they bypass
  the storage driver and do not incur any of the potential overheads introduced
  by thin provisioning and copy-on-write. Volumes have other benefits, such as
  allowing you to share data among containers and persisting even when no
  running container is using them.
@z

@x
## Related Information
@y
## Related Information
@z

@x
- [Volumes](../volumes.md)
- [Understand images, containers, and storage drivers](index.md)
- [Select a storage driver](select-storage-driver.md)
@y
- [Volumes](../volumes.md)
- [Understand images, containers, and storage drivers](index.md)
- [Select a storage driver](select-storage-driver.md)
@z
