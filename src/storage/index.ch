%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Overview of persisting data in containers
title: Manage data in Docker
keywords: storage, persistence, data persistence, volumes, mounts, bind mounts
redirect_from:
- engine/admin/volumes/
---
@y
---
description: コンテナー内にデータを保持するための概要
title: Docker におけるデータ管理
keywords: storage, persistence, data persistence, volumes, mounts, bind mounts
redirect_from:
- engine/admin/volumes/
---
@z

@x
By default all files created inside a container are stored on a writable
container layer. This means that:
@y
{% comment %}
By default all files created inside a container are stored on a writable
container layer. This means that:
{% endcomment %}
コンテナー内に生成されたファイルは、デフォルトではすべて書き込み可能なコンテナーレイヤーに保存されます。
これは以下を意味します。
@z

@x
- The data doesn't persist when that container no longer exists, and it can be
  difficult to get the data out of the container if another process needs it.
- A container's writable layer is tightly coupled to the host machine
  where the container is running. You can't easily move the data somewhere else.
- Writing into a container's writable layer requires a
  [storage driver](/storage/storagedriver/) to manage the
  filesystem. The storage driver provides a union filesystem, using the Linux
  kernel. This extra abstraction reduces performance as compared to using
  _data volumes_, which write directly to the host filesystem.
@y
{% comment %}
- The data doesn't persist when that container no longer exists, and it can be
  difficult to get the data out of the container if another process needs it.
- A container's writable layer is tightly coupled to the host machine
  where the container is running. You can't easily move the data somewhere else.
- Writing into a container's writable layer requires a
  [storage driver](/storage/storagedriver/) to manage the
  filesystem. The storage driver provides a union filesystem, using the Linux
  kernel. This extra abstraction reduces performance as compared to using
  _data volumes_, which write directly to the host filesystem.
{% endcomment %}
- コンテナーが存在しなくなると、データを保持しておくことができなくなります。
  そのデータをコンテナーの外部から取得したいと思っても、外部プロセスがこれを行うことは極めて困難になります。
- コンテナーの書き込み可能レイヤーは、コンテナーが稼動しているホストマシンに強く結び付けられています。
  したがってその中のデータをどこかに移動させることは容易ではありません。
- コンテナーの書き込み可能レイヤーにデータを書き込むためには、ファイルシステムを管理する [ストレージドライバー](/storage/storagedriver/) が必要になります。
  このストレージドライバーは、Linux カーネルを利用してユニオンファイルシステム（union filesystem）を提供します。
  この特別な抽象ファイルシステムは **データボリューム** に比べると性能が劣ります。
  データボリュームであれば、ホストのファイルシステムに直接データを書き込むことができます。
@z

@x
Docker has two options for containers to store files in the host machine, so
that the files are persisted even after the container stops: _volumes_, and
_bind mounts_. If you're running Docker on Linux you can also use a _tmpfs mount_.
If you're running Docker on Windows you can also use a _named pipe_.
@y
{% comment %}
Docker has two options for containers to store files in the host machine, so
that the files are persisted even after the container stops: _volumes_, and
_bind mounts_. If you're running Docker on Linux you can also use a _tmpfs mount_.
If you're running Docker on Windows you can also use a _named pipe_.
{% endcomment %}
Docker コンテナーにおけるファイルをホストマシン上に保存する方法は 2 つあります。
これを行えば、コンテナーが停止した後にもデータを維持していくことができます。
その 2 つの方法とは **ボリューム** と **バインドマウント** です。
Linux 上において Docker を稼動していれば、さらに **tmpfs マウント** を用いることもできます。
Windows 上において Docker を稼動していれば、**名前つきパイプ**（named pipe）を用いることもできます。
@z

@x
Keep reading for more information about these two ways of persisting data.
@y
{% comment %}
Keep reading for more information about these two ways of persisting data.
{% endcomment %}
データを保持するためのこの 2 つの方法について、さらに具体的に読み進めてください。
@z

@x
## Choose the right type of mount
@y
{% comment %}
## Choose the right type of mount
{% endcomment %}
{: #choose-the-right-type-of-mount }
## 適切なマウント方法の選定
@z

@x
No matter which type of mount you choose to use, the data looks the same from
within the container. It is exposed as either a directory or an individual file
in the container's filesystem.
@y
{% comment %}
No matter which type of mount you choose to use, the data looks the same from
within the container. It is exposed as either a directory or an individual file
in the container's filesystem.
{% endcomment %}
どの種類のマウント方法を選んだとしても、コンテナー内部からのデータの見え方は同じです。
そのデータはコンテナー内のファイルシステム上において、ディレクトリとして見えるか、あるいは個別のファイルとして見えます。
@z

@x
An easy way to visualize the difference among volumes, bind mounts, and `tmpfs`
mounts is to think about where the data lives on the Docker host.
@y
{% comment %}
An easy way to visualize the difference among volumes, bind mounts, and `tmpfs`
mounts is to think about where the data lives on the Docker host.
{% endcomment %}
ボリューム、バインドマウント、`tmpfs` マウントにどのような違いがあるのかは、そのデータが Docker ホスト上のどこに保存されるかを考えてみると、わかりやすくなります。
@z

@x
![types of mounts and where they live on the Docker host](images/types-of-mounts.png)
@y
{% comment %}
![types of mounts and where they live on the Docker host](images/types-of-mounts.png)
{% endcomment %}
![マウントの種類と Docker ホスト上でのデータ保存場所](images/types-of-mounts.png)
@z

@x
- **Volumes** are stored in a part of the host filesystem which is _managed by
  Docker_ (`/var/lib/docker/volumes/` on Linux). Non-Docker processes should not
  modify this part of the filesystem. Volumes are the best way to persist data
  in Docker.
@y
{% comment %}
- **Volumes** are stored in a part of the host filesystem which is _managed by
  Docker_ (`/var/lib/docker/volumes/` on Linux). Non-Docker processes should not
  modify this part of the filesystem. Volumes are the best way to persist data
  in Docker.
{% endcomment %}
- **ボリューム** はホストのファイルシステムの一部としてデータが保存されます。
  そしてこれは **Docker によって管理されます**。
  （Linux であれば `/var/lib/docker/volumes/` に保存されます。）
  Docker 以外のプロセスは、このファイルシステム上の保存場所に変更を行ってはなりません。
  ボリュームは Docker においてデータを維持するための最良の方法です。
@z

@x
- **Bind mounts** may be stored *anywhere* on the host system. They may even be
  important system files or directories. Non-Docker processes on the Docker host
  or a Docker container can modify them at any time.
@y
{% comment %}
- **Bind mounts** may be stored *anywhere* on the host system. They may even be
  important system files or directories. Non-Docker processes on the Docker host
  or a Docker container can modify them at any time.
{% endcomment %}
- **バインドマウント** はホストシステム上の **どこにでも** 保存することができます。
  それが重要なシステムファイルやディレクトリであってもかまいません。
  Docker ホスト上の Docker に無関係なプロセスや Docker コンテナーであったとしても、これを修正することがいつでもできます。
@z

@x
- **`tmpfs` mounts** are stored in the host system's memory only, and are never
  written to the host system's filesystem.
@y
{% comment %}
- **`tmpfs` mounts** are stored in the host system's memory only, and are never
  written to the host system's filesystem.
{% endcomment %}
- **`tmpfs` マウント** はホストシステムのメモリ上にのみ保存されます。
  そしてホストシステムのファイルシステムに向けての書き込みを行うことはできません。
@z

@x
### More details about mount types
@y
{% comment %}
### More details about mount types
{% endcomment %}
{: #more-details-about-mount-types }
### マウントタイプに関する詳細
@z

@x
- **[Volumes](volumes.md)**: Created and managed by Docker. You can create a
  volume explicitly using the `docker volume create` command, or Docker can
  create a volume during container or service creation.
@y
{% comment %}
- **[Volumes](volumes.md)**: Created and managed by Docker. You can create a
  volume explicitly using the `docker volume create` command, or Docker can
  create a volume during container or service creation.
{% endcomment %}
- **[ボリューム](volumes.md)**: 
  Docker によって生成され管理されるものです。
  ボリュームは `docker volume create` コマンドによって明示的に生成します。
  あるいは Docker が、コンテナーやサービスの生成時にボリュームを生成します。
@z

@x
  When you create a volume, it is stored within a directory on the Docker
  host. When you mount the volume into a container, this directory is what is
  mounted into the container. This is similar to the way that bind mounts work,
  except that volumes are managed by Docker and are isolated from the core
  functionality of the host machine.
@y
  {% comment %}
  When you create a volume, it is stored within a directory on the Docker
  host. When you mount the volume into a container, this directory is what is
  mounted into the container. This is similar to the way that bind mounts work,
  except that volumes are managed by Docker and are isolated from the core
  functionality of the host machine.
  {% endcomment %}
  ボリュームを生成した際には、Docker ホスト上のディレクトリにボリュームが保存されます。
  このボリュームをコンテナーにマウントすると、そのディレクトリがコンテナー内にマウントされるものとなります。
  このことは、バインドマウントが動作する様子と同様です。
  ただしボリュームは Docker によって管理されるものであって、ホストマシンの主要な機能からは切り離されています。
@z

@x
  A given volume can be mounted into multiple containers simultaneously. When no
  running container is using a volume, the volume is still available to Docker
  and is not removed automatically. You can remove unused volumes using `docker
  volume prune`.
@y
  {% comment %}
  A given volume can be mounted into multiple containers simultaneously. When no
  running container is using a volume, the volume is still available to Docker
  and is not removed automatically. You can remove unused volumes using `docker
  volume prune`.
  {% endcomment %}
  ボリュームは複数のコンテナーに対して同時にマウントすることができます。
  たとえそのボリュームを利用するコンテナーが 1 つも実行されていなくても、ボリュームは Docker が利用できる状態にあって、自動的に削除されることはありません。
  未使用のボリュームは `docker volume prune` によって削除することができます。
@z

@x
  When you mount a volume, it may be **named** or **anonymous**. Anonymous
  volumes are not given an explicit name when they are first mounted into a
  container, so Docker gives them a random name that is guaranteed to be unique
  within a given Docker host. Besides the name, named and anonymous volumes
  behave in the same ways.
@y
  {% comment %}
  When you mount a volume, it may be **named** or **anonymous**. Anonymous
  volumes are not given an explicit name when they are first mounted into a
  container, so Docker gives them a random name that is guaranteed to be unique
  within a given Docker host. Besides the name, named and anonymous volumes
  behave in the same ways.
  {% endcomment %}
  ボリュームのマウントは、**名前つき**（named）か **匿名**（anonymous）のいずれかにより行われます。
  匿名ボリュームがコンテナーにマウントされた初めての段階においては、明示的な名称がありません。
  そこで Docker が、Docker ホスト内で必ず固有となるランダムな名称を与えます。
  名前を持たないというだけで、名前つきと匿名の各ボリュームは同等に機能します。
@z

@x
  Volumes also support the use of _volume drivers_, which allow you to store
  your data on remote hosts or cloud providers, among other possibilities.
@y
  {% comment %}
  Volumes also support the use of _volume drivers_, which allow you to store
  your data on remote hosts or cloud providers, among other possibilities.
  {% endcomment %}
  ボリュームでは **ボリュームドライバー** の利用がサポートされます。
  これによって、いろいろな利用の仕方が可能となります。
  たとえば手元のデータを、リモートホストやクラウドプロバイダーに保存することができるようになります。
@z

@x
- **[Bind mounts](bind-mounts.md)**: Available since the early days of Docker.
  Bind mounts have limited functionality compared to volumes. When you use a
  bind mount, a file or directory on the _host machine_ is mounted into a
  container. The file or directory is referenced by its full path on the host
  machine. The file or directory does not need to exist on the Docker host
  already. It is created on demand if it does not yet exist. Bind mounts are
  very performant, but they rely on the host machine's filesystem having a
  specific directory structure available. If you are developing new Docker
  applications, consider using named volumes instead. You can't use
  Docker CLI commands to directly manage bind mounts.
@y
{% comment %}
- **[Bind mounts](bind-mounts.md)**: Available since the early days of Docker.
  Bind mounts have limited functionality compared to volumes. When you use a
  bind mount, a file or directory on the _host machine_ is mounted into a
  container. The file or directory is referenced by its full path on the host
  machine. The file or directory does not need to exist on the Docker host
  already. It is created on demand if it does not yet exist. Bind mounts are
  very performant, but they rely on the host machine's filesystem having a
  specific directory structure available. If you are developing new Docker
  applications, consider using named volumes instead. You can't use
  Docker CLI commands to directly manage bind mounts.
{% endcomment %}
- **[バインドマウント](bind-mounts.md)**: Docker の初期の段階から利用可能。
  バインドマウントにはボリュームに比べて機能が制限されています。
  バインドマウントを利用する際には、**ホストマシン** 上のファイルやディレクトリがコンテナーにマウントされます。
  そのファイルやディレクトリは、ホストマシン上のフルパスによって参照されます。
  ファイルやディレクトリが、Docker ホスト上からなくなっていても問題ありません。
  存在していないときは、処理実行時に生成されます。
  バインドマウントは非常に効率的なものですが、ホストマシン上のファイルシステムに依存し、利用可能な所定のディレクトリ構造に従って動作します。
  Docker アプリケーションを新規開発する際には、これではなく名前つきボリュームを利用することを考えてみてください。
  バインドマウントを直接管理するような Docker CLI コマンドはありません。
@z

@x
  > Bind mounts allow access to sensitive files
  >
  > One side effect of using bind mounts, for better or for worse,
  > is that you can change the **host** filesystem via processes running in a
  > **container**, including creating, modifying, or deleting important system
  > files or directories. This is a powerful ability which can have security
  > implications, including impacting non-Docker processes on the host system.
  {: .important }
@y
  {% comment %}
  > Bind mounts allow access to sensitive files
  >
  > One side effect of using bind mounts, for better or for worse,
  > is that you can change the **host** filesystem via processes running in a
  > **container**, including creating, modifying, or deleting important system
  > files or directories. This is a powerful ability which can have security
  > implications, including impacting non-Docker processes on the host system.
  {: .important }
  {% endcomment %}
  > バインドマウントは機密ファイルへのアクセスも行います。
  >
  > バインドマウントを利用する際の副作用として、これが良いことか悪いことかはわかりませんが、**コンテナー** 内に動作するプロセスを通じて **ホスト** のファイルシステムに変更がかけられるということです。
  > たとえばシステムにとって重要なファイル、ディレクトリを生成、編集、削除ができてしまいます。
  > セキュリティに影響を及ぼしかねない強力な能力がここにあって、ホストシステム上の Docker 以外のプロセスへも影響します。
  {: .important }
@z

@x
- **[tmpfs mounts](tmpfs.md)**: A `tmpfs` mount is not persisted on disk, either
  on the Docker host or within a container. It can be used by a container during
  the lifetime of the container, to store non-persistent state or sensitive
  information. For instance, internally, swarm services use `tmpfs` mounts to
  mount [secrets](../engine/swarm/secrets.md) into a service's containers.
@y
{% comment %}
- **[tmpfs mounts](tmpfs.md)**: A `tmpfs` mount is not persisted on disk, either
  on the Docker host or within a container. It can be used by a container during
  the lifetime of the container, to store non-persistent state or sensitive
  information. For instance, internally, swarm services use `tmpfs` mounts to
  mount [secrets](../engine/swarm/secrets.md) into a service's containers.
{% endcomment %}
- **[tmpfs マウント](tmpfs.md)**: `tmpfs` マウントとは、Docker ホスト上もコンテナー上も、ディスクに長らく保持されるものではありません。
  これはコンテナーが起動している間のみ、コンテナーが利用するものであって、一時的な状態や機密情報などを保存します。
  たとえば Docker 内部においては、Swarm サービスが `tmpfs` マウントを利用して、サービスコンテナー内に [secrets](../engine/swarm/secrets.md) をマウントしています。
@z

@x
- **[named pipes](https://docs.microsoft.com/en-us/windows/desktop/ipc/named-pipes)**: An `npipe`
  mount can be used for communication between the Docker host and a container. Common use case is
  to run a third-party tool inside of a container and connect to the Docker Engine API using a named pipe.
@y
{% comment %}
- **[named pipes](https://docs.microsoft.com/en-us/windows/desktop/ipc/named-pipes)**: An `npipe`
  mount can be used for communication between the Docker host and a container. Common use case is
  to run a third-party tool inside of a container and connect to the Docker Engine API using a named pipe.
{% endcomment %}
- **[名前つきパイプ](https://docs.microsoft.com/en-us/windows/desktop/ipc/named-pipes)**（named pipe）:
  `npipe` マウントは Docker ホストとコンテナーの間での通信のために利用されます。
  よく行われる利用例としては、コンテナー内部にサードパーティー製のツールを実行させて、名前つきパイプにより Docker Engine API への接続を行うような場合です。
@z

@x
Bind mounts and volumes can both be mounted into containers using the `-v` or
`--volume` flag, but the syntax for each is slightly different. For `tmpfs`
mounts, you can use the `--tmpfs` flag. However, in Docker 17.06 and higher,
we recommend using the `--mount` flag for both containers and services, for
bind mounts, volumes, or `tmpfs` mounts, as the syntax is more clear.
@y
{% comment %}
Bind mounts and volumes can both be mounted into containers using the `-v` or
`--volume` flag, but the syntax for each is slightly different. For `tmpfs`
mounts, you can use the `--tmpfs` flag. However, in Docker 17.06 and higher,
we recommend using the `--mount` flag for both containers and services, for
bind mounts, volumes, or `tmpfs` mounts, as the syntax is more clear.
{% endcomment %}
バインドマウントとボリュームは `-v` または `--volume` フラグを使って、コンテナーへのマウントを行うことができます。
しかしその文法は多少異なります。
`tmpfs` マウントの場合は `--tmpfs` フラグを使います。
ただし Docker 17.06 およびそれ以降においては、コンテナーとサービスの双方において、バインドマウント、ボリューム、`tmpfs` マウントのどれであっても、`--mount` フラグを利用することが推奨されます。
文法がよりはっきりとしているからです。
@z

@x
## Good use cases for volumes
@y
{% comment %}
## Good use cases for volumes
{% endcomment %}
{: #good-use-cases-for-volumes }
## ボリュームの適切な利用例
@z

@x
Volumes are the preferred way to persist data in Docker containers and services.
Some use cases for volumes include:
@y
{% comment %}
Volumes are the preferred way to persist data in Docker containers and services.
Some use cases for volumes include:
{% endcomment %}
Docker コンテナーやサービスにおいてデータを保持するためには、ボリュームを用いるのが好ましい方法です。
ボリュームの利用例として以下のものがあります。
@z

@x
- Sharing data among multiple running containers. If you don't explicitly create
  it, a volume is created the first time it is mounted into a container. When
  that container stops or is removed, the volume still exists. Multiple
  containers can mount the same volume simultaneously, either read-write or
  read-only. Volumes are only removed when you explicitly remove them.
@y
{% comment %}
- Sharing data among multiple running containers. If you don't explicitly create
  it, a volume is created the first time it is mounted into a container. When
  that container stops or is removed, the volume still exists. Multiple
  containers can mount the same volume simultaneously, either read-write or
  read-only. Volumes are only removed when you explicitly remove them.
{% endcomment %}
- 複数コンテナーを起動し、データ共有を行う場合です。
  ボリュームが明示的に生成されていない場合、コンテナーへのマウント時の初回にボリュームは生成されます。
  コンテナーが停止されるか削除されたとしても、ボリュームは残ります。
  複数コンテナーは同一ボリュームを同時にマウントすることが可能です。
  その場合、読み書き可能、あるいは読み込み専用とすることができます。
  ボリュームは、明示的に削除を指示したときのみ削除されます。
@z

@x
- When the Docker host is not guaranteed to have a given directory or file
  structure. Volumes help you decouple the configuration of the Docker host
  from the container runtime.
@y
{% comment %}
- When the Docker host is not guaranteed to have a given directory or file
  structure. Volumes help you decouple the configuration of the Docker host
  from the container runtime.
{% endcomment %}
- Docker ホストにおいて、指定されたディレクトリまたはファイル構造が保証されていない場合です。
  ボリュームを用いることで、Docker ホストの設定を、コンテナーの実行環境から切り離すことができます。
@z

@x
- When you want to store your container's data on a remote host or a cloud
  provider, rather than locally.
@y
{% comment %}
- When you want to store your container's data on a remote host or a cloud
  provider, rather than locally.
{% endcomment %}
- コンテナーデータの保存先として、ローカルマシンではなく、リモートホストやクラウドプロバイダーを利用したい場合です。
@z

@x
- When you need to back up, restore, or migrate data from one Docker
  host to another, volumes are a better choice. You can stop containers using
  the volume, then back up the volume's directory
  (such as `/var/lib/docker/volumes/<volume-name>`).
@y
{% comment %}
- When you need to back up, restore, or migrate data from one Docker
  host to another, volumes are a better choice. You can stop containers using
  the volume, then back up the volume's directory
  (such as `/var/lib/docker/volumes/<volume-name>`).
{% endcomment %}
- 1 つの Docker ホストのデータをバックアップして、他のホストに復元、移行する必要がある場合です。
  こういった場合にボリュームを選びます。
  ボリュームを利用しているコンテナーを停止させてから、ボリュームがあるディレクトリのバックアップをとります（ディレクトリは `/var/lib/docker/volumes/<ボリューム名>` などです）。
@z

@x
## Good use cases for bind mounts
@y
{% comment %}
## Good use cases for bind mounts
{% endcomment %}
{: #good-use-cases-for-bind-mounts }
## バインドマウントの適切な利用例
@z

@x
In general, you should use volumes where possible. Bind mounts are appropriate
for the following types of use case:
@y
{% comment %}
In general, you should use volumes where possible. Bind mounts are appropriate
for the following types of use case:
{% endcomment %}
一般的には、可能なかぎりボリュームを用いるべきです。
バインドマウントは、以下のような利用例において適切と考えられます。
@z

@x
- Sharing configuration files from the host machine to containers. This is how
  Docker provides DNS resolution to containers by default, by mounting
  `/etc/resolv.conf` from the host machine into each container.
@y
{% comment %}
- Sharing configuration files from the host machine to containers. This is how
  Docker provides DNS resolution to containers by default, by mounting
  `/etc/resolv.conf` from the host machine into each container.
{% endcomment %}
- 設定ファイルをホストマシンからコンテナーに共有するような場合です。
  デフォルトで Docker はコンテナーに対し DNS 解決機能を提供しますが、それがこの状況に相当します。
  この場合、`/etc/resolv.conf` をホストマシンから各コンテナーへマウントすることを行います。
@z

@x
- Sharing source code or build artifacts between a development environment on
  the Docker host and a container. For instance, you may mount a Maven `target/`
  directory into a container, and each time you build the Maven project on the
  Docker host, the container gets access to the rebuilt artifacts.
@y
{% comment %}
- Sharing source code or build artifacts between a development environment on
  the Docker host and a container. For instance, you may mount a Maven `target/`
  directory into a container, and each time you build the Maven project on the
  Docker host, the container gets access to the rebuilt artifacts.
{% endcomment %}
- ソースコードやビルド結果を、Docker ホスト上の開発環境とコンテナーとの間で共有する場合です。
  たとえば Maven の `target/` ディレクトリをコンテナーにマウントします。
  Docker ホスト上にて Maven プロジェクトをビルドするたびに、コンテナーは再ビルドされた結果をすぐに利用します。
@z

@x
  If you use Docker for development this way, your production Dockerfile would
  copy the production-ready artifacts directly into the image, rather than
  relying on a bind mount.
@y
  {% comment %}
  If you use Docker for development this way, your production Dockerfile would
  copy the production-ready artifacts directly into the image, rather than
  relying on a bind mount.
  {% endcomment %}
  Docker をこのようにして開発に利用する場合、本番環境用の Dockerfile には、本番向けにビルドされたバイナリを、直接イメージにコピーするような記述を行うはずです。
  そこではもう、バインドマウントに頼ることはありません。
@z

@x
- When the file or directory structure of the Docker host is guaranteed to be
  consistent with the bind mounts the containers require.
@y
{% comment %}
- When the file or directory structure of the Docker host is guaranteed to be
  consistent with the bind mounts the containers require.
{% endcomment %}
- Docker ホストのファイルやディレクトリ構造が、コンテナーにとって必要となるバインドマウントと合致することが保証されている場合です。
@z

@x
## Good use cases for tmpfs mounts
@y
{% comment %}
## Good use cases for tmpfs mounts
{% endcomment %}
{: #good-use-cases-for-tmpfs-mounts }
## tmpfs マウントの適切な利用例
@z

@x
`tmpfs` mounts are best used for cases when you do not want the data to persist
either on the host machine or within the container. This may be for security
reasons or to protect the performance of the container when your application
needs to write a large volume of non-persistent state data.
@y
{% comment %}
`tmpfs` mounts are best used for cases when you do not want the data to persist
either on the host machine or within the container. This may be for security
reasons or to protect the performance of the container when your application
needs to write a large volume of non-persistent state data.
{% endcomment %}
`tmpfs` マウントの一番の使い方は、ホストマシン上にもコンテナー内にも、データを残しておきたくない場合に利用することです。
セキュリティに関する理由もありますが、アプリケーションが書き込むデータが大量にあって、それが保存を必要としないのであれば、コンテナーの性能を保護する目的があります。
@z

@x
## Tips for using bind mounts or volumes
@y
{% comment %}
## Tips for using bind mounts or volumes
{% endcomment %}
{: #tips-for-using-bind-mounts-or-volumes }
## バインドマウントとボリュームを使う際のヒント
@z

@x
If you use either bind mounts or volumes, keep the following in mind:
@y
{% comment %}
If you use either bind mounts or volumes, keep the following in mind:
{% endcomment %}
バインドマウントとボリュームのどちらかを用いる場合には、以下のことを忘れないでください。
@z

@x
- If you mount an **empty volume** into a directory in the container in which files
  or directories exist, these files or directories are propagated (copied)
  into the volume. Similarly, if you start a container and specify a volume which
  does not already exist, an empty volume is created for you.
  This is a good way to pre-populate data that another container needs.
@y
{% comment %}
- If you mount an **empty volume** into a directory in the container in which files
  or directories exist, these files or directories are propagated (copied)
  into the volume. Similarly, if you start a container and specify a volume which
  does not already exist, an empty volume is created for you.
  This is a good way to pre-populate data that another container needs.
{% endcomment %}
- コンテナー内のディレクトリに **空のボリューム** をマウントしようとしていて、そのディレクトリ内にファイルやディレクトリが存在する場合、そのファイルやディレクトリはボリューム内にコピーされます。
  コンテナー起動時に指定したボリュームがまだ存在していなかった場合は、空のボリュームが生成されます。
  コンテナーの求めに応じて事前にデータを提供しておく方法として用いられます。
@z

@x
- If you mount a **bind mount or non-empty volume** into a directory in the container
  in which some files or directories exist, these files or directories are
  obscured by the mount, just as if you saved files into `/mnt` on a Linux host
  and then mounted a USB drive into `/mnt`. The contents of `/mnt` would be
  obscured by the contents of the USB drive until the USB drive were unmounted.
  The obscured files are not removed or altered, but are not accessible while the
  bind mount or volume is mounted.
@y
{% comment %}
- If you mount a **bind mount or non-empty volume** into a directory in the container
  in which some files or directories exist, these files or directories are
  obscured by the mount, just as if you saved files into `/mnt` on a Linux host
  and then mounted a USB drive into `/mnt`. The contents of `/mnt` would be
  obscured by the contents of the USB drive until the USB drive were unmounted.
  The obscured files are not removed or altered, but are not accessible while the
  bind mount or volume is mounted.
{% endcomment %}
- コンテナー内のディレクトリに **バインドマウントか、空ではないボリューム** をマウントしようとしていて、そのディレクトリ内にファイルやディレクトリが存在する場合、マウントによってそのファイルやディレクトリは隠れてしまいます。
  それはたとえば、Linux マシン上の `/mnt` にファイルを保存した後に、`/mnt` に対して USB ドライブをマウントしたような場合と同じです。
  `/mnt` に存在していた内容は USB ドライブの内容によって隠されてしまい、USB ドライブがアンマウントされるまで続きます。
  隠されてしまったファイルは、削除されるわけでなく変更もされません。
  しかしバインドマウントやボリュームがアンマウントされない限り、アクセスすることはできません。
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
- Learn more about [volumes](volumes.md).
- Learn more about [bind mounts](bind-mounts.md).
- Learn more about [tmpfs mounts](tmpfs.md).
- Learn more about [storage drivers](/storage/storagedriver/), which
  are not related to bind mounts or volumes, but allow you to store data in a
  container's writable layer.
@y
{% comment %}
- Learn more about [volumes](volumes.md).
- Learn more about [bind mounts](bind-mounts.md).
- Learn more about [tmpfs mounts](tmpfs.md).
- Learn more about [storage drivers](/storage/storagedriver/), which
  are not related to bind mounts or volumes, but allow you to store data in a
  container's writable layer.
{% endcomment %}
- [ボリューム](volumes.md) について学ぶ。
- [バインドマウント](bind-mounts.md) について学ぶ。
- [tmpfs マウント](tmpfs.md) について学ぶ。
- [ストレージドライバー](/storage/storagedriver/) について学ぶ。
  これはバインドマウントやボリュームに関連するものではありませんが、
  コンテナーの書き込み可能レイヤーにデータを保存できるものです。
@z
