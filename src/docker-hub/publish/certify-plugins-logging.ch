%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Run certification tests against your images
keywords: Docker, docker, hub, certified content, logging
title: Certify Docker logging plugins
redirect_from:
- /docker-store/certify-plugins-logging/
@y
---
description: Run certification tests against your images
keywords: Docker, docker, hub, certified content, logging
title: Certify Docker logging plugins
redirect_from:
- /docker-store/certify-plugins-logging/
@z

@x
---
@y
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
This page explains how publishers can successfully test their **Docker logging plugins**. Also available: [Certify your Docker images](certify-images).
@y
This page explains how publishers can successfully test their **Docker logging plugins**. Also available: [Certify your Docker images](certify-images).
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
## Certify your logging plugins
@y
## Certify your logging plugins
@z

@x
You must use the tool, `inspectDockerLoggingPlugin`, to certify your content for publication on Docker Hub by ensuring that your Docker logging plugins conform to best practices.
@y
You must use the tool, `inspectDockerLoggingPlugin`, to certify your content for publication on Docker Hub by ensuring that your Docker logging plugins conform to best practices.
@z

@x
The `inspectDockerLoggingPlugin` command verifies that your Docker logging plugin can be installed and works on Docker Enterprise Edition. It also runs a container from an official Docker image of `alpine:latest` and outputs the contents of a file named `quotes.txt` (available for download). In sum, the `inspectDockerLoggingPlugin` command:
@y
The `inspectDockerLoggingPlugin` command verifies that your Docker logging plugin can be installed and works on Docker Enterprise Edition. It also runs a container from an official Docker image of `alpine:latest` and outputs the contents of a file named `quotes.txt` (available for download). In sum, the `inspectDockerLoggingPlugin` command:
@z

@x
- Inspects and displays the Docker logging plugin.
@y
- Inspects and displays the Docker logging plugin.
@z

@x
- Installs the Docker logging plugin on Docker EE.
@y
- Installs the Docker logging plugin on Docker EE.
@z

@x
- Runs a Docker service container with the Docker logging plugin, reads a file named `quotes.txt`, echos its contents to `stdout`, and logs the file's content.
@y
- Runs a Docker service container with the Docker logging plugin, reads a file named `quotes.txt`, echos its contents to `stdout`, and logs the file's content.
@z

@x
- Displays the container logs and compares it to `quotes.txt`. If they match, the test is successful.
@y
- Displays the container logs and compares it to `quotes.txt`. If they match, the test is successful.
@z

@x
The `inspectDockerLoggingPlugin` tool will detect issues and output them as **warnings** or **errors**. **Errors** must be fixed in order to certify. Resolving **warnings** is not required to certify, but you should try to resolve them.
@y
The `inspectDockerLoggingPlugin` tool will detect issues and output them as **warnings** or **errors**. **Errors** must be fixed in order to certify. Resolving **warnings** is not required to certify, but you should try to resolve them.
@z

@x
If you are publishing and certifying multiple versions of a Docker logging plugin, you will need to run the `inspectDockerLoggingPlugin` tool on each Docker logging plugin and send each result to Docker Hub.
@y
If you are publishing and certifying multiple versions of a Docker logging plugin, you will need to run the `inspectDockerLoggingPlugin` tool on each Docker logging plugin and send each result to Docker Hub.
@z

@x
The syntax for running a specific logging plugin is `docker container run --log-driver`.
@y
The syntax for running a specific logging plugin is `docker container run --log-driver`.
@z

@x
No parameters are passed to the logging plugin. If parameters are required for the Docker logging plugin to work correctly, then a custom test script must be written and used. The default `docker container run` command is:
@y
No parameters are passed to the logging plugin. If parameters are required for the Docker logging plugin to work correctly, then a custom test script must be written and used. The default `docker container run` command is:
@z

@x
  ```
  docker container run -it --log-driver xxxxxxxxxxxxxxxxxxxxx \
  --volume \"$(pwd)/quotes.txt:/quotes.txt\" alpine:latest \
  sh -c 'cat /quotes.txt;sleep 20
  ```
@y
  ```
  docker container run -it --log-driver xxxxxxxxxxxxxxxxxxxxx \
  --volume \"$(pwd)/quotes.txt:/quotes.txt\" alpine:latest \
  sh -c 'cat /quotes.txt;sleep 20
  ```
@z

@x
The custom script must log the contents of the `quotes.txt` file. It should also cleanup (remove the container and docker image). Refer to the `--test-script` command argument in the command help.
@y
The custom script must log the contents of the `quotes.txt` file. It should also cleanup (remove the container and docker image). Refer to the `--test-script` command argument in the command help.
@z

@x
### Docker container logs
@y
### Docker container logs
@z

@x
Best practices require Docker logging plugins to support the [ReadLogs API](/engine/extend/plugins_logging/#logdriverreadlogs) so that the logs can be retrieved with the `docker container logs` command. If the `ReadLogs` API is not supported, a custom script is needed to retrieve the logs and print them to `stdout`. Refer to the `--get-logs-script` command argument in the command help.
@y
Best practices require Docker logging plugins to support the [ReadLogs API](/engine/extend/plugins_logging/#logdriverreadlogs) so that the logs can be retrieved with the `docker container logs` command. If the `ReadLogs` API is not supported, a custom script is needed to retrieve the logs and print them to `stdout`. Refer to the `--get-logs-script` command argument in the command help.
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
- git client
- inspectDockerLoggingPlugin tool
@y
- Docker Engine - Enterprise (on the server for verifying submissions)
- git client
- inspectDockerLoggingPlugin tool
@z

@x
### Set up testing environment
@y
### Set up testing environment
@z

@x
There are two steps: (1) configure credentials, and (2) configure endpoints.
@y
There are two steps: (1) configure credentials, and (2) configure endpoints.
@z

@x
1.  Configure your Docker Registry credentials by either _defining environment variables_ **or** _passing them as arguments_ to `inspectDockerLoggingPlugin`.
@y
1.  Configure your Docker Registry credentials by either _defining environment variables_ **or** _passing them as arguments_ to `inspectDockerLoggingPlugin`.
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
    b.  Pass arguments to `inspectDockerLoggingPlugin` (or be prompted for them):
@y
    b.  Pass arguments to `inspectDockerLoggingPlugin` (or be prompted for them):
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
2.  Configure endpoints (and override default values) by either _defining environment variables_ **or** _passing them as arguments_ to `inspectDockerLoggingPlugin`.
@y
2.  Configure endpoints (and override default values) by either _defining environment variables_ **or** _passing them as arguments_ to `inspectDockerLoggingPlugin`.
@z

@x
    By default, `inspectDockerLoggingPlugin` uses these two endpoints to communicate with the Docker Hub Registry:
@y
    By default, `inspectDockerLoggingPlugin` uses these two endpoints to communicate with the Docker Hub Registry:
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
    b.  Pass your endpoints as arguments to `inspectDockerLoggingPlugin`:
@y
    b.  Pass your endpoints as arguments to `inspectDockerLoggingPlugin`:
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
* If more details are needed for debugging problems communicating to the Docker Registry, the following environment variable can be exported which will generate detailed debugging output to a file named `./dockerAPI.go.log` in the directory where the command is run from.
@y
* If more details are needed for debugging problems communicating to the Docker Registry, the following environment variable can be exported which will generate detailed debugging output to a file named `./dockerAPI.go.log` in the directory where the command is run from.
@z

@x
    * Linux or MacOS
@y
    * Linux or MacOS
@z

@x
        ```bash
        export DOCKER_REGISTRY_API_DEBUG="true"
        ```
@y
        ```bash
        export DOCKER_REGISTRY_API_DEBUG="true"
        ```
@z

@x
    * Windows  
@y
    * Windows  
@z

@x
        * Windows command prompt
@y
        * Windows command prompt
@z

@x
          ```bash
          set DOCKER_REGISTRY_API_DEBUG="true"
          ```
@y
          ```bash
          set DOCKER_REGISTRY_API_DEBUG="true"
          ```
@z

@x
        * Windows powershell
@y
        * Windows powershell
@z

@x
          ```bash
          $env:DOCKER_REGISTRY_API_DEBUG="true"
          ```        
@y
          ```bash
          $env:DOCKER_REGISTRY_API_DEBUG="true"
          ```        
@z

@x
### Syntax
@y
### Syntax
@z

@x
1.  Download `inspectDockerLoggingPlugin` command.
@y
1.  Download `inspectDockerLoggingPlugin` command.
@z

@x
    | OS/Architecture | Download Link |
    |-----------------|------------------|
    | Windows/X86  | [https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/inspectDockerLoggingPlugin.exe](https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/inspectDockerLoggingPlugin.exe) |
    | Linux/X86 | [https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/inspectDockerLoggingPlugin](https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/inspectDockerLoggingPlugin) |
    | Linux/IBMZ | [https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/inspectDockerLoggingPlugin](https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/inspectDockerLoggingPlugin) |
    | Linux/IBMPOWER | [https://s3.amazonaws.com/store-logos-us-east-1/certification/power/inspectDockerLoggingPlugin](https://s3.amazonaws.com/store-logos-us-east-1/certification/power/inspectDockerLoggingPlugin) |
@y
    | OS/Architecture | Download Link |
    |-----------------|------------------|
    | Windows/X86  | [https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/inspectDockerLoggingPlugin.exe](https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/inspectDockerLoggingPlugin.exe) |
    | Linux/X86 | [https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/inspectDockerLoggingPlugin](https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/inspectDockerLoggingPlugin) |
    | Linux/IBMZ | [https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/inspectDockerLoggingPlugin](https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/inspectDockerLoggingPlugin) |
    | Linux/IBMPOWER | [https://s3.amazonaws.com/store-logos-us-east-1/certification/power/inspectDockerLoggingPlugin](https://s3.amazonaws.com/store-logos-us-east-1/certification/power/inspectDockerLoggingPlugin) |
@z

@x
2.  Set permissions on `inspectDockerLoggingPlugin` for linux, zlinux and power so that it is executable:
@y
2.  Set permissions on `inspectDockerLoggingPlugin` for linux, zlinux and power so that it is executable:
@z

@x
    ```
    chmod u+x inspectDockerLoggingPlugin
    ```
@y
    ```
    chmod u+x inspectDockerLoggingPlugin
    ```
@z

@x
3. Download `http_api_endpoint` command
@y
3. Download `http_api_endpoint` command
@z

@x
    | OS/Architecture | Download Link |
    |-----------------|------------------|
    | Windows/X86  | [https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/http_api_endpoint.exe](https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/http_api_endpoint.exe) |
    | Linux/X86 | [https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/http_api_endpoint](https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/http_api_endpoint) |
    | Linux/IBMZ | [https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/http_api_endpoint](https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/http_api_endpoint) |
    | Linux/IBMPOWER | [https://s3.amazonaws.com/store-logos-us-east-1/certification/power/http_api_endpoint](https://s3.amazonaws.com/store-logos-us-east-1/certification/power/http_api_endpoint) |
@y
    | OS/Architecture | Download Link |
    |-----------------|------------------|
    | Windows/X86  | [https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/http_api_endpoint.exe](https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/http_api_endpoint.exe) |
    | Linux/X86 | [https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/http_api_endpoint](https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/http_api_endpoint) |
    | Linux/IBMZ | [https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/http_api_endpoint](https://s3.amazonaws.com/store-logos-us-east-1/certification/zlinux/http_api_endpoint) |
    | Linux/IBMPOWER | [https://s3.amazonaws.com/store-logos-us-east-1/certification/power/http_api_endpoint](https://s3.amazonaws.com/store-logos-us-east-1/certification/power/http_api_endpoint) |
@z

@x
4.  Set permissions on `http_api_endpoint` for linux, zlinux and power so that it is executable:
@y
4.  Set permissions on `http_api_endpoint` for linux, zlinux and power so that it is executable:
@z

@x
    ```
    chmod u+x http_api_endpoint
    ```
@y
    ```
    chmod u+x http_api_endpoint
    ```
@z

@x
5.  Download [`quotes.txt`](https://s3.amazonaws.com/store-logos-us-east-1/certification/quotes.txt) and put it in the same directory.
@y
5.  Download [`quotes.txt`](https://s3.amazonaws.com/store-logos-us-east-1/certification/quotes.txt) and put it in the same directory.
@z

@x
6.  Get the product ID from the plan page you'd like to reference for the certification test. Make sure the checkbox is checked and the plan is saved first.
@y
6.  Get the product ID from the plan page you'd like to reference for the certification test. Make sure the checkbox is checked and the plan is saved first.
@z

@x
    ![product ID](images/store-product-id.png)
@y
    ![product ID](images/store-product-id.png)
@z

@x
    ```none
    Inspects a Docker logging plugin to see if it conforms to best practices.
@y
    ```none
    Inspects a Docker logging plugin to see if it conforms to best practices.
@z

@x
    Syntax: inspectDockerLoggingPlugin [options] dockerLoggingPlugin
@y
    Syntax: inspectDockerLoggingPlugin [options] dockerLoggingPlugin
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
      -get-logs-script string
        	 An optional custom script used to retrieve the logs.
      -insecure-skip-verify
           Optional. Specifies to disable SSL verification for an insecure private Docker Registry.         
      -help
        	 Help on the command.
      -html
        	 Generate HTML output.
      -json
        	 Generate JSON output.
      -product-id string
        	 Optional Product identifier from Docker Hub for this plugin. Please include it when you want the output sent to Docker Hub for certification.
      -test-script string
        	 An optional custom script used to test the Docker logging plugin. The script gets passed 1 parameter - the Docker logging plugin name.
      -verbose
        	 Displays more verbose output.
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
      -get-logs-script string
        	 An optional custom script used to retrieve the logs.
      -insecure-skip-verify
           Optional. Specifies to disable SSL verification for an insecure private Docker Registry.         
      -help
        	 Help on the command.
      -html
        	 Generate HTML output.
      -json
        	 Generate JSON output.
      -product-id string
        	 Optional Product identifier from Docker Hub for this plugin. Please include it when you want the output sent to Docker Hub for certification.
      -test-script string
        	 An optional custom script used to test the Docker logging plugin. The script gets passed 1 parameter - the Docker logging plugin name.
      -verbose
        	 Displays more verbose output.
@z

@x
    dockerLoggingPlugin
  	The Docker logging plugin to inspect. This argument is required.
    ```
@y
    dockerLoggingPlugin
  	The Docker logging plugin to inspect. This argument is required.
    ```
@z

@x
## Inspection Output
@y
## Inspection Output
@z

@x
By default, `inspectDockerLoggingPlugin` displays output locally to `stdout` (the default), JSON, and HTML. You can also upload output to Docker Hub, which is recommended for admnistrator verification.
@y
By default, `inspectDockerLoggingPlugin` displays output locally to `stdout` (the default), JSON, and HTML. You can also upload output to Docker Hub, which is recommended for admnistrator verification.
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
## Inspection Examples
@y
## Inspection Examples
@z

@x
* [Inspect a Docker logging plugin with messages sent to stdout](#inspect-logging-plugin-stdout)
* [Inspect a Docker logging plugin with JSON output](#inspect-logging-plugin-json)
* [Inspect a Docker logging plugin with HTML output](#inspect-logging-plugin-html)
* [Send data to API endpoint on external server](#send-data-to-api-endpoint-on-external-server)
@y
* [Inspect a Docker logging plugin with messages sent to stdout](#inspect-logging-plugin-stdout)
* [Inspect a Docker logging plugin with JSON output](#inspect-logging-plugin-json)
* [Inspect a Docker logging plugin with HTML output](#inspect-logging-plugin-html)
* [Send data to API endpoint on external server](#send-data-to-api-endpoint-on-external-server)
@z

@x
<a name="inspect-logging-plugin-stdout">
@y
<a name="inspect-logging-plugin-stdout">
@z

@x
### Inspect a Docker logging plugin with messages sent to stdout
@y
### Inspect a Docker logging plugin with messages sent to stdout
@z

@x
#### To inspect the Docker logging plugin "gforghetti/docker-log-driver-test:latest", and upload the result to Docker Hub (leave out the `-product-id` parameter if you are just testing):
@y
#### To inspect the Docker logging plugin "gforghetti/docker-log-driver-test:latest", and upload the result to Docker Hub (leave out the `-product-id` parameter if you are just testing):
@z

@x
```console
$ ./inspectDockerLoggingPlugin -product-id=<store-product-id> gforghetti/docker-log-driver-test:latest
```
@y
```console
$ ./inspectDockerLoggingPlugin -product-id=<store-product-id> gforghetti/docker-log-driver-test:latest
```
@z

@x
#### Output:
@y
#### Output:
@z

@x
```
**************************************************************************************************************************************************************************************************
* Docker Logging Plugin: gforghetti/docker-log-driver-test:latest
**************************************************************************************************************************************************************************************************
@y
```
**************************************************************************************************************************************************************************************************
* Docker Logging Plugin: gforghetti/docker-log-driver-test:latest
**************************************************************************************************************************************************************************************************
@z

@x
**************************************************************************************************************************************************************************************************
* Step #1 Inspecting the Docker Logging Plugin: gforghetti/docker-log-driver-test:latest ...
**************************************************************************************************************************************************************************************************
Passed:   Docker Logging Plugin image gforghetti/docker-log-driver-test:latest has been inspected.
@y
**************************************************************************************************************************************************************************************************
* Step #1 Inspecting the Docker Logging Plugin: gforghetti/docker-log-driver-test:latest ...
**************************************************************************************************************************************************************************************************
Passed:   Docker Logging Plugin image gforghetti/docker-log-driver-test:latest has been inspected.
@z

@x
**************************************************************************************************************************************************************************************************
* Step #2 Docker Logging Plugin information
**************************************************************************************************************************************************************************************************
+-------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Docker Logging Plugin:  | gforghetti/docker-log-driver-test:latest                                                                                                                             |
| Description:            | jsonfilelog as plugin                                                                                                                                                |
| Documentation:          | -                                                                                                                                                                    |
| Digest:                 | sha256:1cdd79202a7a9f9a53524e904d9f89ed0a6bf6673717bc955ef55744f0826d4c                                                                                              |
| Base layer digest:      | sha256:fda008d4a2b0d2c0a9d2e5dc952aefb0188f7a9c96c04e159662fd56b507c174                                                                                              |
| Docker version:         | 17.12.0-ce                                                                                                                                                           |
| Interface Socket:       | jsonfile.sock                                                                                                                                                        |
| Interface Socket Types: | docker.logdriver/1.0                                                                                                                                                 |
| IpcHost:                | false                                                                                                                                                                |
| PidHost:                | false                                                                                                                                                                |
| Entrypoint:             | /usr/bin/docker-log-driver                                                                                                                                           |
| WorkDir:                |                                                                                                                                                                      |
| User:                   |                                                                                                                                                                      |
+-------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
@y
**************************************************************************************************************************************************************************************************
* Step #2 Docker Logging Plugin information
**************************************************************************************************************************************************************************************************
+-------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Docker Logging Plugin:  | gforghetti/docker-log-driver-test:latest                                                                                                                             |
| Description:            | jsonfilelog as plugin                                                                                                                                                |
| Documentation:          | -                                                                                                                                                                    |
| Digest:                 | sha256:1cdd79202a7a9f9a53524e904d9f89ed0a6bf6673717bc955ef55744f0826d4c                                                                                              |
| Base layer digest:      | sha256:fda008d4a2b0d2c0a9d2e5dc952aefb0188f7a9c96c04e159662fd56b507c174                                                                                              |
| Docker version:         | 17.12.0-ce                                                                                                                                                           |
| Interface Socket:       | jsonfile.sock                                                                                                                                                        |
| Interface Socket Types: | docker.logdriver/1.0                                                                                                                                                 |
| IpcHost:                | false                                                                                                                                                                |
| PidHost:                | false                                                                                                                                                                |
| Entrypoint:             | /usr/bin/docker-log-driver                                                                                                                                           |
| WorkDir:                |                                                                                                                                                                      |
| User:                   |                                                                                                                                                                      |
+-------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
@z

@x
Warning:  Docker logging plugin was not built using Docker Enterprise Edition!
@y
Warning:  Docker logging plugin was not built using Docker Enterprise Edition!
@z

@x
**************************************************************************************************************************************************************************************************
* Step #3 Installing the Docker logging plugin gforghetti/docker-log-driver-test:latest ...
**************************************************************************************************************************************************************************************************
Passed:   Docker logging plugin gforghetti/docker-log-driver-test:latest has been installed successfully.
@y
**************************************************************************************************************************************************************************************************
* Step #3 Installing the Docker logging plugin gforghetti/docker-log-driver-test:latest ...
**************************************************************************************************************************************************************************************************
Passed:   Docker logging plugin gforghetti/docker-log-driver-test:latest has been installed successfully.
@z

@x
**************************************************************************************************************************************************************************************************
* Step #4 Testing the Docker logging plugin: gforghetti/docker-log-driver-test:latest ...
**************************************************************************************************************************************************************************************************
Starting a Docker container to test the docker logging plugin gforghetti/docker-log-driver-test:latest
@y
**************************************************************************************************************************************************************************************************
* Step #4 Testing the Docker logging plugin: gforghetti/docker-log-driver-test:latest ...
**************************************************************************************************************************************************************************************************
Starting a Docker container to test the docker logging plugin gforghetti/docker-log-driver-test:latest
@z

@x
**************************************************************************************************************************************************************************************************
* Step #5 Retrieving the Docker Logs ...
**************************************************************************************************************************************************************************************************
Retrieving the Docker logs using the "docker container logs 4dc3e699dbf3d050a5b582a245c9a4718bb0300d7d55380887c74741d09bd730" command
@y
**************************************************************************************************************************************************************************************************
* Step #5 Retrieving the Docker Logs ...
**************************************************************************************************************************************************************************************************
Retrieving the Docker logs using the "docker container logs 4dc3e699dbf3d050a5b582a245c9a4718bb0300d7d55380887c74741d09bd730" command
@z

@x
**************************************************************************************************************************************************************************************************
* Step #6 Verifying that the contents retrieved matches what was sent to the Docker Logging plugin.
**************************************************************************************************************************************************************************************************
Passed:   Docker Logging Plugin Test was successful.
@y
**************************************************************************************************************************************************************************************************
* Step #6 Verifying that the contents retrieved matches what was sent to the Docker Logging plugin.
**************************************************************************************************************************************************************************************************
Passed:   Docker Logging Plugin Test was successful.
@z

@x
**************************************************************************************************************************************************************************************************
* Step #7 Removing the Docker container and any associated volumes.
**************************************************************************************************************************************************************************************************
Passed:   Docker container and any associated volumes removed.
@y
**************************************************************************************************************************************************************************************************
* Step #7 Removing the Docker container and any associated volumes.
**************************************************************************************************************************************************************************************************
Passed:   Docker container and any associated volumes removed.
@z

@x
**************************************************************************************************************************************************************************************************
* Step #8 Removing the Docker logging plugin
**************************************************************************************************************************************************************************************************
Passed:   Docker logging plugin gforghetti/docker-log-driver-test:latest was removed.
Passed:   This test was performed on Docker Enterprise Edition.
@y
**************************************************************************************************************************************************************************************************
* Step #8 Removing the Docker logging plugin
**************************************************************************************************************************************************************************************************
Passed:   Docker logging plugin gforghetti/docker-log-driver-test:latest was removed.
Passed:   This test was performed on Docker Enterprise Edition.
@z

@x
**************************************************************************************************************************************************************************************************
* Summary of the inspection for the Docker Logging Plugin: gforghetti/docker-log-driver-test:latest
**************************************************************************************************************************************************************************************************
@y
**************************************************************************************************************************************************************************************************
* Summary of the inspection for the Docker Logging Plugin: gforghetti/docker-log-driver-test:latest
**************************************************************************************************************************************************************************************************
@z

@x
Report Date: Mon May 21 14:40:41 2018
Operating System: Operating System: Ubuntu 16.04.4 LTS
Architecture: amd64
Docker Client Version: 17.06.2-ee-11
Docker Server Version: 17.06.2-ee-11
@y
Report Date: Mon May 21 14:40:41 2018
Operating System: Operating System: Ubuntu 16.04.4 LTS
Architecture: amd64
Docker Client Version: 17.06.2-ee-11
Docker Server Version: 17.06.2-ee-11
@z

@x
There were 1 warnings detected!
@y
There were 1 warnings detected!
@z

@x
Passed:   Docker Logging Plugin image gforghetti/docker-log-driver-test:latest has been inspected.
Warning:  Docker logging plugin was not built using Docker Enterprise Edition!
Passed:   Docker logging plugin gforghetti/docker-log-driver-test:latest has been installed successfully.
Passed:   Docker Logging Plugin Test was successful.
Passed:   Docker container and any associated volumes removed.
Passed:   Docker logging plugin gforghetti/docker-log-driver-test:latest was removed.
Passed:   This test was performed on Docker Enterprise Edition.
@y
Passed:   Docker Logging Plugin image gforghetti/docker-log-driver-test:latest has been inspected.
Warning:  Docker logging plugin was not built using Docker Enterprise Edition!
Passed:   Docker logging plugin gforghetti/docker-log-driver-test:latest has been installed successfully.
Passed:   Docker Logging Plugin Test was successful.
Passed:   Docker container and any associated volumes removed.
Passed:   Docker logging plugin gforghetti/docker-log-driver-test:latest was removed.
Passed:   This test was performed on Docker Enterprise Edition.
@z

@x
The inspection of the Docker logging plugin gforghetti/docker-log-driver-test:latest has completed.
@y
The inspection of the Docker logging plugin gforghetti/docker-log-driver-test:latest has completed.
@z

@x
If -product-id is specified on command line:
**************************************************************************************************************************************************************************************************
* Step #9 Upload the test result to Docker Hub.
**************************************************************************************************************************************************************************************************
Passed:   The test results are uploaded to Docker Hub.
@y
If -product-id is specified on command line:
**************************************************************************************************************************************************************************************************
* Step #9 Upload the test result to Docker Hub.
**************************************************************************************************************************************************************************************************
Passed:   The test results are uploaded to Docker Hub.
@z

@x
gforghetti:~/$
```
@y
gforghetti:~/$
```
@z

@x
<a name="inspect-logging-plugin-json">
@y
<a name="inspect-logging-plugin-json">
@z

@x
### Inspect a Docker logging plugin with JSON Output
@y
### Inspect a Docker logging plugin with JSON Output
@z

@x
#### To inspect the  Docker logging plugin `gforghetti/docker-log-driver-test:latest` with JSON Output:
@y
#### To inspect the  Docker logging plugin `gforghetti/docker-log-driver-test:latest` with JSON Output:
@z

@x
```console
$ ./inspectDockerLoggingPlugin --json gforghetti/docker-log-driver-test:latest | jq
```
@y
```console
$ ./inspectDockerLoggingPlugin --json gforghetti/docker-log-driver-test:latest | jq
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
  "Date": "Mon May 21 14:38:28 2018",
  "SystemOperatingSystem": "Operating System: Ubuntu 16.04.4 LTS",
  "SystemArchitecture": "amd64",
  "SystemDockerClientVersion": "17.06.2-ee-11",
  "SystemDockerServerVersion": "17.06.2-ee-11",
  "DockerLogginPlugin": "gforghetti/docker-log-driver-test:latest",
  "Description": "jsonfilelog as plugin",
  "Documentation": "-",
  "DockerLoggingPluginDigest": "sha256:1cdd79202a7a9f9a53524e904d9f89ed0a6bf6673717bc955ef55744f0826d4c",
  "BaseLayerImageDigest": "sha256:fda008d4a2b0d2c0a9d2e5dc952aefb0188f7a9c96c04e159662fd56b507c174",
  "DockerVersion": "17.12.0-ce",
  "Entrypoint": "/usr/bin/docker-log-driver",
  "InterfaceSocket": "jsonfile.sock",
  "InterfaceSocketTypes": "docker.logdriver/1.0",
  "WorkDir": "",
  "User": "",
  "IpcHost": false,
  "PidHost": false,
  "Errors": 0,
  "Warnings": 1,
  "HTMLReportFile": "",
  "VulnerabilitiesScanURL": "",
  "Results": [
    {
      "Status": "Passed",
      "Message": "Docker Logging Plugin image gforghetti/docker-log-driver-test:latest has been inspected."
    },
    {
      "Status": "Warning",
      "Message": "Docker logging plugin was not built using Docker Enterprise Edition!"
    },
    {
      "Status": "Passed",
      "Message": "Docker logging plugin gforghetti/docker-log-driver-test:latest has been installed successfully."
    },
    {
      "Status": "Passed",
      "Message": "Docker Logging Plugin Test was successful."
    },
    {
      "Status": "Passed",
      "Message": "Docker container and any associated volumes removed."
    },
    {
      "Status": "Passed",
      "Message": "Docker logging plugin gforghetti/docker-log-driver-test:latest was removed."
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
  "Date": "Mon May 21 14:38:28 2018",
  "SystemOperatingSystem": "Operating System: Ubuntu 16.04.4 LTS",
  "SystemArchitecture": "amd64",
  "SystemDockerClientVersion": "17.06.2-ee-11",
  "SystemDockerServerVersion": "17.06.2-ee-11",
  "DockerLogginPlugin": "gforghetti/docker-log-driver-test:latest",
  "Description": "jsonfilelog as plugin",
  "Documentation": "-",
  "DockerLoggingPluginDigest": "sha256:1cdd79202a7a9f9a53524e904d9f89ed0a6bf6673717bc955ef55744f0826d4c",
  "BaseLayerImageDigest": "sha256:fda008d4a2b0d2c0a9d2e5dc952aefb0188f7a9c96c04e159662fd56b507c174",
  "DockerVersion": "17.12.0-ce",
  "Entrypoint": "/usr/bin/docker-log-driver",
  "InterfaceSocket": "jsonfile.sock",
  "InterfaceSocketTypes": "docker.logdriver/1.0",
  "WorkDir": "",
  "User": "",
  "IpcHost": false,
  "PidHost": false,
  "Errors": 0,
  "Warnings": 1,
  "HTMLReportFile": "",
  "VulnerabilitiesScanURL": "",
  "Results": [
    {
      "Status": "Passed",
      "Message": "Docker Logging Plugin image gforghetti/docker-log-driver-test:latest has been inspected."
    },
    {
      "Status": "Warning",
      "Message": "Docker logging plugin was not built using Docker Enterprise Edition!"
    },
    {
      "Status": "Passed",
      "Message": "Docker logging plugin gforghetti/docker-log-driver-test:latest has been installed successfully."
    },
    {
      "Status": "Passed",
      "Message": "Docker Logging Plugin Test was successful."
    },
    {
      "Status": "Passed",
      "Message": "Docker container and any associated volumes removed."
    },
    {
      "Status": "Passed",
      "Message": "Docker logging plugin gforghetti/docker-log-driver-test:latest was removed."
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
<a name="inspect-logging-plugin-html">
@y
<a name="inspect-logging-plugin-html">
@z

@x
### Inspect a Docker logging plugin with HTML output
@y
### Inspect a Docker logging plugin with HTML output
@z

@x
#### To inspect the  Docker logging plugin `gforghetti/docker-log-driver-test:latest` with HTML output:
@y
#### To inspect the  Docker logging plugin `gforghetti/docker-log-driver-test:latest` with HTML output:
@z

@x
```console
$ ./inspectDockerLoggingPlugin --html gforghetti/docker-log-driver-test:latest
```
@y
```console
$ ./inspectDockerLoggingPlugin --html gforghetti/docker-log-driver-test:latest
```
@z

@x
#### Output:
@y
#### Output:
@z

@x
Note: The majority of the stdout message output has been intentionally omitted below.
@y
Note: The majority of the stdout message output has been intentionally omitted below.
@z

@x
```
The inspection of the Docker logging plugin cpuguy83/docker-logdriver-test:latest has completed.
An HTML report has been generated in the file cpuguy83-docker-logdriver-test-latest_inspection_report.html
```
@y
```
The inspection of the Docker logging plugin cpuguy83/docker-logdriver-test:latest has completed.
An HTML report has been generated in the file cpuguy83-docker-logdriver-test-latest_inspection_report.html
```
@z

@x
![HTML Output Image](images/gforghetti-log-driver-latest_inspection_report.html.png)
@y
![HTML Output Image](images/gforghetti-log-driver-latest_inspection_report.html.png)
@z

@x
<a name="send-to-http-api-endpoint">
@y
<a name="send-to-http-api-endpoint">
@z

@x
### Send data to API endpoint on external server
@y
### Send data to API endpoint on external server
@z

@x
#### Introduction
@y
#### Introduction
@z

@x
The **http_api_endpoint** is an HTTP Server that can be used to test docker logging plugins that do not support the read log api and instead send data to an API Endpoint running on an external server.
The [Sumo Logic Logging Plugin](https://hub.docker.com/plugins/sumologic-logging-plugin) is one example.
@y
The **http_api_endpoint** is an HTTP Server that can be used to test docker logging plugins that do not support the read log api and instead send data to an API Endpoint running on an external server.
The [Sumo Logic Logging Plugin](https://hub.docker.com/plugins/sumologic-logging-plugin) is one example.
@z

@x
You can configure those docker logging plugins to send their logging data to the **http_api_endpoint** HTTP Server for testing the plugin and then code a script to retrieve the logs using a curl command.
@y
You can configure those docker logging plugins to send their logging data to the **http_api_endpoint** HTTP Server for testing the plugin and then code a script to retrieve the logs using a curl command.
@z

@x
#### Download
@y
#### Download
@z

@x
* [Linux/X86](https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/http_api_endpoint)
* [Windows/X86](https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/http_api_endpoint.exe)
@y
* [Linux/X86](https://s3.amazonaws.com/store-logos-us-east-1/certification/linux/http_api_endpoint)
* [Windows/X86](https://s3.amazonaws.com/store-logos-us-east-1/certification/windows/http_api_endpoint.exe)
@z

@x
#### Syntax
@y
#### Syntax
@z

@x
```
./http_api_endpoint [options]
```
@y
```
./http_api_endpoint [options]
```
@z

@x
Options:
@y
Options:
@z

@x
 * **--port**    (The port for the **http_api_endpoint** HTTP Server to listen on. Defaults to port 80)
 * **--debug**   (write debugging information)
 * **--help**    (display the command help)
@y
 * **--port**    (The port for the **http_api_endpoint** HTTP Server to listen on. Defaults to port 80)
 * **--debug**   (write debugging information)
 * **--help**    (display the command help)
@z

@x
#### Using and testing the **http_api_endpoint** HTTP Server
@y
#### Using and testing the **http_api_endpoint** HTTP Server
@z

@x
The **curl** command can be used to test and use the **http_api_endpoint** HTTP Server.
@y
The **curl** command can be used to test and use the **http_api_endpoint** HTTP Server.
@z

@x
* Issue the following curl command to send new data to the **http_api_endpoint**:
@y
* Issue the following curl command to send new data to the **http_api_endpoint**:
@z

@x
  ```
  # DATA='Hello World!'
  # curl -s -X POST -d "${DATA}" http://127.0.0.1:80
  ```
@y
  ```
  # DATA='Hello World!'
  # curl -s -X POST -d "${DATA}" http://127.0.0.1:80
  ```
@z

@x
  Note: if any data was previously sent, it will be replaced.
@y
  Note: if any data was previously sent, it will be replaced.
@z

@x
* Issue the following curl command to send data to the **http_api_endpoint** and append that data to the already collected data:
@y
* Issue the following curl command to send data to the **http_api_endpoint** and append that data to the already collected data:
@z

@x
  ```
  # DATA='Hello World!'
  # curl -s -X POST -d "${DATA}" http://127.0.0.1:80
  ```
@y
  ```
  # DATA='Hello World!'
  # curl -s -X POST -d "${DATA}" http://127.0.0.1:80
  ```
@z

@x
* Issue the following curl command to retrieve the data from the http_api_endpoint:
@y
* Issue the following curl command to retrieve the data from the http_api_endpoint:
@z

@x
  ```
  # curl -s -X GET http://127.0.0.1:80
  ```
  ```
  Hello World!
  ```
@y
  ```
  # curl -s -X GET http://127.0.0.1:80
  ```
  ```
  Hello World!
  ```
@z

@x
* Issue the following curl command to erase any data currently collected by the http_api_endpoint:
@y
* Issue the following curl command to erase any data currently collected by the http_api_endpoint:
@z

@x
  ```
  # curl -s -X DELETE http://127.0.0.1:80
  ```
@y
  ```
  # curl -s -X DELETE http://127.0.0.1:80
  ```
@z

@x
* To Terminate:
@y
* To Terminate:
@z

@x
  ```
  # curl -s http://127.0.0.1:80/EXIT
  ```
@y
  ```
  # curl -s http://127.0.0.1:80/EXIT
  ```
@z

@x
#### Example of using the http_api_endpoint HTTP Server for a Logging Plugin
@y
#### Example of using the http_api_endpoint HTTP Server for a Logging Plugin
@z

@x
##### Script to run a container to test the Logging Plugin
@y
##### Script to run a container to test the Logging Plugin
@z

@x
```console
$ cat test_new_plugin.sh
```
@y
```console
$ cat test_new_plugin.sh
```
@z

@x
```bash
#!/usr/bin/env bash
@y
```bash
#!/usr/bin/env bash
@z

@x
#######################################################################################################################################
# This bash script tests a Docker logging plugin that does not support the read log api and instead sends data to an API Endpoint running on an external server.
#
#######################################################################################################################################
# Docker Inc.
#######################################################################################################################################
@y
#######################################################################################################################################
# This bash script tests a Docker logging plugin that does not support the read log api and instead sends data to an API Endpoint running on an external server.
#
#######################################################################################################################################
# Docker Inc.
#######################################################################################################################################
@z

@x
#######################################################################################################################################
# Make sure the Docker logging plugin was specified on the command line
#######################################################################################################################################
DOCKER_LOGGING_PLUGIN=$1
if [[ -z $DOCKER_LOGGING_PLUGIN ]]; then
    printf 'You must specify the Docker Loggin Plugin!\n'
    exit 1
fi
@y
#######################################################################################################################################
# Make sure the Docker logging plugin was specified on the command line
#######################################################################################################################################
DOCKER_LOGGING_PLUGIN=$1
if [[ -z $DOCKER_LOGGING_PLUGIN ]]; then
    printf 'You must specify the Docker Loggin Plugin!\n'
    exit 1
fi
@z

@x
HTTP_API_ENDPOINT='http://localhost:80'
@y
HTTP_API_ENDPOINT='http://localhost:80'
@z

@x
#######################################################################################################################################
# Check to make sure the http_api_endpoint HTTP Server is running
#######################################################################################################################################
curl -s -X POST "${HTTP_API_ENDPOINT}"
if [[ $? -ne 0 ]]; then
    printf 'Unable to connect to the HTTP API Endpoint: '"${HTTP_API_ENDPOINT}"'!\n'
    exit 1
fi
@y
#######################################################################################################################################
# Check to make sure the http_api_endpoint HTTP Server is running
#######################################################################################################################################
curl -s -X POST "${HTTP_API_ENDPOINT}"
if [[ $? -ne 0 ]]; then
    printf 'Unable to connect to the HTTP API Endpoint: '"${HTTP_API_ENDPOINT}"'!\n'
    exit 1
fi
@z

@x
#######################################################################################################################################
# Run an alpine container with the plugin and send data to it
#######################################################################################################################################
docker container run \
--rm \
--log-driver="${DOCKER_LOGGING_PLUGIN}" \
--log-opt sumo-url="${HTTP_API_ENDPOINT}" \
--log-opt sum-sending-interval=5s \
--log-opt sumo-compress=false \
--volume $(pwd)/quotes.txt:/quotes.txt \
alpine:latest \
sh -c 'cat /quotes.txt;sleep 10'
@y
#######################################################################################################################################
# Run an alpine container with the plugin and send data to it
#######################################################################################################################################
docker container run \
--rm \
--log-driver="${DOCKER_LOGGING_PLUGIN}" \
--log-opt sumo-url="${HTTP_API_ENDPOINT}" \
--log-opt sum-sending-interval=5s \
--log-opt sumo-compress=false \
--volume $(pwd)/quotes.txt:/quotes.txt \
alpine:latest \
sh -c 'cat /quotes.txt;sleep 10'
@z

@x
exit $?
```
@y
exit $?
```
@z

@x
##### Script to retrieve the logging data from the http_api_endpoint HTTP Server
@y
##### Script to retrieve the logging data from the http_api_endpoint HTTP Server
@z

@x
```console
$ cat get_plugin_logs.sh
```
@y
```console
$ cat get_plugin_logs.sh
```
@z

@x
```bash
#!/usr/bin/env sh
@y
```bash
#!/usr/bin/env sh
@z

@x
#######################################################################################################################################
# This bash script retrieves any data logged to the http_api_endpoint HTTP Server.
#######################################################################################################################################
# Docker Inc.
#######################################################################################################################################
@y
#######################################################################################################################################
# This bash script retrieves any data logged to the http_api_endpoint HTTP Server.
#######################################################################################################################################
# Docker Inc.
#######################################################################################################################################
@z

@x
curl -s -X GET http://127.0.0.1:80
@y
curl -s -X GET http://127.0.0.1:80
@z

@x
```
@y
```
@z

@x
##### To test the Docker logging plugin
@y
##### To test the Docker logging plugin
@z

@x
```console
$ ./inspectDockerLoggingPlugin --verbose --html --test-script ./test_plugin.sh --get-logs-script ./get_plugin_logs.sh myNamespace/docker-logging-driver:1.0.2
```
@y
```console
$ ./inspectDockerLoggingPlugin --verbose --html --test-script ./test_plugin.sh --get-logs-script ./get_plugin_logs.sh myNamespace/docker-logging-driver:1.0.2
```
@z
