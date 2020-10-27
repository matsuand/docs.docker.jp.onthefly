%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Using bind mounts
title: Use bind mounts
keywords: storage, persistence, data persistence, mounts, bind mounts
redirect_from:
- /engine/admin/volumes/bind-mounts/
---
@y
---
description: バインドマウントの利用。
title: バインドマウントの利用
keywords: storage, persistence, data persistence, mounts, bind mounts
redirect_from:
- /engine/admin/volumes/bind-mounts/
---
@z

@x
Bind mounts have been around since the early days of Docker. Bind mounts have
limited functionality compared to [volumes](volumes.md). When you use a bind
mount, a file or directory on the _host machine_ is mounted into a container.
The file or directory is referenced by its absolute path on the host
machine. By contrast, when you use a volume, a new directory is created within
Docker's storage directory on the host machine, and Docker manages that
directory's contents.
@y
{% comment %}
Bind mounts have been around since the early days of Docker. Bind mounts have
limited functionality compared to [volumes](volumes.md). When you use a bind
mount, a file or directory on the _host machine_ is mounted into a container.
The file or directory is referenced by its absolute path on the host
machine. By contrast, when you use a volume, a new directory is created within
Docker's storage directory on the host machine, and Docker manages that
directory's contents.
{% endcomment %}
バインドマウントは Docker の初期のころから存在しています。
ただし [ボリューム](volumes.md) に比べると、バインドマウントの機能は限定されます。
バインドマウントを利用すると「ホストマシン」上のファイルやディレクトリがコンテナー内にマウントされます。
そのファイルやディレクトリは、ホストマシン上の絶対パスにより参照できます。
これとは違ってボリュームを利用すると、ホストマシン上に新たなディレクトリが生成され、そこが Docker の保存ディレクトリとなります。
そして Docker はそのディレクトリ内の内容を管理していきます。
@z

@x
The file or directory does not need to exist on the Docker host already. It is
created on demand if it does not yet exist. Bind mounts are very performant, but
they rely on the host machine's filesystem having a specific directory structure
available. If you are developing new Docker applications, consider using
[named volumes](volumes.md) instead. You can't use Docker CLI commands to directly
manage bind mounts.
@y
{% comment %}
The file or directory does not need to exist on the Docker host already. It is
created on demand if it does not yet exist. Bind mounts are very performant, but
they rely on the host machine's filesystem having a specific directory structure
available. If you are developing new Docker applications, consider using
[named volumes](volumes.md) instead. You can't use Docker CLI commands to directly
manage bind mounts.
{% endcomment %}
そのファイルやディレクトリは、Docker ホストに存在している必要がなくなります。
存在してなかったとしても、必要とされるときには生成されます。
バインドマウントは非常に性能の良いものですが、ただしホストマシンのファイルシステムに依存するものとなり、利用可能な特定のディレクトリ構造に従ったものになります。
今から新たに Docker アプリケーションを開発しようとする場合は、これにかわって [名前つきボリューム](volumes.md) の利用を考えてみてください。
バインドマウントを管理するために Docker CLI コマンドを直接利用することはできなくなります。
@z

@x
![bind mounts on the Docker host](images/types-of-mounts-bind.png)
@y
{% comment %}
![bind mounts on the Docker host](images/types-of-mounts-bind.png)
{% endcomment %}
![Docker ホスト上のバインドマウント](images/types-of-mounts-bind.png)
@z

@x
## Choose the -v or --mount flag
@y
{% comment %}
## Choose the -v or --mount flag
{% endcomment %}
{: #choose-the--v-or---mount-flag }
## -v または --mount フラグの選択
@z

@x
In general, `--mount` is more explicit and verbose. The biggest difference is that
the `-v` syntax combines all the options together in one field, while the `--mount`
syntax separates them. Here is a comparison of the syntax for each flag.
@y
{% comment %}
In general, `--mount` is more explicit and verbose. The biggest difference is that
the `-v` syntax combines all the options together in one field, while the `--mount`
syntax separates them. Here is a comparison of the syntax for each flag.
{% endcomment %}
全般に `--mount` の方がわかりやすいものですが、記述は増えます。
両者の最大の違いは、`-v` の文法がオプション指定のすべてを 1 項目にとりまとめるものであるのに対して、`--mount` の文法はそれを 1 つずつ個別に分けている点です。
以下に両フラグにおける文法を比較します。
@z

@x
> **Tip**: New users should use the `--mount` syntax. Experienced users may
> be more familiar with the `-v` or `--volume` syntax, but are encouraged to
> use `--mount`, because research has shown it to be easier to use.
@y
{% comment %}
> **Tip**: New users should use the `--mount` syntax. Experienced users may
> be more familiar with the `-v` or `--volume` syntax, but are encouraged to
> use `--mount`, because research has shown it to be easier to use.
{% endcomment %}
> **ヒント**: はじめて利用する方は `--mount` を利用してください。
> 上級ユーザーは `-v` や `--volume` を用いることに慣れているかもしれませんが、`--mount` を利用するように心がけてください。
> `--mount` の方が簡単に利用することができるとの調査もあります。
@z

@x
- **`-v` or `--volume`**: Consists of three fields, separated by colon characters
  (`:`). The fields must be in the correct order, and the meaning of each field
  is not immediately obvious.
  - In the case of bind mounts, the first field is the path to the file or
    directory on the **host machine**.
  - The second field is the path where the file or directory is mounted in
    the container.
  - The third field is optional, and is a comma-separated list of options, such
    as `ro`, `z`, and `Z`. These options
    are discussed below.
@y
{% comment %}
- **`-v` or `--volume`**: Consists of three fields, separated by colon characters
  (`:`). The fields must be in the correct order, and the meaning of each field
  is not immediately obvious.
  - In the case of bind mounts, the first field is the path to the file or
    directory on the **host machine**.
  - The second field is the path where the file or directory is mounted in
    the container.
  - The third field is optional, and is a comma-separated list of options, such
    as `ro`, `z`, and `Z`. These options
    are discussed below.
{% endcomment %}
- **`-v` または `--volume`**: 3 つの項目から構成され、それぞれをコロン（`:`）で区切ります。
  各項目は正しい順に記述する必要があります。
  各項目の意味は、そのときどきによって変わります。
  - バインドマウントの場合、1 つめの項目は **ホストマシン** 上のファイルまたはディレクトリへのパスです。
  - 2 つめは、コンテナー内にマウントされるファイルまたディレクトリのパスです。
  - 3 つめは任意の指定項目であり、オプション指定をカンマ区切りで指定します。
    指定内容には `ro`, `z`, `Z` などがあります。
    このオプションに関しては後に説明しています。
@z

@x
- **`--mount`**: Consists of multiple key-value pairs, separated by commas and each
  consisting of a `<key>=<value>` tuple. The `--mount` syntax is more verbose
  than `-v` or `--volume`, but the order of the keys is not significant, and
  the value of the flag is easier to understand.
  - The `type` of the mount, which can be `bind`, `volume`, or `tmpfs`. This
    topic discusses bind mounts, so the type is always `bind`.
  - The `source` of the mount. For bind mounts, this is the path to the file
    or directory on the Docker daemon host. May be specified as `source` or
    `src`.
  - The `destination` takes as its value the path where the file or directory
    is mounted in the container. May be specified as `destination`, `dst`,
    or `target`.
  - The `readonly` option, if present, causes the bind mount to be [mounted into
    the container as read-only](#use-a-read-only-bind-mount).
  - The `bind-propagation` option, if present, changes the
    [bind propagation](#configure-bind-propagation). May be one of `rprivate`,
    `private`, `rshared`, `shared`, `rslave`, `slave`.
  - The `--mount` flag does not support `z` or `Z` options for modifying
    selinux labels.
@y
{% comment %}
- **`--mount`**: Consists of multiple key-value pairs, separated by commas and each
  consisting of a `<key>=<value>` tuple. The `--mount` syntax is more verbose
  than `-v` or `--volume`, but the order of the keys is not significant, and
  the value of the flag is easier to understand.
  - The `type` of the mount, which can be `bind`, `volume`, or `tmpfs`. This
    topic discusses bind mounts, so the type is always `bind`.
  - The `source` of the mount. For bind mounts, this is the path to the file
    or directory on the Docker daemon host. May be specified as `source` or
    `src`.
  - The `destination` takes as its value the path where the file or directory
    is mounted in the container. May be specified as `destination`, `dst`,
    or `target`.
  - The `readonly` option, if present, causes the bind mount to be [mounted into
    the container as read-only](#use-a-read-only-bind-mount).
  - The `bind-propagation` option, if present, changes the
    [bind propagation](#configure-bind-propagation). May be one of `rprivate`,
    `private`, `rshared`, `shared`, `rslave`, `slave`.
  - The `--mount` flag does not support `z` or `Z` options for modifying
    selinux labels.
{% endcomment %}
- **`--mount`**: 複数のキーバリューペアを指定し、各ペアはカンマにより区切ります。
  そしてそれぞれのペアは `<key>=<value>` という記述を行います。
  `--mount` における記述は `-v` や `--volume` におけるものよりも長くなります。
  しかしキーの並び順に意味はなく、このフラグに与えられたキーバリューの内容は容易に理解することができます。
  - `type` はマウントのタイプであり、`bind`, `volume`, `tmpfs` といった値を指定します。
    ここで説明しているのはバインドマウントであるため、常に `bind` であるものとします。
  - `source` はマウント元です。
    バインドマウントにおいては、Docker デーモンホスト上のファイルまたはディレクトリへのパスになります。
    `source` あるいは `src` といった指定がよく用いられます。
  - `destination` には、コンテナー上にてマウントするファイルまたはディレクトリのパスを指定します。
    `destination`, `dst`, `target` といった指定がよく用いられます。
  - オプション `readonly` が指定されると、そのバインドマウンドが [コンテナーにおける読み込み専用マウント](#use-a-read-only-bind-mount) としてマウントされます。
  - オプション `bind-propagation` が指定されると、[バインドプロパゲーション](#configure-bind-propagation)（bind propagation）の設定変更を行います。
    `rprivate`, `private`, `rshared`, `shared`, `rslave`, `slave` のいずれかを指定します。
  - `--mount` フラグは、selinux ラベルを修正するための `z` または `Z` オプションには対応していません。
@z

@x
The examples below show both the `--mount` and `-v` syntax where possible, and
`--mount` is presented first.
@y
{% comment %}
The examples below show both the `--mount` and `-v` syntax where possible, and
`--mount` is presented first.
{% endcomment %}
これ以降においては、可能なら `--mount` と `-v` の両方の例を示していきます。
また先に示すのは `--mount` とします。
@z

@x
### Differences between `-v` and `--mount` behavior
@y
{% comment %}
### Differences between `-v` and `--mount` behavior
{% endcomment %}
{: #differences-between--v-and---mount-behavior }
### `-v` と `--mount` の動作の違い
@z

@x
Because the `-v` and `--volume` flags have been a part of Docker for a long
time, their behavior cannot be changed. This means that **there is one behavior
that is different between `-v` and `--mount`.**
@y
{% comment %}
Because the `-v` and `--volume` flags have been a part of Docker for a long
time, their behavior cannot be changed. This means that **there is one behavior
that is different between `-v` and `--mount`.**
{% endcomment %}
`-v` および `--volume` フラグは、長らく Docker の一部分として実現してきているため、その動作を今さら変更することはできません。
このことがつまり、**`-v` と `--mount` の動作の違いの 1 つ** になります。
@z

@x
If you use `-v` or `--volume` to bind-mount a file or directory that does not
yet exist on the Docker host, `-v` creates the endpoint for you. **It is
always created as a directory.**
@y
{% comment %}
If you use `-v` or `--volume` to bind-mount a file or directory that does not
yet exist on the Docker host, `-v` creates the endpoint for you. **It is
always created as a directory.**
{% endcomment %}
`-v` または `--volume` を使ってファイルやディレクトリをバインドマウントした際に、そのファイルやディレクトリが Docker ホスト上にまだ存在していなかった場合、`-v` はそのマウントエンドポイントを生成します。
**その場合には常にディレクトリとして生成されます。**
@z

@x
If you use `--mount` to bind-mount a file or directory that does not
yet exist on the Docker host, Docker does **not** automatically create it for
you, but generates an error.
@y
{% comment %}
If you use `--mount` to bind-mount a file or directory that does not
yet exist on the Docker host, Docker does **not** automatically create it for
you, but generates an error.
{% endcomment %}
`--mount` を使ってファイルやディレクトリをバインドマウントした際に、そのファイルやディレクトリが Docker ホスト上に存在していなかった場合、Docker はそのファイルやディレクトリを自動的に生成することは**しません**。
かわりにエラーが出力されます。
@z

@x
## Start a container with a bind mount
@y
{% comment %}
## Start a container with a bind mount
{% endcomment %}
{: #start-a-container-with-a-bind-mount }
## バインドマウントを用いたコンテナーの起動
@z

@x
Consider a case where you have a directory `source` and that when you build the
source code, the artifacts are saved into another directory, `source/target/`.
You want the artifacts to be available to the container at `/app/`, and you
want the container to get access to a new build each time you build the source
on your development host. Use the following command to bind-mount the `target/`
directory into your container at `/app/`. Run the command from within the
`source` directory. The `$(pwd)` sub-command expands to the current working
directory on Linux or macOS hosts.
@y
{% comment %}
Consider a case where you have a directory `source` and that when you build the
source code, the artifacts are saved into another directory, `source/target/`.
You want the artifacts to be available to the container at `/app/`, and you
want the container to get access to a new build each time you build the source
on your development host. Use the following command to bind-mount the `target/`
directory into your container at `/app/`. Run the command from within the
`source` directory. The `$(pwd)` sub-command expands to the current working
directory on Linux or macOS hosts.
{% endcomment %}
仮に `source` というディレクトリがあって、そこにソースコードが置かれているとします。
そして成果物はそのサブディレクトリ `source/target/` に置かれるものとします。
ここでコンテナーが `/app/` というディレクトリから、その成果物にアクセスできるようにします。
つまり開発ホスト上のソースディレクトリにおいて成果物をビルドしたら、すぐにその最新の成果物をコンテナーがアクセスできるようにする、というものです。
これを実現するには以下のようなコマンドにより、`target/` ディレクトリをコンテナー内の `/app/` にバインドマウントします。
コマンドは `source` ディレクトリから実行します。
`$(pwd)` というサブコマンドは、Linux あるいは macOS ホスト上において、カレントディレクトリに展開されます。
@z

@x
The `--mount` and `-v` examples below produce the same result. You
can't run them both unless you remove the `devtest` container after running the
first one.
@y
{% comment %}
The `--mount` and `-v` examples below produce the same result. You
can't run them both unless you remove the `devtest` container after running the
first one.
{% endcomment %}
`--mount` と `-v` によるそれぞれの例は、同一の結果になります。
ただし 2 つの例を同時に実行することはできません。
実行するためには、実行前に `devtest` コンテナーを削除しておくことが必要になります。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-run"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#v-run"><code>-v</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-run" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-run"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#v-run"><code>-v</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-run" class="tab-pane fade in active" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app \
  nginx:latest
```
@z

@x
</div><!--mount-->
<div id="v-run" class="tab-pane fade" markdown="1">
@y
</div><!--mount-->
<div id="v-run" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app \
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
Use `docker inspect devtest` to verify that the bind mount was created
correctly. Look for the `Mounts` section:
@y
{% comment %}
Use `docker inspect devtest` to verify that the bind mount was created
correctly. Look for the `Mounts` section:
{% endcomment %}
バインドマウントが正しく生成されたかどうかを `docker inspect devtest` により確認します。
出力の中で `Mounts` の項目を見てみます。
@z

@x
```json
"Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "",
        "RW": true,
        "Propagation": "rprivate"
    }
],
```
@y
```json
"Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "",
        "RW": true,
        "Propagation": "rprivate"
    }
],
```
@z

@x
This shows that the mount is a `bind` mount, it shows the correct source and
destination, it shows that the mount is read-write, and that the propagation is
set to `rprivate`.
@y
{% comment %}
This shows that the mount is a `bind` mount, it shows the correct source and
destination, it shows that the mount is read-write, and that the propagation is
set to `rprivate`.
{% endcomment %}
この情報から、マウントは「バインド」マウントであることがわかります。
そしてマウント元、マウント先が正しいものであること、マウントが読み書き可能であること、プロパゲーションは `rprivate` に設定されていることがわかります。
@z

@x
Stop the container:
@y
{% comment %}
Stop the container:
{% endcomment %}
コンテナーを停止します。
@z

@x
```bash
$ docker container stop devtest
@y
```bash
$ docker container stop devtest
@z

@x
$ docker container rm devtest
```
@y
$ docker container rm devtest
```
@z

@x
### Mount into a non-empty directory on the container
@y
{% comment %}
### Mount into a non-empty directory on the container
{% endcomment %}
{: #mount-into-a-non-empty-directory-on-the-container }
### コンテナー上の空ではないディレクトリへのマウント
@z

@x
If you bind-mount into a non-empty directory on the container, the directory's
existing contents are obscured by the bind mount. This can be beneficial,
such as when you want to test a new version of your application without
building a new image. However, it can also be surprising and this behavior
differs from that of [docker volumes](volumes.md).
@y
{% comment %}
If you bind-mount into a non-empty directory on the container, the directory's
existing contents are obscured by the bind mount. This can be beneficial,
such as when you want to test a new version of your application without
building a new image. However, it can also be surprising and this behavior
differs from that of [docker volumes](volumes.md).
{% endcomment %}
バインドマウントする先のコンテナー内ディレクトリが空でなかったとします。
このときそのディレクトリ内にはじめからあった内容は、バインドマウントによって見えなくなってしまいます。
そうであっても、このことを便利に利用できる場合もあります。
たとえばアプリケーションの新バージョンをテストする際に、新たなイメージをビルドせずに実現するような場合です。
ただしそういった状況には驚くかもしれません。
またこの動きは [Docker ボリューム](volumes.md) とは異なるものです。
@z

@x
This example is contrived to be extreme, but replaces the contents of the
container's `/usr/` directory with the `/tmp/` directory on the host machine. In
most cases, this would result in a non-functioning container.
@y
{% comment %}
This example is contrived to be extreme, but replaces the contents of the
container's `/usr/` directory with the `/tmp/` directory on the host machine. In
most cases, this would result in a non-functioning container.
{% endcomment %}
以下は極端な例です。
コンテナーの `/usr/` ディレクトリをホストマシン上の `/tmp/` ディレクトリに置き換えてしまうものです。
おそらくこのコンテナーは使いものにならなくなります。
@z

@x
The `--mount` and `-v` examples have the same end result.
@y
{% comment %}
The `--mount` and `-v` examples have the same end result.
{% endcomment %}
`--mount` と `-v` によるそれぞれの例は、同一の結果になります。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-empty-run"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#v-empty-run"><code>-v</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-empty-run" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-empty-run"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#v-empty-run"><code>-v</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-empty-run" class="tab-pane fade in active" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name broken-container \
  --mount type=bind,source=/tmp,target=/usr \
  nginx:latest
@y
```bash
$ docker run -d \
  -it \
  --name broken-container \
  --mount type=bind,source=/tmp,target=/usr \
  nginx:latest
@z

@x
docker: Error response from daemon: oci runtime error: container_linux.go:262:
starting container process caused "exec: \"nginx\": executable file not found in $PATH".
```
@y
docker: Error response from daemon: oci runtime error: container_linux.go:262:
starting container process caused "exec: \"nginx\": executable file not found in $PATH".
```
@z

@x
</div><!--mount-->
<div id="v-empty-run" class="tab-pane fade" markdown="1">
@y
</div><!--mount-->
<div id="v-empty-run" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name broken-container \
  -v /tmp:/usr \
  nginx:latest
@y
```bash
$ docker run -d \
  -it \
  --name broken-container \
  -v /tmp:/usr \
  nginx:latest
@z

@x
docker: Error response from daemon: oci runtime error: container_linux.go:262:
starting container process caused "exec: \"nginx\": executable file not found in $PATH".
```
@y
docker: Error response from daemon: oci runtime error: container_linux.go:262:
starting container process caused "exec: \"nginx\": executable file not found in $PATH".
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
The container is created but does not start. Remove it:
@y
{% comment %}
The container is created but does not start. Remove it:
{% endcomment %}
コンテナーは生成されましたが、起動はされませんでした。
コンテナーはここで削除します。
@z

@x
```bash
$ docker container rm broken-container
```
@y
```bash
$ docker container rm broken-container
```
@z

@x
## Use a read-only bind mount
@y
{% comment %}
## Use a read-only bind mount
{% endcomment %}
{: #use-a-read-only-bind-mount }
## 読み込み専用バインドマウントの利用
@z

@x
For some development applications, the container needs to
write into the bind mount, so changes are propagated back to the
Docker host. At other times, the container only needs read access.
@y
{% comment %}
For some development applications, the container needs to
write into the bind mount, so changes are propagated back to the
Docker host. At other times, the container only needs read access.
{% endcomment %}
開発アプリケーションにおいて、バインドマウントに対してコンテナーから書き込みを行う必要があるものも当然あります。
この場合、その書き込みは Docker ホストに対して行われます。
一方でコンテナーが読み込みアクセスだけを必要とする場合もあります。
@z

@x
This example modifies the one above but mounts the directory as a read-only
bind mount, by adding `ro` to the (empty by default) list of options, after the
mount point within the container. Where multiple options are present, separate
them by commas.
@y
{% comment %}
This example modifies the one above but mounts the directory as a read-only
bind mount, by adding `ro` to the (empty by default) list of options, after the
mount point within the container. Where multiple options are present, separate
them by commas.
{% endcomment %}
以下の例では先ほどと同様ながら、ディレクトリは読み込み専用としてバインドマウントするものです。
以下ではコンテナー内のマウントポイント指定の後に、リスト形式のオプションとして（デフォルトでは何も記述しない箇所に）`ro` を加えます。
複数のオプション指定を行っているので、それぞれをカンマで区切ります。
@z

@x
The `--mount` and `-v` examples have the same result.
@y
{% comment %}
The `--mount` and `-v` examples have the same result.
{% endcomment %}
`--mount` と `-v` によるそれぞれの例は、同一の結果になります。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-readonly"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#v-readonly"><code>-v</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-readonly" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-readonly"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#v-readonly"><code>-v</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-readonly" class="tab-pane fade in active" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app,readonly \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app,readonly \
  nginx:latest
```
@z

@x
</div><!--mount-->
<div id="v-readonly" class="tab-pane fade" markdown="1">
@y
</div><!--mount-->
<div id="v-readonly" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app:ro \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app:ro \
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
Use `docker inspect devtest` to verify that the bind mount was created
correctly. Look for the `Mounts` section:
@y
{% comment %}
Use `docker inspect devtest` to verify that the bind mount was created
correctly. Look for the `Mounts` section:
{% endcomment %}
バインドマウントが正しく生成されたかどうかを `docker inspect devtest` により確認します。
出力の中で `Mounts` の項目を見てみます。
@z

@x
```json
"Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "ro",
        "RW": false,
        "Propagation": "rprivate"
    }
],
```
@y
```json
"Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "ro",
        "RW": false,
        "Propagation": "rprivate"
    }
],
```
@z

@x
Stop the container:
@y
{% comment %}
Stop the container:
{% endcomment %}
コンテナーを停止します。
@z

@x
```bash
$ docker container stop devtest
@y
```bash
$ docker container stop devtest
@z

@x
$ docker container rm devtest
```
@y
$ docker container rm devtest
```
@z

@x
## Configure bind propagation
@y
{% comment %}
## Configure bind propagation
{% endcomment %}
{: #configure-bind-propagation }
## バインドプロパゲーションの設定
@z

@x
Bind propagation defaults to `rprivate` for both bind mounts and volumes. It is
only configurable for bind mounts, and only on Linux host machines. Bind
propagation is an advanced topic and many users never need to configure it.
@y
{% comment %}
Bind propagation defaults to `rprivate` for both bind mounts and volumes. It is
only configurable for bind mounts, and only on Linux host machines. Bind
propagation is an advanced topic and many users never need to configure it.
{% endcomment %}
バインドマウントとボリュームのいずれにおいても、バインドプロパゲーション（bind propagation）のデフォルトは `rprivate` です。
この設定はバインドマウントに対してのみ、また Linux ホストマシン上においてのみ変更可能です。
バインドプロパゲーションは高度な技術であるため、多くのユーザーは設定する必要はありません。
@z

@x
Bind propagation refers to whether or not mounts created within a given
bind-mount or named volume can be propagated to replicas of that mount. Consider
a mount point `/mnt`, which is also mounted on `/tmp`. The propagation settings
control whether a mount on `/tmp/a` would also be available on `/mnt/a`. Each
propagation setting has a recursive counterpoint. In the case of recursion,
consider that `/tmp/a` is also mounted as `/foo`. The propagation settings
control whether `/mnt/a` and/or `/tmp/a` would exist.
@y
{% comment %}
Bind propagation refers to whether or not mounts created within a given
bind-mount or named volume can be propagated to replicas of that mount. Consider
a mount point `/mnt`, which is also mounted on `/tmp`. The propagation settings
control whether a mount on `/tmp/a` would also be available on `/mnt/a`. Each
propagation setting has a recursive counterpoint. In the case of recursion,
consider that `/tmp/a` is also mounted as `/foo`. The propagation settings
control whether `/mnt/a` and/or `/tmp/a` would exist.
{% endcomment %}
バインドプロパゲーションとは、指定されたバインドマウントや名前つきボリュームによって生成されるマウントが、そのレプリカに対して情報伝達（propagate）をするかどうかを表わします。
ここで `/mnt` というマウントポイントを考えます。
これが `/tmp` にマウントされているとします。
これに対するプロパゲーションの設定は、`/tmp/a` 上のマウントが `/mnt/a` として利用可能かどうかを制御するものです。
プロパゲーションの各設定においては、再帰的に対応するマウントポイントが存在します。
再帰的という点でいうと、仮に `/tmp/a` が `/foo` としてマウントされていたとします。
このときプロパゲーション設定は `/mnt/a` や `/tmp/a` が存在するかどうかを定めるものです。
@z

@x
| Propagation setting | Description                                                                                                                                                                                                         |
|:--------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `shared`            | Sub-mounts of the original mount are exposed to replica mounts, and sub-mounts of replica mounts are also propagated to the original mount.                                                                         |
| `slave`             | similar to a shared mount, but only in one direction. If the original mount exposes a sub-mount, the replica mount can see it. However, if the replica mount exposes a sub-mount, the original mount cannot see it. |
| `private`           | The mount is private. Sub-mounts within it are not exposed to replica mounts, and sub-mounts of replica mounts are not exposed to the original mount.                                                               |
| `rshared`           | The same as shared, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                            |
| `rslave`            | The same as slave, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                             |
| `rprivate`          | The default. The same as private, meaning that no mount points anywhere within the original or replica mount points propagate in either direction.                                                                  |
@y
{% comment %}
| Propagation setting | Description                                                                                                                                                                                                         |
|:--------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `shared`            | Sub-mounts of the original mount are exposed to replica mounts, and sub-mounts of replica mounts are also propagated to the original mount.                                                                         |
| `slave`             | similar to a shared mount, but only in one direction. If the original mount exposes a sub-mount, the replica mount can see it. However, if the replica mount exposes a sub-mount, the original mount cannot see it. |
| `private`           | The mount is private. Sub-mounts within it are not exposed to replica mounts, and sub-mounts of replica mounts are not exposed to the original mount.                                                               |
| `rshared`           | The same as shared, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                            |
| `rslave`            | The same as slave, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                             |
| `rprivate`          | The default. The same as private, meaning that no mount points anywhere within the original or replica mount points propagate in either direction.                                                                  |
{% endcomment %}
| プロパゲーション設定 | 内容説明                                                                                                                                                                                                            |
|:--------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `shared`            | マウント元に対するサブマウントは、マウント先にも公開されます。マウント先に対するサブマウントも、マウント元に対して公開されます。|
| `slave`             | shared に類似。ただし一方向のみ。マウント元がサブマウントを公開するなら、マウント先でもこれを見ることができますが、マウント先がサブマウントを公開しても、マウント元からは見ることができません。|
| `private`           | マウントはプライベートなものになります。マウント元におけるサブマウントは、マウント先に公開されません。またマウント先のサブマウントも、マウント元には公開されません。|
| `rshared`           | shared と同様。, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                            |
| `rslave`            | slave と同様。, but the propagation also extends to and from mount points nested within any of the original or replica mount points.                                                                             |
| `rprivate`          | デフォルト。private と同様。つまりマウント元やマウント先に対するサブマウントは、どの方向にも伝播（propagate）しません。|
@z

@x
Before you can set bind propagation on a mount point, the host filesystem needs
to already support bind propagation.
@y
{% comment %}
Before you can set bind propagation on a mount point, the host filesystem needs
to already support bind propagation.
{% endcomment %}
マウントポイントに対してバインドプロパゲーションを設定するには、ホストのファイルシステムがバインドプロパゲーションに対応している必要があります。
@z

@x
For more information about bind propagation, see the
[Linux kernel documentation for shared subtree](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
For more information about bind propagation, see the
[Linux kernel documentation for shared subtree](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
バインドプロパゲーションの詳細は [Linux カーネルドキュメントの shared subtree](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
The following example mounts the `target/` directory into the container twice,
and the second mount sets both the `ro` option and the `rslave` bind propagation
option.
@y
{% comment %}
The following example mounts the `target/` directory into the container twice,
and the second mount sets both the `ro` option and the `rslave` bind propagation
option.
{% endcomment %}
以下の例では `target/` ディレクトリをコンテナーに対して 2 度マウントしています。
そして 2 つめのマウントでは `ro` オプションと、バインドプロパゲーションのオプション `rslave` を指定しています。
@z

@x
The `--mount` and `-v` examples have the same result.
@y
{% comment %}
The `--mount` and `-v` examples have the same result.
{% endcomment %}
`--mount` と `-v` によるそれぞれの例は、同一の結果になります。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-propagation"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#v-propagation"><code>-v</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-propagation" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-group="mount" data-target="#mount-propagation"><code>--mount</code></a></li>
  <li><a data-toggle="tab" data-group="volume" data-target="#v-propagation"><code>-v</code></a></li>
</ul>
<div class="tab-content">
<div id="mount-propagation" class="tab-pane fade in active" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app \
  --mount type=bind,source="$(pwd)"/target,target=/app2,readonly,bind-propagation=rslave \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source="$(pwd)"/target,target=/app \
  --mount type=bind,source="$(pwd)"/target,target=/app2,readonly,bind-propagation=rslave \
  nginx:latest
```
@z

@x
</div><!--mount-->
<div id="v-propagation" class="tab-pane fade" markdown="1">
@y
</div><!--mount-->
<div id="v-propagation" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app \
  -v "$(pwd)"/target:/app2:ro,rslave \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app \
  -v "$(pwd)"/target:/app2:ro,rslave \
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
Now if you create `/app/foo/`, `/app2/foo/` also exists.
@y
{% comment %}
Now if you create `/app/foo/`, `/app2/foo/` also exists.
{% endcomment %}
Now if you create `/app/foo/`, `/app2/foo/` also exists.
@z

@x
## Configure the selinux label
@y
{% comment %}
## Configure the selinux label
{% endcomment %}
{: #configure-the-selinux-label }
## selinux ラベルの設定
@z

@x
If you use `selinux` you can add the `z` or `Z` options to modify the selinux
label of the **host file or directory** being mounted into the container. This
affects the file or directory on the host machine itself and can have
consequences outside of the scope of Docker.
@y
{% comment %}
If you use `selinux` you can add the `z` or `Z` options to modify the selinux
label of the **host file or directory** being mounted into the container. This
affects the file or directory on the host machine itself and can have
consequences outside of the scope of Docker.
{% endcomment %}
`selinux` を利用している場合 `z` または `Z` オプションを使って、selinux ラベルを修正することができます。
修正するのは、コンテナーに対してマウントされている **ホスト上のファイルやディレクトリ** です。
つまりその結果はホストマシンそのもののファイルやディレクトリを変更するため、Docker の範囲外に影響を及ぼします。
@z

@x
- The `z` option indicates that the bind mount content is shared among multiple
  containers.
- The `Z` option indicates that the bind mount content is private and unshared.
@y
{% comment %}
- The `z` option indicates that the bind mount content is shared among multiple
  containers.
- The `Z` option indicates that the bind mount content is private and unshared.
{% endcomment %}
- `z` オプションは、複数コンテナー間においてバインドマウントされた内容を共有します。
- `Z` オプションは、バインドマウントされた内容はプライベートなものであって共有はされません。
@z

@x
Use **extreme** caution with these options. Bind-mounting a system directory
such as `/home` or `/usr` with the `Z` option renders your host machine
inoperable and you may need to relabel the host machine files by hand.
@y
{% comment %}
Use **extreme** caution with these options. Bind-mounting a system directory
such as `/home` or `/usr` with the `Z` option renders your host machine
inoperable and you may need to relabel the host machine files by hand.
{% endcomment %}
このオプションに対しては **最大限** 注意してください。
`Z` オプションを使って、`/home` や `/usr` などのようなシステムディレクトリをバインドマウントしてしまうと、ホストマシンは制御できなくなり、ホストマシン上のファイルに対するラベル設定を手動で行うことになります。
@z

@x
> **Important**: When using bind mounts with services, selinux labels
> (`:Z` and `:z`), as well as `:ro` are ignored. See
> [moby/moby #32579](https://github.com/moby/moby/issues/32579) for details.
{:.important}
@y
{% comment %}
> **Important**: When using bind mounts with services, selinux labels
> (`:Z` and `:z`), as well as `:ro` are ignored. See
> [moby/moby #32579](https://github.com/moby/moby/issues/32579) for details.
{:.important}
{% endcomment %}
> **重要**: バインドマウントをサービス内にて行った場合には、selinux ラベル（`:Z` や `:z`）は、`ro` と同じように無視されます。
> 詳しくは [moby/moby #32579](https://github.com/moby/moby/issues/32579) を参照してください。
{:.important}
@z

@x
This example sets the `z` option to specify that multiple containers can share
the bind mount's contents:
@y
{% comment %}
This example sets the `z` option to specify that multiple containers can share
the bind mount's contents:
{% endcomment %}
以下は `z` オプションの指定により、複数コンテナーがバインドマウント先を共有できるようにする例です。
@z

@x
It is not possible to modify the selinux label using the `--mount` flag.
@y
{% comment %}
It is not possible to modify the selinux label using the `--mount` flag.
{% endcomment %}
selinux ラベルの修正は `--mount` フラグでは行うことができません。
@z

@x
```bash
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app:z \
  nginx:latest
```
@y
```bash
$ docker run -d \
  -it \
  --name devtest \
  -v "$(pwd)"/target:/app:z \
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
- Learn about [volumes](volumes.md).
- Learn about [tmpfs mounts](tmpfs.md).
- Learn about [storage drivers](/storage/storagedriver/).
@y
{% comment %}
- Learn about [volumes](volumes.md).
- Learn about [tmpfs mounts](tmpfs.md).
- Learn about [storage drivers](/storage/storagedriver/).
{% endcomment %}
- [ボリューム](volumes.md) について学ぶ
- [tmpfs マウント](tmpfs.md) について学ぶ
- [ストレージドライバー](/storage/storagedriver/) について学ぶ
@z
