%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Automating content push pulls with trust
keywords: trust, security, docker, documentation, automation
title: Automation with content trust
---
@y
---
description: コンテントトラストにおいてプッシュやプルを自動化します。
keywords: trust, security, docker, documentation, automation
title: コンテントトラストの自動化
---
@z

@x
It is very common for Docker Content Trust to be built into existing automation
systems. To allow tools to wrap Docker and push trusted content, there are 
environment variables that can be passed through to the client. 
@y
既存の自動化システムに Docker コンテントトラストを組み入れて構築することは、ごく普通に行われています。
そのシステムから Docker を通じ、信頼できるコンテントをプッシュできるようにするために、環境変数が用意されています。
これがクライアントに受け渡されます。
@z

@x
This guide follows the steps as described 
[here](index.md#signing-images-with-docker-content-trust) so please read 
that and understand its prerequisites. 
@y
本節では [DCT によるイメージへのサイン](index.md#signing-images-with-docker-content-trust) に示した手順を行っているものとします。
したがってその内容はよく読んで、前提条件を理解しておいてください。
@z

@x
When working directly with the Notary client, it uses its [own set of environment variables](../../../notary/reference/client-config.md#environment-variables-optional).
@y
Notary クライアントを直接操作する場合は、[独自の環境変数のセット](../../../notary/reference/client-config.md#environment-variables-optional) を利用します。
@z

@x
## Add a delegation private key
@y
{: #add-a-delegation-private-key }
## 委任鍵ペアの秘密鍵の追加
@z

@x
To automate importing a delegation private key to the local Docker trust store, we 
need to pass a passphrase for the new key. This passphrase will be required 
everytime that delegation signs a tag. 
@y
ローカルの Docker トラストの保存場所に向けて、委任鍵ペアの秘密鍵のインポートを自動化するには、新たな鍵に対するパスフレーズを与える必要があります。
このパスフレーズは、委任鍵ペアによってタグにサインを行う際に、毎回必要となるものです。
@z

@x
```
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="mypassphrase123"
@y
```
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="mypassphrase123"
@z

@x
$ docker trust key load delegation.key --name jeff
Loading key from "delegation.key"...
Successfully imported key from delegation.key
```
@y
$ docker trust key load delegation.key --name jeff
Loading key from "delegation.key"...
Successfully imported key from delegation.key
```
@z

@x
## Add a delegation public key
@y
{: #add-a-delegation-public-key }
## 委任鍵ペアの公開鍵の追加
@z

@x
If you initialising a repository at the same time as adding a Delegation
public key, then you will need to use the local Notary Canonical Root Key's 
passphrase to create the repositories trust data. If the repository has already 
been initiated then you only need the repositories passphrase. 
@y
リポジトリを初期化する際には、同時に委任鍵ペアの公開鍵の登録を行います。
その後にリポジトリ内にトラストデータを生成するわけですが、その際にはローカルの Notary 標準ルート鍵のパスフレーズが必要になります。
リポジトリをすでに初期化済みであれば、リポジトリのパスフレーズだけが必要になります。
@z

@x
```
# Export the Local Root Key Passphrase if required.
$ export DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE="rootpassphrase123"
@y
```
# Export the Local Root Key Passphrase if required.
$ export DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE="rootpassphrase123"
@z

@x
# Export the Repository Passphrase
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="repopassphrase123"
@y
# Export the Repository Passphrase
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="repopassphrase123"
@z

@x
# Initialise Repo and Push Delegation
$ docker trust signer add --key delegation.crt jeff registry.example.com/admin/demo
Adding signer "jeff" to registry.example.com/admin/demo...
Initializing signed repository for registry.example.com/admin/demo...
Successfully initialized "registry.example.com/admin/demo"
Successfully added signer: registry.example.com/admin/demo
```
@y
# Initialise Repo and Push Delegation
$ docker trust signer add --key delegation.crt jeff registry.example.com/admin/demo
Adding signer "jeff" to registry.example.com/admin/demo...
Initializing signed repository for registry.example.com/admin/demo...
Successfully initialized "registry.example.com/admin/demo"
Successfully added signer: registry.example.com/admin/demo
```
@z

@x
## Sign an image
@y
{: #sign-an-image }
## イメージへのサイン
@z

@x
Finally when signing an image, we will need to export the passphrase of the 
signing key. This was created when the key was loaded into the local Docker 
trust store with `$ docker trust key load`.
@y
最後に、イメージへのサインを行うには、サインする鍵のパスフレーズを環境変数に設定することが必要です。
`docker trust key load`を実行していますから、ローカルの Docker トラストの保存場所に、すでに鍵はロードされ生成されています。
@z

@x
```
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="mypassphrase123"
@y
```
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="mypassphrase123"
@z

@x
$ docker trust sign registry.example.com/admin/demo:1
Signing and pushing trust data for local image registry.example.com/admin/demo:1, may overwrite remote trust data
The push refers to repository [registry.example.com/admin/demo]
428c97da766c: Layer already exists
2: digest: sha256:1a6fd470b9ce10849be79e99529a88371dff60c60aab424c077007f6979b4812 size: 524
Signing and pushing trust metadata
Successfully signed registry.example.com/admin/demo:1
```
@y
$ docker trust sign registry.example.com/admin/demo:1
Signing and pushing trust data for local image registry.example.com/admin/demo:1, may overwrite remote trust data
The push refers to repository [registry.example.com/admin/demo]
428c97da766c: Layer already exists
2: digest: sha256:1a6fd470b9ce10849be79e99529a88371dff60c60aab424c077007f6979b4812 size: 524
Signing and pushing trust metadata
Successfully signed registry.example.com/admin/demo:1
```
@z

@x
## Build with content trust
@y
{: #build-with-content-trust }
## コンテントトラストを使ったイメージビルド
@z

@x
You can also build with content trust. Before running the `docker build` command, 
you should set the environment variable `DOCKER_CONTENT_TRUST` either manually or 
in a scripted fashion. Consider the simple Dockerfile below.
@y
イメージをビルドする際に、コンテントトラストを利用することもできます。
`docker build`コマンドを実行する前に、環境変数`DOCKER_CONTENT_TRUST`を手動で設定しておくか、あるいはスクリプトを用意して設定します。
以下のような単純な Dockerfile を例にして説明します。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM docker/trusttest:latest
RUN echo
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM docker/trusttest:latest
RUN echo
```
@z

@x
The `FROM` tag is pulling a signed image. You cannot build an image that has a
`FROM` that is not either present locally or signed. Given that content trust
data exists for the tag `latest`, the following build should succeed:
@y
`FROM`タグによって、サイン済みのイメージをプルします。
`FROM`に指定されたイメージがローカルに存在しない場合、あるいはサインされていない場合、そのイメージをビルドすることはできません。
`latest`タグに対するコンテントトラストデータがある場合、以下のビルドは成功します。
@z

@x
```bash
$  docker build -t docker/trusttest:testing .
Using default tag: latest
latest: Pulling from docker/trusttest
@y
```bash
$  docker build -t docker/trusttest:testing .
Using default tag: latest
latest: Pulling from docker/trusttest
@z

@x
b3dbab3810fc: Pull complete
a9539b34a6ab: Pull complete
Digest: sha256:d149ab53f871
```
@y
b3dbab3810fc: Pull complete
a9539b34a6ab: Pull complete
Digest: sha256:d149ab53f871
```
@z

@x
If content trust is enabled, building from a Dockerfile that relies on tag 
without trust data, causes the build command to fail:
@y
コンテントトラストが有効である場合、トラストデータを用いていない Dockerfile によってビルドを行うと、ビルドコマンドは失敗します。
@z

@x
```bash
$  docker build -t docker/trusttest:testing .
unable to process Dockerfile: No trust data for notrust
```
@y
```bash
$  docker build -t docker/trusttest:testing .
unable to process Dockerfile: No trust data for notrust
```
@z

@x
## Related information
@y
{: #related-information }
## 関連情報
@z

@x
* [Delegations for content trust](trust_delegation.md)
* [Content trust in Docker](index.md)
* [Manage keys for content trust](trust_key_mng.md)
* [Play in a content trust sandbox](trust_sandbox.md)
@y
* [コンテントトラストの委任鍵ペア](trust_delegation.md)
* [Docker のコンテントトラスト](index.md)
* [コンテントトラストにおける鍵の管理](trust_key_mng.md)
* [コンテントトラストのサンドボックスで遊ぶ](trust_sandbox.md)
@z
