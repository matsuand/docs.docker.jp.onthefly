%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Describes how to format tags for.
keywords: docker, logging, driver, syslog, Fluentd, gelf, journald
redirect_from:
- /engine/reference/logging/log_tags/
- /engine/admin/logging/log_tags/
title: Customize log driver output
---
@y
---
description: Describes how to format tags for.
keywords: docker, logging, driver, syslog, Fluentd, gelf, journald
redirect_from:
- /engine/reference/logging/log_tags/
- /engine/admin/logging/log_tags/
title: ログドライバー出力のカスタマイズ
---
@z

@x
The `tag` log option specifies how to format a tag that identifies the
container's log messages. By default, the system uses the first 12 characters of
the container ID. To override this behavior, specify a `tag` option:
@y
ログオプションの`tag`は、コンテナーのログ出力を識別するためのタグを、どのような書式で出力するかを指定します。
デフォルトでは、コンテナー ID の先頭 12 文字を用います。
この動作を上書きするには`tag`オプションを使います。
@z

@x
```console
$ docker run --log-driver=fluentd --log-opt fluentd-address=myhost.local:24224 --log-opt tag="mailer"
```
@y
```console
$ docker run --log-driver=fluentd --log-opt fluentd-address=myhost.local:24224 --log-opt tag="mailer"
```
@z

@x
Docker supports some special template markup you can use when specifying a tag's value:
@y
タグの値を指定する際には、特別なテンプレートマークアップの指定がサポートされています。
@z

@x
{% raw %}
| Markup             | Description                                          |
|--------------------|------------------------------------------------------|
| `{{.ID}}`          | The first 12 characters of the container ID.         |
| `{{.FullID}}`      | The full container ID.                               |
| `{{.Name}}`        | The container name.                                  |
| `{{.ImageID}}`     | The first 12 characters of the container's image ID. |
| `{{.ImageFullID}}` | The container's full image ID.               |
| `{{.ImageName}}`   | The name of the image used by the container.         |
| `{{.DaemonName}}`  | The name of the docker program (`docker`).           |
@y
{% raw %}
| マークアップ       | 内容説明                                             |
|--------------------|------------------------------------------------------|
| `{{.ID}}`          | コンテナーIDの先頭12文字。                           |
| `{{.FullID}}`      | コンテナーIDの全文字。                               |
| `{{.Name}}`        | コンテナー名。                                       |
| `{{.ImageID}}`     | コンテナーのイメージIDの先頭12文字。                 |
| `{{.ImageFullID}}` | コンテナーのイメージIDの全文字。                     |
| `{{.ImageName}}`   | コンテナーで用いられているイメージ名。               |
| `{{.DaemonName}}`  | Dockerプログラム名 (`docker`)                        |
@z

@x
{% endraw %}
@y
{% endraw %}
@z

@x
For example, specifying a {% raw %}`--log-opt tag="{{.ImageName}}/{{.Name}}/{{.ID}}"`{% endraw %} value yields `syslog` log lines like:
@y
たとえば {% raw %}`--log-opt tag="{{.ImageName}}/{{.Name}}/{{.ID}}"`{% endraw %} と指定すると、`syslog`のようなログ出力になります。
@z

@x
```none
Aug  7 18:33:19 HOSTNAME hello-world/foobar/5790672ab6a0[9103]: Hello from Docker.
```
@y
```none
Aug  7 18:33:19 HOSTNAME hello-world/foobar/5790672ab6a0[9103]: Hello from Docker.
```
@z

@x
At startup time, the system sets the `container_name` field and {% raw %}`{{.Name}}`{% endraw %} in
the tags. If you use `docker rename` to rename a container, the new name is not
reflected in the log messages. Instead, these messages continue to use the
original container name.
@y
システム起動時にタグ内の`container_name`と {% raw %}`{{.Name}}`{% endraw %} が設定されます。
`docker rename`によってコンテナー名を変更した場合、ログ出力に新たな名前は反映されません。
ログでは、元々のコンテナー名を用いた出力が行われます。
@z
