%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explains how to deploy a registry
keywords: registry, on-prem, images, tags, repository, distribution, deployment
title: Deploy a registry server
---
@y
---
description: Explains how to deploy a registry
keywords: registry, on-prem, images, tags, repository, distribution, deployment
title: Registry サーバーのデプロイ
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
Before you can deploy a registry, you need to install Docker on the host.
A registry is an instance of the `registry` image, and runs within Docker.
@y
{% comment %}
Before you can deploy a registry, you need to install Docker on the host.
A registry is an instance of the `registry` image, and runs within Docker.
{% endcomment %}
Registry をデプロイするには、まずホスト上に Docker をインストールする必要があります。
Registry は `registry` イメージのインスタンスの 1 つであり、Docker の内部において稼動します。
@z

@x
This topic provides basic information about deploying and configuring a
registry. For an exhaustive list of configuration options, see the
[configuration reference](configuration.md).
@y
{% comment %}
This topic provides basic information about deploying and configuring a
registry. For an exhaustive list of configuration options, see the
[configuration reference](configuration.md).
{% endcomment %}
このトピックでは Registry のデプロイと設定方法に関する基本的な情報を示します。
設定オプションの全一覧については [設定リファレンス](configuration.md) を参照してください。
@z

@x
If you have an air-gapped datacenter, see
[Considerations for air-gapped registries](#considerations-for-air-gapped-registries).
@y
{% comment %}
If you have an air-gapped datacenter, see
[Considerations for air-gapped registries](#considerations-for-air-gapped-registries).
{% endcomment %}
外部から隔離された（air-gapped）データセンターを利用している場合は、[隔離されたデータセンターでの配慮](#considerations-for-air-gapped-registries) を参照してください。
@z

@x
## Run a local registry
@y
{% comment %}
## Run a local registry
{% endcomment %}
{: #run-a-local-registry }
## ローカル Registry の起動
@z

@x
Use a command like the following to start the registry container:
@y
{% comment %}
Use a command like the following to start the registry container:
{% endcomment %}
以下のようなコマンドを実行して Registry コンテナーを起動します。
@z

@x
```bash
$ docker run -d -p 5000:5000 --restart=always --name registry registry:2
```
@y
```bash
$ docker run -d -p 5000:5000 --restart=always --name registry registry:2
```
@z

@x
The registry is now ready to use.
@y
{% comment %}
The registry is now ready to use.
{% endcomment %}
Registry がこうして利用できるようになります。
@z

@x
> **Warning**: These first few examples show registry configurations that are
> only appropriate for testing. A production-ready registry must be protected by
> TLS and should ideally use an access-control mechanism. Keep reading and then
> continue to the [configuration guide](configuration.md) to deploy a
> production-ready registry.
@y
{% comment %}
> **Warning**: These first few examples show registry configurations that are
> only appropriate for testing. A production-ready registry must be protected by
> TLS and should ideally use an access-control mechanism. Keep reading and then
> continue to the [configuration guide](configuration.md) to deploy a
> production-ready registry.
{% endcomment %}
> **警告**: ここに例としていくつか示す Registry の設定は、テスト環境向けにしか考慮していません。
> 本番環境向けの Registry であれば、TLS によって保護することが必要であり、理想的にはアクセス制御システムの利用が求められます。
> ここでの説明を読み終えたら、本番環境向け Registry をデプロイするための [設定ガイド](configuration.md) に進んでください。
@z

@x
## Copy an image from Docker Hub to your registry
@y
{% comment %}
## Copy an image from Docker Hub to your registry
{% endcomment %}
{: #copy-an-image-from-docker-hub-to-your-registry }
## Docker Hub から Registry へのイメージコピー
@z

@x
You can pull an image from Docker Hub and push it to your registry. The
following example pulls the `ubuntu:16.04` image from Docker Hub and re-tags it
as `my-ubuntu`, then pushes it to the local registry. Finally, the
`ubuntu:16.04` and `my-ubuntu` images are deleted locally and the
`my-ubuntu` image is pulled from the local registry.
@y
{% comment %}
You can pull an image from Docker Hub and push it to your registry. The
following example pulls the `ubuntu:16.04` image from Docker Hub and re-tags it
as `my-ubuntu`, then pushes it to the local registry. Finally, the
`ubuntu:16.04` and `my-ubuntu` images are deleted locally and the
`my-ubuntu` image is pulled from the local registry.
{% endcomment %}
イメージは Docker Hub からプルして、それを Registry にプッシュすることができます。
以下の例では Docker Hub から `ubuntu:16.04` イメージをプルして、そこに `my-ubuntu` というタグをつけ直します。
そしてローカルな Registry にプッシュします。
その後にローカル上から `ubuntu:16.04` と `my-ubuntu` のイメージを削除した上で、ローカル Registry から `my-ubuntu` イメージをプルします。
@z

@x
1.  Pull the `ubuntu:16.04` image from Docker Hub.
@y
{% comment %}
1.  Pull the `ubuntu:16.04` image from Docker Hub.
{% endcomment %}
1.  Docker Hub から `ubuntu:16.04` イメージをプルします。
@z

@x
    ```bash
    $ docker pull ubuntu:16.04
    ```
@y
    ```bash
    $ docker pull ubuntu:16.04
    ```
@z

@x
2.  Tag the image as `localhost:5000/my-ubuntu`. This creates an additional tag
    for the existing image. When the first part of the tag is a hostname and
    port, Docker interprets this as the location of a registry, when pushing.
@y
{% comment %}
2.  Tag the image as `localhost:5000/my-ubuntu`. This creates an additional tag
    for the existing image. When the first part of the tag is a hostname and
    port, Docker interprets this as the location of a registry, when pushing.
{% endcomment %}
2.  イメージに `localhost:5000/my-ubuntu` というタグをつけます。
    このようにすることで、既存のイメージに追加のタグがつけられます。
    タグ名のはじめにあるのがホスト名とポート番号です。
    Docker はプッシュ処理時に、その名前部分を Registry の場所として解釈します。
@z

@x
    ```bash
    $ docker tag ubuntu:16.04 localhost:5000/my-ubuntu
    ```
@y
    ```bash
    $ docker tag ubuntu:16.04 localhost:5000/my-ubuntu
    ```
@z

@x
3.  Push the image to the local registry running at `localhost:5000`:
@y
{% comment %}
3.  Push the image to the local registry running at `localhost:5000`:
{% endcomment %}
3.  `localhost:5000` として起動しているローカルの Registry にイメージをプッシュします。
@z

@x
    ```bash
    $ docker push localhost:5000/my-ubuntu
    ```
@y
    ```bash
    $ docker push localhost:5000/my-ubuntu
    ```
@z

@x
4.  Remove the locally-cached `ubuntu:16.04` and `localhost:5000/my-ubuntu`
    images, so that you can test pulling the image from your registry. This
    does not remove the `localhost:5000/my-ubuntu` image from your registry.
@y
{% comment %}
4.  Remove the locally-cached `ubuntu:16.04` and `localhost:5000/my-ubuntu`
    images, so that you can test pulling the image from your registry. This
    does not remove the `localhost:5000/my-ubuntu` image from your registry.
{% endcomment %}
4.  ローカルにキャッシュされている `ubuntu:16.04` と `localhost:5000/my-ubuntu` イメージを削除します。
    この後には、ローカル Registry からイメージをプルしてみることができます。
    Registry からは `localhost:5000/my-ubuntu` イメージは削除されません。
@z

@x
    ```bash
    $ docker image remove ubuntu:16.04
    $ docker image remove localhost:5000/my-ubuntu
    ```
@y
    ```bash
    $ docker image remove ubuntu:16.04
    $ docker image remove localhost:5000/my-ubuntu
    ```
@z

@x
5.  Pull the `localhost:5000/my-ubuntu` image from your local registry.
@y
{% comment %}
5.  Pull the `localhost:5000/my-ubuntu` image from your local registry.
{% endcomment %}
5.  ローカルの Registry から `localhost:5000/my-ubuntu` イメージをプルします。
@z

@x
    ```bash
    $ docker pull localhost:5000/my-ubuntu
    ```
@y
    ```bash
    $ docker pull localhost:5000/my-ubuntu
    ```
@z

@x
## Stop a local registry
@y
{% comment %}
## Stop a local registry
{% endcomment %}
{: #stop-a-local-registry }
## ローカル Registry の停止
@z

@x
To stop the registry, use the same `docker container stop` command as with any other
container.
@y
{% comment %}
To stop the registry, use the same `docker container stop` command as with any other
container.
{% endcomment %}
Registry を停止するには、コンテナーの場合と同じように `docker container stop` コマンドを実行します。
@z

@x
```bash
$ docker container stop registry
```
@y
```bash
$ docker container stop registry
```
@z

@x
To remove the container, use `docker container rm`.
@y
{% comment %}
To remove the container, use `docker container rm`.
{% endcomment %}
コンテナーを削除するには `docker container rm` を実行します。
@z

@x
```bash
$ docker container stop registry && docker container rm -v registry
```
@y
```bash
$ docker container stop registry && docker container rm -v registry
```
@z

@x
## Basic configuration
@y
{% comment %}
## Basic configuration
{% endcomment %}
{: #basic-configuration }
## 基本的な設定
@z

@x
To configure the container, you can pass additional or modified options to the
`docker run` command.
@y
{% comment %}
To configure the container, you can pass additional or modified options to the
`docker run` command.
{% endcomment %}
コンテナーを設定するには、`docker run` コマンドの実行時に、追加のまたは修正のオプションを指定します。
@z

@x
The following sections provide basic guidelines for configuring your registry.
For more details, see the [registry configuration reference](configuration.md).
@y
{% comment %}
The following sections provide basic guidelines for configuring your registry.
For more details, see the [registry configuration reference](configuration.md).
{% endcomment %}
以下の節では、Registry 設定に関する基本的なガイドラインを示します。
詳しくは [Registry 設定リファレンス](configuration.md) を参照してください。
@z

@x
### Start the registry automatically
@y
{% comment %}
### Start the registry automatically
{% endcomment %}
{: #start-the-registry-automatically }
### Registry の自動起動
@z

@x
If you want to use the registry as part of your permanent infrastructure, you
should set it to restart automatically when Docker restarts or if it exits.
This example uses the `--restart always` flag to set a restart policy for the
registry.
@y
{% comment %}
If you want to use the registry as part of your permanent infrastructure, you
should set it to restart automatically when Docker restarts or if it exits.
This example uses the `--restart always` flag to set a restart policy for the
registry.
{% endcomment %}
常用するインフラストラクチャーの一部として Registry を利用したい場合には、Docker の再起動時あるいは Registry 終了時に、Registry を自動的に再起動することが必要になります。
以下の例では `--restart always` フラグを用いて、Registry に対して再起動ポリシーを設定します。
@z

@x
```bash
$ docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  registry:2
```
@y
```bash
$ docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  registry:2
```
@z

@x
### Customize the published port
@y
{% comment %}
### Customize the published port
{% endcomment %}
{: #customize-the-published-port }
### 公開ポートの変更
@z

@x
If you are already using port 5000, or you want to run multiple local
registries to separate areas of concern, you can customize the registry's
port settings. This example runs the registry on port 5001 and also names it
`registry-test`. Remember, the first part of the `-p` value is the host port
and the second part is the port within the container. Within the container, the
registry listens on port `5000` by default.
@y
{% comment %}
If you are already using port 5000, or you want to run multiple local
registries to separate areas of concern, you can customize the registry's
port settings. This example runs the registry on port 5001 and also names it
`registry-test`. Remember, the first part of the `-p` value is the host port
and the second part is the port within the container. Within the container, the
registry listens on port `5000` by default.
{% endcomment %}
すでにポート 5000 を利用している場合、またはローカル Registry を各作業向けに切り分けて複数起動したい場合は、Registry のポート設定を変更します。
以下の例では Registry をポート 5001 で起動し、同時にその名称を `registry-test` とします。
ここで `-p` フラグの値の 1 つめはホストのポートであり、2 つめはコンテナー内のポートです。
コンテナーの内部にて Registry は、ポート `5000` を利用するのがデフォルトです。
@z

@x
```bash
$ docker run -d \
  -p 5001:5000 \
  --name registry-test \
  registry:2
```
@y
```bash
$ docker run -d \
  -p 5001:5000 \
  --name registry-test \
  registry:2
```
@z

@x
If you want to change the port the registry listens on within the container, you
can use the environment variable `REGISTRY_HTTP_ADDR` to change it. This command
causes the registry to listen on port 5001 within the container:
@y
{% comment %}
If you want to change the port the registry listens on within the container, you
can use the environment variable `REGISTRY_HTTP_ADDR` to change it. This command
causes the registry to listen on port 5001 within the container:
{% endcomment %}
コンテナーの内部にて Registry が待ち受けるポートは、環境変数 `REGISTRY_HTTP_ADDR` を使って変更することができます。
以下のコマンドは、コンテナーの内部にて Registry はポート 5001 を待ち受けるようになります。
@z

@x
```bash
$ docker run -d \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 \
  -p 5001:5001 \
  --name registry-test \
  registry:2
```
@y
```bash
$ docker run -d \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 \
  -p 5001:5001 \
  --name registry-test \
  registry:2
```
@z

@x
## Storage customization
@y
{% comment %}
## Storage customization
{% endcomment %}
{: #storage-customization }
## ストレージの設定
@z

@x
### Customize the storage location
@y
{% comment %}
### Customize the storage location
{% endcomment %}
{: #customize-the-storage-location }
### ストレージ保存場所の変更
@z

@x
By default, your registry data is persisted as a [docker volume](../storage/volumes.md)
on the host filesystem. If you want to store your registry contents at a specific
location on your host filesystem, such as if you have an SSD or SAN mounted into
a particular directory, you might decide to use a bind mount instead. A bind mount
is more dependent on the filesystem layout of the Docker host, but more performant
in many situations. The following example bind-mounts the host directory
`/mnt/registry` into the registry container at `/var/lib/registry/`.
@y
{% comment %}
By default, your registry data is persisted as a [docker volume](../storage/volumes.md)
on the host filesystem. If you want to store your registry contents at a specific
location on your host filesystem, such as if you have an SSD or SAN mounted into
a particular directory, you might decide to use a bind mount instead. A bind mount
is more dependent on the filesystem layout of the Docker host, but more performant
in many situations. The following example bind-mounts the host directory
`/mnt/registry` into the registry container at `/var/lib/registry/`.
{% endcomment %}
By default, your registry data is persisted as a [docker volume](../storage/volumes.md)
on the host filesystem. If you want to store your registry contents at a specific
location on your host filesystem, such as if you have an SSD or SAN mounted into
a particular directory, you might decide to use a bind mount instead. A bind mount
is more dependent on the filesystem layout of the Docker host, but more performant
in many situations. The following example bind-mounts the host directory
`/mnt/registry` into the registry container at `/var/lib/registry/`.
@z

@x
```bash
$ docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  -v /mnt/registry:/var/lib/registry \
  registry:2
```
@y
```bash
$ docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  -v /mnt/registry:/var/lib/registry \
  registry:2
```
@z

@x
### Customize the storage back-end
@y
{% comment %}
### Customize the storage back-end
{% endcomment %}
{: #customize-the-storage-back-end }
### Customize the storage back-end
@z

@x
By default, the registry stores its data on the local filesystem, whether you
use a bind mount or a volume. You can store the registry data in an Amazon S3
bucket, Google Cloud Platform, or on another storage back-end by using
[storage drivers](./storage-drivers/index.md). For more information, see
[storage configuration options](./configuration.md#storage).
@y
{% comment %}
By default, the registry stores its data on the local filesystem, whether you
use a bind mount or a volume. You can store the registry data in an Amazon S3
bucket, Google Cloud Platform, or on another storage back-end by using
[storage drivers](./storage-drivers/index.md). For more information, see
[storage configuration options](./configuration.md#storage).
{% endcomment %}
By default, the registry stores its data on the local filesystem, whether you
use a bind mount or a volume. You can store the registry data in an Amazon S3
bucket, Google Cloud Platform, or on another storage back-end by using
[storage drivers](./storage-drivers/index.md). For more information, see
[storage configuration options](./configuration.md#storage).
@z

@x
## Run an externally-accessible registry
@y
{% comment %}
## Run an externally-accessible registry
{% endcomment %}
{: #run-an-externally-accessible-registry }
## Run an externally-accessible registry
@z

@x
Running a registry only accessible on `localhost` has limited usefulness. In
order to make your registry accessible to external hosts, you must first secure
it using TLS.
@y
{% comment %}
Running a registry only accessible on `localhost` has limited usefulness. In
order to make your registry accessible to external hosts, you must first secure
it using TLS.
{% endcomment %}
Running a registry only accessible on `localhost` has limited usefulness. In
order to make your registry accessible to external hosts, you must first secure
it using TLS.
@z

@x
This example is extended in [Run the registry as a
service](#run-the-registry-as-a-service) below.
@y
{% comment %}
This example is extended in [Run the registry as a
service](#run-the-registry-as-a-service) below.
{% endcomment %}
This example is extended in [Run the registry as a
service](#run-the-registry-as-a-service) below.
@z

@x
### Get a certificate
@y
{% comment %}
### Get a certificate
{% endcomment %}
{: #get-a-certificate }
### Get a certificate
@z

@x
These examples assume the following:
@y
{% comment %}
These examples assume the following:
{% endcomment %}
These examples assume the following:
@z

@x
- Your registry URL is `https://myregistry.domain.com/`.
- Your DNS, routing, and firewall settings allow access to the registry's host
  on port 443.
- You have already obtained a certificate from a certificate authority (CA).
@y
{% comment %}
- Your registry URL is `https://myregistry.domain.com/`.
- Your DNS, routing, and firewall settings allow access to the registry's host
  on port 443.
- You have already obtained a certificate from a certificate authority (CA).
{% endcomment %}
- Your registry URL is `https://myregistry.domain.com/`.
- Your DNS, routing, and firewall settings allow access to the registry's host
  on port 443.
- You have already obtained a certificate from a certificate authority (CA).
@z

@x
If you have been issued an _intermediate_ certificate instead, see
[use an intermediate certificate](#use-an-intermediate-certificate).
@y
{% comment %}
If you have been issued an _intermediate_ certificate instead, see
[use an intermediate certificate](#use-an-intermediate-certificate).
{% endcomment %}
If you have been issued an _intermediate_ certificate instead, see
[use an intermediate certificate](#use-an-intermediate-certificate).
@z

@x
1.  Create a `certs` directory.
@y
{% comment %}
1.  Create a `certs` directory.
{% endcomment %}
1.  Create a `certs` directory.
@z

@x
    ```bash
    $ mkdir -p certs
    ```
@y
    ```bash
    $ mkdir -p certs
    ```
@z

@x
    Copy the `.crt` and `.key` files from the CA into the `certs` directory.
    The following steps assume that the files are named `domain.crt` and
    `domain.key`.
@y
    {% comment %}
    Copy the `.crt` and `.key` files from the CA into the `certs` directory.
    The following steps assume that the files are named `domain.crt` and
    `domain.key`.
    {% endcomment %}
    Copy the `.crt` and `.key` files from the CA into the `certs` directory.
    The following steps assume that the files are named `domain.crt` and
    `domain.key`.
@z

@x
2.  Stop the registry if it is currently running.
@y
{% comment %}
2.  Stop the registry if it is currently running.
{% endcomment %}
2.  Stop the registry if it is currently running.
@z

@x
    ```bash
    $ docker container stop registry
    ```
@y
    ```bash
    $ docker container stop registry
    ```
@z

@x
3.  Restart the registry, directing it to use the TLS certificate. This command
    bind-mounts the `certs/` directory into the container at `/certs/`, and sets
    environment variables that tell the container where to find the `domain.crt`
    and `domain.key` file. The registry runs on port 443, the default HTTPS port.
@y
{% comment %}
3.  Restart the registry, directing it to use the TLS certificate. This command
    bind-mounts the `certs/` directory into the container at `/certs/`, and sets
    environment variables that tell the container where to find the `domain.crt`
    and `domain.key` file. The registry runs on port 443, the default HTTPS port.
{% endcomment %}
3.  Restart the registry, directing it to use the TLS certificate. This command
    bind-mounts the `certs/` directory into the container at `/certs/`, and sets
    environment variables that tell the container where to find the `domain.crt`
    and `domain.key` file. The registry runs on port 443, the default HTTPS port.
@z

@x
    ```bash
    $ docker run -d \
      --restart=always \
      --name registry \
      -v "$(pwd)"/certs:/certs \
      -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
      -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
      -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
      -p 443:443 \
      registry:2
    ```
@y
    ```bash
    $ docker run -d \
      --restart=always \
      --name registry \
      -v "$(pwd)"/certs:/certs \
      -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
      -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
      -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
      -p 443:443 \
      registry:2
    ```
@z

@x
4.  Docker clients can now pull from and push to your registry using its
    external address. The following commands demonstrate this:
@y
{% comment %}
4.  Docker clients can now pull from and push to your registry using its
    external address. The following commands demonstrate this:
{% endcomment %}
4.  Docker clients can now pull from and push to your registry using its
    external address. The following commands demonstrate this:
@z

@x
    ```bash
    $ docker pull ubuntu:16.04
    $ docker tag ubuntu:16.04 myregistry.domain.com/my-ubuntu
    $ docker push myregistry.domain.com/my-ubuntu
    $ docker pull myregistry.domain.com/my-ubuntu
    ```
@y
    ```bash
    $ docker pull ubuntu:16.04
    $ docker tag ubuntu:16.04 myregistry.domain.com/my-ubuntu
    $ docker push myregistry.domain.com/my-ubuntu
    $ docker pull myregistry.domain.com/my-ubuntu
    ```
@z

@x
#### Use an intermediate certificate
@y
{% comment %}
#### Use an intermediate certificate
{% endcomment %}
{: #use-an-intermediate-certificate }
#### Use an intermediate certificate
@z

@x
A certificate issuer may supply you with an *intermediate* certificate. In this
case, you must concatenate your certificate with the intermediate certificate to
form a *certificate bundle*. You can do this using the `cat` command:
@y
{% comment %}
A certificate issuer may supply you with an *intermediate* certificate. In this
case, you must concatenate your certificate with the intermediate certificate to
form a *certificate bundle*. You can do this using the `cat` command:
{% endcomment %}
A certificate issuer may supply you with an *intermediate* certificate. In this
case, you must concatenate your certificate with the intermediate certificate to
form a *certificate bundle*. You can do this using the `cat` command:
@z

@x
```bash
cat domain.crt intermediate-certificates.pem > certs/domain.crt
```
@y
```bash
cat domain.crt intermediate-certificates.pem > certs/domain.crt
```
@z

@x
You can use the certificate bundle just as you use the `domain.crt` file in
the previous example.
@y
{% comment %}
You can use the certificate bundle just as you use the `domain.crt` file in
the previous example.
{% endcomment %}
You can use the certificate bundle just as you use the `domain.crt` file in
the previous example.
@z

@x
### Support for Let's Encrypt
@y
{% comment %}
### Support for Let's Encrypt
{% endcomment %}
### Support for Let's Encrypt
@z

@x
The registry supports using Let's Encrypt to automatically obtain a
browser-trusted certificate. For more information on Let's Encrypt, see
[https://letsencrypt.org/how-it-works/](https://letsencrypt.org/how-it-works/)
and the relevant section of the
[registry configuration](configuration.md#letsencrypt).
@y
{% comment %}
{% endcomment %}
The registry supports using Let's Encrypt to automatically obtain a
browser-trusted certificate. For more information on Let's Encrypt, see
[https://letsencrypt.org/how-it-works/](https://letsencrypt.org/how-it-works/)
and the relevant section of the
[registry configuration](configuration.md#letsencrypt).
@z

@x
### Use an insecure registry (testing only)
@y
{% comment %}
{% endcomment %}
### Use an insecure registry (testing only)
@z

@x
It is possible to use a self-signed certificate, or to use our registry
insecurely. Unless you have set up verification for your self-signed
certificate, this is for testing only. See [run an insecure registry](insecure.md).
@y
{% comment %}
{% endcomment %}
It is possible to use a self-signed certificate, or to use our registry
insecurely. Unless you have set up verification for your self-signed
certificate, this is for testing only. See [run an insecure registry](insecure.md).
@z

@x
## Run the registry as a service
@y
{% comment %}
{% endcomment %}
## Run the registry as a service
@z

@x
[Swarm services](../engine/swarm/services.md) provide several advantages over
standalone containers. They use a declarative model, which means that you define
the desired state and Docker works to keep your service in that state. Services
provide automatic load balancing scaling, and the ability to control the
distribution of your service, among other advantages. Services also allow you to
store sensitive data such as TLS certificates in
[secrets](../engine/swarm/secrets.md).
@y
{% comment %}
{% endcomment %}
[Swarm services](../engine/swarm/services.md) provide several advantages over
standalone containers. They use a declarative model, which means that you define
the desired state and Docker works to keep your service in that state. Services
provide automatic load balancing scaling, and the ability to control the
distribution of your service, among other advantages. Services also allow you to
store sensitive data such as TLS certificates in
[secrets](../engine/swarm/secrets.md).
@z

@x
The storage back-end you use determines whether you use a fully scaled service
or a service with either only a single node or a node constraint.
@y
{% comment %}
{% endcomment %}
The storage back-end you use determines whether you use a fully scaled service
or a service with either only a single node or a node constraint.
@z

@x
- If you use a distributed storage driver, such as Amazon S3, you can use a
  fully replicated service. Each worker can write to the storage back-end
  without causing write conflicts.
@y
{% comment %}
{% endcomment %}
- If you use a distributed storage driver, such as Amazon S3, you can use a
  fully replicated service. Each worker can write to the storage back-end
  without causing write conflicts.
@z

@x
- If you use a local bind mount or volume, each worker node writes to its
  own storage location, which means that each registry contains a different
  data set. You can solve this problem by using a single-replica service and a
  node constraint to ensure that only a single worker is writing to the bind
  mount.
@y
{% comment %}
{% endcomment %}
- If you use a local bind mount or volume, each worker node writes to its
  own storage location, which means that each registry contains a different
  data set. You can solve this problem by using a single-replica service and a
  node constraint to ensure that only a single worker is writing to the bind
  mount.
@z

@x
The following example starts a registry as a single-replica service, which is
accessible on any swarm node on port 80. It assumes you are using the same
TLS certificates as in the previous examples.
@y
{% comment %}
{% endcomment %}
The following example starts a registry as a single-replica service, which is
accessible on any swarm node on port 80. It assumes you are using the same
TLS certificates as in the previous examples.
@z

@x
First, save the TLS certificate and key as secrets:
@y
{% comment %}
{% endcomment %}
First, save the TLS certificate and key as secrets:
@z

@x
```bash
$ docker secret create domain.crt certs/domain.crt
@y
```bash
$ docker secret create domain.crt certs/domain.crt
@z

@x
$ docker secret create domain.key certs/domain.key
```
@y
$ docker secret create domain.key certs/domain.key
```
@z

@x
Next, add a label to the node where you want to run the registry.
To get the node's name, use `docker node ls`. Substitute your node's name for
`node1` below.
@y
{% comment %}
{% endcomment %}
Next, add a label to the node where you want to run the registry.
To get the node's name, use `docker node ls`. Substitute your node's name for
`node1` below.
@z

@x
```bash
$ docker node update --label-add registry=true node1
```
@y
```bash
$ docker node update --label-add registry=true node1
```
@z

@x
Next, create the service, granting it access to the two secrets and constraining
it to only run on nodes with the label `registry=true`. Besides the constraint,
you are also specifying that only a single replica should run at a time. The
example bind-mounts `/mnt/registry` on the swarm node to `/var/lib/registry/`
within the container. Bind mounts rely on the pre-existing source directory,
so be sure `/mnt/registry` exists on `node1`. You might need to create it before
running the following `docker service create` command.
@y
{% comment %}
{% endcomment %}
Next, create the service, granting it access to the two secrets and constraining
it to only run on nodes with the label `registry=true`. Besides the constraint,
you are also specifying that only a single replica should run at a time. The
example bind-mounts `/mnt/registry` on the swarm node to `/var/lib/registry/`
within the container. Bind mounts rely on the pre-existing source directory,
so be sure `/mnt/registry` exists on `node1`. You might need to create it before
running the following `docker service create` command.
@z

@x
By default, secrets are mounted into a service at `/run/secrets/<secret-name>`.
@y
{% comment %}
{% endcomment %}
By default, secrets are mounted into a service at `/run/secrets/<secret-name>`.
@z

@x
```bash
$ docker service create \
  --name registry \
  --secret domain.crt \
  --secret domain.key \
  --constraint 'node.labels.registry==true' \
  --mount type=bind,src=/mnt/registry,dst=/var/lib/registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/run/secrets/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/run/secrets/domain.key \
  --publish published=443,target=443 \
  --replicas 1 \
  registry:2
```
@y
```bash
$ docker service create \
  --name registry \
  --secret domain.crt \
  --secret domain.key \
  --constraint 'node.labels.registry==true' \
  --mount type=bind,src=/mnt/registry,dst=/var/lib/registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/run/secrets/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/run/secrets/domain.key \
  --publish published=443,target=443 \
  --replicas 1 \
  registry:2
```
@z

@x
You can access the service on port 443 of any swarm node. Docker sends the
requests to the node which is running the service.
@y
{% comment %}
{% endcomment %}
You can access the service on port 443 of any swarm node. Docker sends the
requests to the node which is running the service.
@z

@x
## Load balancing considerations
@y
{% comment %}
{% endcomment %}
## Load balancing considerations
@z

@x
One may want to use a load balancer to distribute load, terminate TLS or
provide high availability. While a full load balancing setup is outside the
scope of this document, there are a few considerations that can make the process
smoother.
@y
{% comment %}
{% endcomment %}
One may want to use a load balancer to distribute load, terminate TLS or
provide high availability. While a full load balancing setup is outside the
scope of this document, there are a few considerations that can make the process
smoother.
@z

@x
The most important aspect is that a load balanced cluster of registries must
share the same resources. For the current version of the registry, this means
the following must be the same:
@y
{% comment %}
{% endcomment %}
The most important aspect is that a load balanced cluster of registries must
share the same resources. For the current version of the registry, this means
the following must be the same:
@z

@x
  - Storage Driver
  - HTTP Secret
  - Redis Cache (if configured)
@y
  {% comment %}
  {% endcomment %}
  - Storage Driver
  - HTTP Secret
  - Redis Cache (if configured)
@z

@x
Differences in any of the above cause problems serving requests.
As an example, if you're using the filesystem driver, all registry instances
must have access to the same filesystem root, on
the same machine. For other drivers, such as S3 or Azure, they should be
accessing the same resource and share an identical configuration.
The _HTTP Secret_ coordinates uploads, so also must be the same across
instances. Configuring different redis instances works (at the time
of writing), but is not optimal if the instances are not shared, because
more requests are directed to the backend.
@y
{% comment %}
{% endcomment %}
Differences in any of the above cause problems serving requests.
As an example, if you're using the filesystem driver, all registry instances
must have access to the same filesystem root, on
the same machine. For other drivers, such as S3 or Azure, they should be
accessing the same resource and share an identical configuration.
The _HTTP Secret_ coordinates uploads, so also must be the same across
instances. Configuring different redis instances works (at the time
of writing), but is not optimal if the instances are not shared, because
more requests are directed to the backend.
@z

@x
### Important/Required HTTP-Headers
@y
{% comment %}
{% endcomment %}
### Important/Required HTTP-Headers
@z

@x
Getting the headers correct is very important. For all responses to any
request under the "/v2/" url space, the `Docker-Distribution-API-Version`
header should be set to the value "registry/2.0", even for a 4xx response.
This header allows the docker engine to quickly resolve authentication realms
and fallback to version 1 registries, if necessary. Confirming this is setup
correctly can help avoid problems with fallback.
@y
{% comment %}
{% endcomment %}
Getting the headers correct is very important. For all responses to any
request under the "/v2/" url space, the `Docker-Distribution-API-Version`
header should be set to the value "registry/2.0", even for a 4xx response.
This header allows the docker engine to quickly resolve authentication realms
and fallback to version 1 registries, if necessary. Confirming this is setup
correctly can help avoid problems with fallback.
@z

@x
In the same train of thought, you must make sure you are properly sending the
`X-Forwarded-Proto`, `X-Forwarded-For`, and `Host` headers to their "client-side"
values. Failure to do so usually makes the registry issue redirects to internal
hostnames or downgrading from https to http.
@y
{% comment %}
{% endcomment %}
In the same train of thought, you must make sure you are properly sending the
`X-Forwarded-Proto`, `X-Forwarded-For`, and `Host` headers to their "client-side"
values. Failure to do so usually makes the registry issue redirects to internal
hostnames or downgrading from https to http.
@z

@x
A properly secured registry should return 401 when the "/v2/" endpoint is hit
without credentials. The response should include a `WWW-Authenticate`
challenge, providing guidance on how to authenticate, such as with basic auth
or a token service. If the load balancer has health checks, it is recommended
to configure it to consider a 401 response as healthy and any other as down.
This secures your registry by ensuring that configuration problems with
authentication don't accidentally expose an unprotected registry. If you're
using a less sophisticated load balancer, such as Amazon's Elastic Load
Balancer, that doesn't allow one to change the healthy response code, health
checks can be directed at "/", which always returns a `200 OK` response.
@y
{% comment %}
{% endcomment %}
A properly secured registry should return 401 when the "/v2/" endpoint is hit
without credentials. The response should include a `WWW-Authenticate`
challenge, providing guidance on how to authenticate, such as with basic auth
or a token service. If the load balancer has health checks, it is recommended
to configure it to consider a 401 response as healthy and any other as down.
This secures your registry by ensuring that configuration problems with
authentication don't accidentally expose an unprotected registry. If you're
using a less sophisticated load balancer, such as Amazon's Elastic Load
Balancer, that doesn't allow one to change the healthy response code, health
checks can be directed at "/", which always returns a `200 OK` response.
@z

@x
## Restricting access
@y
{% comment %}
{% endcomment %}
## Restricting access
@z

@x
Except for registries running on secure local networks, registries should always
implement access restrictions.
@y
{% comment %}
{% endcomment %}
Except for registries running on secure local networks, registries should always
implement access restrictions.
@z

@x
### Native basic auth
@y
{% comment %}
{% endcomment %}
### Native basic auth
@z

@x
The simplest way to achieve access restriction is through basic authentication
(this is very similar to other web servers' basic authentication mechanism).
This example uses native basic authentication using `htpasswd` to store the
secrets.
@y
{% comment %}
{% endcomment %}
The simplest way to achieve access restriction is through basic authentication
(this is very similar to other web servers' basic authentication mechanism).
This example uses native basic authentication using `htpasswd` to store the
secrets.
@z

@x
> **Warning**:
> You **cannot** use authentication with authentication schemes that send
> credentials as clear text. You must
> [configure TLS first](deploying.md#running-a-domain-registry) for
> authentication to work.
{:.warning}
@y
{% comment %}
{% endcomment %}
> **Warning**:
> You **cannot** use authentication with authentication schemes that send
> credentials as clear text. You must
> [configure TLS first](deploying.md#running-a-domain-registry) for
> authentication to work.
{:.warning}
@z

@x
1.  Create a password file with one entry for the user `testuser`, with password
    `testpassword`:
@y
{% comment %}
{% endcomment %}
1.  Create a password file with one entry for the user `testuser`, with password
    `testpassword`:
@z

@x
    ```bash
    $ mkdir auth
    $ docker run \
      --entrypoint htpasswd \
      registry:2 -Bbn testuser testpassword > auth/htpasswd
    ```
@y
    ```bash
    $ mkdir auth
    $ docker run \
      --entrypoint htpasswd \
      registry:2 -Bbn testuser testpassword > auth/htpasswd
    ```
@z

@x
2.  Stop the registry.
@y
{% comment %}
{% endcomment %}
2.  Stop the registry.
@z

@x
    ```bash
    $ docker container stop registry
    ```
@y
    ```bash
    $ docker container stop registry
    ```
@z

@x
3.  Start the registry with basic authentication.
@y
{% comment %}
{% endcomment %}
3.  Start the registry with basic authentication.
@z

@x
    ```bash
    $ docker run -d \
      -p 5000:5000 \
      --restart=always \
      --name registry \
      -v "$(pwd)"/auth:/auth \
      -e "REGISTRY_AUTH=htpasswd" \
      -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
      -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
      -v "$(pwd)"/certs:/certs \
      -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
      -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
      registry:2
      ```
@y
    ```bash
    $ docker run -d \
      -p 5000:5000 \
      --restart=always \
      --name registry \
      -v "$(pwd)"/auth:/auth \
      -e "REGISTRY_AUTH=htpasswd" \
      -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
      -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
      -v "$(pwd)"/certs:/certs \
      -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
      -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
      registry:2
      ```
@z

@x
4.  Try to pull an image from the registry, or push an image to the registry.
    These commands fail.
@y
{% comment %}
{% endcomment %}
4.  Try to pull an image from the registry, or push an image to the registry.
    These commands fail.
@z

@x
5.  Log in to the registry.
@y
{% comment %}
{% endcomment %}
5.  Log in to the registry.
@z

@x
    ```bash
    $ docker login myregistrydomain.com:5000
    ```
@y
    ```bash
    $ docker login myregistrydomain.com:5000
    ```
@z

@x
    Provide the username and password from the first step.
@y
    {% comment %}
    {% endcomment %}
    Provide the username and password from the first step.
@z

@x
    Test that you can now pull an image from the registry or push an image to
    the registry.
@y
    {% comment %}
    {% endcomment %}
    Test that you can now pull an image from the registry or push an image to
    the registry.
@z

@x
> **X509 errors**: X509 errors usually indicate that you are attempting to use
> a self-signed certificate without configuring the Docker daemon correctly.
> See [run an insecure registry](insecure.md).
@y
{% comment %}
{% endcomment %}
> **X509 errors**: X509 errors usually indicate that you are attempting to use
> a self-signed certificate without configuring the Docker daemon correctly.
> See [run an insecure registry](insecure.md).
@z

@x
### More advanced authentication
@y
{% comment %}
{% endcomment %}
### More advanced authentication
@z

@x
You may want to leverage more advanced basic auth implementations by using a
proxy in front of the registry. See the [recipes list](recipes/index.md).
@y
{% comment %}
{% endcomment %}
You may want to leverage more advanced basic auth implementations by using a
proxy in front of the registry. See the [recipes list](recipes/index.md).
@z

@x
The registry also supports delegated authentication which redirects users to a
specific trusted token server. This approach is more complicated to set up, and
only makes sense if you need to fully configure ACLs and need more control over
the registry's integration into your global authorization and authentication
systems. Refer to the following [background information](spec/auth/token.md) and
[configuration information here](configuration.md#auth).
@y
{% comment %}
{% endcomment %}
The registry also supports delegated authentication which redirects users to a
specific trusted token server. This approach is more complicated to set up, and
only makes sense if you need to fully configure ACLs and need more control over
the registry's integration into your global authorization and authentication
systems. Refer to the following [background information](spec/auth/token.md) and
[configuration information here](configuration.md#auth).
@z

@x
This approach requires you to implement your own authentication system or
leverage a third-party implementation.
@y
{% comment %}
{% endcomment %}
This approach requires you to implement your own authentication system or
leverage a third-party implementation.
@z

@x
## Deploy your registry using a Compose file
@y
{% comment %}
{% endcomment %}
## Deploy your registry using a Compose file
@z

@x
If your registry invocation is advanced, it may be easier to use a Docker
compose file to deploy it, rather than relying on a specific `docker run`
invocation. Use the following example `docker-compose.yml` as a template.
@y
{% comment %}
{% endcomment %}
If your registry invocation is advanced, it may be easier to use a Docker
compose file to deploy it, rather than relying on a specific `docker run`
invocation. Use the following example `docker-compose.yml` as a template.
@z

@x
```yaml
registry:
  restart: always
  image: registry:2
  ports:
    - 5000:5000
  environment:
    REGISTRY_HTTP_TLS_CERTIFICATE: /certs/domain.crt
    REGISTRY_HTTP_TLS_KEY: /certs/domain.key
    REGISTRY_AUTH: htpasswd
    REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
    REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
  volumes:
    - /path/data:/var/lib/registry
    - /path/certs:/certs
    - /path/auth:/auth
```
@y
```yaml
registry:
  restart: always
  image: registry:2
  ports:
    - 5000:5000
  environment:
    REGISTRY_HTTP_TLS_CERTIFICATE: /certs/domain.crt
    REGISTRY_HTTP_TLS_KEY: /certs/domain.key
    REGISTRY_AUTH: htpasswd
    REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
    REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
  volumes:
    - /path/data:/var/lib/registry
    - /path/certs:/certs
    - /path/auth:/auth
```
@z

@x
Replace `/path` with the directory which contains the `certs/` and `auth/`
directories.
{:.warning}
@y
{% comment %}
{% endcomment %}
Replace `/path` with the directory which contains the `certs/` and `auth/`
directories.
{:.warning}
@z

@x
Start your registry by issuing the following command in the directory containing
the `docker-compose.yml` file:
@y
{% comment %}
{% endcomment %}
Start your registry by issuing the following command in the directory containing
the `docker-compose.yml` file:
@z

@x
```bash
$ docker-compose up -d
```
@y
```bash
$ docker-compose up -d
```
@z

@x
## Considerations for air-gapped registries
@y
{% comment %}
## Considerations for air-gapped registries
{% endcomment %}
{: #considerations-for-air-gapped-registries }
## 隔離されたデータセンターでの配慮
@z

@x
You can run a registry in an environment with no internet connectivity.
However, if you rely on any images which are not local, you need to consider the
following:
@y
{% comment %}
{% endcomment %}
You can run a registry in an environment with no internet connectivity.
However, if you rely on any images which are not local, you need to consider the
following:
@z

@x
- You may need to build your local registry's data volume on a connected
  host where you can run `docker pull` to get any images which are available
  remotely, and then migrate the registry's data volume to the air-gapped
  network.
@y
{% comment %}
{% endcomment %}
- You may need to build your local registry's data volume on a connected
  host where you can run `docker pull` to get any images which are available
  remotely, and then migrate the registry's data volume to the air-gapped
  network.
@z

@x
- Certain images, such as the official Microsoft Windows base images, are not
  distributable. This means that when you push an image based on one of these
  images to your private registry, the non-distributable layers are **not**
  pushed, but are always fetched from their authorized location. This is fine
  for internet-connected hosts, but not in an air-gapped set-up.
@y
{% comment %}
{% endcomment %}
- Certain images, such as the official Microsoft Windows base images, are not
  distributable. This means that when you push an image based on one of these
  images to your private registry, the non-distributable layers are **not**
  pushed, but are always fetched from their authorized location. This is fine
  for internet-connected hosts, but not in an air-gapped set-up.
@z

@x
  In Docker 17.06 and higher, you can configure the Docker daemon to allow
  pushing non-distributable layers to private registries, in this scenario.
  **This is only useful in air-gapped set-ups in the presence of
  non-distributable images, or in extremely bandwidth-limited situations.**
  You are responsible for ensuring that you are in compliance with the terms of
  use for non-distributable layers.
@y
  {% comment %}
  {% endcomment %}
  In Docker 17.06 and higher, you can configure the Docker daemon to allow
  pushing non-distributable layers to private registries, in this scenario.
  **This is only useful in air-gapped set-ups in the presence of
  non-distributable images, or in extremely bandwidth-limited situations.**
  You are responsible for ensuring that you are in compliance with the terms of
  use for non-distributable layers.
@z

@x
  1.  Edit the `daemon.json` file, which is located in `/etc/docker/` on Linux
      hosts and `C:\ProgramData\docker\config\daemon.json` on Windows Server.
      Assuming the file was previously empty, add the following contents:
@y
  {% comment %}
  {% endcomment %}
  1.  Edit the `daemon.json` file, which is located in `/etc/docker/` on Linux
      hosts and `C:\ProgramData\docker\config\daemon.json` on Windows Server.
      Assuming the file was previously empty, add the following contents:
@z

@x
      ```json
      {
        "allow-nondistributable-artifacts": ["myregistrydomain.com:5000"]
      }
      ```
@y
      ```json
      {
        "allow-nondistributable-artifacts": ["myregistrydomain.com:5000"]
      }
      ```
@z

@x
      The value is an array of registry addresses, separated by commas.
@y
      {% comment %}
      {% endcomment %}
      The value is an array of registry addresses, separated by commas.
@z

@x
      Save and exit the file.
@y
      {% comment %}
      {% endcomment %}
      Save and exit the file.
@z

@x
  2.  Restart Docker.
@y
  {% comment %}
  {% endcomment %}
  2.  Restart Docker.
@z

@x
  3.  Restart the registry if it does not start automatically.
@y
  {% comment %}
  {% endcomment %}
  3.  Restart the registry if it does not start automatically.
@z

@x
  4.  When you push images to the registries in the list, their
      non-distributable layers are pushed to the registry.
@y
  {% comment %}
  {% endcomment %}
  4.  When you push images to the registries in the list, their
      non-distributable layers are pushed to the registry.
@z

@x
      > **Warning**: Non-distributable artifacts typically have restrictions on
      > how and where they can be distributed and shared. Only use this feature
      > to push artifacts to private registries and ensure that you are in
      > compliance with any terms that cover redistributing non-distributable
      > artifacts.
@y
      {% comment %}
      {% endcomment %}
      > **Warning**: Non-distributable artifacts typically have restrictions on
      > how and where they can be distributed and shared. Only use this feature
      > to push artifacts to private registries and ensure that you are in
      > compliance with any terms that cover redistributing non-distributable
      > artifacts.
@z

@x
## Next steps
@y
{% comment %}
## Next steps
{% endcomment %}
{: #next-steps }
## 次のステップ
@z

@x
More specific and advanced information is available in the following sections:
@y
{% comment %}
{% endcomment %}
More specific and advanced information is available in the following sections:
@z

@x
 - [Configuration reference](configuration.md)
 - [Working with notifications](notifications.md)
 - [Advanced "recipes"](recipes/index.md)
 - [Registry API](spec/api.md)
 - [Storage driver model](storage-drivers/index.md)
 - [Token authentication](spec/auth/token.md)
@y
 {% comment %}
 {% endcomment %}
 - [Configuration reference](configuration.md)
 - [Working with notifications](notifications.md)
 - [Advanced "recipes"](recipes/index.md)
 - [Registry API](spec/api.md)
 - [Storage driver model](storage-drivers/index.md)
 - [Token authentication](spec/auth/token.md)
@z
