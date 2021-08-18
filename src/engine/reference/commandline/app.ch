%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
datafolder: docker-app
datafile: docker_app
title: docker app
redirect_from:
  - /engine/reference/commandline/app_merge/
  - /engine/reference/commandline/app_split/
  - /app/working-with-app/
---
<!--
This page is automatically generated from Docker's source code. If you want to
suggest a change to the text that appears here, open a ticket or pull request
in the source repository on GitHub:
@y
---
datafolder: docker-app
datafile: docker_app
title: docker app
redirect_from:
  - /engine/reference/commandline/app_merge/
  - /engine/reference/commandline/app_split/
  - /app/working-with-app/
---
<!--
This page is automatically generated from Docker's source code. If you want to
suggest a change to the text that appears here, open a ticket or pull request
in the source repository on GitHub:
@z

@x
https://github.com/docker/app
-->
{% include cli.md datafolder=page.datafolder datafile=page.datafile %}
@y
https://github.com/docker/app
-->
{% include cli.md datafolder=page.datafolder datafile=page.datafile %}
@z

@x
## Overview
@y
## Overview
@z

@x
Docker App is a CLI plug-in that introduces a top-level `docker app` command to bring 
the _container experience_ to applications. The following table compares Docker containers with Docker applications.
@y
Docker App is a CLI plug-in that introduces a top-level `docker app` command to bring 
the _container experience_ to applications. The following table compares Docker containers with Docker applications.
@z

@x
| Object        | Config file   | Build with         | Execute with          | Share with        |
| ------------- |---------------| -------------------|-----------------------|-------------------|
| Container     | Dockerfile    | docker image build | docker container run  | docker image push |
| App           | App Package   | docker app bundle  | docker app install    | docker app push   |
@y
| Object        | Config file   | Build with         | Execute with          | Share with        |
| ------------- |---------------| -------------------|-----------------------|-------------------|
| Container     | Dockerfile    | docker image build | docker container run  | docker image push |
| App           | App Package   | docker app bundle  | docker app install    | docker app push   |
@z

@x
With Docker App, entire applications can now be managed as easily as images and containers. For example, 
Docker App lets you  _build_, _validate_ and _deploy_ applications with the `docker app` command. You can 
even leverage secure supply-chain features such as signed `push` and `pull` operations.
@y
With Docker App, entire applications can now be managed as easily as images and containers. For example, 
Docker App lets you  _build_, _validate_ and _deploy_ applications with the `docker app` command. You can 
even leverage secure supply-chain features such as signed `push` and `pull` operations.
@z

@x
> **NOTE**: `docker app` works with `Docker 19.03` or higher. 
@y
> **NOTE**: `docker app` works with `Docker 19.03` or higher. 
@z

@x
This guide walks you through two scenarios:
@y
This guide walks you through two scenarios:
@z

@x
1. Initialize and deploy a new Docker App project from scratch.
1. Convert an existing Compose app into a Docker App project (added later in the beta process).
@y
1. Initialize and deploy a new Docker App project from scratch.
1. Convert an existing Compose app into a Docker App project (added later in the beta process).
@z

@x
The first scenario describes basic components of a Docker App with tools and workflow.
@y
The first scenario describes basic components of a Docker App with tools and workflow.
@z

@x
## Initialize and deploy a new Docker App project from scratch
@y
## Initialize and deploy a new Docker App project from scratch
@z

@x
This section describes the steps for creating a new Docker App project to familiarize you with the workflow and most important commands.
@y
This section describes the steps for creating a new Docker App project to familiarize you with the workflow and most important commands.
@z

@x
1. Prerequisites
1. Initialize an empty new project
1. Populate the project
1. Validate the app
1. Deploy the app
1. Push the app to Docker Hub
1. Install the app directly from Docker Hub
@y
1. Prerequisites
1. Initialize an empty new project
1. Populate the project
1. Validate the app
1. Deploy the app
1. Push the app to Docker Hub
1. Install the app directly from Docker Hub
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
You need at least one Docker node operating in Swarm mode. You also need the latest build of the Docker CLI 
with the App CLI plugin included.
@y
You need at least one Docker node operating in Swarm mode. You also need the latest build of the Docker CLI 
with the App CLI plugin included.
@z

@x
Depending on your Linux distribution and your security context, you might need to prepend commands with `sudo`.
@y
Depending on your Linux distribution and your security context, you might need to prepend commands with `sudo`.
@z

@x
### Initialize a new empty project
@y
### Initialize a new empty project
@z

@x
The `docker app init` command is used to initialize a new Docker application project. If you run it on 
its own, it initializes a new empty project. If you point it to an existing `docker-compose.yml` file, 
it initializes a new project based on the Compose file.
@y
The `docker app init` command is used to initialize a new Docker application project. If you run it on 
its own, it initializes a new empty project. If you point it to an existing `docker-compose.yml` file, 
it initializes a new project based on the Compose file.
@z

@x
Use the following command to initialize a new empty project called "hello-world".
@y
Use the following command to initialize a new empty project called "hello-world".
@z

@x
```console
$ docker app init hello-world
Created "hello-world.dockerapp"
```
@y
```console
$ docker app init hello-world
Created "hello-world.dockerapp"
```
@z

@x
The command produces a new directory containing three YAML files. The name of the directory is the name of the
project with `.dockerapp` appended, and the three YAML files are:
@y
The command produces a new directory containing three YAML files. The name of the directory is the name of the
project with `.dockerapp` appended, and the three YAML files are:
@z

@x
- `docker-compose.yml`
- `metadata.yml`
- `parameters.yml`
@y
- `docker-compose.yml`
- `metadata.yml`
- `parameters.yml`
@z

@x
Inspect the YAML files with the following commands.
@y
Inspect the YAML files with the following commands.
@z

@x
```console
$ cd hello-world.dockerapp/
@y
```console
$ cd hello-world.dockerapp/
@z

@x
$ cat docker-compose.yml
version: "3.6"
services: {}
@y
$ cat docker-compose.yml
version: "3.6"
services: {}
@z

@x
$ cat metadata.yml
version: 0.1.0
name: hello-world
description:
@y
$ cat metadata.yml
version: 0.1.0
name: hello-world
description:
@z

@x
$ cat parameters.yml
@y
$ cat parameters.yml
@z

@x
```
@y
```
@z

@x
Your files might be more verbose.
@y
Your files might be more verbose.
@z

@x
Let's quickly describe each file.
@y
Let's quickly describe each file.
@z

@x
`docker-compose.yml` describes the application.
@y
`docker-compose.yml` describes the application.
@z

@x
`metadata.yml` specifies identification metadata such as name, version, description and maintainers. It accepts
key-value pairs.
@y
`metadata.yml` specifies identification metadata such as name, version, description and maintainers. It accepts
key-value pairs.
@z

@x
`parameters.yml` specifies default values for application parameters.
@y
`parameters.yml` specifies default values for application parameters.
@z

@x
### Populate the project
@y
### Populate the project
@z

@x
This section describes editing the project YAML files so that it runs a simple web app.
@y
This section describes editing the project YAML files so that it runs a simple web app.
@z

@x
Use your preferred editor to edit the `docker-compose.yml` YAML file and update it with 
the following information:
@y
Use your preferred editor to edit the `docker-compose.yml` YAML file and update it with 
the following information:
@z

@x
```yaml
version: "3.6"
services:
  hello:
    image: hashicorp/http-echo
    command: ["-text", "${hello.text}"]
    ports:
      - "${hello.port}:5678"
```
@y
```yaml
version: "3.6"
services:
  hello:
    image: hashicorp/http-echo
    command: ["-text", "${hello.text}"]
    ports:
      - "${hello.port}:5678"
```
@z

@x
Update the `parameters.yml` file to the following:
@y
Update the `parameters.yml` file to the following:
@z

@x
```yaml
hello:
  port: 8080
  text: Hello world!
```
@y
```yaml
hello:
  port: 8080
  text: Hello world!
```
@z

@x
Save the changes.
@y
Save the changes.
@z

@x
The application is updated to run a single-container application based on the `hashicorp/http-echo` web server image. 
This image has it execute a single command that displays some text and exposes itself on a network port.
@y
The application is updated to run a single-container application based on the `hashicorp/http-echo` web server image. 
This image has it execute a single command that displays some text and exposes itself on a network port.
@z

@x
Following best practices, the configuration of the application is decoupled from the application itself using variables. 
In this case, the text displayed by the app and the port on which it will be published are controlled by two variables defined in the `Parameters` section of the file.
@y
Following best practices, the configuration of the application is decoupled from the application itself using variables. 
In this case, the text displayed by the app and the port on which it will be published are controlled by two variables defined in the `Parameters` section of the file.
@z

@x
Docker App provides the `inspect` subcommand to provide a prettified summary of the application configuration. 
It is a quick way to check how to configure the application before deployment, without having to read 
the `Compose file`. It's important to note that the application is not running at this point, and that 
the `inspect` operation inspects the configuration file(s).
@y
Docker App provides the `inspect` subcommand to provide a prettified summary of the application configuration. 
It is a quick way to check how to configure the application before deployment, without having to read 
the `Compose file`. It's important to note that the application is not running at this point, and that 
the `inspect` operation inspects the configuration file(s).
@z

@x
```console
$ docker app inspect hello-world.dockerapp
hello-world 0.1.0
@y
```console
$ docker app inspect hello-world.dockerapp
hello-world 0.1.0
@z

@x
Service (1) Replicas Ports Image
----------- -------- ----- -----
hello       1        8080  hashicorp/http-echo
@y
Service (1) Replicas Ports Image
----------- -------- ----- -----
hello       1        8080  hashicorp/http-echo
@z

@x
Parameters (2) Value
-------------- -----
hello.port     8080
hello.text     Hello world!
```
@y
Parameters (2) Value
-------------- -----
hello.port     8080
hello.text     Hello world!
```
@z

@x
`docker app inspect` operations fail if the `Parameters` section doesn't specify a default value for 
every parameter expressed in the app section.
@y
`docker app inspect` operations fail if the `Parameters` section doesn't specify a default value for 
every parameter expressed in the app section.
@z

@x
The application is ready to be validated and rendered.
@y
The application is ready to be validated and rendered.
@z

@x
### Validate the app
@y
### Validate the app
@z

@x
Docker App provides the `validate` subcommand to check syntax and other aspects of the configuration. 
If the app passes validation, the command returns no arguments.
@y
Docker App provides the `validate` subcommand to check syntax and other aspects of the configuration. 
If the app passes validation, the command returns no arguments.
@z

@x
```console
$ docker app validate hello-world.dockerapp
Validated "hello-world.dockerapp"
```
@y
```console
$ docker app validate hello-world.dockerapp
Validated "hello-world.dockerapp"
```
@z

@x
`docker app validate` operations fail if the `Parameters` section doesn't specify a default value for 
every parameter expressed in the app section.
@y
`docker app validate` operations fail if the `Parameters` section doesn't specify a default value for 
every parameter expressed in the app section.
@z

@x
As the `validate` operation has returned no problems, the app is ready to be deployed.
@y
As the `validate` operation has returned no problems, the app is ready to be deployed.
@z

@x
### Deploy the app
@y
### Deploy the app
@z

@x
There are several options for deploying a Docker App project.
@y
There are several options for deploying a Docker App project.
@z

@x
- Deploy as a native Docker App application
- Deploy as a Compose app application
- Deploy as a Docker Stack application
@y
- Deploy as a native Docker App application
- Deploy as a Compose app application
- Deploy as a Docker Stack application
@z

@x
All three options are discussed, starting with deploying as a native Docker App application.
@y
All three options are discussed, starting with deploying as a native Docker App application.
@z

@x
#### Deploy as a native Docker App
@y
#### Deploy as a native Docker App
@z

@x
The process for deploying as a native Docker app is as follows:
@y
The process for deploying as a native Docker app is as follows:
@z

@x
Use `docker app install` to deploy the application.
@y
Use `docker app install` to deploy the application.
@z

@x
Use the following command to deploy (install) the application.
@y
Use the following command to deploy (install) the application.
@z

@x
```console
$ docker app install hello-world.dockerapp --name my-app
Creating network my-app_default
Creating service my-app_hello
Application "my-app" installed on context "default"
```
@y
```console
$ docker app install hello-world.dockerapp --name my-app
Creating network my-app_default
Creating service my-app_hello
Application "my-app" installed on context "default"
```
@z

@x
By default, `docker app` uses the [current context](/engine/context/working-with-contexts) to run the 
installation container and as a target context to deploy the application. You can override the second context 
using the flag `--target-context` or by using the environment variable `DOCKER_TARGET_CONTEXT`. This flag is also 
available for the commands `status`, `upgrade`, and `uninstall`.
@y
By default, `docker app` uses the [current context](/engine/context/working-with-contexts) to run the 
installation container and as a target context to deploy the application. You can override the second context 
using the flag `--target-context` or by using the environment variable `DOCKER_TARGET_CONTEXT`. This flag is also 
available for the commands `status`, `upgrade`, and `uninstall`.
@z

@x
```console
$ docker app install hello-world.dockerapp --name my-app --target-context=my-big-production-cluster
Creating network my-app_default
Creating service my-app_hello
Application "my-app" installed on context "my-big-production-cluster"
```
@y
```console
$ docker app install hello-world.dockerapp --name my-app --target-context=my-big-production-cluster
Creating network my-app_default
Creating service my-app_hello
Application "my-app" installed on context "my-big-production-cluster"
```
@z

@x
> **Note**: Two applications deployed on the same target context cannot share the same name, but this is 
valid if they are deployed on different target contexts.
@y
> **Note**: Two applications deployed on the same target context cannot share the same name, but this is 
valid if they are deployed on different target contexts.
@z

@x
You can check the status of the app with the `docker app status <app-name>` command.
@y
You can check the status of the app with the `docker app status <app-name>` command.
@z

@x
```console
$ docker app status my-app
INSTALLATION
------------
Name:         my-app
Created:      35 seconds
Modified:     31 seconds
Revision:     01DCMY7MWW67AY03B029QATXFF
Last Action:  install
Result:       SUCCESS
Orchestrator: swarm
@y
```console
$ docker app status my-app
INSTALLATION
------------
Name:         my-app
Created:      35 seconds
Modified:     31 seconds
Revision:     01DCMY7MWW67AY03B029QATXFF
Last Action:  install
Result:       SUCCESS
Orchestrator: swarm
@z

@x
APPLICATION
-----------
Name:      hello-world
Version:   0.1.0
Reference:
@y
APPLICATION
-----------
Name:      hello-world
Version:   0.1.0
Reference:
@z

@x
PARAMETERS
----------
hello.port: 8080
hello.text: Hello, World!
@y
PARAMETERS
----------
hello.port: 8080
hello.text: Hello, World!
@z

@x
STATUS
------
ID              NAME            MODE          REPLICAS    IMAGE             PORTS
miqdk1v7j3zk    my-app_hello    replicated    1/1         hashicorp/http-echo:latest   *:8080->5678/tcp
```
@y
STATUS
------
ID              NAME            MODE          REPLICAS    IMAGE             PORTS
miqdk1v7j3zk    my-app_hello    replicated    1/1         hashicorp/http-echo:latest   *:8080->5678/tcp
```
@z

@x
The app is deployed using the stack orchestrator. This means you can also inspect it using the regular `docker stack` commands.
@y
The app is deployed using the stack orchestrator. This means you can also inspect it using the regular `docker stack` commands.
@z

@x
```console
$ docker stack ls
NAME                SERVICES            ORCHESTRATOR
my-app              1                   Swarm
```
@y
```console
$ docker stack ls
NAME                SERVICES            ORCHESTRATOR
my-app              1                   Swarm
```
@z

@x
Now that the app is running, you can point a web browser at the DNS name or public IP of the Docker node on 
port 8080 and see the app. You must ensure traffic to port 8080 is allowed on 
the connection from your browser to your Docker host.
@y
Now that the app is running, you can point a web browser at the DNS name or public IP of the Docker node on 
port 8080 and see the app. You must ensure traffic to port 8080 is allowed on 
the connection from your browser to your Docker host.
@z

@x
Now change the port of the application using `docker app upgrade <app-name>` command.
@y
Now change the port of the application using `docker app upgrade <app-name>` command.
@z

@x
```console
$ docker app upgrade my-app --set hello.port=8181
Upgrading service my-app_hello
Application "my-app" upgraded on context "default"
```
@y
```console
$ docker app upgrade my-app --set hello.port=8181
Upgrading service my-app_hello
Application "my-app" upgraded on context "default"
```
@z

@x
You can uninstall the app with `docker app uninstall my-app`.
@y
You can uninstall the app with `docker app uninstall my-app`.
@z

@x
#### Deploy as a Docker Compose app
@y
#### Deploy as a Docker Compose app
@z

@x
The process for deploying as a Compose app comprises two major steps:
@y
The process for deploying as a Compose app comprises two major steps:
@z

@x
1. Render the Docker app project as a `docker-compose.yml` file.
2. Deploy the app using `docker-compose up`.
@y
1. Render the Docker app project as a `docker-compose.yml` file.
2. Deploy the app using `docker-compose up`.
@z

@x
You need a recent version of Docker Compose to complete these steps.
@y
You need a recent version of Docker Compose to complete these steps.
@z

@x
Rendering is the process of reading the entire application configuration and outputting it as a single `docker-compose.yml` file. This creates a Compose file with hard-coded values wherever a parameter was specified as a variable.
@y
Rendering is the process of reading the entire application configuration and outputting it as a single `docker-compose.yml` file. This creates a Compose file with hard-coded values wherever a parameter was specified as a variable.
@z

@x
Use the following command to render the app to a Compose file called `docker-compose.yml` in the current directory.
@y
Use the following command to render the app to a Compose file called `docker-compose.yml` in the current directory.
@z

@x
```console
$ docker app render --output docker-compose.yml hello-world.dockerapp
```
@y
```console
$ docker app render --output docker-compose.yml hello-world.dockerapp
```
@z

@x
Check the contents of the resulting `docker-compose.yml` file.
@y
Check the contents of the resulting `docker-compose.yml` file.
@z

@x
```console
$ cat docker-compose.yml
version: "3.6"
services:
  hello:
    command:
    - -text
    - Hello world!
    image: hashicorp/http-echo
    ports:
    - mode: ingress
      target: 5678
      published: 8080
      protocol: tcp
```
@y
```console
$ cat docker-compose.yml
version: "3.6"
services:
  hello:
    command:
    - -text
    - Hello world!
    image: hashicorp/http-echo
    ports:
    - mode: ingress
      target: 5678
      published: 8080
      protocol: tcp
```
@z

@x
Notice that the file contains hard-coded values that were expanded based on the contents of the `Parameters` 
section of the project's YAML file. For example, `${hello.text}` has been expanded to "Hello world!".
@y
Notice that the file contains hard-coded values that were expanded based on the contents of the `Parameters` 
section of the project's YAML file. For example, `${hello.text}` has been expanded to "Hello world!".
@z

@x
> **Note**: Almost all the `docker app` commands propose the `--set key=value` flag to override a default parameter.
@y
> **Note**: Almost all the `docker app` commands propose the `--set key=value` flag to override a default parameter.
@z

@x
Try to render the application with a different text:
@y
Try to render the application with a different text:
@z

@x
```console
$ docker app render hello-world.dockerapp --set hello.text="Hello whales!" 
version: "3.6"
services:
  hello:
    command:
    - -text
    - Hello whales!
    image: hashicorp/http-echo
    ports:
    - mode: ingress
      target: 5678
      published: 8080
      protocol: tcp
```
@y
```console
$ docker app render hello-world.dockerapp --set hello.text="Hello whales!" 
version: "3.6"
services:
  hello:
    command:
    - -text
    - Hello whales!
    image: hashicorp/http-echo
    ports:
    - mode: ingress
      target: 5678
      published: 8080
      protocol: tcp
```
@z

@x
Use `docker-compose up` to deploy the app.
@y
Use `docker-compose up` to deploy the app.
@z

@x
```console
$ docker-compose up --detach
WARNING: The Docker Engine you're using is running in swarm mode.
<Snip>
```
@y
```console
$ docker-compose up --detach
WARNING: The Docker Engine you're using is running in swarm mode.
<Snip>
```
@z

@x
The application is now running as a Docker Compose app and should be reachable on port `8080` on your Docker host. 
You must ensure traffic to port `8080` is allowed on the connection form your browser to your Docker host.
@y
The application is now running as a Docker Compose app and should be reachable on port `8080` on your Docker host. 
You must ensure traffic to port `8080` is allowed on the connection form your browser to your Docker host.
@z

@x
You can use `docker-compose down` to stop and remove the application.
@y
You can use `docker-compose down` to stop and remove the application.
@z

@x
#### Deploy as a Docker Stack
@y
#### Deploy as a Docker Stack
@z

@x
Deploying the app as a Docker stack is a two-step process very similar to deploying it as a Docker Compose app.
@y
Deploying the app as a Docker stack is a two-step process very similar to deploying it as a Docker Compose app.
@z

@x
1. Render the Docker app project as a `docker-compose.yml` file.
2. Deploy the app using `docker stack deploy`.
@y
1. Render the Docker app project as a `docker-compose.yml` file.
2. Deploy the app using `docker stack deploy`.
@z

@x
Complete the steps in the previous section to render the Docker app project as a Compose file and make sure 
you're ready to deploy it as a Docker Stack. Your Docker host must be in Swarm mode.
@y
Complete the steps in the previous section to render the Docker app project as a Compose file and make sure 
you're ready to deploy it as a Docker Stack. Your Docker host must be in Swarm mode.
@z

@x
```console
$ docker stack deploy hello-world-app -c docker-compose.yml
Creating network hello-world-app_default
Creating service hello-world-app_hello
```
@y
```console
$ docker stack deploy hello-world-app -c docker-compose.yml
Creating network hello-world-app_default
Creating service hello-world-app_hello
```
@z

@x
The app is now deployed as a Docker stack and can be reached on port `8080` on your Docker host.
@y
The app is now deployed as a Docker stack and can be reached on port `8080` on your Docker host.
@z

@x
Use the `docker stack rm hello-world-app` command to stop and remove the stack. You must ensure traffic to 
port `8080` is allowed on the connection form your browser to your Docker host.
@y
Use the `docker stack rm hello-world-app` command to stop and remove the stack. You must ensure traffic to 
port `8080` is allowed on the connection form your browser to your Docker host.
@z

@x
### Push the app to Docker Hub
@y
### Push the app to Docker Hub
@z

@x
As mentioned in the introduction, `docker app` lets you manage entire
applications the same way that you currently manage container images. For
example, you can push and pull entire applications from registries like Docker
Hub with `docker app push` and `docker app pull`. Other `docker app` commands,
such as `install`, `upgrade`, `inspect`, and `render` can be performed directly
on applications while they are stored in a registry.
@y
As mentioned in the introduction, `docker app` lets you manage entire
applications the same way that you currently manage container images. For
example, you can push and pull entire applications from registries like Docker
Hub with `docker app push` and `docker app pull`. Other `docker app` commands,
such as `install`, `upgrade`, `inspect`, and `render` can be performed directly
on applications while they are stored in a registry.
@z

@x
Push the application to Docker Hub. To complete this step, you need a valid
Docker ID and you must be logged in to the registry to which you are pushing
the app.
@y
Push the application to Docker Hub. To complete this step, you need a valid
Docker ID and you must be logged in to the registry to which you are pushing
the app.
@z

@x
By default, all platform architectures are pushed to the registry. If you are
pushing an official Docker image as part of your app, you may find your app
bundle becomes large with all image architectures embedded. To just push the
architecture required, you can add the `--platform` flag.
@y
By default, all platform architectures are pushed to the registry. If you are
pushing an official Docker image as part of your app, you may find your app
bundle becomes large with all image architectures embedded. To just push the
architecture required, you can add the `--platform` flag.
@z

@x
```console
$ docker login 
@y
```console
$ docker login 
@z

@x
$ docker app push my-app --platform="linux/amd64" --tag <hub-id>/<repo>:0.1.0
```
@y
$ docker app push my-app --platform="linux/amd64" --tag <hub-id>/<repo>:0.1.0
```
@z

@x
### Install the app directly from Docker Hub
@y
### Install the app directly from Docker Hub
@z

@x
Now that the app is pushed to the registry, try an `inspect` and `install` command against it. 
The location of your app is different from the one provided in the examples.
@y
Now that the app is pushed to the registry, try an `inspect` and `install` command against it. 
The location of your app is different from the one provided in the examples.
@z

@x
```console
$ docker app inspect myuser/hello-world:0.1.0
hello-world 0.1.0
@y
```console
$ docker app inspect myuser/hello-world:0.1.0
hello-world 0.1.0
@z

@x
Service (1) Replicas Ports Image
----------- -------- ----- -----
hello       1        8080  myuser/hello-world@sha256:ba27d460cd1f22a1a4331bdf74f4fccbc025552357e8a3249c40ae216275de96
@y
Service (1) Replicas Ports Image
----------- -------- ----- -----
hello       1        8080  myuser/hello-world@sha256:ba27d460cd1f22a1a4331bdf74f4fccbc025552357e8a3249c40ae216275de96
@z

@x
Parameters (2) Value
-------------- -----
hello.port     8080
hello.text     Hello world!
```
@y
Parameters (2) Value
-------------- -----
hello.port     8080
hello.text     Hello world!
```
@z

@x
This action was performed directly against the app in the registry.
@y
This action was performed directly against the app in the registry.
@z

@x
Now install it as a native Docker App by referencing the app in the registry, with a different port.
@y
Now install it as a native Docker App by referencing the app in the registry, with a different port.
@z

@x
```console
$ docker app install myuser/hello-world:0.1.0 --set hello.port=8181
Creating network hello-world_default
Creating service hello-world_hello
Application "hello-world" installed on context "default"
```
@y
```console
$ docker app install myuser/hello-world:0.1.0 --set hello.port=8181
Creating network hello-world_default
Creating service hello-world_hello
Application "hello-world" installed on context "default"
```
@z

@x
Test that the app is working.
@y
Test that the app is working.
@z

@x
The app used in these examples is a simple web server that displays the text "Hello world!" on port 8181, 
your app might be different.
@y
The app used in these examples is a simple web server that displays the text "Hello world!" on port 8181, 
your app might be different.
@z

@x
```console
$ curl http://localhost:8181
Hello world!
```
@y
```console
$ curl http://localhost:8181
Hello world!
```
@z

@x
Uninstall the app.
@y
Uninstall the app.
@z

@x
```console
$ docker app uninstall hello-world
Removing service hello-world_hello
Removing network hello-world_default
Application "hello-world" uninstalled on context "default"
```
@y
```console
$ docker app uninstall hello-world
Removing service hello-world_hello
Removing network hello-world_default
Application "hello-world" uninstalled on context "default"
```
@z

@x
You can see the name of your Docker App with the `docker stack ls` command.
@y
You can see the name of your Docker App with the `docker stack ls` command.
@z
