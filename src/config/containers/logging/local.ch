%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Describes how to use the local logging driver.
keywords: local, docker, logging, driver
redirect_from:
- /engine/reference/logging/local/
- /engine/admin/logging/local/
title: Local File logging driver
---
@y
---
description: local ログドライバーの利用方法について説明します。
keywords: local, docker, logging, driver
redirect_from:
- /engine/reference/logging/local/
- /engine/admin/logging/local/
title: Local File ログドライバー
---
@z

@x
The `local` logging driver captures output from container's stdout/stderr and
writes them to an internal storage that is optimized for performance and disk
use.
@y
{% comment %}
The `local` logging driver captures output from container's stdout/stderr and
writes them to an internal storage that is optimized for performance and disk
use.
{% endcomment %}
`local` ログドライバーは、コンテナーの標準出力、標準エラー出力を取り込んで、内部ストレージへの書き込みを行います。
この内部ストレージは、性能やディスク利用が最適化されているものです。
@z

@x
By default, the `local` driver preserves 100MB of log messages per container and
uses automatic compression to reduce the size on disk. The 100MB default value is based on a 20M default size 
for each file and a default count of 5 for the number of such files (to account for log rotation).
@y
{% comment %}
By default, the `local` driver preserves 100MB of log messages per container and
uses automatic compression to reduce the size on disk. The 100MB default value is based on a 20M default size 
for each file and a default count of 5 for the number of such files (to account for log rotation).
{% endcomment %}
デフォルトで `local` ドライバーは、1 つのコンテナーあたり 100MB のログメッセージ容量を確保します。
そして自動的に圧縮を行って、ディスク利用量を軽減します。
100 MB というデフォルト容量は、デフォルトサイズが 20 MB のファイルを、デフォルトで 5 つ用意するところからきています。
（5 つのファイルはログローテーションを行うためです。）
@z

@x
> *Note*
>
> The `local` logging driver uses file-based storage. The file-format and
> storage mechanism are designed to be exclusively accessed by the Docker
> daemon, and should not be used by external tools as the implementation may
> change in future releases.
@y
{% comment %}
> *Note*
>
> The `local` logging driver uses file-based storage. The file-format and
> storage mechanism are designed to be exclusively accessed by the Docker
> daemon, and should not be used by external tools as the implementation may
> change in future releases.
{% endcomment %}
> **メモ**
>
> `local` ログドライバーは、ファイルベースのストレージを利用します。
> そのファイルフォーマットやストレージのメカニズムは、Docker デーモンがアクセスする目的で設計されています。
> したがって外部ツールが利用するものではないため、その実装は将来のリリースにおいて変更になる場合があります。
@z

@x
## Usage
@y
{% comment %}
## Usage
{% endcomment %}
{: #usage }
## 利用方法
@z

@x
To use the `local` driver as the default logging driver, set the `log-driver`
and `log-opt` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@y
{% comment %}
To use the `local` driver as the default logging driver, set the `log-driver`
and `log-opt` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
{% endcomment %}
デフォルトログドライバーとして `local` ドライバーを利用するには、`daemon.json` ファイル内において `log-driver` と `log-opt` キーを適切に設定します。
`daemon.json` ファイルは Linux ホストの場合は `/etc/docker/`、Windows Server の場合は `C:\ProgramData\docker\config\daemon.json` にあります。
`daemon.json` を利用して Docker を設定する方法については [daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file) を参照してください。
@z

@x
The following example sets the log driver to `local` and sets the `max-size`
option.
@y
{% comment %}
The following example sets the log driver to `local` and sets the `max-size`
option.
{% endcomment %}
以下の例では、ログドライバーに `local` を設定し、`max-size` オプションを利用しています。
@z

@x
```json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m"
  }
}
```
@y
```json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m"
  }
}
```
@z

@x
Restart Docker for the changes to take effect for newly created containers. Existing containers do not use the new logging configuration.
@y
{% comment %}
Restart Docker for the changes to take effect for newly created containers. Existing containers do not use the new logging configuration.
{% endcomment %}
コンテナーの設定を新たにしたら、その変更を有効にするために Docker を再起動してください。
すでに起動しているコンテナーは、新たなログ設定を利用しません。
@z

@x
You can set the logging driver for a specific container by using the
`--log-driver` flag to `docker container create` or `docker run`:
@y
{% comment %}
You can set the logging driver for a specific container by using the
`--log-driver` flag to `docker container create` or `docker run`:
{% endcomment %}
特定のコンテナーにのみログドライバーを設定するには、`docker container create` や `docker run` に対して `--log-driver` フラグを指定して実行します。
@z

@x
```bash
$ docker run \
      --log-driver local --log-opt max-size=10m \
      alpine echo hello world
```
@y
```bash
$ docker run \
      --log-driver local --log-opt max-size=10m \
      alpine echo hello world
```
@z

@x
### Options
@y
{% comment %}
### Options
{% endcomment %}
{: #options }
### オプション
@z

@x
The `local` logging driver supports the following logging options:
@y
{% comment %}
The `local` logging driver supports the following logging options:
{% endcomment %}
`local` ログドライバーでは、以下のオプションがサポートされます。
@z

@x
| Option      | Description                                                                                                                                                   | Example  value             |
|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------|
| `max-size`  | The maximum size of the log before it is rolled. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`). Defaults to 20m.     | `--log-opt max-size=10m`   |
| `max-file`  | The maximum number of log files that can be present. If rolling the logs creates excess files, the oldest file is removed. A positive integer. Defaults to 5. | `--log-opt max-file=3`     |
| `compress`  | Toggle compression of rotated log files. Enabled by default.                                                                                                  | `--log-opt compress=false` |
@y
{% comment %}
| Option      | Description                                                                                                                                                   | Example  value             |
|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------|
| `max-size`  | The maximum size of the log before it is rolled. A positive integer plus a modifier representing the unit of measure (`k`, `m`, or `g`). Defaults to 20m.     | `--log-opt max-size=10m`   |
| `max-file`  | The maximum number of log files that can be present. If rolling the logs creates excess files, the oldest file is removed. A positive integer. Defaults to 5. | `--log-opt max-file=3`     |
| `compress`  | Toggle compression of rotated log files. Enabled by default.                                                                                                  | `--log-opt compress=false` |
{% endcomment %}
| オプション  | 内容説明                                                                                                                                                      | 利用例                     |
|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------|
| `max-size`  | ログファイルが切り替わるまでの最大サイズ。正の整数と単位（`k`、`m`、`g`）を記述します。デフォルトは 20m です。| `--log-opt max-size=10m`   |
| `max-file`  | 許容するログファイルの最大数。ログファイルが切り替わることでファイル最大数を越えた場合、最も古いファイルが削除されます。正の整数を指定します。デフォルトは 5 です。| `--log-opt max-file=3`     |
| `compress`  | ローテートするログファイルの圧縮の有無を指定します。デフォルトは有効です。                                                                                    | `--log-opt compress=false` |
@z

@x
### Examples
@y
{% comment %}
### Examples
{% endcomment %}
{: #examples }
### 利用例
@z

@x
This example starts an `alpine` container which can have a maximum of 3 log
files no larger than 10 megabytes each.
@y
{% comment %}
This example starts an `alpine` container which can have a maximum of 3 log
files no larger than 10 megabytes each.
{% endcomment %}
以下の例は `alpine` コンテナーを起動して、ログファイルを最大 3 つ利用し、その個々について 10 MB を越えないように設定します。
@z

@x
```bash
$ docker run -it --log-driver local --log-opt max-size=10m --log-opt max-file=3 alpine ash
```
@y
```bash
$ docker run -it --log-driver local --log-opt max-size=10m --log-opt max-file=3 alpine ash
```
@z
