%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Measure the behavior of running containers
keywords: docker, metrics, CPU, memory, disk, IO, run, runtime, stats
redirect_from:
- /articles/runmetrics/
- /engine/articles/run_metrics
- /engine/articles/runmetrics
- /engine/admin/runmetrics/
title: Runtime metrics
---
@y
---
description: Measure the behavior of running containers
keywords: docker, metrics, CPU, memory, disk, IO, run, runtime, stats
redirect_from:
- /articles/runmetrics/
- /engine/articles/run_metrics
- /engine/articles/runmetrics
- /engine/admin/runmetrics/
title: ランタイムメトリックス
---
@z

@x
## Docker stats
@y
## docker stats
@z

@x
You can use the `docker stats` command to live stream a container's
runtime metrics. The command supports CPU, memory usage, memory limit,
and network IO metrics.
@y
`docker stats`コマンドを使うと、コンテナーの実行メトリックスからの出力を順次得ることができます。
このコマンドは、CPU、メモリ使用量、メモリ上限、ネットワーク I/O に対するメトリックスをサポートしています。
@z

@x
The following is a sample output from the `docker stats` command
@y
以下は`docker stats`コマンドの出力例です。
@z

@x
```console
$ docker stats redis1 redis2
@y
```console
$ docker stats redis1 redis2
@z

@x
CONTAINER           CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             BLOCK I/O
redis1              0.07%               796 KB / 64 MB        1.21%               788 B / 648 B       3.568 MB / 512 KB
redis2              0.07%               2.746 MB / 64 MB      4.29%               1.266 KB / 648 B    12.4 MB / 0 B
```
@y
CONTAINER           CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             BLOCK I/O
redis1              0.07%               796 KB / 64 MB        1.21%               788 B / 648 B       3.568 MB / 512 KB
redis2              0.07%               2.746 MB / 64 MB      4.29%               1.266 KB / 648 B    12.4 MB / 0 B
```
@z

@x
The [docker stats](../../engine/reference/commandline/stats.md) reference page has
more details about the `docker stats` command.
@y
[docker stats](../../engine/reference/commandline/stats.md) のリファレンスページでは、より詳細に`docker stats`コマンドについて説明しています。
@z

@x
## Control groups
@y
{: #control-groups }
## コントロールグループ
@z

@x
Linux Containers rely on [control groups](
https://www.kernel.org/doc/Documentation/cgroup-v1/cgroups.txt)
which not only track groups of processes, but also expose metrics about
CPU, memory, and block I/O usage. You can access those metrics and
obtain network usage metrics as well. This is relevant for "pure" LXC
containers, as well as for Docker containers.
@y
Linux のコンテナーは [コントロールグループ](https://www.kernel.org/doc/Documentation/cgroup-v1/cgroups.txt) に依存しています。
コントロールグループは、単に複数のプロセスを追跡するだけでなく、CPU、メモリ、ブロック I/O 使用量に関するメトリックスを提供します。
そういったメトリックスがアクセス可能であり、同様にネットワーク使用量のメトリックスも得ることができます。
これは「純粋な」LXC コンテナーに関連しており、Docker のコンテナーにも関連します。
@z

@x
Control groups are exposed through a pseudo-filesystem. In recent
distros, you should find this filesystem under `/sys/fs/cgroup`. Under
that directory, you see multiple sub-directories, called devices,
freezer, blkio, etc.; each sub-directory actually corresponds to a different
cgroup hierarchy.
@y
コントロールグループは擬似ファイルシステムを通じて提供されます。
最近のディストリビューションでは、このファイルシステムは`/sys/fs/cgroup`にあります。
このディレクトリの下には devices、freezer、blkio などのサブディレクトリが複数あります。
これらのサブディレクトリが、独特の cgroup 階層を構成しています。
@z

@x
On older systems, the control groups might be mounted on `/cgroup`, without
distinct hierarchies. In that case, instead of seeing the sub-directories,
you see a bunch of files in that directory, and possibly some directories
corresponding to existing containers.
@y
かつてのシステムでは、コントロールグループが`/cgroup`にマウントされていて、わかりやすい階層構造にはなっていませんでした。
その場合、サブディレクトリそのものを確認していくのではなく、サブディレクトリ内にある数多くのファイルを見渡して、そのディレクトリが既存のコンテナーに対応するものであろう、と確認していくしかありません。
@z

@x
To figure out where your control groups are mounted, you can run:
@y
コントロールグループがどこにマウントされているかを確認するには、以下を実行します。
@z

@x
```console
$ grep cgroup /proc/mounts
```
@y
```console
$ grep cgroup /proc/mounts
```
@z

@x
### Enumerate cgroups
@y
{: #enumerate-cgroups }
### cgroups の確認
@z

@x
The file layout of cgroups is significantly different between v1 and v2.
@y
The file layout of cgroups is significantly different between v1 and v2.
@z

@x
If `/sys/fs/cgroup/cgroup.controllers` is present on your system, you are using v2,
otherwise you are using v1.
Refer to the subsection that corresponds to your cgroup version.
@y
If `/sys/fs/cgroup/cgroup.controllers` is present on your system, you are using v2,
otherwise you are using v1.
Refer to the subsection that corresponds to your cgroup version.
@z

@x
> **Note**
>
> As of 2020, Fedora is the only well-known Linux distributon that uses cgroup v2 by default.
> Fedora uses cgroup v2 by default since Fedora 31.
@y
> **Note**
>
> As of 2020, Fedora is the only well-known Linux distributon that uses cgroup v2 by default.
> Fedora uses cgroup v2 by default since Fedora 31.
@z

@x
#### cgroup v1
@y
#### cgroup v1
@z

@x
You can look into `/proc/cgroups` to see the different control group subsystems
known to the system, the hierarchy they belong to, and how many groups they contain.
@y
`/proc/cgroups`を覗いてみるとわかりますが、システムが利用するコントロールグループのサブシステムには実にさまざまなものがあり、それが階層化されていて、数多くのグループが含まれているのがわかります。
@z

@x
You can also look at `/proc/<pid>/cgroup` to see which control groups a process
belongs to. The control group is shown as a path relative to the root of
the hierarchy mountpoint. `/` means the process has not been assigned to a
group, while `/lxc/pumpkin` indicates that the process is a member of a
container named `pumpkin`.
@y
また`/proc/<pid>/cgroup`を確認してみれば、1 つのプロセスがどのコントロールグループに属しているかがわかります。
そのときのコントロールグループは、階層構造のルートとなるマウントポイントからの相対パスで表わされます。
`/`が表示されていれば、そのプロセスにはグループが割り当てられていません。
一方`/lxc/pumpkin`といった表示になっていれば、そのプロセスは`pumpkin`という名のコンテナーのメンバーであることがわかります。
@z

@x
#### cgroup v2
@y
#### cgroup v2
@z

@x
On cgroup v2 hosts, the content of `/proc/cgroups` isn't meaningful.
See `/sys/fs/cgroup/cgroup.controllers` to the available controllers.
@y
On cgroup v2 hosts, the content of `/proc/cgroups` isn't meaningful.
See `/sys/fs/cgroup/cgroup.controllers` to the available controllers.
@z

@x
### Changing cgroup version
@y
### Changing cgroup version
@z

@x
Changing cgroup version requires rebooting the entire system.
@y
Changing cgroup version requires rebooting the entire system.
@z

@x
On systemd-based systems, cgroup v2 can be enabled by adding `systemd.unified_cgroup_hierarchy=1`
to the kernel cmdline.
To revert the cgroup version to v1, you need to set `systemd.unified_cgroup_hierarchy=0` instead.
@y
On systemd-based systems, cgroup v2 can be enabled by adding `systemd.unified_cgroup_hierarchy=1`
to the kernel cmdline.
To revert the cgroup version to v1, you need to set `systemd.unified_cgroup_hierarchy=0` instead.
@z

@x
If `grubby` command is available on your system (e.g. on Fedora), the cmdline can be modified as follows:
@y
If `grubby` command is available on your system (e.g. on Fedora), the cmdline can be modified as follows:
@z

@x
```console
$ sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=1"
```
@y
```console
$ sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=1"
```
@z

@x
If `grubby` command is not available, edit the `GRUB_CMDLINE_LINUX` line in `/etc/default/grub`
and run `sudo update-grub`.
@y
If `grubby` command is not available, edit the `GRUB_CMDLINE_LINUX` line in `/etc/default/grub`
and run `sudo update-grub`.
@z

@x
### Running Docker on cgroup v2
@y
### Running Docker on cgroup v2
@z

@x
Docker supports cgroup v2 since Docker 20.10.
Running Docker on cgroup v2 also requires the following conditions to be satisfied:
* containerd: v1.4 or later
* runc: v1.0.0-rc91 or later
* Kernel: v4.15 or later (v5.2 or later is recommended)
@y
Docker supports cgroup v2 since Docker 20.10.
Running Docker on cgroup v2 also requires the following conditions to be satisfied:
* containerd: v1.4 or later
* runc: v1.0.0-rc91 or later
* Kernel: v4.15 or later (v5.2 or later is recommended)
@z

@x
Note that the cgroup v2 mode behaves slightly different from the cgroup v1 mode:
* The default cgroup driver (`dockerd --exec-opt native.cgroupdriver`) is "systemd" on v2, "cgroupfs" on v1.
* The default cgroup namespace mode (`docker run --cgroupns`) is "private" on v2, "host" on v1.
* The `docker run` flags `--oom-kill-disable` and `--kernel-memory` are discarded on v2.
@y
Note that the cgroup v2 mode behaves slightly different from the cgroup v1 mode:
* The default cgroup driver (`dockerd --exec-opt native.cgroupdriver`) is "systemd" on v2, "cgroupfs" on v1.
* The default cgroup namespace mode (`docker run --cgroupns`) is "private" on v2, "host" on v1.
* The `docker run` flags `--oom-kill-disable` and `--kernel-memory` are discarded on v2.
@z

@x
### Find the cgroup for a given container
@y
{: #find-the-cgroup-for-a-given-container }
### 特定コンテナーに対応する cgroup の検索
@z

@x
For each container, one cgroup is created in each hierarchy. On
older systems with older versions of the LXC userland tools, the name of
the cgroup is the name of the container. With more recent versions
of the LXC tools, the cgroup is `lxc/<container_name>.`
@y
各コンテナーでは、各階層内に 1 つの cgroup が生成されます。
かつてのシステムにおいて、ユーザーランドツール LXC の古い版を利用している場合、cgroup 名はそのままコンテナー名になっています。
より新しい LXC ツールでの cgroup 名は`lxc/<コンテナー名>`となります。
@z

@x
For Docker containers using cgroups, the container name is the full
ID or long ID of the container. If a container shows up as ae836c95b4c3
in `docker ps`, its long ID might be something like
`ae836c95b4c3c9e9179e0e91015512da89fdec91612f63cebae57df9a5444c79`. You can
look it up with `docker inspect` or `docker ps --no-trunc`.
@y
cgroup を利用する Docker コンテナーにおいて、コンテナー名は、コンテナーの完全 ID か、あるいは長めの ID となります。
`docker ps`によってコンテナーが ae836c95b4c3 のように示されていたら、長めの ID はたとえば`ae836c95b4c3c9e9179e0e91015512da89fdec91612f63cebae57df9a5444c79`のようなものになります。
これは`docker inspect`を用いるか、あるいは`docker ps --no-trunc`とすれば確認することができます。
@z

@x
Putting everything together to look at the memory metrics for a Docker
container, take a look at the following paths:
- `/sys/fs/cgroup/memory/docker/<longid>/` on cgroup v1, `cgroupfs` driver
- `/sys/fs/cgroup/memory/system.slice/docker-<longid>.scope/` on cgroup v1, `systemd` driver
- `/sys/fs/cgroup/docker/<longid/>` on cgroup v2, `cgroupfs` driver
- `/sys/fs/cgroup/system.slice/docker-<longid>.scope/` on cgroup v2, `systemd` driver
@y
Docker コンテナーに対するメモリメトリックスを取りまとめて確認するには、以下のパスを見ます。
- `/sys/fs/cgroup/memory/docker/<longid>/`、cgroup v1、`cgroupfs`ドライバー利用時。
- `/sys/fs/cgroup/memory/system.slice/docker-<longid>.scope/`、cgroup v1、`systemd`ドライバー利用時。
- `/sys/fs/cgroup/docker/<longid/>`、cgroup v2、`cgroupfs`ドライバー利用時。
- `/sys/fs/cgroup/system.slice/docker-<longid>.scope/`、cgroup v2、`systemd`ドライバー利用時。
@z

@x
### Metrics from cgroups: memory, CPU, block I/O
@y
{: #metrics-from-cgroups-memory-cpu-block-io }
### cgroups の各メトリックス、メモリ、CPU、ブロック I/O
@z

@x
> **Note**
>
> This section is not yet updated for cgroup v2.
> For further information about cgroup v2, refer to [the kernel documentation](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html).
@y
> **Note**
>
> This section is not yet updated for cgroup v2.
> For further information about cgroup v2, refer to [the kernel documentation](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html).
@z

@x
For each subsystem (memory, CPU, and block I/O), one or
more pseudo-files exist and contain statistics.
@y
各サブシステム（メモリ、CPU、ブロック I/O）に対しては、擬似ファイルシステムが存在し、そこに統計情報が含まれます。
@z

@x
#### Memory metrics: `memory.stat`
@y
{: #memory-metrics-memorystat }
#### メモリメトリックス: `memory.stat`
@z

@x
Memory metrics are found in the "memory" cgroup. The memory
control group adds a little overhead, because it does very fine-grained
accounting of the memory usage on your host. Therefore, many distros
chose to not enable it by default. Generally, to enable it, all you have
to do is to add some kernel command-line parameters:
`cgroup_enable=memory swapaccount=1`.
@y
メモリメトリックスは cgroup の「memory」にあります。
メモリコントロールグループには多少のオーバーヘッドがあります。
ホスト上のメモリ利用量をきめ細かく算出しているためです。
したがって各種ディストリビューションの多くでは、デフォルトでこれを無効にしています。
これを有効にする方法は、一般的にはカーネルのコマンドラインパラメーター`cgroup_enable=memory swapaccount=1`といったものを追加するだけです。
@z

@x
The metrics are in the pseudo-file `memory.stat`.
Here is what it looks like:
@y
メトリックスは擬似ファイルシステム`memory.stat`内にあります。
これは以下のように表わされます。
@z

@x
    cache 11492564992
    rss 1930993664
    mapped_file 306728960
    pgpgin 406632648
    pgpgout 403355412
    swap 0
    pgfault 728281223
    pgmajfault 1724
    inactive_anon 46608384
    active_anon 1884520448
    inactive_file 7003344896
    active_file 4489052160
    unevictable 32768
    hierarchical_memory_limit 9223372036854775807
    hierarchical_memsw_limit 9223372036854775807
    total_cache 11492564992
    total_rss 1930993664
    total_mapped_file 306728960
    total_pgpgin 406632648
    total_pgpgout 403355412
    total_swap 0
    total_pgfault 728281223
    total_pgmajfault 1724
    total_inactive_anon 46608384
    total_active_anon 1884520448
    total_inactive_file 7003344896
    total_active_file 4489052160
    total_unevictable 32768
@y
    cache 11492564992
    rss 1930993664
    mapped_file 306728960
    pgpgin 406632648
    pgpgout 403355412
    swap 0
    pgfault 728281223
    pgmajfault 1724
    inactive_anon 46608384
    active_anon 1884520448
    inactive_file 7003344896
    active_file 4489052160
    unevictable 32768
    hierarchical_memory_limit 9223372036854775807
    hierarchical_memsw_limit 9223372036854775807
    total_cache 11492564992
    total_rss 1930993664
    total_mapped_file 306728960
    total_pgpgin 406632648
    total_pgpgout 403355412
    total_swap 0
    total_pgfault 728281223
    total_pgmajfault 1724
    total_inactive_anon 46608384
    total_active_anon 1884520448
    total_inactive_file 7003344896
    total_active_file 4489052160
    total_unevictable 32768
@z

@x
The first half (without the `total_` prefix) contains statistics relevant
to the processes within the cgroup, excluding sub-cgroups. The second half
(with the `total_` prefix) includes sub-cgroups as well.
@y
前半部分（`total_`が先頭につくものを除く）は cgroup 内のプロセスに対応する統計情報であり、サブ crgoup は除くものです。
後半部分（`total_`が先頭につくもの）は同様ですが、ただしサブ cgroup を含むものです。
@z

@x
Some metrics are "gauges", or values that can increase or decrease. For instance,
`swap` is the amount of swap space used by the members of the cgroup.
Some others are "counters", or values that can only go up, because
they represent occurrences of a specific event. For instance, `pgfault`
indicates the number of page faults since the creation of the cgroup.
@y
メトリックスの中には「メーター」つまり増減を繰り返す値表記になっているものがあります。
たとえば`swap`は、cgroup のメンバーによって利用されるスワップ容量の合計です。
この他に「カウンター」となっているもの、つまり数値がカウントアップされていくものがあります。
これは特定のイベントがどれだけ発生したかを表わします。
たとえば`pgfault`は cgroup の生成以降に、どれだけページフォールトが発生したかを表わします。
@z

@x
<style>table tr > td:first-child { white-space: nowrap;}</style>
@y
<style>table tr > td:first-child { white-space: nowrap;}</style>
@z

@x
Metric                                | Description
--------------------------------------|-----------------------------------------------------------
**cache**                             | The amount of memory used by the processes of this control group that can be associated precisely with a block on a block device. When you read from and write to files on disk, this amount increases. This is the case if you use "conventional" I/O (`open`, `read`, `write` syscalls) as well as mapped files (with `mmap`). It also accounts for the memory used by `tmpfs` mounts, though the reasons are unclear.
**rss**                               | The amount of memory that *doesn't* correspond to anything on disk: stacks, heaps, and anonymous memory maps.
**mapped_file**                       | Indicates the amount of memory mapped by the processes in the control group. It doesn't give you information about *how much* memory is used; it rather tells you *how* it is used.
**pgfault**, **pgmajfault**           | Indicate the number of times that a process of the cgroup triggered a "page fault" and a "major fault", respectively. A page fault happens when a process accesses a part of its virtual memory space which is nonexistent or protected. The former can happen if the process is buggy and tries to access an invalid address (it is sent a `SIGSEGV` signal, typically killing it with the famous `Segmentation fault` message). The latter can happen when the process reads from a memory zone which has been swapped out, or which corresponds to a mapped file: in that case, the kernel loads the page from disk, and let the CPU complete the memory access. It can also happen when the process writes to a copy-on-write memory zone: likewise, the kernel preempts the process, duplicate the memory page, and resume the write operation on the process's own copy of the page. "Major" faults happen when the kernel actually needs to read the data from disk. When it just  duplicates an existing page, or allocate an empty page, it's a regular (or "minor") fault.
**swap**                              | The amount of swap currently used by the processes in this cgroup.
**active_anon**, **inactive_anon**    | The amount of *anonymous* memory that has been identified has respectively *active* and *inactive* by the kernel. "Anonymous" memory is the memory that is *not* linked to disk pages. In other words, that's the equivalent of the rss counter described above. In fact, the very definition of the rss counter is **active_anon** + **inactive_anon** - **tmpfs** (where tmpfs is the amount of memory used up by `tmpfs` filesystems mounted by this control group). Now, what's the difference between "active" and "inactive"? Pages are initially "active"; and at regular intervals, the kernel sweeps over the memory, and tags some pages as "inactive". Whenever they are accessed again, they are immediately retagged "active". When the kernel is almost out of memory, and time comes to swap out to disk, the kernel swaps "inactive" pages.
**active_file**, **inactive_file**    | Cache memory, with *active* and *inactive* similar to the *anon* memory above. The exact formula is **cache** = **active_file** + **inactive_file** + **tmpfs**. The exact rules used by the kernel to move memory pages between active and inactive sets are different from the ones used for anonymous memory, but the general principle is the same. When the kernel needs to reclaim memory, it is cheaper to reclaim a clean (=non modified) page from this pool, since it can be reclaimed immediately (while anonymous pages and dirty/modified pages need to be written to disk first).
**unevictable**                       | The amount of memory that cannot be reclaimed; generally, it accounts for memory that has been "locked" with `mlock`. It is often used by crypto frameworks to make sure that secret keys and other sensitive material never gets swapped out to disk.
**memory_limit**, **memsw_limit**     | These are not really metrics, but a reminder of the limits applied to this cgroup. The first one indicates the maximum amount of physical memory that can be used by the processes of this control group; the second one indicates the maximum amount of RAM+swap.
@y
メトリックス                          | 内容説明
--------------------------------------|-----------------------------------------------------------
**cache**                             | このコントロールグループのプロセスによるメモリ使用量です。ブロックデバイス上の各ブロックに細かく関連づけられるものです。ディスク上のファイルと読み書きを行うと、この値が増加します。ふだん利用する I/O（システムコールの `open`、`read`、`write`）利用時に発生し、（`mmap`を用いた）マップファイルの場合も同様です。`tmpfs`によるメモリ使用もここに含まれますが、理由は明らかではありません。
**rss**                               | ディスク上の操作に対応づかないメモリ使用量です。たとえばスタック、ヒープ、匿名メモリマップなどです。
**mapped_file**                       | このコントロールグループのプロセスによって割り当てられるメモリの使用量です。メモリを **どれだけ** 利用しているかの情報は得られません。ここからわかるのは **どのように** 利用されているかです。
**pgfault**, **pgmajfault**           | cgroup のプロセスにおいて発生した「ページフォールト」、「メジャーフォールト」の回数を表わします。ページフォールトは、プロセスがアクセスした仮想メモリスペースの一部が、存在していないかアクセス拒否された場合に発生します。存在しないというのは、そのプロセスにバグがあり、不正なアドレスにアクセスしようとしたことを表わします（`SIGSEGV`シグナルが送信され、`Segmentation fault`といういつものメッセージを受けたとたんに、プロセスが停止されます）。アクセス拒否されるのは、スワップしたメモリ領域、あるいはマップファイルに対応するメモリ領域を読み込もうとしたときに発生します。この場合、カーネルがディスクからページを読み込み、CPU のメモリアクセスを成功させます。またコピーオンライトメモリ領域へプロセスが書き込みを行う場合にも発生することがあります。同様にカーネルがプロセスの切り替え（preemption）を行ってからメモリページを複製し、ページ内のプロセス自体のコピーに対して書き込み処理を復元します。「メジャーフォールト」はカーネルがディスクからデータを読み込む必要がある際に発生します。既存ページを複製する場合や空のページを割り当てる場合は、通常の（つまり「マイナー」の）フォールトになります。
**swap**                              | この cgroup 内のプロセスによって現時点利用されているスワップ総量です。
**active_anon**、**inactive_anon**    | カーネルによって **アクティブ** か **非アクティブ** のいずれかに特定される **匿名** メモリの使用量です。「匿名」 メモリとは、ディスクページにひもづいて **いない** メモリのことです。別の表現でいえば、上で示した rss カウンターと同等のものです。正確な rss カウンターの定義式は、**active_anon** ＋ **inactive_anon** － **tmpfs** です。（このコントロールグループによってマウントされている`tmpfs`ファイルシステムが利用するメモリ使用量のことです。）では "アクティブ" と "非アクティブ" の違いは？  ページは初めは "アクティブ" です。一定間隔でカーネルがメモリを走査し、一部に "非アクティブ" というタグをつけます。再度アクセスが行われると、すぐに "アクティブ" というタグにつけかえられます。カーネルがほぼメモリ不足に陥って、ディスクへのスワップが必要になると、カーネルは "非アクティブ" ページをスワップします。
**active_file**, **inactive_file**    | 上で示した **anon** メモリと同様、**アクティブ**、**非アクティブ** の状態があるキャッシュメモリのこと。正確な式で表現すると、**cache** ＝ **active_file** ＋ **inactive_file** ＋ **tmpfs** です。カーネルが採用する規則として、アクティブ、非アクティブなメモリページを移動させる方法は、匿名メモリのときとは異なります。ただしその一般的な原理は同じです。カーネルがメモリを要求するとき、プール上からクリーンな（修正がかかっていない）ページを取り出すことの方が簡単に済みます。取り出すことがすぐにできるからです。（一方、匿名ページや、修正のかかった汚れたページでは、その前にディスクに書き出すことが必要になるからです。）
**unevictable**                       | 取り出し要求ができないメモリ容量のことです。一般には`mlock`によって「ロックされた」メモリとされます。暗号フレームワークにおいて利用されることがあり、秘密鍵や機密情報がディスクにスワップされないようにするものです。
**memory_limit**, **memsw_limit**     | これは実際のメトリックスではありません。この cgroup に適用される上限を確認するためのものです。**memory_limit** は、このコントロールグループのプロセスが利用可能な物理メモリの最大容量を示します。**memsw_limit** は RAM ＋ スワップの最大容量を示します。
@z

@x
Accounting for memory in the page cache is very complex. If two
processes in different control groups both read the same file
(ultimately relying on the same blocks on disk), the corresponding
memory charge is split between the control groups. It's nice, but
it also means that when a cgroup is terminated, it could increase the
memory usage of another cgroup, because they are not splitting the cost
anymore for those memory pages.
@y
ページキャッシュ内のメモリの計算は非常に複雑です。
コントロールグループの異なるプロセスが 2 つあって、それが同一のファイル（最終的にディスク上の同一ブロックに存在）を読み込むとします。
その際のメモリの負担は、それぞれのコントロールグループに分割されます。
これは一見すると良いことのように思えます。
しかし一方の cgroup が停止したとします。
そうすると他方の cgroup におけるメモリ使用量が増大してしまうことになります。
両者のメモリページに対する使用コストは、もう共有されていないからです。
@z

@x
### CPU metrics: `cpuacct.stat`
@y
{: #cpu-metrics-cpuacctstat }
### CPU メトリックス: `cpuacct.stat`
@z

@x
Now that we've covered memory metrics, everything else is
simple in comparison. CPU metrics are in the
`cpuacct` controller.
@y
これまでメモリメトリックスについて説明してきました。
これ以外のものは比較的簡単です。
CPU メトリックスは`cpuacct`コントローラー内にあります。
@z

@x
For each container, a pseudo-file `cpuacct.stat` contains the CPU usage
accumulated by the processes of the container, broken down into `user` and
`system` time. The distinction is:
@y
各コンテナーに対応して擬似ファイル`cpuacct.stat`があり、コンテナープロセスの CPU 使用時間が積算されています。
そしてこれが`user`時間と`system`時間に割り振られています。
両者の違いは以下のとおりです。
@z

@x
- `user` time is the amount of time a process has direct control of the CPU,
  executing process code.
- `system` time is the time the kernel is executing system calls on behalf of
  the process.
@y
- `user`時間は、プロセスが CPU を直接制御して、プロセスコードを実行している時間のことです。
- `system`時間は、カーネルがプロセスのためにシステムコールを実行している時間のことです。
@z

@x
Those times are expressed in ticks of 1/100th of a second, also called "user
jiffies". There are `USER_HZ` *"jiffies"* per second, and on x86 systems,
`USER_HZ` is 100. Historically, this mapped exactly to the number of scheduler
"ticks" per second, but higher frequency scheduling and
[tickless kernels](https://lwn.net/Articles/549580/) have made the number of
ticks irrelevant.
@y
この時間は 1/100 秒の tick という周期で表わされます。
別名「user jiffies」ともいいます。
1 秒には`USER_HZ`分の「**jiffies**」があり、x86 システムでは`USER_HZ`は 100 です。
これまでの経緯として、これは 1 秒に割り当てられるスケジューラー「ticks」の数です。
ただしそれ以上に頻繁にスケジューリングされることや、[tickless kernels](https://lwn.net/Articles/549580/) があり、これらは ticks 数は関係がなくなります。
@z

@x
#### Block I/O metrics
@y
{: #block-io-metrics }
#### ブロック I/O メトリックス
@z

@x
Block I/O is accounted in the `blkio` controller.
Different metrics are scattered across different files. While you can
find in-depth details in the [blkio-controller](
https://www.kernel.org/doc/Documentation/cgroup-v1/blkio-controller.txt)
file in the kernel documentation, here is a short list of the most
relevant ones:
@y
ブロック I/O は`blkio`コントローラーにおいて計算されます。
さまざまなメトリックスが、さまざまなファイルにわたって保持されています。
より詳細は、カーネルドキュメント内にある [blkio-controller](https://www.kernel.org/doc/Documentation/cgroup-v1/blkio-controller.txt) ファイルに記述されていますが、以下では最も関連のあるものを簡潔に示します。
@z

@x
Metric                      | Description
----------------------------|-----------------------------------------------------------
**blkio.sectors**           | Contains the number of 512-bytes sectors read and written by the processes member of the cgroup, device by device. Reads and writes are merged in a single counter.
**blkio.io_service_bytes**  | Indicates the number of bytes read and written by the cgroup. It has 4 counters per device, because for each device, it differentiates between synchronous vs. asynchronous I/O, and reads vs. writes.
**blkio.io_serviced**       | The number of I/O operations performed, regardless of their size. It also has 4 counters per device.
**blkio.io_queued**         | Indicates the number of I/O operations currently queued for this cgroup. In other words, if the cgroup isn't doing any I/O, this is zero. The opposite is not true. In other words, if there is no I/O queued, it does not mean that the cgroup is idle (I/O-wise). It could be doing purely synchronous reads on an otherwise quiescent device, which can therefore handle them immediately, without queuing. Also, while it is helpful to figure out which cgroup is putting stress on the I/O subsystem, keep in mind that it is a relative quantity. Even if a process group does not perform more I/O, its queue size can increase just because the device load increases because of other devices.
@y
メトリックス                | 内容説明
----------------------------|-----------------------------------------------------------
**blkio.sectors**           | 512 バイトのセクター数。cgroup のプロセスメンバーによって、デバイスごとに読み書きされます。読み書きは 1 つのカウンターに合計されます。
**blkio.io_service_bytes**  | cgroup によって読み書きされるバイト数を表わします。デバイスごとに 4 つのカウンターがあります。1 つのデバイスつき、同期、非同期 I/O の別、読み込み、書き込みの別があるからです。
**blkio.io_serviced**       | 処理された I/O 操作の数。そのサイズとは無関係です。デバイスごとに、やはり 4 つのカウンターがあります。
**blkio.io_queued**         | この cgroup において、その時点でキューに入っている I/O 操作の数を表わします。言い換えると  cgroup に I/O が発生していなければ、この値はゼロになります。一方、この逆は正しくなりません。I/O がキューに入っていなかったとしても、それは cgroup が（I/O 的に）アイドルであるとは言えません。普段は静止しているデバイスが、純粋に同期読み込み処理を行っているかもしれないからです。その場合には、I/O 操作をすぐに処理できるわけであり、キューに入れることなく扱うことができます。またこのメトリックスは I/O サブシステム上のどの cgroup に負荷がかかっているかがわかります。ただし示される値は相対的な量にすぎません。プロセスグループがこれ以上に I/O を処理しない場合であっても、他のデバイスの影響によりデバイス負荷が増加するため、キューサイズも増加することになります。
@z

@x
### Network metrics
@y
{: #network-metrics }
### ネットワークメトリックス
@z

@x
Network metrics are not exposed directly by control groups. There is a
good explanation for that: network interfaces exist within the context
of *network namespaces*. The kernel could probably accumulate metrics
about packets and bytes sent and received by a group of processes, but
those metrics wouldn't be very useful. You want per-interface metrics
(because traffic happening on the local `lo`
interface doesn't really count). But since processes in a single cgroup
can belong to multiple network namespaces, those metrics would be harder
to interpret: multiple network namespaces means multiple `lo`
interfaces, potentially multiple `eth0`
interfaces, etc.; so this is why there is no easy way to gather network
metrics with control groups.
@y
ネットワークメトリックスは、コントロールグループによって直接表わされるものではありません。
わかりやすく説明します。
ネットワークインターフェースは、**ネットワーク名前空間** コンテキストの中に存在します。
カーネルは、プロセスグループとの間で送受信されるパケットやバイトに関して、メトリックスを収集します。
ただこのメトリックスはあまり役に立つものではありません。
欲しいのはインターフェースごとのメトリックスであるはずです。
（なぜならメトリックスでは`lo`インターフェースに発生するトラフィックはカウントされません。）
もっとも 1 つの cgroup は、複数のネットワーク名前空間に属することができるため、そのメトリックスを計算することは、より難しくなります。
複数のネットワーク名前空間になるということは、`lo`インターフェースが複数あるということであり、場合によっては複数の`eth0`インターフェースを持つこともあります。
コントロールグループを用いてネットワークメトリックスを簡単に集めることができないのは、こういった理由によります。
@z

@x
Instead we can gather network metrics from other sources:
@y
そのかわり、ネットワークメトリックスは別の情報から収集することができます。
@z

@x
#### IPtables
@y
#### IPtables
@z

@x
IPtables (or rather, the netfilter framework for which iptables is just
an interface) can do some serious accounting.
@y
iptables （むしろ iptables がインターフェースとなる netfilter フレームワーク）から重要な情報が得られます。
@z

@x
For instance, you can setup a rule to account for the outbound HTTP
traffic on a web server:
@y
たとえばウェブサーバー上におけるアウトバウンド HTTP トラフィックを計算するルールを設定することができます。
@z

@x
```console
$ iptables -I OUTPUT -p tcp --sport 80
```
@y
```console
$ iptables -I OUTPUT -p tcp --sport 80
```
@z

@x
There is no `-j` or `-g` flag,
so the rule just counts matched packets and goes to the following
rule.
@y
ここでは`-j`フラグや`-g`フラグは用いません。
このルールがパケットをカウントし、後続のルールの処理を行います。
@z

@x
Later, you can check the values of the counters, with:
@y
このカウンター値は以下のようにして確認できます。
@z

@x
```console
$ iptables -nxvL OUTPUT
```
@y
```console
$ iptables -nxvL OUTPUT
```
@z

@x
Technically, `-n` is not required, but it
prevents iptables from doing DNS reverse lookups, which are probably
useless in this scenario.
@y
技術的なことだけで言えば`-n`は必要ありません。
DNS の逆引きを避けるためのものですが、ここでの作業ではおそらく不要です。
@z

@x
Counters include packets and bytes. If you want to setup metrics for
container traffic like this, you could execute a `for`
loop to add two `iptables` rules per
container IP address (one in each direction), in the `FORWARD`
chain. This only meters traffic going through the NAT
layer; you also need to add traffic going through the userland
proxy.
@y
カウンターにはパケット数とバイト数があります。
このトラフィックのようなメトリックスを設定したい場合は、`for`ループを実行して、コンテナー IP アドレスに対して 2 つの`iptables`ルールを`FORWARD`チェーンに追加します（1 方向に対して 1 つ）。
これにより NAT 層を通過するトラフィックのみ計測されます。
ユーザーランドプロキシーを通過するトラフィックを計測する場合も、ルールを追加する必要があります。
@z

@x
Then, you need to check those counters on a regular basis. If you
happen to use `collectd`, there is a [nice plugin](https://collectd.org/wiki/index.php/Table_of_Plugins)
to automate iptables counters collection.
@y
これを行ったら、カウンターを定期的に確認することになります。
`collectd`を使ってみるのであれば、iptables のカウンター情報を自動的に収集してくれる [便利なプラグイン](https://collectd.org/wiki/index.php/Table_of_Plugins) があります。
@z

@x
#### Interface-level counters
@y
{: #interface-level-counters }
#### インターフェースレベルのカウンター
@z

@x
Since each container has a virtual Ethernet interface, you might want to check
directly the TX and RX counters of this interface. Each container is associated
to a virtual Ethernet interface in your host, with a name like `vethKk8Zqi`.
Figuring out which interface corresponds to which container is, unfortunately,
difficult.
@y
各コンテナーには仮想イーサネットインターフェースがあるので、このインターフェースの TX および RX カウンターを直接確認したいかもしれません。
各コンテナーは、ホスト上の仮想イーサネットインターフェースに関連づけられていて、その名称は`vethKk8Zqi`などとなっています。
もっともどのコンテナーに対して、どのインターフェースが対応しているかを判別するのは、残念ながら困難です。
@z

@x
But for now, the best way is to check the metrics *from within the
containers*. To accomplish this, you can run an executable from the host
environment within the network namespace of a container using **ip-netns
magic**.
@y
今のところ、メトリックスを確認する一番の方法は、**そのコンテナー内部から** 確認することです。
これを実現する方法は、**ip netns を巧みに** 利用します。
これを使えば、コンテナーのネットワーク名前空間内に、ホスト環境からモジュールを実行させることができます。
@z

@x
The `ip-netns exec` command allows you to execute any
program (present in the host system) within any network namespace
visible to the current process. This means that your host can
 enter the network namespace of your containers, but your containers
can't access the host or other peer containers.
Containers can interact with their sub-containers, though.
@y
`ip-netns exec`コマンドはどのようなネットワーク名前空間内においても、（ホスト内に存在する）プログラムなら何でも実行することができ、プロセスからその状況を確認することができます。
つまりコンテナーのネットワーク名前空間内に、ホストから入ることができるということです。
ただしコンテナーからは、ホストや別のコンテナーにはアクセスできません。
サブコンテナーであれば、互いに通信することができます。
@z

@x
The exact format of the command is:
@y
このコマンドの正確な書式は以下のとおりです。
@z

@x
```console
$ ip netns exec <nsname> <command...>
```
@y
```console
$ ip netns exec <nsname> <command...>
```
@z

@x
For example:
@y
たとえば以下のように実行します。
@z

@x
```console
$ ip netns exec mycontainer netstat -i
```
@y
```console
$ ip netns exec mycontainer netstat -i
```
@z

@x
`ip netns` finds the "mycontainer" container by
using namespaces pseudo-files. Each process belongs to one network
namespace, one PID namespace, one `mnt` namespace,
etc., and those namespaces are materialized under
`/proc/<pid>/ns/`. For example, the network
namespace of PID 42 is materialized by the pseudo-file
`/proc/42/ns/net`.
@y
`ip netns`コマンドは、名前空間の擬似ファイルからコンテナー「mycontainer」を探します。
各プロセスは 1 つのネットワーク名前空間、1 つの PID 名前空間、1 つの`mnt`名前空間、といったものに属します。
これらの名前空間は`/proc/<pid>/ns/`の下に実現されます。
たとえば PID が 42 であるネットワーク名前空間は、擬似ファイル`/proc/42/ns/net`として実現されます。
@z

@x
When you run `ip netns exec mycontainer ...`, it
expects `/var/run/netns/mycontainer` to be one of
those pseudo-files. (Symlinks are accepted.)
@y
`ip netns exec mycontainer ...`が実行されるとき、`/var/run/netns/mycontainer`が擬似ファイルの 1 つであるとみなされます。
（シンボリックリンクが張られています。）
@z

@x
In other words, to execute a command within the network namespace of a
container, we need to:
@y
言い換えると、コンテナーのネットワーク名前空間内にてコマンドを実行するためには、以下のことが必要になります。
@z

@x
- Find out the PID of any process within the container that we want to investigate;
- Create a symlink from `/var/run/netns/<somename>` to `/proc/<thepid>/ns/net`
- Execute `ip netns exec <somename> ....`
@y
- 調査したい対象のコンテナー内部に動作している、いずれかのプロセスの PID を調べます。
- `/var/run/netns/<somename>`から`/proc/<pid>/ns/net`へのシンボリックリンクを生成します。
- `ip netns exec <somename> ....`を実行します。
@z

@x
Review [Enumerate Cgroups](#enumerate-cgroups) for how to find
the cgroup of an in-container process whose network usage you want to measure.
From there, you can examine the pseudo-file named
`tasks`, which contains all the PIDs in the
cgroup (and thus, in the container). Pick any one of the PIDs.
@y
ネットワーク使用量の計測を行おうとしているコンテナー内部において、実行されているプロセスがどの cgroup に属しているかを探し出すには [cgroups の確認](#enumerate-cgroups) を参照してください。
その方法に従って、`tasks`という名前の擬似ファイルを調べます。
その擬似ファイル内には cgroup 内の（つまりコンテナー内の） PID がすべて示されています。
そのうちの 1 つを取り出して扱います。
@z

@x
Putting everything together, if the "short ID" of a container is held in
the environment variable `$CID`, then you can do this:
@y
環境変数`$CID`にはコンテナーの「短めの ID」が設定されているとします。
これまで説明してきたことをすべてまとめて、以下のコマンドとして実行します。
@z

@x
```console
$ TASKS=/sys/fs/cgroup/devices/docker/$CID*/tasks
$ PID=$(head -n 1 $TASKS)
$ mkdir -p /var/run/netns
$ ln -sf /proc/$PID/ns/net /var/run/netns/$CID
$ ip netns exec $CID netstat -i
```
@y
```console
$ TASKS=/sys/fs/cgroup/devices/docker/$CID*/tasks
$ PID=$(head -n 1 $TASKS)
$ mkdir -p /var/run/netns
$ ln -sf /proc/$PID/ns/net /var/run/netns/$CID
$ ip netns exec $CID netstat -i
```
@z

@x
## Tips for high-performance metric collection
@y
{: #tips-for-high-performance-metric-collection }
## 詳細なメトリックスを収集するためのヒント
@z

@x
Running a new process each time you want to update metrics is
(relatively) expensive. If you want to collect metrics at high
resolutions, and/or over a large number of containers (think 1000
containers on a single host), you do not want to fork a new process each
time.
@y
新しいプロセスを起動するたびに、メトリックスを最新のものにすることは（比較的）面倒なことです。
高解像度のメトリックスが必要な場合、しかもそれが非常に多くのコンテナー（1 ホスト上に 1000 個くらいのコンテナー）を扱わなければならないとしたら、毎回の新規プロセス起動は行う気になれません。
@z

@x
Here is how to collect metrics from a single process. You need to
write your metric collector in C (or any language that lets you do
low-level system calls). You need to use a special system call,
`setns()`, which lets the current process enter any
arbitrary namespace. It requires, however, an open file descriptor to
the namespace pseudo-file (remember: that's the pseudo-file in
`/proc/<pid>/ns/net`).
@y
1 つのプロセスを作り出してメトリックスを収集する方法をここに示します。
メトリックスを収集するプログラムを C 言語（あるいは低レベルシステムコールを実行できる言語）で記述する必要があります。
利用するのは特別なシステムコール`setns()`です。
これはその時点でのプロセスを、任意の名前空間に参加させることができます。
そこでは、その名前空間に応じた擬似ファイルへのファイルディスクリプターをオープンしておくことが必要とされます。
（擬似ファイルは`/proc/<pid>/ns/net`にあることを思い出してください。）
@z

@x
However, there is a catch: you must not keep this file descriptor open.
If you do, when the last process of the control group exits, the
namespace is not destroyed, and its network resources (like the
virtual interface of the container) stays around forever (or until
you close that file descriptor).
@y
ただしこれは本当のことではありません。
ファイルディスクリプターはオープンのままにしないでください。
オープンにしたままであると、コントロールグループの最後の 1 つとなるプロセスがある場合に、名前空間は削除されず、そのネットワークリソース（コンテナーの仮想インターフェースなど）がずっと残り続けてしまいます。
（あるいはそれは、ファイルディスクリプターを閉じるまで続きます。）
@z

@x
The right approach would be to keep track of the first PID of each
container, and re-open the namespace pseudo-file each time.
@y
適切なやり方は、各コンテナーの初めの PID を追跡し、ことあるごとに名前空間の擬似ファイルを、その都度開いて確認していくしかありません。
@z

@x
## Collect metrics when a container exits
@y
{: #collect-metrics-when-a-container-exits }
## コンテナー終了後のメトリックス収集
@z

@x
Sometimes, you do not care about real time metric collection, but when a
container exits, you want to know how much CPU, memory, etc. it has
used.
@y
リアルタイムにメトリックスを収集する、ということに気づかない方もいます。
しかしコンテナーがそこにあれば、CPU、メモリなどをどれだけ利用しているかを知りたくなります。
@z

@x
Docker makes this difficult because it relies on `lxc-start`, which carefully
cleans up after itself. It is usually easier to collect metrics at regular
intervals, and this is the way the `collectd` LXC plugin works.
@y
Docker は`lxc-start`によって処理を行うため、リアルタイムなメトリックス収集は困難です。
`lxc-start`が自身の処理の後に、まわりをきれいにしてしまうためです。
メトリックスの収集は、一定間隔をおいて取得するのが、より簡単な方法と言えます。
`collectd`にある LXC プラグインは、この方法により動作しています。
@z

@x
But, if you'd still like to gather the stats when a container stops,
here is how:
@y
コンテナーを停止してから情報収集する方がよいのであれば、以下の方法をとります。
@z

@x
For each container, start a collection process, and move it to the
control groups that you want to monitor by writing its PID to the tasks
file of the cgroup. The collection process should periodically re-read
the tasks file to check if it's the last process of the control group.
(If you also want to collect network statistics as explained in the
previous section, you should also move the process to the appropriate
network namespace.)
@y
各コンテナーにおいて情報収集用のプロセスを実行し、コントロールグループに移動させます。
このコントロールグループは監視対象としたいものであり、cgroup のタスクファイル内に PID を記述しておきます。
情報収集のプロセスは、定期的にそのタスクファイルを読み込み、そのプロセス自体が、コントロールグループ内で残っている最後のプロセスであるかどうかを確認します。
（前節に示したように、ネットワーク統計情報も収集したい場合は、そのプロセスを適切なネットワーク名前空間に移動することも必要になります。）
@z

@x
When the container exits, `lxc-start` attempts to
delete the control groups. It fails, since the control group is
still in use; but that's fine. Your process should now detect that it is
the only one remaining in the group. Now is the right time to collect
all the metrics you need!
@y
コンテナーが終了するときに、`lxc-start`はコントロールグループを削除しようとします。
削除に失敗しますが、これはコントロールグループがまだ利用されているからです。
でも問題ありません。
情報収集用のプロセスはこのとき、コントロールグループ内にはただ 1 つのプロセスしか残っていないことが検出できるはずです。
このときこそ、メトリックスをすべて収集するタイミングとなります。
@z

@x
Finally, your process should move itself back to the root control group,
and remove the container control group. To remove a control group, just
`rmdir` its directory. It's counter-intuitive to
`rmdir` a directory as it still contains files; but
remember that this is a pseudo-filesystem, so usual rules don't apply.
After the cleanup is done, the collection process can exit safely.
@y
最後にそのプロセスを root コントロールグループに戻して、コンテナーのコントロールグループを削除します。
コントロールグループの削除は、単にそのディレクトリを`rmdir`で削除するだけです。
ディレクトリ内にファイルが残っているのに、ディレクトリを削除するというのは、やってはいけないことのように思えます。
しかしこれは擬似ファイルシステムです。
普通の取り扱いをする必要のないものです。
すべてをきれいにした後であれば、情報収集用のプロセスを安全に終了させることができます。
@z
