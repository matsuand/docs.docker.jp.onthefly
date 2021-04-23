%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Sample application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
redirect_from:
- /get-started/part2/
description: overview of our simple application for learning docker
---
@y
---
title: "サンプルアプリケーション"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
redirect_from:
- /get-started/part2/
description: overview of our simple applicaiton for learning docker
---
@z

@x
For the rest of this tutorial, we will be working with a simple todo
list manager that is running in Node.js. If you're not familiar with Node.js,
don't worry. No real JavaScript experience is needed.
@y
ここからのチュートリアルでは、Node.js において稼動する単純な ToDo リストマネージャーを作っていくことにします。
Node.js をよくわかっていなくても心配ありません。
JavaScript の知識などなくてもかまいません。
@z

@x
At this point, your development team is quite small and you're simply
building an app to prove out your MVP (minimum viable product). You want
to show how it works and what it's capable of doing without needing to
think about how it will work for a large team, multiple developers, etc.
@y
この時点で開発体制の規模は極めて小さく、MVP（minimum viable product; 最小限の実行可能な製品）となるように単にアプリをビルドするだけです。
ここで理解するのは、アプリがどのように動作し何ができるかということです。
大規模チーム向けや多人数の開発者向けにどのように機能するかという点を考慮する必要はありません。
@z

@x
![Todo List Manager Screenshot](images/todo-list-sample.png){: style="width:50%;" }
@y
![ToDo リストマネージャーのスクリーンショット](images/todo-list-sample.png){: style="width:50%;" }
@z

@x
## Get the app
@y
{: #get-the-app }
## アプリの入手
@z

@x
Before we can run the application, we need to get the application source code onto 
our machine. For real projects, you will typically clone the repo. But, for this tutorial,
we have created a ZIP file containing the application.
@y
アプリケーションを実行するために、アプリケーションのソースコードを入手してマシン上におくことが必要です。
実際の開発プロジェクトであれば、普通はリポジトリからクローン取得を行うところです。
しかし本チュートリアルでは、アプリケーションを含んだ ZIP ファイルをすでに用意しています。
@z

@x
1. [Download the App contents](https://github.com/docker/getting-started/tree/master/app){:target="_blank" rel="noopener" class="_"}. You can either pull the entire project or download it as a zip and extract the app folder out to get started with
@y
1. [アプリ配布をダウンロードします](https://github.com/docker/getting-started/tree/master/app){:target="_blank" rel="noopener" class="_"}。
   プロジェクト全体をプルして入手することもできます。
   ZIP ファイルとしてダウンロードした場合は、アプリケーションフォルダーを抽出（解凍）します。
@z

@x
2. Once extracted, use your favorite code editor to open the project. If you're in need of
    an editor, you can use [Visual Studio Code](https://code.visualstudio.com/){:target="_blank" rel="noopener" class="_"}. You should
    see the `package.json` and two subdirectories (`src` and `spec`).
@y
1. 抽出（解凍）を行ったら、普段使っているエディターを使ってプロジェクトを開きます。
   ソース編集を必要とする場合は [Visual Studio Code](https://code.visualstudio.com/){:target="_blank" rel="noopener" class="_"} が利用できます。
   ソースディレクトリ内には`package.json`と 2 つのサブディレクトリ`src`と`spec`があります。
@z

@x
    ![Screenshot of Visual Studio Code opened with the app loaded](images/ide-screenshot.png){: style="width:650px;margin-top:20px;"}
    {: .text-center }
@y
    ![ロードしたアプリを Visual Studio Code で開いたスクリーンショット](images/ide-screenshot.png){: style="width:650px;margin-top:20px;"}
    {: .text-center }
@z

@x
## Build the app's container image
@y
{: #build-the-apps-container-image }
## アプリのコンテナーイメージのビルド
@z

@x
In order to build the application, we need to use a `Dockerfile`. A
Dockerfile is simply a text-based script of instructions that is used to
create a container image. If you've created Dockerfiles before, you might
see a few flaws in the Dockerfile below. But, don't worry. We'll go over them.
@y
アプリケーションをビルドするためには`Dockerfile`を利用する必要があります。
Dockerfile とは単純なテキストベースのスクリプトファイルであり、コンテナーイメージを生成するための命令を記述するものです。
Dockerfile を作ったことがある方なら、以下に示す Dockerfile は不十分なものであると気づくかもしれません。
しかし心配はいりません。
これについては説明していきます。
@z

@x
1. Create a file named `Dockerfile` in the same folder as the file `package.json` with the following contents.
@y
1. `package.json`ファイルやこれにともなうファイルが存在している同一フォルダー内に、`Dockerfile`という名前のファイルを生成します。
@z

@x
    ```dockerfile
    # syntax=docker/dockerfile:1
    FROM node:12-alpine
    RUN apk add --no-cache python g++ make
    WORKDIR /app
    COPY . .
    RUN yarn install --production
    CMD ["node", "src/index.js"]
    ```
@y
    ```dockerfile
    # syntax=docker/dockerfile:1
    FROM node:12-alpine
    RUN apk add --no-cache python g++ make
    WORKDIR /app
    COPY . .
    RUN yarn install --production
    CMD ["node", "src/index.js"]
    ```
@z

@x
    Please check that the file `Dockerfile` has no file extension like `.txt`. Some editors may append this file extension automatically and this would result in an error in the next step.
@y
    `Dockerfile`ファイルには`.txt`といったようなファイル拡張子がないことを確認してください。
    テキストエディターの中にはファイル拡張子を自動的に付与するものがあるため、そうなってしまうとこれ以降の手順においてエラーが発生します。
@z

@x
2. If you haven't already done so, open a terminal and go to the `app` directory with the `Dockerfile`. Now build the container image using the `docker build` command.
@y
2. ターミナルをまだ開いていなければこれを開き、`Dockerfile`ファイルがある`app`ディレクトリに移動します。
   そして`docker build`コマンドを実行してコンテナーイメージをビルドします。
@z

@x
    ```bash
    docker build -t getting-started .
    ```
@y
    ```bash
    docker build -t getting-started .
    ```
@z

@x
    This command used the Dockerfile to build a new container image. You might
    have noticed that a lot of "layers" were downloaded. This is because we instructed
    the builder that we wanted to start from the `node:12-alpine` image. But, since we
    didn't have that on our machine, that image needed to be downloaded.
@y
    このコマンドは Dockerfile を利用して新たにコンテナーイメージをビルドします。
    実行の際には数々の「レイヤー」をダウンロードしたことが表示されます。
    イメージのビルド処理において`node:12-alpine`イメージから作業を始めたいという指示を下したからです。
    マシン内に必要なイメージが存在しなかったために、そのダウンロードが必要であったということです。
@z

@x
    After the image was downloaded, we copied in our application and used `yarn` to 
    install our application's dependencies. The `CMD` directive specifies the default 
    command to run when starting a container from this image.
@y
    イメージがダウンロードされた後は、アプリケーションをコピーし`yarn`を使って依存パッケージをインストールします。
    `CMD`ディレクティブは、イメージからコンテナーが起動された際に実行されるデフォルトコマンドを指定するものです。
@z

@x
    Finally, the `-t` flag tags our image. Think of this simply as a human-readable name
    for the final image. Since we named the image `getting-started`, we can refer to that
    image when we run a container.
@y
    最後に`-t`フラグによってイメージに名前づけを行います。
    最終イメージに対して、人が読みやすいような名称をつけたものと思ってください。
    ここでは`getting-started`というイメージ名としたので、コンテナーを起動する際にこのイメージが参照できるようになりました。
@z

@x
    The `.` at the end of the `docker build` command tells that Docker should look for the `Dockerfile` in the current directory.
@y
    `docker build`コマンドの最後に`.`があるのは、Docker に対して`Dockerfile`を探し出す場所がカレントディレクトリであることを指示するものです。
@z

@x
## Start an app container
@y
{: #start-an-app-container }
## アプリコンテナーの起動
@z

@x
Now that we have an image, let's run the application. To do so, we will use the `docker run`
command (remember that from earlier?).
@y
イメージを作り出したのでアプリケーションを実行してみます。
これを行うには`docker run`コマンドを実行します（すでにご存知ですか）。
@z

@x
1. Start your container using the `docker run` command and specify the name of the image we 
    just created:
@y
1. `docker run`コマンドを実行してコンテナーを起動し、上で生成したイメージ名を指定します。
@z

@x
    ```bash
    docker run -dp 3000:3000 getting-started
    ```
@y
    ```bash
    docker run -dp 3000:3000 getting-started
    ```
@z

@x
    Remember the `-d` and `-p` flags? We're running the new container in "detached" mode (in the 
    background) and creating a mapping between the host's port 3000 to the container's port 3000.
    Without the port mapping, we wouldn't be able to access the application.
@y
    `-d`フラグと`-p`フラグは覚えていますか。
    新たなコンテナーは「デタッチ」モード（バックグラウンド）で起動しています。
    そしてホストのポート 3000 をコンテナーのポート 3000 にマッピングしています。
    このポートマッピングがないとアプリケーションにアクセスすることはできません。
@z

@x
2. After a few seconds, open your web browser to [http://localhost:3000](http://localhost:3000).
    You should see our app.
@y
2. 数秒待ってから、ブラウザーを使って [http://localhost:3000](http://localhost:3000) にアクセスします。
    アプリケーションが表示されるはずです。
@z

@x
    ![Empty Todo List](images/todo-list-empty.png){: style="width:450px;margin-top:20px;"}
    {: .text-center }
@y
    ![空の Todo リスト](images/todo-list-empty.png){: style="width:450px;margin-top:20px;"}
    {: .text-center }
@z

@x
3. Go ahead and add an item or two and see that it works as you expect. You can mark items as
   complete and remove items. Your frontend is successfully storing items in the backend.
   Pretty quick and easy, huh?
@y
3. 作業を行ってみます。
   アイテムを 2、3 追加して、思ったとおりに動作するかを確認します。
   アイテムにはマークづけとして完了や削除を指定できます。
   フロントエンドからの操作によってバックエンドにアイテム保存されました。
   何とも早く簡単なことでしょう。
@z

@x
At this point, you should have a running todo list manager with a few items, all built by you.
Now, let's make a few changes and learn about managing our containers.
@y
ここまでに Todo リストマネージャーを実行してアイテムをいくつか追加しました。
これはすべてあなたがビルドしたのです。
そこでいくらか変更を行って、コンテナー管理について学んでいきましょう。
@z

@x
If you take a quick look at the Docker Dashboard, you should see your two containers running now 
(this tutorial and your freshly launched app container).
@y
Docker ダッシュボードを覗いてみれば、今の時点で 2 つのコンテナーが実行していることがわかります。
（本チュートリアルのコンテナーと新たに実行したアプリコンテナーです。）
@z

@x
![Docker Dashboard with tutorial and app containers running](images/dashboard-two-containers.png)
@y
![チュートリアルとアプリのコンテナーが稼動している Docker ダッシュボード](images/dashboard-two-containers.png)
@z

@x
## Recap
@y
{: #recap }
## まとめ
@z

@x
In this short section, we learned the very basics about building a container image and created a
Dockerfile to do so. Once we built an image, we started the container and saw the running app.
@y
本節ではコンテナーイメージのビルド方法の基本について学びました。
またこれを行うために Dockerfile を生成しました。
イメージをビルドした後は、コンテナーを起動してアプリ実行を確認しました。
@z

@x
Next, we're going to make a modification to our app and learn how to update our running application
with a new image. Along the way, we'll learn a few other useful commands.
@y
次はアプリに対して変更を行い、新たなイメージによって実行アプリケーションを更新する方法について学びます。
その中では便利なコマンドもいくつか学んでいきます。
@z
