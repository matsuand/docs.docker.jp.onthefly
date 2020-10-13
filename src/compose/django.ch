%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Getting started with Docker Compose and Django
keywords: documentation, docs,  docker, compose, orchestration, containers
title: "Quickstart: Compose and Django"
---
@y
---
description: Django を使って Docker Compose をはじめる。
keywords: documentation, docs,  docker, compose, orchestration, containers
title: "クィックスタート: Compose と Django"
---
@z

@x
This quick-start guide demonstrates how to use Docker Compose to set up and run a simple Django/PostgreSQL app. Before starting,
[install Compose](install.md).
@y
{% comment %}
This quick-start guide demonstrates how to use Docker Compose to set up and run a simple Django/PostgreSQL app. Before starting,
[install Compose](install.md).
{% endcomment %}
このクィックスタートガイドでは Docker Compose を使って、簡単な Django/PostgreSQL アプリを設定し実行する手順を示します。
はじめるには [Compose のインストール](install.md) が必要です。
@z

@x
### Define the project components
@y
{% comment %}
### Define the project components
{% endcomment %}
### プロジェクトのコンポーネントを定義
{: #define-the-project-components }
@z

@x
For this project, you need to create a Dockerfile, a Python dependencies file,
and a `docker-compose.yml` file. (You can use either a `.yml` or `.yaml` extension for this file.)
@y
{% comment %}
For this project, you need to create a Dockerfile, a Python dependencies file,
and a `docker-compose.yml` file. (You can use either a `.yml` or `.yaml` extension for this file.)
{% endcomment %}
このプロジェクトでは Dockerfile、Python の依存関係を示すファイル、`docker-compose.yml`ファイルをそれぞれ生成します。（`docker-compose.yml`の拡張子は`.yml`と`.yaml`のどちらでも構いません。）
@z

@x
1. Create an empty project directory.
@y
{% comment %}
1. Create an empty project directory.
{% endcomment %}
1. 空のプロジェクトディレクトリを生成します。
@z

@x
    You can name the directory something easy for you to remember. This directory is the context for your application image. The directory should only contain resources to build that image.
@y
    {% comment %}
    You can name the directory something easy for you to remember. This directory is the context for your application image. The directory should only contain resources to build that image.
    {% endcomment %}
    ディレクトリ名は覚えやすいものにします。
    このディレクトリはアプリケーションイメージのコンテキストディレクトリとなります。
    このディレクトリには、イメージをビルドするために必要となるものだけを含めるようにします。
@z

@x
2. Create a new file called `Dockerfile` in your project directory.
@y
{% comment %}
2. Create a new file called `Dockerfile` in your project directory.
{% endcomment %}
2. プロジェクトディレクトリ内に `Dockerfile` というファイルを新規生成します。
@z

@x
    The Dockerfile defines an application's image content via one or more build
    commands that configure that image. Once built, you can run the image in a
    container.  For more information on `Dockerfile`, see the [Docker user guide](../get-started/index.md)
    and the [Dockerfile reference](/engine/reference/builder/).
@y
    {% comment %}
    The Dockerfile defines an application's image content via one or more build
    commands that configure that image. Once built, you can run the image in a
    container.  For more information on `Dockerfile`, see the [Docker user guide](../get-started/index.md)
    and the [Dockerfile reference](/engine/reference/builder/).
    {% endcomment %}
    Dockerfile はアプリケーションイメージの内容を定義するものであり、イメージを設定しビルドするコマンドがいくつか記述されます。
    ビルドが成功すると、コンテナー内にてイメージが起動します。
    `Dockerfile` の詳細は [Docker ユーザーガイド](../get-started/index.md)や [Dockerfile リファレンス](/engine/reference/builder/) を参照してください。
@z

@x
3. Add the following content to the `Dockerfile`.
@y
{% comment %}
3. Add the following content to the `Dockerfile`.
{% endcomment %}
3. `Dockerfile` に以下の内容を記述します。
@z

@x
   ```dockerfile
   FROM python:3
   ENV PYTHONUNBUFFERED=1
   RUN mkdir /code
   WORKDIR /code
   COPY requirements.txt /code/
   RUN pip install -r requirements.txt
   COPY . /code/
   ```
@y
   ```dockerfile
   FROM python:3
   ENV PYTHONUNBUFFERED=1
   RUN mkdir /code
   WORKDIR /code
   COPY requirements.txt /code/
   RUN pip install -r requirements.txt
   COPY . /code/
   ```
@z

@x
   This `Dockerfile` starts with a [Python 3 parent image](https://hub.docker.com/r/library/python/tags/3/).
   The parent image is modified by adding a new `code` directory. The parent image is further modified
   by installing the Python requirements defined in the `requirements.txt` file.
@y
   {% comment %}
   This `Dockerfile` starts with a [Python 3 parent image](https://hub.docker.com/r/library/python/tags/3/).
   The parent image is modified by adding a new `code` directory. The parent image is further modified
   by installing the Python requirements defined in the `requirements.txt` file.
   {% endcomment %}
   この`Dockerfile`はまず [Python 3 の親イメージ](https://hub.docker.com/r/library/python/tags/3/)から始まっています。
   この親イメージには新規のディレクトリ`code`が加えられます。 
   さらに`requirements.txt`ファイルに定義された Python 依存パッケージをインストールする変更が加えられています。
@z

@x
4. Save and close the `Dockerfile`.
@y
{% comment %}
4. Save and close the `Dockerfile`.
{% endcomment %}
4. `Dockerfile` を保存して閉じます。
@z

@x
5. Create a `requirements.txt` in your project directory.
@y
{% comment %}
5. Create a `requirements.txt` in your project directory.
{% endcomment %}
5. プロジェクトディレクトリに`requirements.txt`というファイルを生成します。
@z

@x
    This file is used by the `RUN pip install -r requirements.txt` command in your `Dockerfile`.
@y
    {% comment %}
    This file is used by the `RUN pip install -r requirements.txt` command in your `Dockerfile`.
    {% endcomment %}
    このファイルは`Dockerfile`内の`RUN pip install -r requirements.txt`というコマンドにおいて利用されます。
@z

@x
6. Add the required software in the file.
@y
{% comment %}
6. Add the required software in the file.
{% endcomment %}
6. 上のファイルに必要となるソフトウェアを記述します。
@z

@x
       Django>=3.0,<4.0
       psycopg2-binary>=2.8
@y
       Django>=3.0,<4.0
       psycopg2-binary>=2.8
@z

@x
7. Save and close the `requirements.txt` file.
@y
{% comment %}
7. Save and close the `requirements.txt` file.
{% endcomment %}
7. `requirements.txt`ファイルを保存して閉じます。
@z

@x
8. Create a file called `docker-compose.yml` in your project directory.
@y
{% comment %}
8. Create a file called `docker-compose.yml` in your project directory.
{% endcomment %}
8. プロジェクトディレクトリ内に`docker-compose.yml`というファイルを生成します。
@z

@x
    The `docker-compose.yml` file describes the services that make your app. In
    this example those services are a web server and database.  The compose file
    also describes which Docker images these services use, how they link
    together, any volumes they might need to be mounted inside the containers.
    Finally, the `docker-compose.yml` file describes which ports these services
    expose. See the [`docker-compose.yml` reference](compose-file/index.md) for more
    information on how this file works.
@y
    {% comment %}
    The `docker-compose.yml` file describes the services that make your app. In
    this example those services are a web server and database.  The compose file
    also describes which Docker images these services use, how they link
    together, any volumes they might need to be mounted inside the containers.
    Finally, the `docker-compose.yml` file describes which ports these services
    expose. See the [`docker-compose.yml` reference](compose-file/index.md) for more
    information on how this file works.
    {% endcomment %}
    `docker-compose.yml`ファイルは、アプリケーションを作り出すサービスを記述するものです。
    この例においてそのサービスとは、ウェブサーバーとデータベースです。
    Compose ファイルはまた、各サービスが利用する Docker イメージを記述します。
    そしてどのように互いにリンクし合い、コンテナー内部にマウントすべきボリュームはどのようなものかを定義します。
    そして`docker-compose.yml`ファイルには、各サービスが公開するポート番号が何かも記述します。
    このファイルがどのようにして動作するかの詳細は [`docker-compose.yml` リファレンス](compose-file/index.md)を参照してください。
@z

@x
9. Add the following configuration to the file.
@y
{% comment %}
9. Add the following configuration to the file.
{% endcomment %}
9. 以下の設定内容をファイルに記述します。
@z

@x
   ```yaml
   version: "{{ site.compose_file_v3 }}"
   
   services:
     db:
       image: postgres
       environment:
         - POSTGRES_DB=postgres
         - POSTGRES_USER=postgres
         - POSTGRES_PASSWORD=postgres
     web:
       build: .
       command: python manage.py runserver 0.0.0.0:8000
       volumes:
         - .:/code
       ports:
         - "8000:8000"
       depends_on:
         - db
   ```
@y
   ```yaml
   version: "{{ site.compose_file_v3 }}"
   
   services:
     db:
       image: postgres
       environment:
         - POSTGRES_DB=postgres
         - POSTGRES_USER=postgres
         - POSTGRES_PASSWORD=postgres
     web:
       build: .
       command: python manage.py runserver 0.0.0.0:8000
       volumes:
         - .:/code
       ports:
         - "8000:8000"
       depends_on:
         - db
   ```
@z

@x
   This file defines two services: The `db` service and the `web` service.
@y
   {% comment %}
   This file defines two services: The `db` service and the `web` service.
   {% endcomment %}
   このファイルには`db`サービスと`web`サービスという 2 つのサービスが定義されています。
@z

@x
   > Note:
   >
   > This uses the build in development server to run your application
   > on port 8000. Do not use this in a production environment. For more
   > information, see [Django documentation](https://docs.djangoproject.com/en/3.1/intro/tutorial01/#the-development-server){: target="_blank" rel="noopener" class="_”}.
@y
   {% comment %}
   > Note:
   >
   > This uses the build in development server to run your application
   > on port 8000. Do not use this in a production environment. For more
   > information, see [Django documentation](https://docs.djangoproject.com/en/3.1/intro/tutorial01/#the-development-server){: target="_blank" rel="noopener" class="_”}.
   {% endcomment %}
   > メモ
   >
   > これは開発環境においてビルドを行い、アプリケーションをポート 8000 で動作させるものです。
   > これを本番環境で利用しないでください。
   > 詳しくは [Django ドキュメント](https://docs.djangoproject.com/en/3.1/intro/tutorial01/#the-development-server){: target="_blank" rel="noopener" class="_”} を参照してください。
@z

@x
10. Save and close the `docker-compose.yml` file.
@y
{% comment %}
10. Save and close the `docker-compose.yml` file.
{% endcomment %}
10. `docker-compose.yml`ファイルを保存して閉じます。
@z

@x
### Create a Django project
@y
{% comment %}
### Create a Django project
{% endcomment %}
### Django プロジェクトの生成
{: #create-a-django-project }
@z

@x
In this step, you create a Django starter project by building the image from the build context defined in the previous procedure.
@y
{% comment %}
In this step, you create a Django starter project by building the image from the build context defined in the previous procedure.
{% endcomment %}
ここでの手順では、前の手順で定義したビルドコンテキストからイメージをビルドし、Django プロジェクトのひながたを生成します。
@z

@x
1. Change to the root of your project directory.
@y
{% comment %}
1. Change to the root of your project directory.
{% endcomment %}
1. プロジェクトディレクトリに移動します。
@z

@x
2. Create the Django project by running
the [docker-compose run](reference/run.md) command as follows.
@y
{% comment %}
2. Create the Django project by running
the [docker-compose run](reference/run.md) command as follows.
{% endcomment %}
2. Django プロジェクトを生成するために [docker-compose run](reference/run.md) コマンドを以下のように実行します。
@z

@x
   ```console
   $ sudo docker-compose run web django-admin startproject composeexample .
   ```
@y
   ```console
   $ sudo docker-compose run web django-admin startproject composeexample .
   ```
@z

@x
    This instructs Compose to run `django-admin startproject composeexample`
    in a container, using the `web` service's image and configuration. Because
    the `web` image doesn't exist yet, Compose builds it from the current
    directory, as specified by the `build: .` line in `docker-compose.yml`.
@y
    {% comment %}
    This instructs Compose to run `django-admin startproject composeexample`
    in a container, using the `web` service's image and configuration. Because
    the `web` image doesn't exist yet, Compose builds it from the current
    directory, as specified by the `build: .` line in `docker-compose.yml`.
    {% endcomment %}
    このコマンドは Compose に対し、コンテナー内において `django-admin startproject composeexample` を実行するものです。
    その際には`web`サービスイメージとその設定を利用します。
    ただし`web`イメージはこの時点ではまだ存在していないため、Compose はカレントディレクトリからそのイメージをビルドします。このことは`docker-compose.yml`の`build: .`という記述行において指示されています。
@z

@x
    Once the `web` service image is built, Compose runs it and executes the
    `django-admin startproject` command in the container. This command
    instructs Django to create a set of files and directories representing a
    Django project.
@y
    {% comment %}
    Once the `web` service image is built, Compose runs it and executes the
    `django-admin startproject` command in the container. This command
    instructs Django to create a set of files and directories representing a
    Django project.
    {% endcomment %}
    `web`サービスイメージがビルドされると Compose はこのイメージを起動し、コンテナー内でコマンド`django-admin startproject`を実行します。
    このコマンドは Django に対して、Django プロジェクトを組み立てるファイルやディレクトリを生成することを指示するものです。
@z

@x
3. After the `docker-compose` command completes, list the contents of your project.
@y
{% comment %}
3. After the `docker-compose` command completes, list the contents of your project.
{% endcomment %}
3. `docker-compose`コマンドの処理が完了したら、プロジェクト内の一覧を表示してみます。
@z

@x
   ```console
   $ ls -l

   drwxr-xr-x 2 root   root   composeexample
   -rw-rw-r-- 1 user   user   docker-compose.yml
   -rw-rw-r-- 1 user   user   Dockerfile
   -rwxr-xr-x 1 root   root   manage.py
   -rw-rw-r-- 1 user   user   requirements.txt
   ```
@y
   ```console
   $ ls -l

   drwxr-xr-x 2 root   root   composeexample
   -rw-rw-r-- 1 user   user   docker-compose.yml
   -rw-rw-r-- 1 user   user   Dockerfile
   -rwxr-xr-x 1 root   root   manage.py
   -rw-rw-r-- 1 user   user   requirements.txt
   ```
@z

@x
   If you are running Docker on Linux, the files `django-admin` created are
   owned by root. This happens because the container runs as the root user.
   Change the ownership of the new files.
@y
   {% comment %}
   If you are running Docker on Linux, the files `django-admin` created are
   owned by root. This happens because the container runs as the root user.
   Change the ownership of the new files.
   {% endcomment %}
   Linux 上で Docker を利用している場合、`django-admin`が生成したファイルの所有者が root になっています。
   これはコンテナーが root ユーザーで実行されるからです。
   生成されたファイルの所有者を以下のようにして変更します。
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
   If you are running Docker on Mac or Windows, you should already
   have ownership of all files, including those generated by
   `django-admin`. List the files just to verify this.
@y
   {% comment %}
   If you are running Docker on Mac or Windows, you should already
   have ownership of all files, including those generated by
   `django-admin`. List the files just to verify this.
   {% endcomment %}
   Docker on Mac あるいは Docker on Windows を利用している場合は、生成されたファイルの所有権は、`django-admin`が作り出したファイルも含めて、すべて持っています。
   確認のため一覧を表示してみます。
@z

@x
   ```console
   $ ls -l

   total 32
   -rw-r--r--  1 user  staff  145 Feb 13 23:00 Dockerfile
   drwxr-xr-x  6 user  staff  204 Feb 13 23:07 composeexample
   -rw-r--r--  1 user  staff  159 Feb 13 23:02 docker-compose.yml
   -rwxr-xr-x  1 user  staff  257 Feb 13 23:07 manage.py
   -rw-r--r--  1 user  staff   16 Feb 13 23:01 requirements.txt
   ```
@y
   ```console
   $ ls -l

   total 32
   -rw-r--r--  1 user  staff  145 Feb 13 23:00 Dockerfile
   drwxr-xr-x  6 user  staff  204 Feb 13 23:07 composeexample
   -rw-r--r--  1 user  staff  159 Feb 13 23:02 docker-compose.yml
   -rwxr-xr-x  1 user  staff  257 Feb 13 23:07 manage.py
   -rw-r--r--  1 user  staff   16 Feb 13 23:01 requirements.txt
   ```
@z

@x
### Connect the database
@y
{% comment %}
### Connect the database
{% endcomment %}
### データベースへの接続設定
{: #connect-the-database }
@z

@x
In this section, you set up the database connection for Django.
@y
{% comment %}
In this section, you set up the database connection for Django.
{% endcomment %}
ここでは Django におけるデータベース接続の設定を行います。
@z

@x
1. In your project directory, edit the `composeexample/settings.py` file.
@y
{% comment %}
1. In your project directory, edit the `composeexample/settings.py` file.
{% endcomment %}
1. プロジェクトディレクトリにおいて`composeexample/settings.py`ファイルを編集します。
@z

@x
2. Replace the `DATABASES = ...` with the following:
@y
{% comment %}
2. Replace the `DATABASES = ...` with the following:
{% endcomment %}
2. `DATABASES = ...`の部分を以下のように書き換えます。
@z

@x
   ```python
   # settings.py
   
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.postgresql',
           'NAME': 'postgres',
           'USER': 'postgres',
           'PASSWORD': 'postgres',
           'HOST': 'db',
           'PORT': 5432,
       }
   }
   ```
@y
   ```python
   # settings.py
   
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.postgresql',
           'NAME': 'postgres',
           'USER': 'postgres',
           'PASSWORD': 'postgres',
           'HOST': 'db',
           'PORT': 5432,
       }
   }
   ```
@z

@x
   These settings are determined by the
   [postgres](https://hub.docker.com/_/postgres) Docker image
   specified in `docker-compose.yml`.
@y
   {% comment %}
   These settings are determined by the
   [postgres](https://hub.docker.com/_/postgres) Docker image
   specified in `docker-compose.yml`.
   {% endcomment %}
   上の設定は`docker-compose.yml`に指定した Docker イメージ [postgres](https://hub.docker.com/_/postgres) が定めている内容です。
@z

@x
3. Save and close the file.
@y
{% comment %}
3. Save and close the file.
{% endcomment %}
3. ファイルを保存して閉じます。
@z

@x
4. Run the [docker-compose up](reference/up.md) command from the top level directory for your project.
@y
{% comment %}
4. Run the [docker-compose up](reference/up.md) command from the top level directory for your project.
{% endcomment %}
4. プロジェクトのトップディレクトリにおいてコマンド [docker-compose up](reference/up.md) を実行します。
@z

@x
   ```console
   $ docker-compose up

   djangosample_db_1 is up-to-date
   Creating djangosample_web_1 ...
   Creating djangosample_web_1 ... done
   Attaching to djangosample_db_1, djangosample_web_1
   db_1   | The files belonging to this database system will be owned by user "postgres".
   db_1   | This user must also own the server process.
   db_1   |
   db_1   | The database cluster will be initialized with locale "en_US.utf8".
   db_1   | The default database encoding has accordingly been set to "UTF8".
   db_1   | The default text search configuration will be set to "english".

   . . .

   web_1  | July 30, 2020 - 18:35:38
   web_1  | Django version 3.0.8, using settings 'composeexample.settings'
   web_1  | Starting development server at http://0.0.0.0:8000/
   web_1  | Quit the server with CONTROL-C.
   ```
@y
   ```console
   $ docker-compose up

   djangosample_db_1 is up-to-date
   Creating djangosample_web_1 ...
   Creating djangosample_web_1 ... done
   Attaching to djangosample_db_1, djangosample_web_1
   db_1   | The files belonging to this database system will be owned by user "postgres".
   db_1   | This user must also own the server process.
   db_1   |
   db_1   | The database cluster will be initialized with locale "en_US.utf8".
   db_1   | The default database encoding has accordingly been set to "UTF8".
   db_1   | The default text search configuration will be set to "english".

   . . .

   web_1  | July 30, 2020 - 18:35:38
   web_1  | Django version 3.0.8, using settings 'composeexample.settings'
   web_1  | Starting development server at http://0.0.0.0:8000/
   web_1  | Quit the server with CONTROL-C.
   ```
@z

@x
   At this point, your Django app should be running at port `8000` on
   your Docker host. On Docker Desktop for Mac and Docker Desktop for Windows, go
   to `http://localhost:8000` on a web browser to see the Django
   welcome page. If you are using [Docker Machine](../machine/overview.md),
   then `docker-machine ip MACHINE_VM` returns the Docker host IP
   address, to which you can append the port (`<Docker-Host-IP>:8000`).
@y
   {% comment %}
   At this point, your Django app should be running at port `8000` on
   your Docker host. On Docker Desktop for Mac and Docker Desktop for Windows, go
   to `http://localhost:8000` on a web browser to see the Django
   welcome page. If you are using [Docker Machine](../machine/overview.md),
   then `docker-machine ip MACHINE_VM` returns the Docker host IP
   address, to which you can append the port (`<Docker-Host-IP>:8000`).
   {% endcomment %}
   この段階で Django アプリは Docker ホスト上のポート`8000`で稼動しています。
   Docker Desktop for Mac または Docker Desktop for Windows の場合は、ブラウザーから`http://localhost:8000`にアクセスすることで、Django の Welcome ページを確認できます。
   [Docker Machine](../machine/overview.md) を利用している場合は、`docker-machine ip MACHINE_VM`を実行すると Docker ホストの IP アドレスが得られるので、ポート番号をつけてアクセスします（`<DockerホストID>:8000`）。
@z

@x
   ![Django example](images/django-it-worked.png)
@y
   {% comment %}
   ![Django example](images/django-it-worked.png)
   {% endcomment %}
   ![Django の例](images/django-it-worked.png)
@z

@x
   > Note:
   >
   > On certain platforms (Windows 10), you might need to edit `ALLOWED_HOSTS`
   > inside `settings.py` and add your Docker host name or IP address to the list.
   > For demo purposes, you can set the value to:
   >
   >       ALLOWED_HOSTS = ['*']
   >
   > This value is **not** safe for production usage.  Refer to the
   > [Django documentation](https://docs.djangoproject.com/en/1.11/ref/settings/#allowed-hosts)  for more information.
@y
   {% comment %}
   > Note:
   >
   > On certain platforms (Windows 10), you might need to edit `ALLOWED_HOSTS`
   > inside `settings.py` and add your Docker host name or IP address to the list.
   > For demo purposes, you can set the value to:
   >
   >       ALLOWED_HOSTS = ['*']
   >
   > This value is **not** safe for production usage.  Refer to the
   > [Django documentation](https://docs.djangoproject.com/en/1.11/ref/settings/#allowed-hosts)  for more information.
   {% endcomment %}
   > メモ:
   >
   > 特定プラットフォーム（Windows 10）では、`settings.py`ファイル内の`ALLOWED_HOSTS`に、ホスト名あるいはホストの IP アドレスを追加することが必要かもしれません。
   > ここはデモが目的なので、以下のように設定することにします。
   >
   >       ALLOWED_HOSTS = ['*']
   >
   > この設定は本番環境では**安全ではありません**。
   > 詳しくは [Django ドキュメント](https://docs.djangoproject.com/en/1.11/ref/settings/#allowed-hosts) を参照してください。
@z

@x
5. List running containers.
@y
{% comment %}
5. List running containers.
{% endcomment %}
5. 起動しているコンテナーの一覧を確認します。
@z

@x
   In another terminal window, list the running Docker processes with the `docker container ls` command.
@y
   {% comment %}
   In another terminal window, list the running Docker processes with the `docker container ls` command.
   {% endcomment %}
   別の端末画面を開いて`docker container ls`コマンドを実行し、起動している Docker プロセスの一覧を表示します。
@z

@x
   ```console
   $ docker ps

   CONTAINER ID  IMAGE       COMMAND                  CREATED         STATUS        PORTS                    NAMES
   def85eff5f51  django_web  "python3 manage.py..."   10 minutes ago  Up 9 minutes  0.0.0.0:8000->8000/tcp   django_web_1
   678ce61c79cc  postgres    "docker-entrypoint..."   20 minutes ago  Up 9 minutes  5432/tcp                 django_db_1
   ```
@y
   ```console
   $ docker ps

   CONTAINER ID  IMAGE       COMMAND                  CREATED         STATUS        PORTS                    NAMES
   def85eff5f51  django_web  "python3 manage.py..."   10 minutes ago  Up 9 minutes  0.0.0.0:8000->8000/tcp   django_web_1
   678ce61c79cc  postgres    "docker-entrypoint..."   20 minutes ago  Up 9 minutes  5432/tcp                 django_db_1
   ```
@z

@x
6. Shut down services and clean up by using either of these methods:
@y
{% comment %}
6. Shut down services and clean up by using either of these methods:
{% endcomment %}
6. サービスを停止しクリアするために、以下のいずれかの方法をとります。
@z

@x
    * Stop the application by typing `Ctrl-C`
    in the same shell in where you started it:
@y
    {% comment %}
    * Stop the application by typing `Ctrl-C`
    in the same shell in where you started it:
    {% endcomment %}
    * アプリケーションを実行したシェル上で `Ctrl-C` を入力してアプリケーションを止めます。
@z

@x
      ```console
      Gracefully stopping... (press Ctrl+C again to force)
      Killing test_web_1 ... done
      Killing test_db_1 ... done
      ```
@y
      ```console
      Gracefully stopping... (press Ctrl+C again to force)
      Killing test_web_1 ... done
      Killing test_db_1 ... done
      ```
@z

@x
    * Or, for a more elegant shutdown, switch to a different shell, and run [docker-compose down](reference/down.md) from the top level of your Django sample project directory.
@y
    {% comment %}
    * Or, for a more elegant shutdown, switch to a different shell, and run [docker-compose down](reference/down.md) from the top level of your Django sample project directory.
    {% endcomment %}
    * もう少しきれいなやり方として別のシェル画面に切り替えて、Django サンプルプロジェクトのトップディレクトリにおいて [docker-compose down](reference/down.md) を実行します。
@z

@x
      ```console
      vmb at mymachine in ~/sandbox/django
      $ docker-compose down

      Stopping django_web_1 ... done
      Stopping django_db_1 ... done
      Removing django_web_1 ... done
      Removing django_web_run_1 ... done
      Removing django_db_1 ... done
      Removing network django_default
      ```
@y
      ```console
      vmb at mymachine in ~/sandbox/django
      $ docker-compose down

      Stopping django_web_1 ... done
      Stopping django_db_1 ... done
      Removing django_web_1 ... done
      Removing django_web_run_1 ... done
      Removing django_db_1 ... done
      Removing network django_default
      ```
@z

@x
  Once you've shut down the app, you can safely remove the Django project directory (for example, `rm -rf django`).
@y
  {% comment %}
  Once you've shut down the app, you can safely remove the Django project directory (for example, `rm -rf django`).
  {% endcomment %}
  アプリを停止したら Django プロジェクトディレクトリは何も問題なく削除することができます。
  （たとえば `rm -rf django`）
@z

@x
## More Compose documentation
@y
{% comment %}
## More Compose documentation
{% endcomment %}
## その他の Compose ドキュメント
{: #more-compose-documentation }
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
{% comment %}
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
{% endcomment %}
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [はじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
