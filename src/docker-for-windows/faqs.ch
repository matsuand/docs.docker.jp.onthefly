%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions
keywords: windows faqs
title: Frequently asked questions (FAQ)
---
@y
---
description: Frequently asked questions
keywords: windows faqs
title: よくたずねられる質問（FAQ）
---
@z

@x
## Docker Desktop releases
@y
{% comment %}
## Docker Desktop releases
{% endcomment %}
{: #docker-desktop-releases }
## Docker Desktop リリース
@z

@x
### When will Docker Desktop move to a cumulative release stream?
@y
{% comment %}
### When will Docker Desktop move to a cumulative release stream?
{% endcomment %}
{: #when-will-docker-desktop-move-to-a-cumulative-release-stream }
### Docker Desktop が累積的なリリースストリームに移行するのはいつですか
@z

@x
Starting with version 3.0.0, Docker Desktop will be available as a single, cumulative release stream. This is the same version for both Stable and Edge users. The next release after Docker Desktop 3.0.0 will be the first to be applied as a delta update. For more information, see [Automatic updates](install.md#automatic-updates).
@y
{% comment %}
Starting with version 3.0.0, Docker Desktop will be available as a single, cumulative release stream. This is the same version for both Stable and Edge users. The next release after Docker Desktop 3.0.0 will be the first to be applied as a delta update. For more information, see [Automatic updates](install.md#automatic-updates).
{% endcomment %}
Docker Desktop 3.0.0 から Docker Desktop は 1 つの累積的なリリースストリームとして提供されるようになりました。
つまり安定版（Stable）ユーザー、最新版（Edge）ユーザーのどちらも同一バージョンを用いることになります。
Docker Desktop 3.0.0 の次に行われるリリースは、デルタアップデートを採用する初めてのリリースです。
詳しくは [自動アップデート](install.md#automatic-updates) を参照してください。
@z

@x
### How do new users install Docker Desktop?
@y
{% comment %}
### How do new users install Docker Desktop?
{% endcomment %}
{: #how-do-new-users-install-docker-desktop }
### 新規ユーザーはどうやって Docker Desktop をインストールしたらよいですか
@z

@x
Each Docker Desktop release will also be delivered as a full installer for new users. The same will apply if you have skipped a version, although this will not normally happen as updates will be applied automatically.
@y
{% comment %}
Each Docker Desktop release will also be delivered as a full installer for new users. The same will apply if you have skipped a version, although this will not normally happen as updates will be applied automatically.
{% endcomment %}
各 Docker Desktop リリースは新規ユーザーに向けて完全なインストーラーも提供しています。
新規リリースは、リリースアップデートをいくつか抜かしていても適用できます。
もっともアップデートは自動的に行われることなので、そういった状況は通常は発生しません。
@z

@x
### How frequent will new releases be?
@y
{% comment %}
### How frequent will new releases be?
{% endcomment %}
{: #how-frequent-will-new-releases-be }
### 新規リリースはどれくらいの期間で行われますか
@z

@x
New releases will be available roughly monthly, similar to Edge today, unless there are critical fixes that need to be released sooner.
@y
{% comment %}
New releases will be available roughly monthly, similar to Edge today, unless there are critical fixes that need to be released sooner.
{% endcomment %}
新規リリースはおおまかに言えば 1 ヶ月ごとに利用できます。
最新版は本日も行われています。
重大な修正があればすぐにリリースが行われます。
@z

@x
### How do I ensure that all users on my team are using the same version?
@y
{% comment %}
### How do I ensure that all users on my team are using the same version?
{% endcomment %}
{: #how-do-i-ensure-that-all-users-on-my-team-are-using-the-same-version }
### チーム内ユーザーが同一バージョンを使っていることをどうやって確認したらよいですか
@z

@x
Previously you had to manage this yourself: now it will happen automatically as a side effect of all users being on the latest version.
@y
{% comment %}
Previously you had to manage this yourself: now it will happen automatically as a side effect of all users being on the latest version.
{% endcomment %}
以前であれば自分で管理しておかなければなりませんでした。
今は全ユーザーが最新版に更新されることから自動的に達成されます。
@z

@x
### My colleague has got a new version but I haven’t got it yet.
@y
{% comment %}
### My colleague has got a new version but I haven’t got it yet.
{% endcomment %}
{: #my-colleague-has-got-a-new-version-but-i-havent-got-it-yet }
### 仲間が最新版への更新をして自分はしていないのですが
@z

@x
Sometimes we may roll out a new version gradually over a few days. Therefore, if you wait, it will turn up soon. Alternatively, you can select **Check for Updates** from the Docker menu to jump the queue and get the latest version immediately.
@y
{% comment %}
Sometimes we may roll out a new version gradually over a few days. Therefore, if you wait, it will turn up soon. Alternatively, you can select **Check for Updates** from the Docker menu to jump the queue and get the latest version immediately.
{% endcomment %}
新たなバージョンを数日かけて徐々に公開する場合があります。
したがって 2、3 日待てば、最新版が出てきます。
これとは別に Docker メニューの **Check for Updates**（アップデートの確認）を実行する方法もあります。
これを行えば、アップデート順に従うことなく即座に最新版を入手できます。
@z

@x
### Where can I find information about Stable and Edge releases?
@y
{% comment %}
### Where can I find information about Stable and Edge releases?
{% endcomment %}
{: #where-can-i-find-information-about-stable-and-edge-releases }
### 安定版と最新版のリリース情報はどこにありますか
@z

@x
Starting with Docker Desktop 3.0.0, Stable and Edge releases are combined into a single, cumulative release stream for all users.
@y
{% comment %}
Starting with Docker Desktop 3.0.0, Stable and Edge releases are combined into a single, cumulative release stream for all users.
{% endcomment %}
Docker Desktop 3.0.0 から安定版（Stable）と最新版（Edge）は、どのユーザーに対しても 1 つの累積的なリリースストリームとして統合されました。
@z

@x
## What are the system requirements for Docker Desktop?
@y
{% comment %}
## What are the system requirements for Docker Desktop?
{% endcomment %}
{: #what-are-the-system-requirements-for-docker-desktop }
## Docker Desktop のシステム要件は何ですか
@z

@x
For information about system requirements, see [Docker Desktop Windows system requirements](install.md#system-requirements).
@y
{% comment %}
For information about system requirements, see [Docker Desktop Windows system requirements](install.md#system-requirements).
{% endcomment %}
システム要件に関する詳細は [Docker Desktop Windows システム要件](install.md#system-requirements) を参照してください。
@z

@x
## What is an experimental feature?
@y
{% comment %}
## What is an experimental feature?
{% endcomment %}
{: #what-is-an-experimental-feature }
## 試験的機能とは何ですか
@z

@x
{% include experimental.md %}
@y
{% include experimental.md %}
@z

@x
## How do I?
@y
{% comment %}
## How do I?
{% endcomment %}
{: #how-do-i }
## どうしたらよいですか
@z

@x
### How do I connect to the remote Docker Engine API?
@y
{% comment %}
### How do I connect to the remote Docker Engine API?
{% endcomment %}
{: #how-do-i-connect-to-the-remote-docker-engine-api }
### リモートの Docker Engine API にアクセスするにはどうしてらよいですか
@z

@x
You might need to provide the location of the Engine API for Docker clients and development tools.
@y
{% comment %}
You might need to provide the location of the Engine API for Docker clients and development tools.
{% endcomment %}
Docker クライアントや開発ツールに対して、Engine API の場所を指定することが必要になります。
@z

@x
On Docker Desktop, clients can connect to the Docker Engine through a
**named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@y
{% comment %}
On Docker Desktop, clients can connect to the Docker Engine through a
**named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
{% endcomment %}
Docker Desktop において Docker クライアントはその Docker Engine に対して **名前つきパイプ**`npipe:////./pipe/docker_engine`、あるいはその URL に応じて **TCP ソケット**`tcp://localhost:2375` を通じて接続することができます。
@z

@x
This sets `DOCKER_HOST` and `DOCKER_CERT_PATH` environment variables to the
given values (for the named pipe or TCP socket, whichever you use).
@y
{% comment %}
This sets `DOCKER_HOST` and `DOCKER_CERT_PATH` environment variables to the
given values (for the named pipe or TCP socket, whichever you use).
{% endcomment %}
環境変数`DOCKER_HOST`と`DOCKER_CERT_PATH`には与えられた値が設定されます（名前つきパイプ、TCP ソケットのいずれも）。
@z

@x
See also [Docker Engine API](../engine/api/index.md) and the Docker Desktop for Windows forums topic [How to find the remote API](https://forums.docker.com/t/how-to-find-the-remote-api/20988){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
See also [Docker Engine API](../engine/api/index.md) and the Docker Desktop for Windows forums topic [How to find the remote API](https://forums.docker.com/t/how-to-find-the-remote-api/20988){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
[Docker Engine API](../engine/api/index.md) や Docker Desktop for Windows のフォーラムトピック [リモート API の検出方法](https://forums.docker.com/t/how-to-find-the-remote-api/20988){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
### How do I connect from a container to a service on the host?
@y
{% comment %}
### How do I connect from a container to a service on the host?
{% endcomment %}
{: #how-do-i-connect-from-a-container-to-a-service-on-the-host }
### コンテナーからホスト上のサービスに接続するにはどうしたらよいですか
@z

@x
Windows has a changing IP address (or none if you have no network access). We recommend that you connect to the special DNS name `host.docker.internal`, which resolves to the internal IP address used by the host. This is for development purposes and will not work in a production environment outside of Docker Desktop for Windows.
@y
{% comment %}
Windows has a changing IP address (or none if you have no network access). We recommend that you connect to the special DNS name `host.docker.internal`, which resolves to the internal IP address used by the host. This is for development purposes and will not work in a production environment outside of Docker Desktop for Windows.
{% endcomment %}
Windows は動的 IP アドレスを利用します（ただしネットワークアクセスがなければ IP アドレスはありません）。
そこで特別な DNS 名`host.docker.internal`へ接続することを推奨します。
これはホスト上において用いられる内部 IP アドレスへの変換を行います。
開発目的での利用に限られ、Docker Desktop for Windows の外部に位置する本番環境では動作しません。
@z

@x
The gateway is also reachable as `gateway.docker.internal`.
@y
{% comment %}
The gateway is also reachable as `gateway.docker.internal`.
{% endcomment %}
ゲートウェイも`gateway.docker.internal`として到達可能です。
@z

@x
For more information about the networking features in Docker Desktop for Windows, see
[Networking](networking.md).
@y
{% comment %}
For more information about the networking features in Docker Desktop for Windows, see
[Networking](networking.md).
{% endcomment %}
Docker Desktop for Windows のネットワーク機能に関する詳細は [ネットワーク機能](networking.md) を参照してください。
@z

@x
### How do I connect to a container from Windows?
@y
{% comment %}
### How do I connect to a container from Windows?
{% endcomment %}
{: #how-do-i-connect-to-a-container-from-windows }
### Windows からコンテナーに接続するにはどうしたらよいですか
@z

@x
We recommend that you publish a port, or connect from another container. You can use the same method on Linux if the container is on an overlay network and not a bridge network, as these are not routed.
@y
{% comment %}
We recommend that you publish a port, or connect from another container. You can use the same method on Linux if the container is on an overlay network and not a bridge network, as these are not routed.
{% endcomment %}
ポートを公開する方法をお勧めします。
つまり別のコンテナーから接続します。
Linux においてはコンテナーがオーバーネットワーク上にあり、ブリッジネットワーク上でないのであれば、そういったコンテナーはルーティングされていないため、同様の方法により接続することができます。
@z

@x
For more information and examples, see
[I want to connect to a container from Windows](networking.md#i-want-to-connect-to-a-container-from-windows) in the [Networking](networking.md) topic.
@y
{% comment %}
For more information and examples, see
[I want to connect to a container from Windows](networking.md#i-want-to-connect-to-a-container-from-windows) in the [Networking](networking.md) topic.
{% endcomment %}
詳しい情報や利用例については [ネットワーク機能](networking.md) にあるトピック、[Windows からコンテナーに接続したい](networking.md#i-want-to-connect-to-a-container-from-windows) を参照してください。
@z

@x
## Volumes
@y
{% comment %}
## Volumes
{% endcomment %}
{: #volumes }
## ボリューム
@z

@x
### Can I change permissions on shared volumes for container-specific deployment requirements?
@y
{% comment %}
### Can I change permissions on shared volumes for container-specific deployment requirements?
{% endcomment %}
{: #can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements }
### コンテナーに固有のデプロイ方法が必要なので、共有ボリュームのパーミッションを変更できますか
@z

@x
No, at this point, Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](index.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](http://permissions-calculator.org/decode/0777/){: target="_blank" rel="noopener" class="_"}
(`read`, `write`, `execute` permissions for `user` and for 
`group`) which is not configurable.
@y
{% comment %}
No, at this point, Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](index.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](http://permissions-calculator.org/decode/0777/){: target="_blank" rel="noopener" class="_"}
(`read`, `write`, `execute` permissions for `user` and for 
`group`) which is not configurable.
{% endcomment %}
いいえ。
現在 Docker Desktop では、デプロイコンテナーの [共有ボリューム](index.md#file-sharing) に対して、Unix 流のパーミッション制御（`chmod`）を行うことはできません。
パーミッションはそもそもデフォルトの [0777](http://permissions-calculator.org/decode/0777/){: target="_blank" rel="noopener" class="_"}（ユーザーおよびグループに対しての`read`、`write`、`execute`権限）に設定され、変更することはできません。
@z

@x
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes).
@y
{% comment %}
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes).
{% endcomment %}
回避策や詳細に関しては [共有ボリューム上のデータディレクトリに対するパーミッションエラー](troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes) を参照してください。
@z

@x
### How do symlinks work on Windows?
@y
{% comment %}
### How do symlinks work on Windows?
{% endcomment %}
{: #how-do-symlinks-work-on-windows }
### Windows においてシンボリックリンクはどのように動作しますか
@z

@x
Docker Desktop supports 2 kinds of symlink:
@y
{% comment %}
Docker Desktop supports 2 kinds of symlink:
{% endcomment %}
Docker Desktop では以下の 2 種類のシンボリックリンクをサポートします。
@z

@x
1. Windows native symlinks: these are visible inside containers as symlinks.
2. Symlinks created inside a container: these are represented as [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks) i.e. regular Windows files with special metadata. These appear as symlinks inside containers but not as symlinks on the host.
@y
{% comment %}
1. Windows native symlinks: these are visible inside containers as symlinks.
2. Symlinks created inside a container: these are represented as [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks) i.e. regular Windows files with special metadata. These appear as symlinks inside containers but not as symlinks on the host.
{% endcomment %}
1. Windows ネイティブなシンボリックリンク。
   これはコンテナー内部からもシンボリックリンクとして見えます。
2. コンテナー内部に生成するシンボリックリンク。
   これは [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks) と表現されるもので、特殊なメタデータを持った通常の Windows ファイルです。
   コンテナー内部からはシンボリックリンクとして見えますが、ホスト上はシンボリックリンクではありません。
@z

@x
## Certificates
@y
{% comment %}
## Certificates
{% endcomment %}
{: #certificates }
## 証明書
@z

@x
### How do I add custom CA certificates?
@y
{% comment %}
### How do I add custom CA certificates?
{% endcomment %}
{: #how-do-i-add-custom-ca-certificates }
### カスタム CA 証明書を追加するにはどうしたらよいですか
@z

@x
Docker Desktop supports all trusted Certificate Authorities (CAs) (root or
intermediate). Docker recognizes certs stored under Trust Root
Certification Authorities or Intermediate Certification Authorities.
@y
{% comment %}
Docker Desktop supports all trusted Certificate Authorities (CAs) (root or
intermediate). Docker recognizes certs stored under Trust Root
Certification Authorities or Intermediate Certification Authorities.
{% endcomment %}
Docker Desktop は信頼された認証局（ルートあるいは中間）をすべてサポートします。
Docker は信頼されたルート認証局（Trust Root Certification Authorities）あるいは中間認証局（Intermediate Certification Authorities）の証明書ストアを認識します。
@z

@x
 For more information on adding server and client side certs, see [Adding TLS certificates](index.md#adding-tls-certificates) in the Getting Started topic.
@y
 {% comment %}
 For more information on adding server and client side certs, see [Adding TLS certificates](index.md#adding-tls-certificates) in the Getting Started topic.
 {% endcomment %}
 サーバー側とクライアント側への証明書の追加に関しては、ユーザーマニュアルのトピックに示している [TLS 証明書の追加](index.md#adding-tls-certificates) を参照してください。
@z

@x
### How do I add client certificates?
@y
{% comment %}
### How do I add client certificates?
{% endcomment %}
{: #how-do-i-add-client-certificates }
### クライアント証明書はどうやって追加したらよいですか
@z

@x
For information on adding client certificates, see [Adding TLS certificates](index.md#adding-tls-certificates) in the Getting Started topic.
@y
{% comment %}
For information on adding client certificates, see [Adding TLS certificates](index.md#adding-tls-certificates) in the Getting Started topic.
{% endcomment %}
クライアント証明書の追加に関しては、ユーザーマニュアルのトピックに示している [TLS 証明書の追加](index.md#adding-tls-certificates) を参照してください。
@z

@x
### Can I pass through a USB device to a container?
@y
{% comment %}
### Can I pass through a USB device to a container?
{% endcomment %}
{: #can-i-pass-through-a-usb-device-to-a-container }
### USB デバイスをコンテナーに接続することはできますか
@z

@x
Unfortunately, it is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
@y
{% comment %}
Unfortunately, it is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
{% endcomment %}
残念ながら USB デバイス（あるいはシリアルポート）をコンテナーに接続することはできません。
これはハイパーバイザーレベルでの対応を必要とするためです。
@z

@x
### Can I run Docker Desktop in nested virtualization scenarios?
@y
{% comment %}
### Can I run Docker Desktop in nested virtualization scenarios?
{% endcomment %}
{: #can-i-run-docker-desktop-in-nested-virtualization-scenarios }
### ネストした仮想環境において Docker Desktop を利用できますか
@z

@x
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or VMware Fusion on a Mac provided that the VM is properly configured. However, problems and intermittent failures may still occur due to the way these apps virtualize the hardware. For these reasons, **Docker Desktop is not supported in nested virtualization scenarios**. It might work in some cases, and not in others. For more information, see [Running Docker Desktop in nested virtualization scenarios](/docker-for-windows/troubleshoot/#running-docker-desktop-in-nested-virtualization-scenarios).
@y
{% comment %}
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or VMware Fusion on a Mac provided that the VM is properly configured. However, problems and intermittent failures may still occur due to the way these apps virtualize the hardware. For these reasons, **Docker Desktop is not supported in nested virtualization scenarios**. It might work in some cases, and not in others. For more information, see [Running Docker Desktop in nested virtualization scenarios](/docker-for-windows/troubleshoot/#running-docker-desktop-in-nested-virtualization-scenarios).
{% endcomment %}
Docker Desktop は Mac 上の Parallels や VMware Fusion といったアプリ内に稼動する Windows 10 VM 内で実行させることができます。
その場合には VM を適切に設定することが必要です。
ただしそういったアプリがハードウェア仮想化を実現する方法に起因して、何かの問題や断続的な障害が発生する場合があります。
このことから **Docker Desktop はネストした仮想環境内での利用はサポートしていません**。
動作する環境もあれば、動作しない環境もあります。
詳しくは [ネストした仮想環境内での Docker Desktop の実行]({{ site.baseurl }}/docker-for-windows/troubleshoot/#running-docker-desktop-in-nested-virtualization-scenarios) を参照してください。
@z

@x
### Can I use VirtualBox alongside Docker Desktop?
@y
{% comment %}
### Can I use VirtualBox alongside Docker Desktop?
{% endcomment %}
{: #can-i-use-virtualbox-alongside-docker-desktop }
### Docker Desktop とともに VirtualBox を利用できますか
@z

@x
Yes, you can run VirtualBox along with Docker Desktop if you have enabled the [ Windows Hypervisor Platform](https://docs.microsoft.com/en-us/virtualization/api/){: target="_blank" rel="noopener" class="_"} feature on your machine.
@y
{% comment %}
Yes, you can run VirtualBox along with Docker Desktop if you have enabled the [ Windows Hypervisor Platform](https://docs.microsoft.com/en-us/virtualization/api/){: target="_blank" rel="noopener" class="_"} feature on your machine.
{% endcomment %}
はい。
マシン上において [Windows ハイパーバイザープラットフォーム](https://docs.microsoft.com/en-us/virtualization/api/){: target="_blank" rel="noopener" class="_"} 機能を有効にしていれば、Docker Desktop とともに VirtualBox を利用することができます。
@z

@x
## Windows requirements
@y
{% comment %}
## Windows requirements
{% endcomment %}
{: #windows-requirements }
## Windows 要件
@z

@x
### Can I run Docker Desktop on Windows Server?
@y
{% comment %}
### Can I run Docker Desktop on Windows Server?
{% endcomment %}
{: #can-i-run-docker-desktop-on-windows-server }
### Windows Server 上で Docker Desktop を実行できますか
@z

@x
No, running Docker Desktop on Windows Server is not supported.
@y
{% comment %}
No, running Docker Desktop on Windows Server is not supported.
{% endcomment %}
いいえ。
Windows Server での Docker Desktop の実行はサポートされていません。
@z

@x
### How do I run Windows containers on Windows Server?
@y
{% comment %}
### How do I run Windows containers on Windows Server?
{% endcomment %}
{: #how-do-i-run-windows-containers-on-windows-server }
### Windows Server 上で Windows コンテナーはどのようにして実行しますか
@z

@x
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. For more information, see the tutorial about running Windows containers on Windows Server in
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. For more information, see the tutorial about running Windows containers on Windows Server in
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
ネイティブな Windows バイナリをインストールして利用すれば Docker Desktop がなくても Windows コンテナーの開発と実行ができます。
詳しくは [Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md){: target="_blank" rel="noopener" class="_"}（Windows コンテナーをはじめよう）に示されている、Windows Server 上の Windows コンテナー起動のチュートリアルを参照してください。
@z

@x
### Can I install Docker Desktop on Windows 10 Home?
@y
{% comment %}
### Can I install Docker Desktop on Windows 10 Home?
{% endcomment %}
{: #can-i-install-docker-desktop-on-windows-10-home }
### Docker Desktop は Windows 10 Home にインストールできますか
@z

@x
Windows 10 Home, version 2004 users can now install [Docker Desktop Stable 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) or a later release with the [WSL 2 backend](wsl.md).
@y
{% comment %}
Windows 10 Home, version 2004 users can now install [Docker Desktop Stable 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) or a later release with the [WSL 2 backend](wsl.md).
{% endcomment %}
Windows 10 Home バージョン 2004 ユーザーは、[WSL 2 バックエンド](wsl.md) を利用して [Docker Desktop 安定版 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) またはより最新リリースをインストールできるようになりました。
@z

@x
Docker Desktop Stable releases require the Hyper-V feature which is not available in the Windows 10 Home edition.
@y
{% comment %}
Docker Desktop Stable releases require the Hyper-V feature which is not available in the Windows 10 Home edition.
{% endcomment %}
Docker Desktop 安定版リリースでは Hyper-V 機能を必要としますが、Windows 10 Home エディションではこの機能が利用できません。
@z

@x
### Why is Windows 10 required?
@y
{% comment %}
### Why is Windows 10 required?
{% endcomment %}
{: #why-is-windows-10-required }
### なぜ Windows 10 が必要なのですか
@z

@x
Docker Desktop uses the Windows Hyper-V features. While older Windows versions have Hyper-V, their Hyper-V implementations lack features critical for Docker Desktop to work.
@y
{% comment %}
Docker Desktop uses the Windows Hyper-V features. While older Windows versions have Hyper-V, their Hyper-V implementations lack features critical for Docker Desktop to work.
{% endcomment %}
Docker Desktop は Windows の Hyper-V 機能を利用します。
それ以前の古い Windows バージョンにも Hyper-V 機能がありますが、その実装には致命的な機能不足があるため Docker Desktop を動作させることができません。
@z

@x
### Why does Docker Desktop fail to start when anti-virus software is installed?
@y
{% comment %}
### Why does Docker Desktop fail to start when anti-virus software is installed?
{% endcomment %}
{: #why-does-docker-desktop-fail-to-start-when-anti-virus-software-is-installed }
### アンチウィルスソフトをインストールしていると Docker Desktop の起動に失敗するのはなぜですか
@z

@x
Some anti-virus software may be incompatible with Hyper-V and Windows 10 builds which impact Docker
Desktop. For more information, see [Docker Desktop fails to start when anti-virus software is installed](troubleshoot.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed)
in [Troubleshooting](troubleshoot.md).
@y
{% comment %}
Some anti-virus software may be incompatible with Hyper-V and Windows 10 builds which impact Docker
Desktop. For more information, see [Docker Desktop fails to start when anti-virus software is installed](troubleshoot.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed)
in [Troubleshooting](troubleshoot.md).
{% endcomment %}
アンチウィルスソフトの中には、Docker Desktop に必要となる Hyper-V と Windows 10 ビルドと互換性がないものがあります。
詳しくは [トラブルシューティング](troubleshoot.md) 内にある [アンチウィルスソフトのインストール時における Docker Desktop 起動の失敗](troubleshoot.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed) を参照してください。
@z

@x
## Feedback
@y
{% comment %}
## Feedback
{% endcomment %}
{: #feedback }
## フィードバック
@z

@x
### What kind of feedback are we looking for?
@y
{% comment %}
### What kind of feedback are we looking for?
{% endcomment %}
{: #what-kind-of-feedback-are-we-looking-for }
### どのような種類のフィードバックを求めていますか
@z

@x
Everything is fair game. We'd like your impressions on the download and install
process, startup, functionality available, the GUI, usefulness of the app,
command line integration, and so on. Tell us about problems, what you like, or
functionality you'd like to see added.
@y
{% comment %}
Everything is fair game. We'd like your impressions on the download and install
process, startup, functionality available, the GUI, usefulness of the app,
command line integration, and so on. Tell us about problems, what you like, or
functionality you'd like to see added.
{% endcomment %}
種類の如何を問いません。
望んでいるのは皆さんの感じた印象です。
ダウンロードインストール処理、起動、利用可能な機能、GUI、アプリの使いやすさ、コマンドライン統合、などなどです。
発生した問題、好きなもの、追加を希望する機能などをお知らせください。
@z

@x
### What if I have problems or questions?
@y
{% comment %}
### What if I have problems or questions?
{% endcomment %}
{: #what-if-i-have-problems-or-questions }
### 問題発生や疑問があったらどうしますか
@z

@x
You can find information about diagnosing and troubleshooting common issues in the [Logs and Troubleshooting](troubleshoot.md) topic.
@y
{% comment %}
You can find information about diagnosing and troubleshooting common issues in the [Logs and Troubleshooting](troubleshoot.md) topic.
{% endcomment %}
診断やトラブルシューティングにおける共通的な問題について [ログとトラブルシューティング](troubleshoot.md) にトピックがあります。
@z

@x
If you do not find a solution in Troubleshooting, browse issues on
[Docker Desktop for Windows issues on GitHub](https://github.com/docker/for-win/issues){: target="_blank" rel="noopener" class="_"}
or create a new one. You can also create new issues based on diagnostics. To learn more, see
[Diagnose problems, send feedback, and create GitHub issues](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues).
@y
{% comment %}
If you do not find a solution in Troubleshooting, browse issues on
[Docker Desktop for Windows issues on GitHub](https://github.com/docker/for-win/issues){: target="_blank" rel="noopener" class="_"}
or create a new one. You can also create new issues based on diagnostics. To learn more, see
[Diagnose problems, send feedback, and create GitHub issues](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues).
{% endcomment %}
トラブルシューティングでは解決策が見つからなかった場合は、[Docker Desktop for Windows の GitHub 上の issue](https://github.com/docker/for-win/issues){: target="_blank" rel="noopener" class="_"} を確認した上で、新たな issue を生成してください。
診断情報に基づいた issue を新規生成するのでもかまいません。
詳細は [問題診断、フィードバック送信、GitHub issue 生成](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues) を参照してください。
@z

@x
The [Docker Desktop for Windows forum](https://forums.docker.com/c/docker-for-windows){: target="_blank" rel="noopener" class="_"}
contains discussion threads. You can also create discussion topics there,
but we recommend using the GitHub issues over the forums for better tracking and
response.
@y
{% comment %}
The [Docker Desktop for Windows forum](https://forums.docker.com/c/docker-for-windows){: target="_blank" rel="noopener" class="_"}
contains discussion threads. You can also create discussion topics there,
but we recommend using the GitHub issues over the forums for better tracking and
response.
{% endcomment %}
[Docker Desktop for Windows フォーラム](https://forums.docker.com/c/docker-for-windows){: target="_blank" rel="noopener" class="_"} にはディスカッションを行っているスレッドがあります。
そこにディスカッショントピックを生成することができます。
ただし GitHub issue の方が追跡が容易であり返信も得やすいため、フォーラムよりもそちらをお勧めします。
@z

@x
### How can I opt out of sending my usage data?
@y
{% comment %}
### How can I opt out of sending my usage data?
{% endcomment %}
{: #how-can-i-opt-out-of-sending-my-usage-data }
### 利用状況データの送信を取り止めるにはどうしたらよいですか
@z

@x
If you do not want to send the usage data, from the Docker menu, go to **Settings** > **General** and then clear the **Send usage statistics** box.
@y
{% comment %}
If you do not want to send the usage data, from the Docker menu, go to **Settings** > **General** and then clear the **Send usage statistics** box.
{% endcomment %}
利用状況データの送信を行いたくない場合は、Docker メニューの **Settings** > **General** を実行し **Send usage statistics**（利用統計の送信）チェックボックスをクリアしてください。
@z

@x
### How is personal data handled in Docker Desktop?
@y
{% comment %}
### How is personal data handled in Docker Desktop?
{% endcomment %}
{: #how-is-personal-data-handled-in-docker-desktop }
### 個人データは Docker Desktop においてどのように取り扱われますか
@z

@x
When uploading diagnostics to help Docker with investigating issues, the
uploaded diagnostics bundle may contain personal data such as usernames and IP
addresses. The diagnostics bundles are only accessible to Docker, Inc. employees
who are directly involved in diagnosing Docker Desktop issues.
@y
{% comment %}
When uploading diagnostics to help Docker with investigating issues, the
uploaded diagnostics bundle may contain personal data such as usernames and IP
addresses. The diagnostics bundles are only accessible to Docker, Inc. employees
who are directly involved in diagnosing Docker Desktop issues.
{% endcomment %}
Docker が問題を調査できるようにするための診断情報のアップロードにおいては、その診断情報の中に、ユーザー名や IP アドレスのような個人データが含まれる場合があります。
診断情報にアクセスできるのは、Docker Desktop に関する問題の診断に直接関与する Docker 社の社員のみです。
@z

@x
By default, Docker, Inc. will delete uploaded diagnostics bundles after 30 days unless they are referenced in an open issue on the
[docker/for-mac](https://github.com/docker/for-mac/issues) or
[docker/for-win](https://github.com/docker/for-win/issues) issue trackers. If an
issue is closed, Docker, Inc. will remove the referenced diagnostics bundles
within 30 days. You may also request the removal of a diagnostics bundle by
either specifying the diagnostics ID or through your GitHub ID (if the diagnostics ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the diagnostics bundle to investigate specific user issues, but may derive high-level (non-personal) metrics such as the rate of issues from it.
@y
{% comment %}
By default, Docker, Inc. will delete uploaded diagnostics bundles after 30 days unless they are referenced in an open issue on the
[docker/for-mac](https://github.com/docker/for-mac/issues) or
[docker/for-win](https://github.com/docker/for-win/issues) issue trackers. If an
issue is closed, Docker, Inc. will remove the referenced diagnostics bundles
within 30 days. You may also request the removal of a diagnostics bundle by
either specifying the diagnostics ID or through your GitHub ID (if the diagnostics ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the diagnostics bundle to investigate specific user issues, but may derive high-level (non-personal) metrics such as the rate of issues from it.
{% endcomment %}
原則として Docker 社はアップロードされた診断情報を 30 日後には削除します。
ただし [docker/for-mac](https://github.com/docker/for-mac/issues) や [docker/for-win](https://github.com/docker/for-win/issues) の issue トラッカーにおいて、オープンされた issue から参照されている場合は除きます。
issue がクローズされたら Docker 社は、参照されていた診断情報を 30 日以内に削除します。
ユーザーから診断情報の削除を要請することもでき、その場合は診断情報 ID か、あるいは GitHub ID（その診断情報が GitHub issue に言及している場合）を送付します。
Docker 社は診断情報内のデータを、特定の問題を調査するためだけに利用します。
ただし issue の頻度などのように高度な（個人情報ではない）メトリックスを収集する場合があります。
@z
