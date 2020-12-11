%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions
keywords: windows faqs
title: Frequently asked questions (FAQ)
---
@y
---
description: Frequently asked questions
keywords: windows faqs
title: Frequently asked questions (FAQ)
---
@z

@x
## Docker Desktop releases
@y
## Docker Desktop releases
@z

@x
### When will Docker Desktop move to a cumulative release stream?
@y
### When will Docker Desktop move to a cumulative release stream?
@z

@x
Starting with version 3.0.0, Docker Desktop will be available as a single, cumulative release stream. This is the same version for both Stable and Edge users. The next release after Docker Desktop 3.0.0 will be the first to be applied as a delta update. For more information, see [Automatic updates](install.md#automatic-updates).
@y
Starting with version 3.0.0, Docker Desktop will be available as a single, cumulative release stream. This is the same version for both Stable and Edge users. The next release after Docker Desktop 3.0.0 will be the first to be applied as a delta update. For more information, see [Automatic updates](install.md#automatic-updates).
@z

@x
### How do new users install Docker Desktop?
@y
### How do new users install Docker Desktop?
@z

@x
Each Docker Desktop release will also be delivered as a full installer for new users. The same will apply if you have skipped a version, although this will not normally happen as updates will be applied automatically.
@y
Each Docker Desktop release will also be delivered as a full installer for new users. The same will apply if you have skipped a version, although this will not normally happen as updates will be applied automatically.
@z

@x
### How frequent will new releases be?
@y
### How frequent will new releases be?
@z

@x
New releases will be available roughly monthly, similar to Edge today, unless there are critical fixes that need to be released sooner.
@y
New releases will be available roughly monthly, similar to Edge today, unless there are critical fixes that need to be released sooner.
@z

@x
### How do I ensure that all users on my team are using the same version?
@y
### How do I ensure that all users on my team are using the same version?
@z

@x
Previously you had to manage this yourself: now it will happen automatically as a side effect of all users being on the latest version.
@y
Previously you had to manage this yourself: now it will happen automatically as a side effect of all users being on the latest version.
@z

@x
### My colleague has got a new version but I haven’t got it yet.
@y
### My colleague has got a new version but I haven’t got it yet.
@z

@x
Sometimes we may roll out a new version gradually over a few days. Therefore, if you wait, it will turn up soon. Alternatively, you can select **Check for Updates** from the Docker menu to jump the queue and get the latest version immediately.
@y
Sometimes we may roll out a new version gradually over a few days. Therefore, if you wait, it will turn up soon. Alternatively, you can select **Check for Updates** from the Docker menu to jump the queue and get the latest version immediately.
@z

@x
### Where can I find information about Stable and Edge releases?
@y
### Where can I find information about Stable and Edge releases?
@z

@x
Starting with Docker Desktop 3.0.0, Stable and Edge releases are combined into a single, cumulative release stream for all users.
@y
Starting with Docker Desktop 3.0.0, Stable and Edge releases are combined into a single, cumulative release stream for all users.
@z

@x
## What are the system requirements for Docker Desktop?
@y
## What are the system requirements for Docker Desktop?
@z

@x
For information about system requirements, see [Docker Desktop Windows system requirements](install.md#system-requirements).
@y
For information about system requirements, see [Docker Desktop Windows system requirements](install.md#system-requirements).
@z

@x
## What is an experimental feature?
@y
## What is an experimental feature?
@z

@x
{% include experimental.md %}
@y
{% include experimental.md %}
@z

@x
## How do I?
@y
## How do I?
@z

@x
### How do I connect to the remote Docker Engine API?
@y
### How do I connect to the remote Docker Engine API?
@z

@x
You might need to provide the location of the Engine API for Docker clients and development tools.
@y
You might need to provide the location of the Engine API for Docker clients and development tools.
@z

@x
On Docker Desktop, clients can connect to the Docker Engine through a
**named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@y
On Docker Desktop, clients can connect to the Docker Engine through a
**named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@z

@x
This sets `DOCKER_HOST` and `DOCKER_CERT_PATH` environment variables to the
given values (for the named pipe or TCP socket, whichever you use).
@y
This sets `DOCKER_HOST` and `DOCKER_CERT_PATH` environment variables to the
given values (for the named pipe or TCP socket, whichever you use).
@z

@x
See also [Docker Engine API](../engine/api/index.md) and the Docker Desktop for Windows forums topic [How to find the remote API](https://forums.docker.com/t/how-to-find-the-remote-api/20988){: target="_blank" rel="noopener" class="_"}.
@y
See also [Docker Engine API](../engine/api/index.md) and the Docker Desktop for Windows forums topic [How to find the remote API](https://forums.docker.com/t/how-to-find-the-remote-api/20988){: target="_blank" rel="noopener" class="_"}.
@z

@x
### How do I connect from a container to a service on the host?
@y
### How do I connect from a container to a service on the host?
@z

@x
Windows has a changing IP address (or none if you have no network access). We recommend that you connect to the special DNS name `host.docker.internal`, which resolves to the internal IP address used by the host. This is for development purposes and will not work in a production environment outside of Docker Desktop for Windows.
@y
Windows has a changing IP address (or none if you have no network access). We recommend that you connect to the special DNS name `host.docker.internal`, which resolves to the internal IP address used by the host. This is for development purposes and will not work in a production environment outside of Docker Desktop for Windows.
@z

@x
The gateway is also reachable as `gateway.docker.internal`.
@y
The gateway is also reachable as `gateway.docker.internal`.
@z

@x
For more information about the networking features in Docker Desktop for Windows, see
[Networking](networking.md).
@y
For more information about the networking features in Docker Desktop for Windows, see
[Networking](networking.md).
@z

@x
### How do I connect to a container from Windows?
@y
### How do I connect to a container from Windows?
@z

@x
We recommend that you publish a port, or connect from another container. You can use the same method on Linux if the container is on an overlay network and not a bridge network, as these are not routed.
@y
We recommend that you publish a port, or connect from another container. You can use the same method on Linux if the container is on an overlay network and not a bridge network, as these are not routed.
@z

@x
For more information and examples, see
[I want to connect to a container from Windows](networking.md#i-want-to-connect-to-a-container-from-windows) in the [Networking](networking.md) topic.
@y
For more information and examples, see
[I want to connect to a container from Windows](networking.md#i-want-to-connect-to-a-container-from-windows) in the [Networking](networking.md) topic.
@z

@x
## Volumes
@y
## Volumes
@z

@x
### Can I change permissions on shared volumes for container-specific deployment requirements?
@y
### Can I change permissions on shared volumes for container-specific deployment requirements?
@z

@x
No, at this point, Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](index.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](http://permissions-calculator.org/decode/0777/){: target="_blank" rel="noopener" class="_"}
(`read`, `write`, `execute` permissions for `user` and for 
`group`) which is not configurable.
@y
No, at this point, Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](index.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](http://permissions-calculator.org/decode/0777/){: target="_blank" rel="noopener" class="_"}
(`read`, `write`, `execute` permissions for `user` and for 
`group`) which is not configurable.
@z

@x
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes).
@y
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes).
@z

@x
### How do symlinks work on Windows?
@y
### How do symlinks work on Windows?
@z

@x
Docker Desktop supports 2 kinds of symlink:
@y
Docker Desktop supports 2 kinds of symlink:
@z

@x
1. Windows native symlinks: these are visible inside containers as symlinks.
2. Symlinks created inside a container: these are represented as [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks) i.e. regular Windows files with special metadata. These appear as symlinks inside containers but not as symlinks on the host.
@y
1. Windows native symlinks: these are visible inside containers as symlinks.
2. Symlinks created inside a container: these are represented as [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks) i.e. regular Windows files with special metadata. These appear as symlinks inside containers but not as symlinks on the host.
@z

@x
## Certificates
@y
## Certificates
@z

@x
### How do I add custom CA certificates?
@y
### How do I add custom CA certificates?
@z

@x
Docker Desktop supports all trusted Certificate Authorities (CAs) (root or
intermediate). Docker recognizes certs stored under Trust Root
Certification Authorities or Intermediate Certification Authorities.
@y
Docker Desktop supports all trusted Certificate Authorities (CAs) (root or
intermediate). Docker recognizes certs stored under Trust Root
Certification Authorities or Intermediate Certification Authorities.
@z

@x
 For more information on adding server and client side certs, see [Adding TLS certificates](index.md#adding-tls-certificates) in the Getting Started topic.
@y
 For more information on adding server and client side certs, see [Adding TLS certificates](index.md#adding-tls-certificates) in the Getting Started topic.
@z

@x
### How do I add client certificates?
@y
### How do I add client certificates?
@z

@x
For information on adding client certificates, see [Adding TLS certificates](index.md#adding-tls-certificates) in the Getting Started topic.
@y
For information on adding client certificates, see [Adding TLS certificates](index.md#adding-tls-certificates) in the Getting Started topic.
@z

@x
### Can I pass through a USB device to a container?
@y
### Can I pass through a USB device to a container?
@z

@x
Unfortunately, it is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
@y
Unfortunately, it is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
@z

@x
### Can I run Docker Desktop in nested virtualization scenarios?
@y
### Can I run Docker Desktop in nested virtualization scenarios?
@z

@x
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or VMware Fusion on a Mac provided that the VM is properly configured. However, problems and intermittent failures may still occur due to the way these apps virtualize the hardware. For these reasons, **Docker Desktop is not supported in nested virtualization scenarios**. It might work in some cases, and not in others. For more information, see [Running Docker Desktop in nested virtualization scenarios](/docker-for-windows/troubleshoot/#running-docker-desktop-in-nested-virtualization-scenarios).
@y
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or VMware Fusion on a Mac provided that the VM is properly configured. However, problems and intermittent failures may still occur due to the way these apps virtualize the hardware. For these reasons, **Docker Desktop is not supported in nested virtualization scenarios**. It might work in some cases, and not in others. For more information, see [Running Docker Desktop in nested virtualization scenarios](/docker-for-windows/troubleshoot/#running-docker-desktop-in-nested-virtualization-scenarios).
@z

@x
### Can I use VirtualBox alongside Docker Desktop?
@y
### Can I use VirtualBox alongside Docker Desktop?
@z

@x
Yes, you can run VirtualBox along with Docker Desktop if you have enabled the [ Windows Hypervisor Platform](https://docs.microsoft.com/en-us/virtualization/api/){: target="_blank" rel="noopener" class="_"} feature on your machine.
@y
Yes, you can run VirtualBox along with Docker Desktop if you have enabled the [ Windows Hypervisor Platform](https://docs.microsoft.com/en-us/virtualization/api/){: target="_blank" rel="noopener" class="_"} feature on your machine.
@z

@x
## Windows requirements
@y
## Windows requirements
@z

@x
### Can I run Docker Desktop on Windows Server?
@y
### Can I run Docker Desktop on Windows Server?
@z

@x
No, running Docker Desktop on Windows Server is not supported.
@y
No, running Docker Desktop on Windows Server is not supported.
@z

@x
### How do I run Windows containers on Windows Server?
@y
### How do I run Windows containers on Windows Server?
@z

@x
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. For more information, see the tutorial about running Windows containers on Windows Server in
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md){: target="_blank" rel="noopener" class="_"}.
@y
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. For more information, see the tutorial about running Windows containers on Windows Server in
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md){: target="_blank" rel="noopener" class="_"}.
@z

@x
### Can I install Docker Desktop on Windows 10 Home?
@y
### Can I install Docker Desktop on Windows 10 Home?
@z

@x
Windows 10 Home, version 2004 users can now install [Docker Desktop Stable 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) or a later release with the [WSL 2 backend](wsl.md).
@y
Windows 10 Home, version 2004 users can now install [Docker Desktop Stable 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) or a later release with the [WSL 2 backend](wsl.md).
@z

@x
Docker Desktop Stable releases require the Hyper-V feature which is not available in the Windows 10 Home edition.
@y
Docker Desktop Stable releases require the Hyper-V feature which is not available in the Windows 10 Home edition.
@z

@x
### Why is Windows 10 required?
@y
### Why is Windows 10 required?
@z

@x
Docker Desktop uses the Windows Hyper-V features. While older Windows versions have Hyper-V, their Hyper-V implementations lack features critical for Docker Desktop to work.
@y
Docker Desktop uses the Windows Hyper-V features. While older Windows versions have Hyper-V, their Hyper-V implementations lack features critical for Docker Desktop to work.
@z

@x
### Why does Docker Desktop fail to start when anti-virus software is installed?
@y
### Why does Docker Desktop fail to start when anti-virus software is installed?
@z

@x
Some anti-virus software may be incompatible with Hyper-V and Windows 10 builds which impact Docker
Desktop. For more information, see [Docker Desktop fails to start when anti-virus software is installed](troubleshoot.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed)
in [Troubleshooting](troubleshoot.md).
@y
Some anti-virus software may be incompatible with Hyper-V and Windows 10 builds which impact Docker
Desktop. For more information, see [Docker Desktop fails to start when anti-virus software is installed](troubleshoot.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed)
in [Troubleshooting](troubleshoot.md).
@z

@x
## Feedback
@y
## Feedback
@z

@x
### What kind of feedback are we looking for?
@y
### What kind of feedback are we looking for?
@z

@x
Everything is fair game. We'd like your impressions on the download and install
process, startup, functionality available, the GUI, usefulness of the app,
command line integration, and so on. Tell us about problems, what you like, or
functionality you'd like to see added.
@y
Everything is fair game. We'd like your impressions on the download and install
process, startup, functionality available, the GUI, usefulness of the app,
command line integration, and so on. Tell us about problems, what you like, or
functionality you'd like to see added.
@z

@x
### What if I have problems or questions?
@y
### What if I have problems or questions?
@z

@x
You can find information about diagnosing and troubleshooting common issues in the [Logs and Troubleshooting](troubleshoot.md) topic.
@y
You can find information about diagnosing and troubleshooting common issues in the [Logs and Troubleshooting](troubleshoot.md) topic.
@z

@x
If you do not find a solution in Troubleshooting, browse issues on
[Docker Desktop for Windows issues on GitHub](https://github.com/docker/for-win/issues){: target="_blank" rel="noopener" class="_"}
or create a new one. You can also create new issues based on diagnostics. To learn more, see
[Diagnose problems, send feedback, and create GitHub issues](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues).
@y
If you do not find a solution in Troubleshooting, browse issues on
[Docker Desktop for Windows issues on GitHub](https://github.com/docker/for-win/issues){: target="_blank" rel="noopener" class="_"}
or create a new one. You can also create new issues based on diagnostics. To learn more, see
[Diagnose problems, send feedback, and create GitHub issues](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues).
@z

@x
The [Docker Desktop for Windows forum](https://forums.docker.com/c/docker-for-windows){: target="_blank" rel="noopener" class="_"}
contains discussion threads. You can also create discussion topics there,
but we recommend using the GitHub issues over the forums for better tracking and
response.
@y
The [Docker Desktop for Windows forum](https://forums.docker.com/c/docker-for-windows){: target="_blank" rel="noopener" class="_"}
contains discussion threads. You can also create discussion topics there,
but we recommend using the GitHub issues over the forums for better tracking and
response.
@z

@x
### How can I opt out of sending my usage data?
@y
### How can I opt out of sending my usage data?
@z

@x
If you do not want to send usage data, use the Stable channel. For more
information, see [What is the difference between the Stable and Edge versions of Docker Desktop](#stable-and-edge-releases).
@y
If you do not want to send usage data, use the Stable channel. For more
information, see [What is the difference between the Stable and Edge versions of Docker Desktop](#stable-and-edge-releases).
@z

@x
### How is personal data handled in Docker Desktop?
@y
### How is personal data handled in Docker Desktop?
@z

@x
When uploading diagnostics to help Docker with investigating issues, the
uploaded diagnostics bundle may contain personal data such as usernames and IP
addresses. The diagnostics bundles are only accessible to Docker, Inc. employees
who are directly involved in diagnosing Docker Desktop issues. 
@y
When uploading diagnostics to help Docker with investigating issues, the
uploaded diagnostics bundle may contain personal data such as usernames and IP
addresses. The diagnostics bundles are only accessible to Docker, Inc. employees
who are directly involved in diagnosing Docker Desktop issues. 
@z

@x
By default, Docker, Inc. will delete uploaded diagnostics bundles after 30 days unless they are referenced in an open issue on the
[docker/for-mac](https://github.com/docker/for-mac/issues) or
[docker/for-win](https://github.com/docker/for-win/issues) issue trackers. If an
issue is closed, Docker, Inc. will remove the referenced diagnostics bundles
within 30 days. You may also request the removal of a diagnostics bundle by
either specifying the diagnostics ID or through your GitHub ID (if the diagnostics ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the diagnostics bundle to investigate specific user issues, but may derive high-level (non-personal) metrics such as the rate of issues from it.
@y
By default, Docker, Inc. will delete uploaded diagnostics bundles after 30 days unless they are referenced in an open issue on the
[docker/for-mac](https://github.com/docker/for-mac/issues) or
[docker/for-win](https://github.com/docker/for-win/issues) issue trackers. If an
issue is closed, Docker, Inc. will remove the referenced diagnostics bundles
within 30 days. You may also request the removal of a diagnostics bundle by
either specifying the diagnostics ID or through your GitHub ID (if the diagnostics ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the diagnostics bundle to investigate specific user issues, but may derive high-level (non-personal) metrics such as the rate of issues from it.
@z
