%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: VMware Fusion driver for machine
keywords: machine, VMware Fusion, driver
title: VMware Fusion
---
@y
---
description: VMware Fusion driver for machine
keywords: machine, VMware Fusion, driver
title: VMware Fusion
---
@z

@x
Creates machines locally on [VMware Fusion](https://www.vmware.com/products/fusion.html). Requires VMware Fusion to be installed.
@y
Creates machines locally on [VMware Fusion](https://www.vmware.com/products/fusion.html). Requires VMware Fusion to be installed.
@z

@x
## Usage
@y
## Usage
@z

@x
    $ docker-machine create --driver vmwarefusion vm
@y
    $ docker-machine create --driver vmwarefusion vm
@z

@x
## Options
@y
## Options
@z

@x
-   `--vmwarefusion-boot2docker-url`: URL for boot2docker image.
-   `--vmwarefusion-cpu-count`: Number of CPUs for the machine (-1 to use the number of CPUs available)
-   `--vmwarefusion-disk-size`: Size of disk for host VM (in MB).
-   `--vmwarefusion-memory-size`: Size of memory for host VM (in MB).
-   `--vmwarefusion-no-share`: Disable the mount of your home directory.
@y
-   `--vmwarefusion-boot2docker-url`: URL for boot2docker image.
-   `--vmwarefusion-cpu-count`: Number of CPUs for the machine (-1 to use the number of CPUs available)
-   `--vmwarefusion-disk-size`: Size of disk for host VM (in MB).
-   `--vmwarefusion-memory-size`: Size of memory for host VM (in MB).
-   `--vmwarefusion-no-share`: Disable the mount of your home directory.
@z

@x
The VMware Fusion driver uses the latest boot2docker image.
See [frapposelli/boot2docker](https://github.com/boot2docker/boot2docker)
@y
The VMware Fusion driver uses the latest boot2docker image.
See [frapposelli/boot2docker](https://github.com/boot2docker/boot2docker)
@z

@x
#### Environment variables and default values
@y
#### Environment variables and default values
@z

@x
| CLI option                       | Environment variable     | Default                  |
| -------------------------------- | ------------------------ | ------------------------ |
| `--vmwarefusion-boot2docker-url` | `FUSION_BOOT2DOCKER_URL` | _Latest boot2docker url_ |
| `--vmwarefusion-cpu-count`       | `FUSION_CPU_COUNT`       | `1`                      |
| `--vmwarefusion-disk-size`       | `FUSION_DISK_SIZE`       | `20000`                  |
| `--vmwarefusion-memory-size`     | `FUSION_MEMORY_SIZE`     | `1024`                   |
| `--vmwarefusion-no-share`        | `FUSION_NO_SHARE`        | `false`                  |
@y
| CLI option                       | Environment variable     | Default                  |
| -------------------------------- | ------------------------ | ------------------------ |
| `--vmwarefusion-boot2docker-url` | `FUSION_BOOT2DOCKER_URL` | _Latest boot2docker url_ |
| `--vmwarefusion-cpu-count`       | `FUSION_CPU_COUNT`       | `1`                      |
| `--vmwarefusion-disk-size`       | `FUSION_DISK_SIZE`       | `20000`                  |
| `--vmwarefusion-memory-size`     | `FUSION_MEMORY_SIZE`     | `1024`                   |
| `--vmwarefusion-no-share`        | `FUSION_NO_SHARE`        | `false`                  |
@z
