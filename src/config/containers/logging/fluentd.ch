%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Describes how to use the fluentd logging driver.
keywords: Fluentd, docker, logging, driver
redirect_from:
- /engine/reference/logging/fluentd/
- /reference/logging/fluentd/
- /engine/admin/logging/fluentd/
title: Fluentd logging driver
---
@y
---
description: Describes how to use the fluentd logging driver.
keywords: Fluentd, docker, logging, driver
redirect_from:
- /engine/reference/logging/fluentd/
- /reference/logging/fluentd/
- /engine/admin/logging/fluentd/
title: Fluentd logging driver
---
@z

@x
The `fluentd` logging driver sends container logs to the
[Fluentd](https://www.fluentd.org) collector as structured log data. Then, users
can use any of the [various output plugins of
Fluentd](https://www.fluentd.org/plugins) to write these logs to various
destinations.
@y
The `fluentd` logging driver sends container logs to the
[Fluentd](https://www.fluentd.org) collector as structured log data. Then, users
can use any of the [various output plugins of
Fluentd](https://www.fluentd.org/plugins) to write these logs to various
destinations.
@z

@x
In addition to the log message itself, the `fluentd` log
driver sends the following metadata in the structured log message:
@y
In addition to the log message itself, the `fluentd` log
driver sends the following metadata in the structured log message:
@z

@x
| Field            | Description                                                                                                                                            |
|:-----------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `container_id`   | The full 64-character container ID.                                                                                                                    |
| `container_name` | The container name at the time it was started. If you use `docker rename` to rename a container, the new name is not reflected in the journal entries. |
| `source`         | `stdout` or `stderr`                                                                                                                                   |
| `log`            | The container log                                                                                                                                      |
@y
| Field            | Description                                                                                                                                            |
|:-----------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `container_id`   | The full 64-character container ID.                                                                                                                    |
| `container_name` | The container name at the time it was started. If you use `docker rename` to rename a container, the new name is not reflected in the journal entries. |
| `source`         | `stdout` or `stderr`                                                                                                                                   |
| `log`            | The container log                                                                                                                                      |
@z

@x
The `docker logs` command is not available for this logging driver.
@y
The `docker logs` command is not available for this logging driver.
@z

@x
## Usage
@y
## Usage
@z

@x
Some options are supported by specifying `--log-opt` as many times as needed:
@y
Some options are supported by specifying `--log-opt` as many times as needed:
@z

@x
 - `fluentd-address`: specify a socket address to connect to the Fluentd daemon, ex `fluentdhost:24224` or `unix:///path/to/fluentd.sock`
 - `tag`: specify a tag for fluentd message, which interprets some markup, ex {% raw %}`{{.ID}}`, `{{.FullID}}` or `{{.Name}}` `docker.{{.ID}}`{% endraw %}
@y
 - `fluentd-address`: specify a socket address to connect to the Fluentd daemon, ex `fluentdhost:24224` or `unix:///path/to/fluentd.sock`
 - `tag`: specify a tag for fluentd message, which interprets some markup, ex {% raw %}`{{.ID}}`, `{{.FullID}}` or `{{.Name}}` `docker.{{.ID}}`{% endraw %}
@z

@x
 To use the `fluentd` driver as the default logging driver, set the `log-driver`
 and `log-opt` keys to appropriate values in the `daemon.json` file, which is
 located in `/etc/docker/` on Linux hosts or
 `C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
 +configuring Docker using `daemon.json`, see
 +[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@y
 To use the `fluentd` driver as the default logging driver, set the `log-driver`
 and `log-opt` keys to appropriate values in the `daemon.json` file, which is
 located in `/etc/docker/` on Linux hosts or
 `C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
 +configuring Docker using `daemon.json`, see
 +[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@z

@x
The following example sets the log driver to `fluentd` and sets the
`fluentd-address` option.
@y
The following example sets the log driver to `fluentd` and sets the
`fluentd-address` option.
@z

@x
 ```json
 {
   "log-driver": "fluentd",
   "log-opts": {
     "fluentd-address": "fluentdhost:24224"
   }
 }
 ```
@y
 ```json
 {
   "log-driver": "fluentd",
   "log-opts": {
     "fluentd-address": "fluentdhost:24224"
   }
 }
 ```
@z

@x
Restart Docker for the changes to take effect.
@y
Restart Docker for the changes to take effect.
@z

@x
> **Note**
>
> `log-opts` configuration options in the `daemon.json` configuration file must
> be provided as strings. Boolean and numeric values (such as the value for
> `fluentd-async` or `fluentd-max-retries`) must therefore be enclosed
> in quotes (`"`).
@y
> **Note**
>
> `log-opts` configuration options in the `daemon.json` configuration file must
> be provided as strings. Boolean and numeric values (such as the value for
> `fluentd-async` or `fluentd-max-retries`) must therefore be enclosed
> in quotes (`"`).
@z

@x
To set the logging driver for a specific container, pass the
`--log-driver` option to `docker run`:
@y
To set the logging driver for a specific container, pass the
`--log-driver` option to `docker run`:
@z

@x
    docker run --log-driver=fluentd ...
@y
    docker run --log-driver=fluentd ...
@z

@x
Before using this logging driver, launch a Fluentd daemon. The logging driver
connects to this daemon through `localhost:24224` by default. Use the
`fluentd-address` option to connect to a different address.
@y
Before using this logging driver, launch a Fluentd daemon. The logging driver
connects to this daemon through `localhost:24224` by default. Use the
`fluentd-address` option to connect to a different address.
@z

@x
    docker run --log-driver=fluentd --log-opt fluentd-address=fluentdhost:24224
@y
    docker run --log-driver=fluentd --log-opt fluentd-address=fluentdhost:24224
@z

@x
If container cannot connect to the Fluentd daemon, the container stops
immediately unless the `fluentd-async` option is used.
@y
If container cannot connect to the Fluentd daemon, the container stops
immediately unless the `fluentd-async` option is used.
@z

@x
## Options
@y
## Options
@z

@x
Users can use the `--log-opt NAME=VALUE` flag to specify additional Fluentd logging driver options.
@y
Users can use the `--log-opt NAME=VALUE` flag to specify additional Fluentd logging driver options.
@z

@x
### fluentd-address
@y
### fluentd-address
@z

@x
By default, the logging driver connects to `localhost:24224`. Supply the
`fluentd-address` option to connect to a different address. `tcp`(default) and `unix` sockets are supported.
@y
By default, the logging driver connects to `localhost:24224`. Supply the
`fluentd-address` option to connect to a different address. `tcp`(default) and `unix` sockets are supported.
@z

@x
    docker run --log-driver=fluentd --log-opt fluentd-address=fluentdhost:24224
    docker run --log-driver=fluentd --log-opt fluentd-address=tcp://fluentdhost:24224
    docker run --log-driver=fluentd --log-opt fluentd-address=unix:///path/to/fluentd.sock
@y
    docker run --log-driver=fluentd --log-opt fluentd-address=fluentdhost:24224
    docker run --log-driver=fluentd --log-opt fluentd-address=tcp://fluentdhost:24224
    docker run --log-driver=fluentd --log-opt fluentd-address=unix:///path/to/fluentd.sock
@z

@x
Two of the above specify the same address, because `tcp` is default.
@y
Two of the above specify the same address, because `tcp` is default.
@z

@x
### tag
@y
### tag
@z

@x
By default, Docker uses the first 12 characters of the container ID to tag log messages.
Refer to the [log tag option documentation](log_tags.md) for customizing
the log tag format.
@y
By default, Docker uses the first 12 characters of the container ID to tag log messages.
Refer to the [log tag option documentation](log_tags.md) for customizing
the log tag format.
@z

@x
### labels, labels-regex, env, and env-regex
@y
### labels, labels-regex, env, and env-regex
@z

@x
The `labels` and `env` options each take a comma-separated list of keys. If
there is collision between `label` and `env` keys, the value of the `env` takes
precedence. Both options add additional fields to the extra attributes of a
logging message.
@y
The `labels` and `env` options each take a comma-separated list of keys. If
there is collision between `label` and `env` keys, the value of the `env` takes
precedence. Both options add additional fields to the extra attributes of a
logging message.
@z

@x
The `env-regex` and `labels-regex` options are similar to and compatible with
respectively `env` and `labels`. Their values are regular expressions to match
logging-related environment variables and labels. It is used for advanced
[log tag options](log_tags.md).
@y
The `env-regex` and `labels-regex` options are similar to and compatible with
respectively `env` and `labels`. Their values are regular expressions to match
logging-related environment variables and labels. It is used for advanced
[log tag options](log_tags.md).
@z

@x
### fluentd-async
@y
### fluentd-async
@z

@x
Docker connects to Fluentd in the background. Messages are buffered until the
connection is established. Defaults to `false`.
@y
Docker connects to Fluentd in the background. Messages are buffered until the
connection is established. Defaults to `false`.
@z

@x
### fluentd-buffer-limit
@y
### fluentd-buffer-limit
@z

@x
The amount of data to buffer before flushing to disk. Defaults to the amount of RAM
available to the container.
@y
The amount of data to buffer before flushing to disk. Defaults to the amount of RAM
available to the container.
@z

@x
### fluentd-retry-wait
@y
### fluentd-retry-wait
@z

@x
How long to wait between retries. Defaults to 1 second.
@y
How long to wait between retries. Defaults to 1 second.
@z

@x
### fluentd-max-retries
@y
### fluentd-max-retries
@z

@x
The maximum number of retries. Defaults to `4294967295` (2**32 - 1).
@y
The maximum number of retries. Defaults to `4294967295` (2**32 - 1).
@z

@x
### fluentd-sub-second-precision
@y
### fluentd-sub-second-precision
@z

@x
Generates event logs in nanosecond resolution. Defaults to `false`.
@y
Generates event logs in nanosecond resolution. Defaults to `false`.
@z

@x
## Fluentd daemon management with Docker
@y
## Fluentd daemon management with Docker
@z

@x
About `Fluentd` itself, see [the project webpage](https://www.fluentd.org)
and [its documents](https://docs.fluentd.org).
@y
About `Fluentd` itself, see [the project webpage](https://www.fluentd.org)
and [its documents](https://docs.fluentd.org).
@z

@x
To use this logging driver, start the `fluentd` daemon on a host. We recommend
that you use [the Fluentd docker
image](https://hub.docker.com/r/fluent/fluentd/). This image is
especially useful if you want to aggregate multiple container logs on each
host then, later, transfer the logs to another Fluentd node to create an
aggregate store.
@y
To use this logging driver, start the `fluentd` daemon on a host. We recommend
that you use [the Fluentd docker
image](https://hub.docker.com/r/fluent/fluentd/). This image is
especially useful if you want to aggregate multiple container logs on each
host then, later, transfer the logs to another Fluentd node to create an
aggregate store.
@z

@x
### Test container loggers
@y
### Test container loggers
@z

@x
1. Write a configuration file (`test.conf`) to dump input logs:
@y
1. Write a configuration file (`test.conf`) to dump input logs:
@z

@x
        <source>
          @type forward
        </source>
@y
        <source>
          @type forward
        </source>
@z

@x
        <match *>
          @type stdout
        </match>
@y
        <match *>
          @type stdout
        </match>
@z

@x
2. Launch Fluentd container with this configuration file:
@y
2. Launch Fluentd container with this configuration file:
@z

@x
        $ docker run -it -p 24224:24224 -v /path/to/conf/test.conf:/fluentd/etc/test.conf -e FLUENTD_CONF=test.conf fluent/fluentd:latest
@y
        $ docker run -it -p 24224:24224 -v /path/to/conf/test.conf:/fluentd/etc/test.conf -e FLUENTD_CONF=test.conf fluent/fluentd:latest
@z

@x
3. Start one or more containers with the `fluentd` logging driver:
@y
3. Start one or more containers with the `fluentd` logging driver:
@z

@x
        $ docker run --log-driver=fluentd your/application
@y
        $ docker run --log-driver=fluentd your/application
@z
