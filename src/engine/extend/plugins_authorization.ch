%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "How to create authorization plugins to manage access control to your Docker daemon."
keywords: "security, authorization, authentication, docker, documentation, plugin, extend"
redirect_from:
- "/engine/extend/authorization/"
---
@y
---
description: "How to create authorization plugins to manage access control to your Docker daemon."
keywords: "security, authorization, authentication, docker, documentation, plugin, extend"
redirect_from:
- "/engine/extend/authorization/"
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
# Access authorization plugin
@y
{% comment %}
# Access authorization plugin
{% endcomment %}
{: #access-authorization-plugin }
# アクセス承認プラグイン
@z

@x
This document describes the Docker Engine plugins generally available in Docker
Engine. To view information on plugins managed by Docker Engine,
refer to [Docker Engine plugin system](index.md).
@y
{% comment %}
This document describes the Docker Engine plugins generally available in Docker
Engine. To view information on plugins managed by Docker Engine,
refer to [Docker Engine plugin system](index.md).
{% endcomment %}
本節では Docker Engine において一般的に利用されているプラグインについて説明します。
Docker Engine によって管理されるプラグインに関する情報については [Docker Engine プラグインシステム](index.md) を参照してください。
@z

@x
Docker's out-of-the-box authorization model is all or nothing. Any user with
permission to access the Docker daemon can run any Docker client command. The
same is true for callers using Docker's Engine API to contact the daemon. If you
require greater access control, you can create authorization plugins and add
them to your Docker daemon configuration. Using an authorization plugin, a
Docker administrator can configure granular access policies for managing access
to the Docker daemon.
@y
{% comment %}
Docker's out-of-the-box authorization model is all or nothing. Any user with
permission to access the Docker daemon can run any Docker client command. The
same is true for callers using Docker's Engine API to contact the daemon. If you
require greater access control, you can create authorization plugins and add
them to your Docker daemon configuration. Using an authorization plugin, a
Docker administrator can configure granular access policies for managing access
to the Docker daemon.
{% endcomment %}
Docker において即座に利用できる承認モデルは、使うか使わないかだけの単純なものです。
Docker デーモンへのアクセス権限を持ったユーザーは、どのような Docker クライアントコマンドでも実行できます。
Docker Engine API 呼び出しによりデーモンにアクセスできる権限に関しても同じことが言えます。
これ以上のアクセス制御を必要とするなら、承認プラグインを生成して Docker デーモンの設定に加えることになります。
承認プラグインを利用すれば Docker 管理者は、Docker デーモンへのアクセスを管理するための詳細なアクセスポリシーを設定することができます。
@z

@x
Anyone with the appropriate skills can develop an authorization plugin. These
skills, at their most basic, are knowledge of Docker, understanding of REST, and
sound programming knowledge. This document describes the architecture, state,
and methods information available to an authorization plugin developer.
@y
{% comment %}
Anyone with the appropriate skills can develop an authorization plugin. These
skills, at their most basic, are knowledge of Docker, understanding of REST, and
sound programming knowledge. This document describes the architecture, state,
and methods information available to an authorization plugin developer.
{% endcomment %}
承認プラグインは、適切な開発スキルを持っていれば誰でも作り出すことができます。
開発スキルの基本として必要になるのは、Docker の知識、REST への理解、的確なプログラミングノウハウです。
本節では承認プラグイン開発者に向けて、プラグインのアーキテクチャー、状況、手法などの有用な情報を示します。
@z

@x
## Basic principles
@y
{% comment %}
## Basic principles
{% endcomment %}
{: #basic-principles }
## 基本的な仕組み
@z

@x
Docker's [plugin infrastructure](plugin_api.md) enables
extending Docker by loading, removing and communicating with
third-party components using a generic API. The access authorization subsystem
was built using this mechanism.
@y
{% comment %}
Docker's [plugin infrastructure](plugin_api.md) enables
extending Docker by loading, removing and communicating with
third-party components using a generic API. The access authorization subsystem
was built using this mechanism.
{% endcomment %}
Docker が提供する [プラグインインフラストラクチャー](plugin_api.md) は Docker を拡張するものであり、汎用 API を利用したサードパーティー製のコンポーネントをロードして、やりとりを行ないます。
アクセス承認サブシステムは、このようなメカニズムのもとで構築されました。
@z

@x
Using this subsystem, you don't need to rebuild the Docker daemon to add an
authorization plugin.  You can add a plugin to an installed Docker daemon. You do
need to restart the Docker daemon to add a new plugin.
@y
{% comment %}
Using this subsystem, you don't need to rebuild the Docker daemon to add an
authorization plugin.  You can add a plugin to an installed Docker daemon. You do
need to restart the Docker daemon to add a new plugin.
{% endcomment %}
このサブシステムを利用すれば、Docker デーモンを再ビルドすることなく、承認プラグインを追加することができます。
つまりインストール済みの Docker デーモンに対してプラグイン追加ができるわけです。
ただし新たなプラグインを追加したら Docker デーモンの再起動が必要です。
@z

@x
An authorization plugin approves or denies requests to the Docker daemon based
on both the current authentication context and the command context. The
authentication context contains all user details and the authentication method.
The command context contains all the relevant request data.
@y
{% comment %}
An authorization plugin approves or denies requests to the Docker daemon based
on both the current authentication context and the command context. The
authentication context contains all user details and the authentication method.
The command context contains all the relevant request data.
{% endcomment %}
承認プラグインは、その時点での承認コンテキスト（authentication context）とコマンドコンテキスト（command context）の双方に基づいて、Docker デーモンへの要求を承認または拒否します。
承認コンテキストには、ユーザー情報の詳細や承認手法があります。
またコマンドコンテキストには関連するリクエストデータすべてがあります。
@z

@x
Authorization plugins must follow the rules described in [Docker Plugin API](plugin_api.md).
Each plugin must reside within directories described under the
[Plugin discovery](plugin_api.md#plugin-discovery) section.
@y
{% comment %}
Authorization plugins must follow the rules described in [Docker Plugin API](plugin_api.md).
Each plugin must reside within directories described under the
[Plugin discovery](plugin_api.md#plugin-discovery) section.
{% endcomment %}
承認プラグインは [Docker プラグイン API](plugin_api.md) に示すルールに従わなければなりません。
また各プラグインは [プラグインの検出](plugin_api.md#plugin-discovery) に示すディレクトリ配下に置く必要があります。
@z

@x
**Note**: the abbreviations `AuthZ` and `AuthN` mean authorization and authentication
respectively.
@y
{% comment %}
**Note**: the abbreviations `AuthZ` and `AuthN` mean authorization and authentication
respectively.
{% endcomment %}
**メモ**: `AuthZ`と`AuthN`という略表記は、それぞれ承認（authorization）と認証（authentication）を表わします。
@z

@x
## Default user authorization mechanism
@y
{% comment %}
## Default user authorization mechanism
{% endcomment %}
{: #default-user-authorization-mechanism }
## デフォルトのユーザー承認メカニズム
@z

@x
If TLS is enabled in the [Docker daemon](https://docs.docker.com/engine/security/https/), the default user authorization flow extracts the user details from the certificate subject name.
That is, the `User` field is set to the client certificate subject common name, and the `AuthenticationMethod` field is set to `TLS`.
@y
{% comment %}
If TLS is enabled in the [Docker daemon](https://docs.docker.com/engine/security/https/), the default user authorization flow extracts the user details from the certificate subject name.
That is, the `User` field is set to the client certificate subject common name, and the `AuthenticationMethod` field is set to `TLS`.
{% endcomment %}
[Docker デーモン](https://docs.docker.com/engine/security/https/) において TLS が有効である場合、デフォルトのユーザー承認処理においては、ユーザー情報を証明書のサブジェクト名（subject name）から引き出します。
つまり`User`の項目にはクライアント証明書のサブジェクトコモン名（subject common name）が設定されており、`AuthenticationMethod`の項目には`TLS`が設定されています。
@z

@x
## Basic architecture
@y
{% comment %}
## Basic architecture
{% endcomment %}
{: #basic-architecture }
## 基本的なアーキテクチャー
@z

@x
You are responsible for registering your plugin as part of the Docker daemon
startup. You can install multiple plugins and chain them together. This chain
can be ordered. Each request to the daemon passes in order through the chain.
Only when all the plugins grant access to the resource, is the access granted.
@y
{% comment %}
You are responsible for registering your plugin as part of the Docker daemon
startup. You can install multiple plugins and chain them together. This chain
can be ordered. Each request to the daemon passes in order through the chain.
Only when all the plugins grant access to the resource, is the access granted.
{% endcomment %}
利用するプラグインは Docker デーモンを起動するにあたって、あらかじめ登録しておく必要があります。
プラグインは複数インストールして、それらを結びつけることが可能です。
この結びつき（chain）には順序があります。
デーモンに対するリクエストは、それぞれその結びつきの順に受け渡されます。
この場合、すべてのプラグインがリソースに対するアクセス権限を有している場合に限って、アクセスが許可されます。
@z

@x
When an HTTP request is made to the Docker daemon through the CLI or via the
Engine API, the authentication subsystem passes the request to the installed
authentication plugin(s). The request contains the user (caller) and command
context. The plugin is responsible for deciding whether to allow or deny the
request.
@y
{% comment %}
When an HTTP request is made to the Docker daemon through the CLI or via the
Engine API, the authentication subsystem passes the request to the installed
authentication plugin(s). The request contains the user (caller) and command
context. The plugin is responsible for deciding whether to allow or deny the
request.
{% endcomment %}
HTTP リクエストが CLI または Engine API を通じて Docker デーモンに要求されると、承認サブシステムがそのリクエストをインストールされた承認プラグインに受け渡します。
このリクエストには（呼び出しを行った）ユーザー情報とコマンドコンテキストが含まれています。
プラグインはこのリクエストを許可するか拒否するかを決定しなければなりません。
@z

@x
The sequence diagrams below depict an allow and deny authorization flow:
@y
{% comment %}
The sequence diagrams below depict an allow and deny authorization flow:
{% endcomment %}
以下に示すシーケンス図は、承認の許可と拒否の処理フローを示しています。
@z

@x
![Authorization Allow flow](images/authz_allow.png)
@y
{% comment %}
![Authorization Allow flow](images/authz_allow.png)
{% endcomment %}
![承認許可の処理フロー](images/authz_allow.png)
@z

@x
![Authorization Deny flow](images/authz_deny.png)
@y
{% comment %}
![Authorization Deny flow](images/authz_deny.png)
{% endcomment %}
![承認拒否の処理フロー](images/authz_deny.png)
@z

@x
Each request sent to the plugin includes the authenticated user, the HTTP
headers, and the request/response body. Only the user name and the
authentication method used are passed to the plugin. Most importantly, no user
credentials or tokens are passed. Finally, not all request/response bodies
are sent to the authorization plugin. Only those request/response bodies where
the `Content-Type` is either `text/*` or `application/json` are sent.
@y
{% comment %}
Each request sent to the plugin includes the authenticated user, the HTTP
headers, and the request/response body. Only the user name and the
authentication method used are passed to the plugin. Most importantly, no user
credentials or tokens are passed. Finally, not all request/response bodies
are sent to the authorization plugin. Only those request/response bodies where
the `Content-Type` is either `text/*` or `application/json` are sent.
{% endcomment %}
プラグインに送信された各リクエストには、認証されたユーザー情報、HTTP ヘッダー、リクエストまたはレスポンスの本体が含まれています。
プラグインに受け渡されるのは、ユーザー名と使用される認証方法だけです。
ここで重要なのは、ユーザーの資格情報やトークンは受け渡されないということです。
そしてリクエストやレスポンス本体のほとんどは、承認プラグインには受け渡されません。
リクエストやレスポンス本体が受け渡されるのは、唯一`Content-Type`が`text/*`か`application/json`であるときだけです。
@z

@x
For commands that can potentially hijack the HTTP connection (`HTTP
Upgrade`), such as `exec`, the authorization plugin is only called for the
initial HTTP requests. Once the plugin approves the command, authorization is
not applied to the rest of the flow. Specifically, the streaming data is not
passed to the authorization plugins. For commands that return chunked HTTP
response, such as `logs` and `events`, only the HTTP request is sent to the
authorization plugins.
@y
{% comment %}
For commands that can potentially hijack the HTTP connection (`HTTP
Upgrade`), such as `exec`, the authorization plugin is only called for the
initial HTTP requests. Once the plugin approves the command, authorization is
not applied to the rest of the flow. Specifically, the streaming data is not
passed to the authorization plugins. For commands that return chunked HTTP
response, such as `logs` and `events`, only the HTTP request is sent to the
authorization plugins.
{% endcomment %}
HTTP 接続を乗っ取る可能性のあるコマンド（`HTTP Upgrade`）、たとえば`exec`などの場合には、承認プラグインは、最初の HTTP リクエストに対してのみ呼び出されます。
プラグインがそのコマンドを一度受け入れたら、その後の処理フローにおいて承認処理は適用されません。
特にストリーミングデータは承認プラグインに受け渡されません。
チャンク形式の HTTP レスポンスを返す`logs`や`events`のようなコマンドでは HTTP リクエストだけが承認プラグインに送信されます。
@z

@x
During request/response processing, some authorization flows might
need to do additional queries to the Docker daemon. To complete such flows,
plugins can call the daemon API similar to a regular user. To enable these
additional queries, the plugin must provide the means for an administrator to
configure proper authentication and security policies.
@y
{% comment %}
During request/response processing, some authorization flows might
need to do additional queries to the Docker daemon. To complete such flows,
plugins can call the daemon API similar to a regular user. To enable these
additional queries, the plugin must provide the means for an administrator to
configure proper authentication and security policies.
{% endcomment %}
承認処理フロー内でのリクエストやレスポンスの処理中には、Docker デーモンに対してさらにクエリーの実行が必要になる場合があります。
そのような処理フローを実施するため、プラグインは通常ユーザーが行うのと同様にデーモン API を呼び出します。
そういった追加のクエリーを可能とするためにプラグインの機能として、管理者が適切な承認やセキュリティポリシーを設定できるような手段を提供しておくことが必要になります。
@z

@x
## Docker client flows
@y
{% comment %}
## Docker client flows
{% endcomment %}
{: #docker-client-flows }
## Docker クライアントの処理フロー
@z

@x
To enable and configure the authorization plugin, the plugin developer must
support the Docker client interactions detailed in this section.
@y
{% comment %}
To enable and configure the authorization plugin, the plugin developer must
support the Docker client interactions detailed in this section.
{% endcomment %}
承認プラグインを有効化し設定可能とするために、プラグイン開発者が Docker クライアントとのやりとりにおいて対応すべきことを、本節において説明します。
@z

@x
### Setting up Docker daemon
@y
{% comment %}
### Setting up Docker daemon
{% endcomment %}
{: #setting-up-docker-daemon }
### Docker デーモンの設定
@z

@x
Enable the authorization plugin with a dedicated command line flag in the
`--authorization-plugin=PLUGIN_ID` format. The flag supplies a `PLUGIN_ID`
value. This value can be the plugin’s socket or a path to a specification file.
Authorization plugins can be loaded without restarting the daemon. Refer
to the [`dockerd` documentation](../reference/commandline/dockerd.md#configuration-reloading) for more information.
@y
{% comment %}
Enable the authorization plugin with a dedicated command line flag in the
`--authorization-plugin=PLUGIN_ID` format. The flag supplies a `PLUGIN_ID`
value. This value can be the plugin’s socket or a path to a specification file.
Authorization plugins can be loaded without restarting the daemon. Refer
to the [`dockerd` documentation](../reference/commandline/dockerd.md#configuration-reloading) for more information.
{% endcomment %}
承認プラグインの有効化は、専用のコマンドラインフラグを使って`--authorization-plugin=PLUGIN_ID`のように指定します。
このフラグには`PLUGIN_ID`という値を与えます。
この値はプラグインのソケット、または仕様ファイルへのパスのいずれかです。
承認プラグインはデーモンを再起動しなくてもロードされます。
詳しくは [`dockerd`のドキュメント](../reference/commandline/dockerd.md#configuration-reloading) を参照してください。
@z

@x
```bash
$ dockerd --authorization-plugin=plugin1 --authorization-plugin=plugin2,...
```
@y
```bash
$ dockerd --authorization-plugin=plugin1 --authorization-plugin=plugin2,...
```
@z

@x
Docker's authorization subsystem supports multiple `--authorization-plugin` parameters.
@y
{% comment %}
Docker's authorization subsystem supports multiple `--authorization-plugin` parameters.
{% endcomment %}
Docker の承認サブシステムでは複数の`--authorization-plugin`パラメーターを指定することができます。
@z

@x
### Calling authorized command (allow)
@y
{% comment %}
### Calling authorized command (allow)
{% endcomment %}
{: #calling-authorized-command-allow }
### コマンドの呼び出し（承認許可時）
@z

@x
```bash
$ docker pull centos
...
f1b10cd84249: Pull complete
...
```
@y
```bash
$ docker pull centos
...
f1b10cd84249: Pull complete
...
```
@z

@x
### Calling unauthorized command (deny)
@y
{% comment %}
### Calling unauthorized command (deny)
{% endcomment %}
{: #calling-unauthorized-command-deny }
### コマンドの呼び出し（承認拒否時）
@z

@x
```bash
$ docker pull centos
...
docker: Error response from daemon: authorization denied by plugin PLUGIN_NAME: volumes are not allowed.
```
@y
```bash
$ docker pull centos
...
docker: Error response from daemon: authorization denied by plugin PLUGIN_NAME: volumes are not allowed.
```
@z

@x
### Error from plugins
@y
{% comment %}
### Error from plugins
{% endcomment %}
{: #error-from-plugins }
### プラグインからのエラー
@z

@x
```bash
$ docker pull centos
...
docker: Error response from daemon: plugin PLUGIN_NAME failed with error: AuthZPlugin.AuthZReq: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
```
@y
```bash
$ docker pull centos
...
docker: Error response from daemon: plugin PLUGIN_NAME failed with error: AuthZPlugin.AuthZReq: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
```
@z

@x
## API schema and implementation
@y
{% comment %}
## API schema and implementation
{% endcomment %}
{: #api-schema-and-implementation }
## API スキーマと実装
@z

@x
In addition to Docker's standard plugin registration method, each plugin
should implement the following two methods:
@y
{% comment %}
In addition to Docker's standard plugin registration method, each plugin
should implement the following two methods:
{% endcomment %}
Docker の標準的なプラグインにおける登録メソッドに加えて、各プラグインには以下に示す 2 つのメソッドを実装していなければなりません。
@z

@x
* `/AuthZPlugin.AuthZReq` This authorize request method is called before the Docker daemon processes the client request.
@y
{% comment %}
* `/AuthZPlugin.AuthZReq` This authorize request method is called before the Docker daemon processes the client request.
{% endcomment %}
* `/AuthZPlugin.AuthZReq` この承認リクエストメソッドは、クライアントからのリクエストをデーモンが処理する前に呼び出されます。
@z

@x
* `/AuthZPlugin.AuthZRes` This authorize response method is called before the response is returned from Docker daemon to the client.
@y
{% comment %}
* `/AuthZPlugin.AuthZRes` This authorize response method is called before the response is returned from Docker daemon to the client.
{% endcomment %}
* `/AuthZPlugin.AuthZRes` この承認レスポンスメソッドは、クライアントに対して Docker デーモンがレスポンスを返信するまえに呼び出されます。
@z

@x
#### /AuthZPlugin.AuthZReq
@y
#### /AuthZPlugin.AuthZReq
@z

@x
**Request**:
@y
{% comment %}
**Request**:
{% endcomment %}
**リクエスト**
@z

@x
```json
{
    "User":              "The user identification",
    "UserAuthNMethod":   "The authentication method used",
    "RequestMethod":     "The HTTP method",
    "RequestURI":        "The HTTP request URI",
    "RequestBody":       "Byte array containing the raw HTTP request body",
    "RequestHeader":     "Byte array containing the raw HTTP request header as a map[string][]string "
}
```
@y
```json
{
    "User":              "The user identification",
    "UserAuthNMethod":   "The authentication method used",
    "RequestMethod":     "The HTTP method",
    "RequestURI":        "The HTTP request URI",
    "RequestBody":       "Byte array containing the raw HTTP request body",
    "RequestHeader":     "Byte array containing the raw HTTP request header as a map[string][]string "
}
```
@z

@x
**Response**:
@y
{% comment %}
**Response**:
{% endcomment %}
**レスポンス**
@z

@x
```json
{
    "Allow": "Determined whether the user is allowed or not",
    "Msg":   "The authorization message",
    "Err":   "The error message if things go wrong"
}
```
@y
```json
{
    "Allow": "Determined whether the user is allowed or not",
    "Msg":   "The authorization message",
    "Err":   "The error message if things go wrong"
}
```
@z

@x
#### /AuthZPlugin.AuthZRes
@y
#### /AuthZPlugin.AuthZRes
@z

@x
**Request**:
@y
{% comment %}
**Request**:
{% endcomment %}
**リクエスト**
@z

@x
```json
{
    "User":              "The user identification",
    "UserAuthNMethod":   "The authentication method used",
    "RequestMethod":     "The HTTP method",
    "RequestURI":        "The HTTP request URI",
    "RequestBody":       "Byte array containing the raw HTTP request body",
    "RequestHeader":     "Byte array containing the raw HTTP request header as a map[string][]string",
    "ResponseBody":      "Byte array containing the raw HTTP response body",
    "ResponseHeader":    "Byte array containing the raw HTTP response header as a map[string][]string",
    "ResponseStatusCode":"Response status code"
}
```
@y
```json
{
    "User":              "The user identification",
    "UserAuthNMethod":   "The authentication method used",
    "RequestMethod":     "The HTTP method",
    "RequestURI":        "The HTTP request URI",
    "RequestBody":       "Byte array containing the raw HTTP request body",
    "RequestHeader":     "Byte array containing the raw HTTP request header as a map[string][]string",
    "ResponseBody":      "Byte array containing the raw HTTP response body",
    "ResponseHeader":    "Byte array containing the raw HTTP response header as a map[string][]string",
    "ResponseStatusCode":"Response status code"
}
```
@z

@x
**Response**:
@y
{% comment %}
**Response**:
{% endcomment %}
**レスポンス**
@z

@x
```json
{
   "Allow":              "Determined whether the user is allowed or not",
   "Msg":                "The authorization message",
   "Err":                "The error message if things go wrong"
}
```
@y
```json
{
   "Allow":              "Determined whether the user is allowed or not",
   "Msg":                "The authorization message",
   "Err":                "The error message if things go wrong"
}
```
@z

@x
### Request authorization
@y
{% comment %}
### Request authorization
{% endcomment %}
{: #request-authorization }
### リクエスト承認
@z

@x
Each plugin must support two request authorization messages formats, one from the daemon to the plugin and then from the plugin to the daemon. The tables below detail the content expected in each message.
@y
{% comment %}
Each plugin must support two request authorization messages formats, one from the daemon to the plugin and then from the plugin to the daemon. The tables below detail the content expected in each message.
{% endcomment %}
各プラグインはリクエスト承認メッセージにおいて、2 種類のフォーマットをサポートしなければなりません。
1 つはデーモンからプラグインに向けてのものであり、もう 1 つはその後に発生するプラグインからデーモンに向けてのものです。
以下の一覧表は、各メッセージにおける内容を示します。
@z

@x
#### Daemon -> Plugin
@y
{% comment %}
#### Daemon -> Plugin
{% endcomment %}
{: #daemon---plugin }
#### デーモン -> プラグイン
@z

@x
Name                   | Type              | Description
-----------------------|-------------------|-------------------------------------------------------
User                   | string            | The user identification
Authentication method  | string            | The authentication method used
Request method         | enum              | The HTTP method (GET/DELETE/POST)
Request URI            | string            | The HTTP request URI including API version (e.g., v.1.17/containers/json)
Request headers        | map[string]string | Request headers as key value pairs (without the authorization header)
Request body           | []byte            | Raw request body
@y
{% comment %}
Name                   | Type              | Description
-----------------------|-------------------|-------------------------------------------------------
User                   | string            | The user identification
Authentication method  | string            | The authentication method used
Request method         | enum              | The HTTP method (GET/DELETE/POST)
Request URI            | string            | The HTTP request URI including API version (e.g., v.1.17/containers/json)
Request headers        | map[string]string | Request headers as key value pairs (without the authorization header)
Request body           | []byte            | Raw request body
{% endcomment %}
項目                   | 日本語訳           | 型                | 内容説明
-----------------------|--------------------|-------------------|-------------------------------------------------------
User                   | ユーザー           | string            | ユーザー ID。
Authentication method  | 承認メソッド       | string            | 利用する承認メソッド。
Request method         | リクエストメソッド | enum              | HTTP メソッド (GET/DELETE/POST)
Request URI            | リクエスト URI     | string            | HTTP リクエスト URI。API バージョンを含む。（たとえば v.1.17/containers/json）
Request headers        | リクエストヘッダー | map[string]string | キーバリューペアによるリクエストヘッダー（承認ヘッダーは除く）。
Request body           | リクエスト本体     | []byte            | 生のリクエスト本体
@z

@x
#### Plugin -> Daemon
@y
{% comment %}
#### Plugin -> Daemon
{% endcomment %}
{: #plugin---daemon }
#### プラグイン -> デーモン
@z

@x
Name    | Type   | Description
--------|--------|----------------------------------------------------------------------------------
Allow   | bool   | Boolean value indicating whether the request is allowed or denied
Msg     | string | Authorization message (will be returned to the client in case the access is denied)
Err     | string | Error message (will be returned to the client in case the plugin encounter an error. The string value supplied may appear in logs, so should not include confidential information)
@y
{% comment %}
Name    | Type   | Description
--------|--------|----------------------------------------------------------------------------------
Allow   | bool   | Boolean value indicating whether the request is allowed or denied
Msg     | string | Authorization message (will be returned to the client in case the access is denied)
Err     | string | Error message (will be returned to the client in case the plugin encounter an error. The string value supplied may appear in logs, so should not include confidential information)
{% endcomment %}
項目  | 日本語訳   | 型     | 内容説明
------|------------|--------|----------------------------------------------------------------------------------
Allow | 許可       | bool   | リクエストが許可あるいは拒否されたことを表わすブール値。
Msg   | メッセージ | string | 承認メッセージ。（アクセス拒否時にクライアントに返される。）
Err   | エラー     | string | エラーメッセージ。（プラグインエラーの際にクライアントに返される。文字列値はログに出力されるため資格情報は含めてはならない。）
@z

@x
### Response authorization
@y
{% comment %}
### Response authorization
{% endcomment %}
### レスポンス承認
@z

@x
The plugin must support two authorization messages formats, one from the daemon to the plugin and then from the plugin to the daemon. The tables below detail the content expected in each message.
@y
{% comment %}
The plugin must support two authorization messages formats, one from the daemon to the plugin and then from the plugin to the daemon. The tables below detail the content expected in each message.
{% endcomment %}
各プラグインはリクエスト承認メッセージにおいて、2 種類のフォーマットをサポートしなければなりません。
1 つはデーモンからプラグインに向けてのものであり、もう 1 つはその後に発生するプラグインからデーモンに向けてのものです。
以下の一覧表は、各メッセージにおける内容を示します。
@z

@x
#### Daemon -> Plugin
@y
{% comment %}
#### Daemon -> Plugin
{% endcomment %}
{: #daemon---plugin }
#### デーモン -> プラグイン
@z

@x
Name                    | Type              | Description
----------------------- |------------------ |----------------------------------------------------
User                    | string            | The user identification
Authentication method   | string            | The authentication method used
Request method          | string            | The HTTP method (GET/DELETE/POST)
Request URI             | string            | The HTTP request URI including API version (e.g., v.1.17/containers/json)
Request headers         | map[string]string | Request headers as key value pairs (without the authorization header)
Request body            | []byte            | Raw request body
Response status code    | int               | Status code from the docker daemon
Response headers        | map[string]string | Response headers as key value pairs
Response body           | []byte            | Raw docker daemon response body
@y
{% comment %}
Name                    | Type              | Description
----------------------- |------------------ |----------------------------------------------------
User                    | string            | The user identification
Authentication method   | string            | The authentication method used
Request method          | string            | The HTTP method (GET/DELETE/POST)
Request URI             | string            | The HTTP request URI including API version (e.g., v.1.17/containers/json)
Request headers         | map[string]string | Request headers as key value pairs (without the authorization header)
Request body            | []byte            | Raw request body
Response status code    | int               | Status code from the docker daemon
Response headers        | map[string]string | Response headers as key value pairs
Response body           | []byte            | Raw docker daemon response body
{% endcomment %}
項目                    | 日本語訳                   | 型                | Description
----------------------- |--------------------------- |-------------------|--------------------------------
User                    | ユーザー                   | string            | ユーザー ID。
Authentication method   | 承認メソッド               | string            | 利用する承認メソッド。
Request method          | リクエストメソッド         | string            | HTTP メソッド (GET/DELETE/POST)
Request URI             | リクエスト URI             | string            | HTTP リクエスト URI。API バージョンを含む。（たとえば v.1.17/containers/json）
Request headers         | リクエストヘッダー         | map[string]string | キーバリューペアによるリクエストヘッダー（承認ヘッダーは除く）。
Request body            | リクエスト本体             | []byte            | 生のリクエスト本体。
Response status code    | レスポンスステータスコード | int               | Docker デーモンからのステータスコード。
Response headers        | レスポンスヘッダー         | map[string]string | キーバリューペアによるレスポンスヘッダー。
Response body           | レスポンス本体             | []byte            | Docker デーモンからの生のレスポンス本体。
@z

@x
#### Plugin -> Daemon
@y
{% comment %}
#### Plugin -> Daemon
{% endcomment %}
{: #plugin---daemon }
#### プラグイン -> デーモン
@z

@x
Name    | Type   | Description
--------|--------|----------------------------------------------------------------------------------
Allow   | bool   | Boolean value indicating whether the response is allowed or denied
Msg     | string | Authorization message (will be returned to the client in case the access is denied)
Err     | string | Error message (will be returned to the client in case the plugin encounter an error. The string value supplied may appear in logs, so should not include confidential information)
@y
{% comment %}
Name    | Type   | Description
--------|--------|----------------------------------------------------------------------------------
Allow   | bool   | Boolean value indicating whether the response is allowed or denied
Msg     | string | Authorization message (will be returned to the client in case the access is denied)
Err     | string | Error message (will be returned to the client in case the plugin encounter an error. The string value supplied may appear in logs, so should not include confidential information)
{% endcomment %}
項目    | 日本語訳   | 型     | 内容説明
--------|------------|--------|---------------------------------------------------------------------------
Allow   | 許可       | bool   | レスポンスが許可あるいは拒否されたことを表わすブール値。
Msg     | メッセージ | string | 承認メッセージ。（アクセス拒否時にクライアントに返される。）
Err     | エラー     | string | エラーメッセージ。（プラグインエラーの際にクライアントに返される。文字列値はログに出力されるため資格情報は含めてはならない。）
@z
