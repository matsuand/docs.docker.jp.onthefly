%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Run your image as a container"
keywords: get started, go, golang, run, container
description: Learn how to run the image as a container.
redirect_from:
- /get-started/golang/run-containers/
---
@y
---
title: "コンテナーとしてのイメージ実行"
keywords: get started, go, golang, run, container
description: Learn how to run the image as a container.
redirect_from:
- /get-started/golang/run-containers/
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
Work through the steps to dockerize a Go application in [Build your Go image](build-images.md).
@y
[Go 言語イメージのビルド](build-images.md) において説明した手順をひととおり行っていること。
@z

@x
## Overview
@y
{: #overview }
## 概要
@z

@x
In the previous module we created a `Dockerfile` for our example application and then we created our Docker image using the command `docker build`. Now that we have the image, we can run that image and see if our application is running correctly.
@y
前節においてはサンプルアプリケーションに対する`Dockerfile`を生成して、`docker build`コマンドによって Docker イメージを生成しました。
イメージのビルドができたので、そのイメージを実行して、アプリケーションが正しく動作することを確認します。
@z

@x
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separate from the host.
@y
コンテナーというものは、オペレーティングシステム内の通常のプロセスにすぎません。
ただしこのプロセスは他から隔離されていて、独自のファイルシステム、独自のネットワークを持ちます。
またホストからは引き離された独自のプロセスツリーを持ちます。
@z

@x
To run an image inside of a container, we use the `docker run` command. It requires one parameter and that is the image name. Let’s start our image and make sure it is running correctly. Execute the following command in your terminal.
@y
コンテナー内においてイメージを実行するには`docker run`コマンドを使います。
このコマンドは 1 つの引数を必要とします。
それはイメージ名です。
ここまでに作り出したイメージを使って、正しく動作することを確認します。
ターミナルから以下のコマンドを実行します。
@z

@x
```console
$ docker run docker-gs-ping
```
@y
```console
$ docker run docker-gs-ping
```
@z

@x
```
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.2.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@y
```
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.2.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@z

@x
When you run this command, you’ll notice that you were not returned to the command prompt. This is because our application is a REST server and will run in a loop waiting for incoming requests without return control back to the OS until we stop the container.
@y
このコマンドを実行しても、コマンドプロンプトの入力状態には戻りません。
この理由は、実行したアプリケーションが REST サーバーであって、入ってくる要求を待ち受けるためのループ内で実行されるからです。
つまり OS へ戻る制御はなく、戻るためにはコンテナーを停止させることになります。
@z

@x
Let’s make a GET request to the server using the curl command.
@y
さてそこで、このサーバーに対して`curl`コマンドを使って`GET`リクエストを行ってみます。
@z

@x
```console
$ curl http://localhost:8080/
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@y
```console
$ curl http://localhost:8080/
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@z

@x
Our curl command failed because the connection to our server was refused. Meaning that we were not able to connect to localhost on port 8080. This is expected because our container is running in isolation which includes networking. Let’s stop the container and restart with port 8080 published on our local network.
@y
上の curl コマンドは、サーバーへの接続が拒否されたために失敗しました。
localhost のポート 8080 には接続できなかったということです。
この動作は期待どおりであって、コンテナーはネットワークも含めて隔離された環境内で実行されているからです。
一度コンテナーを停止させて、今度はローカルネットワーク上にポート 8080 を公開した上で再起動してみます。
@z

@x
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@y
コンテナーを停止するには ctrl-c を入力します。
これによってターミナルのコマンドプロンプトが入力状態に戻ります。
@z

@x
To publish a port for our container, we’ll use the `--publish` flag (`-p` for short) on the docker run command. The format of the `--publish` command is `[host_port]:[container_port]`. So if we wanted to expose port `8080` inside the container to port `3000` outside the container, we would pass `3000:8080` to the `--publish` flag.
@y
コンテナーのポートを公開するには、docker run コマンドにおいて`--publish`フラグ（あるいは`-p`フラグ）を指定します。
`--publish`フラグの書式は`[ホストポート]:[コンテナーポート]`です。
そこでコンテナー内部のポート`8080`をコンテナー外部のポート`3000`として公開するには、`--publish`フラグに`3000:8080`と指定します。
@z

@x
Start the container and expose port `8080` to port `8080` on the host.
@y
コンテナーを起動させ、ポート`8080`をホスト上のポート`8080`として公開します。
@z

@x
```console
$ docker run --publish 8080:8080 docker-gs-ping
```
@y
```console
$ docker run --publish 8080:8080 docker-gs-ping
```
@z

@x
Now let’s rerun the curl command from above.
@y
そこで先ほどの curl コマンドを再度実行してみます。
@z

@x
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
Success! We were able to connect to the application running inside of our container on port 8000. Switch back to the terminal where your container is running and you should see the `GET` request logged to the console.
@y
成功しました。
コンテナー内部で実行されているアプリケーションに対して、ポート 8000 による接続ができました。
コンテナーを実行させたターミナルに戻ってみると、コンソール上に`GET`リクエストのログが出力されているはずです。
@z

@x
Press **ctrl-c** to stop the container.
@y
**ctrl-c** を入力してコンテナーを停止します。
@z

@x
## Run in detached mode
@y
{: #run-in-detached-mode }
## デタッチモード実行
@z

@x
This is great so far, but our sample application is a web server and we should not have to have our terminal connected to the container. Docker can run your container in detached mode, that is in the background. To do this, we can use the `--detach` or `-d` for short. Docker will start your container the same as before but this time will “detach” from the container and return you to the terminal prompt.
@y
ここまではうまくいきました。
もっともこのサンプルアプリケーションはウェブサーバーなので、ターミナルからコンテナーに接続するものではありません。
Docker ではコンテナーをデタッチモード（detached mode）、つまりバックグラウンドで実行することができます。
これを行うには`--detach`フラグ、あるいは短く`-d`フラグを指定します。
Docker は先ほどと同じようにコンテナーを起動させますが、今回はコンテナーから「デタッチされた」つまり切り離されて実行されるので、ターミナルにプロンプトが戻ってきます。
@z

@x
```console
$ docker run -d -p 8080:8080 docker-gs-ping
d75e61fcad1e0c0eca69a3f767be6ba28a66625ce4dc42201a8a323e8313c14e
```
@y
```console
$ docker run -d -p 8080:8080 docker-gs-ping
d75e61fcad1e0c0eca69a3f767be6ba28a66625ce4dc42201a8a323e8313c14e
```
@z

@x
Docker started our container in the background and printed the container ID on the terminal.
@y
Docker はバックグラウンドでコンテナーを起動させ、ターミナル上にそのコンテナー ID を出力します。
@z

@x
Again, let’s make sure that our container is running properly. Run the same `curl` command:
@y
同じようにコンテナーが適切に動作していることを確認します。
前とまったく同じ`curl`コマンドを実行してみます。
@z

@x
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
## List containers
@y
{: #list-containers }
## コンテナーの一覧表示
@z

@x
Since we ran our container in the background, how do we know if our container is running or what other containers are running on our machine? Well, we can run the `docker ps` command. Just like on Linux, to see a list of processes on your machine we would run the `ps` command. In the same spirit, we can run the `docker ps` command which will show us a list of containers running on our machine.
@y
コンテナーをバックグラウンドで実行したので、コンテナーが実行しているかどうか、他にどんなコンテナーがマシン上で動作しているかは、どうやって調べたらよいでしょう。
それは`docker ps`コマンドを使います。
Linux 上であれば、マシン上のプロセス一覧を確認するには`ps`コマンドを実行します。
同じように Docker では`docker ps`を実行します。
このコマンドによって、マシン上で稼働しているコンテナーの一覧が表示されます。
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
```
@y
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
```
@z

@x
The `ps` command tells a bunch of stuff about our running containers. We can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that are exposed, and the name of the container.
@y
`ps`コマンドは実行中コンテナーに関して、いろいろな情報を表示します。
その情報とは以下です。
コンテナー ID、コンテナー内部で実行しているイメージ、コンテナー起動時に用いられた実行コマンド、コンテナー生成時刻、ステータス、公開ポート、コンテナー名です。
@z

@x
You are probably wondering where the name of our container is coming from. Since we didn’t provide a name for the container when we started it, Docker generated a random name. We’ll fix this in a minute but first we need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. You will need to pass the name of the container or you can use the container ID.
@y
コンテナー名はどうやって決まったんだろうと不思議に思うかもしれません。
コンテナーを起動したときにはコンテナー名を指定したわけではないので、Docker がランダムに名前を生成します。
コンテナー名はこの後すぐに変更していきますが、そのためにはまずコンテナーを停止する必要があります。
コンテナーを停止するには`docker stop`コマンドを実行します。
このコマンドはそのとおりにコンテナーを停止させます。
この際にはコンテナー名あるいはコンテナー ID を指定します。
@z

@x
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@y
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@z

@x
Now rerun the `docker ps` command to see a list of running containers.
@y
`docker ps`コマンドをもう一度実行して、実行中コンテナーの一覧を確認します。
@z

@x
```console
$ docker ps

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@y
```console
$ docker ps

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@z

@x
## Stop, start, and name containers
@y
{: #stop-start-and-name-containers }
## コンテナーの停止、起動、名前変更
@z

@x
Docker containers can be started, stopped and restarted. When we stop a container, it is not removed but the status is changed to stopped and the process inside of the container is stopped. When we ran the `docker ps` command, the default output is to only show running containers. If we pass the `--all` or `-a` for short, we will see all containers on our system, that is stopped containers and running containers.
@y
Docker コンテナーは起動させ停止させ、再起動することができます。
コンテナーを停止してもコンテナーが削除されるわけではなく、ステータスが停止となり、コンテナー内のプロセスが停止します。
`docker ps`コマンドを実行したときに、出力されるコンテナーはデフォルトでは実行中コンテナーのみです。
`--all`または`-a`を指定すると、システム上にあるコンテナーすべて、つまり停止、起動にかかわらずすべてが表示されます。
@z

@x
```console
$ docker ps -all
@y
```console
$ docker ps -all
@z

@x
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                      PORTS     NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        About a minute ago   Exited (2) 23 seconds ago             inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 2 minutes ago              wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 3 minutes ago              magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        9 minutes ago        Exited (2) 3 minutes ago              gifted_mestorf
```
@y
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                      PORTS     NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        About a minute ago   Exited (2) 23 seconds ago             inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 2 minutes ago              wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 3 minutes ago              magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        9 minutes ago        Exited (2) 3 minutes ago              gifted_mestorf
```
@z

@x
If you’ve been following along, you should see several containers listed. These are containers that we started and stopped but have not removed yet.
@y
ここまでの手順に沿って作業をしていれば、コンテナーがいくつか出力されたはずです。
このコンテナーはこれまでに起動し停止し、そのまま削除していないものです。
@z

@x
Let’s restart the container that we have just stopped. Locate the name of the container and replace the name of the container below in the restart command:
@y
停止したコンテナーをここで再起動してみましょう。
停止したコンテナーの名前を確認して、再起動を行う以下のコマンドにおけるコンテナー名を書き換えて指定してください。
@z

@x
```console
$ docker restart inspiring_ishizaka
```
@y
```console
$ docker restart inspiring_ishizaka
```
@z

@x
Now, list all the containers again using the `ps` command:
@y
そこで再び`ps`コマンドを使ってコンテナー一覧を確認します。
@z

@x
```console
$ docker ps -a
@y
```console
$ docker ps -a
@z

@x
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                     PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        2 minutes ago    Up 5 seconds               0.0.0.0:8080->8080/tcp   inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 2 minutes ago                            wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 4 minutes ago                            magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        10 minutes ago   Exited (2) 4 minutes ago                            gifted_mestorf
```
@y
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                     PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        2 minutes ago    Up 5 seconds               0.0.0.0:8080->8080/tcp   inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 2 minutes ago                            wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 4 minutes ago                            magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        10 minutes ago   Exited (2) 4 minutes ago                            gifted_mestorf
```
@z

@x
Notice that the container we just restarted has been started in detached mode and has port `8080` exposed. Also, note that the status of the container is “Up X seconds”. When you restart a container, it will be started with the same flags or commands that it was originally started with.
@y
上で再起動したコンテナーはデタッチモードで起動され、ポート`8000`が公開されています。
またコンテナーのステータスを見てみると「Up X seconds」（起動後 X 秒）となっています。
コンテナーを再起動したときには、はじめに起動したときと同じフラグ、同じコマンドによって起動されます。
@z

@x
Let’s stop and remove all of our containers and take a look at fixing the random naming issue.
@y
ではコンテナーすべてを停止して削除します。
そしてランダムな名前になってしまう点を修正していきます。
@z

@x
Stop the container we just started. Find the name of your running container and replace the name in the command below with the name of the container on your system:
@y
起動したばかりのコンテナーを停止させます。
システム上の実行中コンテナーの名前を確認して、以下のコマンドにおけるコンテナー名を書き換えて指定してください。
@z

@x
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@y
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@z

@x
Now that all of our containers are stopped, let’s remove them. When a container is removed, it is no longer running nor is it in the stopped state. Instead, the process inside the container is terminated and the metadata for the container is removed.
@y
こうしてコンテナーはすべて停止したので削除します。
コンテナーを削除するということは、実行することも停止状態にすることもできなくなります。
コンテナー内のプロセスはすでに停止され、コンテナーに対するメタデータも削除されています。
@z

@x
To remove a container, run the `docker rm` command passing the container name. You can pass multiple container names to the command in one command.
@y
コンテナーを削除するには、`docker rm`コマンドにコンテナー名を与えて実行します。
このコマンド 1 つに対して複数のコンテナー名を指定することもできます。
@z

@x
Again, make sure you replace the containers names in the below command with the container names from your system:
@y
同じように、以下のコマンドにおけるコンテナー名を書き換えて指定してください。
@z

@x
```console
$ docker rm inspiring_ishizaka wizardly_joliot magical_carson gifted_mestorf
@y
```console
$ docker rm inspiring_ishizaka wizardly_joliot magical_carson gifted_mestorf
@z

@x
inspiring_ishizaka
wizardly_joliot
magical_carson
gifted_mestorf
```
@y
inspiring_ishizaka
wizardly_joliot
magical_carson
gifted_mestorf
```
@z

@x
Run the `docker ps --all` command again to verify that all containers are gone.
@y
再度`docker ps --all`コマンドを実行し、コンテナーすべてがなくなっていることを確認してください。
@z

@x
Now let’s address the pesky random name issue. Standard practice is to name your containers for the simple reason that it is easier to identify what is running in the container and what application or service it is associated with. Just like good naming conventions for variables in your code makes it simpler to read. So goes naming your containers.
@y
それでは、うっとうしいランダム名を解決します。
コンテナーに名前をつける理由は単純なものです。
どんなコンテナーが実行されているのかがすぐにわかります。
またどんなアプリケーションやサービスが関連づいているのかがわかります。
ソースコード上での変数の命名規則のようにすれば、単純に読みやすくなります。
だからコンテナーの命名も同じようにします。
@z

@x
To name a container, we must pass the `--name` flag to the `run` command:
@y
コンテナー名をつけるには`run`コマンドに`--name`フラグをつけます。
@z

@x
```console
$ docker run -d -p 8080:8080 --name rest-server docker-gs-ping
3bbc6a3102ea368c8b966e1878a5ea9b1fc61187afaac1276c41db22e4b7f48f
```
@y
```console
$ docker run -d -p 8080:8080 --name rest-server docker-gs-ping
3bbc6a3102ea368c8b966e1878a5ea9b1fc61187afaac1276c41db22e4b7f48f
```
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
3bbc6a3102ea   docker-gs-ping   "/docker-gs-ping"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->8080/tcp   rest-server
```
@y
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
3bbc6a3102ea   docker-gs-ping   "/docker-gs-ping"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->8080/tcp   rest-server
```
@z

@x
Now, we can easily identify our container based on the name.
@y
こうしてコンテナーの識別は、名前を使って簡単に行えるようになりました。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
In this module, we learned how to run containers and publish ports. We also learned to manage the lifecycle of containers. We then discussed the importance of naming our containers so that they are more easily identifiable. In the next module, we’ll learn how to run a database in a container and connect it to our application. See:
@y
本節ではコンテナーの実行、ポート公開を行いました。
またコンテナーのライフサイクルを管理する方法も学びました。
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
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Golang %20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
本トピック改善のためにフィードバックをお寄せください。
お気づきの点があれば [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Golang %20docs%20feedback]){:target="_blank" rel="noopener" class="_"} の GitHub リポジトリに issue をあげてください。
あるいは [PR の生成](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} により変更の提案を行ってください。
@z

@x
<br />
@y
<br />
@z
