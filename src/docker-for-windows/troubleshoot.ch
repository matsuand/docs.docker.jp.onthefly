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
---
@y
---
description: Troubleshooting, logs, and known issues
keywords: windows, troubleshooting, logs, issues
redirect_from:
- /windows/troubleshoot/
- /docker-for-win/troubleshoot/
title: ログとトラブルシューティング
---
@z

@x
This page contains information on how to diagnose and troubleshoot problems, send logs and communicate with the Docker Desktop team, use our forums and Knowledge Hub, browse and log issues on GitHub, and find workarounds for known problems.
@y
{% comment %}
This page contains information on how to diagnose and troubleshoot problems, send logs and communicate with the Docker Desktop team, use our forums and Knowledge Hub, browse and log issues on GitHub, and find workarounds for known problems.
{% endcomment %}
本ページでは、問題が発生した際の分析方法や解決方法について示します。
Docker Desktop チームへログ送付してやりとりを行ったり、フォーラムや Knowledge Hub を活用したりしてください。
GitHub 上での issue の確認や情報収集を行って、既知の問題であればその回避策を探してください。
@z

@x
## Troubleshoot
@y
{% comment %}
## Troubleshoot
{% endcomment %}
{: #troubleshoot }
## トラブルシューティング
@z

@x
Choose ![whale menu](images/whale-x.png){: .inline} > **Troubleshoot**
from the menu bar to see the troubleshoot options.
@y
{% comment %}
Choose ![whale menu](images/whale-x.png){: .inline} > **Troubleshoot**
from the menu bar to see the troubleshoot options.
{% endcomment %}
メニューバーにある ![クジラメニュー](images/whale-x.png){: .inline} > **Troubleshoot** からトラブルシューティングのオプションを確認してください。
@z

@x
![Uninstall or reset Docker](images/troubleshoot.png){:width="750px"}
@y
{% comment %}
![Uninstall or reset Docker](images/troubleshoot.png){:width="750px"}
{% endcomment %}
![Docker のアンインストールやリセット](images/troubleshoot.png){:width="750px"}
@z

@x
The Troubleshoot page contains the following options:
@y
{% comment %}
The Troubleshoot page contains the following options:
{% endcomment %}
トラブルシューティングページには、以下のオプションがあります。
@z

@x
* **Restart Docker Desktop**: Select to restart Docker Desktop.
@y
{% comment %}
* **Restart Docker Desktop**: Select to restart Docker Desktop.
{% endcomment %}
* **Restart Docker Desktop**（Docker Desktop の再起動）: Docker Desktop を再起動する場合に実行します。
@z

@x
* **Run Diagnostics**: Select this option to diagnose any issues on Docker Desktop. For detailed information about diagnostics, see [Diagnose problems, send feedback, and create GitHub issues](#diagnose-problems-send-feedback-and-create-github-issues).
@y
{% comment %}
* **Run Diagnostics**: Select this option to diagnose any issues on Docker Desktop. For detailed information about diagnostics, see [Diagnose problems, send feedback, and create GitHub issues](#diagnose-problems-send-feedback-and-create-github-issues).
{% endcomment %}
* **Run Diagnostics**（診断処理の開始）: Docker Desktop 上に何か問題があるかどうかを診断するときにこのオプションを実行します。
  診断処理に関する詳細は [診断、フィードバック送信、GitHub の issue 生成](#diagnose-problems-send-feedback-and-create-github-issues) を参照してください。
@z

@x
* **Clean / Purge data**: Select this option to delete container and image data. Choose whether you'd like to delete data from Hyper-V, WSL 2, or Windows Containers and then click **Delete** to confirm.
@y
{% comment %}
* **Clean / Purge data**: Select this option to delete container and image data. Choose whether you'd like to delete data from Hyper-V, WSL 2, or Windows Containers and then click **Delete** to confirm.
{% endcomment %}
* **Clean / Purge data**（）: コンテナーとイメージデータを削除するときにこのオプションを実行します。
  削除するデータが Hyper-V、WSL 2、Windows コンテナーのものかどうかを選び、**Delete** をクリックして確認します。
@z

@x
* **Reset Kubernetes cluster**: Select this option to delete all stacks and Kubernetes resources. For more information, see [Kubernetes](index.md#kubernetes).
@y
{% comment %}
* **Reset Kubernetes cluster**: Select this option to delete all stacks and Kubernetes resources. For more information, see [Kubernetes](index.md#kubernetes).
{% endcomment %}
* **Reset Kubernetes cluster**（Kubernetes クラスターのリセット）: Select this option to delete all stacks and Kubernetes resources. 
  詳しくは [Kubernetes](index.md#kubernetes) を参照してください。
@z

@x
* **Reset to factory defaults**: Choose this option to reset all options on
Docker Desktop to their initial state, the same as when Docker Desktop was first installed.
@y
{% comment %}
* **Reset to factory defaults**: Choose this option to reset all options on
Docker Desktop to their initial state, the same as when Docker Desktop was first installed.
{% endcomment %}
* **Reset to factory defaults**（インストール時のデフォルトにリセット）: Docker Desktop におけるオプションをすべて初期状態にリセットするときに、このオプションを実行します。
  これにより Docker Desktop はインストール直後の状態と同じになります。
@z

@x
## Diagnose problems, send feedback, and create GitHub issues
@y
{% comment %}
## Diagnose problems, send feedback, and create GitHub issues
{% endcomment %}
{: #diagnose-problems-send-feedback-and-create-github-issues }
## 診断、フィードバック送信、GitHub の issue 生成
@z

@x
### In-app diagnostics
@y
{% comment %}
### In-app diagnostics
{% endcomment %}
### アプリ内の診断
@z

@x
If you experience issues for which you do not find solutions in this
documentation, on [Docker Desktop for Windows issues on
GitHub](https://github.com/docker/for-win/issues), or the [Docker Desktop for Windows
forum](https://forums.docker.com/c/docker-for-windows), we can help you
troubleshoot the log data.
@y
{% comment %}
If you experience issues for which you do not find solutions in this
documentation, on [Docker Desktop for Windows issues on
GitHub](https://github.com/docker/for-win/issues), or the [Docker Desktop for Windows
forum](https://forums.docker.com/c/docker-for-windows), we can help you
troubleshoot the log data.
{% endcomment %}
何か問題が発生したとして、その解決方法が本書ではわからなかったとします。
[GitHub 上の Docker Desktop for Windows に対する issues](https://github.com/docker/for-win/issues) や [Docker Desktop for Windows フォーラム](https://forums.docker.com/c/docker-for-windows) を見ても解決できなかったら、ログデータの解析をお手伝いします。
@z

@x
Choose ![whale menu](images/whale-x.png){: .inline} > **Troubleshoot**
from the menu.
@y
{% comment %}
Choose ![whale menu](images/whale-x.png){: .inline} > **Troubleshoot**
from the menu.
{% endcomment %}
メニューから ![クジラメニュー](images/whale-x.png){: .inline} > **Troubleshoot** を実行します。
@z

@x
![Diagnose & Feedback](images/diagnose-feedback.png){:width="600px"}
@y
{% comment %}
![Diagnose & Feedback](images/diagnose-feedback.png){:width="600px"}
{% endcomment %}
![診断とフィードバック](images/diagnose-feedback.png){:width="600px"}
@z

@x
When the **Diagnose & Feedback** window initiated, it starts collecting diagnostics. When the diagnostics are available, you can upload them and obtain a **Diagnostic ID**, which must be provided when communicating with the Docker
team. For more information on our policy regarding personal data, see
[how is personal data handled in Docker
Desktop](https://docs.docker.com/docker-for-mac/faqs/#how-is-personal-data-handled-in-docker-desktop).
@y
{% comment %}
When the **Diagnose & Feedback** window initiated, it starts collecting diagnostics. When the diagnostics are available, you can upload them and obtain a **Diagnostic ID**, which must be provided when communicating with the Docker
team. For more information on our policy regarding personal data, see
[how is personal data handled in Docker
Desktop](https://docs.docker.com/docker-for-mac/faqs/#how-is-personal-data-handled-in-docker-desktop).
{% endcomment %}
**Diagnose & Feedback**（診断とフィードバック）画面が起動されると、診断情報の収集が始まります。
診断情報の収集が終わったら、これをアップロードして **Diagnostic ID**（診断 ID）を得ます。
これは Docker チームとのやりとりを行う際に必要になります。
個人情報取扱ポリシーについての情報は [how is personal data handled in Docker
Desktop](https://docs.docker.com/docker-for-mac/faqs/#how-is-personal-data-handled-in-docker-desktop)（Docker Desktop での個人情報の取り扱い） を参照してください。
@z

@x
![Diagnose & Feedback with ID](images/diagnostic-id.png){:width="600px"}
@y
{% comment %}
![Diagnose & Feedback with ID](images/diagnostic-id.png){:width="600px"}
{% endcomment %}
![診断とフィードバックにおける診断 ID](images/diagnostic-id.png){:width="600px"}
@z

@x
If you click on **Report an issue**, it opens [Docker Desktop for Windows issues on
GitHub](https://github.com/docker/for-win/issues/) in your web browser in a
"New issue" template, to be completed before submission. Do not forget to
include your diagnostic ID.
@y
{% comment %}
If you click on **Report an issue**, it opens [Docker Desktop for Windows issues on
GitHub](https://github.com/docker/for-win/issues/) in your web browser in a
"New issue" template, to be completed before submission. Do not forget to
include your diagnostic ID.
{% endcomment %}
**Report an issue**（問題の報告）をクリックっすると、ブラウザー上に [GitHub の Docker Desktop for Windows issues](https://github.com/docker/for-win/issues/) の「New issue」（新たな問題）のテンプレートページが開きます。
内容の書き終えたら送信します。
その際には診断 ID を記入することを忘れないでください。
@z

@x
![issue-template](images/issue-template.png){:width="600px"}
@y
{% comment %}
![issue-template](images/issue-template.png){:width="600px"}
{% endcomment %}
![問題のテンプレート画面](images/issue-template.png){:width="600px"}
@z

@x
### Diagnosing from the terminal
@y
{% comment %}
### Diagnosing from the terminal
{% endcomment %}
{: #diagnosing-from-the-terminal }
### ターミナルからの診断操作
@z

@x
On occasions it is useful to run the diagnostics yourself, for instance if
Docker Desktop for Windows cannot start.
@y
{% comment %}
On occasions it is useful to run the diagnostics yourself, for instance if
Docker Desktop for Windows cannot start.
{% endcomment %}
診断処理は、自分で実行した方がよい場合があります。
たとえば Docker Desktop for Windows が起動できないときなどです。
@z

@x
First locate the `com.docker.diagnose`, that should be in `C:\Program
Files\Docker\Docker\resources\com.docker.diagnose.exe`.
@y
{% comment %}
First locate the `com.docker.diagnose`, that should be in `C:\Program
Files\Docker\Docker\resources\com.docker.diagnose.exe`.
{% endcomment %}
まず`com.docker.diagnose`を探し出します。
おそらく`C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe`にあるはずです。
@z

@x
To create *and upload*  diagnostics in Powershell, run:
@y
{% comment %}
To create *and upload*  diagnostics in Powershell, run:
{% endcomment %}
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
{% comment %}
After the diagnostics have finished, you should have the following output,
containing your diagnostic ID:
{% endcomment %}
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
{% comment %}
## Troubleshooting topics
{% endcomment %}
{: #troubleshooting-topics }
## トラブルシューティングのトピック
@z

@x
### Make sure certificates are set up correctly
@y
{% comment %}
### Make sure certificates are set up correctly
{% endcomment %}
{: #make-sure-certificates-are-set-up-correctly }
### 証明書の適切な設定確認
@z

@x
Docker Desktop ignores certificates listed under insecure registries, and
does not send client certificates to them. Commands like `docker run` that
attempt to pull from the registry produces error messages on the command line,
like this:
@y
{% comment %}
Docker Desktop ignores certificates listed under insecure registries, and
does not send client certificates to them. Commands like `docker run` that
attempt to pull from the registry produces error messages on the command line,
like this:
{% endcomment %}
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
{% comment %}
As well as on the registry. For example:
{% endcomment %}
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
{% comment %}
For more about using client and server side certificates, see
[How do I add custom CA certificates?](index.md#how-do-i-add-custom-ca-certificates)
and [How do I add client certificates?](index.md#how-do-i-add-client-certificates) in the
Getting Started topic.
{% endcomment %}
クライアントやサーバーそれぞれの証明書の利用に関しては、導入ガイドのトピック、[どうやって独自の CA 証明書を追加するか](index.md#how-do-i-add-custom-ca-certificates) や [どうやってクライアント証明書を追加するか](index.md#how-do-i-add-client-certificates) を参照してください。
@z

@x
### Volumes
@y
{% comment %}
### Volumes
{% endcomment %}
{: #volumes }
### ボリューム
@z

@x
#### Permissions errors on data directories for shared volumes
@y
{% comment %}
#### Permissions errors on data directories for shared volumes
{% endcomment %}
{: #permissions-errors-on-data-directories-for-shared-volumes }
#### 共有ボリューム上のデータディレクトリに対するパーミッションエラー
@z

@x
Docker Desktop sets permissions on [shared volumes](index.md#file-sharing)
to a default value of [0777](http://permissions-calculator.org/decode/0777/)
(`read`, `write`, `execute` permissions for `user` and for `group`).
@y
{% comment %}
Docker Desktop sets permissions on [shared volumes](index.md#file-sharing)
to a default value of [0777](http://permissions-calculator.org/decode/0777/)
(`read`, `write`, `execute` permissions for `user` and for `group`).
{% endcomment %}
Docker Desktop は [共有ボリューム](index.md#file-sharing) に対して、デフォルトとして [0777](http://permissions-calculator.org/decode/0777/)（`user`と`group`に対して`read`、`write`、`execute`）のパーミッションを設定します。
@z

@x
The default permissions on shared volumes are not configurable. If you are
working with applications that require permissions different from the shared
volume defaults at container runtime, you need to either use non-host-mounted
volumes or find a way to make the applications work with the default file
permissions.
@y
{% comment %}
The default permissions on shared volumes are not configurable. If you are
working with applications that require permissions different from the shared
volume defaults at container runtime, you need to either use non-host-mounted
volumes or find a way to make the applications work with the default file
permissions.
{% endcomment %}
共有ボリュームにおけるこのデフォルトのパーミッションは、設定変更することができません。
共有ボリュームのデフォルト設定とは異なるパーミッションを必要とするアプリケーションを稼動させている場合は、ホストにマウントされていないボリュームを利用するか、デフォルトのパーミッションでも動作するようにアプリケーションの変更を行うしかありません。
@z

@x
See also,
[Can I change permissions on shared volumes for container-specific deployment requirements?](faqs.md#can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements)
in the FAQs.
@y
{% comment %}
See also,
[Can I change permissions on shared volumes for container-specific deployment requirements?](faqs.md#can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements)
in the FAQs.
{% endcomment %}
FAQ にある [コンテナー固有のデプロイ要件に従って共有ボリュームのパーミッションは変更できますか？](faqs.md#can-i-change-permissions-on-shared-volumes-for-container-specific-deployment-requirements) も参考にしてください。
@z

@x
#### Volume mounting requires shared folders for Linux containers
@y
{% comment %}
#### Volume mounting requires shared folders for Linux containers
{% endcomment %}
{: #volume-mounting-requires-shared-folders-for-linux-containers }
#### ボリュームマウントには Linux コンテナーに対する共有フォルダーが必要
@z

@x
If you are using mounted volumes and get runtime errors indicating an
application file is not found, access is denied to a volume mount, or a service
cannot start, such as when using [Docker Compose](../compose/gettingstarted.md),
you might need to enable [shared folders](index.md#file-sharing).
@y
{% comment %}
If you are using mounted volumes and get runtime errors indicating an
application file is not found, access is denied to a volume mount, or a service
cannot start, such as when using [Docker Compose](../compose/gettingstarted.md),
you might need to enable [shared folders](index.md#file-sharing).
{% endcomment %}
ボリュームのマウントを利用しているときに、実行時エラーが発生したとします。
たとえば [Docker Compose](../compose/gettingstarted.md) 利用時において、アプリケーションがファイルを見つけられない、ボリュームマウントに対してのアクセスが拒否される、サービスが起動しない、といったものです。
この場合は [共有フォルダー](index.md#file-sharing) を有効にすることが必要かもしれません。
@z

@x
Volume mounting requires shared folders for Linux containers (not for Windows
containers). Click ![whale menu](images/whale-x.png){: .inline}
 and then **Settings** > **Shared Folders** and share the folder that contains the
Dockerfile and volume.
@y
{% comment %}
Volume mounting requires shared folders for Linux containers (not for Windows
containers). Click ![whale menu](images/whale-x.png){: .inline}
 and then **Settings** > **Shared Folders** and share the folder that contains the
Dockerfile and volume.
{% endcomment %}
ボリュームをマウントするには、Linux コンテナーに対しての共有フォルダーが必要になります。
（Windows コンテナーではありません。）
![クジラメニュー](images/whale-x.png){: .inline} をクリックして **Settings** > **Shared Folders** を実行し、Dockerfile やボリュームを含むフォルダーを共有してください。
@z

@x
#### Support for symlinks
@y
{% comment %}
#### Support for symlinks
{% endcomment %}
{: #support-for-symlinks }
#### シンボリックリンクのサポート
@z

@x
Symlinks work within and across containers. To learn more, see [How do symlinks work on Windows?](faqs.md#how-do-symlinks-work-on-windows) in the FAQs.
@y
{% comment %}
Symlinks work within and across containers. To learn more, see [How do symlinks work on Windows?](faqs.md#how-do-symlinks-work-on-windows) in the FAQs.
{% endcomment %}
コンテナー内やコンテナー間ではシンボリックリンクが活用できます。
詳しくは FAQ 内にある [Windows においてシンボリックリンクはどうやって動作するのか？](faqs.md#how-do-symlinks-work-on-windows) を参照してください。
@z

@x
#### Avoid unexpected syntax errors, use Unix style line endings for files in containers
@y
{% comment %}
#### Avoid unexpected syntax errors, use Unix style line endings for files in containers
{% endcomment %}
{: #avoid-unexpected-syntax-errors-use-unix-style-line-endings-for-files-in-containers }
#### 予期しない文法エラー回避のためコンテナー向けファイルの改行文字を Unix 風に
@z

@x
Any file destined to run inside a container must use Unix style `\n` line
endings. This includes files referenced at the command line for builds and in
RUN commands in Docker files.
@y
{% comment %}
Any file destined to run inside a container must use Unix style `\n` line
endings. This includes files referenced at the command line for builds and in
RUN commands in Docker files.
{% endcomment %}
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
{% comment %}
Docker containers and `docker build` run in a Unix environment, so files in
containers must use Unix style line endings: `\n`, _not_ Windows style: `\r\n`.
Keep this in mind when authoring files such as shell scripts using Windows
tools, where the default is likely to be Windows style line endings. These
commands ultimately get passed to Unix commands inside a Unix based container
(for example, a shell script passed to `/bin/sh`). If Windows style line endings
are used, `docker run` fails with syntax errors.
{% endcomment %}
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
{% comment %}
For an example of this issue and the resolution, see this issue on GitHub:
[Docker RUN fails to execute shell
script](https://github.com/moby/moby/issues/24388).
{% endcomment %}
この問題の利用例とその解決については、GitHub issue にある [Docker RUN fails to execute shell script](https://github.com/moby/moby/issues/24388) を参照してください。
@z

@x
### Virtualization
@y
{% comment %}
### Virtualization
{% endcomment %}
{: #virtualization }
### 仮想化機能
@z

@x
 Your machine must have the following features for Docker Desktop to function correctly:
@y
 {% comment %}
 Your machine must have the following features for Docker Desktop to function correctly:
 {% endcomment %}
 Docker Desktop を正しく機能させるためには、マシンには以下の機能がなければなりません。
@z

@x
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview)
   installed and working
@y
{% comment %}
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview)
   installed and working
{% endcomment %}
1. [Hyper-V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview) がインストールされ動作していること。
@z

@x
2. Virtualization enabled in the BIOS
@y
{% comment %}
2. Virtualization enabled in the BIOS
{% endcomment %}
2. BIOS 設定において仮想化機能（virtualization）が有効に設定されていること。
@z

@x
3. Hypervisor enabled at Windows startup
@y
{% comment %}
3. Hypervisor enabled at Windows startup
{% endcomment %}
3. Windows 起動時にハイパーバイザーが有効であること。
@z

@x
#### Hyper-V
@y
#### Hyper-V
@z

@x
Docker Desktop requires Hyper-V as well as the Hyper-V Module for Windows
Powershell to be installed and enabled. The Docker Desktop installer enables
it for you.
@y
{% comment %}
Docker Desktop requires Hyper-V as well as the Hyper-V Module for Windows
Powershell to be installed and enabled. The Docker Desktop installer enables
it for you.
{% endcomment %}
Docker Desktop では Hyper-V が必要です。
また Windows Powershell における Hyper-V モジュールがインストールされ有効であることも必要です。
Docker Desktop のインストーラーの操作時に、これらが有効になります。
@z

@x
Docker Desktop also needs two CPU hardware features to use Hyper-V: Virtualization and Second Level Address Translation (SLAT), which is also called Rapid Virtualization Indexing (RVI). On some systems, Virtualization must be enabled in the BIOS. The steps required are vendor-specific, but typically the BIOS option is called `Virtualization Technology (VTx)` or something similar. Run the command `systeminfo` to check all required Hyper-V features. See [Pre-requisites for Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements) for more details.
@y
{% comment %}
Docker Desktop also needs two CPU hardware features to use Hyper-V: Virtualization and Second Level Address Translation (SLAT), which is also called Rapid Virtualization Indexing (RVI). On some systems, Virtualization must be enabled in the BIOS. The steps required are vendor-specific, but typically the BIOS option is called `Virtualization Technology (VTx)` or something similar. Run the command `systeminfo` to check all required Hyper-V features. See [Pre-requisites for Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements) for more details.
{% endcomment %}
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
{% comment %}
To install Hyper-V manually, see [Install Hyper-V on Windows 10](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install). A reboot is *required* after installation. If you install Hyper-V without rebooting, Docker Desktop does not work correctly.
{% endcomment %}
Hyper-V を手動でインストールする場合は [Install Hyper-V on Windows 10](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_install)（Windows 10 における Hyper-V のインストール）を参照してください。
インストール後には再起動が **必要です**。
Hyper-V のインストール後に再起動を行わないままでいると、Docker Desktop は正常に動作しません。
@z

@x
From the start menu, type **Turn Windows features on or off** and press enter.
In the subsequent screen, verify that Hyper-V is enabled:
@y
{% comment %}
From the start menu, type **Turn Windows features on or off** and press enter.
In the subsequent screen, verify that Hyper-V is enabled:
{% endcomment %}
スタートメニューから **Turn Windows features on or off** と入力して ENTER キーを押してください。
表示される画面から Hyper-V が有効であることを確認してください。
@z

@x
![Hyper-V on Windows features](images/hyperv-enabled.png){:width="600px"}
@y
{% comment %}
![Hyper-V on Windows features](images/hyperv-enabled.png){:width="600px"}
{% endcomment %}
![Windows の Hyper-V 機能](images/hyperv-enabled.png){:width="600px"}
@z

@x
#### Hyper-V driver for Docker Machine
@y
{% comment %}
#### Hyper-V driver for Docker Machine
{% endcomment %}
#### Docker Machine 用の Hyper-V ドライバー
@z

@x
The Docker Desktop installation includes the legacy tool Docker Machine which uses the old
[`boot2docker.iso`](https://github.com/boot2docker/boot2docker){:target="_blank" rel="noopener" class="_"},
and the [Microsoft Hyper-V driver](../machine/drivers/hyper-v.md) to create local
virtual machines. _This is tangential to using Docker Desktop_, but if you want to use Docker Machine
to create multiple local Virtual Machines (VMs), or to provision remote machines, see the
[Docker Machine](../machine/index.md) topics. This is documented only for users looking for information about Docker Machine on Windows, which requires that Hyper-V is enabled, an external network switch is active, and referenced in the flags for the `docker-machine create` command
as described in the [Docker Machine driver example](../machine/drivers/hyper-v.md#example).
@y
{% comment %}
The Docker Desktop installation includes the legacy tool Docker Machine which uses the old
[`boot2docker.iso`](https://github.com/boot2docker/boot2docker){:target="_blank" rel="noopener" class="_"},
and the [Microsoft Hyper-V driver](../machine/drivers/hyper-v.md) to create local
virtual machines. _This is tangential to using Docker Desktop_, but if you want to use Docker Machine
to create multiple local Virtual Machines (VMs), or to provision remote machines, see the
[Docker Machine](../machine/index.md) topics. This is documented only for users looking for information about Docker Machine on Windows, which requires that Hyper-V is enabled, an external network switch is active, and referenced in the flags for the `docker-machine create` command
as described in the [Docker Machine driver example](../machine/drivers/hyper-v.md#example).
{% endcomment %}
Docker Desktop をインストールすると、かつてのツール Docker Machine もインストールされます。
これはローカルに仮想マシンを生成するにあたって、古い [`boot2docker.iso`](https://github.com/boot2docker/boot2docker){:target="_blank" rel="noopener" class="_"} と [Microsoft Hyper-V ドライバー](../machine/drivers/hyper-v.md) を利用します。
**Docker Desktop を使う上で、これは関係のないものです**。
ただしローカルに複数の仮想マシンを生成するために Docker Machine を利用したい場合、あるいはリモートマシンにプロビジョニングしたい場合は [Docker Machine](../machine/index.md) に示されるトピックを参照してください。
そのトピックは Docker Machine on Windows の情報が必要な方のみに向けたものです。
そこでは Hyper-V の有効化と外部ネットワークスイッチがアクティブであることが必要であり、`docker-machine create`コマンドのフラグで参照します。
これに関しては [Docker Machine ドライバー利用例](../machine/drivers/hyper-v.md#example) において説明されています。
@z

@x
#### Virtualization must be enabled
@y
{% comment %}
#### Virtualization must be enabled
{% endcomment %}
{: #virtualization-must-be-enabled }
#### 仮想化技術の有効化
@z

@x
In addition to [Hyper-V](#hyper-v) or [WSL 2](wsl.md), virtualization must be enabled. Check the
Performance tab on the Task Manager:
@y
{% comment %}
In addition to [Hyper-V](#hyper-v) or [WSL 2](wsl.md), virtualization must be enabled. Check the
Performance tab on the Task Manager:
{% endcomment %}
[Hyper-V](#hyper-v) や [WSL 2](wsl.md) とともに、仮想化技術も有効でなければなりません。
タスクマネージャーのパフォーマンスタブを確認してください。
@z

@x
![Task Manager](images/virtualization-enabled.png){:width="700px"}
@y
{% comment %}
![Task Manager](images/virtualization-enabled.png){:width="700px"}
{% endcomment %}
![タスクマネージャー](images/virtualization-enabled.png){:width="700px"}
@z

@x
If you manually uninstall Hyper-V, WSL 2 or disable virtualization,
Docker Desktop cannot start. See [Unable to run Docker for Windows on
Windows 10 Enterprise](https://github.com/docker/for-win/issues/74).
@y
{% comment %}
If you manually uninstall Hyper-V, WSL 2 or disable virtualization,
Docker Desktop cannot start. See [Unable to run Docker for Windows on
Windows 10 Enterprise](https://github.com/docker/for-win/issues/74).
{% endcomment %}
Hyper-V や WSL 2 を手動でアンインストールしたり、仮想化機能を無効にしていたりすると、Docker Desktop は起動しません。
[Unable to run Docker for Windows on Windows 10 Enterprise](https://github.com/docker/for-win/issues/74)（Windows 10 エンタープライズにおいて Docker for Windows が起動しない）を参照してください。
@z

@x
#### Hypervisor enabled at Windows startup
@y
{% comment %}
#### Hypervisor enabled at Windows startup
{% endcomment %}
{: #hypervisor-enabled-at-windows-startup }
#### Windows 起動時のハイパーバイザーの有効化
@z

@x
If you have completed the steps described above and are still experiencing
Docker Desktop startup issues, this could be because the Hypervisor is installed,
but not launched during Windows startup. Some tools (such as older versions of 
Virtual Box) and video game installers disable hypervisor on boot. To reenable it:
@y
{% comment %}
If you have completed the steps described above and are still experiencing
Docker Desktop startup issues, this could be because the Hypervisor is installed,
but not launched during Windows startup. Some tools (such as older versions of 
Virtual Box) and video game installers disable hypervisor on boot. To reenable it:
{% endcomment %}
ここまで説明している手順に従っているにも関わらず、Docker Desktop の起動に問題がある場合は、ハイパーバイザーがインストールされているものの、Windows 起動時にそれが起動されていないのかもしれません。
所定のツール（Virtual Box の旧バージョンなど）やビデオゲームのインストーラーの中には、ハイパーバイザーを起動時に無効化してしまうものがあります。
もう一度有効化するためには以下を行います。
@z

@x
1. Open an administrative console prompt.
2. Run `bcdedit /set hypervisorlaunchtype auto`.
3. Restart Windows.
@y
{% comment %}
1. Open an administrative console prompt.
2. Run `bcdedit /set hypervisorlaunchtype auto`.
3. Restart Windows.
{% endcomment %}
1. 管理コンソールプロンプトを開きます。
2. `bcdedit /set hypervisorlaunchtype auto`を実行します。
3. Windows を再起動します。
@z

@x
### Networking and WiFi problems upon Docker Desktop for Windows install
@y
{% comment %}
### Networking and WiFi problems upon Docker Desktop for Windows install
{% endcomment %}
{: #networking-and-wifi-problems-upon-docker-desktop-for-windows-install }
### Docker Desktop for Windows インストールにおけるネットワークと Wifi の問題
@z

@x
Some users may experience networking issues during install and startup of
Docker Desktop. For example, upon install or auto-reboot, network adapters
and/or WiFi may get disabled. In some scenarios, problems are due to having
VirtualBox or its network adapters still installed, but in other scenarios this
is not the case. See the GitHub issue [Enabling
Hyper-V feature turns my wi-fi
off](https://github.com/docker/for-win/issues/139).
@y
{% comment %}
Some users may experience networking issues during install and startup of
Docker Desktop. For example, upon install or auto-reboot, network adapters
and/or WiFi may get disabled. In some scenarios, problems are due to having
VirtualBox or its network adapters still installed, but in other scenarios this
is not the case. See the GitHub issue [Enabling
Hyper-V feature turns my wi-fi
off](https://github.com/docker/for-win/issues/139).
{% endcomment %}
Docker Desktop のインストールと起動の際に、ネットワーク機能の問題が発生するケースがあります。
たとえばインストールや自動再起動の際に、ネットワークアダプターあるいは Wifi が利用不能になってしまうものです。
原因の 1 つとして VirtualBox とそのネットワークアダプターがインストールされたまま残っていることがあります。
またこれが原因ではない場合もあります。
GitHub の issue [Enabling Hyper-V feature turns my wi-fi off](https://github.com/docker/for-win/issues/139)（Hyper-V 機能を有効にすると Wifi がオフになってしまう）を参照してください。
@z

@x
Here are some steps to take if you experience similar problems:
@y
{% comment %}
Here are some steps to take if you experience similar problems:
{% endcomment %}
同様の問題が発生した際には、以下の手順で確認してください。
@z

@x
1.  Ensure **virtualization** is enabled, as described above in [Virtualization
    must be enabled](#virtualization-must-be-enabled).
@y
{% comment %}
1.  Ensure **virtualization** is enabled, as described above in [Virtualization
    must be enabled](#virtualization-must-be-enabled).
{% endcomment %}
1.  上の [仮想化技術の有効化](#virtualization-must-be-enabled) で説明したように、**仮想化機能**（virtualization）が有効であることを確認します。
@z

@x
2.  Ensure **Hyper-V** is installed and enabled, as described above in [Hyper-V
    must be enabled](#hyper-v-must-be-enabled).
@y
{% comment %}
2.  Ensure **Hyper-V** is installed and enabled, as described above in [Hyper-V
    must be enabled](#hyper-v-must-be-enabled).
{% endcomment %}
2.  [Hyper-V の有効化](#hyper-v-must-be-enabled) で説明したように、**Hyper-V** をインストールし有効化していることを確認します。
@z

@x
3.  Ensure **DockerNAT** is enabled by checking the **Virtual Switch Manager**
    on the Actions tab on the right side of the **Hyper-V Manager**.
@y
{% comment %}
3.  Ensure **DockerNAT** is enabled by checking the **Virtual Switch Manager**
    on the Actions tab on the right side of the **Hyper-V Manager**.
{% endcomment %}
3.  **DockerNAT** が有効であることを確認します。
    これは **Hyper-V マネージャー**（Hyper-V Manager）の右側にある Actions タブにおいて **仮想スイッチマネージャー**（Virtual Switch Manager）をチェックします。
@z

@x
    ![Hyper-V manager](images/hyperv-manager.png)
@y
    {% comment %}
    ![Hyper-V manager](images/hyperv-manager.png)
    {% endcomment %}
    ![Hyper-V マネージャー](images/hyperv-manager.png)
@z

@x
4.  Set up an external network switch. If you plan at any point to use
    [Docker Machine](../machine/overview.md) to set up multiple local VMs, you
    need this anyway, as described in the topic on the
    [Hyper-V driver for Docker Machine](../machine/drivers/hyper-v.md#example).
    You can replace `DockerNAT` with this switch.
@y
{% comment %}
4.  Set up an external network switch. If you plan at any point to use
    [Docker Machine](../machine/overview.md) to set up multiple local VMs, you
    need this anyway, as described in the topic on the
    [Hyper-V driver for Docker Machine](../machine/drivers/hyper-v.md#example).
    You can replace `DockerNAT` with this switch.
{% endcomment %}
4.  外部ネットワークスイッチを設定します。
    いずれ [Docker Machine](../machine/overview.md) を利用してローカルに複数の VM を利用するつもりなら、これが必要になります。
    このことは [Docker Machine 用の Hyper-V ドライバー](../machine/drivers/hyper-v.md#example) 内のトピックにおいて説明しています。
    `DockerNAT`をこのスイッチに置き換えることができます。
@z

@x
5.  If previous steps fail to solve the problems, follow steps on the
    [Cleanup README](https://github.com/Microsoft/Virtualization-Documentation/blob/master/windows-server-container-tools/CleanupContainerHostNetworking/README.md).
@y
{% comment %}
5.  If previous steps fail to solve the problems, follow steps on the
    [Cleanup README](https://github.com/Microsoft/Virtualization-Documentation/blob/master/windows-server-container-tools/CleanupContainerHostNetworking/README.md).
{% endcomment %}
5.  これまでの手順では問題解決できない場合は、[Cleanup README](https://github.com/Microsoft/Virtualization-Documentation/blob/master/windows-server-container-tools/CleanupContainerHostNetworking/README.md) の手順に従ってください。
@z

@x
    > Read the full description before you run the Windows cleanup script.
    >
    >The cleanup command has two flags, `-Cleanup` and
    >`-ForceDeleteAllSwitches`. Read the whole page before running any scripts,
    >especially warnings about `-ForceDeleteAllSwitches`. {: .warning}
@y
    {% comment %}
    > Read the full description before you run the Windows cleanup script.
    >
    >The cleanup command has two flags, `-Cleanup` and
    >`-ForceDeleteAllSwitches`. Read the whole page before running any scripts,
    >especially warnings about `-ForceDeleteAllSwitches`. {: .warning}
    {% endcomment %}
    > 上記説明を十分読んでから Windows クリーンアップスクリプトを実行してください。
    >
    >クリーンアップ（cleanup）コマンドには、2 つのフラグがあります。
    > `-Cleanup`と`-ForceDeleteAllSwitches`です。
    >どのスクリプトを実行する場合も、説明ページ全体をよく読んでから実施してください。
    >特に`-ForceDeleteAllSwitches`の警告メッセージについてはよく確認してください。{: .warning}
@z

@x
### Windows containers and Windows Server
@y
{% comment %}
### Windows containers and Windows Server
{% endcomment %}
{: #windows-containers-and-windows-server }
### Windows コンテナーと Windows Server
@z

@x
Docker Desktop is not supported on Windows Server. If you have questions about how to run Windows containers on Windows 10, see
[Switch between Windows and Linux containers](index.md#switch-between-windows-and-linux-containers).
@y
{% comment %}
Docker Desktop is not supported on Windows Server. If you have questions about how to run Windows containers on Windows 10, see
[Switch between Windows and Linux containers](index.md#switch-between-windows-and-linux-containers).
{% endcomment %}
Docker Desktop は Windows Server をサポートしていません。
Windows 10 上における Windows コンテナーの起動方法がわからない場合は、[Windows と Linux の各コンテナー間の切り替え](index.md#switch-between-windows-and-linux-containers) を参照してください。
@z

@x
A full tutorial is available in [docker/labs](https://github.com/docker/labs) on
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md).
@y
{% comment %}
A full tutorial is available in [docker/labs](https://github.com/docker/labs) on
[Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md).
{% endcomment %}
[docker/labs](https://github.com/docker/labs) にある [Getting Started with Windows Containers](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)（Windows コンテナーをはじめよう）では、充実したチュートリアルが示されています。
@z

@x
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. However, if you install Docker this way, you cannot develop or run Linux containers. If you try to run a Linux container on the native Docker daemon, an error occurs:
@y
{% comment %}
You can install a native Windows binary which allows you to develop and run
Windows containers without Docker Desktop. However, if you install Docker this way, you cannot develop or run Linux containers. If you try to run a Linux container on the native Docker daemon, an error occurs:
{% endcomment %}
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
### Limitations of Windows containers for `localhost` and published ports
@y
{% comment %}
### Limitations of Windows containers for `localhost` and published ports
{% endcomment %}
{: #limitations-of-windows-containers-for-localhost-and-published-ports }
### `localhost` や公開ポートに対する Windows コンテナーの制約
@z

@x
Docker Desktop for Windows provides the option to switch Windows and Linux containers.
If you are using Windows containers, keep in mind that there are some
limitations with regard to networking due to the current implementation of
Windows NAT (WinNAT). These limitations may potentially resolve as the Windows
containers project evolves.
@y
{% comment %}
Docker Desktop for Windows provides the option to switch Windows and Linux containers.
If you are using Windows containers, keep in mind that there are some
limitations with regard to networking due to the current implementation of
Windows NAT (WinNAT). These limitations may potentially resolve as the Windows
containers project evolves.
{% endcomment %}
Docker Desktop for Windows には、Windows コンテナーと Linux コンテナーを切り替えるオプションがあります。
Windows コンテナーを利用している場合、現時点での Windows NAT（WinNAT）の実装上の理由により、ネットワーク機能に一部制限があることに留意してください。
この制限は、Windows コンテナープロジェクトの進展により、解決される可能性があります。
@z

@x
Windows containers work with published ports on localhost beginning with Windows 10 1809 using Docker Desktop for Windows as well as Windows Server 2019 / 1809 using Docker EE.
@y
{% comment %}
Windows containers work with published ports on localhost beginning with Windows 10 1809 using Docker Desktop for Windows as well as Windows Server 2019 / 1809 using Docker EE.
{% endcomment %}
Windows コンテナーでは、ローカルホストの公開ポートを使って動作します。
これは Docker Desktop for Windows を利用した Windows 10 1809 から可能になりました。
Docker EE を利用する Windows Server 2019 / 1809 についても同様です。
@z

@x
If you are working with a version prior to `Windows 10 18.09`, published ports on Windows containers have an issue with loopback to the localhost. You can only reach container endpoints from the host using the container's IP and port. With `Windows 10 18.09`, containers work with published ports on localhost.
@y
{% comment %}
If you are working with a version prior to `Windows 10 18.09`, published ports on Windows containers have an issue with loopback to the localhost. You can only reach container endpoints from the host using the container's IP and port. With `Windows 10 18.09`, containers work with published ports on localhost.
{% endcomment %}
`Windows 10 18.09` より前のバージョンを利用している場合、Windows コンテナーの公開ポートに関しては、ローカルホストのループバックに問題があります。
ホストからコンテナーのエンドポイントにアクセスするには、コンテナーの IP とポートが必要でしたが、`Windows 10 18.09` からは、ローカルホストの公開ポートを使ってアクセスできるようになりました。
@z

@x
So, in a scenario where you use Docker to pull an image and run a webserver with
a command like this:
@y
{% comment %}
So, in a scenario where you use Docker to pull an image and run a webserver with
a command like this:
{% endcomment %}
Docker を使ってイメージをプルしてウェブサーバーを起動するとします。
まずは以下のようなコマンドを実行します。
@z

@x
```shell
> docker run -d -p 80:80 --name webserver nginx
```
@y
```shell
> docker run -d -p 80:80 --name webserver nginx
```
@z

@x
Using `curl http://localhost`, or pointing your web browser at
`http://localhost` does not display the `nginx` web page (as it would do with
Linux containers).
@y
{% comment %}
Using `curl http://localhost`, or pointing your web browser at
`http://localhost` does not display the `nginx` web page (as it would do with
Linux containers).
{% endcomment %}
`curl http://localhost`を実行したり、ウェブサーバー上から`http://localhost`にアクセスしても、`nginx`のウェブページは表示されません。
（Linux コンテナーであれば表示されています。）
@z

@x
To reach a Windows container from the local host, you need to specify the IP
address and port for the container that is running the service.
@y
{% comment %}
To reach a Windows container from the local host, you need to specify the IP
address and port for the container that is running the service.
{% endcomment %}
ローカルホストから Windows コンテナーにアクセスするには、サービスが実行されているコンテナーの IP アドレスとポートを指定する必要があります。
@z

@x
You can get the container IP address by using [`docker inspect`](../engine/reference/commandline/inspect.md) with some `--format` options
and the ID or name of the container. For the example above, the command would
look like this, using the name we gave to the container (`webserver`) instead of
the container ID:
@y
{% comment %}
You can get the container IP address by using [`docker inspect`](../engine/reference/commandline/inspect.md) with some `--format` options
and the ID or name of the container. For the example above, the command would
look like this, using the name we gave to the container (`webserver`) instead of
the container ID:
{% endcomment %}
コンテナーの IP アドレスは、[`docker inspect`](../engine/reference/commandline/inspect.md)コマンドにコンテナーの ID か名前を指定し、適当に`--format`オプションをつけて確認することができます。
上の例に対応するコマンドは、たとえば以下のようになります。
ここではコンテナー ID ではなく、コンテナー名（`webserver`）を指定しています。
@z

@x
{% raw %}
```bash
$ docker inspect \
  --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
  webserver
```
{% endraw %}
@y
{% raw %}
```bash
$ docker inspect \
  --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
  webserver
```
{% endraw %}
@z

@x
This gives you the IP address of the container, for example:
@y
{% comment %}
This gives you the IP address of the container, for example:
{% endcomment %}
上を実行するとコンテナーの IP アドレスが、たとえば以下のように表示されます。
@z

@x
{% raw %}
```bash
$ docker inspect \
  --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
  webserver

172.17.0.2
```
{% endraw %}
@y
{% raw %}
```bash
$ docker inspect \
  --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
  webserver

172.17.0.2
```
{% endraw %}
@z

@x
Now you can connect to the webserver by using `http://172.17.0.2:80` (or simply
`http://172.17.0.2`, since port `80` is the default HTTP port.)
@y
{% comment %}
Now you can connect to the webserver by using `http://172.17.0.2:80` (or simply
`http://172.17.0.2`, since port `80` is the default HTTP port.)
{% endcomment %}
そこでウェブサーバーには`http://172.17.0.2:80`を使ってアクセスできるようになります。
（あるいは HTTP のデフォルトポートは`80`なので、単に`http://172.17.0.2`としてもアクセスできます。）
@z

@x
For more information, see:
@y
{% comment %}
For more information, see:
{% endcomment %}
さらに詳しくは、以下を参照してください。
@z

@x
* Docker Desktop for Windows issue on GitHub: [Port binding does not work for
  locahost](https://github.com/docker/for-win/issues/458)
@y
{% comment %}
* Docker Desktop for Windows issue on GitHub: [Port binding does not work for
  locahost](https://github.com/docker/for-win/issues/458)
{% endcomment %}
* GitHub 上の Docker Desktop for Windows に関する issue: [Port binding does not work for
  locahost](https://github.com/docker/for-win/issues/458)（ポート割り当てがローカルホストに対して動作しない）
@z

@x
* [Published Ports on Windows Containers Don't Do
  Loopback](https://blog.sixeyed.com/published-ports-on-windows-containers-dont-do-loopback/)
@y
{% comment %}
* [Published Ports on Windows Containers Don't Do
  Loopback](https://blog.sixeyed.com/published-ports-on-windows-containers-dont-do-loopback/)
{% endcomment %}
* [Published Ports on Windows Containers Don't Do
  Loopback](https://blog.sixeyed.com/published-ports-on-windows-containers-dont-do-loopback/)（Windows コンテナー上の公開ポートがループバックしない）
@z

@x
* [Windows NAT capabilities and
  limitations](https://blogs.technet.microsoft.com/virtualization/2016/05/25/windows-nat-winnat-capabilities-and-limitations/)
@y
{% comment %}
* [Windows NAT capabilities and
  limitations](https://blogs.technet.microsoft.com/virtualization/2016/05/25/windows-nat-winnat-capabilities-and-limitations/)
{% endcomment %}
* [Windows NAT capabilities and limitations](https://blogs.technet.microsoft.com/virtualization/2016/05/25/windows-nat-winnat-capabilities-and-limitations/)（Windows の NAT 機能と制限）
@z

@x
### Running Docker Desktop in nested virtualization scenarios
@y
{% comment %}
### Running Docker Desktop in nested virtualization scenarios
{% endcomment %}
{: #running-docker-desktop-in-nested-virtualization-scenarios }
### ネストした仮想環境での Docker Desktop 実行
@z

@x
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or VMware Fusion on a Mac provided that the VM is properly configured. However, problems and intermittent failures may still occur due to the way these apps virtualize the hardware. For these reasons, _**Docker Desktop is not supported in nested virtualization scenarios**_. It might work
in some cases, and not in others.
@y
{% comment %}
Docker Desktop can run inside a Windows 10 VM running on apps like Parallels or VMware Fusion on a Mac provided that the VM is properly configured. However, problems and intermittent failures may still occur due to the way these apps virtualize the hardware. For these reasons, _**Docker Desktop is not supported in nested virtualization scenarios**_. It might work
in some cases, and not in others.
{% endcomment %}
Docker Desktop は VM 環境内でも動作します。
たとえば Mac 上の Parallels や VMware Fusion といったアプリ内に、Windows 10 の VM 環境を構築して、適切な設定を行えばそこで Docker Desktop を動作させることができます。
ただしそういったアプリによるハードウェア仮想化の方式が原因で、支障が出たり断続的な障害が引き起こされる場合があります。
こういった理由から、**Docker Desktop ではネスト化された仮想環境をサポートしません**。
動く場合もあれば動かない場合もあるという状況です。
@z

@x
For best results, we recommend you run Docker Desktop natively on a Windows system (to work with Windows or Linux containers), or on Mac to work with Linux containers.
@y
{% comment %}
For best results, we recommend you run Docker Desktop natively on a Windows system (to work with Windows or Linux containers), or on Mac to work with Linux containers.
{% endcomment %}
最適な答えは、ネイティブな Docker Desktop を動作させることです。
Docker Desktop on Windows であれば Windows コンテナーと Linux コンテナーを利用できます。
あるい Docker Desktop on Mac であれば Linux コンテナーを利用できます。
@z

@x
#### If you still want to use nested virtualization
@y
{% comment %}
#### If you still want to use nested virtualization
{% endcomment %}
{: #if-you-still-want-to-use-nested-virtualization }
#### それでもネスト化仮想環境を利用したい場合
@z

@x
* Make sure nested virtualization support is enabled in VMWare or Parallels.
  Check the settings in **Hardware > CPU & Memory > Advanced Options > Enable
  nested virtualization** (the exact menu sequence might vary slightly).
@y
{% comment %}
* Make sure nested virtualization support is enabled in VMWare or Parallels.
  Check the settings in **Hardware > CPU & Memory > Advanced Options > Enable
  nested virtualization** (the exact menu sequence might vary slightly).
{% endcomment %}
* Make sure nested virtualization support is enabled in VMWare or Parallels.
  Check the settings in **Hardware > CPU & Memory > Advanced Options > Enable
  nested virtualization** (the exact menu sequence might vary slightly).
@z

@x
* Configure your VM with at least 2 CPUs and sufficient memory to run your
  workloads.
@y
{% comment %}
* Configure your VM with at least 2 CPUs and sufficient memory to run your
  workloads.
{% endcomment %}
* Configure your VM with at least 2 CPUs and sufficient memory to run your
  workloads.
@z

@x
* Make sure your system is more or less idle.
@y
{% comment %}
* Make sure your system is more or less idle.
{% endcomment %}
* システムに多少でも余裕があることを確認します。
@z

@x
* Make sure your Windows OS is up-to-date. There have been several issues with
  some insider builds.
@y
{% comment %}
* Make sure your Windows OS is up-to-date. There have been several issues with
  some insider builds.
{% endcomment %}
* Windows OS が最新であることを確認します。
  インサイダービルド（Insider Build）では問題が発生する場合があります。
@z

@x
* The processor you have may also be relevant. For example, Westmere based Mac
  Pros have some additional hardware virtualization features over Nehalem based
  Mac Pros and so do newer generations of Intel processors.
@y
{% comment %}
* The processor you have may also be relevant. For example, Westmere based Mac
  Pros have some additional hardware virtualization features over Nehalem based
  Mac Pros and so do newer generations of Intel processors.
{% endcomment %}
* 利用するプロセッサーも重要かもしれません。
  たとえば Westmere ベースの Mac Pro には Nehalem ベースの Mac Pro に比べて、ハードウェア仮想機能が追加されています。
  したがって、より最新に近い世代のインテルプロセッサーを利用してください。
@z

@x
#### Typical failures we see with nested virtualization
@y
{% comment %}
#### Typical failures we see with nested virtualization
{% endcomment %}
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
{% comment %}
* Slow boot time of the Linux VM. If you look in the logs and find some entries
  prefixed with `Moby`. On real hardware, it takes 5-10 seconds to boot the
  Linux VM; roughly the time between the `Connected` log entry and the `*
  Starting Docker ... [ ok ]` log entry. If you boot the Linux VM inside a
  Windows VM, this may take considerably longer. We have a timeout of 60s or so.
  If the VM hasn't started by that time, we retry. If the retry fails we print
  an error. You can sometimes work around this by providing more resources to
  the Windows VM.
{% endcomment %}
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
{% comment %}
* Sometimes the VM fails to boot when Linux tries to calibrate the time stamp
  counter (TSC). This process is quite timing sensitive and may fail when
  executed inside a VM which itself runs inside a VM. CPU utilization is also
  likely to be higher.
{% endcomment %}
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
{% comment %}
* Ensure "PMU Virtualization" is turned off in Parallels on Macs. Check the
  settings in **Hardware > CPU & Memory > Advanced Settings > PMU
  Virtualization**.
{% endcomment %}
* Ensure "PMU Virtualization" is turned off in Parallels on Macs. Check the
  settings in **Hardware > CPU & Memory > Advanced Settings > PMU
  Virtualization**.
@z

@x
#### Related issues
@y
{% comment %}
#### Related issues
{% endcomment %}
{: #related-issues }
#### 関連する問題
@z

@x
Discussion thread on GitHub at [Docker for Windows issue
267](https://github.com/docker/for-win/issues/267).
@y
{% comment %}
Discussion thread on GitHub at [Docker for Windows issue
267](https://github.com/docker/for-win/issues/267).
{% endcomment %}
Discussion thread on GitHub at [Docker for Windows issue
267](https://github.com/docker/for-win/issues/267).
@z

@x
### Networking issues
@y
{% comment %}
### Networking issues
{% endcomment %}
{: #networking-issues }
### ネットワークの問題
@z

@x
IPv6 is not (yet) supported on Docker Desktop.
@y
{% comment %}
IPv6 is not (yet) supported on Docker Desktop.
{% endcomment %}
Docker Desktop では IPv6 は（まだ）サポートされていません。
@z

@x
Some users have reported problems connecting to Docker Hub on the Docker Desktop stable version. (See GitHub issue
[22567](https://github.com/moby/moby/issues/22567).)
@y
{% comment %}
Some users have reported problems connecting to Docker Hub on the Docker Desktop stable version. (See GitHub issue
[22567](https://github.com/moby/moby/issues/22567).)
{% endcomment %}
Docker Desktop 安定版から Docker Hub へ接続する際に、問題が発生する場合があることが報告されています。
（GitHub issue [22567](https://github.com/moby/moby/issues/22567) を参照してください。）
@z

@x
Here is an example command and error message:
@y
{% comment %}
Here is an example command and error message:
{% endcomment %}
以下はエラー発生するコマンド例です。
@z

@x
```shell
> docker run hello-world

Unable to find image 'hello-world:latest' locally
Pulling repository docker.io/library/hello-world
C:\Program Files\Docker\Docker\Resources\bin\docker.exe: Error while pulling image: Get https://index.docker.io/v1/repositories/library/hello-world/images: dial tcp: lookup index.docker.io on 10.0.75.1:53: no such host.
See 'C:\Program Files\Docker\Docker\Resources\bin\docker.exe run --help'.
```
@y
```shell
> docker run hello-world

Unable to find image 'hello-world:latest' locally
Pulling repository docker.io/library/hello-world
C:\Program Files\Docker\Docker\Resources\bin\docker.exe: Error while pulling image: Get https://index.docker.io/v1/repositories/library/hello-world/images: dial tcp: lookup index.docker.io on 10.0.75.1:53: no such host.
See 'C:\Program Files\Docker\Docker\Resources\bin\docker.exe run --help'.
```
@z

@x
As an immediate workaround to this problem, reset the DNS server to use the
Google DNS fixed address: `8.8.8.8`. You can configure this through the **Settings**
> **Network** dialog, as described in the topic [Network](index.md#network).
Docker automatically restarts when you apply this setting, which could take some
time.
@y
{% comment %}
As an immediate workaround to this problem, reset the DNS server to use the
Google DNS fixed address: `8.8.8.8`. You can configure this through the **Settings**
> **Network** dialog, as described in the topic [Network](index.md#network).
Docker automatically restarts when you apply this setting, which could take some
time.
{% endcomment %}
As an immediate workaround to this problem, reset the DNS server to use the
Google DNS fixed address: `8.8.8.8`. You can configure this through the **Settings**
> **Network** dialog, as described in the topic [Network](index.md#network).
Docker automatically restarts when you apply this setting, which could take some
time.
@z

@x
### NAT/IP configuration
@y
{% comment %}
### NAT/IP configuration
{% endcomment %}
### NAT/IP configuration
@z

@x
By default, Docker Desktop uses an internal network prefix of
`10.0.75.0/24`. Should this clash with your normal network setup, you can change
the prefix from the **Settings** menu. See the [Network](index.md#network) topic
under [Settings](index.md#docker-settings).
@y
{% comment %}
By default, Docker Desktop uses an internal network prefix of
`10.0.75.0/24`. Should this clash with your normal network setup, you can change
the prefix from the **Settings** menu. See the [Network](index.md#network) topic
under [Settings](index.md#docker-settings).
{% endcomment %}
By default, Docker Desktop uses an internal network prefix of
`10.0.75.0/24`. Should this clash with your normal network setup, you can change
the prefix from the **Settings** menu. See the [Network](index.md#network) topic
under [Settings](index.md#docker-settings).
@z

@x
## Workarounds
@y
{% comment %}
## Workarounds
{% endcomment %}
{: #workarounds }
## 回避策
@z

@x
### Reboot
@y
{% comment %}
### Reboot
{% endcomment %}
{: #reboot }
### 再起動
@z

@x
Restart your PC to stop / discard any vestige of the daemon running from the
previously installed version.
@y
{% comment %}
Restart your PC to stop / discard any vestige of the daemon running from the
previously installed version.
{% endcomment %}
Restart your PC to stop / discard any vestige of the daemon running from the
previously installed version.
@z

@x
### Unset `DOCKER_HOST`
@y
{% comment %}
### Unset `DOCKER_HOST`
{% endcomment %}
### 変数`DOCKER_HOST`の設定解除
@z

@x
The `DOCKER_HOST` environmental variable does not need to be set.  If you use
bash, use the command `unset ${!DOCKER_*}` to unset it.  For other shells,
consult the shell's documentation.
@y
{% comment %}
The `DOCKER_HOST` environmental variable does not need to be set.  If you use
bash, use the command `unset ${!DOCKER_*}` to unset it.  For other shells,
consult the shell's documentation.
{% endcomment %}
The `DOCKER_HOST` environmental variable does not need to be set.  If you use
bash, use the command `unset ${!DOCKER_*}` to unset it.  For other shells,
consult the shell's documentation.
@z

@x
### Make sure Docker is running for webserver examples
@y
{% comment %}
### Make sure Docker is running for webserver examples
{% endcomment %}
{: #make-sure-docker-is-running-for-webserver-examples }
### Make sure Docker is running for webserver examples
@z

@x
For the `hello-world-nginx` example and others, Docker Desktop must be
running to get to the webserver on `http://localhost/`. Make sure that the
Docker whale is showing in the menu bar, and that you run the Docker commands in
a shell that is connected to the Docker Desktop Engine (not Engine from Toolbox). Otherwise, you might start the webserver container but get a "web page
not available" error when you go to `docker`.
@y
{% comment %}
For the `hello-world-nginx` example and others, Docker Desktop must be
running to get to the webserver on `http://localhost/`. Make sure that the
Docker whale is showing in the menu bar, and that you run the Docker commands in
a shell that is connected to the Docker Desktop Engine (not Engine from Toolbox). Otherwise, you might start the webserver container but get a "web page
not available" error when you go to `docker`.
{% endcomment %}
For the `hello-world-nginx` example and others, Docker Desktop must be
running to get to the webserver on `http://localhost/`. Make sure that the
Docker whale is showing in the menu bar, and that you run the Docker commands in
a shell that is connected to the Docker Desktop Engine (not Engine from Toolbox). Otherwise, you might start the webserver container but get a "web page
not available" error when you go to `docker`.
@z

@x
### How to solve `port already allocated` errors
@y
{% comment %}
### How to solve `port already allocated` errors
{% endcomment %}
### How to solve `port already allocated` errors
@z

@x
If you see errors like `Bind for 0.0.0.0:8080 failed: port is already allocated`
or `listen tcp:0.0.0.0:8080: bind: address is already in use` ...
@y
{% comment %}
If you see errors like `Bind for 0.0.0.0:8080 failed: port is already allocated`
or `listen tcp:0.0.0.0:8080: bind: address is already in use` ...
{% endcomment %}
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
{% comment %}
These errors are often caused by some other software on Windows using those
ports. To discover the identity of this software, either use the `resmon.exe`
GUI and click "Network" and then "Listening Ports" or in a Powershell use
`netstat -aon | find /i "listening "` to discover the PID of the process
currently using the port (the PID is the number in the rightmost column). Decide
whether to shut the other process down, or to use a different port in your
docker app.
{% endcomment %}
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
{% comment %}
### Docker Desktop fails to start when anti-virus software is installed
{% endcomment %}
### Docker Desktop fails to start when anti-virus software is installed
@z

@x
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
@y
{% comment %}
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
{% endcomment %}
Some anti-virus software may be incompatible with Hyper-V and Microsoft
Windows 10 builds. The conflict
typically occurs after a Windows update and
manifests as an error response from the Docker daemon and a Docker Desktop start failure.
@z

@x
For a temporary workaround, uninstall the anti-virus software, or
explore other workarounds suggested on Docker Desktop forums.
@y
{% comment %}
For a temporary workaround, uninstall the anti-virus software, or
explore other workarounds suggested on Docker Desktop forums.
{% endcomment %}
For a temporary workaround, uninstall the anti-virus software, or
explore other workarounds suggested on Docker Desktop forums.
@z
