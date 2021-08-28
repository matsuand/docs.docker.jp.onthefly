%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
A Dockerfile is a text document that contains the instructions to assemble a
Docker image. When we tell Docker to build our image by executing the `docker build`
command, Docker reads these instructions, executes them, and creates a Docker
image as a result.
@y
Dockerfile とは、 Docker イメージを取得する命令を含んだテキストファイルのことです。
Docker に対して`docker build`コマンドを実行してイメージビルドを指示すると、Docker は記述された命令を読み込んで実行し、最終的に Docker イメージを作り出します。
@z

@x
Let’s walk through the process of creating a Dockerfile for our application. In
the root of your project, create a file named `Dockerfile` and open this file in
your text editor.
@y
ではアプリケーション向けに Dockerfile を生成していく手順を見ていきます。
プロジェクトのルートディレクトリに`Dockerfile`という名前のファイルを生成して、テキストエディターでこれを開きます。
@z

@x
> **What to name your Dockerfile?**
>
> The default filename to use for a Dockerfile is `Dockerfile` (without a file-
> extension). Using the default name allows you to run the `docker build` command
> without having to specify additional command flags.
>
> Some projects may need distinct Dockerfiles for specific purposes. A common
> convention is to name these `Dockerfile.<something>` or `<something>.Dockerfile`.
> Such Dockerfiles can then be used through the `--file` (or `-f` shorthand)
> option on the `docker build` command. Refer to the
> ["Specify a Dockerfile" section](/engine/reference/commandline/build/#specify-a-dockerfile--f)
> in the `docker build` reference to learn about the `--file` option.
>
> We recommend using the default (`Dockerfile`) for your project's primary
> Dockerfile, which is what we'll use for most examples in this guide.
@y
> **Dockerfile の名前を何にするか**
>
> Dockerfile に対して用いられるデフォルトのファイル名は、 `Dockerfile` です (ファイル拡張子はありません)。
> このデフォルトファイル名を用いておけば、`docker build`コマンドを実行する際に、コマンドラインフラグを追加して指定する必要がありません。
>
> プロジェクトによっては、特定の目的のため、Dockerfile に別名を与える場合があります。
> 普通行われる慣例としては、`Dockerfile.<something>`や`<something>.Dockerfile`とします。
> このような Dockerfile は、`docker build`コマンドの実行にあたって、`--file`オプション (その短縮形`-f`) を用いて指定します。
> `--file`オプションの利用方法については、`docker build`リファレンス内の [Dockerfile の指定]({{ site.baseurl }}/engine/reference/commandline/build/#specify-a-dockerfile--f) のセクションを参照してください。
>
> プロジェクトの主となる Dockerfile には、デフォルト名 (`Dockerfile`) を用いることをお勧めします。
> 本ガイドに示すほとんどの例においては、この名前を用いています。
@z

@x
The first line to add to a Dockerfile is a [`# syntax` parser directive](/engine/reference/builder/#syntax).
While _optional_, this directive instructs the Docker builder what syntax to use
when parsing the Dockerfile, and allows older Docker versions with BuildKit enabled
to upgrade the parser before starting the build. [Parser directives](/engine/reference/builder/#parser-directives)
must appear before any other comment, whitespace, or Dockerfile instruction in
your Dockerfile, and should be the first line in Dockerfiles.
@y
Docker ファイルの 1 行めに書くのは [`# syntax`パーサーディレクティブ]({{ site.baseurl }}/engine/reference/builder/#syntax) です。
これは **任意の記述** ではありますが、Dockerfile の解析にあたって Docker ビルダーがどの文法を採用するのかを指示します。
また古い Docker バージョンにおいて BuildKit を利用する際に、ビルド前にパーサーをアップグレードするようになります。
[パーサーディレクティブ]({{ site.baseurl }}/engine/reference/builder/#parser-directives) は Dockerfile において、いずれのコメント、空行、Dockerfile 命令よりも前に、つまり第一に記述することが必要です。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
```
@y
```dockerfile
# syntax=docker/dockerfile:1
```
@z

@x
We recommend using `docker/dockerfile:1`, which always points to the latest release
of the version 1 syntax. BuildKit automatically checks for updates of the syntax
before building, making sure you are using the most current version.
@y
`docker/dockerfile:1`を用いることをお勧めします。
こうしておくと、常に文法バージョン 1 の最新リリース版を指し示すことになります。
BuildKit は、ビルド処理の前に文法に更新がないかを自動的にチェックし、最新バージョンが用いられていることを確認します。
@z
