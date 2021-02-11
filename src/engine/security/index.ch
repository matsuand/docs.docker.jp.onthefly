%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Review of the Docker Daemon attack surface
keywords: Docker, Docker documentation, security
redirect_from:
- /articles/security/
- /engine/articles/security/
- /engine/security/security/
- /security/security/
title: Docker security
---
@y
---
description: Review of the Docker Daemon attack surface
keywords: Docker, Docker documentation, security
redirect_from:
- /articles/security/
- /engine/articles/security/
- /engine/security/security/
- /security/security/
title: Docker のセキュリティ
---
@z

@x
There are four major areas to consider when reviewing Docker security:
@y
Docker のセキュリティを考えてみる上では、主要な観点が 4 つあります。
@z

@x
 - the intrinsic security of the kernel and its support for
   namespaces and cgroups;
 - the attack surface of the Docker daemon itself;
 - loopholes in the container configuration profile, either by default,
   or when customized by users.
 - the "hardening" security features of the kernel and how they
   interact with containers.
@y
 - カーネルに元からあるセキュリティと名前空間や cgroup のサポート。
 - Docker デーモンそのものの攻撃領域。
 - コンテナー設定プロファイルにおける抜け穴。デフォルトの場合だけでなくユーザーによるカスタマイズ時も含む。
 - セキュリティ強化されたカーネル機能とそれがコンテナーとやり取りする方法。
@z

@x
## Kernel namespaces
@y
{: #kernel-namespaces }
## カーネルの名前空間
@z

@x
Docker containers are very similar to LXC containers, and they have
similar security features. When you start a container with
`docker run`, behind the scenes Docker creates a set of namespaces and control
groups for the container.
@y
Docker コンテナーは LXC コンテナーによく似ています。
どちらも同じようなセキュリティ機能を持っています。
`docker run`によってコンテナーを起動させると Docker の内部処理では、コンテナーが利用する名前空間やコントロールグループが生成されます。
@z

@x
**Namespaces provide the first and most straightforward form of
isolation**: processes running within a container cannot see, and even
less affect, processes running in another container, or in the host
system.
@y
**名前空間とは、初めて提供された最もストレートな形の分離技術のことです**。
コンテナー内部にて起動されるプロセスからは、他のコンテナー内部やホストシステム内のプロセスを参照することはできず、また影響もほぼ及ぼしません。
@z

@x
**Each container also gets its own network stack**, meaning that a
container doesn't get privileged access to the sockets or interfaces
of another container. Of course, if the host system is setup
accordingly, containers can interact with each other through their
respective network interfaces — just like they can interact with
external hosts. When you specify public ports for your containers or use
[*links*](../../network/links.md)
then IP traffic is allowed between containers. They can ping each other,
send/receive UDP packets, and establish TCP connections, but that can be
restricted if necessary. From a network architecture point of view, all
containers on a given Docker host are sitting on bridge interfaces. This
means that they are just like physical machines connected through a
common Ethernet switch; no more, no less.
@y
**各コンテナーでは独自のネットワークスタックを用います**。
これはつまり、別のコンテナーのソケットやインターフェースへアクセスする際に、特権的なアクセス権限を有していないということです。
もちろんホストシステムが適切に設定されていれば、コンテナー間はそれぞれのネットワークインターフェースを介して通信を行うことができます。
外部にあるホストとの間で通信しているようなものです。
コンテナーに対して公開ポートを指定するか、あるいは [*link*](../../network/links.md) を利用すれば、コンテナー間での IP トラフィックが許可されます。
その場合コンテナー間にて互いに ping を行い、UDP パケットの送受信することで TCP コネクションが確立されます。
ただし状況に応じて制限がかけられることもあります。
ネットワークアーキテクチャーの点でいうと、特定の Docker ホスト上にあるコンテナーはすべて、ブリッジインターフェース上に置かれます。
これは各コンテナーがあたかも実際に存在する物理的なマシンのようであり、共有するイーサネットスイッチにより通信を行っているようなものです。
これ以上でもなく、これ以下でもありません。
@z

@x
How mature is the code providing kernel namespaces and private
networking? Kernel namespaces were introduced [between kernel version
2.6.15 and
2.6.26](https://man7.org/linux/man-pages/man7/namespaces.7.html).
This means that since July 2008 (date of the 2.6.26 release
), namespace code has been exercised and scrutinized on a large
number of production systems. And there is more: the design and
inspiration for the namespaces code are even older. Namespaces are
actually an effort to reimplement the features of [OpenVZ](
https://en.wikipedia.org/wiki/OpenVZ) in such a way that they could be
merged within the mainstream kernel. And OpenVZ was initially released
in 2005, so both the design and the implementation are pretty mature.
@y
ではカーネルの名前空間やプライベートネットワーク機能のソースコードは、成熟したものになっているでしょうか。
カーネルの名前空間が導入されたのは [カーネルバージョン 2.6.15 から 2.6.26](https://man7.org/linux/man-pages/man7/namespaces.7.html) の間です。
つまり 2008 年 6 月（2.6.26 のリリース日）以降、名前空間のソースコードは、数多くの本番環境システムを通じて検証が続いている状態です。
それだけではありません。
名前空間のソースコードの設計と発想は、もはや古いものになっています。
そもそも名前空間は [OpenVZ](https://en.wikipedia.org/wiki/OpenVZ) の機能を再実装するという努力から生まれたものであり、カーネルのメインストリームにマージされることを目指したものです。
ちなみに OpenVZ が初めてリリースされたのは 2005 年であり、その設計と実装はともに十分成熟しています。
@z

@x
## Control groups
@y
{: #control-groups }
## コントロールグループ
@z

@x
Control Groups are another key component of Linux Containers. They
implement resource accounting and limiting. They provide many
useful metrics, but they also help ensure that each container gets
its fair share of memory, CPU, disk I/O; and, more importantly, that a
single container cannot bring the system down by exhausting one of those
resources.
@y
コントロールグループ（control group）は、Linux コンテナー技術のもう一つの重要コンポーネントです。
これはリソース管理と利用制限を実装します。
これにより有用なメトリックスが数多く提供されます。
そしてこの機能はメモリ、CPU、ディスク I/O を各コンテナーが共有して利用できるようにします。
さらに重要なのは、たった 1 つのコンテナーがリソースを大量消費し、それがシステムダウンにつながるようなことはありません。
@z

@x
So while they do not play a role in preventing one container from
accessing or affecting the data and processes of another container, they
are essential to fend off some denial-of-service attacks. They are
particularly important on multi-tenant platforms, like public and
private PaaS, to guarantee a consistent uptime (and performance) even
when some applications start to misbehave.
@y
この機能の役割は、あるコンテナーから別コンテナーのデータやプロセスに対して、アクセスや変更を防ぐというものではありません。
これはサービス妨害攻撃を防ぐという重要な役割を持っています。
特に重要となるのが、公開あるいはプライベート PaaS のようなマルチテナント型プラットフォームにおいてです。
いずれかのアプリケーションが誤動作をし始めたとしても、安定した稼動（とパフォーマンス）を保証するものです。
@z

@x
Control Groups have been around for a while as well: the code was
started in 2006, and initially merged in kernel 2.6.24.
@y
コントロールグループも同じく、登場してからさほど経過していません。
その開発は 2006 年に始まり、カーネルに初めてマージされたのは 2.6.24 のときです。
@z

@x
## Docker daemon attack surface
@y
{: #docker-daemon-attack-surface }
## Docker デーモンの攻撃領域
@z

@x
Running containers (and applications) with Docker implies running the
Docker daemon. This daemon requires `root` privileges unless you opt-in
to [Rootless mode](rootless.md) (experimental), and you should therefore
be aware of some important details.
@y
コンテナー（およびアプリケーション）を Docker とともに動作させるということは、暗に Docker デーモンを動作させるということです。
デーモンの起動には [rootless モード](rootless.md) (試験的機能) を用いるのでない限りは`root`権限を必要とします。
したがって重要な点をいくつか意識しておく必要があります。
@z

@x
First of all, **only trusted users should be allowed to control your
Docker daemon**. This is a direct consequence of some powerful Docker
features. Specifically, Docker allows you to share a directory between
the Docker host and a guest container; and it allows you to do so
without limiting the access rights of the container. This means that you
can start a container where the `/host` directory is the `/` directory
on your host; and the container can alter your host filesystem
without any restriction. This is similar to how virtualization systems
allow filesystem resource sharing. Nothing prevents you from sharing your
root filesystem (or even your root block device) with a virtual machine.
@y
まず第一に、**Docker デーモンを制御できるのは信頼できるユーザーのみとすべき** ということです。
Docker の強力な機能の中には、この問題が直接関係するものがあります。
特に Docker においては Docker ホストとゲストコンテナーの間でのディレクトリ共有が可能であり、つまりコンテナーのアクセス権拡大を許しているわけです。
ということは、コンテナーの`/host`ディレクトリをホスト上の`/`ディレクトリに割り当ててコンテナーを起動できることを意味し、それはコンテナーが何ら制限なくホストのファイルシステムを変更できてしまうことになります。
ちょうど仮想化システムがファイルシステムというリソースをどのように共有するかという問題と同じです。
仮想マシンを使ってルートファイルシステムを（あるいはルートブロックデバイスでさえ）共有化できてしまうことは、防ぎようがありません。
@z

@x
This has a strong security implication: for example, if you instrument Docker
from a web server to provision containers through an API, you should be
even more careful than usual with parameter checking, to make sure that
a malicious user cannot pass crafted parameters causing Docker to create
arbitrary containers.
@y
これはセキュリティに重大な影響を及ぼします。
たとえば Docker の API を通じて、ウェブサーバーをコンテナーにプロビジョニングするとします。
このときには、通常以上に十分なパラメーターチェックを行う必要があります。
そして悪意のあるユーザーがパラメーターに細工をしたとしても、Docker から任意のコンテナーが生成されないようにすることが重要です。
@z

@x
For this reason, the REST API endpoint (used by the Docker CLI to
communicate with the Docker daemon) changed in Docker 0.5.2, and now
uses a UNIX socket instead of a TCP socket bound on 127.0.0.1 (the
latter being prone to cross-site request forgery attacks if you happen to run
Docker directly on your local machine, outside of a VM). You can then
use traditional UNIX permission checks to limit access to the control
socket.
@y
このことから REST API のエンドポイント（Docker デーモンとやり取りするために Docker CLI により用いられるもの）が Docker 0.5.2 において変更され、127.0.0.1 にバインドされる TCP ソケットではなく UNIX ソケットを用いるようになりました。
（TCP ソケットは、VM の外にあるローカルマシン上に直接 Docker を起動したときに、CSRF (cross-site request forgery) 攻撃を受けやすくなります。）
そこで従来からある Unix パーミッションチェックを利用して、制御ソケットへのアクセスを制限する必要があります。
@z

@x
You can also expose the REST API over HTTP if you explicitly decide to do so.
However, if you do that, be aware of the above mentioned security
implications.
Note that even if you have a firewall to limit accesses to the REST API 
endpoint from other hosts in the network, the endpoint can be still accessible
from containers, and it can easily result in the privilege escalation.
Therefore it is *mandatory* to secure API endpoints with 
[HTTPS and certificates](protect-access.md).
It is also recommended to ensure that it is reachable only from a trusted
network or VPN.
@y
また明確に意図するのであれば、REST API を HTTP を介して送ることもできます。
ただしこれを行った場合には、前述したセキュリティの脅威に関して注意しておくことが必要です。
ファイルウォールを利用していて、ネットワーク内の他ホストから REST API エンドポイントへのアクセスを制限しているとします。
それでもそのエンドポイントはコンテナーからアクセスが可能であるため、アクセス権限を容易に昇格させることができてしまいます。
したがって [HTTPS と 証明書](protect-access.md) を用いたセキュアな API エンドポイントの利用が必須となります。
また信頼できるネットワークや VPN からのみ到達可能とするような対処も求められます。
@z

@x
You can also use `DOCKER_HOST=ssh://USER@HOST` or `ssh -L /path/to/docker.sock:/var/run/docker.sock`
instead if you prefer SSH over TLS.
@y
SSH over TLS を実現したいのであれば、`DOCKER_HOST=ssh://USER@HOST`や`ssh -L /path/to/docker.sock:/var/run/docker.sock`を用いることもできます。
@z

@x
The daemon is also potentially vulnerable to other inputs, such as image
loading from either disk with `docker load`, or from the network with
`docker pull`. As of Docker 1.3.2, images are now extracted in a chrooted
subprocess on Linux/Unix platforms, being the first-step in a wider effort
toward privilege separation. As of Docker 1.10.0, all images are stored and
accessed by the cryptographic checksums of their contents, limiting the
possibility of an attacker causing a collision with an existing image.
@y
デーモンへの入力として、たとえば`docker load`実行時はディスクから、また`docker pull`実行時はネットワークから、それぞれイメージロードが行われますが、こういった入力には潜在的にぜい弱性があります。
Docker 1.3.2 において、イメージの抽出は Linux/Unix プラットフォーム上の chroot によるサブプロセス内にて行われるようになりました。
これは権限を分離することを賢明に目指した第一歩でした。
Docker 1.10.0 になるとイメージはすべて、イメージデータの暗号化チェックサムによって保存されアクセスされるようになりました。
既存イメージに対して攻撃を仕掛けられる可能性を軽減するものです。
@z

@x
Finally, if you run Docker on a server, it is recommended to run
exclusively Docker on the server, and move all other services within
containers controlled by Docker. Of course, it is fine to keep your
favorite admin tools (probably at least an SSH server), as well as
existing monitoring/supervision processes, such as NRPE and collectd.
@y
サーバー上に Docker を稼動させる際には、Docker だけを動かすようにすることをお勧めします。
さらに他のサービスは Docker によって管理されたコンテナー内に移動するようにしてください。
もちろんお気に入りの管理ツール（おそらく SSH サーバーには最低必要なものでしょう）があれば、引き続き利用してください。
同様に NRPE や collectd のような既存の監視プロセスを利用してもかまいません。
@z

@x
## Linux kernel capabilities
@y
{: #linux-kernel-capabilities }
## Linux カーネルのケーパビリティー
@z

@x
By default, Docker starts containers with a restricted set of
capabilities. What does that mean?
@y
デフォルトにおいて Docker は、ケーパビリティーを限定的に利用してコンテナーを起動します。
これはどういう意味でしょう。
@z

@x
Capabilities turn the binary "root/non-root" dichotomy into a
fine-grained access control system. Processes (like web servers) that
just need to bind on a port below 1024 do not need to run as root: they
can just be granted the `net_bind_service` capability instead. And there
are many other capabilities, for almost all the specific areas where root
privileges are usually needed.
@y
ケーパビリティーとは「ルートか非ルートか」という 2 値による区分けを、アクセス制御システム上に対してきめ細かく実現するものです。
1024 番ポート以下に割り当てさえすればよいプロセス（たとえばウェブサーバー）なら、root として実行する必要はありません。
代わりに`net_bind_service`ケーパビリティーを与えるだけで十分です。
この他にも数多くのケーパビリティーがあるので、root 権限が通常必要とされる場面のほとんどすべてに利用することができます。
@z

@x
This means a lot for container security; let's see why!
@y
コンテナーセキュリティにおいてこれは実に多くのことを意味します。
どういうことなのか見ていきます。
@z

@x
Typical servers run several processes as `root`, including the SSH daemon,
`cron` daemon, logging daemons, kernel modules, network configuration tools,
and more. A container is different, because almost all of those tasks are
handled by the infrastructure around the container:
@y
典型的なサーバーであれば、プロセスの多くは`root`によって起動されています。
たとえば SSH デーモン、`cron`デーモン、ログデーモン、カーネルモジュール、ネットワーク設定ツールなどです。
ただコンテナーでは話が違います。
そもそもこういったタスクのほぼすべては、コンテナー外部にあるインフラストラクチャーによって取り扱われるものだからです。
@z

@x
 - SSH access are typically managed by a single server running on
   the Docker host;
@y
 - SSH アクセスを管理するのは、通常は Docker ホスト上に稼動するサーバープロセスです。
@z

@x
 - `cron`, when necessary, should run as a user
   process, dedicated and tailored for the app that needs its
   scheduling service, rather than as a platform-wide facility;
@y
 - `cron`は必要な場合は、ユーザープロセスとして起動させます。
   スケジュールサービスを必要とするアプリ向けに特化させるものであり、プラットフォーム全体の機能として用いるものではありません。
@z

@x
 - log management is also typically handed to Docker, or to
   third-party services like Loggly or Splunk;
@y
 - ログ管理も通常は Docker が取り扱います。
   あるいは Loggly や Splunk といったサードパーティ製のサービスを利用することもあります。
@z

@x
 - hardware management is irrelevant, meaning that you never need to
   run `udevd` or equivalent daemons within
   containers;
@y
 - ハードウェアを管理することは的はずれです。
   コンテナー内部において`udevd`やそれに類するデーモンを起動させる必要はまったくありません。
@z

@x
 - network management happens outside of the containers, enforcing
   separation of concerns as much as possible, meaning that a container
   should never need to perform `ifconfig`,
   `route`, or ip commands (except when a container
   is specifically engineered to behave like a router or firewall, of
   course).
@y
 - ネットワーク管理はコンテナー外部で行われるものです。
   可能な限り考えなくても済むものです。
   つまり `ifconfig`、`route`、ip コマンドは実行する必要がありません。
   （ただしコンテナーがルーターやファイアウォールとして動作するように構築しているのであれば別です。）
@z

@x
This means that in most cases, containers do not need "real" root
privileges *at all*. And therefore, containers can run with a reduced
capability set; meaning that "root" within a container has much less
privileges than the real "root". For instance, it is possible to:
@y
上からわかるように、たいていの場合、コンテナーが「本当の」root 権限を必要とすることは **まったくない** ということです。
つまりコンテナーは、ケーパビリティーを最小限にして実行可能であって、コンテナー内の「root」は、本当の「root」よりも少ない権限で済むことを意味します。
したがって以下のようなことが可能になります。
@z

@x
 - deny all "mount" operations;
 - deny access to raw sockets (to prevent packet spoofing);
 - deny access to some filesystem operations, like creating new device
   nodes, changing the owner of files, or altering attributes (including
   the immutable flag);
 - deny module loading;
 - and many others.
@y
 - 「mount」操作はすべて許可しない。
 - 生の（raw）ソケットへのアクセスを許可しない。（パケットスプーフィング防止のため）
 - ファイルシステムへの所定操作を許可しない。
   デバイスノードの新規生成、ファイルの所有者変更、属性変更（変更不能フラグを含む）など。
 - モジュールロードを許可しない。
 - その他もろもろ。
@z

@x
This means that even if an intruder manages to escalate to root within a
container, it is much harder to do serious damage, or to escalate
to the host.
@y
上記のようなことをすれば、たとえ侵入者がコンテナー内の root 権限を得ようとしても、重大なダメージを及ぼすことはまず困難であり、またホストの権限まで奪うようなことにはなりません。
@z

@x
This doesn't affect regular web apps, but reduces the vectors of attack by
malicious users considerably. By default Docker
drops all capabilities except [those
needed](https://github.com/moby/moby/blob/master/oci/caps/defaults.go#L6-L19),
an allowlist instead of a denylist approach. You can see a full list of
available capabilities in [Linux
manpages](https://man7.org/linux/man-pages/man7/capabilities.7.html).
@y
普通のウェブアプリに対しての影響はありません。
しかも悪意あるユーザーからの攻撃はかなり抑えられることになります。
デフォルトで Dockerは全ケーパビリティーを拒否した上で、[必要となるケーパビリティー](https://github.com/moby/moby/blob/master/oci/caps/defaults.go#L6-L19) を用います。
つまり拒否リスト方式ではなく許可リスト方式をとるものです。
利用可能なケーパビリティーの一覧は [Linux man ページ](https://man7.org/linux/man-pages/man7/capabilities.7.html) を参照してください。
@z

@x
One primary risk with running Docker containers is that the default set
of capabilities and mounts given to a container may provide incomplete
isolation, either independently, or when used in combination with
kernel vulnerabilities.
@y
Docker コンテナー実行時の主なリスクと言えば、コンテナーに与えられるデフォルトのケーパビリティーやマウント状況だけでは、完全なコンテナー分離にはならないことです。
独立となっていない場合や、カーネルのぜい弱性との組み合わせによることも考えられます。
@z

@x
Docker supports the addition and removal of capabilities, allowing use
of a non-default profile. This may make Docker more secure through
capability removal, or less secure through the addition of capabilities.
The best practice for users would be to remove all capabilities except
those explicitly required for their processes.
@y
Docker のデフォルトにはないプロファイルを使えば、ケーパビリティーの追加および削除が可能になります。
これを使ってケーパビリティーを削除すれば、Docker は一層安全な状態になり、ケーパビリティーを加えれば、それだけ安全性は低下することになります。
ユーザーにとってのベストプラクティスは、全ケーパビリティーは削除した上で、実行するプロセスに必要となるもののみを明示的に利用する方法をとることでしょう。
@z

@x
## Docker Content Trust Signature Verification
@y
{: #docker-content-trust-signature-verification }
## Docker Content Trust の署名認証
@z

@x
The Docker Engine can be configured to only run signed images. The Docker Content 
Trust signature verification feature is built directly into the `dockerd` binary.  
This is configured in the Dockerd configuration file. 
@y
Docker Engine では、署名されているイメージだけを実行するように設定することができます。
Docker Content Trust における署名認証は`dockerd`実行モジュール内に直接ビルドされています。
この機能は dockerd の設定ファイルを通じて設定することができます。
@z

@x
To enable this feature, trustpinning can be configured in `daemon.json`, whereby 
only repositories signed with a user-specified root key can be pulled and run.
@y
この機能を有効にするには`daemon.json`において`trust-pinning`により設定します。
これにより、ユーザーが指定したルート鍵によって署名されたリポジトリに対してのみ、イメージをプルして実行できるようになります。
@z

@x
This feature provides more insight to administrators than previously available with
the CLI for enforcing and performing image signature verification. 
@y
以前は CLI においてイメージに対する署名認証を実現していましたが、この機能によって管理者の理解がより深く浸透しました。
@z

@x
For more information on configuring Docker Content Trust Signature Verificiation, go to 
[Content trust in Docker](trust/index.md).
@y
Docker Content Trust の署名認証方法の詳細は [Docker における Content trust](trust/index.md) に進んでください。
@z

@x
## Other kernel security features
@y
{: #other-kernel-security-features }
## その他のカーネルセキュリティ機能
@z

@x
Capabilities are just one of the many security features provided by
modern Linux kernels. It is also possible to leverage existing,
well-known systems like TOMOYO, AppArmor, SELinux, GRSEC, etc. with
Docker.
@y
ケーパビリティーは、最近の Linux カーネルが提供する多くのセキュリティ機能の一つです。
もちろんよく知られた既存のシステムとして、TOMOYO、AppArmor、SELinux、GRSEC を利用するのでもかまいません。
@z

@x
While Docker currently only enables capabilities, it doesn't interfere
with the other systems. This means that there are many different ways to
harden a Docker host. Here are a few examples.
@y
現時点において Docker はケーパビリティーを有効にするだけであって、他のシステムを妨害するものではありません。
そこで Docker ホストのセキュリティ向上には、いくらでも方法が残されています。
以下に数例を示します。
@z

@x
 - You can run a kernel with GRSEC and PAX. This adds many safety
   checks, both at compile-time and run-time; it also defeats many
   exploits, thanks to techniques like address randomization. It doesn't
   require Docker-specific configuration, since those security features
   apply system-wide, independent of containers.
@y
 - GRSEC や PAX を利用してカーネルを起動することができます。
   これにより、コンパイル時や実行時に多くの安全性チェックを行うことができます。
   またアドレスのランダム化のような技術のおかげで、悪用の機会を大きく減らすことができます。
   これに対して Docker 固有の設定は不要です。
   なぜならこのセキュリティ機能はシステム全体に適用されるものであって、コンテナーからは切り離されているものだからです。
@z

@x
 - If your distribution comes with security model templates for
   Docker containers, you can use them out of the box. For instance, we
   ship a template that works with AppArmor and Red Hat comes with SELinux
   policies for Docker. These templates provide an extra safety net (even
   though it overlaps greatly with capabilities).
@y
 - 利用しているディストリビューションに Docker コンテナー用のセキュリティモデルテンプレートが用意されているなら、それをそのまま利用することができます。
   たとえば AppArmor にて動作するテンプレートを我々は提供しています。
   また Red Hat は Docker 向けの SELinux ポリシーを提供しています。
   こういったテンプレートは追加の安全策となるものです。
   （もっともケーパビリティーとかなりの部分で重複するところがあります。）
@z

@x
 - You can define your own policies using your favorite access control
   mechanism.
@y
 - 好みのアクセス管理メカニズムを使って、独自にセキュリティポリシーを定義することができます。
@z

@x
Just as you can use third-party tools to augment Docker containers, including
special network topologies or shared filesystems, tools exist to harden Docker
containers without the need to modify Docker itself.
@y
同じように Docker 機能を増強させるサードバーティー製ツールを利用することもできます。
特別なネットワークトポロジーや共有ファイルシステムの構築が可能です。
このようなツールは Docker 自体を修正することなく Docker 機能を強力にするためのものです。
@z

@x
As of Docker 1.10 User Namespaces are supported directly by the docker
daemon. This feature allows for the root user in a container to be mapped
to a non uid-0 user outside the container, which can help to mitigate the
risks of container breakout. This facility is available but not enabled
by default.
@y
Docker 1.10 から Docker デーモンが直接、ユーザー名前空間をサポートするようになりました。
この機能を使えば、コンテナー内の root ユーザーを、コンテナー外部の uid がゼロではないユーザーに対して割り当てできるようになります。
コンテナーからのブレイクアウトのリスクを軽減することにつながります。
利用可能な機能ではあるのですが、デフォルトでは有効化されていません。
@z

@x
Refer to the [daemon command](../reference/commandline/dockerd.md#daemon-user-namespace-options)
in the command line reference for more information on this feature.
Additional information on the implementation of User Namespaces in Docker
can be found in
[this blog post](https://integratedcode.us/2015/10/13/user-namespaces-have-arrived-in-docker/).
@y
この機能に関しての詳細は、コマンドラインリファレンス内の [daemon コマンド](../reference/commandline/dockerd.md#daemon-user-namespace-options) を参照してください。
Docker 内のユーザー名前空間に対する実装については [こちらのブログ投稿](https://integratedcode.us/2015/10/13/user-namespaces-have-arrived-in-docker/) に詳細が示されています。
@z

@x
## Conclusions
@y
{: #conclusions }
## まとめ
@z

@x
Docker containers are, by default, quite secure; especially if you
run your processes as non-privileged users inside the container.
@y
Docker コンテナーはデフォルトにおいて十分に安全なものです。
コンテナー内部にて非特権ユーザーによりプロセスを稼動させていれば、より安全です。
@z

@x
You can add an extra layer of safety by enabling AppArmor, SELinux,
GRSEC, or another appropriate hardening system.
@y
AppArmor、SELinux、GRSEC、あるいはセキュリティを堅牢にする適切なシステムを用いれば、安全性をさらに高めることができます。
@z

@x
If you think of ways to make docker more secure, we welcome feature requests,
pull requests, or comments on the Docker community forums.
@y
Docker をより安全にする方法を検討している方は、Docker コミュニティフォーラムにおいて、機能リクエスト、プルリクエスト、コメントをお寄せください。
@z

@x
## Related information
@y
{: #related-information }
## 関連情報
@z

@x
* [Use trusted images](trust/index.md)
* [Seccomp security profiles for Docker](seccomp.md)
* [AppArmor security profiles for Docker](apparmor.md)
* [On the Security of Containers (2014)](https://medium.com/@ewindisch/on-the-security-of-containers-2c60ffe25a9e)
* [Docker swarm mode overlay network security model](../../network/overlay.md)
@y
* [信頼できるイメージの利用](trust/index.md)
* [Docker 向け Seccomp セキュリティプロファイル](seccomp.md)
* [Docker 向け AppArmor セキュリティプロファイル](apparmor.md)
* [On the Security of Containers (2014)](https://medium.com/@ewindisch/on-the-security-of-containers-2c60ffe25a9e)
* [Docker Swarm モードのオーバーレイネットワークによるセキュリティモデル](../../network/overlay.md)
@z
