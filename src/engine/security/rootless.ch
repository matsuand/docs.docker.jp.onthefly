%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Run the Docker daemon as a non-root user (Rootless mode)
keywords: security, namespaces, rootless
title: Run the Docker daemon as a non-root user (Rootless mode)
---
@y
---
description: root ユーザー以外によって Docker デーモンを起動します（rootless モード）。
keywords: security, namespaces, rootless
title: root ユーザー以外による Docker デーモン起動（rootless モード）
---
@z

@x
Rootless mode allows running the Docker daemon and containers as a non-root
user to mitigate potential vulnerabilities in the daemon and
the container runtime.
@y
{% comment %}
Rootless mode allows running the Docker daemon and containers as a non-root
user to mitigate potential vulnerabilities in the daemon and
the container runtime.
{% endcomment %}
rootless モードとは、root 以外のユーザーによって Docker デーモンやコンテナーを起動するものであり、デーモンや起動コンテナーにおける潜在的なぜい弱性を軽減します。
@z

@x
Rootless mode does not require root privileges even during the installation of
the Docker daemon, as long as the [prerequisites](#prerequisites) are met.
@y
{% comment %}
Rootless mode does not require root privileges even during the installation of
the Docker daemon, as long as the [prerequisites](#prerequisites) are met.
{% endcomment %}
rootless モードは root 権限を必要としません。
しかも [前提条件](#prerequisites) を満たしていれば、Docker デーモンのインストール時も必要としません。
@z

@x
Rootless mode was introduced in Docker Engine v19.03.
@y
{% comment %}
Rootless mode was introduced in Docker Engine v19.03.
{% endcomment %}
rootless モードは Docker Engine v19.03 から導入されました。
@z

@x
> **Note**
>
> Rootless mode is an experimental feature and has some limitations. For details,
> see [Known limitations](#known-limitations).
@y
{% comment %}
> **Note**
>
> Rootless mode is an experimental feature and has some limitations. For details,
> see [Known limitations](#known-limitations).
{% endcomment %}
> **メモ**
>
> rootless モードは試験的な機能であるため、制約がいくつかあります。
> 詳しくは [既知の問題](#known-limitations) を参照してください。
@z

@x
## How it works
@y
{% comment %}
## How it works
{% endcomment %}
{: #how-it-works }
## どのように動作するか
@z

@x
Rootless mode executes the Docker daemon and containers inside a user namespace.
This is very similar to [`userns-remap` mode](userns-remap.md), except that
with `userns-remap` mode, the daemon itself is running with root privileges,
whereas in rootless mode, both the daemon and the container are running without
root privileges.
@y
{% comment %}
Rootless mode executes the Docker daemon and containers inside a user namespace.
This is very similar to [`userns-remap` mode](userns-remap.md), except that
with `userns-remap` mode, the daemon itself is running with root privileges,
whereas in rootless mode, both the daemon and the container are running without
root privileges.
{% endcomment %}
rootless モードは、Docker デーモンやコンテナーをユーザー名前空間の内部で実行します。
これは [`userns-remap` モード](userns-remap.md) に非常によく似ています。
ただし `userns-remap` モードにおいては、デーモンだけは root 権限で起動します。
rootless モードの場合は、デーモンとコンテナーがそれぞれ root 権限なしに動作します。
@z

@x
Rootless mode does not use binaries with `SETUID` bits or file capabilities,
except `newuidmap` and `newgidmap`, which are needed to allow multiple
UIDs/GIDs to be used in the user namespace.
@y
{% comment %}
Rootless mode does not use binaries with `SETUID` bits or file capabilities,
except `newuidmap` and `newgidmap`, which are needed to allow multiple
UIDs/GIDs to be used in the user namespace.
{% endcomment %}
rootless モードは、実行モジュールの `SETUID` ビットやファイルケーパビリティーは利用しません。
ただし `newuidmap` と `newgidmap` は利用します。
これらはユーザー名前空間内において、複数の UID/GID を利用するために必要となるものです。
@z

@x
## Prerequisites
@y
{% comment %}
## Prerequisites
{% endcomment %}
{: #prerequisites }
## 前提条件
@z

@x
-  You must install `newuidmap` and `newgidmap` on the host. These commands
  are provided by the `uidmap` package on most distros.
@y
{% comment %}
-  You must install `newuidmap` and `newgidmap` on the host. These commands
  are provided by the `uidmap` package on most distros.
{% endcomment %}
-  ホスト上に `newuidmap` と `newgidmap` をインストールすることが必要です。
   このコマンドは、たいていのディストリビューションにおいて `uidmap` パッケージとして提供されています。
@z

@x
- `/etc/subuid` and `/etc/subgid` should contain at least 65,536 subordinate
  UIDs/GIDs for the user. In the following example, the user `testuser` has
  65,536 subordinate UIDs/GIDs (231072-296607).
@y
{% comment %}
- `/etc/subuid` and `/etc/subgid` should contain at least 65,536 subordinate
  UIDs/GIDs for the user. In the following example, the user `testuser` has
  65,536 subordinate UIDs/GIDs (231072-296607).
{% endcomment %}
- `/etc/subuid` と `/etc/subgid` では、ユーザーに対して最低でも 65,536 個のサブ UID/サブ GIDを許容しておくことが必要です。
  以下の例において `testuser` ユーザーには 65,536 個のサブ UID/サブ GID (231072-296607) が与えられています。
@z

@x
```console
$ id -u
1001
$ whoami
testuser
$ grep ^$(whoami): /etc/subuid
testuser:231072:65536
$ grep ^$(whoami): /etc/subgid
testuser:231072:65536
```
@y
```console
$ id -u
1001
$ whoami
testuser
$ grep ^$(whoami): /etc/subuid
testuser:231072:65536
$ grep ^$(whoami): /etc/subgid
testuser:231072:65536
```
@z

@x
### Distribution-specific hint
@y
{% comment %}
### Distribution-specific hint
{% endcomment %}
{: #distribution-specific-hint }
### ディストリビューション固有の情報
@z

@x
> Note: We recommend that you use the Ubuntu kernel.
@y
{% comment %}
> Note: We recommend that you use the Ubuntu kernel.
{% endcomment %}
> メモ: ここでは Ubuntu カーネルの利用をお勧めします。
@z

@x
#### Ubuntu
@y
#### Ubuntu
@z

@x
- No preparation is needed.
@y
{% comment %}
- No preparation is needed.
{% endcomment %}
- 事前準備するものは何もありません。
@z

@x
- `overlay2` storage driver  is enabled by default
  ([Ubuntu-specific kernel patch](https://kernel.ubuntu.com/git/ubuntu/ubuntu-bionic.git/commit/fs/overlayfs?id=3b7da90f28fe1ed4b79ef2d994c81efbc58f1144)).
@y
{% comment %}
- `overlay2` storage driver  is enabled by default
  ([Ubuntu-specific kernel patch](https://kernel.ubuntu.com/git/ubuntu/ubuntu-bionic.git/commit/fs/overlayfs?id=3b7da90f28fe1ed4b79ef2d994c81efbc58f1144)).
{% endcomment %}
- デフォルトで `overlay2` ストレージドライバーが有効になっています。
  ([Ubuntu 固有のカーネルパッチ](https://kernel.ubuntu.com/git/ubuntu/ubuntu-bionic.git/commit/fs/overlayfs?id=3b7da90f28fe1ed4b79ef2d994c81efbc58f1144))
@z

@x
- Known to work on Ubuntu 16.04, 18.04, and 20.04.
@y
{% comment %}
- Known to work on Ubuntu 16.04, 18.04, and 20.04.
{% endcomment %}
- Ubuntu 16.04、18.04、20.04 において動作します。
@z

@x
#### Debian GNU/Linux
@y
#### Debian GNU/Linux
@z

@x
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
{% comment %}
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`.
{% endcomment %}
- `/etc/sysctl.conf`（または `/etc/sysctl.d`）に `kernel.unprivileged_userns_clone=1` を追加して、`sudo sysctl --system` を実行してください。
@z

@x
- To use the `overlay2` storage driver (recommended), run
  `sudo modprobe overlay permit_mounts_in_userns=1`
   ([Debian-specific kernel patch, introduced in Debian 10](https://salsa.debian.org/kernel-team/linux/blob/283390e7feb21b47779b48e0c8eb0cc409d2c815/debian/patches/debian/overlayfs-permit-mounts-in-userns.patch)).
   Add the configuration to `/etc/modprobe.d` for persistence.
@y
{% comment %}
- To use the `overlay2` storage driver (recommended), run
  `sudo modprobe overlay permit_mounts_in_userns=1`
   ([Debian-specific kernel patch, introduced in Debian 10](https://salsa.debian.org/kernel-team/linux/blob/283390e7feb21b47779b48e0c8eb0cc409d2c815/debian/patches/debian/overlayfs-permit-mounts-in-userns.patch)).
   Add the configuration to `/etc/modprobe.d` for persistence.
{% endcomment %}
- `overlay2` ストレージドライバー（推奨）を利用するには、`sudo modprobe overlay permit_mounts_in_userns=1` を実行してください。
   ([Debian 固有のカーネルパッチ、Debian 10 において導入](https://salsa.debian.org/kernel-team/linux/blob/283390e7feb21b47779b48e0c8eb0cc409d2c815/debian/patches/debian/overlayfs-permit-mounts-in-userns.patch))
   そして `/etc/modprobe.d` に設定を追加してください。
@z

@x
- Known to work on Debian 9 and 10.
  `overlay2` is only supported since Debian 10 and needs `modprobe`
  configuration described above.
@y
{% comment %}
- Known to work on Debian 9 and 10.
  `overlay2` is only supported since Debian 10 and needs `modprobe`
  configuration described above.
{% endcomment %}
- Debian 9 と 10 において動作します。
  `overlay2` がサポートされるのは Debian 10 からであり、上に示した `modprobe` の設定が必要です。
@z

@x
#### Arch Linux
@y
#### Arch Linux
@z

@x
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`
@y
{% comment %}
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`
{% endcomment %}
- `/etc/sysctl.conf`（または `/etc/sysctl.d`）に `kernel.unprivileged_userns_clone=1` を追加して、`sudo sysctl --system` を実行してください。
@z

@x
#### openSUSE
@y
#### openSUSE
@z

@x
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter` is required.
  This might be required on other distros as well depending on the configuration.
@y
{% comment %}
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter` is required.
  This might be required on other distros as well depending on the configuration.
{% endcomment %}
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter` を実行することが必要です。
  設定方法によっては他のディストリビューションにおいても必要なことかもしれません。
@z

@x
- Known to work on openSUSE 15.
@y
{% comment %}
- Known to work on openSUSE 15.
{% endcomment %}
- openSUSE 15 において動作します。
@z

@x
#### Fedora 31 and later
@y
{% comment %}
#### Fedora 31 and later
{% endcomment %}
{: #fedora-31-and-later }
#### Fedora 31 およびそれ以降
@z

@x
- Fedora 31 uses cgroup v2 by default, which is not yet supported by the containerd runtime.
  Run `sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"`
  to use cgroup v1.
- You might need `sudo dnf install -y iptables`.
@y
{% comment %}
- Fedora 31 uses cgroup v2 by default, which is not yet supported by the containerd runtime.
  Run `sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"`
  to use cgroup v1.
- You might need `sudo dnf install -y iptables`.
{% endcomment %}
- Fedora 31 はデフォルトで cgroup v2 を利用しています。
  これは今のところ、コンテナー起動においてサポートされていません。
  `sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"` を実行して cgroup v1 を利用するようにしてください。
- `sudo dnf install -y iptables` が必要かもしれません。
@z

@x
#### CentOS 8
@y
#### CentOS 8
@z

@x
- You might need `sudo dnf install -y iptables`.
@y
{% comment %}
- You might need `sudo dnf install -y iptables`.
{% endcomment %}
- `sudo dnf install -y iptables` が必要かもしれません。
@z

@x
#### CentOS 7
@y
#### CentOS 7
@z

@x
- Add `user.max_user_namespaces=28633` to `/etc/sysctl.conf` (or 
  `/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
{% comment %}
- Add `user.max_user_namespaces=28633` to `/etc/sysctl.conf` (or 
  `/etc/sysctl.d`) and run `sudo sysctl --system`.
{% endcomment %}
- `/etc/sysctl.conf`（または `/etc/sysctl.d`）に `user.max_user_namespaces=28633` を追加して、`sudo sysctl --system` を実行してください。
@z

@x
- `systemctl --user` does not work by default. 
  Run the daemon directly without systemd:
  `dockerd-rootless.sh --experimental --storage-driver vfs`
@y
{% comment %}
- `systemctl --user` does not work by default. 
  Run the daemon directly without systemd:
  `dockerd-rootless.sh --experimental --storage-driver vfs`
{% endcomment %}
- デフォルトでは `systemctl --user` は動作しません。
  デーモンは sysmted を使わずに直接起動してください。
  `dockerd-rootless.sh --experimental --storage-driver vfs` などです。
@z

@x
- Known to work on CentOS 7.7. Older releases require additional configuration
  steps.
@y
{% comment %}
- Known to work on CentOS 7.7. Older releases require additional configuration
  steps.
{% endcomment %}
- CentOS 7.7 において動作します。
  これより古いリリースにおいては、追加の設定手順が必要になります。
@z

@x
- CentOS 7.6 and older releases require [COPR package `vbatts/shadow-utils-newxidmap`](https://copr.fedorainfracloud.org/coprs/vbatts/shadow-utils-newxidmap/) to be installed.
@y
{% comment %}
- CentOS 7.6 and older releases require [COPR package `vbatts/shadow-utils-newxidmap`](https://copr.fedorainfracloud.org/coprs/vbatts/shadow-utils-newxidmap/) to be installed.
{% endcomment %}
- CentOS 7.6 やこれ以前のリリースにおいては、[COPR パッケージの `vbatts/shadow-utils-newxidmap`](https://copr.fedorainfracloud.org/coprs/vbatts/shadow-utils-newxidmap/) をインストールしていることが必要です。
@z

@x
- CentOS 7.5 and older releases require running
  `sudo grubby --update-kernel=ALL --args="user_namespace.enable=1"` and a reboot following this.
@y
{% comment %}
- CentOS 7.5 and older releases require running
  `sudo grubby --update-kernel=ALL --args="user_namespace.enable=1"` and a reboot following this.
{% endcomment %}
- CentOS 7.5 やこれ以前のリリースにおいては `sudo grubby --update-kernel=ALL --args="user_namespace.enable=1"` の実行と、その後にシステムを再起動することが必要です。
@z

@x
## Known limitations
@y
{% comment %}
## Known limitations
{% endcomment %}
{: #known-limitations }
## 既知の制約
@z

@x
- Only `vfs` graphdriver is supported. However, on Ubuntu and Debian 10,
  `overlay2` and `overlay` are also supported.
- Following features are not supported:
  - Cgroups (including `docker top`, which depends on the cgroups)
  - AppArmor
  - Checkpoint
  - Overlay network
  - Exposing SCTP ports
- To use the `ping` command, see [Routing ping packets](#routing-ping-packets).
- To expose privileged TCP/UDP ports (< 1024), see [Exposing privileged ports](#exposing-privileged-ports).
- `IPAddress` shown in `docker inspect` and is namespaced inside RootlessKit's network namespace.
  This means the IP address is not reachable from the host without `nsenter`-ing into the network namespace.
- Host network (`docker run --net=host`) is also namespaced inside RootlessKit.
@y
{% comment %}
- Only `vfs` graphdriver is supported. However, on Ubuntu and Debian 10,
  `overlay2` and `overlay` are also supported.
- Following features are not supported:
  - Cgroups (including `docker top`, which depends on the cgroups)
  - AppArmor
  - Checkpoint
  - Overlay network
  - Exposing SCTP ports
- To use the `ping` command, see [Routing ping packets](#routing-ping-packets).
- To expose privileged TCP/UDP ports (< 1024), see [Exposing privileged ports](#exposing-privileged-ports).
- `IPAddress` shown in `docker inspect` and is namespaced inside RootlessKit's network namespace.
  This means the IP address is not reachable from the host without `nsenter`-ing into the network namespace.
- Host network (`docker run --net=host`) is also namespaced inside RootlessKit.
{% endcomment %}
- `vfs` グラフドライバーだけがサポートされます。
  ただし Ubuntu と Debian 10 の場合は `overlay2` と `overlay` もサポートされます。
- 以下の機能はサポートされません。
  - cgroups （cgroups に依存している `docker top`も同様。）
  - AppArmor
  - Checkpoint
  - Overlay ネットワーク
  - SCTP ポートの公開
- `ping` コマンドを利用するには [Routing ping packets](#routing-ping-packets) を参照してください。
- To expose privileged TCP/UDP ports (< 1024), see [Exposing privileged ports](#exposing-privileged-ports).
- `IPAddress` shown in `docker inspect` and is namespaced inside RootlessKit's network namespace.
  This means the IP address is not reachable from the host without `nsenter`-ing into the network namespace.
- Host network (`docker run --net=host`) is also namespaced inside RootlessKit.
@z

@x
## Install
@y
{% comment %}
## Install
{% endcomment %}
{: #install }
## インストール
@z

@x
The installation script is available at [https://get.docker.com/rootless](https://get.docker.com/rootless){: target="_blank" rel="noopener" class="_" }.
@y
{% comment %}
The installation script is available at [https://get.docker.com/rootless](https://get.docker.com/rootless){: target="_blank" rel="noopener" class="_" }.
{% endcomment %}
[https://get.docker.com/rootless](https://get.docker.com/rootless){: target="_blank" rel="noopener" class="_" } から、インストールスクリプトを入手することができます。
@z

@x
```console
$ curl -fsSL https://get.docker.com/rootless | sh
```
@y
```console
$ curl -fsSL https://get.docker.com/rootless | sh
```
@z

@x
Make sure to run the script as a non-root user.
To install Rootless Docker as the root user, see the [Manual installation](#manual-installation) steps.
@y
{% comment %}
Make sure to run the script as a non-root user.
To install Rootless Docker as the root user, see the [Manual installation](#manual-installation) steps.
{% endcomment %}
Make sure to run the script as a non-root user.
To install Rootless Docker as the root user, see the [Manual installation](#manual-installation) steps.
@z

@x
The script shows environment variables that are required:
@y
{% comment %}
{% endcomment %}
The script shows environment variables that are required:
@z

@x
```console
$ curl -fsSL https://get.docker.com/rootless | sh
...
# Docker binaries are installed in /home/testuser/bin
# WARN: dockerd is not in your current PATH or pointing to /home/testuser/bin/dockerd
# Make sure the following environment variables are set (or add them to ~/.bashrc):
@y
```console
$ curl -fsSL https://get.docker.com/rootless | sh
...
# Docker binaries are installed in /home/testuser/bin
# WARN: dockerd is not in your current PATH or pointing to /home/testuser/bin/dockerd
# Make sure the following environment variables are set (or add them to ~/.bashrc):
@z

@x
export PATH=/home/testuser/bin:$PATH
export PATH=$PATH:/sbin
export DOCKER_HOST=unix:///run/user/1001/docker.sock
@y
export PATH=/home/testuser/bin:$PATH
export PATH=$PATH:/sbin
export DOCKER_HOST=unix:///run/user/1001/docker.sock
@z

@x
#
# To control docker service run:
# systemctl --user (start|stop|restart) docker
#
```
@y
#
# To control docker service run:
# systemctl --user (start|stop|restart) docker
#
```
@z

@x
### Manual installation
@y
{% comment %}
### Manual installation
{% endcomment %}
{: #manual-installation }
### 手動インストール
@z

@x
To install the binaries manually without using the installer, extract
`docker-rootless-extras-<version>.tgz` along with `docker-<version>.tgz`
from [https://download.docker.com/linux/static/stable/x86\_64/](https://download.docker.com/linux/static/stable/x86_64/){: target="_blank" rel="noopener" class="_" }
@y
{% comment %}
{% endcomment %}
To install the binaries manually without using the installer, extract
`docker-rootless-extras-<version>.tar.gz` along with `docker-<version>.tar.gz`
from [https://download.docker.com/linux/static/stable/x86\_64/](https://download.docker.com/linux/static/stable/x86_64/){: target="_blank" rel="noopener" class="_" }
@z

@x
If you already have the Docker daemon running as the root, you only need to
extract `docker-rootless-extras-<version>.tgz`. The archive can be extracted
under an arbitrary directory listed in the `$PATH`. For example, `/usr/local/bin`,
or `$HOME/bin`.
@y
{% comment %}
{% endcomment %}
If you already have the Docker daemon running as the root, you only need to
extract `docker-rootless-extras-<version>.tgz`. The archive can be extracted
under an arbitrary directory listed in the `$PATH`. For example, `/usr/local/bin`,
or `$HOME/bin`.
@z

@x
### Nightly channel
@y
{% comment %}
{% endcomment %}
### Nightly channel
@z

@x
To install a nightly version of the Rootless Docker, run the installation script
using `CHANNEL="nightly"`:
@y
{% comment %}
{% endcomment %}
To install a nightly version of the Rootless Docker, run the installation script
using `CHANNEL="nightly"`:
@z

@x
```console
$ curl -fsSL https://get.docker.com/rootless | CHANNEL="nightly" sh
```
@y
```console
$ curl -fsSL https://get.docker.com/rootless | CHANNEL="nightly" sh
```
@z

@x
The raw binary archives are available at:
- https://master.dockerproject.org/linux/x86\_64/docker-rootless-extras.tgz
- https://master.dockerproject.org/linux/x86\_64/docker.tgz
@y
{% comment %}
{% endcomment %}
The raw binary archives are available at:
- https://master.dockerproject.org/linux/x86\_64/docker-rootless-extras.tgz
- https://master.dockerproject.org/linux/x86\_64/docker.tgz
@z

@x
## Usage
@y
{% comment %}
## Usage
{% endcomment %}
{: #usage }
## 利用方法
@z

@x
### Daemon
@y
{% comment %}
### Daemon
{% endcomment %}
{: #daemon }
### デーモン
@z

@x
Use `systemctl --user` to manage the lifecycle of the daemon:
@y
{% comment %}
Use `systemctl --user` to manage the lifecycle of the daemon:
{% endcomment %}
Use `systemctl --user` to manage the lifecycle of the daemon:
@z

@x
```console
$ systemctl --user start docker
```
@y
```console
$ systemctl --user start docker
```
@z

@x
To launch the daemon on system startup, enable the systemd service and lingering:
@y
{% comment %}
To launch the daemon on system startup, enable the systemd service and lingering:
{% endcomment %}
To launch the daemon on system startup, enable the systemd service and lingering:
@z

@x
```console
$ systemctl --user enable docker
$ sudo loginctl enable-linger $(whoami)
```
@y
```console
$ systemctl --user enable docker
$ sudo loginctl enable-linger $(whoami)
```
@z

@x
To run the daemon directly without systemd, you need to run
`dockerd-rootless.sh` instead of `dockerd`:
@y
{% comment %}
To run the daemon directly without systemd, you need to run
`dockerd-rootless.sh` instead of `dockerd`:
{% endcomment %}
To run the daemon directly without systemd, you need to run
`dockerd-rootless.sh` instead of `dockerd`:
@z

@x
```console
$ dockerd-rootless.sh --experimental --storage-driver vfs
```
@y
```console
$ dockerd-rootless.sh --experimental --storage-driver vfs
```
@z

@x
As Rootless mode is experimental, you need to run
`dockerd-rootless.sh` with `--experimental`.
@y
{% comment %}
{% endcomment %}
As Rootless mode is experimental, you need to run
`dockerd-rootless.sh` with `--experimental`.
@z

@x
You also need `--storage-driver vfs` unless you are using Ubuntu or Debian 10
kernel. You don't need to care about these flags if you manage the daemon using
systemd, as these flags are automatically added to the systemd unit file.
@y
{% comment %}
{% endcomment %}
You also need `--storage-driver vfs` unless you are using Ubuntu or Debian 10
kernel. You don't need to care about these flags if you manage the daemon using
systemd, as these flags are automatically added to the systemd unit file.
@z

@x
Remarks about directory paths:
@y
{% comment %}
{% endcomment %}
Remarks about directory paths:
@z

@x
- The socket path is set to `$XDG_RUNTIME_DIR/docker.sock` by default.
  `$XDG_RUNTIME_DIR` is typically set to `/run/user/$UID`.
- The data dir is set to `~/.local/share/docker` by default.
- The exec dir is set to `$XDG_RUNTIME_DIR/docker` by default.
- The daemon config dir is set to `~/.config/docker` (not `~/.docker`, which is
  used by the client) by default.
@y
{% comment %}
{% endcomment %}
- The socket path is set to `$XDG_RUNTIME_DIR/docker.sock` by default.
  `$XDG_RUNTIME_DIR` is typically set to `/run/user/$UID`.
- The data dir is set to `~/.local/share/docker` by default.
- The exec dir is set to `$XDG_RUNTIME_DIR/docker` by default.
- The daemon config dir is set to `~/.config/docker` (not `~/.docker`, which is
  used by the client) by default.
@z

@x
Other remarks:
@y
{% comment %}
{% endcomment %}
Other remarks:
@z

@x
- The `dockerd-rootless.sh` script executes `dockerd` in its own user, mount,
  and network namespaces. You can enter the namespaces by running
  `nsenter -U --preserve-credentials -n -m -t $(cat $XDG_RUNTIME_DIR/docker.pid)`.
- `docker info` shows `rootless` in `SecurityOptions`
- `docker info` shows `none` as `Cgroup Driver`
@y
{% comment %}
{% endcomment %}
- The `dockerd-rootless.sh` script executes `dockerd` in its own user, mount,
  and network namespaces. You can enter the namespaces by running
  `nsenter -U --preserve-credentials -n -m -t $(cat $XDG_RUNTIME_DIR/docker.pid)`.
- `docker info` shows `rootless` in `SecurityOptions`
- `docker info` shows `none` as `Cgroup Driver`
@z

@x
### Client
@y
{% comment %}
{% endcomment %}
### Client
@z

@x
You need to specify the socket path explicitly.
@y
{% comment %}
{% endcomment %}
You need to specify the socket path explicitly.
@z

@x
To specify the socket path using `$DOCKER_HOST`:
@y
{% comment %}
{% endcomment %}
To specify the socket path using `$DOCKER_HOST`:
@z

@x
```console
$ export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
$ docker run -d -p 8080:80 nginx
```
@y
```console
$ export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
$ docker run -d -p 8080:80 nginx
```
@z

@x
To specify the socket path using `docker context`:
@y
{% comment %}
{% endcomment %}
To specify the socket path using `docker context`:
@z

@x
```console
$ docker context create rootless --description "for rootless mode" --docker "host=unix://$XDG_RUNTIME_DIR/docker.sock"
rootless
Successfully created context "rootless"
$ docker context use rootless
rootless
Current context is now "rootless"
$ docker run -d -p 8080:80 nginx
```
@y
```console
$ docker context create rootless --description "for rootless mode" --docker "host=unix://$XDG_RUNTIME_DIR/docker.sock"
rootless
Successfully created context "rootless"
$ docker context use rootless
rootless
Current context is now "rootless"
$ docker run -d -p 8080:80 nginx
```
@z

@x
## Best practices
@y
{% comment %}
{% endcomment %}
## Best practices
@z

@x
### Rootless Docker in Docker
@y
{% comment %}
{% endcomment %}
### Rootless Docker in Docker
@z

@x
To run Rootless Docker inside "rootful" Docker, use the `docker:<version>-dind-rootless`
image instead of `docker:<version>-dind`.
@y
{% comment %}
{% endcomment %}
To run Rootless Docker inside "rootful" Docker, use the `docker:<version>-dind-rootless`
image instead of `docker:<version>-dind`.
@z

@x
```console
$ docker run -d --name dind-rootless --privileged docker:19.03-dind-rootless --experimental
```
@y
```console
$ docker run -d --name dind-rootless --privileged docker:19.03-dind-rootless --experimental
```
@z

@x
The `docker:<version>-dind-rootless` image runs as a non-root user (UID 1000).
However, `--privileged` is required for disabling seccomp, AppArmor, and mount
masks.
@y
{% comment %}
{% endcomment %}
The `docker:<version>-dind-rootless` image runs as a non-root user (UID 1000).
However, `--privileged` is required for disabling seccomp, AppArmor, and mount
masks.
@z

@x
### Expose Docker API socket through TCP
@y
{% comment %}
{% endcomment %}
### Expose Docker API socket through TCP
@z

@x
To expose the Docker API socket through TCP, you need to launch `dockerd-rootless.sh`
with `DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp"`.
@y
{% comment %}
{% endcomment %}
To expose the Docker API socket through TCP, you need to launch `dockerd-rootless.sh`
with `DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp"`.
@z

@x
```console
$ DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp" \
  dockerd-rootless.sh --experimental \
  -H tcp://0.0.0.0:2376 \
  --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem
```
@y
```console
$ DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp" \
  dockerd-rootless.sh --experimental \
  -H tcp://0.0.0.0:2376 \
  --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem
```
@z

@x
### Expose Docker API socket through SSH
@y
{% comment %}
{% endcomment %}
### Expose Docker API socket through SSH
@z

@x
To expose the Docker API socket through SSH, you need to make sure `$DOCKER_HOST`
is set on the remote host.
@y
{% comment %}
{% endcomment %}
To expose the Docker API socket through SSH, you need to make sure `$DOCKER_HOST`
is set on the remote host.
@z

@x
```console
$ ssh -l <REMOTEUSER> <REMOTEHOST> 'echo $DOCKER_HOST'
unix:///run/user/1001/docker.sock
$ docker -H ssh://<REMOTEUSER>@<REMOTEHOST> run ...
```
@y
```console
$ ssh -l <REMOTEUSER> <REMOTEHOST> 'echo $DOCKER_HOST'
unix:///run/user/1001/docker.sock
$ docker -H ssh://<REMOTEUSER>@<REMOTEHOST> run ...
```
@z

@x
### Routing ping packets
@y
{% comment %}
{% endcomment %}
### Routing ping packets
@z

@x
On some distributions, `ping` does not work by default.
@y
{% comment %}
{% endcomment %}
On some distributions, `ping` does not work by default.
@z

@x
Add `net.ipv4.ping_group_range = 0   2147483647` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system` to allow using `ping`.
@y
{% comment %}
{% endcomment %}
Add `net.ipv4.ping_group_range = 0   2147483647` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system` to allow using `ping`.
@z

@x
### Exposing privileged ports
@y
{% comment %}
{% endcomment %}
### Exposing privileged ports
@z

@x
To expose privileged ports (< 1024), set `CAP_NET_BIND_SERVICE` on `rootlesskit` binary.
@y
{% comment %}
{% endcomment %}
To expose privileged ports (< 1024), set `CAP_NET_BIND_SERVICE` on `rootlesskit` binary.
@z

@x
```console
$ sudo setcap cap_net_bind_service=ep $HOME/bin/rootlesskit
```
@y
```console
$ sudo setcap cap_net_bind_service=ep $HOME/bin/rootlesskit
```
@z

@x
Or add `net.ipv4.ip_unprivileged_port_start=0` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
{% comment %}
{% endcomment %}
Or add `net.ipv4.ip_unprivileged_port_start=0` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system`.
@z

@x
### Limiting resources
@y
{% comment %}
### Limiting resources
{% endcomment %}
{: #limiting-resources }
### Limiting resources
@z

@x
In Docker 19.03, rootless mode ignores cgroup-related `docker run` flags such as
`--cpus`, `--memory`, --pids-limit`.
@y
{% comment %}
In Docker 19.03, rootless mode ignores cgroup-related `docker run` flags such as
`--cpus`, `--memory`, --pids-limit`.
{% endcomment %}
In Docker 19.03, rootless mode ignores cgroup-related `docker run` flags such as
`--cpus`, `--memory`, --pids-limit`.
@z

@x
However, you can still use the traditional `ulimit` and [`cpulimit`](https://github.com/opsengine/cpulimit),
though they work in process-granularity rather than in container-granularity,
and can be arbitrarily disabled by the container process.
@y
{% comment %}
However, you can still use the traditional `ulimit` and [`cpulimit`](https://github.com/opsengine/cpulimit),
though they work in process-granularity rather than in container-granularity,
and can be arbitrarily disabled by the container process.
{% endcomment %}
However, you can still use the traditional `ulimit` and [`cpulimit`](https://github.com/opsengine/cpulimit),
though they work in process-granularity rather than in container-granularity,
and can be arbitrarily disabled by the container process.
@z

@x
For example:
@y
{% comment %}
For example:
{% endcomment %}
For example:
@z

@x
- To limit CPU usage to 0.5 cores (similar to `docker run --cpus 0.5`):
  `docker run <IMAGE> cpulimit --limit=50 --include-children <COMMAND>`
- To limit max VSZ to 64MiB (similar to `docker run --memory 64m`):
  `docker run <IMAGE> sh -c "ulimit -v 65536; <COMMAND>"`
@y
{% comment %}
{% endcomment %}
- To limit CPU usage to 0.5 cores (similar to `docker run --cpus 0.5`):
  `docker run <IMAGE> cpulimit --limit=50 --include-children <COMMAND>`
- To limit max VSZ to 64MiB (similar to `docker run --memory 64m`):
  `docker run <IMAGE> sh -c "ulimit -v 65536; <COMMAND>"`
@z

@x
- To limit max number of processes to 100 per namespaced UID 2000
  (similar to `docker run --pids-limit=100`):
  `docker run --user 2000 --ulimit nproc=100 <IMAGE> <COMMAND>`
@y
{% comment %}
{% endcomment %}
- To limit max number of processes to 100 per namespaced UID 2000
  (similar to `docker run --pids-limit=100`):
  `docker run --user 2000 --ulimit nproc=100 <IMAGE> <COMMAND>`
@z

@x
### Changing the network stack
@y
{% comment %}
{% endcomment %}
### Changing the network stack
@z

@x
`dockerd-rootless.sh` uses [slirp4netns](https://github.com/rootless-containers/slirp4netns)
(if installed) or [VPNKit](https://github.com/moby/vpnkit) as the network stack
by default.
@y
{% comment %}
{% endcomment %}
`dockerd-rootless.sh` uses [slirp4netns](https://github.com/rootless-containers/slirp4netns)
(if installed) or [VPNKit](https://github.com/moby/vpnkit) as the network stack
by default.
@z

@x
These network stacks run in userspace and might have performance overhead.
See [RootlessKit documentation](https://github.com/rootless-containers/rootlesskit/tree/v0.9.5#network-drivers) for further information.
@y
{% comment %}
{% endcomment %}
These network stacks run in userspace and might have performance overhead.
See [RootlessKit documentation](https://github.com/rootless-containers/rootlesskit/tree/v0.9.5#network-drivers) for further information.
@z

@x
Optionally, you can use `lxc-user-nic` instead for the best performance.
To use `lxc-user-nic`, you need to edit [`/etc/lxc/lxc-usernet`](https://github.com/rootless-containers/rootlesskit/tree/v0.9.5#--netlxc-user-nic-experimental)
and set `$DOCKERD_ROOTLESS_ROOTLESSKIT_NET=lxc-user-nic`.
@y
{% comment %}
{% endcomment %}
Optionally, you can use `lxc-user-nic` instead for the best performance.
To use `lxc-user-nic`, you need to edit [`/etc/lxc/lxc-usernet`](https://github.com/rootless-containers/rootlesskit/tree/v0.9.5#--netlxc-user-nic-experimental)
and set `$DOCKERD_ROOTLESS_ROOTLESSKIT_NET=lxc-user-nic`.
@z

@x
## Troubleshooting
@y
{% comment %}
{% endcomment %}
## Troubleshooting
@z

@x
### Errors when starting the Docker daemon
@y
{% comment %}
{% endcomment %}
### Errors when starting the Docker daemon
@z

@x
**[rootlesskit:parent] error: failed to start the child: fork/exec /proc/self/exe: operation not permitted**
@y
{% comment %}
{% endcomment %}
**[rootlesskit:parent] error: failed to start the child: fork/exec /proc/self/exe: operation not permitted**
@z

@x
This error occurs mostly when the value of `/proc/sys/kernel/unprivileged_userns_clone ` is set to 0:
@y
{% comment %}
{% endcomment %}
This error occurs mostly when the value of `/proc/sys/kernel/unprivileged_userns_clone ` is set to 0:
@z

@x
```console
$ cat /proc/sys/kernel/unprivileged_userns_clone
0
```
@y
```console
$ cat /proc/sys/kernel/unprivileged_userns_clone
0
```
@z

@x
To fix this issue, add  `kernel.unprivileged_userns_clone=1` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
{% comment %}
{% endcomment %}
To fix this issue, add  `kernel.unprivileged_userns_clone=1` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@z

@x
**[rootlesskit:parent] error: failed to start the child: fork/exec /proc/self/exe: no space left on device**
@y
{% comment %}
{% endcomment %}
**[rootlesskit:parent] error: failed to start the child: fork/exec /proc/self/exe: no space left on device**
@z

@x
This error occurs mostly when the value of `/proc/sys/user/max_user_namespaces` is too small:
@y
{% comment %}
{% endcomment %}
This error occurs mostly when the value of `/proc/sys/user/max_user_namespaces` is too small:
@z

@x
```console
$ cat /proc/sys/user/max_user_namespaces
0
```
@y
```console
$ cat /proc/sys/user/max_user_namespaces
0
```
@z

@x
To fix this issue, add  `user.max_user_namespaces=28633` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
{% comment %}
{% endcomment %}
To fix this issue, add  `user.max_user_namespaces=28633` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@z

@x
**[rootlesskit:parent] error: failed to setup UID/GID map: failed to compute uid/gid map: No subuid ranges found for user 1001 ("testuser")**
@y
{% comment %}
{% endcomment %}
**[rootlesskit:parent] error: failed to setup UID/GID map: failed to compute uid/gid map: No subuid ranges found for user 1001 ("testuser")**
@z

@x
This error occurs when `/etc/subuid` and `/etc/subgid` are not configured. See [Prerequisites](#prerequisites).
@y
{% comment %}
{% endcomment %}
This error occurs when `/etc/subuid` and `/etc/subgid` are not configured. See [Prerequisites](#prerequisites).
@z

@x
**could not get XDG_RUNTIME_DIR**
@y
{% comment %}
{% endcomment %}
**could not get XDG_RUNTIME_DIR**
@z

@x
This error occurs when `$XDG_RUNTIME_DIR` is not set.
@y
{% comment %}
{% endcomment %}
This error occurs when `$XDG_RUNTIME_DIR` is not set.
@z

@x
On a non-systemd host, you need to create a directory and then set the path:
@y
{% comment %}
{% endcomment %}
On a non-systemd host, you need to create a directory and then set the path:
@z

@x
```console
$ export XDG_RUNTIME_DIR=$HOME/.docker/xrd
$ rm -rf $XDG_RUNTIME_DIR
$ mkdir -p $XDG_RUNTIME_DIR
$ dockerd-rootless.sh --experimental
```
@y
```console
$ export XDG_RUNTIME_DIR=$HOME/.docker/xrd
$ rm -rf $XDG_RUNTIME_DIR
$ mkdir -p $XDG_RUNTIME_DIR
$ dockerd-rootless.sh --experimental
```
@z

@x
> **Note**:
> You must remove the directory every time you log out.
@y
{% comment %}
{% endcomment %}
> **Note**:
> You must remove the directory every time you log out.
@z

@x
On a systemd host, log into the host using `pam_systemd` (see below).
The value is automatically set to `/run/user/$UID` and cleaned up on every logout.
@y
{% comment %}
{% endcomment %}
On a systemd host, log into the host using `pam_systemd` (see below).
The value is automatically set to `/run/user/$UID` and cleaned up on every logout.
@z

@x
**`systemctl --user` fails with "Failed to connect to bus: No such file or directory"**
@y
{% comment %}
{% endcomment %}
**`systemctl --user` fails with "Failed to connect to bus: No such file or directory"**
@z

@x
This error occurs mostly when you switch from the root user to an non-root user with `sudo`:
@y
{% comment %}
{% endcomment %}
This error occurs mostly when you switch from the root user to an non-root user with `sudo`:
@z

@x
```console
# sudo -iu testuser
$ systemctl --user start docker
Failed to connect to bus: No such file or directory
```
@y
```console
# sudo -iu testuser
$ systemctl --user start docker
Failed to connect to bus: No such file or directory
```
@z

@x
Instead of `sudo -iu <USERNAME>`, you need to log in using `pam_systemd`. For example:
@y
{% comment %}
{% endcomment %}
Instead of `sudo -iu <USERNAME>`, you need to log in using `pam_systemd`. For example:
@z

@x
- Log in through the graphic console
- `ssh <USERNAME>@localhost`
- `machinectl shell <USERNAME>@`
@y
{% comment %}
{% endcomment %}
- Log in through the graphic console
- `ssh <USERNAME>@localhost`
- `machinectl shell <USERNAME>@`
@z

@x
**The daemon does not start up automatically**
@y
{% comment %}
{% endcomment %}
**The daemon does not start up automatically**
@z

@x
You need `sudo loginctl enable-linger $(whoami)` to enable the daemon to start
up automatically. See [Usage](#usage).
@y
{% comment %}
{% endcomment %}
You need `sudo loginctl enable-linger $(whoami)` to enable the daemon to start
up automatically. See [Usage](#usage).
@z

@x
**`dockerd` fails with "rootless mode is supported only when running in experimental mode"**
@y
{% comment %}
{% endcomment %}
**`dockerd` fails with "rootless mode is supported only when running in experimental mode"**
@z

@x
This error occurs when the daemon is launched without the `--experimental` flag.
See [Usage](#usage).
@y
{% comment %}
{% endcomment %}
This error occurs when the daemon is launched without the `--experimental` flag.
See [Usage](#usage).
@z

@x
### `docker pull` errors
@y
{% comment %}
{% endcomment %}
### `docker pull` errors
@z

@x
**docker: failed to register layer: Error processing tar file(exit status 1): lchown &lt;FILE&gt;: invalid argument**
@y
{% comment %}
{% endcomment %}
**docker: failed to register layer: Error processing tar file(exit status 1): lchown &lt;FILE&gt;: invalid argument**
@z

@x
This error occurs when the number of available entries in `/etc/subuid` or
`/etc/subgid` is not sufficient. The number of entries required vary across
images. However, 65,536 entries are sufficient for most images. See
[Prerequisites](#prerequisites).
@y
{% comment %}
{% endcomment %}
This error occurs when the number of available entries in `/etc/subuid` or
`/etc/subgid` is not sufficient. The number of entries required vary across
images. However, 65,536 entries are sufficient for most images. See
[Prerequisites](#prerequisites).
@z

@x
### `docker run` errors
@y
{% comment %}
{% endcomment %}
### `docker run` errors
@z

@x
**`--cpus`, `--memory`, and `--pids-limit` are ignored**
@y
{% comment %}
{% endcomment %}
**`--cpus`, `--memory`, and `--pids-limit` are ignored**
@z

@x
This is an expected behavior in Docker 19.03. For more information, see [Limiting resources](#limiting-resources).
@y
{% comment %}
{% endcomment %}
This is an expected behavior in Docker 19.03. For more information, see [Limiting resources](#limiting-resources).
@z

@x
**Error response from daemon: cgroups: cgroup mountpoint does not exist: unknown.**
@y
{% comment %}
{% endcomment %}
**Error response from daemon: cgroups: cgroup mountpoint does not exist: unknown.**
@z

@x
This error occurs mostly when the host is running in cgroup v2. See the section
[Fedora 31 or later](#fedora-31-or-later) for information on switching the host
to use cgroup v1.
@y
{% comment %}
{% endcomment %}
This error occurs mostly when the host is running in cgroup v2. See the section
[Fedora 31 or later](#fedora-31-or-later) for information on switching the host
to use cgroup v1.
@z

@x
### Networking errors
@y
{% comment %}
{% endcomment %}
### Networking errors
@z

@x
**`docker run -p` fails with `cannot expose privileged port`**
@y
{% comment %}
{% endcomment %}
**`docker run -p` fails with `cannot expose privileged port`**
@z

@x
`docker run -p` fails with this error when a privileged port (< 1024) is specified as the host port.
@y
{% comment %}
{% endcomment %}
`docker run -p` fails with this error when a privileged port (< 1024) is specified as the host port.
@z

@x
```console
$ docker run -p 80:80 nginx:alpine
docker: Error response from daemon: driver failed programming external connectivity on endpoint focused_swanson (9e2e139a9d8fc92b37c36edfa6214a6e986fa2028c0cc359812f685173fa6df7): Error starting userland proxy: error while calling PortManager.AddPort(): cannot expose privileged port 80, you might need to add "net.ipv4.ip_unprivileged_port_start=0" (currently 1024) to /etc/sysctl.conf, or set CAP_NET_BIND_SERVICE on rootlesskit binary, or choose a larger port number (>= 1024): listen tcp 0.0.0.0:80: bind: permission denied.
```
@y
```console
$ docker run -p 80:80 nginx:alpine
docker: Error response from daemon: driver failed programming external connectivity on endpoint focused_swanson (9e2e139a9d8fc92b37c36edfa6214a6e986fa2028c0cc359812f685173fa6df7): Error starting userland proxy: error while calling PortManager.AddPort(): cannot expose privileged port 80, you might need to add "net.ipv4.ip_unprivileged_port_start=0" (currently 1024) to /etc/sysctl.conf, or set CAP_NET_BIND_SERVICE on rootlesskit binary, or choose a larger port number (>= 1024): listen tcp 0.0.0.0:80: bind: permission denied.
```
@z

@x
When you experience this error, consider using an unprivileged port instead. For example, 8080 instead of 80.
@y
{% comment %}
{% endcomment %}
When you experience this error, consider using an unprivileged port instead. For example, 8080 instead of 80.
@z

@x
```console
$ docker run -p 8080:80 nginx:alpine
```
@y
```console
$ docker run -p 8080:80 nginx:alpine
```
@z

@x
To allow exposing privileged ports, see [Exposing privileged ports](#exposing-privileged-ports).
@y
{% comment %}
{% endcomment %}
To allow exposing privileged ports, see [Exposing privileged ports](#exposing-privileged-ports).
@z

@x
**ping doesn't work**
@y
{% comment %}
{% endcomment %}
**ping doesn't work**
@z

@x
Ping does not work when `/proc/sys/net/ipv4/ping_group_range` is set to `1 0`:
@y
{% comment %}
{% endcomment %}
Ping does not work when `/proc/sys/net/ipv4/ping_group_range` is set to `1 0`:
@z

@x
```console
$ cat /proc/sys/net/ipv4/ping_group_range
1       0
```
@y
```console
$ cat /proc/sys/net/ipv4/ping_group_range
1       0
```
@z

@x
For details, see [Routing ping packets](#routing-ping-packets).
@y
{% comment %}
{% endcomment %}
For details, see [Routing ping packets](#routing-ping-packets).
@z

@x
**`IPAddress` shown in `docker inspect` is unreachable**
@y
{% comment %}
{% endcomment %}
**`IPAddress` shown in `docker inspect` is unreachable**
@z

@x
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@y
{% comment %}
{% endcomment %}
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@z

@x
**`--net=host` doesn't listen ports on the host network namespace**
@y
{% comment %}
{% endcomment %}
**`--net=host` doesn't listen ports on the host network namespace**
@z

@x
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@y
{% comment %}
{% endcomment %}
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@z
