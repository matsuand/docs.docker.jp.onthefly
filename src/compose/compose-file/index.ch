%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose file reference
keywords: fig, composition, compose, docker
redirect_from:
- /compose/yml
- /compose/compose-file/compose-file-v1/
title: Compose file
toc_max: 4
toc_min: 1
---
@y
---
description: Compose ファイルリファレンス
keywords: fig, composition, compose, docker
redirect_from:
- /compose/yml
- /compose/compose-file/compose-file-v1/
title: Compose ファイル
toc_max: 4
toc_min: 1
---
@z

@x
## Reference and guidelines
@y
{: #reference-and-guidelines }
## リファレンスとガイドライン
@z

@x
These topics describe the Docker Compose implementation of the Compose format.
Docker Compose **1.27.0+** implements the format defined by the [Compose Specification](https://github.com/compose-spec/compose-spec/blob/master/spec.md). Previous Docker Compose versions have support for several Compose file formats – 2, 2.x, and 3.x. The Compose specification is an unified 2.x and 3.x file format, aggregating properties across these formats.
@y
これらのトピックにおいては Docker Compose フォーマットに基づく Docker Compose の実装を示します。
Docker Compose **1.27.0 以降** では、[Compose 仕様](https://github.com/compose-spec/compose-spec/blob/master/spec.md) に定義されたフォーマットを実装しています。
それ以前の Docker Compose バージョンは Compose ファイルフォーマット 2、2.x、3.x をサポートします。
Compose 仕様はファイルフォーマット 2.x と 3.x を統合したものであり、両フォーマットにおけるプロパティをまとめています。
@z

@x
## Compose and Docker compatibility matrix
@y
{: #compose-and-docker-compatibility-matrix }
## Compose と Docker の互換性マトリックス
@z

@x
There are several versions of the Compose file format – 2, 2.x, and 3.x. The
table below provides a snapshot of various versions. For full details on what each version includes and
how to upgrade, see **[About versions and upgrading](compose-versioning.md)**.
@y
Compose ファイルフォーマットは 2、2.x、3.x と複数バージョンがあります。
以下に示す表においてこれをわかりやすく示します。
各バージョンに含まれる内容やアップグレード方法についての詳細は **[バージョンとアップグレード](compose-versioning.md)** を参照してください。
@z

@x
{% include content/compose-matrix.md %}
@y
{% include content/compose-matrix.md %}
@z

@x
## Compose documentation
@y
{: #compose-documentation }
## Compose ドキュメント
@z

@x
- [User guide](../index.md)
- [Installing Compose](../install.md)
- [Compose file versions and upgrading](compose-versioning.md)
- [Sample apps with Compose](../samples-for-compose.md)
- [Enabling GPU access with Compose](../gpu-support.md)
- [Command line reference](../reference/index.md)
@y
- [ユーザーガイド](../index.md)
- [Compose のインストール](../install.md)
- [Compose ファイルのバージョンとアップグレード](compose-versioning.md)
- [Compose を使ったサンプルアプリ](../samples-for-compose.md)
- [Compose を使った GPU アクセス](../gpu-support.md)
- [コマンドラインリファレンス](../reference/index.md)
@z
