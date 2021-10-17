%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Automated tests
keywords: Automated, testing, repository
redirect_from:
- /docker-cloud/feature-reference/automated-testing/
- /docker-cloud/builds/automated-testing/
title: Automated repository tests
---
@y
---
description: 自動テスト。
keywords: Automated, testing, repository
redirect_from:
- /docker-cloud/feature-reference/automated-testing/
- /docker-cloud/builds/automated-testing/
title: リポジトリの自動テスト
---
@z

@x
Docker Hub can automatically test changes to your source code repositories
using containers. You can enable `Autotest` on [any Docker Hub repository](/docker-hub/repos) to run tests on each pull request to the source code
repository to create a continuous integration testing service.
@y
Docker Hub ではコンテナーを利用して、ソースコードリポジトリへの変更を自動的にテストすることができます。
どのような [Docker Hub リポジトリ](/docker-hub/repos) でも`Autotest`を有効にすれば、ソースコードリポジトリに対するプルリクエストごとのテスト実行が可能です。
これによって継続的な統合テストサービスを実現することができます。
@z

@x
Enabling `Autotest` builds an image for testing purposes, but does **not**
automatically push the built image to the Docker repository. If you want to push
built images to your Docker Hub repository, enable [Automated Builds](index.md).
@y
`Autotest`（自動テスト）を有効にしてビルドされるイメージは、テスト目的のものです。
ただしこれは Docker リポジトリに対して、ビルドしたイメージを自動的にはプッシュ **しません**。
Docker Hub リポジトリにビルドイメージをプッシュしたい場合は [自動ビルド](index.md) を有効にします。
@z

@x
## Set up automated test files
@y
{: #set-up-automated-test-files }
## 自動テストファイルの設定
@z

@x
To set up your automated tests, create a `docker-compose.test.yml` file which
defines a `sut` service that lists the tests to be run.
The `docker-compose.test.yml` file should be located in the same directory that
contains the Dockerfile used to build the image.
@y
自動テストを設定するには、`docker-compose.test.yml`を生成し、実行するテストを定める`sut`サービスをそこで定義します。
`docker-compose.test.yml`ファイルは、イメージのビルドに用いる Dockerfile と同一のディレクトリに配置しておく必要があります。
@z

@x
For example:
@y
たとえば以下のとおりです。
@z

@x
```none
services:
  sut:
    build: .
    command: run_tests.sh
```
@y
```none
services:
  sut:
    build: .
    command: run_tests.sh
```
@z

@x
The example above builds the repository, and runs the `run_tests.sh` file inside
a container using the built image.
@y
上の例ではリポジトリをビルドし、ビルドイメージを用いてコンテナー内部で`run_tests.sh`を実行します。
@z

@x
You can define any number of linked services in this file. The only requirement
is that `sut` is defined. Its return code determines if tests passed or not.
Tests **pass** if the `sut` service returns `0`, and **fail** otherwise.
@y
このファイルにはリンクするサービスをいくつでも定義することができます。
必要になることは`sut`を定義しておくことだけです。
そのサービスの戻り値からテストが成功したかどうかがわかります。
`sut`サービスが`0`を返すとテストは成功、そうでなければ **失敗** を表わします。
@z

@x
> **Note**: Only the `sut` service and all other services listed in [`depends_on`](https://docs.docker.com/compose/compose-file/compose-file-v2/#depends_on) are started. For instance, if you have services that poll for changes in other services, be sure to include the polling services in the [`depends_on`](https://docs.docker.com/compose/compose-file/compose-file-v2/#depends_on) list to make sure all of your services start.
Also make sure to include a compose file version from 2.0 upward as `depends_on` was added in [version 2.0](https://docs.docker.com/compose/compose-file/compose-versioning/#version-2) file format.
@y
> **メモ**  起動されるサービスは`sut`サービスと、[`depends_on`]({{ site.baseurl }}/compose/compose-file/compose-file-v2/#depends_on) のもとに定義されたサービスだけです。
> たとえば何かのサービス内での変更をポーリングするサービスがある場合、そのポーリングサービスを [`depends_on`]({{ site.baseurl }}/compose/compose-file/compose-file-v2/#depends_on) のリスト内に定義して、サービスがすべて起動されるようにします。
> なお`depends_on`は、compose ファイル [バージョン 2.0]({{ site.baseurl }}/compose/compose-file/compose-versioning/#version-2) において追加されています。
> したがってファイルバージョンは 2.0 以降とするようにしてください。
@z

@x
You can define more than one `docker-compose.test.yml` file if needed. Any file
that ends in `.test.yml` is used for testing, and the tests run sequentially.
You can also use [custom build hooks](advanced.md#override-build-test-or-push-commands)
to further customize your test behavior.
@y
必要に応じて`docker-compose.test.yml`ファイルはいくつでも定義できます。
`.test.yml`で終わるファイルはすべてテストに用いられ、そのテストは順に実行されます。
また [カスタムビルドフック](advanced.md#override-build-test-or-push-commands) を用いることで、テスト動作をさらにカスタマイズすることができます。
@z

@x
> **Note**: If you enable Automated builds, they also run any tests defined
in the `test.yml` files.
@y
> **メモ**: 自動ビルドを有効にしている場合、`test.yml`ファイルに定義したテストもすべて実行されます。
@z

@x
## Enable automated tests on a repository
@y
{: #enable-automated-tests-on-a-repository }
## リポジトリ上での自動テストの有効化
@z

@x
To enable testing on a source code repository, you must first create an
associated build-repository in Docker Hub.  Your `Autotest` settings are
configured on the same page as [automated builds](index.md), however
you do not need to enable Autobuilds to use `Autotest`. Autobuild is enabled per
branch or tag, and you do not need to enable it at all.
@y
ソースコードリポジトリ上においてテストを有効にするには、まず Docker Hub 内に関連づけるビルドリポジトリを生成することが必要です。
`Autotest`（自動テスト）は [自動ビルド](index.md) と同じページから設定することができます。
ただし自動ビルドが`Autotest`を利用するように設定する必要はありません。
自動ビルドはブランチ単位やタグ単位で有効化されるので、`Autotest`に関する有効化は無用です。
@z

@x
Only branches that are configured to use **Autobuild** push images to the
Docker repository, regardless of the Autotest settings.
@y
**Autobuild**（自動ビルド）を利用するように設定したブランチのみが、Docker リポジトリにイメージプッシュを行います。
これは自動テストの設定と関係はありません。
@z

@x
1. Log in to Docker Hub and select **Repositories** in the top navigation.
@y
1. Docker Hub にログインして、画面上段のナビゲーションから **Repositories** を選択します。
@z

@x
3. Select the repository you want to enable `Autotest` on.
@y
3. `Autotest`を有効にするリポジトリを選択します。
@z

@x
4. From the repository view, click the **Builds** tab.
@y
4. リポジトリ画面において **Builds**（ビルド）タブをクリックします。
@z

@x
4. Click **Configure automated builds**.
@y
4. **Configure automated builds**（自動ビルドの設定）をクリックします。
@z

@x
5. Configure the automated build settings as explained in [Automated Builds](index.md).
@y
5. [自動ビルド](index.md) において説明しているように、児童ビルドの設定を行います。
@z

@x
    At minimum you must configure:
@y
    最低でも以下の設定が必要です。
@z

@x
    * The source code repository
    * the build location
    * at least one build rule
@y
    * ソースコードリポジトリ
    * ビルド場所
    * 最低でも 1 つのビルドルール
@z

@x
8. Choose your **Autotest** option.
@y
8. **Autotest**（自動テスト）オプションを選びます。
@z

@x
    The following options are available:
@y
    以下のオプションが利用可能です。
@z

@x
    * `Off`: No additional test builds. Tests only run if they're configured
    as part of an automated build.
@y
    * `Off`: テストビルドは一切行わないことを指定します。
      自動ビルドの一部としてテスト実行が設定されたもののみがテストされます。
@z

@x
    * `Internal pull requests`: Run a test build for any pull requests
    to branches that match a build rule, but only when the pull request comes
    from the same source repository.
@y
    * `Internal pull requests`（内部プルリクエスト）: ビルドルールに合致するブランチへのプルリクエストすべてに対して、テストビルドを実行します。
      ただしそのプルリクエストが同一のソースリポジトリからきたものに限ります。
@z

@x
    * `Internal and external pull requests`: Run a test build for any
    pull requests to branches that match a build rule, including when the
    pull request originated in an external source repository.
@y
    * `Internal and external pull requests`（内部および外部プリリクエスト）: ビルドルールに合致するブランチへのプルリクエストすべてに対して、テストビルドを実行します。
      プルリクエストはソースリポジトリそのものから、そして外部からも受け付けます。
@z

@x
    > **Note**: For security purposes, autotest on _external pull requests_ is
    limited on public repositories. Private images are not pulled and
    environment variables defined in Docker Hub are not
    available. Automated builds continue to work as usual.
@y
    > **メモ**: セキュリティ観点から、**外部からのプルリクエスト** は公開リポジトリにおいては制限されます。
    > プライベートイメージはプルすることができません。
    > また Docker Hub において定義された環境変数は利用することができません。
    > 自動ビルドはそれまでどおり作動します。
@z

@x
9. Click **Save** to save the settings, or click **Save and build** to save and
run an initial test.
@y
9. **Save** をクリックして設定を保存します。
   または **Save and build** をクリックして、保存とともに初回のテストを実施します。
@z

@x
## Check your test results
@y
{: #check-your-test-results }
## テスト結果の確認
@z

@x
From the repository's details page, click **Timeline**.
@y
リポジトリの詳細ページにおいて **Timeline** をクリックします。
@z

@x
From this tab you can see any pending, in-progress, successful, and failed
builds and test runs for the repository.
@y
このタブではリポジトリにおいて、ビルドが中断しているもの、実行中のもの、成功したもの、失敗したものが確認できます。
そしてビルドをテストすることができます。
@z

@x
You can click any timeline entry to view the logs for each test run.
@y
タイムラインの各項目をクリックすれば、テスト実行時のログを参照することができます。
@z
