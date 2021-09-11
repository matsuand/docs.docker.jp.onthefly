%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Set up automated builds
keywords: automated, build, images, Docker Hub
redirect_from:
- /docker-hub/builds/automated-build/
- /docker-cloud/feature-reference/automated-build/
- /docker-cloud/builds/automated-build/
- /docker-cloud/builds/
- /docker-hub/builds/classic/
title: Set up Automated Builds
---
@y
---
description: 自動ビルドを設定します。
keywords: automated, build, images, Docker Hub
redirect_from:
- /docker-hub/builds/automated-build/
- /docker-cloud/feature-reference/automated-build/
- /docker-cloud/builds/automated-build/
- /docker-cloud/builds/
- /docker-hub/builds/classic/
title: 自動ビルドの設定
---
@z

@x
{% include upgrade-cta.html
  body="The Automated Builds feature is available for Docker Pro, Team, and Business users. Upgrade now to automatically build and push your images."
  header-text="This feature requires a Docker subscription"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_auto_builds"
%}
@y
{% include upgrade-cta.html
  body="自動ビルド機能は Pro、Team、Business ユーザーが利用可能です。既存のプランをアップデートして、最新のイメージビルドおよびプッシュの自動化を始めてください。"
  header-text="この機能を利用するには、有償の Docker サブスクリプションが必要です。"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_auto_builds"
%}
@z

@x
## How Automated Builds work
@y
{: #how-automated-builds-work }
## 自動ビルドはどのように動くか
@z

@x
Docker Hub can automatically build images from source code in an external
repository and automatically push the built image to your Docker
repositories.
@y
Docker Hub においては、外部リポジトリ内のソースコードから自動的にイメージをビルドして、出来上がったイメージをリポジトリに自動プッシュすることができます。
@z

@x
> **Note**
>
> If you are using automated builds for an open-source project, you can join our [Open Source Community](https://www.docker.com/community/open-source/application){: target="_blank" rel="noopener" class="_"} program to learn how Docker can support your project on Docker Hub.
@y
> **メモ**
>
> 自動ビルド機能をオープンソースプロジェクトに利用している場合は、私たちの [オープンソースコミュニティ](https://www.docker.com/community/open-source/application){: target="_blank" rel="noopener" class="_"} プログラムに参加していただき、Docker Hub 上にて Docker がどのようにプロジェクトをサポートするのかを学んでください。
@z

@x
When you set up automated builds (also called autobuilds), you create a list of
branches and tags that you want to build into Docker images. When you push code
to a source code branch (for example in GitHub) for one of those listed image
tags, the push uses a webhook to trigger a new build, which produces a Docker
image. The built image is then pushed to the Docker Hub registry.
@y
自動ビルド（automated builds または autobuilds）を設定する際には、Docker イメージとしてビルドしたいブランチとタグの一覧を生成します。
その一覧に示されたイメージタグに対してのソースコードブランチ（たとえば GitHub 上）にソースをプッシュすると、このプッシュによって新たなビルドを起動するウェブフックが用いられます。
これによって Docker イメージが作り出されます。
そしてビルドされたイメージは Docker Hub レジストリにプッシュされます。
@z

@x
> **Note**
>
> You can still use `docker push` to push pre-built images to
repositories with Automated Builds configured.
@y
> **メモ**
>
> 自動ビルドの設定が行われているリポジトリであっても`docker push`を使えば、それまでと変わらずにビルド済イメージをプッシュすることができます。
@z

@x
If you have automated tests configured, these run after building but before
pushing to the registry. You can use these tests to create a continuous
integration workflow where a build that fails its tests does not push the built
image. Automated tests do not push images to the registry on their own. [Learn more about automated image testing here.](automated-testing.md)
@y
自動テストを設定すれば、自動ビルドが行われた直後、そしてレジストリへのプッシュが行われる前に、そのテストが実行されます。
このようなテストを利用すれば CI ワークフローにおいて、テストに失敗したビルドイメージはプッシュを行わないといったことが可能になります。
自動テスト自体は、レジストリに対してイメージをプッシュするものではありません。
[イメージの自動テストに関する詳細はこちらを参照してください](automated-testing.md)。
@z

@x
Depending on your [plan](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"}, you may get concurrent builds, which means that `N`
autobuilds can be run at the same time. `N` is configured by the plan that you
subscribe to. Once `N+1` builds are running, any additional builds are
queued to be run later.
@y
購入している [プラン](https://www.docker.com/pricing){: target="_blank" rel="noopener" class="_"} によっては、同時ビルドを行うこともできます。
つまり`N`個の自動ビルドを同時に実行します。
`N`という数値は、購入しているプランにおいて設定します。
`N+1`個めのビルドが実行されると、これに続くビルドはキューに入り、後に実行されます。
@z

@x
> **Note**
>
> The total number of pending builds in the queue is limited to 30 and further requests will be discarded. The number of concurrent builds for Pro is 5 and for Team is 15.
@y
> **メモ**
>
> キューに待機されるビルドの総数は 30 個に制限されていて、それ以上のビルド要求は破棄されます。
> 同時ビルド数は Pro プランでは 5、Team プランでは 15 です。
@z

@x
![An automated build dashboard](images/index-dashboard.png)
@y
![自動ビルドダッシュボード](images/index-dashboard.png)
@z

@x
## Configure automated build settings
@y
{: #configure-automated-build-settings }
## 自動ビルドの設定
@z

@x
You can configure repositories in Docker Hub so that they automatically
build an image each time you push new code to your source provider. If you have
[automated tests](automated-testing.md) configured, the new image is only pushed
when the tests succeed.
@y
Docker Hub 上のリポジトリにおいては、ソースプロバイダーに対して新たなソースコードをプッシュした際に、イメージを自動的にビルドするように設定することができます。
[自動テスト](automated-testing.md) を設定している場合は、テストに成功したイメージのみがプッシュされます。
@z

@x
Builds can be added to existing repositories, or added when you create a repository.
@y
自動ビルドは既存のリポジトリに追加することができ、新規にリポジトリ生成を行った際に追加することもできます。
@z

@x
1. From the **Repositories** section, click into a repository to view its details.
@y
1. **Repositories** セクションからリポジトリの詳細画面を開きます。
@z

@x
2. Click the **Builds** tab.
@y
2. **Builds** タブをクリックします。
@z

@x
3. If you are setting up automated builds for the first time, select
the code repository service (GitHub or Bitbucket) where the image's source code is stored.
You might redirected to the settings page to [link](link-source.md) the code repository service.
@y
3. 自動ビルドの設定を初めて行う場合は、イメージのソースコードを保存しているコードリポジトリサービス（GitHub または Bitbucket）を選択します。
   これを行うと、コードリポジトリサービスに [リンク](link-source.md) するための設定画面にリダイレクトされます。
@z

@x
    Otherwise, if you are editing the build settings for an existing automated
    build, click **Configure automated builds**.
@y
    別の方法として、既存の自動ビルドに対するビルド設定を行っている場合は、**Configure automated builds**（自動ビルドの設定）をクリックします。
@z

@x
4. Select the **source repository** to build the Docker images from.
@y
4. Docker イメージを作り出す **source repository**（ソースリポジトリ）を選択します。
@z

@x
    You might need to specify an organization or user (the _namespace_) from the
    source code provider. Once you select a namespace, its source code
    repositories appear in the **Select repository** dropdown list.
@y
    ソースコードプロバイダーにおいては、組織やユーザー（その **名前空間**）の指定が必要になるときもあります。
    名前空間を選択しておけば、そのソースコードリポジトリが **Select repository** のドロップダウンリストに表示されるようになります。
@z

@x
5.  Optionally, enable [autotests](automated-testing.md#enable-automated-tests-on-a-repository).
@y
5.  任意の作業として [autotests](automated-testing.md#enable-automated-tests-on-a-repository)（自動テスト）を有効にします。
@z

@x
6.  Review the default **Build Rules**, and optionally click the
**plus sign** to add and configure more build rules.
@y
6.  デフォルトの **Build Rules**（ビルドルール）を確認し、必要に応じて **プラス記号** をクリックして追加のビルドルールを設定します。
@z

@x
    _Build rules_ control what Docker Hub builds into images from the contents
    of the source code repository, and how the resulting images are tagged
    within the Docker repository.
@y
    **ビルドルール** とは、ソースコードリポジトリの内容に基づいて Docker Hub が何をイメージとしてビルドするのか、またビルドしたイメージを Docker リポジトリ内にてどのようにタグづけを行うかを制御します。
@z

@x
    A default build rule is set up for you, which you can edit or delete. This
    default set builds from the `Branch` in your source code repository called
    `master`, and creates a Docker image tagged with `latest`.
@y
    デフォルトのビルドルールがすでに準備されています。
    このルールは編集したり削除したりすることができます。
    デフォルトのルールでは、ソースコードリポジトリ内の`master`ブランチからビルドを行うものとして設定されています。
    そして生成する Docker イメージには`latest`というタグをつけます。
@z

@x
7.  For each branch or tag, enable or disable the **Autobuild** toggle.
@y
7.  各ブランチやタグに対して **Autobuild** トグルを使って、自動ビルドの有効、無効を設定します。
@z

@x
    Only branches or tags with autobuild enabled are built, tested, *and* have
    the resulting image pushed to the repository. Branches with autobuild
    disabled are built for test purposes (if enabled at the repository
    level), but the built Docker image is not pushed to the repository.
@y
    自動ビルドが有効として設定されたブランチやタグだけがビルド、テストされ、**さらに** そこから生成されたイメージだけがリポジトリにプッシュされます。
    自動ビルドを無効に設定したブランチは（リポジトリレベルで有効になっている場合）テスト目的でビルドされますが、ビルドされた Docker イメージはリポジトリにプッシュされません。
@z

@x
8. For each branch or tag, enable or disable the **Build Caching** toggle.
@y
8. 各ブランチやタグに対して **Build Caching** トグルを使って、ビルドキャッシュの有効、無効を設定します。
@z

@x
    [Build caching](../../develop/develop-images/dockerfile_best-practices.md#leverage-build-cache) can save time if you are building a large image frequently or have
    many dependencies. You might want to leave build caching disabled to
    make sure all of your dependencies are resolved at build time, or if
    you have a large layer that is quicker to build locally.
@y
    [ビルドキャッシュ](../../develop/develop-images/dockerfile_best-practices.md#leverage-build-cache) は、大きなイメージを頻繁に生成したり、多くの依存パッケージを有するイメージを生成したりする際に、ビルド時間の短縮に役立ちます。
    ビルド時に依存関係をすべて解決したい場合や、ローカルでビルドする方が早いくらいの大規模レイヤーがある場合などでは、ビルドキャッシュを無効にしておきたい場合があるかもしれません。
@z

@x
9. Click **Save** to save the settings, or click **Save and build** to save and
run an initial test.
@y
9. **Save** をクリックして設定を保存します。
   または **Save and build** をクリックして、保存とともに初回のテストを実施します。
@z

@x
    A webhook is automatically added to your source code repository to notify
    Docker Hub on every push. Only pushes to branches that are listed as the
    source for one or more tags trigger a build.
@y
    ソースコードリポジトリにはウェブフックが自動的に追加されます。
    これによって Docker Hub 上へのプッシュがすべて通知されるようになります。
    1 つまたは複数のタグに対するソースとして一覧にあげられているブランチに対してのみ、プッシュからビルドが起動されます。
@z

@x
### Set up build rules
@y
{: #set-up-build-rules }
### ビルドルールの設定
@z

@x
By default when you set up automated builds, a basic build rule is created for you.
This default rule watches for changes to the `master` branch in your source code
repository, and builds the `master` branch into a Docker image tagged with
`latest`.
@y
自動ビルドを設定すると、デフォルトで基本的なビルドルールが生成されます。
このデフォルトルールは、ソースコードリポジトリ内の`master`ブランチへの変更を監視するものです。 そして`master`ブランチのソースをビルドして Docker イメージに`latest`というタグづけを行います。
@z

@x
In the **Build Rules** section, enter one or more sources to build.
@y
**Build Rules**（ビルドルール）のセクションにおいて、ビルドするソースを必要な分だけ入力します。
@z

@x
For each source:
@y
各ソースに対して以下を行います。
@z

@x
* Select the **Source type** to build either a **tag** or a
    **branch**. This tells the build system what to look for in the source code
    repository.
@y
* **Source type**（ソースタイプ）として **tag**（タグ）または **branch**（ブランチ）のいずれをビルドするかを選びます。
  ビルドシステムがソースコードリポジトリ内のどちらを見にいくかを指示するものです。
@z

@x
* Enter the name of the **Source** branch or tag you want to build.
@y
* ビルドを行う **Source**（ソース）ブランチまたはタグの名前を入力します。
@z

@x
  The first time you configure automated builds, a default build rule is set up
  for you. This default set builds from the `Branch` in your source code called
  `master`, and creates a Docker image tagged with `latest`.
@y
  自動ビルドの設定を初めて行う場合は、デフォルトのビルドルールが設定されます。
  このデフォルトルールは、ソースコード内の`master`ブランチからビルドを行うものとしています。
  そして生成される Docker イメージに`latest`というタグをつけます。
@z

@x
  You can also use a regex to select which source branches or tags to build.
  To learn more, see
  [regexes](index.md#regexes-and-automated-builds).
@y
  ビルド対象とするソースのブランチやタグの指定において、正規表現を用いることもできます。
  詳しくは [正規表現](index.md#regexes-and-automated-builds) を参照してください。
@z

@x
* Enter the tag to apply to Docker images built from this source.
@y
* そのソースからビルドされる Docker イメージにおいて、適用するタグ名を入力します。
@z

@x
  If you configured a regex to select the source, you can reference the
  capture groups and use its result as part of the tag. To learn more, see
  [regexes](index.md#regexes-and-automated-builds).
@y
  ソース指定にあたって正規表現を用いた場合、マッチしたグループを用いて、タグ名の一部分に利用することができます。
  詳しくは [正規表現](index.md#regexes-and-automated-builds) を参照してください。
@z

@x
* Specify the **Dockerfile location** as a path relative to the root of the source code repository. (If the Dockerfile is at the repository root, leave this path set to `/`.)
@y
* **Dockerfile location**（Dockerfile の場所）として、ソースコードリポジトリのルートからの相対パスを指定します。
  （Dockerfile がリポジトリのルートにあるのであれば、このパス設定は`/`のままとしてください。）
@z

@x
> **Note**
>
> When Docker Hub pulls a branch from a source code repository, it performs a shallow clone (only the tip of the specified branch).  Refer to [Advanced options for Autobuild and Autotest](advanced.md) for more information.
@y
> **メモ**
>
> Docker Hub がソースコードリポジトリからブランチをプルする際には、shallow クローン（指定ブランチの最新履歴のみのクローン）を行います。
> 詳しくは [自動ビルドや自動テストに対する高度なオプション](advanced.md) を参照してください。
@z

@x
### Environment variables for builds
@y
{: #environment-variables-for-builds }
### ビルドにおける環境変数
@z

@x
You can set the values for environment variables used in your build processes
when you configure an automated build. Add your build environment variables by
clicking the plus sign next to the **Build environment variables** section, and
then entering a variable name and the value.
@y
自動ビルドの設定の際には、環境変数の値をビルド時に利用するように設定できます。
ビルド時の環境変数は **Build environment variables** セクションの横にあるプラス記号をクリックして追加します。
そして変数名と値を入力します。
@z

@x
When you set variable values from the Docker Hub UI, they can be used by the
commands you set in `hooks` files, but they are stored so that only users who
have `admin` access to the Docker Hub repository can see their values. This
means you can use them to safely store access tokens or other information that
should remain secret.
@y
Docker Hub の UI 画面から変数値を設定すると、`hooks`ファイル内に設定したコマンドからこれを利用することができます。
ただしこの情報は保存されるため、Docker Hub リポジトリに対する`admin`権限を有するユーザーしか、その値を参照することはできません。
つまりこれを利用すれば、アクセストークンや機密にしておきたい各種情報を安全に保存しておくことができることになります。
@z

@x
> **Note**: The variables set on the build configuration screen are used during
the build processes _only_ and should not be confused with the environment
values used by your service (for example to create service links).
@y
> **メモ**
>
> ビルド設定画面上から設定した変数は、ビルド処理において **のみ** 利用されます。
> したがってサービスにおいて利用している環境変数（たとえばサービスリンクの生成時に利用するもの）とは混同しないようにしてください。
@z

@x
## Check your active builds
@y
{: #check-your-active-builds }
## アクティブなビルドの確認
@z

@x
A summary of a repository's builds appears both on the repository **General**
tab, and in the **Builds** tab. The **Builds** tab also displays a color coded
bar chart of the build queue times and durations. Both views display the
pending, in progress, successful, and failed builds for any tag of the
repository.
@y
リポジトリにおけるビルド概要は、リポジトリの **General**（一般）タブおよび **Builds**（ビルド）タブにおいて見ることができます。
また **Builds** タブでは、色づけされたバーチャートによってビルドのキュー時間や間隔を見ることもできます。
いずれの画面においてもリポジトリの各タブごとに、ビルドが中断しているもの、実行中のもの、成功したもの、失敗したものが確認できます。
@z

@x
![Active Builds](images/index-active.png)
@y
![アクティブなビルド](images/index-active.png)
@z

@x
From either location, you can click a build job to view its build report. The
build report shows information about the build job including the source
repository and branch (or tag), the build duration, creation time and location,
and the user namespace the build occurred in.
@y
いずれの画面からでもビルドジョブをクリックすれば、ビルド結果を見ることができます。
ビルド結果にはビルドジョブに関する情報として、ソースリポジトリとブランチ（あるいはタグ）、ビルド時間、生成時刻、生成場所、ビルド処理を行ったユーザー名前空間が示されます。
@z

@x
![Build Report](images/index-report.png)
@y
![ビルド報告](images/index-report.png)
@z

@x
## Cancel or retry a build
@y
{: #cancel-or-retry-a-build }
## ビルドのキャンセルまたは再実行
@z

@x
While a build is queued or running, a **Cancel** icon appears next to its build
report link on the General tab and on the Builds tab. You can also click the
**Cancel** button from the build report page, or from the Timeline tab's logs
display for the build.
@y
ビルド要求がキューに入っている、あるいは実行されている場合に、General タブや Builds タブにおけるビルド報告リンクの横には **Cancel** アイコンが表示されます。
ビルド結果のページから、あるいは Timeline タブのログ表示から **Cancel** ボタンをクリックすることもできます。
@z

@x
![list of builds showing the cancel icon](images/build-cancelicon.png)
@y
![キャンセルアイコンが表示されているビルドの一覧](images/build-cancelicon.png)
@z

@x
If a build fails, a **Retry** icon appears next to the build report line on the
General and Builds tabs, and the build report page and Timeline logs also
display a **Retry** button.
@y
ビルドが失敗した場合、General タブあるいは Builds タブのビルド報告の行の横に **Retry**（再実行）アイコンが表示されます。
またビルド報告のページや Timeline ログにおいても **Retry** ボタンが表示されます。
@z

@x
![Timeline view showing the retry build button](images/retry-build.png)
@y
![Retry ボタンが表示されている Timeline 画面](images/retry-build.png)
@z

@x
> **Note**
>
> If you are viewing the build details for a repository that belongs
to an Organization, the Cancel and Retry buttons only appear if you have `Read & Write` access to the repository.
@y
> **メモ**
>
> ビルド詳細を確認しているリポジトリが組織に属したものである場合、Cancel ボタンや Retry ボタンは、そのリポジトリに対して`Read & Write`（読み書き）の権限がある場合にのみ表示されます。
@z

@x
## Disable an automated build
@y
{: #disable-an-automated-build }
## 自動ビルドの無効化
@z

@x
Automated builds are enabled per branch or tag, and can be disabled and
re-enabled easily. You might do this when you want to only build manually for
a while, for example when you are doing major refactoring in your code. Disabling
autobuilds does not disable [autotests](automated-testing.md).
@y
自動ビルドはブランチごと、タグごとに有効化されます。
無効化したり再び有効化することは簡単です。
たとえばコードに対して大々的にリファクタリングを行うような場合に、ビルドを手動で行う必要があり、そういった場合に無効化を行いたくなります。
@z

@x
To disable an automated build:
@y
自動ビルドを無効化するには以下を行います。
@z

@x
1. From the **Repositories** page, click into a repository, and click the **Builds** tab.
@y
1. **Repositories** ページにおいて、1 つのリポジトリをクリックして **Builds** タブを選びます。
@z

@x
2. Click **Configure automated builds** to edit the repository's build settings.
@y
2. リポジトリのビルド設定を編集するために **Configure automated builds**（自動ビルドの設定）をクリックします。
@z

@x
3. In the **Build Rules** section, locate the branch or tag you no longer want
to automatically build.
@y
3. **Build Rules**（ビルドルール）セクションにおいて、自動ビルドを無効にしたいブランチまたはタグを選択します。
@z

@x
4. Click the **autobuild** toggle next to the configuration line.
@y
4. 設定行の横にある **autobuild**（自動ビルド）トグルをクリックします。
@z

@x
    The toggle turns gray when disabled.
@y
    無効を指定するとトグルボタンは灰色に変わります。
@z

@x
5. Click **Save** to save your changes.
@y
5. **Save**（保存）をクリックして変更を保存します。
@z

@x
## Advanced automated build options
@y
{: #advanced-automated-build-options }
## 高度な自動ビルドオプション
@z

@x
At the minimum you need a build rule composed of a source branch (or tag) and
destination Docker tag to set up an automated build. You can also change where
the build looks for the Dockerfile, set a path to the files the build use
(the build context), set up multiple static tags or branches to build from, and
use regular expressions (regexes) to dynamically select source code to build and
create dynamic tags.
@y
自動ビルドを設定するにはビルドルールにおいて、最低でもソースブランチ（またはタグ）と目的の Docker タグの指定が必要です。
これ以外に指定可能な内容として、ビルドを行う Dockerfile の場所、ビルドに利用するファイルへのパス（ビルドコンテキスト）設定、複数ブランチやタグの指定、正規表現（regex）利用によるソースコードの動的指定やタグの動的生成などがあります。
@z

@x
All of these options are available from the **Build configuration** screen for
each repository. Click **Repositories** from the left navigation, click the name
of the repository you want to edit, click the **Builds** tab, and click
**Configure Automated builds**.
@y
このオプションは、各リポジトリにおける **Build configuration**（ビルド設定）画面から利用することができます。
左側のナビゲーションから **Repositories** をクリックし、編集対象とするリポジトリをクリックします。
そして **Builds** タブを選んで、**Configure Automated builds**（自動ビルドの設定）をクリックします。
@z

@x
### Tag and Branch builds
@y
{: #tag-and-branch-builds }
### タグビルドやブランチビルド
@z

@x
You can configure your automated builds so that pushes to specific branches or tags triggers a build.
@y
自動ビルドの設定においては、特定のブランチまたはタグへのプッシュからビルドが実行されるように設定することができます。
@z

@x
1. In the **Build Rules** section, click the plus sign to add more sources to build.
@y
1. **Build Rules**（ビルドルール）セクションにおいてプラス記号をクリックして、ビルド対象のソースを追加します。
@z

@x
2.  Select the **Source type** to build: either a **tag** or a **branch**.
@y
2.  ビルド対象とする **Source type**（ソースタイプ）を選択します。
    **tag**（タグ）または **branch**（ブランチ）のいずれかです。
@z

@x
    This tells the build system what type of source to look for in the code
    repository.
@y
    これはビルドシステムがソースコードリポジトリ内のどちらを見にいくかを指示するものです。
@z

@x
3. Enter the name of the **Source** branch or tag you want to build.
@y
3. ビルドを行う **Source**（ソース）ブランチまたはタグの名前を入力します。
@z

@x
    You can enter a name, or use a regex to match which source branch or tag
    names to build. To learn more, see
    [regexes](index.md#regexes-and-automated-builds).
@y
    名前をそのまま入力します。
    あるいは正規表現を用いて、ビルド対象とするソースブランチまたはタグを表現することもできます。
    詳しくは [正規表現](index.md#regexes-and-automated-builds) を参照してください。
@z

@x
4. Enter the tag to apply to Docker images built from this source.
@y
4. そのソースからビルドされる Docker イメージにおいて、適用するタグ名を入力します。
@z

@x
    If you configured a regex to select the source, you can reference the
    capture groups and use its result as part of the tag. To learn more, see
    [regexes](index.md#regexes-and-automated-builds).
@y
    ソース指定にあたって正規表現を用いた場合、マッチしたグループを用いて、タグ名の一部分に利用することができます。
    詳しくは [正規表現](index.md#regexes-and-automated-builds) を参照してください。
@z

@x
5. Repeat steps 2 through 4 for each new build rule you set up.
@y
5. 新たに設定するビルドに対して、上の手順 2 から 4 を繰り返します。
@z

@x
### Set the build context and Dockerfile location
@y
{: #set-the-build-context-and-dockerfile-location }
### ビルドコンテキストと Dockerfile の場所指定
@z

@x
Depending on how the files are arranged in your source code repository, the
files required to build your images may not be at the repository root. If that's
the case, you can specify a path where the build looks for the files.
@y
ソースコードリポジトリ内でのファイル構成がさまざまであるため、イメージビルドに必要なファイルがリポジトリのルートに存在していないこともあります。
そのような場合は、ビルド処理において対象ファイルを探しにいくパスを指定します。
@z

@x
The _build context_ is the path to the files needed for the build, relative to the root of the repository. Enter the path to these files in the **Build context** field. Enter `/` to set the build context as the root of the source code repository.
@y
**ビルドコンテキスト** は、ビルドに必要となるファイルへのパスのことであり、リポジトリのルートからの相対パスとして表わされます。
そのようなファイルパスを **Build context**（ビルドコンテキスト）欄に入力します。
ビルドコンテキストとしてソースコードリポジトリのルートを設定する場合には`/`を入力します。
@z

@x
> **Note**
>
> If you delete the default path `/` from the **Build context** field and leave it blank, the build system uses the path to the Dockerfile as the build context. However, to avoid confusion we recommend that you specify the complete path.
@y
> **メモ**
>
> **Build context** 欄のデフォルトパス`/`を削除して、そのまま空欄にすると、ビルド処理では Dockerfile へのパスをビルドコンテキストとして用います。
ただし混乱を避けるため、完全なパス指定を行うことをお勧めします。
@z

@x
You can specify the **Dockerfile location** as a path relative to the build
context. If the Dockerfile is at the root of the build context path, leave the
Dockerfile path set to `/`. (If the build context field is blank, set the path
to the Dockerfile from the root of the source repository.)
@y
**Dockerfile location**（Dockerfile の場所）では、ビルドコンテキストへの相対パスを指定します。
Dockerfile がビルドコンテキストパスのルートに存在する場合は、Dockerfile のパスは`/`のままとします。
（ビルドコンテキストが空欄であった場合 Dockerfile は、ソースリポジトリのルートからのパスを指定してください。）
@z

@x
### Regexes and automated builds
@y
{: #regexes-and-automated-builds }
### 正規表現と自動ビルド
@z

@x
You can specify a regular expression (regex) so that only matching branches or
tags are built. You can also use the results of the regex to create the Docker
tag that is applied to the built image.
@y
ビルド指定においては正規表現（regex）を用いて、合致したブランチまたはタグのみをビルドすることができます。
また正規表現で得られた結果を使って、ビルドイメージに適用される Docker タグを生成することもできます。
@z

@x
You can use up to nine regular expression capture groups
(expressions enclosed in parentheses) to select a source to build, and reference
these in the **Docker Tag** field using `{\1}` through `{\9}`.
@y
ビルドソースを指定する際の正規表現において、グループ指定（カッコでくくった表現）は 9 個まで利用することができます。
そのグループに対する参照方法は、**Docker Tag**（Docker タグ）欄において`{\1}`から`{\9}`を使って行います。
@z

@x
<!-- Capture groups Not a priority
#### Regex example: build from version number branch and tag with version number

You could also use capture groups to build and label images that come from various sources. For example, you might have

`/(alice|bob)-v([0-9.]+)/` -->
@y
<!-- Capture groups Not a priority
#### Regex example: build from version number branch and tag with version number

You could also use capture groups to build and label images that come from various sources. For example, you might have

`/(alice|bob)-v([0-9.]+)/` -->
@z

@x
### Build images with BuildKit
@y
{: #build-images-with-buildKit }
### BuildKit を用いたイメージビルド
@z

@x
You can enable the BuildKit builder by setting the `DOCKER_BUILDKIT=1`
[environment variable](#environment-variables-for-builds) in the
[Configure automated build settings](#configure-automated-build-settings) section.
Refer to the [build images with BuildKit](../../develop/develop-images/build_enhancements.md)
page for more information on BuildKit.
@y
[自動ビルドの設定](#configure-automated-build-settings) における [環境変数](#environment-variables-for-builds) の設定に従って`DOCKER_BUILDKIT=1`を設定すれば、BuildKit ビルダーを有効にすることができます。
BuildKit に関する詳細は [BuildKit を使ったイメージビルド](../../develop/develop-images/build_enhancements.md) を参照してください。
@z

@x
> **Note**
>
> Autobuilds use the buildKit build-system by default. If you want to use the legacy Docker build-system, add the [environment variable](index.md#environment-variables-for-builds){: target="_blank" rel="noopener" class="_"} DOCKER_BUILDKIT=0.
@y
> **メモ**
>
> 自動ビルドは、デフォルトで buildKit によるビルドシステムを用います。
> ビルドシステムとして従来の Docker を用いたい場合は、[環境変数](index.md#environment-variables-for-builds){: target="_blank" rel="noopener" class="_"} DOCKER_BUILDKIT=0 を追加してください。
@z

@x
## Build repositories with linked private submodules
@y
## プライベートサブモジュールをリンクしているリポジトリのビルド
@z

@x
Docker Hub sets up a deploy key in your source code repository that allows it
to clone the repository and build it; however this key only works for a single,
specific code repository. If your source code repository uses private Git
submodules (or requires that you clone other private repositories to build),
Docker Hub cannot access these additional repos, your build cannot complete,
and an error is logged in your build timeline.
@y
Docker Hub ではデプロイ鍵をソースコードリポジトリ内において設定することが可能であり、リポジトリのクローンやそのビルドを可能にしています。
ただしこの鍵は、単一の特定コードリポジトリに対してしか動作しません。
ソースコードリポジトリにおいてプライベート Git サブモジュールを利用している場合（あるいはビルドにあたっては別のプライベートリポジトリをクローンする必要がある場合）、Docker Hub はそのような追加のリポジトリにアクセスすることができません。
そのためビルドが成功せず、ビルドタイムラインにエラーログが出力されます。
@z

@x
To work around this, you can set up your automated build using the `SSH_PRIVATE` environment variable to override the deployment key and grant Docker Hub's build system access to the repositories.
@y
これを回避するには、自動ビルドにおいて環境変数`SSH_PRIVATE`を利用します。
これによってデプロイ鍵をオーバーライドして Docker Hub によるビルド処理が他のリポジトリにアクセスできるようにします。
@z

@x
> **Note**
>
> If you are using autobuild for teams, use [the process below](index.md#service-users-for-team-autobuilds) instead, and configure a service user for your source code provider. You can also do this for an individual account to limit Docker Hub's access to your source repositories.
@y
> **メモ**
>
> 自動ビルドをチーム内で利用している場合は、代わりに [以下の手順](index.md#service-users-for-team-autobuilds) に従って、ソースコードプロバイダーに対するサービスユーザーを設定してください。
> これは個々のアカウントに対して Docker Hub からソースリポジトリに対するアクセスを制限することでも実現することができます。
@z

@x
1. Generate a SSH keypair that you use for builds only, and add the public key to your source code provider account.
@y
1. ビルド目的でのみ利用する SSH 鍵ペアを生成します。
   そしてその公開鍵をソースコードプロバイダーのアカウントに追加します。
@z

@x
    This step is optional, but allows you to revoke the build-only keypair without removing other access.
@y
    この手順は任意です。
    ただしこれを行っておけば、ビルド専用の鍵を削除しても、別のアクセスまで削除する必要がなくなります。
@z

@x
2. Copy the private half of the keypair to your clipboard.
3. In Docker Hub, navigate to the build page for the repository that has linked private submodules. (If necessary, follow the steps [here](index.md#configure-automated-build-settings) to configure the automated build.)
4. At the bottom of the screen, click the plus sign ( **+** ) next to **Build Environment variables**.
5. Enter `SSH_PRIVATE` as the name for the new environment variable.
6. Paste the private half of the keypair into the **Value** field.
7. Click **Save**, or **Save and Build** to validate that the build now completes.
@y
2. プライベート鍵をクリップボードにコピーします。
3. Docker Hub において、プライベートサブモジュールへのリンクを持つリポジトリのビルドページにアクセスします。
   （必要であれば [ここ](index.md#configure-automated-build-settings) に示す手順に従って自動ビルドの設定を行います。）
4. 画面下段にある **Build Environment variables**（環境変数のビルド）の横のプラス記号（**+**）をクリックします。
5. 新たな環境変数の名前として`SSH_PRIVATE`を入力します。
6. プライベート鍵を **Value**（値）欄に貼り付けます。
7. **Save** をクリックします。
   または **Save and build** をクリックして、ビルドが成功することを確認します。
@z

@x
> **Note**
>
> You must configure your private git submodules using git clone over SSH (`git@submodule.tld:some-submodule.git`) rather than HTTPS.
@y
> **メモ**
>
> git clone を使ってプライベートサブモジュールを設定する際には、HTTPS 経由ではなく SSH 経由（`git@submodule.tld:some-submodule.git`）としなければなりません。
@z

@x
## Autobuild for Teams
@y
{: #autobuild-for-teams }
## チーム向けの自動ビルド
@z

@x
When you create an automated build repository in your own account namespace, you can start, cancel, and retry builds, and edit and delete your own repositories.
@y
自分のアカウント名前空間内において自動ビルドリポジトリを生成すれば、そのリポジトリ内での自動ビルドの起動、キャンセル、再ビルド、編集、削除は思いのままです。
@z

@x
These same actions are also available for team repositories from Docker Hub if
you are a member of the Organization's `Owners` team. If you are a member of a
team with `write` permissions you can start, cancel, and retry builds in your
team's repositories, but you cannot edit the team repository settings or delete
the team repositories. If your user account has `read` permission, or if you're
a member of a team with `read` permission, you can view the build configuration
including any testing settings.
@y
Docker Hub のチームリポジトリに対しての同じ操作は、組織の`Owners`（所有者）チームのメンバーであれば可能になります。
`write`（書き込み）権限を持つチームメンバーであれば、チームリポジトリにおいてビルドの起動、キャンセル、再ビルドが可能になります。
しかしチームリポジトリ設定を書き換えたり、チームリポジトリそのものを削除したりすることはできません。
`read`（読み込み）権限を持つユーザーアカウントである、あるいは`read`権限を持つチームメンバーである場合は、ビルド設定やテスト設定の内容を参照することができます。
@z

@x
| Action/Permission     | read | write | admin | owner |
| --------------------- | ---- | ----- | ----- | ----- |
| view build details    |  x   |   x   |   x   |   x   |
| start, cancel, retry  |      |   x   |   x   |   x   |
| edit build settings   |      |       |   x   |   x   |
| delete build          |      |       |       |   x   |
@y
| 操作/パーミッション    | 読み | 書き  | 管理者 | 所有者 |
| ---------------------- | ---- | ----- | ------ | ------ |
| ビルド結果の参照       |  x   |   x   |   x    |   x    |
| 起動,キャンセル,再起動 |      |   x   |   x    |   x    |
| ビルド設定の編集       |      |       |   x    |   x    |
| ビルドの削除           |      |       |        |   x    |
@z

@x
### Service users for team autobuilds
@y
{: #service-users-for-team-autobuilds }
### チーム自動ビルドに対するサービスユーザー
@z

@x
> **Note**: Only members of the `Owners` team can set up automated builds for teams.
@y
> **メモ**
>
> チームに対する自動ビルドの設定は、`Owners`（所有者）チームのメンバーのみが行うことができます。
@z

@x
When you set up automated builds for teams, you grant Docker Hub access to
your source code repositories using OAuth tied to a specific user account. This
means that Docker Hub has access to everything that the linked source provider
account can access.
@y
チームに対して自動ビルドの設定を行う際には、Docker Hub からソースコードリポジトリへのアクセスを許可するために、特定のユーザーアカウントに紐づいた OAuth を利用します。
これによって Docker Hub からは、リンクされたソースプロバイダーのアカウントがアクセス可能なものすべてにアクセスできるようになります。
@z

@x
For organizations and teams, we recommend creating a dedicated service account
(or "machine user") to grant access to the source provider. This ensures that no
builds break as individual users' access permissions change, and that an
individual user's personal projects are not exposed to an entire organization.
@y
組織やチームにおいては、ソースプロバイダーへのアクセスを許可するために、専用のサービスアカウント（言い換えると「マシンユーザー」）を生成することをお勧めします。
これを行っておけば、個別ユーザーのアクセス権限が変更されても、ビルドが失敗することがなくなります。
しかもそのユーザーの個人的なプロジェクトは、組織全体に公開せずに済みます。
@z

@x
This service account should have access to any repositories to be built,
and must have administrative access to the source code repositories so it can
manage deploy keys. If needed, you can limit this account to only a specific
set of repositories required for a specific build.
@y
このサービスアカウントは、ビルドするリポジトリすべてに対してアクセス可能でなければなりません。
そしてソースコードリポジトリに対して管理権限を有していて、そのデプロイ鍵を管理できることが必要です。
必要であればこのアカウントの権限を制限して、特定のビルドに対して必要となる特定のリポジトリのみにアクセスするようにすることもできます。
@z

@x
If you are building repositories with linked private submodules (private
dependencies), you also need to add an override `SSH_PRIVATE` environment
variable to automated builds associated with the account.
@y
プライベートサブモジュール（プライベート依存パッケージ）にリンクされたリポジトリをビルドしている際には、環境変数`SSH_PRIVATE`をオーバーライドして、そのアカウントに関連づいた自動ビルドを行う必要があります。
@z

@x
1. Create a service user account on your source provider, and generate SSH keys for it.
2. Create a "build" team in your organization.
3. Ensure that the new "build" team has access to each repository and submodule you need to build.
@y
1. ソースプロバイダー上においてサービスユーザーを生成します。
   そしてこれに対する SSH 鍵を生成します。
2. 組織内に「ビルド」チームを生成します。
3. ビルド対象とするリポジトリやサブモジュールに対して、この新たな「ビルド」チームがアクセスできるようにします。
@z

@x
    Go to the repository's **Settings** page. On GitHub, add the new "build" team to the list of **Collaborators and Teams**. On Bitbucket, add the "build" team to the list of approved users on the **Access management** screen.
@y
    リポジトリの **Settings**（設定）ページにアクセスします。
    GitHub では **Collaborators and Teams**（協力者とチーム）の一覧に新たな「ビルド」チームを追加します。
    Bitbucket では **Access management**（アクセス管理）画面において、承認ｓれたユーザーの一覧に「ビルド」チームを追加します。
@z

@x
4. Add the service user to the "build" team on the source provider.
@y
4. ソースプロバイダーの「ビルド」チームに対してサービスユーザーを追加します。
@z

@x
5. Log in to Docker Hub as a member of the `Owners` team, switch to the organization, and follow the instructions to [link to source code repository](link-source.md) using the service account.
@y
5. Docker Hub に対して`Owners`（所有者）チームのメンバーとしてログインします。
   そして組織に切り替えて、サービスアカウントを使った [ソースコードリポジトリへのリンク](link-source.md) の手順を行います。
@z

@x
    > **Note**: You may need to log out of your individual account on the source code provider to create the link to the service account.
@y
    > **メモ**
    >
    > サービスアカウントへのリンクを生成するためには、ソースコードプロバイダー上の個人アカウントからログアウトすることが必要かもしれません。
@z

@x
6. Optionally, use the SSH keys you generated to set up any builds with private submodules, using the service account and [the instructions above](index.md#build-repositories-with-linked-private-submodules).
@y
6. 任意の作業として、生成した SSH 鍵を使ってプライベートサブモジュールを利用するビルドの設定を行います。
   その際にはサービスアカウントを用いて [上の手順](index.md#build-repositories-with-linked-private-submodules) に従います。
@z

@x
## What's Next?
@y
{: #whats-next }
## 次に読むものは
@z

@x
### Customize your build process
@y
{: #customize-your-build-process }
### ビルド処理のカスタマイズ
@z

@x
Additional advanced options are available for customizing your automated builds,
including utility environment variables, hooks, and build phase overrides. To
learn more see [Advanced options for Autobuild and Autotest](advanced.md).
@y
自動ビルドをカスタマイズするために、高度なオプションも用意されています。
たとえばユーティリティー環境変数、フック、ビルド時のオーバーライドなどです。
詳しくは [自動ビルドおよび自動テストのための高度なオプション](advanced.md) を参照してください。
@z

@x
### Add automated tests
@y
{: #add-automated-tests }
### 自動テストの追加
@z

@x
To test your code before the image is pushed, you can use
Docker Hub's [Autotest](automated-testing.md) feature which
integrates seamlessly with autobuild and autoredeploy.
@y
イメージがプッシュされるまえにコードのテストを行うには、Docker Hub の [自動テスト](automated-testing.md) 機能を利用します。
これは自動ビルドや自動デプロイとシームレスに連携しています。
@z

@x
> **Note**
>
> While the Autotest feature builds an image for testing purposes, it
does not push the resulting image to Docker Hub.
@y
> **メモ**
>
> 自動テストからビルドされるイメージはテスト目的に限られます。
> したがってビルドされたイメージは Docker Hub にはプッシュされません。
@z
