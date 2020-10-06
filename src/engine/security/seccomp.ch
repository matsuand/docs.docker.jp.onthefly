%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Enabling seccomp in Docker
keywords: seccomp, security, docker, documentation
title: Seccomp security profiles for Docker
---
@y
---
description: Enabling seccomp in Docker
keywords: seccomp, security, docker, documentation
title: Docker 向け Seccomp セキュリティプロファイル
---
@z

@x
Secure computing mode (`seccomp`) is a Linux kernel feature. You can use it to
restrict the actions available within the container. The `seccomp()` system
call operates on the seccomp state of the calling process. You can use this
feature to restrict your application's access.
@y
{% comment %}
Secure computing mode (`seccomp`) is a Linux kernel feature. You can use it to
restrict the actions available within the container. The `seccomp()` system
call operates on the seccomp state of the calling process. You can use this
feature to restrict your application's access.
{% endcomment %}
セキュリティコンピューティングモード（secure computing mode; `seccomp`）は Linux カーネルの機能です。
これを使うと、コンテナー内で利用できる処理を限定することができます。
システムコール `seccomp()` は呼び出し側プロセスの seccomp 状態を操作します。
この機能は、アプリケーションのアクセス処理を制限するものとして利用することができます。
@z

@x
This feature is available only if Docker has been built with `seccomp` and the
kernel is configured with `CONFIG_SECCOMP` enabled. To check if your kernel
supports `seccomp`:
@y
{% comment %}
This feature is available only if Docker has been built with `seccomp` and the
kernel is configured with `CONFIG_SECCOMP` enabled. To check if your kernel
supports `seccomp`:
{% endcomment %}
この機能を利用するためには、Docker が `seccomp` を使ってビルドされていること、そしてカーネルが `CONFIG_SECCOMP` を有効にしていることが必要です。
カーネルが `seccomp` をサポートしているかどうかは、以下のようにして確認します。
@z

@x
```bash
$ grep CONFIG_SECCOMP= /boot/config-$(uname -r)
CONFIG_SECCOMP=y
```
@y
```bash
$ grep CONFIG_SECCOMP= /boot/config-$(uname -r)
CONFIG_SECCOMP=y
```
@z

@x
> **Note**: `seccomp` profiles require seccomp 2.2.1 which is not available on
> Ubuntu 14.04, Debian Wheezy, or Debian Jessie. To use `seccomp` on these
> distributions, you must download the [latest static Linux binaries](../install/binaries.md)
> (rather than packages).
@y
{% comment %}
> **Note**: `seccomp` profiles require seccomp 2.2.1 which is not available on
> Ubuntu 14.04, Debian Wheezy, or Debian Jessie. To use `seccomp` on these
> distributions, you must download the [latest static Linux binaries](../install/binaries.md)
> (rather than packages).
{% endcomment %}
> **メモ**: `seccomp` プロファイルは seccomp 2.2.1 を必要としますが、これは Ubuntu 14.04、Debian Wheezy、Debian Jessie では利用できません。
> そのディストリビューションにおいて `seccomp` を利用する場合は、（パッケージをインストールするのではなく）[最新の Linux 実行モジュール](../install/binaries.md) をダウンロードして利用する必要があります。
@z

@x
## Pass a profile for a container
@y
{% comment %}
## Pass a profile for a container
{% endcomment %}
{: #passva-profile-for-a-container }
## コンテナーへのプロファイルの受け渡し
@z

@x
The default `seccomp` profile provides a sane default for running containers with
seccomp and disables around 44 system calls out of 300+. It is moderately
protective while providing wide application compatibility. The default Docker
profile can be found
[here](https://github.com/moby/moby/blob/master/profiles/seccomp/default.json).
@y
{% comment %}
The default `seccomp` profile provides a sane default for running containers with
seccomp and disables around 44 system calls out of 300+. It is moderately
protective while providing wide application compatibility. The default Docker
profile can be found
[here](https://github.com/moby/moby/blob/master/profiles/seccomp/default.json).
{% endcomment %}
デフォルトの `seccomp` プロファイルは、seccomp を使ってコンテナーを実行するための、十分に考慮されたデフォルトを提供します。
そして 300 以上あるシステムコールのうち 44 個を無効とします。
これは幅広くアプリケーションとの互換性を提供しつつ、適度なセキュリティ保護を実現します。
デフォルトの Docker プロファイルは [こちら](https://github.com/moby/moby/blob/master/profiles/seccomp/default.json) にあります。
@z

@x
In effect, the profile is a whitelist which denies access to system calls by
default, then whitelists specific system calls. The profile works by defining a
`defaultAction` of `SCMP_ACT_ERRNO` and overriding that action only for specific
system calls. The effect of `SCMP_ACT_ERRNO` is to cause a `Permission Denied`
error. Next, the profile defines a specific list of system calls which are fully
allowed, because their `action` is overridden to be `SCMP_ACT_ALLOW`. Finally,
some specific rules are for individual system calls such as `personality`, and others, 
to allow variants of those system calls with specific arguments.
@y
{% comment %}
In effect, the profile is a whitelist which denies access to system calls by
default, then whitelists specific system calls. The profile works by defining a
`defaultAction` of `SCMP_ACT_ERRNO` and overriding that action only for specific
system calls. The effect of `SCMP_ACT_ERRNO` is to cause a `Permission Denied`
error. Next, the profile defines a specific list of system calls which are fully
allowed, because their `action` is overridden to be `SCMP_ACT_ALLOW`. Finally,
some specific rules are for individual system calls such as `personality`, and others, 
to allow variants of those system calls with specific arguments.
{% endcomment %}
実際にプロファイルはホワイトリスト方式をとるものであり、デフォルトではシステムコールのアクセスを拒否します。
そして特定のシステムコールを許可します。
プロファイルは `SCMP_ACT_ERRNO` の `defaultAction` を定義することで動作し、指定したシステムコールのみ、その動作をオーバーライドします。
`SCMP_ACT_ERRNO` の効果は `Permission Denied` エラーを発生させることです。
次にプロファイルにおいては、システムコールのうち、完全に動作を許容するものを列記します。
これによって各 `action` を `SCMP_ACT_ALLOW` としてオーバーライドするためです。
そして最後に、`personality` のような個別のシステムコールに対して、特定のルールを定めます。
そのシステムコールに特定の引数を加えるといったことを行うことができます。
@z

@x
`seccomp` is instrumental for running Docker containers with least privilege. It
is not recommended to change the default `seccomp` profile.
@y
{% comment %}
`seccomp` is instrumental for running Docker containers with least privilege. It
is not recommended to change the default `seccomp` profile.
{% endcomment %}
`seccomp` は Docker コンテナーを最小限の権限により実行します。
デフォルトの `seccomp` プロファイルを修正することは推奨されていません。
@z

@x
When you run a container, it uses the default profile unless you override it
with the `--security-opt` option. For example, the following explicitly
specifies a policy:
@y
{% comment %}
When you run a container, it uses the default profile unless you override it
with the `--security-opt` option. For example, the following explicitly
specifies a policy:
{% endcomment %}
コンテナーの起動時にはデフォルトのプロファイルが利用されます。
ただし `--security-opt` オプションを指定した場合は、それをオーバーライドすることができます。
たとえば以下の例は、ポリシーを明示的に指定するものです。
@z

@x
```bash
$ docker run --rm \
             -it \
             --security-opt seccomp=/path/to/seccomp/profile.json \
             hello-world
```
@y
```bash
$ docker run --rm \
             -it \
             --security-opt seccomp=/path/to/seccomp/profile.json \
             hello-world
```
@z

@x
### Significant syscalls blocked by the default profile
@y
{% comment %}
### Significant syscalls blocked by the default profile
{% endcomment %}
{: #significant-syscalls-blocked-by-the-default-profile }
### デフォルトプロファイルによりブロックされる重要なシステムコール
@z

@x
Docker's default seccomp profile is a whitelist which specifies the calls that
are allowed. The table below lists the significant (but not all) syscalls that
are effectively blocked because they are not on the whitelist. The table includes
the reason each syscall is blocked rather than white-listed.
@y
{% comment %}
Docker's default seccomp profile is a whitelist which specifies the calls that
are allowed. The table below lists the significant (but not all) syscalls that
are effectively blocked because they are not on the whitelist. The table includes
the reason each syscall is blocked rather than white-listed.
{% endcomment %}
Docker 向けの seccomp プロファイルはホワイトリスト方式をとります。
したがって許可したいシステムコールを指定する必要があります。
以下の表では、重要な（ただしすべてではない）システムコールの中で、ホワイトリストに指定されなかったことから拒否されてしまうものの一覧です。
表の中では、ホワイトリスト化されずにブロックされてしまう理由についても触れています。
@z

@x
| Syscall             | Description                                                                                                                           |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| `acct`              | Accounting syscall which could let containers disable their own resource limits or process accounting. Also gated by `CAP_SYS_PACCT`. |
| `add_key`           | Prevent containers from using the kernel keyring, which is not namespaced.                                   |
| `bpf`               | Deny loading potentially persistent bpf programs into kernel, already gated by `CAP_SYS_ADMIN`.              |
| `clock_adjtime`     | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.                                                   |
| `clock_settime`     | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.                                                   |
| `clone`             | Deny cloning new namespaces. Also gated by `CAP_SYS_ADMIN` for CLONE_* flags, except `CLONE_USERNS`.         |
| `create_module`     | Deny manipulation and functions on kernel modules. Obsolete. Also gated by `CAP_SYS_MODULE`.                 |
| `delete_module`     | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `finit_module`      | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `get_kernel_syms`   | Deny retrieval of exported kernel and module symbols. Obsolete.                                              |
| `get_mempolicy`     | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                      |
| `init_module`       | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `ioperm`            | Prevent containers from modifying kernel I/O privilege levels. Already gated by `CAP_SYS_RAWIO`.             |
| `iopl`              | Prevent containers from modifying kernel I/O privilege levels. Already gated by `CAP_SYS_RAWIO`.             |
| `kcmp`              | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `kexec_file_load`   | Sister syscall of `kexec_load` that does the same thing, slightly different arguments. Also gated by `CAP_SYS_BOOT`. |
| `kexec_load`        | Deny loading a new kernel for later execution. Also gated by `CAP_SYS_BOOT`.                                 |
| `keyctl`            | Prevent containers from using the kernel keyring, which is not namespaced.                                   |
| `lookup_dcookie`    | Tracing/profiling syscall, which could leak a lot of information on the host. Also gated by `CAP_SYS_ADMIN`. |
| `mbind`             | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                      |
| `mount`             | Deny mounting, already gated by `CAP_SYS_ADMIN`.                                                             |
| `move_pages`        | Syscall that modifies kernel memory and NUMA settings.                                                       |
| `name_to_handle_at` | Sister syscall to `open_by_handle_at`. Already gated by `CAP_DAC_READ_SEARCH`.                                      |
| `nfsservctl`        | Deny interaction with the kernel nfs daemon. Obsolete since Linux 3.1.                                       |
| `open_by_handle_at` | Cause of an old container breakout. Also gated by `CAP_DAC_READ_SEARCH`.                                     |
| `perf_event_open`   | Tracing/profiling syscall, which could leak a lot of information on the host.                                |
| `personality`       | Prevent container from enabling BSD emulation. Not inherently dangerous, but poorly tested, potential for a lot of kernel vulns. |
| `pivot_root`        | Deny `pivot_root`, should be privileged operation.                                                           |
| `process_vm_readv`  | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `process_vm_writev` | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `ptrace`            | Tracing/profiling syscall. Blocked in Linux kernel versions before 4.8 to avoid seccomp bypass. Tracing/profiling arbitrary processes is already blocked by dropping `CAP_SYS_PTRACE`, because it could leak a lot of information on the host. |
| `query_module`      | Deny manipulation and functions on kernel modules. Obsolete.                                                  |
| `quotactl`          | Quota syscall which could let containers disable their own resource limits or process accounting. Also gated by `CAP_SYS_ADMIN`. |
| `reboot`            | Don't let containers reboot the host. Also gated by `CAP_SYS_BOOT`.                                           |
| `request_key`       | Prevent containers from using the kernel keyring, which is not namespaced.                                    |
| `set_mempolicy`     | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                       |
| `setns`             | Deny associating a thread with a namespace. Also gated by `CAP_SYS_ADMIN`.                                    |
| `settimeofday`      | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.         |
| `stime`             | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.         |
| `swapon`            | Deny start/stop swapping to file/device. Also gated by `CAP_SYS_ADMIN`.                                       |
| `swapoff`           | Deny start/stop swapping to file/device. Also gated by `CAP_SYS_ADMIN`.                                       |
| `sysfs`             | Obsolete syscall.                                                                                             |
| `_sysctl`           | Obsolete, replaced by /proc/sys.                                                                              |
| `umount`            | Should be a privileged operation. Also gated by `CAP_SYS_ADMIN`.                                              |
| `umount2`           | Should be a privileged operation. Also gated by `CAP_SYS_ADMIN`.                                              |
| `unshare`           | Deny cloning new namespaces for processes. Also gated by `CAP_SYS_ADMIN`, with the exception of `unshare --user`. |
| `uselib`            | Older syscall related to shared libraries, unused for a long time.                                            |
| `userfaultfd`       | Userspace page fault handling, largely needed for process migration.                                          |
| `ustat`             | Obsolete syscall.                                                                                             |
| `vm86`              | In kernel x86 real mode virtual machine. Also gated by `CAP_SYS_ADMIN`.                                       |
| `vm86old`           | In kernel x86 real mode virtual machine. Also gated by `CAP_SYS_ADMIN`.                                       |
@y
{% comment %}
| Syscall             | Description                                                                                                                           |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| `acct`              | Accounting syscall which could let containers disable their own resource limits or process accounting. Also gated by `CAP_SYS_PACCT`. |
| `add_key`           | Prevent containers from using the kernel keyring, which is not namespaced.                                   |
| `bpf`               | Deny loading potentially persistent bpf programs into kernel, already gated by `CAP_SYS_ADMIN`.              |
| `clock_adjtime`     | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.                                                   |
| `clock_settime`     | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.                                                   |
| `clone`             | Deny cloning new namespaces. Also gated by `CAP_SYS_ADMIN` for CLONE_* flags, except `CLONE_USERNS`.         |
| `create_module`     | Deny manipulation and functions on kernel modules. Obsolete. Also gated by `CAP_SYS_MODULE`.                 |
| `delete_module`     | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `finit_module`      | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `get_kernel_syms`   | Deny retrieval of exported kernel and module symbols. Obsolete.                                              |
| `get_mempolicy`     | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                      |
| `init_module`       | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `ioperm`            | Prevent containers from modifying kernel I/O privilege levels. Already gated by `CAP_SYS_RAWIO`.             |
| `iopl`              | Prevent containers from modifying kernel I/O privilege levels. Already gated by `CAP_SYS_RAWIO`.             |
| `kcmp`              | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `kexec_file_load`   | Sister syscall of `kexec_load` that does the same thing, slightly different arguments. Also gated by `CAP_SYS_BOOT`. |
| `kexec_load`        | Deny loading a new kernel for later execution. Also gated by `CAP_SYS_BOOT`.                                 |
| `keyctl`            | Prevent containers from using the kernel keyring, which is not namespaced.                                   |
| `lookup_dcookie`    | Tracing/profiling syscall, which could leak a lot of information on the host. Also gated by `CAP_SYS_ADMIN`. |
| `mbind`             | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                      |
| `mount`             | Deny mounting, already gated by `CAP_SYS_ADMIN`.                                                             |
| `move_pages`        | Syscall that modifies kernel memory and NUMA settings.                                                       |
| `name_to_handle_at` | Sister syscall to `open_by_handle_at`. Already gated by `CAP_DAC_READ_SEARCH`.                                      |
| `nfsservctl`        | Deny interaction with the kernel nfs daemon. Obsolete since Linux 3.1.                                       |
| `open_by_handle_at` | Cause of an old container breakout. Also gated by `CAP_DAC_READ_SEARCH`.                                     |
| `perf_event_open`   | Tracing/profiling syscall, which could leak a lot of information on the host.                                |
| `personality`       | Prevent container from enabling BSD emulation. Not inherently dangerous, but poorly tested, potential for a lot of kernel vulns. |
| `pivot_root`        | Deny `pivot_root`, should be privileged operation.                                                           |
| `process_vm_readv`  | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `process_vm_writev` | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `ptrace`            | Tracing/profiling syscall. Blocked in Linux kernel versions before 4.8 to avoid seccomp bypass. Tracing/profiling arbitrary processes is already blocked by dropping `CAP_SYS_PTRACE`, because it could leak a lot of information on the host. |
| `query_module`      | Deny manipulation and functions on kernel modules. Obsolete.                                                  |
| `quotactl`          | Quota syscall which could let containers disable their own resource limits or process accounting. Also gated by `CAP_SYS_ADMIN`. |
| `reboot`            | Don't let containers reboot the host. Also gated by `CAP_SYS_BOOT`.                                           |
| `request_key`       | Prevent containers from using the kernel keyring, which is not namespaced.                                    |
| `set_mempolicy`     | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                       |
| `setns`             | Deny associating a thread with a namespace. Also gated by `CAP_SYS_ADMIN`.                                    |
| `settimeofday`      | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.         |
| `stime`             | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.         |
| `swapon`            | Deny start/stop swapping to file/device. Also gated by `CAP_SYS_ADMIN`.                                       |
| `swapoff`           | Deny start/stop swapping to file/device. Also gated by `CAP_SYS_ADMIN`.                                       |
| `sysfs`             | Obsolete syscall.                                                                                             |
| `_sysctl`           | Obsolete, replaced by /proc/sys.                                                                              |
| `umount`            | Should be a privileged operation. Also gated by `CAP_SYS_ADMIN`.                                              |
| `umount2`           | Should be a privileged operation. Also gated by `CAP_SYS_ADMIN`.                                              |
| `unshare`           | Deny cloning new namespaces for processes. Also gated by `CAP_SYS_ADMIN`, with the exception of `unshare --user`. |
| `uselib`            | Older syscall related to shared libraries, unused for a long time.                                            |
| `userfaultfd`       | Userspace page fault handling, largely needed for process migration.                                          |
| `ustat`             | Obsolete syscall.                                                                                             |
| `vm86`              | In kernel x86 real mode virtual machine. Also gated by `CAP_SYS_ADMIN`.                                       |
| `vm86old`           | In kernel x86 real mode virtual machine. Also gated by `CAP_SYS_ADMIN`.                                       |
{% endcomment %}
| システムコール      | 内容説明                                                                                                                              |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| `acct`              | Accounting syscall which could let containers disable their own resource limits or process accounting. Also gated by `CAP_SYS_PACCT`. |
| `add_key`           | Prevent containers from using the kernel keyring, which is not namespaced.                                   |
| `bpf`               | Deny loading potentially persistent bpf programs into kernel, already gated by `CAP_SYS_ADMIN`.              |
| `clock_adjtime`     | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.                                                   |
| `clock_settime`     | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.                                                   |
| `clone`             | Deny cloning new namespaces. Also gated by `CAP_SYS_ADMIN` for CLONE_* flags, except `CLONE_USERNS`.         |
| `create_module`     | Deny manipulation and functions on kernel modules. Obsolete. Also gated by `CAP_SYS_MODULE`.                 |
| `delete_module`     | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `finit_module`      | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `get_kernel_syms`   | Deny retrieval of exported kernel and module symbols. Obsolete.                                              |
| `get_mempolicy`     | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                      |
| `init_module`       | Deny manipulation and functions on kernel modules. Also gated by `CAP_SYS_MODULE`.                           |
| `ioperm`            | Prevent containers from modifying kernel I/O privilege levels. Already gated by `CAP_SYS_RAWIO`.             |
| `iopl`              | Prevent containers from modifying kernel I/O privilege levels. Already gated by `CAP_SYS_RAWIO`.             |
| `kcmp`              | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `kexec_file_load`   | Sister syscall of `kexec_load` that does the same thing, slightly different arguments. Also gated by `CAP_SYS_BOOT`. |
| `kexec_load`        | Deny loading a new kernel for later execution. Also gated by `CAP_SYS_BOOT`.                                 |
| `keyctl`            | Prevent containers from using the kernel keyring, which is not namespaced.                                   |
| `lookup_dcookie`    | Tracing/profiling syscall, which could leak a lot of information on the host. Also gated by `CAP_SYS_ADMIN`. |
| `mbind`             | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                      |
| `mount`             | Deny mounting, already gated by `CAP_SYS_ADMIN`.                                                             |
| `move_pages`        | Syscall that modifies kernel memory and NUMA settings.                                                       |
| `name_to_handle_at` | Sister syscall to `open_by_handle_at`. Already gated by `CAP_DAC_READ_SEARCH`.                                      |
| `nfsservctl`        | Deny interaction with the kernel nfs daemon. Obsolete since Linux 3.1.                                       |
| `open_by_handle_at` | Cause of an old container breakout. Also gated by `CAP_DAC_READ_SEARCH`.                                     |
| `perf_event_open`   | Tracing/profiling syscall, which could leak a lot of information on the host.                                |
| `personality`       | Prevent container from enabling BSD emulation. Not inherently dangerous, but poorly tested, potential for a lot of kernel vulns. |
| `pivot_root`        | Deny `pivot_root`, should be privileged operation.                                                           |
| `process_vm_readv`  | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `process_vm_writev` | Restrict process inspection capabilities, already blocked by dropping `CAP_SYS_PTRACE`.                          |
| `ptrace`            | Tracing/profiling syscall. Blocked in Linux kernel versions before 4.8 to avoid seccomp bypass. Tracing/profiling arbitrary processes is already blocked by dropping `CAP_SYS_PTRACE`, because it could leak a lot of information on the host. |
| `query_module`      | Deny manipulation and functions on kernel modules. Obsolete.                                                  |
| `quotactl`          | Quota syscall which could let containers disable their own resource limits or process accounting. Also gated by `CAP_SYS_ADMIN`. |
| `reboot`            | Don't let containers reboot the host. Also gated by `CAP_SYS_BOOT`.                                           |
| `request_key`       | Prevent containers from using the kernel keyring, which is not namespaced.                                    |
| `set_mempolicy`     | Syscall that modifies kernel memory and NUMA settings. Already gated by `CAP_SYS_NICE`.                       |
| `setns`             | Deny associating a thread with a namespace. Also gated by `CAP_SYS_ADMIN`.                                    |
| `settimeofday`      | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.         |
| `stime`             | Time/date is not namespaced. Also gated by `CAP_SYS_TIME`.         |
| `swapon`            | Deny start/stop swapping to file/device. Also gated by `CAP_SYS_ADMIN`.                                       |
| `swapoff`           | Deny start/stop swapping to file/device. Also gated by `CAP_SYS_ADMIN`.                                       |
| `sysfs`             | Obsolete syscall.                                                                                             |
| `_sysctl`           | Obsolete, replaced by /proc/sys.                                                                              |
| `umount`            | Should be a privileged operation. Also gated by `CAP_SYS_ADMIN`.                                              |
| `umount2`           | Should be a privileged operation. Also gated by `CAP_SYS_ADMIN`.                                              |
| `unshare`           | Deny cloning new namespaces for processes. Also gated by `CAP_SYS_ADMIN`, with the exception of `unshare --user`. |
| `uselib`            | Older syscall related to shared libraries, unused for a long time.                                            |
| `userfaultfd`       | Userspace page fault handling, largely needed for process migration.                                          |
| `ustat`             | Obsolete syscall.                                                                                             |
| `vm86`              | カーネルにおける x86 リアルモード仮想マシン。 `CAP_SYS_ADMIN` からも呼び出される。                            |
| `vm86old`           | カーネルにおける x86 リアルモード仮想マシン。 `CAP_SYS_ADMIN` からも呼び出される。                            |
@z

@x
## Run without the default seccomp profile
@y
{% comment %}
## Run without the default seccomp profile
{% endcomment %}
{: #run-without-the-default-seccomp-profile }
## デフォルトの seccomp プロファイルがない状態での実行
@z

@x
You can pass `unconfined` to run a container without the default seccomp
profile.
@y
{% comment %}
You can pass `unconfined` to run a container without the default seccomp
profile.
{% endcomment %}
コンテナーを実行する際に `unconfined` を指定すれば、デフォルトの seccomp プロファイルをなしにして実行することができます。
profile.
@z

@x
```
$ docker run --rm -it --security-opt seccomp=unconfined debian:jessie \
    unshare --map-root-user --user sh -c whoami
```
@y
```
$ docker run --rm -it --security-opt seccomp=unconfined debian:jessie \
    unshare --map-root-user --user sh -c whoami
```
@z
