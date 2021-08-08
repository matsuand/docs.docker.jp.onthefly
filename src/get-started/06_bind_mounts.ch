%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Use bind mounts"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Using bind mounts in our application
---
@y
---
title: "バインドマウントの利用"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: アプリケーションにおいてバインドマウントを利用します。
---
@z

@x
In the previous chapter, we talked about and used a **named volume** to persist the data in our database.
Named volumes are great if we simply want to store data, as we don't have to worry about _where_ the data
is stored.
@y
前節においては **名前つきボリューム** を取り上げて、データベース上のデータを保存するようにしました。
名前つきボリュームは単にデータを保存したいだけであれば、十分に使えます。
その際には **どこに** データが保存されるのかを気にかける必要もありません。
@z

@x
With **bind mounts**, we control the exact mountpoint on the host. We can use this to persist data, but it's often
used to provide additional data into containers. When working on an application, we can use a bind mount to
mount our source code into the container to let it see code changes, respond, and let us see the changes right
away.
@y
**バインドマウント**（bind mounts）の場合は、ホスト上のマウントポイントを正確に制御することになります。
このマウントによってデータ保存を行ないますが、コンテナーに対してこれとは違ったデータ提供のためにも用いられることがあります。
アプリケーションを開発する際には、バインドマウントを利用してソースコードをコンテナー内にマウントすることができます。
これを行うことでアプリケーションがコード変更を識別でき、これに応じてわれわれも正しく変更を確認することができます。
@z

@x
For Node-based applications, [nodemon](https://npmjs.com/package/nodemon){:target="_blank" rel="noopener" class="_"} is a great tool to watch for file
changes and then restart the application. There are equivalent tools in most other languages and frameworks.
@y
Node ベースのアプリケーションとして [nodemon](https://npmjs.com/package/nodemon){:target="_blank" rel="noopener" class="_"} があり、ファイル変更を監視してその後にアプリケーションを再起動するという優れたツールです。
たいていのプログラミング言語やフレームワークに対しても同様のツールがあります。
@z

@x
## Quick volume type comparisons
@y
{: #quick-volume-type-comparisons }
## ボリューム種類の単純比較
@z

@x
Bind mounts and named volumes are the two main types of volumes that come with the Docker engine. However, additional
volume drivers are available to support other uses cases ([SFTP](https://github.com/vieux/docker-volume-sshfs){:target="_blank" rel="noopener" class="_"}, [Ceph](https://ceph.com/geen-categorie/getting-started-with-the-docker-rbd-volume-plugin/){:target="_blank" rel="noopener" class="_"}, [NetApp](https://netappdvp.readthedocs.io/en/stable/){:target="_blank" rel="noopener" class="_"}, [S3](https://github.com/elementar/docker-s3-volume){:target="_blank" rel="noopener" class="_"}, and more).
@y
バインドマウントと名前つきボリュームは Docker Engine が提供する 2 種類のボリュームです。
これ以外にも別の状況において利用できるボリュームドライバーがあります（[SFTP](https://github.com/vieux/docker-volume-sshfs){:target="_blank" rel="noopener" class="_"}、[Ceph](https://ceph.com/geen-categorie/getting-started-with-the-docker-rbd-volume-plugin/){:target="_blank" rel="noopener" class="_"}、[NetApp](https://netappdvp.readthedocs.io/en/stable/){:target="_blank" rel="noopener" class="_"}、[S3](https://github.com/elementar/docker-s3-volume){:target="_blank" rel="noopener" class="_"} などです）。
@z

@x
|   | Named Volumes | Bind Mounts |
| - | ------------- | ----------- |
| Host Location | Docker chooses | You control |
| Mount Example (using `-v`) | my-volume:/usr/local/data | /path/to/data:/usr/local/data |
| Populates new volume with container contents | Yes | No |
| Supports Volume Drivers | Yes | No |
@y
|   | 名前つきボリューム | バインドマウント |
| - | ------------- | ----------- |
| ホスト側ディレクトリ | Docker が制御 | ユーザーが制御 |
| マウント例（`-v`利用時） | my-volume:/usr/local/data | /path/to/data:/usr/local/data |
| 新ボリュームにコンテナー内容を取り込む | Yes | No |
| ボリュームドライバーのサポート | Yes | No |
@z

@x
## Start a dev-mode container
@y
{: #start-a-dev-mode-container }
## 開発対応のコンテナー起動
@z

@x
To run our container to support a development workflow, we will do the following:
@y
開発作業に対応するようなコンテナー起動を行うため、以下を行っていくことにします。
@z

@x
- Mount our source code into the container
- Install all dependencies, including the "dev" dependencies
- Start nodemon to watch for filesystem changes
@y
- ソースコードをコンテナー内にマウントします。
- 依存パッケージをすべてインストールします。「dev」パッケージもインストールします。
- ファイルシステム変更の監視に nodemon を利用します。
@z

@x
So, let's do it!
@y
さて始めていきます。
@z

@x
1. Make sure you don't have any previous `getting-started` containers running.
@y
1. これまでの`getting-started`コンテナーは一切動いていないことを確認します。
@z

@x
2. Run the following command. We'll explain what's going on afterwards:
@y
2. 以下のコマンドを実行します。
   これがどのようになるのかは後に説明します。
@z

@x
    ```console
    $ docker run -dp 3000:3000 \
        -w /app -v "$(pwd):/app" \
        node:12-alpine \
        sh -c "yarn install && yarn run dev"
    ```
@y
    ```console
    $ docker run -dp 3000:3000 \
        -w /app -v "$(pwd):/app" \
        node:12-alpine \
        sh -c "yarn install && yarn run dev"
    ```
@z

@x
    If you are using PowerShell then use this command:
@y
    PowerShell を利用している場合は以下のコマンドとします。
@z

@x
    ```powershell
    docker run -dp 3000:3000 `
        -w /app -v "$(pwd):/app" `
        node:12-alpine `
        sh -c "yarn install && yarn run dev"
    ```
@y
    ```powershell
    docker run -dp 3000:3000 `
        -w /app -v "$(pwd):/app" `
        node:12-alpine `
        sh -c "yarn install && yarn run dev"
    ```
@z

@x
    - `-dp 3000:3000` - same as before. Run in detached (background) mode and create a port mapping
    - `-w /app` - sets the "working directory" or the current directory that the command will run from
    - `-v "$(pwd):/app"` - bind mount the current directory from the host in the container into the `/app` directory
    - `node:12-alpine` - the image to use. Note that this is the base image for our app from the Dockerfile
    - `sh -c "yarn install && yarn run dev"` - the command. We're starting a shell using `sh` (alpine doesn't have `bash`) and
      running `yarn install` to install _all_ dependencies and then running `yarn run dev`. If we look in the `package.json`,
      we'll see that the `dev` script is starting `nodemon`.
@y
    - `-dp 3000:3000` - 前回と同様です。
      デタッチ（バックグラウンド）モードで実行し、ポートマッピングを生成します。
    - `-w /app` - 「ワーキングディレクトリ」つまりカレントディレクトリを設定し、コマンドをそこから実行します。
    - `-v "$(pwd):/app"` - ホスト上のカレントディレクトリを、コンテナー内の`/app`ディレクトリにバインドマウントします。
    - `node:12-alpine` - 利用イメージです。
      ちなみにこれはアプリケーションがベースイメージとするように Dockerfile 内で指定しています。
    - `sh -c "yarn install && yarn run dev"` - コマンドです。
      ここでは`sh`を起動して（alpine には`bash`がないので）`yarn install`を実行します。
      これによって依存パッケージを **すべて** インストールし、さらに`yarn run dev`を実行します。
      `package.json`の中身を見ればわかるように、`dev`スクリプトから`nodemon`を起動しています。
@z

@x
3. You can watch the logs using `docker logs -f <container-id>`. You'll know you're ready to go when you see this:
@y
3. `docker logs -f <container-id>`を実行すればログ確認ができます。
   このログから準備万端であることがわかります。
@z

@x
    ```console
    $ docker logs -f <container-id>
    nodemon src/index.js
    [nodemon] 1.19.2
    [nodemon] to restart at any time, enter `rs`
    [nodemon] watching dir(s): *.*
    [nodemon] starting `node src/index.js`
    Using sqlite database at /etc/todos/todo.db
    Listening on port 3000
    ```
@y
    ```console
    $ docker logs -f <container-id>
    nodemon src/index.js
    [nodemon] 1.19.2
    [nodemon] to restart at any time, enter `rs`
    [nodemon] watching dir(s): *.*
    [nodemon] starting `node src/index.js`
    Using sqlite database at /etc/todos/todo.db
    Listening on port 3000
    ```
@z

@x
    When you're done watching the logs, exit out by hitting `Ctrl`+`C`.
@y
    ログの確認を終えるには`Ctrl`+`C`を入力して終了させます。
@z

@x
4. Now, let's make a change to the app. In the `src/static/js/app.js` file, let's change the "Add Item" button to simply say
   "Add". This change will be on line 109:
@y
4. それではアプリに変更を加えてみます。
   `src/static/js/app.js`ファイルにおいて「Add Item」ボタン"の名前を単純に「Add」とします。
   この修正を行うのは 109 行めです。
@z

@x
    ```diff
    -                         {submitting ? 'Adding...' : 'Add Item'}
    +                         {submitting ? 'Adding...' : 'Add'}
    ```
@y
    ```diff
    -                         {submitting ? 'Adding...' : 'Add Item'}
    +                         {submitting ? 'Adding...' : 'Add'}
    ```
@z

@x
5. Simply refresh the page (or open it) and you should see the change reflected in the browser almost immediately. It might
   take a few seconds for the Node server to restart, so if you get an error, just try refreshing after a few seconds.
@y
5. 単純にページを更新します（あるいは改めて開きます）。
   ブラウザー上には変更した内容がほぼ即座に反映されたはずです。
   Node サーバーの再起動にはほんの数秒しかかかりませんから、もしエラー発生した場合は数秒待ってページ更新を行ってみてください。
@z

@x
    ![Screenshot of updated label for Add button](images/updated-add-button.png){: style="width:75%;"}
    {: .text-center }
@y
    ![Add ボタンのラベルを修正したスナップショット](images/updated-add-button.png){: style="width:75%;"}
    {: .text-center }
@z

@x
6. Feel free to make any other changes you'd like to make. When you're done, stop the container and build your new image
   using `docker build -t getting-started .`.
@y
6. 他に変更したい内容があれば、どんどん行ってください。
   作業が完了したらコンテナーを停止した上で、`docker build -t getting-started .`の実行により新たなイメージをビルドしてください。
@z

@x
Using bind mounts is _very_ common for local development setups. The advantage is that the dev machine doesn't need to have
all of the build tools and environments installed. With a single `docker run` command, the dev environment is pulled and ready
to go. We'll talk about Docker Compose in a future step, as this will help simplify our commands (we're already getting a lot
of flags).
@y
バインドマウントを利用することは、ローカル開発環境においては **ごくごく** 普通のことです。
これを使う利点は、開発作業を進めるマシンにおいては、ビルドツールや開発環境すべてをインストールする必要がなくなるということです。
`docker run`コマンドを 1 つ実行するだけで、開発環境がプルされすぐに利用可能になります。
この後には Docker Compose の説明を行っていきますが、そのときにはコマンド実行がもっと単純になります（もうすでにたくさんのフラグを使っていますから）。
@z

@x
## Recap
@y
{: #recap }
## まとめ
@z

@x
At this point, we can persist our database and respond rapidly to the needs and demands of our investors and founders. Hooray!
But, guess what? We received great news!
@y
ここまでにデータの保存を行い、会社へ投資してくれる人、会社の設立者から要求があったとしても、即対応できるようになりました。
やりました。
あれ、何でしょう？
驚きのニュースが飛び込んできましたよ。
@z

@x
**Your project has been selected for future development!** 
@y
**このプロジェクトが今後の開発対象として選定されました！** 
@z

@x
In order to prepare for production, we need to migrate our database from working in SQLite to something that can scale a
little better. For simplicity, we'll keep with a relational database and switch our application to use MySQL. But, how 
should we run MySQL? How do we allow the containers to talk to each other? We'll talk about that next!
@y
本番環境へ移行させるためには、データベースとして SQLite での作業としていたものを、もっとスケールアップしたものに変更することが必要です。
作業が複雑にはならないようにリレーショナルデータベースは使い続けるとして、アプリケーションから利用するデータベースは MySQL とします。
だけどどうやって MySQL を実行するのでしょう。
どうやったら複数コンテナーが互いにやりとりできるようになるのでしょう。
さぁ次の説明に進みます。
@z
