%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose file reference
keywords: fig, composition, compose version 2, docker
title: Compose file version 2 reference
toc_max: 4
toc_min: 1
---
@y
---
description: Compose ファイルリファレンス
keywords: fig, composition, compose version 2, docker
title: Compose ファイル バージョン 2 リファレンス
toc_max: 4
toc_min: 1
---
@z

@x
## Reference and guidelines
@y
{: #reference-and-guidelines }
## リファレンスとガイドライン
@z

@x
These topics describe version 2 of the Compose file format.
@y
ここに示す内容は Compose ファイルフォーマット、バージョン 2 です。
@z

@x
## Compose and Docker compatibility matrix
@y
{: #compose-and-docker-compatibility-matrix }
## Compose と Docker の互換マトリックス
@z

@x
There are several versions of the Compose file format – 1, 2, 2.x, and 3.x. The
table below is a quick look. For full details on what each version includes and
how to upgrade, see **[About versions and upgrading](compose-versioning.md)**.
@y
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
{: #service-configuration-reference }
## サービス設定リファレンス
@z

@x
The Compose file is a [YAML](https://yaml.org) file defining
[services](#service-configuration-reference),
[networks](#network-configuration-reference) and
[volumes](#volume-configuration-reference).
The default path for a Compose file is `./docker-compose.yml`.
@y
Compose ファイルは [YAML](https://yaml.org) 形式のファイルであり、[サービス（services）](#service-configuration-reference)、[ネットワーク（networks）](#network-configuration-reference)、[ボリューム（volumes）](#volume-configuration-reference)を定義します。
Compose ファイルのデフォルトパスは`./docker-compose.yml`です。
@z

@x
> **Tip**: You can use either a `.yml` or `.yaml` extension for this file.
> They both work.
@y
> **ヒント**: このファイルの拡張子は`.yml`と`.yaml`のどちらでも構いません。
> いずれでも動作します。
@z

@x
A service definition contains configuration that is applied to each
container started for that service, much like passing command-line parameters to
`docker run`. Likewise, network and volume definitions are analogous to
`docker network create` and `docker volume create`.
@y
サービスの定義には、対応するサービスを起動する各コンテナーに適用される設定を行ないます。
コマンドラインから`docker run`のパラメーターを受け渡すことと、非常によく似ています。
同様に、ネットワークの定義、ボリュームの定義は、それぞれ`docker network create`と`docker volume create`のコマンドに対応づくものです。
@z

@x
As with `docker run`, options specified in the Dockerfile, such as `CMD`,
`EXPOSE`, `VOLUME`, `ENV`, are respected by default - you don't need to
specify them again in `docker-compose.yml`.
@y
`docker run`に関しても同じことが言えますが、Dockerfile にて指定された `CMD`、`EXPOSE`、`VOLUME`、`ENV` のようなオプションはデフォルトでは維持されます。したがって`docker-compose.yml`の中で再度設定する必要はありません。
@z

@x
You can use environment variables in configuration values with a Bash-like
`${VARIABLE}` syntax - see [variable substitution](#variable-substitution) for
full details.
@y
設定を記述する際には環境変数を用いることができます。
環境変数は Bash 風に`${VARIABLE}`のように記述します。
詳しくは [変数の置換](#variable-substitution) を参照してください。
@z

@x
This section contains a list of all configuration options supported by a service
definition in version 2.
@y
このセクションでは、バージョン 2 のサービス定義においてサポートされている設定オプションをすべて説明しています。
@z

@x
### blkio_config
@y
### blkio_config
@z

@x
A set of configuration options to set block IO limits for this service.
@y
サービスのブロック IO に対する制限を行う設定オプションです。
@z

@x
    version: "{{ site.compose_file_v2 }}"
    services:
      foo:
        image: busybox
        blkio_config:
          weight: 300
          weight_device:
            - path: /dev/sda
              weight: 400
          device_read_bps:
            - path: /dev/sdb
              rate: '12mb'
          device_read_iops:
            - path: /dev/sdb
              rate: 120
          device_write_bps:
            - path: /dev/sdb
              rate: '1024k'
          device_write_iops:
            - path: /dev/sdb
              rate: 30
@y
    version: "{{ site.compose_file_v2 }}"
    services:
      foo:
        image: busybox
        blkio_config:
          weight: 300
          weight_device:
            - path: /dev/sda
              weight: 400
          device_read_bps:
            - path: /dev/sdb
              rate: '12mb'
          device_read_iops:
            - path: /dev/sdb
              rate: 120
          device_write_bps:
            - path: /dev/sdb
              rate: '1024k'
          device_write_iops:
            - path: /dev/sdb
              rate: 30
@z

@x
#### device_read_bps, device_write_bps
@y
#### device_read_bps, device_write_bps
@z

@x
Set a limit in bytes per second for read / write operations on a given device.
Each item in the list must have two keys:
@y
指定されたデバイス上での読み書き操作に対して、秒ごとのバイト上限値を設定します。
設定するリストの各項目には、以下の 2 つのキーが必要です。
@z

@x
* `path`, defining the symbolic path to the affected device
* `rate`, either as an integer value representing the number of bytes or as
  a string expressing a [byte value](#specifying-byte-values).
@y
* `path`、影響を受けるデバイスへのシンボリックパスを指定します。
* `rate`、バイト数を表わす整数値、または [バイト値](#specifying-byte-values) を表現する文字列を指定します。
@z

@x
#### device_read_iops, device_write_iops
@y
#### device_read_iops, device_write_iops
@z

@x
Set a limit in operations per second for read / write operations on a given
device. Each item in the list must have two keys:
@y
指定されたデバイス上での読み書き操作に対して、秒ごとの操作上限値を設定します。
設定するリストの各項目には、以下の 2 つのキーが必要です。
@z

@x
* `path`, defining the symbolic path to the affected device
* `rate`, as an integer value representing the permitted number of operations
  per second.
@y
* `path`、影響を受けるデバイスへのシンボリックパスを指定します。
* `rate`、許容する操作数を表わす整数値を指定します。
@z

@x
#### weight
@y
#### weight
@z

@x
Modify the proportion of bandwidth allocated to this service relative to other
services. Takes an integer value between 10 and 1000, with 500 being the
default.
@y
他のサービスと比べたときの、当サービスに割り当てる処理性能比を設定します。
10 から 1000 までの整数値を割り当てるもので、デフォルト値は 500 です。
@z

@x
#### weight_device
@y
#### weight_device
@z

@x
Fine-tune bandwidth allocation by device. Each item in the list must have
two keys:
@y
デバイスへの処理割り当て量を調整します。
設定するリストの各項目には以下の 2 つのキーが必要です。
@z

@x
* `path`, defining the symbolic path to the affected device
* `weight`, an integer value between 10 and 1000
@y
* `path`、影響を受けるデバイスへのシンボリックパスを指定します。
* `weight`、10 から 1000 までの整数値を指定します。
@z

@x
### build
@y
### build
@z

@x
Configuration options that are applied at build time.
@y
この設定オプションはビルド時に適用されます。
@z

@x
`build` can be specified either as a string containing a path to the build
context:
@y
`build` の指定は 1 つには、ビルドコンテキストへのパスを表わす文字列を指定します。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  webapp:
    build: ./dir
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  webapp:
    build: ./dir
```
@z

@x
Or, as an object with the path specified under [context](#context) and
optionally [Dockerfile](#dockerfile) and [args](#args):
@y
あるいは [コンテキスト](#context) 内にあるパスを指定したオブジェクトとし、必要に応じて [Dockerfile](#dockerfile) や [引数](#args) を指定します。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  webapp:
    build:
      context: ./dir
      dockerfile: Dockerfile-alternate
      args:
        buildno: 1
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  webapp:
    build:
      context: ./dir
      dockerfile: Dockerfile-alternate
      args:
        buildno: 1
```
@z

@x
If you specify `image` as well as `build`, then Compose names the built image
with the `webapp` and optional `tag` specified in `image`:
@y
`build`に加えて`image`も指定した場合、Compose はビルドイメージに名前をつけます。
たとえば以下のように`image`を指定すると、イメージ名を`webapp`、オプションのタグを`tag`という名前にします。
@z

@x
```yaml
build: ./dir
image: webapp:tag
```
@y
```yaml
build: ./dir
image: webapp:tag
```
@z

@x
This results in an image named `webapp` and tagged `tag`, built from `./dir`.
@y
結果としてイメージ名は`webapp`であり`tag`というタグづけが行われます。
そしてこのイメージは`./dir`から作り出されます。
@z

@x
#### context
@y
#### context
@z

@x
> Added in [version 2.0](compose-versioning.md#version-2) file format.
@y
> ファイルフォーマット[バージョン 2.0](compose-versioning.md#version-2) において追加されました。
@z

@x
Either a path to a directory containing a Dockerfile, or a url to a git repository.
@y
Dockerfile を含むディレクトリへのパスか、あるいは git リポジトリの URL を設定します。
@z

@x
When the value supplied is a relative path, it is interpreted as relative to the
location of the Compose file. This directory is also the build context that is
sent to the Docker daemon.
@y
設定された記述が相対パスを表わしている場合、Compose ファイルのあるディレクトリからの相対パスとして解釈されます。
このディレクトリはビルドコンテキストでもあり、Docker デーモンへ送信されるディレクトリです。
@z

@x
Compose builds and tags it with a generated name, and uses that image
thereafter.
@y
Compose は指定された名前により、イメージのビルドとタグづけを行い、後々これを利用します。
@z

@x
```yaml
build:
  context: ./dir
```
@y
```yaml
build:
  context: ./dir
```
@z

@x
#### dockerfile
@y
#### dockerfile
@z

@x
Alternate Dockerfile.
@y
別の Dockerfile を指定します。
@z

@x
Compose uses an alternate file to build with. A build path must also be
specified.
@y
Compose は指定された別の Dockerfile を使ってビルドを行います。
このときは、ビルドパスを同時に指定しなければなりません。
@z

@x
```yaml
build:
  context: .
  dockerfile: Dockerfile-alternate
```
@y
```yaml
build:
  context: .
  dockerfile: Dockerfile-alternate
```
@z

@x
#### args
@y
#### args
@z

@x
> Added in [version 2.0](compose-versioning.md#version-2) file format.
@y
> ファイルフォーマット[バージョン 2.0](compose-versioning.md#version-2) において追加されました。
@z

@x
Add build arguments, which are environment variables accessible only during the
build process.
@y
ビルド引数を追加します。
これは環境変数であり、ビルド処理の間だけ利用可能なものです。
@z

@x
First, specify the arguments in your Dockerfile:
@y
Dockerfile 内にてはじめにビルド引数を指定します。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1

ARG buildno
ARG gitcommithash

RUN echo "Build number: $buildno"
RUN echo "Based on commit: $gitcommithash"
```
@y
```dockerfile
# syntax=docker/dockerfile:1

ARG buildno
ARG gitcommithash

RUN echo "Build number: $buildno"
RUN echo "Based on commit: $gitcommithash"
```
@z

@x
Then specify the arguments under the `build` key. You can pass a mapping
or a list:
@y
そして`build`キーのもとにその引数を指定します。
指定は個々をマッピングする形式か、リストとする形式が可能です。
@z

@x
```yaml
build:
  context: .
  args:
    buildno: 1
    gitcommithash: cdc3b19
```
@y
```yaml
build:
  context: .
  args:
    buildno: 1
    gitcommithash: cdc3b19
```
@z

@x
```yaml
build:
  context: .
  args:
    - buildno=1
    - gitcommithash=cdc3b19
```
@y
```yaml
build:
  context: .
  args:
    - buildno=1
    - gitcommithash=cdc3b19
```
@z

@x
> Scope of build-args
>
> In your Dockerfile, if you specify `ARG` before the `FROM` instruction,
> `ARG` is not available in the build instructions under `FROM`.
> If you need an argument to be available in both places, also specify it under
> the `FROM` instruction. Refer to the [understand how ARGS and FROM interact](../../engine/reference/builder.md#understand-how-arg-and-from-interact)
> section in the documentation for usage details.
@y
> ビルド引数のスコープ
>
> Dockerfile にて`FROM`命令の前に`ARG`命令を指定した場合、`FROM`以降のビルド命令において`ARG`の値は利用することができません。
> `FROM`の前後どこでも、そして特に`FROM`命令の後でもその値を利用したい場合は、[ARG と FROM の関連について](../../engine/reference/builder.md#understand-how-arg-and-from-interact) を参照してください。
@z

@x
You can omit the value when specifying a build argument, in which case its value
at build time is the value in the environment where Compose is running.
@y
ビルド引数の指定にあたって、その値設定を省略することができます。
この場合、ビルド時におけるその値は、Compose を起動している環境での値になります。
@z

@x
```yaml
args:
  - buildno
  - gitcommithash
```
@y
```yaml
args:
  - buildno
  - gitcommithash
```
@z

@x
> Tip when using boolean values
>
> YAML boolean values (`"true"`, `"false"`, `"yes"`, `"no"`, `"on"`,
> `"off"`) must be enclosed in quotes, so that the parser interprets them as
> strings.
@y
> ブール値利用時のメモ
>
> YAML のブール値 (`true`, `false`, `yes`, `no`, `on`, `off`) を用いる場合は、クォートで囲む必要があります。
> そうすることで、これらの値は文字列として解釈されます。
@z

@x
#### cache_from
@y
#### cache_from
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format
@y
> ファイルフォーマット[バージョン 2.2](compose-versioning.md#version-22) において追加されました。
@z

@x
A list of images that the engine uses for cache resolution.
@y
エンジンがキャッシュ解決のために利用するイメージを設定します。
@z

@x
```yaml
build:
  context: .
  cache_from:
    - alpine:latest
    - corp/web_app:3.14
```
@y
```yaml
build:
  context: .
  cache_from:
    - alpine:latest
    - corp/web_app:3.14
```
@z

@x
#### extra_hosts
@y
#### extra_hosts
@z

@x
Add hostname mappings at build-time. Use the same values as the docker client `--add-host` parameter.
@y
ビルド時におけるホスト名のマッピングを追加します。
Docker Client の`--add-host`パラメーターと同じ値を設定してください。
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
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this build, e.g:
@y
ホスト名と IP アドレスによるこの設定内容は、サービスコンテナー内の`/etc/hosts`に追加されます。
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
#### isolation
@y
#### isolation
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> [ファイルフォーマットバージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
Specify a build’s container isolation technology. On Linux, the only supported value
is `default`. On Windows, acceptable values are `default`, `process` and
`hyperv`. Refer to the
[Docker Engine docs](../../engine/reference/commandline/run.md#specify-isolation-technology-for-container---isolation)
for details.
@y
ビルドにおけるコンテナーの分離技術（isolation technology）を設定します。
Linux においてサポートされるのは`default`のみです。
Windows では`default`、`process`、`hyperv`の設定が可能です。
詳しくは [Docker Engine ドキュメント](../../engine/reference/commandline/run.md#specify-isolation-technology-for-container---isolation) を参照してください。
@z

@x
If unspecified, Compose will use the `isolation` value found in the service's definition
to determine the value to use for builds.
@y
設定されていない場合、Compose は service 定義の中から`isolation`値を見つけて、これをビルド時に利用する値とします。
@z

@x
#### labels
@y
#### labels
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
Add metadata to the resulting image using [Docker labels](../../config/labels-custom-metadata.md).
You can use either an array or a dictionary.
@y
[Docker labels](../../config/labels-custom-metadata.md) を使ってビルドされるイメージにメタデータを追加します。
配列形式と辞書形式のいずれかにより指定します。
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@y
他のソフトウェアが用いるラベルとの競合を避けるため、逆 DNS 記法とすることをお勧めします。
@z

@x
```yaml
build:
  context: .
  labels:
    com.example.description: "Accounting webapp"
    com.example.department: "Finance"
    com.example.label-with-empty-value: ""
```
@y
```yaml
build:
  context: .
  labels:
    com.example.description: "Accounting webapp"
    com.example.department: "Finance"
    com.example.label-with-empty-value: ""
```
@z

@x
```yaml
build:
  context: .
  labels:
    - "com.example.description=Accounting webapp"
    - "com.example.department=Finance"
    - "com.example.label-with-empty-value"
```
@y
```yaml
build:
  context: .
  labels:
    - "com.example.description=Accounting webapp"
    - "com.example.department=Finance"
    - "com.example.label-with-empty-value"
```
@z

@x
#### network
@y
#### network
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format
@y
> ファイルフォーマット[バージョン 2.2](compose-versioning.md#version-22) において追加されました。
@z

@x
Set the network containers connect to for the `RUN` instructions during
build.
@y
ビルド時の`RUN`命令において接続するネットワークコンテナーを設定します。
@z

@x
```yaml
build:
  context: .
  network: host
```
@y
```yaml
build:
  context: .
  network: host
```
@z

@x
```yaml
build:
  context: .
  network: custom_network_1
```
@y
```yaml
build:
  context: .
  network: custom_network_1
```
@z

@x
Use `none` to disable networking during build:
@y
`none`を指定すると、ビルド中のネットワークを無効にします。
@z

@x
```yaml
build:
  context: .
  network: none
```
@y
```yaml
build:
  context: .
  network: none
```
@z

@x
#### shm_size
@y
#### shm_size
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format
@y
> ファイルフォーマット[バージョン 2.3](compose-versioning.md#version-23) において追加されました。
@z

@x
Set the size of the `/dev/shm` partition for this build's containers. Specify
as an integer value representing the number of bytes or as a string expressing
a [byte value](#specifying-byte-values).
@y
このビルドコンテナーにおける`/dev/shm`パーティションのサイズを設定します。
指定する値は、バイト数を表わす整数値か、あるいは [バイト表現](#specifying-byte-values) によって表わされる文字列とします。
@z

@x
```yaml
build:
  context: .
  shm_size: '2gb'
```
@y
```yaml
build:
  context: .
  shm_size: '2gb'
```
@z

@x
```yaml
build:
  context: .
  shm_size: 10000000
```
@y
```yaml
build:
  context: .
  shm_size: 10000000
```
@z

@x
#### target
@y
#### target
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format
@y
> ファイルフォーマット[バージョン 2.3](compose-versioning.md#version-23) において追加されました。
@z

@x
Build the specified stage as defined inside the `Dockerfile`. See the
[multi-stage build docs](../../develop/develop-images/multistage-build.md) for
details.
@y
`Dockerfile` 内部に定義されている特定のステージをビルドする方法は、[マルチステージビルド](../../develop/develop-images/multistage-build.md) を参照してください。
@z

@x
```yaml
build:
  context: .
  target: prod
```
@y
```yaml
build:
  context: .
  target: prod
```
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
コンテナーケーパビリティーの機能を追加または削除します。
詳細な一覧は`man 7 capabilities`を参照してください。
@z

@x
```yaml
cap_add:
  - ALL

cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
```
@y
```yaml
cap_add:
  - ALL

cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
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
### command
@y
### command
@z

@x
Override the default command.
@y
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
### container_name
@y
### container_name
@z

@x
Specify a custom container name, rather than a generated default name.
@y
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
Because Docker container names must be unique, you cannot scale a service beyond
1 container if you have specified a custom name. Attempting to do so results in
an error.
@y
Docker コンテナー名はユニークである必要があります。
そこで独自のコンテナー名を設定したときは、サービスをスケールアップして複数コンテナーとすることはできません。
これを行うとエラーが発生します。
@z

@x
### cpu_rt_runtime, cpu_rt_period
@y
### cpu_rt_runtime, cpu_rt_period
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format
@y
> ファイルフォーマット[バージョン 2.2](compose-versioning.md#version-22) において追加されました。
@z

@x
Configure CPU allocation parameters using the Docker daemon realtime scheduler.
@y
Docker デーモンのリアルタイムスケジューラーが利用する CPU 割り当てパラメーターを設定します。
@z

@x
```yaml
cpu_rt_runtime: '400ms'
cpu_rt_period: '1400us'
```
@y
```yaml
cpu_rt_runtime: '400ms'
cpu_rt_period: '1400us'
```
@z

@x
Integer values will use microseconds as units:
@y
マイクロ秒単位で整数値を指定します。
@z

@x
```yaml
cpu_rt_runtime: 95000
cpu_rt_period: 11000
```
@y
```yaml
cpu_rt_runtime: 95000
cpu_rt_period: 11000
```
@z

@x
### device_cgroup_rules
@y
### device_cgroup_rules
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format.
@y
> ファイルフォーマット[バージョン 2.3](compose-versioning.md#version-23) において追加されました。
@z

@x
Add rules to the cgroup allowed devices list.
@y
cgroup がアクセス可能なデバイスリストにルールを追加します。
@z

@x
```yaml
device_cgroup_rules:
  - 'c 1:3 mr'
  - 'a 7:* rmw'
```
@y
```yaml
device_cgroup_rules:
  - 'c 1:3 mr'
  - 'a 7:* rmw'
```
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
デバイスのマッピングをリスト形式で設定します。
Docker クライアントの create オプションの`--device`と同じ書式にします。
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
### depends_on
@y
### depends_on
@z

@x
> Added in [version 2.0](compose-versioning.md#version-2) file format.
@y
> ファイルフォーマット[バージョン 2.0](compose-versioning.md#version-23) において追加されました。
@z

@x
Express dependency between services. Service dependencies cause the following
behaviors:
@y
サービス間の依存関係を表わします。
これにより以下の 2 つの効果が表れます。
@z

@x
- `docker-compose up` starts services in dependency order. In the following
  example, `db` and `redis` are started before `web`.
@y
- `docker-compose up`は依存関係の順にサービスを起動します。
  以下の例において`db`と`redis`は`web`の後に起動します。
@z

@x
- `docker-compose up SERVICE` automatically includes `SERVICE`'s
  dependencies. In the example below, `docker-compose up web` also
  creates and starts `db` and `redis`.
@y
- `docker-compose up SERVICE`を実行すると `SERVICE`における依存関係をもとに動作します。
  以下の例において`docker-compose up web`を実行すると`db`と`redis`を生成して起動します。
@z

@x
Simple example:
@y
以下がその簡単な例です。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  web:
    build: .
    depends_on:
      - db
      - redis
  redis:
    image: redis
  db:
    image: postgres
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  web:
    build: .
    depends_on:
      - db
      - redis
  redis:
    image: redis
  db:
    image: postgres
```
@z

@x
> **Note**
>
> `depends_on` does not wait for `db` and `redis` to be "ready" before
> starting `web` - only until they have been started. If you need to wait
> for a service to be ready, see [Controlling startup order](../startup-order.md)
> for more on this problem and strategies for solving it.
@y
> **メモ**
>
> `depends_on`では`db`や`redis`が「準備」状態になるのを待たずに、つまりそれらを開始したらすぐに`web`を起動します。
> 準備状態になるのを待ってから次のサービスを起動することが必要な場合は、[Compose における起動順の制御](../startup-order.md) にて示す内容と解決方法を確認してください。
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
A healthcheck indicates that you want a dependency to wait
for another container to be "healthy" (as indicated by a successful state from
the healthcheck) before starting.
@y
ヘルスチェックは、依存するコンテナーが起動する場合には、別のコンテナーが「健康」（healthy）となることを待って起動するようにチェックすることを指します。
（「健康」であることは、ヘルスチェックによって正常な状態であることが示されたことを表わします。）
@z

@x
Example:
@y
以下がその例です。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  web:
    build: .
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
  redis:
    image: redis
  db:
    image: postgres
    healthcheck:
      test: "exit 0"
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  web:
    build: .
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
  redis:
    image: redis
  db:
    image: postgres
    healthcheck:
      test: "exit 0"
```
@z

@x
In the above example, Compose waits for the `redis` service to be started
(legacy behavior) and the `db` service to be healthy before starting `web`.
@y
上の例において Compose は`redis`サービスが起動するのを待ちます（従来からの動作）。
さらに`db`サービスが「健康」になることを待って`web`サービスを起動します。
@z

@x
See the [healthcheck section](#healthcheck) for complementary
information.
@y
さらなる情報については [ヘルスチェックの節](#healthcheck) を参照してください。
@z

@x
### dns
@y
### dns
@z

@x
Custom DNS servers. Can be a single value or a list.
@y
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
### dns_opt
@y
### dns_opt
@z

@x
List of custom DNS options to be added to the container's `resolv.conf` file.
@y
コンテナーの`resolv.conf`ファイルに追加する独自の DNS オプションを、リスト形式で設定します。
@z

@x
```yaml
dns_opt:
  - use-vc
  - no-tld-query
```
@y
```yaml
dns_opt:
  - use-vc
  - no-tld-query
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
エントリーポイントはリスト形式で設定することができます。
その指定方法は [dockerfile](../../engine/reference/builder.md#entrypoint) と同様です。
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
> **Note**
>
> Setting `entrypoint` both overrides any default entrypoint set on the service's
> image with the `ENTRYPOINT` Dockerfile instruction, *and* clears out any default
> command on the image - meaning that if there's a `CMD` instruction in the
> Dockerfile, it is ignored.
@y
> **メモ**
>
> `entrypoint`を設定すると、サービスイメージ内に Dockerfile 命令の`ENTRYPOINT`によって設定されているデフォルトのエントリーポイントは上書きされ、**さらに**イメージ内のあらゆるデフォルトコマンドもクリアされます。
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
ファイルを用いて環境変数を追加します。
設定は 1 つだけとするか、リストにすることができます。
@z

@x
If you have specified a Compose file with `docker-compose -f FILE`, paths in
`env_file` are relative to the directory that file is in.
@y
Compose ファイルを`docker-compose -f FILE`という起動により指定している場合、`env_file`におけるパスは、Compose ファイルがあるディレクトリからの相対パスとします。
@z

@x
Environment variables declared in the [environment](#environment) section
_override_ these values &ndash; this holds true even if those values are
empty or undefined.
@y
環境変数が [environment](#environment) の項に宣言されていれば、ここでの設定を**オーバーライド**します。
たとえ設定値が空や未定義であっても、これは変わりません。
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
beginning with `#` are treated as comments and are ignored. Blank lines are
also ignored.
@y
env ファイルの各行は`VAR=VAL`の書式とします。
行先頭に`#`があると、コメント行となり無視されます。
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
> **Note**
>
> If your service specifies a [build](#build) option, variables defined in
> environment files are _not_ automatically visible during the build. Use
> the [args](#args) sub-option of `build` to define build-time environment
> variables.
@y
> **メモ**
>
> サービスに [build](#build) オプションを指定している場合、env ファイル内に定義された変数は、ビルド時にこのままでは自動的に参照されません。
> その場合は`build`のサブオプション [args](#args) を利用して、ビルド時の環境変数を設定してください。
@z

@x
The value of `VAL` is used as is and not modified at all. For example if the
value is surrounded by quotes (as is often the case of shell variables), the
quotes are included in the value passed to Compose.
@y
`VAL`の値は記述されたとおりに用いられ、一切修正はされません。
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
ファイルを複数用いる場合の順番には気をつけてください。
特に何度も出現する変数に対して、値がどのように決定されるかです。
ファイルが複数指定された場合、その処理は上から順に行われます。
たとえば`a.env`ファイルに変数が指定されていて、`b.env`ファイルには同じ変数が異なる値で定義されていたとします。
ここで`b.env`ファイルが下に（後に）指定されているとします。
このとき変数の値は`b.env`のものが採用されます。
さらに例として`docker-compose.yml`に以下のような宣言があったとします。
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
この結果`$VAR`は`hello`になります。
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
環境変数を追加します。
配列形式または辞書形式での指定が可能です。
ブール値（`true`, `false`, `yes`, `no`）を用いる場合は、クォートで囲むことで YML パーサーによって True や False に変換されてしまうのを防ぐ必要があります。
@z

@x
Environment variables with only a key are resolved to their values on the
machine Compose is running on, which can be helpful for secret or host-specific values.
@y
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
> **Note**
>
> If your service specifies a [build](#build) option, variables defined in
> `environment` are _not_ automatically visible during the build. Use the
> [args](#args) sub-option of `build` to define build-time environment
> variables.
@y
> **メモ**
> 
> サービスに [build](#build) オプションを指定している場合、env ファイル内に定義された変数は、ビルド時にこのままでは自動的に参照されません。
> その場合は`build`のサブオプション [args](#args) を利用して、ビルド時の環境変数を設定してください。
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
現ファイルや別のファイルにある他のサービスを拡張します。
必要に応じて設定を上書きすることもできます。
@z

@x
You can use `extends` on any service together with other configuration keys.
The `extends` value must be a dictionary defined with a required `service`
and an optional `file` key.
@y
別のサービスを`extends`により拡張する際には、合わせて他の設定キーを指定することができます。
`extends`に設定する値は辞書形式であり、`service`キーが必須です。
また必要に応じて指定する`file`キーがあります。
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
The `service` is the name of the service being extended, for example
`web` or `database`. The `file` is the location of a Compose configuration
file defining that service.
@y
`service`は拡張するサービスの名前を指定します。
たとえば`web`や`database`です。
`file`は、サービスを定義する Compose 設定ファイルのパスを指定します。
@z

@x
If you omit the `file` Compose looks for the service configuration in the
current file. The `file` value can be an absolute or relative path. If you
specify a relative path, Compose treats it as relative to the location of the
current file.
@y
`file`の指定を省略した場合、Compose はそのサービス設定を現ファイルの中から探します。
`file`に指定する値は絶対パス、相対パスのいずれでも構いません。
相対パスを指定した場合、Compose は現ファイルのあるディレクトリからの相対パスとして扱います。
@z

@x
You can extend a service that itself extends another. You can extend
indefinitely. Compose does not support circular references and `docker-compose`
returns an error if it encounters one.
@y
拡張するサービスそのものが、他のサービスを拡張したものも指定可能です。
拡張の繰り返しはいくらでもできます。
ただし Compose は循環参照をサポートしていないため、そのような状況が発生した場合は`docker-compose`がエラーを返します。
@z

@x
For more on `extends`, see the
[the extends documentation](../extends.md#extending-services).
@y
`extends`に関する詳細は [extends ドキュメント](../extends.md#extending-services) を参照してください。
@z

@x
### external_links
@y
### external_links
@z

@x
Link to containers started outside this `docker-compose.yml` or even outside of
Compose, especially for containers that provide shared or common services.
`external_links` follow semantics similar to the legacy option `links` when
specifying both the container name and the link alias (`CONTAINER:ALIAS`).
@y
今の`docker-compose.yml`からではない別のところから起動されたコンテナーをリンクします。
あるいは Compose の外から、特に共有サービスや汎用サービスとして提供されるコンテナーをリンクします。
`external_links`の文法は、古いオプション`links`と同様です。
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
> **Note**
>
> If you're using the [version 2 or above file format](compose-versioning.md#version-2),
> the externally-created  containers must be connected to at least one of the same
> networks as the service that is linking to them. [Links](compose-file-v2.md#links)
> are a legacy option. We recommend using [networks](#networks) instead.
@y
> **メモ**
>
> ファイルフォーマット [バージョン 2](compose-versioning.md#version-2) 以降を利用しているときに、外部にて生成されたコンテナーをネットワークに接続する場合は、そのコンテナーがサービスとしてリンクしているネットワークのうちの 1 つでなければなりません。
> [Links](compose-file-v2.md#links) オプションは古いものなので、[networks](#networks) オプションを用いてください。
@z

@x
### extra_hosts
@y
### extra_hosts
@z

@x
Add hostname mappings. Use the same values as the docker client `--add-host` parameter.
@y
ホスト名のマッピングを追加します。
Docker Client の`--add-host`パラメーターと同じ値を設定してください。
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
ホスト名と IP アドレスによるこの設定内容は、サービスコンテナー内の`/etc/hosts`に追加されます。
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
### group_add
@y
### group_add
@z

@x
Specify additional groups (by name or number) which the user inside the
container should be a member of. Groups must exist in both the container and the
host system to be added. An example of where this is useful is when multiple
containers (running as different users) need to all read or write the same
file on the host system. That file can be owned by a group shared by all the
containers, and specified in `group_add`. See the
[Docker documentation](../../engine/reference/run.md#additional-groups) for more
details.
@y
コンテナー内部のユーザーを所属させたい追加のグループを（グループ名か ID により）指定します。
追加のグループは、コンテナーとホストシステムの双方に存在している必要があります。
これが必要になるのは、たとえば複数コンテナーが別々のユーザーによって起動していて、しかもホストシステム上の同一のファイルへの読み書きを行いたいような場合です。
そのファイルが、コンテナーすべてに共通するグループにより所有されているようにすればよく、これを`group_add`により実現できます。
詳しくは [Docker ドキュメント](../../engine/reference/run.md#additional-groups) を参照してください。
@z

@x
A full example:
@y
全体的な例として以下です。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  myservice:
    image: alpine
    group_add:
      - mail
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  myservice:
    image: alpine
    group_add:
      - mail
```
@z

@x
Running `id` inside the created container shows that the user belongs to
the `mail` group, which would not have been the case if `group_add` were not
used.
@y
生成されたコンテナー内において `id`を実行すると、ユーザーが`mail`グループに所属していることがわかります。
`group_add`がなかったとしたら、このようにはなりません。
@z

@x
### healthcheck
@y
### healthcheck
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
Configure a check that's run to determine whether or not containers for this
service are "healthy". See the docs for the
[HEALTHCHECK Dockerfile instruction](../../engine/reference/builder.md#healthcheck)
for details on how healthchecks work.
@y
このサービスを起動させているコンテナーが「健康」（healthy）かどうかを確認する処理を設定します。
ヘルスチェックがどのように動作するのかの詳細は [Dockerfile の HEALTHCHECK 命令](../../engine/reference/builder.md#healthcheck) を参照してください。
@z

@x
```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 40s
```
@y
```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 40s
```
@z

@x
`interval`, `timeout` and `start_period` are specified as
[durations](#specifying-durations).
@y
`interval`、`timeout`、`start_period`は [時間](#specifying-durations) を設定します。
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format.
>
> The `start_period` option was added in file format 2.3.
@y
> ファイルフォーマット[バージョン 2.3](compose-versioning.md#version-23) において追加されました。
>
> `start_period`オプションはファイルフォーマット 2.3 において加えられたものです。
@z

@x
`test` must be either a string or a list. If it's a list, the first item must be
either `NONE`, `CMD` or `CMD-SHELL`. If it's a string, it's equivalent to
specifying `CMD-SHELL` followed by that string.
@y
`test`は 1 つの文字列かリスト形式である必要があります。
リスト形式の場合、第 1 要素は必ず `NONE`、`CMD`、`CMD-SHELL`のいずれかとします。
文字列の場合は、`CMD-SHELL`に続けてその文字列を指定することと同じになります。
@z

@x
```yaml
# Hit the local web app
test: ["CMD", "curl", "-f", "http://localhost"]
```
@y
```yaml
# ローカルのウェブアプリにアクセスします。
test: ["CMD", "curl", "-f", "http://localhost"]
```
@z

@x
As above, but wrapped in `/bin/sh`. Both forms below are equivalent.
@y
上と同様ですが`/bin/sh`によりラップします。
両書式は同等になります。
@z

@x
```yaml
test: ["CMD-SHELL", "curl -f http://localhost || exit 1"]
```
@y
```yaml
test: ["CMD-SHELL", "curl -f http://localhost || exit 1"]
```
@z

@x
```yaml
test: curl -f https://localhost || exit 1
```
@y
```yaml
test: curl -f https://localhost || exit 1
```
@z

@x
To disable any default healthcheck set by the image, you can use `disable: true`.
This is equivalent to specifying `test: ["NONE"]`.
@y
イメージが設定するデフォルトのヘルスチェックを無効にするには`disable: true`を指定します。
これは`test: ["NONE"]`と指定することと同じです。
@z

@x
```yaml
healthcheck:
  disable: true
```
@y
```yaml
healthcheck:
  disable: true
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
イメージが存在しなかった場合、[build](#build) を指定していなければ Compose はイメージを取得しようとします。
取得する際には、指定されたオプションを使ってビルドを行い、指定されたタグ名によりタグづけを行います。
@z

@x
### init
@y
### init
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format.
@y
> ファイルフォーマット[バージョン 2.2](compose-versioning.md#version-22) において追加されました。
@z

@x
Run an init inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@y
コンテナー内にて init を実行し、シグナルを送信してプロセスを停止させます。
このオプションに`true`を設定することで、サービスに対するこの機能を有効にします。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  web:
    image: alpine:latest
    init: true
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  web:
    image: alpine:latest
    init: true
```
@z

@x
> The default init binary that is used is [Tini](https://github.com/krallin/tini),
> and is installed in `/usr/libexec/docker-init` on the daemon host. You can
> configure the daemon to use a custom init binary through the
> [`init-path` configuration option](../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@y
> 利用されるデフォルトの init の実行モジュールは [Tini](https://github.com/krallin/tini) であり、デーモンホストの`/usr/libexec/docker-init`にインストールされています。
> デーモンに対して独自の init 実行モジュールを設定するには、[`init-path`設定オプション](../../engine/reference/commandline/dockerd.md#daemon-configuration-file) を利用します。
@z

@x
### isolation
@y
### isolation
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
Specify a container’s isolation technology. On Linux, the only supported value
is `default`. On Windows, acceptable values are `default`, `process` and
`hyperv`. Refer to the
[Docker Engine docs](../../engine/reference/commandline/run.md#specify-isolation-technology-for-container---isolation)
for details.
@y
コンテナーの分離技術（isolation technology）を設定します。
Linux においてサポートされるのは`default`のみです。
Windows では`default`、`process`、`hyperv`の設定が可能です。
詳しくは [Docker Engine ドキュメント](../../engine/reference/commandline/run.md#specify-isolation-technology-for-container---isolation) を参照してください。
@z

@x
### labels
@y
### labels
@z

@x
Add metadata to containers using [Docker labels](../../config/labels-custom-metadata.md). You can use either an array or a dictionary.
@y
[Docker labels](../../config/labels-custom-metadata.md) を使ってコンテナーにメタデータを追加します。
配列形式と辞書形式のいずれかにより指定します。
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with those used by other software.
@y
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
他サービスのコンテナーをリンクします。
サービス名とリンクのエイリアス名（`"SERVICE:ALIAS"`）を指定するか、直接サービス名を指定します。
@z

@x
> Links are a legacy option. We recommend using
> [networks](#networks) instead.
@y
> links は古いオプションです。
> この代わりに [networks](#networks) オプションを用いることをお勧めします。
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
リンクされたサービスのコンテナーは、エイリアスと同等のホスト名により到達可能になります。
エイリアスが設定されていない場合はサービス名により到達可能です。
@z

@x
Links also express dependency between services in the same way as
[depends_on](#depends_on), so they determine the order of service startup.
@y
Links は [depends_on](#depends_on) と同様にサービス間の依存関係を表わします。
したがってサービスの起動順を設定するものになります。
@z

@x
> **Note**
>
> If you define both links and [networks](#networks), services with
> links between them must share at least one network in common to
> communicate. We recommend using networks instead.
@y
> **メモ**
>
> links と [networks](#networks) をともに設定する場合、リンクするサービスは、少なくとも 1 つのネットワークが共有され通信ができるようにする必要があります。
> このオプションではなく networks オプションを用いることをお勧めします。
@z

@x
### logging
@y
### logging
@z

@x
Logging configuration for the service.
@y
サービスに対するログ記録の設定をします。
@z

@x
```yaml
logging:
  driver: syslog
  options:
    syslog-address: "tcp://192.168.0.42:123"
```
@y
```yaml
logging:
  driver: syslog
  options:
    syslog-address: "tcp://192.168.0.42:123"
```
@z

@x
The `driver`  name specifies a logging driver for the service's
containers, as with the ``--log-driver`` option for docker run
([documented here](../../config/containers/logging/configure.md)).
@y
`driver`名にはサービスコンテナーにおけるログドライバーを指定します。
これは docker run コマンドに対する`--log-driver`オプションと同じです。
（[ドキュメントはこちら](../../config/containers/logging/configure.md)）
@z

@x
The default value is json-file.
@y
デフォルトは json-file です。
@z

@x
```yaml
driver: "json-file"
```
```yaml
driver: "syslog"
```
```yaml
driver: "none"
```
@y
```yaml
driver: "json-file"
```
```yaml
driver: "syslog"
```
```yaml
driver: "none"
```
@z

@x
> **Note**
>
> Only the `json-file` and `journald` drivers make the logs available directly
> from `docker-compose up` and `docker-compose logs`. Using any other driver
> does not print any logs.
@y
> **メモ**
>
> ドライバーのうち`json-file`と`journald`だけが、`docker-compose up`と`docker-compose logs`によって直接ログ参照ができます。
> その他のドライバーではログ表示は行われません。
@z

@x
Specify logging options for the logging driver with the ``options`` key, as with the ``--log-opt`` option for `docker run`.
@y
ログドライバーへのログオプションの設定は``options``キーにより行います。
これは`docker run`コマンドの``--log-opt``オプションと同じです。
@z

@x
Logging options are key-value pairs. An example of `syslog` options:
@y
ログオプションはキーバリューのペアで設定します。
たとえば`syslog`オプションは以下のようになります。
@z

@x
```yaml
driver: "syslog"
options:
  syslog-address: "tcp://192.168.0.42:123"
```
@y
```yaml
driver: "syslog"
options:
  syslog-address: "tcp://192.168.0.42:123"
```
@z

@x
### network_mode
@y
### network_mode
@z

@x
> Changed in [version 2](compose-versioning.md#version-2) file format.
@y
> ファイルフォーマット[バージョン 2](compose-versioning.md#version-2) において変更されました。
@z

@x
Network mode. Use the same values as the docker client `--network` parameter, plus
the special form `service:[service name]`.
@y
ネットワークモードを設定します。
Docker クライアントの`--network`パラメーターと同じ値を設定します。
これに加えて`service:[service name]`という特別な書式も指定可能です。
@z

@x
```yaml
network_mode: "bridge"
```
```yaml
network_mode: "host"
```
```yaml
network_mode: "none"
```
```yaml
network_mode: "service:[service name]"
```
```yaml
network_mode: "container:[container name/id]"
```
@y
```yaml
network_mode: "bridge"
```
```yaml
network_mode: "host"
```
```yaml
network_mode: "none"
```
```yaml
network_mode: "service:[service name]"
```
```yaml
network_mode: "container:[container name/id]"
```
@z

@x
### networks
@y
### networks
@z

@x
> Changed in [version 2](compose-versioning.md#version-2) file format.
@y
> ファイルフォーマット[バージョン 2](compose-versioning.md#version-2) において変更されました。
@z

@x
Networks to join, referencing entries under the
[top-level `networks` key](#network-configuration-reference).
@y
ネットワークへの参加を設定します。
設定には [最上位の`networks`キー](#network-configuration-reference) に設定された値を用います。
@z

@x
```yaml
services:
  some-service:
    networks:
     - some-network
     - other-network
```
@y
```yaml
services:
  some-service:
    networks:
     - some-network
     - other-network
```
@z

@x
#### aliases
@y
#### aliases
@z

@x
Aliases (alternative hostnames) for this service on the network. Other containers on the same network can use either the service name or this alias to connect to one of the service's containers.
@y
ネットワーク上のサービスに対して、ホスト名の別名となるエイリアスを設定します。
同じネットワーク上にある他のコンテナーは、この 1 つのサービスコンテナーに対して、サービス名か、あるいはそのエイリアスを使ってアクセスすることができます。
@z

@x
Since `aliases` is network-scoped, the same service can have different aliases on different networks.
@y
`aliases`はネットワーク範囲内において有効です。
ネットワークが異なれば、同一サービスに違うエイリアスを持たせることができます。
@z

@x
> **Note**
>
> A network-wide alias can be shared by multiple containers, and even by multiple
> services. If it is, then exactly which container the name resolves to is not
> guaranteed.
@y
> **メモ**
>
> ネットワーク全体にわたってのエイリアスを複数コンテナー間で共有することができます。
> それは複数サービス間でも可能です。
> ただしこの場合、名前解決がどのコンテナーに対して行われるかは保証されません。
@z

@x
The general format is shown here.
@y
一般的な書式は以下のとおりです。
@z

@x
```yaml
services:
  some-service:
    networks:
      some-network:
        aliases:
          - alias1
          - alias3
      other-network:
        aliases:
          - alias2
```
@y
```yaml
services:
  some-service:
    networks:
      some-network:
        aliases:
          - alias1
          - alias3
      other-network:
        aliases:
          - alias2
```
@z

@x
In the example below, three services are provided (`web`, `worker`, and `db`),
along with two networks (`new` and `legacy`). The `db` service is reachable at
the hostname `db` or `database` on the `new` network, and at `db` or `mysql` on
the `legacy` network.
@y
以下の例では 3 つのサービス（`web`、`worker`、`db`）と 2 つのネットワーク（`new` と `legacy`）を提供します。
`db`サービスは`new`ネットワーク上では、ホスト名`db`あるいは`database`としてアクセスできます。
一方`legacy`ネットワーク上では`db`あるいは`mysql`としてアクセスできます。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  web:
    image: "nginx:alpine"
    networks:
      - new

  worker:
    image: "my-worker-image:latest"
    networks:
      - legacy

  db:
    image: mysql
    networks:
      new:
        aliases:
          - database
      legacy:
        aliases:
          - mysql

networks:
  new:
  legacy:
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  web:
    image: "nginx:alpine"
    networks:
      - new

  worker:
    image: "my-worker-image:latest"
    networks:
      - legacy

  db:
    image: mysql
    networks:
      new:
        aliases:
          - database
      legacy:
        aliases:
          - mysql

networks:
  new:
  legacy:
```
@z

@x
#### ipv4_address, ipv6_address
@y
#### ipv4_address, ipv6_address
@z

@x
Specify a static IP address for containers for this service when joining the network.
@y
サービスをネットワークに参加させる際、そのコンテナーに対してスタティック IP アドレスを設定します。
@z

@x
The corresponding network configuration in the
[top-level networks section](#network-configuration-reference) must have an
`ipam` block with subnet and gateway configurations covering each static address.
@y
[最上位の networks セクション](#network-configuration-reference) の対応するネットワーク設定においては、`ipam`ブロックが必要です。
そこでは各スタティックアドレスに応じたサブネットの設定が必要になります。
@z

@x
> If IPv6 addressing is desired, the [`enable_ipv6`](#enableipv6) option must be set.
@y
> IPv6 アドレスが必要である場合は、[`enable_ipv6`](#enableipv6) オプションの設定が必要になります。
@z

@x
An example:
@y
以下に例を示します。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  app:
    image: busybox
    command: ifconfig
    networks:
      app_net:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10

networks:
  app_net:
    driver: bridge
    enable_ipv6: true
    ipam:
      driver: default
      config:
        - subnet: 172.16.238.0/24
          gateway: 172.16.238.1
        - subnet: 2001:3984:3989::/64
          gateway: 2001:3984:3989::1
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  app:
    image: busybox
    command: ifconfig
    networks:
      app_net:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10

networks:
  app_net:
    driver: bridge
    enable_ipv6: true
    ipam:
      driver: default
      config:
        - subnet: 172.16.238.0/24
          gateway: 172.16.238.1
        - subnet: 2001:3984:3989::/64
          gateway: 2001:3984:3989::1
```
@z

@x
#### link_local_ips
@y
#### link_local_ips
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
Specify a list of link-local IPs. Link-local IPs are special IPs which belong
to a well known subnet and are purely managed by the operator, usually
dependent on the architecture where they are deployed. Therefore they are not
managed by docker (IPAM driver).
@y
リンクローカル IP（link-local IP） のリストを設定します。
リンクローカル IP とは特別な IP アドレスのことであり、よく知られた（well known）サブネットに属し、ユーザーが自由に管理するものを指します。
普通、このアドレスはデプロイされたアーキテクチャーとはまったく関係のないものです。
したがって Docker（IPAM ドライバー）によって管理されるものではありません。
@z

@x
Example usage:
@y
利用例を以下に示します。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  app:
    image: busybox
    command: top
    networks:
      app_net:
        link_local_ips:
          - 57.123.22.11
          - 57.123.22.13
networks:
  app_net:
    driver: bridge
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  app:
    image: busybox
    command: top
    networks:
      app_net:
        link_local_ips:
          - 57.123.22.11
          - 57.123.22.13
networks:
  app_net:
    driver: bridge
```
@z

@x
#### priority
@y
#### priority
@z

@x
Specify a priority to indicate in which order Compose should connect the
service's containers to its networks. If unspecified, the default value is `0`.
@y
Compose がサービスのコンテナーをネットワークに接続する際に、その接続の優先順位を設定します。
設定されていない場合のデフォルト値は`0`です。
@z

@x
In the following example, the `app` service connects to `app_net_1` first
as it has the highest priority. It then connects to `app_net_3`, then
`app_net_2`, which uses the default priority value of `0`.
@y
以下の例において`app`サービスは初めに`app_net_1`に接続します。
そこに一番高い優先順位が設定されているためです。
次に接続されるのは`app_net_3`です。
最後に、デフォルトの優先順位である`0`が用いられている`app_net_2`に接続します。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  app:
    image: busybox
    command: top
    networks:
      app_net_1:
        priority: 1000
      app_net_2:

      app_net_3:
        priority: 100
networks:
  app_net_1:
  app_net_2:
  app_net_3:
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  app:
    image: busybox
    command: top
    networks:
      app_net_1:
        priority: 1000
      app_net_2:

      app_net_3:
        priority: 100
networks:
  app_net_1:
  app_net_2:
  app_net_3:
```
@z

@x
> **Note**
>
> If multiple networks have the same priority, the connection order is undefined.
@y
> **メモ**
>
> 複数のネットワークに同一の優先順位が設定された場合、接続順は定義されません。
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
```yaml
pid: "container:custom_container_1"
```
```yaml
pid: "service:foobar"
```
@y
```yaml
pid: "host"
```
```yaml
pid: "container:custom_container_1"
```
```yaml
pid: "service:foobar"
```
@z

@x
If set to one of the following forms: `container:<container_name>`,
`service:<service_name>`, the service shares the PID address space of the
designated container or service.
@y
これが`container:<container_name>`または`service:<service_name>`の形で設定された場合は、そのサービスは、指定されたコンテナーまたはサービスの PID アドレス空間を共有します。
@z

@x
If set to "host", the service's PID mode is the host PID mode.  This turns
on sharing between container and the host operating system the PID address
space. Containers launched with this flag can access and manipulate
other containers in the bare-metal machine's namespace and vice versa.
@y
これが "host" に設定された場合は、サービスの PID モードをホスト PID モードに設定します。
これはコンテナーとホストオペレーティングシステムとの間で、PID アドレス空間の共有を開始します。
このフラグを使って起動したコンテナーは、ベアメタルマシンの名前空間にあるコンテナーにアクセスし、操作することが可能になります。
逆もまた可能です。
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
>
> The `service:` and `container:` forms require [version 2.1](compose-versioning.md#version-21) or above
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
>
> `service:`と`container:`の書式を利用するには [バージョン 2.1](compose-versioning.md#version-21) またはそれ以降である必要があります。
@z

@x
### pids_limit
@y
### pids_limit
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
Tunes a container's PIDs limit. Set to `-1` for unlimited PIDs.
@y
コンテナーの PID 上限を設定します。
`-1`に設定すると無制限になります。
@z

@x
```yaml
pids_limit: 10
```
@y
```yaml
pids_limit: 10
```
@z

@x
### platform
@y
### platform
@z

@x
> Added in [version 2.4](compose-versioning.md#version-24) file format.
@y
> ファイルフォーマット[バージョン 2.4](compose-versioning.md#version-24) において追加されました。
@z

@x
Target platform containers for this service will run on, using the
`os[/arch[/variant]]` syntax, e.g.
@y
サービスのコンテナーが稼動することになるプラットフォームを設定します。
その記述は`os[/arch[/variant]]`といった書式で行います。
@z

@x
```yaml
platform: osx
```
```yaml
platform: windows/amd64
```
```yaml
platform: linux/arm64/v8
```
@y
```yaml
platform: osx
```
```yaml
platform: windows/amd64
```
```yaml
platform: linux/arm64/v8
```
@z

@x
This parameter determines which version of the image will be pulled and/or
on which platform the service's build will be performed.
@y
このパラメーターは、どのバージョンのイメージを取得するのか、あるいはサービスがどのプラットフォームでビルドされるかを決定します。
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
公開用ポートを設定します。
設定は両側のポートを指定するか（`HOST:CONTAINER`）、あるいはコンテナー側のポートのみを指定します（その場合、ホスト側はエフェメラルポートが採用されます）。
@z

@x
> **Note**
>
> When mapping ports in the `HOST:CONTAINER` format, you may experience
> erroneous results when using a container port lower than 60, because YAML
> parses numbers in the format `xx:yy` as a base-60 value. For this reason,
> we recommend always explicitly specifying your port mappings as strings.
@y
> **メモ**
>
> `HOST:CONTAINER`の書式によってポートをマッピングした場合に、コンテナー側のポートが 60 番未満であるとエラーになることがあります。
> これは YAML パーサーが`xx:yy`の書式内にある数値を 60 進数値として解釈するからです。
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
### runtime
@y
### runtime
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format.
@y
> ファイルフォーマット[バージョン 2.3](compose-versioning.md#version-23) において追加されました。
@z

@x
Specify which runtime to use for the service's containers. Default runtime
and available runtimes are listed in the output of `docker info`.
@y
サービスのコンテナーにおいてどのランタイム（runtime）を用いるかを設定します。
デフォルトのランタイムおよび利用可能なランタイムは、`docker info`出力から確認できます。
@z

@x
```yaml
web:
  image: busybox:latest
  command: true
  runtime: runc
```
@y
```yaml
web:
  image: busybox:latest
  command: true
  runtime: runc
```
@z

@x
### scale
@y
### scale
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format.
@y
> ファイルフォーマット[バージョン 2.2](compose-versioning.md#version-22) において追加されました。
@z

@x
Specify the default number of containers to deploy for this service. Whenever
you run `docker-compose up`, Compose creates or removes containers to match
the specified number. This value can be overridden using the
[`--scale`](../reference/up.md) flag.
@y
本サービスに対して、デプロイするコンテナーのデフォルト数を設定します。
`docker-compose up`を実行したとき、Compose はこの設定数に従ってコンテナーの生成や削除を行います。
この値は [`--scale`](../reference/up.md) フラグを使って上書きすることができます。
@z

@x
```yaml
web:
  image: busybox:latest
  command: echo 'scaled'
  scale: 3
```
@y
```yaml
web:
  image: busybox:latest
  command: echo 'scaled'
  scale: 3
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
### stop_grace_period
@y
### stop_grace_period
@z

@x
Specify how long to wait when attempting to stop a container if it doesn't
handle SIGTERM (or whatever stop signal has been specified with
[`stop_signal`](#stop_signal)), before sending SIGKILL. Specified
as a [duration](#specifying-durations).
@y
コンテナーが SIGKILL を送信するまでに、SIGTERM（あるいは [`stop_signal`](#stopsignal) によって設定されたストップシグナル）をどれだけ待つかを設定します。
指定には [時間](#specifying-durations) を用います。
@z

@x
```yaml
stop_grace_period: 1s
```

```yaml
stop_grace_period: 1m30s
```
@y
```yaml
stop_grace_period: 1s
```

```yaml
stop_grace_period: 1m30s
```
@z

@x
By default, `stop` waits 10 seconds for the container to exit before sending
SIGKILL.
@y
デフォルトで、コンテナーが SIGKILL を送信する前に`stop`は 10 秒待ちます。
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
コンテナーに対して別の停止シグナルを設定します。
デフォルトにおいて`stop`は SIGTERM を用います。
`stop_signal`を使って別のシグナルを設定すると`stop`にはそのシグナルが代わりに送信されます。
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
### storage_opt
@y
### storage_opt
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
Set storage driver options for this service.
@y
本サービスに対するストレージドライバーのオプションを設定します。
@z

@x
```yaml
storage_opt:
  size: '1G'
```
@y
```yaml
storage_opt:
  size: '1G'
```
@z

@x
### sysctls
@y
### sysctls
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
Kernel parameters to set in the container. You can use either an array or a
dictionary.
@y
コンテナーに設定するカーネルパラメーターを設定します。
配列または辞書形式での指定ができます。
@z

@x
```yaml
sysctls:
  net.core.somaxconn: 1024
  net.ipv4.tcp_syncookies: 0
```
@y
```yaml
sysctls:
  net.core.somaxconn: 1024
  net.ipv4.tcp_syncookies: 0
```
@z

@x
```yaml
sysctls:
  - net.core.somaxconn=1024
  - net.ipv4.tcp_syncookies=0
```
@y
```yaml
sysctls:
  - net.core.somaxconn=1024
  - net.ipv4.tcp_syncookies=0
```
@z

@x
### tmpfs
@y
### tmpfs
@z

@x
Mount a temporary file system inside the container. Can be a single value or a list.
@y
コンテナー内においてテンポラリファイルシステムをマウントします。
設定は 1 つだけとするか、リストにすることができます。
@z

@x
```yaml
tmpfs: /run
```

```yaml
tmpfs:
  - /run
  - /tmp
```
@y
```yaml
tmpfs: /run
```

```yaml
tmpfs:
  - /run
  - /tmp
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
### userns_mode
@y
### userns_mode
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
```yaml
userns_mode: "host"
```
@y
```yaml
userns_mode: "host"
```
@z

@x
Disables the user namespace for this service, if Docker daemon is configured with user namespaces.
See [dockerd](/engine/reference/commandline/dockerd/#disable-user-namespace-for-a-container) for
more information.
@y
Docker デーモンにおいてユーザー名前空間が設定されていても、サービスに対してユーザー名前空間を無効にします。
詳しくは [dockerd](/engine/reference/commandline/dockerd/#disable-user-namespace-for-a-container) を参照してください。
@z

@x
### volumes
@y
### volumes
@z

@x
Mount host paths or named volumes. Named volumes need to be specified with the
[top-level `volumes` key](#volume-configuration-reference).
@y
マウントホストパスや名前つきボリュームをマウントします。
名前つきボリュームは [最上位の`volumes`キー](#volume-configuration-reference) として設定する必要があります。
@z

@x
#### Short syntax
@y
{: #short-syntax }
#### 短い文法
@z

@x
The short syntax uses the generic `[SOURCE:]TARGET[:MODE]` format, where
`SOURCE` can be either a host path or volume name. `TARGET` is the container
path where the volume is mounted. Standard modes are `ro` for read-only
and `rw` for read-write (default).
@y
短い文法では汎用的な`[SOURCE:]TARGET[:MODE]`という書式を用います。
ここで`SOURCE`はホストパスまたはボリューム名のどちらでも可です。
`TARGET`はボリュームがマウントされるコンテナーパスです。
標準的なモードは、読み込み専用の場合`ro`、読み書き可能の場合`rw`（デフォルト）です。
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
@z

@x
#### Long syntax
@y
{: #long-syntax }
#### 長い文法
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format.
@y
> ファイルフォーマット[バージョン 2.3](compose-versioning.md#version-23) において追加されました。
@z

@x
The long form syntax allows the configuration of additional fields that can't be
expressed in the short form.
@y
長い文法は追加の設定項目が加えられていて、短い文法では表現できないものです。
@z

@x
- `type`: the mount type `volume`, `bind`, `tmpfs` or `npipe`
- `source`: the source of the mount, a path on the host for a bind mount, or the
  name of a volume defined in the
  [top-level `volumes` key](#volume-configuration-reference). Not applicable for a tmpfs mount.
- `target`: the path in the container where the volume is mounted
- `read_only`: flag to set the volume as read-only
- `bind`: configure additional bind options
  - `propagation`: the propagation mode used for the bind
- `volume`: configure additional volume options
  - `nocopy`: flag to disable copying of data from a container when a volume is
    created
- `tmpfs`: configure additional tmpfs options
  - `size`: the size for the tmpfs mount in bytes
@y
- `type`: マウントタイプを表わす `volume`、`bind`、`tmpfs`、`npipe`のいずれかを指定します。
- `source`: マウント元。バインドマウントにおいてはホスト上のパスを指定します。
  また [最上位の`volumes`キー](#volume-configuration-reference) で定義したボリューム名を指定します。
  tmpfs マウントはできません。
- `target`: ボリュームがマウントされるコンテナー内のパスを指定します。
- `read_only`: ボリュームを読み込み専用に設定します。
- `bind`: 追加のバインドオプションを設定します。
  - `propagation`: バインドにおいて伝播モード（propagation mode）を利用します。
- `volume`: 追加のボリュームオプションを設定します。
  - `nocopy`: ボリュームの生成時にはコンテナーからのデータコピーを無効にします。
- `tmpfs`: 追加の tmpfs オプションを設定します。
  - `size`: tmpfs マウントのサイズをバイト数で指定します。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  web:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - type: volume
        source: mydata
        target: /data
        volume:
          nocopy: true
      - type: bind
        source: ./static
        target: /opt/app/static

networks:
  webnet:

volumes:
  mydata:
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
services:
  web:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - type: volume
        source: mydata
        target: /data
        volume:
          nocopy: true
      - type: bind
        source: ./static
        target: /opt/app/static

networks:
  webnet:

volumes:
  mydata:
```
@z

@x
> **Note**
>
> When creating bind mounts, using the long syntax requires the
> referenced folder to be created beforehand. Using the short syntax
> creates the folder on the fly if it doesn't exist.
> See the [bind mounts documentation](../../storage/bind-mounts.md#differences-between--v-and---mount-behavior)
> for more information.
@y
> **Note**
>
> 長い文法を使ってバインドマウントを生成する際には、参照されるフォルダーをあらかじめ生成しておく必要があります。
> 短い文法を利用する場合、そのフォルダーが存在しなければ生成されます。
> 詳しくは [バインドマウントのドキュメント](../../storage/bind-mounts.md#differences-between--v-and---mount-behavior) を参照してください。
@z

@x
### volume\_driver
@y
### volume\_driver
@z

@x
Specify a default volume driver to be used for all declared volumes on this
service.
@y
本サービス上に宣言されているボリュームすべてに対して、利用するデフォルトのボリュームドライバーを設定します。
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
> **Note**
>
> In [version 2 files](compose-versioning.md#version-2), this
> option only applies to anonymous volumes (those specified in the image,
> or specified under `volumes` without an explicit named volume or host path).
> To configure the driver for a named volume, use the `driver` key under the
> entry in the [top-level `volumes` option](#volume-configuration-reference).
@y
> **メモ**
>
> [ファイルフォーマットバージョン 2](compose-versioning.md#version-2) においてこのオプションは、匿名ボリューム（anonymous volume）に対してのみ適用されます。
> （これはイメージ内で匿名として設定されるか、あるいは`volumes`キー配下において明示的な名前やホストパスが指定されずに設定されるものです。）
> 名前つきボリュームに対してドライバーを設定するには、[最上位の`volumes`オプション](#volume-configuration-reference) の配下にて`driver`キーを使ってください。
@z

@x
See [Docker Volumes](../../storage/volumes.md) and
[Volume Plugins](/engine/extend/plugins_volume/) for more information.
@y
詳しくは [Docker ボリューム](../../storage/volumes.md) や [ボリュームプラグイン](/engine/extend/plugins_volume/) を参照してください。
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
別のサービスやコンテナーのボリュームをすべてマウントします。
任意の設定として、アクセスを読み込み専用（`ro`）とするか、読み書き可能（`rw`）とするかを指定できます。
アクセスレベルが何も設定されていないときは、読み書き可能として設定されます。
@z

@x
```yaml
volumes_from:
  - service_name
  - service_name:ro
  - container:container_name
  - container:container_name:rw
```
@y
```yaml
volumes_from:
  - service_name
  - service_name:ro
  - container:container_name
  - container:container_name:rw
```
@z

@x
> Changed in [version 2](compose-versioning.md#version-2) file format.
@y
> ファイルフォーマット[バージョン 2](compose-versioning.md#version-2) において変更されました。
@z

@x
### restart
@y
### restart
@z

@x
`no` is the default restart policy, and it doesn't restart a container under any circumstance. When `always` is specified, the container always restarts. The `on-failure` policy restarts a container if the exit code indicates an on-failure error.
@y
再起動ポリシー（restart policy）のデフォルトは`no`です。
この場合はどういう状況であってもコンテナーは再起動しません。
`always`を指定した場合、コンテナーは常に再起動することになります。
また`on-failure`ポリシーでは、終了コードが on-failure エラーを表わしている場合にコンテナーが再起動します。
@z

@x
```yaml
restart: no
```
```yaml
restart: always
```
```yaml
restart: on-failure
```
```yaml
restart: unless-stopped
```
@y
```yaml
restart: no
```
```yaml
restart: always
```
```yaml
restart: on-failure
```
```yaml
restart: unless-stopped
```
@z

@x
{: id="cpu-and-other-resources"}
@y
{: id="cpu-and-other-resources"}
@z

@x
### cpu_count, cpu_percent, cpu\_shares, cpu\_period, cpu\_quota, cpus, cpuset, domainname, hostname, ipc, mac\_address, mem\_limit, memswap\_limit, mem\_swappiness, mem\_reservation, oom_kill_disable, oom_score_adj, privileged, read\_only, shm\_size, stdin\_open, tty, user, working\_dir
@y
### cpu_count, cpu_percent, cpu\_shares, cpu\_period, cpu\_quota, cpus, cpuset, domainname, hostname, ipc, mac\_address, mem\_limit, memswap\_limit, mem\_swappiness, mem\_reservation, oom_kill_disable, oom_score_adj, privileged, read\_only, shm\_size, stdin\_open, tty, user, working\_dir
@z

@x
Each of these is a single value, analogous to its
[docker run](../../engine/reference/run.md#runtime-constraints-on-resources) counterpart.
@y
ここに示すオプションはいずれも、値 1 つを設定するものであり、[docker run](../../engine/reference/run.md#runtime-constraints-on-resources) のオプションに対応づいています。
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format.
>
> The `cpu_count`, `cpu_percent`, and `cpus` options were added in [version 2.2](compose-versioning.md#version-22).
@y
> ファイルフォーマット[バージョン 2.2](compose-versioning.md#version-22) における追加
>
> `cpu_count`、`cpu_percent`、`cpus`の各オプションは [バージョン 2.2](compose-versioning.md#version-22) において追加されました。
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
>
> The `oom_kill_disable` and `cpu_period` options were added in [version 2.1](compose-versioning.md#version-21).
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) における追加
>
> `oom_kill_disable`、`cpu_period`のオプションは [バージョン 2.1](compose-versioning.md#version-21) において追加されました。
@z

@x
```yaml
cpu_count: 2
cpu_percent: 50
cpus: 0.5
cpu_shares: 73
cpu_quota: 50000
cpu_period: 20ms
cpuset: 0,1

user: postgresql
working_dir: /code

domainname: foo.com
hostname: foo
ipc: host
mac_address: 02:42:ac:11:65:43

mem_limit: 1000000000
memswap_limit: 2000000000
mem_reservation: 512m
privileged: true

oom_score_adj: 500
oom_kill_disable: true

read_only: true
shm_size: 64M
stdin_open: true
tty: true
```
@y
```yaml
cpu_count: 2
cpu_percent: 50
cpus: 0.5
cpu_shares: 73
cpu_quota: 50000
cpu_period: 20ms
cpuset: 0,1

user: postgresql
working_dir: /code

domainname: foo.com
hostname: foo
ipc: host
mac_address: 02:42:ac:11:65:43

mem_limit: 1000000000
memswap_limit: 2000000000
mem_reservation: 512m
privileged: true

oom_score_adj: 500
oom_kill_disable: true

read_only: true
shm_size: 64M
stdin_open: true
tty: true
```
@z

@x
{: id="orig-resources" }
@y
{: id="orig-resources" }
@z

@x
## Specifying durations
@y
{: #specifying-durations }
## 時間の指定
@z

@x
Some configuration options, such as the `interval` and `timeout` sub-options for
[`healthcheck`](#healthcheck), accept a duration as a string in a
format that looks like this:
@y
[`healthcheck`](#healthcheck) のサブオプション`interval`、`timeout`のように、時間を設定するオプションがあります。
これは以下のような書式による文字列を時間として受け付けるものです。
@z

@x
    2.5s
    10s
    1m30s
    2h32m
    5h34m56s
@y
    2.5s
    10s
    1m30s
    2h32m
    5h34m56s
@z

@x
The supported units are `us`, `ms`, `s`, `m` and `h`.
@y
サポートされる単位は`us`、`ms`、`s`、`m`、`h`です。
@z

@x
## Specifying byte values
@y
{: #specifying-byte-values }
## バイト値の表現
@z

@x
Some configuration options, such as the `device_read_bps` sub-option for
[`blkio_config`](#blkioconfig), accept a byte value as a string in a format
that looks like this:
@y
[`blkio_config`](#blkioconfig) のサブオプション`device_read_bps`のようにバイト値を設定するオプションがあります。
バイト値は文字列として指定するものであり、以下のようになります。
@z

@x
    2b
    1024kb
    2048k
    300m
    1gb
@y
    2b
    1024kb
    2048k
    300m
    1gb
@z

@x
The supported units are `b`, `k`, `m` and `g`, and their alternative notation `kb`,
`mb` and `gb`. Decimal values are not supported at this time.
@y
サポートされる単位は`b`、`k`、`m`、`g`とそれに応じた`kb`、`mb`、`gb`です。
現時点にて 10 進数値の指定はサポートされていません。
@z

@x
## Volume configuration reference
@y
{: #volume-configuration-reference }
## ボリューム設定リファレンス
@z

@x
While it is possible to declare [volumes](#volumes) on the fly as part of the
service declaration, this section allows you to create named volumes that can be
reused across multiple services (without relying on `volumes_from`), and are
easily retrieved and inspected using the docker command line or API.
See the [docker volume](../../engine/reference/commandline/volume_create.md)
subcommand documentation for more information.
@y
サービスの宣言の一部として、ファイル上に [ボリューム](#volumes) を宣言することが可能ですが、このセクションでは（`volumes_from`を利用せずに）名前つきボリュームを生成する方法を説明します。
このボリュームは、複数のサービスにわたっての再利用が可能であり、docker コマンドラインや API を使って簡単に抽出したり確認したりすることができます。
詳しくは [docker volume](../../engine/reference/commandline/volume_create.md) のサブコマンドを確認してください。
@z

@x
See [use volumes](../../storage/volumes.md) and [volume plugins](/engine/extend/plugins_volume/)
for general information on volumes.
@y
詳しくは [Docker ボリューム](../../storage/volumes.md) や [ボリュームプラグイン](/engine/extend/plugins_volume/) を参照してください。
@z

@x
Here's an example of a two-service setup where a database's data directory is
shared with another service as a volume so that it can be periodically backed
up:
@y
以下の例では 2 つのサービスを用います。
データベースのデータディレクトリは、もう一方のサービスに対してボリュームとして共有させます。
これによりデータが定期的に反映されます。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  db:
    image: db
    volumes:
      - data-volume:/var/lib/db
  backup:
    image: backup-service
    volumes:
      - data-volume:/var/lib/backup/data

volumes:
  data-volume:
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  db:
    image: db
    volumes:
      - data-volume:/var/lib/db
  backup:
    image: backup-service
    volumes:
      - data-volume:/var/lib/backup/data

volumes:
  data-volume:
```
@z

@x
An entry under the top-level `volumes` key can be empty, in which case it
uses the default driver configured by the Engine (in most cases, this is the
`local` driver). Optionally, you can configure it with the following keys:
@y
最上位の`volumes`キーは指定しないようにすることもできます。
その場合は Engine によってデフォルトで設定されているドライバーが用いられます。
（たいていは`local`ドライバーとなります。）
さらに追加で、以下のようなキーを設定することができます。
@z

@x
### driver
@y
### driver
@z

@x
Specify which volume driver should be used for this volume. Defaults to whatever
driver the Docker Engine has been configured to use, which in most cases is
`local`. If the driver is not available, the Engine returns an error when
`docker-compose up` tries to create the volume.
@y
どのボリュームドライバーを現在のボリュームに対して用いるかを指定します。
デフォルトは Docker Engine が利用するものとして設定されているドライバーになります。
たいていは`local`です。
ドライバーが利用できない場合、`docker-compose up`によってボリューム生成が行われる際に Engine がエラーを返します。
@z

@x
```yaml
driver: foobar
```
@y
```yaml
driver: foobar
```
@z

@x
### driver_opts
@y
### driver_opts
@z

@x
Specify a list of options as key-value pairs to pass to the driver for this
volume. Those options are driver-dependent - consult the driver's
documentation for more information. Optional.
@y
このボリュームが利用するドライバーに対して、受け渡したいオプションをキーバリューペアのリストとして設定します。
このオプションは各ドライバーによって異なります。
詳しくは各ドライバーのドキュメントを参照してください。
設定は任意です。
@z

@x
```yaml
volumes:
  example:
    driver_opts:
      type: "nfs"
      o: "addr=10.40.0.199,nolock,soft,rw"
      device: ":/docker/example"
```
@y
```yaml
volumes:
  example:
    driver_opts:
      type: "nfs"
      o: "addr=10.40.0.199,nolock,soft,rw"
      device: ":/docker/example"
```
@z

@x
### external
@y
### external
@z

@x
If set to `true`, specifies that this volume has been created outside of
Compose. `docker-compose up` does not attempt to create it, and raises
an error if it doesn't exist.
@y
このオプションを`true`に設定することにより、Compose の外部において生成されているボリュームを設定します。
`docker-compose up`はボリュームを生成しないようになりますが、ボリュームが存在しなければエラーとなります。
@z

@x
For version 2.0 of the format, `external` cannot be used in
conjunction with other volume configuration keys (`driver`, `driver_opts`,
`labels`). This limitation no longer exists for
[version 2.1](compose-versioning.md#version-21) and above.
@y
バージョン 2.0 にて`external`は他のボリューム設定キー（`driver`、`driver_opts`、`labels`）と同時に用いることはできませんでした。
この制約は [バージョン 2.1](compose-versioning.md#version-21) 以降においてはなくなりました。
@z

@x
In the example below, instead of attempting to create a volume called
`[projectname]_data`, Compose looks for an existing volume simply
called `data` and mount it into the `db` service's containers.
@y
以下の例では`[projectname]_data`というボリュームは生成されることはなく、Compose はすでに存在している`data`という単純な名前のボリュームを探しにいきます。
そしてこれを`db`サービスコンテナー内にマウントします。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  db:
    image: postgres
    volumes:
      - data:/var/lib/postgresql/data

volumes:
  data:
    external: true
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  db:
    image: postgres
    volumes:
      - data:/var/lib/postgresql/data

volumes:
  data:
    external: true
```
@z

@x
You can also specify the name of the volume separately from the name used to
refer to it within the Compose file:
@y
ボリューム名として指定する名前は、Compose ファイル内で参照されている名前以外でも指定することができます。
@z

@x
```yaml
volumes:
  data:
    external:
      name: actual-name-of-volume
```
@y
```yaml
volumes:
  data:
    external:
      name: actual-name-of-volume
```
@z

@x
> Deprecated in [version 2.1](compose-versioning.md#version-21) file format.
>
> external.name was deprecated in version 2.1 file format use `name` instead.
{: .important }
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) において廃止予定
>
> ファイルフォーマットバージョン 2.1 において `external.name` プロパティは廃止予定となったため`name`プロパティを用いてください。
{: .important }
@z

@x
### labels
@y
### labels
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) における追加
@z

@x
Add metadata to containers using
[Docker labels](../../config/labels-custom-metadata.md). You can use either
an array or a dictionary.
@y
[Docker labels](../../config/labels-custom-metadata.md) を使ってコンテナーにメタデータを追加します。
配列形式と辞書形式のいずれかにより指定します。
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@y
ここでは逆 DNS 記法とすることをお勧めします。
この記法にしておけば、他のソフトウェアが用いるラベルとの競合が避けられるからです。
@z

@x
```yaml
labels:
  com.example.description: "Database volume"
  com.example.department: "IT/Ops"
  com.example.label-with-empty-value: ""
```
@y
```yaml
labels:
  com.example.description: "Database volume"
  com.example.department: "IT/Ops"
  com.example.label-with-empty-value: ""
```
@z

@x
```yaml
labels:
  - "com.example.description=Database volume"
  - "com.example.department=IT/Ops"
  - "com.example.label-with-empty-value"
```
@y
```yaml
labels:
  - "com.example.description=Database volume"
  - "com.example.department=IT/Ops"
  - "com.example.label-with-empty-value"
```
@z

@x
### name
@y
### name
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) における追加
@z

@x
Set a custom name for this volume. The name field can be used to reference
volumes that contain special characters. The name is used as is
and will **not** be scoped with the stack name.
@y
ボリュームに対して独自の名前を設定します。
name は特殊な文字を含んだボリューム名を参照するために利用できます。
name は記述されたとおりに扱われ、スタック名によってスコープされません。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
volumes:
  data:
    name: my-app-data
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
volumes:
  data:
    name: my-app-data
```
@z

@x
It can also be used in conjunction with the `external` property:
@y
これは`external`プロパティと同時に利用することができます。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
volumes:
  data:
    external: true
    name: my-app-data
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
volumes:
  data:
    external: true
    name: my-app-data
```
@z

@x
## Network configuration reference
@y
{: #network-configuration-reference }
## ネットワーク設定リファレンス
@z

@x
The top-level `networks` key lets you specify networks to be created. For a full
explanation of Compose's use of Docker networking features, see the
[Networking guide](../networking.md).
@y
最上位の`networks`キーは、生成するネットワークを指定します。
Compose が利用する Docker ネットワーク機能に関して、詳細は [ネットワークガイド](../networking.md) を参照してください。
@z

@x
### driver
@y
### driver
@z

@x
Specify which driver should be used for this network.
@y
現在のネットワークにおいて利用するドライバーを設定します。
@z

@x
The default driver depends on how the Docker Engine you're using is configured,
but in most instances it is `bridge` on a single host and `overlay` on a
Swarm.
@y
デフォルトとなるドライバーは、Docker Engine においてどのドライバーを用いているかによって変わります。
たいていの場合、単一ホストであれば`bridge`、スウォーム上では`overlay`となります。
@z

@x
The Docker Engine returns an error if the driver is not available.
@y
ドライバーが利用できない場合、Docker Engine はエラーを返します。
@z

@x
```yaml
driver: overlay
```
@y
```yaml
driver: overlay
```
@z

@x
> Changed in [version 2.1](compose-versioning.md#version-21) file format.
>
> Starting with Compose file format 2.1, overlay networks are always created as
> `attachable`, and this is not configurable. This means that standalone
> containers can connect to overlay networks.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) における変更
>
> Compose ファイルフォーマット 2.1 から、オーバーレイネットワークは、必ず「アタッチ可能」（attachable）として生成されますが、ただし変更できません。
> スタンドアロンコンテナーであれば、オーバーレイネットワークに接続することができます。
@z

@x
### driver_opts
@y
### driver_opts
@z

@x
Specify a list of options as key-value pairs to pass to the driver for this
network. Those options are driver-dependent - consult the driver's
documentation for more information. Optional.
@y
このネットワーク上で利用するドライバーに対して、受け渡したいオプションをキーバリューペアのリストとして設定します。
このオプションは各ドライバーによって異なります。
詳しくは各ドライバーのドキュメントを参照してください。
設定は任意です。
@z

@x
```yaml
driver_opts:
  foo: "bar"
  baz: 1
```
@y
```yaml
driver_opts:
  foo: "bar"
  baz: 1
```
@z

@x
### enable_ipv6
@y
### enable_ipv6
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) における追加
@z

@x
Enable IPv6 networking on this network.
@y
現在のネットワークにおいて IPv6 ネットワークを有効にします。
@z

@x
### ipam
@y
### ipam
@z

@x
Specify custom IPAM config. This is an object with several properties, each of
which is optional:
@y
独自の IPAM 設定を行います。
いくつかのプロパティにより表わされるオブジェクトであり、それぞれの指定は任意です。
@z

@x
-   `driver`: Custom IPAM driver, instead of the default.
-   `config`: A list with zero or more config blocks, each containing any of
    the following keys:
    - `subnet`: Subnet in CIDR format that represents a network segment
    - `ip_range`: Range of IPs from which to allocate container IPs
    - `gateway`: IPv4 or IPv6 gateway for the master subnet
    - `aux_addresses`: Auxiliary IPv4 or IPv6 addresses used by Network driver,
      as a mapping from hostname to IP
-   `options`: Driver-specific options as a key-value mapping.
@y
-   `driver`: デフォルトではない独自の IPAM ドライバーを指定します。
-   `config`: 設定ブロックを指定します。要素数はゼロでも複数でも可です。
    以下のキーを用いることができます。
    - `subnet`: ネットワークセグメントを表わす CIDR 形式のサブネットを指定します。
    - `ip_range`: コンテナー IP としてどこからどこまで割り当てるかの範囲を指定します。
    - `gateway`: マスターサブネットに対する IPv4 または IPv6 のゲートウェイを指定します。
    - `aux_addresses`: ネットワークドライバーが利用する追加の IPv4 または IPv6 アドレス。
      ホスト名から IP へのマッピングとして利用されます。
-   `options`: キーバリューペアによりドライバー固有のオプションを指定します。
@z

@x
A full example:
@y
すべてを利用した例が以下です。
@z

@x
```yaml
ipam:
  driver: default
  config:
    - subnet: 172.28.0.0/16
      ip_range: 172.28.5.0/24
      gateway: 172.28.5.254
      aux_addresses:
        host1: 172.28.1.5
        host2: 172.28.1.6
        host3: 172.28.1.7
  options:
    foo: bar
    baz: "0"
```
@y
```yaml
ipam:
  driver: default
  config:
    - subnet: 172.28.0.0/16
      ip_range: 172.28.5.0/24
      gateway: 172.28.5.254
      aux_addresses:
        host1: 172.28.1.5
        host2: 172.28.1.6
        host3: 172.28.1.7
  options:
    foo: bar
    baz: "0"
```
@z

@x
### internal
@y
### internal
@z

@x
By default, Docker also connects a bridge network to it to provide external
connectivity. If you want to create an externally isolated overlay network,
you can set this option to `true`.
@y
デフォルトにおいて Docker はブリッジネットワークに接続する際に、外部接続機能も提供します。
外部に独立した overlay ネットワークを生成したい場合、本オプションを`true`にします。
@z

@x
### labels
@y
### labels
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> [ファイルフォーマットバージョン 2.1](compose-versioning.md#version-21) における追加
@z

@x
Add metadata to containers using
[Docker labels](../../config/labels-custom-metadata.md). You can use either
an array or a dictionary.
@y
[Docker labels](../../config/labels-custom-metadata.md) を使ってコンテナーにメタデータを追加します。
配列形式と辞書形式のいずれかにより指定します。
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@y
ここでは逆 DNS 記法とすることをお勧めします。
この記法にしておけば、他のソフトウェアが用いるラベルとの競合が避けられるからです。
@z

@x
```yaml
labels:
  com.example.description: "Financial transaction network"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@y
```yaml
labels:
  com.example.description: "Financial transaction network"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@z

@x
```yaml
labels:
  - "com.example.description=Financial transaction network"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@y
```yaml
labels:
  - "com.example.description=Financial transaction network"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@z

@x
### external
@y
### external
@z

@x
If set to `true`, specifies that this network has been created outside of
Compose. `docker-compose up` does not attempt to create it, and raises
an error if it doesn't exist.
@y
このオプションを`true`に設定することにより、Compose の外部において生成されているボリュームを設定します。
`docker-compose up`はボリュームを生成しないようになりますが、ボリュームが存在しなければエラーとなります。
@z

@x
For version 2.0 of the format, `external` cannot be used in conjunction with
other network configuration keys (`driver`, `driver_opts`, `ipam`, `internal`).
This limitation no longer exists for
[version 2.1](compose-versioning.md#version-21) and above.
@y
バージョン 2.0 にて `external` は、他のボリューム設定キー（`driver`, `driver_opts`, `ipam`, `internal`）と同時に用いることはできませんでした。
この制約は [バージョン 2.1](compose-versioning.md#version-21) 以降においてはなくなりました。
@z

@x
In the example below, `proxy` is the gateway to the outside world. Instead of
attempting to create a network called `[projectname]_outside`, Compose
looks for an existing network simply called `outside` and connect the `proxy`
service's containers to it.
@y
以下の例において`proxy`は外部ネットワークとの間のゲートウェイです。
`[projectname]_outside`というネットワークは生成されることはなく、Compose はすでに存在している`outside`という単純な名前のネットワークを探しにいって、`proxy`サービスのコンテナーに接続します。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  proxy:
    build: ./proxy
    networks:
      - outside
      - default
  app:
    build: ./app
    networks:
      - default

networks:
  outside:
    external: true
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"

services:
  proxy:
    build: ./proxy
    networks:
      - outside
      - default
  app:
    build: ./app
    networks:
      - default

networks:
  outside:
    external: true
```
@z

@x
You can also specify the name of the network separately from the name used to
refer to it within the Compose file:
@y
ネットワーク名として指定する名前は、Compose ファイル内で参照されている名前以外でも指定することができます。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
networks:
  outside:
    external:
      name: actual-name-of-network
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
networks:
  outside:
    external:
      name: actual-name-of-network
```
@z

@x
Not supported for version 2 `docker-compose` files. Use
[network_mode](#network_mode) instead.
@y
バージョン 2 の`docker-compose`ファイルではサポートされません。
かわりに [network_mode](#network_mode) を利用してください。
@z

@x
### name
@y
### name
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) における追加
@z

@x
Set a custom name for this network. The name field can be used to reference
networks which contain special characters. The name is used as is
and will **not** be scoped with the stack name.
@y
ネットワークに対して独自の名前を設定します。
name は特殊な文字を含んだネットワーク名を参照するために利用できます。
name は記述されたとおりに扱われ、スタック名によってスコープされません。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
networks:
  network1:
    name: my-app-net
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
networks:
  network1:
    name: my-app-net
```
@z

@x
It can also be used in conjunction with the `external` property:
@y
これは`external`プロパティと同時に利用することができます。
@z

@x
```yaml
version: "{{ site.compose_file_v2 }}"
networks:
  network1:
    external: true
    name: my-app-net
```
@y
```yaml
version: "{{ site.compose_file_v2 }}"
networks:
  network1:
    external: true
    name: my-app-net
```
@z

@x
## Variable substitution
@y
{: #variable-substitution }
## 変数の置換
@z

@x
{% include content/compose-var-sub.md %}
@y
{% include content/compose-var-sub.md %}
@z

@x
## Extension fields
@y
{: #extension-fields }
## 拡張項目
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> ファイルフォーマット[バージョン 2.1](compose-versioning.md#version-21) における追加
@z

@x
{% include content/compose-extfields-sub.md %}
@y
{% include content/compose-extfields-sub.md %}
@z

@x
## Compose documentation
@y
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
- [ユーザーガイド](../index.md)
- [Compose のインストール](../install.md)
- [Compose ファイルのバージョンとアップグレード](compose-versioning.md)
- [Compose を使ったサンプルアプリ](../samples-for-compose.md)
- [コマンドラインリファレンス](../reference/index.md)
@z
