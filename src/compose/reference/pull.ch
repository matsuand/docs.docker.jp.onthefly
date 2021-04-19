%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Pulls service images.
keywords: fig, composition, compose, docker, orchestration, cli,  pull
title: docker-compose pull
notoc: true
---
@y
---
description: Pulls service images.
keywords: fig, composition, compose, docker, orchestration, cli,  pull
title: docker-compose pull
notoc: true
---
@z

@x
```none
Usage: pull [options] [SERVICE...]

Options:
    --ignore-pull-failures  Pull what it can and ignores images with pull failures.
    --parallel              Deprecated, pull multiple images in parallel (enabled by default).
    --no-parallel           Disable parallel pulling.
    -q, --quiet             Pull without printing progress information
    --include-deps          Also pull services declared as dependencies
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```none
Usage: pull [options] [SERVICE...]

Options:
    --ignore-pull-failures  Pull what it can and ignores images with pull failures.
    --parallel              Deprecated, pull multiple images in parallel (enabled by default).
    --no-parallel           Disable parallel pulling.
    -q, --quiet             Pull without printing progress information
    --include-deps          Also pull services declared as dependencies
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: pull [オプション] [SERVICE...]

オプション:
    --ignore-pull-failures  可能なものはプルし、失敗するものは無視します。
    --parallel              非推奨。マルチイメージを並行的にプルします。（デフォルトは有効）
    --no-parallel           並行的なプルを無効にします。
    -q, --quiet             処理過程に関する情報を表示せずにプルします。
    --include-deps          依存するものとして宣言されたサービスもプルします。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Pulls an image associated with a service defined in a `docker-compose.yml` or `docker-stack.yml` file, but does not start containers based on those images.
@y
`docker-compose.yml`や`docker-stack.yml`ファイル内に定義されているサービスに関連したイメージをプルします。
ただしそのイメージに基づいたコンテナーの起動は行いません。
@z

@x
For example, suppose you have this `docker-compose.yml` file from the [Quickstart: Compose and Rails](../../samples/rails.md) sample.
@y
たとえば [クイックスタート： Compose と Rails](../../samples/rails.md) の例に示している、以下のような`docker-compose.yml`ファイルがあるとします。
@z

@x
```yaml
version: '2'
services:
  db:
    image: postgres
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```
@y
```yaml
version: '2'
services:
  db:
    image: postgres
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```
@z

@x
If you run `docker-compose pull ServiceName` in the same directory as the `docker-compose.yml` file that defines the service, Docker pulls the associated image. For example, to call the `postgres` image configured as the `db` service in our example, you would run `docker-compose pull db`.
@y
サービス定義を行っている`docker-compose.yml`ファイルと同じディレクトリ内において`docker-compose pull ServiceName`を実行すると、Docker は関連するイメージをプルします。
たとえばこの例において`db`サービスとして設定されている`postgres`イメージをプルするには`docker-compose pull db`を実行します。
@z

@x
```bash
$ docker-compose pull db
Pulling db (postgres:latest)...
latest: Pulling from library/postgres
cd0a524342ef: Pull complete
9c784d04dcb0: Pull complete
d99dddf7e662: Pull complete
e5bff71e3ce6: Pull complete
cb3e0a865488: Pull complete
31295d654cd5: Pull complete
fc930a4e09f5: Pull complete
8650cce8ef01: Pull complete
61949acd8e52: Pull complete
527a203588c0: Pull complete
26dec14ac775: Pull complete
0efc0ed5a9e5: Pull complete
40cd26695b38: Pull complete
Digest: sha256:fd6c0e2a9d053bebb294bb13765b3e01be7817bf77b01d58c2377ff27a4a46dc
Status: Downloaded newer image for postgres:latest
```
@y
```bash
$ docker-compose pull db
Pulling db (postgres:latest)...
latest: Pulling from library/postgres
cd0a524342ef: Pull complete
9c784d04dcb0: Pull complete
d99dddf7e662: Pull complete
e5bff71e3ce6: Pull complete
cb3e0a865488: Pull complete
31295d654cd5: Pull complete
fc930a4e09f5: Pull complete
8650cce8ef01: Pull complete
61949acd8e52: Pull complete
527a203588c0: Pull complete
26dec14ac775: Pull complete
0efc0ed5a9e5: Pull complete
40cd26695b38: Pull complete
Digest: sha256:fd6c0e2a9d053bebb294bb13765b3e01be7817bf77b01d58c2377ff27a4a46dc
Status: Downloaded newer image for postgres:latest
```
@z
