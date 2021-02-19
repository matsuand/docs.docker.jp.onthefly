%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Use containers for development"
keywords: get started, NodeJS, local, development
description: Learn how to develop your application locally.
---
@y
---
title: "開発向けのコンテナー利用"
keywords: get started, NodeJS, local, development
description: Learn how to develop your application locally.
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
{: #prerequisites }
## 前提条件
@z

@x
Work through the steps to build an image and run it as a containerized application in [Run your image as a container](run-containers.md).
@y
[イメージのコンテナーとしての実行](run-containers.md) を通じて、コンテナー化したアプリケーションであるイメージのビルドと実行を行っていること。
@z

@x
## Introduction
@y
{: #introduction }
## はじめに
@z

@x
In this module, we’ll walk through setting up a local development environment for the application we built in the previous modules. We’ll use Docker to build our images and Docker Compose to make everything a whole lot easier.
@y
このチュートリアルでは、その前で作ったアプリケーションの開発環境をローカルに構築する手順を進めていきます。
Docker を使ってイメージをビルドするとともに Docker Compose を使って、あらゆるものを簡単に取り扱っていきます。
@z

@x
## Local Database and Containers
@y
{: #local-database-and-containers }
## ローカルデータベースとコンテナー
@z

@x
First, we’ll take a look at running a database in a container and how we use volumes and networking to persist our data and allow our application to talk with the database. Then we’ll pull everything together into a compose file which will allow us to setup and run a local development environment with one command. Finally, we’ll take a look at connecting a debugger to our application running inside a container.
@y
まずはコンテナー内でデータベースが起動することを確認します。
そしてボリュームやネットワークを通じてデータを保存する方法、アプリケーションがデータベースとアクセスする方法を見ていきます。
これらを 1 つの Compose ファイルにまとめ上げて、ローカル開発環境上においてたった 1 つのコマンドから設定と実行を行うようにします。
最後にデバッガーへの接続を行って、コンテナー内で稼動するアプリケーションの動作を確認します。
@z

@x
Instead of downloading MongoDB, installing, configuring and then running the Mongo database as a service, we can use the Docker Official Image for MongoDB and run it in a container.
@y
MongoDB をダウンロード、インストール、諸設定、サービスとして Mongo データベースの実行、これらは行いません。
MongoDB 用の Docker 公式イメージがあるので、これをコンテナー内で実行します。
@z

@x
Before we run MongoDB in a container, we want to create a couple of volumes that Docker can manage to store our persistent data and configuration. Let's use the managed volumes feature that docker provides instead of using bind mounts. You can read all about volumes in our documentation.
@y
コンテナー内で MongoDB を実行するにあたっては、利用データや設定を保存するためのボリュームをいくつか生成します。
バインドマウントは利用せずに、Docker が提供しているボリューム管理機能を利用します。
ボリュームに関することは本書のいたるところですべて説明しています。
@z

@x
Let’s create our volumes now. We’ll create one for the data and one for configuration of MongoDB.
@y
ボリュームを生成します。
1 つは MongoDB のデータ用、1 つは MongoDB の設定用です。
@z

@x
```shell
$ docker volume create mongodb
$ docker volume create mongodb_config
```
@y
```shell
$ docker volume create mongodb
$ docker volume create mongodb_config
```
@z

@x
Now we’ll create a network that our application and database will use to talk with each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which we can use when creating our connection string.
@y
次にアプリケーションとデータベースが互いにやりとりを行うためのネットワークを生成します。
このネットワークはユーザー定義のブリッジネットワークと呼ばれるもので、接続設定文字列を適切に使えば DNS ルックアップサービスを簡単に提供してくれます。
@z

@x
```shell
$ docker network create mongodb
```
@y
```shell
$ docker network create mongodb
```
@z

@x
Now we can run MongoDB in a container and attach to the volumes and network we created above. Docker will pull the image from Hub and run it for you locally.
@y
MongoDB をコンテナーにおいて実行し、上で生成したボリュームとネットワークを割り当てます。
Docker が Hub からイメージをプルして、ローカルでこれを実行します。
@z

@x
```shell
$ docker run -it --rm -d -v mongodb:/data/db \
  -v mongodb_config:/data/configdb -p 27017:27017 \
  --network mongodb \
  --name mongodb \
  mongo
```
@y
```shell
$ docker run -it --rm -d -v mongodb:/data/db \
  -v mongodb_config:/data/configdb -p 27017:27017 \
  --network mongodb \
  --name mongodb \
  mongo
```
@z

@x
Okay, now that we have a running mongodb, let’s update `server.js` to use a the MongoDB and not an in-memory data store.
@y
さあ、MongoDB を動かすことができました。
そこで`server.js`を書き換えて、データ保存をインメモリでなく MongoDB を用いるようにします。
@z

@x
```javascript
const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
const database  = require( 'ronin-database' )
const server = ronin.server()

database.connect( process.env.CONNECTIONSTRING )
server.use( '/', mocks.server( server.Router(), false, false ) )
server.start()
```
@y
```javascript
const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
const database  = require( 'ronin-database' )
const server = ronin.server()

database.connect( process.env.CONNECTIONSTRING )
server.use( '/', mocks.server( server.Router(), false, false ) )
server.start()
```
@z

@x
We’ve add the ronin-database module and we updated the code to connect to the database and set the in-memory flag to false. We now need to rebuild our image so it contains our changes.
@y
上では ronin-database モジュールを追加し、データベースへの接続コードを変更した上で、インメモリフラグを false にしています。
この変更を反映させるためイメージを再ビルドする必要があります。
@z

@x
First let’s add the ronin-database module to our application using npm.
@y
その前に npm を使ってアプリケーションに ronin-database モジュールを追加します。
@z

@x
```shell
$ npm install ronin-database
```
@y
```shell
$ npm install ronin-database
```
@z

@x
Now we can build our image.
@y
イメージをビルドします。
@z

@x
```shell
$ docker build --tag node-docker .
```
@y
```shell
$ docker build --tag node-docker .
```
@z

@x
Now, let’s run our container. But this time we’ll need to set the `CONNECTIONSTRING` environment variable so our application knows what connection string to use to access the database. We’ll do this right in the `docker run` command.
@y
コンテナーを起動させます。
ただし今回は環境変数`CONNECTIONSTRING`を設定することが必要です。
アプリケーションがどういった接続文字列を使ってデータベースにアクセスするかを伝えるためです。
`docker run`コマンドの実行時にこれを適切に指定します。
@z

@x
```shell
$ docker run \
  -it --rm -d \
  --network mongodb \
  --name rest-server \
  -p 8000:8000 \
  -e CONNECTIONSTRING=mongodb://mongodb:27017/yoda_notes \
  node-docker
```
@y
```shell
$ docker run \
  -it --rm -d \
  --network mongodb \
  --name rest-server \
  -p 8000:8000 \
  -e CONNECTIONSTRING=mongodb://mongodb:27017/yoda_notes \
  node-docker
```
@z

@x
Let’s test that our application is connected to the database and is able to add a note.
@y
アプリケーションがデータベースに接続できること、メモ（note）を追加できることを確認します。
@z

@x
```shell
$ curl --request POST \
  --url http://localhost:8000/notes \
  --header 'content-type: application/json' \
  --data '{
"name": "this is a note",
"text": "this is a note that I wanted to take while I was working on writing a blog post.",
"owner": "peter"
}'
```
@y
```shell
$ curl --request POST \
  --url http://localhost:8000/notes \
  --header 'content-type: application/json' \
  --data '{
"name": "this is a note",
"text": "this is a note that I wanted to take while I was working on writing a blog post.",
"owner": "peter"
}'
```
@z

@x
You should receive the following json back from our service.
@y
サービスからの戻り値として以下のような JSON データを受け取るはずです。
@z

@x
```json
{"code":"success","payload":{"_id":"5efd0a1552cd422b59d4f994","name":"this is a note","text":"this is a note that I wanted to take while I was working on writing a blog post.","owner":"peter","createDate":"2020-07-01T22:11:33.256Z"}}
```
@y
```json
{"code":"success","payload":{"_id":"5efd0a1552cd422b59d4f994","name":"this is a note","text":"this is a note that I wanted to take while I was working on writing a blog post.","owner":"peter","createDate":"2020-07-01T22:11:33.256Z"}}
```
@z

@x
## Use Compose to develop locally
@y
{: #use-compose-to-develop-locally }
## Compose を使ったローカル開発
@z

%@x
%The notes-service project uses MongoDB as its data store. If you remember from Part I of this series, we had to start the Mongo container manually and connect it to the same network that our notes-service is running on. We also had to create a couple of volumes so we could persist our data across restarts of our application and MongoDB.
%@y
%notes-service プロジェクトは、データストアとして MongoDB を利用します。
%本チュートリアルの 1 部からわかるように、Mongo コンテナーは手動で起動して、notes-service が起動している同一のネットワークに接続しなければなりません。
%またボリュームをいくつか生成してデータ保存を行います。
%こうすることでアプリケーションや MongoDB の再起動を行っても、データが失われないようにします。
%@z

@x
In this section, we’ll create a Compose file to start our node-docker and the MongoDB with one command. We’ll also set up the Compose file to start the node-docker in debug mode so that we can connect a debugger to the running node process.
@y
本節では Compose ファイルを生成して node-docker と MongoDB を 1 つのコマンドで起動していきます。
さらに Compose ファイルにおいては node-docker をデバッグモードで起動するように設定して、実行中のノードプロセスにデバッガーから接続します。
@z

@x
Open the notes-service in your IDE or text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the below commands into the file.
@y
IDE またはテキストエディターにより notes-service を開いて、`docker-compose.dev.yml`という新規ファイルを生成します。
そしてそのファイルに以下のコードをコピーペーストしてください。
@z

@x
```yaml
version: '3.8'
@y
```yaml
version: '3.8'
@z

@x
services:
 notes:
  build:
   context: .
  ports:
   - 8080:8080
   - 9229:9229
  environment:
   - SERVER_PORT=8080
   - CONNECTIONSTRING=mongodb://mongo:27017/notes
  volumes:
   - ./:/app
  command: npm run debug
@y
services:
 notes:
  build:
   context: .
  ports:
   - 8080:8080
   - 9229:9229
  environment:
   - SERVER_PORT=8080
   - CONNECTIONSTRING=mongodb://mongo:27017/notes
  volumes:
   - ./:/app
  command: npm run debug
@z

@x
 mongo:
  image: mongo:4.2.8
  ports:
   - 27017:27017
  volumes:
   - mongodb:/data/db
   - mongodb_config:/data/configdb
volumes:
 mongodb:
 mongodb_config:
```
@y
 mongo:
 mongo:
  image: mongo:4.2.8
  ports:
   - 27017:27017
  volumes:
   - mongodb:/data/db
   - mongodb_config:/data/configdb
volumes:
 mongodb:
 mongodb_config:
```
@z

@x
This Compose file is super convenient as we do not have to type all the parameters to pass to the `docker run` command. We can declaratively do that in the Compose file.
@y
この Compose ファイルはとても優れていて、`docker run`コマンドにパラメーターを入力する面倒をなくしてくれます。
Compose ファイル内では、すべてを宣言的に記述していきます。
@z

@x
We are exposing port 9229 so that we can attach a debugger. We are also mapping our local source code into the running container so that we can make changes in our text editor and have those changes picked up in the container.
@y
デバッガーをアタッチできるように、ポート 9229 を公開します。
さらにローカルにあるソースコードを実行中のコンテナーにマッピングして、テキストエディター上でのソース変更を可能とし、さらにその変更をコンテナーが察知できるようにします。
@z

@x
One other really cool feature of using a Compose file, is that we have service resolution set up to use the service names. So we are now able to use `“mongo”` in our connection string. The reason we use mongo is because that is what we have named our mongo service in the Compose file as.
@y
Compose ファイルを利用する際の優れた機能として、サービスの名前を使っただけでサービス指定ができる点が挙げられます。
そこで指定文字として「mongo」を利用します。
mongo という文字を使うのは、Compose ファイルにおいて mongo サービスに対して、そのように命名したからです。
@z

@x
Let’s start our application and confirm that it is running properly.
@y
アプリケーションを起動して、正常に動作することを確認します。
@z

@x
```shell
$ docker-compose -f docker-compose.dev.yml up --build
```
@y
```shell
$ docker-compose -f docker-compose.dev.yml up --build
```
@z

@x
We pass the `--build` flag so Docker will compile our image and then starts it.
@y
ここで`--build`フラグを与えています。
これは Docker がイメージをコンパイルした上で起動するようにします。
@z

@x
If all goes will you should see something similar:
@y
うまく動作すれば、以下と同様に表示されます。
@z

@x
  ![node-compile](images/node-compile.png)
@y
  ![node-compile](images/node-compile.png)
@z

@x
Now let’s test our API endpoint. Run the following curl command:
@y
API エンドポイントをテストしてみます。
以下の curl コマンドを実行してください。
@z

@x
```shell
$ curl --request GET --url http://localhost:8080/services/m/notes
```
@y
```shell
$ curl --request GET --url http://localhost:8080/services/m/notes
```
@z

@x
You should receive the following response:
@y
以下のようなレスポンスが返ってくるはずです。
@z

@x
```json
{"code":"success","meta":{"total":0,"count":0},"payload":[]}
```
@y
```json
{"code":"success","meta":{"total":0,"count":0},"payload":[]}
```
@z

@x
## Connect a debugger
@y
{: #connect-a-debugger }
## デバッガーへの接続
@z

@x
We’ll use the debugger that comes with the Chrome browser. Open Chrome on your machine and then type the following into the address bar.
@y
ここで Chrome ブラウザーに付属しているデバッガーを利用することにします。
マシン上において Chrome ブラウザーを開き、アドレスバーに以下を入力します。
@z

@x
`about:inspect`
@y
`about:inspect`
@z

@x
It opens the following screen.
@y
以下の画面が開きます。
@z

@x
  ![Chrome-inspect](images/chrome-inspect.png)
@y
  ![Chrome-inspect](images/chrome-inspect.png)
@z

@x
Click the **Open dedicated DevTools for Node** link. This opens the DevTools that are connected to the running Node.js process inside our container.
@y
**Open dedicated DevTools for Node**（Node 専用の DevTools を開く）リンクをクリックします。
これにより DevTools が開きます。
このツールは、コンテナー内部で稼動している Node.js プロセスに接続されています。
@z

@x
Let’s change the source code and then set a breakpoint.
@y
ソースコードを変更し、ブレークポイントを設定してみます。
@z

@x
Add the following code to the server.js file on line 19 and save the file.
@y
server.js ファイルの 19 行めに以下のコードを追加して、ファイルを保存します。
@z

@x
```node
 server.use( '/foo', (req, res) => {
   return res.json({ "foo": "bar" })
 })
```
@y
```node
 server.use( '/foo', (req, res) => {
   return res.json({ "foo": "bar" })
 })
```
@z

@x
If you take a look at the terminal where our Compose application is running, you’ll see that nodemon noticed the changes and reloaded our application.
@y
Compose アプリケーションを実行しているターミナルを確認してみると、nodemon が変更を検出して、アプリケーションをリロードしているのがわかります。
@z

@x
 ![nodemon](images/nodemon.png)
@y
 ![nodemon](images/nodemon.png)
@z

@x
Navigate back to the Chrome DevTools and set a breakpoint on line 20 and then run the following curl command to trigger the breakpoint.
@y
Chrome のDevTools 画面に戻って、20 行目にブレークポイントを設定します。
そして以下の curl コマンドを実行してブレークポイントまで進めます。
@z

@x
```shell
$ curl --request GET --url http://localhost:8080/foo
```
@y
```shell
$ curl --request GET --url http://localhost:8080/foo
```
@z

@x
You should have seen the code break on line 20 and now you are able to use the debugger just like you would normally. You can inspect and watch variables, set conditional breakpoints, view stack traces, etc.
@y
コードの 20 行目でブレークされたはずです。
ここから普段使っている方法でデバッガーを操作できるようになります。
変数を詳細に確認しウォッチすることや条件つきブレークポイントの設定、スタックトレースの確認などを行うことができます。
@z

@x
## Conclusion
@y
{: #conclusion }
## まとめ
@z

@x
In this article, we took a look at creating a general development image that we can use pretty much like our normal command line. We also set up our Compose file to map our source code into the running container and exposed the debugging port.
@y
本稿を通じて、汎用的な開発イメージの生成方法を見てきました。
それは普通のコマンドラインから実行することと全く同じことです。
Compose ファイルを生成して、ソースコードを実行コンテナー内にマッピングし、デバッグ用のポート公開も行いました。
@z
