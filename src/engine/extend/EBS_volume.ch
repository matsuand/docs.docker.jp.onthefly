%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Volume plugin for Amazon EBS
keywords: "API, Usage, plugins, documentation, developer, amazon, ebs, rexray, volume"
---
@y
---
description: Volume plugin for Amazon EBS
keywords: "API, Usage, plugins, documentation, developer, amazon, ebs, rexray, volume"
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
# Volume plugin for Amazon EBS
@y
# Volume plugin for Amazon EBS
@z

@x
## A proof-of-concept Rexray plugin
@y
## A proof-of-concept Rexray plugin
@z

@x
In this example, a simple Rexray plugin will be created for the purposes of using
it on an Amazon EC2 instance with EBS. It is not meant to be a complete Rexray plugin.
@y
In this example, a simple Rexray plugin will be created for the purposes of using
it on an Amazon EC2 instance with EBS. It is not meant to be a complete Rexray plugin.
@z

@x
The example source is available at [https://github.com/tiborvass/rexray-plugin](https://github.com/tiborvass/rexray-plugin).
@y
The example source is available at [https://github.com/tiborvass/rexray-plugin](https://github.com/tiborvass/rexray-plugin).
@z

@x
To learn more about Rexray: [https://github.com/codedellemc/rexray](https://github.com/codedellemc/rexray)
@y
To learn more about Rexray: [https://github.com/codedellemc/rexray](https://github.com/codedellemc/rexray)
@z

@x
## 1. Make a Docker image
@y
## 1. Make a Docker image
@z

@x
The following is the Dockerfile used to containerize rexray.
@y
The following is the Dockerfile used to containerize rexray.
@z

@x
```Dockerfile
FROM debian:jessie
RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates
RUN wget https://dl.bintray.com/emccode/rexray/stable/0.6.4/rexray-Linux-x86_64-0.6.4.tar.gz -O rexray.tar.gz && tar -xvzf rexray.tar.gz -C /usr/bin && rm rexray.tar.gz
RUN mkdir -p /run/docker/plugins /var/lib/libstorage/volumes
ENTRYPOINT ["rexray"]
CMD ["--help"]
```
@y
```Dockerfile
FROM debian:jessie
RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates
RUN wget https://dl.bintray.com/emccode/rexray/stable/0.6.4/rexray-Linux-x86_64-0.6.4.tar.gz -O rexray.tar.gz && tar -xvzf rexray.tar.gz -C /usr/bin && rm rexray.tar.gz
RUN mkdir -p /run/docker/plugins /var/lib/libstorage/volumes
ENTRYPOINT ["rexray"]
CMD ["--help"]
```
@z

@x
To build it you can run `image=$(cat Dockerfile | docker build -q -)` and `$image`
will reference the containerized rexray image.
@y
To build it you can run `image=$(cat Dockerfile | docker build -q -)` and `$image`
will reference the containerized rexray image.
@z

@x
## 2. Extract rootfs
@y
## 2. Extract rootfs
@z

@x
```sh
$ TMPDIR=/tmp/rexray  # for the purpose of this example
$  # create container without running it, to extract the rootfs from image
$ docker create --name rexray "$image"
$  # save the rootfs to a tar archive
$ docker export -o $TMPDIR/rexray.tar rexray
$  # extract rootfs from tar archive to a rootfs folder
$ ( mkdir -p $TMPDIR/rootfs; cd $TMPDIR/rootfs; tar xf ../rexray.tar )
```
@y
```sh
$ TMPDIR=/tmp/rexray  # for the purpose of this example
$  # create container without running it, to extract the rootfs from image
$ docker create --name rexray "$image"
$  # save the rootfs to a tar archive
$ docker export -o $TMPDIR/rexray.tar rexray
$  # extract rootfs from tar archive to a rootfs folder
$ ( mkdir -p $TMPDIR/rootfs; cd $TMPDIR/rootfs; tar xf ../rexray.tar )
```
@z

@x
## 3. Add plugin configuration
@y
## 3. Add plugin configuration
@z

@x
We have to put the following JSON to `$TMPDIR/config.json`:
@y
We have to put the following JSON to `$TMPDIR/config.json`:
@z

@x
```json
{
      "Args": {
        "Description": "",
        "Name": "",
        "Settable": null,
        "Value": null
      },
      "Description": "A proof-of-concept EBS plugin (using rexray) for Docker",
      "Documentation": "https://github.com/tiborvass/rexray-plugin",
      "Entrypoint": [
        "/usr/bin/rexray", "service", "start", "-f"
      ],
      "Env": [
        {
          "Description": "",
          "Name": "REXRAY_SERVICE",
          "Settable": [
            "value"
          ],
          "Value": "ebs"
        },
        {
          "Description": "",
          "Name": "EBS_ACCESSKEY",
          "Settable": [
            "value"
          ],
          "Value": ""
        },
        {
          "Description": "",
          "Name": "EBS_SECRETKEY",
          "Settable": [
            "value"
          ],
          "Value": ""
        }
      ],
      "Interface": {
        "Socket": "rexray.sock",
        "Types": [
          "docker.volumedriver/1.0"
        ]
      },
      "Linux": {
        "AllowAllDevices": true,
        "Capabilities": ["CAP_SYS_ADMIN"],
        "Devices": null
      },
      "Mounts": [
        {
          "Source": "/dev",
          "Destination": "/dev",
          "Type": "bind",
          "Options": ["rbind"]
        }
      ],
      "Network": {
        "Type": "host"
      },
      "PropagatedMount": "/var/lib/libstorage/volumes",
      "User": {},
      "WorkDir": ""
}
```
@y
```json
{
      "Args": {
        "Description": "",
        "Name": "",
        "Settable": null,
        "Value": null
      },
      "Description": "A proof-of-concept EBS plugin (using rexray) for Docker",
      "Documentation": "https://github.com/tiborvass/rexray-plugin",
      "Entrypoint": [
        "/usr/bin/rexray", "service", "start", "-f"
      ],
      "Env": [
        {
          "Description": "",
          "Name": "REXRAY_SERVICE",
          "Settable": [
            "value"
          ],
          "Value": "ebs"
        },
        {
          "Description": "",
          "Name": "EBS_ACCESSKEY",
          "Settable": [
            "value"
          ],
          "Value": ""
        },
        {
          "Description": "",
          "Name": "EBS_SECRETKEY",
          "Settable": [
            "value"
          ],
          "Value": ""
        }
      ],
      "Interface": {
        "Socket": "rexray.sock",
        "Types": [
          "docker.volumedriver/1.0"
        ]
      },
      "Linux": {
        "AllowAllDevices": true,
        "Capabilities": ["CAP_SYS_ADMIN"],
        "Devices": null
      },
      "Mounts": [
        {
          "Source": "/dev",
          "Destination": "/dev",
          "Type": "bind",
          "Options": ["rbind"]
        }
      ],
      "Network": {
        "Type": "host"
      },
      "PropagatedMount": "/var/lib/libstorage/volumes",
      "User": {},
      "WorkDir": ""
}
```
@z

@x
Please note a couple of points:
- `PropagatedMount` is needed so that the docker daemon can see mounts done by the
rexray plugin from within the container, otherwise the docker daemon is not able
to mount a docker volume.
- The rexray plugin needs dynamic access to host devices. For that reason, we
have to give it access to all devices under `/dev` and set `AllowAllDevices` to
true for proper access.
- The user of this simple plugin can change only 3 settings: `REXRAY_SERVICE`,
`EBS_ACCESSKEY` and `EBS_SECRETKEY`. This is because of the reduced scope of this
plugin. Ideally other rexray parameters could also be set.
@y
Please note a couple of points:
- `PropagatedMount` is needed so that the docker daemon can see mounts done by the
rexray plugin from within the container, otherwise the docker daemon is not able
to mount a docker volume.
- The rexray plugin needs dynamic access to host devices. For that reason, we
have to give it access to all devices under `/dev` and set `AllowAllDevices` to
true for proper access.
- The user of this simple plugin can change only 3 settings: `REXRAY_SERVICE`,
`EBS_ACCESSKEY` and `EBS_SECRETKEY`. This is because of the reduced scope of this
plugin. Ideally other rexray parameters could also be set.
@z

@x
## 4. Create plugin
@y
## 4. Create plugin
@z

@x
`docker plugin create tiborvass/rexray-plugin "$TMPDIR"` will create the plugin.
@y
`docker plugin create tiborvass/rexray-plugin "$TMPDIR"` will create the plugin.
@z

@x
```sh
$ docker plugin ls
ID                  NAME                             DESCRIPTION                         ENABLED
2475a4bd0ca5        tiborvass/rexray-plugin:latest   A rexray volume plugin for Docker   false
```
@y
```sh
$ docker plugin ls
ID                  NAME                             DESCRIPTION                         ENABLED
2475a4bd0ca5        tiborvass/rexray-plugin:latest   A rexray volume plugin for Docker   false
```
@z

@x
## 5. Test plugin
@y
## 5. Test plugin
@z

@x
```sh
$ docker plugin set tiborvass/rexray-plugin EBS_ACCESSKEY=$AWS_ACCESSKEY EBS_SECRETKEY=$AWS_SECRETKEY`
$ docker plugin enable tiborvass/rexray-plugin
$ docker volume create -d tiborvass/rexray-plugin my-ebs-volume
$ docker volume ls
DRIVER                              VOLUME NAME
tiborvass/rexray-plugin:latest      my-ebs-volume
$ docker run --rm -v my-ebs-volume:/volume busybox sh -c 'echo bye > /volume/hi'
$ docker run --rm -v my-ebs-volume:/volume busybox cat /volume/hi
bye
```
@y
```sh
$ docker plugin set tiborvass/rexray-plugin EBS_ACCESSKEY=$AWS_ACCESSKEY EBS_SECRETKEY=$AWS_SECRETKEY`
$ docker plugin enable tiborvass/rexray-plugin
$ docker volume create -d tiborvass/rexray-plugin my-ebs-volume
$ docker volume ls
DRIVER                              VOLUME NAME
tiborvass/rexray-plugin:latest      my-ebs-volume
$ docker run --rm -v my-ebs-volume:/volume busybox sh -c 'echo bye > /volume/hi'
$ docker run --rm -v my-ebs-volume:/volume busybox cat /volume/hi
bye
```
@z

@x
## 6. Push plugin
@y
## 6. Push plugin
@z

@x
First, ensure you are logged in with `docker login`. Then you can run:
`docker plugin push tiborvass/rexray-plugin` to push it like a regular docker
image to a registry, to make it available for others to install via
`docker plugin install tiborvass/rexray-plugin EBS_ACCESSKEY=$AWS_ACCESSKEY EBS_SECRETKEY=$AWS_SECRETKEY`.
@y
First, ensure you are logged in with `docker login`. Then you can run:
`docker plugin push tiborvass/rexray-plugin` to push it like a regular docker
image to a registry, to make it available for others to install via
`docker plugin install tiborvass/rexray-plugin EBS_ACCESSKEY=$AWS_ACCESSKEY EBS_SECRETKEY=$AWS_SECRETKEY`.
@z
