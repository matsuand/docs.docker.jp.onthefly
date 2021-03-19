%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Apple Silicon Tech Preview
keywords: Docker Desktop, M1, Silicon, Apple, tech preview, dev preview
title: Apple Silicon Tech Preview
toc_min: 2
toc_max: 3
---
@y
---
description: Apple Silicon 技術プレビュー
keywords: Docker Desktop, M1, Silicon, Apple, tech preview, dev preview
title: Apple Silicon 技術プレビュー
toc_min: 2
toc_max: 3
---
@z

@x
Welcome to Docker Desktop for Apple Silicon.
@y
Docker Desktop の Apple Silicon 向け技術プレビューへようこそ。
@z

@x
> **Note**
>
> We encourage you to try the release candidate and report any issues in the [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac) repository.
@y
> **メモ**
>
> 当リリース候補（release candidate; RC）をお試しいただき、問題があれば GitHub リポジトリ [Docker Desktop for Mac](https://github.com/docker/for-mac) へ issue をあげてください。
@z

@x
## Docker Desktop RC 1

2021-03-18
@y
{: #docker-desktop-rc-1 }
## Docker Desktop RC 1

2021-03-18
@z

@x
Click on the following link to download the latest release candidate of Docker Desktop for Apple Silicon.
@y
以下のリンクをクリックして Apple Silicon 向け Docker Destkop の最新リリース候補をダウンロードしてください。
@z

@x
> [Download](https://desktop.docker.com/mac/stable/arm64/62029/Docker.dmg)
@y
> [ダウンロード](https://desktop.docker.com/mac/stable/arm64/62029/Docker.dmg)
@z

@x
### Known issues
@y
{: #known-issues }
### 既知の問題
@z

@x
The following issues are not expected to be resolved in the final GA build for Apple Silicon. We are working with our partners on these.
@y
以下に示す問題は、Apple Silicon 向けの最終的な正規安定版（general availability; GA）に含めることができない可能性があります。
これらについては開発関係者とともに鋭意作業中です。
@z

@x
- You must install Rosetta 2 as some binaries are still Darwin/AMD64. To install Rosetta 2 manually from the command line, use this command:
@y
- 実行バイナリが Darwin/AMD64 向けのものがあるため、Rosetta 2 をインストールする必要があります。
  Rosetta 2 をコマンドラインから手動でインストールする場合は、以下のコマンドを実行します。
@z

@x
    ```
    softwareupdate --install-rosetta
    ```
    We expect to fix this in a future release.
@y
    ```
    softwareupdate --install-rosetta
    ```
    この点は将来のリリースにおいて解消する予定です。
@z

@x
- Not all images are available for ARM64 architecture. You can add `--platform linux/amd64` to run an Intel image under emulation. In particular, the [mysql](https://hub.docker.com/_/mysql?tab=tags&page=1&ordering=last_updated) image is not available for ARM64. You can work around this issue by using a [mariadb](https://hub.docker.com/_/mariadb?tab=tags&page=1&ordering=last_updated) image.
@y
- ARM64 アーキテクチャー向けのイメージはすべてが利用可能ではありません。
  Intel イメージはエミュレーションのもと、`--platform linux/amd64`をつけて実行することができます。
  特に [mysql](https://hub.docker.com/_/mysql?tab=tags&page=1&ordering=last_updated) イメージは ARM64 において利用できません。
  この状況は [mariadb](https://hub.docker.com/_/mariadb?tab=tags&page=1&ordering=last_updated) イメージを利用すれば解消されます。
@z

@x
   However, attempts to run Intel-based containers on Apple Silicon machines can crash as QEMU sometimes fails to run the container. Therefore, we recommend that you run ARM64 containers on Apple Silicon machines. These containers are also faster and use less memory than Intel-based containers.
@y
   ただし Apple Silicon マシン上において Intel ベースのコンテナーを起動しようとするとクラッシュします。
   これは QEMU がコンテナーの起動に失敗することがあるためです。
   したがって Apple Silicon マシン上においては ARM64 コンテナーの起動をお勧めします。
   そういったコンテナーであれば、Intel ベースのコンテナーに比べて、より早くメモリ消費も少なくて済みます。
@z

@x
   We expect this issue to become less common over time, as more and more images are rebuilt [supporting multiple architectures](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/).
@y
   [複数アーキテクチャーへのサポート](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/) が今後増えていくことが予想されるため、この問題はいずれ一般的なものではなくなると考えています。
@z

@x
- Some VPN clients can prevent the VM running Docker from communicating with the host, preventing Docker Desktop starting correctly. See [docker/for-mac#5208](https://github.com/docker/for-mac/issues/5208).
@y
- Docker が動作する VM において VPN クライアントがホストとの通信を妨げるものがあります。
  Docker Desktop が適正に起動しなくなります。
  [docker/for-mac#5208](https://github.com/docker/for-mac/issues/5208) を参照してください。
@z

@x
   This is an interaction between `vmnet.framework` (as used by `virtualization.framework` in Big Sur) and the VPN clients.
@y
   これは（Big Sur 内の`virtualization.framework`が利用する）`vmnet.framework`と VPN クライアントが干渉するために発生します。
@z

@x
- Docker Desktop is incompatible with macOS Internet Sharing. See [docker/for-mac#5348](https://github.com/docker/for-mac/issues/5348).
@y
- Docker Desktop は macOS のインターネット共有（Internet Sharing）とは互換性がありません。
  [docker/for-mac#5348](https://github.com/docker/for-mac/issues/5348) を参照してください。
@z

@x
   This is an interaction between `vmnet.framework` (as used by `virtualization.framework` in Big Sur) and macOS Internet Sharing. At the moment it is not possible to use Docker Desktop and macOS Internet Sharing at the same time.
@y
   これは（Big Sur 内の`virtualization.framework`が利用する）`vmnet.framework`と macOS インターネット共有が干渉委するために発生します。
   現時点において Docker Desktop と macOS インターネット共有を同時に利用することはできません。
@z

@x
- Some container disk I/O is much slower than expected. See [docker/for-mac#5389](https://github.com/docker/for-mac/issues/5389). Disk flushes are particularly slow due to the need to guarantee data is written to stable storage on the host.
@y
- コンテナーのディスク I/O が想定以上に低下する場合があります。
  [docker/for-mac#5389](https://github.com/docker/for-mac/issues/5389) を参照してください。
  ホスト上の安定したストレージにデータ書き込みを確実に行うため、ディスクフラッシュ処理が著しく低下するためです。
@z

@x
   This is an artifact of the new `virtualization.framework` in Big Sur.
@y
   これは Big Sur の新しい`virtualization.framework`に起因するものです。
@z

@x
- TCP and UDP port 53 (DNS) are bound on the host when Docker Desktop starts. Therefore you cannot bind to port 53 on all interfaces with a command like `docker run -p 53:53`. See [docker/for-mac#5335](https://github.com/docker/for-mac/issues/5335).
@y
- Docker Desktop を起動すると、ホスト上における TCP および UDP のポート 53（DNS）がバインドされます。
  したがってどのインターフェース上であっても、`docker run -p 53:53`などのコマンドを通じてポート 53 をバインドすることはできません。
  [docker/for-mac#5335](https://github.com/docker/for-mac/issues/5335) を参照してください。
@z

@x
   This is an artifact of the new `virtualization.framework` in Big Sur. A workaround is to bind to a specific IP address e.g. `docker run -p 127.0.0.1:53:53`.
@y
   これは Big Sur の新しい`virtualization.framework`に起因するものです。
   回避する方法としては、`docker run -p 127.0.0.1:53:53`などのようにして特定の IP アドレスにバインドする方法があります。
@z

@x
- The Linux Kernel may occasionally crash. Docker now detects this problem and pops up an error dialog offering the user the ability to quickly restart Linux.
@y
- Linux カーネルがときどきクラッシュすることがあります。
  Docker ではこの問題を検出するようにし、即座に Linux を再起動することをユーザーに知らせるエラーダイアログを表示するようにしました。
nux.
@z

@x
   We are still gathering data and testing alternate kernel versions.
@y
   現在、データを収集している最中であり、さまざまなカーネルバージョンをテスト中です。
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
- 自動アップデートは将来のバージョンにおいて実装される予定です。
- HTTP プロキシー対応が機能するようになりました。
  TLS SNI による`no_proxy`ルールに基づいたドメイン名もサポートされます。
  [docker/for-mac#2732](https://github.com/docker/for-mac/issues/2732) を Fix に。
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
Thank you for trying out the Docker Desktop for Apple Silicon tech preview. Your feedback is important to us. Let us know your feedback by creating an issue in the [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues)repository.
@y
Docker Desktop の Apple Silicon 技術プレビューを試していただきありがとうございます。
みなさんからのフィードバックを頂くことが重要です。
フィードバックは [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues) リポジトリに issue を生成してお知らせください。
@z

@x
We also recommend that you join the [Docker Community Slack](https://www.docker.com/docker-community) and ask questions in **#docker-desktop-mac** channel.
@y
また [Docker Community Slack](https://www.docker.com/docker-community) に参加し、**#docker-desktop-mac** チャネルに質問をあげていただくことをお勧めします。
@z

@x
For more information about the tech preview, see our blog post [Download and Try the Tech Preview of Docker Desktop for M1](https://www.docker.com/blog/download-and-try-the-tech-preview-of-docker-desktop-for-m1/).
@y
技術プレビューの詳細については、ブログ投稿 [Docker Desktop for M1 技術プレビュー版のダウンロードと実行](https://www.docker.com/blog/download-and-try-the-tech-preview-of-docker-desktop-for-m1/) を参照してください。
@z
