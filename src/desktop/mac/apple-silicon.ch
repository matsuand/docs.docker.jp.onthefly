%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Apple silicon
keywords: Docker Desktop, M1, Silicon, Apple,
title: Docker Desktop for Apple silicon
redirect_from:
- /docker-for-mac/apple-m1/
- /docker-for-mac/apple-silicon/
---
@y
---
description: Docker Desktop for Apple silicon
keywords: Docker Desktop, M1, Silicon, Apple,
title: Docker Desktop for Apple silicon
redirect_from:
- /docker-for-mac/apple-m1/
- /docker-for-mac/apple-silicon/
---
@z

@x
Docker Desktop for Mac on Apple silicon is now available as a GA release. This enables you to develop applications with your choice of local development environments, and extends development pipelines for ARM-based applications.
@y
Apple silicon 上での Docker Desktop for Mac が正規安定版（GA release）として利用できるようになりました。
開発者によるローカル開発環境の選択肢が広がったことになります。
また ARM ベースアプリケーション開発に拡張することができます。
@z

@x
Docker Desktop for Apple silicon also supports multi-platform images, which allows you to build and run images for both x86 and ARM architectures without having to set up a complex cross-compilation development environment. Additionally, you can use [docker buildx](../../engine/reference/commandline/buildx.md){:target="_blank" rel="noopener" class="_"} to seamlessly integrate multi-platform builds into your build pipeline, and use [Docker Hub](https://hub.docker.com/){:target="_blank" rel="noopener" class="_"} to identify and share repositories that provide multi-platform images.
@y
Docker Desktop for Apple silicon はマルチプラットフォームイメージにも対応しています。
これがあれば、複雑なクロスコンパイル開発環境を設定することなく、x86 と ARM アーキテクチャーの双方に対するイメージをビルドし実行することができます。
さらに [docker buildx](../../engine/reference/commandline/buildx.md){:target="_blank" rel="noopener" class="_"} を用いれば、シームレスにマルチプラットフォームビルドをビルド作業に統合することができます。
そして [Docker Hub](https://hub.docker.com/){:target="_blank" rel="noopener" class="_"} によって、マルチプラットフォームイメージを同定し共有するために利用できます。
@z

@x
> Download Docker Desktop
>
>
> [Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .button .primary-btn }
@y
> Docker Desktop のダウンロード
>
>
> [Apple チップの Mac](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .button .primary-btn }
@z

@x
<br>
@y
<br>
@z

@x
### System requirements
@y
{: #system-requirements }
### システム要件
@z

@x
Beginning with Docker Desktop 4.3.0, we have removed the hard requirement to install **Rosetta 2**. There are a few optional command line tools that still require Rosetta 2 when using Darwin/AMD64. See the Known issues section below. However, to get the best experience, we recommend that you install Rosetta 2. To install Rosetta 2 manually from the command line, run the following command:
@y
Docker Desktop 4.3.0 からは、**Rosetta 2** をインストールするためのハードウェア要件を削除しています。
Darwin/AMD64 を利用するにあたって、Rosetta 2 を必要とするコマンドラインツールが少しはあります。
以下の既知の問題の節を確認してください。
ただし十分な機能性を確保するためには、Rosetta 2 のインストールをお勧めします。
Rosetta 2 のインストールは、コマンドラインから手動で、以下のようにして行います。
@z

@x
```console
$ softwareupdate --install-rosetta
```
@y
```console
$ softwareupdate --install-rosetta
```
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
- Some command line tools do not work when Rosetta 2 is not installed.
  - The old version 1.x of `docker-compose`. We recommend that you use Compose V2 instead. Either type `docker compose` or enable the **Use Docker Compose V2** option in the [General preferences tab](./index.md#general).
  - The `docker scan` command and the underlying `snyk` binary.
  - The `docker-credential-ecr-login` credential helper.
@y
- コマンドラインツールの中には、Rosetta 2 がインストールされていないと、動作しないものがあります。
  - 旧バージョン 1.x における`docker-compose`。
    これにかわって Compose V2 の利用をお勧めします。
    `docker compose`と入力するか、あるいは [一般タブ](./index.md#general) の **Use Docker Compose V2**（Docker Compose V2 の利用）オプションを有効にしてください。
  - `docker scan`コマンドと、それが依存している`snyk`バイナリ。
  - `docker-credential-ecr-login` credential helper。
@z

@x
- Not all images are available for ARM64 architecture. You can add `--platform linux/amd64` to run an Intel image under emulation. In particular, the [mysql](https://hub.docker.com/_/mysql?tab=tags&page=1&ordering=last_updated) image is not available for ARM64. You can work around this issue by using a [mariadb](https://hub.docker.com/_/mariadb?tab=tags&page=1&ordering=last_updated) image.
@y
- ARM64 アーキテクチャー向けのイメージがすべて利用可能となっているわけではありません。
  Intel イメージの実行には、エミュレーションのもとで`--platform linux/amd64`をつけて実行することが必要です。
  特に [mysql](https://hub.docker.com/_/mysql?tab=tags&page=1&ordering=last_updated) イメージは ARM64 向けには利用できません。
  これに対する当面の対処としては [mariadb](https://hub.docker.com/_/mariadb?tab=tags&page=1&ordering=last_updated) イメージを利用してください。
@z

@x
   However, attempts to run Intel-based containers on Apple silicon machines under emulation can crash as qemu sometimes fails to run the container. In addition, filesystem change notification APIs (`inotify`) do not work under qemu emulation. Even when the containers do run correctly under emulation, they will be slower and use more memory than the native equivalent.
@y
   しかし Apple silicon 上において Intel ベースのコンテナーを実行しようとしても、qemu によるコンテナー実行が失敗することがあるため、エミュレーションがクラッシュすることがあります。
   さらに qemu エミュレーションのもとでは、ファイルシステム変更通知 API（たとえば`inotify`）は動作しません。
   エミュレーションのもとで適正にコンテナーが動作しない状況であっても、それでもコンテナーは動作し続けますが、それは通常のネイティブな環境に比べて、非常に遅くメモリもたくさん消費します。
@z

@x
   In summary, running Intel-based containers on Arm-based machines should be regarded as "best effort" only. We recommend running arm64 containers on Apple silicon machines whenever possible, and encouraging container authors to produce arm64, or multi-arch, versions of their containers. We expect this issue to become less common over time, as more and more images are rebuilt [supporting multiple architectures](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/).
@y
   上のことをまとめると、Arm ベースのマシン上において Intel ベースのコンテナーを動作させているのは「ベストエフォート」にすぎない、言い換えればできる範囲での対応でしかない、ということです。
   したがって Apple silicon 上では可能なら arm64 コンテナーの実行をお勧めします。
   またコンテナーを制作する方は arm64 やこれを含むマルチアーキテクチャーのコンテナーとすることをお勧めします。
   この問題は時が経つにつれて、また [マルチアーキテクチャーをサポートする](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/) イメージが今後さらに再ビルドされていくにつれて、まれな問題となっていくものと考えています。
@z

@x
- `ping` from inside a container to the Internet does not work as expected.  To test the network, we recommend using `curl` or `wget`. See [docker/for-mac#5322](https://github.com/docker/for-mac/issues/5322#issuecomment-809392861).
- Users may occasionally experience data drop when a TCP stream is half-closed.
@y
- コンテナー内からインターネットに向けての`ping`が期待どおりに動作しません。
  ネットワークの確認にあたっては`curl`や`wget`を利用してください。
  [docker/for-mac#5322](https://github.com/docker/for-mac/issues/5322#issuecomment-809392861) を参照のこと。
- TCP ストリームがハーフクロース（half-closed）された際に、たまにデータが欠損する場合があります。
@z

@x
### Fixes since Docker Desktop RC 3
@y
{: #fixes-since-docker-desktop-rc-3 }
### Docker Desktop RC 3 以降の修正
@z

@x
- Docker Desktop now ensures the permissions of `/dev/null` and other devices are correctly set to `0666` (`rw-rw-rw-`) inside `--privileged` containers. Fixes [docker/for-mac#5527](https://github.com/docker/for-mac/issues/5527).
- Docker Desktop now reduces the idle CPU consumption.
@y
- `--privileged`が指定されたコンテナー内において、`/dev/null`などのデバイスが、適切に`0666`（`rw-rw-rw-`）となりようにしました。
  [docker/for-mac#5527](https://github.com/docker/for-mac/issues/5527) を Fix に。
- Docker Desktop にてアイドル時の CPU 消費を減少させました。
@z

@x
### Fixes since Docker Desktop RC 2
@y
{: #fixes-since-docker-desktop-rc-2 }
### Docker Desktop RC 2 以降の修正
@z

@x
- Update to [Linux kernel 5.10.25](https://hub.docker.com/layers/docker/for-desktop-kernel/5.10.25-6594e668feec68f102a58011bb42bd5dc07a7a9b/images/sha256-80e22cd9c9e6a188a785d0e23b4cefae76595abe1e4a535449627c2794b10871?context=repo) to improve reliability.
@y
- [Linux カーネル 5.10.25](https://hub.docker.com/layers/docker/for-desktop-kernel/5.10.25-6594e668feec68f102a58011bb42bd5dc07a7a9b/images/sha256-80e22cd9c9e6a188a785d0e23b4cefae76595abe1e4a535449627c2794b10871?context=repo) へアップデートし、信頼性を向上させました。
@z

@x
### Fixes since Docker Desktop RC 1
@y
{: #fixes-since-docker-desktop-rc-1 }
### Docker Desktop RC 1 以降の修正
@z

@x
- Inter-container HTTP and HTTPS traffic is now routed correctly. Fixes [docker/for-mac#5476](https://github.com/docker/for-mac/issues/5476).
@y
- コンテナー間での HTTP および HTTPS トラフィックを正常に振り分けるようにしました。
  [docker/for-mac#5476](https://github.com/docker/for-mac/issues/5476) を Fix に。
@z

@x
### Fixes since Docker Desktop preview 3.1.0
@y
{: #fixes-since-docker-desktop-preview-310 }
### Docker Desktop プレビュー 3.1.0 以降の修正
@z

@x
- The build should update automatically to future versions.
- HTTP proxy support is working, including support for domain name based `no_proxy` rules via TLS SNI. Fixes [docker/for-mac#2732](https://github.com/docker/for-mac/issues/2732).
@y
- ビルドは将来バージョンに向けて自動アップデートされます。
- HTTP プロキシーへのサポートが動作するようになりました。
  これには TLS SNI を通じた`no_proxy`ルールに基づくドメイン名へのサポートも含まれます。
  [docker/for-mac#2732](https://github.com/docker/for-mac/issues/2732) を Fix に。
@z

@x
### Fixes since the Apple Silicon preview 7
@y
{: #fixes-since-the-apple-silicon-preview-7 }
### Apple Silicon プレビュー 7 以降の修正
@z

@x
- Kubernetes now works (although you might need to reset the cluster in our Troubleshoot menu one time to regenerate the certificates).
- osxfs file sharing works.
- The `host.docker.internal` and `vm.docker.internal` DNS entries now resolve.
- Removed hard-coded IP addresses: Docker Desktop now dynamically discovers the IP allocated by macOS.
- The updated version includes a  change that should improve disk performance.
- The **Restart** option in the Docker menu works.
@y
- Kubernetes が動作するようになりました。
  （ただし証明書を再生成するために、一度 Troubleshoot メニュー内からクラスターのリセットが必要になります。）
- osxfs ファイル共有が動作します。
- DNS エントリー`host.docker.internal`と`vm.docker.internal`は解決されました。
- ハードコーディングされた IP アドレスの削除。
  Docker Desktop は macOS によって割り振られた IP アドレスを動的に検出するようになりました。
- 更新バージョンには、ディスク性能を向上させる変更が含まれています。
- Docker メニューの **Restart** オプションが動作するようになりました。
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
Your feedback is important to us. Let us know your feedback by creating an issue in the [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues) repository.
@y
みなさんからのフィードバックが重要と考えています。
GitHub リポジトリ [Docker Desktop for Mac](https://github.com/docker/for-mac/issues) に issue を生成してフィードバックをお寄せください。
@z

@x
We also recommend that you join the [Docker Community Slack](https://www.docker.com/docker-community) and ask questions in **#docker-desktop-mac** channel.
@y
また [Docker Community Slack](https://www.docker.com/docker-community) への参加や **#docker-desktop-mac** チャネルへの質問をお願いします。
@z
