%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Running and installing a PostgreSQL service
keywords: docker, example, package installation, postgresql
title: Dockerize PostgreSQL
redirect_from:
  - /engine/examples/postgresql_service/
---
@y
---
description: Running and installing a PostgreSQL service
keywords: docker, example, package installation, postgresql
title: PostgreSQL を Docker 化する
redirect_from:
  - /engine/examples/postgresql_service/
---
@z

@x
## Install PostgreSQL on Docker
@y
{: #install-postgresql-on-Docker }
## Docker での PostgreSQL インストール
@z

@x
Assuming there is no Docker image that suits your needs on the [Docker
Hub](https://hub.docker.com), you can create one yourself.
@y
条件に合う Docker イメージが [Docker Hub](https://hub.docker.com) にはなかったと仮定して、自分で作ることにします。
@z

@x
Start by creating a new `Dockerfile`:
@y
新たに`Dockerfile`を作るところから始めます。
@z

@x
> **Note**:
This PostgreSQL setup is for development-only purposes. Refer to the
PostgreSQL documentation to fine-tune these settings so that it is
suitably secure.
@y
> **メモ**
>
> この PostgreSQL 環境の構築は、単に開発目的で行うものです。
> PostgreSQL に対する設定が、適切に安全なものに
> Refer to the
> PostgreSQL documentation to fine-tune these settings so that it is
> suitably secure.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:16.04
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:16.04
@z

@x
# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
@y
# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
@z

@x
# Add PostgreSQL's repository. It contains the most recent stable release
#  of PostgreSQL.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
@y
# Add PostgreSQL's repository. It contains the most recent stable release
#  of PostgreSQL.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
@z

@x
# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3
@y
# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3
@z

@x
# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``
@y
# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``
@z

@x
# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres
@y
# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres
@z

@x
# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker
@y
# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker
@z

@x
# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
@y
# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
@z

@x
# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
@y
# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
@z

@x
# Expose the PostgreSQL port
EXPOSE 5432
@y
# Expose the PostgreSQL port
EXPOSE 5432
@z

@x
# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
@y
# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
@z

@x
# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
```
@y
# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
```
@z

@x
Build an image from the Dockerfile and assign it a name.
@y
Dockerfile からイメージをビルドして名前を与えます。
@z

@x
```console
$ docker build -t eg_postgresql .
```
@y
```console
$ docker build -t eg_postgresql .
```
@z

@x
Run the PostgreSQL server container (in the foreground):
@y
PostgreSQL サーバーコンテナーを（フォアグラウンドで）実行します。
@z

@x
```console
$ docker run --rm -P --name pg_test eg_postgresql
```
@y
```console
$ docker run --rm -P --name pg_test eg_postgresql
```
@z

@x
There are two ways to connect to the PostgreSQL server. We can use
[*Link Containers*](../network/links.md),
or we can access it from our host (or the network).
@y
PostgreSQL サーバーへの接続方法は２通りあります。
[**リンクコンテナー**](../network/links.md) を使うか、ホスト（あるいはネットワーク）からアクセスします。
@z

@x
> **Note**: The `--rm` removes the container and its image when
the container exits successfully.
@y
> **メモ**
>
> `--rm`は、コンテナーが正常終了したときに、コンテナーとそのイメージを削除するものです。
@z

@x
### Use container linking
@y
{: #use-container-linking }
### コンテナーリンクの利用
@z

@x
Containers can be linked to another container's ports directly using
`--link remote_name:local_alias` in the client's
`docker run`. This sets a number of environment
variables that can then be used to connect:
@y
Containers can be linked to another container's ports directly using
`--link remote_name:local_alias` in the client's
`docker run`. This sets a number of environment
variables that can then be used to connect:
@z

@x
```console
$ docker run --rm -t -i --link pg_test:pg eg_postgresql bash
@y
```console
$ docker run --rm -t -i --link pg_test:pg eg_postgresql bash
@z

@x
postgres@7ef98b1b7243:/$ psql -h $PG_PORT_5432_TCP_ADDR -p $PG_PORT_5432_TCP_PORT -d docker -U docker --password
```
@y
postgres@7ef98b1b7243:/$ psql -h $PG_PORT_5432_TCP_ADDR -p $PG_PORT_5432_TCP_PORT -d docker -U docker --password
```
@z

@x
### Connect from your host system
@y
{: #connect-from-your-host-system }
### ホストシステムからの接続
@z

@x
Assuming you have the postgresql-client installed, you can use the
host-mapped port to test as well. You need to use `docker ps`
to find out what local host port the container is mapped to
first:
@y
Assuming you have the postgresql-client installed, you can use the
host-mapped port to test as well. You need to use `docker ps`
to find out what local host port the container is mapped to
first:
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS              PORTS                                      NAMES
5e24362f27f6        eg_postgresql:latest   /usr/lib/postgresql/   About an hour ago   Up About an hour    0.0.0.0:49153->5432/tcp                    pg_test
@y
CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS              PORTS                                      NAMES
5e24362f27f6        eg_postgresql:latest   /usr/lib/postgresql/   About an hour ago   Up About an hour    0.0.0.0:49153->5432/tcp                    pg_test
@z

@x
$ psql -h localhost -p 49153 -d docker -U docker --password
```
@y
$ psql -h localhost -p 49153 -d docker -U docker --password
```
@z

@x
### Test the database
@y
{: #test-the-database }
### データベースの動作確認
@z

@x
Once you have authenticated and have a `docker =#`
prompt, you can create a table and populate it.
@y
Once you have authenticated and have a `docker =#`
prompt, you can create a table and populate it.
@z

@x
```sql
psql (9.3.1)
Type "help" for help.
@y
```sql
psql (9.3.1)
Type "help" for help.
@z

@x
$ docker=# CREATE TABLE cities (
docker(#     name            varchar(80),
docker(#     location        point
docker(# );
CREATE TABLE
$ docker=# INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');
INSERT 0 1
$ docker=# select * from cities;
     name      | location
---------------+-----------
 San Francisco | (-194,53)
(1 row)
```
@y
$ docker=# CREATE TABLE cities (
docker(#     name            varchar(80),
docker(#     location        point
docker(# );
CREATE TABLE
$ docker=# INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');
INSERT 0 1
$ docker=# select * from cities;
     name      | location
---------------+-----------
 San Francisco | (-194,53)
(1 row)
```
@z

@x
### Use the container volumes
@y
{: #use-the-container-volumes }
### コンテナーボリュームの利用
@z

@x
You can use the defined volumes to inspect the PostgreSQL log files and
to backup your configuration and data:
@y
You can use the defined volumes to inspect the PostgreSQL log files and
to backup your configuration and data:
@z

@x
```console
$ docker run --rm --volumes-from pg_test -t -i busybox sh
@y
```console
$ docker run --rm --volumes-from pg_test -t -i busybox sh
@z

@x
/ # ls
bin      etc      lib      linuxrc  mnt      proc     run      sys      usr
dev      home     lib64    media    opt      root     sbin     tmp      var
/ # ls /etc/postgresql/9.3/main/
environment      pg_hba.conf      postgresql.conf
pg_ctl.conf      pg_ident.conf    start.conf
/tmp # ls /var/log
ldconfig    postgresql
```
@y
/ # ls
bin      etc      lib      linuxrc  mnt      proc     run      sys      usr
dev      home     lib64    media    opt      root     sbin     tmp      var
/ # ls /etc/postgresql/9.3/main/
environment      pg_hba.conf      postgresql.conf
pg_ctl.conf      pg_ident.conf    start.conf
/tmp # ls /var/log
ldconfig    postgresql
```
@z
