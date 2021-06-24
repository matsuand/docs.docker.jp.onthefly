%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Build your Python image"
keywords: python, build, images, dockerfile
description: Learn how to build your first Docker image by writing a Dockerfile
---
@y
---
title: "Python イメージのビルド"
keywords: python, build, images, dockerfile
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
Work through the orientation and setup in Get started [Part 1](../../get-started/index.md) to understand Docker concepts.
@y
「はじめよう」の [1 部](../../get-started/index.md) に示しているガイドや設定をひととおり読んで、Docker の考え方について理解してください。
@z

@x
## Overview
@y
{: #overview }
## 概要
@z

@x
Now that we have a good overview of containers and the Docker platform, let’s take a look at building our first image. An image includes everything needed to run an application - the code or binary, runtime, dependencies, and any other file system objects required.
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
- Python version 3.8 or later. [Download Python](https://www.python.org/downloads/){: target="_blank" rel="noopener" class="_"}
- Docker running locally. Follow the instructions to [download and install Docker](../../desktop/index.md)
- An IDE or a text editor to edit files. We recommend using [Visual Studio Code](https://code.visualstudio.com/Download){: target="_blank" rel="noopener" class="_"}.
@y
- Python バージョン 3.8 またはそれ以降。
  [Python](https://www.python.org/downloads/){: target="_blank" rel="noopener" class="_"} をダウンロードしてください。
- ローカルで動作している Docker。
  以下の手順に従って [Docker のダウンロードとインストール](../../desktop/index.md) を行ってください。
- ファイル編集を行うための IDE またはテキストエディター。
  ここでは [Visual Studio Code](https://code.visualstudio.com/Download){: target="_blank" rel="noopener" class="_"} をお勧めします。
@z

@x
## Sample application
@y
{: #sample-application }
## サンプルアプリケーション
@z

@x
Let’s create a simple Python application using the Flask framework that we’ll use as our example. Create a directory in your local machine named `python-docker` and follow the steps below to create a simple web server.
@y
例として用いる簡単な Python アプリケーションを作っていきます。
これは Flask フレームワークを利用します。
ローカルマシン内に`python-docker`という名前のディレクトリを生成し、以下の手順により簡単なウェブサーバーを生成します。
@z

@x
```shell
$ cd /path/to/python-docker
$ pip3 install Flask
$ pip3 freeze > requirements.txt
$ touch app.py
```
@y
```shell
$ cd /path/to/python-docker
$ pip3 install Flask
$ pip3 freeze > requirements.txt
$ touch app.py
```
@z

@x
Now, let’s add some code to handle simple web requests. Open this working directory in your favorite IDE and enter the following code into the `app.py` file.
@y
そこで簡単なウェブリクエストを扱うコードを追加してみます。
好みの IDE 内においてワーキングディレクトリを開いて、`app.py`ファイルに以下のコードを記述します。
@z

@x
```shell
from flask import Flask
app = Flask(__name__)
@y
```shell
from flask import Flask
app = Flask(__name__)
@z

@x
@app.route('/')
def hello_world():
    return 'Hello, Docker!'
```
@y
@app.route('/')
def hello_world():
    return 'Hello, Docker!'
```
@z

@x
## Test the application
@y
{: #test-the-application }
## アプリケーションのテスト
@z

@x
Let’s start our application and make sure it’s running properly. Open your terminal and navigate to the working directory you created.
@y
ここからアプリケーションを起動させて正しく動作することを確認します。
ターミナルを開いて、上で生成したワーキングディレクトリに移動します。
@z

@x
```shell
$ python3 -m flask run
```
@y
```shell
$ python3 -m flask run
```
@z

@x
To test that the application is working properly, open a new browser and navigate to `http://localhost:5000`.
@y
アプリケーションが適切に動作していることを確認するために、ブラウザーを開いて`http://localhost:5000`にアクセスします。
@z

@x
Switch back to the terminal where our server is running and you should see the following requests in the server logs. The data and timestamp will be different on your machine.
@y
サーバーを起動しているターミナルに戻ります。
サーバーログとして以下のようなリクエストが表示されているはずです。
起動したマシンごとに、データ内容やタイムスタンプは異なります。
@z

@x
```shell
127.0.0.1 - - [22/Sep/2020 11:07:41] "GET / HTTP/1.1" 200 -
```
@y
```shell
127.0.0.1 - - [22/Sep/2020 11:07:41] "GET / HTTP/1.1" 200 -
```
@z

@x
## Create a Dockerfile for Python
@y
{: #create-a-dockerfile-for-python }
## Python を用いた Dockerfile の生成
@z

@x
Now that our application is running properly, let’s take a look at creating a Dockerfile.
@y
アプリケーションが正しく動作しているので、ここからは Dockerfile の生成を行っていきます。
@z

@x
A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. When we tell Docker to build our image by executing the `docker build` command, Docker reads these instructions, executes them consecutively, and creates a Docker image as a result.
@y
Dockerfile はテキストファイルであり、コマンドラインから実行するイメージ生成コマンドを記述したようなものです。
Docker に対して`docker build`コマンドを実行してイメージビルドを指示すると、Docker は記述された命令を読み込んで 1 つずつそれを実行し、最終的に Docker イメージを作り出します。
@z

@x
Let’s walk through creating a Dockerfile for our application. In the root of your working directory, create a file named `Dockerfile` and open this file in your text editor.
@y
ではアプリケーション向けに Dockerfile を生成していく手順を見ていきます。
ワーキングディレクトリのルートに`Dockerfile`という名前のファイルを生成して、テキストエディターでこれを開きます。
@z

@x
> **Note**
>
> The name of the Dockerfile is not important but the default filename for many commands is simply `Dockerfile`. Therefore, we’ll use that as our filename throughout this series.
@y
> **メモ**
>
> Dockerfile という名前はさして重要ではありません。
> ただし各種コマンドが扱うデフォルト名が`Dockerfile`となっています。
> したがってここではこのファイル名を用いていくことにします。
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

FROM python:3.8-slim-buster
```
@y
```dockerfile
# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
```
@z

@x
Docker images can be inherited from other images. Therefore, instead of creating our own base image, we’ll use the official Python image that already has all the tools and packages that we need to run a Python application.
@y
Docker イメージというものは、別のイメージを継承することができます。
したがって独自のベースイメージを作るのではなく、公式の Python イメージを利用することにします。
そのイメージには、Python アプリケーションの実行に必要となるツールやパッケージがすでに含まれています。
@z

@x
> **Note**
>
> To learn more about creating your own base images, see [Creating base images](https://docs.docker.com/develop/develop-images/baseimages/).
@y
> **メモ**
>
> 独自のベースイメージ作りについて学びたい場合は、[ベースイメージの生成](https://docs.docker.com/develop/develop-images/baseimages/) を参照してください。
@z

@x
To make things easier when running the rest of our commands, let’s create a working directory. This instructs Docker to use this path as the default location for all subsequent commands. By doing this, we do not have to type out full file paths but can use relative paths based on the working directory.
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
Usually, the very first thing you do once you’ve downloaded a project written in Python is to install `pip` packages. This ensures that your application has all its dependencies installed.
@y
通常は Python で書かれたプロジェクトのダウンロード後、一番に行っておくことが`pip`パッケージのインストールです。
これを行っておくとアプリケーションの依存パッケージがすべてインストールされます。
@z

@x
Before we can run `pip3 install`, we need to get our `requirements.txt` file into our image. We’ll use the `COPY` command to do this. The `COPY` command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image. The second parameter tells Docker where you want that file(s) to be copied to. We’ll copy the `requirements.txt` file into our working directory `/app`.
@y
`pip install`を実行する前には、`requirements.txt`ファイルをイメージ内にコピーしておくことが必要です。
`COPY`コマンドを使ってこれを行います。
`COPY`コマンドには引数が 2 つあります。
1 つめの引数は、Docker に対してイメージ内にコピーしたい元のファイルを指示します。
2 つめの引数は、Docker に対してそのファイルをイメージ内のどこにコピーするかを指示します。
ここでは`requirements.txt`をワーキングディレクトリ`/app`にコピーします。
@z

@x
```dockerfile
COPY requirements.txt requirements.txt
```
@y
```dockerfile
COPY requirements.txt requirements.txt
```
@z

@x
Once we have our `requirements.txt` file inside the image, we can use the `RUN` command to execute the command `pip3 install`. This works exactly the same as if we were running `pip3 install` locally on our machine, but this time the modules are installed into the image.
@y
`requirements.txt`ファイルをイメージ内に置いたら`RUN`コマンドによって`pip3 install`を行います。
この際の処理は`pip3 install`をマシン内でローカルに実行しているかのようにして動作します。
ただしこのときの Python モジュール類はイメージ内にインストールされます。
@z

@x
```dockerfile
RUN pip3 install -r requirements.txt
```
@y
```dockerfile
RUN pip3 install -r requirements.txt
```
@z

@x
At this point, we have an image that is based on Python version 3.8 and we have installed our dependencies. The next step is to add our source code into the image. We’ll use the `COPY` command just like we did with our `requirements.txt` file above.
@y
ここまでに Python バージョン 3.8 に基づくイメージを構築して、依存パッケージのインストールを行いました。
次に行うのは、イメージ内にソースコードを置くことです。
先に行った`requirements.txt`ファイルと同じように`COPY`コマンドを用いることにします。
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
This `COPY` command takes all the files located in the current directory and copies them into the image. Now, all we have to do is to tell Docker what command we want to run when our image is executed inside a container. We do this using the `CMD` command. Note that we need to make the application externally visible (i.e. from outside the container) by specifying `--host=0.0.0.0`.
@y
この`COPY`コマンドは、カレントディレクトリにあるファイルすべてをイメージ内にコピーします。
最後に行うのは、このイメージがコンテナー内において実行される際に実行させたいコマンドを指定します。
これを行うには`CMD`コマンドを用います。
なおここでアプリケーションは外部から（つまりコンテナーの外から）アクセスできるようにすることが必要であるため、`--host=0.0.0.0`を指定します。
@z

@x
```dockerfile
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
```
@y
```dockerfile
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
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

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
```
@y
```dockerfile
# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
```
@z

@x
### Directory structure
@y
{: #directory-structure }
### ディレクトリ構造
@z

@x
Just to recap, we created a directory in our local machine called `python-docker` and created a simple Python application using the Flask framework. We also used the `requirements.txt` file to gather our requirements, and created a Dockerfile containing the commands to build an image. The Python application directory structure would now look like:
@y
ここまでの作業をまとめてみると、ローカルマシン内に`python-docker`というディレクトリを生成して、Flask フレームワークを利用した簡単な Python アプリケーションを生成しました。
また`requirements.txt`ファイルを利用して依存パッケージを取得し、またイメージビルドのためのコマンドを記述した Dokerfile を生成しました。
Python アプリケーションディレクトリは以下のような構造となります。
@z

@x
```shell
python-docker
|____ app.py
|____ requirements.txt
|____ Dockerfile
```
@y
```shell
python-docker
|____ app.py
|____ requirements.txt
|____ Dockerfile
```
@z

@x
## Build an image
@y
{: #build-image }
## イメージのビルド
@z

@x
Now that we’ve created our Dockerfile, let’s build our image. To do this, we use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in this context.
@y
Dockerfile を生成したので、ここからイメージをビルドします。
これを行うには`docker build`コマンドを使います。
`docker build`コマンドは Dockerfile と「コンテキスト（context）」から Docker イメージをビルドします。
ビルドのコンテキストとは、指定されているパスや URL 内にある一連のファイルのことです。
Docker のビルド処理においては、コンテキスト内にあるファイルはどれにでもアクセスすることができます。
@z

@x
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `name:tag`. We’ll leave off the optional `tag` for now to help simplify things. If you do not pass a tag, Docker uses “latest” as its default tag. You can see this in the last line of the build output.
@y
build コマンドにはオプションとして`--tag`フラグをつけることができます。
タグ（tag）はイメージ名とオプションとなるタグ名を`name:tag`という書式で指定します。
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
```shell
$ docker build --tag python-docker .
[+] Building 2.7s (10/10) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 203B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load metadata for docker.io/library/python:3.8-slim-buster
 => [1/6] FROM docker.io/library/python:3.8-slim-buster
 => [internal] load build context
 => => transferring context: 953B
 => CACHED [2/6] WORKDIR /app
 => [3/6] COPY requirements.txt requirements.txt
 => [4/6] RUN pip3 install -r requirements.txt
 => [5/6] COPY . .
 => [6/6] CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0"]
 => exporting to image
 => => exporting layers
 => => writing image sha256:8cae92a8fbd6d091ce687b71b31252056944b09760438905b726625831564c4c
 => => naming to docker.io/library/python-docker
```
@y
```shell
$ docker build --tag python-docker .
[+] Building 2.7s (10/10) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 203B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load metadata for docker.io/library/python:3.8-slim-buster
 => [1/6] FROM docker.io/library/python:3.8-slim-buster
 => [internal] load build context
 => => transferring context: 953B
 => CACHED [2/6] WORKDIR /app
 => [3/6] COPY requirements.txt requirements.txt
 => [4/6] RUN pip3 install -r requirements.txt
 => [5/6] COPY . .
 => [6/6] CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0"]
 => exporting to image
 => => exporting layers
 => => writing image sha256:8cae92a8fbd6d091ce687b71b31252056944b09760438905b726625831564c4c
 => => naming to docker.io/library/python-docker
```
@z

@x
## View local images
@y
{: #view-local-images }
## ローカルイメージの確認
@z

@x
To see a list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use [Docker Desktop](../../desktop/dashboard.md#explore-your-images). As we are currently working in the terminal let’s take a look at listing images using the CLI.
@y
ローカルマシン内にあるイメージの一覧を見るには 2 つの方法があります。
1 つは CLI を用いる方法、もう 1 つは [Docker Desktop](../../desktop/dashboard.md#explore-your-images) を用いる方法です。
これまでターミナルを使って作業を進めてきていますから、イメージ一覧は CLI を使って取得することにします。
@z

@x
To list images, simply run the `docker images` command.
@y
イメージを一覧表示するには、単純に`docker images`コマンドを実行します。
@z

@x
```shell
$ docker images
REPOSITORY      TAG               IMAGE ID       CREATED         SIZE
python-docker   latest            8cae92a8fbd6   3 minutes ago   123MB
python          3.8-slim-buster   be5d294735c6   9 days ago      113MB
```
@y
```shell
$ docker images
REPOSITORY      TAG               IMAGE ID       CREATED         SIZE
python-docker   latest            8cae92a8fbd6   3 minutes ago   123MB
python          3.8-slim-buster   be5d294735c6   9 days ago      113MB
```
@z

@x
You should see at least two images listed. One for the base image `3.8-slim-buster` and the other for the image we just built `python-docker:latest`.
@y
一覧には少なくとも 2 つのイメージが表示されるはずです。
1 つはベースイメージ`3.8-slim-buster`であり、もう 1 つは`python-docker:latest`としてビルドしたイメージです。
@z

@x
## Tag images
@y
{: #tag-images }
## イメージへのタグづけ
@z

@x
As mentioned earlier, an image name is made up of slash-separated name components. Name components may contain lowercase letters, digits and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@y
イメージ名はスラッシュによって区切られた名称により構成されます。
この名称には、英字の小文字、数字、セパレーター文字が利用可能です。
このセパレーター文字とは、1 つのピリオド、1 つまたは 2 つのアンダースコア、いくつかのダッシュ、のいずれかです。
各名称のはじめと終わりにセパレーター文字を用いることはできません。
@z

@x
An image is made up of a manifest and a list of layers. Do not worry too much about manifests and layers at this point other than a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Let’s create a second tag for the image we built and take a look at its layers.
@y
イメージとは、マニフェストと複数レイヤーによって構成されるものです。
マニフェストとレイヤーに関しては、この時点で深く気にとめておく必要はありません。
「タグ」によってこういった構成要素が結び合わせれている、と捉えておくだけで十分です。
イメージに対しては複数のタグを設定できます。
作り上げてきたイメージに対する 2 つめのタグを生成します。
そしてそのレイヤー構成を見てみます。
@z

@x
To create a new tag for the image we’ve built above, run the following command.
@y
イメージに対して新たなタグを生成するには、以下のコマンドを実行します。
@z

@x
```shell
$ docker tag python-docker:latest python-docker:v1.0.0
```
@y
```shell
$ docker tag python-docker:latest python-docker:v1.0.0
```
@z

@x
The `docker tag` command creates a new tag for an image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@y
`docker tag`コマンドはイメージに対するタグを生成します。
新たなイメージが作り出されるわけではありません。
このタグもまた同じイメージを指していて、イメージを参照するもう 1 つの手段が出来上がったことになります。
@z

@x
Now, run the `docker images` command to see a list of our local images.
@y
そこで`docker images`コマンドを実行して、ローカルイメージの一覧を確認します。
@z

@x
```shell
$ docker images
REPOSITORY      TAG               IMAGE ID       CREATED         SIZE
python-docker   latest            8cae92a8fbd6   4 minutes ago   123MB
python-docker   v1.0.0            8cae92a8fbd6   4 minutes ago   123MB
python          3.8-slim-buster   be5d294735c6   9 days ago      113MB
```
@y
```shell
$ docker images
REPOSITORY      TAG               IMAGE ID       CREATED         SIZE
python-docker   latest            8cae92a8fbd6   4 minutes ago   123MB
python-docker   v1.0.0            8cae92a8fbd6   4 minutes ago   123MB
python          3.8-slim-buster   be5d294735c6   9 days ago      113MB
```
@z

@x
You can see that we have two images that start with `python-docker`. We know they are the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
@y
`python-docker`で始まるイメージが一覧に 2 つ表示されています。
`IMAGE ID`列を見てみれば、その 2 つのイメージは同一のものであることがわかります。
2 つのイメージの ID 値は同じだからです。
@z

@x
Let’s remove the tag that we just created. To do this, we’ll use the `rmi` command. The `rmi` command stands for remove image.
@y
では今生成したタグを削除してみます。
これを行うには`rmi`コマンドを使います。
`rmi`コマンドは「remove image」を表しています。
@z

@x
```shell
$ docker rmi python-docker:v1.0.0
Untagged: python-docker:v1.0.0
```
@y
```shell
$ docker rmi python-docker:v1.0.0
Untagged: python-docker:v1.0.0
```
@z

@x
Note that the response from Docker tells us that the image has not been removed but only “untagged”. You can check this by running the `docker images` command.
@y
Docker の出力結果からわかるように、イメージは削除されたわけではなく「タグづけ解除」が行われただけです。
`docker images`コマンドを実行して確認してみます。
@z

@x
```shell
$ docker images
REPOSITORY      TAG               IMAGE ID       CREATED         SIZE
python-docker   latest            8cae92a8fbd6   6 minutes ago   123MB
python          3.8-slim-buster   be5d294735c6   9 days ago      113MB
```
@y
```shell
$ docker images
REPOSITORY      TAG               IMAGE ID       CREATED         SIZE
python-docker   latest            8cae92a8fbd6   6 minutes ago   123MB
python          3.8-slim-buster   be5d294735c6   9 days ago      113MB
```
@z

@x
Our image that was tagged with `:v1.0.0` has been removed, but we still have the `python-docker:latest` tag available on our machine.
@y
`:v1.0.0`としてタグづけを行ったイメージは削除されましたが、マシン上には`python-docker:latest`というタグを通じてイメージが参照可能です。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
In this module, we took a look at setting up our example Python application that we will use for the rest of the tutorial. We also created a Dockerfile that we used to build our Docker image. Then, we took a look at tagging our images and removing images. In the next module we’ll take a look at how to:
@y
本節ではサンプル Python アプリケーションの設定を行いました。
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
