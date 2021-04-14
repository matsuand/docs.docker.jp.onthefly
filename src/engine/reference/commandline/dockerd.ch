%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "dockerd"
aliases: ["/engine/reference/commandline/daemon/"]
description: "The daemon command description and usage"
keywords: "container, daemon, runtime"
---
@y
---
title: "dockerd"
aliases: ["/engine/reference/commandline/daemon/"]
description: "The daemon command description and usage"
keywords: "container, daemon, runtime"
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
# daemon
@y
{: #daemon }
# デーモン
@z

@x
```markdown
Usage:	dockerd COMMAND

A self-sufficient runtime for containers.

Options:
      --add-runtime runtime                   Register an additional OCI compatible runtime (default [])
      --allow-nondistributable-artifacts list Push nondistributable artifacts to specified registries (default [])
      --api-cors-header string                Set CORS headers in the Engine API
      --authorization-plugin list             Authorization plugins to load (default [])
      --bip string                            Specify network bridge IP
  -b, --bridge string                         Attach containers to a network bridge
      --cgroup-parent string                  Set parent cgroup for all containers
      --cluster-advertise string              Address or interface name to advertise
      --cluster-store string                  URL of the distributed storage backend
      --cluster-store-opt map                 Set cluster store options (default map[])
      --config-file string                    Daemon configuration file (default "/etc/docker/daemon.json")
      --containerd string                     Path to containerd socket
      --cpu-rt-period int                     Limit the CPU real-time period in microseconds
      --cpu-rt-runtime int                    Limit the CPU real-time runtime in microseconds
      --data-root string                      Root directory of persistent Docker state (default "/var/lib/docker")
  -D, --debug                                 Enable debug mode
      --default-gateway ip                    Container default gateway IPv4 address
      --default-gateway-v6 ip                 Container default gateway IPv6 address
      --default-address-pool                  Set the default address pool for local node networks
      --default-runtime string                Default OCI runtime for containers (default "runc")
      --default-ulimit ulimit                 Default ulimits for containers (default [])
      --dns list                              DNS server to use (default [])
      --dns-opt list                          DNS options to use (default [])
      --dns-search list                       DNS search domains to use (default [])
      --exec-opt list                         Runtime execution options (default [])
      --exec-root string                      Root directory for execution state files (default "/var/run/docker")
      --experimental                          Enable experimental features
      --fixed-cidr string                     IPv4 subnet for fixed IPs
      --fixed-cidr-v6 string                  IPv6 subnet for fixed IPs
  -G, --group string                          Group for the unix socket (default "docker")
      --help                                  Print usage
  -H, --host list                             Daemon socket(s) to connect to (default [])
      --icc                                   Enable inter-container communication (default true)
      --init                                  Run an init in the container to forward signals and reap processes
      --init-path string                      Path to the docker-init binary
      --insecure-registry list                Enable insecure registry communication (default [])
      --ip ip                                 Default IP when binding container ports (default 0.0.0.0)
      --ip-forward                            Enable net.ipv4.ip_forward (default true)
      --ip-masq                               Enable IP masquerading (default true)
      --iptables                              Enable addition of iptables rules (default true)
      --ipv6                                  Enable IPv6 networking
      --label list                            Set key=value labels to the daemon (default [])
      --live-restore                          Enable live restore of docker when containers are still running
      --log-driver string                     Default driver for container logs (default "json-file")
  -l, --log-level string                      Set the logging level ("debug", "info", "warn", "error", "fatal") (default "info")
      --log-opt map                           Default log driver options for containers (default map[])
      --max-concurrent-downloads int          Set the max concurrent downloads for each pull (default 3)
      --max-concurrent-uploads int            Set the max concurrent uploads for each push (default 5)
      --metrics-addr string                   Set default address and port to serve the metrics api on
      --mtu int                               Set the containers network MTU
      --node-generic-resources list           Advertise user-defined resource
      --no-new-privileges                     Set no-new-privileges by default for new containers
      --oom-score-adjust int                  Set the oom_score_adj for the daemon (default -500)
  -p, --pidfile string                        Path to use for daemon PID file (default "/var/run/docker.pid")
      --raw-logs                              Full timestamps without ANSI coloring
      --registry-mirror list                  Preferred Docker registry mirror (default [])
      --seccomp-profile string                Path to seccomp profile
      --selinux-enabled                       Enable selinux support
      --shutdown-timeout int                  Set the default shutdown timeout (default 15)
  -s, --storage-driver string                 Storage driver to use
      --storage-opt list                      Storage driver options (default [])
      --swarm-default-advertise-addr string   Set default address or interface for swarm advertised address
      --tls                                   Use TLS; implied by --tlsverify
      --tlscacert string                      Trust certs signed only by this CA (default "~/.docker/ca.pem")
      --tlscert string                        Path to TLS certificate file (default "~/.docker/cert.pem")
      --tlskey string                         Path to TLS key file (default ~/.docker/key.pem")
      --tlsverify                             Use TLS and verify the remote
      --userland-proxy                        Use userland proxy for loopback traffic (default true)
      --userland-proxy-path string            Path to the userland proxy binary
      --userns-remap string                   User/Group setting for user namespaces
  -v, --version                               Print version information and quit
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#japanese">日本語表記</a></li>
  <li><a data-toggle="tab" href="#origin">英語表記</a></li>
</ul>
<div class="tab-content">
  <div id="japanese" class="tab-pane fade in active">
{% capture japanese-content %}
```markdown
利用方法:	dockerd <コマンド>

コンテナーに対する独立したランタイム。

オプション:
      --add-runtime runtime                   OCI 準拠の追加ランタイムを登録します。（デフォルトは []）
      --allow-nondistributable-artifacts list 配布制限のある成果物を指定レジストリにプッシュします。（デフォルトは []）
      --api-cors-header string                Engine API において CORS ヘッダーを設定します。
      --authorization-plugin list             利用する認証プラグインを指定します。（デフォルトは []）
      --bip string                            ネットワークブリッジ IP を指定します。
  -b, --bridge string                         コンテナーにネットワークブリッジを割り当てます。
      --cgroup-parent string                  全コンテナーに親 cgroup を設定します。
      --cluster-advertise string              通知(advertise)するアドレスまたはインターフェース名。
      --cluster-store string                  分散ストレージバックエンドの URL。
      --cluster-store-opt map                 クラスターストアオプションを設定します。（デフォルトは map[]）
      --config-file string                    デーモン設定ファイル。（デフォルトは "/etc/docker/daemon.json"）
      --containerd string                     containerd ソケットへのパス。
      --cpu-rt-period int                     マイクロ秒で指定される CPU のリアルタイム時間（real-time period）を制限します。
      --cpu-rt-runtime int                    マイクロ秒で指定される CPU のリアルタイムランタイム（real-time runtime）を制限します。
      --data-root string                      永続的な Docker 状態ファイルのルートディレクトリ。（デフォルトは "/var/lib/docker"）
  -D, --debug                                 デバッグモードを有効にします。
      --default-gateway ip                    コンテナーデフォルトゲートウェイの IPv4 アドレス。
      --default-gateway-v6 ip                 コンテナーデフォルトゲートウェイの IPv6 アドレス。
      --default-address-pool                  ローカルのノードネットワークに対してデフォルトのアドレスプールを設定します。
      --default-runtime string                コンテナーに対するデフォルトの OCI ランタイム。（デフォルトは "runc"）
      --default-ulimit ulimit                 コンテナーにデフォルト ulimit を設定します。（デフォルトは []）
      --dns list                              利用する DNS サーバー。（デフォルトは []）
      --dns-opt list                          利用する DNS オプション。（デフォルトは []）
      --dns-search list                       利用する DNS 検索ドメイン。（デフォルトは []）
      --exec-opt list                         ランタイム実行オプション。（デフォルトは []）
      --exec-root string                      実行状態ファイルのルートディレクトリ。（デフォルトは "/var/run/docker）)
      --experimental                          試験的機能（experimental features）を有効にします。
      --fixed-cidr string                     固定 IP に対する IPv4 サブネット。
      --fixed-cidr-v6 string                  固定 IP に対する IPv6 サブネット。
  -G, --group string                          unix ソケットのグループ。（デフォルトは"docker"）
      --help                                  利用方法を表示します。
  -H, --host list                             接続するデーモンソケット。（デフォルトは []）
      --icc                                   コンテナー間の通信を有効にします。（デフォルトは true）
      --init                                  コンテナー内に init を実行し、シグナル転送とプロセス回収（reap）を行います。
      --init-path string                      docker-init バイナリへのパス。
      --insecure-registry list                セキュアでないレジストリとのやりとりを有効にします。（デフォルトは []）
      --ip ip                                 コンテナーポートをバインドする際のデフォルト IP。（デフォルトは 0.0.0.0）
      --ip-forward                            net.ipv4.ip_forward を有効にします。（デフォルトは true）
      --ip-masq                               IP マスカレードを有効にします。（デフォルトは true）
      --iptables                              iptables ルールの追加を許可します。（デフォルトは true）
      --ipv6                                  IPv6 ネットワークを有効にします。
      --label list                            デーモンに対してキーバリューラベルを設定します。（デフォルトは []）
      --live-restore                          コンテナー実行中でのライブリストアを有効にします。
      --log-driver string                     コンテナーログに対するデフォルトドライバー。（デフォルトは "json-file"）
  -l, --log-level string                      ログ出力レベルを設定します。（"debug", "info", "warn", "error", "fatal"）（デフォルトは "info"）
      --log-opt map                           コンテナーに対するデフォルトのログドライバーオプション。（デフォルトは map[]）
      --max-concurrent-downloads int          プルごとの最大同時ダウンロード数を設定します。（デフォルト 3）
      --max-concurrent-uploads int            プッシュごとの最大同時ダウンロード数を設定します。（デフォルト 5）
      --metrics-addr string                   メトリックス API を提供するデフォルトのアドレスとポートを指定します。
      --mtu int                               コンテナーネットワークに MTU を設定します。
      --node-generic-resources list           ユーザー定義のリソースを通知します。
      --no-new-privileges                     新たなコンテナーに対してデフォルトで no-new-privileges を設定します。
      --oom-score-adjust int                  デーモンに対して oom_score_adj を設定します。（デフォルトは -500）
  -p, --pidfile string                        デーモン PID ファイルへのパス。（デフォルトは "/var/run/docker.pid"）
      --raw-logs                              ANSI カラーなしのフルタイムスタンプ。
      --registry-mirror list                  指定したい Docker レジストリミラー。（デフォルトは []）
      --seccomp-profile string                seccomp プロファイルへのパス。
      --selinux-enabled                       selinux サポートを有効にします。
      --shutdown-timeout int                  デフォルトのシャットダウンタイムアウトを設定します。（デフォルトは 15）
  -s, --storage-driver string                 利用するストレージドライバー。
      --storage-opt list                      ストレージドライバーのオプション。（デフォルトは []）
      --swarm-default-advertise-addr string   Swarm の通知アドレスに対してデフォルトのアドレスまたはインターフェースを設定します。
      --tls                                   TLS の利用。暗に --tlsverify を含みます。
      --tlscacert string                      この CA によってのみ署名された信頼できる証明局。（デフォルトは "~/.docker/ca.pem"）
      --tlscert string                        TLS 証明書ファイルへのパス。（デフォルトは "~/.docker/cert.pem"）
      --tlskey string                         TLS 鍵ファイルへのパス。（デフォルトは "~/.docker/key.pem"）
      --tlsverify                             TLS を利用しリモートを確認します。
      --userland-proxy                        ループバックトラフィックに対してユーザーランドプロキシーを利用します。（デフォルトは true）
      --userland-proxy-path string            ユーザーランドプロキシーのバイナリへのパス。
      --userns-remap string                   ユーザー名前空間に対するユーザー/グループの設定。
  -v, --version                               バージョン情報を表示して終了します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
<div id="origin" class="tab-pane fade" markdown="1">
{% capture original-content %}
```markdown
Usage:	dockerd COMMAND

A self-sufficient runtime for containers.

Options:
      --add-runtime runtime                   Register an additional OCI compatible runtime (default [])
      --allow-nondistributable-artifacts list Push nondistributable artifacts to specified registries (default [])
      --api-cors-header string                Set CORS headers in the Engine API
      --authorization-plugin list             Authorization plugins to load (default [])
      --bip string                            Specify network bridge IP
  -b, --bridge string                         Attach containers to a network bridge
      --cgroup-parent string                  Set parent cgroup for all containers
      --cluster-advertise string              Address or interface name to advertise
      --cluster-store string                  URL of the distributed storage backend
      --cluster-store-opt map                 Set cluster store options (default map[])
      --config-file string                    Daemon configuration file (default "/etc/docker/daemon.json")
      --containerd string                     Path to containerd socket
      --cpu-rt-period int                     Limit the CPU real-time period in microseconds
      --cpu-rt-runtime int                    Limit the CPU real-time runtime in microseconds
      --data-root string                      Root directory of persistent Docker state (default "/var/lib/docker")
  -D, --debug                                 Enable debug mode
      --default-gateway ip                    Container default gateway IPv4 address
      --default-gateway-v6 ip                 Container default gateway IPv6 address
      --default-address-pool                  Set the default address pool for local node networks
      --default-runtime string                Default OCI runtime for containers (default "runc")
      --default-ulimit ulimit                 Default ulimits for containers (default [])
      --dns list                              DNS server to use (default [])
      --dns-opt list                          DNS options to use (default [])
      --dns-search list                       DNS search domains to use (default [])
      --exec-opt list                         Runtime execution options (default [])
      --exec-root string                      Root directory for execution state files (default "/var/run/docker")
      --experimental                          Enable experimental features
      --fixed-cidr string                     IPv4 subnet for fixed IPs
      --fixed-cidr-v6 string                  IPv6 subnet for fixed IPs
  -G, --group string                          Group for the unix socket (default "docker")
      --help                                  Print usage
  -H, --host list                             Daemon socket(s) to connect to (default [])
      --icc                                   Enable inter-container communication (default true)
      --init                                  Run an init in the container to forward signals and reap processes
      --init-path string                      Path to the docker-init binary
      --insecure-registry list                Enable insecure registry communication (default [])
      --ip ip                                 Default IP when binding container ports (default 0.0.0.0)
      --ip-forward                            Enable net.ipv4.ip_forward (default true)
      --ip-masq                               Enable IP masquerading (default true)
      --iptables                              Enable addition of iptables rules (default true)
      --ipv6                                  Enable IPv6 networking
      --label list                            Set key=value labels to the daemon (default [])
      --live-restore                          Enable live restore of docker when containers are still running
      --log-driver string                     Default driver for container logs (default "json-file")
  -l, --log-level string                      Set the logging level ("debug", "info", "warn", "error", "fatal") (default "info")
      --log-opt map                           Default log driver options for containers (default map[])
      --max-concurrent-downloads int          Set the max concurrent downloads for each pull (default 3)
      --max-concurrent-uploads int            Set the max concurrent uploads for each push (default 5)
      --metrics-addr string                   Set default address and port to serve the metrics api on
      --mtu int                               Set the containers network MTU
      --node-generic-resources list           Advertise user-defined resource
      --no-new-privileges                     Set no-new-privileges by default for new containers
      --oom-score-adjust int                  Set the oom_score_adj for the daemon (default -500)
  -p, --pidfile string                        Path to use for daemon PID file (default "/var/run/docker.pid")
      --raw-logs                              Full timestamps without ANSI coloring
      --registry-mirror list                  Preferred Docker registry mirror (default [])
      --seccomp-profile string                Path to seccomp profile
      --selinux-enabled                       Enable selinux support
      --shutdown-timeout int                  Set the default shutdown timeout (default 15)
  -s, --storage-driver string                 Storage driver to use
      --storage-opt list                      Storage driver options (default [])
      --swarm-default-advertise-addr string   Set default address or interface for swarm advertised address
      --tls                                   Use TLS; implied by --tlsverify
      --tlscacert string                      Trust certs signed only by this CA (default "~/.docker/ca.pem")
      --tlscert string                        Path to TLS certificate file (default "~/.docker/cert.pem")
      --tlskey string                         Path to TLS key file (default ~/.docker/key.pem")
      --tlsverify                             Use TLS and verify the remote
      --userland-proxy                        Use userland proxy for loopback traffic (default true)
      --userland-proxy-path string            Path to the userland proxy binary
      --userns-remap string                   User/Group setting for user namespaces
  -v, --version                               Print version information and quit
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
</div>
@z

@x
Options with [] may be specified multiple times.
@y
オプションにおいて [] が書かれているものは、複数個の指定が可能です。
@z

@x
## Description
@y
{: #description }
## 内容説明
@z

@x
`dockerd` is the persistent process that manages containers. Docker
uses different binaries for the daemon and client. To run the daemon you
type `dockerd`.
@y
`dockerd`はコンテナー管理を行う常駐プロセスです。
Docker ではデーモンとクライアントのそれぞれに対して異なる実行バイナリを利用します。
デーモンを実行するには`dockerd`を入力します。
@z

@x
To run the daemon with debug output, use `dockerd -D` or add `"debug": true` to
the `daemon.json` file.
@y
デーモン実行においてデバッグ出力を行うには、`dockerd -D`を実行します。
あるいは`daemon.json`ファイルに`"debug": true`を追加します。
@z

@x
> **Note**: In Docker 1.13 and higher, enable experimental features by starting
> `dockerd` with the `--experimental` flag or adding `"experimental": true` to the
> `daemon.json` file. In earlier Docker versions, a different build was required
> to enable experimental features.
@y
> **メモ**
>
> Docker 1.13 およびそれ以降において試験的機能（experimental features）を有効にするには、`dockerd`に`--experimental`フラグをつけて実行するか、`daemon.json`ファイルに`"experimental": true`を追加します。
> それ以前の Docker バージョンにおいて試験的機能を有効にするには、特別にビルドされたものを利用することが必要でした。
@z

@x
## Examples
@y
{: #examples }
## 利用例
@z

@x
### Daemon socket option
@y
{: #daemon-socket-option }
### デーモンソケットオプション
@z

@x
The Docker daemon can listen for [Docker Engine API](../api/)
requests via three different types of Socket: `unix`, `tcp`, and `fd`.
@y
Docker デーモンは [Docker Engine API]({{ site.baseurl }}/engine/api/) リクエストを待ち受けます。
その際には 3 種類のタイプのソケット、つまり`unix`、`tcp`、`fd`が利用されます。
@z

@x
By default, a `unix` domain socket (or IPC socket) is created at
`/var/run/docker.sock`, requiring either `root` permission, or `docker` group
membership.
@y
`unix`デーモンソケット（あるいは IPC ソケット）は、デフォルトで`/var/run/docker.sock`に生成されます。
実行には`root`権限、または`docker`グループメンバー権限を必要とします。
@z

@x
If you need to access the Docker daemon remotely, you need to enable the `tcp`
Socket. Beware that the default setup provides un-encrypted and
un-authenticated direct access to the Docker daemon - and should be secured
either using the [built in HTTPS encrypted socket](https://docs.docker.com/engine/security/https/), or by
putting a secure web proxy in front of it. You can listen on port `2375` on all
network interfaces with `-H tcp://0.0.0.0:2375`, or on a particular network
interface using its IP address: `-H tcp://192.168.59.103:2375`. It is
conventional to use port `2375` for un-encrypted, and port `2376` for encrypted
communication with the daemon.
@y
Docker デーモンにリモートからアクセスする必要がある場合は`tcp`ソケットの有効化が必要です。
デフォルトの設定では暗号化や認証がなく、Docker デーモンに直接アクセスできるようになっているので注意してください。
これは [HTTPS 暗号化ソケットを用いた方式]({{ site.baseurl }}/engine/security/https/) を行うか、あるいはセキュアなウェブプロキシーを介するようにして、安全化を図ることが必要です。
すべてのネットワークインターフェースに対しては、ポート`2375`から`-H tcp://0.0.0.0:2375`のようにアクセスします。
また特定のネットワークインターフェースに対しては、IP アドレスを使って`-H tcp://0.0.0.0:2375`のようにします。
慣例として、デーモンとの通信が暗号化されていない場合にはポート`2375`、暗号化されている場合はポート`2376`を利用します。
@z

@x
> **Note**: If you're using an HTTPS encrypted socket, keep in mind that only
> TLS1.0 and greater are supported. Protocols SSLv3 and under are not
> supported anymore for security reasons.
@y
> **メモ**
>
> HTTPS による暗号化されたソケットを利用する場合、サポートされるのが TLS1.0 またはそれ以降であることに注意してください。
> セキュリティに関する理由により、プロトコル SSLv3 またはそれ以下はサポートされません。
@z

@x
On Systemd based systems, you can communicate with the daemon via
[Systemd socket activation](http://0pointer.de/blog/projects/socket-activation.html),
use `dockerd -H fd://`. Using `fd://` will work perfectly for most setups but
you can also specify individual sockets: `dockerd -H fd://3`. If the
specified socket activated files aren't found, then Docker will exit. You can
find examples of using Systemd socket activation with Docker and Systemd in the
[Docker source tree](https://github.com/docker/docker/tree/master/contrib/init/systemd/).
@y
Systemd に基づいたシステムにおいては、デーモンに対しては Systemd の [ソケットアクティベーション](http://0pointer.de/blog/projects/socket-activation.html)（socket activation）を通じて`dockerd -H fd://`のようにしてやりとりができます。
`fd://`と指定すればどのような環境でもほぼ間違いなく動作しますが、`dockerd -H fd://3`のようにして個別のソケットを指定することもできます。
指定したソケットアクティベーションのファイルが見つからなかった場合、Docker は終了します。
Docker と Systemd を使ったソケットアクティベーションの利用例については [Docker source tree](https://github.com/docker/docker/tree/master/contrib/init/systemd/) において見ることができます。
@z

@x
You can configure the Docker daemon to listen to multiple sockets at the same
time using multiple `-H` options:
@y
Docker デーモンに対して複数ソケットを同時に待ち受けるようにするには`-H`オプションを複数指定します。
@z

@x
```bash
# listen using the default unix socket, and on 2 specific IP addresses on this host.

$ sudo dockerd -H unix:///var/run/docker.sock -H tcp://192.168.59.106 -H tcp://10.10.10.2
```
@y
```bash
# デフォルトのunixソケットを利用、合わせて当ホスト上の指定IPアドレス2つを待ち受ける

$ sudo dockerd -H unix:///var/run/docker.sock -H tcp://192.168.59.106 -H tcp://10.10.10.2
```
@z

@x
The Docker client will honor the `DOCKER_HOST` environment variable to set the
`-H` flag for the client. Use **one** of the following commands:
@y
Docker クライアントは環境変数`DOCKER_HOST`に`-H`フラグの設定があれば、これを参照します。
したがって以下のコマンドはいずれか **一方を** 選んでください。
@z

@x
```bash
$ docker -H tcp://0.0.0.0:2375 ps
```
@y
```bash
$ docker -H tcp://0.0.0.0:2375 ps
```
@z

@x
```bash
$ export DOCKER_HOST="tcp://0.0.0.0:2375"

$ docker ps
```
@y
```bash
$ export DOCKER_HOST="tcp://0.0.0.0:2375"

$ docker ps
```
@z

@x
Setting the `DOCKER_TLS_VERIFY` environment variable to any value other than
the empty string is equivalent to setting the `--tlsverify` flag. The following
are equivalent:
@y
環境変数`DOCKER_TLS_VERIFY`に空文字以外の値を何か設定すれば、`--tlsverify`フラグを設定することと同じになります。
つまり以下はいずれも同じです。
@z

@x
```bash
$ docker --tlsverify ps
# or
$ export DOCKER_TLS_VERIFY=1
$ docker ps
```
@y
```bash
$ docker --tlsverify ps
# または
$ export DOCKER_TLS_VERIFY=1
$ docker ps
```
@z

@x
The Docker client will honor the `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY`
environment variables (or the lowercase versions thereof). `HTTPS_PROXY` takes
precedence over `HTTP_PROXY`.
@y
Docker クライアントは環境変数`HTTP_PROXY`、`HTTPS_PROXY`、`NO_PROXY`（またその英小文字による変数）を参照します。
`HTTPS_PROXY`は`HTTP_PROXY`よりも優先されます。
@z

@x
Starting with Docker 18.09, the Docker client supports connecting to a remote
daemon via SSH:
@y
Docker 18.09 以降では Docker クライアントが、リモートデーモンに対して SSH を通じた接続をサポートするようになりました。
@z

@x
```
$ docker -H ssh://me@example.com:22 ps
$ docker -H ssh://me@example.com ps
$ docker -H ssh://example.com ps
```
@y
```
$ docker -H ssh://me@example.com:22 ps
$ docker -H ssh://me@example.com ps
$ docker -H ssh://example.com ps
```
@z

@x
To use SSH connection, you need to set up `ssh` so that it can reach the
remote host with public key authentication. Password authentication is not
supported. If your key is protected with passphrase, you need to set up
`ssh-agent`.
@y
SSH 接続を利用するためには`ssh`の設定が必要です。
これを行うことでリモートホストへの公開鍵認証が可能となります。
なおパスワード認証はサポートされていません。
鍵にパスフレーズをつけて保護した場合は`ssh-agent`の設定が必要です。
@z

@x
Also, you need to have `docker` binary 18.09 or later on the daemon host.
@y
またこの場合はデーモンホスト上に`docker`バイナリ 18.09 またはそれ以降が必要です。
@z

@x
#### Bind Docker to another host/port or a Unix socket
@y
{: #bind-docker-to-another-hostport-or-a-unix-socket }
#### 別ホスト/ポートあるいは Unix ソケットへの Docker のバインド
@z

@x
> **Warning**:
> Changing the default `docker` daemon binding to a
> TCP port or Unix *docker* user group will increase your security risks
> by allowing non-root users to gain *root* access on the host. Make sure
> you control access to `docker`. If you are binding
> to a TCP port, anyone with access to that port has full Docker access;
> so it is not advisable on an open network.
@y
> **警告**
>
> `docker`デーモンはデフォルトで、TCP ポートあるいは Unix のユーザーグループ`docker`へバインドされていますが、これを変更すると、非 root ユーザーによってホスト上の root 権限が取得されるというセキュリティリスクが発生します。
> `docker`へのアクセスは適切に制御してください。
> 1 つの TCP ポートにバインドした場合、そのポートに他者がアクセスすれば Docker のすべてにアクセスできるということです。
> したがってオープンなネットワーク上において、これを行うことはお勧めしません。
@z

@x
With `-H` it is possible to make the Docker daemon to listen on a
specific IP and port. By default, it will listen on
`unix:///var/run/docker.sock` to allow only local connections by the
*root* user. You *could* set it to `0.0.0.0:2375` or a specific host IP
to give access to everybody, but that is **not recommended** because
then it is trivial for someone to gain root access to the host where the
daemon is running.
@y
`-H`オプションを使えば Docker デーモンが特定の IP およびポートを待ち受けるように設定できます。 
デフォルトは`unix:///var/run/docker.sock`であり、**root** ユーザーによるローカル接続のみが可能です。
この設定を`0.0.0.0:2375`や特定ホスト IP に設定して、誰もがアクセスできるようにすることはできます。
ただしこうすることは **推奨しません**。
なぜなら、デーモンを起動するホストへの root アクセスが簡単にできるようになってしまうためです。
@z

@x
Similarly, the Docker client can use `-H` to connect to a custom port.
The Docker client will default to connecting to `unix:///var/run/docker.sock`
on Linux, and `tcp://127.0.0.1:2376` on Windows.
@y
同じように Docker クライアントからは`-H`を使って独自のポートにアクセスすることができます。
Docker クライアントは Linux の場合、デフォルトで`unix:///var/run/docker.sock`に接続します。
また Windows では`tcp://127.0.0.1:2376`がデフォルトです。
@z

@x
`-H` accepts host and port assignment in the following format:
@y
`-H`によるホストとポートの割り当ては、以下の書式に従います。
@z

@x
    tcp://[host]:[port][path] or unix://path
@y
    tcp://[host]:[port][path] または unix://path
@z

@x
For example:
@y
たとえば以下のとおりです。
@z

@x
-   `tcp://` -> TCP connection to `127.0.0.1` on either port `2376` when TLS encryption
    is on, or port `2375` when communication is in plain text.
-   `tcp://host:2375` -> TCP connection on
    host:2375
-   `tcp://host:2375/path` -> TCP connection on
    host:2375 and prepend path to all requests
-   `unix://path/to/socket` -> Unix socket located
    at `path/to/socket`
@y
-   `tcp://`は`127.0.0.1`への TCP 接続であり、TLS 暗号化が有効な場合は`2376`ポート、通信が平文による場合は`2375`ポートを利用します。
-   `tcp://host:2375`は host:2375 への TCP 接続です。
-   `tcp://host:2375/path`は host:2375 への TCP 接続であり、すべてのリクエストに path を追加します。
-   `unix://path/to/socket`は`path/to/socket`にある Unix ソケットです。
@z

@x
`-H`, when empty, will default to the same value as
when no `-H` was passed in.
@y
`-H`への設定値が空の場合、`-H`が渡されなかった場合と同じデフォルトになります。 
@z

@x
`-H` also accepts short form for TCP bindings: `host:` or `host:port` or `:port`
@y
`-H`では TCP バインディングに対する短い書式での記述もできます。
`host:`、`host:port`、`:port`などです。
@z

@x
Run Docker in daemon mode:
@y
以下は Docker をデーモンモードで実行します。
@z

@x
```bash
$ sudo <path to>/dockerd -H 0.0.0.0:5555 &
```
@y
```bash
$ sudo <path to>/dockerd -H 0.0.0.0:5555 &
```
@z

@x
Download an `ubuntu` image:
@y
以下は`ubuntu`イメージをダウンロードします。
@z

@x
```bash
$ docker -H :5555 pull ubuntu
```
@y
```bash
$ docker -H :5555 pull ubuntu
```
@z

@x
You can use multiple `-H`, for example, if you want to listen on both
TCP and a Unix socket
@y
`-H`を複数指定することもできます。
たとえば TCP と Unix ソケットの両方を待ち受けたい場合です。
@z

@x
```bash
# Run docker in daemon mode
$ sudo <path to>/dockerd -H tcp://127.0.0.1:2375 -H unix:///var/run/docker.sock &
# Download an ubuntu image, use default Unix socket
$ docker pull ubuntu
# OR use the TCP port
$ docker -H tcp://127.0.0.1:2375 pull ubuntu
```
@y
```bash
# デーモンモードにより Docker を起動します。
$ sudo <path to>/dockerd -H tcp://127.0.0.1:2375 -H unix:///var/run/docker.sock &
# ubuntu イメージのダウンロードにあたって、デフォルトの Unix ソケットを利用します。
$ docker pull ubuntu
# あるいは TCP ポートを利用します。
$ docker -H tcp://127.0.0.1:2375 pull ubuntu
```
@z

@x
### Daemon storage-driver
@y
{: #daemon-storage-driver }
### デーモンのストレージドライバー
@z

@x
On Linux, the Docker daemon has support for several different image layer storage
drivers: `aufs`, `devicemapper`, `btrfs`, `zfs`, `overlay` and `overlay2`.
@y
Linux 上の Docker デーモンは、イメージレイヤーに対するストレージドライバーをいくつかサポートしています。
`aufs`、`devicemapper`、`btrfs`、`zfs`、`overlay`、`overlay2`といったものです。
@z

@x
The `aufs` driver is the oldest, but is based on a Linux kernel patch-set that
is unlikely to be merged into the main kernel. These are also known to cause
some serious kernel crashes. However `aufs` allows containers to share
executable and shared library memory, so is a useful choice when running
thousands of containers with the same program or libraries.
@y
`aufs`ドライバーは中でも古いものです。
Linux カーネルのパッチセットの形式になっていますが、Linux のソースにマージされることはまずありません。
なおこのパッチセットは重大なカーネルクラッシュを引き起こす場合があることが知られています。
ただし`aufs`を用いると、コンテナーが実行モジュールや共有ライブラリのメモリを共有することができます。
したがって同一プログラムまたは同一ライブラリを利用するコンテナーが何千にも及ぶような状況では、便利なドライバーです。
@z

@x
The `devicemapper` driver uses thin provisioning and Copy on Write (CoW)
snapshots. For each devicemapper graph location – typically
`/var/lib/docker/devicemapper` – a thin pool is created based on two block
devices, one for data and one for metadata. By default, these block devices
are created automatically by using loopback mounts of automatically created
sparse files. Refer to [Devicemapper options](#devicemapper-options) below
for a way how to customize this setup.
[~jpetazzo/Resizing Docker containers with the Device Mapper plugin](http://jpetazzo.github.io/2014/01/29/docker-device-mapper-resize/)
article explains how to tune your existing setup without the use of options.
@y
`devicemapper`ドライバーはシンプロビジョニング（thin provisioning）とコピーオンライト（Copy on Write; CoW）スナップショットを利用します。
devicemapper のグラフの場所ごと、通常は`/var/lib/docker/devicemapper`において、2 つのブロックデバイスに基づいたシンプールが生成されます。
その 2 つとは、1 つがデータ用、もう 1 つがメタデータ用です。
これらのブロックデバイスはデフォルトでは、自動生成されるスパースファイルへのループバックマウントを利用して自動生成されます。
この設定のカスタマイズ方法については、以下に示す [Devicemapper オプション](#devicemapper-options) を参照してください。
以下の記事 [~jpetazzo/Resizing Docker containers with the Device Mapper plugin](http://jpetazzo.github.io/2014/01/29/docker-device-mapper-resize/) では、オプションを利用せずに既存の設定を変更する方法を説明しています。
@z

@x
The `btrfs` driver is very fast for `docker build` - but like `devicemapper`
does not share executable memory between devices. Use
`dockerd -s btrfs -g /mnt/btrfs_partition`.
@y
`btrfs`ドライバーは`docker build`を高速に処理します。
ただし`devicemapper`と同じく、デバイス間で実行モジュールメモリを共有しません。
`dockerd -s btrfs -g /mnt/btrfs_partition`として利用します。
@z

@x
The `zfs` driver is probably not as fast as `btrfs` but has a longer track record
on stability. Thanks to `Single Copy ARC` shared blocks between clones will be
cached only once. Use `dockerd -s zfs`. To select a different zfs filesystem
set `zfs.fsname` option as described in [ZFS options](#zfs-options).
@y
`zfs`ドライバーは、おそらく`btrfs`ほど高速ではありません。
ただしこちらの方が安定性に関する実績があります。
`Single Copy ARC`という機能があるおかげで、クローン間でのブロック共有が一度だけはキャッシュされます。
`dockerd -s zfs`として利用します。
zfs ファイルシステムとして別のものを選ぶ場合は、[ZFS オプション](#zfs-options) に説明している`zfs.fsname`オプションを利用します。
@z

@x
The `overlay` is a very fast union filesystem. It is now merged in the main
Linux kernel as of [3.18.0](https://lkml.org/lkml/2014/10/26/137). `overlay`
also supports page cache sharing, this means multiple containers accessing
the same file can share a single page cache entry (or entries), it makes
`overlay` as efficient with memory as `aufs` driver. Call
`dockerd -s overlay` to use it.
@y
`overlay`は非常に高速のユニオンファイルシステムです。
これは Linux カーネルの [3.18.0](https://lkml.org/lkml/2014/10/26/137) からマージされるようになりました。
`overlay`はページキャッシュ共有もサポートします。
これはつまり、複数のコンテナーが同一ファイルにアクセスした場合でも、単一のページキャッシュエントリーを共有できることになります。
これによって`overlay`は`aufs`ドライバーと同様に、メモリを効率よく活用します。
利用するには`dockerd -s overlay`とします。
@z

@x
> **Note**: As promising as `overlay` is, the feature is still quite young and
> should not be used in production. Most notably, using `overlay` can cause
> excessive inode consumption (especially as the number of images grows), as
> well as being incompatible with the use of RPMs.
@y
> **メモ**
>
> `overlay`は優れた機能ですが、まだ開発されたばかりなので、本番環境では利用しないでください。
> 特に`overlay`を利用した場合に inode の消費が過剰に発生する場合があります（特にイメージ数が増えるほど）。
> また RPM 使用との互換性がありません。
@z

@x
The `overlay2` uses the same fast union filesystem but takes advantage of
[additional features](https://lkml.org/lkml/2015/2/11/106) added in Linux
kernel 4.0 to avoid excessive inode consumption. Call `dockerd -s overlay2`
to use it.
@y
`overlay2`は同じく高速のユニオンファイルシステムを用いますが、Linux カーネル 4.0 において加えられた [追加機能](https://lkml.org/lkml/2015/2/11/106) を活用します。
利用するには`dockerd -s overlay2`とします。
@z

@x
> **Note**: Both `overlay` and `overlay2` are currently unsupported on `btrfs`
> or any Copy on Write filesystem and should only be used over `ext4` partitions.
@y
> **メモ**
>
> `overlay`と`overlay2`は、ともに現時点において`btrfs`に対して、あるいはコピーオンライト（Copy on Write）ファイルシステムにおいてはサポートされていません。
> したがってこれらは`ext4`パーティションに対してのみ用いてください。
@z

@x
On Windows, the Docker daemon supports a single image layer storage driver
depending on the image platform: `windowsfilter` for Windows images, and
`lcow` for Linux containers on Windows.
@y
Windows において Docker デーモンは、イメージプラットフォームに応じて単一のイメージレイヤー向けストレージドライバーを提供します。
Windows イメージに対しては`windowsfilter`、Windows 上の Linux コンテナーに対しては`lcow`です。
@z

@x
### Options per storage driver
@y
{: #options-per-storage-driver }
### 各ストレージドライバーのオプション
@z

@x
Particular storage-driver can be configured with options specified with
`--storage-opt` flags. Options for `devicemapper` are prefixed with `dm`,
options for `zfs` start with `zfs`, options for `btrfs` start with `btrfs`
and options for `lcow` start with `lcow`.
@y
特定のストレージドライバーに対するオプションは`--storage-opt`フラグを使って設定することができます。
`devicemapper`用のオプション名は`dm`で始まります。
同様に`zfs`用は`zfs`、`btrfs`用は`btrfs`、`lcow`用は`lcow`でそれぞれ始まります。
@z

@x
#### Devicemapper options
@y
{: #devicemapper-options }
#### devicemapper 用オプション
@z

@x
This is an example of the configuration file for devicemapper on Linux:
@y
以下の例は Linux 上における devicemapper 用設定ファイルです。
@z

@x
```json
{
  "storage-driver": "devicemapper",
  "storage-opts": [
    "dm.thinpooldev=/dev/mapper/thin-pool",
    "dm.use_deferred_deletion=true",
    "dm.use_deferred_removal=true"
  ]
}
```
@y
```json
{
  "storage-driver": "devicemapper",
  "storage-opts": [
    "dm.thinpooldev=/dev/mapper/thin-pool",
    "dm.use_deferred_deletion=true",
    "dm.use_deferred_removal=true"
  ]
}
```
@z

@x
##### `dm.thinpooldev`
@y
{: #dmthinpooldev }
##### `dm.thinpooldev`オプション
@z

@x
Specifies a custom block storage device to use for the thin pool.
@y
シンプール（thin pool）を利用するカスタムブロックストレージデバイスを指定します。
@z

@x
If using a block device for device mapper storage, it is best to use `lvm`
to create and manage the thin-pool volume. This volume is then handed to Docker
to exclusively create snapshot volumes needed for images and containers.
@y
device mapper ストレージに対してブロックデバイスを利用する場合は、シンプールボリュームを生成して管理するために`lvm`を利用するのが最適です。
このボリュームはその後に Docker に受け渡されて、イメージやコンテナーに必要となるスナップショットボリュームを生成するために利用されます。
@z

@x
Managing the thin-pool outside of Engine makes for the most feature-rich
method of having Docker utilize device mapper thin provisioning as the
backing storage for Docker containers. The highlights of the lvm-based
thin-pool management feature include: automatic or interactive thin-pool
resize support, dynamically changing thin-pool features, automatic thinp
metadata checking when lvm activates the thin-pool, etc.
@y
シンプールの管理を Engine 外部で行なえば、豊富な機能を実現することができます。
つまり Docker コンテナーに対するバックストレージとして、デバイスマッパーのシンプロビジョニングが利用できます。
lvm ベースのシンプール管理機能の主な特徴は以下のものです。
自動的および対話的なシンプールのリサイズ機能のサポート、動的なシンプール変更機能、lvm によるシンプールアクティブ時の自動的シンプールメタデータチェック機能、などです。
@z

@x
As a fallback if no thin pool is provided, loopback files are
created. Loopback is very slow, but can be used without any
pre-configuration of storage. It is strongly recommended that you do
not use loopback in production. Ensure your Engine daemon has a
`--storage-opt dm.thinpooldev` argument provided.
@y
シンプールが提供されない状態では、これよりも劣るループバックファイルが生成されます。
ループバックは処理が遅いかわりに、前もってストレージ設定を行わずに利用することができます。
このループバックは本番環境において利用することはお勧めできません。
したがって Engine デーモンに、引数`--storage-opt dm.thinpooldev`が設定されていることを十分に確認してください。
@z

@x
###### Example:
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.thinpooldev=/dev/mapper/thin-pool
```
@y
```bash
$ sudo dockerd --storage-opt dm.thinpooldev=/dev/mapper/thin-pool
```
@z

@x
##### `dm.directlvm_device`
@y
{: #dmdirectlvm_device }
##### `dm.directlvm_device`オプション
@z

@x
As an alternative to providing a thin pool as above, Docker can setup a block
device for you.
@y
上に示したシンプールを利用するものとは別の方法として、ブロックデバイスを設定することができます。
@z

@x
###### Example:
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.directlvm_device=/dev/xvdf
```
@y
```bash
$ sudo dockerd --storage-opt dm.directlvm_device=/dev/xvdf
```
@z

@x
##### `dm.thinp_percent`
@y
{: #dmthinp_percent }
##### `dm.thinp_percent`オプション
@z

@x
Sets the percentage of passed in block device to use for storage.
@y
ストレージとして利用するためにブロックデバイスの利用率を設定します。
@z

@x
###### Example:
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.thinp_percent=95
```
@y
```bash
$ sudo dockerd --storage-opt dm.thinp_percent=95
```
@z

@x
##### `dm.thinp_metapercent`
@y
{: #dmthinp_metapercent }
##### `dm.thinp_metapercent`オプション
@z

@x
Sets the percentage of the passed in block device to use for metadata storage.
@y
メタデータストレージとして利用するためにブロックデバイスの利用率を設定します。
@z

@x
###### Example:
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.thinp_metapercent=1
```
@y
```bash
$ sudo dockerd --storage-opt dm.thinp_metapercent=1
```
@z

@x
##### `dm.thinp_autoextend_threshold`
@y
{: #dmthinp_autoextend_threshold }
##### `dm.thinp_autoextend_threshold`オプション
@z

@x
Sets the value of the percentage of space used before `lvm` attempts to
autoextend the available space [100 = disabled]
@y
`lvm`が、利用容量を自動拡張するにあたっての利用容量率を設定します。
（100 は無効を意味します。）
@z

@x
###### Example:
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.thinp_autoextend_threshold=80
```
@y
```bash
$ sudo dockerd --storage-opt dm.thinp_autoextend_threshold=80
```
@z

@x
##### `dm.thinp_autoextend_percent`
@y
{: #dmthinp_autoextend_percent }
##### `dm.thinp_autoextend_percent`オプション
@z

@x
Sets the value percentage value to increase the thin pool by when `lvm`
attempts to autoextend the available space [100 = disabled]
@y
`lvm`が、利用容量を自動拡張するにあたってのシンプール増量率を設定します。
（100 は無効を意味します。）
@z

@x
###### Example:
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.thinp_autoextend_percent=20
```
@y
```bash
$ sudo dockerd --storage-opt dm.thinp_autoextend_percent=20
```
@z

@x
##### `dm.basesize`
@y
{: #dmbasesize }
##### `dm.basesize`オプション
@z

@x
Specifies the size to use when creating the base device, which limits the
size of images and containers. The default value is 10G. Note, thin devices
are inherently "sparse", so a 10G device which is mostly empty doesn't use
10 GB of space on the pool. However, the filesystem will use more space for
the empty case the larger the device is.
@y
ベースデバイスの生成に用いるサイズを指定します。
これはイメージやコンテナーのサイズを制限するものです。
デフォルト値は 10 G です。
なおシンデバイスは基本的に「スパース」（sparse）であるため、デバイス上の 10 G はほとんどが空となり、プール上において 10 G を占有するものではありません。
ただしデバイスが大きくなればなるほど、ファイルシステムが扱う空データはより多くなります。
@z

@x
The base device size can be increased at daemon restart which will allow
all future images and containers (based on those new images) to be of the
new base device size.
@y
ベースデバイスのサイズは、デーモンの再起動によって増えます。
これを行えば、今後生成されるイメージやコンテナー（その新たなイメージに基づくもの）は、新たなベースデバイスサイズに基づいて生成されます。
@z

@x
###### Examples
@y
{: #examples }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.basesize=50G
```
@y
```bash
$ sudo dockerd --storage-opt dm.basesize=50G
```
@z

@x
This will increase the base device size to 50G. The Docker daemon will throw an
error if existing base device size is larger than 50G. A user can use
this option to expand the base device size however shrinking is not permitted.
@y
上のコマンドはベースデバイスサイズを 50 G に増やすものです。
ベースデバイスサイズが元から 50 G よりも大きかった場合には、Docker デーモンはエラーを出力します。
このオプションによってベースデバイスサイズを拡張することができますが、逆に縮小はできません。
@z

@x
This value affects the system-wide "base" empty filesystem
that may already be initialized and inherited by pulled images. Typically,
a change to this value requires additional steps to take effect:
@y
この設定はシステム全体にわたって、「ベース」となっている空のファイルシステムに影響を与えます。
そこにはすでに初期化を済ませたものもあり、プルイメージから継承されたものも含みます。
通常この値を変更する場合には、以下のような手順を経て変更を適用します。
@z

@x
 ```bash
$ sudo service docker stop

$ sudo rm -rf /var/lib/docker

$ sudo service docker start
```
@y
 ```bash
$ sudo service docker stop

$ sudo rm -rf /var/lib/docker

$ sudo service docker start
```
@z

@x
##### `dm.loopdatasize`
@y
{: #dmloopdatasize }
##### `dm.loopdatasize`オプション
@z

@x
> **Note**: This option configures devicemapper loopback, which should not
> be used in production.
@y
> **メモ**
>
> 本オプションは devicemapper のループバックを設定するものです。
> これを本番環境では利用しないでください。
@z

@x
Specifies the size to use when creating the loopback file for the
"data" device which is used for the thin pool. The default size is
100G. The file is sparse, so it will not initially take up this
much space.
@y
ループバックファイルを「データ」デバイスとして生成する際に用いられるサイズを指定します。
「データ」デバイスはシンプールのために利用されます。
デフォルトサイズは 100G です。
ファイルはスパースであるため、それだけの容量を初めから占有するわけではありません。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.loopdatasize=200G
```
@y
```bash
$ sudo dockerd --storage-opt dm.loopdatasize=200G
```
@z

@x
##### `dm.loopmetadatasize`
@y
{: #dmloopmetadatasize }
##### `dm.loopmetadatasize`オプション
@z

@x
> **Note**: This option configures devicemapper loopback, which should not
> be used in production.
@y
> **メモ**
>
> 本オプションは devicemapper のループバックを設定するものです。
> これを本番環境では利用しないでください。
@z

@x
Specifies the size to use when creating the loopback file for the
"metadata" device which is used for the thin pool. The default size
is 2G. The file is sparse, so it will not initially take up
this much space.
@y
シンプール用に用いられる「メタデータ」デバイスに対して、ループバックファイルが生成される際の利用サイズを指定します。
デフォルトサイズは 2G です。
ファイルはスパースであるため、それだけの容量を初めから占有するわけではありません。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.loopmetadatasize=4G
```
@y
```bash
$ sudo dockerd --storage-opt dm.loopmetadatasize=4G
```
@z

@x
##### `dm.fs`
@y
{: #dmfs }
##### `dm.fs`オプション
@z

@x
Specifies the filesystem type to use for the base device. The supported
options are "ext4" and "xfs". The default is "xfs"
@y
ベースデバイスに対して利用するファイルシステムタイプを指定します。
サポートされるオプションは「ext4」と「xfs」です。
デフォルトは「xfs」です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.fs=ext4
```
@y
```bash
$ sudo dockerd --storage-opt dm.fs=ext4
```
@z

@x
##### `dm.mkfsarg`
@y
{: #dmmkfsarg }
##### `dm.mkfsarg`オプション
@z

@x
Specifies extra mkfs arguments to be used when creating the base device.
@y
ベースデバイス生成時に用いられる追加の mkfs 引数を指定します。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt "dm.mkfsarg=-O ^has_journal"
```
@y
```bash
$ sudo dockerd --storage-opt "dm.mkfsarg=-O ^has_journal"
```
@z

@x
##### `dm.mountopt`
@y
##### `dm.mountopt`
@z

@x
Specifies extra mount options used when mounting the thin devices.
@y
シンデバイスマウント時に用いられる追加のマウントオプションを指定します。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.mountopt=nodiscard
```
@y
```bash
$ sudo dockerd --storage-opt dm.mountopt=nodiscard
```
@z

@x
##### `dm.datadev`
@y
##### `dm.datadev`
@z

@x
(Deprecated, use `dm.thinpooldev`)
@y
（廃止予定であるため、`dm.thinpooldev`を利用してください。）
@z

@x
Specifies a custom blockdevice to use for data for the thin pool.
@y
シンプール用のデータとして利用するカスタムブロックデバイスを指定します。
@z

@x
If using a block device for device mapper storage, ideally both `datadev` and
`metadatadev` should be specified to completely avoid using the loopback
device.
@y
device mapper ストレージにブロックデバイスを利用する場合は、原則として`datadev`と`metadatadev`を指定することによって、完全にループバックデバイスが利用されないようにしてください。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd \
      --storage-opt dm.datadev=/dev/sdb1 \
      --storage-opt dm.metadatadev=/dev/sdc1
```
@y
```bash
$ sudo dockerd \
      --storage-opt dm.datadev=/dev/sdb1 \
      --storage-opt dm.metadatadev=/dev/sdc1
```
@z

@x
##### `dm.metadatadev`
@y
##### `dm.metadatadev`
@z

@x
(Deprecated, use `dm.thinpooldev`)
@y
（廃止予定であるため、`dm.thinpooldev`を利用してください。）
@z

@x
Specifies a custom blockdevice to use for metadata for the thin pool.
@y
シンプールとして、メタデータに利用されるカスタムなブロックデバイスを指定します。
@z

@x
For best performance the metadata should be on a different spindle than the
data, or even better on an SSD.
@y
性能を最大限確保するために、メタデータを通常データとは異なるディスクに配置してください。
SSD 上に置くのが、より適切です。
@z

@x
If setting up a new metadata pool it is required to be valid. This can be
achieved by zeroing the first 4k to indicate empty metadata, like this:
@y
新たにメタデータプールを設定する際には、それが適正であることが必要になります。
これは空のメタデータであることを示すために、先頭の 4K をゼロで埋めることで実現できます。
@z

@x
```bash
$ dd if=/dev/zero of=$metadata_dev bs=4096 count=1
```
@y
```bash
$ dd if=/dev/zero of=$metadata_dev bs=4096 count=1
```
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd \
      --storage-opt dm.datadev=/dev/sdb1 \
      --storage-opt dm.metadatadev=/dev/sdc1
```
@y
```bash
$ sudo dockerd \
      --storage-opt dm.datadev=/dev/sdb1 \
      --storage-opt dm.metadatadev=/dev/sdc1
```
@z

@x
##### `dm.blocksize`
@y
{: #dmblocksize }
##### `dm.blocksize`オプション
@z

@x
Specifies a custom blocksize to use for the thin pool. The default
blocksize is 64K.
@y
シンプールで利用するカスタムブロックサイズを指定します。
デフォルトのブロックサイズは 64K です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.blocksize=512K
```
@y
```bash
$ sudo dockerd --storage-opt dm.blocksize=512K
```
@z

@x
##### `dm.blkdiscard`
@y
{: #dmblkdiscard }
##### `dm.blkdiscard`オプション
@z

@x
Enables or disables the use of `blkdiscard` when removing devicemapper
devices. This is enabled by default (only) if using loopback devices and is
required to resparsify the loopback file on image/container removal.
@y
devicemapper デバイスの削除時に、`blkdiscard`の利用を許可するかしないかを指定します。
これはループバックデバイス利用時（のみ）、デフォルトは有効です。
ループバックファイルの場合は、イメージやコンテナーの削除時に再度スパースとする必要があるからです。
@z

@x
Disabling this on loopback can lead to *much* faster container removal
times, but will make the space used in `/var/lib/docker` directory not be
returned to the system for other use when containers are removed.
@y
ループバックに対してこれを無効にした場合は、コンテナーの削除時間が **大きく** 削減できます。
ただしコンテナーが削除されても、`/var/lib/docker`ディレクトリに割り当てられていた領域は、他プロセスが利用できる状態に戻されることはありません。
@z

@x
###### Examples
@y
{: #examples }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.blkdiscard=false
```
@y
```bash
$ sudo dockerd --storage-opt dm.blkdiscard=false
```
@z

@x
##### `dm.override_udev_sync_check`
@y
{: #dmoverride_udev_sync_check }
##### `dm.override_udev_sync_check`オプション
@z

@x
Overrides the `udev` synchronization checks between `devicemapper` and `udev`.
`udev` is the device manager for the Linux kernel.
@y
`devicemapper`と`udev`の間における`udev`同期確認（synchronization checks）をオーバーライドします。
`udev`は Linux カーネルにおける device manager です。
@z

@x
To view the `udev` sync support of a Docker daemon that is using the
`devicemapper` driver, run:
@y
`devicemapper`ドライバーを利用する Docker デーモンが`udev`同期機能をサポートしているかどうかは、以下を実行して確認できます。
@z

@x
```bash
$ docker info
[...]
Udev Sync Supported: true
[...]
```
@y
```bash
$ docker info
[...]
Udev Sync Supported: true
[...]
```
@z

@x
When `udev` sync support is `true`, then `devicemapper` and udev can
coordinate the activation and deactivation of devices for containers.
@y
`udev`同期サポートが`true`である場合、`devicemapper`と udev は連携してコンテナーデバイスの有効化、無効化を行います。
@z

@x
When `udev` sync support is `false`, a race condition occurs between
the`devicemapper` and `udev` during create and cleanup. The race condition
results in errors and failures. (For information on these failures, see
[docker#4036](https://github.com/docker/docker/issues/4036))
@y
`udev`同期サポートが`false`である場合、コンテナーの生成や削除の際に`devicemapper`と`udev`との間で競合が発生します。
この競合状態は結果的にエラーとなって処理が失敗します。
（この処理失敗に関しては [docker#4036](https://github.com/docker/docker/issues/4036) を参照してください。）
@z

@x
To allow the `docker` daemon to start, regardless of `udev` sync not being
supported, set `dm.override_udev_sync_check` to true:
@y
`udev`同期がサポートされているかどうかに関係なく`docker`デーモンを起動するならば、`dm.override_udev_sync_check`を true に設定してください。
@z

@x
```bash
$ sudo dockerd --storage-opt dm.override_udev_sync_check=true
```
@y
```bash
$ sudo dockerd --storage-opt dm.override_udev_sync_check=true
```
@z

@x
When this value is `true`, the  `devicemapper` continues and simply warns
you the errors are happening.
@y
この設定値が`true`である場合、`devicemapper`はエラーが発生したことを単に警告するだけで処理を継続します。
@z

@x
> **Note**: The ideal is to pursue a `docker` daemon and environment that does
> support synchronizing with `udev`. For further discussion on this
> topic, see [docker#4036](https://github.com/docker/docker/issues/4036).
> Otherwise, set this flag for migrating existing Docker daemons to
> a daemon with a supported environment.
@y
> **メモ**
>
> 理想的には、`udev`との同期をサポートする`docker`デーモンおよび環境を目指すべきところです。
> これに関してのさらなるトピックが [docker#4036](https://github.com/docker/docker/issues/4036) に示されています。
> これができない限りは、既存の Docker デーモンが動作する環境上において、正常動作するように本フラグを設定してください。
@z

@x
##### `dm.use_deferred_removal`
@y
{: #dmuse_deferred_removal }
##### `dm.use_deferred_removal`オプション
@z

@x
Enables use of deferred device removal if `libdm` and the kernel driver
support the mechanism.
@y
`libdm`とカーネルドライバーが遅延デバイス無効化（deferred device removal）の機能をサポートしていれば、その機能を有効にします。
@z

@x
Deferred device removal means that if device is busy when devices are
being removed/deactivated, then a deferred removal is scheduled on
device. And devices automatically go away when last user of the device
exits.
@y
遅延デバイス無効化とは、デバイスの無効化による削除が行われる際にそのデバイスがビジーであると、そのデバイスに対して遅延無効化がスケジュールされるものです。
その後にデバイスの最終ユーザーの利用が終了すると、自動的にデバイスが無効化されます。
@z

@x
For example, when a container exits, its associated thin device is removed.
If that device has leaked into some other mount namespace and can't be
removed, the container exit still succeeds and this option causes the
system to schedule the device for deferred removal. It does not wait in a
loop trying to remove a busy device.
@y
たとえばコンテナーが処理終了すると、関連するシンデバイスは無効化されます。
このデバイスが別のマウント名前空間に割り振られていると、無効化することができません。
それでもコンテナーは正常終了します。
そして本オプションによって、システムがこのデバイスを遅延無効化の対象としてスケジュールします。
デバイスがビジーであるからといって、処理ループに入って無効化完了を待つようなことはありません。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.use_deferred_removal=true
```
@y
```bash
$ sudo dockerd --storage-opt dm.use_deferred_removal=true
```
@z

@x
##### `dm.use_deferred_deletion`
@y
{: #dmuse_deferred_deletion }
##### `dm.use_deferred_deletion`オプション
@z

@x
Enables use of deferred device deletion for thin pool devices. By default,
thin pool device deletion is synchronous. Before a container is deleted,
the Docker daemon removes any associated devices. If the storage driver
can not remove a device, the container deletion fails and daemon returns.
@y
シンプールデバイスに対して、遅延デバイス削除（deferred device deletion）の利用を有効化します。
デフォルトでシンプールデバイスの削除は同期的に行われます。
コンテナーが削除される際には、Docker デーモンがあらゆる関連デバイスを同時に削除します。
ストレージドライバーがデバイスを削除できなかった場合、コンテナー削除は失敗してデーモンは処理を終えます。
@z

@x
```none
Error deleting container: Error response from daemon: Cannot destroy container
```
@y
```none
Error deleting container: Error response from daemon: Cannot destroy container
```
@z

@x
To avoid this failure, enable both deferred device deletion and deferred
device removal on the daemon.
@y
この異常終了を避けるには、デーモンに対して遅延デバイス削除（deletion）と遅延デバイス無効化（removal）の両方を有効にします。
@z

@x
```bash
$ sudo dockerd \
      --storage-opt dm.use_deferred_deletion=true \
      --storage-opt dm.use_deferred_removal=true
```
@y
```bash
$ sudo dockerd \
      --storage-opt dm.use_deferred_deletion=true \
      --storage-opt dm.use_deferred_removal=true
```
@z

@x
With these two options enabled, if a device is busy when the driver is
deleting a container, the driver marks the device as deleted. Later, when
the device isn't in use, the driver deletes it.
@y
この 2 つのオプションが有効になっていると、ドライバーがコンテナー削除を行う際にデバイスがビジーであっても、ドライバーはそのデバイスを削除対象として印をつけておき、後にそのデバイスが使われなくなったら削除します。
@z

@x
In general it should be safe to enable this option by default. It will help
when unintentional leaking of mount point happens across multiple mount
namespaces.
@y
一般的にこのオプションは、デフォルトで有効にしておいても安全です。
意図せずにマウントポイントが複数のマウント名前空間にわたって広がってしまうことが避けられます。
@z

@x
##### `dm.min_free_space`
@y
{: #dmmin_free_space }
##### `dm.min_free_space`オプション
@z

@x
Specifies the min free space percent in a thin pool require for new device
creation to succeed. This check applies to both free data space as well
as free metadata space. Valid values are from 0% - 99%. Value 0% disables
free space checking logic. If user does not specify a value for this option,
the Engine uses a default value of 10%.
@y
新たなデバイスを新規に生成するために必要となる、シンプール内の空き領域の最小率を指定します。
これは、データとメタデータの両方の空き領域を確認します。
有効な値は 0% から 99% です。
0% を指定すると、空き領域の確認処理を無効にします。
ユーザーによってこのオプションが指定されなかった場合、Engine はデフォルト値 10% を用います。
@z

@x
Whenever a new a thin pool device is created (during `docker pull` or during
container creation), the Engine checks if the minimum free space is
available. If sufficient space is unavailable, then device creation fails
and any relevant `docker` operation fails.
@y
新たなシンプールデバイスが生成される際（`docker pull`の処理中、あるいはコンテナー生成中）には、必ず Engine が最低どれだけの空き領域が利用可能かを確認します。
十分な空き領域がなかった場合、デバイス生成処理は失敗して、これに関連した`docker`処理もすべて失敗します。
@z

@x
To recover from this error, you must create more free space in the thin pool
to recover from the error. You can create free space by deleting some images
and containers from the thin pool. You can also add more storage to the thin
pool.
@y
上のエラーを解消するためには、シンプール内により多くの空き領域を生成しておくことが必要です。
イメージやコンテナーをいくつかシンプールから削除すれば、空き領域は確保されます。
あるいはシンプールに対して、より多くのストレージを割り当てる方法もあります。
@z

@x
To add more space to a LVM (logical volume management) thin pool, just add
more storage to the volume group container thin pool; this should automatically
resolve any errors. If your configuration uses loop devices, then stop the
Engine daemon, grow the size of loop files and restart the daemon to resolve
the issue.
@y
LVM（logical volume management）上のシンプールに容量追加を行うなら、シンプールがあるボリュームグループに対してストレージ追加を行ないます。
そうするだけでエラーは自動解消されます。
ループデバイスを利用するように設定している場合は、いったん Engine デーモンを停止させて、ループファイルのサイズを増やした上でデーモンを再起動すれば、エラーは解消します。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.min_free_space=10%
```
@y
```bash
$ sudo dockerd --storage-opt dm.min_free_space=10%
```
@z

@x
##### `dm.xfs_nospace_max_retries`
@y
{: #dmxfs_nospace_max_retries }
##### `dm.xfs_nospace_max_retries`オプション
@z

@x
Specifies the maximum number of retries XFS should attempt to complete
IO when ENOSPC (no space) error is returned by underlying storage device.
@y
対応しているストレージドライバーから ENOSPC（スペースなし）エラーが返された際に、XFS が I/O 完了を繰り返す最大回数を指定します。
@z

@x
By default XFS retries infinitely for IO to finish and this can result
in unkillable process. To change this behavior one can set
xfs_nospace_max_retries to say 0 and XFS will not retry IO after getting
ENOSPC and will shutdown filesystem.
@y
デフォルトで XFS は I/O が完了するまで無限に試行し続けます。
そうなってしまうと kill できないプロセスとなってしまいます。
この動作を変更するには、たとえば xfs_nospace_max_retries に 0 を指定します。
そうすると XFS は ENOSPC を受け取った後は試行を行わず、ファイルシステムをシャットダウンします。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd --storage-opt dm.xfs_nospace_max_retries=0
```
@y
```bash
$ sudo dockerd --storage-opt dm.xfs_nospace_max_retries=0
```
@z

@x
##### `dm.libdm_log_level`
@y
{: #dmlibdm_log_level }
##### `dm.libdm_log_level`オプション
@z

@x
Specifies the maxmimum `libdm` log level that will be forwarded to the
`dockerd` log (as specified by `--log-level`). This option is primarily
intended for debugging problems involving `libdm`. Using values other than the
defaults may cause false-positive warnings to be logged.
@y
`libdm`の最大ログレベルを指定します。
これは`dockerd`ログ（`--log-level`で指定される）に受け渡されます。
このオプションが主に用いられるのは、`libdm`に関係した問題をデバッグする場合です。
この設定をデフォルト値以外にすると、誤って警告ログが検出される場合があります。
@z

@x
Values specified must fall within the range of valid `libdm` log levels. At the
time of writing, the following is the list of `libdm` log levels as well as
their corresponding levels when output by `dockerd`.
@y
指定する値は`libdm`ログレベルの正常値範囲でなければなりません。
現時点においては、`libdm`ログレベルと`dockerd`により出力される対応ログレベルの一覧は以下のようになります。
@z

@x
| `libdm` Level | Value | `--log-level` |
| ------------- | -----:| ------------- |
| `_LOG_FATAL`  |     2 | error         |
| `_LOG_ERR`    |     3 | error         |
| `_LOG_WARN`   |     4 | warn          |
| `_LOG_NOTICE` |     5 | info          |
| `_LOG_INFO`   |     6 | info          |
| `_LOG_DEBUG`  |     7 | debug         |
@y
| `libdm` レベル | 値    | `--log-level` |
| -------------- | -----:| ------------- |
| `_LOG_FATAL`   |     2 | error         |
| `_LOG_ERR`     |     3 | error         |
| `_LOG_WARN`    |     4 | warn          |
| `_LOG_NOTICE`  |     5 | info          |
| `_LOG_INFO`    |     6 | info          |
| `_LOG_DEBUG`   |     7 | debug         |
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd \
      --log-level debug \
      --storage-opt dm.libdm_log_level=7
```
@y
```bash
$ sudo dockerd \
      --log-level debug \
      --storage-opt dm.libdm_log_level=7
```
@z

@x
#### ZFS options
@y
{: #zfs-options }
#### ZFS 用オプション
@z

@x
##### `zfs.fsname`
@y
{: #zfs.fsname }
##### `zfs.fsname`オプション
@z

@x
Set zfs filesystem under which docker will create its own datasets.
By default docker will pick up the zfs filesystem where docker graph
(`/var/lib/docker`) is located.
@y
Docker が独自のデータセットを生成する場所となる zfs ファイルシステムを指定します。
Docker はデフォルトでは、Docker グラフ（`/var/lib/docker`）が置かれている zfs ファイルシステムを利用します。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd -s zfs --storage-opt zfs.fsname=zroot/docker
```
@y
```bash
$ sudo dockerd -s zfs --storage-opt zfs.fsname=zroot/docker
```
@z

@x
#### Btrfs options
@y
{: #btrfs-options }
#### Btrfs 用オプション
@z

@x
##### `btrfs.min_space`
@y
{: #btrfsmin_space }
##### `btrfs.min_space`オプション
@z

@x
Specifies the minimum size to use when creating the subvolume which is used
for containers. If user uses disk quota for btrfs when creating or running
a container with **--storage-opt size** option, docker should ensure the
**size** cannot be smaller than **btrfs.min_space**.
@y
コンテナーが利用するサブボリュームを生成するにあたっての最小サイズを指定します。
btrfs 上においてユーザーにディスククォータが利用されている場合に、コンテナーの生成および起動に **--storage-opt size** オプションを利用すると、Docker はその **size** が **btrfs.min_space** よりも小さくならないようにします。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd -s btrfs --storage-opt btrfs.min_space=10G
```
@y
```bash
$ sudo dockerd -s btrfs --storage-opt btrfs.min_space=10G
```
@z

@x
#### Overlay2 options
@y
{: #overlay2-options }
#### Overlay2 用オプション
@z

@x
##### `overlay2.override_kernel_check`
@y
{: #overlay2override_kernel_check }
##### `overlay2.override_kernel_check`オプション
@z

@x
Overrides the Linux kernel version check allowing overlay2. Support for
specifying multiple lower directories needed by overlay2 was added to the
Linux kernel in 4.0.0. However, some older kernel versions may be patched
to add multiple lower directory support for OverlayFS. This option should
only be used after verifying this support exists in the kernel. Applying
this option on a kernel without this support will cause failures on mount.
@y
Linux カーネル版の overlay2 チェック機能をオーバーライドします。
overlay2 では複数の下位ディレクトリを必要としますが、この指定をサポートする機能が Linux カーネル 4.0.0 には加えられています。
ただしカーネルバージョンが古い場合に OverlayFS に対して、複数の下位ディレクトリサポートを追加するためのパッチが適用されている場合があります。
本オプションは、カーネル内にそのサポート機能が存在していることを確認した上でのみ、その機能を利用するようにします。
このサポート機能を持っていないカーネルに対して本オプションを指定すると、マウント処理時にエラーとなります。
@z

@x
##### `overlay2.size`
@y
{: #overlay2.size }
##### `overlay2.size`オプション
@z

@x
Sets the default max size of the container. It is supported only when the
backing fs is `xfs` and mounted with `pquota` mount option. Under these
conditions the user can pass any size less then the backing fs size.
@y
コンテナーのデフォルト最大サイズを設定します。
これはファイルシステムが`xfs`であって、`pquota`マウントオプションを使ってマウントされている場合にのみサポートされます。
この条件下であれば、ファイルシステムサイズの範囲内でどのようなサイズでも指定が可能です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```bash
$ sudo dockerd -s overlay2 --storage-opt overlay2.size=1G
```
@y
```bash
$ sudo dockerd -s overlay2 --storage-opt overlay2.size=1G
```
@z

@x
#### Windowsfilter options
@y
{: #windowsfilter-options }
#### Windowsfilter 用オプション
@z

@x
##### `size`
@y
{: #size }
##### `size`オプション
@z

@x
Specifies the size to use when creating the sandbox which is used for containers.
Defaults to 20G.
@y
コンテナーが利用するサンドボックスを生成するために用いるサイズを指定します。
デフォルトは 20G です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt size=40G
```
@y
```powershell
C:\> dockerd --storage-opt size=40G
```
@z

@x
#### LCOW (Linux Containers on Windows) options
@y
{: #lcow-linux-containers-on-windows-options }
#### LCOW（Linux Containers on Windows）用オプション
@z

@x
##### `lcow.globalmode`
@y
{: #lcowglobalmode }
##### `lcow.globalmode`オプション
@z

@x
Specifies whether the daemon instantiates utility VM instances as required 
(recommended and default if omitted), or uses single global utility VM (better
performance, but has security implications and not recommended for production
deployments).
@y
デーモンが必要に応じてユーティリティー VM インスタンスを初期化するかどうか（これが推奨され、省略時のデフォルトです）、あるいは単一のグローバルユーティリティー VM を利用するか（パフォーマンスは向上しますが、セキュリティに影響があるため、本番環境へのデプロイには推奨されません）、このいずれかを指定します。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt lcow.globalmode=false
```
@y
```powershell
C:\> dockerd --storage-opt lcow.globalmode=false
```
@z

@x
##### `lcow.kirdpath`
@y
{: #lcow.kirdpath }
##### `lcow.kirdpath`オプション
@z

@x
Specifies the folder path to the location of a pair of kernel and initrd files
used for booting a utility VM. Defaults to `%ProgramFiles%\Linux Containers`.
@y
ユーティリティー VM をブートするために利用される 2 つのファイル、つまりカーネルと initrd ファイルが置かれているフォルダーパスを指定します。
デフォルトは`%ProgramFiles%\Linux Containers`です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt lcow.kirdpath=c:\path\to\files
```
@y
```powershell
C:\> dockerd --storage-opt lcow.kirdpath=c:\path\to\files
```
@z

@x
##### `lcow.kernel`
@y
{: #lcow.kernel }
##### `lcow.kernel`オプション
@z

@x
Specifies the filename of a kernel file located in the `lcow.kirdpath` path.
Defaults to `bootx64.efi`.
@y
`lcow.kirdpath`で指定したパス内にあるカーネルファイル名を指定します。
デフォルトは`bootx64.efi`です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt lcow.kernel=kernel.efi
```
@y
```powershell
C:\> dockerd --storage-opt lcow.kernel=kernel.efi
```
@z

@x
##### `lcow.initrd`
@y
{: #lcow.initrd }
##### `lcow.initrd`オプション
@z

@x
Specifies the filename of an initrd file located in the `lcow.kirdpath` path.
Defaults to `initrd.img`.
@y
`lcow.kirdpath`で指定したパス内にある initrd ファイル名を指定します。
デフォルトは`initrd.img`です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt lcow.initrd=myinitrd.img
```
@y
```powershell
C:\> dockerd --storage-opt lcow.initrd=myinitrd.img
```
@z

@x
##### `lcow.bootparameters`
@y
##### `lcow.bootparameters`
@z

@x
Specifies additional boot parameters for booting utility VMs when in kernel/
initrd mode. Ignored if the utility VM is booting from VHD. These settings
are kernel specific.
@y
カーネル/initrd モードであるときに、ユーティリティー VM をブートするにあたっての追加のブートパラメーターを指定します。
ユーティリティー VM が VHD からブートされる場合には無視されます。
この設定はカーネル固有のものです。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt "lcow.bootparameters='option=value'"
```
@y
```powershell
C:\> dockerd --storage-opt "lcow.bootparameters='option=value'"
```
@z

@x
##### `lcow.vhdx`
@y
##### `lcow.vhdx`
@z

@x
Specifies a custom VHDX to boot a utility VM, as an alternate to kernel
and initrd booting. Defaults to `uvm.vhdx` under `lcow.kirdpath`.
@y
ユーティリティー VM をブートするために カーネルおよび initrd ではなく、カスタム VHDX を指定します。
デフォルトは`lcow.kirdpath`配下にある`uvm.vhdx`です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt lcow.vhdx=custom.vhdx
```
@y
```powershell
C:\> dockerd --storage-opt lcow.vhdx=custom.vhdx
```
@z

@x
##### `lcow.timeout`
@y
##### `lcow.timeout`
@z

@x
Specifies the timeout for utility VM operations in seconds. Defaults
to 300.
@y
ユーティリティー VM による処理のタイムアウト時間を秒単位で指定します。
デフォルトは 300 です。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt lcow.timeout=240
```
@y
```powershell
C:\> dockerd --storage-opt lcow.timeout=240
```
@z

@x
##### `lcow.sandboxsize`
@y
##### `lcow.sandboxsize`
@z

@x
Specifies the size in GB to use when creating the sandbox which is used for
containers. Defaults to 20. Cannot be less than 20.
@y
コンテナーが利用するサンドボックスを生成するために用いるサイズを GB 単位で指定します。
デフォルトは 20 であり、20 未満を指定することはできません。
@z

@x
###### Example
@y
{: #example }
###### 利用例
@z

@x
```powershell
C:\> dockerd --storage-opt lcow.sandboxsize=40
```
@y
```powershell
C:\> dockerd --storage-opt lcow.sandboxsize=40
```
@z

@x
### Docker runtime execution options
@y
{: #docker-runtime-execution-options }
### Docker ランタイム実行オプション
@z

@x
The Docker daemon relies on a
[OCI](https://github.com/opencontainers/runtime-spec) compliant runtime
(invoked via the `containerd` daemon) as its interface to the Linux
kernel `namespaces`, `cgroups`, and `SELinux`.
@y
Docker デーモンは [OCI](https://github.com/opencontainers/runtime-spec) 標準ランタイム（`containerd`デーモンを通じて実行される）に準拠し、Linux カーネルの`namespaces`、`cgroups`、`SELinux`へのインターフェースとして動作します。
@z

@x
By default, the Docker daemon automatically starts `containerd`. If you want to
control `containerd` startup, manually start `containerd` and pass the path to
the `containerd` socket using the `--containerd` flag. For example:
@y
デフォルトで Docker デーモンは自動的に`containerd`を起動します。
`containerd`の起動を制御したい場合は、`containerd`を手動で起動するようにし、`--containerd`フラグへは`containerd`ソケットへのパスを指定します。
@z

@x
```bash
$ sudo dockerd --containerd /var/run/dev/docker-containerd.sock
```
@y
```bash
$ sudo dockerd --containerd /var/run/dev/docker-containerd.sock
```
@z

@x
Runtimes can be registered with the daemon either via the
configuration file or using the `--add-runtime` command line argument.
@y
ランタイムはデーモンに登録することができます。
これは設定ファイルか、あるいはコマンドライン引数`--add-runtime`を使って行います。
@z

@x
The following is an example adding 2 runtimes via the configuration:
@y
以下に示すのは、設定ファイルを使って 2 つのランタイムを追加する例です。
@z

@x
```json
{
	"default-runtime": "runc",
	"runtimes": {
		"runc": {
			"path": "runc"
		},
		"custom": {
			"path": "/usr/local/bin/my-runc-replacement",
			"runtimeArgs": [
				"--debug"
			]
		}
	}
}
```
@y
```json
{
	"default-runtime": "runc",
	"runtimes": {
		"runc": {
			"path": "runc"
		},
		"custom": {
			"path": "/usr/local/bin/my-runc-replacement",
			"runtimeArgs": [
				"--debug"
			]
		}
	}
}
```
@z

@x
This is the same example via the command line:
@y
以下は同じことをコマンドラインから行う例です。
@z

@x
```bash
$ sudo dockerd --add-runtime runc=runc --add-runtime custom=/usr/local/bin/my-runc-replacement
```
@y
```bash
$ sudo dockerd --add-runtime runc=runc --add-runtime custom=/usr/local/bin/my-runc-replacement
```
@z

@x
> **Note**: Defining runtime arguments via the command line is not supported.
@y
> **メモ**
>
> コマンドラインからランタイム引数を定義することはサポートされていません。
@z

@x
#### Options for the runtime
@y
{: #options-for-the-runtime }
#### ランタイムに対するオプション
@z

@x
You can configure the runtime using options specified
with the `--exec-opt` flag. All the flag's options have the `native` prefix. A
single `native.cgroupdriver` option is available.
@y
ランタイムが利用するオプションは`--exec-opt`フラグを使って設定することができます。
オプションの先頭には`native`がつきます。
利用可能なオプションは、ただ 1 つ`native.cgroupdriver`オプションです。
@z

@x
The `native.cgroupdriver` option specifies the management of the container's
cgroups. You can only specify `cgroupfs` or `systemd`. If you specify
`systemd` and it is not available, the system errors out. If you omit the
`native.cgroupdriver` option,` cgroupfs` is used.
@y
`native.cgroupdriver`オプションは、コンテナーの cgroup に対する管理方法を指定します。
指定できるのは`cgroupfs`または`systemd`のいずれかです。
`systemd`を指定してもそれが利用できなかった場合は、システムエラーとなります。
`native.cgroupdriver`オプションを省略すると`cgroupfs`が利用されます。
@z

@x
This example sets the `cgroupdriver` to `systemd`:
@y
以下の例は`cgroupdriver`に`systemd`を設定するものです。
@z

@x
```bash
$ sudo dockerd --exec-opt native.cgroupdriver=systemd
```
@y
```bash
$ sudo dockerd --exec-opt native.cgroupdriver=systemd
```
@z

@x
Setting this option applies to all containers the daemon launches.
@y
このオプションを設定すると、デーモンが起動するコンテナーすべてに適用されます。
@z

@x
Also Windows Container makes use of `--exec-opt` for special purpose. Docker user
can specify default container isolation technology with this, for example:
@y
また Windows コンテナーにおいては、この`--exec-opt`を特別な目的で利用します。
Docker ユーザーがこれを使って、デフォルトのコンテナー分離技術（isolation technology）を指定できます。
@z

@x
```console
> dockerd --exec-opt isolation=hyperv
```
@y
```console
> dockerd --exec-opt isolation=hyperv
```
@z

@x
Will make `hyperv` the default isolation technology on Windows. If no isolation
value is specified on daemon start, on Windows client, the default is
`hyperv`, and on Windows server, the default is `process`.
@y
上のコマンドは、Windows 上においてデフォルトの分離技術を`hyperv`とします。
デーモン起動時に分離技術の指定が行われなかった場合、Windows クライアントではデフォルトを`hyperv`とします。
また Windows Server ではデフォルトは`process`となります。
@z

@x
### Daemon DNS options
@y
{: #daemon-dns-options }
### デーモンの DNS オプション
@z

@x
To set the DNS server for all Docker containers, use:
@y
Docker コンテナーすべてに対して DNS サーバーを設定するには、以下のようにします。
@z

@x
```bash
$ sudo dockerd --dns 8.8.8.8
```
@y
```bash
$ sudo dockerd --dns 8.8.8.8
```
@z

@x
To set the DNS search domain for all Docker containers, use:
@y
Docker コンテナーすべてに対して DNS 検索ドメインを設定するには、以下のようにします。
@z

@x
```bash
$ sudo dockerd --dns-search example.com
```
@y
```bash
$ sudo dockerd --dns-search example.com
```
@z

@x
### Allow push of nondistributable artifacts
@y
{: #allow-push-of-nondistributable-artifacts }
### 配布制限のある成果物のプッシュ
@z

@x
Some images (e.g., Windows base images) contain artifacts whose distribution is
restricted by license. When these images are pushed to a registry, restricted
artifacts are not included.
@y
イメージの中には（たとえば Windows ベースイメージのように）ライセンスによって配布が制限されているものがあります。
そのようなイメージをレジストリにプッシュした場合、制限された製品をレジストリに含めることはできません。
@z

@x
To override this behavior for specific registries, use the
`--allow-nondistributable-artifacts` option in one of the following forms:
@y
指定するレジストリに対して上記の動作をオーバーライドするには`--allow-nondistributable-artifacts`オプションを用います。
その際の書式は以下のいずれかです。
@z

@x
* `--allow-nondistributable-artifacts myregistry:5000` tells the Docker daemon
  to push nondistributable artifacts to myregistry:5000.
* `--allow-nondistributable-artifacts 10.1.0.0/16` tells the Docker daemon to
  push nondistributable artifacts to all registries whose resolved IP address
  is within the subnet described by the CIDR syntax.
@y
* `--allow-nondistributable-artifacts myregistry:5000`と指定すると、Docker デーモンに対して配布制限のある成果物（nondistributable artifacts）を  myregistry:5000 へプッシュする指示となります。
* `--allow-nondistributable-artifacts 10.1.0.0/16`と指定すると、Docker デーモンに対して配布制限のある成果物を、IP アドレスが CIDR 記述に表現されたサブネットに含まれるレジストリにプッシュする指示となります。
@z

@x
This option can be used multiple times.
@y
このオプションは複数個指定することができます。
@z

@x
This option is useful when pushing images containing nondistributable artifacts
to a registry on an air-gapped network so hosts on that network can pull the
images without connecting to another server.
@y
このオプションが活用できるのは、エアギャップなネットワーク上のレジストリに、配布制限された成果物を含むイメージをプッシュするような場合です。
そのネットワーク上のホストからは、別のサーバーに接続することなくイメージをプルすることができます。
@z

@x
> **Warning**: Nondistributable artifacts typically have restrictions on how
> and where they can be distributed and shared. Only use this feature to push
> artifacts to private registries and ensure that you are in compliance with
> any terms that cover redistributing nondistributable artifacts.
@y
> **警告**
>
> 配布制限のある成果物は、これを配布し共有する方法や場所に関しての制約があります。
> 本機能を利用して成果物をプッシュするのはプライベートリポジトリに行うものとしてください。
> また配布制限のある成果物の再配布に関しては、必ずその条件に準拠してください。
@z

@x
### Insecure registries
@y
{: #insecure-registries }
### セキュアでないレジストリ
@z

@x
Docker considers a private registry either secure or insecure. In the rest of
this section, *registry* is used for *private registry*, and `myregistry:5000`
is a placeholder example for a private registry.
@y
Docker におけるプライベートリポジトリは、セキュアとセキュアでないもののいずれも扱われます。
この節に示す **レジストリ** とは **プライベートリポジトリ** のことであるとします。
そしてプライベートリポジトリの例として`myregistry:5000`を用いることにします。
@z

@x
A secure registry uses TLS and a copy of its CA certificate is placed on the
Docker host at `/etc/docker/certs.d/myregistry:5000/ca.crt`. An insecure
registry is either not using TLS (i.e., listening on plain text HTTP), or is
using TLS with a CA certificate not known by the Docker daemon. The latter can
happen when the certificate was not found under
`/etc/docker/certs.d/myregistry:5000/`, or if the certificate verification
failed (i.e., wrong CA).
@y
セキュアなレジストリでは TLS が用いられます。
そして CA 証明書のコピーが Docker ホスト上の`/etc/docker/certs.d/myregistry:5000/ca.crt`に置かれます。
一方セキュアでないレジストリとは、TLS を利用していないもの（つまり HTTP を平文でやりとりするもの）か、あるいは TLS を利用してはいるものの、デーモンがその CA 証明書を識別できない状態にあるものを指します。
後者の例は、`/etc/docker/certs.d/myregistry:5000/`の配下に証明書が見つからなかった場合や、証明書の照合に失敗した（証明書が誤っているなどの）場合に発生します。
@z

@x
By default, Docker assumes all, but local (see local registries below),
registries are secure. Communicating with an insecure registry is not possible
if Docker assumes that registry is secure. In order to communicate with an
insecure registry, the Docker daemon requires `--insecure-registry` in one of
the following two forms:
@y
デフォルトで Docker はローカルのレジストリであれば、それはすべてセキュアであるとみなします（ローカルレジストリについては後述を参照してください）。
Docker がセキュアでないレジストリをセキュアであるとみなしてしまうと、そのときにはそのレジストリとの通信が不能となります。
セキュアでないレジストリとの通信を行うためには、Docker デーモンに`--insecure-registry`の指定が必要です。
その場合、以下の 2 つの書式のいずれかを用います。
@z

@x
* `--insecure-registry myregistry:5000` tells the Docker daemon that
  myregistry:5000 should be considered insecure.
* `--insecure-registry 10.1.0.0/16` tells the Docker daemon that all registries
  whose domain resolve to an IP address is part of the subnet described by the
  CIDR syntax, should be considered insecure.
@y
* `--insecure-registry myregistry:5000`と指定すると、Docker デーモンに対して myregistry:5000 がセキュアでないことを指示します。
* `--insecure-registry 10.1.0.0/16`と指定すると、Docker デーモンに対して、レジストリのドメインの IP アドレスが CIDR 記述に表現されたサブネットに含まれるようなレジストリについて、そのすべてがセキュアでないことを指示します。
@z

@x
The flag can be used multiple times to allow multiple registries to be marked
as insecure.
@y
このフラグは複数個指定することが可能であり、複数のレジストリをセキュアでないものとして指定できます。
@z

@x
If an insecure registry is not marked as insecure, `docker pull`,
`docker push`, and `docker search` will result in an error message prompting
the user to either secure or pass the `--insecure-registry` flag to the Docker
daemon as described above.
@y
セキュアでないレジストリをセキュアでないと指定しておかないと、`docker pull`、`docker push`、`docker search`がエラーになります。
その際にはセキュアなレジストリとするか、あるいは上で示したように Docker デーモンに対して`--insecure-registry`フラグを指定するようにします。
@z

@x
Local registries, whose IP address falls in the 127.0.0.0/8 range, are
automatically marked as insecure as of Docker 1.3.2. It is not recommended to
rely on this, as it may change in the future.
@y
Docker 1.3.2 以降において、ローカルレジストリの IP アドレスが 127.0.0.0/8 の範囲にある場合、このレジストリはセキュアではないと扱われます。
ただしこれに期待するのは適切ではありません。
将来的にこの扱いは変更されるかもしれないからです。
@z

@x
Enabling `--insecure-registry`, i.e., allowing un-encrypted and/or untrusted
communication, can be useful when running a local registry.  However,
because its use creates security vulnerabilities it should ONLY be enabled for
testing purposes.  For increased security, users should add their CA to their
system's list of trusted CAs instead of enabling `--insecure-registry`.
@y
`--insecure-registry`を有効にするということは、つまり暗号化されていない通信、あるいは信頼できない通信を可能にするということです。
これはローカルレジストリを運用している場合には便利です。
ただしこれを利用するとセキュリティぜい弱性を生み出してしまうため、これを有効にするのはテスト目的のみとしてください。
セキュリティを向上させるためには、`--insecure-registry`を有効とするのではなく、システムの信頼できる CA リストに CA を加えるようにしてください。
@z

@x
#### Legacy Registries
@y
{: #legacy-registries }
#### 古いレジストリ
@z

@x
Starting with Docker 17.12, operations against registries supporting only the 
legacy v1 protocol are no longer supported. Specifically, the daemon will not
attempt `push`, `pull` and `login` to v1 registries. The exception to this is
`search` which can still be performed on v1 registries.
@y
古い v1 プロトコルのみに対応するレジストリへの操作は、Docker 17.12 からはサポートされません。
特にデーモンは v1 レジストリに対しての`push`、`pull`、`login`を行ないません。
ただし`search`だけは例外であり、v1 レジストリに対してもこの操作は利用できます。
@z

@x
The `disable-legacy-registry` configuration option has been removed and, when
used, will produce an error on daemon startup.
@y
設定オプション`disable-legacy-registry`は削除されました。
したがってこれを利用した場合、デーモンの起動時にエラーが発生します。
@z

@x
### Running a Docker daemon behind an HTTPS_PROXY
@y
{: #running-a-docker-daemon-behind-an-https_proxy }
### HTTPS_PROXY のもとでの Docker デーモン実行
@z

@x
When running inside a LAN that uses an `HTTPS` proxy, the Docker Hub
certificates will be replaced by the proxy's certificates. These certificates
need to be added to your Docker host's configuration:
@y
`HTTPS`プロキシーを用いる LAN 内においてデーモンを起動している場合、Docker Hub の証明書はプロキシーの証明書に置き換えられます。
したがってその証明書を Docker ホストの設定に追加しておくことが必要になります。
@z

@x
1. Install the `ca-certificates` package for your distribution
2. Ask your network admin for the proxy's CA certificate and append them to
   `/etc/pki/tls/certs/ca-bundle.crt`
3. Then start your Docker daemon with `HTTPS_PROXY=http://username:password@proxy:port/ dockerd`.
   The `username:` and `password@` are optional - and are only needed if your
   proxy is set up to require authentication.
@y
1. 利用するディストリビューションの`ca-certificates`パッケージをインストールします。
2. ネットワーク管理者からプロキシーの CA 証明書の情報を得て、これを`/etc/pki/tls/certs/ca-bundle.crt`に追加します。
3. そして Docker を`HTTPS_PROXY=http://username:password@proxy:port/ dockerd`として実行します。
   `username:`と`password@`は任意です。
   これはプロキシー認証を行う設定になっている場合にのみ必要となります。
@z

@x
This will only add the proxy and authentication to the Docker daemon's requests -
your `docker build`s and running containers will need extra configuration to
use the proxy
@y
これは Docker デーモンのリクエストに対して、プロキシーと認証の情報を追加するだけです。
一方`docker build`コマンドや実行中コンテナーにとっては、プロキシーを利用するための情報がさらに必要となります。
@z

@x
### Default `ulimit` settings
@y
{: #default-ulimit-settings }
### デフォルトの`ulimit`設定
@z

@x
`--default-ulimit` allows you to set the default `ulimit` options to use for
all containers. It takes the same options as `--ulimit` for `docker run`. If
these defaults are not set, `ulimit` settings will be inherited, if not set on
`docker run`, from the Docker daemon. Any `--ulimit` options passed to
`docker run` will overwrite these defaults.
@y
`--default-ulimit`は、すべてのコンテナーが利用するデフォルトの`ulimit`オプションを指定するものです。
`docker run`には同じオプションとして`--ulimit`があります。
これらに対してデフォルトが設定されていなかった場合は、`ulimit`の設定が受け継がれます。
`docker run`において設定されていなければ Docker デーモンから引き継ぎます。
`docker run`において指定された`--ulimit`オプションは、すべてそのデフォルト値をオーバーライドします。
@z

@x
Be careful setting `nproc` with the `ulimit` flag as `nproc` is designed by Linux to
set the maximum number of processes available to a user, not to a container. For details
please check the [run](run.md) reference.
@y
`ulimit`フラグを使って`nproc`を設定する場合には注意が必要です。
`nproc`は利用可能なプロセスの最大数を設定するものとして Linux 上において設計されていますが、利用可能であるのはユーザーであってコンテナーではないからです。
詳しくは [run](run.md) リファレンスを参照してください。
@z

@x
### Node discovery
@y
{: #node-discovery }
### ノード検出
@z

@x
The `--cluster-advertise` option specifies the `host:port` or `interface:port`
combination that this particular daemon instance should use when advertising
itself to the cluster. The daemon is reached by remote hosts through this value.
If you  specify an interface, make sure it includes the IP address of the actual
Docker host. For Engine installation created through `docker-machine`, the
interface is typically `eth1`.
@y
`--cluster-advertise`オプションは`host:port`または`interface:port`という組み合わせにより指定されます。
これは特定のデーモンインスタンスが、自分自身をクラスターに通知（advertise）する際に用います。
リモートホストはこの値を通じてデーモンに到達します。
インターフェースを指定する場合は、実際の Docker ホストの IP アドレスを含めてください。
`docker-machine`を通じて設定された Engine では、通常このインターフェースは`eth1`となります。
@z

@x
The daemon uses [libkv](https://github.com/docker/libkv/) to advertise
the node within the cluster. Some key-value backends support mutual
TLS. To configure the client TLS settings used by the daemon can be configured
using the `--cluster-store-opt` flag, specifying the paths to PEM encoded
files. For example:
@y
デーモンにおいては、クラスター内部のノードを通知するために [libkv](https://github.com/docker/libkv/) が用いられています。
キーバリューを保持するバックエンドにおいては、相互 TLS（mutual TLS）をサポートするものがあります。
デーモンにおいて用いられるクライアント側の TLS 設定を変更するには`--cluster-store-opt`フラグを用います。
そしてそこでは PEM エンコードファイルへのパスを指定します。
@z

@x
```bash
$ sudo dockerd \
    --cluster-advertise 192.168.1.2:2376 \
    --cluster-store etcd://192.168.1.2:2379 \
    --cluster-store-opt kv.cacertfile=/path/to/ca.pem \
    --cluster-store-opt kv.certfile=/path/to/cert.pem \
    --cluster-store-opt kv.keyfile=/path/to/key.pem
```
@y
```bash
$ sudo dockerd \
    --cluster-advertise 192.168.1.2:2376 \
    --cluster-store etcd://192.168.1.2:2379 \
    --cluster-store-opt kv.cacertfile=/path/to/ca.pem \
    --cluster-store-opt kv.certfile=/path/to/cert.pem \
    --cluster-store-opt kv.keyfile=/path/to/key.pem
```
@z

@x
The currently supported cluster store options are:
@y
現時点においてサポートされているクラスターストアのオプションは以下です。
@z

@x
| Option                | Description                                                                                                                                                                                                                   |
|:----------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `discovery.heartbeat` | Specifies the heartbeat timer in seconds which is used by the daemon as a `keepalive` mechanism to make sure discovery module treats the node as alive in the cluster. If not configured, the default value is 20 seconds.    |
| `discovery.ttl`       | Specifies the TTL (time-to-live) in seconds which is used by the discovery module to timeout a node if a valid heartbeat is not received within the configured ttl value. If not configured, the default value is 60 seconds. |
| `kv.cacertfile`       | Specifies the path to a local file with PEM encoded CA certificates to trust.                                                                                                                                                 |
| `kv.certfile`         | Specifies the path to a local file with a PEM encoded certificate. This certificate is used as the client cert for communication with the Key/Value store.                                                                    |
| `kv.keyfile`          | Specifies the path to a local file with a PEM encoded private key. This private key is used as the client key for communication with the Key/Value store.                                                                     |
| `kv.path`             | Specifies the path in the Key/Value store. If not configured, the default value is 'docker/nodes'.                                                                                                                            |
@y
| オプション            | 内容説明                                                                                                                                                                                                                                         |
|:----------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `discovery.heartbeat` | ハートビートタイマーを秒単位で指定します。これはデーモンが`keepalive`メカニズムにおいて用いるものであり、ノード検出モジュールによりクラスター内のノードが生きているかどうかの確認に利用されます。設定されていない場合、デフォルト値は 20 秒です。|
| `discovery.ttl`       | TTL（time-to-live）を秒単位で指定します。これはノード検出モジュールが用いるものであり、設定されている ttl 値の範囲内で正常なハートビートが受信できなかった場合、どのノードをタイムアウトします。設定されていない場合、デフォルト値は 60 秒です。 |
| `kv.cacertfile`       | PEM エンコードされた CA 証明書を使ったローカルファイルへのパスを指定します。                                                                                                                                                                     |
| `kv.certfile`         | PEM エンコードされた証明書を使ったローカルファイルへのパスを指定します。この証明書は、クライアント証明書として、キーバリューストアを使った通信に利用されます。                                                                                   |
| `kv.keyfile`          | PEM エンコードされた秘密鍵を使ったローカルファイルへのパスを指定します。この秘密鍵は、クライアント鍵として、キーバリューストアを使った通信に利用されます。                                                                                       |
| `kv.path`             | キーバリューストア内のパスを指定します。設定されていない場合のデフォルト値は'docker/nodes'です。                                                                                                                                                 |
@z

@x
### Access authorization
@y
{: #access-authorization }
### アクセス認証
@z

@x
Docker's access authorization can be extended by authorization plugins that your
organization can purchase or build themselves. You can install one or more
authorization plugins when you start the Docker `daemon` using the
`--authorization-plugin=PLUGIN_ID` option.
@y
Docker のアクセス認証は、認証プラグインによって拡張することができます。
この認証プラグインは、所属組織が購入して利用する場合や独自にビルドする場合があります。
Docker の`daemon`起動時には複数の認証プラグインを設定することが可能であり、その際には`--authorization-plugin=PLUGIN_ID`オプションを用います。
@z

@x
```bash
$ sudo dockerd --authorization-plugin=plugin1 --authorization-plugin=plugin2,...
```
@y
```bash
$ sudo dockerd --authorization-plugin=plugin1 --authorization-plugin=plugin2,...
```
@z

@x
The `PLUGIN_ID` value is either the plugin's name or a path to its specification
file. The plugin's implementation determines whether you can specify a name or
path. Consult with your Docker administrator to get information about the
plugins available to you.
@y
`PLUGIN_ID`値にはプラグイン名か、あるいはその仕様ファイルへのパスを指定します。
プラグイン名またはパスを指定できるかどうかは、そのプラグインの実装によって定まります。
プラグインが利用可能かどうかの情報は、Docker 管理者に問い合わせてください。
@z

@x
Once a plugin is installed, requests made to the `daemon` through the
command line or Docker's Engine API are allowed or denied by the plugin.
If you have multiple plugins installed, each plugin, in order, must
allow the request for it to complete.
@y
プラグインを設定しておけば、コマンドラインあるいは Docker Engine API からのリクエストによって、そのプラグイン利用を許可するかしないかを指示できます。
複数のプラグインを設定している場合、指定された順で個々のプラグインは、リクエストの完了を許可する必要があります。
@z

@x
For information about how to create an authorization plugin, see [authorization
plugin](../../extend/plugins_authorization.md) section in the Docker extend section of this documentation.
@y
認証プラグインの生成方法については、Docker の拡張機能を説明する項の  [認証プラグイン](../../extend/plugins_authorization.md) の節を参照してください。
@z

@x
### Daemon user namespace options
@y
{: #daemon-user-namespace-options }
### デーモンのユーザー名前空間オプション
@z

@x
The Linux kernel
[user namespace support](http://man7.org/linux/man-pages/man7/user_namespaces.7.html)
provides additional security by enabling a process, and therefore a container,
to have a unique range of user and group IDs which are outside the traditional
user and group range utilized by the host system. Potentially the most important
security improvement is that, by default, container processes running as the
`root` user will have expected administrative privilege (with some restrictions)
inside the container but will effectively be mapped to an unprivileged `uid` on
the host.
@y
Linux カーネルの [ユーザー名前空間サポート](http://man7.org/linux/man-pages/man7/user_namespaces.7.html) は、1 つのプロセスを有効にして追加のセキュリティ機能を提供します。
したがってコンテナーでは独自のユーザーおよびグループの ID 範囲を持つものであり、ホストシステムにおいて利用される従来のユーザーおよびグループとは切り離されます。
最も重要なセキュリティ向上となるのは、デフォルトで`root`ユーザーとして実行されるコンテナープロセスが、コンテナー内部において期待どおりに管理権限で動作する（一部に制約もある）という点です。
しかもこれはホストから見れば、実際には非特権ユーザーの`uid`にマップされるということです。
@z

@x
For details about how to use this feature, as well as limitations, see
[Isolate containers with a user namespace](https://docs.docker.com/engine/security/userns-remap/).
@y
この機能の利用方法および制約については [ユーザー名前空間によるコンテナーの分離]({{ site.baseurl }}/engine/security/userns-remap/) を参照してください。
@z

@x
### Miscellaneous options
@y
{: #miscellaneous-options }
### その他のオプション
@z

@x
IP masquerading uses address translation to allow containers without a public
IP to talk to other machines on the Internet. This may interfere with some
network topologies and can be disabled with `--ip-masq=false`.
@y
IP マスカレードを利用するとアドレス変換が可能となり、公開 IP アドレスを持たないコンテナーであっても、インターネット上の別マシンとやりとりができるようになります。
これは一部のネットワークトポロジーと干渉する場合があるため、`--ip-masq=false`によって無効化できます。
@z

@x
Docker supports softlinks for the Docker data directory (`/var/lib/docker`) and
for `/var/lib/docker/tmp`. The `DOCKER_TMPDIR` and the data directory can be
set like this:
@y
Docker データディレクトリ（`/var/lib/docker`）と一時ディレクトリ`/var/lib/docker/tmp`に対して Docker はソフトリンクをサポートしています。
たとえば`DOCKER_TMPDIR`とデータディレクトリは、以下のようにして設定することができます。
@z

@x
    DOCKER_TMPDIR=/mnt/disk2/tmp /usr/local/bin/dockerd -D -g /var/lib/docker -H unix:// > /var/lib/docker-machine/docker.log 2>&1
    # or
    export DOCKER_TMPDIR=/mnt/disk2/tmp
    /usr/local/bin/dockerd -D -g /var/lib/docker -H unix:// > /var/lib/docker-machine/docker.log 2>&1
@y
    DOCKER_TMPDIR=/mnt/disk2/tmp /usr/local/bin/dockerd -D -g /var/lib/docker -H unix:// > /var/lib/docker-machine/docker.log 2>&1
    # or
    export DOCKER_TMPDIR=/mnt/disk2/tmp
    /usr/local/bin/dockerd -D -g /var/lib/docker -H unix:// > /var/lib/docker-machine/docker.log 2>&1
@z

@x
#### Default cgroup parent
@y
{: #default-cgroup-parent }
#### デフォルトの親 cgroup
@z

@x
The `--cgroup-parent` option allows you to set the default cgroup parent
to use for containers. If this option is not set, it defaults to `/docker` for
fs cgroup driver and `system.slice` for systemd cgroup driver.
@y
`--cgroup-parent`オプションは、コンテナーが利用するデフォルトの親 cgroup を設定します。
このオプションが指定されていない場合、デフォルトは fs cgroup ドライバーに対しては`/docker`となり、systemd cgroup ドライバーに対しては`system.slice`となります。
@z

@x
If the cgroup has a leading forward slash (`/`), the cgroup is created
under the root cgroup, otherwise the cgroup is created under the daemon
cgroup.
@y
cgroup の先頭がスラッシュ（`/`）で始まる場合、この cgroup はルート cgroup のもとに生成され、そうでない場合はデーモン cgroup のもとに生成されます。
@z

@x
Assuming the daemon is running in cgroup `daemoncgroup`,
`--cgroup-parent=/foobar` creates a cgroup in
`/sys/fs/cgroup/memory/foobar`, whereas using `--cgroup-parent=foobar`
creates the cgroup in `/sys/fs/cgroup/memory/daemoncgroup/foobar`
@y
デーモンが仮に`daemoncgroup`という cgroup 内で実行されているとします。
`--cgroup-parent=/foobar`という指定を行うと、cgroup は`/sys/fs/cgroup/memory/foobar`のもとに生成されます。
一方`--cgroup-parent=foobar`と指定すると、cgroup は`/sys/fs/cgroup/memory/daemoncgroup/foobar`のもとに生成されます。
@z

@x
The systemd cgroup driver has different rules for `--cgroup-parent`. Systemd
represents hierarchy by slice and the name of the slice encodes the location in
the tree. So `--cgroup-parent` for systemd cgroups should be a slice name. A
name can consist of a dash-separated series of names, which describes the path
to the slice from the root slice. For example, `--cgroup-parent=user-a-b.slice`
means the memory cgroup for the container is created in
`/sys/fs/cgroup/memory/user.slice/user-a.slice/user-a-b.slice/docker-<id>.scope`.
@y
systemd cgroup ドライバーには`--cgroup-parent`に対して別ルールがあります。
systemd はスライス（slice）による階層構造により表現され、そのスライス名はツリー内の場所をエンコードしています。
したがって systemd cgroups に対する`--cgroup-parent`の設定値はスライス名とします。
1 つの名前は、一連の名前をダッシュで区切って構成します。
これが、そのスライスに対するルートスライスからのパスを表します。
たとえば`--cgroup-parent=user-a-b.slice`というのは、コンテナーに対するメモリ cgroup であり、`/sys/fs/cgroup/memory/user.slice/user-a.slice/user-a-b.slice/docker-<id>.scope` に生成されます。
@z

@x
This setting can also be set per container, using the `--cgroup-parent`
option on `docker create` and `docker run`, and takes precedence over
the `--cgroup-parent` option on the daemon.
@y
上の指定はコンテナー単位で行うこともできます。
その場合は`docker create`や`docker run`の実行時に`--cgroup-parent`を指定します。
この指定は、デーモンに対する`--cgroup-parent`オプションよりも優先して適用されます。
@z

@x
#### Daemon metrics
@y
{: #daemon-metrics }
#### デーモンのメトリックス
@z

@x
The `--metrics-addr` option takes a tcp address to serve the metrics API.
This feature is still experimental, therefore, the daemon must be running in experimental
mode for this feature to work.
@y
`--metrics-addr`オプションには tcp アドレスを指定し、これによりメトリックス API を提供します。
この機能は今も試験的なものであり、したがって本機能利用のためにはデーモンを試験的モード（experimental mode）で実行する必要があります。
@z

@x
To serve the metrics API on `localhost:9323` you would specify `--metrics-addr 127.0.0.1:9323`,
allowing you to make requests on the API at `127.0.0.1:9323/metrics` to receive metrics in the
[prometheus](https://prometheus.io/docs/instrumenting/exposition_formats/) format.
@y
`localhost:9323`によってメトリックス API を提供する場合は、`--metrics-addr 127.0.0.1:9323`と指定します。
こうしておくことで`127.0.0.1:9323/metrics`という API リクエストを行って、[prometheus](https://prometheus.io/docs/instrumenting/exposition_formats/) 書式のメトリックスを受信することができます。
@z

@x
Port `9323` is the [default port associated with Docker
metrics](https://github.com/prometheus/prometheus/wiki/Default-port-allocations)
to avoid collisions with other prometheus exporters and services.
@y
ポート`9323`は [Docker メトリックスに関連づいたデフォルトポート](https://github.com/prometheus/prometheus/wiki/Default-port-allocations) であり、他の prometheus エクスポーターやサービスとの衝突を回避するものです。
@z

@x
If you are running a prometheus server you can add this address to your scrape configs
to have prometheus collect metrics on Docker.  For more information
on prometheus you can view the website [here](https://prometheus.io/).
@y
prometheus サーバーを実行している場合は、このアドレスを scrape 設定に追加することで、Docker 上において prometheus によるメトリックス収集を行うことができます。
prometheus の詳細は [こちら](https://prometheus.io/) のウェブサイトを参照してください。
@z

@x
```none
scrape_configs:
  - job_name: 'docker'
    static_configs:
      - targets: ['127.0.0.1:9323']
```
@y
```none
scrape_configs:
  - job_name: 'docker'
    static_configs:
      - targets: ['127.0.0.1:9323']
```
@z

@x
Please note that this feature is still marked as experimental as metrics and metric
names could change while this feature is still in experimental.  Please provide
feedback on what you would like to see collected in the API.
@y
この機能はメトリックスと同様に試験的と位置づけられている点に注意してください。
またメトリックス名は、試験的機能の扱いの中で変更されるかもしれません。
API を用いてどのような情報を集めたいか、ぜひフィードバックをお寄せください。
@z

@x
#### Node Generic Resources
@y
{: #node-generic-resources }
#### ノードジェネリックリソース
@z

@x
The `--node-generic-resources` option takes a list of key-value
pair (`key=value`) that allows you to advertise user defined resources
in a swarm cluster.
@y
`--node-generic-resources`オプションはキーバリューペア（`key=value`）をとり、Swarm クラスター内にユーザー定義リソースを通知（advertise）します。
@z

@x
The current expected use case is to advertise NVIDIA GPUs so that services
requesting `NVIDIA-GPU=[0-16]` can land on a node that has enough GPUs for
the task to run.
@y
現時点において想定される利用例は NVIDIA GPU を通知するものです。
サービスが`NVIDIA-GPU=[0-16]`を要求すると、タスク実行に必要となる十分な GPU を持ったノードに割り振られます。
@z

@x
Example of usage:
```json
{
	"node-generic-resources": ["NVIDIA-GPU=UUID1", "NVIDIA-GPU=UUID2"]
}
```
@y
Example of usage:
```json
{
	"node-generic-resources": ["NVIDIA-GPU=UUID1", "NVIDIA-GPU=UUID2"]
}
```
@z

@x
### Daemon configuration file
@y
{: #daemon-configuration-file }
### デーモン設定ファイル
@z

@x
The `--config-file` option allows you to set any configuration option
for the daemon in a JSON format. This file uses the same flag names as keys,
except for flags that allow several entries, where it uses the plural
of the flag name, e.g., `labels` for the `label` flag.
@y
`--config-file`オプションを使うと、デーモンに対するどの設定オプションでも JSON 形式のファイルから与えられます。
このファイル内では、フラグ名をそのままキーとして指定します。
ただし複数項目の指定が可能なフラグの場合は、フラグ名を複数形とします。
たとえば`label`フラグは`labels`とします。
@z

@x
The options set in the configuration file must not conflict with options set
via flags. The docker daemon fails to start if an option is duplicated between
the file and the flags, regardless their value. We do this to avoid
silently ignore changes introduced in configuration reloads.
For example, the daemon fails to start if you set daemon labels
in the configuration file and also set daemon labels via the `--label` flag.
Options that are not present in the file are ignored when the daemon starts.
@y
設定ファイルから設定するオプションは、フラグを通じて設定するオプションと競合してはなりません。
設定ファイルとフラグとの間で重複するオプションがあった場合には、その設定値には関係なく Docker デーモンは起動に失敗します。
このようにしているのは、設定ファイルによって再設定が行われ、その変更が何も表示されずに無視されるような状況を防ぐためです。
たとえば設定ファイル内にデーモンの labels を設定し、かつ`--label`フラグを使ってデーモンラベルを指定した場合には、デーモンは起動に失敗します。
設定ファイル内に指定されなかったオプションは、デーモン起動時に無視されます。
@z

@x
##### On Linux
@y
{: #on-linux }
##### Linux の場合
@z

@x
The default location of the configuration file on Linux is
`/etc/docker/daemon.json`. The `--config-file` flag can be used to specify a
 non-default location.
@y
設定ファイルのデフォルトは Linux の場合`/etc/docker/daemon.json`です。
`--config-file`フラグを利用すれば、デフォルト以外の場所を指定することができます。
@z

@x
This is a full example of the allowed configuration options on Linux:
@y
以下は Linux 上での設定ファイルに記述可能なオプションの一覧です。
@z

@x
```json
{
	"authorization-plugins": [],
	"data-root": "",
	"dns": [],
	"dns-opts": [],
	"dns-search": [],
	"exec-opts": [],
	"exec-root": "",
	"experimental": false,
	"features": {},
	"storage-driver": "",
	"storage-opts": [],
	"labels": [],
	"live-restore": true,
	"log-driver": "json-file",
	"log-opts": {
		"max-size": "10m",
		"max-file":"5",
		"labels": "somelabel",
		"env": "os,customer"
	},
	"mtu": 0,
	"pidfile": "",
	"cluster-store": "",
	"cluster-store-opts": {},
	"cluster-advertise": "",
	"max-concurrent-downloads": 3,
	"max-concurrent-uploads": 5,
	"default-shm-size": "64M",
	"shutdown-timeout": 15,
	"debug": true,
	"hosts": [],
	"log-level": "",
	"tls": true,
	"tlsverify": true,
	"tlscacert": "",
	"tlscert": "",
	"tlskey": "",
	"swarm-default-advertise-addr": "",
	"api-cors-header": "",
	"selinux-enabled": false,
	"userns-remap": "",
	"group": "",
	"cgroup-parent": "",
	"default-ulimits": {
		"nofile": {
			"Name": "nofile",
			"Hard": 64000,
			"Soft": 64000
		}
	},
	"init": false,
	"init-path": "/usr/libexec/docker-init",
	"ipv6": false,
	"iptables": false,
	"ip-forward": false,
	"ip-masq": false,
	"userland-proxy": false,
	"userland-proxy-path": "/usr/libexec/docker-proxy",
	"ip": "0.0.0.0",
	"bridge": "",
	"bip": "",
	"fixed-cidr": "",
	"fixed-cidr-v6": "",
	"default-gateway": "",
	"default-gateway-v6": "",
	"icc": false,
	"raw-logs": false,
	"allow-nondistributable-artifacts": [],
	"registry-mirrors": [],
	"seccomp-profile": "",
	"insecure-registries": [],
	"no-new-privileges": false,
	"default-runtime": "runc",
	"oom-score-adjust": -500,
	"node-generic-resources": ["NVIDIA-GPU=UUID1", "NVIDIA-GPU=UUID2"],
	"runtimes": {
		"cc-runtime": {
			"path": "/usr/bin/cc-runtime"
		},
		"custom": {
			"path": "/usr/local/bin/my-runc-replacement",
			"runtimeArgs": [
				"--debug"
			]
		}
	},
	"default-address-pools":[
		{"base":"172.80.0.0/16","size":24},
		{"base":"172.90.0.0/16","size":24}
	]
}
```
@y
```json
{
	"authorization-plugins": [],
	"data-root": "",
	"dns": [],
	"dns-opts": [],
	"dns-search": [],
	"exec-opts": [],
	"exec-root": "",
	"experimental": false,
	"features": {},
	"storage-driver": "",
	"storage-opts": [],
	"labels": [],
	"live-restore": true,
	"log-driver": "json-file",
	"log-opts": {
		"max-size": "10m",
		"max-file":"5",
		"labels": "somelabel",
		"env": "os,customer"
	},
	"mtu": 0,
	"pidfile": "",
	"cluster-store": "",
	"cluster-store-opts": {},
	"cluster-advertise": "",
	"max-concurrent-downloads": 3,
	"max-concurrent-uploads": 5,
	"default-shm-size": "64M",
	"shutdown-timeout": 15,
	"debug": true,
	"hosts": [],
	"log-level": "",
	"tls": true,
	"tlsverify": true,
	"tlscacert": "",
	"tlscert": "",
	"tlskey": "",
	"swarm-default-advertise-addr": "",
	"api-cors-header": "",
	"selinux-enabled": false,
	"userns-remap": "",
	"group": "",
	"cgroup-parent": "",
	"default-ulimits": {
		"nofile": {
			"Name": "nofile",
			"Hard": 64000,
			"Soft": 64000
		}
	},
	"init": false,
	"init-path": "/usr/libexec/docker-init",
	"ipv6": false,
	"iptables": false,
	"ip-forward": false,
	"ip-masq": false,
	"userland-proxy": false,
	"userland-proxy-path": "/usr/libexec/docker-proxy",
	"ip": "0.0.0.0",
	"bridge": "",
	"bip": "",
	"fixed-cidr": "",
	"fixed-cidr-v6": "",
	"default-gateway": "",
	"default-gateway-v6": "",
	"icc": false,
	"raw-logs": false,
	"allow-nondistributable-artifacts": [],
	"registry-mirrors": [],
	"seccomp-profile": "",
	"insecure-registries": [],
	"no-new-privileges": false,
	"default-runtime": "runc",
	"oom-score-adjust": -500,
	"node-generic-resources": ["NVIDIA-GPU=UUID1", "NVIDIA-GPU=UUID2"],
	"runtimes": {
		"cc-runtime": {
			"path": "/usr/bin/cc-runtime"
		},
		"custom": {
			"path": "/usr/local/bin/my-runc-replacement",
			"runtimeArgs": [
				"--debug"
			]
		}
	},
	"default-address-pools":[
		{"base":"172.80.0.0/16","size":24},
		{"base":"172.90.0.0/16","size":24}
	]
}
```
@z

@x
> **Note:** You cannot set options in `daemon.json` that have already been set on
> daemon startup as a flag.
> On systems that use `systemd` to start the Docker daemon, `-H` is already set, so
> you cannot use the `hosts` key in `daemon.json` to add listening addresses.
> See https://docs.docker.com/engine/admin/systemd/#custom-docker-daemon-options for how
> to accomplish this task with a systemd drop-in file.
@y
> **メモ**
>
> デーモン起動時のフラグとしてすでに設定しているオプションは、`daemon.json`に設定することはできません。
> `systemd`を利用して Docker デーモンを起動しているシステムの場合`-H`が設定されているため、`daemon.json`内において、待ち受けるアドレスを追加する`hosts`キーを利用することはできません。
> systemd のドロップインファイルを使ってこのタスクを実行する方法については [Docker デーモンオプションのカスタマイズ]({{ site.baseurl }}/engine/admin/systemd/#custom-docker-daemon-options) を参照してください。
@z

@x
##### On Windows
@y
{: #on-windows }
##### Windows の場合
@z

@x
The default location of the configuration file on Windows is
 `%programdata%\docker\config\daemon.json`. The `--config-file` flag can be
 used to specify a non-default location.
@y
設定ファイルのデフォルトは Windows の場合`%programdata%\docker\config\daemon.json`です。
`--config-file`フラグを利用すれば、デフォルト以外の場所を指定することができます。
@z

@x
This is a full example of the allowed configuration options on Windows:
@y
以下は Windows 上での設定ファイルに記述可能なオプションの一覧です。
@z

@x
```json
{
    "authorization-plugins": [],
    "data-root": "",
    "dns": [],
    "dns-opts": [],
    "dns-search": [],
    "exec-opts": [],
    "experimental": false,
    "features":{},
    "storage-driver": "",
    "storage-opts": [],
    "labels": [],
    "log-driver": "",
    "mtu": 0,
    "pidfile": "",
    "cluster-store": "",
    "cluster-advertise": "",
    "max-concurrent-downloads": 3,
    "max-concurrent-uploads": 5,
    "shutdown-timeout": 15,
    "debug": true,
    "hosts": [],
    "log-level": "",
    "tlsverify": true,
    "tlscacert": "",
    "tlscert": "",
    "tlskey": "",
    "swarm-default-advertise-addr": "",
    "group": "",
    "default-ulimits": {},
    "bridge": "",
    "fixed-cidr": "",
    "raw-logs": false,
    "allow-nondistributable-artifacts": [],
    "registry-mirrors": [],
    "insecure-registries": []
}
```
@y
```json
{
    "authorization-plugins": [],
    "data-root": "",
    "dns": [],
    "dns-opts": [],
    "dns-search": [],
    "exec-opts": [],
    "experimental": false,
    "features":{},
    "storage-driver": "",
    "storage-opts": [],
    "labels": [],
    "log-driver": "",
    "mtu": 0,
    "pidfile": "",
    "cluster-store": "",
    "cluster-advertise": "",
    "max-concurrent-downloads": 3,
    "max-concurrent-uploads": 5,
    "shutdown-timeout": 15,
    "debug": true,
    "hosts": [],
    "log-level": "",
    "tlsverify": true,
    "tlscacert": "",
    "tlscert": "",
    "tlskey": "",
    "swarm-default-advertise-addr": "",
    "group": "",
    "default-ulimits": {},
    "bridge": "",
    "fixed-cidr": "",
    "raw-logs": false,
    "allow-nondistributable-artifacts": [],
    "registry-mirrors": [],
    "insecure-registries": []
}
```
@z

@x
#### Feature options
@y
{: #feature-options }
#### feature オプション
@z

@x
The optional field `features` in `daemon.json` allows users to enable or disable specific 
daemon features. For example, `{"features":{"buildkit": true}}` enables `buildkit` as the 
default docker image builder.
@y
`daemon.json`内の任意設定項目である`features`は、デーモンの特定機能の有効無効を指定します。
たとえば`{"features":{"buildkit": true}}`は、デフォルトの Docker イメージビルダーとして`buildkit`を有効にします。
@z

@x
The list of currently supported feature options:
@y
現時点においてサポートされている feature オプションは以下のとおりです。
@z

@x
- `buildkit`: It enables `buildkit` as default builder when set to `true` or disables it by
`false`. Note that if this option is not explicitly set in the daemon config file, then it
is up to the cli to determine which builder to invoke.
@y
- `buildkit` ＝ デフォルトのビルダーとして`buildkit`を有効にするには`true`を設定し、無効にするには`false`を設定します。
   なおこのオプションがデーモンの設定ファイルに明示されなかった場合は、クライアント上の CLI からどのビルダーを実行するかによって決定します。
@z

@x
#### Configuration reload behavior
@y
{: #configuration-reload-behavior }
#### 設定再読み込みに関する動作
@z

@x
Some options can be reconfigured when the daemon is running without requiring
to restart the process. We use the `SIGHUP` signal in Linux to reload, and a global event
in Windows with the key `Global\docker-daemon-config-$PID`. The options can
be modified in the configuration file but still will check for conflicts with
the provided flags. The daemon fails to reconfigure itself
if there are conflicts, but it won't stop execution.
@y
オプションの中には、デーモンが起動中であってもプロセス再起動をすることなく設定変更を行えるものがあります。
設定再読み込みのため、Linux では`SIGHUP`シグナル、Windows ではグローバルイベントのキー`Global\docker-daemon-config-$PID`を使います。
このオプションは設定ファイルを使って変更することもできます。
その場合はフラグ指定されたものと競合していないかがチェックされます。
競合していた場合、デーモンの再設定そのものは失敗しますが、実行停止することはありません。
@z

@x
The list of currently supported options that can be reconfigured is this:
@y
再設定が可能なものとして、現時点でサポートされるオプションは以下のとおりです。
@z

@x
- `debug`: it changes the daemon to debug mode when set to true.
- `cluster-store`: it reloads the discovery store with the new address.
- `cluster-store-opts`: it uses the new options to reload the discovery store.
- `cluster-advertise`: it modifies the address advertised after reloading.
- `labels`: it replaces the daemon labels with a new set of labels.
- `live-restore`: Enables [keeping containers alive during daemon downtime](https://docs.docker.com/config/containers/live-restore/).
- `max-concurrent-downloads`: it updates the max concurrent downloads for each pull.
- `max-concurrent-uploads`: it updates the max concurrent uploads for each push.
- `default-runtime`: it updates the runtime to be used if not is
  specified at container creation. It defaults to "default" which is
  the runtime shipped with the official docker packages.
- `runtimes`: it updates the list of available OCI runtimes that can
  be used to run containers.
- `authorization-plugin`: it specifies the authorization plugins to use.
- `allow-nondistributable-artifacts`: Replaces the set of registries to which the daemon will push nondistributable artifacts with a new set of registries.
- `insecure-registries`: it replaces the daemon insecure registries with a new set of insecure registries. If some existing insecure registries in daemon's configuration are not in newly reloaded insecure resgitries, these existing ones will be removed from daemon's config.
- `registry-mirrors`: it replaces the daemon registry mirrors with a new set of registry mirrors. If some existing registry mirrors in daemon's configuration are not in newly reloaded registry mirrors, these existing ones will be removed from daemon's config.
- `shutdown-timeout`: it replaces the daemon's existing configuration timeout with a new timeout for shutting down all containers.
- `features`: it explicitly enables or disables specific features.
@y
- `debug`: true に設定するとデーモンをデバッグモードに変更します。
- `cluster-store`: 新たなアドレスを利用してディスカバリーストア（discovery store）を再読み込みします。
- `cluster-store-opts`: ディスカバリーストアの再読み込みに利用する新たなオプションを指定します。
- `cluster-advertise`: 再読み込み後に通知されるアドレスを変更します。
- `labels`: デーモンラベルを別の新たなラベルに置き換えます。
- `live-restore`: [デーモン停止時のコンテナー継続起動]({{ site.baseurl }}/config/containers/live-restore/) を有効にします。
- `max-concurrent-downloads`: プルごとの最大同時ダウンロード数を変更します。
- `max-concurrent-uploads`: プッシュごとの最大同時ダウンロード数を変更します。
- `default-runtime`: コンテナー生成時に指定のなかったランタイムを変更します。デフォルトは「default」であり、これは公式の Docker パッケージが提供するランタイムです。
- `runtimes`: コンテナー実行に用いられる利用可能な OCI ランタイムの一覧を変更します。
- `authorization-plugin`: 利用する認証プラグインを指定します。
- `allow-nondistributable-artifacts`: 配布制限のある成果物をデーモンがプッシュするレジストリの一覧を変更します。
- `insecure-registries`: デーモンのセキュアではいレジストリ一覧を新たなものに変更します。デーモン設定に存在していたセキュアでないレジストリが、新たにロードされたレジストリ内になかった場合、そのレジストリはデーモン設定から削除されます。
- `registry-mirrors`: デーモンのレジストリミラーを新たなものに変更します。デーモン設定に存在していたレジストリミラーが、新たにロードされたレジストリミラー内になかった場合、そのレジストリミラーはデーモン設定から削除されます。
- `shutdown-timeout`: コンテナーすべてをシャットダウンする際のタイムアウトに関して、デーモンの設定を変更します。
- `features`: 特定の機能を明示的に有効または無効にします。
@z

@x
Updating and reloading the cluster configurations such as `--cluster-store`,
`--cluster-advertise` and `--cluster-store-opts` will take effect only if
these configurations were not previously configured. If `--cluster-store`
has been provided in flags and `cluster-advertise` not, `cluster-advertise`
can be added in the configuration file without accompanied by `--cluster-store`.
Configuration reload will log a warning message if it detects a change in
previously configured cluster configurations.
@y
クラスター関連の設定、つまり`--cluster-store`、`--cluster-advertise`、`--cluster-store-opts`を変更および再読み込みしても、それが有効になるのは、その設定がそれまで設定されていなかった場合に限ります。
`--cluster-store`をフラグとして指定し`cluster-advertise`はフラグとして指定しなかった場合、`cluster-advertise`の設定は`--cluster-store`がなくても設定ファイルに含めることができます。
設定の再読み込みを行った際に、それまでのクラスター設定に変更があった場合には、警告メッセージがログ出力されます。
@z

@x
### Run multiple daemons
@y
{: #run-multiple-daemons }
### 複数デーモンの実行
@z

@x
> **Note:** Running multiple daemons on a single host is considered as "experimental". The user should be aware of
> unsolved problems. This solution may not work properly in some cases. Solutions are currently under development
> and will be delivered in the near future.
@y
> **メモ**
>
> 単一ホスト上に複数デーモンを実行することは「試験的」機能という扱いです。
> ここには未解決の問題がある点に注意してください。
> この機能は正しく動作しないことがあります。
> これは現在も開発途上のものであり、近いうちに正式提供される予定です。
@z

@x
This section describes how to run multiple Docker daemons on a single host. To
run multiple daemons, you must configure each daemon so that it does not
conflict with other daemons on the same host. You can set these options either
by providing them as flags, or by using a [daemon configuration file](#daemon-configuration-file).
@y
この節では、単一ホスト上において複数の Docker デーモンを起動する方法を示します。
複数デーモンの起動にあたっては、同一ホスト上においてデーモン同士が互いに衝突することがないように設定しなければなりません。
オプション設定はフラグとして行う場合と [デーモン設定ファイル](#daemon-configuration-file) を用いる場合のいずれでも可能です。
@z

@x
The following daemon options must be configured for each daemon:
@y
以下に示すオプションは、デーモンごとに設定する必要があります。
@z

@x
```none
-b, --bridge=                          Attach containers to a network bridge
--exec-root=/var/run/docker            Root of the Docker execdriver
--data-root=/var/lib/docker            Root of persisted Docker data
-p, --pidfile=/var/run/docker.pid      Path to use for daemon PID file
-H, --host=[]                          Daemon socket(s) to connect to
--iptables=true                        Enable addition of iptables rules
--config-file=/etc/docker/daemon.json  Daemon configuration file
--tlscacert="~/.docker/ca.pem"         Trust certs signed only by this CA
--tlscert="~/.docker/cert.pem"         Path to TLS certificate file
--tlskey="~/.docker/key.pem"           Path to TLS key file
```
@y
```none
-b, --bridge=                          コンテナーにネットワークブリッジを割り当てます。
--exec-root=/var/run/docker            Docker の実行ドライバー（execdriver）のルートパス。
--data-root=/var/lib/docker            Docker の永続的データのルートパス。
-p, --pidfile=/var/run/docker.pid      デーモンの PID ファイルを配置するパス。
-H, --host=[]                          接続するデーモンソケット。
--iptables=true                        iptables ルールの追加を許可します。
--config-file=/etc/docker/daemon.json  デーモン設定ファイル。
--tlscacert="~/.docker/ca.pem"         この CA によってのみ署名された信頼できる証明局。
--tlscert="~/.docker/cert.pem"         TLS 証明書ファイルへのパス。
--tlskey="~/.docker/key.pem"           TLS 鍵ファイルへのパス。
--tlskey="~/.docker/key.pem"           TLS 鍵ファイルへのパス。
```
@z

@x
When your daemons use different values for these flags, you can run them on the same host without any problems.
It is very important to properly understand the meaning of those options and to use them correctly.
@y
複数実行しているデーモンにおいてこういったフラグに別々の値を設定していても、同一ホスト上で複数デーモンは問題なく動作します。
それぞれのオプションの意味を正しく理解して、適切に利用することが重要です。
@z

@x
- The `-b, --bridge=` flag is set to `docker0` as default bridge network. It is created automatically when you install Docker.
If you are not using the default, you must create and configure the bridge manually or just set it to 'none': `--bridge=none`
- `--exec-root` is the path where the container state is stored. The default value is `/var/run/docker`. Specify the path for
your running daemon here.
- `--data-root` is the path where persisted data such as images, volumes, and
cluster state are stored. The default value is `/var/lib/docker`. To avoid any
conflict with other daemons, set this parameter separately for each daemon.
- `-p, --pidfile=/var/run/docker.pid` is the path where the process ID of the daemon is stored. Specify the path for your
pid file here.
- `--host=[]` specifies where the Docker daemon will listen for client connections. If unspecified, it defaults to `/var/run/docker.sock`.
-  `--iptables=false` prevents the Docker daemon from adding iptables rules. If
multiple daemons manage iptables rules, they may overwrite rules set by another
daemon. Be aware that disabling this option requires you to manually add
iptables rules to expose container ports. If you prevent Docker from adding
iptables rules, Docker will also not add IP masquerading rules, even if you set
`--ip-masq` to `true`. Without IP masquerading rules, Docker containers will not be
able to connect to external hosts or the internet when using network other than
default bridge.
- `--config-file=/etc/docker/daemon.json` is the path where configuration file is stored. You can use it instead of
daemon flags. Specify the path for each daemon.
- `--tls*` Docker daemon supports `--tlsverify` mode that enforces encrypted and authenticated remote connections.
The `--tls*` options enable use of specific certificates for individual daemons.
@y
- `-b, --bridge=`フラグは、デフォルトのブリッジネットワークとして`docker0`が設定されています。
  これは Docker をインストールしたときに自動的に生成されるものです。
  デフォルトを利用しない場合には、ブリッジを生成し設定することが必要です。
  あるいは不要であれば`none`とする、つまり`--bridge=none`と設定します。
- `--exec-root`はコンテナー状態の保存場所を示すパスです。
  デフォルトは`/var/run/docker`です。
  起動するデーモンに合わせてパスを指定します。
- `--data-root`はイメージ、ボリューム、クラスター状態といった永続的なデータを保存する場所へのパスです。
  デフォルト値は`/var/lib/docker`です。
  各デーモンでの重複を避けるため、各デーモンごとに個別に本パラメーターを設定してください。
- `-p, --pidfile=/var/run/docker.pid`はデーモンのプロセス ID を保存する場所へのパスです。
  pid ファイルへのパスをここに指定してください。
- `--host=[]`はクライアントからの接続に対して、Docker デーモンが待ち受ける場所を指定します。
  設定がない場合、そのデフォルトは`/var/run/docker.sock`です。
- `--iptables=false`を指定すると、Docker デーモンが iptables ルールを追加しないようにします。
  複数のデーモンが iptables ルールを制御すると、別のデーモンの設定によってルールがオーバーライドされることがあります。
  このオプションを無効にするということは、iptables ルールを手動で追加してコンテナーポートを公開しなければならないことに注意してください。
  Docker が iptables ルールを追加しないようにした場合、たとえ`--ip-masq`を`true`に設定していても Docker は IP マスカレードルールも追加しません。
  IP マスカレードルールがないとしたら、デフォルトのブリッジネットワーク以外を利用している場合には、Docker コンテナーは外部ホストやインターネットには接続できません。
- `--config-file=/etc/docker/daemon.json`は、設定ファイルを保存するパスです。
  デーモンフラグの代わりにこれを利用することができます。
  このパスはデーモンごとに設定してください。
- `--tls*`は Docker デーモンが`--tlsverify`モードをサポートするようにします。
  このモードではリモートに対して暗号化および認証された接続が求められます。
  `--tls*`オプションはデーモンごとに、特定証明書の利用を可能にします。
@z

@x
Example script for a separate “bootstrap” instance of the Docker daemon without network:
@y
以下に示すのは、ネットワークを利用しない Docker デーモンの個別「ブートストラップ」インスタンスを実行するスクリプト例です。
@z

@x
```bash
$ sudo dockerd \
        -H unix:///var/run/docker-bootstrap.sock \
        -p /var/run/docker-bootstrap.pid \
        --iptables=false \
        --ip-masq=false \
        --bridge=none \
        --data-root=/var/lib/docker-bootstrap \
        --exec-root=/var/run/docker-bootstrap
```
@y
```bash
$ sudo dockerd \
        -H unix:///var/run/docker-bootstrap.sock \
        -p /var/run/docker-bootstrap.pid \
        --iptables=false \
        --ip-masq=false \
        --bridge=none \
        --data-root=/var/lib/docker-bootstrap \
        --exec-root=/var/run/docker-bootstrap
```
@z
