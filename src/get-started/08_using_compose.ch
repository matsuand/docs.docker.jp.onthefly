%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Use Docker Compose"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making our lives easier with Compose for our application
---
@y
---
title: "Docker Compose の利用"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: アプリケーションにおいて Compose を使ってラクラク開発しよう。
---
@z

@x
[Docker Compose](../compose/index.md) is a tool that was developed to help define and
share multi-container applications. With Compose, we can create a YAML file to define the services
and with a single command, can spin everything up or tear it all down.
@y
[Docker Compose](../compose/index.md) は、複数コンテナーによるアプリケーションを定義しやすく共有しやすくする目的で開発されたツールです。
この Compose を使う場合には、YAML ファイルを生成してそこにサービス定義を行い、ただ 1 つのコマンドだけですべてを結び合わせたり切り離したりすることができます。
@z

@x
The _big_ advantage of using Compose is you can define your application stack in a file, keep it at the root of
your project repo (it's now version controlled), and easily enable someone else to contribute to your project.
Someone would only need to clone your repo and start the compose app. In fact, you might see quite a few projects
on GitHub/GitLab doing exactly this now.
@y
Compose を利用する **最大** の利点は、アプリケーション全体の定義を 1 つのファイルに収められることです。
そのファイルはプロジェクトリポジトリのトップに置きます（ここからはバージョン管理していくことにします）。
Compose を使えば他の人がプロジェクトに参加しやすくなります。
他の人はただリポジトリをクローンするだけで Compose アプリを起動します。
現在 GitHub/GitLab 上にある実に多くのプロジェクトが、まさにそのようにして作業を進めています。
@z

@x
So, how do we get started?
@y
ではどうやってはじめましょうか。
@z

@x
## Install Docker Compose
@y
{: #install-docker-compose }
## Docker Compose のインストール
@z

@x
If you installed Docker Desktop/Toolbox for either Windows or Mac, you already have Docker Compose!
Play-with-Docker instances already have Docker Compose installed as well. If you are on
a Linux machine, you will need to [install Docker Compose](../compose/install.md).
@y
Windows または Mac 上において Docker Desktop/Toolbox をインストールしていれば、すでに Docker Compose もインストールされています。
Play-with-Docker インスタンスにも Docker Compose がインストールされています。
Linux マシンを利用している方は [Docker Compose のインストール](../compose/install.md) が必要です。
@z

@x
After installation, you should be able to run the following and see version information.
@y
インストール後は以下のコマンドを実行すれば、バージョン情報を確認できます。
@z

@x
```console
$ docker-compose version
```
@y
```console
$ docker-compose version
```
@z

@x
## Create the Compose file
@y
{: #create-the-compose-file }
## Compose ファイルの生成
@z

@x
1. At the root of the app project, create a file named `docker-compose.yml`.
@y
1. アプリプロジェクトのルートディレクトリに`docker-compose.yml`という名前のファイルを生成します。
@z

@x
2. In the compose file, we'll start off by defining the schema version. In most cases, it's best to use
   the latest supported version. You can look at the [Compose file reference](../compose/compose-file/index.md)
   for the current schema versions and the compatibility matrix.
@y
2. Compose ファイルではまずスキーマバージョンの定義から書き始めます。
   たいていはサポートされている最新バージョンを利用します。
   [Compose ファイルリファレンス](../compose/compose-file/index.md) を見れば、最新のスキーマバージョンや互換性マトリックスを確認できます。
@z

@x
    ```yaml
    version: "3.7"
    ```
@y
    ```yaml
    version: "3.7"
    ```
@z

@x
3. Next, we'll define the list of services (or containers) we want to run as part of our application.
@y
3. 次にアプリケーションを構成するサービス（つまりコンテナー）一覧を定義します。
@z

@x
    ```yaml
    version: "3.7"

    services:
    ```
@y
    ```yaml
    version: "3.7"

    services:
    ```
@z

@x
And now, we'll start migrating a service at a time into the compose file.
@y
そこでサービスを一気に Compose ファイルに書き加えていきます。
@z

@x
## Define the app service
@y
{: #define-the-app-service }
## アプリサービスの定義
@z

@x
To remember, this was the command we were using to define our app container.
@y
思い出してください。
以下のコマンドはアプリコンテナーの定義を以前行ったものです。
@z

@x
```console
$ docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"
```
@y
```console
$ docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"
```
@z

@x
If you are using PowerShell then use this command.
@y
PowerShell を利用している場合は以下のコマンドでした。
@z

@x
```powershell
docker run -dp 3000:3000 `
  -w /app -v "$(pwd):/app" `
  --network todo-app `
  -e MYSQL_HOST=mysql `
  -e MYSQL_USER=root `
  -e MYSQL_PASSWORD=secret `
  -e MYSQL_DB=todos `
  node:12-alpine `
  sh -c "yarn install && yarn run dev"
```
@y
```powershell
docker run -dp 3000:3000 `
  -w /app -v "$(pwd):/app" `
  --network todo-app `
  -e MYSQL_HOST=mysql `
  -e MYSQL_USER=root `
  -e MYSQL_PASSWORD=secret `
  -e MYSQL_DB=todos `
  node:12-alpine `
  sh -c "yarn install && yarn run dev"
```
@z

@x
1. First, let's define the service entry and the image for the container. We can pick any name for the service.
   The name will automatically become a network alias, which will be useful when defining our MySQL service.
@y
1. まずサービス定義の項目とコンテナーイメージを記述します。
   サービス名はどのような名前でもかまいません。
   この名前は自動的にネットワークエイリアスとなるため、MySQL サービスを定義する際に利用できます。
@z

@x
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
    ```
@y
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
    ```
@z

@x
2. Typically, you will see the `command` close to the `image` definition, although there is no requirement on ordering.
   So, let's go ahead and move that into our file.
@y
2. `image`定義のすぐ近くに`command`があるのが普通です。
   ただし記述順はどちらを先にしてもかまいません。
   そこでさらにこの先に進みます。
@z

@x
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
    ```
@y
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
    ```
@z

@x
3. Let's migrate the `-p 3000:3000` part of the command by defining the `ports` for the service. We will use the
   [short syntax](../compose/compose-file/compose-file-v3.md#short-syntax-1) here, but there is also a more verbose
   [long syntax](../compose/compose-file/compose-file-v3.md#long-syntax-1) available as well.
@y
3. `-p 3000:3000`というコマンド部分を作ります。
   サービスに対する`ports`を定義するものです。
   ここでは [短い文法](../compose/compose-file/compose-file-v3.md#short-syntax-1) で記述することにします。
   もちろん [長い文法](../compose/compose-file/compose-file-v3.md#long-syntax-1) で記述することもできます。
@z

@x
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
    ```
@y
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
    ```
@z

@x
4. Next, we'll migrate both the working directory (`-w /app`) and the volume mapping (`-v "$(pwd):/app"`) by using
   the `working_dir` and `volumes` definitions. Volumes also has a [short](../compose/compose-file/compose-file-v3.md#short-syntax-3) and [long](../compose/compose-file/compose-file-v3.md#long-syntax-3) syntax.
@y
4. 次はワーキングディレクトリ（`-w /app`）とボリュームマッピング（`-v "$(pwd):/app"`）です。
   それぞれ`working_dir`と`volumes`の定義を行います。
   ボリュームにも [短い文法](../compose/compose-file/compose-file-v3.md#short-syntax-3) と [長い文法](../compose/compose-file/compose-file-v3.md#long-syntax-3) があります。
@z

@x
    One advantage of Docker Compose volume definitions is we can use relative paths from the current directory.
@y
    Docker Compose におけるボリューム定義の利点は、カレントディレクトリからの相対パスを利用できることです。
@z

@x
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
        working_dir: /app
        volumes:
          - ./:/app
    ```
@y
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
        working_dir: /app
        volumes:
          - ./:/app
    ```
@z

@x
5. Finally, we need to migrate the environment variable definitions using the `environment` key.
@y
5. 最後に環境変数設定を行います。
   これには`environment`キーを用います。
@z

@x
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
        working_dir: /app
        volumes:
          - ./:/app
        environment:
          MYSQL_HOST: mysql
          MYSQL_USER: root
          MYSQL_PASSWORD: secret
          MYSQL_DB: todos
    ```
@y
    ```yaml
    version: "3.7"

    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
        working_dir: /app
        volumes:
          - ./:/app
        environment:
          MYSQL_HOST: mysql
          MYSQL_USER: root
          MYSQL_PASSWORD: secret
          MYSQL_DB: todos
    ```
@z

@x
### Define the MySQL service
@y
{: #define-the-mysql-service }
### MySQL サーバーの定義
@z

@x
Now, it's time to define the MySQL service. The command that we used for that container was the following:
@y
そこでいよいよ MySQL サービスの定義です。
コンテナーにおいてかつて利用したコマンドは以下のものでした。
@z

@x
```console
$ docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:5.7
```
@y
```console
$ docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:5.7
```
@z

@x
If you are using PowerShell then use this command.
@y
    PowerShell を利用している場合は以下のコマンドでした。
@z

@x
```powershell
docker run -d `
  --network todo-app --network-alias mysql `
  -v todo-mysql-data:/var/lib/mysql `
  -e MYSQL_ROOT_PASSWORD=secret `
  -e MYSQL_DATABASE=todos `
  mysql:5.7
```
@y
```powershell
docker run -d `
  --network todo-app --network-alias mysql `
  -v todo-mysql-data:/var/lib/mysql `
  -e MYSQL_ROOT_PASSWORD=secret `
  -e MYSQL_DATABASE=todos `
  mysql:5.7
```
@z

@x
1. We will first define the new service and name it `mysql` so it automatically gets the network alias. We'll
   go ahead and specify the image to use as well.
@y
1. 新たなサービスを定義して、これを`mysql`と名づけます。
   これによって自動的にネットワークエイリアスが作られます。
   そしてこれまでと同様に利用イメージを指定します。
@z

@x
    ```yaml
    version: "3.7"

    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
    ```
@y
    ```yaml
    version: "3.7"

    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
    ```
@z

@x
2. Next, we'll define the volume mapping. When we ran the container with `docker run`, the named volume was created
   automatically. However, that doesn't happen when running with Compose. We need to define the volume in the top-level
   `volumes:` section and then specify the mountpoint in the service config. By simply providing only the volume name,
   the default options are used. There are [many more options available](../compose/compose-file/compose-file-v3.md#volume-configuration-reference) though.
@y
2. 次はボリュームマッピングの定義です。
   `docker run`を実行してコンテナーを起動したときは、名前つきボリュームが自動生成されていました。
   しかし Compose を使って起動するときには、そのようにはなりません。
   まずボリュームの定義は、最上位項目として`volumes:`というセクションを設けて、サービス定義の中のマウントポイントをここに指定します。
   単純にボリューム名だけを指定すれば、デフォルトのオプションが用いられるようになります。
   ただしここには [数多くのオプションが利用可能](../compose/compose-file/compose-file-v3.md#volume-configuration-reference) です。
@z

@x
    ```yaml
    version: "3.7"

    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
        volumes:
          - todo-mysql-data:/var/lib/mysql

    volumes:
      todo-mysql-data:
    ```
@y
    ```yaml
    version: "3.7"

    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
        volumes:
          - todo-mysql-data:/var/lib/mysql

    volumes:
      todo-mysql-data:
    ```
@z

@x
3. Finally, we only need to specify the environment variables.
@y
3. 最後は必要な環境変数を定義するだけです。
@z

@x
    ```yaml
    version: "3.7"

    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
        volumes:
          - todo-mysql-data:/var/lib/mysql
        environment:
          MYSQL_ROOT_PASSWORD: secret
          MYSQL_DATABASE: todos

    volumes:
      todo-mysql-data:
    ```
@y
    ```yaml
    version: "3.7"

    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
        volumes:
          - todo-mysql-data:/var/lib/mysql
        environment:
          MYSQL_ROOT_PASSWORD: secret
          MYSQL_DATABASE: todos

    volumes:
      todo-mysql-data:
    ```
@z

@x
At this point, our complete `docker-compose.yml` should look like this:
@y
ここまでに完成した`docker-compose.yml`は以下のようになります。
@z

@x
```yaml
version: "3.7"
@y
```yaml
version: "3.7"
@z

@x
services:
  app:
    image: node:12-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
@y
services:
  app:
    image: node:12-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
@z

@x
  mysql:
    image: mysql:5.7
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos
@y
  mysql:
    image: mysql:5.7
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos
@z

@x
volumes:
  todo-mysql-data:
```
@y
volumes:
  todo-mysql-data:
```
@z

@x
## Run the application stack
@y
{: #run-the-application-stack }
## アプリケーションの起動
@z

@x
Now that we have our `docker-compose.yml` file, we can start it up!
@y
`docker-compose.yml`ファイルができたので実行してみましょう。
@z

@x
1. Make sure no other copies of the app/db are running first (`docker ps` and `docker rm -f <ids>`).
@y
1. アプリや DB のコンテナーが他に起動していないことをまず確認します（`docker ps`や`docker rm -f <ids>`）。
@z

@x
2. Start up the application stack using the `docker-compose up` command. We'll add the `-d` flag to run everything in the
   background.
@y
2. `docker-compose up`コマンドを実行してアプリケーション全体を起動します。
   すべてをバックグラウンド実行とするため`-d`フラグをつけます。
@z

@x
    ```console
    $ docker-compose up -d
    ```
@y
    ```console
    $ docker-compose up -d
    ```
@z

@x
    When we run this, we should see output like this:
@y
    実行すると以下のような出力が得られます。
@z

@x
    ```plaintext
    Creating network "app_default" with the default driver
    Creating volume "app_todo-mysql-data" with default driver
    Creating app_app_1   ... done
    Creating app_mysql_1 ... done
    ```
@y
    ```plaintext
    Creating network "app_default" with the default driver
    Creating volume "app_todo-mysql-data" with default driver
    Creating app_app_1   ... done
    Creating app_mysql_1 ... done
    ```
@z

@x
    You'll notice that the volume was created as well as a network! By default, Docker Compose automatically creates a network specifically for the application stack (which is why we didn't define one in the compose file).
@y
    ボリュームやネットワークが生成されたことが表示されました。
    Docker Compose はデフォルトで、アプリケーションに固有のネットワークを自動的に生成します。
    （だからこそ Compose ファイル内ではネットワーク定義を行わなかったのです。）
@z

@x
3. Let's look at the logs using the `docker-compose logs -f` command. You'll see the logs from each of the services interleaved
    into a single stream. This is incredibly useful when you want to watch for timing-related issues. The `-f` flag "follows" the
    log, so will give you live output as it's generated.
@y
3. `docker-compose logs -f`コマンドを実行してログを確認してみます。
   どちらのサービスのログも 1 つにまとめれてログ表示されています。
   これは処理タイミングに問題があった場合に、監視を行うのが大変便利になります。
   `-f`フラグはログ出力を「継続する」ものです。
   つまりログ発生するたびに順次出力が得られます。
@z

@x
    If you have run the command already, you'll see output that looks like this:
@y
    コマンドをすでに実行済みであると、以下のような出力となるはずです。
@z

@x
    ```plaintext
    mysql_1  | 2019-10-03T03:07:16.083639Z 0 [Note] mysqld: ready for connections.
    mysql_1  | Version: '5.7.27'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
    app_1    | Connected to mysql db at host mysql
    app_1    | Listening on port 3000
    ```
@y
    ```plaintext
    mysql_1  | 2019-10-03T03:07:16.083639Z 0 [Note] mysqld: ready for connections.
    mysql_1  | Version: '5.7.27'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
    app_1    | Connected to mysql db at host mysql
    app_1    | Listening on port 3000
    ```
@z

@x
    The service name is displayed at the beginning of the line (often colored) to help distinguish messages. If you want to
    view the logs for a specific service, you can add the service name to the end of the logs command (for example,
    `docker-compose logs -f app`).
@y
    ログの各行にはサービス名が（よく色づけされて）表示されます。
    これによってメッセージを読み分けることができます。
    特定サービスのログを確認したい場合は、ログコマンドの最後にサービス名をつける方法もあります（たとえば`docker-compose logs -f app`）。
@z

@x
    > **Tip: Waiting for the DB before starting the app**
    >
    > When the app is starting up, it actually sits and waits for MySQL to be up
    > and ready before trying to connect to it. Docker doesn't have any built-in
    > support to wait for another container to be fully up, running, and ready
    > before starting another container. For Node-based projects, you can use
    > the [wait-port](https://github.com/dwmkerr/wait-port){:target="_blank" rel="noopener" class="_"}
    > dependency. Similar projects exist for other languages/frameworks.
@y
    > **ヒント： DB 準備を待ったアプリ起動**
    >
    > アプリが起動すると MySQL が起動するまで待ちます。
    > そしてその後に接続を試みます。
    > Docker には別のコンテナーが起動、実行、接続可能といった状態になるまで待つようなビルトイン機能はありません。
    > Node ベースのプロジェクトでは [wait-port](https://github.com/dwmkerr/wait-port) という依存パッケージを利用することができます。
    > 同じようなプロジェクトは、他のプログラミング言語、他のフレームワーク向けにも存在します。
@z

@x
4. At this point, you should be able to open your app and see it running. And hey! We're down to a single command!
@y
4. ここまでくれば、アプリを開いて実行確認を行うことができます。
   ほら、実行コマンドたった一つで出来上がりです。
@z

@x
## See the app stack in Docker Dashboard
@y
{: #see-the-app-stack-in-docker-dashboard }
## Docker ダッシュボードからのアプリ全体の確認
@z

@x
If we look at the Docker Dashboard, we'll see that there is a group named **app**. This is the "project name" from Docker
Compose and used to group the containers together. By default, the project name is simply the name of the directory that the
`docker-compose.yml` was located in.
@y
Docker ダッシュボードを見てみると、グループ名として **app** があります。
これが Docker Compose における「プロジェクト名」であり、コンテナーをとりまとめるために利用されます。
このプロジェクト名はデフォルトでは、単純に`docker-compose.yml`ファイルが存在しているディレクトリ名になります。
@z

@x
![Docker Dashboard with app project](images/dashboard-app-project-collapsed.png)
@y
![Docker ダッシュボード上の app プロジェクト](images/dashboard-app-project-collapsed.png)
@z

@x
If you twirl down the app, you will see the two containers we defined in the compose file. The names are also a little
more descriptive, as they follow the pattern of `<project-name>_<service-name>_<replica-number>`. So, it's very easy to
quickly see what container is our app and which container is the mysql database.
@y
app を展開して詳細表示すると、Compose ファイル内で定義した 2 つのコンテナーが表示されます。
そこにつけられている名前にはルールがあります。
それぞれ`<project-name>_<service-name>_<replica-number>`というパターンを持っています。
ですからどのコンテナーがアプリであり、どれが MySQL データベースであるかは一目瞭然です。
@z

@x
![Docker Dashboard with app project expanded](images/dashboard-app-project-expanded.png)
@y
![Docker ダッシュボード上の app プロジェクトを展開](images/dashboard-app-project-expanded.png)
@z

@x
## Tear it all down
@y
{: #tear-it-all-down }
## すべての削除
@z

@x
When you're ready to tear it all down, simply run `docker-compose down` or hit the trash can on the Docker Dashboard
for the entire app. The containers will stop and the network will be removed.
@y
すべてが不要になったら、単純に`docker-compose down`コマンドを実行します。
あるいは Docker ダッシュボード上であれば、trash can（ゴミ箱）アイコンをクリックします。
コンテナーが停止してネットワークは削除されます。
@z

@x
>**Warning**
>
>Removing Volumes
>
>By default, named volumes in your compose file are NOT removed when running `docker-compose down`. If you want to
>remove the volumes, you will need to add the `--volumes` flag.
>
>The Docker Dashboard does _not_ remove volumes when you delete the app stack.
{: .warning}
@y
>**警告**
>
>ボリュームの削除
>
>Compose ファイル内で定めた名前つきボリュームは、`docker-compose down`を実行してもデフォルトでは削除 **されません**。
>ボリュームも削除したいなら`--volumes`フラグをつける必要があります。
>Docker ダッシュボードではアプリを削除してもボリュームは削除 **されません**。
{: .warning}
@z

@x
Once torn down, you can switch to another project, run `docker-compose up` and be ready to contribute to that project! It really
doesn't get much simpler than that!
@y
すべてを削除したら、今度は別のプロジェクトに切り替えて`docker-compose up`を実行します。
ここからは新たなプロジェクトの開発者です。
何ともはや簡単なこと。
@z

@x
## Recap
@y
{: #recap }
## まとめ
@z

@x
In this section, we learned about Docker Compose and how it helps us dramatically simplify the defining and
sharing of multi-service applications. We created a Compose file by translating the commands we were
using into the appropriate compose format.
@y
本節では Docker Compose を学びました。
これを使ったマルチサービスのアプリケーションなら、極めて簡単にアプリ定義し共有することが可能になります。
Compose ファイルの生成にあたっては、これまで実行してきたコマンドを Compose フォーマットに適するように修正して利用しました。
@z

@x
At this point, we're starting to wrap up the tutorial. However, there are a few best practices about
image building we want to cover, as there is a big issue with the Dockerfile we've been using. So,
let's take a look!
@y
ここからはチュートリアルをまとめていきます。
もっともイメージビルドに関しては、お伝えしたいベストプラクティスがあります。
Dockerfile を利用していくためには大いなる問題だからです。
この後をご覧ください。
@z
