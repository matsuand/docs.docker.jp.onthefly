%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop overview
keywords: Desktop, Docker, GUI, run, docker, local, machine
title: Docker Desktop overview
toc_min: 1
toc_max: 2
---
@y
---
description: Docker Desktop の概要。
keywords: Desktop, Docker, GUI, run, docker, local, machine
title: Docker Desktop 概要
toc_min: 1
toc_max: 2
---
@z

@x
Docker Desktop is an easy-to-install application for your Mac or Windows environment that enables you to build and share containerized applications and microservices. Docker Desktop includes [Docker Engine](../engine/), Docker CLI client, [Docker Compose](../compose/), [Docker Content Trust](../engine/security/trust.md), [Kubernetes](https://github.com/kubernetes/kubernetes/), and [Credential Helper](https://github.com/docker/docker-credential-helpers/).
@y
Docker Desktop は Mac や Windows に簡単にインストールできるアプリケーションです。
これにより、コンテナー化アプリケーションやマイクロサービスを構築し共有することができます。
Docker Desktop には [Docker Engine](../engine/)、Docker CLI クライアント、[Docker Compose](../compose/)、[Docker コンテントトラスト](../engine/security/trust.md)、[Kubernetes](https://github.com/kubernetes/kubernetes/)、[Credential Helper](https://github.com/docker/docker-credential-helpers/) が含まれます。
@z

@x
Docker Desktop works with your choice of development tools and languages and gives you access to a vast library of certified images and templates in [Docker Hub](https://hub.docker.com/). This enables development teams to extend their environment to rapidly auto-build, continuously integrate and collaborate using a secure repository.
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
* [Install Docker Desktop on Mac](../docker-for-mac/install.md)
* [Install Docker Desktop on Windows](../docker-for-windows/install.md)
@y
* [Docker Desktop on Mac のインストール](../docker-for-mac/install.md)
* [Docker Desktop on Windows のインストール](../docker-for-windows/install.md)
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
* [Docker Desktop for Mac user manual](../docker-for-mac/index.md)
* [Docker Desktop for Windows user manual](../docker-for-windows/index.md)
@y
* [Docker Desktop for Mac ユーザーマニュアル](../docker-for-mac/index.md)
* [Docker Desktop for Windows ユーザーマニュアル](../docker-for-windows/index.md)
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
* [Docker Desktop for Mac Release notes](../docker-for-mac/release-notes.md)
* [Docker Desktop for Windows Release notes](../docker-for-windows/release-notes.md)
@y
* [Docker Desktop for Mac リリースノート](../docker-for-mac/release-notes.md)
* [Docker Desktop for Windows リリースノート](../docker-for-windows/release-notes.md)
@z
