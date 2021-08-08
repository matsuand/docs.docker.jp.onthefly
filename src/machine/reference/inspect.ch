%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Inspect information about a machine
keywords: machine, inspect, subcommand
title: docker-machine inspect
---
@y
---
description: マシンに関する情報を表示します。
keywords: machine, inspect, subcommand
title: docker-machine inspect
---
@z

@x
```none
Usage: docker-machine inspect [OPTIONS] [arg...]

Inspect information about a machine

Description:
   Argument is a machine name.

Options:
   --format, -f 	Format the output using the given go template.
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
Usage: docker-machine inspect [OPTIONS] [arg...]

Inspect information about a machine

Description:
   Argument is a machine name.

Options:
   --format, -f 	Format the output using the given go template.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-machine inspect [オプション] [arg...]

マシンに関する情報を表示します。

内容説明:
   引数にはマシン名を指定します。

オプション:
   --format, -f 	指定したGo言語テンプレートによりフォーマット出力を行います。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
By default, this renders information about a machine as JSON. If a format is
specified, the given template is executed for each result.
@y
このコマンドが出力するマシン情報は、デフォルトでは JSON 形式です。
フォーマットが指定された場合は、出力に対してそのフォーマットテンプレートが適用されます。
@z

@x
Go's [text/template](http://golang.org/pkg/text/template/) package
describes all the details of the format.
@y
Go 言語の [text/template](http://golang.org/pkg/text/template/) パッケージにおいて、フォーマットの詳細が説明されています。
@z

@x
In addition to the `text/template` syntax, there are some additional functions,
`json` and `prettyjson`, which can be used to format the output as JSON (documented below).
@y
`text/template`の文法に加えて、追加の機能として`json`と`prettyjson`があります。
これは JSON 書式の出力をフォーマットするために用いられます。
（以降に説明します。）
@z

@x
## Examples
@y
{: #examples }
## 利用例
@z

@x
**List all the details of a machine:**
@y
**マシン情報詳細の一覧表示**
@z

@x
This is the default usage of `inspect`.
@y
これが`inspect`のデフォルトの利用方法です。
@z

@x
```console
$ docker-machine inspect dev
@y
```console
$ docker-machine inspect dev
@z

@x
{
    "DriverName": "virtualbox",
    "Driver": {
        "MachineName": "docker-host-128be8d287b2028316c0ad5714b90bcfc11f998056f2f790f7c1f43f3d1e6eda",
        "SSHPort": 55834,
        "Memory": 1024,
        "DiskSize": 20000,
        "Boot2DockerURL": "",
        "IPAddress": "192.168.5.99"
    },
    ...
}
```
@y
{
    "DriverName": "virtualbox",
    "Driver": {
        "MachineName": "docker-host-128be8d287b2028316c0ad5714b90bcfc11f998056f2f790f7c1f43f3d1e6eda",
        "SSHPort": 55834,
        "Memory": 1024,
        "DiskSize": 20000,
        "Boot2DockerURL": "",
        "IPAddress": "192.168.5.99"
    },
    ...
}
```
@z

@x
**Get a machine's IP address:**
@y
**マシンの IP アドレス取得**
@z

@x
For the most part, you can pick out any field from the JSON in a fairly
straightforward manner.
@y
JSON 書式においては、ほとんどの項目をごく普通の方法で引き出すことができます。
@z

@x
{% raw %}
```console
$ docker-machine inspect --format='{{.Driver.IPAddress}}' dev
@y
{% raw %}
```console
$ docker-machine inspect --format='{{.Driver.IPAddress}}' dev
@z

@x
192.168.5.99
```
{% endraw %}
@y
192.168.5.99
```
{% endraw %}
@z

@x
**Formatting details:**
@y
**詳細フォーマット**
@z

@x
If you want a subset of information formatted as JSON, you can use the `json`
function in the template.
@y
JSON 書式から部分的に情報を引き出したい場合には、テンプレートとして`json`機能を利用することができます。
@z

@x
```console
$ docker-machine inspect --format='{{json .Driver}}' dev-fusion
@y
```console
$ docker-machine inspect --format='{{json .Driver}}' dev-fusion
@z

@x
{"Boot2DockerURL":"","CPUS":8,"CPUs":8,"CaCertPath":"/Users/hairyhenderson/.docker/machine/certs/ca.pem","DiskSize":20000,"IPAddress":"172.16.62.129","ISO":"/Users/hairyhenderson/.docker/machine/machines/dev-fusion/boot2docker-1.5.0-GH747.iso","MachineName":"dev-fusion","Memory":1024,"PrivateKeyPath":"/Users/hairyhenderson/.docker/machine/certs/ca-key.pem","SSHPort":22,"SSHUser":"docker","SwarmDiscovery":"","SwarmHost":"tcp://0.0.0.0:3376","SwarmMaster":false}
```
@y
{"Boot2DockerURL":"","CPUS":8,"CPUs":8,"CaCertPath":"/Users/hairyhenderson/.docker/machine/certs/ca.pem","DiskSize":20000,"IPAddress":"172.16.62.129","ISO":"/Users/hairyhenderson/.docker/machine/machines/dev-fusion/boot2docker-1.5.0-GH747.iso","MachineName":"dev-fusion","Memory":1024,"PrivateKeyPath":"/Users/hairyhenderson/.docker/machine/certs/ca-key.pem","SSHPort":22,"SSHUser":"docker","SwarmDiscovery":"","SwarmHost":"tcp://0.0.0.0:3376","SwarmMaster":false}
```
@z

@x
While this is usable, it's not very human-readable. For this reason, there is
`prettyjson`:
@y
上は十分利用できるものですが、人間が読むには不便です。
この理由から`prettyjson`があります。
@z

@x
{% raw %}
```console
$ docker-machine inspect --format='{{prettyjson .Driver}}' dev-fusion
@y
{% raw %}
```console
$ docker-machine inspect --format='{{prettyjson .Driver}}' dev-fusion
@z

@x
{
  "Boot2DockerURL": "",
  "CPUS": 8,
  "CPUs": 8,
  "CaCertPath": "/Users/hairyhenderson/.docker/machine/certs/ca.pem",
  "DiskSize": 20000,
  "IPAddress": "172.16.62.129",
  "ISO": "/Users/hairyhenderson/.docker/machine/machines/dev-fusion/boot2docker-1.5.0-GH747.iso",
  "MachineName": "dev-fusion",
  "Memory": 1024,
  "PrivateKeyPath": "/Users/hairyhenderson/.docker/machine/certs/ca-key.pem",
  "SSHPort": 22,
  "SSHUser": "docker",
  "SwarmDiscovery": "",
  "SwarmHost": "tcp://0.0.0.0:3376",
  "SwarmMaster": false
}
{% endraw %}
```
@y
{
  "Boot2DockerURL": "",
  "CPUS": 8,
  "CPUs": 8,
  "CaCertPath": "/Users/hairyhenderson/.docker/machine/certs/ca.pem",
  "DiskSize": 20000,
  "IPAddress": "172.16.62.129",
  "ISO": "/Users/hairyhenderson/.docker/machine/machines/dev-fusion/boot2docker-1.5.0-GH747.iso",
  "MachineName": "dev-fusion",
  "Memory": 1024,
  "PrivateKeyPath": "/Users/hairyhenderson/.docker/machine/certs/ca-key.pem",
  "SSHPort": 22,
  "SSHUser": "docker",
  "SwarmDiscovery": "",
  "SwarmHost": "tcp://0.0.0.0:3376",
  "SwarmMaster": false
}
{% endraw %}
```
@z
