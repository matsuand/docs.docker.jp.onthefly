%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions
keywords: desktop, mac, windows, faqs
redirect_from:
- /mackit/faqs/
- /docker-for-mac/faqs/
- /docker-for-windows/faqs/
title: Frequently asked questions
toc_max: 2
---
@y
---
description: よくたずねられる質問。
keywords: desktop, mac, windows, faqs
redirect_from:
- /mackit/faqs/
- /docker-for-mac/faqs/
- /docker-for-windows/faqs/
title: よくたずねられる質問（FAQ）
toc_max: 2
---
@z

@x
## General
@y
{: #general }
## 全般
@z

@x
### What are the system requirements for Docker Desktop?
@y
{: #what-are-the-system-requirements-for-docker-desktop }
### Docker Desktop のシステム要件は何ですか
@z

@x
For information about Docker Desktop system requirements, see [Docker Desktop for Mac system requirements](../docker-for-mac/install.md#system-requirements) and [Docker Desktop for Windows system requirements](../docker-for-windows/install.md#system-requirements).
@y
Docker Desktop のシステム要件については、[Docker Desktop for Mac システム要件](../docker-for-mac/install.md#system-requirements) または [Docker Desktop for Windows システム要件](../docker-for-windows/install.md#system-requirements) を参照してください。
@z

@x
### What is an experimental feature?
@y
{: #what-is-an-experimental-feature }
### 試験的機能とは何ですか
@z

@x
{% include experimental.md %}
@y
{% include experimental.md %}
@z

@x
### Where can I find information about diagnosing and troubleshooting Docker Desktop issues?
@y
{: #where-can-i-find-information-about-diagnosing-and-troubleshooting-docker-desktop-issues }
### Where can I find information about diagnosing and troubleshooting Docker Desktop issues?
@z

@x
You can find information about diagnosing and troubleshooting common issues in the Troubleshooting topic. See [Mac Logs and Troubleshooting](../docker-for-mac/troubleshoot.md) topic and Windows Logs and [Windows Logs and Troubleshooting](../docker-for-windows/troubleshoot.md).
@y
You can find information about diagnosing and troubleshooting common issues in the Troubleshooting topic. See [Mac Logs and Troubleshooting](../docker-for-mac/troubleshoot.md) topic and Windows Logs and [Windows Logs and Troubleshooting](../docker-for-windows/troubleshoot.md).
@z

@x
If you do not find a solution in Troubleshooting, browse issues on
[docker/for-mac](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} or [docker/for-win](https://github.com/docker/for-win/issues){: target="_blank" rel="noopener" class="_"} GitHub repository, or create a new one.
@y
If you do not find a solution in Troubleshooting, browse issues on
[docker/for-mac](https://github.com/docker/for-mac/issues){: target="_blank" rel="noopener" class="_"} or [docker/for-win](https://github.com/docker/for-win/issues){: target="_blank" rel="noopener" class="_"} GitHub repository, or create a new one.
@z

@x
### How do I connect to the remote Docker Engine API?
@y
{: #how-do-i-connect-to-the-remote-docker-engine-api }
### リモートの Docker Engine API にアクセスするにはどうしてらよいですか
@z

@x
To connect to the remote Engine API, you might need to provide the location of the Engine API for Docker clients and development tools.
@y
リモート Engine API に接続するには、Docker クライアントや開発ツールに対して Engine API の場所を指定することが必要になります。
@z

@x
Mac and Windows WSL 2 users can connect to the Docker Engine through a Unix socket: `unix:///var/run/docker.sock`.
@y
Mac and Windows WSL 2 users can connect to the Docker Engine through a Unix socket: `unix:///var/run/docker.sock`.
@z

@x
If you are working with applications like [Apache Maven](https://maven.apache.org/){: target="_blank" rel="noopener" class="_"}
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
@y
If you are working with applications like [Apache Maven](https://maven.apache.org/){: target="_blank" rel="noopener" class="_"}
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
@z

@x
For example:
@y
For example:
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
Docker Desktop Windows users can connect to the Docker Engine through a **named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@y
Docker Desktop Windows users can connect to the Docker Engine through a **named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@z

@x
For details, see [Docker Engine API](../engine/api/index.md).
@y
詳しくは [Docker Engine API](../engine/api/index.md) を参照してください。
@z

@x
### How do I connect from a container to a service on the host?
@y
{: #how-do-i-connect-from-a-container-to-a-service-on-the-host }
### コンテナーからホスト上のサービスに接続するにはどうしたらよいですか
@z

@x
Both Mac and Windows have a changing IP address (or none if you have no network access). On both Mac and Windows, we recommend that you connect to the special DNS name `host.docker.internal`, which resolves to the internal IP address used by the host. This is for development purposes and does not work in a production environment outside of Docker Desktop.
@y
Mac と Windows では、ともに動的 IP アドレスを利用します（ただしネットワークアクセスがなければ IP アドレスはありません）。
そこでは特別な DNS 名`host.docker.internal`へ接続することを推奨します。
これはホスト上において用いられる内部 IP アドレスへの変換を行います。
開発目的での利用に限られ、Docker Desktop の外部に位置する本番環境では動作しません。
@z

@x
For more information and examples, see how to connect from a container to a service on the host
[on Mac](../docker-for-mac/networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host) and [on Windows](../docker-for-windows/networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@y
For more information and examples, see how to connect from a container to a service on the host
[on Mac](../docker-for-mac/networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host) and [on Windows](../docker-for-windows/networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@z

@x
### How do I connect to a container from Mac or Windows?
@y
{: #how-do-i-connect-to-a-container-from-mac-or-windows }
### Mac や Windows からコンテナーに接続するにはどうしたらよいですか
@z

@x
We recommend that you publish a port, or connect from another container. Port forwarding works for `localhost`; `--publish`, `-p`, or `-P` all work.
@y
ポートを公開する方法をお勧めします。
つまり別のコンテナーから接続します。
`localhost`に対してポートフォワーディングが動作し、`--publish`、`-p`、`-P`がすべて利用可能です。
@z

@x
For more information and examples, see
[I want to connect to a container from Mac](../docker-for-mac/networking.md#i-want-to-connect-to-a-container-from-the-mac) and [I want to connect to a container from Windows](../docker-for-windows/networking.md#i-want-to-connect-to-a-container-from-the-mac).
@y
詳しい情報や利用例については [Mac からコンテナーに接続したい](../docker-for-mac/networking.md#i-want-to-connect-to-a-container-from-the-mac) や [Windows からコンテナーに接続したい](networking.md#i-want-to-connect-to-a-container-from-windows) を参照してください。
@z

@x
### How do I add custom CA certificates?
@y
{: #how-do-i-add-custom-ca-certificates }
### カスタム CA 証明書を追加するにはどうしたらよいですか
@z

@x
Docker Desktop supports all trusted certificate authorities (CAs) (root or intermediate). For more information on adding server and client side certs, see
[Add TLS certificates on Mac](../docker-for-mac/index.md#add-tls-certificates) and [Add TLS certificates on Windows](../docker-for-windows/index.md#adding-tls-certificates).
@y
Docker Desktop supports all trusted certificate authorities (CAs) (root or intermediate). For more information on adding server and client side certs, see
[Add TLS certificates on Mac](../docker-for-mac/index.md#add-tls-certificates) and [Add TLS certificates on Windows](../docker-for-windows/index.md#adding-tls-certificates).
@z

@x
### Can I pass through a USB device to a container?
@y
{: #can-i-pass-through-a-usb-device-to-a-container }
### USB デバイスをコンテナーに接続することはできますか
@z

@x
Unfortunately, it is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
@y
残念ながら USB デバイス（あるいはシリアルポート）をコンテナーに接続することはできません。
これはハイパーバイザーレベルでの対応を必要とするためです。
@z

@x
### Can I run Docker Desktop in nested virtualization scenarios?
@y
{: #can-i-run-docker-desktop-in-nested-virtualization-scenarios }
### ネストした仮想環境において Docker Desktop を利用できますか
@z

@x
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or
VMware Fusion on a Mac provided that the VM is properly configured. However,
problems and intermittent failures may still occur due to the way these apps
virtualize the hardware. For these reasons, **Docker Desktop is not supported in
nested virtualization scenarios**. It might work in some cases, and not in others.
@y
Docker Desktop は Mac 上の Parallels や VMware Fusion といったアプリ内に稼動する Windows 10 VM 内で実行させることができます。
その場合には VM を適切に設定することが必要です。
ただしそういったアプリがハードウェア仮想化を実現する方法に起因して、何かの問題や断続的な障害が発生する場合があります。
このことから **Docker Desktop はネストした仮想環境内での利用はサポートしていません**。
動作する環境もあれば、動作しない環境もあります。
@z

@x
For more information, see [Running Docker Desktop in nested virtualization scenarios](../docker-for-windows/troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios).
@y
詳しくは [ネストした仮想環境内での Docker Desktop の実行]({{ site.baseurl }}/docker-for-windows/troubleshoot.md#running-docker-desktop-in-nested-virtualization-scenarios) を参照してください。
@z

@x
## Releases
@y
{: #releases }
## リリース
@z

@x
### When will Docker Desktop move to a cumulative release stream?
@y
{: #when-will-docker-desktop-move-to-a-cumulative-release-stream }
### Docker Desktop が累積的なリリースストリームに移行するのはいつですか
@z

@x
Starting with version 3.0.0, Docker Desktop will be available as a single, cumulative release stream. This is the same version for both Stable and Edge users. The next release after Docker Desktop 3.0.0 will be the first to be applied as a delta update. For more information, see [Automatic updates](../docker-for-mac/install.md#automatic-updates).
@y
Docker Desktop 3.0.0 から Docker Desktop は 1 つの累積的なリリースストリームとして提供されるようになりました。
つまり安定版（Stable）ユーザー、最新版（Edge）ユーザーのどちらも同一バージョンを用いることになります。
Docker Desktop 3.0.0 の次に行われるリリースは、デルタアップデートを採用する初めてのリリースです。
詳しくは [自動アップデート](../docker-for-mac/install.md#automatic-updates) を参照してください。
@z

@x
### How do new users install Docker Desktop?
@y
{: #how-do-new-users-install-docker-desktop }
### 新規ユーザーはどうやって Docker Desktop をインストールしたらよいですか
@z

@x
Each Docker Desktop release is also delivered as a full installer for new users. The same will apply if you have skipped a version, although this doesn't normally happen as updates will be applied automatically.
@y
各 Docker Desktop リリースは新規ユーザーに向けて完全なインストーラーも提供しています。
新規リリースは、リリースアップデートをいくつか抜かしていても適用できます。
もっともアップデートは自動的に行われることなので、そういった状況は通常は発生しません。
@z

@x
### How frequent will new releases be?
@y
{: #how-frequent-will-new-releases-be }
### 新規リリースはどれくらいの期間で行われますか
@z

@x
New releases will be available roughly monthly, similar to Edge today, unless there are critical fixes that need to be released sooner.
@y
新規リリースはおおまかに言えば 1 ヶ月ごとに利用できます。
最新版は本日も行われています。
重大な修正があればすぐにリリースが行われます。
@z

@x
### How do I ensure that all users on my team are using the same version?
@y
{: #how-do-i-ensure-that-all-users-on-my-team-are-using-the-same-version }
### チーム内ユーザーが同一バージョンを使っていることをどうやって確認したらよいですか
@z

@x
Previously you had to manage this yourself: now it will happen automatically as a side effect of all users being on the latest version.
@y
以前であれば自分で管理しておかなければなりませんでした。
今は全ユーザーが最新版に更新されることから自動的に達成されます。
@z

@x
### My colleague has got a new version but I haven’t got it yet.
@y
{: #my-colleague-has-got-a-new-version-but-i-havent-got-it-yet }
### 仲間が最新版への更新をして自分はしていないのですが
@z

@x
Sometimes we may roll out a new version gradually over a few days. Therefore, if you wait, it will turn up soon. Alternatively, you can select **Check for Updates** from the Docker menu to jump the queue and get the latest version immediately.
@y
新たなバージョンを数日かけて徐々に公開する場合があります。
したがって 2、3 日待てば、最新版が出てきます。
これとは別に Docker メニューの **Check for Updates**（アップデートの確認）を実行する方法もあります。
これを行えば、アップデート順に従うことなく即座に最新版を入手できます。
@z

@x
### Where can I find information about Stable and Edge releases?
@y
{: #where-can-i-find-information-about-stable-and-edge-releases }
### 安定版と最新版のリリース情報はどこにありますか
@z

@x
Starting with Docker Desktop 3.0.0, Stable and Edge releases are combined into a single, cumulative release stream for all users.
@y
Docker Desktop 3.0.0 から安定版（Stable）と最新版（Edge）は、どのユーザーに対しても 1 つの累積的なリリースストリームとして統合されました。
@z

@x
## Support
@y
{: #support }
## サポート
@z

@x
### Does Docker Desktop offer support?
@y
{: #does-docker-desktop-offer-support }
### Does Docker Desktop offer support?
@z

@x
Yes, Docker Desktop offers support for Pro and Team users. For more information, see [Docker Desktop Support](../docker-for-mac/troubleshoot.md#support).
@y
Yes, Docker Desktop offers support for Pro and Team users. For more information, see [Docker Desktop Support](../docker-for-mac/troubleshoot.md#support).
@z

@x
For information about the pricing plans and to upgrade your existing account, see [Docker pricing](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
@y
For information about the pricing plans and to upgrade your existing account, see [Docker pricing](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"}.
@z

@x
### What kind of feedback are you looking for?
@y
{: #what-kind-of-feedback-are-you-looking-for }
### どのような種類のフィードバックを求めていますか
@z

@x
Everything is fair game. We'd like your impressions on the download-install
process, startup, functionality available, the GUI, usefulness of the app,
command line integration, and so on. Tell us about the issues you are experiencing, what you like, or request a new feature through our public [Docker Roadmap](https://github.com/docker/roadmap){: target="_blank" rel="noopener" class="_"}.
@y
種類の如何を問いません。
望んでいるのは皆さんの感じた印象です。
ダウンロードインストール処理、起動、利用可能な機能、GUI、アプリの使いやすさ、コマンドライン統合、などなどです。
発生した問題、好きなもの、[Docker ロードマップ](https://github.com/docker/roadmap){: target="_blank" rel="noopener" class="_"} を通じて公開されている新機能への要望などをお知らせください。
@z

@x
### How is personal data handled in Docker Desktop?
@y
{: #how-is-personal-data-handled-in-docker-desktop }
### 個人データは Docker Desktop においてどのように取り扱われますか
@z

@x
When uploading diagnostics to help Docker with investigating issues, the uploaded diagnostics bundle may contain personal data such as usernames and IP addresses. The diagnostics bundles are only accessible to Docker, Inc.
employees who are directly involved in diagnosing Docker Desktop issues.
@y
Docker が問題を調査できるようにするための診断情報のアップロードにおいては、その診断情報の中に、ユーザー名や IP アドレスのような個人データが含まれる場合があります。
診断情報にアクセスできるのは、Docker Desktop に関する問題の診断に直接関与する Docker 社の社員のみです。
@z

@x
By default Docker, Inc. will delete uploaded diagnostics bundles after 30 days. You may also request the removal of a diagnostics bundle by either specifying the diagnostics ID or via your GitHub ID (if the diagnostics ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the diagnostics bundle to investigate specific user issues, but may derive high-level (non personal) metrics such as the rate of issues from it.
@y
By default Docker, Inc. will delete uploaded diagnostics bundles after 30 days. You may also request the removal of a diagnostics bundle by either specifying the diagnostics ID or via your GitHub ID (if the diagnostics ID is mentioned in a GitHub issue). Docker, Inc. will only use the data in the diagnostics bundle to investigate specific user issues, but may derive high-level (non personal) metrics such as the rate of issues from it.
@z

@x
## Mac FAQs
@y
{: #mac-faqs }
## Mac FAQs
@z

@x
### What is Docker.app?
@y
{: #what-is-dockerapp }
### What is Docker.app?
@z

@x
`Docker.app` is Docker Desktop on Mac. It bundles the Docker client and Docker Engine. `Docker.app` uses the macOS Hypervisor.framework to run containers.
@y
`Docker.app` is Docker Desktop on Mac. It bundles the Docker client and Docker Engine. `Docker.app` uses the macOS Hypervisor.framework to run containers.
@z

@x
### Is Docker Desktop compatible with Apple silicon processors?
@y
{: #is-docker-desktop-compatible-with-apple-silicon-processors }
### Is Docker Desktop compatible with Apple silicon processors?
@z

@x
At the moment, Docker Desktop is compatible with Intel processors only. For more information, see [Apple M1 Tech preview](../docker-for-mac/apple-m1.md).
@y
At the moment, Docker Desktop is compatible with Intel processors only. For more information, see [Apple M1 Tech preview](../docker-for-mac/apple-m1.md).
@z

@x
You can also follow the status of Apple Silicon support in our [Roadmap](https://github.com/docker/roadmap/issues/142){:target="_blank" rel="noopener" class="_"}.
@y
You can also follow the status of Apple Silicon support in our [Roadmap](https://github.com/docker/roadmap/issues/142){:target="_blank" rel="noopener" class="_"}.
@z

@x
### What is HyperKit?
@y
{: #what-is-hyperkit }
### What is HyperKit?
@z

@x
HyperKit is a hypervisor built on top of the Hypervisor.framework in macOS. It runs entirely in userspace and has no other dependencies.
@y
HyperKit is a hypervisor built on top of the Hypervisor.framework in macOS. It runs entirely in userspace and has no other dependencies.
@z

@x
We use HyperKit to eliminate the need for other VM products, such as Oracle
VirtualBox or VMWare Fusion.
@y
We use HyperKit to eliminate the need for other VM products, such as Oracle
VirtualBox or VMWare Fusion.
@z

@x
### What is the benefit of HyperKit?
@y
{: #what-is-the-benefit-of-hyperkit }
### What is the benefit of HyperKit?
@z

@x
HyperKit is thinner than VirtualBox and VMWare fusion, and the version we include is customized for Docker workloads on Mac.
@y
HyperKit is thinner than VirtualBox and VMWare fusion, and the version we include is customized for Docker workloads on Mac.
@z

@x
### Why is com.docker.vmnetd still running after I quit the app?
@y
{: #why-is-comdockervmnetd-still-running-after-i-quit-the-app }
### Why is com.docker.vmnetd still running after I quit the app?
@z

@x
The privileged helper process `com.docker.vmnetd` is started by `launchd` and
runs in the background. The process does not consume any resources unless
Docker.app connects to it, so it's safe to ignore.
@y
The privileged helper process `com.docker.vmnetd` is started by `launchd` and
runs in the background. The process does not consume any resources unless
Docker.app connects to it, so it's safe to ignore.
@z

@x
## Windows FAQs
@y
{: #windows-faqs }
## Windows FAQs
@z

@x
### Can I use VirtualBox alongside Docker Desktop?
@y
{: #can-i-use-virtualbox-alongside-docker-desktop }
### Can I use VirtualBox alongside Docker Desktop?
@z

@x
Yes, you can run VirtualBox along with Docker Desktop if you have enabled the [Windows Hypervisor Platform](https://docs.microsoft.com/en-us/virtualization/api/){: target="_blank" rel="noopener" class="_"} feature on your machine.
@y
Yes, you can run VirtualBox along with Docker Desktop if you have enabled the [Windows Hypervisor Platform](https://docs.microsoft.com/en-us/virtualization/api/){: target="_blank" rel="noopener" class="_"} feature on your machine.
@z

@x
### Why is Windows 10 required?
@y
{: #why-is-windows-10-required }
### Why is Windows 10 required?
@z

@x
Docker Desktop uses the Windows Hyper-V features. While older Windows versions have Hyper-V, their Hyper-V implementations lack features critical for Docker Desktop to work.
@y
Docker Desktop uses the Windows Hyper-V features. While older Windows versions have Hyper-V, their Hyper-V implementations lack features critical for Docker Desktop to work.
@z

@x
### Can I install Docker Desktop on Windows 10 Home?
@y
{: #can-i-install-docker-desktop-on-windows-10-home }
### Can I install Docker Desktop on Windows 10 Home?
@z

@x
If you are running Windows 10 Home (starting with version 1903), you can install [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/){: target="_blank" rel="noopener" class="_"} with the [WSL 2 backend](../docker-for-windows/wsl.md).
@y
If you are running Windows 10 Home (starting with version 1903), you can install [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/){: target="_blank" rel="noopener" class="_"} with the [WSL 2 backend](../docker-for-windows/wsl.md).
@z

@x
### Can I run Docker Desktop on Windows Server?
@y
{: #can-i-run-docker-desktop-on-windows-server }
### Can I run Docker Desktop on Windows Server?
@z

@x
No, running Docker Desktop on Windows Server is not supported.
@y
No, running Docker Desktop on Windows Server is not supported.
@z

@x
### How do I run Windows containers on Windows Server?
@y
{: #how-do-i-run-windows-containers-on-windows-server }
### How do I run Windows containers on Windows Server?
@z

@x
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. For more information, see the tutorial about running Windows containers on Windows Server in
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md){: target="_blank" rel="noopener" class="_"}.
@y
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. For more information, see the tutorial about running Windows containers on Windows Server in
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md){: target="_blank" rel="noopener" class="_"}.
@z

@x
### Why do I see the `Docker Desktop Access Denied` error message when I try to start Docker Desktop?
@y
{: #why-do-i-see-the-docker-desktop-access-denied-error-message-when-i-try-to-start-docker-desktop }
### Why do I see the `Docker Desktop Access Denied` error message when I try to start Docker Desktop?
@z

@x
Docker Desktop displays the **Docker Desktop - Access Denied** error if a Windows user is not part of the **docker-users** group.
@y
Docker Desktop displays the **Docker Desktop - Access Denied** error if a Windows user is not part of the **docker-users** group.
@z

@x
If your admin account is different to your user account, add the **docker-users** group. Run **Computer Management** as an administrator and navigate to **Local Users* and Groups** > **Groups** > **docker-users**.
@y
If your admin account is different to your user account, add the **docker-users** group. Run **Computer Management** as an administrator and navigate to **Local Users* and Groups** > **Groups** > **docker-users**.
@z

@x
Right-click to add the user to the group. Log out and log back in for the changes to take effect.
@y
Right-click to add the user to the group. Log out and log back in for the changes to take effect.
@z

@x
### Why does Docker Desktop fail to start when anti-virus software is installed?
@y
{: #why-does-docker-desktop-fail-to-start-when-anti-virus-software-is-installed }
### Why does Docker Desktop fail to start when anti-virus software is installed?
@z

@x
Some anti-virus software may be incompatible with Hyper-V and Windows 10 builds which impact Docker
Desktop. For more information, see [Docker Desktop fails to start when anti-virus software is installed](../docker-for-windows/troubleshoot.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed).
@y
Some anti-virus software may be incompatible with Hyper-V and Windows 10 builds which impact Docker
Desktop. For more information, see [Docker Desktop fails to start when anti-virus software is installed](../docker-for-windows/troubleshoot.md#docker-desktop-fails-to-start-when-anti-virus-software-is-installed).
@z

@x
### Can I change permissions on shared volumes for container-specific deployment requirements?
@y
{: #can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements }
### Can I change permissions on shared volumes for container-specific deployment requirements?
@z

@x
Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](../docker-for-windows/index.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](http://permissions-calculator.org/decode/0777/){: target="_blank" rel="noopener" class="_"}
(`read`, `write`, `execute` permissions for `user` and for
`group`) which is not configurable.
@y
Docker Desktop does not enable you to control (`chmod`)
the Unix-style permissions on [shared volumes](../docker-for-windows/index.md#file-sharing) for
deployed containers, but rather sets permissions to a default value of
[0777](http://permissions-calculator.org/decode/0777/){: target="_blank" rel="noopener" class="_"}
(`read`, `write`, `execute` permissions for `user` and for
`group`) which is not configurable.
@z

@x
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](../docker-for-windows/troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes).
@y
For workarounds and to learn more, see
[Permissions errors on data directories for shared volumes](../docker-for-windows/troubleshoot.md#permissions-errors-on-data-directories-for-shared-volumes).
@z

@x
### How do symlinks work on Windows?
@y
{: #how-do-symlinks-work-on-windows }
### How do symlinks work on Windows?
@z

@x
Docker Desktop supports two types of symlinks: Windows native symlinks and symlinks created inside a container.
@y
Docker Desktop supports two types of symlinks: Windows native symlinks and symlinks created inside a container.
@z

@x
The Windows native symlinks are visible within the containers as symlinks, whereas symlinks created inside a container are represented as [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks): target="_blank" rel="noopener" class="_"}. These are regular Windows files with a special metadata. Therefore the symlinks created inside a container appear as symlinks inside the container, but not on the host.
@y
The Windows native symlinks are visible within the containers as symlinks, whereas symlinks created inside a container are represented as [mfsymlinks](https://wiki.samba.org/index.php/UNIX_Extensions#Minshall.2BFrench_symlinks){: target="_blank" rel="noopener" class="_"}. These are regular Windows files with a special metadata. Therefore the symlinks created inside a container appear as symlinks inside the container, but not on the host.
@z
