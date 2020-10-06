%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Upgrade Docker on a machine
keywords: machine, upgrade, subcommand
title: docker-machine upgrade
hide_from_sitemap: true
---
@y
---
description: マシン上の Docker をアップグレードします。
keywords: machine, upgrade, subcommand
title: docker-machine upgrade
hide_from_sitemap: true
---
@z

@x
Upgrade a machine to the latest version of Docker. How this upgrade happens
depends on the underlying distribution used on the created instance.
@y
{% comment %}
Upgrade a machine to the latest version of Docker. How this upgrade happens
depends on the underlying distribution used on the created instance.
{% endcomment %}
マシンを最新の Docker にアップグレードします。
アップグレードがどのようにして行われるかは、インスタンスの生成に用いたディストリビューションに従います。
@z

@x
For example, if the machine uses Ubuntu as the underlying operating system, it
runs a command similar to `sudo apt-get upgrade docker-engine`, because
Machine expects Ubuntu machines it manages to use this package. As another
example, if the machine uses boot2docker for its OS, this command downloads
the latest boot2docker ISO and replace the machine's existing ISO with the
latest.
@y
{% comment %}
For example, if the machine uses Ubuntu as the underlying operating system, it
runs a command similar to `sudo apt-get upgrade docker-engine`, because
Machine expects Ubuntu machines it manages to use this package. As another
example, if the machine uses boot2docker for its OS, this command downloads
the latest boot2docker ISO and replace the machine's existing ISO with the
latest.
{% endcomment %}
たとえば、マシンが用いられているオペレーティングシステムが Ubuntu である場合、`sudo apt-get upgrade docker-engine` に相当するコマンドが実行されます。
Ubuntu マシンがこのパッケージを管理しているものとして Docker Machine が判断するからです。
また別の例として、マシンが boot2docker を OS として利用している場合は、そのコマンドは最新の boot2docker ISO をダウンロードして、マシンが利用している ISO を最新のものに置き換えます。
@z

@x
```bash
$ docker-machine upgrade default

Stopping machine to do the upgrade...
Upgrading machine default...
Downloading latest boot2docker release to /home/username/.docker/machine/cache/boot2docker.iso...
Starting machine back up...
Waiting for VM to start...
```
@y
```bash
$ docker-machine upgrade default

Stopping machine to do the upgrade...
Upgrading machine default...
Downloading latest boot2docker release to /home/username/.docker/machine/cache/boot2docker.iso...
Starting machine back up...
Waiting for VM to start...
```
@z

@x
> **Note**: If you are using a custom boot2docker ISO specified using
> `--virtualbox-boot2docker-url` or an equivalent flag, running an upgrade on
> that machine completely replaces the specified ISO with the latest
> "vanilla" boot2docker ISO available.
@y
{% comment %}
> **Note**: If you are using a custom boot2docker ISO specified using
> `--virtualbox-boot2docker-url` or an equivalent flag, running an upgrade on
> that machine completely replaces the specified ISO with the latest
> "vanilla" boot2docker ISO available.
{% endcomment %}
> **メモ**: `--virtualbox-boot2docker-url` またはこれに相当するフラグを用いて boot2docker のカスタム ISO を利用している場合、そのマシン上においてアップグレードを行うと、指定した ISO は、最新 boot2docker の「バニラ」ISO に完全に置き換えられます。
@z
