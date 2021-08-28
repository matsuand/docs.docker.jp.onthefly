%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Build your Node image"
keywords: containers, images, node.js, node, dockerfiles, node, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
redirect_from:
  - /get-started/nodejs/build-images/
---
@y
---
title: "Node イメージのビルド"
keywords: containers, images, node.js, node, dockerfiles, node, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
redirect_from:
  - /get-started/nodejs/build-images/
---
@z

@x
{% include_relative nav.html selected="1" %}
@y
{% include_relative nav.html selected="1" %}
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Work through the orientation and setup in Get started [Part 1](../../get-started/index.md) to understand Docker concepts.
@y
「はじめよう」の [1 部](../../get-started/index.md) に示しているガイドや設定をひととおり読んで、Docker の考え方について理解してください。
@z

@x
{% include guides/enable-buildkit.md %}
@y
{% include guides/enable-buildkit.md %}
@z

@x
## Overview
@y
{: #overview }
## 概要
@z

@x
Now that we have a good overview of containers and the Docker platform, let’s take a look at building our first image. An image includes everything you need to run an application - the code or binary, runtime, dependencies, and any other file system objects required.
@y
ここまでに コンテナーや Docker プラットフォームについての概要を理解してきたので、ここからは初めてのイメージ作りを見ていくことにしましょう。
イメージというものは、アプリケーションを動作させるために必要なものをすべて含みます。
コード、実行モジュール、ランタイム、依存パッケージ、その他にシステムオブジェクトが必要とするあらゆるファイルです。
@z

@x
To complete this tutorial, you need the following:
@y
本チュートリアルを進めていくためには、以下が必要になります。
@z

@x
- Node.js version 12.18 or later. [Download Node.js](https://nodejs.org/en/){: target="_blank" rel="noopener" class="_"}
- Docker running locally: Follow the instructions to [download and install Docker](../../desktop/index.md).
- An IDE or a text editor to edit files. We recommend using Visual Studio Code.
@y
- Node.js バージョン 12.18 またはそれ以降。
  [Node.js](https://nodejs.org/en/){: target="_blank" rel="noopener" class="_"} をダウンロードしてください。
- ローカルで動作している Docker。
  以下の手順に従って [Docker のダウンロードとインストール](../../desktop/index.md) を行ってください。
- ファイル編集を行うための IDE またはテキストエディター。
  ここでは Visual Studio Code をお勧めします。
@z

@x
## Sample application
@y
{: #sample-application }
## サンプルアプリケーション
@z

@x
Let’s create a simple Node.js application that we can use as our example. Create a directory in your local machine named `node-docker` and follow the steps below to create a simple REST API.
@y
例として用いる簡単な Node.js アプリケーションを作っていきます。
ローカルマシン内に`node-docker`という名前のディレクトリを生成し、以下の手順により簡単な REST API を生成します。
@z

@x
```console
$ cd [path to your node-docker directory]
$ npm init -y
$ npm install ronin-server ronin-mocks
$ touch server.js
```
@y
```console
$ cd [各自のnode-dockerディレクトリ]
$ npm init -y
$ npm install ronin-server ronin-mocks
$ touch server.js
```
@z

@x
Now, let’s add some code to handle our REST requests. We’ll use a mock server so we can focus on Dockerizing the application.
@y
そこで REST 要求を行うコードを追加してみます。
簡単なモックサーバーを用いて、アプリケーションの Docker 化を行っていきます。
@z

@x
Open this working directory in your IDE and add the following code into the `server.js` file.
@y
IDE 環境においてワーキングディレクトリを開きます。
そして以下のコードを`server.js`ファイルとして書き込みます。
@z

@x
```js
const ronin = require('ronin-server')
const mocks = require('ronin-mocks')

const server = ronin.server()

server.use('/', mocks.server(server.Router(), false, true))
server.start()
```
@y
```js
const ronin = require('ronin-server')
const mocks = require('ronin-mocks')

const server = ronin.server()

server.use('/', mocks.server(server.Router(), false, true))
server.start()
```
@z

@x
The mocking server is called `Ronin.js` and will listen on port 8000 by default. You can make POST requests to the root (/) endpoint and any JSON structure you send to the server will be saved in memory. You can also send GET requests to the same endpoint and receive an array of JSON objects that you have previously POSTed.
@y
モックサーバーは`Ronin.js`と呼ぶことにして、デフォルトでポート8000 番を待ち受けるものとします。
ルート（/）エンドポイントに対して POST 要求が行えるものとし、サーバーに送信した JSON データは、すべてメモリに保存されるようにします。
同じくルートエンドポイントに GET 要求が送信可能であり、その前に POST 要求した結果を JSON オブジェクトの配列として受信するものとします。
@z

@x
## Test the application
@y
{: #test-the-application }
## アプリケーションのテスト
@z

@x
Let’s start our application and make sure it’s running properly. Open your terminal and navigate to your working directory you created.
@y
ここからアプリケーションを起動させて正しく動作することを確認します。
ターミナルを開いて、上で生成したワーキングディレクトリに移動します。
@z

@x
```console
$ node server.js
```
@y
```console
$ node server.js
```
@z

@x
To test that the application is working properly, we’ll first POST some JSON to the API and then make a GET request to see that the data has been saved. Open a new terminal and run the following curl commands:
@y
アプリケーションが適切に動作していることを確認するため、初めに API に対して JSON データを POST します。
そして GET リクエストを送信して、データがどのように保存されるかを見てみます。
新たなターミナルを開いて、以下の curl コマンドを実行します。
@z

@x
```console
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing" }'
{"code":"success","payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
@y
```console
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing" }'
{"code":"success","payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
@z

@x
$ curl http://localhost:8000/test
{"code":"success","meta":{"total":1,"count":1},"payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
```
@y
$ curl http://localhost:8000/test
{"code":"success","meta":{"total":1,"count":1},"payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
```
@z

@x
Switch back to the terminal where our server is running. You should now see the following requests in the server logs.
@y
サーバーを起動しているターミナルに戻ります。
サーバーログとして以下のようなリクエストが表示されているはずです。
@z

@x
```console
2020-XX-31T16:35:08:4260  INFO: POST /test
2020-XX-31T16:35:21:3560  INFO: GET /test
```
@y
```console
2020-XX-31T16:35:08:4260  INFO: POST /test
2020-XX-31T16:35:21:3560  INFO: GET /test
```
@z

@x
Great! We verified that the application works. At this stage, you've completed testing the server script locally.
@y
すばらしい。
アプリケーションが動作しているのを確認できました。
この時点で、サーバースクリプトの動作テストはローカルで完了したことになります。
@z

@x
Press `CTRL-c` from within the terminal session where the server is running to stop it.
@y
サーバーを稼働させているターミナルセッション内から`CTRL-c`を入力して、サーバーを停止させます。
@z

@x
```console
2021-08-06T12:11:33:8930  INFO: POST /test
2021-08-06T12:11:41:5860  INFO: GET /test
^Cshutting down...
```
@y
```console
2021-08-06T12:11:33:8930  INFO: POST /test
2021-08-06T12:11:41:5860  INFO: GET /test
^Cshutting down...
```
@z

@x
We will now continue to build and run the application in Docker.
@y
Docker 内でのアプリケーションのビルドと実行は、この後も続けます。
@z

@x
## Create a Dockerfile for Node.js
@y
{: #create-a-dockerfile-for-nodejs }
## Node.js を用いた Dockerfile の生成
@z

@x
{% include guides/create-dockerfile.md %}
@y
{% include guides/create-dockerfile.md %}
@z

@x
Next, we need to add a line in our Dockerfile that tells Docker what base image
we would like to use for our application.
@y
Dockerfile にその次に加えるのは、ベースイメージに何を用いるのかを指定します。
そのベースイメージを利用してアプリケーションを構築します。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1

FROM node:12.18.1
```
@y
```dockerfile
# syntax=docker/dockerfile:1

FROM node:12.18.1
```
@z

@x
Docker images can be inherited from other images. Therefore, instead of creating our own base image, we’ll use the official Node.js image that already has all the tools and packages that we need to run a Node.js application. You can think of this in the same way you would think about class inheritance in object oriented programming. For example, if we were able to create Docker images in JavaScript, we might write something like the following.
@y
Docker イメージというものは、別のイメージを継承することができます。
したがって独自のベースイメージを作るのではなく、公式の Node.js イメージを利用することにします。
そのイメージには、Node.js アプリケーションの実行に必要となるツールやパッケージがすでに含まれています。
ここで行った継承は、オブジェクト指向プログラミング言語におけるクラス継承と同じようなものとして考えることができます。
たとえば Docker イメージを JavaScript 言語によってプログラミングできるとしたら、以下のように記述するイメージです。
@z

@x
`class MyImage extends NodeBaseImage {}`
@y
`class MyImage extends NodeBaseImage {}`
@z

@x
This would create a class called `MyImage` that inherited functionality from the base class `NodeBaseImage`.
@y
上は`MyImage`という名のクラスを生成し、それは`NodeBaseImage`というベースクラスから機能性を継承するものです。
@z

@x
In the same way, when we use the `FROM` command, we tell Docker to include in our image all the functionality from the `node:12.18.1` image.
@y
同じようなこととして Docker では`FROM`コマンドを用います。
ここでは`node:12.18.1`というイメージの機能性をすべて含んだイメージとすることを Docker に指示します。
@z

@x
> **Note**
>
> If you want to learn more about creating your own base images, see [Creating base images](../../develop/develop-images/baseimages.md).
@y
> **メモ**
>
> 独自のベースイメージ作りについて学びたい場合は、[ベースイメージの生成](../../develop/develop-images/baseimages.md) を参照してください。
@z

@x
The `NODE_ENV` environment variable specifies the environment in which an application is running (usually, development or production). One of the simplest things you can do to improve performance is to set `NODE_ENV` to `production`.
@y
環境変数`NODE_ENV`はアプリケーションが動作する環境を定義します（通常は development（開発環境） か production（本番環境）です。）。
性能を改善させるために取るべき単純な方法は、この`NODE_ENV`変数を`production`に設定することです。
@z

@x
```dockerfile
ENV NODE_ENV=production
```
@y
```dockerfile
ENV NODE_ENV=production
```
@z

@x
To make things easier when running the rest of our commands, let’s create a working directory. This instructs Docker to use this path as the default location for all subsequent commands. This way we do not have to type out full file paths but can use relative paths based on the working directory.
@y
これ以降のコマンド実行をやりやすくするように、ここでワーキングディレクトリを生成します。
Docker に対してこれを指示しておけば、この後に続くコマンドにおいてデフォルトディレクトリとして用いられます。
これによりファイルのフルパスを記述する必要がなくなり、ワーキングディレクトリからの相対パスを用いることができます。
@z

@x
```dockerfile
WORKDIR /app
```
@y
```dockerfile
WORKDIR /app
```
@z

@x
Usually the very first thing you do once you’ve downloaded a project written in Node.js is to install npm packages. This ensures that your application has all its dependencies installed into the `node_modules` directory where the Node runtime will be able to find them.
@y
通常は Node.js で書かれたプロジェクトのダウンロード後、一番に行っておくことが npm パッケージのインストールです。
これを行っておくとアプリケーションの依存パッケージがすべて`node_modules`ディレクトリ内にインストールされます。
Node ランタイムはそこから必要なパッケージを探し出せるようになります。
@z

@x
Before we can run `npm install`, we need to get our `package.json` and `package-lock.json` files into our images. We use the `COPY` command to do this. The `COPY` command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image. The second parameter tells Docker where you want that file(s) to be copied to. We’ll copy the `package.json` and `package-lock.json` file into our working directory `/app`.
@y
`npm install`を実行する前には、`package.json`と`package-lock.json`の両ファイルをイメージ内にコピーしておくことが必要です。
`COPY`コマンドを使ってこれを行います。
`COPY`コマンドには引数が 2 つあります。
1 つめの引数は、Docker に対してイメージ内にコピーしたい元のファイルを指示します。
2 つめの引数は、Docker に対してそのファイルをイメージ内のどこにコピーするかを指示します。
ここでは`package.json`と`package-lock.json`をワーキングディレクトリ`/app`にコピーします。
@z

@x
```dockerfile
COPY ["package.json", "package-lock.json*", "./"]
```
@y
```dockerfile
COPY ["package.json", "package-lock.json*", "./"]
```
@z

@x
Note that, rather than copying the entire working directory, we are only copying the package.json file. This allows us to take advantage of cached Docker layers.
Once we have our files inside the image, we can use the `RUN` command to execute the command npm install. This works exactly the same as if we were running npm install locally on our machine, but this time these Node modules will be installed into the `node_modules` directory inside our image.
@y
なおここでは、ワーキングディレクトリ全体をコピーするのではなく、package.json ファイルだけをコピーしています。
こうすることで Docker レイヤーのキャッシュをうまく利用するためです。
`package.json`ファイルをイメージ内に置いたら`RUN`コマンドによって npm install を行います。
この際の処理は npm install をマシン内でローカルに実行しているかのようにして動作します。
ただし Node モジュール類のインストール先は、イメージ内の`node_modules`ディレクトリとなります。
@z

@x
```dockerfile
RUN npm install --production
```
@y
```dockerfile
RUN npm install --production
```
@z

@x
At this point, we have an image that is based on node version 12.18.1 and we have installed our dependencies. The next thing we need to do is to add our source code into the image. We’ll use the COPY command just like we did with our `package.json` files above.
@y
ここまでに Node バージョン 12.18.1 に基づくイメージを構築して、依存パッケージのインストールを行いました。
次に行うのは、イメージ内にソースコードを置くことです。
先に行った`package.json`ファイルと同じように COPY コマンドを用いることにします。
@z

@x
```dockerfile
COPY . .
```
@y
```dockerfile
COPY . .
```
@z

@x
The COPY command takes all the files located in the current directory and copies them into the image. Now, all we have to do is to tell Docker what command we want to run when our image is run inside of a container. We do this with the `CMD` command.
@y
この COPY コマンドは、カレントディレクトリにあるファイルすべてをイメージ内にコピーします。
最後に行うのは、このイメージがコンテナー内において実行される際に実行させたいコマンドを指定します。
これを行うには`CMD`コマンドを用います。
@z

@x
```dockerfile
CMD [ "node", "server.js" ]
```
@y
```dockerfile
CMD [ "node", "server.js" ]
```
@z

@x
Here's the complete Dockerfile.
@y
以下が完全な Dockerfile です。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1

FROM node:12.18.1
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

CMD [ "node", "server.js" ]
```
@y
```dockerfile
# syntax=docker/dockerfile:1

FROM node:12.18.1
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

CMD [ "node", "server.js" ]
```
@z

@x
## Create a .dockerignore file
@y
{: #create-a-dockerignore-file }
## .dockerignore ファイルの生成
@z

@x
To use a file in the build context, the Dockerfile refers to the file specified in an instruction, for example, a COPY instruction. To increase the build’s performance, exclude files and directories by adding a .dockerignore file to the context directory. To improve the context load time create a `.dockerignore` file and add `node_modules` directory in it.
@y
ビルドコンテキスト内のファイルを利用するには、たとえば COPY 命令などのように Dockerfile 内の命令においてそのファイルを指定します。
ビルド処理を効率化するためには、不要なファイルやディレクトリは .dockerignore ファイルに指定してコンテキストディレクトリに置きます。
以下は、コンテキストのロード時間を改善するために`.dockerignore`を生成して、そこに`node_modules`ディレクトリを加える例です。
@z

@x
```.dockerignore
node_modules
```
@y
```.dockerignore
node_modules
```
@z

@x
## Build image
@y
{: #build-image }
## イメージのビルド
@z

@x
Now that we’ve created our Dockerfile, let’s build our image. To do this, we use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in the context.
@y
Dockerfile を生成したので、ここからイメージをビルドします。
これを行うには`docker build`コマンドを使います。
`docker build`コマンドは Dockerfile と「コンテキスト（context）」から Docker イメージをビルドします。
ビルドのコンテキストとは、指定されているパスや URL 内にある一連のファイルのことです。
Docker のビルド処理においては、コンテキスト内にあるファイルはどれにでもアクセスすることができます。
@z

@x
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `‘name:tag’`. We’ll leave off the optional “tag” for now to help simplify things. If you do not pass a tag, Docker will use “latest” as its default tag. You’ll see this in the last line of the build output.
@y
build コマンドにはオプションとして`--tag`フラグをつけることができます。
タグ（tag）はイメージ名とオプションとなるタグ名を`‘name:tag’`という書式で指定します。
話を単純にするため、ここでは「タグ」は用いないことにします。
タグを指定しなければ Docker はデフォルトのタグ名として「latest」を用います。
これはビルド処理結果の出力最終行に示されます。
@z

@x
Let’s build our first Docker image.
@y
では初めての Docker イメージをビルドしてみます。
@z

@x
```console
$ docker build --tag node-docker .

[+] Building 93.8s (11/11) FINISHED
 => [internal] load build definition from dockerfile                                          0.1s
 => => transferring dockerfile: 617B                                                          0.0s
 => [internal] load .dockerignore                                                             0.0s
 ...
 => [2/5] WORKDIR /app                                                                        0.4s
 => [3/5] COPY [package.json, package-lock.json*, ./]                                         0.2s
 => [4/5] RUN npm install --production                                                        9.8s
 => [5/5] COPY . .
```
@y
```console
$ docker build --tag node-docker .

[+] Building 93.8s (11/11) FINISHED
 => [internal] load build definition from dockerfile                                          0.1s
 => => transferring dockerfile: 617B                                                          0.0s
 => [internal] load .dockerignore                                                             0.0s
 ...
 => [2/5] WORKDIR /app                                                                        0.4s
 => [3/5] COPY [package.json, package-lock.json*, ./]                                         0.2s
 => [4/5] RUN npm install --production                                                        9.8s
 => [5/5] COPY . .
```
@z

@x
## View local images
@y
{: #view-local-images }
## ローカルイメージの確認
@z

@x
To see a list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use Docker Desktop. Since we are currently working in the terminal let’s take a look at listing images with the CLI.
@y
ローカルマシン内にあるイメージの一覧を見るには 2 つの方法があります。
1 つは CLI を用いる方法、もう 1 つは Docker Desktop を用いる方法です。
これまでターミナルを使って作業を進めてきていますから、イメージ一覧は CLI を使って取得することにします。
@z

@x
To list images, simply run the `images` command.
@y
イメージを一覧表示するには、単純に`images`コマンドを実行します。
@z

@x
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
node-docker         latest              3809733582bc        About a minute ago   945MB
```
@y
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
node-docker         latest              3809733582bc        About a minute ago   945MB
```
@z

@x
Your exact output may vary, but you should see the image we just built `node-docker:latest` with the `latest` tag.
@y
出力結果は上とは異なるはずです。
ただし上でビルドしたものとして、タグ`latest`を持つ`node-docker:latest`は表示されているはずです。
@z

@x
## Tag images
@y
{: #tag-images }
## イメージへのタグづけ
@z

@x
An image name is made up of slash-separated name components. Name components may contain lowercase letters, digits and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@y
イメージ名はスラッシュによって区切られた名称により構成されます。
この名称には、英字の小文字、数字、セパレーター文字が利用可能です。
このセパレーター文字とは、1 つのピリオド、1 つまたは 2 つのアンダースコア、いくつかのダッシュ、のいずれかです。
各名称のはじめと終わりにセパレーター文字を用いることはできません。
@z

@x
An image is made up of a manifest and a list of layers. In simple terms, a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Let’s create a second tag for the image we built and take a look at its layers.
@y
イメージとは、マニフェストと複数レイヤーによって構成されるものです。
単純に言って「タグ」というものは、それらの生成要素の組み合わせを指しています。
イメージに対しては複数のタグを設定できます。
作り上げてきたイメージに対する 2 つめのタグを生成します。
そしてそのレイヤー構成を見てみます。
@z

@x
To create a new tag for the image we built above, run the following command.
@y
イメージに対して新たなタグを生成するには、以下のコマンドを実行します。
@z

@x
```console
$ docker tag node-docker:latest node-docker:v1.0.0
```
@y
```console
$ docker tag node-docker:latest node-docker:v1.0.0
```
@z

@x
The Docker tag command creates a new tag for an image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@y
docker tag コマンドはイメージに対するタグを生成します。
新たなイメージが作り出されるわけではありません。
このタグもまた同じイメージを指していて、イメージを参照するもう 1 つの手段が出来上がったことになります。
@z

@x
Now run the `docker images` command to see a list of our local images.
@y
そこで`docker images`コマンドを実行して、ローカルイメージの一覧を確認します。
@z

@x
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        24 minutes ago      945MB
node-docker         v1.0.0              3809733582bc        24 minutes ago      945MB
```
@y
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        24 minutes ago      945MB
node-docker         v1.0.0              3809733582bc        24 minutes ago      945MB
```
@z

@x
You can see that we have two images that start with `node-docker`. We know they are the same image because if you look at the IMAGE ID column, you can see that the values are the same for the two images.
@y
`node-docker`で始まるイメージが一覧に 2 つ表示されています。
IMAGE ID 列を見てみれば、その 2 つのイメージは同一のものであることがわかります。
2 つのイメージの ID 値は同じだからです。
@z

@x
Let’s remove the tag that we just created. To do this, we’ll use the rmi command. The rmi command stands for “remove image”.
@y
では今生成したタグを削除してみます。
これを行うには rmi コマンドを使います。
rmi コマンドは「remove image」を表しています。
@z

@x
```console
$ docker rmi node-docker:v1.0.0
Untagged: node-docker:v1.0.0
```
@y
```console
$ docker rmi node-docker:v1.0.0
Untagged: node-docker:v1.0.0
```
@z

@x
Notice that the response from Docker tells us that the image has not been removed but only “untagged”. Verify this by running the images command.
@y
Docker の出力結果からわかるように、イメージは削除されたわけではなく「タグづけ解除」が行われただけです。
images コマンドを実行して確認してみます。
@z

@x
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        32 minutes ago      945MB
```
@y
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        32 minutes ago      945MB
```
@z

@x
Our image that was tagged with `:v1.0.0` has been removed but we still have the `node-docker:latest` tag available on our machine.
@y
`:v1.0.0`としてタグづけを行ったイメージは削除されましたが、マシン上には`node-docker:latest`というタグを通じてイメージが参照可能です。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
In this module, we took a look at setting up our example Node application that we will use for the rest of the tutorial. We also created a Dockerfile that we used to build our Docker image. Then, we took a look at tagging our images and removing images. In the next module, we’ll take a look at how to:
@y
本節ではサンプル Node アプリケーションの設定を行いました。
これはこの先のチュートリアルを通じて利用していきます。
また Dockerfile を生成して Docker イメージのビルドに利用しました。
そしてイメージへのタグづけ、タグづけ解除を行いました。
次節では以下のことを行います。
@z

@x
[Run your image as a container](run-containers.md){: .button .primary-btn}
@y
[コンテナーとしてイメージ実行](run-containers.md){: .button .primary-btn}
@z

@x
## Feedback
@y
{: #feedback } 
## フィードバック
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
本トピック改善のためにフィードバックをお寄せください。
お気づきの点があれば [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} の GitHub リポジトリに issue をあげてください。
あるいは [PR の生成](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} により変更の提案を行ってください。
@z

@x
<br />
@y
<br />
@z
