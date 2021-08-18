%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to install Docker Machine
keywords: machine, orchestration, install, installation, docker, documentation, uninstall Docker Machine, uninstall
title: Install Docker Machine
---
@y
---
description: Docker Machine のインストール方法
keywords: machine, orchestration, install, installation, docker, documentation, uninstall Docker Machine, uninstall
title: Docker Machine のインストール
---
@z

@x
Install Docker Machine binaries by following the instructions in the following section. You can find the latest
versions of the binaries on the [docker/machine release
page](https://github.com/docker/machine/releases/){: target="_blank" rel="noopener" class="_" }
on GitHub.
@y
Docker Machine のバイナリをインストールしたい場合は、次の節で示す手順に従います。
GitHub 上の [docker/machine リリースページ](https://github.com/docker/machine/releases/){: target="_blank" rel="noopener" class="_" }に、最新のバイナリバージョンがあります。
@z

@x
## Install Docker Machine
@y
{: #install-docker-machine }
## Docker Machine のインストール
@z

@x
1.  Install [Docker](../engine/install/index.md){: target="_blank" rel="noopener" class="_" }.
@y
1.  [Docker](../engine/installation/index.md){: target="_blank" rel="noopener" class="_" } をインストールします。
@z

@x
2.  Download the Docker Machine binary and extract it to your PATH.
@y
2.  Docker Machine のバイナリをダウンロードして実行パスに展開します。
@z

@x
    If you are running **macOS**:
@y
    **macOS** を利用している場合:
@z

@x
    ```console
    $ base=https://github.com/docker/machine/releases/download/v{{site.machine_version}} \
      && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/usr/local/bin/docker-machine \
      && chmod +x /usr/local/bin/docker-machine
    ```
@y
    ```console
    $ base=https://github.com/docker/machine/releases/download/v{{site.machine_version}} \
      && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/usr/local/bin/docker-machine \
      && chmod +x /usr/local/bin/docker-machine
    ```
@z

@x
    If you are running **Linux**:
@y
    **Linux** を利用している場合:
@z

@x
    ```console
    $ base=https://github.com/docker/machine/releases/download/v{{site.machine_version}} \
      && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine \
      && sudo mv /tmp/docker-machine /usr/local/bin/docker-machine \
      && chmod +x /usr/local/bin/docker-machine
    ```
@y
    ```console
    $ base=https://github.com/docker/machine/releases/download/v{{site.machine_version}} \
      && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine \
      && sudo mv /tmp/docker-machine /usr/local/bin/docker-machine \
      && chmod +x /usr/local/bin/docker-machine
    ```
@z

@x
    If you are running **Windows** with [Git BASH](https://git-for-windows.github.io/){: target="_blank" rel="noopener" class="_"}:
@y
    **Windows** 上において [Git BASH](https://git-for-windows.github.io/){: target="_blank" rel="noopener" class="_"} を利用している場合:
@z

@x
    ```console
    $ base=https://github.com/docker/machine/releases/download/v{{site.machine_version}} \
      && mkdir -p "$HOME/bin" \
      && curl -L $base/docker-machine-Windows-x86_64.exe > "$HOME/bin/docker-machine.exe" \
      && chmod +x "$HOME/bin/docker-machine.exe"
    ```
@y
    ```console
    $ base=https://github.com/docker/machine/releases/download/v{{site.machine_version}} \
      && mkdir -p "$HOME/bin" \
      && curl -L $base/docker-machine-Windows-x86_64.exe > "$HOME/bin/docker-machine.exe" \
      && chmod +x "$HOME/bin/docker-machine.exe"
    ```
@z

@x
    > The above command works on Windows only if you use a
    terminal emulator such as [Git BASH](https://git-for-windows.github.io/){: target="_blank" rel="noopener" class="_"}, which supports Linux commands like `chmod`.
    {: .important}
@y
    > 上のコマンドは Windows 上において実行していますが、これができるのは [Git BASH](https://git-for-windows.github.io/){: target="_blank" rel="noopener" class="_"} などを利用して、`chmod`といった Linux コマンドをサポートしている端末エミュレーターを使っているからです。
    {: .important}
@z

@x
    Otherwise, download one of the releases from the [docker/machine release
    page](https://github.com/docker/machine/releases/){: target="_blank" rel="noopener" class="_" } directly.
@y
    上記以外は、[docker/machine リリースページ](https://github.com/docker/machine/releases/){: target="_blank" rel="noopener" class="_" } からバイナリリリースを直接ダウンロードしてください。
@z

@x
3.  Check the installation by displaying the Machine version:
@y
3.  インストール後の確認として Machine のバージョンを表示してみます。
@z

@x
    ```console
    $ docker-machine version
    docker-machine version {{site.machine_version}}, build 9371605
    ```
@y
    ```console
    $ docker-machine version
    docker-machine version {{site.machine_version}}, build 9371605
    ```
@z

@x
## Install bash completion scripts
@y
{: #install-bash-completion-scripts }
## bash 補完スクリプトのインストール
@z

@x
The Machine repository supplies several `bash` scripts that add features such
as:
@y
Machine リポジトリには便利な`bash`スクリプトがあり、以下のような機能を利用できます。
@z

@x
-   command completion
-   a function that displays the active machine in your shell prompt
-   a function wrapper that adds a `docker-machine use` subcommand to switch the
    active machine
@y
-   コマンド補完
-   シェルプロンプト内にアクティブなマシンを表示する機能
-   アクティブマシンを切り替えるサブコマンド`docker-machine use`を実現するラッパー
@z

@x
Confirm the version and save scripts to `/etc/bash_completion.d` or
`/usr/local/etc/bash_completion.d`:
@y
スクリプトのバージョンを確認し保存します。
保存先は`/etc/bash_completion.d`または`/usr/local/etc/bash_completion.d`とします。
@z

@x
```bash
base=https://raw.githubusercontent.com/docker/machine/v{{site.machine_version}}
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
do
  sudo wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d
done
```
@y
```bash
base=https://raw.githubusercontent.com/docker/machine/v{{site.machine_version}}
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
do
  sudo wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d
done
```
@z

@x
Then you need to run `source
/etc/bash_completion.d/docker-machine-prompt.bash` in your bash
terminal to tell your setup where it can find the file
`docker-machine-prompt.bash` that you previously downloaded.
@y
bash 端末内で`source /etc/bash_completion.d/docker-machine-prompt.bash`を実行します。
これにより、ダウンロードした`docker-machine-prompt.bash`がどこにあるかを設定します。
@z

@x
To enable the `docker-machine` shell prompt, add
`$(__docker_machine_ps1)` to your `PS1` setting in `~/.bashrc`.
@y
`docker-machine`のシェルプロンプトを有効にするために、`~/.bashrc`内の`PS1`を`$(__docker_machine_ps1)`とします。
@z

@x
```bash
PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '
```
@y
```bash
PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '
```
@z

@x
You can find additional documentation in the comments at the [top of
each
script](https://github.com/docker/machine/tree/master/contrib/completion/bash){:
target="_blank" rel="noopener" class="_"}.
@y
詳細な情報は[各スクリプトの上段](https://github.com/docker/machine/tree/master/contrib/completion/bash){:
target="_blank" rel="noopener" class="_"}にコメントとして記述されています。
@z

@x
## How to uninstall Docker Machine
@y
{: #how-to-uninstall-docker-machine }
## Docker Machine のアンインストール
@z

@x
To uninstall Docker Machine:
@y
Docker Machine のアンインストールは以下のようにします。
@z

@x
*  Optionally, remove the machines you created.
@y
*  必要に応じて生成済のマシンを削除します。
@z

@x
   To remove each machine individually: `docker-machine rm <machine-name>`
@y
   各マシンを削除するには、それぞれに対して以下を実行します。`docker-machine rm <マシン名>`
@z

@x
   To remove all machines: `docker-machine rm -f $(docker-machine ls
   -q)` (you might need to use `-force` on Windows).
@y
   マシンをすべて削除するには`docker-machine rm -f $(docker-machine ls -q)`を実行します。
   （Windows では`-force`オプションが必要になるかもしれません。）
@z

@x
   Removing machines is an optional step because there are cases where
   you might want to save and migrate existing machines to a
   [Docker for Mac](../desktop/mac/index.md) or
   [Docker Desktop for Windows](../desktop/windows/index.md) environment,
   for example.
@y
   マシンを削除するのは任意の作業です。
   それはたとえば [Docker for Mac](../desktop/mac/index.md) または [Docker Desktop for Windows](../desktop/windows/index.md) 環境向けに、既存マシンを移行して利用したい場合もあるからです。
@z

@x
*  Remove the executable: `rm $(which docker-machine)`
@y
*  実行モジュールを削除します。
   `rm $(which docker-machine)`
@z

@x
> **Note**
>
> As a point of information, the `config.json`, certificates,
> and other data related to each virtual machine created by `docker-machine`
> is stored in `~/.docker/machine/machines/` on Mac and Linux and in
> `~\.docker\machine\machines\` on Windows. We recommend that you do not edit or
> remove those files directly as this only affects information for the Docker
> CLI, not the actual VMs, regardless of whether they are local or on remote
> servers.
@y
>**メモ**
>
> `config.json`、認証情報といった`docker-machine`により生成された各仮想環境に関連するデータは、Mac や Linux の場合`~/.docker/machine/machines/`、Windows の場合`~\.docker\machine\machines\`に保存されています。このようなデータは直接編集したり削除したりしないことをお勧めします。
> これは Docker CLI に関する情報にのみ影響します。
> VM に対しては、それがローカルでもリモートでも影響しません。
@z

@x
## Where to go next
@y
{: #where-to-go-next }
## 次に読むものは
@z

@x
-  [Docker Machine overview](index.md)
-  Create and run a Docker host on your [local system using virtualization](get-started.md)
-  Provision multiple Docker hosts [on your cloud provider](get-started-cloud.md)
-  [Docker Machine driver reference](drivers/index.md)
-  [Docker Machine subcommand reference](reference/index.md)
@y
-  [Docker Machine 概要](index.md)
-  [仮想環境を用いてローカルシステム上](get-started.md) に Docker ホストを生成して実行
-  [クラウドプロバイダー](get-started-cloud.md) 上に複数の Docker ホストを実現
-  [Docker Machine ドライバーリファレンス](drivers/index.md)
-  [Docker Machine サブコマンドリファレンス](reference/index.md)
@z
