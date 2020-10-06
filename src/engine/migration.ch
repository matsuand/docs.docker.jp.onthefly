%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Migrate to Engine 1.10
keywords: docker, documentation, engine, upgrade, migration
title: Migrate to Engine 1.10
---
@y
---
description: Migrate to Engine 1.10
keywords: docker, documentation, engine, upgrade, migration
title: Migrate to Engine 1.10
---
@z

@x
Starting from version 1.10 of Docker Engine, we completely change the way image
data is addressed on disk. Previously, every image and layer used a randomly
assigned UUID. In 1.10 we implemented a content addressable method using an ID,
based on a secure hash of the image and layer data.
@y
Starting from version 1.10 of Docker Engine, we completely change the way image
data is addressed on disk. Previously, every image and layer used a randomly
assigned UUID. In 1.10 we implemented a content addressable method using an ID,
based on a secure hash of the image and layer data.
@z

@x
The new method gives users more security, provides a built-in way to avoid ID
collisions and guarantee data integrity after pull, push, load, or save. It also
brings better sharing of layers by allowing many images to freely share their
layers even if they didn’t come from the same build.
@y
The new method gives users more security, provides a built-in way to avoid ID
collisions and guarantee data integrity after pull, push, load, or save. It also
brings better sharing of layers by allowing many images to freely share their
layers even if they didn’t come from the same build.
@z

@x
Addressing images by their content also lets us more easily detect if something
has already been downloaded. Because we have separated images and layers, you
don’t need to pull the configurations for every image that was part of the
original build chain. We also don’t need to create layers for the build
instructions that didn’t modify the filesystem.
@y
Addressing images by their content also lets us more easily detect if something
has already been downloaded. Because we have separated images and layers, you
don’t need to pull the configurations for every image that was part of the
original build chain. We also don’t need to create layers for the build
instructions that didn’t modify the filesystem.
@z

@x
Content addressability is the foundation for the new distribution features. The
image pull and push code has been reworked to use a download/upload manager
concept that makes pushing and pulling images much more stable and mitigates any
parallel request issues. The download manager also brings retries on failed
downloads and better prioritization for concurrent downloads.
@y
Content addressability is the foundation for the new distribution features. The
image pull and push code has been reworked to use a download/upload manager
concept that makes pushing and pulling images much more stable and mitigates any
parallel request issues. The download manager also brings retries on failed
downloads and better prioritization for concurrent downloads.
@z

@x
We are also introducing a new manifest format that is built on top of the
content addressable base. It directly references the content addressable image
configuration and layer checksums. The new manifest format also makes it
possible for a manifest list to be used for targeting multiple
architectures/platforms. Moving to the new manifest format is completely
transparent.
@y
We are also introducing a new manifest format that is built on top of the
content addressable base. It directly references the content addressable image
configuration and layer checksums. The new manifest format also makes it
possible for a manifest list to be used for targeting multiple
architectures/platforms. Moving to the new manifest format is completely
transparent.
@z

@x
## Prepare for upgrade
@y
## Prepare for upgrade
@z

@x
To make your current images accessible to the new model we need to migrate them
to content addressable storage. This means calculating the secure checksums for
your current data.
@y
To make your current images accessible to the new model we need to migrate them
to content addressable storage. This means calculating the secure checksums for
your current data.
@z

@x
All your current images, tags, and containers are automatically migrated to the
new foundation the first time you start Docker Engine 1.10. Before loading your
container, the daemon calculates all needed checksums for your current data,
and after it has completed, all your images and tags have brand new secure
IDs.
@y
All your current images, tags, and containers are automatically migrated to the
new foundation the first time you start Docker Engine 1.10. Before loading your
container, the daemon calculates all needed checksums for your current data,
and after it has completed, all your images and tags have brand new secure
IDs.
@z

@x
**While this is simple operation, calculating SHA256 checksums for your files
can take time if you have lots of image data.** On average you should assume
that migrator can process data at a speed of 100MB/s. During this time your
Docker daemon won’t be ready to respond to requests.
@y
**While this is simple operation, calculating SHA256 checksums for your files
can take time if you have lots of image data.** On average you should assume
that migrator can process data at a speed of 100MB/s. During this time your
Docker daemon won’t be ready to respond to requests.
@z

@x
## Minimize migration time
@y
## Minimize migration time
@z

@x
If you can accept this one time hit, then upgrading Docker Engine and restarting
the daemon transparently migrates your images. However, if you want to
minimize the daemon’s downtime, a migration utility can be run while your old
daemon is still running.
@y
If you can accept this one time hit, then upgrading Docker Engine and restarting
the daemon transparently migrates your images. However, if you want to
minimize the daemon’s downtime, a migration utility can be run while your old
daemon is still running.
@z

@x
This tool finds all your current images and calculate the checksums for
them. After you upgrade and restart the daemon, the checksum data of the
migrated images already exist, freeing the daemon from that computation
work. If new images appeared between the migration and the upgrade, those are
processed at time of upgrade to 1.10.
@y
This tool finds all your current images and calculate the checksums for
them. After you upgrade and restart the daemon, the checksum data of the
migrated images already exist, freeing the daemon from that computation
work. If new images appeared between the migration and the upgrade, those are
processed at time of upgrade to 1.10.
@z

@x
[You can download the migration tool
here.](https://github.com/docker/v1.10-migrator/releases)
@y
[You can download the migration tool
here.](https://github.com/docker/v1.10-migrator/releases)
@z

@x
The migration tool can also be run as a Docker image. While running the migrator
image you need to expose your Docker data directory to the container. If you use
the default path then you would run:
@y
The migration tool can also be run as a Docker image. While running the migrator
image you need to expose your Docker data directory to the container. If you use
the default path then you would run:
@z

@x
    $ docker run --rm -v /var/lib/docker:/var/lib/docker docker/v1.10-migrator
@y
    $ docker run --rm -v /var/lib/docker:/var/lib/docker docker/v1.10-migrator
@z

@x
If you use the
devicemapper storage driver, you also need to pass the flag `--privileged` to
give the tool access to your storage devices.
@y
If you use the
devicemapper storage driver, you also need to pass the flag `--privileged` to
give the tool access to your storage devices.
@z
