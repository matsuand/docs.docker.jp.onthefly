%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: List machines
keywords: machine, ls, subcommand
title: docker-machine ls
hide_from_sitemap: true
---
@y
---
description: マシンを一覧表示します。
keywords: machine, ls, subcommand
title: docker-machine ls
hide_from_sitemap: true
---
@z

@x
```none
Usage: docker-machine ls [OPTIONS] [arg...]

List machines

Options:

   --quiet, -q                                  Enable quiet mode
   --filter [--filter option --filter option]   Filter output based on conditions provided
   --timeout, -t "10"                           Timeout in seconds, default to 10s
   --format, -f                                 Pretty-print machines using a Go template
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```none
Usage: docker-machine ls [OPTIONS] [arg...]

List machines

Options:

   --quiet, -q                                  Enable quiet mode
   --filter [--filter option --filter option]   Filter output based on conditions provided
   --timeout, -t "10"                           Timeout in seconds, default to 10s
   --format, -f                                 Pretty-print machines using a Go template
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-machine ls [オプション] [arg...]

マシンを一覧表示します。

オプション:

   --quiet, -q                                  Quiet（省略）モードを有効にします。
   --filter [--filter option --filter option]   指定された条件によりフィルター(絞込み)出力します。
   --timeout, -t "10"                           タイムアウトを秒単位で指定します。。デフォルトは 10s
   --format, -f                                 Go言語テンプレートを使ってフォーマット出力します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
## Timeout
@y
{% comment %}
## Timeout
{% endcomment %}
{: #timeout }
## タイムアウト
@z

@x
The `ls` command tries to reach each host in parallel. If a given host does not
answer in less than 10 seconds, the `ls` command states that this host is in
`Timeout` state. In some circumstances (poor connection, high load, or while
troubleshooting), you may want to increase or decrease this value. You can use
the -t flag for this purpose with a numerical value in seconds.
@y
{% comment %}
The `ls` command tries to reach each host in parallel. If a given host does not
answer in less than 10 seconds, the `ls` command states that this host is in
`Timeout` state. In some circumstances (poor connection, high load, or while
troubleshooting), you may want to increase or decrease this value. You can use
the -t flag for this purpose with a numerical value in seconds.
{% endcomment %}
`ls` コマンドは各ホストへのアクセスを同時並行的に行います。
指定されたホストからの応答が 10 秒以内にない場合、`ls` コマンドはそのホストを `Timeout` 状態として扱います。
特定の状況（接続状況が悪い、高負荷時、問題発生時など）において、その値を増減する必要が出てきます。
これを実現するには、-t フラグに秒単位の数値を指定します。
@z

@x
### Example
@y
{% comment %}
### Example
{% endcomment %}
{: #example }
### 利用例
@z

@x
```none
$ docker-machine ls -t 12
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
default   -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
```
@y
```none
$ docker-machine ls -t 12
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
default   -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
```
@z

@x
## Filtering
@y
{% comment %}
## Filtering
{% endcomment %}
{: #filtering }
## フィルター出力
@z

@x
The filtering flag (`--filter`) format is a `key=value` pair. If there is more
than one filter, then pass multiple flags. For example:
`--filter "foo=bar" --filter "bif=baz"`
@y
{% comment %}
The filtering flag (`--filter`) format is a `key=value` pair. If there is more
than one filter, then pass multiple flags. For example:
`--filter "foo=bar" --filter "bif=baz"`
{% endcomment %}
フィルター（絞込み）を行うフラグ（`--filter`）の書式は、`key=value` のペアです。
複数のフィルターが必要な場合は、このフラグを複数指定します。
たとえば `--filter "foo=bar" --filter "bif=baz"` などです。
@z

@x
The currently supported filters are:
@y
{% comment %}
The currently supported filters are:
{% endcomment %}
現在サポートされているフィルターは以下のとおりです。
@z

@x
-   driver (driver name)
-   swarm  (swarm master's name)
-   state  (`Running|Paused|Saved|Stopped|Stopping|Starting|Error`)
-   name   (Machine name returned by driver, supports [golang style](https://github.com/google/re2/wiki/Syntax) regular expressions)
-   label  (Machine created with `--engine-label` option, can be filtered with `label=<key>[=<value>]`)
@y
{% comment %}
-   driver (driver name)
-   swarm  (swarm master's name)
-   state  (`Running|Paused|Saved|Stopped|Stopping|Starting|Error`)
-   name   (Machine name returned by driver, supports [golang style](https://github.com/google/re2/wiki/Syntax) regular expressions)
-   label  (Machine created with `--engine-label` option, can be filtered with `label=<key>[=<value>]`)
{% endcomment %}
-   driver （ドライバー名）
-   swarm  （Swarm マスター名）
-   state  （`Running|Paused|Saved|Stopped|Stopping|Starting|Error`）
-   name   （ドライバーによって返されるマシン名。[golang スタイル](https://github.com/google/re2/wiki/Syntax) の正規表現をサポートします。）
-   label  （`--engine-label` オプションを使って生成されたマシン。`label=<key>[=<value>]` という形式でのフィルター指定が可能。）
@z

@x
### Examples
@y
{% comment %}
### Examples
{% endcomment %}
{: #examples-2 }
### 利用例
@z

@x
```none
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
dev    -        virtualbox   Stopped
foo0   -        virtualbox   Running   tcp://192.168.99.105:2376           v1.9.1
foo1   -        virtualbox   Running   tcp://192.168.99.106:2376           v1.9.1
foo2   *        virtualbox   Running   tcp://192.168.99.107:2376           v1.9.1
@y
```none
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
dev    -        virtualbox   Stopped
foo0   -        virtualbox   Running   tcp://192.168.99.105:2376           v1.9.1
foo1   -        virtualbox   Running   tcp://192.168.99.106:2376           v1.9.1
foo2   *        virtualbox   Running   tcp://192.168.99.107:2376           v1.9.1
@z

@x
$ docker-machine ls --filter name=foo0
NAME   ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
foo0   -        virtualbox   Running   tcp://192.168.99.105:2376           v1.9.1
@y
$ docker-machine ls --filter name=foo0
NAME   ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
foo0   -        virtualbox   Running   tcp://192.168.99.105:2376           v1.9.1
@z

@x
$ docker-machine ls --filter driver=virtualbox --filter state=Stopped
NAME   ACTIVE   DRIVER       STATE     URL   SWARM   DOCKER   ERRORS
dev    -        virtualbox   Stopped                 v1.9.1
@y
$ docker-machine ls --filter driver=virtualbox --filter state=Stopped
NAME   ACTIVE   DRIVER       STATE     URL   SWARM   DOCKER   ERRORS
dev    -        virtualbox   Stopped                 v1.9.1
@z

@x
$ docker-machine ls --filter label=com.class.app=foo1 --filter label=com.class.app=foo2
NAME   ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
foo1   -        virtualbox   Running   tcp://192.168.99.105:2376           v1.9.1
foo2   *        virtualbox   Running   tcp://192.168.99.107:2376           v1.9.1
```
@y
$ docker-machine ls --filter label=com.class.app=foo1 --filter label=com.class.app=foo2
NAME   ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
foo1   -        virtualbox   Running   tcp://192.168.99.105:2376           v1.9.1
foo2   *        virtualbox   Running   tcp://192.168.99.107:2376           v1.9.1
```
@z

@x
## Formatting
@y
{% comment %}
## Formatting
{% endcomment %}
{: #formatting }
## フォーマット出力
@z

@x
The formatting option (`--format`) pretty-prints machines using a Go template.
@y
{% comment %}
The formatting option (`--format`) pretty-prints machines using a Go template.
{% endcomment %}
フォーマット出力を行うオプション（`--format`）は、Go 言語のテンプレートを使ってフォーマット出力を行います。
@z

@x
Valid placeholders for the Go template are listed below:
@y
{% comment %}
Valid placeholders for the Go template are listed below:
{% endcomment %}
Go 言語のテンプレートとして正しいプレースホルダーは、以下の一覧に示すものです。
@z

@x
| Placeholder    | Description                              |
|:---------------|:-----------------------------------------|
| .Name          | Machine name                             |
| .Active        | Is the machine active?                   |
| .ActiveHost    | Is the machine an active non-swarm host? |
| .ActiveSwarm   | Is the machine an active swarm master?   |
| .DriverName    | Driver name                              |
| .State         | Machine state (running, stopped...)      |
| .URL           | Machine URL                              |
| .Swarm         | Machine swarm name                       |
| .Error         | Machine errors                           |
| .DockerVersion | Docker Daemon version                    |
| .ResponseTime  | Time taken by the host to respond        |
@y
{% comment %}
| Placeholder    | Description                              |
|:---------------|:-----------------------------------------|
| .Name          | Machine name                             |
| .Active        | Is the machine active?                   |
| .ActiveHost    | Is the machine an active non-swarm host? |
| .ActiveSwarm   | Is the machine an active swarm master?   |
| .DriverName    | Driver name                              |
| .State         | Machine state (running, stopped...)      |
| .URL           | Machine URL                              |
| .Swarm         | Machine swarm name                       |
| .Error         | Machine errors                           |
| .DockerVersion | Docker Daemon version                    |
| .ResponseTime  | Time taken by the host to respond        |
{% endcomment %}
| プレースホルダー | 内容説明                                 |
|:-----------------|:-----------------------------------------|
| .Name            | マシン名                                 |
| .Active          | マシンがアクティブかどうか               |
| .ActiveHost      | マシンがアクティブな非Swarmホストか      |
| .ActiveSwarm     | マシンがアクティブなSwarmマスターか      |
| .DriverName      | ドライバー名                             |
| .State           | マシン状態 (実行中, 停止...)             |
| .URL             | マシン URL                               |
| .Swarm           | マシン Swarm 名                          |
| .Error           | マシンエラー                             |
| .DockerVersion   | Docker デーモンのバージョン              |
| .ResponseTime    | ホストのレスポンスにかかる時間           |
@z

@x
When using the `--format` option, the `ls` command either outputs the data exactly as the template declares or,
when using the table directive, includes column headers as well.
@y
{% comment %}
When using the `--format` option, the `ls` command either outputs the data exactly as the template declares or,
when using the table directive, includes column headers as well.
{% endcomment %}
`--format` オプションを利用した際、`ls` コマンドはテンプレートが定めるデータ内容をそのまま出力します。
また table ディレクティブを指定した場合は、カラムヘッダーも出力します。
@z

@x
The following example uses a template without headers and outputs the `Name` and `Driver` entries separated by a colon
for all running machines:
@y
{% comment %}
The following example uses a template without headers and outputs the `Name` and `Driver` entries separated by a colon
for all running machines:
{% endcomment %}
以下の例ではヘッダーの出力はせずに、1 つのテンプレートを使います。
これにより、実行中の全マシンについて `Name` と `Driver` をコロンで区切って出力します。
@z

@x
{% raw %}
```none
$ docker-machine ls --format "{{.Name}}: {{.DriverName}}"
default: virtualbox
ec2: amazonec2
```
{% endraw %}
@y
{% raw %}
```none
$ docker-machine ls --format "{{.Name}}: {{.DriverName}}"
default: virtualbox
ec2: amazonec2
```
{% endraw %}
@z

@x
To list all machine names with their driver in a table format you can use:
@y
{% comment %}
To list all machine names with their driver in a table format you can use:
{% endcomment %}
全マシンの名前とドライバーを table 形式で一覧表示するには、以下を実行します。
@z

@x
{% raw %}
```none
$ docker-machine ls --format "table {{.Name}} {{.DriverName}}"
NAME     DRIVER
default  virtualbox
ec2      amazonec2
```
{% endraw %}
@y
{% raw %}
```none
$ docker-machine ls --format "table {{.Name}} {{.DriverName}}"
NAME     DRIVER
default  virtualbox
ec2      amazonec2
```
{% endraw %}
@z
