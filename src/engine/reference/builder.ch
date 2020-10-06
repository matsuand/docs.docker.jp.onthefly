%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "Dockerfiles use a simple DSL which allows you to automate the steps you would normally manually take to create an image."
keywords: "builder, docker, Dockerfile, automation, image creation"
redirect_from:
- /reference/builder/
---
@y
---
description: "Dockerfile では単純な DSL を使って、通常なら手動で行うイメージ生成手順を自動化します。"
keywords: "builder, docker, Dockerfile, automation, image creation"
redirect_from:
- /reference/builder/
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
# Dockerfile reference
@y
{% comment %}
# Dockerfile reference
{% endcomment %}
# Dockerfile リファレンス
{: #dockerfile-reference }
@z

@x
Docker can build images automatically by reading the instructions from a
`Dockerfile`. A `Dockerfile` is a text document that contains all the commands a
user could call on the command line to assemble an image. Using `docker build`
users can create an automated build that executes several command-line
instructions in succession.
@y
{% comment %}
Docker can build images automatically by reading the instructions from a
`Dockerfile`. A `Dockerfile` is a text document that contains all the commands a
user could call on the command line to assemble an image. Using `docker build`
users can create an automated build that executes several command-line
instructions in succession.
{% endcomment %}
Docker は `Dockerfile` から命令を読み込んで、自動的にイメージをビルドします。
`Dockerfile` はテキストファイルであり、イメージを作り上げるために実行するコマンドラインコマンドを、すべてこのファイルに含めることができます。
`docker build` を実行すると、順次コマンドライン命令を自動化した処理が行われて、ビルド結果となるイメージが得られます。
@z

@x
This page describes the commands you can use in a `Dockerfile`. When you are
done reading this page, refer to the [`Dockerfile` Best
Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) for a tip-oriented guide.
@y
{% comment %}
This page describes the commands you can use in a `Dockerfile`. When you are
done reading this page, refer to the [`Dockerfile` Best
Practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) for a tip-oriented guide.
{% endcomment %}
ここでは `Dockerfile` において利用可能なコマンドを説明します。
このページを読み終えたら、さまざまなガイドとなる [`Dockerfile` ベストプラクティス](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)を参照してください。
@z

@x
## Usage
@y
{% comment %}
## Usage
{% endcomment %}
{: #usage }
## 利用方法
@z

@x
The [docker build](commandline/build.md) command builds an image from
a `Dockerfile` and a *context*. The build's context is the set of files at a
specified location `PATH` or `URL`. The `PATH` is a directory on your local
filesystem. The `URL` is a Git repository location.
@y
{% comment %}
The [docker build](commandline/build.md) command builds an image from
a `Dockerfile` and a *context*. The build's context is the set of files at a
specified location `PATH` or `URL`. The `PATH` is a directory on your local
filesystem. The `URL` is a Git repository location.
{% endcomment %}
[docker build](commandline/build.md)コマンドは、`Dockerfile` と**コンテキスト**（context）からイメージをビルドします。
ビルドにおけるコンテキストとは、指定された`PATH`または`URL`にある一連のファイルのことです。
`PATH`はローカルファイルシステム内のディレクトリを表わします。
`URL`は Git のリポジトリ URL のことです。
@z

@x
A context is processed recursively. So, a `PATH` includes any subdirectories and
the `URL` includes the repository and its submodules. This example shows a
build command that uses the current directory as context:
@y
{% comment %}
A context is processed recursively. So, a `PATH` includes any subdirectories and
the `URL` includes the repository and its submodules. This example shows a
build command that uses the current directory as context:
{% endcomment %}
コンテキストは再帰的に処理されます。
つまり `PATH` の場合はサブディレクトリがすべて含まれ、`URL` の場合はリポジトリとそのサブモジュールが含まれます。
以下の例におけるビルドコマンドは、コンテキストとしてカレントディレクトリを用いるものです。
@z

@x
    $ docker build .
    Sending build context to Docker daemon  6.51 MB
    ...
@y
    $ docker build .
    Sending build context to Docker daemon  6.51 MB
    ...
@z

@x
The build is run by the Docker daemon, not by the CLI. The first thing a build
process does is send the entire context (recursively) to the daemon.  In most
cases, it's best to start with an empty directory as context and keep your
Dockerfile in that directory. Add only the files needed for building the
Dockerfile.
@y
{% comment %}
The build is run by the Docker daemon, not by the CLI. The first thing a build
process does is send the entire context (recursively) to the daemon.  In most
cases, it's best to start with an empty directory as context and keep your
Dockerfile in that directory. Add only the files needed for building the
Dockerfile.
{% endcomment %}
ビルド処理は Docker デーモンが行うものであって CLI により行われるものではありません。
ビルド処理の開始時にまず行われるのは、コンテキスト全体を（再帰的に）デーモンに送信することです。
普通はコンテキストとして空のディレクトリを用意して、そこに Dockerfile を置きます。
そのディレクトリへは、Dockerfile の構築に必要となるファイルのみを置くようにします。
@z

@x
>**Warning**: Do not use your root directory, `/`, as the `PATH` as it causes
>the build to transfer the entire contents of your hard drive to the Docker
>daemon.
@y
{% comment %}
>**Warning**: Do not use your root directory, `/`, as the `PATH` as it causes
>the build to transfer the entire contents of your hard drive to the Docker
>daemon.
{% endcomment %}
>**警告**: `PATH` に対して root ディレクトリ `/` を指定することはやめてください。
>これを行うとビルド時に Docker デーモンに対して、ハードディスクの内容すべてを送り込むことになってしまいます。
@z

@x
To use a file in the build context, the `Dockerfile` refers to the file specified
in an instruction, for example,  a `COPY` instruction. To increase the build's
performance, exclude files and directories by adding a `.dockerignore` file to
the context directory.  For information about how to [create a `.dockerignore`
file](#dockerignore-file) see the documentation on this page.
@y
{% comment %}
To use a file in the build context, the `Dockerfile` refers to the file specified
in an instruction, for example,  a `COPY` instruction. To increase the build's
performance, exclude files and directories by adding a `.dockerignore` file to
the context directory.  For information about how to [create a `.dockerignore`
file](#dockerignore-file) see the documentation on this page.
{% endcomment %}
ビルドコンテキスト内のファイルを利用する場合、`Dockerfile` では命令を記述する際にファイル参照を指定します。
たとえば `COPY` 命令の対象として参照します。
ビルド時の処理性能を上げるために、コンテキストディレクトリ内に `.dockerignore` ファイルを追加し、不要なファイルやディレクトリは除外するようにします。
詳しくはこのページ内の [`.dockerignore` ファイルの生成方法](#dockerignore-file)を参照してください。
@z

@x
Traditionally, the `Dockerfile` is called `Dockerfile` and located in the root
of the context. You use the `-f` flag with `docker build` to point to a Dockerfile
anywhere in your file system.
@y
{% comment %}
Traditionally, the `Dockerfile` is called `Dockerfile` and located in the root
of the context. You use the `-f` flag with `docker build` to point to a Dockerfile
anywhere in your file system.
{% endcomment %}
慣例として `Dockerfile` は `Dockerfile` と命名されています。
またこのファイルはコンテキストディレクトリのトップに置かれます。
`docker build` の `-f` フラグを用いれば、Dockerfile がファイルシステム内のどこにあっても指定することができます。
@z

@x
    $ docker build -f /path/to/a/Dockerfile .
@y
    $ docker build -f /path/to/a/Dockerfile .
@z

@x
You can specify a repository and tag at which to save the new image if
the build succeeds:
@y
{% comment %}
You can specify a repository and tag at which to save the new image if
the build succeeds:
{% endcomment %}
イメージのビルドが成功した後の保存先として、リポジトリとタグを指定することができます。
@z

@x
    $ docker build -t shykes/myapp .
@y
    $ docker build -t shykes/myapp .
@z

@x
To tag the image into multiple repositories after the build,
add multiple `-t` parameters when you run the `build` command:
@y
{% comment %}
To tag the image into multiple repositories after the build,
add multiple `-t` parameters when you run the `build` command:
{% endcomment %}
ビルドの際に複数のリポジトリに対してイメージをタグづけするには、`build` コマンドの実行時に `-t` パラメーターを複数指定します。
@z

@x
    $ docker build -t shykes/myapp:1.0.2 -t shykes/myapp:latest .
@y
    $ docker build -t shykes/myapp:1.0.2 -t shykes/myapp:latest .
@z

@x
Before the Docker daemon runs the instructions in the `Dockerfile`, it performs
a preliminary validation of the `Dockerfile` and returns an error if the syntax is incorrect:
@y
{% comment %}
Before the Docker daemon runs the instructions in the `Dockerfile`, it performs
a preliminary validation of the `Dockerfile` and returns an error if the syntax is incorrect:
{% endcomment %}
`Dockerfile` 内に記述されている命令を Docker デーモンが実行する際には、事前に `Dockerfile` が検証され、文法の誤りがある場合にはエラーが返されます。
@z

@x
    $ docker build -t test/myapp .
    Sending build context to Docker daemon 2.048 kB
    Error response from daemon: Unknown instruction: RUNCMD
@y
    $ docker build -t test/myapp .
    Sending build context to Docker daemon 2.048 kB
    Error response from daemon: Unknown instruction: RUNCMD
@z

@x
The Docker daemon runs the instructions in the `Dockerfile` one-by-one,
committing the result of each instruction
to a new image if necessary, before finally outputting the ID of your
new image. The Docker daemon will automatically clean up the context you
sent.
@y
{% comment %}
The Docker daemon runs the instructions in the `Dockerfile` one-by-one,
committing the result of each instruction
to a new image if necessary, before finally outputting the ID of your
new image. The Docker daemon will automatically clean up the context you
sent.
{% endcomment %}
Docker デーモンは `Dockerfile` 内の命令を 1 つずつ実行し、必要な場合にはビルドイメージ内にその処理結果を確定します。
最後にビルドイメージの ID を出力します。
Docker デーモンは、送信されたコンテキスト内容を自動的にクリアします。
@z

@x
Note that each instruction is run independently, and causes a new image
to be created - so `RUN cd /tmp` will not have any effect on the next
instructions.
@y
{% comment %}
Note that each instruction is run independently, and causes a new image
to be created - so `RUN cd /tmp` will not have any effect on the next
instructions.
{% endcomment %}
各命令は個別に実行されます。
それによって新たなイメージがビルドされます。
したがって、たとえば `RUN cd /tmp` を実行したとしても、次の命令には何の効果も与えません。
@z

@x
Whenever possible, Docker will re-use the intermediate images (cache),
to accelerate the `docker build` process significantly. This is indicated by
the `Using cache` message in the console output.
(For more information, see the [`Dockerfile` best practices guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/):
@y
{% comment %}
Whenever possible, Docker will re-use the intermediate images (cache),
to accelerate the `docker build` process significantly. This is indicated by
the `Using cache` message in the console output.
(For more information, see the [`Dockerfile` best practices guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/):
{% endcomment %}
Docker は可能な限り中間イメージ（キャッシュ）を再利用しようとします。
これは `docker build` 処理を速くするためです。
その場合は、端末画面に `Using cache` というメッセージが出力されます。
（詳細については [`Dockerfile` ベストプラクティスガイド](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)を参照してください。）
@z

@x
    $ docker build -t svendowideit/ambassador .
    Sending build context to Docker daemon 15.36 kB
    Step 1/4 : FROM alpine:3.2
     ---> 31f630c65071
    Step 2/4 : MAINTAINER SvenDowideit@home.org.au
     ---> Using cache
     ---> 2a1c91448f5f
    Step 3/4 : RUN apk update &&      apk add socat &&        rm -r /var/cache/
     ---> Using cache
     ---> 21ed6e7fbb73
    Step 4/4 : CMD env | grep _TCP= | (sed 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat -t 100000000 TCP4-LISTEN:\1,fork,reuseaddr TCP4:\2:\3 \&/' && echo wait) | sh
     ---> Using cache
     ---> 7ea8aef582cc
    Successfully built 7ea8aef582cc
@y
    $ docker build -t svendowideit/ambassador .
    Sending build context to Docker daemon 15.36 kB
    Step 1/4 : FROM alpine:3.2
     ---> 31f630c65071
    Step 2/4 : MAINTAINER SvenDowideit@home.org.au
     ---> Using cache
     ---> 2a1c91448f5f
    Step 3/4 : RUN apk update &&      apk add socat &&        rm -r /var/cache/
     ---> Using cache
     ---> 21ed6e7fbb73
    Step 4/4 : CMD env | grep _TCP= | (sed 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat -t 100000000 TCP4-LISTEN:\1,fork,reuseaddr TCP4:\2:\3 \&/' && echo wait) | sh
     ---> Using cache
     ---> 7ea8aef582cc
    Successfully built 7ea8aef582cc
@z

@x
Build cache is only used from images that have a local parent chain. This means
that these images were created by previous builds or the whole chain of images
was loaded with `docker load`. If you wish to use build cache of a specific
image you can specify it with `--cache-from` option. Images specified with
`--cache-from` do not need to have a parent chain and may be pulled from other
registries.
@y
{% comment %}
Build cache is only used from images that have a local parent chain. This means
that these images were created by previous builds or the whole chain of images
was loaded with `docker load`. If you wish to use build cache of a specific
image you can specify it with `--cache-from` option. Images specified with
`--cache-from` do not need to have a parent chain and may be pulled from other
registries.
{% endcomment %}
ビルドキャッシュは、ローカルにて親イメージへのつながりを持ったイメージからのみ利用されます。
利用されるイメージとはつまり、前回のビルドによって生成されたイメージか、あるいは `docker load` によってロードされたイメージのいずれかです。
ビルドキャッシュを特定のイメージから利用したい場合は `--cache-from` オプションを指定します。
`--cache-from` オプションが用いられた場合に、そのイメージは親イメージへのつながりを持っている必要はなく、他のレジストリから取得するイメージであっても構いません。
@z

@x
When you're done with your build, you're ready to look into [*Pushing a
repository to its registry*](https://docs.docker.com/engine/tutorials/dockerrepos/#/contributing-to-docker-hub).
@y
{% comment %}
When you're done with your build, you're ready to look into [*Pushing a
repository to its registry*](https://docs.docker.com/engine/tutorials/dockerrepos/#/contributing-to-docker-hub).
{% endcomment %}
ビルドに関する操作を終えたら、次は [*リポジトリをレジストリへプッシュ*](https://docs.docker.com/engine/tutorials/dockerrepos/#/contributing-to-docker-hub)を読んでみてください。
@z

@x
## BuildKit
@y
## BuildKit
@z

@x
Starting with version 18.09, Docker supports a new backend for executing your
builds that is provided by the [moby/buildkit](https://github.com/moby/buildkit)
project. The BuildKit backend provides many benefits compared to the old
implementation. For example, BuildKit can:
@y
{% comment %}
Starting with version 18.09, Docker supports a new backend for executing your
builds that is provided by the [moby/buildkit](https://github.com/moby/buildkit)
project. The BuildKit backend provides many benefits compared to the old
implementation. For example, BuildKit can:
{% endcomment %}
Docker バージョン 18.09 から Docker ではビルド処理時のバックエンドを新たにサポートするようになりました。
これは [moby/buildkit](https://github.com/moby/buildkit) プロジェクトから提供されます。
BuildKit バックエンドは、それまでの実装に比べて数々の利点があります。
たとえば以下のようなものです。
@z

@x
* Detect and skip executing unused build stages
* Parallelize building independent build stages
* Incrementally transfer only the changed files in your build context between builds
* Detect and skip transferring unused files in your build context
* Use external Dockerfile implementations with many new features
* Avoid side-effects with rest of the API (intermediate images and containers)
* Prioritize your build cache for automatic pruning
@y
{% comment %}
* Detect and skip executing unused build stages
* Parallelize building independent build stages
* Incrementally transfer only the changed files in your build context between builds
* Detect and skip transferring unused files in your build context
* Use external Dockerfile implementations with many new features
* Avoid side-effects with rest of the API (intermediate images and containers)
* Prioritize your build cache for automatic pruning
{% endcomment %}
* 未使用のビルドステージを検出して処理をスキップします。
* ビルドステージに関係なく並行処理を行います。
* ビルドを繰り返し行った場合には、ビルドコンテキスト内での変更ファイルのみを追加転送するようにします。
* ビルドコンテキスト内にて未使用のファイルを検出して転送をスキップします。
* 外部からの Dockerfile 実装を利用して多くの機能を実現します。
* これまでの API（中間イメージやコンテナー）に対する副作用を抑えます。
* ビルドキャッシュの自動的な削除（prune）に対して優先順位をつけます。
@z

@x
To use the BuildKit backend, you need to set an environment variable 
`DOCKER_BUILDKIT=1` on the CLI before invoking `docker build`.
@y
{% comment %}
To use the BuildKit backend, you need to set an environment variable 
`DOCKER_BUILDKIT=1` on the CLI before invoking `docker build`.
{% endcomment %}
BuildKit バックエンドを利用するには、環境変数の設定として `DOCKER_BUILDKIT=1` とすることが必要です。
これは CLI において `docker build` を実行する前に行っておきます。
@z

@x
To learn about the experimental Dockerfile syntax available to BuildKit-based
builds [refer to the documentation in the BuildKit repository](https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md).
@y
{% comment %}
To learn about the experimental Dockerfile syntax available to BuildKit-based
builds [refer to the documentation in the BuildKit repository](https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md).
{% endcomment %}
BuildKit ベースでビルドされたイメージにて利用可能な、実験的な Dockerfile 文法については、[BuildKit リポジトリのドキュメント](https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md)を参照してください。
@z

@x
## Format
@y
{% comment %}
## Format
{% endcomment %}
## 記述書式
{: #format }
@z

@x
Here is the format of the `Dockerfile`:
@y
{% comment %}
Here is the format of the `Dockerfile`:
{% endcomment %}
ここに `Dockerfile` の記述書式を示します。
@z

@x
```Dockerfile
# Comment
INSTRUCTION arguments
```
@y
{% comment %}
```Dockerfile
# Comment
INSTRUCTION arguments
```
{% endcomment %}
```Dockerfile
# Comment
INSTRUCTION arguments
```
@z

@x
The instruction is not case-sensitive. However, convention is for them to
be UPPERCASE to distinguish them from arguments more easily.
@y
{% comment %}
The instruction is not case-sensitive. However, convention is for them to
be UPPERCASE to distinguish them from arguments more easily.
{% endcomment %}
命令（instruction）は大文字小文字を区別しません。
ただし慣習として大文字とします。
そうすることで引数（arguments）との区別をつけやすくします。
@z

@x
Docker runs instructions in a `Dockerfile` in order. A `Dockerfile` **must
begin with a \`FROM\` instruction**. This may be after [parser
directives](#parser-directives), [comments](#format), and globally scoped
[ARGs](#arg). The `FROM` instruction specifies the [*Parent
Image*](glossary.md#parent-image) from which you are building. `FROM`
may only be preceded by one or more `ARG` instructions, which declare arguments
that are used in `FROM` lines in the `Dockerfile`.
@y
{% comment %}
Docker runs instructions in a `Dockerfile` in order. A `Dockerfile` **must
begin with a \`FROM\` instruction**. This may be after [parser
directives](#parser-directives), [comments](#format), and globally scoped
[ARGs](#arg). The `FROM` instruction specifies the [*Parent
Image*](glossary.md#parent-image) from which you are building. `FROM`
may only be preceded by one or more `ARG` instructions, which declare arguments
that are used in `FROM` lines in the `Dockerfile`.
{% endcomment %}
Docker は `Dockerfile` 内の命令を記述順に実行します。
`Dockerfile` は必ず**`FROM`命令**で始めなければなりません。
この命令より前に記述できるのは、[パーサーディレクティブ](#parser-directives)、[コメント](#format)、グローバル定義された [ARG](#arg) です。
`FROM` 命令は、ビルドするイメージに対しての [*親イメージ*](glossary.md#parent-image) を指定するものです。
`FROM` よりも先に記述できる命令として `ARG` があります。
これは `FROM` において用いられる引数を宣言するものです。
@z

@x
Docker treats lines that *begin* with `#` as a comment, unless the line is
a valid [parser directive](#parser-directives). A `#` marker anywhere
else in a line is treated as an argument. This allows statements like:
@y
{% comment %}
Docker treats lines that *begin* with `#` as a comment, unless the line is
a valid [parser directive](#parser-directives). A `#` marker anywhere
else in a line is treated as an argument. This allows statements like:
{% endcomment %}
行頭が `#` で始まる行はコメントとして扱われます。
ただし例外として[パーサーディレクティブ](#parser-directives)があります。
行途中の `#` は単なる引数として扱われます。
以下のような行記述が可能です。
@z

@x
```Dockerfile
# Comment
RUN echo 'we are running some # of cool things'
```
@y
{% comment %}
```Dockerfile
# Comment
RUN echo 'we are running some # of cool things'
```
{% endcomment %}
```Dockerfile
# Comment
RUN echo 'we are running some # of cool things'
```
@z

@x
Line continuation characters are not supported in comments.
@y
{% comment %}
Line continuation characters are not supported in comments.
{% endcomment %}
コメントにおいて行継続を指示する文字はサポートされていません。
@z

@x
## Parser directives
@y
{% comment %}
## Parser directives
{% endcomment %}
## パーサーディレクティブ
{: #parser-directives }
@z

@x
Parser directives are optional, and affect the way in which subsequent lines
in a `Dockerfile` are handled. Parser directives do not add layers to the build,
and will not be shown as a build step. Parser directives are written as a
special type of comment in the form `# directive=value`. A single directive
may only be used once.
@y
{% comment %}
Parser directives are optional, and affect the way in which subsequent lines
in a `Dockerfile` are handled. Parser directives do not add layers to the build,
and will not be shown as a build step. Parser directives are written as a
special type of comment in the form `# directive=value`. A single directive
may only be used once.
{% endcomment %}
パーサーディレクティブ（parser directive）を利用することは任意です。
これは `Dockerfile` 内のその後に続く記述行を取り扱う方法を指示するものです。
パーサーディレクティブはビルドされるイメージにレイヤーを追加しません。
したがってビルドステップとして表示されることはありません。
パーサーディレクティブは、特別なコメントの記述方法をとるもので、`# ディレクティブ＝値` という書式です。
同一のディレクティブは一度しか記述できません。
@z

@x
Once a comment, empty line or builder instruction has been processed, Docker
no longer looks for parser directives. Instead it treats anything formatted
as a parser directive as a comment and does not attempt to validate if it might
be a parser directive. Therefore, all parser directives must be at the very
top of a `Dockerfile`.
@y
{% comment %}
Once a comment, empty line or builder instruction has been processed, Docker
no longer looks for parser directives. Instead it treats anything formatted
as a parser directive as a comment and does not attempt to validate if it might
be a parser directive. Therefore, all parser directives must be at the very
top of a `Dockerfile`.
{% endcomment %}
コメント、空行、ビルド命令が一つでも読み込まれたら、それ以降 Docker はパーサーディレクティブの処理を行いません。
その場合、パーサーディレクティブの書式で記述されていても、それはコメントとして扱われます。
そしてパーサーディレクティブとして適切な書式であるかどうかも確認しません。
したがってパーサーディレクティブは `Dockerfile` の冒頭に記述しなければなりません。
@z

@x
Parser directives are not case-sensitive. However, convention is for them to
be lowercase. Convention is also to include a blank line following any
parser directives. Line continuation characters are not supported in parser
directives.
@y
{% comment %}
Parser directives are not case-sensitive. However, convention is for them to
be lowercase. Convention is also to include a blank line following any
parser directives. Line continuation characters are not supported in parser
directives.
{% endcomment %}
パーサーディレクティブは大文字小文字を区別しません。
ただし慣習として小文字とします。
同じく慣習として、パーサーディレクティブの次には空行を 1 行挿入します。
パーサーディレクティブにおいて、行継続を指示する文字はサポートされていません。
@z

@x
Due to these rules, the following examples are all invalid:
@y
{% comment %}
Due to these rules, the following examples are all invalid:
{% endcomment %}
以上の規則により、下に示す例はすべて無効な記述となります。
@z

@x
Invalid due to line continuation:
@y
{% comment %}
Invalid due to line continuation:
{% endcomment %}
行継続は無効です。
@z

@x
```Dockerfile
# direc \
tive=value
```
@y
```Dockerfile
# direc \
tive=value
```
@z

@x
Invalid due to appearing twice:
@y
{% comment %}
Invalid due to appearing twice:
{% endcomment %}
二度出現するため無効です。
@z

@x
```Dockerfile
# directive=value1
# directive=value2
@y
```Dockerfile
# directive=value1
# directive=value2
@z

@x
FROM ImageName
```
@y
FROM ImageName
```
@z

@x
Treated as a comment due to appearing after a builder instruction:
@y
{% comment %}
Treated as a comment due to appearing after a builder instruction:
{% endcomment %}
ビルド命令の後に記述されたためコメントとして扱われます。
@z

@x
```Dockerfile
FROM ImageName
# directive=value
```
@y
```Dockerfile
FROM ImageName
# directive=value
```
@z

@x
Treated as a comment due to appearing after a comment which is not a parser
directive:
@y
{% comment %}
Treated as a comment due to appearing after a comment which is not a parser
directive:
{% endcomment %}
パーサーディレクティブではないコメントの後に記述されたためコメントして扱われます。
@z

@x
```Dockerfile
# About my dockerfile
# directive=value
FROM ImageName
```
@y
```Dockerfile
# About my dockerfile
# directive=value
FROM ImageName
```
@z

@x
The unknown directive is treated as a comment due to not being recognized. In
addition, the known directive is treated as a comment due to appearing after
a comment which is not a parser directive.
@y
{% comment %}
The unknown directive is treated as a comment due to not being recognized. In
addition, the known directive is treated as a comment due to appearing after
a comment which is not a parser directive.
{% endcomment %}
不明なディレクティブは認識できないためコメントとして扱われます。
さらに正常なディレクティブであっても、その前にパーサーディレクティブではないコメントが記述された場合、コメントとして扱われます。
@z

@x
```Dockerfile
# unknowndirective=value
# knowndirective=value
```
@y
```Dockerfile
# unknowndirective=value
# knowndirective=value
```
@z

@x
Non line-breaking whitespace is permitted in a parser directive. Hence, the
following lines are all treated identically:
@y
{% comment %}
Non line-breaking whitespace is permitted in a parser directive. Hence, the
following lines are all treated identically:
{% endcomment %}
改行ではないホワイトスペースは、パーサーディレクティブにおいて記述することができます。
そこで、以下の各行はすべて同一のものとして扱われます。
@z

@x
```Dockerfile
#directive=value
# directive =value
#	directive= value
# directive = value
#	  dIrEcTiVe=value
```
@y
```Dockerfile
#directive=value
# directive =value
#	directive= value
# directive = value
#	  dIrEcTiVe=value
```
@z

@x
The following parser directives are supported:
@y
{% comment %}
The following parser directives are supported:
{% endcomment %}
パーサーディレクティブは以下のものがサポートされます。
@z

@x
* `syntax`
* `escape`
@y
* `syntax`
* `escape`
@z

@x
## syntax
@y
## syntax
@z

@x
    # syntax=[remote image reference]
@y
    {% comment %}
    # syntax=[remote image reference]
    {% endcomment %}
    # syntax=[リモートイメージ参照]
@z

@x
For example:
@y
{% comment %}
For example:
{% endcomment %}
たとえば以下のとおりです。
@z

@x
    # syntax=docker/dockerfile
    # syntax=docker/dockerfile:1.0
    # syntax=docker.io/docker/dockerfile:1
    # syntax=docker/dockerfile:1.0.0-experimental
    # syntax=example.com/user/repo:tag@sha256:abcdef...
@y
    # syntax=docker/dockerfile
    # syntax=docker/dockerfile:1.0
    # syntax=docker.io/docker/dockerfile:1
    # syntax=docker/dockerfile:1.0.0-experimental
    # syntax=example.com/user/repo:tag@sha256:abcdef...
@z

@x
This feature is only enabled if the [BuildKit](#buildkit) backend is used.
@y
{% comment %}
This feature is only enabled if the [BuildKit](#buildkit) backend is used.
{% endcomment %}
この機能は [BuildKit](#buildkit) バックエンドが用いられているときのみ利用可能です。
@z

@x
The syntax directive defines the location of the Dockerfile builder that is used for
building the current Dockerfile. The BuildKit backend allows to seamlessly use
external implementations of builders that are distributed as Docker images and 
execute inside a container sandbox environment.
@y
{% comment %}
The syntax directive defines the location of the Dockerfile builder that is used for
building the current Dockerfile. The BuildKit backend allows to seamlessly use
external implementations of builders that are distributed as Docker images and 
execute inside a container sandbox environment.
{% endcomment %}
syntax ディレクティブは、現在の Dockerfile をビルドするために用いられる Dockerfile ビルダーのありかを定義するものです。
BuildKit バックエンドでは、外部実装されたビルダーをシームレスに利用できます。
このビルダーは Docker イメージとして提供されていて、サンドボックスコンテナー環境内で実行されます。
@z

@x
Custom Dockerfile implementation allows you to:
  - Automatically get bugfixes without updating the daemon
  - Make sure all users are using the same implementation to build your Dockerfile
  - Use the latest features without updating the daemon
  - Try out new experimental or third-party features
@y
{% comment %}
Custom Dockerfile implementation allows you to:
  - Automatically get bugfixes without updating the daemon
  - Make sure all users are using the same implementation to build your Dockerfile
  - Use the latest features without updating the daemon
  - Try out new experimental or third-party features
{% endcomment %}
Dockerfile のカスタム実装では以下のことが可能となります。
  - デーモンをアップデートしなくてもバグフィックスを自動的に行います。
  - Dockerfile のビルドにあたって、全ユーザーが同一の実装を確実に利用するようにします。
  - デーモンをアップデートしなくても最新機能を利用します。
  - 新しい実験的な機能、あるいはサードパーティによる機能を試すことができます。
@z

@x
### Official releases
@y
{% comment %}
### Official releases
{% endcomment %}
### 公式リリース
{: #official-releases }
@z

@x
Docker distributes official versions of the images that can be used for building 
Dockerfiles under `docker/dockerfile` repository on Docker Hub. There are two 
channels where new images are released: stable and experimental. 
@y
{% comment %}
Docker distributes official versions of the images that can be used for building 
Dockerfiles under `docker/dockerfile` repository on Docker Hub. There are two 
channels where new images are released: stable and experimental. 
{% endcomment %}
Docker では Docker Hub の `docker/dockerfile` リポジトリを通じて、Dockerfile をビルドするために利用できる公式イメージを提供しています。
新たなイメージがリリースされるのは、安定版（stable）チャネルと実験版（experimental）チャネルです。
@z

@x
Stable channel follows semantic versioning. For example:
@y
{% comment %}
Stable channel follows semantic versioning. For example:
{% endcomment %}
安定版（stable）チャネルではバージョン番号に意味をもたせています。
たとえば以下のとおりです。
@z

@x
  - docker/dockerfile:1.0.0 - only allow immutable version 1.0.0
  - docker/dockerfile:1.0 - allow versions 1.0.*
  - docker/dockerfile:1 - allow versions 1.*.*
  - docker/dockerfile:latest - latest release on stable channel
@y
  {% comment %}
  - docker/dockerfile:1.0.0 - only allow immutable version 1.0.0
  - docker/dockerfile:1.0 - allow versions 1.0.*
  - docker/dockerfile:1 - allow versions 1.*.*
  - docker/dockerfile:latest - latest release on stable channel
  {% endcomment %}
  - docker/dockerfile:1.0.0 - ただ 1 つの不変バージョン 1.0.0 を表わす
  - docker/dockerfile:1.0 - バージョン 1.0.* を含む
  - docker/dockerfile:1 - バージョン 1.*.* をすべて含む
  - docker/dockerfile:latest - 安定版チャネルの最新リリース
@z

@x
The experimental channel uses incremental versioning with the major and minor
component from the stable channel on the time of the release. For example:
@y
{% comment %}
The experimental channel uses incremental versioning with the major and minor
component from the stable channel on the time of the release. For example:
{% endcomment %}
実験版（experimental）チャネルでのバージョン番号は、リリースタイミングでの安定版チャネルのコンポーネントから、メジャー番号、マイナー番号を利用してナンバリングされています。
@z

@x
  - docker/dockerfile:1.0.1-experimental - only allow immutable version 1.0.1-experimental
  - docker/dockerfile:1.0-experimental - latest experimental releases after 1.0
  - docker/dockerfile:experimental - latest release on experimental channel
@y
  {% comment %}
  - docker/dockerfile:1.0.1-experimental - only allow immutable version 1.0.1-experimental
  - docker/dockerfile:1.0-experimental - latest experimental releases after 1.0
  - docker/dockerfile:experimental - latest release on experimental channel
  {% endcomment %}
  - docker/dockerfile:1.0.1-experimental - ただ 1 つの不変バージョン 1.0.1-experimental を表わす
  - docker/dockerfile:1.0-experimental - バージョン 1.0 以降の最新実験版
  - docker/dockerfile:experimental - 実験版チャネル上の最新版
@z

@x
You should choose a channel that best fits your needs. If you only want 
bugfixes, you should use `docker/dockerfile:1.0`. If you want to benefit from
experimental features, you should use the experimental channel. If you are using 
the experimental channel, newer releases may not be backwards compatible, so it
is recommended to use an immutable full version variant.
@y
{% comment %}
You should choose a channel that best fits your needs. If you only want 
bugfixes, you should use `docker/dockerfile:1.0`. If you want to benefit from
experimental features, you should use the experimental channel. If you are using 
the experimental channel, newer releases may not be backwards compatible, so it
is recommended to use an immutable full version variant.
{% endcomment %}
作業の必要に応じて適切なチャネルを選んでください。
バグフィックスだけを望むのであれば `docker/dockerfile:1.0` を利用します。
実験的な機能を利用したいなら、実験版チャネルを利用します。
実験版チャネルを利用している場合、リリースが進むほど互換性が失われるかもしれません。
したがって不変バージョンを利用することをお勧めします。
@z

@x
For master builds and nightly feature releases refer to the description in [the source repository](https://github.com/moby/buildkit/blob/master/README.md).
@y
{% comment %}
For master builds and nightly feature releases refer to the description in [the source repository](https://github.com/moby/buildkit/blob/master/README.md).
{% endcomment %}
マスタービルドと最新機能リリースについては、[ソースリポジトリ](https://github.com/moby/buildkit/blob/master/README.md)の記述を参照してください。
@z

@x
## escape
@y
## escape
@z

@x
    # escape=\ (backslash)
@y
   {% comment %}
    # escape=\ (backslash)
   {% endcomment %}
    # escape=\ （バックスラッシュ）
@z

@x
Or
@y
{% comment %}
Or
{% endcomment %}
または
@z

@x
    # escape=` (backtick)
@y
   {% comment %}
    # escape=` (backtick)
   {% endcomment %}
    # escape=` （バッククォート）
@z

@x
The `escape` directive sets the character used to escape characters in a
`Dockerfile`. If not specified, the default escape character is `\`.
@y
{% comment %}
The `escape` directive sets the character used to escape characters in a
`Dockerfile`. If not specified, the default escape character is `\`.
{% endcomment %}
ディレクティブ `escape` は、`Dockerfile` 内でエスケープ文字として用いる文字を設定します。
設定していない場合は、デフォルトとして `\` が用いられます。
@z

@x
The escape character is used both to escape characters in a line, and to
escape a newline. This allows a `Dockerfile` instruction to
span multiple lines. Note that regardless of whether the `escape` parser
directive is included in a `Dockerfile`, *escaping is not performed in
a `RUN` command, except at the end of a line.*
@y
{% comment %}
The escape character is used both to escape characters in a line, and to
escape a newline. This allows a `Dockerfile` instruction to
span multiple lines. Note that regardless of whether the `escape` parser
directive is included in a `Dockerfile`, *escaping is not performed in
a `RUN` command, except at the end of a line.*
{% endcomment %}
エスケープ文字は行途中での文字をエスケープするものと、行継続をエスケープするものがあります。
行継続のエスケープを使うと `Dockerfile` 内の命令を複数行に分けることができます。
`Dockerfile` に `escape` パーサーディレクティブを記述していたとしても、`RUN` コマンドの途中でのエスケープは無効であり、行末の行継続エスケープのみ利用することができます。
@z

@x
Setting the escape character to `` ` `` is especially useful on
`Windows`, where `\` is the directory path separator. `` ` `` is consistent
with [Windows PowerShell](https://technet.microsoft.com/en-us/library/hh847755.aspx).
@y
{% comment %}
Setting the escape character to `` ` `` is especially useful on
`Windows`, where `\` is the directory path separator. `` ` `` is consistent
with [Windows PowerShell](https://technet.microsoft.com/en-us/library/hh847755.aspx).
{% endcomment %}
`Windows` においてはエスケープ文字を `` ` `` とします。
`\` はディレクトリセパレーターとなっているためです。
`` ` `` は [Windows PowerShell](https://technet.microsoft.com/en-us/library/hh847755.aspx) 上でも利用できます。
@z

@x
Consider the following example which would fail in a non-obvious way on
`Windows`. The second `\` at the end of the second line would be interpreted as an
escape for the newline, instead of a target of the escape from the first `\`.
Similarly, the `\` at the end of the third line would, assuming it was actually
handled as an instruction, cause it be treated as a line continuation. The result
of this dockerfile is that second and third lines are considered a single
instruction:
@y
{% comment %}
Consider the following example which would fail in a non-obvious way on
`Windows`. The second `\` at the end of the second line would be interpreted as an
escape for the newline, instead of a target of the escape from the first `\`.
Similarly, the `\` at the end of the third line would, assuming it was actually
handled as an instruction, cause it be treated as a line continuation. The result
of this dockerfile is that second and third lines are considered a single
instruction:
{% endcomment %}
以下のような `Windows` 上の例を見てみます。
これはよく分からずに失敗してしまう例です。
2 行めの行末にある 2 つめの `\` は、次の行への継続を表わすエスケープと解釈されます。
つまり 1 つめの `\` をエスケープするものとはなりません。
同様に 3 行めの行末にある `\` も、この行が正しく命令として解釈されるものであっても、行継続として扱われることになります。
結果としてこの Dockerfile の 2 行めと 3 行めは、一続きの記述行とみなされます。
@z

@x
```Dockerfile
FROM microsoft/nanoserver
COPY testfile.txt c:\\
RUN dir c:\
```
@y
```Dockerfile
FROM microsoft/nanoserver
COPY testfile.txt c:\\
RUN dir c:\
```
@z

@x
Results in:
@y
{% comment %}
Results in:
{% endcomment %}
この Dockerfile を用いると以下の結果になります。
@z

@x
    PS C:\John> docker build -t cmd .
    Sending build context to Docker daemon 3.072 kB
    Step 1/2 : FROM microsoft/nanoserver
     ---> 22738ff49c6d
    Step 2/2 : COPY testfile.txt c:\RUN dir c:
    GetFileAttributesEx c:RUN: The system cannot find the file specified.
    PS C:\John>
@y
    PS C:\John> docker build -t cmd .
    Sending build context to Docker daemon 3.072 kB
    Step 1/2 : FROM microsoft/nanoserver
     ---> 22738ff49c6d
    Step 2/2 : COPY testfile.txt c:\RUN dir c:
    GetFileAttributesEx c:RUN: The system cannot find the file specified.
    PS C:\John>
@z

@x
One solution to the above would be to use `/` as the target of both the `COPY`
instruction, and `dir`. However, this syntax is, at best, confusing as it is not
natural for paths on `Windows`, and at worst, error prone as not all commands on
`Windows` support `/` as the path separator.
@y
{% comment %}
One solution to the above would be to use `/` as the target of both the `COPY`
instruction, and `dir`. However, this syntax is, at best, confusing as it is not
natural for paths on `Windows`, and at worst, error prone as not all commands on
`Windows` support `/` as the path separator.
{% endcomment %}
上を解決するには `COPY` 命令と `dir` の対象において `/` を用います。
ただし `Windows` 上における普通のパス記述とは違う文法であるため混乱しやすく、さらに `Windows` のあらゆるコマンドがパスセパレーターとして  `/` をサポートしているわけではないので、エラーになることもあります。
@z

@x
By adding the `escape` parser directive, the following `Dockerfile` succeeds as
expected with the use of natural platform semantics for file paths on `Windows`:
@y
{% comment %}
By adding the `escape` parser directive, the following `Dockerfile` succeeds as
expected with the use of natural platform semantics for file paths on `Windows`:
{% endcomment %}
パーサーディレクティブ `escape` を利用すれば、`Windows` 上のファイルパスの文法をそのままに、期待どおりに `Dockerfile` が動作してくれます。
@z

@x
    # escape=`
@y
    # escape=`
@z

@x
    FROM microsoft/nanoserver
    COPY testfile.txt c:\
    RUN dir c:\
@y
    FROM microsoft/nanoserver
    COPY testfile.txt c:\
    RUN dir c:\
@z

@x
Results in:
@y
{% comment %}
Results in:
{% endcomment %}
上を処理に用いると以下のようになります。
@z

@x
    PS C:\John> docker build -t succeeds --no-cache=true .
    Sending build context to Docker daemon 3.072 kB
    Step 1/3 : FROM microsoft/nanoserver
     ---> 22738ff49c6d
    Step 2/3 : COPY testfile.txt c:\
     ---> 96655de338de
    Removing intermediate container 4db9acbb1682
    Step 3/3 : RUN dir c:\
     ---> Running in a2c157f842f5
     Volume in drive C has no label.
     Volume Serial Number is 7E6D-E0F7
@y
    PS C:\John> docker build -t succeeds --no-cache=true .
    Sending build context to Docker daemon 3.072 kB
    Step 1/3 : FROM microsoft/nanoserver
     ---> 22738ff49c6d
    Step 2/3 : COPY testfile.txt c:\
     ---> 96655de338de
    Removing intermediate container 4db9acbb1682
    Step 3/3 : RUN dir c:\
     ---> Running in a2c157f842f5
     Volume in drive C has no label.
     Volume Serial Number is 7E6D-E0F7
@z

@x
     Directory of c:\
@y
     Directory of c:\
@z

@x
    10/05/2016  05:04 PM             1,894 License.txt
    10/05/2016  02:22 PM    <DIR>          Program Files
    10/05/2016  02:14 PM    <DIR>          Program Files (x86)
    10/28/2016  11:18 AM                62 testfile.txt
    10/28/2016  11:20 AM    <DIR>          Users
    10/28/2016  11:20 AM    <DIR>          Windows
               2 File(s)          1,956 bytes
               4 Dir(s)  21,259,096,064 bytes free
     ---> 01c7f3bef04f
    Removing intermediate container a2c157f842f5
    Successfully built 01c7f3bef04f
    PS C:\John>
@y
    10/05/2016  05:04 PM             1,894 License.txt
    10/05/2016  02:22 PM    <DIR>          Program Files
    10/05/2016  02:14 PM    <DIR>          Program Files (x86)
    10/28/2016  11:18 AM                62 testfile.txt
    10/28/2016  11:20 AM    <DIR>          Users
    10/28/2016  11:20 AM    <DIR>          Windows
               2 File(s)          1,956 bytes
               4 Dir(s)  21,259,096,064 bytes free
     ---> 01c7f3bef04f
    Removing intermediate container a2c157f842f5
    Successfully built 01c7f3bef04f
    PS C:\John>
@z

@x
## Environment replacement
@y
{% comment %}
## Environment replacement
{% endcomment %}
## 環境変数の置換
{: #environment-replacement }
@z

@x
Environment variables (declared with [the `ENV` statement](#env)) can also be
used in certain instructions as variables to be interpreted by the
`Dockerfile`. Escapes are also handled for including variable-like syntax
into a statement literally.
@y
{% comment %}
Environment variables (declared with [the `ENV` statement](#env)) can also be
used in certain instructions as variables to be interpreted by the
`Dockerfile`. Escapes are also handled for including variable-like syntax
into a statement literally.
{% endcomment %}
`Dockerfile` の[`ENV` 構文](#env)により宣言される環境変数は、特定の命令において変数として解釈されます。
エスケープについても構文内にリテラルを含めることから、変数と同様の扱いと考えられます。
@z

@x
Environment variables are notated in the `Dockerfile` either with
`$variable_name` or `${variable_name}`. They are treated equivalently and the
brace syntax is typically used to address issues with variable names with no
whitespace, like `${foo}_bar`.
@y
{% comment %}
Environment variables are notated in the `Dockerfile` either with
`$variable_name` or `${variable_name}`. They are treated equivalently and the
brace syntax is typically used to address issues with variable names with no
whitespace, like `${foo}_bar`.
{% endcomment %}
`Dockerfile` における環境変数の記述書式は、`$variable_name` あるいは `${variable_name}` のいずれかが可能です。
両者は同等のものですが、ブレースを用いた記述は `${foo}_bar` といった記述のように、変数名にホワイトスペースを含めないようにするために利用されます。
@z

@x
The `${variable_name}` syntax also supports a few of the standard `bash`
modifiers as specified below:
@y
{% comment %}
The `${variable_name}` syntax also supports a few of the standard `bash`
modifiers as specified below:
{% endcomment %}
`${variable_name}` という書式は、標準的な `bash` の修飾書式をいくつかサポートしています。
たとえば以下のものです。
@z

@x
* `${variable:-word}` indicates that if `variable` is set then the result
  will be that value. If `variable` is not set then `word` will be the result.
* `${variable:+word}` indicates that if `variable` is set then `word` will be
  the result, otherwise the result is the empty string.
@y
{% comment %}
* `${variable:-word}` indicates that if `variable` is set then the result
  will be that value. If `variable` is not set then `word` will be the result.
* `${variable:+word}` indicates that if `variable` is set then `word` will be
  the result, otherwise the result is the empty string.
{% endcomment %}
* `${variable:-word}` は、`variable` が設定されているとき、この結果はその値となります。
  `variable` が設定されていないとき、`word` が結果となります。
* `${variable:+word}` は、`variable` が設定されているとき、この結果は `word` となります。
  `variable` が設定されていないとき、結果は空文字となります。
@z

@x
In all cases, `word` can be any string, including additional environment
variables.
@y
{% comment %}
In all cases, `word` can be any string, including additional environment
variables.
{% endcomment %}
どの例においても、`word` は文字列であれば何でもよく、さらに別の環境変数を含んでいても構いません。
@z

@x
Escaping is possible by adding a `\` before the variable: `\$foo` or `\${foo}`,
for example, will translate to `$foo` and `${foo}` literals respectively.
@y
{% comment %}
Escaping is possible by adding a `\` before the variable: `\$foo` or `\${foo}`,
for example, will translate to `$foo` and `${foo}` literals respectively.
{% endcomment %}
変数名をエスケープすることも可能で、変数名の前に `\$foo` や `\${foo}` のように `\` をつけます。
こうすると、この例はそれぞれ `$foo`、`${foo}` という文字列そのものとして解釈されます。
@z

@x
Example (parsed representation is displayed after the `#`):
@y
{% comment %}
Example (parsed representation is displayed after the `#`):
{% endcomment %}
記述例 （`#` の後に変数解釈した結果を表示）
@z

@x
    FROM busybox
    ENV foo /bar
    WORKDIR ${foo}   # WORKDIR /bar
    ADD . $foo       # ADD . /bar
    COPY \$foo /quux # COPY $foo /quux
@y
    FROM busybox
    ENV foo /bar
    WORKDIR ${foo}   # WORKDIR /bar
    ADD . $foo       # ADD . /bar
    COPY \$foo /quux # COPY $foo /quux
@z

@x
Environment variables are supported by the following list of instructions in
the `Dockerfile`:
@y
{% comment %}
Environment variables are supported by the following list of instructions in
the `Dockerfile`:
{% endcomment %}
環境変数は、以下に示す `Dockerfile` 内の命令においてサポートされます。
@z

@x
* `ADD`
* `COPY`
* `ENV`
* `EXPOSE`
* `FROM`
* `LABEL`
* `STOPSIGNAL`
* `USER`
* `VOLUME`
* `WORKDIR`
@y
* `ADD`
* `COPY`
* `ENV`
* `EXPOSE`
* `FROM`
* `LABEL`
* `STOPSIGNAL`
* `USER`
* `VOLUME`
* `WORKDIR`
@z

@x
as well as:
@y
{% comment %}
as well as:
{% endcomment %}
さらに以下もサポートされます。
@z

@x
* `ONBUILD` (when combined with one of the supported instructions above)
@y
{% comment %}
* `ONBUILD` (when combined with one of the supported instructions above)
{% endcomment %}
* `ONBUILD` （上記のサポート対象の命令と組み合わせて用いる場合）
@z

@x
> **Note**:
> prior to 1.4, `ONBUILD` instructions did **NOT** support environment
> variable, even when combined with any of the instructions listed above.
@y
{% comment %}
> **Note**:
> prior to 1.4, `ONBUILD` instructions did **NOT** support environment
> variable, even when combined with any of the instructions listed above.
{% endcomment %}
> **メモ**:
> Docker バージョン 1.4 より以前では `ONBUILD` 命令は環境変数をサポートしていません。
> 一覧にあげた命令との組み合わせで用いる場合も同様です。
@z

@x
Environment variable substitution will use the same value for each variable
throughout the entire instruction. In other words, in this example:
@y
{% comment %}
Environment variable substitution will use the same value for each variable
throughout the entire instruction. In other words, in this example:
{% endcomment %}
環境変数の置換は、命令全体の中で個々の変数ごとに同一の値が用いられます。
これを説明するために以下の例を見ます。
@z

@x
    ENV abc=hello
    ENV abc=bye def=$abc
    ENV ghi=$abc
@y
    ENV abc=hello
    ENV abc=bye def=$abc
    ENV ghi=$abc
@z

@x
will result in `def` having a value of `hello`, not `bye`. However,
`ghi` will have a value of `bye` because it is not part of the same instruction
that set `abc` to `bye`.
@y
{% comment %}
will result in `def` having a value of `hello`, not `bye`. However,
`ghi` will have a value of `bye` because it is not part of the same instruction
that set `abc` to `bye`.
{% endcomment %}
この結果、`def` は `hello` になります。
`bye` ではありません。
しかし `ghi` は `bye` になります。
`ghi` を設定している行は、`abc` に `bye` を設定している命令と同一箇所ではないからです。
@z

@x
## .dockerignore file
@y
{% comment %}
## .dockerignore file
{% endcomment %}
## .dockerignore ファイル
{: #dockerignore-file }
@z

@x
Before the docker CLI sends the context to the docker daemon, it looks
for a file named `.dockerignore` in the root directory of the context.
If this file exists, the CLI modifies the context to exclude files and
directories that match patterns in it.  This helps to avoid
unnecessarily sending large or sensitive files and directories to the
daemon and potentially adding them to images using `ADD` or `COPY`.
@y
{% comment %}
Before the docker CLI sends the context to the docker daemon, it looks
for a file named `.dockerignore` in the root directory of the context.
If this file exists, the CLI modifies the context to exclude files and
directories that match patterns in it.  This helps to avoid
unnecessarily sending large or sensitive files and directories to the
daemon and potentially adding them to images using `ADD` or `COPY`.
{% endcomment %}
Docker の CLI によってコンテキストが Docker デーモンに送信される前には、コンテキストのルートディレクトリの `.dockerignore` というファイルが参照されます。
このファイルが存在したら、CLI はそこに記述されたパターンにマッチするようなファイルやディレクトリを除外した上で、コンテキストを扱います。
必要もないのに、巨大なファイルや取り扱い注意のファイルを不用意に送信してしまうことが避けられ、`ADD` や `COPY` を使ってイメージに間違って送信してしまうことを防ぐことができます。
@z

@x
The CLI interprets the `.dockerignore` file as a newline-separated
list of patterns similar to the file globs of Unix shells.  For the
purposes of matching, the root of the context is considered to be both
the working and the root directory.  For example, the patterns
`/foo/bar` and `foo/bar` both exclude a file or directory named `bar`
in the `foo` subdirectory of `PATH` or in the root of the git
repository located at `URL`.  Neither excludes anything else.
@y
{% comment %}
The CLI interprets the `.dockerignore` file as a newline-separated
list of patterns similar to the file globs of Unix shells.  For the
purposes of matching, the root of the context is considered to be both
the working and the root directory.  For example, the patterns
`/foo/bar` and `foo/bar` both exclude a file or directory named `bar`
in the `foo` subdirectory of `PATH` or in the root of the git
repository located at `URL`.  Neither excludes anything else.
{% endcomment %}
CLI は `.dockerignore` ファイルを各行ごとに区切られた設定一覧として捉えます。
ちょうど Unix シェルにおけるファイルグロブ（glob）と同様です。
マッチング処理の都合上、コンテキストのルートは、ワーキングディレクトリとルートディレクトリの双方であるものとしてみなされます。
たとえばパターンとして `/foo/bar` と `foo/bar` があったとすると、`PATH` 上であればサブディレクトリ `foo` 内、`URL` であればその git レポジトリ内の、いずれも `bar` というファイルまたはディレクトリを除外します。
その他のものについては除外対象としません。
@z

@x
If a line in `.dockerignore` file starts with `#` in column 1, then this line is
considered as a comment and is ignored before interpreted by the CLI.
@y
{% comment %}
If a line in `.dockerignore` file starts with `#` in column 1, then this line is
considered as a comment and is ignored before interpreted by the CLI.
{% endcomment %}
`.dockerignore` ファイルの各行頭の第 1 カラムめに `#` があれば、その行はコメントとみなされて、CLI による解釈が行われず無視されます。
@z

@x
Here is an example `.dockerignore` file:
@y
{% comment %}
Here is an example `.dockerignore` file:
{% endcomment %}
`.dockerignore` ファイルの例を示します。
@z

@x
```
# comment
*/temp*
*/*/temp*
temp?
```
@y
```
# comment
*/temp*
*/*/temp*
temp?
```
@z

@x
This file causes the following build behavior:
@y
{% comment %}
This file causes the following build behavior:
{% endcomment %}
このファイルはビルドの際に以下にように動作します。
@z

@x
| Rule        | Behavior                                                                                                                                                                                                       |
|:------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `# comment` | Ignored.                                                                                                                                                                                                       |
| `*/temp*`   | Exclude files and directories whose names start with `temp` in any immediate subdirectory of the root.  For example, the plain file `/somedir/temporary.txt` is excluded, as is the directory `/somedir/temp`. |
| `*/*/temp*` | Exclude files and directories starting with `temp` from any subdirectory that is two levels below the root. For example, `/somedir/subdir/temporary.txt` is excluded.                                          |
| `temp?`     | Exclude files and directories in the root directory whose names are a one-character extension of `temp`.  For example, `/tempa` and `/tempb` are excluded.                                                     |
@y
| ルール      | 処理結果                                                                                                                                                                                                       |
|:------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `# comment` | 無視されます。                                                                                                                                                                                                 |
| `*/temp*`   | ルートディレクトリの直下にあるサブディレクトリ内にて、`temp` で始まる名称のファイルまたはディレクトリすべてを除外します。たとえば通常のファイル `/somedir/temporary.txt` は除外されます。ディレクトリ `/somedir/temp` も同様です。 |
| `*/*/temp*` | ルートから 2 階層下までのサブディレクトリ内にて、`temp` で始まる名称のファイルまたはディレクトリすべてを除外します。たとえば `/somedir/subdir/temporary.txt` は除外されます。                                 |
| `temp?`     | ルートディレクトリにあるファイルやディレクトリであって、`temp` にもう 1 文字ついた名前のものを除外します。たとえば `/tempa` や `/tempb` が除外されます。                                                      |
@z

@x
Matching is done using Go's
[filepath.Match](http://golang.org/pkg/path/filepath#Match) rules.  A
preprocessing step removes leading and trailing whitespace and
eliminates `.` and `..` elements using Go's
[filepath.Clean](http://golang.org/pkg/path/filepath/#Clean).  Lines
that are blank after preprocessing are ignored.
@y
{% comment %}
Matching is done using Go's
[filepath.Match](http://golang.org/pkg/path/filepath#Match) rules.  A
preprocessing step removes leading and trailing whitespace and
eliminates `.` and `..` elements using Go's
[filepath.Clean](http://golang.org/pkg/path/filepath/#Clean).  Lines
that are blank after preprocessing are ignored.
{% endcomment %}
パターンマッチングには Go 言語の [filepath.Match](http://golang.org/pkg/path/filepath#Match) ルールが用いられています。
マッチングの前処理として、文字列前後のホワイトスペースは取り除かれ、Go 言語の [filepath.Clean](http://golang.org/pkg/path/filepath/#Clean) によって `.` と `..` が除外されます。
前処理を行った後の空行は無視されます。
@z

@x
Beyond Go's filepath.Match rules, Docker also supports a special
wildcard string `**` that matches any number of directories (including
zero). For example, `**/*.go` will exclude all files that end with `.go`
that are found in all directories, including the root of the build context.
@y
{% comment %}
Beyond Go's filepath.Match rules, Docker also supports a special
wildcard string `**` that matches any number of directories (including
zero). For example, `**/*.go` will exclude all files that end with `.go`
that are found in all directories, including the root of the build context.
{% endcomment %}
Docker では Go 言語の filepath.Match ルールを拡張して、特別なワイルドカード文字列 `**` をサポートしています。
これは複数のディレクトリ（ゼロ個を含む）にマッチします。
たとえば `**/*.go` は、ファイル名が `.go` で終わるものであって、どのサブディレクトリにあるものであってもマッチします。
ビルドコンテキストのルートも含まれます。
@z

@x
Lines starting with `!` (exclamation mark) can be used to make exceptions
to exclusions.  The following is an example `.dockerignore` file that
uses this mechanism:
@y
{% comment %}
Lines starting with `!` (exclamation mark) can be used to make exceptions
to exclusions.  The following is an example `.dockerignore` file that
uses this mechanism:
{% endcomment %}
行頭を感嘆符 `!` で書き始めると、それは除外に対しての例外を指定するものとなります。
以下の `.dockerignore` の例はこれを用いるものです。
@z

@x
```
    *.md
    !README.md
```
@y
```
    *.md
    !README.md
```
@z

@x
All markdown files *except* `README.md` are excluded from the context.
@y
{% comment %}
All markdown files *except* `README.md` are excluded from the context.
{% endcomment %}
マークダウンファイルがすべてコンテキストから除外されますが、`README.md` だけは**除外しません**。
@z

@x
The placement of `!` exception rules influences the behavior: the last
line of the `.dockerignore` that matches a particular file determines
whether it is included or excluded.  Consider the following example:
@y
{% comment %}
The placement of `!` exception rules influences the behavior: the last
line of the `.dockerignore` that matches a particular file determines
whether it is included or excluded.  Consider the following example:
{% endcomment %}
`!` による例外ルールは、それを記述した位置によって処理に影響します。
特定のファイルが含まれるのか除外されるのかは、そのファイルがマッチする `.dockerignore` 内の最終の行によって決まります。
以下の例を考えてみます。
@z

@x
```
    *.md
    !README*.md
    README-secret.md
```
@y
```
    *.md
    !README*.md
    README-secret.md
```
@z

@x
No markdown files are included in the context except README files other than
`README-secret.md`.
@y
{% comment %}
No markdown files are included in the context except README files other than
`README-secret.md`.
{% endcomment %}
コンテキストにあるマークダウンファイルはすべて除外されます。
例外として README ファイルは含まれることになりますが、ただし `README-secret.md` は除外されます。
@z

@x
Now consider this example:
@y
{% comment %}
Now consider this example:
{% endcomment %}
次の例も見てみます。
@z

@x
```
    *.md
    README-secret.md
    !README*.md
```
@y
```
    *.md
    README-secret.md
    !README*.md
```
@z

@x
All of the README files are included.  The middle line has no effect because
`!README*.md` matches `README-secret.md` and comes last.
@y
{% comment %}
All of the README files are included.  The middle line has no effect because
`!README*.md` matches `README-secret.md` and comes last.
{% endcomment %}
README ファイルはすべて含まれます。
2 行めは意味をなしていません。
なぜなら `!README*.md` には `README-secret.md` がマッチすることになり、しかも `!README*.md` が最後に記述されているからです。
@z

@x
You can even use the `.dockerignore` file to exclude the `Dockerfile`
and `.dockerignore` files.  These files are still sent to the daemon
because it needs them to do its job.  But the `ADD` and `COPY` instructions
do not copy them to the image.
@y
{% comment %}
You can even use the `.dockerignore` file to exclude the `Dockerfile`
and `.dockerignore` files.  These files are still sent to the daemon
because it needs them to do its job.  But the `ADD` and `COPY` instructions
do not copy them to the image.
{% endcomment %}
`.dockerignore` ファイルを使って `Dockerfile` や `.dockerignore` ファイルを除外することもできます。
除外したとしてもこの 2 つのファイルはデーモンに送信されます。
この 2 つのファイルはデーモンの処理に必要なものであるからです。
ただし `ADD` 命令や `COPY` 命令では、この 2 つのファイルはイメージにコピーされません。
@z

@x
Finally, you may want to specify which files to include in the
context, rather than which to exclude. To achieve this, specify `*` as
the first pattern, followed by one or more `!` exception patterns.
@y
{% comment %}
Finally, you may want to specify which files to include in the
context, rather than which to exclude. To achieve this, specify `*` as
the first pattern, followed by one or more `!` exception patterns.
{% endcomment %}
除外したいファイルを指定するのではなく、含めたいファイルを指定したい場合があります。
これを実現するには、冒頭のマッチングパターンとして `*` を指定します。
そしてこれに続けて、例外となるパターンを `!` を使って指定します。
@z

@x
**Note**: For historical reasons, the pattern `.` is ignored.
@y
{% comment %}
**Note**: For historical reasons, the pattern `.` is ignored.
{% endcomment %}
**メモ**: これまでの開発経緯によりパターン `.` は無視されます。
@z

@x
## FROM
@y
## FROM
@z

@x
    FROM [--platform=<platform>] <image> [AS <name>]
@y
    {% comment %}
    FROM [--platform=<platform>] <image> [AS <name>]
    {% endcomment %}
    FROM [--platform=<platform>] <image> [AS <name>]
@z

@x
Or
@y
{% comment %}
Or
{% endcomment %}
または
@z

@x
    FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]
@y
    FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]
@z

@x
Or
@y
{% comment %}
Or
{% endcomment %}
または
@z

@x
    FROM [--platform=<platform>] <image>[@<digest>] [AS <name>]
@y
    FROM [--platform=<platform>] <image>[@<digest>] [AS <name>]
@z

@x
The `FROM` instruction initializes a new build stage and sets the
[*Base Image*](../../glossary/#base-image) for subsequent instructions. As such, a
valid `Dockerfile` must start with a `FROM` instruction. The image can be
any valid image – it is especially easy to start by **pulling an image** from
the [*Public Repositories*](https://docs.docker.com/engine/tutorials/dockerrepos/).
@y
{% comment %}
The `FROM` instruction initializes a new build stage and sets the
[*Base Image*](../../glossary/#base-image) for subsequent instructions. As such, a
valid `Dockerfile` must start with a `FROM` instruction. The image can be
any valid image – it is especially easy to start by **pulling an image** from
the [*Public Repositories*](https://docs.docker.com/engine/tutorials/dockerrepos/).
{% endcomment %}
`FROM` 命令は、イメージビルドのための処理ステージを初期化し、[*ベースイメージ*](../../glossary/#base-image)を設定します。後続の命令がこれに続きます。
このため、正しい `Dockerfile` は `FROM` 命令から始めなければなりません。
ベースイメージは正しいものであれば何でも構いません。
簡単に取り掛かりたいときは、[*公開リポジトリ*](https://docs.docker.com/engine/tutorials/dockerrepos/)から**イメージを取得**します。
@z

@x
- `ARG` is the only instruction that may precede `FROM` in the `Dockerfile`.
  See [Understand how ARG and FROM interact](#understand-how-arg-and-from-interact).
@y
{% comment %}
- `ARG` is the only instruction that may precede `FROM` in the `Dockerfile`.
  See [Understand how ARG and FROM interact](#understand-how-arg-and-from-interact).
{% endcomment %}
- `Dockerfile` 内にて `ARG` は、`FROM` よりも前に記述できる唯一の命令です。
  [ARG と FROM の関連について](#understand-how-arg-and-from-interact)を参照してください。
@z

@x
- `FROM` can appear multiple times within a single `Dockerfile` to
  create multiple images or use one build stage as a dependency for another.
  Simply make a note of the last image ID output by the commit before each new
  `FROM` instruction. Each `FROM` instruction clears any state created by previous
  instructions.
@y
{% comment %}
- `FROM` can appear multiple times within a single `Dockerfile` to
  create multiple images or use one build stage as a dependency for another.
  Simply make a note of the last image ID output by the commit before each new
  `FROM` instruction. Each `FROM` instruction clears any state created by previous
  instructions.
{% endcomment %}
- 1 つの `Dockerfile` 内に `FROM` を複数記述することが可能です。
  これは複数のイメージを生成するため、あるいは 1 つのビルドステージを使って依存イメージをビルドするために行います。
  各 `FROM` 命令までのコミットによって出力される最終のイメージ ID は書き留めておいてください。
  個々の `FROM` 命令は、それ以前の命令により作り出された状態を何も変更しません。
@z

@x
- Optionally a name can be given to a new build stage by adding `AS name` to the
  `FROM` instruction. The name can be used in subsequent `FROM` and
  `COPY --from=<name|index>` instructions to refer to the image built in this stage.
@y
{% comment %}
- Optionally a name can be given to a new build stage by adding `AS name` to the
  `FROM` instruction. The name can be used in subsequent `FROM` and
  `COPY --from=<name|index>` instructions to refer to the image built in this stage.
{% endcomment %}
- オプションとして、新たなビルドステージに対しては名前をつけることができます。
  これは `FROM` 命令の `AS name` により行います。
  この名前は後続の `FROM` や `COPY --from=<name|index>` 命令において利用することができ、このビルドステージにおいてビルドされたイメージを参照します。
@z

@x
- The `tag` or `digest` values are optional. If you omit either of them, the
  builder assumes a `latest` tag by default. The builder returns an error if it
  cannot find the `tag` value.
@y
{% comment %}
- The `tag` or `digest` values are optional. If you omit either of them, the
  builder assumes a `latest` tag by default. The builder returns an error if it
  cannot find the `tag` value.
{% endcomment %}
- `tag` と `digest` の設定はオプションです。
  これを省略した場合、デフォルトである `latest` タグが指定されたものとして扱われます。
  `tag` の値に合致するものがなければ、エラーが返されます。
@z

@x
### Understand how ARG and FROM interact
@y
{% comment %}
### Understand how ARG and FROM interact
{% endcomment %}
### ARG と FROM の関連について
{: #understand-how-arg-and-from-interact }
@z

@x
`FROM` instructions support variables that are declared by any `ARG`
instructions that occur before the first `FROM`.
@y
{% comment %}
`FROM` instructions support variables that are declared by any `ARG`
instructions that occur before the first `FROM`.
{% endcomment %}
`FROM` 命令では、`ARG` 命令によって宣言された変数すべてを参照できます。
この `ARG` 命令は、初出の `FROM` 命令よりも前に記述します。
@z

@x
```Dockerfile
ARG  CODE_VERSION=latest
FROM base:${CODE_VERSION}
CMD  /code/run-app
@y
```Dockerfile
ARG  CODE_VERSION=latest
FROM base:${CODE_VERSION}
CMD  /code/run-app
@z

@x
FROM extras:${CODE_VERSION}
CMD  /code/run-extras
```
@y
FROM extras:${CODE_VERSION}
CMD  /code/run-extras
```
@z

@x
An `ARG` declared before a `FROM` is outside of a build stage, so it
can't be used in any instruction after a `FROM`. To use the default value of
an `ARG` declared before the first `FROM` use an `ARG` instruction without
a value inside of a build stage:
@y
{% comment %}
An `ARG` declared before a `FROM` is outside of a build stage, so it
can't be used in any instruction after a `FROM`. To use the default value of
an `ARG` declared before the first `FROM` use an `ARG` instruction without
a value inside of a build stage:
{% endcomment %}
`FROM` よりも前に宣言されている `ARG` は、ビルドステージ内に含まれるものではありません。
したがって `FROM` 以降の命令において利用することはできません。
初出の `FROM` よりも前に宣言された `ARG` の値を利用するには、ビルドステージ内において `ARG` 命令を、値を設定することなく利用します。
@z

@x
```Dockerfile
ARG VERSION=latest
FROM busybox:$VERSION
ARG VERSION
RUN echo $VERSION > image_version
```
@y
```Dockerfile
ARG VERSION=latest
FROM busybox:$VERSION
ARG VERSION
RUN echo $VERSION > image_version
```
@z

@x
## RUN
@y
## RUN
@z

@x
RUN has 2 forms:
@y
{% comment %}
RUN has 2 forms:
{% endcomment %}
RUN には 2 つの書式があります。
@z

@x
- `RUN <command>` (*shell* form, the command is run in a shell, which by
default is `/bin/sh -c` on Linux or `cmd /S /C` on Windows)
- `RUN ["executable", "param1", "param2"]` (*exec* form)
@y
{% comment %}
- `RUN <command>` (*shell* form, the command is run in a shell, which by
default is `/bin/sh -c` on Linux or `cmd /S /C` on Windows)
- `RUN ["executable", "param1", "param2"]` (*exec* form)
{% endcomment %}
- `RUN <command>` （シェル形式、コマンドはシェル内で実行される、シェルとはデフォルトで Linux なら `/bin/sh -c`、Windows なら `cmd /S /C`）
- `RUN ["executable", "param1", "param2"]` （exec 形式）
@z

@x
The `RUN` instruction will execute any commands in a new layer on top of the
current image and commit the results. The resulting committed image will be
used for the next step in the `Dockerfile`.
@y
{% comment %}
The `RUN` instruction will execute any commands in a new layer on top of the
current image and commit the results. The resulting committed image will be
used for the next step in the `Dockerfile`.
{% endcomment %}
`RUN` 命令は、現在のイメージの最上位の最新レイヤーにおいて、あらゆるコマンドを実行します。
そして処理結果を確定します。
結果が確定したイメージは、`Dockerfile` の次のステップにおいて利用されていきます。
@z

@x
Layering `RUN` instructions and generating commits conforms to the core
concepts of Docker where commits are cheap and containers can be created from
any point in an image's history, much like source control.
@y
{% comment %}
Layering `RUN` instructions and generating commits conforms to the core
concepts of Docker where commits are cheap and containers can be created from
any point in an image's history, much like source control.
{% endcomment %}
`RUN` 命令をレイヤー上にて扱い、処理確定を行うこの方法は、Docker の根本的な考え方に基づいています。
この際の処理確定は容易なものであって、イメージの処理履歴上のどの時点からでもコンテナーを復元できます。
この様子はソース管理システムに似ています。
@z

@x
The *exec* form makes it possible to avoid shell string munging, and to `RUN`
commands using a base image that does not contain the specified shell executable.
@y
{% comment %}
The *exec* form makes it possible to avoid shell string munging, and to `RUN`
commands using a base image that does not contain the specified shell executable.
{% endcomment %}
exec 形式は、シェル文字列が置換されないようにします。
そして `RUN` の実行にあたっては、特定のシェル変数を含まないベースイメージを用います。
@z

@x
The default shell for the *shell* form can be changed using the `SHELL`
command.
@y
{% comment %}
The default shell for the *shell* form can be changed using the `SHELL`
command.
{% endcomment %}
シェル形式にて用いるデフォルトのシェルを変更するには `SHELL` コマンドを使います。
@z

@x
In the *shell* form you can use a `\` (backslash) to continue a single
RUN instruction onto the next line. For example, consider these two lines:
@y
{% comment %}
In the *shell* form you can use a `\` (backslash) to continue a single
RUN instruction onto the next line. For example, consider these two lines:
{% endcomment %}
シェル形式においては `\`（バックスラッシュ）を用いて、1 つの RUN 命令を次行にわたって記述することができます。
たとえば以下のような 2 行があるとします。
@z

@x
```
RUN /bin/bash -c 'source $HOME/.bashrc; \
echo $HOME'
```
Together they are equivalent to this single line:
@y
```
RUN /bin/bash -c 'source $HOME/.bashrc; \
echo $HOME'
```
{% comment %}
Together they are equivalent to this single line:
{% endcomment %}
上は 2 行を合わせて、以下の 1 行としたものと同じです。
@z

@x
```
RUN /bin/bash -c 'source $HOME/.bashrc; echo $HOME'
```
@y
```
RUN /bin/bash -c 'source $HOME/.bashrc; echo $HOME'
```
@z

@x
> **Note**:
> To use a different shell, other than '/bin/sh', use the *exec* form
> passing in the desired shell. For example,
> `RUN ["/bin/bash", "-c", "echo hello"]`
@y
{% comment %}
> **Note**:
> To use a different shell, other than '/bin/sh', use the *exec* form
> passing in the desired shell. For example,
> `RUN ["/bin/bash", "-c", "echo hello"]`
{% endcomment %}
> **メモ**:
> '/bin/sh' 以外の別のシェルを利用する場合は、exec 形式を用いて、目的とするシェルを引数に与えます。
> たとえば `RUN ["/bin/bash", "-c", "echo hello"]` とします。
@z

@x
> **Note**:
> The *exec* form is parsed as a JSON array, which means that
> you must use double-quotes (") around words not single-quotes (').
@y
{% comment %}
> **Note**:
> The *exec* form is parsed as a JSON array, which means that
> you must use double-quotes (") around words not single-quotes (').
{% endcomment %}
> **メモ**:
> exec 形式は JSON 配列として解釈されます。
> したがって文字列をくくるのはダブルクォート（"）であり、シングルクォート（'）は用いてはなりません。
@z

@x
> **Note**:
> Unlike the *shell* form, the *exec* form does not invoke a command shell.
> This means that normal shell processing does not happen. For example,
> `RUN [ "echo", "$HOME" ]` will not do variable substitution on `$HOME`.
> If you want shell processing then either use the *shell* form or execute
> a shell directly, for example: `RUN [ "sh", "-c", "echo $HOME" ]`.
> When using the exec form and executing a shell directly, as in the case for
> the shell form, it is the shell that is doing the environment variable
> expansion, not docker.
>
> **Note**:
> In the *JSON* form, it is necessary to escape backslashes. This is
> particularly relevant on Windows where the backslash is the path separator.
> The following line would otherwise be treated as *shell* form due to not
> being valid JSON, and fail in an unexpected way:
> `RUN ["c:\windows\system32\tasklist.exe"]`
> The correct syntax for this example is:
> `RUN ["c:\\windows\\system32\\tasklist.exe"]`
@y
{% comment %}
> **Note**:
> Unlike the *shell* form, the *exec* form does not invoke a command shell.
> This means that normal shell processing does not happen. For example,
> `RUN [ "echo", "$HOME" ]` will not do variable substitution on `$HOME`.
> If you want shell processing then either use the *shell* form or execute
> a shell directly, for example: `RUN [ "sh", "-c", "echo $HOME" ]`.
> When using the exec form and executing a shell directly, as in the case for
> the shell form, it is the shell that is doing the environment variable
> expansion, not docker.
>
> **Note**:
> In the *JSON* form, it is necessary to escape backslashes. This is
> particularly relevant on Windows where the backslash is the path separator.
> The following line would otherwise be treated as *shell* form due to not
> being valid JSON, and fail in an unexpected way:
> `RUN ["c:\windows\system32\tasklist.exe"]`
> The correct syntax for this example is:
> `RUN ["c:\\windows\\system32\\tasklist.exe"]`
{% endcomment %}
> **メモ**:
> シェル形式とは違って exec 形式はコマンドシェルを起動しません。
> これはつまり、ごく普通のシェル処理とはならないということです。
> たとえば `RUN [ "echo", "$HOME" ]` を実行したとすると、`$HOME` の変数置換は行われません。
> シェル処理が行われるようにしたければ、シェル形式を利用するか、あるいはシェルを直接実行するようにします。
> たとえば `RUN [ "sh", "-c", "echo $HOME" ]` とします。
> exec 形式によってシェルを直接起動した場合、シェル形式の場合でも同じですが、変数置換を行うのはシェルであって、docker ではありません。

> **メモ**:
> JSON 記述において、バックスラッシュはエスケープする必要があります。
> 特に関係してくるのは Windows であり、Windows ではパスセパレーターにバックスラッシュを用います。
> `RUN ["c:\windows\system32\tasklist.exe"]` という記述例は、適正な JSON 記述ではないことになるため、シェル形式として扱われ、思いどおりの動作はせずエラーとなります。
> 正しくは `RUN ["c:\\windows\\system32\\tasklist.exe"]` と記述します。
@z

@x
The cache for `RUN` instructions isn't invalidated automatically during
the next build. The cache for an instruction like
`RUN apt-get dist-upgrade -y` will be reused during the next build. The
cache for `RUN` instructions can be invalidated by using the `--no-cache`
flag, for example `docker build --no-cache`.
@y
{% comment %}
The cache for `RUN` instructions isn't invalidated automatically during
the next build. The cache for an instruction like
`RUN apt-get dist-upgrade -y` will be reused during the next build. The
cache for `RUN` instructions can be invalidated by using the `--no-cache`
flag, for example `docker build --no-cache`.
{% endcomment %}
`RUN` 命令に対するキャッシュは、次のビルドの際、その無効化は自動的に行われません。
`RUN apt-get dist-upgrade -y` のような命令に対するキャッシュは、次のビルドの際にも再利用されます。
`RUN` 命令に対するキャッシュを無効にするためには `--no-cache` フラグを利用します。
たとえば `docker build --no-cache` とします。
@z

@x
See the [`Dockerfile` Best Practices
guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) for more information.
@y
{% comment %}
See the [`Dockerfile` Best Practices
guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) for more information.
{% endcomment %}
詳しくは [`Dockerfile` ベストプラクティスガイド](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)を参照してください。
@z

@x
The cache for `RUN` instructions can be invalidated by `ADD` instructions. See
[below](#add) for details.
@y
{% comment %}
The cache for `RUN` instructions can be invalidated by `ADD` instructions. See
[below](#add) for details.
{% endcomment %}
`RUN` 命令に対するキャッシュは `ADD` 命令を使うと無効になります。
詳しくは[以下](#add)を参照してください。
@z

@x
### Known issues (RUN)
@y
{% comment %}
### Known issues (RUN)
{% endcomment %}
### （RUN に関する）既知の問題
{: #known-issues-run }
@z

@x
- [Issue 783](https://github.com/docker/docker/issues/783) is about file
  permissions problems that can occur when using the AUFS file system. You
  might notice it during an attempt to `rm` a file, for example.
@y
{% comment %}
- [Issue 783](https://github.com/docker/docker/issues/783) is about file
  permissions problems that can occur when using the AUFS file system. You
  might notice it during an attempt to `rm` a file, for example.
{% endcomment %}
- [Issue 783](https://github.com/docker/docker/issues/783) はファイルパーミッションに関する問題を取り上げていて、ファイルシステムに AUFS を用いている場合に発生します。
  たとえば `rm` によってファイルを削除しようとしたときに、これが発生する場合があります。
@z

@x
  For systems that have recent aufs version (i.e., `dirperm1` mount option can
  be set), docker will attempt to fix the issue automatically by mounting
  the layers with `dirperm1` option. More details on `dirperm1` option can be
  found at [`aufs` man page](https://github.com/sfjro/aufs3-linux/tree/aufs3.18/Documentation/filesystems/aufs)
@y
  {% comment %}
  For systems that have recent aufs version (i.e., `dirperm1` mount option can
  be set), docker will attempt to fix the issue automatically by mounting
  the layers with `dirperm1` option. More details on `dirperm1` option can be
  found at [`aufs` man page](https://github.com/sfjro/aufs3-linux/tree/aufs3.18/Documentation/filesystems/aufs)
  {% endcomment %}
  aufs の最新バージョンを利用するシステム（つまりマウントオプション `dirperm1` を設定可能なシステム）の場合、docker はレイヤーに対して `dirperm1` オプションをつけてマウントすることで、この問題を自動的に解消するように試みます。
  `dirperm1` オプションに関する詳細は [`aufs` の man ページ](https://github.com/sfjro/aufs3-linux/tree/aufs3.18/Documentation/filesystems/aufs) を参照してください。
@z

@x
  If your system doesn't have support for `dirperm1`, the issue describes a workaround.
@y
  {% comment %}
  If your system doesn't have support for `dirperm1`, the issue describes a workaround.
  {% endcomment %}
  `dirperm1` をサポートしていないシステムの場合は、issue に示される回避方法を参照してください。
@z

@x
## CMD
@y
## CMD
@z

@x
The `CMD` instruction has three forms:
@y
{% comment %}
The `CMD` instruction has three forms:
{% endcomment %}
`CMD` には 3 つの書式があります。
@z

@x
- `CMD ["executable","param1","param2"]` (*exec* form, this is the preferred form)
- `CMD ["param1","param2"]` (as *default parameters to ENTRYPOINT*)
- `CMD command param1 param2` (*shell* form)
@y
{% comment %}
- `CMD ["executable","param1","param2"]` (*exec* form, this is the preferred form)
- `CMD ["param1","param2"]` (as *default parameters to ENTRYPOINT*)
- `CMD command param1 param2` (*shell* form)
{% endcomment %}
- `CMD ["executable","param1","param2"]` （exec 形式、この形式が推奨される）
- `CMD ["param1","param2"]` （`ENTRYPOINT`のデフォルトパラメーターとして）
- `CMD command param1 param2` （シェル形式）
@z

@x
There can only be one `CMD` instruction in a `Dockerfile`. If you list more than one `CMD`
then only the last `CMD` will take effect.
@y
{% comment %}
There can only be one `CMD` instruction in a `Dockerfile`. If you list more than one `CMD`
then only the last `CMD` will take effect.
{% endcomment %}
`Dockerfile` では `CMD` 命令を 1 つしか記述できません。
仮に複数の `CMD` を記述しても、最後の `CMD` 命令しか処理されません。
@z

@x
**The main purpose of a `CMD` is to provide defaults for an executing
container.** These defaults can include an executable, or they can omit
the executable, in which case you must specify an `ENTRYPOINT`
instruction as well.
@y
{% comment %}
**The main purpose of a `CMD` is to provide defaults for an executing
container.** These defaults can include an executable, or they can omit
the executable, in which case you must specify an `ENTRYPOINT`
instruction as well.
{% endcomment %}
**`CMD` 命令の主目的は、コンテナーの実行時のデフォルト処理を設定することです。**
この処理設定においては、実行モジュールを含める場合と、実行モジュールを省略する場合があります。
省略する場合は `ENTRYPOINT` 命令を合わせて指定する必要があります。
@z

@x
> **Note**:
> If `CMD` is used to provide default arguments for the `ENTRYPOINT`
> instruction, both the `CMD` and `ENTRYPOINT` instructions should be specified
> with the JSON array format.
@y
{% comment %}
> **Note**:
> If `CMD` is used to provide default arguments for the `ENTRYPOINT`
> instruction, both the `CMD` and `ENTRYPOINT` instructions should be specified
> with the JSON array format.
{% endcomment %}
> **メモ**:
> `ENTRYPOINT` 命令に対するデフォルト引数を設定する目的で `CMD` 命令を用いる場合、`CMD` と `ENTRYPOINT` の両命令とも、JSON 配列形式で指定しなければなりません。
@z

@x
> **Note**:
> The *exec* form is parsed as a JSON array, which means that
> you must use double-quotes (") around words not single-quotes (').
@y
{% comment %}
> **Note**:
> The *exec* form is parsed as a JSON array, which means that
> you must use double-quotes (") around words not single-quotes (').
{% endcomment %}
> **メモ**:
> exec 形式は JSON 配列として解釈されます。
> したがって文字列をくくるのはダブルクォート（"）であり、シングルクォート（'）は用いてはなりません。
@z

@x
> **Note**:
> Unlike the *shell* form, the *exec* form does not invoke a command shell.
> This means that normal shell processing does not happen. For example,
> `CMD [ "echo", "$HOME" ]` will not do variable substitution on `$HOME`.
> If you want shell processing then either use the *shell* form or execute
> a shell directly, for example: `CMD [ "sh", "-c", "echo $HOME" ]`.
> When using the exec form and executing a shell directly, as in the case for
> the shell form, it is the shell that is doing the environment variable
> expansion, not docker.
@y
{% comment %}
> **Note**:
> Unlike the *shell* form, the *exec* form does not invoke a command shell.
> This means that normal shell processing does not happen. For example,
> `CMD [ "echo", "$HOME" ]` will not do variable substitution on `$HOME`.
> If you want shell processing then either use the *shell* form or execute
> a shell directly, for example: `CMD [ "sh", "-c", "echo $HOME" ]`.
> When using the exec form and executing a shell directly, as in the case for
> the shell form, it is the shell that is doing the environment variable
> expansion, not docker.
{% endcomment %}
> **メモ**:
> シェル形式とは違って exec 形式はコマンドシェルを起動しません。
> これはつまり、ごく普通のシェル処理とはならないということです。
> たとえば `RUN [ "echo", "$HOME" ]` を実行したとすると、`$HOME` の変数置換は行われません。
> シェル処理が行われるようにしたければ、シェル形式を利用するか、あるいはシェルを直接実行するようにします。
> たとえば `RUN [ "sh", "-c", "echo $HOME" ]` とします。
> exec 形式によってシェルを直接起動した場合、シェル形式の場合でも同じですが、変数置換を行うのはシェルであって、docker ではありません。
@z

@x
When used in the shell or exec formats, the `CMD` instruction sets the command
to be executed when running the image.
@y
{% comment %}
When used in the shell or exec formats, the `CMD` instruction sets the command
to be executed when running the image.
{% endcomment %}
シェル形式または exec 形式を用いる場合、`CMD` 命令は、イメージが起動されたときに実行するコマンドを指定します。
@z

@x
If you use the *shell* form of the `CMD`, then the `<command>` will execute in
`/bin/sh -c`:
@y
{% comment %}
If you use the *shell* form of the `CMD`, then the `<command>` will execute in
`/bin/sh -c`:
{% endcomment %}
シェル形式を用いる場合、`<command>` は `/bin/sh -c` の中で実行されます。
@z

@x
    FROM ubuntu
    CMD echo "This is a test." | wc -
@y
    FROM ubuntu
    CMD echo "This is a test." | wc -
@z

@x
If you want to **run your** `<command>` **without a shell** then you must
express the command as a JSON array and give the full path to the executable.
**This array form is the preferred format of `CMD`.** Any additional parameters
must be individually expressed as strings in the array:
@y
{% comment %}
If you want to **run your** `<command>` **without a shell** then you must
express the command as a JSON array and give the full path to the executable.
**This array form is the preferred format of `CMD`.** Any additional parameters
must be individually expressed as strings in the array:
{% endcomment %}
`<command>`**をシェル実行することなく実行**したい場合は、そのコマンドを JSON 配列として表現し、またそのコマンドの実行モジュールへのフルパスを指定しなければなりません。
**この配列書式は `CMD` において推奨される記述です。**
パラメーターを追加する必要がある場合は、配列内にて文字列として記述します。
@z

@x
    FROM ubuntu
    CMD ["/usr/bin/wc","--help"]
@y
    FROM ubuntu
    CMD ["/usr/bin/wc","--help"]
@z

@x
If you would like your container to run the same executable every time, then
you should consider using `ENTRYPOINT` in combination with `CMD`. See
[*ENTRYPOINT*](#entrypoint).
@y
{% comment %}
If you would like your container to run the same executable every time, then
you should consider using `ENTRYPOINT` in combination with `CMD`. See
[*ENTRYPOINT*](#entrypoint).
{% endcomment %}
コンテナーにおいて毎回同じ実行モジュールを起動させたい場合は、`CMD` 命令と `ENTRYPOINT` 命令を合わせて利用することを考えてみてください。
[*ENTRYPOINT*](#entrypoint) を参照のこと。
@z

@x
If the user specifies arguments to `docker run` then they will override the
default specified in `CMD`.
@y
{% comment %}
If the user specifies arguments to `docker run` then they will override the
default specified in `CMD`.
{% endcomment %}
`docker run` において引数を指定することで、`CMD` 命令に指定されたデフォルトを上書きすることができます。
@z

@x
> **Note**:
> Don't confuse `RUN` with `CMD`. `RUN` actually runs a command and commits
> the result; `CMD` does not execute anything at build time, but specifies
> the intended command for the image.
@y
{% comment %}
> **Note**:
> Don't confuse `RUN` with `CMD`. `RUN` actually runs a command and commits
> the result; `CMD` does not execute anything at build time, but specifies
> the intended command for the image.
{% endcomment %}
> **メモ**:
> `RUN` と `CMD` を混同しないようにしてください。
> `RUN` は実際にコマンドが実行されて、結果を確定させます。
> 一方 `CMD` はイメージビルド時には何も実行しません。
> イメージに対して実行する予定のコマンドを指示するものです。
@z

@x
## LABEL
@y
## LABEL
@z

@x
    LABEL <key>=<value> <key>=<value> <key>=<value> ...
@y
    LABEL <key>=<value> <key>=<value> <key>=<value> ...
@z

@x
The `LABEL` instruction adds metadata to an image. A `LABEL` is a
key-value pair. To include spaces within a `LABEL` value, use quotes and
backslashes as you would in command-line parsing. A few usage examples:
@y
{% comment %}
The `LABEL` instruction adds metadata to an image. A `LABEL` is a
key-value pair. To include spaces within a `LABEL` value, use quotes and
backslashes as you would in command-line parsing. A few usage examples:
{% endcomment %}
`LABEL` 命令はイメージに対してメタデータを追加します。
`LABEL` ではキーバリューペアによる記述を行います。
値に空白などを含める場合は、クォートとバックスラッシュを用います。
これはコマンドライン処理において行うことと同じです。
以下に簡単な例を示します。
@z

@x
    LABEL "com.example.vendor"="ACME Incorporated"
    LABEL com.example.label-with-value="foo"
    LABEL version="1.0"
    LABEL description="This text illustrates \
    that label-values can span multiple lines."
@y
    LABEL "com.example.vendor"="ACME Incorporated"
    LABEL com.example.label-with-value="foo"
    LABEL version="1.0"
    LABEL description="This text illustrates \
    that label-values can span multiple lines."
@z

@x
An image can have more than one label. You can specify multiple labels on a
single line. Prior to Docker 1.10, this decreased the size of the final image,
but this is no longer the case. You may still choose to specify multiple labels
in a single instruction, in one of the following two ways:
@y
{% comment %}
An image can have more than one label. You can specify multiple labels on a
single line. Prior to Docker 1.10, this decreased the size of the final image,
but this is no longer the case. You may still choose to specify multiple labels
in a single instruction, in one of the following two ways:
{% endcomment %}
イメージには複数のラベルを含めることができます。
その複数のラベルは 1 行で記述することもできます。
Docker 1.10 以前では 1 行で記述することにより、ビルドされるイメージのサイズが軽減されていましたが、今はそのようなことはありません。
それでも、複数ラベルを 1 つの命令として記述しても構いません。
つまり以下のように 2 つの方法をとることができます。
@z

@x
```none
LABEL multi.label1="value1" multi.label2="value2" other="value3"
```
@y
```none
LABEL multi.label1="value1" multi.label2="value2" other="value3"
```
@z

@x
```none
LABEL multi.label1="value1" \
      multi.label2="value2" \
      other="value3"
```
@y
```none
LABEL multi.label1="value1" \
      multi.label2="value2" \
      other="value3"
```
@z

@x
Labels included in base or parent images (images in the `FROM` line) are
inherited by your image. If a label already exists but with a different value,
the most-recently-applied value overrides any previously-set value.
@y
{% comment %}
Labels included in base or parent images (images in the `FROM` line) are
inherited by your image. If a label already exists but with a different value,
the most-recently-applied value overrides any previously-set value.
{% endcomment %}
ベースイメージまたは親イメージ（`FROM` 命令で指定されたイメージ）に含まれるラベルは、ビルドしようとしているイメージに継承されます。
同一のラベル設定が存在していて、異なる値が設定されていた場合は、最終的に設定される値によって古い値は上書きされます。
@z

@x
To view an image's labels, use the `docker inspect` command.
@y
{% comment %}
To view an image's labels, use the `docker inspect` command.
{% endcomment %}
イメージのラベルを参照するには `docker inspect` コマンドを用います。
@z

@x
    "Labels": {
        "com.example.vendor": "ACME Incorporated"
        "com.example.label-with-value": "foo",
        "version": "1.0",
        "description": "This text illustrates that label-values can span multiple lines.",
        "multi.label1": "value1",
        "multi.label2": "value2",
        "other": "value3"
    },
@y
    "Labels": {
        "com.example.vendor": "ACME Incorporated"
        "com.example.label-with-value": "foo",
        "version": "1.0",
        "description": "This text illustrates that label-values can span multiple lines.",
        "multi.label1": "value1",
        "multi.label2": "value2",
        "other": "value3"
    },
@z

@x
## MAINTAINER (deprecated)
@y
{% comment %}
## MAINTAINER (deprecated)
{% endcomment %}
## MAINTAINER （廃止予定）
{: #maintainer-deprecated }
@z

@x
    MAINTAINER <name>
@y
    MAINTAINER <name>
@z

@x
The `MAINTAINER` instruction sets the *Author* field of the generated images.
The `LABEL` instruction is a much more flexible version of this and you should use
it instead, as it enables setting any metadata you require, and can be viewed
easily, for example with `docker inspect`. To set a label corresponding to the
`MAINTAINER` field you could use:
@y
{% comment %}
The `MAINTAINER` instruction sets the *Author* field of the generated images.
The `LABEL` instruction is a much more flexible version of this and you should use
it instead, as it enables setting any metadata you require, and can be viewed
easily, for example with `docker inspect`. To set a label corresponding to the
`MAINTAINER` field you could use:
{% endcomment %}
`MAINTAINER` 命令は、ビルドされるイメージの *Author* フィールドを設定します。
`LABEL` 命令を使った方がこれよりも柔軟に対応できるため、`LABEL` を使うようにします。
そうすれば必要なメタデータとしてどのようにでも設定ができて、`docker inspect` を用いて簡単に参照することができます。
`MAINTAINER` フィールドに相当するラベルを作るには、以下のようにします。
@z

@x
    LABEL maintainer="SvenDowideit@home.org.au"
@y
    LABEL maintainer="SvenDowideit@home.org.au"
@z

@x
This will then be visible from `docker inspect` with the other labels.
@y
{% comment %}
This will then be visible from `docker inspect` with the other labels.
{% endcomment %}
こうすれば `docker inspect` によってラベルをすべて確認することができます。
@z

@x
## EXPOSE
@y
## EXPOSE
@z

@x
    EXPOSE <port> [<port>/<protocol>...]
@y
    EXPOSE <port> [<port>/<protocol>...]
@z

@x
The `EXPOSE` instruction informs Docker that the container listens on the
specified network ports at runtime. You can specify whether the port listens on
TCP or UDP, and the default is TCP if the protocol is not specified.
@y
{% comment %}
The `EXPOSE` instruction informs Docker that the container listens on the
specified network ports at runtime. You can specify whether the port listens on
TCP or UDP, and the default is TCP if the protocol is not specified.
{% endcomment %}
`EXPOSE` 命令はコンテナーの実行時に、所定ネットワーク上のどのポートをリッスンするかを指定します。
リッスンするポートは TCP、UDP のいずれでも指定可能です。
プロトコルが指定されていない場合は、デフォルトとして TCP が採用されます。
@z

@x
The `EXPOSE` instruction does not actually publish the port. It functions as a
type of documentation between the person who builds the image and the person who
runs the container, about which ports are intended to be published. To actually
publish the port when running the container, use the `-p` flag on `docker run`
to publish and map one or more ports, or the `-P` flag to publish all exposed
ports and map them to high-order ports.
@y
{% comment %}
The `EXPOSE` instruction does not actually publish the port. It functions as a
type of documentation between the person who builds the image and the person who
runs the container, about which ports are intended to be published. To actually
publish the port when running the container, use the `-p` flag on `docker run`
to publish and map one or more ports, or the `-P` flag to publish all exposed
ports and map them to high-order ports.
{% endcomment %}
`EXPOSE` 命令は実際にはポートを公開するものではありません。
これはイメージの作成者とコンテナーの実行者との間で取り交わす、言ってみればメモです。
どのポートを公開するつもりでいるのかを表わしています。
コンテナーが実行されるときに実際にポートを公開するには、`docker run` の `-p` フラグを利用します。
これによって複数のポートへの割り当てが行われます。
あるいは `-P` フラグを用いると、すべてのポートを公開し、ホストの高位のポートに割り当てます。
@z

@x
By default, `EXPOSE` assumes TCP. You can also specify UDP:
@y
{% comment %}
By default, `EXPOSE` assumes TCP. You can also specify UDP:
{% endcomment %}
デフォルトで `EXPOSE` は TCP を想定していますが、UDP を指定することもできます。
@z

@x
```Dockerfile
EXPOSE 80/udp
```
@y
```Dockerfile
EXPOSE 80/udp
```
@z

@x
To expose on both TCP and UDP, include two lines:
@y
{% comment %}
To expose on both TCP and UDP, include two lines:
{% endcomment %}
TCP と UDP の両方を公開する場合は、以下のような 2 行を記述します。
@z

@x
```Dockerfile
EXPOSE 80/tcp
EXPOSE 80/udp
```
@y
```Dockerfile
EXPOSE 80/tcp
EXPOSE 80/udp
```
@z

@x
In this case, if you use `-P` with `docker run`, the port will be exposed once
for TCP and once for UDP. Remember that `-P` uses an ephemeral high-ordered host
port on the host, so the port will not be the same for TCP and UDP.
@y
{% comment %}
In this case, if you use `-P` with `docker run`, the port will be exposed once
for TCP and once for UDP. Remember that `-P` uses an ephemeral high-ordered host
port on the host, so the port will not be the same for TCP and UDP.
{% endcomment %}
これに対して `docker run` に `-P` をつけて実行すると、一度は TCP のポートが開き、また別のときに UDP のポートが開きます。
`-P` を用いると、ホスト上の高位のポートが順次（ephemeralに）割り当てられます。
したがって TCP と UDP のポートは同一とはなりません。
@z

@x
Regardless of the `EXPOSE` settings, you can override them at runtime by using
the `-p` flag. For example
@y
{% comment %}
Regardless of the `EXPOSE` settings, you can override them at runtime by using
the `-p` flag. For example
{% endcomment %}
`EXPOSE` による設定を行っていても、実行時に `-p` フラグを使って上書き指定することができます。
たとえば以下のとおりです。
@z

@x
```bash
docker run -p 80:80/tcp -p 80:80/udp ...
```
@y
```bash
docker run -p 80:80/tcp -p 80:80/udp ...
```
@z

@x
To set up port redirection on the host system, see [using the -P
flag](run.md#expose-incoming-ports). The `docker network` command supports
creating networks for communication among containers without the need to
expose or publish specific ports, because the containers connected to the
network can communicate with each other over any port. For detailed information,
see the
[overview of this feature](https://docs.docker.com/engine/userguide/networking/)).
@y
{% comment %}
To set up port redirection on the host system, see [using the -P
flag](run.md#expose-incoming-ports). The `docker network` command supports
creating networks for communication among containers without the need to
expose or publish specific ports, because the containers connected to the
network can communicate with each other over any port. For detailed information,
see the
[overview of this feature](https://docs.docker.com/engine/userguide/networking/)).
{% endcomment %}
ホストシステム上においてポート転送を行う場合は、[-P フラグの利用](run.md#expose-incoming-ports)を参照してください。
`docker network` コマンドでは、コンテナー間の通信を行うネットワークの生成をサポートします。
このネットワークでは公開するポートの指定を必要としません。
なぜならネットワークに接続されるコンテナーは、ポートとは関係なく互いに通信ができるようになっています。
詳しくは[ネットワーク機能の概要](https://docs.docker.com/engine/userguide/networking/)を参照してください。
@z

@x
## ENV
@y
## ENV
@z

@x
    ENV <key> <value>
    ENV <key>=<value> ...
@y
    ENV <key> <value>
    ENV <key>=<value> ...
@z

@x
The `ENV` instruction sets the environment variable `<key>` to the value
`<value>`. This value will be in the environment for all subsequent instructions
in the build stage and can be [replaced inline](#environment-replacement) in
many as well.
@y
{% comment %}
The `ENV` instruction sets the environment variable `<key>` to the value
`<value>`. This value will be in the environment for all subsequent instructions
in the build stage and can be [replaced inline](#environment-replacement) in
many as well.
{% endcomment %}
`ENV` 命令は、環境変数 `<key>` に `<value>` という値を設定します。
ビルドステージ内の後続命令の環境において、環境変数の値は維持されます。
また、いろいろと[インラインにて変更](#environment-replacement)することもできます。
@z

@x
The `ENV` instruction has two forms. The first form, `ENV <key> <value>`,
will set a single variable to a value. The entire string after the first
space will be treated as the `<value>` - including whitespace characters. The
value will be interpreted for other environment variables, so quote characters
will be removed if they are not escaped.
@y
{% comment %}
The `ENV` instruction has two forms. The first form, `ENV <key> <value>`,
will set a single variable to a value. The entire string after the first
space will be treated as the `<value>` - including whitespace characters. The
value will be interpreted for other environment variables, so quote characters
will be removed if they are not escaped.
{% endcomment %}
`ENV` 命令には 2 つの書式があります。
1 つめの書式は `ENV <key> <value>` です。
1 つの変数に対して 1 つの値を設定します。
全体の文字列のうち、最初の空白文字以降がすべて `<value>` として扱われます。
そこにはホワイトスペース文字を含んでいて構いません。
この値は他の環境変数において用いられることも考えられます。
したがってクォート文字は、エスケープされていなければ無視されます。
@z

@x
The second form, `ENV <key>=<value> ...`, allows for multiple variables to
be set at one time. Notice that the second form uses the equals sign (=)
in the syntax, while the first form does not. Like command line parsing,
quotes and backslashes can be used to include spaces within values.
@y
{% comment %}
The second form, `ENV <key>=<value> ...`, allows for multiple variables to
be set at one time. Notice that the second form uses the equals sign (=)
in the syntax, while the first form does not. Like command line parsing,
quotes and backslashes can be used to include spaces within values.
{% endcomment %}
2 つめの書式は `ENV <key>=<value> ...` です。
これは一度に複数の値を設定できる形です。
この書式では等号（=）を用いており、1 つめの書式とは異なります。
コマンドライン上の解析で行われることと同じように、クォートやバックスラッシュを使えば、値の中に空白などを含めることができます。
@z

@x
For example:
@y
{% comment %}
For example:
{% endcomment %}
たとえば以下のとおりです。
@z

@x
    ENV myName="John Doe" myDog=Rex\ The\ Dog \
        myCat=fluffy
@y
    ENV myName="John Doe" myDog=Rex\ The\ Dog \
        myCat=fluffy
@z

@x
and
@y
{% comment %}
and
{% endcomment %}
そして以下です。
@z

@x
    ENV myName John Doe
    ENV myDog Rex The Dog
    ENV myCat fluffy
@y
    ENV myName John Doe
    ENV myDog Rex The Dog
    ENV myCat fluffy
@z

@x
will yield the same net results in the final image.
@y
{% comment %}
will yield the same net results in the final image.
{% endcomment %}
上の 2 つは最終的に同じ結果をイメージに書き入れます。
@z

@x
The environment variables set using `ENV` will persist when a container is run
from the resulting image. You can view the values using `docker inspect`, and
change them using `docker run --env <key>=<value>`.
@y
{% comment %}
The environment variables set using `ENV` will persist when a container is run
from the resulting image. You can view the values using `docker inspect`, and
change them using `docker run --env <key>=<value>`.
{% endcomment %}
`ENV` を用いて設定された環境変数は、そのイメージから実行されたコンテナーであれば維持されます。
環境変数の参照は `docker inspect` を用い、値の変更は `docker run --env <key>=<value>` により行うことができます。
@z

@x
> **Note**:
> Environment persistence can cause unexpected side effects. For example,
> setting `ENV DEBIAN_FRONTEND noninteractive` may confuse apt-get
> users on a Debian-based image. To set a value for a single command, use
> `RUN <key>=<value> <command>`.
@y
{% comment %}
> **Note**:
> Environment persistence can cause unexpected side effects. For example,
> setting `ENV DEBIAN_FRONTEND noninteractive` may confuse apt-get
> users on a Debian-based image. To set a value for a single command, use
> `RUN <key>=<value> <command>`.
{% endcomment %}
> **メモ**:
> 環境変数が維持されると、思わぬ副作用を引き起こすことがあります。
> たとえば `ENV DEBIAN_FRONTEND noninteractive` という設定を行なっていると、Debian ベースのイメージにおいて apt-get を使う際には混乱を起こすかもしれません。
> 1 つのコマンドには 1 つの値のみを設定するには `RUN <key>=<value> <command>` を実行します。
@z

@x
## ADD
@y
## ADD
@z

@x
ADD has two forms:
@y
{% comment %}
ADD has two forms:
{% endcomment %}
ADD には 2 つの書式があります。
@z

@x
- `ADD [--chown=<user>:<group>] <src>... <dest>`
- `ADD [--chown=<user>:<group>] ["<src>",... "<dest>"]` (this form is required for paths containing
whitespace)
@y
{% comment %}
- `ADD [--chown=<user>:<group>] <src>... <dest>`
- `ADD [--chown=<user>:<group>] ["<src>",... "<dest>"]` (this form is required for paths containing
whitespace)
{% endcomment %}
- `ADD [--chown=<user>:<group>] <src>... <dest>`
- `ADD [--chown=<user>:<group>] ["<src>",... "<dest>"]` （この書式はホワイトスペースを含むパスを用いる場合に必要）
@z

@x
> **Note**:
> The `--chown` feature is only supported on Dockerfiles used to build Linux containers,
> and will not work on Windows containers. Since user and group ownership concepts do
> not translate between Linux and Windows, the use of `/etc/passwd` and `/etc/group` for
> translating user and group names to IDs restricts this feature to only be viable
> for Linux OS-based containers.
@y
{% comment %}
> **Note**:
> The `--chown` feature is only supported on Dockerfiles used to build Linux containers,
> and will not work on Windows containers. Since user and group ownership concepts do
> not translate between Linux and Windows, the use of `/etc/passwd` and `/etc/group` for
> translating user and group names to IDs restricts this feature to only be viable
> for Linux OS-based containers.
{% endcomment %}
> **メモ**:
> `--chown` による機能は Linux コンテナーをビルドする Dockerfile においてのみサポートされるものであり、Windows コンテナーに対しては動作しません。
> Linux と Windows の間で、ユーザーやグループの所有権という考え方が共有されないためです。
> この機能では `/etc/passwd` や `/etc/group` を使って、ユーザーやグループの名前を ID に変換するため、この機能が実現できるのは Linux OS をベースとするコンテナーに限定されます。
@z

@x
The `ADD` instruction copies new files, directories or remote file URLs from `<src>`
and adds them to the filesystem of the image at the path `<dest>`.
@y
{% comment %}
The `ADD` instruction copies new files, directories or remote file URLs from `<src>`
and adds them to the filesystem of the image at the path `<dest>`.
{% endcomment %}
`ADD` 命令は `<src>` に示されるファイル、ディレクトリ、リモートファイル URL をコピーして、イメージ内のファイルシステム上のパス `<dest>` にこれらを加えます。
@z

@x
Multiple `<src>` resources may be specified but if they are files or
directories, their paths are interpreted as relative to the source of
the context of the build.
@y
{% comment %}
Multiple `<src>` resources may be specified but if they are files or
directories, their paths are interpreted as relative to the source of
the context of the build.
{% endcomment %}
`<src>` には複数のソースを指定することが可能です。
ソースとしてファイルあるいはディレクトリが指定されている場合、そのパスはビルドコンテキストからの相対パスとして解釈されます。
@z

@x
Each `<src>` may contain wildcards and matching will be done using Go's
[filepath.Match](http://golang.org/pkg/path/filepath#Match) rules. For example:
@y
{% comment %}
Each `<src>` may contain wildcards and matching will be done using Go's
[filepath.Match](http://golang.org/pkg/path/filepath#Match) rules. For example:
{% endcomment %}
`<src>` にはワイルドカードを含めることができます。
その場合、マッチング処理は Go 言語の [filepath.Match](http://golang.org/pkg/path/filepath#Match) ルールに従って行われます。
記述例は以下のとおりです。
@z

@x
    ADD hom* /mydir/        # adds all files starting with "hom"
    ADD hom?.txt /mydir/    # ? is replaced with any single character, e.g., "home.txt"
@y
    {% comment %}
    ADD hom* /mydir/        # adds all files starting with "hom"
    ADD hom?.txt /mydir/    # ? is replaced with any single character, e.g., "home.txt"
    {% endcomment %}
    ADD hom* /mydir/        # "hom" で始まるファイルすべてを追加します。
    ADD hom?.txt /mydir/    # ? は 1 文字にマッチします。たとえば "home.txt" にマッチします。
@z

@x
The `<dest>` is an absolute path, or a path relative to `WORKDIR`, into which
the source will be copied inside the destination container.
@y
{% comment %}
The `<dest>` is an absolute path, or a path relative to `WORKDIR`, into which
the source will be copied inside the destination container.
{% endcomment %}
`<dest>` は絶対パスか、あるいは `WORKDIR` からの相対パスにより指定します。
対象としているコンテナー内において、そのパスに対してソースがコピーされます。
@z

@x
    ADD test relativeDir/          # adds "test" to `WORKDIR`/relativeDir/
    ADD test /absoluteDir/         # adds "test" to /absoluteDir/
@y
    {% comment %}
    ADD test relativeDir/          # adds "test" to `WORKDIR`/relativeDir/
    ADD test /absoluteDir/         # adds "test" to /absoluteDir/
    {% endcomment %}
    ADD test relativeDir/          # "test" を `WORKDIR`/relativeDir/ へ追加します。
    ADD test /absoluteDir/         # "test" を /absoluteDir/ へ追加します。
@z

@x
When adding files or directories that contain special characters (such as `[`
and `]`), you need to escape those paths following the Golang rules to prevent
them from being treated as a matching pattern. For example, to add a file
named `arr[0].txt`, use the following;
@y
{% comment %}
When adding files or directories that contain special characters (such as `[`
and `]`), you need to escape those paths following the Golang rules to prevent
them from being treated as a matching pattern. For example, to add a file
named `arr[0].txt`, use the following;
{% endcomment %}
ファイルやディレクトリを追加する際に、その名前の中に（`[` や `]` のような）特殊な文字が含まれている場合は、Go 言語のルールに従ってパス名をエスケープする必要があります。
これはパターンマッチングとして扱われないようにするものです。
たとえば `arr[0].txt` というファイルを追加する場合は、以下のようにします。
@z

@x
    ADD arr[[]0].txt /mydir/    # copy a file named "arr[0].txt" to /mydir/
@y
    ADD arr[[]0].txt /mydir/    # "arr[0].txt" というファイルを /mydir/ へコピーします。
@z

@x
All new files and directories are created with a UID and GID of 0, unless the
optional `--chown` flag specifies a given username, groupname, or UID/GID
combination to request specific ownership of the content added. The
format of the `--chown` flag allows for either username and groupname strings
or direct integer UID and GID in any combination. Providing a username without
groupname or a UID without GID will use the same numeric UID as the GID. If a
username or groupname is provided, the container's root filesystem
`/etc/passwd` and `/etc/group` files will be used to perform the translation
from name to integer UID or GID respectively. The following examples show
valid definitions for the `--chown` flag:
@y
{% comment %}
All new files and directories are created with a UID and GID of 0, unless the
optional `--chown` flag specifies a given username, groupname, or UID/GID
combination to request specific ownership of the content added. The
format of the `--chown` flag allows for either username and groupname strings
or direct integer UID and GID in any combination. Providing a username without
groupname or a UID without GID will use the same numeric UID as the GID. If a
username or groupname is provided, the container's root filesystem
`/etc/passwd` and `/etc/group` files will be used to perform the translation
from name to integer UID or GID respectively. The following examples show
valid definitions for the `--chown` flag:
{% endcomment %}
ADD されるファイルやディレクトリの UID と GID は、すべて 0 として生成されます。
ただしオプションとして `--chown` フラグを用いると、引数に与えたユーザー空間、グループ名、あるいは UID と GID の組み合わせによる指定が可能になり、特定の所有権を満たした ADD を行うことができます。
`--chown` フラグの書式には、ユーザー名とグループ名を文字列で指定するか、あるいは直接 UID、GID の数値をそれぞれに指定することができます。
グループ名を指定せずにユーザー名を指定した場合、あるいは GID を指定せずに UID を指定した場合は、GID と同じ値が UID に対して用いられます。
ユーザー名やグループ名が指定された場合、コンテナー内の root ファイルシステム配下にある `/etc/passwd` ファイルや `/etc/group` ファイルが参照されて、名前から UID、GID への変換が行われます。
以下の例は `--chown` フラグの正しい利用の仕方を示しています。
@z

@x
    ADD --chown=55:mygroup files* /somedir/
    ADD --chown=bin files* /somedir/
    ADD --chown=1 files* /somedir/
    ADD --chown=10:11 files* /somedir/
@y
    ADD --chown=55:mygroup files* /somedir/
    ADD --chown=bin files* /somedir/
    ADD --chown=1 files* /somedir/
    ADD --chown=10:11 files* /somedir/
@z

@x
If the container root filesystem does not contain either `/etc/passwd` or
`/etc/group` files and either user or group names are used in the `--chown`
flag, the build will fail on the `ADD` operation. Using numeric IDs requires
no lookup and will not depend on container root filesystem content.
@y
{% comment %}
If the container root filesystem does not contain either `/etc/passwd` or
`/etc/group` files and either user or group names are used in the `--chown`
flag, the build will fail on the `ADD` operation. Using numeric IDs requires
no lookup and will not depend on container root filesystem content.
{% endcomment %}
コンテナー内の root ファイルシステムに `/etc/passwd`や `/etc/group` が存在せず、その状態で `--chown` フラグが用いられた場合、`ADD` 命令の処理のところでビルドが失敗します。
数値により ID を指定した場合は、上のファイルを探すことが不要となるため、コンテナーの root ファイルシステム内に上のファイルがあってもなくても、関係がなくなります。
@z

@x
In the case where `<src>` is a remote file URL, the destination will
have permissions of 600. If the remote file being retrieved has an HTTP
`Last-Modified` header, the timestamp from that header will be used
to set the `mtime` on the destination file. However, like any other file
processed during an `ADD`, `mtime` will not be included in the determination
of whether or not the file has changed and the cache should be updated.
@y
{% comment %}
In the case where `<src>` is a remote file URL, the destination will
have permissions of 600. If the remote file being retrieved has an HTTP
`Last-Modified` header, the timestamp from that header will be used
to set the `mtime` on the destination file. However, like any other file
processed during an `ADD`, `mtime` will not be included in the determination
of whether or not the file has changed and the cache should be updated.
{% endcomment %}
`<src>` にリモートファイル URL が指定された場合、コピー先のパーミッションは 600 となります。
リモートファイルの取得時に HTTP の `Last-Modified` ヘッダーが含まれている場合は、ヘッダーに書かれたタイムスタンプを利用して、コピー先ファイルの `mtime` を設定します。
ただし `ADD` によって処理されるファイルが何であっても、ファイルが変更されたかどうか、そしてキャッシュを更新するべきかどうかは `mtime` によって判断されるわけではありません。
@z

@x
> **Note**:
> If you build by passing a `Dockerfile` through STDIN (`docker
> build - < somefile`), there is no build context, so the `Dockerfile`
> can only contain a URL based `ADD` instruction. You can also pass a
> compressed archive through STDIN: (`docker build - < archive.tar.gz`),
> the `Dockerfile` at the root of the archive and the rest of the
> archive will be used as the context of the build.
@y
{% comment %}
> **Note**:
> If you build by passing a `Dockerfile` through STDIN (`docker
> build - < somefile`), there is no build context, so the `Dockerfile`
> can only contain a URL based `ADD` instruction. You can also pass a
> compressed archive through STDIN: (`docker build - < archive.tar.gz`),
> the `Dockerfile` at the root of the archive and the rest of the
> archive will be used as the context of the build.
{% endcomment %}
> **メモ**:
> `Dockerfile` を標準入力から生成する場合（`docker build - < somefile`）は、ビルドコンテキストが存在していないことになるので、`ADD` 命令には URL の指定しか利用できません。
> また標準入力から圧縮アーカイブを入力する場合（`docker build - < archive.tar.gz`）は、そのアーカイブのルートとその配下のファイルが、ビルド時のコンテキストとなります。
@z

@x
> **Note**:
> If your URL files are protected using authentication, you
> will need to use `RUN wget`, `RUN curl` or use another tool from
> within the container as the `ADD` instruction does not support
> authentication.
@y
{% comment %}
> **Note**:
> If your URL files are protected using authentication, you
> will need to use `RUN wget`, `RUN curl` or use another tool from
> within the container as the `ADD` instruction does not support
> authentication.
{% endcomment %}
> **メモ**:
> URL ファイルが認証によって保護されている場合は、`RUN wget` や `RUN curl` あるいは同様のツールをコンテナー内から利用する必要があります。`ADD` 命令は認証処理をサポートしていません。
@z

@x
> **Note**:
> The first encountered `ADD` instruction will invalidate the cache for all
> following instructions from the Dockerfile if the contents of `<src>` have
> changed. This includes invalidating the cache for `RUN` instructions.
> See the [`Dockerfile` Best Practices
guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) for more information.
@y
{% comment %}
> **Note**:
> The first encountered `ADD` instruction will invalidate the cache for all
> following instructions from the Dockerfile if the contents of `<src>` have
> changed. This includes invalidating the cache for `RUN` instructions.
> See the [`Dockerfile` Best Practices
guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) for more information.
{% endcomment %}
> **メモ**:
> `ADD` 命令の `<src>` の内容が変更されていた場合、その `ADD` 命令以降に続く命令のキャッシュはすべて無効化されます。
> そこには `RUN` 命令に対するキャッシュの無効化も含まれます。
> 詳しくは [`Dockerfile` ベストプラクティスガイド](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)を参照してください。
@z

@x
`ADD` obeys the following rules:
@y
{% comment %}
`ADD` obeys the following rules:
{% endcomment %}
`ADD` 命令は以下のルールに従います。
@z

@x
- The `<src>` path must be inside the *context* of the build;
  you cannot `ADD ../something /something`, because the first step of a
  `docker build` is to send the context directory (and subdirectories) to the
  docker daemon.
@y
{% comment %}
- The `<src>` path must be inside the *context* of the build;
  you cannot `ADD ../something /something`, because the first step of a
  `docker build` is to send the context directory (and subdirectories) to the
  docker daemon.
{% endcomment %}
- `<src>` のパス指定は、ビルド**コンテキスト**内でなければならないため、たとえば `ADD ../something /something` といったことはできません。
  `docker build` の最初の処理ステップでは、コンテキストディレクトリ（およびそのサブディレクトリ）を Docker デーモンに送信するところから始まるためです。
@z

@x
- If `<src>` is a URL and `<dest>` does not end with a trailing slash, then a
  file is downloaded from the URL and copied to `<dest>`.
@y
{% comment %}
- If `<src>` is a URL and `<dest>` does not end with a trailing slash, then a
  file is downloaded from the URL and copied to `<dest>`.
{% endcomment %}
- `<src>` が URL 指定であって `<dest>` の最後にスラッシュが指定されていない場合、そのファイルを URL よりダウンロードして `<dest>` にコピーします。
@z

@x
- If `<src>` is a URL and `<dest>` does end with a trailing slash, then the
  filename is inferred from the URL and the file is downloaded to
  `<dest>/<filename>`. For instance, `ADD http://example.com/foobar /` would
  create the file `/foobar`. The URL must have a nontrivial path so that an
  appropriate filename can be discovered in this case (`http://example.com`
  will not work).
@y
{% comment %}
- If `<src>` is a URL and `<dest>` does end with a trailing slash, then the
  filename is inferred from the URL and the file is downloaded to
  `<dest>/<filename>`. For instance, `ADD http://example.com/foobar /` would
  create the file `/foobar`. The URL must have a nontrivial path so that an
  appropriate filename can be discovered in this case (`http://example.com`
  will not work).
{% endcomment %}
- `<src>` が URL 指定であって `<dest>` の最後にスラッシュが指定された場合、ファイルが指定されたものとして扱われ、URL からダウンロードして `<dest>/<filename>` にコピーします。
  たとえば `ADD http://example.com/foobar /` という記述は `/foobar` というファイルを作ることになります。
  URL には正確なパス指定が必要です。
  上の記述であれば、適切なファイルが見つけ出されます。
  （`http://example.com` では正しく動作しません。）
@z

@x
- If `<src>` is a directory, the entire contents of the directory are copied,
  including filesystem metadata.
@y
{% comment %}
- If `<src>` is a directory, the entire contents of the directory are copied,
  including filesystem metadata.
{% endcomment %}
- `<src>` がディレクトリである場合、そのディレクトリの内容がすべてコピーされます。
  ファイルシステムのメタデータも含まれます。
@z

@x
> **Note**:
> The directory itself is not copied, just its contents.
@y
{% comment %}
> **Note**:
> The directory itself is not copied, just its contents.
{% endcomment %}
> **メモ**:
> ディレクトリそのものはコピーされません。
> コピーされるのはその中身です。
@z

@x
- If `<src>` is a *local* tar archive in a recognized compression format
  (identity, gzip, bzip2 or xz) then it is unpacked as a directory. Resources
  from *remote* URLs are **not** decompressed. When a directory is copied or
  unpacked, it has the same behavior as `tar -x`, the result is the union of:
@y
{% comment %}
- If `<src>` is a *local* tar archive in a recognized compression format
  (identity, gzip, bzip2 or xz) then it is unpacked as a directory. Resources
  from *remote* URLs are **not** decompressed. When a directory is copied or
  unpacked, it has the same behavior as `tar -x`, the result is the union of:
{% endcomment %}
- `<src>` がローカルにある tar アーカイブであって、認識できるフォーマット（gzip、bzip2、xz）である場合、1 つのディレクトリ配下に展開されます。
  **リモート**URL の場合は展開**されません**。
  ディレクトリのコピーあるいは展開の仕方は、`tar -x` と同等です。
  つまりその結果は以下の 2 つのいずれかに従います。
@z

@x
    1. Whatever existed at the destination path and
    2. The contents of the source tree, with conflicts resolved in favor
       of "2." on a file-by-file basis.
@y
    {% comment %}
    1. Whatever existed at the destination path and
    2. The contents of the source tree, with conflicts resolved in favor
       of "2." on a file-by-file basis.
    {% endcomment %}
    1. コピー先に指定されていれば、それが存在しているかどうかに関わらず。あるいは、
    2. ソースツリーの内容に従って各ファイルごとに行う。衝突が発生した場合は 2. を優先する。
@z

@x
  > **Note**:
  > Whether a file is identified as a recognized compression format or not
  > is done solely based on the contents of the file, not the name of the file.
  > For example, if an empty file happens to end with `.tar.gz` this will not
  > be recognized as a compressed file and **will not** generate any kind of
  > decompression error message, rather the file will simply be copied to the
  > destination.
@y
  {% comment %}
  > **Note**:
  > Whether a file is identified as a recognized compression format or not
  > is done solely based on the contents of the file, not the name of the file.
  > For example, if an empty file happens to end with `.tar.gz` this will not
  > be recognized as a compressed file and **will not** generate any kind of
  > decompression error message, rather the file will simply be copied to the
  > destination.
  {% endcomment %}
  > **メモ**:
  > 圧縮されたファイルが認識可能なフォーマットであるかどうかは、そのファイル内容に基づいて確認されます。
  > 名前によって判断されるわけではありません。
  > たとえば、空のファイルの名前の末尾がたまたま `.tar.gz` となっていた場合、圧縮ファイルとして認識されないため、解凍に失敗したといったエラーメッセージは一切**出ることはなく**、このファイルはコピー先に向けて単純にコピーされるだけです。
@z

@x
- If `<src>` is any other kind of file, it is copied individually along with
  its metadata. In this case, if `<dest>` ends with a trailing slash `/`, it
  will be considered a directory and the contents of `<src>` will be written
  at `<dest>/base(<src>)`.
@y
{% comment %}
- If `<src>` is any other kind of file, it is copied individually along with
  its metadata. In this case, if `<dest>` ends with a trailing slash `/`, it
  will be considered a directory and the contents of `<src>` will be written
  at `<dest>/base(<src>)`.
{% endcomment %}
- `<src>` が上に示す以外のファイルであった場合、メタデータも含めて個々にコピーされます。
  このとき `<dest>` が `/` で終わっていたらディレクトリとみなされるので、`<src>` の内容は `<dest>/base(<src>)` に書き込まれることになります。
@z

@x
- If multiple `<src>` resources are specified, either directly or due to the
  use of a wildcard, then `<dest>` must be a directory, and it must end with
  a slash `/`.
@y
{% comment %}
- If multiple `<src>` resources are specified, either directly or due to the
  use of a wildcard, then `<dest>` must be a directory, and it must end with
  a slash `/`.
{% endcomment %}
- 複数の `<src>` が直接指定された場合、あるいはワイルドカードを用いて指定された場合、`<dest>` はディレクトリとする必要があり、末尾には `/` をつけなければなりません。
@z

@x
- If `<dest>` does not end with a trailing slash, it will be considered a
  regular file and the contents of `<src>` will be written at `<dest>`.
@y
{% comment %}
- If `<dest>` does not end with a trailing slash, it will be considered a
  regular file and the contents of `<src>` will be written at `<dest>`.
{% endcomment %}
- `<dest>` の末尾にスラッシュがなかった場合、通常のファイルとみなされるため、`<src>` の内容が `<dest>` に書き込まれます。
@z

@x
- If `<dest>` doesn't exist, it is created along with all missing directories
  in its path.
@y
{% comment %}
- If `<dest>` doesn't exist, it is created along with all missing directories
  in its path.
{% endcomment %}
- `<dest>` のパス内のディレクトリが存在しなかった場合、すべて生成されます。
@z

@x
## COPY
@y
## COPY
@z

@x
COPY has two forms:
@y
{% comment %}
COPY has two forms:
{% endcomment %}
COPY には 2 つの書式があります。
@z

@x
- `COPY [--chown=<user>:<group>] <src>... <dest>`
- `COPY [--chown=<user>:<group>] ["<src>",... "<dest>"]` (this form is required for paths containing
whitespace)
@y
- `COPY [--chown=<user>:<group>] <src>... <dest>`
- `COPY [--chown=<user>:<group>] ["<src>",... "<dest>"]` （パスにホワイトスペースを含む場合にこの書式が必要）
@z

@x
> **Note**:
> The `--chown` feature is only supported on Dockerfiles used to build Linux containers,
> and will not work on Windows containers. Since user and group ownership concepts do
> not translate between Linux and Windows, the use of `/etc/passwd` and `/etc/group` for
> translating user and group names to IDs restricts this feature to only be viable for
> Linux OS-based containers.
@y
{% comment %}
> **Note**:
> The `--chown` feature is only supported on Dockerfiles used to build Linux containers,
> and will not work on Windows containers. Since user and group ownership concepts do
> not translate between Linux and Windows, the use of `/etc/passwd` and `/etc/group` for
> translating user and group names to IDs restricts this feature to only be viable for
> Linux OS-based containers.
{% endcomment %}
> **メモ**:
> `--chown` による機能は Linux コンテナーをビルドする Dockerfile においてのみサポートされるものであり、Windows コンテナーに対しては動作しません。
> Linux と Windows の間で、ユーザーやグループの所有権という考え方が共有されないためです。
> この機能では `/etc/passwd` や `/etc/group` を使って、ユーザーやグループの名前を ID に変換するため、この機能が実現できるのは Linux OS をベースとするコンテナーに限定されます。
@z

@x
The `COPY` instruction copies new files or directories from `<src>`
and adds them to the filesystem of the container at the path `<dest>`.
@y
{% comment %}
The `COPY` instruction copies new files or directories from `<src>`
and adds them to the filesystem of the container at the path `<dest>`.
{% endcomment %}
`COPY` 命令は `<src>` からファイルやディレクトリを新たにコピーして、コンテナー内のファイルシステムのパス `<dest>` に追加します。
@z

@x
Multiple `<src>` resources may be specified but the paths of files and
directories will be interpreted as relative to the source of the context
of the build.
@y
{% comment %}
Multiple `<src>` resources may be specified but the paths of files and
directories will be interpreted as relative to the source of the context
of the build.
{% endcomment %}
`<src>` には複数のソースを指定することが可能です。
ソースとしてファイルあるいはディレクトリが指定されている場合、そのパスはビルドコンテキストからの相対パスとして解釈されます。
@z

@x
Each `<src>` may contain wildcards and matching will be done using Go's
[filepath.Match](http://golang.org/pkg/path/filepath#Match) rules. For example:
@y
{% comment %}
Each `<src>` may contain wildcards and matching will be done using Go's
[filepath.Match](http://golang.org/pkg/path/filepath#Match) rules. For example:
{% endcomment %}
`<src>` にはワイルドカードを含めることができます。
その場合、マッチング処理は Go 言語の [filepath.Match](http://golang.org/pkg/path/filepath#Match) ルールに従って行われます。
記述例は以下のとおりです。
@z

@x
    COPY hom* /mydir/        # adds all files starting with "hom"
    COPY hom?.txt /mydir/    # ? is replaced with any single character, e.g., "home.txt"
@y
    {% comment %}
    COPY hom* /mydir/        # adds all files starting with "hom"
    COPY hom?.txt /mydir/    # ? is replaced with any single character, e.g., "home.txt"
    {% endcomment %}
    COPY hom* /mydir/        # "hom" で始まるファイルすべてを追加します。
    COPY hom?.txt /mydir/    # ? は 1 文字にマッチします。たとえば "home.txt" にマッチします。
@z

@x
The `<dest>` is an absolute path, or a path relative to `WORKDIR`, into which
the source will be copied inside the destination container.
@y
{% comment %}
The `<dest>` is an absolute path, or a path relative to `WORKDIR`, into which
the source will be copied inside the destination container.
{% endcomment %}
`<dest>` は絶対パスか、あるいは `WORKDIR` からの相対パスにより指定します。
対象としているコンテナー内において、そのパスに対してソースがコピーされます。
@z

@x
    COPY test relativeDir/   # adds "test" to `WORKDIR`/relativeDir/
    COPY test /absoluteDir/  # adds "test" to /absoluteDir/
@y
    {% comment %}
    COPY test relativeDir/   # adds "test" to `WORKDIR`/relativeDir/
    COPY test /absoluteDir/  # adds "test" to /absoluteDir/
    {% endcomment %}
    COPY test relativeDir/   # "test" を `WORKDIR`/relativeDir/ へ追加します。
    COPY test /absoluteDir/  # "test" を /absoluteDir/ へ追加します。
@z

@x
When copying files or directories that contain special characters (such as `[`
and `]`), you need to escape those paths following the Golang rules to prevent
them from being treated as a matching pattern. For example, to copy a file
named `arr[0].txt`, use the following;
@y
{% comment %}
When copying files or directories that contain special characters (such as `[`
and `]`), you need to escape those paths following the Golang rules to prevent
them from being treated as a matching pattern. For example, to copy a file
named `arr[0].txt`, use the following;
{% endcomment %}
ファイルやディレクトリをコピーする際に、その名前の中に（`[` や `]` のような）特殊な文字が含まれている場合は、Go 言語のルールに従ってパス名をエスケープする必要があります。
これはパターンマッチングとして扱われないようにするものです。
たとえば `arr[0].txt` というファイルをコピーする場合は、以下のようにします。
@z

@x
    COPY arr[[]0].txt /mydir/    # copy a file named "arr[0].txt" to /mydir/
@y
    {% comment %}
    COPY arr[[]0].txt /mydir/    # copy a file named "arr[0].txt" to /mydir/
    {% endcomment %}
    COPY arr[[]0].txt /mydir/    # "arr[0].txt" というファイルを /mydir/ へコピーします。
@z

@x
All new files and directories are created with a UID and GID of 0, unless the
optional `--chown` flag specifies a given username, groupname, or UID/GID
combination to request specific ownership of the copied content. The
format of the `--chown` flag allows for either username and groupname strings
or direct integer UID and GID in any combination. Providing a username without
groupname or a UID without GID will use the same numeric UID as the GID. If a
username or groupname is provided, the container's root filesystem
`/etc/passwd` and `/etc/group` files will be used to perform the translation
from name to integer UID or GID respectively. The following examples show
valid definitions for the `--chown` flag:
@y
{% comment %}
All new files and directories are created with a UID and GID of 0, unless the
optional `--chown` flag specifies a given username, groupname, or UID/GID
combination to request specific ownership of the copied content. The
format of the `--chown` flag allows for either username and groupname strings
or direct integer UID and GID in any combination. Providing a username without
groupname or a UID without GID will use the same numeric UID as the GID. If a
username or groupname is provided, the container's root filesystem
`/etc/passwd` and `/etc/group` files will be used to perform the translation
from name to integer UID or GID respectively. The following examples show
valid definitions for the `--chown` flag:
{% endcomment %}
コピーされるファイルやディレクトリの UID と GID は、すべて 0 として生成されます。
ただしオプションとして `--chown` フラグを用いると、引数に与えたユーザー空間、グループ名、あるいは UID と GID の組み合わせによる指定が可能になり、特定の所有権を満たしたコピーを行うことができます。
`--chown` フラグの書式には、ユーザー名とグループ名を文字列で指定するか、あるいは直接 UID、GID の数値をそれぞれに指定することができます。
グループ名を指定せずにユーザー名を指定した場合、あるいは GID を指定せずに UID を指定した場合は、GID と同じ値が UID に対して用いられます。
ユーザー名やグループ名が指定された場合、コンテナー内の root ファイルシステム配下にある `/etc/passwd` ファイルや `/etc/group` ファイルが参照されて、名前から UID、GID への変換が行われます。
以下の例は `--chown` フラグの正しい利用の仕方を示しています。
@z

@x
    COPY --chown=55:mygroup files* /somedir/
    COPY --chown=bin files* /somedir/
    COPY --chown=1 files* /somedir/
    COPY --chown=10:11 files* /somedir/
@y
    COPY --chown=55:mygroup files* /somedir/
    COPY --chown=bin files* /somedir/
    COPY --chown=1 files* /somedir/
    COPY --chown=10:11 files* /somedir/
@z

@x
If the container root filesystem does not contain either `/etc/passwd` or
`/etc/group` files and either user or group names are used in the `--chown`
flag, the build will fail on the `COPY` operation. Using numeric IDs requires
no lookup and will not depend on container root filesystem content.
@y
{% comment %}
If the container root filesystem does not contain either `/etc/passwd` or
`/etc/group` files and either user or group names are used in the `--chown`
flag, the build will fail on the `COPY` operation. Using numeric IDs requires
no lookup and will not depend on container root filesystem content.
{% endcomment %}
コンテナー内の root ファイルシステムに `/etc/passwd`や `/etc/group` が存在せず、その状態で `--chown` フラグが用いられた場合、`COPY` 命令の処理のところでビルドが失敗します。
数値により ID を指定した場合は、上のファイルを探すことが不要となるため、コンテナーの root ファイルシステム内に上のファイルがあってもなくても、関係がなくなります。
@z

@x
> **Note**:
> If you build using STDIN (`docker build - < somefile`), there is no
> build context, so `COPY` can't be used.
@y
{% comment %}
> **Note**:
> If you build using STDIN (`docker build - < somefile`), there is no
> build context, so `COPY` can't be used.
{% endcomment %}
> **メモ**:
> `Dockerfile` を標準入力から生成する場合（`docker build - < somefile`）は、ビルドコンテキストが存在していないことになるので、`COPY` 命令は利用することができません。
@z

@x
Optionally `COPY` accepts a flag `--from=<name|index>` that can be used to set
the source location to a previous build stage (created with `FROM .. AS <name>`)
that will be used instead of a build context sent by the user. The flag also
accepts a numeric index assigned for all previous build stages started with
`FROM` instruction. In case a build stage with a specified name can't be found an
image with the same name is attempted to be used instead.
@y
{% comment %}
Optionally `COPY` accepts a flag `--from=<name|index>` that can be used to set
the source location to a previous build stage (created with `FROM .. AS <name>`)
that will be used instead of a build context sent by the user. The flag also
accepts a numeric index assigned for all previous build stages started with
`FROM` instruction. In case a build stage with a specified name can't be found an
image with the same name is attempted to be used instead.
{% endcomment %}
オプションとして `COPY` にはフラグ `--from=<name|index>` があります。
これは実行済のビルドステージ（`FROM .. AS <name>`により生成）におけるソースディレクトリを設定するものです。
これがあると、ユーザーが指定したビルドコンテキストのかわりに、設定されたディレクトリが用いられます。
このフラグは数値インデックスを指定することも可能です。
この数値インデックスは、`FROM` 命令から始まる実行済のビルドステージすべてに割り当てられている値です。
指定されたビルドステージがその名前では見つけられなかった場合、指定された数値によって見つけ出します。
@z

@x
`COPY` obeys the following rules:
@y
{% comment %}
`COPY` obeys the following rules:
{% endcomment %}
`COPY` 命令は以下のルールに従います。
@z

@x
- The `<src>` path must be inside the *context* of the build;
  you cannot `COPY ../something /something`, because the first step of a
  `docker build` is to send the context directory (and subdirectories) to the
  docker daemon.
@y
{% comment %}
- The `<src>` path must be inside the *context* of the build;
  you cannot `COPY ../something /something`, because the first step of a
  `docker build` is to send the context directory (and subdirectories) to the
  docker daemon.
{% endcomment %}
- `<src>` のパス指定は、ビルド**コンテキスト**内でなければならないため、たとえば `COPY ../something /something` といったことはできません。
  `docker build` の最初の処理ステップでは、コンテキストディレクトリ（およびそのサブディレクトリ）を Docker デーモンに送信するところから始まるためです。
@z

@x
- If `<src>` is a directory, the entire contents of the directory are copied,
  including filesystem metadata.
@y
{% comment %}
- If `<src>` is a directory, the entire contents of the directory are copied,
  including filesystem metadata.
{% endcomment %}
- `<src>` がディレクトリである場合、そのディレクトリ内の内容がすべてコピーされます。
  ファイルシステムのメタデータも含まれます。
@z

@x
> **Note**:
> The directory itself is not copied, just its contents.
@y
{% comment %}
> **Note**:
> The directory itself is not copied, just its contents.
{% endcomment %}
> **メモ**:
> ディレクトリそのものはコピーされません。
> コピーされるのはその中身です。
@z

@x
- If `<src>` is any other kind of file, it is copied individually along with
  its metadata. In this case, if `<dest>` ends with a trailing slash `/`, it
  will be considered a directory and the contents of `<src>` will be written
  at `<dest>/base(<src>)`.
@y
{% comment %}
- If `<src>` is any other kind of file, it is copied individually along with
  its metadata. In this case, if `<dest>` ends with a trailing slash `/`, it
  will be considered a directory and the contents of `<src>` will be written
  at `<dest>/base(<src>)`.
{% endcomment %}
- `<src>` が上に示す以外のファイルであった場合、メタデータも含めて個々にコピーされます。
  このとき `<dest>` が `/` で終わっていたらディレクトリとみなされるので、`<src>` の内容は `<dest>/base(<src>)` に書き込まれることになります。
@z

@x
- If multiple `<src>` resources are specified, either directly or due to the
  use of a wildcard, then `<dest>` must be a directory, and it must end with
  a slash `/`.
@y
{% comment %}
- If multiple `<src>` resources are specified, either directly or due to the
  use of a wildcard, then `<dest>` must be a directory, and it must end with
  a slash `/`.
{% endcomment %}
- 複数の `<src>` が直接指定された場合、あるいはワイルドカードを用いて指定された場合、`<dest>` はディレクトリとする必要があり、末尾には `/` をつけなければなりません。
@z

@x
- If `<dest>` does not end with a trailing slash, it will be considered a
  regular file and the contents of `<src>` will be written at `<dest>`.
@y
{% comment %}
- If `<dest>` does not end with a trailing slash, it will be considered a
  regular file and the contents of `<src>` will be written at `<dest>`.
{% endcomment %}
- `<dest>` の末尾にスラッシュがなかった場合、通常のファイルとみなされるため、`<src>` の内容が `<dest>` に書き込まれます。
@z

@x
- If `<dest>` doesn't exist, it is created along with all missing directories
  in its path.
@y
{% comment %}
- If `<dest>` doesn't exist, it is created along with all missing directories
  in its path.
{% endcomment %}
- `<dest>` のパス内のディレクトリが存在しなかった場合、すべて生成されます。
@z

@x
## ENTRYPOINT
@y
## ENTRYPOINT
@z

@x
ENTRYPOINT has two forms:
@y
{% comment %}
ENTRYPOINT has two forms:
{% endcomment %}
ENTRYPOINT には 2 つの書式があります。
@z

@x
- `ENTRYPOINT ["executable", "param1", "param2"]`
  (*exec* form, preferred)
- `ENTRYPOINT command param1 param2`
  (*shell* form)
@y
{% comment %}
- `ENTRYPOINT ["executable", "param1", "param2"]`
  (*exec* form, preferred)
- `ENTRYPOINT command param1 param2`
  (*shell* form)
{% endcomment %}
- `ENTRYPOINT ["executable", "param1", "param2"]`
  （exec 形式、この形式を推奨）
- `ENTRYPOINT command param1 param2`
  （シェル形式）
@z

@x
An `ENTRYPOINT` allows you to configure a container that will run as an executable.
@y
{% comment %}
An `ENTRYPOINT` allows you to configure a container that will run as an executable.
{% endcomment %}
`ENTRYPOINT` は、コンテナーを実行モジュールのようにして実行する設定を行うものです。
@z

@x
For example, the following will start nginx with its default content, listening
on port 80:
@y
{% comment %}
For example, the following will start nginx with its default content, listening
on port 80:
{% endcomment %}
たとえば以下の例では、nginx をデフォルト設定で起動します。
ポートは 80 番を利用します。
@z

@x
    docker run -i -t --rm -p 80:80 nginx
@y
    docker run -i -t --rm -p 80:80 nginx
@z

@x
Command line arguments to `docker run <image>` will be appended after all
elements in an *exec* form `ENTRYPOINT`, and will override all elements specified
using `CMD`.
This allows arguments to be passed to the entry point, i.e., `docker run <image> -d`
will pass the `-d` argument to the entry point.
You can override the `ENTRYPOINT` instruction using the `docker run --entrypoint`
flag.
@y
{% comment %}
Command line arguments to `docker run <image>` will be appended after all
elements in an *exec* form `ENTRYPOINT`, and will override all elements specified
using `CMD`.
This allows arguments to be passed to the entry point, i.e., `docker run <image> -d`
will pass the `-d` argument to the entry point.
You can override the `ENTRYPOINT` instruction using the `docker run --entrypoint`
flag.
{% endcomment %}
`docker run <image>` に対するコマンドライン引数は、exec 形式の `ENTRYPOINT` の指定要素の後に付け加えられます。
そして `CMD` において指定された引数は上書きされます。
これはつまり、引数をエントリーポイントに受け渡すことができるということです。
たとえば `docker run <image> -d` としたときの `-d` は、引数としてエントリーポイントに渡されます。
`docker run --entrypoint` を利用すれば `ENTRYPOINT` の内容を上書きすることができます。
@z

@x
The *shell* form prevents any `CMD` or `run` command line arguments from being
used, but has the disadvantage that your `ENTRYPOINT` will be started as a
subcommand of `/bin/sh -c`, which does not pass signals.
This means that the executable will not be the container's `PID 1` - and
will _not_ receive Unix signals - so your executable will not receive a
`SIGTERM` from `docker stop <container>`.
@y
{% comment %}
The *shell* form prevents any `CMD` or `run` command line arguments from being
used, but has the disadvantage that your `ENTRYPOINT` will be started as a
subcommand of `/bin/sh -c`, which does not pass signals.
This means that the executable will not be the container's `PID 1` - and
will _not_ receive Unix signals - so your executable will not receive a
`SIGTERM` from `docker stop <container>`.
{% endcomment %}
シェル形式では `CMD` や `run` によるコマンドライン引数は受け付けずに処理を行います。
ただし `ENTRYPOINT` が `/bin/sh -c` のサブコマンドとして起動されるので、シグナルを送信しません。
これはつまり、実行モジュールがコンテナーの `PID 1` にはならず、Unix のシグナルを受信しないということです。
したがって `docker stop <container>` が実行されても、その実行モジュールは `SIGTERM` を受信しないことになります。
@z

@x
Only the last `ENTRYPOINT` instruction in the `Dockerfile` will have an effect.
@y
{% comment %}
Only the last `ENTRYPOINT` instruction in the `Dockerfile` will have an effect.
{% endcomment %}
`ENTRYPOINT` 命令は複数記述されていても、最後の命令しか処理されません。
@z

@x
### Exec form ENTRYPOINT example
@y
{% comment %}
### Exec form ENTRYPOINT example
{% endcomment %}
### exec 形式の ENTRYPOINT の例
{: #exec-form-entrypoint-example }
@z

@x
You can use the *exec* form of `ENTRYPOINT` to set fairly stable default commands
and arguments and then use either form of `CMD` to set additional defaults that
are more likely to be changed.
@y
{% comment %}
You can use the *exec* form of `ENTRYPOINT` to set fairly stable default commands
and arguments and then use either form of `CMD` to set additional defaults that
are more likely to be changed.
{% endcomment %}
`ENTRYPOINT` の exec 形式は、デフォルト実行するコマンドと引数として、ほぼ変わることがないものを設定します。
そして `CMD` 命令の 2 つある書式のいずれでもよいので、変更が必要になりそうな内容を追加で設定します。
@z

@x
    FROM ubuntu
    ENTRYPOINT ["top", "-b"]
    CMD ["-c"]
@y
    FROM ubuntu
    ENTRYPOINT ["top", "-b"]
    CMD ["-c"]
@z

@x
When you run the container, you can see that `top` is the only process:
@y
{% comment %}
When you run the container, you can see that `top` is the only process:
{% endcomment %}
コンテナーを実行すると、ただ 1 つのプロセスとして `top` があるのがわかります。
@z

@x
    $ docker run -it --rm --name test  top -H
    top - 08:25:00 up  7:27,  0 users,  load average: 0.00, 0.01, 0.05
    Threads:   1 total,   1 running,   0 sleeping,   0 stopped,   0 zombie
    %Cpu(s):  0.1 us,  0.1 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
    KiB Mem:   2056668 total,  1616832 used,   439836 free,    99352 buffers
    KiB Swap:  1441840 total,        0 used,  1441840 free.  1324440 cached Mem
@y
    $ docker run -it --rm --name test  top -H
    top - 08:25:00 up  7:27,  0 users,  load average: 0.00, 0.01, 0.05
    Threads:   1 total,   1 running,   0 sleeping,   0 stopped,   0 zombie
    %Cpu(s):  0.1 us,  0.1 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
    KiB Mem:   2056668 total,  1616832 used,   439836 free,    99352 buffers
    KiB Swap:  1441840 total,        0 used,  1441840 free.  1324440 cached Mem
@z

@x
      PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
        1 root      20   0   19744   2336   2080 R  0.0  0.1   0:00.04 top
@y
      PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
        1 root      20   0   19744   2336   2080 R  0.0  0.1   0:00.04 top
@z

@x
To examine the result further, you can use `docker exec`:
@y
{% comment %}
To examine the result further, you can use `docker exec`:
{% endcomment %}
さらに詳しく見るには `docker exec` を実行します。
@z

@x
    $ docker exec -it test ps aux
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root         1  2.6  0.1  19752  2352 ?        Ss+  08:24   0:00 top -b -H
    root         7  0.0  0.1  15572  2164 ?        R+   08:25   0:00 ps aux
@y
    $ docker exec -it test ps aux
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root         1  2.6  0.1  19752  2352 ?        Ss+  08:24   0:00 top -b -H
    root         7  0.0  0.1  15572  2164 ?        R+   08:25   0:00 ps aux
@z

@x
And you can gracefully request `top` to shut down using `docker stop test`.
@y
{% comment %}
And you can gracefully request `top` to shut down using `docker stop test`.
{% endcomment %}
`top` を適切に終了させるには `docker stop test` を実行します。
@z

@x
The following `Dockerfile` shows using the `ENTRYPOINT` to run Apache in the
foreground (i.e., as `PID 1`):
@y
{% comment %}
The following `Dockerfile` shows using the `ENTRYPOINT` to run Apache in the
foreground (i.e., as `PID 1`):
{% endcomment %}
次の `Dockerfile` は、Apache をフォアグラウンドで（つまり `PID 1` として）実行するような `ENTRYPOINT` の例を示しています。
@z

@x
```
FROM debian:stable
RUN apt-get update && apt-get install -y --force-yes apache2
EXPOSE 80 443
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```
@y
```
FROM debian:stable
RUN apt-get update && apt-get install -y --force-yes apache2
EXPOSE 80 443
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```
@z

@x
If you need to write a starter script for a single executable, you can ensure that
the final executable receives the Unix signals by using `exec` and `gosu`
commands:
@y
{% comment %}
If you need to write a starter script for a single executable, you can ensure that
the final executable receives the Unix signals by using `exec` and `gosu`
commands:
{% endcomment %}
1 つの実行モジュールを起動するスクリプトを書く場合、最終実行される実行モジュールが Unix シグナルを受信できるようにするには `exec` あるいは `gosu` を用います。
@z

@x
```bash
#!/usr/bin/env bash
set -e

if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"

    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
    fi

    exec gosu postgres "$@"
fi

exec "$@"
```
@y
```bash
#!/usr/bin/env bash
set -e

if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"

    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
    fi

    exec gosu postgres "$@"
fi

exec "$@"
```
@z

@x
Lastly, if you need to do some extra cleanup (or communicate with other containers)
on shutdown, or are co-ordinating more than one executable, you may need to ensure
that the `ENTRYPOINT` script receives the Unix signals, passes them on, and then
does some more work:
@y
{% comment %}
Lastly, if you need to do some extra cleanup (or communicate with other containers)
on shutdown, or are co-ordinating more than one executable, you may need to ensure
that the `ENTRYPOINT` script receives the Unix signals, passes them on, and then
does some more work:
{% endcomment %}
シャットダウンの際に追加でクリーンアップするようなコマンドを実行したい（他のコンテナーとの通信を行ないたい）場合、あるいは複数の実行モジュールを連動して動かしている場合は、`ENTRYPOINT` のスクリプトが確実に Unix シグナルを受信し、これを受けて動作するようにすることが必要になるかもしれません。
@z

@x
```
#!/bin/sh
# Note: I've written this using sh so it works in the busybox container too

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT TERM

# start service in background here
/usr/sbin/apachectl start

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

# stop service and clean up here
echo "stopping apache"
/usr/sbin/apachectl stop

echo "exited $0"
```
@y
{% comment %}
```
#!/bin/sh
# Note: I've written this using sh so it works in the busybox container too

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT TERM

# start service in background here
/usr/sbin/apachectl start

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

# stop service and clean up here
echo "stopping apache"
/usr/sbin/apachectl stop

echo "exited $0"
```
{% endcomment %}
```
#!/bin/sh
# メモ: ここで sh を用いました。したがって busybox コンテナーでも動作します。

# ここで trap を用います。サービスが停止した後に手動でクリーンアップする
# コマンドを実行するにはこれも必要となります。
# こうしておかないと、1 つのコンテナーで複数サービスを起動しなければなりません。
trap "echo TRAPed signal" HUP INT QUIT TERM

# ここからバックグラウンドでサービスを起動します。
/usr/sbin/apachectl start

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

# ここでサービスを停止しクリーンアップします。
echo "stopping apache"
/usr/sbin/apachectl stop

echo "exited $0"
```
@z

@x
If you run this image with `docker run -it --rm -p 80:80 --name test apache`,
you can then examine the container's processes with `docker exec`, or `docker top`,
and then ask the script to stop Apache:
@y
{% comment %}
If you run this image with `docker run -it --rm -p 80:80 --name test apache`,
you can then examine the container's processes with `docker exec`, or `docker top`,
and then ask the script to stop Apache:
{% endcomment %}
このイメージを `docker run -it --rm -p 80:80 --name test apache` により実行したら、このコンテナーのプロセスは `docker exec` や `docker top` を使って確認することができます。
そしてこのスクリプトから Apache を停止させます。
@z

@x
```bash
$ docker exec -it test ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.1  0.0   4448   692 ?        Ss+  00:42   0:00 /bin/sh /run.sh 123 cmd cmd2
root        19  0.0  0.2  71304  4440 ?        Ss   00:42   0:00 /usr/sbin/apache2 -k start
www-data    20  0.2  0.2 360468  6004 ?        Sl   00:42   0:00 /usr/sbin/apache2 -k start
www-data    21  0.2  0.2 360468  6000 ?        Sl   00:42   0:00 /usr/sbin/apache2 -k start
root        81  0.0  0.1  15572  2140 ?        R+   00:44   0:00 ps aux
$ docker top test
PID                 USER                COMMAND
10035               root                {run.sh} /bin/sh /run.sh 123 cmd cmd2
10054               root                /usr/sbin/apache2 -k start
10055               33                  /usr/sbin/apache2 -k start
10056               33                  /usr/sbin/apache2 -k start
$ /usr/bin/time docker stop test
test
real	0m 0.27s
user	0m 0.03s
sys	0m 0.03s
```
@y
```bash
$ docker exec -it test ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.1  0.0   4448   692 ?        Ss+  00:42   0:00 /bin/sh /run.sh 123 cmd cmd2
root        19  0.0  0.2  71304  4440 ?        Ss   00:42   0:00 /usr/sbin/apache2 -k start
www-data    20  0.2  0.2 360468  6004 ?        Sl   00:42   0:00 /usr/sbin/apache2 -k start
www-data    21  0.2  0.2 360468  6000 ?        Sl   00:42   0:00 /usr/sbin/apache2 -k start
root        81  0.0  0.1  15572  2140 ?        R+   00:44   0:00 ps aux
$ docker top test
PID                 USER                COMMAND
10035               root                {run.sh} /bin/sh /run.sh 123 cmd cmd2
10054               root                /usr/sbin/apache2 -k start
10055               33                  /usr/sbin/apache2 -k start
10056               33                  /usr/sbin/apache2 -k start
$ /usr/bin/time docker stop test
test
real	0m 0.27s
user	0m 0.03s
sys	0m 0.03s
```
@z

@x
> **Note:** you can override the `ENTRYPOINT` setting using `--entrypoint`,
> but this can only set the binary to *exec* (no `sh -c` will be used).
@y
{% comment %}
> **Note:** you can override the `ENTRYPOINT` setting using `--entrypoint`,
> but this can only set the binary to *exec* (no `sh -c` will be used).
{% endcomment %}
> **メモ:** `--entrypoint` を使うと `ENTRYPOINT` の設定を上書きすることができます。
> ただしこの場合は、実行モジュールを exec 形式にできるだけです。
> （`sh -c` は利用されません。）
@z

@x
> **Note**:
> The *exec* form is parsed as a JSON array, which means that
> you must use double-quotes (") around words not single-quotes (').
@y
{% comment %}
> **Note**:
> The *exec* form is parsed as a JSON array, which means that
> you must use double-quotes (") around words not single-quotes (').
{% endcomment %}
> **メモ**:
> exec 形式は JSON 配列として解釈されます。
> したがって文字列をくくるのはダブルクォート（"）であり、シングルクォート（'）は用いてはなりません。
@z

@x
> **Note**:
> Unlike the *shell* form, the *exec* form does not invoke a command shell.
> This means that normal shell processing does not happen. For example,
> `ENTRYPOINT [ "echo", "$HOME" ]` will not do variable substitution on `$HOME`.
> If you want shell processing then either use the *shell* form or execute
> a shell directly, for example: `ENTRYPOINT [ "sh", "-c", "echo $HOME" ]`.
> When using the exec form and executing a shell directly, as in the case for
> the shell form, it is the shell that is doing the environment variable
> expansion, not docker.
@y
{% comment %}
> **Note**:
> Unlike the *shell* form, the *exec* form does not invoke a command shell.
> This means that normal shell processing does not happen. For example,
> `ENTRYPOINT [ "echo", "$HOME" ]` will not do variable substitution on `$HOME`.
> If you want shell processing then either use the *shell* form or execute
> a shell directly, for example: `ENTRYPOINT [ "sh", "-c", "echo $HOME" ]`.
> When using the exec form and executing a shell directly, as in the case for
> the shell form, it is the shell that is doing the environment variable
> expansion, not docker.
{% endcomment %}
> **メモ**:
> シェル形式とは違って exec 形式はコマンドシェルを起動しません。
> これはつまり、ごく普通のシェル処理とはならないということです。
> たとえば `RUN [ "echo", "$HOME" ]` を実行したとすると、`$HOME` の変数置換は行われません。
> シェル処理が行われるようにしたければ、シェル形式を利用するか、あるいはシェルを直接実行するようにします。
> たとえば `RUN [ "sh", "-c", "echo $HOME" ]` とします。
> exec 形式によってシェルを直接起動した場合、シェル形式の場合でも同じですが、変数置換を行うのはシェルであって、docker ではありません。
@z

@x
### Shell form ENTRYPOINT example
@y
{% comment %}
### Shell form ENTRYPOINT example
{% endcomment %}
### シェル形式の ENTRYPOINT の例
{: #shell-form-entrypoint-example }
@z

@x
You can specify a plain string for the `ENTRYPOINT` and it will execute in `/bin/sh -c`.
This form will use shell processing to substitute shell environment variables,
and will ignore any `CMD` or `docker run` command line arguments.
To ensure that `docker stop` will signal any long running `ENTRYPOINT` executable
correctly, you need to remember to start it with `exec`:
@y
{% comment %}
You can specify a plain string for the `ENTRYPOINT` and it will execute in `/bin/sh -c`.
This form will use shell processing to substitute shell environment variables,
and will ignore any `CMD` or `docker run` command line arguments.
To ensure that `docker stop` will signal any long running `ENTRYPOINT` executable
correctly, you need to remember to start it with `exec`:
{% endcomment %}
`ENTRYPOINT` に指定した文字列は、そのまま `/bin/sh -c` の中で実行されます。
この形式は、シェル環境変数を置換しながらシェル処理を実行します。
そして `CMD` や `docker run` におけるコマンドライン引数は無視します。
`ENTRYPOINT` による実行モジュールがどれだけ実行し続けていても、確実に `docker stop` によりシグナル送信ができるようにするためには、忘れずに `exec` をつけて実行する必要があります。
@z

@x
    FROM ubuntu
    ENTRYPOINT exec top -b
@y
    FROM ubuntu
    ENTRYPOINT exec top -b
@z

@x
When you run this image, you'll see the single `PID 1` process:
@y
{% comment %}
When you run this image, you'll see the single `PID 1` process:
{% endcomment %}
上のイメージを実行すると、`PID 1` のプロセスがただ 1 つだけあるのがわかります。
@z

@x
    $ docker run -it --rm --name test top
    Mem: 1704520K used, 352148K free, 0K shrd, 0K buff, 140368121167873K cached
    CPU:   5% usr   0% sys   0% nic  94% idle   0% io   0% irq   0% sirq
    Load average: 0.08 0.03 0.05 2/98 6
      PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
        1     0 root     R     3164   0%   0% top -b
@y
    $ docker run -it --rm --name test top
    Mem: 1704520K used, 352148K free, 0K shrd, 0K buff, 140368121167873K cached
    CPU:   5% usr   0% sys   0% nic  94% idle   0% io   0% irq   0% sirq
    Load average: 0.08 0.03 0.05 2/98 6
      PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
        1     0 root     R     3164   0%   0% top -b
@z

@x
Which will exit cleanly on `docker stop`:
@y
{% comment %}
Which will exit cleanly on `docker stop`:
{% endcomment %}
きれいに終了させるには `docker stop` を実行します。
@z

@x
    $ /usr/bin/time docker stop test
    test
    real	0m 0.20s
    user	0m 0.02s
    sys	0m 0.04s
@y
    $ /usr/bin/time docker stop test
    test
    real	0m 0.20s
    user	0m 0.02s
    sys	0m 0.04s
@z

@x
If you forget to add `exec` to the beginning of your `ENTRYPOINT`:
@y
{% comment %}
If you forget to add `exec` to the beginning of your `ENTRYPOINT`:
{% endcomment %}
仮に `ENTRYPOINT` の先頭に `exec` を記述し忘れたとします。
@z

@x
    FROM ubuntu
    ENTRYPOINT top -b
    CMD --ignored-param1
@y
    FROM ubuntu
    ENTRYPOINT top -b
    CMD --ignored-param1
@z

@x
You can then run it (giving it a name for the next step):
@y
{% comment %}
You can then run it (giving it a name for the next step):
{% endcomment %}
そして以下のように実行したとします。
（名前をつけておいて次のステップで使います。）
@z

@x
    $ docker run -it --name test top --ignored-param2
    Mem: 1704184K used, 352484K free, 0K shrd, 0K buff, 140621524238337K cached
    CPU:   9% usr   2% sys   0% nic  88% idle   0% io   0% irq   0% sirq
    Load average: 0.01 0.02 0.05 2/101 7
      PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
        1     0 root     S     3168   0%   0% /bin/sh -c top -b cmd cmd2
        7     1 root     R     3164   0%   0% top -b
@y
    $ docker run -it --name test top --ignored-param2
    Mem: 1704184K used, 352484K free, 0K shrd, 0K buff, 140621524238337K cached
    CPU:   9% usr   2% sys   0% nic  88% idle   0% io   0% irq   0% sirq
    Load average: 0.01 0.02 0.05 2/101 7
      PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
        1     0 root     S     3168   0%   0% /bin/sh -c top -b cmd cmd2
        7     1 root     R     3164   0%   0% top -b
@z

@x
You can see from the output of `top` that the specified `ENTRYPOINT` is not `PID 1`.
@y
{% comment %}
You can see from the output of `top` that the specified `ENTRYPOINT` is not `PID 1`.
{% endcomment %}
`ENTRYPOINT` によって指定された `top` の出力は `PID 1` ではないことが示されます。
@z

@x
If you then run `docker stop test`, the container will not exit cleanly - the
`stop` command will be forced to send a `SIGKILL` after the timeout:
@y
{% comment %}
If you then run `docker stop test`, the container will not exit cleanly - the
`stop` command will be forced to send a `SIGKILL` after the timeout:
{% endcomment %}
この後に `docker stop test` を実行しても、コンテナーはきれいに終了しません。
`stop` コマンドは、タイムアウトの後に強制的に `SIGKILL` を送信することになるからです。
@z

@x
    $ docker exec -it test ps aux
    PID   USER     COMMAND
        1 root     /bin/sh -c top -b cmd cmd2
        7 root     top -b
        8 root     ps aux
    $ /usr/bin/time docker stop test
    test
    real	0m 10.19s
    user	0m 0.04s
    sys	0m 0.03s
@y
    $ docker exec -it test ps aux
    PID   USER     COMMAND
        1 root     /bin/sh -c top -b cmd cmd2
        7 root     top -b
        8 root     ps aux
    $ /usr/bin/time docker stop test
    test
    real	0m 10.19s
    user	0m 0.04s
    sys	0m 0.03s
@z

@x
### Understand how CMD and ENTRYPOINT interact
@y
{% comment %}
### Understand how CMD and ENTRYPOINT interact
{% endcomment %}
### CMD と ENTRYPOINT の関連について
{: #understand-how-cmd-and-entrypoint-interact }
@z

@x
Both `CMD` and `ENTRYPOINT` instructions define what command gets executed when running a container.
There are few rules that describe their co-operation.
@y
{% comment %}
Both `CMD` and `ENTRYPOINT` instructions define what command gets executed when running a container.
There are few rules that describe their co-operation.
{% endcomment %}
`CMD` 命令も `ENTRYPOINT` 命令も、ともにコンテナー起動時に実行するコマンドを定義するものです。
両方が動作する際に必要となるルールがいくらかあります。
@z

@x
1. Dockerfile should specify at least one of `CMD` or `ENTRYPOINT` commands.
@y
{% comment %}
1. Dockerfile should specify at least one of `CMD` or `ENTRYPOINT` commands.
{% endcomment %}
1. Dockerfile には、`CMD` または `ENTRYPOINT` のいずれかが、少なくとも 1 つ必要です。
@z

@x
2. `ENTRYPOINT` should be defined when using the container as an executable.
@y
{% comment %}
2. `ENTRYPOINT` should be defined when using the container as an executable.
{% endcomment %}
2. `ENTRYPOINT` は、コンテナーを実行モジュールとして実行する際に利用します。
@z

@x
3. `CMD` should be used as a way of defining default arguments for an `ENTRYPOINT` command
or for executing an ad-hoc command in a container.
@y
{% comment %}
3. `CMD` should be used as a way of defining default arguments for an `ENTRYPOINT` command
or for executing an ad-hoc command in a container.
{% endcomment %}
3. `CMD` は、`ENTRYPOINT` のデフォルト引数を定義するため、あるいはその時点でのみコマンド実行を行うために利用します。
@z

@x
4. `CMD` will be overridden when running the container with alternative arguments.
@y
{% comment %}
4. `CMD` will be overridden when running the container with alternative arguments.
{% endcomment %}
4. `CMD` はコンテナー実行時に、別の引数によって上書きされることがあります。
@z

@x
The table below shows what command is executed for different `ENTRYPOINT` / `CMD` combinations:
@y
{% comment %}
The table below shows what command is executed for different `ENTRYPOINT` / `CMD` combinations:
{% endcomment %}
以下の表は、`ENTRYPOINT` と `CMD` の組み合わせに従って実行されるコマンドを示しています。
@z

@x
|                                | No ENTRYPOINT              | ENTRYPOINT exec_entry p1_entry | ENTRYPOINT ["exec_entry", "p1_entry"]          |
|:-------------------------------|:---------------------------|:-------------------------------|:-----------------------------------------------|
| **No CMD**                     | *error, not allowed*       | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry                            |
| **CMD ["exec_cmd", "p1_cmd"]** | exec_cmd p1_cmd            | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry exec_cmd p1_cmd            |
| **CMD ["p1_cmd", "p2_cmd"]**   | p1_cmd p2_cmd              | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry p1_cmd p2_cmd              |
| **CMD exec_cmd p1_cmd**        | /bin/sh -c exec_cmd p1_cmd | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd |
@y
{% comment %}
|                                | No ENTRYPOINT              | ENTRYPOINT exec_entry p1_entry | ENTRYPOINT ["exec_entry", "p1_entry"]          |
|:-------------------------------|:---------------------------|:-------------------------------|:-----------------------------------------------|
| **No CMD**                     | *error, not allowed*       | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry                            |
| **CMD ["exec_cmd", "p1_cmd"]** | exec_cmd p1_cmd            | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry exec_cmd p1_cmd            |
| **CMD ["p1_cmd", "p2_cmd"]**   | p1_cmd p2_cmd              | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry p1_cmd p2_cmd              |
| **CMD exec_cmd p1_cmd**        | /bin/sh -c exec_cmd p1_cmd | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd |
{% endcomment %}
|                                | ENTRYPOINT なし         | ENTRYPOINT exec_entry p1_entry | ENTRYPOINT ["exec_entry", "p1_entry"]          |
|:-------------------------------|:---------------------------|:-------------------------------|:-----------------------------------------------|
| **CMD なし**                     | *エラー*、*実行できない* | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry                            |
| **CMD ["exec_cmd", "p1_cmd"]** | exec_cmd p1_cmd            | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry exec_cmd p1_cmd            |
| **CMD ["p1_cmd", "p2_cmd"]**   | p1_cmd p2_cmd              | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry p1_cmd p2_cmd              |
| **CMD exec_cmd p1_cmd**        | /bin/sh -c exec_cmd p1_cmd | /bin/sh -c exec_entry p1_entry | exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd |
@z

@x
> **Note**: If `CMD` is defined from the base image, setting `ENTRYPOINT` will
> reset `CMD` to an empty value. In this scenario, `CMD` must be defined in the
> current image to have a value.
@y
{% comment %}
> **Note**: If `CMD` is defined from the base image, setting `ENTRYPOINT` will
> reset `CMD` to an empty value. In this scenario, `CMD` must be defined in the
> current image to have a value.
{% endcomment %}
> **メモ**: `CMD` がベースイメージにて定義されていた場合、`ENTRYPOINT` を設定すると `CMD` を空の値にリセットします。
> そのような場合、`CMD` へは現イメージにおいて定義を行い、値を持たせておくことが必要です。
@z

@x
## VOLUME
@y
## VOLUME
@z

@x
    VOLUME ["/data"]
@y
    VOLUME ["/data"]
@z

@x
The `VOLUME` instruction creates a mount point with the specified name
and marks it as holding externally mounted volumes from native host or other
containers. The value can be a JSON array, `VOLUME ["/var/log/"]`, or a plain
string with multiple arguments, such as `VOLUME /var/log` or `VOLUME /var/log
/var/db`. For more information/examples and mounting instructions via the
Docker client, refer to
[*Share Directories via Volumes*](https://docs.docker.com/engine/tutorials/dockervolumes/)
documentation.
@y
{% comment %}
The `VOLUME` instruction creates a mount point with the specified name
and marks it as holding externally mounted volumes from native host or other
containers. The value can be a JSON array, `VOLUME ["/var/log/"]`, or a plain
string with multiple arguments, such as `VOLUME /var/log` or `VOLUME /var/log
/var/db`. For more information/examples and mounting instructions via the
Docker client, refer to
[*Share Directories via Volumes*](https://docs.docker.com/engine/tutorials/dockervolumes/)
documentation.
{% endcomment %}
`VOLUME` 命令は指定された名前を使ってマウントポイントを生成します。
そして自ホストまたは他のコンテナーからマウントされたボリュームとして、そのマウントポイントを扱います。
指定する値は JSON 配列として `VOLUME ["/var/log/"]` のようにするか、あるいは単純な文字列を複数与えます。
たとえば `VOLUME /var/log` や `VOLUME /var/log /var/db` などです。
Docker クライアントを通じたマウントに関する情報、利用例などに関しては [*ボリュームを通じたディレクトリの共有*](https://docs.docker.com/engine/tutorials/dockervolumes/)を参照してください。
@z

@x
The `docker run` command initializes the newly created volume with any data
that exists at the specified location within the base image. For example,
consider the following Dockerfile snippet:
@y
{% comment %}
The `docker run` command initializes the newly created volume with any data
that exists at the specified location within the base image. For example,
consider the following Dockerfile snippet:
{% endcomment %}
`docker run` コマンドは、新たに生成するボリュームを初期化します。
ベースイメージ内の指定したディレクトリに、データが存在していても構いません。
たとえば以下のような Dockerfile の記述部分があったとします。
@z

@x
    FROM ubuntu
    RUN mkdir /myvol
    RUN echo "hello world" > /myvol/greeting
    VOLUME /myvol
@y
    FROM ubuntu
    RUN mkdir /myvol
    RUN echo "hello world" > /myvol/greeting
    VOLUME /myvol
@z

@x
This Dockerfile results in an image that causes `docker run` to
create a new mount point at `/myvol` and copy the  `greeting` file
into the newly created volume.
@y
{% comment %}
This Dockerfile results in an image that causes `docker run` to
create a new mount point at `/myvol` and copy the  `greeting` file
into the newly created volume.
{% endcomment %}
この Dockerfile はイメージに対する処理として、`docker run` により `/myvol` というマウントポイントを新たに生成し、そのボリュームの中に `greeting` ファイルをコピーします。
@z

@x
### Notes about specifying volumes
@y
{% comment %}
### Notes about specifying volumes
{% endcomment %}
### ボリュームの指定に関して
{: #notes-about-specifying-volumes }
@z

@x
Keep the following things in mind about volumes in the `Dockerfile`.
@y
{% comment %}
Keep the following things in mind about volumes in the `Dockerfile`.
{% endcomment %}
`Dockerfile` におけるボリューム設定に関しては、以下のことを覚えておいてください。
@z

@x
- **Volumes on Windows-based containers**: When using Windows-based containers,
  the destination of a volume inside the container must be one of:
@y
{% comment %}
- **Volumes on Windows-based containers**: When using Windows-based containers,
  the destination of a volume inside the container must be one of:
{% endcomment %}
- **Windows ベースのコンテナーでのボリューム**: Windows ベースのコンテナーを利用しているときは、コンテナー内部のボリューム先は、以下のいずれかでなければなりません。
@z

@x
  - a non-existing or empty directory
  - a drive other than `C:`
@y
  {% comment %}
  - a non-existing or empty directory
  - a drive other than `C:`
  {% endcomment %}
  - 存在していないディレクトリ、または空のディレクトリ
  - `C:` 以下のドライブ
@z

@x
- **Changing the volume from within the Dockerfile**: If any build steps change the
  data within the volume after it has been declared, those changes will be discarded.
@y
{% comment %}
- **Changing the volume from within the Dockerfile**: If any build steps change the
  data within the volume after it has been declared, those changes will be discarded.
{% endcomment %}
- **Dockerfile 内からのボリューム変更**: ボリュームを宣言した後に、そのボリューム内のデータを変更する処理があったとしても、そのような変更は無視され処理されません。
@z

@x
- **JSON formatting**: The list is parsed as a JSON array.
  You must enclose words with double quotes (`"`) rather than single quotes (`'`).
@y
{% comment %}
- **JSON formatting**: The list is parsed as a JSON array.
  You must enclose words with double quotes (`"`) rather than single quotes (`'`).
{% endcomment %}
- **JSON 形式**: 引数リストは JSON 配列として扱われます。
  したがって文字列をくくるのはダブルクォート（`"`）であり、シングルクォート（`'`）は用いてはなりません。
@z

@x
- **The host directory is declared at container run-time**: The host directory
  (the mountpoint) is, by its nature, host-dependent. This is to preserve image
  portability, since a given host directory can't be guaranteed to be available
  on all hosts. For this reason, you can't mount a host directory from
  within the Dockerfile. The `VOLUME` instruction does not support specifying a `host-dir`
  parameter.  You must specify the mountpoint when you create or run the container.
@y
{% comment %}
- **The host directory is declared at container run-time**: The host directory
  (the mountpoint) is, by its nature, host-dependent. This is to preserve image
  portability, since a given host directory can't be guaranteed to be available
  on all hosts. For this reason, you can't mount a host directory from
  within the Dockerfile. The `VOLUME` instruction does not support specifying a `host-dir`
  parameter.  You must specify the mountpoint when you create or run the container.
{% endcomment %}
- **コンテナー実行時に宣言されるホストディレクトリ**: ホストディレクトリ（マウントポイント）は、その性質からして、ホストに依存するものです。
  これはイメージの可搬性を確保するためなので、設定されたホストディレクトリが、あらゆるホスト上にて利用可能になるかどうかの保証はありません。
  このため、Dockerfile の内部からホストディレクトリをマウントすることはできません。
  つまり `VOLUME` 命令は `host-dir`（ホストのディレクトリを指定する）パラメーターをサポートしていません。
  マウントポイントの指定は、コンテナーを生成、実行するときに行う必要があります。
@z

@x
## USER
@y
## USER
@z

@x
    USER <user>[:<group>]
or
    USER <UID>[:<GID>]
@y
{% comment %}
    USER <user>[:<group>]
or
    USER <UID>[:<GID>]
{% endcomment %}
    USER <user>[:<group>]
または
    USER <UID>[:<GID>]
@z

@x
The `USER` instruction sets the user name (or UID) and optionally the user
group (or GID) to use when running the image and for any `RUN`, `CMD` and
`ENTRYPOINT` instructions that follow it in the `Dockerfile`.
@y
{% comment %}
The `USER` instruction sets the user name (or UID) and optionally the user
group (or GID) to use when running the image and for any `RUN`, `CMD` and
`ENTRYPOINT` instructions that follow it in the `Dockerfile`.
{% endcomment %}
`USER` 命令は、ユーザー名（または UID）と、オプションとしてユーザーグループ（または GID）を指定します。
そしてイメージが実行されるとき、`Dockerfile` 内の後続の `RUN`、`CMD`、`ENTRYPOINT` の各命令においてこの情報を利用します。
@z

@x
> **Warning**:
> When the user doesn't have a primary group then the image (or the next
> instructions) will be run with the `root` group.
@y
{% comment %}
> **Warning**:
> When the user doesn't have a primary group then the image (or the next
> instructions) will be run with the `root` group.
{% endcomment %}
> **警告**:
> ユーザーにプライマリーグループがない場合、イメージ（あるいは次の命令）は `root` グループとして実行されます。
@z

@x
> On Windows, the user must be created first if it's not a built-in account.
> This can be done with the `net user` command called as part of a Dockerfile.
@y
{% comment %}
> On Windows, the user must be created first if it's not a built-in account.
> This can be done with the `net user` command called as part of a Dockerfile.
{% endcomment %}
> Windows において、ビルトインアカウント以外のユーザーを利用する場合は、あらかじめユーザーを生成しておく必要があります。
> Dockerfile 内において `net user` コマンドを用いれば、これを行うことができます。
@z

@x
```Dockerfile
    FROM microsoft/windowsservercore
    # Create Windows user in the container
    RUN net user /add patrick
    # Set it for subsequent commands
    USER patrick
```
@y
```Dockerfile
    FROM microsoft/windowsservercore
    # Create Windows user in the container
    RUN net user /add patrick
    # Set it for subsequent commands
    USER patrick
```
@z

@x
## WORKDIR
@y
## WORKDIR
@z

@x
    WORKDIR /path/to/workdir
@y
    WORKDIR /path/to/workdir
@z

@x
The `WORKDIR` instruction sets the working directory for any `RUN`, `CMD`,
`ENTRYPOINT`, `COPY` and `ADD` instructions that follow it in the `Dockerfile`.
If the `WORKDIR` doesn't exist, it will be created even if it's not used in any
subsequent `Dockerfile` instruction.
@y
{% comment %}
The `WORKDIR` instruction sets the working directory for any `RUN`, `CMD`,
`ENTRYPOINT`, `COPY` and `ADD` instructions that follow it in the `Dockerfile`.
If the `WORKDIR` doesn't exist, it will be created even if it's not used in any
subsequent `Dockerfile` instruction.
{% endcomment %}
`WORKDIR` 命令はワークディレクトリを設定します。
`Dockerfile` 内にてその後に続く `RUN`、`CMD`、`ENTRYPOINT`、`COPY`、`ADD` の各命令において利用することができます。
`WORKDIR` が存在しないときは生成されます。
これはたとえ、この後にワークディレクトリが利用されていなくても生成されます。
@z

@x
The `WORKDIR` instruction can be used multiple times in a `Dockerfile`. If a
relative path is provided, it will be relative to the path of the previous
`WORKDIR` instruction. For example:
@y
{% comment %}
The `WORKDIR` instruction can be used multiple times in a `Dockerfile`. If a
relative path is provided, it will be relative to the path of the previous
`WORKDIR` instruction. For example:
{% endcomment %}
`WORKDIR` 命令は `Dockerfile` 内にて複数利用することができます。
ディレクトリ指定に相対パスが用いられた場合、そのパスは、直前の `WORKDIR` 命令からの相対パスとなります。
たとえば以下のとおりです。
@z

@x
    WORKDIR /a
    WORKDIR b
    WORKDIR c
    RUN pwd
@y
    WORKDIR /a
    WORKDIR b
    WORKDIR c
    RUN pwd
@z

@x
The output of the final `pwd` command in this `Dockerfile` would be
`/a/b/c`.
@y
{% comment %}
The output of the final `pwd` command in this `Dockerfile` would be
`/a/b/c`.
{% endcomment %}
上の `Dockerfile` の最後の `pwd` コマンドは `/a/b/c` という出力結果を返します。
@z

@x
The `WORKDIR` instruction can resolve environment variables previously set using
`ENV`. You can only use environment variables explicitly set in the `Dockerfile`.
For example:
@y
{% comment %}
The `WORKDIR` instruction can resolve environment variables previously set using
`ENV`. You can only use environment variables explicitly set in the `Dockerfile`.
For example:
{% endcomment %}
`WORKDIR` 命令では、その前に `ENV` によって設定された環境変数を解釈します。
環境変数は `Dockerfile` の中で明示的に設定したものだけが利用可能です。
たとえば以下のようになります。
@z

@x
    ENV DIRPATH /path
    WORKDIR $DIRPATH/$DIRNAME
    RUN pwd
@y
    ENV DIRPATH /path
    WORKDIR $DIRPATH/$DIRNAME
    RUN pwd
@z

@x
The output of the final `pwd` command in this `Dockerfile` would be
`/path/$DIRNAME`
@y
{% comment %}
The output of the final `pwd` command in this `Dockerfile` would be
`/path/$DIRNAME`
{% endcomment %}
上の `Dockerfile` の最後の `pwd` コマンドは `/path/$DIRNAME` という出力結果を返します。
@z

@x
## ARG
@y
## ARG
@z

@x
    ARG <name>[=<default value>]
@y
    ARG <name>[=<default value>]
@z

@x
The `ARG` instruction defines a variable that users can pass at build-time to
the builder with the `docker build` command using the `--build-arg <varname>=<value>`
flag. If a user specifies a build argument that was not
defined in the Dockerfile, the build outputs a warning.
@y
{% comment %}
The `ARG` instruction defines a variable that users can pass at build-time to
the builder with the `docker build` command using the `--build-arg <varname>=<value>`
flag. If a user specifies a build argument that was not
defined in the Dockerfile, the build outputs a warning.
{% endcomment %}
`ARG` 命令は変数を定義して、ビルド時にその値を受け渡します。
これは `docker build` コマンドにおいて `--build-arg <varname>=<value>` フラグを利用して行います。
指定したビルド引数（build argument）が Dockerfile 内において定義されていない場合は、ビルド処理時に警告メッセージが出力されます。
@z

@x
```
[Warning] One or more build-args [foo] were not consumed.
```
@y
```
[Warning] One or more build-args [foo] were not consumed.
```
@z

@x
A Dockerfile may include one or more `ARG` instructions. For example,
the following is a valid Dockerfile:
@y
{% comment %}
A Dockerfile may include one or more `ARG` instructions. For example,
the following is a valid Dockerfile:
{% endcomment %}
Dockerfile には複数の `ARG` 命令を含めることもできます。
たとえば以下の Dockerfile は有効な例です。
@z

@x
```
FROM busybox
ARG user1
ARG buildno
...
```
@y
```
FROM busybox
ARG user1
ARG buildno
...
```
@z

@x
> **Warning:** It is not recommended to use build-time variables for
>  passing secrets like github keys, user credentials etc. Build-time variable
>  values are visible to any user of the image with the `docker history` command.
@y
{% comment %}
> **Warning:** It is not recommended to use build-time variables for
>  passing secrets like github keys, user credentials etc. Build-time variable
>  values are visible to any user of the image with the `docker history` command.
{% endcomment %}
> **警告:** ビルド時の変数として、github キーや認証情報などの秘密の情報を設定することは、お勧めできません。
>  ビルド変数の値は、イメージを利用する他人が `docker history` コマンドを実行すれば容易に見ることができてしまうからです。
@z

@x
### Default values
@y
{% comment %}
### Default values
{% endcomment %}
### デフォルト値
{: #default-values }
@z

@x
An `ARG` instruction can optionally include a default value:
@y
{% comment %}
An `ARG` instruction can optionally include a default value:
{% endcomment %}
`ARG` 命令にはオプションとしてデフォルト値を設定することができます。
@z

@x
```
FROM busybox
ARG user1=someuser
ARG buildno=1
...
```
@y
```
FROM busybox
ARG user1=someuser
ARG buildno=1
...
```
@z

@x
If an `ARG` instruction has a default value and if there is no value passed
at build-time, the builder uses the default.
@y
{% comment %}
If an `ARG` instruction has a default value and if there is no value passed
at build-time, the builder uses the default.
{% endcomment %}
`ARG` 命令にデフォルト値が設定されていて、ビルド時に値設定が行われなければ、デフォルト値が用いられます。
@z

@x
### Scope
@y
{% comment %}
### Scope
{% endcomment %}
### スコープ
{: #scope }
@z

@x
An `ARG` variable definition comes into effect from the line on which it is
defined in the `Dockerfile` not from the argument's use on the command-line or
elsewhere.  For example, consider this Dockerfile:
@y
{% comment %}
An `ARG` variable definition comes into effect from the line on which it is
defined in the `Dockerfile` not from the argument's use on the command-line or
elsewhere.  For example, consider this Dockerfile:
{% endcomment %}
`ARG` による値定義が有効になるのは、`Dockerfile` 内の記述行以降です。
コマンドラインなどにおいて用いられるときではありません。
たとえば以下のような Dockerfile を見てみます。
@z

@x
```
1 FROM busybox
2 USER ${user:-some_user}
3 ARG user
4 USER $user
...
```
A user builds this file by calling:
@y
{% comment %}
```
1 FROM busybox
2 USER ${user:-some_user}
3 ARG user
4 USER $user
...
```
A user builds this file by calling:
{% endcomment %}
```
1 FROM busybox
2 USER ${user:-some_user}
3 ARG user
4 USER $user
...
```
このファイルをビルドするには以下を実行します。
@z

@x
```
$ docker build --build-arg user=what_user .
```
@y
```
$ docker build --build-arg user=what_user .
```
@z

@x
The `USER` at line 2 evaluates to `some_user` as the `user` variable is defined on the
subsequent line 3. The `USER` at line 4 evaluates to `what_user` as `user` is
defined and the `what_user` value was passed on the command line. Prior to its definition by an
`ARG` instruction, any use of a variable results in an empty string.
@y
{% comment %}
The `USER` at line 2 evaluates to `some_user` as the `user` variable is defined on the
subsequent line 3. The `USER` at line 4 evaluates to `what_user` as `user` is
defined and the `what_user` value was passed on the command line. Prior to its definition by an
`ARG` instruction, any use of a variable results in an empty string.
{% endcomment %}
2 行めの `USER` が `some-user` として評価されます。
これは `user` 変数が、直後の 3 行めにおいて定義されているからです。
そして 4 行めの `USER` は `what_user` として評価されます。
`user` が定義済であって、コマンドラインから `what_user` という値が受け渡されたからです。
`ARG` 命令による定義を行うまで、その変数を利用しても空の文字列として扱われます。
@z

@x
An `ARG` instruction goes out of scope at the end of the build
stage where it was defined. To use an arg in multiple stages, each stage must
include the `ARG` instruction.
@y
{% comment %}
An `ARG` instruction goes out of scope at the end of the build
stage where it was defined. To use an arg in multiple stages, each stage must
include the `ARG` instruction.
{% endcomment %}
`ARG` 命令の変数スコープは、それが定義されたビルドステージが終了するときまでです。
複数のビルドステージにおいて `ARG` を利用する場合は、個々に `ARG` 命令を指定する必要があります。
@z

@x
```
FROM busybox
ARG SETTINGS
RUN ./run/setup $SETTINGS
@y
```
FROM busybox
ARG SETTINGS
RUN ./run/setup $SETTINGS
@z

@x
FROM busybox
ARG SETTINGS
RUN ./run/other $SETTINGS
```
@y
FROM busybox
ARG SETTINGS
RUN ./run/other $SETTINGS
```
@z

@x
### Using ARG variables
@y
{% comment %}
### Using ARG variables
{% endcomment %}
### ARG 変数の利用
{: #using-arg-variables }
@z

@x
You can use an `ARG` or an `ENV` instruction to specify variables that are
available to the `RUN` instruction. Environment variables defined using the
`ENV` instruction always override an `ARG` instruction of the same name. Consider
this Dockerfile with an `ENV` and `ARG` instruction.
@y
{% comment %}
You can use an `ARG` or an `ENV` instruction to specify variables that are
available to the `RUN` instruction. Environment variables defined using the
`ENV` instruction always override an `ARG` instruction of the same name. Consider
this Dockerfile with an `ENV` and `ARG` instruction.
{% endcomment %}
`ARG` 命令や `ENV` 命令において変数を指定し、それを `RUN` 命令にて用いることができます。
`ENV` 命令を使って定義された環境変数は、`ARG` 命令において同名の変数が指定されていたとしても優先されます。
以下のように `ENV` 命令と `ARG` 命令を含む Dockerfile があるとします。
@z

@x
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER v1.0.0
4 RUN echo $CONT_IMG_VER
```
Then, assume this image is built with this command:
@y
{% comment %}
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER v1.0.0
4 RUN echo $CONT_IMG_VER
```
Then, assume this image is built with this command:
{% endcomment %}
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER v1.0.0
4 RUN echo $CONT_IMG_VER
```
そしてこのイメージを以下のコマンドによりビルドしたとします。
@z

@x
```
$ docker build --build-arg CONT_IMG_VER=v2.0.1 .
```
@y
```
$ docker build --build-arg CONT_IMG_VER=v2.0.1 .
```
@z

@x
In this case, the `RUN` instruction uses `v1.0.0` instead of the `ARG` setting
passed by the user:`v2.0.1` This behavior is similar to a shell
script where a locally scoped variable overrides the variables passed as
arguments or inherited from environment, from its point of definition.
@y
{% comment %}
In this case, the `RUN` instruction uses `v1.0.0` instead of the `ARG` setting
passed by the user:`v2.0.1` This behavior is similar to a shell
script where a locally scoped variable overrides the variables passed as
arguments or inherited from environment, from its point of definition.
{% endcomment %}
この例において `RUN` 命令は `v1.0.0` という値を採用します。
コマンドラインから `v2.0.1` が受け渡され `ARG` の値に設定されますが、それが用いられるわけではありません。
これはちょうどシェルスクリプトにおいて行われる動きに似ています。
ローカルなスコープを持つ変数は、指定された引数や環境から受け継いだ変数よりも優先されます。
@z

@x
Using the example above but a different `ENV` specification you can create more
useful interactions between `ARG` and `ENV` instructions:
@y
{% comment %}
Using the example above but a different `ENV` specification you can create more
useful interactions between `ARG` and `ENV` instructions:
{% endcomment %}
上の例を利用しつつ `ENV` のもう 1 つ別の仕様を用いると、さらに `ARG` と `ENV` の組み合わせによる以下のような利用もできます。
@z

@x
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER ${CONT_IMG_VER:-v1.0.0}
4 RUN echo $CONT_IMG_VER
```
@y
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER ${CONT_IMG_VER:-v1.0.0}
4 RUN echo $CONT_IMG_VER
```
@z

@x
Unlike an `ARG` instruction, `ENV` values are always persisted in the built
image. Consider a docker build without the `--build-arg` flag:
@y
{% comment %}
Unlike an `ARG` instruction, `ENV` values are always persisted in the built
image. Consider a docker build without the `--build-arg` flag:
{% endcomment %}
`ARG` 命令とは違って `ENV` による値はビルドイメージ内に常に保持されます。
以下のような `--build-arg` フラグのない `docker build` を見てみます。
@z

@x
```
$ docker build .
```
@y
```
$ docker build .
```
@z

@x
Using this Dockerfile example, `CONT_IMG_VER` is still persisted in the image but
its value would be `v1.0.0` as it is the default set in line 3 by the `ENV` instruction.
@y
{% comment %}
Using this Dockerfile example, `CONT_IMG_VER` is still persisted in the image but
its value would be `v1.0.0` as it is the default set in line 3 by the `ENV` instruction.
{% endcomment %}
上の Dockerfile の例を用いると、`CONT_IMG_VER` の値はイメージ内に保持されますが、その値は `v1.0.0` になります。
これは 3 行めの `ENV` 命令で設定されているデフォルト値です。
@z

@x
The variable expansion technique in this example allows you to pass arguments
from the command line and persist them in the final image by leveraging the
`ENV` instruction. Variable expansion is only supported for [a limited set of
Dockerfile instructions.](#environment-replacement)
@y
{% comment %}
The variable expansion technique in this example allows you to pass arguments
from the command line and persist them in the final image by leveraging the
`ENV` instruction. Variable expansion is only supported for [a limited set of
Dockerfile instructions.](#environment-replacement)
{% endcomment %}
この例で見たように変数展開の手法では、コマンドラインから引数を受け渡すことが可能であり、`ENV` 命令を用いればその値を最終イメージに残すことができます。
変数展開は、[特定の Dockerfile 命令](#environment-replacement)においてのみサポートされます。
@z

@x
### Predefined ARGs
@y
{% comment %}
### Predefined ARGs
{% endcomment %}
### 定義済 ARG 変数
{: #predefined-args }
@z

@x
Docker has a set of predefined `ARG` variables that you can use without a
corresponding `ARG` instruction in the Dockerfile.
@y
{% comment %}
Docker has a set of predefined `ARG` variables that you can use without a
corresponding `ARG` instruction in the Dockerfile.
{% endcomment %}
Docker にはあらかじめ定義された `ARG` 変数があります。
これは Dockerfile において `ARG` 命令を指定しなくても利用することができます。
@z

@x
* `HTTP_PROXY`
* `http_proxy`
* `HTTPS_PROXY`
* `https_proxy`
* `FTP_PROXY`
* `ftp_proxy`
* `NO_PROXY`
* `no_proxy`
@y
* `HTTP_PROXY`
* `http_proxy`
* `HTTPS_PROXY`
* `https_proxy`
* `FTP_PROXY`
* `ftp_proxy`
* `NO_PROXY`
* `no_proxy`
@z

@x
To use these, simply pass them on the command line using the flag:
@y
{% comment %}
To use these, simply pass them on the command line using the flag:
{% endcomment %}
これを利用する場合は、コマンドラインから以下のフラグを与えるだけです。
@z

@x
```
--build-arg <varname>=<value>
```
@y
```
--build-arg <varname>=<value>
```
@z

@x
By default, these pre-defined variables are excluded from the output of
`docker history`. Excluding them reduces the risk of accidentally leaking
sensitive authentication information in an `HTTP_PROXY` variable.
@y
{% comment %}
By default, these pre-defined variables are excluded from the output of
`docker history`. Excluding them reduces the risk of accidentally leaking
sensitive authentication information in an `HTTP_PROXY` variable.
{% endcomment %}
デフォルトにおいて、これらの定義済変数は `docker history` による出力からは除外されます。
除外する理由は、`HTTP_PROXY` などの各変数内にある重要な認証情報が漏洩するリスクを軽減するためです。
@z

@x
For example, consider building the following Dockerfile using
`--build-arg HTTP_PROXY=http://user:pass@proxy.lon.example.com`
@y
{% comment %}
For example, consider building the following Dockerfile using
`--build-arg HTTP_PROXY=http://user:pass@proxy.lon.example.com`
{% endcomment %}
たとえば `--build-arg HTTP_PROXY=http://user:pass@proxy.lon.example.com` という引数を用いて、以下の Dockerfile をビルドするとします。
@z

@x
``` Dockerfile
FROM ubuntu
RUN echo "Hello World"
```
@y
``` Dockerfile
FROM ubuntu
RUN echo "Hello World"
```
@z

@x
In this case, the value of the `HTTP_PROXY` variable is not available in the
`docker history` and is not cached. If you were to change location, and your
proxy server changed to `http://user:pass@proxy.sfo.example.com`, a subsequent
build does not result in a cache miss.
@y
{% comment %}
In this case, the value of the `HTTP_PROXY` variable is not available in the
`docker history` and is not cached. If you were to change location, and your
proxy server changed to `http://user:pass@proxy.sfo.example.com`, a subsequent
build does not result in a cache miss.
{% endcomment %}
この場合、`HTTP_PROXY` 変数の値は `docker history` から取得することはできず、キャッシュにも含まれていません。
したがって URL が変更され、プロキシーサーバーも `http://user:pass@proxy.sfo.example.com` に変更したとしても、この後に続くビルド処理において、キャッシュミスは発生しません。
@z

@x
If you need to override this behaviour then you may do so by adding an `ARG`
statement in the Dockerfile as follows:
@y
{% comment %}
If you need to override this behaviour then you may do so by adding an `ARG`
statement in the Dockerfile as follows:
{% endcomment %}
この動作を取り消す必要がある場合は、以下のように Dockerfile 内に `ARG` 命令を加えれば実現できます。
@z

@x
``` Dockerfile
FROM ubuntu
ARG HTTP_PROXY
RUN echo "Hello World"
```
@y
``` Dockerfile
FROM ubuntu
ARG HTTP_PROXY
RUN echo "Hello World"
```
@z

@x
When building this Dockerfile, the `HTTP_PROXY` is preserved in the
`docker history`, and changing its value invalidates the build cache.
@y
{% comment %}
When building this Dockerfile, the `HTTP_PROXY` is preserved in the
`docker history`, and changing its value invalidates the build cache.
{% endcomment %}
この Dockerfile がビルドされるとき、`HTTP_PROXY` は `docker history` に保存されます。
そしてその値を変更すると、ビルドキャッシュは無効化されます。
@z

@x
### Automatic platform ARGs in the global scope
@y
{% comment %}
### Automatic platform ARGs in the global scope
{% endcomment %}
### プラットフォームに応じて自動設定されるグローバル ARG 変数
{: #automatic-platform-args-in-the-global-scope }
@z

@x
This feature is only available when using the [BuildKit](#buildkit) backend.
@y
{% comment %}
This feature is only available when using the [BuildKit](#buildkit) backend.
{% endcomment %}
この機能は [BuildKit](#buildkit) バックエンドを用いている場合にのみ利用可能です。
@z

@x
Docker predefines a set of `ARG` variables with information on the platform of
the node performing the build (build platform) and on the platform of the
resulting image (target platform). The target platform can be specified with
the `--platform` flag on `docker build`.
@y
{% comment %}
Docker predefines a set of `ARG` variables with information on the platform of
the node performing the build (build platform) and on the platform of the
resulting image (target platform). The target platform can be specified with
the `--platform` flag on `docker build`.
{% endcomment %}
Docker にはあらかじめ定義された `ARG` 変数として、ビルド処理を行ったプラットフォーム（ビルドプラットフォーム）の、あるいはイメージを作り出したプラットフォーム（ターゲットプラットフォーム）の、各ノード情報を提供するものがあります。
ターゲットプラットフォームは `docker build` の `--platform` フラグを使って指定することもできます。
@z

@x
The following `ARG` variables are set automatically:
@y
{% comment %}
The following `ARG` variables are set automatically:
{% endcomment %}
以下の `ARG` 変数が自動的に定義されています。
@z

@x
* `TARGETPLATFORM` - platform of the build result. Eg `linux/amd64`, `linux/arm/v7`, `windows/amd64`.
* `TARGETOS` - OS component of TARGETPLATFORM
* `TARGETARCH` - architecture component of TARGETPLATFORM
* `TARGETVARIANT` - variant component of TARGETPLATFORM
* `BUILDPLATFORM` - platform of the node performing the build.
* `BUILDOS` - OS component of BUILDPLATFORM
* `BUILDARCH` - architecture component of BUILDPLATFORM
* `BUILDVARIANT` - variant component of BUILDPLATFORM
@y
{% comment %}
* `TARGETPLATFORM` - platform of the build result. Eg `linux/amd64`, `linux/arm/v7`, `windows/amd64`.
* `TARGETOS` - OS component of TARGETPLATFORM
* `TARGETARCH` - architecture component of TARGETPLATFORM
* `TARGETVARIANT` - variant component of TARGETPLATFORM
* `BUILDPLATFORM` - platform of the node performing the build.
* `BUILDOS` - OS component of BUILDPLATFORM
* `BUILDARCH` - architecture component of BUILDPLATFORM
* `BUILDVARIANT` - variant component of BUILDPLATFORM
{% endcomment %}
* `TARGETPLATFORM` - ビルド結果のプラットフォーム。 `linux/amd64`、 `linux/arm/v7`、 `windows/amd64` など。
* `TARGETOS` - TARGETPLATFORM の OS 部分。
* `TARGETARCH` - TARGETPLATFORM のアーキテクチャー部分。
* `TARGETVARIANT` - TARGETPLATFORM のバリアント（variant）部分。
* `BUILDPLATFORM` - ビルド処理を行ったプラットフォーム。
* `BUILDOS` - BUILDPLATFORM の OS 部分。
* `BUILDARCH` - BUILDPLATFORM のアーキテクチャー部分。
* `BUILDVARIANT` - BUILDPLATFORM のバリアント（variant）部分。
@z

@x
These arguments are defined in the global scope so are not automatically
available inside build stages or for your `RUN` commands. To expose one of
these arguments inside the build stage redefine it without value.
@y
{% comment %}
These arguments are defined in the global scope so are not automatically
available inside build stages or for your `RUN` commands. To expose one of
these arguments inside the build stage redefine it without value.
{% endcomment %}
この変数はグローバルスコープにより定義されます。
したがってビルドステージの内部にて、あるいは `RUN` コマンドにおいて、自動的に利用できるものではありません。
ビルドステージにおいてこの変数を明示的に利用するためには、値をつけずにその変数を再定義します。
@z

@x
For example:
@y
{% comment %}
For example:
{% endcomment %}
たとえば以下のとおりです。
@z

@x
```Dockerfile
FROM alpine
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
```
@y
```Dockerfile
FROM alpine
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
```
@z

@x
### Impact on build caching
@y
{% comment %}
### Impact on build caching
{% endcomment %}
### ビルドキャッシュへの影響
{: #impact-on-build-caching }
@z

@x
`ARG` variables are not persisted into the built image as `ENV` variables are.
However, `ARG` variables do impact the build cache in similar ways. If a
Dockerfile defines an `ARG` variable whose value is different from a previous
build, then a "cache miss" occurs upon its first usage, not its definition. In
particular, all `RUN` instructions following an `ARG` instruction use the `ARG`
variable implicitly (as an environment variable), thus can cause a cache miss.
All predefined `ARG` variables are exempt from caching unless there is a
matching `ARG` statement in the `Dockerfile`.
@y
{% comment %}
`ARG` variables are not persisted into the built image as `ENV` variables are.
However, `ARG` variables do impact the build cache in similar ways. If a
Dockerfile defines an `ARG` variable whose value is different from a previous
build, then a "cache miss" occurs upon its first usage, not its definition. In
particular, all `RUN` instructions following an `ARG` instruction use the `ARG`
variable implicitly (as an environment variable), thus can cause a cache miss.
All predefined `ARG` variables are exempt from caching unless there is a
matching `ARG` statement in the `Dockerfile`.
{% endcomment %}
`ARG` 変数は `ENV` 変数とは違って、ビルドイメージの中に保持されません。
しかし `ARG` 変数はビルドキャッシュへ同じような影響を及ぼします。
Dockerfile に `ARG` 変数が定義されていて、その値が前回のビルドとは異なった値が設定されたとします。
このとき「キャッシュミス」（cache miss）が発生しますが、それは初めて利用されたときであり、定義された段階ではありません。
特に `ARG` 命令に続く `RUN` 命令は、`ARG` 変数の値を（環境変数として）暗に利用しますが、そこでキャッシュミスが起こります。
定義済の `ARG` 変数は、`Dockerfile` 内に `ARG` 行がない限りは、キャッシュは行われません。
@z

@x
For example, consider these two Dockerfile:
@y
{% comment %}
For example, consider these two Dockerfile:
{% endcomment %}
たとえば以下の 2 つの Dockerfile を考えます。
@z

@x
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 RUN echo $CONT_IMG_VER
```
@y
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 RUN echo $CONT_IMG_VER
```
@z

@x
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 RUN echo hello
```
@y
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 RUN echo hello
```
@z

@x
If you specify `--build-arg CONT_IMG_VER=<value>` on the command line, in both
cases, the specification on line 2 does not cause a cache miss; line 3 does
cause a cache miss.`ARG CONT_IMG_VER` causes the RUN line to be identified
as the same as running `CONT_IMG_VER=<value>` echo hello, so if the `<value>`
changes, we get a cache miss.
@y
{% comment %}
If you specify `--build-arg CONT_IMG_VER=<value>` on the command line, in both
cases, the specification on line 2 does not cause a cache miss; line 3 does
cause a cache miss.`ARG CONT_IMG_VER` causes the RUN line to be identified
as the same as running `CONT_IMG_VER=<value>` echo hello, so if the `<value>`
changes, we get a cache miss.
{% endcomment %}
コマンドラインから `--build-arg CONT_IMG_VER=<value>` を指定すると 2 つの例ともに、2 行めの記述ではキャッシュミスが起きず、3 行めで発生します。
`ARG CONT_IMG_VER` は、`RUN` 行において `CONT_IMG_VER=<value>` echo hello と同等のことが実行されるので、`<value>` が変更されると、キャッシュミスが起こるということです。
@z

@x
Consider another example under the same command line:
@y
{% comment %}
Consider another example under the same command line:
{% endcomment %}
もう 1 つの例を、同じコマンドライン実行を行って利用するとします。
@z

@x
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER $CONT_IMG_VER
4 RUN echo $CONT_IMG_VER
```
@y
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER $CONT_IMG_VER
4 RUN echo $CONT_IMG_VER
```
@z

@x
In this example, the cache miss occurs on line 3. The miss happens because
the variable's value in the `ENV` references the `ARG` variable and that
variable is changed through the command line. In this example, the `ENV`
command causes the image to include the value.
@y
{% comment %}
In this example, the cache miss occurs on line 3. The miss happens because
the variable's value in the `ENV` references the `ARG` variable and that
variable is changed through the command line. In this example, the `ENV`
command causes the image to include the value.
{% endcomment %}
この例においてキャッシュミスは 3 行めで発生します。
これは `ENV` における変数値が `ARG` 変数を参照しており、その変数値がコマンドラインから変更されるために起きます。
この例では `ENV` コマンドがイメージに対して変数値を書き込むものとなります。
@z

@x
If an `ENV` instruction overrides an `ARG` instruction of the same name, like
this Dockerfile:
@y
{% comment %}
If an `ENV` instruction overrides an `ARG` instruction of the same name, like
this Dockerfile:
{% endcomment %}
`ENV` 命令が `ARG` 命令の同一変数名を上書きする例を見てみます。
@z

@x
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER hello
4 RUN echo $CONT_IMG_VER
```
@y
```
1 FROM ubuntu
2 ARG CONT_IMG_VER
3 ENV CONT_IMG_VER hello
4 RUN echo $CONT_IMG_VER
```
@z

@x
Line 3 does not cause a cache miss because the value of `CONT_IMG_VER` is a
constant (`hello`). As a result, the environment variables and values used on
the `RUN` (line 4) doesn't change between builds.
@y
{% comment %}
Line 3 does not cause a cache miss because the value of `CONT_IMG_VER` is a
constant (`hello`). As a result, the environment variables and values used on
the `RUN` (line 4) doesn't change between builds.
{% endcomment %}
3 行めにおいてキャッシュミスは発生しません。
これは `CONT_IMG_VER` が定数（`hello`）であるからです。
その結果、4 行めの `RUN` 命令において用いられる環境変数およびその値は、ビルドの際に変更されません。
@z

@x
## ONBUILD
@y
## ONBUILD
@z

@x
    ONBUILD [INSTRUCTION]
@y
    ONBUILD [INSTRUCTION]
@z

@x
The `ONBUILD` instruction adds to the image a *trigger* instruction to
be executed at a later time, when the image is used as the base for
another build. The trigger will be executed in the context of the
downstream build, as if it had been inserted immediately after the
`FROM` instruction in the downstream `Dockerfile`.
@y
{% comment %}
The `ONBUILD` instruction adds to the image a *trigger* instruction to
be executed at a later time, when the image is used as the base for
another build. The trigger will be executed in the context of the
downstream build, as if it had been inserted immediately after the
`FROM` instruction in the downstream `Dockerfile`.
{% endcomment %}
`ONBUILD` 命令は、イメージに対して**トリガー**命令（trigger instruction）を追加します。
トリガー命令は後々実行されるものであり、そのイメージが他のビルドにおけるベースイメージとして用いられたときに実行されます。
このトリガー命令は、後続のビルドコンテキスト内で実行されます。
後続の `Dockerfile` 内での `FROM` 命令の直後に、その命令が挿入されたかのようにして動作します。
@z

@x
Any build instruction can be registered as a trigger.
@y
{% comment %}
Any build instruction can be registered as a trigger.
{% endcomment %}
どのようなビルド命令でも、トリガー命令として登録することができます。
@z

@x
This is useful if you are building an image which will be used as a base
to build other images, for example an application build environment or a
daemon which may be customized with user-specific configuration.
@y
{% comment %}
This is useful if you are building an image which will be used as a base
to build other images, for example an application build environment or a
daemon which may be customized with user-specific configuration.
{% endcomment %}
この命令は、他のイメージのビルドに用いることを意図したイメージをビルドする際に利用できます。
たとえばアプリケーションやデーモンの開発環境であって、ユーザー特有の設定を行うような場合です。
@z

@x
For example, if your image is a reusable Python application builder, it
will require application source code to be added in a particular
directory, and it might require a build script to be called *after*
that. You can't just call `ADD` and `RUN` now, because you don't yet
have access to the application source code, and it will be different for
each application build. You could simply provide application developers
with a boilerplate `Dockerfile` to copy-paste into their application, but
that is inefficient, error-prone and difficult to update because it
mixes with application-specific code.
@y
{% comment %}
For example, if your image is a reusable Python application builder, it
will require application source code to be added in a particular
directory, and it might require a build script to be called *after*
that. You can't just call `ADD` and `RUN` now, because you don't yet
have access to the application source code, and it will be different for
each application build. You could simply provide application developers
with a boilerplate `Dockerfile` to copy-paste into their application, but
that is inefficient, error-prone and difficult to update because it
mixes with application-specific code.
{% endcomment %}
たとえば、繰り返し利用できる Python アプリケーション環境イメージがあるとします。
そしてこのイメージにおいては、アプリケーションソースコードを所定のディレクトリに配置することが必要であって、さらにソースを配置した後にソースビルドを行うスクリプトを加えたいとします。
このままでは `ADD` と `RUN` を単に呼び出すだけでは実現できません。
それはアプリケーションソースコードがまだわかっていないからであり、ソースコードはアプリケーション環境ごとに異なるからです。
アプリケーション開発者に向けて、ひながたとなる `Dockerfile` を提供して、コピーペーストした上でアプリケーションに組み入れるようにすることも考えられます。
しかしこれでは不十分であり、エラーも起こしやすくなります。
そしてアプリケーションに特有のコードが含まれることになるので、更新作業も大変になります。
@z

@x
The solution is to use `ONBUILD` to register advance instructions to
run later, during the next build stage.
@y
{% comment %}
The solution is to use `ONBUILD` to register advance instructions to
run later, during the next build stage.
{% endcomment %}
これを解決するには `ONBUILD` を利用します。
後々実行する追加の命令を登録しておき、次のビルドステージにおいて実行させるものです。
@z

@x
Here's how it works:
@y
{% comment %}
Here's how it works:
{% endcomment %}
これは以下のようにして動作します。
@z

@x
1. When it encounters an `ONBUILD` instruction, the builder adds a
   trigger to the metadata of the image being built. The instruction
   does not otherwise affect the current build.
2. At the end of the build, a list of all triggers is stored in the
   image manifest, under the key `OnBuild`. They can be inspected with
   the `docker inspect` command.
3. Later the image may be used as a base for a new build, using the
   `FROM` instruction. As part of processing the `FROM` instruction,
   the downstream builder looks for `ONBUILD` triggers, and executes
   them in the same order they were registered. If any of the triggers
   fail, the `FROM` instruction is aborted which in turn causes the
   build to fail. If all triggers succeed, the `FROM` instruction
   completes and the build continues as usual.
4. Triggers are cleared from the final image after being executed. In
   other words they are not inherited by "grand-children" builds.
@y
{% comment %}
1. When it encounters an `ONBUILD` instruction, the builder adds a
   trigger to the metadata of the image being built. The instruction
   does not otherwise affect the current build.
2. At the end of the build, a list of all triggers is stored in the
   image manifest, under the key `OnBuild`. They can be inspected with
   the `docker inspect` command.
3. Later the image may be used as a base for a new build, using the
   `FROM` instruction. As part of processing the `FROM` instruction,
   the downstream builder looks for `ONBUILD` triggers, and executes
   them in the same order they were registered. If any of the triggers
   fail, the `FROM` instruction is aborted which in turn causes the
   build to fail. If all triggers succeed, the `FROM` instruction
   completes and the build continues as usual.
4. Triggers are cleared from the final image after being executed. In
   other words they are not inherited by "grand-children" builds.
{% endcomment %}
1. `ONBUILD` 命令があると、現在ビルドしているイメージのメタデータに対してトリガーが追加されます。
   この命令は現在のビルドには影響を与えません。
2. ビルドの最後に、トリガーの一覧がイメージマニフェスト内の `OnBuild` というキーのもとに保存されます。
   この情報は `docker inspect` コマンドを使って確認することができます。
3. 次のビルドにおけるベースイメージとして、このイメージを利用します。
   その指定には `FROM` 命令を用います。
   `FROM` 命令の処理の中で、後続ビルド処理が `ONBUILD` トリガーを見つけると、それが登録された順に実行していきます。
   トリガーが 1 つでも失敗したら、`FROM` 命令は中断され、ビルドが失敗することになります。
   すべてのトリガーが成功したら `FROM` 命令の処理が終わり、ビルド処理がその後に続きます。
4. トリガーは、イメージが実行された後は、イメージ内から削除されます。
   別の言い方をすれば、「孫」のビルドにまでは受け継がれないということです。
@z

@x
For example you might add something like this:
@y
{% comment %}
For example you might add something like this:
{% endcomment %}
例として以下のようなことを追加する場合が考えられます。
@z

@x
    [...]
    ONBUILD ADD . /app/src
    ONBUILD RUN /usr/local/bin/python-build --dir /app/src
    [...]
@y
    [...]
    ONBUILD ADD . /app/src
    ONBUILD RUN /usr/local/bin/python-build --dir /app/src
    [...]
@z

@x
> **Warning**: Chaining `ONBUILD` instructions using `ONBUILD ONBUILD` isn't allowed.
@y
{% comment %}
> **Warning**: Chaining `ONBUILD` instructions using `ONBUILD ONBUILD` isn't allowed.
{% endcomment %}
> **警告**: `ONBUILD` 命令をつなぎ合わせた命令、`ONBUILD ONBUILD` は実現することはできません。
@z

@x
> **Warning**: The `ONBUILD` instruction may not trigger `FROM` or `MAINTAINER` instructions.
@y
{% comment %}
> **Warning**: The `ONBUILD` instruction may not trigger `FROM` or `MAINTAINER` instructions.
{% endcomment %}
> **警告**: `ONBUILD` 命令は `FROM` 命令や `MAINTAINER` 命令をトリガーとすることはできません。
@z

@x
## STOPSIGNAL
@y
## STOPSIGNAL
@z

@x
    STOPSIGNAL signal
@y
    STOPSIGNAL signal
@z

@x
The `STOPSIGNAL` instruction sets the system call signal that will be sent to the container to exit.
This signal can be a valid unsigned number that matches a position in the kernel's syscall table, for instance 9,
or a signal name in the format SIGNAME, for instance SIGKILL.
@y
{% comment %}
The `STOPSIGNAL` instruction sets the system call signal that will be sent to the container to exit.
This signal can be a valid unsigned number that matches a position in the kernel's syscall table, for instance 9,
or a signal name in the format SIGNAME, for instance SIGKILL.
{% endcomment %}
`STOPSIGNAL` 命令はシステムコールシグナルを設定するものであり、コンテナーが終了するときに送信されます。
シグナルは負ではない整数値であり、カーネルのシステムコールテーブル内に合致するものを指定します。
たとえば 9 などです。
あるいは SIGNAME という形式のシグナル名を指定します。
たとえば SIGKILL などです。
@z

@x
## HEALTHCHECK
@y
## HEALTHCHECK
@z

@x
The `HEALTHCHECK` instruction has two forms:
@y
{% comment %}
The `HEALTHCHECK` instruction has two forms:
{% endcomment %}
`HEALTHCHECK` 命令には 2 つの書式があります。
@z

@x
* `HEALTHCHECK [OPTIONS] CMD command` (check container health by running a command inside the container)
* `HEALTHCHECK NONE` (disable any healthcheck inherited from the base image)
@y
{% comment %}
* `HEALTHCHECK [OPTIONS] CMD command` (check container health by running a command inside the container)
* `HEALTHCHECK NONE` (disable any healthcheck inherited from the base image)
{% endcomment %}
* `HEALTHCHECK [OPTIONS] CMD command` （コンテナー内部でコマンドを実行し、コンテナーをヘルスチェック）
* `HEALTHCHECK NONE` （ベースイメージが行うヘルスチェックを無効化）
@z

@x
The `HEALTHCHECK` instruction tells Docker how to test a container to check that
it is still working. This can detect cases such as a web server that is stuck in
an infinite loop and unable to handle new connections, even though the server
process is still running.
@y
{% comment %}
The `HEALTHCHECK` instruction tells Docker how to test a container to check that
it is still working. This can detect cases such as a web server that is stuck in
an infinite loop and unable to handle new connections, even though the server
process is still running.
{% endcomment %}
`HEALTHCHECK` 命令は、コンテナーが動作していることをチェックする方法を指定するものです。
この機能はたとえば、ウェブサーバーのプロセスが稼動はしているものの、無限ループに陥っていて新たな接続を受け入れられない状態を検知する場合などに利用できます。
@z

@x
When a container has a healthcheck specified, it has a _health status_ in
addition to its normal status. This status is initially `starting`. Whenever a
health check passes, it becomes `healthy` (whatever state it was previously in).
After a certain number of consecutive failures, it becomes `unhealthy`.
@y
{% comment %}
When a container has a healthcheck specified, it has a _health status_ in
addition to its normal status. This status is initially `starting`. Whenever a
health check passes, it becomes `healthy` (whatever state it was previously in).
After a certain number of consecutive failures, it becomes `unhealthy`.
{% endcomment %}
コンテナーにヘルスチェックが設定されていると、通常のステータスに加えて**ヘルスステータス**を持つことになります。
このステータスの初期値は `starting` です。
ヘルスチェックが行われると、このステータスは（それまでにどんなステータスであっても）`healthy` となります。
ある一定数、連続してチェックに失敗すると、そのステータスは `unhealty` となります。
@z

@x
The options that can appear before `CMD` are:
@y
{% comment %}
The options that can appear before `CMD` are:
{% endcomment %}
`CMD` より前に記述できるオプションは以下のものです。
@z

@x
* `--interval=DURATION` (default: `30s`)
* `--timeout=DURATION` (default: `30s`)
* `--start-period=DURATION` (default: `0s`)
* `--retries=N` (default: `3`)
@y
{% comment %}
* `--interval=DURATION` (default: `30s`)
* `--timeout=DURATION` (default: `30s`)
* `--start-period=DURATION` (default: `0s`)
* `--retries=N` (default: `3`)
{% endcomment %}
* `--interval=DURATION` (デフォルト: `30s`)
* `--timeout=DURATION` (デフォルト: `30s`)
* `--start-period=DURATION` (デフォルト: `0s`)
* `--retries=N` (デフォルト: `3`)
@z

@x
The health check will first run **interval** seconds after the container is
started, and then again **interval** seconds after each previous check completes.
@y
{% comment %}
The health check will first run **interval** seconds after the container is
started, and then again **interval** seconds after each previous check completes.
{% endcomment %}
ヘルスチェックは、コンテナーが起動した **interval** 秒後に最初に起動されます。
そして直前のヘルスチェックが完了した **interval** 秒後に、再び実行されます。
@z

@x
If a single run of the check takes longer than **timeout** seconds then the check
is considered to have failed.
@y
{% comment %}
If a single run of the check takes longer than **timeout** seconds then the check
is considered to have failed.
{% endcomment %}
1 回のヘルスチェックが **timeout** 秒以上かかったとき、そのチェックは失敗したものとして扱われます。
@z

@x
It takes **retries** consecutive failures of the health check for the container
to be considered `unhealthy`.
@y
{% comment %}
It takes **retries** consecutive failures of the health check for the container
to be considered `unhealthy`.
{% endcomment %}
コンテナーに対するヘルスチェックが **retries** 回分、連続して失敗した場合は `unhealthy` とみなされます。
@z

@x
**start period** provides initialization time for containers that need time to bootstrap.
Probe failure during that period will not be counted towards the maximum number of retries.
However, if a health check succeeds during the start period, the container is considered
started and all consecutive failures will be counted towards the maximum number of retries.
@y
{% comment %}
**start period** provides initialization time for containers that need time to bootstrap.
Probe failure during that period will not be counted towards the maximum number of retries.
However, if a health check succeeds during the start period, the container is considered
started and all consecutive failures will be counted towards the maximum number of retries.
{% endcomment %}
**開始時間** （start period）は、コンテナーが起動するまでに必要となる初期化時間を設定します。
この時間内にヘルスチェックの失敗が発生したとしても、 **retries** 数の最大を越えたかどうかの判断は行われません。
ただしこの開始時間内にヘルスチェックが 1 つでも成功したら、コンテナーは起動済であるとみなされます。
そこで、それ以降にヘルスチェックが失敗したら、**retries** 数の最大を越えたかどうかがカウントされます。
@z

@x
There can only be one `HEALTHCHECK` instruction in a Dockerfile. If you list
more than one then only the last `HEALTHCHECK` will take effect.
@y
{% comment %}
There can only be one `HEALTHCHECK` instruction in a Dockerfile. If you list
more than one then only the last `HEALTHCHECK` will take effect.
{% endcomment %}
1 つの Dockerfile に記述できる `HEALTHCHECK` 命令はただ 1 つです。
複数の `HEALTHCHECK` を記述しても、最後の命令しか効果はありません。
@z

@x
The command after the `CMD` keyword can be either a shell command (e.g. `HEALTHCHECK
CMD /bin/check-running`) or an _exec_ array (as with other Dockerfile commands;
see e.g. `ENTRYPOINT` for details).
@y
{% comment %}
The command after the `CMD` keyword can be either a shell command (e.g. `HEALTHCHECK
CMD /bin/check-running`) or an _exec_ array (as with other Dockerfile commands;
see e.g. `ENTRYPOINT` for details).
{% endcomment %}
`CMD` キーワードの後ろにあるコマンドは、シェルコマンド（たとえば `HEALTHCHECK CMD /bin/check-running`）か、あるいは exec 形式の配列（他の Dockerfile コマンド、たとえば `ENTRYPOINT` にあるもの）のいずれかを指定します。
@z

@x
The command's exit status indicates the health status of the container.
The possible values are:
@y
{% comment %}
The command's exit status indicates the health status of the container.
The possible values are:
{% endcomment %}
そのコマンドの終了ステータスが、コンテナーのヘルスステータスを表わします。
返される値は以下となります。
@z

@x
- 0: success - the container is healthy and ready for use
- 1: unhealthy - the container is not working correctly
- 2: reserved - do not use this exit code
@y
{% comment %}
- 0: success - the container is healthy and ready for use
- 1: unhealthy - the container is not working correctly
- 2: reserved - do not use this exit code
{% endcomment %}
- 0: 成功（success） - コンテナーは健康であり、利用が可能です。
- 1: 不健康（unhealthy） - コンテナーは正常に動作していません。
- 2: 予約（reserved） - このコードを戻り値として利用してはなりません。
@z

@x
For example, to check every five minutes or so that a web-server is able to
serve the site's main page within three seconds:
@y
{% comment %}
For example, to check every five minutes or so that a web-server is able to
serve the site's main page within three seconds:
{% endcomment %}
たとえば 5 分間に 1 回のチェックとして、ウェブサーバーが 3 秒以内にサイトのメインページを提供できているかを確認するには、以下のようにします。
@z

@x
    HEALTHCHECK --interval=5m --timeout=3s \
      CMD curl -f http://localhost/ || exit 1
@y
    HEALTHCHECK --interval=5m --timeout=3s \
      CMD curl -f http://localhost/ || exit 1
@z

@x
To help debug failing probes, any output text (UTF-8 encoded) that the command writes
on stdout or stderr will be stored in the health status and can be queried with
`docker inspect`. Such output should be kept short (only the first 4096 bytes
are stored currently).
@y
{% comment %}
To help debug failing probes, any output text (UTF-8 encoded) that the command writes
on stdout or stderr will be stored in the health status and can be queried with
`docker inspect`. Such output should be kept short (only the first 4096 bytes
are stored currently).
{% endcomment %}
ヘルスチェックにが失敗しても、それをデバッグしやすくするために、そのコマンドが標準出力あるいは標準エラー出力へ書き込んだ文字列（UTF-8 エンコーディング）は、すべてヘルスステータス内に保存されます。
`docker inspect` を使えば、すべて確認することができます。
ただしその出力は切り詰められます（現時点においては最初の 4096 バイト分のみを出力します）。
@z

@x
When the health status of a container changes, a `health_status` event is
generated with the new status.
@y
{% comment %}
When the health status of a container changes, a `health_status` event is
generated with the new status.
{% endcomment %}
コンテナーのヘルスステータスが変更されると、`health_status` イベントが生成されて、新たなヘルスステータスになります。
@z

@x
The `HEALTHCHECK` feature was added in Docker 1.12.
@y
{% comment %}
The `HEALTHCHECK` feature was added in Docker 1.12.
{% endcomment %}
`HEALTHCHECK` による機能は Docker 1.12 において追加されました。
@z

@x
## SHELL
@y
## SHELL
@z

@x
    SHELL ["executable", "parameters"]
@y
    SHELL ["executable", "parameters"]
@z

@x
The `SHELL` instruction allows the default shell used for the *shell* form of
commands to be overridden. The default shell on Linux is `["/bin/sh", "-c"]`, and on
Windows is `["cmd", "/S", "/C"]`. The `SHELL` instruction *must* be written in JSON
form in a Dockerfile.
@y
{% comment %}
The `SHELL` instruction allows the default shell used for the *shell* form of
commands to be overridden. The default shell on Linux is `["/bin/sh", "-c"]`, and on
Windows is `["cmd", "/S", "/C"]`. The `SHELL` instruction *must* be written in JSON
form in a Dockerfile.
{% endcomment %}
`SHELL` 命令は、各種コマンドのシェル形式において用いられるデフォルトのシェルを、上書き設定するために利用します。
デフォルトのシェルは Linux 上では `["/bin/sh", "-c"]`、Windows 上では `["cmd", "/S", "/C"]` です。
`SHELL` 命令は Dockerfile 内において JSON 形式で記述しなければなりません。
@z

@x
The `SHELL` instruction is particularly useful on Windows where there are
two commonly used and quite different native shells: `cmd` and `powershell`, as
well as alternate shells available including `sh`.
@y
{% comment %}
The `SHELL` instruction is particularly useful on Windows where there are
two commonly used and quite different native shells: `cmd` and `powershell`, as
well as alternate shells available including `sh`.
{% endcomment %}
`SHELL` 命令は特に Windows 上において利用されます。
Windows には主に 2 つのネイティブなシェル、つまり `cmd` と `powershell` があり、両者はかなり異なります。
しかも `sh` のような、さらに別のシェルも利用することができます。
@z

@x
The `SHELL` instruction can appear multiple times. Each `SHELL` instruction overrides
all previous `SHELL` instructions, and affects all subsequent instructions. For example:
@y
{% comment %}
The `SHELL` instruction can appear multiple times. Each `SHELL` instruction overrides
all previous `SHELL` instructions, and affects all subsequent instructions. For example:
{% endcomment %}
`SHELL` 命令は、何度でも記述できます。
個々の `SHELL` 命令は、それより前の `SHELL` 命令の値を上書きし、それ以降の命令に効果を及ぼします。
たとえば以下のとおりです。
@z

@x
    FROM microsoft/windowsservercore

    # Executed as cmd /S /C echo default
    RUN echo default

    # Executed as cmd /S /C powershell -command Write-Host default
    RUN powershell -command Write-Host default

    # Executed as powershell -command Write-Host hello
    SHELL ["powershell", "-command"]
    RUN Write-Host hello

    # Executed as cmd /S /C echo hello
    SHELL ["cmd", "/S", "/C"]
    RUN echo hello
@y
   {% comment %}
    FROM microsoft/windowsservercore

    # Executed as cmd /S /C echo default
    RUN echo default

    # Executed as cmd /S /C powershell -command Write-Host default
    RUN powershell -command Write-Host default

    # Executed as powershell -command Write-Host hello
    SHELL ["powershell", "-command"]
    RUN Write-Host hello

    # Executed as cmd /S /C echo hello
    SHELL ["cmd", "/S", "/C"]
    RUN echo hello
   {% endcomment %}
    FROM microsoft/windowsservercore

    # 以下のように実行： cmd /S /C echo default
    RUN echo default

    # 以下のように実行： cmd /S /C powershell -command Write-Host default
    RUN powershell -command Write-Host default

    # 以下のように実行： powershell -command Write-Host hello
    SHELL ["powershell", "-command"]
    RUN Write-Host hello

    # 以下のように実行： cmd /S /C echo hello
    SHELL ["cmd", "/S", "/C"]
    RUN echo hello
@z

@x
The following instructions can be affected by the `SHELL` instruction when the
*shell* form of them is used in a Dockerfile: `RUN`, `CMD` and `ENTRYPOINT`.
@y
{% comment %}
The following instructions can be affected by the `SHELL` instruction when the
*shell* form of them is used in a Dockerfile: `RUN`, `CMD` and `ENTRYPOINT`.
{% endcomment %}
Dockerfile において `RUN`、`CMD`、`ENTRYPOINT` の各コマンドをシェル形式で記述した際には、`SHELL` 命令の設定による影響が及びます。
@z

@x
The following example is a common pattern found on Windows which can be
streamlined by using the `SHELL` instruction:
@y
{% comment %}
The following example is a common pattern found on Windows which can be
streamlined by using the `SHELL` instruction:
{% endcomment %}
以下に示す例は、Windows 上において見られる普通の実行パターンですが、`SHELL` 命令を使って簡単に実現することができます。
@z

@x
    ...
    RUN powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
    ...
@y
    ...
    RUN powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
    ...
@z

@x
The command invoked by docker will be:
@y
{% comment %}
The command invoked by docker will be:
{% endcomment %}
Docker によって実行されるコマンドは以下となります。
@z

@x
    cmd /S /C powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
@y
    cmd /S /C powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
@z

@x
This is inefficient for two reasons. First, there is an un-necessary cmd.exe command
processor (aka shell) being invoked. Second, each `RUN` instruction in the *shell*
form requires an extra `powershell -command` prefixing the command.
@y
{% comment %}
This is inefficient for two reasons. First, there is an un-necessary cmd.exe command
processor (aka shell) being invoked. Second, each `RUN` instruction in the *shell*
form requires an extra `powershell -command` prefixing the command.
{% endcomment %}
これは効率的ではなく、そこには 2 つの理由があります。
1 つめは、コマンドプロセッサー cmd.exe（つまりはシェル）が不要に呼び出されているからです。
2 つめは、シェル形式の `RUN` 命令において、常に `powershell -command` を各コマンドの頭につけて実行しなければならないからです。
@z

@x
To make this more efficient, one of two mechanisms can be employed. One is to
use the JSON form of the RUN command such as:
@y
{% comment %}
To make this more efficient, one of two mechanisms can be employed. One is to
use the JSON form of the RUN command such as:
{% endcomment %}
これを効率化するには、2 つあるメカニズムの 1 つを取り入れることです。
1 つは、RUN コマンドの JSON 形式を使って、以下のようにします。
@z

@x
    ...
    RUN ["powershell", "-command", "Execute-MyCmdlet", "-param1 \"c:\\foo.txt\""]
    ...
@y
    ...
    RUN ["powershell", "-command", "Execute-MyCmdlet", "-param1 \"c:\\foo.txt\""]
    ...
@z

@x
While the JSON form is unambiguous and does not use the un-necessary cmd.exe,
it does require more verbosity through double-quoting and escaping. The alternate
mechanism is to use the `SHELL` instruction and the *shell* form,
making a more natural syntax for Windows users, especially when combined with
the `escape` parser directive:
@y
{% comment %}
While the JSON form is unambiguous and does not use the un-necessary cmd.exe,
it does require more verbosity through double-quoting and escaping. The alternate
mechanism is to use the `SHELL` instruction and the *shell* form,
making a more natural syntax for Windows users, especially when combined with
the `escape` parser directive:
{% endcomment %}
JSON 形式を使えば、あいまいさはなくなり、不要な cmd.exe を使うこともなくなります。
しかしダブルクォートやエスケープを行うことも必要となり、より多くを記述することにもなります。
もう 1 つの方法は `SHELL` 命令とシェル形式を使って、Windows ユーザーにとって、より自然な文法で実現するやり方です。
特にパーサーディレクティブ `escape` を組み合わせて実現します。
@z

@x
    # escape=`

    FROM microsoft/nanoserver
    SHELL ["powershell","-command"]
    RUN New-Item -ItemType Directory C:\Example
    ADD Execute-MyCmdlet.ps1 c:\example\
    RUN c:\example\Execute-MyCmdlet -sample 'hello world'
@y
    # escape=`

    FROM microsoft/nanoserver
    SHELL ["powershell","-command"]
    RUN New-Item -ItemType Directory C:\Example
    ADD Execute-MyCmdlet.ps1 c:\example\
    RUN c:\example\Execute-MyCmdlet -sample 'hello world'
@z

@x
Resulting in:
@y
{% comment %}
Resulting in:
{% endcomment %}
これは以下のようになります。
@z

@x
    PS E:\docker\build\shell> docker build -t shell .
    Sending build context to Docker daemon 4.096 kB
    Step 1/5 : FROM microsoft/nanoserver
     ---> 22738ff49c6d
    Step 2/5 : SHELL powershell -command
     ---> Running in 6fcdb6855ae2
     ---> 6331462d4300
    Removing intermediate container 6fcdb6855ae2
    Step 3/5 : RUN New-Item -ItemType Directory C:\Example
     ---> Running in d0eef8386e97
@y
    PS E:\docker\build\shell> docker build -t shell .
    Sending build context to Docker daemon 4.096 kB
    Step 1/5 : FROM microsoft/nanoserver
     ---> 22738ff49c6d
    Step 2/5 : SHELL powershell -command
     ---> Running in 6fcdb6855ae2
     ---> 6331462d4300
    Removing intermediate container 6fcdb6855ae2
    Step 3/5 : RUN New-Item -ItemType Directory C:\Example
     ---> Running in d0eef8386e97
@z

@x
        Directory: C:\
@y
        Directory: C:\
@z

@x
    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    d-----       10/28/2016  11:26 AM                Example
@y
    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    d-----       10/28/2016  11:26 AM                Example
@z

@x
     ---> 3f2fbf1395d9
    Removing intermediate container d0eef8386e97
    Step 4/5 : ADD Execute-MyCmdlet.ps1 c:\example\
     ---> a955b2621c31
    Removing intermediate container b825593d39fc
    Step 5/5 : RUN c:\example\Execute-MyCmdlet 'hello world'
     ---> Running in be6d8e63fe75
    hello world
     ---> 8e559e9bf424
    Removing intermediate container be6d8e63fe75
    Successfully built 8e559e9bf424
    PS E:\docker\build\shell>
@y
     ---> 3f2fbf1395d9
    Removing intermediate container d0eef8386e97
    Step 4/5 : ADD Execute-MyCmdlet.ps1 c:\example\
     ---> a955b2621c31
    Removing intermediate container b825593d39fc
    Step 5/5 : RUN c:\example\Execute-MyCmdlet 'hello world'
     ---> Running in be6d8e63fe75
    hello world
     ---> 8e559e9bf424
    Removing intermediate container be6d8e63fe75
    Successfully built 8e559e9bf424
    PS E:\docker\build\shell>
@z

@x
The `SHELL` instruction could also be used to modify the way in which
a shell operates. For example, using `SHELL cmd /S /C /V:ON|OFF` on Windows, delayed
environment variable expansion semantics could be modified.
@y
{% comment %}
The `SHELL` instruction could also be used to modify the way in which
a shell operates. For example, using `SHELL cmd /S /C /V:ON|OFF` on Windows, delayed
environment variable expansion semantics could be modified.
{% endcomment %}
`SHELL` 命令はまた、シェルの動作を変更する際にも利用することができます。
たとえば Windows 上において `SHELL cmd /S /C /V:ON|OFF` を実行すると、遅延環境変数の展開方法を変更することができます。
@z

@x
The `SHELL` instruction can also be used on Linux should an alternate shell be
required such as `zsh`, `csh`, `tcsh` and others.
@y
{% comment %}
The `SHELL` instruction can also be used on Linux should an alternate shell be
required such as `zsh`, `csh`, `tcsh` and others.
{% endcomment %}
`SHELL` 命令は Linux において、`zsh`、`csh`、`tcsh` などのシェルが必要となる場合にも利用することができます。
@z

@x
The `SHELL` feature was added in Docker 1.12.
@y
{% comment %}
The `SHELL` feature was added in Docker 1.12.
{% endcomment %}
`SHELL` による機能は Docker 1.12 において追加されました。
@z

@x
## External implementation features
@y
{% comment %}
## External implementation features
{% endcomment %}
## 外部実装機能
{: #external-implementation-features }
@z

@x
This feature is only available when using the  [BuildKit](#buildkit) backend.
@y
{% comment %}
This feature is only available when using the  [BuildKit](#buildkit) backend.
{% endcomment %}
この機能は [BuildKit](#buildkit) バックエンドを用いている場合にのみ利用可能です。
@z

@x
Docker build supports experimental features like cache mounts, build secrets and
ssh forwarding that are enabled by using an external implementation of the 
builder with a syntax directive. To learn about these features, [refer to the documentation in BuildKit repository](https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md).
@y
{% comment %}
Docker build supports experimental features like cache mounts, build secrets and
ssh forwarding that are enabled by using an external implementation of the 
builder with a syntax directive. To learn about these features, [refer to the documentation in BuildKit repository](https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md).
{% endcomment %}
Docker によるビルド処理においては、実験的な機能として、キャッシュマウント、ビルドシークレット、ssh フォワーディングなどをサポートしており、これらは文法ディレクティブを利用した外部実装機能を通じて実現しています。
この機能に関する詳細は、[BuildKit リポジトリ内のドキュメント](https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md)を参照してください。
@z

@x
## Dockerfile examples
@y
{% comment %}
## Dockerfile examples
{% endcomment %}
## Dockerfile 記述例
{: #dockerfile-examples }
@z

@x
Below you can see some examples of Dockerfile syntax.
@y
{% comment %}
Below you can see some examples of Dockerfile syntax.
{% endcomment %}
以下では Dockerfile の文法例をいくつか示します。
@z

@x
```
# Nginx
#
# VERSION               0.0.1

FROM      ubuntu
LABEL Description="This image is used to start the foobar executable" Vendor="ACME Products" Version="1.0"
RUN apt-get update && apt-get install -y inotify-tools nginx apache2 openssh-server
```
@y
```
# Nginx
#
# VERSION               0.0.1

FROM      ubuntu
LABEL Description="This image is used to start the foobar executable" Vendor="ACME Products" Version="1.0"
RUN apt-get update && apt-get install -y inotify-tools nginx apache2 openssh-server
```
@z

@x
```
# Firefox over VNC
#
# VERSION               0.3

FROM ubuntu

# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN apt-get update && apt-get install -y x11vnc xvfb firefox
RUN mkdir ~/.vnc
# Setup a password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way, but it does the trick)
RUN bash -c 'echo "firefox" >> /.bashrc'

EXPOSE 5900
CMD    ["x11vnc", "-forever", "-usepw", "-create"]
```
@y
```
# Firefox over VNC
#
# VERSION               0.3

FROM ubuntu

# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN apt-get update && apt-get install -y x11vnc xvfb firefox
RUN mkdir ~/.vnc
# Setup a password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way, but it does the trick)
RUN bash -c 'echo "firefox" >> /.bashrc'

EXPOSE 5900
CMD    ["x11vnc", "-forever", "-usepw", "-create"]
```
@z

@x
```
# Multiple images example
#
# VERSION               0.1
@y
```
# Multiple images example
#
# VERSION               0.1
@z

@x
FROM ubuntu
RUN echo foo > bar
# Will output something like ===> 907ad6c2736f
@y
FROM ubuntu
RUN echo foo > bar
# Will output something like ===> 907ad6c2736f
@z

@x
FROM ubuntu
RUN echo moo > oink
# Will output something like ===> 695d7793cbe4
@y
FROM ubuntu
RUN echo moo > oink
# Will output something like ===> 695d7793cbe4
@z

@x
# You'll now have two images, 907ad6c2736f with /bar, and 695d7793cbe4 with
# /oink.
```
@y
# You'll now have two images, 907ad6c2736f with /bar, and 695d7793cbe4 with
# /oink.
```
@z
