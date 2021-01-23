%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configure logging driver.
keywords: docker, logging, driver
redirect_from:
- /engine/reference/logging/overview/
- /engine/reference/logging/
- /engine/admin/reference/logging/
- /engine/admin/logging/overview/
title: Configure logging drivers
---
@y
---
description: ログドライバーを設定します。
keywords: docker, logging, driver
redirect_from:
- /engine/reference/logging/overview/
- /engine/reference/logging/
- /engine/admin/reference/logging/
- /engine/admin/logging/overview/
title: ログドライバーの設定
---
@z

@x
Docker includes multiple logging mechanisms to help you
[get information from running containers and services](index.md).
These mechanisms are called logging drivers. Each Docker daemon has a default
logging driver, which each container uses unless you configure it to use a
different logging driver, or "log-driver" for short.
@y
Docker にはログ出力のメカニズムが複数あるので、[コンテナーまたはサービスのログ確認](index.md) を行うことができます。
このメカニズムのことをログドライバー（logging driver）と呼びます。
Docker デーモンにはデフォルトのログドライバーが設定されています。
別のログドライバーを利用するような設定を行わないかぎり、各コンテナーはこのデフォルトログドライバーを利用します。
@z

@x
As a default, Docker uses the [`json-file` logging driver](json-file.md), which
caches container logs as JSON internally. In addition to using the logging drivers
included with Docker, you can also implement and use [logging driver plugins](plugins.md).
@y
デフォルトで Docker は [`json-file`ログドライバー](json-file.md) を利用します。
これはコンテナーログを JSON 形式として内部にキャッシュします。
Docker が提供するログドライバーの利用だけでなく、[ログドライバープラグイン](plugins.md) を導入して利用することもできます。
@z

@x
> **Tip: use the "local" logging driver to prevent disk-exhaustion** 
> 
> By default, no log-rotation is performed. As a result, log-files stored by the
> default [`json-file` logging driver](json-file.md) logging driver can cause 
> a significant amount of disk space to be used for containers that generate much
> output, which can lead to disk space exhaustion.
> 
> Docker keeps the json-file logging driver (without log-rotation) as a default
> to remain backward compatibility with older versions of Docker, and for situations
> where Docker is used as runtime for Kubernetes.
> 
> For other situations, the "local" logging driver is recommended as it performs
> log-rotation by default, and uses a more efficient file format. Refer to the
> [Configure the default logging driver](#configure-the-default-logging-driver)
> section below to learn how to configure the "local" logging driver as a default,
> and the [local file logging driver](local.md) page for more details about the
> "local" logging driver.
@y
> **Tip: use the "local" logging driver to prevent disk-exhaustion** 
> 
> By default, no log-rotation is performed. As a result, log-files stored by the
> default [`json-file` logging driver](json-file.md) logging driver can cause 
> a significant amount of disk space to be used for containers that generate much
> output, which can lead to disk space exhaustion.
> 
> Docker keeps the json-file logging driver (without log-rotation) as a default
> to remain backward compatibility with older versions of Docker, and for situations
> where Docker is used as runtime for Kubernetes.
> 
> For other situations, the "local" logging driver is recommended as it performs
> log-rotation by default, and uses a more efficient file format. Refer to the
> [Configure the default logging driver](#configure-the-default-logging-driver)
> section below to learn how to configure the "local" logging driver as a default,
> and the [local file logging driver](local.md) page for more details about the
> "local" logging driver.
@z

@x
## Configure the default logging driver
@y
{: #configure-the-default-logging-driver }
## デフォルトのログドライバー設定
@z

@x
To configure the Docker daemon to default to a specific logging driver, set the
value of `log-driver` to the name of the logging driver in the `daemon.json`
configuration file. Refer to the "daemon configuration file" section in the
[`dockerd` reference manual](/engine/reference/commandline/dockerd/#daemon-configuration-file)
for details.
@y
特定のログドライバーを Docker デーモンのデフォルトとして設定するには、設定ファイル`daemon.json`において`log-driver`にそのログドライバー名を指定します。
設定ファイルの詳細については [`dockerd`リファレンスマニュアル]({{ site.baseurl }}/engine/reference/commandline/dockerd/#daemon-configuration-file) の`daemon.json`の節を参照してください。
@z

@x
The default logging driver is `json-file`. The following example sets the default
logging driver to the [`local` log driver](local.md):
@y
デフォルトのログドライバーは`json-file`です。
以下に示す例では、デフォルトのログドライバーを明示的に`local`に設定します。
@z

@x
```json
{
  "log-driver": "local"
}
```
@y
```json
{
  "log-driver": "local"
}
```
@z

@x
If the logging driver has configurable options, you can set them in the
`daemon.json` file as a JSON object with the key `log-opts`. The following
example sets two configurable options on the `json-file` logging driver:
@y
ログドライバーに設定変更可能なオプションがある場合、`daemon.json`ファイル内において`log-opts`キーを使って JSON オブジェクトとして指定することができます。
以下の例は、ログドライバー`json-file`において 2 つの設定オプションを指定します。
@z

@x
```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3",
    "labels": "production_status",
    "env": "os,customer"
  }
}
```
@y
```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3",
    "labels": "production_status",
    "env": "os,customer"
  }
}
```
@z

@x
Restart Docker for the changes to take effect for newly created containers.
Existing containers do not use the new logging configuration.
@y
新たに生成されたコンテナーの変更内容を有効にするために、Docker を再起動します。
既存のコンテナーは、この新たなログ設定は利用しません。
@z

@x
> **Note**
>
> `log-opts` configuration options in the `daemon.json` configuration file must
> be provided as strings. Boolean and numeric values (such as the value for
> `max-file` in the example above) must therefore be enclosed in quotes (`"`).
@y
> **メモ**
>
> 設定ファイル`daemon.json`内の`log-opts`オプションは文字列として指定する必要があります。
> したがってブール値や数値（上の例でいうと`max-file`の設定値）はクォート（`"`）で囲む必要があります。
@z

@x
If you do not specify a logging driver, the default is `json-file`.
To find the current default logging driver for the Docker daemon, run
`docker info` and search for `Logging Driver`. You can use the following
command on Linux, macOS, or PowerShell on Windows:
@y
ログドライバーを指定しなかった場合、デフォルトは`json-file`です。
Docker デーモンにおいて設定されている、その時点でのデフォルトのログドライバーが何であるかは、`docker info`を実行して`Logging Driver`の項目を見ればわかります。
以下のコマンドは Linux、macOS、Windows 上の PowerShell において実行することができます。
@z

@x
{% raw %}
```console
$ docker info --format '{{.LoggingDriver}}'

json-file
```
{% endraw %}
@y
{% raw %}
```console
$ docker info --format '{{.LoggingDriver}}'

json-file
```
{% endraw %}
@z

@x
> **Note**
> 
> Changing the default logging driver or logging driver options in the daemon
> configuration only affects containers that are created after the configuration
> is changed. Existing containers retain the logging driver options that were
> used when they were created. To update the logging driver for a container, the
> container has to be re-created with the desired options.
> Refer to the [configure the logging driver for a container](#configure-the-logging-driver-for-a-container)
> section below to learn how to find the logging-driver configuration of a
> container.
@y
> **メモ**
> 
> デーモン設定においてデフォルトのログドライバーやそのオプションを変更した場合、その変更内容はそれ以降に生成されたコンテナーにのみ適用されます。
> 既存のコンテナーが利用するログドライバーオプションは、それが生成されたときのものがそのまま使われます。
> コンテナーに対するログドライバーは更新するには、必要なオプションを使ってそのコンテナーを再生成する必要があります。
> コンテナーにおけるログドライバー設定に関しては、以下に示す [コンテナーに対するログドライバー設定](#configure-the-logging-driver-for-a-container) を参照してください。
@z

@x
## Configure the logging driver for a container
@y
{: #configure-the-logging-driver-for-a-container }
## コンテナーに対するログドライバー設定
@z

@x
When you start a container, you can configure it to use a different logging
driver than the Docker daemon's default, using the `--log-driver` flag. If the
logging driver has configurable options, you can set them using one or more
instances of the `--log-opt <NAME>=<VALUE>` flag. Even if the container uses the
default logging driver, it can use different configurable options.
@y
コンテナーの起動時には、Docker デーモンのデフォルトとは異なる、別のログドライバーを設定することができます。
これは`--log-driver`フラグを使います。
ログドライバーに設定変更可能なオプションがある場合、`--log-opt <NAME>=<VALUE>`フラグを必要な分だけ用いて指定することができます。
コンテナーがデフォルトのログドライバーを利用しているとしても、設定変更可能なオプションはさまざまなものがあります。
@z

@x
The following example starts an Alpine container with the `none` logging driver.
@y
以下の例は Alpine コンテナーの起動時に、ログドライバーとして`none`を指定しています。
@z

@x
```console
$ docker run -it --log-driver none alpine ash
```
@y
```console
$ docker run -it --log-driver none alpine ash
```
@z

@x
To find the current logging driver for a running container, if the daemon
is using the `json-file` logging driver, run the following `docker inspect`
command, substituting the container name or ID for `<CONTAINER>`:
@y
デーモンがログドライバー`json-file`を利用している場合に、実行コンテナーに設定されているログドライバーが何であるかを確認するには、以下のように`docker inspect`を実行します。
実行にあたっては`<CONTAINER>`の部分をコンテナー名か、あるいはコンテナー ID とします。
@z

@x
{% raw %}
```console
$ docker inspect -f '{{.HostConfig.LogConfig.Type}}' <CONTAINER>
@y
{% raw %}
```console
$ docker inspect -f '{{.HostConfig.LogConfig.Type}}' <CONTAINER>
@z

@x
json-file
```
{% endraw %}
@y
json-file
```
{% endraw %}
@z

@x
## Configure the delivery mode of log messages from container to log driver
@y
{: #Configure-the-delivery-mode-of-log-messages-from-container-to-log-driver }
## コンテナーからログドライバーへのメッセージ転送モードの設定
@z

@x
Docker provides two modes for delivering messages from the container to the log
driver:
@y
Docker には、コンテナーからログドライバーに向けてのログメッセージ転送に関して、2 つのモードがあります。
@z

@x
* (default) direct, blocking delivery from container to driver
* non-blocking delivery that stores log messages in an intermediate per-container
  ring buffer for consumption by driver
@y
* （デフォルト） コンテナーからドライバーへの直接のログメッセージ転送はブロックするモード。
* ブロックしない（`non-blocking`）モード。
  ドライバーが利用するものとして用意されている、各コンテナーごとの中間リングバッファーに、ログメッセージが保存されます。
@z

@x
The `non-blocking` message delivery mode prevents applications from blocking due
to logging back pressure. Applications are likely to fail in unexpected ways when
STDERR or STDOUT streams block.
@y
`non-blocking`メッセージ転送モードの場合、ログ出力のためにアプリケーションに負荷がかかっても、ログメッセージを転送しません。
STDERR や STDOUT ストリームがブロックされると、アプリケーションが予期せずに失敗することがあります。
@z

@x
> **Warning**
>
> When the buffer is full and a new message is enqueued, the oldest message in
> memory is dropped.  Dropping messages is often preferred to blocking the
> log-writing process of an application.
{: .warning}
@y
> **警告**
>
> バッファーがいっぱいになって、新たなメッセージがキューに待機するようになると、メモリ上にあるメッセージの中で最も古いものが破棄されます。アプリケーションのログ出力処理がブロックされることよりも、メッセージが破棄されることの方が良い場合もあります。
{: .warning}
@z

@x
The `mode` log option controls whether to use the `blocking` (default) or
`non-blocking` message delivery.
@y
ログオプションの`mode`は、メッセージ転送をブロックする`blocking`（デフォルト）か、ブロックしない`non-blocking`かを制御します。
@z

@x
The `max-buffer-size` log option controls the size of the ring buffer used for
intermediate message storage when `mode` is set to `non-blocking`. `max-buffer-size`
defaults to 1 megabyte.
@y
ログオプション`max-buffer-size`は`mode`が`non-blocking`に設定されている場合に、中間的なメッセージ保存場所として利用されるリングバッファーのサイズを設定します。
`max-buffer-size`のデフォルトは 1 メガバイトです。
@z

@x
The following example starts an Alpine container with log output in non-blocking
mode and a 4 megabyte buffer:
@y
以下に示す例は Alpine コンテナーの起動にあたって、ログ出力を non-blocking モードとし、バッファーを 4 メガバイトとします。
@z

@x
```console
$ docker run -it --log-opt mode=non-blocking --log-opt max-buffer-size=4m alpine ping 127.0.0.1
```
@y
```console
$ docker run -it --log-opt mode=non-blocking --log-opt max-buffer-size=4m alpine ping 127.0.0.1
```
@z

@x
### Use environment variables or labels with logging drivers
@y
{: #use-environment-variables-or-labels-with-logging-drivers }
### ログドライバーに対する環境変数やラベルの利用
@z

@x
Some logging drivers add the value of a container's `--env|-e` or `--label`
flags to the container's logs. This example starts a container using the Docker
daemon's default logging driver (let's assume `json-file`) but sets the
environment variable `os=ubuntu`.
@y
ログドライバーの中には、コンテナーに対して指定された`--env|-e`フラグや`--label`フラグの値を、コンテナーログに加えられるようになっているものがあります。
以下の例では、Docker デーモンがデフォルトのログドライバー（`json-file`とします）を利用している状態でコンテナーを起動し、さらに環境変数`os=ubuntu`を設定します。
@z

@x
```console
$ docker run -dit --label production_status=testing -e os=ubuntu alpine sh
```
@y
```console
$ docker run -dit --label production_status=testing -e os=ubuntu alpine sh
```
@z

@x
If the logging driver supports it, this adds additional fields to the logging
output. The following output is generated by the `json-file` logging driver:
@y
ログドライバー側が対応していれば、ログ内に追加項目が出力されることになります。
以下の出力は、ログドライバー`json-file`によって生成されるものです。
@z

@x
```json
"attrs":{"production_status":"testing","os":"ubuntu"}
```
@y
```json
"attrs":{"production_status":"testing","os":"ubuntu"}
```
@z

@x
## Supported logging drivers
@y
{: #supported-logging-drivers }
## サポートされるログドライバー
@z

@x
The following logging drivers are supported. See the link to each driver's
documentation for its configurable options, if applicable. If you are using
[logging driver plugins](plugins.md), you may
see more options.
@y
ログドライバーは以下に示すものがサポートされています。
ドライバーに対する設定可能オプションについては、リンク先にある各ドライバーのドキュメントを参照してください。
[ログドライバープラグイン](plugins.md) を利用している場合は、さらにオプションがあります。
@z

@x
| Driver                        | Description                                                                                                   |
|:------------------------------|:--------------------------------------------------------------------------------------------------------------|
| `none`                        | No logs are available for the container and `docker logs` does not return any output.                         |
| [`local`](local.md)           | Logs are stored in a custom format designed for minimal overhead.                                             |
| [`json-file`](json-file.md)   | The logs are formatted as JSON. The default logging driver for Docker.                                        |
| [`syslog`](syslog.md)         | Writes logging messages to the `syslog` facility. The `syslog` daemon must be running on the host machine.    |
| [`journald`](journald.md)     | Writes log messages to `journald`. The `journald` daemon must be running on the host machine.                 |
| [`gelf`](gelf.md)             | Writes log messages to a Graylog Extended Log Format (GELF) endpoint such as Graylog or Logstash.             |
| [`fluentd`](fluentd.md)       | Writes log messages to `fluentd` (forward input). The `fluentd` daemon must be running on the host machine.   |
| [`awslogs`](awslogs.md)       | Writes log messages to Amazon CloudWatch Logs.                                                                |
| [`splunk`](splunk.md)         | Writes log messages to `splunk` using the HTTP Event Collector.                                               |
| [`etwlogs`](etwlogs.md)       | Writes log messages as Event Tracing for Windows (ETW) events. Only available on Windows platforms.           |
| [`gcplogs`](gcplogs.md)       | Writes log messages to Google Cloud Platform (GCP) Logging.                                                   |
| [`logentries`](logentries.md) | Writes log messages to Rapid7 Logentries.                                                                     |
@y
| ドライバー                    | 内容説明                                                                                                      |
|:------------------------------|:--------------------------------------------------------------------------------------------------------------|
| `none`                        | コンテナーのログは出力されません。したがって`docker logs`からは何も出力されません。                        |
| [`local`](local.md)           | 独自フォーマットによりログが保存されます。これは最小限のオーバーヘッドとなるように設計されています。          |
| [`json-file`](json-file.md)   | ログは JSON 形式で出力されます。Docker におけるデフォルトのログドライバーです。                              |
| [`syslog`](syslog.md)         | ログメッセージを`syslog`に出力します。ホストマシン上に`syslog`デーモンを実行しておく必要があります。      |
| [`journald`](journald.md)     | ログメッセージを`journald`に出力します。ホストマシン上に`journald`デーモンを実行しておく必要があります。|
| [`gelf`](gelf.md)             | ログメッセージを Graylog や Logstash のような Graylog Extended Log Format (GELF) エンドポイントに出力します。 |
| [`fluentd`](fluentd.md)       | ログメッセージを`fluentd`(forward input) に出力します。ホストマシン上に `fluentd`デーモンを実行しておく必要があります。|
| [`awslogs`](awslogs.md)       | ログメッセージを Amazon CloudWatch Logs へ出力します。                                                        |
| [`splunk`](splunk.md)         | ログメッセージを、HTTP Event Collector を使って`splunk`に出力します。                                       |
| [`etwlogs`](etwlogs.md)       | ログメッセージを Event Tracing for Windows (ETW) イベントとして出力します。Windows プラットフォームにおいてのみ利用可能です。|
| [`gcplogs`](gcplogs.md)       | ログメッセージを Google Cloud Platform (GCP) Logging に出力します。                                           |
| [`logentries`](logentries.md) | ログメッセージを Rapid7 Logentries に出力します。                                                             |
@z

@x
> **Note**
>
> When using Docker Engine 19.03 or older, the [`docker logs` command](../../../engine/reference/commandline/logs.md)
> is only functional for the `local`, `json-file` and `journald` logging drivers.
> Docker 20.10 and up introduces "dual logging", which uses a local buffer that
> allows  you to use the `docker logs` command for any logging driver. Refer to
> [reading logs when using remote logging drivers](dual-logging.md) for details.
@y
> **メモ**
>
> Docker Engine 19.03 またはそれ以前を利用している場合、[`docker logs`コマンド](../../../engine/reference/commandline/logs.md) は、ログドライバー`local`、`json-file`、`journald`に対してのみ機能します。
> Docker 20.10 またはそれ以降には「デュアルログ」（dual logging）機能が導入されています。
> これはローカルバッファーを使って、どのようなログドライバーでも`docker logs`コマンドが利用できるものです。
> 詳しくは [リモートログドライバーを使ったログ読み込み](dual-logging.md) を参照してください。
@z

@x
## Limitations of logging drivers
@y
{: #limitations-of-logging-drivers }
## ログドライバーの制限事項
@z

@x
- Reading log information requires decompressing rotated log files, which causes
  a temporary increase in disk usage (until the log entries from the rotated
  files are read) and an increased CPU usage while decompressing. 
@y
- ログ情報を読むには、ローテートされるログファイルを伸張（解凍）することが必要になります。
  その際には一時的にディスクを消費します（ローテートされたファイルからログを読み込むまで）。
  また伸張（解凍）の際には CPU 使用が増加します。
@z

@x
- The capacity of the host storage where the Docker data directory resides
  determines the maximum size of the log file information.
@y
- Docker のデータディレクトリを収容するホストのストレージ容量によって、ログファイルの最大容量が定まります。
@z
