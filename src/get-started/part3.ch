%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Share images on Docker Hub"
keywords: docker hub, push, images
description: Learn how to share images on Docker Hub.
redirect_from:
- /get-started/part5/
---
@y
---
title: "Docker Hub におけるイメージ共有"
keywords: docker hub, push, images
description: Learn how to share images on Docker Hub.
redirect_from:
- /get-started/part5/
---
@z

@x
{% include_relative nav.html selected="3" %}
@y
{% include_relative nav.html selected="3" %}
@z

@x
## Prerequisites
@y
{% comment %}
## Prerequisites
{% endcomment %}
{: #prerequisites }
## 前提条件
@z

@x
Work through the steps to build an image and run it as a containerized application in [Part 2](part2.md).
@y
{% comment %}
Work through the steps to build an image and run it as a containerized application in [Part 2](part2.md).
{% endcomment %}
[2 部](part2.md) にてイメージをビルドし、コンテナー化アプリケーションとして実行できていること。
@z

@x
## Introduction
@y
{% comment %}
## Introduction
{% endcomment %}
{: #introduction }
## はじめに
@z

@x
At this point, you've built a containerized application described in [Part 2](part2.md) on your local development machine.
@y
{% comment %}
At this point, you've built a containerized application described in [Part 2](part2.md) on your local development machine.
{% endcomment %}
ここでは [2 部](part2.md) に示した作業を通じて、ローカル開発マシン上にコンテナー化されたアプリケーションが構築できているものとします。
@z

@x
The final step in developing a containerized application is to share your images on a registry like [Docker Hub](https://hub.docker.com/){: target="_blank" class="_”}, so they can be easily downloaded and run on any destination machine.
@y
{% comment %}
The final step in developing a containerized application is to share your images on a registry like [Docker Hub](https://hub.docker.com/){: target="_blank" class="_”}, so they can be easily downloaded and run on any destination machine.
{% endcomment %}
最後の作業として、開発しているコンテナー化アプリケーションを、[Docker Hub](https://hub.docker.com/){: target="_blank" class="_”} のようなレジストリ上にてイメージを共有していきます。
こうすればイメージを簡単にダウンロードすることができ、目的とするマシンのいずれにおいても動作させることができます。
@z

@x
## Set up your Docker Hub account
@y
{% comment %}
## Set up your Docker Hub account
{% endcomment %}
{: #set-up-your-docker-hub-account }
## Docker Hub アカウントの設定
@z

@x
If you don't have a Docker ID, follow these steps to create one. A Docker ID allows you to share images on Docker Hub.
@y
{% comment %}
If you don't have a Docker ID, follow these steps to create one. A Docker ID allows you to share images on Docker Hub.
{% endcomment %}
Docker ID を持っていない場合は、以下の手順により取得します。
これを行っておくことで Docker Hub 上でのイメージの共有ができるようになります。
@z

@x
1.  Visit the [Docker Hub sign up](https://hub.docker.com/signup){: target="_blank" class="_”} page.
@y
{% comment %}
1.  Visit the [Docker Hub sign up](https://hub.docker.com/signup){: target="_blank" class="_”} page.
{% endcomment %}
1.  [Docker Hub のサインアップページ](https://hub.docker.com/signup){: target="_blank" class="_”} にアクセスします。
@z

@x
2.  Fill out the form and submit to create your Docker ID.
@y
{% comment %}
2.  Fill out the form and submit to create your Docker ID.
{% endcomment %}
2.  入力欄への入力を行って submit ボタンをクリックし Docker ID を生成します。
@z

@x
3.  Verify your email address to complete the registration process.
@y
{% comment %}
3.  Verify your email address to complete the registration process.
{% endcomment %}
3.  電子メールアドレスを確認し、登録手順を終了します。
@z

@x
4.  Click on the Docker icon in your toolbar or system tray, and click **Sign in / Create Docker ID**.
@y
{% comment %}
4.  Click on the Docker icon in your toolbar or system tray, and click **Sign in / Create Docker ID**.
{% endcomment %}
4.  ツールバーあるいはシステムトレイにある Docker アイコンをクリックして **Sign in / Create Docker ID** を実行します。
@z

@x
5.  Fill in your new Docker ID and password. After you have successfully authenticated, your Docker ID appears in the Docker Desktop menu in place of the 'Sign in' option you just used.
@y
{% comment %}
5.  Fill in your new Docker ID and password. After you have successfully authenticated, your Docker ID appears in the Docker Desktop menu in place of the 'Sign in' option you just used.
{% endcomment %}
5.  Docker ID とパスワードを入力します。
    認証が正しく行われると、先ほど実行した Docker Desktop メニューの 'Sign in' のところに Docker ID が表示されます。
@z

@x
    You can also sign into Docker Hub from the command line by typing `docker login`.
@y
    {% comment %}
    You can also sign into Docker Hub from the command line by typing `docker login`.
    {% endcomment %}
    Docker Hub へのサインインは、コマンドラインから `docker login` を入力して行うこともできます。
@z

@x
## Create a Docker Hub repository and push your image
@y
{% comment %}
## Create a Docker Hub repository and push your image
{% endcomment %}
{: #create-a-docker-hub-repository-and-push-your-image }
## Docker Hub リポジトリの生成とイメージプッシュ
@z

@x
>
> Before creating a repository, ensure you’ve set up your Docker Hub account and have connected it to your Docker Desktop.
@y
{% comment %}
>
> Before creating a repository, ensure you’ve set up your Docker Hub account and have connected it to your Docker Desktop.
{% endcomment %}
>
> リポジトリを生成する前に、Docker Hub のアカウントが取得済であり、Docker Desktop から接続できていることを確認してください。
@z

@x
Now let's create your first repository, and push your bulletin board image to Docker Hub.
@y
{% comment %}
Now let's create your first repository, and push your bulletin board image to Docker Hub.
{% endcomment %}
それでは初めてのリポジトリを生成し、掲示板アプリのイメージをプッシュしましょう。
@z

@x
1.  Click on the Docker icon in your menu bar, and navigate to **Repositories > Create**. You'll be redirected to the **Create Repository** page on Docker Hub.
@y
{% comment %}
1.  Click on the Docker icon in your menu bar, and navigate to **Repositories > Create**. You'll be redirected to the **Create Repository** page on Docker Hub.
{% endcomment %}
1.  メニューバー上の Docker アイコンをクリックして **Repositories > Create** を実行します。
    Docker Hub の **Create Repository** というページにリダイレクトされます。
@z

@x
2.  Type the repository name as `bulletinboard` and click **Create** at the bottom of the page. Do not fill any other details for now.
@y
{% comment %}
2.  Fill out the repository name as `bulletinboard`. Leave all the other options alone for now, and click **Create** at the bottom.
{% endcomment %}
2.  リポジトリ名に `bulletinboard` と入力して、下段にある **Create** をクリックします。
    リポジトリ以外の欄は、とりあえずここでは何も入力しないことにします。
@z

@x
    ![make a repo](images/newrepo.png){:width="100%"}
@y
    {% comment %}
    ![make a repo](images/newrepo.png){:width="100%"}
    {% endcomment %}
    ![リポジトリの生成](images/newrepo.png){:width="100%"}
@z

@x
3.  You are now ready to share your image on Docker Hub, however, there's one thing you must do first: images must be *namespaced correctly* to share on Docker Hub. Specifically, you must name images like `<Your Docker ID>/<Repository Name>:<tag>`.
@y
{% comment %}
3.  Now you are ready to share your image on Docker Hub, but there's one thing you must do first: images must be *namespaced correctly* to share on Docker Hub. Specifically, you must name images like `<Docker ID>/<Repository Name>:<tag>`. You can relabel your `bulletinboard:1.0` image like this (of course, please replace `gordon` with your Docker ID):
{% endcomment %}
3.  Docker Hub 上においてイメージを共有できる状態になりました。
    ただし共有する前に、まずやっておくべきことがあります。
    Docker Hub 上にイメージを共有するには、イメージの名前空間を適切に設定しておかなければなりません。
    具体的には、イメージ名を `<Docker ID>/<リポジトリ名>:<タグ>` とする必要があります。
@z

@x
    Make sure you’re in the `node-bulletin-board/bulletin-board-app` directory in a terminal or PowerShell then and run:
@y
    {% comment %}
    Make sure you’re in the `node-bulletin-board/bulletin-board-app` directory in a terminal or PowerShell then and run:
    {% endcomment %}
    そこで端末画面か PowerShell 上において、`node-bulletin-board/bulletin-board-app` ディレクトリにいることを確認して、以下を実行します。
@z

@x
    ```shell
    docker tag bulletinboard:1.0 <Your Docker ID>/bulletinboard:1.0
    ```
@y
    ```shell
    docker tag bulletinboard:1.0 <あなたの Docker ID>/bulletinboard:1.0
    ```
@z

@x
4.  Finally, push your image to Docker Hub:
@y
{% comment %}
4.  Finally, push your image to Docker Hub:
{% endcomment %}
4.  最後にイメージを Docker Hub にプッシュします。
@z

@x
    ```shell
    docker push <Your Docker ID>/bulletinboard:1.0
    ```
@y
    ```shell
    docker push <あなたの Docker ID>/bulletinboard:1.0
    ```
@z

@x
    Visit your repository in [Docker Hub](https://hub.docker.com/repositories){: target="_blank" class="_”}, and you'll see your new image there. Remember, Docker Hub repositories are public by default.
@y
    {% comment %}
    Visit your repository in [Docker Hub](https://hub.docker.com/repositories){: target="_blank" class="_”}, and you'll see your new image there. Remember, Docker Hub repositories are public by default.
    {% endcomment %}
    [Docker Hub](https://hub.docker.com/repositories){: target="_blank" class="_”} においてこのリポジトリにアクセスしてみると、新たなイメージがそこに表示されています。
    Docker Hub リポジトリは、デフォルトで公開されている（public となっている）ことに注意してください。
@z

@x
    > **Having trouble pushing?** Remember, you must be signed into Docker Hub through Docker Desktop or the command line, and you must also name your images correctly, as per the above steps. If the push seemed to work, but you don't see it in Docker Hub, refresh your browser after a couple of minutes and check again.
@y
    {% comment %}
    > **Having trouble pushing?** Remember, you must be signed into Docker Hub through Docker Desktop or the command line, and you must also name your images correctly, as per the above steps. If the push seemed to work, but you don't see it in Docker Hub, refresh your browser after a couple of minutes and check again.
    {% endcomment %}
    > **プッシュに失敗した場合** Docker Hub へは Docker Desktop から、あるいはコマンドラインからサインインしていることが必要です。
    > また上記の手順にて示したように、イメージは適切な名称としていなければなりません。
    > プッシュを行っても Docker Hub 上に表示されていない場合は、数分待ってからブラウザーを再表示して確認してください。
@z

@x
## Conclusion
@y
{% comment %}
## Conclusion
{% endcomment %}
{: #conclusion }
## まとめ
@z

@x
Now that your image is available on Docker Hub, you'll be able to run it anywhere. If you try to use it on a new machine that doesn't have it yet, Docker will automatically try and download it from Docker Hub. By moving images around in this way, you no longer need to install any dependencies except Docker on the machines you want to run your software on. The dependencies of containerized applications are completely encapsulated and isolated within your images, which you can share using Docker Hub as described above.
@y
{% comment %}
Now that your image is available on Docker Hub, you'll be able to run it anywhere. If you try to use it on a new machine that doesn't have it yet, Docker will automatically try and download it from Docker Hub. By moving images around in this way, you no longer need to install any dependencies except Docker on the machines you want to run your software on. The dependencies of containerized applications are completely encapsulated and isolated within your images, which you can share using Docker Hub as described above.
{% endcomment %}
こうして Docker Hub 上でのイメージ共有ができるようになりました。
これからはどのような環境上でもこれを実行できることになります。
このイメージをまだ入手していない新たなマシンを使って、このイメージを利用しようとすると、Docker が自動的に Docker Hub からイメージを入手、ダウンロードします。
このようにしてイメージをあちこちに移動して利用します。
つまりソフトウェアを実行しようとしているマシン上には、Docker 以外に依存パッケージをインストールしておく必要がありません。
コンテナー化アプリケーションにとっての依存パッケージは、完全にイメージ内部にカプセル化され切り離されます。
こうしてそのイメージは、上で説明した Docker Hub を利用して共有できることになります。
@z

@x
Another thing to keep in mind: at the moment, you've only pushed your image to Docker Hub; what about your Dockerfile? A crucial best practice is to keep these in version control, perhaps alongside your source code for your application. You can add a link or note in your Docker Hub repository description indicating where these files can be found, preserving the record not only of how your image was built, but how it's meant to be run as a full application.
@y
{% comment %}
Another thing to keep in mind: at the moment, you've only pushed your image to Docker Hub; what about your Dockerfile? A crucial best practice is to keep these in version control, perhaps alongside your source code for your application. You can add a link or note in your Docker Hub repository description indicating where these files can be found, preserving the record not only of how your image was built, but how it's meant to be run as a full application.
{% endcomment %}
もう一つ意識しておくことがあります。
この時点では Docker Hub にイメージをプッシュしただけです。
さて対応する Dockerfile はどうしますか？
重要なベストプラクティスとして、こういったファイルはバージョン管理システムを使い、おそらくはアプリケーションソースコードとともに管理すべきです。
Docker Hub リポジトリにおいては、それらファイルがどこにあるかをメモやリンクにより説明することができます。
そこでは単にイメージのビルド方法を示すだけではなく、アプリケーションを完全に動作させるための方法を示すことが必要になります。
@z

@x
## Where to go next
@y
{% comment %}
## Where to go next
{% endcomment %}
{: #where-to-go-next }
## 次に読むものは
@z

@x
We recommend that you take a look at the topics in [Develop with Docker](../develop/index.md) to learn how to develop your own applications using Docker.
@y
{% comment %}
We recommend that you take a look at the topics in [Develop with Docker](../develop/index.md) to learn how to develop your own applications using Docker.
{% endcomment %}
以下のトピック [Docker を用いた開発](../develop/index.md) の一読をおすすめします。
Docker を用いた独自アプリケーションの開発方法を学んでください。
@z
