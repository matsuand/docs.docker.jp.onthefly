%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explains how to use the Azure storage drivers
keywords: registry, service, driver, images, storage,  azure
title: Microsoft Azure storage driver
---
@y
---
description: Explains how to use the Azure storage drivers
keywords: registry, service, driver, images, storage,  azure
title: Microsoft Azure storage driver
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
An implementation of the `storagedriver.StorageDriver` interface which uses [Microsoft Azure Blob Storage](http://azure.microsoft.com/en-us/services/storage/) for object storage.
@y
An implementation of the `storagedriver.StorageDriver` interface which uses [Microsoft Azure Blob Storage](http://azure.microsoft.com/en-us/services/storage/) for object storage.
@z

@x
## Parameters
@y
## Parameters
@z

@x
| Parameter     | Required | Description                                                                                                                                                                                                                                                         |
|:--------------|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `accountname` | yes      | Name of the Azure Storage Account.                                                                                                                                                                                                                                  |
| `accountkey`  | yes      | Primary or Secondary Key for the Storage Account.                                                                                                                                                                                                                   |
| `container`   | yes      | Name of the Azure root storage container in which all registry data is stored. Must comply the storage container name [requirements](https://docs.microsoft.com/rest/api/storageservices/fileservices/naming-and-referencing-containers--blobs--and-metadata). For example, if your url is `https://myaccount.blob.core.windows.net/myblob` use the container value of `myblob`.|
| `realm`       | no       | Domain name suffix for the Storage Service API endpoint. For example realm for "Azure in China" would be `core.chinacloudapi.cn` and realm for "Azure Government" would be `core.usgovcloudapi.net`. By default, this is `core.windows.net`.                        |
@y
| Parameter     | Required | Description                                                                                                                                                                                                                                                         |
|:--------------|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `accountname` | yes      | Name of the Azure Storage Account.                                                                                                                                                                                                                                  |
| `accountkey`  | yes      | Primary or Secondary Key for the Storage Account.                                                                                                                                                                                                                   |
| `container`   | yes      | Name of the Azure root storage container in which all registry data is stored. Must comply the storage container name [requirements](https://docs.microsoft.com/rest/api/storageservices/fileservices/naming-and-referencing-containers--blobs--and-metadata). For example, if your url is `https://myaccount.blob.core.windows.net/myblob` use the container value of `myblob`.|
| `realm`       | no       | Domain name suffix for the Storage Service API endpoint. For example realm for "Azure in China" would be `core.chinacloudapi.cn` and realm for "Azure Government" would be `core.usgovcloudapi.net`. By default, this is `core.windows.net`.                        |
@z

@x
## Related information
@y
## Related information
@z

@x
* To get information about
[azure-blob-storage](http://azure.microsoft.com/en-us/services/storage/), visit
the Microsoft website.
* You can use Microsoft's [Blob Service REST API](https://msdn.microsoft.com/en-us/library/azure/dd135733.aspx) to [create a storage container](https://msdn.microsoft.com/en-us/library/azure/dd179468.aspx).
@y
* To get information about
[azure-blob-storage](http://azure.microsoft.com/en-us/services/storage/), visit
the Microsoft website.
* You can use Microsoft's [Blob Service REST API](https://msdn.microsoft.com/en-us/library/azure/dd135733.aspx) to [create a storage container](https://msdn.microsoft.com/en-us/library/azure/dd179468.aspx).
@z
