%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
advisory: kitematic
description: Information about known issues in Kitematic
keywords: docker, documentation, about, technology, kitematic, gui
title: 'Kitematic: Known issues'
---
@y
---
advisory: kitematic
description: Information about known issues in Kitematic
keywords: docker, documentation, about, technology, kitematic, gui
title: 'Kitematic: Known issues'
---
@z

@x
The most common errors with Kitematic occur at the setup stage since creating a
VM reliably with VirtualBox can be tricky. We are working on this problem.
@y
The most common errors with Kitematic occur at the setup stage since creating a
VM reliably with VirtualBox can be tricky. We are working on this problem.
@z

@x
Below are a list of common errors and solutions that work for most people.
@y
Below are a list of common errors and solutions that work for most people.
@z

@x
## Setup error or hanging at 99%
@y
## Setup error or hanging at 99%
@z

@x
Sometimes Kitematic doesn't set up VirtualBox properly. Retrying the setup
usually works (via one of the two retry buttons). If not, try the following
commands on the command line:
@y
Sometimes Kitematic doesn't set up VirtualBox properly. Retrying the setup
usually works (via one of the two retry buttons). If not, try the following
commands on the command line:
@z

@x
- `docker-machine rm -f dev`
- `docker-machine create -d virtualbox dev`
@y
- `docker-machine rm -f dev`
- `docker-machine create -d virtualbox dev`
@z

@x
Then re-open Kitematic. This usually fixes the issue, but if it persists, feel
free to view our <a href="https://github.com/kitematic/kitematic/issues?q=is%3Aopen+is%3Aissue+label%3Abug">existing GitHub
issues</a>.
@y
Then re-open Kitematic. This usually fixes the issue, but if it persists, feel
free to view our <a href="https://github.com/kitematic/kitematic/issues?q=is%3Aopen+is%3Aissue+label%3Abug">existing GitHub
issues</a>.
@z

@x
## Contribute fixes
@y
## Contribute fixes
@z

@x
We're always looking for help to make Kitematic better and more reliable! Visit
[our GitHub page](https://github.com/kitematic/kitematic) for docs on how to
contribute.
@y
We're always looking for help to make Kitematic better and more reliable! Visit
[our GitHub page](https://github.com/kitematic/kitematic) for docs on how to
contribute.
@z

@x
Under the hood, Kitematic uses [Docker
Machine](https://github.com/docker/machine) to provision Docker-enabled VMs via
VirtualBox. We're still working on a stronger integration with this project.
Their [GitHub repo](https://github.com/docker/machine) is a great place to start
if you're looking to help fix specific issues around VM provisioning.
@y
Under the hood, Kitematic uses [Docker
Machine](https://github.com/docker/machine) to provision Docker-enabled VMs via
VirtualBox. We're still working on a stronger integration with this project.
Their [GitHub repo](https://github.com/docker/machine) is a great place to start
if you're looking to help fix specific issues around VM provisioning.
@z

@x
## View all issues
@y
## View all issues
@z

@x
For a full list of Kitematic bugs or issues see our <a href="https://github.com/kitematic/kitematic/issues?q=is%3Aopen+is%3Aissue+label%3Abug">existing GitHub
issues</a> labeled as `bug`.
@y
For a full list of Kitematic bugs or issues see our <a href="https://github.com/kitematic/kitematic/issues?q=is%3Aopen+is%3Aissue+label%3Abug">existing GitHub
issues</a> labeled as `bug`.
@z
