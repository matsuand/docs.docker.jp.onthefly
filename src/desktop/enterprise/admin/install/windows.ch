%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Install Docker Desktop Enterprise on Windows
description: Learn about Docker Desktop Enterprise
keywords: Docker EE, Windows, Docker Desktop, Enterprise
redirect_from:
- /ee/desktop/admin/install/windows/
---
@y
---
title: Install Docker Desktop Enterprise on Windows
description: Learn about Docker Desktop Enterprise
keywords: Docker EE, Windows, Docker Desktop, Enterprise
redirect_from:
- /ee/desktop/admin/install/windows/
---
@z

@x
This page contains information about the system requirements and specific instructions that help you install Docker Desktop Enterprise (DDE) on Windows. If you are using the Community version of Docker Desktop, you must uninstall Docker Desktop Community in order to install DDE.
@y
This page contains information about the system requirements and specific instructions that help you install Docker Desktop Enterprise (DDE) on Windows. If you are using the Community version of Docker Desktop, you must uninstall Docker Desktop Community in order to install DDE.
@z

@x
[Download Docker Desktop Enterprise for Windows](https://download.docker.com/win/enterprise/DockerDesktop.msi){: .button .outline-btn}
@y
[Download Docker Desktop Enterprise for Windows](https://download.docker.com/win/enterprise/DockerDesktop.msi){: .button .outline-btn}
@z

@x
>**Note:** By downloading DDE, you agree to the terms of the [Docker Software End User License Agreement](https://www.docker.com/legal/docker-software-end-user-license-agreement){: target="_blank" rel="noopener" class="_"} and the [Docker Data Processing Agreement (DPA)](https://www.docker.com/legal/data-processing-agreement){: target="_blank" rel="noopener" class="_"}.
@y
>**Note:** By downloading DDE, you agree to the terms of the [Docker Software End User License Agreement](https://www.docker.com/legal/docker-software-end-user-license-agreement){: target="_blank" rel="noopener" class="_"} and the [Docker Data Processing Agreement (DPA)](https://www.docker.com/legal/data-processing-agreement){: target="_blank" rel="noopener" class="_"}.
@z

@x
## System requirements
@y
## System requirements
@z

@x
- Windows 10 Pro or Enterprise version 15063 or later.
@y
- Windows 10 Pro or Enterprise version 15063 or later.
@z

@x
- Hyper-V and Containers Windows features must be enabled **before** installing DDE.
@y
- Hyper-V and Containers Windows features must be enabled **before** installing DDE.
@z

@x
    To enable Hyper-V and Containers features using PowerShell, run the following commands as Administrator:
@y
    To enable Hyper-V and Containers features using PowerShell, run the following commands as Administrator:
@z

@x
    `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`
@y
    `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`
@z

@x
    `Enable-WindowsOptionalFeature -Online -FeatureName Containers -All`
@y
    `Enable-WindowsOptionalFeature -Online -FeatureName Containers -All`
@z

@x
    After running the commands, reboot your system.
@y
    After running the commands, reboot your system.
@z

@x
- The following hardware prerequisites are required to successfully run Client
Hyper-V on Windows 10:
@y
- The following hardware prerequisites are required to successfully run Client
Hyper-V on Windows 10:
@z

@x
  - 64 bit processor with [Second Level Address Translation (SLAT)](http://en.wikipedia.org/wiki/Second_Level_Address_Translation)
@y
  - 64 bit processor with [Second Level Address Translation (SLAT)](http://en.wikipedia.org/wiki/Second_Level_Address_Translation)
@z

@x
  - 4GB system RAM
@y
  - 4GB system RAM
@z

@x
  - BIOS-level hardware virtualization support must be enabled in the
    BIOS settings:
@y
  - BIOS-level hardware virtualization support must be enabled in the
    BIOS settings:
@z

@x
![Virtualization Technology (VTx) must be enabled in BIOS settings](../../images/windows-prereq.png "BIOS setting information for hardware virtualization support")
@y
![Virtualization Technology (VTx) must be enabled in BIOS settings](../../images/windows-prereq.png "BIOS setting information for hardware virtualization support")
@z

@x
> **Note:** Docker supports Docker Desktop Enterprise on Windows based on Microsoft’s support lifecycle for Windows 10 operating system. For more information, see the [Windows lifecycle fact sheet](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet).
@y
> **Note:** Docker supports Docker Desktop Enterprise on Windows based on Microsoft’s support lifecycle for Windows 10 operating system. For more information, see the [Windows lifecycle fact sheet](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet).
@z

@x
## Installation
@y
## Installation
@z

@x
The Docker Desktop Enterprise installer includes Docker Engine, Docker CLI client, and Docker Compose.
@y
The Docker Desktop Enterprise installer includes Docker Engine, Docker CLI client, and Docker Compose.
@z

@x
Double-click the `.msi` file to begin the installation and follow the on-screen instructions. When the installation is complete, select **Docker Desktop** from the Start menu to start Docker Desktop.
@y
Double-click the `.msi` file to begin the installation and follow the on-screen instructions. When the installation is complete, select **Docker Desktop** from the Start menu to start Docker Desktop.
@z

@x
For information about installing DDE using the command line, see [Command line installation](#command-line-installation).
@y
For information about installing DDE using the command line, see [Command line installation](#command-line-installation).
@z

@x
## License file
@y
## License file
@z

@x
Install the Docker Desktop Enterprise license file at the following location:
@y
Install the Docker Desktop Enterprise license file at the following location:
@z

@x
    %ProgramData%\DockerDesktop\docker_subscription.lic
@y
    %ProgramData%\DockerDesktop\docker_subscription.lic
@z

@x
You must create the path if it doesn't already exist. If the license file is missing, you will be asked to provide it when you try to run Docker Desktop Enterprise. Contact your system administrator to obtain the license file.
@y
You must create the path if it doesn't already exist. If the license file is missing, you will be asked to provide it when you try to run Docker Desktop Enterprise. Contact your system administrator to obtain the license file.
@z

@x
## Firewall exceptions
@y
## Firewall exceptions
@z

@x
Docker Desktop Enterprise requires the following firewall exceptions. If you do not have firewall access, or are unsure about how to set firewall exceptions, contact your system administrator.
@y
Docker Desktop Enterprise requires the following firewall exceptions. If you do not have firewall access, or are unsure about how to set firewall exceptions, contact your system administrator.
@z

@x
- The process `com.docker.vpnkit` proxies all outgoing container TCP and
    UDP traffic. This includes Docker image downloading but not DNS
    resolution, which is performed over a loopback TCP and UDP connection
    to the main application.
@y
- The process `com.docker.vpnkit` proxies all outgoing container TCP and
    UDP traffic. This includes Docker image downloading but not DNS
    resolution, which is performed over a loopback TCP and UDP connection
    to the main application.
@z

@x
- The process `com.docker.vpnkit` binds external ports on behalf of
    containers. For example, `docker run -p 80:80 nginx` binds port 80 on all
    interfaces.
@y
- The process `com.docker.vpnkit` binds external ports on behalf of
    containers. For example, `docker run -p 80:80 nginx` binds port 80 on all
    interfaces.
@z

@x
- If using Kubernetes, the API server is exposed with TLS on `127.0.0.1:6445` by `com.docker.vpnkit`.
@y
- If using Kubernetes, the API server is exposed with TLS on `127.0.0.1:6445` by `com.docker.vpnkit`.
@z

@x
## Version packs
@y
## Version packs
@z

@x
Docker Desktop Enterprise is bundled with default version pack [Enterprise 3.0 (Docker Engine 19.03 / Kubernetes 1.14)](https://download.docker.com/win/enterprise/enterprise-3.0.ddvp). System administrators can install version packs using a command line tool to use a different version of the Docker Engine and Kubernetes for development work:
@y
Docker Desktop Enterprise is bundled with default version pack [Enterprise 3.0 (Docker Engine 19.03 / Kubernetes 1.14)](https://download.docker.com/win/enterprise/enterprise-3.0.ddvp). System administrators can install version packs using a command line tool to use a different version of the Docker Engine and Kubernetes for development work:
@z

@x
- [Docker Enterprise 2.0 (17.06/Kubernetes 1.8.11)](https://download.docker.com/win/enterprise/enterprise-2.0.ddvp)
@y
- [Docker Enterprise 2.0 (17.06/Kubernetes 1.8.11)](https://download.docker.com/win/enterprise/enterprise-2.0.ddvp)
@z

@x
- [Docker Enterprise 2.1 (18.09/Kubernetes 1.11.5)](https://download.docker.com/win/enterprise/enterprise-2.1.ddvp)
@y
- [Docker Enterprise 2.1 (18.09/Kubernetes 1.11.5)](https://download.docker.com/win/enterprise/enterprise-2.1.ddvp)
@z

@x
For information on using the CLI tool for version pack installation, see [Command line installation](#command-line-installation).
@y
For information on using the CLI tool for version pack installation, see [Command line installation](#command-line-installation).
@z

@x
Available version packs are listed within the **Version Selection** option in the Docker Desktop menu. If more than one version pack is installed, you can select the corresponding entry to work with a different version pack. After you select a different version pack, Docker Desktop restarts and the selected Docker Engine and Kubernetes versions are used.
@y
Available version packs are listed within the **Version Selection** option in the Docker Desktop menu. If more than one version pack is installed, you can select the corresponding entry to work with a different version pack. After you select a different version pack, Docker Desktop restarts and the selected Docker Engine and Kubernetes versions are used.
@z

@x
## Command line installation
@y
## Command line installation
@z

@x
>**Note:** Command line installation is supported for administrators only. You must have `administrator` access to run the CLI commands.
@y
>**Note:** Command line installation is supported for administrators only. You must have `administrator` access to run the CLI commands.
@z

@x
System administrators can use the command line for mass installation and fine tuning the Docker Desktop Enterprise deployment. Run the following command as an administrator to perform a silent installation:
@y
System administrators can use the command line for mass installation and fine tuning the Docker Desktop Enterprise deployment. Run the following command as an administrator to perform a silent installation:
@z

@x
    msiexec /i DockerDesktop.msi /quiet
@y
    msiexec /i DockerDesktop.msi /quiet
@z

@x
You can also set the following properties:
@y
You can also set the following properties:
@z

@x
- `INSTALLDIR [string]:` configures the folder to install Docker Desktop to (default is C:\Program Files\Docker\Docker)
- `STARTMENUSHORTCUT [yes|no]:` specifies whether to create an entry in the Start menu for Docker Desktop (default is yes)
- `DESKTOPSHORTCUT [yes|no]:` specifies whether to create a shortcut on the desktop for Docker Desktop (default is yes)
@y
- `INSTALLDIR [string]:` configures the folder to install Docker Desktop to (default is C:\Program Files\Docker\Docker)
- `STARTMENUSHORTCUT [yes|no]:` specifies whether to create an entry in the Start menu for Docker Desktop (default is yes)
- `DESKTOPSHORTCUT [yes|no]:` specifies whether to create a shortcut on the desktop for Docker Desktop (default is yes)
@z

@x
For example:
@y
For example:
@z

@x
    msiexec /i DockerDesktop.msi /quiet STARTMENUSHORTCUT=no INSTALLDIR=”D:\Docker Desktop”
@y
    msiexec /i DockerDesktop.msi /quiet STARTMENUSHORTCUT=no INSTALLDIR=”D:\Docker Desktop”
@z

@x
Docker Desktop Enterprise includes a command line executable to install and uninstall version packs. When you install DDE, the command line tool is installed at the following location:
@y
Docker Desktop Enterprise includes a command line executable to install and uninstall version packs. When you install DDE, the command line tool is installed at the following location:
@z

@x
    [ApplicationPath]\dockerdesktop-admin.exe
@y
    [ApplicationPath]\dockerdesktop-admin.exe
@z

@x
### Version-pack install
@y
### Version-pack install
@z

@x
Run the following command to install or upgrade a version pack to the version contained in the specified `.ddvp` archive:
@y
Run the following command to install or upgrade a version pack to the version contained in the specified `.ddvp` archive:
@z

@x
    dockerdesktop-admin.exe -InstallVersionPack=['path-to-archive']
@y
    dockerdesktop-admin.exe -InstallVersionPack=['path-to-archive']
@z

@x
>**Note:** You must stop Docker Desktop before installing a version pack.
@y
>**Note:** You must stop Docker Desktop before installing a version pack.
@z

@x
### Version-pack uninstall
@y
### Version-pack uninstall
@z

@x
Run the following command to uninstall the specified version pack:
@y
Run the following command to uninstall the specified version pack:
@z

@x
    dockerdesktop-admin.exe -UninstallVersionPack=[version-pack-name|'path-to-archive']
@y
    dockerdesktop-admin.exe -UninstallVersionPack=[version-pack-name|'path-to-archive']
@z

@x
>**Note:** You must stop Docker Desktop before uninstalling a version pack.
@y
>**Note:** You must stop Docker Desktop before uninstalling a version pack.
@z

@x
### Application uninstall
@y
### Application uninstall
@z

@x
To uninstall the application:
@y
To uninstall the application:
@z

@x
1. Open the **Add or remove programs** dialog
@y
1. Open the **Add or remove programs** dialog
@z

@x
1. Select **Docker Desktop** from the **Apps & features** list.
@y
1. Select **Docker Desktop** from the **Apps & features** list.
@z

@x
1. Click **Uninstall**.
@y
1. Click **Uninstall**.
@z
