%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Develop and use a plugin with the managed plugin system
keywords: "API, Usage, plugins, documentation, developer"
---
@y
---
description: Develop and use a plugin with the managed plugin system
keywords: "API, Usage, plugins, documentation, developer"
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
# Docker Engine managed plugin system
@y
{% comment %}
# Docker Engine managed plugin system
{% endcomment %}
{: #docker-engine-managed-plugin-system }
# Docker Engine が管理するプラグインシステム
@z

@x
* [Installing and using a plugin](index.md#installing-and-using-a-plugin)
* [Developing a plugin](index.md#developing-a-plugin)
* [Debugging plugins](index.md#debugging-plugins)
@y
{% comment %}
* [Installing and using a plugin](index.md#installing-and-using-a-plugin)
* [Developing a plugin](index.md#developing-a-plugin)
* [Debugging plugins](index.md#debugging-plugins)
{% endcomment %}
* [プラグインのインストールと利用](index.md#installing-and-using-a-plugin)
* [プラグインの開発](index.md#developing-a-plugin)
* [プラグインのデバッグ](index.md#debugging-plugins)
@z

@x
Docker Engine's plugin system allows you to install, start, stop, and remove
plugins using Docker Engine.
@y
{% comment %}
Docker Engine's plugin system allows you to install, start, stop, and remove
plugins using Docker Engine.
{% endcomment %}
Docker Engine のプラグインシステムは Docker Engine を使って、プラグインのインストール、起動、停止、削除を行うものです。
@z

@x
For information about the legacy plugin system available in Docker Engine 1.12
and earlier, see [Understand legacy Docker Engine plugins](legacy_plugins.md).
@y
{% comment %}
For information about the legacy plugin system available in Docker Engine 1.12
and earlier, see [Understand legacy Docker Engine plugins](legacy_plugins.md).
{% endcomment %}
Docker Engine 1.12 またはそれ以前において利用可能な古いプラグインシステムに関しては [以前の Docker Engine プラグインの理解](legacy_plugins.md) を参照してください。
@z

@x
> **Note**: Docker Engine managed plugins are currently not supported
on Windows daemons.
@y
{% comment %}
> **Note**: Docker Engine managed plugins are currently not supported
on Windows daemons.
{% endcomment %}
> **メモ**: Docker Engine 管理のプラグインシステムは、現在 Windows デーモン上ではサポートされません。
@z

@x
## Installing and using a plugin
@y
{% comment %}
## Installing and using a plugin
{% endcomment %}
{: #installing-and-using-a-plugin }
## プラグインのインストールと利用
@z

@x
Plugins are distributed as Docker images and can be hosted on Docker Hub or on
a private registry.
@y
{% comment %}
Plugins are distributed as Docker images and can be hosted on Docker Hub or on
a private registry.
{% endcomment %}
プラグインは Docker イメージとして配布されます。
したがって Docker Hub やプライベートリポジトリからホスティングすることができます。
@z

@x
To install a plugin, use the `docker plugin install` command, which pulls the
plugin from Docker Hub or your private registry, prompts you to grant
permissions or capabilities if necessary, and enables the plugin.
@y
{% comment %}
To install a plugin, use the `docker plugin install` command, which pulls the
plugin from Docker Hub or your private registry, prompts you to grant
permissions or capabilities if necessary, and enables the plugin.
{% endcomment %}
プラグインのインストールには`docker plugin install`コマンドを用います。
このコマンドは Docker Hub やプライベートリポジトリからプラグインをプルして、必要に応じて権限や機能の追加を求めた上で、そのプラグインを有効にします。
@z

@x
To check the status of installed plugins, use the `docker plugin ls` command.
Plugins that start successfully are listed as enabled in the output.
@y
{% comment %}
To check the status of installed plugins, use the `docker plugin ls` command.
Plugins that start successfully are listed as enabled in the output.
{% endcomment %}
インストールされているプラグインを確認するには`docker plugin ls`コマンドを用います。
起動に成功しているプラグインは、有効なプラグインとして一覧に出力されます。
@z

@x
After a plugin is installed, you can use it as an option for another Docker
operation, such as creating a volume.
@y
{% comment %}
After a plugin is installed, you can use it as an option for another Docker
operation, such as creating a volume.
{% endcomment %}
プラグインをインストールしたら、たとえばボリューム生成などのように、それまでとは違った Docker 操作を行うことができます。
@z

@x
In the following example, you install the `sshfs` plugin, verify that it is
enabled, and use it to create a volume.
@y
{% comment %}
In the following example, you install the `sshfs` plugin, verify that it is
enabled, and use it to create a volume.
{% endcomment %}
以下の例では`sshfs`プラグインをインストールします。
これが有効化されていることを確認した上で、ボリューム生成に利用します。
@z

@x
> **Note**: This example is intended for instructional purposes only. Once the volume is created, your SSH password to the remote host will be exposed as plaintext when inspecting the volume. You should delete the volume as soon as you are done with the example.
@y
{% comment %}
> **Note**: This example is intended for instructional purposes only. Once the volume is created, your SSH password to the remote host will be exposed as plaintext when inspecting the volume. You should delete the volume as soon as you are done with the example.
{% endcomment %}
> **メモ**: この例は説明目的で示しているにすぎません。
> ボリュームが生成された後にボリューム詳細を確認すると、リモートホストの SSH パスワードが表示されてしまいます。
> したがってこの例による作業を終えたら、できるだけ早くにボリュームを削除するようにしてください。
@z

@x
1.  Install the `sshfs` plugin.
@y
{% comment %}
1.  Install the `sshfs` plugin.
{% endcomment %}
1.  `sshfs`プラグインをインストールします。
@z

@x
    ```bash
    $ docker plugin install vieux/sshfs

    Plugin "vieux/sshfs" is requesting the following privileges:
    - network: [host]
    - capabilities: [CAP_SYS_ADMIN]
    Do you grant the above permissions? [y/N] y

    vieux/sshfs
    ```
@y
    ```bash
    $ docker plugin install vieux/sshfs

    Plugin "vieux/sshfs" is requesting the following privileges:
    - network: [host]
    - capabilities: [CAP_SYS_ADMIN]
    Do you grant the above permissions? [y/N] y

    vieux/sshfs
    ```
@z

@x
    The plugin requests 2 privileges:
@y
    {% comment %}
    The plugin requests 2 privileges:
    {% endcomment %}
    このプラグインは 2 つの権限を要求しています。
@z

@x
    - It needs access to the `host` network.
    - It needs the `CAP_SYS_ADMIN` capability, which allows the plugin to run
    the `mount` command.
@y
    {% comment %}
    - It needs access to the `host` network.
    - It needs the `CAP_SYS_ADMIN` capability, which allows the plugin to run
    the `mount` command.
    {% endcomment %}
    - `host`ネットワークへのアクセスを必要とします。
    - ケーパビリティー`CAP_SYS_ADMIN`を必要とします。
      これによってプラグインから`mount`コマンドが実行できるようになります。
@z

@x
2.  Check that the plugin is enabled in the output of `docker plugin ls`.
@y
{% comment %}
2.  Check that the plugin is enabled in the output of `docker plugin ls`.
{% endcomment %}
2.  `docker plugin ls`の出力から、このプラグインが有効化されたことを確認します。
@z

@x
    ```bash
    $ docker plugin ls

    ID                    NAME                  TAG                 DESCRIPTION                   ENABLED
    69553ca1d789          vieux/sshfs           latest              the `sshfs` plugin            true
    ```
@y
    ```bash
    $ docker plugin ls

    ID                    NAME                  TAG                 DESCRIPTION                   ENABLED
    69553ca1d789          vieux/sshfs           latest              the `sshfs` plugin            true
    ```
@z

@x
3.  Create a volume using the plugin.
    This example mounts the `/remote` directory on host `1.2.3.4` into a
    volume named `sshvolume`.
@y
{% comment %}
3.  Create a volume using the plugin.
    This example mounts the `/remote` directory on host `1.2.3.4` into a
    volume named `sshvolume`.
{% endcomment %}
3.  プラグインを利用してボリュームを生成します。
    この例では、ホスト`1.2.3.4`上の`/remote`ディレクトリを、`sshvolume`という名のボリュームとしてマウントします。
@z

@x
    This volume can now be mounted into containers.
@y
    {% comment %}
    This volume can now be mounted into containers.
    {% endcomment %}
    このボリュームはこうしてコンテナーにマウントされます。
@z

@x
    ```bash
    $ docker volume create \
      -d vieux/sshfs \
      --name sshvolume \
      -o sshcmd=user@1.2.3.4:/remote \
      -o password=$(cat file_containing_password_for_remote_host)

    sshvolume
    ```
@y
    ```bash
    $ docker volume create \
      -d vieux/sshfs \
      --name sshvolume \
      -o sshcmd=user@1.2.3.4:/remote \
      -o password=$(cat file_containing_password_for_remote_host)

    sshvolume
    ```
@z

@x
4.  Verify that the volume was created successfully.
@y
{% comment %}
4.  Verify that the volume was created successfully.
{% endcomment %}
4.  ボリュームの生成が成功したことを確認します。
@z

@x
    ```bash
    $ docker volume ls

    DRIVER              NAME
    vieux/sshfs         sshvolume
    ```
@y
    ```bash
    $ docker volume ls

    DRIVER              NAME
    vieux/sshfs         sshvolume
    ```
@z

@x
5.  Start a container that uses the volume `sshvolume`.
@y
{% comment %}
5.  Start a container that uses the volume `sshvolume`.
{% endcomment %}
5.  ボリューム`sshvolume`を利用するコンテナーを起動します。
@z

@x
    ```bash
    $ docker run --rm -v sshvolume:/data busybox ls /data

    <content of /remote on machine 1.2.3.4>
    ```
@y
    {% comment %}
    ```bash
    $ docker run --rm -v sshvolume:/data busybox ls /data

    <content of /remote on machine 1.2.3.4>
    ```
    {% endcomment %}
    ```bash
    $ docker run --rm -v sshvolume:/data busybox ls /data

    ＜マシン 1.2.3.4 の /remote の内容一覧＞
    ```
@z

@x
6.  Remove the volume `sshvolume`
@y
{% comment %}
6.  Remove the volume `sshvolume`
{% endcomment %}
6.  ボリューム`sshvolume`を削除します。
@z

@x
    ```bash
    docker volume rm sshvolume

    sshvolume
    ```
@y
    ```bash
    docker volume rm sshvolume

    sshvolume
    ```
@z

@x
To disable a plugin, use the `docker plugin disable` command. To completely
remove it, use the `docker plugin remove` command. For other available
commands and options, see the
[command line reference](../reference/commandline/index.md).
@y
{% comment %}
To disable a plugin, use the `docker plugin disable` command. To completely
remove it, use the `docker plugin remove` command. For other available
commands and options, see the
[command line reference](../reference/commandline/index.md).
{% endcomment %}
プラグインを無効にする場合は`docker plugin disable`コマンドを用います。
また完全に削除するには`docker plugin remove`コマンドを用います。
これ以外に利用可能なコマンドやオプションについては [コマンドラインリファレンス](../reference/commandline/index.md) を参照してください。
@z

@x
## Developing a plugin
@y
{% comment %}
## Developing a plugin
{% endcomment %}
{: #developing-a-plugin }
## プラグインの開発
@z

@x
#### The rootfs directory
@y
{% comment %}
#### The rootfs directory
{% endcomment %}
{: #the-rootfs-directory }
#### rootfs ディレクトリ
@z

@x
The `rootfs` directory represents the root filesystem of the plugin. In this
example, it was created from a Dockerfile:
@y
{% comment %}
The `rootfs` directory represents the root filesystem of the plugin. In this
example, it was created from a Dockerfile:
{% endcomment %}
`rootfs`ディレクトリはそのプラグインのルートファイルシステムを表わします。
以下の例においては Dockerfile から生成しています。
@z

@x
>**Note:** The `/run/docker/plugins` directory is mandatory inside of the
plugin's filesystem for docker to communicate with the plugin.
@y
{% comment %}
>**Note:** The `/run/docker/plugins` directory is mandatory inside of the
plugin's filesystem for docker to communicate with the plugin.
{% endcomment %}
>**メモ:** `/run/docker/plugins`ディレクトリはプラグインのファイルシステム上に存在している必要があります。
これは Docker がプラグインと通信を行うために用いられます。
@z

@x
```bash
$ git clone https://github.com/vieux/docker-volume-sshfs
$ cd docker-volume-sshfs
$ docker build -t rootfsimage .
$ id=$(docker create rootfsimage true) # id was cd851ce43a403 when the image was created
$ sudo mkdir -p myplugin/rootfs
$ sudo docker export "$id" | sudo tar -x -C myplugin/rootfs
$ docker rm -vf "$id"
$ docker rmi rootfsimage
```
@y
```bash
$ git clone https://github.com/vieux/docker-volume-sshfs
$ cd docker-volume-sshfs
$ docker build -t rootfsimage .
$ id=$(docker create rootfsimage true) # id was cd851ce43a403 when the image was created
$ sudo mkdir -p myplugin/rootfs
$ sudo docker export "$id" | sudo tar -x -C myplugin/rootfs
$ docker rm -vf "$id"
$ docker rmi rootfsimage
```
@z

@x
#### The config.json file
@y
{% comment %}
#### The config.json file
{% endcomment %}
{: #the-configjson-file }
#### config.json ファイル
@z

@x
The `config.json` file describes the plugin. See the [plugins config reference](config.md).
@y
{% comment %}
The `config.json` file describes the plugin. See the [plugins config reference](config.md).
{% endcomment %}
`config.json`ファイルはプラグインを記述するものです。
[プラグイン設定リファレンス](config.md) を参照してください。
@z

@x
Consider the following `config.json` file.
@y
{% comment %}
Consider the following `config.json` file.
{% endcomment %}
以下のような`config.json`ファイルがあったとします。
@z

@x
```json
{
	"description": "sshFS plugin for Docker",
	"documentation": "https://docs.docker.com/engine/extend/plugins/",
	"entrypoint": ["/docker-volume-sshfs"],
	"network": {
		   "type": "host"
		   },
	"interface" : {
		   "types": ["docker.volumedriver/1.0"],
		   "socket": "sshfs.sock"
	},
	"linux": {
		"capabilities": ["CAP_SYS_ADMIN"]
	}
}
```
@y
```json
{
	"description": "sshFS plugin for Docker",
	"documentation": "https://docs.docker.com/engine/extend/plugins/",
	"entrypoint": ["/docker-volume-sshfs"],
	"network": {
		   "type": "host"
		   },
	"interface" : {
		   "types": ["docker.volumedriver/1.0"],
		   "socket": "sshfs.sock"
	},
	"linux": {
		"capabilities": ["CAP_SYS_ADMIN"]
	}
}
```
@z

@x
This plugin is a volume driver. It requires a `host` network and the
`CAP_SYS_ADMIN` capability. It depends upon the `/docker-volume-sshfs`
entrypoint and uses the `/run/docker/plugins/sshfs.sock` socket to communicate
with Docker Engine. This plugin has no runtime parameters.
@y
{% comment %}
This plugin is a volume driver. It requires a `host` network and the
`CAP_SYS_ADMIN` capability. It depends upon the `/docker-volume-sshfs`
entrypoint and uses the `/run/docker/plugins/sshfs.sock` socket to communicate
with Docker Engine. This plugin has no runtime parameters.
{% endcomment %}
このプラグインは 1 つのボリュームドライバーです。
これは`host`ネットワークとケーパビリティー`CAP_SYS_ADMIN`を必要とします。
エントリーポイント`/docker-volume-sshfs`を持ち、ソケットとして`/run/docker/plugins/sshfs.sock`を用いて Docker Engine とやりとりを行います。
このプラグインに対しての実行パラメーターはありません。
@z

@x
#### Creating the plugin
@y
{% comment %}
#### Creating the plugin
{% endcomment %}
{: #creating-the-plugin }
#### プラグインの生成
@z

@x
A new plugin can be created by running
`docker plugin create <plugin-name> ./path/to/plugin/data` where the plugin
data contains a plugin configuration file `config.json` and a root filesystem
in subdirectory `rootfs`.
@y
{% comment %}
A new plugin can be created by running
`docker plugin create <plugin-name> ./path/to/plugin/data` where the plugin
data contains a plugin configuration file `config.json` and a root filesystem
in subdirectory `rootfs`.
{% endcomment %}
新たなプラグインは`docker plugin create <プラグイン名> ./path/to/plugin/data`を実行することで生成されます。
ここで`/path/to/plugin/data`は、プラグインの設定ファイル`config.json`が置かれていて、サブディレクトリ`rootfs`がこのプラグインのルートファイルシステムとなるようなディレクトリのことです。
@z

@x
After that the plugin `<plugin-name>` will show up in `docker plugin ls`.
Plugins can be pushed to remote registries with
`docker plugin push <plugin-name>`.
@y
{% comment %}
After that the plugin `<plugin-name>` will show up in `docker plugin ls`.
Plugins can be pushed to remote registries with
`docker plugin push <plugin-name>`.
{% endcomment %}
プラグインの生成後は`docker plugin ls`の実行によってそのプラグインの`<プラグイン名>`が表示されます。
プラグインは`docker plugin push <プラグイン名>`の実行により、リモートリポジトリにプッシュすることができます。
@z

@x
## Debugging plugins
@y
{% comment %}
## Debugging plugins
{% endcomment %}
{: #debugging-plugins }
## プラグインのデバッグ
@z

@x
Stdout of a plugin is redirected to dockerd logs. Such entries have a
`plugin=<ID>` suffix. Here are a few examples of commands for pluginID
`f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62` and their
corresponding log entries in the docker daemon logs.
@y
{% comment %}
Stdout of a plugin is redirected to dockerd logs. Such entries have a
`plugin=<ID>` suffix. Here are a few examples of commands for pluginID
`f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62` and their
corresponding log entries in the docker daemon logs.
{% endcomment %}
プラグインの標準出力は dockerd のログにリダイレクトされます。
ログエントリーには`plugin=<ID>`というサフィックスがつきます。
以下に示すコマンド利用例は、プラグイン ID `f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62` に対するものであり、これに対応する Docker デーモンのログエントリーを示しています。
@z

@x
```bash
$ docker plugin install tiborvass/sample-volume-plugin

INFO[0036] Starting...       Found 0 volumes on startup  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
```
@y
```bash
$ docker plugin install tiborvass/sample-volume-plugin

INFO[0036] Starting...       Found 0 volumes on startup  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
```
@z

@x
```bash
$ docker volume create -d tiborvass/sample-volume-plugin samplevol

INFO[0193] Create Called...  Ensuring directory /data/samplevol exists on host...  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0193] open /var/lib/docker/plugin-data/local-persist.json: no such file or directory  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0193]                   Created volume samplevol with mountpoint /data/samplevol  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0193] Path Called...    Returned path /data/samplevol  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
```
@y
```bash
$ docker volume create -d tiborvass/sample-volume-plugin samplevol

INFO[0193] Create Called...  Ensuring directory /data/samplevol exists on host...  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0193] open /var/lib/docker/plugin-data/local-persist.json: no such file or directory  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0193]                   Created volume samplevol with mountpoint /data/samplevol  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0193] Path Called...    Returned path /data/samplevol  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
```
@z

@x
```bash
$ docker run -v samplevol:/tmp busybox sh

INFO[0421] Get Called...     Found samplevol                plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0421] Mount Called...   Mounted samplevol              plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0421] Path Called...    Returned path /data/samplevol  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0421] Unmount Called... Unmounted samplevol            plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
```
@y
```bash
$ docker run -v samplevol:/tmp busybox sh

INFO[0421] Get Called...     Found samplevol                plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0421] Mount Called...   Mounted samplevol              plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0421] Path Called...    Returned path /data/samplevol  plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
INFO[0421] Unmount Called... Unmounted samplevol            plugin=f52a3df433b9aceee436eaada0752f5797aab1de47e5485f1690a073b860ff62
```
@z

@x
#### Using docker-runc to obtain logfiles and shell into the plugin.
@y
{% comment %}
#### Using docker-runc to obtain logfiles and shell into the plugin.
{% endcomment %}
{: #Using docker-runc to obtain logfiles and shell into the plugin. }
#### docker-runc によるログファイルおよびシェルの取得
@z

@x
`docker-runc`, the default docker container runtime can be used for debugging
plugins. This is specifically useful to collect plugin logs if they are
redirected to a file.
@y
{% comment %}
`docker-runc`, the default docker container runtime can be used for debugging
plugins. This is specifically useful to collect plugin logs if they are
redirected to a file.
{% endcomment %}
`docker-runc`はデフォルトの Docker コンテナーランタイムであり、プラグインのデバッグに利用します。
プラグインログがファイルに対してリダイレクト出力される場合に、そのログを収集する目的で活用することができます。
@z

@x
```bash
$ sudo docker-runc --root /var/run/docker/plugins/runtime-root/moby-plugins list

ID                                                                 PID         STATUS      BUNDLE                                                                                                                                       CREATED                          OWNER
93f1e7dbfe11c938782c2993628c895cf28e2274072c4a346a6002446c949b25   15806       running     /run/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby-plugins/93f1e7dbfe11c938782c2993628c895cf28e2274072c4a346a6002446c949b25   2018-02-08T21:40:08.621358213Z   root
9b4606d84e06b56df84fadf054a21374b247941c94ce405b0a261499d689d9c9   14992       running     /run/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby-plugins/9b4606d84e06b56df84fadf054a21374b247941c94ce405b0a261499d689d9c9   2018-02-08T21:35:12.321325872Z   root
c5bb4b90941efcaccca999439ed06d6a6affdde7081bb34dc84126b57b3e793d   14984       running     /run/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby-plugins/c5bb4b90941efcaccca999439ed06d6a6affdde7081bb34dc84126b57b3e793d   2018-02-08T21:35:12.321288966Z   root
```
@y
```bash
$ sudo docker-runc --root /var/run/docker/plugins/runtime-root/moby-plugins list

ID                                                                 PID         STATUS      BUNDLE                                                                                                                                       CREATED                          OWNER
93f1e7dbfe11c938782c2993628c895cf28e2274072c4a346a6002446c949b25   15806       running     /run/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby-plugins/93f1e7dbfe11c938782c2993628c895cf28e2274072c4a346a6002446c949b25   2018-02-08T21:40:08.621358213Z   root
9b4606d84e06b56df84fadf054a21374b247941c94ce405b0a261499d689d9c9   14992       running     /run/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby-plugins/9b4606d84e06b56df84fadf054a21374b247941c94ce405b0a261499d689d9c9   2018-02-08T21:35:12.321325872Z   root
c5bb4b90941efcaccca999439ed06d6a6affdde7081bb34dc84126b57b3e793d   14984       running     /run/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby-plugins/c5bb4b90941efcaccca999439ed06d6a6affdde7081bb34dc84126b57b3e793d   2018-02-08T21:35:12.321288966Z   root
```
@z

@x
```bash
$ sudo docker-runc --root /var/run/docker/plugins/runtime-root/moby-plugins exec 93f1e7dbfe11c938782c2993628c895cf28e2274072c4a346a6002446c949b25 cat /var/log/plugin.log
```
@y
```bash
$ sudo docker-runc --root /var/run/docker/plugins/runtime-root/moby-plugins exec 93f1e7dbfe11c938782c2993628c895cf28e2274072c4a346a6002446c949b25 cat /var/log/plugin.log
```
@z

@x
If the plugin has a built-in shell, then exec into the plugin can be done as
follows:
@y
{% comment %}
If the plugin has a built-in shell, then exec into the plugin can be done as
follows:
{% endcomment %}
プラグインにビルトインのシェルがある場合、プラグインに対する exec 実行を以下のように行うことができます。
@z

@x
```bash
$ sudo docker-runc --root /var/run/docker/plugins/runtime-root/moby-plugins exec -t 93f1e7dbfe11c938782c2993628c895cf28e2274072c4a346a6002446c949b25 sh
```
@y
```bash
$ sudo docker-runc --root /var/run/docker/plugins/runtime-root/moby-plugins exec -t 93f1e7dbfe11c938782c2993628c895cf28e2274072c4a346a6002446c949b25 sh
```
@z

@x
#### Using curl to debug plugin socket issues.
@y
{% comment %}
#### Using curl to debug plugin socket issues.
{% endcomment %}
{: #using-curl-to-debug-plugin-socket-issues }
#### curl 利用によるプラグインソケットデバッグ
@z

@x
To verify if the plugin API socket that the docker daemon communicates with
is responsive, use curl. In this example, we will make API calls from the
docker host to volume and network plugins using curl 7.47.0 to ensure that
the plugin is listening on the said socket. For a well functioning plugin,
these basic requests should work. Note that plugin sockets are available on the host under `/var/run/docker/plugins/<pluginID>`
@y
{% comment %}
To verify if the plugin API socket that the docker daemon communicates with
is responsive, use curl. In this example, we will make API calls from the
docker host to volume and network plugins using curl 7.47.0 to ensure that
the plugin is listening on the said socket. For a well functioning plugin,
these basic requests should work. Note that plugin sockets are available on the host under `/var/run/docker/plugins/<pluginID>`
{% endcomment %}
プラグイン API ソケットが Docker デーモンとのやりとりに反応するかどうかの確認には curl を用います。
以下の例では Docker ホストから curl 7.47.0 を利用して、ボリュームプラグインおよびネットワークプラグインに API 呼び出しを行っています。
これによってプラグインがソケットを待ち受けていることを確認します。
プラグイン機能が適正に構築されているものであれば、こういった基本的なリクエストが動作します。
なおプラグインソケットは、ホスト上の`/var/run/docker/plugins/<プラグインID>`において利用可能です。
@z

@x
```bash
curl -H "Content-Type: application/json" -XPOST -d '{}' --unix-socket /var/run/docker/plugins/e8a37ba56fc879c991f7d7921901723c64df6b42b87e6a0b055771ecf8477a6d/plugin.sock http:/VolumeDriver.List

{"Mountpoint":"","Err":"","Volumes":[{"Name":"myvol1","Mountpoint":"/data/myvol1"},{"Name":"myvol2","Mountpoint":"/data/myvol2"}],"Volume":null}
```
@y
```bash
curl -H "Content-Type: application/json" -XPOST -d '{}' --unix-socket /var/run/docker/plugins/e8a37ba56fc879c991f7d7921901723c64df6b42b87e6a0b055771ecf8477a6d/plugin.sock http:/VolumeDriver.List

{"Mountpoint":"","Err":"","Volumes":[{"Name":"myvol1","Mountpoint":"/data/myvol1"},{"Name":"myvol2","Mountpoint":"/data/myvol2"}],"Volume":null}
```
@z

@x
```bash
curl -H "Content-Type: application/json" -XPOST -d '{}' --unix-socket /var/run/docker/plugins/45e00a7ce6185d6e365904c8bcf62eb724b1fe307e0d4e7ecc9f6c1eb7bcdb70/plugin.sock http:/NetworkDriver.GetCapabilities

{"Scope":"local"}
```
@y
```bash
curl -H "Content-Type: application/json" -XPOST -d '{}' --unix-socket /var/run/docker/plugins/45e00a7ce6185d6e365904c8bcf62eb724b1fe307e0d4e7ecc9f6c1eb7bcdb70/plugin.sock http:/NetworkDriver.GetCapabilities

{"Scope":"local"}
```
@z

@x
When using curl 7.5 and above, the URL should be of the form
`http://hostname/APICall`, where `hostname` is the valid hostname where the
plugin is installed and `APICall` is the call to the plugin API.
@y
{% comment %}
When using curl 7.5 and above, the URL should be of the form
`http://hostname/APICall`, where `hostname` is the valid hostname where the
plugin is installed and `APICall` is the call to the plugin API.
{% endcomment %}
curl 7.5 またはそれ以降を利用する場合、URL の書式は`http://hostname/APICall`のようにします。
ここで`hostname`はプラグインがインストールされている正確なホスト名を指定し、`APICall`はプラグイン API 呼び出しを指定します。
@z

@x
For example, `http://localhost/VolumeDriver.List`
@y
{% comment %}
For example, `http://localhost/VolumeDriver.List`
{% endcomment %}
たとえば`http://localhost/VolumeDriver.List`のようにします。
@z
