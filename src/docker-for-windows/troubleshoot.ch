%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Troubleshooting, logs, and known issues
keywords: windows, troubleshooting, logs, issues
redirect_from:
- /windows/troubleshoot/
- /docker-for-win/troubleshoot/
title: Logs and troubleshooting
toc_max: 2
---
@y
---
description: Troubleshooting, logs, and known issues
keywords: windows, troubleshooting, logs, issues
redirect_from:
- /windows/troubleshoot/
- /docker-for-win/troubleshoot/
title: ログとトラブルシューティング
toc_max: 2
---
@z

@x
> Did you know that Docker Desktop now offers support for developers subscribed to a Pro or a Team plan? Click [here](#support) to learn more.
@y
> Docker Desktop では、プロプランやチームプランを購入している開発者に向けてのサポートを提供しているのをご存知ですか？
> 詳しくは [こちら](#support) を参照してください。
@z

@x
This page contains information on how to diagnose and troubleshoot Docker Desktop issues, request Docker Desktop support (Pro and Team plan users only), send logs and communicate with the Docker Desktop team, use our forums and Success Center, browse and log issues on GitHub, and find workarounds for known problems.
@y
本ページでは Docker Desktop において問題が発生した際の分析方法や解決方法について示します。
Docker Desktop サポートへの要求を行ったり（プロプランやチームプランのユーザーのみ）、Docker Desktop チームへログ送付してやりとりを行ったり、フォーラムや Success Center を活用したりしてください。
GitHub 上での issue の確認や情報収集を行って、既知の問題であればその回避策を探してください。
@z

@x
## Troubleshoot
@y
{: #troubleshoot }
## トラブルシューティング
@z

@x
Choose ![whale menu](images/whale-x.png){: .inline} > **Troubleshoot**
from the menu bar to see the troubleshoot options.
@y
メニューバーにある ![クジラメニュー](images/whale-x.png){: .inline} > **Troubleshoot** からトラブルシューティングのオプションを確認してください。
@z

@x
![Troubleshoot Docker Desktop](images/troubleshoot.png){:width="600px"}
@y
![Docker Desktop のトラブルシューティング](images/troubleshoot.png){:width="600px"}
@z

@x
The Troubleshoot page contains the following options:
@y
トラブルシューティングページには以下のオプションがあります。
@z

@x
* **Restart Docker Desktop**: Select to restart Docker Desktop.
@y
* **Restart Docker Desktop**（Docker Desktop の再起動）: Docker Desktop を再起動する場合に実行します。
@z

@x
* **Support**:  Developers on Pro and Team plans can use this option to send a support request. Other users can use this option to diagnose any issues in Docker Desktop. For more information, see [Diagnose and feedback](#diagnose-and-feedback) and [Support](#support).
@y
* **Support**（サポート）: プロプランおよびチームプランの開発者は、このオプションを利用してサポートリクエストを送信することができます。
それ以外のユーザーはこのオプションによって Docker Desktop の issue 診断を行うことができます。
詳しくは [診断とフィードバック](#diagnose-and-feedback) あるいは [サポート](#support) を参照してください。
@z

@x
* **Reset Kubernetes cluster**: Select this option to delete all stacks and Kubernetes resources. For more information, see [Kubernetes](index.md#kubernetes).
@y
* **Reset Kubernetes cluster**（Kubernetes クラスターのリセット）: このオプションを選択すると、全スタックや Kubernetes リソースを削除します。
  詳しくは [Kubernetes](index.md#kubernetes) を参照してください。
@z

@x
* **Clean / Purge data**: Select this option to delete container and image data. Choose whether you'd like to delete data from Hyper-V, WSL 2, or Windows Containers and then click **Delete** to confirm.
@y
* **Clean / Purge data**（）: コンテナーとイメージデータを削除するときにこのオプションを実行します。
  削除するデータが Hyper-V、WSL 2、Windows コンテナーのものかどうかを選び、**Delete** をクリックして確認します。
@z

@x
* **Reset to factory defaults**: Choose this option to reset all options on
Docker Desktop to their initial state, the same as when Docker Desktop was first installed.
@y
* **Reset to factory defaults**（インストール時のデフォルトにリセット）: Docker Desktop におけるオプションをすべて初期状態にリセットするときに、このオプションを実行します。
  これにより Docker Desktop はインストール直後の状態と同じになります。
@z

@x
## Diagnose and feedback
@y
{: #diagnose-and-feedback }
## 診断、フィードバック送信
@z

@x
### In-app diagnostics
@y
### アプリ内の診断
@z

@x
If you experience issues for which you do not find solutions in this
documentation, on [Docker Desktop for Windows issues on
GitHub](https://github.com/docker/for-win/issues), or the [Docker Desktop for Windows
forum](https://forums.docker.com/c/docker-for-windows), we can help you
troubleshoot the log data. Before reporting an issue, we recommend that you read the information provided on this page to fix some common known issues.
@y
何か問題が発生したとして、その解決方法が本書ではわからなかったとします。
[GitHub 上の Docker Desktop for Windows に対する issues](https://github.com/docker/for-win/issues) や [Docker Desktop for Windows フォーラム](https://forums.docker.com/c/docker-for-windows) を見ても解決できなかったら、ログデータの解析をお手伝いします。
issue を報告する際には、本ページに示す情報をよく読んで、よく知られている問題に関して確認の上、報告することをお願いします。
@z

@x
1. Choose ![whale menu](images/whale-x.png){: .inline} > **Troubleshoot**
from the menu.
2. Sign into Docker Desktop. In addition, ensure you are signed into your [Docker account](https://hub.docker.com/){:target="_blank" rel="noopener" class="_"}.
3. Click **Get support**. This opens the in-app **Support** page and starts collecting the diagnostics.
@y
1. メニューから ![クジラメニュー](images/whale-x.png){: .inline} > **Troubleshoot** を実行します。
2. Docker Desktop にサインインします。
   さらに [Docker アカウント](https://hub.docker.com/){:target="_blank" rel="noopener" class="_"} にもサインインしていることを確認してください。
3. **Get Support** をクリックします。
   ここからアプリ内の **Support**（サポート）ページが開いて、診断情報の収集が始まります。
@z

@x
    ![Diagnose & Support](images/diagnose-support.png){:width="600px"}
@y
    ![診断とサポート](images/diagnose-support.png){:width="600px"}
@z

@x
4. When the diagnostics collection process is complete, click **Upload to get a Diagnostic ID**.
5. When the diagnostics have been uploaded, Docker Desktop prints a Diagnostic ID. Copy this ID.
6. If you have subscribed to a Pro or a Team plan, click **Contact Support**. This opens the [Docker Desktop support](https://hub.docker.com/support/desktop/){:target="_blank" rel="noopener" class="_"} form. Fill in the information required and add the ID you copied earlier to the Diagnostics ID field. Click **Submit** to request Docker Desktop support.
@y
4. 診断情報の収集処理が終了したら **Upload to get a Diagnostic ID**（アップロードと診断 ID の取得）をクリックします。
5. 診断情報がアップロードされると Docker Desktop は診断 ID（Diagnostic ID）を出力するので、これをコピーします。
6. プロプランまたはチームプランを購入している場合は **Contact support**（サポートへの問い合わせ）をクリックします。
   ここから [Docker Desktop サポート](https://hub.docker.com/support/desktop/){:target="_blank" rel="noopener" class="_"} 画面が開きます。
   必要な情報を入力し、上でコピーした ID を診断 ID 欄に入力します。
   そして **Submit** をクリックして Docker Desktop サポートへ送信します。
@z

@x
   > **Note**
    >
    > You must be signed in to Docker Desktop using your Pro or Team plan credentials to access the support form. For information on what's covered as part of Docker Desktop support, see [Support](#support).
@y
   > **メモ**
    >
    > サポート画面にアクセスするためには、プロプランやチームプランの資格情報を利用して Docker Desktop にサインインしておく必要があります。Docker Desktop サポートに関する情報は [サポート](#support) を参照してください。
@z

@x
7. If you are not subscribed to a Pro or a team plan, you can click **Upgrade to benefit from Docker Support** to upgrade your existing account.
    Alternatively, click **Report a Bug** to open a new Docker Desktop issue on GitHub. This opens Docker Desktop [for Windows](https://github.com/docker/for-win/issues/) on GitHub in your web browser in a 'New issue' template. Complete the information required and ensure you add the diagnostic ID you copied earlier. Click **submit new issue** to create a new issue.
@y
7. プロプランやチームプランを購入していない場合は、**Upgrade to benefit from Docker Support**（アップグレードと Docker サポート取得）をクリックして既存のアカウントをアップグレードしてください。
    こうすることとは別に **Report a Bug**（バグ報告）をクリックして GitHub 上に Docker Desktop の issue を開くこともできます。
    この場合には、ウェブブラウザー上に GitHub の Docker Desktop [for Windows](https://github.com/docker/for-win/issues/) に関する新たな issue のテンプレートが開きます。
    必要な情報を書き入れた上で、上でコピーした診断 ID も忘れずに記入してください。
    **submit new issue** をクリックして新たな issue を登録します。
@z

@x
### Diagnosing from the terminal
@y
{: #diagnosing-from-the-terminal }
### ターミナルからの診断操作
@z

@x
On occasions it is useful to run the diagnostics yourself, for instance if
Docker Desktop for Windows cannot start.
@y
診断処理は、自分で実行した方がよい場合があります。
たとえば Docker Desktop for Windows が起動できないときなどです。
@z

@x
First locate the `com.docker.diagnose`, that should be in `C:\Program
Files\Docker\Docker\resources\com.docker.diagnose.exe`.
@y
まず`com.docker.diagnose`を探し出します。
おそらく`C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe`にあるはずです。
@z

@x
To create *and upload*  diagnostics in Powershell, run:
@y
PowerShell において、以下のように診断情報の生成と **アップロード** を行います。
@z

@x
```powershell
  PS C:\> & "C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe" gather -upload
```
@y
```powershell
  PS C:\> & "C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe" gather -upload
```
@z

@x
After the diagnostics have finished, you should have the following output,
containing your diagnostic ID:
@y
診断処理が終了すると、以下のような出力が得られます。
そこに診断 ID（Diagnostics ID）が示されます。
@z

@x
```sh
Diagnostics Bundle: C:\Users\User\AppData\Local\Temp\CD6CF862-9CBD-4007-9C2F-5FBE0572BBC2\20180720152545.zip
Diagnostics ID:     CD6CF862-9CBD-4007-9C2F-5FBE0572BBC2/20180720152545 (uploaded)
```
@y
```sh
Diagnostics Bundle: C:\Users\User\AppData\Local\Temp\CD6CF862-9CBD-4007-9C2F-5FBE0572BBC2\20180720152545.zip
Diagnostics ID:     CD6CF862-9CBD-4007-9C2F-5FBE0572BBC2/20180720152545 (uploaded)
```
@z

@x
## Troubleshooting topics
@y
{: #troubleshooting-topics }
## トラブルシューティングのトピック
@z

@x
### Make sure certificates are set up correctly
@y
{: #make-sure-certificates-are-set-up-correctly }
### 証明書の適切な設定確認
@z

@x
Docker Desktop ignores certificates listed under insecure registries, and
does not send client certificates to them. Commands like `docker run` that
attempt to pull from the registry produces error messages on the command line,
like this:
@y
Docker Desktop では安全でないレジストリの証明書は無視します。
そういったレジストリに対しては、クライアント証明書を送信しません。
そのような場合、`docker run`のようなコマンドを使ってレジストリからプルを行おうとしても、コマンドライン上には以下のようなエラーメッセージが表示されます。
@z

@x
```
Error response from daemon: Get http://192.168.203.139:5858/v2/: malformed HTTP response "\x15\x03\x01\x00\x02\x02"
```
@y
```
Error response from daemon: Get http://192.168.203.139:5858/v2/: malformed HTTP response "\x15\x03\x01\x00\x02\x02"
```
@z

@x
As well as on the registry. For example:
@y
レジストリ側においても同じようにエラーになっています。
@z

@x
```
2017/06/20 18:15:30 http: TLS handshake error from 192.168.203.139:52882: tls: client didn't provide a certificate
2017/06/20 18:15:30 http: TLS handshake error from 192.168.203.139:52883: tls: first record does not look like a TLS handshake
```
@y
```
2017/06/20 18:15:30 http: TLS handshake error from 192.168.203.139:52882: tls: client didn't provide a certificate
2017/06/20 18:15:30 http: TLS handshake error from 192.168.203.139:52883: tls: first record does not look like a TLS handshake
```
@z

@x
For more about using client and server side certificates, see
[How do I add custom CA certificates?](index.md#how-do-i-add-custom-ca-certificates)
and [How do I add client certificates?](index.md#how-do-i-add-client-certificates) in the
Getting Started topic.
@y
クライアントやサーバーそれぞれの証明書の利用に関しては、導入ガイドのトピック、[どうやって独自の CA 証明書を追加するか](index.md#how-do-i-add-custom-ca-certificates) や [どうやってクライアント証明書を追加するか](index.md#how-do-i-add-client-certificates) を参照してください。
@z

@x
### Volumes
@y
{: #volumes }
### ボリューム
@z

@x
#### Permissions errors on data directories for shared volumes
@y
{: #permissions-errors-on-data-directories-for-shared-volumes }
#### 共有ボリューム上のデータディレクトリに対するパーミッションエラー
@z

@x
When sharing files from Windows, Docker Desktop sets permissions on [shared volumes](index.md#file-sharing)
to a default value of [0777](http://permissions-calculator.org/decode/0777/)
(`read`, `write`, `execute` permissions for `user` and for `group`).
@y
Windows からファイル共有を行う際、Docker Desktop は [共有ボリューム](index.md#file-sharing) に対して、デフォルトとして [0777](http://permissions-calculator.org/decode/0777/)（`user`と`group`に対して`read`、`write`、`execute`）のパーミッションを設定します。
@z

@x
The default permissions on shared volumes are not configurable. If you are
working with applications that require permissions different from the shared
volume defaults at container runtime, you need to either use non-host-mounted
volumes or find a way to make the applications work with the default file
permissions.
@y
共有ボリュームにおけるこのデフォルトのパーミッションは、設定変更することができません。
共有ボリュームのデフォルト設定とは異なるパーミッションを必要とするアプリケーションを稼動させている場合は、ホストにマウントされていないボリュームを利用するか、デフォルトのパーミッションでも動作するようにアプリケーションの変更を行うしかありません。
@z

@x
See also,
[Can I change permissions on shared volumes for container-specific deployment requirements?](../desktop/faqs.md#can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements)
in the FAQs.
@y
FAQ にある [コンテナー固有のデプロイ要件に従って共有ボリュームのパーミッションは変更できますか？](../desktop/faqs.md#can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements) も参考にしてください。
@z

@x
#### Volume mounting requires shared folders for Linux containers
@y
{: #volume-mounting-requires-shared-folders-for-linux-containers }
#### ボリュームマウントには Linux コンテナーに対する共有フォルダーが必要
@z

@x
If you are using mounted volumes and get runtime errors indicating an
application file is not found, access is denied to a volume mount, or a service
cannot start, such as when using [Docker Compose](../compose/gettingstarted.md),
you might need to enable [shared folders](index.md#file-sharing).
@y
ボリュームのマウントを利用しているときに、実行時エラーが発生したとします。
たとえば [Docker Compose](../compose/gettingstarted.md) 利用時において、アプリケーションがファイルを見つけられない、ボリュームマウントに対してのアクセスが拒否される、サービスが起動しない、といったものです。
この場合は [共有フォルダー](index.md#file-sharing) を有効にすることが必要かもしれません。
@z

@x
With the Hyper-V backend, mounting files from Windows requires shared folders for Linux containers. Click ![whale menu](images/whale-x.png){: .inline}
 and then **Settings** > **Shared Folders** and share the folder that contains the
Dockerfile and volume.
@y
Hyper-V バックエンドを利用して Windows からファイルをマウントする場合には、Linux コンテナーに対しての共有フォルダーが必要になります。
![クジラメニュー](images/whale-x.png){: .inline} をクリックして **Settings** > **Shared Folders** を実行し、Dockerfile やボリュームを含むフォルダーを共有してください。
@z

@x
#### Support for symlinks
@y
{: #support-for-symlinks }
#### シンボリックリンクのサポート
@z

@x
Symlinks work within and across containers. To learn more, see [How do symlinks work on Windows?](../desktop/faqs.md#how-do-symlinks-work-on-windows) in the FAQs.
@y
コンテナー内やコンテナー間ではシンボリックリンクが活用できます。
詳しくは FAQ 内にある [Windows においてシンボリックリンクはどうやって動作するのか？](../desktop/faqs.md#how-do-symlinks-work-on-windows) を参照してください。
@z

@x
#### Avoid unexpected syntax errors, use Unix style line endings for files in containers
@y
{: #avoid-unexpected-syntax-errors-use-unix-style-line-endings-for-files-in-containers }
#### 予期しない文法エラー回避のためコンテナー向けファイルの改行文字を Unix 風に
@z

@x
Any file destined to run inside a container must use Unix style `\n` line
endings. This includes files referenced at the command line for builds and in
RUN commands in Docker files.
@y
コンテナー内での動作に利用するファイルは、改行文字を Unix スタイルの `\n` にする必要があります。
これを行うべきファイルとして、ビルド時にコマンドラインから参照されるファイルや、Dockerfile 内の RUN コマンドにおいて参照されるファイルなどがあります。
@z

@x
Docker containers and `docker build` run in a Unix environment, so files in
containers must use Unix style line endings: `\n`, _not_ Windows style: `\r\n`.
Keep this in mind when authoring files such as shell scripts using Windows
tools, where the default is likely to be Windows style line endings. These
commands ultimately get passed to Unix commands inside a Unix based container
(for example, a shell script passed to `/bin/sh`). If Windows style line endings
are used, `docker run` fails with syntax errors.
@y
Docker コンテナーや`docker build`コマンドは Unix 環境において動作しています。
したがってコンテナー内のファイルは Unix 風に行末を`\n`にする必要があります。
Windows スタイルの`\r\n`としてはなりません。
ファイルを生成する際には十分に注意しておくことが必要です。
シェルスクリプトなどを生成するにあたって Windows ツールを使っていると、デフォルトで行末が Windows スタイルになってしまうことがあります。
そのようにして記述されたコマンドは、Unix ベースのコンテナー内において、最終的には Unix コマンドに受け渡されます。
（たとえばシェルスクリプトが`/bin/sh`に受け渡されます。）
その際に Windows スタイルの改行文字を利用していると、`docker run`では文法エラーが発生します。
@z

@x
For an example of this issue and the resolution, see this issue on GitHub:
[Docker RUN fails to execute shell
script](https://github.com/moby/moby/issues/24388).
@y
この問題の利用例とその解決については、GitHub issue にある [Docker RUN fails to execute shell script](https://github.com/moby/moby/issues/24388) を参照してください。
@z

@x
### Virtualization
@y
{: #virtualization }
### 仮想化機能
@z

@x
Your machine must have the following features for Docker Desktop to function correctly.
@y
Docker Desktop を正しく機能させるためには、マシンには以下の機能がなければなりません。
@z

@x
#### WSL 2 and Windows Home
@y
#### WSL 2 と Windows Home
@z

@x
1. Virtual Machine Platform
2. [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10){:target="_blank" rel="noopener" class="_"}
3. Virtualization enabled in the BIOS
4. Hypervisor enabled at Windows startup
@y
1. 仮想マシンプラットフォーム。
2. [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10){:target="_blank" rel="noopener" class="_"}。
3. BIOS 内での仮想技術有効化。
4. Windows 起動時のハイパーバイザー有効化。
@z

@x
#### Hyper-V
@y
#### Hyper-V
@z

@x
On Windows 10 Pro or Enterprise, you can also use Hyper-V with the following features enabled:
@y
Windows 10 Pro または Enterprise の場合は、以下の機能を有効にした上で Hyper-V を利用することもできます。
@z

@x
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview){:target="_blank" rel="noopener" class="_"}
   installed and working
@y
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview){:target="_blank" rel="noopener" class="_"} がインストールされ動作していること。
@z

@x
2. Virtualization enabled in the BIOS
@y
2. BIOS 設定において仮想化機能（virtualization）が有効に設定されていること。
@z

@x
3. Hypervisor enabled at Windows startup
@y
3. Windows 起動時にハイパーバイザーが有効であること。
@z

@x
![Hyper-V on Windows features](images/hyperv-enabled.png){:width="600px"}
@y
![Windows の Hyper-V 機能](images/hyperv-enabled.png){:width="600px"}
@z

@x
Docker Desktop requires Hyper-V as well as the Hyper-V Module for Windows
Powershell to be installed and enabled. The Docker Desktop installer enables
it for you.
@y
Docker Desktop では Hyper-V が必要です。
また Windows Powershell における Hyper-V モジュールがインストールされ有効であることも必要です。
Docker Desktop のインストーラーの操作時に、これらが有効になります。
@z

@x
Docker Desktop also needs two CPU hardware features to use Hyper-V: Virtualization and Second Level Address Translation (SLAT), which is also called Rapid Virtualization Indexing (RVI). On some systems, Virtualization must be enabled in the BIOS. The steps required are vendor-specific, but typically the BIOS option is called `Virtualization Technology (VTx)` or something similar. Run the command `systeminfo` to check all required Hyper-V features. See [Pre-requisites for Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements) for more details.
@y
Docker Desktop ではさらに、Hyper-V を利用するため、2 つの CPU ハードウェア機能も必要です。
仮想化機能（virtualization）と第 2 レベルアドレス変換機能（Second Level Address Translation; SLAT）です。
後者は RVI（Rapid Virtualization Indexing）とも呼ばれます。
システムによっては、仮想化機能は BIOS から設定しなければならないものがあります。
その設定手順はベンダー固有のものになります。
ただし通常、BIOS の設定オプションは`仮想化技術`（Virtualization Technology; VTx）やこれに似た用語で示されています。
`systeminfo`コマンドを実行して、必要となる Hyper-V 機能を確認してください。
詳しくは [Pre-requisites for Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements)（Windows 10 における Hyper-V の前提条件）を参照してください。
@z

@x
To install Hyper-V manually, see [Install Hyper-V on Windows 10](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install). A reboot is *required* after installation. If you install Hyper-V without rebooting, Docker Desktop does not work correctly.
@y
Hyper-V を手動でインストールする場合は [Install Hyper-V on Windows 10](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install)（Windows 10 における Hyper-V のインストール）を参照してください。
インストール後には再起動が **必要です**。
Hyper-V のインストール後に再起動を行わないままでいると、Docker Desktop は正常に動作しません。
@z

@x
From the start menu, type **Turn Windows features on or off** and press enter.
In the subsequent screen, verify that Hyper-V is enabled.
@y
スタートメニューから **Turn Windows features on or off** と入力して ENTER キーを押してください。
表示される画面から Hyper-V が有効であることを確認してください。
@z

@x
#### Virtualization must be enabled
@y
{: #virtualization-must-be-enabled }
#### 仮想化技術の有効化
@z

@x
In addition to [Hyper-V](#hyper-v) or [WSL 2](wsl.md), virtualization must be enabled. Check the
Performance tab on the Task Manager:
@y
[Hyper-V](#hyper-v) や [WSL 2](wsl.md) とともに、仮想化技術も有効でなければなりません。
タスクマネージャーのパフォーマンスタブを確認してください。
@z

@x
![Task Manager](images/virtualization-enabled.png){:width="700px"}
@y
![タスクマネージャー](images/virtualization-enabled.png){:width="700px"}
@z

@x
If you manually uninstall Hyper-V, WSL 2 or disable virtualization,
Docker Desktop cannot start. See [Unable to run Docker for Windows on
Windows 10 Enterprise](https://github.com/docker/for-win/issues/74).
@y
Hyper-V や WSL 2 を手動でアンインストールしたり、仮想化機能を無効にしていたりすると、Docker Desktop は起動しません。
[Unable to run Docker for Windows on Windows 10 Enterprise](https://github.com/docker/for-win/issues/74)（Windows 10 エンタープライズにおいて Docker for Windows が起動しない）を参照してください。
@z

@x
#### Hypervisor enabled at Windows startup
@y
{: #hypervisor-enabled-at-windows-startup }
#### Windows 起動時のハイパーバイザーの有効化
@z

@x
If you have completed the steps described above and are still experiencing
Docker Desktop startup issues, this could be because the Hypervisor is installed,
but not launched during Windows startup. Some tools (such as older versions of 
Virtual Box) and video game installers disable hypervisor on boot. To reenable it:
@y
ここまで説明している手順に従っているにも関わらず、Docker Desktop の起動に問題がある場合は、ハイパーバイザーがインストールされているものの、Windows 起動時にそれが起動されていないのかもしれません。
所定のツール（Virtual Box の旧バージョンなど）やビデオゲームのインストーラーの中には、ハイパーバイザーを起動時に無効化してしまうものがあります。
もう一度有効化するためには以下を行います。
@z

@x
1. Open an administrative console prompt.
2. Run `bcdedit /set hypervisorlaunchtype auto`.
3. Restart Windows.
@y
1. 管理コンソールプロンプトを開きます。
2. `bcdedit /set hypervisorlaunchtype auto`を実行します。
3. Windows を再起動します。
@z

@x
You can also refer to the [Microsoft TechNet article](https://social.technet.microsoft.com/Forums/en-US/ee5b1d6b-09e2-49f3-a52c-820aafc316f9/hyperv-doesnt-work-after-upgrade-to-windows-10-1809?forum=win10itprovirt){:target="_blank" rel="noopener" class="_"} on Code flow guard (CFG) settings.
@y
コードフローガード（Code flow guard; CFG）の設定に関しては [Microsoft TechNet article](https://social.technet.microsoft.com/Forums/en-US/ee5b1d6b-09e2-49f3-a52c-820aafc316f9/hyperv-doesnt-work-after-upgrade-to-windows-10-1809?forum=win10itprovirt){:target="_blank" rel="noopener" class="_"} も参照してください。
@z

@x
### Windows containers and Windows Server
@y
{: #windows-containers-and-windows-server }
### Windows コンテナーと Windows Server
@z

@x
Docker Desktop is not supported on Windows Server. If you have questions about how to run Windows containers on Windows 10, see
[Switch between Windows and Linux containers](index.md#switch-between-windows-and-linux-containers).
@y
Docker Desktop は Windows Server をサポートしていません。
Windows 10 上における Windows コンテナーの起動方法がわからない場合は、[Windows と Linux の各コンテナー間の切り替え](index.md#switch-between-windows-and-linux-containers) を参照してください。
@z

@x
A full tutorial is available in [docker/labs](https://github.com/docker/labs) on
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md).
@y
[docker/labs](https://github.com/docker/labs) にある [Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)（Windows コンテナーをはじめよう）では、充実したチュートリアルが示されています。
@z

@x
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. However, if you install Docker this way, you cannot develop or run Linux containers. If you try to run a Linux container on the native Docker daemon, an error occurs:
@y
Windows のネイティブなバイナリをインストールすることもできます。
これを使うと Docker Desktop を用いずに、Windows コンテナーの開発と起動が可能になります。
ただしこれを使って Docker をインストールした場合、Linux コンテナーの開発と起動ができなくなります。
Windows にネイティブな Docker デーモン上において Linux コンテナーを起動すると、以下のようなエラーが発生します。
@z

@x
```none
C:\Program Files\Docker\docker.exe:
 image operating system "linux" cannot be used on this platform.
 See 'C:\Program Files\Docker\docker.exe run --help'.
```
@y
```none
C:\Program Files\Docker\docker.exe:
 image operating system "linux" cannot be used on this platform.
 See 'C:\Program Files\Docker\docker.exe run --help'.
```
@z

@x
### Running Docker Desktop in nested virtualization scenarios
@y
{: #running-docker-desktop-in-nested-virtualization-scenarios }
### ネストした仮想環境での Docker Desktop 実行
@z

@x
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or VMware Fusion on a Mac provided that the VM is properly configured. However, problems and intermittent failures may still occur due to the way these apps virtualize the hardware. For these reasons, _**Docker Desktop is not supported in nested virtualization scenarios**_. It might work
in some cases, and not in others.
@y
Docker Desktop は VM 環境内でも動作します。
たとえば Mac 上の Parallels や VMware Fusion といったアプリ内に、Windows 10 の VM 環境を構築して、適切な設定を行えばそこで Docker Desktop を動作させることができます。
ただしそういったアプリによるハードウェア仮想化の方式が原因で、支障が出たり断続的な障害が引き起こされる場合があります。
こういった理由から、**Docker Desktop ではネスト化された仮想環境をサポートしません**。
動く場合もあれば動かない場合もあるという状況です。
@z

@x
For best results, we recommend you run Docker Desktop natively on a Windows system (to work with Windows or Linux containers), or on Mac to work with Linux containers.
@y
最適な答えは、ネイティブな Docker Desktop を動作させることです。
Docker Desktop on Windows であれば Windows コンテナーと Linux コンテナーを利用できます。
あるい Docker Desktop on Mac であれば Linux コンテナーを利用できます。
@z

@x
#### If you still want to use nested virtualization
@y
{: #if-you-still-want-to-use-nested-virtualization }
#### それでもネスト化仮想環境を利用したい場合
@z

@x
* Make sure nested virtualization support is enabled in VMWare or Parallels.
  Check the settings in **Hardware > CPU & Memory > Advanced Options > Enable
  nested virtualization** (the exact menu sequence might vary slightly).
@y
* Make sure nested virtualization support is enabled in VMWare or Parallels.
  Check the settings in **Hardware > CPU & Memory > Advanced Options > Enable
  nested virtualization** (the exact menu sequence might vary slightly).
@z

@x
* Configure your VM with at least 2 CPUs and sufficient memory to run your
  workloads.
@y
* Configure your VM with at least 2 CPUs and sufficient memory to run your
  workloads.
@z

@x
* Make sure your system is more or less idle.
@y
* システムに多少でも余裕があることを確認します。
@z

@x
* Make sure your Windows OS is up-to-date. There have been several issues with
  some insider builds.
@y
* Windows OS が最新であることを確認します。
  インサイダービルド（Insider Build）では問題が発生する場合があります。
@z

@x
* The processor you have may also be relevant. For example, Westmere based Mac
  Pros have some additional hardware virtualization features over Nehalem based
  Mac Pros and so do newer generations of Intel processors.
@y
* 利用するプロセッサーも重要かもしれません。
  たとえば Westmere ベースの Mac Pro には Nehalem ベースの Mac Pro に比べて、ハードウェア仮想機能が追加されています。
  したがって、より最新に近い世代のインテルプロセッサーを利用してください。
@z

@x
#### Typical failures we see with nested virtualization
@y
{: #typical-failures-we-see-with-nested-virtualization }
#### Typical failures we see with nested virtualization
@z

@x
* Slow boot time of the Linux VM. If you look in the logs and find some entries
  prefixed with `Moby`. On real hardware, it takes 5-10 seconds to boot the
  Linux VM; roughly the time between the `Connected` log entry and the `*
  Starting Docker ... [ ok ]` log entry. If you boot the Linux VM inside a
  Windows VM, this may take considerably longer. We have a timeout of 60s or so.
  If the VM hasn't started by that time, we retry. If the retry fails we print
  an error. You can sometimes work around this by providing more resources to
  the Windows VM.
@y
* Slow boot time of the Linux VM. If you look in the logs and find some entries
  prefixed with `Moby`. On real hardware, it takes 5-10 seconds to boot the
  Linux VM; roughly the time between the `Connected` log entry and the `*
  Starting Docker ... [ ok ]` log entry. If you boot the Linux VM inside a
  Windows VM, this may take considerably longer. We have a timeout of 60s or so.
  If the VM hasn't started by that time, we retry. If the retry fails we print
  an error. You can sometimes work around this by providing more resources to
  the Windows VM.
@z

@x
* Sometimes the VM fails to boot when Linux tries to calibrate the time stamp
  counter (TSC). This process is quite timing sensitive and may fail when
  executed inside a VM which itself runs inside a VM. CPU utilization is also
  likely to be higher.
@y
* Sometimes the VM fails to boot when Linux tries to calibrate the time stamp
  counter (TSC). This process is quite timing sensitive and may fail when
  executed inside a VM which itself runs inside a VM. CPU utilization is also
  likely to be higher.
@z

@x
* Ensure "PMU Virtualization" is turned off in Parallels on Macs. Check the
  settings in **Hardware > CPU & Memory > Advanced Settings > PMU
  Virtualization**.
@y
* Ensure "PMU Virtualization" is turned off in Parallels on Macs. Check the
  settings in **Hardware > CPU & Memory > Advanced Settings > PMU
  Virtualization**.
@z

@x
### Networking issues
@y
{: #networking-issues }
### ネットワークの問題
@z

@x
IPv6 is not (yet) supported on Docker Desktop.
@y
Docker Desktop では IPv6 は（まだ）サポートされていません。
@z

@x
## Workarounds
@y
{: #workarounds }
## 回避策
@z

@x
### Reboot
@y
{: #reboot }
### 再起動
@z

@x
Restart your PC to stop / discard any vestige of the daemon running from the
previously installed version.
@y
Restart your PC to stop / discard any vestige of the daemon running from the
previously installed version.
@z

@x
### Unset `DOCKER_HOST`
@y
### 変数`DOCKER_HOST`の設定解除
@z

@x
The `DOCKER_HOST` environmental variable does not need to be set.  If you use
bash, use the command `unset ${!DOCKER_*}` to unset it.  For other shells,
consult the shell's documentation.
@y
The `DOCKER_HOST` environmental variable does not need to be set.  If you use
bash, use the command `unset ${!DOCKER_*}` to unset it.  For other shells,
consult the shell's documentation.
@z

@x
### Make sure Docker is running for webserver examples
@y
{: #make-sure-docker-is-running-for-webserver-examples }
### Make sure Docker is running for webserver examples
@z

@x
For the `hello-world-nginx` example and others, Docker Desktop must be
running to get to the webserver on `http://localhost/`. Make sure that the
Docker whale is showing in the menu bar, and that you run the Docker commands in
a shell that is connected to the Docker Desktop Engine. Otherwise, you might start the webserver container but get a "web page
not available" error when you go to `docker`.
@y
For the `hello-world-nginx` example and others, Docker Desktop must be
running to get to the webserver on `http://localhost/`. Make sure that the
Docker whale is showing in the menu bar, and that you run the Docker commands in
a shell that is connected to the Docker Desktop Engine. Otherwise, you might start the webserver container but get a "web page
not available" error when you go to `docker`.
@z

@x
### How to solve `port already allocated` errors
@y
### How to solve `port already allocated` errors
@z

@x
If you see errors like `Bind for 0.0.0.0:8080 failed: port is already allocated`
or `listen tcp:0.0.0.0:8080: bind: address is already in use` ...
@y
If you see errors like `Bind for 0.0.0.0:8080 failed: port is already allocated`
or `listen tcp:0.0.0.0:8080: bind: address is already in use` ...
@z

@x
These errors are often caused by some other software on Windows using those
ports. To discover the identity of this software, either use the `resmon.exe`
GUI and click "Network" and then "Listening Ports" or in a Powershell use
`netstat -aon | find /i "listening "` to discover the PID of the process
currently using the port (the PID is the number in the rightmost column). Decide
whether to shut the other process down, or to use a different port in your
docker app.
@y
These errors are often caused by some other software on Windows using those
ports. To discover the identity of this software, either use the `resmon.exe`
GUI and click "Network" and then "Listening Ports" or in a Powershell use
`netstat -aon | find /i "listening "` to discover the PID of the process
currently using the port (the PID is the number in the rightmost column). Decide
whether to shut the other process down, or to use a different port in your
docker app.
@z

@x
### Docker Desktop fails to start when anti-virus software is installed
@y
{: #docker-desktop-fails-to-start-when-anti-virus-software-is-installed }
### アンチウィルスソフトのインストール時における Docker Desktop 起動の失敗
@z

@x
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
@y
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
@z

@x
For a temporary workaround, uninstall the anti-virus software, or
explore other workarounds suggested on Docker Desktop forums.
@y
For a temporary workaround, uninstall the anti-virus software, or
explore other workarounds suggested on Docker Desktop forums.
@z

@x
## Support
@y
## Support
@z

@x
Docker Desktop offers support for developers subscribed to a Pro or a Team plan. Click [here](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} to upgrade your existing account.
@y
Docker Desktop offers support for developers subscribed to a Pro or a Team plan. Click [here](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} to upgrade your existing account.
@z

@x
This section contains instructions on how to get support, and covers the scope of Docker Desktop support.
@y
This section contains instructions on how to get support, and covers the scope of Docker Desktop support.
@z

@x
### How do I get Docker Desktop support?
@y
### How do I get Docker Desktop support?
@z

@x
If you have subscribed to a Pro and Team account, please raise a ticket through [Docker Desktop support](https://hub.docker.com/support/desktop/){:target="_blank" rel="noopener" class="_"}.
@y
If you have subscribed to a Pro and Team account, please raise a ticket through [Docker Desktop support](https://hub.docker.com/support/desktop/){:target="_blank" rel="noopener" class="_"}.
@z

@x
Docker Community users can get support through our Github repos for-win and for-mac, where we respond on a best-effort basis.
@y
Docker Community users can get support through our Github repos for-win and for-mac, where we respond on a best-effort basis.
@z

@x
### What support can I get?
@y
### What support can I get?
@z

@x
If you are a Pro or a Team user, you can request for support on the following types of issues:
@y
If you are a Pro or a Team user, you can request for support on the following types of issues:
@z

@x
* Desktop upgrade issues
* Desktop installation issues
  * Enabling virtualization in BIOS
  * Enabling Windows features
  * Installation crashes
  * Failure to launch Docker Desktop on first run
* Usage issues
  * Crash closing software
  * Docker Desktop not behaving as expected
* Configuration issues
* Basic product ‘how to’ questions such as ‘how to work efficiently on WSL 2’
@y
* Desktop upgrade issues
* Desktop installation issues
  * Enabling virtualization in BIOS
  * Enabling Windows features
  * Installation crashes
  * Failure to launch Docker Desktop on first run
* Usage issues
  * Crash closing software
  * Docker Desktop not behaving as expected
* Configuration issues
* Basic product ‘how to’ questions such as ‘how to work efficiently on WSL 2’
@z

@x
### What is not supported?
@y
### What is not supported?
@z

@x
Docker Desktop excludes support for the following types of issues:
@y
Docker Desktop excludes support for the following types of issues:
@z

@x
* Use on or in conjunction with hardware or software other than that specified in the applicable documentation
* Running on unsupported operating systems, including beta/preview versions of operating systems
* Support for the Docker engine, Docker CLI, or other bundled Linux components
* Support for Kubernetes
* Features labeled as experimental
* System/Server administration activities
* Supporting Desktop as a production runtime
* Scale deployment/multi-machine installation of Desktop
* Routine product maintenance (data backup, cleaning disk space and configuring log rotation)
* Third-party applications not provided by Docker
* Altered or modified Docker software
* Defects in the Docker software due to hardware malfunction, abuse, or improper use
* Any version of the Docker software other than the latest version
* Reimbursing and expenses spent for third-party services not provided by Docker
* Docker Support excludes training, customization, and integration
@y
* Use on or in conjunction with hardware or software other than that specified in the applicable documentation
* Running on unsupported operating systems, including beta/preview versions of operating systems
* Support for the Docker engine, Docker CLI, or other bundled Linux components
* Support for Kubernetes
* Features labeled as experimental
* System/Server administration activities
* Supporting Desktop as a production runtime
* Scale deployment/multi-machine installation of Desktop
* Routine product maintenance (data backup, cleaning disk space and configuring log rotation)
* Third-party applications not provided by Docker
* Altered or modified Docker software
* Defects in the Docker software due to hardware malfunction, abuse, or improper use
* Any version of the Docker software other than the latest version
* Reimbursing and expenses spent for third-party services not provided by Docker
* Docker Support excludes training, customization, and integration
@z

@x
### What versions are supported?
@y
### What versions are supported?
@z

@x
We currently only offer support for the latest version of Docker Desktop. If you are running an older version, you may be asked to upgrade before we investigate your support request.
@y
We currently only offer support for the latest version of Docker Desktop. If you are running an older version, you may be asked to upgrade before we investigate your support request.
@z

@x
### How many machines can I get support for Docker Desktop on?
@y
### How many machines can I get support for Docker Desktop on?
@z

@x
As a Pro user you can get support for Docker Desktop on a single machine.
As a Team, you can get support for Docker Desktop for the number of machines equal to the number of seats as part of your plan.
@y
As a Pro user you can get support for Docker Desktop on a single machine.
As a Team, you can get support for Docker Desktop for the number of machines equal to the number of seats as part of your plan.
@z

@x
### What OS’s are supported?
@y
### What OS’s are supported?
@z

@x
Docker Desktop is available for Mac and Windows. The supported version information can be found on the following pages:
@y
Docker Desktop is available for Mac and Windows. The supported version information can be found on the following pages:
@z

@x
* [Windows system requirements](../docker-for-windows/install.md#system-requirements)
* [Mac system requirements](../docker-for-mac/install.md#system-requirements)
@y
* [Windows system requirements](../docker-for-windows/install.md#system-requirements)
* [Mac system requirements](../docker-for-mac/install.md#system-requirements)
@z

@x
### Can I run Docker Desktop on Virtualized hardware?
@y
### Can I run Docker Desktop on Virtualized hardware?
@z

@x
No, currently this is unsupported and against the terms of use.
@y
No, currently this is unsupported and against the terms of use.
@z
