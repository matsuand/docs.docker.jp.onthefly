%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Build your Node image"
keywords: containers, images, node.js, node, dockerfiles, node, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
---
@y
---
title: "Node イメージのビルド"
keywords: containers, images, node.js, node, dockerfiles, node, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
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
Work through the orientation and setup in Get started [Part 1](../index.md).
@y
はじめよう [1 部](../index.md) の概要と設定をひととおり行っていること。
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
ここまでにコンテナーと Docker プラットフォームについて概要をよく見てきましたので、イメージをはじめてビルドする方法を見ていきます。
イメージというものには、アプリケーションの実行に必要なものすべてが詰まっています。
それはコード、実行バイナリ、ランタイム、依存パッケージ、これ以外にも必要となるファイルシステムオブジェクトとさまざまです。
@z

@x
To complete this tutorial, you need the following:
@y
このチュートリアルを終わりまで進めるには、以下が必要です。
@z

@x
- Node.js version 12.18 or later. [Download Node.js](https://nodejs.org/en/){: target="_blank" rel="noopener" class="_"}
- Docker running locally: Follow the instructions to [download and install Docker](https://docs.docker.com/desktop/).
- An IDE or a text editor to edit files. We recommend using Visual Studio Code.
@y
- Node.js バージョン 12.18 またはそれ以降。
  [Node.js をダウンロード](https://nodejs.org/en/){: target="_blank" rel="noopener" class="_"} してください。
- ローカルに Docker が実行していること。
  [Docker のダウンロードとインストール](https://docs.docker.com/desktop/) の手順に従ってください。
- ファイル編集のための IDE またはテキストエディター。
  ここでは Visual Studio Code の利用をお勧めします。
@z

@x
## Sample application
@y
{: #sample-application }
## サンプルアプリケーション
@z

@x
Let’s create a simple Node.js application that we can use as our example. Create a directory on your local machine named `node-docker` and follow the steps below to create a simple REST API.
@y
利用例として用いる、簡単な Node.js アプリケーションを生成することにします。
ローカルマシン上に`node-docker`というディレクトリを生成し以下の手順を進めることで、単純な REST API を作ります。
@z

@x
```shell
$ cd [path to your node-docker directory]
$ npm init -y
$ npm install ronin-server ronin-mocks
$ touch server.js
```
@y
```shell
$ cd [node-docker ディレクトリのパス]
$ npm init -y
$ npm install ronin-server ronin-mocks
$ touch server.js
```
@z

@x
Now, let’s add some code to handle our REST requests. We’ll use a mock server so we can focus on Dockerizing the application.
@y
REST 要求を扱うコードを書いていきます。
サーバーは簡易なもので済ませて、アプリケーションの Docker 化に集中することにします。
@z

@x
Open this working directory in your IDE and add the following code into the `server.js` file.
@y
IDE 上において上のワーキングディレクトリを開き、`server.js`ファイルに以下のコードを加えます。
@z

@x
```js
const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
@y
```js
const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
@z

@x
const server = ronin.server()
@y
const server = ronin.server()
@z

@x
server.use( '/', mocks.server( server.Router(), false, true ) )
server.start()
```
@y
server.use( '/', mocks.server( server.Router(), false, true ) )
server.start()
```
@z

@x
The mocking server is called `Ronin.js` and will listen on port 8000 by default. You can make POST requests to the root (/) endpoint and any JSON structure you send to the server will be saved in memory. You can also send GET requests to the same endpoint and receive an array of JSON objects that you have previously POSTed.
@y
この簡易サーバーを`Ronin.js`と呼ぶことにします。
これはデフォルトでポート 8000 を待ち受けます。
ルート（/）エンドポイントへの POST リクエストを送信するものとし、サーバーへ送信する JSON データはメモリ上に保存されるものとします。
ルートエンドポイントに GET リクエストも送信して、それ以前に POST した結果を JSON オブジェクト配列として受信します。
@z

@x
## Test application
@y
{: #test-application }
## テストアプリケーション
@z

@x
Let’s start our application and make sure it’s running properly. Open your terminal and navigate to your working directory you created.
@y
アプリケーションを実行して正しく動作することを確認します。
ターミナルを開いて、上で生成したワーキングディレクトリに移動します。
@z

@x
```shell
$ node server.js
```
@y
```shell
$ node server.js
```
@z

@x
To test that the application is working properly, we’ll first POST some JSON to the API and then make a GET request to see that the data has been saved. Open a new terminal and run the following curl commands:
@y
アプリケーションの正常動作を確認するために、まずは API に対して JSON データを POST してみます。
そして GET リクエストを行って、データが保存されていることを確認します。
新たにターミナル画面を開いて、以下の curl コマンドを実行します。
@z

@x
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
{"code":"success","payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
@y
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
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
サーバーが実行されているターミナルに戻ります。
サーバーログとして以下のリクエストが表示されるはずです。
@z

@x
```
2020-XX-31T16:35:08:4260  INFO: POST /test
2020-XX-31T16:35:21:3560  INFO: GET /test
```
@y
```
2020-XX-31T16:35:08:4260  INFO: POST /test
2020-XX-31T16:35:21:3560  INFO: GET /test
```
@z

@x
## Create a Dockerfile for Node.js
@y
{: #create-a-dockerfile-for-nodejs }
## Node.js 用の Dockerfile 生成
@z

@x
A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. When we tell Docker to build our image by executing the `docker build` command, Docker reads these instructions and executes them one by one and creates a Docker image as a result.
@y
Dockerfile はテキストファイルであり、この中にはコマンドライン上で実行するようなコマンドがさまざまに記述され、それがイメージ生成に結びつきます。
Docker に対してイメージ生成の指示を行うために`docker build`コマンドを実行すると、Docker は Dockerfile 内の命令を読み取って、1 つずつ実行していき、結果として Docker イメージを作り出します。
@z

@x
Let’s walk through the process of creating a Dockerfile for our application. In the root of your working directory, create a file named `Dockerfile` and open this file in your text editor.
@y
アプリケーションに対しての Dockerfile を作成する手順を見ていきます。
ワーキングディレクトリのルートにおいて、`Dockerfile`という名前のファイルを生成して、テキストエディター内でこれを開きます。
@z

@x
> **Note**
>
> The name of the Dockerfile is not important but the default filename for many commands is simply `Dockerfile`. So, we’ll use that as our filename throughout this series.
@y
> **メモ**
>
> Dockerfile という名前は重要ではありません。
> ただしデフォルトのファイル名を`Dockerfile`とするコマンドが数多くあります。
> したがってここでの説明では、このファイル名を用いていくことにします。
@z

@x
The first line to add to the Dockerfile is a [`# syntax` parser directive](/engine/reference/builder/#syntax).
While _optional_, this directive instructs the Docker builder what syntax to use
when parsing the Dockerfile, and allows older Docker versions with BuildKit enabled
to upgrade the parser before starting the build. [Parser directives](/engine/reference/builder/#parser-directives)
must appear before any other comment, whitespace, or Dockerfile instruction in
your Dockerfile, should be the first line in Dockerfiles.
@y
Docker ファイルの 1 行めに書くのは [`# syntax`パーサーディレクティブ]({{ site.baseurl }}/engine/reference/builder/#syntax) です。
これは **任意の記述** ではありますが、Dockerfile の解析にあたって Docker ビルダーがどの文法を採用するのかを指示します。
また古い Docker バージョンにおいて BuildKit を利用する際に、ビルド前にパーサーをアップグレードするようになります。
[パーサーディレクティブ]({{ site.baseurl }}/engine/reference/builder/#parser-directives) は Dockerfile において、いずれのコメント、空行、Dockerfile 命令よりも前に、つまり第一に記述することが必要です。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
```
@y
```dockerfile
# syntax=docker/dockerfile:1
```
@z

@x
We recommend using `docker/dockerfile:1`, which always points to the latest release
of the version 1 syntax. BuildKit automatically checks for updates of the syntax
before building, making sure you are using the most current version.
@y
この指定にあたっては`docker/dockerfile:1`とすることを推奨します。
これはバージョン 1 の最新リリースを常に指し示すものです。
BuildKit ではビルド前に文法が更新されているかどうか、利用するバージョンが最新であるかどうかが自動的にチェックされます。
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
Docker イメージは、別のイメージを継承して生成することができます。
したがってここでは独自のベースイメージを作るのでなく、公式の Node.js イメージを用いることにします。
このイメージの中には Node.js アプリケーションの実行に必要となるツールやパッケージがすべて含まれて居ます。
この様子は、オブジェクト指向プログラミングにおけるクラス継承と同じように考えることができます。
もし仮に Docker イメージが JavaScript でプログラミングできるとしたら、以下のような書き方を行うことになります。
@z

@x
`class MyImage extends NodeBaseImage {}`
@y
`class MyImage extends NodeBaseImage {}`
@z

@x
This would create a class called `MyImage` that inherited functionality from the base class `NodeBaseImage`.
@y
ここでは`MyImage`というクラスが生成されて、基底クラス`NodeBaseImage`の機能を継承することになりますｓ。
@z

@x
In the same way, when we use the `FROM` command, we tell Docker to include in our image all the functionality from the `node:12.18.1` image.
@y
同じような話として、上に示した`FROM`コマンドの利用の際には、`node:12.18.1`イメージからすべての機能性を受け継ぐように Docker に指示を出していることになります。
@z

@x
> **Note**
>
> If you want to learn more about creating your own base images, see [Creating base images](https://docs.docker.com/develop/develop-images/baseimages/).
@y
> **メモ**
>
> 独自のベースイメージを生成する方法に関しては、[ベースイメージの生成]({{ site.baseurl }}/develop/develop-images/baseimages/) を参照してください。
@z

@x
The `NODE_ENV` environment variable specifies the environment in which an application is running (usually, development or production). One of the simplest things you can do to improve performance is to set `NODE_ENV` to `production`.
@y
環境変数`NODE_ENV`は、アプリケーションを実行する環境（通常は開発環境(development)か本番環境(production)）を指定します。
性能の改善を図りたいなら、最も単純な話としてこの`NODE_ENV`を`production`に設定すればよいことになります。
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
これ以降のコマンド実行にあたって、作業をしやすくするため、ワーキングディレクトリを生成することにします。
つまりこの後に続くコマンドのデフォルトディレクトリを、特定のパスとすることを Docker に指示します。
こうすればフルパスを記述する必要がなくなり、すべてはワーキングディレクトリからの相対パスとすることができます。
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
Usually the very first thing you do once you’ve downloaded a project written in Node.js is to install npm packages. This will ensure that your application has all its dependencies installed into the `node_modules` directory where the Node runtime will be able to find them.
@y
通常は、Node.js で開発されているプロジェクトをダウンロードした際には、直後に npm パッケージをインストールすることが必要です。
これを行えば、アプリケーションの依存パッケージはすべて`node_modules`ディレクトリにインストールされることになり、Node ランタイムがこれを見つけ出せることになります。
@z

@x
Before we can run `npm install`, we need to get our `package.json` and `package-lock.json` files into our images. We use the `COPY` command to do this. The  `COPY` command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image. The second parameter tells Docker where you want that file(s) to be copied to. We’ll copy the `package.json` and `package-lock.json` file into our working directory `/app`.
@y
`npm install`を実行する前に、イメージ内に`package.json`ファイルと`package-lock.json`ファイルを生成しておくことが必要です。
`COPY`を使ってこれを行います。
`COPY`コマンドは 2 つのパラメーターをとります。
1 つめは、イメージ内にコピーしたいファイルを指定します。
2 つめは、コピー先としたいファイルを指定します。
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
Once we have our `package.json` files inside the image, we can use the `RUN` command to execute the command npm install. This works exactly the same as if we were running npm install locally on our machine, but this time these Node modules will be installed into the `node_modules` directory inside our image.
@y
`package.json`ファイルをイメージ内に置いたら、`RUN`コマンドを使って npm install を実行します。
これはローカルマシン上において npm install を実行することと全く同じです。
ただし今の場合、Node モジュールはイメージ内部にある`node_modules`ディレクトリにインストールされます。
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
利用しているイメージは node バージョン 12.18.1 に基づくものであり、この時点において対応する依存パッケージをインストールしました。
次に行うのは、ソースコードをイメージ内に置くことです。
COPY コマンドを使って、上の`package.json`ファイルのコピーと同様の処理を行います。
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
ここでの COPY コマンドは、カレントディレクトリにあるファイルをすべて、イメージ内にコピーします。
そこで最後になすべきことは、コンテナー内部においてイメージが実行されたときに、どのようなコマンドを実行するかを Docker に指示することです。
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
こうしてできあがった Dockerfile が以下です。
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
## Build image
@y
{: #build-image }
## イメージのビルド
@z

@x
Now that we’ve created our Dockerfile, let’s build our image. To do this, we use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in the context.
@y
Dockerfile が生成できたので、イメージをビルドします。
イメージビルドには`docker build`コマンドを使います。
`docker build`コマンドは Dockerfile から Docker イメージをビルドし、さらに「コンテキスト」をビルドします。
ビルドコンテキストとは、指定されるパスや URL 内にある一連のファイルのことです。
Docker のビルド処理においてコンテキスト内にあるファイルは、すべてアクセスすることができます。
@z

@x
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `‘name:tag’`. We’ll leave off the optional “tag” for now to help simplify things. If you do not pass a tag, Docker will use “latest” as its default tag. You’ll see this in the last line of the build output.
@y
ビルドコマンドでは`--tag`フラグを指定することがあります。
このタグは、イメージ名に対して任意につけるタグというものを、`‘name:tag’`という書式により指定します。
今のところは話を単純にするために、この任意の「タグ」は用いないことにします。
タグを指定しない場合、Docker はデフォルトのタグとして「latest」というものを用います。
このことはビルド処理の出力結果における最終行に示されます。
@z

@x
Let’s build our first Docker image.
@y
でははじめての Docker イメージビルドを行います。
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
```shell
Sending build context to Docker daemon  82.94kB
Step 1/7 : FROM node:12.18.1
---> f5be1883c8e0
Step 2/7 : WORKDIR /code
...
Successfully built e03018e56163
Successfully tagged node-docker:latest
Viewing Local Images
To see a list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use Docker Desktop. Since we are currently working in the terminal let’s take a look at listing images with the CLI.
```
@y
```shell
Sending build context to Docker daemon  82.94kB
Step 1/7 : FROM node:12.18.1
---> f5be1883c8e0
Step 2/7 : WORKDIR /code
...
Successfully built e03018e56163
Successfully tagged node-docker:latest
Viewing Local Images
To see a list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use Docker Desktop. Since we are currently working in the terminal let’s take a look at listing images with the CLI.
```
@z

@x
To list images, simply run the `images` command.
@y
イメージの一覧を確認するには、単純に`images`コマンドを実行します。
@z

@x
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
node-docker         latest              3809733582bc        About a minute ago   945MB
node                12.18.1             f5be1883c8e0        2 months ago         918MB
```
@y
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
node-docker         latest              3809733582bc        About a minute ago   945MB
node                12.18.1             f5be1883c8e0        2 months ago         918MB
```
@z

@x
You should see at least two images listed. One for the base image `node:12.18.1` and the other for our image we just build `node-docker:latest`.
@y
一覧には少なくとも 2 つのイメージがあるはずです。
1 つはベースイメージ`node:12.18.1`に対するものであり、もう 1 つはまさにビルドした`node-docker:latest`イメージに対するものです。
@z

@x
## Tag images
@y
{: #tag-images }
## イメージのタグづけ
@z

@x
An image name is made up of slash-separated name components. Name components may contain lowercase letters, digits and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@y
イメージ名は、スラッシュで区切られた要素により構成されます。
要素に含めることができるのは、英小文字、数字と、区切り文字です。
区切り文字とは、ピリオド、アンダースコア 1 つまたは 2 つ、1つまたは複数のダッシュです。
各要素の先頭をセパレーターで始めることはできません。
@z

@x
An image is made up of a manifest and a list of layers. In simple terms, a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Let’s create a second tag for the image we built and take a look at its layers.
@y
イメージは、マニフェストとレイヤーのリストによって構成されます。
単純に表現すると「タグ」というのは、これらの成果物を組み合わせたものです。
イメージに対しては複数のタグを定めることができます。
そこでイメージに対して 2 つめのタグを作り出して、そのときのレイヤーを見てみることにします。
@z

@x
To create a new tag for the image we built above, run the following command.
@y
これまでにビルドしたイメージに対して新たなタグを生成するには、以下のコマンドを実行します。
@z

@x
```shell
$ docker tag node-docker:latest node-docker:v1.0.0
```
@y
```shell
$ docker tag node-docker:latest node-docker:v1.0.0
```
@z

@x
The Docker tag command creates a new tag for an image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@y
Docker のタグコマンドは、イメージに対して新たなタグを生成します。
これは新たなイメージを生成するものではありません。
タグは同一のイメージを参照するものであり、イメージを別の方法によって参照するものです。
@z

@x
Now run the `docker images` command to see a list of our local images.
@y
ここで`docker images`コマンドを実行して、ローカルイメージの一覧を確認します。
@z

@x
```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        24 minutes ago      945MB
node-docker         v1.0.0              3809733582bc        24 minutes ago      945MB
node                12.18.1             f5be1883c8e0        2 months ago        918MB
```
@y
```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        24 minutes ago      945MB
node-docker         v1.0.0              3809733582bc        24 minutes ago      945MB
node                12.18.1             f5be1883c8e0        2 months ago        918MB
```
@z

@x
You can see that we have two images that start with `node-docker`. We know they are the same image because if you look at the IMAGE ID column, you can see that the values are the same for the two images.
@y
`node-docker`で始まるイメージが 2 つあります。
これらは同一イメージであることがすぐにわかります。
IMAGE ID カラムを見てみれば、この 2 つのイメージに対する値は同一になっています。
@z

@x
Let’s remove the tag that we just created. To do this, we’ll use the rmi command. The rmi command stands for “remove image”.
@y
生成したばかりのタグを削除してみます。
これを行うには rmi コマンドを使います。
rmi は「remove image」（イメージの削除）を意味しています。
@z

@x
```shell
$ docker rmi node-docker:v1.0.0
Untagged: node-docker:v1.0.0
```
@y
```shell
$ docker rmi node-docker:v1.0.0
Untagged: node-docker:v1.0.0
```
@z

@x
Notice that the response from Docker tells us that the image has not been removed but only “untagged”. Verify this by running the images command.
@y
コマンド実行結果からわかることですが、イメージは削除されたわけではなく「untagged」（タグづけが解除）になったということです。
このことを images コマンドを実行して確認します。
@z

@x
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        32 minutes ago      945MB
node                12.18.1             f5be1883c8e0        2 months ago        918MB
```
@y
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        32 minutes ago      945MB
node                12.18.1             f5be1883c8e0        2 months ago        918MB
```
@z

@x
Our image that was tagged with `:v1.0.0` has been removed but we still have the `node-docker:latest` tag available on our machine.
@y
`:v1.0.0`としてタグづけしたイメージは一覧からなくなりました。
しかし`node-docker:latest`タグはまだ残っていて、マシンから利用可能な状態になっています。
@z

@x
## Conclusion
@y
{: #conclusion }
## まとめ
@z

@x
In this module, we took a look at setting up our example Node application that we will use for the rest of the tutorial. We also created a Dockerfile that we used to build our Docker image. Then, we took a look at tagging our images and removing images.
@y
ここで Node アプリケーションの例を設定する方法を見てきました。
これはこの後に続くチュートリアルでも利用していきます。
Docker イメージをビルドするために Dockerfile を生成し、イメージへのタグづけとその解除を行ってみました。
@z

@x
In the next module, we’ll take a look at [running containers](run-containers.md).
@y
次のチュートリアルでは [コンテナーの実行](run-containers.md) について見ていきます。
@z
