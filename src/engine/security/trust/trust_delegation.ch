%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Delegations for content trust
keywords: trust, security, delegations, keys, repository
title: Delegations for content trust
redirect_from:
- /ee/dtr/user/access-dtr/configure-your-notary-client/
---
@y
---
description: コンテントトラストの委任鍵ペア。
keywords: trust, security, delegations, keys, repository
title: コンテントトラストの委任鍵ペア
redirect_from:
- /ee/dtr/user/access-dtr/configure-your-notary-client/
---
@z

@x
Delegations in Docker Content Trust (DCT) allow you to control who can and cannot sign
an image tag. A delegation will have a pair of private and public delegation keys. A delegation 
could contain multiple pairs of keys and contributors in order to a) allow multiple users 
to be part of a delegation, and b) to support key rotation.  
@y
Docker コンテントトラスト (Docker content trust; DCT) における委任鍵ペア（delegations）は、イメージタグへのサインを、誰ができて誰ができないのかを制御するものです。
委任鍵は、委任を行う秘密鍵と公開鍵のペアによって構成されます。
委任鍵には、鍵とその提供者の組み合わせを複数含めることができます。
これにより a) 委任鍵のユーザーを複数にすることができ、b) 鍵のローテーションを可能にします。
@z

@x
The most important delegation within Docker Content Trust is `targets/releases`.
This is seen as the canonical source of a trusted image tag, and without a 
contributor's key being under this delegation, they will be unable to sign a tag.
@y
Docker コンテントトラストにおける委任にあたり、最も重要なものは`targets/releases`です。
これは信頼された（trusted）イメージタグの標準的なソースとして見ることができます。
この委任情報のもとに提供者の鍵が存在していないと、提供者はタグにサインすることができません。
@z

@x
Fortunately when using the `$ docker trust` commands, we will automatically 
initialize a repository, manage the repository keys, and add a collaborator's key to the 
`targets/releases` delegation via `docker trust signer add`. 
@y
`$ docker trust`コマンドを使えば、リポジトリの初期化、リポジトリ鍵の管理を簡単に行うことができます。
また`docker trust signer add`によって`targets/releases`内の委任情報に共同作業者の鍵を含めることができます。
@z

@x
## Configuring the Docker Client
@y
{: #configuring-the-docker-client }
## Docker クライアントの設定
@z

@x
By default, the `$ docker trust` commands expect the notary server URL to be the
same as the registry URL specified in the image tag (following a similar logic to
`$ docker push`). When using Docker Hub or DTR, the notary
server URL is the same as the registry URL. However, for self-hosted
environments or 3rd party registries, you will need to specify an alternative
URL for the notary server. This is done with:
@y
デフォルトで`$ docker trust`コマンドは、イメージタグ内にて指定されているレジストリ URL と Notary サーバーの URL が同一であるものとして扱います（これは`$ docker push`に対するロジックに対応するものです）。
Docker Hub や DTR を利用する際には、Notary サーバーの URL はレジストリ URL と同じです。
しかし独自に立ち上げたサーバー環境やサードパーティー製のレジストリの場合、Notary サーバーには別の URL を指定する必要があります。
これは以下のようにして行います。
@z

@x
```
export DOCKER_CONTENT_TRUST_SERVER=https://<URL>:<PORT>
```
@y
```
export DOCKER_CONTENT_TRUST_SERVER=https://<URL>:<PORT>
```
@z

@x
If you do not export this variable in self-hosted environments, you may see 
errors such as: 
@y
独自に立ち上げているサーバー環境において、この変数を設定していないと、以下のようなエラーが発生します。
@z

@x
```
$ docker trust signer add --key cert.pem jeff registry.example.com/admin/demo
Adding signer "jeff" to registry.example.com/admin/demo...
[...]
Error: trust data missing for remote repository registry.example.com/admin/demo or remote repository not found: timestamp key trust data unavailable.  Has a notary repository been initialized?
@y
```
$ docker trust signer add --key cert.pem jeff registry.example.com/admin/demo
Adding signer "jeff" to registry.example.com/admin/demo...
[...]
Error: trust data missing for remote repository registry.example.com/admin/demo or remote repository not found: timestamp key trust data unavailable.  Has a notary repository been initialized?
@z

@x
$ docker trust inspect registry.example.com/admin/demo --pretty
WARN[0000] Error while downloading remote metadata, using cached timestamp - this might not be the latest version available remotely
[...]
```
@y
$ docker trust inspect registry.example.com/admin/demo --pretty
WARN[0000] Error while downloading remote metadata, using cached timestamp - this might not be the latest version available remotely
[...]
```
@z

@x
If you have enabled authentication for your notary server, or are using DTR, you will need to log in 
before you can push data to the notary server. 
@y
Notary サーバーに対して認証機能を設定済みである場合、あるいは DTR を利用する場合は、Notary サーバーへのデータプッシュの前にログインする必要があります。
@z

@x
```
$ docker login registry.example.com/user/repo
Username: admin
Password:
@y
```
$ docker login registry.example.com/user/repo
Username: admin
Password:
@z

@x
Login Succeeded
@y
Login Succeeded
@z

@x
$ docker trust signer add --key cert.pem jeff registry.example.com/user/repo
Adding signer "jeff" to registry.example.com/user/repo...
Initializing signed repository for registry.example.com/user/repo...
Successfully initialized "registry.example.com/user/repo"
Successfully added signer: jeff to registry.example.com/user/repo
```
@y
$ docker trust signer add --key cert.pem jeff registry.example.com/user/repo
Adding signer "jeff" to registry.example.com/user/repo...
Initializing signed repository for registry.example.com/user/repo...
Successfully initialized "registry.example.com/user/repo"
Successfully added signer: jeff to registry.example.com/user/repo
```
@z

@x
If you do not log in, you will see:
@y
ログインしていなければ、以下のようなメッセージになります。
@z

@x
```console
$ docker trust signer add --key cert.pem jeff registry.example.com/user/repo
Adding signer "jeff" to registry.example.com/user/repo...
Initializing signed repository for registry.example.com/user/repo...
you are not authorized to perform this operation: server returned 401.
@y
```console
$ docker trust signer add --key cert.pem jeff registry.example.com/user/repo
Adding signer "jeff" to registry.example.com/user/repo...
Initializing signed repository for registry.example.com/user/repo...
you are not authorized to perform this operation: server returned 401.
@z

@x
Failed to add signer to: registry.example.com/user/repo
```
@y
Failed to add signer to: registry.example.com/user/repo
```
@z

@x
## Configuring the Notary Client
@y
{: #configuring-the-notary-client }
## Notary クライアントの設定
@z

@x
Some of the more advanced features of DCT require the Notary CLI. To install and 
configure the Notary CLI:
@y
DCT にはさらに高度な機能があって、これを利用するためには Notary CLI が必要になります。
Notary CLI のインストールと設定は以下のようにします。
@z

@x
1. Download the [client](https://github.com/theupdateframework/notary/releases) and ensure that it is available on your path.
@y
1. [クライアント](https://github.com/theupdateframework/notary/releases) をダウンロードし、パス上に配置して利用できるようにします。
@z

@x
2. Create a configuration file at `~/.notary/config.json` with the following content:
@y
2. `~/.notary/config.json`に設定ファイルを生成し、その内容を以下のようにします。
@z

@x
```json
{
  "trust_dir" : "~/.docker/trust",
  "remote_server": {
    "url": "https://registry.example.com",
    "root_ca": "../.docker/ca.pem"
  }
}
```
@y
```json
{
  "trust_dir" : "~/.docker/trust",
  "remote_server": {
    "url": "https://registry.example.com",
    "root_ca": "../.docker/ca.pem"
  }
}
```
@z

@x
The newly created configuration file contains information about the location of your local Docker trust data and the notary server URL.
@y
上で新たに生成した設定ファイルでは、ローカルの Docker トラストデータの場所と Notary サーバーの URL が定義しています。
@z

@x
For more detailed information about how to use notary outside of the
Docker Content Trust use cases, refer to the Notary CLI documentation
[here](https://github.com/theupdateframework/notary/blob/master/docs/command_reference.md){:target="_blank" rel="noopener" class="_"} 
@y
Docker コンテントトラストの利用とは別に、Notary を利用する方法に関しては [ここ](https://github.com/theupdateframework/notary/blob/master/docs/command_reference.md){:target="_blank" rel="noopener" class="_"} にある Notary CLI ドキュメントを参照してください。

@z

@x
## Creating Delegation Keys
@y
{: #creating-delegation-keys }
## 委任鍵ペアの生成
@z

@x
A prerequisite to adding your first contributor is a pair of delegation keys. 
These keys can either be generated locally using `$ docker trust`, generated by 
a certificate authority.
@y
提供者の情報を追加するにあたって必要となるのは、委任鍵 (delegation keys) のペアです。
この鍵は`$ docker trust`を使ってローカル環境で生成することができ、あるいは認証局により生成することもできます。
@z

@x
### Using Docker Trust to Generate Keys
@y
{: #using-docker-trust-to-generate-keys }
### Docker トラストを用いた鍵生成
@z

@x
Docker trust has a built-in generator for a delegation key pair, 
`$ docker trust generate <name>`. Running this command will automatically load 
the delegation private key in to the local Docker trust store. 
@y
Docker トラストには、委任鍵ペアを生成するビルトインのコマンド`$ docker trust generate <name>`があります。
このコマンドを実行すると、Docker トラストのローカルな保存場所に、委任鍵ペアの秘密鍵を自動的にロードします。
@z

@x
```console
$ docker trust key generate jeff
@y
```console
$ docker trust key generate jeff
@z

@x
Generating key for jeff...
Enter passphrase for new jeff key with ID 9deed25: 
Repeat passphrase for new jeff key with ID 9deed25: 
Successfully generated and loaded private key. Corresponding public key available: /home/ubuntu/Documents/mytrustdir/jeff.pub
```
@y
Generating key for jeff...
Enter passphrase for new jeff key with ID 9deed25: 
Repeat passphrase for new jeff key with ID 9deed25: 
Successfully generated and loaded private key. Corresponding public key available: /home/ubuntu/Documents/mytrustdir/jeff.pub
```
@z

@x
### Manually Generating Keys
@y
{: #manually-generating-keys }
### 手動での鍵生成
@z

@x
If you need to manually generate a private key (either RSA or ECDSA) and a x509 
certificate containing the public key, you can use local tools like openssl or 
cfssl along with a local or company-wide Certificate Authority. 
@y
手動によって秘密鍵（RSA か ECDSA）と x509 証明書（公開鍵を含む）を生成する必要がある場合は、ローカルの、あるいは企業保有の認証局を使って openssl や cfssl などのツールを利用します。
@z

@x
Here is an example of how to generate a 2048-bit RSA portion key (all RSA keys
must be at least 2048 bits):
@y
以下は、2048 ビットの RSA 鍵を生成する例です（RSA 鍵は最低でも 2048 ビットが必要）。
@z

@x
```console
$ openssl genrsa -out delegation.key 2048
@y
```console
$ openssl genrsa -out delegation.key 2048
@z

@x
Generating RSA private key, 2048 bit long modulus
....................................................+++
............+++
e is 65537 (0x10001)
```
@y
Generating RSA private key, 2048 bit long modulus
....................................................+++
............+++
e is 65537 (0x10001)
```
@z

@x
They should keep `delegation.key` private because it is used to sign tags.
@y
`delegation.key`は秘密鍵として保持しておきます。
これを使って、タグへのサインを行います。
@z

@x
Then they need to generate an x509 certificate containing the public key, which is
what you need from them. Here is the command to generate a CSR (certificate
signing request):
@y
次に公開鍵を含む x509 証明書を生成する必要があります。
ここから必要となるものが公開鍵です。
以下は CSR (certificate signing request) を生成する例です。
@z

@x
```console
$ openssl req -new -sha256 -key delegation.key -out delegation.csr
```
@y
```console
$ openssl req -new -sha256 -key delegation.key -out delegation.csr
```
@z

@x
Then they can send it to whichever CA you trust to sign certificates, or they
can self-sign the certificate (in this example, creating a certificate that is
valid for 1 year):
@y
Then they can send it to whichever CA you trust to sign certificates, or they
can self-sign the certificate (in this example, creating a certificate that is
valid for 1 year):
@z

@x
```console
$ openssl x509 -req -sha256 -days 365 -in delegation.csr -signkey delegation.key -out delegation.crt
```
@y
```console
$ openssl x509 -req -sha256 -days 365 -in delegation.csr -signkey delegation.key -out delegation.crt
```
@z

@x
Then they need to give you `delegation.crt`, whether it is self-signed or signed
by a CA.
@y
Then they need to give you `delegation.crt`, whether it is self-signed or signed
by a CA.
@z

@x
Finally you will need to add the private key into your local Docker trust store.
@y
最後に Docker トラストのローカルの保存場所に秘密鍵を追加します。
@z

@x
```console
$ docker trust key load delegation.key --name jeff
@y
```console
$ docker trust key load delegation.key --name jeff
@z

@x
Loading key from "delegation.key"...
Enter passphrase for new jeff key with ID 8ae710e: 
Repeat passphrase for new jeff key with ID 8ae710e: 
Successfully imported key from delegation.key
```
@y
Loading key from "delegation.key"...
Enter passphrase for new jeff key with ID 8ae710e: 
Repeat passphrase for new jeff key with ID 8ae710e: 
Successfully imported key from delegation.key
```
@z

@x
### Viewing local Delegation keys 
@y
{: #viewing-local-delegation-keys  }
### ローカルの委任鍵ペアの確認
@z

@x
To list the keys that have been imported in to the local Docker trust store we 
can use the Notary CLI.
@y
Docker トラストのローカルの保存場所にインポートされている鍵は、Notary CLI を利用して一覧表示することができます。
@z

@x
```console
$ notary key list
@y
```console
$ notary key list
@z

@x
ROLE       GUN                          KEY ID                                                              LOCATION
----       ---                          ------                                                              --------
root                                    f6c6a4b00fefd8751f86194c7d87a3bede444540eb3378c4a11ce10852ab1f96    /home/ubuntu/.docker/trust/private
jeff                                    9deed251daa1aa6f9d5f9b752847647cf8d705da0763aa5467650d0987ed5306    /home/ubuntu/.docker/trust/private
```
@y
ROLE       GUN                          KEY ID                                                              LOCATION
----       ---                          ------                                                              --------
root                                    f6c6a4b00fefd8751f86194c7d87a3bede444540eb3378c4a11ce10852ab1f96    /home/ubuntu/.docker/trust/private
jeff                                    9deed251daa1aa6f9d5f9b752847647cf8d705da0763aa5467650d0987ed5306    /home/ubuntu/.docker/trust/private
```
@z

@x
## Managing Delegations in a Notary Server
@y
{: #managing-delegations-in-a-notary-server }
## Notary サーバー上の委任鍵の管理
@z

@x
When the first Delegation is added to the Notary Server using `$ docker trust`,
we automatically initiate trust data for the repository. This includes creating 
the notary target and snapshots keys, and rotating the snapshot key to be 
managed by the notary server. More information on these keys can be found 
[here](trust_key_mng.md)
@y
`$ docker trust`コマンドを使って Notary サーバーに委任鍵を追加すると、リポジトリにおけるトラストデータは、自動的に初期化されます。
この際にはターゲット鍵とスナップショット鍵も生成され、Notary サーバーが管理できるようにスナップショット鍵をローテートします。
これらの鍵に関する詳細は [こちら](trust_key_mng.md) を参照してください。
@z

@x
When initiating a repository, you will need the key and the passphrase of a local
Notary Canonical Root Key. If you have not initiated a repository before, and 
therefore don't have a Notary root key, `$ docker trust` will create one for you.
@y
リポジトリの初期化にあたっては、ローカルの Notary 標準ルート鍵とそのパスフレーズが必要になります。
まだリポジトリを初期化していない場合は、つまり Notary ルート鍵がないので、`$ docker trust`コマンドの実行がこれを生成します。
@z

@x
> Be sure to protect and back up your [Notary Canonical Root Key](trust_key_mng.md)
@y
> [Notary 標準ルート鍵](trust_key_mng.md) は、しっかりと保護しバックアップをとっておいてください。
@z

@x
### Initiating the Repository
@y
{: #initiating-the-repository }
### リポジトリの初期化
@z

@x
To upload the first key to a delegation, at the same time initiating a 
repository, you can use the `$ docker trust signer add` command. This will add 
the contributor's public key to the `targets/releases` delegation, and create a 
second `targets/<name>` delegation. 
@y
To upload the first key to a delegation, at the same time initiating a 
repository, you can use the `$ docker trust signer add` command. This will add 
the contributor's public key to the `targets/releases` delegation, and create a 
second `targets/<name>` delegation. 
@z

@x
For DCT the name of the second delegation, in the below example
`jeff`, is there to help you keep track of the owner of the keys. In more 
advanced use cases of Notary additional delegations are used for hierarchy. 
@y
For DCT the name of the second delegation, in the below example
`jeff`, is there to help you keep track of the owner of the keys. In more 
advanced use cases of Notary additional delegations are used for hierarchy. 
@z

@x
```console
$ docker trust signer add --key cert.pem jeff registry.example.com/admin/demo
@y
```console
$ docker trust signer add --key cert.pem jeff registry.example.com/admin/demo
@z

@x
Adding signer "jeff" to registry.example.com/admin/demo...
Initializing signed repository for registry.example.com/admin/demo...
Enter passphrase for root key with ID f6c6a4b: 
Enter passphrase for new repository key with ID b0014f8: 
Repeat passphrase for new repository key with ID b0014f8: 
Successfully initialized "registry.example.com/admin/demo"
Successfully added signer: jeff to registry.example.com/admin/demo
```
@y
Adding signer "jeff" to registry.example.com/admin/demo...
Initializing signed repository for registry.example.com/admin/demo...
Enter passphrase for root key with ID f6c6a4b: 
Enter passphrase for new repository key with ID b0014f8: 
Repeat passphrase for new repository key with ID b0014f8: 
Successfully initialized "registry.example.com/admin/demo"
Successfully added signer: jeff to registry.example.com/admin/demo
```
@z

@x
You can see which keys have been pushed to the Notary server for each repository
with the `$ docker trust inspect` command. 
@y
You can see which keys have been pushed to the Notary server for each repository
with the `$ docker trust inspect` command. 
@z

@x
```console
$ docker trust inspect --pretty registry.example.com/admin/demo
@y
```console
$ docker trust inspect --pretty registry.example.com/admin/demo
@z

@x
No signatures for registry.example.com/admin/demo
@y
No signatures for registry.example.com/admin/demo
@z

@x
List of signers and their keys for registry.example.com/admin/demo
@y
List of signers and their keys for registry.example.com/admin/demo
@z

@x
SIGNER              KEYS
jeff                1091060d7bfd
@y
SIGNER              KEYS
jeff                1091060d7bfd
@z

@x
Administrative keys for registry.example.com/admin/demo
@y
Administrative keys for registry.example.com/admin/demo
@z

@x
  Repository Key:	b0014f8e4863df2d028095b74efcb05d872c3591de0af06652944e310d96598d
  Root Key:	64d147e59e44870311dd2d80b9f7840039115ef3dfa5008127d769a5f657a5d7
```
@y
  Repository Key:	b0014f8e4863df2d028095b74efcb05d872c3591de0af06652944e310d96598d
  Root Key:	64d147e59e44870311dd2d80b9f7840039115ef3dfa5008127d769a5f657a5d7
```
@z

@x
You could also use the Notary CLI to list delegations and keys. Here you can 
clearly see the keys were attached to `targets/releases` and `targets/jeff`.
@y
You could also use the Notary CLI to list delegations and keys. Here you can 
clearly see the keys were attached to `targets/releases` and `targets/jeff`.
@z

@x
```console
$ notary delegation list registry.example.com/admin/demo
@y
```console
$ notary delegation list registry.example.com/admin/demo
@z

@x
ROLE                PATHS             KEY IDS                                                             THRESHOLD
----                -----             -------                                                             ---------
targets/jeff        "" <all paths>    1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    1
@y
ROLE                PATHS             KEY IDS                                                             THRESHOLD
----                -----             -------                                                             ---------
targets/jeff        "" <all paths>    1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    1
@z

@x
targets/releases    "" <all paths>    1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    1 
```
@y
targets/releases    "" <all paths>    1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    1 
```
@z

@x
### Adding Additional Signers
@y
### Adding Additional Signers
@z

@x
Docker Trust allows you to configure multiple delegations per repository, 
allowing you to manage the lifecycle of delegations. When adding additional 
delegations with `$ docker trust` the collaborators key is once again added to 
the `targets/release` role.
@y
Docker Trust allows you to configure multiple delegations per repository, 
allowing you to manage the lifecycle of delegations. When adding additional 
delegations with `$ docker trust` the collaborators key is once again added to 
the `targets/release` role.
@z

@x
> Note you will need the passphrase for the repository key; this would have been
> configured when you first initiated the repository.
@y
> Note you will need the passphrase for the repository key; this would have been
> configured when you first initiated the repository.
@z

@x
```console
$ docker trust signer add --key ben.pub ben registry.example.com/admin/demo
@y
```console
$ docker trust signer add --key ben.pub ben registry.example.com/admin/demo
@z

@x
Adding signer "ben" to registry.example.com/admin/demo...
Enter passphrase for repository key with ID b0014f8: 
Successfully added signer: ben to registry.example.com/admin/demo
```
@y
Adding signer "ben" to registry.example.com/admin/demo...
Enter passphrase for repository key with ID b0014f8: 
Successfully added signer: ben to registry.example.com/admin/demo
```
@z

@x
Check to prove that there are now 2 delegations (Signer).
@y
Check to prove that there are now 2 delegations (Signer).
@z

@x
```console
$ docker trust inspect --pretty registry.example.com/admin/demo
@y
```console
$ docker trust inspect --pretty registry.example.com/admin/demo
@z

@x
No signatures for registry.example.com/admin/demo
@y
No signatures for registry.example.com/admin/demo
@z

@x
List of signers and their keys for registry.example.com/admin/demo
@y
List of signers and their keys for registry.example.com/admin/demo
@z

@x
SIGNER              KEYS
ben                 afa404703b25
jeff                1091060d7bfd
@y
SIGNER              KEYS
ben                 afa404703b25
jeff                1091060d7bfd
@z

@x
Administrative keys for registry.example.com/admin/demo
@y
Administrative keys for registry.example.com/admin/demo
@z

@x
  Repository Key:	b0014f8e4863df2d028095b74efcb05d872c3591de0af06652944e310d96598d
  Root Key:	64d147e59e44870311dd2d80b9f7840039115ef3dfa5008127d769a5f657a5d7
```
@y
  Repository Key:	b0014f8e4863df2d028095b74efcb05d872c3591de0af06652944e310d96598d
  Root Key:	64d147e59e44870311dd2d80b9f7840039115ef3dfa5008127d769a5f657a5d7
```
@z

@x
### Adding Keys to an Existing Delegation
@y
### Adding Keys to an Existing Delegation
@z

@x
To support things like key rotation and expiring / retiring keys you can publish
multiple contributor keys per delegation. The only prerequisite here is to make
sure you use the same the delegation name, in this case `jeff`. Docker trust 
will automatically handle adding this new key to `targets/releases`. 
@y
To support things like key rotation and expiring / retiring keys you can publish
multiple contributor keys per delegation. The only prerequisite here is to make
sure you use the same the delegation name, in this case `jeff`. Docker trust 
will automatically handle adding this new key to `targets/releases`. 
@z

@x
> Note you will need the passphrase for the repository key; this would have been
> configured when you first initiated the repository.
@y
> Note you will need the passphrase for the repository key; this would have been
> configured when you first initiated the repository.
@z

@x
```console
$ docker trust signer add --key cert2.pem jeff registry.example.com/admin/demo
@y
```console
$ docker trust signer add --key cert2.pem jeff registry.example.com/admin/demo
@z

@x
Adding signer "jeff" to registry.example.com/admin/demo...
Enter passphrase for repository key with ID b0014f8: 
Successfully added signer: jeff to registry.example.com/admin/demo
```
@y
Adding signer "jeff" to registry.example.com/admin/demo...
Enter passphrase for repository key with ID b0014f8: 
Successfully added signer: jeff to registry.example.com/admin/demo
```
@z

@x
Check to prove that the delegation (Signer) now contains multiple Key IDs. 
@y
Check to prove that the delegation (Signer) now contains multiple Key IDs. 
@z

@x
```console
$ docker trust inspect --pretty registry.example.com/admin/demo
@y
```console
$ docker trust inspect --pretty registry.example.com/admin/demo
@z

@x
No signatures for registry.example.com/admin/demo
@y
No signatures for registry.example.com/admin/demo
@z

@x
List of signers and their keys for registry.example.com/admin/demo
@y
List of signers and their keys for registry.example.com/admin/demo
@z

@x
SIGNER              KEYS
jeff                1091060d7bfd, 5570b88df073
@y
SIGNER              KEYS
jeff                1091060d7bfd, 5570b88df073
@z

@x
Administrative keys for registry.example.com/admin/demo
@y
Administrative keys for registry.example.com/admin/demo
@z

@x
  Repository Key:	b0014f8e4863df2d028095b74efcb05d872c3591de0af06652944e310d96598d
  Root Key:	64d147e59e44870311dd2d80b9f7840039115ef3dfa5008127d769a5f657a5d7
```
@y
  Repository Key:	b0014f8e4863df2d028095b74efcb05d872c3591de0af06652944e310d96598d
  Root Key:	64d147e59e44870311dd2d80b9f7840039115ef3dfa5008127d769a5f657a5d7
```
@z

@x
### Removing a Delegation
@y
### Removing a Delegation
@z

@x
If you need to remove a delegation, including the contributor keys that are 
attached to the `targets/releases` role, you can use the 
`$ docker trust signer remove` command.
@y
If you need to remove a delegation, including the contributor keys that are 
attached to the `targets/releases` role, you can use the 
`$ docker trust signer remove` command.
@z

@x
> Note tags that were signed by the removed delegation will need to be resigned 
> by an active delegation
@y
> Note tags that were signed by the removed delegation will need to be resigned 
> by an active delegation
@z

@x
```console
$ docker trust signer remove registry.example.com/admin/demo
Removing signer "ben" from registry.example.com/admin/demo...
Enter passphrase for repository key with ID b0014f8: 
Successfully removed ben from registry.example.com/admin/demo
```
@y
```console
$ docker trust signer remove registry.example.com/admin/demo
Removing signer "ben" from registry.example.com/admin/demo...
Enter passphrase for repository key with ID b0014f8: 
Successfully removed ben from registry.example.com/admin/demo
```
@z

@x
#### Troubleshooting
@y
#### Troubleshooting
@z

@x
1) If you see an error that there are no usable keys in `targets/releases`, you 
will need to add additional delegations using `docker trust signer add` before 
resigning images.
@y
1) If you see an error that there are no usable keys in `targets/releases`, you 
will need to add additional delegations using `docker trust signer add` before 
resigning images.
@z

@x
```console
WARN[0000] role targets/releases has fewer keys than its threshold of 1; it will not be usable until keys are added to it
```
@y
```console
WARN[0000] role targets/releases has fewer keys than its threshold of 1; it will not be usable until keys are added to it
```
@z

@x
2) If you have added additional delegations already and are seeing an error 
message that there are no valid signatures in `targest/releases`, you will need
to resign the `targets/releases` delegation file with the Notary CLI.
@y
2) If you have added additional delegations already and are seeing an error 
message that there are no valid signatures in `targest/releases`, you will need
to resign the `targets/releases` delegation file with the Notary CLI.
@z

@x
```console
WARN[0000] Error getting targets/releases: valid signatures did not meet threshold for targets/releases 
```
@y
```console
WARN[0000] Error getting targets/releases: valid signatures did not meet threshold for targets/releases 
```
@z

@x
Resigning the delegation file is done with the `$ notary witness` command
@y
Resigning the delegation file is done with the `$ notary witness` command
@z

@x
```console
$ notary witness registry.example.com/admin/demo targets/releases --publish
```
@y
```console
$ notary witness registry.example.com/admin/demo targets/releases --publish
```
@z

@x
More information on the `$ notary witness` command can be found 
[here](https://github.com/theupdateframework/notary/blob/master/docs/advanced_usage.md#recovering-a-delegation){:target="_blank" rel="noopener" class="_"}
@y
More information on the `$ notary witness` command can be found 
[here](https://github.com/theupdateframework/notary/blob/master/docs/advanced_usage.md#recovering-a-delegation){:target="_blank" rel="noopener" class="_"}
@z

@x
### Removing a Contributor's Key from a Delegation
@y
### Removing a Contributor's Key from a Delegation
@z

@x
As part of rotating keys for a delegation, you may want to remove an individual 
key but retain the delegation. This can be done with the Notary CLI.
@y
As part of rotating keys for a delegation, you may want to remove an individual 
key but retain the delegation. This can be done with the Notary CLI.
@z

@x
Remember you will have to remove the key from both the `targets/releases` role 
and the role specific to that signer `targets/<name>`.
@y
Remember you will have to remove the key from both the `targets/releases` role 
and the role specific to that signer `targets/<name>`.
@z

@x
1) We will need to grab the Key ID from the Notary Server
@y
1) We will need to grab the Key ID from the Notary Server
@z

@x
```console
$ notary delegation list registry.example.com/admin/demo
@y
```console
$ notary delegation list registry.example.com/admin/demo
@z

@x
ROLE                PATHS             KEY IDS                                                             THRESHOLD
----                -----             -------                                                             ---------
targets/jeff        "" <all paths>    8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    1
                                      1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    
targets/releases    "" <all paths>    8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    1
                                      1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    
```
@y
ROLE                PATHS             KEY IDS                                                             THRESHOLD
----                -----             -------                                                             ---------
targets/jeff        "" <all paths>    8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    1
                                      1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    
targets/releases    "" <all paths>    8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    1
                                      1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    
```
@z

@x
2) Remove from the `targets/releases` delegation
@y
2) Remove from the `targets/releases` delegation
@z

@x
```console
$ notary delegation remove registry.example.com/admin/demo targets/releases 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1 --publish
@y
```console
$ notary delegation remove registry.example.com/admin/demo targets/releases 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1 --publish
@z

@x
Auto-publishing changes to registry.example.com/admin/demo
Enter username: admin
Enter password: 
Enter passphrase for targets key with ID b0014f8: 
Successfully published changes for repository registry.example.com/admin/demo
```
@y
Auto-publishing changes to registry.example.com/admin/demo
Enter username: admin
Enter password: 
Enter passphrase for targets key with ID b0014f8: 
Successfully published changes for repository registry.example.com/admin/demo
```
@z

@x
3) Remove from the `targets/<name>` delegation
@y
3) Remove from the `targets/<name>` delegation
@z

@x
```console
$ notary delegation remove registry.example.com/admin/demo targets/jeff 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1 --publish
@y
```console
$ notary delegation remove registry.example.com/admin/demo targets/jeff 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1 --publish
@z

@x
Removal of delegation role targets/jeff with keys [5570b88df0736c468493247a07e235e35cf3641270c944d0e9e8899922fc6f99], to repository "registry.example.com/admin/demo" staged for next publish.
@y
Removal of delegation role targets/jeff with keys [5570b88df0736c468493247a07e235e35cf3641270c944d0e9e8899922fc6f99], to repository "registry.example.com/admin/demo" staged for next publish.
@z

@x
Auto-publishing changes to registry.example.com/admin/demo
Enter username: admin    
Enter password: 
Enter passphrase for targets key with ID b0014f8: 
Successfully published changes for repository registry.example.com/admin/demo
```
@y
Auto-publishing changes to registry.example.com/admin/demo
Enter username: admin    
Enter password: 
Enter passphrase for targets key with ID b0014f8: 
Successfully published changes for repository registry.example.com/admin/demo
```
@z

@x
4) Check the remaining delegation list 
@y
4) Check the remaining delegation list 
@z

@x
```console
$ notary delegation list registry.example.com/admin/demo
@y
```console
$ notary delegation list registry.example.com/admin/demo
@z

@x
ROLE                PATHS             KEY IDS                                                             THRESHOLD
----                -----             -------                                                             ---------
targets/jeff        "" <all paths>    8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    1    
targets/releases    "" <all paths>    8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    1    
```
@y
ROLE                PATHS             KEY IDS                                                             THRESHOLD
----                -----             -------                                                             ---------
targets/jeff        "" <all paths>    8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    1    
targets/releases    "" <all paths>    8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    1    
```
@z

@x
### Removing a local Delegation Private Key
@y
### Removing a local Delegation Private Key
@z

@x
As part of rotating delegation keys, you may need to remove a local delegation
key from the local Docker trust store. This is done with the Notary CLI, using
the `$ notary key remove` command.
@y
As part of rotating delegation keys, you may need to remove a local delegation
key from the local Docker trust store. This is done with the Notary CLI, using
the `$ notary key remove` command.
@z

@x
1) We will need to get the Key ID from the local Docker Trust store
@y
1) We will need to get the Key ID from the local Docker Trust store
@z

@x
```console
$ notary key list
@y
```console
$ notary key list
@z

@x
ROLE       GUN                          KEY ID                                                              LOCATION
----       ---                          ------                                                              --------
root                                    f6c6a4b00fefd8751f86194c7d87a3bede444540eb3378c4a11ce10852ab1f96    /home/ubuntu/.docker/trust/private
admin                                   8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    /home/ubuntu/.docker/trust/private
jeff                                    1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    /home/ubuntu/.docker/trust/private
targets    ...example.com/admin/demo    c819f2eda8fba2810ec6a7f95f051c90276c87fddfc3039058856fad061c009d    /home/ubuntu/.docker/trust/private
```
@y
ROLE       GUN                          KEY ID                                                              LOCATION
----       ---                          ------                                                              --------
root                                    f6c6a4b00fefd8751f86194c7d87a3bede444540eb3378c4a11ce10852ab1f96    /home/ubuntu/.docker/trust/private
admin                                   8fb597cbaf196f0781628b2f52bff6b3912e4e8075720378fda60d17232bbcf9    /home/ubuntu/.docker/trust/private
jeff                                    1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1    /home/ubuntu/.docker/trust/private
targets    ...example.com/admin/demo    c819f2eda8fba2810ec6a7f95f051c90276c87fddfc3039058856fad061c009d    /home/ubuntu/.docker/trust/private
```
@z

@x
2) Remove the key from the local Docker Trust store
@y
2) Remove the key from the local Docker Trust store
@z

@x
```console
$ notary key remove 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1
@y
```console
$ notary key remove 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1
@z

@x
Are you sure you want to remove 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1 (role jeff) from /home/ubuntu/.docker/trust/private?  (yes/no)  y
@y
Are you sure you want to remove 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1 (role jeff) from /home/ubuntu/.docker/trust/private?  (yes/no)  y
@z

@x
Deleted 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1 (role jeff) from /home/ubuntu/.docker/trust/private.
```
@y
Deleted 1091060d7bfd938dfa5be703fa057974f9322a4faef6f580334f3d6df44c02d1 (role jeff) from /home/ubuntu/.docker/trust/private.
```
@z

@x
## Removing all trust data from a Repository
@y
## Removing all trust data from a Repository
@z

@x
You can remove all trust data from a repository, including repository, target, 
snapshot and all delegations keys using the Notary CLI.
@y
You can remove all trust data from a repository, including repository, target, 
snapshot and all delegations keys using the Notary CLI.
@z

@x
This is often required by a container registry before a particular repository
can be deleted. 
@y
This is often required by a container registry before a particular repository
can be deleted. 
@z

@x
```console
$ notary delete registry.example.com/admin/demo --remote
@y
```console
$ notary delete registry.example.com/admin/demo --remote
@z

@x
Deleting trust data for repository registry.example.com/admin/demo
Enter username: admin
Enter password: 
Successfully deleted local and remote trust data for repository registry.example.com/admin/demo
@y
Deleting trust data for repository registry.example.com/admin/demo
Enter username: admin
Enter password: 
Successfully deleted local and remote trust data for repository registry.example.com/admin/demo
@z

@x
$ docker trust inspect --pretty registry.example.com/admin/demo
@y
$ docker trust inspect --pretty registry.example.com/admin/demo
@z

@x
No signatures or cannot access registry.example.com/admin/demo
```
@y
No signatures or cannot access registry.example.com/admin/demo
```
@z

@x
## Related information
@y
## Related information
@z

@x
* [Content trust in Docker](index.md)
* [Manage keys for content trust](trust_key_mng.md)
* [Automation with content trust](trust_automation.md)
* [Play in a content trust sandbox](trust_sandbox.md)
@y
* [Docker のコンテントトラスト](index.md)
* [コンテントトラストにおける鍵の管理](trust_key_mng.md)
* [コンテントトラストの自動化](trust_automation.md)
* [コンテントトラストのサンドボックスで遊ぶ](trust_sandbox.md)
@z
