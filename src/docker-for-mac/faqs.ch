%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions
keywords: mac faqs
redirect_from:
- /mackit/faqs/
title: Frequently asked questions (FAQ)
---
@y
---
description: Frequently asked questions
keywords: mac faqs
redirect_from:
- /mackit/faqs/
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
## What is Docker.app?
@y
## What is Docker.app?
@z

@x
`Docker.app` is Docker Desktop on Mac. It bundles the Docker client and Docker Engine. `Docker.app` uses the macOS Hypervisor.framework to run containers, which means that a separate VirtualBox is not required to run Docker Desktop.
@y
`Docker.app` is Docker Desktop on Mac. It bundles the Docker client and Docker Engine. `Docker.app` uses the macOS Hypervisor.framework to run containers, which means that a separate VirtualBox is not required to run Docker Desktop.
@z

@x
## What are the system requirements for Docker Desktop?
@y
## What are the system requirements for Docker Desktop?
@z

@x
You need a Mac that supports hardware virtualization. For more information, see [Docker Desktop Mac system requirements](install.md#system-requirements).
@y
You need a Mac that supports hardware virtualization. For more information, see [Docker Desktop Mac system requirements](install.md#system-requirements).
@z

@x
## Is Docker Desktop compatible with Apple silicon processors?
@y
## Is Docker Desktop compatible with Apple silicon processors?
@z

@x
At the moment, Docker Desktop is compatible with Intel processors only. You can follow the status of Apple Silicon support in our [roadmap](https://github.com/docker/roadmap/issues/142){:target="_blank" rel="noopener" class="_"}.
@y
At the moment, Docker Desktop is compatible with Intel processors only. You can follow the status of Apple Silicon support in our [roadmap](https://github.com/docker/roadmap/issues/142){:target="_blank" rel="noopener" class="_"}.
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
You might need to provide the location of the Engine API for Docker clients and
development tools.
@y
You might need to provide the location of the Engine API for Docker clients and
development tools.
@z

@x
On Docker Desktop, clients can connect to the Docker Engine through a Unix
socket: `unix:///var/run/docker.sock`.
@y
On Docker Desktop, clients can connect to the Docker Engine through a Unix
socket: `unix:///var/run/docker.sock`.
@z

@x
See also [Docker Engine API](../engine/api/index.md) and Docker Desktop for Mac forums topic
[Using pycharm Docker plugin..](https://forums.docker.com/t/using-pycharm-docker-plugin-with-docker-beta/8617){: target="_blank" rel="noopener" class="_"}.
@y
See also [Docker Engine API](../engine/api/index.md) and Docker Desktop for Mac forums topic
[Using pycharm Docker plugin..](https://forums.docker.com/t/using-pycharm-docker-plugin-with-docker-beta/8617){: target="_blank" rel="noopener" class="_"}.
@z

@x
If you are working with applications like [Apache Maven](https://maven.apache.org/){: target="_blank" rel="noopener" class="_"}
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
For example:
@y
If you are working with applications like [Apache Maven](https://maven.apache.org/){: target="_blank" rel="noopener" class="_"}
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
For example:
@z

@x
```bash
export DOCKER_HOST=unix:///var/run/docker.sock
```
@y
```bash
export DOCKER_HOST=unix:///var/run/docker.sock
```
@z

@x
### How do I connect from a container to a service on the host?
@y
### How do I connect from a container to a service on the host?
@z

@x
Mac has a changing IP address (or none if you have no network access). We recommend that you attach an unused IP to the `lo0` interface on the
Mac so that containers can connect to this address.
@y
Mac has a changing IP address (or none if you have no network access). We recommend that you attach an unused IP to the `lo0` interface on the
Mac so that containers can connect to this address.
@z

@x
For more information and examples, see
[I want to connect from a container to a service on the host](networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host) in the [Networking](networking.md) topic.
@y
For more information and examples, see
[I want to connect from a container to a service on the host](networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host) in the [Networking](networking.md) topic.
@z

@x
### How do I connect to a container from Mac?
@y
### How do I connect to a container from Mac?
@z

@x
We recommend that you publish a port, or connect from another container. You can use the same method on Linux if the container is on an overlay network and not a bridge network, as these are not routed.
@y
We recommend that you publish a port, or connect from another container. You can use the same method on Linux if the container is on an overlay network and not a bridge network, as these are not routed.
@z

@x
For more information and examples, see
[I want to connect to a container from the Mac](networking.md#i-want-to-connect-to-a-container-from-the-mac) in the [Networking](networking.md) topic.
@y
For more information and examples, see
[I want to connect to a container from the Mac](networking.md#i-want-to-connect-to-a-container-from-the-mac) in the [Networking](networking.md) topic.
@z

@x
### How do I add custom CA certificates?
@y
### How do I add custom CA certificates?
@z

@x
Docker Desktop supports all trusted certificate authorities (CAs) (root or intermediate). For more information on adding server and client side certs, see
[Add TLS certificates](index.md#add-tls-certificates) in the Getting Started topic.
@y
Docker Desktop supports all trusted certificate authorities (CAs) (root or intermediate). For more information on adding server and client side certs, see
[Add TLS certificates](index.md#add-tls-certificates) in the Getting Started topic.
@z

@x
### How do I add client certificates?
@y
### How do I add client certificates?
@z

@x
For information on adding client certificates, see
[Add client certificates](index.md#add-client-certificates) in the Getting Started topic.
@y
For information on adding client certificates, see
[Add client certificates](index.md#add-client-certificates) in the Getting Started topic.
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
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or
VMware Fusion on a Mac provided that the VM is properly configured. However,
problems and intermittent failures may still occur due to the way these apps
virtualize the hardware. For these reasons, **Docker Desktop is not supported in
nested virtualization scenarios**. It might work in some cases, and not in others.
For more information, see [Running Docker Desktop in nested virtualization scenarios](../docker-for-windows/troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios).
@y
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or
VMware Fusion on a Mac provided that the VM is properly configured. However,
problems and intermittent failures may still occur due to the way these apps
virtualize the hardware. For these reasons, **Docker Desktop is not supported in
nested virtualization scenarios**. It might work in some cases, and not in others.
For more information, see [Running Docker Desktop in nested virtualization scenarios](../docker-for-windows/troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios).
@z

@x
## Components of Docker Desktop
@y
## Components of Docker Desktop
@z

@x
### What is HyperKit?
@y
### What is HyperKit?
@z

@x
HyperKit is a hypervisor built on top of the Hypervisor.framework in macOS. It runs entirely in userspace and has no other
dependencies.
@y
HyperKit is a hypervisor built on top of the Hypervisor.framework in macOS. It runs entirely in userspace and has no other
dependencies.
@z

@x
We use HyperKit to eliminate the need for other VM products, such as Oracle
VirtualBox or VMWare Fusion.
@y
We use HyperKit to eliminate the need for other VM products, such as Oracle
VirtualBox or VMWare Fusion.
@z

@x
### What is the benefit of HyperKit?
@y
### What is the benefit of HyperKit?
@z

@x
HyperKit is thinner than VirtualBox and VMWare fusion, and the version we include is customized for Docker workloads on Mac.
@y
HyperKit is thinner than VirtualBox and VMWare fusion, and the version we include is customized for Docker workloads on Mac.
@z

@x
### Why is com.docker.vmnetd running after I quit the app?
@y
### Why is com.docker.vmnetd running after I quit the app?
@z

@x
The privileged helper process `com.docker.vmnetd` is started by `launchd` and
runs in the background. The process does not consume any resources unless
Docker.app connects to it, so it's safe to ignore.
@y
The privileged helper process `com.docker.vmnetd` is started by `launchd` and
runs in the background. The process does not consume any resources unless
Docker.app connects to it, so it's safe to ignore.
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
Everything is fair game. We'd like your impressions on the download-install
process, startup, functionality available, the GUI, usefulness of the app,
command line integration, and so on. Tell us about problems, what you like, or
functionality you'd like to see added.
@y
Everything is fair game. We'd like your impressions on the download-install
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
You can find information about diagnosing and troubleshooting common issues in the [Logs and Troubleshooting](troubleshoot) topic.
@y
You can find information about diagnosing and troubleshooting common issues in the [Logs and Troubleshooting](troubleshoot) topic.
@z

@x
If you do not find a solution in Troubleshooting, browse issues on
[Docker Desktop for Mac issues on GitHub](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} or create a new one. You can also create new issues based on diagnostics. To learn more, see
[Diagnose problems, send feedback, and create GitHub issues](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues).
@y
If you do not find a solution in Troubleshooting, browse issues on
[Docker Desktop for Mac issues on GitHub](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} or create a new one. You can also create new issues based on diagnostics. To learn more, see
[Diagnose problems, send feedback, and create GitHub issues](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues).
@z

@x
The [Docker Desktop for Mac forum](https://forums.docker.com/c/docker-for-mac){: target="_blank" rel="noopener" class="_"}
provides discussion threads as well, and you can create discussion topics there,
but we recommend using the GitHub issues over the forums for better tracking and
response.
@y
The [Docker Desktop for Mac forum](https://forums.docker.com/c/docker-for-mac){: target="_blank" rel="noopener" class="_"}
provides discussion threads as well, and you can create discussion topics there,
but we recommend using the GitHub issues over the forums for better tracking and
response.
@z

@x
### How can I opt out of sending my usage data?
@y
### How can I opt out of sending my usage data?
@z

@x
If you do not want to send of usage data, use the Stable channel. For more
information, see [What is the difference between the Stable and Edge versions of Docker Desktop](#stable-and-edge-releases).
@y
If you do not want to send of usage data, use the Stable channel. For more
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
By default Docker, Inc. will delete uploaded diagnostics bundles after 30 days unless they are referenced in an open issue on the
[docker/for-mac](https://github.com/docker/for-mac/issues) or
[docker/for-win](https://github.com/docker/for-win/issues) issue trackers. If an
issue is closed, Docker, Inc. will remove the referenced diagnostics bundles
within 30 days. You may also request the removal of a diagnostics bundle by
either specifying the diagnostics ID or via your GitHub ID (if the diagnostics
ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the
diagnostics bundle to investigate specific user issues, but may derive high-level (non personal) metrics such as the rate of issues from it.
@y
By default Docker, Inc. will delete uploaded diagnostics bundles after 30 days unless they are referenced in an open issue on the
[docker/for-mac](https://github.com/docker/for-mac/issues) or
[docker/for-win](https://github.com/docker/for-win/issues) issue trackers. If an
issue is closed, Docker, Inc. will remove the referenced diagnostics bundles
within 30 days. You may also request the removal of a diagnostics bundle by
either specifying the diagnostics ID or via your GitHub ID (if the diagnostics
ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the
diagnostics bundle to investigate specific user issues, but may derive high-level (non personal) metrics such as the rate of issues from it.
@z
