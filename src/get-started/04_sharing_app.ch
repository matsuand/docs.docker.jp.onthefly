%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Share the application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop, docker hub, sharing 
redirect_from:
- /get-started/part3/
description: Sharing our image we built for our example application so we can run it else where and other developers can use it
---
@y
---
title: "アプリケーションの共有"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop, docker hub, sharing 
redirect_from:
- /get-started/part3/
description: Sharing our image we built for our example application so we can run it else where and other developers can use it
---
@z

@x
Now that we've built an image, let's share it! To share Docker images, you have to use a Docker
registry. The default registry is Docker Hub and is where all of the images we've used have come from.
@y
ここまでにイメージをビルドしたので、これを共有しましょう。
Docker イメージを共有するには Docker レジストリを使うことになります。
デフォルトのレジストリは Docker Hub です。
これまで利用してきたイメージはすべて Docker Hub から取得したものでした。
@z

@x
> **Docker ID**
>
> A Docker ID allows you to access Docker Hub which is the world's largest library and community for container images. Create a [Docker ID](https://hub.docker.com/signup){:target="_blank" rel="noopener" class="_"} for free if you don't have one.
@y
> **Docker ID**
>
> Docker ID を利用すれば Docker Hub にアクセスすることができます。
> Docker Hub は世界規模のコンテナーイメージライブラリおよびコミュニティです。
> まだ [Docker ID](https://hub.docker.com/signup){:target="_blank" rel="noopener" class="_"} を取得していない場合は、無料入手してください。
@z

@x
## Create a repo
@y
{: #create-a-repo }
## リポジトリの生成
@z

@x
To push an image, we first need to create a repository on Docker Hub.
@y
イメージをプッシュするには、まず Docker Hub 上にリポジトリを生成する必要があります。
@z

@x
1. [Sign up](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){:target="_blank" rel="noopener" class="_"} and share images using Docker Hub.
@y
1. Docker Hub でのイメージ共有を行うために [サインアップ](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){:target="_blank" rel="noopener" class="_"} します。
@z

@x
2. Sign in to [Docker Hub](https://hub.docker.com){:target="_blank" rel="noopener" class="_"}.
@y
2. [Docker Hub](https://hub.docker.com){:target="_blank" rel="noopener" class="_"} にサインインします。
@z

@x
2. Click the **Create Repository** button.
@y
2. **Create Repository**（リポジトリの生成）ボタンをクリックします。
@z

@x
3. For the repo name, use `getting-started`. Make sure the Visibility is `Public`.
@y
3. リポジトリ名を`getting-started`とします。
   Visibility は`Public`としてください。
@z

@x
    > **Private repositories**
    >
    > Did you know that Docker offers private repositories which allows you to restrict content to specific users or teams? Check out the details on the [Docker pricing](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){:target="_blank" rel="noopener" class="_"} page.
@y
    > **プライベートリポジトリ**
    >
    > Docker ではプライベートリポジトリが提供されていて、特定のユーザーやチームにのみアクセスを制限できることをご存じですか？
    > 詳しくは [Docker 料金体系](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){:target="_blank" rel="noopener" class="_"} のページを確認してください。
@z

@x
4. Click the **Create** button!
@y
4. **Create**（生成）ボタンをクリックします。
@z

@x
If you look on the right-side of the page, you'll see a section named **Docker commands**. This gives
an example command that you will need to run to push to this repo.
@y
ページの右側を見てみると、**Docker commands** というセクションがあります。
そこにはこのリポジトリへのプッシュを行うコマンド例が示されています。
@z

@x
![Docker command with push example](images/push-command.png){: style=width:75% }
{: .text-center }
@y
![Docker command に示されるプッシュ例](images/push-command.png){: style=width:75% }
{: .text-center }
@z

@x
## Push the image
@y
{: #push-the-image }
## イメージのプッシュ
@z

@x
1. In the command line, try running the push command you see on Docker Hub. Note that your command
   will be using your namespace, not "docker".
@y
1. コマンドラインから Docker Hub 上に示されていたプッシュコマンドを実行してみます。
   なお実行コマンドでは、名前空間は「docker」ではなく、あなた自身のものを利用することになります。
@z

@x
    ```plaintext
    $ docker push docker/getting-started
    The push refers to repository [docker.io/docker/getting-started]
    An image does not exist locally with the tag: docker/getting-started
    ```
@y
    ```plaintext
    $ docker push docker/getting-started
    The push refers to repository [docker.io/docker/getting-started]
    An image does not exist locally with the tag: docker/getting-started
    ```
@z

@x
    Why did it fail? The push command was looking for an image named docker/getting-started, but
    didn't find one. If you run `docker image ls`, you won't see one either.
@y
    失敗したのはなぜでしょう。
    上のプッシュコマンドは docker/getting-started という名前のイメージを探しに行っています。
    そしてそれを見つけられませんでした。
    `docker image ls`を実行しても、そのイメージはありません。
@z

@x
    To fix this, we need to "tag" our existing image we've built to give it another name.
@y
    これを解決するには、作り出したイメージに対して別の名前をつける必要があります。
@z

@x
2. Login to the Docker Hub using the command `docker login -u YOUR-USER-NAME`.
@y
2. `docker login -u YOUR-USER-NAME`コマンドを実行して Docker Hub にログインします。
@z

@x
3. Use the `docker tag` command to give the `getting-started` image a new name. Be sure to swap out
   `YOUR-USER-NAME` with your Docker ID.
@y
3. `docker tag`コマンドを実行して`getting-started`イメージに新たな名前をつけます。
   `YOUR-USER-NAME`の部分は自分の Docker ID に書き換えてください。
@z

@x
    ```bash
    docker tag getting-started YOUR-USER-NAME/getting-started
    ```
@y
    ```bash
    docker tag getting-started YOUR-USER-NAME/getting-started
    ```
@z

@x
4. Now try your push command again. If you're copying the value from Docker Hub, you can drop the 
   `tagname` portion, as we didn't add a tag to the image name. If you don't specify a tag, Docker
   will use a tag called `latest`.
@y
4. そこでもう一度プッシュコマンドを実行します。
   コマンドを Docker Hub からコピーしていた場合、`tagname`部分がないことになります。
   イメージ名にはタグを追加しなかったからです。
   タグ指定がない場合 Docker は`latest`というタグを利用します。
@z

@x
    ```bash
    docker push YOUR-USER-NAME/getting-started
    ```
@y
    ```bash
    docker push YOUR-USER-NAME/getting-started
    ```
@z

@x
## Run the image on a new instance
@y
{: #run-the-image-on-a-new-instance }
## 新たなインスタンス上でのイメージの実行
@z

@x
Now that our image has been built and pushed into a registry, let's try running our app on a brand
new instance that has never seen this container image! To do this, we will use Play with Docker.
@y
イメージをビルドしてレジストリにプッシュするところまでできました。
そこでこのコンテナーイメージをまだ一度も参照したことがない新たなインスタンスを起動することにします。
これを行うためにここでは Play with Docker を利用します。
@z

@x
1. Open your browser to [Play with Docker](https://labs.play-with-docker.com/){:target="_blank" rel="noopener" class="_"}.
@y
1. ブラウザーを開いて [Play with Docker](https://labs.play-with-docker.com/){:target="_blank" rel="noopener" class="_"} にアクセスします。
@z

@x
2. Click **Login** and then select **docker** from the drop-down list.
@y
2. **login** をクリックしてドロップダウンリストから **docker** を選びます。
@z

@x
3. Connect with your Docker Hub account.
@y
3. Docker Hub アカウントに接続します。
@z

@x
4. Once you're logged in, click on the **ADD NEW INSTANCE** option on the left side bar. If you don't see it, make your browser a little wider. After a few seconds, a terminal window opens in your browser.
@y
4. ログインを行ったら、左サイドバーにある **ADD NEW INSTANCE**（新たなインスタンス追加）オプションをクリックします。
   （このリンクが見えなかったらブラウザー画面をもう少し広げてください。）
   数秒してブラウザーの中にターミナル画面が開きます。
@z

@x
    ![Play with Docker add new instance](images/pwd-add-new-instance.png){: style=width:75% }
@y
   ![Play with Docker から新たなインスタンス追加](images/pwd-add-new-instance.png){: style=width:75% }
@z

@x
5. In the terminal, start your freshly pushed app.
@y
5. ターミナルからプッシュした新しいアプリを起動します。
@z

@x
    ```bash
    docker run -dp 3000:3000 YOUR-USER-NAME/getting-started
    ```
@y
   ```bash
   docker run -dp 3000:3000 YOUR-USER-NAME/getting-started
   ```
@z

@x
    You should see the image get pulled down and eventually start up!
@y
    イメージがプルされた後に起動されます。
@z

@x
5. Click on the 3000 badge when it comes up and you should see the app with your modifications! Hooray!
    If the 3000 badge doesn't show up, you can click on the "Open Port" button and type in 3000.
@y
5. アプリが起動したら 3000 badge をクリックします。
   変更を加えたアプリが起動されたことがわかります。
   やりました。
   3000 badge が表示されなかった場合は、「Open Port」ボタンをクリックして 3000 を入力してください。
@z

@x
## Recap
@y
{: #recap }
## まとめ
@z

@x
In this section, we learned how to share our images by pushing them to a registry. We then went to a
brand new instance and were able to run the freshly pushed image. This is quite common in CI pipelines,
where the pipeline will create the image and push it to a registry and then the production environment
can use the latest version of the image.
@y
本節では、レジストリにイメージをプッシュしてこれを共有する方法を学びました。
また新たなインスタンスを実行させ、プッシュした新たなイメージの起動に成功しました。
CI パイプラインとしてこれはいたって普通のことです。
このパイプラインによってイメージを生成しレジストリにイメージをプッシュします。
そして本番環境ではイメージの最新バージョンを用いることができます。
@z

@x
Now that we have that figured out, let's circle back around to what we noticed at the end of the last
section. As a reminder, we noticed that when we restarted the app, we lost all of our todo list items.
That's obviously not a great user experience, so let's learn how we can persist the data across 
restarts!
@y
ここでのことは明らかになったので、前節の終わりに示していた気がかりな点に戻ることにします。
もう一度言うと、アプリを再起動すると、それまでの Todo リストアイテムが消えてしまっていたということです。
これは明らかに正しい形ではありません。
そこで再起動してもデータが残るような方法を学んでいきましょう。
@z
