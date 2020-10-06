%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Use the Docker command line"
description: "Docker's CLI command description and usage"
keywords: "Docker, Docker documentation, CLI, command line"
---
@y
---
title: "Docker コマンドラインの利用"
description: "Docker's CLI command description and usage"
keywords: "Docker, Docker documentation, CLI, command line"
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
# docker
@y
# docker
@z

@x
To list available commands, either run `docker` with no parameters
or execute `docker help`:
@y
{% comment %}
To list available commands, either run `docker` with no parameters
or execute `docker help`:
{% endcomment %}
利用可能なコマンド一覧を確認するには、パラメーターをつけずに `docker` を実行するか、あるいは `docker help` を実行します。
@z

@x
```bash
$ docker
Usage: docker [OPTIONS] COMMAND [ARG...]
       docker [ --help | -v | --version ]
@y
```bash
$ docker
Usage: docker [OPTIONS] COMMAND [ARG...]
       docker [ --help | -v | --version ]
@z

@x
A self-sufficient runtime for containers.
@y
A self-sufficient runtime for containers.
@z

@x
Options:
      --config string      Location of client config files (default "/root/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")
  -D, --debug              Enable debug mode
      --help               Print usage
  -H, --host value         Daemon socket(s) to connect to (default [])
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/root/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/root/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit
@y
Options:
      --config string      Location of client config files (default "/root/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")
  -D, --debug              Enable debug mode
      --help               Print usage
  -H, --host value         Daemon socket(s) to connect to (default [])
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/root/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/root/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit
@z

@x
Commands:
    attach    Attach to a running container
    # […]
```
@y
Commands:
    attach    Attach to a running container
    # […]
```
@z

@x
## Description
@y
{% comment %}
## Description
{% endcomment %}
{: #description }
## 内容説明
@z

@x
Depending on your Docker system configuration, you may be required to preface
each `docker` command with `sudo`. To avoid having to use `sudo` with the
`docker` command, your system administrator can create a Unix group called
`docker` and add users to it.
@y
{% comment %}
Depending on your Docker system configuration, you may be required to preface
each `docker` command with `sudo`. To avoid having to use `sudo` with the
`docker` command, your system administrator can create a Unix group called
`docker` and add users to it.
{% endcomment %}
Docker に対するシステム設定の仕方によっては、`docker run` コマンドの実行時に `sudo` をつけることが必要かもしれません。
`sudo` をつけずに `docker` コマンドを実行できるようにするには、システム管理者が `docker` という名のグループを生成して、そこにユーザーを追加するようにします。
@z

@x
For more information about installing Docker or `sudo` configuration, refer to
the [installation](https://docs.docker.com/install/) instructions for your operating system.
@y
{% comment %}
For more information about installing Docker or `sudo` configuration, refer to
the [installation](https://docs.docker.com/install/) instructions for your operating system.
{% endcomment %}
Docker のインストールや `sudo` の設定に関する詳細は、各オペレーティングシステムにおける [インストール](https://docs.docker.com/install/) のドキュメントを参照してください。
@z

@x
## Environment variables
@y
{% comment %}
## Environment variables
{% endcomment %}
{: #environment-variables }
## 環境変数
@z

@x
For easy reference, the following list of environment variables are supported
by the `docker` command line:
@y
{% comment %}
For easy reference, the following list of environment variables are supported
by the `docker` command line:
{% endcomment %}
以下に示す環境変数が `docker` のコマンドラインにおいてサポートされているので、わかりやすく一覧として示します。
@z

@x
* `DOCKER_API_VERSION` The API version to use (e.g. `1.19`)
* `DOCKER_CONFIG` The location of your client configuration files.
* `DOCKER_CERT_PATH` The location of your authentication keys.
* `DOCKER_CLI_EXPERIMENTAL` Enable experimental features for the cli (e.g. `enabled` or `disabled`)
* `DOCKER_DRIVER` The graph driver to use.
* `DOCKER_HOST` Daemon socket to connect to.
* `DOCKER_NOWARN_KERNEL_VERSION` Prevent warnings that your Linux kernel is
  unsuitable for Docker.
* `DOCKER_RAMDISK` If set this will disable 'pivot_root'.
* `DOCKER_STACK_ORCHESTRATOR` Configure the default orchestrator to use when using `docker stack` management commands.
* `DOCKER_TLS` When set Docker uses TLS.
* `DOCKER_TLS_VERIFY` When set Docker uses TLS and verifies the remote.
* `DOCKER_CONTENT_TRUST` When set Docker uses notary to sign and verify images.
  Equates to `--disable-content-trust=false` for build, create, pull, push, run.
* `DOCKER_CONTENT_TRUST_SERVER` The URL of the Notary server to use. This defaults
  to the same URL as the registry.
* `DOCKER_HIDE_LEGACY_COMMANDS` When set, Docker hides "legacy" top-level commands (such as `docker rm`, and
  `docker pull`) in `docker help` output, and only `Management commands` per object-type (e.g., `docker container`) are
  printed. This may become the default in a future release, at which point this environment-variable is removed.
* `DOCKER_TMPDIR` Location for temporary Docker files.
* `DOCKER_CONTEXT` Specify the context to use (overrides DOCKER_HOST env var and default context set with "docker context use")
* `DOCKER_DEFAULT_PLATFORM` Specify the default platform for the commands that take the `--platform` flag.
@y
{% comment %}
* `DOCKER_API_VERSION` The API version to use (e.g. `1.19`)
* `DOCKER_CONFIG` The location of your client configuration files.
* `DOCKER_CERT_PATH` The location of your authentication keys.
* `DOCKER_CLI_EXPERIMENTAL` Enable experimental features for the cli (e.g. `enabled` or `disabled`)
* `DOCKER_DRIVER` The graph driver to use.
* `DOCKER_HOST` Daemon socket to connect to.
* `DOCKER_NOWARN_KERNEL_VERSION` Prevent warnings that your Linux kernel is
  unsuitable for Docker.
* `DOCKER_RAMDISK` If set this will disable 'pivot_root'.
* `DOCKER_STACK_ORCHESTRATOR` Configure the default orchestrator to use when using `docker stack` management commands.
* `DOCKER_TLS` When set Docker uses TLS.
* `DOCKER_TLS_VERIFY` When set Docker uses TLS and verifies the remote.
* `DOCKER_CONTENT_TRUST` When set Docker uses notary to sign and verify images.
  Equates to `--disable-content-trust=false` for build, create, pull, push, run.
* `DOCKER_CONTENT_TRUST_SERVER` The URL of the Notary server to use. This defaults
  to the same URL as the registry.
* `DOCKER_HIDE_LEGACY_COMMANDS` When set, Docker hides "legacy" top-level commands (such as `docker rm`, and
  `docker pull`) in `docker help` output, and only `Management commands` per object-type (e.g., `docker container`) are
  printed. This may become the default in a future release, at which point this environment-variable is removed.
* `DOCKER_TMPDIR` Location for temporary Docker files.
* `DOCKER_CONTEXT` Specify the context to use (overrides DOCKER_HOST env var and default context set with "docker context use")
* `DOCKER_DEFAULT_PLATFORM` Specify the default platform for the commands that take the `--platform` flag.
{% endcomment %}
* `DOCKER_API_VERSION` 利用している API バージョン（たとえば `1.19` など）
* `DOCKER_CONFIG` クライアントの設定ファイルが置かれている場所。
* `DOCKER_CERT_PATH` 認証鍵データが置かれている場所。
* `DOCKER_CLI_EXPERIMENTAL` CLI において試験的機能（experimental feature）を有効にします。（`enabled` または `disabled`）
* `DOCKER_DRIVER` 利用するグラフドライバー。
* `DOCKER_HOST` デーモンソケットの接続先。
* `DOCKER_NOWARN_KERNEL_VERSION` 利用しているカーネルが Docker の利用に不適切であっても警告を表示しません。
* `DOCKER_RAMDISK` これが設定されている場合、'pivot_root' を無効にします。
* `DOCKER_STACK_ORCHESTRATOR` 管理コマンド `docker stack` を利用している場合に、デフォルトオーケストレーターを設定します。
* `DOCKER_TLS` これが設定されている場合、TLS を利用します。
* `DOCKER_TLS_VERIFY` これが設定されている場合、TLS を利用し、リモートを検証します。
* `DOCKER_CONTENT_TRUST` これが設定されている場合、Notary を用いてイメージの署名と検証を行います。
  build, create, pull, push, run においては `--disable-content-trust=false` とすることと同じです。
* `DOCKER_CONTENT_TRUST_SERVER` 利用する Notary サーバーの URL。このデフォルトは Registry と同一 URL です。
* `DOCKER_HIDE_LEGACY_COMMANDS` これが設定されている場合、「かつての古い」トップレベルコマンド（`docker rm` や `docker pull`）を、ヘルプ出力に表示しないようにします。
  ただしオブジェクト指定を行うタイプの「管理コマンド」（たとえば `docker container`）では表示します。
  将来のリリースにおいては、これがデフォルトになるかもしれません。
  その際には本環境変数は削除されます。
* `DOCKER_TMPDIR` Docker の一時的なファイルが置かれている場所。
* `DOCKER_CONTEXT` 利用するコンテキストを指定します。
  （これは環境変数 DOCKER_HOST と `docker context use` によって設定されたデフォルトコンテキストをオーバーライドします。）
* `DOCKER_DEFAULT_PLATFORM` `--platform` フラグを持つコマンドにおいてデフォルトのプラットフォームを指定します。
@z

@x
Because Docker is developed using Go, you can also use any environment
variables used by the Go runtime. In particular, you may find these useful:
@y
{% comment %}
Because Docker is developed using Go, you can also use any environment
variables used by the Go runtime. In particular, you may find these useful:
{% endcomment %}
Docker は Go 言語を使って開発されているため、Go 言語のランタイムにおいて用いられる環境変数はすべて利用することができます。
特に以下のものが大変便利です。
@z

@x
* `HTTP_PROXY`
* `HTTPS_PROXY`
* `NO_PROXY`
@y
* `HTTP_PROXY`
* `HTTPS_PROXY`
* `NO_PROXY`
@z

@x
These Go environment variables are case-insensitive. See the
[Go specification](http://golang.org/pkg/net/http/) for details on these
variables.
@y
{% comment %}
These Go environment variables are case-insensitive. See the
[Go specification](http://golang.org/pkg/net/http/) for details on these
variables.
{% endcomment %}
この Go 言語環境変数は、英字の大文字小文字を区別しません。
こういった環境変数の詳細については [Go 言語の仕様](http://golang.org/pkg/net/http/) を参照してください。
@z

@x
### Configuration files
@y
{% comment %}
### Configuration files
{% endcomment %}
{: #configuration-files }
### 設定ファイル
@z

@x
By default, the Docker command line stores its configuration files in a
directory called `.docker` within your `$HOME` directory.
@y
{% comment %}
By default, the Docker command line stores its configuration files in a
directory called `.docker` within your `$HOME` directory.
{% endcomment %}
Docker コマンドラインが利用する設定ファイルは、デフォルトで `$HOME` ディレクトリ配下の `.docker` というディレクトリに保存されます。
@z

@x
Docker manages most of the files in the configuration directory
and you should not modify them. However, you *can* modify the
`config.json` file to control certain aspects of how the `docker`
command behaves.
@y
{% comment %}
Docker manages most of the files in the configuration directory
and you should not modify them. However, you *can* modify the
`config.json` file to control certain aspects of how the `docker`
command behaves.
{% endcomment %}
Docker はこの設定ディレクトリにあるファイルのほとんどを管理しているため、編集はしないでください。
ただし `config.json` ファイルだけは **編集可能** です。
これは `docker` コマンドが所定の動作となるように制御します。
@z

@x
You can modify the `docker` command behavior using environment
variables or command-line options. You can also use options within
`config.json` to modify some of the same behavior. If an environment variable
and the `--config` flag are set, the flag takes precedent over the environment
variable. Command line options override environment variables and environment
variables override properties you specify in a `config.json` file.
@y
{% comment %}
You can modify the `docker` command behavior using environment
variables or command-line options. You can also use options within
`config.json` to modify some of the same behavior. If an environment variable
and the `--config` flag are set, the flag takes precedent over the environment
variable. Command line options override environment variables and environment
variables override properties you specify in a `config.json` file.
{% endcomment %}
`docker` コマンドの動作は、環境変数やコマンドラインオプションを使って変更することができます。
`config.json` ファイル内にオプションを指定して、動作変更ができるものもあります。
環境変数と `--config` フラグが同時に設定されている場合、環境変数よりもフラグの設定値が優先されます。
コマンドラインオプションは環境変数をオーバーライドします。
また環境変数は `config.json` ファイルに指定されたプロパティをオーバーライドします。
@z

@x
### Change the `.docker` directory
@y
{% comment %}
### Change the `.docker` directory
{% endcomment %}
{: #change-the-docker-directory }
### `.docker` ディレクトリの変更
@z

@x
To specify a different directory, use the `DOCKER_CONFIG`
environment variable or the `--config` command line option. If both are
specified, then the `--config` option overrides the `DOCKER_CONFIG` environment
variable. The example below overrides the `docker ps` command using a
`config.json` file located in the `~/testconfigs/` directory.
@y
{% comment %}
To specify a different directory, use the `DOCKER_CONFIG`
environment variable or the `--config` command line option. If both are
specified, then the `--config` option overrides the `DOCKER_CONFIG` environment
variable. The example below overrides the `docker ps` command using a
`config.json` file located in the `~/testconfigs/` directory.
{% endcomment %}
設定ディレクトリを別ディレクトリに指定する場合は、環境変数 `DOCKER_CONFIG` を利用するか、あるいはコマンドラインオプション `--config` を利用します。
両方が指定された場合、`--config` オプションが環境変数 `DOCKER_CONFIG` をオーバーライドします。
以下の例は、`~/testconfigs/` ディレクトリ内にある `config.json` を利用して `docker ps` コマンドの設定内容をオーバーライドするものです。
@z

@x
```bash
$ docker --config ~/testconfigs/ ps
```
@y
```bash
$ docker --config ~/testconfigs/ ps
```
@z

@x
This flag only applies to whatever command is being ran. For persistent
configuration, you can set the `DOCKER_CONFIG` environment variable in your
shell (e.g. `~/.profile` or `~/.bashrc`). The example below sets the new
directory to be `HOME/newdir/.docker`.
@y
{% comment %}
This flag only applies to whatever command is being ran. For persistent
configuration, you can set the `DOCKER_CONFIG` environment variable in your
shell (e.g. `~/.profile` or `~/.bashrc`). The example below sets the new
directory to be `HOME/newdir/.docker`.
{% endcomment %}
このフラグは実行されたコマンドにだけ適用されます。
指定内容を永続的に利用したい場合は、シェル（`~/.profile` または `~/.bashrc`）内において環境変数 `DOCKER_CONFIG` を設定するようにします。
以下の例では、別ディレクトリ `$HOME/newdir/.docker` を利用しています。
@z

@x
```bash
echo export DOCKER_CONFIG=$HOME/newdir/.docker > ~/.profile
```
@y
```bash
echo export DOCKER_CONFIG=$HOME/newdir/.docker > ~/.profile
```
@z

@x
### `config.json` properties
@y
{% comment %}
### `config.json` properties
{% endcomment %}
{: #configjson-properties }
### `config.json` 内のプロパティ
@z

@x
The `config.json` file stores a JSON encoding of several properties:
@y
{% comment %}
The `config.json` file stores a JSON encoding of several properties:
{% endcomment %}
`config.json` ファイルは JSON 形式により複数のプロパティを設定します。
@z

@x
The property `HttpHeaders` specifies a set of headers to include in all messages
sent from the Docker client to the daemon. Docker does not try to interpret or
understand these header; it simply puts them into the messages. Docker does
not allow these headers to change any headers it sets for itself.
@y
{% comment %}
The property `HttpHeaders` specifies a set of headers to include in all messages
sent from the Docker client to the daemon. Docker does not try to interpret or
understand these header; it simply puts them into the messages. Docker does
not allow these headers to change any headers it sets for itself.
{% endcomment %}
`HttpHeaders` プロパティは Docker クライアントからデーモンに向けて送信されるメッセージのすべてに対して、付与するヘッダー文字列を指定します。
Docker はその文字列内容を解釈したり理解するようなことはありません。
単にメッセージに対して文字列を付与するだけです。
なおこのメッセージの付与を通じて、他のメッセージを変更するようなことはできません。
@z

@x
The property `psFormat` specifies the default format for `docker ps` output.
When the `--format` flag is not provided with the `docker ps` command,
Docker's client uses this property. If this property is not set, the client
falls back to the default table format. For a list of supported formatting
directives, see the
[**Formatting** section in the `docker ps` documentation](ps.md)
@y
{% comment %}
The property `psFormat` specifies the default format for `docker ps` output.
When the `--format` flag is not provided with the `docker ps` command,
Docker's client uses this property. If this property is not set, the client
falls back to the default table format. For a list of supported formatting
directives, see the
[**Formatting** section in the `docker ps` documentation](ps.md)
{% endcomment %}
`psFormat` プロパティは `docker ps` の出力におけるデフォルト書式を指定します。
`docker ps` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこのプロパティを利用します。
このプロパティが設定されていない場合、クライアントはデフォルトの表書式を採用します。、
サポートされているフォーマットディレクティブの一覧は [`docker ps` の **出力書式** の節](ps.md) を参照してください。
@z

@x
The property `imagesFormat` specifies the default format for `docker images` output.
When the `--format` flag is not provided with the `docker images` command,
Docker's client uses this property. If this property is not set, the client
falls back to the default table format. For a list of supported formatting
directives, see the [**Formatting** section in the `docker images` documentation](images.md)
@y
{% comment %}
The property `imagesFormat` specifies the default format for `docker images` output.
When the `--format` flag is not provided with the `docker images` command,
Docker's client uses this property. If this property is not set, the client
falls back to the default table format. For a list of supported formatting
directives, see the [**Formatting** section in the `docker images` documentation](images.md)
{% endcomment %}
`imagesFormat` プロパティは `docker images` の出力におけるデフォルト書式を指定します。
`docker images` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこのプロパティを利用します。
このプロパティが設定されていない場合、クライアントはデフォルトの表書式を採用します。、
サポートされているフォーマットディレクティブの一覧は [`docker images` の **出力書式** の節](images.md) を参照してください。
@z

@x
The property `pluginsFormat` specifies the default format for `docker plugin ls` output.
When the `--format` flag is not provided with the `docker plugin ls` command,
Docker's client uses this property. If this property is not set, the client
falls back to the default table format. For a list of supported formatting
directives, see the [**Formatting** section in the `docker plugin ls` documentation](plugin_ls.md)
@y
{% comment %}
The property `pluginsFormat` specifies the default format for `docker plugin ls` output.
When the `--format` flag is not provided with the `docker plugin ls` command,
Docker's client uses this property. If this property is not set, the client
falls back to the default table format. For a list of supported formatting
directives, see the [**Formatting** section in the `docker plugin ls` documentation](plugin_ls.md)
{% endcomment %}
`pluginsFormat` プロパティは `docker plugin` の出力におけるデフォルト書式を指定します。
`docker plugin` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこのプロパティを利用します。
このプロパティが設定されていない場合、クライアントはデフォルトの表書式を採用します。
サポートされているフォーマットディレクティブの一覧は [`docker plugin` の **出力書式** の節](plugin_ls.md) を参照してください。
@z

@x
The property `servicesFormat` specifies the default format for `docker
service ls` output. When the `--format` flag is not provided with the
`docker service ls` command, Docker's client uses this property. If this
property is not set, the client falls back to the default json format. For a
list of supported formatting directives, see the
[**Formatting** section in the `docker service ls` documentation](service_ls.md)
@y
{% comment %}
The property `servicesFormat` specifies the default format for `docker
service ls` output. When the `--format` flag is not provided with the
`docker service ls` command, Docker's client uses this property. If this
property is not set, the client falls back to the default json format. For a
list of supported formatting directives, see the
[**Formatting** section in the `docker service ls` documentation](service_ls.md)
{% endcomment %}
`servicesFormat` プロパティは `docker service` の出力におけるデフォルト書式を指定します。
`docker service ls` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこのプロパティを利用します。
このプロパティが設定されていない場合、クライアントはデフォルトの JSON 書式を採用します。
サポートされているフォーマットディレクティブの一覧は [`docker service ls` の **出力書式** の節](service_ls.md) を参照してください。
@z

@x
The property `serviceInspectFormat` specifies the default format for `docker
service inspect` output. When the `--format` flag is not provided with the
`docker service inspect` command, Docker's client uses this property. If this
property is not set, the client falls back to the default json format. For a
list of supported formatting directives, see the
[**Formatting** section in the `docker service inspect` documentation](service_inspect.md)
@y
{% comment %}
The property `serviceInspectFormat` specifies the default format for `docker
service inspect` output. When the `--format` flag is not provided with the
`docker service inspect` command, Docker's client uses this property. If this
property is not set, the client falls back to the default json format. For a
list of supported formatting directives, see the
[**Formatting** section in the `docker service inspect` documentation](service_inspect.md)
{% endcomment %}
`serviceInspectFormat` プロパティは `docker service inspect` の出力におけるデフォルト書式を指定します。
`docker service inspect` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこのプロパティを利用します。
このプロパティが設定されていない場合、クライアントはデフォルトの JSON 書式を採用します。
サポートされているフォーマットディレクティブの一覧は [`docker service inspect` の **出力書式** の節](service_inspect.md) を参照してください。
@z

@x
The property `statsFormat` specifies the default format for `docker
stats` output. When the `--format` flag is not provided with the
`docker stats` command, Docker's client uses this property. If this
property is not set, the client falls back to the default table
format. For a list of supported formatting directives, see
[**Formatting** section in the `docker stats` documentation](stats.md)
@y
{% comment %}
The property `statsFormat` specifies the default format for `docker
stats` output. When the `--format` flag is not provided with the
`docker stats` command, Docker's client uses this property. If this
property is not set, the client falls back to the default table
format. For a list of supported formatting directives, see
[**Formatting** section in the `docker stats` documentation](stats.md)
{% endcomment %}
`statsFormat` プロパティは `docker stats` の出力におけるデフォルト書式を指定します。
`docker stats` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこのプロパティを利用します。
このプロパティが設定されていない場合、クライアントはデフォルトの表書式を採用します。
サポートされているフォーマットディレクティブの一覧は [`docker stats` の **出力書式** の節](stats.md) を参照してください。
@z

@x
The property `secretFormat` specifies the default format for `docker
secret ls` output. When the `--format` flag is not provided with the
`docker secret ls` command, Docker's client uses this property. If this
property is not set, the client falls back to the default table
format. For a list of supported formatting directives, see
[**Formatting** section in the `docker secret ls` documentation](secret_ls.md)
@y
{% comment %}
The property `secretFormat` specifies the default format for `docker
secret ls` output. When the `--format` flag is not provided with the
`docker secret ls` command, Docker's client uses this property. If this
property is not set, the client falls back to the default table
format. For a list of supported formatting directives, see
[**Formatting** section in the `docker secret ls` documentation](secret_ls.md)
{% endcomment %}
`secretFormat` プロパティは `docker secret ls` の出力におけるデフォルト書式を指定します。
`docker secret ls` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこのプロパティを利用します。
このプロパティが設定されていない場合、クライアントはデフォルトの表書式を採用します。
サポートされているフォーマットディレクティブの一覧は [`docker secret ls` の **出力書式** の節](secret_ls.md) を参照してください。
@z

@x
The property `nodesFormat` specifies the default format for `docker node ls` output.
When the `--format` flag is not provided with the `docker node ls` command,
Docker's client uses the value of `nodesFormat`. If the value of `nodesFormat` is not set,
the client uses the default table format. For a list of supported formatting
directives, see the [**Formatting** section in the `docker node ls` documentation](node_ls.md)
@y
{% comment %}
The property `nodesFormat` specifies the default format for `docker node ls` output.
When the `--format` flag is not provided with the `docker node ls` command,
Docker's client uses the value of `nodesFormat`. If the value of `nodesFormat` is not set,
the client uses the default table format. For a list of supported formatting
directives, see the [**Formatting** section in the `docker node ls` documentation](node_ls.md)
{% endcomment %}
`nodesFormat` プロパティは `docker node ls` の出力におけるデフォルト書式を指定します。
`docker node ls` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこの `nodesFormat`  の値を利用します。
この `nodesFormat` が設定されていない場合、クライアントはデフォルトの表書式を採用します。
サポートされているフォーマットディレクティブの一覧は [`docker node ls` の **出力書式** の節](node_ls.md) を参照してください。
@z

@x
The property `configFormat` specifies the default format for `docker
config ls` output. When the `--format` flag is not provided with the
`docker config ls` command, Docker's client uses this property. If this
property is not set, the client falls back to the default table
format. For a list of supported formatting directives, see
[**Formatting** section in the `docker config ls` documentation](config_ls.md)
@y
{% comment %}
The property `configFormat` specifies the default format for `docker
config ls` output. When the `--format` flag is not provided with the
`docker config ls` command, Docker's client uses this property. If this
property is not set, the client falls back to the default table
format. For a list of supported formatting directives, see
[**Formatting** section in the `docker config ls` documentation](config_ls.md)
{% endcomment %}
`configFormat` プロパティは `docker config ls` の出力におけるデフォルト書式を指定します。
`docker config ls` コマンドに `--format` フラグが指定されていない場合、Docker クライアントはこのプロパティを利用します。
このプロパティが設定されていない場合、クライアントはデフォルトの表書式を採用します。
サポートされているフォーマットディレクティブの一覧は [`docker config ls` の **出力書式** の節](config_ls.md) を参照してください。
@z

@x
The property `credsStore` specifies an external binary to serve as the default
credential store. When this property is set, `docker login` will attempt to
store credentials in the binary specified by `docker-credential-<value>` which
is visible on `$PATH`. If this property is not set, credentials will be stored
in the `auths` property of the config. For more information, see the
[**Credentials store** section in the `docker login` documentation](login.md#credentials-store)
@y
{% comment %}
The property `credsStore` specifies an external binary to serve as the default
credential store. When this property is set, `docker login` will attempt to
store credentials in the binary specified by `docker-credential-<value>` which
is visible on `$PATH`. If this property is not set, credentials will be stored
in the `auths` property of the config. For more information, see the
[**Credentials store** section in the `docker login` documentation](login.md#credentials-store)
{% endcomment %}
`credsStore` プロパティは、デフォルトの資格証明ストア（credential store）として提供する外部バイナリを指定します。
このプロパティが設定されていない場合、`docker login` は、`$PATH` 上の `docker-credential-<value>` によって指定されたバイナリに資格証明の保存を試みます。
このプロパティが設定されていない場合、資格証明は config の `auths` プロパティに保存されます。
詳細は [`docker login` の **資格証明ストア** の節](login.md#credentials-store) を参照してください。
@z

@x
The property `credHelpers` specifies a set of credential helpers to use
preferentially over `credsStore` or `auths` when storing and retrieving
credentials for specific registries. If this property is set, the binary
`docker-credential-<value>` will be used when storing or retrieving credentials
for a specific registry. For more information, see the
[**Credential helpers** section in the `docker login` documentation](login.md#credential-helpers)
@y
{% comment %}
The property `credHelpers` specifies a set of credential helpers to use
preferentially over `credsStore` or `auths` when storing and retrieving
credentials for specific registries. If this property is set, the binary
`docker-credential-<value>` will be used when storing or retrieving credentials
for a specific registry. For more information, see the
[**Credential helpers** section in the `docker login` documentation](login.md#credential-helpers)
{% endcomment %}
`credHelpers` プロパティは、指定 Registry に対しての資格証明の保存や取得を行う際に、`credsStore` や `auths` よりも優先的に利用される資格証明ヘルパー（credential helper）を指定します。
このプロパティが設定されていない場合、指定 Registry に対して実行バイナリ `docker-credential-<value>` が利用されます。
詳細は [`docker login` の **資格証明ヘルパー** の節](login.md#credential-helpers) を参照してください。
@z

@x
The property `stackOrchestrator` specifies the default orchestrator to use when
running `docker stack` management commands. Valid values are `"swarm"`,
`"kubernetes"`, and `"all"`. This property can be overridden with the
`DOCKER_STACK_ORCHESTRATOR` environment variable, or the `--orchestrator` flag.
@y
{% comment %}
The property `stackOrchestrator` specifies the default orchestrator to use when
running `docker stack` management commands. Valid values are `"swarm"`,
`"kubernetes"`, and `"all"`. This property can be overridden with the
`DOCKER_STACK_ORCHESTRATOR` environment variable, or the `--orchestrator` flag.
{% endcomment %}
`stackOrchestrator` プロパティは管理コマンド `docker stack` の実行時に利用するデフォルトオーケストレーターを指定します。
指定できる値は `"swarm"`、`"kubernetes"`、`"all"` です。
このプロパティは環境変数 `DOCKER_STACK_ORCHESTRATOR` または `--orchestrator` フラグによりオーバーライドできます。
@z

@x
The property `proxies` specifies proxy environment variables to be automatically
set on containers, and set as `--build-arg` on containers used during `docker build`.
A `"default"` set of proxies can be configured, and will be used for any docker
daemon that the client connects to, or a configuration per host (docker daemon),
for example, "https://docker-daemon1.example.com". The following properties can
be set for each environment:
@y
{% comment %}
The property `proxies` specifies proxy environment variables to be automatically
set on containers, and set as `--build-arg` on containers used during `docker build`.
A `"default"` set of proxies can be configured, and will be used for any docker
daemon that the client connects to, or a configuration per host (docker daemon),
for example, "https://docker-daemon1.example.com". The following properties can
be set for each environment:
{% endcomment %}
`proxies` プロパティは、プロキシー関連の環境変数を指定します。
これはコンテナーに対して自動的に設定されるか、`docker build` の実行時に `--build-arg` を用いて設定されます。
プロキシーに関する `"default"` の設定は変更が可能です。
設定はクライアントが接続する Docker デーモンすべてに利用されるものと、ホスト（Docker デーモン）ごとに利用されるもの、たとえば "https://docker-daemon1.example.com" があります。
いずれの状況に対しても、以下のプロパティを設定することができます。
@z

@x
* `httpProxy` (sets the value of `HTTP_PROXY` and `http_proxy`)
* `httpsProxy` (sets the value of `HTTPS_PROXY` and `https_proxy`)
* `ftpProxy` (sets the value of `FTP_PROXY` and `ftp_proxy`)
* `noProxy` (sets the value of `NO_PROXY` and `no_proxy`)
@y
{% comment %}
* `httpProxy` (sets the value of `HTTP_PROXY` and `http_proxy`)
* `httpsProxy` (sets the value of `HTTPS_PROXY` and `https_proxy`)
* `ftpProxy` (sets the value of `FTP_PROXY` and `ftp_proxy`)
* `noProxy` (sets the value of `NO_PROXY` and `no_proxy`)
{% endcomment %}
* `httpProxy` (`HTTP_PROXY` と `http_proxy` の値を設定します。)
* `httpsProxy` (`HTTPS_PROXY` と `https_proxy` の値を設定します。)
* `ftpProxy` (`FTP_PROXY` と `ftp_proxy` の値を設定します。)
* `noProxy` (`NO_PROXY` と `no_proxy` の値を設定します。)
@z

@x
> **Warning**: Proxy settings may contain sensitive information (for example,
> if the proxy requires authentication). Environment variables are stored as
> plain text in the container's configuration, and as such can be inspected
> through the remote API or committed to an image when using `docker commit`.
@y
{% comment %}
> **Warning**: Proxy settings may contain sensitive information (for example,
> if the proxy requires authentication). Environment variables are stored as
> plain text in the container's configuration, and as such can be inspected
> through the remote API or committed to an image when using `docker commit`.
{% endcomment %}
> **警告**: プロキシー設定には機密情報を含んでいる場合があります。
> （たとえばプロキシーが認証情報を必要としている場合です。）
> 環境変数はコンテナー設定において、プレーンなテキストとして保持されます。
> そうであるものとして、リモート API において利用されたり、`docker commit` 実行時のイメージコミットに使われたりします。
@z

@x
Once attached to a container, users detach from it and leave it running using
the using `CTRL-p CTRL-q` key sequence. This detach key sequence is customizable
using the `detachKeys` property. Specify a `<sequence>` value for the
property. The format of the `<sequence>` is a comma-separated list of either
a letter [a-Z], or the `ctrl-` combined with any of the following:
@y
{% comment %}
Once attached to a container, users detach from it and leave it running using
the using `CTRL-p CTRL-q` key sequence. This detach key sequence is customizable
using the `detachKeys` property. Specify a `<sequence>` value for the
property. The format of the `<sequence>` is a comma-separated list of either
a letter [a-Z], or the `ctrl-` combined with any of the following:
{% endcomment %}
コンテナーがアタッチされている状態から、これをデタッチし、コンテナーは起動し続けるようにするには、キーシーケンス `CTRL-p CTRL-q` を利用します。
このデタッチキーシーケンスは `detachKeys` プロパティを使って変更することができます。
このプロパティに対する値として `<シーケンス>` を設定してください。
`<シーケンス>` の記述書式はカンマ区切りのリストとするものであり、英字 [a-Z] か、あるいは `ctrl-` に以下を組み合わせたもののいずれかです。
@z

@x
* `a-z` (a single lowercase alpha character )
* `@` (at sign)
* `[` (left bracket)
* `\\` (two backward slashes)
*  `_` (underscore)
* `^` (caret)
@y
{% comment %}
* `a-z` (a single lowercase alpha character )
* `@` (at sign)
* `[` (left bracket)
* `\\` (two backward slashes)
*  `_` (underscore)
* `^` (caret)
{% endcomment %}
* `a-z` (単一の英小文字)
* `@` (アットマーク)
* `[` (左ブラケット)
* `\\` (2 つのバックスラッシュ)
*  `_` (アンダースコア)
* `^` (キャレット)
@z

@x
Your customization applies to all containers started in with your Docker client.
Users can override your custom or the default key sequence on a per-container
basis. To do this, the user specifies the `--detach-keys` flag with the `docker
attach`, `docker exec`, `docker run` or `docker start` command.
@y
{% comment %}
Your customization applies to all containers started in with your Docker client.
Users can override your custom or the default key sequence on a per-container
basis. To do this, the user specifies the `--detach-keys` flag with the `docker
attach`, `docker exec`, `docker run` or `docker start` command.
{% endcomment %}
設定変更した内容は、Docker クライアントを使って起動したコンテナーすべてに対して適用されます。
この変更内容つまりデフォルトのキーシーケンスを、各コンテナーごとにオーバーライドすることができます。 
これを行うには、`docker attach`、`docker exec`、`docker run`、`docker start` の各コマンドにおいて `--detach-keys` フラグを指定します。
@z

@x
The property `plugins` contains settings specific to CLI plugins. The
key is the plugin name, while the value is a further map of options,
which are specific to that plugin.
@y
{% comment %}
The property `plugins` contains settings specific to CLI plugins. The
key is the plugin name, while the value is a further map of options,
which are specific to that plugin.
{% endcomment %}
`plugins` プロパティは CLI プラグイン向けの設定を行うものです。
キーとしてプラグイン名を指定し、値には詳細な設定内容を指定します。
プラグインごとに固有の指定を行います。
@z

@x
Following is a sample `config.json` file:
@y
{% comment %}
Following is a sample `config.json` file:
{% endcomment %}
以下が `config.json` ファイルの例です。
@z

@x
```json
{% raw %}
{
  "HttpHeaders": {
    "MyHeader": "MyValue"
  },
  "psFormat": "table {{.ID}}\\t{{.Image}}\\t{{.Command}}\\t{{.Labels}}",
  "imagesFormat": "table {{.ID}}\\t{{.Repository}}\\t{{.Tag}}\\t{{.CreatedAt}}",
  "pluginsFormat": "table {{.ID}}\t{{.Name}}\t{{.Enabled}}",
  "statsFormat": "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}",
  "servicesFormat": "table {{.ID}}\t{{.Name}}\t{{.Mode}}",
  "secretFormat": "table {{.ID}}\t{{.Name}}\t{{.CreatedAt}}\t{{.UpdatedAt}}",
  "configFormat": "table {{.ID}}\t{{.Name}}\t{{.CreatedAt}}\t{{.UpdatedAt}}",
  "serviceInspectFormat": "pretty",
  "nodesFormat": "table {{.ID}}\t{{.Hostname}}\t{{.Availability}}",
  "detachKeys": "ctrl-e,e",
  "credsStore": "secretservice",
  "credHelpers": {
    "awesomereg.example.org": "hip-star",
    "unicorn.example.com": "vcbait"
  },
  "stackOrchestrator": "kubernetes",
  "plugins": {
    "plugin1": {
      "option": "value"
    },
    "plugin2": {
      "anotheroption": "anothervalue",
      "athirdoption": "athirdvalue"
    }
  },
  "proxies": {
    "default": {
      "httpProxy":  "http://user:pass@example.com:3128",
      "httpsProxy": "http://user:pass@example.com:3128",
      "noProxy":    "http://user:pass@example.com:3128",
      "ftpProxy":   "http://user:pass@example.com:3128"
    },
    "https://manager1.mycorp.example.com:2377": {
      "httpProxy":  "http://user:pass@example.com:3128",
      "httpsProxy": "http://user:pass@example.com:3128"
    },
  }
}
{% endraw %}
```
@y
```json
{% raw %}
{
  "HttpHeaders": {
    "MyHeader": "MyValue"
  },
  "psFormat": "table {{.ID}}\\t{{.Image}}\\t{{.Command}}\\t{{.Labels}}",
  "imagesFormat": "table {{.ID}}\\t{{.Repository}}\\t{{.Tag}}\\t{{.CreatedAt}}",
  "pluginsFormat": "table {{.ID}}\t{{.Name}}\t{{.Enabled}}",
  "statsFormat": "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}",
  "servicesFormat": "table {{.ID}}\t{{.Name}}\t{{.Mode}}",
  "secretFormat": "table {{.ID}}\t{{.Name}}\t{{.CreatedAt}}\t{{.UpdatedAt}}",
  "configFormat": "table {{.ID}}\t{{.Name}}\t{{.CreatedAt}}\t{{.UpdatedAt}}",
  "serviceInspectFormat": "pretty",
  "nodesFormat": "table {{.ID}}\t{{.Hostname}}\t{{.Availability}}",
  "detachKeys": "ctrl-e,e",
  "credsStore": "secretservice",
  "credHelpers": {
    "awesomereg.example.org": "hip-star",
    "unicorn.example.com": "vcbait"
  },
  "stackOrchestrator": "kubernetes",
  "plugins": {
    "plugin1": {
      "option": "value"
    },
    "plugin2": {
      "anotheroption": "anothervalue",
      "athirdoption": "athirdvalue"
    }
  },
  "proxies": {
    "default": {
      "httpProxy":  "http://user:pass@example.com:3128",
      "httpsProxy": "http://user:pass@example.com:3128",
      "noProxy":    "http://user:pass@example.com:3128",
      "ftpProxy":   "http://user:pass@example.com:3128"
    },
    "https://manager1.mycorp.example.com:2377": {
      "httpProxy":  "http://user:pass@example.com:3128",
      "httpsProxy": "http://user:pass@example.com:3128"
    },
  }
}
{% endraw %}
```
@z

@x
### Experimental features
@y
{% comment %}
### Experimental features
{% endcomment %}
{: #experimental-features }
### 試験的機能
@z

@x
Experimental features provide early access to future product functionality.
These features are intended only for testing and feedback as they may change
between releases without warning or can be removed entirely from a future
release.
@y
{% comment %}
Experimental features provide early access to future product functionality.
These features are intended only for testing and feedback as they may change
between releases without warning or can be removed entirely from a future
release.
{% endcomment %}
試験的機能（experimental feature）は、将来の製品に搭載される機能をいち早く試すことができるものです。
ただし現段階でのこの機能は、テストとフィードバックのためだけを意図しています。
したがってリリース時には予告なく変更される場合があり、将来のリリースでは完全に削除されることもあります。
@z

@x
> Experimental features must not be used in production environments.
{: .warning }
@y
{% comment %}
> Experimental features must not be used in production environments.
{: .warning }
{% endcomment %}
> 試験的な機能は本番環境では利用しないでください。
{: .warning }
@z

@x
To enable experimental features, edit the `config.json` file and set
`experimental` to `enabled`. The example below enables experimental features
in a `config.json` file that already enables a debug feature.
@y
{% comment %}
To enable experimental features, edit the `config.json` file and set
`experimental` to `enabled`. The example below enables experimental features
in a `config.json` file that already enables a debug feature.
{% endcomment %}
試験的機能を有効にするには、`config.json` ファイルを編集して `experimental` を `enabled` に設定してください。
以下に示すのが、`config.json` ファイルにおいて試験的機能を有効にする例です。
この例ではデバッグ機能も有効にしています。
@z

@x
```json
{
  "experimental": "enabled",
  "debug": true
}
```
@y
```json
{
  "experimental": "enabled",
  "debug": true
}
```
@z

@x
You can also enable experimental features from the Docker Desktop menu. See the
[Docker Desktop Getting Started page](https://docs.docker.com/docker-for-mac#experimental-features)
for more information.
@y
{% comment %}
You can also enable experimental features from the Docker Desktop menu. See the
[Docker Desktop Getting Started page](https://docs.docker.com/docker-for-mac#experimental-features)
for more information.
{% endcomment %}
試験的機能は Docker Desktop メニューから有効にすることもできます。
詳しくは [Docker Desktop をはじめよう](/docker-for-mac#experimental-features) のページを参照してください。
@z

@x
### Notary
@y
{% comment %}
### Notary
{% endcomment %}
{: #notary }
### Notary
@z

@x
If using your own notary server and a self-signed certificate or an internal
Certificate Authority, you need to place the certificate at
`tls/<registry_url>/ca.crt` in your docker config directory.
@y
{% comment %}
If using your own notary server and a self-signed certificate or an internal
Certificate Authority, you need to place the certificate at
`tls/<registry_url>/ca.crt` in your docker config directory.
{% endcomment %}
独自に Notary サーバーを稼動させ、自己署名証明書や内部認証局を利用している場合は、Docker の config ディレクトリ内の `tls/<レジストリURL>/ca.crt` に証明書を配置することが必要です。
@z

@x
Alternatively you can trust the certificate globally by adding it to your system's
list of root Certificate Authorities.
@y
{% comment %}
Alternatively you can trust the certificate globally by adding it to your system's
list of root Certificate Authorities.
{% endcomment %}
あるいは、その証明書を公開して認証を得るには、システム内のルート認証局に証明書を追加します。
@z

@x
## Examples
@y
{% comment %}
## Examples
{% endcomment %}
{: #examples }
## 利用例
@z

@x
### Display help text
@y
{% comment %}
### Display help text
{% endcomment %}
{: #display-help-text }
### ヘルプテキストの表示
@z

@x
To list the help on any command just execute the command, followed by the
`--help` option.
@y
{% comment %}
To list the help on any command just execute the command, followed by the
`--help` option.
{% endcomment %}
どのコマンドでもヘルプ一覧を見るには、そのコマンドをそのまま実行するか、あるいはコマンドに続けて `--help` を入力して実行します。
@z

@x
    $ docker run --help
@y
    $ docker run --help
@z

@x
    Usage: docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
@y
    Usage: docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
@z

@x
    Run a command in a new container
@y
    Run a command in a new container
@z

@x
    Options:
          --add-host value             Add a custom host-to-IP mapping (host:ip) (default [])
      -a, --attach value               Attach to STDIN, STDOUT or STDERR (default [])
    ...
@y
    Options:
          --add-host value             Add a custom host-to-IP mapping (host:ip) (default [])
      -a, --attach value               Attach to STDIN, STDOUT or STDERR (default [])
    ...
@z

@x
### Option types
@y
{% comment %}
### Option types
{% endcomment %}
{: #option-types }
### オプションの種類
@z

@x
Single character command line options can be combined, so rather than
typing `docker run -i -t --name test busybox sh`,
you can write `docker run -it --name test busybox sh`.
@y
{% comment %}
Single character command line options can be combined, so rather than
typing `docker run -i -t --name test busybox sh`,
you can write `docker run -it --name test busybox sh`.
{% endcomment %}
1 文字からなるコマンドラインオプションは連結することができます。
したがって `docker run -i -t --name test busybox sh` というコマンド入力は `docker run -it --name test busybox sh` と記述することができます。
@z

@x
#### Boolean
@y
{% comment %}
#### Boolean
{% endcomment %}
{: #boolean }
#### ブール値
@z

@x
Boolean options take the form `-d=false`. The value you see in the help text is
the default value which is set if you do **not** specify that flag. If you
specify a Boolean flag without a value, this will set the flag to `true`,
irrespective of the default value.
@y
{% comment %}
Boolean options take the form `-d=false`. The value you see in the help text is
the default value which is set if you do **not** specify that flag. If you
specify a Boolean flag without a value, this will set the flag to `true`,
irrespective of the default value.
{% endcomment %}
ブール値をとるオプションは `-d=false` といった書式です。
ヘルプテキストに表示される値は、そのフラグに値を設定 **しなかった** 場合に利用されるデフォルト値を表わしています。
ブール値フラグに値を定めずに指定した場合は、デフォルト値には関係なく `true` が指定されたものとして扱われます。
@z

@x
For example, running `docker run -d` will set the value to `true`, so your
container **will** run in "detached" mode, in the background.
@y
{% comment %}
For example, running `docker run -d` will set the value to `true`, so your
container **will** run in "detached" mode, in the background.
{% endcomment %}
たとえば `docker run -d` を実行すると、フラグ値には `true` が設定されます。
コンテナーは「デタッチ」モード、つまりバックグラウンドで実行されます。
@z

@x
Options which default to `true` (e.g., `docker build --rm=true`) can only be
set to the non-default value by explicitly setting them to `false`:
@y
{% comment %}
Options which default to `true` (e.g., `docker build --rm=true`) can only be
set to the non-default value by explicitly setting them to `false`:
{% endcomment %}
デフォルトが `true` に設定されているオプション（たとえば `docker build --rm=true`）に対して、デフォルトでない値を設定するには、つまり明示的に `false` を指定するしかありません。
@z

@x
```bash
$ docker build --rm=false .
```
@y
```bash
$ docker build --rm=false .
```
@z

@x
#### Multi
@y
{% comment %}
#### Multi
{% endcomment %}
{: #multi }
#### 複数指定可能なオプション
@z

@x
You can specify options like `-a=[]` multiple times in a single command line,
for example in these commands:
@y
{% comment %}
You can specify options like `-a=[]` multiple times in a single command line,
for example in these commands:
{% endcomment %}
`-a=[]` のようなオプションは、同一のコマンドライン内に複数指定することができます。
たとえば以下のようなコマンドです。
@z

@x
```bash
$ docker run -a stdin -a stdout -i -t ubuntu /bin/bash
@y
```bash
$ docker run -a stdin -a stdout -i -t ubuntu /bin/bash
@z

@x
$ docker run -a stdin -a stdout -a stderr ubuntu /bin/ls
```
@y
$ docker run -a stdin -a stdout -a stderr ubuntu /bin/ls
```
@z

@x
Sometimes, multiple options can call for a more complex value string as for
`-v`:
@y
{% comment %}
Sometimes, multiple options can call for a more complex value string as for
`-v`:
{% endcomment %}
複数指定オプションでは `^v` オプションのように、複雑な文字列を必要とするものもあります。
@z

@x
```bash
$ docker run -v /host:/container example/mysql
```
@y
```bash
$ docker run -v /host:/container example/mysql
```
@z

@x
> **Note**: Do not use the `-t` and `-a stderr` options together due to
> limitations in the `pty` implementation. All `stderr` in `pty` mode
> simply goes to `stdout`.
@y
{% comment %}
> **Note**: Do not use the `-t` and `-a stderr` options together due to
> limitations in the `pty` implementation. All `stderr` in `pty` mode
> simply goes to `stdout`.
{% endcomment %}
> **メモ**: `-t` と `-a stderr` オプションを同時に指定することはできません。
> これは `pty` 実装の制約によるものです。
> `pty` モードにおける `stderr` は、単純に `stdout` へ出力されます。
@z

@x
#### Strings and Integers
@y
{% comment %}
#### Strings and Integers
{% endcomment %}
{: #strings-and-integers }
#### 文字列と整数値
@z

@x
Options like `--name=""` expect a string, and they
can only be specified once. Options like `-c=0`
expect an integer, and they can only be specified once.
@y
{% comment %}
Options like `--name=""` expect a string, and they
can only be specified once. Options like `-c=0`
expect an integer, and they can only be specified once.
{% endcomment %}
`--name=""` といったオプションは、値に文字列をとるものであり、指定は一度だけしかできません。
`-c=0` といったオプションは、値に整数値を指定し、指定は一度だけです。
@z
