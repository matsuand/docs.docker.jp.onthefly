%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Multi container apps"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Using more than one container in our application
---
@y
---
title: "マルチコンテナーアプリケーション"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Using more than one container in our application
---
@z

@x
Up to this point, we have been working with single container apps. But, we now want to add MySQL to the
application stack. The following question often arises - "Where will MySQL run? Install it in the same
container or run it separately?" In general, **each container should do one thing and do it well.** A few
reasons:
@y
これまでは 1 つのコンテナーからなるアプリを使って作業を進めてきました。
ここからはアプリケーションに MySQL を加えることにします。
ところが以下の質問があがってきます。
「MySQL はどこで動かすの？」
「同じコンテナー内にインストール？ それとも別に動かす？」
原則を言います。
**1 つのコンテナーでは 1 つのことだけを行います。そうするのが一番うまくいきます。**
その理由はいくつかあります。
@z

@x
- There's a good chance you'd have to scale APIs and front-ends differently than databases
- Separate containers let you version and update versions in isolation
- While you may use a container for the database locally, you may want to use a managed service
  for the database in production. You don't want to ship your database engine with your app then.
- Running multiple processes will require a process manager (the container only starts one process), 
  which adds complexity to container startup/shutdown
@y
- データベースとは別にして、API やフロントエンドをスケーリングしなければならないなら、ちょうど良い機会です。
- コンテナーを別々にすれば、バージョン管理や更新操作を個別に行うことができます。
- 1 つのコンテナーをデータベース用としてローカルで利用し、本番環境ではサービスを利用してデータベースを管理することができます。
  そうすればデータベースをアプリとともに提供する必要がありません。
- プロセスを複数実行するにはプロセスマネージャーが必要です（コンテナーが起動するプロセスは 1 つです）。
  そうなるとコンテナーの起動や停止が複雑になります。
@z

@x
And there are more reasons. So, we will update our application to work like this:
@y
理由はもっとあります。
そこでアプリケーションのアップデートは以下のようにします。
@z

@x
![Todo App connected to MySQL container](images/multi-app-architecture.png)
{: .text-center }
@y
![MySQL コンテナーに接続する Todo アプリ](images/multi-app-architecture.png)
{: .text-center }
@z

@x
## Container networking
@y
{: #container-networking }
## コンテナーのネットワーク
@z

@x
Remember that containers, by default, run in isolation and don't know anything about other processes
or containers on the same machine. So, how do we allow one container to talk to another? The answer is
**networking**. Now, you don't have to be a network engineer (hooray!). Simply remember this rule...
@y
コンテナーについてもう一度確認します。
デフォルトでコンテナーは分離された状態で動作するので、それが動作するマシン上の他のプロセスや他のコンテナーのことなどまったく知りません。
それならどうやってコンテナーどうしを互いにやりとりできるようにすればよいのでしょう。
その答えは **ネットワーク** です。
でもネットワークエンジニアである必要はありませんよ（よかった）。
そこで以下の単純なルールを覚えてください。
@z

@x
> **Note**
>
> If two containers are on the same network, they can talk to each other. If they aren't, they can't.
@y
> **メモ**
>
> 2 つのコンテナーが同一ネットワーク上にあれば互いにやりとりができます。
> 同一ネットワーク上にないときはできません。
@z

@x
## Start MySQL
@y
{: #start-mysql }
## MySQL の起動
@z

@x
There are two ways to put a container on a network: 1) Assign it at start or 2) connect an existing container.
For now, we will create the network first and attach the MySQL container at startup.
@y
コンテナーをネットワークに加えるには 2 つの方法があります。
1) そのコンテナーの起動時にネットワークを割り当てる、あるいは 2) 既存のコンテナーを接続する、です。
ここからはまずネットワークを生成して MySQL コンテナーの起動時に割り当てることにします。
@z

@x
1. Create the network.
@y
1. ネットワークを生成します。
@z

@x
    ```bash
    docker network create todo-app
    ```
@y
    ```bash
    docker network create todo-app
    ```
@z

@x
2. Start a MySQL container and attach it to the network. We're also going to define a few environment variables that the
  database will use to initialize the database (see the "Environment Variables" section in the [MySQL Docker Hub listing](https://hub.docker.com/_/mysql/)).
@y
2. MySQL コンテナーを起動してネットワークに割り当てます。
   同時に環境変数をいくつか定義して、データベースの初期化に利用します。
   （[MySQL Docker Hub 一覧](https://hub.docker.com/_/mysql/) の「Environment Variables」の節を参照してください。）
@z

@x
    ```bash
    docker run -d \
        --network todo-app --network-alias mysql \
        -v todo-mysql-data:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD=secret \
        -e MYSQL_DATABASE=todos \
        mysql:5.7
    ```
@y
    ```bash
    docker run -d \
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
    PowerShell を利用している場合は以下のコマンドとします。
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
    You'll also see we specified the `--network-alias` flag. We'll come back to that in just a moment.
@y
    ここで`--network-alias`フラグというものを利用しています。
    これについてはすぐに説明します。
@z

@x
    > **Tip**
    >
    > You'll notice we're using a volume named `todo-mysql-data` here and mounting it at `/var/lib/mysql`, which is where MySQL stores its data. However, we never ran a `docker volume create` command. Docker recognizes we want to use a named volume and creates one automatically for us.
@y
    > **ヒント**
    >
    > 上ではボリューム名として`todo-mysql-data`を指定し`/var/lib/mysql`にマウントしました。
    > このディレクトリは MySQL がデータを保存する場所です。
    > だからといって`docker volume create`コマンドは実行していません。
    > Docker が名前つきボリュームが指定されたことを認識して、これを自動的に生成してくれます。
@z

@x
3. To confirm we have the database up and running, connect to the database and verify it connects.
@y
3. データベースが起動され実行していることを確認するため、データベースに接続して接続確認を行います。
@z

@x
    ```bash
    docker exec -it <mysql-container-id> mysql -p
    ```
@y
    ```bash
    docker exec -it <mysql-container-id> mysql -p
    ```
@z

@x
    When the password prompt comes up, type in **secret**. In the MySQL shell, list the databases and verify
    you see the `todos` database.
@y
    パスワードプロンプトが表示されたら **secret** と入力します。
    MySQL シェルにおいてデータベース一覧を表示し、`todos`データベースがあることを確認します。
@z

@x
    ```cli
    mysql> SHOW DATABASES;
    ```
@y
    ```cli
    mysql> SHOW DATABASES;
    ```
@z

@x
    You should see output that looks like this:
@y
    出力は以下のようになるはずです。
@z

@x
    ```plaintext
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | sys                |
    | todos              |
    +--------------------+
    5 rows in set (0.00 sec)
    ```
@y
    ```plaintext
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | sys                |
    | todos              |
    +--------------------+
    5 rows in set (0.00 sec)
    ```
@z

@x
    Hooray! We have our `todos` database and it's ready for us to use!
@y
    やりました。
    `todos`データベースは間違いなくありますので、利用していきましょう。
@z

@x
## Connect to MySQL
@y
{: #connect-to-mysql }
## MySQL への接続
@z

@x
Now that we know MySQL is up and running, let's use it! But, the question is... how? If we run
another container on the same network, how do we find the container (remember each container has its own IP
address)?
@y
MySQL が起動し実行されていることが確認できたので、さっそく使ってみます。
ただし疑問があります ... どうやって？
同一ネットワーク上に別のコンテナーを実行したとき、そのコンテナーをどうやって認識したらよいのでしょう（各コンテナーにはそれぞれに IP アドレスがありますが）。
@z

@x
To figure it out, we're going to make use of the [nicolaka/netshoot](https://github.com/nicolaka/netshoot) container,
which ships with a _lot_ of tools that are useful for troubleshooting or debugging networking issues.
@y
このことを理解するために、ここでは [nicolaka/netshoot](https://github.com/nicolaka/netshoot) というコンテナーを利用することにします。
これは **実に多くの** ツールを提供してくれるもので、ネットワークに関するトラブルシューティングやデバッグに活用できます。
@z

@x
1. Start a new container using the nicolaka/netshoot image. Make sure to connect it to the same network.
@y
1. nicolaka/netshoot というイメージを使ったコンテナーを新たに起動します。
   ネットワークは同一のものに接続するようにします。
@z

@x
    ```bash
    docker run -it --network todo-app nicolaka/netshoot
    ```
@y
    ```bash
    docker run -it --network todo-app nicolaka/netshoot
    ```
@z

@x
2. Inside the container, we're going to use the `dig` command, which is a useful DNS tool. We're going to look up
   the IP address for the hostname `mysql`.
@y
2. コンテナー内部にて`dig`コマンドを実行することにします。
   これは便利な DNS ツールです。
   ホスト名`mysql`に対する IP アドレスを探し出してみます。
@z

@x
    ```bash
    dig mysql
    ```
@y
    ```bash
    dig mysql
    ```
@z

@x
    And you'll get an output like this...
@y
    そうすると以下のような出力となります...
@z

@x
    ```text
    ; <<>> DiG 9.14.1 <<>> mysql
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 32162
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
@y
    ```text
    ; <<>> DiG 9.14.1 <<>> mysql
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 32162
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
@z

@x
    ;; QUESTION SECTION:
    ;mysql.				IN	A
@y
    ;; QUESTION SECTION:
    ;mysql.				IN	A
@z

@x
    ;; ANSWER SECTION:
    mysql.			600	IN	A	172.23.0.2
@y
    ;; ANSWER SECTION:
    mysql.			600	IN	A	172.23.0.2
@z

@x
    ;; Query time: 0 msec
    ;; SERVER: 127.0.0.11#53(127.0.0.11)
    ;; WHEN: Tue Oct 01 23:47:24 UTC 2019
    ;; MSG SIZE  rcvd: 44
    ```
@y
    ;; Query time: 0 msec
    ;; SERVER: 127.0.0.11#53(127.0.0.11)
    ;; WHEN: Tue Oct 01 23:47:24 UTC 2019
    ;; MSG SIZE  rcvd: 44
    ```
@z

@x
    In the "ANSWER SECTION", you will see an `A` record for `mysql` that resolves to `172.23.0.2`
    (your IP address will most likely have a different value). While `mysql` isn't normally a valid hostname,
    Docker was able to resolve it to the IP address of the container that had that network alias (remember the
    `--network-alias` flag we used earlier?).
@y
    「ANSWER SECTION」において、`mysql`における`A`という 1 つのレコードが`172.23.0.2`を持っているのがわかります（この IP アドレスはお手元では、まず間違いなく別の値になっているはずです）。
    `mysql`というのは、普通は適正なホスト名ではないので、Docker はこの名前から IP アドレスを解決しています。
    この IP アドレスはこのコンテナーのものであって、ネットワークエイリアスを持っていたからです（前の手順において`--network-alias`フラグを用いたことを思い出してください）。
@z

@x
    What this means is... our app only simply needs to connect to a host named `mysql` and it'll talk to the
    database! It doesn't get much simpler than that!
@y
    これはどういうことでしょう...
    アプリとしては単にホスト名`mysql`に接続できて、データベースとやりとりができさえすればよいのです。
    こんな簡単にできるなんて。
@z

@x
## Run your app with MySQL
@y
{: #run-your-app-with-mysql }
## MySQL を使ったアプリ実行
@z

@x
The todo app supports the setting of a few environment variables to specify MySQL connection settings. They are:
@y
Todo アプリは環境変数をいくつか設定することによって MySQL への接続をサポートしています。
それは以下のようなものです。
@z

@x
- `MYSQL_HOST` - the hostname for the running MySQL server
- `MYSQL_USER` - the username to use for the connection
- `MYSQL_PASSWORD` - the password to use for the connection
- `MYSQL_DB` - the database to use once connected
@y
- `MYSQL_HOST` - 実行している MySQL サーバーのホスト名。
- `MYSQL_USER` - 接続に利用するユーザー名。
- `MYSQL_PASSWORD` - 接続に利用するパスワード。
- `MYSQL_DB` - 接続後の利用データベース。
@z

@x
> **Setting Connection Settings via Env Vars**
>
> While using env vars to set connection settings is generally ok for development, it is **HIGHLY DISCOURAGED**
> when running applications in production. Diogo Monica, the former lead of security at Docker,
> [wrote a fantastic blog post](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/):target="_blank" rel="noopener" class="_"}
> explaining why.
>
> A more secure mechanism is to use the secret support provided by your container orchestration framework. In most cases,
> these secrets are mounted as files in the running container. You'll see many apps (including the MySQL image and the todo app)
> also support env vars with a `_FILE` suffix to point to a file containing the variable.
>
> As an example, setting the `MYSQL_PASSWORD_FILE` var will cause the app to use the contents of the referenced file
> as the connection password. Docker doesn't do anything to support these env vars. Your app will need to know to look for
> the variable and get the file contents.
@y
> **環境変数を利用した接続設定**
>
> 環境変数を使って接続設定を行うことは、開発環境においては問題ありません。
> しかし本番環境において動作させるアプリケーションに、そうした設定を行うことは **極めて不適切** です。
> Docker の前セキュリティリーダー Diogo Monica 氏が [すばらしいブログ投稿](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/){:target="_blank" rel="noopener" class="_"} においてその理由を説明してくれています。
> コンテナーオーケストレーションのメカニズムにおいては、よりセキュアなものとして Secret 機能がサポートされています。
> たいていの場合、この Secret というものは実行コンテナーに対してファイルの形でマウントされます。
> 多くのアプリケーション（MySQL イメージや Todo アプリを含む）でも、環境変数の末尾に`_FILE`をつけて、変数を含んだファイルを指し示しているものがあります。
> たとえば`MYSQL_PASSWORD_FILE`という変数を設定することで、そこから参照できるファイル内容が接続時のパスワードであるものとして、アプリが利用するようにできます。
> Docker はそういった変数の受け渡しをサポートする機能はありません。
> この変数を求めたりファイル内容を得たりするのは、アプリが行わなければならないことです。
@z

@x
With all of that explained, let's start our dev-ready container!
@y
ここまで説明してきましたので、開発向けコンテナーを起動させましょう。
@z

@x
1. We'll specify each of the environment variables above, as well as connect the container to our app network.
@y
1. 上で説明した環境変数をそれぞれ設定して、コンテナーへの接続を通じてネットワークにアクセスします。
@z

@x
    ```bash
    docker run -dp 3000:3000 \
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
    ```bash
    docker run -dp 3000:3000 \
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
    PowerShell を利用している場合は以下のコマンドとします。
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
2. If we look at the logs for the container (`docker logs <container-id>`), we should see a message indicating it's
   using the mysql database.
@y
2. コンテナーのログ（`docker logs <container-id>`）を見てみると、MySQL データベースの利用を示すメッセージが出力されているはずです。
@z

@x
    ```
    # Previous log messages omitted
    $ nodemon src/index.js
    [nodemon] 1.19.2
    [nodemon] to restart at any time, enter `rs`
    [nodemon] watching dir(s): *.*
    [nodemon] starting `node src/index.js`
    Connected to mysql db at host mysql
    Listening on port 3000
    ```
@y
    ```
    # Previous log messages omitted
    $ nodemon src/index.js
    [nodemon] 1.19.2
    [nodemon] to restart at any time, enter `rs`
    [nodemon] watching dir(s): *.*
    [nodemon] starting `node src/index.js`
    Connected to mysql db at host mysql
    Listening on port 3000
    ```
@z

@x
3. Open the app in your browser and add a few items to your todo list.
@y
3. ブラウザー上においてアプリを開き、Todo リストに 2、3 のアイテムを追加します。
@z

@x
4. Connect to the mysql database and prove that the items are being written to the database. Remember, the password
   is **secret**.
@y
4. MySQL データベースに接続してみて、間違いなくアイテムがデータベースに書き込まれたことを確認します。
   パスワードは **secret** です。
@z

@x
    ```bash
    docker exec -it <mysql-container-id> mysql -p todos
    ```
@y
    ```bash
    docker exec -it <mysql-container-id> mysql -p todos
    ```
@z

@x
    And in the mysql shell, run the following:
@y
    そして MySQL シェルから以下を実行します。
@z

@x
    ```plaintext
    mysql> select * from todo_items;
    +--------------------------------------+--------------------+-----------+
    | id                                   | name               | completed |
    +--------------------------------------+--------------------+-----------+
    | c906ff08-60e6-44e6-8f49-ed56a0853e85 | Do amazing things! |         0 |
    | 2912a79e-8486-4bc3-a4c5-460793a575ab | Be awesome!        |         0 |
    +--------------------------------------+--------------------+-----------+
    ```
@y
    ```plaintext
    mysql> select * from todo_items;
    +--------------------------------------+--------------------+-----------+
    | id                                   | name               | completed |
    +--------------------------------------+--------------------+-----------+
    | c906ff08-60e6-44e6-8f49-ed56a0853e85 | Do amazing things! |         0 |
    | 2912a79e-8486-4bc3-a4c5-460793a575ab | Be awesome!        |         0 |
    +--------------------------------------+--------------------+-----------+
    ```
@z

@x
    Obviously, your table will look different because it has your items. But, you should see them stored there!
@y
    みなさんのテーブルにはみなさんのアイテムが書き込まれていますから、上と完全に同じものにはなっていないはずです。
    しかし確かにデータが保存されたことがわかったはずです。
@z

@x
If you take a quick look at the Docker Dashboard, you'll see that we have two app containers running. But, there's
no real indication that they are grouped together in a single app. We'll see how to make that better shortly!
@y
Docker ダッシュボードで確認してみると、2 つのアプリコンテナーが実行されています。
ただしこの 2 つが 1 つのアプリを通じてグルーピングされていることを示す情報はどこにもありません。
このことを改善していく方法について、この先で見ていきます。
@z

@x
![Docker Dashboard showing two ungrouped app containers](images/dashboard-multi-container-app.png)
@y
![グループ化されていない 2 つのコンテナーが示された Docker ダッシュボード](images/dashboard-multi-container-app.png)
@z

@x
## Recap
@y
{: #recap }
## まとめ
@z

@x
At this point, we have an application that now stores its data in an external database running in a separate
container. We learned a little bit about container networking and saw how service discovery can be performed
using DNS.
@y
ここまでにアプリケーションが保存するデータを外部データベースとし、それも別々に動作するコンテナー内としました。
コンテナーにおけるネットワーク機能に関してちょっとだけ学び、DNS を通じてサービス検出が行われる様子も見てきました。
@z

@x
But, there's a good chance you are starting to feel a little overwhelmed with everything you need to do to start up
this application. We have to create a network, start containers, specify all of the environment variables, expose
ports, and more! That's a lot to remember and it's certainly making things harder to pass along to someone else.
@y
もっとも、アプリケーションの起動に必要となる手順に、少々戸惑いを覚えてきている頃かもしれません。
必要となることがネットワークの生成、コンテナーの起動、環境変数の設定、ポートの公開、などなどでした。
覚えることがたくさんになってしまったので、他の人に教えようと思ってもなかなか大変なことになってきました。
@z

@x
In the next section, we'll talk about Docker Compose. With Docker Compose, we can share our application stacks in a
much easier way and let others spin them up with a single (and simple) command!
@y
次の節では Docker Compose について説明します。
Docker Compose を利用すると、もっと簡単な方法でアプリケーションを構成することができます。
誰でも簡単に 1 コマンドで実現できるようにしましょう。
@z
