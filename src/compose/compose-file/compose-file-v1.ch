%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose file reference
keywords: fig, composition, compose version 1, docker
title: Compose file version 1 reference
toc_max: 4
toc_min: 1
hide_from_sitemap: true
---
@y
---
description: Compose ファイルリファレンス
keywords: fig, composition, compose version 1, docker
title: Compose ファイル バージョン 1 リファレンス
toc_max: 4
toc_min: 1
hide_from_sitemap: true
---
@z

@x
## Reference and guidelines
@y
{% comment %}
## Reference and guidelines
{% endcomment %}
## リファレンスとガイドライン
{: #reference-and-guidelines }
@z

@x
These topics describe version 1 of the Compose file format. This is the oldest
version.
@y
{% comment %}
These topics describe version 1 of the Compose file format. This is the oldest
version.
{% endcomment %}
ここに示す内容は Compose ファイルフォーマット、バージョン 1 です。
これは最も古いバージョンです。
@z

@x
## Compose and Docker compatibility matrix
@y
{% comment %}
## Compose and Docker compatibility matrix
{% endcomment %}
## Compose と Docker の互換マトリックス
{: #compose-and-docker-compatibility-matrix }
@z

@x
There are several versions of the Compose file format – 1, 2, 2.x, and 3.x The
table below is a quick look. For full details on what each version includes and
how to upgrade, see **[About versions and upgrading](compose-versioning.md)**.
@y
{% comment %}
There are several versions of the Compose file format – 1, 2, 2.x, and 3.x The
table below is a quick look. For full details on what each version includes and
how to upgrade, see **[About versions and upgrading](compose-versioning.md)**.
{% endcomment %}
Compose ファイルフォーマットには 1、2、2.x、3.x という複数のバージョンがあります。
その様子は以下の一覧表に見ることができます。
各バージョンにて何が増えたのか、どのようにアップグレードしたのか、といった詳細については **[バージョンとアップグレードについて](compose-versioning.md)**を参照してください。
@z

@x
{% include content/compose-matrix.md %}
@y
{% include content/compose-matrix.md %}
@z

@x
## Service configuration reference
@y
{% comment %}
## Service configuration reference
{% endcomment %}
## サービス設定リファレンス
{: #service-configuration-reference }
@z

@x
The Version 1 Compose file is a [YAML](http://yaml.org/) file that defines [services](#service-configuration-reference).
@y
{% comment %}
The Version 1 Compose file is a [YAML](http://yaml.org/) file that defines [services](#service-configuration-reference).
{% endcomment %}
Compose ファイルバージョン 1 は [YAML](http://yaml.org/) 形式のファイルであり、[サービス（services）](#service-configuration-reference) を定義します。
@z

@x
The default path for a Compose file is `./docker-compose.yml`.
@y
{% comment %}
The default path for a Compose file is `./docker-compose.yml`.
{% endcomment %}
Compose ファイルのデフォルトパスは `./docker-compose.yml` です。
@z

@x
> **Tip**: You can use either a `.yml` or `.yaml` extension for this file.
> They both work.
@y
{% comment %}
> **Tip**: You can use either a `.yml` or `.yaml` extension for this file.
> They both work.
{% endcomment %}
> **ヒント**: このファイルの拡張子は `.yml` と `.yaml` のどちらでも構いません。
> いずれでも動作します。
@z

@x
A service definition contains configuration which is applied to each
container started for that service, much like passing command-line parameters to
`docker run`.
@y
{% comment %}
A service definition contains configuration which is applied to each
container started for that service, much like passing command-line parameters to
`docker run`.
{% endcomment %}
サービスの定義とは、そのサービスを起動する各コンテナーに適用される設定を行うことです。
コマンドラインから `docker run` のパラメーターを受け渡すことと、非常によく似ています。
@z

@x
As with `docker run`, options specified in the Dockerfile, such as `CMD`,
`EXPOSE`, `VOLUME`, `ENV`, are respected by default - you don't need to
specify them again in `docker-compose.yml`.
@y
{% comment %}
As with `docker run`, options specified in the Dockerfile, such as `CMD`,
`EXPOSE`, `VOLUME`, `ENV`, are respected by default - you don't need to
specify them again in `docker-compose.yml`.
{% endcomment %}
`docker run` に関しても同じことが言えますが、Dockerfile にて指定された `CMD`、`EXPOSE`、`VOLUME`、`ENV` のようなオプションはデフォルトでは維持されます。したがって `docker-compose.yml` の中で再度設定する必要はありません。
@z

@x
This section contains a list of all configuration options supported by a service
definition in version 1.
@y
{% comment %}
This section contains a list of all configuration options supported by a service
definition in version 1.
{% endcomment %}
このセクションでは、バージョン 1 のサービス定義においてサポートされている設定オプションをすべて説明しています。
@z

@x
### build
@y
### build
@z

@x
Configuration options that are applied at build time.
@y
{% comment %}
Configuration options that are applied at build time.
{% endcomment %}
この設定オプションはビルド時に適用されます。
@z

@x
`build` can specified as a string containing a path to the build
context.
@y
{% comment %}
`build` can specified as a string containing a path to the build
context.
{% endcomment %}
`build` の指定は、ビルドコンテキストへのパスを表わす文字列を指定します。
@z

@x
```yaml
build: ./dir
```
@y
```yaml
build: ./dir
```
@z

@x
> **Note**
>
> In [version 1 file format](compose-versioning.md#version-1), `build` is
> different in two ways:
>
> * Only the string form (`build: .`) is allowed - not the object
>   form that is allowed in Version 2 and up.
> * Using `build` together with [`image`](#image) is not allowed.
>   Attempting to do so results in an error.
@y
{% comment %}
> **Note**
>
> In [version 1 file format](compose-versioning.md#version-1), `build` is
> different in two ways:
>
> * Only the string form (`build: .`) is allowed - not the object
>   form that is allowed in Version 2 and up.
> * Using `build` together with [`image`](#image) is not allowed.
>   Attempting to do so results in an error.
{% endcomment %}
> **メモ**
>
> [ファイルフォーマットバージョン 1](compose-versioning.md#version-1) における `build` は、より新しいバージョンに比べると以下の二点の違いがあります。
>
>*  文字列指定 (`build: .`) のみがサポートされます。
>   オブジェクト指定はバージョン 2 およびそれ以降でサポートされます。
>*  `build` と [`image`](#image) を同時に利用することはできません。
>   これを行うとエラーが発生します。
@z

@x
#### dockerfile
@y
#### dockerfile
@z

@x
Alternate Dockerfile.
@y
{% comment %}
Alternate Dockerfile.
{% endcomment %}
別の Dockerfile を指定します。
@z

@x
Compose uses an alternate file to build with. A build path must also be
specified.
@y
{% comment %}
Compose uses an alternate file to build with. A build path must also be
specified.
{% endcomment %}
Compose は指定された別の Dockerfile を使ってビルドを行います。
このときは、ビルドパスを同時に指定しなければなりません。
@z

@x
```yaml
build: .
dockerfile: Dockerfile-alternate
```
@y
```yaml
build: .
dockerfile: Dockerfile-alternate
```
@z

@x
> **Note**
>
> In the [version 1 file format](compose-versioning.md#version-1), `dockerfile`
> is different from newer versions in two ways:
>
> * It appears alongside `build`, not as a sub-option:
> * Using `dockerfile` together with [`image`](#image) is not allowed.
>   Attempting to do so results in an error.
@y
{% comment %}
> **Note**
>
> In the [version 1 file format](compose-versioning.md#version-1), `dockerfile`
> is different from newer versions in two ways:
>
> * It appears alongside `build`, not as a sub-option:
> * Using `dockerfile` together with [`image`](#image) is not allowed.
>   Attempting to do so results in an error.
{% endcomment %}
> **メモ**
>
> [ファイルフォーマットバージョン 1](compose-versioning.md#version-1) における `dockerfile` は、より新しいバージョンに比べると以下の二点の違いがあります。
>
>* これは `build` と同レベルに指定するものであり、サブオプションではありません。
>*  `dockerfile` と [`image`](#image) を同時に利用することはできません。
>   これを行うとエラーが発生します。
@z

@x
### cap_add, cap_drop
@y
### cap_add, cap_drop
@z

@x
Add or drop container capabilities.
See `man 7 capabilities` for a full list.
@y
{% comment %}
Add or drop container capabilities.
See `man 7 capabilities` for a full list.
{% endcomment %}
コンテナーケーパビリティーの機能を追加または削除します。
詳細な一覧は `man 7 capabilities` を参照してください。
@z

@x
```yaml
cap_add:
  - ALL
@y
```yaml
cap_add:
  - ALL
@z

@x
cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
```
@y
cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
```
@z

@x
> **Note**: These options are ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
> with a (version 3) Compose file.
@y
{% comment %}
> **Note**: These options are ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
> with a (version 3) Compose file.
{% endcomment %}
> **メモ**: Compose ファイルバージョン 3 においてこのオプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
@z

@x
### command
@y
### command
@z

@x
Override the default command.
@y
{% comment %}
Override the default command.
{% endcomment %}
デフォルトコマンドを上書きします。
@z

@x
```yaml
command: bundle exec thin -p 3000
```
@y
```yaml
command: bundle exec thin -p 3000
```
@z

@x
The command can also be a list, in a manner similar to
[dockerfile](../../engine/reference/builder.md#cmd):
@y
{% comment %}
The command can also be a list, in a manner similar to
[dockerfile](../../engine/reference/builder.md#cmd):
{% endcomment %}
このコマンドは [dockerfile](../../engine/reference/builder.md#cmd) の場合と同じように、リスト形式により指定することもできます。
@z

@x
```yaml
command: ["bundle", "exec", "thin", "-p", "3000"]
```
@y
```yaml
command: ["bundle", "exec", "thin", "-p", "3000"]
```
@z

@x
### cgroup_parent
@y
### cgroup_parent
@z

@x
Specify an optional parent cgroup for the container.
@y
{% comment %}
Specify an optional parent cgroup for the container.
{% endcomment %}
コンテナーに対して、オプションで指定する親の cgroup を指定します。
@z

@x
```yaml
cgroup_parent: m-executor-abcd
```
@y
```yaml
cgroup_parent: m-executor-abcd
```
@z

@x
### container_name
@y
### container_name
@z

@x
Specify a custom container name, rather than a generated default name.
@y
{% comment %}
Specify a custom container name, rather than a generated default name.
{% endcomment %}
デフォルトのコンテナー名ではない、独自のコンテナー名を設定します。
@z

@x
```yaml
container_name: my-web-container
```
@y
```yaml
container_name: my-web-container
```
@z

@x
Because Docker container names must be unique, you cannot scale a service
beyond 1 container if you have specified a custom name. Attempting to do so
results in an error.
@y
{% comment %}
Because Docker container names must be unique, you cannot scale a service
beyond 1 container if you have specified a custom name. Attempting to do so
results in an error.
{% endcomment %}
Docker コンテナー名はユニークである必要があります。
そこで独自のコンテナー名を設定したときは、サービスをスケールアップして複数コンテナーとすることはできません。
これを行うとエラーが発生します。
@z

@x
### devices
@y
### devices
@z

@x
List of device mappings.  Uses the same format as the `--device` docker
client create option.
@y
{% comment %}
List of device mappings.  Uses the same format as the `--device` docker
client create option.
{% endcomment %}
デバイスのマッピングをリスト形式で設定します。
Docker クライアントの create オプションの `--device` と同じ書式にします。
@z

@x
```yaml
devices:
  - "/dev/ttyUSB0:/dev/ttyUSB0"
```
@y
```yaml
devices:
  - "/dev/ttyUSB0:/dev/ttyUSB0"
```
@z

@x
### dns
@y
### dns
@z

@x
Custom DNS servers. Can be a single value or a list.
@y
{% comment %}
Custom DNS servers. Can be a single value or a list.
{% endcomment %}
DNS サーバーを設定します。
設定は 1 つだけとするか、リストにすることができます。
@z

@x
```yaml
dns: 8.8.8.8
```
@y
```yaml
dns: 8.8.8.8
```
@z

@x
```yaml
dns:
  - 8.8.8.8
  - 9.9.9.9
```
@y
```yaml
dns:
  - 8.8.8.8
  - 9.9.9.9
```
@z

@x
### dns_search
@y
### dns_search
@z

@x
Custom DNS search domains. Can be a single value or a list.
@y
{% comment %}
Custom DNS search domains. Can be a single value or a list.
{% endcomment %}
DNS 検索ドメインを設定します。
設定は 1 つだけとするか、リストにすることができます。
@z

@x
```yaml
dns_search: example.com
```
@y
```yaml
dns_search: example.com
```
@z

@x
```yaml
dns_search:
  - dc1.example.com
  - dc2.example.com
```
@y
```yaml
dns_search:
  - dc1.example.com
  - dc2.example.com
```
@z

@x
### entrypoint
@y
### entrypoint
@z

@x
Override the default entrypoint.
@y
{% comment %}
Override the default entrypoint.
{% endcomment %}
デフォルトのエントリーポイントを上書きします。
@z

@x
```yaml
entrypoint: /code/entrypoint.sh
```
@y
```yaml
entrypoint: /code/entrypoint.sh
```
@z

@x
The entrypoint can also be a list, in a manner similar to
[dockerfile](../../engine/reference/builder.md#entrypoint):
@y
{% comment %}
The entrypoint can also be a list, in a manner similar to
[dockerfile](../../engine/reference/builder.md#entrypoint):
{% endcomment %}
エントリーポイントはリスト形式で設定することができます。
その指定方法は [Dockerfile](../../engine/reference/builder.md#entrypoint) と同様です。
@z

@x
```yaml
entrypoint: ["php", "-d", "memory_limit=-1", "vendor/bin/phpunit"]
```
@y
```yaml
entrypoint: ["php", "-d", "memory_limit=-1", "vendor/bin/phpunit"]
```
@z

@x
> **Note**: Setting `entrypoint` both overrides any default entrypoint set
> on the service's image with the `ENTRYPOINT` Dockerfile instruction, *and*
> clears out any default command on the image - meaning that if there's a `CMD`
> instruction in the Dockerfile, it is ignored.
@y
{% comment %}
> **Note**: Setting `entrypoint` both overrides any default entrypoint set
> on the service's image with the `ENTRYPOINT` Dockerfile instruction, *and*
> clears out any default command on the image - meaning that if there's a `CMD`
> instruction in the Dockerfile, it is ignored.
{% endcomment %}
> **メモ**: `entrypoint` を設定すると、サービスイメージ内に Dockerfile 命令の `ENTRYPOINT` によって設定されているデフォルトのエントリーポイントは上書きされ、**さらに**イメージ内のあらゆるデフォルトコマンドもクリアされます。
> これはつまり、Dockerfile に `CMD` 命令があったとしたら無視されるということです。
@z

@x
### env_file
@y
### env_file
@z

@x
Add environment variables from a file. Can be a single value or a list.
@y
{% comment %}
Add environment variables from a file. Can be a single value or a list.
{% endcomment %}
ファイルを用いて環境変数を追加します。
設定は 1 つだけとするか、リストにすることができます。
@z

@x
If you have specified a Compose file with `docker-compose -f FILE`, paths in
`env_file` are relative to the directory that file is in.
@y
{% comment %}
If you have specified a Compose file with `docker-compose -f FILE`, paths in
`env_file` are relative to the directory that file is in.
{% endcomment %}
Compose ファイルを `docker-compose -f FILE` という起動により指定している場合、`env_file` におけるパスは、Compose ファイルがあるディレクトリからの相対パスとします。
@z

@x
Environment variables declared in the [environment](#environment) section
_override_ these values &ndash; this holds true even if those values are
empty or undefined.
@y
{% comment %}
Environment variables declared in the [environment](#environment) section
_override_ these values &ndash; this holds true even if those values are
empty or undefined.
{% endcomment %}
環境変数が [environment](#environment) の項に宣言されていれば、ここでの設定を**オーバーライド**します。
これは元の値が空や未定義の場合であっても、そのようになります。
@z

@x
```yaml
env_file: .env
```
@y
```yaml
env_file: .env
```
@z

@x
```yaml
env_file:
  - ./common.env
  - ./apps/web.env
  - /opt/runtime_opts.env
```
@y
```yaml
env_file:
  - ./common.env
  - ./apps/web.env
  - /opt/runtime_opts.env
```
@z

@x
Compose expects each line in an env file to be in `VAR=VAL` format. Lines
beginning with `#` are processed as comments and are ignored. Blank lines are
also ignored.
@y
{% comment %}
Compose expects each line in an env file to be in `VAR=VAL` format. Lines
beginning with `#` are processed as comments and are ignored. Blank lines are
also ignored.
{% endcomment %}
env ファイルの各行は `VAR=VAL` の書式とします。
行先頭に `#` があると、コメント行となり無視されます。
空行も無視されます。
@z

@x
```console
# Set Rails/Rack environment
RACK_ENV=development
```
@y
```console
# Set Rails/Rack environment
RACK_ENV=development
```
@z

@x
> **Note**: If your service specifies a [build](#build) option, variables
> defined in environment files are _not_ automatically visible during the
> build.
@y
{% comment %}
> **Note**: If your service specifies a [build](#build) option, variables
> defined in environment files are _not_ automatically visible during the
> build.
{% endcomment %}
> **メモ**: サービスに [build](#build) オプションを指定している場合、env ファイル内に定義された変数は、ビルド時に自動的に参照されません。
@z

@x
The value of `VAL` is used as is and not modified at all. For example if the
value is surrounded by quotes (as is often the case of shell variables), the
quotes are included in the value passed to Compose.
@y
{% comment %}
The value of `VAL` is used as is and not modified at all. For example if the
value is surrounded by quotes (as is often the case of shell variables), the
quotes are included in the value passed to Compose.
{% endcomment %}
`VAL` の値は記述されたとおりに用いられ、一切修正はされません。
たとえば値がクォートにより囲まれている（よくシェル変数に対して行う）場合、クォートもそのまま値として Compose に受け渡されます。
@z

@x
Keep in mind that _the order of files in the list is significant in determining
the value assigned to a variable that shows up more than once_. The files in the
list are processed from the top down. For the same variable specified in file
`a.env` and assigned a different value in file `b.env`, if `b.env` is
listed below (after), then the value from `b.env` stands. For example, given the
following declaration in `docker-compose.yml`:
@y
{% comment %}
Keep in mind that _the order of files in the list is significant in determining
the value assigned to a variable that shows up more than once_. The files in the
list are processed from the top down. For the same variable specified in file
`a.env` and assigned a different value in file `b.env`, if `b.env` is
listed below (after), then the value from `b.env` stands. For example, given the
following declaration in `docker-compose.yml`:
{% endcomment %}
ファイルを複数用いる場合の順番には気をつけてください。
特に何度も出現する変数に対して、値がどのように決定されるかです。
ファイルが複数指定された場合、その処理は上から順に行われます。
たとえば `a.env` ファイルに変数が指定されていて、`b.env` ファイルには同じ変数が異なる値で定義されていたとします。
ここで `b.env` ファイルが下に（後に）指定されているとします。
このとき変数の値は `b.env` のものが採用されます。
さらに例として `docker-compose.yml` に以下のような宣言があったとします。
@z

@x
```yaml
services:
  some-service:
    env_file:
      - a.env
      - b.env
```
@y
```yaml
services:
  some-service:
    env_file:
      - a.env
      - b.env
```
@z

@x
And the following files:
@y
{% comment %}
And the following files:
{% endcomment %}
ファイルの内容は以下であるとします。
@z

@x
```console
# a.env
VAR=1
```
@y
```console
# a.env
VAR=1
```
@z

@x
and
@y
{% comment %}
and
{% endcomment %}
@z

@x
```console
# b.env
VAR=hello
```
@y
```console
# b.env
VAR=hello
```
@z

@x
`$VAR` is `hello`.
@y
{% comment %}
`$VAR` is `hello`.
{% endcomment %}
この結果 `$VAR` は `hello` になります。
@z

@x
### environment
@y
### environment
@z

@x
Add environment variables. You can use either an array or a dictionary. Any
boolean values (true, false, yes, no) need to be enclosed in quotes to ensure
they are not converted to True or False by the YML parser.
@y
{% comment %}
Add environment variables. You can use either an array or a dictionary. Any
boolean values (true, false, yes, no) need to be enclosed in quotes to ensure
they are not converted to True or False by the YML parser.
{% endcomment %}
環境変数を追加します。
配列形式または辞書形式での指定が可能です。
ブール値 (`true`, `false`, `yes`, `no`) を用いる場合は、クォートで囲むことで YML パーサーによって True や False に変換されてしまうのを防ぐ必要があります。
@z

@x
Environment variables with only a key are resolved to their values on the
machine Compose is running on, which can be helpful for secret or host-specific values.
@y
{% comment %}
Environment variables with only a key are resolved to their values on the
machine Compose is running on, which can be helpful for secret or host-specific values.
{% endcomment %}
環境変数だけが記述されている場合は、Compose が起動しているマシン上にて定義されている値が設定されます。
これは機密情報やホスト固有の値を設定する場合に利用できます。
@z

@x
```yaml
environment:
  RACK_ENV: development
  SHOW: 'true'
  SESSION_SECRET:
```
@y
```yaml
environment:
  RACK_ENV: development
  SHOW: 'true'
  SESSION_SECRET:
```
@z

@x
```yaml
environment:
  - RACK_ENV=development
  - SHOW=true
  - SESSION_SECRET
```
@y
```yaml
environment:
  - RACK_ENV=development
  - SHOW=true
  - SESSION_SECRET
```
@z

@x
> **Note**: If your service specifies a [build](#build) option, variables
> defined in `environment` are _not_ automatically visible during the
> build.
@y
{% comment %}
> **Note**: If your service specifies a [build](#build) option, variables
> defined in `environment` are _not_ automatically visible during the
> build.
{% endcomment %}
> **メモ**: サービスに [build](#build) オプションを指定している場合、env ファイル内に定義された変数は、ビルド時に自動的に参照されません。
@z

@x
### expose
@y
### expose
@z

@x
Expose ports without publishing them to the host machine - they'll only be
accessible to linked services. Only the internal port can be specified.
@y
{% comment %}
Expose ports without publishing them to the host machine - they'll only be
accessible to linked services. Only the internal port can be specified.
{% endcomment %}
ホストマシンにはポートを公開せずに、ポートを expose します。
これはリンクされたサービスのみアクセスが可能になります。
内部ポートのみが指定できます。
@z

@x
```yaml
expose:
  - "3000"
  - "8000"
```
@y
```yaml
expose:
  - "3000"
  - "8000"
```
@z

@x
### extends
@y
### extends
@z

@x
Extend another service, in the current file or another, optionally overriding
configuration.
@y
{% comment %}
Extend another service, in the current file or another, optionally overriding
configuration.
{% endcomment %}
現ファイルや別のファイルにある他のサービスを拡張します。
必要に応じて設定を上書きすることもできます。
@z

@x
You can use `extends` on any service together with other configuration keys.
The `extends` value must be a dictionary defined with a required `service`
and an optional `file` key.
@y
{% comment %}
You can use `extends` on any service together with other configuration keys.
The `extends` value must be a dictionary defined with a required `service`
and an optional `file` key.
{% endcomment %}
別のサービスを `extends` により拡張する際には、合わせて他の設定キーを指定することができます。
`extends` に設定する値は辞書形式であり、`service` キーが必須です。
また必要に応じて指定する `file` キーがあります。
@z

@x
```yaml
extends:
  file: common.yml
  service: webapp
```
@y
```yaml
extends:
  file: common.yml
  service: webapp
```
@z

@x
The `service` the name of the service being extended, for example
`web` or `database`. The `file` is the location of a Compose configuration
file defining that service.
@y
{% comment %}
The `service` the name of the service being extended, for example
`web` or `database`. The `file` is the location of a Compose configuration
file defining that service.
{% endcomment %}
`service` は拡張するサービスの名前を指定します。
たとえば `web` や `database` です。
`file` は、サービスを定義する Compose 設定ファイルのパスを指定します。
@z

@x
If you omit the `file` Compose looks for the service configuration in the
current file. The `file` value can be an absolute or relative path. If you
specify a relative path, Compose treats it as relative to the location of the
current file.
@y
{% comment %}
If you omit the `file` Compose looks for the service configuration in the
current file. The `file` value can be an absolute or relative path. If you
specify a relative path, Compose treats it as relative to the location of the
current file.
{% endcomment %}
`file` の指定を省略した場合、Compose はそのサービス設定を現ファイルの中から探します。
`file` に指定する値は絶対パス、相対パスのいずれでも構いません。
相対パスを指定した場合、Compose は現ファイルのあるディレクトリからの相対パスとして扱います。
@z

@x
You can extend a service that itself extends another. You can extend
indefinitely. Compose does not support circular references and `docker-compose`
returns an error if it encounters one.
@y
{% comment %}
You can extend a service that itself extends another. You can extend
indefinitely. Compose does not support circular references and `docker-compose`
returns an error if it encounters one.
{% endcomment %}
拡張するサービスそのものが、他のサービスを拡張したものも指定可能です。
拡張の繰り返しはいくらでもできます。
ただし Compose は循環参照をサポートしていないため、そのような状況が発生した場合は `docker-compose` がエラーを返します。
@z

@x
For more on `extends`, see the
[the extends documentation](../extends.md#extending-services).
@y
{% comment %}
For more on `extends`, see the
[the extends documentation](../extends.md#extending-services).
{% endcomment %}
`extends` に関する詳細は [extends ドキュメント](../extends.md#extending-services) を参照してください。
@z

@x
### external_links
@y
### external_links
@z

@x
Link to containers started outside this `docker-compose.yml` or even outside of
Compose, especially for containers that provide shared or common services.
`external_links` follow semantics similar to `links` when
specifying both the container name and the link alias (`CONTAINER:ALIAS`).
@y
{% comment %}
Link to containers started outside this `docker-compose.yml` or even outside of
Compose, especially for containers that provide shared or common services.
`external_links` follow semantics similar to `links` when
specifying both the container name and the link alias (`CONTAINER:ALIAS`).
{% endcomment %}
今の `docker-compose.yml` からではない別のところから起動されたコンテナーをリンクします。
あるいは Compose の外から、特に共有サービスや汎用サービスとして提供されるコンテナーをリンクします。
`external_links` の文法は、オプション `links` と同様です。
つまりコンテナー名とリンクのエイリアス名（`CONTAINER:ALIAS`）を同時に指定します。
@z

@x
```yaml
external_links:
  - redis_1
  - project_db_1:mysql
  - project_db_1:postgresql
```
@y
```yaml
external_links:
  - redis_1
  - project_db_1:mysql
  - project_db_1:postgresql
```
@z

@x
### extra_hosts
@y
### extra_hosts
@z

@x
Add hostname mappings. Use the same values as the docker client `--add-host` parameter.
@y
{% comment %}
Add hostname mappings. Use the same values as the docker client `--add-host` parameter.
{% endcomment %}
ホスト名のマッピングを追加します。
Docker Client の `--add-host` パラメーターと同じ値を設定してください。
@z

@x
```yaml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@y
```yaml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@z

@x
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this service, e.g:
@y
{% comment %}
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this service, e.g:
{% endcomment %}
ホスト名と IP アドレスによるこの設定内容は、サービスコンテナー内の `/etc/hosts` に追加されます。
たとえば以下のとおりです。
@z

@x
```console
162.242.195.82  somehost
50.31.209.229   otherhost
```
@y
```console
162.242.195.82  somehost
50.31.209.229   otherhost
```
@z

@x
### image
@y
### image
@z

@x
Specify the image to start the container from. Can either be a repository/tag or
a partial image ID.
@y
{% comment %}
Specify the image to start the container from. Can either be a repository/tag or
a partial image ID.
{% endcomment %}
コンテナーを起動させるイメージを設定します。
リポジトリ/タグの形式か、あるいは部分イメージ ID により指定します。
@z

@x
```yaml
image: redis
```
```yaml
image: ubuntu:18.04
```
```yaml
image: tutum/influxdb
```
```yaml
image: example-registry.com:4000/postgresql
```
```yaml
image: a4bc65fd
```
@y
```yaml
image: redis
```
```yaml
image: ubuntu:18.04
```
```yaml
image: tutum/influxdb
```
```yaml
image: example-registry.com:4000/postgresql
```
```yaml
image: a4bc65fd
```
@z

@x
If the image does not exist, Compose attempts to pull it, unless you have also
specified [build](#build), in which case it builds it using the specified
options and tags it with the specified tag.
@y
{% comment %}
If the image does not exist, Compose attempts to pull it, unless you have also
specified [build](#build), in which case it builds it using the specified
options and tags it with the specified tag.
{% endcomment %}
イメージが存在しなかった場合、[build](#build) を指定していなければ Compose はイメージを取得しようとします。
取得する際には、指定されたオプションを使ってビルドを行い、指定されたタグ名によりタグづけを行います。
@z

@x
> **Note**: In the [version 1 file format](compose-versioning.md#version-1),
> using [`build`](#build) together with `image` is not allowed. Attempting to do
> so results in an error.
@y
{% comment %}
> **Note**: In the [version 1 file format](compose-versioning.md#version-1),
> using [`build`](#build) together with `image` is not allowed. Attempting to do
> so results in an error.
{% endcomment %}
> **メモ**: [ファイルフォーマットバージョン 1](compose-versioning.md#version-1) において [`build`](#build) を `image` とともに利用することはできません。
これを行うとエラーになります。
@z

@x
### labels
@y
### labels
@z

@x
Add metadata to containers using [Docker labels](../../config/labels-custom-metadata.md). You can use either an array or a dictionary.
@y
{% comment %}
Add metadata to containers using [Docker labels](../../config/labels-custom-metadata.md). You can use either an array or a dictionary.
{% endcomment %}
[Docker labels](../../config/labels-custom-metadata.md) を使ってコンテナーにメタデータを追加します。
配列形式と辞書形式のいずれかにより指定します。
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with those used by other software.
@y
{% comment %}
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with those used by other software.
{% endcomment %}
他のソフトウェアが用いるラベルとの競合を避けるため、逆 DNS 記法とすることをお勧めします。
@z

@x
```yaml
labels:
  com.example.description: "Accounting webapp"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@y
```yaml
labels:
  com.example.description: "Accounting webapp"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@z

@x
```yaml
labels:
  - "com.example.description=Accounting webapp"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@y
```yaml
labels:
  - "com.example.description=Accounting webapp"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@z

@x
### links
@y
### links
@z

@x
Link to containers in another service. Either specify both the service name and
a link alias (`"SERVICE:ALIAS"`), or just the service name.
@y
{% comment %}
Link to containers in another service. Either specify both the service name and
a link alias (`"SERVICE:ALIAS"`), or just the service name.
{% endcomment %}
他サービスのコンテナーをリンクします。
サービス名とリンクのエイリアス名（`"SERVICE:ALIAS"`）を指定するか、直接サービス名を指定します。
@z

@x
> Links are a legacy option. We recommend using
> [networks](../networking.md) instead.
@y
{% comment %}
> Links are a legacy option. We recommend using
> [networks](../networking.md) instead.
{% endcomment %}
> links は古いオプションです。
> かわりに [networks](../networking.md) を用いることをお勧めします。
@z

@x
```yaml
web:
  links:
    - "db"
    - "db:database"
    - "redis"
```
@y
```yaml
web:
  links:
    - "db"
    - "db:database"
    - "redis"
```
@z

@x
Containers for the linked service are reachable at a hostname identical to
the alias, or the service name if no alias was specified.
@y
{% comment %}
Containers for the linked service are reachable at a hostname identical to
the alias, or the service name if no alias was specified.
{% endcomment %}
リンクされたサービスのコンテナーは、エイリアスと同等のホスト名により到達可能になります。
エイリアスが設定されていない場合はサービス名により到達可能です。
@z

@x
Links also express dependency between services in the same way as
[depends_on](compose-file-v2.md#depends_on), so they determine the order of service startup.
@y
{% comment %}
Links also express dependency between services in the same way as
[depends_on](compose-file-v2.md#depends_on), so they determine the order of service startup.
{% endcomment %}
Links は [depends_on](compose-file-v2.md#depends_on) と同様にサービス間の依存関係を表わします。
したがってサービスの起動順を設定するものになります。
@z

@x
> **Note**
>
> If you define both links and [networks](index.md#networks), services with
> links between them must share at least one network in common in order to
> communicate.
@y
{% comment %}
> **Note**
>
> If you define both links and [networks](index.md#networks), services with
> links between them must share at least one network in common in order to
> communicate.
{% endcomment %}
> **メモ**：
>
> links と [networks](index.md#networks) をともに設定する場合、リンクするサービスは、少なくとも 1 つのネットワークが共有され通信ができるようにする必要があります。
@z

@x
#### link environment variables
@y
{% comment %}
#### link environment variables
{% endcomment %}
{: #link-environment-variables }
#### link environment variables
@z

@x
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and
> up, custom networks are used, and no environment variables are created.
@y
{% comment %}
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and
> up, custom networks are used, and no environment variables are created.
{% endcomment %}
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and
> up, custom networks are used, and no environment variables are created.
@z

@x
> **Note**
>
> Environment variables are no longer the recommended method for connecting to
> linked services. Instead, you should use the link name (by default, the name
> of the linked service) as the hostname to connect to. Refer to the
> [docker-compose.yml documentation](compose-file/index.md#links) for details.
>
> Environment variables are only populated if you use the
> [legacy version 1 Compose file format](compose-file/compose-versioning.md#versioning).
{: .warning }
@y
{% comment %}
> **Note**
>
> Environment variables are no longer the recommended method for connecting to
> linked services. Instead, you should use the link name (by default, the name
> of the linked service) as the hostname to connect to. Refer to the
> [docker-compose.yml documentation](compose-file/index.md#links) for details.
>
> Environment variables are only populated if you use the
> [legacy version 1 Compose file format](compose-file/compose-versioning.md#versioning).
{: .warning }
{% endcomment %}
> **メモ**
>
> Environment variables are no longer the recommended method for connecting to
> linked services. Instead, you should use the link name (by default, the name
> of the linked service) as the hostname to connect to. Refer to the
> [docker-compose.yml documentation](compose-file/index.md#links) for details.
>
> Environment variables are only populated if you use the
> [legacy version 1 Compose file format](compose-file/compose-versioning.md#versioning).
{: .warning }
@z

@x
Compose uses [Docker links](../../network/links.md)
to expose services' containers to one another. Each linked container injects a set of
environment variables, each of which begins with the uppercase name of the container.
@y
{% comment %}
Compose uses [Docker links](../../network/links.md)
to expose services' containers to one another. Each linked container injects a set of
environment variables, each of which begins with the uppercase name of the container.
{% endcomment %}
Compose uses [Docker links](../../network/links.md)
to expose services' containers to one another. Each linked container injects a set of
environment variables, each of which begins with the uppercase name of the container.
@z

@x
To see what environment variables are available to a service, run `docker-compose run SERVICE env`.
@y
{% comment %}
To see what environment variables are available to a service, run `docker-compose run SERVICE env`.
{% endcomment %}
To see what environment variables are available to a service, run `docker-compose run SERVICE env`.
@z

@x
<b><i>name</i>\_PORT</b><br>
Full URL, such as `DB_PORT=tcp://172.17.0.5:5432`
@y
{% comment %}
<b><i>name</i>\_PORT</b><br>
Full URL, such as `DB_PORT=tcp://172.17.0.5:5432`
{% endcomment %}
<b><i>name</i>\_PORT</b><br>
Full URL, such as `DB_PORT=tcp://172.17.0.5:5432`
@z

@x
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i></b><br>
Full URL, such as `DB_PORT_5432_TCP=tcp://172.17.0.5:5432`
@y
{% comment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i></b><br>
Full URL, such as `DB_PORT_5432_TCP=tcp://172.17.0.5:5432`
{% endcomment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i></b><br>
Full URL, such as `DB_PORT_5432_TCP=tcp://172.17.0.5:5432`
@z

@x
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_ADDR</b><br>
Container's IP address, such as `DB_PORT_5432_TCP_ADDR=172.17.0.5`
@y
{% comment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_ADDR</b><br>
Container's IP address, such as `DB_PORT_5432_TCP_ADDR=172.17.0.5`
{% endcomment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_ADDR</b><br>
Container's IP address, such as `DB_PORT_5432_TCP_ADDR=172.17.0.5`
@z

@x
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PORT</b><br>
Exposed port number, such as `DB_PORT_5432_TCP_PORT=5432`
@y
{% comment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PORT</b><br>
Exposed port number, such as `DB_PORT_5432_TCP_PORT=5432`
{% endcomment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PORT</b><br>
Exposed port number, such as `DB_PORT_5432_TCP_PORT=5432`
@z

@x
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PROTO</b><br>
Protocol (tcp or udp), such as `DB_PORT_5432_TCP_PROTO=tcp`
@y
{% comment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PROTO</b><br>
Protocol (tcp or udp), such as `DB_PORT_5432_TCP_PROTO=tcp`
{% endcomment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PROTO</b><br>
Protocol (tcp or udp), such as `DB_PORT_5432_TCP_PROTO=tcp`
@z

@x
<b><i>name</i>\_NAME</b><br>
Fully qualified container name, such as `DB_1_NAME=/myapp_web_1/myapp_db_1`
@y
{% comment %}
<b><i>name</i>\_NAME</b><br>
Fully qualified container name, such as `DB_1_NAME=/myapp_web_1/myapp_db_1`
{% endcomment %}
<b><i>name</i>\_NAME</b><br>
Fully qualified container name, such as `DB_1_NAME=/myapp_web_1/myapp_db_1`
@z

@x
### log_driver
@y
### log_driver
@z

@x
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and up, use
> [logging](index.md#logging).
@y
{% comment %}
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and up, use
> [logging](index.md#logging).
{% endcomment %}
> [ファイルフォーアットバージョン 1](compose-versioning.md#version-1) のみ。
> バージョン 2 またはそれ以降においては、[logging](index.md#logging) を用いてください。
@z

@x
Specify a log driver. The default is `json-file`.
@y
{% comment %}
Specify a log driver. The default is `json-file`.
{% endcomment %}
ログドライバーを設定します。
デフォルトは `json-file` です。
@z

@x
```yaml
log_driver: syslog
```
@y
```yaml
log_driver: syslog
```
@z

@x
### log_opt
@y
### log_opt
@z

@x
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and up, use
> [logging](index.md#logging).
@y
{% comment %}
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and up, use
> [logging](index.md#logging).
{% endcomment %}
> [ファイルフォーアットバージョン 1](compose-versioning.md#version-1) のみ。
> バージョン 2 またはそれ以降においては、[logging](index.md#logging) を用いてください。
@z

@x
Specify logging options as key-value pairs. An example of `syslog` options:
@y
{% comment %}
Specify logging options as key-value pairs. An example of `syslog` options:
{% endcomment %}
ロギングオプションはキーバリューのペアで設定します。
たとえば `syslog` オプションは以下のようになります。
@z

@x
```yaml
log_opt:
  syslog-address: "tcp://192.168.0.42:123"
```
@y
```yaml
log_opt:
  syslog-address: "tcp://192.168.0.42:123"
```
@z

@x
### net
@y
### net
@z

@x
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and up, use
> [network_mode](index.md#network_mode) and [networks](index.md#networks).
@y
{% comment %}
> [Version 1 file format](compose-versioning.md#version-1) only. In version 2 and up, use
> [network_mode](index.md#network_mode) and [networks](index.md#networks).
{% endcomment %}
> [ファイルフォーアットバージョン 1](compose-versioning#version-1) のみ。
> バージョン 2 またはそれ以降においては、[network_mode](index.md#networkmode) と [networks](index.md#networks) を用いてください。
@z

@x
Network mode. Use the same values as the docker client `--net` parameter.
The `container:...` form can take a service name instead of a container name or
id.
@y
{% comment %}
Network mode. Use the same values as the docker client `--net` parameter.
The `container:...` form can take a service name instead of a container name or
id.
{% endcomment %}
ネットワークモードを設定します。
Docker クライアントの `--net` パラメーターと同じ値を設定します。
`container:...` という書式を使えば、コンテナー名や ID ではなく、サービス名を指定することができます。
@z

@x
```yaml
net: "bridge"
```
```yaml
net: "host"
```
```yaml
net: "none"
```
```yaml
net: "service:[service name]"
```
```yaml
net: "container:[container name/id]"
```
@y
```yaml
net: "bridge"
```
```yaml
net: "host"
```
```yaml
net: "none"
```
```yaml
net: "service:[service name]"
```
```yaml
net: "container:[container name/id]"
```
@z

@x
### pid
@y
### pid
@z

@x
```yaml
pid: "host"
```
@y
```yaml
pid: "host"
```
@z

@x
Sets the PID mode to the host PID mode. This turns on sharing between
container and the host operating system the PID address space. Containers
launched with this flag can access and manipulate other
containers in the bare-metal machine's namespace and vice versa.
@y
{% comment %}
Sets the PID mode to the host PID mode. This turns on sharing between
container and the host operating system the PID address space. Containers
launched with this flag can access and manipulate other
containers in the bare-metal machine's namespace and vice versa.
{% endcomment %}
PID モードをホスト PID モードに設定します。
これはコンテナーとホストオペレーティングシステムとの間で、PID アドレス空間の共有を開始します。
このフラグを使って起動したコンテナーは、ベアメタルマシンの名前空間にあるコンテナーにアクセスし、操作することが可能になります。
逆もまた可能です。
@z

@x
### ports
@y
### ports
@z

@x
Expose ports. Either specify both ports (`HOST:CONTAINER`), or just the container
port (an ephemeral host port is chosen).
@y
{% comment %}
Expose ports. Either specify both ports (`HOST:CONTAINER`), or just the container
port (an ephemeral host port is chosen).
{% endcomment %}
公開用ポートを設定します。
設定は両側のポートを指定するか（`HOST:CONTAINER`）、あるいはコンテナー側のポートのみを指定します（その場合、ホスト側はエフェメラルポートが採用されます）。
@z

@x
> **Note**: When mapping ports in the `HOST:CONTAINER` format, you may experience
> erroneous results when using a container port lower than 60, because YAML
> parses numbers in the format `xx:yy` as a base-60 value. For this reason,
> we recommend always explicitly specifying your port mappings as strings.
@y
{% comment %}
> **Note**: When mapping ports in the `HOST:CONTAINER` format, you may experience
> erroneous results when using a container port lower than 60, because YAML
> parses numbers in the format `xx:yy` as a base-60 value. For this reason,
> we recommend always explicitly specifying your port mappings as strings.
{% endcomment %}
> **メモ**: `HOST:CONTAINER` の書式によってポートをマッピングした場合に、コンテナー側のポートが 60 番未満であるとエラーになることがあります。
> これは YAML パーサーが `xx:yy` の書式内にある数値を 60 進数値として解釈するからです。
> このことからポートマッピングを指定する際には、常に文字列として設定することをお勧めします。
@z

@x
```yaml
ports:
  - "3000"
  - "3000-3005"
  - "8000:8000"
  - "9090-9091:8080-8081"
  - "49100:22"
  - "127.0.0.1:8001:8001"
  - "127.0.0.1:5000-5010:5000-5010"
  - "6060:6060/udp"
  - "12400-12500:1240"
```
@y
```yaml
ports:
  - "3000"
  - "3000-3005"
  - "8000:8000"
  - "9090-9091:8080-8081"
  - "49100:22"
  - "127.0.0.1:8001:8001"
  - "127.0.0.1:5000-5010:5000-5010"
  - "6060:6060/udp"
  - "12400-12500:1240"
```
@z

@x
### security_opt
@y
### security_opt
@z

@x
Override the default labeling scheme for each container.
@y
{% comment %}
Override the default labeling scheme for each container.
{% endcomment %}
各コンテナーにおけるデフォルトのラベリングスキーム（labeling scheme）を上書きします。
@z

@x
```yaml
security_opt:
  - label:user:USER
  - label:role:ROLE
```
@y
```yaml
security_opt:
  - label:user:USER
  - label:role:ROLE
```
@z

@x
### stop_signal
@y
### stop_signal
@z

@x
Sets an alternative signal to stop the container. By default `stop` uses
SIGTERM. Setting an alternative signal using `stop_signal` causes
`stop` to send that signal instead.
@y
{% comment %}
Sets an alternative signal to stop the container. By default `stop` uses
SIGTERM. Setting an alternative signal using `stop_signal` causes
`stop` to send that signal instead.
{% endcomment %}
コンテナーに対して別の停止シグナルを設定します。
デフォルトにおいて `stop` は SIGTERM を用います。
`stop_signal` を使って別のシグナルを設定すると `stop` にはそのシグナルが代わりに送信されます。
@z

@x
```yaml
stop_signal: SIGUSR1
```
@y
```yaml
stop_signal: SIGUSR1
```
@z

@x
### ulimits
@y
### ulimits
@z

@x
Override the default ulimits for a container. You can either specify a single
limit as an integer or soft/hard limits as a mapping.
@y
{% comment %}
Override the default ulimits for a container. You can either specify a single
limit as an integer or soft/hard limits as a mapping.
{% endcomment %}
コンテナーにおけるデフォルトの ulimits を上書きします。
1 つの limit を整数値として指定するか、ソフト、ハードの limit をマッピングとして指定することができます。
@z

@x
```yaml
ulimits:
  nproc: 65535
  nofile:
    soft: 20000
    hard: 40000
```
@y
```yaml
ulimits:
  nproc: 65535
  nofile:
    soft: 20000
    hard: 40000
```
@z

@x
### volumes, volume\_driver
@y
### volumes, volume\_driver
@z

@x
Mount paths or named volumes, optionally specifying a path on the host machine
(`HOST:CONTAINER`), or an access mode (`HOST:CONTAINER:ro`).
For [version 2 files](compose-versioning.md#version-2), named volumes need to be specified with the
[top-level `volumes` key](compose-file-v2.md#volume-configuration-reference).
When using [version 1](compose-versioning.md#version-1), the Docker Engine creates the named
volume automatically if it doesn't exist.
@y
{% comment %}
Mount paths or named volumes, optionally specifying a path on the host machine
(`HOST:CONTAINER`), or an access mode (`HOST:CONTAINER:ro`).
For [version 2 files](compose-versioning.md#version-2), named volumes need to be specified with the
[top-level `volumes` key](compose-file-v2.md#volume-configuration-reference).
When using [version 1](compose-versioning.md#version-1), the Docker Engine creates the named
volume automatically if it doesn't exist.
{% endcomment %}
パスまたは名前つきボリュームをマウントします。
任意の設定としてホストマシン上のパスを指定したり（`HOST:CONTAINER`）、アクセスモードを指定したり(`HOST:CONTAINER:ro`)することができます。
[ファイルフォーマットバージョン 2](compose-versioning.md#version-2) における名前つきボリュームは、[最上位の `volumes` キー](compose-file-v2.md#volume-configuration-reference) において指定しておく必要があります。
[バージョン 1](compose-versioning.md#version-1) を利用している場合、名前つきボリュームが存在しないときは Docker Engine が自動的に生成します。
@z

@x
You can mount a relative path on the host, which expands relative to
the directory of the Compose configuration file being used. Relative paths
should always begin with `.` or `..`.
@y
{% comment %}
You can mount a relative path on the host, which expands relative to
the directory of the Compose configuration file being used. Relative paths
should always begin with `.` or `..`.
{% endcomment %}
ホスト上の相対パスをマウントすることができます。
これは、用いられている Compose 設定ファイルのディレクトリからの相対パスとして展開されます。
相対パスは `.` または `..` で書き始める必要があります。
@z

@x
```yaml
volumes:
  # Just specify a path and let the Engine create a volume
  - /var/lib/mysql

  # Specify an absolute path mapping
  - /opt/data:/var/lib/mysql

  # Path on the host, relative to the Compose file
  - ./cache:/tmp/cache

  # User-relative path
  - ~/configs:/etc/configs/:ro

  # Named volume
  - datavolume:/var/lib/mysql
```
@y
{% comment %}
```yaml
volumes:
  # Just specify a path and let the Engine create a volume
  - /var/lib/mysql

  # Specify an absolute path mapping
  - /opt/data:/var/lib/mysql

  # Path on the host, relative to the Compose file
  - ./cache:/tmp/cache

  # User-relative path
  - ~/configs:/etc/configs/:ro

  # Named volume
  - datavolume:/var/lib/mysql
```
{% endcomment %}
```yaml
volumes:
  # パス指定のみ。Engine にボリュームを生成させます。
  - /var/lib/mysql

  # 絶対パスのマッピングを指定。
  - /opt/data:/var/lib/mysql

  # ホストからのパス指定。Compose ファイルからの相対パス。
  - ./cache:/tmp/cache

  # ユーザーディレクトリからの相対パス。
  - ~/configs:/etc/configs/:ro

  # 名前つきボリューム。
  - datavolume:/var/lib/mysql
```
@z

@x
If you do not use a host path, you may specify a `volume_driver`.
@y
{% comment %}
If you do not use a host path, you may specify a `volume_driver`.
{% endcomment %}
ホストパスを利用せずに `volume_driver` を設定することもできます。
@z

@x
```yaml
volume_driver: mydriver
```
@y
```yaml
volume_driver: mydriver
```
@z

@x
There are several things to note, depending on which
[Compose file version](compose-versioning.md#versioning) you're using:
@y
{% comment %}
There are several things to note, depending on which
[Compose file version](compose-versioning.md#versioning) you're using:
{% endcomment %}
[Compose ファイルバージョン](compose-versioning.md#versioning) に応じて、以下のことを明記しておきます。
@z

@x
- For [version 1 files](compose-versioning.md#version-1), both named volumes and
  container volumes use the specified driver.
@y
{% comment %}
- For [version 1 files](compose-versioning.md#version-1), both named volumes and
  container volumes use the specified driver.
{% endcomment %}
- [ファイルフォーマットバージョン 1](compose-versioning.md#version-1) においては, 名前つきボリュームとコンテナーボリュームは、どちらも特定のドライバーを利用します。
@z

@x
- No path expansion is done if you have also specified a `volume_driver`.
  For example, if you specify a mapping of `./foo:/data`, the `./foo` part
  is passed straight to the volume driver without being expanded.
@y
{% comment %}
- No path expansion is done if you have also specified a `volume_driver`.
  For example, if you specify a mapping of `./foo:/data`, the `./foo` part
  is passed straight to the volume driver without being expanded.
{% endcomment %}
- `volume_driver` も合わせて指定していた場合、パスの解釈は行われません。
  たとえばパスのマッピングを `./foo:/data` としたとします。
  このとき `./foo` の部分はボリュームドライバーにそのまま引き渡され、パスが展開されることはありません。
@z

@x
See [Docker Volumes](../../storage/volumes.md) and
[Volume Plugins](/engine/extend/plugins_volume/) for more information.
@y
{% comment %}
See [Docker Volumes](../../storage/volumes.md) and
[Volume Plugins](/engine/extend/plugins_volume/) for more information.
{% endcomment %}
詳しくは [Docker ボリューム](../../storage/volumes.md) と [ボリュームプラグイン](/engine/extend/plugins_volume/) を参照してください。
@z

@x
### volumes_from
@y
### volumes_from
@z

@x
Mount all of the volumes from another service or container, optionally
specifying read-only access (``ro``) or read-write (``rw``). If no access level
is specified, then read-write is used.
@y
{% comment %}
Mount all of the volumes from another service or container, optionally
specifying read-only access (``ro``) or read-write (``rw``). If no access level
is specified, then read-write is used.
{% endcomment %}
別のサービスやコンテナーのボリュームをすべてマウントします。
任意の設定として、アクセスを読み込み専用（`ro`）とするか、読み書き可能（`rw`）とするかを指定できます。
アクセスレベルが何も設定されていないときは、読み書き可能として設定されます。
@z

@x
```yaml
volumes_from:
  - service_name
  - service_name:ro
```
@y
```yaml
volumes_from:
  - service_name
  - service_name:ro
```
@z

@x
### cpu\_shares, cpu\_quota, cpuset, domainname, hostname, ipc, mac\_address, mem\_limit, memswap\_limit, mem\_swappiness, privileged, read\_only, restart, shm\_size, stdin\_open, tty, user, working\_dir
@y
### cpu\_shares, cpu\_quota, cpuset, domainname, hostname, ipc, mac\_address, mem\_limit, memswap\_limit, mem\_swappiness, privileged, read\_only, restart, shm\_size, stdin\_open, tty, user, working\_dir
@z

@x
Each of these is a single value, analogous to its
[docker run](../../engine/reference/run.md) counterpart.
@y
{% comment %}
Each of these is a single value, analogous to its
[docker run](../../engine/reference/run.md) counterpart.
{% endcomment %}
ここに示すオプションはいずれも、値 1 つを設定するものであり、[docker run](../../engine/reference/run.md) のオプションに対応づいています。
@z

@x
```yaml
cpu_shares: 73
cpu_quota: 50000
cpuset: 0,1

user: postgresql
working_dir: /code

domainname: foo.com
hostname: foo
ipc: host
mac_address: 02:42:ac:11:65:43

mem_limit: 1000000000
memswap_limit: 2000000000
privileged: true

restart: always

read_only: true
shm_size: 64M
stdin_open: true
tty: true
```
@y
```yaml
cpu_shares: 73
cpu_quota: 50000
cpuset: 0,1

user: postgresql
working_dir: /code

domainname: foo.com
hostname: foo
ipc: host
mac_address: 02:42:ac:11:65:43

mem_limit: 1000000000
memswap_limit: 2000000000
privileged: true

restart: always

read_only: true
shm_size: 64M
stdin_open: true
tty: true
```
@z

@x
## Compose documentation
@y
{% comment %}
## Compose documentation
{% endcomment %}
{: #compose-documentation }
## Compose ドキュメント
@z

@x
- [User guide](../index.md)
- [Installing Compose](../install.md)
- [Compose file versions and upgrading](compose-versioning.md)
- [Sample apps with Compose](../samples-for-compose.md)
- [Command line reference](../reference/index.md)
@y
{% comment %}
- [User guide](../index.md)
- [Installing Compose](../install.md)
- [Compose file versions and upgrading](compose-versioning.md)
- [Sample apps with Compose](../samples-for-compose.md)
- [Command line reference](../reference/index.md)
{% endcomment %}
- [ユーザーガイド](../index.md)
- [Compose のインストール](../install.md)
- [Compose ファイルバージョン and upgrading](compose-versioning.md)
- [Compose を使ったサンプルアプリ](../samples-for-compose.md)
- [コマンドラインリファレンス](../reference/index.md)
@z
