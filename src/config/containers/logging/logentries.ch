%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Logentries logging driver
description: Describes how to use the logentries logging driver.
keywords: logentries, docker, logging, driver
redirect_from:
- /engine/admin/logging/logentries/
---
@y
---
title: logentries ログドライバー
description: logentries ログドライバーの利用方法について説明します。
keywords: logentries, docker, logging, driver
redirect_from:
- /engine/admin/logging/logentries/
---
@z

@x
The `logentries` logging driver sends container logs to the
[Logentries](https://logentries.com/) server.
@y
`logentries` ログドライバーは、コンテナーログを [Logentries](https://logentries.com/) サーバーに送信します。
@z

@x
## Usage
@y
{: #usage }
## 利用方法
@z

@x
Some options are supported by specifying `--log-opt` as many times as needed:
@y
Some options are supported by specifying `--log-opt` as many times as needed:
@z

@x
 - `logentries-token`: specify the logentries log set token
 - `line-only`: send raw payload only
@y
 - `logentries-token`: specify the logentries log set token
 - `line-only`: send raw payload only
@z

@x
Configure the default logging driver by passing the
`--log-driver` option to the Docker daemon:
@y
Configure the default logging driver by passing the
`--log-driver` option to the Docker daemon:
@z

@x
```console
$ dockerd --log-driver=logentries
```
@y
```console
$ dockerd --log-driver=logentries
```
@z

@x
To set the logging driver for a specific container, pass the
`--log-driver` option to `docker run`:
@y
To set the logging driver for a specific container, pass the
`--log-driver` option to `docker run`:
@z

@x
```console
$ docker run --log-driver=logentries ...
```
@y
```console
$ docker run --log-driver=logentries ...
```
@z

@x
Before using this logging driver, you need to create a new Log Set in the
Logentries web interface and pass the token of that log set to Docker:
@y
Before using this logging driver, you need to create a new Log Set in the
Logentries web interface and pass the token of that log set to Docker:
@z

@x
```console
$ docker run --log-driver=logentries --log-opt logentries-token=abcd1234-12ab-34cd-5678-0123456789ab
```
@y
```console
$ docker run --log-driver=logentries --log-opt logentries-token=abcd1234-12ab-34cd-5678-0123456789ab
```
@z

@x
## Options
@y
## Options
@z

@x
Users can use the `--log-opt NAME=VALUE` flag to specify additional Logentries logging driver options.
@y
Users can use the `--log-opt NAME=VALUE` flag to specify additional Logentries logging driver options.
@z

@x
### logentries-token
@y
### logentries-token
@z

@x
You need to provide your log set token for logentries driver to work:
@y
You need to provide your log set token for logentries driver to work:
@z

@x
```console
$ docker run --log-driver=logentries --log-opt logentries-token=abcd1234-12ab-34cd-5678-0123456789ab
```
@y
```console
$ docker run --log-driver=logentries --log-opt logentries-token=abcd1234-12ab-34cd-5678-0123456789ab
```
@z

@x
### line-only
@y
### line-only
@z

@x
You could specify whether to send log message wrapped into container data (default) or to send raw log line
@y
You could specify whether to send log message wrapped into container data (default) or to send raw log line
@z

@x
```console
$ docker run --log-driver=logentries --log-opt logentries-token=abcd1234-12ab-34cd-5678-0123456789ab --log-opt line-only=true
```
@y
```console
$ docker run --log-driver=logentries --log-opt logentries-token=abcd1234-12ab-34cd-5678-0123456789ab --log-opt line-only=true
```
@z
