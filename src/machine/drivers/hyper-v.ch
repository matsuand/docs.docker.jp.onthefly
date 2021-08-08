%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Microsoft Hyper-V driver for machine
keywords: machine, Microsoft Hyper-V, driver
title: Microsoft Hyper-V
toc_max: 4
---
@y
---
description: Microsoft Hyper-V driver for machine
keywords: machine, Microsoft Hyper-V, driver
title: Microsoft Hyper-V
toc_max: 4
---
@z

@x
Creates a Boot2Docker virtual machine locally on your Windows machine
using Hyper-V.
@y
Creates a Boot2Docker virtual machine locally on your Windows machine
using Hyper-V.
@z

@x
Hyper-V must be enabled on your desktop system. Docker Desktop for Windows automatically
enables it upon install. See this article on the Microsoft developer network for instructions on
[how to manually enable
Hyper-V](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install).
@y
Hyper-V must be enabled on your desktop system. Docker Desktop for Windows automatically
enables it upon install. See this article on the Microsoft developer network for instructions on
[how to manually enable
Hyper-V](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install).
@z

@x
> **Notes**:
>
> * You must use an Administrator level account to create and manage Hyper-V machines.
>
>* You need an existing virtual switch to use the
> driver. Hyper-V can share an external network interface (also known as
> bridging). See [this blog](https://docs.microsoft.com/en-us/archive/blogs/canitpro/step-by-step-enabling-hyper-v-for-use-on-windows-8-1) to learn more.
> If you would like to use NAT, create an internal network, and use
> [Internet Connection Sharing](https://packet6.com/allowing-windows-8-1-hyper-v-vm-to-work-with-wifi/).
>
> * This reference page includes an [example](hyper-v.md#example) showing you how to use an elevated (Administrator-level) PowerShell and create and use an external network switch.
@y
> **Notes**:
>
> * You must use an Administrator level account to create and manage Hyper-V machines.
>
>* You need an existing virtual switch to use the
> driver. Hyper-V can share an external network interface (also known as
> bridging). See [this blog](https://docs.microsoft.com/en-us/archive/blogs/canitpro/step-by-step-enabling-hyper-v-for-use-on-windows-8-1) to learn more.
> If you would like to use NAT, create an internal network, and use
> [Internet Connection Sharing](https://packet6.com/allowing-windows-8-1-hyper-v-vm-to-work-with-wifi/).
>
> * This reference page includes an [example](hyper-v.md#example) showing you how to use an elevated (Administrator-level) PowerShell and create and use an external network switch.
@z

@x
## Usage
@y
## Usage
@z

@x
    $ docker-machine create --driver hyperv vm
@y
    $ docker-machine create --driver hyperv vm
@z

@x
## Options
@y
## Options
@z

@x
-   `--hyperv-boot2docker-url`: The URL of the boot2docker ISO.
-   `--hyperv-virtual-switch`: Name of the virtual switch to use.
-   `--hyperv-disk-size`: Size of disk for the host in MB.
-   `--hyperv-memory`: Size of memory for the host in MB.
-   `--hyperv-cpu-count`: Number of CPUs for the host.
-   `--hyperv-static-macaddress`: Hyper-V network adapter's static MAC address.
-   `--hyperv-vlan-id`: Hyper-V network adapter's VLAN ID if any.
-   `--hyperv-disable-dynamic-memory`: Disable dynamic memory management.
@y
-   `--hyperv-boot2docker-url`: The URL of the boot2docker ISO.
-   `--hyperv-virtual-switch`: Name of the virtual switch to use.
-   `--hyperv-disk-size`: Size of disk for the host in MB.
-   `--hyperv-memory`: Size of memory for the host in MB.
-   `--hyperv-cpu-count`: Number of CPUs for the host.
-   `--hyperv-static-macaddress`: Hyper-V network adapter's static MAC address.
-   `--hyperv-vlan-id`: Hyper-V network adapter's VLAN ID if any.
-   `--hyperv-disable-dynamic-memory`: Disable dynamic memory management.
@z

@x
## Environment variables and default values
@y
## Environment variables and default values
@z

@x
| CLI option                        | Environment variable            | Default                  |
| --------------------------------- | ------------------------------- | ------------------------ |
| `--hyperv-boot2docker-url`        | `HYPERV_BOOT2DOCKER_URL`        | _Latest boot2docker url_ |
| `--hyperv-cpu-count`              | `HYPERV_CPU_COUNT`              | `1`                      |
| `--hyperv-disk-size`              | `HYPERV_DISK_SIZE`              | `20000`                  |
| `--hyperv-memory`                 | `HYPERV_MEMORY`                 | `1024`                   |
| `--hyperv-static-macaddress`      | `HYPERV_STATIC_MACADDRESS`      | _undefined_              |
| `--hyperv-virtual-switch`         | `HYPERV_VIRTUAL_SWITCH`         | _first found_            |
| `--hyperv-vlan-id`                | `HYPERV_VLAN_ID`                | _undefined_              |
| `--hyperv-disable-dynamic-memory` | `HYPERV_DISABLE_DYNAMIC_MEMORY` | `false`                  |
@y
| CLI option                        | Environment variable            | Default                  |
| --------------------------------- | ------------------------------- | ------------------------ |
| `--hyperv-boot2docker-url`        | `HYPERV_BOOT2DOCKER_URL`        | _Latest boot2docker url_ |
| `--hyperv-cpu-count`              | `HYPERV_CPU_COUNT`              | `1`                      |
| `--hyperv-disk-size`              | `HYPERV_DISK_SIZE`              | `20000`                  |
| `--hyperv-memory`                 | `HYPERV_MEMORY`                 | `1024`                   |
| `--hyperv-static-macaddress`      | `HYPERV_STATIC_MACADDRESS`      | _undefined_              |
| `--hyperv-virtual-switch`         | `HYPERV_VIRTUAL_SWITCH`         | _first found_            |
| `--hyperv-vlan-id`                | `HYPERV_VLAN_ID`                | _undefined_              |
| `--hyperv-disable-dynamic-memory` | `HYPERV_DISABLE_DYNAMIC_MEMORY` | `false`                  |
@z

@x
## Example:
@y
## Example:
@z

@x
#### 1. Make sure Hyper-V is enabled.
@y
#### 1. Make sure Hyper-V is enabled.
@z

@x
Hyper-V is automatically enabled on a Docker Desktop for Windows installation. To enable it manually, see [instructions on how to manually enable Hyper-V](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install) on the Microsoft developer network.
@y
Hyper-V is automatically enabled on a Docker Desktop for Windows installation. To enable it manually, see [instructions on how to manually enable Hyper-V](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install) on the Microsoft developer network.
@z

@x
#### 2. Set up a new external network switch (Optional)
@y
#### 2. Set up a new external network switch (Optional)
@z

@x
> **Note**: If you already have an external network switch, skip this setup and use that one instead.
@y
> **Note**: If you already have an external network switch, skip this setup and use that one instead.
@z

@x
Make sure you have Ethernet connectivity while you are doing this.
@y
Make sure you have Ethernet connectivity while you are doing this.
@z

@x
Open the **Hyper-V Manager**. (On Windows 10, search for the Hyper-V Manager in the lower left search field.)
@y
Open the **Hyper-V Manager**. (On Windows 10, search for the Hyper-V Manager in the lower left search field.)
@z

@x
Select the **Virtual Switch Manager** on the right-hand **Actions** panel.
@y
Select the **Virtual Switch Manager** on the right-hand **Actions** panel.
@z

@x
![Hyper-V manager](../img/hyperv-manager.png)
@y
![Hyper-V manager](../img/hyperv-manager.png)
@z

@x
Set up a new **external network switch** to use instead of DockerNAT network switch (for Moby), which is set up by default when you install Docker Desktop for Windows. If you already have another network switch set up, use that one instead but make sure it is an **external** switch.)
@y
Set up a new **external network switch** to use instead of DockerNAT network switch (for Moby), which is set up by default when you install Docker Desktop for Windows. If you already have another network switch set up, use that one instead but make sure it is an **external** switch.)
@z

@x
For this example, we created a virtual switch called `Primary Virtual Switch`.
@y
For this example, we created a virtual switch called `Primary Virtual Switch`.
@z

@x
![Defining a new virtual switch](../img/hyperv-network-switch.png)
@y
![Defining a new virtual switch](../img/hyperv-network-switch.png)
@z

@x
#### 3. Reboot
@y
#### 3. Reboot
@z

@x
See this issue on virtualbox: [Hangs on Waiting for VM to start #986](https://github.com/docker/machine/issues/986).
@y
See this issue on virtualbox: [Hangs on Waiting for VM to start #986](https://github.com/docker/machine/issues/986).
@z

@x
Reboot your desktop system to clear out any routing table problems. Without a reboot first, `docker-machine create ...` might get hung up on `Waiting for host to start...`. If you are still hung on "Waiting for host to start..." after you reboot, make sure you selected the correct network in the Virtual Switch Manager.
@y
Reboot your desktop system to clear out any routing table problems. Without a reboot first, `docker-machine create ...` might get hung up on `Waiting for host to start...`. If you are still hung on "Waiting for host to start..." after you reboot, make sure you selected the correct network in the Virtual Switch Manager.
@z

@x
#### 4. Create the nodes with Docker Machine and the Microsoft Hyper-V driver
@y
#### 4. Create the nodes with Docker Machine and the Microsoft Hyper-V driver
@z

@x
* Start an "elevated" PowerShell with administrator privileges. To do this, search for PowerShell, then right click and choose ***Run as administrator***.
@y
* Start an "elevated" PowerShell with administrator privileges. To do this, search for PowerShell, then right click and choose ***Run as administrator***.
@z

@x
* Run the `docker-machine create` commands to create machines.
@y
* Run the `docker-machine create` commands to create machines.
@z

@x
    For example, if you follow along with the [Swarm mode tutorial](../../engine/swarm/swarm-tutorial/index.md)
    which asks you to create [three networked host machines](../../engine/swarm/swarm-tutorial/index.md#three-networked-host-machines),
    you can create these swarm nodes: `manager1`, `worker1`, `worker2`.
@y
    For example, if you follow along with the [Swarm mode tutorial](../../engine/swarm/swarm-tutorial/index.md)
    which asks you to create [three networked host machines](../../engine/swarm/swarm-tutorial/index.md#three-networked-host-machines),
    you can create these swarm nodes: `manager1`, `worker1`, `worker2`.
@z

@x
*   Use the Microsoft Hyper-V driver and reference the new virtual switch you created.
@y
*   Use the Microsoft Hyper-V driver and reference the new virtual switch you created.
@z

@x
    ```console
    $ docker-machine create -d hyperv --hyperv-virtual-switch <NameOfVirtualSwitch> <nameOfNode>
    ```
@y
    ```console
    $ docker-machine create -d hyperv --hyperv-virtual-switch <NameOfVirtualSwitch> <nameOfNode>
    ```
@z

@x
    Here is an example of creating a `manager1` node:
@y
    Here is an example of creating a `manager1` node:
@z

@x
    ```console
    PS C:\WINDOWS\system32>  docker-machine create -d hyperv --hyperv-virtual-switch "Primary Virtual Switch" manager1
    Running pre-create checks...
    Creating machine...
    (manager1) Copying C:\Users\<your_username>\.docker\machine\cache\boot2docker.iso to C:\Users\<your_username>\.docker\machine\machines\manag
    er1\boot2docker.iso...
    (manager1) Creating SSH key...
    (manager1) Creating VM...
    (manager1) Using switch "Primary Virtual Switch"
    (manager1) Creating VHD
    (manager1) Starting VM...
    (manager1) Waiting for host to start...
    Waiting for machine to be running, this may take a few minutes...
    Detecting operating system of created instance...
    Waiting for SSH to be available...
    Detecting the provisioner...
    Provisioning with boot2docker...
    Copying certs to the local machine directory...
    Copying certs to the remote machine...
    Setting Docker configuration on the remote daemon...
    Checking connection to Docker...
    Docker is up and running!
    To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\Program Files\Doc
    ker\Docker\Resources\bin\docker-machine.exe env manager1
    PS C:\WINDOWS\system32>
    ```
*   Use the same process, driver, and network switch to create the other nodes.
@y
    ```console
    PS C:\WINDOWS\system32>  docker-machine create -d hyperv --hyperv-virtual-switch "Primary Virtual Switch" manager1
    Running pre-create checks...
    Creating machine...
    (manager1) Copying C:\Users\<your_username>\.docker\machine\cache\boot2docker.iso to C:\Users\<your_username>\.docker\machine\machines\manag
    er1\boot2docker.iso...
    (manager1) Creating SSH key...
    (manager1) Creating VM...
    (manager1) Using switch "Primary Virtual Switch"
    (manager1) Creating VHD
    (manager1) Starting VM...
    (manager1) Waiting for host to start...
    Waiting for machine to be running, this may take a few minutes...
    Detecting operating system of created instance...
    Waiting for SSH to be available...
    Detecting the provisioner...
    Provisioning with boot2docker...
    Copying certs to the local machine directory...
    Copying certs to the remote machine...
    Setting Docker configuration on the remote daemon...
    Checking connection to Docker...
    Docker is up and running!
    To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\Program Files\Doc
    ker\Docker\Resources\bin\docker-machine.exe env manager1
    PS C:\WINDOWS\system32>
    ```
*   Use the same process, driver, and network switch to create the other nodes.
@z

@x
    For our example, the commands are:
@y
    For our example, the commands are:
@z

@x
    ```console
    $ docker-machine create -d hyperv --hyperv-virtual-switch "Primary Virtual Switch" worker1
    $ docker-machine create -d hyperv --hyperv-virtual-switch "Primary Virtual Switch" worker2
    ```
@y
    ```console
    $ docker-machine create -d hyperv --hyperv-virtual-switch "Primary Virtual Switch" worker1
    $ docker-machine create -d hyperv --hyperv-virtual-switch "Primary Virtual Switch" worker2
    ```
@z

@x
## Where to go next
@y
## Where to go next
@z

@x
As a point of interest, the virtual machines you create with
[`docker-machine create`](../reference/create.md) show up in the
Hyper-V Manager under "Virtual Machines", but you need to manage them with
[`docker-machine`](../reference/index.md) commands and not through the Hyper-V
Manager.
@y
As a point of interest, the virtual machines you create with
[`docker-machine create`](../reference/create.md) show up in the
Hyper-V Manager under "Virtual Machines", but you need to manage them with
[`docker-machine`](../reference/index.md) commands and not through the Hyper-V
Manager.
@z

@x
To get started using `docker-machine` commands, see these topics:
@y
To get started using `docker-machine` commands, see these topics:
@z

@x
*  [Run containers and experiment with Machine commands](../get-started.md#run-containers-and-experiment-with-machine-commands) and the introductory topics that follow
@y
*  [Run containers and experiment with Machine commands](../get-started.md#run-containers-and-experiment-with-machine-commands) and the introductory topics that follow
@z

@x
* [Docker Machine commmand line reference](../reference/index.md)
@y
* [Docker Machine commmand line reference](../reference/index.md)
@z
