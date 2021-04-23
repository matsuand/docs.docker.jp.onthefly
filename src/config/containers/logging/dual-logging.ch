%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to read container logs locally when using a third party logging solution.
keywords: docker, logging, driver, dual logging, dual-logging, cache, ring-buffer, configuration
title: Use docker logs with remote logging drivers
---
@y
---
description: Learn how to read container logs locally when using a third party logging solution.
keywords: docker, logging, driver
title: リモートログドライバーを使った docker logs の利用
---
@z

@x
## Overview 
@y
{: #overview  }
## 概要
@z

@x
Prior to Docker Engine 20.10, the [`docker logs` command](../../../engine/reference/commandline/logs.md)
could only be used with logging drivers that supported  for containers using the
`local`, `json-file`, or `journald` log drivers. However, many third party logging
drivers had no support for locally reading logs using `docker logs`
@y
Docker Engine 20.10 より前は、`docker logs`を実行してコンテナーログを参照する際には、ログドライバーとして`local`、`json-file`、`journald`しかサポートされていませんでした。
他にもサードパーティー製のログドライバーはあったのですが、`docker logs`を使ってローカルでログを参照することはサポートされていませんでした。
@z

@x
This created multiple problems when attempting to gather log data in an
automated and standard way. Log information could only be accessed and viewed
through the third-party solution in the format specified by that
third-party tool. 
@y
そういった状態でログデータを収集するのは、自動化されていようが普通に行うのであろうが、大いに問題を引き起こしていました。
サードパーティー製のログソリューションを利用した場合、ログ情報はそのサードパーティーが提供するツールが指定する書式でしか、アクセスできず参照もできませんでした。
@z

@x
Starting with Docker Engine 20.10, you can use `docker logs` to read container
logs regardless of the configured logging driver or plugin. This capability,
referred to as "dual logging", allows you to use `docker logs` to read container
logs locally in a consistent format, regardless of the log driver used, because
the engine is configured to log information to the “local” logging driver. Refer
to [Configure the default logging driver](configure.md) for additional information. 
@y
Docker Engine 20.10 からは、ログドライバーやプラグインを設定するしないに関わらず、コンテナーのログを参照するには`docker logs`を使えばよいことになりました。
この機能は「デュアルログ」（dual logging）と呼ばれることがあります。
この機能を利用すると、リモートログドライバーが利用されていたとしても、`docker logs`を実行してローカルなコンテナーログを参照するだけでよく、一定の書式でログが得られることになります。
というのも、Engine が「ローカルな」ログドライバーに合わせて、ログ情報を設定してくれるからです。
詳細な情報については [デフォルトのログドライバーの設定](configure.md) を参照してください。
@z

@x
Dual logging uses the [`local`](local.md) logging driver to act as cache for
reading the latest logs of your containers. By default, the cache has log-file
rotation enabled, and is limited to a maximum of 5 files of 20MB each (before
compression) per container.
@y
デュアルログでは [`local`](local.md) ログドライバーが利用され、これを使ってコンテナーの最新ログを読み込むキャッシュとして動作します。
デフォルトでそのキャッシュは、ログファイルのローテーションを有効にしており、このログファイルはコンテナーごとに最大 5 ファイルまで、また各ファイルは（圧縮前サイズとして）20 MB までの範囲で利用可能です。
@z

@x
Refer to the [configuration options](#configuration-options) section to customize
these defaults, or to the [disable dual-logging](#disable-the-dual-logging-cache)
section to disable this feature.
@y
このデフォルトを変更する方法は [設定オプション](#configuration-options) の節を参照してください。
またこの機能を無効にする方法は [デュアルログの無効化](#disable-the-dual-logging-cache) の節を参照してください。
@z

@x
## Prerequisites 
@y
{: #prerequisites  }
## 前提条件
@z

@x
No configuration changes are needed to use dual logging. Docker Engine 20.10 and
up automatically enable dual logging if the configured logging driver does not
support reading logs.
@y
デュアルログを利用するために設定変更する必要はありません。
Docker Engine 20.10 またはそれ以降においては、設定されたログドライバーにログ読み込み機能がサポートされていない場合には、自動的にデュアルログ機能が有効になります。
@z

@x
The following examples show the result of running a `docker logs` command with
and without dual logging availability:
@y
以下の例は、デュアルログ機能がある場合とない場合において、`docker logs`コマンドを実行した結果を示すものです。
@z

@x
### Without dual logging capability
@y
{: #without-dual-logging-capability }
### デュアルログ機能がない場合
@z

@x
When a container is configured with a remote logging driver such as `splunk`, and
dual logging is disabled, an error is displayed when attempting to read container
logs locally:
@y
コンテナーに対して`splunk`のようなリモートログドライバーが設定されていて、さらにデュアルログが無効化されている場合、ローカルのコンテナーログを参照しようとすると、エラーが表示されます。
@z

@x
- Step 1: Configure Docker daemon
@y
- 手順 1： Docker デーモンを設定します。
@z

@x
    ```console
    $ cat /etc/docker/daemon.json
    {
      "log-driver": "splunk",
      "log-opts": {
        "cache-disabled": "true",
        ... (options for "splunk" logging driver)
      }
    }
    ```
@y
    ```console
    $ cat /etc/docker/daemon.json
    {
      "log-driver": "splunk",
      "log-opts": {
        "cache-disabled": "true",
        ... （"splunk" ログドライバーのオプション指定）
      }
    }
    ```
@z

@x
- Step 2: Start the container
@y
- 手順 2： コンテナーを起動します。
@z

@x
    ```console
    $ docker run -d busybox --name testlog top 
    ```
@y
    ```console
    $ docker run -d busybox --name testlog top 
    ```
@z

@x
- Step 3: Read the container logs
@y
- 手順 3： コンテナーログを確認します。
@z

@x
    ```console
    $ docker logs 7d6ac83a89a0
    Error response from daemon: configured logging driver does not support reading
    ```
@y
    ```console
    $ docker logs 7d6ac83a89a0
    Error response from daemon: configured logging driver does not support reading
    ```
@z

@x
### With dual logging capability
@y
{: #with-dual-logging-capability }
### デュアルログ機能がある場合
@z

@x
With the dual logging cache enabled, the `docker logs` command can be used to
read logs, even if the logging driver does not support reading logs. The following
examples shows a daemon configuration that uses the `splunk` remote logging driver
as a default, with dual logging caching enabled:
@y
デュアルログによるキャッシュを有効にしていれば`docker logs`によってログを参照できます。
これはログドライバーがログ読み込みに対応していなくても可能になります。
以下の例は、デーモン設定においてデフォルトとして`リモートログドライバーにsplunk`を利用し、デュアルログキャッシュを有効にするものです。
@z

@x
- Step 1: Configure Docker daemon
@y
- 手順 1： Docker デーモンを設定します。
@z

@x
    ```console
    $ cat /etc/docker/daemon.json
    {
      "log-driver": "splunk",
      "log-opts": {
        ... (options for "splunk" logging driver)
      }
    }
    ```
@y
    ```console
    $ cat /etc/docker/daemon.json
    {
      "log-driver": "splunk",
      "log-opts": {
        ... （"splunk" ログドライバーのオプション指定）
      }
    }
    ```
@z

@x
- Step 2: Start the container
@y
- 手順 2： コンテナーを起動します。
@z

@x
    ```console
    $ docker run -d busybox --name testlog top 
    ```
@y
    ```console
    $ docker run -d busybox --name testlog top 
    ```
@z

@x
- Step 3: Read the container logs
@y
- 手順 3： コンテナーログを確認します。
@z

@x
    ```console
    $ docker logs 7d6ac83a89a0
    2019-02-04T19:48:15.423Z [INFO]  core: marked as sealed                                          	 
    2019-02-04T19:48:15.423Z [INFO]  core: pre-seal teardown starting                                                                                                 	 
    2019-02-04T19:48:15.423Z [INFO]  core: stopping cluster listeners                                                                                             	 
    2019-02-04T19:48:15.423Z [INFO]  core: shutting down forwarding rpc listeners                                                                                 	 
    2019-02-04T19:48:15.423Z [INFO]  core: forwarding rpc listeners stopped
    2019-02-04T19:48:15.599Z [INFO]  core: rpc listeners successfully shut down
    2019-02-04T19:48:15.599Z [INFO]  core: cluster listeners successfully shut down	
    ```
@y
    ```console
    $ docker logs 7d6ac83a89a0
    2019-02-04T19:48:15.423Z [INFO]  core: marked as sealed                                          	 
    2019-02-04T19:48:15.423Z [INFO]  core: pre-seal teardown starting                                                                                                 	 
    2019-02-04T19:48:15.423Z [INFO]  core: stopping cluster listeners                                                                                             	 
    2019-02-04T19:48:15.423Z [INFO]  core: shutting down forwarding rpc listeners                                                                                 	 
    2019-02-04T19:48:15.423Z [INFO]  core: forwarding rpc listeners stopped
    2019-02-04T19:48:15.599Z [INFO]  core: rpc listeners successfully shut down
    2019-02-04T19:48:15.599Z [INFO]  core: cluster listeners successfully shut down	
    ```
@z

@x
> **Note**
>
> For logging drivers that support reading logs, such as the `local`, `json-file`
> and `journald` drivers, there is no difference in functionality before or after
> the dual logging capability became available. For these drivers, Logs can be
> read using `docker logs` in both scenarios.
@y
> **メモ**
>
> デュアルログ機能を有効にする前後において、ログ読み込みに対応する`local`、`json-file`、`journald`といったローカルドライバーの機能は何も変わりません。
> そのドライバーにおいてローカルのログは、上のどちらのケースにおいても参照可能です。
@z

@x
### Configuration options
@y
### Configuration options
@z

@x
The "dual logging" cache accepts the same configuration options as the
[`local` logging driver](local.md), but with a `cache-` prefix. These options
can be specified per container, and defaults for new containers can be set using
the [daemon configuration file](/engine/reference/commandline/dockerd/#daemon-configuration-file).
@y
The "dual logging" cache accepts the same configuration options as the
[`local` logging driver](local.md), but with a `cache-` prefix. These options
can be specified per container, and defaults for new containers can be set using
the [daemon configuration file](/engine/reference/commandline/dockerd/#daemon-configuration-file).
@z

@x
By default, the cache has log-file rotation enabled, and is limited to a maximum
of 5 files of 20MB each (before compression) per container. Use the configuration
options described below to customize these defaults.
@y
By default, the cache has log-file rotation enabled, and is limited to a maximum
of 5 files of 20MB each (before compression) per container. Use the configuration
options described below to customize these defaults.
@z

@x
| Option           | Default   | Description                                                                                                                                       |
|:-----------------|:----------|:--------------------------------------------------------------------------------------------------------------------------------------------------|
| `cache-disabled` | `"false"` | Disable local caching. Boolean value passed as a string (`true`, `1`, `0`, or `false`).                                                           |
| `cache-max-size` | `"20m"`   | The maximum size of the cache before it is rotated. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`).       |
| `cache-max-file` | `"5"`     | The maximum number of cache files that can be present. If rotating the logs creates excess files, the oldest file is removed. A positive integer. |
| `cache-compress` | `"true"`  | Enable or disable compression of rotated log files. Boolean value passed as a string (`true`, `1`, `0`, or `false`).                              |
@y
| Option           | Default   | Description                                                                                                                                       |
|:-----------------|:----------|:--------------------------------------------------------------------------------------------------------------------------------------------------|
| `cache-disabled` | `"false"` | Disable local caching. Boolean value passed as a string (`true`, `1`, `0`, or `false`).                                                           |
| `cache-max-size` | `"20m"`   | The maximum size of the cache before it is rotated. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`).       |
| `cache-max-file` | `"5"`     | The maximum number of cache files that can be present. If rotating the logs creates excess files, the oldest file is removed. A positive integer. |
| `cache-compress` | `"true"`  | Enable or disable compression of rotated log files. Boolean value passed as a string (`true`, `1`, `0`, or `false`).                              |
@z

@x
## Disable the dual logging cache
@y
## Disable the dual logging cache
@z

@x
Use the `cache-disabled` option to disable the dual logging cache. Disabling the
cache can be useful to save storage space in situations where logs are only read
through a remote logging system, and if there is no need to read logs through
`docker logs` for debugging purposes.
@y
Use the `cache-disabled` option to disable the dual logging cache. Disabling the
cache can be useful to save storage space in situations where logs are only read
through a remote logging system, and if there is no need to read logs through
`docker logs` for debugging purposes.
@z

@x
Caching can be disabled for individual containers or by default for new containers,
when using the [daemon configuration file](/engine/reference/commandline/dockerd/#daemon-configuration-file).
@y
Caching can be disabled for individual containers or by default for new containers,
when using the [daemon configuration file](/engine/reference/commandline/dockerd/#daemon-configuration-file).
@z

@x
The following example uses the daemon configuration file to use the ["splunk'](splunk.md)
logging driver as a default, with caching disabled:
@y
The following example uses the daemon configuration file to use the ["splunk'](splunk.md)
logging driver as a default, with caching disabled:
@z

@x
```console
$ cat /etc/docker/daemon.json
{
  "log-driver": "splunk",
  "log-opts": {
    "cache-disabled": "true",
    ... (options for "splunk" logging driver)
  }
}
```
@y
```console
$ cat /etc/docker/daemon.json
{
  "log-driver": "splunk",
  "log-opts": {
    "cache-disabled": "true",
    ... (options for "splunk" logging driver)
  }
}
```
@z

@x
> **Note**
>
> For logging drivers that support reading logs, such as the `local`, `json-file`
> and `journald` drivers, dual logging is not used, and disabling the option has
> no effect.
@y
> **Note**
>
> For logging drivers that support reading logs, such as the `local`, `json-file`
> and `journald` drivers, dual logging is not used, and disabling the option has
> no effect.
@z

@x
## Limitations
@y
{: #limitations }
## 制限事項
@z

@x
- If a container using a logging driver or plugin that sends logs remotely
  suddenly has a "network" issue, no ‘write’ to the local cache occurs. 
- If a write to `logdriver` fails for any reason (file system full, write
  permissions removed), the cache write fails and is logged in the daemon log.
  The log entry to the cache is not retried.
- Some logs might be lost from the cache in the default configuration because a
  ring buffer is used to prevent blocking the stdio of the container in case of
  slow file writes. An admin must repair these while the daemon is shut down.
@y
- コンテナーにおいて利用するログドライバーやプラグインが、リモートに向けてログ送信を行うものである場合、突然「ネットワーク的な」問題や、ローカルキャッシュへの書き込み不能となる事態が発生する場合があります。
- `logdriver`への書き込みが何らかの理由（ファイルシステムがいっぱい、書き込み権限消失）により失敗した場合、キャッシュの書き込みが失敗し、このことはデーモンのログに記録されます。
  キャッシュへのログエントリーは、リトライされることはありません。ed.
- デフォルトの設定のままでは、ログがキャッシュから失われる場合があります。
  低速なファイル書き込みなどの際に、コンテナーの標準入出力からの情報をブロックしないように、リングバッファーが利用されるからです。
  管理者はデーモンがシャットダウンする前に、この状況を修復する必要があります。
@z
