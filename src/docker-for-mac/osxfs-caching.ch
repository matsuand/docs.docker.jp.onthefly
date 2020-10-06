%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Osxfs caching
keywords: mac, osxfs, volumes
title: Performance tuning for volume mounts (shared filesystems)
---
@y
---
description: Osxfs caching
keywords: mac, osxfs, volumes
title: ボリュームマウント（共有ファイルシステム）におけるパフォーマンスチューニング
---
@z

@x
[Docker 17.04 CE Edge](https://github.com/docker/docker.github.io/blob/v17.03/edge/index.md#docker-ce-edge-new-features) adds support
for two new flags to the [docker run `-v`, `--volume`](../engine/reference/run.md#volume-shared-filesystems)
option, `cached` and `delegated`, that can significantly improve the performance
of mounted volume access on Docker Desktop for Mac. These options begin to solve some of
the challenges discussed in 
[Performance issues, solutions, and roadmap](osxfs.md#performance-issues-solutions-and-roadmap).
@y
{% comment %}
[Docker 17.04 CE Edge](https://github.com/docker/docker.github.io/blob/v17.03/edge/index.md#docker-ce-edge-new-features) adds support
for two new flags to the [docker run `-v`, `--volume`](../engine/reference/run.md#volume-shared-filesystems)
option, `cached` and `delegated`, that can significantly improve the performance
of mounted volume access on Docker Desktop for Mac. These options begin to solve some of
the challenges discussed in 
[Performance issues, solutions, and roadmap](osxfs.md#performance-issues-solutions-and-roadmap).
{% endcomment %}
[Docker 17.04 CE 最新版（Edge）](https://github.com/docker/docker.github.io/blob/v17.03/edge/index.md#docker-ce-edge-new-features) において、[docker run の `-v`、`--volume`](../engine/reference/run.md#volume-shared-filesystems) オプションに対する新たなフラグとして `cached` と `delegated` が追加されました。
これは Docker Desktop for Mac にアクセスする、マウントされたボリュームの性能を大幅に向上させるものです。
[性能に関する問題、その対処と解決に向けて](osxfs.md#performance-issues-solutions-and-roadmap) において議論している問題の中には、このオプションを使って解決できるものがあります。
@z

@x
> **Tip:** Release notes for Docker CE Edge 17.04 are
[here](https://github.com/moby/moby/releases/tag/v17.04.0-ce), and the
associated pull request for the additional `docker run -v` flags is
[here](https://github.com/moby/moby/pull/31047).
@y
{% comment %}
> **Tip:** Release notes for Docker CE Edge 17.04 are
[here](https://github.com/moby/moby/releases/tag/v17.04.0-ce), and the
associated pull request for the additional `docker run -v` flags is
[here](https://github.com/moby/moby/pull/31047).
{% endcomment %}
> **ヒント:** Docker CE 最新版（Edge） 17.04 のリリースノートは [こちら](https://github.com/moby/moby/releases/tag/v17.04.0-ce) にあります。
> また `docker run -v` の追加フラグに関連するプルリクエストが [こちら](https://github.com/moby/moby/pull/31047) にあります。
@z

@x
The following topics describe the challenges of bind-mounted volumes on `osxfs`,
and the caching options provided to optimize performance.
@y
{% comment %}
The following topics describe the challenges of bind-mounted volumes on `osxfs`,
and the caching options provided to optimize performance.
{% endcomment %}
以下に示すトピックでは `osxfs` 上に、バインドマウントされたボリュームを構築する方法を説明します。
また性能を最適化するためのキャッシュオプションについて説明します。
@z

@x
This blog post on [Docker on Mac
Performance](https://stories.amazee.io/docker-on-mac-performance-docker-machine-vs-docker-for-mac-4c64c0afdf99)
gives a nice, quick summary.
@y
{% comment %}
This blog post on [Docker on Mac
Performance](https://stories.amazee.io/docker-on-mac-performance-docker-machine-vs-docker-for-mac-4c64c0afdf99)
gives a nice, quick summary.
{% endcomment %}
[Docker on Mac Performance](https://stories.amazee.io/docker-on-mac-performance-docker-machine-vs-docker-for-mac-4c64c0afdf99) にあるブログ投稿が優れていて、簡潔に取りまとめられています。
@z

@x
For information on how to configure these options in a Compose file, see
[Caching options for volume mounts](../compose/compose-file/index.md#caching-options-for-volume-mounts-docker-desktop-for-mac)
the Docker Compose topics.
@y
{% comment %}
For information on how to configure these options in a Compose file, see
[Caching options for volume mounts](../compose/compose-file/index.md#caching-options-for-volume-mounts-docker-desktop-for-mac)
the Docker Compose topics.
{% endcomment %}
これらのオプションを Compose ファイルにおいて設定する方法については、Docker Compose のトピック内の [ボリュームマウントに対するキャッシュオプション](../compose/compose-file/index.md#caching-options-for-volume-mounts-docker-desktop-for-mac) を参照してください。
@z

@x
## Performance implications of host-container file system consistency
@y
{% comment %}
## Performance implications of host-container file system consistency
{% endcomment %}
{: #performance-implications-of-host-container-file-system-consistency }
## ホストコンテナー間のファイルシステムの一貫性実現による性能への影響
@z

@x
With Docker distributions now available for an increasing number of
platforms, including macOS and Windows, generalizing mount semantics
during container run is a necessity to enable workload optimizations.
@y
{% comment %}
With Docker distributions now available for an increasing number of
platforms, including macOS and Windows, generalizing mount semantics
during container run is a necessity to enable workload optimizations.
{% endcomment %}
Docker 製品が現在利用できるプラットフォームは、macOS や Windows を含め、その数を増やしてきました。
そこで、コンテナー実行中のマウントの意味を分かりやすく一般化していくことが、開発ソフトウェアの最適化を可能とするために必要になります。
@z

@x
The current implementations of mounts on Linux provide a consistent
view of a host directory tree inside a container: reads and writes
performed either on the host or in the container are immediately
reflected in the other environment, and file system events (`inotify`,
`FSEvents`) are consistently propagated in both directions.
@y
{% comment %}
The current implementations of mounts on Linux provide a consistent
view of a host directory tree inside a container: reads and writes
performed either on the host or in the container are immediately
reflected in the other environment, and file system events (`inotify`,
`FSEvents`) are consistently propagated in both directions.
{% endcomment %}
Linux の現状におけるマウントの実装は、コンテナー内からホストディレクトリツリーの参照を、整合性を保ちながら提供します。
つまりホスト上あるいはコンテナー内にて行われる読み書きの処理が、瞬時に他方の環境に反映されます。
そしてファイルシステムイベント（`inotify`、`FSEvents`）は、双方向に一貫して送受信されます。
@z

@x
On Linux, these guarantees carry no overhead, since the underlying VFS is
shared directly between host and container. However, on macOS (and
other non-Linux platforms) there are significant overheads to
guaranteeing perfect consistency, since messages describing file system
actions must be passed synchronously between container and host. The
current implementation is sufficiently efficient for most tasks, but
with certain types of workloads the overhead of maintaining perfect
consistency can result in significantly worse performance than a
native (non-Docker) environment. For example,
@y
{% comment %}
On Linux, these guarantees carry no overhead, since the underlying VFS is
shared directly between host and container. However, on macOS (and
other non-Linux platforms) there are significant overheads to
guaranteeing perfect consistency, since messages describing file system
actions must be passed synchronously between container and host. The
current implementation is sufficiently efficient for most tasks, but
with certain types of workloads the overhead of maintaining perfect
consistency can result in significantly worse performance than a
native (non-Docker) environment. For example,
{% endcomment %}
Linux においてはこの処理実現にオーバーヘッドはありません。
利用している VFS が、ホストコンテナー間で直接共有されるからです。
ただし macOS（あるいは Linux ではないプラットフォーム）においては、一貫性を確実に実現するために、かなりのオーバーヘッドが発生します。
なぜならファイルシステム処理を実現するメッセージは、コンテナーとホストの間で同時に受け渡される必要があるからです。
現状の実装であっても、たいていのタスクに対して十分効果を発揮しています。
しかし特定の処理内容となると（Docker ではない）ネイティブな環境に比べて、一貫性を確実とするオーバーヘッドが明らかに性能劣化を引き起こしてしまいます。
@z

@x
 * running `go list ./...` in the bind-mounted `docker/docker` source tree
   takes around 26 seconds
@y
 {% comment %}
 * running `go list ./...` in the bind-mounted `docker/docker` source tree
   takes around 26 seconds
 {% endcomment %}
 * バインドマウントされた `docker/docker` ソースツリーにおいて `go list ./...` を実行すると、26 秒程度かかります。
@z

@x
 * writing 100MB in 1k blocks into a bind-mounted directory takes
   around 23 seconds
@y
 {% comment %}
 * writing 100MB in 1k blocks into a bind-mounted directory takes
   around 23 seconds
 {% endcomment %}
 * バインドマウントされたディレクトリに対して、1k ブロック単位で 100 MB を書き込むと、23 秒程度かかります。
@z

@x
 * running `ember build` on a freshly created (empty) application
   involves around 70000 sequential syscalls, each of which translates
   into a request and response passed between container and host.
@y
 {% comment %}
 * running `ember build` on a freshly created (empty) application
   involves around 70000 sequential syscalls, each of which translates
   into a request and response passed between container and host.
 {% endcomment %}
 * 生成したばかりの（空の）アプリケーションに対して `ember build` を実行すると、7 万回近くの連続したシステムコールが発生します。
   それぞれがコンテナーホスト間で送受信されるリクエストやレスポンスに変換されます。
@z

@x
Optimizations to reduce latency throughout the stack have brought
significant improvements to these workloads, and a few further
optimization opportunities remain. However, even when latency is
minimized, the constraints of maintaining consistency mean that these
workloads remain unacceptably slow for some use cases.
@y
{% comment %}
Optimizations to reduce latency throughout the stack have brought
significant improvements to these workloads, and a few further
optimization opportunities remain. However, even when latency is
minimized, the constraints of maintaining consistency mean that these
workloads remain unacceptably slow for some use cases.
{% endcomment %}
処理全般にわたって待ち時間を軽減する最適化を行うことで、かなりの改善がなされてきました。
さらに最適化を行う余地は残っています。
一方で待ち時間が最小化できたとしても、一貫性を維持するという制約があるからには、極端に処理速度が遅くなるケースもまた残っています。
@z

@x
## Tuning with consistent, cached, and delegated configurations
@y
{% comment %}
## Tuning with consistent, cached, and delegated configurations
{% endcomment %}
{: #tuning-with-consistent-cached-and-delegated-configurations }
## consistent、cached、delegated の各フラグ指定におけるチューニング
@z

@x
**_Fortunately, in many cases where the performance degradation is most
severe, perfect consistency between container and host is unnecessary._**
In particular, in many cases there is no need for writes performed in a
container to be immediately reflected on the host. For example, while
interactive development requires that writes to a bind-mounted directory
on the host immediately generate file system events within a container,
there is no need for writes to build artifacts within the container to
be immediately reflected on the host file system. Distinguishing between
these two cases makes it possible to significantly improve performance.
@y
{% comment %}
**_Fortunately, in many cases where the performance degradation is most
severe, perfect consistency between container and host is unnecessary._**
In particular, in many cases there is no need for writes performed in a
container to be immediately reflected on the host. For example, while
interactive development requires that writes to a bind-mounted directory
on the host immediately generate file system events within a container,
there is no need for writes to build artifacts within the container to
be immediately reflected on the host file system. Distinguishing between
these two cases makes it possible to significantly improve performance.
{% endcomment %}
**性能劣化が犠牲にしてまで、コンテナーホスト間の一貫性を完璧にしなければならないケースは、幸いながらほぼありません。**
特に、コンテナー内での書き込みを即座にホストに反映する必要があるかと言えば、そんな必要はないことがほとんどです。
たとえばインタラクティブな開発では、ホスト上にバインドマウントされたディレクトリへの書き込みは、コンテナー内部でのファイルシステムイベントを即座に発生させる必要があります。
ただしコンテナー内部でビルドされた成果物を、ホスト上のファイルシステムに即反映する必要はまったくありません。
この状況の違いをしっかり区別できれば、性能を劇的に改善することができます。
@z

@x
There are three broad scenarios to consider, based on which you can dial in the
level of consistency you need. In each case, the container has an
internally-consistent view of bind-mounted directories, but in two cases
temporary discrepancies are allowed between container and host.
@y
{% comment %}
There are three broad scenarios to consider, based on which you can dial in the
level of consistency you need. In each case, the container has an
internally-consistent view of bind-mounted directories, but in two cases
temporary discrepancies are allowed between container and host.
{% endcomment %}
{% comment %}
日本語訳註：
dial in は一見タイポのようにも感じられた。
Oxford Learner's Dictionaries (https://www.oxfordlearnersdictionaries.com/definition/english/dial-in)
では "to direct all your effort and attention on to what you are trying to 
achieve, so you perform as well as you can" とある。
成し遂げたいものに努力や注意を向けること。そこから大幅に意訳して以下とした。
{% endcomment %}
おおざっぱに 3 つのシナリオを考えてみます。
これに基づいて、必要とする一貫性のレベルを捉えていきます。
各シナリオにおけるコンテナーにはバインドマウントされたディレクトリがあって、内部からは一貫してディレクトリ参照ができるようになっています。
ただし 2 つのケースにおいては、コンテナーホスト間で一時的に食い違いが発生するものとしています。
@z

@x
 * `consistent`: perfect consistency
   (host and container have an identical view of the mount at all times)
@y
 {% comment %}
 * `consistent`: perfect consistency
   (host and container have an identical view of the mount at all times)
 {% endcomment %}
 * `consistent`: 完全な一貫性を持ちます。
   （ホスト、コンテナーともに、マウント内容がどの時点でも同じに見えます。）
@z

@x
 * `cached`: the host's view is authoritative
   (permit delays before updates on the host appear in the container)
@y
 {% comment %}
 * `cached`: the host's view is authoritative
   (permit delays before updates on the host appear in the container)
 {% endcomment %}
 * `cached`: ホスト側から参照する内容が信頼できるものになります。
   （ホスト上の更新がコンテナー上に反映されるまでの遅延を許容します。）
@z

@x
 * `delegated`: the container's view is authoritative
   (permit delays before updates on the container appear in the host)
@y
 {% comment %}
 * `delegated`: the container's view is authoritative
   (permit delays before updates on the container appear in the host)
 {% endcomment %}
 * `delegated`: コンテナー側から参照する内容が信頼できるものになります。
   （コンテナー上の更新がホスト上に反映されるまでの遅延を許容します。）
@z

@x
## Examples
@y
{% comment %}
## Examples
{% endcomment %}
{: #examples }
## 利用例
@z

@x
Each of these configurations (`consistent`, `cached`, `delegated`) can be
specified as a suffix to the
[`-v`](../engine/reference/run.md#volume-shared-filesystems)
option of [`docker run`](../engine/reference/commandline/run.md). For
example, to bind-mount `/Users/yallop/project` in a container under the path
`/project`, you might run the following command:
@y
{% comment %}
Each of these configurations (`consistent`, `cached`, `delegated`) can be
specified as a suffix to the
[`-v`](../engine/reference/run.md#volume-shared-filesystems)
option of [`docker run`](../engine/reference/commandline/run.md). For
example, to bind-mount `/Users/yallop/project` in a container under the path
`/project`, you might run the following command:
{% endcomment %}
これらの設定（`consistent`、`cached`、`delegated`）は、[`docker run`](../engine/reference/commandline/run.md) の [`-v`](../engine/reference/run.md#volume-shared-filesystems) オプションのサフィックスとして指定するものです。
たとえばバインドマウントとして、コンテナー内の `/Users/yallop/project` を `/project` にマウントする場合、以下のようなコマンドを実行します。
@z

@x
```bash
docker run -v /Users/yallop/project:/project:cached alpine command
```
@y
```bash
docker run -v /Users/yallop/project:/project:cached alpine command
```
@z

@x
The caching configuration can be varied independently for each bind mount,
so you can mount each directory in a different mode:
@y
{% comment %}
The caching configuration can be varied independently for each bind mount,
so you can mount each directory in a different mode:
{% endcomment %}
`cached` によるキャッシュ設定は、各バインドマウントごとに個別に変化するため、ディレクトリのマウントに別のモードを指定することができます。
@z

@x
```bash
docker run -v /Users/yallop/project:/project:cached \
 -v /host/another-path:/mount/another-point:consistent
 alpine command
```
@y
```bash
docker run -v /Users/yallop/project:/project:cached \
 -v /host/another-path:/mount/another-point:consistent
 alpine command
```
@z

@x
## Semantics
@y
{% comment %}
## Semantics
{% endcomment %}
{: #semantics }
## 各設定の意味
@z

@x
The semantics of each configuration is described as a set of guarantees
relating to the observable effects of file system operations. In this
specification, "host" refers to the file system of the user's Docker
client.
@y
{% comment %}
The semantics of each configuration is described as a set of guarantees
relating to the observable effects of file system operations. In this
specification, "host" refers to the file system of the user's Docker
client.
{% endcomment %}
各設定の意味を説明するにあたっては、ファイルシステム操作が及ぼす明確な影響に即して、どれだけのことが保証されるかという点を示していきます。
なおこの説明において「ホスト」とは、ユーザーが利用している Docker クライアントのファイルシステムを表わします。
@z

@x
### delegated
@y
{% comment %}
### delegated
{% endcomment %}
{: #delegated }
### delegated
@z

@x
The `delegated` configuration provides the weakest set of guarantees.
For directories mounted with `delegated` the container's view of the
file system is authoritative, and writes performed by containers may not
be immediately reflected on the host file system. In situations such as NFS
asynchronous mode, if a running container with a `delegated` bind mount
crashes, then writes may be lost.
@y
{% comment %}
The `delegated` configuration provides the weakest set of guarantees.
For directories mounted with `delegated` the container's view of the
file system is authoritative, and writes performed by containers may not
be immediately reflected on the host file system. In situations such as NFS
asynchronous mode, if a running container with a `delegated` bind mount
crashes, then writes may be lost.
{% endcomment %}
`delegated` 設定は、保証されることが最も少ないものです。
`delegated` によってマウントされたディレクトリに対しては、コンテナー側から参照するファイルシステムが信頼できるものとなりますが、コンテナー上での書き込み処理は、ホストのファイルシステム上には即座には反映されないことがあります。
NFS 非同期モードなどを利用した状況において、実行中コンテナーの `delegated` によるバインドマウントがクラッシュした場合、書き込み内容は失われる可能性があります。
@z

@x
However, by relinquishing consistency, `delegated` mounts offer
significantly better performance than the other configurations. Where
the data written is ephemeral or readily reproducible, such as from scratch
space or build artifacts, `delegated` may be the right choice.
@y
{% comment %}
However, by relinquishing consistency, `delegated` mounts offer
significantly better performance than the other configurations. Where
the data written is ephemeral or readily reproducible, such as from scratch
space or build artifacts, `delegated` may be the right choice.
{% endcomment %}
しかし `delegated` によるマウントは、一貫性をあきらめるなら他の設定よりも優れた性能を発揮します。
書き込まれたデータが、一から作り上げるものや中間生成物などのように、一時的なもの、再生成が容易なものであれば、`delegated` を選ぶことが最善かもしれません。
@z

@x
A `delegated` mount offers the following guarantees, which are presented
as constraints on the container run-time:
@y
{% comment %}
A `delegated` mount offers the following guarantees, which are presented
as constraints on the container run-time:
{% endcomment %}
`delegated` によるマウントは、以下のことを保証します。
これはコンテナー実行時の制約でもあります。
@z

@x
1.  If the implementation offers file system events, the container state
as it relates to a specific event **_must_** reflect the host file system
state at the time the event was generated if no container modifications
pertain to related file system state.
@y
{% comment %}
1.  If the implementation offers file system events, the container state
as it relates to a specific event **_must_** reflect the host file system
state at the time the event was generated if no container modifications
pertain to related file system state.
{% endcomment %}
1.  ファイルシステムイベントが実装されているとして、特定のイベントにより発生するコンテナーの状態は、関連するファイルシステムに対してコンテナーから修正が入っていないなら、ホストファイルシステムの状態を反映しなければ **なりません**。
@z

@x
2.  If flush or sync operations are performed, relevant data **_must_** be
written back to the host file system.Between flush or sync
operations containers **_may_** cache data written, metadata modifications,
and directory structure changes.
@y
{% comment %}
2.  If flush or sync operations are performed, relevant data **_must_** be
written back to the host file system.Between flush or sync
operations containers **_may_** cache data written, metadata modifications,
and directory structure changes.
{% endcomment %}
2.  flush 操作や sync 操作が実行されたら、関連データはホスト上のファイルシステムに書き戻されなければ **なりません**。
    flush 操作や sync 操作の処理中にコンテナーは、書き込まれたデータ、メタデータの修正、ディレクトリ構造の変更をキャッシュに入れてしまう **かもしれません** 。
@z

@x
3.  All containers hosted by the same runtime **_must_** share a consistent
cache of the mount.
@y
{% comment %}
3.  All containers hosted by the same runtime **_must_** share a consistent
cache of the mount.
{% endcomment %}
3.  同一のランタイム上で動作するコンテナーは、マウントにおいて一貫性を保ったキャッシュを共有して **いなければなりません** 。
@z

@x
4.  When any container sharing a `delegated` mount terminates, changes
to the mount **_must_** be written back to the host file system. If this
writeback fails, the container's execution **_must_** fail via exit code
and/or Docker event channels.
@y
{% comment %}
4.  When any container sharing a `delegated` mount terminates, changes
to the mount **_must_** be written back to the host file system. If this
writeback fails, the container's execution **_must_** fail via exit code
and/or Docker event channels.
{% endcomment %}
4.  `delegated` マウントを共有しているコンテナーがどれか 1 つでも終了したら、マウントへの書き込み内容は、ホストのファイルシステムに書き戻されなければ **なりません**。
この書き戻しに失敗した場合、コンテナーの終了コードか、または Docker イベントチャネルを通じて、コンテナーの実行が失敗したものにならなければ **なりません** 。
@z

@x
5.  If a `delegated` mount is shared with a `cached` or a `consistent`
mount, those portions that overlap **_must_** obey `cached` or `consistent`
mount semantics, respectively.
@y
{% comment %}
5.  If a `delegated` mount is shared with a `cached` or a `consistent`
mount, those portions that overlap **_must_** obey `cached` or `consistent`
mount semantics, respectively.
{% endcomment %}
5.  `delegated` によるマウントが、`cached` や `consistent` によるマウントと共有している場合、重なり合う部分は、`cached` や `consistent` の持つ意味に合わせなければ **なりません**。
@z

@x
    Besides these constraints, the `delegated` configuration offers the
container runtime a degree of flexibility:
@y
    {% comment %}
    Besides these constraints, the `delegated` configuration offers the
container runtime a degree of flexibility:
    {% endcomment %}
    こういった制約があるにもかかわらず `delegated` 設定は、コンテナーランタイムに対して一定の柔軟性を提供します。
@z

@x
6. Containers **_may_** retain file data and metadata (including directory
structure, existence of nodes, etc) indefinitely and this cache **_may_**
desynchronize from the file system state of the host. Implementors should expire
caches when host file system changes occur, but this may be difficult to do on
a guaranteed timeframe due to platform limitations.
@y
{% comment %}
6. Containers **_may_** retain file data and metadata (including directory
structure, existence of nodes, etc) indefinitely and this cache **_may_**
desynchronize from the file system state of the host. Implementors should expire
caches when host file system changes occur, but this may be difficult to do on
a guaranteed timeframe due to platform limitations.
{% endcomment %}
6. ファイルデータやメタデータ（ディレクトリ構造やノードの存在情報など）をコンテナーがいつまでも保持し続ける **かもしれません**。
この場合に、ホスト上のファイルシステムに比べて、そのときのキャッシュが非同期状態となってしまう **かもしれません**。
したがって開発者は、ホストファイルシステムに変更が発生したときには、キャッシュを無効化する必要があります。
ただしプラットフォームによって保証される時間内に、その処理を行うのは困難なことです。
@z

@x
7. If changes to the mount source directory are present on the host
file system, those changes **_may_** be lost when the `delegated` mount
synchronizes with the host source directory.
@y
{% comment %}
7. If changes to the mount source directory are present on the host
file system, those changes **_may_** be lost when the `delegated` mount
synchronizes with the host source directory.
{% endcomment %}
7. ホスト上のマウント元となるソースディレクトリに変更があったとして、`delegated` マウントがソースディレクトリと同期を取ろうとする際に、その変更が失われることが **あるかもしれません**。
@z

@x
8. Behaviors 6-7 **do not** apply to the file types of socket, pipe, or device.
@y
{% comment %}
8. Behaviors 6-7 **do not** apply to the file types of socket, pipe, or device.
{% endcomment %}
8. 上に示した動作 6 と 7 は、ファイルタイプがソケット、パイプ、デバイスのものに対しては適用 **されません**。
@z

@x
### cached
@y
{% comment %}
### cached
{% endcomment %}
{: #cached }
### cached
@z

@x
The `cached` configuration provides all the guarantees of the `delegated`
configuration, and some additional guarantees around the visibility of writes
performed by containers. As such, `cached` typically improves the performance
of read-heavy workloads, at the cost of some temporary inconsistency between the
host and the container.
@y
{% comment %}
The `cached` configuration provides all the guarantees of the `delegated`
configuration, and some additional guarantees around the visibility of writes
performed by containers. As such, `cached` typically improves the performance
of read-heavy workloads, at the cost of some temporary inconsistency between the
host and the container.
{% endcomment %}
`cached` 設定は、`delegated` 設定によって保証される機能はすべて提供されます。
加えて、コンテナーにて実行される書き込み処理の可視性が保証されます。
このことから、通常 `cached` は、大量の読み込みを行う処理において性能改善が見込めます。
ただしホストとコンテナー間の一時的な不整合は覚悟しなければなりません。
@z

@x
For directories mounted with `cached`, the host's view of
the file system is authoritative; writes performed by containers are immediately
visible to the host, but there may be a delay before writes performed on the
host are visible within containers.
@y
{% comment %}
For directories mounted with `cached`, the host's view of
the file system is authoritative; writes performed by containers are immediately
visible to the host, but there may be a delay before writes performed on the
host are visible within containers.
{% endcomment %}
`cached` でマウントされたディレクトリは、ホスト側から参照する内容が信頼できるものになります。
コンテナー上で発生する書き込み結果は、ホスト側に即座に反映されます。
しかしホスト上で発生する書き込みが、コンテナー内から参照できるようになるまでには、遅延が発生することがあります。
@z

@x
>**Tip:** To learn more about `cached`, see the article on
[User-guided caching in Docker Desktop for Mac](https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/).
@y
{% comment %}
>**Tip:** To learn more about `cached`, see the article on
[User-guided caching in Docker Desktop for Mac](https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/).
{% endcomment %}
>**ヒント**
>
> `cached` に関する詳しい情報は、[User-guided caching in Docker Desktop for Mac](https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/) にある記事を参照してください。
@z

@x
1. Implementations **_must_** obey `delegated` Semantics 1-5.
@y
{% comment %}
1. Implementations **_must_** obey `delegated` Semantics 1-5.
{% endcomment %}
1. 実装は `delegated` の設定の意味に示す 1 から 5 に従っていなければ **なりません**。
@z

@x
2. If the implementation offers file system events, the container state
as it relates to a specific event **_must_** reflect the host file system
state at the time the event was generated.
@y
{% comment %}
2. If the implementation offers file system events, the container state
as it relates to a specific event **_must_** reflect the host file system
state at the time the event was generated.
{% endcomment %}
2. ファイルシステムイベントが実装されているとして、特定のイベントにより発生するコンテナーの状態は、ホストファイルシステムの状態を反映しなければ **なりません**。
@z

@x
3. Container mounts **_must_** perform metadata modifications, directory
structure changes, and data writes consistently with the host file
system, and **_must not_** cache data written, metadata modifications, or
directory structure changes.
@y
{% comment %}
3. Container mounts **_must_** perform metadata modifications, directory
structure changes, and data writes consistently with the host file
system, and **_must not_** cache data written, metadata modifications, or
directory structure changes.
{% endcomment %}
3. コンテナーマウントは、メタデータの修正、ディレクトリ構造変更の処理ができなければ **なりません**。
   またデータ書き込みはホストファイルシステムと一貫性を保っていることが必要です。
   一方、書き込みデータ、メタデータ修正、ディレクトリ構造変更をキャッシュに書き込んでは **なりません**。
@z

@x
4.  If a `cached` mount is shared with a `consistent` mount, those portions
that overlap **_must_** obey `consistent` mount semantics.
@y
{% comment %}
4.  If a `cached` mount is shared with a `consistent` mount, those portions
that overlap **_must_** obey `consistent` mount semantics.
{% endcomment %}
4.  `cached` によるマウントが、`consistent` によるマウントと共有している場合、重なり合う部分は、`consistent` の持つ意味に合わせなければ **なりません**。
@z

@x
    Some of the flexibility of the `delegated` configuration is retained,
namely:
@y
    {% comment %}
    Some of the flexibility of the `delegated` configuration is retained,
namely:
    {% endcomment %}
    `delegated` 設定による柔軟性が保持されることがあります。
    すなわち以下に示すことです。
@z

@x
5. Implementations **_may_** permit `delegated` Semantics 6.
@y
{% comment %}
5. Implementations **_may_** permit `delegated` Semantics 6.
{% endcomment %}
5. 実装においては `delegated` の動作 6 を許容する **可能性があります**。
@z

@x
### consistent
@y
{% comment %}
### consistent
{% endcomment %}
{: #consistent }
### consistent
@z

@x
The `consistent` configuration places the most severe restrictions on
the container run-time. For directories mounted with `consistent` the
container and host views are always synchronized: writes performed
within the container are immediately visible on the host, and writes
performed on the host are immediately visible within the container.
@y
{% comment %}
The `consistent` configuration places the most severe restrictions on
the container run-time. For directories mounted with `consistent` the
container and host views are always synchronized: writes performed
within the container are immediately visible on the host, and writes
performed on the host are immediately visible within the container.
{% endcomment %}
`consistent` 設定は、コンテナー実行時において最も厳しい制約を行うものです。
`consistent` を使ってマウントしたディレクトリは、コンテナーとホスト間での見え方は常に同期しています。
コンテナー上での書き込みは、ホスト上において即座に見ることができ、ホスト上での書き込みも、コンテナー内において即座に見ることができます。
@z

@x
The `consistent` configuration most closely reflects the behavior of
bind mounts on Linux. However, the overheads of providing strong
consistency guarantees make it unsuitable for a few use cases, where
performance is a priority and maintaining perfect consistency has low
priority.
@y
{% comment %}
The `consistent` configuration most closely reflects the behavior of
bind mounts on Linux. However, the overheads of providing strong
consistency guarantees make it unsuitable for a few use cases, where
performance is a priority and maintaining perfect consistency has low
priority.
{% endcomment %}
`consistent` 設定は Linux 上でのバインドマウントの動作を、もっともよく実現しています。
しかし厳密な一貫性を保証することにともなったオーバーヘッドがあるため、ユースケースにおいて適用できないものがでてきます。
たとえば性能への優先度が最も高く、完全な一貫性への優先度は高くないような場合です。
@z

@x
1. Implementations **_must_** obey `cached` Semantics 1-4.
@y
{% comment %}
1. Implementations **_must_** obey `cached` Semantics 1-4.
{% endcomment %}
1. 実装は `cached` の設定の意味に示す 1 から 4 に従っていなければ **なりません**。
@z

@x
2. Container mounts **_must_** reflect metadata modifications, directory
structure changes, and data writes on the host file system immediately.
@y
{% comment %}
2. Container mounts **_must_** reflect metadata modifications, directory
structure changes, and data writes on the host file system immediately.
{% endcomment %}
2. コンテナーマウントは、メタデータの修正、ディレクトリ構造変更の処理ができなければ **なりません**。
   またデータ書き込みは、ホストファイルシステムに即座に反映されることが必要です。
@z

@x
### default
@y
{% comment %}
### default
{% endcomment %}
{: #default }
### default
@z

@x
The `default` configuration is identical to the `consistent`
configuration except for its name. Crucially, this means that `cached`
Semantics 4 and `delegated` Semantics 5 that require strengthening
overlapping directories do not apply to `default` mounts. This is the
default configuration if no `state` flags are supplied.
@y
{% comment %}
The `default` configuration is identical to the `consistent`
configuration except for its name. Crucially, this means that `cached`
Semantics 4 and `delegated` Semantics 5 that require strengthening
overlapping directories do not apply to `default` mounts. This is the
default configuration if no `state` flags are supplied.
{% endcomment %}
`default` 設定は `consistent` と同一のものであり、単に名前が違っているだけです。
重要な点は、`cached` における動作 4 と `delegated` における動作 5 のように、重なり合うディレクトリに対して行われる重要な処理が、`default` マウントでは適用されないということです。
`state` フラグが指定されていなかった場合に、これがデフォルトの設定になります。
@z
