%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Run certification tests against your images
keywords: Docker, Docker Hub, store, certified content, images
title: Certify Docker images
redirect_from:
- /docker-store/certify-images/
---
@y
---
description: Run certification tests against your images
keywords: Docker, Docker Hub, store, certified content, images
title: Certify Docker images
redirect_from:
- /docker-store/certify-images/
---
@z

@x
## Introduction
@y
## Introduction
@z

@x
Content that qualifies as **Docker Certified** must conform to best practices and pass certain baseline tests.
@y
Content that qualifies as **Docker Certified** must conform to best practices and pass certain baseline tests.
@z

@x
Docker Hub lets you publish certified images as well as plugins for logging, volumes, and networks. You must certify your own _images and logging plugins_ with the `inspect` tools as explained in these docs. Currently, Docker Hub certifies your volume and networking plugins for you upon submission.
@y
Docker Hub lets you publish certified images as well as plugins for logging, volumes, and networks. You must certify your own _images and logging plugins_ with the `inspect` tools as explained in these docs. Currently, Docker Hub certifies your volume and networking plugins for you upon submission.
@z

@x
This page explains how publishers can successfully test their **Docker images**. Also available: [Certify your Docker logging plugins](certify-plugins-logging.md).
@y
This page explains how publishers can successfully test their **Docker images**. Also available: [Certify your Docker logging plugins](certify-plugins-logging.md).
@z

@x
> Content that requires a non-certified infrastructure environment cannot be published as certified.
@y
> Content that requires a non-certified infrastructure environment cannot be published as certified.
@z

@x
> You should perform this Self Certification test prior to submitting your product for publishing.
@y
> You should perform this Self Certification test prior to submitting your product for publishing.
@z

@x
## Certify your Docker images
@y
## Certify your Docker images
@z

@x
You must use the tool, `inspectDockerImage`, to certify your content for publication on Docker Hub by ensuring that your images conform to best practices. Download the tool [here](#syntax).
@y
You must use the tool, `inspectDockerImage`, to certify your content for publication on Docker Hub by ensuring that your images conform to best practices. Download the tool [here](#syntax).
@z

@x
The `inspectDockerImage` tool does the following:
@y
The `inspectDockerImage` tool does the following:
@z

@x
- Verifies that the Docker image was built from an image in the [Docker Official Image](https://github.com/docker-library/repo-info/tree/master/repos)
@y
- Verifies that the Docker image was built from an image in the [Docker Official Image](https://github.com/docker-library/repo-info/tree/master/repos)
@z

@x
- Inspects the Docker image for a Health Check. Although a Health Check is not required, it is recommended.
@y
- Inspects the Docker image for a Health Check. Although a Health Check is not required, it is recommended.
@z

@x
- Checks if a Linux Docker image is running `supervisord` to launch multiple services.
@y
- Checks if a Linux Docker image is running `supervisord` to launch multiple services.
@z

@x
  > Running `supervisord` in a container is not a best practice for images destined for Docker Hub. The recommended best practice is to split the multiple services into separate Docker images and run them in separate containers.
@y
  > Running `supervisord` in a container is not a best practice for images destined for Docker Hub. The recommended best practice is to split the multiple services into separate Docker images and run them in separate containers.
@z

@x
- Attempts to start a container from the Docker image to ensure that the image is functional.
@y
- Attempts to start a container from the Docker image to ensure that the image is functional.
@z

@x
- Displays the running processes in the container.
@y
- Displays the running processes in the container.
@z

@x
- Checks the running processes to see if any are running `supervisord`.
@y
- Checks the running processes to see if any are running `supervisord`.
@z

@x
- Verifies that the container is sending logs to `stdout/stderr`.
@y
- Verifies that the container is sending logs to `stdout/stderr`.
@z

@x
- Attempts to stop the container to ensure that it can be stopped gracefully.
@y
- Attempts to stop the container to ensure that it can be stopped gracefully.
@z

@x
The `inspectDockerImage` tool will detect issues and output them as **warnings** or **errors**. **Errors** must be fixed in order to certify. Resolving **warnings** is not required to certify, but you should try to resolve them.
@y
The `inspectDockerImage` tool will detect issues and output them as **warnings** or **errors**. **Errors** must be fixed in order to certify. Resolving **warnings** is not required to certify, but you should try to resolve them.
@z

@x
If you are publishing and certifying multiple versions for a Docker image, you will need to run the `inspectDockerImage` tool on each Docker image and send each result to Docker Hub.
@y
If you are publishing and certifying multiple versions for a Docker image, you will need to run the `inspectDockerImage` tool on each Docker image and send each result to Docker Hub.
@z

@x
If you are publishing and certifying a multi-architecture Docker image (for example, Linux, Power, s390x, Windows) you will need to run the `inspectDockerImage` tool on the Docker Engine - Enterprise server running on each architecture and send the results to Docker Hub.
@y
If you are publishing and certifying a multi-architecture Docker image (for example, Linux, Power, s390x, Windows) you will need to run the `inspectDockerImage` tool on the Docker Engine - Enterprise server running on each architecture and send the results to Docker Hub.
@z

@x
Details on how to run the `inspectDockerImage` tool and send the results to Docker Hub are in the sections that follow.
@y
Details on how to run the `inspectDockerImage` tool and send the results to Docker Hub are in the sections that follow.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Your Docker Engine - Enterprise installation must be running on the server used to verify your submissions. If necessary, request entitlement to a specific [Docker Enterprise Edition](https://hub.docker.com/editions/enterprise/docker-ee-trial).
@y
Your Docker Engine - Enterprise installation must be running on the server used to verify your submissions. If necessary, request entitlement to a specific [Docker Enterprise Edition](https://hub.docker.com/editions/enterprise/docker-ee-trial).
@z

@x
- Docker Engine - Enterprise (on the server for verifying submissions)
- inspectDockerImage tool
@y
- Docker Engine - Enterprise (on the server for verifying submissions)
- inspectDockerImage tool
@z

@x
### Set up testing environment
@y
### Set up testing environment
@z

@x
There are two steps: (1) configure credentials, and (2) configure endpoints (or use default endpoints).
@y
There are two steps: (1) configure credentials, and (2) configure endpoints (or use default endpoints).
@z

@x
1.  Configure your Docker Registry credentials by either _defining environment variables_ **or** _passing them as arguments_ to `inspectDockerImage`.
@y
1.  Configure your Docker Registry credentials by either _defining environment variables_ **or** _passing them as arguments_ to `inspectDockerImage`.
@z

@x
    a.  Define environment variables for registry credentials, `DOCKER_USER` and `DOCKER_PASSWORD`:
@y
    a.  Define environment variables for registry credentials, `DOCKER_USER` and `DOCKER_PASSWORD`:
@z

@x
    **Linux**
@y
    **Linux**
@z

@x
    ```bash
    export DOCKER_USER="my_docker_registry_user_account"
    export DOCKER_PASSWORD="my_docker_registry_user_account_password"
    ```
@y
    ```bash
    export DOCKER_USER="my_docker_registry_user_account"
    export DOCKER_PASSWORD="my_docker_registry_user_account_password"
    ```
@z

@x
    **Windows command prompt**
@y
    **Windows command prompt**
@z

@x
    ```bash
    set DOCKER_USER="my_docker_registry_user_account"
    set DOCKER_PASSWORD="my_docker_registry_user_account_password"
    ```
@y
    ```bash
    set DOCKER_USER="my_docker_registry_user_account"
    set DOCKER_PASSWORD="my_docker_registry_user_account_password"
    ```
@z

@x
    **Windows powershell**
@y
    **Windows powershell**
@z

@x
    ```bash
    $env:DOCKER_USER="my_docker_registry_user_account"
    $env:DOCKER_PASSWORD="my_docker_registry_user_account_password"
    ```
@y
    ```bash
    $env:DOCKER_USER="my_docker_registry_user_account"
    $env:DOCKER_PASSWORD="my_docker_registry_user_account_password"
    ```
@z

@x
    b.  Pass arguments to `inspectDockerImage` (or be prompted for them):
@y
    b.  Pass arguments to `inspectDockerImage` (or be prompted for them):
@z

@x
    ```
    --docker-user
    --docker-password
    ```
@y
    ```
    --docker-user
    --docker-password
    ```
@z

@x
2.  Configure endpoints (and override default values) by either _defining environment variables_ **or** _passing them as arguments_ to `inspectDockerImage`.
@y
2.  Configure endpoints (and override default values) by either _defining environment variables_ **or** _passing them as arguments_ to `inspectDockerImage`.
@z

@x
    By default, `inspectDockerImage` uses these two endpoints to communicate with the Docker Hub Registry:
@y
    By default, `inspectDockerImage` uses these two endpoints to communicate with the Docker Hub Registry:
@z

@x
    - Registry Authentication Endpoint: **https://auth.docker.io**
    - Registry API Endpoint: **https://registry-1.docker.io**
@y
    - Registry Authentication Endpoint: **https://auth.docker.io**
    - Registry API Endpoint: **https://registry-1.docker.io**
@z

@x
    You may want to use your private registry for initial testing and override the defaults.
@y
    You may want to use your private registry for initial testing and override the defaults.
@z

@x
    a.  Define environment variables, `DOCKER_REGISTRY_AUTH_ENDPOINT` and  `DOCKER_REGISTRY_API_ENDPOINT`:
@y
    a.  Define environment variables, `DOCKER_REGISTRY_AUTH_ENDPOINT` and  `DOCKER_REGISTRY_API_ENDPOINT`:
@z

@x
    **Linux or MacOS**
@y
    **Linux or MacOS**
@z

@x
    ```bash
    export DOCKER_REGISTRY_AUTH_ENDPOINT="https://my_docker_registry_authentication_endpoint"
    export DOCKER_REGISTRY_API_ENDPOINT="https://my_docker_registry_api_enpoint"
    ```
@y
    ```bash
    export DOCKER_REGISTRY_AUTH_ENDPOINT="https://my_docker_registry_authentication_endpoint"
    export DOCKER_REGISTRY_API_ENDPOINT="https://my_docker_registry_api_enpoint"
    ```
@z

@x
    **Windows command prompt**
@y
    **Windows command prompt**
@z

@x
    ```bash
    set DOCKER_REGISTRY_AUTH_ENDPOINT="https://my_docker_registry_authentication_endpoint"
    set DOCKER_REGISTRY_API_ENDPOINT="https://my_docker_registry_api_enpoint"
    ```
@y
    ```bash
    set DOCKER_REGISTRY_AUTH_ENDPOINT="https://my_docker_registry_authentication_endpoint"
    set DOCKER_REGISTRY_API_ENDPOINT="https://my_docker_registry_api_enpoint"
    ```
@z

@x
    **Windows powershell**
@y
    **Windows powershell**
@z

@x
    ```bash
    $env:DOCKER_REGISTRY_AUTH_ENDPOINT="https://my_docker_registry_authentication_endpoint"
    $env:DOCKER_REGISTRY_API_ENDPOINT="https://my_docker_registry_api_enpoint"
    ```
@y
    ```bash
    $env:DOCKER_REGISTRY_AUTH_ENDPOINT="https://my_docker_registry_authentication_endpoint"
    $env:DOCKER_REGISTRY_API_ENDPOINT="https://my_docker_registry_api_enpoint"
    ```
@z

@x
    b.  Pass your endpoints as arguments to `inspectDockerImage`:
@y
    b.  Pass your endpoints as arguments to `inspectDockerImage`:
@z

@x
    ```
    --docker-registry-auth-endpoint
    --docker-registry-api-endpoint
    ```
@y
    ```
    --docker-registry-auth-endpoint
    --docker-registry-api-endpoint
    ```
@z

@x
### Syntax
@y
### Syntax
@z

@x
1.  Download `inspectDockerImage` command.
@y
1.  Download `inspectDockerImage` command.
@z

@x
    | OS/Architecture | Download Link |
    |:-----|:--------|:------|
    | Windows/X86  | [https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/inspectDockerImage.exe](https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/inspectDockerImage.exe) |
    | Linux/X86 | [https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/inspectDockerImage](https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/inspectDockerImage) |
    | Linux/IBMZ | [https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/inspectDockerImage](https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/inspectDockerImage) |
    | Linux/IBMPOWER | [https://s3.amazonaws.com/store-logos-us-east-1/certification/power/inspectDockerImage](https://s3.amazonaws.com/store-logos-us-east-1/certification/power/inspectDockerImage) |
@y
    | OS/Architecture | Download Link |
    |:-----|:--------|:------|
    | Windows/X86  | [https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/inspectDockerImage.exe](https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/inspectDockerImage.exe) |
    | Linux/X86 | [https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/inspectDockerImage](https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/inspectDockerImage) |
    | Linux/IBMZ | [https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/inspectDockerImage](https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/inspectDockerImage) |
    | Linux/IBMPOWER | [https://s3.amazonaws.com/store-logos-us-east-1/certification/power/inspectDockerImage](https://s3.amazonaws.com/store-logos-us-east-1/certification/power/inspectDockerImage) |
@z

@x
2.  Set permissions on `inspectDockerImage` so that it is executable:
@y
2.  Set permissions on `inspectDockerImage` so that it is executable:
@z

@x
    ```
    chmod u+x inspectDockerImage
    ```
@y
    ```
    chmod u+x inspectDockerImage
    ```
@z

@x
3.  Get the product ID from the plan page you'd like to reference for the certification test. Make sure the checkbox is checked and the plan is saved first.
@y
3.  Get the product ID from the plan page you'd like to reference for the certification test. Make sure the checkbox is checked and the plan is saved first.
@z

@x
    ![product ID](images/store-product-id.png)
@y
    ![product ID](images/store-product-id.png)
@z

@x
    ```none
    Inspects a Docker image to see if it conforms to best practices.
@y
    ```none
    Inspects a Docker image to see if it conforms to best practices.
@z

@x
    Syntax: inspectDockerImage [options] dockerimage
@y
    Syntax: inspectDockerImage [options] dockerimage
@z

@x
    Options:
      -docker-password string
        	 Docker Password.  This overrides the DOCKER_PASSWORD environment variable.
      -docker-registry-api-endpoint string
        	 Docker Registry API Endpoint. This overrides the DOCKER_REGISTRY_API_ENDPOINT environment variable. (default "https://registry-1.docker.io")
      -docker-registry-auth-endpoint string
        	 Docker Registry Authentication Endpoint. This overrides the DOCKER_REGISTRY_AUTH_ENDPOINT environment variable. (default "https://auth.docker.io")
      -docker-user string
        	 Docker User ID.  This overrides the DOCKER_USER environment variable.
      -help
        	 Displays the command help.
      -html
        	 Generate HTML output.
      -json
        	 Generate JSON output.
      -log-tail int
        	Number of lines to show from the end of the container logs. (default 20)
      -product-id string
        	 Optional Product identifier from Docker Hub for this image. Please include it when you want the output to be sent to Docker Hub.
      -start-script string
        	 An optional custom script used to start the Docker container. The script will get passed one argument, the name of the Docker image.
      -start-wait-time int
        	 Number of seconds to wait for the Docker container to start. (default 30)
      -stop-wait-time int
        	 Number of seconds to wait for the Docker container to respond to the stop before killing it. (default 60)
@y
    Options:
      -docker-password string
        	 Docker Password.  This overrides the DOCKER_PASSWORD environment variable.
      -docker-registry-api-endpoint string
        	 Docker Registry API Endpoint. This overrides the DOCKER_REGISTRY_API_ENDPOINT environment variable. (default "https://registry-1.docker.io")
      -docker-registry-auth-endpoint string
        	 Docker Registry Authentication Endpoint. This overrides the DOCKER_REGISTRY_AUTH_ENDPOINT environment variable. (default "https://auth.docker.io")
      -docker-user string
        	 Docker User ID.  This overrides the DOCKER_USER environment variable.
      -help
        	 Displays the command help.
      -html
        	 Generate HTML output.
      -json
        	 Generate JSON output.
      -log-tail int
        	Number of lines to show from the end of the container logs. (default 20)
      -product-id string
        	 Optional Product identifier from Docker Hub for this image. Please include it when you want the output to be sent to Docker Hub.
      -start-script string
        	 An optional custom script used to start the Docker container. The script will get passed one argument, the name of the Docker image.
      -start-wait-time int
        	 Number of seconds to wait for the Docker container to start. (default 30)
      -stop-wait-time int
        	 Number of seconds to wait for the Docker container to respond to the stop before killing it. (default 60)
@z

@x
    dockerimage
  	The Docker image to inspect. This argument is required.
    ```
@y
    dockerimage
  	The Docker image to inspect. This argument is required.
    ```
@z

@x
## Inspection Output
@y
## Inspection Output
@z

@x
By default, `inspectDockerImage` displays output locally to `stdout` (the default), JSON, and HTML. You can also upload output to Docker Hub, which is recommended for administrator verification.
@y
By default, `inspectDockerImage` displays output locally to `stdout` (the default), JSON, and HTML. You can also upload output to Docker Hub, which is recommended for administrator verification.
@z

@x
-  **Upload to Docker Hub** (by entering `product-id` at the commandline).
@y
-  **Upload to Docker Hub** (by entering `product-id` at the commandline).
@z

@x
-  **Send message to `stdout`**. This is the default.
@y
-  **Send message to `stdout`**. This is the default.
@z

@x
-  **JSON sent to `stdout`**. Use the `--json` option to override and replace the messages sent to `stdout`.
@y
-  **JSON sent to `stdout`**. Use the `--json` option to override and replace the messages sent to `stdout`.
@z

@x
-  **HTML local file**. Use the `--html` option to generate an HTML report. Both `--json` and `--html` can be specified at the same time.
@y
-  **HTML local file**. Use the `--html` option to generate an HTML report. Both `--json` and `--html` can be specified at the same time.
@z

@x
> Volumes created by Docker image containers are destroyed after `inspectDockerImage` terminates.
@y
> Volumes created by Docker image containers are destroyed after `inspectDockerImage` terminates.
@z

@x
## Inspection Examples
@y
## Inspection Examples
@z

@x
This section demonstrates how to inspect your Linux and Windows images.
@y
This section demonstrates how to inspect your Linux and Windows images.
@z

@x
* [Inspect a Linux Docker image with custom startup script](#linux-startup-script)
* [Inspect a Linux Docker image with JSON output](#linux-with-json)
* [Inspect a Linux Docker image with HTML output](#linux-with-html)
* [Inspect a Microsoft Windows Docker image](#windows)
@y
* [Inspect a Linux Docker image with custom startup script](#linux-startup-script)
* [Inspect a Linux Docker image with JSON output](#linux-with-json)
* [Inspect a Linux Docker image with HTML output](#linux-with-html)
* [Inspect a Microsoft Windows Docker image](#windows)
@z

@x
<a name="linux-startup-script">
@y
<a name="linux-startup-script">
@z

@x
### Inspect a Linux Docker image with a custom startup script
@y
### Inspect a Linux Docker image with a custom startup script
@z

@x
The `inspectDockerImage` command expects a custom script to return the container ID (or container name) from the docker image being tested as the last or only line of output to `stdout`. Without the container ID or container name as the last line of output, the inspection fails.
@y
The `inspectDockerImage` command expects a custom script to return the container ID (or container name) from the docker image being tested as the last or only line of output to `stdout`. Without the container ID or container name as the last line of output, the inspection fails.
@z

@x
A simple custom script that executes a `docker container run` command, easily outputs the container ID. But a complex script might need testing to ensure it also returns the container ID or container name as the last line of output -- for example, a script that launches multiple containers, or one that runs `docker-compose`.
@y
A simple custom script that executes a `docker container run` command, easily outputs the container ID. But a complex script might need testing to ensure it also returns the container ID or container name as the last line of output -- for example, a script that launches multiple containers, or one that runs `docker-compose`.
@z

@x
Some "testing/helper" scripts are available for testing Linux and Windows Docker images on virtual machines running in Amazon. Refer to [Test and Helper Scripts](aws_scripts/README.md)
@y
Some "testing/helper" scripts are available for testing Linux and Windows Docker images on virtual machines running in Amazon. Refer to [Test and Helper Scripts](aws_scripts/README.md)
@z

@x
#### Example startup script
@y
#### Example startup script
@z

@x
```bash
cat ./run_my_application.sh
```
@y
```bash
cat ./run_my_application.sh
```
@z

@x
```bash
#!/usr/bin/env bash
docker container run -d \
-p 80:8080 --name tomcat-wildbook \
--link mysql-wildbook \
$1
  ```
@y
```bash
#!/usr/bin/env bash
docker container run -d \
-p 80:8080 --name tomcat-wildbook \
--link mysql-wildbook \
$1
  ```
@z

@x
#### To inspect the Docker image, `gforghetti/tomcat-wildbook:latest`, with a custom startup script and upload the result to Docker Hub (leave out the `-product-id` parameter if you are just testing):
@y
#### To inspect the Docker image, `gforghetti/tomcat-wildbook:latest`, with a custom startup script and upload the result to Docker Hub (leave out the `-product-id` parameter if you are just testing):
@z

@x
```console
root:[~/] # ./inspectDockerImage --start-script ./run_my_application.sh -product-id=<store-product-id> gforghetti/tomcat-wildbook:latest
```
@y
```console
root:[~/] # ./inspectDockerImage --start-script ./run_my_application.sh -product-id=<store-product-id> gforghetti/tomcat-wildbook:latest
```
@z

@x
#### Output:
@y
#### Output:
@z

@x
```
*******************************************************************************************************************************************************************************************************
* Docker image: gforghetti/tomcat-wildbook:latest
*******************************************************************************************************************************************************************************************************
@y
```
*******************************************************************************************************************************************************************************************************
* Docker image: gforghetti/tomcat-wildbook:latest
*******************************************************************************************************************************************************************************************************
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #1 Loading information on the Docker official base images ...
*******************************************************************************************************************************************************************************************************
The Docker official base images data has been loaded from the docker_official_base_images.json file. Last updated on Fri Oct 27 08:35:14 2017
@y
*******************************************************************************************************************************************************************************************************
* Step #1 Loading information on the Docker official base images ...
*******************************************************************************************************************************************************************************************************
The Docker official base images data has been loaded from the docker_official_base_images.json file. Last updated on Fri Oct 27 08:35:14 2017
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #2 Inspecting the Docker image "gforghetti/tomcat-wildbook:latest" ...
*******************************************************************************************************************************************************************************************************
Pulling the Docker image gforghetti/tomcat-wildbook:latest ...
Pulling the Docker image took 13.536641265s
Passed:  Docker image "gforghetti/tomcat-wildbook:latest" has been inspected.
@y
*******************************************************************************************************************************************************************************************************
* Step #2 Inspecting the Docker image "gforghetti/tomcat-wildbook:latest" ...
*******************************************************************************************************************************************************************************************************
Pulling the Docker image gforghetti/tomcat-wildbook:latest ...
Pulling the Docker image took 13.536641265s
Passed:  Docker image "gforghetti/tomcat-wildbook:latest" has been inspected.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #3 Docker image information
*******************************************************************************************************************************************************************************************************
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Docker image:             | gforghetti/tomcat-wildbook:latest                                                                                                                                       |
| Size:                     | 384MB                                                                                                                                                                   |
| Layers:                   | 39                                                                                                                                                                      |
| Digest:                   | sha256:58715d538bba0782f55fa64dede776a2967c08873cd66424bb5a7156734c781e                                                                                                 |
| Base layer digest:        | sha256:06b22ddb19134ec8c42aaabd3e2e9f5b378e4e53da4a8960eaaaa86351190af3                                                                                                 |
| Official base image:      | debian:stretch@sha256:6ccbcbf362dbc4add74711cb774751b59cdfd7aed16c3c29aaecbea871952fe0                                                                                  |
| Created on:               | 2017-08-16T21:39:24                                                                                                                                                     |
| Docker version:           | 17.07.0-ce-rc2                                                                                                                                                          |
| Maintainer:               | Gary Forghetti, Docker Inc.                                                                                                                                             |
| Operating system:         | linux                                                                                                                                                                   |
| Operating system version: | Debian GNU/Linux 9 (stretch)                                                                                                                                            |
| Architecture:             | amd64                                                                                                                                                                   |
| User:                     |                                                                                                                                                                         |
| WorkingDir:               | /usr/local/tomcat                                                                                                                                                       |
| Entrypoint:               |                                                                                                                                                                         |
| Cmd:                      | /usr/local/tomcat/bin/catalina.sh run                                                                                                                                   |
| Shell:                    |                                                                                                                                                                         |
| Env:                      | PATH=/usr/local/tomcat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin                                                                                 |
| Env:                      | LANG=C.UTF-8                                                                                                                                                            |
| Env:                      | JAVA_HOME=/docker-java-home/jre                                                                                                                                         |
| Env:                      | JAVA_VERSION=8u141                                                                                                                                                      |
| Env:                      | JAVA_DEBIAN_VERSION=8u141-b15-1~deb9u1                                                                                                                                  |
| Env:                      | CA_CERTIFICATES_JAVA_VERSION=20170531+nmu1                                                                                                                              |
| Env:                      | CATALINA_HOME=/usr/local/tomcat                                                                                                                                         |
| Env:                      | TOMCAT_NATIVE_LIBDIR=/usr/local/tomcat/native-jni-lib                                                                                                                   |
| Env:                      | LD_LIBRARY_PATH=/usr/local/tomcat/native-jni-lib                                                                                                                        |
| Env:                      | OPENSSL_VERSION=1.1.0f-3                                                                                                                                                |
| Env:                      | GPG_KEYS=05AB33110949707C93A279E3D3EFE6B686867BA6 07E48665A34DCAFAE522E5E6266191C37C037D42 47309207D818FFD8DCD3F83F1931D684307A10A5 541FBE7D8F78B25E055DDEE13C370389288 |
| Env:                      | TOMCAT_MAJOR=8                                                                                                                                                          |
| Env:                      | TOMCAT_VERSION=8.5.20                                                                                                                                                   |
| Env:                      | TOMCAT_TGZ_URL=https://www.apache.org/dyn/closer.cgi?action=download&filename=tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz                                   |
| Env:                      | TOMCAT_ASC_URL=https://www.apache.org/dist/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz.asc                                                                  |
| Env:                      | TOMCAT_TGZ_FALLBACK_URL=https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz                                                         |
| Env:                      | TOMCAT_ASC_FALLBACK_URL=https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz.asc                                                     |
| ExposedPorts:             | 8080/tcp                                                                                                                                                                |
| Healthcheck:              |                                                                                                                                                                         |
| Volumes:                  |                                                                                                                                                                         |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
@y
*******************************************************************************************************************************************************************************************************
* Step #3 Docker image information
*******************************************************************************************************************************************************************************************************
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Docker image:             | gforghetti/tomcat-wildbook:latest                                                                                                                                       |
| Size:                     | 384MB                                                                                                                                                                   |
| Layers:                   | 39                                                                                                                                                                      |
| Digest:                   | sha256:58715d538bba0782f55fa64dede776a2967c08873cd66424bb5a7156734c781e                                                                                                 |
| Base layer digest:        | sha256:06b22ddb19134ec8c42aaabd3e2e9f5b378e4e53da4a8960eaaaa86351190af3                                                                                                 |
| Official base image:      | debian:stretch@sha256:6ccbcbf362dbc4add74711cb774751b59cdfd7aed16c3c29aaecbea871952fe0                                                                                  |
| Created on:               | 2017-08-16T21:39:24                                                                                                                                                     |
| Docker version:           | 17.07.0-ce-rc2                                                                                                                                                          |
| Maintainer:               | Gary Forghetti, Docker Inc.                                                                                                                                             |
| Operating system:         | linux                                                                                                                                                                   |
| Operating system version: | Debian GNU/Linux 9 (stretch)                                                                                                                                            |
| Architecture:             | amd64                                                                                                                                                                   |
| User:                     |                                                                                                                                                                         |
| WorkingDir:               | /usr/local/tomcat                                                                                                                                                       |
| Entrypoint:               |                                                                                                                                                                         |
| Cmd:                      | /usr/local/tomcat/bin/catalina.sh run                                                                                                                                   |
| Shell:                    |                                                                                                                                                                         |
| Env:                      | PATH=/usr/local/tomcat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin                                                                                 |
| Env:                      | LANG=C.UTF-8                                                                                                                                                            |
| Env:                      | JAVA_HOME=/docker-java-home/jre                                                                                                                                         |
| Env:                      | JAVA_VERSION=8u141                                                                                                                                                      |
| Env:                      | JAVA_DEBIAN_VERSION=8u141-b15-1~deb9u1                                                                                                                                  |
| Env:                      | CA_CERTIFICATES_JAVA_VERSION=20170531+nmu1                                                                                                                              |
| Env:                      | CATALINA_HOME=/usr/local/tomcat                                                                                                                                         |
| Env:                      | TOMCAT_NATIVE_LIBDIR=/usr/local/tomcat/native-jni-lib                                                                                                                   |
| Env:                      | LD_LIBRARY_PATH=/usr/local/tomcat/native-jni-lib                                                                                                                        |
| Env:                      | OPENSSL_VERSION=1.1.0f-3                                                                                                                                                |
| Env:                      | GPG_KEYS=05AB33110949707C93A279E3D3EFE6B686867BA6 07E48665A34DCAFAE522E5E6266191C37C037D42 47309207D818FFD8DCD3F83F1931D684307A10A5 541FBE7D8F78B25E055DDEE13C370389288 |
| Env:                      | TOMCAT_MAJOR=8                                                                                                                                                          |
| Env:                      | TOMCAT_VERSION=8.5.20                                                                                                                                                   |
| Env:                      | TOMCAT_TGZ_URL=https://www.apache.org/dyn/closer.cgi?action=download&filename=tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz                                   |
| Env:                      | TOMCAT_ASC_URL=https://www.apache.org/dist/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz.asc                                                                  |
| Env:                      | TOMCAT_TGZ_FALLBACK_URL=https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz                                                         |
| Env:                      | TOMCAT_ASC_FALLBACK_URL=https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz.asc                                                     |
| ExposedPorts:             | 8080/tcp                                                                                                                                                                |
| Healthcheck:              |                                                                                                                                                                         |
| Volumes:                  |                                                                                                                                                                         |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #4 Docker image layer information
*******************************************************************************************************************************************************************************************************
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
| Manifest | Layer | Command                                                                                              | Size       | Blob     | Matches                                           |
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
| 58715d53 | 1     | /bin/sh -c #(nop) ADD file:ebba725fb97cea45d0b1b35ccc8144e766fcfc9a78530465c23b0c4674b14042 in /     | 43.1 Mib   | 06b22ddb | debian:stretch@6ccbcbf3                           |
| 58715d53 | 3     | /bin/sh -c apt-get update && apt-get install -y --no-install-recommends ca-certificates curl wget && | 10.6 Mib   | 336c28b4 |                                                   |
| 58715d53 | 4     | /bin/sh -c set -ex; if ! command -v gpg > /dev/null; then apt-get update; apt-get install -y --no-in | 4.2 Mib    | 1f3e6b8d |                                                   |
| 58715d53 | 5     | /bin/sh -c apt-get update && apt-get install -y --no-install-recommends bzip2 unzip xz-utils && rm - | 614.7 Kib  | aeac5951 |                                                   |
| 58715d53 | 7     | /bin/sh -c { echo '#!/bin/sh'; echo 'set -e'; echo; echo 'dirname "$(dirname "$(readlink -f "$(which | 241 Bytes  | b01db8bd |                                                   |
| 58715d53 | 8     | /bin/sh -c ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /docker-java-home      | 130 Bytes  | f7f398af |                                                   |
| 58715d53 | 13    | /bin/sh -c set -ex; if [ ! -d /usr/share/man/man1 ]; then mkdir -p /usr/share/man/man1; fi; apt-get  | 52.1 Mib   | 1c5595fa |                                                   |
| 58715d53 | 14    | /bin/sh -c /var/lib/dpkg/info/ca-certificates-java.postinst configure                                | 265.6 Kib  | e1a6cc83 |                                                   |
| 58715d53 | 17    | /bin/sh -c mkdir -p "$CATALINA_HOME"                                                                 | 144 Bytes  | 9efe1c93 |                                                   |
| 58715d53 | 23    | /bin/sh -c apt-get update && apt-get install -y --no-install-recommends libapr1 openssl="$OPENSSL_VE | 220.4 Kib  | eef936b7 |                                                   |
| 58715d53 | 25    | /bin/sh -c set -ex; for key in $GPG_KEYS; do gpg --keyserver ha.pool.sks-keyservers.net --recv-keys  | 109.6 Kib  | 3c1e7106 |                                                   |
| 58715d53 | 32    | /bin/sh -c set -x && { wget -O tomcat.tar.gz "$TOMCAT_TGZ_URL" || wget -O tomcat.tar.gz "$TOMCAT_TGZ | 9.6 Mib    | e87d3364 |                                                   |
| 58715d53 | 33    | /bin/sh -c set -e && nativeLines="$(catalina.sh configtest 2>&1)" && nativeLines="$(echo "$nativeLin | 128 Bytes  | 8ecc2c09 |                                                   |
| 58715d53 | 39    | /bin/sh -c #(nop) COPY file:85450fd5b81b7fda5dbbe405f312952d9e786888200ed5fb92171458853e50f7 in /usr | 87.5 Mib   | 74329547 |                                                   |
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
@y
*******************************************************************************************************************************************************************************************************
* Step #4 Docker image layer information
*******************************************************************************************************************************************************************************************************
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
| Manifest | Layer | Command                                                                                              | Size       | Blob     | Matches                                           |
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
| 58715d53 | 1     | /bin/sh -c #(nop) ADD file:ebba725fb97cea45d0b1b35ccc8144e766fcfc9a78530465c23b0c4674b14042 in /     | 43.1 Mib   | 06b22ddb | debian:stretch@6ccbcbf3                           |
| 58715d53 | 3     | /bin/sh -c apt-get update && apt-get install -y --no-install-recommends ca-certificates curl wget && | 10.6 Mib   | 336c28b4 |                                                   |
| 58715d53 | 4     | /bin/sh -c set -ex; if ! command -v gpg > /dev/null; then apt-get update; apt-get install -y --no-in | 4.2 Mib    | 1f3e6b8d |                                                   |
| 58715d53 | 5     | /bin/sh -c apt-get update && apt-get install -y --no-install-recommends bzip2 unzip xz-utils && rm - | 614.7 Kib  | aeac5951 |                                                   |
| 58715d53 | 7     | /bin/sh -c { echo '#!/bin/sh'; echo 'set -e'; echo; echo 'dirname "$(dirname "$(readlink -f "$(which | 241 Bytes  | b01db8bd |                                                   |
| 58715d53 | 8     | /bin/sh -c ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /docker-java-home      | 130 Bytes  | f7f398af |                                                   |
| 58715d53 | 13    | /bin/sh -c set -ex; if [ ! -d /usr/share/man/man1 ]; then mkdir -p /usr/share/man/man1; fi; apt-get  | 52.1 Mib   | 1c5595fa |                                                   |
| 58715d53 | 14    | /bin/sh -c /var/lib/dpkg/info/ca-certificates-java.postinst configure                                | 265.6 Kib  | e1a6cc83 |                                                   |
| 58715d53 | 17    | /bin/sh -c mkdir -p "$CATALINA_HOME"                                                                 | 144 Bytes  | 9efe1c93 |                                                   |
| 58715d53 | 23    | /bin/sh -c apt-get update && apt-get install -y --no-install-recommends libapr1 openssl="$OPENSSL_VE | 220.4 Kib  | eef936b7 |                                                   |
| 58715d53 | 25    | /bin/sh -c set -ex; for key in $GPG_KEYS; do gpg --keyserver ha.pool.sks-keyservers.net --recv-keys  | 109.6 Kib  | 3c1e7106 |                                                   |
| 58715d53 | 32    | /bin/sh -c set -x && { wget -O tomcat.tar.gz "$TOMCAT_TGZ_URL" || wget -O tomcat.tar.gz "$TOMCAT_TGZ | 9.6 Mib    | e87d3364 |                                                   |
| 58715d53 | 33    | /bin/sh -c set -e && nativeLines="$(catalina.sh configtest 2>&1)" && nativeLines="$(echo "$nativeLin | 128 Bytes  | 8ecc2c09 |                                                   |
| 58715d53 | 39    | /bin/sh -c #(nop) COPY file:85450fd5b81b7fda5dbbe405f312952d9e786888200ed5fb92171458853e50f7 in /usr | 87.5 Mib   | 74329547 |                                                   |
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #5 Docker image inspection results
*******************************************************************************************************************************************************************************************************
Passed:  Docker image was built from the official Docker base image "debian:stretch".
Warning: Docker image was not built using Docker Enterprise Edition!
Passed:  Docker image metadata contains a Maintainer.
Warning: Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended.
Passed:  Docker image Cmd attribute is not running supervisord.
Passed:  Docker image Entrypoint attribute is not running supervisord.
@y
*******************************************************************************************************************************************************************************************************
* Step #5 Docker image inspection results
*******************************************************************************************************************************************************************************************************
Passed:  Docker image was built from the official Docker base image "debian:stretch".
Warning: Docker image was not built using Docker Enterprise Edition!
Passed:  Docker image metadata contains a Maintainer.
Warning: Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended.
Passed:  Docker image Cmd attribute is not running supervisord.
Passed:  Docker image Entrypoint attribute is not running supervisord.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #6 Attempting to start a container from the Docker image "gforghetti/tomcat-wildbook:latest" ...
*******************************************************************************************************************************************************************************************************
Passed:  Docker container with the container id aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f was started.
@y
*******************************************************************************************************************************************************************************************************
* Step #6 Attempting to start a container from the Docker image "gforghetti/tomcat-wildbook:latest" ...
*******************************************************************************************************************************************************************************************************
Passed:  Docker container with the container id aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f was started.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #7 Waiting 30 seconds to give the container time to initialize...
*******************************************************************************************************************************************************************************************************
Wait time expired, continuing.
@y
*******************************************************************************************************************************************************************************************************
* Step #7 Waiting 30 seconds to give the container time to initialize...
*******************************************************************************************************************************************************************************************************
Wait time expired, continuing.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #8 Checking to see if the container is still running.
*******************************************************************************************************************************************************************************************************
Passed:  Docker container with the container id aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f is running.
@y
*******************************************************************************************************************************************************************************************************
* Step #8 Checking to see if the container is still running.
*******************************************************************************************************************************************************************************************************
Passed:  Docker container with the container id aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f is running.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #9 Displaying the running processes in the Docker container
*******************************************************************************************************************************************************************************************************
Passed:  Docker container has 1 running process.
@y
*******************************************************************************************************************************************************************************************************
* Step #9 Displaying the running processes in the Docker container
*******************************************************************************************************************************************************************************************************
Passed:  Docker container has 1 running process.
@z

@x
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                2609                2592                42                  12:59               ?                   00:00:12            /docker-java-home/jre/bin/java -Djava.util.logging.config.f
@y
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                2609                2592                42                  12:59               ?                   00:00:12            /docker-java-home/jre/bin/java -Djava.util.logging.config.f
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #10 Checking if supervisord is running in the Docker container
*******************************************************************************************************************************************************************************************************
Passed:  Docker container is not running supervisord.
@y
*******************************************************************************************************************************************************************************************************
* Step #10 Checking if supervisord is running in the Docker container
*******************************************************************************************************************************************************************************************************
Passed:  Docker container is not running supervisord.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #11 Displaying Docker container resource usage statistics
*******************************************************************************************************************************************************************************************************
Passed:  Docker container resource usage statistics were retrieved.
@y
*******************************************************************************************************************************************************************************************************
* Step #11 Displaying Docker container resource usage statistics
*******************************************************************************************************************************************************************************************************
Passed:  Docker container resource usage statistics were retrieved.
@z

@x
CPU %               MEM %               MEM USAGE / LIMIT     BLOCK I/O           NET I/O             PIDS
0.69%               5.26%               844.4MiB / 15.67GiB   1.67MB / 0B         1.17kB / 1.28kB     50
@y
CPU %               MEM %               MEM USAGE / LIMIT     BLOCK I/O           NET I/O             PIDS
0.69%               5.26%               844.4MiB / 15.67GiB   1.67MB / 0B         1.17kB / 1.28kB     50
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #12 Displaying the logs from the Docker container (last 20 lines)
*******************************************************************************************************************************************************************************************************
Passed:  Docker container logs were retrieved.
@y
*******************************************************************************************************************************************************************************************************
* Step #12 Displaying the logs from the Docker container (last 20 lines)
*******************************************************************************************************************************************************************************************************
Passed:  Docker container logs were retrieved.
@z

@x
2017-10-27T12:59:57.839970103Z
2017-10-27T12:59:57.965093247Z  27-Oct-2017 12:59:57.964 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployWAR Deployment of web application archive [/usr/local/tomcat/webapps
2017-10-27T12:59:57.966178465Z  27-Oct-2017 12:59:57.965 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.051675791Z  27-Oct-2017 12:59:58.050 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.051695596Z  27-Oct-2017 12:59:58.051 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.063373978Z  27-Oct-2017 12:59:58.063 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.064087355Z  27-Oct-2017 12:59:58.063 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.072187812Z  27-Oct-2017 12:59:58.071 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.072363314Z  27-Oct-2017 12:59:58.072 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.079126206Z  27-Oct-2017 12:59:58.078 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.079791893Z  27-Oct-2017 12:59:58.079 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.085699688Z  27-Oct-2017 12:59:58.085 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.093847452Z  27-Oct-2017 12:59:58.093 INFO [main] org.apache.coyote.AbstractProtocol.start Starting ProtocolHandler ["http-nio-8080"]
2017-10-27T12:59:58.099472816Z  27-Oct-2017 12:59:58.099 INFO [main] org.apache.coyote.AbstractProtocol.start Starting ProtocolHandler ["ajp-nio-8009"]
2017-10-27T12:59:58.101352107Z  27-Oct-2017 12:59:58.100 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in 10249 ms
2017-10-27T13:00:02.659016400Z  WARNING: /var/spool/WildbookScheduledQueue does not exist or is not a directory; skipping
2017-10-27T13:00:02.659037921Z  ==== ScheduledQueue run [count 1]; queueDir=/var/spool/WildbookScheduledQueue; continue = true ====
2017-10-27T13:00:08.097747157Z  27-Oct-2017 13:00:08.097 INFO [localhost-startStop-2] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T13:00:08.113051631Z  27-Oct-2017 13:00:08.112 INFO [localhost-startStop-2] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T13:00:12.672625154Z  WARNING: /var/spool/WildbookScheduledQueue does not exist or is not a directory; skipping
@y
2017-10-27T12:59:57.839970103Z
2017-10-27T12:59:57.965093247Z  27-Oct-2017 12:59:57.964 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployWAR Deployment of web application archive [/usr/local/tomcat/webapps
2017-10-27T12:59:57.966178465Z  27-Oct-2017 12:59:57.965 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.051675791Z  27-Oct-2017 12:59:58.050 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.051695596Z  27-Oct-2017 12:59:58.051 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.063373978Z  27-Oct-2017 12:59:58.063 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.064087355Z  27-Oct-2017 12:59:58.063 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.072187812Z  27-Oct-2017 12:59:58.071 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.072363314Z  27-Oct-2017 12:59:58.072 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.079126206Z  27-Oct-2017 12:59:58.078 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.079791893Z  27-Oct-2017 12:59:58.079 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T12:59:58.085699688Z  27-Oct-2017 12:59:58.085 INFO [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T12:59:58.093847452Z  27-Oct-2017 12:59:58.093 INFO [main] org.apache.coyote.AbstractProtocol.start Starting ProtocolHandler ["http-nio-8080"]
2017-10-27T12:59:58.099472816Z  27-Oct-2017 12:59:58.099 INFO [main] org.apache.coyote.AbstractProtocol.start Starting ProtocolHandler ["ajp-nio-8009"]
2017-10-27T12:59:58.101352107Z  27-Oct-2017 12:59:58.100 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in 10249 ms
2017-10-27T13:00:02.659016400Z  WARNING: /var/spool/WildbookScheduledQueue does not exist or is not a directory; skipping
2017-10-27T13:00:02.659037921Z  ==== ScheduledQueue run [count 1]; queueDir=/var/spool/WildbookScheduledQueue; continue = true ====
2017-10-27T13:00:08.097747157Z  27-Oct-2017 13:00:08.097 INFO [localhost-startStop-2] org.apache.catalina.startup.HostConfig.deployDirectory Deploying web application directory [/usr/local/tomcat/web
2017-10-27T13:00:08.113051631Z  27-Oct-2017 13:00:08.112 INFO [localhost-startStop-2] org.apache.catalina.startup.HostConfig.deployDirectory Deployment of web application directory [/usr/local/tomcat
2017-10-27T13:00:12.672625154Z  WARNING: /var/spool/WildbookScheduledQueue does not exist or is not a directory; skipping
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #13 Attempting to stop the Docker container normally with a timeout of 60 seconds before it is killed ...
*******************************************************************************************************************************************************************************************************
Passed:  Docker container aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f was stopped successfully.
Warning: Docker container did not exit with an exit code of 0! Exit code was 143.
@y
*******************************************************************************************************************************************************************************************************
* Step #13 Attempting to stop the Docker container normally with a timeout of 60 seconds before it is killed ...
*******************************************************************************************************************************************************************************************************
Passed:  Docker container aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f was stopped successfully.
Warning: Docker container did not exit with an exit code of 0! Exit code was 143.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #14 Removing the Docker container and any associated volumes.
*******************************************************************************************************************************************************************************************************
Passed:  Docker container and any associated volumes removed.
@y
*******************************************************************************************************************************************************************************************************
* Step #14 Removing the Docker container and any associated volumes.
*******************************************************************************************************************************************************************************************************
Passed:  Docker container and any associated volumes removed.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #15 Removing the Docker image "gforghetti/tomcat-wildbook:latest".
*******************************************************************************************************************************************************************************************************
Passed:  Docker image "gforghetti/tomcat-wildbook:latest" was removed.
Passed:  This test was performed on Docker Enterprise Edition.
@y
*******************************************************************************************************************************************************************************************************
* Step #15 Removing the Docker image "gforghetti/tomcat-wildbook:latest".
*******************************************************************************************************************************************************************************************************
Passed:  Docker image "gforghetti/tomcat-wildbook:latest" was removed.
Passed:  This test was performed on Docker Enterprise Edition.
@z

@x
*******************************************************************************************************************************************************************************************************
* Summary of the inspection for Docker image: gforghetti/tomcat-wildbook:latest
*******************************************************************************************************************************************************************************************************
@y
*******************************************************************************************************************************************************************************************************
* Summary of the inspection for Docker image: gforghetti/tomcat-wildbook:latest
*******************************************************************************************************************************************************************************************************
@z

@x
Date: Mon May 21 13:29:29 2018
Operating System: Ubuntu 16.04.4 LTS
Architecture: amd64
Docker Client Version: 17.06.2-ee-11
Docker Server Version: 17.06.2-ee-11
@y
Date: Mon May 21 13:29:29 2018
Operating System: Ubuntu 16.04.4 LTS
Architecture: amd64
Docker Client Version: 17.06.2-ee-11
Docker Server Version: 17.06.2-ee-11
@z

@x
There were 3 warnings detected!
@y
There were 3 warnings detected!
@z

@x
Passed:  Docker image "gforghetti/tomcat-wildbook:latest" has been inspected.
Passed:  Docker image was built from the official Docker base image "debian:stretch".
Warning: Docker image was not built using Docker Enterprise Edition!
Passed:  Docker image metadata contains a Maintainer.
Warning: Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended.
Passed:  Docker image Cmd attribute is not running supervisord.
Passed:  Docker image Entrypoint attribute is not running supervisord.
Passed:  Docker container with the container id aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f was started.
Passed:  Docker container with the container id aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f is running.
Passed:  Docker container has 1 running process.
Passed:  Docker container is not running supervisord.
Passed:  Docker container resource usage statistics were retrieved.
Passed:  Docker container logs were retrieved.
Passed:  Docker container aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f was stopped successfully.
Warning: Docker container did not exit with an exit code of 0! Exit code was 143.
Passed:  Docker container and any associated volumes removed.
Passed:  Docker image "gforghetti/tomcat-wildbook:latest" was removed.
Passed:  This test was performed on Docker Enterprise Edition.
@y
Passed:  Docker image "gforghetti/tomcat-wildbook:latest" has been inspected.
Passed:  Docker image was built from the official Docker base image "debian:stretch".
Warning: Docker image was not built using Docker Enterprise Edition!
Passed:  Docker image metadata contains a Maintainer.
Warning: Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended.
Passed:  Docker image Cmd attribute is not running supervisord.
Passed:  Docker image Entrypoint attribute is not running supervisord.
Passed:  Docker container with the container id aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f was started.
Passed:  Docker container with the container id aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f is running.
Passed:  Docker container has 1 running process.
Passed:  Docker container is not running supervisord.
Passed:  Docker container resource usage statistics were retrieved.
Passed:  Docker container logs were retrieved.
Passed:  Docker container aea5d97925c7035e0037ccc79723fd534a26cbb8be2a124e0257b3a8c3fca55f was stopped successfully.
Warning: Docker container did not exit with an exit code of 0! Exit code was 143.
Passed:  Docker container and any associated volumes removed.
Passed:  Docker image "gforghetti/tomcat-wildbook:latest" was removed.
Passed:  This test was performed on Docker Enterprise Edition.
@z

@x
The inspection of the Docker image gforghetti/tomcat-wildbook:latest has completed.
@y
The inspection of the Docker image gforghetti/tomcat-wildbook:latest has completed.
@z

@x
If -product-id is specified on command line:
**************************************************************************************************************************************************************************************************
* Step #16 Upload the test result to Docker Hub.
**************************************************************************************************************************************************************************************************
Passed:   The test results are uploaded to Docker Hub.
@y
If -product-id is specified on command line:
**************************************************************************************************************************************************************************************************
* Step #16 Upload the test result to Docker Hub.
**************************************************************************************************************************************************************************************************
Passed:   The test results are uploaded to Docker Hub.
@z

@x
root:[~/] #
```
@y
root:[~/] #
```
@z

@x
<a name="linux-with-json">
@y
<a name="linux-with-json">
@z

@x
### Inspect a Linux Docker image with JSON output
@y
### Inspect a Linux Docker image with JSON output
@z

@x
#### To inspect the Docker image, `gforghetti/apache:latest`, with JSON output:
@y
#### To inspect the Docker image, `gforghetti/apache:latest`, with JSON output:
@z

@x
```console
root:[~/] # ./inspectDockerImage --json gforghetti/apache:latest | jq
```
@y
```console
root:[~/] # ./inspectDockerImage --json gforghetti/apache:latest | jq
```
@z

@x
> **Note**: The output was piped to the `jq` command to display it "nicely".
@y
> **Note**: The output was piped to the `jq` command to display it "nicely".
@z

@x
#### Output:
@y
#### Output:
@z

@x
```json
{
  "Date": "Mon May 21 13:23:37 2018",
  "SystemOperatingSystem": "Operating System: Ubuntu 16.04.4 LTS",
  "SystemArchitecture": "amd64",
  "SystemDockerClientVersion": "17.06.2-ee-11",
  "SystemDockerServerVersion": "17.06.2-ee-11",
  "DockerImage": {
    "Name": "gforghetti/apache:latest",
    "Size": "178MB",
    "Layers": "23",
    "Digest": "sha256:65db5d0a8b88ee3d5e5a579a70943433d36d3e6d6a974598a5eebeef9e02a346",
    "BaseLayerDigest": "sha256:85b1f47fba49da65256f07c8790542a3880e9216f9c491965040f35ce2c6ca7a",
    "OfficialBaseImage": "debian:8@sha256:3a5aa6bf675aa71e60df347b29f0a1b1634306cd8db47e1af0a16ad420d1b127",
    "CreatedOn": "2017-10-19T17:51:53",
    "DockerVersion": "17.09.0-ce",
    "Author": "",
    "Maintainer": "Gary Forghetti, Docker Inc.",
    "OperatingSystem": "linux",
    "OperatingSystemVersion": "Debian GNU/Linux 8 (jessie)",
    "Architecture": "amd64",
    "User": "",
    "WorkingDir": "/usr/local/apache2",
    "EntryPoint": "",
    "Cmd": "httpd-foreground",
    "Shell": "",
    "Env": "PATH=/usr/local/apache2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\nHTTPD_PREFIX=/usr/local/apache2\nNGHTTP2_VERSION=1.18.1-1\nOPENSSL_VERSION=1.0.2l-1~bpo8+1\nHTTPD_VERSION=2.4.28\nHTTPD_SHA256=c1197a3a62a4ab5c584ab89b249af38cf28b4adee9c0106b62999fd29f920666\nHTTPD_PATCHES=\nAPACHE_DIST_URLS=https://www.apache.org/dyn/closer.cgi?action=download&filename= \thttps://www-us.apache.org/dist/ \thttps://www.apache.org/dist/ \thttps://archive.apache.org/dist/",
    "ExposedPorts": "80/tcp ",
    "HealthCheck": "",
    "Volumes": ""
  },
  "Errors": 0,
  "Warnings": 2,
  "HTMLReportFile": "",
  "VulnerabilitiesScanURL": "",
  "Results": [
    {
      "Status": "Passed",
      "Message": "Docker image \"gforghetti/apache:latest\" has been inspected."
    },
    {
      "Status": "Passed",
      "Message": "Docker image was built from the official Docker base image \"debian:8\"."
    },
    {
      "Status": "Warning",
      "Message": "Docker image was not built using Docker Enterprise Edition!"
    },
    {
      "Status": "Passed",
      "Message": "Docker image metadata contains a Maintainer."
    },
    {
      "Status": "Warning",
      "Message": "Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended."
    },
    {
      "Status": "Passed",
      "Message": "Docker image Cmd attribute is not running supervisord."
    },
    {
      "Status": "Passed",
      "Message": "Docker image Entrypoint attribute is not running supervisord."
    },
    {
      "Status": "Passed",
      "Message": "Docker container 424de05adfa2c84890513a51d3d5bc210e4d4b41c746c9252648f38d95b8be49 was started."
    },
    {
      "Status": "Passed",
      "Message": "Docker container 424de05adfa2c84890513a51d3d5bc210e4d4b41c746c9252648f38d95b8be49 is running."
    },
    {
      "Status": "Passed",
      "Message": "Docker container has 4 running processes."
    },
    {
      "Status": "Passed",
      "Message": "Docker container is not running supervisord."
    },
    {
      "Status": "Passed",
      "Message": "Docker container resource usage statistics were retrieved."
    },
    {
      "Status": "Passed",
      "Message": "Docker container logs were retrieved."
    },
    {
      "Status": "Passed",
      "Message": "Docker container 424de05adfa2c84890513a51d3d5bc210e4d4b41c746c9252648f38d95b8be49 was stopped successfully."
    },
    {
      "Status": "Passed",
      "Message": "Docker container exited with an exit code of 0."
    },
    {
      "Status": "Passed",
      "Message": "Docker container and any associated volumes removed."
    },
    {
      "Status": "Passed",
      "Message": "Docker image \"gforghetti/apache:latest\" was removed."
    },
    {
      "Status": "Passed",
      "Message": "This test was performed on Docker Enterprise Edition."
    }
  ]
}
```
@y
```json
{
  "Date": "Mon May 21 13:23:37 2018",
  "SystemOperatingSystem": "Operating System: Ubuntu 16.04.4 LTS",
  "SystemArchitecture": "amd64",
  "SystemDockerClientVersion": "17.06.2-ee-11",
  "SystemDockerServerVersion": "17.06.2-ee-11",
  "DockerImage": {
    "Name": "gforghetti/apache:latest",
    "Size": "178MB",
    "Layers": "23",
    "Digest": "sha256:65db5d0a8b88ee3d5e5a579a70943433d36d3e6d6a974598a5eebeef9e02a346",
    "BaseLayerDigest": "sha256:85b1f47fba49da65256f07c8790542a3880e9216f9c491965040f35ce2c6ca7a",
    "OfficialBaseImage": "debian:8@sha256:3a5aa6bf675aa71e60df347b29f0a1b1634306cd8db47e1af0a16ad420d1b127",
    "CreatedOn": "2017-10-19T17:51:53",
    "DockerVersion": "17.09.0-ce",
    "Author": "",
    "Maintainer": "Gary Forghetti, Docker Inc.",
    "OperatingSystem": "linux",
    "OperatingSystemVersion": "Debian GNU/Linux 8 (jessie)",
    "Architecture": "amd64",
    "User": "",
    "WorkingDir": "/usr/local/apache2",
    "EntryPoint": "",
    "Cmd": "httpd-foreground",
    "Shell": "",
    "Env": "PATH=/usr/local/apache2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\nHTTPD_PREFIX=/usr/local/apache2\nNGHTTP2_VERSION=1.18.1-1\nOPENSSL_VERSION=1.0.2l-1~bpo8+1\nHTTPD_VERSION=2.4.28\nHTTPD_SHA256=c1197a3a62a4ab5c584ab89b249af38cf28b4adee9c0106b62999fd29f920666\nHTTPD_PATCHES=\nAPACHE_DIST_URLS=https://www.apache.org/dyn/closer.cgi?action=download&filename= \thttps://www-us.apache.org/dist/ \thttps://www.apache.org/dist/ \thttps://archive.apache.org/dist/",
    "ExposedPorts": "80/tcp ",
    "HealthCheck": "",
    "Volumes": ""
  },
  "Errors": 0,
  "Warnings": 2,
  "HTMLReportFile": "",
  "VulnerabilitiesScanURL": "",
  "Results": [
    {
      "Status": "Passed",
      "Message": "Docker image \"gforghetti/apache:latest\" has been inspected."
    },
    {
      "Status": "Passed",
      "Message": "Docker image was built from the official Docker base image \"debian:8\"."
    },
    {
      "Status": "Warning",
      "Message": "Docker image was not built using Docker Enterprise Edition!"
    },
    {
      "Status": "Passed",
      "Message": "Docker image metadata contains a Maintainer."
    },
    {
      "Status": "Warning",
      "Message": "Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended."
    },
    {
      "Status": "Passed",
      "Message": "Docker image Cmd attribute is not running supervisord."
    },
    {
      "Status": "Passed",
      "Message": "Docker image Entrypoint attribute is not running supervisord."
    },
    {
      "Status": "Passed",
      "Message": "Docker container 424de05adfa2c84890513a51d3d5bc210e4d4b41c746c9252648f38d95b8be49 was started."
    },
    {
      "Status": "Passed",
      "Message": "Docker container 424de05adfa2c84890513a51d3d5bc210e4d4b41c746c9252648f38d95b8be49 is running."
    },
    {
      "Status": "Passed",
      "Message": "Docker container has 4 running processes."
    },
    {
      "Status": "Passed",
      "Message": "Docker container is not running supervisord."
    },
    {
      "Status": "Passed",
      "Message": "Docker container resource usage statistics were retrieved."
    },
    {
      "Status": "Passed",
      "Message": "Docker container logs were retrieved."
    },
    {
      "Status": "Passed",
      "Message": "Docker container 424de05adfa2c84890513a51d3d5bc210e4d4b41c746c9252648f38d95b8be49 was stopped successfully."
    },
    {
      "Status": "Passed",
      "Message": "Docker container exited with an exit code of 0."
    },
    {
      "Status": "Passed",
      "Message": "Docker container and any associated volumes removed."
    },
    {
      "Status": "Passed",
      "Message": "Docker image \"gforghetti/apache:latest\" was removed."
    },
    {
      "Status": "Passed",
      "Message": "This test was performed on Docker Enterprise Edition."
    }
  ]
}
```
@z

@x
<a name="linux-with-html">
@y
<a name="linux-with-html">
@z

@x
### Inspect a Linux Docker image with HTML output
@y
### Inspect a Linux Docker image with HTML output
@z

@x
#### To inspect the Docker image, `gforghetti/apache:latest`, with HTML output:
@y
#### To inspect the Docker image, `gforghetti/apache:latest`, with HTML output:
@z

@x
```console
root:[~/] # ./inspectDockerImage --html gforghetti/apache:latest
```
@y
```console
root:[~/] # ./inspectDockerImage --html gforghetti/apache:latest
```
@z

@x
Note: The majority of the stdout message output has been intentionally omitted below.
@y
Note: The majority of the stdout message output has been intentionally omitted below.
@z

@x
#### Output:
@y
#### Output:
@z

@x
```
@y
```
@z

@x
The inspection of the Docker image gforghetti/apache:latest has completed.
An HTML report has been generated in the file html/gforghetti-apache-latest_inspection_report_2017-10-27_01-03-43.html
root:[~/] #
```
@y
The inspection of the Docker image gforghetti/apache:latest has completed.
An HTML report has been generated in the file html/gforghetti-apache-latest_inspection_report_2017-10-27_01-03-43.html
root:[~/] #
```
@z

@x
##### Image 1
@y
##### Image 1
@z

@x
  ![HTML Output image 1](/images/gforghetti-apache-latest_inspection_report.html-1.png)
@y
  ![HTML Output image 1](/images/gforghetti-apache-latest_inspection_report.html-1.png)
@z

@x
##### Image 2
@y
##### Image 2
@z

@x
  ![HTML Output image 2](/images/gforghetti-apache-latest_inspection_report.html-2.png)
@y
  ![HTML Output image 2](/images/gforghetti-apache-latest_inspection_report.html-2.png)
@z

@x
##### Image 3
@y
##### Image 3
@z

@x
  ![HTML Output image 3](/images/gforghetti-apache-latest_inspection_report.html-3.png)
@y
  ![HTML Output image 3](/images/gforghetti-apache-latest_inspection_report.html-3.png)
@z

@x
<a name="windows">
@y
<a name="windows">
@z

@x
### Inspect a Microsoft Windows Docker image
@y
### Inspect a Microsoft Windows Docker image
@z

@x
#### To inspect the Docker image, `microsoft/nanoserver:latest`:
@y
#### To inspect the Docker image, `microsoft/nanoserver:latest`:
@z

@x
```console
PS D:\InspectDockerimage> .\inspectDockerImage microsoft/nanoserver:latest
```
@y
```console
PS D:\InspectDockerimage> .\inspectDockerImage microsoft/nanoserver:latest
```
@z

@x
#### Output:
@y
#### Output:
@z

@x
```
*******************************************************************************************************************************************************************************************************
* Docker image: microsoft/nanoserver:latest
*******************************************************************************************************************************************************************************************************
@y
```
*******************************************************************************************************************************************************************************************************
* Docker image: microsoft/nanoserver:latest
*******************************************************************************************************************************************************************************************************
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #1 Loading information on the Docker official base images ...
*******************************************************************************************************************************************************************************************************
The Docker official base images data has been loaded from the docker_official_base_images.json file. Last updated on Sun May 20 16:36:20 2018.
@y
*******************************************************************************************************************************************************************************************************
* Step #1 Loading information on the Docker official base images ...
*******************************************************************************************************************************************************************************************************
The Docker official base images data has been loaded from the docker_official_base_images.json file. Last updated on Sun May 20 16:36:20 2018.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #2 Inspecting the Docker image "microsoft/nanoserver:latest" ...
*******************************************************************************************************************************************************************************************************
Pulling the Docker Image microsoft/nanoserver:latest ...
Pulling the Docker Image took 13.2107625s
Passed:  Docker image "microsoft/nanoserver:latest" has been inspected.
@y
*******************************************************************************************************************************************************************************************************
* Step #2 Inspecting the Docker image "microsoft/nanoserver:latest" ...
*******************************************************************************************************************************************************************************************************
Pulling the Docker Image microsoft/nanoserver:latest ...
Pulling the Docker Image took 13.2107625s
Passed:  Docker image "microsoft/nanoserver:latest" has been inspected.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #3 Docker image information
*******************************************************************************************************************************************************************************************************
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Docker image:             | microsoft/nanoserver:latest                                                                                                                                             |
| Size:                     | 1.13GB                                                                                                                                                                  |
| Layers:                   | 2                                                                                                                                                                       |
| Digest:                   | sha256:d3cc51de184f3bdf9262c53077886f78e3fc13282bcfc6daf172df7f47f86806                                                                                                 |
| Base layer digest:        | sha256:bce2fbc256ea437a87dadac2f69aabd25bed4f56255549090056c1131fad0277                                                                                                 |
| Official base image:      | golang:1.6.4-nanoserver@sha256:38890e2983bd2700145f1b4377ad8d826531a0a15fc68152b2478406f5ead6e2                                                                         |
| Created on:               | 2018-05-08T10:43:39                                                                                                                                                     |
| Docker version:           |                                                                                                                                                                         |
| Author:                   |                                                                                                                                                                         |
| Maintainer:               |                                                                                                                                                                         |
| Operating system:         | windows                                                                                                                                                                 |
| Operating system version: | Microsoft Windows Server 2016 Datacenter                                                                                                                                |
| Architecture:             | amd64                                                                                                                                                                   |
| User:                     |                                                                                                                                                                         |
| WorkingDir:               |                                                                                                                                                                         |
| Entrypoint:               |                                                                                                                                                                         |
| Cmd:                      | c:\windows\system32\cmd.exe                                                                                                                                             |
| Shell:                    |                                                                                                                                                                         |
| ExposedPorts:             |                                                                                                                                                                         |
| Healthcheck:              |                                                                                                                                                                         |
| Volumes:                  |                                                                                                                                                                         |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
@y
*******************************************************************************************************************************************************************************************************
* Step #3 Docker image information
*******************************************************************************************************************************************************************************************************
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Docker image:             | microsoft/nanoserver:latest                                                                                                                                             |
| Size:                     | 1.13GB                                                                                                                                                                  |
| Layers:                   | 2                                                                                                                                                                       |
| Digest:                   | sha256:d3cc51de184f3bdf9262c53077886f78e3fc13282bcfc6daf172df7f47f86806                                                                                                 |
| Base layer digest:        | sha256:bce2fbc256ea437a87dadac2f69aabd25bed4f56255549090056c1131fad0277                                                                                                 |
| Official base image:      | golang:1.6.4-nanoserver@sha256:38890e2983bd2700145f1b4377ad8d826531a0a15fc68152b2478406f5ead6e2                                                                         |
| Created on:               | 2018-05-08T10:43:39                                                                                                                                                     |
| Docker version:           |                                                                                                                                                                         |
| Author:                   |                                                                                                                                                                         |
| Maintainer:               |                                                                                                                                                                         |
| Operating system:         | windows                                                                                                                                                                 |
| Operating system version: | Microsoft Windows Server 2016 Datacenter                                                                                                                                |
| Architecture:             | amd64                                                                                                                                                                   |
| User:                     |                                                                                                                                                                         |
| WorkingDir:               |                                                                                                                                                                         |
| Entrypoint:               |                                                                                                                                                                         |
| Cmd:                      | c:\windows\system32\cmd.exe                                                                                                                                             |
| Shell:                    |                                                                                                                                                                         |
| ExposedPorts:             |                                                                                                                                                                         |
| Healthcheck:              |                                                                                                                                                                         |
| Volumes:                  |                                                                                                                                                                         |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #4 Docker image layer information
*******************************************************************************************************************************************************************************************************
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
| Manifest | Layer | Command                                                                                              | Size       | Blob     | Matches                                           |
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
| d3cc51de | 1     | Apply image 10.0.14393.0                                                                             | 241 Mib    | bce2fbc2 | golang:1.6.4-nanoserver@38890e29                  |
| d3cc51de | 2     | Install update 10.0.14393.2248                                                                       | 157.2 Mib  | 58518d66 |                                                   |
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
@y
*******************************************************************************************************************************************************************************************************
* Step #4 Docker image layer information
*******************************************************************************************************************************************************************************************************
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
| Manifest | Layer | Command                                                                                              | Size       | Blob     | Matches                                           |
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
| d3cc51de | 1     | Apply image 10.0.14393.0                                                                             | 241 Mib    | bce2fbc2 | golang:1.6.4-nanoserver@38890e29                  |
| d3cc51de | 2     | Install update 10.0.14393.2248                                                                       | 157.2 Mib  | 58518d66 |                                                   |
+----------+-------+------------------------------------------------------------------------------------------------------+------------+----------+---------------------------------------------------+
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #5 Docker image inspection results
*******************************************************************************************************************************************************************************************************
Passed:  Docker image was built from the official Docker base image "golang:1.6.4-nanoserver".
Warning: Docker image was not built using Docker Enterprise Edition!
Warning: Docker image metadata does not contain an Author or Maintainer!
Warning: Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended.
@y
*******************************************************************************************************************************************************************************************************
* Step #5 Docker image inspection results
*******************************************************************************************************************************************************************************************************
Passed:  Docker image was built from the official Docker base image "golang:1.6.4-nanoserver".
Warning: Docker image was not built using Docker Enterprise Edition!
Warning: Docker image metadata does not contain an Author or Maintainer!
Warning: Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #6 Attempting to start a container from the Docker image "microsoft/nanoserver:latest" ...
*******************************************************************************************************************************************************************************************************
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c was started.
@y
*******************************************************************************************************************************************************************************************************
* Step #6 Attempting to start a container from the Docker image "microsoft/nanoserver:latest" ...
*******************************************************************************************************************************************************************************************************
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c was started.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #7 Waiting 30 seconds to give the container time to initialize...
*******************************************************************************************************************************************************************************************************
Wait time expired, continuing.
@y
*******************************************************************************************************************************************************************************************************
* Step #7 Waiting 30 seconds to give the container time to initialize...
*******************************************************************************************************************************************************************************************************
Wait time expired, continuing.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #8 Checking to see if the container is still running.
*******************************************************************************************************************************************************************************************************
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c is running.
@y
*******************************************************************************************************************************************************************************************************
* Step #8 Checking to see if the container is still running.
*******************************************************************************************************************************************************************************************************
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c is running.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #9 Displaying the running processes in the Docker container
*******************************************************************************************************************************************************************************************************
Passed:  Docker container has 16 running processes.
@y
*******************************************************************************************************************************************************************************************************
* Step #9 Displaying the running processes in the Docker container
*******************************************************************************************************************************************************************************************************
Passed:  Docker container has 16 running processes.
@z

@x
Name                PID                 CPU                 Private Working Set
smss.exe            852                 00:00:00.031        217.1kB
csrss.exe           3436                00:00:00.015        348.2kB
wininit.exe         4728                00:00:00.046        647.2kB
services.exe        4292                00:00:00.125        1.491MB
lsass.exe           3560                00:00:00.203        2.839MB
svchost.exe         4484                00:00:00.078        1.229MB
svchost.exe         3460                00:00:00.031        1.47MB
svchost.exe         5184                00:00:00.078        2.154MB
svchost.exe         5496                00:00:00.046        1.45MB
svchost.exe         4088                00:00:00.078        3.715MB
svchost.exe         6140                00:00:00.046        1.942MB
svchost.exe         5212                00:00:00.015        1.683MB
svchost.exe         5680                00:00:00.375        4.612MB
svchost.exe         3384                00:00:00.234        6.369MB
CExecSvc.exe        5636                00:00:00.015        766kB
cmd.exe             3888                00:00:00.000        401.4kB
@y
Name                PID                 CPU                 Private Working Set
smss.exe            852                 00:00:00.031        217.1kB
csrss.exe           3436                00:00:00.015        348.2kB
wininit.exe         4728                00:00:00.046        647.2kB
services.exe        4292                00:00:00.125        1.491MB
lsass.exe           3560                00:00:00.203        2.839MB
svchost.exe         4484                00:00:00.078        1.229MB
svchost.exe         3460                00:00:00.031        1.47MB
svchost.exe         5184                00:00:00.078        2.154MB
svchost.exe         5496                00:00:00.046        1.45MB
svchost.exe         4088                00:00:00.078        3.715MB
svchost.exe         6140                00:00:00.046        1.942MB
svchost.exe         5212                00:00:00.015        1.683MB
svchost.exe         5680                00:00:00.375        4.612MB
svchost.exe         3384                00:00:00.234        6.369MB
CExecSvc.exe        5636                00:00:00.015        766kB
cmd.exe             3888                00:00:00.000        401.4kB
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #10 Displaying Docker container resource usage statistics
*******************************************************************************************************************************************************************************************************
Passed:  Docker container resource usage statistics were retrieved.
@y
*******************************************************************************************************************************************************************************************************
* Step #10 Displaying Docker container resource usage statistics
*******************************************************************************************************************************************************************************************************
Passed:  Docker container resource usage statistics were retrieved.
@z

@x
CPU %               PRIV WORKING SET    BLOCK I/O           NET I/O
0.00%               29.88MiB            5.21MB / 14.7MB     1.04MB / 24.1kB
@y
CPU %               PRIV WORKING SET    BLOCK I/O           NET I/O
0.00%               29.88MiB            5.21MB / 14.7MB     1.04MB / 24.1kB
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #11 Displaying the logs from the Docker container (last 20 lines)
*******************************************************************************************************************************************************************************************************
Passed:  Docker container logs were retrieved.
@y
*******************************************************************************************************************************************************************************************************
* Step #11 Displaying the logs from the Docker container (last 20 lines)
*******************************************************************************************************************************************************************************************************
Passed:  Docker container logs were retrieved.
@z

@x
2018-05-21T14:29:02.580933000Z  (c) 2016 Microsoft Corporation. All rights reserved.
2018-05-21T14:29:02.584933600Z
@y
2018-05-21T14:29:02.580933000Z  (c) 2016 Microsoft Corporation. All rights reserved.
2018-05-21T14:29:02.584933600Z
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #12 Attempting to stop the Docker container normally with a timeout of 60 seconds before it is killed ...
*******************************************************************************************************************************************************************************************************
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c was stopped successfully.
Passed:  Docker container exited with an exit code of 0.
@y
*******************************************************************************************************************************************************************************************************
* Step #12 Attempting to stop the Docker container normally with a timeout of 60 seconds before it is killed ...
*******************************************************************************************************************************************************************************************************
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c was stopped successfully.
Passed:  Docker container exited with an exit code of 0.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #13 Removing the Docker container and any associated volumes.
*******************************************************************************************************************************************************************************************************
Passed:  Docker container and any associated volumes removed.
@y
*******************************************************************************************************************************************************************************************************
* Step #13 Removing the Docker container and any associated volumes.
*******************************************************************************************************************************************************************************************************
Passed:  Docker container and any associated volumes removed.
@z

@x
*******************************************************************************************************************************************************************************************************
* Step #14 Removing the Docker image "microsoft/nanoserver:latest".
*******************************************************************************************************************************************************************************************************
Passed:  Docker image "microsoft/nanoserver:latest" was removed.
Passed:  This test was performed on Docker Enterprise Edition.
@y
*******************************************************************************************************************************************************************************************************
* Step #14 Removing the Docker image "microsoft/nanoserver:latest".
*******************************************************************************************************************************************************************************************************
Passed:  Docker image "microsoft/nanoserver:latest" was removed.
Passed:  This test was performed on Docker Enterprise Edition.
@z

@x
*******************************************************************************************************************************************************************************************************
* Summary of the inspection for Docker image: microsoft/nanoserver:latest
*******************************************************************************************************************************************************************************************************
@y
*******************************************************************************************************************************************************************************************************
* Summary of the inspection for Docker image: microsoft/nanoserver:latest
*******************************************************************************************************************************************************************************************************
@z

@x
Date: Mon May 21 14:28:36 2018
Operating System: Microsoft Windows Server 2016 Datacenter
Architecture: amd64
Docker Client Version: 17.06.1-ee-2
Docker Server Version: 17.06.1-ee-2
@y
Date: Mon May 21 14:28:36 2018
Operating System: Microsoft Windows Server 2016 Datacenter
Architecture: amd64
Docker Client Version: 17.06.1-ee-2
Docker Server Version: 17.06.1-ee-2
@z

@x
There were 3 warnings detected!
@y
There were 3 warnings detected!
@z

@x
Passed:  Docker image "microsoft/nanoserver:latest" has been inspected.
Passed:  Docker image was built from the official Docker base image "golang:1.6.4-nanoserver".
Warning: Docker image was not built using Docker Enterprise Edition!
Warning: Docker image metadata does not contain an Author or Maintainer!
Warning: Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended.
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c was started.
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c is running.
Passed:  Docker container has 16 running processes.
Passed:  Docker container resource usage statistics were retrieved.
Passed:  Docker container logs were retrieved.
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c was stopped successfully.
Passed:  Docker container exited with an exit code of 0.
Passed:  Docker container and any associated volumes removed.
Passed:  Docker image "microsoft/nanoserver:latest" was removed.
Passed:  This test was performed on Docker Enterprise Edition.
@y
Passed:  Docker image "microsoft/nanoserver:latest" has been inspected.
Passed:  Docker image was built from the official Docker base image "golang:1.6.4-nanoserver".
Warning: Docker image was not built using Docker Enterprise Edition!
Warning: Docker image metadata does not contain an Author or Maintainer!
Warning: Docker image does not contain a Healthcheck! Although a Healthcheck is not required, it is recommended.
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c was started.
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c is running.
Passed:  Docker container has 16 running processes.
Passed:  Docker container resource usage statistics were retrieved.
Passed:  Docker container logs were retrieved.
Passed:  Docker container 1cfbc4be9f39944d4e294cf895210c276143768b951159305dbeb30cb2207a1c was stopped successfully.
Passed:  Docker container exited with an exit code of 0.
Passed:  Docker container and any associated volumes removed.
Passed:  Docker image "microsoft/nanoserver:latest" was removed.
Passed:  This test was performed on Docker Enterprise Edition.
@z

@x
The inspection of the Docker image microsoft/nanoserver:latest has completed.
PS D:\InspectDockerimage>
```
@y
The inspection of the Docker image microsoft/nanoserver:latest has completed.
PS D:\InspectDockerimage>
```
@z
