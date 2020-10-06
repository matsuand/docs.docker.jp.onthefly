%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Osxfs
keywords: mac, osxfs
redirect_from:
- /mackit/osxfs/
title: File system sharing (osxfs)
---
@y
---
description: Osxfs
keywords: mac, osxfs
redirect_from:
- /mackit/osxfs/
title: ファイルシステム共有（osxfs）
---
@z

@x
`osxfs` is a new shared file system solution, exclusive to Docker Desktop for Mac.
`osxfs` provides a close-to-native user experience for bind mounting macOS file
system trees into Docker containers. To this end, `osxfs` features a number of
unique capabilities as well as differences from a classical Linux file system.
@y
{% comment %}
`osxfs` is a new shared file system solution, exclusive to Docker Desktop for Mac.
`osxfs` provides a close-to-native user experience for bind mounting macOS file
system trees into Docker containers. To this end, `osxfs` features a number of
unique capabilities as well as differences from a classical Linux file system.
{% endcomment %}
`osxfs` は Docker Desktop for Mac 専用の新しい共有ファイルシステムソリューションです。
`osxfs` を使うと、macOS ファイルシステムツリーから Docker コンテナーにバインドマウントされたファイルを、ほぼ変わらない感覚で利用できます。
これを実現していることから `osxfs` には独自の機能が多く含まれ、Linux の従来のファイルシステムとは大きく異なります。
@z

@x
### Case sensitivity
@y
{% comment %}
### Case sensitivity
{% endcomment %}
{: #case-sensitivity }
### 大文字小文字の区別
@z

@x
With Docker Desktop for Mac, file systems operate in containers in the same way as they
operate in macOS. If a file system on macOS is case-insensitive, that behavior
is shared by any bind mount from macOS into a container.
@y
{% comment %}
With Docker Desktop for Mac, file systems operate in containers in the same way as they
operate in macOS. If a file system on macOS is case-insensitive, that behavior
is shared by any bind mount from macOS into a container.
{% endcomment %}
Docker Deskop for Mac を利用すると、ファイルシステムはコンテナー上でも動作し、macOS 上に動作するものと変わりません。
macOS 上のファイルシステムに大文字小文字の区別がなければ、macOS からコンテナーへのバインドマウントの動作は、すべて共通して取り扱うことができます。
@z

@x
On macOS Sierra and lower, the default file system is **HFS+**. On macOS High
Sierra, the default file system is **APFS**. Both are case-insensitive by
default but available in case-sensitive and case-insensitive variants.
@y
{% comment %}
On macOS Sierra and lower, the default file system is **HFS+**. On macOS High
Sierra, the default file system is **APFS**. Both are case-insensitive by
default but available in case-sensitive and case-insensitive variants.
{% endcomment %}
macOS Sierra またはそれ以前において、デフォルトのファイルシステムは **HFS+** です。
また macOS High Sierra のデフォルトファイルシステムは **APFS** です。
どちらもデフォルトにおいて、大文字小文字の区別は行いません。
しかし区別する方式と区別しない方式を選ぶことができます。
@z

@x
To get case-sensitive behavior, format the volume used in your bind mount as
HFS+ or APFS with case-sensitivity. See the
[APFS FAQ](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/APFS_Guide/FAQ/FAQ.html).
@y
{% comment %}
To get case-sensitive behavior, format the volume used in your bind mount as
HFS+ or APFS with case-sensitivity. See the
[APFS FAQ](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/APFS_Guide/FAQ/FAQ.html).
{% endcomment %}
大文字小文字を区別する場合は、バインドマウントに用いるボリュームを HFS+ または APFS でフォーマットする際に、大文字小文字を区別する設定を行います。
[APFS FAQ](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/APFS_Guide/FAQ/FAQ.html) を参照してください。
@z

@x
Reformatting your root partition is not recommended as some Mac software relies
on case-insensitivity to function.
@y
{% comment %}
Reformatting your root partition is not recommended as some Mac software relies
on case-insensitivity to function.
{% endcomment %}
ルートパーティションを再フォーマットすることは推奨されていません。
Mac ソフトウェアの中には、大文字小文字を区別しないファイルシステム上で動作するものがあるためです。
@z

@x
### Access control
@y
{% comment %}
### Access control
{% endcomment %}
{: #access-control }
### アクセス制御
@z

@x
`osxfs`, and therefore Docker, can access only those file system resources that
the Docker Desktop for Mac user has access to. `osxfs` does not run as `root`. If the macOS
user is an administrator, `osxfs` inherits those administrator privileges. We
are still evaluating which privileges to drop in the file system process to
balance security and ease-of-use. `osxfs` performs no additional permissions
checks and enforces no extra access control on accesses made through it. All
processes in containers can access the same objects in the same way as the
Docker user who started the containers.
@y
{% comment %}
`osxfs`, and therefore Docker, can access only those file system resources that
the Docker Desktop for Mac user has access to. `osxfs` does not run as `root`. If the macOS
user is an administrator, `osxfs` inherits those administrator privileges. We
are still evaluating which privileges to drop in the file system process to
balance security and ease-of-use. `osxfs` performs no additional permissions
checks and enforces no extra access control on accesses made through it. All
processes in containers can access the same objects in the same way as the
Docker user who started the containers.
{% endcomment %}
`osxfs` がアクセスするファイルシステムは、言い換えれば Docker がアクセスものです。
つまり Docker Desktop for Mac のユーザーだけがアクセスできるファイルシステムリソースです。
`osxfs` は `root` では動作しません。
macOS ユーザーが管理者権限を持っている場合、`osxfs` はその権限を継承します。
ファイルシステム処理において、どの権限を落としたらよいかは、今も検討を続けています。
これはセキュリティと使い勝手のバランスを考慮して取り決めるものです。
`osxfs` には、追加して実行される権限チェックはなく、ファイルシステムへの特別なアクセス制御もありません。
コンテナー内のプロセスはすべて、このコンテナーを起動させた Docker ユーザーがアクセスできる同一オブジェクトを、まったく変わらない方法でアクセスすることができます。
@z

@x
### Namespaces
@y
{% comment %}
### Namespaces
{% endcomment %}
{: #namespaces }
### 名前空間
@z

@x
Much of the macOS file system that is accessible to the user is also available to
containers using the `-v` bind mount syntax. The following command runs a container
from an image called `r-base` and shares the macOS user's `~/Desktop/` directory as
`/Desktop` in the container.
@y
{% comment %}
Much of the macOS file system that is accessible to the user is also available to
containers using the `-v` bind mount syntax. The following command runs a container
from an image called `r-base` and shares the macOS user's `~/Desktop/` directory as
`/Desktop` in the container.
{% endcomment %}
ユーザーがアクセス可能な macOS ファイルシステムの大部分は、`-v` を指定したバインドマウントを利用すれば、コンテナーからもアクセス可能になります。
以下のコマンドは `r-base` というイメージから作られるコンテナーを起動して、macOS ユーザーの `~/Desktop/` というディレクトリを、コンテナー内の `/Desktop` として共有します。
@z

@x
```bash
$ docker run -it -v ~/Desktop:/Desktop r-base bash
```
@y
```bash
$ docker run -it -v ~/Desktop:/Desktop r-base bash
```
@z

@x
The user's `~/Desktop/` directory is now visible in the container as a directory
under `/`.
@y
{% comment %}
The user's `~/Desktop/` directory is now visible in the container as a directory
under `/`.
{% endcomment %}
ユーザーの `~/Desktop/` ディレクトリは、コンテナー内においては、`/` 配下の 1 ディレクトリとして見えるようになります。
@z

@x
```
root@2h30fa0c600e:/# ls
Desktop	boot	etc	lib	lib64	media	opt	root	sbin	sys	usr
bin	dev	home	lib32	libx32	mnt	proc	run	srv	tmp	var
```
@y
```
root@2h30fa0c600e:/# ls
Desktop	boot	etc	lib	lib64	media	opt	root	sbin	sys	usr
bin	dev	home	lib32	libx32	mnt	proc	run	srv	tmp	var
```
@z

@x
By default, you can share files in `/Users/`, `/Volumes/`, `/private/`, and
`/tmp` directly. To add or remove directory trees that are exported to Docker,
use the **File sharing** tab in Docker preferences
![whale menu](images/whale-x.png){: .inline} -> **Preferences** ->
**File sharing**. (See [Preferences](index.md#file-sharing).)
@y
{% comment %}
By default, you can share files in `/Users/`, `/Volumes/`, `/private/`, and
`/tmp` directly. To add or remove directory trees that are exported to Docker,
use the **File sharing** tab in Docker preferences
![whale menu](images/whale-x.png){: .inline} -> **Preferences** ->
**File sharing**. (See [Preferences](index.md#file-sharing).)
{% endcomment %}
`/Users/`、`/Volumes/`、`/private/`、`/tmp` というディレクトリは、デフォルトにおいて直接共有することができます。
Docker に対して共有するディレクトリツリーを追加または削除するには、Docker preferences ![whale menu](images/whale-x.png){: .inline} -> **Preferences** -> **File sharing** にある **File sharing** タブを利用します。
[Preferences タブ](index.md#file-sharing) を参照してください。
@z

@x
All other paths
used in `-v` bind mounts are sourced from the Moby Linux VM running the Docker
containers, so arguments such as `-v /var/run/docker.sock:/var/run/docker.sock`
should work as expected. If a macOS path is not shared and does not exist in the
VM, an attempt to bind mount it fails rather than create it in the VM. Paths
that already exist in the VM and contain files are reserved by Docker and cannot
be exported from macOS.
@y
{% comment %}
All other paths
used in `-v` bind mounts are sourced from the Moby Linux VM running the Docker
containers, so arguments such as `-v /var/run/docker.sock:/var/run/docker.sock`
should work as expected. If a macOS path is not shared and does not exist in the
VM, an attempt to bind mount it fails rather than create it in the VM. Paths
that already exist in the VM and contain files are reserved by Docker and cannot
be exported from macOS.
{% endcomment %}
上記以外のパスの場合、`-v` バインドマウントに指定すると、Docker コンテナーを起動している Moby Linux VM が、その機能を実現します。
したがって `-v /var/run/docker.sock:/var/run/docker.sock` という指定が、思いどおりに動作します。
macOS のパスが共有されているものではなく、VM 上にも存在しない場合、そのパスが VM 上に生成されることなく、バインドマウントが失敗します。
パスが VM 上にすでに存在していて、そこにファイルが含まれている場合は、Docker がそれを利用するので、macOS からは参照できません。
@z

@x
> See **[Performance tuning for volume mounts (shared filesystems)](osxfs-caching.md)**
> to learn about new configuration options available with the Docker 17.04 CE Edge release.
@y
{% comment %}
> See **[Performance tuning for volume mounts (shared filesystems)](osxfs-caching.md)**
> to learn about new configuration options available with the Docker 17.04 CE Edge release.
{% endcomment %}
> Docker 17.04 CE 最新版（Edge）から利用可能になった新しい設定オプションについては **[ボリュームマウント（共有ファイルシステム）におけるパフォーマンスチューニング](osxfs-caching.md)** を参照してください。
@z

@x
### Ownership
@y
{% comment %}
### Ownership
{% endcomment %}
{: #ownership }
### 所有権
@z

@x
Initially, any containerized process that requests ownership metadata of an
object is told that its `uid` and `gid` own the object. When any containerized
process changes the ownership of a shared file system object, such as by using
the `chown` command, the new ownership information is persisted in the
`com.docker.owner` extended attribute of the object. Subsequent requests for
ownership metadata return the previously set values. Ownership-based permissions
are only enforced at the macOS file system level with all accessing processes
behaving as the user running Docker. If the user does not have permission to
read extended attributes on an object (such as when that object's permissions
are `0000`), `osxfs` attempts to add an access control list (ACL) entry that
allows the user to read and write extended attributes. If this attempt fails,
the object appears to be owned by the process accessing it until the extended
attribute is readable again.
@y
{% comment %}
Initially, any containerized process that requests ownership metadata of an
object is told that its `uid` and `gid` own the object. When any containerized
process changes the ownership of a shared file system object, such as by using
the `chown` command, the new ownership information is persisted in the
`com.docker.owner` extended attribute of the object. Subsequent requests for
ownership metadata return the previously set values. Ownership-based permissions
are only enforced at the macOS file system level with all accessing processes
behaving as the user running Docker. If the user does not have permission to
read extended attributes on an object (such as when that object's permissions
are `0000`), `osxfs` attempts to add an access control list (ACL) entry that
allows the user to read and write extended attributes. If this attempt fails,
the object appears to be owned by the process accessing it until the extended
attribute is readable again.
{% endcomment %}
コンテナー化されたプロセスがオブジェクトを取り扱う際に、そのオブジェクトの所有権メタデータを要求するときは、まずプロセスそのものの `uid` と `gid` がオブジェクトを所有するものであるかどうかが問われます。
コンテナー化されたプロセスが、共有ファイルシステムオブジェクトの所有権を `chown` コマンドなどを使って変更する場合、このオブジェクトの拡張属性 `com.docker.owner` の中に、新たな所有権の情報が保持されます。
所有権のメタデータがその後に続けて要求されても、返される値は以前に設定されていたものになります。
所有権に基づいたパーミッション処理は、macOS のファイルシステムのレベル内でのみ実施されます。
そこでのアクセスプロセスはすべて、Docker の起動ユーザーによって実行されるように振る舞います。
あるオブジェクトに対して、ユーザーが拡張属性を読み込む権限を持っていない場合（たとえばそのオブジェクトのパーミッションが `0000` である場合など）、`osxfs` は、そのユーザーが拡張属性の読み書きができるように、アクセス制御リスト（access control list; ACL）のエントリー追加を行おうとします。
エントリー追加に失敗した場合、その拡張属性が再び読み込み可能になるまでは、オブジェクトにアクセスしてきたプロセスが、そのオブジェクトを所有しているように見えます。
@z

@x
### File system events
@y
{% comment %}
### File system events
{% endcomment %}
{: #file-system-events }
### ファイルシステムイベント
@z

@x
Most `inotify` events are supported in bind mounts, and likely `dnotify` and
`fanotify` (though they have not been tested) are also supported. This means
that file system events from macOS are sent into containers and trigger any
listening processes there.
@y
{% comment %}
Most `inotify` events are supported in bind mounts, and likely `dnotify` and
`fanotify` (though they have not been tested) are also supported. This means
that file system events from macOS are sent into containers and trigger any
listening processes there.
{% endcomment %}
バインドマウントにおいては `inotify` イベントのほとんどがサポートされています。
また `dnotify` や `fanotify` のようなものも（テストはされていませんが）サポートされています。
つまり macOS からのファイルシステムイベントはコンテナーに送信され、そこで待ち受けているプロセスを起動させます。
@z

@x
The following are **supported file system events**:
@y
{% comment %}
The following are **supported file system events**:
{% endcomment %}
以下に示すのが、**サポートされているファイルシステムイベント** です。
@z

@x
* Creation
* Modification
* Attribute changes
* Deletion
* Directory changes
@y
{% comment %}
* Creation
* Modification
* Attribute changes
* Deletion
* Directory changes
{% endcomment %}
* 生成
* 変更
* 属性変更
* 削除
* ディレクトリ移動
@z

@x
The following are **partially supported file system events**:
@y
{% comment %}
The following are **partially supported file system events**:
{% endcomment %}
以下に示すのは、**部分的にサポートされているファイルシステムイベント** です。
@z

@x
* Move events trigger `IN_DELETE` on the source of the rename and
  `IN_MODIFY` on the destination of the rename
@y
{% comment %}
* Move events trigger `IN_DELETE` on the source of the rename and
  `IN_MODIFY` on the destination of the rename
{% endcomment %}
* 移動イベントは、名称変更する元の名前に対して `IN_DELETE` イベントを起動し、名称変更先の名前に対して `IN_MODIFY` イベントを起動します。
@z

@x
The following are **unsupported file system events**:
@y
{% comment %}
The following are **unsupported file system events**:
{% endcomment %}
以下は **サポートされていないファイルシステムイベント** です。
@z

@x
* Open
* Access
* Close events
* Unmount events (see [Mounts](#mounts))
@y
{% comment %}
* Open
* Access
* Close events
* Unmount events (see [Mounts](#mounts))
{% endcomment %}
* オープン
* アクセス
* クローズイベント
* アンマウントイベント（[マウント](#mounts) 参照）
@z

@x
Some events may be delivered multiple times. These limitations do not apply to
events between containers, only to those events originating in macOS.
@y
{% comment %}
Some events may be delivered multiple times. These limitations do not apply to
events between containers, only to those events originating in macOS.
{% endcomment %}
イベントの中には複数回送信されるものがあります。
こういった仕様は、コンテナー間のイベントには適用されません。
これが適用されるのは macOS から発生するイベントのみです。
@z

@x
### Mounts
@y
{% comment %}
### Mounts
{% endcomment %}
{: #mounts }
### マウント
@z

@x
The macOS mount structure is not visible in the shared volume, but volume
contents are visible. Volume contents appear in the same file system as the rest
of the shared file system. Mounting/unmounting macOS volumes that are also bind
mounted into containers may result in unexpected behavior in those containers.
Unmount events are not supported. Mount export support is planned but is still
under development.
@y
{% comment %}
The macOS mount structure is not visible in the shared volume, but volume
contents are visible. Volume contents appear in the same file system as the rest
of the shared file system. Mounting/unmounting macOS volumes that are also bind
mounted into containers may result in unexpected behavior in those containers.
Unmount events are not supported. Mount export support is planned but is still
under development.
{% endcomment %}
macOS のマウント構成は、共有ボリューム内から知ることはできません。
しかしボリュームの内容は見ることができます。
ボリューム内容は、他の共有ファイルシステムと変わることはなく、同じファイルシステム内のものとして見えます。
macOS のボリュームが同時にバインドマウントもされていた場合、これをマウント、アンマウントする際に、対象のコンテナーにおいて予期しない動作になることがあります。
アンマウントイベントはサポートされていません。
マウントエクスポートのサポートが計画されていますが、現在開発中です。
@z

@x
### Symlinks
@y
{% comment %}
### Symlinks
{% endcomment %}
{: #symlinks }
### シンボリックリンク
@z

@x
Symlinks are shared unmodified. This may cause issues when symlinks contain
paths that rely on the default case-insensitivity of the default macOS file
system.
@y
{% comment %}
Symlinks are shared unmodified. This may cause issues when symlinks contain
paths that rely on the default case-insensitivity of the default macOS file
system.
{% endcomment %}
シンボリックリンクは、変更されることなく共有されます。
デフォルトにおいて macOS のファイルシステムは、大文字小文字を区別しないものになっているため、これに基づいたパスを含むシンボリックリンクが用いられている場合には、問題が発生する場合があります。
@z

@x
### File types
@y
{% comment %}
### File types
{% endcomment %}
{: #file-types }
### ファイルタイプ
@z

@x
Symlinks, hardlinks, socket files, named pipes, regular files, and directories
are supported. Socket files and named pipes only transmit between containers and
between macOS processes -- no transmission across the hypervisor is supported,
yet. Character and block device files are not supported.
@y
{% comment %}
Symlinks, hardlinks, socket files, named pipes, regular files, and directories
are supported. Socket files and named pipes only transmit between containers and
between macOS processes -- no transmission across the hypervisor is supported,
yet. Character and block device files are not supported.
{% endcomment %}
サポートされるファイルタイプは、シンボリックリンク、ハードリンク、ソケットファイル、名前つきパイプ、通常のファイル、ディレクトリです。
ソケットファイルと名前つきパイプは、コンテナー間と macOS プロセス間においてのみ送信されます。
ただしハイパーバイザーにわたっての送信は、まだサポートされていません。
キャラクターデバイスファイル、ブロックデバイスファイルはサポートされていません。
@z

@x
### Extended attributes
@y
{% comment %}
### Extended attributes
{% endcomment %}
{: #extended-attributes }
### 拡張属性
@z

@x
Extended attributes are not yet supported.
@y
{% comment %}
Extended attributes are not yet supported.
{% endcomment %}
拡張属性はまだサポートされていません。
@z

@x
### Technology
@y
{% comment %}
### Technology
{% endcomment %}
{: #technology }
### 技術的事項
@z

@x
`osxfs` does not use OSXFUSE. `osxfs` does not run under, inside, or
between macOS userspace processes and the macOS kernel.
@y
{% comment %}
`osxfs` does not use OSXFUSE. `osxfs` does not run under, inside, or
between macOS userspace processes and the macOS kernel.
{% endcomment %}
`osxfs` は OSXFUSE を利用していません。
`osxfs` の処理は、どの macOS 名前空間のプロセス、macOS カーネルにも属さず無関係です。
@z

@x
### SSH agent forwarding
@y
{% comment %}
### SSH agent forwarding
{% endcomment %}
{: #ssh-agent-forwarding }
### SSH エージェント転送
@z

@x
Docker Desktop for Mac allows you to use the host’s SSH agent inside a container. To do this:
@y
{% comment %}
Docker Desktop for Mac allows you to use the host’s SSH agent inside a container. To do this:
{% endcomment %}
Docker Desktop for Mac では、コンテナー内部においてホストの SSH エージェントを利用することができます。
実現方法は以下のとおりです。
@z

@x
1. Bind mount the SSH agent socket by adding the following parameter to your `docker run` command:
@y
{% comment %}
1. Bind mount the SSH agent socket by adding the following parameter to your `docker run` command:
{% endcomment %}
1. SSH エージェントソケットをバインドマウントします。
   これは `docker run` コマンドに対して、以下のようなパラメーターを追加します。
@z

@x
    `--mount type=bind,src=/run/host-services/ssh-auth.sock,target=/run/host-services/ssh-auth.sock`
@y
    `--mount type=bind,src=/run/host-services/ssh-auth.sock,target=/run/host-services/ssh-auth.sock`
@z

@x
1. Add the `SSH_AUTH_SOCK` environment variable in your container:
@y
{% comment %}
1. Add the `SSH_AUTH_SOCK` environment variable in your container:
{% endcomment %}
1. コンテナー内にて、環境変数 `SSH_AUTH_SOCK` を追加します。
@z

@x
    `-e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock"`
@y
    `-e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock"`
@z

@x
To enable the SSH agent in Docker Compose, add the following flags to your service:
@y
{% comment %}
To enable the SSH agent in Docker Compose, add the following flags to your service:
{% endcomment %}
Docker Compose において SSH エージェントを有効にするには、以下のようにしてサービスにフラグ追加します。
@z

@x
 ```yaml
services:
  web:
    image: nginx:alpine
    volumes:
      - type: bind
        source: /run/host-services/ssh-auth.sock
        target: /run/host-services/ssh-auth.sock
    environment:
      - SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock
 ```
@y
 ```yaml
services:
  web:
    image: nginx:alpine
    volumes:
      - type: bind
        source: /run/host-services/ssh-auth.sock
        target: /run/host-services/ssh-auth.sock
    environment:
      - SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock
 ```
@z

@x
### Performance issues, solutions, and roadmap
@y
{% comment %}
### Performance issues, solutions, and roadmap
{% endcomment %}
{: #performance-issues-solutions-and-roadmap }
### 性能に関する問題、その対処と解決に向けて
@z

@x
> See **[Performance tuning for volume mounts (shared filesystems)](osxfs-caching.md)**
> to learn about new configuration options available with the Docker 17.04 CE Edge release.
@y
{% comment %}
> See **[Performance tuning for volume mounts (shared filesystems)](osxfs-caching.md)**
> to learn about new configuration options available with the Docker 17.04 CE Edge release.
{% endcomment %}
> Docker 17.04 CE 最新版（Edge）において利用可能な新しい設定オプションについては、**[ボリュームマウント（共有ファイルシステム）におけるパフォーマンスチューニング](osxfs-caching.md)** を参照してください。
@z

@x
With regard to reported performance issues ([GitHub issue 77: File access in
mounted volumes extremely slow](https://github.com/docker/for-mac/issues/77)),
and a similar thread on [Docker Desktop for Mac forums on topic: File access in mounted
volumes extremely
slow](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/),
this topic provides an explanation of the issues, recent progress in addressing
them, how the community can help us, and what you can expect in the
future. This explanation derives from a [post about understanding
performance](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/158)
by David Sheets (@dsheets) on the [Docker development
team](https://forums.docker.com/groups/Docker) to the forum topic just
mentioned. We want to surface it in the documentation for wider reach.
@y
{% comment %}
With regard to reported performance issues ([GitHub issue 77: File access in
mounted volumes extremely slow](https://github.com/docker/for-mac/issues/77)),
and a similar thread on [Docker Desktop for Mac forums on topic: File access in mounted
volumes extremely
slow](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/),
this topic provides an explanation of the issues, recent progress in addressing
them, how the community can help us, and what you can expect in the
future. This explanation derives from a [post about understanding
performance](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/158)
by David Sheets (@dsheets) on the [Docker development
team](https://forums.docker.com/groups/Docker) to the forum topic just
mentioned. We want to surface it in the documentation for wider reach.
{% endcomment %}
報告されている性能問題（[GitHub issue 77: File access in
mounted volumes extremely slow](https://github.com/docker/for-mac/issues/77)）と、同じようなスレッド（[Docker Desktop for Mac forums on topic: File access in mounted volumes extremely slow](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/)）に関して、ここでその問題の説明を行います。
そして現時点の状況やコミュニティの助言内容、そして将来どのようなことが期待できるかを示します。
この説明は [Docker 開発チーム](https://forums.docker.com/groups/Docker) の David Sheets（@dsheets）がフォーラムのトピックとして書き記した [性能への理解に関する投稿](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/158) に基づいています。
ここにこれを取り上げて、広く伝えたいと思います。
@z

@x
#### Understanding performance
@y
{% comment %}
#### Understanding performance
{% endcomment %}
{: #understanding-performance }
#### 性能に関する理解
@z

@x
Perhaps the most important thing to understand is that shared file system
performance is multi-dimensional. This means that, depending on your workload,
you may experience exceptional, adequate, or poor performance with `osxfs`, the
file system server in Docker Desktop for Mac. File system APIs are very wide (20-40
message types) with many intricate semantics  involving on-disk state, in-memory
cache state, and concurrent access by multiple  processes. Additionally, `osxfs`
integrates a mapping between macOS's FSEvents API and Linux's `inotify` API
which is implemented inside of the file system itself, complicating matters
further (cache behavior in particular).
@y
{% comment %}
Perhaps the most important thing to understand is that shared file system
performance is multi-dimensional. This means that, depending on your workload,
you may experience exceptional, adequate, or poor performance with `osxfs`, the
file system server in Docker Desktop for Mac. File system APIs are very wide (20-40
message types) with many intricate semantics  involving on-disk state, in-memory
cache state, and concurrent access by multiple  processes. Additionally, `osxfs`
integrates a mapping between macOS's FSEvents API and Linux's `inotify` API
which is implemented inside of the file system itself, complicating matters
further (cache behavior in particular).
{% endcomment %}
おそらく一番理解しておかなければならないのは、共有ファイルシステムの性能が多次元的であるということです。
これがどういうことかと言えば、Docker Desktop for Mac におけるファイルシステムサーバー `osxfs` を用いる際の性能は、処理内容に依存して特定的なものになり得るし、適切なもの、劣化したものにもなり得るということです。
ファイルシステムの API は広範囲（メッセージの種類が 20 から 40）におよび、文法も複雑化しています。
処理内容についても、ディスク状態、インメモリのキャッシュ状態、複数プロセスからの同時アクセスといったことに対応づいています。
さらに `osxfs` は、macOS の FSEvents API と Linux の `inotify` API をマッピング統合しており、これはファイルシステム内に実装されているものであるため、状況をさらに複雑にしています（キャッシュに関する動作が特に顕著です）。
@z

@x
At the highest level, there are two dimensions to file system performance:
throughput (read/write IO) and latency (roundtrip time). In a traditional file
system on a modern SSD, applications can generally expect throughput of a few
GB/s. With large sequential IO operations, `osxfs` can achieve throughput of
around 250 MB/s which, while not native speed, is not likely to be the bottleneck for
most applications which perform acceptably on HDDs.
@y
{% comment %}
At the highest level, there are two dimensions to file system performance:
throughput (read/write IO) and latency (roundtrip time). In a traditional file
system on a modern SSD, applications can generally expect throughput of a few
GB/s. With large sequential IO operations, `osxfs` can achieve throughput of
around 250 MB/s which, while not native speed, is not likely to be the bottleneck for
most applications which perform acceptably on HDDs.
{% endcomment %}
高度なレベルとして、ファイルシステムの性能には 2 つの観点、つまりスループット（読み込み/書き出しの IO）と待ち時間（ラウンドトリップ時間）があります。
従来のファイルシステムであっても最新の SSD 上であれば、一般にスループットは数 GB/秒程度が期待されます。
IO 操作が継続する場合でも、`osxfs` でのスループットは訳 250 MB/秒を達成します。
ネイティブ処理ではないため、この程度の速度になっていますが、それでも HDD に対して求められる性能として、これがボトルネックとなるアプリケーションはほとんどありません。
@z

@x
Latency is the time it takes for a file system call to complete. For instance,
the time between a thread issuing write in a container and resuming with the
number of bytes written. With a classical block-based file system, this latency
is typically under 10μs (microseconds). With `osxfs`, latency is presently
around 130μs for most operations or 13× slower. For workloads which demand many
sequential roundtrips, this results in significant observable slowdown.
Reducing the latency requires shortening the data path from a Linux system call to
macOS and back again. This requires tuning each component in the data path in
turn -- some of which require significant engineering effort. Even if we achieve
a huge latency reduction of 65μs/roundtrip, we still "only" see a doubling
of performance. This is typical of performance engineering, which requires
significant effort to analyze slowdowns and develop optimized components. We
know a number of approaches that may reduce the roundtrip time but we
haven't implemented all those improvements yet (more on this below in
[What you can do](osxfs.md#what-you-can-do)).
@y
{% comment %}
Latency is the time it takes for a file system call to complete. For instance,
the time between a thread issuing write in a container and resuming with the
number of bytes written. With a classical block-based file system, this latency
is typically under 10μs (microseconds). With `osxfs`, latency is presently
around 130μs for most operations or 13× slower. For workloads which demand many
sequential roundtrips, this results in significant observable slowdown.
Reducing the latency requires shortening the data path from a Linux system call to
macOS and back again. This requires tuning each component in the data path in
turn -- some of which require significant engineering effort. Even if we achieve
a huge latency reduction of 65μs/roundtrip, we still "only" see a doubling
of performance. This is typical of performance engineering, which requires
significant effort to analyze slowdowns and develop optimized components. We
know a number of approaches that may reduce the roundtrip time but we
haven't implemented all those improvements yet (more on this below in
[What you can do](osxfs.md#what-you-can-do)).
{% endcomment %}
待ち時間（latency）とは、ファイルシステム呼び出しが完了するまでの所要時間のことです。
たとえばコンテナー内のスレッドが、書き込みを行ってから、次に相当バイト数の書き込みができるようになるまでの時間、といったものです。
これまでのブロックベースのファイルシステムでは、この待ち時間は普通は 10μs（マイクロ秒）以下です。
`osxfs` においてこの待ち時間は、たいていの操作において 130μs 程度、つまり 13 倍遅いということになります。
連続してラウンドトリップを要求する処理において、この値は無視できないほどの重大な性能劣化を引き起こします。
待ち時間を軽減させるためには、Linux システムコールのデータパスを、macOS 向けに短くすることが必要です。
そうなると、今度は開発コンポーネント内のデータパスを調整する必要が出てくることになり、つまり開発者の不断の努力が必要にあるということです。
待ち時間の大幅な削減を目指したところ、ラウンドトリップあたり 65μs になったのですが、これでもまだ 2 倍の性能低下があります。
これこそまさに性能エンジニアリングであり、性能劣化の原因究明と最適化コンポーネントの開発という努力が欠かせないものです。
ラウンドトリップ時間を低減させる数々のアプローチが考えられるものの、これをすべて実装できるところまでには至っていません。
（詳しくは以降の [何ができるか](osxfs.md#what-you-can-do) を参照してください。）
@z

@x
A second approach to improving performance is to reduce the number of
roundtrips by caching data.  Recent versions of Docker Desktop for Mac (17.04 onwards)
include caching support that brings significant (2-4×) improvements to many
applications.  Much of the overhead of osxfs arises from the requirement to
keep the container's and the host's view of the file system consistent, but
full consistency is not necessary for all applications and relaxing the
constraint opens up a number of opportunities for improved performance.
@y
{% comment %}
A second approach to improving performance is to reduce the number of
roundtrips by caching data.  Recent versions of Docker Desktop for Mac (17.04 onwards)
include caching support that brings significant (2-4×) improvements to many
applications.  Much of the overhead of osxfs arises from the requirement to
keep the container's and the host's view of the file system consistent, but
full consistency is not necessary for all applications and relaxing the
constraint opens up a number of opportunities for improved performance.
{% endcomment %}
性能向上のため次に行うのは、キャッシュデータを使ってラウンドトリップの回数を減らすことです。
最近の Docker Desktop for Mac（17.04 以降）にはキャッシングサポートがあり、アプリケーションの多くに対して大きな（2 倍から 4 倍の）性能向上をもたらしています。
osxfs のオーバーヘッドのほとんどは、コンテナーとホストの双方から見て、ファイルシステムの一貫性を保つところから生じるものです。
ただしあらゆるアプリケーションにとって、完全な一貫性が必要になるわけではないので、
この制約を緩和すれば、性能向上の機会が増えることになります。
@z

@x
At present there is support for read caching, with which the container's view
of the file system can temporarily drift apart from the authoritative view on
the host.  Further caching developments, including support for write caching,
are planned.
A [detailed description of the behavior in various caching configurations](osxfs-caching)
is available.
@y
{% comment %}
At present there is support for read caching, with which the container's view
of the file system can temporarily drift apart from the authoritative view on
the host.  Further caching developments, including support for write caching,
are planned.
A [detailed description of the behavior in various caching configurations](osxfs-caching)
is available.
{% endcomment %}
今のところサポートされているのは、読み込みに関するキャッシングです。
これを用いることで、コンテナーから見たファイルシステムは、ホスト上の信頼できるデータとは一時的に切り離されることになります。
キャッシングに関する開発として、特に書き込みキャッシングに対するサポートが計画されています。
[さまざまなキャッシュ設定に対する諸動作についての詳細](osxfs-caching) も参照してください。
@z

@x
#### What we are doing
@y
{% comment %}
#### What we are doing
{% endcomment %}
{: #what-we-are-doing }
#### 対応を進めていること
@z

@x
We continue to actively work on increasing caching and on reducing the
file system data path latency. This requires significant analysis of file
system traces and speculative development of system improvements to try to
address specific performance issues. Perhaps surprisingly, application
workload can have a huge effect on performance. As an example, here are two
different use cases contributed on the
[forum topic](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/)
and how their performance differs and suffers due to latency, caching, and
coherence:
@y
{% comment %}
We continue to actively work on increasing caching and on reducing the
file system data path latency. This requires significant analysis of file
system traces and speculative development of system improvements to try to
address specific performance issues. Perhaps surprisingly, application
workload can have a huge effect on performance. As an example, here are two
different use cases contributed on the
[forum topic](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/)
and how their performance differs and suffers due to latency, caching, and
coherence:
{% endcomment %}
Docker ではキャッシングの増加とファイルシステムのデータパスによる待ち時間の低減を、それぞれ積極的に推し進めています。
これを実現するためには、ファイルシステムのトレース情報を十分に分析し、システム改善に向けて推論的な開発も行って、特定の性能問題ごとに対処を進めていくことが必要です。
おそらく思った以上に、アプリケーション処理は、性能に対して非常に大きな影響を及ぼします。
例として [フォーラムのトピック](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/) として投稿された以下の 2 つの異なるユースケースを示します。
そこでは待ち時間、キャッシング、一貫性を目指す結果として、性能がどのように変化し影響を受けるかを見ています。
@z

@x
1. A rake example (see below) appears to attempt to access 37000+
different files that don't exist on the shared volume. Even with a 2× speedup
via latency reduction this use case still seems "slow".
With caching enabled the performance increases around 3.5×, as described in
the [user-guided caching post](https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/).
We expect to see further performance improvements for rake with a "negative dcache" that
keeps track of, in the Linux kernel itself, the files that do not exist.
However, even this is not sufficient for the first time rake is run on a
shared directory. To handle that case, we actually need to develop a Linux
kernel patch which negatively caches all directory entries not in a
specified set -- and this cache must be kept up-to-date in real-time with the macOS
file system state even in the presence of missing macOS FSEvents messages and
so must be invalidated if macOS ever reports an event delivery failure.
@y
{% comment %}
1. A rake example (see below) appears to attempt to access 37000+
different files that don't exist on the shared volume. Even with a 2× speedup
via latency reduction this use case still seems "slow".
With caching enabled the performance increases around 3.5×, as described in
the [user-guided caching post](https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/).
We expect to see further performance improvements for rake with a "negative dcache" that
keeps track of, in the Linux kernel itself, the files that do not exist.
However, even this is not sufficient for the first time rake is run on a
shared directory. To handle that case, we actually need to develop a Linux
kernel patch which negatively caches all directory entries not in a
specified set -- and this cache must be kept up-to-date in real-time with the macOS
file system state even in the presence of missing macOS FSEvents messages and
so must be invalidated if macOS ever reports an event delivery failure.
{% endcomment %}
1. rake の利用例（以降を参照）では、共有ボリュームには存在していない 37000 以上のファイルへのアクセスを試みます。
待ち時間の短縮により 2 倍の速度向上がなされたものの、このユースケースはそれでも「遅い」と感じられます。
[user-guided caching post](https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/) にて示されているように、キャッシングを有効にすると、性能は 3.5 倍程度に改善されました。
存在しないファイルを追跡する「負の dcache 値」（negative dcache）を Linux カーネル自体に適用すれば、rake の性能はさらに向上するものと期待されます。
しかし共有ディレクトリ上で rake を実行してみても、それでは満足できるものにはなりませんでした。
このケースを取り扱うため、Linux カーネルへのパッチの開発が必要になります。
このパッチでは、指定される設定にはないディレクトリエントリーに対して、ネガティブキャッシュによる応答を行うようにしました。
ただしこのキャッシュは、macOS の FSEvents メッセージがない状況にあっても、macOS のファイルシステムの状態をリアルタイムで最新に更新しておく必要があるため、macOS がイベント配信の失敗を報告するときでさえ、キャッシュを無効にする必要があります。
@z

@x
2. Running `ember build` in a shared file system results in ember creating many
different temporary directories and performing lots of intermediate activity
within them. An empty ember project is over 300MB. This usage pattern does not
require coherence between Linux and macOS, and is significantly improved by
write caching.
@y
{% comment %}
2. Running `ember build` in a shared file system results in ember creating many
different temporary directories and performing lots of intermediate activity
within them. An empty ember project is over 300MB. This usage pattern does not
require coherence between Linux and macOS, and is significantly improved by
write caching.
{% endcomment %}
2. 共有ファイルシステム上において `ember build` を実行すると、ember がさまざまな一時ディレクトリを生成し、そこにおいて数多くの中間処理を実行します。
空の ember プロジェクトでも、その容量は 300 MB を越えます。
この利用パターンにおいては Linux と macOS 間の一貫性を必要とせず、書き込みキャッシュによって性能は大幅に改善されます。
@z

@x
These two examples come from performance use cases contributed by users and they
are incredibly helpful in prioritizing aspects of file system performance to
improve. We are developing statistical file system trace analysis tools
to characterize slow-performing workloads more easily to decide what to
work on next.
@y
{% comment %}
These two examples come from performance use cases contributed by users and they
are incredibly helpful in prioritizing aspects of file system performance to
improve. We are developing statistical file system trace analysis tools
to characterize slow-performing workloads more easily to decide what to
work on next.
{% endcomment %}
上の 2 つの例は、ユーザーが提供する性能関連のユースケースに基づいています。
そしてこの例は、ファイルシステムの性能改善に対して、優先順位をつけながら取り組む方法として、非常に有用なものです。
現在は、統計手法によりファイルシステムトレースを解析するツールを開発中です。
これにより、性能劣化した処理を特定して、次に何に取り組むべきかを容易に判断できるようにしていきます。
@z

@x
Under development, we have:
@y
{% comment %}
Under development, we have:
{% endcomment %}
開発中のものとして以下に取り組んでいます。
@z

@x
1. A growing performance test suite of real world use cases (more on this below
in What you can do)
@y
{% comment %}
1. A growing performance test suite of real world use cases (more on this below
in What you can do)
{% endcomment %}
1. 実際のユースケースに基づく高性能テストスイートを開発しています。
   （後述の「何ができるか」に示す以上のことを行っています。）
@z

@x
2. Further caching improvements, including negative, structural, and write-back
caching, and lazy cache invalidation.
@y
{% comment %}
2. Further caching improvements, including negative, structural, and write-back
caching, and lazy cache invalidation.
{% endcomment %}
2. さらなるキャッシングの改善を行っています。
   ネガティブキャッシュ、構造キャッシュ、書き戻しキャッシュ、lazy キャッシュの無効化、などを行っています。
@z

@x
3. A Linux kernel patch to reduce data path latency by 2/7 copies and 2/5
context switches
@y
{% comment %}
3. A Linux kernel patch to reduce data path latency by 2/7 copies and 2/5
context switches
{% endcomment %}
3. Linux カーネルパッチにより、データパスに関する遅延を軽減し、コピーを 7 分の 2、コンテキスト切り替えを 5 分の 2 にしています。
@z

@x
4. Increased macOS integration to reduce the latency between the hypervisor and
the file system server
@y
{% comment %}
4. Increased macOS integration to reduce the latency between the hypervisor and
the file system server
{% endcomment %}
4. macOS との統合を推し進め、ハイパーバイザーとファイルシステムサーバーとの間の遅延を軽減しています。
@z

@x
#### What you can do
@y
{% comment %}
#### What you can do
{% endcomment %}
{: #what-you-can-do }
#### 何ができるか
@z

@x
When you report shared file system performance issues, it is most helpful to
include a minimal Real World reproduction test case that demonstrates poor
performance.
@y
{% comment %}
When you report shared file system performance issues, it is most helpful to
include a minimal Real World reproduction test case that demonstrates poor
performance.
{% endcomment %}
共有ファイルシステムの性能に関する問題を報告する場合、最も役に立つのが、性能低下を引き起こす、最低限で再現可能なテストケースを含めていただくことです。
@z

@x
Without a reproduction, it is very difficult for us to analyze your use case and
determine what improvements would speed it up. When you don't provide a
reproduction, one of us needs to figure out the specific software
you are using and guess and hope that we have configured it in a typical way or
a way that has poor performance. That usually takes 1-4 hours depending on your
use case and once it is done, we must then determine what regular performance is
like and what kind of slow-down your use case is experiencing. In some cases, it
is not obvious what operation is even slow in your specific development
workflow. The additional set-up to reproduce the problem means we have less time
to fix bugs, develop analysis tools, or improve performance. So, include
simple, immediate performance issue reproduction test cases. The [rake
reproduction
case](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/103)
by @hirowatari shown in the forums thread is a great example.
@y
{% comment %}
Without a reproduction, it is very difficult for us to analyze your use case and
determine what improvements would speed it up. When you don't provide a
reproduction, one of us needs to figure out the specific software
you are using and guess and hope that we have configured it in a typical way or
a way that has poor performance. That usually takes 1-4 hours depending on your
use case and once it is done, we must then determine what regular performance is
like and what kind of slow-down your use case is experiencing. In some cases, it
is not obvious what operation is even slow in your specific development
workflow. The additional set-up to reproduce the problem means we have less time
to fix bugs, develop analysis tools, or improve performance. So, include
simple, immediate performance issue reproduction test cases. The [rake
reproduction
case](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/103)
by @hirowatari shown in the forums thread is a great example.
{% endcomment %}
この再現方法がないと、ユースケースの分析がなかなか難しくなり、どういった改修を行えば速度改善が図れるのかが決定できません。
再現方法が示されていなければ、解析担当の誰かが利用ソフトウェアを特定し、標準的な設定方法や性能劣化する設定方法を推測したり予想したりするわけです。
これにはユースケースにもよりますが、普通は 1 ～ 4 時間程度はかかります。
これができたとして、この後には通常の性能を発揮するのがどのようなものであって、そのユースケースにとってどのような速度低下の要因があるのかを決定していかなければなりません。
場合にもよりますが、特定開発環境下において、どんな操作が性能低下を引き起こすのか、明確ではないことがあります。
再現のために行う作業が多ければ、それだけバグフィックス、解析ツールの開発、性能改善にかけられる時間が減ってしまいます。
したがって簡単で即座に利用できる、性能問題の再現テストケースを含めてください。
フォーラムスレッド内に示されている @hirowatari による [rake の再現ケース](https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/103) が、非常に参考となる例です。
@z

@x
This example originally provided:
@y
{% comment %}
This example originally provided:
{% endcomment %}
その例では、そもそも以下を提供しています。
@z

@x
1. A version-controlled repository so any changes/improvements to the test case
can be easily tracked.
@y
{% comment %}
1. A version-controlled repository so any changes/improvements to the test case
can be easily tracked.
{% endcomment %}
1. バージョン管理されたリポジトリを利用しています。
   したがってテストケースに加えられた変更点や改善点を容易に追跡できます。
@z

@x
2. A Dockerfile which constructs the exact image to run
@y
{% comment %}
2. A Dockerfile which constructs the exact image to run
{% endcomment %}
2. 実行イメージを作り出す Dockerfile を含めています。
@z

@x
3. A command-line invocation of how to start the container
@y
{% comment %}
3. A command-line invocation of how to start the container
{% endcomment %}
3. コンテナーを起動するためのコマンドライン実行手順を示しています。
@z

@x
4. A straight-forward way to measure the performance of the use case
@y
{% comment %}
4. A straight-forward way to measure the performance of the use case
{% endcomment %}
4. ユースケースの性能をごく簡単に測定する方法を示しています。
@z

@x
5. A clear explanation (README) of how to run the test case
@y
{% comment %}
5. A clear explanation (README) of how to run the test case
{% endcomment %}
5. テストケースをどうやって実行するのかを、わかりやすく（README により）説明しています。
@z

@x
#### What you can expect
@y
{% comment %}
#### What you can expect
{% endcomment %}
{: #what-you-can-expect }
#### 期待できること
@z

@x
We continue to work toward an optimized shared file system implementation
on the Edge channel of Docker Desktop for Mac.
@y
{% comment %}
We continue to work toward an optimized shared file system implementation
on the Edge channel of Docker Desktop for Mac.
{% endcomment %}
Docker Desktop for Mac の最新版（Edge）チャネルにおいては、最適化された共有ファイルシステムの実装に向けて、常に開発し続けています。
@z

@x
You can expect some of the performance improvement work mentioned above to reach
the Edge channel in the coming release cycles.
@y
{% comment %}
You can expect some of the performance improvement work mentioned above to reach
the Edge channel in the coming release cycles.
{% endcomment %}
上で示したような性能改善結果は、最新版（Edge）チャネルから公開される最新リリースを通じて、ある程度は得られます。
@z

@x
We plan to eventually open source all of our shared file system components. At
that time, we would be very happy to collaborate with you on improving the
implementation of `osxfs` and related software.
@y
{% comment %}
We plan to eventually open source all of our shared file system components. At
that time, we would be very happy to collaborate with you on improving the
implementation of `osxfs` and related software.
{% endcomment %}
最終的にこの共有ファイルシステムコンポーネントはオープンソースとして公開する予定です。
そのときには、`osxfs` および関連ソフトウェアの機能改善を、みなさんとともに実現できたということになります。
@z

@x
We also plan to write up and publish further details of shared file system
performance analysis and improvement on the Docker blog. Look for or nudge
@dsheets about those articles, which should serve as a jumping off point for
understanding the system, measuring it, or contributing to it.
@y
{% comment %}
We also plan to write up and publish further details of shared file system
performance analysis and improvement on the Docker blog. Look for or nudge
@dsheets about those articles, which should serve as a jumping off point for
understanding the system, measuring it, or contributing to it.
{% endcomment %}
また共有ファイルシステムの性能分析に関しては、しっかりと文書にまとめて公開するつもりです。
そして Docker ブログを更新していきます。
関連する記事について @dsheets の情報を探して様子を覗いてみてください。
システムを理解し測定方法の要点を知ることができ、またシステムに貢献する方法も知るきっかけになるはずです。
@z

@x
#### Wrapping Up
@y
{% comment %}
#### Wrapping Up
{% endcomment %}
{: #wrapping-up }
#### まとめ
@z

@x
We hope this gives you a rough idea of where `osxfs` performance is and where
it's going. We are treating good performance as a top priority feature of the
file system sharing component and we are actively working on improving it
through a number of different avenues. The osxfs project started in December
2015. Since the first integration into Docker Desktop for Mac in February 2016, we've
improved performance by 50x or more for many workloads while achieving nearly
complete POSIX compliance and without compromising coherence (it is shared and
not simply synced). Of course, in the beginning there was lots of low-hanging
fruit and now many of the remaining performance improvements require significant
engineering work on custom low-level components.
@y
{% comment %}
We hope this gives you a rough idea of where `osxfs` performance is and where
it's going. We are treating good performance as a top priority feature of the
file system sharing component and we are actively working on improving it
through a number of different avenues. The osxfs project started in December
2015. Since the first integration into Docker Desktop for Mac in February 2016, we've
improved performance by 50x or more for many workloads while achieving nearly
complete POSIX compliance and without compromising coherence (it is shared and
not simply synced). Of course, in the beginning there was lots of low-hanging
fruit and now many of the remaining performance improvements require significant
engineering work on custom low-level components.
{% endcomment %}
`osxfs` の性能に関すること、そしてそれがどのように進んでいるのか、おおまかな捉え方については説明できたと思います。
共有ファイルシステムコンポーネントの機能に関しては、優れた性能を実現することを最重要課題としています。
これに従って、さまざまな角度から改善に取り組んでいます。
osxfs プロジェクトは 2015 年 12 月に開始されました。
2016 年 2 月には Docker Desktop for Mac に初めて統合され、（単なる同期処理ではなく共有処理として）一貫性を損なうことなく、ほぼ完全な POSIX コンプライアンスを達成し、多くの処理場面において 50 倍以上の性能改善を実現してきました。
はじめのうちは成果をあげられなかったものばかりでしたが、今では性能改善の余地として残されているのは、低レベルコンポーネントに改善を加えるという重大な技術作業のみ、というところまでになっています。
@z

@x
We appreciate your understanding as we continue development of the product and
work on all dimensions of performance. We want to continue to work with the
community on this, so continue to report issues as you find them. We look
forward to collaborating with you on ideas and on the source code itself.
@y
{% comment %}
We appreciate your understanding as we continue development of the product and
work on all dimensions of performance. We want to continue to work with the
community on this, so continue to report issues as you find them. We look
forward to collaborating with you on ideas and on the source code itself.
{% endcomment %}
製品の開発を続けながら、あらゆる次元の性能改善に取り組みますので、ご理解のほどよろしくお願いいたします。
この問題に関しては、コミュニティと連携して作業を進めたいと思っています。
何か問題が発生したら、引き続き報告をお願いいたします。
何かのアイデアや修正ソースのご提案を通じて、みなさんと協力しながら進めていく考えです。
@z
