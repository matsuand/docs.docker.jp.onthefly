%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Using tmpfs mounts
title: Use tmpfs mounts
keywords: storage, persistence, data persistence, tmpfs
redirect_from:
- /engine/admin/volumes/tmpfs/
---
@y
---
description: tmpfs マウントの利用。
title: tmpfs マウントの利用
keywords: storage, persistence, data persistence, tmpfs
redirect_from:
- /engine/admin/volumes/tmpfs/
---
@z

@x
[Volumes](volumes.md) and [bind mounts](bind-mounts.md) let you share files
between the host machine and container so that you can persist data even after
the container is stopped.
@y
{% comment %}
[Volumes](volumes.md) and [bind mounts](bind-mounts.md) let you share files
between the host machine and container so that you can persist data even after
the container is stopped.
{% endcomment %}
[ボリューム](volumes.md) や [バインドマウント](bind-mounts.md) を利用すれば、ホストマシンとコンテナー間にてファイル共有ができました。
これによりコンテナーが停止した後でも、データを保持できるようになります。
@z

@x
If you're running Docker on Linux, you have a third option: `tmpfs` mounts.
When you create a container with a `tmpfs` mount, the container can create
files outside the container's writable layer.
@y
{% comment %}
If you're running Docker on Linux, you have a third option: `tmpfs` mounts.
When you create a container with a `tmpfs` mount, the container can create
files outside the container's writable layer.
{% endcomment %}
Docker を Linux 上にて稼動させている場合は、さらに 3 つめの方法があります。
それが `tmpfs` マウントです。
`tmpfs` マウントを用いてコンテナーを生成した場合、コンテナーが書き込むファイルは、コンテナーの外部にある書き込みレイヤーに生成されます。
@z

@x
As opposed to volumes and bind mounts, a `tmpfs` mount is temporary, and only
persisted in the host memory. When the container stops, the `tmpfs` mount is
removed, and files written there won't be persisted.
@y
{% comment %}
As opposed to volumes and bind mounts, a `tmpfs` mount is temporary, and only
persisted in the host memory. When the container stops, the `tmpfs` mount is
removed, and files written there won't be persisted.
{% endcomment %}
ボリュームやバインドマウントとは違って `tmpfs` マウントは一時的なものであり、ホストマシンのメモリ上にのみ存在します。
コンテナーが停止されると `tmpfs` マウントは削除されてしまうため、そこに書き込まれたファイルを保持し続けることはできません。
@z

@x
![tmpfs on the Docker host](images/types-of-mounts-tmpfs.png)
@y
{% comment %}
![tmpfs on the Docker host](images/types-of-mounts-tmpfs.png)
{% endcomment %}
![Docker ホスト上の tmpfs](images/types-of-mounts-tmpfs.png)
@z

@x
This is useful to temporarily store sensitive files that you don't want to
persist in either the host or the container writable layer.
@y
{% comment %}
This is useful to temporarily store sensitive files that you don't want to
persist in either the host or the container writable layer.
{% endcomment %}
これが有用になるのは、重要な情報を含んだファイルを一時的に保存したい場合です。
こういった情報は、ホスト上およびコンテナーの書き込みレイヤー上のいずれであっても、ずっと残しておくわけにはいかないものです。
@z

@x
## Limitations of tmpfs mounts
@y
{% comment %}
## Limitations of tmpfs mounts
{% endcomment %}
{: #limitations-of-tmpfs-mounts }
## tmpfs マウントの制約
@z

@x
* Unlike volumes and bind mounts, you can't share `tmpfs` mounts between
containers.
* This functionality is only available if you're running Docker on Linux.
@y
{% comment %}
* Unlike volumes and bind mounts, you can't share `tmpfs` mounts between
containers.
* This functionality is only available if you're running Docker on Linux.
{% endcomment %}
* ボリュームやバインドマウントとは違って、`tmpfs` マウントはコンテナー間で共有することはできません。
* この機能は Docker on Linux を稼動させている場合にのみ利用可能です。
@z

@x
## Choose the --tmpfs or --mount flag
@y
{% comment %}
## Choose the --tmpfs or --mount flag
{% endcomment %}
{: #choose-the---tmpfs-or---mount-flag }
## --tmpfs フラグ、--mount フラグの使い分け
@z

@x
Originally, the `--tmpfs` flag was used for standalone containers and
the `--mount` flag was used for swarm services. However, starting with Docker
17.06, you can also use `--mount` with standalone containers. In general,
`--mount` is more explicit and verbose. The biggest difference is that the
`--tmpfs` flag does not support any configurable options.
@y
{% comment %}
Originally, the `--tmpfs` flag was used for standalone containers and
the `--mount` flag was used for swarm services. However, starting with Docker
17.06, you can also use `--mount` with standalone containers. In general,
`--mount` is more explicit and verbose. The biggest difference is that the
`--tmpfs` flag does not support any configurable options.
{% endcomment %}
元々`--tmpfs` フラグはスタンドアロンコンテナー向けに用いられ、`--mount` フラグは Swarm サービス向けに用いられていました。
しかし Docker 17.06 以降では `--mount` がスタンドアロンコンテナーに対しても利用できるようになりました。
一般に `--mount` の方が、より明示的なものであり多くの記述を必要とします。
はっきりとした違いは `--tmpfs` フラグでは設定変更可能なオプションが用意されていないということです。
@z

@x
- **`--tmpfs`**: Mounts a `tmpfs` mount without allowing you to specify any
  configurable options, and can only be used with standalone containers.
@y
{% comment %}
- **`--tmpfs`**: Mounts a `tmpfs` mount without allowing you to specify any
  configurable options, and can only be used with standalone containers.
{% endcomment %}
- **`--tmpfs`**: `tmpfs` マウントを行いますが、設定変更が行えるようなオプション指定はありません。
  またこのオプションはスタンドアロンコンテナーに対してしか用いることはできません。
@z

@x
- **`--mount`**: Consists of multiple key-value pairs, separated by commas and each
  consisting of a `<key>=<value>` tuple. The `--mount` syntax is more verbose
  than `--tmpfs`:
  - The `type` of the mount, which can be [`bind`](bind-mounts.md), `volume`, or
    [`tmpfs`](tmpfs.md). This topic discusses `tmpfs`, so the type is always
    `tmpfs`.
  - The `destination` takes as its value the path where the `tmpfs` mount
    is mounted in the container. May be specified as `destination`, `dst`,
    or `target`.
  - The `tmpfs-size` and `tmpfs-mode` options. See
    [tmpfs options](#specify-tmpfs-options).
@y
{% comment %}
- **`--mount`**: Consists of multiple key-value pairs, separated by commas and each
  consisting of a `<key>=<value>` tuple. The `--mount` syntax is more verbose
  than `--tmpfs`:
  - The `type` of the mount, which can be [`bind`](bind-mounts.md), `volume`, or
    [`tmpfs`](tmpfs.md). This topic discusses `tmpfs`, so the type is always
    `tmpfs`.
  - The `destination` takes as its value the path where the `tmpfs` mount
    is mounted in the container. May be specified as `destination`, `dst`,
    or `target`.
  - The `tmpfs-size` and `tmpfs-mode` options. See
    [tmpfs options](#specify-tmpfs-options).
{% endcomment %}
- **`--mount`**: 複数のキーバリューペアを指定し、個々は `<key>=<value>` の記述としてそれぞれをカンマで区切ります。
  `--mount` の書式は `--tmpfs` に比べて多くの記述を必要とします。
  - `type` によりマウントのタイプ、つまり [`bind`](bind-mounts.md), `volume`, [`tmpfs`](tmpfs.md) のいずれかを指定します。
    `tmpfs` の説明を行っていますから、ここでは `tmpfs` とします。
  - `destination` はバリューにパスを指定します。
    これはコンテナー内にて `tmpfs` マウントを行うパスを表わします。
    `destination`、`dst`、`target` として指定することもできます。
  - `tmpfs-size` と `tmpfs-mode` オプションがあります。
    [tmpfs オプション](#specify-tmpfs-options) を参照してください。
@z

@x
The examples below show both the `--mount` and `--tmpfs` syntax where possible,
and `--mount` is presented first.
@y
{% comment %}
The examples below show both the `--mount` and `--tmpfs` syntax where possible,
and `--mount` is presented first.
{% endcomment %}
以降では `--mount` と `--tmpfs` の両方について、利用可能な書式を示します。
はじめに示すのは `--mount` です。
@z

@x
### Differences between `--tmpfs` and `--mount` behavior
@y
{% comment %}
### Differences between `--tmpfs` and `--mount` behavior
{% endcomment %}
{: #differences-between---tmpfs-and---mount-behavior }
### `--tmpfs` と `--mount` の違い
@z

@x
- The `--tmpfs` flag does not allow you to specify any configurable options.
- The `--tmpfs` flag cannot be used with swarm services. You must use `--mount`.
@y
{% comment %}
- The `--tmpfs` flag does not allow you to specify any configurable options.
- The `--tmpfs` flag cannot be used with swarm services. You must use `--mount`.
{% endcomment %}
- `--tmpfs` フラグには設定変更可能なオプションの指定はありません。
- `--tmpfs` フラグは Swarm サービスに対して用いることはできません。
  その場合は `--mount` を用います。
@z

@x
## Use a tmpfs mount in a container
@y
{% comment %}
## Use a tmpfs mount in a container
{% endcomment %}
{: #use-a-tmpfs-mount-in-a-container }
## コンテナー内での tmpfs マウントの利用
@z

@x
To use a `tmpfs` mount in a container, use the `--tmpfs` flag, or use the
`--mount` flag with `type=tmpfs` and `destination` options. There is no
`source` for `tmpfs` mounts. The following example creates a `tmpfs` mount at
`/app` in a Nginx container. The first example uses the `--mount` flag and the
second uses the `--tmpfs` flag.
@y
{% comment %}
To use a `tmpfs` mount in a container, use the `--tmpfs` flag, or use the
`--mount` flag with `type=tmpfs` and `destination` options. There is no
`source` for `tmpfs` mounts. The following example creates a `tmpfs` mount at
`/app` in a Nginx container. The first example uses the `--mount` flag and the
second uses the `--tmpfs` flag.
{% endcomment %}
コンテナー内にて `tmpfs` マウントを利用するには `--tmpfs` フラグを用います。
あるいは `--mount` フラグにて `type=tmpfs` と `destination` オプションを指定します。
`tmpfs` マウントに `source` オプションは存在しません。
以下の利用例は Nginx コンテナー内の `/app` に対して `tmpfs` マウントを生成するものです。
1 例めでは `--mount` フラグ、2 例めでは `--tmpfs` フラグを用いています。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-run"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#tmpfs-run"><code>--tmpfs</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-run" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-run"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#tmpfs-run"><code>--tmpfs</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-run" class="tab-pane fade in active" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/app \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/app \
  nginx:latest
```
@z

@x
</div><!--mount-->
<div id="tmpfs-run" class="tab-pane fade" markdown="1">
@y
</div><!--mount-->
<div id="tmpfs-run" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name tmptest \
  --tmpfs /app \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name tmptest \
  --tmpfs /app \
  nginx:latest
```
@z

@x
</div><!--volume-->
</div><!--tab-content-->
@y
</div><!--volume-->
</div><!--tab-content-->
@z

@x
Verify that the mount is a `tmpfs` mount by running `docker container inspect
tmptest` and looking for the `Mounts` section:
@y
{% comment %}
Verify that the mount is a `tmpfs` mount by running `docker container inspect
tmptest` and looking for the `Mounts` section:
{% endcomment %}
マウントが `tmpfs` マウントであることを確認するために `docker container inspect
tmptest` を実行します。
結果は `Mounts` の項に示されます。
@z

@x
```json
"Tmpfs": {
    "/app": ""
},
```
@y
```json
"Tmpfs": {
    "/app": ""
},
```
@z

@x
Remove the container:
@y
{% comment %}
Remove the container:
{% endcomment %}
コンテナーを削除します。
@z

@x
```bash
$ docker container stop tmptest
@y
```bash
$ docker container stop tmptest
@z

@x
$ docker container rm tmptest
```
@y
$ docker container rm tmptest
```
@z

@x
### Specify tmpfs options
@y
{% comment %}
### Specify tmpfs options
{% endcomment %}
{: #specify-tmpfs-options }
### tmpfs オプションの指定
@z

@x
`tmpfs` mounts allow for two configuration options, neither of which is
required. If you need to specify these options, you must use the `--mount` flag,
as the `--tmpfs` flag does not support them.
@y
{% comment %}
`tmpfs` mounts allow for two configuration options, neither of which is
required. If you need to specify these options, you must use the `--mount` flag,
as the `--tmpfs` flag does not support them.
{% endcomment %}
`tmpfs` マウントには設定変更可能なオプションが 2 つあります。
いずれも任意指定です。
これを指定する場合は `--mount` フラグを用います。
`--tmpfs` フラグではこれを指定することはできません。
@z

@x
| Option       | Description                                                                                           |
|:-------------|:------------------------------------------------------------------------------------------------------|
| `tmpfs-size` | Size of the tmpfs mount in bytes. Unlimited by default.                                               |
| `tmpfs-mode` | File mode of the tmpfs in octal. For instance, `700` or `0770`. Defaults to `1777` or world-writable. |
@y
{% comment %}
| Option       | Description                                                                                           |
|:-------------|:------------------------------------------------------------------------------------------------------|
| `tmpfs-size` | Size of the tmpfs mount in bytes. Unlimited by default.                                               |
| `tmpfs-mode` | File mode of the tmpfs in octal. For instance, `700` or `0770`. Defaults to `1777` or world-writable. |
{% endcomment %}
| オプション   | 内容説明                                                                                              |
|:-------------|:------------------------------------------------------------------------------------------------------|
| `tmpfs-size` | tmpfs マウントサイズをバイト単位で指定します。デフォルトは無制限です。                                |
| `tmpfs-mode` | tmpfs のファイルモードを 8 進数表記で指定します。たとえば `700`、`0770` などです。デフォルトはすべて書き込み可能な `1777` です。|
@z

@x
The following example sets the `tmpfs-mode` to `1770`, so that it is not
world-readable within the container.
@y
{% comment %}
The following example sets the `tmpfs-mode` to `1770`, so that it is not
world-readable within the container.
{% endcomment %}
以下の例では `tmpfs-mode` に `1770` を指定しています。
つまりこのコンテナー内においては、全ユーザーからの読み取りが制限されます。
@z

@x
```bash
docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/app,tmpfs-mode=1770 \
  nginx:latest
```
@y
```bash
docker run -d \
  -it \
  --name tmptest \
  --mount type=tmpfs,destination=/app,tmpfs-mode=1770 \
  nginx:latest
```
@z

@x
## Next steps
@y
{% comment %}
## Next steps
{% endcomment %}
{: #next-steps }
## 次のステップ
@z

@x
- Learn about [volumes](volumes.md)
- Learn about [bind mounts](bind-mounts.md)
- Learn about [storage drivers](/storage/storagedriver/)
@y
{% comment %}
- Learn about [volumes](volumes.md)
- Learn about [bind mounts](bind-mounts.md)
- Learn about [storage drivers](/storage/storagedriver/)
{% endcomment %}
- [ボリューム](volumes.md) について
- [バインドマウント](bind-mounts.md) について
- [ストレージドライバー](/storage/storagedriver/) について
@z
