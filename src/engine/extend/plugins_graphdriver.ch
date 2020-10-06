%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "How to manage image and container filesystems with external plugins"
keywords: "Examples, Usage, storage, image, docker, data, graph, plugin, api"
advisory: experimental
---
@y
---
description: "How to manage image and container filesystems with external plugins"
keywords: "Examples, Usage, storage, image, docker, data, graph, plugin, api"
advisory: experimental
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
# Graphdriver plugins
@y
# Graphdriver plugins
@z

@x
## Changelog
@y
## Changelog
@z

@x
### 1.13.0
@y
### 1.13.0
@z

@x
- Support v2 plugins
@y
- Support v2 plugins
@z

@x
# Docker graph driver plugins
@y
# Docker graph driver plugins
@z

@x
Docker graph driver plugins enable admins to use an external/out-of-process
graph driver for use with Docker engine. This is an alternative to using the
built-in storage drivers, such as aufs/overlay/devicemapper/btrfs.
@y
Docker graph driver plugins enable admins to use an external/out-of-process
graph driver for use with Docker engine. This is an alternative to using the
built-in storage drivers, such as aufs/overlay/devicemapper/btrfs.
@z

@x
You need to install and enable the plugin and then restart the Docker daemon
before using the plugin. See the following example for the correct ordering
of steps.
@y
You need to install and enable the plugin and then restart the Docker daemon
before using the plugin. See the following example for the correct ordering
of steps.
@z

@x
```
$ docker plugin install cpuguy83/docker-overlay2-graphdriver-plugin # this command also enables the driver
<output suppressed>
$ pkill dockerd
$ dockerd --experimental -s cpuguy83/docker-overlay2-graphdriver-plugin
```
@y
```
$ docker plugin install cpuguy83/docker-overlay2-graphdriver-plugin # this command also enables the driver
<output suppressed>
$ pkill dockerd
$ dockerd --experimental -s cpuguy83/docker-overlay2-graphdriver-plugin
```
@z

@x
# Write a graph driver plugin
@y
# Write a graph driver plugin
@z

@x
See the [plugin documentation](https://docs.docker.com/engine/extend/) for detailed information
on the underlying plugin protocol.
@y
See the [plugin documentation](https://docs.docker.com/engine/extend/) for detailed information
on the underlying plugin protocol.
@z

@x
## Graph Driver plugin protocol
@y
## Graph Driver plugin protocol
@z

@x
If a plugin registers itself as a `GraphDriver` when activated, then it is
expected to provide the rootfs for containers as well as image layer storage.
@y
If a plugin registers itself as a `GraphDriver` when activated, then it is
expected to provide the rootfs for containers as well as image layer storage.
@z

@x
### /GraphDriver.Init
@y
### /GraphDriver.Init
@z

@x
**Request**:
```json
{
  "Home": "/graph/home/path",
  "Opts": [],
  "UIDMaps": [],
  "GIDMaps": []
}
```
@y
**Request**:
```json
{
  "Home": "/graph/home/path",
  "Opts": [],
  "UIDMaps": [],
  "GIDMaps": []
}
```
@z

@x
Initialize the graph driver plugin with a home directory and array of options.
These are passed through from the user, but the plugin is not required to parse
or honor them.
@y
Initialize the graph driver plugin with a home directory and array of options.
These are passed through from the user, but the plugin is not required to parse
or honor them.
@z

@x
The request also includes a list of UID and GID mappings, structed as follows:
```json
{
  "ContainerID": 0,
  "HostID": 0,
  "Size": 0
}
```
@y
The request also includes a list of UID and GID mappings, structed as follows:
```json
{
  "ContainerID": 0,
  "HostID": 0,
  "Size": 0
}
```
@z

@x
**Response**:
```json
{
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Err": ""
}
```
@z

@x
Respond with a non-empty string error if an error occurred.
@y
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.Capabilities
@y
### /GraphDriver.Capabilities
@z

@x
**Request**:
```json
{}
```
@y
**Request**:
```json
{}
```
@z

@x
Get behavioral characteristics of the graph driver. If a plugin does not handle
this request, the engine will use default values for all capabilities.
@y
Get behavioral characteristics of the graph driver. If a plugin does not handle
this request, the engine will use default values for all capabilities.
@z

@x
**Response**:
```json
{
  "ReproducesExactDiffs": false,
}
```
@y
**Response**:
```json
{
  "ReproducesExactDiffs": false,
}
```
@z

@x
Respond with values of capabilities:
@y
Respond with values of capabilities:
@z

@x
* **ReproducesExactDiffs** Defaults to false. Flags that this driver is capable
of reproducing exactly equivalent diffs for read-only filesystem layers.
@y
* **ReproducesExactDiffs** Defaults to false. Flags that this driver is capable
of reproducing exactly equivalent diffs for read-only filesystem layers.
@z

@x
### /GraphDriver.Create
@y
### /GraphDriver.Create
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142",
  "MountLabel": "",
  "StorageOpt": {}
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142",
  "MountLabel": "",
  "StorageOpt": {}
}
```
@z

@x
Create a new, empty, read-only filesystem layer with the specified
`ID`, `Parent` and `MountLabel`. If `Parent` is an empty string, there is no
parent layer. `StorageOpt` is map of strings which indicate storage options.
@y
Create a new, empty, read-only filesystem layer with the specified
`ID`, `Parent` and `MountLabel`. If `Parent` is an empty string, there is no
parent layer. `StorageOpt` is map of strings which indicate storage options.
@z

@x
**Response**:
```json
{
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Err": ""
}
```
@z

@x
Respond with a non-empty string error if an error occurred.
@y
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.CreateReadWrite
@y
### /GraphDriver.CreateReadWrite
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142",
  "MountLabel": "",
  "StorageOpt": {}
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142",
  "MountLabel": "",
  "StorageOpt": {}
}
```
@z

@x
Similar to `/GraphDriver.Create` but creates a read-write filesystem layer.
@y
Similar to `/GraphDriver.Create` but creates a read-write filesystem layer.
@z

@x
### /GraphDriver.Remove
@y
### /GraphDriver.Remove
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187"
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187"
}
```
@z

@x
Remove the filesystem layer with this given `ID`.
@y
Remove the filesystem layer with this given `ID`.
@z

@x
**Response**:
```json
{
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Err": ""
}
```
@z

@x
Respond with a non-empty string error if an error occurred.
@y
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.Get
@y
### /GraphDriver.Get
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "MountLabel": ""
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "MountLabel": ""
}
```
@z

@x
Get the mountpoint for the layered filesystem referred to by the given `ID`.
@y
Get the mountpoint for the layered filesystem referred to by the given `ID`.
@z

@x
**Response**:
```json
{
  "Dir": "/var/mygraph/46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Dir": "/var/mygraph/46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Err": ""
}
```
@z

@x
Respond with the absolute path to the mounted layered filesystem.
Respond with a non-empty string error if an error occurred.
@y
Respond with the absolute path to the mounted layered filesystem.
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.Put
@y
### /GraphDriver.Put
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187"
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187"
}
```
@z

@x
Release the system resources for the specified `ID`, such as unmounting the
filesystem layer.
@y
Release the system resources for the specified `ID`, such as unmounting the
filesystem layer.
@z

@x
**Response**:
```json
{
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Err": ""
}
```
@z

@x
Respond with a non-empty string error if an error occurred.
@y
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.Exists
@y
### /GraphDriver.Exists
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187"
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187"
}
```
@z

@x
Determine if a filesystem layer with the specified `ID` exists.
@y
Determine if a filesystem layer with the specified `ID` exists.
@z

@x
**Response**:
```json
{
  "Exists": true
}
```
@y
**Response**:
```json
{
  "Exists": true
}
```
@z

@x
Respond with a boolean for whether or not the filesystem layer with the specified
`ID` exists.
@y
Respond with a boolean for whether or not the filesystem layer with the specified
`ID` exists.
@z

@x
### /GraphDriver.Status
@y
### /GraphDriver.Status
@z

@x
**Request**:
```json
{}
```
@y
**Request**:
```json
{}
```
@z

@x
Get low-level diagnostic information about the graph driver.
@y
Get low-level diagnostic information about the graph driver.
@z

@x
**Response**:
```json
{
  "Status": [[]]
}
```
@y
**Response**:
```json
{
  "Status": [[]]
}
```
@z

@x
Respond with a 2-D array with key/value pairs for the underlying status
information.
@y
Respond with a 2-D array with key/value pairs for the underlying status
information.
@z

@x
### /GraphDriver.GetMetadata
@y
### /GraphDriver.GetMetadata
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187"
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187"
}
```
@z

@x
Get low-level diagnostic information about the layered filesystem with the
with the specified `ID`
@y
Get low-level diagnostic information about the layered filesystem with the
with the specified `ID`
@z

@x
**Response**:
```json
{
  "Metadata": {},
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Metadata": {},
  "Err": ""
}
```
@z

@x
Respond with a set of key/value pairs containing the low-level diagnostic
information about the layered filesystem.
Respond with a non-empty string error if an error occurred.
@y
Respond with a set of key/value pairs containing the low-level diagnostic
information about the layered filesystem.
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.Cleanup
@y
### /GraphDriver.Cleanup
@z

@x
**Request**:
```json
{}
```
@y
**Request**:
```json
{}
```
@z

@x
Perform necessary tasks to release resources help by the plugin, such as
unmounting all the layered file systems.
@y
Perform necessary tasks to release resources help by the plugin, such as
unmounting all the layered file systems.
@z

@x
**Response**:
```json
{
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Err": ""
}
```
@z

@x
Respond with a non-empty string error if an error occurred.
@y
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.Diff
@y
### /GraphDriver.Diff
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142"
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142"
}
```
@z

@x
Get an archive of the changes between the filesystem layers specified by the `ID`
and `Parent`. `Parent` may be an empty string, in which case there is no parent.
@y
Get an archive of the changes between the filesystem layers specified by the `ID`
and `Parent`. `Parent` may be an empty string, in which case there is no parent.
@z

@x
**Response**:
```
{% raw %}
{{ TAR STREAM }}
{% endraw %}
```
@y
**Response**:
```
{% raw %}
{{ TAR STREAM }}
{% endraw %}
```
@z

@x
### /GraphDriver.Changes
@y
### /GraphDriver.Changes
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142"
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142"
}
```
@z

@x
Get a list of changes between the filesystem layers specified by the `ID` and
`Parent`. If `Parent` is an empty string, there is no parent.
@y
Get a list of changes between the filesystem layers specified by the `ID` and
`Parent`. If `Parent` is an empty string, there is no parent.
@z

@x
**Response**:
```json
{
  "Changes": [{}],
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Changes": [{}],
  "Err": ""
}
```
@z

@x
Respond with a list of changes. The structure of a change is:
```json
  "Path": "/some/path",
  "Kind": 0,
```
@y
Respond with a list of changes. The structure of a change is:
```json
  "Path": "/some/path",
  "Kind": 0,
```
@z

@x
Where the `Path` is the filesystem path within the layered filesystem that is
changed and `Kind` is an integer specifying the type of change that occurred:
@y
Where the `Path` is the filesystem path within the layered filesystem that is
changed and `Kind` is an integer specifying the type of change that occurred:
@z

@x
- 0 - Modified
- 1 - Added
- 2 - Deleted
@y
- 0 - Modified
- 1 - Added
- 2 - Deleted
@z

@x
Respond with a non-empty string error if an error occurred.
@y
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.ApplyDiff
@y
### /GraphDriver.ApplyDiff
@z

@x
**Request**:
```
{% raw %}
{{ TAR STREAM }}
{% endraw %}
```
@y
**Request**:
```
{% raw %}
{{ TAR STREAM }}
{% endraw %}
```
@z

@x
Extract the changeset from the given diff into the layer with the specified `ID`
and `Parent`
@y
Extract the changeset from the given diff into the layer with the specified `ID`
and `Parent`
@z

@x
**Query Parameters**:
@y
**Query Parameters**:
@z

@x
- id (required)- the `ID` of the new filesystem layer to extract the diff to
- parent (required)- the `Parent` of the given `ID`
@y
- id (required)- the `ID` of the new filesystem layer to extract the diff to
- parent (required)- the `Parent` of the given `ID`
@z

@x
**Response**:
```json
{
  "Size": 512366,
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Size": 512366,
  "Err": ""
}
```
@z

@x
Respond with the size of the new layer in bytes.
Respond with a non-empty string error if an error occurred.
@y
Respond with the size of the new layer in bytes.
Respond with a non-empty string error if an error occurred.
@z

@x
### /GraphDriver.DiffSize
@y
### /GraphDriver.DiffSize
@z

@x
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142"
}
```
@y
**Request**:
```json
{
  "ID": "46fe8644f2572fd1e505364f7581e0c9dbc7f14640bd1fb6ce97714fb6fc5187",
  "Parent": "2cd9c322cb78a55e8212aa3ea8425a4180236d7106938ec921d0935a4b8ca142"
}
```
@z

@x
Calculate the changes between the specified `ID`
@y
Calculate the changes between the specified `ID`
@z

@x
**Response**:
```json
{
  "Size": 512366,
  "Err": ""
}
```
@y
**Response**:
```json
{
  "Size": 512366,
  "Err": ""
}
```
@z

@x
Respond with the size changes between the specified `ID` and `Parent`
Respond with a non-empty string error if an error occurred.
@y
Respond with the size changes between the specified `ID` and `Parent`
Respond with a non-empty string error if an error occurred.
@z
