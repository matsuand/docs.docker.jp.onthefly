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
named `.env` placed in the folder where the `docker-compose` command is executed
*(current working directory)*.
@y
Compose では環境変数のデフォルトを定義しておくことができます。
これは `.env` という名前の環境ファイルに環境変数を定義するもので、このファイルを
`docker-compose` コマンドが実行されるディレクトリ（*カレントワーキングディレクトリ*）に置きます。
@z

@x
## Syntax rules
@y
## 文法
{: #syntax-rules }
@z

@x
These syntax rules apply to the `.env` file:
@y
`.env` ファイルに適用される文法は以下のとおりです。
@z

@x
* Compose expects each line in an `env` file to be in `VAR=VAL` format.
* Lines beginning with `#` are processed as comments and ignored.
* Blank lines are ignored.
* There is no special handling of quotation marks. This means that
  **they are part of the VAL**.
@y
* Compose は `env` ファイル内の各行が `変数=値` という形式で書かれているものとして扱います。
* 先頭が `#` で始まる行は、コメント行となり無視されます。
* 空行は無視されます。
* 引用符は特別に扱われません。
  つまりそれは**値の一部として扱われます**。
@z

@x
## Compose file and CLI variables
@y
## Compose ファイルと CLI 変数
{: #compose-file-and-cli-variables }
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
- `COMPOSE_TLS_VERSION`
- `COMPOSE_PROJECT_NAME`
- `DOCKER_CERT_PATH`
- `DOCKER_HOST`
- `DOCKER_TLS_VERIFY`
@y
- `COMPOSE_API_VERSION`
- `COMPOSE_CONVERT_WINDOWS_PATHS`
- `COMPOSE_FILE`
- `COMPOSE_HTTP_TIMEOUT`
- `COMPOSE_TLS_VERSION`
- `COMPOSE_PROJECT_NAME`
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
> * 実行時に環境から得られる値は、常に `.env` ファイルにて定義された値を上書きします。
>   同じこととして、コマンドライン引数から与えられた値も、同様に優先され上書きされます。
>
> * `.env` ファイルにて定義された環境変数は、コンテナー内部では自動的に見えるものではありません。
>   コンテナーが認識できる環境変数として設定するには、[Compose における環境変数](environment-variables.md) に示されているガイドラインに従ってください。
>   そこでは、シェル環境変数をコンテナーに受け渡す方法や、Compose ファイル内での環境変数の定義方法などを説明しています。
@z

@x
## More Compose documentation
@y
## その他の Compose ドキュメント
{: #more-compose-documentation }
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
