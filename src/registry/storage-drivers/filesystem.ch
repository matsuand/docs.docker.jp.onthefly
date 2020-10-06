%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explains how to use the filesystem storage drivers
keywords: registry, service, driver, images, storage,  filesystem
title: Filesystem storage driver
---
@y
---
description: Explains how to use the filesystem storage drivers
keywords: registry, service, driver, images, storage,  filesystem
title: Filesystem storage driver
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
An implementation of the `storagedriver.StorageDriver` interface which uses the local filesystem.
@y
An implementation of the `storagedriver.StorageDriver` interface which uses the local filesystem.
@z

@x
## Parameters
@y
## Parameters
@z

@x
* `rootdirectory`: (optional) The absolute path to a root directory tree in which
to store all registry files. The registry stores all its data here so make sure
there is adequate space available. Defaults to `/var/lib/registry`. If the directory
does not exist, it will be created honoring [`umask`](http://man7.org/linux/man-pages/man2/umask.2.html)
bits. If `umask` bits are not set, the resulting permission will be `0777`.
* `maxthreads`: (optional) The maximum number of simultaneous blocking filesystem
operations permitted within the registry. Each operation spawns a new thread and
may cause thread exhaustion issues if many are done in parallel. Defaults to
`100`, and cannot be lower than `25`.
@y
* `rootdirectory`: (optional) The absolute path to a root directory tree in which
to store all registry files. The registry stores all its data here so make sure
there is adequate space available. Defaults to `/var/lib/registry`. If the directory
does not exist, it will be created honoring [`umask`](http://man7.org/linux/man-pages/man2/umask.2.html)
bits. If `umask` bits are not set, the resulting permission will be `0777`.
* `maxthreads`: (optional) The maximum number of simultaneous blocking filesystem
operations permitted within the registry. Each operation spawns a new thread and
may cause thread exhaustion issues if many are done in parallel. Defaults to
`100`, and cannot be lower than `25`.
@z
