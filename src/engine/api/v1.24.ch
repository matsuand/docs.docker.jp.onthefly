%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Engine API v1.24"
description: "API Documentation for Docker"
keywords: "API, Docker, rcli, REST, documentation"
redirect_from:
- /engine/reference/api/docker_remote_api_v1.24/
- /reference/api/docker_remote_api_v1.24/
---
@y
---
title: "Engine API v1.24"
description: "API Documentation for Docker"
keywords: "API, Docker, rcli, REST, documentation"
redirect_from:
- /engine/reference/api/docker_remote_api_v1.24/
- /reference/api/docker_remote_api_v1.24/
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
## 2. Errors
@y
## 2. Errors
@z

@x
The Engine API uses standard HTTP status codes to indicate the success or failure of the API call. The body of the response will be JSON in the following format:
@y
The Engine API uses standard HTTP status codes to indicate the success or failure of the API call. The body of the response will be JSON in the following format:
@z

@x
    {
        "message": "page not found"
    }
@y
    {
        "message": "page not found"
    }
@z

@x
The status codes that are returned for each endpoint are specified in the endpoint documentation below.
@y
The status codes that are returned for each endpoint are specified in the endpoint documentation below.
@z

@x
## 3. Endpoints
@y
## 3. Endpoints
@z

@x
### 3.1 Containers
@y
### 3.1 Containers
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
    GET /v1.24/containers/json?all=1&before=8dfafdbc3a40&size=1 HTTP/1.1
@y
    GET /v1.24/containers/json?all=1&before=8dfafdbc3a40&size=1 HTTP/1.1
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
                 "State": "exited",
                 "Status": "Exit 0",
                 "Ports": [{"PrivatePort": 2222, "PublicPort": 3333, "Type": "tcp"}],
                 "Labels": {
                         "com.example.vendor": "Acme",
                         "com.example.license": "GPL",
                         "com.example.version": "1.0"
                 },
                 "SizeRw": 12288,
                 "SizeRootFs": 0,
                 "HostConfig": {
                         "NetworkMode": "default"
                 },
                 "NetworkSettings": {
                         "Networks": {
                                 "bridge": {
                                          "IPAMConfig": null,
                                          "Links": null,
                                          "Aliases": null,
                                          "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                                          "EndpointID": "2cdc4edb1ded3631c81f57966563e5c8525b81121bb3706a9a9a3ae102711f3f",
                                          "Gateway": "172.17.0.1",
                                          "IPAddress": "172.17.0.2",
                                          "IPPrefixLen": 16,
                                          "IPv6Gateway": "",
                                          "GlobalIPv6Address": "",
                                          "GlobalIPv6PrefixLen": 0,
                                          "MacAddress": "02:42:ac:11:00:02"
                                  }
                         }
                 },
                 "Mounts": [
                         {
                                  "Name": "fac362...80535",
                                  "Source": "/data",
                                  "Destination": "/data",
                                  "Driver": "local",
                                  "Mode": "ro,Z",
                                  "RW": false,
                                  "Propagation": ""
                         }
                 ]
         },
         {
                 "Id": "9cd87474be90",
                 "Names":["/coolName"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 222222",
                 "Created": 1367854155,
                 "State": "exited",
                 "Status": "Exit 0",
                 "Ports": [],
                 "Labels": {},
                 "SizeRw": 12288,
                 "SizeRootFs": 0,
                 "HostConfig": {
                         "NetworkMode": "default"
                 },
                 "NetworkSettings": {
                         "Networks": {
                                 "bridge": {
                                          "IPAMConfig": null,
                                          "Links": null,
                                          "Aliases": null,
                                          "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                                          "EndpointID": "88eaed7b37b38c2a3f0c4bc796494fdf51b270c2d22656412a2ca5d559a64d7a",
                                          "Gateway": "172.17.0.1",
                                          "IPAddress": "172.17.0.8",
                                          "IPPrefixLen": 16,
                                          "IPv6Gateway": "",
                                          "GlobalIPv6Address": "",
                                          "GlobalIPv6PrefixLen": 0,
                                          "MacAddress": "02:42:ac:11:00:08"
                                  }
                         }
                 },
                 "Mounts": []
         },
         {
                 "Id": "3176a2479c92",
                 "Names":["/sleepy_dog"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 3333333333333333",
                 "Created": 1367854154,
                 "State": "exited",
                 "Status": "Exit 0",
                 "Ports":[],
                 "Labels": {},
                 "SizeRw":12288,
                 "SizeRootFs":0,
                 "HostConfig": {
                         "NetworkMode": "default"
                 },
                 "NetworkSettings": {
                         "Networks": {
                                 "bridge": {
                                          "IPAMConfig": null,
                                          "Links": null,
                                          "Aliases": null,
                                          "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                                          "EndpointID": "8b27c041c30326d59cd6e6f510d4f8d1d570a228466f956edf7815508f78e30d",
                                          "Gateway": "172.17.0.1",
                                          "IPAddress": "172.17.0.6",
                                          "IPPrefixLen": 16,
                                          "IPv6Gateway": "",
                                          "GlobalIPv6Address": "",
                                          "GlobalIPv6PrefixLen": 0,
                                          "MacAddress": "02:42:ac:11:00:06"
                                  }
                         }
                 },
                 "Mounts": []
         },
         {
                 "Id": "4cb07b47f9fb",
                 "Names":["/running_cat"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 444444444444444444444444444444444",
                 "Created": 1367854152,
                 "State": "exited",
                 "Status": "Exit 0",
                 "Ports": [],
                 "Labels": {},
                 "SizeRw": 12288,
                 "SizeRootFs": 0,
                 "HostConfig": {
                         "NetworkMode": "default"
                 },
                 "NetworkSettings": {
                         "Networks": {
                                 "bridge": {
                                          "IPAMConfig": null,
                                          "Links": null,
                                          "Aliases": null,
                                          "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                                          "EndpointID": "d91c7b2f0644403d7ef3095985ea0e2370325cd2332ff3a3225c4247328e66e9",
                                          "Gateway": "172.17.0.1",
                                          "IPAddress": "172.17.0.5",
                                          "IPPrefixLen": 16,
                                          "IPv6Gateway": "",
                                          "GlobalIPv6Address": "",
                                          "GlobalIPv6PrefixLen": 0,
                                          "MacAddress": "02:42:ac:11:00:05"
                                  }
                         }
                 },
                 "Mounts": []
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
                 "State": "exited",
                 "Status": "Exit 0",
                 "Ports": [{"PrivatePort": 2222, "PublicPort": 3333, "Type": "tcp"}],
                 "Labels": {
                         "com.example.vendor": "Acme",
                         "com.example.license": "GPL",
                         "com.example.version": "1.0"
                 },
                 "SizeRw": 12288,
                 "SizeRootFs": 0,
                 "HostConfig": {
                         "NetworkMode": "default"
                 },
                 "NetworkSettings": {
                         "Networks": {
                                 "bridge": {
                                          "IPAMConfig": null,
                                          "Links": null,
                                          "Aliases": null,
                                          "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                                          "EndpointID": "2cdc4edb1ded3631c81f57966563e5c8525b81121bb3706a9a9a3ae102711f3f",
                                          "Gateway": "172.17.0.1",
                                          "IPAddress": "172.17.0.2",
                                          "IPPrefixLen": 16,
                                          "IPv6Gateway": "",
                                          "GlobalIPv6Address": "",
                                          "GlobalIPv6PrefixLen": 0,
                                          "MacAddress": "02:42:ac:11:00:02"
                                  }
                         }
                 },
                 "Mounts": [
                         {
                                  "Name": "fac362...80535",
                                  "Source": "/data",
                                  "Destination": "/data",
                                  "Driver": "local",
                                  "Mode": "ro,Z",
                                  "RW": false,
                                  "Propagation": ""
                         }
                 ]
         },
         {
                 "Id": "9cd87474be90",
                 "Names":["/coolName"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 222222",
                 "Created": 1367854155,
                 "State": "exited",
                 "Status": "Exit 0",
                 "Ports": [],
                 "Labels": {},
                 "SizeRw": 12288,
                 "SizeRootFs": 0,
                 "HostConfig": {
                         "NetworkMode": "default"
                 },
                 "NetworkSettings": {
                         "Networks": {
                                 "bridge": {
                                          "IPAMConfig": null,
                                          "Links": null,
                                          "Aliases": null,
                                          "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                                          "EndpointID": "88eaed7b37b38c2a3f0c4bc796494fdf51b270c2d22656412a2ca5d559a64d7a",
                                          "Gateway": "172.17.0.1",
                                          "IPAddress": "172.17.0.8",
                                          "IPPrefixLen": 16,
                                          "IPv6Gateway": "",
                                          "GlobalIPv6Address": "",
                                          "GlobalIPv6PrefixLen": 0,
                                          "MacAddress": "02:42:ac:11:00:08"
                                  }
                         }
                 },
                 "Mounts": []
         },
         {
                 "Id": "3176a2479c92",
                 "Names":["/sleepy_dog"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 3333333333333333",
                 "Created": 1367854154,
                 "State": "exited",
                 "Status": "Exit 0",
                 "Ports":[],
                 "Labels": {},
                 "SizeRw":12288,
                 "SizeRootFs":0,
                 "HostConfig": {
                         "NetworkMode": "default"
                 },
                 "NetworkSettings": {
                         "Networks": {
                                 "bridge": {
                                          "IPAMConfig": null,
                                          "Links": null,
                                          "Aliases": null,
                                          "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                                          "EndpointID": "8b27c041c30326d59cd6e6f510d4f8d1d570a228466f956edf7815508f78e30d",
                                          "Gateway": "172.17.0.1",
                                          "IPAddress": "172.17.0.6",
                                          "IPPrefixLen": 16,
                                          "IPv6Gateway": "",
                                          "GlobalIPv6Address": "",
                                          "GlobalIPv6PrefixLen": 0,
                                          "MacAddress": "02:42:ac:11:00:06"
                                  }
                         }
                 },
                 "Mounts": []
         },
         {
                 "Id": "4cb07b47f9fb",
                 "Names":["/running_cat"],
                 "Image": "ubuntu:latest",
                 "ImageID": "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82",
                 "Command": "echo 444444444444444444444444444444444",
                 "Created": 1367854152,
                 "State": "exited",
                 "Status": "Exit 0",
                 "Ports": [],
                 "Labels": {},
                 "SizeRw": 12288,
                 "SizeRootFs": 0,
                 "HostConfig": {
                         "NetworkMode": "default"
                 },
                 "NetworkSettings": {
                         "Networks": {
                                 "bridge": {
                                          "IPAMConfig": null,
                                          "Links": null,
                                          "Aliases": null,
                                          "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                                          "EndpointID": "d91c7b2f0644403d7ef3095985ea0e2370325cd2332ff3a3225c4247328e66e9",
                                          "Gateway": "172.17.0.1",
                                          "IPAddress": "172.17.0.5",
                                          "IPPrefixLen": 16,
                                          "IPv6Gateway": "",
                                          "GlobalIPv6Address": "",
                                          "GlobalIPv6PrefixLen": 0,
                                          "MacAddress": "02:42:ac:11:00:05"
                                  }
                         }
                 },
                 "Mounts": []
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
  -   `status=`(`created`|`restarting`|`running`|`paused`|`exited`|`dead`)
  -   `label=key` or `label="key=value"` of a container label
  -   `isolation=`(`default`|`process`|`hyperv`)   (Windows daemon only)
  -   `ancestor`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
  -   `before`=(`<container id>` or `<container name>`)
  -   `since`=(`<container id>` or `<container name>`)
  -   `volume`=(`<volume name>` or `<mount point destination>`)
  -   `network`=(`<network id>` or `<network name>`)
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
  -   `status=`(`created`|`restarting`|`running`|`paused`|`exited`|`dead`)
  -   `label=key` or `label="key=value"` of a container label
  -   `isolation=`(`default`|`process`|`hyperv`)   (Windows daemon only)
  -   `ancestor`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
  -   `before`=(`<container id>` or `<container name>`)
  -   `since`=(`<container id>` or `<container name>`)
  -   `volume`=(`<volume name>` or `<mount point destination>`)
  -   `network`=(`<network id>` or `<network name>`)
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
    POST /v1.24/containers/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/containers/create HTTP/1.1
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
           "Entrypoint": "",
           "Image": "ubuntu",
           "Labels": {
                   "com.example.vendor": "Acme",
                   "com.example.license": "GPL",
                   "com.example.version": "1.0"
           },
           "Volumes": {
             "/volumes/data": {}
           },
           "Healthcheck":{
              "Test": ["CMD-SHELL", "curl localhost:3000"],
              "Interval": 1000000000,
              "Timeout": 10000000000,
              "Retries": 10,
              "StartPeriod": 60000000000
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
             "Tmpfs": { "/run": "rw,noexec,nosuid,size=65536k" },
             "Links": ["redis3:redis"],
             "Memory": 0,
             "MemorySwap": 0,
             "MemoryReservation": 0,
             "KernelMemory": 0,
             "CpuPercent": 80,
             "CpuShares": 512,
             "CpuPeriod": 100000,
             "CpuQuota": 50000,
             "CpusetCpus": "0,1",
             "CpusetMems": "0,1",
             "IOMaximumBandwidth": 0,
             "IOMaximumIOps": 0,
             "BlkioWeight": 300,
             "BlkioWeightDevice": [{}],
             "BlkioDeviceReadBps": [{}],
             "BlkioDeviceReadIOps": [{}],
             "BlkioDeviceWriteBps": [{}],
             "BlkioDeviceWriteIOps": [{}],
             "MemorySwappiness": 60,
             "OomKillDisable": false,
             "OomScoreAdj": 500,
             "PidMode": "",
             "PidsLimit": -1,
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
             "Sysctls": { "net.ipv4.ip_forward": "1" },
             "Ulimits": [{}],
             "LogConfig": { "Type": "json-file", "Config": {} },
             "SecurityOpt": [],
             "StorageOpt": {},
             "CgroupParent": "",
             "VolumeDriver": "",
             "ShmSize": 67108864
          },
          "NetworkingConfig": {
              "EndpointsConfig": {
                  "isolated_nw" : {
                      "IPAMConfig": {
                          "IPv4Address":"172.20.30.33",
                          "IPv6Address":"2001:db8:abcd::3033",
                          "LinkLocalIPs":["169.254.34.68", "fe80::3468"]
                      },
                      "Links":["container_1", "container_2"],
                      "Aliases":["server_x", "server_y"]
                  }
              }
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
           "Entrypoint": "",
           "Image": "ubuntu",
           "Labels": {
                   "com.example.vendor": "Acme",
                   "com.example.license": "GPL",
                   "com.example.version": "1.0"
           },
           "Volumes": {
             "/volumes/data": {}
           },
           "Healthcheck":{
              "Test": ["CMD-SHELL", "curl localhost:3000"],
              "Interval": 1000000000,
              "Timeout": 10000000000,
              "Retries": 10,
              "StartPeriod": 60000000000
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
             "Tmpfs": { "/run": "rw,noexec,nosuid,size=65536k" },
             "Links": ["redis3:redis"],
             "Memory": 0,
             "MemorySwap": 0,
             "MemoryReservation": 0,
             "KernelMemory": 0,
             "CpuPercent": 80,
             "CpuShares": 512,
             "CpuPeriod": 100000,
             "CpuQuota": 50000,
             "CpusetCpus": "0,1",
             "CpusetMems": "0,1",
             "IOMaximumBandwidth": 0,
             "IOMaximumIOps": 0,
             "BlkioWeight": 300,
             "BlkioWeightDevice": [{}],
             "BlkioDeviceReadBps": [{}],
             "BlkioDeviceReadIOps": [{}],
             "BlkioDeviceWriteBps": [{}],
             "BlkioDeviceWriteIOps": [{}],
             "MemorySwappiness": 60,
             "OomKillDisable": false,
             "OomScoreAdj": 500,
             "PidMode": "",
             "PidsLimit": -1,
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
             "Sysctls": { "net.ipv4.ip_forward": "1" },
             "Ulimits": [{}],
             "LogConfig": { "Type": "json-file", "Config": {} },
             "SecurityOpt": [],
             "StorageOpt": {},
             "CgroupParent": "",
             "VolumeDriver": "",
             "ShmSize": 67108864
          },
          "NetworkingConfig": {
              "EndpointsConfig": {
                  "isolated_nw" : {
                      "IPAMConfig": {
                          "IPv4Address":"172.20.30.33",
                          "IPv6Address":"2001:db8:abcd::3033",
                          "LinkLocalIPs":["169.254.34.68", "fe80::3468"]
                      },
                      "Links":["container_1", "container_2"],
                      "Aliases":["server_x", "server_y"]
                  }
              }
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
      container. This must be a valid RFC 1123 hostname.
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
-   **Healthcheck** - A test to perform to check that the container is healthy.
    -     **Test** - The test to perform. Possible values are:
              + `{}` inherit healthcheck from image or parent image
              + `{"NONE"}` disable healthcheck
              + `{"CMD", args...}` exec arguments directly
              + `{"CMD-SHELL", command}` run command with system's default shell
    -     **Interval** - The time to wait between checks in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means inherit.
    -     **Timeout** - The time to wait before considering the check to have hung. It should be 0 or at least 1000000 (1 ms). 0 means inherit.
    -     **Retries** - The number of consecutive failures needed to consider a container as unhealthy. 0 means inherit.
    -     **StartPeriod** - The time to wait for container initialization before starting health-retries countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means inherit.
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
    -   **Tmpfs** – A map of container directories which should be replaced by tmpfs mounts, and their corresponding
          mount options. A JSON object in the form `{ "/run": "rw,noexec,nosuid,size=65536k" }`.
    -   **Links** - A list of links for the container. Each link entry should be
          in the form of `container_name:alias`.
    -   **Memory** - Memory limit in bytes.
    -   **MemorySwap** - Total memory limit (memory + swap); set `-1` to enable unlimited swap.
          You must use this with `memory` and make the swap value larger than `memory`.
    -   **MemoryReservation** - Memory soft limit in bytes.
    -   **KernelMemory** - Kernel memory limit in bytes.
    -   **CpuPercent** - An integer value containing the usable percentage of the available CPUs. (Windows daemon only)
    -   **CpuShares** - An integer value containing the container's CPU Shares
          (ie. the relative weight vs other containers).
    -   **CpuPeriod** - The length of a CPU period in microseconds.
    -   **CpuQuota** - Microseconds of CPU time that the container can get in a CPU period.
    -   **CpusetCpus** - String value containing the `cgroups CpusetCpus` to use.
    -   **CpusetMems** - Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on NUMA systems.
    -   **IOMaximumBandwidth** - Maximum IO absolute rate in terms of IOps.
    -   **IOMaximumIOps** - Maximum IO absolute rate in terms of bytes per second.
    -   **BlkioWeight** - Block IO weight (relative weight) accepts a weight value between 10 and 1000.
    -   **BlkioWeightDevice** - Block IO weight (relative device weight) in the form of:        `"BlkioWeightDevice": [{"Path": "device_path", "Weight": weight}]`
    -   **BlkioDeviceReadBps** - Limit read rate (bytes per second) from a device in the form of:	`"BlkioDeviceReadBps": [{"Path": "device_path", "Rate": rate}]`, for example:
        `"BlkioDeviceReadBps": [{"Path": "/dev/sda", "Rate": "1024"}]"`
    -   **BlkioDeviceWriteBps** - Limit write rate (bytes per second) to a device in the form of:	`"BlkioDeviceWriteBps": [{"Path": "device_path", "Rate": rate}]`, for example:
        `"BlkioDeviceWriteBps": [{"Path": "/dev/sda", "Rate": "1024"}]"`
    -   **BlkioDeviceReadIOps** - Limit read rate (IO per second) from a device in the form of:	`"BlkioDeviceReadIOps": [{"Path": "device_path", "Rate": rate}]`, for example:
        `"BlkioDeviceReadIOps": [{"Path": "/dev/sda", "Rate": "1000"}]`
    -   **BlkioDeviceWriteIOps** - Limit write rate (IO per second) to a device in the form of:	`"BlkioDeviceWriteIOps": [{"Path": "device_path", "Rate": rate}]`, for example:
        `"BlkioDeviceWriteIOps": [{"Path": "/dev/sda", "Rate": "1000"}]`
    -   **MemorySwappiness** - Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100.
    -   **OomKillDisable** - Boolean value, whether to disable OOM Killer for the container or not.
    -   **OomScoreAdj** - An integer value containing the score given to the container in order to tune OOM killer preferences.
    -   **PidMode** - Set the PID (Process) Namespace mode for the container;
          `"container:<name|id>"`: joins another container's PID namespace
          `"host"`: use the host's PID namespace inside the container
    -   **PidsLimit** - Tune a container's pids limit. Set -1 for unlimited.
    -   **PortBindings** - A map of exposed container ports and the host port they
          should map to. A JSON object in the form
          `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
          Take note that `port` is specified as a string and not an integer value.
    -   **PublishAllPorts** - Allocates an ephemeral host port for all of a container's
          exposed ports. Specified as a boolean value.
@y
-   **Hostname** - A string value containing the hostname to use for the
      container. This must be a valid RFC 1123 hostname.
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
-   **Healthcheck** - A test to perform to check that the container is healthy.
    -     **Test** - The test to perform. Possible values are:
              + `{}` inherit healthcheck from image or parent image
              + `{"NONE"}` disable healthcheck
              + `{"CMD", args...}` exec arguments directly
              + `{"CMD-SHELL", command}` run command with system's default shell
    -     **Interval** - The time to wait between checks in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means inherit.
    -     **Timeout** - The time to wait before considering the check to have hung. It should be 0 or at least 1000000 (1 ms). 0 means inherit.
    -     **Retries** - The number of consecutive failures needed to consider a container as unhealthy. 0 means inherit.
    -     **StartPeriod** - The time to wait for container initialization before starting health-retries countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means inherit.
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
    -   **Tmpfs** – A map of container directories which should be replaced by tmpfs mounts, and their corresponding
          mount options. A JSON object in the form `{ "/run": "rw,noexec,nosuid,size=65536k" }`.
    -   **Links** - A list of links for the container. Each link entry should be
          in the form of `container_name:alias`.
    -   **Memory** - Memory limit in bytes.
    -   **MemorySwap** - Total memory limit (memory + swap); set `-1` to enable unlimited swap.
          You must use this with `memory` and make the swap value larger than `memory`.
    -   **MemoryReservation** - Memory soft limit in bytes.
    -   **KernelMemory** - Kernel memory limit in bytes.
    -   **CpuPercent** - An integer value containing the usable percentage of the available CPUs. (Windows daemon only)
    -   **CpuShares** - An integer value containing the container's CPU Shares
          (ie. the relative weight vs other containers).
    -   **CpuPeriod** - The length of a CPU period in microseconds.
    -   **CpuQuota** - Microseconds of CPU time that the container can get in a CPU period.
    -   **CpusetCpus** - String value containing the `cgroups CpusetCpus` to use.
    -   **CpusetMems** - Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on NUMA systems.
    -   **IOMaximumBandwidth** - Maximum IO absolute rate in terms of IOps.
    -   **IOMaximumIOps** - Maximum IO absolute rate in terms of bytes per second.
    -   **BlkioWeight** - Block IO weight (relative weight) accepts a weight value between 10 and 1000.
    -   **BlkioWeightDevice** - Block IO weight (relative device weight) in the form of:        `"BlkioWeightDevice": [{"Path": "device_path", "Weight": weight}]`
    -   **BlkioDeviceReadBps** - Limit read rate (bytes per second) from a device in the form of:	`"BlkioDeviceReadBps": [{"Path": "device_path", "Rate": rate}]`, for example:
        `"BlkioDeviceReadBps": [{"Path": "/dev/sda", "Rate": "1024"}]"`
    -   **BlkioDeviceWriteBps** - Limit write rate (bytes per second) to a device in the form of:	`"BlkioDeviceWriteBps": [{"Path": "device_path", "Rate": rate}]`, for example:
        `"BlkioDeviceWriteBps": [{"Path": "/dev/sda", "Rate": "1024"}]"`
    -   **BlkioDeviceReadIOps** - Limit read rate (IO per second) from a device in the form of:	`"BlkioDeviceReadIOps": [{"Path": "device_path", "Rate": rate}]`, for example:
        `"BlkioDeviceReadIOps": [{"Path": "/dev/sda", "Rate": "1000"}]`
    -   **BlkioDeviceWriteIOps** - Limit write rate (IO per second) to a device in the form of:	`"BlkioDeviceWriteIOps": [{"Path": "device_path", "Rate": rate}]`, for example:
        `"BlkioDeviceWriteIOps": [{"Path": "/dev/sda", "Rate": "1000"}]`
    -   **MemorySwappiness** - Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100.
    -   **OomKillDisable** - Boolean value, whether to disable OOM Killer for the container or not.
    -   **OomScoreAdj** - An integer value containing the score given to the container in order to tune OOM killer preferences.
    -   **PidMode** - Set the PID (Process) Namespace mode for the container;
          `"container:<name|id>"`: joins another container's PID namespace
          `"host"`: use the host's PID namespace inside the container
    -   **PidsLimit** - Tune a container's pids limit. Set -1 for unlimited.
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
    -   **UsernsMode**  - Sets the usernamespace mode for the container when usernamespace remapping option is enabled.
           supported values are: `host`.
    -   **NetworkMode** - Sets the networking mode for the container. Supported
          standard values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value is taken
          as a custom network's name to which this container should connect to.
    -   **Devices** - A list of devices to add to the container specified as a JSON object in the
      form
          `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
    -   **Ulimits** - A list of ulimits to set in the container, specified as
          `{ "Name": <name>, "Soft": <soft limit>, "Hard": <hard limit> }`, for example:
          `Ulimits: { "Name": "nofile", "Soft": 1024, "Hard": 2048 }`
    -   **Sysctls** - A list of kernel parameters (sysctls) to set in the container, specified as
          `{ <name>: <Value> }`, for example:
	  `{ "net.ipv4.ip_forward": "1" }`
    -   **SecurityOpt**: A list of string values to customize labels for MLS
        systems, such as SELinux.
    -   **StorageOpt**: Storage driver options per container. Options can be passed in the form
        `{"size":"120G"}`
    -   **LogConfig** - Log configuration for the container, specified as a JSON object in the form
          `{ "Type": "<driver_name>", "Config": {"key1": "val1"}}`.
          Available types: `json-file`, `syslog`, `journald`, `gelf`, `fluentd`, `awslogs`, `splunk`, `etwlogs`, `none`.
          `json-file` logging driver.
    -   **CgroupParent** - Path to `cgroups` under which the container's `cgroup` is created. If the path is not absolute, the path is considered to be relative to the `cgroups` path of the init process. Cgroups are created if they do not already exist.
    -   **VolumeDriver** - Driver that this container users to mount volumes.
    -   **ShmSize** - Size of `/dev/shm` in bytes. The size must be greater than 0.  If omitted the system uses 64MB.
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
    -   **UsernsMode**  - Sets the usernamespace mode for the container when usernamespace remapping option is enabled.
           supported values are: `host`.
    -   **NetworkMode** - Sets the networking mode for the container. Supported
          standard values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value is taken
          as a custom network's name to which this container should connect to.
    -   **Devices** - A list of devices to add to the container specified as a JSON object in the
      form
          `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
    -   **Ulimits** - A list of ulimits to set in the container, specified as
          `{ "Name": <name>, "Soft": <soft limit>, "Hard": <hard limit> }`, for example:
          `Ulimits: { "Name": "nofile", "Soft": 1024, "Hard": 2048 }`
    -   **Sysctls** - A list of kernel parameters (sysctls) to set in the container, specified as
          `{ <name>: <Value> }`, for example:
	  `{ "net.ipv4.ip_forward": "1" }`
    -   **SecurityOpt**: A list of string values to customize labels for MLS
        systems, such as SELinux.
    -   **StorageOpt**: Storage driver options per container. Options can be passed in the form
        `{"size":"120G"}`
    -   **LogConfig** - Log configuration for the container, specified as a JSON object in the form
          `{ "Type": "<driver_name>", "Config": {"key1": "val1"}}`.
          Available types: `json-file`, `syslog`, `journald`, `gelf`, `fluentd`, `awslogs`, `splunk`, `etwlogs`, `none`.
          `json-file` logging driver.
    -   **CgroupParent** - Path to `cgroups` under which the container's `cgroup` is created. If the path is not absolute, the path is considered to be relative to the `cgroups` path of the init process. Cgroups are created if they do not already exist.
    -   **VolumeDriver** - Driver that this container users to mount volumes.
    -   **ShmSize** - Size of `/dev/shm` in bytes. The size must be greater than 0.  If omitted the system uses 64MB.
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
      GET /v1.24/containers/4fa6e0f0c678/json HTTP/1.1
@y
      GET /v1.24/containers/4fa6e0f0c678/json HTTP/1.1
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
			"Volumes": {
				"/volumes/data": {}
			},
			"WorkingDir": "",
			"StopSignal": "SIGTERM"
		},
		"Created": "2015-01-06T15:47:31.485331387Z",
		"Driver": "devicemapper",
		"ExecIDs": null,
		"HostConfig": {
			"Binds": null,
			"IOMaximumBandwidth": 0,
			"IOMaximumIOps": 0,
			"BlkioWeight": 0,
			"BlkioWeightDevice": [{}],
			"BlkioDeviceReadBps": [{}],
			"BlkioDeviceWriteBps": [{}],
			"BlkioDeviceReadIOps": [{}],
			"BlkioDeviceWriteIOps": [{}],
			"CapAdd": null,
			"CapDrop": null,
			"ContainerIDFile": "",
			"CpusetCpus": "",
			"CpusetMems": "",
			"CpuPercent": 80,
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
			"OomScoreAdj": 500,
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
			"Sysctls": {
			        "net.ipv4.ip_forward": "1"
			},
			"StorageOpt": null,
			"VolumesFrom": null,
			"Ulimits": [{}],
			"VolumeDriver": "",
			"ShmSize": 67108864
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
					"NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
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
			"Dead": false,
			"Paused": false,
			"Pid": 0,
			"Restarting": false,
			"Running": true,
			"StartedAt": "2015-01-06T15:47:32.072697474Z",
			"Status": "running"
		},
		"Mounts": [
			{
				"Name": "fac362...80535",
				"Source": "/data",
				"Destination": "/data",
				"Driver": "local",
				"Mode": "ro,Z",
				"RW": false,
				"Propagation": ""
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
			"Volumes": {
				"/volumes/data": {}
			},
			"WorkingDir": "",
			"StopSignal": "SIGTERM"
		},
		"Created": "2015-01-06T15:47:31.485331387Z",
		"Driver": "devicemapper",
		"ExecIDs": null,
		"HostConfig": {
			"Binds": null,
			"IOMaximumBandwidth": 0,
			"IOMaximumIOps": 0,
			"BlkioWeight": 0,
			"BlkioWeightDevice": [{}],
			"BlkioDeviceReadBps": [{}],
			"BlkioDeviceWriteBps": [{}],
			"BlkioDeviceReadIOps": [{}],
			"BlkioDeviceWriteIOps": [{}],
			"CapAdd": null,
			"CapDrop": null,
			"ContainerIDFile": "",
			"CpusetCpus": "",
			"CpusetMems": "",
			"CpuPercent": 80,
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
			"OomScoreAdj": 500,
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
			"Sysctls": {
			        "net.ipv4.ip_forward": "1"
			},
			"StorageOpt": null,
			"VolumesFrom": null,
			"Ulimits": [{}],
			"VolumeDriver": "",
			"ShmSize": 67108864
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
					"NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
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
			"Dead": false,
			"Paused": false,
			"Pid": 0,
			"Restarting": false,
			"Running": true,
			"StartedAt": "2015-01-06T15:47:32.072697474Z",
			"Status": "running"
		},
		"Mounts": [
			{
				"Name": "fac362...80535",
				"Source": "/data",
				"Destination": "/data",
				"Driver": "local",
				"Mode": "ro,Z",
				"RW": false,
				"Propagation": ""
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
    GET /v1.24/containers/4fa6e0f0c678/json?size=1 HTTP/1.1
@y
    GET /v1.24/containers/4fa6e0f0c678/json?size=1 HTTP/1.1
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
    GET /v1.24/containers/4fa6e0f0c678/top HTTP/1.1
@y
    GET /v1.24/containers/4fa6e0f0c678/top HTTP/1.1
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
    GET /v1.24/containers/4fa6e0f0c678/top?ps_args=aux HTTP/1.1
@y
    GET /v1.24/containers/4fa6e0f0c678/top?ps_args=aux HTTP/1.1
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
     GET /v1.24/containers/4fa6e0f0c678/logs?stderr=1&stdout=1&timestamps=1&follow=1&tail=10&since=1428990821 HTTP/1.1
@y
     GET /v1.24/containers/4fa6e0f0c678/logs?stderr=1&stdout=1&timestamps=1&follow=1&tail=10&since=1428990821 HTTP/1.1
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
-   **details** - 1/True/true or 0/False/false, Show extra details provided to logs. Default `false`.
-   **follow** – 1/True/true or 0/False/false, return stream. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, show `stdout` log. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, show `stderr` log. Default `false`.
-   **since** – UNIX timestamp (integer) to filter logs. Specifying a timestamp
    will only output log-entries since that timestamp. Default: 0 (unfiltered)
-   **timestamps** – 1/True/true or 0/False/false, print timestamps for
        every log line. Default `false`.
-   **tail** – Output specified number of lines at the end of logs: `all` or `<number>`. Default all.
@y
-   **details** - 1/True/true or 0/False/false, Show extra details provided to logs. Default `false`.
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
    GET /v1.24/containers/4fa6e0f0c678/changes HTTP/1.1
@y
    GET /v1.24/containers/4fa6e0f0c678/changes HTTP/1.1
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
    GET /v1.24/containers/4fa6e0f0c678/export HTTP/1.1
@y
    GET /v1.24/containers/4fa6e0f0c678/export HTTP/1.1
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
    GET /v1.24/containers/redis1/stats HTTP/1.1
@y
    GET /v1.24/containers/redis1/stats HTTP/1.1
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
         "pids_stats": {
            "current": 3
         },
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
         "pids_stats": {
            "current": 3
         },
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
      POST /v1.24/containers/4fa6e0f0c678/resize?h=40&w=80 HTTP/1.1
@y
      POST /v1.24/containers/4fa6e0f0c678/resize?h=40&w=80 HTTP/1.1
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
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/containers/e90e34656806/start HTTP/1.1
@y
    POST /v1.24/containers/e90e34656806/start HTTP/1.1
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
-   **detachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
@y
-   **detachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
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
    POST /v1.24/containers/e90e34656806/stop?t=5 HTTP/1.1
@y
    POST /v1.24/containers/e90e34656806/stop?t=5 HTTP/1.1
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
    POST /v1.24/containers/e90e34656806/restart?t=5 HTTP/1.1
@y
    POST /v1.24/containers/e90e34656806/restart?t=5 HTTP/1.1
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
    POST /v1.24/containers/e90e34656806/kill HTTP/1.1
@y
    POST /v1.24/containers/e90e34656806/kill HTTP/1.1
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
#### Update a container
@y
#### Update a container
@z

@x
`POST /containers/(id or name)/update`
@y
`POST /containers/(id or name)/update`
@z

@x
Update configuration of one or more containers.
@y
Update configuration of one or more containers.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
       POST /v1.24/containers/e90e34656806/update HTTP/1.1
       Content-Type: application/json
       Content-Length: 12345
@y
       POST /v1.24/containers/e90e34656806/update HTTP/1.1
       Content-Type: application/json
       Content-Length: 12345
@z

@x
       {
         "BlkioWeight": 300,
         "CpuShares": 512,
         "CpuPeriod": 100000,
         "CpuQuota": 50000,
         "CpusetCpus": "0,1",
         "CpusetMems": "0",
         "Memory": 314572800,
         "MemorySwap": 514288000,
         "MemoryReservation": 209715200,
         "KernelMemory": 52428800,
         "RestartPolicy": {
           "MaximumRetryCount": 4,
           "Name": "on-failure"
         }
       }
@y
       {
         "BlkioWeight": 300,
         "CpuShares": 512,
         "CpuPeriod": 100000,
         "CpuQuota": 50000,
         "CpusetCpus": "0,1",
         "CpusetMems": "0",
         "Memory": 314572800,
         "MemorySwap": 514288000,
         "MemoryReservation": 209715200,
         "KernelMemory": 52428800,
         "RestartPolicy": {
           "MaximumRetryCount": 4,
           "Name": "on-failure"
         }
       }
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
           "Warnings": []
       }
@y
       {
           "Warnings": []
       }
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
    POST /v1.24/containers/e90e34656806/rename?name=new_name HTTP/1.1
@y
    POST /v1.24/containers/e90e34656806/rename?name=new_name HTTP/1.1
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
    POST /v1.24/containers/e90e34656806/pause HTTP/1.1
@y
    POST /v1.24/containers/e90e34656806/pause HTTP/1.1
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
    POST /v1.24/containers/e90e34656806/unpause HTTP/1.1
@y
    POST /v1.24/containers/e90e34656806/unpause HTTP/1.1
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
    POST /v1.24/containers/16253994b7c4/attach?logs=1&stream=0&stdout=1 HTTP/1.1
@y
    POST /v1.24/containers/16253994b7c4/attach?logs=1&stream=0&stdout=1 HTTP/1.1
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
-   **detachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
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
-   **detachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
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
-   **409** - container is paused
-   **500** – server error
@y
-   **101** – no error, hints proxy about hijacking
-   **200** – no error, no upgrade header found
-   **400** – bad parameter
-   **404** – no such container
-   **409** - container is paused
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
    GET /v1.24/containers/e90e34656806/attach/ws?logs=0&stream=1&stdin=1&stdout=1&stderr=1 HTTP/1.1
@y
    GET /v1.24/containers/e90e34656806/attach/ws?logs=0&stream=1&stdin=1&stdout=1&stderr=1 HTTP/1.1
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
-   **detachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
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
-   **detachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
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
    POST /v1.24/containers/16253994b7c4/wait HTTP/1.1
@y
    POST /v1.24/containers/16253994b7c4/wait HTTP/1.1
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
    DELETE /v1.24/containers/16253994b7c4?v=1 HTTP/1.1
@y
    DELETE /v1.24/containers/16253994b7c4?v=1 HTTP/1.1
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
    GET /v1.24/containers/8cce319429b2/archive?path=/root HTTP/1.1
@y
    GET /v1.24/containers/8cce319429b2/archive?path=/root HTTP/1.1
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
    PUT /v1.24/containers/8cce319429b2/archive?path=/vol1 HTTP/1.1
    Content-Type: application/x-tar
@y
    PUT /v1.24/containers/8cce319429b2/archive?path=/vol1 HTTP/1.1
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
### 3.2 Images
@y
### 3.2 Images
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
    GET /v1.24/images/json?all=0 HTTP/1.1
@y
    GET /v1.24/images/json?all=0 HTTP/1.1
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
    GET /v1.24/images/json?digests=1 HTTP/1.1
@y
    GET /v1.24/images/json?digests=1 HTTP/1.1
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
  -   `before`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
  -   `since`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
-   **filter** - only return images with the specified name
@y
-   **all** – 1/True/true or 0/False/false, default false
-   **filters** – a JSON encoded value of the filters (a map[string][]string) to process on the images list. Available filters:
  -   `dangling=true`
  -   `label=key` or `label="key=value"` of an image label
  -   `before`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
  -   `since`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
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
    POST /v1.24/build HTTP/1.1
    Content-Type: application/x-tar
@y
    POST /v1.24/build HTTP/1.1
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
-   **shmsize** - Size of `/dev/shm` in bytes. The size must be greater than 0.  If omitted the system uses 64MB.
-   **labels** – JSON map of string pairs for labels to set on the image.
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
-   **shmsize** - Size of `/dev/shm` in bytes. The size must be greater than 0.  If omitted the system uses 64MB.
-   **labels** – JSON map of string pairs for labels to set on the image.
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
    POST /v1.24/images/create?fromImage=busybox&tag=latest HTTP/1.1
@y
    POST /v1.24/images/create?fromImage=busybox&tag=latest HTTP/1.1
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
        The pull is cancelled if the HTTP connection is closed.
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
        The pull is cancelled if the HTTP connection is closed.
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
-   **X-Registry-Auth** – base64-encoded AuthConfig object, containing either login information, or a token
    - Credential based login:
@y
-   **X-Registry-Auth** – base64-encoded AuthConfig object, containing either login information, or a token
    - Credential based login:
@z

@x
        ```
    {
            "username": "jdoe",
            "password": "secret",
            "email": "jdoe@acme.com"
    }
        ```
@y
        ```
    {
            "username": "jdoe",
            "password": "secret",
            "email": "jdoe@acme.com"
    }
        ```
@z

@x
    - Token based login:
@y
    - Token based login:
@z

@x
        ```
    {
            "identitytoken": "9cbaf023786cd7..."
    }
        ```
@y
        ```
    {
            "identitytoken": "9cbaf023786cd7..."
    }
        ```
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
    GET /v1.24/images/example/json HTTP/1.1
@y
    GET /v1.24/images/example/json HTTP/1.1
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
       "Id" : "sha256:85f05633ddc1c50679be2b16a0479ab6f7637f8884e0cfe0f4d20e1ebb3d6e7c",
       "Container" : "cb91e48a60d01f1e27028b4fc6819f4f290b3cf12496c8176ec714d0d390984a",
       "Comment" : "",
       "Os" : "linux",
       "Architecture" : "amd64",
       "Parent" : "sha256:91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
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
       },
       "RootFS": {
           "Type": "layers",
           "Layers": [
               "sha256:1834950e52ce4d5a88a1bbd131c537f4d0e56d10ff0dd69e66be3b7dfa9df7e6",
               "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
           ]
       }
    }
@y
    {
       "Id" : "sha256:85f05633ddc1c50679be2b16a0479ab6f7637f8884e0cfe0f4d20e1ebb3d6e7c",
       "Container" : "cb91e48a60d01f1e27028b4fc6819f4f290b3cf12496c8176ec714d0d390984a",
       "Comment" : "",
       "Os" : "linux",
       "Architecture" : "amd64",
       "Parent" : "sha256:91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
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
       },
       "RootFS": {
           "Type": "layers",
           "Layers": [
               "sha256:1834950e52ce4d5a88a1bbd131c537f4d0e56d10ff0dd69e66be3b7dfa9df7e6",
               "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
           ]
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
    GET /v1.24/images/ubuntu/history HTTP/1.1
@y
    GET /v1.24/images/ubuntu/history HTTP/1.1
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
    POST /v1.24/images/test/push HTTP/1.1
@y
    POST /v1.24/images/test/push HTTP/1.1
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
The push is cancelled if the HTTP connection is closed.
@y
The push is cancelled if the HTTP connection is closed.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/images/registry.acme.com:5000/test/push HTTP/1.1
@y
    POST /v1.24/images/registry.acme.com:5000/test/push HTTP/1.1
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
-   **X-Registry-Auth** – base64-encoded AuthConfig object, containing either login information, or a token
    - Credential based login:
@y
-   **X-Registry-Auth** – base64-encoded AuthConfig object, containing either login information, or a token
    - Credential based login:
@z

@x
        ```
    {
            "username": "jdoe",
            "password": "secret",
            "email": "jdoe@acme.com",
    }
        ```
@y
        ```
    {
            "username": "jdoe",
            "password": "secret",
            "email": "jdoe@acme.com",
    }
        ```
@z

@x
    - Identity token based login:
@y
    - Identity token based login:
@z

@x
        ```
    {
            "identitytoken": "9cbaf023786cd7..."
    }
        ```
@y
        ```
    {
            "identitytoken": "9cbaf023786cd7..."
    }
        ```
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
    POST /v1.24/images/test/tag?repo=myrepo&tag=v42 HTTP/1.1
@y
    POST /v1.24/images/test/tag?repo=myrepo&tag=v42 HTTP/1.1
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
-   **tag** - The new tag name
@y
-   **repo** – The repository to tag in
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
    DELETE /v1.24/images/test HTTP/1.1
@y
    DELETE /v1.24/images/test HTTP/1.1
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
    GET /v1.24/images/search?term=sshd HTTP/1.1
@y
    GET /v1.24/images/search?term=sshd HTTP/1.1
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
-   **limit** – maximum returned search results
-   **filters** – a JSON encoded value of the filters (a map[string][]string) to process on the images list. Available filters:
  -   `stars=<number>`
  -   `is-automated=(true|false)`
  -   `is-official=(true|false)`
@y
-   **term** – term to search
-   **limit** – maximum returned search results
-   **filters** – a JSON encoded value of the filters (a map[string][]string) to process on the images list. Available filters:
  -   `stars=<number>`
  -   `is-automated=(true|false)`
  -   `is-official=(true|false)`
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
### 3.3 Misc
@y
### 3.3 Misc
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
Validate credentials for a registry and get identity token,
if available, for accessing the registry without password.
@y
Validate credentials for a registry and get identity token,
if available, for accessing the registry without password.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/auth HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/auth HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
         "username": "hannibal",
         "password": "xxxx",
         "serveraddress": "https://index.docker.io/v1/"
    }
@y
    {
         "username": "hannibal",
         "password": "xxxx",
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
    {
         "Status": "Login Succeeded",
         "IdentityToken": "9cbaf023786cd7..."
    }
@y
    {
         "Status": "Login Succeeded",
         "IdentityToken": "9cbaf023786cd7..."
    }
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
    GET /v1.24/info HTTP/1.1
@y
    GET /v1.24/info HTTP/1.1
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
        "Architecture": "x86_64",
        "ClusterStore": "etcd://localhost:2379",
        "CgroupDriver": "cgroupfs",
        "Containers": 11,
        "ContainersRunning": 7,
        "ContainersStopped": 3,
        "ContainersPaused": 1,
        "CpuCfsPeriod": true,
        "CpuCfsQuota": true,
        "Debug": false,
        "DockerRootDir": "/var/lib/docker",
        "Driver": "btrfs",
        "DriverStatus": [[""]],
        "ExperimentalBuild": false,
        "HttpProxy": "http://test:test@localhost:8080",
        "HttpsProxy": "https://test:test@localhost:8080",
        "ID": "7TRN:IPZB:QYBB:VPBQ:UMPP:KARE:6ZNR:XE6T:7EWV:PKF4:ZOJD:TPYS",
        "IPv4Forwarding": true,
        "Images": 16,
        "IndexServerAddress": "https://index.docker.io/v1/",
        "InitPath": "/usr/bin/docker",
        "InitSha1": "",
        "KernelMemory": true,
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
        "OSType": "linux",
        "OperatingSystem": "Boot2Docker",
        "Plugins": {
            "Volume": [
                "local"
            ],
            "Network": [
                "null",
                "host",
                "bridge"
            ]
        },
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
        "SecurityOptions": [
            "apparmor",
            "seccomp",
            "selinux"
        ],
        "ServerVersion": "1.9.0",
        "SwapLimit": false,
        "SystemStatus": [["State", "Healthy"]],
        "SystemTime": "2015-03-10T11:11:23.730591467-07:00"
    }
@y
    {
        "Architecture": "x86_64",
        "ClusterStore": "etcd://localhost:2379",
        "CgroupDriver": "cgroupfs",
        "Containers": 11,
        "ContainersRunning": 7,
        "ContainersStopped": 3,
        "ContainersPaused": 1,
        "CpuCfsPeriod": true,
        "CpuCfsQuota": true,
        "Debug": false,
        "DockerRootDir": "/var/lib/docker",
        "Driver": "btrfs",
        "DriverStatus": [[""]],
        "ExperimentalBuild": false,
        "HttpProxy": "http://test:test@localhost:8080",
        "HttpsProxy": "https://test:test@localhost:8080",
        "ID": "7TRN:IPZB:QYBB:VPBQ:UMPP:KARE:6ZNR:XE6T:7EWV:PKF4:ZOJD:TPYS",
        "IPv4Forwarding": true,
        "Images": 16,
        "IndexServerAddress": "https://index.docker.io/v1/",
        "InitPath": "/usr/bin/docker",
        "InitSha1": "",
        "KernelMemory": true,
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
        "OSType": "linux",
        "OperatingSystem": "Boot2Docker",
        "Plugins": {
            "Volume": [
                "local"
            ],
            "Network": [
                "null",
                "host",
                "bridge"
            ]
        },
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
        "SecurityOptions": [
            "apparmor",
            "seccomp",
            "selinux"
        ],
        "ServerVersion": "1.9.0",
        "SwapLimit": false,
        "SystemStatus": [["State", "Healthy"]],
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
    GET /v1.24/version HTTP/1.1
@y
    GET /v1.24/version HTTP/1.1
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
         "Version": "1.12.0",
         "Os": "linux",
         "KernelVersion": "3.19.0-23-generic",
         "GoVersion": "go1.6.3",
         "GitCommit": "deadbee",
         "Arch": "amd64",
         "ApiVersion": "1.24",
         "BuildTime": "2016-06-14T07:09:13.444803460+00:00",
         "Experimental": true
    }
@y
    {
         "Version": "1.12.0",
         "Os": "linux",
         "KernelVersion": "3.19.0-23-generic",
         "GoVersion": "go1.6.3",
         "GitCommit": "deadbee",
         "Arch": "amd64",
         "ApiVersion": "1.24",
         "BuildTime": "2016-06-14T07:09:13.444803460+00:00",
         "Experimental": true
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
    GET /v1.24/_ping HTTP/1.1
@y
    GET /v1.24/_ping HTTP/1.1
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
    POST /v1.24/commit?container=44c004db4b17&comment=message&repo=myrepo HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/commit?container=44c004db4b17&comment=message&repo=myrepo HTTP/1.1
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
    attach, commit, copy, create, destroy, detach, die, exec_create, exec_detach, exec_start, export, health_status, kill, oom, pause, rename, resize, restart, start, stop, top, unpause, update
@y
    attach, commit, copy, create, destroy, detach, die, exec_create, exec_detach, exec_start, export, health_status, kill, oom, pause, rename, resize, restart, start, stop, top, unpause, update
@z

@x
Docker images report the following events:
@y
Docker images report the following events:
@z

@x
    delete, import, load, pull, push, save, tag, untag
@y
    delete, import, load, pull, push, save, tag, untag
@z

@x
Docker volumes report the following events:
@y
Docker volumes report the following events:
@z

@x
    create, mount, unmount, destroy
@y
    create, mount, unmount, destroy
@z

@x
Docker networks report the following events:
@y
Docker networks report the following events:
@z

@x
    create, connect, disconnect, destroy
@y
    create, connect, disconnect, destroy
@z

@x
Docker daemon report the following event:
@y
Docker daemon report the following event:
@z

@x
    reload
@y
    reload
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.24/events?since=1374067924
@y
    GET /v1.24/events?since=1374067924
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
    Server: Docker/1.12.0 (linux)
    Date: Fri, 29 Apr 2016 15:18:06 GMT
    Transfer-Encoding: chunked
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
    Server: Docker/1.12.0 (linux)
    Date: Fri, 29 Apr 2016 15:18:06 GMT
    Transfer-Encoding: chunked
@z

@x
    {
      "status": "pull",
      "id": "alpine:latest",
      "Type": "image",
      "Action": "pull",
      "Actor": {
        "ID": "alpine:latest",
        "Attributes": {
          "name": "alpine"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101301854122
    }
    {
      "status": "create",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "create",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101381709551
    }
    {
      "status": "attach",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "attach",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101383858412
    }
    {
      "Type": "network",
      "Action": "connect",
      "Actor": {
        "ID": "7dc8ac97d5d29ef6c31b6052f3938c1e8f2749abbd17d1bd1febf2608db1b474",
        "Attributes": {
          "container": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
          "name": "bridge",
          "type": "bridge"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101394865557
    }
    {
      "status": "start",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "start",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101607533796
    }
    {
      "status": "resize",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "resize",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "height": "46",
          "image": "alpine",
          "name": "my-container",
          "width": "204"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101610269268
    }
    {
      "status": "die",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "die",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "exitCode": "0",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943105,
      "timeNano": 1461943105079144137
    }
    {
      "Type": "network",
      "Action": "disconnect",
      "Actor": {
        "ID": "7dc8ac97d5d29ef6c31b6052f3938c1e8f2749abbd17d1bd1febf2608db1b474",
        "Attributes": {
          "container": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
          "name": "bridge",
          "type": "bridge"
        }
      },
      "time": 1461943105,
      "timeNano": 1461943105230860245
    }
    {
      "status": "destroy",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "destroy",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943105,
      "timeNano": 1461943105338056026
    }
@y
    {
      "status": "pull",
      "id": "alpine:latest",
      "Type": "image",
      "Action": "pull",
      "Actor": {
        "ID": "alpine:latest",
        "Attributes": {
          "name": "alpine"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101301854122
    }
    {
      "status": "create",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "create",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101381709551
    }
    {
      "status": "attach",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "attach",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101383858412
    }
    {
      "Type": "network",
      "Action": "connect",
      "Actor": {
        "ID": "7dc8ac97d5d29ef6c31b6052f3938c1e8f2749abbd17d1bd1febf2608db1b474",
        "Attributes": {
          "container": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
          "name": "bridge",
          "type": "bridge"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101394865557
    }
    {
      "status": "start",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "start",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101607533796
    }
    {
      "status": "resize",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "resize",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "height": "46",
          "image": "alpine",
          "name": "my-container",
          "width": "204"
        }
      },
      "time": 1461943101,
      "timeNano": 1461943101610269268
    }
    {
      "status": "die",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "die",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "exitCode": "0",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943105,
      "timeNano": 1461943105079144137
    }
    {
      "Type": "network",
      "Action": "disconnect",
      "Actor": {
        "ID": "7dc8ac97d5d29ef6c31b6052f3938c1e8f2749abbd17d1bd1febf2608db1b474",
        "Attributes": {
          "container": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
          "name": "bridge",
          "type": "bridge"
        }
      },
      "time": 1461943105,
      "timeNano": 1461943105230860245
    }
    {
      "status": "destroy",
      "id": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
      "from": "alpine",
      "Type": "container",
      "Action": "destroy",
      "Actor": {
        "ID": "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743",
        "Attributes": {
          "com.example.some-label": "some-label-value",
          "image": "alpine",
          "name": "my-container"
        }
      },
      "time": 1461943105,
      "timeNano": 1461943105338056026
    }
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
  -   `type=<string>`; -- either `container` or `image` or `volume` or `network` or `daemon`
  -   `volume=<string>`; -- volume to filter
  -   `network=<string>`; -- network to filter
  -   `daemon=<string>`; -- daemon name or id to filter
@y
-   **since** – Timestamp. Show all events created since timestamp and then stream
-   **until** – Timestamp. Show events created until given timestamp and stop streaming
-   **filters** – A json encoded value of the filters (a map[string][]string) to process on the event list. Available filters:
  -   `container=<string>`; -- container to filter
  -   `event=<string>`; -- event to filter
  -   `image=<string>`; -- image to filter
  -   `label=<string>`; -- image and container label to filter
  -   `type=<string>`; -- either `container` or `image` or `volume` or `network` or `daemon`
  -   `volume=<string>`; -- volume to filter
  -   `network=<string>`; -- network to filter
  -   `daemon=<string>`; -- daemon name or id to filter
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **400** - bad parameter
-   **500** – server error
@y
-   **200** – no error
-   **400** - bad parameter
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
    GET /v1.24/images/ubuntu/get
@y
    GET /v1.24/images/ubuntu/get
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
    GET /v1.24/images/get?names=myname%2Fmyapp%3Alatest&names=busybox
@y
    GET /v1.24/images/get?names=myname%2Fmyapp%3Alatest&names=busybox
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
    POST /v1.24/images/load
    Content-Type: application/x-tar
    Content-Length: 12345
@y
    POST /v1.24/images/load
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
    Content-Type: application/json
    Transfer-Encoding: chunked
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
    Transfer-Encoding: chunked
@z

@x
    {"status":"Loading layer","progressDetail":{"current":32768,"total":1292800},"progress":"[=                                                 ] 32.77 kB/1.293 MB","id":"8ac8bfaff55a"}
    {"status":"Loading layer","progressDetail":{"current":65536,"total":1292800},"progress":"[==                                                ] 65.54 kB/1.293 MB","id":"8ac8bfaff55a"}
    {"status":"Loading layer","progressDetail":{"current":98304,"total":1292800},"progress":"[===                                               ]  98.3 kB/1.293 MB","id":"8ac8bfaff55a"}
    {"status":"Loading layer","progressDetail":{"current":131072,"total":1292800},"progress":"[=====                                             ] 131.1 kB/1.293 MB","id":"8ac8bfaff55a"}
    ...
    {"stream":"Loaded image: busybox:latest\n"}
@y
    {"status":"Loading layer","progressDetail":{"current":32768,"total":1292800},"progress":"[=                                                 ] 32.77 kB/1.293 MB","id":"8ac8bfaff55a"}
    {"status":"Loading layer","progressDetail":{"current":65536,"total":1292800},"progress":"[==                                                ] 65.54 kB/1.293 MB","id":"8ac8bfaff55a"}
    {"status":"Loading layer","progressDetail":{"current":98304,"total":1292800},"progress":"[===                                               ]  98.3 kB/1.293 MB","id":"8ac8bfaff55a"}
    {"status":"Loading layer","progressDetail":{"current":131072,"total":1292800},"progress":"[=====                                             ] 131.1 kB/1.293 MB","id":"8ac8bfaff55a"}
    ...
    {"stream":"Loaded image: busybox:latest\n"}
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
If the "quiet" query parameter is set to `true` / `1` (`?quiet=1`), progress
details are suppressed, and only a confirmation message is returned once the
action completes.
@y
If the "quiet" query parameter is set to `true` / `1` (`?quiet=1`), progress
details are suppressed, and only a confirmation message is returned once the
action completes.
@z

@x
    HTTP/1.1 200 OK
    Content-Type: application/json
    Transfer-Encoding: chunked
@y
    HTTP/1.1 200 OK
    Content-Type: application/json
    Transfer-Encoding: chunked
@z

@x
    {"stream":"Loaded image: busybox:latest\n"}
@y
    {"stream":"Loaded image: busybox:latest\n"}
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
-   **quiet** – Boolean value, suppress progress details during load. Defaults
      to `0` / `false` if omitted.
@y
-   **quiet** – Boolean value, suppress progress details during load. Defaults
      to `0` / `false` if omitted.
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
    POST /v1.24/containers/e90e34656806/exec HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/containers/e90e34656806/exec HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
      "AttachStdin": true,
      "AttachStdout": true,
      "AttachStderr": true,
      "Cmd": ["sh"],
      "DetachKeys": "ctrl-p,ctrl-q",
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
      "DetachKeys": "ctrl-p,ctrl-q",
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
-   **DetachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
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
-   **DetachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
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
    POST /v1.24/exec/e90e34656806/start HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/exec/e90e34656806/start HTTP/1.1
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
    POST /v1.24/exec/e90e34656806/resize?h=40&w=80 HTTP/1.1
    Content-Type: text/plain
@y
    POST /v1.24/exec/e90e34656806/resize?h=40&w=80 HTTP/1.1
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
    GET /v1.24/exec/11fb006128e8ceb3942e7c58d77750f24210e35f879dd204ac975c184b820b39/json HTTP/1.1
@y
    GET /v1.24/exec/11fb006128e8ceb3942e7c58d77750f24210e35f879dd204ac975c184b820b39/json HTTP/1.1
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
      "CanRemove": false,
      "ContainerID": "b53ee82b53a40c7dca428523e34f741f3abc51d9f297a14ff874bf761b995126",
      "DetachKeys": "",
      "ExitCode": 2,
      "ID": "f33bbfb39f5b142420f4759b2348913bd4a8d1a6d7fd56499cb41a1bb91d7b3b",
      "OpenStderr": true,
      "OpenStdin": true,
      "OpenStdout": true,
      "ProcessConfig": {
        "arguments": [
          "-c",
          "exit 2"
        ],
        "entrypoint": "sh",
        "privileged": false,
        "tty": true,
        "user": "1000"
      },
      "Running": false
    }
@y
    {
      "CanRemove": false,
      "ContainerID": "b53ee82b53a40c7dca428523e34f741f3abc51d9f297a14ff874bf761b995126",
      "DetachKeys": "",
      "ExitCode": 2,
      "ID": "f33bbfb39f5b142420f4759b2348913bd4a8d1a6d7fd56499cb41a1bb91d7b3b",
      "OpenStderr": true,
      "OpenStdin": true,
      "OpenStdout": true,
      "ProcessConfig": {
        "arguments": [
          "-c",
          "exit 2"
        ],
        "entrypoint": "sh",
        "privileged": false,
        "tty": true,
        "user": "1000"
      },
      "Running": false
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
### 3.4 Volumes
@y
### 3.4 Volumes
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
    GET /v1.24/volumes HTTP/1.1
@y
    GET /v1.24/volumes HTTP/1.1
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
          "Mountpoint": "/var/lib/docker/volumes/tardis",
          "Labels": null,
          "Scope": "local"
        }
      ],
      "Warnings": []
    }
@y
    {
      "Volumes": [
        {
          "Name": "tardis",
          "Driver": "local",
          "Mountpoint": "/var/lib/docker/volumes/tardis",
          "Labels": null,
          "Scope": "local"
        }
      ],
      "Warnings": []
    }
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the volumes list. Available filters:
  -   `name=<volume-name>` Matches all or part of a volume name.
  -   `dangling=<boolean>` When set to `true` (or `1`), returns all volumes that are "dangling" (not in use by a container). When set to `false` (or `0`), only volumes that are in use by one or more containers are returned.
  -   `driver=<volume-driver-name>` Matches all or part of a volume driver name.
@y
- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the volumes list. Available filters:
  -   `name=<volume-name>` Matches all or part of a volume name.
  -   `dangling=<boolean>` When set to `true` (or `1`), returns all volumes that are "dangling" (not in use by a container). When set to `false` (or `0`), only volumes that are in use by one or more containers are returned.
  -   `driver=<volume-driver-name>` Matches all or part of a volume driver name.
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
    POST /v1.24/volumes/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/volumes/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
      "Name": "tardis",
      "Labels": {
        "com.example.some-label": "some-value",
        "com.example.some-other-label": "some-other-value"
      },
      "Driver": "custom"
    }
@y
    {
      "Name": "tardis",
      "Labels": {
        "com.example.some-label": "some-value",
        "com.example.some-other-label": "some-other-value"
      },
      "Driver": "custom"
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
      "Driver": "custom",
      "Mountpoint": "/var/lib/docker/volumes/tardis",
      "Status": {
        "hello": "world"
      },
      "Labels": {
        "com.example.some-label": "some-value",
        "com.example.some-other-label": "some-other-value"
      },
      "Scope": "local"
    }
@y
    {
      "Name": "tardis",
      "Driver": "custom",
      "Mountpoint": "/var/lib/docker/volumes/tardis",
      "Status": {
        "hello": "world"
      },
      "Labels": {
        "com.example.some-label": "some-value",
        "com.example.some-other-label": "some-other-value"
      },
      "Scope": "local"
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
- **Labels** - Labels to set on the volume, specified as a map: `{"key":"value","key2":"value2"}`
@y
- **Name** - The new volume's name. If not specified, Docker generates a name.
- **Driver** - Name of the volume driver to use. Defaults to `local` for the name.
- **DriverOpts** - A mapping of driver options and values. These options are
    passed directly to the driver and are driver specific.
- **Labels** - Labels to set on the volume, specified as a map: `{"key":"value","key2":"value2"}`
@z

@x
**JSON fields in response**:
@y
**JSON fields in response**:
@z

@x
Refer to the [inspect a volume](#inspect-a-volume) section or details about the
JSON fields returned in the response.
@y
Refer to the [inspect a volume](#inspect-a-volume) section or details about the
JSON fields returned in the response.
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
    GET /v1.24/volumes/tardis
@y
    GET /v1.24/volumes/tardis
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
      "Driver": "custom",
      "Mountpoint": "/var/lib/docker/volumes/tardis/_data",
      "Status": {
        "hello": "world"
      },
      "Labels": {
          "com.example.some-label": "some-value",
          "com.example.some-other-label": "some-other-value"
      },
      "Scope": "local"
    }
@y
    {
      "Name": "tardis",
      "Driver": "custom",
      "Mountpoint": "/var/lib/docker/volumes/tardis/_data",
      "Status": {
        "hello": "world"
      },
      "Labels": {
          "com.example.some-label": "some-value",
          "com.example.some-other-label": "some-other-value"
      },
      "Scope": "local"
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
**JSON fields in response**:
@y
**JSON fields in response**:
@z

@x
The following fields can be returned in the API response. Empty fields, or
fields that are not supported by the volume's driver may be omitted in the
response.
@y
The following fields can be returned in the API response. Empty fields, or
fields that are not supported by the volume's driver may be omitted in the
response.
@z

@x
- **Name** - Name of the volume.
- **Driver** - Name of the volume driver used by the volume.
- **Mountpoint** - Mount path of the volume on the host.
- **Status** - Low-level details about the volume, provided by the volume driver.
    Details are returned as a map with key/value pairs: `{"key":"value","key2":"value2"}`.
    The `Status` field is optional, and is omitted if the volume driver does not
    support this feature.
- **Labels** - Labels set on the volume, specified as a map: `{"key":"value","key2":"value2"}`.
- **Scope** - Scope describes the level at which the volume exists, can be one of
    `global` for cluster-wide or `local` for machine level. The default is `local`.
@y
- **Name** - Name of the volume.
- **Driver** - Name of the volume driver used by the volume.
- **Mountpoint** - Mount path of the volume on the host.
- **Status** - Low-level details about the volume, provided by the volume driver.
    Details are returned as a map with key/value pairs: `{"key":"value","key2":"value2"}`.
    The `Status` field is optional, and is omitted if the volume driver does not
    support this feature.
- **Labels** - Labels set on the volume, specified as a map: `{"key":"value","key2":"value2"}`.
- **Scope** - Scope describes the level at which the volume exists, can be one of
    `global` for cluster-wide or `local` for machine level. The default is `local`.
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
    DELETE /v1.24/volumes/tardis HTTP/1.1
@y
    DELETE /v1.24/volumes/tardis HTTP/1.1
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
### 3.5 Networks
@y
### 3.5 Networks
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
    GET /v1.24/networks?filters={"type":{"custom":true}} HTTP/1.1
@y
    GET /v1.24/networks?filters={"type":{"custom":true}} HTTP/1.1
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
    "EnableIPv6": false,
    "Internal": false,
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
    "EnableIPv6": false,
    "Internal": false,
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
    "EnableIPv6": false,
    "Internal": false,
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
    "EnableIPv6": false,
    "Internal": false,
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
    "EnableIPv6": false,
    "Internal": false,
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
    "EnableIPv6": false,
    "Internal": false,
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
- **filters** - JSON encoded network list filter. The filter value is one of:
  -   `driver=<driver-name>` Matches a network's driver.
  -   `id=<network-id>` Matches all or part of a network id.
  -   `label=<key>` or `label=<key>=<value>` of a network label.
  -   `name=<network-name>` Matches all or part of a network name.
  -   `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword returns all user-defined networks.
@y
- **filters** - JSON encoded network list filter. The filter value is one of:
  -   `driver=<driver-name>` Matches a network's driver.
  -   `id=<network-id>` Matches all or part of a network id.
  -   `label=<key>` or `label=<key>=<value>` of a network label.
  -   `name=<network-name>` Matches all or part of a network name.
  -   `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword returns all user-defined networks.
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
    GET /v1.24/networks/7d86d31b1478e7cca9ebed7e73aa0fdeec46c5ca29497431d3007d2d9e15ed99 HTTP/1.1
@y
    GET /v1.24/networks/7d86d31b1478e7cca9ebed7e73aa0fdeec46c5ca29497431d3007d2d9e15ed99 HTTP/1.1
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
  "Name": "net01",
  "Id": "7d86d31b1478e7cca9ebed7e73aa0fdeec46c5ca29497431d3007d2d9e15ed99",
  "Scope": "local",
  "Driver": "bridge",
  "EnableIPv6": false,
  "IPAM": {
    "Driver": "default",
    "Config": [
      {
        "Subnet": "172.19.0.0/16",
        "Gateway": "172.19.0.1"
      }
    ],
    "Options": {
        "foo": "bar"
    }
  },
  "Internal": false,
  "Containers": {
    "19a4d5d687db25203351ed79d478946f861258f018fe384f229f2efa4b23513c": {
      "Name": "test",
      "EndpointID": "628cadb8bcb92de107b2a1e516cbffe463e321f548feb37697cce00ad694f21a",
      "MacAddress": "02:42:ac:13:00:02",
      "IPv4Address": "172.19.0.2/16",
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
  },
  "Labels": {
    "com.example.some-label": "some-value",
    "com.example.some-other-label": "some-other-value"
  }
}
```
@y
{
  "Name": "net01",
  "Id": "7d86d31b1478e7cca9ebed7e73aa0fdeec46c5ca29497431d3007d2d9e15ed99",
  "Scope": "local",
  "Driver": "bridge",
  "EnableIPv6": false,
  "IPAM": {
    "Driver": "default",
    "Config": [
      {
        "Subnet": "172.19.0.0/16",
        "Gateway": "172.19.0.1"
      }
    ],
    "Options": {
        "foo": "bar"
    }
  },
  "Internal": false,
  "Containers": {
    "19a4d5d687db25203351ed79d478946f861258f018fe384f229f2efa4b23513c": {
      "Name": "test",
      "EndpointID": "628cadb8bcb92de107b2a1e516cbffe463e321f548feb37697cce00ad694f21a",
      "MacAddress": "02:42:ac:13:00:02",
      "IPv4Address": "172.19.0.2/16",
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
  },
  "Labels": {
    "com.example.some-label": "some-value",
    "com.example.some-other-label": "some-other-value"
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
POST /v1.24/networks/create HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@y
```
POST /v1.24/networks/create HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@z

@x
{
  "Name":"isolated_nw",
  "CheckDuplicate":true,
  "Driver":"bridge",
  "EnableIPv6": true,
  "IPAM":{
    "Driver": "default",
    "Config":[
      {
        "Subnet":"172.20.0.0/16",
        "IPRange":"172.20.10.0/24",
        "Gateway":"172.20.10.11"
      },
      {
        "Subnet":"2001:db8:abcd::/64",
        "Gateway":"2001:db8:abcd::1011"
      }
    ],
    "Options": {
      "foo": "bar"
    }
  },
  "Internal":true,
  "Options": {
    "com.docker.network.bridge.default_bridge": "true",
    "com.docker.network.bridge.enable_icc": "true",
    "com.docker.network.bridge.enable_ip_masquerade": "true",
    "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
    "com.docker.network.bridge.name": "docker0",
    "com.docker.network.driver.mtu": "1500"
  },
  "Labels": {
    "com.example.some-label": "some-value",
    "com.example.some-other-label": "some-other-value"
  }
}
```
@y
{
  "Name":"isolated_nw",
  "CheckDuplicate":true,
  "Driver":"bridge",
  "EnableIPv6": true,
  "IPAM":{
    "Driver": "default",
    "Config":[
      {
        "Subnet":"172.20.0.0/16",
        "IPRange":"172.20.10.0/24",
        "Gateway":"172.20.10.11"
      },
      {
        "Subnet":"2001:db8:abcd::/64",
        "Gateway":"2001:db8:abcd::1011"
      }
    ],
    "Options": {
      "foo": "bar"
    }
  },
  "Internal":true,
  "Options": {
    "com.docker.network.bridge.default_bridge": "true",
    "com.docker.network.bridge.enable_icc": "true",
    "com.docker.network.bridge.enable_ip_masquerade": "true",
    "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
    "com.docker.network.bridge.name": "docker0",
    "com.docker.network.driver.mtu": "1500"
  },
  "Labels": {
    "com.example.some-label": "some-value",
    "com.example.some-other-label": "some-other-value"
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
- **403** - operation not supported for pre-defined networks
- **404** - plugin not found
- **500** - server error
@y
- **201** - no error
- **403** - operation not supported for pre-defined networks
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
    and network name is strictly a user-friendly alias to the network 
    which is uniquely identified using ID, there is no guaranteed way to check for duplicates. 
    This parameter CheckDuplicate is there to provide a best effort checking of any networks 
    which has the same name but it is not guaranteed to catch all name collisions.
- **Driver** - Name of the network driver plugin to use. Defaults to `bridge` driver
- **Internal** - Restrict external access to the network
- **IPAM** - Optional custom IP scheme for the network
  - **Driver** - Name of the IPAM driver to use. Defaults to `default` driver
  - **Config** - List of IPAM configuration options, specified as a map:
      `{"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}`
  - **Options** - Driver-specific options, specified as a map: `{"option":"value" [,"option2":"value2"]}`
- **EnableIPv6** - Enable IPv6 on the network
- **Options** - Network specific options to be used by the drivers
- **Labels** - Labels to set on the network, specified as a map: `{"key":"value" [,"key2":"value2"]}`
@y
- **Name** - The new network's name. this is a mandatory field
- **CheckDuplicate** - Requests daemon to check for networks with same name. Defaults to `false`.
    Since Network is primarily keyed based on a random ID and not on the name, 
    and network name is strictly a user-friendly alias to the network 
    which is uniquely identified using ID, there is no guaranteed way to check for duplicates. 
    This parameter CheckDuplicate is there to provide a best effort checking of any networks 
    which has the same name but it is not guaranteed to catch all name collisions.
- **Driver** - Name of the network driver plugin to use. Defaults to `bridge` driver
- **Internal** - Restrict external access to the network
- **IPAM** - Optional custom IP scheme for the network
  - **Driver** - Name of the IPAM driver to use. Defaults to `default` driver
  - **Config** - List of IPAM configuration options, specified as a map:
      `{"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}`
  - **Options** - Driver-specific options, specified as a map: `{"option":"value" [,"option2":"value2"]}`
- **EnableIPv6** - Enable IPv6 on the network
- **Options** - Network specific options to be used by the drivers
- **Labels** - Labels to set on the network, specified as a map: `{"key":"value" [,"key2":"value2"]}`
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
POST /v1.24/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/connect HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@y
```
POST /v1.24/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/connect HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@z

@x
{
  "Container":"3613f73ba0e4",
  "EndpointConfig": {
    "IPAMConfig": {
        "IPv4Address":"172.24.56.89",
        "IPv6Address":"2001:db8::5689"
    }
  }
}
```
@y
{
  "Container":"3613f73ba0e4",
  "EndpointConfig": {
    "IPAMConfig": {
        "IPv4Address":"172.24.56.89",
        "IPv6Address":"2001:db8::5689"
    }
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
- **403** - operation not supported for swarm scoped networks
- **404** - network or container is not found
- **500** - Internal Server Error
@y
- **200** - no error
- **403** - operation not supported for swarm scoped networks
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
POST /v1.24/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/disconnect HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@y
```
POST /v1.24/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/disconnect HTTP/1.1
Content-Type: application/json
Content-Length: 12345
@z

@x
{
  "Container":"3613f73ba0e4",
  "Force":false
}
```
@y
{
  "Container":"3613f73ba0e4",
  "Force":false
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
- **403** - operation not supported for swarm scoped networks
- **404** - network or container not found
- **500** - Internal Server Error
@y
- **200** - no error
- **403** - operation not supported for swarm scoped networks
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
- **Force** - Force the container to disconnect from a network
@y
- **Container** - container-id/name to be disconnected from a network
- **Force** - Force the container to disconnect from a network
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
    DELETE /v1.24/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30 HTTP/1.1
@y
    DELETE /v1.24/networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30 HTTP/1.1
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
-   **403** - operation not supported for pre-defined networks
-   **404** - no such network
-   **500** - server error
@y
-   **204** - no error
-   **403** - operation not supported for pre-defined networks
-   **404** - no such network
-   **500** - server error
@z

@x
### 3.6 Plugins (experimental)
@y
### 3.6 Plugins (experimental)
@z

@x
#### List plugins
@y
#### List plugins
@z

@x
`GET /plugins`
@y
`GET /plugins`
@z

@x
Returns information about installed plugins.
@y
Returns information about installed plugins.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.24/plugins HTTP/1.1
@y
    GET /v1.24/plugins HTTP/1.1
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
    "Id": "5724e2c8652da337ab2eedd19fc6fc0ec908e4bd907c7421bf6a8dfc70c4c078",
    "Name": "tiborvass/no-remove",
    "Tag": "latest",
    "Active": true,
    "Config": {
      "Mounts": [
        {
          "Name": "",
          "Description": "",
          "Settable": null,
          "Source": "/data",
          "Destination": "/data",
          "Type": "bind",
          "Options": [
            "shared",
            "rbind"
          ]
        },
        {
          "Name": "",
          "Description": "",
          "Settable": null,
          "Source": null,
          "Destination": "/foobar",
          "Type": "tmpfs",
          "Options": null
        }
      ],
      "Env": [
        "DEBUG=1"
      ],
      "Args": null,
      "Devices": null
    },
    "Manifest": {
      "ManifestVersion": "v0",
      "Description": "A test plugin for Docker",
      "Documentation": "https://docs.docker.com/engine/extend/plugins/",
      "Interface": {
        "Types": [
          "docker.volumedriver/1.0"
        ],
        "Socket": "plugins.sock"
      },
      "Entrypoint": [
        "plugin-no-remove",
        "/data"
      ],
      "Workdir": "",
      "User": {
      },
      "Network": {
        "Type": "host"
      },
      "Capabilities": null,
      "Mounts": [
        {
          "Name": "",
          "Description": "",
          "Settable": null,
          "Source": "/data",
          "Destination": "/data",
          "Type": "bind",
          "Options": [
            "shared",
            "rbind"
          ]
        },
        {
          "Name": "",
          "Description": "",
          "Settable": null,
          "Source": null,
          "Destination": "/foobar",
          "Type": "tmpfs",
          "Options": null
        }
      ],
      "Devices": [
        {
          "Name": "device",
          "Description": "a host device to mount",
          "Settable": null,
          "Path": "/dev/cpu_dma_latency"
        }
      ],
      "Env": [
        {
          "Name": "DEBUG",
          "Description": "If set, prints debug messages",
          "Settable": null,
          "Value": "1"
        }
      ],
      "Args": {
        "Name": "args",
        "Description": "command line arguments",
        "Settable": null,
        "Value": [
@y
[
  {
    "Id": "5724e2c8652da337ab2eedd19fc6fc0ec908e4bd907c7421bf6a8dfc70c4c078",
    "Name": "tiborvass/no-remove",
    "Tag": "latest",
    "Active": true,
    "Config": {
      "Mounts": [
        {
          "Name": "",
          "Description": "",
          "Settable": null,
          "Source": "/data",
          "Destination": "/data",
          "Type": "bind",
          "Options": [
            "shared",
            "rbind"
          ]
        },
        {
          "Name": "",
          "Description": "",
          "Settable": null,
          "Source": null,
          "Destination": "/foobar",
          "Type": "tmpfs",
          "Options": null
        }
      ],
      "Env": [
        "DEBUG=1"
      ],
      "Args": null,
      "Devices": null
    },
    "Manifest": {
      "ManifestVersion": "v0",
      "Description": "A test plugin for Docker",
      "Documentation": "https://docs.docker.com/engine/extend/plugins/",
      "Interface": {
        "Types": [
          "docker.volumedriver/1.0"
        ],
        "Socket": "plugins.sock"
      },
      "Entrypoint": [
        "plugin-no-remove",
        "/data"
      ],
      "Workdir": "",
      "User": {
      },
      "Network": {
        "Type": "host"
      },
      "Capabilities": null,
      "Mounts": [
        {
          "Name": "",
          "Description": "",
          "Settable": null,
          "Source": "/data",
          "Destination": "/data",
          "Type": "bind",
          "Options": [
            "shared",
            "rbind"
          ]
        },
        {
          "Name": "",
          "Description": "",
          "Settable": null,
          "Source": null,
          "Destination": "/foobar",
          "Type": "tmpfs",
          "Options": null
        }
      ],
      "Devices": [
        {
          "Name": "device",
          "Description": "a host device to mount",
          "Settable": null,
          "Path": "/dev/cpu_dma_latency"
        }
      ],
      "Env": [
        {
          "Name": "DEBUG",
          "Description": "If set, prints debug messages",
          "Settable": null,
          "Value": "1"
        }
      ],
      "Args": {
        "Name": "args",
        "Description": "command line arguments",
        "Settable": null,
        "Value": [
@z

@x
        ]
      }
    }
  }
]
```
@y
        ]
      }
    }
  }
]
```
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
#### Install a plugin
@y
#### Install a plugin
@z

@x
`POST /plugins/pull?name=<plugin name>`
@y
`POST /plugins/pull?name=<plugin name>`
@z

@x
Pulls and installs a plugin. After the plugin is installed, it can be enabled
using the [`POST /plugins/(plugin name)/enable` endpoint](#enable-a-plugin).
@y
Pulls and installs a plugin. After the plugin is installed, it can be enabled
using the [`POST /plugins/(plugin name)/enable` endpoint](#enable-a-plugin).
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
POST /v1.24/plugins/pull?name=tiborvass/no-remove:latest HTTP/1.1
```
@y
```
POST /v1.24/plugins/pull?name=tiborvass/no-remove:latest HTTP/1.1
```
@z

@x
The `:latest` tag is optional, and is used as default if omitted. When using
this endpoint to pull a plugin from the registry, the `X-Registry-Auth` header
can be used to include a base64-encoded AuthConfig object. Refer to the [create
an image](#create-an-image) section for more details.
@y
The `:latest` tag is optional, and is used as default if omitted. When using
this endpoint to pull a plugin from the registry, the `X-Registry-Auth` header
can be used to include a base64-encoded AuthConfig object. Refer to the [create
an image](#create-an-image) section for more details.
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
Content-Length: 175
@y
```
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 175
@z

@x
[
  {
    "Name": "network",
    "Description": "",
    "Value": [
      "host"
    ]
  },
  {
    "Name": "mount",
    "Description": "",
    "Value": [
      "/data"
    ]
  },
  {
    "Name": "device",
    "Description": "",
    "Value": [
      "/dev/cpu_dma_latency"
    ]
  }
]
```
@y
[
  {
    "Name": "network",
    "Description": "",
    "Value": [
      "host"
    ]
  },
  {
    "Name": "mount",
    "Description": "",
    "Value": [
      "/data"
    ]
  },
  {
    "Name": "device",
    "Description": "",
    "Value": [
      "/dev/cpu_dma_latency"
    ]
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
- **name** -  Name of the plugin to pull. The name may include a tag or digest.
    This parameter is required.
@y
- **name** -  Name of the plugin to pull. The name may include a tag or digest.
    This parameter is required.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **500** - error parsing reference / not a valid repository/tag: repository
      name must have at least one component
-   **500** - plugin already exists
@y
-   **200** - no error
-   **500** - error parsing reference / not a valid repository/tag: repository
      name must have at least one component
-   **500** - plugin already exists
@z

@x
#### Inspect a plugin
@y
#### Inspect a plugin
@z

@x
`GET /plugins/(plugin name)`
@y
`GET /plugins/(plugin name)`
@z

@x
Returns detailed information about an installed plugin.
@y
Returns detailed information about an installed plugin.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
GET /v1.24/plugins/tiborvass/no-remove:latest HTTP/1.1
```
@y
```
GET /v1.24/plugins/tiborvass/no-remove:latest HTTP/1.1
```
@z

@x
The `:latest` tag is optional, and is used as default if omitted.
@y
The `:latest` tag is optional, and is used as default if omitted.
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
  "Id": "5724e2c8652da337ab2eedd19fc6fc0ec908e4bd907c7421bf6a8dfc70c4c078",
  "Name": "tiborvass/no-remove",
  "Tag": "latest",
  "Active": false,
  "Config": {
    "Mounts": [
      {
        "Name": "",
        "Description": "",
        "Settable": null,
        "Source": "/data",
        "Destination": "/data",
        "Type": "bind",
        "Options": [
          "shared",
          "rbind"
        ]
      },
      {
        "Name": "",
        "Description": "",
        "Settable": null,
        "Source": null,
        "Destination": "/foobar",
        "Type": "tmpfs",
        "Options": null
      }
    ],
    "Env": [
      "DEBUG=1"
    ],
    "Args": null,
    "Devices": null
  },
  "Manifest": {
    "ManifestVersion": "v0",
    "Description": "A test plugin for Docker",
    "Documentation": "https://docs.docker.com/engine/extend/plugins/",
    "Interface": {
      "Types": [
        "docker.volumedriver/1.0"
      ],
      "Socket": "plugins.sock"
    },
    "Entrypoint": [
      "plugin-no-remove",
      "/data"
    ],
    "Workdir": "",
    "User": {
    },
    "Network": {
      "Type": "host"
    },
    "Capabilities": null,
    "Mounts": [
      {
        "Name": "",
        "Description": "",
        "Settable": null,
        "Source": "/data",
        "Destination": "/data",
        "Type": "bind",
        "Options": [
          "shared",
          "rbind"
        ]
      },
      {
        "Name": "",
        "Description": "",
        "Settable": null,
        "Source": null,
        "Destination": "/foobar",
        "Type": "tmpfs",
        "Options": null
      }
    ],
    "Devices": [
      {
        "Name": "device",
        "Description": "a host device to mount",
        "Settable": null,
        "Path": "/dev/cpu_dma_latency"
      }
    ],
    "Env": [
      {
        "Name": "DEBUG",
        "Description": "If set, prints debug messages",
        "Settable": null,
        "Value": "1"
      }
    ],
    "Args": {
      "Name": "args",
      "Description": "command line arguments",
      "Settable": null,
      "Value": [
@y
{
  "Id": "5724e2c8652da337ab2eedd19fc6fc0ec908e4bd907c7421bf6a8dfc70c4c078",
  "Name": "tiborvass/no-remove",
  "Tag": "latest",
  "Active": false,
  "Config": {
    "Mounts": [
      {
        "Name": "",
        "Description": "",
        "Settable": null,
        "Source": "/data",
        "Destination": "/data",
        "Type": "bind",
        "Options": [
          "shared",
          "rbind"
        ]
      },
      {
        "Name": "",
        "Description": "",
        "Settable": null,
        "Source": null,
        "Destination": "/foobar",
        "Type": "tmpfs",
        "Options": null
      }
    ],
    "Env": [
      "DEBUG=1"
    ],
    "Args": null,
    "Devices": null
  },
  "Manifest": {
    "ManifestVersion": "v0",
    "Description": "A test plugin for Docker",
    "Documentation": "https://docs.docker.com/engine/extend/plugins/",
    "Interface": {
      "Types": [
        "docker.volumedriver/1.0"
      ],
      "Socket": "plugins.sock"
    },
    "Entrypoint": [
      "plugin-no-remove",
      "/data"
    ],
    "Workdir": "",
    "User": {
    },
    "Network": {
      "Type": "host"
    },
    "Capabilities": null,
    "Mounts": [
      {
        "Name": "",
        "Description": "",
        "Settable": null,
        "Source": "/data",
        "Destination": "/data",
        "Type": "bind",
        "Options": [
          "shared",
          "rbind"
        ]
      },
      {
        "Name": "",
        "Description": "",
        "Settable": null,
        "Source": null,
        "Destination": "/foobar",
        "Type": "tmpfs",
        "Options": null
      }
    ],
    "Devices": [
      {
        "Name": "device",
        "Description": "a host device to mount",
        "Settable": null,
        "Path": "/dev/cpu_dma_latency"
      }
    ],
    "Env": [
      {
        "Name": "DEBUG",
        "Description": "If set, prints debug messages",
        "Settable": null,
        "Value": "1"
      }
    ],
    "Args": {
      "Name": "args",
      "Description": "command line arguments",
      "Settable": null,
      "Value": [
@z

@x
      ]
    }
  }
}
```
@y
      ]
    }
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
-   **404** - plugin not installed
@y
-   **200** - no error
-   **404** - plugin not installed
@z

@x
#### Enable a plugin
@y
#### Enable a plugin
@z

@x
`POST /plugins/(plugin name)/enable`
@y
`POST /plugins/(plugin name)/enable`
@z

@x
Enables a plugin
@y
Enables a plugin
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
POST /v1.24/plugins/tiborvass/no-remove:latest/enable HTTP/1.1
```
@y
```
POST /v1.24/plugins/tiborvass/no-remove:latest/enable HTTP/1.1
```
@z

@x
The `:latest` tag is optional, and is used as default if omitted.
@y
The `:latest` tag is optional, and is used as default if omitted.
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
```
HTTP/1.1 200 OK
Content-Length: 0
Content-Type: text/plain; charset=utf-8
```
@y
```
HTTP/1.1 200 OK
Content-Length: 0
Content-Type: text/plain; charset=utf-8
```
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **404** - plugin not installed
-   **500** - plugin is already enabled
@y
-   **200** - no error
-   **404** - plugin not installed
-   **500** - plugin is already enabled
@z

@x
#### Disable a plugin
@y
#### Disable a plugin
@z

@x
`POST /plugins/(plugin name)/disable`
@y
`POST /plugins/(plugin name)/disable`
@z

@x
Disables a plugin
@y
Disables a plugin
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
POST /v1.24/plugins/tiborvass/no-remove:latest/disable HTTP/1.1
```
@y
```
POST /v1.24/plugins/tiborvass/no-remove:latest/disable HTTP/1.1
```
@z

@x
The `:latest` tag is optional, and is used as default if omitted.
@y
The `:latest` tag is optional, and is used as default if omitted.
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
```
HTTP/1.1 200 OK
Content-Length: 0
Content-Type: text/plain; charset=utf-8
```
@y
```
HTTP/1.1 200 OK
Content-Length: 0
Content-Type: text/plain; charset=utf-8
```
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **404** - plugin not installed
-   **500** - plugin is already disabled
@y
-   **200** - no error
-   **404** - plugin not installed
-   **500** - plugin is already disabled
@z

@x
#### Remove a plugin
@y
#### Remove a plugin
@z

@x
`DELETE /plugins/(plugin name)`
@y
`DELETE /plugins/(plugin name)`
@z

@x
Removes a plugin
@y
Removes a plugin
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
DELETE /v1.24/plugins/tiborvass/no-remove:latest HTTP/1.1
```
@y
```
DELETE /v1.24/plugins/tiborvass/no-remove:latest HTTP/1.1
```
@z

@x
The `:latest` tag is optional, and is used as default if omitted.
@y
The `:latest` tag is optional, and is used as default if omitted.
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
```
HTTP/1.1 200 OK
Content-Length: 0
Content-Type: text/plain; charset=utf-8
```
@y
```
HTTP/1.1 200 OK
Content-Length: 0
Content-Type: text/plain; charset=utf-8
```
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **404** - plugin not installed
-   **500** - plugin is active
@y
-   **200** - no error
-   **404** - plugin not installed
-   **500** - plugin is active
@z

@x
<!-- TODO Document "docker plugin push" endpoint once we have "plugin build"
@y
<!-- TODO Document "docker plugin push" endpoint once we have "plugin build"
@z

@x
#### Push a plugin
@y
#### Push a plugin
@z

@x
`POST /v1.24/plugins/tiborvass/(plugin name)/push HTTP/1.1`
@y
`POST /v1.24/plugins/tiborvass/(plugin name)/push HTTP/1.1`
@z

@x
Pushes a plugin to the registry.
@y
Pushes a plugin to the registry.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
```
POST /v1.24/plugins/tiborvass/no-remove:latest HTTP/1.1
```
@y
```
POST /v1.24/plugins/tiborvass/no-remove:latest HTTP/1.1
```
@z

@x
The `:latest` tag is optional, and is used as default if omitted. When using
this endpoint to push a plugin to the registry, the `X-Registry-Auth` header
can be used to include a base64-encoded AuthConfig object. Refer to the [create
an image](#create-an-image) section for more details.
@y
The `:latest` tag is optional, and is used as default if omitted. When using
this endpoint to push a plugin to the registry, the `X-Registry-Auth` header
can be used to include a base64-encoded AuthConfig object. Refer to the [create
an image](#create-an-image) section for more details.
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **404** - plugin not installed
@y
-   **200** - no error
-   **404** - plugin not installed
@z

@x
-->
@y
-->
@z

@x
### 3.7 Nodes
@y
### 3.7 Nodes
@z

@x
**Note**: Node operations require the engine to be part of a swarm.
@y
**Note**: Node operations require the engine to be part of a swarm.
@z

@x
#### List nodes
@y
#### List nodes
@z

@x
`GET /nodes`
@y
`GET /nodes`
@z

@x
List nodes
@y
List nodes
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.24/nodes HTTP/1.1
@y
    GET /v1.24/nodes HTTP/1.1
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
        "ID": "24ifsmvkjbyhk",
        "Version": {
          "Index": 8
        },
        "CreatedAt": "2016-06-07T20:31:11.853781916Z",
        "UpdatedAt": "2016-06-07T20:31:11.999868824Z",
        "Spec": {
          "Name": "my-node",
          "Role": "manager",
          "Availability": "active"
          "Labels": {
              "foo": "bar"
          }
        },
        "Description": {
          "Hostname": "bf3067039e47",
          "Platform": {
            "Architecture": "x86_64",
            "OS": "linux"
          },
          "Resources": {
            "NanoCPUs": 4000000000,
            "MemoryBytes": 8272408576
          },
          "Engine": {
            "EngineVersion": "1.12.0",
            "Labels": {
                "foo": "bar",
            }
            "Plugins": [
              {
                "Type": "Volume",
                "Name": "local"
              },
              {
                "Type": "Network",
                "Name": "bridge"
              }
              {
                "Type": "Network",
                "Name": "null"
              }
              {
                "Type": "Network",
                "Name": "overlay"
              }
            ]
          }
        },
        "Status": {
          "State": "ready"
        },
        "ManagerStatus": {
          "Leader": true,
          "Reachability": "reachable",
          "Addr": "172.17.0.2:2377""
        }
      }
    ]
@y
    [
      {
        "ID": "24ifsmvkjbyhk",
        "Version": {
          "Index": 8
        },
        "CreatedAt": "2016-06-07T20:31:11.853781916Z",
        "UpdatedAt": "2016-06-07T20:31:11.999868824Z",
        "Spec": {
          "Name": "my-node",
          "Role": "manager",
          "Availability": "active"
          "Labels": {
              "foo": "bar"
          }
        },
        "Description": {
          "Hostname": "bf3067039e47",
          "Platform": {
            "Architecture": "x86_64",
            "OS": "linux"
          },
          "Resources": {
            "NanoCPUs": 4000000000,
            "MemoryBytes": 8272408576
          },
          "Engine": {
            "EngineVersion": "1.12.0",
            "Labels": {
                "foo": "bar",
            }
            "Plugins": [
              {
                "Type": "Volume",
                "Name": "local"
              },
              {
                "Type": "Network",
                "Name": "bridge"
              }
              {
                "Type": "Network",
                "Name": "null"
              }
              {
                "Type": "Network",
                "Name": "overlay"
              }
            ]
          }
        },
        "Status": {
          "State": "ready"
        },
        "ManagerStatus": {
          "Leader": true,
          "Reachability": "reachable",
          "Addr": "172.17.0.2:2377""
        }
      }
    ]
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **filters** – a JSON encoded value of the filters (a `map[string][]string`) to process on the
  nodes list. Available filters:
  - `id=<node id>`
  - `label=<engine label>`
  - `membership=`(`accepted`|`pending`)`
  - `name=<node name>`
  - `role=`(`manager`|`worker`)`
@y
- **filters** – a JSON encoded value of the filters (a `map[string][]string`) to process on the
  nodes list. Available filters:
  - `id=<node id>`
  - `label=<engine label>`
  - `membership=`(`accepted`|`pending`)`
  - `name=<node name>`
  - `role=`(`manager`|`worker`)`
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **406** - node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **406** - node is not part of a swarm
-   **500** – server error
@z

@x
#### Inspect a node
@y
#### Inspect a node
@z

@x
`GET /nodes/(id or name)`
@y
`GET /nodes/(id or name)`
@z

@x
Return low-level information on the node `id`
@y
Return low-level information on the node `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
      GET /v1.24/nodes/24ifsmvkjbyhk HTTP/1.1
@y
      GET /v1.24/nodes/24ifsmvkjbyhk HTTP/1.1
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
      "ID": "24ifsmvkjbyhk",
      "Version": {
        "Index": 8
      },
      "CreatedAt": "2016-06-07T20:31:11.853781916Z",
      "UpdatedAt": "2016-06-07T20:31:11.999868824Z",
      "Spec": {
        "Name": "my-node",
        "Role": "manager",
        "Availability": "active"
        "Labels": {
            "foo": "bar"
        }
      },
      "Description": {
        "Hostname": "bf3067039e47",
        "Platform": {
          "Architecture": "x86_64",
          "OS": "linux"
        },
        "Resources": {
          "NanoCPUs": 4000000000,
          "MemoryBytes": 8272408576
        },
        "Engine": {
          "EngineVersion": "1.12.0",
          "Labels": {
              "foo": "bar",
          }
          "Plugins": [
            {
              "Type": "Volume",
              "Name": "local"
            },
            {
              "Type": "Network",
              "Name": "bridge"
            }
            {
              "Type": "Network",
              "Name": "null"
            }
            {
              "Type": "Network",
              "Name": "overlay"
            }
          ]
        }
      },
      "Status": {
        "State": "ready"
      },
      "ManagerStatus": {
        "Leader": true,
        "Reachability": "reachable",
        "Addr": "172.17.0.2:2377""
      }
    }
@y
    {
      "ID": "24ifsmvkjbyhk",
      "Version": {
        "Index": 8
      },
      "CreatedAt": "2016-06-07T20:31:11.853781916Z",
      "UpdatedAt": "2016-06-07T20:31:11.999868824Z",
      "Spec": {
        "Name": "my-node",
        "Role": "manager",
        "Availability": "active"
        "Labels": {
            "foo": "bar"
        }
      },
      "Description": {
        "Hostname": "bf3067039e47",
        "Platform": {
          "Architecture": "x86_64",
          "OS": "linux"
        },
        "Resources": {
          "NanoCPUs": 4000000000,
          "MemoryBytes": 8272408576
        },
        "Engine": {
          "EngineVersion": "1.12.0",
          "Labels": {
              "foo": "bar",
          }
          "Plugins": [
            {
              "Type": "Volume",
              "Name": "local"
            },
            {
              "Type": "Network",
              "Name": "bridge"
            }
            {
              "Type": "Network",
              "Name": "null"
            }
            {
              "Type": "Network",
              "Name": "overlay"
            }
          ]
        }
      },
      "Status": {
        "State": "ready"
      },
      "ManagerStatus": {
        "Leader": true,
        "Reachability": "reachable",
        "Addr": "172.17.0.2:2377""
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
-   **404** – no such node
-   **406** – node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such node
-   **406** – node is not part of a swarm
-   **500** – server error
@z

@x
#### Remove a node
@y
#### Remove a node
@z

@x
`DELETE /nodes/(id or name)`
@y
`DELETE /nodes/(id or name)`
@z

@x
Remove a node from the swarm.
@y
Remove a node from the swarm.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    DELETE /v1.24/nodes/24ifsmvkjbyhk HTTP/1.1
@y
    DELETE /v1.24/nodes/24ifsmvkjbyhk HTTP/1.1
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
-   **force** - 1/True/true or 0/False/false, Force remove a node from the swarm.
        Default `false`.
@y
-   **force** - 1/True/true or 0/False/false, Force remove a node from the swarm.
        Default `false`.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such node
-   **406** – node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such node
-   **406** – node is not part of a swarm
-   **500** – server error
@z

@x
#### Update a node
@y
#### Update a node
@z

@x
`POST /nodes/(id)/update`
@y
`POST /nodes/(id)/update`
@z

@x
Update a node.
@y
Update a node.
@z

@x
The payload of the `POST` request is the new `NodeSpec` and
overrides the current `NodeSpec` for the specified node.
@y
The payload of the `POST` request is the new `NodeSpec` and
overrides the current `NodeSpec` for the specified node.
@z

@x
If `Availability` or `Role` are omitted, this returns an
error. Any other field omitted resets the current value to either
an empty value or the default cluster-wide value.
@y
If `Availability` or `Role` are omitted, this returns an
error. Any other field omitted resets the current value to either
an empty value or the default cluster-wide value.
@z

@x
**Example Request**
@y
**Example Request**
@z

@x
    POST /v1.24/nodes/24ifsmvkjbyhk/update?version=8 HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/nodes/24ifsmvkjbyhk/update?version=8 HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
      "Availability": "active",
      "Name": "node-name",
      "Role": "manager",
      "Labels": {
        "foo": "bar"
      }
    }
@y
    {
      "Availability": "active",
      "Name": "node-name",
      "Role": "manager",
      "Labels": {
        "foo": "bar"
      }
    }
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
- **version** – The version number of the node object being updated. This is
  required to avoid conflicting writes.
@y
- **version** – The version number of the node object being updated. This is
  required to avoid conflicting writes.
@z

@x
JSON Parameters:
@y
JSON Parameters:
@z

@x
- **Annotations** – Optional medata to associate with the node.
    - **Name** – User-defined name for the node.
    - **Labels** – A map of labels to associate with the node (e.g.,
      `{"key":"value", "key2":"value2"}`).
- **Role** - Role of the node (worker|manager).
- **Availability** - Availability of the node (active|pause|drain).
@y
- **Annotations** – Optional medata to associate with the node.
    - **Name** – User-defined name for the node.
    - **Labels** – A map of labels to associate with the node (e.g.,
      `{"key":"value", "key2":"value2"}`).
- **Role** - Role of the node (worker|manager).
- **Availability** - Availability of the node (active|pause|drain).
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such node
-   **406** – node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such node
-   **406** – node is not part of a swarm
-   **500** – server error
@z

@x
### 3.8 Swarm
@y
### 3.8 Swarm
@z

@x
#### Inspect swarm
@y
#### Inspect swarm
@z

@x
`GET /swarm`
@y
`GET /swarm`
@z

@x
Inspect swarm
@y
Inspect swarm
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
      "CreatedAt" : "2016-08-15T16:00:20.349727406Z",
      "Spec" : {
        "Dispatcher" : {
          "HeartbeatPeriod" : 5000000000
        },
        "Orchestration" : {
         "TaskHistoryRetentionLimit" : 10
        },
        "CAConfig" : {
          "NodeCertExpiry" : 7776000000000000
        },
        "Raft" : {
          "LogEntriesForSlowFollowers" : 500,
          "HeartbeatTick" : 1,
          "SnapshotInterval" : 10000,
          "ElectionTick" : 3
        },
        "TaskDefaults" : {},
        "Name" : "default"
      },
     "JoinTokens" : {
        "Worker" : "SWMTKN-1-1h8aps2yszaiqmz2l3oc5392pgk8e49qhx2aj3nyv0ui0hez2a-6qmn92w6bu3jdvnglku58u11a",
        "Manager" : "SWMTKN-1-1h8aps2yszaiqmz2l3oc5392pgk8e49qhx2aj3nyv0ui0hez2a-8llk83c4wm9lwioey2s316r9l"
     },
     "ID" : "70ilmkj2f6sp2137c753w2nmt",
     "UpdatedAt" : "2016-08-15T16:32:09.623207604Z",
     "Version" : {
       "Index" : 51
    }
  }
@y
    {
      "CreatedAt" : "2016-08-15T16:00:20.349727406Z",
      "Spec" : {
        "Dispatcher" : {
          "HeartbeatPeriod" : 5000000000
        },
        "Orchestration" : {
         "TaskHistoryRetentionLimit" : 10
        },
        "CAConfig" : {
          "NodeCertExpiry" : 7776000000000000
        },
        "Raft" : {
          "LogEntriesForSlowFollowers" : 500,
          "HeartbeatTick" : 1,
          "SnapshotInterval" : 10000,
          "ElectionTick" : 3
        },
        "TaskDefaults" : {},
        "Name" : "default"
      },
     "JoinTokens" : {
        "Worker" : "SWMTKN-1-1h8aps2yszaiqmz2l3oc5392pgk8e49qhx2aj3nyv0ui0hez2a-6qmn92w6bu3jdvnglku58u11a",
        "Manager" : "SWMTKN-1-1h8aps2yszaiqmz2l3oc5392pgk8e49qhx2aj3nyv0ui0hez2a-8llk83c4wm9lwioey2s316r9l"
     },
     "ID" : "70ilmkj2f6sp2137c753w2nmt",
     "UpdatedAt" : "2016-08-15T16:32:09.623207604Z",
     "Version" : {
       "Index" : 51
    }
  }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** - no error
-   **406** – node is not part of a swarm
-   **500** - sever error
@y
-   **200** - no error
-   **406** – node is not part of a swarm
-   **500** - sever error
@z

@x
#### Initialize a new swarm
@y
#### Initialize a new swarm
@z

@x
`POST /swarm/init`
@y
`POST /swarm/init`
@z

@x
Initialize a new swarm. The body of the HTTP response includes the node ID.
@y
Initialize a new swarm. The body of the HTTP response includes the node ID.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/swarm/init HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/swarm/init HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
      "ListenAddr": "0.0.0.0:2377",
      "AdvertiseAddr": "192.168.1.1:2377",
      "ForceNewCluster": false,
      "Spec": {
        "Orchestration": {},
        "Raft": {},
        "Dispatcher": {},
        "CAConfig": {}
      }
    }
@y
    {
      "ListenAddr": "0.0.0.0:2377",
      "AdvertiseAddr": "192.168.1.1:2377",
      "ForceNewCluster": false,
      "Spec": {
        "Orchestration": {},
        "Raft": {},
        "Dispatcher": {},
        "CAConfig": {}
      }
    }
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    HTTP/1.1 200 OK
    Content-Length: 28
    Content-Type: application/json
    Date: Thu, 01 Sep 2016 21:49:13 GMT
    Server: Docker/1.12.0 (linux)
@y
    HTTP/1.1 200 OK
    Content-Length: 28
    Content-Type: application/json
    Date: Thu, 01 Sep 2016 21:49:13 GMT
    Server: Docker/1.12.0 (linux)
@z

@x
    "7v2t30z9blmxuhnyo6s4cpenp"
@y
    "7v2t30z9blmxuhnyo6s4cpenp"
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **400** – bad parameter
-   **406** – node is already part of a swarm
-   **500** - server error
@y
-   **200** – no error
-   **400** – bad parameter
-   **406** – node is already part of a swarm
-   **500** - server error
@z

@x
JSON Parameters:
@y
JSON Parameters:
@z

@x
- **ListenAddr** – Listen address used for inter-manager communication, as well as determining
  the networking interface used for the VXLAN Tunnel Endpoint (VTEP). This can either be an
  address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port
  number, like `eth0:4567`. If the port number is omitted, the default swarm listening port is
  used.
- **AdvertiseAddr** – Externally reachable address advertised to other nodes. This can either be
  an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port
  number, like `eth0:4567`. If the port number is omitted, the port number from the listen
  address is used. If `AdvertiseAddr` is not specified, it will be automatically detected when
  possible.
- **ForceNewCluster** – Force creation of a new swarm.
- **Spec** – Configuration settings for the new swarm.
    - **Orchestration** – Configuration settings for the orchestration aspects of the swarm.
        - **TaskHistoryRetentionLimit** – Maximum number of tasks history stored.
    - **Raft** – Raft related configuration.
        - **SnapshotInterval** – Number of logs entries between snapshot.
        - **KeepOldSnapshots** – Number of snapshots to keep beyond the current snapshot.
        - **LogEntriesForSlowFollowers** – Number of log entries to keep around to sync up slow
          followers after a snapshot is created.
        - **HeartbeatTick** – Amount of ticks (in seconds) between each heartbeat.
        - **ElectionTick** – Amount of ticks (in seconds) needed without a leader to trigger a new
          election.
    - **Dispatcher** – Configuration settings for the task dispatcher.
        - **HeartbeatPeriod** – The delay for an agent to send a heartbeat to the dispatcher.
    - **CAConfig** – Certificate authority configuration.
        - **NodeCertExpiry** – Automatic expiry for nodes certificates.
        - **ExternalCA** - Configuration for forwarding signing requests to an external
          certificate authority.
            - **Protocol** - Protocol for communication with the external CA
              (currently only "cfssl" is supported).
            - **URL** - URL where certificate signing requests should be sent.
            - **Options** - An object with key/value pairs that are interpreted
              as protocol-specific options for the external CA driver.
@y
- **ListenAddr** – Listen address used for inter-manager communication, as well as determining
  the networking interface used for the VXLAN Tunnel Endpoint (VTEP). This can either be an
  address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port
  number, like `eth0:4567`. If the port number is omitted, the default swarm listening port is
  used.
- **AdvertiseAddr** – Externally reachable address advertised to other nodes. This can either be
  an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port
  number, like `eth0:4567`. If the port number is omitted, the port number from the listen
  address is used. If `AdvertiseAddr` is not specified, it will be automatically detected when
  possible.
- **ForceNewCluster** – Force creation of a new swarm.
- **Spec** – Configuration settings for the new swarm.
    - **Orchestration** – Configuration settings for the orchestration aspects of the swarm.
        - **TaskHistoryRetentionLimit** – Maximum number of tasks history stored.
    - **Raft** – Raft related configuration.
        - **SnapshotInterval** – Number of logs entries between snapshot.
        - **KeepOldSnapshots** – Number of snapshots to keep beyond the current snapshot.
        - **LogEntriesForSlowFollowers** – Number of log entries to keep around to sync up slow
          followers after a snapshot is created.
        - **HeartbeatTick** – Amount of ticks (in seconds) between each heartbeat.
        - **ElectionTick** – Amount of ticks (in seconds) needed without a leader to trigger a new
          election.
    - **Dispatcher** – Configuration settings for the task dispatcher.
        - **HeartbeatPeriod** – The delay for an agent to send a heartbeat to the dispatcher.
    - **CAConfig** – Certificate authority configuration.
        - **NodeCertExpiry** – Automatic expiry for nodes certificates.
        - **ExternalCA** - Configuration for forwarding signing requests to an external
          certificate authority.
            - **Protocol** - Protocol for communication with the external CA
              (currently only "cfssl" is supported).
            - **URL** - URL where certificate signing requests should be sent.
            - **Options** - An object with key/value pairs that are interpreted
              as protocol-specific options for the external CA driver.
@z

@x
#### Join an existing swarm
@y
#### Join an existing swarm
@z

@x
`POST /swarm/join`
@y
`POST /swarm/join`
@z

@x
Join an existing swarm
@y
Join an existing swarm
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/swarm/join HTTP/1.1
    Content-Type: application/json
@y
    POST /v1.24/swarm/join HTTP/1.1
    Content-Type: application/json
@z

@x
    {
      "ListenAddr": "0.0.0.0:2377",
      "AdvertiseAddr": "192.168.1.1:2377",
      "RemoteAddrs": ["node1:2377"],
      "JoinToken": "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2"
    }
@y
    {
      "ListenAddr": "0.0.0.0:2377",
      "AdvertiseAddr": "192.168.1.1:2377",
      "RemoteAddrs": ["node1:2377"],
      "JoinToken": "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2"
    }
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
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **400** – bad parameter
-   **406** – node is already part of a swarm
-   **500** - server error
@y
-   **200** – no error
-   **400** – bad parameter
-   **406** – node is already part of a swarm
-   **500** - server error
@z

@x
JSON Parameters:
@y
JSON Parameters:
@z

@x
- **ListenAddr** – Listen address used for inter-manager communication if the node gets promoted to
  manager, as well as determining the networking interface used for the VXLAN Tunnel Endpoint (VTEP).
- **AdvertiseAddr** – Externally reachable address advertised to other nodes. This can either be
  an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port
  number, like `eth0:4567`. If the port number is omitted, the port number from the listen
  address is used. If `AdvertiseAddr` is not specified, it will be automatically detected when
  possible.
- **RemoteAddr** – Address of any manager node already participating in the swarm.
- **JoinToken** – Secret token for joining this swarm.
@y
- **ListenAddr** – Listen address used for inter-manager communication if the node gets promoted to
  manager, as well as determining the networking interface used for the VXLAN Tunnel Endpoint (VTEP).
- **AdvertiseAddr** – Externally reachable address advertised to other nodes. This can either be
  an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port
  number, like `eth0:4567`. If the port number is omitted, the port number from the listen
  address is used. If `AdvertiseAddr` is not specified, it will be automatically detected when
  possible.
- **RemoteAddr** – Address of any manager node already participating in the swarm.
- **JoinToken** – Secret token for joining this swarm.
@z

@x
#### Leave a swarm
@y
#### Leave a swarm
@z

@x
`POST /swarm/leave`
@y
`POST /swarm/leave`
@z

@x
Leave a swarm
@y
Leave a swarm
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/swarm/leave HTTP/1.1
@y
    POST /v1.24/swarm/leave HTTP/1.1
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
- **force** - Boolean (0/1, false/true). Force leave swarm, even if this is the last manager or that it will break the cluster.
@y
- **force** - Boolean (0/1, false/true). Force leave swarm, even if this is the last manager or that it will break the cluster.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-  **200** – no error
-  **406** – node is not part of a swarm
-  **500** - server error
@y
-  **200** – no error
-  **406** – node is not part of a swarm
-  **500** - server error
@z

@x
#### Update a swarm
@y
#### Update a swarm
@z

@x
`POST /swarm/update`
@y
`POST /swarm/update`
@z

@x
Update a swarm
@y
Update a swarm
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/swarm/update HTTP/1.1
    Content-Length: 12345
@y
    POST /v1.24/swarm/update HTTP/1.1
    Content-Length: 12345
@z

@x
    {
      "Name": "default",
      "Orchestration": {
        "TaskHistoryRetentionLimit": 10
      },
      "Raft": {
        "SnapshotInterval": 10000,
        "LogEntriesForSlowFollowers": 500,
        "HeartbeatTick": 1,
        "ElectionTick": 3
      },
      "Dispatcher": {
        "HeartbeatPeriod": 5000000000
      },
      "CAConfig": {
        "NodeCertExpiry": 7776000000000000
      },
      "JoinTokens": {
        "Worker": "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx",
        "Manager": "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2"
      }
    }
@y
    {
      "Name": "default",
      "Orchestration": {
        "TaskHistoryRetentionLimit": 10
      },
      "Raft": {
        "SnapshotInterval": 10000,
        "LogEntriesForSlowFollowers": 500,
        "HeartbeatTick": 1,
        "ElectionTick": 3
      },
      "Dispatcher": {
        "HeartbeatPeriod": 5000000000
      },
      "CAConfig": {
        "NodeCertExpiry": 7776000000000000
      },
      "JoinTokens": {
        "Worker": "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx",
        "Manager": "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2"
      }
    }
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
- **version** – The version number of the swarm object being updated. This is
  required to avoid conflicting writes.
- **rotateWorkerToken** - Set to `true` (or `1`) to rotate the worker join token.
- **rotateManagerToken** - Set to `true` (or `1`) to rotate the manager join token.
@y
- **version** – The version number of the swarm object being updated. This is
  required to avoid conflicting writes.
- **rotateWorkerToken** - Set to `true` (or `1`) to rotate the worker join token.
- **rotateManagerToken** - Set to `true` (or `1`) to rotate the manager join token.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **400** – bad parameter
-   **406** – node is not part of a swarm
-   **500** - server error
@y
-   **200** – no error
-   **400** – bad parameter
-   **406** – node is not part of a swarm
-   **500** - server error
@z

@x
JSON Parameters:
@y
JSON Parameters:
@z

@x
- **Orchestration** – Configuration settings for the orchestration aspects of the swarm.
    - **TaskHistoryRetentionLimit** – Maximum number of tasks history stored.
- **Raft** – Raft related configuration.
    - **SnapshotInterval** – Number of logs entries between snapshot.
    - **KeepOldSnapshots** – Number of snapshots to keep beyond the current snapshot.
    - **LogEntriesForSlowFollowers** – Number of log entries to keep around to sync up slow
      followers after a snapshot is created.
    - **HeartbeatTick** – Amount of ticks (in seconds) between each heartbeat.
    - **ElectionTick** – Amount of ticks (in seconds) needed without a leader to trigger a new
      election.
- **Dispatcher** – Configuration settings for the task dispatcher.
    - **HeartbeatPeriod** – The delay for an agent to send a heartbeat to the dispatcher.
- **CAConfig** – CA configuration.
    - **NodeCertExpiry** – Automatic expiry for nodes certificates.
    - **ExternalCA** - Configuration for forwarding signing requests to an external
      certificate authority.
        - **Protocol** - Protocol for communication with the external CA
          (currently only "cfssl" is supported).
        - **URL** - URL where certificate signing requests should be sent.
        - **Options** - An object with key/value pairs that are interpreted
          as protocol-specific options for the external CA driver.
- **JoinTokens** - Tokens that can be used by other nodes to join the swarm.
    - **Worker** - Token to use for joining as a worker.
    - **Manager** - Token to use for joining as a manager.
@y
- **Orchestration** – Configuration settings for the orchestration aspects of the swarm.
    - **TaskHistoryRetentionLimit** – Maximum number of tasks history stored.
- **Raft** – Raft related configuration.
    - **SnapshotInterval** – Number of logs entries between snapshot.
    - **KeepOldSnapshots** – Number of snapshots to keep beyond the current snapshot.
    - **LogEntriesForSlowFollowers** – Number of log entries to keep around to sync up slow
      followers after a snapshot is created.
    - **HeartbeatTick** – Amount of ticks (in seconds) between each heartbeat.
    - **ElectionTick** – Amount of ticks (in seconds) needed without a leader to trigger a new
      election.
- **Dispatcher** – Configuration settings for the task dispatcher.
    - **HeartbeatPeriod** – The delay for an agent to send a heartbeat to the dispatcher.
- **CAConfig** – CA configuration.
    - **NodeCertExpiry** – Automatic expiry for nodes certificates.
    - **ExternalCA** - Configuration for forwarding signing requests to an external
      certificate authority.
        - **Protocol** - Protocol for communication with the external CA
          (currently only "cfssl" is supported).
        - **URL** - URL where certificate signing requests should be sent.
        - **Options** - An object with key/value pairs that are interpreted
          as protocol-specific options for the external CA driver.
- **JoinTokens** - Tokens that can be used by other nodes to join the swarm.
    - **Worker** - Token to use for joining as a worker.
    - **Manager** - Token to use for joining as a manager.
@z

@x
### 3.9 Services
@y
### 3.9 Services
@z

@x
**Note**: Service operations require to first be part of a swarm.
@y
**Note**: Service operations require to first be part of a swarm.
@z

@x
#### List services
@y
#### List services
@z

@x
`GET /services`
@y
`GET /services`
@z

@x
List services
@y
List services
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.24/services HTTP/1.1
@y
    GET /v1.24/services HTTP/1.1
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
        "ID": "9mnpnzenvg8p8tdbtq4wvbkcz",
        "Version": {
          "Index": 19
        },
        "CreatedAt": "2016-06-07T21:05:51.880065305Z",
        "UpdatedAt": "2016-06-07T21:07:29.962229872Z",
        "Spec": {
          "Name": "hopeful_cori",
          "TaskTemplate": {
            "ContainerSpec": {
              "Image": "redis"
            },
            "Resources": {
              "Limits": {},
              "Reservations": {}
            },
            "RestartPolicy": {
              "Condition": "any",
              "MaxAttempts": 0
            },
            "Placement": {
              "Constraints": [
                "node.role == worker"
              ]
            }
          },
          "Mode": {
            "Replicated": {
              "Replicas": 1
            }
          },
          "UpdateConfig": {
            "Parallelism": 1,
            "FailureAction": "pause"
          },
          "EndpointSpec": {
            "Mode": "vip",
            "Ports": [
              {
                "Protocol": "tcp",
                "TargetPort": 6379,
                "PublishedPort": 30001
              }
            ]
          }
        },
        "Endpoint": {
          "Spec": {
            "Mode": "vip",
            "Ports": [
              {
                "Protocol": "tcp",
                "TargetPort": 6379,
                "PublishedPort": 30001
              }
            ]
          },
          "Ports": [
            {
              "Protocol": "tcp",
              "TargetPort": 6379,
              "PublishedPort": 30001
            }
          ],
          "VirtualIPs": [
            {
              "NetworkID": "4qvuz4ko70xaltuqbt8956gd1",
              "Addr": "10.255.0.2/16"
            },
            {
              "NetworkID": "4qvuz4ko70xaltuqbt8956gd1",
              "Addr": "10.255.0.3/16"
            }
          ]
        }
      }
    ]
@y
    [
      {
        "ID": "9mnpnzenvg8p8tdbtq4wvbkcz",
        "Version": {
          "Index": 19
        },
        "CreatedAt": "2016-06-07T21:05:51.880065305Z",
        "UpdatedAt": "2016-06-07T21:07:29.962229872Z",
        "Spec": {
          "Name": "hopeful_cori",
          "TaskTemplate": {
            "ContainerSpec": {
              "Image": "redis"
            },
            "Resources": {
              "Limits": {},
              "Reservations": {}
            },
            "RestartPolicy": {
              "Condition": "any",
              "MaxAttempts": 0
            },
            "Placement": {
              "Constraints": [
                "node.role == worker"
              ]
            }
          },
          "Mode": {
            "Replicated": {
              "Replicas": 1
            }
          },
          "UpdateConfig": {
            "Parallelism": 1,
            "FailureAction": "pause"
          },
          "EndpointSpec": {
            "Mode": "vip",
            "Ports": [
              {
                "Protocol": "tcp",
                "TargetPort": 6379,
                "PublishedPort": 30001
              }
            ]
          }
        },
        "Endpoint": {
          "Spec": {
            "Mode": "vip",
            "Ports": [
              {
                "Protocol": "tcp",
                "TargetPort": 6379,
                "PublishedPort": 30001
              }
            ]
          },
          "Ports": [
            {
              "Protocol": "tcp",
              "TargetPort": 6379,
              "PublishedPort": 30001
            }
          ],
          "VirtualIPs": [
            {
              "NetworkID": "4qvuz4ko70xaltuqbt8956gd1",
              "Addr": "10.255.0.2/16"
            },
            {
              "NetworkID": "4qvuz4ko70xaltuqbt8956gd1",
              "Addr": "10.255.0.3/16"
            }
          ]
        }
      }
    ]
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **filters** – a JSON encoded value of the filters (a `map[string][]string`) to process on the
  services list. Available filters:
  - `id=<service id>`
  - `label=<service label>`
  - `name=<service name>`
@y
- **filters** – a JSON encoded value of the filters (a `map[string][]string`) to process on the
  services list. Available filters:
  - `id=<service id>`
  - `label=<service label>`
  - `name=<service name>`
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **406** – node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **406** – node is not part of a swarm
-   **500** – server error
@z

@x
#### Create a service
@y
#### Create a service
@z

@x
`POST /services/create`
@y
`POST /services/create`
@z

@x
Create a service. When using this endpoint to create a service using a private
repository from the registry, the `X-Registry-Auth` header must be used to
include a base64-encoded AuthConfig object. Refer to the [create an
image](#create-an-image) section for more details.
@y
Create a service. When using this endpoint to create a service using a private
repository from the registry, the `X-Registry-Auth` header must be used to
include a base64-encoded AuthConfig object. Refer to the [create an
image](#create-an-image) section for more details.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/services/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/services/create HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
      "Name": "web",
      "TaskTemplate": {
        "ContainerSpec": {
          "Image": "nginx:alpine",
          "Mounts": [
            {
              "ReadOnly": true,
              "Source": "web-data",
              "Target": "/usr/share/nginx/html",
              "Type": "volume",
              "VolumeOptions": {
                "DriverConfig": {
                },
                "Labels": {
                  "com.example.something": "something-value"
                }
              }
            }
          ],
          "User": "33"
        },
        "Networks": [
            {
              "Target": "overlay1"
            }
        ],
        "LogDriver": {
          "Name": "json-file",
          "Options": {
            "max-file": "3",
            "max-size": "10M"
          }
        },
        "Placement": {
          "Constraints": [
            "node.role == worker"
          ]
        },
        "Resources": {
          "Limits": {
            "MemoryBytes": 104857600
          },
          "Reservations": {
          }
        },
        "RestartPolicy": {
          "Condition": "on-failure",
          "Delay": 10000000000,
          "MaxAttempts": 10
        }
      },
      "Mode": {
        "Replicated": {
          "Replicas": 4
        }
      },
      "UpdateConfig": {
        "Delay": 30000000000,
        "Parallelism": 2,
        "FailureAction": "pause"
      },
      "EndpointSpec": {
        "Ports": [
          {
            "Protocol": "tcp",
            "PublishedPort": 8080,
            "TargetPort": 80
          }
        ]
      },
      "Labels": {
        "foo": "bar"
      }
    }
@y
    {
      "Name": "web",
      "TaskTemplate": {
        "ContainerSpec": {
          "Image": "nginx:alpine",
          "Mounts": [
            {
              "ReadOnly": true,
              "Source": "web-data",
              "Target": "/usr/share/nginx/html",
              "Type": "volume",
              "VolumeOptions": {
                "DriverConfig": {
                },
                "Labels": {
                  "com.example.something": "something-value"
                }
              }
            }
          ],
          "User": "33"
        },
        "Networks": [
            {
              "Target": "overlay1"
            }
        ],
        "LogDriver": {
          "Name": "json-file",
          "Options": {
            "max-file": "3",
            "max-size": "10M"
          }
        },
        "Placement": {
          "Constraints": [
            "node.role == worker"
          ]
        },
        "Resources": {
          "Limits": {
            "MemoryBytes": 104857600
          },
          "Reservations": {
          }
        },
        "RestartPolicy": {
          "Condition": "on-failure",
          "Delay": 10000000000,
          "MaxAttempts": 10
        }
      },
      "Mode": {
        "Replicated": {
          "Replicas": 4
        }
      },
      "UpdateConfig": {
        "Delay": 30000000000,
        "Parallelism": 2,
        "FailureAction": "pause"
      },
      "EndpointSpec": {
        "Ports": [
          {
            "Protocol": "tcp",
            "PublishedPort": 8080,
            "TargetPort": 80
          }
        ]
      },
      "Labels": {
        "foo": "bar"
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
      "ID":"ak7w3gjqoa3kuz8xcpnyy0pvl"
    }
@y
    {
      "ID":"ak7w3gjqoa3kuz8xcpnyy0pvl"
    }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **201** – no error
-   **403** - network is not eligible for services
-   **406** – node is not part of a swarm
-   **409** – name conflicts with an existing object
-   **500** - server error
@y
-   **201** – no error
-   **403** - network is not eligible for services
-   **406** – node is not part of a swarm
-   **409** – name conflicts with an existing object
-   **500** - server error
@z

@x
**JSON Parameters**:
@y
**JSON Parameters**:
@z

@x
- **Name** – User-defined name for the service.
- **Labels** – A map of labels to associate with the service (e.g., `{"key":"value", "key2":"value2"}`).
- **TaskTemplate** – Specification of the tasks to start as part of the new service.
    - **ContainerSpec** - Container settings for containers started as part of this task.
        - **Image** – A string specifying the image name to use for the container.
        - **Command** – The command to be run in the image.
        - **Args** – Arguments to the command.
        - **Env** – A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`.
        - **Dir** – A string specifying the working directory for commands to run in.
        - **User** – A string value specifying the user inside the container.
        - **Labels** – A map of labels to associate with the service (e.g.,
          `{"key":"value", "key2":"value2"}`).
        - **Mounts** – Specification for mounts to be added to containers
          created as part of the service.
            - **Target** – Container path.
            - **Source** – Mount source (e.g. a volume name, a host path).
            - **Type** – The mount type (`bind`, or `volume`).
            - **ReadOnly** – A boolean indicating whether the mount should be read-only.
            - **BindOptions** - Optional configuration for the `bind` type.
              - **Propagation** – A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
            - **VolumeOptions** – Optional configuration for the `volume` type.
                - **NoCopy** – A boolean indicating if volume should be
                  populated with the data from the target. (Default false)
                - **Labels** – User-defined name and labels for the volume.
                - **DriverConfig** – Map of driver-specific options.
                  - **Name** - Name of the driver to use to create the volume.
                  - **Options** - key/value map of driver specific options.
        - **StopGracePeriod** – Amount of time to wait for the container to terminate before
          forcefully killing it.
    - **LogDriver** - Log configuration for containers created as part of the
      service.
        - **Name** - Name of the logging driver to use (`json-file`, `syslog`,
          `journald`, `gelf`, `fluentd`, `awslogs`, `splunk`, `etwlogs`, `none`).
        - **Options** - Driver-specific options.
    - **Resources** – Resource requirements which apply to each individual container created as part
      of the service.
        - **Limits** – Define resources limits.
            - **NanoCPUs** – CPU limit in units of 10<sup>-9</sup> CPU shares.
            - **MemoryBytes** – Memory limit in Bytes.
        - **Reservation** – Define resources reservation.
            - **NanoCPUs** – CPU reservation in units of 10<sup>-9</sup> CPU shares.
            - **MemoryBytes** – Memory reservation in Bytes.
    - **RestartPolicy** – Specification for the restart policy which applies to containers created
      as part of this service.
        - **Condition** – Condition for restart (`none`, `on-failure`, or `any`).
        - **Delay** – Delay between restart attempts.
        - **MaxAttempts** – Maximum attempts to restart a given container before giving up (default value
          is 0, which is ignored).
        - **Window** – Windows is the time window used to evaluate the restart policy (default value is
          0, which is unbounded).
    - **Placement** – Restrictions on where a service can run.
        - **Constraints** – An array of constraints, e.g. `[ "node.role == manager" ]`.
- **Mode** – Scheduling mode for the service (`replicated` or `global`, defaults to `replicated`).
- **UpdateConfig** – Specification for the update strategy of the service.
    - **Parallelism** – Maximum number of tasks to be updated in one iteration (0 means unlimited
      parallelism).
    - **Delay** – Amount of time between updates.
    - **FailureAction** - Action to take if an updated task fails to run, or stops running during the
      update. Values are `continue` and `pause`.
- **Networks** – Array of network names or IDs to attach the service to.
- **EndpointSpec** – Properties that can be configured to access and load balance a service.
    - **Mode** – The mode of resolution to use for internal load balancing
      between tasks (`vip` or `dnsrr`). Defaults to `vip` if not provided.
    - **Ports** – List of exposed ports that this service is accessible on from
      the outside, in the form of:
      `{"Protocol": <"tcp"|"udp">, "PublishedPort": <port>, "TargetPort": <port>}`.
      Ports can only be provided if `vip` resolution mode is used.
@y
- **Name** – User-defined name for the service.
- **Labels** – A map of labels to associate with the service (e.g., `{"key":"value", "key2":"value2"}`).
- **TaskTemplate** – Specification of the tasks to start as part of the new service.
    - **ContainerSpec** - Container settings for containers started as part of this task.
        - **Image** – A string specifying the image name to use for the container.
        - **Command** – The command to be run in the image.
        - **Args** – Arguments to the command.
        - **Env** – A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`.
        - **Dir** – A string specifying the working directory for commands to run in.
        - **User** – A string value specifying the user inside the container.
        - **Labels** – A map of labels to associate with the service (e.g.,
          `{"key":"value", "key2":"value2"}`).
        - **Mounts** – Specification for mounts to be added to containers
          created as part of the service.
            - **Target** – Container path.
            - **Source** – Mount source (e.g. a volume name, a host path).
            - **Type** – The mount type (`bind`, or `volume`).
            - **ReadOnly** – A boolean indicating whether the mount should be read-only.
            - **BindOptions** - Optional configuration for the `bind` type.
              - **Propagation** – A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
            - **VolumeOptions** – Optional configuration for the `volume` type.
                - **NoCopy** – A boolean indicating if volume should be
                  populated with the data from the target. (Default false)
                - **Labels** – User-defined name and labels for the volume.
                - **DriverConfig** – Map of driver-specific options.
                  - **Name** - Name of the driver to use to create the volume.
                  - **Options** - key/value map of driver specific options.
        - **StopGracePeriod** – Amount of time to wait for the container to terminate before
          forcefully killing it.
    - **LogDriver** - Log configuration for containers created as part of the
      service.
        - **Name** - Name of the logging driver to use (`json-file`, `syslog`,
          `journald`, `gelf`, `fluentd`, `awslogs`, `splunk`, `etwlogs`, `none`).
        - **Options** - Driver-specific options.
    - **Resources** – Resource requirements which apply to each individual container created as part
      of the service.
        - **Limits** – Define resources limits.
            - **NanoCPUs** – CPU limit in units of 10<sup>-9</sup> CPU shares.
            - **MemoryBytes** – Memory limit in Bytes.
        - **Reservation** – Define resources reservation.
            - **NanoCPUs** – CPU reservation in units of 10<sup>-9</sup> CPU shares.
            - **MemoryBytes** – Memory reservation in Bytes.
    - **RestartPolicy** – Specification for the restart policy which applies to containers created
      as part of this service.
        - **Condition** – Condition for restart (`none`, `on-failure`, or `any`).
        - **Delay** – Delay between restart attempts.
        - **MaxAttempts** – Maximum attempts to restart a given container before giving up (default value
          is 0, which is ignored).
        - **Window** – Windows is the time window used to evaluate the restart policy (default value is
          0, which is unbounded).
    - **Placement** – Restrictions on where a service can run.
        - **Constraints** – An array of constraints, e.g. `[ "node.role == manager" ]`.
- **Mode** – Scheduling mode for the service (`replicated` or `global`, defaults to `replicated`).
- **UpdateConfig** – Specification for the update strategy of the service.
    - **Parallelism** – Maximum number of tasks to be updated in one iteration (0 means unlimited
      parallelism).
    - **Delay** – Amount of time between updates.
    - **FailureAction** - Action to take if an updated task fails to run, or stops running during the
      update. Values are `continue` and `pause`.
- **Networks** – Array of network names or IDs to attach the service to.
- **EndpointSpec** – Properties that can be configured to access and load balance a service.
    - **Mode** – The mode of resolution to use for internal load balancing
      between tasks (`vip` or `dnsrr`). Defaults to `vip` if not provided.
    - **Ports** – List of exposed ports that this service is accessible on from
      the outside, in the form of:
      `{"Protocol": <"tcp"|"udp">, "PublishedPort": <port>, "TargetPort": <port>}`.
      Ports can only be provided if `vip` resolution mode is used.
@z

@x
**Request Headers**:
@y
**Request Headers**:
@z

@x
- **Content-type** – Set to `"application/json"`.
- **X-Registry-Auth** – base64-encoded AuthConfig object, containing either
  login information, or a token. Refer to the [create an image](#create-an-image)
  section for more details.
@y
- **Content-type** – Set to `"application/json"`.
- **X-Registry-Auth** – base64-encoded AuthConfig object, containing either
  login information, or a token. Refer to the [create an image](#create-an-image)
  section for more details.
@z

@x
#### Remove a service
@y
#### Remove a service
@z

@x
`DELETE /services/(id or name)`
@y
`DELETE /services/(id or name)`
@z

@x
Stop and remove the service `id`
@y
Stop and remove the service `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    DELETE /v1.24/services/16253994b7c4 HTTP/1.1
@y
    DELETE /v1.24/services/16253994b7c4 HTTP/1.1
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
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such service
-   **406** - node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such service
-   **406** - node is not part of a swarm
-   **500** – server error
@z

@x
#### Inspect one or more services
@y
#### Inspect one or more services
@z

@x
`GET /services/(id or name)`
@y
`GET /services/(id or name)`
@z

@x
Return information on the service `id`.
@y
Return information on the service `id`.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.24/services/1cb4dnqcyx6m66g2t538x3rxha HTTP/1.1
@y
    GET /v1.24/services/1cb4dnqcyx6m66g2t538x3rxha HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    {
      "ID": "ak7w3gjqoa3kuz8xcpnyy0pvl",
      "Version": {
        "Index": 95
      },
      "CreatedAt": "2016-06-07T21:10:20.269723157Z",
      "UpdatedAt": "2016-06-07T21:10:20.276301259Z",
      "Spec": {
        "Name": "redis",
        "TaskTemplate": {
          "ContainerSpec": {
            "Image": "redis"
          },
          "Resources": {
            "Limits": {},
            "Reservations": {}
          },
          "RestartPolicy": {
            "Condition": "any",
            "MaxAttempts": 0
          },
          "Placement": {}
        },
        "Mode": {
          "Replicated": {
            "Replicas": 1
          }
        },
        "UpdateConfig": {
          "Parallelism": 1,
          "FailureAction": "pause"
        },
        "EndpointSpec": {
          "Mode": "vip",
          "Ports": [
            {
              "Protocol": "tcp",
              "TargetPort": 6379,
              "PublishedPort": 30001
            }
          ]
        }
      },
      "Endpoint": {
        "Spec": {
          "Mode": "vip",
          "Ports": [
            {
              "Protocol": "tcp",
              "TargetPort": 6379,
              "PublishedPort": 30001
            }
          ]
        },
        "Ports": [
          {
            "Protocol": "tcp",
            "TargetPort": 6379,
            "PublishedPort": 30001
          }
        ],
        "VirtualIPs": [
          {
            "NetworkID": "4qvuz4ko70xaltuqbt8956gd1",
            "Addr": "10.255.0.4/16"
          }
        ]
      }
    }
@y
    {
      "ID": "ak7w3gjqoa3kuz8xcpnyy0pvl",
      "Version": {
        "Index": 95
      },
      "CreatedAt": "2016-06-07T21:10:20.269723157Z",
      "UpdatedAt": "2016-06-07T21:10:20.276301259Z",
      "Spec": {
        "Name": "redis",
        "TaskTemplate": {
          "ContainerSpec": {
            "Image": "redis"
          },
          "Resources": {
            "Limits": {},
            "Reservations": {}
          },
          "RestartPolicy": {
            "Condition": "any",
            "MaxAttempts": 0
          },
          "Placement": {}
        },
        "Mode": {
          "Replicated": {
            "Replicas": 1
          }
        },
        "UpdateConfig": {
          "Parallelism": 1,
          "FailureAction": "pause"
        },
        "EndpointSpec": {
          "Mode": "vip",
          "Ports": [
            {
              "Protocol": "tcp",
              "TargetPort": 6379,
              "PublishedPort": 30001
            }
          ]
        }
      },
      "Endpoint": {
        "Spec": {
          "Mode": "vip",
          "Ports": [
            {
              "Protocol": "tcp",
              "TargetPort": 6379,
              "PublishedPort": 30001
            }
          ]
        },
        "Ports": [
          {
            "Protocol": "tcp",
            "TargetPort": 6379,
            "PublishedPort": 30001
          }
        ],
        "VirtualIPs": [
          {
            "NetworkID": "4qvuz4ko70xaltuqbt8956gd1",
            "Addr": "10.255.0.4/16"
          }
        ]
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
-   **404** – no such service
-   **406** - node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such service
-   **406** - node is not part of a swarm
-   **500** – server error
@z

@x
#### Update a service
@y
#### Update a service
@z

@x
`POST /services/(id)/update`
@y
`POST /services/(id)/update`
@z

@x
Update a service. When using this endpoint to create a service using a
private repository from the registry, the `X-Registry-Auth` header can be used
to update the authentication information for that is stored for the service.
The header contains a base64-encoded AuthConfig object. Refer to the [create an
image](#create-an-image) section for more details.
@y
Update a service. When using this endpoint to create a service using a
private repository from the registry, the `X-Registry-Auth` header can be used
to update the authentication information for that is stored for the service.
The header contains a base64-encoded AuthConfig object. Refer to the [create an
image](#create-an-image) section for more details.
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    POST /v1.24/services/1cb4dnqcyx6m66g2t538x3rxha/update?version=23 HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@y
    POST /v1.24/services/1cb4dnqcyx6m66g2t538x3rxha/update?version=23 HTTP/1.1
    Content-Type: application/json
    Content-Length: 12345
@z

@x
    {
      "Name": "top",
      "TaskTemplate": {
        "ContainerSpec": {
          "Image": "busybox",
          "Args": [
            "top"
          ]
        },
        "Resources": {
          "Limits": {},
          "Reservations": {}
        },
        "RestartPolicy": {
          "Condition": "any",
          "MaxAttempts": 0
        },
        "Placement": {}
      },
      "Mode": {
        "Replicated": {
          "Replicas": 1
        }
      },
      "UpdateConfig": {
        "Parallelism": 1
      },
      "EndpointSpec": {
        "Mode": "vip"
      }
    }
@y
    {
      "Name": "top",
      "TaskTemplate": {
        "ContainerSpec": {
          "Image": "busybox",
          "Args": [
            "top"
          ]
        },
        "Resources": {
          "Limits": {},
          "Reservations": {}
        },
        "RestartPolicy": {
          "Condition": "any",
          "MaxAttempts": 0
        },
        "Placement": {}
      },
      "Mode": {
        "Replicated": {
          "Replicas": 1
        }
      },
      "UpdateConfig": {
        "Parallelism": 1
      },
      "EndpointSpec": {
        "Mode": "vip"
      }
    }
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
**JSON Parameters**:
@y
**JSON Parameters**:
@z

@x
- **Name** – User-defined name for the service. Note that renaming services is not supported.
- **Labels** – A map of labels to associate with the service (e.g., `{"key":"value", "key2":"value2"}`).
- **TaskTemplate** – Specification of the tasks to start as part of the new service.
    - **ContainerSpec** - Container settings for containers started as part of this task.
        - **Image** – A string specifying the image name to use for the container.
        - **Command** – The command to be run in the image.
        - **Args** – Arguments to the command.
        - **Env** – A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`.
        - **Dir** – A string specifying the working directory for commands to run in.
        - **User** – A string value specifying the user inside the container.
        - **Labels** – A map of labels to associate with the service (e.g.,
          `{"key":"value", "key2":"value2"}`).
        - **Mounts** – Specification for mounts to be added to containers created as part of the new
          service.
            - **Target** – Container path.
            - **Source** – Mount source (e.g. a volume name, a host path).
            - **Type** – The mount type (`bind`, or `volume`).
            - **ReadOnly** – A boolean indicating whether the mount should be read-only.
            - **BindOptions** - Optional configuration for the `bind` type
              - **Propagation** – A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
            - **VolumeOptions** – Optional configuration for the `volume` type.
                - **NoCopy** – A boolean indicating if volume should be
                  populated with the data from the target. (Default false)
                - **Labels** – User-defined name and labels for the volume.
                - **DriverConfig** – Map of driver-specific options.
                  - **Name** - Name of the driver to use to create the volume
                  - **Options** - key/value map of driver specific options
        - **StopGracePeriod** – Amount of time to wait for the container to terminate before
          forcefully killing it.
    - **Resources** – Resource requirements which apply to each individual container created as part
      of the service.
        - **Limits** – Define resources limits.
            - **CPU** – CPU limit
            - **Memory** – Memory limit
        - **Reservation** – Define resources reservation.
            - **CPU** – CPU reservation
            - **Memory** – Memory reservation
    - **RestartPolicy** – Specification for the restart policy which applies to containers created
      as part of this service.
        - **Condition** – Condition for restart (`none`, `on-failure`, or `any`).
        - **Delay** – Delay between restart attempts.
        - **MaxAttempts** – Maximum attempts to restart a given container before giving up (default value
          is 0, which is ignored).
        - **Window** – Windows is the time window used to evaluate the restart policy (default value is
          0, which is unbounded).
    - **Placement** – Restrictions on where a service can run.
        - **Constraints** – An array of constraints, e.g. `[ "node.role == manager" ]`.
- **Mode** – Scheduling mode for the service (`replicated` or `global`, defaults to `replicated`).
- **UpdateConfig** – Specification for the update strategy of the service.
    - **Parallelism** – Maximum number of tasks to be updated in one iteration (0 means unlimited
      parallelism).
    - **Delay** – Amount of time between updates.
- **Networks** – Array of network names or IDs to attach the service to.
- **EndpointSpec** – Properties that can be configured to access and load balance a service.
    - **Mode** – The mode of resolution to use for internal load balancing
      between tasks (`vip` or `dnsrr`). Defaults to `vip` if not provided.
    - **Ports** – List of exposed ports that this service is accessible on from
      the outside, in the form of:
      `{"Protocol": <"tcp"|"udp">, "PublishedPort": <port>, "TargetPort": <port>}`.
      Ports can only be provided if `vip` resolution mode is used.
@y
- **Name** – User-defined name for the service. Note that renaming services is not supported.
- **Labels** – A map of labels to associate with the service (e.g., `{"key":"value", "key2":"value2"}`).
- **TaskTemplate** – Specification of the tasks to start as part of the new service.
    - **ContainerSpec** - Container settings for containers started as part of this task.
        - **Image** – A string specifying the image name to use for the container.
        - **Command** – The command to be run in the image.
        - **Args** – Arguments to the command.
        - **Env** – A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`.
        - **Dir** – A string specifying the working directory for commands to run in.
        - **User** – A string value specifying the user inside the container.
        - **Labels** – A map of labels to associate with the service (e.g.,
          `{"key":"value", "key2":"value2"}`).
        - **Mounts** – Specification for mounts to be added to containers created as part of the new
          service.
            - **Target** – Container path.
            - **Source** – Mount source (e.g. a volume name, a host path).
            - **Type** – The mount type (`bind`, or `volume`).
            - **ReadOnly** – A boolean indicating whether the mount should be read-only.
            - **BindOptions** - Optional configuration for the `bind` type
              - **Propagation** – A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
            - **VolumeOptions** – Optional configuration for the `volume` type.
                - **NoCopy** – A boolean indicating if volume should be
                  populated with the data from the target. (Default false)
                - **Labels** – User-defined name and labels for the volume.
                - **DriverConfig** – Map of driver-specific options.
                  - **Name** - Name of the driver to use to create the volume
                  - **Options** - key/value map of driver specific options
        - **StopGracePeriod** – Amount of time to wait for the container to terminate before
          forcefully killing it.
    - **Resources** – Resource requirements which apply to each individual container created as part
      of the service.
        - **Limits** – Define resources limits.
            - **CPU** – CPU limit
            - **Memory** – Memory limit
        - **Reservation** – Define resources reservation.
            - **CPU** – CPU reservation
            - **Memory** – Memory reservation
    - **RestartPolicy** – Specification for the restart policy which applies to containers created
      as part of this service.
        - **Condition** – Condition for restart (`none`, `on-failure`, or `any`).
        - **Delay** – Delay between restart attempts.
        - **MaxAttempts** – Maximum attempts to restart a given container before giving up (default value
          is 0, which is ignored).
        - **Window** – Windows is the time window used to evaluate the restart policy (default value is
          0, which is unbounded).
    - **Placement** – Restrictions on where a service can run.
        - **Constraints** – An array of constraints, e.g. `[ "node.role == manager" ]`.
- **Mode** – Scheduling mode for the service (`replicated` or `global`, defaults to `replicated`).
- **UpdateConfig** – Specification for the update strategy of the service.
    - **Parallelism** – Maximum number of tasks to be updated in one iteration (0 means unlimited
      parallelism).
    - **Delay** – Amount of time between updates.
- **Networks** – Array of network names or IDs to attach the service to.
- **EndpointSpec** – Properties that can be configured to access and load balance a service.
    - **Mode** – The mode of resolution to use for internal load balancing
      between tasks (`vip` or `dnsrr`). Defaults to `vip` if not provided.
    - **Ports** – List of exposed ports that this service is accessible on from
      the outside, in the form of:
      `{"Protocol": <"tcp"|"udp">, "PublishedPort": <port>, "TargetPort": <port>}`.
      Ports can only be provided if `vip` resolution mode is used.
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **version** – The version number of the service object being updated. This is
  required to avoid conflicting writes.
@y
- **version** – The version number of the service object being updated. This is
  required to avoid conflicting writes.
@z

@x
**Request Headers**:
@y
**Request Headers**:
@z

@x
- **Content-type** – Set to `"application/json"`.
- **X-Registry-Auth** – base64-encoded AuthConfig object, containing either
  login information, or a token. Refer to the [create an image](#create-an-image)
  section for more details.
@y
- **Content-type** – Set to `"application/json"`.
- **X-Registry-Auth** – base64-encoded AuthConfig object, containing either
  login information, or a token. Refer to the [create an image](#create-an-image)
  section for more details.
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – no such service
-   **406** - node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **404** – no such service
-   **406** - node is not part of a swarm
-   **500** – server error
@z

@x
### 3.10 Tasks
@y
### 3.10 Tasks
@z

@x
**Note**: Task operations require the engine to be part of a swarm.
@y
**Note**: Task operations require the engine to be part of a swarm.
@z

@x
#### List tasks
@y
#### List tasks
@z

@x
`GET /tasks`
@y
`GET /tasks`
@z

@x
List tasks
@y
List tasks
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.24/tasks HTTP/1.1
@y
    GET /v1.24/tasks HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    [
      {
        "ID": "0kzzo1i0y4jz6027t0k7aezc7",
        "Version": {
          "Index": 71
        },
        "CreatedAt": "2016-06-07T21:07:31.171892745Z",
        "UpdatedAt": "2016-06-07T21:07:31.376370513Z",
        "Spec": {
          "ContainerSpec": {
            "Image": "redis"
          },
          "Resources": {
            "Limits": {},
            "Reservations": {}
          },
          "RestartPolicy": {
            "Condition": "any",
            "MaxAttempts": 0
          },
          "Placement": {}
        },
        "ServiceID": "9mnpnzenvg8p8tdbtq4wvbkcz",
        "Slot": 1,
        "NodeID": "60gvrl6tm78dmak4yl7srz94v",
        "Status": {
          "Timestamp": "2016-06-07T21:07:31.290032978Z",
          "State": "running",
          "Message": "started",
          "ContainerStatus": {
            "ContainerID": "e5d62702a1b48d01c3e02ca1e0212a250801fa8d67caca0b6f35919ebc12f035",
            "PID": 677
          }
        },
        "DesiredState": "running",
        "NetworksAttachments": [
          {
            "Network": {
              "ID": "4qvuz4ko70xaltuqbt8956gd1",
              "Version": {
                "Index": 18
              },
              "CreatedAt": "2016-06-07T20:31:11.912919752Z",
              "UpdatedAt": "2016-06-07T21:07:29.955277358Z",
              "Spec": {
                "Name": "ingress",
                "Labels": {
                  "com.docker.swarm.internal": "true"
                },
                "DriverConfiguration": {},
                "IPAMOptions": {
                  "Driver": {},
                  "Configs": [
                    {
                      "Subnet": "10.255.0.0/16",
                      "Gateway": "10.255.0.1"
                    }
                  ]
                }
              },
              "DriverState": {
                "Name": "overlay",
                "Options": {
                  "com.docker.network.driver.overlay.vxlanid_list": "256"
                }
              },
              "IPAMOptions": {
                "Driver": {
                  "Name": "default"
                },
                "Configs": [
                  {
                    "Subnet": "10.255.0.0/16",
                    "Gateway": "10.255.0.1"
                  }
                ]
              }
            },
            "Addresses": [
              "10.255.0.10/16"
            ]
          }
        ],
      },
      {
        "ID": "1yljwbmlr8er2waf8orvqpwms",
        "Version": {
          "Index": 30
        },
        "CreatedAt": "2016-06-07T21:07:30.019104782Z",
        "UpdatedAt": "2016-06-07T21:07:30.231958098Z",
        "Name": "hopeful_cori",
        "Spec": {
          "ContainerSpec": {
            "Image": "redis"
          },
          "Resources": {
            "Limits": {},
            "Reservations": {}
          },
          "RestartPolicy": {
            "Condition": "any",
            "MaxAttempts": 0
          },
          "Placement": {}
        },
        "ServiceID": "9mnpnzenvg8p8tdbtq4wvbkcz",
        "Slot": 1,
        "NodeID": "60gvrl6tm78dmak4yl7srz94v",
        "Status": {
          "Timestamp": "2016-06-07T21:07:30.202183143Z",
          "State": "shutdown",
          "Message": "shutdown",
          "ContainerStatus": {
            "ContainerID": "1cf8d63d18e79668b0004a4be4c6ee58cddfad2dae29506d8781581d0688a213"
          }
        },
        "DesiredState": "shutdown",
        "NetworksAttachments": [
          {
            "Network": {
              "ID": "4qvuz4ko70xaltuqbt8956gd1",
              "Version": {
                "Index": 18
              },
              "CreatedAt": "2016-06-07T20:31:11.912919752Z",
              "UpdatedAt": "2016-06-07T21:07:29.955277358Z",
              "Spec": {
                "Name": "ingress",
                "Labels": {
                  "com.docker.swarm.internal": "true"
                },
                "DriverConfiguration": {},
                "IPAMOptions": {
                  "Driver": {},
                  "Configs": [
                    {
                      "Subnet": "10.255.0.0/16",
                      "Gateway": "10.255.0.1"
                    }
                  ]
                }
              },
              "DriverState": {
                "Name": "overlay",
                "Options": {
                  "com.docker.network.driver.overlay.vxlanid_list": "256"
                }
              },
              "IPAMOptions": {
                "Driver": {
                  "Name": "default"
                },
                "Configs": [
                  {
                    "Subnet": "10.255.0.0/16",
                    "Gateway": "10.255.0.1"
                  }
                ]
              }
            },
            "Addresses": [
              "10.255.0.5/16"
            ]
          }
        ]
      }
    ]
@y
    [
      {
        "ID": "0kzzo1i0y4jz6027t0k7aezc7",
        "Version": {
          "Index": 71
        },
        "CreatedAt": "2016-06-07T21:07:31.171892745Z",
        "UpdatedAt": "2016-06-07T21:07:31.376370513Z",
        "Spec": {
          "ContainerSpec": {
            "Image": "redis"
          },
          "Resources": {
            "Limits": {},
            "Reservations": {}
          },
          "RestartPolicy": {
            "Condition": "any",
            "MaxAttempts": 0
          },
          "Placement": {}
        },
        "ServiceID": "9mnpnzenvg8p8tdbtq4wvbkcz",
        "Slot": 1,
        "NodeID": "60gvrl6tm78dmak4yl7srz94v",
        "Status": {
          "Timestamp": "2016-06-07T21:07:31.290032978Z",
          "State": "running",
          "Message": "started",
          "ContainerStatus": {
            "ContainerID": "e5d62702a1b48d01c3e02ca1e0212a250801fa8d67caca0b6f35919ebc12f035",
            "PID": 677
          }
        },
        "DesiredState": "running",
        "NetworksAttachments": [
          {
            "Network": {
              "ID": "4qvuz4ko70xaltuqbt8956gd1",
              "Version": {
                "Index": 18
              },
              "CreatedAt": "2016-06-07T20:31:11.912919752Z",
              "UpdatedAt": "2016-06-07T21:07:29.955277358Z",
              "Spec": {
                "Name": "ingress",
                "Labels": {
                  "com.docker.swarm.internal": "true"
                },
                "DriverConfiguration": {},
                "IPAMOptions": {
                  "Driver": {},
                  "Configs": [
                    {
                      "Subnet": "10.255.0.0/16",
                      "Gateway": "10.255.0.1"
                    }
                  ]
                }
              },
              "DriverState": {
                "Name": "overlay",
                "Options": {
                  "com.docker.network.driver.overlay.vxlanid_list": "256"
                }
              },
              "IPAMOptions": {
                "Driver": {
                  "Name": "default"
                },
                "Configs": [
                  {
                    "Subnet": "10.255.0.0/16",
                    "Gateway": "10.255.0.1"
                  }
                ]
              }
            },
            "Addresses": [
              "10.255.0.10/16"
            ]
          }
        ],
      },
      {
        "ID": "1yljwbmlr8er2waf8orvqpwms",
        "Version": {
          "Index": 30
        },
        "CreatedAt": "2016-06-07T21:07:30.019104782Z",
        "UpdatedAt": "2016-06-07T21:07:30.231958098Z",
        "Name": "hopeful_cori",
        "Spec": {
          "ContainerSpec": {
            "Image": "redis"
          },
          "Resources": {
            "Limits": {},
            "Reservations": {}
          },
          "RestartPolicy": {
            "Condition": "any",
            "MaxAttempts": 0
          },
          "Placement": {}
        },
        "ServiceID": "9mnpnzenvg8p8tdbtq4wvbkcz",
        "Slot": 1,
        "NodeID": "60gvrl6tm78dmak4yl7srz94v",
        "Status": {
          "Timestamp": "2016-06-07T21:07:30.202183143Z",
          "State": "shutdown",
          "Message": "shutdown",
          "ContainerStatus": {
            "ContainerID": "1cf8d63d18e79668b0004a4be4c6ee58cddfad2dae29506d8781581d0688a213"
          }
        },
        "DesiredState": "shutdown",
        "NetworksAttachments": [
          {
            "Network": {
              "ID": "4qvuz4ko70xaltuqbt8956gd1",
              "Version": {
                "Index": 18
              },
              "CreatedAt": "2016-06-07T20:31:11.912919752Z",
              "UpdatedAt": "2016-06-07T21:07:29.955277358Z",
              "Spec": {
                "Name": "ingress",
                "Labels": {
                  "com.docker.swarm.internal": "true"
                },
                "DriverConfiguration": {},
                "IPAMOptions": {
                  "Driver": {},
                  "Configs": [
                    {
                      "Subnet": "10.255.0.0/16",
                      "Gateway": "10.255.0.1"
                    }
                  ]
                }
              },
              "DriverState": {
                "Name": "overlay",
                "Options": {
                  "com.docker.network.driver.overlay.vxlanid_list": "256"
                }
              },
              "IPAMOptions": {
                "Driver": {
                  "Name": "default"
                },
                "Configs": [
                  {
                    "Subnet": "10.255.0.0/16",
                    "Gateway": "10.255.0.1"
                  }
                ]
              }
            },
            "Addresses": [
              "10.255.0.5/16"
            ]
          }
        ]
      }
    ]
@z

@x
**Query parameters**:
@y
**Query parameters**:
@z

@x
- **filters** – a JSON encoded value of the filters (a `map[string][]string`) to process on the
  services list. Available filters:
  - `id=<task id>`
  - `name=<task name>`
  - `service=<service name>`
  - `node=<node id or name>`
  - `label=key` or `label="key=value"`
  - `desired-state=(running | shutdown | accepted)`
@y
- **filters** – a JSON encoded value of the filters (a `map[string][]string`) to process on the
  services list. Available filters:
  - `id=<task id>`
  - `name=<task name>`
  - `service=<service name>`
  - `node=<node id or name>`
  - `label=key` or `label="key=value"`
  - `desired-state=(running | shutdown | accepted)`
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **406** - node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **406** - node is not part of a swarm
-   **500** – server error
@z

@x
#### Inspect a task
@y
#### Inspect a task
@z

@x
`GET /tasks/(id)`
@y
`GET /tasks/(id)`
@z

@x
Get details on the task `id`
@y
Get details on the task `id`
@z

@x
**Example request**:
@y
**Example request**:
@z

@x
    GET /v1.24/tasks/0kzzo1i0y4jz6027t0k7aezc7 HTTP/1.1
@y
    GET /v1.24/tasks/0kzzo1i0y4jz6027t0k7aezc7 HTTP/1.1
@z

@x
**Example response**:
@y
**Example response**:
@z

@x
    {
      "ID": "0kzzo1i0y4jz6027t0k7aezc7",
      "Version": {
        "Index": 71
      },
      "CreatedAt": "2016-06-07T21:07:31.171892745Z",
      "UpdatedAt": "2016-06-07T21:07:31.376370513Z",
      "Spec": {
        "ContainerSpec": {
          "Image": "redis"
        },
        "Resources": {
          "Limits": {},
          "Reservations": {}
        },
        "RestartPolicy": {
          "Condition": "any",
          "MaxAttempts": 0
        },
        "Placement": {}
      },
      "ServiceID": "9mnpnzenvg8p8tdbtq4wvbkcz",
      "Slot": 1,
      "NodeID": "60gvrl6tm78dmak4yl7srz94v",
      "Status": {
        "Timestamp": "2016-06-07T21:07:31.290032978Z",
        "State": "running",
        "Message": "started",
        "ContainerStatus": {
          "ContainerID": "e5d62702a1b48d01c3e02ca1e0212a250801fa8d67caca0b6f35919ebc12f035",
          "PID": 677
        }
      },
      "DesiredState": "running",
      "NetworksAttachments": [
        {
          "Network": {
            "ID": "4qvuz4ko70xaltuqbt8956gd1",
            "Version": {
              "Index": 18
            },
            "CreatedAt": "2016-06-07T20:31:11.912919752Z",
            "UpdatedAt": "2016-06-07T21:07:29.955277358Z",
            "Spec": {
              "Name": "ingress",
              "Labels": {
                "com.docker.swarm.internal": "true"
              },
              "DriverConfiguration": {},
              "IPAMOptions": {
                "Driver": {},
                "Configs": [
                  {
                    "Subnet": "10.255.0.0/16",
                    "Gateway": "10.255.0.1"
                  }
                ]
              }
            },
            "DriverState": {
              "Name": "overlay",
              "Options": {
                "com.docker.network.driver.overlay.vxlanid_list": "256"
              }
            },
            "IPAMOptions": {
              "Driver": {
                "Name": "default"
              },
              "Configs": [
                {
                  "Subnet": "10.255.0.0/16",
                  "Gateway": "10.255.0.1"
                }
              ]
            }
          },
          "Addresses": [
            "10.255.0.10/16"
          ]
        }
      ]
    }
@y
    {
      "ID": "0kzzo1i0y4jz6027t0k7aezc7",
      "Version": {
        "Index": 71
      },
      "CreatedAt": "2016-06-07T21:07:31.171892745Z",
      "UpdatedAt": "2016-06-07T21:07:31.376370513Z",
      "Spec": {
        "ContainerSpec": {
          "Image": "redis"
        },
        "Resources": {
          "Limits": {},
          "Reservations": {}
        },
        "RestartPolicy": {
          "Condition": "any",
          "MaxAttempts": 0
        },
        "Placement": {}
      },
      "ServiceID": "9mnpnzenvg8p8tdbtq4wvbkcz",
      "Slot": 1,
      "NodeID": "60gvrl6tm78dmak4yl7srz94v",
      "Status": {
        "Timestamp": "2016-06-07T21:07:31.290032978Z",
        "State": "running",
        "Message": "started",
        "ContainerStatus": {
          "ContainerID": "e5d62702a1b48d01c3e02ca1e0212a250801fa8d67caca0b6f35919ebc12f035",
          "PID": 677
        }
      },
      "DesiredState": "running",
      "NetworksAttachments": [
        {
          "Network": {
            "ID": "4qvuz4ko70xaltuqbt8956gd1",
            "Version": {
              "Index": 18
            },
            "CreatedAt": "2016-06-07T20:31:11.912919752Z",
            "UpdatedAt": "2016-06-07T21:07:29.955277358Z",
            "Spec": {
              "Name": "ingress",
              "Labels": {
                "com.docker.swarm.internal": "true"
              },
              "DriverConfiguration": {},
              "IPAMOptions": {
                "Driver": {},
                "Configs": [
                  {
                    "Subnet": "10.255.0.0/16",
                    "Gateway": "10.255.0.1"
                  }
                ]
              }
            },
            "DriverState": {
              "Name": "overlay",
              "Options": {
                "com.docker.network.driver.overlay.vxlanid_list": "256"
              }
            },
            "IPAMOptions": {
              "Driver": {
                "Name": "default"
              },
              "Configs": [
                {
                  "Subnet": "10.255.0.0/16",
                  "Gateway": "10.255.0.1"
                }
              ]
            }
          },
          "Addresses": [
            "10.255.0.10/16"
          ]
        }
      ]
    }
@z

@x
**Status codes**:
@y
**Status codes**:
@z

@x
-   **200** – no error
-   **404** – unknown task
-   **406** - node is not part of a swarm
-   **500** – server error
@y
-   **200** – no error
-   **404** – unknown task
-   **406** - node is not part of a swarm
-   **500** – server error
@z

@x
## 4. Going further
@y
## 4. Going further
@z

@x
### 4.1 Inside `docker run`
@y
### 4.1 Inside `docker run`
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
### 4.2 Hijacking
@y
### 4.2 Hijacking
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
### 4.3 CORS Requests
@y
### 4.3 CORS Requests
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
