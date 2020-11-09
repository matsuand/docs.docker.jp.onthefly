%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Automated builds
keywords: automated, build, images
title: Advanced options for Autobuild and Autotest
redirect_from:
- /docker-cloud/builds/advanced/
---
@y
---
description: 自動ビルド。
keywords: automated, build, images
title: 自動ビルドおよび自動テストにおける高度なオプション
redirect_from:
- /docker-cloud/builds/advanced/
---
@z

@x
The following options allow you to customize your automated build and automated test processes.
@y
{% comment %}
The following options allow you to customize your automated build and automated test processes.{% endcomment %}
以降に示すオプションを利用することで、自動ビルドや自動テストの処理をカスタマイズすることができます。
@z

@x
## Environment variables for building and testing
@y
{% comment %}
## Environment variables for building and testing
{% endcomment %}
{: #environment-variables-for-building-and-testing }
## ビルド時およびテスト時の環境変数
@z

@x
Several utility environment variables are set by the build process, and are
available during automated builds, automated tests, and while executing
hooks.
@y
{% comment %}
Several utility environment variables are set by the build process, and are
available during automated builds, automated tests, and while executing
hooks.
{% endcomment %}
ビルド処理においては、いくつか便利な環境変数が設定されます。
これらは自動ビルド、自動テスト、フック処理時に利用することができます。
@z

@x
> **Note**: These environment variables are only available to the build and test
processes and do not affect your service's run environment.
@y
{% comment %}
> **Note**: These environment variables are only available to the build and test
processes and do not affect your service's run environment.
{% endcomment %}
> **メモ**: このような環境変数はビルド処理やテスト処理においてのみ利用されるものであって、サービス稼動環境に対して影響を与えることはありません。
@z

@x
* `SOURCE_BRANCH`: the name of the branch or the tag that is currently being tested.
* `SOURCE_COMMIT`: the SHA1 hash of the commit being tested.
* `COMMIT_MSG`: the message from the commit being tested and built.
* `DOCKER_REPO`: the name of the Docker repository being built.
* `DOCKERFILE_PATH`: the dockerfile currently being built.
* `DOCKER_TAG`: the Docker repository tag being built.
* `IMAGE_NAME`: the name and tag of the Docker repository being built. (This variable is a combination of `DOCKER_REPO`:`DOCKER_TAG`.)
@y
{% comment %}
* `SOURCE_BRANCH`: the name of the branch or the tag that is currently being tested.
* `SOURCE_COMMIT`: the SHA1 hash of the commit being tested.
* `COMMIT_MSG`: the message from the commit being tested and built.
* `DOCKER_REPO`: the name of the Docker repository being built.
* `DOCKERFILE_PATH`: the dockerfile currently being built.
* `DOCKER_TAG`: the Docker repository tag being built.
* `IMAGE_NAME`: the name and tag of the Docker repository being built. (This variable is a combination of `DOCKER_REPO`:`DOCKER_TAG`.)
{% endcomment %}
* `SOURCE_BRANCH`: テスト対象となっているブランチ名またはタグ名。
* `SOURCE_COMMIT`: テスト対象となっているコミットの SHA1 ハッシュ値。
* `COMMIT_MSG`: テストやビルド対象となっているコミットからのコミットメッセージ。
* `DOCKER_REPO`: ビルドされている Docker リポジトリ名。
* `DOCKERFILE_PATH`: 現在ビルドされている Dockerfile。
* `DOCKER_TAG`: ビルドされている Docker リポジトリのタグ。
* `IMAGE_NAME`: ビルドされている Docker リポジトリの名前とタグ。（この変数は`DOCKER_REPO`:`DOCKER_TAG`の組み合わせからなる。）
@z

@x
If you are using these build environment variables in a
`docker-compose.test.yml` file for automated testing, declare them in your `sut`
service's environment as shown below.
@y
{% comment %}
If you are using these build environment variables in a
`docker-compose.test.yml` file for automated testing, declare them in your `sut`
service's environment as shown below.
{% endcomment %}
自動テストにあたって`docker-compose.test.yml`ファイルにこれらの環境変数を利用する場合、以下に示すようにその宣言を`sut`サービス環境内で行います。
@z

@x
```none
sut:
  build: .
  command: run_tests.sh
  environment:
    - SOURCE_BRANCH
```
@y
```none
sut:
  build: .
  command: run_tests.sh
  environment:
    - SOURCE_BRANCH
```
@z

@x
## Override build, test or push commands
@y
{% comment %}
## Override build, test or push commands
{% endcomment %}
{: #override-build-test-or-push-commands }
## ビルド、テスト、プッシュでの各コマンドのオーバーライド
@z

@x
Docker Hub allows you to override and customize the `build`, `test` and `push`
commands during automated build and test processes using hooks. For example, you
might use a build hook to set build arguments used only during the build
process. (You can also set up [custom build phase hooks](#custom-build-phase-hooks) to perform actions in between these commands.)
@y
{% comment %}
Docker Hub allows you to override and customize the `build`, `test` and `push`
commands during automated build and test processes using hooks. For example, you
might use a build hook to set build arguments used only during the build
process. (You can also set up [custom build phase hooks](#custom-build-phase-hooks) to perform actions in between these commands.)
{% endcomment %}
Docker Hub では自動ビルドや自動テストの処理過程において、フックを利用することによって`build`、`test`、`push`の各コマンドをオーバーライドしてカスタマイズすることができます。
たとえばビルド処理においてのみ適用するビルド引数がある場合に、ビルドフックを利用できます。
（[ビルド時のカスタムフック](#custom-build-phase-hooks) を設定することで、これらのコマンド間でのアクションを実行することもできます。）
@z

@x
**Use these hooks with caution.** The contents of these hook files replace the
basic `docker` commands, so you must include a similar build, test or push
command in the hook or your automated process does not complete.
@y
{% comment %}
**Use these hooks with caution.** The contents of these hook files replace the
basic `docker` commands, so you must include a similar build, test or push
command in the hook or your automated process does not complete.
{% endcomment %}
**フック利用時の注意** このようなフックファイルの内容は、基本となる`docker`コマンドの内容を書き換えます。
したがってフック内には、同じようなビルド、テスト、プッシュの各コマンドを用意しなければなりません。
そうしないと自動処理が成功しません。
@z

@x
To override these phases, create a folder called `hooks` in your source code
repository at the same directory level as your Dockerfile. Create a file called
`hooks/build`, `hooks/test`, or `hooks/push` and include commands that the
builder process can execute, such as `docker` and `bash` commands (prefixed appropriately with `#!/bin/bash`).
@y
{% comment %}
To override these phases, create a folder called `hooks` in your source code
repository at the same directory level as your Dockerfile. Create a file called
`hooks/build`, `hooks/test`, or `hooks/push` and include commands that the
builder process can execute, such as `docker` and `bash` commands (prefixed appropriately with `#!/bin/bash`).
{% endcomment %}
この処理工程に対するオーバーライドは、ソースコードリポジトリ内に`hooks`というフォルダーを生成することで実現します。
このフォルダーは Dockerfile と同じレベルのディレクトリ配下に生成します。
`hooks/build`、`hooks/test`、`hooks/push`というファイルを生成して、ビルド処理が実行可能なコマンド、たとえば`docker`や`bash`コマンド（適切に`#!/bin/bash`が宣言されたもの）などを記述します。
@z

@x
## Custom build phase hooks
@y
{% comment %}
## Custom build phase hooks
{% endcomment %}
{: #custom-build-phase-hooks }
## ビルド時のカスタムフック
@z

@x
You can run custom commands between phases of the build process by creating
hooks. Hooks allow you to provide extra instructions to the autobuild and
autotest processes.
@y
{% comment %}
You can run custom commands between phases of the build process by creating
hooks. Hooks allow you to provide extra instructions to the autobuild and
autotest processes.
{% endcomment %}
フックを生成して利用することで、ビルド処理工程の合間にカスタムコマンドを実行することができます。
フックを利用して、自動ビルドや自動テストの処理に対して、追加の指示を行うことができます。
@z

@x
Create a folder called `hooks` in your source code repository at the same
directory level as your Dockerfile. Place files that define the hooks in that
folder. Hook files can include both `docker` commands, and `bash` commands as long as they are prefixed appropriately with `#!/bin/bash`. The builder executes the commands in the files before and after each step.
@y
{% comment %}
Create a folder called `hooks` in your source code repository at the same
directory level as your Dockerfile. Place files that define the hooks in that
folder. Hook files can include both `docker` commands, and `bash` commands as long as they are prefixed appropriately with `#!/bin/bash`. The builder executes the commands in the files before and after each step.
{% endcomment %}
ソースコードリポジトリ内の Dockerfile と同レベルのディレクトリ内に`hooks`というフォルダーを生成します。
フックを定義するファイルをそのディレクトリに置きます。
フックファイルには`docker`コマンドか`bash`コマンドを含めることができます。
`bash`コマンドにおいては適切に`#!/bin/bash`を宣言しておく必要があります。
ビルド処理においては各処理工程の前後に、このファイル内のコマンドを実行します。
@z

@x
The following hooks are available:
@y
{% comment %}
The following hooks are available:
{% endcomment %}
以下のフックが利用可能です。
@z

@x
* `hooks/post_checkout`
* `hooks/pre_build`
* `hooks/post_build`
* `hooks/pre_test`
* `hooks/post_test`
* `hooks/pre_push` (only used when executing a build rule or [automated build](index.md) )
* `hooks/post_push` (only used when executing a build rule or [automated build](index.md) )
@y
{% comment %}
* `hooks/post_checkout`
* `hooks/pre_build`
* `hooks/post_build`
* `hooks/pre_test`
* `hooks/post_test`
* `hooks/pre_push` (only used when executing a build rule or [automated build](index.md) )
* `hooks/post_push` (only used when executing a build rule or [automated build](index.md) )
{% endcomment %}
* `hooks/post_checkout`
* `hooks/pre_build`
* `hooks/post_build`
* `hooks/pre_test`
* `hooks/post_test`
* `hooks/pre_push` （ビルドルールまたは [自動ビルド](index.md) の実行時にのみ用いられます。）
* `hooks/post_push` （ビルドルールまたは [自動ビルド](index.md) の実行時にのみ用いられます。）
@z

@x
### Build hook examples
@y
{% comment %}
### Build hook examples
{% endcomment %}
{: #build-hook-examples }
### ビルドフックの例
@z

@x
#### Override the "build" phase to set variables
@y
{% comment %}
#### Override the "build" phase to set variables
{% endcomment %}
{: #override-the-build-phase-to-set-variables }
#### ビルド処理時の変数のオーバーライド
@z

@x
Docker Hub allows you to define build environment variables either in the hook files, or from the automated build interface (which you can then reference in hooks).
@y
{% comment %}
Docker Hub allows you to define build environment variables either in the hook files, or from the automated build interface (which you can then reference in hooks).
{% endcomment %}
Docker Hub ではビルド環境変数の定義をフックファイル内で行うことができます。
あるいは自動ビルドの設定画面にて行うこともできます（その後にフック内から参照します）。
@z

@x
In the following example, we define a build hook that uses `docker build` arguments to set the variable `CUSTOM` based on the value of variable we defined using the Docker Hub build settings. `$DOCKERFILE_PATH` is a variable that we provide with the name of the Dockerfile we wish to build, and `$IMAGE_NAME` is the name of the image being built.
@y
{% comment %}
In the following example, we define a build hook that uses `docker build` arguments to set the variable `CUSTOM` based on the value of variable we defined using the Docker Hub build settings. `$DOCKERFILE_PATH` is a variable that we provide with the name of the Dockerfile we wish to build, and `$IMAGE_NAME` is the name of the image being built.
{% endcomment %}
以下に示す利用例ではビルドフックを定義し、そこでは`docker build`の引数として`CUSTOM`という変数を設定します。
その値は Docker Hub ビルド設定画面を通じて定義した変数値を用います。
また`$DOCKERFILE_PATH`という変数は、ビルド対象とする Dockerfile 名を定めるものです。
そして`$IMAGE_NAME`はビルドするイメージ名です。
@z

@x
```none
docker build --build-arg CUSTOM=$VAR -f $DOCKERFILE_PATH -t $IMAGE_NAME .
```
@y
```none
docker build --build-arg CUSTOM=$VAR -f $DOCKERFILE_PATH -t $IMAGE_NAME .
```
@z

@x
> **Caution**: A `hooks/build` file overrides the basic [docker build](/engine/reference/commandline/build/) command
used by the builder, so you must include a similar build command in the hook or
the automated build fails.
@y
{% comment %}
> **Caution**: A `hooks/build` file overrides the basic [docker build](/engine/reference/commandline/build/) command
used by the builder, so you must include a similar build command in the hook or
the automated build fails.
{% endcomment %}
> **注意**: `hooks/build`ファイルは、ビルド処理において用いられる基本的な [docker build](/engine/reference/commandline/build/) コマンドをオーバーライドします。
したがってフック内には同じようなビルドコマンドを用いなければなりません。
そうしないと自動ビルドは失敗します。
@z

@x
To learn more about Docker build-time variables, see the [docker build documentation](/engine/reference/commandline/build/#set-build-time-variables-build-arg).
@y
{% comment %}
To learn more about Docker build-time variables, see the [docker build documentation](/engine/reference/commandline/build/#set-build-time-variables-build-arg).
{% endcomment %}
Docker のビルド時における変数についての詳細は [docker build のドキュメント](/engine/reference/commandline/build/#set-build-time-variables-build-arg) を参照してください。
@z

@x
#### Two-phase build
@y
{% comment %}
#### Two-phase build
{% endcomment %}
{: #two-phase-build }
#### 二段階ビルド
@z

@x
If your build process requires a component that is not a dependency for your application, you can use a pre-build hook (refers to the `hooks/pre_build` file) to collect and compile required components. In the example below, the hook uses a Docker container to compile a Golang binary that is required before the build.
@y
{% comment %}
If your build process requires a component that is not a dependency for your application, you can use a pre-build hook (refers to the `hooks/pre_build` file) to collect and compile required components. In the example below, the hook uses a Docker container to compile a Golang binary that is required before the build.
{% endcomment %}
ビルド処理に必要となるコンポーネントが、アプリケーションの依存パッケージには含まれていない場合、プレビルドフック（`hooks/pre_build`ファイルにより実現）を用いて、必要なコンポーネントの取得とコンパイルを行うことができます。
以下に示す例では、フック内から Docker コンテナーを利用して、ビルド前に必要となる golang バイナリーをコンパイルするものです。
@z

@x
```bash
#!/bin/bash
echo "=> Building the binary"
docker run --privileged \
  -v $(pwd):/src \
  -v /var/run/docker.sock:/var/run/docker.sock \
  centurylink/golang-builder
```
@y
```bash
#!/bin/bash
echo "=> Building the binary"
docker run --privileged \
  -v $(pwd):/src \
  -v /var/run/docker.sock:/var/run/docker.sock \
  centurylink/golang-builder
```
@z

@x
#### Push to multiple repos
@y
{% comment %}
#### Push to multiple repos
{% endcomment %}
{: #push-to-multiple-repos }
#### 複数リポジトリへのプッシュ
@z

@x
By default the build process pushes the image only to the repository where the build settings are configured. If you need to push the same image to multiple repositories, you can set up a `post_push` hook to add additional tags and push to more repositories.
@y
{% comment %}
By default the build process pushes the image only to the repository where the build settings are configured. If you need to push the same image to multiple repositories, you can set up a `post_push` hook to add additional tags and push to more repositories.
{% endcomment %}
ビルド処理においてプッシュされるイメージは、デフォルトではビルド設定において定めているリポジトリに対してのみ行われます。
同じイメージを別の複数リポジトリにプッシュする必要がある場合は、`post_push`フックを用いてタグを追加し複数リポジトリへプッシュすることができます。
@z

@x
```none
docker tag $IMAGE_NAME $DOCKER_REPO:$SOURCE_COMMIT
docker push $DOCKER_REPO:$SOURCE_COMMIT
```
@y
```none
docker tag $IMAGE_NAME $DOCKER_REPO:$SOURCE_COMMIT
docker push $DOCKER_REPO:$SOURCE_COMMIT
```
@z

@x
## Source Repository / Branch Clones
@y
{% comment %}
## Source Repository / Branch Clones
{% endcomment %}
{: #source-repository--branch-clones }
## ソースリポジトリ / ブランチのクローン
@z

@x
When Docker Hub pulls a branch from a source code repository, it performs
a shallow clone (only the tip of the specified branch).  This has the advantage
of minimizing the amount of data transfer necessary from the repository and
speeding up the build because it pulls only the minimal code necessary.
@y
{% comment %}
When Docker Hub pulls a branch from a source code repository, it performs
a shallow clone (only the tip of the specified branch).  This has the advantage
of minimizing the amount of data transfer necessary from the repository and
speeding up the build because it pulls only the minimal code necessary.
{% endcomment %}
Docker Hub がソースコードリポジトリからブランチをプルする際には、shallow クローン（指定ブランチの最新履歴のみのクローン）を行います。
これはリポジトリから取得する必要データ量を最小にする利点があり、必要最小限のコードがプルされていることからビルド時間の向上にも役立ちます。
@z

@x
Because of this, if you need to perform a custom action that relies on a different
branch (such as a `post_push` hook), you can't checkout that branch, unless
you do one of the following:
@y
{% comment %}
Because of this, if you need to perform a custom action that relies on a different
branch (such as a `post_push` hook), you can't checkout that branch, unless
you do one of the following:
{% endcomment %}
ただしこのことがあるので、別のブランチに基づいたカスタムアクション（たとえば`post_push`フック）を行う必要がある場合には、そのブランチをチェックアウトするために以下のいずれかを行わなければなりません。
@z

@x
* You can get a shallow checkout of the target branch by doing the following:
@y
{% comment %}
* You can get a shallow checkout of the target branch by doing the following:
{% endcomment %}
* 以下のようにして対象とするブランチの shallow チェックアウトを行います。
@z

@x
		git fetch origin branch:mytargetbranch --depth 1
@y
		git fetch origin branch:mytargetbranch --depth 1
@z

@x
* You can also "unshallow" the clone, which fetches the whole Git history (and potentially
takes a long time / moves a lot of data) by using the `--unshallow` flag on the fetch:
@y
{% comment %}
* You can also "unshallow" the clone, which fetches the whole Git history (and potentially
takes a long time / moves a lot of data) by using the `--unshallow` flag on the fetch:
{% endcomment %}
* 「shallowではない」クローンを行うこともできます。
  その場合には Git の全履歴を取得することになります（おそらく取得に時間を要し、多大なデータを取得することになります）。
  取得するには`--unshallow`フラグを利用します。
@z

@x
		git fetch --unshallow origin
@y
		git fetch --unshallow origin
@z
