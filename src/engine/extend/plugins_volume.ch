%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "How to manage data with external volume plugins"
keywords: "Examples, Usage, volume, docker, data, volumes, plugin, api"
---
@y
---
description: "外部ボリュームプラグインを使ってどのようにデータ管理を行うか。"
keywords: "Examples, Usage, volume, docker, data, volumes, plugin, api"
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
# Docker volume plugins
@y
{% comment %}
# Docker volume plugins
{% endcomment %}
# Docker ボリュームプラグイン
{: #docker-volume-plugins }
@z

@x
Docker Engine volume plugins enable Engine deployments to be integrated with
external storage systems such as Amazon EBS, and enable data volumes to persist
beyond the lifetime of a single Docker host. See the
[plugin documentation](legacy_plugins.md) for more information.
@y
{% comment %}
Docker Engine volume plugins enable Engine deployments to be integrated with
external storage systems such as Amazon EBS, and enable data volumes to persist
beyond the lifetime of a single Docker host. See the
[plugin documentation](legacy_plugins.md) for more information.
{% endcomment %}
Docker Engine ボリュームプラグインは、Amazon EBS のような外部ストレージシステムと統合した Engine デプロイメントを可能にするものです。
そして単独の Docker ホスト上では維持できない、データボリュームの長期保存を可能にします。
詳細は [プラグインのドキュメント](legacy_plugins.md) を参照してください。
@z

@x
## Changelog
@y
{% comment %}
## Changelog
{% endcomment %}
{: #changelog }
## 変更履歴
@z

@x
### 1.13.0
@y
### 1.13.0
@z

@x
- If used as part of the v2 plugin architecture, mountpoints that are part of
  paths returned by the plugin must be mounted under the directory specified by
  `PropagatedMount` in the plugin configuration
  ([#26398](https://github.com/docker/docker/pull/26398))
@y
{% comment %}
- If used as part of the v2 plugin architecture, mountpoints that are part of
  paths returned by the plugin must be mounted under the directory specified by
  `PropagatedMount` in the plugin configuration
  ([#26398](https://github.com/docker/docker/pull/26398))
{% endcomment %}
- プラグインアーキテクチャー v2 を部分的に用いている場合、プラグインにより返されるパスで構成される mountpoints は、プラグイン設定内の `PropagatedMount` によって指定されるディレクトリ配下にマウントされるべき。
  ([#26398](https://github.com/docker/docker/pull/26398))
@z

@x
### 1.12.0
@y
### 1.12.0
@z

@x
- Add `Status` field to `VolumeDriver.Get` response
  ([#21006](https://github.com/docker/docker/pull/21006#))
- Add `VolumeDriver.Capabilities` to get capabilities of the volume driver
  ([#22077](https://github.com/docker/docker/pull/22077))
@y
{% comment %}
- Add `Status` field to `VolumeDriver.Get` response
  ([#21006](https://github.com/docker/docker/pull/21006#))
- Add `VolumeDriver.Capabilities` to get capabilities of the volume driver
  ([#22077](https://github.com/docker/docker/pull/22077))
{% endcomment %}
- `VolumeDriver.Get` レスポンスに `Status` フィールドを追加。
  ([#21006](https://github.com/docker/docker/pull/21006#))
- `VolumeDriver.Capabilities` の追加。ボリュームドライバーのケーパビリティ（capability）を取得する。
  ([#22077](https://github.com/docker/docker/pull/22077))
@z

@x
### 1.10.0
@y
### 1.10.0
@z

@x
- Add `VolumeDriver.Get` which gets the details about the volume
  ([#16534](https://github.com/docker/docker/pull/16534))
- Add `VolumeDriver.List` which lists all volumes owned by the driver
  ([#16534](https://github.com/docker/docker/pull/16534))
@y
{% comment %}
- Add `VolumeDriver.Get` which gets the details about the volume
  ([#16534](https://github.com/docker/docker/pull/16534))
- Add `VolumeDriver.List` which lists all volumes owned by the driver
  ([#16534](https://github.com/docker/docker/pull/16534))
{% endcomment %}
- `VolumeDriver.Get` の追加。 ボリュームの詳細情報を取得する。
  ([#16534](https://github.com/docker/docker/pull/16534))
- `VolumeDriver.List` の追加。 ドライバーが所有する全ボリューム一覧を取得する。
  ([#16534](https://github.com/docker/docker/pull/16534))
@z

@x
### 1.8.0
@y
### 1.8.0
@z

@x
- Initial support for volume driver plugins
  ([#14659](https://github.com/docker/docker/pull/14659))
@y
{% comment %}
- Initial support for volume driver plugins
  ([#14659](https://github.com/docker/docker/pull/14659))
{% endcomment %}
- ボリュームドライバープラグインに対する初めてのサポート。
  ([#14659](https://github.com/docker/docker/pull/14659))
@z

@x
## Command-line changes
@y
{% comment %}
## Command-line changes
{% endcomment %}
{: #command-line-changes }
## コマンドラインによる変更
@z

@x
To give a container access to a volume, use the `--volume` and `--volume-driver`
flags on the `docker container run` command.  The `--volume` (or `-v`) flag
accepts a volume name and path on the host, and the `--volume-driver` flag
accepts a driver type.
@y
{% comment %}
To give a container access to a volume, use the `--volume` and `--volume-driver`
flags on the `docker container run` command.  The `--volume` (or `-v`) flag
accepts a volume name and path on the host, and the `--volume-driver` flag
accepts a driver type.
{% endcomment %}
コンテナーからボリュームへアクセスするためには、`docker container run` コマンドの `--volume` フラグや `--volume-driver` フラグを用います。
`--volume` （または `-v`）フラグは、ボリューム名とホスト上のパスを指定します。
また `--volume-driver` フラグはドライバータイプを指定します。
@z

@x
```bash
$ docker volume create --driver=flocker volumename
@y
```bash
$ docker volume create --driver=flocker volumename
@z

@x
$ docker container run -it --volume volumename:/data busybox sh
```
@y
$ docker container run -it --volume volumename:/data busybox sh
```
@z

@x
### `--volume`
@y
### `--volume`
@z

@x
The `--volume` (or `-v`) flag takes a value that is in the format
`<volume_name>:<mountpoint>`. The two parts of the value are
separated by a colon (`:`) character.
@y
{% comment %}
The `--volume` (or `-v`) flag takes a value that is in the format
`<volume_name>:<mountpoint>`. The two parts of the value are
separated by a colon (`:`) character.
{% endcomment %}
`--volume` （または `-v`）フラグは `<volume_name>:<mountpoint>` という書式の値をとります。
この値の 2 つの部分はコロン（`:`）によって区切ります。
@z

@x
- The volume name is a human-readable name for the volume, and cannot begin with
  a `/` character. It is referred to as `volume_name` in the rest of this topic.
- The `Mountpoint` is the path on the host (v1) or in the plugin (v2) where the
  volume has been made available.
@y
{% comment %}
- The volume name is a human-readable name for the volume, and cannot begin with
  a `/` character. It is referred to as `volume_name` in the rest of this topic.
- The `Mountpoint` is the path on the host (v1) or in the plugin (v2) where the
  volume has been made available.
{% endcomment %}
- ボリューム名は、人間が読み取れる文字を使って、ボリュームにつけた名前のことです。
  `/` で始めることはできません。
  これ以降では `volume_name` と呼び表わすことにします。
- `Mountpoint` は、ホスト上のパス（v1 の場合）、またはプラグイン内のパス（v2 の場合）のいずれかであり、ボリュームが生成されている場所を示します。
@z

@x
### `volumedriver`
@y
### `volumedriver`
@z

@x
Specifying a `volumedriver` in conjunction with a `volumename` allows you to
use plugins such as [Flocker](https://github.com/ScatterHQ/flocker) to manage
volumes external to a single host, such as those on EBS.
@y
{% comment %}
Specifying a `volumedriver` in conjunction with a `volumename` allows you to
use plugins such as [Flocker](https://github.com/ScatterHQ/flocker) to manage
volumes external to a single host, such as those on EBS.
{% endcomment %}
`volumename` とともに `volumedriver` を指定すると、[Flocker](https://github.com/ScatterHQ/flocker) のようなプラグインが利用できるようになります。
これにより自ホストから、EBS 上などの外部にあるボリュームを管理できるようになります。
@z

@x
## Create a VolumeDriver
@y
{% comment %}
## Create a VolumeDriver
{% endcomment %}
{: #create-a-volumedriver }
## VolumeDriver の生成
@z

@x
The container creation endpoint (`/containers/create`) accepts a `VolumeDriver`
field of type `string` allowing to specify the name of the driver. If not
specified, it defaults to `"local"` (the default driver for local volumes).
@y
{% comment %}
The container creation endpoint (`/containers/create`) accepts a `VolumeDriver`
field of type `string` allowing to specify the name of the driver. If not
specified, it defaults to `"local"` (the default driver for local volumes).
{% endcomment %}
コンテナーの生成エンドポイント（`/containers/create`）は、`string` 型の `VolumeDriver` を受け付け、ドライバー名を指定することができます。
指定されていない場合は、デフォルトの `"local"` になります。
（デフォルトドライバーはローカルボリューム向けのものです。）
@z

@x
## Volume plugin protocol
@y
{% comment %}
## Volume plugin protocol
{% endcomment %}
{: #volume-plugin-protocol }
## ボリュームプラグインプロトコル
@z

@x
If a plugin registers itself as a `VolumeDriver` when activated, it must
provide the Docker Daemon with writeable paths on the host filesystem. The Docker
daemon provides these paths to containers to consume. The Docker daemon makes
the volumes available by bind-mounting the provided paths into the containers.
@y
{% comment %}
If a plugin registers itself as a `VolumeDriver` when activated, it must
provide the Docker Daemon with writeable paths on the host filesystem. The Docker
daemon provides these paths to containers to consume. The Docker daemon makes
the volumes available by bind-mounting the provided paths into the containers.
{% endcomment %}
プラグインが有効化される際に `VolumeDriver` として自分自身を登録するのであれば、このプラグインは Docker デーモンに対して、ホストファイルシステム上の書き込み可能なパスを提供しなければなりません。
Docker デーモンはそのパスをコンテナーに提供して利用させます。
Docker デーモンはボリュームを利用できるようにするために、そのパスをバインドマウントしてコンテナーに提供しています。
@z

@x
> **Note**: Volume plugins should *not* write data to the `/var/lib/docker/`
> directory, including `/var/lib/docker/volumes`. The `/var/lib/docker/`
> directory is reserved for Docker.
@y
{% comment %}
> **Note**: Volume plugins should *not* write data to the `/var/lib/docker/`
> directory, including `/var/lib/docker/volumes`. The `/var/lib/docker/`
> directory is reserved for Docker.
{% endcomment %}
> **メモ**: ボリュームプラグインは、`/var/lib/docker/` ディレクトリや `/var/lib/docker/volumes` にデータ書き込みを行っては**いけません**。
> `/var/lib/docker/` ディレクトリは Docker により予約されています。
@z

@x
### `/VolumeDriver.Create`
@y
### `/VolumeDriver.Create`
@z

@x
**Request**:
```json
{
    "Name": "volume_name",
    "Opts": {}
}
```
@y
{% comment %}
**Request**:
```json
{
    "Name": "volume_name",
    "Opts": {}
}
```
{% endcomment %}
**リクエスト**
```json
{
    "Name": "volume_name",
    "Opts": {}
}
```
@z

@x
Instruct the plugin that the user wants to create a volume, given a user
specified volume name. The plugin does not need to actually manifest the
volume on the filesystem yet (until `Mount` is called).
`Opts` is a map of driver specific options passed through from the user request.
@y
{% comment %}
Instruct the plugin that the user wants to create a volume, given a user
specified volume name. The plugin does not need to actually manifest the
volume on the filesystem yet (until `Mount` is called).
`Opts` is a map of driver specific options passed through from the user request.
{% endcomment %}
プラグインに対して、指定するボリューム名によりユーザーがボリュームを生成したいということを伝えます。
プラグインはこのとき、ファイルシステム上のボリュームを明らかにすることは、（`Mount` が呼び出されるまでは）まだ必要ではありません。
`Opts` は、ユーザーリクエストを通じて受け渡されるドライバー固有オプションのマッピングです。
@z

@x
**Response**:
```json
{
    "Err": ""
}
```
@y
{% comment %}
**Response**:
```json
{
    "Err": ""
}
```
{% endcomment %}
**レスポンス**
```json
{
    "Err": ""
}
```
@z

@x
Respond with a string error if an error occurred.
@y
{% comment %}
Respond with a string error if an error occurred.
{% endcomment %}
エラーが発生した場合は、文字列によるエラーを返します。
@z

@x
### `/VolumeDriver.Remove`
@y
### `/VolumeDriver.Remove`
@z

@x
**Request**:
```json
{
    "Name": "volume_name"
}
```
@y
{% comment %}
**Request**:
```json
{
    "Name": "volume_name"
}
```
{% endcomment %}
**リクエスト**
```json
{
    "Name": "volume_name"
}
```
@z

@x
Delete the specified volume from disk. This request is issued when a user
invokes `docker rm -v` to remove volumes associated with a container.
@y
{% comment %}
Delete the specified volume from disk. This request is issued when a user
invokes `docker rm -v` to remove volumes associated with a container.
{% endcomment %}
指定されたボリュームをディスク上から削除します。
このリクエストは  `docker rm -v` により、関連づいたコンテナーからボリュームを削除する際に実行されます。
@z

@x
**Response**:
```json
{
    "Err": ""
}
```
@y
{% comment %}
**Response**:
```json
{
    "Err": ""
}
```
{% endcomment %}
**レスポンス**
```json
{
    "Err": ""
}
```
@z

@x
Respond with a string error if an error occurred.
@y
{% comment %}
Respond with a string error if an error occurred.
{% endcomment %}
エラーが発生した場合は、文字列によるエラーを返します。
@z

@x
### `/VolumeDriver.Mount`
@y
### `/VolumeDriver.Mount`
@z

@x
**Request**:
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
@y
{% comment %}
**Request**:
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
{% endcomment %}
**リクエスト**
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
@z

@x
Docker requires the plugin to provide a volume, given a user specified volume
name. `Mount` is called once per container start. If the same `volume_name` is requested
more than once, the plugin may need to keep track of each new mount request and provision
at the first mount request and deprovision at the last corresponding unmount request.
@y
{% comment %}
Docker requires the plugin to provide a volume, given a user specified volume
name. `Mount` is called once per container start. If the same `volume_name` is requested
more than once, the plugin may need to keep track of each new mount request and provision
at the first mount request and deprovision at the last corresponding unmount request.
{% endcomment %}
Docker は、ユーザーが指定するボリューム名によるボリュームを提供するものとして、このプラグインを必要とします。
`Mount` はコンテナーが起動するたびに 1 回だけ呼び出されます。
`volume_name` が重複して要求された場合、プラグインは各マウント要求を記録しておく必要があります。
そしてマウントが要求されたときにマウント処理を行い、これに対応するアンマウントの要求のときにマウント解除を行うことになります。
@z

@x
`ID` is a unique ID for the caller that is requesting the mount.
@y
{% comment %}
`ID` is a unique ID for the caller that is requesting the mount.
{% endcomment %}
`ID` は、マウントを要求する呼び出し側の固有 ID です。
@z

@x
**Response**:
@y
{% comment %}
**Response**:
{% endcomment %}
**レスポンス**
@z

@x
- **v1**:
@y
{% comment %}
- **v1**:
{% endcomment %}
- **v1**
@z

@x
  ```json
  {
      "Mountpoint": "/path/to/directory/on/host",
      "Err": ""
  }
  ```
@y
  ```json
  {
      "Mountpoint": "/path/to/directory/on/host",
      "Err": ""
  }
  ```
@z

@x
- **v2**:
@y
{% comment %}
- **v2**:
{% endcomment %}
- **v2**
@z

@x
  ```json
  {
      "Mountpoint": "/path/under/PropagatedMount",
      "Err": ""
  }
  ```
@y
  ```json
  {
      "Mountpoint": "/path/under/PropagatedMount",
      "Err": ""
  }
  ```
@z

@x
`Mountpoint` is the path on the host (v1) or in the plugin (v2) where the volume
has been made available.
@y
{% comment %}
`Mountpoint` is the path on the host (v1) or in the plugin (v2) where the volume
has been made available.
{% endcomment %}
`Mountpoint` は、ホスト上のパス（v1 の場合）、またはプラグイン内のパス（v2 の場合）のいずれかであり、ボリュームが生成されている場所を示します。
@z

@x
`Err` is either empty or contains an error string.
@y
{% comment %}
`Err` is either empty or contains an error string.
{% endcomment %}
`Err` は空か、あるいはエラー文字列を含みます。
@z

@x
### `/VolumeDriver.Path`
@y
### `/VolumeDriver.Path`
@z

@x
**Request**:
@y
{% comment %}
**Request**:
{% endcomment %}
**リクエスト**
@z

@x
```json
{
    "Name": "volume_name"
}
```
@y
```json
{
    "Name": "volume_name"
}
```
@z

@x
Request the path to the volume with the given `volume_name`.
@y
{% comment %}
Request the path to the volume with the given `volume_name`.
{% endcomment %}
指定された `volume_name` のボリュームに対してパスを要求します。
@z

@x
**Response**:
@y
{% comment %}
**Response**:
{% endcomment %}
**レスポンス**
@z

@x
- **v1**:
@y
{% comment %}
- **v1**:
{% endcomment %}
- **v1**
@z

@x
  ```json
  {
      "Mountpoint": "/path/to/directory/on/host",
      "Err": ""
  }
  ```
@y
  ```json
  {
      "Mountpoint": "/path/to/directory/on/host",
      "Err": ""
  }
  ```
@z

@x
- **v2**:
@y
{% comment %}
- **v2**:
{% endcomment %}
- **v2**
@z

@x
  ```json
  {
      "Mountpoint": "/path/under/PropagatedMount",
      "Err": ""
  }
  ```
@y
  ```json
  {
      "Mountpoint": "/path/under/PropagatedMount",
      "Err": ""
  }
  ```
@z

@x
Respond with the path on the host (v1) or inside the plugin (v2) where the
volume has been made available, and/or a string error if an error occurred.
@y
{% comment %}
Respond with the path on the host (v1) or inside the plugin (v2) where the
volume has been made available, and/or a string error if an error occurred.
{% endcomment %}
ホスト上のパス（v1 の場合）、またはプラグイン内のパス（v2 の場合）のいずれか、ボリュームが生成されている場所を返します。
エラーが発生した場合は、文字列によるエラーを返します。
@z

@x
`Mountpoint` is optional. However, the plugin may be queried again later if one
is not provided.
@y
{% comment %}
`Mountpoint` is optional. However, the plugin may be queried again later if one
is not provided.
{% endcomment %}
`Mountpoint` は常に必要なものではありません。
ただしプラグインが利用できない状態になったときに、もう一度検索のために利用できます。
@z

@x
### `/VolumeDriver.Unmount`
@y
### `/VolumeDriver.Unmount`
@z

@x
**Request**:
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
@y
{% comment %}
**Request**:
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
{% endcomment %}
**リクエスト**
```json
{
    "Name": "volume_name",
    "ID": "b87d7442095999a92b65b3d9691e697b61713829cc0ffd1bb72e4ccd51aa4d6c"
}
```
@z

@x
Docker is no longer using the named volume. `Unmount` is called once per
container stop. Plugin may deduce that it is safe to deprovision the volume at
this point.
@y
{% comment %}
Docker is no longer using the named volume. `Unmount` is called once per
container stop. Plugin may deduce that it is safe to deprovision the volume at
this point.
{% endcomment %}
Docker は名前つきボリュームを利用していません。
`Unmount` はコンテナーが停止するたびに 1 回だけ呼び出されます。
プラグインは、この時点でボリュームを削除しておくのが安全かもしれません。
@z

@x
`ID` is a unique ID for the caller that is requesting the mount.
@y
{% comment %}
`ID` is a unique ID for the caller that is requesting the mount.
{% endcomment %}
`ID` は、アンマウントを要求する呼び出し側の固有 ID です。
@z

@x
**Response**:
```json
{
    "Err": ""
}
```
@y
{% comment %}
**Response**:
```json
{
    "Err": ""
}
```
{% endcomment %}
**レスポンス**
```json
{
    "Err": ""
}
```
@z

@x
Respond with a string error if an error occurred.
@y
{% comment %}
Respond with a string error if an error occurred.
{% endcomment %}
エラーが発生した場合は、文字列によるエラーを返します。
@z

@x
### `/VolumeDriver.Get`
@y
### `/VolumeDriver.Get`
@z

@x
**Request**:
```json
{
    "Name": "volume_name"
}
```
@y
{% comment %}
**Request**:
```json
{
    "Name": "volume_name"
}
```
{% endcomment %}
**リクエスト**
```json
{
    "Name": "volume_name"
}
```
@z

@x
Get info about `volume_name`.
@y
{% comment %}
Get info about `volume_name`.
{% endcomment %}
`volume_name` に関する情報を取得します。
@z

@x
**Response**:
@y
{% comment %}
**Response**:
{% endcomment %}
**レスポンス**
@z

@x
- **v1**:
@y
{% comment %}
- **v1**:
{% endcomment %}
- **v1**
@z

@x
  ```json
  {
    "Volume": {
      "Name": "volume_name",
      "Mountpoint": "/path/to/directory/on/host",
      "Status": {}
    },
    "Err": ""
  }
  ```
@y
  ```json
  {
    "Volume": {
      "Name": "volume_name",
      "Mountpoint": "/path/to/directory/on/host",
      "Status": {}
    },
    "Err": ""
  }
  ```
@z

@x
- **v2**:
@y
{% comment %}
- **v2**:
{% endcomment %}
- **v2**
@z

@x
  ```json
  {
    "Volume": {
      "Name": "volume_name",
      "Mountpoint": "/path/under/PropagatedMount",
      "Status": {}
    },
    "Err": ""
  }
  ```
@y
  ```json
  {
    "Volume": {
      "Name": "volume_name",
      "Mountpoint": "/path/under/PropagatedMount",
      "Status": {}
    },
    "Err": ""
  }
  ```
@z

@x
Respond with a string error if an error occurred. `Mountpoint` and `Status` are
optional.
@y
{% comment %}
Respond with a string error if an error occurred. `Mountpoint` and `Status` are
optional.
{% endcomment %}
エラーが発生した場合は、文字列によるエラーを返します。
`Mountpoint` と `Status` は常に必要なものではありません。
@z

@x
### /VolumeDriver.List
@y
### `/VolumeDriver.List`
@z

@x
**Request**:
```json
{}
```
@y
{% comment %}
**Request**:
```json
{}
```
{% endcomment %}
**リクエスト**
```json
{}
```
@z

@x
Get the list of volumes registered with the plugin.
@y
{% comment %}
Get the list of volumes registered with the plugin.
{% endcomment %}
プラグインに登録されているボリュームの一覧を取得します。
@z

@x
**Response**:
@y
{% comment %}
**Response**:
{% endcomment %}
**レスポンス**
@z

@x
- **v1**:
@y
{% comment %}
- **v1**:
{% endcomment %}
- **v1**
@z

@x
  ```json
  {
    "Volumes": [
      {
        "Name": "volume_name",
        "Mountpoint": "/path/to/directory/on/host"
      }
    ],
    "Err": ""
  }
  ```
@y
  ```json
  {
    "Volumes": [
      {
        "Name": "volume_name",
        "Mountpoint": "/path/to/directory/on/host"
      }
    ],
    "Err": ""
  }
  ```
@z

@x
- **v2**:
@y
{% comment %}
- **v2**:
{% endcomment %}
- **v2**
@z

@x
  ```json
  {
    "Volumes": [
      {
        "Name": "volume_name",
        "Mountpoint": "/path/under/PropagatedMount"
      }
    ],
    "Err": ""
  }
  ```
@y
  ```json
  {
    "Volumes": [
      {
        "Name": "volume_name",
        "Mountpoint": "/path/under/PropagatedMount"
      }
    ],
    "Err": ""
  }
  ```
@z

@x
Respond with a string error if an error occurred. `Mountpoint` is optional.
@y
{% comment %}
Respond with a string error if an error occurred. `Mountpoint` is optional.
{% endcomment %}
エラーが発生した場合は、文字列によるエラーを返します。
`Mountpoint` は常に必要なものではありません。
@z

@x
### /VolumeDriver.Capabilities
@y
### `/VolumeDriver.Capabilities`
@z

@x
**Request**:
```json
{}
```
@y
{% comment %}
**Request**:
```json
{}
```
{% endcomment %}
**リクエスト**
```json
{}
```
@z

@x
Get the list of capabilities the driver supports.
@y
{% comment %}
Get the list of capabilities the driver supports.
{% endcomment %}
ドライバーがサポートするケーパビリティ（capability）の一覧を取得します。
@z

@x
The driver is not required to implement `Capabilities`. If it is not
implemented, the default values are used.
@y
{% comment %}
The driver is not required to implement `Capabilities`. If it is not
implemented, the default values are used.
{% endcomment %}
ドライバーは必ず `Capalibities` を実装しなければならないわけではありません。
実装されていなければデフォルトの値が用いられます。
@z

@x
**Response**:
```json
{
  "Capabilities": {
    "Scope": "global"
  }
}
```
@y
{% comment %}
**Response**:
```json
{
  "Capabilities": {
    "Scope": "global"
  }
}
```
{% endcomment %}
**レスポンス**
```json
{
  "Capabilities": {
    "Scope": "global"
  }
}
```
@z

@x
Supported scopes are `global` and `local`. Any other value in `Scope` will be
ignored, and `local` is used. `Scope` allows cluster managers to handle the
volume in different ways. For instance, a scope of `global`, signals to the
cluster manager that it only needs to create the volume once instead of on each
Docker host. More capabilities may be added in the future.
@y
{% comment %}
Supported scopes are `global` and `local`. Any other value in `Scope` will be
ignored, and `local` is used. `Scope` allows cluster managers to handle the
volume in different ways. For instance, a scope of `global`, signals to the
cluster manager that it only needs to create the volume once instead of on each
Docker host. More capabilities may be added in the future.
{% endcomment %}
サポートされているスコープは `global` と `local` です。
`Scope` において他の値があると無視されて `local` が用いられます。
`Scope` はクラスターマネージャーに対して、さまざまな方法によりボリュームを取り扱えるようにします。
たとえば `global` スコープは、クラスターマネージャーに対して、ただ一度だけボリュームを生成すればよいことを伝えます。つまり Docker ホストの個々において、ボリューム生成は不要とします。
ケーパビリティの機能は将来、さらに充足されるかもしれません。
@z
