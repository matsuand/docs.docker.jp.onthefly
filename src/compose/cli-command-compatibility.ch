%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose command compatibility with docker-compose
keywords: documentation, docs, docker, compose, containers
title: Compose command compatibility with docker-compose
---
@y
---
description: compose コマンドの docker-compose との互換性
keywords: documentation, docs, docker, compose, containers
title: compose コマンドの docker-compose との互換性
---
@z

@x
The `compose` command in the Docker CLI supports most of the `docker-compose` commands and flags. It is expected to be a drop-in replacement for `docker-compose`. 
@y
Docker CLI 内の`compose`コマンドは、`docker-compose`コマンドとそのフラグをほぼサポートします。
このコマンドは`docker-compose`と完全な互換性を持つものとしています。
@z

@x
If you see any Compose functionality that is not available in the `compose` command, create an issue in the [Compose](https://github.com/docker/compose/issues){:target="_blank" rel="noopener"
class="_"} GitHub repository, so we can prioritize it.
@y
Compose 機能の中で`compose`コマンドでは利用できないものを見つけた場合は、GitHub リポジトリ [Compose](https://github.com/docker/compose/issues){:target="_blank" rel="noopener" class="_"} に issue をあげてください。
優先度をあげて対応することができます。
@z

@x
## Commands or flags not yet implemented
@y
{: #commands-or-flags-not-yet-implemented }
## 未実装のコマンドまたはフラグ
@z

@x
The following commands have not been implemented yet, and maybe implemented at a later time.
Let us know if these commands are a higher priority for your use cases.
@y
以下に示すコマンドはまだ実装されていませんが、近いうちに実装される予定です。
これらのコマンドの利用が優先される場合にはお知らせください。
@z

@x
`compose build --memory`: This option is not yet supported by buildkit. The flag is currently supported, but is hidden to avoid breaking existing Compose usage. It does not have any effect.
@y
`compose build --memory`
このオプションはまだ buildkit によってサポートされていません。
このオプションは Compose においては今のところサポートされていますが、既存の Compose 利用に悪影響を及ぼさないように、このオプションは隠し機能とされています。
これを利用しても何の効果も発生しません。
@z

@x
## Flags that will not be implemented
@y
{: #flags-that-will-not-be-implemented }
## 実装されないフラグ
@z

@x
The list below includes the flags that we are not planning to support in Compose in the Docker CLI,
either because they are already deprecated in `docker-compose`, or because they are not relevant for Compose in the Docker CLI.
@y
以下に示すフラグ一覧では、Docker CLI における compose においてサポートする予定のないものを示します。
一部は`docker-compose`において、すでに非推奨となっているためです。
また Docker CLI における compose には不適当なものがあるためです。
@z

@x
* `compose ps --filter KEY-VALUE` Not relevant due to its complicated usage with the `service` command and also because it is not documented properly in `docker-compose`.
* `compose rm --all` Deprecated in docker-compose.
* `compose scale` Deprecated in docker-compose (use `compose up --scale` instead)
@y
* `compose ps --filter KEY-VALUE` `service`コマンドとともに利用するのが複雑であり`docker-compose`において説明が適切ではないため不適当。
* `compose rm --all` docker-compose において非推奨。
* `compose scale` docker-compose において非推奨。（代わりに`compose up --scale`を利用）
@z

@x
Global flags:
@y
グローバルフラグ
@z

@x
* `--compatibility` has been resignified Docker Compose V2. This now means that in the command running V2 will behave as V1 used to do.
  * One difference is in the word separator on container names. V1 used to use `_` as separator while V2 uses `-` to keep the names more hostname friendly. So when using `--compatibility` Docker 
    Compose should use `_` again. Just make sure to stick to one of them otherwise Docker Compose will not be able to recognize the container as an instance of the service.
@y
* `--compatibility`は Docker Compose V2 として再署名されました。
  これはつまり、それまで V1 として実行されていたコマンドが V2 として実行されるということです。
  * 違いの 1 つとして、コンテナー名の中での単語の区切り文字があります。
    V1 では区切り文字として`_`を使っていましたが、V2では`-`を使います。
    これによってホスト名と同じように扱いやすくなります。
    ただし`--compatibility`を利用する際には、Docker Compose は`_`を使うことになります。
    利用にあたってはどちらかに統一するようにしてください。
    そうしておかないと、Docker Compose がコンテナーをサービスのインスタンスとして識別できなくなります。
@z

@x
## Config command
@y
{: #config-command }
## config コマンド
@z

@x
The config command is intented to show the configuration used by Docker Commpose to run the actual project.
As we know, at some parts of the Compose file have a short and a long format. For example, the `ports` entry.
In the example below we can see the config command expanding the `ports` section:
@y
config コマンドは、Docker Compose によって起動されるプロジェクトの設定を表示させるものです。
すでに説明しているように、Compose ファイルには長い書式と短い書式が含まれます。
`ports`エントリーがその例です。
以下に示すのは`ports`セクションの構成部分です。
@z

@x
docker-compose.yml:
```
services:
  web:
    image: nginx
    ports:
      - 80:80
```
@y
docker-compose.yml が以下であるとします。
```
services:
  web:
    image: nginx
    ports:
      - 80:80
```
@z

@x
With `$ docker compose config` the output turns into:
```
services:
  web:
    image: nginx
    networks:
      default: null
    ports:
    - mode: ingress
      target: 80
      published: 80
      protocol: tcp
networks:
  default:
    name: workspace_default
```
@y
`$ docker compose config`を実行すると、その出力は以下となります。
```
services:
  web:
    image: nginx
    networks:
      default: null
    ports:
    - mode: ingress
      target: 80
      published: 80
      protocol: tcp
networks:
  default:
    name: workspace_default
```
@z

@x
The result above is a full size configuration of what will be used in by Docker Compose to run the project.
@y
上の出力結果は、Docker Compose によって起動されるプロジェクトの設定を、完全に記述して形になります。
@z
