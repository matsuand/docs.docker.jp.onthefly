%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Copy files among machines
keywords: machine, scp, subcommand
title: docker-machine scp
hide_from_sitemap: true
---
@y
---
description: マシン間でファイルをコピーします。
keywords: machine, scp, subcommand
title: docker-machine scp
hide_from_sitemap: true
---
@z

@x
Copy files from your local host to a machine, from machine to machine, or from a
machine to your local host using `scp`.
@y
{% comment %}
Copy files from your local host to a machine, from machine to machine, or from a
machine to your local host using `scp`.
{% endcomment %}
`scp` を使ってファイルをコピーします。
ホストからマシンへ、マシン間で、マシンからホストへコピーを行います。
@z

@x
The notation is `machinename:/path/to/files` for the arguments; in the host
machine's case, you don't need to specify the name, just the path.
@y
{% comment %}
The notation is `machinename:/path/to/files` for the arguments; in the host
machine's case, you don't need to specify the name, just the path.
{% endcomment %}
引数の記述書式は `machinename:/path/to/files` とします。
ホストマシンである場合、マシン名の指定は不要であり、パスの指定だけで十分です。
@z

@x
## Example
@y
{% comment %}
## Example
{% endcomment %}
{: #example }
## 利用例
@z

@x
Consider the following example:
@y
{% comment %}
Consider the following example:
{% endcomment %}
以下に示す利用例を見てみます。
@z

@x
```bash
$ cat foo.txt
cat: foo.txt: No such file or directory
@y
```bash
$ cat foo.txt
cat: foo.txt: No such file or directory
@z

@x
$ docker-machine ssh dev pwd
/home/docker
@y
$ docker-machine ssh dev pwd
/home/docker
@z

@x
$ docker-machine ssh dev 'echo A file created remotely! >foo.txt'
$ docker-machine scp dev:/home/docker/foo.txt .
foo.txt                                                           100%   28     0.0KB/s   00:00
$ cat foo.txt
A file created remotely!
```
@y
$ docker-machine ssh dev 'echo A file created remotely! >foo.txt'
$ docker-machine scp dev:/home/docker/foo.txt .
foo.txt                                                           100%   28     0.0KB/s   00:00
$ cat foo.txt
A file created remotely!
```
@z

@x
Just like how `scp` has a `-r` flag for copying files recursively,
`docker-machine` has a `-r` flag for this feature.
@y
{% comment %}
Just like how `scp` has a `-r` flag for copying files recursively,
`docker-machine` has a `-r` flag for this feature.
{% endcomment %}
`scp` において、ファイルを再帰的にコピーする `-r` フラグがあるのと同様に、`docker-machine` にも同じ機能の `-r` フラグがあります。
@z

@x
In the case of transferring files from machine to machine,
they go through the local host's filesystem first (using `scp`'s `-3` flag).
@y
{% comment %}
In the case of transferring files from machine to machine,
they go through the local host's filesystem first (using `scp`'s `-3` flag).
{% endcomment %}
マシン間でのファイルコピーの場合、コピーされるファイルはローカルホストのファイルシステムを経由します。
（`scp` の `-3` フラグが利用されます。）
@z

@x
When transferring large files or updating directories with lots of files,
you can use the `-d` flag, which uses `rsync` to transfer deltas instead of
transferring all of the files.
@y
{% comment %}
When transferring large files or updating directories with lots of files,
you can use the `-d` flag, which uses `rsync` to transfer deltas instead of
transferring all of the files.
{% endcomment %}
大容量ファイルをコピーしたり、大量のファイルを含むディレクトリを更新したりする場合は `-d ` フラグを利用します。
これによって全ファイルをコピーするのではなく、`rsync` を使って差分をコピーすることになります。
@z

@x
When transferring directories and not just files, avoid rsync surprises
by using trailing slashes on both the source and destination. For example:
@y
{% comment %}
When transferring directories and not just files, avoid rsync surprises
by using trailing slashes on both the source and destination. For example:
{% endcomment %}
ファイルだけでなくディレクトリをコピーする場合は、rsync が誤動作しないように、コピー元、コピー先ともに最後にスラッシュをつけるようにします。
たとえば以下のとおりです。
@z

@x
```bash
$ mkdir -p bar
$ touch bar/baz
$ docker-machine scp -r -d bar/ dev:/home/docker/bar/
$ docker-machine ssh dev ls bar
baz
```
@y
```bash
$ mkdir -p bar
$ touch bar/baz
$ docker-machine scp -r -d bar/ dev:/home/docker/bar/
$ docker-machine ssh dev ls bar
baz
```
@z

@x
## Specifying file paths for remote deployments
@y
{% comment %}
## Specifying file paths for remote deployments
{% endcomment %}
{: #specifying-file-paths-for-remote-deployments }
## リモートデプロイ時のファイルパス指定
@z

@x
When you copy files to a remote server with `docker-machine scp` for app
deployment, make sure `docker-compose` and the Docker daemon know how to find
them. Avoid using relative paths, but specify absolute paths in
[Compose files](../../compose/compose-file/index.md). It's best to specify absolute
paths both for the location on the Docker daemon and within the container.
@y
{% comment %}
When you copy files to a remote server with `docker-machine scp` for app
deployment, make sure `docker-compose` and the Docker daemon know how to find
them. Avoid using relative paths, but specify absolute paths in
[Compose files](../../compose/compose-file/index.md). It's best to specify absolute
paths both for the location on the Docker daemon and within the container.
{% endcomment %}
アプリのデプロイのため `docker-machine scp` を使ってリモートサーバーへファイルコピーを行う場合、`docker-compose` や Docker デーモンがコピーするファイルを探し出せるようにしておくことが重要です。
[Compose ファイル](../../compose/compose-file/index.md) 内に絶対パスが指定されていながら、コピー時に相対パスを使うことはやめてください。
Docker デーモンとコンテナー内部におけるパス指定には、ともに絶対パスとすることが適切です。
@z

@x
For example, imagine you want to transfer your local directory
`/Users/<username>/webapp` to a remote machine and bind mount it into a
container on the remote host. If the remote user is `ubuntu`, use a command like
this:
@y
{% comment %}
For example, imagine you want to transfer your local directory
`/Users/<username>/webapp` to a remote machine and bind mount it into a
container on the remote host. If the remote user is `ubuntu`, use a command like
this:
{% endcomment %}
たとえばローカルディレクトリ `/Users/<ユーザー名>/webapp` をリモートマシンにコピーし、リモートホスト上のコンテナーに対してバインドマウントを行うとします。
リモートユーザー名が `ubuntu` であるとすると、以下のようなコマンド実行となります。
@z

@x
```bash
$ docker-machine scp -r /Users/<username>/webapp MACHINE-NAME:/home/ubuntu/webapp
```
@y
{% comment %}
```bash
$ docker-machine scp -r /Users/<username>/webapp MACHINE-NAME:/home/ubuntu/webapp
```
{% endcomment %}
```bash
$ docker-machine scp -r /Users/<ユーザー名>/webapp マシン名:/home/ubuntu/webapp
```
@z

@x
Then write a docker-compose file that bind mounts it in:
@y
{% comment %}
Then write a docker-compose file that bind mounts it in:
{% endcomment %}
そして docker-compose ファイルには、バインドマウントを行う以下のような記述を行います。
@z

@x
```none
version: "3.1"
services:
  webapp:
    image: alpine
    command: cat /app/root.php
    volumes:
    - "/home/ubuntu/webapp:/app"
```
@y
```none
version: "3.1"
services:
  webapp:
    image: alpine
    command: cat /app/root.php
    volumes:
    - "/home/ubuntu/webapp:/app"
```
@z

@x
And we can try it out like so:
@y
{% comment %}
And we can try it out like so:
{% endcomment %}
以下のようにしてこれを実行します。
@z

@x
```bash
$ eval $(docker-machine env MACHINE-NAME)
$ docker-compose run webapp
```
@y
{% comment %}
```bash
$ eval $(docker-machine env MACHINE-NAME)
$ docker-compose run webapp
```
{% endcomment %}
```bash
$ eval $(docker-machine env マシン名)
$ docker-compose run webapp
```
@z
