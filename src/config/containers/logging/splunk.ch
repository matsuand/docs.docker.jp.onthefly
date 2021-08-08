%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Describes how to use the Splunk logging driver.
keywords: splunk, docker, logging, driver
redirect_from:
- /engine/reference/logging/splunk/
- /engine/admin/logging/splunk/
title: Splunk logging driver
---
@y
---
description: Describes how to use the Splunk logging driver.
keywords: splunk, docker, logging, driver
redirect_from:
- /engine/reference/logging/splunk/
- /engine/admin/logging/splunk/
title: Splunk logging driver
---
@z

@x
The `splunk` logging driver sends container logs to
[HTTP Event Collector](https://dev.splunk.com/enterprise/docs/devtools/httpeventcollector/)
in Splunk Enterprise and Splunk Cloud.
@y
The `splunk` logging driver sends container logs to
[HTTP Event Collector](https://dev.splunk.com/enterprise/docs/devtools/httpeventcollector/)
in Splunk Enterprise and Splunk Cloud.
@z

@x
## Usage
@y
## Usage
@z

@x
You can configure Docker logging to use the `splunk` driver by default or on a
per-container basis.
@y
You can configure Docker logging to use the `splunk` driver by default or on a
per-container basis.
@z

@x
To use the `splunk` driver as the default logging driver, set the keys
`log-driver` and `log-opts` to appropriate values in the `daemon.json`
configuration file and restart Docker. For example:
@y
To use the `splunk` driver as the default logging driver, set the keys
`log-driver` and `log-opts` to appropriate values in the `daemon.json`
configuration file and restart Docker. For example:
@z

@x
```json
{
  "log-driver": "splunk",
  "log-opts": {
    "splunk-token": "",
    "splunk-url": "",
    ...
  }
}
```
@y
```json
{
  "log-driver": "splunk",
  "log-opts": {
    "splunk-token": "",
    "splunk-url": "",
    ...
  }
}
```
@z

@x
The daemon.json file is located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@y
The daemon.json file is located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@z

@x
> **Note**
>
> `log-opts` configuration options in the `daemon.json` configuration file must
> be provided as strings. Boolean and numeric values (such as the value for
> `splunk-gzip` or `splunk-gzip-level`) must therefore be enclosed in quotes
> (`"`).
@y
> **Note**
>
> `log-opts` configuration options in the `daemon.json` configuration file must
> be provided as strings. Boolean and numeric values (such as the value for
> `splunk-gzip` or `splunk-gzip-level`) must therefore be enclosed in quotes
> (`"`).
@z

@x
To use the `splunk` driver for a specific container, use the commandline flags
`--log-driver` and `log-opt` with `docker run`:
@y
To use the `splunk` driver for a specific container, use the commandline flags
`--log-driver` and `log-opt` with `docker run`:
@z

@x
  ```
  docker run --log-driver=splunk --log-opt splunk-token=VALUE --log-opt splunk-url=VALUE ...
  ```
@y
  ```
  docker run --log-driver=splunk --log-opt splunk-token=VALUE --log-opt splunk-url=VALUE ...
  ```
@z

@x
## Splunk options
@y
## Splunk options
@z

@x
The following properties let you configure the splunk logging driver.
@y
The following properties let you configure the splunk logging driver.
@z

@x
- To configure the `splunk` driver across the Docker environment, edit
  `daemon.json` with the key, `"log-opts": {"NAME": "VALUE", ...}`.
- To configure the `splunk` driver for an individual container, use `docker run`
  with the flag, `--log-opt NAME=VALUE ...`.
@y
- To configure the `splunk` driver across the Docker environment, edit
  `daemon.json` with the key, `"log-opts": {"NAME": "VALUE", ...}`.
- To configure the `splunk` driver for an individual container, use `docker run`
  with the flag, `--log-opt NAME=VALUE ...`.
@z

@x
| Option                      | Required | Description                                                                                                                                                                                                                                                                                                                                 |
|:----------------------------|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `splunk-token`              | required | Splunk HTTP Event Collector token.                                                                                                                                                                                                                                                                                                          |
| `splunk-url`                | required | Path to your Splunk Enterprise, self-service Splunk Cloud instance, or Splunk Cloud managed cluster (including port and scheme used by HTTP Event Collector) in one of the following formats: `https://your_splunk_instance:8088`, `https://input-prd-p-XXXXXXX.cloud.splunk.com:8088`, or `https://http-inputs-XXXXXXXX.splunkcloud.com`.  |
| `splunk-source`             | optional | Event source.                                                                                                                                                                                                                                                                                                                               |
| `splunk-sourcetype`         | optional | Event source type.                                                                                                                                                                                                                                                                                                                          |
| `splunk-index`              | optional | Event index.                                                                                                                                                                                                                                                                                                                                |
| `splunk-capath`             | optional | Path to root certificate.                                                                                                                                                                                                                                                                                                                   |
| `splunk-caname`             | optional | Name to use for validating server certificate; by default the hostname of the `splunk-url` is used.                                                                                                                                                                                                                                         |
| `splunk-insecureskipverify` | optional | Ignore server certificate validation.                                                                                                                                                                                                                                                                                                       |
| `splunk-format`             | optional | Message format. Can be `inline`, `json` or `raw`. Defaults to `inline`.                                                                                                                                                                                                                                                                     |
| `splunk-verify-connection`  | optional | Verify on start, that docker can connect to Splunk server. Defaults to true.                                                                                                                                                                                                                                                                |
| `splunk-gzip`               | optional | Enable/disable gzip compression to send events to Splunk Enterprise or Splunk Cloud instance. Defaults to false.                                                                                                                                                                                                                            |
| `splunk-gzip-level`         | optional | Set compression level for gzip. Valid values are -1 (default), 0 (no compression), 1 (best speed) ... 9 (best compression). Defaults to [DefaultCompression](https://golang.org/pkg/compress/gzip/#DefaultCompression).                                                                                                                     |
| `tag`                       | optional | Specify tag for message, which interpret some markup. Default value is {% raw %}`{{.ID}}`{% endraw %} (12 characters of the container ID). Refer to the [log tag option documentation](log_tags.md) for customizing the log tag format.                                                                                                     |
| `labels`                    | optional | Comma-separated list of keys of labels, which should be included in message, if these labels are specified for container.                                                                                                                                                                                                                   |
| `labels-regex`              | optional | Similar to and compatible with `labels`. A regular expression to match logging-related labels. Used for advanced [log tag options](log_tags.md).                                                                                                                                                                                            |
| `env`                       | optional | Comma-separated list of keys of environment variables, which should be included in message, if these variables are specified for container.                                                                                                                                                                                                 |
| `env-regex`                 | optional | Similar to and compatible with `env`. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                                                                                                                                                                                |
@y
| Option                      | Required | Description                                                                                                                                                                                                                                                                                                                                 |
|:----------------------------|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `splunk-token`              | required | Splunk HTTP Event Collector token.                                                                                                                                                                                                                                                                                                          |
| `splunk-url`                | required | Path to your Splunk Enterprise, self-service Splunk Cloud instance, or Splunk Cloud managed cluster (including port and scheme used by HTTP Event Collector) in one of the following formats: `https://your_splunk_instance:8088`, `https://input-prd-p-XXXXXXX.cloud.splunk.com:8088`, or `https://http-inputs-XXXXXXXX.splunkcloud.com`.  |
| `splunk-source`             | optional | Event source.                                                                                                                                                                                                                                                                                                                               |
| `splunk-sourcetype`         | optional | Event source type.                                                                                                                                                                                                                                                                                                                          |
| `splunk-index`              | optional | Event index.                                                                                                                                                                                                                                                                                                                                |
| `splunk-capath`             | optional | Path to root certificate.                                                                                                                                                                                                                                                                                                                   |
| `splunk-caname`             | optional | Name to use for validating server certificate; by default the hostname of the `splunk-url` is used.                                                                                                                                                                                                                                         |
| `splunk-insecureskipverify` | optional | Ignore server certificate validation.                                                                                                                                                                                                                                                                                                       |
| `splunk-format`             | optional | Message format. Can be `inline`, `json` or `raw`. Defaults to `inline`.                                                                                                                                                                                                                                                                     |
| `splunk-verify-connection`  | optional | Verify on start, that docker can connect to Splunk server. Defaults to true.                                                                                                                                                                                                                                                                |
| `splunk-gzip`               | optional | Enable/disable gzip compression to send events to Splunk Enterprise or Splunk Cloud instance. Defaults to false.                                                                                                                                                                                                                            |
| `splunk-gzip-level`         | optional | Set compression level for gzip. Valid values are -1 (default), 0 (no compression), 1 (best speed) ... 9 (best compression). Defaults to [DefaultCompression](https://golang.org/pkg/compress/gzip/#DefaultCompression).                                                                                                                     |
| `tag`                       | optional | Specify tag for message, which interpret some markup. Default value is {% raw %}`{{.ID}}`{% endraw %} (12 characters of the container ID). Refer to the [log tag option documentation](log_tags.md) for customizing the log tag format.                                                                                                     |
| `labels`                    | optional | Comma-separated list of keys of labels, which should be included in message, if these labels are specified for container.                                                                                                                                                                                                                   |
| `labels-regex`              | optional | Similar to and compatible with `labels`. A regular expression to match logging-related labels. Used for advanced [log tag options](log_tags.md).                                                                                                                                                                                            |
| `env`                       | optional | Comma-separated list of keys of environment variables, which should be included in message, if these variables are specified for container.                                                                                                                                                                                                 |
| `env-regex`                 | optional | Similar to and compatible with `env`. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                                                                                                                                                                                |
@z

@x
If there is collision between the `label` and `env` keys, the value of the `env`
takes precedence. Both options add additional fields to the attributes of a
logging message.
@y
If there is collision between the `label` and `env` keys, the value of the `env`
takes precedence. Both options add additional fields to the attributes of a
logging message.
@z

@x
Below is an example of the logging options specified for the Splunk Enterprise
instance. The instance is installed locally on the same machine on which the
Docker daemon is running.
@y
Below is an example of the logging options specified for the Splunk Enterprise
instance. The instance is installed locally on the same machine on which the
Docker daemon is running.
@z

@x
The path to the root certificate and Common Name is specified using an HTTPS
scheme. This is used for verification. The `SplunkServerDefaultCert` is
automatically generated by Splunk certificates.
@y
The path to the root certificate and Common Name is specified using an HTTPS
scheme. This is used for verification. The `SplunkServerDefaultCert` is
automatically generated by Splunk certificates.
@z

@x
{% raw %}
```console
$ docker run \
    --log-driver=splunk \
    --log-opt splunk-token=176FCEBF-4CF5-4EDF-91BC-703796522D20 \
    --log-opt splunk-url=https://splunkhost:8088 \
    --log-opt splunk-capath=/path/to/cert/cacert.pem \
    --log-opt splunk-caname=SplunkServerDefaultCert \
    --log-opt tag="{{.Name}}/{{.FullID}}" \
    --log-opt labels=location \
    --log-opt env=TEST \
    --env "TEST=false" \
    --label location=west \
    your/application
```
{% endraw %}
@y
{% raw %}
```console
$ docker run \
    --log-driver=splunk \
    --log-opt splunk-token=176FCEBF-4CF5-4EDF-91BC-703796522D20 \
    --log-opt splunk-url=https://splunkhost:8088 \
    --log-opt splunk-capath=/path/to/cert/cacert.pem \
    --log-opt splunk-caname=SplunkServerDefaultCert \
    --log-opt tag="{{.Name}}/{{.FullID}}" \
    --log-opt labels=location \
    --log-opt env=TEST \
    --env "TEST=false" \
    --label location=west \
    your/application
```
{% endraw %}
@z

@x
The `splunk-url` for Splunk instances hosted on Splunk Cloud is in a format
like `https://http-inputs-XXXXXXXX.splunkcloud.com` and does not include a
port specifier.
@y
The `splunk-url` for Splunk instances hosted on Splunk Cloud is in a format
like `https://http-inputs-XXXXXXXX.splunkcloud.com` and does not include a
port specifier.
@z

@x
### Message formats
@y
### Message formats
@z

@x
There are three logging driver messaging formats: `inline` (default), `json`,
and `raw`.
@y
There are three logging driver messaging formats: `inline` (default), `json`,
and `raw`.
@z

@x
The default format is `inline` where each log message is embedded as a string.
For example:
@y
The default format is `inline` where each log message is embedded as a string.
For example:
@z

@x
```json
{
    "attrs": {
        "env1": "val1",
        "label1": "label1"
    },
    "tag": "MyImage/MyContainer",
    "source":  "stdout",
    "line": "my message"
}
```
```json
{
    "attrs": {
        "env1": "val1",
        "label1": "label1"
    },
    "tag": "MyImage/MyContainer",
    "source":  "stdout",
    "line": "{\"foo\": \"bar\"}"
}
```
@y
```json
{
    "attrs": {
        "env1": "val1",
        "label1": "label1"
    },
    "tag": "MyImage/MyContainer",
    "source":  "stdout",
    "line": "my message"
}
```
```json
{
    "attrs": {
        "env1": "val1",
        "label1": "label1"
    },
    "tag": "MyImage/MyContainer",
    "source":  "stdout",
    "line": "{\"foo\": \"bar\"}"
}
```
@z

@x
> **Note**: If your messages are JSON objects, you may want to embed them in the
> message we send to Splunk.
@y
> **Note**: If your messages are JSON objects, you may want to embed them in the
> message we send to Splunk.
@z

@x
To format messages as `json` objects, set `--log-opt splunk-format=json`. The
driver trys to parse every line as a JSON object and send it as an embedded
object. If it cannot parse the message, it is sent `inline`. For example:
@y
To format messages as `json` objects, set `--log-opt splunk-format=json`. The
driver trys to parse every line as a JSON object and send it as an embedded
object. If it cannot parse the message, it is sent `inline`. For example:
@z

@x
```json
{
    "attrs": {
        "env1": "val1",
        "label1": "label1"
    },
    "tag": "MyImage/MyContainer",
    "source":  "stdout",
    "line": "my message"
}
```
```json
{
    "attrs": {
        "env1": "val1",
        "label1": "label1"
    },
    "tag": "MyImage/MyContainer",
    "source":  "stdout",
    "line": {
        "foo": "bar"
    }
}
```
@y
```json
{
    "attrs": {
        "env1": "val1",
        "label1": "label1"
    },
    "tag": "MyImage/MyContainer",
    "source":  "stdout",
    "line": "my message"
}
```
```json
{
    "attrs": {
        "env1": "val1",
        "label1": "label1"
    },
    "tag": "MyImage/MyContainer",
    "source":  "stdout",
    "line": {
        "foo": "bar"
    }
}
```
@z

@x
To format messages as `raw`, set `--log-opt splunk-format=raw`. Attributes
(environment variables and labels) and tags are prefixed to the message. For
example:
@y
To format messages as `raw`, set `--log-opt splunk-format=raw`. Attributes
(environment variables and labels) and tags are prefixed to the message. For
example:
@z

@x
```console
MyImage/MyContainer env1=val1 label1=label1 my message
MyImage/MyContainer env1=val1 label1=label1 {"foo": "bar"}
```
@y
```console
MyImage/MyContainer env1=val1 label1=label1 my message
MyImage/MyContainer env1=val1 label1=label1 {"foo": "bar"}
```
@z

@x
## Advanced options
@y
## Advanced options
@z

@x
Splunk Logging Driver allows you to configure few advanced options by specifying next environment variables for the Docker daemon.
@y
Splunk Logging Driver allows you to configure few advanced options by specifying next environment variables for the Docker daemon.
@z

@x
| Environment variable name                        | Default value | Description                                                                                                                                        |
|:-------------------------------------------------|:--------------|:---------------------------------------------------------------------------------------------------------------------------------------------------|
| `SPLUNK_LOGGING_DRIVER_POST_MESSAGES_FREQUENCY`  | `5s`          | If there is nothing to batch how often driver posts messages. You can think about this as the maximum time to wait for more messages to batch.     |
| `SPLUNK_LOGGING_DRIVER_POST_MESSAGES_BATCH_SIZE` | `1000`        | How many messages driver should wait before sending them in one batch.                                                                             |
| `SPLUNK_LOGGING_DRIVER_BUFFER_MAX`               | `10 * 1000`   | If driver cannot connect to remote server, what is the maximum amount of messages it can hold in buffer for retries.                               |
| `SPLUNK_LOGGING_DRIVER_CHANNEL_SIZE`             | `4 * 1000`    | How many pending messages can be in the channel which is used to send messages to background logger worker, which batches them.                    |
@y
| Environment variable name                        | Default value | Description                                                                                                                                        |
|:-------------------------------------------------|:--------------|:---------------------------------------------------------------------------------------------------------------------------------------------------|
| `SPLUNK_LOGGING_DRIVER_POST_MESSAGES_FREQUENCY`  | `5s`          | If there is nothing to batch how often driver posts messages. You can think about this as the maximum time to wait for more messages to batch.     |
| `SPLUNK_LOGGING_DRIVER_POST_MESSAGES_BATCH_SIZE` | `1000`        | How many messages driver should wait before sending them in one batch.                                                                             |
| `SPLUNK_LOGGING_DRIVER_BUFFER_MAX`               | `10 * 1000`   | If driver cannot connect to remote server, what is the maximum amount of messages it can hold in buffer for retries.                               |
| `SPLUNK_LOGGING_DRIVER_CHANNEL_SIZE`             | `4 * 1000`    | How many pending messages can be in the channel which is used to send messages to background logger worker, which batches them.                    |
@z
