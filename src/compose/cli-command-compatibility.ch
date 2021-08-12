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
The `compose` command in the Docker CLI supports most of the `docker-compose` commands and flags. It is expected to be a drop-in replacement for `docker-compose`. There are a few remaining flags that have yet to be implemented, and we are prioritizing these implementations based on usage metrics and user feedback.
@y
Docker CLI 内の`compose`コマンドは、`docker-compose`コマンドとそのフラグをほぼサポートします。
このコマンドは`docker-compose`と完全な互換性を持つものとしています。
まだ実装できていないフラグが残っているため、利用メトリックスやユーザーからのフィードバックに基づいて、実装の優先度をつけて進めていきます。
@z

@x
You can follow progress on the implementation of the remaining commands and flags in the  [Compose-CLI](https://github.com/docker/compose-cli/issues/1283){:target="_blank" rel="noopener" class="_"} GitHub repository.
@y
未実装のコマンドやフラグの実装状況に関しては、GitHub リポジトリ [Compose-CLI](https://github.com/docker/compose-cli/issues/1283){:target="_blank" rel="noopener" class="_"} において確認することができます。
@z

@x
If you see any Compose functionality that is not available in the `compose` command, create an issue in the [Compose-CLI](https://github.com/docker/compose-cli/issues){:target="_blank" rel="noopener" class="_"} GitHub repository so we can prioritize it.
@y
Compose 機能の中で`compose`コマンドでは利用できないものを見つけた場合は、GitHub リポジトリ [Compose-CLI](https://github.com/docker/compose-cli/issues){:target="_blank" rel="noopener" class="_"} に issue をあげてください。
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
* `compose --compatibility` Deprecated in docker-compose.
@y
* `compose --compatibility` docker-compose において非推奨。
@z
