%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to optimize your use of ZFS driver.
keywords: 'container, storage, driver, ZFS '
title: Use the ZFS storage driver
redirect_from:
- /engine/userguide/storagedriver/zfs-driver/
---
@y
---
description: Learn how to optimize your use of ZFS driver.
keywords: 'container, storage, driver, ZFS '
title: Use the ZFS storage driver
redirect_from:
- /engine/userguide/storagedriver/zfs-driver/
---
@z

@x
ZFS is a next generation filesystem that supports many advanced storage
technologies such as volume management, snapshots, checksumming, compression and
deduplication, replication and more.
@y
ZFS is a next generation filesystem that supports many advanced storage
technologies such as volume management, snapshots, checksumming, compression and
deduplication, replication and more.
@z

@x
It was created by Sun Microsystems (now Oracle Corporation) and is open sourced
under the CDDL license. Due to licensing incompatibilities between the CDDL and
GPL, ZFS cannot be shipped as part of the mainline Linux kernel. However, the
ZFS On Linux (ZoL) project provides an out-of-tree kernel module and userspace
tools which can be installed separately.
@y
It was created by Sun Microsystems (now Oracle Corporation) and is open sourced
under the CDDL license. Due to licensing incompatibilities between the CDDL and
GPL, ZFS cannot be shipped as part of the mainline Linux kernel. However, the
ZFS On Linux (ZoL) project provides an out-of-tree kernel module and userspace
tools which can be installed separately.
@z

@x
The ZFS on Linux (ZoL) port is healthy and maturing. However, at this point in
time it is not recommended to use the `zfs` Docker storage driver for production
use unless you have substantial experience with ZFS on Linux.
@y
The ZFS on Linux (ZoL) port is healthy and maturing. However, at this point in
time it is not recommended to use the `zfs` Docker storage driver for production
use unless you have substantial experience with ZFS on Linux.
@z

@x
> ***Note***: There is also a FUSE implementation of ZFS on the Linux platform.
> This is not recommended. The native ZFS driver (ZoL) is more tested, more
> performant, and is more widely used. The remainder  of this document refers
> to the native ZoL port.
@y
> ***Note***: There is also a FUSE implementation of ZFS on the Linux platform.
> This is not recommended. The native ZFS driver (ZoL) is more tested, more
> performant, and is more widely used. The remainder  of this document refers
> to the native ZoL port.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- ZFS requires one or more dedicated block devices, preferably solid-state
  drives (SSDs).
- ZFS is only supported on Docker Engine - Community with Ubuntu 14.04 or higher, with the `zfs`
  package (16.04 and higher) or `zfs-native` and `ubuntu-zfs` packages (14.04)
  installed.
  - For Ubuntu 14.04, you need to enable a supplemental package repository
    `ppa:zfs-native/stable` before you can install the package. See
    [https://launchpad.net/~zfs-native/+archive/ubuntu/stable](https://launchpad.net/~zfs-native/+archive/ubuntu/stable){: target="_blank" rel="noopener" class="_" }
    for instructions.
- ZFS is not supported on Docker EE or CS-Engine, or any other Linux platforms.
- The `/var/lib/docker/` directory must be mounted on a ZFS-formatted
  filesystem.
- Changing the storage driver makes any containers you have already
  created inaccessible on the local system. Use `docker save` to save containers,
  and push existing images to Docker Hub or a private repository, so that you
  do not need to re-create them later.
@y
- ZFS requires one or more dedicated block devices, preferably solid-state
  drives (SSDs).
- ZFS is only supported on Docker Engine - Community with Ubuntu 14.04 or higher, with the `zfs`
  package (16.04 and higher) or `zfs-native` and `ubuntu-zfs` packages (14.04)
  installed.
  - For Ubuntu 14.04, you need to enable a supplemental package repository
    `ppa:zfs-native/stable` before you can install the package. See
    [https://launchpad.net/~zfs-native/+archive/ubuntu/stable](https://launchpad.net/~zfs-native/+archive/ubuntu/stable){: target="_blank" rel="noopener" class="_" }
    for instructions.
- ZFS is not supported on Docker EE or CS-Engine, or any other Linux platforms.
- The `/var/lib/docker/` directory must be mounted on a ZFS-formatted
  filesystem.
- Changing the storage driver makes any containers you have already
  created inaccessible on the local system. Use `docker save` to save containers,
  and push existing images to Docker Hub or a private repository, so that you
  do not need to re-create them later.
@z

@x
> **Note**
>
> There is no need to use `MountFlags=slave` with Docker Engine 18.09 or
> later because `dockerd` and `containerd` are in different mount namespaces. 
@y
> **Note**
>
> There is no need to use `MountFlags=slave` with Docker Engine 18.09 or
> later because `dockerd` and `containerd` are in different mount namespaces. 
@z

@x
## Configure Docker with the `zfs` storage driver
@y
## Configure Docker with the `zfs` storage driver
@z

@x
1.  Stop Docker.
@y
1.  Stop Docker.
@z

@x
2.  Copy the contents of `/var/lib/docker/` to `/var/lib/docker.bk` and remove
    the contents of `/var/lib/docker/`.
@y
2.  Copy the contents of `/var/lib/docker/` to `/var/lib/docker.bk` and remove
    the contents of `/var/lib/docker/`.
@z

@x
    ```console
    $ sudo cp -au /var/lib/docker /var/lib/docker.bk
@y
    ```console
    $ sudo cp -au /var/lib/docker /var/lib/docker.bk
@z

@x
    $ sudo rm -rf /var/lib/docker/*
    ```
@y
    $ sudo rm -rf /var/lib/docker/*
    ```
@z

@x
3.  Create a new `zpool` on your dedicated block device or devices, and mount it
    into `/var/lib/docker/`. Be sure you
    have specified the correct devices, because this is a destructive operation.
    This example adds two devices to the pool.
@y
3.  Create a new `zpool` on your dedicated block device or devices, and mount it
    into `/var/lib/docker/`. Be sure you
    have specified the correct devices, because this is a destructive operation.
    This example adds two devices to the pool.
@z

@x
    ```console
    $ sudo zpool create -f zpool-docker -m /var/lib/docker /dev/xvdf /dev/xvdg
    ```
@y
    ```console
    $ sudo zpool create -f zpool-docker -m /var/lib/docker /dev/xvdf /dev/xvdg
    ```
@z

@x
    The command creates the `zpool` and names it `zpool-docker`. The name is for
    display purposes only, and you can use a different name. Check that the pool
    was created and mounted correctly using `zfs list`.
@y
    The command creates the `zpool` and names it `zpool-docker`. The name is for
    display purposes only, and you can use a different name. Check that the pool
    was created and mounted correctly using `zfs list`.
@z

@x
    ```console
    $ sudo zfs list
@y
    ```console
    $ sudo zfs list
@z

@x
    NAME           USED  AVAIL  REFER  MOUNTPOINT
    zpool-docker    55K  96.4G    19K  /var/lib/docker
    ```
@y
    NAME           USED  AVAIL  REFER  MOUNTPOINT
    zpool-docker    55K  96.4G    19K  /var/lib/docker
    ```
@z

@x
3.  Configure Docker to use `zfs`. Edit `/etc/docker/daemon.json` and set the
    `storage-driver` to `zfs`. If the file was empty before, it should now look
    like this:
@y
3.  Configure Docker to use `zfs`. Edit `/etc/docker/daemon.json` and set the
    `storage-driver` to `zfs`. If the file was empty before, it should now look
    like this:
@z

@x
    ```json
    {
      "storage-driver": "zfs"
    }
    ```
@y
    ```json
    {
      "storage-driver": "zfs"
    }
    ```
@z

@x
    Save and close the file.
@y
    Save and close the file.
@z

@x
4.  Start Docker. Use `docker info` to verify that the storage driver is `zfs`.
@y
4.  Start Docker. Use `docker info` to verify that the storage driver is `zfs`.
@z

@x
    ```console
    $ sudo docker info
      Containers: 0
       Running: 0
       Paused: 0
       Stopped: 0
      Images: 0
      Server Version: 17.03.1-ce
      Storage Driver: zfs
       Zpool: zpool-docker
       Zpool Health: ONLINE
       Parent Dataset: zpool-docker
       Space Used By Parent: 249856
       Space Available: 103498395648
       Parent Quota: no
       Compression: off
    <...>
    ```
@y
    ```console
    $ sudo docker info
      Containers: 0
       Running: 0
       Paused: 0
       Stopped: 0
      Images: 0
      Server Version: 17.03.1-ce
      Storage Driver: zfs
       Zpool: zpool-docker
       Zpool Health: ONLINE
       Parent Dataset: zpool-docker
       Space Used By Parent: 249856
       Space Available: 103498395648
       Parent Quota: no
       Compression: off
    <...>
    ```
@z

@x
## Manage `zfs`
@y
## Manage `zfs`
@z

@x
### Increase capacity on a running device
@y
### Increase capacity on a running device
@z

@x
To increase the size of the `zpool`, you need to add a dedicated block device to
the Docker host, and then add it to the `zpool` using the `zpool add` command:
@y
To increase the size of the `zpool`, you need to add a dedicated block device to
the Docker host, and then add it to the `zpool` using the `zpool add` command:
@z

@x
```console
$ sudo zpool add zpool-docker /dev/xvdh
```
@y
```console
$ sudo zpool add zpool-docker /dev/xvdh
```
@z

@x
### Limit a container's writable storage quota
@y
### Limit a container's writable storage quota
@z

@x
If you want to implement a quota on a per-image/dataset basis, you can set the
`size` storage option to limit the amount of space a single container can use
for its writable layer.
@y
If you want to implement a quota on a per-image/dataset basis, you can set the
`size` storage option to limit the amount of space a single container can use
for its writable layer.
@z

@x
Edit `/etc/docker/daemon.json` and add the following:
@y
Edit `/etc/docker/daemon.json` and add the following:
@z

@x
```json
{
  "storage-driver": "zfs",
  "storage-opts": ["size=256M"]
}
```
@y
```json
{
  "storage-driver": "zfs",
  "storage-opts": ["size=256M"]
}
```
@z

@x
See all storage options for each storage driver in the
[daemon reference documentation](/engine/reference/commandline/dockerd/#daemon-storage-driver)
@y
See all storage options for each storage driver in the
[daemon reference documentation](/engine/reference/commandline/dockerd/#daemon-storage-driver)
@z

@x
Save and close the file, and restart Docker.
@y
Save and close the file, and restart Docker.
@z

@x
## How the `zfs` storage driver works
@y
## How the `zfs` storage driver works
@z

@x
ZFS uses the following objects:
@y
ZFS uses the following objects:
@z

@x
- **filesystems**: thinly provisioned, with space allocated from the `zpool` on
  demand.
- **snapshots**: read-only space-efficient point-in-time copies of filesystems.
- **clones**: Read-write copies of snapshots. Used for storing the differences
  from the previous layer.
@y
- **filesystems**: thinly provisioned, with space allocated from the `zpool` on
  demand.
- **snapshots**: read-only space-efficient point-in-time copies of filesystems.
- **clones**: Read-write copies of snapshots. Used for storing the differences
  from the previous layer.
@z

@x
The process of creating a clone:
@y
The process of creating a clone:
@z

@x
![zfs snapshots and clones](images/zfs_clones.jpg)
@y
![zfs snapshots and clones](images/zfs_clones.jpg)
@z

@x
1.  A read-only snapshot is created from the filesystem.
2.  A writable clone is created from the snapshot. This contains any differences
    from the parent layer.
@y
1.  A read-only snapshot is created from the filesystem.
2.  A writable clone is created from the snapshot. This contains any differences
    from the parent layer.
@z

@x
Filesystems, snapshots, and clones all allocate space from the underlying
`zpool`.
@y
Filesystems, snapshots, and clones all allocate space from the underlying
`zpool`.
@z

@x
### Image and container layers on-disk
@y
### Image and container layers on-disk
@z

@x
Each running container's unified filesystem is mounted on a mount point in
`/var/lib/docker/zfs/graph/`. Continue reading for an explanation of how the
unified filesystem is composed.
@y
Each running container's unified filesystem is mounted on a mount point in
`/var/lib/docker/zfs/graph/`. Continue reading for an explanation of how the
unified filesystem is composed.
@z

@x
### Image layering and sharing
@y
### Image layering and sharing
@z

@x
The base layer of an image is a ZFS filesystem. Each child layer is a ZFS clone
based on a ZFS snapshot of the layer below it. A container is a ZFS clone based
on a ZFS Snapshot of the top layer of the image it's created from.
@y
The base layer of an image is a ZFS filesystem. Each child layer is a ZFS clone
based on a ZFS snapshot of the layer below it. A container is a ZFS clone based
on a ZFS Snapshot of the top layer of the image it's created from.
@z

@x
The diagram below shows how this is put together with a running container based
on a two-layer image.
@y
The diagram below shows how this is put together with a running container based
on a two-layer image.
@z

@x
![zfs pool for Docker container](images/zfs_zpool.jpg)
@y
![zfs pool for Docker container](images/zfs_zpool.jpg)
@z

@x
When you start a container, the following steps happen in order:
@y
When you start a container, the following steps happen in order:
@z

@x
1.  The base layer of the image exists on the Docker host as a ZFS filesystem.
@y
1.  The base layer of the image exists on the Docker host as a ZFS filesystem.
@z

@x
2.  Additional image layers are clones of the dataset hosting the image layer
    directly below it.
@y
2.  Additional image layers are clones of the dataset hosting the image layer
    directly below it.
@z

@x
    In the diagram, "Layer 1" is added by taking a ZFS snapshot of the base
    layer and then creating a clone from that snapshot. The clone is writable and
    consumes space on-demand from the zpool. The snapshot is read-only,
    maintaining the base layer as an immutable object.
@y
    In the diagram, "Layer 1" is added by taking a ZFS snapshot of the base
    layer and then creating a clone from that snapshot. The clone is writable and
    consumes space on-demand from the zpool. The snapshot is read-only,
    maintaining the base layer as an immutable object.
@z

@x
3.  When the container is launched, a writable layer is added above the image.
@y
3.  When the container is launched, a writable layer is added above the image.
@z

@x
    In the diagram, the container's read-write layer is created by making
    a snapshot of the top layer of the image (Layer 1) and creating a clone from
    that snapshot.
@y
    In the diagram, the container's read-write layer is created by making
    a snapshot of the top layer of the image (Layer 1) and creating a clone from
    that snapshot.
@z

@x
4.  As the container modifies the contents of its writable layer, space is
    allocated for the blocks that are changed. By default, these blocks are
    128k.
@y
4.  As the container modifies the contents of its writable layer, space is
    allocated for the blocks that are changed. By default, these blocks are
    128k.
@z

@x
## How container reads and writes work with `zfs`
@y
## How container reads and writes work with `zfs`
@z

@x
### Reading files
@y
### Reading files
@z

@x
Each container's writable layer is a ZFS clone which shares all its data with
the dataset it was created from (the snapshots of its parent layers). Read
operations are fast, even if the data being read is from a deep layer.
This diagram illustrates how block sharing works:
@y
Each container's writable layer is a ZFS clone which shares all its data with
the dataset it was created from (the snapshots of its parent layers). Read
operations are fast, even if the data being read is from a deep layer.
This diagram illustrates how block sharing works:
@z

@x
![zfs block sharing](images/zpool_blocks.jpg)
@y
![zfs block sharing](images/zpool_blocks.jpg)
@z

@x
### Writing files
@y
### Writing files
@z

@x
**Writing a new file**: space is allocated on demand from the underlying `zpool`
and the blocks are written directly into the container's writable layer.
@y
**Writing a new file**: space is allocated on demand from the underlying `zpool`
and the blocks are written directly into the container's writable layer.
@z

@x
**Modifying an existing file**: space is allocated only for the changed blocks,
and those blocks are written into the container's writable layer using a
copy-on-write (CoW) strategy. This minimizes the size of the layer and increases
write performance.
@y
**Modifying an existing file**: space is allocated only for the changed blocks,
and those blocks are written into the container's writable layer using a
copy-on-write (CoW) strategy. This minimizes the size of the layer and increases
write performance.
@z

@x
**Deleting a file or directory**:
  - When you delete a file or directory that exists in a lower layer, the ZFS
    driver masks the existence of the file or directory in the container's
    writable layer, even though the file or directory still exists in the lower
    read-only layers.
  - If you create and then delete a file or directory within the container's
    writable layer, the blocks are reclaimed by the `zpool`.
@y
**Deleting a file or directory**:
  - When you delete a file or directory that exists in a lower layer, the ZFS
    driver masks the existence of the file or directory in the container's
    writable layer, even though the file or directory still exists in the lower
    read-only layers.
  - If you create and then delete a file or directory within the container's
    writable layer, the blocks are reclaimed by the `zpool`.
@z

@x
## ZFS and Docker performance
@y
## ZFS and Docker performance
@z

@x
There are several factors that influence the performance of Docker using the
`zfs` storage driver.
@y
There are several factors that influence the performance of Docker using the
`zfs` storage driver.
@z

@x
- **Memory**: Memory has a major impact on ZFS performance. ZFS was originally
  designed for large enterprise-grade servers with a large amount of memory.
@y
- **Memory**: Memory has a major impact on ZFS performance. ZFS was originally
  designed for large enterprise-grade servers with a large amount of memory.
@z

@x
- **ZFS Features**: ZFS includes a de-duplication feature. Using this feature
  may save disk space, but uses a large amount of memory. It is recommended that
  you disable this feature for the `zpool` you are using with Docker, unless you
  are using SAN, NAS, or other hardware RAID technologies.
@y
- **ZFS Features**: ZFS includes a de-duplication feature. Using this feature
  may save disk space, but uses a large amount of memory. It is recommended that
  you disable this feature for the `zpool` you are using with Docker, unless you
  are using SAN, NAS, or other hardware RAID technologies.
@z

@x
- **ZFS Caching**: ZFS caches disk blocks in a memory structure called the
  adaptive replacement cache (ARC). The *Single Copy ARC* feature of ZFS allows
  a single cached copy of a block to be shared by multiple clones of a
  With this feature, multiple running containers can share a single copy of a
  cached block. This feature makes ZFS a good option for PaaS and other
  high-density use cases.
@y
- **ZFS Caching**: ZFS caches disk blocks in a memory structure called the
  adaptive replacement cache (ARC). The *Single Copy ARC* feature of ZFS allows
  a single cached copy of a block to be shared by multiple clones of a
  With this feature, multiple running containers can share a single copy of a
  cached block. This feature makes ZFS a good option for PaaS and other
  high-density use cases.
@z

@x
- **Fragmentation**: Fragmentation is a natural byproduct of copy-on-write
  filesystems like ZFS. ZFS mitigates this by using a small block size of 128k.
  The ZFS intent log (ZIL) and the coalescing of writes (delayed writes) also
  help to reduce fragmentation. You can monitor fragmentation using
  `zpool status`. However, there is no way to defragment ZFS without reformatting
  and restoring the filesystem.
@y
- **Fragmentation**: Fragmentation is a natural byproduct of copy-on-write
  filesystems like ZFS. ZFS mitigates this by using a small block size of 128k.
  The ZFS intent log (ZIL) and the coalescing of writes (delayed writes) also
  help to reduce fragmentation. You can monitor fragmentation using
  `zpool status`. However, there is no way to defragment ZFS without reformatting
  and restoring the filesystem.
@z

@x
- **Use the native ZFS driver for Linux**: The ZFS FUSE implementation is not
  recommended, due to poor performance.
@y
- **Use the native ZFS driver for Linux**: The ZFS FUSE implementation is not
  recommended, due to poor performance.
@z

@x
### Performance best practices
@y
### Performance best practices
@z

@x
- **Use fast storage**:  Solid-state drives (SSDs) provide faster reads and
  writes than spinning disks.
@y
- **Use fast storage**:  Solid-state drives (SSDs) provide faster reads and
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
