%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Build or rebuild services.
keywords: fig, composition, compose, docker, orchestration, cli, build
title: docker-compose build
notoc: true

---
@y
---
description: サービスのビルドまたは再ビルド。
keywords: fig, composition, compose, docker, orchestration, cli, build
title: docker-compose build
notoc: true

---
@z

@x
```none
Usage: build [options] [--build-arg key=val...] [SERVICE...]

Options:
    --build-arg key=val     Set build-time variables for services.
    --compress              Compress the build context using gzip.
    --force-rm              Always remove intermediate containers.
    -m, --memory MEM        Set memory limit for the build container.
    --no-cache              Do not use cache when building the image.
    --no-rm                 Do not remove intermediate containers after a successful build.
    --parallel              Build images in parallel.
    --progress string       Set type of progress output (`auto`, `plain`, `tty`).
    --pull                  Always attempt to pull a newer version of the image.
    -q, --quiet             Don't print anything to `STDOUT`.
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
Usage: build [options] [--build-arg key=val...] [SERVICE...]

Options:
    --build-arg key=val     Set build-time variables for services.
    --compress              Compress the build context using gzip.
    --force-rm              Always remove intermediate containers.
    -m, --memory MEM        Set memory limit for the build container.
    --no-cache              Do not use cache when building the image.
    --no-rm                 Do not remove intermediate containers after a successful build.
    --parallel              Build images in parallel.
    --progress string       Set type of progress output (`auto`, `plain`, `tty`).
    --pull                  Always attempt to pull a newer version of the image.
    -q, --quiet             Don't print anything to `STDOUT`.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: build [オプション] [--build-arg key=val...] [SERVICE...]

オプション:
    --build-arg key=val     サービスに対してビルド時の変数を設定します。
    --compress              gzip を使ってビルドコンテキストを圧縮します。
    --force-rm              常に中間コンテナーは削除します。
    -m, --memory MEM        ビルドするコンテナーのメモリ上限を設定します。
    --no-cache              イメージビルド時にキャッシュを使用しません。
    --no-rm                 ビルド生成後に中間コンテナーを削除しません。
    --parallel              並行的にイメージをビルドします。
    --progress string       処理経過の出力タイプ。（`auto`、`plain`、`tty`）
    --pull                  プルを行う際に常に最新版のイメージの取得を試みます。
    -q, --quiet             `STDOUT` に何も出力しません。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Services are built once and then tagged, by default as `project_service`. For
example, `composetest_db`. If the Compose file specifies an
[image](../compose-file/compose-file-v3.md#image) name, the image is
tagged with that name, substituting any variables beforehand. See
[variable substitution](../compose-file/compose-file-v3.md#variable-substitution).
@y
サービスは`プロジェクト名_サービス`として構築時にタグ付けられます。
例えば`composetest_db`です。
Compose ファイルが[イメージ](../compose-file/compose-file-v3.md#image) 名を指定している場合、イメージはその名称によってタグづけされます。変数が用いられている場合は、あらかじめ置換されます。
これについては[変数置換](../compose-file/compose-file-v3.md#variable-substitution) を参照してください。
@z

@x
If you change a service's Dockerfile or the contents of its
build directory, run `docker-compose build` to rebuild it.
@y
サービスの Dockerfile やビルドディレクトリの内容を変更する場合は、`docker-compose build`を実行して再ビルドします。
@z

@x
## Native build using the docker CLI
@y
{: #native-build-using-the-docker-cli }
## Docker CLI を利用したネイティブビルド
@z

@x
Compose by default uses the `docker` CLI to perform builds (also known as "native
build"). By using the `docker` CLI, Compose can take advantage of features such
as [BuildKit](../../develop/develop-images/build_enhancements.md), which are not
supported by Compose itself. BuildKit is enabled by default on Docker Desktop,
but requires the `DOCKER_BUILDKIT=1` environment variable to be set on other
platforms.
@y
Compose ではデフォルトで`docker`CLI を利用してビルドを実現しています（これは「ネイティブビルド」と呼ばれます）。
`docker`CLI を利用することによって、[BuildKit](../../develop/develop-images/build_enhancements.md) のような機能を活用できることになります。
そのような機能は Compose そのものにおいてはサポートされていません。
BuildKit は Docker Desktop においてはデフォルトで有効になっています。
しかしこれ以外のプラットフォームでは環境変数`DOCKER_BUILDKIT=1`を設定しておくことが必要になります。
@z

@x
Refer to the [Compose CLI environment variables](envvars.md#compose_docker_cli_build)
section to learn how to switch between "native build" and "compose build".
@y
「ネイティブビルド」と「Compose ビルド」を切り替える方法については [Compose CLI 環境変数](envvars.md#compose_docker_cli_build) の節を参照してください。
@z
