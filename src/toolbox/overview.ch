%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
advisory: toolbox
description: Documentation that provides an overview of Toolbox
keywords: docker, documentation, about, technology, kitematic, gui, toolbox
title: Docker Toolbox overview
---
@y
---
advisory: toolbox
description: Toolbox の概要を説明
keywords: docker, documentation, about, technology, kitematic, gui, toolbox
title: Docker Toolbox 概要
---
@z

@x
Docker Toolbox is an installer for quick setup and launch of a Docker environment on older Mac and Windows systems that do not meet the requirements of the new [Docker Desktop for Mac](../docker-for-mac/index.md) and [Docker Desktop for Windows](../docker-for-windows/index.md) apps.
@y
{% comment %}
Docker Toolbox is an installer for quick setup and launch of a Docker environment on older Mac and Windows systems that do not meet the requirements of the new [Docker Desktop for Mac](../docker-for-mac/index.md) and [Docker Desktop for Windows](../docker-for-windows/index.md) apps.
{% endcomment %}
Docker Toolbox は Mac や Windows システム向けの Docker インストーラーです。
これにより Docker 環境をすばやくセットアップして起動できるようになります。
ただし Mac や Windows のやや古いバージョン向けのものであって、そのようなシステムでは、新しい [Docker Desktop for Mac](../docker-for-mac/index.md) や [Docker Desktop for Windows](../docker-for-windows/index.md) の利用要件を満たしません。
@z

@x
![Toolbox installer](images/toolbox-installer.png)
@y
{% comment %}
![Toolbox installer](images/toolbox-installer.png)
{% endcomment %}
![Toolbox インストーラー](images/toolbox-installer.png)
@z

@x
## What's in the box
@y
{% comment %}
## What's in the box
{% endcomment %}
## 中に何があるのか
{: #whats-in-the-box }
@z

@x
Toolbox includes these Docker tools:
@y
{% comment %}
Toolbox includes these Docker tools:
{% endcomment %}
Toolbox には以下のような Docker ツールがあります。
@z

@x
* Docker Machine for running `docker-machine` commands
@y
{% comment %}
* Docker Machine for running `docker-machine` commands
{% endcomment %}
* コマンド `docker-machine` が実行できる Docker Machine
@z

@x
* Docker Engine for running the `docker` commands
@y
{% comment %}
* Docker Engine for running the `docker` commands
{% endcomment %}
* コマンド `docker` が実行できる Docker Engine
@z

@x
* Docker Compose for running the `docker-compose` commands
@y
{% comment %}
* Docker Compose for running the `docker-compose` commands
{% endcomment %}
* コマンド `docker-compose` が実行できる Docker Compose
@z

@x
* Kitematic, the Docker GUI
@y
{% comment %}
* Kitematic, the Docker GUI
{% endcomment %}
* Docker GUI である Kitematic
@z

@x
* a shell preconfigured for a Docker command-line environment
@y
{% comment %}
* a shell preconfigured for a Docker command-line environment
{% endcomment %}
* Docker コマンドライン環境として用意されているシェル
@z

@x
* Oracle VirtualBox
@y
* Oracle VirtualBox
@z

@x
You can find various versions of the tools on [Toolbox Releases](https://github.com/docker/toolbox/releases) or run them with the `--version` flag in the terminal, for example, `docker-compose --version`.
@y
{% comment %}
You can find various versions of the tools on [Toolbox Releases](https://github.com/docker/toolbox/releases) or run them with the `--version` flag in the terminal, for example, `docker-compose --version`.
{% endcomment %}
[Toolbox リリース](https://github.com/docker/toolbox/releases) には、各種ツールのさまざまなバージョンがあります。
またターミナル画面上から `-version` フラグをつけて実行すればバージョンが分かります。
たとえば `docker-compose --version` などとします。
@z

@x
## Ready to get started?
@y
{% comment %}
## Ready to get started?
{% endcomment %}
## 準備はできている？
{: #ready-to-get-started }
@z

@x
Choose the install instructions for your platform, and follow the steps:
@y
{% comment %}
Choose the install instructions for your platform, and follow the steps:
{% endcomment %}
それぞれのプラットフォームに応じたインストール手順を選んで、その手順を進めます。
@z

@x
 - [Install Docker Toolbox for macOS](toolbox_install_mac.md)
@y
 {% comment %}
 - [Install Docker Toolbox for macOS](toolbox_install_mac.md)
 {% endcomment %}
 - [Docker Toolbox on macOS のインストール](toolbox_install_mac.md)
@z

@x
 - [Install Docker Toolbox for Windows](toolbox_install_windows.md)
@y
 {% comment %}
 - [Install Docker Toolbox for Windows](toolbox_install_windows.md)
 {% endcomment %}
 - [Docker Toolbox for Windows のインストール](toolbox_install_windows.md)
@z

@x
## Next steps
@y
{% comment %}
## Next steps
{% endcomment %}
## 次のステップ
{: #next-steps }
@z

@x
* Try the [Get started](../get-started/index.md) tutorial.
@y
{% comment %}
* Try the [Get started](../get-started/index.md) tutorial.
{% endcomment %}
* チュートリアル [「はじめよう」](../get-started/index.md) を試す。
@z

@x
* Dig in deeper with [more tutorials and examples](../engine/tutorials/index.md) on building images, running containers, networking, managing data, and storing images on Docker Hub.
@y
{% comment %}
* Dig in deeper with [more tutorials and examples](../engine/tutorials/index.md) on building images, running containers, networking, managing data, and storing images on Docker Hub.
{% endcomment %}
* [さらなるチュートリアルと例](../engine/tutorials/index.md) を読んで、イメージ構築、コンテナー実行、ネットワーク、データ管理、Docker Hub へのイメージ保存に進む。
@z

@x
* [Learn about Kitematic](../kitematic/userguide.md)
@y
{% comment %}
* [Learn about Kitematic](../kitematic/userguide.md)
{% endcomment %}
* [Kitematic について学ぶ](../kitematic/userguide.md)
@z

@x
* [Learn about Docker Machine](../machine/overview.md)
@y
{% comment %}
* [Learn about Docker Machine](../machine/overview.md)
{% endcomment %}
* [Docker Machine について学ぶ](../machine/overview.md)
@z

@x
* [Learn about Docker Compose](../compose/index.md)
@y
{% comment %}
* [Learn about Docker Compose](../compose/index.md)
{% endcomment %}
* [Docker Compose について学ぶ](../compose/overview.md)
@z
