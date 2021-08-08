%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
redirect_from:
- /engine/articles/systemd/
- /engine/admin/resource_constraints/
title: "Runtime options with Memory, CPUs, and GPUs"
description: "Specify the runtime options for a container"
keywords: "docker, daemon, configuration, runtime"
---
@y
---
redirect_from:
- /engine/articles/systemd/
- /engine/admin/resource_constraints/
title: "メモリ、CPU、GPU に対する実行時オプション"
description: "コンテナーに対して実行時オプションを指定します。"
keywords: "docker, daemon, configuration, runtime"
---
@z

@x
By default, a container has no resource constraints and can use as much of a
given resource as the host's kernel scheduler allows. Docker provides ways
to control how much memory, or CPU a container can use, setting runtime
configuration flags of the `docker run` command. This section provides details
on when you should set such limits and the possible implications of setting them.
@y
デフォルトにおいてコンテナーには、リソースの利用に関して制限がありません。
したがってホストカーネルのスケジューラーが割り振るリソースを、その分だけ利用できます。
Docker には、コンテナーが利用するメモリや CPU をどれくらいにするかを制御する方法があります。
`docker run`コマンドにおいて実行時フラグを設定する方法です。
この節では、どのようなときにそういった制約を行うのか、そして制約によってどのような影響があるのかを説明します。
@z

@x
Many of these features require your kernel to support Linux capabilities. To
check for support, you can use the
[`docker info`](../../engine/reference/commandline/info.md) command. If a capability
is disabled in your kernel, you may see a warning at the end of the output like
the following:
@y
制約に関する機能を利用するには、カーネルがケーパビリティーをサポートしている必要があります。
サポートしているかどうかは、[`docker info`](../../engine/reference/commandline/info.md) コマンドを実行すればわかります。
利用しているカーネルにおいてケーパビリティーが無効になっていると、このコマンドの出力の最後に、以下のような出力が行われます。
@z

@x
```console
WARNING: No swap limit support
```
@y
```console
WARNING: No swap limit support
```
@z

@x
Consult your operating system's documentation for enabling them.
[Learn more](../../engine/install/linux-postinstall.md#your-kernel-does-not-support-cgroup-swap-limit-capabilities).
@y
これを有効にする方法は、各オペレーティングシステムのドキュメントを参照してください。
[さらに詳しくはここで説明しています](../../engine/install/linux-postinstall.md#your-kernel-does-not-support-cgroup-swap-limit-capabilities)。
@z

@x
## Memory
@y
{: #memory }
## メモリ
@z

@x
### Understand the risks of running out of memory
@y
{: #understand-the-risks-of-running-out-of-memory }
### メモリ不足時のリスクへの理解
@z

@x
It is important not to allow a running container to consume too much of the
host machine's memory. On Linux hosts, if the kernel detects that there is not
enough memory to perform important system functions, it throws an `OOME`, or
`Out Of Memory Exception`, and starts killing processes to free up
memory. Any process is subject to killing, including Docker and other important
applications. This can effectively bring the entire system down if the wrong
process is killed.
@y
コンテナーがホストマシンのメモリを必要以上に消費することは避けなければなりません。
Linux ホストにおいて、重要なシステム関数を実行するだけの十分なメモリがないことをカーネルが検出した場合、`OOME`例外、つまり`Out Of Memory Exception`がスローされます。
そしてプロセスの停止を行いメモリを開放します。
Docker であろうが重要なアプリケーションであろうが、あらゆるプロセスが強制的に停止させられます。
停止させてはならないプロセスが停止してしまうと、システム全体を停止させる事態にもなりかねません。
@z

@x
Docker attempts to mitigate these risks by adjusting the OOM priority on the
Docker daemon so that it is less likely to be killed than other processes
on the system. The OOM priority on containers is not adjusted. This makes it more
likely for an individual container to be killed than for the Docker daemon
or other system processes to be killed. You should not try to circumvent
these safeguards by manually setting `--oom-score-adj` to an extreme negative
number on the daemon or a container, or by setting `--oom-kill-disable` on a
container.
@y
Docker においては、デーモンに対しての OOM プライオリティ調整機能があります。
これによりメモリ不足のリスクを軽減し Docker デーモンが他のプロセスに比べて停止しにくいようにしています。
この OOM プライオリティの調整機能は、コンテナーにはありません。
したがって Docker デーモンや他のシステムプロセスが停止することよりも、単一のコンテナーが停止する可能性の方が高いことになります。
これは Docker が採用する安全策なので、無理に回避する方法を取らないでください。
Docker デーモンに対して、手動で`--oom-score-adj`に極端な負数を指定したり、コンテナーに対して`--oom-kill-disable`を指定したりするようなことはやめてください。
@z

@x
For more information about the Linux kernel's OOM management, see
[Out of Memory Management](https://www.kernel.org/doc/gorman/html/understand/understand016.html){: target="_blank" rel="noopener" class="_" }.
@y
Linux カーネルの OOM 管理については [Out of Memory Management](https://www.kernel.org/doc/gorman/html/understand/understand016.html){: target="_blank" rel="noopener" class="_" } を参照してください。
@z

@x
You can mitigate the risk of system instability due to OOME by:
@y
OOME に起因する不安定リスクを回避するには、以下の対応があります。
@z

@x
- Perform tests to understand the memory requirements of your application before
  placing it into production.
- Ensure that your application runs only on hosts with adequate resources.
- Limit the amount of memory your container can use, as described below.
- Be mindful when configuring swap on your Docker hosts. Swap is slower and
  less performant than memory but can provide a buffer against running out of
  system memory.
- Consider converting your container to a [service](../../engine/swarm/services.md),
  and using service-level constraints and node labels to ensure that the
  application runs only on hosts with enough memory
@y
- アプリケーションの本番環境への移行前に、アプリケーションがどのようにメモリを必要とするかをテストして理解すること。
- アプリケーションが、一定のリソースがあればホスト上だけで動作することを確認すること。
- これ以降に示すような、コンテナーのメモリ使用量を制限すること。
- Docker ホスト上のスワップの設定に十分注意すること。
  スワップはメモリに比べて、処理速度が遅く性能が劣ります。
  ただしシステムメモリの不足を補うためのバッファを利用します。
- コンテナーを [サービス](../../engine/swarm/services.md) に変更する検討をすること。
  そしてサービスレベルでの制約やノードラベルを利用することで、十分なメモリを有するホスト上でのみアプリケーションが動作するように検討すること。
@z

@x
### Limit a container's access to memory
@y
{: #limit-a-containers-access-to-memory }
### コンテナーに対するメモリアクセスの制限
@z

@x
Docker can enforce hard memory limits, which allow the container to use no more
than a given amount of user or system memory, or soft limits, which allow the
container to use as much memory as it needs unless certain conditions are met,
such as when the kernel detects low memory or contention on the host machine.
Some of these options have different effects when used alone or when more than
one option is set.
@y
Docker では、ハードリミット（hard limit）により厳しくメモリを制限することができます。
コンテナーが利用するユーザーメモリ、あるいはシステムメモリを指定量以下に抑えます。
また緩い制限であるソフトリミット（soft limit）もあり、所定の条件下でない限りは、コンテナーが求めるメモリ使用を認めることができます。
所定の条件とはたとえば、ホスト上のメモリ不足やリソースコンフリクト発生をカーネルが検出したような場合です。
制限を指定するオプションを利用する場合には、単独で利用するか複数組み合わせて利用するかによって、その効果はさまざまです。
@z

@x
Most of these options take a positive integer, followed by a suffix of `b`, `k`,
`m`, `g`, to indicate bytes, kilobytes, megabytes, or gigabytes.
@y
この制約オプションのほとんどは、正の整数を指定して、バイト、キロバイト、メガバイト、ギガバイトを表わす`b`、`k`、`m`、`g`を後ろにつけます。
@z

@x
| Option                 | Description                                                                                                                                                                                                                                                                                                                                                                                      |
|:-----------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-m` or `--memory=`    | The maximum amount of memory the container can use. If you set this option, the minimum allowed value is `6m` (6 megabyte).                                                                                                                                                                                                                                                                      |
| `--memory-swap`*       | The amount of memory this container is allowed to swap to disk. See [`--memory-swap` details](#--memory-swap-details).                                                                                                                                                                                                                                                    |
| `--memory-swappiness`  | By default, the host kernel can swap out a percentage of anonymous pages used by a container. You can set `--memory-swappiness` to a value between 0 and 100, to tune this percentage. See [`--memory-swappiness` details](#--memory-swappiness-details).                                                                                                                 |
| `--memory-reservation` | Allows you to specify a soft limit smaller than `--memory` which is activated when Docker detects contention or low memory on the host machine. If you use `--memory-reservation`, it must be set lower than `--memory` for it to take precedence. Because it is a soft limit, it does not guarantee that the container doesn't exceed the limit.                                      |
| `--kernel-memory`      | The maximum amount of kernel memory the container can use. The minimum allowed value is `4m`. Because kernel memory cannot be swapped out, a container which is starved of kernel memory may block host machine resources, which can have side effects on the host machine and on other containers. See [`--kernel-memory` details](#--kernel-memory-details).            |
| `--oom-kill-disable`   | By default, if an out-of-memory (OOM) error occurs, the kernel kills processes in a container. To change this behavior, use the `--oom-kill-disable` option. Only disable the OOM killer on containers where you have also set the `-m/--memory` option. If the `-m` flag is not set, the host can run out of memory and the kernel may need to kill the host system's processes to free memory. |
@y
| オプション             | 内容説明                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|:-----------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-m`または`--memory=`  | コンテナーに割り当てるメモリ最大使用量。このオプションを利用する場合、指定できる最小値は`6m`(6 メガバイト) です。                                                                                                                                                                                                                                                                                                                                           |
| `--memory-swap`*       | コンテナーにおいてディスクへのスワップを許容するメモリ容量。[`--memory-swap`の詳細](#--memory-swap-details) を参照してください。                                                                                                                                                                                                                                                                                                                            |
| `--memory-swappiness`  | デフォルトにおいては、コンテナーによって利用されている匿名ページを一定の割合でスワップアウトすることができます。`--memory-swappiness`の設定では 0 から 100 までの設定を行って、その割合を調整します。[`--memory-swappiness`の詳細](#--memory-swappiness-details) を参照してください。                                                                                                                                                                       |
| `--memory-reservation` | `--memory`に比べてソフトリミットとして小さな値を設定します。Docker がホストマシン上のコンフリクトやメモリ不足を検出したときに採用されます。この`--memory-reservation`を指定する際には、これが優先的に採用されるように `--memory` よりも小さな値を設定します。これはソフトリミットであり、この設定値を越えない保証はないからです。                                                                                                                           |
| `--kernel-memory`      | コンテナーに割り当てるカーネルメモリの最大使用量。指定できる最小値は`4m`です。カーネルメモリはスワップされるものではないため、カーネルメモリ不足となったコンテナーは、ホストマシンのリソースに影響を及ぼすことになります。これはホストマシンにとっても、また他のコンテナーにとっても副作用を引き起こします。[`--kernel-memory`の詳細](#--kernel-memory-details)を参照してください。                                                                         |
| `--oom-kill-disable`   | out-of-memory (OOM) エラーが発生すると、デフォルトでカーネルはコンテナー内のプロセスを停止させます。この動作を変更するには`--oom-kill-disable`オプションを指定します。これによってコンテナー上での OOM キラープロセスが無効になりますが、それは`-m/--memory`オプションを同時に指定しているコンテナーに限定されます。`-m`フラグを設定していなかった場合は、ホストがメモリ不足となり、ホストシステムの他のプロセスを停止させてメモリ確保を行うことになります。|
@z

@x
For more information about cgroups and memory in general, see the documentation
for [Memory Resource Controller](https://www.kernel.org/doc/Documentation/cgroup-v1/memory.txt).
@y
cgroups とメモリに関する全般的な情報は、[メモリリソースコントローラー](https://www.kernel.org/doc/Documentation/cgroup-v1/memory.txt) に関するドキュメントを参照してください。
@z

@x
### `--memory-swap` details
@y
{: #--memory-swap-details }
### `--memory-swap`の詳細
@z

@x
`--memory-swap` is a modifier flag that only has meaning if `--memory` is also
set. Using swap allows the container to write excess memory requirements to disk
when the container has exhausted all the RAM that is available to it. There is a
performance penalty for applications that swap memory to disk often.
@y
`--memory-swap`は、`--memory`が同時に設定されている場合のみ、その意味をなす修正フラグです。
スワップを利用すれば、コンテナーにおいて要求されたメモリが超過して、利用可能な RAM を使い果たしたとしても、それをディスクに書き出すことになります。
ただしメモリのスワップが頻発すると、アプリケーションの性能は劣化します。
@z

@x
Its setting can have complicated effects:
@y
これを設定したときの結果は複雑です。
@z

@x
- If `--memory-swap` is set to a positive integer, then both `--memory` and
  `--memory-swap` must be set. `--memory-swap` represents the total amount of
  memory and swap that can be used, and `--memory` controls the amount used by
  non-swap memory. So if `--memory="300m"` and `--memory-swap="1g"`, the
  container can use 300m of memory and 700m (`1g - 300m`) swap.
@y
- `--memory-swap`に正の整数が指定する場合は、`--memory`と`--memory-swap`を同時に指定する必要があります。
  `--memory-swap`は、利用可能なメモリとスワップの総量を表わします。
  また`--memory`はスワップを含めず、利用されるメモリの総量を制御します。
  したがってたとえば`--memory="300m"`と`--memory-swap="1g"`を指定した場合、そのコンテナーが利用できるのは 300m のメモリと 700m (`1g - 300m`) のスワップとなります。
@z

@x
- If `--memory-swap` is set to `0`, the setting is ignored, and the value is
  treated as unset.
@y
- `--memory-swap`を`0`にすると、この設定は無視され、設定されていないものとして扱われます。
@z

@x
- If `--memory-swap` is set to the same value as `--memory`, and `--memory` is
  set to a positive integer, **the container does not have access to swap**.
  See
  [Prevent a container from using swap](#prevent-a-container-from-using-swap).
@y
- `--memory-swap`に設定された値が`--memory`と同じ値である場合で、かつ`--memory`に正の整数が設定されている場合、**コンテナーはスワップへアクセスしません**。
  [コンテナーにおけるスワップ利用の防止](#prevent-a-container-from-using-swap) を参照してください。
@z

@x
- If `--memory-swap` is unset, and `--memory` is set, the container can use
  as much swap as the `--memory` setting, if the host container has swap
  memory configured. For instance, if `--memory="300m"` and `--memory-swap` is
  not set, the container can use 600m in total of memory and swap.
@y
- `--memory-swap`が設定されていない場合で、かつ`--memory`が設定されている場合、コンテナーは`--memory`に設定されている値をスワップ容量とします。
  当然このときは、ホストコンテナーがスワップメモリを持つものとして設定されている場合に限ります。
  たとえば`--memory="300m"`と設定され、`--memory-swap`が設定されていない場合、そのコンテナーはメモリとスワップの総量として 600m を利用することになります。
@z

@x
- If `--memory-swap` is explicitly set to `-1`, the container is allowed to use
  unlimited swap, up to the amount available on the host system.
@y
- `--memory-swap`を明示的に`-1`とした場合、コンテナーが利用できるスワップは、ホストシステムでの利用可能なスワップ範囲内で無制限となります。
@z

@x
- Inside the container, tools like `free` report the host's available swap, not what's available inside the container. Don't rely on the output of `free` or similar tools to determine whether swap is present.
@y
- コンテナーの内部から`free`などのツールを実行すると、ホスト上で利用可能なスワップ容量が表示されます。
  コンテナー内において利用可能な量を示すわけではありません。
  `free`や同等のツールを利用する際には、出力結果からスワップ容量を判断できないことに注意してください。
@z

@x
#### Prevent a container from using swap
@y
{: #prevent-a-container-from-using-swap }
#### コンテナーにおけるスワップ利用の防止
@z

@x
If `--memory` and `--memory-swap` are set to the same value, this prevents
containers from using any swap. This is because `--memory-swap` is the amount of
combined memory and swap that can be used, while `--memory` is only the amount
of physical memory that can be used.
@y
`--memory`と`--memory-swap`に同じ値を設定した場合、コンテナーがスワップを利用しないようになります。
`--memory-swap`は、利用可能なメモリとスワップを合わせた総量を表わすものであり、`--memory`は利用可能なメモリ使用量を意味するからです。
@z

@x
### `--memory-swappiness` details
@y
{: #--memory-swappiness-details }
### `--memory-swappiness`の詳細
@z

@x
- A value of 0 turns off anonymous page swapping.
- A value of 100 sets all anonymous pages as swappable.
- By default, if you do not set `--memory-swappiness`, the value is
  inherited from the host machine.
@y
- 0 を指定すると、匿名ページのスワップを無効にします。
- 100 を指定すると、匿名ページのすべてをスワップ可能とします。
- `--memory-swappiness` を設定しなかった場合、デフォルトでは、ホストマシンからその値を受け継ぎます。
@z

@x
### `--kernel-memory` details
@y
{: #--kernel-memory-details }
### `--kernel-memory`の詳細
@z

@x
Kernel memory limits are expressed in terms of the overall memory allocated to
a container. Consider the following scenarios:
@y
カーネルメモリに対する制約は、コンテナーに割り当てられるメモリ全体に関わります。
以下の状況が考えられます。
@z

@x
- **Unlimited memory, unlimited kernel memory**: This is the default
  behavior.
- **Unlimited memory, limited kernel memory**: This is appropriate when the
  amount of memory needed by all cgroups is greater than the amount of
  memory that actually exists on the host machine. You can configure the
  kernel memory to never go over what is available on the host machine,
  and containers which need more memory need to wait for it.
- **Limited memory, unlimited kernel memory**: The overall memory is
  limited, but the kernel memory is not.
- **Limited memory, limited kernel memory**: Limiting both user and kernel
  memory can be useful for debugging memory-related problems. If a container
  is using an unexpected amount of either type of memory, it runs out
  of memory without affecting other containers or the host machine. Within
  this setting, if the kernel memory limit is lower than the user memory
  limit, running out of kernel memory causes the container to experience
  an OOM error. If the kernel memory limit is higher than the user memory
  limit, the kernel limit does not cause the container to experience an OOM.
@y
- **メモリ制限なし、カーネルメモリ制限なし**: 
  これがデフォルトの動作です。
- **メモリ制限なし、カーネルメモリ制限あり**:
  この設定が適当な状況とは、ホストマシン上の実際のメモリ容量よりも、cgroup が必要とするメモリの総量が上回っている場合です。
  カーネルメモリは、ホストマシン上での利用可能量を越えないように、またそれ以上に必要としているコンテナーは、利用可能になるまで待つような設定とすることができます。
- **メモリ制限あり、カーネルメモリ制限なし**:
  メモリ全体が制限されますが、カーネルメモリは制限されません。
- **メモリ制限あり、カーネルメモリ制限あり**:
  ユーザーメモリとカーネルメモリをともに制限するのは、メモリに関する障害をデバッグする際に利用できます。
  コンテナーがこのいずれかのメモリを予想以上に消費している場合、メモリ不足となっても、他のコンテナーやホストには影響を及ぼしません。
  この設定において、カーネルメモリの制限値がユーザーメモリの制限値より小さい場合は、メモリ不足によってコンテナー内に OOM エラーが発生することになります。
  カーネルメモリの制限値の方が大きい場合は、コンテナー内に OOM エラーが発生することはありません。
@z

@x
When you turn on any kernel memory limits, the host machine tracks "high water
mark" statistics on a per-process basis, so you can track which processes (in
this case, containers) are using excess memory. This can be seen per process
by viewing `/proc/<PID>/status` on the host machine.
@y
カーネルメモリに制限を設けた場合、ホストマシンはプロセスごとに「最高水位標」（high water mark）の統計をとります。
そこからどのプロセスが（今の場合、どのコンテナーが）過剰にメモリを消費しているかを知ることができます。
具体的にはホストマシン内の`/proc/<PID>/status`を見ることで、プロセスごとの状況がわかります。
@z

@x
## CPU
@y
## CPU
@z

@x
By default, each container's access to the host machine's CPU cycles is unlimited.
You can set various constraints to limit a given container's access to the host
machine's CPU cycles. Most users use and configure the
[default CFS scheduler](#configure-the-default-cfs-scheduler). You can also
configure the [realtime scheduler](#configure-the-realtime-scheduler).
@y
各コンテナーがホストマシンの CPU サイクルにアクセスすることは、デフォルトでは制限がありません。
ホストマシンの CPU サイクルにアクセスするコンテナーに制限を加える方法はいろいろとあります。
よく利用されるのは [デフォルト CFS スケジューラー](#configure-the-default-cfs-scheduler) です。
[リアルタイムスケジューラー](#configure-the-realtime-scheduler) を利用することもできます。
@z

@x
### Configure the default CFS scheduler
@y
{: #configure-the-default-cfs-scheduler }
### デフォルト CFS スケジューラーの設定
@z

@x
The CFS is the Linux kernel CPU scheduler for normal Linux processes. Several
runtime flags allow you to configure the amount of access to CPU resources your
container has. When you use these settings, Docker modifies the settings for
the container's cgroup on the host machine.
@y
CFS は Linux 上の普通のプロセスに対して用いられる Linux カーネル CPU スケジューラーです。
コンテナーが利用する CPU リソースのアクセス量を設定するために、いくつかの実行時フラグが用意されています。
この設定を行うと、Docker はホストマシン上にあるコンテナーの cgroup 設定を修正します。
@z

@x
| Option                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|:-----------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--cpus=<value>`       | Specify how much of the available CPU resources a container can use. For instance, if the host machine has two CPUs and you set `--cpus="1.5"`, the container is guaranteed at most one and a half of the CPUs. This is the equivalent of setting `--cpu-period="100000"` and `--cpu-quota="150000"`.                                                                                                                                                                                                                                                                                                |
| `--cpu-period=<value>` | Specify the CPU CFS scheduler period, which is used alongside  `--cpu-quota`. Defaults to 100000 microseconds (100 milliseconds). Most users do not change this from the default. For most use-cases, `--cpus` is a more convenient alternative.                                                                                                                                                                                                                                                                                                                                                     |
| `--cpu-quota=<value>`  | Impose a CPU CFS quota on the container. The number of microseconds per `--cpu-period` that the container is limited to before throttled. As such acting as the effective ceiling. For most use-cases, `--cpus` is a more convenient alternative.                                                                                                                                                                                                                                                                                                                                                    |
| `--cpuset-cpus`        | Limit the specific CPUs or cores a container can use. A comma-separated list or hyphen-separated range of CPUs a container can use, if you have more than one CPU. The first CPU is numbered 0. A valid value might be `0-3` (to use the first, second, third, and fourth CPU) or `1,3` (to use the second and fourth CPU).                                                                                                                                                                                                                                                                          |
| `--cpu-shares`         | Set this flag to a value greater or less than the default of 1024 to increase or reduce the container's weight, and give it access to a greater or lesser proportion of the host machine's CPU cycles. This is only enforced when CPU cycles are constrained. When plenty of CPU cycles are available, all containers use as much CPU as they need. In that way, this is a soft limit. `--cpu-shares` does not prevent containers from being scheduled in swarm mode. It prioritizes container CPU resources for the available CPU cycles. It does not guarantee or reserve any specific CPU access. |
@y
| オプション             | 内容説明                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|:-----------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--cpus=<値>`          | コンテナーが CPU リソースをどれだけ利用可能かを指定します。たとえばホストマシンに CPU が 2 つあり`--cpus="1.5"`という設定を行った場合、コンテナーに対して CPU 最大 1.5 個分が保証されます。これは`--cpu-period="100000"`と`--cpu-quota="150000"`を設定することと同じです。                                                                                                                                                                                                                                                                                                                                                                                                    |
| `--cpu-period=<値>`    | CFS スケジューラー間隔を指定します。これは`--cpu-quota`とともに指定されます。デフォルトは 100000 マイクロ秒（100 ミリ秒）です。たいていの場合、このデフォルト値を変更することはしません。たいていの場合、より便利なのは`--cpus`です。                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `--cpu-quota=<値>`     | コンテナーに対して CFS クォータを設定します。`--cpu-period`ごとのマイクロ秒単位の時間であり、スロットリングされる前にこの時間に制限されます。有効しきい値として動作します。たいていの場合、より便利なのは`--cpus`です。                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `--cpuset-cpus`        | コンテナーが利用する CPU またはコアを特定します。CPU が複数あれば、カンマ区切りあるいはハイフン区切りのリストで CPU の利用範囲を指定します。1 つめの CPU を 0 とします。指定例としては以下です。`0-3`（1 つめから 4 つめまでの CPU を利用する場合）、`1,3`（2 つめと 4 つめの CPU を利用する場合）                                                                                                                                                                                                                                                                                                                                                                            |
| `--cpu-shares`         | コンテナーへの配分を定めるもので、デフォルト値は 1024 です。本フラグを利用する場合は、デフォルト値より大きければ配分を増やし、小さければ減らします。そしてホストマシンの CPU サイクルへのアクセスを高比率、低比率で行います。これは CPU サイクルが制限されている場合に限って動作します。CPU サイクルが豊富に利用可能であるとき、すべてのコンテナーは必要な分だけ CPU を利用します。こういうことから、これはソフトリミットと言えます。`--cpu-shares`は Swarm モード内においてコンテナーがスケジュールされることを妨げません。コンテナーの CPU リソースは、これによって利用可能な CPU サイクルが優先的に割り当てられます。ただし CPU アクセスを保証したり予約するものではありません。|
@z

@x
If you have 1 CPU, each of the following commands guarantees the container at
most 50% of the CPU every second.
@y
CPU が 1 つである場合に、以下のコマンドはコンテナーに対し、毎秒 CPU の最大 50 % を保証します。
@z

@x
```console
$ docker run -it --cpus=".5" ubuntu /bin/bash
```
@y
```console
$ docker run -it --cpus=".5" ubuntu /bin/bash
```
@z

@x
Which is the equivalent to manually specifying `--cpu-period` and `--cpu-quota`;
@y
手動で`--cpu-period`と`--cpu-quota`を指定しても同じです。
@z

@x
```console
$ docker run -it --cpu-period=100000 --cpu-quota=50000 ubuntu /bin/bash
```
@y
```console
$ docker run -it --cpu-period=100000 --cpu-quota=50000 ubuntu /bin/bash
```
@z

@x
### Configure the realtime scheduler
@y
{: #configure-the-realtime-scheduler }
### リアルタイムスケジューラーの設定
@z

@x
You can configure your container to use the realtime scheduler, for tasks which
cannot use the CFS scheduler. You need to
[make sure the host machine's kernel is configured correctly](#configure-the-host-machines-kernel)
before you can [configure the Docker daemon](#configure-the-docker-daemon) or
[configure individual containers](#configure-individual-containers).
@y
コンテナーにおいてリアルタイムスケジューラーを利用するように設定することができます。
CFS スケジューラーが利用できないタスクに対して用います。
初めに [ホストマシンのカーネルが正しく設定されていること](#configure-the-host-machines-kernel) を確認した上で、[Docker デーモンの設定](#configure-the-docker-daemon) を行うか、[各コンテナーの個別設定](#configure-individual-containers) を行ってください。
@z

@x
> **Warning**
>
> CPU scheduling and prioritization are advanced kernel-level features. Most
> users do not need to change these values from their defaults. Setting these
> values incorrectly can cause your host system to become unstable or unusable.
{:.warning}
@y
> **警告**
>
> CPU スケジュールや優先処理は、高度なカーネルレベルの機能です。
> たいていの場合、その機能設定をデフォルトから変更する必要はありません。
> 設定を誤ると、ホストシステムが不安定または利用不能になることがあります。
{:.warning}
@z

@x
#### Configure the host machine's kernel
@y
{: #configure-the-host-machines-kernel }
#### ホストマシンカーネルの設定
@z

@x
Verify that `CONFIG_RT_GROUP_SCHED` is enabled in the Linux kernel by running
`zcat /proc/config.gz | grep CONFIG_RT_GROUP_SCHED` or by checking for the
existence of the file `/sys/fs/cgroup/cpu.rt_runtime_us`. For guidance on
configuring the kernel realtime scheduler, consult the documentation for your
operating system.
@y
Linux カーネルにおいて`CONFIG_RT_GROUP_SCHED`が有効になっていることを確認します。
これには`zcat /proc/config.gz | grep CONFIG_RT_GROUP_SCHED`を実行するか、あるいはファイル`/sys/fs/cgroup/cpu.rt_runtime_us`が存在するかどうかで確認します。
カーネルのリアルタイムスケジューラーの設定方法については、各オペレーティングシステムのドキュメントを参照してください。
@z

@x
#### Configure the Docker daemon
@y
{: #configure-the-docker-daemon }
#### Docker デーモンの設定
@z

@x
To run containers using the realtime scheduler, run the Docker daemon with
the `--cpu-rt-runtime` flag set to the maximum number of microseconds reserved
for realtime tasks per runtime period. For instance, with the default period of
1000000 microseconds (1 second), setting `--cpu-rt-runtime=950000` ensures that
containers using the realtime scheduler can run for 950000 microseconds for every
1000000-microsecond period, leaving at least 50000 microseconds available for
non-realtime tasks. To make this configuration permanent on systems which use
`systemd`, see [Control and configure Docker with systemd](../daemon/systemd.md).
@y
リアルタイムスケジューラーを利用するコンテナーを起動するには、Docker デーモンに`--cpu-rt-runtime`フラグをつけて起動します。
設定値には、リアルタイムタスクに対して、実行時間ごとに割り当てられる最大の時間をマイクロ秒単位で指定します。
たとえばデフォルトの実行時間である 1000000 マイクロ秒に対して、`--cpu-rt-runtime=950000`と設定すると、このリアルタイムスケジューラーを利用するコンテナーは、各 1000000 マイクロ秒ごとに 950000 マイクロ秒ずつ稼動するようになります。
残りの 50000 マイクロ秒は、リアルタイムスレッド以外のタスクに利用されます。
`systemd`を利用するシステム上で、これを恒常的な設定とするには [systemd を用いた Docker の管理と設定](../daemon/systemd.md) を参照してください。
@z

@x
#### Configure individual containers
@y
{: #configure-individual-containers }
#### 個々のコンテナーに対する設定
@z

@x
You can pass several flags to control a container's CPU priority when you
start the container using `docker run`. Consult your operating system's
documentation or the `ulimit` command for information on appropriate values.
@y
コンテナーの CPU 優先順位づけ（priority）を制御するフラグがいくつかあります。
`docker run`を実行する際に、これを指定します。
適切な値設定に関しては、オペレーティングシステムのドキュメントや`ulimit`コマンドを参照してください。
@z

@x
| Option                     | Description                                                                                                                                                                               |
|:---------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--cap-add=sys_nice`       | Grants the container the `CAP_SYS_NICE` capability, which allows the container to raise process `nice` values, set real-time scheduling policies, set CPU affinity, and other operations. |
| `--cpu-rt-runtime=<value>` | The maximum number of microseconds the container can run at realtime priority within the Docker daemon's realtime scheduler period. You also need the `--cap-add=sys_nice` flag.          |
| `--ulimit rtprio=<value>`  | The maximum realtime priority allowed for the container. You also need the `--cap-add=sys_nice` flag.                                                                                     |
@y
| オプション                 | 内容説明                                                                                                                                                                                                                    |
|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--cap-add=sys_nice`       | コンテナーが`CAP_SYS_NICE`ケーパビリティーを利用できるようにします。これによってコンテナーにおけるプロセスの`nice`値の加算、リアルタイムスケジューラーポリシーの設定、CPU アフィニティの設定、その他が行えるようになります。|
| `--cpu-rt-runtime=<値>`    | Docker デーモンにおいて、リアルタイムスケジューラー実行時間内のリアルタイム優先順位づけによる最大実行時間をマイクロ秒で指定します。同時に`--cap-add=sys_nice`フラグの指定も必要です。                                       |
| `--ulimit rtprio=<値>`     | コンテナーに対して許容するリアルタイム優先順位づけの最大数。同時に`--cap-add=sys_nice`フラグの指定も必要です。                                                                                                              |
@z

@x
The following example command sets each of these three flags on a `debian:jessie`
container.
@y
以下に示すコマンドは、`debian:jessie`コンテナーに対して 3 つのフラグを設定する例です。
@z

@x
```console
$ docker run -it \
    --cpu-rt-runtime=950000 \
    --ulimit rtprio=99 \
    --cap-add=sys_nice \
    debian:jessie
```
@y
```console
$ docker run -it \
    --cpu-rt-runtime=950000 \
    --ulimit rtprio=99 \
    --cap-add=sys_nice \
    debian:jessie
```
@z

@x
If the kernel or Docker daemon is not configured correctly, an error occurs.
@y
カーネルまたは Docker デーモンが正しく設定できていない場合には、エラーが発生します。
@z

@x
## GPU
@y
## GPU
@z

@x
### Access an NVIDIA GPU
@y
{: #access-an-nvidia-gpu }
### NVIDIA GPU へのアクセス
@z

@x
#### Prerequisites
@y
{: #prerequisites }
#### 前提条件
@z

@x
Visit the official [NVIDIA drivers page](https://www.nvidia.com/Download/index.aspx)
to download and install the proper drivers. Reboot your system once you have
done so.
@y
[NVIDIA ドライバーページ](https://www.nvidia.com/Download/index.aspx) にアクセスして、適切なドライバーをダウンロード、インストールしてください。
これを行ったらシステムを再起動してください。
@z

@x
Verify that your GPU is running and accessible.
@y
GPU が起動中でありアクセス可能であることを確認してください。
@z

@x
#### Install nvidia-container-runtime
@y
{: #install-nvidia-container-runtime }
#### nvidia-container-runtime のインストール
@z

@x
Follow the instructions at (https://nvidia.github.io/nvidia-container-runtime/)
and then run this command:
@y
(https://nvidia.github.io/nvidia-container-runtime/) にある手順に従い、次に以下のコマンドを実行してください。
@z

@x
```console
$ apt-get install nvidia-container-runtime
```
@y
```console
$ apt-get install nvidia-container-runtime
```
@z

@x
Ensure the `nvidia-container-runtime-hook` is accessible from `$PATH`.
@y
`$PATH`上から`nvidia-container-runtime-hook`がアクセスできることを確認します。
@z

@x
```console
$ which nvidia-container-runtime-hook
```
@y
```console
$ which nvidia-container-runtime-hook
```
@z

@x
Restart the Docker daemon.
@y
Docker デーモンを再起動します。
@z

@x
#### Expose GPUs for use
@y
{: #expose-gpus-for-use }
#### GPU の有効化
@z

@x
Include the `--gpus` flag when you start a container to access GPU resources.
Specify how many GPUs to use. For example:
@y
コンテナーの起動時に`--gpus`フラグをつけると、GPU リソースにアクセスすることができます。
このとき GPU をどれだけ利用するかを指定します。
たとえば以下のとおりです。
@z

@x
```console
$ docker run -it --rm --gpus all ubuntu nvidia-smi
```
@y
```console
$ docker run -it --rm --gpus all ubuntu nvidia-smi
```
@z

@x
Exposes all available GPUs and returns a result akin to the following:
@y
利用可能な GPU をすべて有効にした場合、以下のような出力結果となります。
@z

@x
```bash
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 384.130            	Driver Version: 384.130               	|
|-------------------------------+----------------------+----------------------+
| GPU  Name 	   Persistence-M| Bus-Id    	Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GRID K520       	Off  | 00000000:00:03.0 Off |                  N/A |
| N/A   36C	P0    39W / 125W |  	0MiB /  4036MiB |      0%  	Default |
+-------------------------------+----------------------+----------------------+
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU   	PID   Type   Process name                         	Usage  	|
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```
@y
```bash
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 384.130            	Driver Version: 384.130               	|
|-------------------------------+----------------------+----------------------+
| GPU  Name 	   Persistence-M| Bus-Id    	Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GRID K520       	Off  | 00000000:00:03.0 Off |                  N/A |
| N/A   36C	P0    39W / 125W |  	0MiB /  4036MiB |      0%  	Default |
+-------------------------------+----------------------+----------------------+
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU   	PID   Type   Process name                         	Usage  	|
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```
@z

@x
Use the `device` option to specify GPUs. For example:
@y
`device`オプションを使って GPU を指定します。
たとえば以下です。
@z

@x
```console
$ docker run -it --rm --gpus device=GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a ubuntu nvidia-smi
```
@y
```console
$ docker run -it --rm --gpus device=GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a ubuntu nvidia-smi
```
@z

@x
Exposes that specific GPU.
@y
これにより指定した GPU が有効になります。
@z

@x
```console
$ docker run -it --rm --gpus '"device=0,2"' ubuntu nvidia-smi
```
@y
```console
$ docker run -it --rm --gpus '"device=0,2"' ubuntu nvidia-smi
```
@z

@x
Exposes the first and third GPUs.
@y
これは 1 つめと 3 つめの GPU が有効になります。
@z

@x
> **Note**
>
> NVIDIA GPUs can only be accessed by systems running a single engine.
@y
> **メモ**
>
> NVIDIA GPU は、単一の Engine が起動するシステムからのみアクセスすることができます。
@z

@x
#### Set NVIDIA capabilities
@y
{: #set-nvidia-capabilities }
#### NVIDIA ケーパビリティーの設定
@z

@x
You can set capabilities manually. For example, on Ubuntu you can run the
following:
@y
ケーパビリティーは手動で設定します。
たとえば Ubuntu では以下のコマンドを実行します。
@z

@x
```console
$ docker run --gpus 'all,capabilities=utility' --rm ubuntu nvidia-smi
```
@y
```console
$ docker run --gpus 'all,capabilities=utility' --rm ubuntu nvidia-smi
```
@z

@x
This enables the `utility` driver capability which adds the `nvidia-smi` tool to
the container.
@y
上を行うと`utility`ドライバーケーパビリティーによって`nvidia-smi`ツールが追加され、コンテナーにより利用可能となります。
@z

@x
Capabilities as well as other configurations can be set in images via
environment variables. More information on valid variables can be found at the
[nvidia-container-runtime](https://github.com/NVIDIA/nvidia-container-runtime)
GitHub page. These variables can be set in a Dockerfile.
@y
ケーパビリティーも他の設定も、環境変数を利用してイメージに設定することができます。
利用可能な環境変数の詳細は [nvidia-container-runtime](https://github.com/NVIDIA/nvidia-container-runtime) GitHub ページを参照してください。
この環境変数は Dockerfile 内に指定することもできます。
@z

@x
You can also utitize CUDA images which sets these variables automatically. See
the [CUDA images](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA) GitHub page
for more information.
@y
その環境変数を自動的に設定する CUDA イメージを利用することもできます。
詳細は [CUDA イメージ](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA) GitHub ページを参照してください。
@z
