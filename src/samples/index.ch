%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Samples
---
@y
---
title: サンプル集
---
@z

@x
{% assign labsbase = "https://github.com/docker/labs/tree/master" %}
@y
{% assign labsbase = "https://github.com/docker/labs/tree/master" %}
@z

@x
## Tutorial labs
@y
{% comment %}
## Tutorial labs
{% endcomment %}
{: #tutorial-labs }
## チュートリアルラボ
@z

@x
Learn how to develop and ship containerized applications, by walking through a
sample that exhibits canonical practices. These labs are from the [Docker Labs
repository]({{ labsbase }}).
@y
{% comment %}
Learn how to develop and ship containerized applications, by walking through a
sample that exhibits canonical practices. These labs are from the [Docker Labs
repository]({{ labsbase }}).
{% endcomment %}
Learn how to develop and ship containerized applications, by walking through a
sample that exhibits canonical practices. These labs are from the [Docker Labs
repository]({{ labsbase }}).
@z

@x
| Sample | Description |
| ------ | ----------- |
| [Docker for Beginners]({{ labsbase }}/beginner/){: target="_blank"} | A good "Docker 101" course. |
| [Docker Swarm mode]({{ labsbase}}/swarm-mode){: target="_blank"} | Use Docker for natively managing a cluster of Docker Engines called a swarm. |
| [Configuring developer tools and programming languages]({{ labsbase }}/developer-tools/README.md){: target="_blank"} | How to set-up and use common developer tools and programming languages with Docker. |
| [Live Debugging Java with Docker]({{ labsbase }}/developer-tools/java-debugging){: target="_blank"} | Java developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Docker for Java Developers]({{ labsbase }}/developer-tools/java/){: target="_blank"} | Offers Java developers an intro-level and self-paced hands-on workshop with Docker. |
| [Live Debugging a Node.js application in Docker]({{ labsbase }}/developer-tools/nodejs-debugging){: target="_blank"} | Node developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Dockerizing a Node.js application]({{ labsbase }}/developer-tools/nodejs/porting/){: target="_blank"} | This tutorial starts with a simple Node.js application and details the steps needed to Dockerize it and ensure its scalability. |
| [Docker for ASP.NET and Windows containers]({{ labsbase }}/windows/readme.md){: target="_blank"} | Docker supports Windows containers, too! Learn how to run ASP.NET, SQL Server, and more in these tutorials. |
| [Docker Security]({{ labsbase }}/security/README.md){: target="_blank"} | How to take advantage of Docker security features. |
| [Building a 12-factor application with Docker]({{ labsbase}}/12factor){: target="_blank"} | Use Docker to create an app that conforms to Heroku's "12 factors for cloud-native applications." |
@y
{% comment %}
| Sample | Description |
| ------ | ----------- |
| [Docker for Beginners]({{ labsbase }}/beginner/){: target="_blank"} | A good "Docker 101" course. |
| [Docker Swarm mode]({{ labsbase}}/swarm-mode){: target="_blank"} | Use Docker for natively managing a cluster of Docker Engines called a swarm. |
| [Configuring developer tools and programming languages]({{ labsbase }}/developer-tools/README.md){: target="_blank"} | How to set-up and use common developer tools and programming languages with Docker. |
| [Live Debugging Java with Docker]({{ labsbase }}/developer-tools/java-debugging){: target="_blank"} | Java developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Docker for Java Developers]({{ labsbase }}/developer-tools/java/){: target="_blank"} | Offers Java developers an intro-level and self-paced hands-on workshop with Docker. |
| [Live Debugging a Node.js application in Docker]({{ labsbase }}/developer-tools/nodejs-debugging){: target="_blank"} | Node developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Dockerizing a Node.js application]({{ labsbase }}/developer-tools/nodejs/porting/){: target="_blank"} | This tutorial starts with a simple Node.js application and details the steps needed to Dockerize it and ensure its scalability. |
| [Docker for ASP.NET and Windows containers]({{ labsbase }}/windows/readme.md){: target="_blank"} | Docker supports Windows containers, too! Learn how to run ASP.NET, SQL Server, and more in these tutorials. |
| [Docker Security]({{ labsbase }}/security/README.md){: target="_blank"} | How to take advantage of Docker security features. |
| [Building a 12-factor application with Docker]({{ labsbase}}/12factor){: target="_blank"} | Use Docker to create an app that conforms to Heroku's "12 factors for cloud-native applications." |
{% endcomment %}
| サンプル | 内容説明    |
| -------- | ----------- |
| [Docker for Beginners]({{ labsbase }}/beginner/){: target="_blank"} | A good "Docker 101" course. |
| [Docker Swarm mode]({{ labsbase}}/swarm-mode){: target="_blank"} | Use Docker for natively managing a cluster of Docker Engines called a swarm. |
| [Configuring developer tools and programming languages]({{ labsbase }}/developer-tools/README.md){: target="_blank"} | How to set-up and use common developer tools and programming languages with Docker. |
| [Live Debugging Java with Docker]({{ labsbase }}/developer-tools/java-debugging){: target="_blank"} | Java developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Docker for Java Developers]({{ labsbase }}/developer-tools/java/){: target="_blank"} | Offers Java developers an intro-level and self-paced hands-on workshop with Docker. |
| [Live Debugging a Node.js application in Docker]({{ labsbase }}/developer-tools/nodejs-debugging){: target="_blank"} | Node developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Dockerizing a Node.js application]({{ labsbase }}/developer-tools/nodejs/porting/){: target="_blank"} | This tutorial starts with a simple Node.js application and details the steps needed to Dockerize it and ensure its scalability. |
| [Docker for ASP.NET and Windows containers]({{ labsbase }}/windows/readme.md){: target="_blank"} | Docker supports Windows containers, too! Learn how to run ASP.NET, SQL Server, and more in these tutorials. |
| [Docker Security]({{ labsbase }}/security/README.md){: target="_blank"} | How to take advantage of Docker security features. |
| [Building a 12-factor application with Docker]({{ labsbase}}/12factor){: target="_blank"} | Use Docker to create an app that conforms to Heroku's "12 factors for cloud-native applications." |
@z

@x
## Sample applications
@y
{% comment %}
## Sample applications
{% endcomment %}
{: #sample-applications }
## サンプルアプリケーション
@z

@x
Run popular software using Docker.
@y
{% comment %}
Run popular software using Docker.
{% endcomment %}
Docker を使って人気のあるソフトウェアを実行します。
@z

@x
| Sample                                                                    | Description                                               |
| ------------------------------------------------------------------------- | --------------------------------------------------------- |
| [apt-cacher-ng](../engine/examples/apt-cacher-ng.md)                      | Run a Dockerized apt-cacher-ng instance.                  |
| [.Net Core application](../engine/examples/dotnetcore.md)                 | Run a Dockerized ASP.NET Core application.                |
| [ASP.NET Core + SQL Server on Linux](../compose/aspnet-mssql-compose.md)  | Run a Dockerized ASP.NET Core + SQL Server environment.   |
| [CouchDB](../engine/examples/couchdb_data_volumes.md)                     | Run a Dockerized CouchDB instance.                        |
| [Django + PostgreSQL](../compose/django.md)                               | Run a Dockerized Django + PostgreSQL environment.         |
| [PostgreSQL](../engine/examples/postgresql_service.md)                    | Run a Dockerized PostgreSQL instance.                     |
| [Rails + PostgreSQL](../compose/rails.md)                                 | Run a Dockerized Rails + PostgreSQL environment.          |
| [Riak](../engine/examples/running_riak_service.md)                        | Run a Dockerized Riak instance.                           |
| [SSHd](../engine/examples/running_ssh_service.md)                         | Run a Dockerized SSHd instance.                           |
| [WordPress](../compose/wordpress.md)                                      | Quickstart: Compose and WordPress.                        |
@y
{% comment %}
| Sample                                                                    | Description                                               |
| ------------------------------------------------------------------------- | --------------------------------------------------------- |
| [apt-cacher-ng](../engine/examples/apt-cacher-ng.md)                      | Run a Dockerized apt-cacher-ng instance.                  |
| [.Net Core application](../engine/examples/dotnetcore.md)                 | Run a Dockerized ASP.NET Core application.                |
| [ASP.NET Core + SQL Server on Linux](../compose/aspnet-mssql-compose.md)  | Run a Dockerized ASP.NET Core + SQL Server environment.   |
| [CouchDB](../engine/examples/couchdb_data_volumes.md)                     | Run a Dockerized CouchDB instance.                        |
| [Django + PostgreSQL](../compose/django.md)                               | Run a Dockerized Django + PostgreSQL environment.         |
| [PostgreSQL](../engine/examples/postgresql_service.md)                    | Run a Dockerized PostgreSQL instance.                     |
| [Rails + PostgreSQL](../compose/rails.md)                                 | Run a Dockerized Rails + PostgreSQL environment.          |
| [Riak](../engine/examples/running_riak_service.md)                        | Run a Dockerized Riak instance.                           |
| [SSHd](../engine/examples/running_ssh_service.md)                         | Run a Dockerized SSHd instance.                           |
| [WordPress](../compose/wordpress.md)                                      | Quickstart: Compose and WordPress.                        |
{% endcomment %}
| サンプル                                                                  | 内容説明                                                          |
| ------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| [apt-cacher-ng](../engine/examples/apt-cacher-ng.md)                      | Docker 化された apt-cacher-ng インスタンスを実行します。          |
| [.Net Core application](../engine/examples/dotnetcore.md)                 | Docker 化された ASP.NET Core アプリケーションを実行します。       |
| [ASP.NET Core + SQL Server on Linux](../compose/aspnet-mssql-compose.md)  | Docker 化された ASP.NET Core および SQL サーバー環境を実行します。|
| [CouchDB](../engine/examples/couchdb_data_volumes.md)                     | Docker 化された CouchDB インスタンスを実行します。                |
| [Django + PostgreSQL](../compose/django.md)                               | Docker 化された Django および PostgreSQL 環境を実行します。       |
| [PostgreSQL](../engine/examples/postgresql_service.md)                    | Docker 化された PostgreSQL インスタンスを実行します。             |
| [Rails + PostgreSQL](../compose/rails.md)                                 | Docker 化された Rails および PostgreSQL 環境を実行します。        |
| [Riak](../engine/examples/running_riak_service.md)                        | Docker 化された Riak インスタンスを実行します。                   |
| [SSHd](../engine/examples/running_ssh_service.md)                         | Docker 化された SSHd インスタンスを実行します。                   |
| [WordPress](../compose/wordpress.md)                                      | クイックスタート: Compose と WordPress。                          |
@z

@x
## Library references
@y
{% comment %}
## Library references
{% endcomment %}
{: #library-references }
## ライブラリリファレンス
@z

@x
The following table provides a list of popular official Docker images. For detailed documentation, select the specific image name. 
@y
{% comment %}
The following table provides a list of popular official Docker images. For detailed documentation, select the specific image name. 
{% endcomment %}
The following table provides a list of popular official Docker images. For detailed documentation, select the specific image name. 
@z

@x
| Image name | Description |
| ---------- | ----------- |
@y
{% comment %}
| Image name | Description |
| ---------- | ----------- |
{% endcomment %}
| イメージ名 | 内容説明    |
| ---------- | ----------- |
@z

@x
{% for page in site.samples %}| [{{ page.title }}](https://hub.docker.com/_/{{ page.title }}){: target="_blank"} | {{ page.description | strip }} |
{% endfor %}
@y
{% for page in site.samples %}| [{{ page.title }}](https://hub.docker.com/_/{{ page.title }}){: target="_blank"} | {{ page.description | strip }} |
{% endfor %}
@z
