%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Engine API v1.21"
description: "API Documentation for Docker"
keywords: "API, Docker, rcli, REST, documentation"
redirect_from:
- /engine/reference/api/docker_remote_api_v1.21/
- /reference/api/docker_remote_api_v1.21/
---
@y
---
title: "Engine API v1.21"
description: "API Documentation for Docker"
keywords: "API, Docker, rcli, REST, documentation"
redirect_from:
- /engine/reference/api/docker_remote_api_v1.21/
- /reference/api/docker_remote_api_v1.21/
---
@z

@x
<!-- This file is maintained within the moby/moby GitHub
     repository at https://github.com/moby/moby/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the moby/moby GitHub
     repository at https://github.com/moby/moby/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
## 1. Brief introduction
@y
## 1. Brief introduction
@z

@x
 - The daemon listens on `unix:///var/run/docker.sock` but you can
   [Bind Docker to another host/port or a Unix socket](../reference/commandline/dockerd.md#bind-docker-to-another-host-port-or-a-unix-socket).
 - The API tends to be REST. However, for some complex commands, like `attach`
   or `pull`, the HTTP connection is hijacked to transport `stdout`,
   `stdin` and `stderr`.
 - A `Content-Length` header should be present in `POST` requests to endpoints
   that expect a body.
 - To lock to a specific version of the API, you prefix the URL with the version
   of the API to use. For example, `/v1.18/info`. If no version is included in
   the URL, the maximum supported API version is used.
 - If the API version specified in the URL is not supported by the daemon, a HTTP
   `400 Bad Request` error message is returned.
@y
 - The daemon listens on `unix:///var/run/docker.sock` but you can
   [Bind Docker to another host/port or a Unix socket](../reference/commandline/dockerd.md#bind-docker-to-another-host-port-or-a-unix-socket).
 - The API tends to be REST. However, for some complex commands, like `attach`
   or `pull`, the HTTP connection is hijacked to transport `stdout`,
   `stdin` and `stderr`.
 - A `Content-Length` header should be present in `POST` requests to endpoints
   that expect a body.
 - To lock to a specific version of the API, you prefix the URL with the version
   of the API to use. For example, `/v1.18/info`. If no version is included in
   the URL, the maximum supported API version is used.
 - If the API version specified in the URL is not supported by the daemon, a HTTP
   `400 Bad Request` error message is returned.
@z

@x
## 2. Endpoints
@y
## 2. Endpoints
@z

@x
### 2.1 Containers
@y
### 2.1 Containers
@z

@x
#### List containers
@y
#### List containers
@z

@x
`GET /containers/json`
@y
`GET /containers/json`
@z

@x
List containers
@y
List containers
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/containers/json?all=1&before=8dfafdbc3a40&size=1 HTTP/1.1
@y
    GET /v1.21/containers/json?all=1&before=8dfafdbc3a40&size=1 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    [
         {
                 "Id": "8dfafdbc3a40",
                 "Names":["/boring_feynman"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 1",
                 "Created": 1367854155,
                 "Status": "Exit 0",
                 "Ports": [{"PrivatePort": 2222, "PublicPort": 3333, "Type": "tcp"}],
                 "Labels": {
                         "com.example.vendor": "Acme",
                         "com.example.license": "GPL",
                         "com.example.version": "1.0"
                 },
                 "SizeRw": 12288,
                 "SizeRootFs": 0
         },
         {
                 "Id": "9cd87474be90",
                 "Names":["/coolName"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 222222",
                 "Created": 1367854155,
                 "Status": "Exit 0",
                 "Ports": [],
                 "Labels": {},
                 "SizeRw": 12288,
                 "SizeRootFs": 0
         },
         {
                 "Id": "3176a2479c92",
                 "Names":["/sleepy_dog"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 3333333333333333",
                 "Created": 1367854154,
                 "Status": "Exit 0",
                 "Ports":[],
                 "Labels": {},
                 "SizeRw":12288,
                 "SizeRootFs":0
         },
         {
                 "Id": "4cb07b47f9fb",
                 "Names":["/running_cat"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 444444444444444444444444444444444",
                 "Created": 1367854152,
                 "Status": "Exit 0",
                 "Ports": [],
                 "Labels": {},
                 "SizeRw": 12288,
                 "SizeRootFs": 0
         }
    ]
@y
    [
         {
                 "Id": "8dfafdbc3a40",
                 "Names":["/boring_feynman"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 1",
                 "Created": 1367854155,
                 "Status": "Exit 0",
                 "Ports": [{"PrivatePort": 2222, "PublicPort": 3333, "Type": "tcp"}],
                 "Labels": {
                         "com.example.vendor": "Acme",
                         "com.example.license": "GPL",
                         "com.example.version": "1.0"
                 },
                 "SizeRw": 12288,
                 "SizeRootFs": 0
         },
         {
                 "Id": "9cd87474be90",
                 "Names":["/coolName"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 222222",
                 "Created": 1367854155,
                 "Status": "Exit 0",
                 "Ports": [],
                 "Labels": {},
                 "SizeRw": 12288,
                 "SizeRootFs": 0
         },
         {
                 "Id": "3176a2479c92",
                 "Names":["/sleepy_dog"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 3333333333333333",
                 "Created": 1367854154,
                 "Status": "Exit 0",
                 "Ports":[],
                 "Labels": {},
                 "SizeRw":12288,
                 "SizeRootFs":0
         },
         {
                 "Id": "4cb07b47f9fb",
                 "Names":["/running_cat"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 444444444444444444444444444444444",
                 "Created": 1367854152,
                 "Status": "Exit 0",
                 "Ports": [],
                 "Labels": {},
                 "SizeRw": 12288,
                 "SizeRootFs": 0
         }
    ]
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **all** – 1/True/true or 0/False/false, Show all containers.
        Only running containers are shown by default (i.e., this defaults to false)
-   **limit** – Show `limit` last created
        containers, include non-running ones.
-   **since** – Show only containers created since Id, include
        non-running ones.
-   **before** – Show only containers created before Id, include
        non-running ones.
-   **size** – 1/True/true or 0/False/false, Show the containers
        sizes
-   **filters** - a JSON encoded value of the filters (a `map[string][]string`) to process on the containers list. Available filters:
  -   `exited=<int>`; -- containers with exit code of  `<int>` ;
  -   `status=`(`created`|`restarting`|`running`|`paused`|`exited`)
  -   `label=key` or `label="key=value"` of a container label
@y
-   **all** – 1/True/true or 0/False/false, Show all containers.
        Only running containers are shown by default (i.e., this defaults to false)
-   **limit** – Show `limit` last created
        containers, include non-running ones.
-   **since** – Show only containers created since Id, include
        non-running ones.
-   **before** – Show only containers created before Id, include
        non-running ones.
-   **size** – 1/True/true or 0/False/false, Show the containers
        sizes
-   **filters** - a JSON encoded value of the filters (a `map[string][]string`) to process on the containers list. Available filters:
  -   `exited=<int>`; -- containers with exit code of  `<int>` ;
  -   `status=`(`created`|`restarting`|`running`|`paused`|`exited`)
  -   `label=key` or `label="key=value"` of a container label
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **400** – bad parameter
-   **500** – server error
@y
-   **200** – no error
-   **400** – bad parameter
-   **500** – server error
@z

@x
#### Create a container
@y
#### Create a container
@z

@x
`POST /containers/create`
@y
`POST /containers/create`
@z

@x
Create a container
@y
Create a container
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.21/containers/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
           "Hostname": "",
           "Domainname": "",
           "User": "",
           "AttachStdin": false,
           "AttachStdout": true,
           "AttachStderr": true,
           "Tty": false,
           "OpenStdin": false,
           "StdinOnce": false,
           "Env": [
                   "FOO=bar",
                   "BAZ=quux"
           ],
           "Cmd": [
                   "date"
           ],
           "Entrypoint": null,
           "Image": "ubuntu",
           "Labels": {
                   "com.example.vendor": "Acme",
                   "com.example.license": "GPL",
                   "com.example.version": "1.0"
           },
           "Volumes": {
             "/volumes/data": {}
           },
           "WorkingDir": "",
           "NetworkDisabled": false,
           "MacAddress": "12:34:56:78:9a:bc",
           "ExposedPorts": {
                   "22/tcp": {}
           },
           "StopSignal": "SIGTERM",
           "HostConfig": {
             "Binds": ["/tmp:/tmp"],
             "Links": ["redis3:redis"],
             "LxcConf": {"lxc.utsname":"docker"},
             "Memory": 0,
             "MemorySwap": 0,
             "MemoryReservation": 0,
             "KernelMemory": 0,
             "CpuShares": 512,
             "CpuPeriod": 100000,
             "CpuQuota": 50000,
             "CpusetCpus": "0,1",
             "CpusetMems": "0,1",
             "BlkioWeight": 300,
             "MemorySwappiness": 60,
             "OomKillDisable": false,
             "PidMode": "",
             "PortBindings": { "22/tcp": [{ "HostPort": "11022" }] },
             "PublishAllPorts": false,
             "Privileged": false,
             "ReadonlyRootfs": false,
             "Dns": ["8.8.8.8"],
             "DnsOptions": [""],
             "DnsSearch": [""],
             "ExtraHosts": null,
             "VolumesFrom": ["parent", "other:ro"],
             "CapAdd": ["NET_ADMIN"],
             "CapDrop": ["MKNOD"],
             "GroupAdd": ["newgroup"],
             "RestartPolicy": { "Name": "", "MaximumRetryCount": 0 },
             "NetworkMode": "bridge",
             "Devices": [],
             "Ulimits": [{}],
             "LogConfig": { "Type": "json-file", "Config": {} },
             "SecurityOpt": [],
             "CgroupParent": "",
             "VolumeDriver": ""
          }
      }
@y
    {
           "Hostname": "",
           "Domainname": "",
           "User": "",
           "AttachStdin": false,
           "AttachStdout": true,
           "AttachStderr": true,
           "Tty": false,
           "OpenStdin": false,
           "StdinOnce": false,
           "Env": [
                   "FOO=bar",
                   "BAZ=quux"
           ],
           "Cmd": [
                   "date"
           ],
           "Entrypoint": null,
           "Image": "ubuntu",
           "Labels": {
                   "com.example.vendor": "Acme",
                   "com.example.license": "GPL",
                   "com.example.version": "1.0"
           },
           "Volumes": {
             "/volumes/data": {}
           },
           "WorkingDir": "",
           "NetworkDisabled": false,
           "MacAddress": "12:34:56:78:9a:bc",
           "ExposedPorts": {
                   "22/tcp": {}
           },
           "StopSignal": "SIGTERM",
           "HostConfig": {
             "Binds": ["/tmp:/tmp"],
             "Links": ["redis3:redis"],
             "LxcConf": {"lxc.utsname":"docker"},
             "Memory": 0,
             "MemorySwap": 0,
             "MemoryReservation": 0,
             "KernelMemory": 0,
             "CpuShares": 512,
             "CpuPeriod": 100000,
             "CpuQuota": 50000,
             "CpusetCpus": "0,1",
             "CpusetMems": "0,1",
             "BlkioWeight": 300,
             "MemorySwappiness": 60,
             "OomKillDisable": false,
             "PidMode": "",
             "PortBindings": { "22/tcp": [{ "HostPort": "11022" }] },
             "PublishAllPorts": false,
             "Privileged": false,
             "ReadonlyRootfs": false,
             "Dns": ["8.8.8.8"],
             "DnsOptions": [""],
             "DnsSearch": [""],
             "ExtraHosts": null,
             "VolumesFrom": ["parent", "other:ro"],
             "CapAdd": ["NET_ADMIN"],
             "CapDrop": ["MKNOD"],
             "GroupAdd": ["newgroup"],
             "RestartPolicy": { "Name": "", "MaximumRetryCount": 0 },
             "NetworkMode": "bridge",
             "Devices": [],
             "Ulimits": [{}],
             "LogConfig": { "Type": "json-file", "Config": {} },
             "SecurityOpt": [],
             "CgroupParent": "",
             "VolumeDriver": ""
          }
      }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
      HTTP/1.1 201 Created
      Content-Type: application/json
@y
      HTTP/1.1 201 Created
      Content-Type: application/json
@z

@x
      {
           "Id":"e90e34656806",
           "Warnings":[]
      }
@y
      {
           "Id":"e90e34656806",
           "Warnings":[]
      }
@z

@x
**JSON parameters**:
@y
**JSON parameters**:
@z

@x
-   **Hostname** - A string value containing the hostname to use for the
      container.
-   **Domainname** - A string value containing the domain name to use
      for the container.
-   **User** - A string value specifying the user inside the container.
-   **AttachStdin** - Boolean value, attaches to `stdin`.
-   **AttachStdout** - Boolean value, attaches to `stdout`.
-   **AttachStderr** - Boolean value, attaches to `stderr`.
-   **Tty** - Boolean value, Attach standard streams to a `tty`, including `stdin` if it is not closed.
-   **OpenStdin** - Boolean value, opens `stdin`,
-   **StdinOnce** - Boolean value, close `stdin` after the 1 attached client disconnects.
-   **Env** - A list of environment variables in the form of `["VAR=value", ...]`
-   **Labels** - Adds a map of labels to a container. To specify a map: `{"key":"value", ... }`
-   **Cmd** - Command to run specified as a string or an array of strings.
-   **Entrypoint** - Set the entry point for the container as a string or an array
      of strings.
-   **Image** - A string specifying the image name to use for the container.
-   **Volumes** - An object mapping mount point paths (strings) inside the
      container to empty objects.
-   **WorkingDir** - A string specifying the working directory for commands to
      run in.
-   **NetworkDisabled** - Boolean value, when true disables networking for the
      container
-   **ExposedPorts** - An object mapping ports to an empty object in the form of:
      `"ExposedPorts": { "<port>/<tcp|udp>: {}" }`
-   **StopSignal** - Signal to stop a container as a string or unsigned integer. `SIGTERM` by default.
-   **HostConfig**
    -   **Binds** – A list of volume bindings for this container. Each volume binding is a string in one of these forms:
           + `host-src:container-dest` to bind-mount a host path into the
             container. Both `host-src`, and `container-dest` must be an
             _absolute_ path.
           + `host-src:container-dest:ro` to make the bind mount read-only
             inside the container. Both `host-src`, and `container-dest` must be
             an _absolute_ path.
           + `volume-name:container-dest` to bind-mount a volume managed by a
             volume driver into the container. `container-dest` must be an
             _absolute_ path.
           + `volume-name:container-dest:ro` to mount the volume read-only
             inside the container.  `container-dest` must be an _absolute_ path.
    -   **Links** - A list of links for the container. Each link entry should be
          in the form of `container_name:alias`.
    -   **LxcConf** - LXC specific configurations. These configurations only
          work when using the `lxc` execution driver.
    -   **Memory** - Memory limit in bytes.
    -   **MemorySwap** - Total memory limit (memory + swap); set `-1` to enable unlimited swap.
          You must use this with `memory` and make the swap value larger than `memory`.
    -   **MemoryReservation** - Memory soft limit in bytes.
    -   **KernelMemory** - Kernel memory limit in bytes.
    -   **CpuShares** - An integer value containing the container's CPU Shares
          (ie. the relative weight vs other containers).
    -   **CpuPeriod** - The length of a CPU period in microseconds.
    -   **CpuQuota** - Microseconds of CPU time that the container can get in a CPU period.
    -   **CpusetCpus** - String value containing the `cgroups CpusetCpus` to use.
    -   **CpusetMems** - Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on NUMA systems.
    -   **BlkioWeight** - Block IO weight (relative weight) accepts a weight value between 10 and 1000.
    -   **MemorySwappiness** - Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100.
    -   **OomKillDisable** - Boolean value, whether to disable OOM Killer for the container or not.
    -   **PidMode** - Set the PID (Process) Namespace mode for the container;
          `"container:<name|id>"`: joins another container's PID namespace
          `"host"`: use the host's PID namespace inside the container
    -   **PortBindings** - A map of exposed container ports and the host port they
          should map to. A JSON object in the form
          `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
          Take note that `port` is specified as a string and not an integer value.
    -   **PublishAllPorts** - Allocates an ephemeral host port for all of a container's
          exposed ports. Specified as a boolean value.
@y
-   **Hostname** - A string value containing the hostname to use for the
      container.
-   **Domainname** - A string value containing the domain name to use
      for the container.
-   **User** - A string value specifying the user inside the container.
-   **AttachStdin** - Boolean value, attaches to `stdin`.
-   **AttachStdout** - Boolean value, attaches to `stdout`.
-   **AttachStderr** - Boolean value, attaches to `stderr`.
-   **Tty** - Boolean value, Attach standard streams to a `tty`, including `stdin` if it is not closed.
-   **OpenStdin** - Boolean value, opens `stdin`,
-   **StdinOnce** - Boolean value, close `stdin` after the 1 attached client disconnects.
-   **Env** - A list of environment variables in the form of `["VAR=value", ...]`
-   **Labels** - Adds a map of labels to a container. To specify a map: `{"key":"value", ... }`
-   **Cmd** - Command to run specified as a string or an array of strings.
-   **Entrypoint** - Set the entry point for the container as a string or an array
      of strings.
-   **Image** - A string specifying the image name to use for the container.
-   **Volumes** - An object mapping mount point paths (strings) inside the
      container to empty objects.
-   **WorkingDir** - A string specifying the working directory for commands to
      run in.
-   **NetworkDisabled** - Boolean value, when true disables networking for the
      container
-   **ExposedPorts** - An object mapping ports to an empty object in the form of:
      `"ExposedPorts": { "<port>/<tcp|udp>: {}" }`
-   **StopSignal** - Signal to stop a container as a string or unsigned integer. `SIGTERM` by default.
-   **HostConfig**
    -   **Binds** – A list of volume bindings for this container. Each volume binding is a string in one of these forms:
           + `host-src:container-dest` to bind-mount a host path into the
             container. Both `host-src`, and `container-dest` must be an
             _absolute_ path.
           + `host-src:container-dest:ro` to make the bind mount read-only
             inside the container. Both `host-src`, and `container-dest` must be
             an _absolute_ path.
           + `volume-name:container-dest` to bind-mount a volume managed by a
             volume driver into the container. `container-dest` must be an
             _absolute_ path.
           + `volume-name:container-dest:ro` to mount the volume read-only
             inside the container.  `container-dest` must be an _absolute_ path.
    -   **Links** - A list of links for the container. Each link entry should be
          in the form of `container_name:alias`.
    -   **LxcConf** - LXC specific configurations. These configurations only
          work when using the `lxc` execution driver.
    -   **Memory** - Memory limit in bytes.
    -   **MemorySwap** - Total memory limit (memory + swap); set `-1` to enable unlimited swap.
          You must use this with `memory` and make the swap value larger than `memory`.
    -   **MemoryReservation** - Memory soft limit in bytes.
    -   **KernelMemory** - Kernel memory limit in bytes.
    -   **CpuShares** - An integer value containing the container's CPU Shares
          (ie. the relative weight vs other containers).
    -   **CpuPeriod** - The length of a CPU period in microseconds.
    -   **CpuQuota** - Microseconds of CPU time that the container can get in a CPU period.
    -   **CpusetCpus** - String value containing the `cgroups CpusetCpus` to use.
    -   **CpusetMems** - Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on NUMA systems.
    -   **BlkioWeight** - Block IO weight (relative weight) accepts a weight value between 10 and 1000.
    -   **MemorySwappiness** - Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100.
    -   **OomKillDisable** - Boolean value, whether to disable OOM Killer for the container or not.
    -   **PidMode** - Set the PID (Process) Namespace mode for the container;
          `"container:<name|id>"`: joins another container's PID namespace
          `"host"`: use the host's PID namespace inside the container
    -   **PortBindings** - A map of exposed container ports and the host port they
          should map to. A JSON object in the form
          `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
          Take note that `port` is specified as a string and not an integer value.
    -   **PublishAllPorts** - Allocates an ephemeral host port for all of a container's
          exposed ports. Specified as a boolean value.
@z

@x
          Ports are de-allocated when the container stops and allocated when the container starts.
          The allocated port might be changed when restarting the container.
@y
          Ports are de-allocated when the container stops and allocated when the container starts.
          The allocated port might be changed when restarting the container.
@z

@x
          The port is selected from the ephemeral port range that depends on the kernel.
          For example, on Linux the range is defined by `/proc/sys/net/ipv4/ip_local_port_range`.
    -   **Privileged** - Gives the container full access to the host. Specified as
          a boolean value.
    -   **ReadonlyRootfs** - Mount the container's root filesystem as read only.
          Specified as a boolean value.
    -   **Dns** - A list of DNS servers for the container to use.
    -   **DnsOptions** - A list of DNS options
    -   **DnsSearch** - A list of DNS search domains
    -   **ExtraHosts** - A list of hostnames/IP mappings to add to the
        container's `/etc/hosts` file. Specified in the form `["hostname:IP"]`.
    -   **VolumesFrom** - A list of volumes to inherit from another container.
          Specified in the form `<container name>[:<ro|rw>]`
    -   **CapAdd** - A list of kernel capabilities to add to the container.
    -   **Capdrop** - A list of kernel capabilities to drop from the container.
    -   **GroupAdd** - A list of additional groups that the container process will run as
    -   **RestartPolicy** – The behavior to apply when the container exits.  The
            value is an object with a `Name` property of either `"always"` to
            always restart, `"unless-stopped"` to restart always except when
            user has manually stopped the container or `"on-failure"` to restart only when the container
            exit code is non-zero.  If `on-failure` is used, `MaximumRetryCount`
            controls the number of times to retry before giving up.
            The default is not to restart. (optional)
            An ever increasing delay (double the previous delay, starting at 100mS)
            is added before each restart to prevent flooding the server.
    -   **NetworkMode** - Sets the networking mode for the container. Supported
          standard values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value is taken
          as a custom network's name to which this container should connect to.
    -   **Devices** - A list of devices to add to the container specified as a JSON object in the
      form
          `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
    -   **Ulimits** - A list of ulimits to set in the container, specified as
          `{ "Name": <name>, "Soft": <soft limit>, "Hard": <hard limit> }`, for example:
          `Ulimits: { "Name": "nofile", "Soft": 1024, "Hard": 2048 }`
    -   **SecurityOpt**: A list of string values to customize labels for MLS
        systems, such as SELinux.
    -   **LogConfig** - Log configuration for the container, specified as a JSON object in the form
          `{ "Type": "<driver_name>", "Config": {"key1": "val1"}}`.
          Available types: `json-file`, `syslog`, `journald`, `gelf`, `awslogs`, `none`.
          `json-file` logging driver.
    -   **CgroupParent** - Path to `cgroups` under which the container's `cgroup` is created. If the path is not absolute, the path is considered to be relative to the `cgroups` path of the init process. Cgroups are created if they do not already exist.
    -   **VolumeDriver** - Driver that this container users to mount volumes.
@y
          The port is selected from the ephemeral port range that depends on the kernel.
          For example, on Linux the range is defined by `/proc/sys/net/ipv4/ip_local_port_range`.
    -   **Privileged** - Gives the container full access to the host. Specified as
          a boolean value.
    -   **ReadonlyRootfs** - Mount the container's root filesystem as read only.
          Specified as a boolean value.
    -   **Dns** - A list of DNS servers for the container to use.
    -   **DnsOptions** - A list of DNS options
    -   **DnsSearch** - A list of DNS search domains
    -   **ExtraHosts** - A list of hostnames/IP mappings to add to the
        container's `/etc/hosts` file. Specified in the form `["hostname:IP"]`.
    -   **VolumesFrom** - A list of volumes to inherit from another container.
          Specified in the form `<container name>[:<ro|rw>]`
    -   **CapAdd** - A list of kernel capabilities to add to the container.
    -   **Capdrop** - A list of kernel capabilities to drop from the container.
    -   **GroupAdd** - A list of additional groups that the container process will run as
    -   **RestartPolicy** – The behavior to apply when the container exits.  The
            value is an object with a `Name` property of either `"always"` to
            always restart, `"unless-stopped"` to restart always except when
            user has manually stopped the container or `"on-failure"` to restart only when the container
            exit code is non-zero.  If `on-failure` is used, `MaximumRetryCount`
            controls the number of times to retry before giving up.
            The default is not to restart. (optional)
            An ever increasing delay (double the previous delay, starting at 100mS)
            is added before each restart to prevent flooding the server.
    -   **NetworkMode** - Sets the networking mode for the container. Supported
          standard values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value is taken
          as a custom network's name to which this container should connect to.
    -   **Devices** - A list of devices to add to the container specified as a JSON object in the
      form
          `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
    -   **Ulimits** - A list of ulimits to set in the container, specified as
          `{ "Name": <name>, "Soft": <soft limit>, "Hard": <hard limit> }`, for example:
          `Ulimits: { "Name": "nofile", "Soft": 1024, "Hard": 2048 }`
    -   **SecurityOpt**: A list of string values to customize labels for MLS
        systems, such as SELinux.
    -   **LogConfig** - Log configuration for the container, specified as a JSON object in the form
          `{ "Type": "<driver_name>", "Config": {"key1": "val1"}}`.
          Available types: `json-file`, `syslog`, `journald`, `gelf`, `awslogs`, `none`.
          `json-file` logging driver.
    -   **CgroupParent** - Path to `cgroups` under which the container's `cgroup` is created. If the path is not absolute, the path is considered to be relative to the `cgroups` path of the init process. Cgroups are created if they do not already exist.
    -   **VolumeDriver** - Driver that this container users to mount volumes.
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **name** – Assign the specified name to the container. Must
    match `/?[a-zA-Z0-9_-]+`.
@y
-   **name** – Assign the specified name to the container. Must
    match `/?[a-zA-Z0-9_-]+`.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **201** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **406** – impossible to attach (container not running)
-   **409** – conflict
-   **500** – server error
@y
-   **201** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **406** – impossible to attach (container not running)
-   **409** – conflict
-   **500** – server error
@z

@x
#### Inspect a container
@y
#### Inspect a container
@z

@x
`GET /containers/(id or name)/json`
@y
`GET /containers/(id or name)/json`
@z

@x
Return low-level information on the container `id`
@y
Return low-level information on the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
      GET /v1.21/containers/4fa6e0f0c678/json HTTP/1.1
@y
      GET /v1.21/containers/4fa6e0f0c678/json HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
	{
		"AppArmorProfile": "",
		"Args": [
			"-c",
			"exit 9"
		],
		"Config": {
			"AttachStderr": true,
			"AttachStdin": false,
			"AttachStdout": true,
			"Cmd": [
				"/bin/sh",
				"-c",
				"exit 9"
			],
			"Domainname": "",
			"Entrypoint": null,
			"Env": [
				"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
			],
			"ExposedPorts": null,
			"Hostname": "ba033ac44011",
			"Image": "ubuntu",
			"Labels": {
				"com.example.vendor": "Acme",
				"com.example.license": "GPL",
				"com.example.version": "1.0"
			},
			"MacAddress": "",
			"NetworkDisabled": false,
			"OnBuild": null,
			"OpenStdin": false,
			"StdinOnce": false,
			"Tty": false,
			"User": "",
			"Volumes": null,
			"WorkingDir": "",
			"StopSignal": "SIGTERM"
		},
		"Created": "2015-01-06T15:47:31.485331387Z",
		"Driver": "devicemapper",
		"ExecDriver": "native-0.2",
		"ExecIDs": null,
		"HostConfig": {
			"Binds": null,
			"BlkioWeight": 0,
			"CapAdd": null,
			"CapDrop": null,
			"ContainerIDFile": "",
			"CpusetCpus": "",
			"CpusetMems": "",
			"CpuShares": 0,
			"CpuPeriod": 100000,
			"Devices": [],
			"Dns": null,
			"DnsOptions": null,
			"DnsSearch": null,
			"ExtraHosts": null,
			"IpcMode": "",
			"Links": null,
			"LxcConf": [],
			"Memory": 0,
			"MemorySwap": 0,
			"MemoryReservation": 0,
			"KernelMemory": 0,
			"OomKillDisable": false,
			"NetworkMode": "bridge",
			"PidMode": "",
			"PortBindings": {},
			"Privileged": false,
			"ReadonlyRootfs": false,
			"PublishAllPorts": false,
			"RestartPolicy": {
				"MaximumRetryCount": 2,
				"Name": "on-failure"
			},
			"LogConfig": {
				"Config": null,
				"Type": "json-file"
			},
			"SecurityOpt": null,
			"VolumesFrom": null,
			"Ulimits": [{}],
			"VolumeDriver": ""
		},
		"HostnamePath": "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/hostname",
		"HostsPath": "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/hosts",
		"LogPath": "/var/lib/docker/containers/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b-json.log",
		"Id": "ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39",
		"Image": "04c5d3b7b0656168630d3ba35d8889bd0e9caafcaeb3004d2bfbc47e7c5d35d2",
		"MountLabel": "",
		"Name": "/boring_euclid",
		"NetworkSettings": {
			"Bridge": "",
			"SandboxID": "",
			"HairpinMode": false,
			"LinkLocalIPv6Address": "",
			"LinkLocalIPv6PrefixLen": 0,
			"Ports": null,
			"SandboxKey": "",
			"SecondaryIPAddresses": null,
			"SecondaryIPv6Addresses": null,
			"EndpointID": "",
			"Gateway": "",
			"GlobalIPv6Address": "",
			"GlobalIPv6PrefixLen": 0,
			"IPAddress": "",
			"IPPrefixLen": 0,
			"IPv6Gateway": "",
			"MacAddress": "",
			"Networks": {
				"bridge": {
					"EndpointID": "7587b82f0dada3656fda26588aee72630c6fab1536d36e394b2bfbcf898c971d",
					"Gateway": "172.17.0.1",
					"IPAddress": "172.17.0.2",
					"IPPrefixLen": 16,
					"IPv6Gateway": "",
					"GlobalIPv6Address": "",
					"GlobalIPv6PrefixLen": 0,
					"MacAddress": "02:42:ac:12:00:02"
				}
			}
		},
		"Path": "/bin/sh",
		"ProcessLabel": "",
		"ResolvConfPath": "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/resolv.conf",
		"RestartCount": 1,
		"State": {
			"Error": "",
			"ExitCode": 9,
			"FinishedAt": "2015-01-06T15:47:32.080254511Z",
			"OOMKilled": false,
			"Paused": false,
			"Pid": 0,
			"Restarting": false,
			"Running": true,
			"StartedAt": "2015-01-06T15:47:32.072697474Z",
			"Status": "running"
		},
		"Mounts": [
			{
				"Source": "/data",
				"Destination": "/data",
				"Mode": "ro,Z",
				"RW": false
			}
		]
	}
@y
	{
		"AppArmorProfile": "",
		"Args": [
			"-c",
			"exit 9"
		],
		"Config": {
			"AttachStderr": true,
			"AttachStdin": false,
			"AttachStdout": true,
			"Cmd": [
				"/bin/sh",
				"-c",
				"exit 9"
			],
			"Domainname": "",
			"Entrypoint": null,
			"Env": [
				"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
			],
			"ExposedPorts": null,
			"Hostname": "ba033ac44011",
			"Image": "ubuntu",
			"Labels": {
				"com.example.vendor": "Acme",
				"com.example.license": "GPL",
				"com.example.version": "1.0"
			},
			"MacAddress": "",
			"NetworkDisabled": false,
			"OnBuild": null,
			"OpenStdin": false,
			"StdinOnce": false,
			"Tty": false,
			"User": "",
			"Volumes": null,
			"WorkingDir": "",
			"StopSignal": "SIGTERM"
		},
		"Created": "2015-01-06T15:47:31.485331387Z",
		"Driver": "devicemapper",
		"ExecDriver": "native-0.2",
		"ExecIDs": null,
		"HostConfig": {
			"Binds": null,
			"BlkioWeight": 0,
			"CapAdd": null,
			"CapDrop": null,
			"ContainerIDFile": "",
			"CpusetCpus": "",
			"CpusetMems": "",
			"CpuShares": 0,
			"CpuPeriod": 100000,
			"Devices": [],
			"Dns": null,
			"DnsOptions": null,
			"DnsSearch": null,
			"ExtraHosts": null,
			"IpcMode": "",
			"Links": null,
			"LxcConf": [],
			"Memory": 0,
			"MemorySwap": 0,
			"MemoryReservation": 0,
			"KernelMemory": 0,
			"OomKillDisable": false,
			"NetworkMode": "bridge",
			"PidMode": "",
			"PortBindings": {},
			"Privileged": false,
			"ReadonlyRootfs": false,
			"PublishAllPorts": false,
			"RestartPolicy": {
				"MaximumRetryCount": 2,
				"Name": "on-failure"
			},
			"LogConfig": {
				"Config": null,
				"Type": "json-file"
			},
			"SecurityOpt": null,
			"VolumesFrom": null,
			"Ulimits": [{}],
			"VolumeDriver": ""
		},
		"HostnamePath": "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/hostname",
		"HostsPath": "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/hosts",
		"LogPath": "/var/lib/docker/containers/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b-json.log",
		"Id": "ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39",
		"Image": "04c5d3b7b0656168630d3ba35d8889bd0e9caafcaeb3004d2bfbc47e7c5d35d2",
		"MountLabel": "",
		"Name": "/boring_euclid",
		"NetworkSettings": {
			"Bridge": "",
			"SandboxID": "",
			"HairpinMode": false,
			"LinkLocalIPv6Address": "",
			"LinkLocalIPv6PrefixLen": 0,
			"Ports": null,
			"SandboxKey": "",
			"SecondaryIPAddresses": null,
			"SecondaryIPv6Addresses": null,
			"EndpointID": "",
			"Gateway": "",
			"GlobalIPv6Address": "",
			"GlobalIPv6PrefixLen": 0,
			"IPAddress": "",
			"IPPrefixLen": 0,
			"IPv6Gateway": "",
			"MacAddress": "",
			"Networks": {
				"bridge": {
					"EndpointID": "7587b82f0dada3656fda26588aee72630c6fab1536d36e394b2bfbcf898c971d",
					"Gateway": "172.17.0.1",
					"IPAddress": "172.17.0.2",
					"IPPrefixLen": 16,
					"IPv6Gateway": "",
					"GlobalIPv6Address": "",
					"GlobalIPv6PrefixLen": 0,
					"MacAddress": "02:42:ac:12:00:02"
				}
			}
		},
		"Path": "/bin/sh",
		"ProcessLabel": "",
		"ResolvConfPath": "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/resolv.conf",
		"RestartCount": 1,
		"State": {
			"Error": "",
			"ExitCode": 9,
			"FinishedAt": "2015-01-06T15:47:32.080254511Z",
			"OOMKilled": false,
			"Paused": false,
			"Pid": 0,
			"Restarting": false,
			"Running": true,
			"StartedAt": "2015-01-06T15:47:32.072697474Z",
			"Status": "running"
		},
		"Mounts": [
			{
				"Source": "/data",
				"Destination": "/data",
				"Mode": "ro,Z",
				"RW": false
			}
		]
	}
@z

@x
**Example request, with size information**:
@y
**Example request, with size information**:
@z

@x
    GET /v1.21/containers/4fa6e0f0c678/json?size=1 HTTP/1.1
@y
    GET /v1.21/containers/4fa6e0f0c678/json?size=1 HTTP/1.1
@z

@x
**Example response, with size information**:
@y
**Example response, with size information**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
    ....
    "SizeRw": 0,
    "SizeRootFs": 972,
    ....
    }
@y
    {
    ....
    "SizeRw": 0,
    "SizeRootFs": 972,
    ....
    }
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **size** – 1/True/true or 0/False/false, return container size information. Default is `false`.
@y
-   **size** – 1/True/true or 0/False/false, return container size information. Default is `false`.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### List processes running inside a container
@y
#### List processes running inside a container
@z

@x
`GET /containers/(id or name)/top`
@y
`GET /containers/(id or name)/top`
@z

@x
List processes running inside the container `id`. On Unix systems this
is done by running the `ps` command. This endpoint is not
supported on Windows.
@y
List processes running inside the container `id`. On Unix systems this
is done by running the `ps` command. This endpoint is not
supported on Windows.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/containers/4fa6e0f0c678/top HTTP/1.1
@y
    GET /v1.21/containers/4fa6e0f0c678/top HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
       "Titles" : [
         "UID", "PID", "PPID", "C", "STIME", "TTY", "TIME", "CMD"
       ],
       "Processes" : [
         [
           "root", "13642", "882", "0", "17:03", "pts/0", "00:00:00", "/bin/bash"
         ],
         [
           "root", "13735", "13642", "0", "17:06", "pts/0", "00:00:00", "sleep 10"
         ]
       ]
    }
@y
    {
       "Titles" : [
         "UID", "PID", "PPID", "C", "STIME", "TTY", "TIME", "CMD"
       ],
       "Processes" : [
         [
           "root", "13642", "882", "0", "17:03", "pts/0", "00:00:00", "/bin/bash"
         ],
         [
           "root", "13735", "13642", "0", "17:06", "pts/0", "00:00:00", "sleep 10"
         ]
       ]
    }
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/containers/4fa6e0f0c678/top?ps_args=aux HTTP/1.1
@y
    GET /v1.21/containers/4fa6e0f0c678/top?ps_args=aux HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
      "Titles" : [
        "USER","PID","%CPU","%MEM","VSZ","RSS","TTY","STAT","START","TIME","COMMAND"
      ]
      "Processes" : [
        [
          "root","13642","0.0","0.1","18172","3184","pts/0","Ss","17:03","0:00","/bin/bash"
        ],
        [
          "root","13895","0.0","0.0","4348","692","pts/0","S+","17:15","0:00","sleep 10"
        ]
      ],
    }
@y
    {
      "Titles" : [
        "USER","PID","%CPU","%MEM","VSZ","RSS","TTY","STAT","START","TIME","COMMAND"
      ]
      "Processes" : [
        [
          "root","13642","0.0","0.1","18172","3184","pts/0","Ss","17:03","0:00","/bin/bash"
        ],
        [
          "root","13895","0.0","0.0","4348","692","pts/0","S+","17:15","0:00","sleep 10"
        ]
      ],
    }
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **ps_args** – `ps` arguments to use (e.g., `aux`), defaults to `-ef`
@y
-   **ps_args** – `ps` arguments to use (e.g., `aux`), defaults to `-ef`
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Get container logs
@y
#### Get container logs
@z

@x
`GET /containers/(id or name)/logs`
@y
`GET /containers/(id or name)/logs`
@z

@x
Get `stdout` and `stderr` logs from the container ``id``
@y
Get `stdout` and `stderr` logs from the container ``id``
@z

@x
> **Note**:
> This endpoint works only for containers with the `json-file` or `journald` logging drivers.
@y
> **Note**:
> This endpoint works only for containers with the `json-file` or `journald` logging drivers.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
     GET /v1.21/containers/4fa6e0f0c678/logs?stderr=1&stdout=1&timestamps=1&follow=1&tail=10&since=1428990821 HTTP/1.1
@y
     GET /v1.21/containers/4fa6e0f0c678/logs?stderr=1&stdout=1&timestamps=1&follow=1&tail=10&since=1428990821 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
     HTTP/1.1 101 UPGRADED
     Content-Type: application/vnd.docker.raw-stream
     Connection: Upgrade
     Upgrade: tcp
@y
     HTTP/1.1 101 UPGRADED
     Content-Type: application/vnd.docker.raw-stream
     Connection: Upgrade
     Upgrade: tcp
@z

@x
     {% raw %}
     {{ STREAM }}
     {% endraw %}
@y
     {% raw %}
     {{ STREAM }}
     {% endraw %}
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **follow** – 1/True/true or 0/False/false, return stream. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, show `stdout` log. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, show `stderr` log. Default `false`.
-   **since** – UNIX timestamp (integer) to filter logs. Specifying a timestamp
    will only output log-entries since that timestamp. Default: 0 (unfiltered)
-   **timestamps** – 1/True/true or 0/False/false, print timestamps for
        every log line. Default `false`.
-   **tail** – Output specified number of lines at the end of logs: `all` or `<number>`. Default all.
@y
-   **follow** – 1/True/true or 0/False/false, return stream. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, show `stdout` log. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, show `stderr` log. Default `false`.
-   **since** – UNIX timestamp (integer) to filter logs. Specifying a timestamp
    will only output log-entries since that timestamp. Default: 0 (unfiltered)
-   **timestamps** – 1/True/true or 0/False/false, print timestamps for
        every log line. Default `false`.
-   **tail** – Output specified number of lines at the end of logs: `all` or `<number>`. Default all.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **101** – no error, hints proxy about hijacking
-   **200** – no error, no upgrade header found
-   **404** – no such container
-   **500** – server error
@y
-   **101** – no error, hints proxy about hijacking
-   **200** – no error, no upgrade header found
-   **404** – no such container
-   **500** – server error
@z

@x
#### Inspect changes on a container's filesystem
@y
#### Inspect changes on a container's filesystem
@z

@x
`GET /containers/(id or name)/changes`
@y
`GET /containers/(id or name)/changes`
@z

@x
Inspect changes on container `id`'s filesystem
@y
Inspect changes on container `id`'s filesystem
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/containers/4fa6e0f0c678/changes HTTP/1.1
@y
    GET /v1.21/containers/4fa6e0f0c678/changes HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    [
         {
                 "Path": "/dev",
                 "Kind": 0
         },
         {
                 "Path": "/dev/kmsg",
                 "Kind": 1
         },
         {
                 "Path": "/test",
                 "Kind": 1
         }
    ]
@y
    [
         {
                 "Path": "/dev",
                 "Kind": 0
         },
         {
                 "Path": "/dev/kmsg",
                 "Kind": 1
         },
         {
                 "Path": "/test",
                 "Kind": 1
         }
    ]
@z

@x
Values for `Kind`:
@y
Values for `Kind`:
@z

@x
- `0`: Modify
- `1`: Add
- `2`: Delete
@y
- `0`: Modify
- `1`: Add
- `2`: Delete
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Export a container
@y
#### Export a container
@z

@x
`GET /containers/(id or name)/export`
@y
`GET /containers/(id or name)/export`
@z

@x
Export the contents of container `id`
@y
Export the contents of container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/containers/4fa6e0f0c678/export HTTP/1.1
@y
    GET /v1.21/containers/4fa6e0f0c678/export HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/octet-stream
@y
    HTTP/1.1 200 OK
    Content-Type: application/octet-stream
@z

@x
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@y
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Get container stats based on resource usage
@y
#### Get container stats based on resource usage
@z

@x
`GET /containers/(id or name)/stats`
@y
`GET /containers/(id or name)/stats`
@z

@x
This endpoint returns a live stream of a container's resource usage statistics.
@y
This endpoint returns a live stream of a container's resource usage statistics.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/containers/redis1/stats HTTP/1.1
@y
    GET /v1.21/containers/redis1/stats HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
      HTTP/1.1 200 OK
      Content-Type: application/json
@y
      HTTP/1.1 200 OK
      Content-Type: application/json
@z

@x
      {
         "read" : "2015-01-08T22:57:31.547920715Z",
         "networks": {
                 "eth0": {
                     "rx_bytes": 5338,
                     "rx_dropped": 0,
                     "rx_errors": 0,
                     "rx_packets": 36,
                     "tx_bytes": 648,
                     "tx_dropped": 0,
                     "tx_errors": 0,
                     "tx_packets": 8
                 },
                 "eth5": {
                     "rx_bytes": 4641,
                     "rx_dropped": 0,
                     "rx_errors": 0,
                     "rx_packets": 26,
                     "tx_bytes": 690,
                     "tx_dropped": 0,
                     "tx_errors": 0,
                     "tx_packets": 9
                 }
         },
         "memory_stats" : {
            "stats" : {
               "total_pgmajfault" : 0,
               "cache" : 0,
               "mapped_file" : 0,
               "total_inactive_file" : 0,
               "pgpgout" : 414,
               "rss" : 6537216,
               "total_mapped_file" : 0,
               "writeback" : 0,
               "unevictable" : 0,
               "pgpgin" : 477,
               "total_unevictable" : 0,
               "pgmajfault" : 0,
               "total_rss" : 6537216,
               "total_rss_huge" : 6291456,
               "total_writeback" : 0,
               "total_inactive_anon" : 0,
               "rss_huge" : 6291456,
               "hierarchical_memory_limit" : 67108864,
               "total_pgfault" : 964,
               "total_active_file" : 0,
               "active_anon" : 6537216,
               "total_active_anon" : 6537216,
               "total_pgpgout" : 414,
               "total_cache" : 0,
               "inactive_anon" : 0,
               "active_file" : 0,
               "pgfault" : 964,
               "inactive_file" : 0,
               "total_pgpgin" : 477
            },
            "max_usage" : 6651904,
            "usage" : 6537216,
            "failcnt" : 0,
            "limit" : 67108864
         },
         "blkio_stats" : {},
         "cpu_stats" : {
            "cpu_usage" : {
               "percpu_usage" : [
                  8646879,
                  24472255,
                  36438778,
                  30657443
               ],
               "usage_in_usermode" : 50000000,
               "total_usage" : 100215355,
               "usage_in_kernelmode" : 30000000
            },
            "system_cpu_usage" : 739306590000000,
            "throttling_data" : {"periods":0,"throttled_periods":0,"throttled_time":0}
         },
         "precpu_stats" : {
            "cpu_usage" : {
               "percpu_usage" : [
                  8646879,
                  24350896,
                  36438778,
                  30657443
               ],
               "usage_in_usermode" : 50000000,
               "total_usage" : 100093996,
               "usage_in_kernelmode" : 30000000
            },
            "system_cpu_usage" : 9492140000000,
            "throttling_data" : {"periods":0,"throttled_periods":0,"throttled_time":0}
         }
      }
@y
      {
         "read" : "2015-01-08T22:57:31.547920715Z",
         "networks": {
                 "eth0": {
                     "rx_bytes": 5338,
                     "rx_dropped": 0,
                     "rx_errors": 0,
                     "rx_packets": 36,
                     "tx_bytes": 648,
                     "tx_dropped": 0,
                     "tx_errors": 0,
                     "tx_packets": 8
                 },
                 "eth5": {
                     "rx_bytes": 4641,
                     "rx_dropped": 0,
                     "rx_errors": 0,
                     "rx_packets": 26,
                     "tx_bytes": 690,
                     "tx_dropped": 0,
                     "tx_errors": 0,
                     "tx_packets": 9
                 }
         },
         "memory_stats" : {
            "stats" : {
               "total_pgmajfault" : 0,
               "cache" : 0,
               "mapped_file" : 0,
               "total_inactive_file" : 0,
               "pgpgout" : 414,
               "rss" : 6537216,
               "total_mapped_file" : 0,
               "writeback" : 0,
               "unevictable" : 0,
               "pgpgin" : 477,
               "total_unevictable" : 0,
               "pgmajfault" : 0,
               "total_rss" : 6537216,
               "total_rss_huge" : 6291456,
               "total_writeback" : 0,
               "total_inactive_anon" : 0,
               "rss_huge" : 6291456,
               "hierarchical_memory_limit" : 67108864,
               "total_pgfault" : 964,
               "total_active_file" : 0,
               "active_anon" : 6537216,
               "total_active_anon" : 6537216,
               "total_pgpgout" : 414,
               "total_cache" : 0,
               "inactive_anon" : 0,
               "active_file" : 0,
               "pgfault" : 964,
               "inactive_file" : 0,
               "total_pgpgin" : 477
            },
            "max_usage" : 6651904,
            "usage" : 6537216,
            "failcnt" : 0,
            "limit" : 67108864
         },
         "blkio_stats" : {},
         "cpu_stats" : {
            "cpu_usage" : {
               "percpu_usage" : [
                  8646879,
                  24472255,
                  36438778,
                  30657443
               ],
               "usage_in_usermode" : 50000000,
               "total_usage" : 100215355,
               "usage_in_kernelmode" : 30000000
            },
            "system_cpu_usage" : 739306590000000,
            "throttling_data" : {"periods":0,"throttled_periods":0,"throttled_time":0}
         },
         "precpu_stats" : {
            "cpu_usage" : {
               "percpu_usage" : [
                  8646879,
                  24350896,
                  36438778,
                  30657443
               ],
               "usage_in_usermode" : 50000000,
               "total_usage" : 100093996,
               "usage_in_kernelmode" : 30000000
            },
            "system_cpu_usage" : 9492140000000,
            "throttling_data" : {"periods":0,"throttled_periods":0,"throttled_time":0}
         }
      }
@z

@x
The `precpu_stats` is the cpu statistic of *previous* read, which is used for calculating the cpu usage percent. It is not the exact copy of the `cpu_stats` field.
@y
The `precpu_stats` is the cpu statistic of *previous* read, which is used for calculating the cpu usage percent. It is not the exact copy of the `cpu_stats` field.
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **stream** – 1/True/true or 0/False/false, pull stats once then disconnect. Default `true`.
@y
-   **stream** – 1/True/true or 0/False/false, pull stats once then disconnect. Default `true`.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Resize a container TTY
@y
#### Resize a container TTY
@z

@x
`POST /containers/(id or name)/resize`
@y
`POST /containers/(id or name)/resize`
@z

@x
Resize the TTY for container with  `id`. The unit is number of characters. You must restart the container for the resize to take effect.
@y
Resize the TTY for container with  `id`. The unit is number of characters. You must restart the container for the resize to take effect.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
      POST /v1.21/containers/4fa6e0f0c678/resize?h=40&w=80 HTTP/1.1
@y
      POST /v1.21/containers/4fa6e0f0c678/resize?h=40&w=80 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
      HTTP/1.1 200 OK
      Content-Length: 0
      Content-Type: text/plain; charset=utf-8
@y
      HTTP/1.1 200 OK
      Content-Length: 0
      Content-Type: text/plain; charset=utf-8
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **h** – height of `tty` session
-   **w** – width
@y
-   **h** – height of `tty` session
-   **w** – width
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – No such container
-   **500** – Cannot resize container
@y
-   **200** – no error
-   **404** – No such container
-   **500** – Cannot resize container
@z

@x
#### Start a container
@y
#### Start a container
@z

@x
`POST /containers/(id or name)/start`
@y
`POST /containers/(id or name)/start`
@z

@x
Start the container `id`
@y
Start the container `id`
@z

@x
> **Note**:
> For backwards compatibility, this endpoint accepts a `HostConfig` as JSON-encoded request body.
> See [create a container](#create-a-container) for details.
@y
> **Note**:
> For backwards compatibility, this endpoint accepts a `HostConfig` as JSON-encoded request body.
> See [create a container](#create-a-container) for details.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/e90e34656806/start HTTP/1.1
@y
    POST /v1.21/containers/e90e34656806/start HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** – no error
-   **304** – container already started
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **304** – container already started
-   **404** – no such container
-   **500** – server error
@z

@x
#### Stop a container
@y
#### Stop a container
@z

@x
`POST /containers/(id or name)/stop`
@y
`POST /containers/(id or name)/stop`
@z

@x
Stop the container `id`
@y
Stop the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/e90e34656806/stop?t=5 HTTP/1.1
@y
    POST /v1.21/containers/e90e34656806/stop?t=5 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **t** – number of seconds to wait before killing the container
@y
-   **t** – number of seconds to wait before killing the container
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** – no error
-   **304** – container already stopped
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **304** – container already stopped
-   **404** – no such container
-   **500** – server error
@z

@x
#### Restart a container
@y
#### Restart a container
@z

@x
`POST /containers/(id or name)/restart`
@y
`POST /containers/(id or name)/restart`
@z

@x
Restart the container `id`
@y
Restart the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/e90e34656806/restart?t=5 HTTP/1.1
@y
    POST /v1.21/containers/e90e34656806/restart?t=5 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **t** – number of seconds to wait before killing the container
@y
-   **t** – number of seconds to wait before killing the container
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Kill a container
@y
#### Kill a container
@z

@x
`POST /containers/(id or name)/kill`
@y
`POST /containers/(id or name)/kill`
@z

@x
Kill the container `id`
@y
Kill the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/e90e34656806/kill HTTP/1.1
@y
    POST /v1.21/containers/e90e34656806/kill HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **signal** - Signal to send to the container: integer or string like `SIGINT`.
        When not set, `SIGKILL` is assumed and the call waits for the container to exit.
@y
-   **signal** - Signal to send to the container: integer or string like `SIGINT`.
        When not set, `SIGKILL` is assumed and the call waits for the container to exit.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Rename a container
@y
#### Rename a container
@z

@x
`POST /containers/(id or name)/rename`
@y
`POST /containers/(id or name)/rename`
@z

@x
Rename the container `id` to a `new_name`
@y
Rename the container `id` to a `new_name`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/e90e34656806/rename?name=new_name HTTP/1.1
@y
    POST /v1.21/containers/e90e34656806/rename?name=new_name HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **name** – new name for the container
@y
-   **name** – new name for the container
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **409** - conflict name already assigned
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **409** - conflict name already assigned
-   **500** – server error
@z

@x
#### Pause a container
@y
#### Pause a container
@z

@x
`POST /containers/(id or name)/pause`
@y
`POST /containers/(id or name)/pause`
@z

@x
Pause the container `id`
@y
Pause the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/e90e34656806/pause HTTP/1.1
@y
    POST /v1.21/containers/e90e34656806/pause HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Unpause a container
@y
#### Unpause a container
@z

@x
`POST /containers/(id or name)/unpause`
@y
`POST /containers/(id or name)/unpause`
@z

@x
Unpause the container `id`
@y
Unpause the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/e90e34656806/unpause HTTP/1.1
@y
    POST /v1.21/containers/e90e34656806/unpause HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **204** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Attach to a container
@y
#### Attach to a container
@z

@x
`POST /containers/(id or name)/attach`
@y
`POST /containers/(id or name)/attach`
@z

@x
Attach to the container `id`
@y
Attach to the container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/16253994b7c4/attach?logs=1&stream=0&stdout=1 HTTP/1.1
@y
    POST /v1.21/containers/16253994b7c4/attach?logs=1&stream=0&stdout=1 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 101 UPGRADED
    Content-Type: application/vnd.docker.raw-stream
    Connection: Upgrade
    Upgrade: tcp
@y
    HTTP/1.1 101 UPGRADED
    Content-Type: application/vnd.docker.raw-stream
    Connection: Upgrade
    Upgrade: tcp
@z

@x
    {% raw %}
    {{ STREAM }}
    {% endraw %}
@y
    {% raw %}
    {{ STREAM }}
    {% endraw %}
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **logs** – 1/True/true or 0/False/false, return logs. Default `false`.
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default `false`.
-   **stdin** – 1/True/true or 0/False/false, if `stream=true`, attach
        to `stdin`. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, if `logs=true`, return
        `stdout` log, if `stream=true`, attach to `stdout`. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, if `logs=true`, return
        `stderr` log, if `stream=true`, attach to `stderr`. Default `false`.
@y
-   **logs** – 1/True/true or 0/False/false, return logs. Default `false`.
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default `false`.
-   **stdin** – 1/True/true or 0/False/false, if `stream=true`, attach
        to `stdin`. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, if `logs=true`, return
        `stdout` log, if `stream=true`, attach to `stdout`. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, if `logs=true`, return
        `stderr` log, if `stream=true`, attach to `stderr`. Default `false`.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **101** – no error, hints proxy about hijacking
-   **200** – no error, no upgrade header found
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@y
-   **101** – no error, hints proxy about hijacking
-   **200** – no error, no upgrade header found
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@z

@x
**Stream details**:
@y
**Stream details**:
@z

@x
When using the TTY setting is enabled in
[`POST /containers/create`
](#create-a-container),
the stream is the raw data from the process PTY and client's `stdin`.
When the TTY is disabled, then the stream is multiplexed to separate
`stdout` and `stderr`.
@y
When using the TTY setting is enabled in
[`POST /containers/create`
](#create-a-container),
the stream is the raw data from the process PTY and client's `stdin`.
When the TTY is disabled, then the stream is multiplexed to separate
`stdout` and `stderr`.
@z

@x
The format is a **Header** and a **Payload** (frame).
@y
The format is a **Header** and a **Payload** (frame).
@z

@x
**HEADER**
@y
**HEADER**
@z

@x
The header contains the information which the stream writes (`stdout` or
`stderr`). It also contains the size of the associated frame encoded in the
last four bytes (`uint32`).
@y
The header contains the information which the stream writes (`stdout` or
`stderr`). It also contains the size of the associated frame encoded in the
last four bytes (`uint32`).
@z

@x
It is encoded on the first eight bytes like this:
@y
It is encoded on the first eight bytes like this:
@z

@x
    header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}
@y
    header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}
@z

@x
`STREAM_TYPE` can be:
@y
`STREAM_TYPE` can be:
@z

@x
-   0: `stdin` (is written on `stdout`)
-   1: `stdout`
-   2: `stderr`
@y
-   0: `stdin` (is written on `stdout`)
-   1: `stdout`
-   2: `stderr`
@z

@x
`SIZE1, SIZE2, SIZE3, SIZE4` are the four bytes of
the `uint32` size encoded as big endian.
@y
`SIZE1, SIZE2, SIZE3, SIZE4` are the four bytes of
the `uint32` size encoded as big endian.
@z

@x
**PAYLOAD**
@y
**PAYLOAD**
@z

@x
The payload is the raw stream.
@y
The payload is the raw stream.
@z

@x
**IMPLEMENTATION**
@y
**IMPLEMENTATION**
@z

@x
The simplest way to implement the Attach protocol is the following:
@y
The simplest way to implement the Attach protocol is the following:
@z

@x
    1.  Read eight bytes.
    2.  Choose `stdout` or `stderr` depending on the first byte.
    3.  Extract the frame size from the last four bytes.
    4.  Read the extracted size and output it on the correct output.
    5.  Goto 1.
@y
    1.  Read eight bytes.
    2.  Choose `stdout` or `stderr` depending on the first byte.
    3.  Extract the frame size from the last four bytes.
    4.  Read the extracted size and output it on the correct output.
    5.  Goto 1.
@z

@x
#### Attach to a container (websocket)
@y
#### Attach to a container (websocket)
@z

@x
`GET /containers/(id or name)/attach/ws`
@y
`GET /containers/(id or name)/attach/ws`
@z

@x
Attach to the container `id` via websocket
@y
Attach to the container `id` via websocket
@z

@x
Implements websocket protocol handshake according to [RFC 6455](http://tools.ietf.org/html/rfc6455)
@y
Implements websocket protocol handshake according to [RFC 6455](http://tools.ietf.org/html/rfc6455)
@z

@x
**Example request**
@y
**Example request**
@z

@x
    GET /v1.21/containers/e90e34656806/attach/ws?logs=0&stream=1&stdin=1&stdout=1&stderr=1 HTTP/1.1
@y
    GET /v1.21/containers/e90e34656806/attach/ws?logs=0&stream=1&stdin=1&stdout=1&stderr=1 HTTP/1.1
@z

@x
**Example response**
@y
**Example response**
@z

@x
    {% raw %}
    {{ STREAM }}
    {% endraw %}
@y
    {% raw %}
    {{ STREAM }}
    {% endraw %}
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **logs** – 1/True/true or 0/False/false, return logs. Default `false`.
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default `false`.
-   **stdin** – 1/True/true or 0/False/false, if `stream=true`, attach
        to `stdin`. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, if `logs=true`, return
        `stdout` log, if `stream=true`, attach to `stdout`. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, if `logs=true`, return
        `stderr` log, if `stream=true`, attach to `stderr`. Default `false`.
@y
-   **logs** – 1/True/true or 0/False/false, return logs. Default `false`.
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default `false`.
-   **stdin** – 1/True/true or 0/False/false, if `stream=true`, attach
        to `stdin`. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, if `logs=true`, return
        `stdout` log, if `stream=true`, attach to `stdout`. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, if `logs=true`, return
        `stderr` log, if `stream=true`, attach to `stderr`. Default `false`.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
@z

@x
#### Wait a container
@y
#### Wait a container
@z

@x
`POST /containers/(id or name)/wait`
@y
`POST /containers/(id or name)/wait`
@z

@x
Block until container `id` stops, then returns the exit code
@y
Block until container `id` stops, then returns the exit code
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/16253994b7c4/wait HTTP/1.1
@y
    POST /v1.21/containers/16253994b7c4/wait HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {"StatusCode": 0}
@y
    {"StatusCode": 0}
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Remove a container
@y
#### Remove a container
@z

@x
`DELETE /containers/(id or name)`
@y
`DELETE /containers/(id or name)`
@z

@x
Remove the container `id` from the filesystem
@y
Remove the container `id` from the filesystem
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    DELETE /v1.21/containers/16253994b7c4?v=1 HTTP/1.1
@y
    DELETE /v1.21/containers/16253994b7c4?v=1 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **v** – 1/True/true or 0/False/false, Remove the volumes
        associated to the container. Default `false`.
-   **force** - 1/True/true or 0/False/false, Kill then remove the container.
        Default `false`.
-   **link** - 1/True/true or 0/False/false, Remove the specified
        link associated to the container. Default `false`.
@y
-   **v** – 1/True/true or 0/False/false, Remove the volumes
        associated to the container. Default `false`.
-   **force** - 1/True/true or 0/False/false, Kill then remove the container.
        Default `false`.
-   **link** - 1/True/true or 0/False/false, Remove the specified
        link associated to the container. Default `false`.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **409** – conflict
-   **500** – server error
@y
-   **204** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **409** – conflict
-   **500** – server error
@z

@x
#### Copy files or folders from a container
@y
#### Copy files or folders from a container
@z

@x
`POST /containers/(id or name)/copy`
@y
`POST /containers/(id or name)/copy`
@z

@x
Copy files or folders of container `id`
@y
Copy files or folders of container `id`
@z

@x
**Deprecated** in favor of the `archive` endpoint below.
@y
**Deprecated** in favor of the `archive` endpoint below.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/4fa6e0f0c678/copy HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.21/containers/4fa6e0f0c678/copy HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
         "Resource": "test.txt"
    }
@y
    {
         "Resource": "test.txt"
    }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/x-tar
@y
    HTTP/1.1 200 OK
    Content-Type: application/x-tar
@z

@x
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@y
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Retrieving information about files and folders in a container
@y
#### Retrieving information about files and folders in a container
@z

@x
`HEAD /containers/(id or name)/archive`
@y
`HEAD /containers/(id or name)/archive`
@z

@x
See the description of the `X-Docker-Container-Path-Stat` header in the
following section.
@y
See the description of the `X-Docker-Container-Path-Stat` header in the
following section.
@z

@x
#### Get an archive of a filesystem resource in a container
@y
#### Get an archive of a filesystem resource in a container
@z

@x
`GET /containers/(id or name)/archive`
@y
`GET /containers/(id or name)/archive`
@z

@x
Get a tar archive of a resource in the filesystem of container `id`.
@y
Get a tar archive of a resource in the filesystem of container `id`.
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **path** - resource in the container's filesystem to archive. Required.
@y
- **path** - resource in the container's filesystem to archive. Required.
@z

@x
    If not an absolute path, it is relative to the container's root directory.
    The resource specified by **path** must exist. To assert that the resource
    is expected to be a directory, **path** should end in `/` or  `/.`
    (assuming a path separator of `/`). If **path** ends in `/.` then this
    indicates that only the contents of the **path** directory should be
    copied. A symlink is always resolved to its target.
@y
    If not an absolute path, it is relative to the container's root directory.
    The resource specified by **path** must exist. To assert that the resource
    is expected to be a directory, **path** should end in `/` or  `/.`
    (assuming a path separator of `/`). If **path** ends in `/.` then this
    indicates that only the contents of the **path** directory should be
    copied. A symlink is always resolved to its target.
@z

@x
    > **Note**: It is not possible to copy certain system files such as resources
    > under `/proc`, `/sys`, `/dev`, and mounts created by the user in the
    > container.
@y
    > **Note**: It is not possible to copy certain system files such as resources
    > under `/proc`, `/sys`, `/dev`, and mounts created by the user in the
    > container.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/containers/8cce319429b2/archive?path=/root HTTP/1.1
@y
    GET /v1.21/containers/8cce319429b2/archive?path=/root HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/x-tar
    X-Docker-Container-Path-Stat: eyJuYW1lIjoicm9vdCIsInNpemUiOjQwOTYsIm1vZGUiOjIxNDc0ODQwOTYsIm10aW1lIjoiMjAxNC0wMi0yN1QyMDo1MToyM1oiLCJsaW5rVGFyZ2V0IjoiIn0=
@y
    HTTP/1.1 200 OK
    Content-Type: application/x-tar
    X-Docker-Container-Path-Stat: eyJuYW1lIjoicm9vdCIsInNpemUiOjQwOTYsIm1vZGUiOjIxNDc0ODQwOTYsIm10aW1lIjoiMjAxNC0wMi0yN1QyMDo1MToyM1oiLCJsaW5rVGFyZ2V0IjoiIn0=
@z

@x
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@y
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@z

@x
On success, a response header `X-Docker-Container-Path-Stat` will be set to a
base64-encoded JSON object containing some filesystem header information about
the archived resource. The above example value would decode to the following
JSON object (whitespace added for readability):
@y
On success, a response header `X-Docker-Container-Path-Stat` will be set to a
base64-encoded JSON object containing some filesystem header information about
the archived resource. The above example value would decode to the following
JSON object (whitespace added for readability):
@z

@x
```json
{
    "name": "root",
    "size": 4096,
    "mode": 2147484096,
    "mtime": "2014-02-27T20:51:23Z",
    "linkTarget": ""
}
```
@y
```json
{
    "name": "root",
    "size": 4096,
    "mode": 2147484096,
    "mtime": "2014-02-27T20:51:23Z",
    "linkTarget": ""
}
```
@z

@x
A `HEAD` request can also be made to this endpoint if only this information is
desired.
@y
A `HEAD` request can also be made to this endpoint if only this information is
desired.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
- **200** - success, returns archive of copied resource
- **400** - client error, bad parameter, details in JSON response body, one of:
    - must specify path parameter (**path** cannot be empty)
    - not a directory (**path** was asserted to be a directory but exists as a
      file)
- **404** - client error, resource not found, one of:
    – no such container (container `id` does not exist)
    - no such file or directory (**path** does not exist)
- **500** - server error
@y
- **200** - success, returns archive of copied resource
- **400** - client error, bad parameter, details in JSON response body, one of:
    - must specify path parameter (**path** cannot be empty)
    - not a directory (**path** was asserted to be a directory but exists as a
      file)
- **404** - client error, resource not found, one of:
    – no such container (container `id` does not exist)
    - no such file or directory (**path** does not exist)
- **500** - server error
@z

@x
#### Extract an archive of files or folders to a directory in a container
@y
#### Extract an archive of files or folders to a directory in a container
@z

@x
`PUT /containers/(id or name)/archive`
@y
`PUT /containers/(id or name)/archive`
@z

@x
Upload a tar archive to be extracted to a path in the filesystem of container
`id`.
@y
Upload a tar archive to be extracted to a path in the filesystem of container
`id`.
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **path** - path to a directory in the container
    to extract the archive's contents into. Required.
@y
- **path** - path to a directory in the container
    to extract the archive's contents into. Required.
@z

@x
    If not an absolute path, it is relative to the container's root directory.
    The **path** resource must exist.
- **noOverwriteDirNonDir** - If "1", "true", or "True" then it will be an error
    if unpacking the given content would cause an existing directory to be
    replaced with a non-directory and vice versa.
@y
    If not an absolute path, it is relative to the container's root directory.
    The **path** resource must exist.
- **noOverwriteDirNonDir** - If "1", "true", or "True" then it will be an error
    if unpacking the given content would cause an existing directory to be
    replaced with a non-directory and vice versa.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    PUT /v1.21/containers/8cce319429b2/archive?path=/vol1 HTTP/1.1
    Content-Type: application/x-tar
@y
    PUT /v1.21/containers/8cce319429b2/archive?path=/vol1 HTTP/1.1
    Content-Type: application/x-tar
@z

@x
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@y
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
@y
    HTTP/1.1 200 OK
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
- **200** – the content was extracted successfully
- **400** - client error, bad parameter, details in JSON response body, one of:
    - must specify path parameter (**path** cannot be empty)
    - not a directory (**path** should be a directory but exists as a file)
    - unable to overwrite existing directory with non-directory
      (if **noOverwriteDirNonDir**)
    - unable to overwrite existing non-directory with directory
      (if **noOverwriteDirNonDir**)
- **403** - client error, permission denied, the volume
    or container rootfs is marked as read-only.
- **404** - client error, resource not found, one of:
    – no such container (container `id` does not exist)
    - no such file or directory (**path** resource does not exist)
- **500** – server error
@y
- **200** – the content was extracted successfully
- **400** - client error, bad parameter, details in JSON response body, one of:
    - must specify path parameter (**path** cannot be empty)
    - not a directory (**path** should be a directory but exists as a file)
    - unable to overwrite existing directory with non-directory
      (if **noOverwriteDirNonDir**)
    - unable to overwrite existing non-directory with directory
      (if **noOverwriteDirNonDir**)
- **403** - client error, permission denied, the volume
    or container rootfs is marked as read-only.
- **404** - client error, resource not found, one of:
    – no such container (container `id` does not exist)
    - no such file or directory (**path** resource does not exist)
- **500** – server error
@z

@x
### 2.2 Images
@y
### 2.2 Images
@z

@x
#### List Images
@y
#### List Images
@z

@x
`GET /images/json`
@y
`GET /images/json`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/images/json?all=0 HTTP/1.1
@y
    GET /v1.21/images/json?all=0 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    [
      {
         "RepoTags": [
           "ubuntu:12.04",
           "ubuntu:precise",
           "ubuntu:latest"
         ],
         "Id": "8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c",
         "Created": 1365714795,
         "Size": 131506275,
         "VirtualSize": 131506275,
         "Labels": {}
      },
      {
         "RepoTags": [
           "ubuntu:12.10",
           "ubuntu:quantal"
         ],
         "ParentId": "27cf784147099545",
         "Id": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
         "Created": 1364102658,
         "Size": 24653,
         "VirtualSize": 180116135,
         "Labels": {
            "com.example.version": "v1"
         }
      }
    ]
@y
    [
      {
         "RepoTags": [
           "ubuntu:12.04",
           "ubuntu:precise",
           "ubuntu:latest"
         ],
         "Id": "8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c",
         "Created": 1365714795,
         "Size": 131506275,
         "VirtualSize": 131506275,
         "Labels": {}
      },
      {
         "RepoTags": [
           "ubuntu:12.10",
           "ubuntu:quantal"
         ],
         "ParentId": "27cf784147099545",
         "Id": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
         "Created": 1364102658,
         "Size": 24653,
         "VirtualSize": 180116135,
         "Labels": {
            "com.example.version": "v1"
         }
      }
    ]
@z

@x
**Example request, with digest information**:
@y
**Example request, with digest information**:
@z

@x
    GET /v1.21/images/json?digests=1 HTTP/1.1
@y
    GET /v1.21/images/json?digests=1 HTTP/1.1
@z

@x
**Example response, with digest information**:
@y
**Example response, with digest information**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    [
      {
        "Created": 1420064636,
        "Id": "4986bf8c15363d1c5d15512d5266f8777bfba4974ac56e3270e7760f6f0a8125",
        "ParentId": "ea13149945cb6b1e746bf28032f02e9b5a793523481a0a18645fc77ad53c4ea2",
        "RepoDigests": [
          "localhost:5000/test/busybox@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf"
        ],
        "RepoTags": [
          "localhost:5000/test/busybox:latest",
          "playdate:latest"
        ],
        "Size": 0,
        "VirtualSize": 2429728,
        "Labels": {}
      }
    ]
@y
    [
      {
        "Created": 1420064636,
        "Id": "4986bf8c15363d1c5d15512d5266f8777bfba4974ac56e3270e7760f6f0a8125",
        "ParentId": "ea13149945cb6b1e746bf28032f02e9b5a793523481a0a18645fc77ad53c4ea2",
        "RepoDigests": [
          "localhost:5000/test/busybox@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf"
        ],
        "RepoTags": [
          "localhost:5000/test/busybox:latest",
          "playdate:latest"
        ],
        "Size": 0,
        "VirtualSize": 2429728,
        "Labels": {}
      }
    ]
@z

@x
The response shows a single image `Id` associated with two repositories
(`RepoTags`): `localhost:5000/test/busybox`: and `playdate`. A caller can use
either of the `RepoTags` values `localhost:5000/test/busybox:latest` or
`playdate:latest` to reference the image.
@y
The response shows a single image `Id` associated with two repositories
(`RepoTags`): `localhost:5000/test/busybox`: and `playdate`. A caller can use
either of the `RepoTags` values `localhost:5000/test/busybox:latest` or
`playdate:latest` to reference the image.
@z

@x
You can also use `RepoDigests` values to reference an image. In this response,
the array has only one reference and that is to the
`localhost:5000/test/busybox` repository; the `playdate` repository has no
digest. You can reference this digest using the value:
`localhost:5000/test/busybox@sha256:cbbf2f9a99b47fc460d...`
@y
You can also use `RepoDigests` values to reference an image. In this response,
the array has only one reference and that is to the
`localhost:5000/test/busybox` repository; the `playdate` repository has no
digest. You can reference this digest using the value:
`localhost:5000/test/busybox@sha256:cbbf2f9a99b47fc460d...`
@z

@x
See the `docker run` and `docker build` commands for examples of digest and tag
references on the command line.
@y
See the `docker run` and `docker build` commands for examples of digest and tag
references on the command line.
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **all** – 1/True/true or 0/False/false, default false
-   **filters** – a JSON encoded value of the filters (a map[string][]string) to process on the images list. Available filters:
  -   `dangling=true`
  -   `label=key` or `label="key=value"` of an image label
-   **filter** - only return images with the specified name
@y
-   **all** – 1/True/true or 0/False/false, default false
-   **filters** – a JSON encoded value of the filters (a map[string][]string) to process on the images list. Available filters:
  -   `dangling=true`
  -   `label=key` or `label="key=value"` of an image label
-   **filter** - only return images with the specified name
@z

@x
#### Build image from a Dockerfile
@y
#### Build image from a Dockerfile
@z

@x
`POST /build`
@y
`POST /build`
@z

@x
Build an image from a Dockerfile
@y
Build an image from a Dockerfile
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/build HTTP/1.1
    Content-Type: application/x-tar
@y
    POST /v1.21/build HTTP/1.1
    Content-Type: application/x-tar
@z

@x
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@y
    {% raw %}
    {{ TAR STREAM }}
    {% endraw %}
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {"stream": "Step 1/5..."}
    {"stream": "..."}
    {"error": "Error...", "errorDetail": {"code": 123, "message": "Error..."}}
@y
    {"stream": "Step 1/5..."}
    {"stream": "..."}
    {"error": "Error...", "errorDetail": {"code": 123, "message": "Error..."}}
@z

@x
The input stream must be a `tar` archive compressed with one of the
following algorithms: `identity` (no compression), `gzip`, `bzip2`, `xz`.
@y
The input stream must be a `tar` archive compressed with one of the
following algorithms: `identity` (no compression), `gzip`, `bzip2`, `xz`.
@z

@x
The archive must include a build instructions file, typically called
`Dockerfile` at the archive's root. The `dockerfile` parameter may be
used to specify a different build instructions file. To do this, its value must be
the path to the alternate build instructions file to use.
@y
The archive must include a build instructions file, typically called
`Dockerfile` at the archive's root. The `dockerfile` parameter may be
used to specify a different build instructions file. To do this, its value must be
the path to the alternate build instructions file to use.
@z

@x
The archive may include any number of other files,
which are accessible in the build context (See the [*ADD build
command*](../reference/builder.md#add)).
@y
The archive may include any number of other files,
which are accessible in the build context (See the [*ADD build
command*](../reference/builder.md#add)).
@z

@x
The Docker daemon performs a preliminary validation of the `Dockerfile` before
starting the build, and returns an error if the syntax is incorrect. After that,
each instruction is run one-by-one until the ID of the new image is output.
@y
The Docker daemon performs a preliminary validation of the `Dockerfile` before
starting the build, and returns an error if the syntax is incorrect. After that,
each instruction is run one-by-one until the ID of the new image is output.
@z

@x
The build is canceled if the client drops the connection by quitting
or being killed.
@y
The build is canceled if the client drops the connection by quitting
or being killed.
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **dockerfile** - Path within the build context to the `Dockerfile`. This is
        ignored if `remote` is specified and points to an external `Dockerfile`.
-   **t** – A name and optional tag to apply to the image in the `name:tag` format.
        If you omit the `tag` the default `latest` value is assumed.
        You can provide one or more `t` parameters.
-   **remote** – A Git repository URI or HTTP/HTTPS context URI. If the
        URI points to a single text file, the file's contents are placed into
        a file called `Dockerfile` and the image is built from that file. If
        the URI points to a tarball, the file is downloaded by the daemon and
        the contents therein used as the context for the build. If the URI
        points to a tarball and the `dockerfile` parameter is also specified,
        there must be a file with the corresponding path inside the tarball.
-   **q** – Suppress verbose build output.
-   **nocache** – Do not use the cache when building the image.
-   **pull** - Attempt to pull the image even if an older image exists locally.
-   **rm** - Remove intermediate containers after a successful build (default behavior).
-   **forcerm** - Always remove intermediate containers (includes `rm`).
-   **memory** - Set memory limit for build.
-   **memswap** - Total memory (memory + swap), `-1` to enable unlimited swap.
-   **cpushares** - CPU shares (relative weight).
-   **cpusetcpus** - CPUs in which to allow execution (e.g., `0-3`, `0,1`).
-   **cpuperiod** - The length of a CPU period in microseconds.
-   **cpuquota** - Microseconds of CPU time that the container can get in a CPU period.
-   **buildargs** – JSON map of string pairs for build-time variables. Users pass
        these values at build-time. Docker uses the `buildargs` as the environment
        context for command(s) run via the Dockerfile's `RUN` instruction or for
        variable expansion in other Dockerfile instructions. This is not meant for
        passing secret values. [Read more about the buildargs instruction](../reference/builder.md#arg)
@y
-   **dockerfile** - Path within the build context to the `Dockerfile`. This is
        ignored if `remote` is specified and points to an external `Dockerfile`.
-   **t** – A name and optional tag to apply to the image in the `name:tag` format.
        If you omit the `tag` the default `latest` value is assumed.
        You can provide one or more `t` parameters.
-   **remote** – A Git repository URI or HTTP/HTTPS context URI. If the
        URI points to a single text file, the file's contents are placed into
        a file called `Dockerfile` and the image is built from that file. If
        the URI points to a tarball, the file is downloaded by the daemon and
        the contents therein used as the context for the build. If the URI
        points to a tarball and the `dockerfile` parameter is also specified,
        there must be a file with the corresponding path inside the tarball.
-   **q** – Suppress verbose build output.
-   **nocache** – Do not use the cache when building the image.
-   **pull** - Attempt to pull the image even if an older image exists locally.
-   **rm** - Remove intermediate containers after a successful build (default behavior).
-   **forcerm** - Always remove intermediate containers (includes `rm`).
-   **memory** - Set memory limit for build.
-   **memswap** - Total memory (memory + swap), `-1` to enable unlimited swap.
-   **cpushares** - CPU shares (relative weight).
-   **cpusetcpus** - CPUs in which to allow execution (e.g., `0-3`, `0,1`).
-   **cpuperiod** - The length of a CPU period in microseconds.
-   **cpuquota** - Microseconds of CPU time that the container can get in a CPU period.
-   **buildargs** – JSON map of string pairs for build-time variables. Users pass
        these values at build-time. Docker uses the `buildargs` as the environment
        context for command(s) run via the Dockerfile's `RUN` instruction or for
        variable expansion in other Dockerfile instructions. This is not meant for
        passing secret values. [Read more about the buildargs instruction](../reference/builder.md#arg)
@z

@x
**Request Headers**:
@y
**Request Headers**:
@z

@x
-   **Content-type** – Set to `"application/x-tar"`.
-   **X-Registry-Config** – A base64-url-safe-encoded Registry Auth Config JSON
        object with the following structure:
@y
-   **Content-type** – Set to `"application/x-tar"`.
-   **X-Registry-Config** – A base64-url-safe-encoded Registry Auth Config JSON
        object with the following structure:
@z

@x
            {
                "docker.example.com": {
                    "username": "janedoe",
                    "password": "hunter2"
                },
                "https://index.docker.io/v1/": {
                    "username": "mobydock",
                    "password": "conta1n3rize14"
                }
            }
@y
            {
                "docker.example.com": {
                    "username": "janedoe",
                    "password": "hunter2"
                },
                "https://index.docker.io/v1/": {
                    "username": "mobydock",
                    "password": "conta1n3rize14"
                }
            }
@z

@x
    This object maps the hostname of a registry to an object containing the
    "username" and "password" for that registry. Multiple registries may
    be specified as the build may be based on an image requiring
    authentication to pull from any arbitrary registry. Only the registry
    domain name (and port if not the default "443") are required. However
    (for legacy reasons) the "official" Docker, Inc. hosted registry must
    be specified with both a "https://" prefix and a "/v1/" suffix even
    though Docker will prefer to use the v2 registry API.
@y
    This object maps the hostname of a registry to an object containing the
    "username" and "password" for that registry. Multiple registries may
    be specified as the build may be based on an image requiring
    authentication to pull from any arbitrary registry. Only the registry
    domain name (and port if not the default "443") are required. However
    (for legacy reasons) the "official" Docker, Inc. hosted registry must
    be specified with both a "https://" prefix and a "/v1/" suffix even
    though Docker will prefer to use the v2 registry API.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
#### Create an image
@y
#### Create an image
@z

@x
`POST /images/create`
@y
`POST /images/create`
@z

@x
Create an image either by pulling it from the registry or by importing it
@y
Create an image either by pulling it from the registry or by importing it
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/images/create?fromImage=busybox&tag=latest HTTP/1.1
@y
    POST /v1.21/images/create?fromImage=busybox&tag=latest HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {"status": "Pulling..."}
    {"status": "Pulling", "progress": "1 B/ 100 B", "progressDetail": {"current": 1, "total": 100}}
    {"error": "Invalid..."}
    ...
@y
    {"status": "Pulling..."}
    {"status": "Pulling", "progress": "1 B/ 100 B", "progressDetail": {"current": 1, "total": 100}}
    {"error": "Invalid..."}
    ...
@z

@x
When using this endpoint to pull an image from the registry, the
`X-Registry-Auth` header can be used to include
a base64-encoded AuthConfig object.
@y
When using this endpoint to pull an image from the registry, the
`X-Registry-Auth` header can be used to include
a base64-encoded AuthConfig object.
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **fromImage** – Name of the image to pull. The name may include a tag or
        digest. This parameter may only be used when pulling an image.
-   **fromSrc** – Source to import.  The value may be a URL from which the image
        can be retrieved or `-` to read the image from the request body.
        This parameter may only be used when importing an image.
-   **repo** – Repository name given to an image when it is imported.
        The repo may include a tag. This parameter may only be used when importing
        an image.
-   **tag** – Tag or digest. If empty when pulling an image, this causes all tags
        for the given image to be pulled.
@y
-   **fromImage** – Name of the image to pull. The name may include a tag or
        digest. This parameter may only be used when pulling an image.
-   **fromSrc** – Source to import.  The value may be a URL from which the image
        can be retrieved or `-` to read the image from the request body.
        This parameter may only be used when importing an image.
-   **repo** – Repository name given to an image when it is imported.
        The repo may include a tag. This parameter may only be used when importing
        an image.
-   **tag** – Tag or digest. If empty when pulling an image, this causes all tags
        for the given image to be pulled.
@z

@x
**Request Headers**:
@y
**Request Headers**:
@z

@x
-   **X-Registry-Auth** – base64-encoded AuthConfig object
@y
-   **X-Registry-Auth** – base64-encoded AuthConfig object
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** - repository does not exist or no read access
-   **500** – server error
@y
-   **200** – no error
-   **404** - repository does not exist or no read access
-   **500** – server error
@z

@x
#### Inspect an image
@y
#### Inspect an image
@z

@x
`GET /images/(name)/json`
@y
`GET /images/(name)/json`
@z

@x
Return low-level information on the image `name`
@y
Return low-level information on the image `name`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/images/example/json HTTP/1.1
@y
    GET /v1.21/images/example/json HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
       "Id" : "85f05633ddc1c50679be2b16a0479ab6f7637f8884e0cfe0f4d20e1ebb3d6e7c",
       "Container" : "cb91e48a60d01f1e27028b4fc6819f4f290b3cf12496c8176ec714d0d390984a",
       "Comment" : "",
       "Os" : "linux",
       "Architecture" : "amd64",
       "Parent" : "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
       "ContainerConfig" : {
          "Tty" : false,
          "Hostname" : "e611e15f9c9d",
          "Volumes" : null,
          "Domainname" : "",
          "AttachStdout" : false,
          "PublishService" : "",
          "AttachStdin" : false,
          "OpenStdin" : false,
          "StdinOnce" : false,
          "NetworkDisabled" : false,
          "OnBuild" : [],
          "Image" : "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
          "User" : "",
          "WorkingDir" : "",
          "Entrypoint" : null,
          "MacAddress" : "",
          "AttachStderr" : false,
          "Labels" : {
             "com.example.license" : "GPL",
             "com.example.version" : "1.0",
             "com.example.vendor" : "Acme"
          },
          "Env" : [
             "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
          ],
          "ExposedPorts" : null,
          "Cmd" : [
             "/bin/sh",
             "-c",
             "#(nop) LABEL com.example.vendor=Acme com.example.license=GPL com.example.version=1.0"
          ]
       },
       "DockerVersion" : "1.9.0-dev",
       "VirtualSize" : 188359297,
       "Size" : 0,
       "Author" : "",
       "Created" : "2015-09-10T08:30:53.26995814Z",
       "GraphDriver" : {
          "Name" : "aufs",
          "Data" : null
       },
       "RepoDigests" : [
          "localhost:5000/test/busybox/example@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf"
       ],
       "RepoTags" : [
          "example:1.0",
          "example:latest",
          "example:stable"
       ],
       "Config" : {
          "Image" : "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
          "NetworkDisabled" : false,
          "OnBuild" : [],
          "StdinOnce" : false,
          "PublishService" : "",
          "AttachStdin" : false,
          "OpenStdin" : false,
          "Domainname" : "",
          "AttachStdout" : false,
          "Tty" : false,
          "Hostname" : "e611e15f9c9d",
          "Volumes" : null,
          "Cmd" : [
             "/bin/bash"
          ],
          "ExposedPorts" : null,
          "Env" : [
             "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
          ],
          "Labels" : {
             "com.example.vendor" : "Acme",
             "com.example.version" : "1.0",
             "com.example.license" : "GPL"
          },
          "Entrypoint" : null,
          "MacAddress" : "",
          "AttachStderr" : false,
          "WorkingDir" : "",
          "User" : ""
       }
    }
@y
    {
       "Id" : "85f05633ddc1c50679be2b16a0479ab6f7637f8884e0cfe0f4d20e1ebb3d6e7c",
       "Container" : "cb91e48a60d01f1e27028b4fc6819f4f290b3cf12496c8176ec714d0d390984a",
       "Comment" : "",
       "Os" : "linux",
       "Architecture" : "amd64",
       "Parent" : "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
       "ContainerConfig" : {
          "Tty" : false,
          "Hostname" : "e611e15f9c9d",
          "Volumes" : null,
          "Domainname" : "",
          "AttachStdout" : false,
          "PublishService" : "",
          "AttachStdin" : false,
          "OpenStdin" : false,
          "StdinOnce" : false,
          "NetworkDisabled" : false,
          "OnBuild" : [],
          "Image" : "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
          "User" : "",
          "WorkingDir" : "",
          "Entrypoint" : null,
          "MacAddress" : "",
          "AttachStderr" : false,
          "Labels" : {
             "com.example.license" : "GPL",
             "com.example.version" : "1.0",
             "com.example.vendor" : "Acme"
          },
          "Env" : [
             "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
          ],
          "ExposedPorts" : null,
          "Cmd" : [
             "/bin/sh",
             "-c",
             "#(nop) LABEL com.example.vendor=Acme com.example.license=GPL com.example.version=1.0"
          ]
       },
       "DockerVersion" : "1.9.0-dev",
       "VirtualSize" : 188359297,
       "Size" : 0,
       "Author" : "",
       "Created" : "2015-09-10T08:30:53.26995814Z",
       "GraphDriver" : {
          "Name" : "aufs",
          "Data" : null
       },
       "RepoDigests" : [
          "localhost:5000/test/busybox/example@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf"
       ],
       "RepoTags" : [
          "example:1.0",
          "example:latest",
          "example:stable"
       ],
       "Config" : {
          "Image" : "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
          "NetworkDisabled" : false,
          "OnBuild" : [],
          "StdinOnce" : false,
          "PublishService" : "",
          "AttachStdin" : false,
          "OpenStdin" : false,
          "Domainname" : "",
          "AttachStdout" : false,
          "Tty" : false,
          "Hostname" : "e611e15f9c9d",
          "Volumes" : null,
          "Cmd" : [
             "/bin/bash"
          ],
          "ExposedPorts" : null,
          "Env" : [
             "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
          ],
          "Labels" : {
             "com.example.vendor" : "Acme",
             "com.example.version" : "1.0",
             "com.example.license" : "GPL"
          },
          "Entrypoint" : null,
          "MacAddress" : "",
          "AttachStderr" : false,
          "WorkingDir" : "",
          "User" : ""
       }
    }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@z

@x
#### Get the history of an image
@y
#### Get the history of an image
@z

@x
`GET /images/(name)/history`
@y
`GET /images/(name)/history`
@z

@x
Return the history of the image `name`
@y
Return the history of the image `name`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/images/ubuntu/history HTTP/1.1
@y
    GET /v1.21/images/ubuntu/history HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    [
        {
            "Id": "3db9c44f45209632d6050b35958829c3a2aa256d81b9a7be45b362ff85c54710",
            "Created": 1398108230,
            "CreatedBy": "/bin/sh -c #(nop) ADD file:eb15dbd63394e063b805a3c32ca7bf0266ef64676d5a6fab4801f2e81e2a5148 in /",
            "Tags": [
                "ubuntu:lucid",
                "ubuntu:10.04"
            ],
            "Size": 182964289,
            "Comment": ""
        },
        {
            "Id": "6cfa4d1f33fb861d4d114f43b25abd0ac737509268065cdfd69d544a59c85ab8",
            "Created": 1398108222,
            "CreatedBy": "/bin/sh -c #(nop) MAINTAINER Tianon Gravi <admwiggin@gmail.com> - mkimage-debootstrap.sh -i iproute,iputils-ping,ubuntu-minimal -t lucid.tar.xz lucid http://archive.ubuntu.com/ubuntu/",
            "Tags": null,
            "Size": 0,
            "Comment": ""
        },
        {
            "Id": "511136ea3c5a64f264b78b5433614aec563103b4d4702f3ba7d4d2698e22c158",
            "Created": 1371157430,
            "CreatedBy": "",
            "Tags": [
                "scratch12:latest",
                "scratch:latest"
            ],
            "Size": 0,
            "Comment": "Imported from -"
        }
    ]
@y
    [
        {
            "Id": "3db9c44f45209632d6050b35958829c3a2aa256d81b9a7be45b362ff85c54710",
            "Created": 1398108230,
            "CreatedBy": "/bin/sh -c #(nop) ADD file:eb15dbd63394e063b805a3c32ca7bf0266ef64676d5a6fab4801f2e81e2a5148 in /",
            "Tags": [
                "ubuntu:lucid",
                "ubuntu:10.04"
            ],
            "Size": 182964289,
            "Comment": ""
        },
        {
            "Id": "6cfa4d1f33fb861d4d114f43b25abd0ac737509268065cdfd69d544a59c85ab8",
            "Created": 1398108222,
            "CreatedBy": "/bin/sh -c #(nop) MAINTAINER Tianon Gravi <admwiggin@gmail.com> - mkimage-debootstrap.sh -i iproute,iputils-ping,ubuntu-minimal -t lucid.tar.xz lucid http://archive.ubuntu.com/ubuntu/",
            "Tags": null,
            "Size": 0,
            "Comment": ""
        },
        {
            "Id": "511136ea3c5a64f264b78b5433614aec563103b4d4702f3ba7d4d2698e22c158",
            "Created": 1371157430,
            "CreatedBy": "",
            "Tags": [
                "scratch12:latest",
                "scratch:latest"
            ],
            "Size": 0,
            "Comment": "Imported from -"
        }
    ]
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@z

@x
#### Push an image on the registry
@y
#### Push an image on the registry
@z

@x
`POST /images/(name)/push`
@y
`POST /images/(name)/push`
@z

@x
Push the image `name` on the registry
@y
Push the image `name` on the registry
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/images/test/push HTTP/1.1
@y
    POST /v1.21/images/test/push HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {"status": "Pushing..."}
    {"status": "Pushing", "progress": "1/? (n/a)", "progressDetail": {"current": 1}}}
    {"error": "Invalid..."}
    ...
@y
    {"status": "Pushing..."}
    {"status": "Pushing", "progress": "1/? (n/a)", "progressDetail": {"current": 1}}}
    {"error": "Invalid..."}
    ...
@z

@x
If you wish to push an image on to a private registry, that image must already have a tag
into a repository which references that registry `hostname` and `port`.  This repository name should
then be used in the URL. This duplicates the command line's flow.
@y
If you wish to push an image on to a private registry, that image must already have a tag
into a repository which references that registry `hostname` and `port`.  This repository name should
then be used in the URL. This duplicates the command line's flow.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/images/registry.acme.com:5000/test/push HTTP/1.1
@y
    POST /v1.21/images/registry.acme.com:5000/test/push HTTP/1.1
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **tag** – The tag to associate with the image on the registry. This is optional.
@y
-   **tag** – The tag to associate with the image on the registry. This is optional.
@z

@x
**Request Headers**:
@y
**Request Headers**:
@z

@x
-   **X-Registry-Auth** – base64-encoded AuthConfig object.
@y
-   **X-Registry-Auth** – base64-encoded AuthConfig object.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such image
-   **500** – server error
@z

@x
#### Tag an image into a repository
@y
#### Tag an image into a repository
@z

@x
`POST /images/(name)/tag`
@y
`POST /images/(name)/tag`
@z

@x
Tag the image `name` into a repository
@y
Tag the image `name` into a repository
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/images/test/tag?repo=myrepo&force=0&tag=v42 HTTP/1.1
@y
    POST /v1.21/images/test/tag?repo=myrepo&force=0&tag=v42 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 201 Created
@y
    HTTP/1.1 201 Created
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **repo** – The repository to tag in
-   **force** – 1/True/true or 0/False/false, default false
-   **tag** - The new tag name
@y
-   **repo** – The repository to tag in
-   **force** – 1/True/true or 0/False/false, default false
-   **tag** - The new tag name
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **201** – no error
-   **400** – bad parameter
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
@y
-   **201** – no error
-   **400** – bad parameter
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
@z

@x
#### Remove an image
@y
#### Remove an image
@z

@x
`DELETE /images/(name)`
@y
`DELETE /images/(name)`
@z

@x
Remove the image `name` from the filesystem
@y
Remove the image `name` from the filesystem
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    DELETE /v1.21/images/test HTTP/1.1
@y
    DELETE /v1.21/images/test HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-type: application/json
@y
    HTTP/1.1 200 OK
    Content-type: application/json
@z

@x
    [
     {"Untagged": "3e2f21a89f"},
     {"Deleted": "3e2f21a89f"},
     {"Deleted": "53b4f83ac9"}
    ]
@y
    [
     {"Untagged": "3e2f21a89f"},
     {"Deleted": "3e2f21a89f"},
     {"Deleted": "53b4f83ac9"}
    ]
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **force** – 1/True/true or 0/False/false, default false
-   **noprune** – 1/True/true or 0/False/false, default false
@y
-   **force** – 1/True/true or 0/False/false, default false
-   **noprune** – 1/True/true or 0/False/false, default false
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
@z

@x
#### Search images
@y
#### Search images
@z

@x
`GET /images/search`
@y
`GET /images/search`
@z

@x
Search for an image on [Docker Hub](https://hub.docker.com).
@y
Search for an image on [Docker Hub](https://hub.docker.com).
@z

@x
> **Note**:
> The response keys have changed from API v1.6 to reflect the JSON
> sent by the registry server to the docker daemon's request.
@y
> **Note**:
> The response keys have changed from API v1.6 to reflect the JSON
> sent by the registry server to the docker daemon's request.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/images/search?term=sshd HTTP/1.1
@y
    GET /v1.21/images/search?term=sshd HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    [
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "wma55/u1210sshd",
                "star_count": 0
            },
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "jdswinbank/sshd",
                "star_count": 0
            },
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "vgauthier/sshd",
                "star_count": 0
            }
    ...
    ]
@y
    [
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "wma55/u1210sshd",
                "star_count": 0
            },
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "jdswinbank/sshd",
                "star_count": 0
            },
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "vgauthier/sshd",
                "star_count": 0
            }
    ...
    ]
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **term** – term to search
@y
-   **term** – term to search
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
### 2.3 Misc
@y
### 2.3 Misc
@z

@x
#### Check auth configuration
@y
#### Check auth configuration
@z

@x
`POST /auth`
@y
`POST /auth`
@z

@x
Get the default username and email
@y
Get the default username and email
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/auth HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.21/auth HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
         "username": "hannibal",
         "password": "xxxx",
         "email": "hannibal@a-team.com",
         "serveraddress": "https://index.docker.io/v1/"
    }
@y
    {
         "username": "hannibal",
         "password": "xxxx",
         "email": "hannibal@a-team.com",
         "serveraddress": "https://index.docker.io/v1/"
    }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
@y
    HTTP/1.1 200 OK
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **204** – no error
-   **500** – server error
@y
-   **200** – no error
-   **204** – no error
-   **500** – server error
@z

@x
#### Display system-wide information
@y
#### Display system-wide information
@z

@x
`GET /info`
@y
`GET /info`
@z

@x
Display system-wide information
@y
Display system-wide information
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/info HTTP/1.1
@y
    GET /v1.21/info HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
        "ClusterStore": "etcd://localhost:2379",
        "Containers": 11,
        "CpuCfsPeriod": true,
        "CpuCfsQuota": true,
        "Debug": false,
        "DockerRootDir": "/var/lib/docker",
        "Driver": "btrfs",
        "DriverStatus": [[""]],
        "ExecutionDriver": "native-0.1",
        "ExperimentalBuild": false,
        "HttpProxy": "http://test:test@localhost:8080",
        "HttpsProxy": "https://test:test@localhost:8080",
        "ID": "7TRN:IPZB:QYBB:VPBQ:UMPP:KARE:6ZNR:XE6T:7EWV:PKF4:ZOJD:TPYS",
        "IPv4Forwarding": true,
        "Images": 16,
        "IndexServerAddress": "https://index.docker.io/v1/",
        "InitPath": "/usr/bin/docker",
        "InitSha1": "",
        "KernelVersion": "3.12.0-1-amd64",
        "Labels": [
            "storage=ssd"
        ],
        "MemTotal": 2099236864,
        "MemoryLimit": true,
        "NCPU": 1,
        "NEventsListener": 0,
        "NFd": 11,
        "NGoroutines": 21,
        "Name": "prod-server-42",
        "NoProxy": "9.81.1.160",
        "OomKillDisable": true,
        "OperatingSystem": "Boot2Docker",
        "RegistryConfig": {
            "IndexConfigs": {
                "docker.io": {
                    "Mirrors": null,
                    "Name": "docker.io",
                    "Official": true,
                    "Secure": true
                }
            },
            "InsecureRegistryCIDRs": [
                "127.0.0.0/8"
            ]
        },
        "ServerVersion": "1.9.0",
        "SwapLimit": false,
        "SystemTime": "2015-03-10T11:11:23.730591467-07:00"
    }
@y
    {
        "ClusterStore": "etcd://localhost:2379",
        "Containers": 11,
        "CpuCfsPeriod": true,
        "CpuCfsQuota": true,
        "Debug": false,
        "DockerRootDir": "/var/lib/docker",
        "Driver": "btrfs",
        "DriverStatus": [[""]],
        "ExecutionDriver": "native-0.1",
        "ExperimentalBuild": false,
        "HttpProxy": "http://test:test@localhost:8080",
        "HttpsProxy": "https://test:test@localhost:8080",
        "ID": "7TRN:IPZB:QYBB:VPBQ:UMPP:KARE:6ZNR:XE6T:7EWV:PKF4:ZOJD:TPYS",
        "IPv4Forwarding": true,
        "Images": 16,
        "IndexServerAddress": "https://index.docker.io/v1/",
        "InitPath": "/usr/bin/docker",
        "InitSha1": "",
        "KernelVersion": "3.12.0-1-amd64",
        "Labels": [
            "storage=ssd"
        ],
        "MemTotal": 2099236864,
        "MemoryLimit": true,
        "NCPU": 1,
        "NEventsListener": 0,
        "NFd": 11,
        "NGoroutines": 21,
        "Name": "prod-server-42",
        "NoProxy": "9.81.1.160",
        "OomKillDisable": true,
        "OperatingSystem": "Boot2Docker",
        "RegistryConfig": {
            "IndexConfigs": {
                "docker.io": {
                    "Mirrors": null,
                    "Name": "docker.io",
                    "Official": true,
                    "Secure": true
                }
            },
            "InsecureRegistryCIDRs": [
                "127.0.0.0/8"
            ]
        },
        "ServerVersion": "1.9.0",
        "SwapLimit": false,
        "SystemTime": "2015-03-10T11:11:23.730591467-07:00"
    }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
#### Show the docker version information
@y
#### Show the docker version information
@z

@x
`GET /version`
@y
`GET /version`
@z

@x
Show the docker version information
@y
Show the docker version information
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/version HTTP/1.1
@y
    GET /v1.21/version HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
         "Version": "1.5.0",
         "Os": "linux",
         "KernelVersion": "3.18.5-tinycore64",
         "GoVersion": "go1.4.1",
         "GitCommit": "a8a31ef",
         "Arch": "amd64",
         "ApiVersion": "1.20",
         "Experimental": false
    }
@y
    {
         "Version": "1.5.0",
         "Os": "linux",
         "KernelVersion": "3.18.5-tinycore64",
         "GoVersion": "go1.4.1",
         "GitCommit": "a8a31ef",
         "Arch": "amd64",
         "ApiVersion": "1.20",
         "Experimental": false
    }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
#### Ping the docker server
@y
#### Ping the docker server
@z

@x
`GET /_ping`
@y
`GET /_ping`
@z

@x
Ping the docker server
@y
Ping the docker server
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/_ping HTTP/1.1
@y
    GET /v1.21/_ping HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: text/plain
@y
    HTTP/1.1 200 OK
    Content-Type: text/plain
@z

@x
    OK
@y
    OK
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **500** - server error
@y
-   **200** - no error
-   **500** - server error
@z

@x
#### Create a new image from a container's changes
@y
#### Create a new image from a container's changes
@z

@x
`POST /commit`
@y
`POST /commit`
@z

@x
Create a new image from a container's changes
@y
Create a new image from a container's changes
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/commit?container=44c004db4b17&comment=message&repo=myrepo HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.21/commit?container=44c004db4b17&comment=message&repo=myrepo HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
         "Hostname": "",
         "Domainname": "",
         "User": "",
         "AttachStdin": false,
         "AttachStdout": true,
         "AttachStderr": true,
         "Tty": false,
         "OpenStdin": false,
         "StdinOnce": false,
         "Env": null,
         "Cmd": [
                 "date"
         ],
         "Mounts": [
           {
             "Source": "/data",
             "Destination": "/data",
             "Mode": "ro,Z",
             "RW": false
           }
         ],
         "Labels": {
                 "key1": "value1",
                 "key2": "value2"
          },
         "WorkingDir": "",
         "NetworkDisabled": false,
         "ExposedPorts": {
                 "22/tcp": {}
         }
    }
@y
    {
         "Hostname": "",
         "Domainname": "",
         "User": "",
         "AttachStdin": false,
         "AttachStdout": true,
         "AttachStderr": true,
         "Tty": false,
         "OpenStdin": false,
         "StdinOnce": false,
         "Env": null,
         "Cmd": [
                 "date"
         ],
         "Mounts": [
           {
             "Source": "/data",
             "Destination": "/data",
             "Mode": "ro,Z",
             "RW": false
           }
         ],
         "Labels": {
                 "key1": "value1",
                 "key2": "value2"
          },
         "WorkingDir": "",
         "NetworkDisabled": false,
         "ExposedPorts": {
                 "22/tcp": {}
         }
    }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 201 Created
    Content-Type: application/json
@y
    HTTP/1.1 201 Created
    Content-Type: application/json
@z

@x
    {"Id": "596069db4bf5"}
@y
    {"Id": "596069db4bf5"}
@z

@x
**JSON parameters**:
@y
**JSON parameters**:
@z

@x
-  **config** - the container's configuration
@y
-  **config** - the container's configuration
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **container** – source container
-   **repo** – repository
-   **tag** – tag
-   **comment** – commit message
-   **author** – author (e.g., "John Hannibal Smith
    <[hannibal@a-team.com](mailto:hannibal%40a-team.com)>")
-   **pause** – 1/True/true or 0/False/false, whether to pause the container before committing
-   **changes** – Dockerfile instructions to apply while committing
@y
-   **container** – source container
-   **repo** – repository
-   **tag** – tag
-   **comment** – commit message
-   **author** – author (e.g., "John Hannibal Smith
    <[hannibal@a-team.com](mailto:hannibal%40a-team.com)>")
-   **pause** – 1/True/true or 0/False/false, whether to pause the container before committing
-   **changes** – Dockerfile instructions to apply while committing
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **201** – no error
-   **404** – no such container
-   **500** – server error
@y
-   **201** – no error
-   **404** – no such container
-   **500** – server error
@z

@x
#### Monitor Docker's events
@y
#### Monitor Docker's events
@z

@x
`GET /events`
@y
`GET /events`
@z

@x
Get container events from docker, in real time via streaming.
@y
Get container events from docker, in real time via streaming.
@z

@x
Docker containers report the following events:
@y
Docker containers report the following events:
@z

@x
    attach, commit, copy, create, destroy, die, exec_create, exec_start, export, kill, oom, pause, rename, resize, restart, start, stop, top, unpause
@y
    attach, commit, copy, create, destroy, die, exec_create, exec_start, export, kill, oom, pause, rename, resize, restart, start, stop, top, unpause
@z

@x
Docker images report the following events:
@y
Docker images report the following events:
@z

@x
    delete, import, pull, push, tag, untag
@y
    delete, import, pull, push, tag, untag
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/events?since=1374067924
@y
    GET /v1.21/events?since=1374067924
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {"status":"pull","id":"busybox:latest","time":1442421700,"timeNano":1442421700598988358}
    {"status":"create","id":"5745704abe9caa5","from":"busybox","time":1442421716,"timeNano":1442421716853979870}
    {"status":"attach","id":"5745704abe9caa5","from":"busybox","time":1442421716,"timeNano":1442421716894759198}
    {"status":"start","id":"5745704abe9caa5","from":"busybox","time":1442421716,"timeNano":1442421716983607193}
@y
    {"status":"pull","id":"busybox:latest","time":1442421700,"timeNano":1442421700598988358}
    {"status":"create","id":"5745704abe9caa5","from":"busybox","time":1442421716,"timeNano":1442421716853979870}
    {"status":"attach","id":"5745704abe9caa5","from":"busybox","time":1442421716,"timeNano":1442421716894759198}
    {"status":"start","id":"5745704abe9caa5","from":"busybox","time":1442421716,"timeNano":1442421716983607193}
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **since** – Timestamp. Show all events created since timestamp and then stream
-   **until** – Timestamp. Show events created until given timestamp and stop streaming
-   **filters** – A json encoded value of the filters (a map[string][]string) to process on the event list. Available filters:
  -   `container=<string>`; -- container to filter
  -   `event=<string>`; -- event to filter
  -   `image=<string>`; -- image to filter
  -   `label=<string>`; -- image and container label to filter
@y
-   **since** – Timestamp. Show all events created since timestamp and then stream
-   **until** – Timestamp. Show events created until given timestamp and stop streaming
-   **filters** – A json encoded value of the filters (a map[string][]string) to process on the event list. Available filters:
  -   `container=<string>`; -- container to filter
  -   `event=<string>`; -- event to filter
  -   `image=<string>`; -- image to filter
  -   `label=<string>`; -- image and container label to filter
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
#### Get a tarball containing all images in a repository
@y
#### Get a tarball containing all images in a repository
@z

@x
`GET /images/(name)/get`
@y
`GET /images/(name)/get`
@z

@x
Get a tarball containing all images and metadata for the repository specified
by `name`.
@y
Get a tarball containing all images and metadata for the repository specified
by `name`.
@z

@x
If `name` is a specific name and tag (e.g. ubuntu:latest), then only that image
(and its parents) are returned. If `name` is an image ID, similarly only that
image (and its parents) are returned, but with the exclusion of the
'repositories' file in the tarball, as there were no image names referenced.
@y
If `name` is a specific name and tag (e.g. ubuntu:latest), then only that image
(and its parents) are returned. If `name` is an image ID, similarly only that
image (and its parents) are returned, but with the exclusion of the
'repositories' file in the tarball, as there were no image names referenced.
@z

@x
See the [image tarball format](#image-tarball-format) for more details.
@y
See the [image tarball format](#image-tarball-format) for more details.
@z

@x
**Example request**
@y
**Example request**
@z

@x
    GET /v1.21/images/ubuntu/get
@y
    GET /v1.21/images/ubuntu/get
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/x-tar
@y
    HTTP/1.1 200 OK
    Content-Type: application/x-tar
@z

@x
    Binary data stream
@y
    Binary data stream
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
#### Get a tarball containing all images
@y
#### Get a tarball containing all images
@z

@x
`GET /images/get`
@y
`GET /images/get`
@z

@x
Get a tarball containing all images and metadata for one or more repositories.
@y
Get a tarball containing all images and metadata for one or more repositories.
@z

@x
For each value of the `names` parameter: if it is a specific name and tag (e.g.
`ubuntu:latest`), then only that image (and its parents) are returned; if it is
an image ID, similarly only that image (and its parents) are returned and there
would be no names referenced in the 'repositories' file for this image ID.
@y
For each value of the `names` parameter: if it is a specific name and tag (e.g.
`ubuntu:latest`), then only that image (and its parents) are returned; if it is
an image ID, similarly only that image (and its parents) are returned and there
would be no names referenced in the 'repositories' file for this image ID.
@z

@x
See the [image tarball format](#image-tarball-format) for more details.
@y
See the [image tarball format](#image-tarball-format) for more details.
@z

@x
**Example request**
@y
**Example request**
@z

@x
    GET /v1.21/images/get?names=myname%2Fmyapp%3Alatest&names=busybox
@y
    GET /v1.21/images/get?names=myname%2Fmyapp%3Alatest&names=busybox
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/x-tar
@y
    HTTP/1.1 200 OK
    Content-Type: application/x-tar
@z

@x
    Binary data stream
@y
    Binary data stream
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
#### Load a tarball with a set of images and tags into docker
@y
#### Load a tarball with a set of images and tags into docker
@z

@x
`POST /images/load`
@y
`POST /images/load`
@z

@x
Load a set of images and tags into a Docker repository.
See the [image tarball format](#image-tarball-format) for more details.
@y
Load a set of images and tags into a Docker repository.
See the [image tarball format](#image-tarball-format) for more details.
@z

@x
**Example request**
@y
**Example request**
@z

@x
    POST /v1.21/images/load
    Content-Type: application/x-tar
    Content-Length: 12345
@y
    POST /v1.21/images/load
    Content-Type: application/x-tar
    Content-Length: 12345
@z

@x
    Tarball in body
@y
    Tarball in body
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
@y
    HTTP/1.1 200 OK
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **500** – server error
@y
-   **200** – no error
-   **500** – server error
@z

@x
#### Image tarball format
@y
#### Image tarball format
@z

@x
An image tarball contains one directory per image layer (named using its long ID),
each containing these files:
@y
An image tarball contains one directory per image layer (named using its long ID),
each containing these files:
@z

@x
- `VERSION`: currently `1.0` - the file format version
- `json`: detailed layer information, similar to `docker inspect layer_id`
- `layer.tar`: A tarfile containing the filesystem changes in this layer
@y
- `VERSION`: currently `1.0` - the file format version
- `json`: detailed layer information, similar to `docker inspect layer_id`
- `layer.tar`: A tarfile containing the filesystem changes in this layer
@z

@x
The `layer.tar` file contains `aufs` style `.wh..wh.aufs` files and directories
for storing attribute changes and deletions.
@y
The `layer.tar` file contains `aufs` style `.wh..wh.aufs` files and directories
for storing attribute changes and deletions.
@z

@x
If the tarball defines a repository, the tarball should also include a `repositories` file at
the root that contains a list of repository and tag names mapped to layer IDs.
@y
If the tarball defines a repository, the tarball should also include a `repositories` file at
the root that contains a list of repository and tag names mapped to layer IDs.
@z

@x
```
{"hello-world":
    {"latest": "565a9d68a73f6706862bfe8409a7f659776d4d60a8d096eb4a3cbce6999cc2a1"}
}
```
@y
```
{"hello-world":
    {"latest": "565a9d68a73f6706862bfe8409a7f659776d4d60a8d096eb4a3cbce6999cc2a1"}
}
```
@z

@x
#### Exec Create
@y
#### Exec Create
@z

@x
`POST /containers/(id or name)/exec`
@y
`POST /containers/(id or name)/exec`
@z

@x
Sets up an exec instance in a running container `id`
@y
Sets up an exec instance in a running container `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/containers/e90e34656806/exec HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.21/containers/e90e34656806/exec HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
      "AttachStdin": true,
      "AttachStdout": true,
      "AttachStderr": true,
      "Cmd": ["sh"],
      "Privileged": true,
      "Tty": true,
      "User": "123:456"
    }
@y
    {
      "AttachStdin": true,
      "AttachStdout": true,
      "AttachStderr": true,
      "Cmd": ["sh"],
      "Privileged": true,
      "Tty": true,
      "User": "123:456"
    }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 201 Created
    Content-Type: application/json
@y
    HTTP/1.1 201 Created
    Content-Type: application/json
@z

@x
    {
         "Id": "f90e34656806",
         "Warnings":[]
    }
@y
    {
         "Id": "f90e34656806",
         "Warnings":[]
    }
@z

@x
**JSON parameters**:
@y
**JSON parameters**:
@z

@x
-   **AttachStdin** - Boolean value, attaches to `stdin` of the `exec` command.
-   **AttachStdout** - Boolean value, attaches to `stdout` of the `exec` command.
-   **AttachStderr** - Boolean value, attaches to `stderr` of the `exec` command.
-   **Tty** - Boolean value to allocate a pseudo-TTY.
-   **Cmd** - Command to run specified as a string or an array of strings.
-   **Privileged** - Boolean value, runs the exec process with extended privileges.
-   **User** - A string value specifying the user, and optionally, group to run
        the exec process inside the container. Format is one of: `"user"`,
        `"user:group"`, `"uid"`, or `"uid:gid"`.
@y
-   **AttachStdin** - Boolean value, attaches to `stdin` of the `exec` command.
-   **AttachStdout** - Boolean value, attaches to `stdout` of the `exec` command.
-   **AttachStderr** - Boolean value, attaches to `stderr` of the `exec` command.
-   **Tty** - Boolean value to allocate a pseudo-TTY.
-   **Cmd** - Command to run specified as a string or an array of strings.
-   **Privileged** - Boolean value, runs the exec process with extended privileges.
-   **User** - A string value specifying the user, and optionally, group to run
        the exec process inside the container. Format is one of: `"user"`,
        `"user:group"`, `"uid"`, or `"uid:gid"`.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **201** – no error
-   **404** – no such container
-   **409** - container is paused
-   **500** - server error
@y
-   **201** – no error
-   **404** – no such container
-   **409** - container is paused
-   **500** - server error
@z

@x
#### Exec Start
@y
#### Exec Start
@z

@x
`POST /exec/(id)/start`
@y
`POST /exec/(id)/start`
@z

@x
Starts a previously set up `exec` instance `id`. If `detach` is true, this API
returns after starting the `exec` command. Otherwise, this API sets up an
interactive session with the `exec` command.
@y
Starts a previously set up `exec` instance `id`. If `detach` is true, this API
returns after starting the `exec` command. Otherwise, this API sets up an
interactive session with the `exec` command.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/exec/e90e34656806/start HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.21/exec/e90e34656806/start HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
     "Detach": false,
     "Tty": false
    }
@y
    {
     "Detach": false,
     "Tty": false
    }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/vnd.docker.raw-stream
@y
    HTTP/1.1 200 OK
    Content-Type: application/vnd.docker.raw-stream
@z

@x
    {% raw %}
    {{ STREAM }}
    {% endraw %}
@y
    {% raw %}
    {{ STREAM }}
    {% endraw %}
@z

@x
**JSON parameters**:
@y
**JSON parameters**:
@z

@x
-   **Detach** - Detach from the `exec` command.
-   **Tty** - Boolean value to allocate a pseudo-TTY.
@y
-   **Detach** - Detach from the `exec` command.
-   **Tty** - Boolean value to allocate a pseudo-TTY.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such exec instance
-   **409** - container is paused
@y
-   **200** – no error
-   **404** – no such exec instance
-   **409** - container is paused
@z

@x
**Stream details**:
@y
**Stream details**:
@z

@x
Similar to the stream behavior of `POST /containers/(id or name)/attach` API
@y
Similar to the stream behavior of `POST /containers/(id or name)/attach` API
@z

@x
#### Exec Resize
@y
#### Exec Resize
@z

@x
`POST /exec/(id)/resize`
@y
`POST /exec/(id)/resize`
@z

@x
Resizes the `tty` session used by the `exec` command `id`.  The unit is number of characters.
This API is valid only if `tty` was specified as part of creating and starting the `exec` command.
@y
Resizes the `tty` session used by the `exec` command `id`.  The unit is number of characters.
This API is valid only if `tty` was specified as part of creating and starting the `exec` command.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/exec/e90e34656806/resize?h=40&w=80 HTTP/1.1
    Content-Type: text/plain
@y
    POST /v1.21/exec/e90e34656806/resize?h=40&w=80 HTTP/1.1
    Content-Type: text/plain
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 201 Created
    Content-Type: text/plain
@y
    HTTP/1.1 201 Created
    Content-Type: text/plain
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **h** – height of `tty` session
-   **w** – width
@y
-   **h** – height of `tty` session
-   **w** – width
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **201** – no error
-   **404** – no such exec instance
@y
-   **201** – no error
-   **404** – no such exec instance
@z

@x
#### Exec Inspect
@y
#### Exec Inspect
@z

@x
`GET /exec/(id)/json`
@y
`GET /exec/(id)/json`
@z

@x
Return low-level information about the `exec` command `id`.
@y
Return low-level information about the `exec` command `id`.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/exec/11fb006128e8ceb3942e7c58d77750f24210e35f879dd204ac975c184b820b39/json HTTP/1.1
@y
    GET /v1.21/exec/11fb006128e8ceb3942e7c58d77750f24210e35f879dd204ac975c184b820b39/json HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: plain/text
@y
    HTTP/1.1 200 OK
    Content-Type: plain/text
@z

@x
    {
      "ID" : "11fb006128e8ceb3942e7c58d77750f24210e35f879dd204ac975c184b820b39",
      "Running" : false,
      "ExitCode" : 2,
      "ProcessConfig" : {
        "privileged" : false,
        "user" : "",
        "tty" : false,
        "entrypoint" : "sh",
        "arguments" : [
          "-c",
          "exit 2"
        ]
      },
      "OpenStdin" : false,
      "OpenStderr" : false,
      "OpenStdout" : false,
      "Container" : {
        "State" : {
          "Status" : "running",
          "Running" : true,
          "Paused" : false,
          "Restarting" : false,
          "OOMKilled" : false,
          "Pid" : 3650,
          "ExitCode" : 0,
          "Error" : "",
          "StartedAt" : "2014-11-17T22:26:03.717657531Z",
          "FinishedAt" : "0001-01-01T00:00:00Z"
        },
        "ID" : "8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c",
        "Created" : "2014-11-17T22:26:03.626304998Z",
        "Path" : "date",
        "Args" : [],
        "Config" : {
          "Hostname" : "8f177a186b97",
          "Domainname" : "",
          "User" : "",
          "AttachStdin" : false,
          "AttachStdout" : false,
          "AttachStderr" : false,
          "ExposedPorts" : null,
          "Tty" : false,
          "OpenStdin" : false,
          "StdinOnce" : false,
          "Env" : [ "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" ],
          "Cmd" : [
            "date"
          ],
          "Image" : "ubuntu",
          "Volumes" : null,
          "WorkingDir" : "",
          "Entrypoint" : null,
          "NetworkDisabled" : false,
          "MacAddress" : "",
          "OnBuild" : null,
          "SecurityOpt" : null
        },
        "Image" : "5506de2b643be1e6febbf3b8a240760c6843244c41e12aa2f60ccbb7153d17f5",
        "NetworkSettings" : {
          "Bridge": "",
          "SandboxID": "",
          "HairpinMode": false,
          "LinkLocalIPv6Address": "",
          "LinkLocalIPv6PrefixLen": 0,
          "Ports": null,
          "SandboxKey": "",
          "SecondaryIPAddresses": null,
          "SecondaryIPv6Addresses": null,
          "EndpointID": "",
          "Gateway": "",
          "GlobalIPv6Address": "",
          "GlobalIPv6PrefixLen": 0,
          "IPAddress": "",
          "IPPrefixLen": 0,
          "IPv6Gateway": "",
          "MacAddress": "",
          "Networks": {
            "bridge": {
              "EndpointID": "",
              "Gateway": "",
              "IPAddress": "",
              "IPPrefixLen": 0,
              "IPv6Gateway": "",
              "GlobalIPv6Address": "",
              "GlobalIPv6PrefixLen": 0,
              "MacAddress": ""
            }
          }
        },
        "ResolvConfPath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/resolv.conf",
        "HostnamePath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/hostname",
        "HostsPath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/hosts",
        "LogPath": "/var/lib/docker/containers/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b-json.log",
        "Name" : "/test",
        "Driver" : "aufs",
        "ExecDriver" : "native-0.2",
        "MountLabel" : "",
        "ProcessLabel" : "",
        "AppArmorProfile" : "",
        "RestartCount" : 0,
        "Mounts" : []
      }
    }
@y
    {
      "ID" : "11fb006128e8ceb3942e7c58d77750f24210e35f879dd204ac975c184b820b39",
      "Running" : false,
      "ExitCode" : 2,
      "ProcessConfig" : {
        "privileged" : false,
        "user" : "",
        "tty" : false,
        "entrypoint" : "sh",
        "arguments" : [
          "-c",
          "exit 2"
        ]
      },
      "OpenStdin" : false,
      "OpenStderr" : false,
      "OpenStdout" : false,
      "Container" : {
        "State" : {
          "Status" : "running",
          "Running" : true,
          "Paused" : false,
          "Restarting" : false,
          "OOMKilled" : false,
          "Pid" : 3650,
          "ExitCode" : 0,
          "Error" : "",
          "StartedAt" : "2014-11-17T22:26:03.717657531Z",
          "FinishedAt" : "0001-01-01T00:00:00Z"
        },
        "ID" : "8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c",
        "Created" : "2014-11-17T22:26:03.626304998Z",
        "Path" : "date",
        "Args" : [],
        "Config" : {
          "Hostname" : "8f177a186b97",
          "Domainname" : "",
          "User" : "",
          "AttachStdin" : false,
          "AttachStdout" : false,
          "AttachStderr" : false,
          "ExposedPorts" : null,
          "Tty" : false,
          "OpenStdin" : false,
          "StdinOnce" : false,
          "Env" : [ "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" ],
          "Cmd" : [
            "date"
          ],
          "Image" : "ubuntu",
          "Volumes" : null,
          "WorkingDir" : "",
          "Entrypoint" : null,
          "NetworkDisabled" : false,
          "MacAddress" : "",
          "OnBuild" : null,
          "SecurityOpt" : null
        },
        "Image" : "5506de2b643be1e6febbf3b8a240760c6843244c41e12aa2f60ccbb7153d17f5",
        "NetworkSettings" : {
          "Bridge": "",
          "SandboxID": "",
          "HairpinMode": false,
          "LinkLocalIPv6Address": "",
          "LinkLocalIPv6PrefixLen": 0,
          "Ports": null,
          "SandboxKey": "",
          "SecondaryIPAddresses": null,
          "SecondaryIPv6Addresses": null,
          "EndpointID": "",
          "Gateway": "",
          "GlobalIPv6Address": "",
          "GlobalIPv6PrefixLen": 0,
          "IPAddress": "",
          "IPPrefixLen": 0,
          "IPv6Gateway": "",
          "MacAddress": "",
          "Networks": {
            "bridge": {
              "EndpointID": "",
              "Gateway": "",
              "IPAddress": "",
              "IPPrefixLen": 0,
              "IPv6Gateway": "",
              "GlobalIPv6Address": "",
              "GlobalIPv6PrefixLen": 0,
              "MacAddress": ""
            }
          }
        },
        "ResolvConfPath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/resolv.conf",
        "HostnamePath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/hostname",
        "HostsPath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/hosts",
        "LogPath": "/var/lib/docker/containers/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b-json.log",
        "Name" : "/test",
        "Driver" : "aufs",
        "ExecDriver" : "native-0.2",
        "MountLabel" : "",
        "ProcessLabel" : "",
        "AppArmorProfile" : "",
        "RestartCount" : 0,
        "Mounts" : []
      }
    }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such exec instance
-   **500** - server error
@y
-   **200** – no error
-   **404** – no such exec instance
-   **500** - server error
@z

@x
### 2.4 Volumes
@y
### 2.4 Volumes
@z

@x
#### List volumes
@y
#### List volumes
@z

@x
`GET /volumes`
@y
`GET /volumes`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/volumes HTTP/1.1
@y
    GET /v1.21/volumes HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
      "Volumes": [
        {
          "Name": "tardis",
          "Driver": "local",
          "Mountpoint": "/var/lib/docker/volumes/tardis"
        }
      ]
    }
@y
    {
      "Volumes": [
        {
          "Name": "tardis",
          "Driver": "local",
          "Mountpoint": "/var/lib/docker/volumes/tardis"
        }
      ]
    }
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the volumes list. There is one available filter: `dangling=true`
@y
- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the volumes list. There is one available filter: `dangling=true`
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **500** - server error
@y
-   **200** - no error
-   **500** - server error
@z

@x
#### Create a volume
@y
#### Create a volume
@z

@x
`POST /volumes/create`
@y
`POST /volumes/create`
@z

@x
Create a volume
@y
Create a volume
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.21/volumes/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.21/volumes/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
      "Name": "tardis"
    }
@y
    {
      "Name": "tardis"
    }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 201 Created
    Content-Type: application/json
@y
    HTTP/1.1 201 Created
    Content-Type: application/json
@z

@x
    {
      "Name": "tardis",
      "Driver": "local",
      "Mountpoint": "/var/lib/docker/volumes/tardis"
    }
@y
    {
      "Name": "tardis",
      "Driver": "local",
      "Mountpoint": "/var/lib/docker/volumes/tardis"
    }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
- **201** - no error
- **500**  - server error
@y
- **201** - no error
- **500**  - server error
@z

@x
**JSON parameters**:
@y
**JSON parameters**:
@z

@x
- **Name** - The new volume's name. If not specified, Docker generates a name.
- **Driver** - Name of the volume driver to use. Defaults to `local` for the name.
- **DriverOpts** - A mapping of driver options and values. These options are
    passed directly to the driver and are driver specific.
@y
- **Name** - The new volume's name. If not specified, Docker generates a name.
- **Driver** - Name of the volume driver to use. Defaults to `local` for the name.
- **DriverOpts** - A mapping of driver options and values. These options are
    passed directly to the driver and are driver specific.
@z

@x
#### Inspect a volume
@y
#### Inspect a volume
@z

@x
`GET /volumes/(name)`
@y
`GET /volumes/(name)`
@z

@x
Return low-level information on the volume `name`
@y
Return low-level information on the volume `name`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /volumes/tardis
@y
    GET /volumes/tardis
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
@z

@x
    {
      "Name": "tardis",
      "Driver": "local",
      "Mountpoint": "/var/lib/docker/volumes/tardis"
    }
@y
    {
      "Name": "tardis",
      "Driver": "local",
      "Mountpoint": "/var/lib/docker/volumes/tardis"
    }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **404** - no such volume
-   **500** - server error
@y
-   **200** - no error
-   **404** - no such volume
-   **500** - server error
@z

@x
#### Remove a volume
@y
#### Remove a volume
@z

@x
`DELETE /volumes/(name)`
@y
`DELETE /volumes/(name)`
@z

@x
Instruct the driver to remove the volume (`name`).
@y
Instruct the driver to remove the volume (`name`).
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    DELETE /v1.21/volumes/tardis HTTP/1.1
@y
    DELETE /v1.21/volumes/tardis HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 204 No Content
@y
    HTTP/1.1 204 No Content
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **204** - no error
-   **404** - no such volume or volume driver
-   **409** - volume is in use and cannot be removed
-   **500** - server error
@y
-   **204** - no error
-   **404** - no such volume or volume driver
-   **409** - volume is in use and cannot be removed
-   **500** - server error
@z

@x
### 2.5 Networks
@y
### 2.5 Networks
@z

@x
#### List networks
@y
#### List networks
@z

@x
`GET /networks`
@y
`GET /networks`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/networks HTTP/1.1
@y
    GET /v1.21/networks HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
```
HTTP/1.1 200 OK
Content-Type: application/json
@y
```
HTTP/1.1 200 OK
Content-Type: application/json
@z

@x
[
  {
    "Name": "bridge",
    "Id": "f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566",
    "Scope": "local",
    "Driver": "bridge",
    "IPAM": {
      "Driver": "default",
      "Config": [
        {
          "Subnet": "172.17.0.0/16"
        }
      ]
    },
    "Containers": {
      "39b69226f9d79f5634485fb236a23b2fe4e96a0a94128390a7fbbcc167065867": {
        "EndpointID": "ed2419a97c1d9954d05b46e462e7002ea552f216e9b136b80a7db8d98b442eda",
        "MacAddress": "02:42:ac:11:00:02",
        "IPv4Address": "172.17.0.2/16",
        "IPv6Address": ""
      }
    },
    "Options": {
      "com.docker.network.bridge.default_bridge": "true",
      "com.docker.network.bridge.enable_icc": "true",
      "com.docker.network.bridge.enable_ip_masquerade": "true",
      "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
      "com.docker.network.bridge.name": "docker0",
      "com.docker.network.driver.mtu": "1500"
    }
  },
  {
    "Name": "none",
    "Id": "e086a3893b05ab69242d3c44e49483a3bbbd3a26b46baa8f61ab797c1088d794",
    "Scope": "local",
    "Driver": "null",
    "IPAM": {
      "Driver": "default",
      "Config": []
    },
    "Containers": {},
    "Options": {}
  },
  {
    "Name": "host",
    "Id": "13e871235c677f196c4e1ecebb9dc733b9b2d2ab589e30c539efeda84a24215e",
    "Scope": "local",
    "Driver": "host",
    "IPAM": {
      "Driver": "default",
      "Config": []
    },
    "Containers": {},
    "Options": {}
  }
]
```
@y
[
  {
    "Name": "bridge",
    "Id": "f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566",
    "Scope": "local",
    "Driver": "bridge",
    "IPAM": {
      "Driver": "default",
      "Config": [
        {
          "Subnet": "172.17.0.0/16"
        }
      ]
    },
    "Containers": {
      "39b69226f9d79f5634485fb236a23b2fe4e96a0a94128390a7fbbcc167065867": {
        "EndpointID": "ed2419a97c1d9954d05b46e462e7002ea552f216e9b136b80a7db8d98b442eda",
        "MacAddress": "02:42:ac:11:00:02",
        "IPv4Address": "172.17.0.2/16",
        "IPv6Address": ""
      }
    },
    "Options": {
      "com.docker.network.bridge.default_bridge": "true",
      "com.docker.network.bridge.enable_icc": "true",
      "com.docker.network.bridge.enable_ip_masquerade": "true",
      "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
      "com.docker.network.bridge.name": "docker0",
      "com.docker.network.driver.mtu": "1500"
    }
  },
  {
    "Name": "none",
    "Id": "e086a3893b05ab69242d3c44e49483a3bbbd3a26b46baa8f61ab797c1088d794",
    "Scope": "local",
    "Driver": "null",
    "IPAM": {
      "Driver": "default",
      "Config": []
    },
    "Containers": {},
    "Options": {}
  },
  {
    "Name": "host",
    "Id": "13e871235c677f196c4e1ecebb9dc733b9b2d2ab589e30c539efeda84a24215e",
    "Scope": "local",
    "Driver": "host",
    "IPAM": {
      "Driver": "default",
      "Config": []
    },
    "Containers": {},
    "Options": {}
  }
]
```
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the networks list. Available filters: `name=[network-names]` , `id=[network-ids]`
@y
- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the networks list. Available filters: `name=[network-names]` , `id=[network-ids]`
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **500** - server error
@y
-   **200** - no error
-   **500** - server error
@z

@x
#### Inspect network
@y
#### Inspect network
@z

@x
`GET /networks/(id or name)`
@y
`GET /networks/(id or name)`
@z

@x
Return low-level information on the network `id`
@y
Return low-level information on the network `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.21/networks/f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566 HTTP/1.1
@y
    GET /v1.21/networks/f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
```
HTTP/1.1 200 OK
Content-Type: application/json
@y
```
HTTP/1.1 200 OK
Content-Type: application/json
@z

@x
{
  "Name": "bridge",
  "Id": "f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566",
  "Scope": "local",
  "Driver": "bridge",
  "IPAM": {
    "Driver": "default",
    "Config": [
      {
        "Subnet": "172.17.0.0/16"
      }
    ]
  },
  "Containers": {
    "39b69226f9d79f5634485fb236a23b2fe4e96a0a94128390a7fbbcc167065867": {
      "EndpointID": "ed2419a97c1d9954d05b46e462e7002ea552f216e9b136b80a7db8d98b442eda",
      "MacAddress": "02:42:ac:11:00:02",
      "IPv4Address": "172.17.0.2/16",
      "IPv6Address": ""
    }
  },
  "Options": {
    "com.docker.network.bridge.default_bridge": "true",
    "com.docker.network.bridge.enable_icc": "true",
    "com.docker.network.bridge.enable_ip_masquerade": "true",
    "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
    "com.docker.network.bridge.name": "docker0",
    "com.docker.network.driver.mtu": "1500"
  }
}
```
@y
{
  "Name": "bridge",
  "Id": "f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566",
  "Scope": "local",
  "Driver": "bridge",
  "IPAM": {
    "Driver": "default",
    "Config": [
      {
        "Subnet": "172.17.0.0/16"
      }
    ]
  },
  "Containers": {
    "39b69226f9d79f5634485fb236a23b2fe4e96a0a94128390a7fbbcc167065867": {
      "EndpointID": "ed2419a97c1d9954d05b46e462e7002ea552f216e9b136b80a7db8d98b442eda",
      "MacAddress": "02:42:ac:11:00:02",
      "IPv4Address": "172.17.0.2/16",
      "IPv6Address": ""
    }
  },
  "Options": {
    "com.docker.network.bridge.default_bridge": "true",
    "com.docker.network.bridge.enable_icc": "true",
    "com.docker.network.bridge.enable_ip_masquerade": "true",
    "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
    "com.docker.network.bridge.name": "docker0",
    "com.docker.network.driver.mtu": "1500"
  }
}
```
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **404** - network not found
-   **500** - server error
@y
-   **200** - no error
-   **404** - network not found
-   **500** - server error
@z

@x
#### Create a network
@y
#### Create a network
@z

@x
`POST /networks/create`
@y
`POST /networks/create`
@z

@x
Create a network
@y
Create a network
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
POST /v1.21/networks/create HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@y
```
POST /v1.21/networks/create HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@z

@x
{
  "Name":"isolated_nw",
  "CheckDuplicate":true,
  "Driver":"bridge",
  "IPAM":{
    "Driver": "default",
    "Config":[
      {
        "Subnet":"172.20.0.0/16",
        "IPRange":"172.20.10.0/24",
        "Gateway":"172.20.10.11"
      }
    ]
  }
}
```
@y
{
  "Name":"isolated_nw",
  "CheckDuplicate":true,
  "Driver":"bridge",
  "IPAM":{
    "Driver": "default",
    "Config":[
      {
        "Subnet":"172.20.0.0/16",
        "IPRange":"172.20.10.0/24",
        "Gateway":"172.20.10.11"
      }
    ]
  }
}
```
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
```
HTTP/1.1 201 Created
Content-Type: application/json
@y
```
HTTP/1.1 201 Created
Content-Type: application/json
@z

@x
{
  "Id": "22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30",
  "Warning": ""
}
```
@y
{
  "Id": "22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30",
  "Warning": ""
}
```
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
- **201** - no error
- **404** - plugin not found
- **500** - server error
@y
- **201** - no error
- **404** - plugin not found
- **500** - server error
@z

@x
**JSON parameters**:
@y
**JSON parameters**:
@z

@x
- **Name** - The new network's name. this is a mandatory field
- **CheckDuplicate** - Requests daemon to check for networks with same name. Defaults to `false`.
    Since Network is primarily keyed based on a random ID and not on the name, 
    and network name is strictly a user-friendly alias to the network which is uniquely identified using ID, 
    there is no guaranteed way to check for duplicates across a cluster of docker hosts. 
    This parameter CheckDuplicate is there to provide a best effort checking of any networks 
    which has the same name but it is not guaranteed to catch all name collisions.
- **Driver** - Name of the network driver plugin to use. Defaults to `bridge` driver
- **IPAM** - Optional custom IP scheme for the network
  - **Driver** - Name of the IPAM driver to use. Defaults to `default` driver
  - **Config** - List of IPAM configuration options, specified as a map:
      `{"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}`
- **Options** - Network specific options to be used by the drivers
@y
- **Name** - The new network's name. this is a mandatory field
- **CheckDuplicate** - Requests daemon to check for networks with same name. Defaults to `false`.
    Since Network is primarily keyed based on a random ID and not on the name, 
    and network name is strictly a user-friendly alias to the network which is uniquely identified using ID, 
    there is no guaranteed way to check for duplicates across a cluster of docker hosts. 
    This parameter CheckDuplicate is there to provide a best effort checking of any networks 
    which has the same name but it is not guaranteed to catch all name collisions.
- **Driver** - Name of the network driver plugin to use. Defaults to `bridge` driver
- **IPAM** - Optional custom IP scheme for the network
  - **Driver** - Name of the IPAM driver to use. Defaults to `default` driver
  - **Config** - List of IPAM configuration options, specified as a map:
      `{"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}`
- **Options** - Network specific options to be used by the drivers
@z

@x
#### Connect a container to a network
@y
#### Connect a container to a network
@z

@x
`POST /networks/(id or name)/connect`
@y
`POST /networks/(id or name)/connect`
@z

@x
Connect a container to a network
@y
Connect a container to a network
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
POST /v1.21/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/connect HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@y
```
POST /v1.21/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/connect HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@z

@x
{
  "Container":"3613f73ba0e4"
}
```
@y
{
  "Container":"3613f73ba0e4"
}
```
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
@y
    HTTP/1.1 200 OK
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
- **200** - no error
- **404** - network or container is not found
- **500** - Internal Server Error
@y
- **200** - no error
- **404** - network or container is not found
- **500** - Internal Server Error
@z

@x
**JSON parameters**:
@y
**JSON parameters**:
@z

@x
- **container** - container-id/name to be connected to the network
@y
- **container** - container-id/name to be connected to the network
@z

@x
#### Disconnect a container from a network
@y
#### Disconnect a container from a network
@z

@x
`POST /networks/(id or name)/disconnect`
@y
`POST /networks/(id or name)/disconnect`
@z

@x
Disconnect a container from a network
@y
Disconnect a container from a network
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
POST /v1.21/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/disconnect HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@y
```
POST /v1.21/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/disconnect HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@z

@x
{
  "Container":"3613f73ba0e4"
}
```
@y
{
  "Container":"3613f73ba0e4"
}
```
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
@y
    HTTP/1.1 200 OK
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
- **200** - no error
- **404** - network or container not found
- **500** - Internal Server Error
@y
- **200** - no error
- **404** - network or container not found
- **500** - Internal Server Error
@z

@x
**JSON parameters**:
@y
**JSON parameters**:
@z

@x
- **Container** - container-id/name to be disconnected from a network
@y
- **Container** - container-id/name to be disconnected from a network
@z

@x
#### Remove a network
@y
#### Remove a network
@z

@x
`DELETE /networks/(id or name)`
@y
`DELETE /networks/(id or name)`
@z

@x
Instruct the driver to remove the network (`id`).
@y
Instruct the driver to remove the network (`id`).
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    DELETE /v1.21/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30 HTTP/1.1
@y
    DELETE /v1.21/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
@y
    HTTP/1.1 200 OK
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **403** - operation not supported for pre-defined networks
-   **404** - no such network
-   **500** - server error
@y
-   **200** - no error
-   **403** - operation not supported for pre-defined networks
-   **404** - no such network
-   **500** - server error
@z

@x
## 3. Going further
@y
## 3. Going further
@z

@x
### 3.1 Inside `docker run`
@y
### 3.1 Inside `docker run`
@z

@x
As an example, the `docker run` command line makes the following API calls:
@y
As an example, the `docker run` command line makes the following API calls:
@z

@x
- Create the container
@y
- Create the container
@z

@x
- If the status code is 404, it means the image doesn't exist:
    - Try to pull it.
    - Then, retry to create the container.
@y
- If the status code is 404, it means the image doesn't exist:
    - Try to pull it.
    - Then, retry to create the container.
@z

@x
- Start the container.
@y
- Start the container.
@z

@x
- If you are not in detached mode:
- Attach to the container, using `logs=1` (to have `stdout` and
      `stderr` from the container's start) and `stream=1`
@y
- If you are not in detached mode:
- Attach to the container, using `logs=1` (to have `stdout` and
      `stderr` from the container's start) and `stream=1`
@z

@x
- If in detached mode or only `stdin` is attached, display the container's id.
@y
- If in detached mode or only `stdin` is attached, display the container's id.
@z

@x
### 3.2 Hijacking
@y
### 3.2 Hijacking
@z

@x
In this version of the API, `/attach`, uses hijacking to transport `stdin`,
`stdout`, and `stderr` on the same socket.
@y
In this version of the API, `/attach`, uses hijacking to transport `stdin`,
`stdout`, and `stderr` on the same socket.
@z

@x
To hint potential proxies about connection hijacking, Docker client sends
connection upgrade headers similarly to websocket.
@y
To hint potential proxies about connection hijacking, Docker client sends
connection upgrade headers similarly to websocket.
@z

@x
    Upgrade: tcp
    Connection: Upgrade
@y
    Upgrade: tcp
    Connection: Upgrade
@z

@x
When Docker daemon detects the `Upgrade` header, it switches its status code
from **200 OK** to **101 UPGRADED** and resends the same headers.
@y
When Docker daemon detects the `Upgrade` header, it switches its status code
from **200 OK** to **101 UPGRADED** and resends the same headers.
@z

@x
### 3.3 CORS Requests
@y
### 3.3 CORS Requests
@z

@x
To set cross origin requests to the Engine API please give values to
`--api-cors-header` when running Docker in daemon mode. Set * (asterisk) allows all,
default or blank means CORS disabled
@y
To set cross origin requests to the Engine API please give values to
`--api-cors-header` when running Docker in daemon mode. Set * (asterisk) allows all,
default or blank means CORS disabled
@z

@x
    $ dockerd -H="192.168.1.9:2375" --api-cors-header="http://foo.bar"
@y
    $ dockerd -H="192.168.1.9:2375" --api-cors-header="http://foo.bar"
@z
