%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose CLI reference
keywords: fig, composition, compose, docker, orchestration, cli, reference
title: Command-line completion
---
@y
---
description: Compose CLI リファレンス
keywords: fig, composition, compose, docker, orchestration, cli, reference
title: コマンドライン補完
---
@z

@x
Compose comes with [command completion](https://en.wikipedia.org/wiki/Command-line_completion)
for the bash and zsh shell.
@y
{% comment %}
Compose comes with [command completion](https://en.wikipedia.org/wiki/Command-line_completion)
for the bash and zsh shell.
{% endcomment %}
Compose には bash 用あるいは zsh 用の [コマンド補完](https://en.wikipedia.org/wiki/Command-line_completion)（command completion）が用意されています。
@z

@x
## Install command completion
@y
{% comment %}
## Install command completion
{% endcomment %}
## コマンド補完のインストール
{: #install-command-completion }
@z

@x
### Bash
@y
### Bash
@z

@x
Make sure bash completion is installed.
@y
{% comment %}
Make sure bash completion is installed.
{% endcomment %}
bash 補完がインストールされていることを確認します。
@z

@x
#### Linux
@y
#### Linux
@z

@x
1. On a current Linux OS (in a non-minimal installation), bash completion should be
available.
@y
{% comment %}
1. On a current Linux OS (in a non-minimal installation), bash completion should be
available.
{% endcomment %}
1. 利用している Linux OSであれば（最小インストールではない）、bash 補完が利用できるはずです。
@z

@x
2. Place the completion script in `/etc/bash_completion.d/`.
@y
{% comment %}
2. Place the completion script in `/etc/bash_completion.d/`.
{% endcomment %}
2.  補完スクリプトを `/etc/bash_completion.d/` に置きます。
@z

@x
    ```shell
    sudo curl -L https://raw.githubusercontent.com/docker/compose/{{site.compose_version}}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
    ```
@y
    ```shell
    sudo curl -L https://raw.githubusercontent.com/docker/compose/{{site.compose_version}}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
    ```
@z

@x
### Mac
@y
### Mac
@z

@x
##### Install via Homebrew
@y
{% comment %}
##### Install via Homebrew
{% endcomment %}
##### Homebrew によるインストール
{: #install-via-homebrew }
@z

@x
1. Install with `brew install bash-completion`.
2. After the installation, Brew displays the installation path. Make sure to place the completion script in the path.
@y
{% comment %}
1. Install with `brew install bash-completion`.
2. After the installation, Brew displays the installation path. Make sure to place the completion script in the path.
{% endcomment %}
1. `brew install bash-completion` によりインストールします。
2. インストール後に Brew がインストール先のパスを表示します。
   補完スクリプトをそのパスに置きます。
@z

@x
    For example, when running this command on Mac 10.13.2, place the completion script in `/usr/local/etc/bash_completion.d/`.
@y
    {% comment %}
    For example, when running this command on Mac 10.13.2, place the completion script in `/usr/local/etc/bash_completion.d/`.
    {% endcomment %}
    たとえば Mac 10.13.2 を利用している場合、補完スクリプトを `/usr/local/etc/bash_completion.d/` に置きます。
@z

@x
    ```shell
    sudo curl -L https://raw.githubusercontent.com/docker/compose/{{site.compose_version}}/contrib/completion/bash/docker-compose -o /usr/local/etc/bash_completion.d/docker-compose
    ```
@y
    ```shell
    sudo curl -L https://raw.githubusercontent.com/docker/compose/{{site.compose_version}}/contrib/completion/bash/docker-compose -o /usr/local/etc/bash_completion.d/docker-compose
    ```
@z

@x
3. Add the following to your `~/.bash_profile`:
@y
{% comment %}
3. Add the following to your `~/.bash_profile`:
{% endcomment %}
3. 以下を `~/.bash_profile` に追加します。
@z

@x
    ```shell
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    fi
    ```
@y
    ```shell
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    fi
    ```
@z

@x
4. You can source your `~/.bash_profile` or launch a new terminal to utilize
completion.
@y
{% comment %}
4. You can source your `~/.bash_profile` or launch a new terminal to utilize
completion.
{% endcomment %}
4. 補完を利用するため `~/.bash_profile` を source で取り込むか、あるいは新たな端末画面を起動します。
@z

@x
##### Install via MacPorts
@y
{% comment %}
##### Install via MacPorts
{% endcomment %}
##### MacPorts によるインストール
{: #install-via-macports }
@z

@x
1. Run `sudo port install bash-completion` to install bash completion.
@y
{% comment %}
1. Run `sudo port install bash-completion` to install bash completion.
{% endcomment %}
1. `sudo port install bash-completion` を実行して bash 補完をインストールします。
@z

@x
2. Add the following lines to `~/.bash_profile`:
@y
{% comment %}
2. Add the following lines to `~/.bash_profile`:
{% endcomment %}
2. 以下を `~/.bash_profile` に追加します。
@z

@x
    ```shell
    if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
    fi
    ```
@y
    ```shell
    if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
    fi
    ```
@z

@x
3. You can source your `~/.bash_profile` or launch a new terminal to utilize
completion.
@y
{% comment %}
3. You can source your `~/.bash_profile` or launch a new terminal to utilize
completion.
{% endcomment %}
3. 補完を利用するため `~/.bash_profile` を source で取り込むか、あるいは新たな端末画面を起動します。
@z

@x
### Zsh
@y
### Zsh
@z

@x
Make sure you have [installed `oh-my-zsh`](https://ohmyz.sh/) on your computer. 
@y
{% comment %}
Make sure you have [installed `oh-my-zsh`](https://ohmyz.sh/) on your computer. 
{% endcomment %}
[`oh-my-zsh`](https://ohmyz.sh/) がインストールされているかどうかを確認します。
@z

@x
#### With oh-my-zsh shell
@y
{% comment %}
#### With oh-my-zsh shell
{% endcomment %}
#### oh-my-zsh シェルがある場合
{: #with-oh-my-zsh-shell }
@z

@x
Add `docker` and `docker-compose` to the plugins list in `~/.zshrc` to run autocompletion within the oh-my-zsh shell. In the following example, `...` represent other Zsh plugins you may have installed.
@y
{% comment %}
Add `docker` and `docker-compose` to the plugins list in `~/.zshrc` to run autocompletion within the oh-my-zsh shell. In the following example, `...` represent other Zsh plugins you may have installed.
{% endcomment %}
`~/.zshrc` 内のプラグインリストに `docker` と `docker-compose` を加えます。
これにより oh-my-zsh シェル内での自動補完機能を有効にします。
以下の例において `...` の部分は、以前からインストールされている Zsh プラグインを表わします。
@z

@x
```shell
plugins=(... docker docker-compose
)
 ```
@y
```shell
plugins=(... docker docker-compose
)
 ```
@z

@x
#### Without oh-my-zsh shell
@y
{% comment %}
#### Without oh-my-zsh shell
{% endcomment %}
#### oh-my-zsh シェルがない場合
{: #without-oh-my-zsh-shell }
@z

@x
1. Place the completion script in your `/path/to/zsh/completion` (typically `~/.zsh/completion/`):
@y
{% comment %}
1. Place the completion script in your `/path/to/zsh/completion` (typically `~/.zsh/completion/`):
{% endcomment %}
1.  `/path/to/zsh/completion`（通常は `~/.zsh/completion/`）に補完スクリプトを置きます。
@z

@x
    ```shell
    $ mkdir -p ~/.zsh/completion
    $ curl -L https://raw.githubusercontent.com/docker/compose/{{site.compose_version}}/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
    ```
@y
    ```shell
    $ mkdir -p ~/.zsh/completion
    $ curl -L https://raw.githubusercontent.com/docker/compose/{{site.compose_version}}/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
    ```
@z

@x
2. Include the directory in your `$fpath` by adding in `~/.zshrc`:
@y
{% comment %}
2. Include the directory in your `$fpath` by adding in `~/.zshrc`:
{% endcomment %}
2. `~/.zshrc` 内にて `$fpath` にディレクトリを追加します。
@z

@x
    ```shell
    fpath=(~/.zsh/completion $fpath)
    ```
@y
    ```shell
    fpath=(~/.zsh/completion $fpath)
    ```
@z

@x
3. Make sure `compinit` is loaded or do it by adding in `~/.zshrc`:
@y
{% comment %}
3. Make sure `compinit` is loaded or do it by adding in `~/.zshrc`:
{% endcomment %}
3. `compinit` がロードされているか、あるいは `~/.zshrc` 内への追加によりそれが行われるかを確認します。
@z

@x
    ```shell
    autoload -Uz compinit && compinit -i
    ```
@y
    ```shell
    autoload -Uz compinit && compinit -i
    ```
@z

@x
4. Then reload your shell:
@y
{% comment %}
4. Then reload your shell:
{% endcomment %}
4. その後にシェルをリロードします。
@z

@x
    ```shell
    exec $SHELL -l
    ```
@y
    ```shell
    exec $SHELL -l
    ```
@z

@x
## Available completions
@y
{% comment %}
## Available completions
{% endcomment %}
## 利用できる補完機能
{: #available-completions }
@z

@x
Depending on what you typed on the command line so far, it completes:
@y
{% comment %}
Depending on what you typed on the command line so far, it completes:
{% endcomment %}
コマンドラインにどこまで入力しているかによって、補完される内容はさまざまです。
@z

@x
 - available docker-compose commands
 - options that are available for a particular command
 - service names that make sense in a given context, such as services with running or stopped instances or services based on images vs. services based on Dockerfiles. For `docker-compose scale`, completed service names automatically have "=" appended.
 - arguments for selected options. For example, `docker-compose kill -s` completes some signals like SIGHUP and SIGUSR1.
@y
{% comment %}
 - available docker-compose commands
 - options that are available for a particular command
 - service names that make sense in a given context, such as services with running or stopped instances or services based on images vs. services based on Dockerfiles. For `docker-compose scale`, completed service names automatically have "=" appended.
 - arguments for selected options. For example, `docker-compose kill -s` completes some signals like SIGHUP and SIGUSR1.
{% endcomment %}
 - 利用可能な docker-compose コマンド。
 - 特定のコマンドにて利用可能なオプション。
 - 指定されているコンテキストにおいて用いられるサービス名。
   たとえば実行中サービス、停止中のインスタンス、イメージに基づくサービス、Dockerfile に基づくサービスなどです。
   `docker-compose scale` では、サービス名が補完されると自動的に "=" が追加されます。
 - 指定されたオプションへの引数。
   たとえば `docker-compose kill -s` に対して、シグナル名、たとえば SIGHUP や SIGUSR1 が補完されます。
@z

@x
Enjoy working with Compose faster and with fewer typos!
@y
{% comment %}
Enjoy working with Compose faster and with fewer typos!
{% endcomment %}
Compose での作業を、入力は速くミスは少なく！
@z

@x
## Compose documentation
@y
{% comment %}
## Compose documentation
{% endcomment %}
## Compose ドキュメント
{: #compose-documentation }
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
{% comment %}
- [User guide](index.md)
- [Installing Compose](install.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
{% endcomment %}
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
