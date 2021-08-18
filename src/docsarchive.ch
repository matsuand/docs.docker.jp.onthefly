%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: View the docs archives
---
@y
---
title: ドキュメントアーカイブの参照
---
@z

@x
This page lists the various ways you can view the docs as they were when a
prior version of Docker was shipped.
@y
ここでは、かつて Docker が公開した過去のドキュメントを参照する方法について説明します。
@z

@x
To view the docs offline on your local machine, run:
@y
ローカルマシンにおいてオフラインでドキュメントを参照するには以下を実行します。
@z

@x
```console
$ docker run -ti -p 4000:4000 {{ archive.image }}
```
@y
```console
$ docker run -ti -p 4000:4000 {{ archive.image }}
```
@z

@x
## Accessing unsupported archived documentation
@y
{: #accessing-unsupported-archived-documentation }
## サポートされていないアーカイブドキュメントへのアクセス
@z

@x
If you are using a version of the documentation that is no longer supported,
you can still access that documentation in the following ways:
@y
利用するドキュメントがもうサポートされていない場合でも、以下の方法によってそういったドキュメントにアクセスすることができます。
@z

@x
- By entering your version number and selecting it from the branch selection list for this repo
- By directly accessing the Github URL for your version. For example, https://github.com/docker/docker.github.io/tree/v1.9 for `v1.9`
- By running a container of the specific [tag for your documentation version](https://hub.docker.com/r/docs/docker.github.io)
  in Docker Hub. For example, run the following to access `v1.9`:
@y
- バージョン番号を入力することで、リポジトリのブランチリストの中からそのバージョンを選びます。
- GitHub URL に対してそのバージョンを直接アクセスします。
  たとえば`v1.9`であれば https://github.com/docker/docker.github.io/tree/v1.9 とします。
- Docker Hub の中から、[そのドキュメントバージョンのタグ](https://hub.docker.com/r/docs/docker.github.io) を指定したコンテナーを起動します。
  たとえば`v1.9`であれば以下のように実行します。
@z

@x
```console
$ docker run  -it -p 4000:4000 docs/docker.github.io:v1.9
```
@y
```console
$ docker run  -it -p 4000:4000 docs/docker.github.io:v1.9
```
@z
