%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Getting started with Compose and WordPress
keywords: documentation, docs,  docker, compose, orchestration, containers
title: "Quickstart: Compose and WordPress"
redirect_from:
  - /compose/wordpress/
---
@y
---
description: WordPress を使って Compose をはじめる。
keywords: documentation, docs,  docker, compose, orchestration, containers
title: "クィックスタート: Compose と WordPress"
redirect_from:
  - /compose/wordpress/
---
@z

@x
You can use Docker Compose to easily run WordPress in an isolated environment
built with Docker containers. This quick-start guide demonstrates how to use
Compose to set up and run WordPress. Before starting, make sure you have
[Compose installed](../compose/install.md).
@y
Docker Compose を使うと、Docker コンテナーとして生成される独立した環境内にて WordPress を簡単に実現することができます。
このクイックスタートガイドは、Docker Compose を使った WordPress の設定と実行方法を示すものです。
はじめるには [Compose のインストール](../compose/install.md) が必要です。
@z

@x
### Define the project
@y
{: #define-the-project }
### プロジェクトの定義
@z

@x
1.  Create an empty project directory.
@y
1.  プロジェクト用の空のディレクトリを生成します。
@z

@x
    You can name the directory something easy for you to remember.
    This directory is the context for your application image. The
    directory should only contain resources to build that image.
@y
    ディレクトリ名は覚えやすいものにします。
    このディレクトリはアプリケーションイメージのコンテキストディレクトリとなります。
    このディレクトリには、イメージをビルドするために必要となるものだけを含めるようにします。
@z

@x
    This project directory contains a `docker-compose.yml` file which
    is complete in itself for a good starter wordpress project.
@y
    このプロジェクトディレクトリに`docker-compose.yml`ファイルを置きます。
    このファイルそのものが、WordPress プロジェクトを開始するための内容をすべて含むものとなります。
@z

@x
    >**Tip**: You can use either a `.yml` or `.yaml` extension for
    this file. They both work.
@y
    >**ヒント** このファイルの拡張子は`.yml`と`.yaml`のどちらでも構いません。
    いずれであっても動作します。
@z

@x
2.  Change into your project directory.
@y
2.  プロジェクトディレクトリに移動します。
@z

@x
    For example, if you named your directory `my_wordpress`:
@y
    そのディレクトリをたとえば`my_wordpress`としていた場合、以下のようになります。
@z

@x
    ```console
    $ cd my_wordpress/
    ```
@y
    ```console
    $ cd my_wordpress/
    ```
@z

@x
3.  Create a `docker-compose.yml` file that starts your
    `WordPress` blog and a separate `MySQL` instance with a volume
    mount for data persistence:
@y
3.  `docker-compose.yml`ファイルを生成します。
    このファイルが`WordPress`ブログを起動します。
    それとは別に、データ保存のためにボリュームマウントを使った`MySQL`インスタンスを生成します。
@z

@x
    ```yaml
    version: "{{ site.compose_file_v3 }}"
    
    services:
      db:
        image: mysql:5.7
        volumes:
          - db_data:/var/lib/mysql
        restart: always
        environment:
          MYSQL_ROOT_PASSWORD: somewordpress
          MYSQL_DATABASE: wordpress
          MYSQL_USER: wordpress
          MYSQL_PASSWORD: wordpress
    
      wordpress:
        depends_on:
          - db
        image: wordpress:latest
        ports:
          - "8000:80"
        restart: always
        environment:
          WORDPRESS_DB_HOST: db:3306
          WORDPRESS_DB_USER: wordpress
          WORDPRESS_DB_PASSWORD: wordpress
          WORDPRESS_DB_NAME: wordpress
    volumes:
      db_data: {}
    ```
@y
    ```yaml
    version: "{{ site.compose_file_v3 }}"
    
    services:
      db:
        image: mysql:5.7
        volumes:
          - db_data:/var/lib/mysql
        restart: always
        environment:
          MYSQL_ROOT_PASSWORD: somewordpress
          MYSQL_DATABASE: wordpress
          MYSQL_USER: wordpress
          MYSQL_PASSWORD: wordpress
    
      wordpress:
        depends_on:
          - db
        image: wordpress:latest
        ports:
          - "8000:80"
        restart: always
        environment:
          WORDPRESS_DB_HOST: db:3306
          WORDPRESS_DB_USER: wordpress
          WORDPRESS_DB_PASSWORD: wordpress
          WORDPRESS_DB_NAME: wordpress
    volumes:
      db_data: {}
    ```
@z

@x
   > **Notes**:
   >
   * The docker volume `db_data` persists any updates made by WordPress
   to the database. [Learn more about docker volumes](../storage/volumes.md)
   >
   * WordPress Multisite works only on ports `80` and `443`.
   {: .note-vanilla}
@y
   > **メモ**
   >
   * Docker ボリューム`db_data`は、WordPress 上から実行されるデータ更新をデータベースに保存します。
   > 詳細は [Docker ボリューム](../storage/volumes.md) を参照してください。
   >
   * WordPress のマルチサイトは、ポート`80`と`443`上においてのみ動作します。
   {: .note-vanilla}
@z

@x
### Build the project
@y
{: #build-the-project }
### プロジェクトのビルド
@z

@x
Now, run `docker-compose up -d` from your project directory.
@y
プロジェクトディレクトリ上にて`docker-compose up -d`を実行します。
@z

@x
This runs [`docker-compose up`](../compose/reference/up.md) in detached mode, pulls
the needed Docker images, and starts the wordpress and database containers, as shown in
the example below.
@y
これはデタッチモードにより [`docker-compose up`](../compose/reference/up.md) を実行し、必要な Docker イメージがあれば取得します。
そして WordPress と データベースの両コンテナーを起動します。
たとえば以下のようになります。
@z

@x
```console
$ docker-compose up -d

Creating network "my_wordpress_default" with the default driver
Pulling db (mysql:5.7)...
5.7: Pulling from library/mysql
efd26ecc9548: Pull complete
a3ed95caeb02: Pull complete
<...>
Digest: sha256:34a0aca88e85f2efa5edff1cea77cf5d3147ad93545dbec99cfe705b03c520de
Status: Downloaded newer image for mysql:5.7
Pulling wordpress (wordpress:latest)...
latest: Pulling from library/wordpress
efd26ecc9548: Already exists
a3ed95caeb02: Pull complete
589a9d9a7c64: Pull complete
<...>
Digest: sha256:ed28506ae44d5def89075fd5c01456610cd6c64006addfe5210b8c675881aff6
Status: Downloaded newer image for wordpress:latest
Creating my_wordpress_db_1
Creating my_wordpress_wordpress_1
```
@y
```console
$ docker-compose up -d

Creating network "my_wordpress_default" with the default driver
Pulling db (mysql:5.7)...
5.7: Pulling from library/mysql
efd26ecc9548: Pull complete
a3ed95caeb02: Pull complete
<...>
Digest: sha256:34a0aca88e85f2efa5edff1cea77cf5d3147ad93545dbec99cfe705b03c520de
Status: Downloaded newer image for mysql:5.7
Pulling wordpress (wordpress:latest)...
latest: Pulling from library/wordpress
efd26ecc9548: Already exists
a3ed95caeb02: Pull complete
589a9d9a7c64: Pull complete
<...>
Digest: sha256:ed28506ae44d5def89075fd5c01456610cd6c64006addfe5210b8c675881aff6
Status: Downloaded newer image for wordpress:latest
Creating my_wordpress_db_1
Creating my_wordpress_wordpress_1
```
@z

@x
> **Note**: WordPress Multisite works only on ports `80` and/or `443`.
If you get an error message about binding `0.0.0.0` to port `80` or `443`
(depending on which one you specified), it is likely that the port you
configured for WordPress is already in use by another service.
@y
> **メモ**: WordPress のマルチサイトは、ポート`80`と`443`上においてのみ動作します。
> `0.0.0.0`の`80`や`443`（あるいは設定したポート） へのバインディングに関するエラーが発生したら、WordPress に割り当てたポートが、すでに別のサービスによって利用されていることが考えられます。
@z

@x
### Bring up WordPress in a web browser
@y
{: #bring-up-wordpress-in-a-web-browser }
### ウェブブラウザー上での WordPress の起動
@z

@x
At this point, WordPress should be running on port `8000` of your Docker Host,
and you can complete the "famous five-minute installation" as a WordPress
administrator.
@y
この時点で WordPress は Docker ホスト上のポート`8000`番を使って稼動しています。
そこで WordPress の管理者となって「よく知られた 5 分インストール」を行うことができます。
@z

@x
> **Note**: The WordPress site is not immediately available on port `8000`
because the containers are still being initialized and may take a couple of
minutes before the first load.
@y
> **メモ** WordPress サイトはポート`8000`を使って稼動していると述べましたが、即座に利用できるわけではありません。コンテナーは初期化を行っている最中であり、初回の読み込み処理には数分の時間を要するからです。
@z

@x
If you are using [Docker Machine](../machine/index.md), you can run the command
`docker-machine ip MACHINE_VM` to get the machine address, and then open
`http://MACHINE_VM_IP:8000` in a web browser.
@y
[Docker Machine](../machine/index.md) を利用している場合は、`docker-machine ip MACHINE_VM`を実行してマシンの IP アドレスを取得できます。
そこでウェブブラウザーから`http://MACHINE_VM_IP:8000`にアクセスしてください。
@z

@x
If you are using Docker Desktop for Mac or Docker Desktop for Windows, you can use
`http://localhost` as the IP address, and open `http://localhost:8000` in a web
browser.
@y
Docker Desktop for Mac や Docker Desktop for Windows を利用している場合、IP アドレスとしては`http://localhost`を利用し、ウェブブラウザーから`http://localhost:8000`にアクセスしてください。
@z

@x
![Choose language for WordPress install](images/wordpress-lang.png)
@y
![WordPress インストール時の言語選択](images/wordpress-lang.png)
@z

@x
![WordPress Welcome](images/wordpress-welcome.png)
@y
![WordPress へようこそ](images/wordpress-welcome.png)
@z

@x
### Shutdown and cleanup
@y
{: #shutdown-and-cleanup }
### シャットダウンとクリーンアップ
@z

@x
The command [`docker-compose down`](../compose/reference/down.md) removes the
containers and default network, but preserves your WordPress database.
@y
[`docker-compose down`](../compose/reference/down.md) コマンドを実行すると、コンテナーとデフォルトネットワークが削除されます。
ただし WordPress データベースは残ります。
@z

@x
The command `docker-compose down --volumes` removes the containers, default
network, and the WordPress database.
@y
`docker-compose down --volumes`コマンドを実行すると、コンテナーとデフォルトネットワーク、さらに WordPress データベースも削除します。
@z

@x
## More Compose documentation
@y
{: #more-compose-documentation }
## その他の Compose ドキュメント
@z

@x
- [Docker Compose overview](../compose/index.md)
- [Install Docker Compose](../compose/install.md)
- [Getting Started with Docker Compose](../compose/gettingstarted.md)
- [Docker Compose Command line reference](../compose/reference/index.md)
- [Compose file reference](../compose/compose-file/index.md)
- [Awesome Compose samples](https://github.com/docker/awesome-compose/){:target="_blank" rel="noopener" class="_"}
@y
- [Docker Compose 概要](../compose/index.md)
- [Docker Compose のインストール](../compose/install.md)
- [Docker Compose をはじめよう](../compose/gettingstarted.md)
- [Docker Compose コマンドラインリファレンス](../compose/reference/index.md)
- [Compose ファイルリファレンス](../compose/compose-file/index.md)
- [Awesome Compose サンプル](https://github.com/docker/awesome-compose/){:target="_blank" rel="noopener" class="_"}
@z
