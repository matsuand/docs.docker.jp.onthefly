%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Persist the DB"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making our DB persistent in our application
---
@y
---
title: "DB へのデータ保存"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: アプリケーションにおける DB データを保存します。
---
@z

@x
In case you didn't notice, our todo list is being wiped clean every single time
we launch the container. Why is this? Let's dive into how the container is working.
@y
状況はおわかりですか。
コンテナーを起動するたびに Todo リストがきれいにクリアされてしまいます。
なぜこうなるのでしょう。
そこでコンテナーがどのように動作するのかを確認していきましょう。
@z

@x
## The container's filesystem
@y
{: #the-containers-filesystem }
## コンテナーのファイルシステム
@z

@x
When a container runs, it uses the various layers from an image for its filesystem.
Each container also gets its own "scratch space" to create/update/remove files. Any
changes won't be seen in another container, _even if_ they are using the same image.
@y
コンテナーが起動すると、イメージ内のさまざまなレイヤーがファイルシステムに利用されます。
また各コンテナーには、ファイルの生成/更新/削除を行うための「スクラッチスペース」（scratch space、一時的な領域）をもっています。
1 つのイメージを共通に利用しているからといって、1 つのコンテナー上の変更が他のコンテナーに及ぶわけではありません。
@z

@x
### See this in practice
@y
{: #see-this-in-practice }
### 実際を確認
@z

@x
To see this in action, we're going to start two containers and create a file in each.
What you'll see is that the files created in one container aren't available in another.
@y
実際の動作を見てみるために 2 つのコンテナーを起動させて、それぞれにファイル生成を行ってみます。
そこでわかってくるのは、1 つのコンテナーで生成したファイルは、もう 1 つのコンテナーで利用することはできないということです。
@z

@x
1. Start an `ubuntu` container that will create a file named `/data.txt` with a random number
   between 1 and 10000.
@y
1. `ubuntu`コンテナーを起動させます。
   その際には、1 から 10000 までの間の乱数を発生させて、`/data.txt`というファイルに書き込みます。
@z

@x
    ```bash
    docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
    ```
@y
    ```bash
    docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
    ```
@z

@x
    In case you're curious about the command, we're starting a bash shell and invoking two
    commands (why we have the `&&`). The first portion picks a single random number and writes
    it to `/data.txt`. The second command is simply watching a file to keep the container running.
@y
    このコマンドがよくわからない方のために説明しておくと、上では Bash シェルを起動させて 2 つのコマンドを実行させています（だから`&&`を使っています）。
    前半のコマンドは 1 つの乱数を発生させて`/data.txt`に出力しています。
    そして後半のコマンドでは、単純にこのファイルを見ることによってこのコンテナーを実行し続けます。
@z

@x
2. Validate we can see the output by `exec`ing into the container. To do so, open the Dashboard and click the first action of the container that is running the `ubuntu` image.
@y
2. コンテナー内で`exec`を実行し、その結果を確認します。
   これを行うにはダッシュボードを開いて、`ubuntu`イメージを起動させているコンテナーの 1 つめの動作をクリックします。
@z

@x
    ![Dashboard open CLI into ubuntu container](images/dashboard-open-cli-ubuntu.png){: style=width:75% }
@y
    ![ダッシュボードでの ubuntu コンテナーに対する CLI オープン](images/dashboard-open-cli-ubuntu.png){: style=width:75% }
@z

@x
    You will see a terminal that is running a shell in the ubuntu container. Run the following command to see the content of the `/data.txt` file. Close this terminal afterwards again.
@y
    ターミナルを見れば Ubuntu コンテナー内にシェルが実行されたことがわかります。
    そこで以下のコマンドを実行して`/data.txt`ファイルの中身を確認します。
    その後はこのターミナルを再び閉じてください。
@z

@x
    ```bash
    cat /data.txt
    ```
@y
    ```bash
    cat /data.txt
    ```
@z

@x
    If you prefer the command line you can use the `docker exec` command to do the same. You need to get the
   container's ID (use `docker ps` to get it) and get the content with the following command.
@y
    コマンドラインを選ぶ場合は`docker exec`コマンドを実行して同じことを行います。
    その場合は（`docker ps`を実行して）コンテナー ID を得る必要があります。
    そしてファイル内容を以下のようにして確認します。
@z

@x
    ```bash
    docker exec <container-id> cat /data.txt
    ```
@y
    ```bash
    docker exec <container-id> cat /data.txt
    ```
@z

@x
    You should see a random number!
@y
    乱数が書き込まれているはずです。
@z

@x
3. Now, let's start another `ubuntu` container (the same image) and we'll see we don't have the same
   file.
@y
3. そこで（同一イメージから）別の`ubuntu`コンテナーを起動させます。
   このコンテナーに同じファイルを持っていないかどうかを見てみます。
@z

@x
    ```bash
    docker run -it ubuntu ls /
    ```
@y
    ```bash
    docker run -it ubuntu ls /
    ```
@z

@x
    And look! There's no `data.txt` file there! That's because it was written to the scratch space for
    only the first container.
@y
    見てください。
    たしかに`data.txt`ファイルはありません。
    こうなった理由は、ファイルの書き込みが 1 つめのコンテナーのスクラッチスペースにしか行われていないからです。
@z

@x
4. Go ahead and remove the first container using the `docker rm -f` command.
@y
4. `docker rm -f`コマンドを実行して 1 つめのコンテナーを削除します。
@z

@x
## Container volumes
@y
{: #container-volumes }
## コンテナーボリューム
@z

@x
With the previous experiment, we saw that each container starts from the image definition each time it starts. 
While containers can create, update, and delete files, those changes are lost when the container is removed 
and all changes are isolated to that container. With volumes, we can change all of this.
@y
上で行った実験では、起動元となるイメージ定義に基づいて、各コンテナーがその都度起動する様子を見ました。
コンテナーではファイルの生成、更新、削除を行うことができますが、コンテナーを削除すると、そういった変更はすべて失われ、コンテナーから切り離されます。
そこでボリュームを利用すると、この状況を変えることができます。
@z

@x
[Volumes](../storage/volumes.md) provide the ability to connect specific filesystem paths of 
the container back to the host machine. If a directory in the container is mounted, changes in that
directory are also seen on the host machine. If we mount that same directory across container restarts, we'd see
the same files.
@y
[ボリューム](../storage/volumes.md) とは、コンテナー内に特別なファイルシステムがホストシステムに向けて生成され、そこにアクセスする機能を提供するものです。
コンテナー内のあるディレクトリがマウントされていると、そのディレクトリ内で行われた変更がホストマシンからも見ることができます。
仮にコンテナーの再起動の前後で 1 つのディレクトリをマウントしておけば、同一のファイルを維持できることになります。
@z

@x
There are two main types of volumes. We will eventually use both, but we will start with **named volumes**.
@y
ボリュームには大きく 2 つの種類があります。
最終的にはその両方を利用しますが、まずは **名前つきボリューム**（named volumes）から始めます。
@z

@x
## Persist the todo data
@y
{: #persist-the-todo-data }
## Todo データの保存
@z

@x
By default, the todo app stores its data in a [SQLite Database](https://www.sqlite.org/index.html){:target="_blank" rel="noopener" class="_"} at
`/etc/todos/todo.db`. If you're not familiar with SQLite, no worries! It's simply a relational database in 
which all of the data is stored in a single file. While this isn't the best for large-scale applications,
it works for small demos. We'll talk about switching this to a different database engine later.
@y
Todo アプリはデフォルトで各種データを`/etc/todos/todo.db`にある [SQLite データベース](https://www.sqlite.org/index.html){:target="_blank" rel="noopener" class="_"} に保存します。
SQLite がよくわからなくても心配無用です。
これは単純なリレーショナルデータベースであって、すべてのデータを 1 つのファイルに保存するものです。
大規模アプリケーションに対して利用するのは適切ではありませんが、ちょっとしたデモであれば十分に動作します。
この後には別のデータベースエンジンに話を移していきます。
@z

@x
With the database being a single file, if we can persist that file on the host and make it available to the
next container, it should be able to pick up where the last one left off. By creating a volume and attaching
(often called "mounting") it to the directory the data is stored in, we can persist the data. As our container 
writes to the `todo.db` file, it will be persisted to the host in the volume.
@y
データベースが 1 つのファイルに収められているので、ホスト上のファイルとして保存しておけば、新たなコンテナーからも利用できます。
したがって最後に更新されたものを、その次にも使い続けられます。
ボリュームを生成して、データを保存するディレクトリに割り当てます（通常これを「マウンティングする」と言い表します）。
こうすればデータを失うことなく保存できます。
今の場合、コンテナーから`todo.db`ファイルへの書き込みを行っているので、ボリュームを通じてホスト上にデータが保持されることになります。
@z

@x
As mentioned, we are going to use a **named volume**. Think of a named volume as simply a bucket of data. 
Docker maintains the physical location on the disk and you only need to remember the name of the volume. 
Every time you use the volume, Docker will make sure the correct data is provided.
@y
先ほど言ったように、これから扱うのは **名前つきボリューム** です。
名前つきボリュームとは、単純にデータが入った 1 つのバケツだと思ってください。
Docker はディスク上の物理的なディレクトリ位置を管理しますが、われわれにとってはボリュームの名前を覚えておくだけで十分です。
ボリュームを使う際には、Docker が適切なデータを提供してくれます。
@z

@x
1. Create a volume by using the `docker volume create` command.
@y
1. `docker volume create`コマンドを実行してボリュームを生成します。
@z

@x
    ```bash
    docker volume create todo-db
    ```
@y
    ```bash
    docker volume create todo-db
    ```
@z

@x
2. Stop and remove the todo app container once again in the Dashboard (or with `docker rm -f <id>`), as it is still running without using the persistent volume.
@y
2. ダッシュボード上から再度 Todo アプリコンテナーを停止させ削除します（あるいは`docker rm -f <id>`を実行します）。
   なぜならデータ保存を行うボリュームを利用しない状態で、アプリコンテナーがまだ実行しているからです。
@z

@x
3. Start the todo app container, but add the `-v` flag to specify a volume mount. We will use the named volume and mount
   it to `/etc/todos`, which will capture all files created at the path.
@y
3. Todo アプリコンテナーを起動します。
   ただし今回は`-v`フラグを使ってボリュームマウントの指定を行います。
   名前つきボリュームを利用し、これを`/etc/todos`にマウントします。
   これによってそのパス上に生成されるファイルをすべてアクセスできるようにします。
@z

@x
    ```bash
    docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
    ```
@y
    ```bash
    docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
    ```
@z

@x
4. Once the container starts up, open the app and add a few items to your todo list.
@y
4. コンテナーが起動したら、アプリを開いて Todo リストに 2、3 のアイテムを追加します。
@z

@x
    ![Items added to todo list](images/items-added.png){: style="width: 55%; " }
    {: .text-center }
@y
    ![Todo リストに追加されたアイテム](images/items-added.png){: style="width: 55%; " }
    {: .text-center }
@z

@x
5. Stop and remove the container for the todo app. Use the Dashboard or `docker ps` to get the ID and then `docker rm -f <id>` to remove it.
@y
5. Todo アプリを実現するコンテナーを停止して削除します。
   それにはダッシュボードを利用するか、あるいは`docker ps`によって ID を得た上で`docker rm -f <id>`を実行します。
@z

@x
6. Start a new container using the same command from above.
@y
6. 新たなコンテナーを起動します。
   実行コマンドは前回と同じです。
@z

@x
7. Open the app. You should see your items still in your list!
@y
7. アプリを開きます。
   登録したアイテムがリスト内に表示されているはずです。
@z

@x
8. Go ahead and remove the container when you're done checking out your list.
@y
8. 先に進めるため、リスト表示を確認したらコンテナーを削除します。
@z

@x
Hooray! You've now learned how to persist data!
@y
やりました。
データ保存の方法がこれでわかりました。
@z

@x
>**Note**
>
>While named volumes and bind mounts (which we'll talk about in a minute) are the two main types of volumes supported
>by a default Docker engine installation, there are many volume driver plugins available to support NFS, SFTP, NetApp, 
>and more! This will be especially important once you start running containers on multiple hosts in a clustered
>environment with Swarm, Kubernetes, etc.
>
@y
>**メモ**
>
>名前つきボリュームとバインドボリューム（これについては後に説明）は、Docker Engine においてデフォルトでサポートされている 2 種類のボリュームです。
>ただしそれ以外にもボリュームドライバープラグインが多数あって、NFS、SFTP、NetApp などに対応しています。
>これが特に重要になってくるのが、複数のホストを利用して Swarm や Kubernetes といったクラスター環境を稼動させる場合です。
@z

@x
## Dive into the volume
@y
{: #dive-into-our-volume }
## ボリュームの詳細
@z

@x
A lot of people frequently ask "Where is Docker _actually_ storing my data when I use a named volume?" If you want to know, 
you can use the `docker volume inspect` command.
@y
多くの方からよくたずねられる質問があります。
「名前つきボリュームを利用したときに Docker は **実際には** どこにデータを保存するのですか。」
これを知りたいなら`docker volume inspect`コマンドを実行してみてください。
@z

@x
```bash
docker volume inspect todo-db
[
    {
        "CreatedAt": "2019-09-26T02:18:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/todo-db/_data",
        "Name": "todo-db",
        "Options": {},
        "Scope": "local"
    }
]
```
@y
```bash
docker volume inspect todo-db
[
    {
        "CreatedAt": "2019-09-26T02:18:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/todo-db/_data",
        "Name": "todo-db",
        "Options": {},
        "Scope": "local"
    }
]
```
@z

@x
The `Mountpoint` is the actual location on the disk where the data is stored. Note that on most machines, you will
need to have root access to access this directory from the host. But, that's where it is!
@y
`Mountpoint`というのが、データが保存されるディスク上の本当の保存場所です。
たいていのマシンにおいては、この場所に対してホストからアクセスするにはルート権限が必要です。
ともあれそういう場所にあるということです。
@z

@x
>**Accessing volume data directly on Docker Desktop**
>
>While running in Docker Desktop, the Docker commands are actually running inside a small VM on your machine.
>If you wanted to look at the actual contents of the Mountpoint directory, you would need to first get inside
>of the VM.
@y
>**Docker Desktop におけるボリュームデータへの直接アクセス**
>
>Docker Desktop の実行中には、Docker コマンドは実際にはマシン上の小さな VM 内部で実行されています。
>したがって Mountpoint ディレクトリの実際の場所を見たい場合には、その VM の内部にまず入ることが必要になります。
@z

@x
## Recap
@y
{: #recap }
## まとめ
@z

@x
At this point, we have a functioning application that can survive restarts! We can show it off to our investors and
hope they can catch our vision!
@y
この時点で、再起動をしても問題のないアプリケーションを動作させました。
お客さんにこれを見せつけて、われわれの構想を理解してもらえるよう願いましょう。
@z

@x
However, we saw earlier that rebuilding images for every change takes quite a bit of time. There's got to be a better
way to make changes, right? With bind mounts (which we hinted at earlier), there is a better way! Let's take a look at that now!
@y
ところで前回までに、変更をかけるたびにイメージを再ビルドするのも、かなりの手間がかかることを見てきました。
変更を加えるもっと良い方法が必要ですよね。
バインドマウントです（上でちょっとだけ話していました）。
これを使えばよいのです。
次にこれを見ていきましょう。
@z
