%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Declare default environment variables in a file
keywords: fig, composition, compose, docker, orchestration, environment, env file
title: Declare default environment variables in file
---
@y
---
description: Declare default environment variables in a file
keywords: fig, composition, compose, docker, orchestration, environment, env file
title: 環境変数のデフォルトをファイル内に定義する
---
@z

@x
Compose supports declaring default environment variables in an environment file
named `.env` placed in the project directory. Docker Compose versions earlier than `1.28`,
load the `.env` file from the current working directory, where the command is executed, or from the
project directory if this is explicitly set with the `--project-directory` option. This
inconsistency has been addressed starting with `+v1.28` by limiting the default `.env` file path
to the project directory. You can use the `--env-file` commandline option to override the default
`.env` and specify the path to a custom environment file.
@y
Compose では環境変数のデフォルトを定義しておくことができます。
これは`.env`という名前の環境ファイルに環境変数を定義するもので、プロジェクトディレクトリにおきます。
Docker Compose のバージョンが`1.28`よりも古ければ`.env`ファイルは、コマンドが実行されたカレントなワーキングディレクトリにあるものがロードされます。
あるいは`--project-directory`オプションが指定されていれば、そこに指定されたプロジェクトディレクトリから読み込まれます。
この不整合は、`v1.28`以降においてデフォルトの`.env`ファイルパスをプロジェクトディレクトリに置くことで解消されます。
コマンドラインオプション`--env-file`を利用すれば、デフォルトの`.env`をオーバーライドして、独自の環境ファイルへのパスを指定することができます。
@z

@x
The project directory is specified by the order of precedence:
@y
プロジェクトディレクトリは以下の順に定められます。
@z

@x
- `--project-directory` flag
- Folder of the first `--file` flag
- Current directory
@y
- `--project-directory`フラグ
- `--file`フラグが初めて指定された際のフォルダー
- カレントディレクトリ
@z

@x
## Syntax rules
@y
{: #syntax-rules }
## 文法
@z

@x
The following syntax rules apply to the `.env` file:
@y
以下に示す文法規則が`.env`ファイルに適用されます。
@z

@x
- Compose expects each line in an `env` file to be in `VAR=VAL` format.
- Lines beginning with `#` are processed as comments and ignored.
- Blank lines are ignored.
- There is no special handling of quotation marks. This means that
  **they are part of the VAL**.
@y
- Compose は`env`ファイル内の各行が`変数=値`という形式で書かれているものとして扱います。
- 先頭が`#`で始まる行は、コメント行となり無視されます。
- 空行は無視されます。
- 引用符は特別に扱われません。
  つまりそれは**値の一部として扱われます**。
@z

@x
## Compose file and CLI variables
@y
{: #compose-file-and-cli-variables }
## Compose ファイルと CLI 変数
@z

@x
The environment variables you define here are used for
[variable substitution](compose-file/compose-file-v3.md#variable-substitution)
in your Compose file, and can also be used to define the following
[CLI variables](reference/envvars.md):
@y
環境変数を定義すると Compose ファイル内では[変数置換](compose-file/compose-file-v3.md#variable-substitution) が行われます。
また以下の [CLI 変数](reference/envvars.md) の定義に利用することもできます。
@z

@x
- `COMPOSE_API_VERSION`
- `COMPOSE_CONVERT_WINDOWS_PATHS`
- `COMPOSE_FILE`
- `COMPOSE_HTTP_TIMEOUT`
- `COMPOSE_PROFILES`
- `COMPOSE_PROJECT_NAME`
- `COMPOSE_TLS_VERSION`
- `DOCKER_CERT_PATH`
- `DOCKER_HOST`
- `DOCKER_TLS_VERIFY`
@y
- `COMPOSE_API_VERSION`
- `COMPOSE_CONVERT_WINDOWS_PATHS`
- `COMPOSE_FILE`
- `COMPOSE_HTTP_TIMEOUT`
- `COMPOSE_PROFILES`
- `COMPOSE_PROJECT_NAME`
- `COMPOSE_TLS_VERSION`
- `DOCKER_CERT_PATH`
- `DOCKER_HOST`
- `DOCKER_TLS_VERIFY`
@z

@x
> **Notes**
>
> * Values present in the environment at runtime always override those defined
>   inside the `.env` file. Similarly, values passed via command-line arguments
>   take precedence as well.
> * Environment variables defined in the `.env` file are not automatically
>   visible inside containers. To set container-applicable environment variables,
>   follow the guidelines in the topic
>   [Environment variables in Compose](environment-variables.md), which
>   describes how to pass shell environment variables through to containers,
>   define environment variables in Compose files, and more.
@y
> **メモ**
>
> * 実行時に環境から得られる値は、常に`.env`ファイルにて定義された値を上書きします。
>   同じこととして、コマンドライン引数から与えられた値も、同様に優先され上書きされます。
>
> * `.env`ファイルにて定義された環境変数は、コンテナー内部では自動的に見えるものではありません。
>   コンテナーが認識できる環境変数として設定するには、[Compose における環境変数](environment-variables.md) に示されているガイドラインに従ってください。
>   そこでは、シェル環境変数をコンテナーに受け渡す方法や、Compose ファイル内での環境変数の定義方法などを説明しています。
@z

@x
## More Compose documentation
@y
{: #more-compose-documentation }
## その他の Compose ドキュメント
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [はじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
