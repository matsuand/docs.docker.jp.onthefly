%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Play in a trust sandbox
keywords: trust, security, root,  keys, repository, sandbox
title: Play in a content trust sandbox
redirect_from:
- /security/trust/trust_sandbox/
---
@y
---
description: Play in a trust sandbox
keywords: trust, security, root,  keys, repository, sandbox
title: コンテントトラストのサンドボックスで遊ぶ
redirect_from:
- /security/trust/trust_sandbox/
---
@z

@x
This page explains how to set up and use a sandbox for experimenting with trust.
The sandbox allows you to configure and try trust operations locally without
impacting your production images.
@y
{% comment %}
This page explains how to set up and use a sandbox for experimenting with trust.
The sandbox allows you to configure and try trust operations locally without
impacting your production images.
{% endcomment %}
このページでは、コンテントトラストを試用できるサンドボックスについて、その設定と利用方法を説明します。
サンドボックスはコンテントトラストの操作を、ローカルにおいて設定し試してみることができるものです。
本番環境のイメージに影響を与えることはありません。
@z

@x
Before working through this sandbox, you should have read through the
[trust overview](index.md).
@y
{% comment %}
Before working through this sandbox, you should have read through the
[trust overview](index.md).
{% endcomment %}
サンドボックスの作業を進める前に、[コンテントトラストの概要](index.md) をよく読んでおいてください。
@z

@x
### Prerequisites
@y
{% comment %}
### Prerequisites
{% endcomment %}
{: #prerequisites }
### 前提条件
@z

@x
These instructions assume you are running in Linux or macOS. You can run
this sandbox on a local machine or on a virtual machine. You need to
have privileges to run docker commands on your local machine or in the VM.
@y
{% comment %}
These instructions assume you are running in Linux or macOS. You can run
this sandbox on a local machine or on a virtual machine. You need to
have privileges to run docker commands on your local machine or in the VM.
{% endcomment %}
ここに示す手順においては、Linux または macOS を利用しているものとします。
サンドボックスは、ローカルマシン上、仮想マシン上のいずれにおいても動作します。
そのローカルマシンあるいは仮想マシン上においては、docker コマンドの実行権限が必要です。
@z

@x
This sandbox requires you to install two Docker tools: Docker Engine >= 1.10.0
and Docker Compose >= 1.6.0. To install the Docker Engine, choose from the
[list of supported platforms](../../install/index.md). To install
Docker Compose, see the
[detailed instructions here](../../../compose/install.md).
@y
{% comment %}
This sandbox requires you to install two Docker tools: Docker Engine >= 1.10.0
and Docker Compose >= 1.6.0. To install the Docker Engine, choose from the
[list of supported platforms](../../install/index.md). To install
Docker Compose, see the
[detailed instructions here](../../../compose/install.md).
{% endcomment %}
サンドボックスを利用するためには 2 つの Docker ツールが必要です。
Docker Engine 1.10.0 以上と Docker Compose 1.6.0 以上です。
Docker Engine をインストールするには [対応するプラットフォームの一覧](../../install/index.md) から選んでください。
Docker Compose をインストールするには [インストール手順の詳細](../../../compose/install.md) を参照してください。
@z

@x
## What is in the sandbox?
@y
{% comment %}
## What is in the sandbox?
{% endcomment %}
{: #what-is-in-the-sandbox }
## サンドボックスの中には何があるか
@z

@x
If you are just using trust out-of-the-box you only need your Docker Engine
client and access to the Docker Hub. The sandbox mimics a
production trust environment, and sets up these additional components.
@y
{% comment %}
If you are just using trust out-of-the-box you only need your Docker Engine
client and access to the Docker Hub. The sandbox mimics a
production trust environment, and sets up these additional components.
{% endcomment %}
コンテントトラストを単にインストールしただけの状態である場合、必要なのは Docker Engine クライアントと Docker Hub へアクセスできることだけです。
サンドボックスはコンテントトラストの本番環境をまねて実現しているため、以下のようなコンポーネントを追加設定します。
@z

@x
| Container       | Description                                                                                                                                 |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| trustsandbox    | A container with the latest version of Docker Engine and with some preconfigured certificates. This is your sandbox where you can use the `docker` client to test trust operations. |
| Registry server | A local registry service.                                                                                                                 |
| Notary server   | The service that does all the heavy-lifting of managing trust                                                                               |
@y
{% comment %}
| Container       | Description                                                                                                                                 |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| trustsandbox    | A container with the latest version of Docker Engine and with some preconfigured certificates. This is your sandbox where you can use the `docker` client to test trust operations. |
| Registry server | A local registry service.                                                                                                                 |
| Notary server   | The service that does all the heavy-lifting of managing trust                                                                               |
{% endcomment %}
| コンテナー         | 内容説明                                                                                                                                                 |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| trustsandbox       | Docker Engine の最新版と設定済み証明書が含まれているコンテナー。これがサンドボックスであり、`docker` クライアントを使ってトラスト操作を試行するものです。|
| レジストリサーバー | ローカルのレジストリサービス。                                                                                                                           |
| Notary サーバー    | トラスト管理のための重要な処理を行うサービス。                                                                                                           |
@z

@x
This means you run your own content trust (Notary) server and registry.
If you work exclusively with the Docker Hub, you would not need these components.
They are built into the Docker Hub for you. For the sandbox, however, you build
your own entire, mock production environment.
@y
{% comment %}
This means you run your own content trust (Notary) server and registry.
If you work exclusively with the Docker Hub, you would not need these components.
They are built into the Docker Hub for you. For the sandbox, however, you build
your own entire, mock production environment.
{% endcomment %}
上はつまり、コンテントトラスト（Notary）サーバーとレジストリサーバーは自分で起動するということです。
Docker Hub を主に利用しているのであれば、上のコンポーネントを用意する必要はありません。
Docker Hub にはすべてビルドされ含まれています。
しかしサンドボックスの場合は、本番環境に似せたものを自分でビルドして利用します。
@z

@x
Within the `trustsandbox` container, you interact with your local registry rather
than the Docker Hub. This means your everyday image repositories are not used.
They are protected while you play.
@y
{% comment %}
Within the `trustsandbox` container, you interact with your local registry rather
than the Docker Hub. This means your everyday image repositories are not used.
They are protected while you play.
{% endcomment %}
`trustsandbox` コンテナーでは、Docker Hub ではなく、ローカルのレジストリサーバーとやりとりをします。
日々使っているイメージリポジトリは、ここでは利用しないということです。
サンドボックスで遊んでいる間は、イメージリポジトリは保護されます。
@z

@x
When you play in the sandbox, you also create root and repository keys. The
sandbox is configured to store all the keys and files inside the `trustsandbox`
container. Since the keys you create in the sandbox are for play only,
destroying the container destroys them as well.
@y
{% comment %}
When you play in the sandbox, you also create root and repository keys. The
sandbox is configured to store all the keys and files inside the `trustsandbox`
container. Since the keys you create in the sandbox are for play only,
destroying the container destroys them as well.
{% endcomment %}
サンドボックスで遊ぶ際には、ルート鍵とリポジトリ鍵も生成します。
サンドボックスでは、`trustsandbox` コンテナー内部に、鍵データやファイルは何でも保存できるように設定されています。
サンドボックス内で生成する鍵は、お遊び用なので、コンテナーを削除するときに同時に削除します。
@z

@x
By using a docker-in-docker image for the `trustsandbox` container, you also
don't pollute your real Docker daemon cache with any images you push and pull.
The images are stored in an anonymous volume attached to this container,
and can be destroyed after you destroy the container.
@y
{% comment %}
By using a docker-in-docker image for the `trustsandbox` container, you also
don't pollute your real Docker daemon cache with any images you push and pull.
The images are stored in an anonymous volume attached to this container,
and can be destroyed after you destroy the container.
{% endcomment %}
`trustsandbox` コンテナーにおいては docker-in-docker イメージを使います。
したがって、本物の Docker デーモンとの間でイメージをプッシュ、プルすることはなく、キャッシュを汚すことはありません。
イメージは、このコンテナーにアタッチされた匿名ボリュームに保存します。
そしてコンテナーを削除したときに同時に削除します。
@z

@x
## Build the sandbox
@y
{% comment %}
## Build the sandbox
{% endcomment %}
{: #build-the-sandbox }
## サンドボックスのビルド
@z

@x
In this section, you use Docker Compose to specify how to set up and link together
the `trustsandbox` container, the Notary server, and the Registry server.
@y
{% comment %}
In this section, you use Docker Compose to specify how to set up and link together
the `trustsandbox` container, the Notary server, and the Registry server.
{% endcomment %}
この節では Docker Compose を使って `trustsandbox` コンテナー、Notary サーバー、レジストリサーバーを設定してリンクさせる方法を説明します。
@z

@x
1. Create a new `trustsandbox` directory and change into it.
@y
{% comment %}
1. Create a new `trustsandbox` directory and change into it.
{% endcomment %}
1. 新たなディレクトリ `trustsandbox` を生成してそこに移動します。
@z

@x
        $ mkdir trustsandbox
        $ cd trustsandbox
@y
        $ mkdir trustsandbox
        $ cd trustsandbox
@z

@x
2. Create a file called `docker-compose.yml` with your favorite editor.  For example, using vim:
@y
{% comment %}
2. Create a file called `docker-compose.yml` with your favorite editor.  For example, using vim:
{% endcomment %}
2. 好みのエディターを使って `docker-compose.yml` というファイルを生成します。
   たとえば vim を利用します。
@z

@x
        $ touch docker-compose.yml
        $ vim docker-compose.yml
@y
        $ touch docker-compose.yml
        $ vim docker-compose.yml
@z

@x
3. Add the following to the new file.
@y
{% comment %}
3. Add the following to the new file.
{% endcomment %}
3. ファイルに以下の内容を追加します。
@z

@x
        version: "2"
        services:
          notaryserver:
            image: dockersecurity/notary_autobuilds:server-v0.5.1
            volumes:
              - notarycerts:/var/lib/notary/fixtures
            networks:
              - sandbox
            environment:
              - NOTARY_SERVER_STORAGE_TYPE=memory
              - NOTARY_SERVER_TRUST_SERVICE_TYPE=local
          sandboxregistry:
            image: registry:2.4.1
            networks:
              - sandbox
            container_name: sandboxregistry
          trustsandbox:
            image: docker:dind
            networks:
              - sandbox
            volumes:
              - notarycerts:/notarycerts
            privileged: true
            container_name: trustsandbox
            entrypoint: ""
            command: |-
                sh -c '
                    cp /notarycerts/root-ca.crt /usr/local/share/ca-certificates/root-ca.crt &&
                    update-ca-certificates &&
                    dockerd-entrypoint.sh --insecure-registry sandboxregistry:5000'
        volumes:
          notarycerts:
            external: false
        networks:
          sandbox:
            external: false
@y
        version: "2"
        services:
          notaryserver:
            image: dockersecurity/notary_autobuilds:server-v0.5.1
            volumes:
              - notarycerts:/var/lib/notary/fixtures
            networks:
              - sandbox
            environment:
              - NOTARY_SERVER_STORAGE_TYPE=memory
              - NOTARY_SERVER_TRUST_SERVICE_TYPE=local
          sandboxregistry:
            image: registry:2.4.1
            networks:
              - sandbox
            container_name: sandboxregistry
          trustsandbox:
            image: docker:dind
            networks:
              - sandbox
            volumes:
              - notarycerts:/notarycerts
            privileged: true
            container_name: trustsandbox
            entrypoint: ""
            command: |-
                sh -c '
                    cp /notarycerts/root-ca.crt /usr/local/share/ca-certificates/root-ca.crt &&
                    update-ca-certificates &&
                    dockerd-entrypoint.sh --insecure-registry sandboxregistry:5000'
        volumes:
          notarycerts:
            external: false
        networks:
          sandbox:
            external: false
@z

@x
4. Save and close the file.
@y
{% comment %}
4. Save and close the file.
{% endcomment %}
4. ファイルを保存して閉じます。
@z

@x
5. Run the containers on your local system.
@y
{% comment %}
5. Run the containers on your local system.
{% endcomment %}
5. ローカルシステム上においてコンテナーを起動します。
@z

@x
        $ docker-compose up -d
@y
        $ docker-compose up -d
@z

@x
    The first time you run this, the docker-in-docker, Notary server, and registry
    images are downloaded from Docker Hub.
@y
    {% comment %}
    The first time you run this, the docker-in-docker, Notary server, and registry
    images are downloaded from Docker Hub.
    {% endcomment %}
    初回起動の際には docker-in-docker、Notary サーバー、レジストリの各イメージが Docker Hub からダウンロードされます。
@z

@x
## Play in the sandbox
@y
{% comment %}
## Play in the sandbox
{% endcomment %}
## サンドボックスで遊ぶ
@z

@x
Now that everything is setup, you can go into your `trustsandbox` container and
start testing Docker content trust. From your host machine, obtain a shell
in the `trustsandbox` container.
@y
{% comment %}
Now that everything is setup, you can go into your `trustsandbox` container and
start testing Docker content trust. From your host machine, obtain a shell
in the `trustsandbox` container.
{% endcomment %}
設定がすべてできたので、`trustsandbox` コンテナー内に入って、Docker コンテントトラストの試しに使ってみます。
ホストマシンから `trustsandbox` コンテナー内のシェルにアクセスします。
@z

@x
    $ docker container exec -it trustsandbox sh
    / #
@y
    $ docker container exec -it trustsandbox sh
    / #
@z

@x
### Test some trust operations
@y
{% comment %}
### Test some trust operations
{% endcomment %}
{: #test-some-trust-operations }
### コンテントトラストの操作実行
@z

@x
Now, pull some images from within the `trustsandbox` container.
@y
{% comment %}
Now, pull some images from within the `trustsandbox` container.
{% endcomment %}
`trustsandbox` コンテナー内から、イメージをプルしてみます。
@z

@x
1. Download a `docker` image to test with.
@y
{% comment %}
1. Download a `docker` image to test with.
{% endcomment %}
1. `docker` イメージをダウンロードします。
@z

@x
        / # docker pull docker/trusttest
        docker pull docker/trusttest
        Using default tag: latest
        latest: Pulling from docker/trusttest
@y
        / # docker pull docker/trusttest
        docker pull docker/trusttest
        Using default tag: latest
        latest: Pulling from docker/trusttest
@z

@x
        b3dbab3810fc: Pull complete
        a9539b34a6ab: Pull complete
        Digest: sha256:d149ab53f8718e987c3a3024bb8aa0e2caadf6c0328f1d9d850b2a2a67f2819a
        Status: Downloaded newer image for docker/trusttest:latest
@y
        b3dbab3810fc: Pull complete
        a9539b34a6ab: Pull complete
        Digest: sha256:d149ab53f8718e987c3a3024bb8aa0e2caadf6c0328f1d9d850b2a2a67f2819a
        Status: Downloaded newer image for docker/trusttest:latest
@z

@x
2. Tag it to be pushed to our sandbox registry:
@y
{% comment %}
2. Tag it to be pushed to our sandbox registry:
{% endcomment %}
2. サンドボックスレジストリにそのイメージをプッシュするために、タグづけを行ないます。
@z

@x
        / # docker tag docker/trusttest sandboxregistry:5000/test/trusttest:latest
@y
        / # docker tag docker/trusttest sandboxregistry:5000/test/trusttest:latest
@z

@x
3. Enable content trust.
@y
{% comment %}
3. Enable content trust.
{% endcomment %}
3. コンテントトラストを有効にします。
@z

@x
        / # export DOCKER_CONTENT_TRUST=1
@y
        / # export DOCKER_CONTENT_TRUST=1
@z

@x
4. Identify the trust server.
@y
{% comment %}
4. Identify the trust server.
{% endcomment %}
4. コンテントトラストサーバーを指定します。
@z

@x
        / # export DOCKER_CONTENT_TRUST_SERVER=https://notaryserver:4443
@y
        / # export DOCKER_CONTENT_TRUST_SERVER=https://notaryserver:4443
@z

@x
    This step is only necessary because the sandbox is using its own server.
    Normally, if you are using the Docker Public Hub this step isn't necessary.
@y
    {% comment %}
    This step is only necessary because the sandbox is using its own server.
    Normally, if you are using the Docker Public Hub this step isn't necessary.
    {% endcomment %}
    この手順は、サンドボックスが独自のサーバーを利用しているために必要となるものです。
    通常 Docker Hub を利用している場合、この手順は不要です。
@z

@x
5. Pull the test image.
@y
{% comment %}
5. Pull the test image.
{% endcomment %}
5. テストイメージをプルします。
@z

@x
        / # docker pull sandboxregistry:5000/test/trusttest
        Using default tag: latest
        Error: remote trust data does not exist for sandboxregistry:5000/test/trusttest: notaryserver:4443 does not have trust data for sandboxregistry:5000/test/trusttest
@y
        / # docker pull sandboxregistry:5000/test/trusttest
        Using default tag: latest
        Error: remote trust data does not exist for sandboxregistry:5000/test/trusttest: notaryserver:4443 does not have trust data for sandboxregistry:5000/test/trusttest
@z

@x
      You see an error, because this content doesn't exist on the `notaryserver` yet.
@y
      {% comment %}
      You see an error, because this content doesn't exist on the `notaryserver` yet.
      {% endcomment %}
      エラーになりました。
      そのコンテントがまだ `notaryserver` には存在していないからです。
@z

@x
6. Push and sign the trusted image.
@y
{% comment %}
6. Push and sign the trusted image.
{% endcomment %}
6. イメージをプッシュして、信頼された（trusted）イメージとしてサインします。
@z

@x
        / # docker push sandboxregistry:5000/test/trusttest:latest
        The push refers to a repository [sandboxregistry:5000/test/trusttest]
        5f70bf18a086: Pushed
        c22f7bc058a9: Pushed
        latest: digest: sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926 size: 734
        Signing and pushing trust metadata
        You are about to create a new root signing key passphrase. This passphrase
        will be used to protect the most sensitive key in your signing system. Please
        choose a long, complex passphrase and be careful to keep the password and the
        key file itself secure and backed up. It is highly recommended that you use a
        password manager to generate the passphrase and keep it safe. There will be no
        way to recover this key. You can find the key in your config directory.
        Enter passphrase for new root key with ID 27ec255:
        Repeat passphrase for new root key with ID 27ec255:
        Enter passphrase for new repository key with ID 58233f9 (sandboxregistry:5000/test/trusttest):
        Repeat passphrase for new repository key with ID 58233f9 (sandboxregistry:5000/test/trusttest):
        Finished initializing "sandboxregistry:5000/test/trusttest"
        Successfully signed "sandboxregistry:5000/test/trusttest":latest
@y
        / # docker push sandboxregistry:5000/test/trusttest:latest
        The push refers to a repository [sandboxregistry:5000/test/trusttest]
        5f70bf18a086: Pushed
        c22f7bc058a9: Pushed
        latest: digest: sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926 size: 734
        Signing and pushing trust metadata
        You are about to create a new root signing key passphrase. This passphrase
        will be used to protect the most sensitive key in your signing system. Please
        choose a long, complex passphrase and be careful to keep the password and the
        key file itself secure and backed up. It is highly recommended that you use a
        password manager to generate the passphrase and keep it safe. There will be no
        way to recover this key. You can find the key in your config directory.
        Enter passphrase for new root key with ID 27ec255:
        Repeat passphrase for new root key with ID 27ec255:
        Enter passphrase for new repository key with ID 58233f9 (sandboxregistry:5000/test/trusttest):
        Repeat passphrase for new repository key with ID 58233f9 (sandboxregistry:5000/test/trusttest):
        Finished initializing "sandboxregistry:5000/test/trusttest"
        Successfully signed "sandboxregistry:5000/test/trusttest":latest
@z

@x
    Because you are pushing this repository for the first time, Docker creates
    new root and repository keys and asks you for passphrases with which to
    encrypt them. If you push again after this, it only asks you for repository
    passphrase so it can decrypt the key and sign again.
@y
    {% comment %}
    Because you are pushing this repository for the first time, Docker creates
    new root and repository keys and asks you for passphrases with which to
    encrypt them. If you push again after this, it only asks you for repository
    passphrase so it can decrypt the key and sign again.
    {% endcomment %}
    レジストリに対してプッシュするのが初めてなので、Docker はルート鍵とリポジトリ鍵を生成します。
    ここで鍵の暗号化を行うためのパスフレーズの入力を求められます。
    これを行った後に再びプッシュすると、リポジトリに対するパスフレーズのみの入力が求められるだけです。
    これにより鍵の復号化とイメージへのサインが可能となります。
@z

@x
7. Try pulling the image you just pushed:
@y
{% comment %}
7. Try pulling the image you just pushed:
{% endcomment %}
7. プッシュしたばかりのイメージをプルしてみます。
@z

@x
        / # docker pull sandboxregistry:5000/test/trusttest
        Using default tag: latest
        Pull (1 of 1): sandboxregistry:5000/test/trusttest:latest@sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926
        sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926: Pulling from test/trusttest
        Digest: sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926
        Status: Downloaded newer image for sandboxregistry:5000/test/trusttest@sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926
        Tagging sandboxregistry:5000/test/trusttest@sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926 as sandboxregistry:5000/test/trusttest:latest
@y
        / # docker pull sandboxregistry:5000/test/trusttest
        Using default tag: latest
        Pull (1 of 1): sandboxregistry:5000/test/trusttest:latest@sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926
        sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926: Pulling from test/trusttest
        Digest: sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926
        Status: Downloaded newer image for sandboxregistry:5000/test/trusttest@sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926
        Tagging sandboxregistry:5000/test/trusttest@sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926 as sandboxregistry:5000/test/trusttest:latest
@z

@x
### Test with malicious images
@y
{% comment %}
### Test with malicious images
{% endcomment %}
{: #test-with-malicious-images }
### 悪意あるイメージの確認
@z

@x
What happens when data is corrupted and you try to pull it when trust is
enabled? In this section, you go into the `sandboxregistry` and tamper with some
data. Then, you try and pull it.
@y
{% comment %}
What happens when data is corrupted and you try to pull it when trust is
enabled? In this section, you go into the `sandboxregistry` and tamper with some
data. Then, you try and pull it.
{% endcomment %}
コンテントトラストが有効な状態において、壊れているデータをプルしようとしたら、どうなるでしょう。
この節においては `sandboxregistry` にアクセスしてデータを改ざんし、その後にプルを試してみます。
@z

@x
1.  Leave the `trustsandbox` shell and container running.
@y
{% comment %}
1.  Leave the `trustsandbox` shell and container running.
{% endcomment %}
1.  `trustsandbox` コンテナーとシェルアクセスをそのまま実行しておきます。
@z

@x
2.  Open a new interactive terminal from your host, and obtain a shell into the
    `sandboxregistry` container.
@y
{% comment %}
2.  Open a new interactive terminal from your host, and obtain a shell into the
    `sandboxregistry` container.
{% endcomment %}
2.  ホストから対話を行うための端末画面を新たに開きます。
    そして `sandboxregistry` コンテナー内のシェルにアクセスします。
@z

@x
        $ docker container exec -it sandboxregistry bash
        root@65084fc6f047:/#
@y
        $ docker container exec -it sandboxregistry bash
        root@65084fc6f047:/#
@z

@x
3.  List the layers for the `test/trusttest` image you pushed:
@y
{% comment %}
3.  List the layers for the `test/trusttest` image you pushed:
{% endcomment %}
3.  プッシュした `test/trusttest` イメージのレイヤー一覧を表示します。
@z

@x
    ```bash
    root@65084fc6f047:/# ls -l /var/lib/registry/docker/registry/v2/repositories/test/trusttest/_layers/sha256
    total 12
    drwxr-xr-x 2 root root 4096 Jun 10 17:26 a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
    drwxr-xr-x 2 root root 4096 Jun 10 17:26 aac0c133338db2b18ff054943cee3267fe50c75cdee969aed88b1992539ed042
    drwxr-xr-x 2 root root 4096 Jun 10 17:26 cc7629d1331a7362b5e5126beb5bf15ca0bf67eb41eab994c719a45de53255cd
    ```
@y
    ```bash
    root@65084fc6f047:/# ls -l /var/lib/registry/docker/registry/v2/repositories/test/trusttest/_layers/sha256
    total 12
    drwxr-xr-x 2 root root 4096 Jun 10 17:26 a3ed95caeb02ffe68cdd9fd84406680ae93d633cb16422d00e8a7c22955b46d4
    drwxr-xr-x 2 root root 4096 Jun 10 17:26 aac0c133338db2b18ff054943cee3267fe50c75cdee969aed88b1992539ed042
    drwxr-xr-x 2 root root 4096 Jun 10 17:26 cc7629d1331a7362b5e5126beb5bf15ca0bf67eb41eab994c719a45de53255cd
    ```
@z

@x
4.  Change into the registry storage for one of those layers (this is in a different directory):
@y
{% comment %}
4.  Change into the registry storage for one of those layers (this is in a different directory):
{% endcomment %}
4.  このレイヤーの 1 つであるレジストリサーバーの保存ディレクトリに移動します。
    （これは別ディレクトリにあります。）
@z

@x
        root@65084fc6f047:/# cd /var/lib/registry/docker/registry/v2/blobs/sha256/aa/aac0c133338db2b18ff054943cee3267fe50c75cdee969aed88b1992539ed042
@y
        root@65084fc6f047:/# cd /var/lib/registry/docker/registry/v2/blobs/sha256/aa/aac0c133338db2b18ff054943cee3267fe50c75cdee969aed88b1992539ed042
@z

@x
5.  Add malicious data to one of the `trusttest` layers:
@y
{% comment %}
5.  Add malicious data to one of the `trusttest` layers:
{% endcomment %}
5.  `trusttest` レイヤーに悪意のあるデータを追加します。
@z

@x
        root@65084fc6f047:/# echo "Malicious data" > data
@y
        root@65084fc6f047:/# echo "Malicious data" > data
@z

@x
6.  Go back to your `trustsandbox` terminal.
@y
{% comment %}
6.  Go back to your `trustsandbox` terminal.
{% endcomment %}
6.  `trustsandbox` 端末画面に戻ります。
@z

@x
7.  List the `trusttest` image.
@y
{% comment %}
7.  List the `trusttest` image.
{% endcomment %}
7.  `trusttest` イメージの一覧を表示します。
@z

@x
        / # docker image ls | grep trusttest
        REPOSITORY                            TAG                 IMAGE ID            CREATED             SIZE
        docker/trusttest                      latest              cc7629d1331a        11 months ago       5.025 MB
        sandboxregistry:5000/test/trusttest   latest              cc7629d1331a        11 months ago       5.025 MB
        sandboxregistry:5000/test/trusttest   <none>              cc7629d1331a        11 months ago       5.025 MB
@y
        / # docker image ls | grep trusttest
        REPOSITORY                            TAG                 IMAGE ID            CREATED             SIZE
        docker/trusttest                      latest              cc7629d1331a        11 months ago       5.025 MB
        sandboxregistry:5000/test/trusttest   latest              cc7629d1331a        11 months ago       5.025 MB
        sandboxregistry:5000/test/trusttest   <none>              cc7629d1331a        11 months ago       5.025 MB
@z

@x
8.  Remove the `trusttest:latest` image from our local cache.
@y
{% comment %}
8.  Remove the `trusttest:latest` image from our local cache.
{% endcomment %}
8.  ローカルのキャッシュから `trusttest:latest` イメージを削除します。
@z

@x
        / # docker image rm -f cc7629d1331a
        Untagged: docker/trusttest:latest
        Untagged: sandboxregistry:5000/test/trusttest:latest
        Untagged: sandboxregistry:5000/test/trusttest@sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926
        Deleted: sha256:cc7629d1331a7362b5e5126beb5bf15ca0bf67eb41eab994c719a45de53255cd
        Deleted: sha256:2a1f6535dc6816ffadcdbe20590045e6cbf048d63fd4cc753a684c9bc01abeea
        Deleted: sha256:c22f7bc058a9a8ffeb32989b5d3338787e73855bf224af7aa162823da015d44c
@y
        / # docker image rm -f cc7629d1331a
        Untagged: docker/trusttest:latest
        Untagged: sandboxregistry:5000/test/trusttest:latest
        Untagged: sandboxregistry:5000/test/trusttest@sha256:ebf59c538accdf160ef435f1a19938ab8c0d6bd96aef8d4ddd1b379edf15a926
        Deleted: sha256:cc7629d1331a7362b5e5126beb5bf15ca0bf67eb41eab994c719a45de53255cd
        Deleted: sha256:2a1f6535dc6816ffadcdbe20590045e6cbf048d63fd4cc753a684c9bc01abeea
        Deleted: sha256:c22f7bc058a9a8ffeb32989b5d3338787e73855bf224af7aa162823da015d44c
@z

@x
    Docker does not re-download images that it already has cached, but we want
    Docker to attempt to download the tampered image from the registry and reject
    it because it is invalid.
@y
    {% comment %}
    Docker does not re-download images that it already has cached, but we want
    Docker to attempt to download the tampered image from the registry and reject
    it because it is invalid.
    {% endcomment %}
    Docker は、一度キャッシュされたイメージを再ダウンロードしません。
    しかしここでは Docker がダウンロード実行するようにします。
    レジストリからダウンロードされるイメージは改ざんされたものであり、不正なものであることからダウンロードは拒否されます。
@z

@x
8.  Pull the image again. This downloads the image from the registry, because we don't have it cached.
@y
{% comment %}
8.  Pull the image again. This downloads the image from the registry, because we don't have it cached.
{% endcomment %}
8.  イメージを再びプルします。
    キャッシュが存在しないため、レジストリからイメージがダウンロードされます。
@z

@x
        / # docker pull sandboxregistry:5000/test/trusttest
        Using default tag: latest
        Pull (1 of 1): sandboxregistry:5000/test/trusttest:latest@sha256:35d5bc26fd358da8320c137784fe590d8fcf9417263ef261653e8e1c7f15672e
        sha256:35d5bc26fd358da8320c137784fe590d8fcf9417263ef261653e8e1c7f15672e: Pulling from test/trusttest
@y
        / # docker pull sandboxregistry:5000/test/trusttest
        Using default tag: latest
        Pull (1 of 1): sandboxregistry:5000/test/trusttest:latest@sha256:35d5bc26fd358da8320c137784fe590d8fcf9417263ef261653e8e1c7f15672e
        sha256:35d5bc26fd358da8320c137784fe590d8fcf9417263ef261653e8e1c7f15672e: Pulling from test/trusttest
@z

@x
        aac0c133338d: Retrying in 5 seconds
        a3ed95caeb02: Download complete
        error pulling image configuration: unexpected EOF
@y
        aac0c133338d: Retrying in 5 seconds
        a3ed95caeb02: Download complete
        error pulling image configuration: unexpected EOF
@z

@x
      The pull did not complete because the trust system couldn't verify the
      image.
@y
      {% comment %}
      The pull did not complete because the trust system couldn't verify the
      image.
      {% endcomment %}
      プルは正常終了しません。
      コンテントトラストシステムが、イメージ確認に失敗したからです。
@z

@x
## More play in the sandbox
@y
{% comment %}
## More play in the sandbox
{% endcomment %}
{: #more-play-in-the-sandbox }
## サンドボックスでもっと遊ぶ
@z

@x
Now, you have a full Docker content trust sandbox on your local system,
feel free to play with it and see how it behaves. If you find any security
issues with Docker, feel free to send us an email at <security@docker.com>.
@y
{% comment %}
Now, you have a full Docker content trust sandbox on your local system,
feel free to play with it and see how it behaves. If you find any security
issues with Docker, feel free to send us an email at <security@docker.com>.
{% endcomment %}
ここまでに手元のローカルシステムには、Docker コンテントトラストのサンドボックスができあがっています。
あれこれと自由に遊んでみて、どんな動きになるかを確認してください。
Docker に対してセキュリティに問題があることがわかったら、気がねなく <security@docker.com> へメールしてください。
@z

@x
## Clean up your sandbox
@y
{% comment %}
## Clean up your sandbox
{% endcomment %}
{: #clean-up-your-sandbox }
## サンドボックス環境のクリア
@z

@x
When you are done, and want to clean up all the services you've started and any
anonymous volumes that have been created, just run the following command in the
directory where you've created your Docker Compose file:
@y
{% comment %}
When you are done, and want to clean up all the services you've started and any
anonymous volumes that have been created, just run the following command in the
directory where you've created your Docker Compose file:
{% endcomment %}
十分確認ができたら、起動したサービス、生成された匿名ボリュームなど一切を削除します。
Docker Compose ファイルを生成したディレクトリに入って、以下のコマンドを実行します。
@z

@x
        $ docker-compose down -v
@y
        $ docker-compose down -v
@z
