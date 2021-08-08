%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Describes how to use the Amazon CloudWatch Logs logging driver.
keywords: AWS, Amazon, CloudWatch, logging, driver
redirect_from:
- /engine/reference/logging/awslogs/
- /engine/admin/logging/awslogs/
title: Amazon CloudWatch Logs logging driver
---
@y
---
description: Describes how to use the Amazon CloudWatch Logs logging driver.
keywords: AWS, Amazon, CloudWatch, logging, driver
redirect_from:
- /engine/reference/logging/awslogs/
- /engine/admin/logging/awslogs/
title: Amazon CloudWatch Logs logging driver
---
@z

@x
The `awslogs` logging driver sends container logs to
[Amazon CloudWatch Logs](https://aws.amazon.com/cloudwatch/details/#log-monitoring).
Log entries can be retrieved through the [AWS Management
Console](https://console.aws.amazon.com/cloudwatch/home#logs:) or the [AWS SDKs
and Command Line Tools](https://docs.aws.amazon.com/cli/latest/reference/logs/index.html).
@y
The `awslogs` logging driver sends container logs to
[Amazon CloudWatch Logs](https://aws.amazon.com/cloudwatch/details/#log-monitoring).
Log entries can be retrieved through the [AWS Management
Console](https://console.aws.amazon.com/cloudwatch/home#logs:) or the [AWS SDKs
and Command Line Tools](https://docs.aws.amazon.com/cli/latest/reference/logs/index.html).
@z

@x
## Usage
@y
## Usage
@z

@x
To use the `awslogs` driver as the default logging driver, set the `log-driver`
and `log-opt` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
The following example sets the log driver to `awslogs` and sets the
`awslogs-region` option.
@y
To use the `awslogs` driver as the default logging driver, set the `log-driver`
and `log-opt` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
The following example sets the log driver to `awslogs` and sets the
`awslogs-region` option.
@z

@x
```json
{
  "log-driver": "awslogs",
  "log-opts": {
    "awslogs-region": "us-east-1"
  }
}
```
@y
```json
{
  "log-driver": "awslogs",
  "log-opts": {
    "awslogs-region": "us-east-1"
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
You can set the logging driver for a specific container by using the
`--log-driver` option to `docker run`:
@y
You can set the logging driver for a specific container by using the
`--log-driver` option to `docker run`:
@z

@x
```console
$ docker run --log-driver=awslogs ...
```
@y
```console
$ docker run --log-driver=awslogs ...
```
@z

@x
If you are using Docker Compose, set `awslogs` using the following declaration example:
@y
If you are using Docker Compose, set `awslogs` using the following declaration example:
@z

@x
```yaml
myservice:
  logging:
    driver: awslogs
    options:
      awslogs-region: us-east-1
```
@y
```yaml
myservice:
  logging:
    driver: awslogs
    options:
      awslogs-region: us-east-1
```
@z

@x
## Amazon CloudWatch Logs options
@y
## Amazon CloudWatch Logs options
@z

@x
You can add logging options to the `daemon.json` to set Docker-wide defaults,
or use the `--log-opt NAME=VALUE` flag to specify Amazon CloudWatch Logs
logging driver options when starting a container.
@y
You can add logging options to the `daemon.json` to set Docker-wide defaults,
or use the `--log-opt NAME=VALUE` flag to specify Amazon CloudWatch Logs
logging driver options when starting a container.
@z

@x
### awslogs-region
@y
### awslogs-region
@z

@x
The `awslogs` logging driver sends your Docker logs to a specific region. Use
the `awslogs-region` log option or the `AWS_REGION` environment variable to set
the region. By default, if your Docker daemon is running on an EC2 instance
and no region is set, the driver uses the instance's region.
@y
The `awslogs` logging driver sends your Docker logs to a specific region. Use
the `awslogs-region` log option or the `AWS_REGION` environment variable to set
the region. By default, if your Docker daemon is running on an EC2 instance
and no region is set, the driver uses the instance's region.
@z

@x
```console
$ docker run --log-driver=awslogs --log-opt awslogs-region=us-east-1 ...
```
@y
```console
$ docker run --log-driver=awslogs --log-opt awslogs-region=us-east-1 ...
```
@z

@x
### awslogs-endpoint
@y
### awslogs-endpoint
@z

@x
By default, Docker uses either the `awslogs-region` log option or the
detected region to construct the remote CloudWatch Logs API endpoint.
Use the `awslogs-endpoint` log option to override the default endpoint
with the provided endpoint.
@y
By default, Docker uses either the `awslogs-region` log option or the
detected region to construct the remote CloudWatch Logs API endpoint.
Use the `awslogs-endpoint` log option to override the default endpoint
with the provided endpoint.
@z

@x
> **Note**
>
> The `awslogs-region` log option or detected region controls the
> region used for signing. You may experience signature errors if the
> endpoint you've specified with `awslogs-endpoint` uses a different region.
@y
> **Note**
>
> The `awslogs-region` log option or detected region controls the
> region used for signing. You may experience signature errors if the
> endpoint you've specified with `awslogs-endpoint` uses a different region.
@z

@x
### awslogs-group
@y
### awslogs-group
@z

@x
You must specify a
[log group](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)
for the `awslogs` logging driver. You can specify the log group with the
`awslogs-group` log option:
@y
You must specify a
[log group](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)
for the `awslogs` logging driver. You can specify the log group with the
`awslogs-group` log option:
@z

@x
```console
$ docker run --log-driver=awslogs --log-opt awslogs-region=us-east-1 --log-opt awslogs-group=myLogGroup ...
```
@y
```console
$ docker run --log-driver=awslogs --log-opt awslogs-region=us-east-1 --log-opt awslogs-group=myLogGroup ...
```
@z

@x
### awslogs-stream
@y
### awslogs-stream
@z

@x
To configure which
[log stream](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)
should be used, you can specify the `awslogs-stream` log option. If not
specified, the container ID is used as the log stream.
@y
To configure which
[log stream](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)
should be used, you can specify the `awslogs-stream` log option. If not
specified, the container ID is used as the log stream.
@z

@x
> **Note**
>
> Log streams within a given log group should only be used by one container
> at a time. Using the same log stream for multiple containers concurrently
> can cause reduced logging performance.
@y
> **Note**
>
> Log streams within a given log group should only be used by one container
> at a time. Using the same log stream for multiple containers concurrently
> can cause reduced logging performance.
@z

@x
### awslogs-create-group
@y
### awslogs-create-group
@z

@x
Log driver returns an error by default if the log group does not exist. However, you can set the
`awslogs-create-group` to `true` to automatically create the log group as needed.
The `awslogs-create-group` option defaults to `false`.
@y
Log driver returns an error by default if the log group does not exist. However, you can set the
`awslogs-create-group` to `true` to automatically create the log group as needed.
The `awslogs-create-group` option defaults to `false`.
@z

@x
```console
$ docker run \
    --log-driver=awslogs \
    --log-opt awslogs-region=us-east-1 \
    --log-opt awslogs-group=myLogGroup \
    --log-opt awslogs-create-group=true \
    ...
```
@y
```console
$ docker run \
    --log-driver=awslogs \
    --log-opt awslogs-region=us-east-1 \
    --log-opt awslogs-group=myLogGroup \
    --log-opt awslogs-create-group=true \
    ...
```
@z

@x
> **Note**
>
> Your AWS IAM policy must include the `logs:CreateLogGroup` permission before
> you attempt to use `awslogs-create-group`.
@y
> **Note**
>
> Your AWS IAM policy must include the `logs:CreateLogGroup` permission before
> you attempt to use `awslogs-create-group`.
@z

@x
### awslogs-datetime-format
@y
### awslogs-datetime-format
@z

@x
The `awslogs-datetime-format` option defines a multiline start pattern in [Python
`strftime` format](https://strftime.org). A log message consists of a line that
matches the pattern and any following lines that don't match the pattern. Thus
the matched line is the delimiter between log messages.
@y
The `awslogs-datetime-format` option defines a multiline start pattern in [Python
`strftime` format](https://strftime.org). A log message consists of a line that
matches the pattern and any following lines that don't match the pattern. Thus
the matched line is the delimiter between log messages.
@z

@x
One example of a use case for using
this format is for parsing output such as a stack dump, which might otherwise
be logged in multiple entries. The correct pattern allows it to be captured in a
single entry.
@y
One example of a use case for using
this format is for parsing output such as a stack dump, which might otherwise
be logged in multiple entries. The correct pattern allows it to be captured in a
single entry.
@z

@x
This option always takes precedence if both `awslogs-datetime-format` and
`awslogs-multiline-pattern` are configured.
@y
This option always takes precedence if both `awslogs-datetime-format` and
`awslogs-multiline-pattern` are configured.
@z

@x
> **Note**
>
> Multiline logging performs regular expression parsing and matching of all log
> messages, which may have a negative impact on logging performance.
@y
> **Note**
>
> Multiline logging performs regular expression parsing and matching of all log
> messages, which may have a negative impact on logging performance.
@z

@x
Consider the following log stream, where new log messages start with a
timestamp:
@y
Consider the following log stream, where new log messages start with a
timestamp:
@z

@x
```console
[May 01, 2017 19:00:01] A message was logged
[May 01, 2017 19:00:04] Another multiline message was logged
Some random message
with some random words
[May 01, 2017 19:01:32] Another message was logged
```
@y
```console
[May 01, 2017 19:00:01] A message was logged
[May 01, 2017 19:00:04] Another multiline message was logged
Some random message
with some random words
[May 01, 2017 19:01:32] Another message was logged
```
@z

@x
The format can be expressed as a `strftime` expression of
`[%b %d, %Y %H:%M:%S]`, and the `awslogs-datetime-format` value can be set to
that expression:
@y
The format can be expressed as a `strftime` expression of
`[%b %d, %Y %H:%M:%S]`, and the `awslogs-datetime-format` value can be set to
that expression:
@z

@x
```console
$ docker run \
    --log-driver=awslogs \
    --log-opt awslogs-region=us-east-1 \
    --log-opt awslogs-group=myLogGroup \
    --log-opt awslogs-datetime-format='\[%b %d, %Y %H:%M:%S\]' \
    ...
```
@y
```console
$ docker run \
    --log-driver=awslogs \
    --log-opt awslogs-region=us-east-1 \
    --log-opt awslogs-group=myLogGroup \
    --log-opt awslogs-datetime-format='\[%b %d, %Y %H:%M:%S\]' \
    ...
```
@z

@x
This parses the logs into the following CloudWatch log events:
@y
This parses the logs into the following CloudWatch log events:
@z

@x
```console
# First event
[May 01, 2017 19:00:01] A message was logged
@y
```console
# First event
[May 01, 2017 19:00:01] A message was logged
@z

@x
# Second event
[May 01, 2017 19:00:04] Another multiline message was logged
Some random message
with some random words
@y
# Second event
[May 01, 2017 19:00:04] Another multiline message was logged
Some random message
with some random words
@z

@x
# Third event
[May 01, 2017 19:01:32] Another message was logged
```
@y
# Third event
[May 01, 2017 19:01:32] Another message was logged
```
@z

@x
The following `strftime` codes are supported:
@y
The following `strftime` codes are supported:
@z

@x
| Code | Meaning                                                          | Example  |
|:-----|:-----------------------------------------------------------------|:---------|
| `%a` | Weekday abbreviated name.                                        | Mon      |
| `%A` | Weekday full name.                                               | Monday   |
| `%w` | Weekday as a decimal number where 0 is Sunday and 6 is Saturday. | 0        |
| `%d` | Day of the month as a zero-padded decimal number.                | 08       |
| `%b` | Month abbreviated name.                                          | Feb      |
| `%B` | Month full name.                                                 | February |
| `%m` | Month as a zero-padded decimal number.                           | 02       |
| `%Y` | Year with century as a decimal number.                           | 2008     |
| `%y` | Year without century as a zero-padded decimal number.            | 08       |
| `%H` | Hour (24-hour clock) as a zero-padded decimal number.            | 19       |
| `%I` | Hour (12-hour clock) as a zero-padded decimal number.            | 07       |
| `%p` | AM or PM.                                                        | AM       |
| `%M` | Minute as a zero-padded decimal number.                          | 57       |
| `%S` | Second as a zero-padded decimal number.                          | 04       |
| `%L` | Milliseconds as a zero-padded decimal number.                    | .123     |
| `%f` | Microseconds as a zero-padded decimal number.                    | 000345   |
| `%z` | UTC offset in the form +HHMM or -HHMM.                           | +1300    |
| `%Z` | Time zone name.                                                  | PST      |
| `%j` | Day of the year as a zero-padded decimal number.                 | 363      |
@y
| Code | Meaning                                                          | Example  |
|:-----|:-----------------------------------------------------------------|:---------|
| `%a` | Weekday abbreviated name.                                        | Mon      |
| `%A` | Weekday full name.                                               | Monday   |
| `%w` | Weekday as a decimal number where 0 is Sunday and 6 is Saturday. | 0        |
| `%d` | Day of the month as a zero-padded decimal number.                | 08       |
| `%b` | Month abbreviated name.                                          | Feb      |
| `%B` | Month full name.                                                 | February |
| `%m` | Month as a zero-padded decimal number.                           | 02       |
| `%Y` | Year with century as a decimal number.                           | 2008     |
| `%y` | Year without century as a zero-padded decimal number.            | 08       |
| `%H` | Hour (24-hour clock) as a zero-padded decimal number.            | 19       |
| `%I` | Hour (12-hour clock) as a zero-padded decimal number.            | 07       |
| `%p` | AM or PM.                                                        | AM       |
| `%M` | Minute as a zero-padded decimal number.                          | 57       |
| `%S` | Second as a zero-padded decimal number.                          | 04       |
| `%L` | Milliseconds as a zero-padded decimal number.                    | .123     |
| `%f` | Microseconds as a zero-padded decimal number.                    | 000345   |
| `%z` | UTC offset in the form +HHMM or -HHMM.                           | +1300    |
| `%Z` | Time zone name.                                                  | PST      |
| `%j` | Day of the year as a zero-padded decimal number.                 | 363      |
@z

@x
### awslogs-multiline-pattern
@y
### awslogs-multiline-pattern
@z

@x
The `awslogs-multiline-pattern` option defines a multiline start pattern using a
regular expression. A log message consists of a line that matches the pattern
and any following lines that don't match the pattern. Thus the matched line is
the delimiter between log messages.
@y
The `awslogs-multiline-pattern` option defines a multiline start pattern using a
regular expression. A log message consists of a line that matches the pattern
and any following lines that don't match the pattern. Thus the matched line is
the delimiter between log messages.
@z

@x
This option is ignored if `awslogs-datetime-format` is also configured.
@y
This option is ignored if `awslogs-datetime-format` is also configured.
@z

@x
> **Note**:
> Multiline logging performs regular expression parsing and matching of all log
> messages. This may have a negative impact on logging performance.
@y
> **Note**:
> Multiline logging performs regular expression parsing and matching of all log
> messages. This may have a negative impact on logging performance.
@z

@x
For example, to process the following log stream where new log messages start with the pattern `INFO`:
@y
For example, to process the following log stream where new log messages start with the pattern `INFO`:
@z

@x
Consider the following log stream, where each log message should start with the
patther `INFO`:
@y
Consider the following log stream, where each log message should start with the
patther `INFO`:
@z

@x
```console
INFO A message was logged
INFO Another multiline message was logged
     Some random message
INFO Another message was logged
```
@y
```console
INFO A message was logged
INFO Another multiline message was logged
     Some random message
INFO Another message was logged
```
@z

@x
You can use the regular expression of `^INFO`:
@y
You can use the regular expression of `^INFO`:
@z

@x
```console
$ docker run \
    --log-driver=awslogs \
    --log-opt awslogs-region=us-east-1 \
    --log-opt awslogs-group=myLogGroup \
    --log-opt awslogs-multiline-pattern='^INFO' \
    ...
```
@y
```console
$ docker run \
    --log-driver=awslogs \
    --log-opt awslogs-region=us-east-1 \
    --log-opt awslogs-group=myLogGroup \
    --log-opt awslogs-multiline-pattern='^INFO' \
    ...
```
@z

@x
This parses the logs into the following CloudWatch log events:
@y
This parses the logs into the following CloudWatch log events:
@z

@x
```console
# First event
INFO A message was logged
@y
```console
# First event
INFO A message was logged
@z

@x
# Second event
INFO Another multiline message was logged
     Some random message
@y
# Second event
INFO Another multiline message was logged
     Some random message
@z

@x
# Third event
INFO Another message was logged
```
@y
# Third event
INFO Another message was logged
```
@z

@x
### tag
@y
### tag
@z

@x
Specify `tag` as an alternative to the `awslogs-stream` option. `tag` interprets
Go template markup, such as `{% raw %}{{.ID}}{% endraw %}`, `{% raw %}{{.FullID}}{% endraw %}`
or `{% raw %}{{.Name}}{% endraw %}` `{% raw %}docker.{{.ID}}{% endraw %}`. See
the [tag option documentation](log_tags.md) for details on supported template
substitutions.
@y
Specify `tag` as an alternative to the `awslogs-stream` option. `tag` interprets
Go template markup, such as `{% raw %}{{.ID}}{% endraw %}`, `{% raw %}{{.FullID}}{% endraw %}`
or `{% raw %}{{.Name}}{% endraw %}` `{% raw %}docker.{{.ID}}{% endraw %}`. See
the [tag option documentation](log_tags.md) for details on supported template
substitutions.
@z

@x
When both `awslogs-stream` and `tag` are specified, the value supplied for
`awslogs-stream` overrides the template specified with `tag`.
@y
When both `awslogs-stream` and `tag` are specified, the value supplied for
`awslogs-stream` overrides the template specified with `tag`.
@z

@x
If not specified, the container ID is used as the log stream.
@y
If not specified, the container ID is used as the log stream.
@z

@x
> **Note**
>
> The CloudWatch log API does not support `:` in the log name. This can cause
> some issues when using the {% raw %}`{{ .ImageName }}`{% endraw %} as a tag,
> since a docker image has a format of `IMAGE:TAG`, such as `alpine:latest`.
> Template markup can be used to get the proper format. To get the image name
> and the first 12 characters of the container ID, you can use:
> 
> {% raw %}
> ```bash
> --log-opt tag='{{ with split .ImageName ":" }}{{join . "_"}}{{end}}-{{.ID}}'
> ```
> {% endraw %}
> the output is something like: `alpine_latest-bf0072049c76`
@y
> **Note**
>
> The CloudWatch log API does not support `:` in the log name. This can cause
> some issues when using the {% raw %}`{{ .ImageName }}`{% endraw %} as a tag,
> since a docker image has a format of `IMAGE:TAG`, such as `alpine:latest`.
> Template markup can be used to get the proper format. To get the image name
> and the first 12 characters of the container ID, you can use:
> 
> {% raw %}
> ```bash
> --log-opt tag='{{ with split .ImageName ":" }}{{join . "_"}}{{end}}-{{.ID}}'
> ```
> {% endraw %}
> the output is something like: `alpine_latest-bf0072049c76`
@z

@x
## Credentials
@y
## Credentials
@z

@x
You must provide AWS credentials to the Docker daemon to use the `awslogs`
logging driver. You can provide these credentials with the `AWS_ACCESS_KEY_ID`,
`AWS_SECRET_ACCESS_KEY`, and `AWS_SESSION_TOKEN` environment variables, the
default AWS shared credentials file (`~/.aws/credentials` of the root user), or
if you are running the Docker daemon on an Amazon EC2 instance, the Amazon EC2
instance profile.
@y
You must provide AWS credentials to the Docker daemon to use the `awslogs`
logging driver. You can provide these credentials with the `AWS_ACCESS_KEY_ID`,
`AWS_SECRET_ACCESS_KEY`, and `AWS_SESSION_TOKEN` environment variables, the
default AWS shared credentials file (`~/.aws/credentials` of the root user), or
if you are running the Docker daemon on an Amazon EC2 instance, the Amazon EC2
instance profile.
@z

@x
Credentials must have a policy applied that allows the `logs:CreateLogStream`
and `logs:PutLogEvents` actions, as shown in the following example.
@y
Credentials must have a policy applied that allows the `logs:CreateLogStream`
and `logs:PutLogEvents` actions, as shown in the following example.
@z

@x
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
```
@y
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
```
@z
