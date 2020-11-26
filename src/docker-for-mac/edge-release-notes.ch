%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Change log / release notes per Edge release
keywords: Docker Desktop for Mac, edge, release notes
title: Docker Desktop for Mac Edge release notes
toc_min: 1
toc_max: 2
---
@y
---
description: Change log / release notes per Edge release
keywords: Docker Desktop for Mac, edge, release notes
title: Docker Desktop for Mac 最新版リリースノート
toc_min: 1
toc_max: 2
---
@z

@x
This page contains information about Docker Desktop Edge releases. Edge releases give you early access to our newest features. Note that some of the features may be experimental, and some of them may not ever reach the Stable release.
@y
{% comment %}
This page contains information about Docker Desktop Edge releases. Edge releases give you early access to our newest features. Note that some of the features may be experimental, and some of them may not ever reach the Stable release.
{% endcomment %}
このページは Docker Desktop 最新版（Edge）に関する情報を示します。
最新版では、最新の機能をいち早く試すことができます。
その機能の中には試験的なものが含まれており、安定版のレベルには達していないものもあります。
@z

@x
For information about Stable releases, see the [Stable release notes](release-notes.md). For Docker Desktop system requirements, see
[What to know before you install](install.md#what-to-know-before-you-install).
@y
{% comment %}
For information about Stable releases, see the [Stable release notes](release-notes.md). For Docker Desktop system requirements, see
[What to know before you install](install.md#what-to-know-before-you-install).
{% endcomment %}
安定版についての情報は [安定版リリースノート](release-notes.md) を参照してください。
Docker Desktop のシステム要件については [インストールの前に](install.md#what-to-know-before-you-install) を参照してください。
@z

@x
## Docker Desktop Community 2.5.2
2020-11-26
@y
## Docker Desktop Community 2.5.2
2020-11-26
@z

@x
> [Download](https://desktop.docker.com/mac/edge/50165/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/50165/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/50165/Docker.dmg)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new }
### 新機能
@z

@x
- Use of three digit version number.
- Starting with Docker Desktop 2.5.2, updates will be much smaller as they will be applied using delta patches.
@y
{% comment %}
- Use of three digit version number.
- Starting with Docker Desktop 2.5.2, updates will be much smaller as they will be applied using delta patches.
{% endcomment %}
- 3 桁のバージョン番号を用いるようにしました。
- Docker Desktop 2.5.2 から、リリース更新はより小さなものにし、デルタパッチを用いて適用するものにしました。
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes }
### バグフィックスとマイナーチェンジ
@z

@x
- Re-enabled the experimental SOCKS proxy. Fixes [docker/for-mac#5048](https://github.com/docker/for-mac/issues/5048).
- Fixed an unexpected EOF error when trying to start a non-existing container with `-v /var/run/docker.sock:`. See [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025).
- Display an error message instead of crashing when the application needs write access on specific directories. See [docker/for-mac#5068](https://github.com/docker/for-mac/issues/5068)
@y
{% comment %}
- Re-enabled the experimental SOCKS proxy. Fixes [docker/for-mac#5048](https://github.com/docker/for-mac/issues/5048).
- Fixed an unexpected EOF error when trying to start a non-existing container with `-v /var/run/docker.sock:`. See [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025).
- Display an error message instead of crashing when the application needs write access on specific directories. See [docker/for-mac#5068](https://github.com/docker/for-mac/issues/5068)
{% endcomment %}
- 試験的な SOCKS プロキシーを再度有効にしました。
  [docker/for-mac#5048](https://github.com/docker/for-mac/issues/5048) を Fix に。
- `-v /var/run/docker.sock:` を指定により、存在しないコンテナーを起動しようとして、予期しない EOF エラーとなる点を修正しました。
  [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025) を参照のこと。
- アプリケーションが特定のディレクトリへの書き込み権限を必要とする際に、クラッシュせずにエラーメッセージを表示するようにしました。
  [docker/for-mac#5068](https://github.com/docker/for-mac/issues/5068) を参照のこと。
@z

@x
## Docker Desktop Community 2.5.1.0
2020-11-18
@y
## Docker Desktop Community 2.5.1.0
2020-11-18
@z

@x
> [Download](https://desktop.docker.com/mac/edge/49923/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/49923/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/49923/Docker.dmg)
@z

@x
This release contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing Docker Desktop.
@y
{% comment %}
This release contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing Docker Desktop.
{% endcomment %}
本リリースには Kubernetes のアップグレードが含まれます。
本バージョンのインストール後は、ローカルの Kubernetes クラスターはリセットされます。
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades }
### アップグレード
@z

@x
- [Docker Engine 20.10.0-rc1](https://github.com/docker/docker-ce/blob/master/CHANGELOG.md#20100)
- [Compose CLI v1.0.2](https://github.com/docker/compose-cli/releases/tag/v1.0.2)
- [Snyk v1.424.4](https://github.com/snyk/snyk/releases/tag/v1.424.4)
- [Kubernetes 1.19.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.3)
@y
- [Docker Engine 20.10.0-rc1](https://github.com/docker/docker-ce/blob/master/CHANGELOG.md#20100)
- [Compose CLI v1.0.2](https://github.com/docker/compose-cli/releases/tag/v1.0.2)
- [Snyk v1.424.4](https://github.com/snyk/snyk/releases/tag/v1.424.4)
- [Kubernetes 1.19.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.3)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-1 }
### バグフィックスとマイナーチェンジ
@z

@x
- Renamed 'Run Diagnostics' to 'Get support'.
- Fixed an issue that caused Docker Desktop to crash on MacOS 11.0 (Big Sur) when VirtualBox was also installed. See [docker/for-mac#4997](https://github.com/docker/for-mac/issues/4997).
- Removed BlueStacks warning message. Fixes [docker/for-mac#4863](https://github.com/docker/for-mac/issues/4863).
- Made container start faster in cases where shared volumes have lots of files. Fixes [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957).
- File sharing: fixed changing ownership of read-only files. Fixes [docker/for-mac#4989](https://github.com/docker/for-mac/issues/4989), [docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964).
- Fixed an unexpected EOF error when trying to start a non-existing container. See [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025).
@y
{% comment %}
- Renamed 'Run Diagnostics' to 'Get support'.
- Fixed an issue that caused Docker Desktop to crash on MacOS 11.0 (Big Sur) when VirtualBox was also installed. See [docker/for-mac#4997](https://github.com/docker/for-mac/issues/4997).
- Removed BlueStacks warning message. Fixes [docker/for-mac#4863](https://github.com/docker/for-mac/issues/4863).
- Made container start faster in cases where shared volumes have lots of files. Fixes [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957).
- File sharing: fixed changing ownership of read-only files. Fixes [docker/for-mac#4989](https://github.com/docker/for-mac/issues/4989), [docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964).
- Fixed an unexpected EOF error when trying to start a non-existing container. See [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025).
{% endcomment %}
- 「Run Diagnostics」を「Get support」に名称変更しました。
- MacOS 11.0（Big Sur）において VirtualBox がインストールされている場合に、Docker Desktop がクラッシュする問題を修正しました。
  [docker/for-mac#4997](https://github.com/docker/for-mac/issues/4997) を参照のこと。
- BlueStacks の警告メッセージを削除しました。
  [docker/for-mac#4863](https://github.com/docker/for-mac/issues/4863) を Fix に。
- 共有ボリュームに大量のファイルがある場合でも、コンテナーの起動を速くしました。
  [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957) を Fix に。
- ファイル共有： 読み込み専用ファイルの所有者変更を修正しました。
  [docker/for-mac#4989](https://github.com/docker/for-mac/issues/4989)、[docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964) を Fix に。
- 存在しないコンテナーを起動しようとして、予期しない EOF エラーとなる点を修正しました。
  [docker/for-mac#5025](https://github.com/docker/for-mac/issues/5025) を参照のこと。
@z

@x
## Docker Desktop Community 2.4.2.0
2020-10-19
@y
## Docker Desktop Community 2.4.2.0
2020-10-19
@z

@x
> [Download](https://desktop.docker.com/mac/edge/48975/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/48975/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/48975/Docker.dmg)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-1 }
### 新機能
@z

@x
- If you have enabled [Vulnerability Scanning](/docker-hub/vulnerability-scanning/) in Docker Hub, the scan results will now appear in Docker Desktop.
@y
{% comment %}
- If you have enabled [Vulnerability Scanning](/docker-hub/vulnerability-scanning/) in Docker Hub, the scan results will now appear in Docker Desktop.
{% endcomment %}
- Docker Hub において [ぜい弱性スキャン]({{ site.baseurl }}/docker-hub/vulnerability-scanning/) を有効にしている場合、スキャン結果が Docker Desktop 上に表示されるようになりました。
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-1 }
### アップグレード
@z

@x
- [Docker Engine 20.10.0 beta1](https://github.com/docker/docker-ce/blob/0fc7084265b3786a5867ec311d3f916af7bf7a23/CHANGELOG.md)
- [Docker Compose CLI - 0.1.22](https://github.com/docker/compose-cli/releases/tag/v0.1.22)
- [Linux kernel 5.4.39](https://hub.docker.com/layers/linuxkit/kernel/5.4.39-f39f83d0d475b274938c86eaa796022bfc7063d2/images/sha256-8614670219aca0bb276d4749e479591b60cd348abc770ac9ecd09ee4c1575405?context=explore).
- [Kubernetes 1.19.2](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.2)
- [Go 1.15.2](https://github.com/golang/go/issues?q=milestone:Go1.15.2+label:CherryPickApproved)
@y
- [Docker Engine 20.10.0 beta1](https://github.com/docker/docker-ce/blob/0fc7084265b3786a5867ec311d3f916af7bf7a23/CHANGELOG.md)
- [Docker Compose CLI - 0.1.22](https://github.com/docker/compose-cli/releases/tag/v0.1.22)
- [Linux kernel 5.4.39](https://hub.docker.com/layers/linuxkit/kernel/5.4.39-f39f83d0d475b274938c86eaa796022bfc7063d2/images/sha256-8614670219aca0bb276d4749e479591b60cd348abc770ac9ecd09ee4c1575405?context=explore).
- [Kubernetes 1.19.2](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.2)
- [Go 1.15.2](https://github.com/golang/go/issues?q=milestone:Go1.15.2+label:CherryPickApproved)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-2 }
### バグフィックスとマイナーチェンジ
@z

@x
- When sharing Linux directories (`/var`, `/bin`, etc) with containers, Docker Desktop avoids watching paths in the host file system.
- When sharing a file into a container (e.g. `docker run -v ~/.gitconfig`) Docker Desktop does not watch the parent directory. Fixes [docker/for-mac#4981](https://github.com/docker/for-mac/issues/4981).
- gRPC FUSE: fix `chown` when the file is read-only. Fixes `rabbitmq`, see [docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964).
- gRPC FUSE: generate `ATTRIB` inotify events as well as `MODIFY`. Fixes [docker/for-mac#4962](https://github.com/docker/for-mac/issues/4962).
- gRPC FUSE: return `EOPNOTSUPP` from `fallocate` for unsupported modes. Fixes `minio`. See [docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964).
- Fixed an issue related to NFS mounting. See [docker/for-mac#4958](https://github.com/docker/for-mac/issues/4958).
- Always flush file system caches synchronously on container start. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).
- Allow symlinks to point outside of shared volumes. Fixes [docker/for-mac#4862](https://github.com/docker/for-mac/issues/4862).
- Diagnostics: avoid hanging when Kubernetes is in a broken state.
- Fixed automatic start on log in. See [docker/for-mac#4877] and [docker/for-mac#4890].
@y
{% comment %}
- When sharing Linux directories (`/var`, `/bin`, etc) with containers, Docker Desktop avoids watching paths in the host file system.
- When sharing a file into a container (e.g. `docker run -v ~/.gitconfig`) Docker Desktop does not watch the parent directory. Fixes [docker/for-mac#4981](https://github.com/docker/for-mac/issues/4981).
- gRPC FUSE: fix `chown` when the file is read-only. Fixes `rabbitmq`, see [docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964).
- gRPC FUSE: generate `ATTRIB` inotify events as well as `MODIFY`. Fixes [docker/for-mac#4962](https://github.com/docker/for-mac/issues/4962).
- gRPC FUSE: return `EOPNOTSUPP` from `fallocate` for unsupported modes. Fixes `minio`. See [docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964).
- Fixed an issue related to NFS mounting. See [docker/for-mac#4958](https://github.com/docker/for-mac/issues/4958).
- Always flush file system caches synchronously on container start. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).
- Allow symlinks to point outside of shared volumes. Fixes [docker/for-mac#4862](https://github.com/docker/for-mac/issues/4862).
- Diagnostics: avoid hanging when Kubernetes is in a broken state.
- Fixed automatic start on log in. See [docker/for-mac#4877] and [docker/for-mac#4890].
{% endcomment %}
- コンテナーにおいて Linux ディレクトリ（`/var`、`/bin`など）を共有している場合、Docker Desktop がホストファイルシステムのパスを監視しないようにしました。
- コンテナー内にファイル共有（たとえば`docker run -v ~/.gitconfig`）を行っている場合に、Docker Desktop が親ディレクトリを監視しないようにしました。[docker/for-mac#4981](https://github.com/docker/for-mac/issues/4981) を Fix に。
- gRPC FUSE: ファイルが読み込み専用のときの`chown`を修正しました。`rabbitmq`を修正しました。[docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964) を参照のこと。
- gRPC FUSE: `MODIFY`と同様、`ATTRIB` inotify イベントを生成するようにしました。[docker/for-mac#4962](https://github.com/docker/for-mac/issues/4962) を Fix に。
- gRPC FUSE: 未サポートモード時に`fallocate`から`EOPNOTSUPP`を返すようにしました。`minio`を修正しました。[docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964) を参照してください。
- NFS マウントに関する問題を修正しました。[docker/for-mac#4958](https://github.com/docker/for-mac/issues/4958) を参照してください。
- コンテナー起動時に常にファイルシステムキャッシュを同期して書き出すようにしました。[docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943) を参照してください。
- 共有ボリュームの外部を指し示すシンボリックリンクを可能にしました。[docker/for-mac#4862](https://github.com/docker/for-mac/issues/4862) を Fix に。
- 診断処理: Kubernetes が破損状態にあるときの処理停止を回避しました。
- ログイン時の自動起動を修正しました。[docker/for-mac#4877] と [docker/for-mac#4890] を参照してください。
@z

@x
## Docker Desktop Community 2.4.1.0
2020-10-01
@y
## Docker Desktop Community 2.4.1.0
2020-10-01
@z

@x
> [Download](https://desktop.docker.com/mac/edge/48583/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/48583/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/48583/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-2 }
### アップグレード
@z

@x
- [Docker Compose CLI - 0.1.18](https://github.com/docker/compose-cli)
- [Docker Compose 1.27.4](https://github.com/docker/compose/releases/tag/1.27.4)
- [Snyk v1.399.1](https://github.com/snyk/snyk/releases/tag/v1.399.1)
- [Docker Engine 19.03.13](https://github.com/docker/docker-ce/releases/tag/v19.03.13)
@y
- [Docker Compose CLI - 0.1.18](https://github.com/docker/compose-cli)
- [Docker Compose 1.27.4](https://github.com/docker/compose/releases/tag/1.27.4)
- [Snyk v1.399.1](https://github.com/snyk/snyk/releases/tag/v1.399.1)
- [Docker Engine 19.03.13](https://github.com/docker/docker-ce/releases/tag/v19.03.13)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-3 }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop always flushes filesystem caches synchronously on container start. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).
- Docker Desktop now supports `S_ISUID`, `S_ISGID` and `S_ISVTX` in calls to `chmod(2)` on shared filesystems. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).
- Fixed a possible premature file handle close when using `gRPC-FUSE`.
@y
{% comment %}
- Docker Desktop always flushes filesystem caches synchronously on container start. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).
- Docker Desktop now supports `S_ISUID`, `S_ISGID` and `S_ISVTX` in calls to `chmod(2)` on shared filesystems. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).
- Fixed a possible premature file handle close when using `gRPC-FUSE`.
{% endcomment %}
- Docker Desktop では、コンテナー起動時に常にファイルシステムキャッシュを同期して書き出すようにしました。
  [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943) を参照してください。
- Docker Desktop では、共有ファイルシステム上において`chmod(2)`呼び出しにおける`S_ISUID`、`S_ISGID`、`S_ISVTX`をサポートするようにしました。
  [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943) を参照してください。
- `gRPC-FUSE`を使用した際にファイルハンドルが閉じる可能性があったため修正。
@z

@x
## Docker Desktop Community 2.3.7.0
2020-09-17
@y
## Docker Desktop Community 2.3.7.0
2020-09-17
@z

@x
> [Download](https://desktop.docker.com/mac/edge/48173/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/48173/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/48173/Docker.dmg)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-2 }
### 新機能
@z

@x
- [Amazon ECR Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.4.0)
@y
{% comment %}
- [Amazon ECR Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.4.0)
{% endcomment %}
- [Amazon ECR Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.4.0)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-3 }
### アップグレード
@z

@x
- [Docker ACI integration 0.1.15](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.15)
- [Snyk v0.393.0](https://github.com/snyk/snyk/releases/tag/v1.393.0)
@y
- [Docker ACI integration 0.1.15](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.15)
- [Snyk v0.393.0](https://github.com/snyk/snyk/releases/tag/v1.393.0)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-4 }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed automatic start on log in. See [docker/for-mac#4877](https://github.com/docker/for-mac/issues/4877) and [docker/for-mac#4890](https://github.com/docker/for-mac/issues/4890).
- Docker Desktop now allows symlinks to point outside of shared volumes. Fixes [docker/for-mac#4862](https://github.com/docker/for-mac/issues/4862).
- Removed an artificial file descriptor limit (`setrlimit`) of `10240`. Docker Desktop now relies on the kernel to impose limits via `kern.maxfiles` and `kern.maxfilesperproc`.
- Fixed the VM debug shell used for low-level debugging.
- Fixed compatibility with Go 1.15 clients. See [docker/for-mac#4855](https://github.com/docker/for-mac/issues/4855).
- Avoid exposing `/host_mnt` paths in `docker container inspect` and `docker volume inspect`. Fixes [docker/for-mac#4859](https://github.com/docker/for-mac/issues/4859).
- Fixed container logs lagging under heavy load. See [docker/for-win#8216](https://github.com/docker/for-win/issues/8216).
@y
{% comment %}
- Fixed automatic start on log in. See [docker/for-mac#4877](https://github.com/docker/for-mac/issues/4877) and [docker/for-mac#4890](https://github.com/docker/for-mac/issues/4890).
- Docker Desktop now allows symlinks to point outside of shared volumes. Fixes [docker/for-mac#4862](https://github.com/docker/for-mac/issues/4862).
- Removed an artificial file descriptor limit (`setrlimit`) of `10240`. Docker Desktop now relies on the kernel to impose limits via `kern.maxfiles` and `kern.maxfilesperproc`.
- Fixed the VM debug shell used for low-level debugging.
- Fixed compatibility with Go 1.15 clients. See [docker/for-mac#4855](https://github.com/docker/for-mac/issues/4855).
- Avoid exposing `/host_mnt` paths in `docker container inspect` and `docker volume inspect`. Fixes [docker/for-mac#4859](https://github.com/docker/for-mac/issues/4859).
- Fixed container logs lagging under heavy load. See [docker/for-win#8216](https://github.com/docker/for-win/issues/8216).
{% endcomment %}
- ログイン時の自動起動を修正しました。
  [docker/for-mac#4877](https://github.com/docker/for-mac/issues/4877) と [docker/for-mac#4890](https://github.com/docker/for-mac/issues/4890) を参照してください。
- Docker Desktop において共有ボリューム外へのシンボリックリンクを可能にしました。
  [docker/for-mac#4862](https://github.com/docker/for-mac/issues/4862) を Fix に。
- 設定されていたファイルディスクリプターの制限（`setrlimit`）値、すなわち`10240`を削除しました。
  Docker Desktop では、カーネルの `kern.maxfiles` と `kern.maxfilesperproc` を通じて制限を行うものになりました。
- 低レベルデバッグに利用される VM デバッグシェルを修正しました。
- Go 1.15 クライアントとの互換性を修正しました。
  [docker/for-mac#4855](https://github.com/docker/for-mac/issues/4855) を参照してください。
- `docker container inspect` と `docker volume inspect` において `/host_mnt` を公開しないようにしました。
  [docker/for-mac#4859](https://github.com/docker/for-mac/issues/4859) を Fix に。
- コンテナーログの高負荷時における停滞を修正しました。
  [docker/for-win#8216](https://github.com/docker/for-win/issues/8216) を参照してください。
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues }
### 既知の問題
@z

@x
- The `clock_gettime64` system call returns `EPERM` rather than `ENOSYS`
in i386 images. To work around this issue, disable `seccomp` by using 
the `--privileged` flag. See [docker/for-win#8326](https://github.com/docker/for-win/issues/8326).
@y
- システムコール`clock_gettime64`は、i386 イメージにおいて`ENOSYS`ではなく`EPERM`を返します。
  この問題を回避するには、`--privileged`フラグを指定して`seccomp`を無効にしてください。
  [docker/for-win#8326](https://github.com/docker/for-win/issues/8326) を参照してください。
@z

@x
## Docker Desktop Community 2.3.6.1
2020-09-08
@y
## Docker Desktop Community 2.3.6.1
2020-09-08
@z

@x
> [Download](https://desktop.docker.com/mac/edge/47792/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/47792/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/47792/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-4 }
### アップグレード
@z

@x
- [Docker Compose 1.27.0](https://github.com/docker/compose/releases/tag/1.27.0)
@y
- [Docker Compose 1.27.0](https://github.com/docker/compose/releases/tag/1.27.0)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-5 }
### バグフィックスとマイナーチェンジ
@z

@x
-  Docker Desktop now correctly displays the state of "Use gRPC FUSE for file sharing" in the UI. Fixes [docker/for-mac#4864](https://github.com/docker/for-mac/issues/4864).
@y
{% comment %}
-  Docker Desktop now correctly displays the state of "Use gRPC FUSE for file sharing" in the UI. Fixes [docker/for-mac#4864](https://github.com/docker/for-mac/issues/4864).
{% endcomment %}
-  Docker Desktop は UI 上において「Use gRPC FUSE for file sharing」の状態を適切に表示するようになりました。
   [docker/for-mac#4864](https://github.com/docker/for-mac/issues/4864) を Fix に。
@z

@x
## Docker Desktop Community 2.3.6.0
2020-09-01
@y
## Docker Desktop Community 2.3.6.0
2020-09-01
@z

@x
> [Download](https://desktop.docker.com/mac/edge/47622/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/47622/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/47622/Docker.dmg)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-3 }
### 新機能
@z

@x
- In partnership with Snyk, Docker Desktop launches [vulnerability scanning](https://docs.docker.com/engine/scan/) for Docker local images.
- Docker ECS plugin has been replaced by [ECS cloud integration](https://docs.docker.com/engine/context/ecs-integration/)
- Docker UI:
  - The Images view now has search and filter options.
  - You can now push an image to Docker Hub using the Remote repositories drop-down menu.
- WSL 2 files and directories can now be mounted from the Windows Docker CLI with e.g. `docker run -v \\wsl$\Ubuntu\my-files:/my-files ...`.
@y
{% comment %}
- In partnership with Snyk, Docker Desktop launches [vulnerability scanning](https://docs.docker.com/engine/scan/) for Docker local images.
- Docker ECS plugin has been replaced by [ECS cloud integration](https://docs.docker.com/engine/context/ecs-integration/)
- Docker UI:
  - The Images view now has search and filter options.
  - You can now push an image to Docker Hub using the Remote repositories drop-down menu.
- WSL 2 files and directories can now be mounted from the Windows Docker CLI with e.g. `docker run -v \\wsl$\Ubuntu\my-files:/my-files ...`.
{% endcomment %}
- Snyk 社との共同により Docker Desktop から Docker ローカルイメージに対して [ぜい弱性スキャン](https://docs.docker.com/engine/scan/) を実行できるようになりました。
- Docker ECS プラグインは [ECS クラウド統合](https://docs.docker.com/engine/context/ecs-integration/) に置き換えられました。
- Docker UI:
  - Images ビューにおいて検索とフィルターのオプションが追加されました。
  - ドロップダウンメニュー Remote repositories を使って、Docker Hub へのイメージプッシュを行えるようになりました。
- Windows Docker CLI において、たとえば `docker run -v \\wsl$\Ubuntu\my-files:/my-files ...` のようにして、WSL 2 ファイルやディレクトリをマウントできるようになりました。
@z

@x
### Removal
@y
{% comment %}
### Removal
{% endcomment %}
{: #removal }
### 削除
@z

@x
- Support for MacOS 10.13 has ended, you will need to update your system to keep using Docker Desktop.
@y
{% comment %}
- Support for MacOS 10.13 has ended, you will need to update your system to keep using Docker Desktop.
{% endcomment %}
- MacOS 10.13 のサポートは終了しました。
  Docker Desktop を利用していくためには、システムをアップデートしてください。
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-5 }
### アップグレード
@z

@x
- [Alpine 3.12](https://alpinelinux.org/posts/Alpine-3.12.0-released.html)
- [Kubernetes 1.18.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.8)
@y
{% comment %}
- [Alpine 3.12](https://alpinelinux.org/posts/Alpine-3.12.0-released.html)
- [Kubernetes 1.18.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.8)
{% endcomment %}
- [Alpine 3.12](https://alpinelinux.org/posts/Alpine-3.12.0-released.html)
- [Kubernetes 1.18.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.8)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-6 }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a Mac CPU usage bug by removing the serial console from `hyperkit`, see [docker/roadmap#12]( https://github.com/docker/roadmap/issues/12#issuecomment-663163280). To open a shell in the VM use either `nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock` (on Mac) or `putty -serial \\.\pipe\dockerDebugShell` (on Windows).
@y
{% comment %}
- Fixed a Mac CPU usage bug by removing the serial console from `hyperkit`, see [docker/roadmap#12]( https://github.com/docker/roadmap/issues/12#issuecomment-663163280). To open a shell in the VM use either `nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock` (on Mac) or `putty -serial \\.\pipe\dockerDebugShell` (on Windows).
{% endcomment %}
- シリアルコンソールから `hyperkit` を削除することで Mac の CPU 使用量のバグを修正しました。
  [docker/roadmap#12]( https://github.com/docker/roadmap/issues/12#issuecomment-663163280) を参照してください。
  VM 内においてシェルを開くには、`nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock` (Mac の場合)、あるいは `putty -serial \\.\pipe\dockerDebugShell` (Windows の場合) を利用してください。
@z

@x
## Docker Desktop Community 2.3.5.0
2020-08-21
@y
## Docker Desktop Community 2.3.5.0
2020-08-21
@z

@x
> [Download](https://desktop.docker.com/mac/edge/47376/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/47376/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/47376/Docker.dmg)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-4 }
### 新機能
@z

@x
- The **Images** view on the Dashboard now allows you to interact with images on Docker Hub. You can now pull a remote repository with specific tags from Docker Hub, or view the details of the repository on the Docker Hub page. To access the new Images view, from the Docker menu, select **Dashboard** > **Images**.
@y
{% comment %}
- The **Images** view on the Dashboard now allows you to interact with images on Docker Hub. You can now pull a remote repository with specific tags from Docker Hub, or view the details of the repository on the Docker Hub page. To access the new Images view, from the Docker menu, select **Dashboard** > **Images**.
{% endcomment %}
- Dashboard にある **Images** 画面にて、Docker Hub 上のイメージに対する操作を可能にしました。
  Docker Hub 画面において、指定タグを使ってリモートリポジトリからプルを行うことができます。
  また Docker Hub ページにてリポジトリの詳細を確認できます。
  新たな Images 画面にアクセスするには、Docker メニューから **Dashboard** > **Images** を選択します。
@z

@x
- Docker Desktop now enables BuildKit by default after a reset to factory defaults. To revert to the old docker build experience, go to **Preferences** > **Docker Engine** and then disable the BuildKit feature.
@y
{% comment %}
- Docker Desktop now enables BuildKit by default after a reset to factory defaults. To revert to the old docker build experience, go to **Preferences** > **Docker Engine** and then disable the BuildKit feature.
{% endcomment %}
- Docker Desktop では factory をデフォルトにリセットすれば、それ以降は BuildKit がデフォルトで有効になります。
  それまでの Docker のビルド方法に戻したい場合は、**Preferences** > **Docker Engine** を実行して BuildKit 機能を無効にします。
@z

@x
- Docker Desktop now uses **gRPC-FUSE** for file sharing by default. This has much faster file sharing and uses much less CPU than `osxfs`, especially when there are lots of file events on the host. To switch back to `osxfs`, go to **Preferences** > **General** and disable gRPC-FUSE.
@y
{% comment %}
- Docker Desktop now uses **gRPC-FUSE** for file sharing by default. This has much faster file sharing and uses much less CPU than `osxfs`, especially when there are lots of file events on the host. To switch back to `osxfs`, go to **Preferences** > **General** and disable gRPC-FUSE.
{% endcomment %}
- Docker Desktop のファイル共有において、デフォルトで **gRPC-FUSE** を用いるようにしました。
  これは `osxfs` に比べてファイル共有速度が優れていて、CPU 消費も少なくて済みます。
  特にホスト上でのファイルシステムイベントが多い場合に顕著となります。
  それまでの `osxfs` に戻したい場合は、**Preferences** > **General** にアクセスして gRPC-FUSE を無効にします。
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-6 }
### アップグレード
@z

@x
- [Go 1.14.7](https://github.com/golang/go/issues?q=milestone:Go1.14.7+label:CherryPickApproved)
- [Docker ECS integration v1.0.0-beta.5](https://github.com/docker/ecs-plugin/releases/tag/v1.0.0-beta.5)
- [Docker Engine 19.03.13-beta2](https://github.com/docker/docker-ce/releases/tag/v19.03.13-beta2)
- [Docker ACI integration 0.1.12](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.12)
@y
- [Go 1.14.7](https://github.com/golang/go/issues?q=milestone:Go1.14.7+label:CherryPickApproved)
- [Docker ECS integration v1.0.0-beta.5](https://github.com/docker/ecs-plugin/releases/tag/v1.0.0-beta.5)
- [Docker Engine 19.03.13-beta2](https://github.com/docker/docker-ce/releases/tag/v19.03.13-beta2)
- [Docker ACI integration 0.1.12](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.12)
@z

@x
### Removal
@y
{% comment %}
### Removal
{% endcomment %}
{: #removal-1 }
### 削除
@z

@x
- The Mutagen file sync feature that we have been experimenting with in recent Edge releases has been removed. Thanks to everyone who has provided feedback on this feature. We are reconsidering how to integrate it based on the feedback we have received so far.
@y
{% comment %}
{% endcomment %}
- The Mutagen file sync feature that we have been experimenting with in recent Edge releases has been removed. Thanks to everyone who has provided feedback on this feature. We are reconsidering how to integrate it based on the feedback we have received so far.
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-7 }
### バグフィックスとマイナーチェンジ
@z

@x
- Moved **Dashboard** to the top of the whale menu.
- Improved the error handling when `dockerd` crashes.
- Fixed minor bugs in the **Images** view.
@y
{% comment %}
- Moved **Dashboard** to the top of the whale menu.
- Improved the error handling when `dockerd` crashes.
- Fixed minor bugs in the **Images** view.
{% endcomment %}
- **Dashboard** をクジラメニューのトップへ移動。
- `dockerd` クラッシュ時のエラー制御を改善。
- **Images** 画面におけるマイナーバグの改修。
@z

@x
## Docker Desktop Community 2.3.4.0
2020-07-28
@y
## Docker Desktop Community 2.3.4.0
2020-07-28
@z

@x
> [Download](https://desktop.docker.com/mac/edge/46980/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/46980/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/46980/Docker.dmg)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-5 }
### 新機能
@z

@x
- Docker Desktop introduces the new **Images** view to the Docker Dashboard. The Images view allows users to view a list of Docker images on the disk, run an image as a container, pull the latest version of an image from Docker Hub, inspect images, and remove any unwanted images from the disk.
@y
{% comment %}
- Docker Desktop introduces the new **Images** view to the Docker Dashboard. The Images view allows users to view a list of Docker images on the disk, run an image as a container, pull the latest version of an image from Docker Hub, inspect images, and remove any unwanted images from the disk.
{% endcomment %}
- Docker Desktop introduces the new **Images** view to the Docker Dashboard. The Images view allows users to view a list of Docker images on the disk, run an image as a container, pull the latest version of an image from Docker Hub, inspect images, and remove any unwanted images from the disk.
@z

@x
  To access the new Images view, from the Docker menu, select **Dashboard** > **Images**.
@y
  {% comment %}
  To access the new Images view, from the Docker menu, select **Dashboard** > **Images**.
  {% endcomment %}
  To access the new Images view, from the Docker menu, select **Dashboard** > **Images**.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-7 }
### アップグレード
@z

@x
- [Docker ECS integration v1.0.0-beta.4](https://github.com/docker/ecs-plugin/releases/tag/v1.0.0-beta.4){: target="_blank" rel="noopener" class="_”}
- [Kubernetes 1.18.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.6){: target="_blank" rel="noopener" class="_”}
@y
- [Docker ECS integration v1.0.0-beta.4](https://github.com/docker/ecs-plugin/releases/tag/v1.0.0-beta.4){: target="_blank" rel="noopener" class="_”}
- [Kubernetes 1.18.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.6){: target="_blank" rel="noopener" class="_”}
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-8 }
### バグフィックスとマイナーチェンジ
@z

@x
- Copying the container logs from the dashboard does not copy the ANSI color codes to the clipboard anymore.
- Mutagen two-way sync now uses `.dockersyncignore` rather than `.dockerignore` to exclude files.
@y
{% comment %}
- Copying the container logs from the dashboard does not copy the ANSI color codes to the clipboard anymore.
- Mutagen two-way sync now uses `.dockersyncignore` rather than `.dockerignore` to exclude files.
{% endcomment %}
- ダッシュボードからコンテナーのログをコピーする際に、ANSI カラーコードはクリップボードにコピーされなくなりました。
- Mutagen による双方向同期において、除外対象とするファイルの指定は `.dockerignore` ではなく `.dockersyncignore` になりました。
@z

@x
## Docker Desktop Community 2.3.3.2
2020-07-21
@y
## Docker Desktop Community 2.3.3.2
2020-07-21
@z

@x
> [Download](https://desktop.docker.com/mac/edge/46784/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/46784/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/46784/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-8 }
### アップグレード
@z

@x
- [Docker ECS integration v1.0.0-beta.2](https://github.com/docker/ecs-plugin/releases/tag/v1.0.0-beta.2){: target="_blank" rel="noopener" class="_”}
- [Docker ACI integration 0.1.10](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.10){: target="_blank" rel="noopener" class="_”}
@y
- [Docker ECS integration v1.0.0-beta.2](https://github.com/docker/ecs-plugin/releases/tag/v1.0.0-beta.2){: target="_blank" rel="noopener" class="_”}
- [Docker ACI integration 0.1.10](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.10){: target="_blank" rel="noopener" class="_”}
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-9 }
### バグフィックスとマイナーチェンジ
@z

@x
- Mutagen uses the `.dockerignore` file when creating a session to filter the list of synchronized files. See [docker/for-mac#4621](https://github.com/docker/for-mac/issues/4621).
- Docker CLI commands can now bypass any active Mutagen synchronization for volumes using `:cached`. See [docker/for-mac#1592](https://github.com/docker/for-mac/issues/1592#issuecomment-651309816).
@y
{% comment %}
- Mutagen uses the `.dockerignore` file when creating a session to filter the list of synchronized files. See [docker/for-mac#4621](https://github.com/docker/for-mac/issues/4621).
- Docker CLI commands can now bypass any active Mutagen synchronization for volumes using `:cached`. See [docker/for-mac#1592](https://github.com/docker/for-mac/issues/1592#issuecomment-651309816).
{% endcomment %}
- Mutagen uses the `.dockerignore` file when creating a session to filter the list of synchronized files. See [docker/for-mac#4621](https://github.com/docker/for-mac/issues/4621).
- Docker CLI commands can now bypass any active Mutagen synchronization for volumes using `:cached`. See [docker/for-mac#1592](https://github.com/docker/for-mac/issues/1592#issuecomment-651309816).
@z

@x
## Docker Desktop Community 2.3.3.0
2020-07-09
@y
## Docker Desktop Community 2.3.3.0
2020-07-09
@z

@x
> [Download](https://desktop.docker.com/mac/edge/46574/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/46574/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/46574/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-9 }
### アップグレード
@z

@x
- Beta release of [Docker ECS integration v1.0.0-beta.1](https://docs.docker.com/engine/context/ecs-integration/)
- [Docker ACI integration v0.1.7](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.7)
- [Docker Compose 1.26.2](https://github.com/docker/compose/releases/tag/1.26.2)
@y
{% comment %}
- Beta release of [Docker ECS integration v1.0.0-beta.1](https://docs.docker.com/engine/context/ecs-integration/)
- [Docker ACI integration v0.1.7](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.7)
- [Docker Compose 1.26.2](https://github.com/docker/compose/releases/tag/1.26.2)
{% endcomment %}
- Beta release of [Docker ECS integration v1.0.0-beta.1](https://docs.docker.com/engine/context/ecs-integration/)
- [Docker ACI integration v0.1.7](https://github.com/docker/aci-integration-beta/releases/tag/v0.1.7)
- [Docker Compose 1.26.2](https://github.com/docker/compose/releases/tag/1.26.2)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-10 }
### バグフィックスとマイナーチェンジ
@z

@x
- Compose-on-Kubernetes is no longer included in the Docker Desktop installer. You can download it separately from the compose-on-kubernetes [release page](https://github.com/docker/compose-on-kubernetes/releases).
- Fixed an incompatibility between `hyperkit` and `osquery` which resulted in excessive `hyperkit` CPU usage. See [docker/for-mac#3499](https://github.com/docker/for-mac/issues/3499#issuecomment-639140844)
- Docker Desktop now respects consistency flags `cached`, `delegated`, `consistent` even when in a list of options (for example, `z,delegated`). See [docker/for-mac#4718](https://github.com/docker/for-mac/issues/4718).
- Docker Desktop now implements the shared volume flag `:delegated` by automatically setting up a two-way file sync with Mutagen.
@y
{% comment %}
- Compose-on-Kubernetes is no longer included in the Docker Desktop installer. You can download it separately from the compose-on-kubernetes [release page](https://github.com/docker/compose-on-kubernetes/releases).
- Fixed an incompatibility between `hyperkit` and `osquery` which resulted in excessive `hyperkit` CPU usage. See [docker/for-mac#3499](https://github.com/docker/for-mac/issues/3499#issuecomment-639140844)
- Docker Desktop now respects consistency flags `cached`, `delegated`, `consistent` even when in a list of options (for example, `z,delegated`). See [docker/for-mac#4718](https://github.com/docker/for-mac/issues/4718).
- Docker Desktop now implements the shared volume flag `:delegated` by automatically setting up a two-way file sync with Mutagen.
{% endcomment %}
- Compose-on-Kubernetes is no longer included in the Docker Desktop installer. You can download it separately from the compose-on-kubernetes [release page](https://github.com/docker/compose-on-kubernetes/releases).
- Fixed an incompatibility between `hyperkit` and `osquery` which resulted in excessive `hyperkit` CPU usage. See [docker/for-mac#3499](https://github.com/docker/for-mac/issues/3499#issuecomment-639140844)
- Docker Desktop now respects consistency flags `cached`, `delegated`, `consistent` even when in a list of options (for example, `z,delegated`). See [docker/for-mac#4718](https://github.com/docker/for-mac/issues/4718).
- Docker Desktop now implements the shared volume flag `:delegated` by automatically setting up a two-way file sync with Mutagen.
@z

@x
## Docker Desktop Community 2.3.2.0
2020-06-25
@y
## Docker Desktop Community 2.3.2.0
2020-06-25
@z

@x
> [Download](https://desktop.docker.com/mac/edge/46268/Docker.dmg)
@y
{% comment %}
> [Download](https://desktop.docker.com/mac/edge/46268/Docker.dmg)
{% endcomment %}
> [ダウンロード](https://desktop.docker.com/mac/edge/46268/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-10 }
### アップグレード
@z

@x
- [Docker 19.03.12](https://github.com/docker/docker-ce/releases/tag/v19.03.12)
- [Docker Compose 1.26.0](https://github.com/docker/compose/releases/tag/1.26.0)
- [Kubernetes 1.18.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.3)
- Beta release of the [Docker ACI integration](https://docs.docker.com/engine/context/aci-integration/)
@y
{% comment %}
- [Docker 19.03.12](https://github.com/docker/docker-ce/releases/tag/v19.03.12)
- [Docker Compose 1.26.0](https://github.com/docker/compose/releases/tag/1.26.0)
- [Kubernetes 1.18.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.3)
- Beta release of the [Docker ACI integration](https://docs.docker.com/engine/context/aci-integration/)
{% endcomment %}
- [Docker 19.03.12](https://github.com/docker/docker-ce/releases/tag/v19.03.12)
- [Docker Compose 1.26.0](https://github.com/docker/compose/releases/tag/1.26.0)
- [Kubernetes 1.18.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.3)
- Beta release of the [Docker ACI integration](https://docs.docker.com/engine/context/aci-integration/)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-11 }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed an issue with startup when the Kubernetes certificates have expired. See [docker/for-mac#4594](https://github.com/docker/for-mac/issues/4594).
- Fixed `hyperkit` on newer Macs / newer versions of `Hypervisor.framework`.
- Added support for the global Mutagen config file `~/.mutagen.yml`.
- Automatically set up a two-way file sync using `:delegated` option with `docker run -v` command.
- Re-added device-mapper to the embedded Linux kernel. See [docker/for-mac#4549](https://github.com/docker/for-mac/issues/4549).
- Improved diagnostics when using two-way synchronization with the Mutagen cache.
- Switched to Mutagen `posix-raw` symlink mode which fixes cases where the symlinks point outside the synchronized directory. See [docker/for-mac#4595](https://github.com/docker/for-mac/issues/4595).
- Removed the legacy Kubernetes context `docker-for-desktop`. The context `docker-desktop` should be used instead. See [docker/for-mac#4089](https://github.com/docker/for-mac/issues/4089).
@y
- Fixed an issue with startup when the Kubernetes certificates have expired. See [docker/for-mac#4594](https://github.com/docker/for-mac/issues/4594).
- Fixed `hyperkit` on newer Macs / newer versions of `Hypervisor.framework`.
- Added support for the global Mutagen config file `~/.mutagen.yml`.
- Automatically set up a two-way file sync using `:delegated` option with `docker run -v` command.
- Re-added device-mapper to the embedded Linux kernel. See [docker/for-mac#4549](https://github.com/docker/for-mac/issues/4549).
- Improved diagnostics when using two-way synchronization with the Mutagen cache.
- Switched to Mutagen `posix-raw` symlink mode which fixes cases where the symlinks point outside the synchronized directory. See [docker/for-mac#4595](https://github.com/docker/for-mac/issues/4595).
- Removed the legacy Kubernetes context `docker-for-desktop`. The context `docker-desktop` should be used instead. See [docker/for-mac#4089](https://github.com/docker/for-mac/issues/4089).
@z

@x
## Docker Desktop Community 2.3.1.0
2020-05-20
@y
## Docker Desktop Community 2.3.1.0
2020-05-20
@z

@x
> [Download](https://desktop.docker.com/mac/edge/45408/Docker.dmg)
@y
> [Download](https://desktop.docker.com/mac/edge/45408/Docker.dmg)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-6 }
### 新機能
@z

@x
Docker Desktop introduces a directory caching mechanism to greatly improve disk performance in containers. This feature uses [mutagen.io](https://mutagen.io/){: target="_blank" rel="noopener" class="_"} to sync files between the host and the containers and benefits from native disk performance. For more information, see [Mutagen-based caching](mutagen.md).
@y
Docker Desktop introduces a directory caching mechanism to greatly improve disk performance in containers. This feature uses [mutagen.io](https://mutagen.io/){: target="_blank" rel="noopener" class="_"} to sync files between the host and the containers and benefits from native disk performance. For more information, see [Mutagen-based caching](mutagen.md).
@z

@x
We appreciate you trying out an early version of the Mutagen file sync feature. Please let us know your feedback by creating an issue in the [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} repository with the `Mutagen` label.
@y
We appreciate you trying out an early version of the Mutagen file sync feature. Please let us know your feedback by creating an issue in the [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} repository with the `Mutagen` label.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-11 }
### アップグレード
@z

@x
- [Docker Compose 1.26.0-rc4](https://github.com/docker/compose/releases/tag/1.26.0-rc4)
- Upgrade to Qemu 4.2.0, add Risc-V support
@y
- [Docker Compose 1.26.0-rc4](https://github.com/docker/compose/releases/tag/1.26.0-rc4)
- Upgrade to Qemu 4.2.0, add Risc-V support
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-12 }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a performance regression when using shared volumes in 2.2.0.5. Fixes [docker/for-mac#4423](https://github.com/docker/for-mac/issues/4423).
- Fixed containers logs in Docker Desktop **Dashboard** which were sometimes truncated. Fixes [docker/for-win#5954](https://github.com/docker/for-win/issues/5954).
@y
- Fixed a performance regression when using shared volumes in 2.2.0.5. Fixes [docker/for-mac#4423](https://github.com/docker/for-mac/issues/4423).
- Fixed containers logs in Docker Desktop **Dashboard** which were sometimes truncated. Fixes [docker/for-win#5954](https://github.com/docker/for-win/issues/5954).
@z

@x
## Docker Desktop Community 2.3.0.1
2020-04-28
@y
## Docker Desktop Community 2.3.0.1
2020-04-28
@z

@x
> [Download](https://download.docker.com/mac/edge/44875/Docker.dmg)
@y
> [Download](https://download.docker.com/mac/edge/44875/Docker.dmg)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-13 }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed a bug that caused starting and stopping of a Compose application from the UI to fail when the path contains whitespace.
@y
- Fixed a bug that caused starting and stopping of a Compose application from the UI to fail when the path contains whitespace.
@z

@x
## Docker Desktop Community 2.3.0.0
2020-04-20
@y
## Docker Desktop Community 2.3.0.0
2020-04-20
@z

@x
> [Download](https://download.docker.com/mac/edge/44472/Docker.dmg)
@y
> [Download](https://download.docker.com/mac/edge/44472/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-12 }
### アップグレード
@z

@x
- [Docker Compose 1.25.5](https://github.com/docker/compose/releases/tag/1.25.5)
- [Go 1.13.10](https://github.com/golang/go/issues?q=milestone%3AGo1.13.10+label%3ACherryPickApproved)
- [Linux kernel 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-ce15f646db9b062dc947cfc0c1deab019fa63f96-amd64/images/sha256-6c252199aee548e4bdc8457e0a068e7d8e81c2649d4c1e26e4150daa253a85d8?context=repo)
- LinuxKit [init](https://hub.docker.com/layers/linuxkit/init/1a80a9907b35b9a808e7868ffb7b0da29ee64a95/images/sha256-64cc8fa50d63940dbaa9979a13c362c89ecb4439bcb3ab22c40d300b9c0b597e?context=explore), [runc](https://hub.docker.com/layers/linuxkit/runc/69b4a35eaa22eba4990ee52cccc8f48f6c08ed03/images/sha256-57e3c7cbd96790990cf87d7b0f30f459ea0b6f9768b03b32a89b832b73546280?context=explore), and [containerd](https://hub.docker.com/layers/linuxkit/containerd/09553963ed9da626c25cf8acdf6d62ec37645412/images/sha256-866be7edb0598430709f88d0e1c6ed7bfd4a397b5ed220e1f793ee9067255ff1?context=explore)
@y
- [Docker Compose 1.25.5](https://github.com/docker/compose/releases/tag/1.25.5)
- [Go 1.13.10](https://github.com/golang/go/issues?q=milestone%3AGo1.13.10+label%3ACherryPickApproved)
- [Linux kernel 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-ce15f646db9b062dc947cfc0c1deab019fa63f96-amd64/images/sha256-6c252199aee548e4bdc8457e0a068e7d8e81c2649d4c1e26e4150daa253a85d8?context=repo)
- LinuxKit [init](https://hub.docker.com/layers/linuxkit/init/1a80a9907b35b9a808e7868ffb7b0da29ee64a95/images/sha256-64cc8fa50d63940dbaa9979a13c362c89ecb4439bcb3ab22c40d300b9c0b597e?context=explore), [runc](https://hub.docker.com/layers/linuxkit/runc/69b4a35eaa22eba4990ee52cccc8f48f6c08ed03/images/sha256-57e3c7cbd96790990cf87d7b0f30f459ea0b6f9768b03b32a89b832b73546280?context=explore), and [containerd](https://hub.docker.com/layers/linuxkit/containerd/09553963ed9da626c25cf8acdf6d62ec37645412/images/sha256-866be7edb0598430709f88d0e1c6ed7bfd4a397b5ed220e1f793ee9067255ff1?context=explore)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-14 }
### バグフィックスとマイナーチェンジ
@z

@x
> Docker Desktop Edge 2.3.0.0 fixes one issue reported on the [docker/for-mac](https://github.com/docker/for-mac/issues) GitHub repository.
@y
> Docker Desktop Edge 2.3.0.0 fixes one issue reported on the [docker/for-mac](https://github.com/docker/for-mac/issues) GitHub repository.
@z

@x
- IPv6 has been re-enabled in the embedded Linux kernel, so listening on IPv6 addresses works again. Fixed [docker/for-win#6206](https://github.com/docker/for-win/issues/6206) and [docker/for-mac#4415](https://github.com/docker/for-mac/issues/4415).
- Fixed a bug where containers disappeared from the UI when Kubernetes context is invalid. Fixes [docker/for-win#6037](https://github.com/docker/for-win/issues/6037).
- Fixed a file descriptor leak in `vpnkit-bridge`. Fixes [docker/for-win#5841](https://github.com/docker/for-win/issues/5841).
- Added a link to the Stable channel from the Docker Desktop UI.
- Made the embedded terminal resizable.
- Fixed bug where diagnostic upload would fail if the username contained spaces.
@y
- IPv6 has been re-enabled in the embedded Linux kernel, so listening on IPv6 addresses works again. Fixed [docker/for-win#6206](https://github.com/docker/for-win/issues/6206) and [docker/for-mac#4415](https://github.com/docker/for-mac/issues/4415).
- Fixed a bug where containers disappeared from the UI when Kubernetes context is invalid. Fixes [docker/for-win#6037](https://github.com/docker/for-win/issues/6037).
- Fixed a file descriptor leak in `vpnkit-bridge`. Fixes [docker/for-win#5841](https://github.com/docker/for-win/issues/5841).
- Added a link to the Stable channel from the Docker Desktop UI.
- Made the embedded terminal resizable.
- Fixed bug where diagnostic upload would fail if the username contained spaces.
@z

@x
## Docker Desktop Community 2.2.3.0
2020-04-02
@y
## Docker Desktop Community 2.2.3.0
2020-04-02
@z

@x
> [Download](https://download.docker.com/mac/edge/43965/Docker.dmg)
@y
> [Download](https://download.docker.com/mac/edge/43965/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-13 }
### アップグレード
@z

@x
- [Docker 19.03.8](https://github.com/docker/docker-ce/releases/tag/v19.03.8)
- [Docker Compose 1.26.0-rc3](https://github.com/docker/compose/releases/tag/1.26.0-rc3)
- [Linux 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-4e5d9e5f3bde0abf236f97e4a81b029ae0f5f6e7-amd64/images/sha256-11dc0f6ee3187088219ba1463ebb378f5093a7d98f176ddfd62dd6b741c2dd2d?context=repo)
@y
- [Docker 19.03.8](https://github.com/docker/docker-ce/releases/tag/v19.03.8)
- [Docker Compose 1.26.0-rc3](https://github.com/docker/compose/releases/tag/1.26.0-rc3)
- [Linux 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-4e5d9e5f3bde0abf236f97e4a81b029ae0f5f6e7-amd64/images/sha256-11dc0f6ee3187088219ba1463ebb378f5093a7d98f176ddfd62dd6b741c2dd2d?context=repo)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-7 }
### 新機能
@z

@x
- Docker Desktop introduces a new onboarding tutorial upon first startup. The Quick Start tutorial guides users to get started with Docker in a few easy steps. It includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
@y
- Docker Desktop introduces a new onboarding tutorial upon first startup. The Quick Start tutorial guides users to get started with Docker in a few easy steps. It includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-15 }
### バグフィックスとマイナーチェンジ
@z

@x
> Docker Desktop Edge 2.2.3.0 fixes 7 issues reported on the [docker/for-mac](https://github.com/docker/for-mac/issues) GitHub repository.
@y
> Docker Desktop Edge 2.2.3.0 fixes 7 issues reported on the [docker/for-mac](https://github.com/docker/for-mac/issues) GitHub repository.
@z

@x
- Reduced the size of the Docker Desktop installer from 710 MB to 445 MB.
- Removed dangling `/usr/local/bin/docker-machine` symlinks which avoids custom installs of `docker-machine` being accidentally deleted in future upgrades. Note that if you have installed Docker Machine manually, then the install might have followed the symlink and installed Docker Machine in `/Applications/Docker.app`. In this case, you must manually reinstall Docker Machine after installing this version of Docker Desktop. Fixes [docker/for-mac#4208](https://github.com/docker/for-mac/issues/4208).
- Fixed a bug where the Docker UI could be started without the engine.
- Switched from `ahci-hd` to `virtio-blk` to avoid an AHCI deadlock, see [moby/hyperkit#94](https://github.com/moby/hyperkit/issues/94) and [docker/for-mac#1835](https://github.com/docker/for-mac/issues/1835).
- Capturing diagnostics is now faster and easier.
- Fixed an issue where a container port could not be exposed on a specific host IP. See [docker/for-mac#4209](https://github.com/docker/for-mac/issues/4209).
- Kubernetes: Persistent volumes created by claims are now stored in the virtual machine. Fixes [docker/for-win#5665](https://github.com/docker/for-win/issues/5665).
- Removed port probing from dashboard, just unconditionally showing links to ports that should be available. Fixes [docker/for-mac#4264](https://github.com/docker/for-mac/issues/4264).
@y
- Reduced the size of the Docker Desktop installer from 710 MB to 445 MB.
- Removed dangling `/usr/local/bin/docker-machine` symlinks which avoids custom installs of `docker-machine` being accidentally deleted in future upgrades. Note that if you have installed Docker Machine manually, then the install might have followed the symlink and installed Docker Machine in `/Applications/Docker.app`. In this case, you must manually reinstall Docker Machine after installing this version of Docker Desktop. Fixes [docker/for-mac#4208](https://github.com/docker/for-mac/issues/4208).
- Fixed a bug where the Docker UI could be started without the engine.
- Switched from `ahci-hd` to `virtio-blk` to avoid an AHCI deadlock, see [moby/hyperkit#94](https://github.com/moby/hyperkit/issues/94) and [docker/for-mac#1835](https://github.com/docker/for-mac/issues/1835).
- Capturing diagnostics is now faster and easier.
- Fixed an issue where a container port could not be exposed on a specific host IP. See [docker/for-mac#4209](https://github.com/docker/for-mac/issues/4209).
- Kubernetes: Persistent volumes created by claims are now stored in the virtual machine. Fixes [docker/for-win#5665](https://github.com/docker/for-win/issues/5665).
- Removed port probing from dashboard, just unconditionally showing links to ports that should be available. Fixes [docker/for-mac#4264](https://github.com/docker/for-mac/issues/4264).
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues-1 }
### 既知の問題
@z

@x
- Loopback and unspecified IPv6 addresses (`::` and `::1`) within a container do not currently work. Some web servers and other programs may be using these addresses in their configuration files.
@y
- Loopback and unspecified IPv6 addresses (`::` and `::1`) within a container do not currently work. Some web servers and other programs may be using these addresses in their configuration files.
@z

@x
## Docker Desktop Community 2.2.2.0
2020-03-02
@y
## Docker Desktop Community 2.2.2.0
2020-03-02
@z

@x
> [Download](https://download.docker.com/mac/edge/43066/Docker.dmg)
@y
> [Download](https://download.docker.com/mac/edge/43066/Docker.dmg)
@z

@x
This release contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing Docker Desktop.
@y
This release contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installing Docker Desktop.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-14 }
### アップグレード
@z

@x
- [Kubernetes 1.16.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.16.5)
- [Go 1.13.8](https://golang.org/doc/devel/release.html#go1.13)
@y
- [Kubernetes 1.16.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.16.5)
- [Go 1.13.8](https://golang.org/doc/devel/release.html#go1.13)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-16 }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop now shares `/var/folders` by default as it stores per-user temporary files and caches.
- Ceph support has been removed from Docker Desktop to save disk space.
@y
- Docker Desktop now shares `/var/folders` by default as it stores per-user temporary files and caches.
- Ceph support has been removed from Docker Desktop to save disk space.
@z

@x
## Docker Desktop Community 2.2.1.0
2020-02-12
@y
## Docker Desktop Community 2.2.1.0
2020-02-12
@z

@x
[Download](https://download.docker.com/mac/edge/42746/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/42746/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-15 }
### アップグレード
@z

@x
- [Docker Compose 1.25.4](https://github.com/docker/compose/releases/tag/1.25.4)
- [Go 1.12.16](https://golang.org/doc/devel/release.html#go1.12)
@y
- [Docker Compose 1.25.4](https://github.com/docker/compose/releases/tag/1.25.4)
- [Go 1.12.16](https://golang.org/doc/devel/release.html#go1.12)
@z

@x
## Docker Desktop Community 2.1.7.0
2019-12-11
@y
## Docker Desktop Community 2.1.7.0
2019-12-11
@z

@x
[Download](https://download.docker.com/mac/edge/41561/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/41561/Docker.dmg)
@z

@x
> **Note:** Docker Desktop Edge 2.1.7.0 is the release candidate for the upcoming major Stable release. Please help us test this version before the wider release and report any issues in the [docker/for-mac](https://github.com/docker/for-mac/issues) GitHub repository.
@y
> **Note:** Docker Desktop Edge 2.1.7.0 is the release candidate for the upcoming major Stable release. Please help us test this version before the wider release and report any issues in the [docker/for-mac](https://github.com/docker/for-mac/issues) GitHub repository.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-16 }
### アップグレード
@z

@x
- [Docker Compose 1.25.1-rc1](https://github.com/docker/compose/releases/tag/1.25.1-rc1)
@y
- [Docker Compose 1.25.1-rc1](https://github.com/docker/compose/releases/tag/1.25.1-rc1)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-17 }
### バグフィックスとマイナーチェンジ
@z

@x
- The Docker Desktop Dashboard now displays port information inline with the container status.
- Fixed an issue that caused the 'back' button on the Dashboard UI to behave inconsistently when repeatedly switching between the container details and the Settings window.
- Various minor improvements to the Dashboard UI.
- Fixed an issue that occurs when sharing overlapping directories.
- Fixed a bug that prevented users from changing the location of the VM disk image.
- Docker Desktop does not inject `inotify` events on directories anymore as these can cause mount points to disappear inside containers. Fixes [docker/for-mac#3976](https://github.com/docker/for-mac/issues/3976).
- Fixed an issue that caused Docker Desktop to fail on startup when there is an incomplete Kubernetes config file.
- Fixed an issue where attempts to log into Docker through Docker Desktop could sometimes fail with the `Incorrect authentication credentials` error. Fixes [docker/for-mac#4010](https://github.com/docker/for-mac/issues/4010).
@y
- The Docker Desktop Dashboard now displays port information inline with the container status.
- Fixed an issue that caused the 'back' button on the Dashboard UI to behave inconsistently when repeatedly switching between the container details and the Settings window.
- Various minor improvements to the Dashboard UI.
- Fixed an issue that occurs when sharing overlapping directories.
- Fixed a bug that prevented users from changing the location of the VM disk image.
- Docker Desktop does not inject `inotify` events on directories anymore as these can cause mount points to disappear inside containers. Fixes [docker/for-mac#3976](https://github.com/docker/for-mac/issues/3976).
- Fixed an issue that caused Docker Desktop to fail on startup when there is an incomplete Kubernetes config file.
- Fixed an issue where attempts to log into Docker through Docker Desktop could sometimes fail with the `Incorrect authentication credentials` error. Fixes [docker/for-mac#4010](https://github.com/docker/for-mac/issues/4010).
@z

@x
## Docker Desktop Community 2.1.6.0
2019-11-18
@y
## Docker Desktop Community 2.1.6.0
2019-11-18
@z

@x
[Download](https://download.docker.com/mac/edge/40807/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/40807/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-17 }
### アップグレード
@z

@x
- [Docker 19.03.5](https://github.com/docker/docker-ce/releases/tag/v19.03.5)
- [Go 1.12.13](https://golang.org/doc/devel/release.html#go1.12)
@y
- [Docker 19.03.5](https://github.com/docker/docker-ce/releases/tag/v19.03.5)
- [Go 1.12.13](https://golang.org/doc/devel/release.html#go1.12)
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-8 }
### 新機能
@z

@x
Added the ability to start and stop Compose-based applications and view combined logs in the Docker Desktop **Dashboard** UI.
@y
Added the ability to start and stop Compose-based applications and view combined logs in the Docker Desktop **Dashboard** UI.
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-18 }
### バグフィックスとマイナーチェンジ
@z

@x
- Fixed port forwarding when containers are using `overlay` networks.
- Fixed a container start error when a container has more than one port with an arbitrary or not-yet-configured external port number. For example, `docker run -p 80 -p 443 nginx`. Fixes [docker/for-win#4935](https://github.com/docker/for-win/issues/4935) and [docker/compose#6998](https://github.com/docker/compose/issues/6998).
@y
- Fixed port forwarding when containers are using `overlay` networks.
- Fixed a container start error when a container has more than one port with an arbitrary or not-yet-configured external port number. For example, `docker run -p 80 -p 443 nginx`. Fixes [docker/for-win#4935](https://github.com/docker/for-win/issues/4935) and [docker/compose#6998](https://github.com/docker/compose/issues/6998).
@z

@x
## Docker Desktop Community 2.1.5.0
2019-11-04
@y
## Docker Desktop Community 2.1.5.0
2019-11-04
@z

@x
[Download](https://download.docker.com/mac/edge/40323/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/40323/Docker.dmg)
@z

@x
This release contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installation.
@y
This release contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after installation.
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-18 }
### アップグレード
@z

@x
- [Kubernetes 1.15.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.15.5)
- [Docker Compose 1.25.0-rc4](https://github.com/docker/compose/releases/tag/1.25.0-rc4)
- Linux kernel 4.19.76
@y
- [Kubernetes 1.15.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.15.5)
- [Docker Compose 1.25.0-rc4](https://github.com/docker/compose/releases/tag/1.25.0-rc4)
- Linux kernel 4.19.76
@z

@x
### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-9 }
### 新機能
@z

@x
**Docker Desktop Dashboard:** The new Docker Desktop **Dashboard** provides a user-friendly interface which enables you to interact with containers and applications, and manage the lifecycle of your applications directly from the UI. In addition, it allows you to access the logs, view container details, and monitor resource utilization to explore the container behavior.
@y
**Docker Desktop Dashboard:** The new Docker Desktop **Dashboard** provides a user-friendly interface which enables you to interact with containers and applications, and manage the lifecycle of your applications directly from the UI. In addition, it allows you to access the logs, view container details, and monitor resource utilization to explore the container behavior.
@z

@x
To access the new Dashboard UI, select the Docker menu from the Mac menu bar and then click **Dashboard**.
@y
To access the new Dashboard UI, select the Docker menu from the Mac menu bar and then click **Dashboard**.
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-19 }
### バグフィックスとマイナーチェンジ
@z

@x
Fixed an issue that caused VMs running on older hardware with macOS Catalina to fail on startup with the error `processor does not support desired secondary processor-based controls`.
@y
Fixed an issue that caused VMs running on older hardware with macOS Catalina to fail on startup with the error `processor does not support desired secondary processor-based controls`.
@z

@x
### Known issues
@y
{% comment %}
### Known issues
{% endcomment %}
{: #known-issues-2 }
### 既知の問題
@z

@x
- When you start a Docker Compose application and then start a Docker App which has the same name as the Compose application, Docker Desktop displays only one application on the Dashboard. However, when you expand the application, containers that belong to both applications are displayed on the Dashboard.
@y
- When you start a Docker Compose application and then start a Docker App which has the same name as the Compose application, Docker Desktop displays only one application on the Dashboard. However, when you expand the application, containers that belong to both applications are displayed on the Dashboard.
@z

@x
- When you deploy a Docker App with multiple containers on Kubernetes, Docker Desktop displays each Pod as an application on the Dashboard.
@y
- When you deploy a Docker App with multiple containers on Kubernetes, Docker Desktop displays each Pod as an application on the Dashboard.
@z

@x
## Docker Desktop Community 2.1.4.0
2019-10-15
@y
## Docker Desktop Community 2.1.4.0
2019-10-15
@z

@x
[Download](https://download.docker.com/mac/edge/39357/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/39357/Docker.dmg)
@z

@x
### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-19 }
### アップグレード
@z

@x
- [Docker 19.03.3](https://github.com/docker/docker-ce/releases/tag/v19.03.3)
- [Kubernetes 1.15.4](https://github.com/kubernetes/kubernetes/releases/tag/v1.15.4)
- [Go 1.12.10](https://github.com/golang/go/issues?q=milestone%3AGo1.12.10+label%3ACherryPickApproved) for [CVE-2019-16276](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-16276)
- [Kitematic 0.17.9](https://github.com/docker/kitematic/releases/tag/v0.17.9)
@y
- [Docker 19.03.3](https://github.com/docker/docker-ce/releases/tag/v19.03.3)
- [Kubernetes 1.15.4](https://github.com/kubernetes/kubernetes/releases/tag/v1.15.4)
- [Go 1.12.10](https://github.com/golang/go/issues?q=milestone%3AGo1.12.10+label%3ACherryPickApproved) for [CVE-2019-16276](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-16276)
- [Kitematic 0.17.9](https://github.com/docker/kitematic/releases/tag/v0.17.9)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-20 }
### バグフィックスとマイナーチェンジ
@z

@x
- Improved the navigation in **Settings** and **Troubleshoot** UI.
- Fixed a bug in the UEFI boot menu that sometimes caused Docker Desktop to hang during restart. Fixes [docker/for-mac#2655](https://github.com/docker/for-mac/issues/2655) and [docker/for-mac#3921](https://github.com/docker/for-mac/issues/3921).
- Docker Desktop now allows users to access the host’s SSH agent inside containers. Fixes [docker/for-mac#410](https://github.com/docker/for-mac/issues/410)
- Docker Machine is no longer included in the Docker Desktop installer. You can download it separately from the [Docker Machine releases](https://github.com/docker/machine/releases) page.
@y
- Improved the navigation in **Settings** and **Troubleshoot** UI.
- Fixed a bug in the UEFI boot menu that sometimes caused Docker Desktop to hang during restart. Fixes [docker/for-mac#2655](https://github.com/docker/for-mac/issues/2655) and [docker/for-mac#3921](https://github.com/docker/for-mac/issues/3921).
- Docker Desktop now allows users to access the host’s SSH agent inside containers. Fixes [docker/for-mac#410](https://github.com/docker/for-mac/issues/410)
- Docker Machine is no longer included in the Docker Desktop installer. You can download it separately from the [Docker Machine releases](https://github.com/docker/machine/releases) page.
@z

@x
## Docker Desktop Community 2.1.3.0
2019-09-16
@y
## Docker Desktop Community 2.1.3.0
2019-09-16
@z

@x
[Download](https://download.docker.com/mac/edge/38275/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/38275/Docker.dmg)
@z

@x
### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-21 }
### バグフィックスとマイナーチェンジ
@z

@x
- All binaries included in Docker Desktop are now notarized so that they can run on macOS Catalina. For more information, see [Notarization Requirement for Mac Software](https://developer.apple.com/news/?id=06032019i).
- Fixed an issue which caused higher CPU utilization when closing Docker Desktop windows.
- Added a loading overlay to the **Settings** and **Troubleshoot** windows to prevent editing conflicts.
- Deactivated the **Reset Kubernetes** button when Kubernetes is not activated.
@y
- All binaries included in Docker Desktop are now notarized so that they can run on macOS Catalina. For more information, see [Notarization Requirement for Mac Software](https://developer.apple.com/news/?id=06032019i).
- Fixed an issue which caused higher CPU utilization when closing Docker Desktop windows.
- Added a loading overlay to the **Settings** and **Troubleshoot** windows to prevent editing conflicts.
- Deactivated the **Reset Kubernetes** button when Kubernetes is not activated.
@z

@x
## Docker Desktop Community 2.1.2.0
2019-09-09
@y
## Docker Desktop Community 2.1.2.0
2019-09-09
@z

@x
[Download](https://download.docker.com/mac/edge/38030/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/38030/Docker.dmg)
@z

@x
#### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-20 }
### アップグレード
@z

@x
- [Docker 19.03.2](https://github.com/docker/docker-ce/releases/tag/v19.03.2)
- [Kubernetes 1.14.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.6)
- [Go 1.12.9](https://github.com/golang/go/issues?q=milestone%3AGo1.12.9+label%3ACherryPickApproved)
- [Qemu 4.0.1](https://github.com/docker/binfmt)
- [Docker Machine 0.16.2](https://github.com/docker/machine/releases/tag/v0.16.2)
- [Kitematic 0.17.8](https://github.com/docker/kitematic/releases/tag/v0.17.8)
@y
- [Docker 19.03.2](https://github.com/docker/docker-ce/releases/tag/v19.03.2)
- [Kubernetes 1.14.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.6)
- [Go 1.12.9](https://github.com/golang/go/issues?q=milestone%3AGo1.12.9+label%3ACherryPickApproved)
- [Qemu 4.0.1](https://github.com/docker/binfmt)
- [Docker Machine 0.16.2](https://github.com/docker/machine/releases/tag/v0.16.2)
- [Kitematic 0.17.8](https://github.com/docker/kitematic/releases/tag/v0.17.8)
@z

@x
#### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-22 }
### バグフィックスとマイナーチェンジ
@z

@x
- Reduced the Virtual Machine (VM) startup time.
- Added support for `Expect: 100-continue` headers in the Docker API proxy. Some HTTP clients such as `curl` send this header when the payload is large, for example, when creating containers. Fixes [moby/moby#39693](https://github.com/moby/moby/issues/39693).
@y
- Reduced the Virtual Machine (VM) startup time.
- Added support for `Expect: 100-continue` headers in the Docker API proxy. Some HTTP clients such as `curl` send this header when the payload is large, for example, when creating containers. Fixes [moby/moby#39693](https://github.com/moby/moby/issues/39693).
@z

@x
## Docker Desktop Community 2.1.1.0
2019-08-12
@y
## Docker Desktop Community 2.1.1.0
2019-08-12
@z

@x
[Download](https://download.docker.com/mac/edge/37260/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/37260/Docker.dmg)
@z

@x
#### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-21 }
### アップグレード
@z

@x
- Linux Kernel 4.14.131
- [Hyperkit v0.20190802](https://github.com/moby/hyperkit/releases/tag/v0.20190802)
@y
- Linux Kernel 4.14.131
- [Hyperkit v0.20190802](https://github.com/moby/hyperkit/releases/tag/v0.20190802)
@z

@x
#### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-23 }
### バグフィックスとマイナーチェンジ
@z

@x
- Docker Desktop now allows users to expose privileged UDP ports. [docker/for-mac#3775](https://github.com/docker/for-mac/issues/3775)
- Added missing fish completions for Docker Compose. [docker/for-mac#3795](https://github.com/docker/for-mac/issues/3795)
- Fixed an issue where running some Docker commands can fail if you are not using Credential Helpers. [docker/for-mac#3785](https://github.com/docker/for-mac/issues/3785)
- Fixed a bug that did not allow users to copy and paste text in the **Preferences** > **Daemon** window. [docker/for-mac#3798](https://github.com/docker/for-mac/issues/3798)
@y
- Docker Desktop now allows users to expose privileged UDP ports. [docker/for-mac#3775](https://github.com/docker/for-mac/issues/3775)
- Added missing fish completions for Docker Compose. [docker/for-mac#3795](https://github.com/docker/for-mac/issues/3795)
- Fixed an issue where running some Docker commands can fail if you are not using Credential Helpers. [docker/for-mac#3785](https://github.com/docker/for-mac/issues/3785)
- Fixed a bug that did not allow users to copy and paste text in the **Preferences** > **Daemon** window. [docker/for-mac#3798](https://github.com/docker/for-mac/issues/3798)
@z

@x
## Docker Desktop Community 2.1.0.0 
2019-07-26
@y
## Docker Desktop Community 2.1.0.0 
2019-07-26
@z

@x
[Download](https://download.docker.com/mac/edge/36792/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/36792/Docker.dmg)
@z

@x
This release contains Kubernetes security improvements. Note that your local Kubernetes PKI and cluster will be reset after installation.
@y
This release contains Kubernetes security improvements. Note that your local Kubernetes PKI and cluster will be reset after installation.
@z

@x
#### Upgrades
@y
{% comment %}
### Upgrades
{% endcomment %}
{: #upgrades-22 }
### アップグレード
@z

@x
 - [Docker 19.03.1](https://github.com/docker/docker-ce/releases/tag/v19.03.1)
 - [Docker Compose 1.24.1](https://github.com/docker/compose/releases/tag/1.24.1)
 - [Alpine 3.10](https://alpinelinux.org/posts/Alpine-3.10.0-released.html)
 - Linux Kernel 4.9.184
 - [Docker Credential Helpers 0.6.3](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.3)
@y
 - [Docker 19.03.1](https://github.com/docker/docker-ce/releases/tag/v19.03.1)
 - [Docker Compose 1.24.1](https://github.com/docker/compose/releases/tag/1.24.1)
 - [Alpine 3.10](https://alpinelinux.org/posts/Alpine-3.10.0-released.html)
 - Linux Kernel 4.9.184
 - [Docker Credential Helpers 0.6.3](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.3)
@z

@x
#### New
@y
{% comment %}
### New
{% endcomment %}
{: #new-10 }
### 新機能
@z

@x
 - Introduced a new user interface for the Docker Desktop **Preferences** menu.
 - The **Restart**, **Reset**, and **Uninstall** options are now available on the **Troubleshoot** menu.
@y
 - Introduced a new user interface for the Docker Desktop **Preferences** menu.
 - The **Restart**, **Reset**, and **Uninstall** options are now available on the **Troubleshoot** menu.
@z

@x
#### Bug fixes and minor changes
@y
{% comment %}
### Bug fixes and minor changes
{% endcomment %}
{: #bug-fixes-and-minor-changes-24 }
### バグフィックスとマイナーチェンジ
@z

@x
- Changed the host's Kubernetes context to ensure `docker run -v .kube:kube ... kubectl` works.
- Restricted cluster-admin role on local Kubernetes cluster to `kube-system` namespace.
- Fixed Kubernetes installation with VPNkit subnet.
- Reduced the VM startup time. swap is not created every time a virtual machine boots.
- Fixed a bug where the process output was not redirected to stdout when gathering diagnostics on Windows, which sometimes resulted in a crash.
- Added `/etc/machine-id` to the virtual machine. Fixes [docker/for-mac#3554](https://github.com/docker/for-mac/issues/3554).
@y
- Changed the host's Kubernetes context to ensure `docker run -v .kube:kube ... kubectl` works.
- Restricted cluster-admin role on local Kubernetes cluster to `kube-system` namespace.
- Fixed Kubernetes installation with VPNkit subnet.
- Reduced the VM startup time. swap is not created every time a virtual machine boots.
- Fixed a bug where the process output was not redirected to stdout when gathering diagnostics on Windows, which sometimes resulted in a crash.
- Added `/etc/machine-id` to the virtual machine. Fixes [docker/for-mac#3554](https://github.com/docker/for-mac/issues/3554).
@z

@x
## Docker Community Edition 2.0.5.0 2019-06-12
@y
## Docker Community Edition 2.0.5.0 2019-06-12
@z

@x
[Download](https://download.docker.com/mac/edge/35318/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/35318/Docker.dmg)
@z

@x
This is the Edge channel, which gives you early access to our newest features. Be aware that some of them may be experimental, and some of them may not ever reach the Stable release.
@y
This is the Edge channel, which gives you early access to our newest features. Be aware that some of them may be experimental, and some of them may not ever reach the Stable release.
@z

@x
This release contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after install.
@y
This release contains a Kubernetes upgrade. Note that your local Kubernetes cluster will be reset after install.
@z

@x
* Upgrades
  - [Docker 19.03.0-rc2](https://github.com/docker/docker-ce/releases/tag/v19.03.0-rc2)
  - [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.3)
  - [Compose on Kubernetes 0.4.23](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.23)
  - [linuxkit v0.7](https://github.com/linuxkit/linuxkit/releases/tag/v0.7)
  - [Qemu 4.0.0](https://github.com/docker/binfmt) for cross compiling for ARM
@y
* Upgrades
  - [Docker 19.03.0-rc2](https://github.com/docker/docker-ce/releases/tag/v19.03.0-rc2)
  - [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.3)
  - [Compose on Kubernetes 0.4.23](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.23)
  - [linuxkit v0.7](https://github.com/linuxkit/linuxkit/releases/tag/v0.7)
  - [Qemu 4.0.0](https://github.com/docker/binfmt) for cross compiling for ARM
@z

@x
* New
  - Docker Desktop includes the `buildx` plugin (currently experimental).
  - Selecting the `Experimental features` checkbox on the Docker Desktop Preferences Daemon page enables experimental features in the  Docker daemon and the Docker CLI.
  - Docker Desktop has improved the reliability of `com.docker.osxfs trace` performance profiling command.
  - Users can now run the `com.docker.osxfs trace --summary` option to get a high-level summary of operations, instead of receiving a trace of all operations.
  - Docker Desktop now supports large lists of DNS resource records on Mac. Fixes [docker/for-mac#2160](https://github.com/docker/for-mac/issues/2160#issuecomment-431571031)
@y
* New
  - Docker Desktop includes the `buildx` plugin (currently experimental).
  - Selecting the `Experimental features` checkbox on the Docker Desktop Preferences Daemon page enables experimental features in the  Docker daemon and the Docker CLI.
  - Docker Desktop has improved the reliability of `com.docker.osxfs trace` performance profiling command.
  - Users can now run the `com.docker.osxfs trace --summary` option to get a high-level summary of operations, instead of receiving a trace of all operations.
  - Docker Desktop now supports large lists of DNS resource records on Mac. Fixes [docker/for-mac#2160](https://github.com/docker/for-mac/issues/2160#issuecomment-431571031)
@z

@x
* Bug fixes and minor changes
  - Docker Desktop does not send DNS queries for `docker-desktop.<domain>` every 10s. It now relies on the host's DNS domain search order rather than trying to replicate it inside the VM.
  - Docker Desktop has removed the ability to log in using email address as a username as the Docker command line does not support this.
  - Docker Desktop now allows running a Docker registry inside a container. Fixes [docker/for-mac#3611](https://github.com/docker/for-mac/issues/3611)
  - Fixed a stability issue with the DNS resolver.
@y
* Bug fixes and minor changes
  - Docker Desktop does not send DNS queries for `docker-desktop.<domain>` every 10s. It now relies on the host's DNS domain search order rather than trying to replicate it inside the VM.
  - Docker Desktop has removed the ability to log in using email address as a username as the Docker command line does not support this.
  - Docker Desktop now allows running a Docker registry inside a container. Fixes [docker/for-mac#3611](https://github.com/docker/for-mac/issues/3611)
  - Fixed a stability issue with the DNS resolver.
@z

@x
## Docker Community Edition 2.0.4.1 2019-05-07
@y
## Docker Community Edition 2.0.4.1 2019-05-07
@z

@x
[Download](https://download.docker.com/mac/edge/34207/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/34207/Docker.dmg)
@z

@x
* Bug fixes and minor changes
  - Upgrade QEMU from 2.8.0 to 3.1.0 to fix an emulation issue when building and running Java applications on Arm64 devices.
@y
* Bug fixes and minor changes
  - Upgrade QEMU from 2.8.0 to 3.1.0 to fix an emulation issue when building and running Java applications on Arm64 devices.
@z

@x
## Docker Community Edition 2.0.4.0 2019-04-30
@y
## Docker Community Edition 2.0.4.0 2019-04-30
@z

@x
[Download](https://download.docker.com/mac/edge/33772/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/33772/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 19.03.0-beta3](https://github.com/docker/docker-ce/releases/tag/v19.03.0-beta3)
  - [Docker Compose 1.24.0](https://github.com/docker/compose/releases/tag/1.24.0)
  - [Compose on Kubernetes 0.4.22](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.22)
  - [Kubernetes 1.14.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.14.md#changelog-since-v1141)
@y
* Upgrades
  - [Docker 19.03.0-beta3](https://github.com/docker/docker-ce/releases/tag/v19.03.0-beta3)
  - [Docker Compose 1.24.0](https://github.com/docker/compose/releases/tag/1.24.0)
  - [Compose on Kubernetes 0.4.22](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.22)
  - [Kubernetes 1.14.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.14.md#changelog-since-v1141)
@z

@x
* New
  - App: Docker CLI plugin to configure, share, and install applications
@y
* New
  - App: Docker CLI plugin to configure, share, and install applications
@z

@x
    - Extend Compose files with metadata and parameters
    - Reuse the same application across multiple environments (Development/QA/Staging/Production)
    - Multi-orchestrator installation (Swarm or Kubernetes)
    - Push/Pull/Promotion/Signing supported for application, with the same workflow as images
    - Fully CNAB compliant
    - Full support for Docker Contexts
@y
    - Extend Compose files with metadata and parameters
    - Reuse the same application across multiple environments (Development/QA/Staging/Production)
    - Multi-orchestrator installation (Swarm or Kubernetes)
    - Push/Pull/Promotion/Signing supported for application, with the same workflow as images
    - Fully CNAB compliant
    - Full support for Docker Contexts
@z

@x
  - Buildx (Tech Preview): Docker CLI plugin for extended build capabilities with BuildKit
@y
  - Buildx (Tech Preview): Docker CLI plugin for extended build capabilities with BuildKit
@z

@x
    - Familiar UI from docker build
    - Full BuildKit capabilities with container driver
    - Multiple builder instance support
    - Multi-node builds for cross-platform images (out-of-the-box support for linux/arm/v7 and linux/arm64)
    - Parallel building of Compose files
    - High-level build constructs with `bake`
@y
    - Familiar UI from docker build
    - Full BuildKit capabilities with container driver
    - Multiple builder instance support
    - Multi-node builds for cross-platform images (out-of-the-box support for linux/arm/v7 and linux/arm64)
    - Parallel building of Compose files
    - High-level build constructs with `bake`
@z

@x
* Bug fixes and minor changes
  - Truncate UDP DNS responses which are over 512 bytes in size
@y
* Bug fixes and minor changes
  - Truncate UDP DNS responses which are over 512 bytes in size
@z

@x
## Docker Community Edition 2.0.3.0 2019-03-05
@y
## Docker Community Edition 2.0.3.0 2019-03-05
@z

@x
[Download](https://download.docker.com/mac/edge/31778/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/31778/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.09.3](https://github.com/docker/docker-ce/releases/tag/v18.09.3)
@y
* Upgrades
  - [Docker 18.09.3](https://github.com/docker/docker-ce/releases/tag/v18.09.3)
@z

@x
* Bug fixes and minor changes
  - Fixed port 8080 that was used on localhost when starting Kubernetes. Fixes [docker/for-mac#3522](https://github.com/docker/for-mac/issues/3522)
  - Error message improvements, do not propose to run diagnostics / reset to factory default when not appropriate.
@y
* Bug fixes and minor changes
  - Fixed port 8080 that was used on localhost when starting Kubernetes. Fixes [docker/for-mac#3522](https://github.com/docker/for-mac/issues/3522)
  - Error message improvements, do not propose to run diagnostics / reset to factory default when not appropriate.
@z

@x
### Docker Community Edition 2.0.2.1 2019-02-15
@y
### Docker Community Edition 2.0.2.1 2019-02-15
@z

@x
[Download](https://download.docker.com/mac/edge/31274/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/31274/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.09.2](https://github.com/docker/docker-ce/releases/tag/v18.09.2), fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
@y
* Upgrades
  - [Docker 18.09.2](https://github.com/docker/docker-ce/releases/tag/v18.09.2), fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
@z

@x
## Docker Community Edition 2.0.2.0 2019-02-06
@y
## Docker Community Edition 2.0.2.0 2019-02-06
@z

@x
[Download](https://download.docker.com/mac/edge/30972/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/30972/Docker.dmg)
@z

@x
* Upgrades
  - [Docker Compose 1.24.0-rc1](https://github.com/docker/compose/releases/tag/1.24.0-rc1)
  - [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
  - [Compose on Kubernetes 0.4.18](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.18)
@y
* Upgrades
  - [Docker Compose 1.24.0-rc1](https://github.com/docker/compose/releases/tag/1.24.0-rc1)
  - [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
  - [Compose on Kubernetes 0.4.18](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.18)
@z

@x
* New
  - Rebranded UI
@y
* New
  - Rebranded UI
@z

@x
* Bug fixes and minor changes
  - Kubernetes: use default maximum number of pods for kubelet. [docker/for-mac#3453](https://github.com/docker/for-mac/issues/3453)
  - Fix DockerHelper crash. [docker/for-mac#3470](https://github.com/docker/for-mac/issues/3470)
  - Fix binding of privileged ports with specified IP. [docker/for-mac#3464](https://github.com/docker/for-mac/issues/3464)
@y
* Bug fixes and minor changes
  - Kubernetes: use default maximum number of pods for kubelet. [docker/for-mac#3453](https://github.com/docker/for-mac/issues/3453)
  - Fix DockerHelper crash. [docker/for-mac#3470](https://github.com/docker/for-mac/issues/3470)
  - Fix binding of privileged ports with specified IP. [docker/for-mac#3464](https://github.com/docker/for-mac/issues/3464)
@z

@x
## Docker Community Edition 2.0.1.0 2019-01-11
@y
## Docker Community Edition 2.0.1.0 2019-01-11
@z

@x
[Download](https://download.docker.com/mac/edge/30090/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/30090/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.09.1](https://github.com/docker/docker-ce/releases/tag/v18.09.1)
  - [Kubernetes 1.13.0](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.13.md#v1130)
  - [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
  - Golang 1.10.6, fixes CVEs: [CVE-2018-16875](https://www.cvedetails.com/cve/CVE-2018-16875), [CVE-2018-16873](https://www.cvedetails.com/cve/CVE-2018-16873) and [CVE-2018-16874](https://www.cvedetails.com/cve/CVE-2018-16874)
@y
* Upgrades
  - [Docker 18.09.1](https://github.com/docker/docker-ce/releases/tag/v18.09.1)
  - [Kubernetes 1.13.0](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.13.md#v1130)
  - [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
  - Golang 1.10.6, fixes CVEs: [CVE-2018-16875](https://www.cvedetails.com/cve/CVE-2018-16875), [CVE-2018-16873](https://www.cvedetails.com/cve/CVE-2018-16873) and [CVE-2018-16874](https://www.cvedetails.com/cve/CVE-2018-16874)
@z

@x
  WARNING: If you have an existing Kubernetes cluster created with Docker Desktop, this upgrade will reset the cluster. If you need to back up your Kubernetes cluster or persistent volumes you can use [Ark](https://github.com/heptio/ark).
@y
  WARNING: If you have an existing Kubernetes cluster created with Docker Desktop, this upgrade will reset the cluster. If you need to back up your Kubernetes cluster or persistent volumes you can use [Ark](https://github.com/heptio/ark).
@z

@x
* Bug fixes and minor changes
  - Fix service log collection in diagnostics
  - Gather /etc/hosts to help diagnostics
  - Ensure localhost resolves to 127.0.0.1. Related to [docker/for-mac#2990](https://github.com/docker/for-mac/issues/2990#issuecomment-443097942), [docker/for-mac#3383](https://github.com/docker/for-mac/issues/3383)
  - Add 18.09 missing daemon options
  - Rename Docker for Mac to Docker Desktop
  - Partially open services ports if possible. [docker/for-mac#3438](https://github.com/docker/for-mac/issues/3438)
@y
* Bug fixes and minor changes
  - Fix service log collection in diagnostics
  - Gather /etc/hosts to help diagnostics
  - Ensure localhost resolves to 127.0.0.1. Related to [docker/for-mac#2990](https://github.com/docker/for-mac/issues/2990#issuecomment-443097942), [docker/for-mac#3383](https://github.com/docker/for-mac/issues/3383)
  - Add 18.09 missing daemon options
  - Rename Docker for Mac to Docker Desktop
  - Partially open services ports if possible. [docker/for-mac#3438](https://github.com/docker/for-mac/issues/3438)
@z

@x
## Edge Releases of 2018
@y
## Edge Releases of 2018
@z

@x
### Docker Community Edition 2.0.0.0-mac82 2018-12-07
@y
### Docker Community Edition 2.0.0.0-mac82 2018-12-07
@z

@x
[Download](https://download.docker.com/mac/edge/29268/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/29268/Docker.dmg)
@z

@x
* Upgrades
  - [Docker compose 1.23.2](https://github.com/docker/compose/releases/tag/1.23.2)
  - [Docker Machine 0.16.0](https://github.com/docker/machine/releases/tag/v0.16.0)
@y
* Upgrades
  - [Docker compose 1.23.2](https://github.com/docker/compose/releases/tag/1.23.2)
  - [Docker Machine 0.16.0](https://github.com/docker/machine/releases/tag/v0.16.0)
@z

@x
### Docker Community Edition 2.0.0.0-mac77 2018-11-14
@y
### Docker Community Edition 2.0.0.0-mac77 2018-11-14
@z

@x
[Download](https://download.docker.com/mac/edge/28700/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/28700/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.09.0](https://github.com/docker/docker-ce-packaging/releases/tag/v18.09.0)
  - [Docker compose 1.23.1](https://github.com/docker/compose/releases/tag/1.23.1)
  - [Kitematic 0.17.5](https://github.com/docker/kitematic/releases/tag/v0.17.5)
@y
* Upgrades
  - [Docker 18.09.0](https://github.com/docker/docker-ce-packaging/releases/tag/v18.09.0)
  - [Docker compose 1.23.1](https://github.com/docker/compose/releases/tag/1.23.1)
  - [Kitematic 0.17.5](https://github.com/docker/kitematic/releases/tag/v0.17.5)
@z

@x
* Bug fixes and minor changes
  - Fix appearance in dark mode for OS X 10.14 (Mojave)
  - VPNKit: Improved scalability of port forwarding. Related to [docker/for-mac#2841](https://github.com/docker/for-mac/issues/2841)
  - VPNKit: Limit the size of the UDP NAT table. This ensures port forwarding and regular TCP traffic continue even when running very chatty UDP protocols.
  - Ensure Kubernetes can be installed when using a non-default internal IP subnet.
@y
* Bug fixes and minor changes
  - Fix appearance in dark mode for OS X 10.14 (Mojave)
  - VPNKit: Improved scalability of port forwarding. Related to [docker/for-mac#2841](https://github.com/docker/for-mac/issues/2841)
  - VPNKit: Limit the size of the UDP NAT table. This ensures port forwarding and regular TCP traffic continue even when running very chatty UDP protocols.
  - Ensure Kubernetes can be installed when using a non-default internal IP subnet.
@z

@x
### Docker Community Edition 2.0.0.0-beta1-mac75 2018-09-14
@y
### Docker Community Edition 2.0.0.0-beta1-mac75 2018-09-14
@z

@x
[Download](https://download.docker.com/mac/edge/27117/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/27117/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.09.0-ce-beta1](https://github.com/docker/docker-ce/releases/tag/v18.09.0-ce-beta1)
  - Linux Kernel 4.9.125
@y
* Upgrades
  - [Docker 18.09.0-ce-beta1](https://github.com/docker/docker-ce/releases/tag/v18.09.0-ce-beta1)
  - Linux Kernel 4.9.125
@z

@x
* New
  - New version scheme
@y
* New
  - New version scheme
@z

@x
* Deprecation
  - Removed support of AUFS
  - Removed support of OS X 10.11
@y
* Deprecation
  - Removed support of AUFS
  - Removed support of OS X 10.11
@z

@x
* Bug fixes and minor changes
  - Fix panic in diagnose
@y
* Bug fixes and minor changes
  - Fix panic in diagnose
@z

@x
### Docker Community Edition 18.06.1-ce-mac74 2018-08-29
@y
### Docker Community Edition 18.06.1-ce-mac74 2018-08-29
@z

@x
[Download](https://download.docker.com/mac/edge/26766/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/26766/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.06.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.1-ce)
@y
* Upgrades
  - [Docker 18.06.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.1-ce)
@z

@x
* Bug fixes and minor changes
  - Fix local DNS failing to resolve inside containers.
@y
* Bug fixes and minor changes
  - Fix local DNS failing to resolve inside containers.
@z

@x
### Docker Community Edition 18.06.0-ce-mac69 2018-07-25
@y
### Docker Community Edition 18.06.0-ce-mac69 2018-07-25
@z

@x
[Download](https://download.docker.com/mac/edge/26398/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/26398/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
@y
* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
@z

@x
* Bug fixes and minor changes
  - Fix bug in experimental SOCKS server. See [docker/for-mac#2670](https://github.com/docker/for-mac/issues/2670)
  - Fix bug in docker login when "Securely store Docker logins in macOS keychain" is unchecked. Fixed [docker/for-mac#3104](https://github.com/docker/for-mac/issues/3104)
@y
* Bug fixes and minor changes
  - Fix bug in experimental SOCKS server. See [docker/for-mac#2670](https://github.com/docker/for-mac/issues/2670)
  - Fix bug in docker login when "Securely store Docker logins in macOS keychain" is unchecked. Fixed [docker/for-mac#3104](https://github.com/docker/for-mac/issues/3104)
@z

@x
### Docker Community Edition 18.06.0-ce-rc3-mac68 2018-07-19
@y
### Docker Community Edition 18.06.0-ce-rc3-mac68 2018-07-19
@z

@x
[Download](https://download.docker.com/mac/edge/26342/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/26342/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.06.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce-rc3)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
@y
* Upgrades
  - [Docker 18.06.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce-rc3)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
@z

@x
* New
  - Add an experimental SOCKS server to allow access to container networks, see [docker/for-mac#2670](https://github.com/docker/for-mac/issues/2670#issuecomment-372365274). Also see [docker/for-mac#2721](https://github.com/docker/for-mac/issues/2721)
@y
* New
  - Add an experimental SOCKS server to allow access to container networks, see [docker/for-mac#2670](https://github.com/docker/for-mac/issues/2670#issuecomment-372365274). Also see [docker/for-mac#2721](https://github.com/docker/for-mac/issues/2721)
@z

@x
* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset disk image (in Preferences > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - Fix startup issue with AUFS [docker/for-mac#2804](https://github.com/docker/for-mac/issues/2804)
  - Fix status bug which could prevent the Kubernetes cluster from starting. Fixes [docker/for-mac#2990](https://github.com/docker/for-mac/issues/2990)
  - Fix bug which would cause virtual machine logs to be written to RAM rather than disk in some cases, and the virtual machine to hang. See [docker/for-mac#2984](https://github.com/docker/for-mac/issues/2984)
  - Fix network connection leak triggered by haproxy TCP health-checks [docker/for-mac#1132](https://github.com/docker/for-mac/issues/1132)
  - Better message to reset vmnetd when it's disabled. See [docker/for-mac#3035](https://github.com/docker/for-mac/issues/3035)
@y
* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset disk image (in Preferences > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - Fix startup issue with AUFS [docker/for-mac#2804](https://github.com/docker/for-mac/issues/2804)
  - Fix status bug which could prevent the Kubernetes cluster from starting. Fixes [docker/for-mac#2990](https://github.com/docker/for-mac/issues/2990)
  - Fix bug which would cause virtual machine logs to be written to RAM rather than disk in some cases, and the virtual machine to hang. See [docker/for-mac#2984](https://github.com/docker/for-mac/issues/2984)
  - Fix network connection leak triggered by haproxy TCP health-checks [docker/for-mac#1132](https://github.com/docker/for-mac/issues/1132)
  - Better message to reset vmnetd when it's disabled. See [docker/for-mac#3035](https://github.com/docker/for-mac/issues/3035)
@z

@x
### Docker Community Edition 18.05.0-ce-mac67 2018-06-07
@y
### Docker Community Edition 18.05.0-ce-mac67 2018-06-07
@z

@x
[Download](https://download.docker.com/mac/edge/25042/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/25042/Docker.dmg)
@z

@x
* Upgrades
  - [LinuxKit v0.4](https://github.com/linuxkit/linuxkit/releases/tag/v0.4)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled
  - [Kubernetes 1.10.3](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.10.md#v1103). If Kubernetes is enabled, the upgrade will be performed automatically when starting Docker Desktop for Mac.
@y
* Upgrades
  - [LinuxKit v0.4](https://github.com/linuxkit/linuxkit/releases/tag/v0.4)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled
  - [Kubernetes 1.10.3](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.10.md#v1103). If Kubernetes is enabled, the upgrade will be performed automatically when starting Docker Desktop for Mac.
@z

@x
* Bug fixes and minor changes
  - Fix VPNKit memory leak. Fixes [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Fix com.docker.supervisor using 100% CPU. Fixes [docker/for-mac#2967](https://github.com/docker/for-mac/issues/2967), [docker/for-mac#2923](https://github.com/docker/for-mac/issues/2923)
  - Do not override existing kubectl binary in /usr/local/bin (installed with brew or otherwise). Fixes [docker/for-mac#2368](https://github.com/docker/for-mac/issues/2368), [docker/for-mac#2890](https://github.com/docker/for-mac/issues/2890)
  - Detect Vmnetd install error. Fixes [docker/for-mac#2934](https://github.com/docker/for-mac/issues/2934), [docker/for-mac#2687](https://github.com/docker/for-mac/issues/2687) 
  - Virtual machine default disk path is stored relative to $HOME. Fixes [docker/for-mac#2928](https://github.com/docker/for-mac/issues/2928), [docker/for-mac#1209](https://github.com/docker/for-mac/issues/1209)
@y
* Bug fixes and minor changes
  - Fix VPNKit memory leak. Fixes [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Fix com.docker.supervisor using 100% CPU. Fixes [docker/for-mac#2967](https://github.com/docker/for-mac/issues/2967), [docker/for-mac#2923](https://github.com/docker/for-mac/issues/2923)
  - Do not override existing kubectl binary in /usr/local/bin (installed with brew or otherwise). Fixes [docker/for-mac#2368](https://github.com/docker/for-mac/issues/2368), [docker/for-mac#2890](https://github.com/docker/for-mac/issues/2890)
  - Detect Vmnetd install error. Fixes [docker/for-mac#2934](https://github.com/docker/for-mac/issues/2934), [docker/for-mac#2687](https://github.com/docker/for-mac/issues/2687) 
  - Virtual machine default disk path is stored relative to $HOME. Fixes [docker/for-mac#2928](https://github.com/docker/for-mac/issues/2928), [docker/for-mac#1209](https://github.com/docker/for-mac/issues/1209)
@z

@x
### Docker Community Edition 18.05.0-ce-mac66 2018-05-17
@y
### Docker Community Edition 18.05.0-ce-mac66 2018-05-17
@z

@x
[Download](https://download.docker.com/mac/edge/24545/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/24545/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.05.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.05.0-ce)
  - [Docker compose 1.21.2](https://github.com/docker/compose/releases/tag/1.21.2)
@y
* Upgrades
  - [Docker 18.05.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.05.0-ce)
  - [Docker compose 1.21.2](https://github.com/docker/compose/releases/tag/1.21.2)
@z

@x
* New 
  - Allow orchestrator selection from the UI in the "Kubernetes" pane, to allow "docker stack" commands to deploy to Swarm clusters, even if Kubernetes is enabled in Docker for Mac.
@y
* New 
  - Allow orchestrator selection from the UI in the "Kubernetes" pane, to allow "docker stack" commands to deploy to Swarm clusters, even if Kubernetes is enabled in Docker for Mac.
@z

@x
* Bug fixes and minor changes
  - Use Simple NTP to minimise clock drift between the virtual machine and the host. Fixes [docker/for-mac#2076](https://github.com/docker/for-mac/issues/2076)
  - Fix filesystem event notifications for Swarm services and those using the new-style --mount option. Fixes [docker/for-mac#2216](https://github.com/docker/for-mac/issues/2216), [docker/for-mac#2375](https://github.com/docker/for-mac/issues/2375)
  - Fix filesystem event delivery to Kubernetes pods when the path to the bind mount is a symlink.
  - Fix a race between calling stat on a file and calling close of a file descriptor referencing the file that could result in the stat failing with EBADF (often presented as "File not found"). Fixes [docker/for-mac#2870](https://github.com/docker/for-mac/issues/2870)
  - Do not allow install of Docker for Mac on macOS Yosemite 10.10; this version has not been supported since Docker for Mac 17.09.0.
  - Fix button order in reset dialog windows. Fixes [docker/for-mac#2827](https://github.com/docker/for-mac/issues/2827)
  - Diagnostics are run when diagnostics window is displayed; user is prompted to upload them when available.
@y
* Bug fixes and minor changes
  - Use Simple NTP to minimise clock drift between the virtual machine and the host. Fixes [docker/for-mac#2076](https://github.com/docker/for-mac/issues/2076)
  - Fix filesystem event notifications for Swarm services and those using the new-style --mount option. Fixes [docker/for-mac#2216](https://github.com/docker/for-mac/issues/2216), [docker/for-mac#2375](https://github.com/docker/for-mac/issues/2375)
  - Fix filesystem event delivery to Kubernetes pods when the path to the bind mount is a symlink.
  - Fix a race between calling stat on a file and calling close of a file descriptor referencing the file that could result in the stat failing with EBADF (often presented as "File not found"). Fixes [docker/for-mac#2870](https://github.com/docker/for-mac/issues/2870)
  - Do not allow install of Docker for Mac on macOS Yosemite 10.10; this version has not been supported since Docker for Mac 17.09.0.
  - Fix button order in reset dialog windows. Fixes [docker/for-mac#2827](https://github.com/docker/for-mac/issues/2827)
  - Diagnostics are run when diagnostics window is displayed; user is prompted to upload them when available.
@z

@x
### Docker Community Edition 18.05.0-ce-rc1-mac63 2018-04-26
@y
### Docker Community Edition 18.05.0-ce-rc1-mac63 2018-04-26
@z

@x
[Download](https://download.docker.com/mac/edge/24246/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/24246/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.05.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v18.05.0-ce-rc1)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@y
* Upgrades
  - [Docker 18.05.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v18.05.0-ce-rc1)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
@z

@x
* New 
  - Re-enable raw as the default disk format for users running macOS 10.13.4 and higher. Note this change only takes effect after a "reset to factory defaults" or "remove all data" (from the Whale menu > Preferences > Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
@y
* New 
  - Re-enable raw as the default disk format for users running macOS 10.13.4 and higher. Note this change only takes effect after a "reset to factory defaults" or "remove all data" (from the Whale menu > Preferences > Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
@z

@x
* Bug fixes and minor changes
  - Fix Docker for Mac not starting due to socket file paths being too long (typically HOME folder path being too long). Fixes [docker/for-mac#2727](https://github.com/docker/for-mac/issues/2727), [docker/for-mac#2731](https://github.com/docker/for-mac/issues/2731).
@y
* Bug fixes and minor changes
  - Fix Docker for Mac not starting due to socket file paths being too long (typically HOME folder path being too long). Fixes [docker/for-mac#2727](https://github.com/docker/for-mac/issues/2727), [docker/for-mac#2731](https://github.com/docker/for-mac/issues/2731).
@z

@x
### Docker Community Edition 18.04.0-ce-mac62 2018-04-12
@y
### Docker Community Edition 18.04.0-ce-mac62 2018-04-12
@z

@x
[Download](https://download.docker.com/mac/edge/23965/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/23965/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.04.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.04.0-ce)
  - [Docker compose 1.21.0](https://github.com/docker/compose/releases/tag/1.21.0)
@y
* Upgrades
  - [Docker 18.04.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.04.0-ce)
  - [Docker compose 1.21.0](https://github.com/docker/compose/releases/tag/1.21.0)
@z

@x
### Docker Community Edition 18.04.0-ce-rc2-mac61 2018-04-09
@y
### Docker Community Edition 18.04.0-ce-rc2-mac61 2018-04-09
@z

@x
[Download](https://download.docker.com/mac/edge/23890/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/23890/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.04.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v18.04.0-ce-rc2)
  - [Kubernetes 1.9.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.9.md#v196). If Kubernetes is enabled, the upgrade will be performed automatically when starting Docker for Mac.
@y
* Upgrades
  - [Docker 18.04.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v18.04.0-ce-rc2)
  - [Kubernetes 1.9.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.9.md#v196). If Kubernetes is enabled, the upgrade will be performed automatically when starting Docker for Mac.
@z

@x
* New 
  - Enable ceph & rbd modules in LinuxKit virtual machine.
@y
* New 
  - Enable ceph & rbd modules in LinuxKit virtual machine.
@z

@x
* Bug fixes and minor changes
  - Fix upgrade straight from pre-17.12 versions where Docker for Mac cannot restart once the upgrade has been performed. Fixes [docker/for-mac#2739](https://github.com/docker/for-mac/issues/2739)
@y
* Bug fixes and minor changes
  - Fix upgrade straight from pre-17.12 versions where Docker for Mac cannot restart once the upgrade has been performed. Fixes [docker/for-mac#2739](https://github.com/docker/for-mac/issues/2739)
@z

@x
### Docker Community Edition 18.03.0-ce-mac58 2018-03-26
@y
### Docker Community Edition 18.03.0-ce-mac58 2018-03-26
@z

@x
[Download](https://download.docker.com/mac/edge/23607/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/23607/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.03.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce)
  - [Docker compose 1.20.1](https://github.com/docker/compose/releases/tag/1.20.1)
@y
* Upgrades
  - [Docker 18.03.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce)
  - [Docker compose 1.20.1](https://github.com/docker/compose/releases/tag/1.20.1)
@z

@x
### Docker Community Edition 18.03.0-ce-rc4-mac57 2018-03-15
@y
### Docker Community Edition 18.03.0-ce-rc4-mac57 2018-03-15
@z

@x
[Download](https://download.docker.com/mac/edge/23352/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/23352/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.03.0-ce-rc4](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce-rc4)
  - AUFS 20180312
@y
* Upgrades
  - [Docker 18.03.0-ce-rc4](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce-rc4)
  - AUFS 20180312
@z

@x
* Bug fixes and minor changes
  - Fix support for AUFS. Fixes [docker/for-win#1831](https://github.com/docker/for-win/issues/1831)
  - Fix synchronisation between CLI `docker login` and GUI login.
@y
* Bug fixes and minor changes
  - Fix support for AUFS. Fixes [docker/for-win#1831](https://github.com/docker/for-win/issues/1831)
  - Fix synchronisation between CLI `docker login` and GUI login.
@z

@x
### Docker Community Edition 18.03.0-ce-rc3-mac56 2018-03-13
@y
### Docker Community Edition 18.03.0-ce-rc3-mac56 2018-03-13
@z

@x
[Download](https://download.docker.com/mac/edge/23287/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/23287/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.03.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce-rc3)
  - [Docker Machine 0.14.0](https://github.com/docker/machine/releases/tag/v0.14.0)
  - [Docker compose 1.20.0-rc2](https://github.com/docker/compose/releases/tag/1.20.0-rc2)
  - [Notary 0.6.0](https://github.com/docker/notary/releases/tag/v0.6.0)
  - Linux Kernel 4.9.87
@y
* Upgrades
  - [Docker 18.03.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce-rc3)
  - [Docker Machine 0.14.0](https://github.com/docker/machine/releases/tag/v0.14.0)
  - [Docker compose 1.20.0-rc2](https://github.com/docker/compose/releases/tag/1.20.0-rc2)
  - [Notary 0.6.0](https://github.com/docker/notary/releases/tag/v0.6.0)
  - Linux Kernel 4.9.87
@z

@x
* Bug fixes and minor changes
  - Fix for the HTTP/S transparent proxy when using "localhost" names (for example "host.docker.internal", "docker.for.mac.host.internal", "docker.for.mac.localhost").
  - Fix daemon not starting properly when setting TLS-related options. Fixes [docker/for-mac#2663](https://github.com/docker/for-mac/issues/2663)
@y
* Bug fixes and minor changes
  - Fix for the HTTP/S transparent proxy when using "localhost" names (for example "host.docker.internal", "docker.for.mac.host.internal", "docker.for.mac.localhost").
  - Fix daemon not starting properly when setting TLS-related options. Fixes [docker/for-mac#2663](https://github.com/docker/for-mac/issues/2663)
@z

@x
### Docker Community Edition 18.03.0-ce-rc1-mac54 2018-02-27
@y
### Docker Community Edition 18.03.0-ce-rc1-mac54 2018-02-27
@z

@x
[Download](https://download.docker.com/mac/edge/23022/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/23022/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.03.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce-rc1)
@y
* Upgrades
  - [Docker 18.03.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce-rc1)
@z

@x
* New
  - Virtual machine Swap size can be changed in settings. See [docker/for-mac#2566](https://github.com/docker/for-mac/issues/2566), [docker/for-mac#2389](https://github.com/docker/for-mac/issues/2389)
  - Support NFS Volume sharing. Also works in Kubernetes.
@y
* New
  - Virtual machine Swap size can be changed in settings. See [docker/for-mac#2566](https://github.com/docker/for-mac/issues/2566), [docker/for-mac#2389](https://github.com/docker/for-mac/issues/2389)
  - Support NFS Volume sharing. Also works in Kubernetes.
@z

@x
* Bug fixes and minor changes
  - Revert the default disk format to qcow2 for users running macOS 10.13 (High Sierra). There are confirmed reports of file corruption using the raw format which uses sparse files on APFS. This change only takes effect after a reset to factory defaults (from the Whale menu -> Preferences -> Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
  - DNS name `host.docker.internal` should be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Kubernetes Load balanced services are no longer marked as `Pending`.
  - Fix hostPath mounts in Kubernetes.
  - Update Compose on Kubernetes to v0.3.0 rc4. Existing Kubernetes stacks will be removed during migration and need to be re-deployed on the cluster.
@y
* Bug fixes and minor changes
  - Revert the default disk format to qcow2 for users running macOS 10.13 (High Sierra). There are confirmed reports of file corruption using the raw format which uses sparse files on APFS. This change only takes effect after a reset to factory defaults (from the Whale menu -> Preferences -> Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
  - DNS name `host.docker.internal` should be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Kubernetes Load balanced services are no longer marked as `Pending`.
  - Fix hostPath mounts in Kubernetes.
  - Update Compose on Kubernetes to v0.3.0 rc4. Existing Kubernetes stacks will be removed during migration and need to be re-deployed on the cluster.
@z

@x
### Docker Community Edition 18.02.0-ce-mac53 2018-02-09
@y
### Docker Community Edition 18.02.0-ce-mac53 2018-02-09
@z

@x
[Download](https://download.docker.com/mac/edge/22617/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/22617/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.02.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.02.0-ce)
  - [Docker compose 1.19.0](https://github.com/docker/compose/releases/tag/1.19.0)
@y
* Upgrades
  - [Docker 18.02.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.02.0-ce)
  - [Docker compose 1.19.0](https://github.com/docker/compose/releases/tag/1.19.0)
@z

@x
* Bug fixes and minor changes
  - Fix update startup failure in some cases.
  - Fix empty registry added by mistake in some cases in the Preference Daemon Pane. Fixes [docker/for-mac#2537](https://github.com/docker/for-mac/issues/2537)
  - Clearer error message when incompatible hardware is detected. Diagnostics are not proposed in the error popup in this case.
@y
* Bug fixes and minor changes
  - Fix update startup failure in some cases.
  - Fix empty registry added by mistake in some cases in the Preference Daemon Pane. Fixes [docker/for-mac#2537](https://github.com/docker/for-mac/issues/2537)
  - Clearer error message when incompatible hardware is detected. Diagnostics are not proposed in the error popup in this case.
@z

@x
### Docker Community Edition 18.02.0-ce-rc2-mac51 2018-02-02
@y
### Docker Community Edition 18.02.0-ce-rc2-mac51 2018-02-02
@z

@x
[Download](https://download.docker.com/mac/edge/22446/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/22446/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.02.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v18.02.0-ce-rc2)
  - [Docker compose 1.19.0-rc2](https://github.com/docker/compose/releases/tag/1.19.0-rc2)
  - [Kubernetes 1.9.2](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.9.md#v192). If you have Kubernetes enabled, the upgrade will be performed automatically when starting Docker for Mac.
@y
* Upgrades
  - [Docker 18.02.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v18.02.0-ce-rc2)
  - [Docker compose 1.19.0-rc2](https://github.com/docker/compose/releases/tag/1.19.0-rc2)
  - [Kubernetes 1.9.2](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.9.md#v192). If you have Kubernetes enabled, the upgrade will be performed automatically when starting Docker for Mac.
@z

@x
* Bug fixes and minor changes
  - Fix Kubernetes-compose integration update that was causing startup failure. Fixes [docker/for-mac#2536](https://github.com/docker/for-mac/issues/2536)
  - Fix some cases where selecting "Reset" after an error did not reset properly.
  - Fix incorrect NTP config. Fixes [docker/for-mac#2529](https://github.com/docker/for-mac/issues/2529)
@y
* Bug fixes and minor changes
  - Fix Kubernetes-compose integration update that was causing startup failure. Fixes [docker/for-mac#2536](https://github.com/docker/for-mac/issues/2536)
  - Fix some cases where selecting "Reset" after an error did not reset properly.
  - Fix incorrect NTP config. Fixes [docker/for-mac#2529](https://github.com/docker/for-mac/issues/2529)
@z

@x
### Docker Community Edition 18.02.0-ce-rc1-mac50 2018-01-26
@y
### Docker Community Edition 18.02.0-ce-rc1-mac50 2018-01-26
@z

@x
[Download](https://download.docker.com/mac/edge/22256/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/22256/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.02.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v18.02.0-ce-rc1)
@y
* Upgrades
  - [Docker 18.02.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v18.02.0-ce-rc1)
@z

@x
* Bug fixes and minor changes
  - Added "Restart" menu item. See [docker/for-mac#2407](https://github.com/docker/for-mac/issues/2407)
  - Keep any existing kubectl binary when activating Kubernetes in Docker for Mac, and restore it when disabling Kubernetes. Fixes [docker/for-mac#2508](https://github.com/docker/for-mac/issues/2508), [docker/for-mac#2368](https://github.com/docker/for-mac/issues/2368)
  - Fix Kubernetes context selector. Fixes [docker/for-mac#2495](https://github.com/docker/for-mac/issues/2495)
@y
* Bug fixes and minor changes
  - Added "Restart" menu item. See [docker/for-mac#2407](https://github.com/docker/for-mac/issues/2407)
  - Keep any existing kubectl binary when activating Kubernetes in Docker for Mac, and restore it when disabling Kubernetes. Fixes [docker/for-mac#2508](https://github.com/docker/for-mac/issues/2508), [docker/for-mac#2368](https://github.com/docker/for-mac/issues/2368)
  - Fix Kubernetes context selector. Fixes [docker/for-mac#2495](https://github.com/docker/for-mac/issues/2495)
@z

@x
### Docker Community Edition 18.01.0-ce-mac48 2018-01-19
@y
### Docker Community Edition 18.01.0-ce-mac48 2018-01-19
@z

@x
[Download](https://download.docker.com/mac/edge/22004/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/22004/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 18.01.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.01.0-ce)
  - Linux Kernel 4.9.75
@y
* Upgrades
  - [Docker 18.01.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.01.0-ce)
  - Linux Kernel 4.9.75
@z

@x
* New
  - The directory holding the disk images was renamed (from `~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux` to ~/Library/Containers/com.docker.docker/Data/vms/0`).
@y
* New
  - The directory holding the disk images was renamed (from `~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux` to ~/Library/Containers/com.docker.docker/Data/vms/0`).
@z

@x
* Bug fixes and minor changes
  - Fix error during resize/create Docker.raw disk image in some cases. Fixes [docker/for-mac#2383](https://github.com/docker/for-mac/issues/2383), [docker/for-mac#2447](https://github.com/docker/for-mac/issues/2447), [docker/for-mac#2453], (https://github.com/docker/for-mac/issues/2453), [docker/for-mac#2420](https://github.com/docker/for-mac/issues/2420)
  - Fix additional allocated disk space not available in containers. Fixes [docker/for-mac#2449](https://github.com/docker/for-mac/issues/2449)
  - VPNkit port max idle time default restored to 300s. Fixes [docker/for-mac#2442](https://github.com/docker/for-mac/issues/2442)
  - Fix using an HTTP proxy with authentication. Fixes [docker/for-mac#2386](https://github.com/docker/for-mac/issues/2386)
  - Allow HTTP proxy excludes to be written as .docker.com as well as *.docker.com
  - Allow individual IP addresses to be added to HTTP proxy excludes.
  - Avoid hitting DNS timeouts when querying docker.for.mac.* when the upstream DNS servers are slow or missing.
  - Fix for `docker push` to an insecure registry. Fixes [docker/for-mac#2392](https://github.com/docker/for-mac/issues/2392)
  - Separate internal ports used to proxy HTTP and HTTPS content.
  - If kubectl was already installed before Docker For Mac, restore the existing kubectl when sitching Kubernetes off in Docker for Mac.
  - Migration of Docker Toolbox images is not proposed anymore in Docker For Mac installer (still possible to migrate Toolbox images manually).
@y
* Bug fixes and minor changes
  - Fix error during resize/create Docker.raw disk image in some cases. Fixes [docker/for-mac#2383](https://github.com/docker/for-mac/issues/2383), [docker/for-mac#2447](https://github.com/docker/for-mac/issues/2447), [docker/for-mac#2453], (https://github.com/docker/for-mac/issues/2453), [docker/for-mac#2420](https://github.com/docker/for-mac/issues/2420)
  - Fix additional allocated disk space not available in containers. Fixes [docker/for-mac#2449](https://github.com/docker/for-mac/issues/2449)
  - VPNkit port max idle time default restored to 300s. Fixes [docker/for-mac#2442](https://github.com/docker/for-mac/issues/2442)
  - Fix using an HTTP proxy with authentication. Fixes [docker/for-mac#2386](https://github.com/docker/for-mac/issues/2386)
  - Allow HTTP proxy excludes to be written as .docker.com as well as *.docker.com
  - Allow individual IP addresses to be added to HTTP proxy excludes.
  - Avoid hitting DNS timeouts when querying docker.for.mac.* when the upstream DNS servers are slow or missing.
  - Fix for `docker push` to an insecure registry. Fixes [docker/for-mac#2392](https://github.com/docker/for-mac/issues/2392)
  - Separate internal ports used to proxy HTTP and HTTPS content.
  - If kubectl was already installed before Docker For Mac, restore the existing kubectl when sitching Kubernetes off in Docker for Mac.
  - Migration of Docker Toolbox images is not proposed anymore in Docker For Mac installer (still possible to migrate Toolbox images manually).
@z

@x
### Docker Community Edition 17.12.0-ce-mac45 2018-01-05
@y
### Docker Community Edition 17.12.0-ce-mac45 2018-01-05
@z

@x
[Download](https://download.docker.com/mac/edge/21669/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/21669/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
@y
* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
@z

@x
* New
  - Experimental Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker For Mac Preferences and use kubectl commands as well as docker commands. See [https://docs.docker.com/docker-for-mac/kubernetes/](kubernetes.md)
  - DNS name `docker.for.mac.host.internal` should be used instead of `docker.for.mac.localhost` (still valid) for host resolution from containers, since since there is an RFC banning the use of subdomains of localhost (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
@y
* New
  - Experimental Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker For Mac Preferences and use kubectl commands as well as docker commands. See [https://docs.docker.com/docker-for-mac/kubernetes/](kubernetes.md)
  - DNS name `docker.for.mac.host.internal` should be used instead of `docker.for.mac.localhost` (still valid) for host resolution from containers, since since there is an RFC banning the use of subdomains of localhost (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
@z

@x
* Bug fixes and minor changes
  - The docker engine is configured to use VPNKit as an HTTP proxy, fixing 'docker pull' in environments with no DNS. Fixes [docker/for-mac#2320](https://github.com/docker/for-mac/issues/2320)
@y
* Bug fixes and minor changes
  - The docker engine is configured to use VPNKit as an HTTP proxy, fixing 'docker pull' in environments with no DNS. Fixes [docker/for-mac#2320](https://github.com/docker/for-mac/issues/2320)
@z

@x
## Edge Releases of 2017
@y
## Edge Releases of 2017
@z

@x
### Docker Community Edition 17.12.0-ce-rc4-mac44 2017-12-21
@y
### Docker Community Edition 17.12.0-ce-rc4-mac44 2017-12-21
@z

@x
[Download](https://download.docker.com/mac/edge/21438/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/21438/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 17.12.0-ce-rc4](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce-rc4)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
@y
* Upgrades
  - [Docker 17.12.0-ce-rc4](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce-rc4)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
@z

@x
* Bug fixes and minor changes
  - Display actual size used by the virtual machine disk, especially useful for disks using raw format. See [docker/for-mac#2297](https://github.com/docker/for-mac/issues/2297).
  - Fix more specific edge cases in filesharing settings migration.
@y
* Bug fixes and minor changes
  - Display actual size used by the virtual machine disk, especially useful for disks using raw format. See [docker/for-mac#2297](https://github.com/docker/for-mac/issues/2297).
  - Fix more specific edge cases in filesharing settings migration.
@z

@x
### Docker Community Edition 17.12.0-ce-rc3-mac43 2017-12-15
@y
### Docker Community Edition 17.12.0-ce-rc3-mac43 2017-12-15
@z

@x
[Download](https://download.docker.com/mac/edge/21270/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/21270/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 17.12.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce-rc3)
@y
* Upgrades
  - [Docker 17.12.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce-rc3)
@z

@x
* Bug fixes and minor changes
  - Fix filesharing migration issue ([docker/for-mac#2317](https://github.com/docker/for-mac/issues/2317))
@y
* Bug fixes and minor changes
  - Fix filesharing migration issue ([docker/for-mac#2317](https://github.com/docker/for-mac/issues/2317))
@z

@x
### Docker Community Edition 17.12.0-ce-rc2-mac41 2017-12-13
@y
### Docker Community Edition 17.12.0-ce-rc2-mac41 2017-12-13
@z

@x
* Upgrades
  - [Docker 17.12.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce-rc2)
  - [Docker compose 1.18.0-rc2](https://github.com/docker/compose/releases/tag/1.18.0-rc2)
@y
* Upgrades
  - [Docker 17.12.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce-rc2)
  - [Docker compose 1.18.0-rc2](https://github.com/docker/compose/releases/tag/1.18.0-rc2)
@z

@x
* New
  - Virtual machine disk size can be changed in settings. (See [docker/for-mac#1037](https://github.com/docker/for-mac/issues/1037)).
@y
* New
  - Virtual machine disk size can be changed in settings. (See [docker/for-mac#1037](https://github.com/docker/for-mac/issues/1037)).
@z

@x
* Bug fixes and minor changes
  - Avoid virtual machine reboot when changing host proxy settings.
  - Don't break HTTP traffic between containers by forwarding them through the external proxy [docker/for-mac#981](https://github.com/docker/for-mac/issues/981)
  - Filesharing settings are now stored in settings.json
  - Daemon restart button has been moved to settings / Reset Tab
  - Display various component versions in About box
  - Better virtual machine state handling and error messages in case of virtual machine crashes
@y
* Bug fixes and minor changes
  - Avoid virtual machine reboot when changing host proxy settings.
  - Don't break HTTP traffic between containers by forwarding them through the external proxy [docker/for-mac#981](https://github.com/docker/for-mac/issues/981)
  - Filesharing settings are now stored in settings.json
  - Daemon restart button has been moved to settings / Reset Tab
  - Display various component versions in About box
  - Better virtual machine state handling and error messages in case of virtual machine crashes
@z

@x
### Docker Community Edition 17.11.0-ce-mac40 2017-11-22
@y
### Docker Community Edition 17.11.0-ce-mac40 2017-11-22
@z

@x
[Download](https://download.docker.com/mac/edge/20561/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/20561/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 17.11.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.11.0-ce)
@y
* Upgrades
  - [Docker 17.11.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.11.0-ce)
@z

@x
### Docker Community Edition 17.11.0-ce-rc4-mac39 2017-11-17
@y
### Docker Community Edition 17.11.0-ce-rc4-mac39 2017-11-17
@z

@x
* Upgrades
  - [Docker 17.11.0-ce-rc4](https://github.com/docker/docker-ce/releases/tag/v17.11.0-ce-rc4)
  - [Docker compose 1.17.1](https://github.com/docker/compose/releases/tag/1.17.1)
  - Linux kernel 4.9.60
@y
* Upgrades
  - [Docker 17.11.0-ce-rc4](https://github.com/docker/docker-ce/releases/tag/v17.11.0-ce-rc4)
  - [Docker compose 1.17.1](https://github.com/docker/compose/releases/tag/1.17.1)
  - Linux kernel 4.9.60
@z

@x
* Bug fixes and minor changes
  - Fix login into private repository with certificate issue. [docker/for-mac#2201](https://github.com/docker/for-mac/issues/2201)
@y
* Bug fixes and minor changes
  - Fix login into private repository with certificate issue. [docker/for-mac#2201](https://github.com/docker/for-mac/issues/2201)
@z

@x
* New
  - For systems running APFS on SSD on High Sierra, use `raw` format virtual machine disks by default. This increases disk throughput (from 320MiB/sec to 600MiB/sec in `dd` on a 2015 MacBook Pro) and disk space handling.
  Existing disks are kept in qcow format, if you want to switch to raw format you need to "Reset to factory defaults". To query the space usage of the file, use a command like:
  `$ cd ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/`
  `$ ls -ls Docker.raw`
  `3944768 -rw-r--r--@ 1 user  staff  68719476736 Nov 16 11:19 Docker.raw`
  The first number (`3944768`) is the allocated space in blocks; the larger number `68719476736` is the maximum total amount of space the file may consume in future in bytes.
@y
* New
  - For systems running APFS on SSD on High Sierra, use `raw` format virtual machine disks by default. This increases disk throughput (from 320MiB/sec to 600MiB/sec in `dd` on a 2015 MacBook Pro) and disk space handling.
  Existing disks are kept in qcow format, if you want to switch to raw format you need to "Reset to factory defaults". To query the space usage of the file, use a command like:
  `$ cd ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/`
  `$ ls -ls Docker.raw`
  `3944768 -rw-r--r--@ 1 user  staff  68719476736 Nov 16 11:19 Docker.raw`
  The first number (`3944768`) is the allocated space in blocks; the larger number `68719476736` is the maximum total amount of space the file may consume in future in bytes.
@z

@x
### Docker Community Edition 17.11.0-ce-rc3-mac38 2017-11-09
@y
### Docker Community Edition 17.11.0-ce-rc3-mac38 2017-11-09
@z

@x
* Upgrades
  - [Docker 17.11.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v17.11.0-ce-rc3)
@y
* Upgrades
  - [Docker 17.11.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v17.11.0-ce-rc3)
@z

@x
* Bug fixes and minor changes
  - Fix Docker build exits successfully but fails to build image [moby/#35413](https://github.com/moby/moby/issues/35413).
@y
* Bug fixes and minor changes
  - Fix Docker build exits successfully but fails to build image [moby/#35413](https://github.com/moby/moby/issues/35413).
@z

@x
### Docker Community Edition 17.11.0-ce-rc2-mac37 2017-11-02
@y
### Docker Community Edition 17.11.0-ce-rc2-mac37 2017-11-02
@z

@x
* Upgrades
  - [Docker 17.11.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v17.11.0-ce-rc2)
  - [Docker compose 1.17.0](https://github.com/docker/compose/releases/tag/1.17.0)
  - Linuxkit blueprint updated to [linuxkit/linuxkit#2633](https://github.com/linuxkit/linuxkit/pull/2633), fixes CVE-2017-15650
@y
* Upgrades
  - [Docker 17.11.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v17.11.0-ce-rc2)
  - [Docker compose 1.17.0](https://github.com/docker/compose/releases/tag/1.17.0)
  - Linuxkit blueprint updated to [linuxkit/linuxkit#2633](https://github.com/linuxkit/linuxkit/pull/2633), fixes CVE-2017-15650
@z

@x
* Bug fixes and minor changes
  - Fix centos:5 & centos:6 images not starting properly with LinuxKit virtual machine (fixes [docker/for-mac#2169](https://github.com/docker/for-mac/issues/2169)).
@y
* Bug fixes and minor changes
  - Fix centos:5 & centos:6 images not starting properly with LinuxKit virtual machine (fixes [docker/for-mac#2169](https://github.com/docker/for-mac/issues/2169)).
@z

@x
### Docker Community Edition 17.10.0-ce-mac36 2017-10-24
@y
### Docker Community Edition 17.10.0-ce-mac36 2017-10-24
@z

@x
[Download](https://download.docker.com/mac/edge/19824/Docker.dmg)
@y
[Download](https://download.docker.com/mac/edge/19824/Docker.dmg)
@z

@x
* Upgrades
  - [Docker 17.10.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.10.0-ce)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - [Docker compose 1.17.0-rc1](https://github.com/docker/compose/releases/tag/1.17.0-rc1)
@y
* Upgrades
  - [Docker 17.10.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.10.0-ce)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - [Docker compose 1.17.0-rc1](https://github.com/docker/compose/releases/tag/1.17.0-rc1)
@z

@x
* New
  - Virtual machine entirely built with Linuxkit
@y
* New
  - Virtual machine entirely built with Linuxkit
@z

@x
### Docker Community Edition 17.09.0-ce-mac34 2017-10-06
@y
### Docker Community Edition 17.09.0-ce-mac34 2017-10-06
@z

@x
* Bug fixes and minor changes
  - Fix Docker For Mac unable to start in some cases : removed use of libgmp sometimes causing the vpnkit process to die.
@y
* Bug fixes and minor changes
  - Fix Docker For Mac unable to start in some cases : removed use of libgmp sometimes causing the vpnkit process to die.
@z

@x
### Docker Community Edition 17.09.0-ce-mac31 2017-09-29
@y
### Docker Community Edition 17.09.0-ce-mac31 2017-09-29
@z

@x
* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - DataKit update (fix instability on High Sierra)
@y
* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - DataKit update (fix instability on High Sierra)
@z

@x
* Bug fixes and minor changes
  - Fix password encoding/decoding. May require to re-login to docker cloud after this version is installed. (Fixes:docker/for-mac#2008, docker/for-mac#2016, docker/for-mac#1919, docker/for-mac#712, docker/for-mac#1220).
@y
* Bug fixes and minor changes
  - Fix password encoding/decoding. May require to re-login to docker cloud after this version is installed. (Fixes:docker/for-mac#2008, docker/for-mac#2016, docker/for-mac#1919, docker/for-mac#712, docker/for-mac#1220).
@z

@x
### Docker Community Edition 17.09.0-ce-rc3-mac30 2017-09-22
@y
### Docker Community Edition 17.09.0-ce-rc3-mac30 2017-09-22
@z

@x
* Upgrades
  - [Docker 17.09.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce-rc3)
@y
* Upgrades
  - [Docker 17.09.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce-rc3)
@z

@x
### Docker Community Edition 17.09.0-ce-rc2-mac29 2017-09-19
@y
### Docker Community Edition 17.09.0-ce-rc2-mac29 2017-09-19
@z

@x
* Upgrades
  - [Docker 17.09.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce-rc2)
  - Linux Kernel 4.9.49
  - AUFS 20170911
@y
* Upgrades
  - [Docker 17.09.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce-rc2)
  - Linux Kernel 4.9.49
  - AUFS 20170911
@z

@x
* Bug fixes and minor changes
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING [docker/for-mac#1608](https://github.com/docker/for-mac/issues/1608)
  - Rotate logs in the virtual machine more often
@y
* Bug fixes and minor changes
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING [docker/for-mac#1608](https://github.com/docker/for-mac/issues/1608)
  - Rotate logs in the virtual machine more often
@z

@x
### Docker Community Edition 17.09.0-ce-rc1-mac28 2017-09-07
@y
### Docker Community Edition 17.09.0-ce-rc1-mac28 2017-09-07
@z

@x
* Upgrades
  - [Docker 17.09.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce-rc1)
  - [Docker compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - Linux Kernel 4.9.46
@y
* Upgrades
  - [Docker 17.09.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce-rc1)
  - [Docker compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - Linux Kernel 4.9.46
@z

@x
* Bug fixes and minor changes
  - VPNKit: change protocol to support error messages reported back from the server
@y
* Bug fixes and minor changes
  - VPNKit: change protocol to support error messages reported back from the server
@z

@x
### Docker Community Edition 17.07.0-ce-mac26, 2017-09-01
@y
### Docker Community Edition 17.07.0-ce-mac26, 2017-09-01
@z

@x
* Upgrades
  - [Docker 17.07.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce)
  - [Docker compose 1.16.0](https://github.com/docker/compose/releases/tag/1.16.0)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
@y
* Upgrades
  - [Docker 17.07.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce)
  - [Docker compose 1.16.0](https://github.com/docker/compose/releases/tag/1.16.0)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
@z

@x
### Docker Community Edition 17.07.0-ce-rc4-mac25, 2017-08-24
@y
### Docker Community Edition 17.07.0-ce-rc4-mac25, 2017-08-24
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.07.0-ce-rc4](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce-rc4)
- [Docker compose 1.16.0-rc1](https://github.com/docker/compose/releases/tag/1.16.0-rc1)
@y
- [Docker 17.07.0-ce-rc4](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce-rc4)
- [Docker compose 1.16.0-rc1](https://github.com/docker/compose/releases/tag/1.16.0-rc1)
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Fixed string validation in daemon options (related to [docker/for-mac#1971](https://github.com/docker/for-mac/issues/1971))
- VPNKit: Fixed a bug which causes a socket to leak if the corresponding
TCP connection is idle for more than five minutes (related to
[docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
@y
- Fixed string validation in daemon options (related to [docker/for-mac#1971](https://github.com/docker/for-mac/issues/1971))
- VPNKit: Fixed a bug which causes a socket to leak if the corresponding
TCP connection is idle for more than five minutes (related to
[docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
@z

@x
### Docker Community Edition 17.07.0-ce-rc3-mac23, 2017-08-21
@y
### Docker Community Edition 17.07.0-ce-rc3-mac23, 2017-08-21
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.07.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce-rc3)
@y
- [Docker 17.07.0-ce-rc3](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce-rc3)
@z

@x
**New**
@y
**New**
@z

@x
- VPNKit: Added support for ping!
- VPNKit: Added `slirp/port-max-idle-timeout` to allow the timeout to be adjusted or even disabled
- VPNKit: Bridge mode is default everywhere now
@y
- VPNKit: Added support for ping!
- VPNKit: Added `slirp/port-max-idle-timeout` to allow the timeout to be adjusted or even disabled
- VPNKit: Bridge mode is default everywhere now
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- VPNKit: Improved the logging around the UNIX domain socket connections
- VPNKit: Automatically trim whitespace from `int` or `bool` database keys
@y
- VPNKit: Improved the logging around the UNIX domain socket connections
- VPNKit: Automatically trim whitespace from `int` or `bool` database keys
@z

@x
### Docker Community Edition 17.07.0-ce-rc2-mac22, 2017-08-11
@y
### Docker Community Edition 17.07.0-ce-rc2-mac22, 2017-08-11
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.07.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce-rc2)
- Linux Kernel 4.9.41
@y
- [Docker 17.07.0-ce-rc2](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce-rc2)
- Linux Kernel 4.9.41
@z

@x
### Docker Community Edition 17.07.0-ce-rc1-mac21, 2017-07-31
@y
### Docker Community Edition 17.07.0-ce-rc1-mac21, 2017-07-31
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.07.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce-rc1)
- [Docker compose 1.15.0](https://github.com/docker/compose/releases/tag/1.15.0)
- [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
- Linux Kernel 4.9.38
@y
- [Docker 17.07.0-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.07.0-ce-rc1)
- [Docker compose 1.15.0](https://github.com/docker/compose/releases/tag/1.15.0)
- [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
- Linux Kernel 4.9.38
@z

@x
**New**
@y
**New**
@z

@x
- Transparent proxy using macOS system proxies (if defined) directly
- GUI settings are now stored in `~/Library/Group\ Containers/group.com.docker/settings.json`. `daemon.json` in now a file in `~/.docker/`
- You can now change the default IP address used by Hyperkit if it collides with your network
@y
- Transparent proxy using macOS system proxies (if defined) directly
- GUI settings are now stored in `~/Library/Group\ Containers/group.com.docker/settings.json`. `daemon.json` in now a file in `~/.docker/`
- You can now change the default IP address used by Hyperkit if it collides with your network
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Add daemon options validation
- Diagnose can be cancelled & Improved help information. Fixes [docker/for-mac#1134](https://github.com/docker/for-mac/issues/1134), [docker/for-mac#1474](https://github.com/docker/for-mac/issues/1474)
- Support paging of Docker Cloud [repositories](../docker-hub/repos.md) and [organizations](../docker-hub/orgs.md). Fixes [docker/for-mac#1538](https://github.com/docker/for-mac/issues/1538)
@y
- Add daemon options validation
- Diagnose can be cancelled & Improved help information. Fixes [docker/for-mac#1134](https://github.com/docker/for-mac/issues/1134), [docker/for-mac#1474](https://github.com/docker/for-mac/issues/1474)
- Support paging of Docker Cloud [repositories](../docker-hub/repos.md) and [organizations](../docker-hub/orgs.md). Fixes [docker/for-mac#1538](https://github.com/docker/for-mac/issues/1538)
@z

@x
### Docker Community Edition 17.06.1-ce-mac20, 2017-07-18
@y
### Docker Community Edition 17.06.1-ce-mac20, 2017-07-18
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.1-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce-rc1)
- Linux Kernel 4.9.36
- AUFS 20170703
@y
- [Docker 17.06.1-ce-rc1](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce-rc1)
- Linux Kernel 4.9.36
- AUFS 20170703
@z

@x
### Docker Community Edition 17.06.0-ce-mac17, 2017-06-28
@y
### Docker Community Edition 17.06.0-ce-mac17, 2017-06-28
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)
@y
- [Docker 17.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)
@z

@x
### Docker Community Edition 17.06.0-rc5-ce-mac16, 2017-06-21
@y
### Docker Community Edition 17.06.0-rc5-ce-mac16, 2017-06-21
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.0-ce-rc5](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce-rc5)
- [Docker compose 1.14.0](https://github.com/docker/compose/releases/tag/1.14.0)
@y
- [Docker 17.06.0-ce-rc5](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce-rc5)
- [Docker compose 1.14.0](https://github.com/docker/compose/releases/tag/1.14.0)
@z

@x
### Docker Community Edition 17.06.0-rc4-ce-mac15, 2017-06-16
@y
### Docker Community Edition 17.06.0-rc4-ce-mac15, 2017-06-16
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.0-rc4-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce-rc4)
- [Docker Credential Helpers 0.5.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.2)
- Linux Kernel 4.9.31
@y
- [Docker 17.06.0-rc4-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce-rc4)
- [Docker Credential Helpers 0.5.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.2)
- Linux Kernel 4.9.31
@z

@x
### Docker Community Edition 17.06.0-rc2-ce-mac14, 2017-06-08
@y
### Docker Community Edition 17.06.0-rc2-ce-mac14, 2017-06-08
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.0-rc2-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce-rc2)
- [Docker Machine 0.12.0](https://github.com/docker/machine/releases/tag/v0.12.0)
- [Docker compose 1.14.0-rc2](https://github.com/docker/compose/releases/tag/1.14.0-rc2)
@y
- [Docker 17.06.0-rc2-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce-rc2)
- [Docker Machine 0.12.0](https://github.com/docker/machine/releases/tag/v0.12.0)
- [Docker compose 1.14.0-rc2](https://github.com/docker/compose/releases/tag/1.14.0-rc2)
@z

@x
### Docker Community Edition 17.06.0-rc1-ce-mac13, 2017-06-01
@y
### Docker Community Edition 17.06.0-rc1-ce-mac13, 2017-06-01
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.06.0-rc1-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce-rc1)
- [Docker Credential Helpers 0.5.1](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.1)
- `qcow-tool` v0.10.0 (improve the performance of `compact`: `mirage/ocaml-qcow#94`)
- OS X Yosemite 10.10 is marked as deprecated
- Linux Kernel 4.9.30
@y
- [Docker 17.06.0-rc1-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce-rc1)
- [Docker Credential Helpers 0.5.1](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.1)
- `qcow-tool` v0.10.0 (improve the performance of `compact`: `mirage/ocaml-qcow#94`)
- OS X Yosemite 10.10 is marked as deprecated
- Linux Kernel 4.9.30
@z

@x
**New**
@y
**New**
@z

@x
- GUI option to opt out of credential store
- GUI option to reset docker data without losing all settings (fixes [docker/for-mac#1309](https://github.com/docker/for-mac/issues/1309))
- Add an experimental DNS name for the host: `docker.for.mac.localhost`
- Support for client (such as "login") certificates for authenticating registry access (fixes [docker/for-mac#1320](https://github.com/docker/for-mac/issues/1320))
@y
- GUI option to opt out of credential store
- GUI option to reset docker data without losing all settings (fixes [docker/for-mac#1309](https://github.com/docker/for-mac/issues/1309))
- Add an experimental DNS name for the host: `docker.for.mac.localhost`
- Support for client (such as "login") certificates for authenticating registry access (fixes [docker/for-mac#1320](https://github.com/docker/for-mac/issues/1320))
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Resync HTTP(S) proxy settings on application start
- Interpret system proxy setting of localhost correctly (see [docker/for-mac#1511](https://github.com/docker/for-mac/issues/1511))
- All docker binaries bundled with Docker for Mac are now signed
- Display all docker cloud organizations and repositories in the whale menu (fixes [docker/for-mac#1538 ](https://github.com/docker/for-mac/issues/1538))
- OSXFS: improved latency for many common operations, such as read and write by approximately 25%
@y
- Resync HTTP(S) proxy settings on application start
- Interpret system proxy setting of localhost correctly (see [docker/for-mac#1511](https://github.com/docker/for-mac/issues/1511))
- All docker binaries bundled with Docker for Mac are now signed
- Display all docker cloud organizations and repositories in the whale menu (fixes [docker/for-mac#1538 ](https://github.com/docker/for-mac/issues/1538))
- OSXFS: improved latency for many common operations, such as read and write by approximately 25%
@z

@x
### Docker Community Edition 17.05.0-ce-mac11, 2017-05-12
@y
### Docker Community Edition 17.05.0-ce-mac11, 2017-05-12
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Security fix for CVE-2017-7308
@y
- Security fix for CVE-2017-7308
@z

@x
### Docker Community Edition 17.05.0-ce-mac9, 2017-05-09
@y
### Docker Community Edition 17.05.0-ce-mac9, 2017-05-09
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.05.0-ce](https://github.com/docker/docker/releases/tag/v17.05.0-ce)
- [Docker Compose 1.13.0](https://github.com/docker/compose/releases/tag/1.13.0)
- [Docker Machine 1.11.0](https://github.com/docker/machine/releases/tag/v0.11.0)
@y
- [Docker 17.05.0-ce](https://github.com/docker/docker/releases/tag/v17.05.0-ce)
- [Docker Compose 1.13.0](https://github.com/docker/compose/releases/tag/1.13.0)
- [Docker Machine 1.11.0](https://github.com/docker/machine/releases/tag/v0.11.0)
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Fixed GUI crash when text table view was selected and windows re-opened (fixes [docker/for-mac#1477](https://github.com/docker/for-mac/issues/1477))
- Reset to default / uninstall also remove `config.json` and `osxkeychain` credentials
- More detailed VirtualBox uninstall requirements ( [docker/for-mac#1343](https://github.com/docker/for-mac/issues/1343))
- You are now prompted for your password, if you changed it in Docker Cloud.
- Request time sync after waking up to improve [docker/for-mac#17](https://github.com/docker/for-mac/issues/17)
@y
- Fixed GUI crash when text table view was selected and windows re-opened (fixes [docker/for-mac#1477](https://github.com/docker/for-mac/issues/1477))
- Reset to default / uninstall also remove `config.json` and `osxkeychain` credentials
- More detailed VirtualBox uninstall requirements ( [docker/for-mac#1343](https://github.com/docker/for-mac/issues/1343))
- You are now prompted for your password, if you changed it in Docker Cloud.
- Request time sync after waking up to improve [docker/for-mac#17](https://github.com/docker/for-mac/issues/17)
@z

@x
### Docker Community Edition 17.05.0-ce-rc1-mac8, 2017-04-13
@y
### Docker Community Edition 17.05.0-ce-rc1-mac8, 2017-04-13
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.05.0-ce-rc1](https://github.com/docker/docker/releases/tag/v17.05.0-ce-rc1)
@y
- [Docker 17.05.0-ce-rc1](https://github.com/docker/docker/releases/tag/v17.05.0-ce-rc1)
@z

@x
### Docker Community Edition 17.04.0-ce-mac7, 2017-04-06
@y
### Docker Community Edition 17.04.0-ce-mac7, 2017-04-06
@z

@x
**New**
@y
**New**
@z

@x
- OSXFS: support for `cached` mount flag to improve performance of macOS mounts when strict consistency is not necessary
@y
- OSXFS: support for `cached` mount flag to improve performance of macOS mounts when strict consistency is not necessary
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.04.0-ce](https://github.com/docker/docker/releases/tag/v17.04.0-ce)
- [Docker Compose 1.12.0](https://github.com/docker/compose/releases/tag/1.12.0)
- Linux Kernel 4.9.19
@y
- [Docker 17.04.0-ce](https://github.com/docker/docker/releases/tag/v17.04.0-ce)
- [Docker Compose 1.12.0](https://github.com/docker/compose/releases/tag/1.12.0)
- Linux Kernel 4.9.19
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- VPNKit: Improved DNS timeout handling (fixes [docker/for-mac#202](https://github.com/docker/vpnkit/issues/202))
- VPNKit: Use DNSServiceRef API by default (only enabled for new installs or after factory reset)
- Add a reset to factory defaults button when application crashes
- Toolbox import dialog now defaults to "Skip"
@y
- VPNKit: Improved DNS timeout handling (fixes [docker/for-mac#202](https://github.com/docker/vpnkit/issues/202))
- VPNKit: Use DNSServiceRef API by default (only enabled for new installs or after factory reset)
- Add a reset to factory defaults button when application crashes
- Toolbox import dialog now defaults to "Skip"
@z

@x
### Docker Community Edition 17.04.0-ce-rc2-mac6, 2017-04-03
@y
### Docker Community Edition 17.04.0-ce-rc2-mac6, 2017-04-03
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.04.0-ce-rc2](https://github.com/docker/docker/releases/tag/v17.04.0-ce-rc2)
- [Docker Compose 1.12.0-rc2](https://github.com/docker/compose/releases/tag/1.12.0-rc2)
- Linux Kernel 4.9.18
@y
- [Docker 17.04.0-ce-rc2](https://github.com/docker/docker/releases/tag/v17.04.0-ce-rc2)
- [Docker Compose 1.12.0-rc2](https://github.com/docker/compose/releases/tag/1.12.0-rc2)
- Linux Kernel 4.9.18
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Buffered data should be treated correctly when Docker client requests are upgraded to raw streams
- Removed an error message from the output related to experimental features handling
- `vmnetd` should not crash when user home directory is on an external drive
- Improved settings database schema handling
- Disk trimming should work as expected
- Diagnostics now contains more settings data
@y
- Buffered data should be treated correctly when Docker client requests are upgraded to raw streams
- Removed an error message from the output related to experimental features handling
- `vmnetd` should not crash when user home directory is on an external drive
- Improved settings database schema handling
- Disk trimming should work as expected
- Diagnostics now contains more settings data
@z

@x
### Docker Community Edition 17.03.1-ce-rc1-mac3, 2017-03-28
@y
### Docker Community Edition 17.03.1-ce-rc1-mac3, 2017-03-28
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.03.1-ce-rc1](https://github.com/docker/docker/releases/tag/v17.03.1-ce-rc1)
- [Docker Credential Helpers 0.5.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.0)
- Linux Kernel 4.9.14
@y
- [Docker 17.03.1-ce-rc1](https://github.com/docker/docker/releases/tag/v17.03.1-ce-rc1)
- [Docker Credential Helpers 0.5.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.0)
- Linux Kernel 4.9.14
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Use `fsync` rather than `fcntl`(`F_FULLFSYNC`)
- Update max-connections to 2000 ([docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374) and [docker/for-mac#1132](https://github.com/docker/for-mac/issues/1132))
- VPNKit: capture up to 64KiB of NTP traffic for diagnostics, better handling of DNS
- UI: fix edge cases which crash the application
- QCOW: numerous bugfixes
- osxfs: buffer readdir
@y
- Use `fsync` rather than `fcntl`(`F_FULLFSYNC`)
- Update max-connections to 2000 ([docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374) and [docker/for-mac#1132](https://github.com/docker/for-mac/issues/1132))
- VPNKit: capture up to 64KiB of NTP traffic for diagnostics, better handling of DNS
- UI: fix edge cases which crash the application
- QCOW: numerous bugfixes
- osxfs: buffer readdir
@z

@x
### Docker Community Edition 17.03.0-ce-mac2, 2017-03-06
@y
### Docker Community Edition 17.03.0-ce-mac2, 2017-03-06
@z

@x
**Hotfixes**
@y
**Hotfixes**
@z

@x
- Set the ethernet MTU to 1500 to prevent a hyperkit crash
- Fix Docker build on private images
@y
- Set the ethernet MTU to 1500 to prevent a hyperkit crash
- Fix Docker build on private images
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker Credential Helpers 0.4.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.4.2)
@y
- [Docker Credential Helpers 0.4.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.4.2)
@z

@x
### Docker Community Edition 17.03.0-ce-mac1, 2017-03-02
@y
### Docker Community Edition 17.03.0-ce-mac1, 2017-03-02
@z

@x
**New**
@y
**New**
@z

@x
- Renamed to Docker Community Edition
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users progressively
- Docker will now securely store your IDs in the macOS keychain
@y
- Renamed to Docker Community Edition
- Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users progressively
- Docker will now securely store your IDs in the macOS keychain
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 17.03.0-ce](https://github.com/docker/docker/releases/tag/v17.03.0-ce)
- [Docker Compose 1.11.2](https://github.com/docker/compose/releases/tag/1.11.2)
- [Docker Machine 0.10.0](https://github.com/docker/machine/releases/tag/v0.10.0)
- Linux Kernel 4.9.12
@y
- [Docker 17.03.0-ce](https://github.com/docker/docker/releases/tag/v17.03.0-ce)
- [Docker Compose 1.11.2](https://github.com/docker/compose/releases/tag/1.11.2)
- [Docker Machine 0.10.0](https://github.com/docker/machine/releases/tag/v0.10.0)
- Linux Kernel 4.9.12
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- VPNKit: fix unmarshalling of DNS packets containing pointers to pointers to labels
- osxfs: catch EPERM when reading extended attributes of non-files
- Add page_poison=1 to boot args
- Add a new disk flushing option
@y
- VPNKit: fix unmarshalling of DNS packets containing pointers to pointers to labels
- osxfs: catch EPERM when reading extended attributes of non-files
- Add page_poison=1 to boot args
- Add a new disk flushing option
@z

@x
### Docker Community Edition 17.03.0 RC1 Release Notes (2017-02-22 17.03.0-ce-rc1-mac1)
@y
### Docker Community Edition 17.03.0 RC1 Release Notes (2017-02-22 17.03.0-ce-rc1-mac1)
@z

@x
**New**
@y
**New**
@z

@x
- Introduce Docker Community Edition
- Integration with Docker Cloud to control remote Swarms from the local CLI and view your repositories. This feature will be rolled out to all users progressively
- Docker will now use keychain access to secure your IDs
@y
- Introduce Docker Community Edition
- Integration with Docker Cloud to control remote Swarms from the local CLI and view your repositories. This feature will be rolled out to all users progressively
- Docker will now use keychain access to secure your IDs
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 17.03.0-ce-rc1
- Linux Kernel 4.9.11
@y
- Docker 17.03.0-ce-rc1
- Linux Kernel 4.9.11
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- VPNKit: fixed unmarshalling of DNS packets containing pointers to pointers to labels
- osxfs: catch EPERM when reading extended attributes of non-files
- Added `page_poison=1` to boot args
- Added a new disk flushing option
@y
- VPNKit: fixed unmarshalling of DNS packets containing pointers to pointers to labels
- osxfs: catch EPERM when reading extended attributes of non-files
- Added `page_poison=1` to boot args
- Added a new disk flushing option
@z

@x
### Beta 42 Release Notes (2017-02-09 1.13.1-beta42)
@y
### Beta 42 Release Notes (2017-02-09 1.13.1-beta42)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 1.13.1](https://github.com/docker/docker/releases/tag/v1.13.1)
- [Docker Compose 1.11.1](https://github.com/docker/compose/releases/tag/1.11.1)
@y
- [Docker 1.13.1](https://github.com/docker/docker/releases/tag/v1.13.1)
- [Docker Compose 1.11.1](https://github.com/docker/compose/releases/tag/1.11.1)
@z

@x
### Beta 41 Release Notes (2017-02-07-2017-1.13.1-rc2-beta41)
@y
### Beta 41 Release Notes (2017-02-07-2017-1.13.1-rc2-beta41)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.13.1-rc2
- [Docker Compose 1.11.0-rc1](https://github.com/docker/compose/releases/tag/1.11.0-rc1)
- Linux kernel 4.9.8
@y
- Docker 1.13.1-rc2
- [Docker Compose 1.11.0-rc1](https://github.com/docker/compose/releases/tag/1.11.0-rc1)
- Linux kernel 4.9.8
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- VPNKit: set the Recursion Available bit on DNS responses from the cache
- Don’t use port 4222 inside the Linux VM
@y
- VPNKit: set the Recursion Available bit on DNS responses from the cache
- Don’t use port 4222 inside the Linux VM
@z

@x
### Beta 40 Release Notes (2017-01-31 1.13.1-rc1-beta40)
@y
### Beta 40 Release Notes (2017-01-31 1.13.1-rc1-beta40)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 1.13.1-rc1](https://github.com/docker/docker/releases/tag/v1.13.1-rc1)
- Linux kernel 4.9.6
@y
- [Docker 1.13.1-rc1](https://github.com/docker/docker/releases/tag/v1.13.1-rc1)
- Linux kernel 4.9.6
@z

@x
**New**
@y
**New**
@z

@x
- Allow to reset faulty `daemon.json` through a link in advanced subpanel
- Add link to experimental features
- Hide restart button in settings window
- Increase the maximum number of vCPUs to 64
@y
- Allow to reset faulty `daemon.json` through a link in advanced subpanel
- Add link to experimental features
- Hide restart button in settings window
- Increase the maximum number of vCPUs to 64
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- VPNKit: Avoid diagnostics to capture too much data
- VPNKit: Fix a source of occasional packet loss (truncation) on the virtual ethernet link
- HyperKit: Dump guest physical and linear address from VMCS when dumping state
- HyperKit: Kernel boots with `panic=1` arg
@y
- VPNKit: Avoid diagnostics to capture too much data
- VPNKit: Fix a source of occasional packet loss (truncation) on the virtual ethernet link
- HyperKit: Dump guest physical and linear address from VMCS when dumping state
- HyperKit: Kernel boots with `panic=1` arg
@z

@x
### Beta 39 Release Notes (2017-01-26 1.13.0-beta39)
@y
### Beta 39 Release Notes (2017-01-26 1.13.0-beta39)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Linux kernel 4.9.5
@y
- Linux kernel 4.9.5
@z

@x
**New**
@y
**New**
@z

@x
- More options when moving disk image (see [Storage location](index.md#storage-location) under Advanced preference settings)
- Filesharing and daemon table empty fields are editable
- DNS forwarder ignores responses from malfunctioning servers ([docker/for-mac#1025](https://github.com/docker/for-mac/issues/1025))
- DNS forwarder send all queries in parallel, process results in order
- DNS forwarder includes servers with zones in general searches ([docker/for-mac#997](https://github.com/docker/for-mac/issues/997))
- Parses aliases from /etc/hosts ([docker/for-mac#983](https://github.com/docker/for-mac/issues/983))
- Can resolve DNS requests through servers listed in the /etc/resolver directory on the host
@y
- More options when moving disk image (see [Storage location](index.md#storage-location) under Advanced preference settings)
- Filesharing and daemon table empty fields are editable
- DNS forwarder ignores responses from malfunctioning servers ([docker/for-mac#1025](https://github.com/docker/for-mac/issues/1025))
- DNS forwarder send all queries in parallel, process results in order
- DNS forwarder includes servers with zones in general searches ([docker/for-mac#997](https://github.com/docker/for-mac/issues/997))
- Parses aliases from /etc/hosts ([docker/for-mac#983](https://github.com/docker/for-mac/issues/983))
- Can resolve DNS requests through servers listed in the /etc/resolver directory on the host
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- Fix bug where update window hides when app not focused
- Limit vCPUs to 16 ([docker/for-mac#1144](https://github.com/docker/for-mac/issues/1144))
- Fix for swap not being mounted
- Fix AUFS xattr delete issue ([docker/docker#30245](https://github.com/docker/docker/issues/30245))
@y
- Fix bug where update window hides when app not focused
- Limit vCPUs to 16 ([docker/for-mac#1144](https://github.com/docker/for-mac/issues/1144))
- Fix for swap not being mounted
- Fix AUFS xattr delete issue ([docker/docker#30245](https://github.com/docker/docker/issues/30245))
@z

@x
### Beta 38 Release Notes (2017-01-20 1.13.0-beta38)
@y
### Beta 38 Release Notes (2017-01-20 1.13.0-beta38)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- [Docker 1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)
- [Docker Compose 1.10](https://github.com/docker/compose/releases/tag/1.10.0)
- [Docker Machine 0.9.0](https://github.com/docker/machine/releases/tag/v0.9.0)
- [Notary 0.4.3](https://github.com/docker/notary/releases/tag/v0.4.3)
- Linux kernel 4.9.4
- QCOW-tool 0.7.2
@y
- [Docker 1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)
- [Docker Compose 1.10](https://github.com/docker/compose/releases/tag/1.10.0)
- [Docker Machine 0.9.0](https://github.com/docker/machine/releases/tag/v0.9.0)
- [Notary 0.4.3](https://github.com/docker/notary/releases/tag/v0.4.3)
- Linux kernel 4.9.4
- QCOW-tool 0.7.2
@z

@x
**New**
@y
**New**
@z

@x
- The storage location of the Linux volume can now be moved
- Reclaim disk size on reboot
- You can now edit filesharing paths
- Memory can be allocated with 256 MiB steps
- Proxy can now be completely disabled
- Support for arm, aarch64, ppc64le architectures using qemu
- Dedicated preference pane for advanced configuration of the docker daemon (edit daemon.json)
- Docker Experimental mode can be toggled
- Better support for Split DNS VPN configurations
- Use more DNS servers, respect order
@y
- The storage location of the Linux volume can now be moved
- Reclaim disk size on reboot
- You can now edit filesharing paths
- Memory can be allocated with 256 MiB steps
- Proxy can now be completely disabled
- Support for arm, aarch64, ppc64le architectures using qemu
- Dedicated preference pane for advanced configuration of the docker daemon (edit daemon.json)
- Docker Experimental mode can be toggled
- Better support for Split DNS VPN configurations
- Use more DNS servers, respect order
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- You can't edit settings while docker is restarting
- Support Copy/Paste in About box
- Auto update polling every 24h
- Kernel boots with vsyscall=emulate arg and CONFIG_LEGACY_VSYSCALL is set to NONE in Moby
- Fixed vsock deadlock under heavy write load
- If you opt-out of analytics, you're prompted for approval before a bug report is sent
- Fixed bug where search domain could be read as `DomainName`
- Dedicated preference pane for HTTP proxy settings.
- Dedicated preference pane for CPU & Memory computing resources.
- Privacy settings moved to the general preference pane
- Fixed an issue where the preference pane disappeared when the welcome whale menu was closed.
- HyperKit: code cleanup and minor fixes
- Improvements to Logging and Diagnostics
- osxfs: switch to libev/kqueue to improve latency
- VPNKit: improvements to DNS handling
- VPNKit: Improved diagnostics
- VPNKit: Forwarded UDP datagrams should have correct source port numbers
- VPNKit: add a local cache of DNS responses
- VPNKit: If one request fails, allow other concurrent requests to succeed.
  For example this allows IPv4 servers to work even if IPv6 is broken.
- VPNKit: Fix bug which could cause the connection tracking to
  underestimate the number of active connections
@y
- You can't edit settings while docker is restarting
- Support Copy/Paste in About box
- Auto update polling every 24h
- Kernel boots with vsyscall=emulate arg and CONFIG_LEGACY_VSYSCALL is set to NONE in Moby
- Fixed vsock deadlock under heavy write load
- If you opt-out of analytics, you're prompted for approval before a bug report is sent
- Fixed bug where search domain could be read as `DomainName`
- Dedicated preference pane for HTTP proxy settings.
- Dedicated preference pane for CPU & Memory computing resources.
- Privacy settings moved to the general preference pane
- Fixed an issue where the preference pane disappeared when the welcome whale menu was closed.
- HyperKit: code cleanup and minor fixes
- Improvements to Logging and Diagnostics
- osxfs: switch to libev/kqueue to improve latency
- VPNKit: improvements to DNS handling
- VPNKit: Improved diagnostics
- VPNKit: Forwarded UDP datagrams should have correct source port numbers
- VPNKit: add a local cache of DNS responses
- VPNKit: If one request fails, allow other concurrent requests to succeed.
  For example this allows IPv4 servers to work even if IPv6 is broken.
- VPNKit: Fix bug which could cause the connection tracking to
  underestimate the number of active connections
@z

@x
### Beta 37 Release Notes (2017-01-16 1.13.0-rc7-beta37)
@y
### Beta 37 Release Notes (2017-01-16 1.13.0-rc7-beta37)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.13.0-rc7
- Notary 0.4.3
- Linux kernel 4.9.3
@y
- Docker 1.13.0-rc7
- Notary 0.4.3
- Linux kernel 4.9.3
@z

@x
### Beta 36 Release Notes (2017-01-12 1.13.0-rc6-beta36)
@y
### Beta 36 Release Notes (2017-01-12 1.13.0-rc6-beta36)
@z

@x
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@y
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.13.0-rc6
- Docker Compose 1.10-rc2
- Linux Kernel 4.9.2
@y
- Docker 1.13.0-rc6
- Docker Compose 1.10-rc2
- Linux Kernel 4.9.2
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- Uninstall should be more reliable
@y
- Uninstall should be more reliable
@z

@x
### Beta 35 Release Notes (2017-01-06 1.13.0-rc5-beta35)
@y
### Beta 35 Release Notes (2017-01-06 1.13.0-rc5-beta35)
@z

@x
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@y
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.13.0-rc5
- Docker Compose 1.10-rc1
@y
- Docker 1.13.0-rc5
- Docker Compose 1.10-rc1
@z

@x
## Edge Releases of 2016
@y
## Edge Releases of 2016
@z

@x
### Beta 34.1 Release Notes (2016-12-22 1.13.0-rc4-beta34.1)
@y
### Beta 34.1 Release Notes (2016-12-22 1.13.0-rc4-beta34.1)
@z

@x
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@y
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@z

@x
**Hotfix**
@y
**Hotfix**
@z

@x
- Fixed issue where Docker would fail to start after importing containers from Toolbox
@y
- Fixed issue where Docker would fail to start after importing containers from Toolbox
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- qcow-tool 0.7.2
@y
- qcow-tool 0.7.2
@z

@x
### Beta 34 Release Notes (2016-12-20 1.13.0-rc4-beta34)
@y
### Beta 34 Release Notes (2016-12-20 1.13.0-rc4-beta34)
@z

@x
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@y
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@z

@x
**New**
@y
**New**
@z

@x
- Change UI for path location and open finder
- Trim compact on reboot
- Use more DNS servers, respect order
@y
- Change UI for path location and open finder
- Trim compact on reboot
- Use more DNS servers, respect order
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.13.0-rc4
- Linux Kernel 4.8.15
@y
- Docker 1.13.0-rc4
- Linux Kernel 4.8.15
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- New Daemon icon
- Support Copy/Paste in About box
- Fix advanced daemon check json changes
- Auto update polling every 24h
@y
- New Daemon icon
- Support Copy/Paste in About box
- Fix advanced daemon check json changes
- Auto update polling every 24h
@z

@x
### Beta 33.1 Release Notes (2016-12-16 1.13.0-rc3-beta33.1)
@y
### Beta 33.1 Release Notes (2016-12-16 1.13.0-rc3-beta33.1)
@z

@x
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@y
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@z

@x
**Hotfix**
@y
**Hotfix**
@z

@x
- Fixed issue where sometimes TRIM would cause the virtual machine to hang
@y
- Fixed issue where sometimes TRIM would cause the virtual machine to hang
@z

@x
### Beta 33 Release Notes (2016-12-15 1.13.0-rc3-beta33)
@y
### Beta 33 Release Notes (2016-12-15 1.13.0-rc3-beta33)
@z

@x
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@y
>**Important Note:** Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.
@z

@x
**New**
@y
**New**
@z

@x
- You can now edit filesharing paths
- YOu can allocate memory with 256 MiB steps
- You can move the storage location of the Linux volume
- More explicit proxy settings
- You can completely disable Proxy
- You can switch daemon tabs without losing your settings
- You can't edit settings while Docker is restarting
@y
- You can now edit filesharing paths
- YOu can allocate memory with 256 MiB steps
- You can move the storage location of the Linux volume
- More explicit proxy settings
- You can completely disable Proxy
- You can switch daemon tabs without losing your settings
- You can't edit settings while Docker is restarting
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Linux Kernel 4.8.14
@y
- Linux Kernel 4.8.14
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- Kernel boots with `vsyscall=emulate arg` and `CONFIG_LEGACY_VSYSCALL` set to `NONE` in Moby
@y
- Kernel boots with `vsyscall=emulate arg` and `CONFIG_LEGACY_VSYSCALL` set to `NONE` in Moby
@z

@x
### Beta 32 Release Notes (2016-12-07 1.13.0-rc3-beta32)
@y
### Beta 32 Release Notes (2016-12-07 1.13.0-rc3-beta32)
@z

@x
**New**
@y
**New**
@z

@x
- Support for arm, aarch64, ppc64le architectures using qemu
@y
- Support for arm, aarch64, ppc64le architectures using qemu
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.13.0-rc3
- Docker Machine 0.9.0-rc2
- Linux kernel 4.8.12
@y
- Docker 1.13.0-rc3
- Docker Machine 0.9.0-rc2
- Linux kernel 4.8.12
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- VPNKit: Improved diagnostics
- Fix vsock deadlock under heavy write load
- On the beta channel you can't opt-out of analytics
- If you opt-out of analytics, you're prompted for approval before a bug report is sent
@y
- VPNKit: Improved diagnostics
- Fix vsock deadlock under heavy write load
- On the beta channel you can't opt-out of analytics
- If you opt-out of analytics, you're prompted for approval before a bug report is sent
@z

@x
### Beta 31 Release Notes (2016-12-01 1.13.0-rc2-beta31)
@y
### Beta 31 Release Notes (2016-12-01 1.13.0-rc2-beta31)
@z

@x
**New**
@y
**New**
@z

@x
- Dedicated preference pane for advanced configuration of the docker daemon (edit daemon.json). See [Daemon Advanced (JSON configuration file)](index.md#daemon-advanced-json-configuration-file).
@y
- Dedicated preference pane for advanced configuration of the docker daemon (edit daemon.json). See [Daemon Advanced (JSON configuration file)](index.md#daemon-advanced-json-configuration-file).
@z

@x
- Docker Experimental mode can be toggled. See [Daemon Basic (experimental mode and registries)](index.md#daemon-basic-experimental-mode-and-registries).
@y
- Docker Experimental mode can be toggled. See [Daemon Basic (experimental mode and registries)](index.md#daemon-basic-experimental-mode-and-registries).
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.13.0-rc2
- Docker Compose 1.9.0
- Docker Machine 0.9.0-rc1
- Linux kernel 4.8.10
@y
- Docker 1.13.0-rc2
- Docker Compose 1.9.0
- Docker Machine 0.9.0-rc1
- Linux kernel 4.8.10
@z

@x
**Bug fixes and minor improvements**
@y
**Bug fixes and minor improvements**
@z

@x
- Fixed bug where search domain could be read as `DomainName`
- VPNKit: don't permute resource records in responses
- VPNKit: reduced the amount of log spam
- Dedicated preference pane for HTTP proxy settings
- Dedicated preference pane for CPU & Memory computing resources
- Privacy settings moved to the general preference pane
- Fixed an issue where proxy settings were erased if registries or mirrors changed.
- Tab key is now cycling through tabs while setting proxy parameters
- Fixed an issue where the preference pane disappeared when the welcome whale menu was closed
@y
- Fixed bug where search domain could be read as `DomainName`
- VPNKit: don't permute resource records in responses
- VPNKit: reduced the amount of log spam
- Dedicated preference pane for HTTP proxy settings
- Dedicated preference pane for CPU & Memory computing resources
- Privacy settings moved to the general preference pane
- Fixed an issue where proxy settings were erased if registries or mirrors changed.
- Tab key is now cycling through tabs while setting proxy parameters
- Fixed an issue where the preference pane disappeared when the welcome whale menu was closed
@z

@x
### Beta 30 Release Notes (2016-11-10 1.12.3-beta30)
@y
### Beta 30 Release Notes (2016-11-10 1.12.3-beta30)
@z

@x
**New**
@y
**New**
@z

@x
- Better support for Split DNS VPN configurations
@y
- Better support for Split DNS VPN configurations
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker Compose 1.9.0-rc4
- Linux kernel 4.4.30
@y
- Docker Compose 1.9.0-rc4
- Linux kernel 4.4.30
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- HyperKit: code cleanup and minor fixes
- VPNKit: improvements to DNS handling
- Improvements to Logging and Diagnostics
- osxfs: switched to `libev/kqueue` to improve latency
@y
- HyperKit: code cleanup and minor fixes
- VPNKit: improvements to DNS handling
- Improvements to Logging and Diagnostics
- osxfs: switched to `libev/kqueue` to improve latency
@z

@x
### Beta 29.3 Release Notes (2016-11-02 1.12.3-beta29.3)
@y
### Beta 29.3 Release Notes (2016-11-02 1.12.3-beta29.3)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker Compose 1.9.0-rc2
- `osxfs`: Fixed a simultaneous volume mount race which can result in a crash
@y
- Docker Compose 1.9.0-rc2
- `osxfs`: Fixed a simultaneous volume mount race which can result in a crash
@z

@x
### Beta 29.2 Release Notes (2016-10-27 1.12.2-beta29.2)
@y
### Beta 29.2 Release Notes (2016-10-27 1.12.2-beta29.2)
@z

@x
**Hotfixes**
@y
**Hotfixes**
@z

@x
- Upgrade to Docker 1.12.3
@y
- Upgrade to Docker 1.12.3
@z

@x
### Beta 29.1 Release Notes (2016-10-26 1.12.1-beta29.1)
@y
### Beta 29.1 Release Notes (2016-10-26 1.12.1-beta29.1)
@z

@x
**Hotfixes**
@y
**Hotfixes**
@z

@x
- Fixed missing `/dev/pty/ptmx`
@y
- Fixed missing `/dev/pty/ptmx`
@z

@x
### Beta 29 Release Notes (2016-10-25 1.12.3-rc1-beta29)
@y
### Beta 29 Release Notes (2016-10-25 1.12.3-rc1-beta29)
@z

@x
**New**
@y
**New**
@z

@x
- Overlay2 is now the default storage driver. You must do a factory reset for overlay2 to be automatically used. (#5545)
@y
- Overlay2 is now the default storage driver. You must do a factory reset for overlay2 to be automatically used. (#5545)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.12.3-rc1
- Linux kernel 4.4.27
@y
- Docker 1.12.3-rc1
- Linux kernel 4.4.27
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Fixed an issue where the whale animation during setting change was inconsistent
- Fixed an issue where some windows stayed hidden behind another app
- Fixed application of system or custom proxy settings over container restart
- Increased default ulimit for memlock (fixes [docker/for-mac#801](https://github.com/docker/for-mac/issues/801) )
- Fixed an issue where the Docker status would continue to be
      yellow/animated after the VM had started correctly
- osxfs: fixed the prohibition of chown on read-only or mode 0 files (fixes [docker/for-mac#117](https://github.com/docker/for-mac/issues/117), [docker/for-mac#263](https://github.com/docker/for-mac/issues/263), [docker/for-mac#633](https://github.com/docker/for-mac/issues/633) )
@y
- Fixed an issue where the whale animation during setting change was inconsistent
- Fixed an issue where some windows stayed hidden behind another app
- Fixed application of system or custom proxy settings over container restart
- Increased default ulimit for memlock (fixes [docker/for-mac#801](https://github.com/docker/for-mac/issues/801) )
- Fixed an issue where the Docker status would continue to be
      yellow/animated after the VM had started correctly
- osxfs: fixed the prohibition of chown on read-only or mode 0 files (fixes [docker/for-mac#117](https://github.com/docker/for-mac/issues/117), [docker/for-mac#263](https://github.com/docker/for-mac/issues/263), [docker/for-mac#633](https://github.com/docker/for-mac/issues/633) )
@z

@x
### Beta 28 Release Notes (2016-10-13 1.12.2-rc3-beta28)
@y
### Beta 28 Release Notes (2016-10-13 1.12.2-rc3-beta28)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
- Docker 1.12.2
- Kernel 4.4.24
- Notary 0.4.2
@y
- Docker 1.12.2
- Kernel 4.4.24
- Notary 0.4.2
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Fixed an issue where Docker for Mac was incorrectly reported as updated
- osxfs: Fixed race condition causing some reads to run forever
- Channel is now displayed in About box
- Crash reports are sent over Bugsnag rather than HockeyApp
@y
- Fixed an issue where Docker for Mac was incorrectly reported as updated
- osxfs: Fixed race condition causing some reads to run forever
- Channel is now displayed in About box
- Crash reports are sent over Bugsnag rather than HockeyApp
@z

@x
### Beta 27 Release Notes (2016-09-28 1.12.2-rc1-beta27)
@y
### Beta 27 Release Notes (2016-09-28 1.12.2-rc1-beta27)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.2-rc1
* Docker Machine 0.8.2
* Docker compose 1.8.1
* Kernel vsock driver v7
* Kernel 4.4.21
* AUFS 20160912
@y
* Docker 1.12.2-rc1
* Docker Machine 0.8.2
* Docker compose 1.8.1
* Kernel vsock driver v7
* Kernel 4.4.21
* AUFS 20160912
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Fixed an issue where some windows did not claim focus correctly
* Added UI when switching channel to prevent user losing containers and settings
* Check disk capacity before Toolbox import
* Import certificates in `etc/ssl/certs/ca-certificates.crt`
* DNS: reduce the number of UDP sockets consumed on the host
* VPNkit: improve the connection-limiting code to avoid running out of sockets on the host
* UDP: handle diagrams bigger than 2035, up to the configured macOS kernel limit
* UDP: made the forwarding more robust; now, drop packets and continue rather than stopping
* disk: made the "flush" behaviour configurable for database-like workloads. This works around a performance regression in `v1.12.1`.
@y
* Fixed an issue where some windows did not claim focus correctly
* Added UI when switching channel to prevent user losing containers and settings
* Check disk capacity before Toolbox import
* Import certificates in `etc/ssl/certs/ca-certificates.crt`
* DNS: reduce the number of UDP sockets consumed on the host
* VPNkit: improve the connection-limiting code to avoid running out of sockets on the host
* UDP: handle diagrams bigger than 2035, up to the configured macOS kernel limit
* UDP: made the forwarding more robust; now, drop packets and continue rather than stopping
* disk: made the "flush" behaviour configurable for database-like workloads. This works around a performance regression in `v1.12.1`.
@z

@x
### Beta 26 Release Notes (2016-09-14 1.12.1-beta26)
@y
### Beta 26 Release Notes (2016-09-14 1.12.1-beta26)
@z

@x
**New**
@y
**New**
@z

@x
* Improved support for macOS 10.12 Sierra
@y
* Improved support for macOS 10.12 Sierra
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Linux kernel 4.4.20
* AUFS 20160905
@y
* Linux kernel 4.4.20
* AUFS 20160905
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Fixed communications glitch when UI talks to `com.docker.vmnetd`. Fixes [docker/for-mac#90](https://github.com/docker/for-mac/issues/90)
@y
* Fixed communications glitch when UI talks to `com.docker.vmnetd`. Fixes [docker/for-mac#90](https://github.com/docker/for-mac/issues/90)
@z

@x
* UI fix for macOs 10.12
@y
* UI fix for macOs 10.12
@z

@x
* Windows open on top of full screen app are available in all spaces
@y
* Windows open on top of full screen app are available in all spaces
@z

@x
* Reporting a bug, while not previously logged into GitHub now works
@y
* Reporting a bug, while not previously logged into GitHub now works
@z

@x
* When a diagnostic upload fails, the error is properly reported
@y
* When a diagnostic upload fails, the error is properly reported
@z

@x
* `docker-diagnose` displays and records the time the diagnosis was captured
@y
* `docker-diagnose` displays and records the time the diagnosis was captured
@z

@x
* Ports are allowed to bind to host addresses other than `0.0.0.0` and `127.0.0.1`. Fixes issue reported in [docker/for-mac#68](https://github.com/docker/for-mac/issues/68).
@y
* Ports are allowed to bind to host addresses other than `0.0.0.0` and `127.0.0.1`. Fixes issue reported in [docker/for-mac#68](https://github.com/docker/for-mac/issues/68).
@z

@x
* We no longer compute the container folder in `com.docker.vmnetd`. Fixes [docker/for-mac#47](https://github.com/docker/for-mac/issues/47).
@y
* We no longer compute the container folder in `com.docker.vmnetd`. Fixes [docker/for-mac#47](https://github.com/docker/for-mac/issues/47).
@z

@x
**Known Issues**
@y
**Known Issues**
@z

@x
* `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode. The
issue is being investigated. The workaround is to restart Docker.app.
@y
* `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode. The
issue is being investigated. The workaround is to restart Docker.app.
@z

@x
* There are a number of issues with the performance of directories bind-mounted with `osxfs`. In particular, writes of small blocks and
traversals of large directories are currently slow. Additionally, containers
that perform large numbers of directory operations, such as repeated scans of
large directory trees, may suffer from poor performance. More information is
available in [Known Issues](troubleshoot.md#known-issues) in Troubleshooting.
@y
* There are a number of issues with the performance of directories bind-mounted with `osxfs`. In particular, writes of small blocks and
traversals of large directories are currently slow. Additionally, containers
that perform large numbers of directory operations, such as repeated scans of
large directory trees, may suffer from poor performance. More information is
available in [Known Issues](troubleshoot.md#known-issues) in Troubleshooting.
@z

@x
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart `Docker.app`.
@y
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart `Docker.app`.
@z

@x
### Beta 25 Release Notes (2016-09-07 1.12.1-beta25)
@y
### Beta 25 Release Notes (2016-09-07 1.12.1-beta25)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Experimental support for macOS 10.12 Sierra (beta)
@y
* Experimental support for macOS 10.12 Sierra (beta)
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* VPNKit supports search domains
* Entries from `/etc/hosts` should now resolve from within containers
* osxfs: fix thread leak
@y
* VPNKit supports search domains
* Entries from `/etc/hosts` should now resolve from within containers
* osxfs: fix thread leak
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Several problems have been reported on macOS 10.12 Sierra and are being
investigated. This includes failure to launch the app and being unable to
upgrade to a new version.
@y
* Several problems have been reported on macOS 10.12 Sierra and are being
investigated. This includes failure to launch the app and being unable to
upgrade to a new version.
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The
issue is being investigated. The workaround is to restart Docker.app
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The
issue is being investigated. The workaround is to restart Docker.app
@z

@x
* There are a number of issues with the performance of directories bind-mounted
with `osxfs`. In particular, writes of small blocks and traversals of large
directories are currently slow. Additionally, containers that perform large
numbers of directory operations, such as repeated scans of large directory
trees, may suffer from poor performance. More information is available in
[Known Issues](troubleshoot.md#known-issues) in Troubleshooting.
@y
* There are a number of issues with the performance of directories bind-mounted
with `osxfs`. In particular, writes of small blocks and traversals of large
directories are currently slow. Additionally, containers that perform large
numbers of directory operations, such as repeated scans of large directory
trees, may suffer from poor performance. More information is available in
[Known Issues](troubleshoot.md#known-issues) in Troubleshooting.
@z

@x
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart Docker.app.
@y
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart Docker.app.
@z

@x
### Beta 24 Release Notes (2016-08-23 1.12.1-beta24)
@y
### Beta 24 Release Notes (2016-08-23 1.12.1-beta24)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.1
* Docker Machine 0.8.1
* Linux kernel 4.4.19
* AUFS 20160822
@y
* Docker 1.12.1
* Docker Machine 0.8.1
* Linux kernel 4.4.19
* AUFS 20160822
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* osxfs: fixed a malfunction of new directories that have the same name as an old directory that is still open
@y
* osxfs: fixed a malfunction of new directories that have the same name as an old directory that is still open
@z

@x
* osxfs: rename events now trigger DELETE and/or MODIFY `inotify` events (saving with TextEdit works now)
@y
* osxfs: rename events now trigger DELETE and/or MODIFY `inotify` events (saving with TextEdit works now)
@z

@x
* slirp: support up to 8 external DNS servers
@y
* slirp: support up to 8 external DNS servers
@z

@x
* slirp: reduce the number of sockets used by UDP NAT, reduce the probability that NAT rules will time out earlier than expected
@y
* slirp: reduce the number of sockets used by UDP NAT, reduce the probability that NAT rules will time out earlier than expected
@z

@x
* The app warns user if BlueStacks is installed (potential kernel panic)
@y
* The app warns user if BlueStacks is installed (potential kernel panic)
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Several problems have been reported on macOS 10.12 Sierra and are being investigated. This includes failure to launch the app and being unable to upgrade to a new version.
@y
* Several problems have been reported on macOS 10.12 Sierra and are being investigated. This includes failure to launch the app and being unable to upgrade to a new version.
@z

@x
* `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode.  The issue is being investigated. The workaround is to restart `Docker.app`.
@y
* `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode.  The issue is being investigated. The workaround is to restart `Docker.app`.
@z

@x
* There are a number of issues with the performance of directories bind-mounted with `osxfs`. In particular, writes of small blocks and traversals of large
directories are currently slow. Additionally, containers that perform large
numbers of directory operations, such as repeated scans of large directory
trees, may suffer from poor performance. For more information and workarounds, see the bullet on [performance of bind-mounted directories](troubleshoot.md#bind-mounted-dirs) in [Known Issues](troubleshoot.md#known-issues) in Troubleshooting.
@y
* There are a number of issues with the performance of directories bind-mounted with `osxfs`. In particular, writes of small blocks and traversals of large
directories are currently slow. Additionally, containers that perform large
numbers of directory operations, such as repeated scans of large directory
trees, may suffer from poor performance. For more information and workarounds, see the bullet on [performance of bind-mounted directories](troubleshoot.md#bind-mounted-dirs) in [Known Issues](troubleshoot.md#known-issues) in Troubleshooting.
@z

@x
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart `Docker.app`.
@y
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart `Docker.app`.
@z

@x
### Beta 23 Release Notes (2016-08-16 1.12.1-rc1-beta23)
@y
### Beta 23 Release Notes (2016-08-16 1.12.1-rc1-beta23)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.1-rc1
* Linux kernel 4.4.17
* AUFS 20160808
@y
* Docker 1.12.1-rc1
* Linux kernel 4.4.17
* AUFS 20160808
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Moby: use default sysfs settings, transparent huge pages disabled
* Moby: cgroup mount to support systemd in containers
* osxfs: fixed an issue that caused `inotify` failure and crashes
* osxfs: fixed a directory fd leak
* Zsh completions
@y
* Moby: use default sysfs settings, transparent huge pages disabled
* Moby: cgroup mount to support systemd in containers
* osxfs: fixed an issue that caused `inotify` failure and crashes
* osxfs: fixed a directory fd leak
* Zsh completions
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
*  Docker for Mac is not supported on macOS 10.12 Sierra
@y
*  Docker for Mac is not supported on macOS 10.12 Sierra
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app
@z

@x
* There are a number of issues with the performance of directories bind-mounted with `osxfs`. In particular, writes of small blocks and traversals of large directories are currently slow. Additionally, containers that perform large numbers of directory operations, such as repeated scans of large directory trees, may suffer from poor performance. For more information and workarounds, see the bullet on [performance of bind-mounted directories](troubleshoot.md#bind-mounted-dirs) in [Known Issues](troubleshoot.md#known-issues) in Troubleshooting.
@y
* There are a number of issues with the performance of directories bind-mounted with `osxfs`. In particular, writes of small blocks and traversals of large directories are currently slow. Additionally, containers that perform large numbers of directory operations, such as repeated scans of large directory trees, may suffer from poor performance. For more information and workarounds, see the bullet on [performance of bind-mounted directories](troubleshoot.md#bind-mounted-dirs) in [Known Issues](troubleshoot.md#known-issues) in Troubleshooting.
@z

@x
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart Docker.app
@y
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart Docker.app
@z

@x
### Beta 22 Release Notes (2016-08-11 1.12.0-beta22)
@y
### Beta 22 Release Notes (2016-08-11 1.12.0-beta22)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
*  Linux kernel to 4.4.16
@y
*  Linux kernel to 4.4.16
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Increase Moby fs.file-max to 524288
* Use Mac System Configuration database to detect DNS
* HyperKit updated with dtrace support and lock fixes
* Fix Moby Diagnostics and Update Kernel
* UI Fixes
* osxfs: fix socket chowns
@y
* Increase Moby fs.file-max to 524288
* Use Mac System Configuration database to detect DNS
* HyperKit updated with dtrace support and lock fixes
* Fix Moby Diagnostics and Update Kernel
* UI Fixes
* osxfs: fix socket chowns
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app
@z

@x
* There are a number of issues with the performance of directories bind-mounted with `osxfs`. In particular, writes of small blocks and traversals of large directories are currently slow. Additionally, containers that perform large numbers of directory operations, such as repeated scans of large directory trees, may suffer from poor performance. More information is available in [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@y
* There are a number of issues with the performance of directories bind-mounted with `osxfs`. In particular, writes of small blocks and traversals of large directories are currently slow. Additionally, containers that perform large numbers of directory operations, such as repeated scans of large directory trees, may suffer from poor performance. More information is available in [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@z

@x
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart Docker.app
@y
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart Docker.app
@z

@x
### Beta 21.1 Release Notes (2016-08-03 1.12.0-beta21.1)
@y
### Beta 21.1 Release Notes (2016-08-03 1.12.0-beta21.1)
@z

@x
This bug fix release contains osxfs improvements. The fixed issues may have
been seen as failures with apt-get and npm in containers, missed `inotify`
events or unexpected unmounts.
@y
This bug fix release contains osxfs improvements. The fixed issues may have
been seen as failures with apt-get and npm in containers, missed `inotify`
events or unexpected unmounts.
@z

@x
**Hotfixes**
@y
**Hotfixes**
@z

@x
* osxfs: fixed an issue causing access to children of renamed directories to fail (symptoms: npm failures, apt-get failures)
@y
* osxfs: fixed an issue causing access to children of renamed directories to fail (symptoms: npm failures, apt-get failures)
@z

@x
* osxfs: fixed an issue causing some ATTRIB and CREATE `inotify` events to fail delivery and other `inotify` events to stop
@y
* osxfs: fixed an issue causing some ATTRIB and CREATE `inotify` events to fail delivery and other `inotify` events to stop
@z

@x
* osxfs: fixed an issue causing all `inotify` events to stop when an ancestor directory of a mounted directory was mounted
@y
* osxfs: fixed an issue causing all `inotify` events to stop when an ancestor directory of a mounted directory was mounted
@z

@x
* osxfs: fixed an issue causing volumes mounted under other mounts to spontaneously unmount (docker/docker#24503)
@y
* osxfs: fixed an issue causing volumes mounted under other mounts to spontaneously unmount (docker/docker#24503)
@z

@x
### Docker for Mac 1.12.0 (2016-07-28 1.12.0-beta21)
@y
### Docker for Mac 1.12.0 (2016-07-28 1.12.0-beta21)
@z

@x
**New**
@y
**New**
@z

@x
* Docker for Mac is now available from 2 channels: **stable** and **beta**. New features and bug fixes will go out first in auto-updates to users in the beta channel. Updates to the stable channel are much less frequent and happen in sync with major and minor releases of the Docker engine. Only features that are well-tested and ready for production are added to the stable channel releases. For downloads of both and more information, see the [Getting Started](index.md#download-docker-for-mac).
@y
* Docker for Mac is now available from 2 channels: **stable** and **beta**. New features and bug fixes will go out first in auto-updates to users in the beta channel. Updates to the stable channel are much less frequent and happen in sync with major and minor releases of the Docker engine. Only features that are well-tested and ready for production are added to the stable channel releases. For downloads of both and more information, see the [Getting Started](index.md#download-docker-for-mac).
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.0 with experimental features
* Docker Machine 0.8.0
* Docker Compose 1.8.0
@y
* Docker 1.12.0 with experimental features
* Docker Machine 0.8.0
* Docker Compose 1.8.0
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Check for updates, auto-update and diagnose can be run by non-admin users
* osxfs: fixed an issue causing occasional incorrect short reads
* osxfs: fixed an issue causing occasional EIO errors
* osxfs: fixed an issue causing `inotify` creation events to fail
* osxfs: increased the `fs.inotify.max_user_watches` limit in Moby to 524288
* The UI shows documentation link for sharing volumes
* Clearer error message when running with outdated VirtualBox version
* Added link to sources for qemu-img
@y
* Check for updates, auto-update and diagnose can be run by non-admin users
* osxfs: fixed an issue causing occasional incorrect short reads
* osxfs: fixed an issue causing occasional EIO errors
* osxfs: fixed an issue causing `inotify` creation events to fail
* osxfs: increased the `fs.inotify.max_user_watches` limit in Moby to 524288
* The UI shows documentation link for sharing volumes
* Clearer error message when running with outdated VirtualBox version
* Added link to sources for qemu-img
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app
@z

@x
* There are a number of issues with the performance of directories bind-mounted with `osxfs`.  In particular, writes of small blocks, and traversals of large directories are currently slow.  Additionally, containers that perform large numbers of directory operations, such as repeated scans of large directory trees, may suffer from poor performance. For more information and workarounds, see [Known Issues](troubleshoot.md#known-issues) in [Logs and Troubleshooting](troubleshoot.md).
@y
* There are a number of issues with the performance of directories bind-mounted with `osxfs`.  In particular, writes of small blocks, and traversals of large directories are currently slow.  Additionally, containers that perform large numbers of directory operations, such as repeated scans of large directory trees, may suffer from poor performance. For more information and workarounds, see [Known Issues](troubleshoot.md#known-issues) in [Logs and Troubleshooting](troubleshoot.md).
@z

@x
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart Docker.app
@y
* Under some unhandled error conditions, `inotify` event delivery can fail and become permanently disabled. The workaround is to restart Docker.app
@z

@x
### Beta 20 Release Notes (2016-07-19 1.12.0-rc4-beta20)
@y
### Beta 20 Release Notes (2016-07-19 1.12.0-rc4-beta20)
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Fixed `docker.sock` permission issues
* Don't check for update when the settings panel opens
* Removed obsolete DNS workaround
* Use the secondary DNS server in more circumstances
* Limit the number of concurrent port forwards to avoid running out of resources
* Store the database as a "bare" git repo to avoid corruption problems
@y
* Fixed `docker.sock` permission issues
* Don't check for update when the settings panel opens
* Removed obsolete DNS workaround
* Use the secondary DNS server in more circumstances
* Limit the number of concurrent port forwards to avoid running out of resources
* Store the database as a "bare" git repo to avoid corruption problems
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
*  `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker for Mac (`Docker.app`).
@y
*  `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker for Mac (`Docker.app`).
@z

@x
### Beta 19 Release Notes (2016-07-14 1.12.0-rc4-beta19)
@y
### Beta 19 Release Notes (2016-07-14 1.12.0-rc4-beta19)
@z

@x
**New**
@y
**New**
@z

@x
* Added privacy tab in settings
* Allow the definition of HTTP proxy overrides in the UI
@y
* Added privacy tab in settings
* Allow the definition of HTTP proxy overrides in the UI
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.0 RC4
* Docker Compose 1.8.0 RC2
* Docker Machine 0.8.0 RC2
* Linux kernel 4.4.15
@y
* Docker 1.12.0 RC4
* Docker Compose 1.8.0 RC2
* Docker Machine 0.8.0 RC2
* Linux kernel 4.4.15
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Filesystem sharing permissions can only be configured in the UI (no more `/Mac` in moby)
* `com.docker.osx.xhyve.hyperkit`: increased max number of fds to 10240
* Improved Moby syslog facilities
* Improved file-sharing tab
* `com.docker.slirp`: included the DNS TCP fallback fix, required when UDP responses are truncated
* `docker build/events/logs/stats... ` won't leak when iterrupted with Ctrl-C
@y
* Filesystem sharing permissions can only be configured in the UI (no more `/Mac` in moby)
* `com.docker.osx.xhyve.hyperkit`: increased max number of fds to 10240
* Improved Moby syslog facilities
* Improved file-sharing tab
* `com.docker.slirp`: included the DNS TCP fallback fix, required when UDP responses are truncated
* `docker build/events/logs/stats... ` won't leak when iterrupted with Ctrl-C
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@y
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@z

@x
### Beta 18.1 Release Notes (2016-07-07 1.12.0-rc3-beta18.1)
@y
### Beta 18.1 Release Notes (2016-07-07 1.12.0-rc3-beta18.1)
@z

@x
>**Note**: Docker 1.12.0 RC3 release introduces a backward incompatible change from RC2. You can fix this by [recreating or updating your containers](troubleshoot.md#recreate-or-update-your-containers-after-beta-18-upgrade) as described in Troubleshooting.
@y
>**Note**: Docker 1.12.0 RC3 release introduces a backward incompatible change from RC2. You can fix this by [recreating or updating your containers](troubleshoot.md#recreate-or-update-your-containers-after-beta-18-upgrade) as described in Troubleshooting.
@z

@x
**Hotfix**
@y
**Hotfix**
@z

@x
* Fixed issue resulting in error "Hijack is incompatible with use of CloseNotifier", reverts previous fix for `Ctrl-C` during build.
@y
* Fixed issue resulting in error "Hijack is incompatible with use of CloseNotifier", reverts previous fix for `Ctrl-C` during build.
@z

@x
**New**
@y
**New**
@z

@x
* New host/container file sharing UI
* `/Mac` bind mount prefix is deprecated and will be removed soon
@y
* New host/container file sharing UI
* `/Mac` bind mount prefix is deprecated and will be removed soon
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.0 RC3
@y
* Docker 1.12.0 RC3
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* VPNKit: Improved scalability as number of network connections increases
* The docker API proxy was failing to deal with some 1.12 features, such as health check.
@y
* VPNKit: Improved scalability as number of network connections increases
* The docker API proxy was failing to deal with some 1.12 features, such as health check.
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@y
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@z

@x
### Beta 18 Release Notes (2016-07-06 1.12.0-rc3-beta18)
@y
### Beta 18 Release Notes (2016-07-06 1.12.0-rc3-beta18)
@z

@x
**New**
@y
**New**
@z

@x
* New host/container file sharing UI
* `/Mac` bind mount prefix is deprecated and will be removed soon
@y
* New host/container file sharing UI
* `/Mac` bind mount prefix is deprecated and will be removed soon
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.0 RC3
@y
* Docker 1.12.0 RC3
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* VPNKit: Improved scalability as number of network connections increases
* Interrupting a `docker build` with Ctrl-C will actually stop the build
* The docker API proxy was failing to deal with some 1.12 features, such as health check.
@y
* VPNKit: Improved scalability as number of network connections increases
* Interrupting a `docker build` with Ctrl-C will actually stop the build
* The docker API proxy was failing to deal with some 1.12 features, such as health check.
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@y
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@z

@x
### Beta 17 Release Notes (2016-06-29 1.12.0-rc2-beta17)
@y
### Beta 17 Release Notes (2016-06-29 1.12.0-rc2-beta17)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Linux kernel 4.4.14, AUFS 20160627
@y
* Linux kernel 4.4.14, AUFS 20160627
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Documentation moved to [https://docs.docker.com/docker-for-mac/](index.md)
* Allow non-admin users to launch the app for the first time (using admin creds)
* Prompt non-admin users for admin password when needed in Preferences
* Fixed download links, documentation links
* Fixed "failure: No error" message in diagnostic panel
* Improved diagnostics for networking and logs for the service port openers
@y
* Documentation moved to [https://docs.docker.com/docker-for-mac/](index.md)
* Allow non-admin users to launch the app for the first time (using admin creds)
* Prompt non-admin users for admin password when needed in Preferences
* Fixed download links, documentation links
* Fixed "failure: No error" message in diagnostic panel
* Improved diagnostics for networking and logs for the service port openers
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@y
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@z

@x
### Beta 16 Release Notes (2016-06-17 1.12.0-rc2-beta16)
@y
### Beta 16 Release Notes (2016-06-17 1.12.0-rc2-beta16)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.12.0 RC2
* docker-compose 1.8.0 RC1
* docker-machine 0.8.0 RC1
* notary 0.3
* Alpine 3.4
@y
* Docker 1.12.0 RC2
* docker-compose 1.8.0 RC1
* docker-machine 0.8.0 RC1
* notary 0.3
* Alpine 3.4
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* VPNKit: Fixed a regressed error message when a port is in use
* Fixed UI crashing with `NSInternalInconsistencyException` / fixed leak
* HyperKit API: Improved error reporting
* osxfs: fix sporadic EBADF due to fd access/release races (#3683)
@y
* VPNKit: Fixed a regressed error message when a port is in use
* Fixed UI crashing with `NSInternalInconsistencyException` / fixed leak
* HyperKit API: Improved error reporting
* osxfs: fix sporadic EBADF due to fd access/release races (#3683)
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@y
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@z

@x
### Beta 15 Release Notes (2016-06-10 1.11.2-beta15)
@y
### Beta 15 Release Notes (2016-06-10 1.11.2-beta15)
@z

@x
**New**
@y
**New**
@z

@x
* Registry mirror and insecure registries can now be configured from Preferences
* Virtual machine can now be restarted from Preferences
* `sysctl.conf` can be edited from Preferences
@y
* Registry mirror and insecure registries can now be configured from Preferences
* Virtual machine can now be restarted from Preferences
* `sysctl.conf` can be edited from Preferences
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.11.2
* Linux 4.4.12, `aufs` 20160530
@y
* Docker 1.11.2
* Linux 4.4.12, `aufs` 20160530
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Timekeeping in Moby VM improved
* Number of concurrent TCP/UDP connections increased in VPNKit
* Hyperkit: `vsock` stability improvements
* Fixed crash when user is admin
@y
* Timekeeping in Moby VM improved
* Number of concurrent TCP/UDP connections increased in VPNKit
* Hyperkit: `vsock` stability improvements
* Fixed crash when user is admin
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@y
* See [Known Issues](troubleshoot.md#known-issues) in [Troubleshooting](troubleshoot.md)
@z

@x
### Beta 14 Release Notes (2016-06-02 1.11.1-beta14)
@y
### Beta 14 Release Notes (2016-06-02 1.11.1-beta14)
@z

@x
**New**
@y
**New**
@z

@x
* New settings menu item, **Diagnose & Feedback**, is available to run diagnostics and upload logs to Docker.
@y
* New settings menu item, **Diagnose & Feedback**, is available to run diagnostics and upload logs to Docker.
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode with macOS 10.10. The issue is being investigated. The workaround is to restart `Docker.app`.
@y
* `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode with macOS 10.10. The issue is being investigated. The workaround is to restart `Docker.app`.
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* `osxfs`: now support `statfs`
* **Preferences**: updated toolbar icons
* Fall back to secondary DNS server if primary fails.
* Added a link to the documentation from menu.
@y
* `osxfs`: now support `statfs`
* **Preferences**: updated toolbar icons
* Fall back to secondary DNS server if primary fails.
* Added a link to the documentation from menu.
@z

@x
### Beta 13.1 Release Notes (2016-05-28 1.11.1-beta13.1)
@y
### Beta 13.1 Release Notes (2016-05-28 1.11.1-beta13.1)
@z

@x
**Hotfixes**
@y
**Hotfixes**
@z

@x
* `osxfs`:
  - Fixed sporadic EBADF errors and End_of_file crashes due to a race corrupting node table invariants
  - Fixed a crash after accessing a sibling of a file moved to another directory caused by a node table invariant violation
* Fixed issue where Proxy settings were applied on network change, causing docker daemon to restart too often
* Fixed issue where log file sizes doubled on docker daemon restart
@y
* `osxfs`:
  - Fixed sporadic EBADF errors and End_of_file crashes due to a race corrupting node table invariants
  - Fixed a crash after accessing a sibling of a file moved to another directory caused by a node table invariant violation
* Fixed issue where Proxy settings were applied on network change, causing docker daemon to restart too often
* Fixed issue where log file sizes doubled on docker daemon restart
@z

@x
### Beta 13 Release Notes (2016-05-25 1.11.1-beta13)
@y
### Beta 13 Release Notes (2016-05-25 1.11.1-beta13)
@z

@x
**New**
@y
**New**
@z

@x
* `osxfs`: Enabled 10ms dcache for 3x speedup on a `go list ./...` test against docker/machine. Workloads heavy in file system path resolution (common among dynamic languages and build systems) will have those resolutions performed in amortized constant time rather than time linear in the depth of the path so speedups of 2-10x will be common.
@y
* `osxfs`: Enabled 10ms dcache for 3x speedup on a `go list ./...` test against docker/machine. Workloads heavy in file system path resolution (common among dynamic languages and build systems) will have those resolutions performed in amortized constant time rather than time linear in the depth of the path so speedups of 2-10x will be common.
@z

@x
* Support multiple users on the same machine, non-admin users can use the app as long as `vmnetd` has been installed. Currently, only one user can be logged in at the same time.
@y
* Support multiple users on the same machine, non-admin users can use the app as long as `vmnetd` has been installed. Currently, only one user can be logged in at the same time.
@z

@x
* Basic support for using system HTTP/HTTPS proxy in docker daemon
@y
* Basic support for using system HTTP/HTTPS proxy in docker daemon
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app.
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app.
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* `osxfs`:
  - setting `atime` and `mtime` of nodes is now supported
  - Fixed major regression in Beta 12 with ENOENT, ENOTEMPY, and other spurious errors after a directory rename. This manifested as `npm install` failure and other directory traversal issues.
  - Fixed temporary file ENOENT errors
  - Fixed in-place editing file truncation error, such as when running `perl -i`
* improved time synchronisation after sleep
@y
* `osxfs`:
  - setting `atime` and `mtime` of nodes is now supported
  - Fixed major regression in Beta 12 with ENOENT, ENOTEMPY, and other spurious errors after a directory rename. This manifested as `npm install` failure and other directory traversal issues.
  - Fixed temporary file ENOENT errors
  - Fixed in-place editing file truncation error, such as when running `perl -i`
* improved time synchronisation after sleep
@z

@x
### Beta 12 Release (2016-05-17 1.11.1-beta12)
@y
### Beta 12 Release (2016-05-17 1.11.1-beta12)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* FUSE 7.23 for osxfs
@y
* FUSE 7.23 for osxfs
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app.
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app.
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* UI improvements
* Fixed a problem in osxfs where`mkdir` returned EBUSY but directory was created.
@y
* UI improvements
* Fixed a problem in osxfs where`mkdir` returned EBUSY but directory was created.
@z

@x
### Beta 11 Release (2016-05-10 1.11.1-beta11)
@y
### Beta 11 Release (2016-05-10 1.11.1-beta11)
@z

@x
**New**
@y
**New**
@z

@x
The `osxfs` file system now persists ownership changes in an extended attribute.
@y
The `osxfs` file system now persists ownership changes in an extended attribute.
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* docker-compose 1.7.1 (see [changelog](https://github.com/docker/compose/releases/tag/1.7.1){: target="_blank" rel="noopener" class="_" })
* Linux kernel 4.4.9
@y
* docker-compose 1.7.1 (see [changelog](https://github.com/docker/compose/releases/tag/1.7.1){: target="_blank" rel="noopener" class="_" })
* Linux kernel 4.4.9
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Desktop notifications after successful update
* No "update available" popup during install process
* Fixed repeated bind of privileged ports
* `osxfs`: Fixed the block count reported by stat
* Moby (Backend) fixes:
  - Fixed `vsock` half closed issue
  - Added NFS support
  - Hostname is now Moby, not Docker
  - Fixes to disk formatting scripts
  - Linux kernel upgrade to 4.4.9
@y
* Desktop notifications after successful update
* No "update available" popup during install process
* Fixed repeated bind of privileged ports
* `osxfs`: Fixed the block count reported by stat
* Moby (Backend) fixes:
  - Fixed `vsock` half closed issue
  - Added NFS support
  - Hostname is now Moby, not Docker
  - Fixes to disk formatting scripts
  - Linux kernel upgrade to 4.4.9
@z

@x
### Beta 10 Release (2016-05-03 1.11.0-beta10)
@y
### Beta 10 Release (2016-05-03 1.11.0-beta10)
@z

@x
**New**
@y
**New**
@z

@x
* Token validation is now done over an actual SSL tunnel (HTTPS). (This should fix issues with antivirus applications.)
@y
* Token validation is now done over an actual SSL tunnel (HTTPS). (This should fix issues with antivirus applications.)
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* Docker 1.11.1
@y
* Docker 1.11.1
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* UCP now starts again
* Include debugging symbols in HyperKit
* vsock stability improvements
* Addressed glitches in **Preferences** panel
* Fixed issues impacting the “whale menu”
* Fixed uninstall process
* HyperKit vcpu state machine improvements, may improve suspend/resume
@y
* UCP now starts again
* Include debugging symbols in HyperKit
* vsock stability improvements
* Addressed glitches in **Preferences** panel
* Fixed issues impacting the “whale menu”
* Fixed uninstall process
* HyperKit vcpu state machine improvements, may improve suspend/resume
@z

@x
### Beta 9 Release (2016-04-26 1.11.0-beta9)
@y
### Beta 9 Release (2016-04-26 1.11.0-beta9)
@z

@x
**New**
@y
**New**
@z

@x
* New Preferences window - memory and vCPUs now adjustable
* `localhost` is now used for port forwarding by default.`docker.local` will no longer work as of Beta 9.
@y
* New Preferences window - memory and vCPUs now adjustable
* `localhost` is now used for port forwarding by default.`docker.local` will no longer work as of Beta 9.
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app.
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app.
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Fix loopback device naming
* Improved docker socket download and osxfs sequential write by 20%
* `com.docker.osxfs`
  - improved sequential read throughput by up to 20%
  - improved `readdir` performance by up to 6x
  - log all fatal exceptions
* More reliable DNS forwarding over UDP and TCP
* UDP ports can be proxied over vsock
* Fixed EADDRINUSE (manifesting as errno 526) when ports are re-used
* Send ICMP when asked to not fragment and we can't guarantee it
* Fixed parsing of UDP datagrams with IP socket options
* Drop abnormally large ethernet frames
* Improved HyperKit logging
* Record virtual machine start and stop events
@y
* Fix loopback device naming
* Improved docker socket download and osxfs sequential write by 20%
* `com.docker.osxfs`
  - improved sequential read throughput by up to 20%
  - improved `readdir` performance by up to 6x
  - log all fatal exceptions
* More reliable DNS forwarding over UDP and TCP
* UDP ports can be proxied over vsock
* Fixed EADDRINUSE (manifesting as errno 526) when ports are re-used
* Send ICMP when asked to not fragment and we can't guarantee it
* Fixed parsing of UDP datagrams with IP socket options
* Drop abnormally large ethernet frames
* Improved HyperKit logging
* Record virtual machine start and stop events
@z

@x
### Beta 8 Release (2016-04-20 1.11.0-beta8)
@y
### Beta 8 Release (2016-04-20 1.11.0-beta8)
@z

@x
**New**
@y
**New**
@z

@x
* Networking mode switched to VPN compatible by default, and as part of this change the overall experience has been improved:
 - `docker.local` now works in VPN compatibility mode
 - exposing ports on the Mac is available in both networking modes
 - port forwarding of privileged ports now works in both networking modes
 - traffic to external DNS servers is no longer dropped in VPN mode
@y
* Networking mode switched to VPN compatible by default, and as part of this change the overall experience has been improved:
 - `docker.local` now works in VPN compatibility mode
 - exposing ports on the Mac is available in both networking modes
 - port forwarding of privileged ports now works in both networking modes
 - traffic to external DNS servers is no longer dropped in VPN mode
@z

@x
* `osxfs` now uses `AF_VSOCK` for transport giving ~1.8x speedup for large sequential read/write workloads but increasing latency by ~1.3x. `osxfs` performance engineering work continues.
@y
* `osxfs` now uses `AF_VSOCK` for transport giving ~1.8x speedup for large sequential read/write workloads but increasing latency by ~1.3x. `osxfs` performance engineering work continues.
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart `Docker.app`
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart `Docker.app`
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Apple System Log now used for most logs instead of direct filesystem logging
* `docker_proxy` fixes
* Merged HyperKit upstream patches
* Improved error reporting in `nat` network mode
* `osxfs` `transfused` client now logs over `AF_VSOCK`
* Fixed a `com.docker.osx.HyperKit.linux` supervisor deadlock if processes exit during a controlled shutdown
* Fixed VPN mode malformed DNS query bug preventing some resolutions
@y
* Apple System Log now used for most logs instead of direct filesystem logging
* `docker_proxy` fixes
* Merged HyperKit upstream patches
* Improved error reporting in `nat` network mode
* `osxfs` `transfused` client now logs over `AF_VSOCK`
* Fixed a `com.docker.osx.HyperKit.linux` supervisor deadlock if processes exit during a controlled shutdown
* Fixed VPN mode malformed DNS query bug preventing some resolutions
@z

@x
### Beta 7 Release (2016-04-12 1.11.0-beta7)
@y
### Beta 7 Release (2016-04-12 1.11.0-beta7)
@z

@x
**New**
@y
**New**
@z

@x
* Docs are updated per the Beta 7 release
* Use AF_VSOCK for docker socket transport
@y
* Docs are updated per the Beta 7 release
* Use AF_VSOCK for docker socket transport
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* docker 1.11.0-rc5
* docker-machine 0.7.0-rc3
* docker-compose 1.7.0rc2
@y
* docker 1.11.0-rc5
* docker-machine 0.7.0-rc3
* docker-compose 1.7.0rc2
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app
@y
* Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app
@z

@x
* If VPN mode is enabled and then disabled and then re-enabled again, `docker ps` will block for 90s
@y
* If VPN mode is enabled and then disabled and then re-enabled again, `docker ps` will block for 90s
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Logging improvements
* Improve process management
@y
* Logging improvements
* Improve process management
@z

@x
### Beta 6 Release (2016-04-05 1.11.0-beta6)
@y
### Beta 6 Release (2016-04-05 1.11.0-beta6)
@z

@x
**New**
@y
**New**
@z

@x
* Docs are updated per the Beta 6 release
* Added uninstall option in user interface
@y
* Docs are updated per the Beta 6 release
* Added uninstall option in user interface
@z

@x
**Upgrades**
@y
**Upgrades**
@z

@x
* docker 1.11.0-rc5
* docker-machine 0.7.0-rc3
* docker-compose 1.7.0rc2
@y
* docker 1.11.0-rc5
* docker-machine 0.7.0-rc3
* docker-compose 1.7.0rc2
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
* `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode.
The issue is being investigated. The workaround is to restart
`Docker.app`.
@y
* `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode.
The issue is being investigated. The workaround is to restart
`Docker.app`.
@z

@x
* If VPN mode is enabled, then disabled and re-enabled again,
`docker ps` will block for 90 seconds.
@y
* If VPN mode is enabled, then disabled and re-enabled again,
`docker ps` will block for 90 seconds.
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
* Fixed osxfs multiple same directory bind mounts stopping inotify
* Fixed osxfs `setattr` on mode 0 files (`sed` failures)
* Fixed osxfs blocking all operations during `readdir`
* Fixed osxfs mishandled errors which crashed the file system and VM
* Removed outdated `lofs`/`9p` support
* Added more debugging info to logs uploaded by `pinata diagnose`
* Improved diagnostics from within the virtual machine
* VirtualBox version check now also works without VBoxManage in path
* VPN mode now uses same IP range as NAT mode
* Tokens are now verified on port 443
* Removed outdated uninstall scripts
* Increased default ulimits
* Port forwarding with `-p` and `-P` should work in VPN mode
* Fixed a memory leak in `com.docker.db`
* Fixed a race condition on startup between Docker and networking which can
lead to `Docker.app` not starting on reboot
@y
* Fixed osxfs multiple same directory bind mounts stopping inotify
* Fixed osxfs `setattr` on mode 0 files (`sed` failures)
* Fixed osxfs blocking all operations during `readdir`
* Fixed osxfs mishandled errors which crashed the file system and VM
* Removed outdated `lofs`/`9p` support
* Added more debugging info to logs uploaded by `pinata diagnose`
* Improved diagnostics from within the virtual machine
* VirtualBox version check now also works without VBoxManage in path
* VPN mode now uses same IP range as NAT mode
* Tokens are now verified on port 443
* Removed outdated uninstall scripts
* Increased default ulimits
* Port forwarding with `-p` and `-P` should work in VPN mode
* Fixed a memory leak in `com.docker.db`
* Fixed a race condition on startup between Docker and networking which can
lead to `Docker.app` not starting on reboot
@z

@x
### Beta 5 Release (2016-03-29 1.10.3-beta5)
@y
### Beta 5 Release (2016-03-29 1.10.3-beta5)
@z

@x
**New**
@y
**New**
@z

@x
- Docs are updated per the Beta 5 release!
@y
- Docs are updated per the Beta 5 release!
@z

@x
**Known issues**
@y
**Known issues**
@z

@x
- There is a race on startup between docker and networking which can lead to Docker.app not starting on reboot. The workaround is to restart the application manually.
@y
- There is a race on startup between docker and networking which can lead to Docker.app not starting on reboot. The workaround is to restart the application manually.
@z

@x
- Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app.
@y
- Docker.app sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart Docker.app.
@z

@x
- In VPN mode, the `-p` option needs to be explicitly of the form `-p <host port>:<container port>`. `-p <port>` and `-P` will not work yet.
@y
- In VPN mode, the `-p` option needs to be explicitly of the form `-p <host port>:<container port>`. `-p <port>` and `-P` will not work yet.
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Updated DMG background image
- Show correct VM memory in Preferences
- Feedback opens forum, not email
- Fixed RAM amount error message
- Fixed wording of CPU error dialog
- Removed status from Preferences
- Check for incompatible versions of VirtualBox
@y
- Updated DMG background image
- Show correct VM memory in Preferences
- Feedback opens forum, not email
- Fixed RAM amount error message
- Fixed wording of CPU error dialog
- Removed status from Preferences
- Check for incompatible versions of VirtualBox
@z

@x
### Beta 4 Release (2016-03-22 1.10.3-beta4)
@y
### Beta 4 Release (2016-03-22 1.10.3-beta4)
@z

@x
**New Features and Upgrades**
@y
**New Features and Upgrades**
@z

@x
- File system/sharing: Support `inotify` events so that file system events on the Mac will trigger file system activations inside Linux containers
@y
- File system/sharing: Support `inotify` events so that file system events on the Mac will trigger file system activations inside Linux containers
@z

@x
- Install Docker Machine as a part of Docker for Mac install in `/usr/local`
@y
- Install Docker Machine as a part of Docker for Mac install in `/usr/local`
@z

@x
- Added animated popover window to help first-time users get started
@y
- Added animated popover window to help first-time users get started
@z

@x
- Added a Beta icon to About box
@y
- Added a Beta icon to About box
@z

@x
**Known Issues**
@y
**Known Issues**
@z

@x
- There is a race on startup between Docker and networking that can lead to `Docker.app` not starting on reboot. The workaround is to restart the application manually.
@y
- There is a race on startup between Docker and networking that can lead to `Docker.app` not starting on reboot. The workaround is to restart the application manually.
@z

@x
- `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart `Docker.app`.
@y
- `Docker.app` sometimes uses 200% CPU after macOS wakes up from sleep mode. The issue is being investigated. The workaround is to restart `Docker.app`.
@z

@x
- VPN/Hostnet: In VPN mode, the `-p` option needs to be explicitly of the form
`-p <host port>:<container port>`. `-p <port>` and `-P` will not
work yet.
@y
- VPN/Hostnet: In VPN mode, the `-p` option needs to be explicitly of the form
`-p <host port>:<container port>`. `-p <port>` and `-P` will not
work yet.
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Hostnet/VPN mode: Fixed Moby DNS resolver failures by proxying the "Recursion Available" flag.
@y
- Hostnet/VPN mode: Fixed Moby DNS resolver failures by proxying the "Recursion Available" flag.
@z

@x
- `docker ps` shows IP address rather than `docker.local`
@y
- `docker ps` shows IP address rather than `docker.local`
@z

@x
- Re-enabled support for macOS Yosemite version 10.10
@y
- Re-enabled support for macOS Yosemite version 10.10
@z

@x
- Ensured binaries are built for 10.10 rather than 10.11
@y
- Ensured binaries are built for 10.10 rather than 10.11
@z

@x
- Fixed “Notification Center”-related crash on startup
@y
- Fixed “Notification Center”-related crash on startup
@z

@x
- Fixed watchdog crash on startup
@y
- Fixed watchdog crash on startup
@z

@x
### Beta 3 Release (2016-03-15 1.10.3-beta3)
@y
### Beta 3 Release (2016-03-15 1.10.3-beta3)
@z

@x
**New Features and Upgrades**
@y
**New Features and Upgrades**
@z

@x
- Improved file sharing write speed in osxfs
@y
- Improved file sharing write speed in osxfs
@z

@x
- User space networking: Renamed `bridged` mode to `nat` mode
@y
- User space networking: Renamed `bridged` mode to `nat` mode
@z

@x
- Docker runs in debug mode by default for new installs
@y
- Docker runs in debug mode by default for new installs
@z

@x
- Docker Engine: Upgraded to 1.10.3
@y
- Docker Engine: Upgraded to 1.10.3
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- GUI: Auto update automatically checks for new versions again
@y
- GUI: Auto update automatically checks for new versions again
@z

@x
- File System
  - Fixed osxfs chmod on sockets
  - FixED osxfs EINVAL from `open` using O_NOFOLLOW
@y
- File System
  - Fixed osxfs chmod on sockets
  - FixED osxfs EINVAL from `open` using O_NOFOLLOW
@z

@x
- Hypervisor stability fixes, resynced with upstream repository
@y
- Hypervisor stability fixes, resynced with upstream repository
@z

@x
- Hostnet/VPN mode
  - Fixed get/set VPN mode in Preferences (GUI)
  - Added more verbose logging on errors in `nat` mode
  - Show correct forwarding details in `docker ps/inspect/port` in `nat` mode
@y
- Hostnet/VPN mode
  - Fixed get/set VPN mode in Preferences (GUI)
  - Added more verbose logging on errors in `nat` mode
  - Show correct forwarding details in `docker ps/inspect/port` in `nat` mode
@z

@x
- New lines ignored in token entry field
@y
- New lines ignored in token entry field
@z

@x
- Feedback mail has app version in subject field
@y
- Feedback mail has app version in subject field
@z

@x
- Clarified open source licenses
@y
- Clarified open source licenses
@z

@x
- Crash reporting and error handling
  - Fixed HockeyApp crash reporting
  - Fatal GUI errors now correctly terminate the app again
  - Fix proxy panics on EOF when decoding JSON
  - Fix long delay/crash when switching from `hostnet` to `nat` mode
@y
- Crash reporting and error handling
  - Fixed HockeyApp crash reporting
  - Fatal GUI errors now correctly terminate the app again
  - Fix proxy panics on EOF when decoding JSON
  - Fix long delay/crash when switching from `hostnet` to `nat` mode
@z

@x
- Logging
  - Moby logs included in diagnose upload
  - App version included in logs on startup
@y
- Logging
  - Moby logs included in diagnose upload
  - App version included in logs on startup
@z

@x
### Beta 2 Release (2016-03-08 1.10.2-beta2)
@y
### Beta 2 Release (2016-03-08 1.10.2-beta2)
@z

@x
**New Features and Upgrades**
@y
**New Features and Upgrades**
@z

@x
- GUI
  - Added VPN mode/`hostnet` to Preferences
  - Added disable Time Machine backups of VM disk image to Preferences
@y
- GUI
  - Added VPN mode/`hostnet` to Preferences
  - Added disable Time Machine backups of VM disk image to Preferences
@z

@x
- Added `pinata` configuration tool for experimental Preferences
@y
- Added `pinata` configuration tool for experimental Preferences
@z

@x
- File System: Added guest-to-guest FIFO and socket file support
@y
- File System: Added guest-to-guest FIFO and socket file support
@z

@x
- Upgraded Notary to version 0.2
@y
- Upgraded Notary to version 0.2
@z

@x
**Bug fixes and minor changes**
@y
**Bug fixes and minor changes**
@z

@x
- Fixed data corruption bug during cp (use of sendfile/splice)
- Fixed About box to contain correct version string
@y
- Fixed data corruption bug during cp (use of sendfile/splice)
- Fixed About box to contain correct version string
@z

@x
- Hostnet/VPN mode
  - Stability fixes and tests
  - Fixed DNS issues when changing networks
@y
- Hostnet/VPN mode
  - Stability fixes and tests
  - Fixed DNS issues when changing networks
@z

@x
- Cleaned up Docker startup code related to Moby
@y
- Cleaned up Docker startup code related to Moby
@z

@x
- Fixed various problems with linking and dependencies
@y
- Fixed various problems with linking and dependencies
@z

@x
- Various improvements to logging
@y
- Various improvements to logging
@z

@x
### Beta 1 Release (2016-03-01 1.10.2-b1)
@y
### Beta 1 Release (2016-03-01 1.10.2-b1)
@z

@x
- GUI
  - Added dialog to explain why we need admin rights
  - Removed shutdown/quit window
  - Improved machine migration
  - Added “Help” option in menu to open documentation web pages
  - Added license agreement
  - Added MixPanel support
@y
- GUI
  - Added dialog to explain why we need admin rights
  - Removed shutdown/quit window
  - Improved machine migration
  - Added “Help” option in menu to open documentation web pages
  - Added license agreement
  - Added MixPanel support
@z

@x
- Added HockeyApp crash reporting
- Improve signal handling on task manager
- Use ISO timestamps with microsecond precision for logging
- Clean up logging format
@y
- Added HockeyApp crash reporting
- Improve signal handling on task manager
- Use ISO timestamps with microsecond precision for logging
- Clean up logging format
@z

@x
- Packaging
  - Create /usr/local if it doesn't exist
  - docker-uninstall improvements
  - Remove docker-select as it's no longer used
@y
- Packaging
  - Create /usr/local if it doesn't exist
  - docker-uninstall improvements
  - Remove docker-select as it's no longer used
@z

@x
- Hypervisor
  - Added PID file
  - Networking reliability improvements
@y
- Hypervisor
  - Added PID file
  - Networking reliability improvements
@z

@x
- Hostnet
@y
- Hostnet
@z

@x
  - Fixed port forwarding issue
  - Stability fixes
  - Fixed setting hostname
@y
  - Fixed port forwarding issue
  - Stability fixes
  - Fixed setting hostname
@z

@x
- Fixed permissions on `usr/local` symbolic links
@y
- Fixed permissions on `usr/local` symbolic links
@z
