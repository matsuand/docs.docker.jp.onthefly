%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Run your image as a container"
keywords: get started, Node JS, run, container,
description: Learn how to run the image as a container.
---
@y
---
title: "イメージのコンテナーとしての実行"
keywords: get started, Node JS, run, container,
description: Learn how to run the image as a container.
---
@z

@x
{% include_relative nav.html selected="2" %}
@y
{% include_relative nav.html selected="2" %}
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Work through the steps to build a Node JS image in [Build your Node image](build-images.md).
@y
[Node イメージのビルド](build-images.md) に示した Node JS のビルド手順を行っていること。
@z

@x
## Overview
@y
{: #overview }
## 概要
@z

@x
In the previous module we created our sample application and then we created  a Dockerfile that we used to create an image. We created our image using the command `docker build`. Now that we have an image, we can run that image and see if our application is running correctly.
@y
前のチュートリアルではサンプルアプリケーションを生成し、イメージ生成に利用する Dockerfile を生成しました。
そして`docker build`コマンドを実行してイメージを生成しました。
イメージができあがったので、このイメージを実行しアプリケーションが正しく動作することを確認します。
@z

@x
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separate from the host.
@y
コンテナーとはオペレーティングシステムにおける普通の 1 プロセスです。
ただしそのプロセスは他から分離され、独自のファイルシステム、独自のネットワークを持ち、ホストからは分離したプロセスツリーを持ちます。
@z

@x
To run an image inside of a container, we use the `docker run` command. The `docker run` command requires one parameter and that is the image name. Let’s start our image and make sure it is running correctly. Execute the following command in your terminal.
@y
コンテナー内部においてイメージを実行するには`docker run`コマンドを使います。
`docker run`コマンドには 1 つのパラメーター、つまりイメージ名を指定します。
イメージを起動してこれが正しく動作することを確認します。
ターミナルから以下のコマンドを実行してください。
@z

@x
```shell
$ docker run node-docker
```
@y
```shell
$ docker run node-docker
```
@z

@x
When you run this command, you’ll notice that you were not returned to the command prompt. This is because our application is a REST server and will run in a loop waiting for incoming requests without return control back to the OS until we stop the container.
@y
このコマンドを実行すると、コマンドプロンプトには戻ってこないことがわかります。
こうなる理由は、ここで用いるアプリケーションが REST サーバーであり、受信するリクエストを待つループ処理により実行されるからです。
コンテナーを停止させない限り、制御が OS に戻ることはありません。
@z

@x
Let’s make a GET request to the server using the curl command.
@y
サーバーに GET リクエストを送信する curl コマンドを実行します。
@z

@x
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
curl: (7) Failed to connect to localhost port 8000: Connection refused
```
@y
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
curl: (7) Failed to connect to localhost port 8000: Connection refused
```
@z

@x
Our curl command failed because the connection to our server was refused. Meaning that we were not able to connect to localhost on port 8000. This is expected because our container is run in isolation which includes networking. Let’s stop the container and restart with port 8000 published on our local network.
@y
curl コマンドが失敗する原因は、サーバーへの接続が拒否されたからです。
つまりローカルホストのポート 8000 に接続ができなかったことを意味します。
そうなることはわかっていたことです。
コンテナーは分離された状態で実行されていて、ネットワークに関しても同様だからです。
そこでコンテナーを停止させ、ローカルホスト上にポート 8000 を公開した上で再起動してみます。
@z

@x
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@y
コンテナーの停止には ctrl-c を入力します。
これによりターミナルプロンプトに戻ります。
@z

@x
To publish a port for our container, we’ll use the `--publish` flag (`-p` for short) on the docker run command. The format of the `--publish` command is `[host port]:[container port]`. So if we wanted to expose port 8000 inside the container to port 3000 outside the container, we would pass 3000:8000 to the --publish flag.
@y
コンテナーのポートを公開するには、docker run コマンドにおいて`--publish`フラグ（または短く`-p`）を指定します。
`--publish`の書式は`[ホストポート]:[コンテナーポート]`とします。
そこでコンテナー内部のポート 8000 を、コンテナーの外に対してポート 3000 により公開したい場合は、--publish フラグに 3000:8000 を指定します。
@z

@x
Start the container and expose port 8000 to port 8000 on the host.
@y
コンテナーを起動させ、ここではポート 8000 をホスト上のポート 8000 に公開します。
@z

@x
```shell
$ docker run --publish 8000:8000 node-docker
```
@y
```shell
$ docker run --publish 8000:8000 node-docker
```
@z

@x
Now let’s rerun the curl command from above.
@y
そこで先ほどと同じ curl コマンドを再実行してみます。
@z

@x
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
{"code":"success","payload":[{"msg":"testing","id":"dc0e2c2b-793d-433c-8645-b3a553ea26de","createDate":"2020-09-01T17:36:09.897Z"}]}
```
@y
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
{"code":"success","payload":[{"msg":"testing","id":"dc0e2c2b-793d-433c-8645-b3a553ea26de","createDate":"2020-09-01T17:36:09.897Z"}]}
```
@z

@x
Success! We were able to connect to the application running inside of our container on port 8000. Switch back to the terminal where your container is running and you should see the POST request logged to the console.
@y
成功しました。
コンテナー内部で実行されているアプリケーションに対して、ポート 8000 から接続できたということです。
コンテナーを実行しているターミナルに戻って、画面上に表示された POST リクエストのログを確認してください。
@z

@x
`2020-09-01T17:36:09:8770  INFO: POST /test`
@y
`2020-09-01T17:36:09:8770  INFO: POST /test`
@z

@x
Press ctrl-c to stop the container.
@y
ctrl-c を入力してコンテナーを停止します。
@z

@x
## Run in detached mode
@y
{: #run-in-detached-mode }
## デタッチモードでの実行
@z

@x
This is great so far, but our sample application is a web server and we should not have to have our terminal connected to the container. Docker can run your container in detached mode or in the background. To do this, we can use the `--detach` or `-d` for short. Docker will start your container the same as before but this time will “detach” from the container and return you to the terminal prompt.
@y
ここまでの作業は順調です。
しかしサンプルアプリケーションはウェブサーバーであって、コンテナーに接続したターミナルを操作する必要がありませんでした。
Docker ではコンテナーをデタッチモードにより、つまりバックグラウンドで実行することができます。
これを行うには`--detach`フラグ、あるいは短く`-d`を指定します。
Docker はコンテナー起動を同様に行いますが、ただしこの場合、コンテナーからは「デタッチされている」（切り離されている）ので、ターミナルプロンプトに戻ります。
@z

@x
```shell
$ docker run -d -p 8000:8000 node-docker
ce02b3179f0f10085db9edfccd731101868f58631bdf918ca490ff6fd223a93b
```
@y
```shell
$ docker run -d -p 8000:8000 node-docker
ce02b3179f0f10085db9edfccd731101868f58631bdf918ca490ff6fd223a93b
```
@z

@x
Docker started our container in the background and printed the Container ID on the terminal.
@y
Docker がバックグラウンドでコンテナーを起動した後は、ターミナル上にコンテナー ID が表示されます。
@z

@x
Again, let’s make sure that our container is running properly. Run the same curl command from above.
@y
同じようにコンテナーが適切に動作していることを確認します。
上と同じ curl コマンドを実行します。
@z

@x
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
{"code":"success","payload":[{"msg":"testing","id":"dc0e2c2b-793d-433c-8645-b3a553ea26de","createDate":"2020-09-01T17:36:09.897Z"}]}
```
@y
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
{"code":"success","payload":[{"msg":"testing","id":"dc0e2c2b-793d-433c-8645-b3a553ea26de","createDate":"2020-09-01T17:36:09.897Z"}]}
```
@z

@x
## List containers
@y
{: #list-containers }
## コンテナー一覧
@z

@x
Since we ran our container in the background, how do we know if our container is running or what other containers are running on our machine? Well, we can run the `docker ps` command. Just like on Linux, to see a list of processes on your machine we would run the ps command. In the same spirit, we can run the `docker ps` command which will show us a list of containers running on our machine.
@y
バックグラウンドでコンテナーを実行しました。
ではコンテナーが起動していることや、他にどんなコンテナーが起動しているかは、どうやって確認したらよいでしょう？
答えは`docker ps`コマンドを実行することです。
まさに Linux において、マシン上のプロセス一覧を確認するために ps コマンドを実行することと同じです。
同じ考え方で`docker ps`コマンドを実行し、マシン上において実行しているコンテナーの一覧を確認します。
@z

@x
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
ce02b3179f0f        node-docker         "docker-entrypoint.s…"   6 minutes ago       Up 6 minutes        0.0.0.0:8000->8000/tcp   wonderful_kalam
```
@y
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
ce02b3179f0f        node-docker         "docker-entrypoint.s…"   6 minutes ago       Up 6 minutes        0.0.0.0:8000->8000/tcp   wonderful_kalam
```
@z

@x
The `ps` command tells a bunch of stuff about our running containers. We can see the Container ID, The image running inside the container, the command that was used to start the container, when it was created, the status, ports that exposed and the name of the container.
@y
`ps`コマンドは実行中のコンテナーに関するさまざまな情報を表示します。
その情報の中にはコンテナー ID があります。
さらに、コンテナー内部で実行されているイメージ、コンテナー起動に用いられたコマンド、生成された時刻、ステータス、公開ポート、コンテナー名が見てとれます。
@z

@x
You are probably wondering where the name of our container is coming from. Since we didn’t provide a name for the container when we started it, Docker generated a random name. We’ll fix this in a minute but first we need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. You will need to pass the name of the container or you can use the container id.
@y
コンテナー名はどうやって決まったのかと不思議に思うかもしれません。
コンテナーの起動時にはコンテナー名を指定しませんでした。
その場合 Docker はランダムな名前を生成します。
これはこの後すぐに調整しますが、そのためにはまずコンテナーの停止が必要です。
コンテナーの停止は`docker stop`コマンドを用います。
このコマンドはまさにコンテナーを停止するだけです。
コマンド実行時にはコンテナー名を指定することが必要ですが、コンテナー ID を指定することもできます。
@z

@x
```shell
$ docker stop wonderful_kalam
wonderful_kalam
```
@y
```shell
$ docker stop wonderful_kalam
wonderful_kalam
```
@z

@x
Now rerun the `docker ps` command to see a list of running containers.
@y
もう一度`docker ps`コマンドを実行して、実行中コンテナーの一覧を確認します。
@z

@x
```shell
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
@y
```shell
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
@z

@x
## Stop, start, and name containers
@y
{: #stop-start-and-name-containers }
## コンテナーの停止、起動、名前づけ
@z

@x
Docker containers can be started, stopped and restarted. When we stop a container, it is not removed but the status is changed to stopped and the process inside of the container is stopped. When we ran the `docker ps` command, the default output is to only show running containers. If we pass the `--all` or `-a` for short, we will see all containers on our system whether they are stopped or started.
@y
Docker コンテナーは起動、停止、再起動を行うことができます。
コンテナーを停止しても、コンテナーは削除されず、ステータスが停止というものに変わります。
コンテナー内部のプロセスは停止します。
`docker ps`コマンドを実行したとき、デフォルトで表示されるのは実行中コンテナーのみです。
`--all`フラグあるいは短く`-a`を指定すれば、実行中か停止中に関係なく、システムのすべてのコンテナーが表示されます。
@z

@x
```shell
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
ce02b3179f0f        node-docker         "docker-entrypoint.s…"   16 minutes ago      Exited (0) 5 minutes ago                        wonderful_kalam
ec45285c456d        node-docker         "docker-entrypoint.s…"   28 minutes ago      Exited (0) 20 minutes ago                       agitated_moser
fb7a41809e5d        node-docker         "docker-entrypoint.s…"   37 minutes ago      Exited (0) 36 minutes ago                       goofy_khayyam
```
@y
```shell
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
ce02b3179f0f        node-docker         "docker-entrypoint.s…"   16 minutes ago      Exited (0) 5 minutes ago                        wonderful_kalam
ec45285c456d        node-docker         "docker-entrypoint.s…"   28 minutes ago      Exited (0) 20 minutes ago                       agitated_moser
fb7a41809e5d        node-docker         "docker-entrypoint.s…"   37 minutes ago      Exited (0) 36 minutes ago                       goofy_khayyam
```
@z

@x
If you’ve been following along, you should see several containers listed. These are containers that we started and stopped but have not been removed.
@y
この先に進んでいくにつれて、いろいろなコンテナーが一覧表示されます。
それは起動したり停止したりしたコンテナーであり、削除したものはそこに含まれません。
@z

@x
Let’s restart the container that we just stopped. Locate the name of the container we just stopped and replace the name of the container below in the restart command.
@y
先ほど停止したコンテナーを再起動してみます。
停止した際のコンテナー名を用いて、以下の restart コマンドのコンテナー名を置き換えて実行してください。
@z

@x
```shell
$ docker restart wonderful_kalam
```
@y
```shell
$ docker restart wonderful_kalam
```
@z

@x
Now, list all the containers again using the ps command.
@y
そこで ps コマンドをもう一度実行して、コンテナー一覧を確認します。
@z

@x
```shell
$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                    NAMES
ce02b3179f0f        node-docker         "docker-entrypoint.s…"   19 minutes ago      Up 8 seconds                0.0.0.0:8000->8000/tcp   wonderful_kalam
ec45285c456d        node-docker         "docker-entrypoint.s…"   31 minutes ago      Exited (0) 23 minutes ago                            agitated_moser
fb7a41809e5d        node-docker         "docker-entrypoint.s…"   40 minutes ago      Exited (0) 39 minutes ago                            goofy_khayyam
```
@y
```shell
$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                    NAMES
ce02b3179f0f        node-docker         "docker-entrypoint.s…"   19 minutes ago      Up 8 seconds                0.0.0.0:8000->8000/tcp   wonderful_kalam
ec45285c456d        node-docker         "docker-entrypoint.s…"   31 minutes ago      Exited (0) 23 minutes ago                            agitated_moser
fb7a41809e5d        node-docker         "docker-entrypoint.s…"   40 minutes ago      Exited (0) 39 minutes ago                            goofy_khayyam
```
@z

@x
Notice that the container we just restarted has been started in detached mode and has port 8000 exposed. Also, observe the status of the container is “Up X seconds”. When you restart a container, it will be started with the same flags or commands that it was originally started with.
@y
restart したコンテナーはデタッチモードで起動されていて、ポート 80 が公開されています。
さらにコンテナーのステータス欄を見ると「Up X seconds」となっています。
コンテナーを再起動した場合には、もともと起動されたときと同じフラグやコマンドを使って起動されます。
@z

@x
Let’s stop and remove all of our containers and take a look at fixing the random naming issue.
@y
これまでのコンテナーをすべて停止して削除してみます。
そしてランダムな名称となる問題を調整する作業に入っていきます。
@z

@x
Stop the container we just started. Find the name of your running container and replace the name in the command below with the name of the container on your system.
@y
起動したコンテナーを停止してください。
システム上において実行中のコンテナーの名前を確認して、これを以下のコマンドに与えるコンテナー名として置き換えて実行します。
@z

@x
```shell
$ docker stop wonderful_kalam
wonderful_kalam
```
@y
```shell
$ docker stop wonderful_kalam
wonderful_kalam
```
@z

@x
Now that all of our containers are stopped, let’s remove them. When a container is removed, it is no longer running nor is it in the stopped status. However, the process inside the container has been stopped and the metadata for the container has been removed.
@y
これでコンテナーはすべて停止されたので削除を行います。
コンテナーを削除すると、そこから先、起動中にも停止中にもなりません。
コンテナー内部のプロセスは停止していて、コンテナーに対するメタデータも削除されています。
@z

@x
```shell
$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                    NAMES
ce02b3179f0f        node-docker         "docker-entrypoint.s…"   19 minutes ago      Up 8 seconds                0.0.0.0:8000->8000/tcp   wonderful_kalam
ec45285c456d        node-docker         "docker-entrypoint.s…"   31 minutes ago      Exited (0) 23 minutes ago                            agitated_moser
fb7a41809e5d        node-docker         "docker-entrypoint.s…"   40 minutes ago      Exited (0) 39 minutes ago                            goofy_khayyam
```
@y
```shell
$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                    NAMES
ce02b3179f0f        node-docker         "docker-entrypoint.s…"   19 minutes ago      Up 8 seconds                0.0.0.0:8000->8000/tcp   wonderful_kalam
ec45285c456d        node-docker         "docker-entrypoint.s…"   31 minutes ago      Exited (0) 23 minutes ago                            agitated_moser
fb7a41809e5d        node-docker         "docker-entrypoint.s…"   40 minutes ago      Exited (0) 39 minutes ago                            goofy_khayyam
```
@z

@x
To remove a container, simple run the `docker rm` command passing the container name. You can pass multiple container names to the command in one command.
@y
コンテナーを削除するには、`docker rm`コマンドにコンテナー名を与えて実行します。
複数のコンテナー名を指定して 1 度のコマンドで削除することもできます。
@z

@x
Again, make sure you replace the containers names in the below command with the container names from your system.
@y
再度、以下のコマンドにおいて、コンテナー名をシステム内の実際のコンテナー名に置き換えて実行してください。
@z

@x
```shell
$ docker rm wonderful_kalam agitated_moser goofy_khayyam
wonderful_kalam
agitated_moser
goofy_khayyam
```
@y
```shell
$ docker rm wonderful_kalam agitated_moser goofy_khayyam
wonderful_kalam
agitated_moser
goofy_khayyam
```
@z

@x
Run the `docker ps --all` command again to see that all containers are gone.
@y
`docker ps --all`コマンドを実行して、コンテナーがすべてなくなったことを確認します。
@z

@x
Now let’s address the pesky random name issue. Standard practice is to name your containers for the simple reason that it is easier to identify what is running in the container and what application or service it is associated with. Just like good naming conventions for variables in your code makes it simpler to read. So goes naming your containers.
@y
それではランダムな名称が用いられてしまう面倒な問題に対処していきます。
ごく標準的にはコンテナーに対して名前づけを行います。
これは単純に、コンテナー内で実行されているものが何であるか、どんなアプリケーションやサービスが関連づいているのか、といったことが確認しやすくなるからです。
アプリケーションコードにおいて変数の命名規則のようなものを利用すれば、非常に理解しやすいものになります。
そこでコンテナーへの名前づけを行っていきます。
@z

@x
To name a container, we just need to pass the `--name` flag to the run command.
@y
コンテナーに名前をつけるには run コマンドにおいて`--name`フラグを指定するだけです。
@z

@x
```shell
$ docker run -d -p 8000:8000 --name rest-server node-docker
1aa5d46418a68705c81782a58456a4ccdb56a309cb5e6bd399478d01eaa5cdda
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
1aa5d46418a6        node-docker         "docker-entrypoint.s…"   3 seconds ago       Up 3 seconds        0.0.0.0:8000->8000/tcp   rest-server
```
@y
```shell
$ docker run -d -p 8000:8000 --name rest-server node-docker
1aa5d46418a68705c81782a58456a4ccdb56a309cb5e6bd399478d01eaa5cdda
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
1aa5d46418a6        node-docker         "docker-entrypoint.s…"   3 seconds ago       Up 3 seconds        0.0.0.0:8000->8000/tcp   rest-server
```
@z

@x
Now, we can easily identify our container based on the name.
@y
名前に基づいてコンテナーが簡単に識別できるようになります。
@z

@x
## Conclusion
@y
{: #conclusion }
## まとめ
@z

@x
In this module, we took a look at running containers, publishing ports, and running containers in detached mode. We also took a look at managing containers by starting, stopping, and restarting them. We also looked at naming our containers so they are more easily identifiable.
@y
このチュートリアルでは、コンテナーの実行、ポートの公開、デタッチモードでのコンテナー実行をそれぞれ見てきました。
またコンテナー起動、停止、再起動の制御方法を見ました。
そしてコンテナーへの名前づけを行って、コンテナーの識別がわかりやすくなりました。
@z

@x
In the next module, we’ll take a look at [running a database in a container](develop.md) and connecting it to our application.
@y
次のチュートリアルでは、[コンテナー内でのデータベース実行](develop.md) を行って、アプリケーションにデータベースを接続してみます。
@z
