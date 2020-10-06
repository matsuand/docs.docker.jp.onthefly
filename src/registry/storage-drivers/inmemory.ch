%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explains how to use the in-memory storage drivers
keywords: registry, service, driver, images, storage,  in-memory
title: In-memory storage driver (testing only)
---
@y
---
description: Explains how to use the in-memory storage drivers
keywords: registry, service, driver, images, storage,  in-memory
title: In-memory storage driver (testing only)
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
For purely tests purposes, you can use the `inmemory` storage driver. This
driver is an implementation of the `storagedriver.StorageDriver` interface which
uses local memory for object storage. If you would like to run a registry from
volatile memory, use the [`filesystem` driver](filesystem.md) on a ramdisk.
@y
For purely tests purposes, you can use the `inmemory` storage driver. This
driver is an implementation of the `storagedriver.StorageDriver` interface which
uses local memory for object storage. If you would like to run a registry from
volatile memory, use the [`filesystem` driver](filesystem.md) on a ramdisk.
@z

@x
**IMPORTANT**: This storage driver *does not* persist data across runs. This is why it is only suitable for testing. *Never* use this driver in production.
@y
**IMPORTANT**: This storage driver *does not* persist data across runs. This is why it is only suitable for testing. *Never* use this driver in production.
@z

@x
## Parameters
@y
## Parameters
@z

@x
None
@y
None
@z
