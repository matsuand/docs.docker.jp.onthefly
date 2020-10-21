%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explains how to run a registry on macOS
keywords: registry, on-prem, images, tags, repository, distribution, macOS, recipe, advanced
title: macOS setup guide
---
@y
---
description: Explains how to run a registry on macOS
keywords: registry, on-prem, images, tags, repository, distribution, macOS, recipe, advanced
title: macOS setup guide
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
## Use-case
@y
## Use-case
@z

@x
This is useful if you intend to run a registry server natively on macOS.
@y
This is useful if you intend to run a registry server natively on macOS.
@z

@x
### Alternatives
@y
### Alternatives
@z

@x
You can start a VM on macOS, and deploy your registry normally as a container using Docker inside that VM.
@y
You can start a VM on macOS, and deploy your registry normally as a container using Docker inside that VM.
@z

@x
### Solution
@y
### Solution
@z

@x
Using the method described here, you install and compile your own from the git repository and run it as an macOS agent.
@y
Using the method described here, you install and compile your own from the git repository and run it as an macOS agent.
@z

@x
### Gotchas
@y
### Gotchas
@z

@x
Production services operation on macOS is out of scope of this document. Be sure you understand well these aspects before considering going to production with this.
@y
Production services operation on macOS is out of scope of this document. Be sure you understand well these aspects before considering going to production with this.
@z

@x
## Setup golang on your machine
@y
## Setup golang on your machine
@z

@x
If you know, safely skip to the next section.
@y
If you know, safely skip to the next section.
@z

@x
If you don't, the TLDR is:
@y
If you don't, the TLDR is:
@z

@x
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    source ~/.gvm/scripts/gvm
    gvm install go1.4.2
    gvm use go1.4.2
@y
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    source ~/.gvm/scripts/gvm
    gvm install go1.4.2
    gvm use go1.4.2
@z

@x
If you want to understand, you should read [How to Write Go Code](https://golang.org/doc/code.html).
@y
If you want to understand, you should read [How to Write Go Code](https://golang.org/doc/code.html).
@z

@x
## Checkout the Docker Distribution source tree
@y
## Checkout the Docker Distribution source tree
@z

@x
    mkdir -p $GOPATH/src/github.com/docker
    git clone https://github.com/docker/distribution.git $GOPATH/src/github.com/docker/distribution
    cd $GOPATH/src/github.com/docker/distribution
@y
    mkdir -p $GOPATH/src/github.com/docker
    git clone https://github.com/docker/distribution.git $GOPATH/src/github.com/docker/distribution
    cd $GOPATH/src/github.com/docker/distribution
@z

@x
## Build the binary
@y
## Build the binary
@z

@x
    GOPATH=$(PWD)/Godeps/_workspace:$GOPATH make binaries
    sudo mkdir -p /usr/local/libexec
    sudo cp bin/registry /usr/local/libexec/registry
@y
    GOPATH=$(PWD)/Godeps/_workspace:$GOPATH make binaries
    sudo mkdir -p /usr/local/libexec
    sudo cp bin/registry /usr/local/libexec/registry
@z

@x
## Setup
@y
## Setup
@z

@x
Copy the registry configuration file in place:
@y
Copy the registry configuration file in place:
@z

@x
    mkdir /Users/Shared/Registry
    cp docs/osx/config.yml /Users/Shared/Registry/config.yml
@y
    mkdir /Users/Shared/Registry
    cp docs/osx/config.yml /Users/Shared/Registry/config.yml
@z

@x
## Run the Docker Registry under launchd
@y
## Run the Docker Registry under launchd
@z

@x
Copy the Docker registry plist into place:
@y
Copy the Docker registry plist into place:
@z

@x
    plutil -lint registry/recipes/osx/com.docker.registry.plist
    cp registry/recipes/osx/com.docker.registry.plist ~/Library/LaunchAgents/
    chmod 644 ~/Library/LaunchAgents/com.docker.registry.plist
@y
    plutil -lint registry/recipes/osx/com.docker.registry.plist
    cp registry/recipes/osx/com.docker.registry.plist ~/Library/LaunchAgents/
    chmod 644 ~/Library/LaunchAgents/com.docker.registry.plist
@z

@x
Start the Docker registry:
@y
Start the Docker registry:
@z

@x
    launchctl load ~/Library/LaunchAgents/com.docker.registry.plist
@y
    launchctl load ~/Library/LaunchAgents/com.docker.registry.plist
@z

@x
### Restart the docker registry service
@y
### Restart the docker registry service
@z

@x
    launchctl stop com.docker.registry
    launchctl start com.docker.registry
@y
    launchctl stop com.docker.registry
    launchctl start com.docker.registry
@z

@x
### Unload the docker registry service
@y
### Unload the docker registry service
@z

@x
    launchctl unload ~/Library/LaunchAgents/com.docker.registry.plist
@y
    launchctl unload ~/Library/LaunchAgents/com.docker.registry.plist
@z
