%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to read container logs locally when using a third party logging solution.
keywords: docker, logging, driver
title: Use docker logs to read container logs for remote logging drivers
---
@y
---
description: Learn how to read container logs locally when using a third party logging solution.
keywords: docker, logging, driver
title: リモートログドライバーに対する docker logs の利用
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
to [Configure the default logging driver](/config/containers/logging/configure)
for additional information. 
@y
Docker Engine 20.10 からは、ログドライバーやプラグインを設定するしないに関わらず、コンテナーのログを参照するには`docker logs`を使えばよいことになりました。
この機能は「デュアルログ」（dual logging）と呼ばれることがあります。
この機能を利用すると、リモートログドライバーが利用されていたとしても、`docker logs`を実行してローカルなコンテナーログを参照するだけでよく、一定の書式でログが得られることになります。
というのも、Engine が「ローカルな」ログドライバーに合わせて、ログ情報を設定してくれるからです。
詳細な情報については [デフォルトのログドライバーの設定]({{ site.baseurl }}/config/containers/logging/configure) を参照してください。
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
### Without dual logging capability:
@y
{: #without-dual-logging-capability }
### デュアルログ機能がない場合
@z

@x
When a container or `dockerd` was configured with a remote logging driver such
as `splunk`, an error was displayed when attempting to read container logs
locally:
@y
コンテナーあるいは`dockerd`に対して、`splunk`のようなリモートログドライバーを設定していた場合、ローカルのコンテナーログを参照しようとすると、エラーが表示されます。
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
        ...
      }
    }
    ```
@y
    ```console
    $ cat /etc/docker/daemon.json
    {
      "log-driver": "splunk",
      "log-opts": {
        ...
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
### With dual logging capability:
@y
{: #with-dual-logging-capability }
### デュアルログ機能がある場合
@z

@x
To configure a container or docker with a remote logging driver such as splunk:
@y
コンテナーあるいはデーモンに、splunk のようなリモートログドライバーを設定するには、以下のようにします。
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
        ...
      }
    }
    ```
@y
    ```console
    $ cat /etc/docker/daemon.json
    {
      "log-driver": "splunk",
      "log-opts": {
        ...
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
> For a local driver, such as `json-file` and `journald`, there is no difference in
> functionality before or after the dual logging capability became available.
> The log is locally visible in both scenarios.
@y
> **メモ**
>
> デュアルログ機能を有効にする前後において、`json-file`や`journald`のようなローカルドライバーの機能は何も変わりません。
> ローカルのログは、上のどちらのケースにおいても参照可能です。
@z

@x
## Limitations
@y
{: #limitations }
## 制限事項
@z

@x
- You cannot specify more than one log driver. 
- If a container using a logging driver or plugin that sends logs remotely
  suddenly has a "network" issue, no ‘write’ to the local cache occurs. 
- If a write to `logdriver` fails for any reason (file system full, write
  permissions removed), the cache write fails and is logged in the daemon log.
  The log entry to the cache is not retried.
- Some logs might be lost from the cache in the default configuration because a
  ring buffer is used to prevent blocking the stdio of the container in case of
  slow file writes. An admin must repair these while the daemon is shut down.
@y
- 複数のログドライバーを指定することはできません。
- コンテナーにおいて利用するログドライバーやプラグインが、リモートに向けてログ送信を行うものである場合、突然「ネットワーク的な」問題や、ローカルキャッシュへの書き込み不能となる事態が発生する場合があります。
- `logdriver`への書き込みが何らかの理由（ファイルシステムがいっぱい、書き込み権限消失）により失敗した場合、キャッシュの書き込みが失敗し、このことはデーモンのログに記録されます。
  キャッシュへのログエントリーは、リトライされることはありません。ed.
- デフォルトの設定のままでは、ログがキャッシュから失われる場合があります。
  低速なファイル書き込みなどの際に、コンテナーの標準入出力からの情報をブロックしないように、リングバッファーが利用されるからです。
  管理者はデーモンがシャットダウンする前に、この状況を修復する必要があります。
@z
