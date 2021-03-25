%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Run your image as a container"
keywords: Python, run, image, container,
description: Learn how to run the image as a container.
---
@y
---
title: "コンテナーとしてのイメージ実行"
keywords: Python, run, image, container,
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
Work through the steps to build a Python image in [Build your Python image](build-images.md).
@y
[Python イメージのビルド](build-images.md) の手順により Python イメージをビルドしていること。
@z

@x
## Overview
@y
{: #overview }
## 概要
@z

@x
In the previous module, we created our sample application and then we created a Dockerfile that we used to produce an image. We created our image using the docker command docker build. Now that we have an image, we can run that image and see if our application is running correctly.
@y
前節においてはサンプルアプリケーションを構築し、イメージビルドに利用する Dockerfile を生成しました。
イメージのビルドには`docker build`というコマンドを使いました。
イメージのビルドができたので、そのイメージを実行して、アプリケーションが正しく動作することを確認します。
@z

@x
A container is a normal operating system process except that this process is isolated in that it has its own file system, its own networking, and its own isolated process tree separate from the host.
@y
コンテナーというものは、オペレーティングシステム内の通常のプロセスにすぎません。
ただしこのプロセスは他から隔離されていて、独自のファイルシステム、独自のネットワークを持ちます。
またホストからは引き離された独自のプロセスツリーを持ちます。
@z

@x
To run an image inside of a container, we use the `docker run` command. The `docker run` command requires one parameter which is the name of the image. Let’s start our image and make sure it is running correctly. Run the following command in your terminal.
@y
コンテナー内においてイメージを実行するには`docker run`コマンドを使います。
`docker run`コマンドには 1 つの引数を必要とします。
それはイメージ名です。
ここまでに作り出したイメージを使って、正しく動作することを確認します。
ターミナルから以下のコマンドを実行します。
@z

@x
```shell
$ docker run python-docker
```
@y
```shell
$ docker run python-docker
```
@z

@x
After running this command, you’ll notice that you were not returned to the command prompt. This is because our application is a REST server and runs in a loop waiting for incoming requests without returning control back to the OS until we stop the container.
@y
このコマンドを実行しても、コマンドプロンプトの入力状態には戻りません。
この理由は、実行したアプリケーションが REST サーバーであって、入ってくる要求を待ち受けるためのループ内で実行されるからです。
つまり OS へ戻る制御はなく、戻るためにはコンテナーを停止させることになります。
@z

@x
Let’s open a new terminal then make a `GET` request to the server using the `curl` command.
@y
さてそこで新たなターミナルを開いて、このサーバーに対して`curl`コマンドを使って`GET`リクエストを行ってみます。
@z

@x
```shell
$ curl localhost:5000
curl: (7) Failed to connect to localhost port 5000: Connection refused
```
@y
```shell
$ curl localhost:5000
curl: (7) Failed to connect to localhost port 5000: Connection refused
```
@z

@x
As you can see, our `curl` command failed because the connection to our server was refused. This means, we were not able to connect to the localhost on port 5000. This is expected because our container is run in isolation which includes networking. Let’s stop the container and restart with port 5000 published on our local network.
@y
上の`curl`コマンドは、サーバーへの接続が拒否されたために失敗しました。
localhost のポート 5000 には接続できなかったということです。
この動作は期待どおりであって、コンテナーはネットワークも含めて隔離された環境内で実行されているからです。
一度コンテナーを停止させて、今度はローカルネットワーク上にポート`5000`を公開した上で再起動してみます。
@z

@x
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@y
コンテナーを停止するには Ctrl-C を入力します。
これによってターミナルのコマンドプロンプトが入力状態に戻ります。
@z

@x
To publish a port for our container, we’ll use the `--publish flag` (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host port]:[container port]`. So, if we wanted to expose port 5000 inside the container to port 5000 outside the container, we would pass `3000:5000` to the `--publish` flag.
@y
コンテナーのポートを公開するには、`docker run`コマンドにおいて`--publish`フラグ（あるいは`-p`フラグ）を指定します。
`--publish`フラグの書式は`[ホストポート]:[コンテナーポート]`です。
そこでコンテナー内部のポート 3000 をコンテナー外部のポート 5000 として公開するには、`--publish`フラグに`3000:5000`と指定します。
@z

@x
We did not specify a port when running the flask application in the container and the default is 5000. If we want our previous request going to port 5000 to work we can map the host's port 5000 to the container's port 5000:
@y
コンテナー内の flask アプリケーションの起動にあたっては公開ポートを指定していませんでした。
そこで公開ポートはデフォルトの 5000 となります。
これまでのリクエストをポート 5000 に向けるには、ホストのポート 5000 をコンテナーのポート 5000 に割り当てます。
@z

@x
```shell
$ docker run --publish 5000:5000 python-docker
```
@y
```shell
$ docker run --publish 5000:5000 python-docker
```
@z

@x
Now, let’s rerun the curl command from above. Remember to open a new terminal.
@y
そこで先ほどの curl コマンドを再度実行してみます。
新しいターミナルを開くことを忘れないでください。
@z

@x
```shell
$ curl localhost:5000
Hello, Docker!
```
@y
```shell
$ curl localhost:5000
Hello, Docker!
```
@z

@x
Success! We were able to connect to the application running inside of our container on port 5000. Switch back to the terminal where your container is running and you should see the POST request logged to the console.
@y
成功しました。
コンテナー内部で実行されているアプリケーションに対して、ポート 5000 による接続ができました。
コンテナーを実行させたターミナルに戻ってみると、コンソール上に POST リクエストのログが出力されているはずです。
@z

@x
```shell
[31/Jan/2021 23:39:31] "GET / HTTP/1.1" 200 -
```
@y
```shell
[31/Jan/2021 23:39:31] "GET / HTTP/1.1" 200 -
```
@z

@x
Press ctrl-c to stop the container.
@y
Ctrl-C を入力してコンテナーを停止します。
@z

@x
## Run in detached mode
@y
{: #run-in-detached-mode }
## デタッチモード実行
@z

@x
This is great so far, but our sample application is a web server and we don't have to be connected to the container. Docker can run your container in detached mode or in the background. To do this, we can use the `--detach` or `-d` for short. Docker starts your container the same as before but this time will “detach” from the container and return you to the terminal prompt.
@y
ここまではうまくいきました。
もっともこのサンプルアプリケーションはウェブサーバーなので、ターミナルからコンテナーに接続するものではありません。
Docker ではコンテナーをデタッチモード（detached mode）、つまりバックグラウンドで実行することができます。
これを行うには`--detach`フラグ、あるいは短く`-d`フラグを指定します。
Docker は先ほどと同じようにコンテナーを起動させますが、今回はコンテナーから「デタッチされた」つまり切り離されて実行されるので、ターミナルにプロンプトが戻ってきます。
@z

@x
```shell
$ docker run -d -p 5000:5000 python-docker
ce02b3179f0f10085db9edfccd731101868f58631bdf918ca490ff6fd223a93b
```
@y
```shell
$ docker run -d -p 5000:5000 python-docker
ce02b3179f0f10085db9edfccd731101868f58631bdf918ca490ff6fd223a93b
```
@z

@x
Docker started our container in the background and printed the Container ID on the terminal.
@y
Docker はバックグラウンドでコンテナーを起動させ、ターミナル上にそのコンテナー ID を出力します。
@z

@x
Again, let’s make sure that our container is running properly. Run the same curl command from above.
@y
同じようにコンテナーが適切に動作していることを確認します。
前とまったく同じ curl コマンドを実行してみます。
@z

@x
```shell
$ curl localhost:5000
Hello, Docker!
```
@y
```shell
$ curl localhost:5000
Hello, Docker!
```
@z

@x
## List containers
@y
{: #list-containers }
## コンテナーの一覧表示
@z

@x
Since we ran our container in the background, how do we know if our container is running or what other containers are running on our machine? Well, we can run the `docker ps` command. Just like on Linux to see a list of processes on your machine, we would run the `ps` command. In the same spirit, we can run the `docker ps` command which displays a list of containers running on our machine.
@y
コンテナーをバックグラウンドで実行したので、コンテナーが実行しているかどうか、他にどんなコンテナーがマシン上で動作しているかは、どうやって調べたらよいでしょう。
それは`docker ps`コマンドを使います。
Linux 上であれば、マシン上のプロセス一覧を確認するには`ps`コマンドを実行します。
同じように Docker では`docker ps`を実行します。
このコマンドによって、マシン上で稼働しているコンテナーの一覧が表示されます。
@z

@x
```shell
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
ce02b3179f0f        python-docker         "python3 -m flask ru…"   6 minutes ago       Up 6 minutes        0.0.0.0:5000->5000/tcp   wonderful_kalam
```
@y
```shell
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
ce02b3179f0f        python-docker         "python3 -m flask ru…"   6 minutes ago       Up 6 minutes        0.0.0.0:5000->5000/tcp   wonderful_kalam
```
@z

@x
The `docker ps` command provides a bunch of information about our running containers. We can see the container ID, The image running inside the container, the command that was used to start the container, when it was created, the status, ports that exposed and the name of the container.
@y
`docker ps`コマンドは実行中コンテナーに関して、いろいろな情報を表示します。
その情報とは以下です。
コンテナー ID、コンテナー内部で実行しているイメージ、コンテナー起動時に用いられた実行コマンド、コンテナー生成時刻、ステータス、公開ポート、コンテナー名です。
@z

@x
You are probably wondering where the name of our container is coming from. Since we didn’t provide a name for the container when we started it, Docker generated a random name. We’ll fix this in a minute, but first we need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. You need to pass the name of the container or you can use the container ID.
@y
コンテナー名はどうやって決まったんだろうと不思議に思うかもしれません。
コンテナーを起動したときにはコンテナー名を指定したわけではないので、Docker がランダムに名前を生成します。
コンテナー名はこの後すぐに変更していきますが、そのためにはまずコンテナーを停止する必要があります。
コンテナーを停止するには`docker stop`コマンドを実行します。
このコマンドはそのとおりにコンテナーを停止させます。
この際にはコンテナー名あるいはコンテナー ID を指定します。
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
Now, rerun the `docker ps` command to see a list of running containers.
@y
`docker ps`コマンドをもう一度実行して、実行中コンテナーの一覧を確認します。
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
## コンテナーの停止、起動、名前変更
@z

@x
You can start, stop, and restart Docker containers. When we stop a container, it is not removed, but the status is changed to stopped and the process inside the container is stopped. When we ran the `docker ps` command in the previous module, the default output only shows running containers. When we pass the `--all` or `-a` for short, we see all containers on our machine, irrespective of their start or stop status.
@y
Docker コンテナーは起動させ停止させ、再起動することができます。
コンテナーを停止してもコンテナーが削除されるわけではなく、ステータスが停止となり、コンテナー内のプロセスが停止します。
`docker ps`コマンドを実行したときに、出力されるコンテナーはデフォルトでは実行中コンテナーのみです。
`--all`または`-a`を指定すると、システム上にあるコンテナーすべて、つまり停止、起動にかかわらずすべてが表示されます。
@z

@x
```shell
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
ce02b3179f0f        python-docker         "python3 -m flask ru…"   16 minutes ago      Exited (0) 5 minutes ago                        wonderful_kalam
ec45285c456d        python-docker         "python3 -m flask ru…"   28 minutes ago      Exited (0) 20 minutes ago                       agitated_moser
fb7a41809e5d        python-docker         "python3 -m flask ru…"   37 minutes ago      Exited (0) 36 minutes ago                       goofy_khayyam
```
@y
```shell
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
ce02b3179f0f        python-docker         "python3 -m flask ru…"   16 minutes ago      Exited (0) 5 minutes ago                        wonderful_kalam
ec45285c456d        python-docker         "python3 -m flask ru…"   28 minutes ago      Exited (0) 20 minutes ago                       agitated_moser
fb7a41809e5d        python-docker         "python3 -m flask ru…"   37 minutes ago      Exited (0) 36 minutes ago                       goofy_khayyam
```
@z

@x
You should now see several containers listed. These are containers that we started and stopped but have not been removed.
@y
コンテナーがいくつか出力されたはずです。
このコンテナーはこれまでに起動し停止し、そのまま削除していないものです。
@z

@x
Let’s restart the container that we just stopped. Locate the name of the container we just stopped and replace the name of the container below in the restart command.
@y
停止したコンテナーをここで再起動してみましょう。
停止したコンテナーの名前を確認して、再起動を行う以下のコマンドにおけるコンテナー名を書き換えて指定してください。
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
Now list all the containers again using the `docker ps` command.
@y
そこで再び`docker ps`コマンドを使ってコンテナー一覧を確認します。
@z

@x
```shell
$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                    NAMES
ce02b3179f0f        python-docker         "python3 -m flask ru…"   19 minutes ago      Up 8 seconds                0.0.0.0:5000->5000/tcp   wonderful_kalam
ec45285c456d        python-docker         "python3 -m flask ru…"   31 minutes ago      Exited (0) 23 minutes ago                            agitated_moser
fb7a41809e5d        python-docker         "python3 -m flask ru…"   40 minutes ago      Exited (0) 39 minutes ago                            goofy_khayyam
```
@y
```shell
$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                    NAMES
ce02b3179f0f        python-docker         "python3 -m flask ru…"   19 minutes ago      Up 8 seconds                0.0.0.0:5000->5000/tcp   wonderful_kalam
ec45285c456d        python-docker         "python3 -m flask ru…"   31 minutes ago      Exited (0) 23 minutes ago                            agitated_moser
fb7a41809e5d        python-docker         "python3 -m flask ru…"   40 minutes ago      Exited (0) 39 minutes ago                            goofy_khayyam
```
@z

@x
Notice that the container we just restarted has been started in detached mode and has port 5000 exposed. Also, observe the status of the container is “Up X seconds”. When you restart a container, it starts with the same flags or commands that it was originally started with.
@y
上で再起動したコンテナーはデタッチモードで起動され、ポート 5000 が公開されています。
またコンテナーのステータスを見てみると「Up X seconds」（起動後 X 秒）となっています。
コンテナーを再起動したときには、はじめに起動したときと同じフラグ、同じコマンドによって起動されます。
@z

@x
Now, let’s stop and remove all of our containers and take a look at fixing the random naming issue. Stop the container we just started. Find the name of your running container and replace the name in the command below with the name of the container on your system.
@y
ではコンテナーすべてを停止して削除します。
そしてランダムな名前になってしまう点を修正していきます。
起動したばかりのコンテナーを停止させます。
システム上の実行中コンテナーの名前を確認して、以下のコマンドにおけるコンテナー名を書き換えて指定してください。
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
Now that all of our containers are stopped, let’s remove them. When you remove a container, it is no longer running, nor it is in the stopped status, but the process inside the container has been stopped and the metadata for the container has been removed.
@y
こうしてコンテナーはすべて停止したので削除します。
コンテナーを削除するということは、実行することも停止状態にすることもできなくなります。
コンテナー内のプロセスはすでに停止され、コンテナーに対するメタデータも削除されています。
@z

@x
```shell
$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                    NAMES
ce02b3179f0f        python-docker         "python3 -m flask ru…"   19 minutes ago      Up 8 seconds                0.0.0.0:5000->5000/tcp   wonderful_kalam
ec45285c456d        python-docker         "python3 -m flask ru…"   31 minutes ago      Exited (0) 23 minutes ago                            agitated_moser
fb7a41809e5d        python-docker         "python3 -m flask ru…"   40 minutes ago      Exited (0) 39 minutes ago                            goofy_khayyam
```
@y
```shell
$ docker ps --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                    NAMES
ce02b3179f0f        python-docker         "python3 -m flask ru…"   19 minutes ago      Up 8 seconds                0.0.0.0:5000->5000/tcp   wonderful_kalam
ec45285c456d        python-docker         "python3 -m flask ru…"   31 minutes ago      Exited (0) 23 minutes ago                            agitated_moser
fb7a41809e5d        python-docker         "python3 -m flask ru…"   40 minutes ago      Exited (0) 39 minutes ago                            goofy_khayyam
```
@z

@x
To remove a container, simple run the `docker rm` command passing the container name. You can pass multiple container names to the command using a single command. Again, replace the container names in the following command with the container names from your system.
@y
コンテナーを削除するには、`docker rm`コマンドにコンテナー名を与えて実行します。
このコマンド 1 つに対して複数のコンテナー名を指定することもできます。
同じように、以下のコマンドにおけるコンテナー名を書き換えて指定してください。
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
Run the `docker ps --all` command again to see that all containers are removed.
@y
再度`docker ps --all`コマンドを実行し、コンテナーすべてがなくなっていることを確認してください。
@z

@x
Now, let’s address the random naming issue. Standard practice is to name your containers for the simple reason that it is easier to identify what is running in the container and what application or service it is associated with.
@y
それではランダム名となる点を解決します。
コンテナーに名前をつける理由は単純なものです。
どんなコンテナーが実行されているのかがすぐにわかります。
またどんなアプリケーションやサービスが関連づいているのかがわかります。
@z

@x
To name a container, we just need to pass the `--name` flag to the `docker run` command.
@y
コンテナー名をつけるには`docker run`コマンドに`--name`フラグをつけます。
@z

@x
```shell
$ docker run -d -p 5000:5000 --name rest-server python-docker
1aa5d46418a68705c81782a58456a4ccdb56a309cb5e6bd399478d01eaa5cdda
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
1aa5d46418a6        python-docker         "python3 -m flask ru…"   3 seconds ago       Up 3 seconds        0.0.0.0:5000->5000/tcp   rest-server
```
@y
```shell
$ docker run -d -p 5000:5000 --name rest-server python-docker
1aa5d46418a68705c81782a58456a4ccdb56a309cb5e6bd399478d01eaa5cdda
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
1aa5d46418a6        python-docker         "python3 -m flask ru…"   3 seconds ago       Up 3 seconds        0.0.0.0:5000->5000/tcp   rest-server
```
@z

@x
That’s better! We can now easily identify our container based on the name.
@y
わかりやすくなりました。
こうしてコンテナーの識別は、名前を使って簡単に行えます。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
In this module, we took a look at running containers, publishing ports, and running containers in detached mode. We also took a look at managing containers by starting, stopping, and, restarting them. We also looked at naming our containers so they are more easily identifiable. In the next module, we’ll learn how to run a database in a container and connect it to our application. See:
@y
本節ではコンテナーの実行、ポート公開、デタッチモードでの実行を行いました。
またコンテナーの起動、停止、再起動という制御を行いました。
そしてコンテナーに名前づけを行って、識別しやすくしました。
次節ではコンテナー内においてデータベースを実行して、アプリケーションを接続する方法を示します。
以下を参照してください。
@z

@x
[How to develop your application](develop.md){: .button .outline-btn}
@y
[アプリケーションの開発方法](develop.md){: .button .outline-btn}
@z

@x
## Feedback
@y
{: #feedback } 
## フィードバック
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Python%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
本トピック改善のためにフィードバックをお寄せください。
お気づきの点があれば [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Python%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} の GitHub リポジトリに issue をあげてください。
あるいは [PR の生成](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} により変更の提案を行ってください。
@z

@x
<br />
@y
<br />
@z
