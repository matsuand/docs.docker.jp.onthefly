%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions
keywords: mac faqs
redirect_from:
- /mackit/faqs/
title: Frequently asked questions (FAQ)
---
@y
---
description: Frequently asked questions
keywords: mac faqs
redirect_from:
- /mackit/faqs/
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
## What is Docker.app?
@y
{% comment %}
## What is Docker.app?
{% endcomment %}
{: #what-is-dockerapp }
## Docker.app とは何ですか
@z

@x
`Docker.app` is Docker Desktop on Mac. It bundles the Docker client and Docker Engine. `Docker.app` uses the macOS Hypervisor.framework to run containers, which means that a separate VirtualBox is not required to run Docker Desktop.
@y
{% comment %}
`Docker.app` is Docker Desktop on Mac. It bundles the Docker client and Docker Engine. `Docker.app` uses the macOS Hypervisor.framework to run containers, which means that a separate VirtualBox is not required to run Docker Desktop.
{% endcomment %}
`Docker.app`は Mac 上の Docker Desktop です。
これは Docker クライアントと Docker Engine を提供します。
`Docker.app`はコンテナー実行のために macOS Hypervisor.framework を利用します。
これはつまり Docker Desktop の実行において、個別に VirtualBox を用意する必要はないということです。
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
You need a Mac that supports hardware virtualization. For more information, see [Docker Desktop Mac system requirements](install.md#system-requirements).
@y
{% comment %}
You need a Mac that supports hardware virtualization. For more information, see [Docker Desktop Mac system requirements](install.md#system-requirements).
{% endcomment %}
ハードウェア仮想化をサポートする Mac が必要です。
詳しくは [Docker Desktop Mac システム要件](install.md#system-requirements) を参照してください。
@z

@x
## Is Docker Desktop compatible with Apple silicon processors?
@y
{% comment %}
## Is Docker Desktop compatible with Apple silicon processors?
{% endcomment %}
{: #is-docker-desktop-compatible-with-apple-silicon-processors }
## Docker Desktop は Apple シリコンプロセッサーと互換性がありますか
@z

@x
At the moment, Docker Desktop is compatible with Intel processors only. You can follow the status of Apple Silicon support in our [roadmap](https://github.com/docker/roadmap/issues/142){:target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
At the moment, Docker Desktop is compatible with Intel processors only. You can follow the status of Apple Silicon support in our [roadmap](https://github.com/docker/roadmap/issues/142){:target="_blank" rel="noopener" class="_"}.
{% endcomment %}
現在のところ Docker Desktop は Intel プロセッサーのみに対応しています。
Apple シリコンプロセッサーへの対応状況については [ロードマップ](https://github.com/docker/roadmap/issues/142){:target="_blank" rel="noopener" class="_"} を確認してください。
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
You might need to provide the location of the Engine API for Docker clients and
development tools.
@y
{% comment %}
You might need to provide the location of the Engine API for Docker clients and
development tools.
{% endcomment %}
Docker クライアントや開発ツールに対して、Engine API の場所を指定することが必要になります。
@z

@x
On Docker Desktop, clients can connect to the Docker Engine through a Unix
socket: `unix:///var/run/docker.sock`.
@y
{% comment %}
On Docker Desktop, clients can connect to the Docker Engine through a Unix
socket: `unix:///var/run/docker.sock`.
{% endcomment %}
Docker Desktop において Docker クライアントはその Docker Engine に対して Unix ソケット`unix:///var/run/docker.sock`を通じて接続することができます。
@z

@x
See also [Docker Engine API](../engine/api/index.md) and Docker Desktop for Mac forums topic
[Using pycharm Docker plugin](https://forums.docker.com/t/using-pycharm-docker-plugin-with-docker-beta/8617){: target="_blank" rel="noopener" class="_"}.
@y
{% comment %}
See also [Docker Engine API](../engine/api/index.md) and Docker Desktop for Mac forums topic
[Using pycharm Docker plugin](https://forums.docker.com/t/using-pycharm-docker-plugin-with-docker-beta/8617){: target="_blank" rel="noopener" class="_"}.
{% endcomment %}
[Docker Engine API](../engine/api/index.md) や Docker Desktop for Mac のフォーラムトピック [pycharm Docker プラグインの利用](https://forums.docker.com/t/using-pycharm-docker-plugin-with-docker-beta/8617){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
If you are working with applications like [Apache Maven](https://maven.apache.org/){: target="_blank" rel="noopener" class="_"}
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
For example:
@y
{% comment %}
If you are working with applications like [Apache Maven](https://maven.apache.org/){: target="_blank" rel="noopener" class="_"}
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
For example:
{% endcomment %}
[Apache Maven](https://maven.apache.org/){: target="_blank" rel="noopener" class="_"} のように、環境変数`DOCKER_HOST`や`DOCKER_CERT_PATH`の設定を必要とするアプリケーションを利用している場合は、Unix ソケットを通じて Docker インスタンスに接続する設定を行います。
たとえば以下のとおりです。
@z

@x
```bash
export DOCKER_HOST=unix:///var/run/docker.sock
```
@y
```bash
export DOCKER_HOST=unix:///var/run/docker.sock
```
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
Mac has a changing IP address (or none if you have no network access). We recommend that you attach an unused IP to the `lo0` interface on the
Mac so that containers can connect to this address.
@y
{% comment %}
Mac has a changing IP address (or none if you have no network access). We recommend that you attach an unused IP to the `lo0` interface on the
Mac so that containers can connect to this address.
{% endcomment %}
Mac は動的 IP アドレスを利用します（ただしネットワークアクセスがなければ IP アドレスはありません）。
Mac においては未使用の IP アドレスを`lo0`インターフェースに割り当てることを推奨します。
これによってコンテナーがこのアドレスに対して接続できるようになります。
@z

@x
For more information and examples, see
[I want to connect from a container to a service on the host](networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host) in the [Networking](networking.md) topic.
@y
{% comment %}
For more information and examples, see
[I want to connect from a container to a service on the host](networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host) in the [Networking](networking.md) topic.
{% endcomment %}
詳しい情報や利用例については [ネットワーク機能](networking.md) にあるトピック、[コンテナーからホスト上のサービスに接続したい](networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host) を参照してください。
@z

@x
### How do I connect to a container from Mac?
@y
{% comment %}
### How do I connect to a container from Mac?
{% endcomment %}
{: #how-do-i-connect-to-a-container-from-mac }
### Mac からコンテナーに接続するにはどうしたらよいですか
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
[I want to connect to a container from the Mac](networking.md#i-want-to-connect-to-a-container-from-the-mac) in the [Networking](networking.md) topic.
@y
{% comment %}
For more information and examples, see
[I want to connect to a container from the Mac](networking.md#i-want-to-connect-to-a-container-from-the-mac) in the [Networking](networking.md) topic.
{% endcomment %}
詳しい情報や利用例については [ネットワーク機能](networking.md) にあるトピック、[Mac からコンテナーに接続したい](networking.md#i-want-to-connect-to-a-container-from-the-mac) を参照してください。
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
Docker Desktop supports all trusted certificate authorities (CAs) (root or intermediate). For more information on adding server and client side certs, see
[Add TLS certificates](index.md#add-tls-certificates) in the Getting Started topic.
@y
{% comment %}
Docker Desktop supports all trusted certificate authorities (CAs) (root or intermediate). For more information on adding server and client side certs, see
[Add TLS certificates](index.md#add-tls-certificates) in the Getting Started topic.
{% endcomment %}
Docker Desktop は信頼された認証局（ルートあるいは中間）をすべてサポートします。
サーバー側とクライアント側への証明書の追加に関しては、ユーザーマニュアルのトピックに示している [TLS 証明書の追加](index.md#add-tls-certificates) を参照してください。
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
For information on adding client certificates, see
[Add client certificates](index.md#add-client-certificates) in the Getting Started topic.
@y
{% comment %}
For information on adding client certificates, see
[Add client certificates](index.md#add-client-certificates) in the Getting Started topic.
{% endcomment %}
クライアント証明書の追加に関しては、ユーザーマニュアルのトピックに示している [クライアント証明書の追加](index.md#add-client-certificates) を参照してください。
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
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or
VMware Fusion on a Mac provided that the VM is properly configured. However,
problems and intermittent failures may still occur due to the way these apps
virtualize the hardware. For these reasons, **Docker Desktop is not supported in
nested virtualization scenarios**. It might work in some cases, and not in others.
For more information, see [Running Docker Desktop in nested virtualization scenarios](../docker-for-windows/troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios).
@y
{% comment %}
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or
VMware Fusion on a Mac provided that the VM is properly configured. However,
problems and intermittent failures may still occur due to the way these apps
virtualize the hardware. For these reasons, **Docker Desktop is not supported in
nested virtualization scenarios**. It might work in some cases, and not in others.
For more information, see [Running Docker Desktop in nested virtualization scenarios](../docker-for-windows/troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios).
{% endcomment %}
Docker Desktop は Mac 上の Parallels や VMware Fusion といったアプリ内に稼動する Windows 10 VM 内で実行させることができます。
その場合には VM を適切に設定することが必要です。
ただしそういったアプリがハードウェア仮想化を実現する方法に起因して、何かの問題や断続的な障害が発生する場合があります。
このことから **Docker Desktop はネストした仮想環境内での利用はサポートしていません**。
動作する環境もあれば、動作しない環境もあります。
詳しくは [ネストした仮想環境内での Docker Desktop の実行](../docker-for-windows/troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios) を参照してください。
@z

@x
## Components of Docker Desktop
@y
{% comment %}
## Components of Docker Desktop
{% endcomment %}
{: #components-of-docker-desktop }
## Docker Desktop のコンポーネント
@z

@x
### What is HyperKit?
@y
{% comment %}
### What is HyperKit?
{% endcomment %}
{: #what-is-hyperkit }
### HyperKit とは何ですか
@z

@x
HyperKit is a hypervisor built on top of the Hypervisor.framework in macOS. It runs entirely in userspace and has no other
dependencies.
@y
{% comment %}
HyperKit is a hypervisor built on top of the Hypervisor.framework in macOS. It runs entirely in userspace and has no other
dependencies.
{% endcomment %}
HyperKit は macOS の Hypervisor.framework の最上位に構築されたハイパーバイザーです。
これは完全にユーザー空間内において動作し、他に必要とする依存パッケージはありません。
@z

@x
We use HyperKit to eliminate the need for other VM products, such as Oracle
VirtualBox or VMWare Fusion.
@y
{% comment %}
We use HyperKit to eliminate the need for other VM products, such as Oracle
VirtualBox or VMWare Fusion.
{% endcomment %}
HyperKit を用いることによって、Oracle VirtualBox や VMWare Fusion といった VM 製品を必要としません。
@z

@x
### What is the benefit of HyperKit?
@y
{% comment %}
### What is the benefit of HyperKit?
{% endcomment %}
{: #what-is-the-benefit-of-hyperkit }
### HyperKit のメリットは何ですか
@z

@x
HyperKit is thinner than VirtualBox and VMWare fusion, and the version we include is customized for Docker workloads on Mac.
@y
{% comment %}
HyperKit is thinner than VirtualBox and VMWare fusion, and the version we include is customized for Docker workloads on Mac.
{% endcomment %}
HyperKit は VirtualBox や VMWare fusion よりも軽量です。
また提供する HyperKit は Mac 上の Docker アプリのためにカスタマイズされています。
@z

@x
### Why is com.docker.vmnetd running after I quit the app?
@y
{% comment %}
### Why is com.docker.vmnetd running after I quit the app?
{% endcomment %}
{: #why-is-comdockervmnetd-running-after-i-quit-the-app }
### アプリ終了しても com.docker.vmnetd が動作しているのはなぜですか
@z

@x
The privileged helper process `com.docker.vmnetd` is started by `launchd` and
runs in the background. The process does not consume any resources unless
Docker.app connects to it, so it's safe to ignore.
@y
{% comment %}
The privileged helper process `com.docker.vmnetd` is started by `launchd` and
runs in the background. The process does not consume any resources unless
Docker.app connects to it, so it's safe to ignore.
{% endcomment %}
特権ヘルパープロセスである`com.docker.vmnetd`は`launchd`によって起動開始され、バックグラウンドで動作します。
このプロセスは Docker.app からの接続がない限りリソースを消費することはありません。
したがって無視してかまいません。
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
Everything is fair game. We'd like your impressions on the download-install
process, startup, functionality available, the GUI, usefulness of the app,
command line integration, and so on. Tell us about problems, what you like, or
functionality you'd like to see added.
@y
{% comment %}
Everything is fair game. We'd like your impressions on the download-install
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
You can find information about diagnosing and troubleshooting common issues in the [Logs and Troubleshooting](../troubleshoot) topic.
@y
{% comment %}
You can find information about diagnosing and troubleshooting common issues in the [Logs and Troubleshooting](../troubleshoot) topic.
{% endcomment %}
診断やトラブルシューティングにおける共通的な問題について [ログとトラブルシューティング](../troubleshoot) にトピックがあります。
@z

@x
If you do not find a solution in Troubleshooting, browse issues on
[Docker Desktop for Mac issues on GitHub](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} or create a new one. You can also create new issues based on diagnostics. To learn more, see
[Diagnose problems, send feedback, and create GitHub issues](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues).
@y
{% comment %}
If you do not find a solution in Troubleshooting, browse issues on
[Docker Desktop for Mac issues on GitHub](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} or create a new one. You can also create new issues based on diagnostics. To learn more, see
[Diagnose problems, send feedback, and create GitHub issues](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues).
{% endcomment %}
トラブルシューティングでは解決策が見つからなかった場合は、[Docker Desktop for Mac の GitHub 上の issue](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} を確認した上で、新たな issue を生成してください。
診断情報に基づいた issue を新規生成するのでもかまいません。
詳細は [問題診断、フィードバック送信、GitHub issue 生成](troubleshoot.md#diagnose-problems-send-feedback-and-create-github-issues) を参照してください。
@z

@x
The [Docker Desktop for Mac forum](https://forums.docker.com/c/docker-for-mac){: target="_blank" rel="noopener" class="_"}
provides discussion threads as well, and you can create discussion topics there,
but we recommend using the GitHub issues over the forums for better tracking and
response.
@y
{% comment %}
The [Docker Desktop for Mac forum](https://forums.docker.com/c/docker-for-mac){: target="_blank" rel="noopener" class="_"}
provides discussion threads as well, and you can create discussion topics there,
but we recommend using the GitHub issues over the forums for better tracking and
response.
{% endcomment %}
[Docker Desktop for Mac フォーラム](https://forums.docker.com/c/docker-for-mac){: target="_blank" rel="noopener" class="_"} には同じようにディスカッションを行っているスレッドがあります。
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
If you do not want to send the usage data, go to **Preferences** > **General** and then clear the **Send usage statistics** box.
@y
{% comment %}
If you do not want to send the usage data, go to **Preferences** > **General** and then clear the **Send usage statistics** box.
{% endcomment %}
利用状況データの送信を行いたくない場合は、**Preferences** > **General** を実行し **Send usage statistics**（利用統計の送信）チェックボックスをクリアしてください。
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
By default Docker, Inc. will delete uploaded diagnostics bundles after 30 days unless they are referenced in an open issue on the
[docker/for-mac](https://github.com/docker/for-mac/issues) or
[docker/for-win](https://github.com/docker/for-win/issues) issue trackers. If an
issue is closed, Docker, Inc. will remove the referenced diagnostics bundles
within 30 days. You may also request the removal of a diagnostics bundle by
either specifying the diagnostics ID or via your GitHub ID (if the diagnostics
ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the
diagnostics bundle to investigate specific user issues, but may derive high-level (non personal) metrics such as the rate of issues from it.
@y
{% comment %}
By default Docker, Inc. will delete uploaded diagnostics bundles after 30 days unless they are referenced in an open issue on the
[docker/for-mac](https://github.com/docker/for-mac/issues) or
[docker/for-win](https://github.com/docker/for-win/issues) issue trackers. If an
issue is closed, Docker, Inc. will remove the referenced diagnostics bundles
within 30 days. You may also request the removal of a diagnostics bundle by
either specifying the diagnostics ID or via your GitHub ID (if the diagnostics
ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the
diagnostics bundle to investigate specific user issues, but may derive high-level (non personal) metrics such as the rate of issues from it.
{% endcomment %}
原則として Docker 社はアップロードされた診断情報を 30 日後には削除します。
ただし [docker/for-mac](https://github.com/docker/for-mac/issues) や [docker/for-win](https://github.com/docker/for-win/issues) の issue トラッカーにおいて、オープンされた issue から参照されている場合は除きます。
issue がクローズされたら Docker 社は、参照されていた診断情報を 30 日以内に削除します。
ユーザーから診断情報の削除を要請することもでき、その場合は診断情報 ID か、あるいは GitHub ID（その診断情報が GitHub issue に言及している場合）を送付します。
Docker 社は診断情報内のデータを、特定の問題を調査するためだけに利用します。
ただし issue の頻度などのように高度な（個人情報ではない）メトリックスを収集する場合があります。
@z
