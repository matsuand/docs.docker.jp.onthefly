%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Store configuration data using Docker Configs
description: How to store configuration data separate from the runtime
keywords: swarm, configuration, configs
---
@y
---
title: Docker configs を利用した設定データの保存
description: How to store configuration data separate from the runtime
keywords: swarm, configuration, configs
---
@z

@x
## About configs
@y
{% comment %}
## About configs
{% endcomment %}
{: #about-configs }
## configs について
@z

@x
Docker 17.06 introduces swarm service configs, which allow you to store
non-sensitive information, such as configuration files, outside a service's
image or running containers. This allows you to keep your images as generic
as possible, without the need to bind-mount configuration files into the
containers or use environment variables.
@y
{% comment %}
Docker 17.06 introduces swarm service configs, which allow you to store
non-sensitive information, such as configuration files, outside a service's
image or running containers. This allows you to keep your images as generic
as possible, without the need to bind-mount configuration files into the
containers or use environment variables.
{% endcomment %}
Docker 17.06 からスウォームサービスの configs が導入されました。
これは設定ファイルのようにそれほど重要ではない情報を、サービスイメージや稼働中のコンテナーの外部に保存できる機能です。
これがあれば、ビルドイメージをできるだけ汎用的なものとして維持できます。
また設定ファイルをコンテナーにバインドマウントしたり、環境変数を利用したりすることも不要になります。
@z

@x
Configs operate in a similar way to [secrets](secrets.md), except that they are
not encrypted at rest and are mounted directly into the container's filesystem
without the use of RAM disks. Configs can be added or removed from a service at
any time, and services can share a config. You can even use configs in
conjunction with environment variables or labels, for maximum flexibility.
Config values can be generic strings or binary content (up to 500 kb in size).
@y
{% comment %}
Configs operate in a similar way to [secrets](secrets.md), except that they are
not encrypted at rest and are mounted directly into the container's filesystem
without the use of RAM disks. Configs can be added or removed from a service at
any time, and services can share a config. You can even use configs in
conjunction with environment variables or labels, for maximum flexibility.
Config values can be generic strings or binary content (up to 500 kb in size).
{% endcomment %}
configs は [secrets](secrets.md) と同じように機能します。
ただし configs は保存の際に暗号化はされません。
またコンテナーのファイルシステム内に直接マウントされますが、RAM ディスクは消費しません。
configs はサービスに対して、どのタイミングであっても追加および削除ができます。
またサービス間で 1 つの config を共有することもできます。
さらに configs と環境変数や Docker labels を組み合わせて利用できるので、最大限に柔軟性を持たせることができます。
configs の値には、通常の文字列やバイナリ（500 KB まで）を指定します。
@z

@x
> **Note**: Docker configs are only available to swarm services, not to
> standalone containers. To use this feature, consider adapting your container
> to run as a service with a scale of 1.
@y
{% comment %}
> **Note**: Docker configs are only available to swarm services, not to
> standalone containers. To use this feature, consider adapting your container
> to run as a service with a scale of 1.
{% endcomment %}
> **メモ**: Docker configs はスウォームサービスにおいて利用可能であり、スタンドアロンのコンテナーでは利用できません。
> この機能を利用するには、コンテナーをサービスとして稼動させ、スケールは 1 としてください。
@z

@x
Configs are supported on both Linux and Windows services.
@y
{% comment %}
Configs are supported on both Linux and Windows services.
{% endcomment %}
configs は Linux と Windows においてサポートされます。
@z

@x
### Windows support
@y
{% comment %}
### Windows support
{% endcomment %}
### Windows サポート
{: #windows-support }
@z

@x
Docker 17.06 and higher include support for configs on Windows containers.
Where there are differences in the implementations, they are called out in the
examples below. Keep the following notable differences in mind:
@y
{% comment %}
Docker 17.06 and higher include support for configs on Windows containers.
Where there are differences in the implementations, they are called out in the
examples below. Keep the following notable differences in mind:
{% endcomment %}
Docker 17.06 またはそれ以上には、Windows コンテナーに対する configs サポートが含まれます。
ただし実装には違いがあるため、以降の利用例において示しています。
重要な違いとして以下があることを覚えておいてください。
@z

@x
- Config files with custom targets are not directly bind-mounted into Windows
  containers, since Windows does not support non-directory file bind-mounts.
  Instead, configs for a container are all mounted in
  `C:\ProgramData\Docker\internal\configs` (an implementation detail which
  should not be relied upon by applications) within the container. Symbolic
  links are used to point from there to the desired target of the config within
  the container. The default target is `C:\ProgramData\Docker\configs`.
@y
{% comment %}
- Config files with custom targets are not directly bind-mounted into Windows
  containers, since Windows does not support non-directory file bind-mounts.
  Instead, configs for a container are all mounted in
  `C:\ProgramData\Docker\internal\configs` (an implementation detail which
  should not be relied upon by applications) within the container. Symbolic
  links are used to point from there to the desired target of the config within
  the container. The default target is `C:\ProgramData\Docker\configs`.
{% endcomment %}
- カスタムターゲットを利用する config ファイルは、Windows コンテナーに対して直接バインドマウントされません。
  Windows では、ディレクトリではないファイルのバインドマウントがサポートされないためです。
  そのかわり、コンテナーに対する configs は、コンテナー内の `C:\ProgramData\Docker\internal\configs` （アプリケーションに依存しない実装場所）にすべてマウントされます。
  ここを示すシンボリックリンクが利用され、コンテナー内に必要となる config ターゲットが設定されます。
  デフォルトターゲットは `C:\ProgramData\Docker\configs` です。
@z

@x
- When creating a service which uses Windows containers, the options to specify
  UID, GID, and mode are not supported for configs. Configs are currently only
  accessible by administrators and users with `system` access within the
  container.
@y
{% comment %}
- When creating a service which uses Windows containers, the options to specify
  UID, GID, and mode are not supported for configs. Configs are currently only
  accessible by administrators and users with `system` access within the
  container.
{% endcomment %}
- Windows コンテナーを利用するサービスが生成されるとき、UID、GID を指定するオプションやモードは configs においてサポートされません。
  configs は現在のところ、コンテナー内の administrators か `system` アクセス可能なユーザーのみがアクセス可能であるからです。
@z

@x
- On Windows, create or update a service using `--credential-spec` with the
  `config://<config-name>` format.  This passes the gMSA credentials file
  directly to nodes before a container starts. No gMSA credentials are written
  to disk on worker nodes. For more information, refer to
  [Deploy services to a swarm](services.md#gmsa-for-swarm).
@y
- On Windows, create or update a service using `--credential-spec` with the
  `config://<config-name>` format.  This passes the gMSA credentials file
  directly to nodes before a container starts. No gMSA credentials are written
  to disk on worker nodes. For more information, refer to
  [Deploy services to a swarm](services.md#gmsa-for-swarm).
@z

@x
## How Docker manages configs
@y
{% comment %}
## How Docker manages configs
{% endcomment %}
## Docker は configs をどう管理しているか
{: #how-docker-manages-configs }
@z

@x
When you add a config to the swarm, Docker sends the config to the swarm manager
over a mutual TLS connection. The config is stored in the Raft log, which is
encrypted. The entire Raft log is replicated across the other managers, ensuring
the same high availability guarantees for configs as for the rest of the swarm
management data.
@y
{% comment %}
When you add a config to the swarm, Docker sends the config to the swarm manager
over a mutual TLS connection. The config is stored in the Raft log, which is
encrypted. The entire Raft log is replicated across the other managers, ensuring
the same high availability guarantees for configs as for the rest of the swarm
management data.
{% endcomment %}
スウォームに対して config を追加すると、Docker は TLS 相互接続によりスウォームマネージャーに対して config を送信します。
この config は Raft ログとして暗号化され保存されます。
Raft ログ全体は、他のマネージャーに向けて複製されますが、スウォームが管理するデータとともに configs の高可用性は確保されます。
@z

@x
When you grant a newly-created or running service access to a config, the config
is mounted as a file in the container. The location of the mount point within
the container defaults to `/<config-name>` in Linux containers. In Windows
containers, configs are all mounted into `C:\ProgramData\Docker\configs` and
symbolic links are created to the desired location, which defaults to
`C:\<config-name>`.
@y
{% comment %}
When you grant a newly-created or running service access to a config, the config
is mounted as a file in the container. The location of the mount point within
the container defaults to `/<config-name>` in Linux containers. In Windows
containers, configs are all mounted into `C:\ProgramData\Docker\configs` and
symbolic links are created to the desired location, which defaults to
`C:\<config-name>`.
{% endcomment %}
新規生成したサービス、あるいは既存のサービスに対して config へのアクセス許可を行うと、config はコンテナー内において 1 つのファイルとしてマウントされます。
コンテナー内のマウントポイントのデフォルトは、Linux コンテナーでは `/<config-name>` となります。
Windows コンテナーの場合、configs はすべて `C:\ProgramData\Docker\configs` にマウントされ、
コンテナー内に必要となる config ターゲットが、シンボリックリンクとして生成されます。
config ターゲットのデフォルトは `C:\<config-name>` です。
@z

@x
You can set the ownership (`uid` and `gid`) for the config, using either the
numerical ID or the name of the user or group. You can also specify the file
permissions (`mode`). These settings are ignored for Windows containers.
@y
{% comment %}
You can set the ownership (`uid` and `gid`) for the config, using either the
numerical ID or the name of the user or group. You can also specify the file
permissions (`mode`). These settings are ignored for Windows containers.
{% endcomment %}
config の所有（`uid` と `gid`）を設定するには、ID 値か、あるいはユーザー名やグループ名を用います。
またファイルパーミッションを設定することもできます。
この設定は Windows コンテナーにおいては無視されます。
@z

@x
- If not set, the config is owned by the user running the container
  command (often `root`) and that user's default group (also often `root`).
- If not set, the config has world-readable permissions (mode `0444`), unless a
  `umask` is set within the container, in which case the mode is impacted by
  that `umask` value.
@y
{% comment %}
- If not set, the config is owned by the user running the container
  command (often `root`) and that user's default group (also often `root`).
- If not set, the config has world-readable permissions (mode `0444`), unless a
  `umask` is set within the container, in which case the mode is impacted by
  that `umask` value.
{% endcomment %}
- 所有者が設定されていない場合、config を所有するユーザーは、コンテナーコマンドを実行したユーザー（普通は `root`）とそのグループ（これも普通は `root`）になります。
- 所有者が設定されていない場合、config のパーミッションはすべて読み込み可（`0444` モード）となります。
  ただしこれはコンテナー内に `umask` が設定されていない場合であり、これが設定されていれば `umask` の値設定に従います。
@z

@x
You can update a service to grant it access to additional configs or revoke its
access to a given config at any time.
@y
{% comment %}
You can update a service to grant it access to additional configs or revoke its
access to a given config at any time.
{% endcomment %}
configs を追加した際に、configs にアクセスできるようにサービスをアップデートしたり、configs を再読み込みしたりすることは、どのタイミングでも可能です。
@z

@x
A node only has access to configs if the node is a swarm manager or if it is
running service tasks which have been granted access to the config. When a
container task stops running, the configs shared to it are unmounted from the
in-memory filesystem for that container and flushed from the node's memory.
@y
{% comment %}
A node only has access to configs if the node is a swarm manager or if it is
running service tasks which have been granted access to the config. When a
container task stops running, the configs shared to it are unmounted from the
in-memory filesystem for that container and flushed from the node's memory.
{% endcomment %}
configs へアクセスできるノードはスウォームマネージャーか、あるいはその configs へのアクセスが許可された稼働中のサービスタスクです。
コンテナータスクが停止すると、共有されていた configs は、そのコンテナーのメモリ内ファイルシステムからアンマウントされ、ノードのメモリからも消去されます。
@z

@x
If a node loses connectivity to the swarm while it is running a task container
with access to a config, the task container still has access to its configs, but
cannot receive updates until the node reconnects to the swarm.
@y
{% comment %}
If a node loses connectivity to the swarm while it is running a task container
with access to a config, the task container still has access to its configs, but
cannot receive updates until the node reconnects to the swarm.
{% endcomment %}
config にアクセスしている稼働中のタスクコンテナーが、スウォームとの接続を失った場合、そのタスクコンテナーの config へのアクセスは維持されます。
ただし config の更新を受け取ることはできず、これができるようになるのはスウォームに再接続した後です。
@z

@x
You can add or inspect an individual config at any time, or list all
configs. You cannot remove a config that a running service is
using. See [Rotate a config](configs.md#example-rotate-a-config) for a way to
remove a config without disrupting running services.
@y
{% comment %}
You can add or inspect an individual config at any time, or list all
configs. You cannot remove a config that a running service is
using. See [Rotate a config](configs.md#example-rotate-a-config) for a way to
remove a config without disrupting running services.
{% endcomment %}
個々の config を追加したり確認したり、configs すべてを一覧したりすることはいつでもできます。
ただし稼働中のサービスが config を利用している場合は、それを削除できません。
[config の入れ替え](configs.md#example-rotate-a-config)では、実行中のサービスを中断することなく config を削除する方法について説明しています。
@z

@x
To update or roll back configs more easily, consider adding a version
number or date to the config name. This is made easier by the ability to control
the mount point of the config within a given container.
@y
{% comment %}
To update or roll back configs more easily, consider adding a version
number or date to the config name. This is made easier by the ability to control
the mount point of the config within a given container.
{% endcomment %}
configs のアップデートやロールバックをより簡単に行うために、config 名にバージョン番号や日付をつけることを考えてみてください。
取り扱うコンテナーの config マウントポイントを自由に管理できれば、より一層簡単になります。
@z

@x
To update a stack, make changes to your Compose file, then re-run `docker
stack deploy -c <new-compose-file> <stack-name>`. If you use a new config in
that file, your services start using them. Keep in mind that configurations
are immutable, so you can't change the file for an existing service.
Instead, you create a new config to use a different file
@y
{% comment %}
To update a stack, make changes to your Compose file, then re-run `docker
stack deploy -c <new-compose-file> <stack-name>`. If you use a new config in
that file, your services start using them. Keep in mind that configurations
are immutable, so you can't change the file for an existing service.
Instead, you create a new config to use a different file
{% endcomment %}
スタックの更新や Compose ファイルの変更を行うには `docker stack deploy -c <new-compose-file> <stack-name>` を再実行します。
新たな config を用いるようにしたのであれば、それを利用してサービスが起動します。
設定は不変なものであることを忘れないでください。
つまり既存のサービスに対する設定ファイルは変更することはできません。
これを行うなら、新たな設定を別のファイルとして生成してください。
@z

@x
You can run `docker stack rm` to stop the app and take down the stack. This
removes any config that was created by `docker stack deploy` with the same stack
name. This removes _all_ configs, including those not referenced by services and
those remaining after a `docker service update --config-rm`.
@y
{% comment %}
You can run `docker stack rm` to stop the app and take down the stack. This
removes any config that was created by `docker stack deploy` with the same stack
name. This removes _all_ configs, including those not referenced by services and
those remaining after a `docker service update --config-rm`.
{% endcomment %}
`docker stack rm` を実行すれば、アプリを止めてスタックを停止させることができます。
このとき、同一のスタック名により `docker stack deploy` から生成された config は削除されます。
これは **すべての** configs が削除されるということです。
サービスから参照されていなかったものや、`docker service update --config-rm` を実行した後に残ったものも、すべて削除されます。
@z

@x
## Read more about `docker config` commands
@y
{% comment %}
## Read more about `docker config` commands
{% endcomment %}
## `docker config` コマンドについての詳細
{: #read-more-about-docker-config-commands }
@z

@x
Use these links to read about specific commands, or continue to the
[example about using configs with a service](#advanced-example-use-configs-with-a-nginx-service).
@y
{% comment %}
Use these links to read about specific commands, or continue to the
[example about using configs with a service](#advanced-example-use-configs-with-a-nginx-service).
{% endcomment %}
コマンドの詳細は以下のリンクを参照してください。
また [サービスにおける configs の利用例](#advanced-example-use-configs-with-a-nginx-service) も参照してください。
@z

@x
- [`docker config create`](../reference/commandline/config_create.md)
- [`docker config inspect`](../reference/commandline/config_inspect.md)
- [`docker config ls`](../reference/commandline/config_ls.md)
- [`docker config rm`](../reference/commandline/config_rm.md)
@y
- [`docker config create`](../reference/commandline/config_create.md)
- [`docker config inspect`](../reference/commandline/config_inspect.md)
- [`docker config ls`](../reference/commandline/config_ls.md)
- [`docker config rm`](../reference/commandline/config_rm.md)
@z

@x
## Examples
@y
{% comment %}
## Examples
{% endcomment %}
## 利用例
{: #examples }
@z

@x
This section includes graduated examples which illustrate how to use
Docker configs.
@y
{% comment %}
This section includes graduated examples which illustrate how to use
Docker configs.
{% endcomment %}
本節では Docker configs の利用例を段階的に示します。
@z

@x
> **Note**: These examples use a single-Engine swarm and unscaled services for
> simplicity. The examples use Linux containers, but Windows containers also
> support configs.
@y
{% comment %}
> **Note**: These examples use a single-Engine swarm and unscaled services for
> simplicity. The examples use Linux containers, but Windows containers also
> support configs.
{% endcomment %}
> **メモ**: ここでの利用例では説明を簡単にするために、単一エンジンによるスウォームとスケールアップしていないサービスを用いることにします。
> Linux コンテナーを例に用いますが、Windows コンテナーでも configs はサポートされています。
@z

@x
### Defining and using configs in compose files
@y
{% comment %}
### Defining and using configs in compose files
{% endcomment %}
### Compose ファイルにおける configs の定義と利用
{: #defining-and-using-configs-in-compose-files }
@z

@x
The `docker stack` command supports defining configs in a Compose file.
However, the `configs` key is not supported for `docker compose`. See
[the Compose file reference](../../compose/compose-file/index.md#configs) for details.
@y
{% comment %}
The `docker stack` command supports defining configs in a Compose file.
However, the `configs` key is not supported for `docker compose`. See
[the Compose file reference](../../compose/compose-file/index.md#configs) for details.
{% endcomment %}
`docker stack` コマンドには、Compose ファイルにて configs を定義する機能がサポートされています。
しかし `configs` キーは `docker compose` コマンドではサポートされていません。
詳しくは [Compose ファイルリファレンス](../../compose/compose-file/index.md#configs) を参照してください。
@z

@x
### Simple example: Get started with configs
@y
{% comment %}
### Simple example: Get started with configs
{% endcomment %}
### 簡単な例： configs を利用する
{: #simple-example-get-started-with-configs }
@z

@x
This simple example shows how configs work in just a few commands. For a
real-world example, continue to
[Advanced example: Use configs with a Nginx service](#advanced-example-use-configs-with-a-nginx-service).
@y
{% comment %}
This simple example shows how configs work in just a few commands. For a
real-world example, continue to
[Advanced example: Use configs with a Nginx service](#advanced-example-use-configs-with-a-nginx-service).
{% endcomment %}
この簡単な例では、コマンドを少し書くだけで configs が動作することを示します。
現実的な例としては、[応用例: Nginx サービスに configs を利用する](#advanced-example-use-configs-with-a-nginx-service) に進んでください。
@z

@x
1.  Add a config to Docker. The `docker config create` command reads standard
    input because the last argument, which represents the file to read the
    config from, is set to `-`.
@y
{% comment %}
1.  Add a config to Docker. The `docker config create` command reads standard
    input because the last argument, which represents the file to read the
    config from, is set to `-`.
{% endcomment %}
1.  Docker に config を追加します。
    この `docker config create` コマンドは、最後の引数により標準入力から読み込みを行います。
    最後の引数は config をどのファイルから読み込むかを示すものであって、ここではそれを `-` としています。
@z

@x
    ```bash
    $ echo "This is a config" | docker config create my-config -
    ```
@y
    ```bash
    $ echo "This is a config" | docker config create my-config -
    ```
@z

@x
2.  Create a `redis` service and grant it access to the config. By default,
    the container can access the config at `/my-config`, but
    you can customize the file name on the container using the `target` option.
@y
{% comment %}
2.  Create a `redis` service and grant it access to the config. By default,
    the container can access the config at `/my-config`, but
    you can customize the file name on the container using the `target` option.
{% endcomment %}
2.  `redis` サービスを生成し、config に対してのアクセスを許可します。
    デフォルトでコンテナーは `/my-config` にある config へのアクセスが可能です。
    コンテナー内のそのファイル名は、`target` オプションを使って変更することができます。
@z

@x
    ```bash
    $ docker service create --name redis --config my-config redis:alpine
    ```
@y
    ```bash
    $ docker service create --name redis --config my-config redis:alpine
    ```
@z

@x
3.  Verify that the task is running without issues using `docker service ps`. If
    everything is working, the output looks similar to this:
@y
{% comment %}
3.  Verify that the task is running without issues using `docker service ps`. If
    everything is working, the output looks similar to this:
{% endcomment %}
3.  `docker service ps` を実行して、タスクが問題なく実行しているかを確認します。
    問題がなければ、出力結果は以下のようになります。
@z

@x
    ```bash
    $ docker service ps redis
@y
    ```bash
    $ docker service ps redis
@z

@x
    ID            NAME     IMAGE         NODE              DESIRED STATE  CURRENT STATE          ERROR  PORTS
    bkna6bpn8r1a  redis.1  redis:alpine  ip-172-31-46-109  Running        Running 8 seconds ago
    ```
@y
    ID            NAME     IMAGE         NODE              DESIRED STATE  CURRENT STATE          ERROR  PORTS
    bkna6bpn8r1a  redis.1  redis:alpine  ip-172-31-46-109  Running        Running 8 seconds ago
    ```
@z

@x
4.  Get the ID of the `redis` service task container using `docker ps`, so that
    you can use `docker container exec` to connect to the container and read the contents
    of the config data file, which defaults to being readable by all and has the
    same name as the name of the config. The first command below illustrates
    how to find the container ID, and the second and third commands use shell
    completion to do this automatically.
@y
{% comment %}
4.  Get the ID of the `redis` service task container using `docker ps`, so that
    you can use `docker container exec` to connect to the container and read the contents
    of the config data file, which defaults to being readable by all and has the
    same name as the name of the config. The first command below illustrates
    how to find the container ID, and the second and third commands use shell
    completion to do this automatically.
{% endcomment %}
4.  `docker ps` を実行して、`redis` サービスのタスクコンテナーに対する ID を取得します。
    これを使って `docker container exec` によりコンテナーにアクセスして、config データファイルの内容を読み込むことができます。
    config データファイルはデフォルトで誰でも読むことができ、ファイル名は config 名と同じです。
    以下の最初のコマンドは、コンテナー ID を調べるものです。
    そして 2 つめと 3 つめは、シェルのコマンド補完を用いて自動的に入力しました。
@z

@x
    ```bash
    $ docker ps --filter name=redis -q
@y
    ```bash
    $ docker ps --filter name=redis -q
@z

@x
    5cb1c2348a59
@y
    5cb1c2348a59
@z

@x
    $ docker container exec $(docker ps --filter name=redis -q) ls -l /my-config
@y
    $ docker container exec $(docker ps --filter name=redis -q) ls -l /my-config
@z

@x
    -r--r--r--    1 root     root            12 Jun  5 20:49 my-config
@y
    -r--r--r--    1 root     root            12 Jun  5 20:49 my-config
@z

@x
    $ docker container exec $(docker ps --filter name=redis -q) cat /my-config
@y
    $ docker container exec $(docker ps --filter name=redis -q) cat /my-config
@z

@x
    This is a config
    ```
@y
    This is a config
    ```
@z

@x
5.  Try removing the config. The removal fails because the `redis` service is
    running and has access to the config.
@y
{% comment %}
5.  Try removing the config. The removal fails because the `redis` service is
    running and has access to the config.
{% endcomment %}
5.  config を削除してみます。
    ただし削除には失敗します。
    これは `redis` サービスが稼働中であり、config にアクセスしているためです。
@z

@x
    ```bash
@y
    ```bash
@z

@x
    $ docker config ls
@y
    $ docker config ls
@z

@x
    ID                          NAME                CREATED             UPDATED
    fzwcfuqjkvo5foqu7ts7ls578   hello               31 minutes ago      31 minutes ago
@y
    ID                          NAME                CREATED             UPDATED
    fzwcfuqjkvo5foqu7ts7ls578   hello               31 minutes ago      31 minutes ago
@z

@x
    $ docker config rm my-config
@y
    $ docker config rm my-config
@z

@x
    Error response from daemon: rpc error: code = 3 desc = config 'my-config' is
    in use by the following service: redis
    ```
@y
    Error response from daemon: rpc error: code = 3 desc = config 'my-config' is
    in use by the following service: redis
    ```
@z

@x
6.  Remove access to the config from the running `redis` service by updating the
    service.
@y
{% comment %}
6.  Remove access to the config from the running `redis` service by updating the
    service.
{% endcomment %}
6.  `redis` サービスを更新して、稼働中のサービスからの config へのアクセスを取り除きます。
@z

@x
    ```bash
    $ docker service update --config-rm my-config redis
    ```
@y
    ```bash
    $ docker service update --config-rm my-config redis
    ```
@z

@x
7.  Repeat steps 3 and 4 again, verifying that the service no longer has access
    to the config. The container ID is different, because the
    `service update` command redeploys the service.
@y
{% comment %}
7.  Repeat steps 3 and 4 again, verifying that the service no longer has access
    to the config. The container ID is different, because the
    `service update` command redeploys the service.
{% endcomment %}
7.  手順の 3 と 4 を繰り返してみます。
    このときには、もう config へのアクセスが行われていません。
    コンテナー ID は異なるものになっています。
    `service update` コマンドを実行したので、サービスが再デプロイされたためです。
@z

@x
    ```none
    $ docker container exec -it $(docker ps --filter name=redis -q) cat /my-config
@y
    ```none
    $ docker container exec -it $(docker ps --filter name=redis -q) cat /my-config
@z

@x
    cat: can't open '/my-config': No such file or directory
    ```
@y
    cat: can't open '/my-config': No such file or directory
    ```
@z

@x
8.  Stop and remove the service, and remove the config from Docker.
@y
{% comment %}
8.  Stop and remove the service, and remove the config from Docker.
{% endcomment %}
8.  サービスを停止して削除します。
    そして Docker から config も削除します。
@z

@x
    ```bash
    $ docker service rm redis
@y
    ```bash
    $ docker service rm redis
@z

@x
    $ docker config rm my-config
    ```
@y
    $ docker config rm my-config
    ```
@z

@x
### Simple example: Use configs in a Windows service
@y
{% comment %}
### Simple example: Use configs in a Windows service
{% endcomment %}
### 簡単な例： Windows サービスにて configs を利用する
{: #simple-example-use-configs-in-a-windows-service }
@z

@x
This is a very simple example which shows how to use configs with a Microsoft
IIS service running on Docker 17.06 EE on Microsoft Windows Server 2016 or Docker
for Windows 17.06 CE on Microsoft Windows 10. It stores the webpage in a config.
@y
{% comment %}
This is a very simple example which shows how to use configs with a Microsoft
IIS service running on Docker 17.06 EE on Microsoft Windows Server 2016 or Docker
for Windows 17.06 CE on Microsoft Windows 10. It stores the webpage in a config.
{% endcomment %}
ここでの簡単な例は Windows 上において configs を利用するものです。
利用にあたっては、Microsoft Windows Server 2016 上の Docker 17.06 EE、または Microsoft Windows 10 上の Docker Windows 17.06 CE を用いて Microsoft IIS サービスを稼動させます。
この例は config 内にウェブページを保存します。
@z

@x
This example assumes that you have PowerShell installed.
@y
{% comment %}
This example assumes that you have PowerShell installed.
{% endcomment %}
PowerShell はインストール済であるとします。
@z

@x
1.  Save the following into a new file `index.html`.
@y
{% comment %}
1.  Save the following into a new file `index.html`.
{% endcomment %}
1.  以下のような `index.html` を新規生成して保存します。
@z

@x
    ```html
    <html>
      <head><title>Hello Docker</title></head>
      <body>
        <p>Hello Docker! You have deployed a HTML page.</p>
      </body>
    </html>
    ```
2.  If you have not already done so, initialize or join the swarm.
@y
    ```html
    <html>
      <head><title>Hello Docker</title></head>
      <body>
        <p>Hello Docker! You have deployed a HTML page.</p>
      </body>
    </html>
    ```
{% comment %}
2.  If you have not already done so, initialize or join the swarm.
{% endcomment %}
2.  スウォームの初期化と参加を行っていない場合は、これを行います。
@z

@x
    ```powershell
    docker swarm init
    ```
@y
    ```powershell
    docker swarm init
    ```
@z

@x
3.  Save the `index.html` file as a swarm config named `homepage`.
@y
{% comment %}
3.  Save the `index.html` file as a swarm config named `homepage`.
{% endcomment %}
3.  `index.html` ファイルを、スウォームの config ファイルとして `homepage` という名前により保存します。
@z

@x
    ```powershell
    docker config create homepage index.html
    ```
@y
    ```powershell
    docker config create homepage index.html
    ```
@z

@x
4.  Create an IIS service and grant it access to the `homepage` config.
@y
{% comment %}
4.  Create an IIS service and grant it access to the `homepage` config.
{% endcomment %}
4.  IIS サービスを生成して `homepage` config へのアクセスを許可します。
@z

@x
    ```powershell
    docker service create
        --name my-iis
        --publish published=8000,target=8000
        --config src=homepage,target="\inetpub\wwwroot\index.html"
        microsoft/iis:nanoserver
    ```
@y
    ```powershell
    docker service create
        --name my-iis
        --publish published=8000,target=8000
        --config src=homepage,target="\inetpub\wwwroot\index.html"
        microsoft/iis:nanoserver
    ```
@z

@x
5.  Access the IIS service at `http://localhost:8000/`. It should serve
    the HTML content from the first step.
@y
{% comment %}
5.  Access the IIS service at `http://localhost:8000/`. It should serve
    the HTML content from the first step.
{% endcomment %}
5.  IIS サービスを通じて `http://localhost:8000/` にアクセスします。
    手順 1 で作り出した HTML 内容が表示されるはずです。
@z

@x
6.  Remove the service and the config.
@y
{% comment %}
6.  Remove the service and the config.
{% endcomment %}
6.  サービスと config を削除します。
@z

@x
    ```powershell
    docker service rm my-iis
@y
    ```powershell
    docker service rm my-iis
@z

@x
    docker config rm homepage
    ```
@y
    docker config rm homepage
    ```
@z

@x
### Example: Use a templated config
@y
### Example: Use a templated config
@z

@x
To create a configuration in which the content will be generated using a
template engine, use the `--template-driver` parameter and specify the engine
name as its argument. The template will be rendered when container is created.
@y
To create a configuration in which the content will be generated using a
template engine, use the `--template-driver` parameter and specify the engine
name as its argument. The template will be rendered when container is created.
@z

@x
1.  Save the following into a new file `index.html.tmpl`.
@y
1.  Save the following into a new file `index.html.tmpl`.
@z

@x
    ```html
    <html>
      <head><title>Hello Docker</title></head>
      <body>
        <p>Hello {% raw %}{{ env "HELLO" }}{% endraw %}! I'm service {% raw %}{{ .Service.Name }}{% endraw %}.</p>
      </body>
    </html>
    ```
@y
    ```html
    <html>
      <head><title>Hello Docker</title></head>
      <body>
        <p>Hello {% raw %}{{ env "HELLO" }}{% endraw %}! I'm service {% raw %}{{ .Service.Name }}{% endraw %}.</p>
      </body>
    </html>
    ```
@z

@x
2.  Save the `index.html.tmpl` file as a swarm config named `homepage`. Provide
    parameter `--template-driver` and specify `golang` as template engine.
@y
2.  Save the `index.html.tmpl` file as a swarm config named `homepage`. Provide
    parameter `--template-driver` and specify `golang` as template engine.
@z

@x
    ```bash
    $ docker config create --template-driver golang homepage index.html.tmpl
    ```
@y
    ```bash
    $ docker config create --template-driver golang homepage index.html.tmpl
    ```
@z

@x
3.  Create a service that runs Nginx and has access to the environment variable
    HELLO and to the config.
@y
3.  Create a service that runs Nginx and has access to the environment variable
    HELLO and to the config.
@z

@x
    ```bash
    $ docker service create \
         --name hello-template \
         --env HELLO="Docker" \
         --config source=homepage,target=/usr/share/nginx/html/index.html \
         --publish published=3000,target=80 \
         nginx:alpine
    ```
@y
    ```bash
    $ docker service create \
         --name hello-template \
         --env HELLO="Docker" \
         --config source=homepage,target=/usr/share/nginx/html/index.html \
         --publish published=3000,target=80 \
         nginx:alpine
    ```
@z

@x
4.  Verify that the service is operational: you can reach the Nginx server, and
    that the correct output is being served.
@y
4.  Verify that the service is operational: you can reach the Nginx server, and
    that the correct output is being served.
@z

@x
    ```bash
    $ curl http://0.0.0.0:3000
@y
    ```bash
    $ curl http://0.0.0.0:3000
@z

@x
    <html>
      <head><title>Hello Docker</title></head>
      <body>
        <p>Hello Docker! I'm service hello-template.</p>
      </body>
    </html>
    ```
@y
    <html>
      <head><title>Hello Docker</title></head>
      <body>
        <p>Hello Docker! I'm service hello-template.</p>
      </body>
    </html>
    ```
@z

@x
### Advanced example: Use configs with a Nginx service
@y
{% comment %}
### Advanced example: Use configs with a Nginx service
{% endcomment %}
### 応用例: Nginx サービスに configs を利用する
{: #advanced-example-use-configs-with-a-nginx-service }
@z

@x
This example is divided into two parts.
[The first part](#generate-the-site-certificate) is all about generating
the site certificate and does not directly involve Docker configs at all, but
it sets up [the second part](#configure-the-nginx-container), where you store
and use the site certificate as a series of secrets and the Nginx configuration
as a config. The example shows how to set options on the config, such as the
target location within the container and the file permissions (`mode`).
@y
{% comment %}
This example is divided into two parts.
[The first part](#generate-the-site-certificate) is all about generating
the site certificate and does not directly involve Docker configs at all, but
it sets up [the second part](#configure-the-nginx-container), where you store
and use the site certificate as a series of secrets and the Nginx configuration
as a config. The example shows how to set options on the config, such as the
target location within the container and the file permissions (`mode`).
{% endcomment %}
この例は 2 つの部分から構成されます。
[1 つめの部分](#generate-the-site-certificate)は、サーバー証明書の生成に関してです。
Docker configs とは直接関係がありません。
ただし [2 つめの部分](#configure-the-nginx-container)において、一連の機密情報としてそのサーバー証明書を保存して利用します。
また Nginx の設定を config として保存します。
この例では config におけるオプションの設定方法を示しており、たとえばコンテナー内のターゲットを指定したり、ファイルパーミッションを指定したりしています。
@z

@x
#### Generate the site certificate
@y
{% comment %}
#### Generate the site certificate
{% endcomment %}
#### サーバー証明書の生成
{: #generate-the-site-certificate }
@z

@x
Generate a root CA and TLS certificate and key for your site. For production
sites, you may want to use a service such as `Let’s Encrypt` to generate the
TLS certificate and key, but this example uses command-line tools. This step
is a little complicated, but is only a set-up step so that you have
something to store as a Docker secret. If you want to skip these sub-steps,
you can [use Let's Encrypt](https://letsencrypt.org/getting-started/) to
generate the site key and certificate, name the files `site.key` and
`site.crt`, and skip to
[Configure the Nginx container](#configure-the-nginx-container).
@y
{% comment %}
Generate a root CA and TLS certificate and key for your site. For production
sites, you may want to use a service such as `Let’s Encrypt` to generate the
TLS certificate and key, but this example uses command-line tools. This step
is a little complicated, but is only a set-up step so that you have
something to store as a Docker secret. If you want to skip these sub-steps,
you can [use Let's Encrypt](https://letsencrypt.org/getting-started/) to
generate the site key and certificate, name the files `site.key` and
`site.crt`, and skip to
[Configure the Nginx container](#configure-the-nginx-container).
{% endcomment %}
自サイトに対しての root CA と TLS 証明書および鍵を生成します。
本番環境向けでは `Let’s Encrypt` のようなサービスを利用して、TLS 証明書や鍵を生成するかもしれませんが、この例ではコマンドラインツールを用いることにします。
ここでの手順は多少複雑です。
ただしここでは唯一、Docker secret を使って情報を保存する手順を示すものです。
この手順を行わない場合は、[Let's Encrypt の利用](https://letsencrypt.org/getting-started/)を通じて、サイトの鍵と証明書を生成し、それぞれを `site.key`、`site.crt` としてください。
その場合は [Nginx コンテナーの設定](#configure-the-nginx-container) に進んでください。
@z

@x
1.  Generate a root key.
@y
{% comment %}
1.  Generate a root key.
{% endcomment %}
1.  root 鍵を生成します。
@z

@x
    ```bash
    $ openssl genrsa -out "root-ca.key" 4096
    ```
@y
    ```bash
    $ openssl genrsa -out "root-ca.key" 4096
    ```
@z

@x
2.  Generate a CSR using the root key.
@y
{% comment %}
2.  Generate a CSR using the root key.
{% endcomment %}
2.  root 鍵を使って CSR を生成します。
@z

@x
    ```bash
    $ openssl req \
              -new -key "root-ca.key" \
              -out "root-ca.csr" -sha256 \
              -subj '/C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA'
    ```
@y
    ```bash
    $ openssl req \
              -new -key "root-ca.key" \
              -out "root-ca.csr" -sha256 \
              -subj '/C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA'
    ```
@z

@x
3.  Configure the root CA. Edit a new file called `root-ca.cnf` and paste
    the following contents into it. This constrains the root CA to only sign
    leaf certificates and not intermediate CAs.
@y
{% comment %}
3.  Configure the root CA. Edit a new file called `root-ca.cnf` and paste
    the following contents into it. This constrains the root CA to only sign
    leaf certificates and not intermediate CAs.
{% endcomment %}
3.  root CA を設定します。
    新規に `root-ca.cnf` というファイルを生成して、以下の内容を書き込みます。
    ここでは root CA をリーフ証明書として生成し、中間証明書とはしません。
@z

@x
    ```none
    [root_ca]
    basicConstraints = critical,CA:TRUE,pathlen:1
    keyUsage = critical, nonRepudiation, cRLSign, keyCertSign
    subjectKeyIdentifier=hash
    ```
@y
    ```none
    [root_ca]
    basicConstraints = critical,CA:TRUE,pathlen:1
    keyUsage = critical, nonRepudiation, cRLSign, keyCertSign
    subjectKeyIdentifier=hash
    ```
@z

@x
4.  Sign the certificate.
@y
{% comment %}
4.  Sign the certificate.
{% endcomment %}
4.  証明書にサインします。
@z

@x
    ```bash
    $ openssl x509 -req -days 3650 -in "root-ca.csr" \
                   -signkey "root-ca.key" -sha256 -out "root-ca.crt" \
                   -extfile "root-ca.cnf" -extensions \
                   root_ca
    ```
@y
    ```bash
    $ openssl x509 -req -days 3650 -in "root-ca.csr" \
                   -signkey "root-ca.key" -sha256 -out "root-ca.crt" \
                   -extfile "root-ca.cnf" -extensions \
                   root_ca
    ```
@z

@x
5.  Generate the site key.
@y
{% comment %}
5.  Generate the site key.
{% endcomment %}
5.  サイト鍵を生成します。
@z

@x
    ```bash
    $ openssl genrsa -out "site.key" 4096
    ```
@y
    ```bash
    $ openssl genrsa -out "site.key" 4096
    ```
@z

@x
6.  Generate the site certificate and sign it with the site key.
@y
{% comment %}
6.  Generate the site certificate and sign it with the site key.
{% endcomment %}
6.  サイト証明書を生成し、サイト鍵を用いてサインします。
@z

@x
    ```bash
    $ openssl req -new -key "site.key" -out "site.csr" -sha256 \
              -subj '/C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost'
    ```
@y
    ```bash
    $ openssl req -new -key "site.key" -out "site.csr" -sha256 \
              -subj '/C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost'
    ```
@z

@x
7.  Configure the site certificate. Edit a new file called `site.cnf` and
    paste the following contents into it. This constrains the site
    certificate so that it can only be used to authenticate a server and
    can't be used to sign certificates.
@y
{% comment %}
7.  Configure the site certificate. Edit a new file called `site.cnf` and
    paste the following contents into it. This constrains the site
    certificate so that it can only be used to authenticate a server and
    can't be used to sign certificates.
{% endcomment %}
7.  サイト証明書を設定します。
    新規に `site.cnf` というファイルを生成して、以下の内容を書き込みます。
    この証明書はサーバーを認証するためだけに用いるものとし、他の証明書のサインには用いることができないようにします。
@z

@x
    ```none
    [server]
    authorityKeyIdentifier=keyid,issuer
    basicConstraints = critical,CA:FALSE
    extendedKeyUsage=serverAuth
    keyUsage = critical, digitalSignature, keyEncipherment
    subjectAltName = DNS:localhost, IP:127.0.0.1
    subjectKeyIdentifier=hash
    ```
@y
    ```none
    [server]
    authorityKeyIdentifier=keyid,issuer
    basicConstraints = critical,CA:FALSE
    extendedKeyUsage=serverAuth
    keyUsage = critical, digitalSignature, keyEncipherment
    subjectAltName = DNS:localhost, IP:127.0.0.1
    subjectKeyIdentifier=hash
    ```
@z

@x
8.  Sign the site certificate.
@y
{% comment %}
8.  Sign the site certificate.
{% endcomment %}
8.  サイト証明書にサインします。
@z

@x
    ```bash
    $ openssl x509 -req -days 750 -in "site.csr" -sha256 \
        -CA "root-ca.crt" -CAkey "root-ca.key" -CAcreateserial \
        -out "site.crt" -extfile "site.cnf" -extensions server
    ```
@y
    ```bash
    $ openssl x509 -req -days 750 -in "site.csr" -sha256 \
        -CA "root-ca.crt" -CAkey "root-ca.key" -CAcreateserial \
        -out "site.crt" -extfile "site.cnf" -extensions server
    ```
@z

@x
9.  The `site.csr` and `site.cnf` files are not needed by the Nginx service, but
    you need them if you want to generate a new site certificate. Protect
    the `root-ca.key` file.
@y
{% comment %}
9.  The `site.csr` and `site.cnf` files are not needed by the Nginx service, but
    you need them if you want to generate a new site certificate. Protect
    the `root-ca.key` file.
{% endcomment %}
9.  `site.csr` と `site.cnf` は Nginx サービスにとっては不要です。
    ただし新たなサイト証明書を生成する際には必要になります。
    `root-ca.key` は大事に保管しておきます。
@z

@x
#### Configure the Nginx container
@y
{% comment %}
#### Configure the Nginx container
{% endcomment %}
#### Nginx コンテナーの設定
{: #configure-the-nginx-container }
@z

@x
1.  Produce a very basic Nginx configuration that serves static files over HTTPS.
    The TLS certificate and key are stored as Docker secrets so that they
    can be rotated easily.
@y
{% comment %}
1.  Produce a very basic Nginx configuration that serves static files over HTTPS.
    The TLS certificate and key are stored as Docker secrets so that they
    can be rotated easily.
{% endcomment %}
1.  Nginx の基本的な設定として、HTTPS 越しにスタティックファイルを提供するものを用意します。
    TLS 証明書と鍵は Docker secrets として保存します。
    こうしておけば config の入れ替えも簡単に行うことができます。
@z

@x
    In the current directory, create a new file called `site.conf` with the
    following contents:
@y
    {% comment %}
    In the current directory, create a new file called `site.conf` with the
    following contents:
    {% endcomment %}
    カレントディレクトリにおいて、`site.conf` というファイルを新規生成し、内容を以下のようにします。
@z

@x
    ```none
    server {
        listen                443 ssl;
        server_name           localhost;
        ssl_certificate       /run/secrets/site.crt;
        ssl_certificate_key   /run/secrets/site.key;
@y
    ```none
    server {
        listen                443 ssl;
        server_name           localhost;
        ssl_certificate       /run/secrets/site.crt;
        ssl_certificate_key   /run/secrets/site.key;
@z

@x
        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
        }
    }
    ```
@y
        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
        }
    }
    ```
@z

@x
2.  Create two secrets, representing the key and the certificate. You can store
    any file as a secret as long as it is smaller than 500 KB. This allows you
    to decouple the key and certificate from the services that use them.
    In these examples, the secret name and the file name are the same.
@y
{% comment %}
2.  Create two secrets, representing the key and the certificate. You can store
    any file as a secret as long as it is smaller than 500 KB. This allows you
    to decouple the key and certificate from the services that use them.
    In these examples, the secret name and the file name are the same.
{% endcomment %}
2.  鍵と証明書を表わす Docker secrets を 2 つ生成します。
    Docker secrets はどのようなファイルであっても、サイズが 500 KB 以下であれば保存できます。
    こうして鍵と証明書は、これを利用するサービスから切り離すことができます。
    ここでの例では、secrets とファイル名は同一にしています。
@z

@x
    ```bash
    $ docker secret create site.key site.key
@y
    ```bash
    $ docker secret create site.key site.key
@z

@x
    $ docker secret create site.crt site.crt
    ```
@y
    $ docker secret create site.crt site.crt
    ```
@z

@x
3.  Save the `site.conf` file in a Docker config. The first parameter is the
    name of the config, and the second parameter is the file to read it from.
@y
{% comment %}
3.  Save the `site.conf` file in a Docker config. The first parameter is the
    name of the config, and the second parameter is the file to read it from.
{% endcomment %}
3.  Docker config の中に `site.conf` ファイルを保存します。
    第 1 パラメーターは config 名、第 2 パラメーターはそれを読み込むファイル名です。
@z

@x
    ```bash
    $ docker config create site.conf site.conf
    ```
@y
    ```bash
    $ docker config create site.conf site.conf
    ```
@z

@x
    List the configs:
@y
   {% comment %}
    List the configs:
   {% endcomment %}
    configs の一覧を確認します。
@z

@x
    ```bash
    $ docker config ls
@y
    ```bash
    $ docker config ls
@z

@x
    ID                          NAME                CREATED             UPDATED
    4ory233120ccg7biwvy11gl5z   site.conf           4 seconds ago       4 seconds ago
    ```
@y
    ID                          NAME                CREATED             UPDATED
    4ory233120ccg7biwvy11gl5z   site.conf           4 seconds ago       4 seconds ago
    ```
@z

@x
4.  Create a service that runs Nginx and has access to the two secrets and the
    config. Set the mode to `0440` so that the file is only readable by its
    owner and that owner's group, not the world.
@y
{% comment %}
4.  Create a service that runs Nginx and has access to the two secrets and the
    config. Set the mode to `0440` so that the file is only readable by its
    owner and that owner's group, not the world.
{% endcomment %}
4.  Nginx を起動するサービスを生成し、2 つの secrets と config へのアクセスを許可します。
    モードは `0440` とし、読み込み可とするのは所有者とそのグループのみ、つまりすべてへの読み込み許可は与えないようにします。
@z

@x
    ```bash
    $ docker service create \
         --name nginx \
         --secret site.key \
         --secret site.crt \
         --config source=site.conf,target=/etc/nginx/conf.d/site.conf,mode=0440 \
         --publish published=3000,target=443 \
         nginx:latest \
         sh -c "exec nginx -g 'daemon off;'"
    ```
@y
    ```bash
    $ docker service create \
         --name nginx \
         --secret site.key \
         --secret site.crt \
         --config source=site.conf,target=/etc/nginx/conf.d/site.conf,mode=0440 \
         --publish published=3000,target=443 \
         nginx:latest \
         sh -c "exec nginx -g 'daemon off;'"
    ```
@z

@x
    Within the running containers, the following three files now exist:
@y
    {% comment %}
    Within the running containers, the following three files now exist:
    {% endcomment %}
    稼動中のコンテナー内部では、以下の 3 つのファイルが存在しています。
@z

@x
    - `/run/secrets/site.key`
    - `/run/secrets/site.crt`
    - `/etc/nginx/conf.d/site.conf`
@y
    - `/run/secrets/site.key`
    - `/run/secrets/site.crt`
    - `/etc/nginx/conf.d/site.conf`
@z

@x
5.  Verify that the Nginx service is running.
@y
{% comment %}
5.  Verify that the Nginx service is running.
{% endcomment %}
5.  Nginx サービスが起動していることを確認します。
@z

@x
    ```bash
    $ docker service ls
@y
    ```bash
    $ docker service ls
@z

@x
    ID            NAME   MODE        REPLICAS  IMAGE
    zeskcec62q24  nginx  replicated  1/1       nginx:latest
@y
    ID            NAME   MODE        REPLICAS  IMAGE
    zeskcec62q24  nginx  replicated  1/1       nginx:latest
@z

@x
    $ docker service ps nginx
@y
    $ docker service ps nginx
@z

@x
    NAME                  IMAGE         NODE  DESIRED STATE  CURRENT STATE          ERROR  PORTS
    nginx.1.9ls3yo9ugcls  nginx:latest  moby  Running        Running 3 minutes ago
    ```
@y
    NAME                  IMAGE         NODE  DESIRED STATE  CURRENT STATE          ERROR  PORTS
    nginx.1.9ls3yo9ugcls  nginx:latest  moby  Running        Running 3 minutes ago
    ```
@z

@x
6.  Verify that the service is operational: you can reach the Nginx
    server, and that the correct TLS certificate is being used.
@y
{% comment %}
6.  Verify that the service is operational: you can reach the Nginx
    server, and that the correct TLS certificate is being used.
{% endcomment %}
6.  そのサービスが操作可能であることを確認します。
    つまり Nginx サーバーへアクセスができ、正しい TLS 証明書が用いられていることを確認します。
@z

@x
    ```bash
    $ curl --cacert root-ca.crt https://0.0.0.0:3000
@y
    ```bash
    $ curl --cacert root-ca.crt https://0.0.0.0:3000
@z

@x
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
    </head>
    <body>
    <h1>Welcome to nginx!</h1>
    <p>If you see this page, the nginx web server is successfully installed and
    working. Further configuration is required.</p>
@y
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
    </head>
    <body>
    <h1>Welcome to nginx!</h1>
    <p>If you see this page, the nginx web server is successfully installed and
    working. Further configuration is required.</p>
@z

@x
    <p>For online documentation and support, refer to
    <a href="https://nginx.org">nginx.org</a>.<br/>
    Commercial support is available at
    <a href="https://www.nginx.com">www.nginx.com</a>.</p>
@y
    <p>For online documentation and support, refer to
    <a href="https://nginx.org">nginx.org</a>.<br/>
    Commercial support is available at
    <a href="https://www.nginx.com">www.nginx.com</a>.</p>
@z

@x
    <p><em>Thank you for using nginx.</em></p>
    </body>
    </html>
    ```
@y
    <p><em>Thank you for using nginx.</em></p>
    </body>
    </html>
    ```
@z

@x
    ```bash
    $ openssl s_client -connect 0.0.0.0:3000 -CAfile root-ca.crt
@y
    ```bash
    $ openssl s_client -connect 0.0.0.0:3000 -CAfile root-ca.crt
@z

@x
    CONNECTED(00000003)
    depth=1 /C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA
    verify return:1
    depth=0 /C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost
    verify return:1
    ---
    Certificate chain
     0 s:/C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost
       i:/C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA
    ---
    Server certificate
    -----BEGIN CERTIFICATE-----
    …
    -----END CERTIFICATE-----
    subject=/C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost
    issuer=/C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA
    ---
    No client certificate CA names sent
    ---
    SSL handshake has read 1663 bytes and written 712 bytes
    ---
    New, TLSv1/SSLv3, Cipher is AES256-SHA
    Server public key is 4096 bit
    Secure Renegotiation IS supported
    Compression: NONE
    Expansion: NONE
    SSL-Session:
        Protocol  : TLSv1
        Cipher    : AES256-SHA
        Session-ID: A1A8BF35549C5715648A12FD7B7E3D861539316B03440187D9DA6C2E48822853
        Session-ID-ctx:
        Master-Key: F39D1B12274BA16D3A906F390A61438221E381952E9E1E05D3DD784F0135FB81353DA38C6D5C021CB926E844DFC49FC4
        Key-Arg   : None
        Start Time: 1481685096
        Timeout   : 300 (sec)
        Verify return code: 0 (ok)
    ```
@y
    CONNECTED(00000003)
    depth=1 /C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA
    verify return:1
    depth=0 /C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost
    verify return:1
    ---
    Certificate chain
     0 s:/C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost
       i:/C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA
    ---
    Server certificate
    -----BEGIN CERTIFICATE-----
    …
    -----END CERTIFICATE-----
    subject=/C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost
    issuer=/C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA
    ---
    No client certificate CA names sent
    ---
    SSL handshake has read 1663 bytes and written 712 bytes
    ---
    New, TLSv1/SSLv3, Cipher is AES256-SHA
    Server public key is 4096 bit
    Secure Renegotiation IS supported
    Compression: NONE
    Expansion: NONE
    SSL-Session:
        Protocol  : TLSv1
        Cipher    : AES256-SHA
        Session-ID: A1A8BF35549C5715648A12FD7B7E3D861539316B03440187D9DA6C2E48822853
        Session-ID-ctx:
        Master-Key: F39D1B12274BA16D3A906F390A61438221E381952E9E1E05D3DD784F0135FB81353DA38C6D5C021CB926E844DFC49FC4
        Key-Arg   : None
        Start Time: 1481685096
        Timeout   : 300 (sec)
        Verify return code: 0 (ok)
    ```
@z

@x
7.  Unless you are going to continue to the next example, clean up after running
    this example by removing the `nginx` service and the stored secrets and
    config.
@y
{% comment %}
7.  Unless you are going to continue to the next example, clean up after running
    this example by removing the `nginx` service and the stored secrets and
    config.
{% endcomment %}
7.  この例を実行した後に、次に示す例は確認しないのであれば、`nginx` サービスと保存した secrets、config を削除します。
@z

@x
    ```bash
    $ docker service rm nginx
@y
    ```bash
    $ docker service rm nginx
@z

@x
    $ docker secret rm site.crt site.key
@y
    $ docker secret rm site.crt site.key
@z

@x
    $ docker config rm site.conf
    ```
@y
    $ docker config rm site.conf
    ```
@z

@x
You have now configured a Nginx service with its configuration decoupled from
its image. You could run multiple sites with exactly the same image but
separate configurations, without the need to build a custom image at all.
@y
{% comment %}
You have now configured a Nginx service with its configuration decoupled from
its image. You could run multiple sites with exactly the same image but
separate configurations, without the need to build a custom image at all.
{% endcomment %}
ここまでの例から Nginx サービスの設定内容を、そのイメージから切り離した形で実現しました。
まったく同じイメージを使い異なる設定によって複数サイトを提供しようと思ったら、もう新たなイメージをビルドする必要はなくなったわけです。
@z

@x
### Example: Rotate a config
@y
{% comment %}
### Example: Rotate a config
{% endcomment %}
### 例： config の入れ替え
{: #example-rotate-a-config }
@z

@x
To rotate a config, you first save a new config with a different name than the
one that is currently in use. You then redeploy the service, removing the old
config and adding the new config at the same mount point within the container.
This example builds upon the previous one by rotating the `site.conf`
configuration file.
@y
{% comment %}
To rotate a config, you first save a new config with a different name than the
one that is currently in use. You then redeploy the service, removing the old
config and adding the new config at the same mount point within the container.
This example builds upon the previous one by rotating the `site.conf`
configuration file.
{% endcomment %}
config を入れ替えるには、まず新たな config を、現在利用している config とは別の名前で保存しておきます。
そしてサービスを再デプロイし、古い config を削除して、コンテナー内の同一マウントポイントに新たな config を追加します。
ここに示す例では、前述の例をもとにして、`site.conf` という設定ファイルを切り替える方法を示します。
@z

@x
1.  Edit the `site.conf` file locally. Add `index.php` to the `index` line, and
    save the file.
@y
{% comment %}
1.  Edit the `site.conf` file locally. Add `index.php` to the `index` line, and
    save the file.
{% endcomment %}
1.  ローカルの `site.conf` ファイルを編集します。
    `index` 行に `index.php` を追加し保存します。
@z

@x
    ```none
    server {
        listen                443 ssl;
        server_name           localhost;
        ssl_certificate       /run/secrets/site.crt;
        ssl_certificate_key   /run/secrets/site.key;
@y
    ```none
    server {
        listen                443 ssl;
        server_name           localhost;
        ssl_certificate       /run/secrets/site.crt;
        ssl_certificate_key   /run/secrets/site.key;
@z

@x
        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm index.php;
        }
    }
    ```
@y
        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm index.php;
        }
    }
    ```
@z

@x
2.  Create a new Docker config using the new `site.conf`, called `site-v2.conf`.
@y
{% comment %}
2.  Create a new Docker config using the new `site.conf`, called `site-v2.conf`.
{% endcomment %}
2.  上の `site.conf` ファイルを使って、新たな`site-v2.conf` という Docker config を生成します。
@z

@x
    ```bah
    $ docker config create site-v2.conf site.conf
    ```
@y
    ```bash
    $ docker config create site-v2.conf site.conf
    ```
@z

@x
3.  Update the `nginx` service to use the new config instead of the old one.
@y
{% comment %}
3.  Update the `nginx` service to use the new config instead of the old one.
{% endcomment %}
3.  `nginx` サービスを更新して、古い config から新しい config を利用するようにします。
@z

@x
    ```bash
    $ docker service update \
      --config-rm site.conf \
      --config-add source=site-v2.conf,target=/etc/nginx/conf.d/site.conf,mode=0440 \
      nginx
    ```
@y
    ```bash
    $ docker service update \
      --config-rm site.conf \
      --config-add source=site-v2.conf,target=/etc/nginx/conf.d/site.conf,mode=0440 \
      nginx
    ```
@z

@x
4.  Verify that the `nginx` service is fully re-deployed, using
    `docker service ps nginx`. When it is, you can remove the old `site.conf`
    config.
@y
{% comment %}
4.  Verify that the `nginx` service is fully re-deployed, using
    `docker service ps nginx`. When it is, you can remove the old `site.conf`
    config.
{% endcomment %}
4.  `docker service ps nginx` を実行して、`nginx` サービスが問題なく再デプロイされていることを確認します。
    正常であれば、古い config つまり `site.conf` を削除します。
@z

@x
    ```bash
    $ docker config rm site.conf
    ```
@y
    ```bash
    $ docker config rm site.conf
    ```
@z

@x
5.  To clean up, you can remove the `nginx` service, as well as the secrets and
    configs.
@y
{% comment %}
5.  To clean up, you can remove the `nginx` service, as well as the secrets and
    configs.
{% endcomment %}
5.  クリーンアップします。
    `nginx` サービスを削除し、同じく secrets と configs も削除します。
@z

@x
    ```bash
    $ docker service rm nginx
@y
    ```bash
    $ docker service rm nginx
@z

@x
    $ docker secret rm site.crt site.key
@y
    $ docker secret rm site.crt site.key
@z

@x
    $ docker config rm site-v2.conf
    ```
@y
    $ docker config rm site-v2.conf
    ```
@z

@x
You have now updated your `nginx` service's configuration without the need to
rebuild its image.
@y
{% comment %}
You have now updated your `nginx` service's configuration without the need to
rebuild its image.
{% endcomment %}
こうして `nginx` サービスの設定は、イメージを再ビルドすることなく更新することができました。
@z
