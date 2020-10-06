%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Migrate from Boot2Docker to Docker Machine
keywords: machine, commands, boot2docker, migrate, docker
title: Migrate from Boot2Docker to Machine
hide_from_sitemap: true
---
@y
---
description: Migrate from Boot2Docker to Docker Machine
keywords: machine, commands, boot2docker, migrate, docker
title: Boot2Docker から Machine への移行
hide_from_sitemap: true
---
@z

@x
If you were using Boot2Docker previously, you have a pre-existing Docker
`boot2docker-vm` VM on your local system. To allow Docker Machine to manage
this older VM, you must migrate it.
@y
{% comment %}
If you were using Boot2Docker previously, you have a pre-existing Docker
`boot2docker-vm` VM on your local system. To allow Docker Machine to manage
this older VM, you must migrate it.
{% endcomment %}
以前から Boot2Docker を利用しているなら、`boot2docker-vm` VM がローカルシステムに存在していることになります。
こういった古い VM を Docker Machine が扱えるようにするには移行が必要になります。
@z

@x
1.  Open a terminal or the Docker CLI on your system.
@y
{% comment %}
1.  Open a terminal or the Docker CLI on your system.
{% endcomment %}
1.  ターミナルまたはシステム上の Docker CLI を開きます。
@z

@x
2.  Type the following command.
@y
{% comment %}
2.  Type the following command.
{% endcomment %}
2.  以下のコマンドを入力します。
@z

@x
        $ docker-machine create -d virtualbox --virtualbox-import-boot2docker-vm boot2docker-vm docker-vm
@y
        $ docker-machine create -d virtualbox --virtualbox-import-boot2docker-vm boot2docker-vm docker-vm
@z

@x
3.  Use the `docker-machine` command to interact with the migrated VM.
@y
{% comment %}
3.  Use the `docker-machine` command to interact with the migrated VM.
{% endcomment %}
3.  移行された VM に対しては`docker-machine`コマンドを使って操作します。
@z

@x
## Subcommand comparison
@y
{% comment %}
## Subcommand comparison
{% endcomment %}
{: #subcommand-comparison }
## サブコマンドの比較
@z

@x
The `docker-machine` subcommands are slightly different than the `boot2docker`
subcommands. The table below lists the equivalent `docker-machine` subcommand
and what it does:
@y
{% comment %}
The `docker-machine` subcommands are slightly different than the `boot2docker`
subcommands. The table below lists the equivalent `docker-machine` subcommand
and what it does:
{% endcomment %}
`docker-machine`のサブコマンドは、`boot2docker`のサブコマンドとは微妙に異なります。
以下の表では、対応する`docker-machine`サブコマンドとその動作について示しています。
@z

@x
| `boot2docker` | `docker-machine` | `docker-machine` description                                                      |
| ------------- | ---------------- | --------------------------------------------------------------------------------- |
| init          | create           | Creates a new docker host.                                                        |
| up            | start            | Starts a stopped machine.                                                         |
| ssh           | ssh              | Runs a command or interactive ssh session on the machine.                         |
| save          | -                | Not applicable.                                                                   |
| down          | stop             | Stops a running machine.                                                          |
| poweroff      | stop             | Stops a running machine.                                                          |
| reset         | restart          | Restarts a running machine.                                                       |
| config        | inspect          | Prints machine configuration details.                                             |
| status        | ls               | Lists all machines and their status.                                              |
| info          | inspect          | Displays a machine's details.                                                     |
| ip            | ip               | Displays the machine's IP address.                                                |
| shellinit     | env              | Displays shell commands needed to configure your shell to interact with a machine |
| delete        | rm               | Removes a machine.                                                                |
| download      | -                | Not applicable.                                                                   |
| upgrade       | upgrade          | Upgrades a machine's Docker client to the latest stable release.                  |
@y
{% comment %}
| `boot2docker` | `docker-machine` | `docker-machine` description                                                      |
| ------------- | ---------------- | --------------------------------------------------------------------------------- |
| init          | create           | Creates a new docker host.                                                        |
| up            | start            | Starts a stopped machine.                                                         |
| ssh           | ssh              | Runs a command or interactive ssh session on the machine.                         |
| save          | -                | Not applicable.                                                                   |
| down          | stop             | Stops a running machine.                                                          |
| poweroff      | stop             | Stops a running machine.                                                          |
| reset         | restart          | Restarts a running machine.                                                       |
| config        | inspect          | Prints machine configuration details.                                             |
| status        | ls               | Lists all machines and their status.                                              |
| info          | inspect          | Displays a machine's details.                                                     |
| ip            | ip               | Displays the machine's IP address.                                                |
| shellinit     | env              | Displays shell commands needed to configure your shell to interact with a machine |
| delete        | rm               | Removes a machine.                                                                |
| download      | -                | Not applicable.                                                                   |
| upgrade       | upgrade          | Upgrades a machine's Docker client to the latest stable release.                  |
{% endcomment %}
| `boot2docker` | `docker-machine` | `docker-machine`の内容説明                                               |
| ------------- | ---------------- | ------------------------------------------------------------------------ |
| init          | create           | 新たな Docker ホストを生成します。                                       |
| up            | start            | 停止中のマシンを起動します。                                             |
| ssh           | ssh              | マシン上においてコマンドあるいは対話的 SSH セッションを起動します。      |
| save          | -                | 対応するコマンドはありません。                                           |
| down          | stop             | 実行中のマシンを停止します。                                             |
| poweroff      | stop             | 実行中のマシンを停止します。                                             |
| reset         | restart          | 実行中のマシンを再起動します。                                           |
| config        | inspect          | マシン設定の詳細を表示します。                                           |
| status        | ls               | マシンとそのステータスを一覧表示します。                                 |
| info          | inspect          | マシンの詳細を表示します。                                               |
| ip            | ip               | マシンの IP アドレスを表示します。                                       |
| shellinit     | env              | 利用するシェルがマシンを操作できるようにするシェルコマンドを表示します。 |
| delete        | rm               | マシンを削除します。                                                     |
| download      | -                | 対応するコマンドはありません。                                           |
| upgrade       | upgrade          | マシンの Docker クライアントを最新の安定版にアップグレードします。       |
@z
