%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to keep containers running when the daemon isn't available.
keywords: docker, upgrade, daemon, dockerd, live-restore, daemonless container
title: Keep containers alive during daemon downtime
redirect_from:
- /engine/admin/live-restore/
---
@y
---
description: デーモンが利用できないときでも、コンテナーを起動し続ける方法を示します。
keywords: docker, upgrade, daemon, dockerd, live-restore, daemonless container
title: デーモン停止時のコンテナー継続起動
redirect_from:
- /engine/admin/live-restore/
---
@z

@x
By default, when the Docker daemon terminates, it shuts down running containers.
Starting with Docker Engine 1.12, you can configure the daemon so that
containers remain running if the daemon becomes unavailable. This functionality
is called _live restore_. The live restore option helps reduce container
downtime due to daemon crashes, planned outages, or upgrades.
@y
{% comment %}
By default, when the Docker daemon terminates, it shuts down running containers.
Starting with Docker Engine 1.12, you can configure the daemon so that
containers remain running if the daemon becomes unavailable. This functionality
is called _live restore_. The live restore option helps reduce container
downtime due to daemon crashes, planned outages, or upgrades.
{% endcomment %}
Docker デーモンが停止すると、デフォルトでは起動中のコンテナーも停止します。
Docker Engine 1.12 から導入された機能として、デーモンが利用できなくなってもコンテナーが起動し続けるように設定できるようになりました。
この機能のことを **ライブリストア**（live restore）と呼びます。
ライブリストアのオプションを使えば、デーモンの障害時、計画停電時、システム更新時などに伴うコンテナーのダウンタイムを軽減できます。
@z

@x
> **Note**
>
> Live restore is not supported on Windows containers, but it does work for
> Linux containers running on Docker Desktop for Windows.
@y
{% comment %}
> **Note**
>
> Live restore is not supported on Windows containers, but it does work for
> Linux containers running on Docker Desktop for Windows.
{% endcomment %}
> **メモ**
>
> ライブリストアは Windows コンテナーに対応していません。
> ただし Docker Desktop for Windows 上にて動作する Linux コンテナーには対応しています。
@z

@x
## Enable live restore
@y
{% comment %}
## Enable live restore
{% endcomment %}
{: #enable-live-restore }
## ライブリストア有効化
@z

@x
There are two ways to enable the live restore setting to keep containers alive
when the daemon becomes unavailable. **Only do one of the following**.
@y
{% comment %}
There are two ways to enable the live restore setting to keep containers alive
when the daemon becomes unavailable. **Only do one of the following**.
{% endcomment %}
ライブリストアを有効にする方法は２つあります。
デーモンが利用不能になっても、これによりコンテナーを起動し続けることができます。
ただしこれを行うのは **２つのうちのいずれか１つ** としてください。
@z

@x
* Add the configuration to the daemon configuration file. On Linux, this
  defaults to `/etc/docker/daemon.json`. On Docker Desktop for Mac or Docker
  Desktop for Windows, select the Docker icon from the task bar, then click
  **Preferences** -> **Daemon** -> **Advanced**.
@y
{% comment %}
* Add the configuration to the daemon configuration file. On Linux, this
  defaults to `/etc/docker/daemon.json`. On Docker Desktop for Mac or Docker
  Desktop for Windows, select the Docker icon from the task bar, then click
  **Preferences** -> **Daemon** -> **Advanced**.
{% endcomment %}
* デーモン設定ファイルに設定を加えます。
  Linux の場合、設定ファイルのデフォルトは `/etc/docker/daemon.json` です。
  また Docker Desktop for Mac あるいは Docker Desktop for Windows の場合は、タスクバー上の Docker アイコンを選び、
  **Preferences** -> **Daemon** -> **Advanced** をクリックします。
@z

@x
  - Use the following JSON to enable `live-restore`.
@y
  {% comment %}
  - Use the following JSON to enable `live-restore`.
  {% endcomment %}
  - 以下の JSON 記述を加えて `live-restore` を有効にします。
@z

@x
    ```json
    {
      "live-restore": true
    }
    ```
@y
    ```json
    {
      "live-restore": true
    }
    ```
@z

@x
  - Restart the Docker daemon. On Linux, you can avoid a restart (and avoid any
    downtime for your containers) by reloading the Docker daemon. If you use
    `systemd`, then use the command `systemctl reload docker`. Otherwise, send a
    `SIGHUP` signal to the `dockerd` process.
@y
  {% comment %}
  - Restart the Docker daemon. On Linux, you can avoid a restart (and avoid any
    downtime for your containers) by reloading the Docker daemon. If you use
    `systemd`, then use the command `systemctl reload docker`. Otherwise, send a
    `SIGHUP` signal to the `dockerd` process.
  {% endcomment %}
  - Docker デーモンを再起動します。
    Linux の場合、再起動はせず（いずれのコンテナー停止も避けるために）Docker デーモンのリロードを行うこともできます。
    `systemd` 利用時は `systemctl reload docker` コマンドを実行します。
    それ以外の場合は `dockerd` プロセスに対して `SIGHUP` シグナルを送信します。
@z

@x
* If you prefer, you can start the `dockerd` process manually with the
  `--live-restore` flag. This approach is not recommended because it does not
  set up the environment that `systemd` or another process manager would use
  when starting the Docker process. This can cause unexpected behavior.
@y
{% comment %}
* If you prefer, you can start the `dockerd` process manually with the
  `--live-restore` flag. This approach is not recommended because it does not
  set up the environment that `systemd` or another process manager would use
  when starting the Docker process. This can cause unexpected behavior.
{% endcomment %}
* 上とは別に、`dockerd` プロセスを手動で起動する際に `--live-restore` フラグを与える方法もあります。
  ただしこの方法は推奨されません。
  この方法によると Docker プロセス起動時に、`systemd` や他のプロセスが利用可能な環境を作り出していないからです。
  このことが予期しない動作となることがあります。
@z

@x
## Live restore during upgrades
@y
{% comment %}
## Live restore during upgrades
{% endcomment %}
{: #live-restore-during-upgrades }
## デーモン更新時のライブリストア
@z

@x
Live restore allows you to keep containers running across Docker daemon updates,
but is only supported when installing patch releases (`YY.MM.x`), not for
major (`YY.MM`) daemon upgrades.
@y
{% comment %}
Live restore allows you to keep containers running across Docker daemon updates,
but is only supported when installing patch releases (`YY.MM.x`), not for
major (`YY.MM`) daemon upgrades.
{% endcomment %}
ライブリストアの機能により、Docker デーモンの更新中でもコンテナーを起動し続けることができます。
ただしパッチリリース (`YY.MM.x`) のインストール時のみが対象であって、メジャーアップデート (`YY.MM`) の場合はサポートされません。
@z

@x
If you skip releases during an upgrade, the daemon may not restore its
connection to the containers. If the daemon can't restore the connection, it
cannot manage the running containers and you must stop them manually.
@y
{% comment %}
If you skip releases during an upgrade, the daemon may not restore its
connection to the containers. If the daemon can't restore the connection, it
cannot manage the running containers and you must stop them manually.
{% endcomment %}
各アップデートのリリースを１度でも取りやめていた場合、デーモンによるコンテナーへの接続が復元できなくなる場合があります。
コンテナーへの接続が復元できなかった場合、起動中のコンテナーを制御できなくなっているので、手動でコンテナーを停止させる必要があります。
@z

@x
## Live restore upon restart
@y
{% comment %}
## Live restore upon restart
{% endcomment %}
{: #live-restore-upon-restart }
## 再起動時のライブリストア
@z

@x
The live restore option only works to restore containers if the daemon options,
such as bridge IP addresses and graph driver, did not change. If any of these
daemon-level configuration options have changed, the live restore may not work
and you may need to manually stop the containers.
@y
{% comment %}
The live restore option only works to restore containers if the daemon options,
such as bridge IP addresses and graph driver, did not change. If any of these
daemon-level configuration options have changed, the live restore may not work
and you may need to manually stop the containers.
{% endcomment %}
ライブリストアのオプションによってコンテナーが復元されるのは、デーモンのオプション、たとえばブリッジ IP アドレスやグラフドライバーなどに変更がない場合に限ります。
そのようなデーモンレベルの設定オプションのいずれかが変更されていた場合、ライブリストアは機能しない場合があります。
そのときは手動でコンテナーを停止させる必要があります。
@z

@x
## Impact of live restore on running containers
@y
{% comment %}
## Impact of live restore on running containers
{% endcomment %}
{: #impact-of-live-restore-on-running-containers }
## 実行コンテナーに対するライブリストアの影響
@z

@x
If the daemon is down for a long time, running containers may fill up the FIFO
log the daemon normally reads. A full log blocks containers from logging more
data. The default buffer size is 64K. If the buffers fill, you must restart
the Docker daemon to flush them.
@y
{% comment %}
If the daemon is down for a long time, running containers may fill up the FIFO
log the daemon normally reads. A full log blocks containers from logging more
data. The default buffer size is 64K. If the buffers fill, you must restart
the Docker daemon to flush them.
{% endcomment %}
デーモンが長い期間停止している場合、実行中のコンテナーが普段デーモンが読み込んでいる FIFO ログを、出力し続けているかもしれません。
ログがあふれてしまうと、コンテナーのログ出力はそれ以上できなくなります。
デフォルトのバッファーサイズは 64K です。
このバッファーがいっぱいになった場合は、これをフラッシュするために Docker デーモンを再起動する必要があります。
@z

@x
On Linux, you can modify the kernel's buffer size by changing
`/proc/sys/fs/pipe-max-size`. You cannot modify the buffer size on Docker Desktop for
Mac or Docker Desktop for Windows.
@y
{% comment %}
On Linux, you can modify the kernel's buffer size by changing
`/proc/sys/fs/pipe-max-size`. You cannot modify the buffer size on Docker Desktop for
Mac or Docker Desktop for Windows.
{% endcomment %}
Linux の場合、`/proc/sys/fs/pipe-max-size` の値を編集することで、カーネルバッファーサイズを変更することができます。
Docker Desktop for Mac や Docker Desktop for Windows では、このバッファサイズを変更することはできません。
@z

@x
## Live restore and swarm mode
@y
{% comment %}
## Live restore and swarm mode
{% endcomment %}
{: #live-restore-and-swarm-mode }
## ライブリストアと Swarm モード
@z

@x
The live restore option only pertains to standalone containers, and not to swarm
services. Swarm services are managed by swarm managers. If swarm managers are
not available, swarm services continue to run on worker nodes but cannot be
managed until enough swarm managers are available to maintain a quorum.
@y
{% comment %}
The live restore option only pertains to standalone containers, and not to swarm
services. Swarm services are managed by swarm managers. If swarm managers are
not available, swarm services continue to run on worker nodes but cannot be
managed until enough swarm managers are available to maintain a quorum.
{% endcomment %}
ライブリストアオプションはスタンドアロンコンテナーに対するものであって、Swarm サービスには適用されません。
Swarm サービスは Swarm マネージャーによって管理されます。
Swarm マネージャーが利用できないときに、Swarm サービスはワーカーノード上において起動を続けます。
ただし Swarm マネージャーが管理できる状態になるまで、Swarm サービスを管理することはできません。
@z
