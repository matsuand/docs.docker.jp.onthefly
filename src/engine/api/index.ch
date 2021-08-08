%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Develop with Docker Engine API
description: Using Docker APIs to automate Docker tasks in your language of choice
keywords: developing, api
redirect_from:
- /engine/reference/api/
- /engine/reference/api/docker_remote_api/
- /reference/api/
- /reference/api/docker_remote_api/
- /reference/api/docker_remote_api_v1.0/
- /reference/api/docker_remote_api_v1.1/
- /reference/api/docker_remote_api_v1.2/
- /reference/api/docker_remote_api_v1.3/
- /reference/api/docker_remote_api_v1.4/
- /reference/api/docker_remote_api_v1.5/
- /reference/api/docker_remote_api_v1.6/
- /reference/api/docker_remote_api_v1.7/
- /reference/api/docker_remote_api_v1.8/
- /reference/api/docker_remote_api_v1.9/
- /reference/api/docker_remote_api_v1.10/
- /reference/api/docker_remote_api_v1.11/
- /reference/api/docker_remote_api_v1.12/
- /reference/api/docker_remote_api_v1.13/
- /reference/api/docker_remote_api_v1.14/
- /reference/api/docker_remote_api_v1.15/
- /reference/api/docker_remote_api_v1.16/
- /reference/api/docker_remote_api_v1.17/
---
@y
---
title: Docker Engine API を用いた開発
description: Using Docker APIs to automate Docker tasks in your language of choice
keywords: developing, api
redirect_from:
- /engine/reference/api/
- /engine/reference/api/docker_remote_api/
- /reference/api/
- /reference/api/docker_remote_api/
- /reference/api/docker_remote_api_v1.0/
- /reference/api/docker_remote_api_v1.1/
- /reference/api/docker_remote_api_v1.2/
- /reference/api/docker_remote_api_v1.3/
- /reference/api/docker_remote_api_v1.4/
- /reference/api/docker_remote_api_v1.5/
- /reference/api/docker_remote_api_v1.6/
- /reference/api/docker_remote_api_v1.7/
- /reference/api/docker_remote_api_v1.8/
- /reference/api/docker_remote_api_v1.9/
- /reference/api/docker_remote_api_v1.10/
- /reference/api/docker_remote_api_v1.11/
- /reference/api/docker_remote_api_v1.12/
- /reference/api/docker_remote_api_v1.13/
- /reference/api/docker_remote_api_v1.14/
- /reference/api/docker_remote_api_v1.15/
- /reference/api/docker_remote_api_v1.16/
- /reference/api/docker_remote_api_v1.17/
---
@z

@x
Docker provides an API for interacting with the Docker daemon (called the Docker
Engine API), as well as SDKs for Go and Python. The SDKs allow you to build and
scale Docker apps and solutions quickly and easily. If Go or Python don't work
for you, you can use the Docker Engine API directly.
@y
Docker では Docker デーモンとやりとりを行う API（Docker Engine API と呼ぶ）を提供しています。
これに合わせて Go 言語向け SDK、Python 向け SDK も提供します。
SDK を利用すれば Docker アプリの構築やスケール変更を、よりすばやく簡単に実現できます。
Go 言語向けや Python 向けの SDK が動作しなかったとしても、Docker Engine API を直接利用することができます。
@z

@x
For information about Docker Engine SDKs, see [Develop with Docker Engine SDKs](/engine/api/sdk/).
@y
Docker Engine SDK の詳細は [Docker Engine SDK を利用した開発]({{ site.baseurl }}/engine/api/sdk/) を参照してください。
@z

@x
The Docker Engine API is a RESTful API accessed by an HTTP client such as `wget` or
`curl`, or the HTTP library which is part of most modern programming languages.
@y
Docker Engine API は RESTful API です。
したがって`wget`や`curl`などの HTTP クライアント、あるいは最近のほとんどのプログラミング言語に含まれる HTTP ライブラリからアクセスできます。
@z

@x
## View the API reference
@y
{: #view-the-api-reference }
## API リファレンスの参照
@z

@x
You can
[view the reference for the latest version of the API](/engine/api/latest/)
or [choose a specific version](/engine/api/version-history/).
@y
API リファレンスは [最新バージョン]({{ site.baseurl }}/engine/api/latest/) あるいは [特定のバージョン]({{ site.baseurl }}/engine/api/version-history/) を参照できます。
@z

@x
## Versioned API and SDK
@y
{: #versioned-api-and-sdk }
## API と SDK のバージョン対応
@z

@x
The version of the Docker Engine API you should use depends upon the version of
your Docker daemon and Docker client.
@y
Docker Engine API のどのバージョンを利用するかは、Docker デーモンおよび Docker クライアントのバージョンによります。
@z

@x
A given version of the Docker Engine SDK supports a specific version of the
Docker Engine API, as well as all earlier versions. If breaking changes occur,
they are documented prominently.
@y
Docker Engine SDK のバージョンでは、Docker Engine API の特定のバージョンとそれ以前のバージョンに対応しています。
重大な変更が発生した際には、わかりやすく文書提供します。
@z

@x
> Daemon and client API mismatches
>
> The Docker daemon and client do not necessarily need to be the same version
> at all times. However, keep the following in mind.
>
> - If the daemon is newer than the client, the client does not know about new
>   features or deprecated API endpoints in the daemon.
>
> - If the client is newer than the daemon, the client can request API
>   endpoints that the daemon does not know about.
@y
> デーモンとクライアントでの API バージョン相違
>
> Docker デーモンとクライアントのバージョンは、常に同一でなければならないというわけでもありません。
> ただし以下の点に留意しておく必要があります。
>
> - クライアントよりもデーモンのバージョンの方が新しい場合、デーモンに新たな機能があってもクライアントにはわかりません。
>   また廃止決定となった API エンドポイントもわかりません。
>
> - デーモンよりもクライアントのバージョンの方が新しい場合、デーモンがわかっていない API リクエストエンドポイントをクライアントが送信することがありえます。
@z

@x
A new version of the API is released when new features are added. The Docker API
is backward-compatible, so you do not need to update code that uses the API
unless you need to take advantage of new features.
@y
新たな機能が API に追加されると、API の新バージョンとしてリリースされます。
Docker API には下位互換性があるため、新たな機能を活用する目的がなければ、API を利用するコードを更新する必要はありません。
@z

@x
To see the highest version of the API your Docker daemon and client support, use
`docker version`:
@y
Docker デーモンとクライアントが対応している最新 API バージョンを確認するには`docker version`を実行します。
@z

@x
```console
$ docker version
@y
```console
$ docker version
@z

@x
Client: Docker Engine - Community
 Version:           20.10.0
 API version:       1.41
 Go version:        go1.13.15
 Git commit:        7287ab3
 Built:             Tue Dec  8 19:00:39 2020
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true
Server: Docker Engine - Community
 Engine:
  Version:          20.10.0
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       eeddea2
  Built:            Tue Dec  8 18:58:12 2020
  OS/Arch:          linux/amd64
  ...
```
@y
Client: Docker Engine - Community
 Version:           20.10.0
 API version:       1.41
 Go version:        go1.13.15
 Git commit:        7287ab3
 Built:             Tue Dec  8 19:00:39 2020
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true
Server: Docker Engine - Community
 Engine:
  Version:          20.10.0
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       eeddea2
  Built:            Tue Dec  8 18:58:12 2020
  OS/Arch:          linux/amd64
  ...
```
@z

@x
You can specify the API version to use, in one of the following ways:
@y
利用する API のバージョンを指定するには、以下のいずれかの方法をとります。
@z

@x
- When using the SDK, use the latest version you can, but at least the version
  that incorporates the API version with the features you need.
@y
- SDK を利用する場合には、できるだけ最新バージョンを利用します。
  最低でも必要とする機能を実現する API バージョンを利用します。
@z

@x
- When using `curl` directly, specify the version as the first part of the URL.
  For instance, if the endpoint is `/containers/`, you can use
  `/v1.41/containers/`.
@y
- `curl`を直接利用する場合は、URL の冒頭部分にバージョンを指定します。
  たとえばエンドポイントが`/containers/`である場合は`/v1.41/containers/`とします。
@z

@x
- To force the Docker CLI or the Docker Engine SDKs to use an old version
  version of the API than the version reported by `docker version`, set the
  environment variable `DOCKER_API_VERSION` to the correct version. This works
  on Linux, Windows, or macOS clients.
@y
- Docker CLI や Docker Engine SDK が利用する API バージョンを`docker version`に示されるバージョンではなく、それよりも古いものを利用するには、環境変数`DOCKER_API_VERSION`にそのバージョンを指定します。
  これは Linux、Windows、macOS の各クライアントにおいて動作します。
@z

@x
  ```console
  $ DOCKER_API_VERSION='1.41'
  ```
@y
  ```console
  $ DOCKER_API_VERSION='1.41'
  ```
@z

@x
  While the environment variable is set, that version of the API is used, even
  if the Docker daemon supports a newer version. This environment variable
  disables API version negotiation, and as such should only be used if you must
  use a specific version of the API, or for debugging purposes.
@y
  この環境変数が設定されている間は、Docker デーモンがより新しいバージョンに対応していても、そのバージョンの API が利用されます。
  この環境変数を設定すると API バージョンのネゴーシエーションが無効になるため、これを利用するのは API の特定バージョンがどうしても必要な場合、あるいはデバッグ目的で利用する場合のみとしてください。
@z

@x
- The Docker Go SDK allows you to enable API version negotiation, automatically
  selects an API version that is supported by both the client, and the Docker Engine
  that is used.
@y
- Go 言語向け SDK では API バージョンのネゴーシエーションが有効になります。
  つまりクライアントと Docker Engine の両方に対応する API バージョンが自動的に選択されます。
@z

@x
- For the SDKs, you can also specify the API version programmatically, as a
  parameter to the `client` object. See the
  [Go constructor](https://github.com/moby/moby/blob/v19.03.6/client/client.go#L119){: target="_blank" rel="noopener" class="_"}
  or the
  [Python SDK documentation for `client`](https://docker-py.readthedocs.io/en/stable/client.html){: target="_blank" rel="noopener" class="_"}.
@y
- SDK の利用時では、API バージョンをプログラム内から指定することもできます。
  これは`client`オブジェクトに対する引数として指定するものです。
  詳しくは [Go 言語のコンストラクター](https://github.com/moby/moby/blob/v19.03.6/client/client.go#L119){: target="_blank" rel="noopener" class="_"} または [Python SDK ドキュメントの `client` の項](https://docker-py.readthedocs.io/en/stable/client.html){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
### API version matrix
@y
{: #api-version-matrix }
### API バージョン表
@z

@x
{% include api-version-matrix.md %}
@y
{% include api-version-matrix.md %}
@z

@x
### Archived API versions
@y
{: #archived-api-versions }
### アーカイブ API バージョン
@z

@x
Documentation for older versions of the API has been archived, but can be found
in the [docker code repository on GitHub](https://github.com/moby/moby/tree/v1.9.1/docs/reference/api){: target="_blank" rel="noopener" class="_"}
@y
より古い API のドキュメントはアーカイブされています。
これは [GitHub 上の Docker コードリポジトリ](https://github.com/moby/moby/tree/v1.9.1/docs/reference/api){: target="_blank" rel="noopener" class="_"} から参照できます。
@z
