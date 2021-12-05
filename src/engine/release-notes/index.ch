%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Engine release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
toc_min: 1
toc_max: 2
skip_read_time: true
redirect_from:
  - /release-notes/docker-ce/
  - /release-notes/docker-engine/
---
@y
---
title: Docker Engine リリースノート
description: Learn about the new features, bug fixes, and breaking changes for Docker Engine
keywords: docker, docker engine, ce, whats new, release notes
toc_min: 1
toc_max: 2
skip_read_time: true
redirect_from:
  - /release-notes/docker-ce/
  - /release-notes/docker-engine/
---
@z

@x
This document describes the latest changes, additions, known issues, and fixes
for Docker Engine.
@y
このドキュメントは Docker Engine における最新の変更、追加、既知の問題、バグフィックスについて示します。
@z

@x
> **Note:**
> The client and container runtime are now in separate packages from the daemon
> in Docker Engine 18.09. Users should install and update all three packages at
> the same time to get the latest patch releases. For example, on Ubuntu:
> `sudo apt install docker-ce docker-ce-cli containerd.io`. See the install
> instructions for the corresponding linux distro for details.
@y
> **メモ**
>
> クライアントとコンテナーランタイムは、Docker Engine 18.09 からデーモンとは別パッケージになりました。
> ユーザーがインストールおよびアップデートをする際には、同時に 3 つのパッケージを入手して行い、最新のパッチリリースを合わせるようにします。
> たとえば Ubuntu においては `sudo apt install docker-ce docker-ce-cli containerd.io` を実行します。
> 詳しくは、各ディストリビューションにおけるインストール手順を参照してください。
@z

@x
# Version 20.10
@y
{: #version-2010 }
# Version 20.10
@z

@x
## 20.10.11
2021-11-17
@y
## 20.10.11
2021-11-17
@z

@x
> **IMPORTANT**
>
> Due to [net/http changes](https://github.com/golang/go/issues/40909) in [Go 1.16](https://golang.org/doc/go1.16#net/http),
> HTTP proxies configured through the `$HTTP_PROXY` environment variable are no
> longer used for TLS (`https://`) connections. Make sure you also set an `$HTTPS_PROXY`
> environment variable for handling requests to `https://` URLs.
>
> Refer to the [HTTP/HTTPS proxy section](../../config/daemon/systemd.md#httphttps-proxy)
> to learn how to configure the Docker Daemon to use a proxy server.
{: .important }
@y
> **重要**
>
> [Go 1.16](https://golang.org/doc/go1.16#net/http) における [net/http 変更](https://github.com/golang/go/issues/40909) に基づいて、環境変数`$HTTP_PROXY`を通じて設定された HTTP プロキシーは、TLS (`https://`) 接続には使われなくなりました。
> `https://` URL のリクエスト処理に対しては、環境変数`$HTTPS_PROXY`も利用していることを確認してください。
>
> [HTTP/HTTPS プロキシーの節](../../config/daemon/systemd.md#httphttps-proxy) を参照して、Docker デーモンがプロキシーサーバーを利用する設定方法について確認してください。
{: .important }
@z

@x
### Distribution
@y
{: #distribution }
### ディストリビューション
@z

@x
- Handle ambiguous OCI manifest parsing to mitigate [CVE-2021-41190](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41190) / [GHSA-mc8v-mgrf-8f4m](https://github.com/opencontainers/distribution-spec/security/advisories/GHSA-mc8v-mgrf-8f4m).
  See [GHSA-xmmx-7jpf-fx42](https://github.com/moby/moby/security/advisories/GHSA-xmmx-7jpf-fx42) for details.
@y
- あいまいな OCI マニフェスト解析を取り扱うことにより、[CVE-2021-41190](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41190) / [GHSA-mc8v-mgrf-8f4m](https://github.com/opencontainers/distribution-spec/security/advisories/GHSA-mc8v-mgrf-8f4m) を軽減しました。
  詳しくは [GHSA-xmmx-7jpf-fx42](https://github.com/moby/moby/security/advisories/GHSA-xmmx-7jpf-fx42) を参照してください。
@z

@x
### Windows
@y
### Windows
@z

@x
- Fix panic.log file having read-only attribute set [moby/moby#42987](https://github.com/moby/moby/pull/42987).
@y
- 読み込み専用属性になっていた panic.log ファイルを修正しました。
  [moby/moby#42987](https://github.com/moby/moby/pull/42987)
@z

@x
## Packaging
@y
{: #packaging }
## パッケージ
@z

@x
- Update containerd to [v1.4.12](https://github.com/containerd/containerd/releases/tag/v1.4.12) to mitigate [CVE-2021-41190](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41190).
- Update Golang runtime to Go 1.16.10.
@y
- containerd を [v1.4.12](https://github.com/containerd/containerd/releases/tag/v1.4.12) にアップデートし、[CVE-2021-41190](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41190) を軽減しました。
- Go 言語ランタイムを Go 1.16.10 にアップデートしました。
@z

@x
## 20.10.10
2021-10-25
@y
## 20.10.10
2021-10-25
@z

@x
> **IMPORTANT**
>
> Due to [net/http changes](https://github.com/golang/go/issues/40909) in [Go 1.16](https://golang.org/doc/go1.16#net/http),
> HTTP proxies configured through the `$HTTP_PROXY` environment variable are no
> longer used for TLS (`https://`) connections. Make sure you also set an `$HTTPS_PROXY`
> environment variable for handling requests to `https://` URLs.
>
> Refer to the [HTTP/HTTPS proxy section](../../config/daemon/systemd.md#httphttps-proxy)
> to learn how to configure the Docker Daemon to use a proxy server.
{: .important }
@y
> **重要**
>
> [Go 1.16](https://golang.org/doc/go1.16#net/http) における [net/http 変更](https://github.com/golang/go/issues/40909) に基づいて、環境変数`$HTTP_PROXY`を通じて設定された HTTP プロキシーは、TLS (`https://`) 接続には使われなくなりました。
> `https://` URL のリクエスト処理に対しては、環境変数`$HTTPS_PROXY`も利用していることを確認してください。
>
> [HTTP/HTTPS プロキシーの節](../../config/daemon/systemd.md#httphttps-proxy) を参照して、Docker デーモンがプロキシーサーバーを利用する設定方法について確認してください。
{: .important }
@z

@x
### Builder
@y
### Builder
@z

@x
- Fix platform-matching logic to fix `docker build` using not finding images in
  the local image cache on Arm machines when using BuildKit [moby/moby#42954](https://github.com/moby/moby/pull/42954)
@y
- ARM マシンにおいて BuildKit を利用する場合に、ローカルのイメージキャッシュが見つからないことを利用して、`docker build`修正のため、プラットフォームに応じたマッチングロジックを修正しました。
  [moby/moby#42954](https://github.com/moby/moby/pull/42954)
@z

@x
## Runtime
@y
{: #runtime }
## ランタイム
@z

@x
- Add support for `clone3` syscall in the default seccomp policy to support running
  containers based on recent versions of Fedora and Ubuntu. [moby/moby/#42836](https://github.com/moby/moby/pull/42836).
- Windows: update hcsshim library to fix a bug in sparse file handling in container
  layers, which was exposed by recent changes in Windows [moby/moby#42944](https://github.com/moby/moby/pull/42944).
- Fix some situations where `docker stop` could hang forever [moby/moby#42956](https://github.com/moby/moby/pull/42956).
@y
- Fedora および Ubuntu の最新版においてコンテナー実行をサポートするために、デフォルトの seccomp ポリシー内に`clone3`システムコールへの対応を追加しました。
  [moby/moby/#42836](https://github.com/moby/moby/pull/42836).
- Windows: hcsshim ライブラリを修正し、コンテナーレイヤー内においてスパースファイルの扱いに関するバグを修正しました。
  これは Windows における最新の変更において公開されています。
  [moby/moby#42944](https://github.com/moby/moby/pull/42944).
- `docker stop`がハングしてしまう状況を修正しました。
  [moby/moby#42956](https://github.com/moby/moby/pull/42956).
@z

@x
### Swarm
@y
### Swarm
@z

@x
- Fix an issue where updating a service did not roll back on failure [moby/moby#42875](https://github.com/moby/moby/pull/42875).
@y
- サービス更新の際に、処理失敗があってもロールバックしていなかった点を修正しました。
  [moby/moby#42875](https://github.com/moby/moby/pull/42875).
@z

@x
## Packaging
@y
{: #packaging }
## パッケージ
@z

@x
- Add packages for Ubuntu 21.10 "Impish Indri" and Fedora 35.
- Update `docker scan` to v0.9.0
- Update Golang runtime to Go 1.16.9.
@y
- Ubuntu 21.10 "Impish Indri" と Fedora 35 向けにパッケージを追加しました。
- `docker scan`を v0.9.0 にアップデートしました。
- Go 言語ランタイムを Go 1.16.9 にアップデートしました。
@z

@x
## 20.10.9
2021-10-04
@y
## 20.10.9
2021-10-04
@z

@x
This release is a security release with security fixes in the CLI, runtime, as
well as updated versions of the containerd.io package.
@y
本リリースは、CLI やランタイムにおけるセキュリティフィックスを含んだセキュリティリリースです。
また containerd.io パッケージの更新バージョンも含みます。
@z

@x
> **IMPORTANT**
>
> Due to [net/http changes](https://github.com/golang/go/issues/40909) in [Go 1.16](https://golang.org/doc/go1.16#net/http),
> HTTP proxies configured through the `$HTTP_PROXY` environment variable are no
> longer used for TLS (`https://`) connections. Make sure you also set an `$HTTPS_PROXY`
> environment variable for handling requests to `https://` URLs.
>
> Refer to the [HTTP/HTTPS proxy section](../../config/daemon/systemd.md#httphttps-proxy)
> to learn how to configure the Docker Daemon to use a proxy server.
{: .important }
@y
> **重要**
>
> [Go 1.16](https://golang.org/doc/go1.16#net/http) において [net/http changes](https://github.com/golang/go/issues/40909) (net/http の変更) があったため、環境変数`$HTTP_PROXY`を使った HTTP プロキシーの設定は、TLS (`https://`) 接続においては用いられなくなりました。
> `https://` URL によるリクエストを扱う際には、環境変数`$HTTPS_PROXY`の設定も必要になることを忘れないでください。
>
> [HTTP/HTTPS プロキシーの節](../../config/daemon/systemd.md#httphttps-proxy) を参照して、プロキシーサーバーを利用する場合の Docker デーモンの設定方法を確認してください。
{: .important }
@z

@x
## Client
@y
{: #client }
## クライアント
@z

@x
- [CVE-2021-41092](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41092)
  Ensure default auth config has address field set, to prevent credentials being
  sent to the default registry.
@y
- [CVE-2021-41092](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41092)
  デフォルトの auth 設定ファイルに、アドレス項目を持つようにしました。
  これにより、資格情報がデフォルトのレジストリに送信されないようにしました。
@z

@x
## Runtime
@y
{: #runtime }
## ランタイム
@z

@x
- [CVE-2021-41089](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41089)
  Create parent directories inside a chroot during `docker cp` to prevent a specially
  crafted container from changing permissions of existing files in the host’s filesystem.
- [CVE-2021-41091](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41091)
  Lock down file permissions to prevent unprivileged users from discovering and
  executing programs in `/var/lib/docker`.
@y
- [CVE-2021-41089](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41089)
  `docker cp`の処理時に chroot 内で親ディレクトリを生成するようにしました。
  これにより、特別に作成されたコンテナーが、ホストのファイルシステムにおける既存ファイルのパーミッションを変更してしまわないようにしました。
- [CVE-2021-41091](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41091)
  ファイルパーミッションを下げることによって、非特権ユーザーにより、`/var/lib/docker`内を検索したり、プログラム実行ができることがないようにしました。
@z

@x
## Packaging
@y
{: #packaging }
## パッケージ
@z

@x
> **Known issue**
>
> The `ctr` binary shipping with the static packages of this release is not
> statically linked, and will not run in Docker images using alpine as a base
> image. Users can install the `libc6-compat` package, or download a previous
> version of the `ctr` binary as a workaround. Refer to the containerd ticket
> related to this issue for more details: [containerd/containerd#5824](https://github.com/containerd/containerd/issues/5824).
@y
> **既知の問題**
>
> 当リリースの static パッケージに含まれる`ctr`バイナリは、スタティックリンクが行われていません。
> したがって alpine をベースイメージとする DOcker イメージでは、実行することができません。
> これを解消するためには、`libc6-compat`パッケージをインストールするか、`ctr`バイナリの一つ前のバージョンを利用するようにしてください。
> 詳しくは、この問題に関連する containerd のチケット [containerd/containerd#5824](https://github.com/containerd/containerd/issues/5824) を参照してください。
@z

@x
- Update Golang runtime to Go 1.16.8, which contains fixes for [CVE-2021-36221](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-36221)
  and [CVE-2021-39293](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39293)
- Update static binaries and containerd.io rpm and deb packages to containerd
  v1.4.11 and runc v1.0.2 to address [CVE-2021-41103](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41103).
- Update the bundled buildx version to v0.6.3 for rpm and deb packages.
@y
- Go 言語のランタイムを Go 1.16.8 に更新しました。
  これには [CVE-2021-36221](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-36221) と [CVE-2021-39293](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39293) への対応が含まれています。
- rpm と deb パッケージにおけるスタティックライブラリを containerd v1.4.11 と runc v1.0.2 に更新しました。
  [CVE-2021-41103](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-41103)
- rpm と deb パッケージにバンドルする buildx バージョンを v0.6.3 に更新しました。
@z

@x
## 20.10.8
2021-08-03
@y
## 20.10.8
2021-08-03
@z

@x
> **IMPORTANT**
>
> Due to [net/http changes](https://github.com/golang/go/issues/40909) in [Go 1.16](https://golang.org/doc/go1.16#net/http),
> HTTP proxies configured through the `$HTTP_PROXY` environment variable are no
> longer used for TLS (`https://`) connections. Make sure you also set an `$HTTPS_PROXY`
> environment variable for handling requests to `https://` URLs.
>
> Refer to the [HTTP/HTTPS proxy section](../../config/daemon/systemd.md#httphttps-proxy)
> to learn how to configure the Docker Daemon to use a proxy server.
{: .important }
@y
> **重要**
>
> [Go 1.16](https://golang.org/doc/go1.16#net/http) において [net/http changes](https://github.com/golang/go/issues/40909) (net/http の変更) があったため、環境変数`$HTTP_PROXY`を使った HTTP プロキシーの設定は、TLS (`https://`) 接続においては用いられなくなりました。
> `https://` URL によるリクエストを扱う際には、環境変数`$HTTPS_PROXY`の設定も必要になることを忘れないでください。
>
> [HTTP/HTTPS プロキシーの節](../../config/daemon/systemd.md#httphttps-proxy) を参照して、プロキシーサーバーを利用する場合の Docker デーモンの設定方法を確認してください。
{: .important }
@z

@x
### Deprecation
@y
{: #deprecation }
### 廃止決定
@z

@x
- Deprecate support for encrypted TLS private keys. Legacy PEM encryption as
  specified in RFC 1423 is insecure by design. Because it does not authenticate
  the ciphertext, it is vulnerable to padding oracle attacks that can let an
  attacker recover the plaintext. Support for encrypted TLS private keys is now
  marked as deprecated, and will be removed in an upcoming release. [docker/cli#3219](https://github.com/docker/cli/pull/3219)
- Deprecate Kubernetes stack support. Following the deprecation of [Compose on Kubernetes](https://github.com/docker/compose-on-kubernetes),
  support for Kubernetes in the `stack` and `context` commands in the Docker CLI
  is now marked as deprecated, and will be removed in an upcoming release [docker/cli#3174](https://github.com/docker/cli/pull/3174).
@y
- 暗号化 TLS の秘密鍵に対するサポートは廃止決定しました。
  RFC 1423 において規定されている従来の PEM 暗号化は、設計の段階で安全でないものです。
  これは暗号文を認証しないため、攻撃者が平文を解読可能となる padding oracle 攻撃に対してぜい弱です。
  暗号化 TLS の秘密鍵に対するサポートは、現在、廃止決定 (deprecated) とされ、今後のリリースにおいて削除される予定です。
  [docker/cli#3219](https://github.com/docker/cli/pull/3219)
- Kubernetes のスタックサポートを廃止決定しました。
  Docker CLI の`stack`と`context`のコマンドにおける Kubernetes サポートは、[Compose on Kubernetes](https://github.com/docker/compose-on-kubernetes) が廃止決定されたことに対応して、廃止決定 (deprecated) とされ、今後のリリースにおいて削除される予定です。
  [docker/cli#3174](https://github.com/docker/cli/pull/3174)
@z

@x
### Client
@y
{: #client }
### クライアント
@z

@x
- Fix `Invalid standard handle identifier` errors on Windows [docker/cli#3132](https://github.com/docker/cli/pull/3132).
@y
- Windows における`Invalid standard handle identifier`エラーを修正しました。
  [docker/cli#3132](https://github.com/docker/cli/pull/3132)
@z

@x
### Rootless
@y
### Rootless
@z

@x
- Avoid `can't open lock file /run/xtables.lock: Permission denied` error on
  SELinux hosts [moby/moby#42462](https://github.com/moby/moby/pull/42462).
- Disable overlay2 when running with SELinux to prevent permission denied errors [moby/moby#42462](https://github.com/moby/moby/pull/42462).
- Fix `x509: certificate signed by unknown authority` error on openSUSE Tumbleweed [moby/moby#42462](https://github.com/moby/moby/pull/42462).
@y
- SELinux ホストにおける`can't open lock file /run/xtables.lock: Permission denied`エラーを回避するようにしました。
  [moby/moby#42462](https://github.com/moby/moby/pull/42462)
- SELinux の動作中は、パーミッション拒否のエラーを防ぐために overlay2 を無効にしました。
  [moby/moby#42462](https://github.com/moby/moby/pull/42462)
- openSUSE Tumbleweed における`x509: certificate signed by unknown authority`エラーを修正しました。
  [moby/moby#42462](https://github.com/moby/moby/pull/42462)
@z

@x
### Runtime
@y
{: #runtime }
### ランタイム
@z

@x
- Print a warning when using the `--platform` option to pull a single-arch image
  that does not match the specified architecture [moby/moby#42633](https://github.com/moby/moby/pull/42633).
- Fix incorrect `Your kernel does not support swap memory limit` warning when
  running with cgroups v2 [moby/moby#42479](https://github.com/moby/moby/pull/42479).
- Windows: Fix a situation where containers were not stopped if `HcsShutdownComputeSystem`
  returned an `ERROR_PROC_NOT_FOUND` error [moby/moby#42613](https://github.com/moby/moby/pull/42613) 
@y
- シングルアーキテクチャーイメージに対して`--platform`オプションを利用する際に、指定のアーキテクチャーに一致しない場合には、警告を表示するようにしました。
  [moby/moby#42633](https://github.com/moby/moby/pull/42633)
- cgroups v2 の利用時に、`Your kernel does not support swap memory limit`という誤った警告表示を修正しました。
  [moby/moby#42479](https://github.com/moby/moby/pull/42479)
- Windows: `HcsShutdownComputeSystem`が`ERROR_PROC_NOT_FOUND`エラーを返した際に、コンテナーが止まっていない状況を修正しました。
  [moby/moby#42613](https://github.com/moby/moby/pull/42613)
@z

@x
### Swarm
@y
### Swarm
@z

@x
- Fix a possibility where overlapping IP addresses could exist as a result of the
  node failing to clean up its old loadbalancer IPs [moby/moby#42538](https://github.com/moby/moby/pull/42538)
- Fix a deadlock in log broker ("dispatcher is stopped") [moby/moby#42537](https://github.com/moby/moby/pull/42537)
@y
- ノードにおいてロードバランサーの古い IP のクリアの失敗が起きることで、IP アドレスがかぶってしまう可能性を修正しました。
  [moby/moby#42538](https://github.com/moby/moby/pull/42538)
- log broker のデッドロックを修正しました ("dispatcher is stopped")。
  [moby/moby#42537](https://github.com/moby/moby/pull/42537)
@z

@x
### Packaging
@y
{: #packaging }
### パッケージ
@z

@x
> **Known issue**
>
> The `ctr` binary shipping with the static packages of this release is not
> statically linked, and will not run in Docker images using alpine as a base
> image. Users can install the `libc6-compat` package, or download a previous
> version of the `ctr` binary as a workaround. Refer to the containerd ticket
> related to this issue for more details: [containerd/containerd#5824](https://github.com/containerd/containerd/issues/5824).
@y
> **既知の問題**
>
> 当リリースの static パッケージに含まれる`ctr`バイナリは、スタティックリンクが行われていません。
> したがって alpine をベースイメージとする DOcker イメージでは、実行することができません。
> これを解消するためには、`libc6-compat`パッケージをインストールするか、`ctr`バイナリの一つ前のバージョンを利用するようにしてください。
> 詳しくは、この問題に関連する containerd のチケット [containerd/containerd#5824](https://github.com/containerd/containerd/issues/5824) を参照してください。
@z

@x
- Remove packaging for Ubuntu 16.04 "Xenial" and Fedora 32, as they reached EOL [docker/docker-ce-packaging#560](https://github.com/docker/docker-ce-packaging/pull/560)
- Update Golang runtime to Go 1.16.6
- Update the bundled buildx version to v0.6.1 for rpm and deb packages [docker/docker-ce-packaging#562](https://github.com/docker/docker-ce-packaging/pull/562)
- Update static binaries and containerd.io rpm and deb packages to containerd v1.4.9 and runc v1.0.1: [docker/containerd-packaging#241](https://github.com/docker/containerd-packaging/pull/241), [docker/containerd-packaging#245](https://github.com/docker/containerd-packaging/pull/245), [docker/containerd-packaging#247](https://github.com/docker/containerd-packaging/pull/247).
@y
- Ubuntu 16.04 "Xenial" と Fedora 32 は EOL になったため、パッケージングからはずしました。
  [docker/docker-ce-packaging#560](https://github.com/docker/docker-ce-packaging/pull/560)
- Go 言語のランタイムを Go 1.16.6 に更新しました。
- rpm と deb パッケージにバンドルする buildx バージョンを v0.6.1 に更新しました。
  [docker/docker-ce-packaging#562](https://github.com/docker/docker-ce-packaging/pull/562)
- rpm と deb パッケージにおけるスタティックライブラリを containerd v1.4.9 と runc v1.0.1 に更新しました。
  [docker/containerd-packaging#241](https://github.com/docker/containerd-packaging/pull/241), [docker/containerd-packaging#245](https://github.com/docker/containerd-packaging/pull/245), [docker/containerd-packaging#247](https://github.com/docker/containerd-packaging/pull/247)
@z

@x
## 20.10.7
2021-06-02
@y
## 20.10.7
2021-06-02
@z

@x
### Client
@y
{: #client }
### クライアント
@z

@x
* Suppress warnings for deprecated cgroups [docker/cli#3099](https://github.com/docker/cli/pull/3099).
* Prevent sending `SIGURG` signals to container on Linux and macOS. The Go runtime
  (starting with Go 1.14) uses `SIGURG` signals internally as an interrupt to
  support preemptable syscalls. In situations where the Docker CLI was attached
  to a container, these interrupts were forwarded to the container. This fix
  changes the Docker CLI to ignore `SIGURG` signals [docker/cli#3107](https://github.com/docker/cli/pull/3107),
  [moby/moby#42421](https://github.com/moby/moby/pull/42421).
@y
* 廃止予定の cgroup に対する警告を除きました。
  [docker/cli#3099](https://github.com/docker/cli/pull/3099) 参照。
* Linux や macOS において、シグナル`SIGURG`がコンテナーに送信されないようにしました。
  Go 言語のランタイム (Go 1.14 以降) では、プリエンプティブなシステムコールのサポートを阻止するものとして、`SIGURG`シグナルが内部的に呼び出されます。
  Docker CLI がコンテナーにアタッチされる状況では、そういった阻止がコンテナーに対して転送されます。
  これによって Docker CLI が`SIGURG`シグナルを無視するような変更につながりました。
  [docker/cli#3107](https://github.com/docker/cli/pull/3107),
  [moby/moby#42421](https://github.com/moby/moby/pull/42421) 参照。
@z

@x
### Builder
@y
### Builder
@z

@x
* Update BuildKit to version v0.8.3-3-g244e8cde [moby/moby#42448](https://github.com/moby/moby/pull/42448):
    * Transform relative mountpoints for exec mounts in the executor to work around
      a breaking change in runc v1.0.0-rc94 and up. [moby/buildkit#2137](https://github.com/moby/buildkit/pull/2137).
    * Add retry on image push 5xx errors. [moby/buildkit#2043](https://github.com/moby/buildkit/pull/2043).
    * Fix build-cache not being invalidated when renaming a file that is copied using
      a `COPY` command with a wildcard. Note that this change invalidates
      existing build caches for copy commands that use a wildcard. [moby/buildkit#2018](https://github.com/moby/buildkit/pull/2018).
    * Fix build-cache not being invalidated when using mounts [moby/buildkit#2076](https://github.com/moby/buildkit/pull/2076).
* Fix build failures when `FROM` image is not cached when using legacy schema 1 images [moby/moby#42382](https://github.com/moby/moby/pull/42382).
@y
* BuildKit をバージョン v0.8.3-3-g244e8cde に更新しました。
  [moby/moby#42448](https://github.com/moby/moby/pull/42448)。
    * Transform relative mountpoints for exec mounts in the executor to work around
      a breaking change in runc v1.0.0-rc94 and up. [moby/buildkit#2137](https://github.com/moby/buildkit/pull/2137).
    * Add retry on image push 5xx errors. [moby/buildkit#2043](https://github.com/moby/buildkit/pull/2043).
    * `COPY`コマンドにワイルドカードをつけてファイル名変更を行った際に、ビルドキャッシュが不正にならないように修正しました。
      この変更によって、そのようなコピーを行った既存のビルドキャッシュは不正なものとなります。
      [moby/buildkit#2018](https://github.com/moby/buildkit/pull/2018)
    * マウントを利用した場合にビルドキャッシュが不正にならないように修正しました。
      [moby/buildkit#2076](https://github.com/moby/buildkit/pull/2076)
* 古いスキーマ 1 イメージを用いていて`FROM`イメージがキャッシュされていない場合に、ビルドに失敗する状況を修正しました。
  [moby/moby#42382](https://github.com/moby/moby/pull/42382)
@z

@x
### Logging
@y
{: #logging }
### ログ処理
@z

@x
* Update the hcsshim SDK to make daemon logs on Windows less verbose [moby/moby#42292](https://github.com/moby/moby/pull/42292).
@y
* Update the hcsshim SDK to make daemon logs on Windows less verbose [moby/moby#42292](https://github.com/moby/moby/pull/42292).
@z

@x
### Rootless
@y
### Rootless
@z

@x
* Fix capabilities not being honored when an image was built on a daemon with
  user-namespaces enabled [moby/moby#42352](https://github.com/moby/moby/pull/42352).
@y
* Fix capabilities not being honored when an image was built on a daemon with
  user-namespaces enabled [moby/moby#42352](https://github.com/moby/moby/pull/42352).
@z

@x
### Networking
@y
{: #networking }
### ネットワーク処理
@z

@x
* Update libnetwork to fix publishing ports on environments with kernel boot
  parameter `ipv6.disable=1`, and to fix a deadlock causing internal DNS lookups
  to fail [moby/moby#42413](https://github.com/moby/moby/pull/42413).
@y
* Update libnetwork to fix publishing ports on environments with kernel boot
  parameter `ipv6.disable=1`, and to fix a deadlock causing internal DNS lookups
  to fail [moby/moby#42413](https://github.com/moby/moby/pull/42413).
@z

@x
### Contrib
@y
### Contrib
@z

@x
* Update rootlesskit to v0.14.2 to fix a timeout when starting the userland proxy
  with the `slirp4netns` port driver [moby/moby#42294](https://github.com/moby/moby/pull/42294).
* Fix "Device or resource busy" errors when running docker-in-docker on a rootless
  daemon [moby/moby#42342](https://github.com/moby/moby/pull/42342).
@y
* Update rootlesskit to v0.14.2 to fix a timeout when starting the userland proxy
  with the `slirp4netns` port driver [moby/moby#42294](https://github.com/moby/moby/pull/42294).
* Fix "Device or resource busy" errors when running docker-in-docker on a rootless
  daemon [moby/moby#42342](https://github.com/moby/moby/pull/42342).
@z

@x
### Packaging
@y
{: #packaging }
### パッケージ
@z

@x
* Update containerd to v1.4.6, runc v1.0.0-rc95 to address [CVE-2021-30465](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-30465)
  [moby/moby#42398](https://github.com/moby/moby/pull/42398), [moby/moby#42395](https://github.com/moby/moby/pull/42395),
  [ocker/containerd-packaging#234](https://github.com/docker/containerd-packaging/pull/234)
* Update containerd to v1.4.5, runc v1.0.0-rc94 [moby/moby#42372](https://github.com/moby/moby/pull/42372),
  [moby/moby#42388](https://github.com/moby/moby/pull/42388), [docker/containerd-packaging#232](https://github.com/docker/containerd-packaging/pull/232).
* Update Docker Scan plugin packages (`docker-scan-plugin`) to v0.8 [docker/docker-ce-packaging#545](https://github.com/docker/docker-ce-packaging/pull/545).
@y
* Update containerd to v1.4.6, runc v1.0.0-rc95 to address [CVE-2021-30465](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-30465)
  [moby/moby#42398](https://github.com/moby/moby/pull/42398), [moby/moby#42395](https://github.com/moby/moby/pull/42395),
  [ocker/containerd-packaging#234](https://github.com/docker/containerd-packaging/pull/234)
* Update containerd to v1.4.5, runc v1.0.0-rc94 [moby/moby#42372](https://github.com/moby/moby/pull/42372),
  [moby/moby#42388](https://github.com/moby/moby/pull/42388), [docker/containerd-packaging#232](https://github.com/docker/containerd-packaging/pull/232).
* Update Docker Scan plugin packages (`docker-scan-plugin`) to v0.8 [docker/docker-ce-packaging#545](https://github.com/docker/docker-ce-packaging/pull/545).
@z

@x
## 20.10.6
2021-04-12
@y
## 20.10.6
2021-04-12
@z

@x
### Client
@y
{: #client }
### クライアント
@z

@x
* Apple Silicon (darwin/arm64) support for Docker CLI [docker/cli#3042](https://github.com/docker/cli/pull/3042)
* config: print deprecation warning when falling back to pre-v1.7.0 config file `~/.dockercfg`. Support for this file will be removed in a future release [docker/cli#3000](https://github.com/docker/cli/pull/3000)
@y
* Docker CLI において Apple Silicon (darwin/arm64) をサポートしました。
  [docker/cli#3042](https://github.com/docker/cli/pull/3042)
* config: pre-v1.7.0 の設定ファイル`~/.dockercfg`になっている場合に、書式が古い旨のメッセージを表示します。
  [docker/cli#3000](https://github.com/docker/cli/pull/3000)
@z

@x
### Builder
@y
### Builder
@z

@x
* Fix classic builder silently ignoring unsupported Dockerfile options and prompt to enable BuildKit instead [moby/moby#42197](https://github.com/moby/moby/pull/42197)
@y
* 古いビルダーが Dockerfile オプションのうちサポートされていないものを、何も表示せずにやり過ごす点を修正し、代わりに BuildKit を有効にする方法を示すことにしました。
  [moby/moby#42197](https://github.com/moby/moby/pull/42197)
@z

@x
### Logging
@y
{: #logging }
### ログ処理
@z

@x
* json-file: fix sporadic unexpected EOF errors [moby/moby#42174](https://github.com/moby/moby/pull/42174)
@y
* json-file: 散発的に発生する unexpected EOF エラーを修正しました。
  [moby/moby#42174](https://github.com/moby/moby/pull/42174)
@z

@x
### Networking
@y
{: #networking }
### ネットワーク処理
@z

@x
* Fix a regression in docker 20.10, causing  IPv6 addresses no longer to be bound by default when mapping ports [moby/moby#42205](https://github.com/moby/moby/pull/42205)
* Fix implicit IPv6 port-mappings not included in API response. Before docker 20.10, published ports were accessible through both IPv4 and IPv6 by default, but the API only included information about the IPv4 (0.0.0.0) mapping [moby/moby#42205](https://github.com/moby/moby/pull/42205)
* Fix a regression in docker 20.10, causing the docker-proxy  to not be terminated in all cases [moby/moby#42205](https://github.com/moby/moby/pull/42205)
* Fix iptables forwarding rules not being cleaned up upon container removal [moby/moby#42205](https://github.com/moby/moby/pull/42205)
@y
* Docker 20.10 における処理後退を修正し、ポートマッピング時に IPv6 アドレスがデフォルトでバインドされなくなるようにしました。
  [moby/moby#42205](https://github.com/moby/moby/pull/42205)
* API レスポンスに含まれない暗黙の IPv6 ポートマッピングを修正しました。
  Docker 20.10 よりも前であれば、公開ポートはデフォルトで IPv4、IPv6 のいずれからでもアクセス可能でした。
  しかし API には IPv4（0.0.0.0）のマッピング情報しか含まれていませんでした。
  [moby/moby#42205](https://github.com/moby/moby/pull/42205)
* Docker 20.10 における処理後退を修正し、あらゆる状況において docker-proxy が停止しないようにしました。
  [moby/moby#42205](https://github.com/moby/moby/pull/42205)
* コンテナー削除に際して iptables のフォワードルールがクリーンアップされない問題を修正しました。
  [moby/moby#42205](https://github.com/moby/moby/pull/42205)
@z

@x
### Packaging
@y
{: #packaging }
### パッケージ
@z

@x
* Update containerd to [v1.4.4](https://github.com/containerd/containerd/releases/tag/v1.4.4) for static binaries. The containerd.io package on apt/yum repos already had this update out of band. Includes a fix for [CVE-2021-21334](https://github.com/containerd/containerd/security/advisories/GHSA-6g2q-w5j3-fwh4). [moby/moby#42124](https://github.com/moby/moby/pull/42124)
* Packages for Debian/Raspbian 11 Bullseye, Ubuntu 21.04 Hirsute Hippo and Fedora 34 [docker/docker-ce-packaging#521](https://github.com/docker/docker-ce-packaging/pull/521) [docker/docker-ce-packaging#522](https://github.com/docker/docker-ce-packaging/pull/522) [docker/docker-ce-packaging#533](https://github.com/docker/docker-ce-packaging/pull/533)
* Provide the [Docker Scan CLI](https://github.com/docker/scan-cli-plugin) plugin on Linux amd64 via a `docker-scan-plugin` package as a recommended dependency for the `docker-ce-cli` package [docker/docker-ce-packaging#537](https://github.com/docker/docker-ce-packaging/pull/537)
* Include VPNKit binary for arm64 [moby/moby#42141](https://github.com/moby/moby/pull/42141)
@y
* 安定版バイナリとして containerd を [v1.4.4](https://github.com/containerd/containerd/releases/tag/v1.4.4) に更新しました。
  containerd.io パッケージの更新版は、これまで apt/yum リポジトリの対象外になっていました。
  [CVE-2021-21334](https://github.com/containerd/containerd/security/advisories/GHSA-6g2q-w5j3-fwh4) に対する修正を含みます。
  [moby/moby#42124](https://github.com/moby/moby/pull/42124)
* Debian/Raspbian 11 Bullseye、Ubuntu 21.04 Hirsute Hippo、Fedora 34 へのパッケージ対応。
  [docker/docker-ce-packaging#521](https://github.com/docker/docker-ce-packaging/pull/521)、
  [docker/docker-ce-packaging#522](https://github.com/docker/docker-ce-packaging/pull/522)、
  [docker/docker-ce-packaging#533](https://github.com/docker/docker-ce-packaging/pull/533)
* Linux amd64 において`docker-ce-cli`の推奨パッケージに`docker-scan-plugin`を加え、これを通じて [Docker スキャン CLI](https://github.com/docker/scan-cli-plugin) プラグインを提供しました。
  [docker/docker-ce-packaging#537](https://github.com/docker/docker-ce-packaging/pull/537)
* arm64 に対して VPNKit バイナリを含めました。
  [moby/moby#42141](https://github.com/moby/moby/pull/42141)
@z

@x
### Plugins
@y
{: #plugins }
### プラグイン
@z

@x
* Fix docker plugin create making plugins that were incompatible with older versions of Docker [moby/moby#42256](https://github.com/moby/moby/pull/42256)
@y
* Docker プラグインから生成されるプラグインが、Docker の旧バージョンと非互換となってしまう問題を修正しました。
  [moby/moby#42256](https://github.com/moby/moby/pull/42256)
@z

@x
### Rootless
@y
### Rootless
@z

@x
* Update RootlessKit to [v0.14.1](https://github.com/rootless-containers/rootlesskit/releases/tag/v0.14.1) (see also [v0.14.0](https://github.com/rootless-containers/rootlesskit/releases/tag/v0.14.0) [v0.13.2](https://github.com/rootless-containers/rootlesskit/releases/tag/v0.13.2)) [moby/moby#42186](https://github.com/moby/moby/pull/42186) [moby/moby#42232](https://github.com/moby/moby/pull/42232)
* dockerd-rootless-setuptool.sh: create CLI context "rootless" [moby/moby#42109](https://github.com/moby/moby/pull/42109)
* dockerd-rootless.sh: prohibit running as root [moby/moby#42072](https://github.com/moby/moby/pull/42072)
* Fix "operation not permitted" when bind mounting existing mounts [moby/moby#42233](https://github.com/moby/moby/pull/42233)
* overlay2: fix "createDirWithOverlayOpaque(...) ... input/output error" [moby/moby#42235](https://github.com/moby/moby/pull/42235)
* overlay2: support "userxattr" option (kernel 5.11) [moby/moby#42168](https://github.com/moby/moby/pull/42168)
* btrfs: allow unprivileged user to delete subvolumes (kernel >= 4.18) [moby/moby#42253](https://github.com/moby/moby/pull/42253)
* cgroup2: Move cgroup v2 out of experimental [moby/moby#42263](https://github.com/moby/moby/pull/42263)
@y
* RootlessKit を [v0.14.1](https://github.com/rootless-containers/rootlesskit/releases/tag/v0.14.1) に更新しました。
  （[v0.14.0](https://github.com/rootless-containers/rootlesskit/releases/tag/v0.14.0)、
  [v0.13.2](https://github.com/rootless-containers/rootlesskit/releases/tag/v0.13.2) も参照してください。)
  [moby/moby#42186](https://github.com/moby/moby/pull/42186)、
  [moby/moby#42232](https://github.com/moby/moby/pull/42232)
* dockerd-rootless-setuptool.sh: CLI コンテキスト「rootless」を生成しました。
  [moby/moby#42109](https://github.com/moby/moby/pull/42109)
* dockerd-rootless.sh: root としての実行を禁止しました。
  [moby/moby#42072](https://github.com/moby/moby/pull/42072)
* 既存のマウントをバインドマウントする際の「operation not permitted」を修正しました。
  [moby/moby#42233](https://github.com/moby/moby/pull/42233)
* overlay2: 「createDirWithOverlayOpaque(...) ... input/output error」を修正しました。
  [moby/moby#42235](https://github.com/moby/moby/pull/42235)
* overlay2: 「userxattr」オプションに対応しました（カーネル 5.11）。
  [moby/moby#42168](https://github.com/moby/moby/pull/42168)
* btrfs: 非特権ユーザーがサブボリュームを削除できるようにしました（カーネル 4.18 以上）。
  [moby/moby#42253](https://github.com/moby/moby/pull/42253)
* cgroup2: cgroup v2 を試験的機能から格上げしました。
  [moby/moby#42263](https://github.com/moby/moby/pull/42263)
@z

@x
## 20.10.5
2021-03-02
@y
## 20.10.5
2021-03-02
@z

@x
### Client
@y
{: #client }
### クライアント
@z

@x
* Revert [docker/cli#2960](https://github.com/docker/cli/pull/2960) to fix hanging in `docker start --attach` and remove spurious `Unsupported signal: <nil>. Discarding` messages. [docker/cli#2987](https://github.com/docker/cli/pull/2987).
@y
* [docker/cli#2960](https://github.com/docker/cli/pull/2960) を元に戻して`docker start --attach`がハングしないようにしました。
  また不適当な`Unsupported signal: <nil>. Discarding`というメッセージを削除しました。
  [docker/cli#2987](https://github.com/docker/cli/pull/2987)
@z

@x
## 20.10.4
2021-02-26
@y
## 20.10.4
2021-02-26
@z

@x
### Builder
@y
### Builder
@z

@x
* Fix incorrect cache match for inline cache import with empty layers [moby/moby#42061](https://github.com/moby/moby/pull/42061)
* Update BuildKit to v0.8.2 [moby/moby#42061](https://github.com/moby/moby/pull/42061)
  * resolver: avoid error caching on token fetch
  * fileop: fix checksum to contain indexes of inputs preventing certain cache misses
  * Fix reference count issues on typed errors with mount references (fixing `invalid mutable ref` errors)
  * git: set token only for main remote access allowing cloning submodules with different credentials
* Ensure blobs get deleted in /var/lib/docker/buildkit/content/blobs/sha256 after pull. To clean up old state run `builder prune` [moby/moby#42065](https://github.com/moby/moby/pull/42065)
* Fix parallel pull synchronization regression [moby/moby#42049](https://github.com/moby/moby/pull/42049)
* Ensure libnetwork state files do not leak [moby/moby#41972](https://github.com/moby/moby/pull/41972)
@y
* 空のレイヤーがあるインラインキャッシュのインポートにおいて、間違ったキャッシュがマッチしてしまう誤りを修正しました。
  [moby/moby#42061](https://github.com/moby/moby/pull/42061)
* BuildKit v0.8.2 へのアップデート。[moby/moby#42061](https://github.com/moby/moby/pull/42061)
  * resolver: トークンフェッチ時のキャッシング不備を回避しました。
  * fileop: 入力インデックスがキャッシュ不備を起こさないようにチェックサムを修正しました。
  * マウント参照に関して出力される参照数の出力不備を修正しました。
    （`invalid mutable ref`のエラーを修正しました。）
  * git: 異なる資格情報を使ってサブモジュールのクローンが可能となるように、メインのリモートアクセスについてのみトークンを設定するようにしました。
* プル処理を行った後に /var/lib/docker/buildkit/content/blobs/sha256 にある blob データが確実に削除されるようにしました。
  古い状態を更新するには`builder prune`を実行します。
  [moby/moby#42065](https://github.com/moby/moby/pull/42065)
* 同時並行で行ったプル処理の同期に関して、機能退化を修正しました。」
  [moby/moby#42049](https://github.com/moby/moby/pull/42049)
* libnetwork の状態ファイルの扱いが漏れのないようにしました。
  [moby/moby#41972](https://github.com/moby/moby/pull/41972)
@z

@x
### Client
@y
{: #client }
### クライアント
@z

@x
* Fix a panic on `docker login` if no config file is present [docker/cli#2959](https://github.com/docker/cli/pull/2959)
* Fix `WARNING: Error loading config file: .dockercfg: $HOME is not defined` [docker/cli#2958](https://github.com/docker/cli/pull/2958)
@y
* config ファイル不在時に`docker login`が panic となるのを修正しました。
  [docker/cli#2959](https://github.com/docker/cli/pull/2959)
* `WARNING: Error loading config file: .dockercfg: $HOME is not defined`を修正しました。
  [docker/cli#2958](https://github.com/docker/cli/pull/2958)
@z

@x
### Runtime
@y
{: #runtime }
### ランタイム
@z

@x
* docker info: silence unhandleable warnings [moby/moby#41958](https://github.com/moby/moby/pull/41958)
* Avoid creating parent directories for XGlobalHeader [moby/moby#42017](https://github.com/moby/moby/pull/42017)
* Use 0755 permissions when creating missing directories [moby/moby#42017](https://github.com/moby/moby/pull/42017)
* Fallback to manifest list when no platform matches in image config [moby/moby#42045](https://github.com/moby/moby/pull/42045) [moby/moby#41873](https://github.com/moby/moby/pull/41873)
* Fix a daemon panic on setups with a custom default runtime configured [moby/moby#41974](https://github.com/moby/moby/pull/41974)
* Fix a panic when daemon configuration is empty [moby/moby#41976](https://github.com/moby/moby/pull/41976)
* Fix daemon panic when starting container with invalid device cgroup rule [moby/moby#42001](https://github.com/moby/moby/pull/42001)
* Fix userns-remap option when username & UID match [moby/moby#42013](https://github.com/moby/moby/pull/42013)
* static: update runc binary to v1.0.0-rc93 [moby/moby#42014](https://github.com/moby/moby/pull/42014)
@y
* docker info: 対処不要の警告メッセージを除きました。
  [moby/moby#41958](https://github.com/moby/moby/pull/41958)
* XGlobalHeader において親ディレクトリ生成を回避しました。
  [moby/moby#42017](https://github.com/moby/moby/pull/42017)
* 存在しないディレクトリの生成時にはパーミッション 0755 を利用するようにしました。
  [moby/moby#42017](https://github.com/moby/moby/pull/42017)
* イメージ設定内のプラットフォームが不適切である場合には、改めてマニフェストリストを見るようにしました。
  [moby/moby#42045](https://github.com/moby/moby/pull/42045) [moby/moby#41873](https://github.com/moby/moby/pull/41873)
* カスタムのデフォルトランタイムを設定した際のデーモンパニック発生を修正しました。
  [moby/moby#41974](https://github.com/moby/moby/pull/41974)
* デーモン設定が空であるときのパニック発生を修正しました。
  [moby/moby#41976](https://github.com/moby/moby/pull/41976)
* 不正な device cgroup rule によりコンテナー起動した際に発生するデーモンパニックを修正しました。
  [moby/moby#42001](https://github.com/moby/moby/pull/42001)
* ユーザー名あるいは UID がマッチしたときの userns-remap オプションを修正しました。
  [moby/moby#42013](https://github.com/moby/moby/pull/42013)
* static: runc バイナリを v1.0.0-rc93 に更新しました。
  [moby/moby#42014](https://github.com/moby/moby/pull/42014)
@z

@x
### Logger
@y
{: #logger }
### ログ処理
@z

@x
* Honor `labels-regex` config even if `labels` is not set [moby/moby#42046](https://github.com/moby/moby/pull/42046)
* Handle long log messages correctly preventing awslogs in non-blocking mode to split events bigger than 16kB [mobymoby#41975](https://github.com/moby/moby/pull/41975)
@y
* `labels`が設定されていなくても`labels-regex`の設定を用いることにしました。
  [moby/moby#42046](https://github.com/moby/moby/pull/42046)
* 長いログメッセージを適切に扱うようにしました。
  これにより non-blocking モードの awslogs において 16 KB 以上のイベントログが分割されないようにしました。
  [mobymoby#41975](https://github.com/moby/moby/pull/41975)
@z

@x
### Rootless
@y
### Rootless
@z

@x
* Prevent the service hanging when stopping by setting systemd KillMode to mixed [moby/moby#41956](https://github.com/moby/moby/pull/41956)
* dockerd-rootless.sh: add typo guard [moby/moby#42070](https://github.com/moby/moby/pull/42070)
* Update rootlesskit to v0.13.1 to fix handling of IPv6 addresses [moby/moby#42025](https://github.com/moby/moby/pull/42025)
* allow mknodding FIFO inside userns [moby/moby#41957](https://github.com/moby/moby/pull/41957)
@y
* systemd の KillMode を mixed に設定することで、サービスが停止する際にハングしないようにしました。
  [moby/moby#41956](https://github.com/moby/moby/pull/41956)
* dockerd-rootless.sh: タイポ確認を行うようにしました。
  [moby/moby#42070](https://github.com/moby/moby/pull/42070)
* rootlesskit を v0.13.1 に更新し IPv6 アドレスの扱いを修正しました。
  [moby/moby#42025](https://github.com/moby/moby/pull/42025)
* ユーザー空間内部において FIFO の mknod を可能にしました。
  [moby/moby#41957](https://github.com/moby/moby/pull/41957)
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
* profiles: seccomp: update to Linux 5.11 syscall list [moby/moby#41971](https://github.com/moby/moby/pull/41971)
@y
* profiles: seccomp: syscall リストを Linux 5.11 に更新しました。
  [moby/moby#41971](https://github.com/moby/moby/pull/41971)
@z

@x
### Swarm
@y
### Swarm
@z

@x
* Fix issue with heartbeat not persisting upon restart [moby/moby#42060](https://github.com/moby/moby/pull/42060)
* Fix potential stalled tasks [moby/moby#42060](https://github.com/moby/moby/pull/42060)
* Fix `--update-order` and `--rollback-order` flags when only `--update-order` or `--rollback-order` is provided [docker/cli#2963](https://github.com/docker/cli/pull/2963)
* Fix `docker service rollback` returning a non-zero exit code in some situations [docker/cli#2964](https://github.com/docker/cli/pull/2964)
* Fix inconsistent progress-bar direction on `docker service rollback` [docker/cli#2964](https://github.com/docker/cli/pull/2964)
@y
* 再起動時にハートビートが維持されない問題を修正しました。
  [moby/moby#42060](https://github.com/moby/moby/pull/42060)
* タスクが停止してしまう可能性を修正しました。
  [moby/moby#42060](https://github.com/moby/moby/pull/42060)
* Fix `--update-order` and `--rollback-order` flags when only `--update-order` or `--rollback-order` is provided
  [docker/cli#2963](https://github.com/docker/cli/pull/2963)
* Fix `docker service rollback` returning a non-zero exit code in some situations
  [docker/cli#2964](https://github.com/docker/cli/pull/2964)
* Fix inconsistent progress-bar direction on `docker service rollback`
  [docker/cli#2964](https://github.com/docker/cli/pull/2964)
@z

@x
## 20.10.3
2021-02-01
@y
## 20.10.3
2021-02-01
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
* [CVE-2021-21285](https://github.com/moby/moby/security/advisories/GHSA-6fj5-m822-rqx8) Prevent an invalid image from crashing docker daemon
* [CVE-2021-21284](https://github.com/moby/moby/security/advisories/GHSA-7452-xqpj-6rpc) Lock down file permissions to prevent remapped root from accessing docker state
* Ensure AppArmor and SELinux profiles are applied when building with BuildKit
@y
* [CVE-2021-21285](https://github.com/moby/moby/security/advisories/GHSA-6fj5-m822-rqx8)
  Docker デーモンがクラッシュしても不正なイメージとならないようにしました。
* [CVE-2021-21284](https://github.com/moby/moby/security/advisories/GHSA-7452-xqpj-6rpc)
  ファイルパーミッションを落とすことで、再マップされたルートが Docker 状態にアクセスできないようにしました。
* BuildKit 利用によるビルド時に AppArmor や SELinux プロファイルが必ず適用されるようにしました。
@z

@x
### Client
@y
{: #client }
### クライアント
@z

@x
* Check contexts before importing them to reduce risk of extracted files escaping context store
* Windows: prevent executing certain binaries from current directory [docker/cli#2950](https://github.com/docker/cli/pull/2950)
@y
* インポート前にコンテキストをチェックするようにし、抽出（解凍）されたファイルがコンテキスト外に保存されるリスクを軽減しました。
* Windows: カレントディレクトリからバイナリが実行されないようにしました。
  [docker/cli#2950](https://github.com/docker/cli/pull/2950)
@z

@x
## 20.10.2
2021-01-04
@y
## 20.10.2
2021-01-04
@z

@x
### Runtime
@y
{: #runtime }
### ランタイム
@z

@x
- Fix a daemon start up hang when restoring containers with restart policies but that keep failing to start [moby/moby#41729](https://github.com/moby/moby/pull/41729)
- overlay2: fix an off-by-one error preventing to build or run containers when data-root is 24-bytes long [moby/moby#41830](https://github.com/moby/moby/pull/41830)
- systemd: send `sd_notify STOPPING=1` when shutting down [moby/moby#41832](https://github.com/moby/moby/pull/41832)
@y
- 再起動ポリシーに従ってコンテナーを復元する際に再起動の失敗が続き、デーモン起動がハングする状態を修正。
  [moby/moby#41729](https://github.com/moby/moby/pull/41729)
- overlay2: data-root が 24 バイト長のときにコンテナーのビルドおよび実行ができなくなるオフバイワン（off-by-one）エラーを修正。
  [moby/moby#41830](https://github.com/moby/moby/pull/41830)
- systemd: シャットダウン時に`sd_notify STOPPING=1`を送信するように。
  [moby/moby#41832](https://github.com/moby/moby/pull/41832)
@z

@x
### Networking
@y
{: #networking }
### ネットワーク処理
@z

@x
- Fix IPv6 port forwarding [moby/moby#41805](https://github.com/moby/moby/pull/41805) [moby/libnetwork#2604](https://github.com/moby/libnetwork/pull/2604)
@y
- IPv6 ポートフォワーディングを修正。
  [moby/moby#41805](https://github.com/moby/moby/pull/41805)
  [moby/libnetwork#2604](https://github.com/moby/libnetwork/pull/2604)
@z

@x
### Swarm
@y
### Swarm
@z

@x
- Fix filtering for `replicated-job` and `global-job` service modes [moby/moby#41806](https://github.com/moby/moby/pull/41806)
@y
- `replicated-job`と`global-job`のサービスモードに対するフィルタリングを修正。
  [moby/moby#41806](https://github.com/moby/moby/pull/41806)
@z

@x
### Packaging
@y
{: #packaging }
### パッケージ
@z

@x
- buildx updated to [v0.5.1](https://github.com/docker/buildx/releases/tag/v0.5.1) [docker/docker-ce-packaging#516](https://github.com/docker/docker-ce-packaging/pull/516)
@y
- buildx を [v0.5.1](https://github.com/docker/buildx/releases/tag/v0.5.1) にアップデート。
  [docker/docker-ce-packaging#516](https://github.com/docker/docker-ce-packaging/pull/516)
@z

@x
## 20.10.1
2020-12-14
@y
## 20.10.1
2020-12-14
@z

@x
### Builder
@y
### Builder
@z

@x
- buildkit: updated to [v0.8.1](https://github.com/moby/buildkit/releases/tag/v0.8.1) with various bugfixes [moby/moby#41793](https://github.com/moby/moby/pull/41793)
@y
- buildkit: [v0.8.1](https://github.com/moby/buildkit/releases/tag/v0.8.1) へのアップデート。
  多くのバグフィックス。
  [moby/moby#41793](https://github.com/moby/moby/pull/41793)
@z

@x
### Packaging
@y
{: #packaging }
### パッケージ
@z

@x
- Revert a change in the systemd unit that could prevent docker from starting due to a startup order conflict [docker/docker-ce-packaging#514](https://github.com/docker/docker-ce-packaging/pull/514)
- buildx updated to [v0.5.0](https://github.com/docker/buildx/releases/tag/v0.5.0) [docker/docker-ce-packaging#515](https://github.com/docker/docker-ce-packaging/pull/515)
@y
- 起動順の衝突により Docker が起動できなくなる systemd ユニットへの変更を元に戻す。
  [docker/docker-ce-packaging#514](https://github.com/docker/docker-ce-packaging/pull/514)
- buildx を [v0.5.0](https://github.com/docker/buildx/releases/tag/v0.5.0) にアップデート。
  [docker/docker-ce-packaging#515](https://github.com/docker/docker-ce-packaging/pull/515)
@z

@x
## 20.10.0
2020-12-08
@y
## 20.10.0
2020-12-08
@z

@x
### Deprecation / Removal
@y
{: #deprecation--removal }
### 廃止決定、削除
@z

@x
For an overview of all deprecated features, refer to the [Deprecated Engine Features](/engine/deprecated/) page.
@y
廃止決定した機能の概要は [廃止となった Engine 機能]({{ site.baseurl }}/engine/deprecated/) のページを参照してください。
@z

@x
- Warnings and deprecation notice when `docker pull`-ing from non-compliant registries not supporting pull-by-digest [docker/cli#2872](https://github.com/docker/cli/pull/2872)
- Sterner warnings and deprecation notice for unauthenticated tcp access [moby/moby#41285](https://github.com/moby/moby/pull/41285)
- Deprecate KernelMemory (`docker run --kernel-memory`) [moby/moby#41254](https://github.com/moby/moby/pull/41254) [docker/cli#2652](https://github.com/docker/cli/pull/2652)
- Deprecate `aufs` storage driver [docker/cli#1484](https://github.com/docker/cli/pull/1484)
- Deprecate host-discovery and overlay networks with external k/v stores [moby/moby#40614](https://github.com/moby/moby/pull/40614) [moby/moby#40510](https://github.com/moby/moby/pull/40510)
- Deprecate Dockerfile legacy 'ENV name value' syntax, use `ENV name=value` instead [docker/cli#2743](https://github.com/docker/cli/pull/2743)
- Remove deprecated "filter" parameter for API v1.41 and up [moby/moby#40491](https://github.com/moby/moby/pull/40491)
- Disable distribution manifest v2 schema 1 on push [moby/moby#41295](https://github.com/moby/moby/pull/41295)
- Remove hack MalformedHostHeaderOverride breaking old docker clients (<= 1.12) in which case, set `DOCKER_API_VERSION` [moby/moby#39076](https://github.com/moby/moby/pull/39076)
- Remove "docker engine" subcommands [docker/cli#2207](https://github.com/docker/cli/pull/2207)
- Remove experimental "deploy" from "dab" files [docker/cli#2216](https://github.com/docker/cli/pull/2216)
- Remove deprecated `docker search --automated` and `--stars` flags [docker/cli#2338](https://github.com/docker/cli/pull/2338)
- No longer allow reserved namespaces in engine labels [docker/cli#2326](https://github.com/docker/cli/pull/2326)
@y
- ダイジェスト値によるプルをサポートしていない非準拠 レジストリから`docker pull`を行った際の警告および廃止機能に関するメッセージ。
  [docker/cli#2872](https://github.com/docker/cli/pull/2872)
- Sterner warnings and deprecation notice for unauthenticated tcp access
  [moby/moby#41285](https://github.com/moby/moby/pull/41285)
- KernelMemory の廃止決定。
  （`docker run --kernel-memory`）
  [moby/moby#41254](https://github.com/moby/moby/pull/41254)
  [docker/cli#2652](https://github.com/docker/cli/pull/2652)
- `aufs`ストレージドライバーの廃止決定。
  [docker/cli#1484](https://github.com/docker/cli/pull/1484)
- 外部キーバリューストアを利用したホスト検出とオーバーレイネットワークの廃止決定。
  [moby/moby#40614](https://github.com/moby/moby/pull/40614)
  [moby/moby#40510](https://github.com/moby/moby/pull/40510)
- Dockerfile における古い文法「ENV name value」の廃止決定。
  代わりに`ENV name=value`とする。
  [docker/cli#2743](https://github.com/docker/cli/pull/2743)
- API v1.41 またはそれ以上において、廃止決定の「filter」パラメーターを削除。
  [moby/moby#40491](https://github.com/moby/moby/pull/40491)
- Disable distribution manifest v2 schema 1 on push
  [moby/moby#41295](https://github.com/moby/moby/pull/41295)
- Remove hack MalformedHostHeaderOverride breaking old docker clients (<= 1.12) in which case, set `DOCKER_API_VERSION`
  [moby/moby#39076](https://github.com/moby/moby/pull/39076)
- サブコマンド「docker engine」を削除。
  [docker/cli#2207](https://github.com/docker/cli/pull/2207)
- 「dab」ファイルから試験的な「deploy」を削除。
  [docker/cli#2216](https://github.com/docker/cli/pull/2216)
- 廃止決定した`docker search --automated`と`--stars`フラグを削除。
  [docker/cli#2338](https://github.com/docker/cli/pull/2338)
- No longer allow reserved namespaces in engine labels
  [docker/cli#2326](https://github.com/docker/cli/pull/2326)
@z

@x
### API
@y
### API
@z

@x
- Update API version to v1.41
- Do not require "experimental" for metrics API [moby/moby#40427](https://github.com/moby/moby/pull/40427)
- `GET /events` now returns `prune` events after pruning resources have completed [moby/moby#41259](https://github.com/moby/moby/pull/41259)
  - Prune events are returned for `container`, `network`, `volume`, `image`, and `builder`, and have a `reclaimed` attribute, indicating the amount of space reclaimed (in bytes)
- Add `one-shot` stats option to not prime the stats [moby/moby#40478](https://github.com/moby/moby/pull/40478)
- Adding OS version info to the system info's API (`/info`) [moby/moby#38349](https://github.com/moby/moby/pull/38349)
- Add DefaultAddressPools to docker info [moby/moby#40714](https://github.com/moby/moby/pull/40714)
- Add API support for PidsLimit on services [moby/moby#39882](https://github.com/moby/moby/pull/39882)
@y
- API バージョンの v1.41 へのアップデート。
- メトリックス API に対して「試験的」は不要。
  [moby/moby#40427](https://github.com/moby/moby/pull/40427)
- `GET /events` now returns `prune` events after pruning resources have completed [moby/moby#41259](https://github.com/moby/moby/pull/41259)
  - Prune events are returned for `container`, `network`, `volume`, `image`, and `builder`, and have a `reclaimed` attribute, indicating the amount of space reclaimed (in bytes)
- Add `one-shot` stats option to not prime the stats
  [moby/moby#40478](https://github.com/moby/moby/pull/40478)
- info API（`/info`）に OS バージョンを追加。
  [moby/moby#38349](https://github.com/moby/moby/pull/38349)
- docker info に DefaultAddressPools を追加。
  [moby/moby#40714](https://github.com/moby/moby/pull/40714)
- サービス上に PidsLimit に対する API サポートを追加。
  [moby/moby#39882](https://github.com/moby/moby/pull/39882)
@z

@x
### Builder
@y
### Builder
@z

@x
- buildkit,dockerfile: Support for `RUN --mount` options without needing to specify experimental dockerfile `#syntax` directive. [moby/buildkit#1717](https://github.com/moby/buildkit/pull/1717)
- dockerfile: `ARG` command now supports defining multiple build args on the same line similarly to `ENV` [moby/buildkit#1692](https://github.com/moby/buildkit/pull/1692)
- dockerfile: `--chown` flag in `ADD` now allows parameter expansion [moby/buildkit#1473](https://github.com/moby/buildkit/pull/1473)
- buildkit: Fetching authorization tokens has been moved to client-side (if the client supports it). Passwords do not leak into the build daemon anymore and users can see from build output when credentials or tokens are accessed. [moby/buildkit#1660](https://github.com/moby/buildkit/pull/1660)
- buildkit: Connection errors while communicating with the registry for push and pull now trigger a retry [moby/buildkit#1791](https://github.com/moby/buildkit/pull/1791)
- buildkit: Git source now supports token authentication via build secrets [moby/moby#41234](https://github.com/moby/moby/pull/41234) [docker/cli#2656](https://github.com/docker/cli/pull/2656) [moby/buildkit#1533](https://github.com/moby/buildkit/pull/1533)
- buildkit: Building from git source now supports forwarding SSH socket for authentication [moby/buildkit#1782](https://github.com/moby/buildkit/pull/1782)
- buildkit: Avoid builds that generate excessive logs to cause a crash or slow down the build. Clipping is performed if needed. [moby/buildkit#1754](https://github.com/moby/buildkit/pull/1754)
- buildkit: Change default Seccomp profile to the one provided by Docker [moby/buildkit#1807](https://github.com/moby/buildkit/pull/1807)
- buildkit: Support for exposing SSH agent socket on Windows has been improved [moby/buildkit#1695](https://github.com/moby/buildkit/pull/1695)
- buildkit: Disable truncating by default when using --progress=plain [moby/buildkit#1435](https://github.com/moby/buildkit/pull/1435)
- buildkit: Allow better handling client sessions dropping while it is being shared by multiple builds [moby/buildkit#1551](https://github.com/moby/buildkit/pull/1551)
- buildkit: secrets: allow providing secrets with env [moby/moby#41234](https://github.com/moby/moby/pull/41234) [docker/cli#2656](https://github.com/docker/cli/pull/2656) [moby/buildkit#1534](https://github.com/moby/buildkit/pull/1534)
  - Support `--secret id=foo,env=MY_ENV` as an alternative for storing a secret value to a file.
  - `--secret id=GIT_AUTH_TOKEN` will load env if it exists and the file does not.
- buildkit: Support for mirrors fallbacks, insecure TLS and custom TLS config [moby/moby#40814](https://github.com/moby/moby/pull/40814)
- buildkit: remotecache: Only visit each item once when walking results [moby/moby#41234](https://github.com/moby/moby/pull/41234) [moby/buildkit#1577](https://github.com/moby/buildkit/pull/1577)
  - Improves performance and CPU use on bigger graphs
- buildkit: Check remote when local image platform doesn't match [moby/moby#40629](https://github.com/moby/moby/pull/40629)
- buildkit: image export: Use correct media type when creating new layer blobs [moby/moby#41234](https://github.com/moby/moby/pull/41234) [moby/buildkit#1541](https://github.com/moby/buildkit/pull/1541)
- buildkit: progressui: fix logs time formatting [moby/moby#41234](https://github.com/moby/moby/pull/41234) [docker/cli#2656](https://github.com/docker/cli/pull/2656) [moby/buildkit#1549](https://github.com/moby/buildkit/pull/1549)
- buildkit: mitigate containerd issue on parallel push [moby/moby#41234](https://github.com/moby/moby/pull/41234) [moby/buildkit#1548](https://github.com/moby/buildkit/pull/1548)
- buildkit: inline cache: fix handling of duplicate blobs [moby/moby#41234](https://github.com/moby/moby/pull/41234) [moby/buildkit#1568](https://github.com/moby/buildkit/pull/1568)
  - Fixes https://github.com/moby/buildkit/issues/1388 cache-from working unreliably
  - Fixes https://github.com/moby/moby/issues/41219 Image built from cached layers is missing data
- Allow ssh:// for remote context URLs [moby/moby#40179](https://github.com/moby/moby/pull/40179)
- builder: remove legacy build's session handling (was experimental) [moby/moby#39983](https://github.com/moby/moby/pull/39983)
@y
- buildkit,dockerfile: Support for `RUN --mount` options without needing to specify experimental dockerfile `#syntax` directive. [moby/buildkit#1717](https://github.com/moby/buildkit/pull/1717)
- dockerfile: `ARG` command now supports defining multiple build args on the same line similarly to `ENV` [moby/buildkit#1692](https://github.com/moby/buildkit/pull/1692)
- dockerfile: `--chown` flag in `ADD` now allows parameter expansion [moby/buildkit#1473](https://github.com/moby/buildkit/pull/1473)
- buildkit: Fetching authorization tokens has been moved to client-side (if the client supports it). Passwords do not leak into the build daemon anymore and users can see from build output when credentials or tokens are accessed. [moby/buildkit#1660](https://github.com/moby/buildkit/pull/1660)
- buildkit: Connection errors while communicating with the registry for push and pull now trigger a retry [moby/buildkit#1791](https://github.com/moby/buildkit/pull/1791)
- buildkit: Git source now supports token authentication via build secrets [moby/moby#41234](https://github.com/moby/moby/pull/41234) [docker/cli#2656](https://github.com/docker/cli/pull/2656) [moby/buildkit#1533](https://github.com/moby/buildkit/pull/1533)
- buildkit: Building from git source now supports forwarding SSH socket for authentication [moby/buildkit#1782](https://github.com/moby/buildkit/pull/1782)
- buildkit: Avoid builds that generate excessive logs to cause a crash or slow down the build. Clipping is performed if needed. [moby/buildkit#1754](https://github.com/moby/buildkit/pull/1754)
- buildkit: Change default Seccomp profile to the one provided by Docker [moby/buildkit#1807](https://github.com/moby/buildkit/pull/1807)
- buildkit: Support for exposing SSH agent socket on Windows has been improved [moby/buildkit#1695](https://github.com/moby/buildkit/pull/1695)
- buildkit: Disable truncating by default when using --progress=plain [moby/buildkit#1435](https://github.com/moby/buildkit/pull/1435)
- buildkit: Allow better handling client sessions dropping while it is being shared by multiple builds [moby/buildkit#1551](https://github.com/moby/buildkit/pull/1551)
- buildkit: secrets: allow providing secrets with env [moby/moby#41234](https://github.com/moby/moby/pull/41234) [docker/cli#2656](https://github.com/docker/cli/pull/2656) [moby/buildkit#1534](https://github.com/moby/buildkit/pull/1534)
  - Support `--secret id=foo,env=MY_ENV` as an alternative for storing a secret value to a file.
  - `--secret id=GIT_AUTH_TOKEN` will load env if it exists and the file does not.
- buildkit: Support for mirrors fallbacks, insecure TLS and custom TLS config [moby/moby#40814](https://github.com/moby/moby/pull/40814)
- buildkit: remotecache: Only visit each item once when walking results [moby/moby#41234](https://github.com/moby/moby/pull/41234) [moby/buildkit#1577](https://github.com/moby/buildkit/pull/1577)
  - Improves performance and CPU use on bigger graphs
- buildkit: Check remote when local image platform doesn't match [moby/moby#40629](https://github.com/moby/moby/pull/40629)
- buildkit: image export: Use correct media type when creating new layer blobs [moby/moby#41234](https://github.com/moby/moby/pull/41234) [moby/buildkit#1541](https://github.com/moby/buildkit/pull/1541)
- buildkit: progressui: fix logs time formatting [moby/moby#41234](https://github.com/moby/moby/pull/41234) [docker/cli#2656](https://github.com/docker/cli/pull/2656) [moby/buildkit#1549](https://github.com/moby/buildkit/pull/1549)
- buildkit: mitigate containerd issue on parallel push [moby/moby#41234](https://github.com/moby/moby/pull/41234) [moby/buildkit#1548](https://github.com/moby/buildkit/pull/1548)
- buildkit: inline cache: fix handling of duplicate blobs [moby/moby#41234](https://github.com/moby/moby/pull/41234) [moby/buildkit#1568](https://github.com/moby/buildkit/pull/1568)
  - Fixes https://github.com/moby/buildkit/issues/1388 cache-from working unreliably
  - Fixes https://github.com/moby/moby/issues/41219 Image built from cached layers is missing data
- Allow ssh:// for remote context URLs [moby/moby#40179](https://github.com/moby/moby/pull/40179)
- builder: remove legacy build's session handling (was experimental) [moby/moby#39983](https://github.com/moby/moby/pull/39983)
@z

@x
### Client
@y
{: #client }
### クライアント
@z

@x
- Add swarm jobs support to CLI [docker/cli#2262](https://github.com/docker/cli/pull/2262)
- Add `-a/--all-tags` to docker push [docker/cli#2220](https://github.com/docker/cli/pull/2220)
- Add support for Kubernetes username/password auth [docker/cli#2308](https://github.com/docker/cli/pull/2308)
- Add `--pull=missing|always|never` to `run` and `create` commands [docker/cli#1498](https://github.com/docker/cli/pull/1498)
- Add `--env-file` flag to `docker exec` for parsing environment variables from a file [docker/cli#2602](https://github.com/docker/cli/pull/2602)
- Add shorthand `-n` for `--tail` option [docker/cli#2646](https://github.com/docker/cli/pull/2646)
- Add log-driver and options to service inspect "pretty" format [docker/cli#1950](https://github.com/docker/cli/pull/1950)
- docker run: specify cgroup namespace mode with `--cgroupns` [docker/cli#2024](https://github.com/docker/cli/pull/2024)
- `docker manifest rm` command to remove manifest list draft from local storage [docker/cli#2449](https://github.com/docker/cli/pull/2449)
- Add "context" to "docker version" and "docker info" [docker/cli#2500](https://github.com/docker/cli/pull/2500)
- Propagate platform flag to container create API [docker/cli#2551](https://github.com/docker/cli/pull/2551)
- The `docker ps --format` flag now has a `.State` placeholder to print the container's state without additional details about uptime and health check [docker/cli#2000](https://github.com/docker/cli/pull/2000)
- Add support for docker-compose schema v3.9 [docker/cli#2073](https://github.com/docker/cli/pull/2073)
- Add support for docker push `--quiet` [docker/cli#2197](https://github.com/docker/cli/pull/2197)
- Hide flags that are not supported by BuildKit, if BuildKit is enabled [docker/cli#2123](https://github.com/docker/cli/pull/2123)
- Update flag description for `docker rm -v` to clarify the option only removes anonymous (unnamed) volumes [docker/cli#2289](https://github.com/docker/cli/pull/2289)
- Improve tasks printing for docker services [docker/cli#2341](https://github.com/docker/cli/pull/2341)
- docker info: list CLI plugins alphabetically [docker/cli#2236](https://github.com/docker/cli/pull/2236)
- Fix order of processing of `--label-add/--label-rm`, `--container-label-add/--container-label-rm`, and `--env-add/--env-rm` flags on `docker service update` to allow replacing existing values [docker/cli#2668](https://github.com/docker/cli/pull/2668)
- Fix `docker rm --force` returning a non-zero exit code if one or more containers did not exist [docker/cli#2678](https://github.com/docker/cli/pull/2678)
- Improve memory stats display by using `total_inactive_file` instead of `cache` [docker/cli#2415](https://github.com/docker/cli/pull/2415)
- Mitigate against YAML files that has excessive aliasing [docker/cli#2117](https://github.com/docker/cli/pull/2117)
- Allow using advanced syntax when setting a config or secret with only the source field [docker/cli#2243](https://github.com/docker/cli/pull/2243)
- Fix reading config files containing `username` and `password` auth even if `auth` is empty [docker/cli#2122](https://github.com/docker/cli/pull/2122)
- docker cp: prevent NPE when failing to stat destination [docker/cli#2221](https://github.com/docker/cli/pull/2221)
- config: preserve ownership and permissions on configfile [docker/cli#2228](https://github.com/docker/cli/pull/2228)
@y
- Add swarm jobs support to CLI [docker/cli#2262](https://github.com/docker/cli/pull/2262)
- Add `-a/--all-tags` to docker push [docker/cli#2220](https://github.com/docker/cli/pull/2220)
- Add support for Kubernetes username/password auth [docker/cli#2308](https://github.com/docker/cli/pull/2308)
- Add `--pull=missing|always|never` to `run` and `create` commands [docker/cli#1498](https://github.com/docker/cli/pull/1498)
- Add `--env-file` flag to `docker exec` for parsing environment variables from a file [docker/cli#2602](https://github.com/docker/cli/pull/2602)
- Add shorthand `-n` for `--tail` option [docker/cli#2646](https://github.com/docker/cli/pull/2646)
- Add log-driver and options to service inspect "pretty" format [docker/cli#1950](https://github.com/docker/cli/pull/1950)
- docker run: specify cgroup namespace mode with `--cgroupns` [docker/cli#2024](https://github.com/docker/cli/pull/2024)
- `docker manifest rm` command to remove manifest list draft from local storage [docker/cli#2449](https://github.com/docker/cli/pull/2449)
- Add "context" to "docker version" and "docker info" [docker/cli#2500](https://github.com/docker/cli/pull/2500)
- Propagate platform flag to container create API [docker/cli#2551](https://github.com/docker/cli/pull/2551)
- The `docker ps --format` flag now has a `.State` placeholder to print the container's state without additional details about uptime and health check [docker/cli#2000](https://github.com/docker/cli/pull/2000)
- Add support for docker-compose schema v3.9 [docker/cli#2073](https://github.com/docker/cli/pull/2073)
- Add support for docker push `--quiet` [docker/cli#2197](https://github.com/docker/cli/pull/2197)
- Hide flags that are not supported by BuildKit, if BuildKit is enabled [docker/cli#2123](https://github.com/docker/cli/pull/2123)
- Update flag description for `docker rm -v` to clarify the option only removes anonymous (unnamed) volumes [docker/cli#2289](https://github.com/docker/cli/pull/2289)
- Improve tasks printing for docker services [docker/cli#2341](https://github.com/docker/cli/pull/2341)
- docker info: list CLI plugins alphabetically [docker/cli#2236](https://github.com/docker/cli/pull/2236)
- Fix order of processing of `--label-add/--label-rm`, `--container-label-add/--container-label-rm`, and `--env-add/--env-rm` flags on `docker service update` to allow replacing existing values [docker/cli#2668](https://github.com/docker/cli/pull/2668)
- Fix `docker rm --force` returning a non-zero exit code if one or more containers did not exist [docker/cli#2678](https://github.com/docker/cli/pull/2678)
- Improve memory stats display by using `total_inactive_file` instead of `cache` [docker/cli#2415](https://github.com/docker/cli/pull/2415)
- Mitigate against YAML files that has excessive aliasing [docker/cli#2117](https://github.com/docker/cli/pull/2117)
- Allow using advanced syntax when setting a config or secret with only the source field [docker/cli#2243](https://github.com/docker/cli/pull/2243)
- Fix reading config files containing `username` and `password` auth even if `auth` is empty [docker/cli#2122](https://github.com/docker/cli/pull/2122)
- docker cp: prevent NPE when failing to stat destination [docker/cli#2221](https://github.com/docker/cli/pull/2221)
- config: preserve ownership and permissions on configfile [docker/cli#2228](https://github.com/docker/cli/pull/2228)
@z

@x
### Logging
@y
{: #logging }
### ログ処理
@z

@x
- Support reading `docker logs` with all logging drivers (best effort) [moby/moby#40543](https://github.com/moby/moby/pull/40543)
- Add `splunk-index-acknowledgment` log option to work with Splunk HECs with index acknowledgment enabled [moby/moby#39987](https://github.com/moby/moby/pull/39987)
- Add partial metadata to journald logs [moby/moby#41407](https://github.com/moby/moby/pull/41407)
- Reduce allocations for logfile reader [moby/moby#40796](https://github.com/moby/moby/pull/40796)
- Fluentd: add fluentd-async, fluentd-request-ack, and deprecate fluentd-async-connect [moby/moby#39086](https://github.com/moby/moby/pull/39086)
@y
- Support reading `docker logs` with all logging drivers (best effort) [moby/moby#40543](https://github.com/moby/moby/pull/40543)
- Add `splunk-index-acknowledgment` log option to work with Splunk HECs with index acknowledgment enabled [moby/moby#39987](https://github.com/moby/moby/pull/39987)
- Add partial metadata to journald logs [moby/moby#41407](https://github.com/moby/moby/pull/41407)
- Reduce allocations for logfile reader [moby/moby#40796](https://github.com/moby/moby/pull/40796)
- Fluentd: add fluentd-async, fluentd-request-ack, and deprecate fluentd-async-connect [moby/moby#39086](https://github.com/moby/moby/pull/39086)
@z

@x
### Runtime
@y
{: #runtime }
### ランタイム
@z

@x
- Support cgroup2 [moby/moby#40174](https://github.com/moby/moby/pull/40174) [moby/moby#40657](https://github.com/moby/moby/pull/40657) [moby/moby#40662](https://github.com/moby/moby/pull/40662)
- cgroup2: use "systemd" cgroup driver by default when available [moby/moby#40846](https://github.com/moby/moby/pull/40846)
- new storage driver: fuse-overlayfs [moby/moby#40483](https://github.com/moby/moby/pull/40483)
- Update containerd binary to v1.4.3 [moby/moby#41732](https://github.com/moby/moby/pull/41732)
- `docker push` now defaults to `latest` tag instead of all tags [moby/moby#40302](https://github.com/moby/moby/pull/40302)
- Added ability to change the number of reconnect attempts during connection loss while pulling an image by adding max-download-attempts to the config file [moby/moby#39949](https://github.com/moby/moby/pull/39949)
- Add support for containerd v2 shim by using the now default `io.containerd.runc.v2` runtime [moby/moby#41182](https://github.com/moby/moby/pull/41182)
- cgroup v1: change the default runtime to io.containerd.runc.v2. Requires containerd v1.3.0 or later. v1.3.5 or later is recommended [moby/moby#41210](https://github.com/moby/moby/pull/41210)
- Start containers in their own cgroup namespaces [moby/moby#38377](https://github.com/moby/moby/pull/38377)
- Enable DNS Lookups for CIFS Volumes [moby/moby#39250](https://github.com/moby/moby/pull/39250)
- Use MemAvailable instead of MemFree to estimate actual available memory [moby/moby#39481](https://github.com/moby/moby/pull/39481)
- The `--device` flag in `docker run` will now be honored when the container is started in privileged mode [moby/moby#40291](https://github.com/moby/moby/pull/40291)
- Enforce reserved internal labels [moby/moby#40394](https://github.com/moby/moby/pull/40394)
- Raise minimum memory limit to 6M, to account for higher memory use by runtimes during container startup [moby/moby#41168](https://github.com/moby/moby/pull/41168)
- Add support for `CAP_PERFMON`, `CAP_BPF`, and `CAP_CHECKPOINT_RESTORE` on supported kernels [moby/moby#41460](https://github.com/moby/moby/pull/41460)
- vendor runc v1.0.0-rc92 [moby/moby#41344](https://github.com/moby/moby/pull/41344) [moby/moby#41317](https://github.com/moby/moby/pull/41317)
- info: add warnings about missing blkio cgroup support [moby/moby#41083](https://github.com/moby/moby/pull/41083)
- Accept platform spec on container create [moby/moby#40725](https://github.com/moby/moby/pull/40725)
- Fix handling of looking up user- and group-names with spaces [moby/moby#41377](https://github.com/moby/moby/pull/41377)
@y
- Support cgroup2 [moby/moby#40174](https://github.com/moby/moby/pull/40174) [moby/moby#40657](https://github.com/moby/moby/pull/40657) [moby/moby#40662](https://github.com/moby/moby/pull/40662)
- cgroup2: use "systemd" cgroup driver by default when available [moby/moby#40846](https://github.com/moby/moby/pull/40846)
- new storage driver: fuse-overlayfs [moby/moby#40483](https://github.com/moby/moby/pull/40483)
- Update containerd binary to v1.4.3 [moby/moby#41732](https://github.com/moby/moby/pull/41732)
- `docker push` now defaults to `latest` tag instead of all tags [moby/moby#40302](https://github.com/moby/moby/pull/40302)
- Added ability to change the number of reconnect attempts during connection loss while pulling an image by adding max-download-attempts to the config file [moby/moby#39949](https://github.com/moby/moby/pull/39949)
- Add support for containerd v2 shim by using the now default `io.containerd.runc.v2` runtime [moby/moby#41182](https://github.com/moby/moby/pull/41182)
- cgroup v1: change the default runtime to io.containerd.runc.v2. Requires containerd v1.3.0 or later. v1.3.5 or later is recommended [moby/moby#41210](https://github.com/moby/moby/pull/41210)
- Start containers in their own cgroup namespaces [moby/moby#38377](https://github.com/moby/moby/pull/38377)
- Enable DNS Lookups for CIFS Volumes [moby/moby#39250](https://github.com/moby/moby/pull/39250)
- Use MemAvailable instead of MemFree to estimate actual available memory [moby/moby#39481](https://github.com/moby/moby/pull/39481)
- The `--device` flag in `docker run` will now be honored when the container is started in privileged mode [moby/moby#40291](https://github.com/moby/moby/pull/40291)
- Enforce reserved internal labels [moby/moby#40394](https://github.com/moby/moby/pull/40394)
- Raise minimum memory limit to 6M, to account for higher memory use by runtimes during container startup [moby/moby#41168](https://github.com/moby/moby/pull/41168)
- Add support for `CAP_PERFMON`, `CAP_BPF`, and `CAP_CHECKPOINT_RESTORE` on supported kernels [moby/moby#41460](https://github.com/moby/moby/pull/41460)
- vendor runc v1.0.0-rc92 [moby/moby#41344](https://github.com/moby/moby/pull/41344) [moby/moby#41317](https://github.com/moby/moby/pull/41317)
- info: add warnings about missing blkio cgroup support [moby/moby#41083](https://github.com/moby/moby/pull/41083)
- Accept platform spec on container create [moby/moby#40725](https://github.com/moby/moby/pull/40725)
- Fix handling of looking up user- and group-names with spaces [moby/moby#41377](https://github.com/moby/moby/pull/41377)
@z

@x
### Networking
@y
{: #networking }
### ネットワーク処理
@z

@x
- Support host.docker.internal in dockerd on Linux [moby/moby#40007](https://github.com/moby/moby/pull/40007)
- Include IPv6 address of linked containers in /etc/hosts [moby/moby#39837](https://github.com/moby/moby/pull/39837)
- `--ip6tables` enables IPv6 iptables rules (only if experimental) [moby/moby#41622](https://github.com/moby/moby/pull/41622)
- Add alias for hostname if hostname != container name [moby/moby#39204](https://github.com/moby/moby/pull/39204)
- Better selection of DNS server (with systemd) [moby/moby#41022](https://github.com/moby/moby/pull/41022)
- Add docker interfaces to firewalld docker zone [moby/moby#41189](https://github.com/moby/moby/pull/41189) [moby/libnetwork#2548](https://github.com/moby/libnetwork/pull/2548)
  - Fixes DNS issue on CentOS8 [docker/for-linux#957](https://github.com/docker/for-linux/issues/957)
  - Fixes Port Forwarding on RHEL 8 with Firewalld running with FirewallBackend=nftables [moby/libnetwork#2496](https://github.com/moby/libnetwork/issues/2496)
- Fix an issue reporting 'failed to get network during CreateEndpoint' [moby/moby#41189](https://github.com/moby/moby/pull/41189) [moby/libnetwork#2554](https://github.com/moby/libnetwork/pull/2554)
- Log error instead of disabling IPv6 router advertisement failed [moby/moby#41189](https://github.com/moby/moby/pull/41189) [moby/libnetwork#2563](https://github.com/moby/libnetwork/pull/2563)
- No longer ignore `--default-address-pool` option in certain cases [moby/moby#40711](https://github.com/moby/moby/pull/40711)
- Produce an error with invalid address pool [moby/moby#40808](https://github.com/moby/moby/pull/40808) [moby/libnetwork#2538](https://github.com/moby/libnetwork/pull/2538)
- Fix `DOCKER-USER` chain not created when IPTableEnable=false [moby/moby#40808](https://github.com/moby/moby/pull/40808) [moby/libnetwork#2471](https://github.com/moby/libnetwork/pull/2471)
- Fix panic on startup in systemd environments [moby/moby#40808](https://github.com/moby/moby/pull/40808) [moby/libnetwork#2544](https://github.com/moby/libnetwork/pull/2544)
- Fix issue preventing containers to communicate over macvlan internal network [moby/moby#40596](https://github.com/moby/moby/pull/40596) [moby/libnetwork#2407](https://github.com/moby/libnetwork/pull/2407)
- Fix InhibitIPv4 nil panic [moby/moby#40596](https://github.com/moby/moby/pull/40596)
- Fix VFP leak in Windows overlay network deletion [moby/moby#40596](https://github.com/moby/moby/pull/40596) [moby/libnetwork#2524](https://github.com/moby/libnetwork/pull/2524)
@y
- Support host.docker.internal in dockerd on Linux [moby/moby#40007](https://github.com/moby/moby/pull/40007)
- Include IPv6 address of linked containers in /etc/hosts [moby/moby#39837](https://github.com/moby/moby/pull/39837)
- `--ip6tables` enables IPv6 iptables rules (only if experimental) [moby/moby#41622](https://github.com/moby/moby/pull/41622)
- Add alias for hostname if hostname != container name [moby/moby#39204](https://github.com/moby/moby/pull/39204)
- Better selection of DNS server (with systemd) [moby/moby#41022](https://github.com/moby/moby/pull/41022)
- Add docker interfaces to firewalld docker zone [moby/moby#41189](https://github.com/moby/moby/pull/41189) [moby/libnetwork#2548](https://github.com/moby/libnetwork/pull/2548)
  - Fixes DNS issue on CentOS8 [docker/for-linux#957](https://github.com/docker/for-linux/issues/957)
  - Fixes Port Forwarding on RHEL 8 with Firewalld running with FirewallBackend=nftables [moby/libnetwork#2496](https://github.com/moby/libnetwork/issues/2496)
- Fix an issue reporting 'failed to get network during CreateEndpoint' [moby/moby#41189](https://github.com/moby/moby/pull/41189) [moby/libnetwork#2554](https://github.com/moby/libnetwork/pull/2554)
- Log error instead of disabling IPv6 router advertisement failed [moby/moby#41189](https://github.com/moby/moby/pull/41189) [moby/libnetwork#2563](https://github.com/moby/libnetwork/pull/2563)
- No longer ignore `--default-address-pool` option in certain cases [moby/moby#40711](https://github.com/moby/moby/pull/40711)
- Produce an error with invalid address pool [moby/moby#40808](https://github.com/moby/moby/pull/40808) [moby/libnetwork#2538](https://github.com/moby/libnetwork/pull/2538)
- Fix `DOCKER-USER` chain not created when IPTableEnable=false [moby/moby#40808](https://github.com/moby/moby/pull/40808) [moby/libnetwork#2471](https://github.com/moby/libnetwork/pull/2471)
- Fix panic on startup in systemd environments [moby/moby#40808](https://github.com/moby/moby/pull/40808) [moby/libnetwork#2544](https://github.com/moby/libnetwork/pull/2544)
- Fix issue preventing containers to communicate over macvlan internal network [moby/moby#40596](https://github.com/moby/moby/pull/40596) [moby/libnetwork#2407](https://github.com/moby/libnetwork/pull/2407)
- Fix InhibitIPv4 nil panic [moby/moby#40596](https://github.com/moby/moby/pull/40596)
- Fix VFP leak in Windows overlay network deletion [moby/moby#40596](https://github.com/moby/moby/pull/40596) [moby/libnetwork#2524](https://github.com/moby/libnetwork/pull/2524)
@z

@x
### Packaging
@y
{: #Packaging }
### パッケージ
@z

@x
- docker.service: Add multi-user.target to After= in unit file [moby/moby#41297](https://github.com/moby/moby/pull/41297)
- docker.service: Allow socket activation [moby/moby#37470](https://github.com/moby/moby/pull/37470)
- seccomp: Remove dependency in dockerd on libseccomp [moby/moby#41395](https://github.com/moby/moby/pull/41395)
@y
- docker.service: Add multi-user.target to After= in unit file [moby/moby#41297](https://github.com/moby/moby/pull/41297)
- docker.service: Allow socket activation [moby/moby#37470](https://github.com/moby/moby/pull/37470)
- seccomp: Remove dependency in dockerd on libseccomp [moby/moby#41395](https://github.com/moby/moby/pull/41395)
@z

@x
### Rootless
@y
### Rootless
@z

@x
- rootless: graduate from experimental [moby/moby#40759](https://github.com/moby/moby/pull/40759)
- Add dockerd-rootless-setuptool.sh [moby/moby#40950](https://github.com/moby/moby/pull/40950)
- Support `--exec-opt native.cgroupdriver=systemd` [moby/moby#40486](https://github.com/moby/moby/pull/40486)
@y
- rootless: 試験的機能から格上げ。
  [moby/moby#40759](https://github.com/moby/moby/pull/40759)
- dockerd-rootless-setuptool.sh 追加。
  [moby/moby#40950](https://github.com/moby/moby/pull/40950)
- `--exec-opt native.cgroupdriver=systemd`のサポート。
  [moby/moby#40486](https://github.com/moby/moby/pull/40486)
@z

@x
### Security
@y
{: #security }
### セキュリティ
@z

@x
- Fix CVE-2019-14271 loading of nsswitch based config inside chroot under Glibc [moby/moby#39612](https://github.com/moby/moby/pull/39612)
- seccomp: Whitelist `clock_adjtime`. `CAP_SYS_TIME` is still required for time adjustment [moby/moby#40929](https://github.com/moby/moby/pull/40929)
- seccomp: Add openat2 and faccessat2 to default seccomp profile [moby/moby#41353](https://github.com/moby/moby/pull/41353)
- seccomp: allow 'rseq' syscall in default seccomp profile [moby/moby#41158](https://github.com/moby/moby/pull/41158)
- seccomp: allow syscall membarrier [moby/moby#40731](https://github.com/moby/moby/pull/40731)
- seccomp: whitelist io-uring related system calls [moby/moby#39415](https://github.com/moby/moby/pull/39415)
- Add default sysctls to allow ping sockets and privileged ports with no capabilities [moby/moby#41030](https://github.com/moby/moby/pull/41030)
- Fix seccomp profile for clone syscall [moby/moby#39308](https://github.com/moby/moby/pull/39308)
@y
- Fix CVE-2019-14271 loading of nsswitch based config inside chroot under Glibc [moby/moby#39612](https://github.com/moby/moby/pull/39612)
- seccomp: Whitelist `clock_adjtime`. `CAP_SYS_TIME` is still required for time adjustment [moby/moby#40929](https://github.com/moby/moby/pull/40929)
- seccomp: Add openat2 and faccessat2 to default seccomp profile [moby/moby#41353](https://github.com/moby/moby/pull/41353)
- seccomp: allow 'rseq' syscall in default seccomp profile [moby/moby#41158](https://github.com/moby/moby/pull/41158)
- seccomp: allow syscall membarrier [moby/moby#40731](https://github.com/moby/moby/pull/40731)
- seccomp: whitelist io-uring related system calls [moby/moby#39415](https://github.com/moby/moby/pull/39415)
- Add default sysctls to allow ping sockets and privileged ports with no capabilities [moby/moby#41030](https://github.com/moby/moby/pull/41030)
- Fix seccomp profile for clone syscall [moby/moby#39308](https://github.com/moby/moby/pull/39308)
@z

@x
### Swarm
@y
### Swarm
@z

@x
- Add support for swarm jobs [moby/moby#40307](https://github.com/moby/moby/pull/40307)
- Add capabilities support to stack/service commands [docker/cli#2687](https://github.com/docker/cli/pull/2687) [docker/cli#2709](https://github.com/docker/cli/pull/2709) [moby/moby#39173](https://github.com/moby/moby/pull/39173) [moby/moby#41249](https://github.com/moby/moby/pull/41249)
- Add support for sending down service Running and Desired task counts [moby/moby#39231](https://github.com/moby/moby/pull/39231)
- service: support `--mount type=bind,bind-nonrecursive` [moby/moby#38788](https://github.com/moby/moby/pull/38788)
- Support ulimits on Swarm services. [moby/moby#41284](https://github.com/moby/moby/pull/41284) [docker/cli#2712](https://github.com/docker/cli/pull/2712)
- Fixed an issue where service logs could leak goroutines on the worker [moby/moby#40426](https://github.com/moby/moby/pull/40426)
@y
- Swarm ジョブへのサポートを追加。
  [moby/moby#40307](https://github.com/moby/moby/pull/40307)
- stack/service コマンドに対してケーパビリティーのサポートを追加。
  [docker/cli#2687](https://github.com/docker/cli/pull/2687)
  [docker/cli#2709](https://github.com/docker/cli/pull/2709)
  [moby/moby#39173](https://github.com/moby/moby/pull/39173)
  [moby/moby#41249](https://github.com/moby/moby/pull/41249)
- Add support for sending down service Running and Desired task counts
  [moby/moby#39231](https://github.com/moby/moby/pull/39231)
- service: `--mount type=bind,bind-nonrecursive`のサポート。
  [moby/moby#38788](https://github.com/moby/moby/pull/38788)
- Support ulimits on Swarm services.
  [moby/moby#41284](https://github.com/moby/moby/pull/41284)
  [docker/cli#2712](https://github.com/docker/cli/pull/2712)
- Fixed an issue where service logs could leak goroutines on the worker [moby/moby#40426](https://github.com/moby/moby/pull/40426)
@z
