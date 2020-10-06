%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: DigitalOcean driver for machine
keywords: machine, digitalocean, driver
title: DigitalOcean
hide_from_sitemap: true
---
@y
---
description: DigitalOcean driver for machine
keywords: machine, digitalocean, driver
title: DigitalOcean
hide_from_sitemap: true
---
@z

@x
Create Docker machines on [DigitalOcean](https://www.digitalocean.com/).
@y
Create Docker machines on [DigitalOcean](https://www.digitalocean.com/).
@z

@x
You need to create a personal access token under "Apps & API" in the DigitalOcean
Control Panel and pass that to `docker-machine create` with the `--digitalocean-access-token` option.
@y
You need to create a personal access token under "Apps & API" in the DigitalOcean
Control Panel and pass that to `docker-machine create` with the `--digitalocean-access-token` option.
@z

@x
## Usage
@y
## Usage
@z

@x
    $ docker-machine create --driver digitalocean --digitalocean-access-token=aa9399a2175a93b17b1c86c807e08d3fc4b79876545432a629602f61cf6ccd6b test-this
@y
    $ docker-machine create --driver digitalocean --digitalocean-access-token=aa9399a2175a93b17b1c86c807e08d3fc4b79876545432a629602f61cf6ccd6b test-this
@z

@x
### When explicitly passing environment variables
@y
### When explicitly passing environment variables
@z

@x
    export DIGITALOCEAN_ACCESS_TOKEN="yourtoken"; export DIGITALOCEAN_SSH_KEY_FINGERPRINT="from your DO's profile security-ssh keys"; \ export DIGITALOCEAN_IMAGE="centos-7-x64"; export DIGITALOCEAN_REGION="tor1"
@y
    export DIGITALOCEAN_ACCESS_TOKEN="yourtoken"; export DIGITALOCEAN_SSH_KEY_FINGERPRINT="from your DO's profile security-ssh keys"; \ export DIGITALOCEAN_IMAGE="centos-7-x64"; export DIGITALOCEAN_REGION="tor1"
@z

@x
    $ docker-machine create --driver digitalocean --digitalocean-access-token $DIGITALOCEAN_ACCESS_TOKEN --digitalocean-ssh-key-fingerprint $DIGITALOCEAN_SSH_KEY_FINGERPRINT --digitalocean-image $DIGITALOCEAN_IMAGE --digitalocean-region $DIGITALOCEAN_REGION
@y
    $ docker-machine create --driver digitalocean --digitalocean-access-token $DIGITALOCEAN_ACCESS_TOKEN --digitalocean-ssh-key-fingerprint $DIGITALOCEAN_SSH_KEY_FINGERPRINT --digitalocean-image $DIGITALOCEAN_IMAGE --digitalocean-region $DIGITALOCEAN_REGION
@z

@x
### When passing a boolean value to any option
@y
### When passing a boolean value to any option
@z

@x
    $ docker-machine create --driver digitalocean --digitalocean-access-token=aa9399a2175a93b17b1c86c807e08d3fc4b79876545432a629602f61cf6ccd6b --digitalocean-size 1gb --digitalocean-backups=true test-this
@y
    $ docker-machine create --driver digitalocean --digitalocean-access-token=aa9399a2175a93b17b1c86c807e08d3fc4b79876545432a629602f61cf6ccd6b --digitalocean-size 1gb --digitalocean-backups=true test-this
@z

@x
## Options
@y
## Options
@z

@x
-   `--digitalocean-access-token`: **required**. Your personal access token for the DigitalOcean API.
-   `--digitalocean-backups`: Enable DigitalOcean backups for the droplet.
-   `--digitalocean-image`: The name of the DigitalOcean image to use.
-   `--digitalocean-ipv6`: Enable IPv6 support for the droplet.
-   `--digitalocean-monitoring`: Enable monitoring for the droplet.
-   `--digitalocean-private-networking`: Enable private networking support for the droplet.
-   `--digitalocean-region`: The region to create the droplet in, see [Regions API](https://developers.digitalocean.com/documentation/v2/#regions) for how to get a list.
-   `--digitalocean-size`: The size of the DigitalOcean droplet (larger than default options are of the form `2gb`).
-   `--digitalocean-ssh-key-fingerprint`: Use an existing SSH key instead of creating a new one, see [SSH keys](https://developers.digitalocean.com/documentation/v2/#ssh-keys).
-   `--digitalocean-ssh-key-path`: SSH private key path.
-   `--digitalocean-ssh-port`: SSH port.
-   `--digitalocean-ssh-user`: SSH username.
-   `--digitalocean-tags`: Comma-separated list of tags to apply to the Droplet, see [Droplet tagging](https://developers.digitalocean.com/documentation/v2/#tags)
-   `--digitalocean-userdata`: Path to file containing User Data for the droplet.
@y
-   `--digitalocean-access-token`: **required**. Your personal access token for the DigitalOcean API.
-   `--digitalocean-backups`: Enable DigitalOcean backups for the droplet.
-   `--digitalocean-image`: The name of the DigitalOcean image to use.
-   `--digitalocean-ipv6`: Enable IPv6 support for the droplet.
-   `--digitalocean-monitoring`: Enable monitoring for the droplet.
-   `--digitalocean-private-networking`: Enable private networking support for the droplet.
-   `--digitalocean-region`: The region to create the droplet in, see [Regions API](https://developers.digitalocean.com/documentation/v2/#regions) for how to get a list.
-   `--digitalocean-size`: The size of the DigitalOcean droplet (larger than default options are of the form `2gb`).
-   `--digitalocean-ssh-key-fingerprint`: Use an existing SSH key instead of creating a new one, see [SSH keys](https://developers.digitalocean.com/documentation/v2/#ssh-keys).
-   `--digitalocean-ssh-key-path`: SSH private key path.
-   `--digitalocean-ssh-port`: SSH port.
-   `--digitalocean-ssh-user`: SSH username.
-   `--digitalocean-tags`: Comma-separated list of tags to apply to the Droplet, see [Droplet tagging](https://developers.digitalocean.com/documentation/v2/#tags)
-   `--digitalocean-userdata`: Path to file containing User Data for the droplet.
@z

@x
The DigitalOcean driver uses `ubuntu-16-04-x64` as the default image.
@y
The DigitalOcean driver uses `ubuntu-16-04-x64` as the default image.
@z

@x
#### Environment variables and default values
@y
#### Environment variables and default values
@z

@x
| CLI option                          | Environment variable              | Default            |
| ----------------------------------- | --------------------------------- | ------------------ |
| **`--digitalocean-access-token`**   | `DIGITALOCEAN_ACCESS_TOKEN`       | -                  |
| `--digitalocean-backups`            | `DIGITALOCEAN_BACKUPS`            | `false`            |
| `--digitalocean-image`              | `DIGITALOCEAN_IMAGE`              | `ubuntu-16-04-x64` |
| `--digitalocean-ipv6`               | `DIGITALOCEAN_IPV6`               | `false`            |
| `--digitalocean-private-networking` | `DIGITALOCEAN_PRIVATE_NETWORKING` | `false`            |
| `--digitalocean-region`             | `DIGITALOCEAN_REGION`             | `nyc3`             |
| `--digitalocean-size`               | `DIGITALOCEAN_SIZE`               | `s-1vcpu-1gb`      |
| `--digitalocean-ssh-key-fingerprint`| `DIGITALOCEAN_SSH_KEY_FINGERPRINT`| -                  |
| `--digitalocean-ssh-key-path`       | `DIGITALOCEAN_SSH_KEY_PATH`       | -                  |
| `--digitalocean-ssh-port`           | `DIGITALOCEAN_SSH_PORT`           | 22                 |
| `--digitalocean-ssh-user`           | `DIGITALOCEAN_SSH_USER`           | `root`             |
| `--digitalocean-tags`               | `DIGITALOCEAN_TAGS`               | -                  |
| `--digitalocean-userdata`           | `DIGITALOCEAN_USERDATA`           | -                  |
| `--digitalocean-monitoring`         | `$DIGITALOCEAN_MONITORING`        | `false`            |
@y
| CLI option                          | Environment variable              | Default            |
| ----------------------------------- | --------------------------------- | ------------------ |
| **`--digitalocean-access-token`**   | `DIGITALOCEAN_ACCESS_TOKEN`       | -                  |
| `--digitalocean-backups`            | `DIGITALOCEAN_BACKUPS`            | `false`            |
| `--digitalocean-image`              | `DIGITALOCEAN_IMAGE`              | `ubuntu-16-04-x64` |
| `--digitalocean-ipv6`               | `DIGITALOCEAN_IPV6`               | `false`            |
| `--digitalocean-private-networking` | `DIGITALOCEAN_PRIVATE_NETWORKING` | `false`            |
| `--digitalocean-region`             | `DIGITALOCEAN_REGION`             | `nyc3`             |
| `--digitalocean-size`               | `DIGITALOCEAN_SIZE`               | `s-1vcpu-1gb`      |
| `--digitalocean-ssh-key-fingerprint`| `DIGITALOCEAN_SSH_KEY_FINGERPRINT`| -                  |
| `--digitalocean-ssh-key-path`       | `DIGITALOCEAN_SSH_KEY_PATH`       | -                  |
| `--digitalocean-ssh-port`           | `DIGITALOCEAN_SSH_PORT`           | 22                 |
| `--digitalocean-ssh-user`           | `DIGITALOCEAN_SSH_USER`           | `root`             |
| `--digitalocean-tags`               | `DIGITALOCEAN_TAGS`               | -                  |
| `--digitalocean-userdata`           | `DIGITALOCEAN_USERDATA`           | -                  |
| `--digitalocean-monitoring`         | `$DIGITALOCEAN_MONITORING`        | `false`            |
@z
