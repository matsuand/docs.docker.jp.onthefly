%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Describes how to use the json-file logging driver.
keywords: json-file, docker, logging, driver
redirect_from:
- /engine/reference/logging/json-file/
- /engine/admin/logging/json-file/
title: JSON File logging driver
---
@y
---
description: Describes how to use the json-file logging driver.
keywords: json-file, docker, logging, driver
redirect_from:
- /engine/reference/logging/json-file/
- /engine/admin/logging/json-file/
title: JSON File logging driver
---
@z

@x
By default, Docker captures the standard output (and standard error) of all your containers,
and writes them in files using the JSON format. The JSON format annotates each line with its
origin (`stdout` or `stderr`) and its timestamp. Each log file contains information about
only one container.
@y
By default, Docker captures the standard output (and standard error) of all your containers,
and writes them in files using the JSON format. The JSON format annotates each line with its
origin (`stdout` or `stderr`) and its timestamp. Each log file contains information about
only one container.
@z

@x
```json
{"log":"Log line is here\n","stream":"stdout","time":"2019-01-01T11:11:11.111111111Z"}
```
@y
```json
{"log":"Log line is here\n","stream":"stdout","time":"2019-01-01T11:11:11.111111111Z"}
```
@z

@x
## Usage
@y
## Usage
@z

@x
To use the `json-file` driver as the default logging driver, set the `log-driver`
and `log-opts` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\` on Windows Server. For more information about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@y
To use the `json-file` driver as the default logging driver, set the `log-driver`
and `log-opts` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\` on Windows Server. For more information about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@z

@x
The following example sets the log driver to `json-file` and sets the `max-size` and `max-file` options.
@y
The following example sets the log driver to `json-file` and sets the `max-size` and `max-file` options.
@z

@x
```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3" 
  }
}
```
@y
```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3" 
  }
}
```
@z

@x
> **Note**
>
> `log-opts` configuration options in the `daemon.json` configuration file must
> be provided as strings. Boolean and numeric values (such as the value for
> `max-file` in the example above) must therefore be enclosed in quotes (`"`).
@y
> **Note**
>
> `log-opts` configuration options in the `daemon.json` configuration file must
> be provided as strings. Boolean and numeric values (such as the value for
> `max-file` in the example above) must therefore be enclosed in quotes (`"`).
@z

@x
Restart Docker for the changes to take effect for newly created containers.
Existing containers do not use the new logging configuration.
@y
Restart Docker for the changes to take effect for newly created containers.
Existing containers do not use the new logging configuration.
@z

@x
You can set the logging driver for a specific container by using the
`--log-driver` flag to `docker container create` or `docker run`:
@y
You can set the logging driver for a specific container by using the
`--log-driver` flag to `docker container create` or `docker run`:
@z

@x
```bash
$ docker run \
      --log-driver json-file --log-opt max-size=10m \
      alpine echo hello world
```
@y
```bash
$ docker run \
      --log-driver json-file --log-opt max-size=10m \
      alpine echo hello world
```
@z

@x
### Options
@y
### Options
@z

@x
The `json-file` logging driver supports the following logging options:
@y
The `json-file` logging driver supports the following logging options:
@z

@x
| Option         | Description                                                                                                                                                                                                   | Example  value                                    |
|:---------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------|
| `max-size`     | The maximum size of the log before it is rolled. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`). Defaults to -1 (unlimited).                                          | `--log-opt max-size=10m`                          |
| `max-file`     | The maximum number of log files that can be present. If rolling the logs creates excess files, the oldest file is removed. **Only effective when `max-size` is also set.** A positive integer. Defaults to 1. | `--log-opt max-file=3`                            |
| `labels`       | Applies when starting the Docker daemon. A comma-separated list of logging-related labels this daemon accepts. Used for advanced [log tag options](log_tags.md).                                              | `--log-opt labels=production_status,geo`          |
| `env`          | Applies when starting the Docker daemon. A comma-separated list of logging-related environment variables this daemon accepts. Used for advanced [log tag options](log_tags.md).                               | `--log-opt env=os,customer`                       |
| `env-regex`    | Similar to and compatible with `env`. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                                                  | `--log-opt env-regex=^(os|customer).`             |
| `compress`     | Toggles compression for rotated logs. Default is `disabled`.                                                                                                                                                  | `--log-opt compress=true`                         |
@y
| Option         | Description                                                                                                                                                                                                   | Example  value                                    |
|:---------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------|
| `max-size`     | The maximum size of the log before it is rolled. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`). Defaults to -1 (unlimited).                                          | `--log-opt max-size=10m`                          |
| `max-file`     | The maximum number of log files that can be present. If rolling the logs creates excess files, the oldest file is removed. **Only effective when `max-size` is also set.** A positive integer. Defaults to 1. | `--log-opt max-file=3`                            |
| `labels`       | Applies when starting the Docker daemon. A comma-separated list of logging-related labels this daemon accepts. Used for advanced [log tag options](log_tags.md).                                              | `--log-opt labels=production_status,geo`          |
| `env`          | Applies when starting the Docker daemon. A comma-separated list of logging-related environment variables this daemon accepts. Used for advanced [log tag options](log_tags.md).                               | `--log-opt env=os,customer`                       |
| `env-regex`    | Similar to and compatible with `env`. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                                                  | `--log-opt env-regex=^(os|customer).`             |
| `compress`     | Toggles compression for rotated logs. Default is `disabled`.                                                                                                                                                  | `--log-opt compress=true`                         |
@z

@x
### Examples
@y
### Examples
@z

@x
This example starts an `alpine` container which can have a maximum of 3 log
files no larger than 10 megabytes each.
@y
This example starts an `alpine` container which can have a maximum of 3 log
files no larger than 10 megabytes each.
@z

@x
```bash
$ docker run -it --log-opt max-size=10m --log-opt max-file=3 alpine ash
```
@y
```bash
$ docker run -it --log-opt max-size=10m --log-opt max-file=3 alpine ash
```
@z
