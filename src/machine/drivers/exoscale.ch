%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Exoscale driver for machine
keywords: machine, exoscale, driver
title: Exoscale
---
@y
---
description: Exoscale driver for machine
keywords: machine, exoscale, driver
title: Exoscale
---
@z

@x
Create machines on [Exoscale](https://www.exoscale.com/).
@y
Create machines on [Exoscale](https://www.exoscale.com/).
@z

@x
Get your API key and API secret key from [API details](https://portal.exoscale.com/account/api) and pass them to `machine create` with the `--exoscale-api-key` and `--exoscale-api-secret-key` options.
@y
Get your API key and API secret key from [API details](https://portal.exoscale.com/account/api) and pass them to `machine create` with the `--exoscale-api-key` and `--exoscale-api-secret-key` options.
@z

@x
## Usage
@y
## Usage
@z

@x
    $ docker-machine create --driver exoscale \
        --exoscale-api-key=API \
        --exoscale-api-secret-key=SECRET \
        MY_COMPUTE_INSTANCE
@y
    $ docker-machine create --driver exoscale \
        --exoscale-api-key=API \
        --exoscale-api-secret-key=SECRET \
        MY_COMPUTE_INSTANCE
@z

@x
If you encounter any troubles, activate the debug mode with `docker-machine --debug create ...`.
@y
If you encounter any troubles, activate the debug mode with `docker-machine --debug create ...`.
@z

@x
## Options
@y
## Options
@z

@x
-   `--exoscale-affinity-group`: [Anti-affinity group][anti-affinity] the machine is started in.
-   `--exoscale-api-key`: **required** Your API key;
-   `--exoscale-api-secret-key`: **required** Your API secret key;
-   `--exoscale-availability-zone`: Exoscale [availability zone][datacenters] (ch-dk-2, at-vie-1, de-fra-1, ...);
-   `--exoscale-disk-size`: Disk size for the host in GiB (at least 10);
-   `--exoscale-image`: Image template, for example `ubuntu-16.04`, also known as `Linux Ubuntu 16.04 LTS 64-bit`, [see below](#image-template-name));
-   `--exoscale-instance-profile`: Instance profile (Small, Medium, Large, ...);
-   `--exoscale-security-group`: Security group. _It is created if it doesn't exist_;
-   `--exoscale-ssh-key`: Path to the SSH user private key. _A new one is created if left empty_;
-   `--exoscale-ssh-user`: SSH username to connect, such as `ubuntu`, [see below](#ssh-username));
-   `--exoscale-url`: Your API endpoint;
-   `--exoscale-userdata`: Path to file containing user data for [cloud-init](https://cloud-init.io/);
@y
-   `--exoscale-affinity-group`: [Anti-affinity group][anti-affinity] the machine is started in.
-   `--exoscale-api-key`: **required** Your API key;
-   `--exoscale-api-secret-key`: **required** Your API secret key;
-   `--exoscale-availability-zone`: Exoscale [availability zone][datacenters] (ch-dk-2, at-vie-1, de-fra-1, ...);
-   `--exoscale-disk-size`: Disk size for the host in GiB (at least 10);
-   `--exoscale-image`: Image template, for example `ubuntu-16.04`, also known as `Linux Ubuntu 16.04 LTS 64-bit`, [see below](#image-template-name));
-   `--exoscale-instance-profile`: Instance profile (Small, Medium, Large, ...);
-   `--exoscale-security-group`: Security group. _It is created if it doesn't exist_;
-   `--exoscale-ssh-key`: Path to the SSH user private key. _A new one is created if left empty_;
-   `--exoscale-ssh-user`: SSH username to connect, such as `ubuntu`, [see below](#ssh-username));
-   `--exoscale-url`: Your API endpoint;
-   `--exoscale-userdata`: Path to file containing user data for [cloud-init](https://cloud-init.io/);
@z

@x
### Environment variables and default values
@y
### Environment variables and default values
@z

@x
| CLI option                      | Environment variable         | Default                           |
| ------------------------------- | ---------------------------- | --------------------------------- |
| `--exoscale-affinity-group`     | `EXOSCALE_AFFINITY_GROUP`    | -                                 |
| **`--exoscale-api-key`**        | `EXOSCALE_API_KEY`           | -                                 |
| **`--exoscale-api-secret-key`** | `EXOSCALE_API_SECRET`        | -                                 |
| `--exoscale-availability-zone`  | `EXOSCALE_AVAILABILITY_ZONE` | `ch-dk-2`                         |
| `--exoscale-disk-size`          | `EXOSCALE_DISK_SIZE`         | `50`                              |
| `--exoscale-image`              | `EXOSCALE_IMAGE`             | `Linux Ubuntu 16.04 LTS 64-bit`   |
| `--exoscale-instance-profile`   | `EXOSCALE_INSTANCE_PROFILE`  | `small`                           |
| `--exoscale-security-group`     | `EXOSCALE_SECURITY_GROUP`    | `docker-machine`                  |
| `--exoscale-ssh-key`            | `EXOSCALE_SSH_KEY`           | -                                 |
| `--exoscale-ssh-user`           | `EXOSCALE_SSH_USER`          | -                                 |
| `--exoscale-url`                | `EXOSCALE_ENDPOINT`          | `https://api.exoscale.ch/compute` |
| `--exoscale-userdata`           | `EXOSCALE_USERDATA`          | -                                 |
@y
| CLI option                      | Environment variable         | Default                           |
| ------------------------------- | ---------------------------- | --------------------------------- |
| `--exoscale-affinity-group`     | `EXOSCALE_AFFINITY_GROUP`    | -                                 |
| **`--exoscale-api-key`**        | `EXOSCALE_API_KEY`           | -                                 |
| **`--exoscale-api-secret-key`** | `EXOSCALE_API_SECRET`        | -                                 |
| `--exoscale-availability-zone`  | `EXOSCALE_AVAILABILITY_ZONE` | `ch-dk-2`                         |
| `--exoscale-disk-size`          | `EXOSCALE_DISK_SIZE`         | `50`                              |
| `--exoscale-image`              | `EXOSCALE_IMAGE`             | `Linux Ubuntu 16.04 LTS 64-bit`   |
| `--exoscale-instance-profile`   | `EXOSCALE_INSTANCE_PROFILE`  | `small`                           |
| `--exoscale-security-group`     | `EXOSCALE_SECURITY_GROUP`    | `docker-machine`                  |
| `--exoscale-ssh-key`            | `EXOSCALE_SSH_KEY`           | -                                 |
| `--exoscale-ssh-user`           | `EXOSCALE_SSH_USER`          | -                                 |
| `--exoscale-url`                | `EXOSCALE_ENDPOINT`          | `https://api.exoscale.ch/compute` |
| `--exoscale-userdata`           | `EXOSCALE_USERDATA`          | -                                 |
@z

@x
**NB:** the _instance profile_, _image_, and _availability zone_ are case insensitive.
@y
**NB:** the _instance profile_, _image_, and _availability zone_ are case insensitive.
@z

@x
### Image template name
@y
### Image template name
@z

@x
The [VM templates][templates] available at Exoscale are listed on the Portal
when adding a new instance.
@y
The [VM templates][templates] available at Exoscale are listed on the Portal
when adding a new instance.
@z

@x
For any Linux template, you may use the shorter name composed only of the name
and version, as shown below.
@y
For any Linux template, you may use the shorter name composed only of the name
and version, as shown below.
@z

@x
| Full name                       | Short name           |
| ------------------------------- | -------------------- |
| Linux Debian 8 64-bit           | `debian-8`           |
| Linux Ubuntu 16.04 LTS 64-bit   | `ubuntu-16.04`       |
| Linux CentOS 7.3 64-bit         | `centos-7.3`         |
| Linux CoreOS stable 1298 64-bit | `coreos-stable-1298` |
@y
| Full name                       | Short name           |
| ------------------------------- | -------------------- |
| Linux Debian 8 64-bit           | `debian-8`           |
| Linux Ubuntu 16.04 LTS 64-bit   | `ubuntu-16.04`       |
| Linux CentOS 7.3 64-bit         | `centos-7.3`         |
| Linux CoreOS stable 1298 64-bit | `coreos-stable-1298` |
@z

@x
**NB:** Docker doesn't work for non-Linux machines like OpenBSD or Windows Server.
@y
**NB:** Docker doesn't work for non-Linux machines like OpenBSD or Windows Server.
@z

@x
### SSH Username
@y
### SSH Username
@z

@x
The Exoscale driver does an educated guess to pick the correct default SSH
user. If left empty, it picks a suitable one following those rules:
@y
The Exoscale driver does an educated guess to pick the correct default SSH
user. If left empty, it picks a suitable one following those rules:
@z

@x
- `centos` for CentOS;
- `core` for Linux CoreOS (aka Container Linux);
- `debian` for Debian;
- `ubuntu` for Ubuntu;
- `fedora` for Fedora;
- `cloud-user` for Red Hat;
- otherwise, `root`.
@y
- `centos` for CentOS;
- `core` for Linux CoreOS (aka Container Linux);
- `debian` for Debian;
- `ubuntu` for Ubuntu;
- `fedora` for Fedora;
- `cloud-user` for Red Hat;
- otherwise, `root`.
@z

@x
### Custom security group
@y
### Custom security group
@z

@x
If a custom security group is provided, you need to ensure that you allow TCP ports 22 and 2376 in an ingress rule.
@y
If a custom security group is provided, you need to ensure that you allow TCP ports 22 and 2376 in an ingress rule.
@z

@x
Moreover, if you want to use [Docker Swarm](../../engine/swarm/swarm-tutorial/index.md), also add TCP port 2377, UDP/TCP on 7946, and UDP on 4789.
@y
Moreover, if you want to use [Docker Swarm](../../engine/swarm/swarm-tutorial/index.md), also add TCP port 2377, UDP/TCP on 7946, and UDP on 4789.
@z

@x
### Debian 9
@y
### Debian 9
@z

@x
The [default storage driver](../../storage/storagedriver/select-storage-driver.md) may fail on Debian, specifying `overlay2` should resolve this issue.
@y
The [default storage driver](../../storage/storagedriver/select-storage-driver.md) may fail on Debian, specifying `overlay2` should resolve this issue.
@z

@x
    $ docker-machine create --engine-storage-driver overlay2 ...`
@y
    $ docker-machine create --engine-storage-driver overlay2 ...`
@z

@x
### More than 8 docker machines?
@y
### More than 8 docker machines?
@z

@x
There is a limit to the number of machines that an anti-affinity group can have.  This can be worked around by specifying an additional anti-affinity group using `--exoscale-affinity-group=docker-machineX`
@y
There is a limit to the number of machines that an anti-affinity group can have.  This can be worked around by specifying an additional anti-affinity group using `--exoscale-affinity-group=docker-machineX`
@z

@x
[templates]: https://www.exoscale.com/templates/
[datacenters]: https://www.exoscale.com/datacenters/
[anti-affinity]: https://community.exoscale.com/documentation/compute/anti-affinity-groups/
@y
[templates]: https://www.exoscale.com/templates/
[datacenters]: https://www.exoscale.com/datacenters/
[anti-affinity]: https://community.exoscale.com/documentation/compute/anti-affinity-groups/
@z
