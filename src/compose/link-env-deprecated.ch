%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose CLI reference
keywords: fig, composition, compose, docker, orchestration, cli, reference
redirect_from:
- /compose/env
title: Link environment variables (superseded)
notoc: true
---
@y
---
description: Compose CLI リファレンス
keywords: fig, composition, compose, docker, orchestration, cli, reference
redirect_from:
- /compose/env
title: リンク時の環境変数（機能修正）
notoc: true
---
@z

@x
> **Note**: Environment variables are no longer the recommended method for connecting to linked services. Instead, you should use the link name (by default, the name of the linked service) as the hostname to connect to. See the [docker-compose.yml documentation](compose-file/#links) for details.
>
> Environment variables are only populated if you're using the [legacy version 1 Compose file format](compose-file/compose-versioning.md#versioning).
@y
{% comment %}
> **Note**: Environment variables are no longer the recommended method for connecting to linked services. Instead, you should use the link name (by default, the name of the linked service) as the hostname to connect to. See the [docker-compose.yml documentation](compose-file/#links) for details.
>
> Environment variables are only populated if you're using the [legacy version 1 Compose file format](compose-file/compose-versioning.md#versioning).
{% endcomment %}
> **メモ**: リンクされているサービスに接続する方法として、環境変数を用いることは推奨されなくなりました。
> その代わりに、接続するホスト名としてリンク名（デフォルトはリンクされているサービス名）を用いてください。
> 詳しくは [docker-compose.yml ドキュメント](compose-file/#links) を参照してください。
>
> 環境変数は [かつての Compose ファイルフォーマットバージョン 1](compose-file/compose-versioning.md#versioning) においてのみ定義されます。
@z

@x
Compose uses [Docker links](../network/links.md)
to expose services' containers to one another. Each linked container injects a set of
environment variables, each of which begins with the uppercase name of the container.
@y
{% comment %}
Compose uses [Docker links](../network/links.md)
to expose services' containers to one another. Each linked container injects a set of
environment variables, each of which begins with the uppercase name of the container.
{% endcomment %}
Compose は [Docker links](../network/links.md) を利用して、サービスのコンテナーをその他のコンテナーに対して情報を公開します。
リンクされたコンテナーは複数の環境変数を提供します。
各環境変数は、コンテナー名を大文字にしたものが先頭につきます。
@z

@x
To see what environment variables are available to a service, run `docker-compose run SERVICE env`.
@y
{% comment %}
To see what environment variables are available to a service, run `docker-compose run SERVICE env`.
{% endcomment %}
サービスにおいて利用可能な環境変数を見るには、`docker-compose run SERVICE env` を実行します。
@z

@x
<b><i>name</i>\_PORT</b><br>
Full URL, such as `DB_PORT=tcp://172.17.0.5:5432`
@y
{% comment %}
<b><i>name</i>\_PORT</b><br>
Full URL, such as `DB_PORT=tcp://172.17.0.5:5432`
{% endcomment %}
<b><i>name</i>\_PORT</b><br>
完全な  URL。
たとえば `DB_PORT=tcp://172.17.0.5:5432`
@z

@x
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i></b><br>
Full URL, such as `DB_PORT_5432_TCP=tcp://172.17.0.5:5432`
@y
{% comment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i></b><br>
Full URL, such as `DB_PORT_5432_TCP=tcp://172.17.0.5:5432`
{% endcomment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i></b><br>
完全な URL。
たとえば `DB_PORT_5432_TCP=tcp://172.17.0.5:5432`
@z

@x
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_ADDR</b><br>
Container's IP address, such as `DB_PORT_5432_TCP_ADDR=172.17.0.5`
@y
{% comment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_ADDR</b><br>
Container's IP address, such as `DB_PORT_5432_TCP_ADDR=172.17.0.5`
{% endcomment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_ADDR</b><br>
コンテナーの IP アドレス。
たとえば `DB_PORT_5432_TCP_ADDR=172.17.0.5`
@z

@x
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PORT</b><br>
Exposed port number, such as `DB_PORT_5432_TCP_PORT=5432`
@y
{% comment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PORT</b><br>
Exposed port number, such as `DB_PORT_5432_TCP_PORT=5432`
{% endcomment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PORT</b><br>
公開されているポート番号。
たとえば `DB_PORT_5432_TCP_PORT=5432`
@z

@x
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PROTO</b><br>
Protocol (tcp or udp), such as `DB_PORT_5432_TCP_PROTO=tcp`
@y
{% comment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PROTO</b><br>
Protocol (tcp or udp), such as `DB_PORT_5432_TCP_PROTO=tcp`
{% endcomment %}
<b><i>name</i>\_PORT\_<i>num</i>\_<i>protocol</i>\_PROTO</b><br>
プロトコル（tcp または udp）。
たとえば `DB_PORT_5432_TCP_PROTO=tcp`
@z

@x
<b><i>name</i>\_NAME</b><br>
Fully qualified container name, such as `DB_1_NAME=/myapp_web_1/myapp_db_1`
@y
{% comment %}
<b><i>name</i>\_NAME</b><br>
Fully qualified container name, such as `DB_1_NAME=/myapp_web_1/myapp_db_1`
{% endcomment %}
<b><i>name</i>\_NAME</b><br>
完全修飾コンテナー名。
たとえば `DB_1_NAME=/myapp_web_1/myapp_db_1`
@z

@x
## Related information
@y
{% comment %}
## Related information
{% endcomment %}
## 関連情報
{: #related-information }
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
{% comment %}
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
{% endcomment %}
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [はじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
