%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Getting started with Docker Compose and Rails
keywords: documentation, docs, docker, compose, orchestration, containers
title: "Quickstart: Compose and Rails"
redirect_from:
  - /compose/rails/
---
@y
---
description: Rails を使って Docker Compose をはじめる。
keywords: documentation, docs, docker, compose, orchestration, containers
title: "クィックスタート: Compose と Rails"
redirect_from:
  - /compose/rails/
---
@z

@x
This Quickstart guide shows you how to use Docker Compose to set up and run
a Rails/PostgreSQL app. Before starting, [install Compose](../compose/install.md).
@y
このクィックスタートガイドでは Docker Compose を使って、簡単な Rails/PostgreSQL アプリを設定し実行する手順を示します。
はじめるには [Compose のインストール](../compose/install.md) が必要です。
@z

@x
### Define the project
@y
{: #define-the-project }
### プロジェクトの定義
@z

@x
Start by setting up the files needed to build the app. The app will run inside a
Docker container containing its dependencies. Defining dependencies is done using
a file called `Dockerfile`. To begin with, the  Dockerfile consists of:
@y
アプリのビルドに必要となるファイルを作るところから始めます。
アプリの依存パッケージも含め、アプリは Docker コンテナー内で実行するものとします。
依存パッケージは`Dockerfile`というファイル内に定義します。
まずは Dockerfile を以下のようにします。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY ../compose /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY ../compose /myapp

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]
```
@z

@x
That'll put your application code inside an image that builds a container
with Ruby, Bundler and all your dependencies inside it. For more information on
how to write Dockerfiles, see the [Docker user guide](../get-started/index.md)
and the [Dockerfile reference](/engine/reference/builder/).
@y
上の設定はイメージ内部にアプリケーションコードを置きます。
このイメージは Ruby、Bundler などの依存パッケージすべてをコンテナー内部に含めてビルドされます。
Dockerfile の記述方法の詳細は [Docker ユーザーガイド](../get-started/index.md) や [Dockerfile リファレンス](/engine/reference/builder/) を参照してください。
@z

@x
Next, create a bootstrap `Gemfile` which just loads Rails. It'll be overwritten
in a moment by `rails new`.
@y
次にブートストラップを行うファイル`Gemfile`を生成して、Rails をロードできるようにします。
このファイルは`rails new`を行ったタイミングで書き換わります。
@z

@x
    source 'https://rubygems.org'
    gem 'rails', '~>5'
@y
    source 'https://rubygems.org'
    gem 'rails', '~>5'
@z

@x
Create an empty `Gemfile.lock` to build our `Dockerfile`.
@y
空のファイル`Gemfile.lock`を生成して`Dockerfile`のビルドができるようにします。
@z

@x
```console
$ touch Gemfile.lock
```
@y
```console
$ touch Gemfile.lock
```
@z

@x
Next, provide an entrypoint script to fix a Rails-specific issue that
prevents the server from restarting when a certain `server.pid` file pre-exists.
This script will be executed every time the container gets started.
`entrypoint.sh` consists of:
@y
次にエントリーポイントの実行スクリプトを生成して、Rails 特有の問題へ対処します。
これはサーバー内に`server.pid`というファイルが先に存在していたときに、サーバーが再起動できなくなる問題を回避するものです。
このスクリプトは、コンテナーが起動されるたびに実行されることになります。
`entrypoint.sh`というこのスクリプトを、以下のように生成します。
@z

@x
```bash
#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
```
@y
```bash
#!/bin/bash
set -e

# Rails に対応したファイル server.pid が存在しているかもしれないので削除する。
rm -f /myapp/tmp/pids/server.pid

# コンテナーのプロセスを実行する。（Dockerfile 内の CMD に設定されているもの。）
exec "$@"
```
@z

@x
Finally, `docker-compose.yml` is where the magic happens. This file describes
the services that comprise your app (a database and a web app), how to get each
one's Docker image (the database just runs on a pre-made PostgreSQL image, and
the web app is built from the current directory), and the configuration needed
to link them together and expose the web app's port.
@y
最後に`docker-compose.yml`が取りまとめてくれます。
このファイルには、データベースとウェブという 2 つのアプリを含んだサービスが定義されています。
そしてそれぞれの Docker イメージをどう作るかが示されています。
（データベースは既存の PostgreSQL イメージにより動作します。ウェブアプリはカレントディレクトリ内に生成されます。）
また、リンクによってそれを結び合わせることが設定されていて、ウェブアプリのポートは外部に公開されています。
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: password
  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: password
  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```
@z

@x
> **Tip**
>
> You can use either a `.yml` or `.yaml` extension for this file.
@y
>**ヒント**
>
> このファイルの拡張子は`.yml`と`.yaml`のどちらでも構いません。
@z

@x
### Build the project
@y
{: #build-the-project }
### プロジェクトのビルド
@z

@x
With those files in place, you can now generate the Rails skeleton app
using [docker-compose run](reference/run.md):
@y
ここまでのファイルを使って [docker-compose run](reference/run.md) を実行し、Rails アプリのひながたを生成します。
@z

@x
```console
$ docker-compose run --no-deps web rails new . --force --database=postgresql
```
@y
```console
$ docker-compose run --no-deps web rails new . --force --database=postgresql
```
@z

@x
First, Compose builds the image for the `web` service using the `Dockerfile`.
The `--no-deps` tells Compose not to start linked services. Then it runs
`rails new` inside a new container, using that image. Once it's done, you
should have generated a fresh app.
@y
最初に Compose は`Dockerfile`を用いて`web`サービスに対するイメージをビルドします。
`--no-deps`フラグは Compose に対してリンクサービスは起動しないように指示します。
そしてこのイメージを利用して、新たに生成されたコンテナー内にて`rails new`を実行します。
処理が完了すれば、できたてのアプリが生成されているはずです。
@z

@x
List the files.
@y
ファイル一覧を見てみます。
@z

@x
```console
$ ls -l

total 64
-rw-r--r--   1 vmb  staff   222 Jun  7 12:05 Dockerfile
-rw-r--r--   1 vmb  staff  1738 Jun  7 12:09 Gemfile
-rw-r--r--   1 vmb  staff  4297 Jun  7 12:09 Gemfile.lock
-rw-r--r--   1 vmb  staff   374 Jun  7 12:09 README.md
-rw-r--r--   1 vmb  staff   227 Jun  7 12:09 Rakefile
drwxr-xr-x  10 vmb  staff   340 Jun  7 12:09 app
drwxr-xr-x   8 vmb  staff   272 Jun  7 12:09 bin
drwxr-xr-x  14 vmb  staff   476 Jun  7 12:09 config
-rw-r--r--   1 vmb  staff   130 Jun  7 12:09 config.ru
drwxr-xr-x   3 vmb  staff   102 Jun  7 12:09 db
-rw-r--r--   1 vmb  staff   211 Jun  7 12:06 docker-compose.yml
-rw-r--r--   1 vmb  staff   184 Jun  7 12:08 entrypoint.sh
drwxr-xr-x   4 vmb  staff   136 Jun  7 12:09 lib
drwxr-xr-x   3 vmb  staff   102 Jun  7 12:09 log
-rw-r--r--   1 vmb  staff    63 Jun  7 12:09 package.json
drwxr-xr-x   9 vmb  staff   306 Jun  7 12:09 public
drwxr-xr-x   9 vmb  staff   306 Jun  7 12:09 test
drwxr-xr-x   4 vmb  staff   136 Jun  7 12:09 tmp
drwxr-xr-x   3 vmb  staff   102 Jun  7 12:09 vendor
```
@y
```console
$ ls -l

total 64
-rw-r--r--   1 vmb  staff   222 Jun  7 12:05 Dockerfile
-rw-r--r--   1 vmb  staff  1738 Jun  7 12:09 Gemfile
-rw-r--r--   1 vmb  staff  4297 Jun  7 12:09 Gemfile.lock
-rw-r--r--   1 vmb  staff   374 Jun  7 12:09 README.md
-rw-r--r--   1 vmb  staff   227 Jun  7 12:09 Rakefile
drwxr-xr-x  10 vmb  staff   340 Jun  7 12:09 app
drwxr-xr-x   8 vmb  staff   272 Jun  7 12:09 bin
drwxr-xr-x  14 vmb  staff   476 Jun  7 12:09 config
-rw-r--r--   1 vmb  staff   130 Jun  7 12:09 config.ru
drwxr-xr-x   3 vmb  staff   102 Jun  7 12:09 db
-rw-r--r--   1 vmb  staff   211 Jun  7 12:06 docker-compose.yml
-rw-r--r--   1 vmb  staff   184 Jun  7 12:08 entrypoint.sh
drwxr-xr-x   4 vmb  staff   136 Jun  7 12:09 lib
drwxr-xr-x   3 vmb  staff   102 Jun  7 12:09 log
-rw-r--r--   1 vmb  staff    63 Jun  7 12:09 package.json
drwxr-xr-x   9 vmb  staff   306 Jun  7 12:09 public
drwxr-xr-x   9 vmb  staff   306 Jun  7 12:09 test
drwxr-xr-x   4 vmb  staff   136 Jun  7 12:09 tmp
drwxr-xr-x   3 vmb  staff   102 Jun  7 12:09 vendor
```
@z

@x
If you are running Docker on Linux, the files `rails new` created are owned by
root. This happens because the container runs as the root user. If this is the
case, change the ownership of the new files.
@y
Linux 上で Docker を利用している場合、`rails new`により生成されたファイルの所有者は root になります。
これはコンテナーが root ユーザーにより実行されているためです。
この場合は、生成されたファイルの所有者を以下のように変更してください。
@z

@x
```console
$ sudo chown -R $USER:$USER .
```
@y
```console
$ sudo chown -R $USER:$USER .
```
@z

@x
If you are running Docker on Mac or Windows, you should already have ownership
of all files, including those generated by `rails new`.
@y
Docker on Mac あるいは Docker on Windows を利用している場合、`rails new`により生成されたファイルも含め、すべてのファイルに対しての所有権は、正しく設定されているはずです。
@z

@x
Now that you’ve got a new Gemfile, you need to build the image again. (This, and
changes to the `Gemfile` or the Dockerfile, should be the only times you’ll need
to rebuild.)
@y
ここに新たな Gemfile が作成されたので、イメージを再ビルドすることが必要です。
（再ビルドが必要になるのは、今の時点、あるいは`Gemfile`や Dockerfile を修正したときだけです。）
@z

@x
```console
$ docker-compose build
```
@y
```console
$ docker-compose build
```
@z

@x
### Connect the database
@y
{: #connect-the-database }
### データベースの接続設定
@z

@x
The app is now bootable, but you're not quite there yet. By default, Rails
expects a database to be running on `localhost` - so you need to point it at the
`db` container instead. You also need to change the database and username to
align with the defaults set by the `postgres` image.
@y
アプリは実行可能ですが、実行するのはまだです。
デフォルトで Rails は`localhost`において実行されているデータベースを用います。
したがってここでは`db`コンテナーを用いるように書き換える必要があります。
また`postgres`イメージにおいて設定されているデフォルトのデータベース名、ユーザー名を変更することも必要です。
@z

@x
Replace the contents of `config/database.yml` with the following:
@y
`config/database.yml`の記述内容を以下のように書き換えます。
@z

@x
```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5
@y
```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5
@z

@x
development:
  <<: *default
  database: myapp_development
@y
development:
  <<: *default
  database: myapp_development
@z

@x
test:
  <<: *default
  database: myapp_test
```
@y
test:
  <<: *default
  database: myapp_test
```
@z

@x
You can now boot the app with [docker-compose up](reference/up.md):
@y
[docker-compose up](reference/up.md) によりアプリを起動します。
@z

@x
```console
$ docker-compose up
```
@y
```console
$ docker-compose up
```
@z

@x
If all's well, you should see some PostgreSQL output.
@y
正常に動作すれば、PostgreSQL による出力が確認できるはずです。
@z

@x
```bash
rails_db_1 is up-to-date
Creating rails_web_1 ... done
Attaching to rails_db_1, rails_web_1
db_1   | PostgreSQL init process complete; ready for start up.
db_1   |
db_1   | 2018-03-21 20:18:37.437 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1   | 2018-03-21 20:18:37.437 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1   | 2018-03-21 20:18:37.443 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2018-03-21 20:18:37.726 UTC [55] LOG:  database system was shut down at 2018-03-21 20:18:37 UTC
db_1   | 2018-03-21 20:18:37.772 UTC [1] LOG:  database system is ready to accept connections
```
@y
```bash
rails_db_1 is up-to-date
Creating rails_web_1 ... done
Attaching to rails_db_1, rails_web_1
db_1   | PostgreSQL init process complete; ready for start up.
db_1   |
db_1   | 2018-03-21 20:18:37.437 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1   | 2018-03-21 20:18:37.437 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1   | 2018-03-21 20:18:37.443 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2018-03-21 20:18:37.726 UTC [55] LOG:  database system was shut down at 2018-03-21 20:18:37 UTC
db_1   | 2018-03-21 20:18:37.772 UTC [1] LOG:  database system is ready to accept connections
```
@z

@x
Finally, you need to create the database. In another terminal, run:
@y
最後にデータベースを生成することが必要です。
別の端末から以下を実行します。
@z

@x
```console
$ docker-compose run web rake db:create
```
@y
```console
$ docker-compose run web rake db:create
```
@z

@x
Here is an example of the output from that command:
@y
コマンドから出力される結果は、たとえば以下のようになります。
@z

@x
```console
$ docker-compose run web rake db:create

Starting rails_db_1 ... done
Created database 'myapp_development'
Created database 'myapp_test'
```
@y
```console
$ docker-compose run web rake db:create

Starting rails_db_1 ... done
Created database 'myapp_development'
Created database 'myapp_test'
```
@z

@x
### View the Rails welcome page!
@y
{: #view-the-rails-welcome-page }
### Rails の「ようこそ」ページの確認
@z

@x
That's it. Your app should now be running on port 3000 on your Docker daemon.
@y
以上です。
Docker デーモンを通じて、アプリがポート 3000 番を使って実行されています。
@z

@x
On Docker Desktop for Mac and Docker Desktop for Windows, go to `http://localhost:3000` on a web
browser to see the Rails Welcome.
@y
Docker Desktop for Mac や Docker Desktop for Windows の場合は、ウェブブラウザーから`http://localhost:3000`にアクセスすれば Rails のようこそページを確認できます。
@z

@x
![Rails example](images/rails-welcome.png)
@y
![Rails の例](images/rails-welcome.png)
@z

@x
### Stop the application
@y
{: #stop-the-application }
### アプリケーションの停止
@z

@x
To stop the application, run [docker-compose down](../compose/reference/down.md) in
your project directory. You can use the same terminal window in which you
started the database, or another one where you have access to a command prompt.
This is a clean way to stop the application.
@y
アプリケーションを停止するには、プロジェクトディレクトリにおいて [docker-compose down](../compose/reference/down.md) を実行します。
この場合に用いる端末画面は、データベースを起動したときと同じものを用いるか、あるいはコマンドプロンプトにアクセスできる別画面であっても構いません。
これがアプリケーションを適切に停止する方法です。
@z

@x
```console
$ docker-compose down

Stopping rails_web_1 ... done
Stopping rails_db_1 ... done
Removing rails_web_run_1 ... done
Removing rails_web_1 ... done
Removing rails_db_1 ... done
Removing network rails_default
@y
```console
$ docker-compose down

Stopping rails_web_1 ... done
Stopping rails_db_1 ... done
Removing rails_web_run_1 ... done
Removing rails_web_1 ... done
Removing rails_db_1 ... done
Removing network rails_default
@z

@x
```
@y
```
@z

@x
### Restart the application
@y
{: #restart-the-application }
### アプリケーションの再起動
@z

@x
To restart the application run `docker-compose up` in the project directory.
@y
アプリケーションを再起動する場合は、プロジェクトディレクトリにて`docker-compose up`を実行します。
@z

@x
### Rebuild the application
@y
{: #rebuild-the-application }
### アプリケーションの再ビルド
@z

@x
If you make changes to the Gemfile or the Compose file to try out some different
configurations, you need to rebuild. Some changes require only
`docker-compose up --build`, but a full rebuild requires a re-run of
`docker-compose run web bundle install` to sync changes in the `Gemfile.lock` to
the host, followed by `docker-compose up --build`.
@y
Gemfile や Compose ファイルを編集して、いろいろと別の設定とした場合には、再ビルドが必要になります。
変更内容によっては`docker-compose up --build`だけで済む場合もあります。
しかし完全に再ビルドを行うには、`docker-compose run web bundle install`を再度実行して、ホストにおける`Gemfile.lock`の変更と同期を取ることが必要になります。
その後に`docker-compose up --build`を実行します。
@z

@x
Here is an example of the first case, where a full rebuild is not necessary.
Suppose you simply want to change the exposed port on the local host from `3000`
in our first example to `3001`. Make the change to the Compose file to expose
port `3000` on the container through a new port, `3001`, on the host, and save
the changes:
@y
以下に示すのは前者、つまり完全な再ビルドは必要としない例です。
ローカルホスト側の公開ポートを`3000`から`3001`に変更する場合を取り上げます。
Compose ファイルにおいて、コンテナー側にて`3000`としているポートを新たなポート`3001`に変更します。
そしてこの変更を保存します。
@z

@x
```yaml
ports:
  - "3001:3000"
@y
```yaml
ports:
  - "3001:3000"
@z

@x
Now, rebuild and restart the app with `docker-compose up --build`.
@y
再ビルドとアプリの再起動は`docker-compose up --build`により行います。
@z

@x
Inside the container, your app is running on the same port as before `3000`, but
the Rails Welcome is now available on `http://localhost:3001` on your local
host.
@y
コンテナー内部において、アプリはそれまでと変わらないポート3000`で稼動していますが、ローカルホスト上から Rails ようこそページにアクセスするのは`http://localhost:3001`となります。
@z

@x
## More Compose documentation
@y
{: #more-compose-documentation }
## その他のCompose ドキュメント
@z

@x
- [Docker Compose overview](../compose/index.md)
- [Install Docker Compose](../compose/install.md)
- [Getting Started with Docker Compose](../compose/gettingstarted.md)
- [Docker Compose Command line reference](../compose/reference/index.md)
- [Compose file reference](../compose/compose-file/index.md)
- [Awesome Compose samples](https://github.com/docker/awesome-compose/){:target="_blank" rel="noopener" class="_"}
@y
- [Docker Compose 概要](../compose/index.md)
- [Docker Compose のインストール](../compose/install.md)
- [Docker Compose をはじめよう](../compose/gettingstarted.md)
- [Docker Compose コマンドラインリファレンス](../compose/reference/index.md)
- [Compose ファイルリファレンス](../compose/compose-file/index.md)
- [Awesome Compose サンプル](https://github.com/docker/awesome-compose/){:target="_blank" rel="noopener" class="_"}
@z
