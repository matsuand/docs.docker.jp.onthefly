%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explains how to use storage drivers
keywords: registry, on-prem, images, tags, repository, distribution, storage drivers, advanced
redirect_from:
- /registry/storagedrivers/
title: Docker Registry storage driver
---
@y
---
description: Explains how to use storage drivers
keywords: registry, on-prem, images, tags, repository, distribution, storage drivers, advanced
redirect_from:
- /registry/storagedrivers/
title: Docker Registry storage driver
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
This document describes the registry storage driver model, implementation, and explains how to contribute new storage drivers.
@y
This document describes the registry storage driver model, implementation, and explains how to contribute new storage drivers.
@z

@x
## Provided drivers
@y
## Provided drivers
@z

@x
This storage driver package comes bundled with several drivers:
@y
This storage driver package comes bundled with several drivers:
@z

@x
- [inmemory](inmemory.md): A temporary storage driver using a local inmemory map. This exists solely for reference and testing.
- [filesystem](filesystem.md): A local storage driver configured to use a directory tree in the local filesystem.
- [s3](s3.md): A driver storing objects in an Amazon Simple Storage Service (S3) bucket.
- [azure](azure.md): A driver storing objects in [Microsoft Azure Blob Storage](https://azure.microsoft.com/en-us/services/storage/).
- [swift](swift.md): A driver storing objects in [Openstack Swift](https://docs.openstack.org/swift/latest/).
- [oss](oss.md): A driver storing objects in [Aliyun OSS](http://www.aliyun.com/product/oss).
- [gcs](gcs.md): A driver storing objects in a [Google Cloud Storage](https://cloud.google.com/storage/) bucket.
@y
- [inmemory](inmemory.md): A temporary storage driver using a local inmemory map. This exists solely for reference and testing.
- [filesystem](filesystem.md): A local storage driver configured to use a directory tree in the local filesystem.
- [s3](s3.md): A driver storing objects in an Amazon Simple Storage Service (S3) bucket.
- [azure](azure.md): A driver storing objects in [Microsoft Azure Blob Storage](https://azure.microsoft.com/en-us/services/storage/).
- [swift](swift.md): A driver storing objects in [Openstack Swift](https://docs.openstack.org/swift/latest/).
- [oss](oss.md): A driver storing objects in [Aliyun OSS](http://www.aliyun.com/product/oss).
- [gcs](gcs.md): A driver storing objects in a [Google Cloud Storage](https://cloud.google.com/storage/) bucket.
@z

@x
## Storage driver API
@y
## Storage driver API
@z

@x
The storage driver API is designed to model a filesystem-like key/value storage in a manner abstract enough to support a range of drivers from the local filesystem to Amazon S3 or other distributed object storage systems.
@y
The storage driver API is designed to model a filesystem-like key/value storage in a manner abstract enough to support a range of drivers from the local filesystem to Amazon S3 or other distributed object storage systems.
@z

@x
Storage drivers are required to implement the `storagedriver.StorageDriver` interface provided in `storagedriver.go`, which includes methods for reading, writing, and deleting content, as well as listing child objects of a specified prefix key.
@y
Storage drivers are required to implement the `storagedriver.StorageDriver` interface provided in `storagedriver.go`, which includes methods for reading, writing, and deleting content, as well as listing child objects of a specified prefix key.
@z

@x
Storage drivers are intended to be written in Go, providing compile-time
validation of the `storagedriver.StorageDriver` interface.
@y
Storage drivers are intended to be written in Go, providing compile-time
validation of the `storagedriver.StorageDriver` interface.
@z

@x
## Driver selection and configuration
@y
## Driver selection and configuration
@z

@x
The preferred method of selecting a storage driver is using the `StorageDriverFactory` interface in the `storagedriver/factory` package. These factories provide a common interface for constructing storage drivers with a parameters map. The factory model is based on the [Register](http://golang.org/pkg/database/sql/#Register) and [Open](http://golang.org/pkg/database/sql/#Open) methods in the builtin [database/sql](http://golang.org/pkg/database/sql) package.
@y
The preferred method of selecting a storage driver is using the `StorageDriverFactory` interface in the `storagedriver/factory` package. These factories provide a common interface for constructing storage drivers with a parameters map. The factory model is based on the [Register](http://golang.org/pkg/database/sql/#Register) and [Open](http://golang.org/pkg/database/sql/#Open) methods in the builtin [database/sql](http://golang.org/pkg/database/sql) package.
@z

@x
Storage driver factories may be registered by name using the
`factory.Register` method, and then later invoked by calling `factory.Create`
with a driver name and parameters map. If no such storage driver can be found,
`factory.Create` returns an `InvalidStorageDriverError`.
@y
Storage driver factories may be registered by name using the
`factory.Register` method, and then later invoked by calling `factory.Create`
with a driver name and parameters map. If no such storage driver can be found,
`factory.Create` returns an `InvalidStorageDriverError`.
@z

@x
## Driver contribution
@y
## Driver contribution
@z

@x
### Writing new storage drivers
@y
### Writing new storage drivers
@z

@x
To create a valid storage driver, one must implement the
`storagedriver.StorageDriver` interface and make sure to expose this driver
via the factory system.
@y
To create a valid storage driver, one must implement the
`storagedriver.StorageDriver` interface and make sure to expose this driver
via the factory system.
@z

@x
#### Registering
@y
#### Registering
@z

@x
Storage drivers should call `factory.Register` with their driver name in an `init` method, allowing callers of `factory.New` to construct instances of this driver without requiring modification of imports throughout the codebase.
@y
Storage drivers should call `factory.Register` with their driver name in an `init` method, allowing callers of `factory.New` to construct instances of this driver without requiring modification of imports throughout the codebase.
@z

@x
## Testing
@y
## Testing
@z

@x
Storage driver test suites are provided in
`storagedriver/testsuites/testsuites.go` and may be used for any storage
driver written in Go. Tests can be registered using the `RegisterSuite`
function, which run the same set of tests for any registered drivers.
@y
Storage driver test suites are provided in
`storagedriver/testsuites/testsuites.go` and may be used for any storage
driver written in Go. Tests can be registered using the `RegisterSuite`
function, which run the same set of tests for any registered drivers.
@z
