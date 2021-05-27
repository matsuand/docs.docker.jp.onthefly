%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!-- This file is included in Docker Engine - Community or EE installation docs for Linux. -->
@y
<!-- This file is included in Docker Engine - Community or EE installation docs for Linux. -->
@z

@x
### Install using the convenience script
@y
{: #install-using-the-convenience-script }
### 便利スクリプトを使ったインストール
@z

@x
Docker provides a convenience script at [get.docker.com](https://get.docker.com/)
to install Docker into development environments quickly and non-interactively.
The convenience script is not recommended for production environments, but can be
used as an example to create a provisioning script that is tailored to your needs.
Also refer to the [install using the repository](#install-using-the-repository)
steps to learn about installation steps to install using the package repository.
The source code for the script is open source, and can be found in the
[`docker-install` repository on GitHub](https://github.com/docker/docker-install){:target="_blank" rel="noopener" class="_"}.
@y
Docker では [get.docker.com](https://get.docker.com/) において便利なスクリプトを提供しています。
これは Docker を開発マシンに対話形式をとらずにすばやくインストールするものです。
このスクリプトを本番環境において利用することはお勧めしませんが、環境に適したプロビジョニングを行うサンプルとして活用することはできます。
また [リポジトリを利用したインストール](#install-using-the-repository) における作業手順に従うことで、パッケージリポジトリを利用したインストール手順を身につけることができます。
このスクリプトのソースコードはオープンソースであり、[GitHub 上の`docker-install`リポジトリ](https://github.com/docker/docker-install){:target="_blank" rel="noopener" class="_"} から入手可能です。
@z

@x
Always examine scripts downloaded from the internet before running them locally.
Before installing, make yourself familiar with potential risks and limitations
of the convenience script:
{:.warning}
@y
インターネットからスクリプトをダウンロードしたら、まず内容を十分確認してからローカル実行してください。
インストールにあたっては、この便利スクリプトの潜在的リスクや制限について、よく理解してください。
{:.warning}
@z

@x
- The script requires `root` or `sudo` privileges to run.
- The script attempts to detect your Linux distribution and version and
  configure your package management system for you, and does not allow you to
  customize most installation parameters.
- The script installs dependencies and recommendations without asking for
  confirmation. This may install a large number of packages, depending on the
  current configuration of your host machine.
- By default, the script installs the latest stable release of Docker, containerd,
  and runc. When using this script to provision a machine, this may result in
  unexpected major version upgrades of Docker. Always test (major) upgrades in
  a test environment before deploying to your production systems.
- The script is not designed to upgrade an existing Docker installation. When
  using the script to update an existing installation, dependencies may not be
  updated to the expected version, causing outdated versions to be used.
@y
- スクリプトを実行するには`root`権限か`sudo`が必要です。
- スクリプトは自動的に情報取得を行い、利用している Linux ディストリビューション、そのバージョン、そしてパッケージ管理システムの設定を行います。
  なおこのスクリプトは、インストール時にパラメーターを受け渡すような設定はできないものになっています。
- スクリプトは依存パッケージや推奨パッケージをすべてインストールします。
  その際にはインストールして良いかどうかを問いません。
  したがって相当数のパッケージがインストールされることもあります。
  これはホストマシンのその時点での設定によります。
- このスクリプトはデフォルトでは、最新版の Docker、containerd、runc をインストールします。
  このスクリプトを使ってマシンをプロビジョニングした場合、Docker のメジャーバージョンへのアップグレードにより、予期しない結果を引き起こすことがあります。
  本番環境へのデプロイを行う際には、必ず (メジャーバージョンへの) アップグレードをテスト環境においてテストしておいてください。
- このスクリプトは、既にインストールされている Docker をアップグレードするように設計されていません。
  このスクリプトを利用して既存インストールをアップデートする際には、依存パッケージが思いどおりにアップデートされない場合があります。
  それによって古いバージョンのまま利用する状況となる場合があります。
@z

@x
> Tip: preview script steps before running
>
> You can run the script with the `DRY_RUN=1` option to learn what steps the
> script will execute during installation:
>
> ```console
> $ curl -fsSL https://get.docker.com -o get-docker.sh
> $ DRY_RUN=1 sh ./get-docker.sh
> ```
@y
> ヒント：  スクリプト実行前のインストールステップ確認
>
> 本スクリプトの実行にあたって`DRY_RUN=1`オプションを指定すると、このスクリプトのインストールステップを確認することができます。
>
> ```console
> $ curl -fsSL https://get.docker.com -o get-docker.sh
> $ DRY_RUN=1 sh ./get-docker.sh
> ```
@z

@x
This example downloads the script from [get.docker.com](https://get.docker.com/)
and runs it to install the latest stable release of Docker on Linux:
@y
以下は、このスクリプトを [get.docker.com](https://get.docker.com/) からダウンロードして実行することで、Linux 上に最新安定版をインストールする例です。
@z

@x
```console
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
Executing docker install script, commit: 7cae5f8b0decc17d6571f9f52eb840fbc13b2737
<...>
```
@y
```console
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
Executing docker install script, commit: 7cae5f8b0decc17d6571f9f52eb840fbc13b2737
<...>
```
@z

@x
Docker is installed. The `docker` service starts automatically on Debian based
distributions. On `RPM` based distributions, such as CentOS or Fedora, you need
to start it manually using the appropriate `systemctl` or `service` command.
As the message indicates, non-root users cannot run Docker commands by default.
@y
上により Docker がインストールされます。
Debian ベースのディストリビューションでは Docker が自動的に開始されます。
`RPM`ベースの場合は手動での実行が必要となるため、 `systemctl`か`service`のいずれか適当なものを実行します。
上の出力メッセージに示されているように、デフォルトでは非 root ユーザーによる Docker コマンド実行はできません。
@z

@x
> **Use Docker as a non-privileged user, or install in rootless mode?**
>
> The installation script requires `root` or `sudo` privileges to install and
> use Docker. If you want to grant non-root users access to Docker, refer to the
> [post-installation steps for Linux](/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user).
> Docker can also be installed without `root` privileges, or configured to run
> in rootless mode. For instructions on running Docker in rootless mode, refer to
> [run the Docker daemon as a non-root user (rootless mode)](/engine/security/rootless/).
@y
> **非特権ユーザーでの Docker 利用、rootless モードでのインストール？**
>
> このインストールスクリプトでは、Docker をインストールして利用するために`root`あるいは`sudo`を用いた権限が必要です。
> 非 root ユーザーに Docker の利用を許可する場合は、[Linux インストール後の作業](/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) を参照してください。
> Docker は`root`権限がなくてもインストールできます。
> つまり rootless モードにより実行することができます。
> rootless モードにより Docker を実行する手順については [root ユーザー以外による Docker デーモン起動（rootless モード）]({{ site.baseurl }}/engine/security/rootless/) を参照してください。
@z

@x
#### Install pre-releases
@y
{: #install-pre-releases }
#### プレリリース版のインストール
@z

@x
Docker also provides a convenience script at [test.docker.com](https://test.docker.com/)
to install pre-releases of Docker on Linux. This script is equivalent to the
script at `get.docker.com`, but configures your package manager to enable the
"test" channel from our package repository, which includes both stable and
pre-releases (beta versions, release-candidates) of Docker. Use this script to
get early access to new releases, and to evaluate them in a testing environment
before they are released as stable.
@y
Docker ではこの便利スクリプトを [test.docker.com](https://test.docker.com/) からも提供しています。
これを使って Linux 上にプレリリース版の Docker をインストールできます。
このスクリプトは`get.docker.com`から入手するものと同等ですが、パッケージリポジトリ内の「テスト」チャネルから、パッケージマネージャーがインストールするものとして設定されています。
このスクリプトには Docker の安定版とプレリリース版（ベータ版、リリース候補版）が含まれています。
このスクリプトを利用すれば、新規リリース機能をいち早く利用できます。
またそういった機能が安定版として提供されるよりも前に、テスト環境において評価することができます。
@z

@x
To install the latest version of Docker on Linux from the "test" channel, run:
@y
Linux への Docker 最新版のインストールを「テスト」チャネルから行うには、以下を実行します。
@z

@x
```console
$ curl -fsSL https://test.docker.com -o test-docker.sh
$ sudo sh test-docker.sh
<...>
```
@y
```console
$ curl -fsSL https://test.docker.com -o test-docker.sh
$ sudo sh test-docker.sh
<...>
```
@z

@x
#### Upgrade Docker after using the convenience script
@y
{: #upgrade-docker-after-using-the-convenience-script }
#### 便利スクリプトを使った後の Docker のアップグレード
@z

@x
If you installed Docker using the convenience script, you should upgrade Docker
using your package manager directly. There is no advantage to re-running the
convenience script, and it can cause issues if it attempts to re-add
repositories which have already been added to the host machine.
@y
便利スクリプトを使って Docker をインストールした場合、Docker のアップグレードはパッケージマネージャーを直接使って行ってください。
便利スクリプトは再実行する意味はありません。
ホストマシンにリポジトリが追加されているところに、このスクリプトを再実行したとすると、そのリポジトリを再度追加してしまうため、問題になることがあります。
@z
