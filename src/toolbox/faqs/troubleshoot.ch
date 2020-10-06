%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
advisory: toolbox
description: Troubleshooting connectivity and certificate issues
keywords: beginner, getting started, FAQs, troubleshooting, Docker
title: Troubleshooting
---
@y
---
advisory: toolbox
description: Troubleshooting connectivity and certificate issues
keywords: beginner, getting started, FAQs, troubleshooting, Docker
title: Troubleshooting
---
@z

@x
Typically, the QuickStart works out-of-the-box, but some scenarios can cause problems.
@y
Typically, the QuickStart works out-of-the-box, but some scenarios can cause problems.
@z

@x
## Example errors
@y
## Example errors
@z

@x
You might get errors when attempting to connect to a machine (such as with `docker-machine env default`) or pull an image from Docker Hub (as with `docker run hello-world`).
@y
You might get errors when attempting to connect to a machine (such as with `docker-machine env default`) or pull an image from Docker Hub (as with `docker run hello-world`).
@z

@x
The errors you get might be specific to certificates, like this:
@y
The errors you get might be specific to certificates, like this:
@z

@x
      Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": dial tcp 192.168.99.100:2376: i/o timeout
@y
      Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": dial tcp 192.168.99.100:2376: i/o timeout
@z

@x
Others explicitly suggest regenerating certificates:
@y
Others explicitly suggest regenerating certificates:
@z

@x
      Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": x509: certificate is valid for 192.168.99.101, not 192.168.99.100
      You can attempt to regenerate them using 'docker-machine regenerate-certs [name]'.
      Be advised that this will trigger a Docker daemon restart which will stop running containers.
@y
      Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": x509: certificate is valid for 192.168.99.101, not 192.168.99.100
      You can attempt to regenerate them using 'docker-machine regenerate-certs [name]'.
      Be advised that this will trigger a Docker daemon restart which will stop running containers.
@z

@x
Or, indicate a network timeout, like this:
@y
Or, indicate a network timeout, like this:
@z

@x
      bash-3.2$ docker run hello-world
      Unable to find image 'hello-world:latest' locally
      Pulling repository docker.io/library/hello-world
      Network timed out while trying to connect to https://index.docker.io/v1/repositories/library/hello-world/images. You may want to check your internet connection or if you are behind a proxy.
      bash-3.2$
@y
      bash-3.2$ docker run hello-world
      Unable to find image 'hello-world:latest' locally
      Pulling repository docker.io/library/hello-world
      Network timed out while trying to connect to https://index.docker.io/v1/repositories/library/hello-world/images. You may want to check your internet connection or if you are behind a proxy.
      bash-3.2$
@z

@x
## Solutions
@y
## Solutions
@z

@x
Here are some quick solutions to help get back on track. These examples assume the Docker host is a machine called `default`.
@y
Here are some quick solutions to help get back on track. These examples assume the Docker host is a machine called `default`.
@z

@x
#### Regenerate certificates
@y
#### Regenerate certificates
@z

@x
Some errors explicitly tell you to regenerate certificates. You might also try this for other errors that are certificate and/or connectivity related.
@y
Some errors explicitly tell you to regenerate certificates. You might also try this for other errors that are certificate and/or connectivity related.
@z

@x
      $ docker-machine regenerate-certs default
        Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
        Regenerating TLS certificates
@y
      $ docker-machine regenerate-certs default
        Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
        Regenerating TLS certificates
@z

@x
#### Restart the Docker host
@y
#### Restart the Docker host
@z

@x
    $ docker-machine restart default
@y
    $ docker-machine restart default
@z

@x
After the machine starts, set the environment variables for the command window.
@y
After the machine starts, set the environment variables for the command window.
@z

@x
    $ eval $(docker-machine env default)
@y
    $ eval $(docker-machine env default)
@z

@x
Run `docker-machine ls` to verify that the machine is running and that this command window is configured to talk to it, as indicated by an asterisk for the active machine (__*__).
@y
Run `docker-machine ls` to verify that the machine is running and that this command window is configured to talk to it, as indicated by an asterisk for the active machine (__*__).
@z

@x
    $ docker-machine ls
    NAME             ACTIVE   DRIVER         STATE     URL                         SWARM   DOCKER    ERRORS
    default          *        virtualbox     Running   tcp://192.168.99.101:2376           v1.10.1
@y
    $ docker-machine ls
    NAME             ACTIVE   DRIVER         STATE     URL                         SWARM   DOCKER    ERRORS
    default          *        virtualbox     Running   tcp://192.168.99.101:2376           v1.10.1
@z

@x
#### Stop the machine, remove it, and create a new one.
@y
#### Stop the machine, remove it, and create a new one.
@z

@x
    $ docker-machine stop default
      Stopping "default"...
      Machine "default" was stopped.
@y
    $ docker-machine stop default
      Stopping "default"...
      Machine "default" was stopped.
@z

@x
    $ docker-machine rm default
      About to remove default
      Are you sure? (y/n): y
      Successfully removed default
@y
    $ docker-machine rm default
      About to remove default
      Are you sure? (y/n): y
      Successfully removed default
@z

@x
You can use the `docker-machine create` command with the `virtualbox` driver to create a new machine called `default` (or any name you want for the machine).
@y
You can use the `docker-machine create` command with the `virtualbox` driver to create a new machine called `default` (or any name you want for the machine).
@z

@x
    $ docker-machine create --driver virtualbox default
      Running pre-create checks...
      (default) Default Boot2Docker ISO is out-of-date, downloading the latest release...
      (default) Latest release for github.com/boot2docker/boot2docker is v1.10.1
      (default) Downloading
      ...
      Docker is up and running!
      To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env default
@y
    $ docker-machine create --driver virtualbox default
      Running pre-create checks...
      (default) Default Boot2Docker ISO is out-of-date, downloading the latest release...
      (default) Latest release for github.com/boot2docker/boot2docker is v1.10.1
      (default) Downloading
      ...
      Docker is up and running!
      To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env default
@z

@x
Set the environment variables for the command window.
@y
Set the environment variables for the command window.
@z

@x
    $ eval $(docker-machine env default)
@y
    $ eval $(docker-machine env default)
@z

@x
Run `docker-machine ls` to verify that the new machine is running and that this command window is configured to talk to it, as indicated by an asterisk for the active machine (__*__).
@y
Run `docker-machine ls` to verify that the new machine is running and that this command window is configured to talk to it, as indicated by an asterisk for the active machine (__*__).
@z

@x
<a name="machine-http-proxy-solutions"></a>
@y
<a name="machine-http-proxy-solutions"></a>
@z

@x
## HTTP proxies and connectivity errors
@y
## HTTP proxies and connectivity errors
@z

@x
A special brand of connectivity errors can be caused by HTTP proxy. If you install Docker Toolbox on a system using a virtual private network (VPN) that uses an HTTP proxy (such as a corporate network), you might encounter errors when the client attempts to connect to the server.
@y
A special brand of connectivity errors can be caused by HTTP proxy. If you install Docker Toolbox on a system using a virtual private network (VPN) that uses an HTTP proxy (such as a corporate network), you might encounter errors when the client attempts to connect to the server.
@z

@x
Here are examples of this type of error:
@y
Here are examples of this type of error:
@z

@x
      $ docker run hello-world
      An error occurred trying to connect: Post https://192.168.99.100:2376/v1.20/containers/create: Forbidden
@y
      $ docker run hello-world
      An error occurred trying to connect: Post https://192.168.99.100:2376/v1.20/containers/create: Forbidden
@z

@x
      $ docker run ubuntu echo "hi"
      An error occurred trying to connect: Post https://192.168.99.100:2376/v1.20/containers/create: Forbidden
@y
      $ docker run ubuntu echo "hi"
      An error occurred trying to connect: Post https://192.168.99.100:2376/v1.20/containers/create: Forbidden
@z

@x
### Configure HTTP proxy settings on Docker machines
@y
### Configure HTTP proxy settings on Docker machines
@z

@x
When Toolbox creates virtual machines (VMs) it runs `start.sh`, where it gets values for `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY`, and passes them as `create` options to create the `default machine`.
@y
When Toolbox creates virtual machines (VMs) it runs `start.sh`, where it gets values for `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY`, and passes them as `create` options to create the `default machine`.
@z

@x
You can reconfigure HTTP proxy settings for private networks on already-created Docker machines, such as the `default` machine, then change the configuration when you are using the same system on a different network.
@y
You can reconfigure HTTP proxy settings for private networks on already-created Docker machines, such as the `default` machine, then change the configuration when you are using the same system on a different network.
@z

@x
Alternatively, you can modify proxy settings on your machine(s) manually through the configuration file at `/var/lib/boot2docker/profile` inside the VM, or configure proxy settings as a part of a `docker-machine create` command.
@y
Alternatively, you can modify proxy settings on your machine(s) manually through the configuration file at `/var/lib/boot2docker/profile` inside the VM, or configure proxy settings as a part of a `docker-machine create` command.
@z

@x
Both solutions are described below.
@y
Both solutions are described below.
@z

@x
#### Update /var/lib/boot2docker/profile on the Docker machine
@y
#### Update /var/lib/boot2docker/profile on the Docker machine
@z

@x
One way to solve this problem is to update the file `/var/lib/boot2docker/profile` on an existing machine to specify the proxy settings you want.
@y
One way to solve this problem is to update the file `/var/lib/boot2docker/profile` on an existing machine to specify the proxy settings you want.
@z

@x
This file lives on the VM itself, so you need to `ssh` into the machine, then edit and save the file there.
@y
This file lives on the VM itself, so you need to `ssh` into the machine, then edit and save the file there.
@z

@x
You can add your machine addresses as values for a `NO_PROXY` setting, and also specify proxy servers that you know about and you want to use. Typically setting your Docker machine URLs to `NO_PROXY` solves this type of connectivity problem, so that example is shown here.
@y
You can add your machine addresses as values for a `NO_PROXY` setting, and also specify proxy servers that you know about and you want to use. Typically setting your Docker machine URLs to `NO_PROXY` solves this type of connectivity problem, so that example is shown here.
@z

@x
1. Use `ssh` to log in to the virtual machine. This example logs in to the
   `default` machine.
@y
1. Use `ssh` to log in to the virtual machine. This example logs in to the
   `default` machine.
@z

@x
        $ docker-machine ssh default
        docker@default:~$ sudo vi /var/lib/boot2docker/profile
@y
        $ docker-machine ssh default
        docker@default:~$ sudo vi /var/lib/boot2docker/profile
@z

@x
2. Add a `NO_PROXY` setting to the end of the file similar to the example below.
@y
2. Add a `NO_PROXY` setting to the end of the file similar to the example below.
@z

@x
        # replace with your office's proxy environment
        export "HTTP_PROXY=http://PROXY:PORT"
        export "HTTPS_PROXY=http://PROXY:PORT"
        # you can add more no_proxy with your environment.
        export "NO_PROXY=192.168.99.*,*.local,169.254/16,*.example.com,192.168.59.*"
@y
        # replace with your office's proxy environment
        export "HTTP_PROXY=http://PROXY:PORT"
        export "HTTPS_PROXY=http://PROXY:PORT"
        # you can add more no_proxy with your environment.
        export "NO_PROXY=192.168.99.*,*.local,169.254/16,*.example.com,192.168.59.*"
@z

@x
3. Restart Docker.
@y
3. Restart Docker.
@z

@x
    After you modify the `profile` on your VM, restart Docker and log out of the machine.
@y
    After you modify the `profile` on your VM, restart Docker and log out of the machine.
@z

@x
        docker@default:~$ sudo /etc/init.d/docker restart
        docker@default:~$ exit
@y
        docker@default:~$ sudo /etc/init.d/docker restart
        docker@default:~$ exit
@z

@x
  Re-try Docker commands. Both Docker and Kitematic should run properly now.
@y
  Re-try Docker commands. Both Docker and Kitematic should run properly now.
@z

@x
  When you move to a different network (for example, leave the office's corporate network and return home), remove or comment out these proxy settings in `/var/lib/boot2docker/profile` and restart Docker.
@y
  When you move to a different network (for example, leave the office's corporate network and return home), remove or comment out these proxy settings in `/var/lib/boot2docker/profile` and restart Docker.
@z

@x
#### Create machines manually using --engine env to specify proxy settings
@y
#### Create machines manually using --engine env to specify proxy settings
@z

@x
Rather than reconfigure automatically-created machines, you can delete them and create your `default` machine and others manually with the `docker-machine create` command, using the `--engine env` flag to specify the proxy settings you want.
@y
Rather than reconfigure automatically-created machines, you can delete them and create your `default` machine and others manually with the `docker-machine create` command, using the `--engine env` flag to specify the proxy settings you want.
@z

@x
Here is an example of creating a `default` machine with proxies set to `http://example.com:8080` and `https://example.com:8080`, and a `N0_PROXY` setting for the server `example2.com`.
@y
Here is an example of creating a `default` machine with proxies set to `http://example.com:8080` and `https://example.com:8080`, and a `N0_PROXY` setting for the server `example2.com`.
@z

@x
    docker-machine create -d virtualbox \
    --engine-env HTTP_PROXY=http://example.com:8080 \
    --engine-env HTTPS_PROXY=https://example.com:8080 \
    --engine-env NO_PROXY=example2.com \
    default
@y
    docker-machine create -d virtualbox \
    --engine-env HTTP_PROXY=http://example.com:8080 \
    --engine-env HTTPS_PROXY=https://example.com:8080 \
    --engine-env NO_PROXY=example2.com \
    default
@z

@x
To learn more about using `docker-machine create`, see the [create](../../machine/reference/create.md) command in the [Docker Machine](../../machine/overview.md) reference.
@y
To learn more about using `docker-machine create`, see the [create](../../machine/reference/create.md) command in the [Docker Machine](../../machine/overview.md) reference.
@z

@x
&nbsp;
@y
&nbsp;
@z
