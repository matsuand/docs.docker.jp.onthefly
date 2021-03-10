%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose CLI Tech Preview
keywords: documentation, docs, docker, compose, containers
title: Compose CLI Tech Preview
---
@y
---
description: Compose CLI 技術プレビュー
keywords: documentation, docs, docker, compose, containers
title: Compose CLI 技術プレビュー
---
@z

@x
## New docker compose command
@y
{: #new-docker-compose-command }
## 新しい Docker compose コマンド
@z

@x
> Important
>
> The `compose` command  in the Docker CLI is currently available as a Tech Preview. We recommend that you do not use this in production environments.
>
> Your feedback is important to us. Let us know your feedback on the new 'compose' command by creating an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues){:target="_blank" rel="noopener" class="_"} GitHub repository.
{: .important}
@y
> 重要
>
> Docker CLI の`compose`コマンドが技術プレビュー版として利用可能になりました。
> このコマンドを本番環境において用いることは推奨しません。
>
> みなさんからのフィードバックを頂くことが重要と思っています。
> 新しい 'compose' コマンドに対するフィードバックは、GitHub リポジトリ [Compose-CLI](https://github.com/docker/compose-cli/issues){:target="_blank" rel="noopener" class="_"} において issue を生成してお知らせください。
{: .important}
@z

@x
The Docker CLI now supports the `compose` command, including most of the `docker-compose` features and flags, without the need for a separate tool.
@y
Docker CLI が`compose`コマンドをサポートするようになりました。
`docker-compose`の機能やフラグを、個別のツールなしに利用できるようになります。
@z

@x
You can replace the dash (`-`) with a space when you use `docker-compose` to switch over to `docker compose`. You can also use them interchangeably, so that you are not locked-in with the new `compose` command and, if needed, you can still use `docker-compose`.
@y
これまで`docker-compose`を利用する際のダッシュ（`-`）の部分を空白にするだけで`docker compose`に切り替えることができます。
これは相互に切り替えが可能です。
したがって新たな`compose`コマンドを必ず用いなければいけないというわけではありません。
必要に応じて今でも`docker-compose`を用いることができます。
@z

@x
Introduction of the [Compose specification](https://github.com/compose-spec/compose-spec){:target="_blank" rel="noopener" class="_"} makes a clean distinction between the Compose YAML file model and the `docker-compose` implementation. Making this change has enabled a number of enhancements, including the launch of [Amazon ECS](/cloud/ecs-integration) and [Microsoft ACI](/cloud/aci-integration), being able to “up” a Compose application on cloud platforms simply by switching Docker context, and adding compose command directly into the Docker CLI.
As the Compose specification evolves, new features land faster in the Docker CLI. While `docker-compose` is still supported and maintained, Compose in the Docker CLI Go implementation relies directly on the compose-go bindings which are maintained as part of the specification. This allows us to include community proposals, experimental implementations by the Docker CLI and/or Engine, and deliver features faster to users. Compose in the Docker CLI already supports some of the newer additions to the Compose specification such as profiles and GPU devices.
@y
[Compose specification](https://github.com/compose-spec/compose-spec){:target="_blank" rel="noopener" class="_"}（Compose 仕様）においては、Compose YAML ファイルモデルと`docker-compose`実装の違いについて説明しています。
これを切り替えて利用することは数多くの拡張を可能にします。
たとえば [Amazon ECS]({{ site.baseurl }}/cloud/ecs-integration) や [Microsoft ACI]({{ site.baseurl }}/cloud/aci-integration) の稼働にあたって、Docker コンテキストを切り替えるだけでクラウド上の Compose アプリケーションの「up」を行うことができます。
compose コマンドが直接 Docker CLI に追加されています。
Compose 仕様は進化を続けているので、Docker CLI への新たな機能の導入は素早く実現されます。
`docker-compose`は今後もサポートされメンテナンスが行われます。
ただし Docker CLI 内の compose を実現する Go 言語の実装は、compose-go バインディングに直接依存するものであり、これは Compose 仕様の一部としてメンテナンスされているものです。
このためコミュニティによる提案、Docker CLI や Engine の試験的実装が容易になり、ユーザーへの機能提供を迅速にすることができます。
Docker CLI における comose コマンドでは、プロファイルや GPU デバイスなどのように、Compose 仕様に新たに加えられた機能をすでにサポートしているものもあります。
@z

@x
For more information about the flags that are not yet supported in the new `compose` command, see the [docker-compose compatibility list](cli-command-compatibility.md).
@y
新たな`compose`コマンドにおいて、またサポートされていないフラグに関しては [docker-compose 互換性一覧](cli-command-compatibility.md) を参照してください。
@z

@x
## Installing the Compose CLI Tech Preview
@y
{: #installing-the-compose-cli-tech-preview }
## Compose CLI 技術プレビューのインストール
@z

@x
### Install Compose CLI Tech Preview on Mac and Windows
@y
{: #install-compose-cli-tech-preview-on-mac-and-windows }
### Mac または Windows における Compose CLI 技術プレビューのインストール
@z

@x
**Docker Desktop for Mac and for Windows** version 3.2.1 and above includes the new Compose command along with the Docker CLI. Therefore, Windows and Mac users do not need to install the Compose CLI Tech Preview separately.
@y
**Docker Desktop for Mac および for Windows** のバージョン 3.2.1 またはそれ以降には、Docker CLI に新たな compose コマンドが含まれます。
したがって Windows と Mac のユーザーは、個別にインストールする必要はありません。
@z

@x
For Docker Desktop installation instructions, see:
@y
Docker Desktop のインストール手順は以下を参照してください。
@z

@x
- [Install Docker Desktop on Mac](../docker-for-mac/install.md)
- [Install Docker Desktop on Windows](../docker-for-windows/install.md).
@y
- [Docker Desktop の Mac へのンストール](../docker-for-mac/install.md)
- [Docker Desktop の Windows へのンストール](../docker-for-windows/install.md).
@z

@x
### Install Compose CLI Tech Preview on Linux
@y
{: #install-compose-cli-tech-preview-on-linux }
### Linux における Compose CLI 技術プレビューのインストール
@z

@x
You can install the new Compose CLI, including this Tech Preview, using the following install script:
@y
新たな Compose CLI コマンドをインストールするのであれば、技術プレビューが含まれます。
インストールには以下のスクリプトを実行します。
@z

@x
```console
curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
```
@y
```console
curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
```
@z
