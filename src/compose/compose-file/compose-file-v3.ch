%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose file reference
keywords: fig, composition, compose version 3, docker
title: Compose file version 3 reference
toc_max: 4
toc_min: 1
---
@y
---
description: Compose ファイルリファレンス
keywords: fig, composition, compose version 3, docker
title: Compose ファイル バージョン 3 リファレンス
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
These topics describe version 3 of the Compose file format. This is the newest
version.
@y
ここに示す内容は Compose ファイルフォーマット、バージョン 3 です。
これが最新バージョンです。
@z

@x
## Compose and Docker compatibility matrix
@y
{: #compose-and-docker-compatibility-matrix" }
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
## Compose file structure and examples
@y
{: #compose-file-structure-and-examples }
## Compose ファイルの構造と記述例
@z

@x
Here is a sample Compose file from the voting app sample used in the
[Docker for Beginners lab](https://github.com/docker/labs/tree/master/beginner/)
topic on [Deploying an app to a Swarm](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md):
@y
Here is a sample Compose file from the voting app sample used in the
[Docker for Beginners lab](https://github.com/docker/labs/tree/master/beginner/)
topic on [Deploying an app to a Swarm](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md):
@z

@x
<div class="panel panel-default">
    <div class="panel-heading collapsed" data-toggle="collapse" data-target="#collapseSample1" style="cursor: pointer">
    Example Compose file version 3
    <i class="chevron fa fa-fw"></i></div>
    <div class="collapse block" id="collapseSample1">
<pre><code>
version: "{{ site.compose_file_v3 }}"
services:
@y
<div class="panel panel-default">
    <div class="panel-heading collapsed" data-toggle="collapse" data-target="#collapseSample1" style="cursor: pointer">
    Compose ファイル バージョン 3 の記述例
    <i class="chevron fa fa-fw"></i></div>
    <div class="collapse block" id="collapseSample1">
<pre><code>
version: "{{ site.compose_file_v3 }}"
services:
@z

@x
  redis:
    image: redis:alpine
    ports:
      - "6379"
    networks:
      - frontend
    deploy:
      replicas: 2
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
@y
  redis:
    image: redis:alpine
    ports:
      - "6379"
    networks:
      - frontend
    deploy:
      replicas: 2
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
@z

@x
  db:
    image: postgres:9.4
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - backend
    deploy:
      placement:
        max_replicas_per_node: 1
        constraints:
          - "node.role==manager"
@y
  db:
    image: postgres:9.4
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - backend
    deploy:
      placement:
        max_replicas_per_node: 1
        constraints:
          - "node.role==manager"
@z

@x
  vote:
    image: dockersamples/examplevotingapp_vote:before
    ports:
      - "5000:80"
    networks:
      - frontend
    depends_on:
      - redis
    deploy:
      replicas: 2
      update_config:
        parallelism: 2
      restart_policy:
        condition: on-failure
@y
  vote:
    image: dockersamples/examplevotingapp_vote:before
    ports:
      - "5000:80"
    networks:
      - frontend
    depends_on:
      - redis
    deploy:
      replicas: 2
      update_config:
        parallelism: 2
      restart_policy:
        condition: on-failure
@z

@x
  result:
    image: dockersamples/examplevotingapp_result:before
    ports:
      - "5001:80"
    networks:
      - backend
    depends_on:
      - db
    deploy:
      replicas: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
@y
  result:
    image: dockersamples/examplevotingapp_result:before
    ports:
      - "5001:80"
    networks:
      - backend
    depends_on:
      - db
    deploy:
      replicas: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
@z

@x
  worker:
    image: dockersamples/examplevotingapp_worker
    networks:
      - frontend
      - backend
    deploy:
      mode: replicated
      replicas: 1
      labels: [APP=VOTING]
      restart_policy:
        condition: on-failure
        delay: 10s
        max_attempts: 3
        window: 120s
      placement:
        constraints:
          - "node.role==manager"
@y
  worker:
    image: dockersamples/examplevotingapp_worker
    networks:
      - frontend
      - backend
    deploy:
      mode: replicated
      replicas: 1
      labels: [APP=VOTING]
      restart_policy:
        condition: on-failure
        delay: 10s
        max_attempts: 3
        window: 120s
      placement:
        constraints:
          - "node.role==manager"
@z

@x
  visualizer:
    image: dockersamples/visualizer:stable
    ports:
      - "8080:8080"
    stop_grace_period: 1m30s
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    deploy:
      placement:
        constraints:
          - "node.role==manager"
@y
  visualizer:
    image: dockersamples/visualizer:stable
    ports:
      - "8080:8080"
    stop_grace_period: 1m30s
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    deploy:
      placement:
        constraints:
          - "node.role==manager"
@z

@x
networks:
  frontend:
  backend:
@y
networks:
  frontend:
  backend:
@z

@x
volumes:
  db-data:
</code></pre>
    </div>
</div>
@y
volumes:
  db-data:
</code></pre>
    </div>
</div>
@z

@x
The topics on this reference page are organized alphabetically by top-level key
to reflect the structure of the Compose file itself. Top-level keys that define
a section in the configuration file such as `build`, `deploy`, `depends_on`,
`networks`, and so on, are listed with the options that support them as
sub-topics. This maps to the `<key>: <option>: <value>` indent structure of the
Compose file.
@y
このリファレンスページで取り上げているトピックは、Compose ファイルの構造に合わせて、最上位のキー項目をアルファベット順に示しています。
最上位のキー項目とは、設定ファイルにおいてのセクションを定義するものであり、`build`、`deploy`、`depends_on`、`networks`などのことです。
そのキー項目ごとに、それをサポートするオプションをサブトピックとして説明しています。
これは Compose ファイルにおいて`<key>: <option>: <value>`という形式のインデント構造に対応します。
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
> **ヒント** このファイルの拡張子は`.yml`と`.yaml`のどちらでも構いません。
> いずれでも動作します。
@z

@x
A service definition contains configuration that is applied to each
container started for that service, much like passing command-line parameters to
`docker run`. Likewise, network and volume definitions are analogous to
`docker network create` and `docker volume create`.
@y
サービスの定義とは、そのサービスを起動する各コンテナーに適用される設定を行うことです。
コマンドラインから`docker run`のパラメーターを受け渡すことと、非常によく似ています。
同様に、ネットワークの定義、ボリュームの定義は、それぞれ`docker network create`と`docker volume create`のコマンドに対応づくものです。
@z

@x
As with `docker run`, options specified in the Dockerfile, such as `CMD`,
`EXPOSE`, `VOLUME`, `ENV`, are respected by default - you don't need to
specify them again in `docker-compose.yml`.
@y
`docker run`に関しても同じことが言えますが、Dockerfile にて指定された `CMD`、`EXPOSE`、`VOLUME`、`ENV`のようなオプションはデフォルトでは維持されます。したがって`docker-compose.yml`の中で再度設定する必要はありません。
@z

@x
You can use environment variables in configuration values with a Bash-like
`${VARIABLE}` syntax - see [variable substitution](#variable-substitution) for
full details.
@y
設定を記述する際には環境変数を用いることができます。
環境変数は Bash 風に`${VARIABLE}`のように記述します。
詳しくは[変数の置換](#variable-substitution)を参照してください。
@z

@x
This section contains a list of all configuration options supported by a service
definition in version 3.
@y
このセクションでは、バージョン 3 のサービス定義においてサポートされている設定オプションをすべて説明しています。
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
`build`の指定方法の 1 つは、ビルドコンテキストへのパスを表わす文字列を指定します。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  webapp:
    build: ./dir
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  webapp:
    build: ./dir
```
@z

@x
Or, as an object with the path specified under [context](#context) and
optionally [Dockerfile](#dockerfile) and [args](#args):
@y
あるいは [context](#context) の指定のもとにパスを指定し、オプションとして [Dockerfile](#dockerfile) や [args](#args) を記述する方法をとります。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
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
version: "{{ site.compose_file_v3 }}"
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
> Note when using docker stack deploy
>
> The `build` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
> The `docker stack` command does not build images before deploying.
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> `build `オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
> `docker stack`コマンドは、デプロイするまではイメージをビルドしません。
{: .important }
@z

@x
#### context
@y
#### context
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
@y
```dockerfile
# syntax=docker/dockerfile:1

ARG buildno
ARG gitcommithash
@z

@x
RUN echo "Build number: $buildno"
RUN echo "Based on commit: $gitcommithash"
```
@y
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
> build 引数の適用範囲
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
> YAML のブール値 (`"true"`, `"false"`, `"yes"`, `"no"`, `"on"`, `"off"`) を用いる場合は、クォートで囲む必要があります。
> そうすることで、これらの値は文字列として解釈されます。
@z

@x
#### cache_from
@y
#### cache_from
@z

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format
@y
> ファイルフォーマット[バージョン 3.2](compose-versioning.md#version-32) における追加
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
#### labels
@y
#### labels
@z

@x
> Added in [version 3.3](compose-versioning.md#version-33) file format
@y
> ファイルフォーマット[バージョン 3.3](compose-versioning.md#version-33) における追加
@z

@x
Add metadata to the resulting image using [Docker labels](../../config/labels-custom-metadata.md).
You can use either an array or a dictionary.
@y
[Docker labels](../../config/labels-custom-metadata.md) を使ってイメージにメタデータを追加します。
配列形式と辞書形式のいずれかにより指定します。
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@y
ここでは逆 DNS 記法とすることが推奨されます。
この記法にしておけば、他のソフトウェアが用いるラベルとの競合が避けられるからです。
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
> Added in [version 3.4](compose-versioning.md#version-34) file format
@y
> ファイルフォーマット[バージョン 3.4](compose-versioning.md#version-34) における追加。
@z

@x
Set the network containers connect to for the `RUN` instructions during
build.
@y
ビルド中の`RUN`命令において、ネットワークコンテナーの接続先を設定します。
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
> Added in [version 3.5](compose-versioning.md#version-35) file format
@y
> ファイルフォーマット[バージョン 3.5](compose-versioning.md#version-35) において追加されました。
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
> Added in [version 3.4](compose-versioning.md#version-34) file format
@y
> ファイルフォーマット[バージョン 3.4](compose-versioning.md#version-34) において追加されました。
@z

@x
Build the specified stage as defined inside the `Dockerfile`. See the
[multi-stage build docs](../../develop/develop-images/multistage-build.md) for
details.
@y
`Dockerfile`内部に定義されている特定のステージをビルドする方法は、[マルチステージビルド](../../develop/develop-images/multistage-build.md) を参照してください。
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
> Note when using docker stack deploy
>
> The `cap_add` and `cap_drop` options are ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> `cap_add`オプションと`cap_drop`オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
{: .important }
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
> Note when using docker stack deploy
>
> The `cgroup_parent` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> `cgroup_parent`オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
{: .important }
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
### configs
@y
### configs
@z

@x
Grant access to configs on a per-service basis using the per-service `configs`
configuration. Two different syntax variants are supported.
@y
サービスごとの`configs`を利用して、サービス単位での configs 設定を許可します。
2 つの異なる文法がサポートされています。
@z

@x
> **Note**: The config must already exist or be
> [defined in the top-level `configs` configuration](#configs-configuration-reference)
> of this stack file, or stack deployment fails.
@y
> **メモ**: config は既に定義済であるか、あるいは [最上位の`configs`が定義済](#configs-configuration-reference) である必要があります。
> そうでない場合、このファイルによるデプロイが失敗します。
@z

@x
For more information on configs, see [configs](../../engine/swarm/configs.md).
@y
configs に関する詳細は [configs](../../engine/swarm/configs.md) を参照してください。
@z

@x
#### Short syntax
@y
{: #short-syntax }
#### 短い文法
@z

@x
The short syntax variant only specifies the config name. This grants the
container access to the config and mounts it at `/<config_name>`
within the container. The source name and destination mountpoint are both set
to the config name.
@y
短い文法の場合には config 名を指定するのみです。
これを行うと、コンテナー内において`/<config_name>`というディレクトリをマウントしてアクセス可能とします。
マウント元の名前とマウント名はともに config 名となります。
@z

@x
The following example uses the short syntax to grant the `redis` service
access to the `my_config` and `my_other_config` configs. The value of
`my_config` is set to the contents of the file `./my_config.txt`, and
`my_other_config` is defined as an external resource, which means that it has
already been defined in Docker, either by running the `docker config create`
command or by another stack deployment. If the external config does not exist,
the stack deployment fails with a `config not found` error.
@y
以下の例では短い文法を用います。
`redis`サービスが 2 つの configs ファイル`my_config`と`my_other_config`にアクセスできるようにするものです。
`my_config`へは、ファイル`./my_config.txt`の内容を設定しています。
そして`my_other_config`は外部リソースとして定義します。
これはつまり Docker によりすでに定義されていることを意味し、`docker config create`の実行により、あるいは別のスタックデプロイメントにより指定されます。
外部 config が存在していない場合は、スタックデプロイメントは失敗し`config not found`というエラーになります。
@z

@x
> Added in [version 3.3](compose-versioning.md#version-33) file format.
> 
> `config` definitions are only supported in version 3.3 and higher  of the
> compose file format.
@y
> ファイルフォーマット[バージョン 3.3](compose-versioning.md#version-33) における追加
>
> `config`定義は、Compose ファイルフォーマットのバージョン 3.3 またはそれ以上においてサポートされています。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:latest
    deploy:
      replicas: 1
    configs:
      - my_config
      - my_other_config
configs:
  my_config:
    file: ./my_config.txt
  my_other_config:
    external: true
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:latest
    deploy:
      replicas: 1
    configs:
      - my_config
      - my_other_config
configs:
  my_config:
    file: ./my_config.txt
  my_other_config:
    external: true
```
@z

@x
#### Long syntax
@y
{: #long-syntax }
#### 長い文法
@z

@x
The long syntax provides more granularity in how the config is created within
the service's task containers.
@y
長い文法は、サービスのタスクコンテナー内にて生成する config をより細かく設定します。
@z

@x
- `source`: The identifier of the config as it is defined in this configuration.
- `target`: The path and name of the file to be mounted in the service's
  task containers. Defaults to `/<source>` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the mounted config file
  within in the service's task containers. Both default to `0` on Linux if not
  specified. Not supported on Windows.
- `mode`: The permissions for the file that is mounted within the service's
  task containers, in octal notation. For instance, `0444`
  represents world-readable. The default is `0444`. Configs cannot be writable
  because they are mounted in a temporary filesystem, so if you set the writable
  bit, it is ignored. The executable bit can be set. If you aren't familiar with
  UNIX file permission modes, you may find this
  [permissions calculator](http://permissions-calculator.org/){: target="_blank" rel="noopener" class="_" }
  useful.
@y
- `source`＝ この設定ファイル内において定義される config の識別子。
- `target`＝ サービスのタスクコンテナー内にマウントされるファイルパス名。
  指定されない場合のデフォルトは `/<source>`。
- `uid`と`gid`＝ サービスのタスクコンテナー内にマウントされる config ファイルの所有者を表わす UID 値および GID 値。
  指定されない場合のデフォルトは、Linux においては `0`。
  Windows においてはサポートされません。
- `mode`＝ サービスのタスクコンテナー内にマウントされる config ファイルのパーミッション。
  8 進数表記。
  たとえば`0444`であればすべて読み込み可。
  デフォルトは `0444`。
  Configs は、テンポラリなファイルシステム上にマウントされるため、書き込み可能にはできません。
  したがって書き込みビットを設定しても無視されます。
  実行ビットは設定できます。
  UNIX のファイルパーミッションモードに詳しくない方は、[パーミッション計算機](http://permissions-calculator.org/){: target="_blank" rel="noopener" class="_" } を参照してください。
@z

@x
The following example sets the name of `my_config` to `redis_config` within the
container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The `redis` service does not have access to the `my_other_config`
config.
@y
以下の例では`my_config`という名前の config を、コンテナー内では`redis_config`として設定します。
そしてモードを `0440`（グループが読み込み可能）とし、ユーザーとグループは`103`とします。
`redis`サービスは`my_other_config`へはアクセスしません。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:latest
    deploy:
      replicas: 1
    configs:
      - source: my_config
        target: /redis_config
        uid: '103'
        gid: '103'
        mode: 0440
configs:
  my_config:
    file: ./my_config.txt
  my_other_config:
    external: true
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:latest
    deploy:
      replicas: 1
    configs:
      - source: my_config
        target: /redis_config
        uid: '103'
        gid: '103'
        mode: 0440
configs:
  my_config:
    file: ./my_config.txt
  my_other_config:
    external: true
```
@z

@x
You can grant a service access to multiple configs and you can mix long and
short syntax. Defining a config does not imply granting a service access to it.
@y
1 つのサービスが複数の configs にアクセスする設定とすることもできます。
また短い文法、長い文法を混在することも可能です。
config を定義しただけでは、サービスに対して config へのアクセスを許可するものにはなりません。
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
> Note when using docker stack deploy
>
> The `container_name` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> `container_name`オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
{: .important }
@z

@x
### credential_spec
@y
### credential_spec
@z

@x
> Added in [version 3.3](compose-versioning.md#version-33) file format.
> 
> The `credential_spec` option was added in v3.3. Using group Managed Service
> Account (gMSA) configurations with compose files is supported in file format
> version 3.8 or up.
@y
> ファイルフォーマット[バージョン 3.3](compose-versioning.md#version-33) における追加
>
> `credential_spec`オプションは v3.3 で追加されました。
> Compopse ファイルにおける group Managed Service Account (gMSA) の設定は Compose バージョン 3.8 においてサポートされています。
@z

@x
Configure the credential spec for managed service account. This option is only
used for services using Windows containers. The `credential_spec` must be in the
format `file://<filename>` or `registry://<value-name>`.
@y
管理サービスアカウントに対する資格情報スペック（`credential_spec`）を設定します。
このオプションは Windows コンテナーを利用するサービスにおいてのみ用いられます。
`credential_spec`の書式は`file://<filename>`または`registry://<value-name>`でなければなりません。
@z

@x
When using `file:`, the referenced file must be present in the `CredentialSpecs`
subdirectory in the Docker data directory, which defaults to `C:\ProgramData\Docker\`
on Windows. The following example loads the credential spec from a file named
@y
`file:`を用いるとき、参照するファイルは実際に存在するファイルでなければならず、Docker データディレクトリ配下のサブディレクトリ`CredentialSpecs`になければなりません。
Windows における Docker データディレクトリのデフォルトは`C:\ProgramData\Docker\`です。
以下の例はファイルから資格情報スペックを読み込みます。
@z

@x
```
C:\ProgramData\Docker\CredentialSpecs\my-credential-spec.json
```
@y
```
C:\ProgramData\Docker\CredentialSpecs\my-credential-spec.json
```
@z

@x
```yaml
credential_spec:
  file: my-credential-spec.json
```
@y
```yaml
credential_spec:
  file: my-credential-spec.json
```
@z

@x
When using `registry:`, the credential spec is read from the Windows registry on
the daemon's host. A registry value with the given name must be located in:
@y
`registry:`を用いるとき資格情報スペックは、デーモンホスト内の Windows レジストリから読み込まれます。
指定された名称のレジストリ値は、以下に定義されている必要があります。
@z

@x
    HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs
@y
    HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs
@z

@x
The following example load the credential spec from a value named `my-credential-spec`
in the registry:
@y
以下の例は、レジストリ内の`my-credential-spec`という値から資格情報スペックを読み込みます。
@z

@x
```yaml
credential_spec:
  registry: my-credential-spec
```
@y
```yaml
credential_spec:
  registry: my-credential-spec
```
@z

@x
#### Example gMSA configuration
@y
{: #example-gmsa-configuration }
#### gMSA の設定例
@z

@x
When configuring a gMSA credential spec for a service, you only need
to specify a credential spec with `config`, as shown in the following example:
@y
サービスに対して credential spec における gMSA を設定する場合、credential spec の`config`を設定するだけです。
その例を以下に示します。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  myservice:
    image: myimage:latest
    credential_spec:
      config: my_credential_spec

configs:
  my_credentials_spec:
    file: ./my-credential-spec.json|
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  myservice:
    image: myimage:latest
    credential_spec:
      config: my_credential_spec

configs:
  my_credentials_spec:
    file: ./my-credential-spec.json|
```
@z

@x
### depends_on
@y
### depends_on
@z

@x
Express dependency between services. Service dependencies cause the following
behaviors:
@y
サービス間の依存関係を表わします。
サービスに依存関係があると、以下の動作になります。
@z

@x
- `docker-compose up` starts services in dependency order. In the following
  example, `db` and `redis` are started before `web`.
@y
- `docker-compose up`は依存関係の順にサービスを起動します。
  以下の例において`db`と`redis`は`web`の前に起動されます。
@z

@x
- `docker-compose up SERVICE` automatically includes `SERVICE`'s
  dependencies. In the example below, `docker-compose up web` also
  creates and starts `db` and `redis`.
@y
- `docker-compose up SERVICE`を実行すると`SERVICE`における依存関係をもとに動作します。
  後述の例において`docker-compose up web`を実行すると`db`と`redis`を生成して起動します。
@z

@x
- `docker-compose stop` stops services in dependency order. In the following
  example, `web` is stopped before `db` and `redis`.
@y
- `docker-compose stop`は依存関係の順にサービスを停止します。
  以下の例においては`web`が停止されてから`db`と`redis`が停止されます。
@z

@x
Simple example:
@y
以下がその簡単な例です。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
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
version: "{{ site.compose_file_v3 }}"
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
> There are several things to be aware of when using `depends_on`:
>
> - `depends_on` does not wait for `db` and `redis` to be "ready" before
>   starting `web` - only until they have been started. If you need to wait
>   for a service to be ready, see [Controlling startup order](../startup-order.md)
>   for more on this problem and strategies for solving it.
> - The `depends_on` option is ignored when
>   [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
>   with a version 3 Compose file.
@y
> `depends_on`の利用にあたっては、気をつけておくべきことがあります。
>
> - `depends_on`では`db`や`redis`が「準備」状態になるのを待たずに、つまりそれらを開始したらすぐに`web`を起動します。
>   準備状態になるのを待ってから次のサービスを起動することが必要な場合は、[Compose における起動順の制御](../startup-order.md)にて示す内容と解決方法を確認してください。
> - Compose ファイルバージョン 3 において`depends_on`オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
@z

@x
### deploy
@y
### deploy
@z

@x
> Added in [version 3](compose-versioning.md#version-3) file format.
@y
> ファイルフォーマット[バージョン 3](compose-versioning.md#version-3) における追加
@z

@x
Specify configuration related to the deployment and running of services. This
only takes effect when deploying to a [swarm](../../engine/swarm/index.md) with
[docker stack deploy](../../engine/reference/commandline/stack_deploy.md), and is
ignored by `docker-compose up` and `docker-compose run`.
@y
サービスのデプロイや起動に関する設定を行います。
この設定が有効になるのは [スウォーム](../../engine/swarm/index.md) に対して [docker stack deploy](../../engine/reference/commandline/stack_deploy.md) コマンドを実行したときであって、`docker-compose up`や`docker-compose run`を実行したときには無視されます。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:alpine
    deploy:
      replicas: 6
      placement:
        max_replicas_per_node: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:alpine
    deploy:
      replicas: 6
      placement:
        max_replicas_per_node: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
```
@z

@x
Several sub-options are available:
@y
利用可能なサブオプションがあります。
@z

@x
#### endpoint_mode
@y
#### endpoint_mode
@z

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format.
@y
> ファイルフォーマット[バージョン 3.2](compose-versioning.md#version-32) における追加。
@z

@x
Specify a service discovery method for external clients connecting to a swarm.
@y
スウォームに接続する外部クライアントのサービスディスカバリー方法を指定します。
@z

@x
* `endpoint_mode: vip` - Docker assigns the service a virtual IP (VIP)
that acts as the front end for clients to reach the service on a
network. Docker routes requests between the client and available worker
nodes for the service, without client knowledge of how many nodes
are participating in the service or their IP addresses or ports.
(This is the default.)
@y
* `endpoint_mode: vip` - Docker はサービスに対して仮想 IP（virtual IP; VIP）を割り当てます。
  これはネットワーク上のサービスに対して、クライアントがアクセスできるようにするためのフロントエンドとして機能します。
  Docker がサービスに参加する稼動中のワーカーノードやクライアントの間でリクエストを受け渡ししている際に、クライアントはそのサービス上にどれだけの数のノードが参加しているのか、その IP アドレスやポートが何なのか、一切分かりません。
  （この設定がデフォルトです。）
@z

@x
* `endpoint_mode: dnsrr` -  DNS round-robin (DNSRR) service discovery does
not use a single virtual IP. Docker sets up DNS entries for the service
such that a DNS query for the service name returns a list of IP addresses,
and the client connects directly to one of these. DNS round-robin is useful
in cases where you want to use your own load balancer, or for Hybrid
Windows and Linux applications.
@y
* `endpoint_mode: dnsrr` -  DNS ラウンドロビン（DNS round-robin; DNSRR）によるサービスディスカバリーでは、仮想 IP は単一ではありません。
  Docker はサービスに対する DNS エントリーを設定し、サービス名に対する DNS クエリーが IP アドレスのリストを返すようにします。
  クライアントはそのうちの 1 つに対して直接アクセスします。
  DNS ラウンドロビンが有効なのは、独自のロードバランサーを利用したい場合や、Windows と Linux が統合されたアプリケーションに対して利用する場合です。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
@y
```yaml
version: "{{ site.compose_file_v3 }}"
@z

@x
services:
  wordpress:
    image: wordpress
    ports:
      - "8080:80"
    networks:
      - overlay
    deploy:
      mode: replicated
      replicas: 2
      endpoint_mode: vip
@y
services:
  wordpress:
    image: wordpress
    ports:
      - "8080:80"
    networks:
      - overlay
    deploy:
      mode: replicated
      replicas: 2
      endpoint_mode: vip
@z

@x
  mysql:
    image: mysql
    volumes:
       - db-data:/var/lib/mysql/data
    networks:
       - overlay
    deploy:
      mode: replicated
      replicas: 2
      endpoint_mode: dnsrr
@y
  mysql:
    image: mysql
    volumes:
       - db-data:/var/lib/mysql/data
    networks:
       - overlay
    deploy:
      mode: replicated
      replicas: 2
      endpoint_mode: dnsrr
@z

@x
volumes:
  db-data:
@y
volumes:
  db-data:
@z

@x
networks:
  overlay:
```
@y
networks:
  overlay:
```
@z

@x
The options for `endpoint_mode` also work as flags on the swarm mode CLI command
[docker service create](../../engine/reference/commandline/service_create.md). For a
quick list of all swarm related `docker` commands, see
[Swarm mode CLI commands](../../engine/swarm/index.md#swarm-mode-key-concepts-and-tutorial).
@y
`endpoint_mode`に対する設定は、スウォームモードの CLI コマンド [docker service create](../../engine/reference/commandline/service_create.md) におけるフラグとしても動作します。
スウォームに関連する`docker`コマンドの一覧は [スウォームモード CLI コマンド](../../engine/swarm/index.md#swarm-mode-key-concepts-and-tutorial) を参照してください。
@z

@x
To learn more about service discovery and networking in swarm mode, see
[Configure service discovery](../../engine/swarm/networking.md#configure-service-discovery)
in the swarm mode topics.
@y
スウォームモードにおけるサービスディスカバリーやネットワークに関しての詳細は、スウォームモードのトピックにある [サービスディスカバリーの設定](../../engine/swarm/networking.md#configure-service-discovery) を参照してください。
@z

@x
#### labels
@y
#### labels
@z

@x
Specify labels for the service. These labels are *only* set on the service,
and *not* on any containers for the service.
@y
サービスに対してのラベルを設定します。
このラベルはサービスに対してのみ設定するものであって、サービスのコンテナーに設定するものでは**ありません**。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: web
    deploy:
      labels:
        com.example.description: "This label will appear on the web service"
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: web
    deploy:
      labels:
        com.example.description: "This label will appear on the web service"
```
@z

@x
To set labels on containers instead, use the `labels` key outside of `deploy`:
@y
コンテナーにラベルを設定するのであれば、`deploy`の外に`labels`キーを記述してください。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: web
    labels:
      com.example.description: "This label will appear on all containers for the web service"
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: web
    labels:
      com.example.description: "This label will appear on all containers for the web service"
```
@z

@x
#### mode
@y
#### mode
@z

@x
Either `global` (exactly one container per swarm node) or `replicated` (a
specified number of containers). The default is `replicated`. (To learn more,
see [Replicated and global services](../../engine/swarm/how-swarm-mode-works/services.md#replicated-and-global-services)
in the [swarm](../../engine/swarm/index.md) topics.)
@y
`global`（スウォームノードごとに 1 つのコンテナーとする）か、`replicated`（指定されたコンテナー数とするか）のいずれかを設定します。
デフォルトは`replicated`です。
（詳しくは [スウォーム](../../engine/swarm/index.md)のトピックにある [サービスの Replicated と global](../../engine/swarm/how-swarm-mode-works/services.md#replicated-and-global-services) を参照してください。）
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  worker:
    image: dockersamples/examplevotingapp_worker
    deploy:
      mode: global
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  worker:
    image: dockersamples/examplevotingapp_worker
    deploy:
      mode: global
```
@z

@x
#### placement
@y
#### placement
@z

@x
Specify placement of constraints and preferences. See the docker service create
documentation for a full description of the syntax and available types of
[constraints](../../engine/reference/commandline/service_create.md#specify-service-constraints---constraint),
[preferences](../../engine/reference/commandline/service_create.md#specify-service-placement-preferences---placement-pref),
and [specifying the maximum replicas per node](../../engine/reference/commandline/service_create.md#specify-maximum-replicas-per-node---replicas-max-per-node)
@y
制約（constraints）とプリファレンス（preferences）の記述場所を指定します。
docker service create のドキュメントには、[制約](../../engine/reference/commandline/service_create.md#specify-service-constraints---constraint)、[プリファレンス](../../engine/reference/commandline/service_create.md#specify-service-placement-preferences---placement-pref)、[各ノードごとの最大レプリカ数の設定](../../engine/reference/commandline/service_create.md#specify-maximum-replicas-per-node---replicas-max-per-node) に関しての文法と設定可能な型について、詳細に説明しているので参照してください。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  db:
    image: postgres
    deploy:
      placement:
        constraints:
          - "node.role==manager"
          - "engine.labels.operatingsystem==ubuntu 18.04"
        preferences:
          - spread: node.labels.zone
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  db:
    image: postgres
    deploy:
      placement:
        constraints:
          - "node.role==manager"
          - "engine.labels.operatingsystem==ubuntu 18.04"
        preferences:
          - spread: node.labels.zone
```
@z

@x
#### max_replicas_per_node
@y
#### max_replicas_per_node
@z

@x
> Added in [version 3.8](compose-versioning.md#version-38) file format.
@y
> ファイルフォーマット[バージョン 3.8](compose-versioning.md#version-38) における追加。
@z

@x
If the service is `replicated` (which is the default), [limit the number of replicas](../../engine/reference/commandline/service_create.md#specify-maximum-replicas-per-node---replicas-max-per-node)
that can run on a node at any time.
@y
サービスを `replicated`（デフォルト）に設定しているとき、ノード上において稼動可能な [レプリカ数の上限](../../engine/reference/commandline/service_create.md#specify-maximum-replicas-per-node---replicas-max-per-node) を定めます。
@z

@x
When there are more tasks requested than running nodes, an error
`no suitable node (max replicas per node limit exceed)` is raised.
@y
稼動中のノード数以上に、タスクが要求された場合、`no suitable node (max replicas per node limit exceed)`（十分なノードがない (ノードごとの最大レプリカ数の上限オーバー)）というエラーが発生します。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  worker:
    image: dockersamples/examplevotingapp_worker
    networks:
      - frontend
      - backend
    deploy:
      mode: replicated
      replicas: 6
      placement:
        max_replicas_per_node: 1
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  worker:
    image: dockersamples/examplevotingapp_worker
    networks:
      - frontend
      - backend
    deploy:
      mode: replicated
      replicas: 6
      placement:
        max_replicas_per_node: 1
```
@z

@x
#### replicas
@y
#### replicas
@z

@x
If the service is `replicated` (which is the default), specify the number of
containers that should be running at any given time.
@y
サービスを `replicated`（デフォルト）に設定しているときに、起動させるコンテナー数を指定します。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  worker:
    image: dockersamples/examplevotingapp_worker
    networks:
      - frontend
      - backend
    deploy:
      mode: replicated
      replicas: 6
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  worker:
    image: dockersamples/examplevotingapp_worker
    networks:
      - frontend
      - backend
    deploy:
      mode: replicated
      replicas: 6
```
@z

@x
#### resources
@y
#### resources
@z

@x
Configures resource constraints.
@y
リソースの制約を設定します。
@z

@x
> Changed in compose-file version 3
>
> The `resources` section replaces  the [older resource constraint options](compose-file-v2.md#cpu-and-other-resources)
> in Compose files prior to version 3 (`cpu_shares`, `cpu_quota`, `cpuset`,
> `mem_limit`, `memswap_limit`, `mem_swappiness`).
> Refer to [Upgrading version 2.x to 3.x](compose-versioning.md#upgrading)
> to learn about differences between version 2 and 3 of the compose-file format.
@y
> compose ファイルバージョン 3 における変更
>
> `resources`のセクションは Compose ファイルバージョン 3 以前の [リソースに対する古い制約オプション](compose-file-v2.md#cpu-and-other-resources) （`cpu_shares`, `cpu_quota`, `cpuset`, `mem_limit`, `memswap_limit`, `mem_swappiness`）に置き換わるものです。
> compose ファイルのバージョン 2 と 3 の違いについては [バージョン 2.x から 3.x へのアップグレード](compose-versioning.md#upgrading) を参照してください。
@z

@x
Each of these is a single value, analogous to its
[docker service create](../../engine/reference/commandline/service_create.md) counterpart.
@y
個々の設定には単一の値を指定します。
これは [docker service create](../../engine/reference/commandline/service_create.md) のオプションに対応づきます。
@z

@x
In this general example, the `redis` service is constrained to use no more than
50M of memory and `0.50` (50% of a single core) of available processing time (CPU),
and has `20M` of memory and `0.25` CPU time reserved (as always available to it).
@y
以下の一般的な例は`redis`サービスに制約をつけるものです。
メモリ利用は 50M まで、利用可能なプロセス時間（CPU）は `0.50`（シングルコアの 50%）まで。
最低メモリは`20M`確保し（常時利用可能な） CPU 時間は`0.25`とします。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:alpine
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 50M
        reservations:
          cpus: '0.25'
          memory: 20M
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:alpine
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 50M
        reservations:
          cpus: '0.25'
          memory: 20M
```
@z

@x
The topics below describe available options to set resource constraints on
services or containers in a swarm.
@y
以下では、スウォーム内のサービスやコンテナーに設定できるリソース制約を説明します。
@z

@x
> Looking for options to set resources on non swarm mode containers?
>
> The options described here are specific to the
`deploy` key and swarm mode. If you want to set resource constraints
on non swarm deployments, use
[Compose file format version 2 CPU, memory, and other resource options](compose-file-v2.md#cpu-and-other-resources).
If you have further questions, refer to the discussion on the GitHub
issue [docker/compose/4513](https://github.com/docker/compose/issues/4513){: target="_blank" rel="noopener" class="_"}.
{: .important}
@y
> スウォームモードではないコンテナーでのリソース設定を探していますか？
>
> ここに説明している設定は、スウォームモードで利用する`deploy`キーにおけるオプションです。
> スウォームモードではないデプロイメントにおけるリソース制約を設定したい場合は、[Compose ファイルバージョン 2 における CPU、メモリなどに関するリソースオプション](compose-file-v2.md#cpu-and-other-resources) を参照してください。
> それでもよくわからない場合は、GitHub 上にあげられている議論 [docker/compose/4513](https://github.com/docker/compose/issues/4513){: target="_blank" rel="noopener" class="_"} を参照してください。
{: .important}
@z

@x
##### Out Of Memory Exceptions (OOME)
@y
##### Out Of Memory Exceptions (OOME)
@z

@x
If your services or containers attempt to use more memory than the system has
available, you may experience an Out Of Memory Exception (OOME) and a container,
or the Docker daemon, might be killed by the kernel OOM killer. To prevent this
from happening, ensure that your application runs on hosts with adequate memory
and see [Understand the risks of running out of memory](../../config/containers/resource_constraints.md#understand-the-risks-of-running-out-of-memory).
@y
サービスやコンテナーが、システムにおいて利用可能なメモリ容量以上を利用しようとして、Out Of Memory Exception (OOME) が発生するということがあります。
コンテナーあるいは Docker デーモンは、このときカーネルの OOM killer によって強制終了させられます。
これが発生しないようにするためには、ホスト上で動作させるアプリケーションのメモリ利用を適切に行うことが必要です。
[メモリ不足のリスクへの理解](../../config/containers/resource_constraints.md#understand-the-risks-of-running-out-of-memory) を参照してください。
@z

@x
#### restart_policy
@y
#### restart_policy
@z

@x
Configures if and how to restart containers when they exit. Replaces
[`restart`](compose-file-v2.md#orig-resources).
@y
コンテナーが終了した後に、いつどのようにして再起動するかを設定します。
[`restart`](compose-file-v2.md#orig-resources) に置き換わるものです。
@z

@x
- `condition`: One of `none`, `on-failure` or `any` (default: `any`).
- `delay`: How long to wait between restart attempts, specified as a
  [duration](#specifying-durations) (default: 5s).
- `max_attempts`: How many times to attempt to restart a container before giving
  up (default: never give up). If the restart does not succeed within the configured
  `window`, this attempt doesn't count toward the configured `max_attempts` value.
  For example, if `max_attempts` is set to '2', and the restart fails on the first
  attempt, more than two restarts may be attempted.
- `window`: How long to wait before deciding if a restart has succeeded,
  specified as a [duration](#specifying-durations) (default:
  decide immediately).
@y
- `condition`: `none`, `on-failure`, `any`のいずれかを指定します。（デフォルト: `any`）
- `delay`: 再起動までどれだけの間隔をあけるかを [時間](#specifying-durations) として指定します。
  （デフォルト: 5s）
- `max_attempts`: 再起動に失敗しても何回までリトライするかを指定します。
  （デフォルト: 無制限）
  設定した`window`時間内に再起動が成功しなかったとしても、そのときの再起動リトライは、`max_attempts`の値としてカウントされません。
  たとえば`max_attempts`が`2`として設定されていて、1 回めの再起動が失敗したとします。
  この場合、2 回以上の再起動が発生する可能性があります。
- `window`: 再起動が成功したかどうかを決定するためにどれだけ待つかを [時間](#specifying-durations) として指定します。
  （デフォルト: 即時）
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:alpine
    deploy:
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 3
        window: 120s
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:alpine
    deploy:
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 3
        window: 120s
```
@z

@x
#### rollback_config
@y
#### rollback_config
@z

@x
> Added in [version 3.7](compose-versioning.md#version-37) file format.
@y
> ファイルフォーマット[バージョン 3.7](compose-versioning.md#version-37) における追加
@z

@x
Configures how the service should be rollbacked in case of a failing
update.
@y
サービスの更新が失敗した場合に、どのようにしてロールバックするかを設定します。
@z

@x
- `parallelism`: The number of containers to rollback at a time. If set to 0, all containers rollback simultaneously.
- `delay`: The time to wait between each container group's rollback (default 0s).
- `failure_action`: What to do if a rollback fails. One of `continue` or `pause` (default `pause`)
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 5s) **Note**: Setting to 0 will use the default 5s.
- `max_failure_ratio`: Failure rate to tolerate during a rollback (default 0).
- `order`: Order of operations during rollbacks. One of `stop-first` (old task is stopped before starting new one), or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`).
@y
- `parallelism`: 一度にロールバックするコンテナー数を指定します。
  0 を指定した場合、コンテナーすべてが同時にロールバックされます。
- `delay`: コンテナーグループごとのロールバックの間をどれだけ待つかを指定します。（デフォルト 0s）
- `failure_action`: ロールバックが失敗したときにどうするかを指定します。
  `continue`、 `pause`のいずれかです。（デフォルト`pause`）
- `monitor`: 各タスク更新後に失敗を監視する時間`(ns|us|ms|s|m|h)`を設定します。
  （デフォルト： 5s）**メモ** 0 に設定するとデフォルト値 5s が用いられます。
- `max_failure_ratio`: ロールバック時の失敗許容率を設定します。（デフォルト 0）
- `order`: ロールバック時の処理順を設定します。
  `stop-first`（古いタスクを停止してから新しいタスクを実行する）、あるいは`start-first`（新しいタスクをまず起動させ、タスク起動を一時的に重複させる）のいずれかを設定します。
  （デフォルト： `stop-first`）
@z

@x
#### update_config
@y
#### update_config
@z

@x
Configures how the service should be updated. Useful for configuring rolling
updates.
@y
どのようにサービスを更新するかを設定します。
Rolling update を設定する際に有効です。
@z

@x
- `parallelism`: The number of containers to update at a time.
- `delay`: The time to wait between updating a group of containers.
- `failure_action`: What to do if an update fails. One of `continue`, `rollback`, or `pause`
  (default: `pause`).
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 5s) **Note**: Setting to 0 will use the default 5s.
- `max_failure_ratio`: Failure rate to tolerate during an update.
- `order`: Order of operations during updates. One of `stop-first` (old task is stopped before starting new one), or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`) **Note**: Only supported for v3.4 and higher.
@y
- `parallelism`： 一度に更新を行うコンテナー数を設定します。
- `delay`： 一連のコンテナーを更新する時間を設定します。
- `failure_action`： 更新に失敗したときの動作を設定します。
  `continue`、`rollback`、`pause`のいずれかです。
  （デフォルト： `pause`）
- `monitor`: 各タスク更新後に失敗を監視する時間`(ns|us|ms|s|m|h)`を設定します。
  （デフォルト： 5s）**メモ** 0 に設定するとデフォルト値 5s が用いられます。
- `max_failure_ratio`: 更新時の失敗許容率を設定します。
- `order`: 更新時の処理順を設定します。
  `stop-first`（古いタスクを停止してから新しいタスクを実行する）、あるいは`start-first`（新しいタスクをまず起動させ、タスク起動を一時的に重複させる）のいずれかを設定します。
  （デフォルト： `stop-first`）
   **メモ**: v3.4 またはそれ以上においてのみサポートされます。
@z

@x
> Added in [version 3.4](compose-versioning.md#version-34) file format.
>
> The `order` option is only supported by v3.4 and higher of the compose
> file format.
@y
> ファイルフォーマット[バージョン 3.4](compose-versioning.md#version-34) における追加
>
> `order`オプションは Compose ファイルフォーマット v3.4 およびそれ以上においてのみサポートされます。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  vote:
    image: dockersamples/examplevotingapp_vote:before
    depends_on:
      - redis
    deploy:
      replicas: 2
      update_config:
        parallelism: 2
        delay: 10s
        order: stop-first
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  vote:
    image: dockersamples/examplevotingapp_vote:before
    depends_on:
      - redis
    deploy:
      replicas: 2
      update_config:
        parallelism: 2
        delay: 10s
        order: stop-first
```
@z

@x
#### Not supported for `docker stack deploy`
@y
{: #not-supported-for-docker-stack-deploy }
#### `docker stack deploy`でサポートされないオプション
@z

@x
The following sub-options (supported for `docker-compose up` and `docker-compose run`) are _not supported_ for `docker stack deploy` or the `deploy` key.
@y
以下に示すサブオプション（`docker-compose up`と`docker-compose run`においてサポートされるオプション）は、`docker stack deploy`または`deploy`キーにおいては **サポートされません** 。
@z

@x
- [build](#build)
- [cgroup_parent](#cgroup_parent)
- [container_name](#container_name)
- [devices](#devices)
- [tmpfs](#tmpfs)
- [external_links](#external_links)
- [links](#links)
- [network_mode](#network_mode)
- [restart](#restart)
- [security_opt](#security_opt)
- [userns_mode](#userns_mode)
@y
- [build](#build)
- [cgroup_parent](#cgroup_parent)
- [container_name](#container_name)
- [devices](#devices)
- [tmpfs](#tmpfs)
- [external_links](#external_links)
- [links](#links)
- [network_mode](#network_mode)
- [restart](#restart)
- [security_opt](#security_opt)
- [userns_mode](#userns_mode)
@z

@x
> Tip
>
> See the section on [how to configure volumes for services, swarms, and docker-stack.yml
> files](#volumes-for-services-swarms-and-stack-files). Volumes _are_ supported
> but to work with swarms and services, they must be configured as named volumes
> or associated with services that are constrained to nodes with access to the
> requisite volumes.
@y
> ヒント
>
> [サービス、スウォーム、docker-stack.yml ファイルにおけるボリューム設定方法](#volumes-for-services-swarms-and-stack-files) にある説明を確認してください。
> ボリュームはサポートされますが、これはスウォームとサービスに対してです。
> ボリュームは名前つきとして設定されるか、あるいは必要なボリュームにアクセスするノードのみから構成されるサービスに関連づけられている必要があります。
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
Docker クライアントの create オプションと同じ書式にします。
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
> Note when using docker stack deploy
>
> The `devices` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> `devices`オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md)を行う場合には無視されます。
{: .important }
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
> これはつまり、Dockerfile に`CMD`命令があったとしたら無視されるということです。
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
ブール値`true`、`false`、`yes`、`no`を用いる場合は、クォートで囲むことで YML パーサーによって True や False に変換されてしまうのを防ぐ必要があります。
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
`external_links`の文法は、かつてのオプション`links`と同様です。
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
> The externally-created  containers must be connected to at least one of the same
> networks as the service that is linking to them. [Links](compose-file-v2#links)
> are a legacy option. We recommend using [networks](#networks) instead.

> Note when using docker stack deploy
>
> The `external_links` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
{: .important }
@y
> **メモ**
>
> 外部にて生成されたコンテナーをネットワークに接続する場合は、そのコンテナーがサービスとしてリンクしているネットワークのうちの 1 つでなければなりません。
> [Links](compose-file-v2#links) は古いオプションです。
> これではなく [networks](#networks) を用いるようにしてください。

> docker のスタックデプロイ時のメモ
>
> `external_links`オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
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
### healthcheck
@y
### healthcheck
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
`interval`, `timeout`, `start_period`は [時間](#specifying-durations) を設定します。
@z

@x
> Added in [version 3.4](compose-versioning.md#version-34) file format.
>
> The `start_period` option was added in file format 3.4.
@y
> ファイルフォーマット[バージョン 3.4](compose-versioning.md#version-34) における追加
>
> `start_period`オプションはファイルフォーマットバージョン 3.4 またはそれ以上においてのみサポートされます。
@z

@x
`test` must be either a string or a list. If it's a list, the first item must be
either `NONE`, `CMD` or `CMD-SHELL`. If it's a string, it's equivalent to
specifying `CMD-SHELL` followed by that string.
@y
`test`は 1 つの文字列かリスト形式である必要があります。
リスト形式の場合、第 1 要素は必ず`NONE`、`CMD`、`CMD-SHELL`のいずれかとします。
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
上と同様ですが、次は`/bin/sh`によってラップされます。
なお以下の 2 つの書式は同じことです。
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
イメージが設定するデフォルトのヘルスチェックを無効にするには、`disable: true`を指定します。
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
> Added in [version 3.7](compose-versioning.md#version-37) file format.
@y
> ファイルフォーマット[バージョン 3.7](compose-versioning.md#version-37) における追加
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
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: alpine:latest
    init: true
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
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
> [`init-path` configuration option](/engine/reference/commandline/dockerd/#daemon-configuration-file).
@y
> 利用されるデフォルトの init の実行モジュールは [Tini](https://github.com/krallin/tini) であり、デーモンホストの`/usr/libexec/docker-init`にインストールされています。
> デーモンに対して独自の init 実行モジュールを設定するには、[`init-path`設定オプション](/engine/reference/commandline/dockerd/#daemon-configuration-file) を利用します。
@z

@x
### isolation
@y
### isolation
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
>**Warning**
>
> The `--link` flag is a legacy feature of Docker. It may eventually be removed.
> Unless you absolutely need to continue using it, we recommend that you use
> [user-defined networks](../networking.md)
> to facilitate communication between two containers instead of using `--link`.
>
> One feature that user-defined networks do not support that you can do with
> `--link` is sharing environmental variables between containers. However, you
> can use other mechanisms such as volumes to share environment variables between
> containers in a more controlled way.
{:.warning}
@y
>**警告**
>
> `--link`フラグはすでに古い機能であり、そのうち削除されるかもしれません。
> このフラグを利用し続ける必要が明確にないのであれば、[ユーザー定義のネットワーク](../networking.md) を利用することをお勧めします。
> そうすれば`--link`を用いなくても、2 つのコンテナー間での通信を実現できます。
>
> ただしユーザー定義のネットワークではサポートされない機能が 1 つあります。
> それは`--link`であれば、コンテナー間で環境変数を共有できるという点です。
> もっともボリュームなどの他のメカニズムを利用すれば、コンテナー間での環境変数の共有は可能であり、その方がより制御しやすい方法になります。
{:.warning}
@z

@x
Link to containers in another service. Either specify both the service name and
a link alias (`"SERVICE:ALIAS"`), or just the service name.
@y
他サービスのコンテナーをリンクします。
サービス名とリンクのエイリアス名（`"SERVICE:ALIAS"`）を指定するか、直接サービス名を指定します。
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
Links are not required to enable services to communicate - by default,
any service can reach any other service at that service’s name. (See also, the
[Links topic in Networking in Compose](../networking.md#links).)
@y
Links はサービスを通信可能とするために必要になるものではありません。
デフォルトで各サービスは、サービス名を使って他サービスにアクセスすることができます。
（[Compose ネットワークにおける Links のトピック](../networking.md#links) も参照してください。）
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
> communicate.

> Note when using docker stack deploy
>
> The `links` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
{: .important }
@y
> **メモ**
>
> links と [networks](#networks) をともに設定する場合、リンクするサービスは、少なくとも 1 つのネットワークが共有され通信ができるようにする必要があります。

> docker のスタックデプロイ時のメモ
>
> Compose ファイルバージョン 3 においてこのオプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md)を行う場合には無視されます。
{: .important }
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
ログドライバーへのログオプションの設定は`options`キーにより行います。
これは`docker run`コマンドの`--log-opt`オプションと同じです。
@z

@x
Logging options are key-value pairs. An example of `syslog` options:
@y
ログオプションはキーバリューのペアで指定します。
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
The default driver [json-file](../../config/containers/logging/json-file.md), has options to limit the amount of logs stored. To do this, use a key-value pair for maximum storage size and maximum number of files:
@y
デフォルトドライバーである [json-file](../../config/containers/logging/json-file.md) には、保存するログの容量を制限するオプションがあります。
これを利用する場合は、キーバリューのペアを使って、最大保存容量（max-size）と最大ファイル数（max-file）を指定します。
@z

@x
```yaml
options:
  max-size: "200k"
  max-file: "10"
```
@y
```yaml
options:
  max-size: "200k"
  max-file: "10"
```
@z

@x
The example shown above would store log files until they reach a `max-size` of
200kB, and then rotate them. The amount of individual log files stored is
specified by the `max-file` value. As logs grow beyond the max limits, older log
files are removed to allow storage of new logs.
@y
上に示した例では、`max-size`に指定された 200 KB に達するまでログファイルへの出力を行います。
最大値に達するとログをローテートします。
保存するログファイル数は`max-file`により指定します。
ログ出力が上限数を越えた場合、古いログファイルは削除され、新たなログファイルへの保存が行われます。
@z

@x
Here is an example `docker-compose.yml` file that limits logging storage:
@y
以下に示すのは`docker-compose.yml`ファイルにおいてログ保存の制限を行う例です。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  some-service:
    image: some-service
    logging:
      driver: "json-file"
      options:
        max-size: "200k"
        max-file: "10"
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  some-service:
    image: some-service
    logging:
      driver: "json-file"
      options:
        max-size: "200k"
        max-file: "10"
```
@z

@x
> Logging options available depend on which logging driver you use
>
> The above example for controlling log files and sizes uses options
> specific to the [json-file driver](../../config/containers/logging/json-file.md).
> These particular options are not available on other logging drivers.
> For a full list of supported logging drivers and their options, refer to the
> [logging drivers](../../config/containers/logging/configure.md) documentation.
@y
> 利用可能なログオプションはログドライバーに依存
>
> 上で示した例においては、ログファイルや容量を制御するために [json-file ドライバー](../../config/containers/logging/json-file.md) に固有のオプションを利用しました。
> このようなオプションはその他のログドライバーでは利用できません。
> サポートされるログドライバーと個々のオプションについては [ログドライバー](../../config/containers/logging/configure.md) を参照してください。
@z

@x
### network_mode
@y
### network_mode
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
> **Note**
>
> * This option is ignored when
>   [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md).
> * `network_mode: "host"` cannot be mixed with [links](#links).
{: .important }
@y
> **メモ**
>
> * このオプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md)を行う場合には無視されます。
> * `network_mode: "host"`とした場合、[links](#links) を同時に指定することはできません。
{: .important }
@z

@x
### networks
@y
### networks
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
以下の例では 3 つのサービス（`web`, `worker`, `db`）と 2 つのネットワーク（`new`と`legacy`）を提供します。
`db`サービスは`new`ネットワーク上では、ホスト名`db`あるいは`database`としてアクセスできます。
一方`legacy`ネットワーク上では`db`あるいは`mysql`としてアクセスできます。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
@y
```yaml
version: "{{ site.compose_file_v3 }}"
@z

@x
services:
  web:
    image: "nginx:alpine"
    networks:
      - new
@y
services:
  web:
    image: "nginx:alpine"
    networks:
      - new
@z

@x
  worker:
    image: "my-worker-image:latest"
    networks:
      - legacy
@y
  worker:
    image: "my-worker-image:latest"
    networks:
      - legacy
@z

@x
  db:
    image: mysql
    networks:
      new:
        aliases:
          - database
      legacy:
        aliases:
          - mysql
@y
  db:
    image: mysql
    networks:
      new:
        aliases:
          - database
      legacy:
        aliases:
          - mysql
@z

@x
networks:
  new:
  legacy:
```
@y
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
`ipam` block with subnet configurations covering each static address.
@y
[最上位の networks セクション](#network-configuration-reference) の対応するネットワーク設定においては、`ipam`ブロックが必要です。
そこでは各スタティックアドレスに応じたサブネットの設定が必要になります。
@z

@x
> If IPv6 addressing is desired, the [`enable_ipv6`](compose-file-v2.md#enable_ipv6)
> option must be set, and you must use a [version 2.x Compose file](compose-file-v2.md#ipv4_address-ipv6_address).
> _IPv6 options do not currently work in swarm mode_.
@y
> IPv6 アドレスが必要である場合は、[`enable_ipv6`](compose-file-v2.md#enable_ipv6) オプションの設定が必要になります。
> この場合は [Compose ファイルバージョン 2.x ](compose-file-v2.md#ipv4_address-ipv6_address) を利用しなければなりません。
> **IPv6 オプションは、現時点ではスウォームモード内で動作しません**。
@z

@x
An example:
@y
以下に例を示します。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
@y
```yaml
version: "{{ site.compose_file_v3 }}"
@z

@x
services:
  app:
    image: nginx:alpine
    networks:
      app_net:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10
@y
services:
  app:
    image: nginx:alpine
    networks:
      app_net:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10
@z

@x
networks:
  app_net:
    ipam:
      driver: default
      config:
        - subnet: "172.16.238.0/24"
        - subnet: "2001:3984:3989::/64"
```
@y
networks:
  app_net:
    ipam:
      driver: default
      config:
        - subnet: "172.16.238.0/24"
        - subnet: "2001:3984:3989::/64"
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
Sets the PID mode to the host PID mode.  This turns on sharing between
container and the host operating system the PID address space.  Containers
launched with this flag can access and manipulate other
containers in the bare-metal machine's namespace and vice versa.
@y
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
Expose ports.
@y
公開用ポートを設定します。
@z

@x
> **Note**
>
> Port mapping is incompatible with `network_mode: host`
@y
> **メモ**
>
> ポートマッピングは`network_mode: host`とは互換性がありません。
@z

@x
> **Note**
>
> `docker-compose run` ignores `ports` unless you include `--service-ports`.
@y
> **メモ**
>
> `docker-compose run`は`--service-ports`を指定しない限り`ports`を無視します。
@z

@x
#### Short syntax
@y
{: #short-syntax }
#### 短い文法
@z

@x
There are three options: 
* Specify both ports (`HOST:CONTAINER`)
* Specify just the container port (an ephemeral host port is chosen for the host port).
* Specify the host IP address to bind to AND both ports (the default is 0.0.0.0, meaning all interfaces): (`IPADDR:HOSTPORT:CONTAINERPORT`). If HOSTPORT is empty (for example `127.0.0.1::80`), an ephemeral port is chosen to bind to on the host.
@y
書き方は 3 通りあります。
* 両方のポートを指定する場合（`HOST:CONTAINER`）
* コンテナー側のポートを指定する場合（ホスト側のポートとしてはエフェメラルなホストポートが設定されます）
* ホストの IP アドレスがバインドされる先と両ポートを指定する場合（デフォルトは 0.0.0.0 であり全インターフェースを意味します）（`IPADDR:HOSTPORT:CONTAINERPORT`）
  HOSTPORT が空の場合（たとえば`127.0.0.1::80`）、ホスト上においてエフェメラルなポートが設定されます。
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
  - "127.0.0.1::5000"
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
  - "127.0.0.1::5000"
  - "6060:6060/udp"
  - "12400-12500:1240"
```
@z

@x
#### Long syntax
@y
{: #long-syntax }
#### 長い文法
@z

@x
The long form syntax allows the configuration of additional fields that can't be
expressed in the short form.
@y
長い文法は追加の設定項目が加えられていて、短い文法では表現できないものです。
@z

@x
- `target`: the port inside the container
- `published`: the publicly exposed port
- `protocol`: the port protocol (`tcp` or `udp`)
- `mode`: `host` for publishing a host port on each node, or `ingress` for a swarm
   mode port to be load balanced.
@y
- `target`: コンテナー内部のポート。
- `published`: 公開ポート。
- `protocol`: ポートプロトコル。（`tcp`または`udp`）
- `mode`: `host`は各ノード向けにホストポートを公開、また`ingress`はロードバランスを行うためのスウォームモードポート。
@z

@x
```yaml
ports:
  - target: 80
    published: 8080
    protocol: tcp
    mode: host
```
@y
```yaml
ports:
  - target: 80
    published: 8080
    protocol: tcp
    mode: host
```
@z

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format.
>
> The long syntax is new in the v3.2 file format.
@y
> ファイルフォーマット[バージョン 3.2](compose-versioning.md#version-32) における追加
>
> 長い文法は v3.2 から導入されました。
@z

@x
### profiles
@y
### profiles
@z

@x
```yaml
profiles: ["frontend", "debug"]
profiles:
  - frontend
  - debug
```
@y
```yaml
profiles: ["frontend", "debug"]
profiles:
  - frontend
  - debug
```
@z

@x
`profiles` defines a list of named profiles for the service to be enabled under.
When not set, the service is _always_ enabled. For the services that make up
your core application you should omit `profiles` so they will always be started.
@y
`profiles`は、名前つきプロファイルに従ってサービスが有効になる、そういったプロファイルの一覧を定義します。
これが設定されていない場合、サービスは **常に** 有効です。
重要なアプリケーションを構成するサービスに対しては、この`profiles`は省略して、常にそのサービスは起動するようにしてください。
@z

@x
Valid profile names follow the regex format `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@y
適正なプロファイル名は、正規表現`[a-zA-Z0-9][a-zA-Z0-9_.-]+`に従うものです。
@z

@x
See also [_Using profiles with Compose_](../profiles.md) to learn more about
profiles.
@y
プロファイルの詳細については [**Compose におけるプロファイル利用**](../profiles.md) も参照してください。
@z

@x
### restart
@y
### restart
@z

@x
`no` is the default [restart policy](../../config/containers/start-containers-automatically.md#use-a-restart-policy), and it does not restart a container under
any circumstance. When `always` is specified, the container always restarts. The
`on-failure` policy restarts a container if the exit code indicates an
on-failure error. `unless-stopped` always restarts a container, except when the
container is stopped (manually or otherwise).
@y
[再起動ポリシー](../../config/containers/start-containers-automatically.md#use-a-restart-policy)（restart policy）のデフォルトは`no`です。
この場合はどういう状況であってもコンテナーは再起動しません。
`always`を指定した場合、コンテナーは常に再起動することになります。
また`on-failure`ポリシーでは、終了コードが on-failure エラーを表わしている場合にコンテナーが再起動します。
`unless-stopped`は、コンテナーが（手動で、あるいは別の原因で）停止する場合を除き、常にコンテナーが再起動します。
@z

@x
    restart: "no"
    restart: always
    restart: on-failure
    restart: unless-stopped
@y
    restart: "no"
    restart: always
    restart: on-failure
    restart: unless-stopped
@z

@x
> Note when using docker stack deploy
>
> The `restart` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md).
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
>Compose ファイルバージョン 3 においてこのオプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
{: .important }
@z

@x
### secrets
@y
### secrets
@z

@x
Grant access to secrets on a per-service basis using the per-service `secrets`
configuration. Two different syntax variants are supported.
@y
各サービスごとの`secrets`設定を用いて、個々のサービスごとに secrets へのアクセスを許可します。
2 つの異なる文法がサポートされています。
@z

@x
> Note when using docker stack deploy
>
> The secret must already exist or be
> [defined in the top-level `secrets` configuration](#secrets-configuration-reference)
> of the compose file, or stack deployment fails.
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> secrets は既に定義済であるか、あるいは [最上位の`secrets`が定義済](#configs-configuration-reference) である必要があります。
> そうでない場合、このファイルによるデプロイが失敗します。
{: .important }
@z

@x
For more information on secrets, see [secrets](../../engine/swarm/secrets.md).
@y
secrets に関する詳細は [secrets](../../engine/swarm/secrets.md) を参照してください。
@z

@x
#### Short syntax
@y
{: #short-syntax }
#### 短い文法
@z

@x
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it at `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@y
短い文法では secret 名を指定することだけができます。
これを行うと、コンテナーが secret にアクセスできるようになり、secret はコンテナー内の`/run/secrets/<secret_name>`にマウントされます。
ソース元となる名前とマウントポイント名は、ともに secret 名となります。
@z

@x
The following example uses the short syntax to grant the `redis` service
access to the `my_secret` and `my_other_secret` secrets. The value of
`my_secret` is set to the contents of the file `./my_secret.txt`, and
`my_other_secret` is defined as an external resource, which means that it has
already been defined in Docker, either by running the `docker secret create`
command or by another stack deployment. If the external secret does not exist,
the stack deployment fails with a `secret not found` error.
@y
以下の例では短い文法を使って、`redis`サービスが 2 つの secret、つまり`my_secret`と`my_other_secret`にアクセスできるようにします。
`my_secret`の値には`./my_secret.txt`ファイルに含まれる内容を設定します。
`my_other_secret`は外部リソースとして定義し、それはつまり Docker において定義済の内容を用います。
これは`docker secret create`コマンドの実行か、あるいは別のスタックデプロイメントにより与えられます。
外部 secret が存在しなかった場合、スタックデプロイメントは失敗し`secret not found`といったエラーが発生します。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:latest
    deploy:
      replicas: 1
    secrets:
      - my_secret
      - my_other_secret
secrets:
  my_secret:
    file: ./my_secret.txt
  my_other_secret:
    external: true
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:latest
    deploy:
      replicas: 1
    secrets:
      - my_secret
      - my_other_secret
secrets:
  my_secret:
    file: ./my_secret.txt
  my_other_secret:
    external: true
```
@z

@x
#### Long syntax
@y
{: #long-syntax }
#### 長い文法
@z

@x
The long syntax provides more granularity in how the secret is created within
the service's task containers.
@y
長い文法ではさらに細かな設定として、サービスタスクのコンテナー内にて secret をどのように生成するかを設定します。
@z

@x
- `source`: The identifier of the secret as it is defined in this configuration.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task containers. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the file within
  `/run/secrets/` in the service's task containers. Both default to `0` if not
  specified.
- `mode`: The permissions for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation. For instance, `0444`
  represents world-readable. The default in Docker 1.13.1 is `0000`, but is
  be `0444` in newer versions. Secrets cannot be writable because they are mounted
  in a temporary filesystem, so if you set the writable bit, it is ignored. The
  executable bit can be set. If you aren't familiar with UNIX file permission
  modes, you may find this
  [permissions calculator](http://permissions-calculator.org/){: target="_blank" rel="noopener" class="_" }
  useful.
@y
- `source`＝ この設定ファイル内において定義される secret の識別子。
- `target`: サービスのタスクコンテナーにおいて`/run/secrets/`にマウントされるファイル名。
  指定されなかった場合のデフォルトは`source`となる。
- `uid`と`gid`: サービスのタスクコンテナーにおいて`/run/secrets/`内のファイルを所有する UID 値と GID 値。

  指定されなかった場合のデフォルトはいずれも`0`。
- `mode`: サービスのタスクコンテナーにおいて`/run/secrets/`にマウントされるファイルのパーミッション。
  8 進数表記。
  たとえば`0444`であればすべて読み込み可。
  Docker 1.13.1 におけるデフォルトは`0000`でしたが、それ以降では`0444`となりました。
  secrets はテンポラリなファイルシステム上にマウントされるため、書き込み可能にはできません。
  したがって書き込みビットを設定しても無視されます。
  実行ビットは設定できます。
  UNIX のファイルパーミッションモードに詳しくない方は、[パーミッション計算機](http://permissions-calculator.org/){: target="_blank" rel="noopener" class="_" } を参照してください。
@z

@x
The following example sets name of the `my_secret` to `redis_secret` within the
container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The `redis` service does not have access to the `my_other_secret`
secret.
@y
以下の例では`my_secret`という名前の secret を、コンテナー内では`redis_secret`として設定します。
そしてモードを `0440`（グループが読み込み可能）とし、ユーザーとグループは`103`とします。
`redis`サービスは`my_other_secret`へはアクセスしません。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:latest
    deploy:
      replicas: 1
    secrets:
      - source: my_secret
        target: redis_secret
        uid: '103'
        gid: '103'
        mode: 0440
secrets:
  my_secret:
    file: ./my_secret.txt
  my_other_secret:
    external: true
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  redis:
    image: redis:latest
    deploy:
      replicas: 1
    secrets:
      - source: my_secret
        target: redis_secret
        uid: '103'
        gid: '103'
        mode: 0440
secrets:
  my_secret:
    file: ./my_secret.txt
  my_other_secret:
    external: true
```
@z

@x
You can grant a service access to multiple secrets and you can mix long and
short syntax. Defining a secret does not imply granting a service access to it.
@y
1 つのサービスが複数の secrets にアクセスする設定とすることもできます。
また短い文法、長い文法を混在することも可能です。
secret を定義しただけでは、サービスに対して secret へのアクセスを許可するものにはなりません。
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
> Note when using docker stack deploy
>
> The `security_opt` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md).
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> `security_opt`オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
{: .important }
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
### sysctls
@y
### sysctls
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
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to
[configure namespaced kernel parameters (sysctls) at runtime](../../engine/reference/commandline/run.md#configure-namespaced-kernel-parameters-sysctls-at-runtime).
@y
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to
[configure namespaced kernel parameters (sysctls) at runtime](../../engine/reference/commandline/run.md#configure-namespaced-kernel-parameters-sysctls-at-runtime).
@z

@x
> Note when using docker stack deploy
>
> This option requires Docker Engine 19.03 or up when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md).
@y
> docker のスタックデプロイ時のメモ
>
> このオプションを [スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) において用いるには Docker Engine 19.03 以降が必要です。
@z

@x
### tmpfs
@y
### tmpfs
@z

@x
> Added in [version 3.6](compose-versioning.md#version-36) file format.
@y
> ファイルフォーマット[バージョン 3.6](compose-versioning.md#version-36) における追加
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
@y
```yaml
tmpfs: /run
```
@z

@x
```yaml
tmpfs:
  - /run
  - /tmp
```
@y
```yaml
tmpfs:
  - /run
  - /tmp
```
@z

@x
> Note when using docker stack deploy
>
> This option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md)
> with a (version 3-3.5) Compose file.
@y
> docker のスタックデプロイ時のメモ
>
> Compose ファイルバージョン 3 ～ 3.5 においてこのオプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
@z

@x
Mount a temporary file system inside the container. Size parameter specifies the size
of the tmpfs mount in bytes. Unlimited by default.
@y
コンテナー内部にてテンポラリファイルシステムをマウントします。
size パラメーターは tmpfs マウントのサイズをバイト単位で指定します。
デフォルトは無制限です。
@z

@x
```yaml
- type: tmpfs
  target: /app
  tmpfs:
    size: 1000
```
@y
```yaml
- type: tmpfs
  target: /app
  tmpfs:
    size: 1000
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
> Note when using docker stack deploy
>
> The `userns_mode` option is ignored when
> [deploying a stack in swarm mode](../../engine/reference/commandline/stack_deploy.md).
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> `userns_mode`オプションは、[スウォームモードでのスタックのデプロイ](../../engine/reference/commandline/stack_deploy.md) を行う場合には無視されます。
{: .important }
@z

@x
### volumes
@y
### volumes
@z

@x
Mount host paths or named volumes, specified as sub-options to a service.
@y
マウントホストパスや名前つきボリュームを、サービスに対するサブオプションとして指定します。
@z

@x
You can mount a host path as part of a definition for a single service, and
there is no need to define it in the top level `volumes` key.
@y
ホストパスのマウントは、単一サービスの定義の一部として行うことができます。
これは最上位の`volumes`キーにて定義する必要はありません。
@z

@x
But, if you want to reuse a volume across multiple services, then define a named
volume in the [top-level `volumes` key](#volume-configuration-reference). Use
named volumes with [services, swarms, and stack
files](#volumes-for-services-swarms-and-stack-files).
@y
ただし複数のサービスにわたってボリュームを再利用したい場合は、[最上位の`volumes`キー](#volume-configuration-reference) において名前つきボリュームを定義してください。
名前つきボリュームは [サービス、スウォーム、スタックファイル](#volumes-for-services-swarms-and-stack-files) において用いられます。
@z

@x
> Changed in [version 3](compose-versioning.md#version-3) file format.
>
> The top-level [volumes](#volume-configuration-reference) key defines
> a named volume and references it from each service's `volumes` list. This
> replaces `volumes_from` in earlier versions of the Compose file format.
@y
> ファイルフォーマット[バージョン 3](compose-versioning.md#version-3) における変更
>
> 最上位の [volumes](#volume-configuration-reference) キーは名前つきボリュームを定義し、各サービスの`volumes`リストからこれを参照します。
> これは Compose ファイルフォーマットのかつてのバージョンにおける`volumes_from`に置き換わるものです。
@z

@x
This example shows a named volume (`mydata`) being used by the `web` service,
and a bind mount defined for a single service (first path under `db` service
`volumes`). The `db` service also uses a named volume called `dbdata` (second
path under `db` service `volumes`), but defines it using the old string format
for mounting a named volume. Named volumes must be listed under the top-level
`volumes` key, as shown.
@y
以下の例では名前つきボリューム（`mydata`）が`web`サービスにおいて利用されています。
またバインドマウントが単一のサービス（`db`サービスの`volumes`にある最初のパス）に対して定義されています。
`db`サービスはさらに`dbdata`という名前つきボリュームを利用しています（`db`サービスの`volumes`の 2 つめのパス）が、その定義の仕方は、名前つきボリュームをマウントする古い文字列書式を使っています。
名前つきボリュームは以下に示しているように、最上位の`volumes`キーのもとに列記されていなければなりません。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: nginx:alpine
    volumes:
      - type: volume
        source: mydata
        target: /data
        volume:
          nocopy: true
      - type: bind
        source: ./static
        target: /opt/app/static
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: nginx:alpine
    volumes:
      - type: volume
        source: mydata
        target: /data
        volume:
          nocopy: true
      - type: bind
        source: ./static
        target: /opt/app/static
@z

@x
  db:
    image: postgres:latest
    volumes:
      - "/var/run/postgres/postgres.sock:/var/run/postgres/postgres.sock"
      - "dbdata:/var/lib/postgresql/data"
@y
  db:
    image: postgres:latest
    volumes:
      - "/var/run/postgres/postgres.sock:/var/run/postgres/postgres.sock"
      - "dbdata:/var/lib/postgresql/data"
@z

@x
volumes:
  mydata:
  dbdata:
```
@y
volumes:
  mydata:
  dbdata:
```
@z

@x
> **Note**
> 
> For general information on volumes, refer to the [use volumes](../../storage/volumes.md)
> and [volume plugins](/engine/extend/plugins_volume/) sections in the documentation.
@y
> **メモ**
>
> ボリュームに関する一般的な情報については [ボリュームの利用](../../storage/volumes.md) や [ボリュームプラグイン](/engine/extend/plugins_volume/) を参照してください。
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
短い文法は一般に`[SOURCE:]TARGET[:MODE]`という書式になります。
ここで`SOURCE`はホストパスまたはボリューム名を指定します。
`TARGET`はボリュームがマウントされているコンテナーのパスです。
標準モードには読み込み専用`ro`と読み書き可能`rw`（デフォルト）があります。
@z

%@x
%Optionally specify a path on the host machine
%(`HOST:CONTAINER`), or an access mode (`HOST:CONTAINER:ro`).
%@y
%設定方法として、ホストマシンのパスを指定する方法（`HOST:CONTAINER`）や、さらにアクセスモードを指定する方法（`HOST:CONTAINER:ro`）があります。
%@z

@x
You can mount a relative path on the host, which expands relative to
the directory of the Compose configuration file being used. Relative paths
should always begin with `.` or `..`.
@y
ホスト上の相対パスをマウントすることができます。
これは、用いられている Compose 設定ファイルのディレクトリからの相対パスとして展開されます。
相対パスは`.`または`..`で書き始める必要があります。
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
#### Long syntax
@y
{: #long-syntax }
#### 長い文法
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
- `type`: マウントタイプを表わす`volume`、`bind`、`tmpfs`、`npipe`のいずれかを指定します。
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
version: "{{ site.compose_file_v3 }}"
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
@y
```yaml
version: "{{ site.compose_file_v3 }}"
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
@z

@x
networks:
  webnet:
@y
networks:
  webnet:
@z

@x
volumes:
  mydata:
```
@y
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
> **メモ**
>
> バインドマウントを生成するにあたって長い文法を用いるのであれば、参照するパスはあらかじめ生成しておく必要があります。
> 短い文法であれば、そのパスが存在いていなかった場合には生成されます。
> 詳しくは [バインドマウント](../../storage/bind-mounts.md#differences-between--v-and---mount-behavior) を参照してください。
@z

@x
#### Volumes for services, swarms, and stack files
@y
{: #volumes-for-services-swarms-and-stack-files }
#### サービス、スウォーム、スタックファイルに対するボリューム設定
@z

@x
> Note when using docker stack deploy
>
> When working with services, swarms, and `docker-stack.yml` files, keep in mind
> that the tasks (containers) backing a service can be deployed on any node in a
> swarm, and this may be a different node each time the service is updated.
@y
> docker のスタックデプロイ時のメモ
>
> サービス、スウォーム、`docker-stack.yml`ファイルを扱っている際には気をつけておくべきことがあります。
> サービスのもとにあるタスク（コンテナー）はスォーム内のどのノードにでもデプロイされます。
> サービスは毎回、異なるノードとなり得るということです。
@z

@x
In the absence of having named volumes with specified sources, Docker creates an
anonymous volume for each task backing a service. Anonymous volumes do not
persist after the associated containers are removed.
@y
ボリュームに名前をつけずに利用したとすると、Docker はサービスのもとにある各タスクに対して、名前のない匿名のボリュームを生成します。
匿名ボリュームは、関連コンテナーが削除された後は持続されません。
@z

@x
If you want your data to persist, use a named volume and a volume driver that
is multi-host aware, so that the data is accessible from any node. Or, set
constraints on the service so that its tasks are deployed on a node that has the
volume present.
@y
データを維持しておきたい場合は、名前つきボリュームを設定し、複数ホストに対応したボリュームドライバーを利用してください。
そうすればデータはどのノードからでもアクセスできます。
あるいはサービスに対する指定として、ボリュームが存在しているノードへタスクをデプロイするようにしてください。
@z

@x
As an example, the `docker-stack.yml` file for the
[votingapp sample in Docker Labs](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md)
defines a service called `db` that runs a `postgres` database. It is configured
as a named volume to persist the data on the swarm, _and_ is constrained to run
only on `manager` nodes. Here is the relevant snip-it from that file:
@y
例として [Docker Labs にある投票アプリ](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md) では、`docker-stack.yml`にて`postgres`データベースを起動する`db`サービスが定義されています。
そして名前つきボリュームを設定して、スウォーム内のデータを失わないようにしています。
**さらに**それは`manager`ノードでのみ稼動するように限定しています。
以下は該当するファイル部分の抜粋です。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  db:
    image: postgres:9.4
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - backend
    deploy:
      placement:
        constraints: [node.role == manager]
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  db:
    image: postgres:9.4
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      - backend
    deploy:
      placement:
        constraints: [node.role == manager]
```
@z

@x
### domainname, hostname, ipc, mac\_address, privileged, read\_only, shm\_size, stdin\_open, tty, user, working\_dir
@y
### domainname, hostname, ipc, mac\_address, privileged, read\_only, shm\_size, stdin\_open, tty, user, working\_dir
@z

@x
Each of these is a single value, analogous to its
[docker run](../../engine/reference/run.md) counterpart. Note that `mac_address` is a legacy option.
@y
ここに示すオプションはいずれも、値 1 つを設定するものであり、[docker run](../../engine/reference/run.md) のオプションに対応づいています。
なお`mac_address`は古くなったオプションです。
@z

@x
```yaml
user: postgresql
working_dir: /code
@y
```yaml
user: postgresql
working_dir: /code
@z

@x
domainname: foo.com
hostname: foo
ipc: host
mac_address: 02:42:ac:11:65:43
@y
domainname: foo.com
hostname: foo
ipc: host
mac_address: 02:42:ac:11:65:43
@z

@x
privileged: true
@y
privileged: true
@z

@x
read_only: true
shm_size: 64M
stdin_open: true
tty: true
```
@y
read_only: true
shm_size: 64M
stdin_open: true
tty: true
```
@z

@x
## Specifying durations
@y
{: #specifying-durations }
## 時間の指定
@z

@x
Some configuration options, such as the `interval` and `timeout` sub-options for
[`check`](#healthcheck), accept a duration as a string in a
format that looks like this:
@y
[`check`](#healthcheck) のサブオプション`interval`、`timeout`のように、時間を設定するオプションがあります。
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
Some configuration options, such as the `shm_size` sub-option for
[`build`](#build), accept a byte value as a string in a format
that looks like this:
@y
[`build`](#build) のサブオプション`shm_size`のようにバイト値を設定するオプションがあります。
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
サービスの宣言の一部として、一時的に [ボリューム](#volumes) を宣言することが可能ですが、このセクションでは（`volumes_from`を利用せずに）マルチサービスにわたって再利用可能な名前つきボリュームの生成方法を説明します。
またこのボリュームは docker コマンドラインや API を使って簡単に抽出したり確認したりすることができます。
詳しくは [docker volume](../../engine/reference/commandline/volume_create.md) のサブコマンドを確認してください。
@z

@x
See [use volumes](../../storage/volumes.md) and [volume
plugins](/engine/extend/plugins_volume/) for general information on volumes.
@y
ボリュームに関する一般的な情報については [ボリュームの利用](../../storage/volumes.md) や [ボリュームプラグイン](/engine/extend/plugins_volume/) を参照してください。
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
version: "{{ site.compose_file_v3 }}"
@y
```yaml
version: "{{ site.compose_file_v3 }}"
@z

@x
services:
  db:
    image: db
    volumes:
      - data-volume:/var/lib/db
  backup:
    image: backup-service
    volumes:
      - data-volume:/var/lib/backup/data
@y
services:
  db:
    image: db
    volumes:
      - data-volume:/var/lib/db
  backup:
    image: backup-service
    volumes:
      - data-volume:/var/lib/backup/data
@z

@x
volumes:
  data-volume:
```
@y
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
For version 3.3 and below of the format, `external` cannot be used in
conjunction with other volume configuration keys (`driver`, `driver_opts`,
`labels`). This limitation no longer exists for
[version 3.4](compose-versioning.md#version-34) and above.
@y
バージョン 3.3 およびそれ以前にて、`external`は他のボリューム設定キー（`driver`, `driver_opts`, `labels`）と同時に用いることはできませんでした。
この制約は [バージョン 3.4](compose-versioning.md#version-34) 以降においてはなくなりました。
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
version: "{{ site.compose_file_v3 }}"
@y
```yaml
version: "{{ site.compose_file_v3 }}"
@z

@x
services:
  db:
    image: postgres
    volumes:
      - data:/var/lib/postgresql/data
@y
services:
  db:
    image: postgres
    volumes:
      - data:/var/lib/postgresql/data
@z

@x
volumes:
  data:
    external: true
```
@y
volumes:
  data:
    external: true
```
@z

@x
> Deprecated in [version 3.4](compose-versioning.md#version-34) file format.
>
> external.name was deprecated in version 3.4 file format use `name` instead.
{: .important }
@y
> ファイルフォーマット[バージョン 3.4](compose-versioning.md#version-34) において非推奨
>
> ファイルフォーマットバージョン 3.4 において external.name は廃止予定となりました。
> 代わりに`name`を用いてください。
{: .important }
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
> Note when using docker stack deploy
>
> External volumes that do not exist _are created_ if you use [docker stack deploy](#deploy) 
> to launch the app in [swarm mode](../../engine/swarm/index.md) (instead of
> [docker compose up](../reference/up.md)). In swarm mode, a volume is
> automatically created when it is defined by a service. As service tasks are
> scheduled on new nodes, [swarmkit](https://github.com/docker/swarmkit/blob/master/README.md)
> creates the volume on the local node. To learn more, see [moby/moby#29976](https://github.com/moby/moby/issues/29976).
{: .important }
@y
> docker のスタックデプロイ時のメモ
>
> external ボリュームが存在しない場合に、[docker stack deploy](#deploy) を実行してアプリを [スウォームモード](../../engine/swarm/index.md) 内に導入すると、ボリュームが**生成されます**。
> （[docker compose up](../reference/up.md) とは異なります。）
> スウォームモードにおいて、サービスとして定義されているボリュームは自動生成されます。
> サービスタスクは新たなノード上においてスケジューリングされるので、[swarmkit](https://github.com/docker/swarmkit/blob/master/README.md) がローカルノード上にボリュームを生成します。
> 詳しくは [moby/moby#29976](https://github.com/moby/moby/issues/29976) を参照してください。
@z

@x
### labels
@y
### labels
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
> Added in [version 3.4](compose-versioning.md#version-34) file format.
@y
> ファイルフォーマット[バージョン 3.4](compose-versioning.md#version-34) における追加
@z

@x
Set a custom name for this volume. The name field can be used to reference
volumes that contain special characters. The name is used as is
and will **not** be scoped with the stack name.
@y
ボリュームに対して独自の名前を設定します。
name は、特殊文字を含むボリュームを参照する際に用いることができます。
name は記述されたとおりに用いられ、スタック名によるスコープは**行われません**。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
volumes:
  data:
    name: my-app-data
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
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
version: "{{ site.compose_file_v3 }}"
volumes:
  data:
    external: true
    name: my-app-data
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
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
The top-level `networks` key lets you specify networks to be created.
@y
最上位の`networks`キーは、生成するネットワークを指定します。
@z

@x
* For a full explanation of Compose's use of Docker networking features and all
  network driver options, see the [Networking guide](../networking.md).
@y
* Compose が利用する Docker ネットワーク機能やネットワークドライバーのオプションに関して、詳細は [ネットワークガイド](../networking.md) を参照してください。
@z

@x
* For [Docker Labs](https://github.com/docker/labs/blob/master/README.md)
  tutorials on networking, start with [Designing Scalable, Portable Docker Container Networks](https://github.com/docker/labs/blob/master/networking/README.md)
@y
* [Docker Labs](https://github.com/docker/labs/blob/master/README.md) にあるネットワークのチュートリアルとして、[Designing Scalable, Portable Docker Container Networks](https://github.com/docker/labs/blob/master/networking/README.md) を試してみてください。
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
たいていの場合、単一ホストであれば `bridge`、スウォーム上では`overlay`になります。
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
#### bridge
@y
#### bridge
@z

@x
Docker defaults to using a `bridge` network on a single host. For examples of
how to work with bridge networks, see the Docker Labs tutorial on
[Bridge networking](https://github.com/docker/labs/blob/master/networking/A2-bridge-networking.md).
@y
単一ホストの場合、Docker はデフォルトとして`bridge`ネットワークを利用します。
bridge ネットワークがどのように動作するかは、Docker Labs のチュートリアルである [ブリッジネットワーク](https://github.com/docker/labs/blob/master/networking/A2-bridge-networking.md) の例を参照してください。
@z

@x
#### overlay
@y
#### overlay
@z

@x
The `overlay` driver creates a named network across multiple nodes in a
[swarm](../../engine/swarm/index.md).
@y
`overlay`ドライバーは、[スウォーム](../../engine/swarm/index.md) 内での複数ノードにわたって、名前づけされたネットワークを生成します。
@z

@x
* For a working example of how to build and use an
`overlay` network with a service in swarm mode, see the Docker Labs tutorial on
[Overlay networking and service discovery](https://github.com/docker/labs/blob/master/networking/A3-overlay-networking.md).
@y
* スウォームモードにて`overlay`ネットワークによるサービスを構築し利用する例として、Docker Labs のチュートリアル [Overlay networking and service discovery](https://github.com/docker/labs/blob/master/networking/A3-overlay-networking.md) を参照してください。
@z

@x
* For an in-depth look at how it works under the hood, see the
networking concepts lab on the
[Overlay Driver Network Architecture](https://github.com/docker/labs/blob/master/networking/concepts/06-overlay-networks.md).
@y
* さらに詳しく内部動作を知るためには、networking concepts lab にある [Overlay Driver Network
Architecture](https://github.com/docker/labs/blob/master/networking/concepts/06-overlay-networks.md) を参照してください。
@z

@x
#### host or none
@y
{: #host-or-none }
#### host または none
@z

@x
Use the host's networking stack, or no networking. Equivalent to
`docker run --net=host` or `docker run --net=none`. Only used if you use
`docker stack` commands. If you use the `docker-compose` command,
use [network_mode](#network_mode) instead.
@y
ホストのネットワークスタックを利用する場合、あるいはネットワークを利用しない場合に指定します。
`docker run --net=host`あるいは`docker run --net=none`を実行することと同じです。
`docker stack`コマンドを用いる場合にのみ利用します。
`docker-compose`コマンドを用いる場合は、これではなく [network_mode](#network_mode) を利用してください。
@z

@x
If you want to use a particular network on a common build, use [network] as
mentioned in the second yaml file example.
@y
通常のビルドではあるものの、ネットワークには特定のものを利用したい場合は、2 つめの yaml ファイル例に示しているように [network](#network) を利用してください。
@z

@x
The syntax for using built-in networks such as `host` and `none` is a little
different. Define an external network with the name `host` or `none` (that
Docker has already created automatically) and an alias that Compose can use
(`hostnet` or `nonet` in the following examples), then grant the service access to that
network using the alias.
@y
`host`や`none`のようにビルトインネットワークを利用する場合の文法は、少々違います。
外部ネットワークを定義する場合は`host`や`none`（Docker ではすでに自動的に生成済）を用い、また Compose が利用可能なエイリアス（以下の例における`hostnet`や`nonet`）を定義してください。
そしてサービスが、そのエイリアスを使ってネットワークにアクセスできるようにしてください。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    networks:
      hostnet: {}
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    networks:
      hostnet: {}
@z

@x
networks:
  hostnet:
    external: true
    name: host
```
@y
networks:
  hostnet:
    external: true
    name: host
```
@z

@x
```yaml
services:
  web:
    ...
    build:
      ...
      network: host
      context: .
      ...
```
@y
```yaml
services:
  web:
    ...
    build:
      ...
      network: host
      context: .
      ...
```
@z

@x
```yaml
services:
  web:
    ...
    networks:
      nonet: {}
@y
```yaml
services:
  web:
    ...
    networks:
      nonet: {}
@z

@x
networks:
  nonet:
    external: true
    name: none
```
@y
networks:
  nonet:
    external: true
    name: none
```
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
このネットワークが利用するドライバーに対して、受け渡したいオプションをキーバリューペアのリストとして設定します。
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
### attachable
@y
### attachable
@z

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format.
@y
> ファイルフォーマット[バージョン 3.2](compose-versioning.md#version-32) における追加
@z

@x
Only used when the `driver` is set to `overlay`. If set to `true`, then
standalone containers can attach to this network, in addition to services. If a
standalone container attaches to an overlay network, it can communicate with
services and standalone containers that are also attached to the overlay
network from other Docker daemons.
@y
`driver`が`overlay`に設定されている場合にのみ用います。
これが`true`に設定されている場合、スタンドアロンのコンテナーがネットワークに、そしてサービスにアタッチされます。
スタンドアロンのコンテナーが overlay ネットワークにアタッチしていると、サービス間での通信が可能になります。
さらに他の Docker デーモンにより overlay ネットワークが構成されている場合に、そこにアタッチされたスタンドアロンコンテナーとも通信が可能になります。
@z

@x
```yaml
networks:
  mynet1:
    driver: overlay
    attachable: true
```
@y
```yaml
networks:
  mynet1:
    driver: overlay
    attachable: true
```
@z

@x
### enable_ipv6
@y
### enable_ipv6
@z

@x
Enable IPv6 networking on this network.
@y
現在のネットワークにおいて IPv6 ネットワークを有効にします。
@z

@x
> Not supported in Compose File version 3
>
> `enable_ipv6` requires you to use a version 2 Compose file, as this directive
> is not yet supported in Swarm mode.
{: .warning }
@y
> Compose ファイルバージョン 3 ではサポートされません。
>
> `enable_ipv6`は Compose ファイルバージョン 2 を必要とします。
> したがってこのディレクティブはまだ、スウォームモードに対してはサポートされていません。
{: .warning }
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
@y
-   `driver`: デフォルトではない独自の IPAM ドライバーを指定します。
-   `config`: 設定ブロックを指定します。要素数はゼロでも複数でも可です。
    以下のキーを用いることができます。
    - `subnet`: ネットワークセグメントを表わす CIDR 形式のサブネットを指定します。
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
```
@y
```yaml
ipam:
  driver: default
  config:
    - subnet: 172.28.0.0/16
```
@z

@x
> **Note**
>
> Additional IPAM configurations, such as `gateway`, are only honored for version 2 at the moment.
@y
> **メモ**
>
> `gateway`のような設定キーは、現時点ではバージョン 2 においてのみ利用できます。
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
For version 3.3 and below of the format, `external` cannot be used in
conjunction with other network configuration keys (`driver`, `driver_opts`,
`ipam`, `internal`). This limitation no longer exists for
[version 3.4](compose-versioning.md#version-34) and above.
@y
バージョン 3.3 およびそれ以前にて、`external`は他のボリューム設定キー（`driver`、`driver_opts`、`ipam`、`internal`）と同時に用いることはできませんでした。
この制約は [バージョン 3.4](compose-versioning.md#version-34) 以降においてはなくなりました。
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
version: "{{ site.compose_file_v3 }}"
@y
```yaml
version: "{{ site.compose_file_v3 }}"
@z

@x
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
@y
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
@z

@x
networks:
  outside:
    external: true
```
@y
networks:
  outside:
    external: true
```
@z

@x
> Deprecated in [version 3.5](compose-versioning.md#version-35) file format.
>
> external.name was deprecated in version 3.5 file format use `name` instead.
{: .important }
@y
> ファイルフォーマット[バージョン 3.5](compose-versioning.md#version-35) において非推奨
>
> バージョン 3.5 において external.name は廃止予定となりました。
> 代わりに`name`を用いてください。
{: .important }
@z

@x
You can also specify the name of the network separately from the name used to
refer to it within the Compose file:
@y
ネットワーク名として指定する名前は、Compose ファイル内で参照されている名前以外でも指定することができます。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
networks:
  outside:
    external:
      name: actual-name-of-network
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
networks:
  outside:
    external:
      name: actual-name-of-network
```
@z

@x
### name
@y
### name
@z

@x
> Added in [version 3.5](compose-versioning.md#version-35) file format.
@y
> ファイルフォーマット[バージョン 3.5](compose-versioning.md#version-35) における追加
@z

@x
Set a custom name for this network. The name field can be used to reference
networks which contain special characters. The name is used as is
and will **not** be scoped with the stack name.
@y
ネットワークに対して独自の名前を設定します。
name は、特殊文字を含むネットワークを参照する際に用いることができます。
name は記述されたとおりに用いられ、スタック名によるスコープは**行われません**。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
networks:
  network1:
    name: my-app-net
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
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
version: "{{ site.compose_file_v3 }}"
networks:
  network1:
    external: true
    name: my-app-net
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
networks:
  network1:
    external: true
    name: my-app-net
```
@z

@x
## configs configuration reference
@y
{: #configs-configuration-reference }
## configs 設定リファレンス
@z

@x
The top-level `configs` declaration defines or references
[configs](../../engine/swarm/configs.md) that can be granted to the services in
this stack. The source of the config is either `file` or `external`.
@y
最上位の`configs`の宣言では、このスタックファイル内のサービスに対して適用する [configs](../../engine/swarm/configs.md) を定義し参照します。
config の値となるのは`file`か`external`です。
@z

@x
- `file`: The config is created with the contents of the file at the specified
  path.
- `external`: If set to true, specifies that this config has already been
  created. Docker does not attempt to create it, and if it does not exist, a
  `config not found` error occurs.
- `name`: The name of the config object in Docker. This field can be used to
  reference configs that contain special characters. The name is used as is
  and will **not** be scoped with the stack name. Introduced in version 3.5
  file format.
- `driver` and `driver_opts`: The name of a custom secret driver, and driver-specific
  options passed as key/value pairs. Introduced in version 3.8 file format, and
  only supported when using `docker stack`.
- `template_driver`: The name of the templating driver to use, which controls
  whether and how to evaluate the secret payload as a template. If no driver
  is set, no templating is used. The only driver currently supported is `golang`,
  which uses a `golang`. Introduced in version 3.8 file format, and only supported
  when using `docker stack`. Refer to [use a templated config](../../engine/swarm/configs.md#example-use-a-templated-config)
  for a examples of templated configs.
@y
- `file`: config は、指定されたパスにあるファイルの内容に従って生成されます。
- `external`: true に設定されている場合、config がすでに定義済であることを設定します。
  Dockder はこれを生成しないようになりますが、config が存在しなければ`config not found`というエラーが発生します。
- `name`: Docker における config オブジェクト名を設定します。
  この設定は、特殊文字を含む config を参照する際に用いることができます。
  name はそのまま用いられ、スタック名によるスコープは**行われません**。
  これはファイルフォーマットバージョン 3.5 において導入されたものです。
- `driver` and `driver_opts`: The name of a custom secret driver, and driver-specific
  options passed as key/value pairs. Introduced in version 3.8 file format, and
  only supported when using `docker stack`.
- `template_driver`: The name of the templating driver to use, which controls
  whether and how to evaluate the secret payload as a template. If no driver
  is set, no templating is used. The only driver currently supported is `golang`,
  which uses a `golang`. Introduced in version 3.8 file format, and only supported
  when using `docker stack`. Refer to [use a templated config](../../engine/swarm/configs.md#example-use-a-templated-config)
  for a examples of templated configs.
@z

@x
In this example, `my_first_config` is created (as
`<stack_name>_my_first_config)`when the stack is deployed,
and `my_second_config` already exists in Docker.
@y
以下の例においては、スタックがデプロイされる際に（`<stack_name>_my_first_config`として）`my_first_config`が生成されます。
また`my_second_config`は Docker にすでに定義済のものです。
@z

@x
```yaml
configs:
  my_first_config:
    file: ./config_data
  my_second_config:
    external: true
```
@y
```yaml
configs:
  my_first_config:
    file: ./config_data
  my_second_config:
    external: true
```
@z

@x
Another variant for external configs is when the name of the config in Docker
is different from the name that exists within the service. The following
example modifies the previous one to use the external config called
`redis_config`.
@y
別の状況として、外部にある config を参照する際に、Docker における config 名と、サービス内にある config 名が異なる場合があります。
以下は、前の例における config を、外部に定義されている`redis_config`というものに変更した例です。
@z

@x
```yaml
configs:
  my_first_config:
    file: ./config_data
  my_second_config:
    external:
      name: redis_config
```
@y
```yaml
configs:
  my_first_config:
    file: ./config_data
  my_second_config:
    external:
      name: redis_config
```
@z

@x
You still need to [grant access to the config](#configs) to each service in the
stack.
@y
スタック内の各サービスに対しては、[config へのアクセス許可](#configs) を行う必要があります。
@z

@x
## secrets configuration reference
@y
{: #secrets-configuration-reference }
## secrets 設定リファレンス
@z

@x
The top-level `secrets` declaration defines or references
[secrets](../../engine/swarm/secrets.md) that can be granted to the services in
this stack. The source of the secret is either `file` or `external`.
@y
最上位の`secrets`の宣言では、このスタックファイル内のサービスに対して適用する [secrets](../../engine/swarm/secrets.md) を定義し参照します。
secret の値となるのは`file`か`external`です。
@z

@x
- `file`: The secret is created with the contents of the file at the specified
  path.
- `external`: If set to true, specifies that this secret has already been
  created. Docker does not attempt to create it, and if it does not exist, a
  `secret not found` error occurs.
- `name`: The name of the secret object in Docker. This field can be used to
  reference secrets that contain special characters. The name is used as is
  and will **not** be scoped with the stack name. Introduced in version 3.5
  file format.
- `template_driver`: The name of the templating driver to use, which controls
  whether and how to evaluate the secret payload as a template. If no driver
  is set, no templating is used. The only driver currently supported is `golang`,
  which uses a `golang`. Introduced in version 3.8 file format, and only
  supported when using `docker stack`.
@y
- `file`: secret は、指定されたパスにあるファイルの内容に従って生成されます。
- `external`: true に設定されている場合、secret がすでに定義済であることを設定します。
  Dockder はこれを生成しないようになりますが、secret が存在しなければ`secret not found`というエラーが発生します。
- `name`: Docker における secret オブジェクト名を設定します。
  この設定は、特殊文字を含む secret を参照する際に用いることができます。
  name はそのまま用いられ、スタック名によるスコープは**行われません**。
  これはファイルフォーマットバージョン 3.5 において導入されたものです。
- `template_driver`: The name of the templating driver to use, which controls
  whether and how to evaluate the secret payload as a template. If no driver
  is set, no templating is used. The only driver currently supported is `golang`,
  which uses a `golang`. Introduced in version 3.8 file format, and only
  supported when using `docker stack`.
@z

@x
In this example, `my_first_secret` is created as
`<stack_name>_my_first_secret `when the stack is deployed,
and `my_second_secret` already exists in Docker.
@y
以下の例においては、スタックがデプロイされる際に（`<stack_name>_my_first_secret`として）`my_first_secret`が生成されます。
また`my_second_secret`は Docker にすでに定義済のものです。
@z

@x
```yaml
secrets:
  my_first_secret:
    file: ./secret_data
  my_second_secret:
    external: true
```
@y
```yaml
secrets:
  my_first_secret:
    file: ./secret_data
  my_second_secret:
    external: true
```
@z

@x
Another variant for external secrets is when the name of the secret in Docker
is different from the name that exists within the service. The following
example modifies the previous one to use the external secret called
`redis_secret`.
@y
別の状況として、外部にある secret を参照する際に、Docker における secret 名と、サービス内にある secret 名が異なる場合があります。
以下は、前の例における secret を、外部に定義されている`redis_secret`というものに変更した例です。
@z

@x
### Compose File v3.5 and above
@y
{: #compose-file-v35-and-above }
### Compose ファイル v3.5 またはそれ以降の場合
@z

@x
```yaml
secrets:
  my_first_secret:
    file: ./secret_data
  my_second_secret:
    external: true
    name: redis_secret
```
@y
```yaml
secrets:
  my_first_secret:
    file: ./secret_data
  my_second_secret:
    external: true
    name: redis_secret
```
@z

@x
### Compose File v3.4 and under
@y
{: #compose-file-v34-and-under }
### Compose File v3.4 and under
@z

@x
```yaml
  my_second_secret:
    external:
      name: redis_secret
```
@y
```yaml
  my_second_secret:
    external:
      name: redis_secret
```
@z

@x
You still need to [grant access to the secrets](#secrets) to each service in the
stack.
@y
スタック内の各サービスに対しては、[secret へのアクセス許可](#secrets) を行う必要があります。
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
> Added in [version 3.4](compose-versioning.md#version-34) file format.
@y
> ファイルフォーマット[バージョン 3.4](compose-versioning.md#version-34) における追加
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
- [ユーザーガイド](/compose/index.md)
- [Compose のインストール](/compose/install.md)
- [Compose ファイルのバージョンとアップグレード](compose-versioning.md)
- [Compose を使ったサンプルアプリ](../samples-for-compose.md)
- [コマンドラインリファレンス](../reference/index.md)
@z
