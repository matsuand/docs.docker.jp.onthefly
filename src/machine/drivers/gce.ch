%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Google Compute Engine driver for machine
keywords: machine, Google Compute Engine, driver
title: Google Compute Engine
---
@y
---
description: Google Compute Engine driver for machine
keywords: machine, Google Compute Engine, driver
title: Google Compute Engine
---
@z

@x
Create machines on [Google Compute Engine](https://cloud.google.com/compute/).
You need a Google account and a project ID.
See [https://cloud.google.com/compute/docs/projects](https://cloud.google.com/compute/docs/projects) for details on projects.
@y
Create machines on [Google Compute Engine](https://cloud.google.com/compute/).
You need a Google account and a project ID.
See [https://cloud.google.com/compute/docs/projects](https://cloud.google.com/compute/docs/projects) for details on projects.
@z

@x
### Credentials
@y
### Credentials
@z

@x
The Google driver uses [Application Default Credentials](https://developers.google.com/identity/protocols/application-default-credentials)
to get authorization credentials for use in calling Google APIs.
@y
The Google driver uses [Application Default Credentials](https://developers.google.com/identity/protocols/application-default-credentials)
to get authorization credentials for use in calling Google APIs.
@z

@x
So if `docker-machine` is used from a GCE host, authentication occurs automatically
via the built-in service account.
Otherwise, [install gcloud](https://cloud.google.com/sdk/) and get
through the oauth2 process with `gcloud auth login`.
@y
So if `docker-machine` is used from a GCE host, authentication occurs automatically
via the built-in service account.
Otherwise, [install gcloud](https://cloud.google.com/sdk/) and get
through the oauth2 process with `gcloud auth login`.
@z

@x
Or, manually download the credentials.json file to the local, and set the `GOOGLE_APPLICATION_CREDENTIALS` environment variable point to its location, such as:
@y
Or, manually download the credentials.json file to the local, and set the `GOOGLE_APPLICATION_CREDENTIALS` environment variable point to its location, such as:
@z

@x
    export GOOGLE_APPLICATION_CREDENTIALS=$HOME/gce-credentials.json
@y
    export GOOGLE_APPLICATION_CREDENTIALS=$HOME/gce-credentials.json
@z

@x
### Example
@y
### Example
@z

@x
To create a machine instance, specify `--driver google`, the project ID and the machine name.
@y
To create a machine instance, specify `--driver google`, the project ID and the machine name.
@z

@x
    $ gcloud auth login
    $ docker-machine create --driver google --google-project PROJECT_ID vm01
    $ docker-machine create --driver google \
      --google-project PROJECT_ID \
      --google-zone us-central1-a \
      --google-machine-type f1-micro \
      vm02
@y
    $ gcloud auth login
    $ docker-machine create --driver google --google-project PROJECT_ID vm01
    $ docker-machine create --driver google \
      --google-project PROJECT_ID \
      --google-zone us-central1-a \
      --google-machine-type f1-micro \
      vm02
@z

@x
### Options
@y
### Options
@z

@x
-   `--google-address`: Instance's static external IP (name or IP).
-   `--google-disk-size`: The disk size of instance.
-   `--google-disk-type`: The disk type of instance.
-   `--google-machine-image`: The absolute URL to a base VM image to instantiate.
-   `--google-machine-type`: The type of instance.
-   `--google-network`: Specify network in which to provision VM.
-   `--google-preemptible`: Instance preemptibility.
-   `--google-project`: **required** The ID of your project to use when launching the instance.
-   `--google-scopes`: The scopes for OAuth 2.0 to Access Google APIs. See [Google Compute Engine Doc](https://cloud.google.com/storage/docs/authentication).
-   `--google-subnetwork`: Specify subnetwork in which to provision VM.
-   `--google-tags`: Instance tags (comma-separated).
-   `--google-use-existing`: Don't create a new VM, use an existing one. This is useful when you'd like to provision Docker on a VM you created yourself, maybe because it uses create options not supported by this driver.
-   `--google-use-internal-ip-only`: When this option is used during create, the new VM is not assigned a public IP address. This is useful only when the host running `docker-machine` is located inside the Google Cloud infrastructure; otherwise, `docker-machine` can't reach the VM to provision the Docker daemon. The presence of this flag implies `--google-use-internal-ip`.
-   `--google-use-internal-ip`: When this option is used during create, docker-machine uses internal rather than public NATed IPs. The flag is persistent in the sense that a machine created with it retains the IP. It's useful for managing docker machines from another machine on the same network, such as when deploying swarm.
-   `--google-username`: The username to use for the instance.
-   `--google-zone`: The zone to launch the instance.
@y
-   `--google-address`: Instance's static external IP (name or IP).
-   `--google-disk-size`: The disk size of instance.
-   `--google-disk-type`: The disk type of instance.
-   `--google-machine-image`: The absolute URL to a base VM image to instantiate.
-   `--google-machine-type`: The type of instance.
-   `--google-network`: Specify network in which to provision VM.
-   `--google-preemptible`: Instance preemptibility.
-   `--google-project`: **required** The ID of your project to use when launching the instance.
-   `--google-scopes`: The scopes for OAuth 2.0 to Access Google APIs. See [Google Compute Engine Doc](https://cloud.google.com/storage/docs/authentication).
-   `--google-subnetwork`: Specify subnetwork in which to provision VM.
-   `--google-tags`: Instance tags (comma-separated).
-   `--google-use-existing`: Don't create a new VM, use an existing one. This is useful when you'd like to provision Docker on a VM you created yourself, maybe because it uses create options not supported by this driver.
-   `--google-use-internal-ip-only`: When this option is used during create, the new VM is not assigned a public IP address. This is useful only when the host running `docker-machine` is located inside the Google Cloud infrastructure; otherwise, `docker-machine` can't reach the VM to provision the Docker daemon. The presence of this flag implies `--google-use-internal-ip`.
-   `--google-use-internal-ip`: When this option is used during create, docker-machine uses internal rather than public NATed IPs. The flag is persistent in the sense that a machine created with it retains the IP. It's useful for managing docker machines from another machine on the same network, such as when deploying swarm.
-   `--google-username`: The username to use for the instance.
-   `--google-zone`: The zone to launch the instance.
@z

@x
The GCE driver uses the `ubuntu-1604-xenial-v20161130` instance image unless otherwise specified. To obtain a
list of image URLs run:
@y
The GCE driver uses the `ubuntu-1604-xenial-v20161130` instance image unless otherwise specified. To obtain a
list of image URLs run:
@z

@x
    gcloud compute images list --uri
@y
    gcloud compute images list --uri
@z

@x
Google Compute Engine supports [image families](https://cloud.google.com/compute/docs/images#image_families).
An image family is like an image alias that always points to the latest image in the family. To create an
instance from an image family, set `--google-machine-image` to the family's URL.
@y
Google Compute Engine supports [image families](https://cloud.google.com/compute/docs/images#image_families).
An image family is like an image alias that always points to the latest image in the family. To create an
instance from an image family, set `--google-machine-image` to the family's URL.
@z

@x
The following command shows images and which family they belong to (if any):
@y
The following command shows images and which family they belong to (if any):
@z

@x
    gcloud compute images list
@y
    gcloud compute images list
@z

@x
To obtain a family URL, replace `<PROJECT>` and `<FAMILY>` in the following template.
@y
To obtain a family URL, replace `<PROJECT>` and `<FAMILY>` in the following template.
@z

@x
    https://www.googleapis.com/compute/v1/projects/<PROJECT>/global/images/family/<FAMILY>
@y
    https://www.googleapis.com/compute/v1/projects/<PROJECT>/global/images/family/<FAMILY>
@z

@x
For example, to create an instance from the latest Ubuntu 16 LTS image, specify
`https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts`.
@y
For example, to create an instance from the latest Ubuntu 16 LTS image, specify
`https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts`.
@z

@x
#### Environment variables and default values
@y
#### Environment variables and default values
@z

@x
| CLI option                 | Environment variable     | Default                              |
|:---------------------------|:-------------------------|:-------------------------------------|
| `--google-address`         | `GOOGLE_ADDRESS`         | -                                    |
| `--google-disk-size`       | `GOOGLE_DISK_SIZE`       | `10`                                 |
| `--google-disk-type`       | `GOOGLE_DISK_TYPE`       | `pd-standard`                        |
| `--google-machine-image`   | `GOOGLE_MACHINE_IMAGE`   | `ubuntu-1510-wily-v20151114`         |
| `--google-machine-type`    | `GOOGLE_MACHINE_TYPE`    | `f1-standard-1`                      |
| `--google-network`         | `GOOGLE_NETWORK`         | `default`                            |
| `--google-preemptible`     | `GOOGLE_PREEMPTIBLE`     | -                                    |
| **`--google-project`**     | `GOOGLE_PROJECT`         | -                                    |
| `--google-scopes`          | `GOOGLE_SCOPES`          | `devstorage.read_only,logging.write` |
| `--google-subnetwork`      | `GOOGLE_SUBNETWORK`      | -                                    |
| `--google-tags`            | `GOOGLE_TAGS`            | -                                    |
| `--google-use-existing`    | `GOOGLE_USE_EXISTING`    | -                                    |
| `--google-use-internal-ip` | `GOOGLE_USE_INTERNAL_IP` | -                                    |
| `--google-username`        | `GOOGLE_USERNAME`        | `docker-user`                        |
| `--google-zone`            | `GOOGLE_ZONE`            | `us-central1-a`                      |
@y
| CLI option                 | Environment variable     | Default                              |
|:---------------------------|:-------------------------|:-------------------------------------|
| `--google-address`         | `GOOGLE_ADDRESS`         | -                                    |
| `--google-disk-size`       | `GOOGLE_DISK_SIZE`       | `10`                                 |
| `--google-disk-type`       | `GOOGLE_DISK_TYPE`       | `pd-standard`                        |
| `--google-machine-image`   | `GOOGLE_MACHINE_IMAGE`   | `ubuntu-1510-wily-v20151114`         |
| `--google-machine-type`    | `GOOGLE_MACHINE_TYPE`    | `f1-standard-1`                      |
| `--google-network`         | `GOOGLE_NETWORK`         | `default`                            |
| `--google-preemptible`     | `GOOGLE_PREEMPTIBLE`     | -                                    |
| **`--google-project`**     | `GOOGLE_PROJECT`         | -                                    |
| `--google-scopes`          | `GOOGLE_SCOPES`          | `devstorage.read_only,logging.write` |
| `--google-subnetwork`      | `GOOGLE_SUBNETWORK`      | -                                    |
| `--google-tags`            | `GOOGLE_TAGS`            | -                                    |
| `--google-use-existing`    | `GOOGLE_USE_EXISTING`    | -                                    |
| `--google-use-internal-ip` | `GOOGLE_USE_INTERNAL_IP` | -                                    |
| `--google-username`        | `GOOGLE_USERNAME`        | `docker-user`                        |
| `--google-zone`            | `GOOGLE_ZONE`            | `us-central1-a`                      |
@z
