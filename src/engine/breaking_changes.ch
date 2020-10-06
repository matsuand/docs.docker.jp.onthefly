%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
redirect_from:
- /engine/misc/breaking/
description: Breaking changes
keywords: docker, documentation, about, technology, breaking, incompatibilities
title: Breaking changes and incompatibilities
---
@y
---
redirect_from:
- /engine/misc/breaking/
description: Breaking changes
keywords: docker, documentation, about, technology, breaking, incompatibilities
title: 互換性を維持しない変更、非互換性
---
@z

@x
Every Engine release strives to be backward compatible with its predecessors,
and interface stability is always a priority at Docker.
@y
{% comment %}
Every Engine release strives to be backward compatible with its predecessors,
and interface stability is always a priority at Docker.
{% endcomment %}
Docker Engine の各リリースでは、前バージョンとの下位互換性を保つように努めています。
インターフェースを安定させることは Docker において常に最重要なことです。
@z

@x
In all cases, feature removal is communicated three releases
in advance and documented as part of the [deprecated features](deprecated.md)
page.
@y
{% comment %}
In all cases, feature removal is communicated three releases
in advance and documented as part of the [deprecated features](deprecated.md)
page.
{% endcomment %}
どのような場合でも将来的に削除する予定の機能は、前もって 3 リリースの期間は議論を継続し、[廃止機能](deprecated.md) において文書化しています。
@z

@x
The following list compiles any updates to Docker Engine that created
backwards-incompatibility for old versions of Docker tools.
@y
{% comment %}
The following list compiles any updates to Docker Engine that created
backwards-incompatibility for old versions of Docker tools.
{% endcomment %}
以下に示す一覧は、それまでの Docker ツール類との互換性がなくなった Docker Engine のアップデートについてまとめるものです。
@z

@x
> **Note**: In the case of your local environment, you should be updating your
  Docker Engine using [Docker Desktop for Mac](/docker-for-mac),
  [Docker Desktop for Windows](/docker-for-windows). That way all your tools stay
  in sync with Docker Engine.
@y
{% comment %}
> **Note**: In the case of your local environment, you should be updating your
  Docker Engine using [Docker Desktop for Mac](/docker-for-mac),
  [Docker Desktop for Windows](/docker-for-windows). That way all your tools stay
  in sync with Docker Engine.
{% endcomment %}
> **メモ**: お手元のローカル環境において [Docker Desktop for Mac](/docker-for-mac) や [Docker Desktop for Windows](/docker-for-windows) を利用している場合は、Docker Engine のアップデートが必要です。
  アップデートを行えば、各種ツールと Docker Engine を引き続き利用していくことができます。
@z

@x
## Engine 1.10
@y
## Engine 1.10
@z

@x
There were two breaking changes in the 1.10 release that affected
Registry and Docker Content Trust:
@y
{% comment %}
There were two breaking changes in the 1.10 release that affected
Registry and Docker Content Trust:
{% endcomment %}
1.10 のリリースにおいては、互換性を維持しない変更が 2 つ存在し、Registry と Docker コンテントトラストに影響を与えています。
@z

@x
**Registry**
@y
{% comment %}
**Registry**
{% endcomment %}
**Registry**
@z

@x
Registry 2.3 includes improvements to the image manifest that caused a
breaking change. Images pushed by Engine 1.10 to a Registry 2.3 cannot be
pulled by digest by older Engine versions. A `docker pull` that encounters this
situation returns the following error:
@y
{% comment %}
Registry 2.3 includes improvements to the image manifest that caused a
breaking change. Images pushed by Engine 1.10 to a Registry 2.3 cannot be
pulled by digest by older Engine versions. A `docker pull` that encounters this
situation returns the following error:
{% endcomment %}
Registry 2.3 においてはイメージマニフェストに対する変更が行われ、これは下位互換性のないものとなりました。
Engine 1.10 によって Registry 2.3 にプッシュされたイメージは、古い Engine バージョンを用いた場合には、ダイジェスト値を用いたプルができません。
`docker pull` がこの状況において実行されると、以下のようなエラーが返されます。
@z

@x
```none
 Error response from daemon: unsupported schema version 2 for tag TAGNAME
```
@y
{% comment %}
```none
 Error response from daemon: unsupported schema version 2 for tag TAGNAME
```
{% endcomment %}
```none
 Error response from daemon: unsupported schema version 2 for tag TAGNAME
 （デーモンからのエラー： タグ TAGNAME に対してスキーマバージョン 2 はサポートされません）
```
@z

@x
Docker Content Trust heavily relies on pull by digest. As a result, images
pushed from the Engine 1.10 CLI to a 2.3 Registry cannot be pulled by older
Engine CLIs (< 1.10) with Docker Content Trust enabled.
@y
{% comment %}
Docker Content Trust heavily relies on pull by digest. As a result, images
pushed from the Engine 1.10 CLI to a 2.3 Registry cannot be pulled by older
Engine CLIs (< 1.10) with Docker Content Trust enabled.
{% endcomment %}
Docker コンテントトラストは、ダイジェスト値によるイメージの取得機能に大きく依存しています。
したがって Engine 1.10 CLI から Registry 2.3 にプッシュされたイメージは、Docker コンテントトラストを有効にしていても、古いバージョンの Engine CLI （1.10 以前）ではプルすることはできません。
@z

@x
If you are using an older Registry version (< 2.3), this problem does not occur
with any version of the Engine CLI; push, pull, with and without content trust
work as you would expect.
@y
{% comment %}
If you are using an older Registry version (< 2.3), this problem does not occur
with any version of the Engine CLI; push, pull, with and without content trust
work as you would expect.
{% endcomment %}
かつての Registry バージョン（2.3 以前）を利用している場合は、Docker Engine CLI がどのバージョンであっても問題ありません。
プッシュやプルでも、また Docker コンテントトラストを利用するしないに関係なく、思いどおりに動くはずです。
@z

@x
**Docker Content Trust**
@y
{% comment %}
**Docker Content Trust**
{% endcomment %}
**Docker コンテントトラスト**
@z

@x
Engine older than the current 1.10 cannot pull images from repositories that
have enabled key delegation. Key delegation is a feature which requires a
manual action to enable.
@y
{% comment %}
Engine older than the current 1.10 cannot pull images from repositories that
have enabled key delegation. Key delegation is a feature which requires a
manual action to enable.
{% endcomment %}
現在の Docker Engine 1.10 よりも古いバージョンでは、認証鍵の委任機能を持っているレポジトリからのイメージ取得ができません。
認証鍵の委任を有効にするためには、手動での操作を必要とします。
@z
