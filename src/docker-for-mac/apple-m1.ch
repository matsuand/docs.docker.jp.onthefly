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
> [Download](https://desktop.docker.com/mac/m1preview/Docker-AppleSilicon-Preview7.dmg)
@y
> [ダウンロード](https://desktop.docker.com/mac/m1preview/Docker-AppleSilicon-Preview7.dmg)
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
- You must install Rosetta 2 as some binaries are still Darwin/AMD64.
- The DNS name `host.docker.internal` only works if you add `--add-host=host.docker.internal:host-gateway` to the `docker run` command
- The DNS name `vm.docker.internal` does not work.
- Kubernetes does not initialize because of a missing DNS name.
- osxfs file sharing does not work.
- The HTTP proxy is not enabled.
- Not all images are available for ARM64. You can add `--platform linux/amd64` to run an Intel image under emulation.
@y
- 技術プレビュービルドは自動アップデートされません。
  最新バージョンは手動インストールすることが必要です。
- 実行バイナリが Darwin/AMD64 向けのものがあるため、Rosetta 2 をインストールする必要があります。
- DNS 名`host.docker.internal`は、`docker run`コマンドに対して`--add-host=host.docker.internal:host-gateway`をつけた場合にのみ動作します。
- DNS 名`vm.docker.internal`は動作しません。
- Kubernetes は DNS 名がないため初期化されません。
- osxfs ファイル共有は動作しません。
- HTTP プロキシーは利用できません。
- ARM64 向けのイメージはすべてが利用可能ではありません。
  Intel イメージはエミュレーションのもと、`--platform linux/amd64`をつけて実行することができます。
@z

@x
    In particular, the [mysql](https://hub.docker.com/_/mysql?tab=tags&page=1&ordering=last_updated){: target="blank" rel="noopener" class=“”} image is not available for ARM64. You can work around this issue by using a [mariadb](https://hub.docker.com/_/mariadb?tab=tags&page=1&ordering=last_updated){: target="blank" rel="noopener" class=“”} image.
- The kernel may panic. If so, look in `~/Library/Containers/com.docker.docker/Data/vms/0/console.log` for a BUG or kernel panic to report.
- The **Restart** option in the Docker menu may not work.
@y
    特に [mysql](https://hub.docker.com/_/mysql?tab=tags&page=1&ordering=last_updated){: target="blank" rel="noopener" class=“”} イメージは ARM64 において利用できません。
    この状況は [mariadb](https://hub.docker.com/_/mariadb?tab=tags&page=1&ordering=last_updated){: target="blank" rel="noopener" class=“”} イメージを利用すれば解消されます。
- カーネルがパニックを発生させるかもしれません。
  その場合は`~/Library/Containers/com.docker.docker/Data/vms/0/console.log`の内容から、バグなのかカーネルパニックなのかを確認し報告してください。
- Docker メニューの **Restart**（再起動）オプションは動作しない場合があります。
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
