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
rootless モードとは、root 以外のユーザーによって Docker デーモンやコンテナーを起動するものであり、デーモンや起動コンテナーにおける潜在的なぜい弱性を軽減します。
@z

@x
Rootless mode does not require root privileges even during the installation of
the Docker daemon, as long as the [prerequisites](#prerequisites) are met.
@y
rootless モードは root 権限を必要としません。
しかも [前提条件](#prerequisites) を満たしていれば、Docker デーモンのインストール時も必要としません。
@z

@x
Rootless mode was introduced in Docker Engine v19.03 as an experimental feature.
Rootless mode graduated from experimental in Docker Engine v20.10.
@y
rootless モードは Docker Engine v19.03 において試験的機能として導入されました。
rootless モードは Docker Engine v20.10 から正規機能となりました。
@z

@x
## How it works
@y
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
rootless モードは、Docker デーモンやコンテナーをユーザー名前空間の内部で実行します。
これは [`userns-remap` モード](userns-remap.md) に非常によく似ています。
ただし`userns-remap`モードにおいては、デーモンだけは root 権限で起動します。
rootless モードの場合は、デーモンとコンテナーがそれぞれ root 権限なしに動作します。
@z

@x
Rootless mode does not use binaries with `SETUID` bits or file capabilities,
except `newuidmap` and `newgidmap`, which are needed to allow multiple
UIDs/GIDs to be used in the user namespace.
@y
rootless モードは、実行モジュールの`SETUID`ビットやファイルケーパビリティーは利用しません。
ただし`newuidmap`と`newgidmap`は利用します。
これらはユーザー名前空間内において、複数の UID/GID を利用するために必要となるものです。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
-  You must install `newuidmap` and `newgidmap` on the host. These commands
  are provided by the `uidmap` package on most distros.
@y
-  ホスト上に`newuidmap`と`newgidmap`をインストールすることが必要です。
   このコマンドは、たいていのディストリビューションにおいて`uidmap`パッケージとして提供されています。
@z

@x
- `/etc/subuid` and `/etc/subgid` should contain at least 65,536 subordinate
  UIDs/GIDs for the user. In the following example, the user `testuser` has
  65,536 subordinate UIDs/GIDs (231072-296607).
@y
- `/etc/subuid`と`/etc/subgid`では、ユーザーに対して最低でも 65,536 個のサブ UID/サブ GIDを許容しておくことが必要です。
  以下の例において`testuser`ユーザーには 65,536 個のサブ UID/サブ GID (231072-296607) が与えられています。
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
{: #distribution-specific-hint }
### ディストリビューション固有の情報
@z

@x
> Note: We recommend that you use the Ubuntu kernel.
@y
> メモ: ここでは Ubuntu カーネルの利用をお勧めします。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#hint-ubuntu">Ubuntu</a></li>
  <li><a data-toggle="tab" data-target="#hint-debian">Debian GNU/Linux</a></li>
  <li><a data-toggle="tab" data-target="#hint-arch">Arch Linux</a></li>
  <li><a data-toggle="tab" data-target="#hint-opensuse-sles">openSUSE and SLES</a></li>
  <li><a data-toggle="tab" data-target="#hint-centos8-rhel8-fedora">CentOS 8, RHEL 8 and Fedora</a></li>
  <li><a data-toggle="tab" data-target="#hint-centos7-rhel7">CentOS 7 and RHEL 7</a></li>
</ul>
<div class="tab-content">

<div id="hint-ubuntu" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#hint-ubuntu">Ubuntu</a></li>
  <li><a data-toggle="tab" data-target="#hint-debian">Debian GNU/Linux</a></li>
  <li><a data-toggle="tab" data-target="#hint-arch">Arch Linux</a></li>
  <li><a data-toggle="tab" data-target="#hint-opensuse-sles">openSUSE と SLES</a></li>
  <li><a data-toggle="tab" data-target="#hint-centos8-rhel8-fedora">CentOS 、RHEL 8、Fedora</a></li>
  <li><a data-toggle="tab" data-target="#hint-centos7-rhel7">CentOS 7、RHEL 7</a></li>
</ul>
<div class="tab-content">

<div id="hint-ubuntu" class="tab-pane fade in active" markdown="1">
@z

@x
- Install `dbus-user-session` package if not installed. Run `sudo apt-get install -y dbus-user-session` and relogin.
@y
- `dbus-user-session`パッケージをインストールしていない場合は、インストールしてください。
  `sudo apt-get install -y dbus-user-session`を実行して、再ログインしてください。
@z

@x
- `overlay2` storage driver  is enabled by default
  ([Ubuntu-specific kernel patch](https://kernel.ubuntu.com/git/ubuntu/ubuntu-bionic.git/commit/fs/overlayfs?id=3b7da90f28fe1ed4b79ef2d994c81efbc58f1144)).
@y
- デフォルトで`overlay2`ストレージドライバーが有効になっています。
  ([Ubuntu 固有のカーネルパッチ](https://kernel.ubuntu.com/git/ubuntu/ubuntu-bionic.git/commit/fs/overlayfs?id=3b7da90f28fe1ed4b79ef2d994c81efbc58f1144))
@z

@x
- Known to work on Ubuntu 18.04, 20.04, and 21.04.
@y
- Ubuntu 18.04、20.04、21.04 において動作します。
@z

@x
</div>
<div id="hint-debian" class="tab-pane fade in" markdown="1">
@y
</div>
<div id="hint-debian" class="tab-pane fade in" markdown="1">
@z

@x
- Install `dbus-user-session` package if not installed. Run `sudo apt-get install -y dbus-user-session` and relogin.
@y
- `dbus-user-session`パッケージをインストールしていない場合は、インストールしてください。
  `sudo apt-get install -y dbus-user-session`を実行して、再ログインしてください。
@z

@x
- For Debian 10, add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`. This step is not required on Debian 11.
@y
- Debian 10 においては、`/etc/sysctl.conf`（または`/etc/sysctl.d`）に`kernel.unprivileged_userns_clone=1`を追加して、`sudo sysctl --system`を実行してください。
  この手順は Debian 11 では必要ありません。
@z

@x
- Installing `fuse-overlayfs` is recommended. Run `sudo apt-get install -y fuse-overlayfs`.
  Using `overlay2` storage driver with Debian-specific modprobe option `sudo modprobe overlay permit_mounts_in_userns=1` is also possible,
  however, highly discouraged due to [instability](https://github.com/moby/moby/issues/42302).
@y
- `fuse-overlayfs`をインストールすることが推奨されるので、`sudo apt-get install -y fuse-overlayfs`を実行してください。
  `overlay2`ストレージドライバーの利用にあたっては、Debian 固有の modprobe オプション `sudo modprobe overlay permit_mounts_in_userns=1`を用いることもできます。
  ただし [不安定性](https://github.com/moby/moby/issues/42302) があるため、利用するのは避けてください。
@z

@x
- Rootless docker requires version of `slirp4netns` greater than `v0.4.0` (when `vpnkit` is not installed).
  Check you have this with 
@y
- rootless docker では、`slirp4netns`のバージョンは`v0.4.0`以上が必要です (`vpnkit`がインストールされていない場合)。
  これを確認するには以下のようにします。
@z

@x
  ```console
  $ slirp4netns --version
  ```
@y
  ```console
  $ slirp4netns --version
  ```
@z

@x
  If you do not have this download and install with `sudo apt-get install -y slirp4netns` or download the latest [release](https://github.com/rootless-containers/slirp4netns/releases).
@y
  これをまだ入手していない場合は、`sudo apt-get install -y slirp4netns`によってインストールするか、あるいは最新版の [リリース](https://github.com/rootless-containers/slirp4netns/releases) をダウンロードしてインストールしてください。
@z

@x
</div>
<div id="hint-arch" class="tab-pane fade in" markdown="1">
@y
</div>
<div id="hint-arch" class="tab-pane fade in" markdown="1">
@z

@x
- Installing `fuse-overlayfs` is recommended. Run `sudo pacman -S fuse-overlayfs`.
@y
- `fuse-overlayfs`をインストールすることが推奨されます。
  その場合は`sudo pacman -S fuse-overlayfs`を実行します。
@z

@x
- Add `kernel.unprivileged_userns_clone=1` to `/etc/sysctl.conf` (or
  `/etc/sysctl.d`) and run `sudo sysctl --system`
@y
- `/etc/sysctl.conf`（または`/etc/sysctl.d`）に`kernel.unprivileged_userns_clone=1`を追加して、`sudo sysctl --system`を実行してください。
@z

@x
</div>
<div id="hint-opensuse-sles" class="tab-pane fade in" markdown="1">
@y
</div>
<div id="hint-opensuse-sles" class="tab-pane fade in" markdown="1">
@z

@x
- Installing `fuse-overlayfs` is recommended. Run `sudo zypper install -y fuse-overlayfs`.
@y
- `fuse-overlayfs`をインストールすることが推奨されます。
  その場合は`sudo zypper install -y fuse-overlayfs`を実行します。
@z

@x
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter` is required.
  This might be required on other distros as well depending on the configuration.
@y
- `sudo modprobe ip_tables iptable_mangle iptable_nat iptable_filter`を実行することが必要です。
  設定方法によっては他のディストリビューションにおいても必要なことかもしれません。
@z

@x
- Known to work on openSUSE 15 and SLES 15.
@y
- openSUSE 15 と SLES 15 において動作します。
@z

@x
</div>
<div id="hint-centos8-rhel8-fedora" class="tab-pane fade in" markdown="1">
@y
</div>
<div id="hint-centos8-rhel8-fedora" class="tab-pane fade in" markdown="1">
@z

@x
- Installing `fuse-overlayfs` is recommended. Run `sudo dnf install -y fuse-overlayfs`.
@y
- `fuse-overlayfs`をインストールすることが推奨されます。
  その場合は`sudo dnf install -y fuse-overlayfs`を実行します。
@z

@x
- You might need `sudo dnf install -y iptables`.
@y
- `sudo dnf install -y iptables`が必要かもしれません。
@z

@x
- Known to work on CentOS 8, RHEL 8, and Fedora 34.
@y
- Known to work on CentOS 8, RHEL 8, and Fedora 34.
@z

@x
</div>
<div id="hint-centos7-rhel7" class="tab-pane fade in" markdown="1">
@y
</div>
<div id="hint-centos7-rhel7" class="tab-pane fade in" markdown="1">
@z

@x
- Add `user.max_user_namespaces=28633` to `/etc/sysctl.conf` (or 
  `/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
- `/etc/sysctl.conf`（または`/etc/sysctl.d`）に`user.max_user_namespaces=28633`を追加して、`sudo sysctl --system`を実行してください。
@z

@x
- `systemctl --user` does not work by default. 
  Run `dockerd-rootless.sh` directly without systemd.
@y
- デフォルトでは`systemctl --user`は動作しません。
  デーモンは sysmted を使わずに直接`dockerd-rootless.sh`を起動してください。
@z

@x
</div>
</div> <!-- tab-content -->
@y
</div>
</div> <!-- tab-content -->
@z

@x
## Known limitations
@y
{: #known-limitations }
## 既知の制約
@z

@x
- Only the following storage drivers are supported:
  - `overlay2` (only if running with kernel 5.11 or later, or Ubuntu-flavored kernel)
  - `fuse-overlayfs` (only if running with kernel 4.18 or later, and `fuse-overlayfs` is installed)
  - `btrfs` (only if running with kernel 4.18 or later, or `~/.local/share/docker` is mounted with `user_subvol_rm_allowed` mount option)
  - `vfs`
- Cgroup is supported only when running with cgroup v2 and systemd. See [Limiting resources](#limiting-resources).
- Following features are not supported:
  - AppArmor
  - Checkpoint
  - Overlay network
  - Exposing SCTP ports
- To use the `ping` command, see [Routing ping packets](#routing-ping-packets).
- To expose privileged TCP/UDP ports (< 1024), see [Exposing privileged ports](#exposing-privileged-ports).
- `IPAddress` shown in `docker inspect` and is namespaced inside RootlessKit's network namespace.
  This means the IP address is not reachable from the host without `nsenter`-ing into the network namespace.
- Host network (`docker run --net=host`) is also namespaced inside RootlessKit.
- NFS mounts as the docker "data-root" is not supported. This limitation is not specific to rootless mode.
@y
- 以下のストレージドライバーのみがサポートされます。
  - `overlay2`（カーネル 5.11 およびこれ以降が稼働する場合のみ。または Ubuntu 系カーネルのみ。）
  - `fuse-overlayfs`（カーネル 4.18 またはそれ以降の稼動時、そして`fuse-overlayfs`インストール時のみ。）
  - `btrfs`（カーネル 4.18 またはそれ以降で利用する場合のみ。あるいは`user_subvol_rm_allowed`マウントオプションを使って`~/.local/share/docker`をマウントしている場合。）
  - `vfs`
- cgroup は cgroup v2 および systemd を用いて実行するときのみサポートされます。
  [リソースの利用制限](#limiting-resources) を参照してください。
- 以下の機能はサポートされません。
  - AppArmor
  - Checkpoint
  - Overlay ネットワーク
  - SCTP ポートの公開
- `ping` コマンドを利用するには [Routing ping packets](#routing-ping-packets) を参照してください。
- TCP/UDP の特権ポート（1024 未満）を公開するには [特権ポートの公開](#exposing-privileged-ports) を参照してください。
- `docker inspect`に表示される`IPAddress`は RootlessKit のネットワーク名前空間内で名前空間化されます。
  これはつまりこの IP アドレスへは、`nsenter`を使ってそのネットワーク名前空間にアクセスしない限りは、ホストからアクセスできないということです。
- ホストネットワーク（`docker run --net=host`）も RootlessKit 内で名前空間化されます。
- Docker の「data-root」としての NFS マウントはサポートされません。
  この制約は rootless モードだけのものではありません。
@z

@x
## Install
@y
{: #install }
## インストール
@z

@x
> **Note**
>
> If the system-wide Docker daemon is already running, consider disabling it:
> `$ sudo systemctl disable --now docker.service docker.socket`

<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#install-with-packages">With packages (RPM/DEB)</a></li>
  <li><a data-toggle="tab" data-target="#install-without-packages">Without packages</a></li>
</ul>
<div class="tab-content">
@y
> **メモ**
>
> If the system-wide Docker daemon is already running, consider disabling it:
> `$ sudo systemctl disable --now docker.service docker.socket`

<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#install-with-packages">With packages (RPM/DEB)</a></li>
  <li><a data-toggle="tab" data-target="#install-without-packages">Without packages</a></li>
</ul>
<div class="tab-content">
@z

@x
<div id="install-with-packages" class="tab-pane fade in active" markdown="1">
If you installed Docker 20.10 or later with [RPM/DEB packages](/engine/install), you should have `dockerd-rootless-setuptool.sh` in `/usr/bin`.
@y
<div id="install-with-packages" class="tab-pane fade in active" markdown="1">
If you installed Docker 20.10 or later with [RPM/DEB packages](/engine/install), you should have `dockerd-rootless-setuptool.sh` in `/usr/bin`.
@z

@x
Run `dockerd-rootless-setuptool.sh install` as a non-root user to set up the daemon:
@y
Run `dockerd-rootless-setuptool.sh install` as a non-root user to set up the daemon:
@z

@x
```console
$ dockerd-rootless-setuptool.sh install
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`

[INFO] Make sure the following environment variables are set (or add them to ~/.bashrc):

export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
@y
```console
$ dockerd-rootless-setuptool.sh install
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`

[INFO] Make sure the following environment variables are set (or add them to ~/.bashrc):

export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
@z

@x
If `dockerd-rootless-setuptool.sh` is not present, you may need to install the `docker-ce-rootless-extras` package manually, e.g.,
@y
If `dockerd-rootless-setuptool.sh` is not present, you may need to install the `docker-ce-rootless-extras` package manually, e.g.,
@z

@x
```console
$ sudo apt-get install -y docker-ce-rootless-extras
```
@y
```console
$ sudo apt-get install -y docker-ce-rootless-extras
```
@z

@x
</div>
<div id="install-without-packages" class="tab-pane fade in" markdown="1">
@y
</div>
<div id="install-without-packages" class="tab-pane fade in" markdown="1">
@z

@x
If you do not have permission to run package managers like `apt-get` and `dnf`,
consider using the installation script available at [https://get.docker.com/rootless](https://get.docker.com/rootless){: target="_blank" rel="noopener" class="_" }.
Since static packages are not available for `s390x`, hence it is not supported for `s390x`.
@y
If you do not have permission to run package managers like `apt-get` and `dnf`,
consider using the installation script available at [https://get.docker.com/rootless](https://get.docker.com/rootless){: target="_blank" rel="noopener" class="_" }.
Since static packages are not available for `s390x`, hence it is not supported for `s390x`.
@z

@x
```console
$ curl -fsSL https://get.docker.com/rootless | sh
...
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`

[INFO] Make sure the following environment variables are set (or add them to ~/.bashrc):

export PATH=/home/testuser/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin1">画面表記</a></li>
  <li><a data-toggle="tab" href="#japanese1">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin1" class="tab-pane fade in active">
{% capture original-content %}
```console
$ curl -fsSL https://get.docker.com/rootless | sh
...
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`

[INFO] Make sure the following environment variables are set (or add them to ~/.bashrc):

export PATH=/home/testuser/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese1" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```console
$ curl -fsSL https://get.docker.com/rootless | sh
...
[INFO] Creating /home/testuser/.config/systemd/user/docker.service
...
[INFO] Installed docker.service successfully.
[INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
[INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger testuser`

[INFO] Make sure the following environment variables are set (or add them to ~/.bashrc):

export PATH=/home/testuser/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
The binaries will be installed at `~/bin`.
@y
The binaries will be installed at `~/bin`.
@z

@x
</div>
</div> <!-- tab-content -->
@y
</div>
</div> <!-- tab-content -->
@z

@x
See [Troubleshooting](#troubleshooting) if you faced an error.
@y
See [Troubleshooting](#troubleshooting) if you faced an error.
@z

@x
## Uninstall
@y
{: #uninstall }
## アンインストール
@z

@x
To remove the systemd service of the Docker daemon, run `dockerd-rootless-setuptool.sh uninstall`:
@y
To remove the systemd service of the Docker daemon, run `dockerd-rootless-setuptool.sh uninstall`:
@z

@x
```console
$ dockerd-rootless-setuptool.sh uninstall
+ systemctl --user stop docker.service
+ systemctl --user disable docker.service
Removed /home/testuser/.config/systemd/user/default.target.wants/docker.service.
[INFO] Uninstalled docker.service
[INFO] This uninstallation tool does NOT remove Docker binaries and data.
[INFO] To remove data, run: `/usr/bin/rootlesskit rm -rf /home/testuser/.local/share/docker`
```
@y
```console
$ dockerd-rootless-setuptool.sh uninstall
+ systemctl --user stop docker.service
+ systemctl --user disable docker.service
Removed /home/testuser/.config/systemd/user/default.target.wants/docker.service.
[INFO] Uninstalled docker.service
[INFO] This uninstallation tool does NOT remove Docker binaries and data.
[INFO] To remove data, run: `/usr/bin/rootlesskit rm -rf /home/testuser/.local/share/docker`
```
@z

@x
Unset environment variables PATH and DOCKER_HOST if you have added them to `~/.bashrc`.
@y
Unset environment variables PATH and DOCKER_HOST if you have added them to `~/.bashrc`.
@z

@x
To remove the data directory, run `rootlesskit rm -rf ~/.local/share/docker`.
@y
To remove the data directory, run `rootlesskit rm -rf ~/.local/share/docker`.
@z

@x
To remove the binaries, remove `docker-ce-rootless-extras` package if you installed Docker with package managers.
If you installed Docker with https://get.docker.com/rootless ([Install without packages](#install)),
remove the binary files under `~/bin`:
@y
To remove the binaries, remove `docker-ce-rootless-extras` package if you installed Docker with package managers.
If you installed Docker with https://get.docker.com/rootless ([Install without packages](#install)),
remove the binary files under `~/bin`:
@z

@x
```console
$ cd ~/bin
$ rm -f containerd containerd-shim containerd-shim-runc-v2 ctr docker docker-init docker-proxy dockerd dockerd-rootless-setuptool.sh dockerd-rootless.sh rootlesskit rootlesskit-docker-proxy runc vpnkit
```
@y
```console
$ cd ~/bin
$ rm -f containerd containerd-shim containerd-shim-runc-v2 ctr docker docker-init docker-proxy dockerd dockerd-rootless-setuptool.sh dockerd-rootless.sh rootlesskit rootlesskit-docker-proxy runc vpnkit
```
@z

@x
## Usage
@y
{: #usage }
## 利用方法
@z

@x
### Daemon
@y
{: #daemon }
### デーモン
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#usage-with-systemd">With systemd (Highly recommended)</a></li>
  <li><a data-toggle="tab" data-target="#usage-without-systemd">Without systemd</a></li>
</ul>
<div class="tab-content">

<div id="usage-with-systemd" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#usage-with-systemd">With systemd (Highly recommended)</a></li>
  <li><a data-toggle="tab" data-target="#usage-without-systemd">Without systemd</a></li>
</ul>
<div class="tab-content">

<div id="usage-with-systemd" class="tab-pane fade in active" markdown="1">
@z

@x
The systemd unit file is installed as  `~/.config/systemd/user/docker.service`.
@y
The systemd unit file is installed as  `~/.config/systemd/user/docker.service`.
@z

@x
Use `systemctl --user` to manage the lifecycle of the daemon:
@y
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
システム起動時にデーモンを起動するには、Systemd サービスに対して linger を有効にします。
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
Starting Rootless Docker as a systemd-wide service (`/etc/systemd/system/docker.service`)
is not supported, even with the `User=` directive.
@y
Starting Rootless Docker as a systemd-wide service (`/etc/systemd/system/docker.service`)
is not supported, even with the `User=` directive.
@z

@x
</div>
<div id="usage-without-systemd" class="tab-pane fade in" markdown="1">
@y
</div>
<div id="usage-without-systemd" class="tab-pane fade in" markdown="1">
@z

@x
The following environment variables must be set:
- `$HOME`: the home directory
- `$XDG_RUNTIME_DIR`: an ephemeral directory that is only accessible by the expected user, e,g, `~/.docker/run`.
  The directory should be removed on every host shutdown.
  The directory can be on tmpfs, however, should not be under `/tmp`.
  Locating this directory under `/tmp` might be vulnerable to TOCTOU attack.
@y
The following environment variables must be set:
- `$HOME`: the home directory
- `$XDG_RUNTIME_DIR`: an ephemeral directory that is only accessible by the expected user, e,g, `~/.docker/run`.
  The directory should be removed on every host shutdown.
  The directory can be on tmpfs, however, should not be under `/tmp`.
  Locating this directory under `/tmp` might be vulnerable to TOCTOU attack.
@z

@x
</div>
</div> <!-- tab-content -->
@y
</div>
</div> <!-- tab-content -->
@z

@x
Remarks about directory paths:
@y
ディレクトリパスについて触れておきます。
@z

@x
- The socket path is set to `$XDG_RUNTIME_DIR/docker.sock` by default.
  `$XDG_RUNTIME_DIR` is typically set to `/run/user/$UID`.
- The data dir is set to `~/.local/share/docker` by default.
  The data dir should not be on NFS.
- The daemon config dir is set to `~/.config/docker` by default.
  This directory is different from `~/.docker` that is used by the client.
@y
- ソケットパスはデフォルトで`$XDG_RUNTIME_DIR/docker.sock`に設定されます。
  `$XDG_RUNTIME_DIR`は通常`/run/user/$UID`に設定されます。
- データディレクトリはデフォルトで`~/.local/share/docker`に設定されます。
  The data dir should not be on NFS.
- The daemon config dir is set to `~/.config/docker` by default.
  This directory is different from `~/.docker` that is used by the client.
@z

@x
### Client
@y
{: #client }
### クライアント
@z

@x
You need to specify either the socket path or the CLI context explicitly.
@y
ソケットパスまたは CLI コンテキストを明示的に指定する必要があります。
@z

@x
To specify the socket path using `$DOCKER_HOST`:
@y
`$DOCKER_HOST`を用いてソケットパス指定するには以下のようにします。
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
To specify the CLI context using `docker context`:
@y
`docker context`を用いて CLI コンテキストを指定するには以下のようにします。
@z

@x
```console
$ docker context use rootless
rootless
Current context is now "rootless"
$ docker run -d -p 8080:80 nginx
```
@y
```console
$ docker context use rootless
rootless
Current context is now "rootless"
$ docker run -d -p 8080:80 nginx
```
@z

@x
## Best practices
@y
{: #best-practices }
## ベストプラクティス
@z

@x
### Rootless Docker in Docker
@y
{: #rootless-docker-in-docker }
### Rootless Docker in Docker
@z

@x
To run Rootless Docker inside "rootful" Docker, use the `docker:<version>-dind-rootless`
image instead of `docker:<version>-dind`.
@y
「完全な root」で動作する Docker 内において Rootless Docker を起動するには、`docker:<version>-dind`イメージの代わりに`docker:<version>-dind-rootless`イメージを利用します。
@z

@x
```console
$ docker run -d --name dind-rootless --privileged docker:20.10-dind-rootless
```
@y
```console
$ docker run -d --name dind-rootless --privileged docker:20.10-dind-rootless
```
@z

@x
The `docker:<version>-dind-rootless` image runs as a non-root user (UID 1000).
However, `--privileged` is required for disabling seccomp, AppArmor, and mount
masks.
@y
`docker:<version>-dind-rootless`イメージは非 root ユーザー（UID 1000）により動作します。
ただし seccomp、AppArmor、マウントマスクを無効化するには`--privileged`の指定が必要です。
@z

@x
### Expose Docker API socket through TCP
@y
{: #expose-docker-api-socket-through-tcp }
### TCP を通じた Docker API ソケットの公開
@z

@x
To expose the Docker API socket through TCP, you need to launch `dockerd-rootless.sh`
with `DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp"`.
@y
TCP を通じて Docker API ソケットを公開するには、`dockerd-rootless.sh`の実行にあたって`DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp"`を指定する必要があります。
@z

@x
```console
$ DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp" \
  dockerd-rootless.sh \
  -H tcp://0.0.0.0:2376 \
  --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem
```
@y
```console
$ DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS="-p 0.0.0.0:2376:2376/tcp" \
  dockerd-rootless.sh \
  -H tcp://0.0.0.0:2376 \
  --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem
```
@z

@x
### Expose Docker API socket through SSH
@y
{: #expose-docker-api-socket-through-ssh }
### SSH を通じた Docker API ソケットの公開
@z

@x
To expose the Docker API socket through SSH, you need to make sure `$DOCKER_HOST`
is set on the remote host.
@y
SSH を通じて Docker API ソケットを公開するには、リモートホスト上において`$DOCKER_HOST`を設定することが必要です。
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
{: #routing-ping-packets }
### ping パケットのルーティング
@z

@x
On some distributions, `ping` does not work by default.
@y
ディストリビューションの中には、デフォルトで`ping`が動作しないものがあります。
@z

@x
Add `net.ipv4.ping_group_range = 0   2147483647` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system` to allow using `ping`.
@y
`ping`を利用するためには`/etc/sysctl.conf`に（あるいは`/etc/sysctl.d`に）`net.ipv4.ping_group_range = 0   2147483647`を追加して`sudo sysctl --system`を実行します。
@z

@x
### Exposing privileged ports
@y
{: #exposing-privileged-ports }
### 特権ポートの公開
@z

@x
To expose privileged ports (< 1024), set `CAP_NET_BIND_SERVICE` on `rootlesskit` binary and restart the daemon.
@y
特権ポート（1024 未満）を公開するには、`rootlesskit`バイナリに対して`CAP_NET_BIND_SERVICE`を設定して、デーモンを再起動します。
@z

@x
```console
$ sudo setcap cap_net_bind_service=ep $(which rootlesskit)
$ systemctl --user restart docker
```
@y
```console
$ sudo setcap cap_net_bind_service=ep $(which rootlesskit)
$ systemctl --user restart docker
```
@z

@x
Or add `net.ipv4.ip_unprivileged_port_start=0` to `/etc/sysctl.conf` (or
`/etc/sysctl.d`) and run `sudo sysctl --system`.
@y
または`/etc/sysctl.conf`（あるいは`/etc/sysctl.d`）に`net.ipv4.ip_unprivileged_port_start=0`を追加して`sudo sysctl --system`を実行します。
@z

@x
### Limiting resources
@y
{: #limiting-resources }
### リソースの利用制限
@z

@x
Limiting resources with cgroup-related `docker run` flags such as `--cpus`, `--memory`, `--pids-limit`
is supported only when running with cgroup v2 and systemd.
See [Changing cgroup version](../../config/containers/runmetrics.md) to enable cgroup v2.
@y
Limiting resources with cgroup-related `docker run` flags such as `--cpus`, `--memory`, `--pids-limit`
is supported only when running with cgroup v2 and systemd.
See [Changing cgroup version](../../config/containers/runmetrics.md) to enable cgroup v2.
@z

@x
If `docker info` shows `none` as `Cgroup Driver`, the conditions are not satisfied.
When these conditions are not satisfied, rootless mode ignores the cgroup-related `docker run` flags.
See [Limiting resources without cgroup](#limiting-resources-without-cgroup) for workarounds.
@y
If `docker info` shows `none` as `Cgroup Driver`, the conditions are not satisfied.
When these conditions are not satisfied, rootless mode ignores the cgroup-related `docker run` flags.
See [Limiting resources without cgroup](#limiting-resources-without-cgroup) for workarounds.
@z

@x
If `docker info` shows `systemd` as `Cgroup Driver`, the conditions are satisfied.
However, typically, only `memory` and `pids` controllers are delegated to non-root users by default.
@y
If `docker info` shows `systemd` as `Cgroup Driver`, the conditions are satisfied.
However, typically, only `memory` and `pids` controllers are delegated to non-root users by default.
@z

@x
```console
$ cat /sys/fs/cgroup/user.slice/user-$(id -u).slice/user@$(id -u).service/cgroup.controllers
memory pids
```
@y
```console
$ cat /sys/fs/cgroup/user.slice/user-$(id -u).slice/user@$(id -u).service/cgroup.controllers
memory pids
```
@z

@x
To allow delegation of all controllers, you need to change the systemd configuration as follows:
@y
To allow delegation of all controllers, you need to change the systemd configuration as follows:
@z

@x
```console
# mkdir -p /etc/systemd/system/user@.service.d
# cat > /etc/systemd/system/user@.service.d/delegate.conf << EOF
[Service]
Delegate=cpu cpuset io memory pids
EOF
# systemctl daemon-reload
```
@y
```console
# mkdir -p /etc/systemd/system/user@.service.d
# cat > /etc/systemd/system/user@.service.d/delegate.conf << EOF
[Service]
Delegate=cpu cpuset io memory pids
EOF
# systemctl daemon-reload
```
@z

@x
> **Note**
>
> Delegating `cpuset` requires systemd 244 or later.
@y
> **メモ**
>
> `cpuset`のデリゲートには systemd 244 またはそれ以降が必要です。
@z

@x
#### Limiting resources without cgroup
@y
#### Limiting resources without cgroup
@z

@x
Even when cgroup is not available, you can still use the traditional `ulimit` and [`cpulimit`](https://github.com/opsengine/cpulimit),
though they work in process-granularity rather than in container-granularity,
and can be arbitrarily disabled by the container process.
@y
Even when cgroup is not available, you can still use the traditional `ulimit` and [`cpulimit`](https://github.com/opsengine/cpulimit),
though they work in process-granularity rather than in container-granularity,
and can be arbitrarily disabled by the container process.
@z

@x
For example:
@y
たとえば以下です。
@z

@x
- To limit CPU usage to 0.5 cores (similar to `docker run --cpus 0.5`):
  `docker run <IMAGE> cpulimit --limit=50 --include-children <COMMAND>`
- To limit max VSZ to 64MiB (similar to `docker run --memory 64m`):
  `docker run <IMAGE> sh -c "ulimit -v 65536; <COMMAND>"`
@y
- （`docker run --cpus 0.5`と同じように）CPU 利用量を 0.5 コアに制限するには、`docker run <IMAGE> cpulimit --limit=50 --include-children <COMMAND>` を実行します。
- （`docker run --memory 64m`と同じように）VSZ の最大値を 64 MiB に制限するには、`docker run <IMAGE> sh -c "ulimit -v 65536; <COMMAND>"`を実行します。
@z

@x
- To limit max number of processes to 100 per namespaced UID 2000
  (similar to `docker run --pids-limit=100`):
  `docker run --user 2000 --ulimit nproc=100 <IMAGE> <COMMAND>`
@y
- （`docker run --pids-limit=100`と同じように）最大プロセス数を UID 2000 の名前空間ごとに 100 とするには`docker run --user 2000 --ulimit nproc=100 <IMAGE> <COMMAND>`を実行します。
@z

@x
## Troubleshooting
@y
{: #troubleshooting }
## トラブルシューティング
@z

@x
### Errors when starting the Docker daemon
@y
### Errors when starting the Docker daemon
@z

@x
**[rootlesskit:parent] error: failed to start the child: fork/exec /proc/self/exe: operation not permitted**
@y
**[rootlesskit:parent] error: failed to start the child: fork/exec /proc/self/exe: operation not permitted**
@z

@x
This error occurs mostly when the value of `/proc/sys/kernel/unprivileged_userns_clone ` is set to 0:
@y
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
To fix this issue, add  `kernel.unprivileged_userns_clone=1` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@z

@x
**[rootlesskit:parent] error: failed to start the child: fork/exec /proc/self/exe: no space left on device**
@y
**[rootlesskit:parent] error: failed to start the child: fork/exec /proc/self/exe: no space left on device**
@z

@x
This error occurs mostly when the value of `/proc/sys/user/max_user_namespaces` is too small:
@y
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
To fix this issue, add  `user.max_user_namespaces=28633` to
`/etc/sysctl.conf` (or `/etc/sysctl.d`) and run `sudo sysctl --system`.
@z

@x
**[rootlesskit:parent] error: failed to setup UID/GID map: failed to compute uid/gid map: No subuid ranges found for user 1001 ("testuser")**
@y
**[rootlesskit:parent] error: failed to setup UID/GID map: failed to compute uid/gid map: No subuid ranges found for user 1001 ("testuser")**
@z

@x
This error occurs when `/etc/subuid` and `/etc/subgid` are not configured. See [Prerequisites](#prerequisites).
@y
This error occurs when `/etc/subuid` and `/etc/subgid` are not configured. See [Prerequisites](#prerequisites).
@z

@x
**could not get XDG_RUNTIME_DIR**
@y
**could not get XDG_RUNTIME_DIR**
@z

@x
This error occurs when `$XDG_RUNTIME_DIR` is not set.
@y
This error occurs when `$XDG_RUNTIME_DIR` is not set.
@z

@x
On a non-systemd host, you need to create a directory and then set the path:
@y
On a non-systemd host, you need to create a directory and then set the path:
@z

@x
```console
$ export XDG_RUNTIME_DIR=$HOME/.docker/xrd
$ rm -rf $XDG_RUNTIME_DIR
$ mkdir -p $XDG_RUNTIME_DIR
$ dockerd-rootless.sh
```
@y
```console
$ export XDG_RUNTIME_DIR=$HOME/.docker/xrd
$ rm -rf $XDG_RUNTIME_DIR
$ mkdir -p $XDG_RUNTIME_DIR
$ dockerd-rootless.sh
```
@z

@x
> **Note**:
> You must remove the directory every time you log out.
@y
> **Note**:
> You must remove the directory every time you log out.
@z

@x
On a systemd host, log into the host using `pam_systemd` (see below).
The value is automatically set to `/run/user/$UID` and cleaned up on every logout.
@y
On a systemd host, log into the host using `pam_systemd` (see below).
The value is automatically set to `/run/user/$UID` and cleaned up on every logout.
@z

@x
**`systemctl --user` fails with "Failed to connect to bus: No such file or directory"**
@y
**`systemctl --user` fails with "Failed to connect to bus: No such file or directory"**
@z

@x
This error occurs mostly when you switch from the root user to an non-root user with `sudo`:
@y
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
Instead of `sudo -iu <USERNAME>`, you need to log in using `pam_systemd`. For example:
@z

@x
- Log in through the graphic console
- `ssh <USERNAME>@localhost`
- `machinectl shell <USERNAME>@`
@y
- Log in through the graphic console
- `ssh <USERNAME>@localhost`
- `machinectl shell <USERNAME>@`
@z

@x
**The daemon does not start up automatically**
@y
**The daemon does not start up automatically**
@z

@x
You need `sudo loginctl enable-linger $(whoami)` to enable the daemon to start
up automatically. See [Usage](#usage).
@y
You need `sudo loginctl enable-linger $(whoami)` to enable the daemon to start
up automatically. See [Usage](#usage).
@z

@x
**iptables failed: iptables -t nat -N DOCKER: Fatal: can't open lock file /run/xtables.lock: Permission denied**
@y
**iptables failed: iptables -t nat -N DOCKER: Fatal: can't open lock file /run/xtables.lock: Permission denied**
@z

@x
This error may happen with an older version of Docker when SELinux is enabled on the host.
@y
This error may happen with an older version of Docker when SELinux is enabled on the host.
@z

@x
The issue has been fixed in Docker 20.10.8.
A known workaround for older version of Docker is to run the following commands to disable SELinux for `iptables`:
@y
The issue has been fixed in Docker 20.10.8.
A known workaround for older version of Docker is to run the following commands to disable SELinux for `iptables`:
@z

@x
```console
$ sudo dnf install -y policycoreutils-python-utils && sudo semanage permissive -a iptables_t
```
@y
```console
$ sudo dnf install -y policycoreutils-python-utils && sudo semanage permissive -a iptables_t
```
@z

@x
### `docker pull` errors
@y
### `docker pull` errors
@z

@x
**docker: failed to register layer: Error processing tar file(exit status 1): lchown &lt;FILE&gt;: invalid argument**
@y
**docker: failed to register layer: Error processing tar file(exit status 1): lchown &lt;FILE&gt;: invalid argument**
@z

@x
This error occurs when the number of available entries in `/etc/subuid` or
`/etc/subgid` is not sufficient. The number of entries required vary across
images. However, 65,536 entries are sufficient for most images. See
[Prerequisites](#prerequisites).
@y
This error occurs when the number of available entries in `/etc/subuid` or
`/etc/subgid` is not sufficient. The number of entries required vary across
images. However, 65,536 entries are sufficient for most images. See
[Prerequisites](#prerequisites).
@z

@x
**docker: failed to register layer: ApplyLayer exit status 1 stdout:  stderr: lchown &lt;FILE&gt;: operation not permitted**
@y
**docker: failed to register layer: ApplyLayer exit status 1 stdout:  stderr: lchown &lt;FILE&gt;: operation not permitted**
@z

@x
This error occurs mostly when `~/.local/share/docker` is located on NFS.
@y
This error occurs mostly when `~/.local/share/docker` is located on NFS.
@z

@x
A workaround is to specify non-NFS `data-root` directory in `~/.config/docker/daemon.json` as follows:
@y
A workaround is to specify non-NFS `data-root` directory in `~/.config/docker/daemon.json` as follows:
@z

@x
```json
{"data-root":"/somewhere-out-of-nfs"}
```
@y
```json
{"data-root":"/somewhere-out-of-nfs"}
```
@z

@x
### `docker run` errors
@y
### `docker run` errors
@z

@x
**docker: Error response from daemon: OCI runtime create failed: ...: read unix @-&gt;/run/systemd/private: read: connection reset by peer: unknown.**
@y
**docker: Error response from daemon: OCI runtime create failed: ...: read unix @-&gt;/run/systemd/private: read: connection reset by peer: unknown.**
@z

@x
This error occurs on cgroup v2 hosts mostly when the dbus daemon is not running for the user.
@y
This error occurs on cgroup v2 hosts mostly when the dbus daemon is not running for the user.
@z

@x
```console
$ systemctl --user is-active dbus
inactive

$ docker run hello-world
docker: Error response from daemon: OCI runtime create failed: container_linux.go:380: starting container process caused: process_linux.go:385: applying cgroup configuration for process caused: error while starting unit "docker
-931c15729b5a968ce803784d04c7421f791d87e5ca1891f34387bb9f694c488e.scope" with properties [{Name:Description Value:"libcontainer container 931c15729b5a968ce803784d04c7421f791d87e5ca1891f34387bb9f694c488e"} {Name:Slice Value:"use
r.slice"} {Name:PIDs Value:@au [4529]} {Name:Delegate Value:true} {Name:MemoryAccounting Value:true} {Name:CPUAccounting Value:true} {Name:IOAccounting Value:true} {Name:TasksAccounting Value:true} {Name:DefaultDependencies Val
ue:false}]: read unix @->/run/systemd/private: read: connection reset by peer: unknown.
```
@y
```console
$ systemctl --user is-active dbus
inactive

$ docker run hello-world
docker: Error response from daemon: OCI runtime create failed: container_linux.go:380: starting container process caused: process_linux.go:385: applying cgroup configuration for process caused: error while starting unit "docker
-931c15729b5a968ce803784d04c7421f791d87e5ca1891f34387bb9f694c488e.scope" with properties [{Name:Description Value:"libcontainer container 931c15729b5a968ce803784d04c7421f791d87e5ca1891f34387bb9f694c488e"} {Name:Slice Value:"use
r.slice"} {Name:PIDs Value:@au [4529]} {Name:Delegate Value:true} {Name:MemoryAccounting Value:true} {Name:CPUAccounting Value:true} {Name:IOAccounting Value:true} {Name:TasksAccounting Value:true} {Name:DefaultDependencies Val
ue:false}]: read unix @->/run/systemd/private: read: connection reset by peer: unknown.
```
@z

@x
To fix the issue, run `sudo apt-get install -y dbus-user-session` or `sudo dnf install -y dbus-daemon`, and then relogin.
@y
To fix the issue, run `sudo apt-get install -y dbus-user-session` or `sudo dnf install -y dbus-daemon`, and then relogin.
@z

@x
If the error still occurs, try running `systemctl --user enable --now dbus` (without sudo).
@y
If the error still occurs, try running `systemctl --user enable --now dbus` (without sudo).
@z

@x
**`--cpus`, `--memory`, and `--pids-limit` are ignored**
@y
**`--cpus`, `--memory`, and `--pids-limit` are ignored**
@z

@x
This is an expected behavior on cgroup v1 mode.
To use these flags, the host needs to be configured for enabling cgroup v2.
For more information, see [Limiting resources](#limiting-resources).
@y
This is an expected behavior on cgroup v1 mode.
To use these flags, the host needs to be configured for enabling cgroup v2.
For more information, see [Limiting resources](#limiting-resources).
@z

@x
### Networking errors
@y
### Networking errors
@z

@x
**`docker run -p` fails with `cannot expose privileged port`**
@y
**`docker run -p` fails with `cannot expose privileged port`**
@z

@x
`docker run -p` fails with this error when a privileged port (< 1024) is specified as the host port.
@y
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
To allow exposing privileged ports, see [Exposing privileged ports](#exposing-privileged-ports).
@z

@x
**ping doesn't work**
@y
**ping doesn't work**
@z

@x
Ping does not work when `/proc/sys/net/ipv4/ping_group_range` is set to `1 0`:
@y
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
For details, see [Routing ping packets](#routing-ping-packets).
@z

@x
**`IPAddress` shown in `docker inspect` is unreachable**
@y
**`IPAddress` shown in `docker inspect` is unreachable**
@z

@x
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@y
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@z

@x
**`--net=host` doesn't listen ports on the host network namespace**
@y
**`--net=host` doesn't listen ports on the host network namespace**
@z

@x
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@y
This is an expected behavior, as the daemon is namespaced inside RootlessKit's
network namespace. Use `docker run -p` instead.
@z

@x
**Network is slow**
@y
**Network is slow**
@z

@x
Docker with rootless mode uses [slirp4netns](https://github.com/rootless-containers/slirp4netns) as the default network stack if slirp4netns v0.4.0 or later is installed.
If slirp4netns is not installed, Docker falls back to [VPNKit](https://github.com/moby/vpnkit).
@y
Docker with rootless mode uses [slirp4netns](https://github.com/rootless-containers/slirp4netns) as the default network stack if slirp4netns v0.4.0 or later is installed.
If slirp4netns is not installed, Docker falls back to [VPNKit](https://github.com/moby/vpnkit).
@z

@x
Installing slirp4netns may improve the network throughput.
See [RootlessKit documentation](https://github.com/rootless-containers/rootlesskit/tree/v0.13.0#network-drivers) for the benchmark result.
@y
Installing slirp4netns may improve the network throughput.
See [RootlessKit documentation](https://github.com/rootless-containers/rootlesskit/tree/v0.13.0#network-drivers) for the benchmark result.
@z

@x
Also, changing MTU value may improve the throughput.
The MTU value can be specified by creating `~/.config/systemd/user/docker.service.d/override.conf` with the following content:
@y
Also, changing MTU value may improve the throughput.
The MTU value can be specified by creating `~/.config/systemd/user/docker.service.d/override.conf` with the following content:
@z

@x
```systemd
[Service]
Environment="DOCKERD_ROOTLESS_ROOTLESSKIT_MTU=<INTEGER>"
```
@y
```systemd
[Service]
Environment="DOCKERD_ROOTLESS_ROOTLESSKIT_MTU=<INTEGER>"
```
@z

@x
And then restart the daemon:
@y
And then restart the daemon:
@z

@x
```console
$ systemctl --user daemon-reload
$ systemctl --user restart docker
```
@y
```console
$ systemctl --user daemon-reload
$ systemctl --user restart docker
```
@z

@x
**`docker run -p` does not propagate source IP addresses**
@y
**`docker run -p` does not propagate source IP addresses**
@z

@x
This is because Docker with rootless mode uses RootlessKit's builtin port driver by default.
@y
@z

@x
The source IP addresses can be propagated by creating `~/.config/systemd/user/docker.service.d/override.conf` with the following content:
@y
The source IP addresses can be propagated by creating `~/.config/systemd/user/docker.service.d/override.conf` with the following content:
@z

@x
```systemd
[Service]
Environment="DOCKERD_ROOTLESS_ROOTLESSKIT_PORT_DRIVER=slirp4netns"
```
@y
```systemd
[Service]
Environment="DOCKERD_ROOTLESS_ROOTLESSKIT_PORT_DRIVER=slirp4netns"
```
@z

@x
And then restart the daemon:
@y
And then restart the daemon:
@z

@x
```console
$ systemctl --user daemon-reload
$ systemctl --user restart docker
```
@y
```console
$ systemctl --user daemon-reload
$ systemctl --user restart docker
```
@z

@x
Note that this configuration decreases throughput.
See [RootlessKit documentation](https://github.com/rootless-containers/rootlesskit/tree/v0.13.0#port-drivers) for the benchmark result.
@y
Note that this configuration decreases throughput.
See [RootlessKit documentation](https://github.com/rootless-containers/rootlesskit/tree/v0.13.0#port-drivers) for the benchmark result.
@z

@x
### Tips for debugging
@y
{: #tips-for-debugging }
### Tips for debugging
@z

@x
**Entering into `dockerd` namespaces**
@y
**Entering into `dockerd` namespaces**
@z

@x
The `dockerd-rootless.sh` script executes `dockerd` in its own user, mount, and network namespaces.
@y
The `dockerd-rootless.sh` script executes `dockerd` in its own user, mount, and network namespaces.
@z

@x
For debugging, you can enter the namespaces by running
`nsenter -U --preserve-credentials -n -m -t $(cat $XDG_RUNTIME_DIR/docker.pid)`.
@y
For debugging, you can enter the namespaces by running
`nsenter -U --preserve-credentials -n -m -t $(cat $XDG_RUNTIME_DIR/docker.pid)`.
@z
