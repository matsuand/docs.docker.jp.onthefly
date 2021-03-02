%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Apple M1 Tech Preview
keywords: Docker Desktop, M1, Silicon, Apple, tech preview, dev preview
title: Apple M1 Tech Preview
toc_min: 2
toc_max: 3
---
@y
---
description: Apple M1 技術プレビュー
keywords: Docker Desktop, M1, Silicon, Apple, tech preview, dev preview
title: Apple M1 技術プレビュー
toc_min: 2
toc_max: 3
---
@z

@x
Welcome to the tech preview of Docker Desktop for Apple M1. This tech preview is aimed at early adopters of Apple M1 machines, who would like to try an experimental build of Docker Desktop.
@y
Docker Desktop の Apple M1 向け技術プレビューへようこそ。
この技術プレビューは Apple M1 マシンをいち早く導入した方で、Docker Desktop の試験的ビルドを試してみたい方を対象としています。
@z

@x
> **Note**
>
> Docker Desktop on Apple M1 chip is still under development. We recommend that you do not use tech preview builds in production environments.
@y
> **メモ**
>
> Apple M1 チップ上の Docker Desktop は現在開発中です。
> ですから技術プレビュービルドは本番環境での利用をお勧めしません。
@z

@x
## Download
@y
{: #download }
## ダウンロード
@z

@x
Click the following link to download the Apple M1 tech preview build:
@y
以下のリンクをクリックして Apple M1 技術プレビュービルドをダウンロードしてください。
@z

@x
> [Download](https://desktop.docker.com/mac/stable/arm64/60984/Docker.dmg)
@y
> [ダウンロード](https://desktop.docker.com/mac/stable/arm64/60984/Docker.dmg)
@z

@x
## Known issues
@y
{: #known-issues }
## 既知の問題
@z

@x
The tech preview of Docker Desktop for Apple M1 currently has the following limitations:
@y
Docker Desktop の Apple M1 向け技術プレビュー版では、現在のところ以下の制約があります。
@z

@x
- The tech preview build does not update automatically. You must manually install any future versions of Docker Desktop.
- You must install Rosetta 2 as some binaries are still Darwin/AMD64. To install Rosetta 2 manually from the command line, use this command:
@y
- 技術プレビュービルドは自動アップデートされません。
  最新バージョンは手動インストールすることが必要です。
- 実行バイナリが Darwin/AMD64 向けのものがあるため、Rosetta 2 をインストールする必要があります。
  Rosetta 2 をコマンドラインから手動でインストールする場合は、以下のコマンドを実行します。
@z

@x
    ```
    softwareupdate --install-rosetta
    ```
@y
    ```
    softwareupdate --install-rosetta
    ```
@z

@x
- The HTTP proxy is not enabled.
@y
- HTTP プロキシーは利用できません。
@z

@x
- Not all images are available for ARM64 architecture. You can add `--platform linux/amd64` to run an Intel image under emulation. In particular, the [mysql](https://hub.docker.com/_/mysql?tab=tags&page=1&ordering=last_updated){: target="blank" rel="noopener" class=“”} image is not available for ARM64. You can work around this issue by using a [mariadb](https://hub.docker.com/_/mariadb?tab=tags&page=1&ordering=last_updated){: target="blank" rel="noopener" class=“”} image.
@y
- ARM64 アーキテクチャー向けのイメージはすべてが利用可能ではありません。
  Intel イメージはエミュレーションのもと、`--platform linux/amd64`をつけて実行することができます。
  特に [mysql](https://hub.docker.com/_/mysql?tab=tags&page=1&ordering=last_updated){: target="blank" rel="noopener" class=“”} イメージは ARM64 において利用できません。
  この状況は [mariadb](https://hub.docker.com/_/mariadb?tab=tags&page=1&ordering=last_updated){: target="blank" rel="noopener" class=“”} イメージを利用すれば解消されます。
@z

@x
   However, attempts to run Intel-based containers on Apple M1 machines can crash as QEMU sometimes fails to run the container. Therefore, we recommend that you run ARM64 containers on M1 machines. These containers are also faster and use less memory than Intel-based containers.
@y
   ただし Apple M1 マシン上において Intel ベースのコンテナーを起動しようとするとクラッシュします。
   これは QEMU がコンテナーの起動に失敗することがあるためです。
   したがって M1 マシン上においては ARM64 コンテナーの起動をお勧めします。
   そういったコンテナーであれば、Intel ベースのコンテナーに比べて、より早くメモリ消費も少なくて済みます。
@z

@x
- Some VPN clients can prevent the VM running Docker from communicating with the host, preventing Docker Desktop starting correctly. See [docker/for-mac#5208](https://github.com/docker/for-mac/issues/5208){: target="blank" rel="noopener" class=“”}.
@y
- Docker が動作する VM において VPN クライアントがホストとの通信を妨げるものがあります。
  Docker Desktop が適正に起動しなくなります。
  [docker/for-mac#5208](https://github.com/docker/for-mac/issues/5208){: target="blank" rel="noopener" class=“”} を参照してください。
@z

@x
- The kernel may panic. If so, look in `~/Library/Containers/com.docker.docker/Data/vms/0/console.log` for a BUG or kernel panic to report.
@y
- カーネルがパニックを発生させるかもしれません。
  その場合は`~/Library/Containers/com.docker.docker/Data/vms/0/console.log`の内容から、バグなのかカーネルパニックなのかを確認し報告してください。
@z

@x
## Fixes since the Apple Silicon preview 7
@y
{: #fixes-since-the-apple-silicon-preview-7 }
## Apple Silicon プレビュー 7 以降の修正
@z

@x
**Docker Desktop preview 3.1.0 (60984)**

2021-02-11
@y
**Docker Desktop プレビュー 3.1.0 (60984)**

2021-02-11
@z

@x
- Kubernetes now works (although you might need to reset the cluster in our Troubleshoot menu one time to regenerate the certificates).
- osxfs file sharing works.
- The `host.docker.internal` and `vm.docker.internal` DNS entries now resolve.
- Removed hard-coded IP addresses: Docker Desktop now dynamically discovers the IP allocated by macOS.
- The updated version includes a  change that should improve disk performance.
- The **Restart** option in the Docker menu works.
@y
- Kubernetes は動作するようになりました。
  （ただし証明書を再生成した際には、Troubleshoot メニューからクラスターの再起動が必要になる場合があります。）
- osxfs ファイル共有は動作するようになりました。
- DNS エントリ`host.docker.internal`、`vm.docker.internal`は解決できるようになりました。
- ハードコーディングされた IP アドレスを除きました。
  したがって Docker Desktop は macOS から割り当てられた IP アドレスを動的に検出します。
- 更新バージョンには、ディスク性能を向上させる変更を含んでいます。
- Docker メニューの **Restart**（再起動）オプションは動作するようになりました。
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
Thank you for trying out the Docker Desktop for Apple M1 tech preview. Your feedback is important to us. Let us know your feedback by creating an issue in the [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues){: target="blank" rel="noopener" class=“”} repository.
@y
Docker Desktop の Apple M1 技術プレビューを試していただきありがとうございます。
みなさんからのフィードバックを頂くことが重要です。
フィードバックは [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues){: target="blank" rel="noopener" class=“”} リポジトリに issue を生成してお知らせください。
@z

@x
We also recommend that you join the [Docker Community Slack](https://www.docker.com/docker-community){: target="blank" rel="noopener" class=“”} and ask questions in **#docker-desktop-mac** channel.
@y
また [Docker Community Slack](https://www.docker.com/docker-community){: target="blank" rel="noopener" class=“”} に参加し、**#docker-desktop-mac** チャネルに質問をあげていただくことをお勧めします。
@z

@x
For more information about the tech preview, see our blog post [Download and Try the Tech Preview of Docker Desktop for M1](https://www.docker.com/blog/download-and-try-the-tech-preview-of-docker-desktop-for-m1/){: target="blank" rel="noopener" class=“”}.
@y
技術プレビューの詳細については、ブログ投稿 [Docker Desktop for M1 技術プレビュー版のダウンロードと実行](https://www.docker.com/blog/download-and-try-the-tech-preview-of-docker-desktop-for-m1/){: target="blank" rel="noopener" class=“”} を参照してください。
@z
