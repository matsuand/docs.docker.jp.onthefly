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
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) now requires a paid
> subscription. The grace period for those that will require a paid subscription
> ends on January 31, 2022. [Learn more](https://www.docker.com/blog/the-grace-period-for-the-docker-subscription-service-agreement-ends-soon-heres-what-you-need-to-know/){:
 target="_blank" rel="noopener" class="_" id="dkr_docs_cta"}.
{: .important}
@y
> **Docker Desktop 利用契約の更新**
>
> 大規模エンタープライズ (従業員 250名以上、または年間収益 1 千万 US ドル以上) 向けの商用利用に対しては、有償サブスクリプションが必要です。
> この有償サブスクリプションには、2022 年 1 月 31 日までの猶予期間が設けられています。
> 詳しくは [こちら](https://www.docker.com/blog/the-grace-period-for-the-docker-subscription-service-agreement-ends-soon-heres-what-you-need-to-know/){:
 target="_blank" rel="noopener" class="_" id="dkr_docs_cta"} を参照してください。
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
Docker Desktop のライセンスに関する詳細は、[Docker Desktop 利用契約](../subscription/index.md#docker-desktop-license-agreement) を参照してください。
@z

@x
## Sign in to Docker Desktop
@y
{: #sign-in-to-docker-desktop }
## Docker Desktop へのサインイン
@z

@x
After you’ve successfully installed and started Docker Desktop, we recommend that you authenticate using the **Sign in/Create ID** option from the Docker menu.
@y
Docker Desktop のインストールを終えてこれを起動したら、Docker メニューの **Sign in/Create ID**（サインイン/ID 生成）を使って、認証を行うことをお勧めします。
@z

@x
Authenticated users get a higher pull rate limit compared to anonymous users. For example, if you are authenticated, you get 200 pulls per 6 hour period, compared to 100 pulls per 6 hour period per IP address for anonymous users. For more information, see [Download rate limit](../docker-hub/download-rate-limit.md).
@y
認証を行ったユーザーは匿名ユーザーよりも、より高いプル制限率を得ることができます。
たとえば認証を行っていると、6 時間以内において 200 プルを行うことができます。
これが匿名ユーザーになると、その IP アドレスに対して 6 時間以内では 100 プルしか行うことができません。
より詳しい情報は [ダウンロードレート制限](../docker-hub/download-rate-limit.md) を参照してください。
@z

@x
Authenticating through Docker Desktop also allows administrators to configure Docker Desktop and set up guardrails using the [Image Access Management](../docker-hub/image-access-management.md) feature to allow team members to:
@y
Docker Desktop を通じて認証を行っておくと、管理者が Docker Desktop を設定できるようになります。
そして [イメージアクセス管理](../docker-hub/image-access-management.md) 機能を利用して、チームメンバーに対して、以下のような操作制限を行うことができます。
@z

@x
* Only have access to Trusted Content on Docker Hub
* Pull only from the specified categories of images
@y
* Docker Hub 上のトラストコンテントのみにアクセスできるようにします。
* 特定カテゴリーのイメージのみプルできるようにします。
@z

@x
To authenticate using Docker Desktop, click the **Sign in/Create ID** option on the Docker menu and follow the on-screen instructions.
@y
Docker Desktop を使って認証を行うには、Docker メニュー内の **Sign in/Create ID**（サインイン/ID 生成）オプションをクリックして、画面説明に従って操作します。
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
