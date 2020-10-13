%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Rackspace driver for machine
keywords: machine, Rackspace, driver
title: Rackspace
hide_from_sitemap: true
---
@y
---
description: Rackspace driver for machine
keywords: machine, Rackspace, driver
title: Rackspace
hide_from_sitemap: true
---
@z

@x
Create machines on [Rackspace cloud](https://www.rackspace.com/cloud)
@y
Create machines on [Rackspace cloud](https://www.rackspace.com/cloud)
@z

@x
## Usage
@y
## Usage
@z

@x
    $ docker-machine create --driver rackspace --rackspace-username=user --rackspace-api-key=KEY --rackspace-region=region vm
@y
    $ docker-machine create --driver rackspace --rackspace-username=user --rackspace-api-key=KEY --rackspace-region=region vm
@z

@x
## Options
@y
## Options
@z

@x
-   `--rackspace-active-timeout`: Rackspace active timeout
-   `--rackspace-api-key`: **required** Rackspace API key.
-   `--rackspace-docker-install`: Set if Docker needs to be installed on the machine.
-   `--rackspace-endpoint-type`: Rackspace endpoint type (`adminURL`, `internalURL` or the default `publicURL`).
-   `--rackspace-flavor-id`: Rackspace flavor ID. Default: General Purpose 1GB.
-   `--rackspace-image-id`: Rackspace image ID. Default: Ubuntu 16.04 LTS (Xenial Xerus) (PVHVM).
-   `--rackspace-region`: **required** Rackspace region name.
-   `--rackspace-ssh-port`: SSH port for the newly booted machine.
-   `--rackspace-ssh-user`: SSH user for the newly booted machine.
-   `--rackspace-username`: **required** Rackspace account username.
@y
-   `--rackspace-active-timeout`: Rackspace active timeout
-   `--rackspace-api-key`: **required** Rackspace API key.
-   `--rackspace-docker-install`: Set if Docker needs to be installed on the machine.
-   `--rackspace-endpoint-type`: Rackspace endpoint type (`adminURL`, `internalURL` or the default `publicURL`).
-   `--rackspace-flavor-id`: Rackspace flavor ID. Default: General Purpose 1GB.
-   `--rackspace-image-id`: Rackspace image ID. Default: Ubuntu 16.04 LTS (Xenial Xerus) (PVHVM).
-   `--rackspace-region`: **required** Rackspace region name.
-   `--rackspace-ssh-port`: SSH port for the newly booted machine.
-   `--rackspace-ssh-user`: SSH user for the newly booted machine.
-   `--rackspace-username`: **required** Rackspace account username.
@z

@x
The Rackspace driver uses `821ba5f4-712d-4ec8-9c65-a3fa4bc500f9` (Ubuntu 16.04 LTS) by default.
@y
The Rackspace driver uses `821ba5f4-712d-4ec8-9c65-a3fa4bc500f9` (Ubuntu 16.04 LTS) by default.
@z

@x
#### Environment variables and default values
@y
#### Environment variables and default values
@z

@x
| CLI option                   | Environment variable | Default                                |
| ---------------------------- | -------------------- | -------------------------------------- |
| `--rackspace-active-timeout` | `OS_ACTIVE_TIMEOUT`  | `300`                                  |
| **`--rackspace-api-key`**    | `OS_API_KEY`         | -                                      |
| `--rackspace-docker-install` | -                    | `true`                                 |
| `--rackspace-endpoint-type`  | `OS_ENDPOINT_TYPE`   | `publicURL`                            |
| `--rackspace-flavor-id`      | `OS_FLAVOR_ID`       | `general1-1`                           |
| `--rackspace-image-id`       | `OS_IMAGE_ID`        | `821ba5f4-712d-4ec8-9c65-a3fa4bc500f9` |
| **`--rackspace-region`**     | `OS_REGION_NAME`     | `IAD` (Northern Virginia)              |
| `--rackspace-ssh-port`       | `OS_SSH_PORT`        | `22`                                   |
| `--rackspace-ssh-user`       | `OS_SSH_USER`        | `root`                                 |
| **`--rackspace-username`**   | `OS_USERNAME`        | -                                      |
@y
| CLI option                   | Environment variable | Default                                |
| ---------------------------- | -------------------- | -------------------------------------- |
| `--rackspace-active-timeout` | `OS_ACTIVE_TIMEOUT`  | `300`                                  |
| **`--rackspace-api-key`**    | `OS_API_KEY`         | -                                      |
| `--rackspace-docker-install` | -                    | `true`                                 |
| `--rackspace-endpoint-type`  | `OS_ENDPOINT_TYPE`   | `publicURL`                            |
| `--rackspace-flavor-id`      | `OS_FLAVOR_ID`       | `general1-1`                           |
| `--rackspace-image-id`       | `OS_IMAGE_ID`        | `821ba5f4-712d-4ec8-9c65-a3fa4bc500f9` |
| **`--rackspace-region`**     | `OS_REGION_NAME`     | `IAD` (Northern Virginia)              |
| `--rackspace-ssh-port`       | `OS_SSH_PORT`        | `22`                                   |
| `--rackspace-ssh-user`       | `OS_SSH_USER`        | `root`                                 |
| **`--rackspace-username`**   | `OS_USERNAME`        | -                                      |
@z
