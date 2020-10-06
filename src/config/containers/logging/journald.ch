%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Describes how to use the Journald logging driver.
keywords: Journald, docker, logging, driver
redirect_from:
- /engine/reference/logging/journald/
- /engine/admin/logging/journald/
title: Journald logging driver
---
@y
---
description: Describes how to use the Journald logging driver.
keywords: Journald, docker, logging, driver
redirect_from:
- /engine/reference/logging/journald/
- /engine/admin/logging/journald/
title: journald ログドライバー
---
@z

@x
The `journald` logging driver sends container logs to the
[`systemd` journal](http://www.freedesktop.org/software/systemd/man/systemd-journald.service.html).
Log entries can be retrieved using the `journalctl` command, through use of the
`journal` API, or using the `docker logs` command.
@y
{% comment %}
The `journald` logging driver sends container logs to the
[`systemd` journal](http://www.freedesktop.org/software/systemd/man/systemd-journald.service.html).
Log entries can be retrieved using the `journalctl` command, through use of the
`journal` API, or using the `docker logs` command.
{% endcomment %}
ログドライバー `journald` は、コンテナーのログを [`systemd` ジャーナル](http://www.freedesktop.org/software/systemd/man/systemd-journald.service.html) へ送信します。
ログ出力された各項目は、`journal` API の利用を通じて `journalctl` コマンドを使って確認することができます。
または `docker logs` コマンドを使って確認することもできます。
@z

@x
In addition to the text of the log message itself, the `journald` log driver
stores the following metadata in the journal with each message:
@y
{% comment %}
In addition to the text of the log message itself, the `journald` log driver
stores the following metadata in the journal with each message:
{% endcomment %}
`journald` ログドライバーはジャーナル内において、元のログメッセージに加えて、以下のメタデータを保存します。
@z

@x
| Field                                | Description                                                                                                                                            |
|:-------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `CONTAINER_ID`                       | The container ID truncated to 12 characters.                                                                                                           |
| `CONTAINER_ID_FULL`                  | The full 64-character container ID.                                                                                                                    |
| `CONTAINER_NAME`                     | The container name at the time it was started. If you use `docker rename` to rename a container, the new name is not reflected in the journal entries. |
| `CONTAINER_TAG`, `SYSLOG_IDENTIFIER` | The container tag ([log tag option documentation](log_tags.md)).                                                                                       |
| `CONTAINER_PARTIAL_MESSAGE`          | A field that flags log integrity. Improve logging of long log lines.                                                                                   |
@y
{% comment %}
| Field                                | Description                                                                                                                                            |
|:-------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `CONTAINER_ID`                       | The container ID truncated to 12 characters.                                                                                                           |
| `CONTAINER_ID_FULL`                  | The full 64-character container ID.                                                                                                                    |
| `CONTAINER_NAME`                     | The container name at the time it was started. If you use `docker rename` to rename a container, the new name is not reflected in the journal entries. |
| `CONTAINER_TAG`, `SYSLOG_IDENTIFIER` | The container tag ([log tag option documentation](log_tags.md)).                                                                                       |
| `CONTAINER_PARTIAL_MESSAGE`          | A field that flags log integrity. Improve logging of long log lines.                                                                                   |
{% endcomment %}
| 項目                                 | 内容説明                                                                                                                                               |
|:-------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `CONTAINER_ID`                       | The container ID truncated to 12 characters.                                                                                                           |
| `CONTAINER_ID_FULL`                  | 64 文字からなる完全なコンテナー ID。                                                                                                                   |
| `CONTAINER_NAME`                     | ログ出力開始時点でのコンテナー名。`docker rename` によりコンテナー名を変更しても、ジャーナルエントリには新たな名称は反映されません。                  |
| `CONTAINER_TAG`, `SYSLOG_IDENTIFIER` | The container tag ([log tag option documentation](log_tags.md)).                                                                                       |
| `CONTAINER_PARTIAL_MESSAGE`          | A field that flags log integrity. Improve logging of long log lines.                                                                                   |
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
To use the `journald` driver as the default logging driver, set the `log-driver`
and `log-opt` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@y
{% comment %}
To use the `journald` driver as the default logging driver, set the `log-driver`
and `log-opt` keys to appropriate values in the `daemon.json` file, which is
located in `/etc/docker/` on Linux hosts or
`C:\ProgramData\docker\config\daemon.json` on Windows Server. For more about
configuring Docker using `daemon.json`, see
[daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
{% endcomment %}
デフォルトのログドライバーとして `journald` を設定するには、`daemon.json` ファイル内において、`log-driver` と `log-opt` キーを適切に設定します。
`daemon.json` は Linux ホストの場合は `/etc/docker/` に、また Windows Server の場合は `C:\ProgramData\docker\config\daemon.json` にあります。
`daemon.json` を用いた Docker の設定方法については [daemon.json](../../../engine/reference/commandline/dockerd.md#daemon-configuration-file) を参照してください。
@z

@x
The following example sets the log driver to `journald`:
@y
{% comment %}
The following example sets the log driver to `journald`:
{% endcomment %}
以下の例により、ログドライバーを `journald` に設定します。
@z

@x
```json
{
  "log-driver": "journald"
}
```
@y
```json
{
  "log-driver": "journald"
}
```
@z

@x
Restart Docker for the changes to take effect.
@y
{% comment %}
Restart Docker for the changes to take effect.
{% endcomment %}
変更内容を有効にするために Docker デーモンを再起動します。
@z

@x
To configure the logging driver for a specific container, use the `--log-driver`
flag on the `docker run` command.
@y
{% comment %}
To configure the logging driver for a specific container, use the `--log-driver`
flag on the `docker run` command.
{% endcomment %}
このログドライバーを特定のコンテナーに対して設定するには、`docker run` コマンドにおいて `--log-driver` フラグを指定します。
@z

@x
```bash
$ docker run --log-driver=journald ...
```
@y
```bash
$ docker run --log-driver=journald ...
```
@z

@x
## Options
@y
{% comment %}
## Options
{% endcomment %}
{: #options }
## オプション
@z

@x
Use the `--log-opt NAME=VALUE` flag to specify additional `journald` logging
driver options.
@y
{% comment %}
Use the `--log-opt NAME=VALUE` flag to specify additional `journald` logging
driver options.
{% endcomment %}
ログドライバー `journald` のオプションを指定するには `--log-opt NAME=VALUE` フラグを利用します。
@z

@x
| Option         | Required | Description                                                                                                                                                                   |
|:---------------|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `tag`          | optional | Specify template to set `CONTAINER_TAG` and `SYSLOG_IDENTIFIER` value in journald logs. Refer to [log tag option documentation](log_tags.md) to customize the log tag format. |
| `labels`       | optional | Comma-separated list of keys of labels, which should be included in message, if these labels are specified for the container.                                                 |
| `env`          | optional | Comma-separated list of keys of environment variables, which should be included in message, if these variables are specified for the container.                               |
| `env-regex`    | optional | Similar to and compatible with env. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                    |
@y
{% comment %}
| Option         | Required | Description                                                                                                                                                                   |
|:---------------|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `tag`          | optional | Specify template to set `CONTAINER_TAG` and `SYSLOG_IDENTIFIER` value in journald logs. Refer to [log tag option documentation](log_tags.md) to customize the log tag format. |
| `labels`       | optional | Comma-separated list of keys of labels, which should be included in message, if these labels are specified for the container.                                                 |
| `env`          | optional | Comma-separated list of keys of environment variables, which should be included in message, if these variables are specified for the container.                               |
| `env-regex`    | optional | Similar to and compatible with env. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                    |
{% endcomment %}
| オプション     | Required | Description                                                                                                                                                                   |
|:---------------|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `tag`          | optional | Specify template to set `CONTAINER_TAG` and `SYSLOG_IDENTIFIER` value in journald logs. Refer to [log tag option documentation](log_tags.md) to customize the log tag format. |
| `labels`       | optional | Comma-separated list of keys of labels, which should be included in message, if these labels are specified for the container.                                                 |
| `env`          | optional | Comma-separated list of keys of environment variables, which should be included in message, if these variables are specified for the container.                               |
| `env-regex`    | optional | Similar to and compatible with env. A regular expression to match logging-related environment variables. Used for advanced [log tag options](log_tags.md).                    |
@z

@x
If a collision occurs between label and env keys, the value of the env takes
precedence. Each option adds additional fields to the attributes of a logging
message.
@y
{% comment %}
If a collision occurs between label and env keys, the value of the env takes
precedence. Each option adds additional fields to the attributes of a logging
message.
{% endcomment %}
If a collision occurs between label and env keys, the value of the env takes
precedence. Each option adds additional fields to the attributes of a logging
message.
@z

@x
Below is an example of the logging options required to log to journald.
@y
{% comment %}
Below is an example of the logging options required to log to journald.
{% endcomment %}
Below is an example of the logging options required to log to journald.
@z

@x
```bash
$ docker run \
    --log-driver=journald \
    --log-opt labels=location \
    --log-opt env=TEST \
    --env "TEST=false" \
    --label location=west \
    your/application
```
@y
```bash
$ docker run \
    --log-driver=journald \
    --log-opt labels=location \
    --log-opt env=TEST \
    --env "TEST=false" \
    --label location=west \
    your/application
```
@z

@x
This configuration also directs the driver to include in the payload the label
location, and the environment variable TEST.  If the `--env "TEST=false"`
or `--label location=west` arguments were omitted, the corresponding key would
not be set in the journald log.
@y
{% comment %}
This configuration also directs the driver to include in the payload the label
location, and the environment variable TEST.  If the `--env "TEST=false"`
or `--label location=west` arguments were omitted, the corresponding key would
not be set in the journald log.
{% endcomment %}
This configuration also directs the driver to include in the payload the label
location, and the environment variable TEST.  If the `--env "TEST=false"`
or `--label location=west` arguments were omitted, the corresponding key would
not be set in the journald log.
@z

@x
## Note regarding container names
@y
{% comment %}
## Note regarding container names
{% endcomment %}
{: #note-regarding-container-names }
## コンテナー名に関するメモ
@z

@x
The value logged in the `CONTAINER_NAME` field is the name of the container that
was set at startup. If you use `docker rename` to rename a container, the new
name **is not reflected** in the journal entries. Journal entries continue
to use the original name.
@y
{% comment %}
The value logged in the `CONTAINER_NAME` field is the name of the container that
was set at startup. If you use `docker rename` to rename a container, the new
name **is not reflected** in the journal entries. Journal entries continue
to use the original name.
{% endcomment %}
The value logged in the `CONTAINER_NAME` field is the name of the container that
was set at startup. If you use `docker rename` to rename a container, the new
name **is not reflected** in the journal entries. Journal entries continue
to use the original name.
@z

@x
## Retrieve log messages with `journalctl`
@y
{% comment %}
## Retrieve log messages with `journalctl`
{% endcomment %}
{: #retrieve-log-messages-with-journalctl }
## `journalctl` を使ったログメッセージの確認
@z

@x
Use the `journalctl` command to retrieve log messages. You can apply filter
expressions to limit the retrieved messages to those associated with a specific
container:
@y
{% comment %}
Use the `journalctl` command to retrieve log messages. You can apply filter
expressions to limit the retrieved messages to those associated with a specific
container:
{% endcomment %}
Use the `journalctl` command to retrieve log messages. You can apply filter
expressions to limit the retrieved messages to those associated with a specific
container:
@z

@x
```bash
$ sudo journalctl CONTAINER_NAME=webserver
```
@y
```bash
$ sudo journalctl CONTAINER_NAME=webserver
```
@z

@x
You can use additional filters to further limit the messages retrieved. The `-b`
flag only retrieves messages generated since the last system boot:
@y
{% comment %}
You can use additional filters to further limit the messages retrieved. The `-b`
flag only retrieves messages generated since the last system boot:
{% endcomment %}
You can use additional filters to further limit the messages retrieved. The `-b`
flag only retrieves messages generated since the last system boot:
@z

@x
```bash
$ sudo journalctl -b CONTAINER_NAME=webserver
```
@y
```bash
$ sudo journalctl -b CONTAINER_NAME=webserver
```
@z

@x
The `-o` flag specifies the format for the retried log messages. Use `-o json`
to return the log messages in JSON format.
@y
{% comment %}
{% endcomment %}
The `-o` flag specifies the format for the retried log messages. Use `-o json`
to return the log messages in JSON format.
@z

@x
```bash
$ sudo journalctl -o json CONTAINER_NAME=webserver
```
@y
```bash
$ sudo journalctl -o json CONTAINER_NAME=webserver
```
@z

@x
### View logs for a container with a TTY enabled
@y
{% comment %}
{% endcomment %}
### View logs for a container with a TTY enabled
@z

@x
If TTY is enabled on a container you may see `[10B blob data]` in the output
when retrieving log messages.
The reason for that is that `\r` is appended to the end of the line and
`journalctl` doesn't strip it automatically unless `--all` is set:
@y
{% comment %}
{% endcomment %}
If TTY is enabled on a container you may see `[10B blob data]` in the output
when retrieving log messages.
The reason for that is that `\r` is appended to the end of the line and
`journalctl` doesn't strip it automatically unless `--all` is set:
@z

@x
```bash
$ sudo journalctl -b CONTAINER_NAME=webserver --all
```
@y
```bash
$ sudo journalctl -b CONTAINER_NAME=webserver --all
```
@z

@x
## Retrieve log messages with the `journal` API
@y
{% comment %}
## Retrieve log messages with the `journal` API
{% endcomment %}
## Retrieve log messages with the `journal` API
@z

@x
This example uses the `systemd` Python module to retrieve container
logs:
@y
{% comment %}
{% endcomment %}
This example uses the `systemd` Python module to retrieve container
logs:
@z

@x
```python
import systemd.journal
@y
```python
import systemd.journal
@z

@x
reader = systemd.journal.Reader()
reader.add_match('CONTAINER_NAME=web')
@y
reader = systemd.journal.Reader()
reader.add_match('CONTAINER_NAME=web')
@z

@x
for msg in reader:
    print '{CONTAINER_ID_FULL}: {MESSAGE}'.format(**msg)
```
@y
for msg in reader:
    print '{CONTAINER_ID_FULL}: {MESSAGE}'.format(**msg)
```
@z
