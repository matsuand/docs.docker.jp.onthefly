%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: IBM Softlayer driver for machine
keywords: machine, IBM Softlayer, driver
title: IBM Softlayer
hide_from_sitemap: true
---
@y
---
description: IBM Softlayer driver for machine
keywords: machine, IBM Softlayer, driver
title: IBM Softlayer
hide_from_sitemap: true
---
@z

@x
Create machines on [Softlayer](http://softlayer.com).
@y
Create machines on [Softlayer](http://softlayer.com).
@z

@x
You need to generate an API key in the softlayer control panel.
[Retrieve your API key](http://knowledgelayer.softlayer.com/procedure/retrieve-your-api-key).
@y
You need to generate an API key in the softlayer control panel.
[Retrieve your API key](http://knowledgelayer.softlayer.com/procedure/retrieve-your-api-key).
@z

@x
## Usage
@y
## Usage
@z

@x
    $ docker-machine create --driver softlayer --softlayer-user=user --softlayer-api-key=KEY --softlayer-domain=domain vm
@y
    $ docker-machine create --driver softlayer --softlayer-user=user --softlayer-api-key=KEY --softlayer-domain=domain vm
@z

@x
## Options
@y
## Options
@z

@x
-   `--softlayer-api-endpoint`: Change SoftLayer API endpoint.
-   `--softlayer-api-key`: **required** API key for your user account.
-   `--softlayer-cpu`: Number of CPUs for the machine.
-   `--softlayer-disk-size`: A value of `0` sets the SoftLayer default.
-   `--softlayer-domain`: **required** Domain name for the machine.
-   `--softlayer-hostname`: Hostname for the machine.
-   `--softlayer-hourly-billing`: Specifies that hourly billing should be used, otherwise monthly billing is used.
-   `--softlayer-image`: OS Image to use.
-   `--softlayer-local-disk`: Use local machine disk instead of SoftLayer SAN.
-   `--softlayer-memory`: Memory for host in MB.
-   `--softlayer-network-max-speed`: Speed of network uplinks in Mbps (1000, 100, 10).
-   `--softlayer-private-net-only`: Disable public networking.
-   `--softlayer-private-vlan-id`: Your private VLAN ID.
-   `--softlayer-public-vlan-id`: Your public VLAN ID.
-   `--softlayer-region`: SoftLayer region.
-   `--softlayer-user`: **required** Username for your SoftLayer account, API key needs to match this user.
@y
-   `--softlayer-api-endpoint`: Change SoftLayer API endpoint.
-   `--softlayer-api-key`: **required** API key for your user account.
-   `--softlayer-cpu`: Number of CPUs for the machine.
-   `--softlayer-disk-size`: A value of `0` sets the SoftLayer default.
-   `--softlayer-domain`: **required** Domain name for the machine.
-   `--softlayer-hostname`: Hostname for the machine.
-   `--softlayer-hourly-billing`: Specifies that hourly billing should be used, otherwise monthly billing is used.
-   `--softlayer-image`: OS Image to use.
-   `--softlayer-local-disk`: Use local machine disk instead of SoftLayer SAN.
-   `--softlayer-memory`: Memory for host in MB.
-   `--softlayer-network-max-speed`: Speed of network uplinks in Mbps (1000, 100, 10).
-   `--softlayer-private-net-only`: Disable public networking.
-   `--softlayer-private-vlan-id`: Your private VLAN ID.
-   `--softlayer-public-vlan-id`: Your public VLAN ID.
-   `--softlayer-region`: SoftLayer region.
-   `--softlayer-user`: **required** Username for your SoftLayer account, API key needs to match this user.
@z

@x
The SoftLayer driver uses `UBUNTU_LATEST` as the image type by default.
@y
The SoftLayer driver uses `UBUNTU_LATEST` as the image type by default.
@z

@x
#### Environment variables and default values
@y
#### Environment variables and default values
@z

@x
| CLI option                     | Environment variable        | Default                     |
| ------------------------------ | --------------------------- | --------------------------- |
| `--softlayer-api-endpoint`     | `SOFTLAYER_API_ENDPOINT`    | `api.softlayer.com/rest/v3` |
| **`--softlayer-api-key`**      | `SOFTLAYER_API_KEY`         | -                           |
| `--softlayer-cpu`              | `SOFTLAYER_CPU`             | `1`                         |
| `--softlayer-disk-size`        | `SOFTLAYER_DISK_SIZE`       | `0`                         |
| **`--softlayer-domain`**       | `SOFTLAYER_DOMAIN`          | -                           |
| `--softlayer-hostname`         | `SOFTLAYER_HOSTNAME`        | `docker`                    |
| `--softlayer-hourly-billing`   | `SOFTLAYER_HOURLY_BILLING`  | `false`                     |
| `--softlayer-image`            | `SOFTLAYER_IMAGE`           | `UBUNTU_LATEST`             |
| `--softlayer-local-disk`       | `SOFTLAYER_LOCAL_DISK`      | `false`                     |
| `--softlayer-memory`           | `SOFTLAYER_MEMORY`          | `1024`                      |
| `--softlayer-private-net-only` | `SOFTLAYER_PRIVATE_NET`     | `false`                     |
| `--softlayer-private-vlan-id`  | `SOFTLAYER_PRIVATE_VLAN_ID` | `0`                         |
| `--softlayer-public-vlan-id`   | `SOFTLAYER_PUBLIC_VLAN_ID`  | `0`                         |
| `--softlayer-region`           | `SOFTLAYER_REGION`          | `dal01`                     |
| **`--softlayer-user`**         | `SOFTLAYER_USER`            | -                           |
@y
| CLI option                     | Environment variable        | Default                     |
| ------------------------------ | --------------------------- | --------------------------- |
| `--softlayer-api-endpoint`     | `SOFTLAYER_API_ENDPOINT`    | `api.softlayer.com/rest/v3` |
| **`--softlayer-api-key`**      | `SOFTLAYER_API_KEY`         | -                           |
| `--softlayer-cpu`              | `SOFTLAYER_CPU`             | `1`                         |
| `--softlayer-disk-size`        | `SOFTLAYER_DISK_SIZE`       | `0`                         |
| **`--softlayer-domain`**       | `SOFTLAYER_DOMAIN`          | -                           |
| `--softlayer-hostname`         | `SOFTLAYER_HOSTNAME`        | `docker`                    |
| `--softlayer-hourly-billing`   | `SOFTLAYER_HOURLY_BILLING`  | `false`                     |
| `--softlayer-image`            | `SOFTLAYER_IMAGE`           | `UBUNTU_LATEST`             |
| `--softlayer-local-disk`       | `SOFTLAYER_LOCAL_DISK`      | `false`                     |
| `--softlayer-memory`           | `SOFTLAYER_MEMORY`          | `1024`                      |
| `--softlayer-private-net-only` | `SOFTLAYER_PRIVATE_NET`     | `false`                     |
| `--softlayer-private-vlan-id`  | `SOFTLAYER_PRIVATE_VLAN_ID` | `0`                         |
| `--softlayer-public-vlan-id`   | `SOFTLAYER_PUBLIC_VLAN_ID`  | `0`                         |
| `--softlayer-region`           | `SOFTLAYER_REGION`          | `dal01`                     |
| **`--softlayer-user`**         | `SOFTLAYER_USER`            | -                           |
@z
