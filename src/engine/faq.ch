%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Most frequently asked questions.
keywords: faq, questions, documentation,  docker
redirect_from:
- /engine/misc/faq/
title: Docker frequently asked questions (FAQ)
---
@y
---
description: Most frequently asked questions.
keywords: faq, questions, documentation,  docker
redirect_from:
- /engine/misc/faq/
title: Docker frequently asked questions (FAQ)
---
@z

@x
### Does Docker run on Linux, macOS, and Windows?
@y
### Does Docker run on Linux, macOS, and Windows?
@z

@x
You can run both Linux and Windows programs and executables in Docker containers. The Docker platform runs natively on Linux (on x86-64, ARM and many other CPU architectures) and on Windows (x86-64).
@y
You can run both Linux and Windows programs and executables in Docker containers. The Docker platform runs natively on Linux (on x86-64, ARM and many other CPU architectures) and on Windows (x86-64).
@z

@x
Docker Inc. builds products that let you build and run containers on Linux, Windows and macOS.
@y
Docker Inc. builds products that let you build and run containers on Linux, Windows and macOS.
@z

@x
### What does Docker technology add to just plain LXC?
@y
### What does Docker technology add to just plain LXC?
@z

@x
Docker technology is not a replacement for [LXC](https://linuxcontainers.org/). "LXC" refers to capabilities of
the Linux kernel (specifically namespaces and control groups) which allow
sandboxing processes from one another, and controlling their resource
allocations. On top of this low-level foundation of kernel features, Docker
offers a high-level tool with several powerful functionalities:
@y
Docker technology is not a replacement for [LXC](https://linuxcontainers.org/). "LXC" refers to capabilities of
the Linux kernel (specifically namespaces and control groups) which allow
sandboxing processes from one another, and controlling their resource
allocations. On top of this low-level foundation of kernel features, Docker
offers a high-level tool with several powerful functionalities:
@z

@x
 - *Portable deployment across machines.* Docker defines a format for bundling
 an application and all its dependencies into a single object called a container. This container can be
 transferred to any Docker-enabled machine. The container can be executed there with the
 guarantee that the execution environment exposed to the application is the
 same in development, testing, and production. LXC implements process sandboxing, which is an important pre-requisite
 for portable deployment, but is not sufficient for portable deployment.
 If you sent me a copy of your application installed in a custom LXC
 configuration, it would almost certainly not run on my machine the way it does
 on yours. The app you sent me is tied to your machine's specific configuration:
 networking, storage, logging, etc. Docker defines an abstraction for
 these machine-specific settings. The exact same Docker container can
 run - unchanged - on many different machines, with many different
 configurations.
@y
 - *Portable deployment across machines.* Docker defines a format for bundling
 an application and all its dependencies into a single object called a container. This container can be
 transferred to any Docker-enabled machine. The container can be executed there with the
 guarantee that the execution environment exposed to the application is the
 same in development, testing, and production. LXC implements process sandboxing, which is an important pre-requisite
 for portable deployment, but is not sufficient for portable deployment.
 If you sent me a copy of your application installed in a custom LXC
 configuration, it would almost certainly not run on my machine the way it does
 on yours. The app you sent me is tied to your machine's specific configuration:
 networking, storage, logging, etc. Docker defines an abstraction for
 these machine-specific settings. The exact same Docker container can
 run - unchanged - on many different machines, with many different
 configurations.
@z

@x
 - *Application-centric.* Docker is optimized for the deployment of
 applications, as opposed to machines. This is reflected in its API, user
 interface, design philosophy and documentation. By contrast, the `lxc` helper
 scripts focus on containers as lightweight machines - basically servers that
 boot faster and need less RAM. We think there's more to containers than just
 that.
@y
 - *Application-centric.* Docker is optimized for the deployment of
 applications, as opposed to machines. This is reflected in its API, user
 interface, design philosophy and documentation. By contrast, the `lxc` helper
 scripts focus on containers as lightweight machines - basically servers that
 boot faster and need less RAM. We think there's more to containers than just
 that.
@z

@x
 - *Automatic build.* Docker includes [*a tool for developers to automatically
 assemble a container from their source
 code*](/engine/reference/builder/), with full control over application
 dependencies, build tools, packaging etc. They are free to use `make`, `maven`,
 `chef`, `puppet`, `salt,` Debian packages, RPMs, source tarballs, or any
 combination of the above, regardless of the configuration of the machines.
@y
 - *Automatic build.* Docker includes [*a tool for developers to automatically
 assemble a container from their source
 code*](/engine/reference/builder/), with full control over application
 dependencies, build tools, packaging etc. They are free to use `make`, `maven`,
 `chef`, `puppet`, `salt,` Debian packages, RPMs, source tarballs, or any
 combination of the above, regardless of the configuration of the machines.
@z

@x
 - *Versioning.* Docker includes git-like capabilities for tracking successive
 versions of a container, inspecting the diff between versions, committing new
 versions, rolling back etc. The history also includes how a container was
 assembled and by whom, so you get full traceability from the production server
 all the way back to the upstream developer. Docker also implements incremental
 uploads and downloads, similar to `git pull`, so new versions of a container
 can be transferred by only sending diffs.
@y
 - *Versioning.* Docker includes git-like capabilities for tracking successive
 versions of a container, inspecting the diff between versions, committing new
 versions, rolling back etc. The history also includes how a container was
 assembled and by whom, so you get full traceability from the production server
 all the way back to the upstream developer. Docker also implements incremental
 uploads and downloads, similar to `git pull`, so new versions of a container
 can be transferred by only sending diffs.
@z

@x
 - *Component re-use.* Any container can be used as a [*parent image*](../glossary.md#parent_image) to
create more specialized components. This can be done manually or as part of an
automated build. For example you can prepare the ideal Python environment, and
use it as a base for 10 different applications. Your ideal PostgreSQL setup can
be re-used for all your future projects. And so on.
@y
 - *Component re-use.* Any container can be used as a [*parent image*](../glossary.md#parent_image) to
create more specialized components. This can be done manually or as part of an
automated build. For example you can prepare the ideal Python environment, and
use it as a base for 10 different applications. Your ideal PostgreSQL setup can
be re-used for all your future projects. And so on.
@z

@x
 - *Sharing.* Docker has access to a public registry [on Docker
Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_"} where thousands of
people have uploaded useful images: anything from Redis, CouchDB, PostgreSQL to
IRC bouncers to Rails app servers to Hadoop to base images for various Linux
distros. The [*registry*](../registry/index.md) also includes an official "standard
library" of useful containers maintained by the Docker team. The registry itself
is open-source, so anyone can deploy their own registry to store and transfer
private containers, for internal server deployments for example.
@y
 - *Sharing.* Docker has access to a public registry [on Docker
Hub](https://hub.docker.com/){: target="_blank" rel="noopener" class="_"} where thousands of
people have uploaded useful images: anything from Redis, CouchDB, PostgreSQL to
IRC bouncers to Rails app servers to Hadoop to base images for various Linux
distros. The [*registry*](../registry/index.md) also includes an official "standard
library" of useful containers maintained by the Docker team. The registry itself
is open-source, so anyone can deploy their own registry to store and transfer
private containers, for internal server deployments for example.
@z

@x
 - *Tool ecosystem.* Docker defines an API for automating and customizing the
 creation and deployment of containers. There are a huge number of tools
 integrating with Docker to extend its capabilities. PaaS-like deployment
 (Dokku, Deis, Flynn), multi-node orchestration (Maestro, Salt, Mesos, Openstack
 Nova), management dashboards (docker-ui, Openstack Horizon, Shipyard),
 configuration management (Chef, Puppet), continuous integration (Jenkins,
 Strider, Travis), etc. Docker is rapidly establishing itself as the standard
 for container-based tooling.
@y
 - *Tool ecosystem.* Docker defines an API for automating and customizing the
 creation and deployment of containers. There are a huge number of tools
 integrating with Docker to extend its capabilities. PaaS-like deployment
 (Dokku, Deis, Flynn), multi-node orchestration (Maestro, Salt, Mesos, Openstack
 Nova), management dashboards (docker-ui, Openstack Horizon, Shipyard),
 configuration management (Chef, Puppet), continuous integration (Jenkins,
 Strider, Travis), etc. Docker is rapidly establishing itself as the standard
 for container-based tooling.
@z

@x
### What is different between a Docker container and a VM?
@y
### What is different between a Docker container and a VM?
@z

@x
There's a great StackOverflow answer [showing the differences](
https://stackoverflow.com/questions/16047306/how-is-docker-io-different-from-a-normal-virtual-machine){: target="_blank" rel="noopener" class="_"}.
@y
There's a great StackOverflow answer [showing the differences](
https://stackoverflow.com/questions/16047306/how-is-docker-io-different-from-a-normal-virtual-machine){: target="_blank" rel="noopener" class="_"}.
@z

@x
### Do I lose my data when the container exits?
@y
### Do I lose my data when the container exits?
@z

@x
Not at all! Any data that your application writes to disk gets preserved in its
container until you explicitly delete the container. The file system for the
container persists even after the container halts.
@y
Not at all! Any data that your application writes to disk gets preserved in its
container until you explicitly delete the container. The file system for the
container persists even after the container halts.
@z

@x
### How far do Docker containers scale?
@y
### How far do Docker containers scale?
@z

@x
Some of the largest server farms in the world today are based on containers.
Large web deployments like Google and Twitter, and platform providers such as
Heroku run on container technology, at a scale of hundreds of
thousands or even millions of containers.
@y
Some of the largest server farms in the world today are based on containers.
Large web deployments like Google and Twitter, and platform providers such as
Heroku run on container technology, at a scale of hundreds of
thousands or even millions of containers.
@z

@x
### How do I connect Docker containers?
@y
### How do I connect Docker containers?
@z

@x
Currently the recommended way to connect containers is via the Docker network
feature. You can see details of [how to work with Docker networks](../network/bridge.md).
@y
Currently the recommended way to connect containers is via the Docker network
feature. You can see details of [how to work with Docker networks](../network/bridge.md).
@z

@x
### How do I run more than one process in a Docker container?
@y
### How do I run more than one process in a Docker container?
@z

@x
This approach is discouraged for most use cases. For maximum efficiency and
isolation, each container should address one specific area of concern. However,
if you need to run multiple services within a single container, see
[Run multiple services in a container](../config/containers/multi-service_container.md).
@y
This approach is discouraged for most use cases. For maximum efficiency and
isolation, each container should address one specific area of concern. However,
if you need to run multiple services within a single container, see
[Run multiple services in a container](../config/containers/multi-service_container.md).
@z

@x
### How do I report a security issue with Docker?
@y
### How do I report a security issue with Docker?
@z

@x
You can learn about the project's security policy
[here](https://www.docker.com/security/) and report security issues to this
[mailbox](mailto:security@docker.com).
@y
You can learn about the project's security policy
[here](https://www.docker.com/security/) and report security issues to this
[mailbox](mailto:security@docker.com).
@z

@x
### Why do I need to sign my commits to Docker with the DCO?
@y
### Why do I need to sign my commits to Docker with the DCO?
@z

@x
Read [our blog post](
https://www.docker.com/blog/docker-code-contributions-require-developer-certificate-of-origin/){: target="_blank" rel="noopener" class="_"} on the introduction of the DCO.
@y
Read [our blog post](
https://www.docker.com/blog/docker-code-contributions-require-developer-certificate-of-origin/){: target="_blank" rel="noopener" class="_"} on the introduction of the DCO.
@z

@x
### When building an image, should I prefer system libraries or bundled ones?
@y
### When building an image, should I prefer system libraries or bundled ones?
@z

@x
*This is a summary of a discussion on the [docker-dev mailing list](
https://groups.google.com/forum/#!topic/docker-dev/L2RBSPDu1L0){: target="_blank" rel="noopener" class="_"}.*
@y
*This is a summary of a discussion on the [docker-dev mailing list](
https://groups.google.com/forum/#!topic/docker-dev/L2RBSPDu1L0){: target="_blank" rel="noopener" class="_"}.*
@z

@x
Virtually all programs depend on third-party libraries. Most frequently, they
use dynamic linking and some kind of package dependency, so that when
multiple programs need the same library, it is installed only once.
@y
Virtually all programs depend on third-party libraries. Most frequently, they
use dynamic linking and some kind of package dependency, so that when
multiple programs need the same library, it is installed only once.
@z

@x
Some programs, however, bundle their third-party libraries, because they
rely on very specific versions of those libraries.
@y
Some programs, however, bundle their third-party libraries, because they
rely on very specific versions of those libraries.
@z

@x
When creating a Docker image, is it better to use the bundled libraries, or
should you build those programs so that they use the default system libraries
instead?
@y
When creating a Docker image, is it better to use the bundled libraries, or
should you build those programs so that they use the default system libraries
instead?
@z

@x
The key point about system libraries is not about saving disk or memory space.
It is about security. All major distributions handle security seriously, by
having dedicated security teams, following up closely with published
vulnerabilities, and disclosing advisories themselves. (Look at the [Debian
Security Information](https://www.debian.org/security/){: target="_blank" rel="noopener" class="_"}
for an example of those procedures.) Upstream developers, however, do not always
implement similar practices.
@y
The key point about system libraries is not about saving disk or memory space.
It is about security. All major distributions handle security seriously, by
having dedicated security teams, following up closely with published
vulnerabilities, and disclosing advisories themselves. (Look at the [Debian
Security Information](https://www.debian.org/security/){: target="_blank" rel="noopener" class="_"}
for an example of those procedures.) Upstream developers, however, do not always
implement similar practices.
@z

@x
Before setting up a Docker image to compile a program from source, if you want
to use bundled libraries, you should check if the upstream authors provide a
convenient way to announce security vulnerabilities, and if they update their
bundled libraries in a timely manner. If they don't, you are exposing yourself
(and the users of your image) to security vulnerabilities.
@y
Before setting up a Docker image to compile a program from source, if you want
to use bundled libraries, you should check if the upstream authors provide a
convenient way to announce security vulnerabilities, and if they update their
bundled libraries in a timely manner. If they don't, you are exposing yourself
(and the users of your image) to security vulnerabilities.
@z

@x
Likewise, before using packages built by others, you should check if the
channels providing those packages implement similar security best practices.
Downloading and installing an "all-in-one" .deb or .rpm sounds great at first,
except if you have no way to figure out that it contains a copy of the OpenSSL
library vulnerable to the [Heartbleed](https://heartbleed.com){: target="_blank" rel="noopener" class="_"} bug.
@y
Likewise, before using packages built by others, you should check if the
channels providing those packages implement similar security best practices.
Downloading and installing an "all-in-one" .deb or .rpm sounds great at first,
except if you have no way to figure out that it contains a copy of the OpenSSL
library vulnerable to the [Heartbleed](https://heartbleed.com){: target="_blank" rel="noopener" class="_"} bug.
@z

@x
### Why is `DEBIAN_FRONTEND=noninteractive` discouraged in Dockerfiles?
@y
### Why is `DEBIAN_FRONTEND=noninteractive` discouraged in Dockerfiles?
@z

@x
When building Docker images on Debian and Ubuntu you may have seen errors like:
@y
When building Docker images on Debian and Ubuntu you may have seen errors like:
@z

@x
    unable to initialize frontend: Dialog
@y
    unable to initialize frontend: Dialog
@z

@x
These errors don't stop the image from being built but inform you that the
installation process tried to open a dialog box, but couldn't. Generally,
these errors are safe to ignore.
@y
These errors don't stop the image from being built but inform you that the
installation process tried to open a dialog box, but couldn't. Generally,
these errors are safe to ignore.
@z

@x
Some people circumvent these errors by changing the `DEBIAN_FRONTEND`
environment variable inside the Dockerfile using:
@y
Some people circumvent these errors by changing the `DEBIAN_FRONTEND`
environment variable inside the Dockerfile using:
@z

@x
    ENV DEBIAN_FRONTEND=noninteractive
@y
    ENV DEBIAN_FRONTEND=noninteractive
@z

@x
This prevents the installer from opening dialog boxes during installation which
stops the errors.
@y
This prevents the installer from opening dialog boxes during installation which
stops the errors.
@z

@x
While this may sound like a good idea, it *may* have side effects. The
`DEBIAN_FRONTEND` environment variable is inherited by all images and
containers built from your image, effectively changing their behavior. People
using those images run into problems when installing software
interactively, because installers do not show any dialog boxes.
@y
While this may sound like a good idea, it *may* have side effects. The
`DEBIAN_FRONTEND` environment variable is inherited by all images and
containers built from your image, effectively changing their behavior. People
using those images run into problems when installing software
interactively, because installers do not show any dialog boxes.
@z

@x
Because of this, and because setting `DEBIAN_FRONTEND` to `noninteractive` is
mainly a 'cosmetic' change, we *discourage* changing it.
@y
Because of this, and because setting `DEBIAN_FRONTEND` to `noninteractive` is
mainly a 'cosmetic' change, we *discourage* changing it.
@z

@x
If you *really* need to change its setting, make sure to change it back to its
[default value](https://www.debian.org/releases/stable/amd64/ch05s03.en.html#installer-args){: target="_blank" rel="noopener" class="_"}
afterwards.
@y
If you *really* need to change its setting, make sure to change it back to its
[default value](https://www.debian.org/releases/stable/amd64/ch05s03.en.html#installer-args){: target="_blank" rel="noopener" class="_"}
afterwards.
@z

@x
### Why do I get `Connection reset by peer` when making a request to a service running in a container?
@y
### Why do I get `Connection reset by peer` when making a request to a service running in a container?
@z

@x
Typically, this message is returned if the service is already bound to your
localhost. As a result, requests coming to the container from outside are
dropped. To correct this problem, change the service's configuration on your
localhost so that the service accepts requests from all IPs.  If you aren't sure
how to do this, check the documentation for your OS.
@y
Typically, this message is returned if the service is already bound to your
localhost. As a result, requests coming to the container from outside are
dropped. To correct this problem, change the service's configuration on your
localhost so that the service accepts requests from all IPs.  If you aren't sure
how to do this, check the documentation for your OS.
@z

@x
### Why do I get `Cannot connect to the Docker daemon. Is the docker daemon running on this host?` when using docker-machine?
@y
### Why do I get `Cannot connect to the Docker daemon. Is the docker daemon running on this host?` when using docker-machine?
@z

@x
This error points out that the docker client cannot connect to the virtual
machine. This means that either the virtual machine that works underneath
`docker-machine` is not running or that the client doesn't correctly point at
it.
@y
This error points out that the docker client cannot connect to the virtual
machine. This means that either the virtual machine that works underneath
`docker-machine` is not running or that the client doesn't correctly point at
it.
@z

@x
To verify that the docker machine is running you can use the `docker-machine ls`
command and start it with `docker-machine start` if needed.
@y
To verify that the docker machine is running you can use the `docker-machine ls`
command and start it with `docker-machine start` if needed.
@z

@x
    $ docker-machine ls
    NAME             ACTIVE   DRIVER       STATE     URL   SWARM                   DOCKER    ERRORS
    default          -        virtualbox   Stopped                                 Unknown
@y
    $ docker-machine ls
    NAME             ACTIVE   DRIVER       STATE     URL   SWARM                   DOCKER    ERRORS
    default          -        virtualbox   Stopped                                 Unknown
@z

@x
    $ docker-machine start default
@y
    $ docker-machine start default
@z

@x
You need to tell Docker to talk to that machine. You can do this with the
`docker-machine env` command. For example,
@y
You need to tell Docker to talk to that machine. You can do this with the
`docker-machine env` command. For example,
@z

@x
    $ eval "$(docker-machine env default)"
    $ docker ps
@y
    $ eval "$(docker-machine env default)"
    $ docker ps
@z

@x
### Where can I find more answers?
@y
### Where can I find more answers?
@z

@x
You can find more answers on:
@y
You can find more answers on:
@z

@x
- [Docker community Slack channel](https://dockr.ly/slack){: target="_blank" rel="noopener" class="_"}
- [Docker Support Forums](https://forums.docker.com){: target="_blank" rel="noopener" class="_"}
- [GitHub](https://github.com/moby/moby){: target="_blank" rel="noopener" class="_"}
- [Ask questions on Stackoverflow](https://stackoverflow.com/search?q=docker){: target="_blank" rel="noopener" class="_"}
- [Join the conversation on Twitter](https://twitter.com/docker){: target="_blank" rel="noopener" class="_"}
@y
- [Docker community Slack channel](https://dockr.ly/slack){: target="_blank" rel="noopener" class="_"}
- [Docker Support Forums](https://forums.docker.com){: target="_blank" rel="noopener" class="_"}
- [GitHub](https://github.com/moby/moby){: target="_blank" rel="noopener" class="_"}
- [Ask questions on Stackoverflow](https://stackoverflow.com/search?q=docker){: target="_blank" rel="noopener" class="_"}
- [Join the conversation on Twitter](https://twitter.com/docker){: target="_blank" rel="noopener" class="_"}
@z
