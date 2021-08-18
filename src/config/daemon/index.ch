%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configuring and troubleshooting the Docker daemon
keywords: docker, daemon, configuration, troubleshooting
redirect_from:
- /engine/articles/chef/
- /engine/articles/configuring/
- /engine/articles/dsc/
- /engine/articles/puppet/
- /engine/admin/configuring/
- /engine/admin/
- /engine/admin/ansible/
- /engine/admin/chef/
- /engine/admin/dsc/
- /engine/admin/puppet/
- /engine/userguide/
- /config/thirdparty/
- /config/thirdparty/ansible/
- /config/thirdparty/chef/
- /config/thirdparty/dsc/
- /config/thirdparty/puppet/

title: Configure and troubleshoot the Docker daemon
---
@y
---
description: Docker デーモンの設定とトラブルシュート
keywords: docker, daemon, configuration, troubleshooting
redirect_from:
- /engine/articles/chef/
- /engine/articles/configuring/
- /engine/articles/dsc/
- /engine/articles/puppet/
- /engine/admin/configuring/
- /engine/admin/
- /engine/admin/ansible/
- /engine/admin/chef/
- /engine/admin/dsc/
- /engine/admin/puppet/
- /engine/userguide/
- /config/thirdparty/
- /config/thirdparty/ansible/
- /config/thirdparty/chef/
- /config/thirdparty/dsc/
- /config/thirdparty/puppet/

title: Docker デーモンの設定とトラブルシュート
---
@z

@x
After successfully installing and starting Docker, the `dockerd` daemon
runs with its default configuration. This topic shows how to customize
the configuration, start the daemon manually, and troubleshoot and debug the
daemon if you run into issues.
@y
Docker を正常にインストールし Docker を起動すると、`dockerd`というデーモンがデフォルト設定により起動します。
ここではその設定のカスタマイズ方法、デーモンの手動起動、問題発生時のトラブルシュートやデバッグについて示します。
@z

@x
## Start the daemon using operating system utilities
@y
{: #start-the-daemon-using-operating-system-utilities }
## OS ユーティリティーによるデーモンの起動
@z

@x
On a typical installation the Docker daemon is started by a system utility,
not manually by a user. This makes it easier to automatically start Docker when
the machine reboots.
@y
標準的なインストールによる Docker デーモンは、ユーザーが手動で起動するものではなく、システムのユーティリティーによって起動されます。
これによりマシン再起動時に、Docker を自動起動させることが簡単になります。
@z

@x
The command to start Docker depends on your operating system. Check the correct
page under [Install Docker](../../engine/install/index.md). To configure Docker
to start automatically at system boot, see
[Configure Docker to start on boot](../../engine/install/linux-postinstall.md#configure-docker-to-start-on-boot).
@y
Docker を起動させるコマンドはオペレーティングシステムによります。
[Docker のインストール](../../engine/install/index.md) の中から適切なページを確認してください。
システム起動時に Docker を自動起動するように設定する場合は [システムブート時の Docker 起動設定](../../engine/install/linux-postinstall.md#configure-docker-to-start-on-boot) を参照してください。
@z

@x
## Start the daemon manually
@y
{: #start-the-daemon-manually }
## デーモンの手動起動
@z

@x
If you don't want to use a system utility to manage the Docker daemon, or
just want to test things out, you can manually run it using the `dockerd`
command. You may need to use `sudo`, depending on your operating system
configuration.
@y
Docker デーモンをシステムユーティリティーによって管理することが望ましくない場合、あるいは何かをすぐにテストしたいといった場合、`dockerd`コマンドを利用してデーモンを手動起動することができます。
このときには`sudo`を必要とするかもしれませんが、そこはオペレーティングシステムでの設定によります。
@z

@x
When you start Docker this way, it runs in the foreground and sends its logs
directly to your terminal.
@y
この方法によって Docker を起動した場合、Docker はフォアグラウンド実行され、出力ログは端末に直接出力されます。
@z

@x
```console
$ dockerd
@y
```console
$ dockerd
@z

@x
INFO[0000] +job init_networkdriver()
INFO[0000] +job serveapi(unix:///var/run/docker.sock)
INFO[0000] Listening for HTTP on unix (/var/run/docker.sock)
```
@y
INFO[0000] +job init_networkdriver()
INFO[0000] +job serveapi(unix:///var/run/docker.sock)
INFO[0000] Listening for HTTP on unix (/var/run/docker.sock)
```
@z

@x
To stop Docker when you have started it manually, issue a `Ctrl+C` in your
terminal.
@y
手動で起動させた Docker を停止するには、端末上で`Ctrl+C`を入力します。
@z

@x
## Configure the Docker daemon
@y
{: #configure-the-docker-daemon }
## デーモンの設定
@z

@x
There are two ways to configure the Docker daemon:
@y
Docker デーモンの設定には 2 つの方法があります。
@z

@x
* Use a JSON configuration file. This is the preferred option, since it keeps
all configurations in a single place.
* Use flags when starting `dockerd`.
@y
* JSON 形式の設定ファイルを利用します。
  設定をすべて一箇所にとりまとめられるので、この方法が推奨されます。
* `dockerd`起動時のフラグを利用します。
@z

@x
You can use both of these options together as long as you don't specify the
same option both as a flag and in the JSON file. If that happens, the Docker
daemon won't start and prints an error message.
@y
同じオプションをフラグと JSON ファイルの両方に指定しない限り、フラグと JSON ファイルによる指定を併用することができます。
もし両方に指定してしまった場合、Docker デーモンは起動せず、エラーメッセージが出力されます。
@z

@x
To configure the Docker daemon using a JSON file, create a file at
`/etc/docker/daemon.json` on Linux systems, or `C:\ProgramData\docker\config\daemon.json`
on Windows. On MacOS go to the whale in the taskbar > Preferences > Daemon > Advanced.
@y
JSON ファイルを使って Docker デーモンを設定する場合、Linux であればその設定ファイルを`/etc/docker/daemon.json`に、また Windows であれば`C:\ProgramData\docker\config\daemon.json`にファイルを生成します。
MacOS の場合は、タスクバー上の Docker アイコンをクリックして Preferences > Daemon > Advanced を実行して設定します。
@z

@x
Here's what the configuration file looks like:
@y
設定ファイルは以下のようにします。
@z

@x
```json
{
  "debug": true,
  "tls": true,
  "tlscert": "/var/docker/server.pem",
  "tlskey": "/var/docker/serverkey.pem",
  "hosts": ["tcp://192.168.59.3:2376"]
}
```
@y
```json
{
  "debug": true,
  "tls": true,
  "tlscert": "/var/docker/server.pem",
  "tlskey": "/var/docker/serverkey.pem",
  "hosts": ["tcp://192.168.59.3:2376"]
}
```
@z

@x
With this configuration the Docker daemon runs in debug mode, uses TLS, and
listens for traffic routed to `192.168.59.3` on port `2376`.
You can learn what configuration options are available in the
[dockerd reference docs](../../engine/reference/commandline/dockerd.md#daemon-configuration-file)
@y
この設定によってデーモンを起動すると、デバッグモードとなり TLS を利用し、`192.168.59.3`の`2376`ポートへのトラフィックを待ち受けるものとなります。
どのような設定オプションが利用可能であるかは、[dockerd リファレンスドキュメント](../../engine/reference/commandline/dockerd.md#daemon-configuration-file) を参照してください。
@z

@x
You can also start the Docker daemon manually and configure it using flags.
This can be useful for troubleshooting problems.
@y
また Docker デーモンを手動で起動し、その際にフラグを使って設定することもできます。
これはトラブルを解決するときに活用できる方法です。
@z

@x
Here's an example of how to manually start the Docker daemon, using the same
configurations as above:
@y
以下の例は Docker デーモンを手動で起動する方法であり、先ほどと同じ設定を行うものです。
@z

@x
```console
$ dockerd --debug \
  --tls=true \
  --tlscert=/var/docker/server.pem \
  --tlskey=/var/docker/serverkey.pem \
  --host tcp://192.168.59.3:2376
```
@y
```console
$ dockerd --debug \
  --tls=true \
  --tlscert=/var/docker/server.pem \
  --tlskey=/var/docker/serverkey.pem \
  --host tcp://192.168.59.3:2376
```
@z

@x
You can learn what configuration options are available in the
[dockerd reference docs](../../engine/reference/commandline/dockerd.md), or by running:
@y
どのような設定オプションが利用可能であるかは、[dockerd リファレンスドキュメント](../../engine/reference/commandline/dockerd.md) を参照するるか、あるいは以下を実行してみてください。
@z

@x
```console
$ dockerd --help
```
@y
```console
$ dockerd --help
```
@z

@x
Many specific configuration options are discussed throughout the Docker
documentation. Some places to go next include:
@y
Docker ドキュメントでは、設定オプションを数多く取り扱っています。
その中から次に見ていくものとして、以下をあげておきます。
@z

@x
- [Automatically start containers](../containers/start-containers-automatically.md)
- [Limit a container's resources](../containers/resource_constraints.md)
- [Configure storage drivers](../../storage/storagedriver/select-storage-driver.md)
- [Container security](../../engine/security/index.md)
@y
- [コンテナーの自動起動](../containers/start-containers-automatically.md)
- [コンテナーのリソース制限](../containers/resource_constraints.md)
- [ストレージドライバーの設定](../../storage/storagedriver/select-storage-driver.md)
- [コンテナーのセキュリティ](../../engine/security/index.md)
@z

@x
## Docker daemon directory
@y
{: #docker-daemon-directory }
## Docker デーモンディレクトリ
@z

@x
The Docker daemon persists all data in a single directory. This tracks everything
related to Docker, including containers, images, volumes, service definition,
and secrets.
@y
Docker デーモンは関連データをすべて、単一のディレクトリ配下に保持します。
ここに Docker に関連する、コンテナー、イメージ、ボリューム、サービス定義、機密情報などすべて管理しています。
@z

@x
By default this directory is:
@y
このディレクトリはデフォルトでは以下のものです。
@z

@x
* `/var/lib/docker` on Linux.
* `C:\ProgramData\docker` on Windows.
@y
* Linux では `/var/lib/docker`
* Windows では `C:\ProgramData\docker`
@z

@x
You can configure the Docker daemon to use a different directory, using the
`data-root` configuration option.
@y
設定オプションの`data-root`というものを使えば、Docker デーモンが利用するディレクトリを別のところに変更することもできます。
@z

@x
Since the state of a Docker daemon is kept on this directory, make sure
you use a dedicated directory for each daemon. If two daemons share the same
directory, for example, an NFS share, you are going to experience errors that
are difficult to troubleshoot.
@y
Docker デーモンの状態はこのディレクトリ内に保持されるので、デーモンごとに専用のディレクトリを利用することが必要です。
2 つあるデーモンが、たとえば NFS 共有による同一のディレクトリをともに利用していると、解決困難なエラーに出会うことになりかねません。
@z

@x
## Troubleshoot the daemon
@y
{: #troubleshoot-the-daemon }
## デーモンのトラブルシューティング
@z

@x
You can enable debugging on the daemon to learn about the runtime activity of
the daemon and to aid in troubleshooting. If the daemon is completely
non-responsive, you can also
[force a full stack trace](#force-a-stack-trace-to-be-logged) of all
threads to be added to the daemon log by sending the `SIGUSR` signal to the
Docker daemon.
@y
デーモンのデバッグ機能を有効にすれば、デーモン実行時の様子を見たり、トラブル解決に役立てたりすることができます。
デーモンが完全に応答しなくなった場合は、全スレッドに対して [スタックトレースの強制出力](#force-a-stack-trace-to-be-logged) が可能です。
これは Docker デーモンに対して`SIGUSR`シグナルを送信すれば、デーモンログに出力されます。
@z

@x
### Troubleshoot conflicts between the `daemon.json` and startup scripts
@y
{: #troubleshoot-conflicts-between-the-daemonjson-and-startup-scripts }
### `daemon.json`と起動スクリプトの競合を解決する
@z

@x
If you use a `daemon.json` file and also pass options to the `dockerd`
command manually or using start-up scripts, and these options conflict,
Docker fails to start with an error such as:
@y
`daemon.json`ファイル利用時であって、同じオプションを`dockerd`コマンドに対して手動で指定した場合、あるいは起動スクリプト実行をした場合、そのオプションが競合してしまい、以下のようなエラーが出力されてデーモン起動は失敗します。
@z

@x
```none
unable to configure the Docker daemon with file /etc/docker/daemon.json:
the following directives are specified both as a flag and in the configuration
file: hosts: (from flag: [unix:///var/run/docker.sock], from file: [tcp://127.0.0.1:2376])
```
@y
```none
unable to configure the Docker daemon with file /etc/docker/daemon.json:
the following directives are specified both as a flag and in the configuration
file: hosts: (from flag: [unix:///var/run/docker.sock], from file: [tcp://127.0.0.1:2376])
```
@z

@x
If you see an error similar to this one and you are starting the daemon manually with flags,
you may need to adjust your flags or the `daemon.json` to remove the conflict.
@y
上のようなエラーが出力され、デーモンの手動起動時にフラグ設定を行っているなら、そのフラグを正しくするか、あるいは`daemon.json`内から競合しているフラグを削除します。
@z

@x
> **Note**: If you see this specific error, continue to the
> [next section](#use-the-hosts-key-in-daemonjson-with-systemd) for a workaround.
@y
> **メモ**: 
> 上のエラーが出力された場合、とりあえずの解決としては [次節](#use-the-hosts-key-in-daemonjson-with-systemd) に進んでください。
@z

@x
If you are starting Docker using your operating system's init scripts, you may
need to override the defaults in these scripts in ways that are specific to the
operating system.
@y
オペレーティングシステムの初期化スクリプトにより Docker デーモンを起動している場合は、そのスクリプト内におけるデフォルト設定を上書きすることになるかもしれません。
その方法については、オペレーティングシステムが規定する方法に従ってください。
@z

@x
#### Use the hosts key in daemon.json with systemd
@y
{: #use-the-hosts-key-in-daemonjson-with-systemd }
#### systemd を使った daemon.json 内での hosts キーの利用
@z

@x
One notable example of a configuration conflict that is difficult to troubleshoot
is when you want to specify a different daemon address from
the default. Docker listens on a socket by default. On Debian and Ubuntu systems using `systemd`,
this means that a host flag `-H` is always used when starting `dockerd`. If you specify a
`hosts` entry in the `daemon.json`, this causes a configuration conflict (as in the above message)
and Docker fails to start.
@y
競合が発生してもわかりにくい例として、よくあるのが、デーモンのアドレスをデフォルトとは異なるものにした場合です。
Docker はデフォルトでソケットを待ち受けます。
Debian や Ubuntu は`systemd`を利用しているので、`dockerd`の起動時には必ず、ホスト指定に`-H`フラグを用います。
`daemon.json`ファイルに`host`項目を指定した場合、設定の競合が発生して（上で示したメッセージが出力され）Docker の起動は失敗します。
@z

@x
To work around this problem, create a new file `/etc/systemd/system/docker.service.d/docker.conf` with
the following contents, to remove the `-H` argument that is used when starting the daemon by default.
@y
この問題をとりあえず回避するには`/etc/systemd/system/docker.service.d/docker.conf`というファイルを生成し、内容を以下のようにします。
これはデフォルトにおいて、デーモン起動時に用いられる`-H`引数を取り除くものです。
@z

@x
```none
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
```
@y
```none
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
```
@z

@x
There are other times when you might need to configure `systemd` with Docker, such as
[configuring a HTTP or HTTPS proxy](systemd.md#httphttps-proxy).
@y
Docker に関して`systemd`の設定を見直す必要が、他にも出てくるかもしれません。
たとえば [HTTP または HTTPS プロキシーの設定](systemd.md#httphttps-proxy) を行う必要がある場合です。
@z

@x
> **Note**: If you override this option and then do not specify a `hosts` entry in the `daemon.json`
> or a `-H` flag when starting Docker manually, Docker fails to start.
@y
> **メモ**: 
> このオプションを上のように設定したにもかかわらず、`daemon.json`の`hosts`設定や、Docker 手動起動時の`-H`フラグを用いなかった場合には、Docker の起動は失敗します。
@z

@x
Run `sudo systemctl daemon-reload` before attempting to start Docker. If Docker starts
successfully, it is now listening on the IP address specified in the `hosts` key of the
`daemon.json` instead of a socket.
@y
Docker を起動しようとする前には`sudo systemctl daemon-reload`を実行してください。
Docker が正常に起動したら、これ以降はソケットを待ち受けるのでなく、`daemon.json`の`hosts`キーに指定された IP アドレスからのトラフィックを待ち受けることになります。
@z

@x
> **Important**: Setting `hosts` in the `daemon.json` is not supported on Docker Desktop for Windows
> or Docker Desktop for Mac.
{:.important}
@y
> **重要**: 
> `daemon.json`において`hosts`の設定を行う方法は、Docker Desktop for Windows や Docker Desktop for Mac ではサポートされていません。
{:.important}
@z

@x
### Out Of Memory Exceptions (OOME)
@y
{: #out-of-memory-exceptions-oome  }
### Out Of Memory Exceptions (OOME)
@z

@x
If your containers attempt to use more memory than the system has available,
you may experience an Out Of Memory Exception (OOME) and a container, or the
Docker daemon, might be killed by the kernel OOM killer. To prevent this from
happening, ensure that your application runs on hosts with adequate memory and
see
[Understand the risks of running out of memory](../containers/resource_constraints.md#understand-the-risks-of-running-out-of-memory).
@y
コンテナーの利用するメモリ容量が、システムの残容量を超えた場合に、Out Of Memory Exception (OOME) が発生することがあります。
その場合コンテナーあるいは Docker デーモンは、カーネルの OOM キラーによって kill されるかもしれません。
このような発生を防ぐためには、ホスト上の適切なメモリ容量範囲内でアプリケーションが動作するようにしてください。
[out of memory となるリスクの理解](../containers/resource_constraints.md#understand-the-risks-of-running-out-of-memory) も確認してください。
@z

@x
### Read the logs
@y
{: #read-the-logs }
### ログを読む
@z

@x
The daemon logs may help you diagnose problems. The logs may be saved in one of
a few locations, depending on the operating system configuration and the logging
subsystem used:
@y
デーモンログは、問題の解決に役立つものです。
ログはいくつかの場所に保存されます。
これはオペレーティングシステムの設定や、利用しているログ管理システムによって定まります。
@z

@x
| Operating system                    | Location                                                                                                                                 |
|:------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------|
| Linux                               | Use the command `journalctl -xu docker.service` (or read `/var/log/syslog` or `/var/log/messages`, depending on your Linux Distribution) |
| macOS (`dockerd` logs)              | `~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log`                                                                         |
| macOS (`containerd` logs)           | `~/Library/Containers/com.docker.docker/Data/log/vm/containerd.log`                                                                      |
| Windows (WSL2) (`dockerd` logs)     | `AppData\Roaming\Docker\log\vm\dockerd.log`                                                                                              |
| Windows (WSL2) (`containerd` logs)  | `AppData\Roaming\Docker\log\vm\containerd.log`                                                                                           |
| Windows (Windows containers)        | Logs are in the Windows Event Log                                                                                                        |
@y
| オペレーティングシステム            | 場所                                                                                                                                     |
|:------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------|
| Linux                               | `journalctl -xu docker.service`を実行。 (または`/var/log/syslog`、`/var/log/messages`の参照。Linux ディストリビューションにより異なる。) |
| macOS (`dockerd` logs)              | `~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log`                                                                         |
| macOS (`containerd` logs)           | `~/Library/Containers/com.docker.docker/Data/log/vm/containerd.log`                                                                      |
| Windows (WSL2) (`dockerd` logs)     | `AppData\Roaming\Docker\log\vm\dockerd.log`                                                                                              |
| Windows (WSL2) (`containerd` logs)  | `AppData\Roaming\Docker\log\vm\containerd.log`                                                                                           |
| Windows (Windows containers)        | ログは Windows イベントログ内に。                                                                                                        |
@z

@x
To view the `dockerd` logs on macOS, open a terminal Window, and use the `tail`
command with the `-f` flag to "follow" the logs. Logs will be printed until you
terminate the command using `CTRL+c`:
@y
macOS 上において`dockerd`ログを参照するには、端末画面を開いて`tail`コマンドを使います。
その際には`-f`フラグをつけることで、ログを追うことができます。
ログの表示は、`CTRL+c`を入力してコマンドを中止させるまで続きます。
@z

@x
```console
$ tail -f ~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.497642089Z" level=debug msg="attach: stdout: begin"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.497714291Z" level=debug msg="attach: stderr: begin"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.499798390Z" level=debug msg="Calling POST /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/wait?condition=removed"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.518403686Z" level=debug msg="Calling GET /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/json"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.527074928Z" level=debug msg="Calling POST /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/start"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.528203579Z" level=debug msg="container mounted via layerStore: &{/var/lib/docker/overlay2/6e76ffecede030507fcaa576404e141e5f87fc4d7e1760e9ce5b52acb24
...
^C
```
@y
```console
$ tail -f ~/Library/Containers/com.docker.docker/Data/log/vm/dockerd.log
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.497642089Z" level=debug msg="attach: stdout: begin"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.497714291Z" level=debug msg="attach: stderr: begin"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.499798390Z" level=debug msg="Calling POST /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/wait?condition=removed"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.518403686Z" level=debug msg="Calling GET /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/json"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.527074928Z" level=debug msg="Calling POST /v1.41/containers/35fc5ec0ffe1ad492d0a4fbf51fd6286a087b89d4dd66367fa3b7aec70b46a40/start"
2021-07-28T10:21:21Z dockerd time="2021-07-28T10:21:21.528203579Z" level=debug msg="container mounted via layerStore: &{/var/lib/docker/overlay2/6e76ffecede030507fcaa576404e141e5f87fc4d7e1760e9ce5b52acb24
...
^C
```
@z

@x
### Enable debugging
@y
{: #enable-debugging }
### デバッグの有効化
@z

@x
There are two ways to enable debugging. The recommended approach is to set the
`debug` key to `true` in the `daemon.json` file. This method works for every
Docker platform.
@y
デバッグを有効にするには 2 通りあります。
お勧めの方法は`daemon.json`ファイルにおいて`debug`キーを`true`にすることです。
この方法はどの Docker プラットフォームでも動作します。
@z

@x
1.  Edit the `daemon.json` file, which is usually located in `/etc/docker/`.
    You may need to create this file, if it does not yet exist. On macOS or
    Windows, do not edit the file directly. Instead, go to
    **Preferences** / **Daemon** / **Advanced**.
@y
1.  `daemon.json`ファイルを編集します。
    その場所は通常`/etc/docker/`にあります。
    存在しなければ、ここで生成します。
    macOS や Windows の場合、このファイルを直接編集はしません。
    そのかわり **Preferences** / **Daemon** / **Advanced** を実行してください。
@z

@x
2.  If the file is empty, add the following:
@y
2.  ファイルが空であれば以下の記述を追加します。
@z

@x
    ```json
    {
      "debug": true
    }
    ```
@y
    ```json
    {
      "debug": true
    }
    ```
@z

@x
    If the file already contains JSON, just add the key `"debug": true`, being
    careful to add a comma to the end of the line if it is not the last line
    before the closing bracket. Also verify that if the `log-level` key is set,
    it is set to either `info` or `debug`. `info` is the default, and possible
    values are `debug`, `info`, `warn`, `error`, `fatal`.
@y
    このファイルにすでに JSON 記述が行われていた場合は`"debug": true`というキー項目のみを追加します。
    閉じブラケット直前の最終行として追加する場合には、行末にカンマは不要ですが、そうでなければカンマを忘れないでください。
    また`log-level`を設定する場合には、その値を`info`か`debug`にしてください。
    `info`がデフォルト値であり、設定可能な値は`debug`、`info`、`warn`、`error`、`fatal`のいずれかです。
@z

@x
3.  Send a `HUP` signal to the daemon to cause it to reload its configuration.
    On Linux hosts, use the following command.
@y
3.  この設定を再読み込みさせるために、デーモンに対して`HUP`シグナルを送信します。
    Linux ホストの場合は以下のコマンドを実行します。
@z

@x
    ```console
    $ sudo kill -SIGHUP $(pidof dockerd)
    ```
@y
    ```console
    $ sudo kill -SIGHUP $(pidof dockerd)
    ```
@z

@x
    On Windows hosts, restart Docker.
@y
    Windows ホストの場合は Docker を再起動します。
@z

@x
Instead of following this procedure, you can also stop the Docker daemon and
restart it manually with the debug flag `-D`. However, this may result in Docker
restarting with a different environment than the one the hosts' startup scripts
create, and this may make debugging more difficult.
@y
上のような方法ではなく、デバッグフラグ`-D`を手動で利用すれば Docker デーモンの停止と再起動を行うことができます。
ただしこれを行うと、ホストの初期起動スクリプトが生成するものとは異なる環境において Docker が再起動してしまうことがあります。
この場合、デバッグ作業は難しくなります。
@z

@x
### Force a stack trace to be logged
@y
{: #force-a-stack-trace-to-be-logged }
### スタックトレースの強制ログ出力
@z

@x
If the daemon is unresponsive, you can force a full stack trace to be logged
by sending a `SIGUSR1` signal to the daemon.
@y
デーモンが反応しなくなった場合には、フルスタックトレースをログ出力させるために、デーモンに対して`SIGUSR1`シグナルを送信します。
@z

@x
- **Linux**:
@y
- **Linux の場合**
@z

@x
  ```console
  $ sudo kill -SIGUSR1 $(pidof dockerd)
  ```
@y
  ```console
  $ sudo kill -SIGUSR1 $(pidof dockerd)
  ```
@z

@x
- **Windows Server**:
@y
- **Windows Server の場合**
@z

@x
  Download [docker-signal](https://github.com/moby/docker-signal).
@y
  [docker-signal](https://github.com/moby/docker-signal) をダウンロード。
@z

@x
  Get the process ID of dockerd `Get-Process dockerd`.
@y
  `Get-Process dockerd`により dockerd のプロセス ID を取得。
@z

@x
  Run the executable with the flag `--pid=<PID of daemon>`.
@y
  `--pid=<デーモンのプロセス ID>`フラグを使ってモジュールを実行。
@z

@x
This forces a stack trace to be logged but does not stop the daemon.
Daemon logs show the stack trace or the path to a file containing the
stack trace if it was logged to a file.
@y
これによりスタックトレースがログに出力されますが、デーモンは停止されません。
デーモンログにスタックトレースが出力されているか、あるいはスタックトレースをファイル出力されていれば、そのファイルへのパスが示されています。
@z

@x
The daemon continues operating after handling the `SIGUSR1` signal and
dumping the stack traces to the log. The stack traces can be used to determine
the state of all goroutines and threads within the daemon.
@y
デーモンが`SIGUSR1`シグナルを処理した後は、スタックトレースをログ出力した上で、動作を続行します。
スタックトレースからは、デーモン内部で処理されていた Go 言語のゴルーチン（goroutine）やスレッドの状態を確認することができます。
@z

@x
### View stack traces
@y
{: #view-stack-traces }
### スタックトレースの確認
@z

@x
The Docker daemon log can be viewed by using one of the following methods:
@y
Docker デーモンログは、以下に示すような方法により確認することができます。
@z

@x
- By running `journalctl -u docker.service` on Linux systems using `systemctl`
- `/var/log/messages`, `/var/log/daemon.log`, or `/var/log/docker.log` on older
  Linux systems
@y
- `systemctl`を利用している Linux システム上にて`journalctl -u docker.service`を実行します。
- 古い Linux の場合は`/var/log/messages`、`/var/log/daemon.log`、`/var/log/docker.log`を確認します。
@z

@x
> **Note**
> 
> It is not possible to manually generate a stack trace on Docker Desktop for
> Mac or Docker Desktop for Windows. However, you can click the Docker taskbar
> icon and choose **Troubleshoot** to send information to Docker if you
> run into issues.
@y
> **メモ**
>
> Docker Desktop for Mac や Docker Desktop for Windows において、スタックトレースをコマンド操作によって取得することはできません。
> しかし問題が発生したときには、 Docker タスクバーアイコンをクリックし **Troubleshoot** を実行すれば、Docker に対して情報を送信することができます。
@z

@x
Look in the Docker logs for a message like the following:
@y
Docker ログに出力された以下のようなメッセージを見てみます。
@z

@x
```none
...goroutine stacks written to /var/run/docker/goroutine-stacks-2017-06-02T193336z.log
...daemon datastructure dump written to /var/run/docker/daemon-data-2017-06-02T193336z.log
```
@y
```none
...goroutine stacks written to /var/run/docker/goroutine-stacks-2017-06-02T193336z.log
...daemon datastructure dump written to /var/run/docker/daemon-data-2017-06-02T193336z.log
```
@z

@x
The locations where Docker saves these stack traces and dumps depends on your
operating system and configuration. You can sometimes get useful diagnostic
information straight from the stack traces and dumps. Otherwise, you can provide
this information to Docker for help diagnosing the problem.
@y
Docker がスタックトレースやダンプを保存する場所は、オペレーティングシステムとその設定によって決まります。
スタックトレースやダンプからは、わかりやすい有用な診断情報が得られることがあります。
そうでないときには、Docker に対してこの情報を提供して、問題解決に役立てることができます。
@z

@x
## Check whether Docker is running
@y
{: #check-whether-docker-is-running }
## Docker の起動確認
@z

@x
The operating-system independent way to check whether Docker is running is to
ask Docker, using the `docker info` command.
@y
オペレーティングシステムを問わず Docker が動いているかどうかを確認するには`docker info`コマンドを実行します。
@z

@x
You can also use operating system utilities, such as
`sudo systemctl is-active docker` or `sudo status docker` or
`sudo service docker status`, or checking the service status using Windows
utilities.
@y
あるいはオペレーティングシステムが提供するユーティリティーを用いることもできます。
たとえば`sudo systemctl is-active docker`、`sudo status docker`、`sudo service docker status`などです。
また Windows の場合は、サービス状態を確認するユーティリティーを利用します。
@z

@x
Finally, you can check in the process list for the `dockerd` process, using
commands like `ps` or `top`.
@y
また`ps`や`top`コマンドを使えば、`dockerd`プロセス内のプロセス一覧を確認することができます。
@z
