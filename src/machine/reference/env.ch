%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Set environment variables on a machine
keywords: machine, env, subcommand
title: docker-machine env
---
@y
---
description: Set environment variables on a machine
keywords: machine, env, subcommand
title: docker-machine env
---
@z

@x
Set environment variables to dictate that `docker` should run a command against
a particular machine.
@y
{% comment %}
Set environment variables to dictate that `docker` should run a command against
a particular machine.
{% endcomment %}
`docker` コマンドが、特定のマシン向けのコマンドを実行できるように、環境変数の設定を行います。
@z

@x
```bash
$ docker-machine env --help

Usage: docker-machine env [OPTIONS] [arg...]

Display the commands to set up the environment for the Docker client

Description:
   Argument is a machine name.

Options:

   --swarm	Display the Swarm config instead of the Docker daemon
   --shell 	Force environment to be configured for a specified shell: [fish, cmd, powershell, tcsh], default is sh/bash
   --unset, -u	Unset variables instead of setting them
   --no-proxy	Add machine IP to NO_PROXY environment variable
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```bash
$ docker-machine env --help

Usage: docker-machine env [OPTIONS] [arg...]

Display the commands to set up the environment for the Docker client

Description:
   Argument is a machine name.

Options:

   --swarm	Display the Swarm config instead of the Docker daemon
   --shell 	Force environment to be configured for a specified shell: [fish, cmd, powershell, tcsh], default is sh/bash
   --unset, -u	Unset variables instead of setting them
   --no-proxy	Add machine IP to NO_PROXY environment variable
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
$ docker-machine env --help

利用方法: docker-machine env [オプション] [arg...]

Docker クライアントに対しての環境設定を行うコマンドを表示します。

内容説明:
   引数にはマシン名を指定します。

オプション:

   --swarm	Docker デーモンではなく Swarm の設定内容を表示します。
   --shell 	指定されたシェル向けに設定された環境表示とします。[fish, cmd, powershell, tcsh] デフォルトは sh/bash
   --unset, -u	環境設定を解除します。
   --no-proxy	マシン IP を環境変数 NO_PROXY に追加します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
`docker-machine env machinename` prints out `export` commands which can be
run in a subshell. Running `docker-machine env -u` prints `unset` commands
which reverse this effect.
@y
{% comment %}
`docker-machine env machinename` prints out `export` commands which can be
run in a subshell. Running `docker-machine env -u` prints `unset` commands
which reverse this effect.
{% endcomment %}
`docker-machine env マシン名` は、サブシェル内で実行可能な `export` コマンドを表示します。
`docker-machine env -u` を実行すると、それとは逆に `unset` コマンドを表示します。
@z

@x
```bash
$ env | grep DOCKER
$ eval "$(docker-machine env dev)"
$ env | grep DOCKER
@y
```bash
$ env | grep DOCKER
$ eval "$(docker-machine env dev)"
$ env | grep DOCKER
@z

@x
DOCKER_HOST=tcp://192.168.99.101:2376
DOCKER_CERT_PATH=/Users/nathanleclaire/.docker/machines/.client
DOCKER_TLS_VERIFY=1
DOCKER_MACHINE_NAME=dev
$ # If you run a docker command, now it runs against that host.
$ eval "$(docker-machine env -u)"
$ env | grep DOCKER
$ # The environment variables have been unset.
```
@y
DOCKER_HOST=tcp://192.168.99.101:2376
DOCKER_CERT_PATH=/Users/nathanleclaire/.docker/machines/.client
DOCKER_TLS_VERIFY=1
DOCKER_MACHINE_NAME=dev
$ # If you run a docker command, now it runs against that host.
$ eval "$(docker-machine env -u)"
$ env | grep DOCKER
$ # The environment variables have been unset.
```
@z

@x
The output described above is intended for the shells `bash` and `zsh` (if
you're not sure which shell you're using, there's a very good possibility that
it's `bash`). However, these are not the only shells which Docker Machine
supports. Docker Machine detects the shells available in your environment and lists them.
Docker supports `bash`, `cmd`, `powershell`, and `emacs`.
@y
{% comment %}
The output described above is intended for the shells `bash` and `zsh` (if
you're not sure which shell you're using, there's a very good possibility that
it's `bash`). However, these are not the only shells which Docker Machine
supports. Docker Machine detects the shells available in your environment and lists them.
Docker supports `bash`, `cmd`, `powershell`, and `emacs`.
{% endcomment %}
上に示した出力結果は `bash` または `zsh` 向けのものです。
（どのシェルを使っているのかわからない場合であっても、たいていは `bash` である可能性が高いです。）
ただし Docker Machine がサポートするシェルは、これだけではありません。
Docker Machine は、利用環境内のシェルを検知して、結果を表示します。
Docker では `bash`、`cmd`、`powershell`、`emacs` がサポートされています。
@z

@x
If you are using `fish` and the `SHELL` environment variable is correctly set to
the path where `fish` is located, `docker-machine env name` prints out the
values in the format which `fish` expects:
@y
{% comment %}
If you are using `fish` and the `SHELL` environment variable is correctly set to
the path where `fish` is located, `docker-machine env name` prints out the
values in the format which `fish` expects:
{% endcomment %}
利用しているシェルが `fish` であって、環境変数 `SHELL` に `fish` へのパスが正しく設定されていれば、`docker-machine env name` の実行によって、`fish` に適した書式により結果が表示されます。
@z

@x
```fish
set -x DOCKER_TLS_VERIFY 1;
set -x DOCKER_CERT_PATH "/Users/nathanleclaire/.docker/machine/machines/overlay";
set -x DOCKER_HOST tcp://192.168.99.102:2376;
set -x DOCKER_MACHINE_NAME overlay
# Run this command to configure your shell:
# eval "$(docker-machine env overlay)"
```
@y
```fish
set -x DOCKER_TLS_VERIFY 1;
set -x DOCKER_CERT_PATH "/Users/nathanleclaire/.docker/machine/machines/overlay";
set -x DOCKER_HOST tcp://192.168.99.102:2376;
set -x DOCKER_MACHINE_NAME overlay
# Run this command to configure your shell:
# eval "$(docker-machine env overlay)"
```
@z

@x
If you are on Windows and using either PowerShell or `cmd.exe`, `docker-machine env`
 Docker Machine should now detect your shell automatically. If the automatic detection does not work, you
 can still override it using the `--shell` flag for `docker-machine env`.
@y
{% comment %}
If you are on Windows and using either PowerShell or `cmd.exe`, `docker-machine env`
 Docker Machine should now detect your shell automatically. If the automatic detection does not work, you
 can still override it using the `--shell` flag for `docker-machine env`.
{% endcomment %}
Windows 上において PowerShell や `cmd.exe` を利用している場合は、`docker-machine env` によって Docker Machine はシェルを自動検出します。
この自動検出が動作しなかった場合は、`docker-machine env` において `--shell` フラグを使ってシェル指定をオーバーライドできます。
@z

@x
For PowerShell:
@y
{% comment %}
For PowerShell:
{% endcomment %}
PowerShell 向けには以下を実行します。
@z

@x
```bash
$ docker-machine.exe env --shell powershell dev
@y
```bash
$ docker-machine.exe env --shell powershell dev
@z

@x
$Env:DOCKER_TLS_VERIFY = "1"
$Env:DOCKER_HOST = "tcp://192.168.99.101:2376"
$Env:DOCKER_CERT_PATH = "C:\Users\captain\.docker\machine\machines\dev"
$Env:DOCKER_MACHINE_NAME = "dev"
# Run this command to configure your shell:
# docker-machine.exe env --shell=powershell dev | Invoke-Expression
```
@y
$Env:DOCKER_TLS_VERIFY = "1"
$Env:DOCKER_HOST = "tcp://192.168.99.101:2376"
$Env:DOCKER_CERT_PATH = "C:\Users\captain\.docker\machine\machines\dev"
$Env:DOCKER_MACHINE_NAME = "dev"
# Run this command to configure your shell:
# docker-machine.exe env --shell=powershell dev | Invoke-Expression
```
@z

@x
For `cmd.exe`:
@y
{% comment %}
For `cmd.exe`:
{% endcomment %}
`cmd.exe` 向けには以下を実行します。
@z

@x
```bash
$ docker-machine.exe env --shell cmd dev
@y
```bash
$ docker-machine.exe env --shell cmd dev
@z

@x
set DOCKER_TLS_VERIFY=1
set DOCKER_HOST=tcp://192.168.99.101:2376
set DOCKER_CERT_PATH=C:\Users\captain\.docker\machine\machines\dev
set DOCKER_MACHINE_NAME=dev
# Run this command to configure your shell: copy and paste the above values into your command prompt
```
@y
set DOCKER_TLS_VERIFY=1
set DOCKER_HOST=tcp://192.168.99.101:2376
set DOCKER_CERT_PATH=C:\Users\captain\.docker\machine\machines\dev
set DOCKER_MACHINE_NAME=dev
# Run this command to configure your shell: copy and paste the above values into your command prompt
```
@z

@x
>**Tip:** See also, how to [unset environment variables in the current shell](../get-started.md#unset-environment-variables-in-the-current-shell).
@y
{% comment %}
>**Tip:** See also, how to [unset environment variables in the current shell](../get-started.md#unset-environment-variables-in-the-current-shell).
{% endcomment %}
>**ヒント** 
>
> [カレントシェルの環境変数クリア](../get-started.md#unset-environment-variables-in-the-current-shell) も参照してください。
@z

@x
## Excluding the created machine from proxies
@y
{% comment %}
## Excluding the created machine from proxies
{% endcomment %}
{: #excluding-the-created-machine-from-proxies }
## プロキシー設定における生成マシンの除外
@z

@x
The env command supports a `--no-proxy` flag which ensures that the created
machine's IP address is added to the [`NO_PROXY`/`no_proxy` environment
variable](https://wiki.archlinux.org/index.php/Proxy_settings).
@y
{% comment %}
The env command supports a `--no-proxy` flag which ensures that the created
machine's IP address is added to the [`NO_PROXY`/`no_proxy` environment
variable](https://wiki.archlinux.org/index.php/Proxy_settings).
{% endcomment %}
env コマンドには `--no-proxy` フラグがあります。
これは生成されるマシンの IP アドレスを [環境変数 `NO_PROXY`/`no_proxy`](https://wiki.archlinux.org/index.php/Proxy_settings) に追加します。
@z

@x
This is useful when using `docker-machine` with a local VM provider, such as
`virtualbox` or `vmwarefusion`, in network environments where an HTTP proxy is
required for internet access.
@y
{% comment %}
This is useful when using `docker-machine` with a local VM provider, such as
`virtualbox` or `vmwarefusion`, in network environments where an HTTP proxy is
required for internet access.
{% endcomment %}
これが役に立つのは、`virtualbox` や `vmwarefusion` のようなローカル VM プロバイダーにおいて `docker-machine` を利用する場合です。
そのような環境では、インターネットアクセスにおいて HTTP プロキシーが必要になるからです。
@z

@x
```bash
$ docker-machine env --no-proxy default
@y
```bash
$ docker-machine env --no-proxy default
@z

@x
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.104:2376"
export DOCKER_CERT_PATH="/Users/databus23/.docker/machine/certs"
export DOCKER_MACHINE_NAME="default"
export NO_PROXY="192.168.99.104"
# Run this command to configure your shell:
# eval "$(docker-machine env default)"
```
@y
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.104:2376"
export DOCKER_CERT_PATH="/Users/databus23/.docker/machine/certs"
export DOCKER_MACHINE_NAME="default"
export NO_PROXY="192.168.99.104"
# Run this command to configure your shell:
# eval "$(docker-machine env default)"
```
@z

@x
You may also want to visit the documentation on setting `HTTP_PROXY` for the
created daemon using the `--engine-env` flag for 
[`docker-machine create`](create.md#specifying-configuration-options-for-the-created-docker-engine).
@y
{% comment %}
You may also want to visit the documentation on setting `HTTP_PROXY` for the
created daemon using the `--engine-env` flag for 
[`docker-machine create`](create.md#specifying-configuration-options-for-the-created-docker-engine).
{% endcomment %}
生成済みのデーモンに対して `HTTP_PROXY` の設定を行う方法も、ドキュメントを確認することが必要でしょう。
その際には [`docker-machine create`](create.md#specifying-configuration-options-for-the-created-docker-engine) において `--engine-env` フラグを利用します。
@z
