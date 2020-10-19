%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Becoming a power user of the notary client.
keywords: docker, notary, notary-client, docker content trust, content trust, power user, advanced
title: Use the Notary client for advanced users
---
@y
---
description: Notary クライアントのパワーユーザーになります。
keywords: docker, notary, notary-client, docker content trust, content trust, power user, advanced
title: 高度ユーザー向け Notary クライアントの利用
---
@z

@x
This page explains advanced uses of Notary client for users who are running
their own Notary service. Make sure you have first read and understood how to
[run your own Notary service](running_a_service.md) before continuing.
@y
{% comment %}
This page explains advanced uses of Notary client for users who are running
their own Notary service. Make sure you have first read and understood how to
[run your own Notary service](running_a_service.md) before continuing.
{% endcomment %}
このページでは Notary サービスを独自に起動するユーザー向けに、Notary クライアントの高度な利用方法を説明します。
読み進めるにあたっては [独自の Notary サービスの起動](running_a_service.md) を一読し理解しておいてください。
@z

@x
## An important note about the examples
@y
{% comment %}
## An important note about the examples
{% endcomment %}
{: #an-important-note-about-the-examples }
## 利用例に関する重要事項
@z

@x
This document's command examples omit the `-s` and `-d` flags. If you do not
know what these options do, read the [Getting Started](getting_started.md) docs
or run `notary --help` before continuing. Once you understand what these flags do,
you must provide your own values for these options while following this document.
You can also configure these options, see [advanced configuration options](reference/index.md)
for more information.
@y
{% comment %}
This document's command examples omit the `-s` and `-d` flags. If you do not
know what these options do, read the [Getting Started](getting_started.md) docs
or run `notary --help` before continuing. Once you understand what these flags do,
you must provide your own values for these options while following this document.
You can also configure these options, see [advanced configuration options](reference/index.md)
for more information.
{% endcomment %}
ここに示すコマンドの利用例においては`-s`と`-d`フラグは省略することにします。
このフラグがなにかわからない場合は、[Notary をはじめよう](getting_started.md) を読むか、`notary --help`を実行して確認してください。
このフラグについて理解できたら、本書内のコマンド例を実行する際には、自身が利用する値をそれぞれのフラグに設定してください。
このフラグの設定方法に関して、詳しくは [高度な設定オプション](reference/index.md) を参照してください。
@z

@x
## Initialize a Trusted Collection
@y
{% comment %}
## Initialize a Trusted Collection
{% endcomment %}
{: #initialize-a-trusted-collection }
## トラストコレクションの初期化
@z

@x
Before adding and signing content to a collection, you must first initialize that collection.
@y
{% comment %}
Before adding and signing content to a collection, you must first initialize that collection.
{% endcomment %}
コレクションにコンテンツを追加し署名するには、その前にコレクションを初期化する必要があります。
@z

@x
```bash
$ notary init example.com/collection

No root keys found. Generating a new root key...
You are about to create a new root signing key passphrase. This passphrase
is used to protect the most sensitive key in your signing system.
Choose a long, complex passphrase and be careful to keep the password and the
key file itself secure and backed up. It is highly recommended that you use a
password manager to generate the passphrase and keep it safe. There is no
way to recover this key. You can find the key in your config directory.
Enter passphrase for new root key with ID 1f54328:
Repeat passphrase for new root key with ID 1f54328:
Enter passphrase for new targets key with ID 1df39fc (example.com/collection):
Repeat passphrase for new targets key with ID 1df39fc (example.com/collection):
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin1">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese1">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin1" class="tab-pane fade in active">
{% capture original-content %}
```bash
$ notary init example.com/collection

No root keys found. Generating a new root key...
You are about to create a new root signing key passphrase. This passphrase
is used to protect the most sensitive key in your signing system.
Choose a long, complex passphrase and be careful to keep the password and the
key file itself secure and backed up. It is highly recommended that you use a
password manager to generate the passphrase and keep it safe. There is no
way to recover this key. You can find the key in your config directory.
Enter passphrase for new root key with ID 1f54328:
Repeat passphrase for new root key with ID 1f54328:
Enter passphrase for new targets key with ID 1df39fc (example.com/collection):
Repeat passphrase for new targets key with ID 1df39fc (example.com/collection):
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese1" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
$ notary init example.com/collection

ルート鍵が見つからなかったため、新たなルート鍵を生成します...
これから新たなルート署名鍵に対するパスフレーズを生成します。このパスフレーズは
利用する署名システムの中で、最も大切な鍵を保護するために利用します。
パスフレーズは長く複雑なものにして、パスワードと鍵ファイルそのものを安全に保存
し、バックアップするようにしてください。パスワードマネージャーを利用して、パス
フレーズの生成と安全な保存を行うことを強くお勧めします。この鍵を復旧する手段は
ありません。この鍵は設定ディレクトリ内にあります。
ID 1f54328 を使って新ルート鍵のパスフレーズを入力 :
ID 1f54328 を使って新ルート鍵のパスフレーズを再入力  :
ID 1df39fc を使って新ターゲット鍵のパスフレーズを入力 (example.com/collection):
ID 1df39fc を使って新ターゲット鍵のパスフレーズを再入力 (example.com/collection):
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Initializing a trusted collection generates the following items; all keys use
asymmetric algorithms, but there is no requirement that they all use the _same_
algorithm:
@y
{% comment %}
Initializing a trusted collection generates the following items; all keys use
asymmetric algorithms, but there is no requirement that they all use the _same_
algorithm:
{% endcomment %}
トラストコレクションを初期化すると、以下のものが生成されます。
なおすべての鍵は非対称アルゴリズム（asymmetric algorithm）を利用していますが、すべてが **同一の** アルゴリズムを利用している必要はありません。
@z

@x
- If no root key is found, an initial `root` key is generated. This key is
  used as the default root of trust for all your trusted collections.
- A `targets` key and a `snapshot` key. The same password encrypts both of these
  as the security profile of them (when both held by the author of the trusted
  collection) is identical. This is why are not prompted for a snapshot key
  password.
- A `timestamp` key. This is generated by the server on a request from the
  client, returning just the public key. The server holds the private key and
  signs timestamps on behalf of the user.
- Stub signed notary metadata. This stages the base version of the trust
  metadata for the collection. It is finalized when it is published to the
  server.
@y
{% comment %}
- If no root key is found, an initial `root` key is generated. This key is
  used as the default root of trust for all your trusted collections.
- A `targets` key and a `snapshot` key. The same password encrypts both of these
  as the security profile of them (when both held by the author of the trusted
  collection) is identical. This is why are not prompted for a snapshot key
  password.
- A `timestamp` key. This is generated by the server on a request from the
  client, returning just the public key. The server holds the private key and
  signs timestamps on behalf of the user.
- Stub signed notary metadata. This stages the base version of the trust
  metadata for the collection. It is finalized when it is published to the
  server.
{% endcomment %}
- ルート鍵が見つからなかった場合、初期の`root`鍵が生成されます。
  この鍵は、トラストコレクションを信頼するためのデフォルトルートとして用いられます。
- `targets`（ターゲット）鍵と`snapshot`（スナップショット）鍵が生成されます。
  これらの鍵に対して同一のパスワードにしておくと、そのセキュリティプロファイルが（トラストコレクションの作成者が両方を保持するのであれば）同一であるため、この 2 つの鍵を 1 つのパスワードによって暗号化できます。
  このためスナップショット鍵に対してパスワード入力は求められません。
- `timestamp`（タイムスタンプ）鍵が生成されます。
  これはクライアントからの要求に従ってサーバーが生成します。
  返されるのは単なる公開鍵です。
  サーバーには、ユーザーのために秘密鍵と署名タイムスタンプが保持されます。
- Notary メタデータによって署名されたスタブ（stub）が生成されます。
  これはコレクションのトラストメタデータにおけるベースバージョンを作り出します。
  そしてサーバーに公開されるときに最終確定します。
@z

@x
## Add and remove Targets
@y
{% comment %}
## Add and remove Targets
{% endcomment %}
{: #add-and-remove-targets }
## ターゲット鍵の追加と削除
@z

@x
To add targets to a trusted collection with notary CLI:
@y
{% comment %}
To add targets to a trusted collection with notary CLI:
{% endcomment %}
トラストコレクションにターゲット鍵を追加するには、Notary CLI を使って以下のようにします。
@z

@x
```bash
$ notary add example.com/collection v1 my_file.txt
```
@y
```bash
$ notary add example.com/collection v1 my_file.txt
```
@z

@x
This adds the local file `my_file.txt` (which must exist relative to the
current working directory), under the target name `v1`, to the
`example.com/collection` collection we set up. The contents of the local file
are not actually added to the collection - a "target" consists of the file path
and one or more checksums of the contents.
@y
{% comment %}
This adds the local file `my_file.txt` (which must exist relative to the
current working directory), under the target name `v1`, to the
`example.com/collection` collection we set up. The contents of the local file
are not actually added to the collection - a "target" consists of the file path
and one or more checksums of the contents.
{% endcomment %}
上のコマンドによって、ローカルにあるファイル`my_file.txt`が、ターゲット名を`v1`として、設定するコレクション`example.com/collection`に追加されます。
（`my_file.txt`は、カレントワーキングディレクトリからの相対的な場所に存在していなければなりません。）
ローカルファイル`my_file.txt`の内容がそのままコレクションに追加されます。
「ターゲット」は、ファイルパスとその内容に対するチェックサムによって構成されています。
@z

@x
This is an offline command, and we must run a
`notary publish example.com/collection` for the add to take effect.
@y
{% comment %}
This is an offline command, and we must run a
`notary publish example.com/collection` for the add to take effect.
{% endcomment %}
このコマンドはオフラインコマンドであるため、追加を実際に行うには`notary publish example.com/collection`を実行する必要があります。
@z

@x
To remove targets, we use the `notary remove` command, specifying the GUN and
target name.
@y
{% comment %}
To remove targets, we use the `notary remove` command, specifying the GUN and
target name.
{% endcomment %}
ターゲット鍵を削除するには`notary remove`コマンドを用います。
その際には GUN とターゲット名を指定します。
@z

@x
```bash
$ notary remove example.com/collection v1
```
@y
```bash
$ notary remove example.com/collection v1
```
@z

@x
Removing a target is also an offline command that requires a
`notary publish example.com/collection` to take effect.
@y
{% comment %}
Removing a target is also an offline command that requires a
`notary publish example.com/collection` to take effect.
{% endcomment %}
ターゲット鍵の削除を行うこのコマンドもオフラインコマンドであるため、実際に削除するには`notary publish example.com/collection`を実行する必要があります。
@z

@x
## Manage keys
@y
{% comment %}
## Manage keys
{% endcomment %}
{: #manage-keys }
## 鍵の管理
@z

@x
By default, the notary client is responsible for managing the private keys for
root, targets, snapshot roles. All of these keys are generated by default when
initializing a new trusted collection. The keys are located in the notary `trust_dir`
directory. In addition, if delegation roles exist, those roles' keys are to also
managed by the notary client.
@y
{% comment %}
By default, the notary client is responsible for managing the private keys for
root, targets, snapshot roles. All of these keys are generated by default when
initializing a new trusted collection. The keys are located in the notary `trust_dir`
directory. In addition, if delegation roles exist, those roles' keys are to also
managed by the notary client.
{% endcomment %}
Notary クライアントは、デフォルトでルート鍵、ターゲット鍵、スナップショット鍵に対応した秘密鍵を管理しておく義務があります。
この鍵は、新たなトラストコレクションを初期化した際にデフォルトで生成されます。
そしてこの鍵は、Notary の`trust_dir`ディレクトリに配置されます。
さらに委任権限（delegation role）がある場合、その権限用の鍵も Notary クライアントが管理していなければなりません。
@z

@x
The notary server is always responsible for managing the timestamp key. However,
it is possible for the notary server to manage the snapshot key, if the snapshot
key is rotated from the notary client to server, as described in the following
subsection.
@y
{% comment %}
The notary server is always responsible for managing the timestamp key. However,
it is possible for the notary server to manage the snapshot key, if the snapshot
key is rotated from the notary client to server, as described in the following
subsection.
{% endcomment %}
Notary サーバーには常にタイプスタンプ鍵を管理する責任があります。
そしてスナップショット鍵も Notary サーバーが管理するようにすることもできます。
これはスナップショット鍵を Notary クライアントからサーバーに向けてローテートした場合です。
詳しくは以下の節において説明しています。
@z

@x
### Rotate keys
@y
{% comment %}
### Rotate keys
{% endcomment %}
{: #rotate-keys }
### 鍵のローテート
@z

@x
In case of potential compromise, notary provides a CLI command for rotating keys.
You can use the `notary key rotate` command to rotate the targets or snapshot
keys.
@y
{% comment %}
In case of potential compromise, notary provides a CLI command for rotating keys.
You can use the `notary key rotate` command to rotate the targets or snapshot
keys.
{% endcomment %}
潜在的なリスクを考慮して、Notary では鍵のローテートを行う CLI コマンドを提供しています。
`notary key rotate`コマンドを使うことで、ターゲット鍵とスナップショット鍵のローテートを行います。
@z

@x
While the snapshot key is managed by the notary client by default, use the `notary key
rotate snapshot -r` command to rotate the snapshot key to the server, such that the
notary server can sign snapshots. This is particularly useful when using
delegations with a trusted collection, so that delegates never need access to the
snapshot key to push their updates to the collection.
@y
{% comment %}
While the snapshot key is managed by the notary client by default, use the `notary key
rotate snapshot -r` command to rotate the snapshot key to the server, such that the
notary server can sign snapshots. This is particularly useful when using
delegations with a trusted collection, so that delegates never need access to the
snapshot key to push their updates to the collection.
{% endcomment %}
スナップショット鍵はデフォルトで Notary クライアントによって管理されているので、`notary key rotate snapshot -r`コマンドを使って、スナップショット鍵のローテートを行います。
これを使って Notary サーバーはスナップショットへの署名を行います。
これはトラストコレクションにおいて委任機能（delegation）を利用している場合に助かります。
委任機能はスナップショット鍵を必要としないので、コレクションへのアップデートを問題なく行うことができます。
@z

@x
New collections created by a Docker 1.11 Engine client cause the server
manage to the snapshot key by default. To reclaim control of the snapshot key on
the client, use the `notary key rotate` command without the `-r` flag.
@y
{% comment %}
New collections created by a Docker 1.11 Engine client cause the server
manage to the snapshot key by default. To reclaim control of the snapshot key on
the client, use the `notary key rotate` command without the `-r` flag.
{% endcomment %}
新たに生成したコレクションが Docker 1.11 Engine クライアントを使っていた場合、デフォルトではスナップショット鍵の管理をサーバーが行うものになります。
このスナップショット鍵の管理をクライアント上で行うためには、`notary key rotate`コマンドにおいて`-r`フラグをつけずに実行します。
@z

@x
The targets key must be locally managed - to rotate the targets key, for
instance in case of compromise, use the `notary key rotate targets` command
without the `-r` flag.
@y
{% comment %}
The targets key must be locally managed - to rotate the targets key, for
instance in case of compromise, use the `notary key rotate targets` command
without the `-r` flag.
{% endcomment %}
ターゲット鍵はローカルで管理しなければなりません。
そこでたとえば障害リスクに備えてターゲット鍵をローテートする場合には、`notary key rotate targets`コマンドにおいて`-r`フラグをつけずに実行します。
@z

@x
### Use a Yubikey
@y
{% comment %}
### Use a Yubikey
{% endcomment %}
{: #use-a-yubikey }
### Yubikey の利用
@z

@x
Notary can be used with
[Yubikey 4](https://www.yubico.com/products/yubikey-hardware/yubikey4/){: target="_blank" rel="noopener" class="_"}
keys, via a PKCS11 interface when the Yubikey has CCID mode enabled.
The Yubikey is prioritized to store root keys, and requires user
touch-input for signing. Yubikey support is included with the Docker Engine 1.11
client for use with Docker Content Trust.
@y
{% comment %}
Notary can be used with
[Yubikey 4](https://www.yubico.com/products/yubikey-hardware/yubikey4/){: target="_blank" rel="noopener" class="_"}
keys, via a PKCS11 interface when the Yubikey has CCID mode enabled.
The Yubikey is prioritized to store root keys, and requires user
touch-input for signing. Yubikey support is included with the Docker Engine 1.11
client for use with Docker Content Trust.
{% endcomment %}
Notary では [Yubikey 4](https://www.yubico.com/products/yubikey-hardware/yubikey4/){: target="_blank" class="_"} 鍵を利用することができます。
利用の際には Yubikey の CCID モードを有効にして PKCS11 インターフェースを通じて利用します。
YubiKey ではルート鍵を優先的に保存するため、その署名の際にはユーザーによるタッチ入力が必要です。
Yubikey サポートは、Docker コンテントトラストを利用する Docker Engine 1.11 に含まれます。
@z

@x
Yubikey support requires
[Yubico PIV libraries](https://www.yubico.com/support/knowledge-base/categories/downloads/){: target="_blank" rel="noopener" class="_"}
(bundled with the PIV tools) to be available in standard library locations.
@y
{% comment %}
Yubikey support requires
[Yubico PIV libraries](https://www.yubico.com/support/knowledge-base/categories/downloads/){: target="_blank" rel="noopener" class="_"}
(bundled with the PIV tools) to be available in standard library locations.
{% endcomment %}
Yubikey サポートには [Yubico PIV ライブラリ](https://www.yubico.com/support/knowledge-base/categories/downloads/){: target="_blank" class="_"}（PIV にバンドルされる）が必要であり、これは標準的なライブラリディレクトリに配置されます。
@z

@x
## Work with delegation roles
@y
{% comment %}
## Work with delegation roles
{% endcomment %}
{: #work-with-delegation-roles }
## 委任権限を使った作業
@z

@x
Delegation roles simplify collaborator workflows in notary trusted collections, and
also allow for fine-grained permissions within a collection's contents across
delegations. In essence, delegation roles are restricted versions of the targets
role that are only allowed to sign targets within certain filepaths.
@y
{% comment %}
Delegation roles simplify collaborator workflows in notary trusted collections, and
also allow for fine-grained permissions within a collection's contents across
delegations. In essence, delegation roles are restricted versions of the targets
role that are only allowed to sign targets within certain filepaths.
{% endcomment %}
委任権限（delegation role）は Notary トラストコレクションに対して、協力者（collaborator）のワークフローを単純化します。
そしてコレクションのコンテンツに対してきめ細かな権限の委任を可能にします。
委任権限はターゲット権限を制限したものであり、特定のファイルパス内にあるターゲット鍵への署名のみを可能にするものです。
@z

@x
A delegation role is given its own keys, such that each collaborator can keep
his own private key without the administrator having to share the
targets key or allow a collaborator write access to all targets of the
collection.
@y
{% comment %}
A delegation role is given its own keys, such that each collaborator can keep
his own private key without the administrator having to share the
targets key or allow a collaborator write access to all targets of the
collection.
{% endcomment %}
委任権限には独自の鍵、つまり委任鍵が与えられます。
これがあることで各協力者がプライベート鍵を保持できます。
その際には、管理者がターゲット鍵を共有しなければならないとか、コレクションの個々のターゲットに対して書き込み権限を与えないといけない、といったことが不要になります。
@z

@x
Before adding any delegations, you should rotate the snapshot key to the server.
This is done by default for new collections created with a Docker Engine 1.11 client.
Delegation roles do not require the snapshot key to publish
their own targets to the collection, since the server can publish the valid
snapshot with the delegation targets:
@y
{% comment %}
Before adding any delegations, you should rotate the snapshot key to the server.
This is done by default for new collections created with a Docker Engine 1.11 client.
Delegation roles do not require the snapshot key to publish
their own targets to the collection, since the server can publish the valid
snapshot with the delegation targets:
{% endcomment %}
委任鍵を追加するには、サーバーに向けてスナップショット鍵をローテートしておかなければなりません。
これは Docker Engine 1.11 クライアントを利用してコレクションを新規生成すれば、デフォルトで設定されます。
委任鍵は、コレクションのターゲット鍵を公開するためのスナップショット鍵を必要としません。
したがってサーバーは、委任ターゲット鍵を利用して、適正なスナップショット鍵を公開することができます。
@z

@x
```bash
$ notary key rotate example.com/collection snapshot -r
```
@y
```bash
$ notary key rotate example.com/collection snapshot -r
```
@z

@x
Here, `-r` specifies to rotate the key to the remote server.
@y
{% comment %}
Here, `-r` specifies to rotate the key to the remote server.
{% endcomment %}
ここでも`-r`を指定することで、鍵をローテートしてリモートサーバーに配置します。
@z

@x
When adding a delegation, your must acquire a x509 certificate with the public
key of the user you wish to delegate to. The user who assumes this
delegation role must hold the private key to sign content with notary.
@y
{% comment %}
When adding a delegation, your must acquire a x509 certificate with the public
key of the user you wish to delegate to. The user who assumes this
delegation role must hold the private key to sign content with notary.
{% endcomment %}
委任鍵を追加する際には、委任元ユーザーの公開鍵を使った x509 証明書が必要になります。
この委任権限を引き受けるユーザーは、Notary 上のコンテンツに署名できるプライベート鍵を持っておかなければなりません。
@z

@x
Once you've acquired the delegate's x509 certificate, you can add a delegation
for this user:
@y
{% comment %}
Once you've acquired the delegate's x509 certificate, you can add a delegation
for this user:
{% endcomment %}
委任に必要な x509 証明書を取得したら、委任鍵をユーザーに追加することができます。
@z

@x
```bash
$ notary delegation add example.com/collection targets/releases cert.pem --paths="delegation/path"
```
@y
```bash
$ notary delegation add example.com/collection targets/releases cert.pem --paths="delegation/path"
```
@z

@x
The preceding example illustrates a request to add the delegation
`targets/releases` to the GUN `example.com/collection`. The delegation name must
be prefixed by `targets/` to be valid, since all delegations are restricted
versions of the target role. The command adds the public key contained in the
x509 cert `cert.pem` to the `targets/releases` delegation.
@y
{% comment %}
The preceding example illustrates a request to add the delegation
`targets/releases` to the GUN `example.com/collection`. The delegation name must
be prefixed by `targets/` to be valid, since all delegations are restricted
versions of the target role. The command adds the public key contained in the
x509 cert `cert.pem` to the `targets/releases` delegation.
{% endcomment %}
上のコマンドは、委任鍵`targets/releases`を、GUN によって表記された`example.com/collection`に追加すものです。
委任名には頭に`targets/`をつける必要があります。
こうするのは、委任鍵がターゲット鍵の限定バージョンであるからです。
このコマンド実行によって x509 証明書`cert.pem`内に含まれる公開鍵が、委任鍵`targets/releases`に追加されます。
@z

@x
For the `targets/releases` delegation role to sign content, the delegation user
must possess the private key corresponding to this public key. This command
restricts this delegation to only publish content under pathnames prefixed by
`delegation/path`. With the given path of "delegation/path", the `targets/releases`
role could sign paths like "delegation/path/content.txt", "delegation/path_file.txt"
and "delegation/path.txt". You can add more paths in a comma-separated list under
`--paths`, or pass the `--all-paths` flag to allow this delegation to publish
content under any pathname.
@y
{% comment %}
For the `targets/releases` delegation role to sign content, the delegation user
must possess the private key corresponding to this public key. This command
restricts this delegation to only publish content under pathnames prefixed by
`delegation/path`. With the given path of "delegation/path", the `targets/releases`
role could sign paths like "delegation/path/content.txt", "delegation/path_file.txt"
and "delegation/path.txt". You can add more paths in a comma-separated list under
`--paths`, or pass the `--all-paths` flag to allow this delegation to publish
content under any pathname.
{% endcomment %}
コンテンツに署名を行う委任鍵`targets/releases`に対して委任ユーザーは、この公開鍵に対応するプライベート鍵を所有していることが必要です。
上のコマンドは、この委任鍵を用いたコンテンツの公開を、`delegation/path`を頭につけたパスに限って許可するものです。
指定された「delegation/path」というパスを使って、委任鍵`targets/releases`からは「delegation/path/content.txt」、「"delegation/path_file.txt」、「delegation/path.txt」といったパスが署名可能になります。
`--paths`に対してカンマ区切りの文字列リストを加えていけば、そのパスを増やすことができます。
あるいは`--all-paths`フラグを用いれば、どのようなパス名であっても委任鍵がコンテンツを公開できるようになります。
@z

@x
After publishing, you can view delegations using a list command:
@y
{% comment %}
After publishing, you can view delegations using a list command:
{% endcomment %}
公開した後は、以下の出力コマンドを使って委任権限を一覧確認できます。
@z

@x
```bash
$ notary delegation list example.com/collection

      ROLE               PATHS                                   KEY IDS                                THRESHOLD
---------------------------------------------------------------------------------------------------------------
  targets/releases   delegation/path   729c7094a8210fd1e780e7b17b7bb55c9a28a48b871b07f65d97baf93898523a   1
```
@y
```bash
$ notary delegation list example.com/collection

      ROLE               PATHS                                   KEY IDS                                THRESHOLD
---------------------------------------------------------------------------------------------------------------
  targets/releases   delegation/path   729c7094a8210fd1e780e7b17b7bb55c9a28a48b871b07f65d97baf93898523a   1
```
@z

@x
You can see the `targets/releases` with its paths and key IDs. If you wish to modify these fields, you can do so with additional `notary delegation add` or `notary delegation remove` commands on this role.
@y
{% comment %}
You can see the `targets/releases` with its paths and key IDs. If you wish to modify these fields, you can do so with additional `notary delegation add` or `notary delegation remove` commands on this role.
{% endcomment %}
上では`targets/releases`に対するパスと鍵 ID が表示されています。
If you wish to modify these fields, you can do so with additional `notary delegation add` or `notary delegation remove` commands on this role.
@z

@x
A threshold of `1` indicates that only one of the keys specified in `KEY IDS` is required to publish to this delegation. Thresholds other than 1 are not currently supported. To remove a delegation role entirely, or just individual keys and/or paths, use the `notary delegation remove` command:
@y
{% comment %}
A threshold of `1` indicates that only one of the keys specified in `KEY IDS` is required to publish to this delegation. Thresholds other than 1 are not currently supported. To remove a delegation role entirely, or just individual keys and/or paths, use the `notary delegation remove` command:
{% endcomment %}
`THRESHOLD`（しきい値）欄に`1`と示されているのは、`KEY_IDS`欄に指定される鍵のただ 1 つだけが、委任鍵の公開に必要であることを表わしています。
このしきい値は`1`以外は、今のところサポートされていません。
委任権限全体を削除する、あるいは個々の鍵やパスだけを削除するには`notary delegation remove`コマンドを使います。
@z

@x
```bash
$ notary delegation remove example.com/user targets/releases

Are you sure you want to remove all data for this delegation? (yes/no)
yes

Forced removal (including all keys and paths) of delegation role targets/releases to repository "example.com/user" staged for next publish.
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin2">コマンド表記</a></li>
  <li><a data-toggle="tab" href="#japanese2">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin2" class="tab-pane fade in active">
{% capture original-content %}
```bash
$ notary delegation remove example.com/user targets/releases

Are you sure you want to remove all data for this delegation? (yes/no)
yes

Forced removal (including all keys and paths) of delegation role targets/releases to repository "example.com/user" staged for next publish.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese2" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
$ notary delegation remove example.com/user targets/releases

この委任鍵の関連データすべてを削除しますか？ (yes/no)
yes

リポジトリ"example.com/user"に対する委任権限 targets/releases を(すべての鍵と
パスの削除を含め)強制削除し、次回の公開時に向けてステージしました。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
You can remove individual keys and/or paths by passing keys as arguments, and/or
paths under the `--paths` flag. Use `--all-paths` to clear all paths for this
role. If you specify all key IDs currently in the delegation role, you
delete the role entirely.
@y
{% comment %}
You can remove individual keys and/or paths by passing keys as arguments, and/or
paths under the `--paths` flag. Use `--all-paths` to clear all paths for this
role. If you specify all key IDs currently in the delegation role, you
delete the role entirely.
{% endcomment %}
個々の鍵やパスの削除を行うには、引数として鍵を指定するか`--paths`フラグにパスを指定して行います。
`--all-paths`を利用すれば、その権限におけるパス指定をすべて削除できます。
委任権限にある現時点のすべての鍵 ID を指定すると、この権限全体が削除されます。
@z

@x
To add targets to a specified delegation role, we can use the `notary add`
command with the `--roles` flag.
@y
{% comment %}
To add targets to a specified delegation role, we can use the `notary add`
command with the `--roles` flag.
{% endcomment %}
ターゲット鍵を指定する委任権限に追加するには、`notary add`コマンドに`--roles`フラグをつけて実行します。
@z

@x
You must have imported an appropriate delegation key for this role. To do so,
you can run `notary key import <KEY_FILE> --role user` with the private key PEM
file, or drop the private key PEM in `private/tuf_keys` as `<KEY_ID>.key` with
the `role` PEM header set to `user`.
@y
{% comment %}
You must have imported an appropriate delegation key for this role. To do so,
you can run `notary key import <KEY_FILE> --role user` with the private key PEM
file, or drop the private key PEM in `private/tuf_keys` as `<KEY_ID>.key` with
the `role` PEM header set to `user`.
{% endcomment %}
この権限に対しては、あらかじめ適切な委任鍵をインポートしておく必要があります。
これを行うには`notary key import <KEY_FILE> --role user`とコマンド実行します。
このときには秘密鍵の PEM ファイルを使います。
あるいは秘密鍵の PEM ファイルを`<KEY_ID>.key`の形で`private/tuf_keys`に配置し、`user`に設定された`role` PEM ヘッダーを利用します。
@z

@x
```bash
$ notary add example/collections delegation/path/target delegation_file.txt --roles=targets/releases
```
@y
```bash
$ notary add example/collections delegation/path/target delegation_file.txt --roles=targets/releases
```
@z

@x
In the preceding example, you add the target `delegation/path/target` to
collection `example/collections` staged for next publish. The file
`delegation_file.txt` is a target `delegation/path/target` using the delegation
role `targets/releases`. This target's path is valid because it is prefixed by
the delegation role's valid path.
@y
{% comment %}
In the preceding example, you add the target `delegation/path/target` to
collection `example/collections` staged for next publish. The file
`delegation_file.txt` is a target `delegation/path/target` using the delegation
role `targets/releases`. This target's path is valid because it is prefixed by
the delegation role's valid path.
{% endcomment %}
上の例においてはターゲット鍵`delegation/path/target`をコレクション`example/collections`に追加し、次回の公開に向けてステージしています。
ファイル`delegation_file.txt`が、委任権限`targets/releases`を利用するターゲット鍵`delegation/path/target`です。
このパスは、委任権限に対する適正なパスを先頭につけているので、ターゲット鍵として適正です。
@z

@x
The `notary list` and `notary remove` commands can also take the `--roles` flag
to specify roles to list or remove targets from. By default, this operates over
the base `targets` role.
@y
{% comment %}
The `notary list` and `notary remove` commands can also take the `--roles` flag
to specify roles to list or remove targets from. By default, this operates over
the base `targets` role.
{% endcomment %}
`notary list`コマンドや`notary remove`コマンドでも`--roles`フラグをつけることができます。
このフラグによって委任権限を指定して、ターゲット鍵の一覧取得や削除を行います。
この処理はデフォルトでは、ベースとなる`targets`権限に対して動作します。
@z

@x
To remove this target from our delegation, use the `notary remove` command with
the same flag:
@y
{% comment %}
To remove this target from our delegation, use the `notary remove` command with
the same flag:
{% endcomment %}
委任鍵からターゲット鍵を削除するには、`notary remove`コマンドに同じフラグをつけて実行します。
@z

@x
```bash
$ notary remove example/collections delegation/path/target --roles=targets/releases
```
@y
```bash
$ notary remove example/collections delegation/path/target --roles=targets/releases
```
@z

@x
## Use delegations with content trust
@y
{% comment %}
## Use delegations with content trust
{% endcomment %}
{: #use-delegations-with-content-trust }
## コンテントトラストにおける委任権限の利用
@z

@x
Docker Engine 1.10 and above supports the usage of the `targets/releases`
delegation as the canonical source of a trusted image tag, if it exists.
@y
{% comment %}
Docker Engine 1.10 and above supports the usage of the `targets/releases`
delegation as the canonical source of a trusted image tag, if it exists.
{% endcomment %}
Docker Engine 1.10 以降においては、信頼できるイメージタグが存在する場合、その正規ソースとして`targets/releases`委任権限を利用することがサポートされました。
@z

@x
When running `docker pull` with Docker Content Trust on Docker Engine 1.10,
Docker attempts to search the `targets/releases` role for the signed image tag,
and falls back to the default `targets` role if it does not exist. When
searching the default `targets` role, Docker 1.10 may pick up on other
non-`targets/releases` delegation roles' signed images if they exist for this tag.
In Docker 1.11, this behavior is changed such that all `docker pull` commands with
Docker Content Trust must pull tags only signed by the `targets/releases` delegation role
or the `targets` base role.
@y
{% comment %}
When running `docker pull` with Docker Content Trust on Docker Engine 1.10,
Docker attempts to search the `targets/releases` role for the signed image tag,
and falls back to the default `targets` role if it does not exist. When
searching the default `targets` role, Docker 1.10 may pick up on other
non-`targets/releases` delegation roles' signed images if they exist for this tag.
In Docker 1.11, this behavior is changed such that all `docker pull` commands with
Docker Content Trust must pull tags only signed by the `targets/releases` delegation role
or the `targets` base role.
{% endcomment %}
Docker Engine 1.10 の Docker コンテントトラスを使って`docker pull`を実行すると、Docker は署名されたイメージタグに対応する`targets/releases`権限を検索します。
それが見つからなければ、デフォルトの`targets`権限を用います。
`targets`権限を探し出すにあたって Docker 1.10 では、`targets/releases`ではない別の委任権限を使ってタグに署名されたイメージを探してきてしまう場合があります。
Docker 1.11 においてこの動作は変更されました。
Docker コンテントトラストを利用する`docker pull`コマンドでは、`targets/releases`委任権限あるいは基本`targets`権限によって署名されたタグのみをプルするようになりました。
@z

@x
When running `docker push` with Docker Content Trust, Docker Engine 1.10
attempts to sign and push with the `targets/releases` delegation role if it exists,
otherwise falling back to the `targets` role. In Docker 1.11, a `docker push`
attempts to sign and push with all delegation roles directly under targets
(ex: `targets/role` but not `targets/nested/role`) that the user has signing keys for.
If delegation roles exist but the user does not have signing keys, the push fails.
If no delegation roles exist, the push attempts to sign with the base `targets` role.
@y
{% comment %}
When running `docker push` with Docker Content Trust, Docker Engine 1.10
attempts to sign and push with the `targets/releases` delegation role if it exists,
otherwise falling back to the `targets` role. In Docker 1.11, a `docker push`
attempts to sign and push with all delegation roles directly under targets
(ex: `targets/role` but not `targets/nested/role`) that the user has signing keys for.
If delegation roles exist but the user does not have signing keys, the push fails.
If no delegation roles exist, the push attempts to sign with the base `targets` role.
{% endcomment %}
Docker コンテントトラストを使って`docker push`を実行すると、Docker Engine 1.10 は`targets/releases`委任権限があれば、これを使って署名やプッシュを行います。
それがないときは`targets`権限を用います。
Docker 1.11 において`docker push`は、ユーザーが対応署名鍵を持つターゲット鍵（たとえば`targets/role`であって`targets/nested/role`ではない）に基づく、委任権限を直接使って署名およびプッシュを行います。
委任権限があってもユーザーが署名鍵を持っていなければ、プッシュは失敗します。
委任権限がまったくない場合、プッシュ処理においては基本`targets`権限を使って署名を行います。
@z

@x
To use the `targets/releases` role for pushing and pulling images with content trust,
follow the steps above to add and publish the delegation role with notary.
When adding the delegation, the `--all-paths` flag should be used to allow signing all tags.
@y
{% comment %}
To use the `targets/releases` role for pushing and pulling images with content trust,
follow the steps above to add and publish the delegation role with notary.
When adding the delegation, the `--all-paths` flag should be used to allow signing all tags.
{% endcomment %}
コンテントトラストを使ったイメージのプッシュやプルにおいて`targets/releases`権限を使うためには、上で示した手順に従って Notary に委任権限をプッシュして公開してください。
委任権限を追加する際には、全タグへの署名を可能にするために`--all-paths`フラグを指定することが必要です。
@z

@x
## Files and state on disk
@y
{% comment %}
## Files and state on disk
{% endcomment %}
{: #files-and-state-on-disk }
## ディスク上のファイルと状態
@z

@x
Notary stores state in its `trust_dir` directory, which is `~/.notary` by
default or usually `~/.docker/trust` when enabling docker content trust. Within this
directory, `trusted_certificates` stores certificates for bootstrapping trust in
a collection, `tuf` stores TUF metadata and changelists to be applied to a GUN,
and `private` stores private keys.
@y
{% comment %}
Notary stores state in its `trust_dir` directory, which is `~/.notary` by
default or usually `~/.docker/trust` when enabling docker content trust. Within this
directory, `trusted_certificates` stores certificates for bootstrapping trust in
a collection, `tuf` stores TUF metadata and changelists to be applied to a GUN,
and `private` stores private keys.
{% endcomment %}
Notary はその状態を`trust_dir`ディレクトリ内に保持しています。
デフォルトでは`~/.notary`であり、Docker コンテントトラストの有効時には通常`~/.docker/trust`としています。
このディレクトリ内において、`trusted_certificates`にはコレクション内のブートストラップ用の証明書が保存され、`tuf`には TUF メタデータおよび GUN に適用される changelist が保存されています。
また`private`には秘密鍵が保存されています。
@z

@x
The `root_keys` subdirectory within `private` stores root private keys, while
`tuf_keys` stores targets, snapshots, and delegations private keys.
@y
{% comment %}
The `root_keys` subdirectory within `private` stores root private keys, while
`tuf_keys` stores targets, snapshots, and delegations private keys.
{% endcomment %}
`private`配下のサブディレクトリ`root_keys`にはルート秘密鍵が保存され、`tuf_keys`にはターゲット鍵、スナップショット鍵、委任秘密鍵が保存されます。
@z
