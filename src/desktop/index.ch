%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop overview
keywords: Desktop, Docker, GUI, run, docker, local, machine
title: Docker Desktop overview
toc_min: 1
toc_max: 2
redirect_from:
- /desktop/opensource/
- /docker-for-mac/opensource/
- /docker-for-windows/opensource/
---
@y
---
description: Docker Desktop の概要。
keywords: Desktop, Docker, GUI, run, docker, local, machine
title: Docker Desktop 概要
toc_min: 1
toc_max: 2
redirect_from:
- /desktop/opensource/
- /docker-for-mac/opensource/
- /docker-for-windows/opensource/
---
@z

@x
> **Update to the Docker Desktop terms**
>
> Professional use of Docker Desktop in large organizations (more than 250 employees or more than $10 million in revenue) requires users to have a paid Docker subscription. While the effective date of these terms is August 31, 2021, there is a grace period until January 31, 2022 for those that require a paid subscription. For more information, see [Docker Desktop License Agreement](../subscription/index.md#docker-desktop-license-agreement).
{: .important}
@y
> **Docker Desktop 利用契約の更新**
>
> 大規模エンタープライズ向けの Docker Desktop のプロフェッショナル利用 (従業員 250名以上、または年間収益 1,000 万ドル以上) に対しては、有償の Docker サブスクリプションが必要です。
> この条件の適用開始日は 2021 年 8 月31 日です。
> Docker Deskop の利用に有償サブスクリプションが必要とされるものであっても、 2022 年 1 月 31 日までは猶予期間が設けられています。
> 詳しくは [Docker Desktop ライセンス契約](../subscription/index.md#docker-desktop-license-agreement) を参照してください。
{: .important}
@z

@x
Docker Desktop is an easy-to-install application for your Mac or Windows environment
that enables you to build and share containerized applications and microservices.
Docker Desktop includes [Docker Engine](../engine/index.md), Docker CLI client,
[Docker Compose](../compose/index.md), [Docker Content Trust](../engine/security/trust/index.md),
[Kubernetes](https://github.com/kubernetes/kubernetes/), and 
[Credential Helper](https://github.com/docker/docker-credential-helpers/).
@y
Docker Desktop は Mac や Windows に簡単にインストールできるアプリケーションです。
これにより、コンテナー化アプリケーションやマイクロサービスを構築し共有することができます。
Docker Desktop には [Docker Engine](../engine/index.md)、Docker CLI クライアント、[Docker Compose](../compose/index.md)、[Docker コンテントトラスト](../engine/security/trust/index.md)、[Kubernetes](https://github.com/kubernetes/kubernetes/)、[Credential Helper](https://github.com/docker/docker-credential-helpers/) が含まれます。
@z

@x
Docker Desktop works with your choice of development tools and languages and
gives you access to a vast library of certified images and templates in
[Docker Hub](https://hub.docker.com/). This enables development teams to extend
their environment to rapidly auto-build, continuously integrate, and collaborate
using a secure repository.
@y
Docker Desktop は、選択した開発ツールやプログラミング言語を使って動作します。
そして [Docker Hub](https://hub.docker.com/) にある認定イメージやテンプレートに対しての、数多くのライブラリにアクセスできるようになります。
これにより開発チームの環境を充足させ、セキュアなリポジトリを使ってすばやく自動ビルドを行って、継続的な開発や共同開発を行えるようになります。
@z

@x
Some of the key features of Docker Desktop include:
@y
Docker Desktop の主な特徴としては、以下のものがあります。
@z

@x
* Ability to containerize and share any application on any cloud platform, in multiple languages and frameworks
* Easy installation and setup of a complete Docker development environment
* Includes the latest version of Kubernetes
* Automatic updates to keep you up to date and secure
* On Windows, the ability to toggle between Linux and Windows Server environments to build applications
* Fast and reliable performance with native Windows Hyper-V virtualization
* Ability to work natively on Linux through WSL 2 on Windows machines
* Volume mounting for code and data, including file change notifications and easy access to running containers on the localhost network
* In-container development and debugging with supported IDEs
@y
* どのようなクラウドプラットフォーム上においても、いろいろなアプリケーションをコンテナー化し共有することができます。複数のプログラミング言語やフレームワークにも対応します。
* 完全な Docker 開発環境を、簡単にインストールし設定することができます。
* 最新版の Kubernetes を提供します。
* 自動アップデートを通じて、最新で安全な開発環境を確保します。
* Windows においは、Linux と Windows Server を切り替えてアプリケーションを構築できます。
* Windows のネイティブな Hyper-V 仮想技術を利用して、高速かつ信頼できる性能を提供します。
* Windows マシン上の WSL 2 を通じて、Linux ネイティブのように機能します。
* ソースコードやデータに対してボリュームマウントを可能にします。
  ファイル更新の通知機能や、ローカルホストのネットワーク上で稼動するコンテナーへの簡単なアクセス機能を提供します。
* サポートされている統合開発環境を使って、コンテナー内での開発とデバッグを実現します。
@z

@x
## Download and install
@y
{: #download-and-install }
## ダウンロードとインストール
@z

@x
Docker Desktop is available for Mac and Windows. For download information, system requirements, and installation instructions, see:
@y
Docker Desktop は Mac と Windows において利用できます。
ダウンロード情報、システム要件、インストール手順は、以下を参照してください。
@z

@x
* [Install Docker Desktop on Mac](mac/install.md)
* [Install Docker Desktop on Windows](windows/install.md)
@y
* [Docker Desktop on Mac のインストール](mac/install.md)
* [Docker Desktop on Windows のインストール](windows/install.md)
@z

@x
For information about Docker Desktop licensing, see [Docker Desktop License Agreement](../subscription/index.md#docker-desktop-license-agreement).
@y
For information about Docker Desktop licensing, see [Docker Desktop License Agreement](../subscription/index.md#docker-desktop-license-agreement).
@z

@x
## Configure Docker Desktop
@y
{: #configure-docker-desktop }
## Docker Desktop の設定
@z

@x
To learn about the various UI options and their usage, see:
@y
さまざまな UI オプションとその利用方法については、以下を参照してください。
@z

@x
* [Docker Desktop for Mac user manual](mac/index.md)
* [Docker Desktop for Windows user manual](windows/index.md)
@y
* [Docker Desktop for Mac ユーザーマニュアル](mac/index.md)
* [Docker Desktop for Windows ユーザーマニュアル](windows/index.md)
@z

@x
## Release notes
@y
{: #release-notes }
## リリースノート
@z

@x
For information about new features, improvements, and bug fixes in Docker Desktop releases, see:
@y
Docker Desktop リリースにおける新機能、修正、バグフィックスについては、以下を参照してください。
@z

@x
* [Docker Desktop for Mac Release notes](mac/release-notes/index.md)
* [Docker Desktop for Windows Release notes](windows/release-notes/index.md)
@y
* [Docker Desktop for Mac リリースノート](mac/release-notes/index.md)
* [Docker Desktop for Windows リリースノート](windows/release-notes/index.md)
@z
