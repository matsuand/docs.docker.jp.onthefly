%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Use containers for development"
keywords: python, local, development, run,
description: Learn how to develop your application locally.
---
@y
---
title: "開発向けのコンテナー利用"
keywords: python, local, development, run,
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
[コンテナーとしてのイメージ実行](run-containers.md) において、イメージビルドを行いコンテナー化アプリケーションを実行していること。
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
本節では前節においてビルドしたアプリケーション用に、ローカルの開発環境を構築していきます。
イメージのビルドには Docker を利用し、全体を取り扱いやすくするために Docker Compose を利用していきます。
@z

@x
## Run a database in a container
@y
{: #run-a-database-in-a-container }
## コンテナー内でのデータベース実行
@z

@x
First, we’ll take a look at running a database in a container and how we use volumes and networking to persist our data and allow our application to talk with the database. Then we’ll pull everything together into a Compose file which allows us to setup and run a local development environment with one command. Finally, we’ll take a look at connecting a debugger to our application running inside a container.
@y
まずはコンテナー内でデータベースを動作させます。
ボリュームやネットワークを使ってデータの保存を行い、アプリケーションとデータベースのやりとりを実現します。
そしてこのすべてをとりまとめて Compose ファイルに収めます。
こうすることで、たった 1 つのコマンド実行によってローカル開発環境を構築して実行できるようにします。
最後に、コンテナー内で動作しているアプリケーションに対してデバッガー接続を行ってみます。
@z

@x
Instead of downloading MySQL, installing, configuring, and then running the MySQL database as a service, we can use the Docker Official Image for MySQL and run it in a container.
@y
MySQL をダウンロード、インストールして、MySQL データベースをサービスとして起動するようなことはしません。
そうではなく Docker の公式イメージの中から MySQL 用のイメージを利用し、コンテナーとしてこれを実行します。
@z

@x
Before we run MySQL in a container, we'll create a couple of volumes that Docker can manage to store our persistent data and configuration. Let’s use the managed volumes feature that Docker provides instead of using bind mounts. You can read all about [Using volumes](../../storage/volumes.md) in our documentation.
@y
MySQL をコンテナーとして実行するにあたって、いくつかボリュームを生成して Docker がデータや設定の保存ができるようにします。
バインドマウントは利用せず、管理されたボリューム機能を利用します。
ボリュームに関しては本ドキュメントの [ボリュームの利用](../../storage/volumes.md) において詳しく説明しています。
@z

@x
Let’s create our volumes now. We’ll create one for the data and one for configuration of MySQL.
@y
それではここでボリュームを生成します。
作り出すボリュームは 1 つは MySQL のデータ用、そしてもう 1 つは MySQL の設定用です。
@z

@x
```shell
$ docker volume create mysql
$ docker volume create mysql_config
```
@y
```shell
$ docker volume create mysql
$ docker volume create mysql_config
```
@z

@x
Now we’ll create a network that our application and database will use to talk to each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which we can use when creating our connection string.
@y
またここでネットワークを生成して、アプリケーションとデータベースが互いにやりとりできるようにします。
ネットワークはユーザー定義によるブリッジネットワークであり、DNS 検索サービスが提供されるため、接続文字列を使った設定が利用可能になります。
@z

@x
```shell
$ docker network create mysqlnet
```
@y
```shell
$ docker network create mysqlnet
```
@z

@x
Now we can run MySQL in a container and attach to the volumes and network we created above. Docker pulls the image from Hub and runs it for you locally.
@y
コンテナーとして MySQL を実行します。
そして上で生成したボリュームとネットワークをこれに結びつけます。
Docker はイメージを Docker Hub からプルして、ローカル環境において実行します。
@z

@x
```shell
$ docker run --rm -d -v mysql:/var/lib/mysql \
  -v mysql_config:/etc/mysql -p 3306:3306 \
  --network mysqlnet \
  --name mysqldb \
  -e MYSQL_ROOT_PASSWORD=p@ssw0rd1 \
  mysql
```
@y
```shell
$ docker run --rm -d -v mysql:/var/lib/mysql \
  -v mysql_config:/etc/mysql -p 3306:3306 \
  --network mysqlnet \
  --name mysqldb \
  -e MYSQL_ROOT_PASSWORD=p@ssw0rd1 \
  mysql
```
@z

@x
Now, let’s make sure that our MySQL database is running and that we can connect to it. Connect to the running MySQL database inside the container using the following command and enter "p@ssw0rd1" when prompted for the password:
@y
MySQL データベースが起動されていて、そこに接続できることを確認します。
コンテナー内部から以下のコマンドを実行して、実行中の MySQL データベースに接続します。
なおパスワードプロンプトには「p@ssw0rd1」を入力します。
@z

@x
```shell
$ docker exec -ti mysqldb mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.23 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```
@y
```shell
$ docker exec -ti mysqldb mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.23 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```
@z

@x
### Connect the application to the database
@y
{: #connect-the-application-to-the-database }
### アプリケーションからのデータベース接続
@z

@x
In the above command, we logged in to the MySQL database by passing the ‘mysql’ command to the `mysqldb` container. Press CTRL-D to exit the MySQL interactive terminal.
@y
上のコマンドにおいては、`mysqldb`コンテナーに対して`mysql`コマンドを実行して MySQL データベースにログインしました。
CTRL-D を入力して MySQL のインタラクティブターミナルから抜け出てください。
@z

@x
Next, we'll update the sample application we created in the [Build images](build-images.md#sample-application) module. To see the directory structure of the Python app, see [Python application directory structure](build-images.md#directory-structure).
@y
次は [イメージのビルド](build-images.md#sample-application) の節において生成したサンプルアプリケーションを更新します。
Python アプリのディレクトリ構造を確認するには、[Python アプリケーションのディレクトリ構造](build-images.md#directory-structure) を参照してください。
@z

@x
Okay, now that we have a running MySQL, let’s update the `app.py` to use MySQL as a datastore. Let’s also add some routes to our server. One for fetching records and one for inserting records.
@y
さて MySQL が動作したので、`app.py`を修正しデータ保存先を MySQL とします。
さらにサーバーへの接続内容も追加することにします。
1 つはレコード取得であり、1 つはレコード挿入です。
@z

@x
```shell
import mysql.connector
import json
from flask import Flask

app = Flask(__name__)
@y
```shell
import mysql.connector
import json
from flask import Flask

app = Flask(__name__)
@z

@x
@app.route('/')
def hello_world():
  return 'Hello, Docker!'
@y
@app.route('/')
def hello_world():
  return 'Hello, Docker!'
@z

@x
@app.route('/widgets')
def get_widgets() :
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1",
    database="inventory"
  )
  cursor = mydb.cursor()
@y
@app.route('/widgets')
def get_widgets() :
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1",
    database="inventory"
  )
  cursor = mydb.cursor()
@z

@x
  cursor.execute("SELECT * FROM widgets")
@y
  cursor.execute("SELECT * FROM widgets")
@z

@x
  row_headers=[x[0] for x in cursor.description] #this will extract row headers
@y
  row_headers=[x[0] for x in cursor.description] #this will extract row headers
@z

@x
  results = cursor.fetchall()
  json_data=[]
  for result in results:
    json_data.append(dict(zip(row_headers,result)))
@y
  results = cursor.fetchall()
  json_data=[]
  for result in results:
    json_data.append(dict(zip(row_headers,result)))
@z

@x
  cursor.close()
@y
  cursor.close()
@z

@x
  return json.dumps(json_data)
@y
  return json.dumps(json_data)
@z

@x
@app.route('/initdb')
def db_init():
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1"
  )
  cursor = mydb.cursor()
@y
@app.route('/initdb')
def db_init():
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1"
  )
  cursor = mydb.cursor()
@z

@x
  cursor.execute("DROP DATABASE IF EXISTS inventory")
  cursor.execute("CREATE DATABASE inventory")
  cursor.close()
@y
  cursor.execute("DROP DATABASE IF EXISTS inventory")
  cursor.execute("CREATE DATABASE inventory")
  cursor.close()
@z

@x
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1",
    database="inventory"
  )
  cursor = mydb.cursor()
@y
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1",
    database="inventory"
  )
  cursor = mydb.cursor()
@z

@x
  cursor.execute("DROP TABLE IF EXISTS widgets")
  cursor.execute("CREATE TABLE widgets (name VARCHAR(255), description VARCHAR(255))")
  cursor.close()
@y
  cursor.execute("DROP TABLE IF EXISTS widgets")
  cursor.execute("CREATE TABLE widgets (name VARCHAR(255), description VARCHAR(255))")
  cursor.close()
@z

@x
  return 'init database'
@y
  return 'init database'
@z

@x
if __name__ == "__main__":
  app.run(host ='0.0.0.0')
```
@y
if __name__ == "__main__":
  app.run(host ='0.0.0.0')
```
@z

@x
We’ve added the MySQL module and updated the code to connect to the database server, created a database and table. We also created a couple of routes to save widgets and fetch widgets. We now need to rebuild our image so it contains our changes.
@y
ここでは MySQL モジュールを追加して、データベースサーバーに接続するようなコードに変更しました。
データベースとテーブルも生成しています。
またサーバーへのアクセス方法として、レコード保存のためのウィジェット、レコード取得のためのウィジェットを生成しました。
そこでこの変更を含むイメージを再ビルドします。
@z

@x
First, let’s add the `mysql-connector-python` module to our application using pip.
@y
まずは pip を使ってアプリケーションに`mysql-connector-python`モジュールを追加します。
@z

@x
```shell
$ pip3 install mysql-connector-python
$ pip3 freeze > requirements.txt
```
@y
```shell
$ pip3 install mysql-connector-python
$ pip3 freeze > requirements.txt
```
@z

@x
Now we can build our image.
@y
そしてイメージをビルドします。
@z

@x
```shell
$ docker build --tag python-docker .
```
@y
```shell
$ docker build --tag python-docker .
```
@z

@x
Now, let’s add the container to the database network and then run our container. This allows us to access the database by its container name.
@y
ではこのコンテナーをデータベースのネットワークに追加して実行します。
これによってデータベースへのアクセスは、コンテナー名を使って行えるようになります。
@z

@x
```shell
$ docker run \
  --rm -d \
  --network mysqlnet \
  --name rest-server \
  -p 5000:5000 \
  python-docker
```
@y
```shell
$ docker run \
  --rm -d \
  --network mysqlnet \
  --name rest-server \
  -p 5000:5000 \
  python-docker
```
@z

@x
Let’s test that our application is connected to the database and is able to add a note.
@y
アプリケーションがデータベースに接続されていて、メモ書き（note）が追加できることを確認します。
@z

@x
```shell
$ curl http://localhost:5000/initdb
$ curl http://localhost:5000/widgets
```
@y
```shell
$ curl http://localhost:5000/initdb
$ curl http://localhost:5000/widgets
```
@z

@x
You should receive the following JSON back from our service.
@y
サービスからは以下のような JSON データが返ってくるはずです。
@z

@x
```shell
[]
```
@y
```shell
[]
```
@z

@x
## Use Compose to develop locally
@y
{: #use-compose-to-develop-locally }
## Compose を使ったローカル開発環境
@z

@x
In this section, we’ll create a Compose file to start our python-docker and the MySQL database using a single command. We’ll also set up the Compose file to start the `python-docker` application in debug mode so that we can connect a debugger to the running process.
@y
ここでは Compose ファイルを生成して、1 つのコマンド実行から python-docker と MySQL を起動できるようにします。
なお`python-docker`はデバッグモードで起動するような Compose ファイルとして、稼働するノードプロセスに対してデバッガーを接続できるようにしておきます。
@z

@x
Open the `python-docker` code in your IDE or a text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the following commands into the file.
@y
IDE あるいはテキストエディターにおいて`python-docker`を開いて、`docker-compose.dev.yml`というファイルを新規生成します。
そのファイルに以下の記述をコピーおよび貼りつけます。
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
 web:
  build:
   context: .
  ports:
  - 5000:5000
  volumes:
  - ./:/app
@y
services:
 web:
  build:
   context: .
  ports:
  - 5000:5000
  volumes:
  - ./:/app
@z

@x
 mysqldb:
  image: mysql
  ports:
  - 3306:3306
  environment:
  - MYSQL_ROOT_PASSWORD=p@ssw0rd1
  volumes:
  - mysql:/var/lib/mysql
  - mysql_config:/etc/mysql
@y
 mysqldb:
  image: mysql
  ports:
  - 3306:3306
  environment:
  - MYSQL_ROOT_PASSWORD=p@ssw0rd1
  volumes:
  - mysql:/var/lib/mysql
  - mysql_config:/etc/mysql
@z

@x
volumes:
  mysql:
  mysql_config:
```
@y
volumes:
  mysql:
  mysql_config:
```
@z

@x
This Compose file is super convenient as we do not have to type all the parameters to pass to the `docker run` command. We can declaratively do that using a Compose file.
@y
この Compose ファイルは非常に便利なものです。
`docker run`コマンドの実行にあたって、パラメーターすべてを記述する必要はありません。
それは Compose ファイル内に宣言という形で行います。
@z

@x
We expose port 5000 so that we can reach the dev web server inside the container. We also map our local source code into the running container to make changes in our text editor and have those changes picked up in the container.
@y
ポート 5000 を公開することで、コンテナー内部にある開発ウェブサーバーにアクセスできるようにします。
またローカルにあるソースコードを実行コンテナー内にもマッピングして、テキストエディター上での変更を可能とし、その変更をコンテナー内に反映されるようにします。
@z

@x
Another really cool feature of using a Compose file is that we have service resolution set up to use the service names. Therefore, we are now able to use “mysqldb” in our connection string. The reason we use “mysqldb” is because that is what we've named our MySQL service as in the Compose file.
@y
Compose ファイルを利用する理由となるもう一つ優れているのは、サービス名を使ってサービス設定の解決を行うことができる点です。
だから接続文字列の中で「mysqldb」という名称を用いることができるのです。
「mysqldb」という名称をなぜ用いるかと言えば、Compose ファイル内にて MySQL サービスに対してそのような名前づけを行ったからです。
@z

@x
Now, to start our application and to confirm that it is running properly, run the following command:
@y
アプリケーションを起動して正常に動作していることを確認するために、以下のコマンドを実行します。
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
We pass the `--build` flag so Docker will compile our image and then starts the containers.
@y
ここでは`--build`フラグを指定しました。
これによって Docker はイメージをコンパイルした上で起動を行います。
@z

@x
Now let’s test our API endpoint. Run the following curl commands:
@y
では API エンドポイントを確認します。
以下の curl コマンドを実行してみましょう。
@z

@x
```shell
$ curl http://localhost:5000/initdb
$ curl http://localhost:5000/widgets
```
@y
```shell
$ curl http://localhost:5000/initdb
$ curl http://localhost:5000/widgets
```
@z

@x
You should receive the following response:
@y
以下のようなレスポンスが返ってくるはずです。
@z

@x
```shell
[]
```
@y
```shell
[]
```
@z

@x
This is because our database is empty.
@y
この結果になったのは、データベースが空であるからです。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
In this module, we took a look at creating a general development image that we can use pretty much like our normal command line. We also set up our Compose file to map our source code into the running container and exposed the debugging port.
@y
本節では汎用的な開発イメージを生成しました。
このイメージは、ふだんのコマンドラインツールと何ら変わらずに実行できました。
また Compose ファイルを生成してソースコードを実行コンテナー内にマッピングし、デバッグ用のポートを公開しました。
@z

@x
In the next module, we’ll take a look at how to set up a CI/CD pipeline using GitHub Actions. See:
@y
次節では GitHub アクションを使って CI/CD パイプラインを設定する方法を見ていきます。
以下を参照してください。
@z

@x
[Configure CI/CD](configure-ci-cd.md){: .button .outline-btn}
@y
[CI/CD の設定](configure-ci-cd.md){: .button .outline-btn}
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
