%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Samples
description: Learn how to develop and ship containerized applications, by walking through samples that exhibits canonical practices.
redirect_from:
- /en/latest/examples/
- /engine/examples/
- /examples/
---
@y
---
title: サンプル集
description: Learn how to develop and ship containerized applications, by walking through samples that exhibits canonical practices.
redirect_from:
- /en/latest/examples/
- /engine/examples/
- /examples/
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
{: #tutorial-labs }
## チュートリアルラボ
@z

@x
Learn how to develop and ship containerized applications, by walking through a
sample that exhibits canonical practices. These labs are from the [Docker Labs
repository]({{ labsbase }}).
@y
Learn how to develop and ship containerized applications, by walking through a
sample that exhibits canonical practices. These labs are from the [Docker Labs
repository]({{ labsbase }}).
@z

@x
| Sample                                                                                                                | Description                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| [Docker for Beginners]({{ labsbase }}/beginner/){: target="_blank"}                                                   | A good "Docker 101" course.                                                                                                                 |
| [Docker Swarm mode]({{ labsbase}}/swarm-mode){: target="_blank"}                                                      | Use Docker for natively managing a cluster of Docker Engines called a swarm.                                                                |
| [Configuring developer tools and programming languages]({{ labsbase }}/developer-tools/README.md){: target="_blank"}  | How to set-up and use common developer tools and programming languages with Docker.                                                         |
| [Live Debugging Java with Docker]({{ labsbase }}/developer-tools/java-debugging){: target="_blank"}                   | Java developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Docker for Java Developers]({{ labsbase }}/developer-tools/java/){: target="_blank"}                                 | Offers Java developers an intro-level and self-paced hands-on workshop with Docker.                                                         |
| [Live Debugging a Node.js application in Docker]({{ labsbase }}/developer-tools/nodejs-debugging){: target="_blank"}  | Node developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Dockerizing a Node.js application]({{ labsbase }}/developer-tools/nodejs/porting/){: target="_blank"}                | This tutorial starts with a simple Node.js application and details the steps needed to Dockerize it and ensure its scalability.             |
| [Docker for ASP.NET and Windows containers]({{ labsbase }}/windows/readme.md){: target="_blank"}                      | Docker supports Windows containers, too! Learn how to run ASP.NET, SQL Server, and more in these tutorials.                                 |
| [Docker Security]({{ labsbase }}/security/README.md){: target="_blank"}                                               | How to take advantage of Docker security features.                                                                                          |
| [Building a 12-factor application with Docker]({{ labsbase}}/12factor){: target="_blank"}                             | Use Docker to create an app that conforms to Heroku's "12 factors for cloud-native applications."                                           |
@y
| サンプル                                                                                                              | 内容説明                                                                                                                                    |
| --------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| [Docker for Beginners]({{ labsbase }}/beginner/){: target="_blank"}                                                   | A good "Docker 101" course.                                                                                                                 |
| [Docker Swarm mode]({{ labsbase}}/swarm-mode){: target="_blank"}                                                      | Use Docker for natively managing a cluster of Docker Engines called a swarm.                                                                |
| [Configuring developer tools and programming languages]({{ labsbase }}/developer-tools/README.md){: target="_blank"}  | How to set-up and use common developer tools and programming languages with Docker.                                                         |
| [Live Debugging Java with Docker]({{ labsbase }}/developer-tools/java-debugging){: target="_blank"}                   | Java developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Docker for Java Developers]({{ labsbase }}/developer-tools/java/){: target="_blank"}                                 | Offers Java developers an intro-level and self-paced hands-on workshop with Docker.                                                         |
| [Live Debugging a Node.js application in Docker]({{ labsbase }}/developer-tools/nodejs-debugging){: target="_blank"}  | Node developers can use Docker to build a development environment where they can run, test, and live debug code running within a container. |
| [Dockerizing a Node.js application]({{ labsbase }}/developer-tools/nodejs/porting/){: target="_blank"}                | This tutorial starts with a simple Node.js application and details the steps needed to Dockerize it and ensure its scalability.             |
| [Docker for ASP.NET and Windows containers]({{ labsbase }}/windows/readme.md){: target="_blank"}                      | Docker supports Windows containers, too! Learn how to run ASP.NET, SQL Server, and more in these tutorials.                                 |
| [Docker Security]({{ labsbase }}/security/README.md){: target="_blank"}                                               | How to take advantage of Docker security features.                                                                                          |
| [Building a 12-factor application with Docker]({{ labsbase}}/12factor){: target="_blank"}                             | Use Docker to create an app that conforms to Heroku's "12 factors for cloud-native applications."                                           |
@z

@x
## Sample applications
@y
{: #sample-applications }
## サンプルアプリケーション
@z

@x
Run popular software using Docker.
@y
Docker を使って人気のあるソフトウェアを実行します。
@z

@x
| Sample                                                        | Description                                               |
| --------------------------------------------------------------| --------------------------------------------------------- |
| [apt-cacher-ng](apt-cacher-ng.md)                             | Run a Dockerized apt-cacher-ng instance.                  |
| [.Net Core application](dotnetcore.md)                        | Run a Dockerized ASP.NET Core application.                |
| [ASP.NET Core + SQL Server on Linux](aspnet-mssql-compose.md) | Run a Dockerized ASP.NET Core + SQL Server environment.   |
| [CouchDB](couchdb_data_volumes.md)                            | Run a Dockerized CouchDB instance.                        |
| [Django + PostgreSQL](django.md)                              | Run a Dockerized Django + PostgreSQL environment.         |
| [PostgreSQL](postgresql_service.md)                           | Run a Dockerized PostgreSQL instance.                     |
| [Rails + PostgreSQL](rails.md)                                | Run a Dockerized Rails + PostgreSQL environment.          |
| [Riak](running_riak_service.md)                               | Run a Dockerized Riak instance.                           |
| [SSHd](running_ssh_service.md)                                | Run a Dockerized SSHd instance.                           |
| [WordPress](wordpress.md)                                     | Quickstart: Compose and WordPress.                        |
@y
| サンプル                                                      | 内容説明                                                          |
| ------------------------------------------------------------------------- | ------------------------------------------------------|
| [apt-cacher-ng](apt-cacher-ng.md)                             | Docker 化された apt-cacher-ng インスタンスを実行します。          |
| [.Net Core application](dotnetcore.md)                        | Docker 化された ASP.NET Core アプリケーションを実行します。       |
| [ASP.NET Core + SQL Server on Linux](aspnet-mssql-compose.md) | Docker 化された ASP.NET Core および SQL サーバー環境を実行します。|
| [CouchDB](couchdb_data_volumes.md)                            | Docker 化された CouchDB インスタンスを実行します。                |
| [Django + PostgreSQL](django.md)                              | Docker 化された Django および PostgreSQL 環境を実行します。       |
| [PostgreSQL](postgresql_service.md)                           | Docker 化された PostgreSQL インスタンスを実行します。             |
| [Rails + PostgreSQL](rails.md)                                | Docker 化された Rails および PostgreSQL 環境を実行します。        |
| [Riak](running_riak_service.md)                               | Docker 化された Riak インスタンスを実行します。                   |
| [SSHd](running_ssh_service.md)                                | Docker 化された SSHd インスタンスを実行します。                   |
| [WordPress](wordpress.md)                                     | クイックスタート: Compose と WordPress。                          |
@z

@x
## Samples and documentation for official Docker images {#library-references}
@y
## Samples and documentation for official Docker images {#library-references}
@z

@x
For samples and detailed information about [official Docker images](../docker-hub/official_images.md),
refer to the documentation [for each image on Docker Hub](https://hub.docker.com/search?q=&type=image&image_filter=official){: target="_blank"}.
@y
## Samples and documentation for official Docker images {#library-references}

For samples and detailed information about [official Docker images](../docker-hub/official_images.md),
refer to the documentation [for each image on Docker Hub](https://hub.docker.com/search?q=&type=image&image_filter=official){: target="_blank"}.
@z
