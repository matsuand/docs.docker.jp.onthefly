%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Update the application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making changes to our example learning application
---
@y
---
title: "アプリケーションの更新"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: 例として学んでいるアプリケーションに変更を加えます。
---
@z

@x
As a small feature request, we've been asked by the product team to
change the "empty text" when we don't have any todo list items. They
would like to transition it to the following:
@y
製品チームから、ちょっとした機能変更のリクエストがありました。
Todo リスト上にアイテムが何もないときは「空っぽであること」を示すように求められました。
つまり以下のように変更して欲しいとのことです。
@z

@x
> You have no todo items yet! Add one above!
@y
> You have no todo items yet! Add one above!<br/>
> （Todo アイテムがありません。上から追加してください。）
@z

@x
Pretty simple, right? Let's make the change.
@y
とても簡単な話です。
では変更を加えていきます。
@z

@x
## Update the source code
@y
{: #updat-the-source-code }
## ソースコードの更新
@z

@x
1. In the `src/static/js/app.js` file, update line 56 to use the new empty text.
@y
1. `src/static/js/app.js`ファイルにおいて、空であることを示した文章が 56 行めにあり、これを変更します。
@z

@x
    ```diff
    -                <p className="text-center">No items yet! Add one above!</p>
    +                <p className="text-center">You have no todo items yet! Add one above!</p>
    ```
@y
    ```diff
    -                <p className="text-center">No items yet! Add one above!</p>
    +                <p className="text-center">You have no todo items yet! Add one above!</p>
    ```
@z

@x
2. Let's build our updated version of the image, using the same command we used before.
@y
2. 更新バージョンに基づいてイメージを再ビルドします。
   実行するコマンドは前回と同じです。
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
3. Let's start a new container using the updated code.
@y
3. 更新したソースコードを利用した新たなコンテナーを起動します。
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
**Uh oh!** You probably saw an error like this (the IDs will be different):
@y
**あれ？**
おそらく以下のようなエラーが表示されます（ID の値は異なるはずです）。
@z

@x
```bash
docker: Error response from daemon: driver failed programming external connectivity on endpoint laughing_burnell 
(bb242b2ca4d67eba76e79474fb36bb5125708ebdabd7f45c8eaf16caaabde9dd): Bind for 0.0.0.0:3000 failed: port is already allocated.
```
@y
```bash
docker: Error response from daemon: driver failed programming external connectivity on endpoint laughing_burnell 
(bb242b2ca4d67eba76e79474fb36bb5125708ebdabd7f45c8eaf16caaabde9dd): Bind for 0.0.0.0:3000 failed: port is already allocated.
```
@z

@x
So, what happened? We aren't able to start the new container because our old container is still
running. The reason this is a problem is because that container is using the host's port 3000 and
only one process on the machine (containers included) can listen to a specific port. To fix this, 
we need to remove the old container.
@y
何が起きたのでしょう。
新たなコンテナーが起動できなかったのは、古いコンテナーが動いたままだからです。
これが問題になる理由は、古いコンテナーがホストのポート 3000 を利用していて、特定のポートを待ち受けるプロセスは（コンテナーも含めて）マシン上に 1 つしか利用できないからです。
これを解決するには、古いコンテナーを削除します。
@z

@x
## Replace the old container
@y
{: #replace-the-old-container }
## 古いコンテナーの入れ替え
@z

@x
To remove a container, it first needs to be stopped. Once it has stopped, it can be removed. We have two
ways that we can remove the old container. Feel free to choose the path that you're most comfortable with.
@y
コンテナーを削除するには、まずコンテナーを停止させることが必要です。
停止していれば削除することができます。
古いコンテナーを削除するには 2 つの方法があります。
どちらでもやりやすい方法を行ってください。
@z

@x
### Remove a container using the CLI
@y
{: #remove-a-container-using-the-cli }
### CLI を用いたコンテナーの削除
@z

@x
1. Get the ID of the container by using the `docker ps` command.
@y
1. `docker ps`コマンドを実行してコンテナーの ID を確認します。
@z

@x
    ```bash
    docker ps
    ```
@y
    ```bash
    docker ps
    ```
@z

@x
2. Use the `docker stop` command to stop the container.
@y
2. `docker stop`コマンドを実行してコンテナーを停止します。
@z

@x
    ```bash
    # Swap out <the-container-id> with the ID from docker ps
    docker stop <the-container-id>
    ```
@y
    ```bash
    # <the-container-id> は docker ps で得られた ID にします
    docker stop <the-container-id>
    ```
@z

@x
3. Once the container has stopped, you can remove it by using the `docker rm` command.
@y
3. コンテナーを停止したら、`docker rm`コマンドを実行してコンテナーを削除します。
@z

@x
    ```bash
    docker rm <the-container-id>
    ```
@y
    ```bash
    docker rm <the-container-id>
    ```
@z

@x
>**Note**
>
>You can stop and remove a container in a single command by adding the "force" flag
>to the `docker rm` command. For example: `docker rm -f <the-container-id>`
>
@y
>**メモ**
>
>コンテナーの停止と削除を 1 つのコマンドで実行することができます。
>これは`docker rm`コマンドに「force」フラグをつけます。
>たとえば`docker rm -f <the-container-id>`とします。
>
@z

@x
### Remove a container using the Docker Dashboard
@y
{: #remove-a-container-using-the-docker-dashboard }
### Docker ダッシュボードを用いたコンテナーの削除
@z

@x
If you open the Docker dashboard, you can remove a container with two clicks! It's certainly
much easier than having to look up the container ID and remove it.
@y
Docker ダッシュボードを開いていたら、コンテナーの削除はたった 2 クリックです。
確かにコンテナー ID を調べて削除することに比べたら、とても簡単です。
@z

@x
1. With the dashboard opened, hover over the app container and you'll see a collection of action
    buttons appear on the right.
@y
1. ダッシュボードを開いた状態でアプリコンテナー上にマウス移動すると、右側に動作ボタンの一覧が表示されます。
@z

@x
2. Click on the trash can icon to delete the container. 
@y
2. trash can（ゴミ箱）アイコンをクリックしてコンテナーを削除します。
@z

@x
3. Confirm the removal and you're done!
@y
3. 削除確認を行って削除完了。
@z

@x
![Docker Dashboard - removing a container](images/dashboard-removing-container.png)
@y
![Docker ダッシュボード - コンテナー削除](images/dashboard-removing-container.png)
@z

@x
### Start the updated app container
@y
{: #start-the-updated-app-container }
### 更新したアプリコンテナーの起動
@z

@x
1. Now, start your updated app.
@y
1. そこで更新したアプリを起動します。
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
2. Refresh your browser on [http://localhost:3000](http://localhost:3000) and you should see your updated help text!
@y
2. ブラウザー上で [http://localhost:3000](http://localhost:3000) にアクセスしている画面を更新します。
   更新したヘルプテキストが表示されたはずです。
@z

@x
![Updated application with updated empty text](images/todo-list-updated-empty-text.png){: style="width:55%" }
{: .text-center }
@y
![更新アプリケーションと更新ヘルプテキスト](images/todo-list-updated-empty-text.png){: style="width:55%" }
{: .text-center }
@z

@x
## Recap
@y
{: #recap }
## まとめ
@z

@x
While we were able to build an update, there were two things you might have noticed:
@y
更新ビルドを行うことができましたが、ここで気をつける点が 2 つありました。
@z

@x
- All of the existing items in our todo list are gone! That's not a very good app! We'll talk about that
shortly.
- There were _a lot_ of steps involved for such a small change. In an upcoming section, we'll talk about 
how to see code updates without needing to rebuild and start a new container every time we make a change.
@y
- Todo リストに追加したアイテムはすべて消えてしまいます。
  これでは良いアプリとはいえません。
  これについてはすぐに説明していきます。
- とても単純な変更であったのですが、そこには多くの手順がありました。
  次の節では、変更のたびに毎回新たなコンテナーを再ビルドし起動することなく、コード更新を行っていく方法について説明します。
@z

@x
Before talking about persistence, we'll quickly see how to share these images with others.
@y
データの保存機能を取り上げる前に、このイメージを他の方と共有する方法について見ていきます。
@z
